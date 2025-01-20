@interface CRLTextInputResponderAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsFirstResponder;
- (UITextRange)crlaxTextRange;
- (id)_accessibilityQuickSpeakContent;
- (id)_accessibilityResponderElement;
- (id)_crlaxInteractiveCanvasController;
- (id)crlaxFocusedElement;
- (id)crlaxTextEditor;
- (id)crlaxVoiceControlPositionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(unint64_t)a5;
- (void)crlaxReloadInputViews;
- (void)forwardInvocation:(id)a3;
@end

@implementation CRLTextInputResponderAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLTextInputResponder";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)crlaxReloadInputViews
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100201BF0;
  v2[3] = &unk_1014CBBB0;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (id)crlaxVoiceControlPositionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(unint64_t)a5
{
  BOOL v8 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 4;
  id v9 = a3;
  v10 = v9;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [(CRLTextInputResponderAccessibility *)self crlaxTarget];
    v12 = [v11 tokenizer];

    v10 = v9;
    if (a5)
    {
      uint64_t v13 = 4 * v8;
      v14 = v9;
      do
      {
        v10 = [v12 positionFromPosition:v14 toBoundary:v13 inDirection:a4];

        v14 = v10;
        --a5;
      }
      while (a5);
    }
  }

  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v5 = [(CRLTextInputResponderAccessibility *)self crlaxTarget];
  v6 = [v5 editor];

  if (!v6) {
    goto LABEL_11;
  }
  v7 = (char *)[v4 selector];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_11;
  }
  if (v7 == "copy:")
  {
    BOOL v8 = &CRLAccessibilityTextOperationActionCopy;
  }
  else if (v7 == "cut:")
  {
    BOOL v8 = &CRLAccessibilityTextOperationActionCut;
  }
  else
  {
    if (v7 != "paste:")
    {
LABEL_11:
      v11.receiver = self;
      v11.super_class = (Class)CRLTextInputResponderAccessibility;
      [(CRLTextInputResponderAccessibility *)&v11 forwardInvocation:v4];
      goto LABEL_12;
    }
    BOOL v8 = &CRLAccessibilityTextOperationActionPaste;
  }
  id v9 = *v8;
  if (!v9) {
    goto LABEL_11;
  }
  v10 = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100201E80;
  v12[3] = &unk_1014CBE78;
  id v13 = v4;
  v14 = self;
  [(CRLTextInputResponderAccessibility *)self crlaxHandleTextOperationAction:v10 usingBlock:v12];

LABEL_12:
}

- (id)_accessibilityResponderElement
{
  v3 = +[CRLAccessibility sharedInstance];
  if ([v3 shouldPreventFocusingCanvasResponderElementOnScreenChange])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(CRLTextInputResponderAccessibility *)self crlaxFocusedElement];
  }

  return v4;
}

- (id)crlaxFocusedElement
{
  v3 = [(CRLTextInputResponderAccessibility *)self crlaxTextEditor];
  id v4 = [v3 editingReps];
  v5 = [v4 allObjects];
  v6 = [v5 firstObject];

  if (!v6)
  {
    v7 = [(CRLTextInputResponderAccessibility *)self _crlaxInteractiveCanvasController];
    BOOL v8 = [v7 crlaxFocusedRep];

    v6 = [v8 crlaxFocusedElement];
  }

  return v6;
}

- (BOOL)crlaxIsFirstResponder
{
  v2 = [(CRLTextInputResponderAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isFirstResponder];

  return v3;
}

- (UITextRange)crlaxTextRange
{
  char v10 = 0;
  v2 = self;
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClassAndProtocol(v3, (Protocol *)&OBJC_PROTOCOL___UITextInput, v2, 1, &v10);
  if (v10) {
    abort();
  }
  v5 = (void *)v4;

  v6 = [v5 beginningOfDocument];
  v7 = [v5 endOfDocument];
  BOOL v8 = [v5 textRangeFromPosition:v6 toPosition:v7];

  return (UITextRange *)v8;
}

- (id)_crlaxInteractiveCanvasController
{
  char v8 = 0;
  v2 = [(CRLTextInputResponderAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 icc];

  uint64_t v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_accessibilityQuickSpeakContent
{
  unsigned __int8 v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = [(CRLTextInputResponderAccessibility *)self crlaxTarget];
  uint64_t v5 = [v4 selectedTextRange];
  v6 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v5, 0, 0);

  if (![(CRLTextInputResponderAccessibility *)self crlaxBoolValueForKey:@"_accessibilityIsTextInput"]|| (v7 = 0, v6))
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLTextInputResponderAccessibility;
    v7 = [(CRLTextInputResponderAccessibility *)&v9 _accessibilityQuickSpeakContent];
  }

  return v7;
}

- (id)crlaxTextEditor
{
  char v8 = 0;
  v2 = [(CRLTextInputResponderAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 editor];

  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return v6;
}

@end