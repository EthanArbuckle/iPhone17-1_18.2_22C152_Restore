@interface UIPageViewController(UIAccessibility)
- (uint64_t)accessibilityScreenChangeOnScroll;
- (uint64_t)setAccessibilityScreenChangeOnScroll:()UIAccessibility;
@end

@implementation UIPageViewController(UIAccessibility)

- (uint64_t)accessibilityScreenChangeOnScroll
{
  return MEMORY[0x1F4106398](a1, &__UILabel__accessibilityScreenChangeOnScroll);
}

- (uint64_t)setAccessibilityScreenChangeOnScroll:()UIAccessibility
{
  return MEMORY[0x1F41063D0](a1, &__UILabel__accessibilityScreenChangeOnScroll);
}

@end