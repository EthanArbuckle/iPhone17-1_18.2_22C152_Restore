@interface THWKeynoteRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxButtonControlRepIsIgnored:(id)a3;
@end

@implementation THWKeynoteRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWKeynoteRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)thaxButtonControlRepIsIgnored:(id)a3
{
  return 1;
}

@end