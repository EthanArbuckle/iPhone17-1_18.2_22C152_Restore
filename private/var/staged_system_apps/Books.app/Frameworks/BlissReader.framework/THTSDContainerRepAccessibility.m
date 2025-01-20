@interface THTSDContainerRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)childRepsForHitTesting;
@end

@implementation THTSDContainerRepAccessibility

- (id)childRepsForHitTesting
{
  if (![(id)objc_opt_class() thaxRepShouldAllowHitTestingOfChildren:self]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THTSDContainerRepAccessibility;
  return [(THTSDContainerRepAccessibility *)&v4 childRepsForHitTesting];
}

+ (id)tsaxTargetClassName
{
  return @"TSDContainerRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

@end