@interface UIView(SBUISystemApertureStyling)
- (void)sbui_systemApertureApplyMinimumAndMaximumContentSizeCategoryForCustomLayoutMode:()SBUISystemApertureStyling;
@end

@implementation UIView(SBUISystemApertureStyling)

- (void)sbui_systemApertureApplyMinimumAndMaximumContentSizeCategoryForCustomLayoutMode:()SBUISystemApertureStyling
{
  [a1 setMinimumContentSizeCategory:*MEMORY[0x1E4F437B0]];
  id v6 = [a1 traitCollection];
  v5 = objc_msgSend(v6, "sbui_preferredContentSizeCategoryAllowingTraitsForCustomLayoutMode:", a3);
  [a1 setMaximumContentSizeCategory:v5];
}

@end