@interface TSDFrameAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxFrameDescription;
- (id)accessibilityLabel;
@end

@implementation TSDFrameAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDFrame";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxFrameDescription
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[-[TSDFrameAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"mSpec") tsaxValueForKey:@"mFrameName"], 1, &v5);
  if (v5) {
    abort();
  }
  if (result) {
    return TSAccessibilityLocalizedString((uint64_t)+[NSString stringWithFormat:@"frame.%@", result]);
  }
  return result;
}

- (id)accessibilityLabel
{
  return [(TSDFrameAccessibility *)self tsaxFrameDescription];
}

@end