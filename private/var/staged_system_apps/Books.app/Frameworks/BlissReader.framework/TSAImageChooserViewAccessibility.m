@interface TSAImageChooserViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityElements;
@end

@implementation TSAImageChooserViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSAImageChooserView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  id v2 = [(TSAImageChooserViewAccessibility *)self tsaxValueForKey:@"mImagesLayer"];

  return [v2 tsaxValueForKey:@"sublayers"];
}

@end