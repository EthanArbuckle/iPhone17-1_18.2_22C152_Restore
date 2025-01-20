@interface THModelContentNodeAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)thaxBodyStorageForPresentationType:(id)a3;
- (id)thaxInfoForNodeUniqueID:(id)a3 forPresentationType:(id)a4;
- (id)thaxNodeUniqueIDForInfo:(id)a3;
@end

@implementation THModelContentNodeAccessibility

+ (id)tsaxTargetClassName
{
  return @"THModelContentNode";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxBodyStorageForPresentationType:(id)a3
{
  char v15 = 0;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_282ABC;
  v13 = sub_282ACC;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_282AD8;
  v8[3] = &unk_457DA0;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  uint64_t v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  id result = (id)__TSAccessibilityCastAsClass(v5, v6, 1, &v15);
  if (v15) {
    abort();
  }
  return result;
}

- (id)thaxNodeUniqueIDForInfo:(id)a3
{
  char v15 = 0;
  v5 = (objc_class *)objc_opt_class();
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_282ABC;
  v13 = sub_282ACC;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_282C40;
  v8[3] = &unk_457DA0;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  uint64_t v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  id result = (id)__TSAccessibilityCastAsClass(v5, v6, 1, &v15);
  if (v15) {
    abort();
  }
  return result;
}

- (id)thaxInfoForNodeUniqueID:(id)a3 forPresentationType:(id)a4
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_282ABC;
  uint64_t v11 = sub_282ACC;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_282D68;
  v6[3] = &unk_46BA00;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end