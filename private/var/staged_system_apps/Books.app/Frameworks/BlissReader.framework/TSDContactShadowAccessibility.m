@interface TSDContactShadowAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxShadowTypeDescription;
@end

@implementation TSDContactShadowAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDContactShadow";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxShadowTypeDescription
{
  return TSAccessibilityLocalizedString(@"contact.shadow");
}

@end