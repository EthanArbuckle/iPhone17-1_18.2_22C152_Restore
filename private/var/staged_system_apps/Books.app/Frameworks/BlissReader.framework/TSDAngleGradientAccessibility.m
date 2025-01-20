@interface TSDAngleGradientAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TSDAngleGradientAccessibility

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString(@"gradient.fill");
}

+ (id)tsaxTargetClassName
{
  return @"TSDAngleGradient";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end