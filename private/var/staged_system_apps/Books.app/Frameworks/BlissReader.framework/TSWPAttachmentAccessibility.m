@interface TSWPAttachmentAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSNumber)_tsaxCachedCharIndexNumber;
- (TSWPInteractiveCanvasControllerAccessibility)_tsaxParentInteractiveCanvasController;
- (TSWPRepAccessibility)tsaxParentTextRep;
- (void)_tsaxSetCachedCharIndexNumber:(id)a3;
- (void)_tsaxSetParentInteractiveCanvasController:(id)a3;
- (void)dealloc;
- (void)tsaxParentStorageWasUpdated;
- (void)tsaxSetParentInteractiveCanvasController:(id)a3;
@end

@implementation TSWPAttachmentAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPAttachment";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSWPInteractiveCanvasControllerAccessibility)_tsaxParentInteractiveCanvasController
{
  return (TSWPInteractiveCanvasControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_5739D8);
}

- (void)_tsaxSetParentInteractiveCanvasController:(id)a3
{
}

- (NSNumber)_tsaxCachedCharIndexNumber
{
  return (NSNumber *)__TSAccessibilityGetAssociatedObject(self, &unk_5739D9);
}

- (void)_tsaxSetCachedCharIndexNumber:(id)a3
{
}

- (void)dealloc
{
  [(TSWPAttachmentAccessibility *)self tsaxSetParentInteractiveCanvasController:0];
  v3.receiver = self;
  v3.super_class = (Class)TSWPAttachmentAccessibility;
  [(TSWPAttachmentAccessibility *)&v3 dealloc];
}

- (void)tsaxParentStorageWasUpdated
{
}

- (void)tsaxSetParentInteractiveCanvasController:(id)a3
{
  v5 = [(TSWPAttachmentAccessibility *)self _tsaxParentInteractiveCanvasController];
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
    [(TSWPAttachmentAccessibility *)self _tsaxSetParentInteractiveCanvasController:v8];
    [(objc_class *)v8 tsaxRegisterLinkedTextElement:self];
  }
}

- (TSWPRepAccessibility)tsaxParentTextRep
{
  objc_super v3 = [(TSWPAttachmentAccessibility *)self tsaxParentInteractiveCanvasController];
  if (TSAccessibilityShouldPerformValidationChecks() && !v3)
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Can't find interactive canvas controller even though we're asked for the parent text rep of an attachment.", v5, v6, v7, v8, v9, v28))abort(); {
    return 0;
    }
  }
  if (!v3) {
    return 0;
  }
  LOBYTE(v33) = 0;
  v10 = objc_opt_class();
  Class v11 = __TSAccessibilityCastAsSafeCategory(v10, (uint64_t)[(TSWPAttachmentAccessibility *)self tsaxValueForKey:@"parentStorage"], 1, &v33);
  if ((_BYTE)v33) {
    abort();
  }
  Class v12 = v11;
  if (!v11) {
    return 0;
  }
  v13 = [(TSWPAttachmentAccessibility *)self _tsaxCachedCharIndexNumber];
  if (!v13)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    uint64_t v36 = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_26C1AC;
    v32[3] = &unk_4573D8;
    v32[4] = self;
    v32[5] = &v33;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v32)) {
      abort();
    }
    uint64_t v14 = v34[3];
    _Block_object_dispose(&v33, 8);
    v13 = +[NSNumber numberWithUnsignedInteger:v14];
    [(TSWPAttachmentAccessibility *)self _tsaxSetCachedCharIndexNumber:v13];
  }
  v15 = [(NSNumber *)v13 unsignedIntegerValue];
  id v16 = [(TSWPInteractiveCanvasControllerAccessibility *)v3 tsaxTextRepsForStorage:v12];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (!v17) {
    return 0;
  }
  uint64_t v18 = *(void *)v29;
LABEL_13:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v29 != v18) {
      objc_enumerationMutation(v16);
    }
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * v19);
    LOBYTE(v33) = 0;
    v21 = objc_opt_class();
    Class v22 = __TSAccessibilityCastAsSafeCategory(v21, v20, 1, &v33);
    if ((_BYTE)v33) {
      abort();
    }
    v23 = (TSWPRepAccessibility *)v22;
    if (v22)
    {
      v24 = [(objc_class *)v22 tsaxStorageRangeOfRep];
      if (v15 >= v24 && v15 - v24 < v25) {
        return v23;
      }
    }
    if (v17 == (id)++v19)
    {
      id v17 = [v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
      if (v17) {
        goto LABEL_13;
      }
      return v23;
    }
  }
}

@end