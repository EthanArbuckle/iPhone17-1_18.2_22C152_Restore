@interface THModelContainerNodeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (unint64_t)thaxIndexOfNode:(id)a3;
@end

@implementation THModelContainerNodeAccessibility

+ (id)tsaxTargetClassName
{
  return @"THModelContainerNode";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thaxIndexOfNode:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_288220;
  v5[3] = &unk_457DA0;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end