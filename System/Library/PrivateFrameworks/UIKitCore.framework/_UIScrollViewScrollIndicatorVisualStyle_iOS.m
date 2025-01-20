@interface _UIScrollViewScrollIndicatorVisualStyle_iOS
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

@implementation _UIScrollViewScrollIndicatorVisualStyle_iOS

- (double)staticDimensionSize
{
  return 3.0;
}

- (id)fillView
{
  v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x1E4F39EA8];
  v4 = [v2 layer];
  [v4 setCornerCurve:v3];

  return v2;
}

- (UIEdgeInsets)cursorHitTestingInsets
{
  double v2 = -5.0;
  double v3 = -10.0;
  double v4 = -5.0;
  double v5 = -10.0;
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

- (id)colorForIndicatorStyle:(int64_t)a3 expanded:(BOOL)a4
{
  switch(a3)
  {
    case 0:
      double v5 = 0.35;
      double v4 = 0.0;
LABEL_8:
      v6 = +[UIColor colorWithWhite:v4 alpha:v5];
      goto LABEL_10;
    case 2:
      double v4 = 1.0;
      goto LABEL_7;
    case 1:
      double v4 = 0.0;
LABEL_7:
      double v5 = 0.5;
      goto LABEL_8;
  }
  v6 = 0;
LABEL_10:
  return v6;
}

- (double)fillViewCornerRadiusForStaticDimensionSize:(double)a3
{
  return a3 * 0.5;
}

- (double)staticDimensionExpandedSize
{
  return 8.0;
}

- (BOOL)doesExpand
{
  return 1;
}

- (CGRect)hitTestingRectForIndicatorRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UIScrollViewScrollIndicatorVisualStyle_iOS *)self cursorHitTestingInsets];
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

- ($600A803A2DA5524344F8C742CF1B11BB)valuesForLayoutSizeAnimationWhenExpanding:(SEL)a3
{
  double v4 = 0.3;
  if (a4) {
    double v4 = 0.2;
  }
  retstr->var0 = v4;
  *(_OWORD *)&retstr->var1 = xmmword_186B89740;
  retstr->var3 = 0.0;
  retstr->var4 = 0;
  return self;
}

- (id)feedbackGeneratorWithView:(id)a3
{
  id v3 = a3;
  double v4 = [[_UIClickFeedbackGenerator alloc] initWithView:v3];

  return v4;
}

@end