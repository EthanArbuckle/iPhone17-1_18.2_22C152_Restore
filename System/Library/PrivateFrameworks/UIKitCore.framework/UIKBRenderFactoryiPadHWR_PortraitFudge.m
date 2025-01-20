@interface UIKBRenderFactoryiPadHWR_PortraitFudge
- (BOOL)_anchorControlKeys;
- (CGPoint)_controlKeyOffset;
- (UIEdgeInsets)symbolFrameInsets;
@end

@implementation UIKBRenderFactoryiPadHWR_PortraitFudge

- (BOOL)_anchorControlKeys
{
  return 1;
}

- (UIEdgeInsets)symbolFrameInsets
{
  double v2 = 3.0;
  double v3 = 3.0;
  double v4 = 3.0;
  double v5 = 3.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGPoint)_controlKeyOffset
{
  [(UIKBRenderFactory *)self RivenFactor:16.0];
  double v4 = v3;
  [(UIKBRenderFactory *)self RivenFactor:8.0];
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

@end