@interface TSWPLayoutAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)tsaxStorage;
@end

@implementation TSWPLayoutAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPLayout";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxStorage
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPLayoutAccessibility *)self tsaxValueForKey:@"info"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end