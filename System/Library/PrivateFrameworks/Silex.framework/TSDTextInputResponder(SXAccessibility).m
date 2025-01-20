@interface TSDTextInputResponder(SXAccessibility)
- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:()SXAccessibility withSender:;
@end

@implementation TSDTextInputResponder(SXAccessibility)

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:()SXAccessibility withSender:
{
  return NSSelectorFromString(&cfstr_Accessibilitys.isa) == a3 || NSSelectorFromString(&cfstr_Accessibilityp.isa) == a3;
}

@end