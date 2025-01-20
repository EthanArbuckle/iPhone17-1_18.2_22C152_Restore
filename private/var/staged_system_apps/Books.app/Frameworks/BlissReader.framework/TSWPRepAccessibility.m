@interface TSWPRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_tsaxHasTextContent;
- (BOOL)_tsaxRepRangeIsHeading;
- (BOOL)_tsaxTextIsEditable;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxIsEditing;
- (BOOL)tsaxIsSelectionHighlightSuppressed;
- (BOOL)tsaxNeedsEditRotorMenu;
- (BOOL)tsaxNeedsTextEntryTrait;
- (BOOL)tsaxRepRangeContainsLocation:(unint64_t)a3;
- (BOOL)tsaxShouldIgnoreParentShape;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (NSArray)tsaxColumns;
- (TSWPEditingControllerAccessibility)tsaxEditingController;
- (TSWPInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController;
- (TSWPRepAccessibility)_tsaxShapeContainedTextRep;
- (TSWPStorageAccessibility)tsaxStorage;
- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)tsaxClampRangeToStorageRange:(_NSRange)a3;
- (_NSRange)tsaxRepRangeWithStorageRange:(_NSRange)a3;
- (_NSRange)tsaxStorageRangeOfRep;
- (_NSRange)tsaxStorageRangeWithRepRange:(_NSRange)a3;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3;
- (id)_accessibilityValueForRange:(_NSRange *)a3;
- (id)_tsaxGetDictionaryForLineNumber:(unint64_t)a3 columnNumber:(unint64_t)a4;
- (id)_tsaxLineNumberAndColumnForPosition:(unint64_t)a3;
- (id)_tsaxParentPlaceholderDescription;
- (id)_tsaxParentShapeHint;
- (id)_tsaxParentShapeLabel;
- (id)_tsaxProcessStringForObjectReplacements:(id)a3 rangeOffset:(unint64_t)a4;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (id)tsaxBeginEditingWithChosenTextRepReference:(id *)a3;
- (id)tsaxKnobLabel;
- (id)tsaxSubstringInStorageWithRange:(_NSRange)a3;
- (id)tsaxSummaryDescription;
- (int64_t)_accessibilityLineEndPosition;
- (int64_t)_accessibilityLineStartPosition;
- (unint64_t)_tsaxLastCharacterIndexForActivation;
- (unint64_t)_tsaxLinePosition:(BOOL)a3;
- (unint64_t)accessibilityTraits;
- (unint64_t)tsaxRepPositionWithStoragePosition:(unint64_t)a3;
- (unint64_t)tsaxStoragePositionWithRepPosition:(unint64_t)a3;
- (void)_accessibilityInsertText:(id)a3;
- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_tsaxActivationShouldBeginEditing:(BOOL *)a3 shouldHandleCanvasSelection:(BOOL *)a4;
- (void)_tsaxCondenseAttributedString:(id)a3;
- (void)_tsaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPoint:(CGPoint)a5;
- (void)_tsaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPosition:(unint64_t)a5;
- (void)_tsaxSetLastCharacterIndexForActivation:(unint64_t)a3;
- (void)_tsaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4;
- (void)_tsaxSetShapeContainedTextRep:(id)a3;
- (void)pulseCaret;
- (void)tsaxEnumerateAttachedReps:(id)a3;
- (void)tsaxEnumerateSpecialTextTokensInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)tsaxLoadAccessibilityInformation;
- (void)tsaxSetShouldIgnoreParentShape:(BOOL)a3;
@end

@implementation TSWPRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)tsaxShouldIgnoreParentShape
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738B8);
}

- (void)tsaxSetShouldIgnoreParentShape:(BOOL)a3
{
}

- (BOOL)tsaxIsEditing
{
  return [(TSWPRepAccessibility *)self tsaxBoolValueForKey:@"isEditing"];
}

- (_NSRange)tsaxStorageRangeOfRep
{
  id v2 = [(TSWPRepAccessibility *)self tsaxRangeValueForKey:@"range"];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (TSWPStorageAccessibility)tsaxStorage
{
  char v5 = 0;
  NSUInteger v3 = objc_opt_class();
  _NSRange result = (TSWPStorageAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"storage"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSWPEditingControllerAccessibility)tsaxEditingController
{
  if (![(TSWPRepAccessibility *)self tsaxIsEditing]) {
    return 0;
  }
  char v5 = 0;
  NSUInteger v3 = objc_opt_class();
  _NSRange result = (TSWPEditingControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[TSWPInteractiveCanvasControllerAccessibility tsaxValueForKey:](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxValueForKey:", @"editorController"), "tsaxValueForKey:", @"textInputEditor"), 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)tsaxIsSelectionHighlightSuppressed
{
  return [(TSWPRepAccessibility *)self tsaxBoolValueForKey:@"isSelectionHighlightSuppressed"];
}

- (NSArray)tsaxColumns
{
  char v5 = 0;
  NSUInteger v3 = (objc_class *)objc_opt_class();
  _NSRange result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxValueForKey:@"columns"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSWPInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  char v7 = 0;
  NSUInteger v3 = objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)TSWPRepAccessibility;
  v4 = [(TSDRepAccessibility *)&v6 tsaxInteractiveCanvasController];
  _NSRange result = (TSWPInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7) {
    abort();
  }
  return result;
}

- (id)tsaxBeginEditingWithChosenTextRepReference:(id *)a3
{
  char v5 = objc_opt_class();
  Class v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 0, 0);
  char v7 = self;
  if (v6)
  {
    Class v8 = v6;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_25A6C8;
    v21[3] = &unk_456DE0;
    v21[4] = v6;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v21)) {
      goto LABEL_9;
    }
    char v7 = (TSWPRepAccessibility *)[(objc_class *)v8 tsaxContainedRep];
  }
  v9 = [(TSWPRepAccessibility *)self tsaxInteractiveCanvasController];
  char v20 = 0;
  v10 = objc_opt_class();
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = sub_25A6D0;
  v18 = sub_25A6E0;
  uint64_t v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_25A6EC;
  v13[3] = &unk_457DA0;
  v13[5] = v7;
  v13[6] = &v14;
  v13[4] = v9;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v13)) {
    abort();
  }
  uint64_t v11 = v15[5];
  _Block_object_dispose(&v14, 8);
  id result = __TSAccessibilityCastAsSafeCategory(v10, v11, 1, &v20);
  if (v20) {
LABEL_9:
  }
    abort();
  if (a3) {
    *a3 = v7;
  }
  return result;
}

- (_NSRange)tsaxClampRangeToStorageRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5.NSUInteger location = (NSUInteger)[(TSWPStorageAccessibility *)[(TSWPRepAccessibility *)self tsaxStorage] tsaxRange];
  if (location + length == v5.location + v5.length)
  {
    NSUInteger v6 = location;
    NSUInteger v7 = length;
  }
  else
  {
    v8.NSUInteger location = location;
    v8.NSUInteger length = length;
    NSRange v9 = NSIntersectionRange(v5, v8);
    NSUInteger v7 = v9.length;
    NSUInteger v6 = v9.location;
  }
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (void)tsaxEnumerateAttachedReps:(id)a3
{
  id v5 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  uint64_t v7 = v6;
  Class v8 = NSClassFromString(@"TSWPDrawableAttachment");
  NSRange v9 = [(TSWPRepAccessibility *)self tsaxInteractiveCanvasController];
  if (v9)
  {
    if (v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_25A858;
      v10[3] = &unk_46BA78;
      v10[7] = v5;
      v10[8] = v7;
      v10[4] = v8;
      v10[5] = v9;
      v10[6] = a3;
      [(TSWPStorageAccessibility *)[(TSWPRepAccessibility *)self tsaxStorage] tsaxEnumerateAttachmentsUsingBlock:v10];
    }
  }
}

- (_NSRange)tsaxRepRangeWithStorageRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = [(TSWPRepAccessibility *)self tsaxRepPositionWithStoragePosition:a3.location];
  NSUInteger v5 = length;
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (unint64_t)tsaxRepPositionWithStoragePosition:(unint64_t)a3
{
  return a3 - (void)[(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
}

- (_NSRange)tsaxStorageRangeWithRepRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = [(TSWPRepAccessibility *)self tsaxStoragePositionWithRepPosition:a3.location];
  NSUInteger v5 = length;
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (unint64_t)tsaxStoragePositionWithRepPosition:(unint64_t)a3
{
  return (unint64_t)[(TSWPRepAccessibility *)self tsaxStorageRangeOfRep] + a3;
}

- (void)tsaxLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)TSWPRepAccessibility;
  [(TSWPRepAccessibility *)&v11 tsaxLoadAccessibilityInformation];
  NSUInteger v3 = [(TSWPRepAccessibility *)self tsaxStorage];
  char v10 = 0;
  NSUInteger v4 = objc_opt_class();
  Class v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)[(TSWPRepAccessibility *)self tsaxInteractiveCanvasController], 1, &v10);
  if (v10) {
    abort();
  }
  if (v3)
  {
    Class v6 = v5;
    if (v5)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_25AB40;
      v9[3] = &unk_46BAA0;
      v9[4] = v5;
      [(TSWPStorageAccessibility *)v3 tsaxEnumerateAttachmentsUsingBlock:v9];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_25AB4C;
      v8[3] = &unk_46BAC8;
      v8[4] = v6;
      [(TSWPStorageAccessibility *)v3 tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:v8];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_25AB58;
      v7[3] = &unk_46BAF0;
      v7[4] = v6;
      [(TSWPStorageAccessibility *)v3 tsaxEnumerateSmartFieldsUsingBlock:v7];
    }
  }
}

- (id)tsaxSummaryDescription
{
  if (![(TSWPRepAccessibility *)self tsaxRespondsToSelector:"tsaxSubstringInStorageWithRange:" fromExtrasProtocol:&OBJC_PROTOCOL___TSWPRepAccessibilityExtras])return 0; {
  id v4 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  }

  return -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v4, v3);
}

- (void)pulseCaret
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPRepAccessibility;
  [(TSWPRepAccessibility *)&v3 pulseCaret];
  if ([(TSWPRepAccessibility *)self tsaxRespondsToSelector:"tsaxDidPulseCaret" fromExtrasProtocol:&OBJC_PROTOCOL___TSWPRepAccessibilityExtras])[(TSWPRepAccessibility *)self tsaxDidPulseCaret]; {
}
  }

- (unint64_t)_tsaxLastCharacterIndexForActivation
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_573A51);
}

- (void)_tsaxSetLastCharacterIndexForActivation:(unint64_t)a3
{
}

- (TSWPRepAccessibility)_tsaxShapeContainedTextRep
{
  return (TSWPRepAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_573A52);
}

- (void)_tsaxSetShapeContainedTextRep:(id)a3
{
}

- (id)_tsaxProcessStringForObjectReplacements:(id)a3 rangeOffset:(unint64_t)a4
{
  __int16 v38 = -4;
  uint64_t v7 = +[NSString stringWithCharacters:&v38 length:1];
  Class v8 = (char *)[a3 length];
  id v9 = +[NSMutableDictionary dictionary];
  char v10 = 0;
  objc_super v11 = 0;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  id v32 = a3;
  while (1)
  {
    v13 = [a3 rangeOfString:v7 options:0 range:v10, v8 - v10];
    if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    v15 = v13;
    uint64_t v16 = v14;
    if (v11) {
      [v11 appendString:[a3 substringWithRange:v12, &v13[-v12]]];
    }
    else {
      objc_super v11 = +[NSMutableString stringWithString:[a3 substringWithRange:0, v13]];
    }
    id v17 = [(TSWPStorageAccessibility *)[(TSWPRepAccessibility *)self tsaxStorage] tsaxAttachmentOrFootnoteAtCharIndex:&v15[a4]];
    NSClassFromString(@"TSWPDrawableAttachment");
    if (objc_opt_isKindOfClass())
    {
      id v18 = -[TSDInteractiveCanvasControllerAccessibility tsaxRepForInfo:](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxRepForInfo:", [v17 tsaxValueForKey:@"drawable"]);
      if (![v18 tsaxShouldExposeAsAttachmentToken])
      {
        id v21 = [v18 accessibilityLabel];
LABEL_14:
        v22 = v21;
        goto LABEL_15;
      }
      a3 = v32;
      [v9 setObject:v18 forKey:[NSNumber numberWithInteger:[v11 length]]];
    }
    else
    {
      NSClassFromString(@"TSTWPTokenAttachment");
      if (objc_opt_isKindOfClass())
      {
        LOBYTE(v37) = 0;
        uint64_t v19 = objc_opt_class();
        Class v20 = __TSAccessibilityCastAsSafeCategory(v19, (uint64_t)v17, 1, &v37);
        if ((_BYTE)v37) {
          abort();
        }
        id v21 = [(objc_class *)v20 tsaxFormulaPlainText];
        goto LABEL_14;
      }
    }
    v22 = 0;
LABEL_15:
    if ([v22 length]) {
      [(NSMutableString *)v11 appendFormat:@" %@ ", v22];
    }
    char v10 = &v15[v16];
    if (&v15[v16] != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = (uint64_t)&v15[v16];
      if (&v10[v16] <= v8) {
        continue;
      }
    }
    goto LABEL_23;
  }
  if (v11 && v12 != 0x7FFFFFFFFFFFFFFFLL) {
    [v11 appendString:[a3 substringWithRange:v12, &v8[-v12]]];
  }
LABEL_23:
  if ([v9 count] && v11)
  {
    if (![(NSMutableString *)v11 length])
    {
      __int16 v37 = -4;
      objc_super v11 = +[NSMutableString stringWithCharacters:&v37 length:1];
    }
    id v23 = [objc_alloc((Class)AXAttributedString) initWithString:v11];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v34;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v9);
          }
          v28 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v29 = [v9 objectForKey:v28];
          for (j = (char *)[v28 integerValue]; j; --j)
          {
            if (j + 1 <= [v23 length]) {
              break;
            }
          }
          [v23 setAttribute:v29 forKey:@"UIAccessibilityTokenAttachment" withRange:j -[NSMutableString length](v11, "length") != 0];
        }
        id v25 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v25);
    }
    objc_super v11 = (NSMutableString *)v23;
    a3 = v32;
  }
  if (v11) {
    return v11;
  }
  else {
    return a3;
  }
}

- (BOOL)tsaxNeedsEditRotorMenu
{
  if ([(TSWPRepAccessibility *)self tsaxIsEditing]) {
    return 1;
  }

  return [(TSDRepAccessibility *)self tsaxIsSelected];
}

- (id)accessibilityCustomActions
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPRepAccessibility;
  id result = [[-[TSDRepAccessibility accessibilityCustomActions](&v3, "accessibilityCustomActions") mutableCopy]];
  if (!result) {
    return +[NSMutableArray array];
  }
  return result;
}

- (BOOL)tsaxNeedsTextEntryTrait
{
  return [(TSWPStorageAccessibility *)[(TSWPRepAccessibility *)self tsaxStorage] tsaxUnsignedIntValueForKey:@"wpKind"] < 5;
}

- (void)tsaxEnumerateSpecialTextTokensInRange:(_NSRange)a3 usingBlock:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_27ABE4;
  v5[3] = &unk_46C328;
  _NSRange v6 = a3;
  v5[4] = [(TSWPRepAccessibility *)self tsaxStorage];
  v5[5] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
}

- (void)_tsaxCondenseAttributedString:(id)a3
{
  id v4 = [a3 length];
  if (v4)
  {
    unint64_t v5 = (unint64_t)v4;
    NSUInteger v6 = 0;
    uint64_t v7 = 0;
    NSUInteger location = 0;
    v14.NSUInteger location = 0;
    v14.NSUInteger length = 0;
    NSUInteger length = 1;
    do
    {
      id v10 = [a3 attributesAtIndex:v6 effectiveRange:&v14];
      if ([v7 isEqual:v10])
      {
        v15.NSUInteger location = location;
        v15.NSUInteger length = length;
        NSRange v11 = NSUnionRange(v15, v14);
        NSUInteger location = v11.location;
        NSUInteger length = v11.length;
        NSUInteger v12 = v14.location;
        NSUInteger v13 = v14.length;
      }
      else
      {
        if (v7) {
          [a3 setAttributes:v7 range:{location, length}];
        }
        NSUInteger v12 = v14.location;
        NSUInteger v13 = v14.length;
        uint64_t v7 = v10;
        NSUInteger location = v14.location;
        NSUInteger length = v14.length;
      }
      NSUInteger v6 = v13 + v12;
    }
    while (v13 + v12 < v5);
    if (v7) {
      [a3 setAttributes:v7 range:NSMakeRange(location, length)];
    }
  }
}

- (id)tsaxSubstringInStorageWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = [(TSWPRepAccessibility *)self tsaxStorage];
  v25.NSUInteger location = (NSUInteger)[(TSWPStorageAccessibility *)v6 tsaxRange];
  v25.NSUInteger length = v7;
  v24.NSUInteger location = location;
  v24.NSUInteger length = length;
  NSRange v8 = NSIntersectionRange(v24, v25);
  id v9 = -[TSWPStorageAccessibility substringWithRange:](v6, "substringWithRange:", v8.location, v8.length);
  id v10 = -[TSWPStorageAccessibility stringEquivalentFromRange:](v6, "stringEquivalentFromRange:", v8.location, v8.length);
  if (v9)
  {
    NSRange v11 = v10;
    if (v10)
    {
      NSUInteger v12 = (char *)[v10 length];
      if ([v9 length] == v12)
      {
        if (v12
          && (NSUInteger v13 = v12 - 1,
              objc_msgSend(objc_msgSend(v11, "substringFromIndex:", v13), "isEqualToString:", @"\r"))
          && objc_msgSend(objc_msgSend(v9, "substringFromIndex:", v13), "isEqualToString:", @"\n"))
        {
          id v9 = [v11 stringByReplacingCharactersInRange:v13 withString:@"\n"];
        }
        else
        {
          id v9 = v11;
        }
      }
    }
  }
  if ([v9 length]) {
    id v9 = [(TSWPRepAccessibility *)self _tsaxProcessStringForObjectReplacements:v9 rangeOffset:v8.location];
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  id v21 = sub_27B00C;
  v22 = sub_27B01C;
  uint64_t v23 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_27B028;
  v16[3] = &unk_46C350;
  v16[4] = v9;
  v16[5] = &v18;
  NSRange v17 = v8;
  -[TSWPRepAccessibility tsaxEnumerateSpecialTextTokensInRange:usingBlock:](self, "tsaxEnumerateSpecialTextTokensInRange:usingBlock:", v8.location, v8.length, v16);
  NSRange v14 = (void *)v19[5];
  if (v14) {
    id v9 = v14;
  }
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  id v4 = -[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3->location, a3->length);
  NSUInteger v6 = v5;
  NSUInteger v7 = [(TSWPRepAccessibility *)self tsaxStorage];
  v38.NSUInteger location = (NSUInteger)[(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  v38.NSUInteger length = v8;
  v37.NSUInteger location = (NSUInteger)v4;
  v37.NSUInteger length = v6;
  NSRange v9 = NSIntersectionRange(v37, v38);
  if (!v9.length) {
    return 0;
  }
  id v34 = v4;
  id v10 = -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v9.location, v9.length);
  objc_opt_class();
  NSUInteger v33 = v6;
  if (objc_opt_isKindOfClass()) {
    id v11 = objc_msgSend(objc_msgSend(v10, "cfAttributedString"), "mutableCopy");
  }
  else {
    id v11 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v10];
  }
  NSUInteger v13 = v11;
  [v11 beginEditing];
  uint64_t v14 = 0;
  long long v36 = xmmword_3447B0;
  do
  {
    if (v14 + 1 > (unint64_t)[v13 length]) {
      break;
    }
    NSRange v15 = [TSWPStorageAccessibility createFontAtCharIndex:v9.location + v14 scaleTextPercent:100 effectiveRange:&v36 styleProvider:[self columnForCharIndex:v9.location + v14] tsaxValueForKey:@"styleProvider"]
    if (v15)
    {
      uint64_t v16 = v15;
      CFStringRef v17 = CTFontCopyName(v15, kCTFontFamilyNameKey);
      if (v17)
      {
        CFStringRef v18 = v17;
        [v13 addAttribute:@"UIAccessibilityTokenFontFamily" value:v17 range:v14];
        CFRelease(v18);
      }
      CFStringRef v19 = CTFontCopyName(v16, kCTFontPostScriptNameKey);
      if (v19)
      {
        CFStringRef v20 = v19;
        [v13 addAttribute:@"UIAccessibilityTokenFontName" value:v19 range:v14];
        CFRelease(v20);
      }
      CFRelease(v16);
    }
    id v21 = [(TSWPStorageAccessibility *)v7 valueForProperty:19 atCharIndex:v9.location + v14 effectiveRange:&v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v13 addAttribute:@"UIAccessibilityTokenBold" value:v21 range:v14];
    }
    id v22 = [(TSWPStorageAccessibility *)v7 valueForProperty:20 atCharIndex:v9.location + v14 effectiveRange:&v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v13 addAttribute:@"UIAccessibilityTokenItalic" value:v22 range:v14];
    }
    id v23 = [(TSWPStorageAccessibility *)v7 valueForProperty:17 atCharIndex:v9.location + v14 effectiveRange:&v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v13 addAttribute:@"UIAccessibilityTokenFontSize" value:v23 range:v14];
    }
    id v24 = [(TSWPStorageAccessibility *)v7 valueForProperty:22 atCharIndex:v9.location + v14 effectiveRange:&v36];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v24 BOOLValue]) {
      [v13 addAttribute:@"UIAccessibilityTokenUnderline" value:v24 range:v14];
    }
    id v25 = [(TSWPStorageAccessibility *)v7 valueForProperty:18 atCharIndex:v9.location + v14 effectiveRange:&v36];
    NSClassFromString(@"TSUColor");
    if (objc_opt_isKindOfClass())
    {
      char v35 = 0;
      uint64_t v26 = objc_opt_class();
      Class v27 = __TSAccessibilityCastAsSafeCategory(v26, (uint64_t)v25, 1, &v35);
      if (v35) {
        abort();
      }
      [v13 addAttribute:@"UIAccessibilityTokenForegroundColor" value:[objc_class tsaxStyleInfoDescription](v27, "tsaxStyleInfoDescription") range:v14];
    }
    id v28 = [(TSWPStorageAccessibility *)v7 valueForProperty:86 atCharIndex:v9.location + v14 effectiveRange:&v36];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = [v28 integerValue];
      if ((unint64_t)v29 >= 4) {
        uint64_t v30 = 4;
      }
      else {
        uint64_t v30 = (uint64_t)v29;
      }
      id v31 = [objc_alloc((Class)NSNumber) initWithInteger:v30];
      [v13 addAttribute:@"UIAccessibilityTokenParagraphAlignment" value:v31 range:v14];
    }
    id v32 = [(TSWPEditingControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxEditingController] tsaxListItemLabelForLineAtCurrentSelection];
    if (v32) {
      [v13 addAttribute:@"UIAccessibilityTokenListItemLabel" value:v32 range:v14];
    }
    ++v14;
  }
  while (v9.location + v14 < v9.location + v9.length);
  if (-[TSWPStorageAccessibility tsaxContainsAnnotationInRange:]([(TSWPRepAccessibility *)self tsaxStorage], "tsaxContainsAnnotationInRange:", v34, v33))
  {
    [v13 appendAttributedString:[objc_alloc((Class)NSAttributedString) initWithString:[NSString stringWithFormat:@", %@", TSAccessibilityLocalizedString(@"annotation.has.annotation")] attributes:0]];
  }
  [v13 endEditing];
  [(TSWPRepAccessibility *)self _tsaxCondenseAttributedString:v13];
  [(TSWPRepAccessibility *)self performSelector:NSSelectorFromString(@"_accessibilityAddMispellingsToAttributedString:") withObject:v13];
  return v13;
}

- (id)_accessibilityValueForRange:(_NSRange *)a3
{
  id v4 = -[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3->location, a3->length);
  NSUInteger v6 = v5;
  v12.NSUInteger location = (NSUInteger)[(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  v12.NSUInteger length = v7;
  v11.NSUInteger location = (NSUInteger)v4;
  v11.NSUInteger length = v6;
  NSRange v8 = NSIntersectionRange(v11, v12);
  if (!v8.length) {
    return 0;
  }

  return -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v8.location, v8.length);
}

- (BOOL)_tsaxTextIsEditable
{
  return [(TSWPRepAccessibility *)self tsaxInteractiveCanvasController] != 0;
}

- (void)_tsaxActivationShouldBeginEditing:(BOOL *)a3 shouldHandleCanvasSelection:(BOOL *)a4
{
  if (![(TSWPRepAccessibility *)self tsaxInteractiveCanvasController]
    || (NSUInteger v7 = [(TSDRepAccessibility *)self tsaxRepForSelecting]) != 0
    && ![(TSDRepAccessibility *)v7 tsaxIsSelected])
  {
    char v10 = 0;
    BOOL v9 = 1;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  unsigned __int8 v8 = [(TSWPRepAccessibility *)self tsaxIsEditing];
  BOOL v9 = 0;
  char v10 = v8 ^ 1;
  if (a3) {
LABEL_7:
  }
    *a3 = v10;
LABEL_8:
  if (a4) {
    *a4 = v9;
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  __int16 v5 = 0;
  [(TSWPRepAccessibility *)self _tsaxActivationShouldBeginEditing:(char *)&v5 + 1 shouldHandleCanvasSelection:&v5];
  if (HIBYTE(v5)) {
    return 1;
  }
  if (!(_BYTE)v5) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPRepAccessibility;
  return [(TSDRepAccessibility *)&v4 _accessibilitySupportsActivateAction];
}

- (BOOL)accessibilityActivate
{
  __int16 v10 = 0;
  [(TSWPRepAccessibility *)self _tsaxActivationShouldBeginEditing:(char *)&v10 + 1 shouldHandleCanvasSelection:&v10];
  if (HIBYTE(v10))
  {
    BOOL v9 = 0;
    id v3 = [(TSWPRepAccessibility *)self tsaxBeginEditingWithChosenTextRepReference:&v9];
    objc_super v4 = self;
    if (v9 != self)
    {
      __int16 v5 = [(TSDRepAccessibility *)self tsaxParentRep];
      objc_super v4 = v9;
      if (!v5)
      {
        [(TSWPRepAccessibility *)self _tsaxSetShapeContainedTextRep:v9];
        objc_super v4 = v9;
      }
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_27B988;
    v8[3] = &unk_456E38;
    v8[4] = v3;
    void v8[5] = v4;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
      abort();
    }
    [(TSDInteractiveCanvasControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxInteractiveCanvasController] tsaxScrollToPrimarySelection];
    return 1;
  }
  else if ((_BYTE)v10)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSWPRepAccessibility;
    return [(TSDRepAccessibility *)&v7 accessibilityActivate];
  }
  else
  {
    return 0;
  }
}

- (BOOL)tsaxRepRangeContainsLocation:(unint64_t)a3
{
  id v4 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  return a3 >= (unint64_t)v4 && a3 - (unint64_t)v4 < v5;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v4 = [(TSWPEditingControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxEditingController] tsaxSelectedTextRange];

  id v5 = -[TSWPRepAccessibility tsaxRepRangeWithStorageRange:](self, "tsaxRepRangeWithStorageRange:", v4, v3);
  result.NSUInteger length = v6;
  result.NSUInteger location = (NSUInteger)v5;
  return result;
}

- (void)_tsaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v6 = (char *)-[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3.location, a3.length);
  NSUInteger v8 = v7;
  BOOL v9 = (char *)[(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  NSUInteger v11 = (NSUInteger)v9;
  if (v8 || v6 < &v9[v10 + 1])
  {
    if (v8) {
      v14.NSUInteger length = v10;
    }
    else {
      v14.NSUInteger length = v10 + 1;
    }
    v20.NSUInteger location = (NSUInteger)v6;
    v20.NSUInteger length = v8;
    v14.NSUInteger location = v11;
    NSRange v15 = NSIntersectionRange(v20, v14);
    NSUInteger location = v15.location;
    NSUInteger length = v15.length;
    if (v15.location) {
      goto LABEL_12;
    }
  }
  else
  {
    NSUInteger length = 0;
    NSUInteger location = (NSUInteger)&v9[v10];
    if (&v9[v10]) {
      goto LABEL_12;
    }
  }
  if ((char *)v11 == v6)
  {
LABEL_12:
    id v16 = [(TSWPRepAccessibility *)self tsaxBeginEditingWithChosenTextRepReference:0];
    NSUInteger v17 = location;
    NSUInteger v18 = length;
    goto LABEL_13;
  }
  if ((unint64_t)v6 >= v11) {
    return;
  }
  id v16 = [(TSWPRepAccessibility *)self tsaxBeginEditingWithChosenTextRepReference:0];
  NSUInteger v17 = v11;
  NSUInteger v18 = 0;
LABEL_13:

  [v16 tsaxSetSelectedTextRange:v17 skipSelectionChangedNotification:v18];
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
}

- (unint64_t)_tsaxLinePosition:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TSWPEditingControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxEditingController] tsaxSelectedTextRange];
  id v6 = [(TSWPEditingControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxEditingController] tsaxStorageRangeOfLineFragmentAtCharIndex:v5];
  if (v6 == NSInvalidRange[0] && v7 == NSInvalidRange[1])
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Line fragment range not found for positionInStorage: %lu", v13, v14, v15, v16, v17, (uint64_t)v5))abort(); {
    }
      }
    return -1;
  }
  else
  {
    id v9 = v6;
    NSUInteger v10 = v7;
    if (v3)
    {
      return (unint64_t)-[TSWPRepAccessibility tsaxRepRangeWithStorageRange:](self, "tsaxRepRangeWithStorageRange:", v6, v7);
    }
    else
    {
      NSUInteger v18 = [(TSWPRepAccessibility *)self tsaxStorage];
      if (&v10[(void)v9] == (char *)[(TSWPStorageAccessibility *)v18 tsaxSelectionRangeMaxForCharIndex:v5])
      {
        return [(TSWPRepAccessibility *)self tsaxRepPositionWithStoragePosition:&v10[(void)v9]];
      }
      else
      {
        id v19 = [(TSWPStorageAccessibility *)v18 tsaxRange];
        id v21 = +[TSWPFilteredStorageAccessibility tsaxNewFilteredStorageWithStorage:subRange:](TSWPFilteredStorageAccessibility, "tsaxNewFilteredStorageWithStorage:subRange:", v18, v19, v20);
        unint64_t v22 = -[TSWPRepAccessibility tsaxRepPositionWithStoragePosition:](self, "tsaxRepPositionWithStoragePosition:", [v21 tsaxPreviousCharacterIndex:&v10[(void)v9]]);

        return v22;
      }
    }
  }
}

- (int64_t)_accessibilityLineEndPosition
{
  return [(TSWPRepAccessibility *)self _tsaxLinePosition:0];
}

- (int64_t)_accessibilityLineStartPosition
{
  return [(TSWPRepAccessibility *)self _tsaxLinePosition:1];
}

- (unint64_t)accessibilityTraits
{
  v14.receiver = self;
  v14.super_class = (Class)TSWPRepAccessibility;
  unint64_t v3 = [(TSDRepAccessibility *)&v14 accessibilityTraits];
  unsigned int v4 = [(TSWPRepAccessibility *)self tsaxNeedsTextEntryTrait];
  uint64_t v5 = TSAccessibilityTraitTextEntry;
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;
  if ([(TSWPRepAccessibility *)self tsaxIsEditing]
    || ![(TSDRepAccessibility *)self tsaxParentRep]
    && [[(TSWPRepAccessibility *)self _tsaxShapeContainedTextRep] tsaxIsEditing])
  {
    uint64_t v7 = TSAccessibilityTraitIsEditing | TSAccessibilityTraitTextOperationsAvailable | v6;
  }
  else
  {
    uint64_t v7 = v6 & ~TSAccessibilityTraitIsEditing;
  }
  NSUInteger v8 = objc_opt_class();
  Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 0, 0);
  uint64_t v10 = TSAccessibilityTraitTextArea;
  if (v9) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v10 | v7;
  if ([(TSWPRepAccessibility *)self tsaxInteractiveCanvasController])
  {
    if ((TSAccessibilityTraitTextEntry & v11) != 0)
    {
      NSRange v12 = [(TSDRepAccessibility *)self tsaxRepForSelecting];
      if (v12)
      {
        if (![(TSDRepAccessibility *)v12 tsaxIsSelected]) {
          v11 |= TSAccessibilityTraitStaticText;
        }
      }
    }
  }
  else
  {
    v11 &= ~(TSAccessibilityTraitTextArea | TSAccessibilityTraitTextEntry);
  }
  [(TSWPRepAccessibility *)self _tsaxRepRangeIsHeading];
  return (unint64_t)[(TSWPStorageAccessibility *)[(TSWPRepAccessibility *)self tsaxStorage] accessibilityTraits] | v11;
}

- (id)automationElements
{
  unint64_t v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 0, 0);
  if (v4)
  {
    return [(objc_class *)v4 tsaxKnobAccessibilityElements];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TSWPRepAccessibility;
    return [(TSWPRepAccessibility *)&v6 automationElements];
  }
}

- (id)accessibilityLabel
{
  id v3 = [(TSWPRepAccessibility *)self _tsaxParentPlaceholderDescription];
  id v4 = [(TSWPRepAccessibility *)self _tsaxParentShapeLabel];
  return __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (id)accessibilityHint
{
  if ([(TSWPRepAccessibility *)self tsaxIsEditing]) {
    return 0;
  }
  if ([(TSDRepAccessibility *)self tsaxIsSelected]) {
    id v4 = TSAccessibilityLocalizedString(@"edit.hint.iOS");
  }
  else {
    id v4 = 0;
  }
  id v5 = [(TSWPRepAccessibility *)self _tsaxParentShapeHint];
  if (![v5 length])
  {
    v12.receiver = self;
    v12.super_class = (Class)TSWPRepAccessibility;
    id v5 = [(TSDRepAccessibility *)&v12 accessibilityHint];
  }
  return __TSAccessibilityStringForVariables(1, v4, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString(@"text");
}

- (id)accessibilityValue
{
  id v4 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];

  return -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v4, v3);
}

- (BOOL)isAccessibilityElement
{
  return ![(TSDInteractiveCanvasControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxInteractiveCanvasController] tsaxInPrintPreviewMode];
}

- (id)_tsaxParentPlaceholderDescription
{
  uint64_t v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 0, 0);
  if (result)
  {
    return [result tsaxPlaceholderDescription];
  }
  return result;
}

- (BOOL)_tsaxRepRangeIsHeading
{
  uint64_t v3 = [(TSWPRepAccessibility *)self tsaxStorage];
  id v4 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  uint64_t v6 = v5;
  long long v10 = xmmword_3447B0;
  unsigned int v7 = [[v3 valueForProperty:47 atCharIndex:v4 effectiveRange:&v10] isEqualToString:@"heading"];
  if (v7) {
    LOBYTE(v7) = v4 == (id)v10 && v6 == *((void *)&v10 + 1);
  }
  return v7;
}

- (id)_tsaxParentShapeLabel
{
  uint64_t v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 0, 0);
  if (!v4) {
    return 0;
  }
  Class v5 = v4;
  if ([(TSWPRepAccessibility *)self tsaxShouldIgnoreParentShape]) {
    return 0;
  }

  return [(objc_class *)v5 accessibilityLabel];
}

- (id)_tsaxParentShapeHint
{
  uint64_t v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSDRepAccessibility *)self tsaxParentRep], 0, 0);
  if (!v4) {
    return 0;
  }
  Class v5 = v4;
  if ([(TSWPRepAccessibility *)self tsaxShouldIgnoreParentShape]) {
    return 0;
  }

  return [(objc_class *)v5 accessibilityHint];
}

- (id)_tsaxGetDictionaryForLineNumber:(unint64_t)a3 columnNumber:(unint64_t)a4
{
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), @"lineNumber", +[NSNumber numberWithInteger:a4], @"lineColumn", 0);
}

- (void)_tsaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPosition:(unint64_t)a5
{
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  id v9 = [(TSDRepAccessibility *)self tsaxValueForKey:@"columns"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(TSWPRepAccessibility *)self columnForCharIndex:a5];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_27C3E8;
    v12[3] = &unk_46C378;
    v12[4] = v10;
    v12[5] = &v13;
    [v9 enumerateObjectsUsingBlock:v12];
    unint64_t v11 = (unint64_t)[v10 lineIndexForCharIndex:a5 eol:1];
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3) {
LABEL_3:
  }
    *a3 = v11;
LABEL_4:
  if (a4) {
    *a4 = v14[3];
  }
  _Block_object_dispose(&v13, 8);
}

- (id)_tsaxLineNumberAndColumnForPosition:(unint64_t)a3
{
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  [(TSWPRepAccessibility *)self _tsaxGetEffectiveLineNumber:&v6 columnNumber:&v5 forPosition:a3];
  return [(TSWPRepAccessibility *)self _tsaxGetDictionaryForLineNumber:v6 columnNumber:v5];
}

- (void)_tsaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  id v10 = [(TSWPRepAccessibility *)self tsaxInteractiveCanvasController];
  char v24 = 0;
  unint64_t v11 = (objc_class *)objc_opt_class();
  objc_super v12 = (void *)__TSAccessibilityCastAsClass(v11, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)v10 tsaxCanvasView], 1, &v24);
  if (v24) {
    abort();
  }
  uint64_t v13 = v12;
  id v14 = [v12 window];
  if (v13) {
    BOOL v15 = v14 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (!v15)
  {
    [v13 convertPoint:v14 fromView:x, y];
    -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](v10, "tsaxConvertBoundsToUnscaledPoint:");
    -[TSDRepAccessibility tsaxConvertNaturalPointFromUnscaledCanvas:](self, "tsaxConvertNaturalPointFromUnscaledCanvas:");
    double v17 = v16;
    id v18 = -[TSWPRepAccessibility charIndexForPointWithPinning:](self, "charIndexForPointWithPinning:");
    [(TSWPRepAccessibility *)self _tsaxSetLastCharacterIndexForActivation:v18];
    [(TSWPRepAccessibility *)self _tsaxGetEffectiveLineNumber:&v26 columnNumber:&v25 forPosition:v18];
    if (v26)
    {
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v19 = [(TSWPRepAccessibility *)self columnForCharIndex:v18];
        id v20 = [v19 tsaxUnsignedIntegerValueForKey:@"countLines"];
        if (v26 - 1 < (unint64_t)v20)
        {
          [v19 boundsOfLineFragmentAtIndex:];
          if (v21 <= v17 && v17 <= v21 + v22 && v26 >= 2) {
            --v26;
          }
        }
      }
    }
  }
  if (a3) {
    *a3 = v26;
  }
  if (a4) {
    *a4 = v25;
  }
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  -[TSWPRepAccessibility _tsaxGetEffectiveLineNumber:columnNumber:forPoint:](self, "_tsaxGetEffectiveLineNumber:columnNumber:forPoint:", &v6, &v5, a3.x, a3.y);
  return [(TSWPRepAccessibility *)self _tsaxGetDictionaryForLineNumber:v6 columnNumber:v5];
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v5 = [a3 objectForKey:@"lineNumber"];
  if (!v5)
  {
    NSUInteger v10 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  unint64_t v6 = (unint64_t)[v5 integerValue];
  unint64_t v7 = (unint64_t)objc_msgSend(objc_msgSend(a3, "objectForKey:", @"lineColumn"), "integerValue");
  id v8 = [(TSDRepAccessibility *)self tsaxValueForKey:@"columns"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  NSUInteger v10 = 0;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  if ((isKindOfClass & 1) != 0 && (v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= (unint64_t)[v8 count])
    {
LABEL_8:
      NSUInteger v10 = 0;
      goto LABEL_10;
    }
    id v12 = [v8 objectAtIndex:v7];
    id v13 = [v12 tsaxUnsignedIntegerValueForKey:@"countLines"];
    NSUInteger v10 = 0;
    if ((v6 & 0x8000000000000000) == 0 && v6 < (unint64_t)v13)
    {
      id v14 = [v12 rangeOfLineFragmentAtIndex:v6];
      if (v15 > 0x7FFFFFFFFFFFFFFELL) {
        goto LABEL_8;
      }
      id v17 = -[TSWPRepAccessibility tsaxRepRangeWithStorageRange:](self, "tsaxRepRangeWithStorageRange:", v14, v15);
      uint64_t v11 = (uint64_t)v17;
      if (v10)
      {
        NSUInteger v18 = v10;
        v20[0] = v17;
        v20[1] = v10;
        id v19 = [(TSWPRepAccessibility *)self _accessibilityValueForRange:v20];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v19 = [v19 string];
        }
        NSUInteger v10 = v18 - [v19 hasSuffix:@"\n"];
      }
    }
  }
LABEL_10:
  NSUInteger v16 = v11;
  result.NSUInteger length = v10;
  result.NSUInteger location = v16;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  id v4 = -[TSWPRepAccessibility _tsaxLineNumberAndColumnForPosition:](self, "_tsaxLineNumberAndColumnForPosition:", -[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3, 0));

  id v5 = [(TSWPRepAccessibility *)self _accessibilityRangeForLineNumberAndColumn:v4];
  result.NSUInteger length = v6;
  result.NSUInteger location = (NSUInteger)v5;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  id v4 = (char *)-[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3.location, a3.length);
  uint64_t v6 = v5;
  [(TSDRepAccessibility *)self accessibilityFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [(TSDRepAccessibility *)self tsaxValueForKey:@"columns"];
  NSUInteger v16 = [(TSWPRepAccessibility *)self tsaxInteractiveCanvasController];
  LOBYTE(v38) = 0;
  id v17 = (objc_class *)objc_opt_class();
  long long v36 = (void *)__TSAccessibilityCastAsClass(v17, (uint64_t)[(TSDInteractiveCanvasControllerAccessibility *)v16 tsaxCanvasView], 1, &v38);
  if ((_BYTE)v38) {
    abort();
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v18 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v45;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v45 != v19) {
          objc_enumerationMutation(v15);
        }
        double v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        double v22 = [v21 tsaxRangeValueForKey:@"range" v36];
        if (v4 >= v22 && v4 < &v22[v23])
        {
          id v25 = +[TSWPSelectionAccessibility tsaxSelectionWithRange:](TSWPSelectionAccessibility, "tsaxSelectionWithRange:", v4, v6);
          uint64_t v38 = 0;
          v39 = &v38;
          uint64_t v40 = 0x3052000000;
          v41 = sub_27B00C;
          v42 = sub_27B01C;
          uint64_t v43 = 0;
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_27CB10;
          v37[3] = &unk_457DA0;
          v37[5] = v25;
          v37[6] = &v38;
          v37[4] = v21;
          if (__TSAccessibilityPerformSafeBlock((uint64_t)v37)) {
            abort();
          }
          Class v27 = (void *)v39[5];
          _Block_object_dispose(&v38, 8);
          if ([v27 count])
          {
            objc_msgSend(objc_msgSend(v27, "firstObject"), "CGRectValue");
            -[TSDRepAccessibility tsaxConvertNaturalRectToUnscaledCanvas:](self, "tsaxConvertNaturalRectToUnscaledCanvas:");
            -[TSDInteractiveCanvasControllerAccessibility tsaxConvertUnscaledToBoundsRect:](v16, "tsaxConvertUnscaledToBoundsRect:");
            [v36 tsaxFrameFromBounds:];
            double v8 = v28;
            double v10 = v29;
            double v12 = v30;
            double v14 = v31;
          }
          goto LABEL_18;
        }
      }
      id v18 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
LABEL_18:
  double v32 = v8;
  double v33 = v10;
  double v34 = v12;
  double v35 = v14;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  double v7 = (char *)[(TSWPStorageAccessibility *)[(TSWPEditingControllerAccessibility *)[(TSWPRepAccessibility *)self tsaxEditingController] tsaxStorage] tsaxRange];
  double v9 = &v7[v8 - a3];
  double v10 = [(TSWPRepAccessibility *)self tsaxEditingController];

  -[TSWPEditingControllerAccessibility tsaxReplaceRange:withText:](v10, "tsaxReplaceRange:withText:", v9, a3, a4);
}

- (void)_accessibilityInsertText:(id)a3
{
  id v4 = [(TSWPRepAccessibility *)self tsaxEditingController];

  [(TSWPEditingControllerAccessibility *)v4 tsaxInsertText:a3];
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3
{
  v31.NSUInteger length = a3.length;
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0) {
    return 0;
  }
  NSUInteger location = a3.location;
  double v7 = [(TSWPRepAccessibility *)self tsaxColumns];
  id v8 = [(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  id v9 = +[NSMutableArray array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obj = v7;
  id v10 = [(NSArray *)v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
  id v32 = v10;
  if (v10)
  {
    v31.NSUInteger location = (NSUInteger)v8 + location;
    uint64_t v30 = *(void *)v37;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
    CGFloat v35 = CGRectZero.origin.y;
    CGFloat v33 = CGRectZero.size.height;
    CGFloat v34 = CGRectZero.size.width;
    do
    {
      double v14 = 0;
      do
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v14);
        v41.NSUInteger location = (NSUInteger)[v15 tsaxRange];
        NSRange v16 = NSIntersectionRange(v41, v31);
        if (v16.length)
        {
          id v17 = (char *)[v15 tsaxLineIndexForCharIndex:v16.location eol:0];
          id v18 = (char *)[v15 tsaxLineIndexForCharIndex:v16.length + v16.location - 1 eol:0];
          if (v17 <= v18)
          {
            uint64_t v19 = v18;
            do
            {
              v42.NSUInteger location = (NSUInteger)[v15 tsaxRangeOfLineFragmentAtIndex:v17];
              NSRange v20 = NSIntersectionRange(v42, v16);
              -[TSWPRepAccessibility _accessibilityBoundsForRange:](self, "_accessibilityBoundsForRange:", v20.location - (unint64_t)v8, v20.length);
              double v22 = v21;
              double v24 = v23;
              double v26 = v25;
              double v28 = v27;
              v43.origin.double x = CGRectNull.origin.x;
              v43.origin.CGFloat y = y;
              v43.size.CGFloat width = width;
              v43.size.CGFloat height = height;
              v45.origin.double x = v22;
              v45.origin.CGFloat y = v24;
              v45.size.CGFloat width = v26;
              v45.size.CGFloat height = v28;
              if (!CGRectEqualToRect(v43, v45))
              {
                v44.origin.CGFloat y = v35;
                v44.origin.double x = CGRectZero.origin.x;
                v44.size.CGFloat height = v33;
                v44.size.CGFloat width = v34;
                v46.origin.double x = v22;
                v46.origin.CGFloat y = v24;
                v46.size.CGFloat width = v26;
                v46.size.CGFloat height = v28;
                if (!CGRectEqualToRect(v44, v46)) {
                  [v9 addObject:[NSValue valueWithCGRect:v22, v24, v26, v28]];
                }
              }
              ++v17;
            }
            while (v17 <= v19);
          }
        }
        double v14 = (char *)v14 + 1;
      }
      while (v14 != v32);
      id v32 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v32);
  }
  return [v9 copy];
}

- (BOOL)_tsaxHasTextContent
{
  id v3 = [(TSWPStorageAccessibility *)[(TSWPRepAccessibility *)self tsaxStorage] tsaxRange];
  NSUInteger v5 = v4;
  v7.NSUInteger location = (NSUInteger)[(TSWPRepAccessibility *)self tsaxStorageRangeOfRep];
  v8.NSUInteger location = (NSUInteger)v3;
  v8.NSUInteger length = v5;
  return NSIntersectionRange(v7, v8).length != 0;
}

@end