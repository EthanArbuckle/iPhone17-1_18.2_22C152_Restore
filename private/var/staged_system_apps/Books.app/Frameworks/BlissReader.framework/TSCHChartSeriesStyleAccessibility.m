@interface TSCHChartSeriesStyleAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsax2DColumnFillProperty;
@end

@implementation TSCHChartSeriesStyleAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSCHChartSeriesStyle";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsax2DColumnFillProperty
{
  return [(TSSStyleAccessibility *)self tsaxObjectForProperty:1387];
}

@end