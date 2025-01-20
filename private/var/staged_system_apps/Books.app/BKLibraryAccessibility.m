@interface BKLibraryAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)bkaxdefaultManager;
+ (id)imaxTargetClassName;
- (id)_bkaxUiChildContext;
- (id)bkaxLibraryAssetOnMainQueueWithAssetID:(id)a3;
- (unint64_t)bkaxCountOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4;
@end

@implementation BKLibraryAccessibility

+ (id)imaxTargetClassName
{
  return @"BKLibrary";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)bkaxdefaultManager
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000070B0;
  v8 = sub_100007234;
  id v9 = 0;
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (id)bkaxLibraryAssetOnMainQueueWithAssetID:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000070B0;
  v10 = sub_100007234;
  id v11 = 0;
  id v3 = a3;
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }

  id v4 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v4;
}

- (unint64_t)bkaxCountOfSeriesLibraryAssetsWithSeriesID:(id)a3 total:(unint64_t *)a4
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v5 = a3;
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }

  if (a4) {
    *a4 = v13[3];
  }
  unint64_t v6 = v9[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v6;
}

- (id)_bkaxUiChildContext
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_1000070B0;
  uint64_t v8 = sub_100007234;
  id v9 = 0;
  if (__IMAccessibilityPerformSafeBlock()) {
    abort();
  }
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

@end