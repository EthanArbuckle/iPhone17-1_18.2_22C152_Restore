@interface TSTTableEditorAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIsPerformingBlockAffectingTableSelection;
- (BOOL)tsaxHasMultipleTableInfos;
- (TSTTableRepAccessibility)tsaxTableRep;
- (int)tsaxEditingMode;
- (void)_tsaxSetPerformingBlockAffectingTableSelection:(BOOL)a3;
- (void)setSelection:(id)a3 withFlags:(unint64_t)a4;
- (void)tsaxPerformBlockAffectingTableSelection:(id)a3;
@end

@implementation TSTTableEditorAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableEditor";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxIsPerformingBlockAffectingTableSelection
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5739DA);
}

- (void)_tsaxSetPerformingBlockAffectingTableSelection:(BOOL)a3
{
}

- (TSTTableRepAccessibility)tsaxTableRep
{
  char v9 = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSTTableEditorAccessibility *)self tsaxValueForKey:@"interactiveCanvasController"], 1, &v9);
  if (v9
    || (Class v5 = v4,
        char v8 = 0,
        v6 = objc_opt_class(),
        result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v6, (uint64_t)[(objc_class *)v5 tsaxRepForInfo:[(TSTTableEditorAccessibility *)self tsaxValueForKey:@"tableInfo"]], 1, &v8), v8))
  {
    abort();
  }
  return result;
}

- (int)tsaxEditingMode
{
  if ([(TSTTableEditorAccessibility *)self tsaxHasMultipleTableInfos]) {
    return 0;
  }
  id v4 = [(TSTTableEditorAccessibility *)self tsaxValueForKey:@"editingState"];

  return [v4 tsaxUnsignedIntValueForKey:@"editingMode"];
}

- (BOOL)tsaxHasMultipleTableInfos
{
  return [(TSTTableEditorAccessibility *)self tsaxBoolValueForKey:@"multipleTableInfos"];
}

- (void)tsaxPerformBlockAffectingTableSelection:(id)a3
{
  if ([(TSTTableEditorAccessibility *)self _tsaxIsPerformingBlockAffectingTableSelection])
  {
    id v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
  else
  {
    Class v5 = self;
    [(TSTTableEditorAccessibility *)self _tsaxSetPerformingBlockAffectingTableSelection:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(TSTTableEditorAccessibility *)self _tsaxSetPerformingBlockAffectingTableSelection:0];
  }
}

- (void)setSelection:(id)a3 withFlags:(unint64_t)a4
{
  id v7 = [(TSTTableEditorAccessibility *)self tsaxValueForKey:@"selection"];
  v11.receiver = self;
  v11.super_class = (Class)TSTTableEditorAccessibility;
  [(TSTTableEditorAccessibility *)&v11 setSelection:a3 withFlags:a4];
  if ((objc_msgSend(-[TSTTableEditorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"selection"), "isEqual:", v7) & 1) == 0&& !-[TSTTableEditorAccessibility _tsaxIsPerformingBlockAffectingTableSelection](self, "_tsaxIsPerformingBlockAffectingTableSelection")&& -[TSTTableEditorAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxTableSelectionWasUpdated:", &OBJC_PROTOCOL___TSTTableEditorAccessibilityExtras))
  {
    char v10 = 0;
    char v8 = objc_opt_class();
    Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)a3, 1, &v10);
    if (v10) {
      abort();
    }
    [(TSTTableEditorAccessibility *)self tsaxTableSelectionWasUpdated:v9];
  }
}

@end