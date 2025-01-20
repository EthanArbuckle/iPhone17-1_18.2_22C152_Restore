@interface CRLCanvasAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsAnchoredAtRight;
- (BOOL)crlaxIsDoingLayout;
- (BOOL)crlaxIsPreventingReloadingChildren;
- (BOOL)p_updateRepsFromLayouts;
- (CGPoint)crlaxScreenPointFromUnscaledCanvas:(CGPoint)a3;
- (CGRect)crlaxConvertUnscaledToBoundsRect:(CGRect)a3;
- (CGRect)crlaxScreenFrameFromUnscaledCanvas:(CGRect)a3;
- (CRLCanvasInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController;
- (NSArray)crlaxMiniFormatterElements;
- (NSArray)crlaxTopLevelReps;
- (NSArray)crlaxTopLevelRepsOmittingMiniFormatterElements;
- (NSSet)crlaxAllReps;
- (UIView)crlaxMiniFormatterView;
- (double)crlaxViewScale;
- (id)_adjustRepOrderForMiniFormatterWith:(id)a3 forResults:(id)a4 withFormatterViews:(id)a5;
- (id)_crlaxMiniFormatterVC;
- (id)crlaxCanvasContainerView;
- (void)crlaxPreventReloadingChildren;
- (void)crlaxRevertReloadingChildrenTo:(BOOL)a3 andReloadForChanges:(BOOL)a4;
- (void)i_registerRep:(id)a3;
- (void)i_unregisterRep:(id)a3;
- (void)teardown;
@end

@implementation CRLCanvasAccessibility

- (BOOL)p_updateRepsFromLayouts
{
  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasAccessibility;
  BOOL v3 = [(CRLCanvasAccessibility *)&v7 p_updateRepsFromLayouts];
  if (v3)
  {
    v4 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
    v5 = [v4 crlaxCanvasView];
    [v5 crlaxInvalidateChildren];
  }
  return v3;
}

- (void)i_registerRep:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasAccessibility;
  [(CRLCanvasAccessibility *)&v6 i_registerRep:a3];
  v4 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  v5 = [v4 crlaxCanvasView];
  [v5 crlaxInvalidateChildren];
}

- (void)i_unregisterRep:(id)a3
{
  id v4 = a3;
  v5 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  objc_super v6 = [v5 crlaxCanvasView];
  id v7 = [v6 crlaxShouldPreventReloadingChildren];

  v8 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  v9 = [v8 crlaxCanvasView];
  [v9 crlaxSetShouldPreventReloadingChildren:1];

  v10 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  v11 = [v10 crlaxCanvasView];
  [v11 crlaxInvalidateChildren];

  v14.receiver = self;
  v14.super_class = (Class)CRLCanvasAccessibility;
  [(CRLCanvasAccessibility *)&v14 i_unregisterRep:v4];

  v12 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  v13 = [v12 crlaxCanvasView];
  [v13 crlaxSetShouldPreventReloadingChildren:v7];
}

- (BOOL)crlaxIsPreventingReloadingChildren
{
  char v8 = 0;
  v2 = [(CRLCanvasAccessibility *)self crlaxCanvasContainerView];
  BOOL v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v8);
  if (v8) {
    abort();
  }
  v5 = (void *)v4;

  if (v5) {
    unsigned __int8 v6 = [v5 crlaxShouldPreventReloadingChildren];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)crlaxPreventReloadingChildren
{
  v8.receiver = self;
  v8.super_class = (Class)CRLCanvasAccessibility;
  [(CRLCanvasAccessibility *)&v8 crlaxPreventReloadingChildren];
  char v7 = 0;
  BOOL v3 = [(CRLCanvasAccessibility *)self crlaxCanvasContainerView];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v7);
  if (v7) {
    abort();
  }
  unsigned __int8 v6 = (void *)v5;

  [v6 crlaxSetShouldPreventReloadingChildren:1];
}

- (void)crlaxRevertReloadingChildrenTo:(BOOL)a3 andReloadForChanges:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLCanvasAccessibility;
  -[CRLCanvasAccessibility crlaxRevertReloadingChildrenTo:andReloadForChanges:](&v12, "crlaxRevertReloadingChildrenTo:andReloadForChanges:");
  char v11 = 0;
  char v7 = [(CRLCanvasAccessibility *)self crlaxCanvasContainerView];
  objc_super v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = __CRLAccessibilityCastAsClass(v8, (uint64_t)v7, 1, &v11);
  if (v11) {
    abort();
  }
  v10 = (void *)v9;

  [v10 crlaxSetShouldPreventReloadingChildren:v5];
  if (v4 && !v5) {
    [v10 crlaxInvalidateChildren];
  }
}

+ (id)crlaxTargetClassName
{
  return @"CRLCanvas";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_class();
  BOOL v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (CRLCanvasInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  char v8 = 0;
  v2 = [(CRLCanvasAccessibility *)self crlaxTarget];
  id v3 = [v2 canvasController];

  BOOL v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  unsigned __int8 v6 = (void *)v5;

  return (CRLCanvasInteractiveCanvasControllerAccessibility *)v6;
}

- (BOOL)crlaxIsDoingLayout
{
  v2 = [(CRLCanvasAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 i_inLayout];

  return v3;
}

- (NSArray)crlaxMiniFormatterElements
{
  v2 = [(CRLCanvasAccessibility *)self _crlaxMiniFormatterVC];
  unsigned __int8 v3 = [v2 crlaxAccessibilityViews];

  return (NSArray *)v3;
}

- (NSArray)crlaxTopLevelReps
{
  unsigned __int8 v3 = [(CRLCanvasAccessibility *)self crlaxTopLevelRepsOmittingMiniFormatterElements];
  BOOL v4 = [(CRLCanvasAccessibility *)self _crlaxMiniFormatterVC];
  uint64_t v5 = [v4 crlaxCurrentPresentedRep];
  unsigned __int8 v6 = [v4 crlaxAccessibilityViews];
  char v7 = [(CRLCanvasAccessibility *)self _adjustRepOrderForMiniFormatterWith:v5 forResults:v3 withFormatterViews:v6];

  return (NSArray *)v7;
}

- (id)_adjustRepOrderForMiniFormatterWith:(id)a3 forResults:(id)a4 withFormatterViews:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(id *)(*((void *)&v26 + 1) + 8 * i);
        if (v15 == v7)
        {
          [v10 addObject:v7];
          [v10 addObjectsFromArray:v9];
        }
        else
        {
          char v25 = 0;
          id v16 = v15;
          v17 = (objc_class *)objc_opt_class();
          uint64_t v18 = __CRLAccessibilityCastAsClass(v17, (uint64_t)v16, 1, &v25);
          if (v25) {
            abort();
          }
          v19 = (void *)v18;

          v20 = [v19 allRepsContainedInGroup];
          unsigned int v21 = [v20 containsObject:v7];

          [v10 addObject:v16];
          if (v21) {
            [v10 addObjectsFromArray:v9];
          }
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  id v22 = [v10 copy];

  return v22;
}

- (NSSet)crlaxAllReps
{
  unsigned __int8 v3 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  unsigned __int8 v4 = [v3 crlaxCurrentlyWaitingOnThreadedLayoutAndRender];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    unsigned __int8 v6 = [(CRLCanvasAccessibility *)self crlaxTarget];
    uint64_t v5 = [v6 allReps];
  }

  return (NSSet *)v5;
}

- (id)crlaxCanvasContainerView
{
  v2 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  unsigned __int8 v3 = [v2 crlaxCanvasView];

  return v3;
}

- (CGRect)crlaxScreenFrameFromUnscaledCanvas:(CGRect)a3
{
  -[CRLCanvasAccessibility crlaxConvertUnscaledToBoundsRect:](self, "crlaxConvertUnscaledToBoundsRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(CRLCanvasAccessibility *)self crlaxCanvasContainerView];
  [v12 crlaxFrameFromBounds:v5, v7, v9, v11];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGPoint)crlaxScreenPointFromUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  double v6 = [v5 crlaxCanvasView];
  [v5 crlaxConvertUnscaledToBoundsPoint:x, y];
  [v6 crlaxFramePointFromBoundsPoint:];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGRect)crlaxConvertUnscaledToBoundsRect:(CGRect)a3
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  double v16 = "";
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1004DFCA8;
  v11[3] = &unk_1014F6118;
  v11[4] = self;
  v11[5] = &v13;
  CGRect v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11)) {
    abort();
  }
  double v3 = v14[4];
  double v4 = v14[5];
  double v5 = v14[6];
  double v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (double)crlaxViewScale
{
  v2 = [(CRLCanvasAccessibility *)self crlaxTarget];
  [v2 viewScale];
  double v4 = v3;

  return v4;
}

- (BOOL)crlaxIsAnchoredAtRight
{
  return [(CRLCanvasAccessibility *)self crlaxBoolValueForKey:@"mIsAnchoredAtRight"];
}

- (UIView)crlaxMiniFormatterView
{
  v2 = [(CRLCanvasAccessibility *)self _crlaxMiniFormatterVC];
  double v3 = [v2 view];

  return (UIView *)v3;
}

- (NSArray)crlaxTopLevelRepsOmittingMiniFormatterElements
{
  double v3 = [(CRLCanvasAccessibility *)self crlaxInteractiveCanvasController];
  unsigned __int8 v4 = [v3 crlaxCurrentlyWaitingOnThreadedLayoutAndRender];

  if (v4)
  {
    double v5 = 0;
  }
  else
  {
    double v6 = [(CRLCanvasAccessibility *)self crlaxTarget];
    double v5 = [v6 topLevelReps];
  }

  return (NSArray *)v5;
}

- (void)teardown
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(CRLCanvasAccessibility *)self crlaxAllReps];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 _crlaxSetShouldPreventAccessToCanvas:1];
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)CRLCanvasAccessibility;
  [(CRLCanvasAccessibility *)&v9 teardown];
}

- (id)_crlaxMiniFormatterVC
{
  char v22 = 0;
  v2 = [(CRLCanvasAccessibility *)self crlaxTarget];
  double v3 = [v2 delegate];

  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v22);
  if (v22) {
    goto LABEL_10;
  }
  uint64_t v6 = (void *)v5;

  char v21 = 0;
  double v7 = [v6 canvasView];
  double v8 = [v7 nextResponder];

  objc_super v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v8, 1, &v21);
  if (v21) {
    goto LABEL_10;
  }
  long long v11 = (void *)v10;

  long long v12 = [v11 miniFormatterPresenter];
  unsigned int v13 = [v12 isPresentingMiniFormatter];

  if (v13)
  {
    char v20 = 0;
    double v14 = [v11 miniFormatterPresenter];
    uint64_t v15 = [v14 crlaxMiniFormatterViewController];

    double v16 = (objc_class *)objc_opt_class();
    uint64_t v17 = __CRLAccessibilityCastAsClass(v16, (uint64_t)v15, 1, &v20);
    if (!v20)
    {
      long long v18 = (void *)v17;

      goto LABEL_7;
    }
LABEL_10:
    abort();
  }
  long long v18 = 0;
LABEL_7:

  return v18;
}

@end