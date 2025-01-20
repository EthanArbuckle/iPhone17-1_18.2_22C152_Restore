@interface THTSDImageRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxIsElementIgnored;
- (BOOL)tsaxActivate;
@end

@implementation THTSDImageRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDImageRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THTSDImageRepAccessibility;
  [super tsaxAddSafeCategoryDependenciesToCollection:];
  [a3 addObject:@"TSDImageRepAccessibility"];
}

- (BOOL)tsaxActivate
{
  return 0;
}

- (BOOL)thaxIsElementIgnored
{
  return [(NSString *)[(TSDImageRepAccessibility *)self tsaxLabel] length] == 0;
}

- (BOOL)isAccessibilityElement
{
  return ![(THTSDImageRepAccessibility *)self thaxIsElementIgnored];
}

@end