@interface CALayer
+ (void)cancelAnimation:(uint64_t)a1;
- (void)scheduleAnimation:(double)a3 atTime:(float)a4 maxVelocityInPixels:;
@end

@implementation CALayer

- (void)scheduleAnimation:(double)a3 atTime:(float)a4 maxVelocityInPixels:
{
  if (a1)
  {
    v7 = (_anonymous_namespace_::AnimationTimer *)[a1 screen];
  }
}

+ (void)cancelAnimation:(uint64_t)a1
{
  v3 = (_anonymous_namespace_::AnimationTimer *)self;
}

@end