@interface CRLCanvasEditorHelperAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxIsPerformingCut;
- (CRLSubselectionAccessibility)crlaxCanvasSelection;
- (id)_crlaxDescriptionOfInfos:(id)a3;
- (id)_crlaxInteractiveCanvasController;
- (id)crlaxCanvasEditor;
- (void)_crlaxSetIsPerformingCut:(BOOL)a3;
- (void)crlaxSpeakEditOperationCompletedAnnouncement:(id)a3;
- (void)delete:(id)a3;
- (void)enterQuickSelectMode:(id)a3;
- (void)p_setLockStatusOfSelectedDrawables:(BOOL)a3;
@end

@implementation CRLCanvasEditorHelperAccessibility

- (void)enterQuickSelectMode:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasEditorHelperAccessibility;
  [(CRLCanvasEditorHelperAccessibility *)&v7 enterQuickSelectMode:a3];
  v4 = [(CRLCanvasEditorHelperAccessibility *)self crlaxTarget];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Entered Quick Select mode. Double tap an object to add to selection." value:0 table:0];
  CRLAccessibilityPostAnnouncementNotification(v4, v6);
}

- (void)crlaxSpeakEditOperationCompletedAnnouncement:(id)a3
{
}

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasEditorHelper";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)_crlaxIsPerformingCut
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9A90);
}

- (void)_crlaxSetIsPerformingCut:(BOOL)a3
{
}

- (id)crlaxCanvasEditor
{
  return [(CRLCanvasEditorHelperAccessibility *)self crlaxValueForKey:@"canvasEditor"];
}

- (CRLSubselectionAccessibility)crlaxCanvasSelection
{
  v2 = [(CRLCanvasEditorHelperAccessibility *)self crlaxCanvasEditor];
  id v3 = NSProtocolFromString(@"CRLCanvasEditor");
  unsigned int v4 = [v2 conformsToProtocol:v3];

  if (v4)
  {
    v5 = [v2 crlaxValueForKey:@"canvasSelection"];
  }
  else
  {
    v5 = 0;
  }

  return (CRLSubselectionAccessibility *)v5;
}

- (void)delete:(id)a3
{
  id v4 = a3;
  v5 = [(CRLCanvasEditorHelperAccessibility *)self crlaxCanvasSelection];
  v6 = [v5 crlaxUnlockedInfos];
  objc_super v7 = [(CRLCanvasEditorHelperAccessibility *)self _crlaxDescriptionOfInfos:v6];

  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasEditorHelperAccessibility;
  [(CRLCanvasEditorHelperAccessibility *)&v11 delete:v4];

  if ([(CRLCanvasEditorHelperAccessibility *)self crlaxRespondsToSelector:"crlaxSpeakEditOperationCompletedAnnouncement:" fromExtrasProtocol:&OBJC_PROTOCOL___CRLCanvasEditorHelperAccessibilityExtras])
  {
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Deleted %1$@" value:0 table:0];
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);

    [(CRLCanvasEditorHelperAccessibility *)self crlaxSpeakEditOperationCompletedAnnouncement:v10];
  }
}

- (void)p_setLockStatusOfSelectedDrawables:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CRLCanvasEditorHelperAccessibility;
  [(CRLCanvasEditorHelperAccessibility *)&v15 p_setLockStatusOfSelectedDrawables:a3];
  id v4 = [(CRLCanvasEditorHelperAccessibility *)self _crlaxInteractiveCanvasController];
  v5 = [v4 crlaxSelectedReps];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) crlaxClearKnobAccessibilityElementCache:v11];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)_crlaxInteractiveCanvasController
{
  char v8 = 0;
  v2 = [(CRLCanvasEditorHelperAccessibility *)self crlaxTarget];
  id v3 = [v2 interactiveCanvasController];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)_crlaxDescriptionOfInfos:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        char v25 = 0;
        id v11 = v10;
        long long v12 = objc_opt_class();
        uint64_t v13 = __CRLAccessibilityCastAsSafeCategory(v12, (uint64_t)v11, 1, &v25);
        if (v25) {
          abort();
        }
        long long v14 = (void *)v13;

        objc_super v15 = [v14 crlaxTypeDescription];
        [v4 crlaxAddObjectIfNotNil:v15];
      }
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  v23 = __CRLAccessibilityStringForArraysAndVariables(v4, v16, v17, v18, v19, v20, v21, v22, @"__CRLAccessibilityStringForArraysAndVariablesSentinel");

  return v23;
}

@end