@interface PDAnimationSoundTarget
- (PDAnimationSoundTarget)init;
@end

@implementation PDAnimationSoundTarget

- (PDAnimationSoundTarget)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDAnimationSoundTarget;
  return [(PDAnimationShapeTarget *)&v3 init];
}

- (void).cxx_destruct
{
}

@end