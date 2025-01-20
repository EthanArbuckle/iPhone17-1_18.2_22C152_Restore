@interface CRLWPSmartFieldAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CRLTextInteractiveCanvasControllerAccessibility)_crlaxParentInteractiveCanvasController;
- (CRLTextRepAccessibility)crlaxParentTextRep;
- (_NSRange)crlaxFieldRange;
- (void)_crlaxSetParentInteractiveCanvasController:(id)a3;
- (void)crlaxSetParentInteractiveCanvasController:(id)a3;
- (void)dealloc;
@end

@implementation CRLWPSmartFieldAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPSmartField";
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
  return (CRLTextInteractiveCanvasControllerAccessibility *)__CRLAccessibilityGetAssociatedWeakObject(self, &unk_1016A9C20);
}

- (void)_crlaxSetParentInteractiveCanvasController:(id)a3
{
}

- (void)dealloc
{
  [(CRLWPSmartFieldAccessibility *)self crlaxSetParentInteractiveCanvasController:0];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPSmartFieldAccessibility;
  [(CRLWPSmartFieldAccessibility *)&v3 dealloc];
}

- (_NSRange)crlaxFieldRange
{
  v2 = [(CRLWPSmartFieldAccessibility *)self crlaxTarget];
  id v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)crlaxSetParentInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(CRLWPSmartFieldAccessibility *)self _crlaxParentInteractiveCanvasController];
  char v10 = 0;
  id v6 = v4;
  NSUInteger v7 = objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 1, &v10);
  if (v10) {
    abort();
  }
  v9 = (void *)v8;

  if (v5 != v9)
  {
    [v5 crlaxUnregisterLinkedTextElement:self];
    [(CRLWPSmartFieldAccessibility *)self _crlaxSetParentInteractiveCanvasController:v9];
    [v9 crlaxRegisterLinkedTextElement:self];
  }
}

- (CRLTextRepAccessibility)crlaxParentTextRep
{
  id v3 = [(CRLWPSmartFieldAccessibility *)self crlaxParentInteractiveCanvasController];
  if (CRLAccessibilityShouldPerformValidationChecks() && !v3)
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Can't find interactive canvas controller even though we're asked for the parent text rep of an attachment.", v5, v6, v7, v8, v9, v32))LABEL_31:abort(); {
    goto LABEL_24;
    }
  }
  if (!v3)
  {
LABEL_24:
    v16 = 0;
    goto LABEL_28;
  }
  char v38 = 0;
  char v10 = [(CRLWPSmartFieldAccessibility *)self crlaxTarget];
  v11 = [v10 parentStorage];

  v12 = objc_opt_class();
  uint64_t v13 = __CRLAccessibilityCastAsSafeCategory(v12, (uint64_t)v11, 1, &v38);
  if (v38) {
    goto LABEL_31;
  }
  v14 = (void *)v13;

  v15 = [(CRLWPSmartFieldAccessibility *)self crlaxFieldRange];
  v16 = 0;
  if (v14)
  {
    v17 = v15;
    if (v15 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v33 = v14;
      [v3 crlaxTextRepsForStorage:v14];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      id v19 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v19)
      {
        id v20 = v19;
        v16 = 0;
        uint64_t v21 = *(void *)v35;
        do
        {
          v22 = 0;
          v23 = v16;
          do
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v18);
            }
            v24 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v22);
            char v38 = 0;
            id v25 = v24;
            v26 = objc_opt_class();
            uint64_t v27 = __CRLAccessibilityCastAsSafeCategory(v26, (uint64_t)v25, 1, &v38);
            if (v38) {
              goto LABEL_31;
            }
            v16 = (void *)v27;

            if (v16)
            {
              v28 = [v16 crlaxStorageRangeOfRep];
              if (v17 >= v28 && v17 - v28 < v29) {
                goto LABEL_26;
              }
            }
            v22 = (char *)v22 + 1;
            v23 = v16;
          }
          while (v20 != v22);
          id v20 = [v18 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v20);
      }
      else
      {
        v16 = 0;
      }
LABEL_26:

      v14 = v33;
    }
  }

LABEL_28:

  return (CRLTextRepAccessibility *)v16;
}

@end