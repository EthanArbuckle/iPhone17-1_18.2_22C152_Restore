@interface TSTMasterLayoutAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxEditingCellID;
- (BOOL)updateDynamicChangeRowOrColumnCount:(int)a3 count:(int)a4 newlyAddedElementSize:(double)a5;
- (_NSRange)_tsaxEditingCellIDAsRange;
- (void)_tsaxSetEditingCellIDAsRange:(_NSRange)a3;
- (void)tsaxDynamicColumnOrRowCountWasUpdatedWithSummary:(id)a3;
- (void)tsaxDynamicSelectionRegionWasUpdatedWithSummary:(id)a3;
- (void)tsaxSetEditingCellID:(id)a3;
- (void)updateDynamicSelectionRegion:(id)a3;
@end

@implementation TSTMasterLayoutAccessibility

- (void)tsaxDynamicSelectionRegionWasUpdatedWithSummary:(id)a3
{
  if (a3) {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, a3);
  }
  UIAccessibilityNotifications v3 = UIAccessibilityLayoutChangedNotification;

  UIAccessibilityPostNotification(v3, 0);
}

- (void)tsaxDynamicColumnOrRowCountWasUpdatedWithSummary:(id)a3
{
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, a3);
  UIAccessibilityNotifications v3 = TSAccessibilityElementMovedNotification;

  UIAccessibilityPostNotification(v3, 0);
}

+ (id)tsaxTargetClassName
{
  return @"TSTMasterLayout";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (_NSRange)_tsaxEditingCellIDAsRange
{
  id AssociatedRange = __TSAccessibilityGetAssociatedRange(self, &unk_5738C9);
  result.length = v3;
  result.location = (NSUInteger)AssociatedRange;
  return result;
}

- (void)_tsaxSetEditingCellIDAsRange:(_NSRange)a3
{
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxEditingCellID
{
  unsigned __int8 v2 = [(TSTMasterLayoutAccessibility *)self _tsaxEditingCellIDAsRange];
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v3 | (v2 << 16));
}

- (void)tsaxSetEditingCellID:(id)a3
{
}

- (void)updateDynamicSelectionRegion:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)TSTMasterLayoutAccessibility;
  -[TSTMasterLayoutAccessibility updateDynamicSelectionRegion:](&v26, "updateDynamicSelectionRegion:");
  unsigned int v5 = [(TSTMasterLayoutAccessibility *)self tsaxRespondsToSelector:"tsaxDynamicSelectionRegionWasUpdatedWithSummary:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTMasterLayoutAccessibilityExtras];
  v6 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3052000000;
  v23 = sub_2651EC;
  v24 = sub_2651FC;
  uint64_t v25 = 0;
  if (v5)
  {
    uint64_t v7 = (uint64_t)[(TSTMasterLayoutAccessibility *)self tsaxEditingCellID];
    if ((_WORD)v7 == 0xFFFF || (v7 & 0xFF0000) == 0xFF0000)
    {
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x3052000000;
      v17 = sub_2651EC;
      v18 = sub_2651FC;
      uint64_t v19 = 0;
      char v13 = 0;
      v8 = objc_opt_class();
      Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)a3, 1, &v13);
      if (v13) {
        abort();
      }
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_265208;
      v12[3] = &unk_46BD60;
      v12[4] = &v20;
      v12[5] = &v14;
      [(objc_class *)v9 tsaxEnumerateCellRangesUsingBlock:v12];
      if (v15[5])
      {
        [(id)v21[5] appendString:@", , "];
        v10 = (void *)v21[5];
        v11 = TSAccessibilityLocalizedString(@"columns.and.rows.selected.ending.format %@");
        [v10 appendFormat:v11, v15[5]];
      }
      _Block_object_dispose(&v14, 8);
    }
    [(TSTMasterLayoutAccessibility *)self tsaxDynamicSelectionRegionWasUpdatedWithSummary:v21[5]];
    v6 = (void *)v21[5];
  }

  _Block_object_dispose(&v20, 8);
}

- (BOOL)updateDynamicChangeRowOrColumnCount:(int)a3 count:(int)a4 newlyAddedElementSize:(double)a5
{
  v18.receiver = self;
  v18.super_class = (Class)TSTMasterLayoutAccessibility;
  BOOL v8 = -[TSTMasterLayoutAccessibility updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:](&v18, "updateDynamicChangeRowOrColumnCount:count:newlyAddedElementSize:", a5);
  if ([(TSTMasterLayoutAccessibility *)self tsaxRespondsToSelector:"tsaxDynamicColumnOrRowCountWasUpdatedWithSummary:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTMasterLayoutAccessibilityExtras])
  {
    if (a4 >= 0) {
      uint64_t v9 = a4;
    }
    else {
      uint64_t v9 = -a4;
    }
    id v10 = TSAccessibilityLocalizedUnsignedInteger(v9);
    if (a3 == 1)
    {
      CFStringRef v11 = @"add.column.singular %@";
      BOOL v12 = v9 == 1;
      CFStringRef v13 = @"remove.column.plural %@";
      if (v9 != 1) {
        CFStringRef v11 = @"add.column.plural %@";
      }
      CFStringRef v14 = @"remove.column.singular %@";
    }
    else
    {
      if (a3)
      {
        uint64_t v16 = 0;
LABEL_20:
        [(TSTMasterLayoutAccessibility *)self tsaxDynamicColumnOrRowCountWasUpdatedWithSummary:v16];
        return v8;
      }
      CFStringRef v11 = @"add.row.singular %@";
      BOOL v12 = v9 == 1;
      CFStringRef v13 = @"remove.row.plural %@";
      if (v9 != 1) {
        CFStringRef v11 = @"add.row.plural %@";
      }
      CFStringRef v14 = @"remove.row.singular %@";
    }
    if (!v12) {
      CFStringRef v14 = v13;
    }
    if (a4 < 0) {
      uint64_t v15 = (uint64_t)v14;
    }
    else {
      uint64_t v15 = (uint64_t)v11;
    }
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString(v15), v10);
    goto LABEL_20;
  }
  return v8;
}

@end