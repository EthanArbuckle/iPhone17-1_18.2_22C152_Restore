@interface TSKScrollViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THAccessibilityTSKScrollViewDelegate)thaxDelegate;
@end

@implementation TSKScrollViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSKScrollView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THAccessibilityTSKScrollViewDelegate)thaxDelegate
{
  char v3 = 0;
  result = (THAccessibilityTSKScrollViewDelegate *)__TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___THAccessibilityTSKScrollViewDelegate, [(TSKScrollViewAccessibility *)self tsaxValueForKey:@"delegate"], 1, &v3);
  if (v3) {
    abort();
  }
  return result;
}

@end