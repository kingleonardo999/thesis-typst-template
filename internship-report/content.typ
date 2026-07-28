#import "utils.typ" : *
#import "@preview/gb7714-bilingual:0.2.3": init-gb7714, gb7714-bibliography, multicite
#show: init-gb7714.with(read("refs.bib"), style: "numeric", version: "2025")
#header-state.update(none)
#set page(header: report-header, footer: report-footer, numbering: "1")
#counter(page).update(1)
// --- 正文开始 ---
= 样式示例

本章集中展示模板中所有样式元素的用法，编写正式报告时请删除本章内容。

== 标题

=== 三级标题

==== 四级标题

正文使用宋体小四号字（12pt），行距 20pt，首行缩进两字符。*粗体文本*用于强调关键概念，中文粗体通过描边模拟实现，英文粗体使用字体自身的 *Bold* 字重。英文斜体使用字体自身的 _Italic_ 字重。

== 有序列表

+ 有序列表第一项，使用 + 开头，自动编号为"（1）（2）..."格式
+ 有序列表第二项，列表项之间自动保持间距
+ 有序列表第三项

列表之间可以插入普通段落。段落具有首行缩进，与列表明确区分。测试普通段落的首行缩进效果。列表项之间的间距与普通段落的间距相同。

#resume(4)[+ 续号示例：从编号（4）继续]
#resume(5)[+ 续号示例：第五项]


== 无序列表

- 一级无序列表项，使用 - 开头
- 一级无序列表项
  - 二级无序列表项，前面加两个空格缩进
  - 二级无序列表项
- 回到一级列表项

== 图

使用 #raw(lang: "typst", "#fig()") 函数插入图片，图题自动按"图 章-序号"编号，置于图下方。

#fig("电子科技大学 Logo", [
  #image("images/电子科技大学-logo-512px.png", width: 40%)
])

在正文中引用图时，直接写"如图 1-1 所示"即可。

== 表

使用 #raw(lang: "typst", "#tbl()") 函数插入表格，表题自动按"表 章-序号"编号，置于表上方。

#tbl("模型性能对比", table(
  columns: 4,
  align: center,
  stroke: 0.5pt,
  [模型], [准确率], [延迟], [成本],
  [Model A], [92%], [150ms], [高],
  [Model B], [85%], [45ms], [低],
  [Model C], [88%], [80ms], [中],
))

== 代码块

使用 #raw(lang: "typst", "#codefig()") 函数展示代码，标题自动按"代码 章-序号"编号，置于代码上方。

#codefig("Go HTTP 服务示例", [
  ```go
  package main

  import (
      "fmt"
      "net/http"
  )

  func handler(w http.ResponseWriter, r *http.Request) {
      fmt.Fprintf(w, "Hello, World!")
  }

  func main() {
      http.HandleFunc("/", handler)
      http.ListenAndServe(":8080", nil)
  }
  ```
])

== 公式

行内公式使用 #raw(lang: "typst", "$...$") 包裹，如 $E = m c^2$ 嵌入在正文中。

独立公式#raw(lang: "typst", "$ ... $")自动居中并编号：

$ f(x) = frac(1, sqrt(2 pi sigma^2)) exp(-frac((x - mu)^2, 2 sigma^2)) $

多行公式示例：

$ cases(
  x & "if " x >= 0,
  -x & "otherwise"
) $

== 参考文献引用

参考文献使用 #raw(lang: "typst", "@key") 格式引用，自动渲染为上标。例如，检索增强生成技术@lewis2020rag 将外部知识检索与生成模型相结合。

引用多篇文献时，连续输入多个引用键（无空格）会自动合并为 #raw(lang: "typst", "@key1@key2") 格式，显示为 [1,2]。连续编号会缩并为区间，如 #multicite("lewis2020rag", "cheng2026text","chen2026mfsca"
) 显示为 [1-3]。

在 #raw(lang: "typst", "refs.bib") 中定义的文献条目，只有在正文中被引用过的才会出现在参考文献列表中。

== 粗体与强调

这是 *粗体文本*，用于强调关键词或重要概念。粗体在中文中使用描边模拟，在英文中使用 *Bold* 字重。

// ============================================================================
// 第二章：正式章节示例（编写报告时以此为参考）
// ============================================================================
= 第二章标题

== 第一节标题

=== 第一小节标题

在此撰写正文内容。正文使用宋体小四号字（12pt），行距 20pt，首行缩进两字符。

=== 第二小节标题

在此撰写正文内容@song2026vector。

== 第二节标题

在此撰写正文内容#multicite("chen2020gpu","huang2026SkillSelfPlay")。

// ============================================================================
// 后续章节以此类推...
// ============================================================================
