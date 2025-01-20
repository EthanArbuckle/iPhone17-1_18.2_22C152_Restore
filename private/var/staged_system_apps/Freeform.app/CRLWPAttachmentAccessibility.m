@interface CRLWPAttachmentAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxAttachmentElementForAttachment:(id)a3 inTextRep:(id)a4;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CRLTextInteractiveCanvasControllerAccessibility)_crlaxParentInteractiveCanvasController;
- (CRLTextRepAccessibility)crlaxParentTextRep;
- (CRLWPAttachmentAccessibilityElement)crlaxAssociatedAXElement;
- (NSNumber)_crlaxCachedCharIndexNumber;
- (id)crlaxAlternateAttrStringRepresentation;
- (void)_crlaxSetCachedCharIndexNumber:(id)a3;
- (void)_crlaxSetParentInteractiveCanvasController:(id)a3;
- (void)crlaxParentStorageWasUpdated;
- (void)crlaxSetAssociatedAXElement:(id)a3;
- (void)crlaxSetParentInteractiveCanvasController:(id)a3;
- (void)dealloc;
- (void)setParentStorage:(id)a3;
@end

@implementation CRLWPAttachmentAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPAttachment";
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

- (CRLTextInteractiveCanvasControllerAccessibility)_crlaxParentInteractiveCanvasController
{
  return (CRLTextInteractiveCanvasControllerAccessibility *)__CRLAccessibilityGetAssociatedWeakObject(self, &unk_1016A8FA8);
}

- (void)_crlaxSetParentInteractiveCanvasController:(id)a3
{
}

- (NSNumber)_crlaxCachedCharIndexNumber
{
  return (NSNumber *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A8FA9);
}

- (void)_crlaxSetCachedCharIndexNumber:(id)a3
{
}

- (void)dealloc
{
  [(CRLWPAttachmentAccessibility *)self crlaxSetParentInteractiveCanvasController:0];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPAttachmentAccessibility;
  [(CRLWPAttachmentAccessibility *)&v3 dealloc];
}

- (void)crlaxParentStorageWasUpdated
{
}

- (void)setParentStorage:(id)a3
{
  id v4 = a3;
  [(CRLWPAttachmentAccessibility *)self crlaxParentStorageWasUpdated];
  v5.receiver = self;
  v5.super_class = (Class)CRLWPAttachmentAccessibility;
  [(CRLWPAttachmentAccessibility *)&v5 setParentStorage:v4];
}

- (void)crlaxSetParentInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CRLWPAttachmentAccessibility *)self _crlaxParentInteractiveCanvasController];
  char v10 = 0;
  id v6 = v4;
  v7 = objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 1, &v10);
  if (v10) {
    abort();
  }
  v9 = (void *)v8;

  if (v5 != v9)
  {
    [v5 crlaxUnregisterLinkedTextElement:self];
    [(CRLWPAttachmentAccessibility *)self _crlaxSetParentInteractiveCanvasController:v9];
    [v9 crlaxRegisterLinkedTextElement:self];
  }
}

- (CRLTextRepAccessibility)crlaxParentTextRep
{
  return 0;
}

- (id)crlaxAlternateAttrStringRepresentation
{
  return self->_crlaxAlternateAttrStringRepresentation;
}

- (void).cxx_destruct
{
}

- (CRLWPAttachmentAccessibilityElement)crlaxAssociatedAXElement
{
  return (CRLWPAttachmentAccessibilityElement *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A94A2);
}

- (void)crlaxSetAssociatedAXElement:(id)a3
{
}

+ (id)crlaxAttachmentElementForAttachment:(id)a3 inTextRep:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 crlaxAssociatedAXElement];
  if (!v7)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"unhandled attachment type", v9, v10, v11, v12, v13, v15))abort(); {
    }
      }
    [v5 crlaxSetAssociatedAXElement:0];
  }

  return v7;
}

@end