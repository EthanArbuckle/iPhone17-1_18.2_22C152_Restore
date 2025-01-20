@interface TSDMediaStyleAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSDMediaStyleAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDMediaStyle";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end