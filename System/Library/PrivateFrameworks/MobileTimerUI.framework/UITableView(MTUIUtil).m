@interface UITableView(MTUIUtil)
+ (id)wordWrapParagraphStyle;
- (double)mtui_sectionHeaderHeightWithString:()MTUIUtil;
@end

@implementation UITableView(MTUIUtil)

- (double)mtui_sectionHeaderHeightWithString:()MTUIUtil
{
  v24[2] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F1CA68];
  id v5 = a3;
  v6 = objc_msgSend(v4, "_defaultFontForTableViewStyle:isSectionHeader:", objc_msgSend(a1, "style"), 1);
  [a1 bounds];
  double Width = CGRectGetWidth(v25);
  [a1 _marginWidth];
  double v9 = Width + v8 * -2.0;
  uint64_t v10 = *MEMORY[0x263F1C268];
  v23[0] = *MEMORY[0x263F1C238];
  v23[1] = v10;
  v24[0] = v6;
  v11 = [MEMORY[0x263F1CA40] wordWrapParagraphStyle];
  v24[1] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 1, v12, 0, v9, 0.0);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v26.origin.x = v14;
  v26.origin.y = v16;
  v26.size.width = v18;
  v26.size.height = v20;
  double Height = CGRectGetHeight(v26);

  return Height;
}

+ (id)wordWrapParagraphStyle
{
  if (wordWrapParagraphStyle_onceToken != -1) {
    dispatch_once(&wordWrapParagraphStyle_onceToken, &__block_literal_global_288);
  }
  v0 = (void *)wordWrapParagraphStyle_style;

  return v0;
}

@end