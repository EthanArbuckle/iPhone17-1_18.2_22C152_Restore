@interface UIBezierPath(Silex)
- (id)TSDBezierPath;
@end

@implementation UIBezierPath(Silex)

- (id)TSDBezierPath
{
  v2 = [MEMORY[0x263F7C690] bezierPath];
  CGPathApply((CGPathRef)[a1 CGPath], v2, (CGPathApplierFunction)UIBezierPathSilexPathApplier);
  return v2;
}

@end