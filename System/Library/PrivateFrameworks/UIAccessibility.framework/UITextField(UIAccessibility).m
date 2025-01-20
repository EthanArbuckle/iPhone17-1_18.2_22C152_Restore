@interface UITextField(UIAccessibility)
- (uint64_t)accessibilityValueChangesAreReplacements;
- (uint64_t)setAccessibilityValueChangesAreReplacements:()UIAccessibility;
@end

@implementation UITextField(UIAccessibility)

- (uint64_t)accessibilityValueChangesAreReplacements
{
  return MEMORY[0x1F4106398](a1, &__UILabel__accessibilityValueChangesAreReplacements);
}

- (uint64_t)setAccessibilityValueChangesAreReplacements:()UIAccessibility
{
  return MEMORY[0x1F41063D0](a1, &__UILabel__accessibilityValueChangesAreReplacements);
}

@end