@interface THUIImageViewAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3;
@end

@implementation THUIImageViewAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIImageView";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THUIImageViewAccessibility;
  [super tsaxAddSafeCategoryDependenciesToCollection:];
  [a3 addObject:@"TSUIImageViewAccessibility"];
}

@end