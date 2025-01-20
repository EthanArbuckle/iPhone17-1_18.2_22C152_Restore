@interface NSObject(UIKitAccessibilityAutomation)
- (id)accessibilityLocalizedStringKey;
@end

@implementation NSObject(UIKitAccessibilityAutomation)

- (id)accessibilityLocalizedStringKey
{
  return objc_getAssociatedObject(a1, &AXLocalizedStringKeyIdentifier);
}

@end