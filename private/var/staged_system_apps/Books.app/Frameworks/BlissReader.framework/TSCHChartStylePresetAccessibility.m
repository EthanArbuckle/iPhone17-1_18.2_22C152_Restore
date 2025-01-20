@interface TSCHChartStylePresetAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)_tsaxSeriesAllStyles;
- (NSArray)tsaxSeriesFillStyles;
@end

@implementation TSCHChartStylePresetAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSCHChartStylePreset";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSArray)tsaxSeriesFillStyles
{
  v2 = [(TSCHChartStylePresetAccessibility *)self _tsaxSeriesAllStyles];
  v3 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v2 count]];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        char v20 = 0;
        v9 = objc_opt_class();
        Class v10 = __TSAccessibilityCastAsSafeCategory(v9, v8, 1, &v20);
        if (v20) {
LABEL_14:
        }
          abort();
        id v11 = [(objc_class *)v10 tsax2DColumnFillProperty];
        if (v11)
        {
          [(NSMutableArray *)v3 addObject:v11];
        }
        else if (TSAccessibilityShouldPerformValidationChecks())
        {
          int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Column fill should not be nil.", v13, v14, v15, v16, v17, v19))goto LABEL_14; {
        }
          }
      }
      id v5 = [(NSArray *)v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
  return &v3->super;
}

- (NSArray)_tsaxSeriesAllStyles
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSCHChartStylePresetAccessibility *)self tsaxValueForKey:@"seriesStyles"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end