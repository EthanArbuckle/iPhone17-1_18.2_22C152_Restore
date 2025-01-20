@interface NSObject(UIAccessibilityFocus)
- (uint64_t)accessibilityAssistiveTechnologyFocusedIdentifiers;
- (uint64_t)accessibilityElementIsFocused;
@end

@implementation NSObject(UIAccessibilityFocus)

- (uint64_t)accessibilityElementIsFocused
{
  return 0;
}

- (uint64_t)accessibilityAssistiveTechnologyFocusedIdentifiers
{
  return 0;
}

@end