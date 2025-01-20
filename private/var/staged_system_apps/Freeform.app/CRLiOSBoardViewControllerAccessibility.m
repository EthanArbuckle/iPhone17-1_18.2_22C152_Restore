@interface CRLiOSBoardViewControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (CRLInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController;
- (UIBarButtonItem)crlaxCollaborationBarButtonItem;
- (void)crlaxLoadAccessibilityInformation;
- (void)documentOpenAnimationDidEnd;
- (void)loadApplicationToolbar;
- (void)updateToolbarButtons;
@end

@implementation CRLiOSBoardViewControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLiOSBoardViewController";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (CRLInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  char v8 = 0;
  v2 = [(CRLiOSBoardViewControllerAccessibility *)self crlaxTarget];
  v3 = [v2 interactiveCanvasController];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLInteractiveCanvasControllerAccessibility *)v6;
}

- (void)loadApplicationToolbar
{
  v2.receiver = self;
  v2.super_class = (Class)CRLiOSBoardViewControllerAccessibility;
  [(CRLiOSBoardViewControllerAccessibility *)&v2 loadApplicationToolbar];
}

- (void)updateToolbarButtons
{
  v2.receiver = self;
  v2.super_class = (Class)CRLiOSBoardViewControllerAccessibility;
  [(CRLiOSBoardViewControllerAccessibility *)&v2 updateToolbarButtons];
}

- (void)documentOpenAnimationDidEnd
{
  v2.receiver = self;
  v2.super_class = (Class)CRLiOSBoardViewControllerAccessibility;
  [(CRLiOSBoardViewControllerAccessibility *)&v2 documentOpenAnimationDidEnd];
}

- (void)crlaxLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CRLiOSBoardViewControllerAccessibility;
  [(CRLiOSBoardViewControllerAccessibility *)&v4 crlaxLoadAccessibilityInformation];
  v3 = [(CRLiOSBoardViewControllerAccessibility *)self crlaxInteractiveCanvasController];
  [v3 crlaxLoadAccessibilityInformation];
}

- (UIBarButtonItem)crlaxCollaborationBarButtonItem
{
  return self->_crlaxCollaborationBarButtonItem;
}

- (void).cxx_destruct
{
}

@end