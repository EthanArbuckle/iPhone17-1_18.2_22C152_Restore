@interface TSDGradientStopAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxColorDescription;
- (TSUColorAccessibility)tsaxColor;
@end

@implementation TSDGradientStopAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDGradientStop";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxColorDescription
{
  v2 = [(TSDGradientStopAccessibility *)self tsaxColor];

  return [(TSUColorAccessibility *)v2 tsaxStyleInfoDescription];
}

- (TSUColorAccessibility)tsaxColor
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSUColorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDGradientStopAccessibility *)self tsaxValueForKey:@"color"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end