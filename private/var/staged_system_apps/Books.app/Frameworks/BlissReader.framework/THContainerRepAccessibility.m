@interface THContainerRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)childRepsForHitTesting;
@end

@implementation THContainerRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THContainerRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)childRepsForHitTesting
{
  if (!+[THTSDRepAccessibility thaxRepShouldAllowHitTestingOfChildren:self])return 0; {
  v4.receiver = self;
  }
  v4.super_class = (Class)THContainerRepAccessibility;
  return [(THTSDContainerRepAccessibility *)&v4 childRepsForHitTesting];
}

@end