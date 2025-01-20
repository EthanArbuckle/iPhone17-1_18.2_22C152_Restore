@interface TSCHChartTypeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxFullDescription;
- (NSString)tsaxShortDescription;
@end

@implementation TSCHChartTypeAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSCHChartType";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxShortDescription
{
  return (NSString *)[(TSCHChartTypeAccessibility *)self tsaxValueForKey:@"userInterfaceName"];
}

- (NSString)tsaxFullDescription
{
  v2 = [(TSCHChartTypeAccessibility *)self tsaxShortDescription];
  v3 = TSAccessibilityLocalizedString(@"chart");
  return +[NSString stringWithFormat:TSAccessibilityLocalizedString(@"chart.canvas.name %@ %@"), v2, v3];
}

@end