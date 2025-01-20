@interface NSObject(AccessibilityBridging)
- (id)ts_accessibilityLeafDescendants;
@end

@implementation NSObject(AccessibilityBridging)

- (id)ts_accessibilityLeafDescendants
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = [MEMORY[0x1E4FB0688] defaultVoiceOverOptions];
  v4 = [a1 _accessibilityLeafDescendantsWithOptions:v3];
  if (v4) {
    [v2 axSafelyAddObjectsFromArray:v4];
  }
  v5 = (void *)[v2 copy];

  return v5;
}

@end