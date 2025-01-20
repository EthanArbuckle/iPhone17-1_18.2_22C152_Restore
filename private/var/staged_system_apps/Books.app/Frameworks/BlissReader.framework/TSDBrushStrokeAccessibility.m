@interface TSDBrushStrokeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TSDBrushStrokeAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDBrushStroke";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return TSAccessibilityLocalizedString(@"stroke.chalkTexture.png");
}

@end