@interface THPresentationTypeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)thaxPaginatedPresentationTypeInContext:(id)a3;
+ (id)tsaxTargetClassName;
@end

@implementation THPresentationTypeAccessibility

+ (id)tsaxTargetClassName
{
  return @"THPresentationType";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)thaxPaginatedPresentationTypeInContext:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_285E58;
  v11 = sub_285E68;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_285E74;
  v6[3] = &unk_457DA0;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = a1;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  uint64_t v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  v4 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v4, v3, 1, &v7);
  if ((_BYTE)v7) {
    abort();
  }
  return result;
}

@end