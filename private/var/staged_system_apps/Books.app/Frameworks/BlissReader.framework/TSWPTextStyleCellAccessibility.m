@interface TSWPTextStyleCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TSWPTextStyleCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPTextStyleCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v2 = [(TSWPTextStyleCellAccessibility *)self tsaxValueForKey:@"textStyle"];

  return [v2 tsaxValueForKey:@"name"];
}

@end