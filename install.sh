#!/bin/bash

# 命令收藏夹 v1.0.0
# 作者: Joey
# GitHub: https://github.com/cmdbox/cmdbox
# 博客: https://joeyblog.net
# Telegram: https://t.me/+ft-zI76oovgwNmRh

CONFIG_DIR="$HOME/.cmdbox"
CONFIG_FILE="$CONFIG_DIR/config"
COMMANDS_FILE="$CONFIG_DIR/commands.json"
TEMP_FILE="$CONFIG_DIR/temp.json"

# 颜色
RED='\033[38;5;196m'
GREEN='\033[38;5;46m'
YELLOW='\033[38;5;226m'
BLUE='\033[38;5;33m'
PURPLE='\033[38;5;129m'
CYAN='\033[38;5;51m'
ORANGE='\033[38;5;208m'
PINK='\033[38;5;205m'
BOLD='\033[1m'
DIM='\033[2m'
UNDERLINE='\033[4m'
RESET='\033[0m'

# 图标
ROCKET='🚀'
GEAR='⚙️'
CLOUD='☁️'
LOCAL='💾'
SUCCESS='✅'
ERROR='❌'
WARNING='⚠️'
STAR='⭐'
LIGHTNING='⚡'
FIRE='🔥'
HEART='💖'

# 框线
BOX_H='━'
BOX_V='┃'
BOX_TL='┏'
BOX_TR='┓'
BOX_BL='┗'
BOX_BR='┛'

print_header() {
    clear
    echo -e "${CYAN}${BOX_TL}$(printf "%*s" 78 | tr ' ' "${BOX_H}")${BOX_TR}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}                                                                              ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}  ${BOLD}${BLUE}██████╗ ███╗   ███╗██████╗     ██████╗  ██████╗ ██╗  ██╗${RESET}      ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}  ${BOLD}${BLUE}██╔════╝████╗ ████║██╔══██╗    ██╔══██╗██╔═══██╗╚██╗██╔╝${RESET}      ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}  ${BOLD}${CYAN}██║     ██╔████╔██║██║  ██║    ██████╔╝██║   ██║ ╚███╔╝${RESET}       ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}  ${BOLD}${CYAN}██║     ██║╚██╔╝██║██║  ██║    ██╔══██╗██║   ██║ ██╔██╗${RESET}       ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}  ${BOLD}${BLUE}╚██████╗██║ ╚═╝ ██║██████╔╝    ██████╔╝╚██████╔╝██╔╝ ██╗${RESET}      ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}  ${BOLD}${BLUE} ╚═════╝╚═╝     ╚═╝╚═════╝     ╚═════╝  ╚═════╝ ╚═╝  ╚═╝${RESET}      ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}                                                                              ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}                         ${BOLD}${YELLOW}命令收藏夹 v1.0.0${RESET}                           ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}                    ${DIM}高级命令收藏与快速启动器${RESET}                     ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}                                                                              ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}    ${ORANGE}${FIRE} 作者:${RESET} Joey                    ${PINK}${HEART} Telegram:${RESET} ${UNDERLINE}t.me/+ft-zI76oovgwNmRh${RESET}  ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}    ${YELLOW}${LIGHTNING} GitHub:${RESET} ${UNDERLINE}github.com/cmdbox/cmdbox${RESET}     ${ORANGE}${FIRE} Blog:${RESET} ${UNDERLINE}joeyblog.net${RESET}        ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_V}${RESET}                                                                              ${CYAN}${BOX_V}${RESET}"
    echo -e "${CYAN}${BOX_BL}$(printf "%*s" 78 | tr ' ' "${BOX_H}")${BOX_BR}${RESET}"
    echo ""
}

init_config() {
    local is_first_run=false
    
    if [[ ! -d "$CONFIG_DIR" ]]; then
        mkdir -p "$CONFIG_DIR"
        is_first_run=true
    fi
    
    if [[ ! -f "$CONFIG_FILE" ]]; then
        is_first_run=true
    fi
    
    if [[ ! -f "$COMMANDS_FILE" ]]; then
        echo '{"commands": []}' > "$COMMANDS_FILE"
    fi
    
    if [[ "$is_first_run" == true ]]; then
        show_welcome
    elif [[ ! -f "$CONFIG_FILE" ]]; then
        create_default_config
    fi
}

show_welcome() {
    print_header
    
    echo -e "${BOLD}${ROCKET} 欢迎使用命令收藏夹！${RESET}"
    echo ""
    echo -e "${CYAN}这是一个强大的命令收藏工具，可以帮你：${RESET}"
    echo -e "  ${LIGHTNING} 存储和整理常用命令"
    echo -e "  ${ROCKET} 用数字快速执行命令"
    echo -e "  ${CLOUD} 通过GitHub云同步"
    echo -e "  ${STAR} 再也不会忘记有用的命令"
    echo ""
    
    echo -e "${BOLD}${GEAR} 选择你的使用模式：${RESET}"
    echo ""
    echo -e "${GREEN}[1] 本地收藏模式${RESET}"
    echo -e "    • 命令只保存在本地"
    echo -e "    • 简单快速，无需配置"
    echo -e "    • 适合单机使用"
    echo ""
    echo -e "${BLUE}[2] GitHub云同步模式${RESET}"
    echo -e "    • 命令自动同步到GitHub"
    echo -e "    • 多设备共享命令库"
    echo -e "    • 需要GitHub仓库和Token"
    echo ""
    
    while true; do
        echo -ne "${BOLD}请选择模式 [1/2]: ${RESET}"
        read -r choice
        
        case "$choice" in
            1)
                setup_local_mode
                break
                ;;
            2)
                setup_github_mode
                break
                ;;
            *)
                echo ""
                echo -e "${YELLOW}${WARNING} 让我帮你选择...${RESET}"
                echo ""
                echo -e "${GREEN}选择本地模式如果你：${RESET}"
                echo -e "  • 只在一台电脑上使用"
                echo -e "  • 不熟悉GitHub操作"
                echo -e "  • 希望简单快速开始"
                echo ""
                echo -e "${BLUE}选择GitHub模式如果你：${RESET}"
                echo -e "  • 需要在多台设备同步"
                echo -e "  • 希望备份到云端"
                echo -e "  • 愿意花几分钟配置"
                echo ""
                ;;
        esac
    done
    
    echo ""
    echo -e "${GREEN}${SUCCESS} 配置完成！正在启动命令收藏夹...${RESET}"
    sleep 2
}

setup_local_mode() {
    cat > "$CONFIG_FILE" << 'EOF'
SYNC_MODE=local
GITHUB_REPO=""
GITHUB_TOKEN=""
EOF
    
    echo -e "${GREEN}${SUCCESS} 本地模式配置完成！${RESET}"
    echo -e "    ${DIM}命令将保存在: $CONFIG_DIR${RESET}"
}

setup_github_mode() {
    echo ""
    echo -e "${CYAN}${BOLD}${GEAR} GitHub云同步配置向导${RESET}"
    echo ""
    echo -e "${YELLOW}${BOLD}准备工作：${RESET}"
    echo "1. 创建GitHub账号 (github.com)"
    echo "2. 创建新仓库用于存储命令"
    echo "3. 生成Personal Access Token"
    echo ""
    echo -e "${YELLOW}${BOLD}详细步骤：${RESET}"
    echo ""
    echo -e "${BOLD}Step 1: 创建仓库${RESET}"
    echo "• 登录GitHub → 点击'+' → New repository"
    echo "• 仓库名建议: cmdbox-commands"
    echo "• 可设为Private保护隐私"
    echo ""
    echo -e "${BOLD}Step 2: 生成Token${RESET}"
    echo "• 头像 → Settings → Developer settings"
    echo "• Personal access tokens → Tokens (classic)"
    echo "• Generate new token → 选择repo权限"
    echo "• ${RED}${BOLD}重要: 复制生成的token（只显示一次）${RESET}"
    echo ""
    
    echo -ne "${BOLD}是否已完成准备工作？[y/n]: ${RESET}"
    read -r ready
    
    if [[ "$ready" != "y" && "$ready" != "Y" ]]; then
        echo ""
        echo -e "${YELLOW}稍后可通过 'cb --reset' 重新配置${RESET}"
        setup_local_mode
        return
    fi
    
    start_github_config
}

start_github_config() {
    echo ""
    echo -e "${GREEN}${ROCKET} 开始GitHub配置${RESET}"
    echo ""
    
    local repo=""
    while true; do
        echo -ne "${BOLD}GitHub仓库 (格式: 用户名/仓库名): ${RESET}"
        read -r repo
        
        if [[ "$repo" =~ ^[a-zA-Z0-9_.-]+/[a-zA-Z0-9_.-]+$ ]]; then
            break
        else
            echo -e "${RED}${ERROR} 格式错误，请使用: 用户名/仓库名${RESET}"
        fi
    done
    
    local token=""
    while true; do
        echo -ne "${BOLD}Personal Access Token: ${RESET}"
        read -rs token
        echo ""
        
        if [[ -n "$token" ]]; then
            break
        else
            echo -e "${RED}${ERROR} Token不能为空${RESET}"
        fi
    done
    
    test_github_connection "$repo" "$token"
}

test_github_connection() {
    local repo="$1"
    local token="$2"
    
    echo ""
    echo -e "${YELLOW}正在测试GitHub连接...${RESET}"
    
    local test_response=$(curl -s -H "Authorization: token $token" \
        "https://api.github.com/repos/$repo" 2>/dev/null)
    
    if echo "$test_response" | jq -e '.id' >/dev/null 2>&1; then
        echo -e "${GREEN}${SUCCESS} GitHub连接成功！${RESET}"
        
        cat > "$CONFIG_FILE" << EOF
SYNC_MODE=github
GITHUB_REPO="$repo"
GITHUB_TOKEN="$token"
EOF
        
        echo -ne "${BOLD}是否从GitHub同步现有命令？[y/N]: ${RESET}"
        read -r sync_choice
        
        if [[ "$sync_choice" == "y" || "$sync_choice" == "Y" ]]; then
            load_config
            sync_from_github
        fi
        
    else
        echo -e "${RED}${ERROR} 连接失败${RESET}"
        echo "可能原因: 仓库不存在、Token权限不足或网络问题"
        echo -e "${YELLOW}将使用本地模式，稍后可重新配置${RESET}"
        setup_local_mode
    fi
}

load_config() {
    if [[ -f "$CONFIG_FILE" ]]; then
        source "$CONFIG_FILE"
    fi
}

create_default_config() {
    cat > "$CONFIG_FILE" << 'EOF'
SYNC_MODE=local
GITHUB_REPO=""
GITHUB_TOKEN=""
EOF
}

show_main_interface() {
    local search_term="$1"
    
    print_header
    
    local mode_icon mode_text
    if [[ "$SYNC_MODE" == "github" ]]; then
        mode_icon="${CLOUD}"
        mode_text="GitHub同步"
    else
        mode_icon="${LOCAL}"
        mode_text="本地模式"
    fi
    
    echo -e "${CYAN}状态: ${mode_icon} ${mode_text} | 命令数: $(jq -r '.commands | if type == "array" then length else 0 end' "$COMMANDS_FILE" 2>/dev/null || echo "0") | 操作: ${YELLOW}[m]管理 [q]退出${RESET}"
    echo ""
    
    if [[ ! -f "$COMMANDS_FILE" ]] || [[ "$(jq -r '.commands | if type == "array" then length else 0 end' "$COMMANDS_FILE" 2>/dev/null || echo "0")" -eq 0 ]]; then
        show_empty_state
        return
    fi
    
    display_commands "$search_term"
    
    echo ""
    echo -ne "${BOLD}${ROCKET} 请选择 (数字/搜索词/m=管理/q=退出): ${RESET}"
    read -r input
    
    handle_input "$input" "$search_term"
}

show_empty_state() {
    echo -e "${YELLOW}${BOLD}暂无收藏的命令${RESET}"
    echo ""
    echo -e "${CYAN}${ROCKET} 快速开始：${RESET}"
    echo "1. 输入 'm' 进入管理模式"
    echo "2. 添加你的第一个命令"
    echo "3. 返回主界面用数字快速执行"
    echo ""
    echo -e "${GREEN}${BOLD}推荐命令：${RESET}"
    echo -e "  • ${CYAN}系统监控${RESET}: htop"
    echo -e "  • ${CYAN}查看端口${RESET}: netstat -tlnp"
    echo -e "  • ${CYAN}Docker状态${RESET}: docker ps -a"
    echo -e "  • ${CYAN}磁盘使用${RESET}: df -h"
    echo ""
    echo -ne "${BOLD}按回车进入管理模式添加命令...${RESET}"
    read -r
    management_menu
}

display_commands() {
    local search_term="$1"
    local commands
    
    # 先检查文件是否有效
    if ! jq empty "$COMMANDS_FILE" 2>/dev/null; then
        echo -e "${RED}${ERROR} 命令文件格式错误${RESET}"
        return
    fi
    
    if [[ -n "$search_term" ]]; then
        echo -e "${YELLOW}搜索结果: \"$search_term\"${RESET}"
        commands=$(jq -r --arg keyword "$search_term" '
            if .commands and (.commands | type == "array") then
                .commands | to_entries | 
                map(select(
                    (.value | type == "object") and
                    ((.value.name // "" | ascii_downcase | contains($keyword | ascii_downcase)) or 
                     (.value.command // "" | ascii_downcase | contains($keyword | ascii_downcase)) or 
                     (.value.description // "" | ascii_downcase | contains($keyword | ascii_downcase)))
                )) |
                if length > 0 then
                    .[] | "\(.key + 1). \(.value.name // "未命名")"
                else
                    empty
                end
            else
                empty
            end
        ' "$COMMANDS_FILE" 2>/dev/null)
    else
        commands=$(jq -r '
            if .commands and (.commands | type == "array") then
                .commands | to_entries | 
                if length > 0 then
                    .[] | "\(.key + 1). \(.value.name // "未命名")"
                else
                    empty
                end
            else
                empty
            end
        ' "$COMMANDS_FILE" 2>/dev/null)
    fi
    
    if [[ -z "$commands" ]]; then
        echo -e "${YELLOW}没有找到匹配的命令${RESET}"
        return
    fi
    
    echo -e "$commands"
}

handle_input() {
    local input="$1"
    local search_term="$2"
    
    case "$input" in
        q|quit|exit)
            echo -e "${GREEN}再见！${RESET}"
            exit 0
            ;;
        m|manage)
            management_menu
            ;;
        '')
            show_main_interface
            ;;
        *[0-9]*)
            if [[ "$input" =~ ^[0-9]+$ ]]; then
                execute_command "$input" "$search_term"
            else
                show_main_interface "$input"
            fi
            ;;
        *)
            show_main_interface "$input"
            ;;
    esac
}

execute_command() {
    local num="$1"
    local search_term="$2"
    
    local search_result command_data name command
    
    # 先检查文件格式
    if ! jq empty "$COMMANDS_FILE" 2>/dev/null; then
        echo -e "${RED}${ERROR} 命令文件格式错误${RESET}"
        return
    fi
    
    if [[ -n "$search_term" ]]; then
        search_result=$(jq -r --arg keyword "$search_term" --arg num "$num" '
            if .commands and (.commands | type == "array") then
                .commands | to_entries | 
                map(select(
                    (.value | type == "object") and
                    ((.value.name // "" | ascii_downcase | contains($keyword | ascii_downcase)) or 
                     (.value.command // "" | ascii_downcase | contains($keyword | ascii_downcase)) or 
                     (.value.description // "" | ascii_downcase | contains($keyword | ascii_downcase)))
                )) |
                if length >= ($num | tonumber) and ($num | tonumber) > 0 then
                    .[($num | tonumber) - 1].value
                else
                    null
                end
            else
                null
            end
        ' "$COMMANDS_FILE" 2>/dev/null)
        
        if [[ "$search_result" == "null" || -z "$search_result" ]]; then
            echo -e "${RED}${ERROR} 无效的命令编号${RESET}"
            echo ""
            show_main_interface "$search_term"
            return
        fi
        
        name=$(echo "$search_result" | jq -r '.name // "未命名"')
        command=$(echo "$search_result" | jq -r '.command // ""')
    else
        local total_commands=$(jq -r '.commands | if type == "array" then length else 0 end' "$COMMANDS_FILE" 2>/dev/null || echo "0")
        if [[ "$num" -gt "$total_commands" || "$num" -lt 1 ]]; then
            echo -e "${RED}${ERROR} 无效的命令编号${RESET}"
            echo ""
            show_main_interface
            return
        fi
        
        command_data=$(jq -r --arg num "$num" '
            if .commands and (.commands | type == "array") and (.commands | length >= ($num | tonumber)) then
                .commands[($num | tonumber) - 1]
            else
                null
            end
        ' "$COMMANDS_FILE" 2>/dev/null)
        
        if [[ "$command_data" == "null" || -z "$command_data" ]]; then
            echo -e "${RED}${ERROR} 无效的命令编号${RESET}"
            echo ""
            show_main_interface
            return
        fi
        
        name=$(echo "$command_data" | jq -r '.name // "未命名"')
        command=$(echo "$command_data" | jq -r '.command // ""')
    fi
    
    if [[ -z "$command" ]]; then
        echo -e "${RED}${ERROR} 命令内容为空${RESET}"
        echo ""
        show_main_interface "$search_term"
        return
    fi
    
    echo ""
    echo -e "${GREEN}${LIGHTNING} 执行命令: ${BOLD}$name${RESET}"
    echo -e "${CYAN}$command${RESET}"
    echo ""
    
    echo -ne "${BOLD}确认执行？[Y/n]: ${RESET}"
    read -r confirm
    
    if [[ "$confirm" != "n" && "$confirm" != "N" ]]; then
        echo -e "${YELLOW}正在执行...${RESET}"
        echo ""
        
        eval "$command"
        local exit_code=$?
        
        echo ""
        if [[ $exit_code -eq 0 ]]; then
            echo -e "${GREEN}${SUCCESS} 命令执行完成${RESET}"
        else
            echo -e "${RED}${ERROR} 命令执行失败 (退出码: $exit_code)${RESET}"
        fi
    else
        echo "取消执行"
    fi
    
    echo ""
    echo -ne "${DIM}按回车返回...${RESET}"
    read -r
    show_main_interface "$search_term"
}

management_menu() {
    while true; do
        print_header
        echo -e "${PURPLE}${BOLD}${GEAR} 管理模式${RESET}"
        echo ""
        echo -e "${GREEN}[1] 添加命令${RESET}"
        echo -e "${YELLOW}[2] 编辑命令${RESET}"
        echo -e "${RED}[3] 删除命令${RESET}"
        echo -e "${BLUE}[4] 同步管理${RESET}"
        echo -e "${CYAN}[5] 配置设置${RESET}"
        echo -e "${ORANGE}[6] 导入/导出${RESET}"
        echo -e "${PURPLE}[7] 返回主界面${RESET}"
        echo ""
        echo -ne "${BOLD}请选择: ${RESET}"
        read -r choice
        
        case $choice in
            1) add_command ;;
            2) edit_command ;;
            3) delete_command ;;
            4) sync_menu ;;
            5) config_menu ;;
            6) import_export_menu ;;
            7) 
                clear
                show_main_interface
                return
                ;;
            *) echo -e "${RED}${ERROR} 无效选择${RESET}" ;;
        esac
    done
}

add_command() {
    print_header
    echo -e "${GREEN}${BOLD}添加新命令${RESET}"
    echo ""
    
    echo -ne "${BOLD}命令名称: ${RESET}"
    read -r name
    
    if [[ -z "$name" ]]; then
        echo -e "${RED}${ERROR} 命令名称不能为空${RESET}"
        return
    fi
    
    echo -ne "${BOLD}命令内容: ${RESET}"
    read -r command
    
    if [[ -z "$command" ]]; then
        echo -e "${RED}${ERROR} 命令内容不能为空${RESET}"
        return
    fi
    
    echo -ne "${BOLD}描述 (可选): ${RESET}"
    read -r description
    
    local id=$(date +%s%N | cut -b1-13)
    local timestamp=$(date -Iseconds)
    
    local new_command=$(jq -n \
        --arg id "$id" \
        --arg name "$name" \
        --arg command "$command" \
        --arg description "$description" \
        --arg timestamp "$timestamp" \
        '{
            id: ($id | tonumber),
            name: $name,
            command: $command,
            description: $description,
            created_at: $timestamp,
            updated_at: $timestamp
        }')
    
    jq --argjson new_command "$new_command" '.commands += [$new_command]' "$COMMANDS_FILE" > "$TEMP_FILE" && mv "$TEMP_FILE" "$COMMANDS_FILE"
    
    echo ""
    echo -e "${GREEN}${SUCCESS} 命令添加成功！${RESET}"
    
    echo ""
    echo -e "${CYAN}${BOLD}推荐添加的命令：${RESET}"
    echo -e "  • ${CYAN}系统监控${RESET}: htop"
    echo -e "  • ${CYAN}查看端口${RESET}: netstat -tlnp"
    echo -e "  • ${CYAN}Docker状态${RESET}: docker ps -a"
    echo -e "  • ${CYAN}磁盘使用${RESET}: df -h"
    echo ""
    
    if [[ "$SYNC_MODE" == "github" ]]; then
        echo "正在自动同步..."
        sync_to_github
    fi
    
    echo -ne "${DIM}按回车继续...${RESET}"
    read -r
}

edit_command() {
    print_header
    echo -e "${YELLOW}${BOLD}编辑命令${RESET}"
    echo ""
    
    local commands=$(jq -r '.commands | to_entries | .[] | "\(.key + 1). \(.value.name) - \(.value.command)"' "$COMMANDS_FILE")
    
    if [[ -z "$commands" ]]; then
        echo -e "${YELLOW}暂无命令可编辑${RESET}"
        echo -ne "${DIM}按回车返回...${RESET}"
        read -r
        return
    fi
    
    echo "现有命令:"
    echo "$commands"
    echo ""
    
    echo -ne "${BOLD}请输入要编辑的命令编号: ${RESET}"
    read -r num
    
    if ! [[ "$num" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}${ERROR} 请输入有效的数字${RESET}"
        echo -ne "${DIM}按回车返回...${RESET}"
        read -r
        return
    fi
    
    local total_commands=$(jq '.commands | length' "$COMMANDS_FILE")
    if [[ "$num" -gt "$total_commands" || "$num" -lt 1 ]]; then
        echo -e "${RED}${ERROR} 无效的命令编号${RESET}"
        echo -ne "${DIM}按回车返回...${RESET}"
        read -r
        return
    fi
    
    local current=$(jq --arg num "$num" '.commands[($num | tonumber) - 1]' "$COMMANDS_FILE")
    
    echo ""
    echo "当前命令信息:"
    echo "$current" | jq -r '"名称: \(.name)\n命令: \(.command)\n描述: \(.description)"'
    echo ""
    
    echo "请输入新值 (直接回车保持原值):"
    echo -ne "${BOLD}新名称: ${RESET}"
    read -r new_name
    echo -ne "${BOLD}新命令: ${RESET}"
    read -r new_command
    echo -ne "${BOLD}新描述: ${RESET}"
    read -r new_description
    
    local timestamp=$(date -Iseconds)
    local update_data=$(echo "$current" | jq \
        --arg name "$new_name" \
        --arg command "$new_command" \
        --arg description "$new_description" \
        --arg timestamp "$timestamp" '
        .name = (if $name == "" then .name else $name end) |
        .command = (if $command == "" then .command else $command end) |
        .description = (if $description == "" then .description else $description end) |
        .updated_at = $timestamp
    ')
    
    jq --arg num "$num" --argjson update_data "$update_data" \
        '.commands[($num | tonumber) - 1] = $update_data' \
        "$COMMANDS_FILE" > "$TEMP_FILE" && mv "$TEMP_FILE" "$COMMANDS_FILE"
    
    echo ""
    echo -e "${GREEN}${SUCCESS} 命令更新成功！${RESET}"
    
    if [[ "$SYNC_MODE" == "github" ]]; then
        echo "正在自动同步..."
        sync_to_github
    fi
    
    echo -ne "${DIM}按回车继续...${RESET}"
    read -r
}

delete_command() {
    print_header
    echo -e "${RED}${BOLD}删除命令${RESET}"
    echo ""
    
    local commands=$(jq -r '.commands | to_entries | .[] | "\(.key + 1). \(.value.name) - \(.value.command)"' "$COMMANDS_FILE")
    
    if [[ -z "$commands" ]]; then
        echo -e "${YELLOW}暂无命令可删除${RESET}"
        echo -ne "${DIM}按回车返回...${RESET}"
        read -r
        return
    fi
    
    echo "现有命令:"
    echo "$commands"
    echo ""
    
    echo -ne "${BOLD}请输入要删除的命令编号: ${RESET}"
    read -r num
    
    if ! [[ "$num" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}${ERROR} 请输入有效的数字${RESET}"
        echo -ne "${DIM}按回车返回...${RESET}"
        read -r
        return
    fi
    
    local total_commands=$(jq '.commands | length' "$COMMANDS_FILE")
    if [[ "$num" -gt "$total_commands" || "$num" -lt 1 ]]; then
        echo -e "${RED}${ERROR} 无效的命令编号${RESET}"
        echo -ne "${DIM}按回车返回...${RESET}"
        read -r
        return
    fi
    
    echo ""
    echo "要删除的命令:"
    jq --arg num "$num" '.commands[($num | tonumber) - 1]' "$COMMANDS_FILE" | jq -r '"名称: \(.name)\n命令: \(.command)\n描述: \(.description)"'
    echo ""
    
    echo -ne "${BOLD}确认删除？[y/N]: ${RESET}"
    read -r confirm
    
    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        jq --arg num "$num" 'del(.commands[($num | tonumber) - 1])' "$COMMANDS_FILE" > "$TEMP_FILE" && mv "$TEMP_FILE" "$COMMANDS_FILE"
        echo -e "${GREEN}${SUCCESS} 命令删除成功！${RESET}"
        
        if [[ "$SYNC_MODE" == "github" ]]; then
            echo "正在自动同步..."
            sync_to_github
        fi
    else
        echo "取消删除"
    fi
    
    echo -ne "${DIM}按回车继续...${RESET}"
    read -r
}

sync_menu() {
    print_header
    echo -e "${BLUE}${BOLD}同步管理${RESET}"
    echo ""
    echo -e "当前模式: ${BOLD}$SYNC_MODE${RESET}"
    echo ""
    
    if [[ "$SYNC_MODE" == "github" ]]; then
        echo -e "${GREEN}[1] 同步到GitHub${RESET}"
        echo -e "${YELLOW}[2] 从GitHub同步${RESET}"
        echo -e "${ORANGE}[3] 切换到本地模式${RESET}"
        echo -e "${PURPLE}[4] 返回${RESET}"
        echo ""
        echo -ne "${BOLD}请选择: ${RESET}"
        read -r choice
        
        case $choice in
            1) sync_to_github ;;
            2) sync_from_github ;;
            3) 
                sed -i "s/SYNC_MODE=.*/SYNC_MODE=local/" "$CONFIG_FILE"
                load_config
                echo -e "${GREEN}${SUCCESS} 已切换到本地模式${RESET}"
                ;;
            4) return ;;
            *) echo -e "${RED}${ERROR} 无效选择${RESET}" ;;
        esac
    else
        echo -e "${BLUE}[1] 切换到GitHub同步模式${RESET}"
        echo -e "${PURPLE}[2] 返回${RESET}"
        echo ""
        echo -ne "${BOLD}请选择: ${RESET}"
        read -r choice
        
        case $choice in
            1) setup_github_mode ;;
            2) return ;;
            *) echo -e "${RED}${ERROR} 无效选择${RESET}" ;;
        esac
    fi
    
    echo -ne "${DIM}按回车继续...${RESET}"
    read -r
}

sync_to_github() {
    if [[ "$SYNC_MODE" != "github" || -z "$GITHUB_REPO" || -z "$GITHUB_TOKEN" ]]; then
        echo -e "${RED}${ERROR} GitHub配置不完整${RESET}"
        return
    fi
    
    echo "正在同步到GitHub..."
    
    local content=$(base64 -w 0 "$COMMANDS_FILE" 2>/dev/null || base64 "$COMMANDS_FILE")
    
    local sha_response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
        "https://api.github.com/repos/$GITHUB_REPO/contents/commands.json")
    
    local sha=""
    if echo "$sha_response" | jq -e '.sha' >/dev/null 2>&1; then
        sha=$(echo "$sha_response" | jq -r '.sha')
    fi
    
    local api_data=$(jq -n \
        --arg message "更新命令 $(date -Iseconds)" \
        --arg content "$content" \
        --arg sha "$sha" \
        'if $sha == "" then {message: $message, content: $content} else {message: $message, content: $content, sha: $sha} end')
    
    local response=$(curl -s -X PUT \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Content-Type: application/json" \
        -d "$api_data" \
        "https://api.github.com/repos/$GITHUB_REPO/contents/commands.json")
    
    if echo "$response" | jq -e '.content' >/dev/null 2>&1; then
        echo -e "${GREEN}${SUCCESS} 同步到GitHub成功！${RESET}"
    else
        echo -e "${RED}${ERROR} 同步失败: $(echo "$response" | jq -r '.message // "未知错误"')${RESET}"
    fi
}

sync_from_github() {
    if [[ "$SYNC_MODE" != "github" || -z "$GITHUB_REPO" || -z "$GITHUB_TOKEN" ]]; then
        echo -e "${RED}${ERROR} GitHub配置不完整${RESET}"
        return
    fi
    
    echo "正在从GitHub同步..."
    
    local response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
        "https://api.github.com/repos/$GITHUB_REPO/contents/commands.json")
    
    if echo "$response" | jq -e '.content' >/dev/null 2>&1; then
        echo "$response" | jq -r '.content' | base64 -d > "$COMMANDS_FILE"
        echo -e "${GREEN}${SUCCESS} 从GitHub同步成功！${RESET}"
    else
        echo -e "${RED}${ERROR} 同步失败: $(echo "$response" | jq -r '.message // "文件不存在"')${RESET}"
    fi
}

config_menu() {
    print_header
    echo -e "${CYAN}${BOLD}配置设置${RESET}"
    echo ""
    echo -e "${GREEN}[1] 查看当前配置${RESET}"
    echo -e "${YELLOW}[2] 重新配置GitHub${RESET}"
    echo -e "${PURPLE}[3] 返回${RESET}"
    echo ""
    echo -ne "${BOLD}请选择: ${RESET}"
    read -r choice
    
    case $choice in
        1)
            echo ""
            echo -e "${CYAN}${BOLD}当前配置:${RESET}"
            echo "同步模式: $SYNC_MODE"
            echo "GitHub仓库: ${GITHUB_REPO:-"未设置"}"
            echo "Token状态: $([ -n "$GITHUB_TOKEN" ] && echo "已设置" || echo "未设置")"
            ;;
        2)
            setup_github_mode
            ;;
        3)
            return
            ;;
        *)
            echo -e "${RED}${ERROR} 无效选择${RESET}"
            ;;
    esac
    
    echo -ne "${DIM}按回车继续...${RESET}"
    read -r
}

import_export_menu() {
    print_header
    echo -e "${ORANGE}${BOLD}导入/导出${RESET}"
    echo ""
    echo -e "${GREEN}[1] 导出命令到文件${RESET}"
    echo -e "${YELLOW}[2] 从文件导入命令${RESET}"
    echo -e "${PURPLE}[3] 返回${RESET}"
    echo ""
    echo -ne "${BOLD}请选择: ${RESET}"
    read -r choice
    
    case $choice in
        1) export_commands ;;
        2) import_commands ;;
        3) return ;;
        *) echo -e "${RED}${ERROR} 无效选择${RESET}" ;;
    esac
    
    echo -ne "${DIM}按回车继续...${RESET}"
    read -r
}

export_commands() {
    echo ""
    echo -ne "${BOLD}导出文件路径 (默认: ./命令备份_$(date +%Y%m%d_%H%M%S).json): ${RESET}"
    read -r export_path
    
    if [[ -z "$export_path" ]]; then
        export_path="./命令备份_$(date +%Y%m%d_%H%M%S).json"
    fi
    
    cp "$COMMANDS_FILE" "$export_path"
    echo -e "${GREEN}${SUCCESS} 命令已导出到: $export_path${RESET}"
}

import_commands() {
    echo ""
    echo -ne "${BOLD}导入文件路径: ${RESET}"
    read -r import_path
    
    if [[ ! -f "$import_path" ]]; then
        echo -e "${RED}${ERROR} 文件不存在: $import_path${RESET}"
        return
    fi
    
    if ! jq empty "$import_path" 2>/dev/null; then
        echo -e "${RED}${ERROR} 无效的JSON文件${RESET}"
        return
    fi
    
    echo ""
    echo "导入模式:"
    echo -e "${GREEN}[1] 合并 (保留现有命令并添加新命令)${RESET}"
    echo -e "${YELLOW}[2] 替换 (删除现有命令并使用导入的命令)${RESET}"
    echo -ne "${BOLD}请选择: ${RESET}"
    read -r mode
    
    case $mode in
        1)
            jq -s '.[0].commands + .[1].commands | {"commands": .}' "$COMMANDS_FILE" "$import_path" > "$TEMP_FILE" && mv "$TEMP_FILE" "$COMMANDS_FILE"
            echo -e "${GREEN}${SUCCESS} 命令合并成功！${RESET}"
            ;;
        2)
            cp "$import_path" "$COMMANDS_FILE"
            echo -e "${GREEN}${SUCCESS} 命令替换成功！${RESET}"
            ;;
        *)
            echo -e "${RED}${ERROR} 无效选择${RESET}"
            return
            ;;
    esac
    
    if [[ "$SYNC_MODE" == "github" ]]; then
        echo "正在自动同步..."
        sync_to_github
    fi
}

show_help() {
    echo -e "${CYAN}命令收藏夹 - 高级命令收藏与快速启动器${RESET}"
    echo ""
    echo "用法: cb [选项]"
    echo ""
    echo "选项:"
    echo "  -h, --help     显示帮助信息"
    echo "  -v, --version  显示版本信息"
    echo "  -m, --manage   直接进入管理模式"
    echo "  -s, --sync     手动同步到GitHub"
    echo "  --reset        重置配置（重新选择模式）"
    echo ""
    echo "使用说明:"
    echo "  - 直接运行显示命令列表，输入数字快速执行"
    echo "  - 输入关键词搜索命令"
    echo "  - 输入 'm' 进入管理模式添加/编辑命令"
    echo "  - 支持本地模式和GitHub云同步"
    echo ""
    echo "链接:"
    echo "  GitHub: https://github.com/cmdbox/cmdbox"
    echo "  博客: https://joeyblog.net"
    echo "  Telegram: https://t.me/+ft-zI76oovgwNmRh"
}

show_version() {
    echo "命令收藏夹 v1.0.0 - 高级命令收藏与快速启动器"
    echo "作者: Joey"
}

main() {
    # 自动安装功能
    auto_install
    
    if ! command -v jq &> /dev/null; then
        echo -e "${RED}${ERROR} 错误: 需要安装 jq${RESET}"
        echo "Ubuntu/Debian: sudo apt install jq"
        echo "CentOS/RHEL: sudo yum install jq"
        echo "macOS: brew install jq"
        exit 1
    fi
    
    init_config
    load_config
    
    case "${1:-}" in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--version)
            show_version
            exit 0
            ;;
        -m|--manage)
            management_menu
            exit 0
            ;;
        -s|--sync)
            if [[ "$SYNC_MODE" == "github" ]]; then
                sync_to_github
            else
                echo -e "${YELLOW}当前为本地模式，请先配置GitHub同步${RESET}"
            fi
            exit 0
            ;;
        --reset)
            echo -e "${YELLOW}正在重置配置...${RESET}"
            rm -f "$CONFIG_FILE"
            show_welcome
            exit 0
            ;;
        "")
            clear
            show_main_interface
            ;;
        *)
            echo -e "${RED}${ERROR} 未知参数: $1${RESET}"
            show_help
            exit 1
            ;;
    esac
}

auto_install() {
    # 检查是否已经安装
    if command -v cb &> /dev/null && [[ "$(realpath "$(which cb)")" == "$(realpath "$0")" ]]; then
        return  # 已经安装且是当前脚本
    fi
    
    # 检查是否在系统路径中
    local script_path="$(realpath "$0")"
    if [[ "$script_path" == "/usr/local/bin/cb" ]] || [[ "$script_path" == "/usr/bin/cb" ]]; then
        return  # 已经在系统路径中
    fi
    
    # 检查是否有权限安装
    if [[ ! -w "/usr/local/bin" ]] && ! sudo -n true 2>/dev/null; then
        return  # 没有权限，跳过安装
    fi
    
    echo -e "${CYAN}${ROCKET} 检测到命令收藏夹未安装到系统${RESET}"
    echo ""
    echo -e "${YELLOW}安装后的好处：${RESET}"
    echo -e "  • 全局使用 ${GREEN}cb${RESET} 命令"
    echo -e "  • 在任何目录下都能快速启动"
    echo -e "  • 更便捷的命令管理体验"
    echo ""
    
    echo -ne "${BOLD}是否现在安装到系统？[Y/n]: ${RESET}"
    read -r install_choice
    
    if [[ "$install_choice" != "n" && "$install_choice" != "N" ]]; then
        install_to_system
    else
        echo -e "${DIM}跳过安装，你仍可以直接运行此脚本${RESET}"
        echo ""
    fi
}

install_to_system() {
    local install_path="/usr/local/bin/cb"
    local script_path="$(realpath "$0")"
    
    echo -e "${YELLOW}正在安装命令收藏夹...${RESET}"
    
    # 尝试复制到系统路径
    if sudo cp "$script_path" "$install_path" 2>/dev/null; then
        sudo chmod +x "$install_path"
        echo -e "${GREEN}${SUCCESS} 安装成功！${RESET}"
        echo ""
        echo -e "${CYAN}现在你可以在任何地方使用以下命令：${RESET}"
        echo -e "  ${GREEN}${BOLD}cb${RESET}           # 启动命令收藏夹"
        echo -e "  ${GREEN}${BOLD}cb -m${RESET}        # 直接进入管理模式"
        echo -e "  ${GREEN}${BOLD}cb -h${RESET}        # 显示帮助信息"
        echo ""
        
        # 询问是否立即使用安装的版本
        echo -ne "${BOLD}是否现在使用安装的版本启动？[Y/n]: ${RESET}"
        read -r use_installed
        
        if [[ "$use_installed" != "n" && "$use_installed" != "N" ]]; then
            echo -e "${CYAN}正在启动安装的版本...${RESET}"
            sleep 1
            exec cb "$@"
        fi
    else
        echo -e "${RED}${ERROR} 安装失败，可能需要管理员权限${RESET}"
        echo -e "${DIM}你仍可以直接运行此脚本: ./$(basename "$0")${RESET}"
    fi
    
    echo ""
}

main "$@"
