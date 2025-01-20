@interface PXConsoleViewController
@end

@implementation PXConsoleViewController

void __41___PXConsoleViewController_appendOutput___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) _textView];
  int v2 = objc_msgSend(v9, "px_isScrolledAtEdge:", 3);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F00B0030];
  v4 = [v9 attributedText];
  if ([v4 length])
  {
    [v3 appendAttributedString:v4];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
    [v3 appendAttributedString:v5];
  }
  [v3 appendAttributedString:*(void *)(a1 + 40)];
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  v7 = [MEMORY[0x1E4FB1618] labelColor];
  objc_msgSend(v3, "addAttribute:value:range:", v6, v7, 0, objc_msgSend(v3, "length"));

  [v9 setAttributedText:v3];
  if (v2) {
    objc_msgSend(v9, "px_scrollToEdge:animated:", 3, 0);
  }
  v8 = [*(id *)(a1 + 40) string];
  NSLog(&stru_1F00AFD50.isa, v8);
}

@end