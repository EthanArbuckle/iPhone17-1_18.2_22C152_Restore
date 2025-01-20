@interface CRLInteractiveCanvasControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (id)crlaxFocusElementFromSearchReference:(id)a3;
- (id)crlaxFocusTextRangeFromSearchReference:(id)a3;
- (id)crlaxSearchReferenceForSelectionPath:(id)a3;
- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4;
- (void)crlaxGoToFormatInspector;
@end

@implementation CRLInteractiveCanvasControllerAccessibility

- (id)crlaxSearchReferenceForSelectionPath:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLInteractiveCanvasControllerAccessibility;
  v3 = [(CRLTextInteractiveCanvasControllerAccessibility *)&v5 crlaxSearchReferenceForSelectionPath:a3];

  return v3;
}

- (id)crlaxFocusElementFromSearchReference:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLInteractiveCanvasControllerAccessibility;
  v3 = [(CRLCanvasInteractiveCanvasControllerAccessibility *)&v5 crlaxFocusElementFromSearchReference:a3];

  return v3;
}

- (id)crlaxFocusTextRangeFromSearchReference:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLInteractiveCanvasControllerAccessibility;
  v3 = [(CRLTextInteractiveCanvasControllerAccessibility *)&v5 crlaxFocusTextRangeFromSearchReference:a3];

  return v3;
}

- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CRLInteractiveCanvasControllerAccessibility;
  [(CRLTextInteractiveCanvasControllerAccessibility *)&v4 crlaxAnnounceSearchReference:a3 forRotor:a4];
}

- (void)crlaxGoToFormatInspector
{
  v2 = [(CRLInteractiveCanvasControllerAccessibility *)self crlaxTarget];
  v3 = [v2 canvasView];

  char v10 = 0;
  objc_super v4 = [v3 nextResponder];
  objc_super v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v10);
  if (v10) {
    abort();
  }
  v7 = (void *)v6;

  v8 = [v7 miniFormatterPresenter];
  unsigned __int8 v9 = [v8 isPresentingMiniFormatter];

  if ((v9 & 1) == 0) {
    [v7 showDefaultEditUIForCurrentSelection];
  }
}

+ (id)crlaxTargetClassName
{
  return @"CRLInteractiveCanvasController";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_opt_class();
  objc_super v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

@end