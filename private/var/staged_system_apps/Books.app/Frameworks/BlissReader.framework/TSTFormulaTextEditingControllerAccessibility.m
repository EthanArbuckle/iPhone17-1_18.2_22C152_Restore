@interface TSTFormulaTextEditingControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxAllowsDidUpdateSelectedChoiceForCompletionToken;
- (BOOL)_tsaxDidUpdateAutocompletionText;
- (BOOL)_tsaxIsAcceptingTypedText;
- (BOOL)acceptTypedText:(id)a3;
- (BOOL)tsaxHasMultipleAutocompletionChoices;
- (CGRect)tsaxFirstRectForRange:(_NSRange)a3;
- (NSString)_tsaxFormulaPlainTextOfAbsorbedToken;
- (TSTCompletionTokenAccessibility)tsaxCompletionToken;
- (TSTTableRepAccessibility)tsaxTableRep;
- (void)_tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:(id)a3;
- (void)_tsaxSetAcceptingTypedText:(BOOL)a3;
- (void)_tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:(BOOL)a3;
- (void)_tsaxSetDidUpdateAutocompletionText:(BOOL)a3;
- (void)_tsaxSetFormulaPlainTextOfAbsorbedToken:(id)a3;
- (void)arrowKeyReceivedInDirection:(int)a3 withModifierKeys:(int)a4;
- (void)didSelectChoice:(id)a3;
- (void)endInsertingKeyboardReferenceLeavingActive:(BOOL)a3;
- (void)insertTabIgnoringFieldEditor:(id)a3;
- (void)p_insertTab:(id)a3;
- (void)p_modifyKeyboardReferenceInDirection:(int)a3 withModifierKeys:(int)a4;
- (void)p_startInsertingKeyboardReference;
- (void)setAutocompletionText:(id)a3 prefixRange:(_NSRange)a4;
- (void)setSelection:(id)a3 withFlags:(unint64_t)a4;
- (void)tsaxPerformBlockAffectingKeyboardReferenceToken:(id)a3;
@end

@implementation TSTFormulaTextEditingControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSTFormulaTextEditingController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxDidUpdateAutocompletionText
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_57388D);
}

- (void)_tsaxSetDidUpdateAutocompletionText:(BOOL)a3
{
}

- (BOOL)_tsaxIsAcceptingTypedText
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_57388E);
}

- (void)_tsaxSetAcceptingTypedText:(BOOL)a3
{
}

- (NSString)_tsaxFormulaPlainTextOfAbsorbedToken
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_57388F);
}

- (void)_tsaxSetFormulaPlainTextOfAbsorbedToken:(id)a3
{
}

- (BOOL)_tsaxAllowsDidUpdateSelectedChoiceForCompletionToken
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573890);
}

- (void)_tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:(BOOL)a3
{
}

- (TSTTableRepAccessibility)tsaxTableRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[-[TSTFormulaTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"formulaCellEditor") tsaxValueForKey:@"tableRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSTCompletionTokenAccessibility)tsaxCompletionToken
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSTCompletionTokenAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSTFormulaTextEditingControllerAccessibility *)self tsaxValueForKey:@"completionToken"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)tsaxHasMultipleAutocompletionChoices
{
  unsigned int v3 = [(TSTFormulaTextEditingControllerAccessibility *)self tsaxBoolValueForKey:@"isAutocompleting"];
  if (v3) {
    LOBYTE(v3) = [(unint64_t)[self tsaxValueForKey:@"typingChoicesController"] tsaxUnsignedIntegerValueForKey:@"countChoicesForCurrentDisplay"] > 1;
  }
  return v3;
}

- (CGRect)tsaxFirstRectForRange:(_NSRange)a3
{
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x4010000000;
  v16 = &unk_41622E;
  long long v17 = 0u;
  long long v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2560F8;
  v11[3] = &unk_46B940;
  v11[4] = self;
  v11[5] = &v13;
  _NSRange v12 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11)) {
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
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)tsaxPerformBlockAffectingKeyboardReferenceToken:(id)a3
{
  char v12 = 0;
  double v5 = objc_opt_class();
  Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)[(TSTFormulaTextEditingControllerAccessibility *)self tsaxValueForKey:@"mKeyboardReferenceToken"], 1, &v12);
  if (v12
    || (double v7 = v6,
        (*((void (**)(id))a3 + 2))(a3),
        char v11 = 0,
        double v8 = objc_opt_class(),
        Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)[(TSTFormulaTextEditingControllerAccessibility *)self tsaxValueForKey:@"mKeyboardReferenceToken"], 1, &v11), v11))
  {
    abort();
  }
  Class v10 = v9;
  if (v7 != v9)
  {
    [(objc_class *)v7 tsaxSetMovingReferenceToken:0];
    [(objc_class *)v10 tsaxSetMovingReferenceToken:1];
  }
}

- (void)_tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:(id)a3
{
  if ([(TSTFormulaTextEditingControllerAccessibility *)self _tsaxAllowsDidUpdateSelectedChoiceForCompletionToken])
  {
    double v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
  else
  {
    [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:1];
    (*((void (**)(id))a3 + 2))(a3);
    [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:0];
  }
}

- (BOOL)acceptTypedText:(id)a3
{
  unsigned __int8 v5 = [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxIsAcceptingTypedText];
  if ((v5 & 1) == 0)
  {
    [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetAcceptingTypedText:1];
    [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetFormulaPlainTextOfAbsorbedToken:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)TSTFormulaTextEditingControllerAccessibility;
  BOOL v6 = [(TSTFormulaTextEditingControllerAccessibility *)&v8 acceptTypedText:a3];
  if ((v5 & 1) == 0)
  {
    [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetAcceptingTypedText:0];
    [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetFormulaPlainTextOfAbsorbedToken:0];
  }
  return v6;
}

- (void)arrowKeyReceivedInDirection:(int)a3 withModifierKeys:(int)a4
{
  if (![(TSTFormulaTextEditingControllerAccessibility *)self tsaxBoolValueForKey:@"isAutocompleting"])
  {
    id v7 = 0;
    goto LABEL_5;
  }
  id v7 = [(TSTFormulaTextEditingControllerAccessibility *)self tsaxValueForKey:@"typingChoicesController"];
  if ((unint64_t)[v7 tsaxUnsignedIntegerValueForKey:@"countChoicesForCurrentDisplay"] < 2)
  {
LABEL_5:
    int v9 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  uint64_t v8 = (uint64_t)[v7 tsaxUnsignedIntegerValueForKey:@"selectedChoiceIndex"];
  int v9 = 1;
LABEL_6:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_256490;
  v10[3] = &unk_457250;
  int v11 = a3;
  int v12 = a4;
  v10[4] = self;
  [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:v10];
  if (v9 && [v7 tsaxUnsignedIntegerValueForKey:@"selectedChoiceIndex"] == (id)v8)
  {
    if ([(TSTFormulaTextEditingControllerAccessibility *)self tsaxRespondsToSelector:"tsaxDidFailUpdatingSelectedChoiceForCompletionToken:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras])[(TSTFormulaTextEditingControllerAccessibility *)self tsaxDidFailUpdatingSelectedChoiceForCompletionToken:[(TSTFormulaTextEditingControllerAccessibility *)self tsaxCompletionToken]]; {
  }
    }
}

- (void)didSelectChoice:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSTFormulaTextEditingControllerAccessibility;
  [(TSTFormulaTextEditingControllerAccessibility *)&v4 didSelectChoice:a3];
  if ([(TSTFormulaTextEditingControllerAccessibility *)self _tsaxAllowsDidUpdateSelectedChoiceForCompletionToken])
  {
    if ([(TSTFormulaTextEditingControllerAccessibility *)self tsaxRespondsToSelector:"tsaxDidUpdateSelectedChoiceForCompletionToken:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras])[(TSTFormulaTextEditingControllerAccessibility *)self tsaxDidUpdateSelectedChoiceForCompletionToken:[(TSTFormulaTextEditingControllerAccessibility *)self tsaxCompletionToken]]; {
  }
    }
}

- (void)endInsertingKeyboardReferenceLeavingActive:(BOOL)a3
{
  id v5 = [(TSTFormulaTextEditingControllerAccessibility *)self tsaxValueForKey:@"mKeyboardReferenceToken"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_256630;
  v6[3] = &unk_457278;
  v6[4] = self;
  BOOL v7 = a3;
  [(TSWPEditingControllerAccessibility *)self tsaxPerformBlockAffectingTextSelection:v6];
  if (objc_msgSend(objc_msgSend(v5, "tsaxValueForKey:", @"expressionNode"), "tsaxBoolValueForKey:", @"isBlankForKeyboardInsertion"))
  {
    if ([(TSTFormulaTextEditingControllerAccessibility *)self tsaxRespondsToSelector:"tsaxDidDeleteBlankReferenceTokenForKeyboardInsertion" fromExtrasProtocol:&OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras])[(TSTFormulaTextEditingControllerAccessibility *)self tsaxDidDeleteBlankReferenceTokenForKeyboardInsertion]; {
  }
    }
}

- (void)insertTabIgnoringFieldEditor:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_256758;
  v3[3] = &unk_456E38;
  v3[4] = a3;
  v3[5] = self;
  [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:v3];
}

- (void)p_insertTab:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_256800;
  v3[3] = &unk_456E38;
  v3[4] = a3;
  v3[5] = self;
  [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:v3];
}

- (void)p_modifyKeyboardReferenceInDirection:(int)a3 withModifierKeys:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2568AC;
  v4[3] = &unk_457250;
  int v5 = a3;
  int v6 = a4;
  v4[4] = self;
  [(TSTFormulaTextEditingControllerAccessibility *)self tsaxPerformBlockAffectingKeyboardReferenceToken:v4];
}

- (void)p_startInsertingKeyboardReference
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_256958;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  [(TSTFormulaTextEditingControllerAccessibility *)self tsaxPerformBlockAffectingKeyboardReferenceToken:v2];
}

- (void)setAutocompletionText:(id)a3 prefixRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v8 = [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxFormulaPlainTextOfAbsorbedToken];
  if ([(NSString *)v8 length])
  {
    if ([(TSTFormulaTextEditingControllerAccessibility *)self tsaxRespondsToSelector:"tsaxWillAbsorbePreviousFormulaTokenWithText:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras])[(TSTFormulaTextEditingControllerAccessibility *)self tsaxWillAbsorbePreviousFormulaTokenWithText:v8]; {
    [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetFormulaPlainTextOfAbsorbedToken:0];
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_256B20;
    v11[3] = &unk_45BF00;
    void v11[6] = location;
    v11[7] = length;
    v11[4] = a3;
    v11[5] = self;
    [(TSWPEditingControllerAccessibility *)self tsaxPerformBlockAffectingTextSelection:v11];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TSTFormulaTextEditingControllerAccessibility;
    -[TSTFormulaTextEditingControllerAccessibility setAutocompletionText:prefixRange:](&v10, "setAutocompletionText:prefixRange:", a3, location, length);
  }
  if (![(TSTFormulaTextEditingControllerAccessibility *)self _tsaxDidUpdateAutocompletionText])
  {
    if ([(TSTFormulaTextEditingControllerAccessibility *)self tsaxRespondsToSelector:"tsaxDidUpdateAutocompletionTextForToken:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras])
    {
      [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetDidUpdateAutocompletionText:1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_256B60;
      block[3] = &unk_456DE0;
      block[4] = self;
      TSAccessibilityPerformBlockAsynchronouslyOnMainThread(block);
    }
  }
}

- (void)setSelection:(id)a3 withFlags:(unint64_t)a4
{
  if ([(TSTFormulaTextEditingControllerAccessibility *)self _tsaxIsAcceptingTypedText]
    && ![(TSTFormulaTextEditingControllerAccessibility *)self _tsaxFormulaPlainTextOfAbsorbedToken])
  {
    char v20 = 0;
    BOOL v7 = objc_opt_class();
    Class v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)a3, 1, &v20);
    if (v20) {
      abort();
    }
    Class v9 = v8;
    objc_super v10 = (char *)[(TSWPEditingControllerAccessibility *)self tsaxSelectedTextRange];
    uint64_t v12 = v11;
    uint64_t v13 = (char *)[(objc_class *)v9 tsaxRange];
    if (!v12 && v14 == 1 && v13 + 1 == v10)
    {
      id v16 = [(TSWPStorageAccessibility *)[(TSWPRepAccessibility *)[(TSWPEditingControllerAccessibility *)self tsaxEditingRepWithCaret] tsaxStorage] tsaxAttachmentOrFootnoteAtCharIndex:v13];
      long long v17 = objc_opt_class();
      Class v18 = __TSAccessibilityCastAsSafeCategory(v17, (uint64_t)v16, 0, 0);
      if (v18) {
        [(TSTFormulaTextEditingControllerAccessibility *)self _tsaxSetFormulaPlainTextOfAbsorbedToken:[(objc_class *)v18 tsaxFormulaPlainText]];
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)TSTFormulaTextEditingControllerAccessibility;
  [(TSTFormulaTextEditingControllerAccessibility *)&v19 setSelection:a3 withFlags:a4];
}

@end