@interface UIKBRenderFactory10Key_Landscape
- (CGPoint)abcKeyTextOffset;
- (CGPoint)longVowelSignKeyTextOffset;
- (CGPoint)numberPadKeyPrimaryTextOffset;
- (CGPoint)numberPadKeySecondaryTextOffset;
- (CGPoint)numberPadVBarSecondaryTextOffset;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)capitalAbcSymbolSize;
- (double)centerColumnWidthFactor;
- (double)controlColumnWidthFactor;
- (double)numberPadKeyPrimarySymbolSize;
- (void)setupColumnLayoutSegmentsWithControlWidth:(double)a3;
@end

@implementation UIKBRenderFactory10Key_Landscape

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2 = 18.0;
  double v3 = 6.0;
  double v4 = 22.0;
  double v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)abcKeyTextOffset
{
  double v2 = 0.0;
  double v3 = 0.5;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)capitalAbcSymbolSize
{
  return 13.0;
}

- (CGPoint)longVowelSignKeyTextOffset
{
  double v2 = 8.0;
  double v3 = 13.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)numberPadKeyPrimarySymbolSize
{
  return 18.5;
}

- (CGPoint)numberPadKeyPrimaryTextOffset
{
  double v2 = 0.0;
  double v3 = -6.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadKeySecondaryTextOffset
{
  double v2 = 1.0;
  double v3 = 8.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)numberPadVBarSecondaryTextOffset
{
  [(UIKBRenderFactory *)self scale];
  double v2 = 8.5;
  if (v3 != 2.0) {
    double v2 = 9.0;
  }
  double v4 = 1.0;
  result.y = v2;
  result.x = v4;
  return result;
}

- (double)controlColumnWidthFactor
{
  return 0.114;
}

- (double)centerColumnWidthFactor
{
  return 0.875;
}

- (void)setupColumnLayoutSegmentsWithControlWidth:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIKBRenderFactory10Key_Landscape;
  [(UIKBRenderFactory10Key *)&v11 setupColumnLayoutSegmentsWithControlWidth:sel_setupColumnLayoutSegmentsWithControlWidth_];
  [(UIKBRenderFactory10Key_Landscape *)self centerColumnWidthFactor];
  double v6 = v5 * a3;
  v7 = [(UIKBRenderFactory10Key_Round *)self controlKeyTraits];
  v8 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v7];

  [v8 setKeyStates:3];
  objc_msgSend(v8, "addLayoutRect:asTriangle:", 0, 0.5 - v6 * 0.5, 0.0, v6, 1.0);
  [(UIKBRenderFactory *)self addLayoutSegment:v8];
  v9 = [(UIKBRenderFactory10Key_Round *)self activeControlKeyTraits];
  v10 = +[UIKBRenderFactoryLayoutSegment segmentWithTraits:v9];

  [v10 setKeyStates:4];
  objc_msgSend(v10, "addLayoutRect:asTriangle:", 0, 0.5 - v6 * 0.5, 0.0, v6, 1.0);
  [(UIKBRenderFactory *)self addLayoutSegment:v10];
}

@end