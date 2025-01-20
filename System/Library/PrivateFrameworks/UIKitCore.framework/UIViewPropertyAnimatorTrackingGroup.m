@interface UIViewPropertyAnimatorTrackingGroup
@end

@implementation UIViewPropertyAnimatorTrackingGroup

uint64_t __93___UIViewPropertyAnimatorTrackingGroup_continueAnimationWithTimingParameters_durationFactor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 continueAnimationWithTimingParameters:*(void *)(a1 + 32) durationFactor:*(double *)(a1 + 40)];
}

uint64_t __52___UIViewPropertyAnimatorTrackingGroup_setReversed___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setReversed:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __60___UIViewPropertyAnimatorTrackingGroup_setFractionComplete___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFractionComplete:*(double *)(a1 + 32)];
}

uint64_t __54___UIViewPropertyAnimatorTrackingGroup_startAnimation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 startAnimation];
}

uint64_t __65___UIViewPropertyAnimatorTrackingGroup_startAnimationAfterDelay___block_invoke(uint64_t a1, void *a2)
{
  return [a2 startAnimationAfterDelay:*(double *)(a1 + 32)];
}

uint64_t __54___UIViewPropertyAnimatorTrackingGroup_pauseAnimation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pauseAnimation];
}

uint64_t __54___UIViewPropertyAnimatorTrackingGroup_stopAnimation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stopAnimation:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __66___UIViewPropertyAnimatorTrackingGroup_finishAnimationAtPosition___block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishAnimationAtPosition:*(void *)(a1 + 32)];
}

@end