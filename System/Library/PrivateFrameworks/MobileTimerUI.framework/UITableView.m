@interface UITableView
@end

@implementation UITableView

uint64_t __47__UITableView_MTUIUtil__wordWrapParagraphStyle__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F1C350]);
  v1 = (void *)wordWrapParagraphStyle_style;
  wordWrapParagraphStyle_style = (uint64_t)v0;

  v2 = (void *)wordWrapParagraphStyle_style;

  return [v2 setLineBreakMode:0];
}

@end