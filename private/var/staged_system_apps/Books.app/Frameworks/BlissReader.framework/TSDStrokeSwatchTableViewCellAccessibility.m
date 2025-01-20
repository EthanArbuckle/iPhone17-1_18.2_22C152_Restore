@interface TSDStrokeSwatchTableViewCellAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TSDStrokeSwatchTableViewCellAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDStrokeSwatchTableViewCell";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  id v2 = [(TSDStrokeSwatchTableViewCellAccessibility *)self tsaxValueForKey:@"stroke"];

  return [v2 accessibilityLabel];
}

@end