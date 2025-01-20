@interface TSTTableSelectionAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxAnchorCellID;
- (TSTCellRegionAccessibility)tsaxCellRegion;
- (int)tsaxSelectionType;
- (void)tsaxEnumerateSelectedCellsInTableModel:(id)a3 includeEmptyCells:(BOOL)a4 includeHiddenCells:(BOOL)a5 usingBlock:(id)a6;
@end

@implementation TSTTableSelectionAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableSelection";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxAnchorCellID
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2810000000;
  v8 = &unk_41622E;
  int v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_267EDC;
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

- (TSTCellRegionAccessibility)tsaxCellRegion
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSTCellRegionAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSTTableSelectionAccessibility *)self tsaxValueForKey:@"cellRegion"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (int)tsaxSelectionType
{
  return [(TSTTableSelectionAccessibility *)self tsaxUnsignedIntValueForKey:@"selectionType"];
}

- (void)tsaxEnumerateSelectedCellsInTableModel:(id)a3 includeEmptyCells:(BOOL)a4 includeHiddenCells:(BOOL)a5 usingBlock:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  unsigned int v11 = [(TSTTableSelectionAccessibility *)self tsaxSelectionType];
  if (a3)
  {
    if (v11 != 4 && v11 != 5)
    {
      $0E7DCC040F5CEAF2787150A9C1D66156 v12 = [(TSTCellRegionAccessibility *)[(TSTTableSelectionAccessibility *)self tsaxCellRegion] tsaxBoundingCellRange];
      if (v12.var0.var0 != 0xFFFF && (*(void *)&v12 & 0xFF0000) != 0xFF0000)
      {
        uint64_t v13 = 128;
        if (!v8) {
          uint64_t v13 = 0;
        }
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_268080;
        v14[3] = &unk_46BE70;
        v14[4] = self;
        v14[5] = a3;
        if (v7) {
          v13 |= 0x20uLL;
        }
        v14[6] = a6;
        v14[7] = v13;
        if (__TSAccessibilityPerformSafeBlock((uint64_t)v14)) {
          abort();
        }
      }
    }
  }
}

@end