@interface UIKBRenderFactoryHWR_PortraitTruffle
- (CGPoint)globeKeyTextOffset;
- (CGPoint)moreKeyTextOffset;
- (UIEdgeInsets)symbolFrameInsets;
- (double)symbolImageControlKeyFontSize;
@end

@implementation UIKBRenderFactoryHWR_PortraitTruffle

- (CGPoint)moreKeyTextOffset
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)globeKeyTextOffset
{
  double v2 = -0.3333;
  double v3 = -0.3333;
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2 = 1.0;
  double v3 = 2.0;
  double v4 = 4.0;
  double v5 = 2.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)symbolImageControlKeyFontSize
{
  return 20.0;
}

@end