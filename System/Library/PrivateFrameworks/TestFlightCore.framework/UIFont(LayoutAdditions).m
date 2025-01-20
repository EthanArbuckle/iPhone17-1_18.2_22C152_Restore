@interface UIFont(LayoutAdditions)
- (double)tf_estimatedFirstBaseline;
- (void)tf_computeFittedLineHeight;
@end

@implementation UIFont(LayoutAdditions)

- (double)tf_estimatedFirstBaseline
{
  [a1 lineHeight];
  double v3 = v2;
  [a1 descender];
  return v3 + v4;
}

- (void)tf_computeFittedLineHeight
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F1C238];
  v11[0] = a1;
  v1 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  objc_msgSend(&stru_26D6133F8, "boundingRectWithSize:options:attributes:context:", 3, v1, 0, 1.79769313e308, 1.79769313e308);
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;

  v12.origin.x = v3;
  v12.origin.y = v5;
  v12.size.width = v7;
  v12.size.height = v9;
  CGRectGetHeight(v12);
}

@end