@interface TSSPropertySetAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (void)tsaxEnumeratePropertiesUsingBlock:(id)a3;
@end

@implementation TSSPropertySetAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSSPropertySet";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)tsaxEnumeratePropertiesUsingBlock:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_262CF4;
  v3[3] = &unk_456E88;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

@end