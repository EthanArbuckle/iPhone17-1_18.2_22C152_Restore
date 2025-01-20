@interface UILabel(UIAccessibility)
- (uint64_t)accessibilityExposeLabelAsValue;
- (uint64_t)setAccessibilityExposeLabelAsValue:()UIAccessibility;
@end

@implementation UILabel(UIAccessibility)

- (uint64_t)accessibilityExposeLabelAsValue
{
  return MEMORY[0x1F4106398](a1, &__UILabel__accessibilityExposeLabelAsValue);
}

- (uint64_t)setAccessibilityExposeLabelAsValue:()UIAccessibility
{
  return MEMORY[0x1F41063D0](a1, &__UILabel__accessibilityExposeLabelAsValue);
}

@end