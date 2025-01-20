@interface UIViewKeyValueAnimationFactory
@end

@implementation UIViewKeyValueAnimationFactory

uint64_t __91___UIViewKeyValueAnimationFactory_animationsTransitioningFromAnimation_toAnimation_onView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setFromAnimation:a2];
}

uint64_t __91___UIViewKeyValueAnimationFactory_animationsTransitioningFromAnimation_toAnimation_onView___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setToAnimation:a2];
}

@end