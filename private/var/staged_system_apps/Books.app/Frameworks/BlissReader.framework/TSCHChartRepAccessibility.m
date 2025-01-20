@interface TSCHChartRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)isAccessibilityElement;
- (NSString)tsaxChartTypeFullDescription;
- (TSCHChartDrawableInfoAccessibility)tsaxChartDrawableInfo;
- (id)accessibilityHint;
- (id)tsaxKnobLabel;
@end

@implementation TSCHChartRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSCHChartRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxChartTypeFullDescription
{
  v3 = [(TSDRepAccessibility *)self tsaxLockedLabel];
  v4 = [(TSCHChartDrawableInfoAccessibility *)[(TSCHChartRepAccessibility *)self tsaxChartDrawableInfo] tsaxChartTypeFullDescription];
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (TSCHChartDrawableInfoAccessibility)tsaxChartDrawableInfo
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSCHChartDrawableInfoAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"chartInfo"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString(@"chart");
}

- (id)accessibilityHint
{
  return TSAccessibilityLocalizedString(@"chart.hint.ios");
}

@end