@interface TSWPFilteredStorageAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxNewFilteredStorageWithStorage:(id)a3 subRange:(_NSRange)a4;
+ (id)tsaxTargetClassName;
- (unint64_t)tsaxNextCharacterIndex:(unint64_t)a3;
- (unint64_t)tsaxPreviousCharacterIndex:(unint64_t)a3;
@end

@implementation TSWPFilteredStorageAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPFilteredStorage";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)tsaxNewFilteredStorageWithStorage:(id)a3 subRange:(_NSRange)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_26CC6C;
  v12 = sub_26CC7C;
  uint64_t v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_26CC88;
  v6[3] = &unk_45AA20;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = &v8;
  _NSRange v7 = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unint64_t)tsaxPreviousCharacterIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  _NSRange v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_26CD98;
  v5[3] = &unk_458E98;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)tsaxNextCharacterIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  _NSRange v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_26CE9C;
  v5[3] = &unk_458E98;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end