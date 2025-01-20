@interface THTSDShapeRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation THTSDShapeRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDShapeRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end