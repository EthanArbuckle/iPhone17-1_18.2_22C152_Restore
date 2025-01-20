@interface TSTTableControlCellEditorAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIsInsertingText;
- (void)_tsaxSetInsertingText:(BOOL)a3;
- (void)insertText:(id)a3;
- (void)p_alterRating:(id)a3 withValue:(unint64_t)a4;
@end

@implementation TSTTableControlCellEditorAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableControlCellEditor";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxIsInsertingText
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A50);
}

- (void)_tsaxSetInsertingText:(BOOL)a3
{
}

- (void)insertText:(id)a3
{
  BOOL v5 = [(TSTTableControlCellEditorAccessibility *)self _tsaxIsInsertingText];
  [(TSTTableControlCellEditorAccessibility *)self _tsaxSetInsertingText:1];
  v6.receiver = self;
  v6.super_class = (Class)TSTTableControlCellEditorAccessibility;
  [(TSTTableControlCellEditorAccessibility *)&v6 insertText:a3];
  [(TSTTableControlCellEditorAccessibility *)self _tsaxSetInsertingText:v5];
}

- (void)p_alterRating:(id)a3 withValue:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TSTTableControlCellEditorAccessibility;
  -[TSTTableControlCellEditorAccessibility p_alterRating:withValue:](&v12, "p_alterRating:withValue:", a3);
  if ([(TSTTableControlCellEditorAccessibility *)self _tsaxIsInsertingText])
  {
    if (a4 == 1)
    {
      objc_super v6 = TSAccessibilityLocalizedString(@"stars.rating.singular");
    }
    else
    {
      v7 = TSAccessibilityLocalizedString(@"stars.rating.plural %@");
      objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, TSAccessibilityLocalizedUnsignedInteger(a4));
    }
    uint64_t v8 = (uint64_t)v6;
    char v11 = 0;
    v9 = objc_opt_class();
    Class v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)[(TSTTableControlCellEditorAccessibility *)self tsaxValueForKey:@"mTableRep"], 1, &v11);
    if (v11) {
      abort();
    }
    TSAccessibilityPostAnnouncementNotification((uint64_t)v10, v8);
  }
}

@end