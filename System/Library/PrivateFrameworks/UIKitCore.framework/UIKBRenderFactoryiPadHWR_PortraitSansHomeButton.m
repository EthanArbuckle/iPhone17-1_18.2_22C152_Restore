@interface UIKBRenderFactoryiPadHWR_PortraitSansHomeButton
- (BOOL)_anchorControlKeys;
- (CGPoint)_controlKeyOffset;
@end

@implementation UIKBRenderFactoryiPadHWR_PortraitSansHomeButton

- (BOOL)_anchorControlKeys
{
  return 1;
}

- (CGPoint)_controlKeyOffset
{
  [(UIKBRenderFactory *)self RivenFactor:9.0];
  double v4 = v3;
  [(UIKBRenderFactory *)self RivenFactor:8.0];
  double v6 = v5;
  double v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

@end