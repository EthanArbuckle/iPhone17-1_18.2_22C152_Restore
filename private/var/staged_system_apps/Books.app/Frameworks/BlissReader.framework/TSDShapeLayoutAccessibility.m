@interface TSDShapeLayoutAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSDShapeLayoutAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDShapeLayout";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end