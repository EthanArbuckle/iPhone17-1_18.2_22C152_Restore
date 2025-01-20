@interface TSCHChartInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxChartTypeFullDescription;
- (id)_tsaxChartType;
@end

@implementation TSCHChartInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSCHChartInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxChartTypeFullDescription
{
  id v2 = [(TSCHChartInfoAccessibility *)self _tsaxChartType];

  return (NSString *)[v2 tsaxFullDescription];
}

- (id)_tsaxChartType
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSCHChartInfoAccessibility *)self tsaxValueForKey:@"chartType"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end