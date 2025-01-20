@interface TSTTableInfoAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)masterLayout;
- (void)_tsaxUpdateEditingCellIDOnMasterLayout;
- (void)setEditingCellID:(id)a3;
@end

@implementation TSTTableInfoAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableInfo";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_tsaxUpdateEditingCellIDOnMasterLayout
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2810000000;
  v10 = &unk_41622E;
  int v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_27350C;
  v6[3] = &unk_4573D8;
  v6[4] = self;
  v6[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  uint64_t v3 = *((unsigned int *)v8 + 8);
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  v4 = objc_opt_class();
  Class v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)[(TSTTableInfoAccessibility *)self tsaxValueForKey:@"mMasterLayout"], 1, &v7);
  if ((_BYTE)v7) {
    abort();
  }
  [(objc_class *)v5 tsaxSetEditingCellID:v3];
}

- (id)masterLayout
{
  v5.receiver = self;
  v5.super_class = (Class)TSTTableInfoAccessibility;
  id v3 = [(TSTTableInfoAccessibility *)&v5 masterLayout];
  [(TSTTableInfoAccessibility *)self _tsaxUpdateEditingCellIDOnMasterLayout];
  return v3;
}

- (void)setEditingCellID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSTTableInfoAccessibility;
  [(TSTTableInfoAccessibility *)&v4 setEditingCellID:*(unsigned int *)&a3];
  [(TSTTableInfoAccessibility *)self _tsaxUpdateEditingCellIDOnMasterLayout];
}

@end