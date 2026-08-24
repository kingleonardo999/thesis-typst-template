# Typst 多模板项目

一个基于 [Typst](https://typst.com/) 的学术文档模板集合，支持多种文档类型，模版格式符合学校规范。

## 模板列表

| 模板 | 目录 | 状态 |
|------|------|------|
| 企业实习总结报告 | `internship-report/` | ✅ 可用 |
| 毕业论文 | — | 🚧 开发中 |

## 快速开始

### 安装 Typst编译器

**命令行包管理器安装**

```bash
# Windows (scoop)
scoop install typst

# macOS
brew install typst

# Linux
sudo apt install typst
```

**Typst Github Releases平台**

从`github`下载相应系统的二进制文件, 解压后把可执行文件所在目录加入`PATH` : https://github.com/typst/typst/releases

### 编译

```bash
# 编译实习报告
typst compile internship-report/main.typ

# 监听变化自动编译
typst watch internship-report/main.typ
```

VSCode 用户推荐安装 [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) 扩展，支持语法高亮、自动补全和实时预览。

## 项目结构

```
├── internship-report/      # 企业实习总结报告模板
│   ├── main.typ            # 入口文件
│   ├── utils.typ           # 公共函数与配置
│   ├── cover.typ           # 封面
│   ├── abstract.typ        # 中英文摘要
│   ├── content.typ         # 正文（含样式示例）
│   ├── acknowledgements.typ # 致谢
│   ├── refs.bib            # 参考文献
│   └── images/             # 图片资源
│
├── thesis/                 # 毕业论文模板（待添加）
├── .gitignore
└── README.md
```

## 特性

- **Typst 原生**：无需 LaTeX 环境，秒级编译
- **GB/T 7714 参考文献**：内置国家标准格式，支持中英文双语
- **自动编号**：图、表、代码块按章自动编号，随章节重置
- **Git 友好**：纯文本源码，方便版本控制和协作

## 参考文献管理

推荐使用 [Zotero](https://www.zotero.org/) 管理文献，通过 Better BibTeX 插件导出 `.bib` 文件，替换各模板目录下的 `refs.bib` 即可。

## License

[MIT](LICENSE)