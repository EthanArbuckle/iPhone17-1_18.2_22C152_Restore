@interface TSWPSmartFieldAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSWPInteractiveCanvasControllerAccessibility)_tsaxParentInteractiveCanvasController;
- (TSWPRepAccessibility)tsaxParentTextRep;
- (_NSRange)tsaxFieldRange;
- (void)_tsaxSetParentInteractiveCanvasController:(id)a3;
- (void)dealloc;
- (void)tsaxSetParentInteractiveCanvasController:(id)a3;
@end

@implementation TSWPSmartFieldAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPSmartField";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSWPInteractiveCanvasControllerAccessibility)_tsaxParentInteractiveCanvasController
{
  return (TSWPInteractiveCanvasControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_5738D6);
}

- (void)_tsaxSetParentInteractiveCanvasController:(id)a3
{
}

- (void)dealloc
{
  [(TSWPSmartFieldAccessibility *)self tsaxSetParentInteractiveCanvasController:0];
  v3.receiver = self;
  v3.super_class = (Class)TSWPSmartFieldAccessibility;
  [(TSWPSmartFieldAccessibility *)&v3 dealloc];
}

- (_NSRange)tsaxFieldRange
{
  id v2 = [(TSWPSmartFieldAccessibility *)self tsaxRangeValueForKey:@"range"];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)tsaxSetParentInteractiveCanvasController:(id)a3
{
  v5 = [(TSWPSmartFieldAccessibility *)self _tsaxParentInteractiveCanvasController];
  char v9 = 0;
  v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)a3, 1, &v9);
  if (v9) {
    abort();
  }
  Class v8 = v7;
  if (v5 != (TSWPInteractiveCanvasControllerAccessibility *)v7)
  {
    [(TSWPInteractiveCanvasControllerAccessibility *)v5 tsaxUnregisterLinkedTextElement:self];
    [(TSWPSmartFieldAccessibility *)self _tsaxSetParentInteractiveCanvasController:v8];
    [(objc_class *)v8 tsaxRegisterLinkedTextElement:self];
  }
}

- (TSWPRepAccessibility)tsaxParentTextRep
{
  NSUInteger v3 = [(TSWPSmartFieldAccessibility *)self tsaxParentInteractiveCanvasController];
  if (TSAccessibilityShouldPerformValidationChecks() && !v3)
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Can't find interactive canvas controller even though we're asked for the parent text rep of an attachment.", v5, v6, v7, v8, v9, v28))LABEL_26:abort(); {
    return 0;
    }
  }
  if (!v3) {
    return 0;
  }
  char v32 = 0;
  v10 = objc_opt_class();
  Class v11 = __TSAccessibilityCastAsSafeCategory(v10, (uint64_t)[(TSWPSmartFieldAccessibility *)self tsaxValueForKey:@"parentStorage"], 1, &v32);
  if (v32) {
    goto LABEL_26;
  }
  Class v12 = v11;
  v13 = [(TSWPSmartFieldAccessibility *)self tsaxFieldRange];
  v14 = 0;
  if (v12)
  {
    v15 = v13;
    if (v13 != (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v16 = [(TSWPInteractiveCanvasControllerAccessibility *)v3 tsaxTextRepsForStorage:v12];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v29;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            char v32 = 0;
            v22 = objc_opt_class();
            Class v23 = __TSAccessibilityCastAsSafeCategory(v22, v21, 1, &v32);
            if (v32) {
              goto LABEL_26;
            }
            v14 = (TSWPRepAccessibility *)v23;
            if (v23)
            {
              v24 = [(objc_class *)v23 tsaxStorageRangeOfRep];
              if (v15 >= v24 && v15 - v24 < v25) {
                return v14;
              }
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v18);
        return v14;
      }
      return 0;
    }
  }
  return v14;
}

@end