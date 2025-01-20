@interface THUIAccessibilityElement
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation THUIAccessibilityElement

+ (id)tsaxTargetClassName
{
  return @"UIAccessibilityElement";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end