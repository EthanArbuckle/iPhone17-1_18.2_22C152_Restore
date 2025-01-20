@interface TSCHChartDrawableInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxChartTypeFullDescription;
- (id)_tsaxChartInfo;
@end

@implementation TSCHChartDrawableInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSCHChartDrawableInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxChartTypeFullDescription
{
  id v2 = [(TSCHChartDrawableInfoAccessibility *)self _tsaxChartInfo];

  return (NSString *)[v2 tsaxChartTypeFullDescription];
}

- (id)_tsaxChartInfo
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSCHChartDrawableInfoAccessibility *)self tsaxValueForKey:@"chart"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end