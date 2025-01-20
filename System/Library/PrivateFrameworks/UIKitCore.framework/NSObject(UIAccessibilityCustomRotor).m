@interface NSObject(UIAccessibilityCustomRotor)
- (id)accessibilityCustomRotors;
- (uint64_t)setAccessibilityCustomRotorsBlock:()UIAccessibilityCustomRotor;
- (void)setAccessibilityCustomRotors:()UIAccessibilityCustomRotor;
@end

@implementation NSObject(UIAccessibilityCustomRotor)

- (void)setAccessibilityCustomRotors:()UIAccessibilityCustomRotor
{
}

- (id)accessibilityCustomRotors
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:40];
  v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else {
  v4 = objc_getAssociatedObject(a1, &AXCustomRotors);
  }

  return v4;
}

- (uint64_t)setAccessibilityCustomRotorsBlock:()UIAccessibilityCustomRotor
{
  return [a1 _accessibilitySetReturnBlock:a3 forAttribute:40];
}

@end