@interface TSDCurvedShadowAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxShadowTypeDescription;
@end

@implementation TSDCurvedShadowAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDCurvedShadow";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxShadowTypeDescription
{
  return TSAccessibilityLocalizedString(@"curved.shadow");
}

@end