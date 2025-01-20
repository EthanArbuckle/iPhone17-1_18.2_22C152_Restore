@interface TSTCellRegionAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- ($0E7DCC040F5CEAF2787150A9C1D66156)tsaxBoundingCellRange;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxBottomRightCellID;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxUpperLeftCellID;
- (BOOL)tsaxIsEmpty;
- (void)tsaxEnumerateCellRangesUsingBlock:(id)a3;
@end

@implementation TSTCellRegionAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTCellRegion";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxIsEmpty
{
  return [(TSTCellRegionAccessibility *)self tsaxBoolValueForKey:@"isEmpty"];
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxUpperLeftCellID
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2810000000;
  v8 = &unk_41622E;
  int v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_26BA38;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v2 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)*((_DWORD *)v6 + 8);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxBottomRightCellID
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2810000000;
  v8 = &unk_41622E;
  int v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_26BB40;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v2 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)*((_DWORD *)v6 + 8);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- ($0E7DCC040F5CEAF2787150A9C1D66156)tsaxBoundingCellRange
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2810000000;
  v8 = &unk_41622E;
  uint64_t v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_26BC44;
  v4[3] = &unk_4573D8;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  $0E7DCC040F5CEAF2787150A9C1D66156 v2 = ($0E7DCC040F5CEAF2787150A9C1D66156)v6[4];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)tsaxEnumerateCellRangesUsingBlock:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_26BCEC;
  v3[3] = &unk_456E88;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

@end