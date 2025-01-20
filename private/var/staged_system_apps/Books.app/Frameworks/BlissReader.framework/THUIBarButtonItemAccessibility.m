@interface THUIBarButtonItemAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (UIView)thaxView;
@end

@implementation THUIBarButtonItemAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIBarButtonItem";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (UIView)thaxView
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (UIView *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THUIBarButtonItemAccessibility *)self tsaxValueForKey:@"view"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end