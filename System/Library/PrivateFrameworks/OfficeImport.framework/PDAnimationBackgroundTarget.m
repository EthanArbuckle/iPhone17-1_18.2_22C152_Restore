@interface PDAnimationBackgroundTarget
- (PDAnimationBackgroundTarget)init;
@end

@implementation PDAnimationBackgroundTarget

- (PDAnimationBackgroundTarget)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimationBackgroundTarget;
  return [(PDAnimationShapeTarget *)&v3 init];
}

@end