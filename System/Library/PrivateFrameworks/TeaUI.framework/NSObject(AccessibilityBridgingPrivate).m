@interface NSObject(AccessibilityBridgingPrivate)
- (BOOL)ts_axHasValueForKey:()AccessibilityBridgingPrivate;
- (uint64_t)ts_axBoolValueForKey:()AccessibilityBridgingPrivate;
- (void)ts_axSetBoolValue:()AccessibilityBridgingPrivate forKey:;
@end

@implementation NSObject(AccessibilityBridgingPrivate)

- (void)ts_axSetBoolValue:()AccessibilityBridgingPrivate forKey:
{
  id v6 = a4;
  v7 = (const void *)[v6 hash];
  id v8 = [NSNumber numberWithBool:a3];
  objc_setAssociatedObject(a1, v7, v8, (void *)0x301);
}

- (uint64_t)ts_axBoolValueForKey:()AccessibilityBridgingPrivate
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, (const void *)[v4 hash]);

  uint64_t v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)ts_axHasValueForKey:()AccessibilityBridgingPrivate
{
  id v4 = a3;
  v5 = objc_getAssociatedObject(a1, (const void *)[v4 hash]);

  return v5 != 0;
}

@end