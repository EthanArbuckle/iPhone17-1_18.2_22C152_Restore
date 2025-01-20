@interface UIColor(SBUISystemApertureStyling)
+ (uint64_t)sbui_inactiveColor;
@end

@implementation UIColor(SBUISystemApertureStyling)

+ (uint64_t)sbui_inactiveColor
{
  return [MEMORY[0x1E4F428B8] colorWithWhite:0.368627451 alpha:1.0];
}

@end