@interface THImageInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)thaxPopUpInfo;
@end

@implementation THImageInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"THImageInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxPopUpInfo
{
  return [(THImageInfoAccessibility *)self tsaxValueForKey:@"popUpInfo"];
}

@end