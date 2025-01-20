@interface TSDDropShadowAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxShadowTypeDescription;
@end

@implementation TSDDropShadowAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDDropShadow";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxShadowTypeDescription
{
  return TSAccessibilityLocalizedString(@"drop.shadow");
}

@end