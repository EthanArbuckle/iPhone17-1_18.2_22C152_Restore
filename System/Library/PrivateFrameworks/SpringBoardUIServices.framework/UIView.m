@interface UIView
@end

@implementation UIView

uint64_t __84__UIView_SBUISystemAperturePrivate__SBUISA_systemApertureLayoutGuideWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __93__UIView_SBUISystemApertureAnimationParameters__SBUISA_performWithoutAnimationOrRetargeting___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:*(void *)(a1 + 32)];
}

@end