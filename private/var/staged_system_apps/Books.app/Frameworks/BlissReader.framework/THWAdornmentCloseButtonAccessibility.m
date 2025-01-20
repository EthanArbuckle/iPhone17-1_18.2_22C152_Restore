@interface THWAdornmentCloseButtonAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSString)tsaxLabel;
- (id)accessibilityHint;
@end

@implementation THWAdornmentCloseButtonAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWAdornmentCloseButton";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxLabel
{
  return THAccessibilityLocalizedString(@"close.button");
}

- (id)accessibilityHint
{
  return THAccessibilityLocalizedString(@"fullscreen.view.close.button.hint.ios");
}

@end