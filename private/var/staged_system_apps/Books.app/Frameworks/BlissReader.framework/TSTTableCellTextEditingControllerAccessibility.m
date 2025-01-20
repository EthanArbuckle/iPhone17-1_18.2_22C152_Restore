@interface TSTTableCellTextEditingControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIsPerformingBlockEndingEditing;
- (TSTTableRepAccessibility)tsaxTableRep;
- (void)_tsaxSetPerformingBlockEndingEditing:(BOOL)a3;
- (void)endEditing;
- (void)tsaxPerformBlockEndingEditing:(id)a3;
@end

@implementation TSTTableCellTextEditingControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTTableCellTextEditingController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxIsPerformingBlockEndingEditing
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5739F1);
}

- (void)_tsaxSetPerformingBlockEndingEditing:(BOOL)a3
{
}

- (TSTTableRepAccessibility)tsaxTableRep
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_271420;
  v11 = sub_271430;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_27143C;
  v6[3] = &unk_4573D8;
  v6[4] = [[self tsaxValueForKey:@"interactiveCanvasController"] tsaxValueForKey:@"editorController"];
  v6[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  uint64_t v2 = v8[5];
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, v2, 1, &v7);
  if ((_BYTE)v7) {
    abort();
  }
  return (TSTTableRepAccessibility *)[(objc_class *)v4 tsaxTableRep];
}

- (void)tsaxPerformBlockEndingEditing:(id)a3
{
  if ([(TSTTableCellTextEditingControllerAccessibility *)self _tsaxIsPerformingBlockEndingEditing])
  {
    Class v4 = (void (*)(id))*((void *)a3 + 2);
    v4(a3);
  }
  else
  {
    v5 = self;
    [(TSTTableCellTextEditingControllerAccessibility *)self _tsaxSetPerformingBlockEndingEditing:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(TSTTableCellTextEditingControllerAccessibility *)self _tsaxSetPerformingBlockEndingEditing:0];
  }
}

- (void)endEditing
{
  unsigned __int8 v3 = [(TSTTableCellTextEditingControllerAccessibility *)self _tsaxIsPerformingBlockEndingEditing];
  if (v3)
  {
    Class v4 = 0;
  }
  else
  {
    v5 = self;
    Class v4 = [(TSTTableCellTextEditingControllerAccessibility *)self tsaxTableRep];
  }
  v6.receiver = self;
  v6.super_class = (Class)TSTTableCellTextEditingControllerAccessibility;
  [(TSTTableCellTextEditingControllerAccessibility *)&v6 endEditing];
  if ((v3 & 1) == 0)
  {
    if ([(TSTTableCellTextEditingControllerAccessibility *)self tsaxRespondsToSelector:"tsaxDidEndEditingWithTableRep:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableCellTextEditingControllerAccessibilityExtras])[(TSTTableCellTextEditingControllerAccessibility *)self tsaxDidEndEditingWithTableRep:v4]; {
  }
    }
}

@end