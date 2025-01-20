@interface KNTransitionWipe
+ (BOOL)isTransition;
+ (id)supportedTypes;
- (void)animationWillBeginWithContext:(id)a3;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNTransitionWipe

+ (BOOL)isTransition
{
  return 1;
}

+ (id)supportedTypes
{
  return &off_4998C0;
}

- (void)animationWillBeginWithContext:(id)a3
{
  p_frameRect = &self->super._frameRect;
  [(KNAnimationContext *)self->super.super.mAnimationContext slideRect];
  p_frameRect->origin.x = v6;
  p_frameRect->origin.y = v7;
  p_frameRect->size.width = v8;
  p_frameRect->size.height = v9;
  v10.receiver = self;
  v10.super_class = (Class)KNTransitionWipe;
  [(KNWipeBase *)&v10 animationWillBeginWithContext:a3];
}

- (void)renderFrameWithContext:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)KNTransitionWipe;
  [(KNWipeBase *)&v3 renderFrameWithContext:a3];
}

@end