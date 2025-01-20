@interface UISheetTransitionTimingCurve
@end

@implementation UISheetTransitionTimingCurve

void ___UISheetTransitionTimingCurve_block_invoke()
{
  v0 = [UISpringTimingParameters alloc];
  _UISheetTransitionSpringParametersHighSpeed(0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = -[UISpringTimingParameters initWithParameters:initialVelocity:](v0, "initWithParameters:initialVelocity:", v3, 0.0, 0.0);
  v2 = (void *)_MergedGlobals_1003;
  _MergedGlobals_1003 = v1;
}

@end