# 命令收藏夹 (cb) 🚀

> 高级命令收藏与快速启动器 - 让你的常用命令触手可及

<img width="390" height="169" alt="image" src="https://github.com/user-attachments/assets/551d47db-c2b1-4e74-aa37-db2465d102d3" />


## ✨ 特性

- 🚀 **快速执行** - 数字键快速启动收藏的命令
- 🔍 **智能搜索** - 实时搜索过滤命令
- ☁️ **云同步** - GitHub自动同步，多设备共享
- 💾 **本地模式** - 纯本地存储，简单快速
- 🎨 **美观界面** - 科技感十足的终端界面
- 🛠️ **完整管理** - 添加/编辑/删除/导入/导出

## 📸 界面预览

### 欢迎界面
<img width="825" height="720" alt="image" src="https://github.com/user-attachments/assets/31447d82-7e73-424a-9120-315da5d78b4c" />

### 主界面
<img width="721" height="471" alt="image" src="https://github.com/user-attachments/assets/496eb1d9-7d59-4016-816b-24e36a5f018f" />
### 管理模式
<img width="629" height="440" alt="image" src="https://github.com/user-attachments/assets/0acc68c4-209c-41e1-a0da-f449eba99bf7" />

### GitHub配置
<img width="521" height="535" alt="image" src="https://github.com/user-attachments/assets/5e6b5adb-38d2-4cec-ba32-7e675f083158" />
秘钥不可见
## 🎯 快速开始

### 一键安装
```bash
# 下载并运行
bash <(curl -l -s https://raw.githubusercontent.com/byJoey/cmdbox/refs/heads/main/install.sh)

```

脚本会自动检测并提示安装到系统，安装后全局使用 `cb` 命令。


## 🚀 使用方法

### 基本命令
```bash
cb           # 启动命令收藏夹
cb -m        # 直接进入管理模式  
cb -h        # 显示帮助信息
cb -s        # 手动同步到GitHub
cb --reset   # 重置配置
```

### 快速上手
1. **首次运行** - 选择本地模式或GitHub云同步模式
2. **添加命令** - 输入 `m` 进入管理模式，选择添加命令
3. **快速执行** - 返回主界面，输入数字执行对应命令
4. **智能搜索** - 输入关键词快速过滤命令


## 🛠️ 功能详解

### 💾 本地模式
- ✅ 零配置，开箱即用
- ✅ 命令保存在本地 `~/.cmdbox/`
- ✅ 适合单机使用
- ✅ 隐私安全

### ☁️ GitHub云同步模式
- ✅ 多设备自动同步
- ✅ 云端备份，永不丢失
- ✅ 版本控制，历史记录
- ✅ 团队共享


### 🔍 智能搜索
支持按以下内容搜索：
- 命令名称
- 命令内容  
- 描述信息


### 📱 管理功能
- **添加命令** - 收藏新的常用命令
- **编辑命令** - 修改已有命令信息
- **删除命令** - 移除不需要的命令
- **导入导出** - 备份和恢复命令数据
- **同步管理** - GitHub云同步设置


## ⚙️ GitHub配置教程

### 准备工作
1. 创建GitHub账号 ([github.com](https://github.com))
2. 创建新仓库用于存储命令
3. 生成Personal Access Token


### 详细步骤

#### Step 1: 创建仓库
1. 登录GitHub → 点击 `+` → `New repository`
2. 仓库名建议: `cmdbox-commands`
3. 可设为Private保护隐私
4. 勾选 `Add a README file`
5. 点击 `Create repository`


#### Step 2: 生成Token
1. 头像 → `Settings` → `Developer settings`
2. `Personal access tokens` → `Tokens (classic)`
3. `Generate new token` → 选择 `repo` 权限
4. **重要**: 复制生成的token（只显示一次）


#### Step 3: 配置同步
脚本会引导你完成配置，包括：
- 仓库格式验证
- Token有效性测试
- 连接测试
- 现有命令同步


## 📋 依赖要求

- **系统**: Linux / macOS / WSL
- **必需**: `jq` (JSON处理工具)
- **可选**: `curl` (GitHub同步功能)

### 安装依赖
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install jq curl

# CentOS/RHEL
sudo yum install jq curl

# macOS
brew install jq curl
```

## 📁 目录结构

```
~/.cmdbox/
├── config              # 配置文件
├── commands.json       # 命令数据
└── temp.json          # 临时文件
```

## 🎨 自定义

### 配置文件位置
- 配置目录: `~/.cmdbox/`
- 配置文件: `~/.cmdbox/config`
- 命令数据: `~/.cmdbox/commands.json`

### 数据格式
```json
{
  "commands": [
    {
      "id": 1640995200000,
      "name": "系统监控",
      "command": "htop",
      "description": "显示系统进程和资源使用",
      "created_at": "2021-12-31T16:00:00Z",
      "updated_at": "2021-12-31T16:00:00Z"
    }
  ]
}
```

## 🤝 贡献

欢迎贡献代码、报告问题或提出建议！

### 开发
```bash
git clone https://github.com/byjoey/cmdbox.git
cd cmdbox
chmod +x install.sh
./install.sh
```

### 问题反馈
- [GitHub Issues](https://github.com/byjoey/cmdbox/issues)
- [Telegram群](https://t.me/+ft-zI76oovgwNmRh)

## 📄 许可证

[MIT License](LICENSE)

## 🔗 链接

- **GitHub**: [github.com/cmdbox/cmdbox](https://github.com/byjoey/cmdbox)
- **博客**: [joeyblog.net](https://joeyblog.net)
- **Telegram**: [t.me/+ft-zI76oovgwNmRh](https://t.me/+ft-zI76oovgwNmRh)

## 👨‍💻 作者

**Joey**
- GitHub: [@byjoey](https://github.com/byjoey)
- 博客: [joeyblog.net](https://joeyblog.net)

---

⭐ 如果这个项目对你有帮助，请给个Star支持一下！

## Star History

<a href="https://www.star-history.com/#byJoey/cmdbox&Timeline">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=byJoey/cmdbox&type=Timeline&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=byJoey/cmdbox&type=Timeline" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=byJoey/cmdbox&type=Timeline" />
 </picture>
</a>2. **添加命令** - 输入 `m` 进入管理模式，选择添加命令
3. **快速执行** - 返回主界面，输入数字执行对应命令
4. **智能搜索** - 输入关键词快速过滤命令


## 🛠️ 功能详解

### 💾 本地模式
- ✅ 零配置，开箱即用
- ✅ 命令保存在本地 `~/.cmdbox/`
- ✅ 适合单机使用
- ✅ 隐私安全

### ☁️ GitHub云同步模式
- ✅ 多设备自动同步
- ✅ 云端备份，永不丢失
- ✅ 版本控制，历史记录
- ✅ 团队共享


### 🔍 智能搜索
支持按以下内容搜索：
- 命令名称
- 命令内容  
- 描述信息


### 📱 管理功能
- **添加命令** - 收藏新的常用命令
- **编辑命令** - 修改已有命令信息
- **删除命令** - 移除不需要的命令
- **导入导出** - 备份和恢复命令数据
- **同步管理** - GitHub云同步设置


## ⚙️ GitHub配置教程

### 准备工作
1. 创建GitHub账号 ([github.com](https://github.com))
2. 创建新仓库用于存储命令
3. 生成Personal Access Token


### 详细步骤

#### Step 1: 创建仓库
1. 登录GitHub → 点击 `+` → `New repository`
2. 仓库名建议: `cmdbox-commands`
3. 可设为Private保护隐私
4. 勾选 `Add a README file`
5. 点击 `Create repository`


#### Step 2: 生成Token
1. 头像 → `Settings` → `Developer settings`
2. `Personal access tokens` → `Tokens (classic)`
3. `Generate new token` → 选择 `repo` 权限
4. **重要**: 复制生成的token（只显示一次）


#### Step 3: 配置同步
脚本会引导你完成配置，包括：
- 仓库格式验证
- Token有效性测试
- 连接测试
- 现有命令同步


## 📋 依赖要求

- **系统**: Linux / macOS / WSL
- **必需**: `jq` (JSON处理工具)
- **可选**: `curl` (GitHub同步功能)

### 安装依赖
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install jq curl

# CentOS/RHEL
sudo yum install jq curl

# macOS
brew install jq curl
```

## 📁 目录结构

```
~/.cmdbox/
├── config              # 配置文件
├── commands.json       # 命令数据
└── temp.json          # 临时文件
```

## 🎨 自定义

### 配置文件位置
- 配置目录: `~/.cmdbox/`
- 配置文件: `~/.cmdbox/config`
- 命令数据: `~/.cmdbox/commands.json`

### 数据格式
```json
{
  "commands": [
    {
      "id": 1640995200000,
      "name": "系统监控",
      "command": "htop",
      "description": "显示系统进程和资源使用",
      "created_at": "2021-12-31T16:00:00Z",
      "updated_at": "2021-12-31T16:00:00Z"
    }
  ]
}
```

## 🤝 贡献

欢迎贡献代码、报告问题或提出建议！

### 开发
```bash
git clone https://github.com/byjoey/cmdbox.git
cd cmdbox
chmod +x install.sh
./install.sh
```

### 问题反馈
- [GitHub Issues](https://github.com/byjoey/cmdbox/issues)
- [Telegram群](https://t.me/+ft-zI76oovgwNmRh)

## 📄 许可证

[MIT License](LICENSE)

## 🔗 链接

- **GitHub**: [github.com/cmdbox/cmdbox](https://github.com/byjoey/cmdbox)
- **博客**: [joeyblog.net](https://joeyblog.net)
- **Telegram**: [t.me/+ft-zI76oovgwNmRh](https://t.me/+ft-zI76oovgwNmRh)

## 👨‍💻 作者

**Joey**
- GitHub: [@byjoey](https://github.com/byjoey)
- 博客: [joeyblog.net](https://joeyblog.net)

---

⭐ 如果这个项目对你有帮助，请给个Star支持一下！

## Star History

<a href="https://www.star-history.com/#byJoey/cmdbox&Timeline">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=byJoey/cmdbox&type=Timeline&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=byJoey/cmdbox&type=Timeline" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=byJoey/cmdbox&type=Timeline" />
 </picture>
</a>
