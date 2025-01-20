@interface UIKBRenderFactory10Key_Portrait
- (CGPoint)dictationKeyTextOffset;
- (CGPoint)globeKeyTextOffset;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (double)controlColumnWidthFactor;
- (id)multitapCompleteKeyImageName;
- (id)muttitapReverseKeyImageName;
- (void)setupLayoutSegments;
@end

@implementation UIKBRenderFactory10Key_Portrait

- (UIEdgeInsets)wideShadowPaddleInsets
{
  double v2 = 18.0;
  double v3 = 6.0;
  double v4 = 28.0;
  double v5 = 6.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)multitapCompleteKeyImageName
{
  return @"kana_multitap_complete_arrow.png";
}

- (id)muttitapReverseKeyImageName
{
  return @"kana_multitap_reverse_arrow.png";
}

- (CGPoint)globeKeyTextOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)dictationKeyTextOffset
{
  double v2 = 0.0;
  double v3 = -1.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)controlColumnWidthFactor
{
  return 0.25;
}

- (void)setupLayoutSegments
{
  [(UIKBRenderFactory10Key_Portrait *)self controlColumnWidthFactor];
  [(UIKBRenderFactory10Key *)self setupColumnLayoutSegmentsWithControlWidth:"setupColumnLayoutSegmentsWithControlWidth:"];
}

@end