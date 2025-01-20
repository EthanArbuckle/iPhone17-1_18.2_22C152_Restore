@interface UIView(SBPIPAdditions)
+ (uint64_t)SBPIP_animateUsingDefaultTimingWithAnimations:()SBPIPAdditions completion:;
+ (void)SBPIP_animateUsingDefaultTimingWithOptions:()SBPIPAdditions animations:completion:;
+ (void)SBPIP_performWithoutRetargetingAnimation:()SBPIPAdditions;
- (uint64_t)SBPIP_allowsEdgeAntialiasing;
- (uint64_t)SBPIP_allowsGroupBlending;
- (void)SBPIP_setAllowsEdgeAntialiasing:()SBPIPAdditions;
- (void)SBPIP_setAllowsGroupBlending:()SBPIPAdditions;
@end

@implementation UIView(SBPIPAdditions)

- (uint64_t)SBPIP_allowsEdgeAntialiasing
{
  v1 = [a1 layer];
  uint64_t v2 = [v1 allowsEdgeAntialiasing];

  return v2;
}

- (void)SBPIP_setAllowsEdgeAntialiasing:()SBPIPAdditions
{
  v5 = [a1 layer];
  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  objc_msgSend(v5, "setContentsScale:");

  id v7 = [a1 layer];
  [v7 setAllowsEdgeAntialiasing:a3];
}

- (uint64_t)SBPIP_allowsGroupBlending
{
  v1 = [a1 layer];
  uint64_t v2 = [v1 allowsGroupBlending];

  return v2;
}

- (void)SBPIP_setAllowsGroupBlending:()SBPIPAdditions
{
  id v4 = [a1 layer];
  [v4 setAllowsGroupBlending:a3];
}

+ (void)SBPIP_performWithoutRetargetingAnimation:()SBPIPAdditions
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__UIView_SBPIPAdditions__SBPIP_performWithoutRetargetingAnimation___block_invoke;
  v6[3] = &unk_1E6AF5300;
  id v7 = v4;
  id v5 = v4;
  [a1 _performWithoutRetargetingAnimations:v6];
}

+ (uint64_t)SBPIP_animateUsingDefaultTimingWithAnimations:()SBPIPAdditions completion:
{
  return objc_msgSend(a1, "SBPIP_animateUsingDefaultTimingWithOptions:animations:completion:", 0, a3, a4);
}

+ (void)SBPIP_animateUsingDefaultTimingWithOptions:()SBPIPAdditions animations:completion:
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__UIView_SBPIPAdditions__SBPIP_animateUsingDefaultTimingWithOptions_animations_completion___block_invoke;
  v10[3] = &unk_1E6AFE440;
  id v11 = v8;
  v12 = a1;
  id v9 = v8;
  [a1 _animateUsingDefaultTimingWithOptions:a3 animations:v10 completion:a5];
}

@end