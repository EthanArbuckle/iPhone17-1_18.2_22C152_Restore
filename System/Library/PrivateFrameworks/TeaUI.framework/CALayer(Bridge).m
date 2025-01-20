@interface CALayer(Bridge)
- (uint64_t)ts_setContinuousCorners:()Bridge;
@end

@implementation CALayer(Bridge)

- (uint64_t)ts_setContinuousCorners:()Bridge
{
  return [a1 setCornerCurve:*MEMORY[0x1E4F39EA8]];
}

@end