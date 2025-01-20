@interface _UIScrollViewScrollIndicatorFallbackVisualStyle
- ($600A803A2DA5524344F8C742CF1B11BB)valuesForLayoutSizeAnimationWhenExpanding:(SEL)a3;
- (BOOL)clipsToBounds;
- (BOOL)doesExpand;
- (CGRect)hitTestingRectForIndicatorRect:(CGRect)a3;
- (UIEdgeInsets)cursorHitTestingInsets;
- (double)fillViewCornerRadiusForStaticDimensionSize:(double)a3;
- (double)staticDimensionExpandedSize;
- (double)staticDimensionSize;
- (id)colorForIndicatorStyle:(int64_t)a3 expanded:(BOOL)a4;
- (id)feedbackGeneratorWithView:(id)a3;
- (id)fillView;
@end

@implementation _UIScrollViewScrollIndicatorFallbackVisualStyle

- (id)fillView
{
  v2 = objc_opt_new();
  return v2;
}

- (double)staticDimensionSize
{
  return 3.0;
}

- (double)staticDimensionExpandedSize
{
  return 3.0;
}

- (double)fillViewCornerRadiusForStaticDimensionSize:(double)a3
{
  return 1.5;
}

- (CGRect)hitTestingRectForIndicatorRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UIScrollViewScrollIndicatorFallbackVisualStyle *)self cursorHitTestingInsets];
  double v8 = y + v7;
  double v11 = width - (v9 + v10);
  double v13 = height - (v7 + v12);
  double v14 = x + v9;
  double v15 = v8;
  double v16 = v11;
  result.size.double height = v13;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (UIEdgeInsets)cursorHitTestingInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)clipsToBounds
{
  return 0;
}

- (BOOL)doesExpand
{
  return 1;
}

- (id)colorForIndicatorStyle:(int64_t)a3 expanded:(BOOL)a4
{
  return +[UIColor systemFillColor];
}

- ($600A803A2DA5524344F8C742CF1B11BB)valuesForLayoutSizeAnimationWhenExpanding:(SEL)a3
{
  retstr->var4 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return self;
}

- (id)feedbackGeneratorWithView:(id)a3
{
  id v3 = a3;
  double v4 = [[_UIClickFeedbackGenerator alloc] initWithView:v3];

  return v4;
}

@end