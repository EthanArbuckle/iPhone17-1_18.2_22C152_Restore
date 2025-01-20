@interface UIPopoverPresentationMetrics
@end

@implementation UIPopoverPresentationMetrics

uint64_t __54___UIPopoverPresentationMetrics_defaultPopoverMetrics__block_invoke()
{
  v0 = objc_alloc_init(_UIPopoverPresentationMetrics);
  v1 = (void *)_MergedGlobals_1043;
  _MergedGlobals_1043 = (uint64_t)v0;

  [(id)_MergedGlobals_1043 setShouldHideArrow:0];
  [(id)_MergedGlobals_1043 setShouldUseVisualStyleAnimationControllerForDismissal:0];
  [(id)_MergedGlobals_1043 setShouldUseVisualStyleAnimationControllerForPresentation:0];
  v2 = (void *)_MergedGlobals_1043;
  return [v2 setCornerRadius:0.0];
}

@end