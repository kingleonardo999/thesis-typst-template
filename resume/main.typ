// ============================================================================
// Resume Template — Claude Code inspired
// A4 单页；只需编辑下方 Content 区域
// ============================================================================

// ----------------------------------------------------------------------------
// Palette & layout
// ----------------------------------------------------------------------------
#let sidebar-color = rgb("#4a4641")
#let accent-color = rgb("#c9785f")
#let bg-color = rgb("#f4f0ea")
#let sidebar-text = rgb("#f5f0e9")
#let sidebar-dim = rgb("#d2c8bc")
#let body-text = rgb("#393530")
#let body-dim = rgb("#716a61")
#let rule-color = rgb("#d4ccc2")

#let sidebar-width = 6.55cm
#let base-size = 9.5pt

#set page(paper: "a4", margin: 0pt, fill: bg-color)
#set text(font: "Microsoft YaHei", size: base-size, fill: body-text)
#set par(leading: 0.62em, justify: false)

// ----------------------------------------------------------------------------
// Content — 在这里填你的信息
// ----------------------------------------------------------------------------
#let my-name = "YOUR NAME"
#let my-title = "职位头衔 · 方向"

#let my-contact = (
  ("电话", "138-0000-0000"),
  ("邮箱", "you@example.com"),
  ("主页", "github.com/you"),
  ("地点", "中国 · 上海"),
)

#let my-skills = (
  ("语言", "TypeScript · Rust · Go · Python"),
  ("前端", "Vue · React · Tailwind CSS"),
  ("后端", "Node.js · Actix · gRPC · Postgres"),
  ("工具", "Git · Docker · CI/CD · Neovim"),
)

#let my-summary = "一两句话自我定位：突出最核心的竞争力与价值主张，控制在两行以内。"

#let my-experience = (
  (
    title: "软件开发工程师",
    meta: "某公司 · 2022.07 — 至今",
    body: (
      "负责 XX 核心服务的架构设计与落地，支撑日均 XXX 次请求。",
      "主导 XX 模块重构，将响应延迟降低 40%，运维成本下降 30%。",
      "推动团队工程化建设，引入 CI/CD 与代码审查规范。",
    ),
  ),
  (
    title: "软件开发实习生",
    meta: "某团队 · 2021.06 — 2021.09",
    body: (
      "参与 XX 系统的开发与调试，修复线上 Bug 30+。",
      "编写单元测试，将关键模块覆盖率提升至 85%。",
    ),
  ),
)

#let my-education = (
  (
    title: "某大学",
    meta: "计算机科学与技术 · 本科 · 2018 — 2022",
    body: (
      "主修：数据结构、操作系统、计算机网络、数据库系统。",
      "GPA 3.8/4.0，获校一等奖学金。",
    ),
  ),
)

// ----------------------------------------------------------------------------
// Components
// ----------------------------------------------------------------------------
#let side-header(title) = block[
  #text(size: 8pt, weight: "bold", fill: accent-color, tracking: 0.06em, title)
  #v(4pt)
  #rect(width: 1.45cm, height: 1.4pt, fill: accent-color)
]

#let body-header(title) = block(width: 100%)[
  #text(size: 11pt, weight: "bold", fill: body-text, title)
  #v(3pt)
  #rect(width: 100%, height: 0.45pt, fill: rule-color)
]

#let contact-row(label, value) = block(width: 100%)[
  #grid(
    columns: (0.9cm, 1fr),
    column-gutter: 0.15cm,
  )[
  #text(size: 8.5pt, weight: "bold", fill: sidebar-dim, label)
  #text(size: 8.7pt, fill: sidebar-text, value)
  ]
]

#let exp-item(title, meta, body) = block(width: 100%)[
  #text(size: 9.5pt, weight: "bold", fill: body-text, title)
  #v(1.5pt)
  #text(size: 8.6pt, fill: body-dim, meta)
  #v(4pt)
  #for line in body [
    #text(size: 8.5pt, fill: accent-color)[•]
    #h(4pt)
    #text(size: 8.9pt, fill: body-text)[#line]
    #linebreak()
    #v(1.5pt)
  ]
]

// ----------------------------------------------------------------------------
// Page
// 侧栏采用独立定位层；正文通过左边距预留侧栏宽度，二者不会重叠。
// ----------------------------------------------------------------------------
#place(top + left)[
  #rect(width: sidebar-width, height: 29.7cm, fill: sidebar-color)
]

#place(top + left)[
  #pad(left: 0.7cm, right: 0.62cm, top: 0.88cm, bottom: 0.7cm)[
    #text(size: 22pt, weight: "bold", fill: white, my-name)
    #v(5pt)
    #text(size: 9.5pt, weight: "medium", fill: accent-color, my-title)
    #v(18pt)
    #side-header("联系方式")
    #v(10pt)
    #for (label, value) in my-contact [ #contact-row(label, value) #v(8pt) ]
    #v(7pt)
    #side-header("专业技能")
    #v(10pt)
    #for (group, items) in my-skills [
      #text(size: 8.5pt, weight: "bold", fill: accent-color, group)
      #v(2pt)
      #text(size: 8.7pt, fill: sidebar-text)[#items]
      #v(10pt)
    ]
  ]
]

#pad(left: sidebar-width + 0.78cm, right: 0.95cm, top: 0.82cm, bottom: 0.7cm)[
  #body-header("个人简介")
  #v(6pt)
  #text(size: 9.2pt, fill: body-text)[#my-summary]
  #v(14pt)

  #body-header("工作经历")
  #v(8pt)
  #for e in my-experience [ #exp-item(e.title, e.meta, e.body) #v(10pt) ]

  #body-header("教育经历")
  #v(8pt)
  #for e in my-education [ #exp-item(e.title, e.meta, e.body) #v(10pt) ]
]
