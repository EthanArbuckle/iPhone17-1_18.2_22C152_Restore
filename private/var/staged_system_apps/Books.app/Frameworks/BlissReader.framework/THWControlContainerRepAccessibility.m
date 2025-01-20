@interface THWControlContainerRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation THWControlContainerRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWControlContainerRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end