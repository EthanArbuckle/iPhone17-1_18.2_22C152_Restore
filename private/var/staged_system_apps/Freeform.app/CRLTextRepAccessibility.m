@interface CRLTextRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilityReplaceTextInRange:(_NSRange)a3 withString:(id)a4;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_crlaxHasTextContent;
- (BOOL)_crlaxTextIsEditable;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityEditOperationAction:(id)a3;
- (BOOL)crlaxIsBeingEdited;
- (BOOL)crlaxIsDecorativeElement;
- (BOOL)crlaxIsLockedDirectly;
- (BOOL)crlaxIsSelectionHighlightSuppressed;
- (BOOL)crlaxJumpToNextInferredHeading;
- (BOOL)crlaxJumpToPreviousInferredHeading;
- (BOOL)crlaxNeedsEditRotorMenu;
- (BOOL)crlaxNeedsFormatEditOperation;
- (BOOL)crlaxNeedsTextEntryTrait;
- (BOOL)crlaxPreventRotorCacheCleanup;
- (BOOL)crlaxPreventSelectedTextRangeChanges;
- (BOOL)crlaxRepRangeContainsLocation:(unint64_t)a3;
- (BOOL)crlaxSupportsPublicCustomRotors;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3;
- (CGRect)accessibilityFrameForScrolling;
- (CGRect)crlaxBoundsForStorageRange:(_NSRange)a3;
- (CRLRepAccessibilitySelectionRangeCache)crlaxLastSelection;
- (CRLTextEditorAccessibility)crlaxTextEditor;
- (CRLTextInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController;
- (CRLTextRepAccessibility)_crlaxShapeContainedTextRep;
- (CRLWPRep)crlaxRetainedTarget;
- (CRLWPStorageAccessibility)crlaxStorage;
- (NSArray)crlaxAccessibilityLabelCustomAttributes;
- (NSArray)crlaxColumns;
- (NSSet)crlaxSiblings;
- (NSString)crlaxAccessibilityLabelCustomAttributesString;
- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3;
- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3;
- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3;
- (_NSRange)_accessibilitySelectedTextRange;
- (_NSRange)crlaxClampRangeToStorageRange:(_NSRange)a3;
- (_NSRange)crlaxRepRangeWithStorageRange:(_NSRange)a3;
- (_NSRange)crlaxStorageRangeOfRep;
- (_NSRange)crlaxStorageRangeWithRepRange:(_NSRange)a3;
- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3;
- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3;
- (id)_accessibilitySpeakThisStringValue;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3;
- (id)_accessibilityValueForRange:(_NSRange *)a3;
- (id)_crlaxGetDictionaryForLineNumber:(unint64_t)a3 columnNumber:(unint64_t)a4;
- (id)_crlaxLineNumberAndColumnForPosition:(unint64_t)a3;
- (id)_crlaxParentShapeHint;
- (id)_crlaxParentShapeTypeLabel;
- (id)_crlaxProcessStringForObjectReplacements:(id)a3 rangeOffset:(unint64_t)a4;
- (id)accessibilityAttributedValue;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomRotors;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityHint;
- (id)accessibilityNextTextNavigationElement;
- (id)accessibilityPreviousTextNavigationElement;
- (id)accessibilityTextualContext;
- (id)accessibilityValue;
- (id)automationElements;
- (id)crlaxAttachmentElementForStorageIndex:(unint64_t)a3;
- (id)crlaxAttachmentNumberProvider;
- (id)crlaxAttributedSubstringInStorageWithRange:(_NSRange)a3;
- (id)crlaxBeginEditingRangeInStorage:(_NSRange)a3 chosenTextRepReference:(id *)a4;
- (id)crlaxCollaboratorDescription;
- (id)crlaxCollaboratorDescriptionDirect;
- (id)crlaxColumnForCharIndex:(unint64_t)a3;
- (id)crlaxContentSiblingInDirection:(unint64_t)a3;
- (id)crlaxKnobLabel;
- (id)crlaxLabel;
- (id)crlaxSelectionPathForTextRange:(_NSRange)a3;
- (id)crlaxSortedSiblingsByStorageRange;
- (id)crlaxStringForNumberAttachment:(id)a3;
- (id)crlaxSubstringInStorageWithRange:(_NSRange)a3;
- (id)crlaxSummaryDescription;
- (int64_t)_accessibilityLineEndPosition;
- (int64_t)_accessibilityLineStartPosition;
- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5;
- (unint64_t)_crlaxLastSpeakThisVisibleStorageOffset;
- (unint64_t)_crlaxPositionOfLastSelectedLine:(BOOL)a3;
- (unint64_t)_crlaxSpeakThisVisibleStorageOffset;
- (unint64_t)accessibilityTraits;
- (unint64_t)crlaxRepPositionWithStoragePosition:(unint64_t)a3;
- (unint64_t)crlaxStoragePositionWithRepPosition:(unint64_t)a3;
- (void)_accessibilityInsertText:(id)a3 atPosition:(int64_t)a4;
- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4;
- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3;
- (void)_cleanupRotorCache;
- (void)_crlaxActivationShouldBeginEditing:(BOOL *)a3 shouldHandleCanvasSelection:(BOOL *)a4;
- (void)_crlaxCondenseAttributedString:(id)a3;
- (void)_crlaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPoint:(CGPoint)a5;
- (void)_crlaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPosition:(unint64_t)a5;
- (void)_crlaxSetLastSpeakThisVisibleStorageOffset:(unint64_t)a3;
- (void)_crlaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4;
- (void)_crlaxSetShapeContainedTextRep:(id)a3;
- (void)crlaxLoadAccessibilityInformation;
- (void)crlaxPreventSelectedTextRangeChangesForInterval:(double)a3;
- (void)crlaxSetLastSelection:(id)a3;
- (void)crlaxSetPreventRotorCacheCleanup:(BOOL)a3;
- (void)crlaxSetPreventSelectedTextRangeChanges:(BOOL)a3;
- (void)pulseCaret;
@end

@implementation CRLTextRepAccessibility

- (CRLTextRepAccessibility)_crlaxShapeContainedTextRep
{
  return (CRLTextRepAccessibility *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A91A0);
}

- (void)_crlaxSetShapeContainedTextRep:(id)a3
{
}

- (unint64_t)_crlaxLastSpeakThisVisibleStorageOffset
{
  return (unint64_t)__CRLAccessibilityGetAssociatedUnsignedInteger(self, &unk_1016A91A1);
}

- (void)_crlaxSetLastSpeakThisVisibleStorageOffset:(unint64_t)a3
{
}

- (id)_crlaxProcessStringForObjectReplacements:(id)a3 rangeOffset:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = qword_1016A91A8;
  if (!qword_1016A91A8)
  {
    v8 = +[NSString stringWithFormat:@"%C%C", 65532, 14];
    uint64_t v9 = +[NSCharacterSet characterSetWithCharactersInString:v8];
    v10 = (void *)qword_1016A91A8;
    qword_1016A91A8 = v9;

    uint64_t v7 = qword_1016A91A8;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10019A968;
  v25 = sub_10019A978;
  id v26 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10019A980;
  v16[3] = &unk_1014DD118;
  v19 = &v21;
  id v11 = v6;
  unint64_t v20 = a4;
  id v17 = v11;
  v18 = self;
  [v11 crl_enumerateRangesOfCharactersInSet:v7 usingBlock:v16];
  v12 = (void *)v22[5];
  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v11];
  }
  v14 = v13;

  _Block_object_dispose(&v21, 8);

  return v14;
}

- (BOOL)crlaxPreventRotorCacheCleanup
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A91B0);
}

- (void)crlaxSetPreventRotorCacheCleanup:(BOOL)a3
{
}

- (BOOL)crlaxPreventSelectedTextRangeChanges
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A91A2);
}

- (void)crlaxSetPreventSelectedTextRangeChanges:(BOOL)a3
{
}

- (BOOL)crlaxNeedsEditRotorMenu
{
  if ([(CRLTextRepAccessibility *)self crlaxIsBeingEdited]) {
    return 1;
  }

  return [(CRLCanvasRepAccessibility *)self crlaxIsSelectedIgnoringLocking];
}

- (id)accessibilityCustomActions
{
  v10.receiver = self;
  v10.super_class = (Class)CRLTextRepAccessibility;
  v3 = [(CRLCanvasRepAccessibility *)&v10 accessibilityCustomActions];
  id v4 = [v3 mutableCopy];

  if (!v4)
  {
    id v4 = +[NSMutableArray array];
  }
  v5 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  unsigned int v6 = [v5 crlaxCurrentSelectionContainsVisibleTrackedChanges];

  if (v6)
  {
    uint64_t v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Show change" value:0 table:0];

    +[CRLAccessibilityBlockBasedCustomAction addActionToArray:v4 withName:v8 actionBlock:&stru_1014DD158];
  }

  return v4;
}

- (id)_accessibilityTextOperations
{
  v6.receiver = self;
  v6.super_class = (Class)CRLTextRepAccessibility;
  v2 = [(CRLCanvasRepAccessibility *)&v6 _accessibilityTextOperations];
  v3 = +[NSMutableArray arrayWithArray:v2];

  id v4 = [v3 copy];

  return v4;
}

- (BOOL)accessibilityEditOperationAction:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Remove smart annotation" value:0 table:0];

  if ([v4 isEqualToString:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLTextRepAccessibility;
    BOOL v7 = [(CRLCanvasRepAccessibility *)&v9 accessibilityEditOperationAction:v4];
  }

  return v7;
}

- (BOOL)crlaxNeedsTextEntryTrait
{
  v3 = [(CRLTextRepAccessibility *)self crlaxStorage];
  unsigned __int8 v4 = [v3 crlaxUnsignedIntValueForKey:@"wpKind"];
  if (v4 == 4 || (v4 & 0xFC) == 0) {
    BOOL v6 = [(CRLTextRepAccessibility *)self _crlaxTextIsEditable];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_crlaxCondenseAttributedString:(id)a3
{
  id v3 = a3;
  id v4 = [v3 length];
  if (v4)
  {
    unint64_t v5 = (unint64_t)v4;
    BOOL v6 = 0;
    NSUInteger v7 = 0;
    v8 = 0;
    NSUInteger location = 0;
    v16.NSUInteger location = 0;
    v16.NSUInteger length = 0;
    NSUInteger length = 1;
    do
    {
      id v11 = v6;
      BOOL v6 = [v3 attributesAtIndex:v7 effectiveRange:&v16];

      if ([v8 isEqual:v6])
      {
        v17.NSUInteger location = location;
        v17.NSUInteger length = length;
        NSRange v12 = NSUnionRange(v17, v16);
        NSUInteger location = v12.location;
        NSUInteger length = v12.length;
        NSUInteger v13 = v16.location;
        NSUInteger v14 = v16.length;
      }
      else
      {
        if (v8) {
          [v3 setAttributes:v8 range:NSMakeRange(location, length)];
        }
        id v15 = v6;

        NSUInteger v13 = v16.location;
        NSUInteger v14 = v16.length;
        v8 = v15;
        NSUInteger location = v16.location;
        NSUInteger length = v16.length;
      }
      NSUInteger v7 = v14 + v13;
    }
    while (v14 + v13 < v5);
    if (v8) {
      [v3 setAttributes:v8 range:NSMakeRange(location, length)];
    }
  }
}

- (id)crlaxSubstringInStorageWithRange:(_NSRange)a3
{
  id v3 = -[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", a3.location, a3.length);
  id v4 = [v3 string];

  return v4;
}

- (id)crlaxAttributedSubstringInStorageWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v6 = [(CRLTextRepAccessibility *)self crlaxStorage];
  v41.NSUInteger location = (NSUInteger)[v6 crlaxRange];
  v41.NSUInteger length = v7;
  v40.NSUInteger location = location;
  v40.NSUInteger length = length;
  NSRange v8 = NSIntersectionRange(v40, v41);
  [v6 substringWithRange:v8.location, v8.length];
  objc_super v10 = [v6 stringEquivalentFromRange:v8.location, v8.length];
  id v11 = v10;
  if (v9)
  {
    if (v10)
    {
      NSRange v12 = (char *)[v10 length];
      if ([v9 length] == v12)
      {
        if (v12)
        {
          NSUInteger v13 = v12 - 1;
          NSUInteger v14 = [v11 substringFromIndex:v13];
          if ([v14 isEqualToString:@"\r"])
          {
            id v15 = [v9 substringFromIndex:v13];
            unsigned int v16 = [v15 isEqualToString:@"\n"];

            if (v16)
            {
              [v11 stringByReplacingCharactersInRange:v13 withString:@"\n"];
              id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
              id v18 = v17;

              objc_super v9 = v18;
              goto LABEL_11;
            }
          }
          else
          {
          }
        }
        id v17 = v11;
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_10019A968;
  v37 = sub_10019A978;
  id v38 = 0;
  if ([v9 length])
  {
    uint64_t v19 = [(CRLTextRepAccessibility *)self _crlaxProcessStringForObjectReplacements:v9 rangeOffset:v8.location];
    unint64_t v20 = (void *)v34[5];
    v34[5] = v19;
  }
  id v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_10019B230;
  v29 = &unk_1014DD180;
  v31 = &v33;
  id v21 = v9;
  id v30 = v21;
  NSRange v32 = v8;
  -[CRLTextRepAccessibility crlaxEnumerateSpecialTextTokensInRange:usingBlock:](self, "crlaxEnumerateSpecialTextTokensInRange:usingBlock:", v8.location, v8.length, &v26);
  v22 = (void *)v34[5];
  if (v22)
  {
    [v22 endEditing:v26, v27, v28, v29];
    id v23 = (id)v34[5];
LABEL_17:
    v24 = v23;
    goto LABEL_18;
  }
  if (objc_msgSend(v21, "length", v26, v27, v28, v29))
  {
    id v23 = [objc_alloc((Class)NSAttributedString) initWithString:v21];
    goto LABEL_17;
  }
  v24 = 0;
LABEL_18:

  _Block_object_dispose(&v33, 8);

  return v24;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  id v4 = -[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3->location, a3->length);
  NSUInteger v6 = v5;
  v28.NSUInteger location = (NSUInteger)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
  v28.NSUInteger length = v7;
  v27.NSUInteger location = (NSUInteger)v4;
  v27.NSUInteger length = v6;
  NSRange v8 = NSIntersectionRange(v27, v28);
  if (v8.length)
  {
    objc_super v9 = -[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", v8.location, v8.length);
    id v10 = [v9 mutableCopy];

    [v10 beginEditing];
    uint64_t v11 = 0;
    do
    {
      if (v11 + 1 > (unint64_t)[v10 length]) {
        break;
      }
      NSRange v12 = [(CRLTextRepAccessibility *)self crlaxTarget];
      unsigned int v13 = [v12 textIsVertical];

      if (v13)
      {
        NSUInteger v14 = +[NSBundle mainBundle];
        id v15 = [v14 localizedStringForKey:@"Vertical text" value:0 table:0];

        v25 = v15;
        unsigned int v16 = +[NSArray arrayWithObjects:&v25 count:1];
        [v10 addAttribute:@"UIAccessibilityTextAttributeCustom" value:v16 range:v11];
      }
      ++v11;
    }
    while (v8.location + v11 < v8.location + v8.length);
    if (!qword_1016A91B8)
    {
      __int16 v24 = 14;
      __int16 v23 = -4;
      uint64_t v17 = +[NSString stringWithCharacters:&v24 length:1];
      id v18 = (void *)qword_1016A91B8;
      qword_1016A91B8 = v17;

      uint64_t v19 = +[NSString stringWithCharacters:&v23 length:1];
      unint64_t v20 = (void *)qword_1016A91C0;
      qword_1016A91C0 = v19;
    }
    id v21 = [v10 mutableString];
    [v21 replaceOccurrencesOfString:qword_1016A91B8 withString:qword_1016A91C0 options:0 range:[v10 length]];

    [v10 endEditing];
    [(CRLTextRepAccessibility *)self _crlaxCondenseAttributedString:v10];
    [(CRLTextRepAccessibility *)self performSelector:NSSelectorFromString(@"_accessibilityAddMispellingsToAttributedString:") withObject:v10];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)_accessibilityValueForRange:(_NSRange *)a3
{
  id v4 = -[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3->location, a3->length);
  NSUInteger v6 = v5;
  v14.NSUInteger location = (NSUInteger)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
  v14.NSUInteger length = v7;
  v13.NSUInteger location = (NSUInteger)v4;
  v13.NSUInteger length = v6;
  NSRange v8 = NSIntersectionRange(v13, v14);
  if (v8.length)
  {
    objc_super v9 = -[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", v8.location, v8.length);
    id v10 = [v9 string];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_crlaxTextIsEditable
{
  id v3 = objc_opt_class();
  id v4 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  NSUInteger v5 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);

  if (v5) {
    unsigned __int8 v6 = [v5 crlaxCanBeginEditingChildRepOnDoubleTap:self];
  }
  else {
    unsigned __int8 v6 = 1;
  }
  char v7 = v6 & ~[(CRLCanvasRepAccessibility *)self crlaxInReadOnlyMode];

  return v7;
}

- (void)_crlaxActivationShouldBeginEditing:(BOOL *)a3 shouldHandleCanvasSelection:(BOOL *)a4
{
  char v7 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];

  if (v7)
  {
    NSRange v8 = [(CRLCanvasRepAccessibility *)self crlaxRepForSelecting];
    objc_super v9 = v8;
    if (v8
      && (![v8 crlaxIsSelected] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      BOOL v10 = 0;
      BOOL v11 = 1;
    }
    else if ([(CRLTextRepAccessibility *)self crlaxIsBeingEdited])
    {
      BOOL v11 = 0;
      BOOL v10 = 0;
    }
    else
    {
      BOOL v10 = [(CRLTextRepAccessibility *)self _crlaxTextIsEditable];
      BOOL v11 = 0;
    }

    if (a3) {
      goto LABEL_12;
    }
  }
  else
  {
    BOOL v10 = 0;
    BOOL v11 = 1;
    if (a3) {
LABEL_12:
    }
      *a3 = v10;
  }
  if (a4) {
    *a4 = v11;
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  __int16 v5 = 0;
  [(CRLTextRepAccessibility *)self _crlaxActivationShouldBeginEditing:(char *)&v5 + 1 shouldHandleCanvasSelection:&v5];
  if (HIBYTE(v5)) {
    return 1;
  }
  if (!(_BYTE)v5) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLTextRepAccessibility;
  return [(CRLCanvasRepAccessibility *)&v4 _accessibilitySupportsActivateAction];
}

- (BOOL)accessibilityActivate
{
  __int16 v17 = 0;
  id v3 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  objc_super v4 = [v3 crlaxTarget];
  __int16 v5 = [v4 layerHost];
  unsigned __int8 v6 = [v5 asiOSCVC];
  unsigned __int8 v7 = [v6 isCurrentlyInQuickSelectMode];

  unsigned __int8 v8 = 0;
  if ((v7 & 1) == 0)
  {
    [(CRLTextRepAccessibility *)self _crlaxActivationShouldBeginEditing:(char *)&v17 + 1 shouldHandleCanvasSelection:&v17];
    if (HIBYTE(v17))
    {
      id v16 = 0;
      id v9 = -[CRLTextRepAccessibility crlaxBeginEditingRangeInStorage:chosenTextRepReference:](self, "crlaxBeginEditingRangeInStorage:chosenTextRepReference:", 0x7FFFFFFFFFFFFFFFLL, 0, &v16);
      BOOL v10 = (CRLTextRepAccessibility *)v16;
      if (v10 != self)
      {
        BOOL v11 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];

        if (!v11) {
          [(CRLTextRepAccessibility *)self _crlaxSetShapeContainedTextRep:v10];
        }
      }
      NSRange v12 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
      [v12 crlaxScrollCurrentSelectionToVisible];

      NSRange v13 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
      [(CRLTextRepAccessibility *)self accessibilityActivationPoint];
      unsigned __int8 v8 = [v13 crlaxHandleDoubleTapAtPoint:];
    }
    else if ((_BYTE)v17)
    {
      v15.receiver = self;
      v15.super_class = (Class)CRLTextRepAccessibility;
      return [(CRLCanvasRepAccessibility *)&v15 accessibilityActivate];
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (CGPoint)accessibilityActivationPoint
{
  double y = CGPointZero.y;
  unint64_t v4 = [(CRLTextRepAccessibility *)self accessibilityTraits];
  double v6 = y;
  double x = CGPointZero.x;
  if ((CRLAccessibilityTraitIsEditing & v4) != 0)
  {
    [(CRLTextRepAccessibility *)self crlaxCGRectValueForKey:@"caretRect"];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    id v16 = [(CRLCanvasRepAccessibility *)self crlaxCanvas];
    [v16 crlaxScreenFrameFromUnscaledCanvas:v9, v11, v13, v15];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    [(CRLTextRepAccessibility *)self crlaxCGRectValueForKey:@"_accessibilityVisibleFrame"];
    v38.origin.double x = v25;
    v38.origin.double y = v26;
    v38.size.width = v27;
    v38.size.height = v28;
    v35.origin.double x = v18;
    v35.origin.double y = v20;
    v35.size.width = v22;
    v35.size.height = v24;
    BOOL v29 = CGRectIntersectsRect(v35, v38);
    double v6 = y;
    double x = CGPointZero.x;
    if (v29)
    {
      v36.origin.double x = v18;
      v36.origin.double y = v20;
      v36.size.width = v22;
      v36.size.height = v24;
      double x = CGRectGetMidX(v36);
      v37.origin.double x = v18;
      v37.origin.double y = v20;
      v37.size.width = v22;
      v37.size.height = v24;
      double MidY = CGRectGetMidY(v37);
      double v6 = MidY;
    }
  }
  if (x == CGPointZero.x && v6 == y)
  {
    v33.receiver = self;
    v33.super_class = (Class)CRLTextRepAccessibility;
    [(CRLCanvasRepAccessibility *)&v33 accessibilityActivationPoint];
    double x = v31;
  }
  double v32 = x;
  result.double y = v6;
  result.double x = v32;
  return result;
}

- (CGRect)accessibilityFrameForScrolling
{
  v20.receiver = self;
  v20.super_class = (Class)CRLTextRepAccessibility;
  [(CRLTextRepAccessibility *)&v20 accessibilityFrameForScrolling];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(CRLTextRepAccessibility *)self accessibilityTraits];
  if ((CRLAccessibilityTraitIsEditing & v11) != 0)
  {
    [(CRLTextRepAccessibility *)self crlaxCGRectValueForKey:@"caretRect"];
    -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToScreenSpace:](self, "crlaxConvertNaturalRectToScreenSpace:");
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (BOOL)crlaxRepRangeContainsLocation:(unint64_t)a3
{
  id v4 = [(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
  return a3 >= (unint64_t)v4 && a3 - (unint64_t)v4 < v5;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  double v3 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
  id v4 = [v3 crlaxSelectedTextRange];
  uint64_t v6 = v5;

  id v7 = -[CRLTextRepAccessibility crlaxRepRangeWithStorageRange:](self, "crlaxRepRangeWithStorageRange:", v4, v6);
  result.NSUInteger length = v8;
  result.NSUInteger location = (NSUInteger)v7;
  return result;
}

- (void)_crlaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (char *)-[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3.location, a3.length);
  NSUInteger v8 = v7;
  double v9 = (char *)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
  NSUInteger v11 = (NSUInteger)v9;
  if (v8 || v6 < &v9[v10 + 1])
  {
    if (v8) {
      v14.NSUInteger length = v10;
    }
    else {
      v14.NSUInteger length = v10 + 1;
    }
    v21.NSUInteger location = (NSUInteger)v6;
    v21.NSUInteger length = v8;
    v14.NSUInteger location = v11;
    NSRange v15 = NSIntersectionRange(v21, v14);
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
    double v16 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
    id v19 = v16;
    NSUInteger v17 = location;
    NSUInteger v18 = length;
    goto LABEL_13;
  }
  if ((unint64_t)v6 >= v11) {
    return;
  }
  double v16 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
  id v19 = v16;
  NSUInteger v17 = v11;
  NSUInteger v18 = 0;
LABEL_13:
  [v16 crlaxSetSelectedTextRange:v17 skipSelectionChangedNotification:v18];
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (![(CRLTextRepAccessibility *)self crlaxPreventSelectedTextRangeChanges])
  {
    id v6 = -[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", location, length);
    id v8 = -[CRLTextRepAccessibility crlaxClampRangeToStorageRange:](self, "crlaxClampRangeToStorageRange:", v6, v7);
    uint64_t v10 = v9;
    id v11 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
    [v11 crlaxSetSelectedTextRange:v8 skipSelectionChangedNotification:0];
  }
}

- (unint64_t)_crlaxPositionOfLastSelectedLine:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
  id v6 = [v5 crlaxSelectedTextRange];
  uint64_t v8 = (uint64_t)v6 + v7;

  uint64_t v9 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
  uint64_t v10 = (char *)[v9 crlaxStorageRangeOfLineFragmentAtCharIndex:v8];
  uint64_t v12 = v11;

  if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL && v12 == 0)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Line fragment range not found for positionInStorage: %lu", v16, v17, v18, v19, v20, v8))abort(); {
    }
      }
    return -1;
  }
  else if (v3)
  {
    return (unint64_t)-[CRLTextRepAccessibility crlaxRepRangeWithStorageRange:](self, "crlaxRepRangeWithStorageRange:", v10, v12);
  }
  else
  {
    return [(CRLTextRepAccessibility *)self crlaxRepPositionWithStoragePosition:&v10[v12]];
  }
}

- (int64_t)_accessibilityLineEndPosition
{
  return [(CRLTextRepAccessibility *)self _crlaxPositionOfLastSelectedLine:0];
}

- (int64_t)_accessibilityLineStartPosition
{
  return [(CRLTextRepAccessibility *)self _crlaxPositionOfLastSelectedLine:1];
}

- (unint64_t)accessibilityTraits
{
  v24.receiver = self;
  v24.super_class = (Class)CRLTextRepAccessibility;
  unint64_t v3 = [(CRLCanvasRepAccessibility *)&v24 accessibilityTraits];
  unsigned int v4 = [(CRLTextRepAccessibility *)self crlaxNeedsTextEntryTrait];
  uint64_t v5 = CRLAccessibilityTraitTextEntry;
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;
  if ([(CRLTextRepAccessibility *)self crlaxIsBeingEdited]
    || ([(CRLCanvasRepAccessibility *)self crlaxParentRep],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8)
    && ([(CRLTextRepAccessibility *)self _crlaxShapeContainedTextRep],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 crlaxIsBeingEdited],
        v9,
        v10))
  {
    uint64_t v7 = CRLAccessibilityTraitIsEditing | CRLAccessibilityTraitTextOperationsAvailable | v6;
  }
  else
  {
    uint64_t v7 = v6 & ~CRLAccessibilityTraitIsEditing;
  }
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  double v13 = __CRLAccessibilityCastAsSafeCategory(v11, (uint64_t)v12, 0, 0);

  uint64_t v14 = CRLAccessibilityTraitTextArea;
  if (v13) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v14 | v7;
  uint64_t v16 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  if (v16
    && (uint64_t v17 = (void *)v16,
        unsigned __int8 v18 = [(CRLCanvasRepAccessibility *)self crlaxInReadOnlyMode],
        v17,
        (v18 & 1) == 0))
  {
    if ((CRLAccessibilityTraitTextEntry & v15) != 0)
    {
      uint64_t v19 = [(CRLCanvasRepAccessibility *)self crlaxRepForSelecting];
      uint64_t v20 = v19;
      if (v19 && ([v19 crlaxIsSelected] & 1) == 0) {
        v15 |= CRLAccessibilityTraitStaticText;
      }
    }
  }
  else
  {
    v15 &= ~(CRLAccessibilityTraitTextArea | CRLAccessibilityTraitTextEntry);
  }
  NSRange v21 = [(CRLTextRepAccessibility *)self crlaxStorage];
  unint64_t v22 = (unint64_t)[v21 accessibilityTraits] | v15;

  return v22;
}

- (id)automationElements
{
  unint64_t v3 = objc_opt_class();
  unsigned int v4 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);

  if (v5)
  {
    uint64_t v6 = [v5 crlaxKnobAccessibilityElements];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLTextRepAccessibility;
    uint64_t v6 = [(CRLTextRepAccessibility *)&v9 automationElements];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (id)accessibilityHint
{
  if ([(CRLTextRepAccessibility *)self crlaxIsBeingEdited])
  {
    unint64_t v3 = 0;
  }
  else
  {
    unsigned int v4 = [(CRLTextRepAccessibility *)self _crlaxParentShapeHint];
    if (![v4 length])
    {
      v13.receiver = self;
      v13.super_class = (Class)CRLTextRepAccessibility;
      uint64_t v11 = [(CRLCanvasRepAccessibility *)&v13 accessibilityHint];

      unsigned int v4 = (void *)v11;
    }
    unint64_t v3 = __CRLAccessibilityStringForVariables(1, 0, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }

  return v3;
}

- (id)crlaxKnobLabel
{
  v2 = +[NSBundle mainBundle];
  unint64_t v3 = [v2 localizedStringForKey:@"Text" value:0 table:0];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(CRLTextRepAccessibility *)self accessibilityAttributedValue];
  unint64_t v3 = [v2 string];

  return v3;
}

- (id)accessibilityAttributedValue
{
  if ([(CRLCanvasRepAccessibility *)self crlaxIsTitle]
    && ![(CRLTextRepAccessibility *)self crlaxIsBeingEdited])
  {
    uint64_t v7 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
    uint64_t v8 = [v7 crlaxParentRep];
    uint64_t v6 = [v8 crlaxTitle];

    if ([v6 length]) {
      goto LABEL_11;
    }
    uint64_t v9 = +[NSBundle mainBundle];
    uint64_t v10 = v9;
    CFStringRef v11 = @"Empty title";
    goto LABEL_10;
  }
  if (![(CRLCanvasRepAccessibility *)self crlaxIsCaption]
    || [(CRLTextRepAccessibility *)self crlaxIsBeingEdited])
  {
    id v3 = [(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
    -[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", v3, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  objc_super v13 = [v12 crlaxParentRep];
  uint64_t v6 = [v13 crlaxCaption];

  if (![v6 length])
  {
    uint64_t v9 = +[NSBundle mainBundle];
    uint64_t v10 = v9;
    CFStringRef v11 = @"Empty caption";
LABEL_10:
    uint64_t v14 = [v9 localizedStringForKey:v11 value:0 table:0];

    uint64_t v6 = (void *)v14;
  }
LABEL_11:
  if (v6) {
    id v5 = [objc_alloc((Class)NSAttributedString) initWithString:v6];
  }
  else {
    id v5 = 0;
  }
LABEL_14:

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return ![(CRLTextRepAccessibility *)self crlaxIsDecorativeElement];
}

- (id)_crlaxParentShapeTypeLabel
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  id v5 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);
  uint64_t v6 = [v5 accessibilityLabel];

  return v6;
}

- (id)_crlaxParentShapeHint
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  id v5 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);

  if (v5)
  {
    uint64_t v6 = [v5 accessibilityHint];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_crlaxGetDictionaryForLineNumber:(unint64_t)a3 columnNumber:(unint64_t)a4
{
  id v5 = +[NSNumber numberWithInteger:a3];
  uint64_t v6 = +[NSNumber numberWithInteger:a4];
  uint64_t v7 = +[NSDictionary dictionaryWithObjectsAndKeys:v5, @"lineNumber", v6, @"lineColumn", 0];

  return v7;
}

- (void)_crlaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPosition:(unint64_t)a5
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = [(CRLTextRepAccessibility *)self crlaxColumns];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(CRLTextRepAccessibility *)self columnForCharIndex:a5];
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_10019C8C0;
  uint64_t v15 = &unk_1014DD1A8;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v10;
  uint64_t v17 = &v18;
  [v9 enumerateObjectsUsingBlock:&v12];
  unint64_t v11 = [v10 lineIndexForCharIndex:a5 eol:1 v12, v13, v14, v15];

  if (a3) {
LABEL_5:
  }
    *a3 = v11;
LABEL_6:
  if (a4) {
    *a4 = v19[3];
  }

  _Block_object_dispose(&v18, 8);
}

- (id)_crlaxLineNumberAndColumnForPosition:(unint64_t)a3
{
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  [(CRLTextRepAccessibility *)self _crlaxGetEffectiveLineNumber:&v7 columnNumber:&v6 forPosition:a3];
  uint64_t v4 = [(CRLTextRepAccessibility *)self _crlaxGetDictionaryForLineNumber:v7 columnNumber:v6];

  return v4;
}

- (void)_crlaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  unint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  id v10 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  char v30 = 0;
  unint64_t v11 = [v10 crlaxCanvasView];
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v11, 1, &v30);
  if (v30) {
    abort();
  }
  uint64_t v14 = (void *)v13;

  uint64_t v15 = [v14 window];
  id v16 = (void *)v15;
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    [v14 convertPoint:v15 fromView:x, y];
    [v10 crlaxConvertBoundsToUnscaledPoint:];
    -[CRLCanvasRepAccessibility crlaxConvertNaturalPointFromUnscaledCanvas:](self, "crlaxConvertNaturalPointFromUnscaledCanvas:");
    double v19 = v18;
    double v21 = v20;
    unint64_t v22 = [(CRLTextRepAccessibility *)self crlaxTarget];
    double v23 = [v22 layout];
    unint64_t v24 = +[CRLWPColumn charIndexForPointWithPinning:inLayoutTarget:](CRLWPColumn, "charIndexForPointWithPinning:inLayoutTarget:", v23, v19, v21);

    [(CRLTextRepAccessibility *)self _crlaxGetEffectiveLineNumber:&v32 columnNumber:&v31 forPosition:v24];
    if (v32)
    {
      if (v32 != 0x7FFFFFFFFFFFFFFFLL)
      {
        CGFloat v25 = [(CRLTextRepAccessibility *)self crlaxColumnForCharIndex:v24];
        id v26 = [v25 crlaxLineCount];
        if (v32 - 1 < (unint64_t)v26)
        {
          [v25 boundsOfLineFragmentAtIndex:];
          if (v27 <= v21 && v21 <= v27 + v28 && v32 >= 2) {
            --v32;
          }
        }
      }
    }
  }
  if (a3) {
    *a3 = v32;
  }
  if (a4) {
    *a4 = v31;
  }
}

- (id)accessibilityPreviousTextNavigationElement
{
  return [(CRLTextRepAccessibility *)self crlaxContentSiblingInDirection:1];
}

- (id)accessibilityNextTextNavigationElement
{
  return [(CRLTextRepAccessibility *)self crlaxContentSiblingInDirection:0];
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  -[CRLTextRepAccessibility _crlaxGetEffectiveLineNumber:columnNumber:forPoint:](self, "_crlaxGetEffectiveLineNumber:columnNumber:forPoint:", &v7, &v6, a3.x, a3.y);
  uint64_t v4 = [(CRLTextRepAccessibility *)self _crlaxGetDictionaryForLineNumber:v7 columnNumber:v6];

  return v4;
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"lineNumber"];
  uint64_t v6 = v5;
  if (v5)
  {
    unint64_t v7 = (unint64_t)[v5 integerValue];
    uint64_t v8 = [v4 objectForKey:@"lineColumn"];
    unint64_t v9 = (unint64_t)[v8 integerValue];

    id v10 = [(CRLTextRepAccessibility *)self crlaxColumns];
    objc_opt_class();
    NSUInteger v11 = 0;
    uint64_t v12 = 0x7FFFFFFFLL;
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v9 & 0x8000000000000000) == 0)
    {
      if (v9 >= (unint64_t)[v10 count])
      {
        NSUInteger v11 = 0;
        uint64_t v12 = 0x7FFFFFFFLL;
      }
      else
      {
        LOBYTE(v26[0]) = 0;
        uint64_t v13 = [v10 objectAtIndexedSubscript:v9];
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = __CRLAccessibilityCastAsSafeCategory(v14, (uint64_t)v13, 1, v26);
        if (LOBYTE(v26[0])) {
          abort();
        }
        id v16 = (void *)v15;

        id v17 = [v16 crlaxLineCount];
        NSUInteger v11 = 0;
        uint64_t v12 = 0x7FFFFFFFLL;
        if ((v7 & 0x8000000000000000) == 0 && v7 < (unint64_t)v17)
        {
          id v18 = [v16 rangeOfLineFragmentAtIndex:v7];
          if (v19 <= 0x7FFFFFFFFFFFFFFELL)
          {
            id v20 = -[CRLTextRepAccessibility crlaxRepRangeWithStorageRange:](self, "crlaxRepRangeWithStorageRange:", v18, v19);
            uint64_t v12 = (uint64_t)v20;
            NSUInteger v11 = v21;
            if (v21)
            {
              v26[0] = v20;
              v26[1] = v21;
              unint64_t v22 = [(CRLTextRepAccessibility *)self _accessibilityValueForRange:v26];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v23 = [v22 string];

                unint64_t v22 = (void *)v23;
              }
              if ([v22 hasSuffix:@"\n"]) {
                v11 -= (unint64_t)[v22 length] > 1;
              }
            }
          }
          else
          {
            NSUInteger v11 = 0;
            uint64_t v12 = 0x7FFFFFFFLL;
          }
        }
      }
    }
  }
  else
  {
    NSUInteger v11 = 0;
    uint64_t v12 = 0x7FFFFFFFLL;
  }

  NSUInteger v24 = v12;
  NSUInteger v25 = v11;
  result.NSUInteger length = v25;
  result.NSUInteger location = v24;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  id v4 = -[CRLTextRepAccessibility _crlaxLineNumberAndColumnForPosition:](self, "_crlaxLineNumberAndColumnForPosition:", -[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3, 0));
  id v5 = [(CRLTextRepAccessibility *)self _accessibilityRangeForLineNumberAndColumn:v4];
  NSUInteger v7 = v6;

  NSUInteger v8 = (NSUInteger)v5;
  NSUInteger v9 = v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  id v4 = (char *)-[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3.location, a3.length);
  uint64_t v6 = v5;
  if (!v5) {
    [(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
  }
  [(CRLCanvasRepAccessibility *)self accessibilityFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(CRLTextRepAccessibility *)self crlaxColumns];
  id v16 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  char v51 = 0;
  id v17 = [v16 crlaxCanvasView];
  id v18 = (objc_class *)objc_opt_class();
  uint64_t v19 = __CRLAccessibilityCastAsClass(v18, (uint64_t)v17, 1, &v51);
  if (v51) {
LABEL_25:
  }
    abort();
  id v20 = (void *)v19;

  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v21 = v15;
  id v22 = [v21 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v22)
  {
    id v23 = v22;
    v46 = v16;
    uint64_t v24 = *(void *)v48;
    while (2)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v48 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        char v51 = 0;
        id v27 = v26;
        double v28 = objc_opt_class();
        uint64_t v29 = __CRLAccessibilityCastAsSafeCategory(v28, (uint64_t)v27, 1, &v51);
        if (v51) {
          goto LABEL_25;
        }
        char v30 = (void *)v29;

        unint64_t v31 = (char *)[v30 crlaxRange];
        if (v4 >= v31 && v4 < &v31[v32])
        {
          v34 = -[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", v4, v6);
          CGRect v35 = [v34 string];

          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass)
          {
            uint64_t v37 = [v35 string];

            CGRect v35 = (void *)v37;
          }
          id v16 = v46;
          if (objc_msgSend(v35, "isEqualToString:", @"\n", v20, v46, (void)v47)) {
            [v30 crlaxColumnRectForRange:v4, v6];
          }
          else {
            [v30 crlaxGlyphRectForRange:v4 includingLabel:v6];
          }
          -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToUnscaledCanvas:](self, "crlaxConvertNaturalRectToUnscaledCanvas:");
          [v16 crlaxConvertUnscaledToBoundsRect:];
          [v20 crlaxFrameFromBounds:];
          double v8 = v38;
          double v10 = v39;
          double v12 = v40;
          double v14 = v41;

          goto LABEL_24;
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    id v16 = v46;
  }
LABEL_24:

  double v42 = v8;
  double v43 = v10;
  double v44 = v12;
  double v45 = v14;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.double y = v43;
  result.origin.double x = v42;
  return result;
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v15 = a4;
  uint64_t v6 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
  id v7 = [v6 crlaxSelectedTextRange];

  NSUInteger v8 = (NSUInteger)v7 - a3;
  double v9 = [(CRLTextRepAccessibility *)self crlaxStorage];
  v18.NSUInteger location = (NSUInteger)[v9 crlaxRange];
  v18.NSUInteger length = v10;
  v17.NSUInteger location = v8;
  v17.NSUInteger length = a3;
  NSUInteger length = NSIntersectionRange(v17, v18).length;

  if (length)
  {
    double v12 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v8, a3);
    double v13 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
    double v14 = [v13 crlaxTarget];
    [v14 replace:v12 with:v15];
  }
}

- (void)_accessibilityInsertText:(id)a3 atPosition:(int64_t)a4
{
  id v14 = a3;
  if (a4 == -1)
  {
    double v12 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
    [v12 crlaxInsertText:v14];
  }
  else if (CRLAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Need to handle position > -1", v7, v8, v9, v10, v11, v13))abort(); {
  }
    }
}

- (unint64_t)_crlaxSpeakThisVisibleStorageOffset
{
  [(CRLTextRepAccessibility *)self crlaxCGRectValueForKey:@"_accessibilityVisibleFrame"];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  double v12 = [v11 crlaxTarget];
  [v12 convertRect:0 fromView:v4];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  id v21 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  [v21 crlaxConvertBoundsToUnscaledRect:v14, v16, v18, v20];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  char v30 = [(CRLTextRepAccessibility *)self crlaxTarget];
  [v30 convertNaturalRectFromUnscaledCanvas:v23, v25, v27, v29];
  double v32 = v31;
  double v34 = v33;

  CGRect v35 = [(CRLTextRepAccessibility *)self crlaxTarget];
  LODWORD(v12) = [v35 textIsVertical];

  if (v12)
  {
    CGRect v36 = [(CRLTextRepAccessibility *)self crlaxTarget];
    uint64_t v37 = [v36 closestColumnForPoint:v32, v34];

    if (v37)
    {
      [v37 transformFromWP];
      double v38 = *((double *)&v49 + 1);
      double v39 = *(double *)&v49;
      double v40 = *((double *)&v50 + 1);
      double v41 = *(double *)&v50;
      double v42 = *((double *)&v51 + 1);
      double v43 = *(double *)&v51;
    }
    else
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v49 = 0u;
      double v42 = 0.0;
      double v40 = 0.0;
      double v38 = 0.0;
      double v43 = 0.0;
      double v41 = 0.0;
      double v39 = 0.0;
    }
    double v44 = v43 + v34 * v41 + v39 * v32;
    double v34 = v42 + v34 * v40 + v38 * v32;

    double v32 = v44;
  }
  double v45 = [(CRLTextRepAccessibility *)self crlaxTarget];
  v46 = [v45 layout];
  unint64_t v47 = +[CRLWPColumn charIndexForPointWithPinning:inLayoutTarget:](CRLWPColumn, "charIndexForPointWithPinning:inLayoutTarget:", v46, v32, v34);

  return v47;
}

- (id)_accessibilitySpeakThisStringValue
{
  NSUInteger v3 = [(CRLTextRepAccessibility *)self _crlaxSpeakThisVisibleStorageOffset];
  [(CRLTextRepAccessibility *)self _crlaxSetLastSpeakThisVisibleStorageOffset:v3];
  id v4 = [(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
  NSUInteger v6 = (NSUInteger)v4 + v5 - v3;
  if ((unint64_t)v4 > v3)
  {
    NSUInteger v7 = (NSUInteger)v4;
    NSUInteger v8 = v5;
    unsigned int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD1C8);
    }
    double v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      log = v10;
      v37.NSUInteger location = v3;
      v37.NSUInteger length = v6;
      double v20 = NSStringFromRange(v37);
      v38.NSUInteger location = v7;
      v38.NSUInteger length = v8;
      double v19 = NSStringFromRange(v38);
      *(_DWORD *)buf = 67110402;
      unsigned int v23 = v9;
      __int16 v24 = 2082;
      double v25 = "-[CRLTextRepAccessibility(iOS) _accessibilitySpeakThisStringValue]";
      __int16 v26 = 2082;
      double v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Text/Accessibility/iOS/CRLTextRepAccessibility+iOS.m";
      __int16 v28 = 1024;
      int v29 = 1299;
      __int16 v30 = 2112;
      double v31 = v20;
      __int16 v32 = 2112;
      double v33 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Adjusted speak this range is outside of rep's storage range: adjusted: %@; rep: %@",
        buf,
        0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DD1E8);
    }
    uint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTextRepAccessibility(iOS) _accessibilitySpeakThisStringValue]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Text/Accessibility/iOS/CRLTextRepAccessibility+iOS.m"];
    v35.NSUInteger location = v3;
    v35.NSUInteger length = v6;
    double v14 = NSStringFromRange(v35);
    v36.NSUInteger location = v7;
    v36.NSUInteger length = v8;
    double v15 = NSStringFromRange(v36);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1299, 0, "Adjusted speak this range is outside of rep's storage range: adjusted: %@; rep: %@",
      v14,
      v15);
  }
  double v16 = [(CRLTextRepAccessibility *)self crlaxStorage];
  double v17 = [v16 crlaxSubstringWithRange:v3, v6];

  return v17;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3
{
  NSUInteger range = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = [(CRLTextRepAccessibility *)self _accessibilitySpeakThisString];
  NSUInteger v6 = [v5 length];
  NSUInteger v7 = [(CRLTextRepAccessibility *)self _accessibilitySpeakThisStringValue];
  NSUInteger v8 = v6 - (unsigned char *)[v7 length];

  BOOL v9 = location >= v8;
  NSUInteger v10 = location - v8;
  if (v9)
  {
    NSUInteger v11 = [(CRLTextRepAccessibility *)self _crlaxLastSpeakThisVisibleStorageOffset]+ v10;
    id v12 = [(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
    if ((unint64_t)v12 > v11 || (unint64_t)v12 + v13 < v11 + range)
    {
      unsigned int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD208);
      }
      double v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        log = v15;
        v76.NSUInteger location = v11;
        v76.NSUInteger length = range;
        double v43 = NSStringFromRange(v76);
        v77.NSUInteger location = (NSUInteger)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
        double v44 = NSStringFromRange(v77);
        *(_DWORD *)buf = 67110402;
        unsigned int v60 = v14;
        __int16 v61 = 2082;
        v62 = "-[CRLTextRepAccessibility(iOS) _accessibilityTextRectsForSpeakThisStringRange:]";
        __int16 v63 = 2082;
        v64 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Text/Accessibility/iOS/CRLTextRepAc"
              "cessibility+iOS.m";
        __int16 v65 = 1024;
        int v66 = 1327;
        __int16 v67 = 2112;
        v68 = v43;
        __int16 v69 = 2112;
        v70 = v44;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Adjusted speak this range is outside of rep's storage range: adjusted: %@; rep: %@",
          buf,
          0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DD228);
      }
      double v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v16);
      }
      double v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTextRepAccessibility(iOS) _accessibilityTextRectsForSpeakThisStringRange:]");
      double v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Text/Accessibility/iOS/CRLTextRepAccessibility+iOS.m"];
      v72.NSUInteger location = v11;
      v72.NSUInteger length = range;
      double v19 = NSStringFromRange(v72);
      v73.NSUInteger location = (NSUInteger)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
      double v20 = NSStringFromRange(v73);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1327, 0, "Adjusted speak this range is outside of rep's storage range: adjusted: %@; rep: %@",
        v19,
        v20);
    }
  }
  else
  {
    NSUInteger range = 0;
    NSUInteger v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v21 = 0;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && range)
  {
    double v22 = [(CRLTextRepAccessibility *)self crlaxColumns];
    long long v49 = +[NSMutableArray array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v22;
    id v48 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v48)
    {
      uint64_t v46 = *(void *)v55;
      CGFloat y = CGRectNull.origin.y;
      CGFloat width = CGRectNull.size.width;
      CGFloat height = CGRectNull.size.height;
      CGFloat v52 = CGRectZero.origin.y;
      CGFloat v50 = CGRectZero.size.height;
      CGFloat v51 = CGRectZero.size.width;
      do
      {
        for (i = 0; i != v48; i = (char *)i + 1)
        {
          if (*(void *)v55 != v46) {
            objc_enumerationMutation(obj);
          }
          double v27 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          v74.NSUInteger location = (NSUInteger)[v27 crlaxRange];
          NSUInteger v28 = v11;
          v78.NSUInteger location = v11;
          v78.NSUInteger length = range;
          NSRange v29 = NSIntersectionRange(v74, v78);
          if (v29.length)
          {
            __int16 v30 = (char *)[v27 crlaxLineIndexForCharIndex:v29.location eol:0];
            double v31 = (char *)[v27 crlaxLineIndexForCharIndex:v29.length + v29.location - 1 eol:0];
            if (v30 <= v31)
            {
              __int16 v32 = v31;
              do
              {
                v75.NSUInteger location = (NSUInteger)[v27 crlaxRangeOfLineFragmentAtIndex:v30];
                -[CRLTextRepAccessibility _accessibilityBoundsForRange:](self, "_accessibilityBoundsForRange:", NSIntersectionRange(v75, v29).location- (unint64_t)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep], v75.length);
                double v34 = v33;
                double v36 = v35;
                double v38 = v37;
                double v40 = v39;
                v79.origin.double x = CGRectNull.origin.x;
                v79.origin.CGFloat y = y;
                v79.size.CGFloat width = width;
                v79.size.CGFloat height = height;
                v81.origin.double x = v34;
                v81.origin.CGFloat y = v36;
                v81.size.CGFloat width = v38;
                v81.size.CGFloat height = v40;
                if (!CGRectEqualToRect(v79, v81))
                {
                  v80.origin.CGFloat y = v52;
                  v80.origin.double x = CGRectZero.origin.x;
                  v80.size.CGFloat height = v50;
                  v80.size.CGFloat width = v51;
                  v82.origin.double x = v34;
                  v82.origin.CGFloat y = v36;
                  v82.size.CGFloat width = v38;
                  v82.size.CGFloat height = v40;
                  if (!CGRectEqualToRect(v80, v82))
                  {
                    double v41 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v34, v36, v38, v40);
                    [v49 addObject:v41];
                  }
                }
                ++v30;
              }
              while (v30 <= v32);
            }
          }
          NSUInteger v11 = v28;
        }
        id v48 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      }
      while (v48);
    }

    id v21 = [v49 copy];
  }

  return v21;
}

- (BOOL)_crlaxHasTextContent
{
  v2 = self;
  NSUInteger v3 = [(CRLTextRepAccessibility *)self crlaxStorage];
  id v4 = [v3 crlaxRange];
  NSUInteger v6 = v5;
  v8.NSUInteger location = (NSUInteger)[(CRLTextRepAccessibility *)v2 crlaxStorageRangeOfRep];
  v9.NSUInteger location = (NSUInteger)v4;
  v9.NSUInteger length = v6;
  LOBYTE(v2) = NSIntersectionRange(v8, v9).length != 0;

  return (char)v2;
}

- (void)crlaxPreventSelectedTextRangeChangesForInterval:(double)a3
{
  [(CRLTextRepAccessibility *)self crlaxSetPreventSelectedTextRangeChanges:1];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10019DF64;
  v5[3] = &unk_1014CBF60;
  objc_copyWeak(&v6, &location);
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v5, a3);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (CGRect)crlaxBoundsForStorageRange:(_NSRange)a3
{
  id v5 = -[CRLTextRepAccessibility crlaxRepRangeWithStorageRange:](self, "crlaxRepRangeWithStorageRange:", a3.location, a3.length);

  -[CRLTextRepAccessibility _accessibilityBoundsForRange:](self, "_accessibilityBoundsForRange:", v5, v4);
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.CGFloat y = v7;
  result.origin.double x = v6;
  return result;
}

- (id)crlaxAttachmentElementForStorageIndex:(unint64_t)a3
{
  id v5 = [(CRLTextRepAccessibility *)self crlaxStorage];
  double v6 = [v5 crlaxAttachmentOrFootnoteAtCharIndex:a3];

  double v7 = [(id)objc_opt_class() crlaxAttachmentElementForAttachment:v6 inTextRep:self];

  return v7;
}

- (id)accessibilityTextualContext
{
  uint64_t v2 = [(CRLCanvasRepAccessibility *)self accessibilityContainer];
  if (v2)
  {
    NSUInteger v3 = (void *)v2;
    while (1)
    {
      uint64_t v4 = [v3 accessibilityTextualContext];

      if (v4) {
        break;
      }
      uint64_t v5 = [v3 accessibilityContainer];

      NSUInteger v3 = (void *)v5;
      if (!v5) {
        goto LABEL_5;
      }
    }
    double v7 = [v3 accessibilityTextualContext];

    BOOL v6 = v7 == 0;
  }
  else
  {
LABEL_5:
    BOOL v6 = 1;
  }
  if (v6) {
    UIAccessibilityTextualContext v8 = UIAccessibilityTextualContextWordProcessing;
  }
  else {
    UIAccessibilityTextualContext v8 = 0;
  }

  return v8;
}

- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5
{
  id v8 = [[_TtC8Freeform15CRLTextPosition alloc] init:a5];
  double v9 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  NSUInteger v10 = [v9 crlaxTextInputResponder];
  NSUInteger v11 = [v10 crlaxVoiceControlPositionFromPosition:v8 inDirection:a3 offset:a4];

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = sub_1002469D0(v12, v11);
  id v14 = [v13 location];

  return (unint64_t)v14;
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 0;
}

- (id)accessibilityCustomRotors
{
  return 0;
}

- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = sub_1002469D0(v5, v4);
  double v7 = v6;
  if (v6)
  {
    id v8 = [v6 nsRange];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLTextRepAccessibility;
    id v8 = [(CRLTextRepAccessibility *)&v14 _accessibilityRawRangeForUITextRange:v4];
  }
  NSUInteger v10 = (NSUInteger)v8;
  NSUInteger v11 = v9;

  NSUInteger v12 = v10;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.id location = v12;
  return result;
}

- (BOOL)_accessibilityReplaceTextInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = (objc_class *)objc_opt_class();
  NSUInteger v9 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  NSUInteger v10 = [v9 crlaxTarget];
  NSUInteger v11 = [v10 editorController];
  NSUInteger v12 = [v11 textInputEditor];
  NSUInteger v13 = sub_10024715C(v8, v12);

  if (v13)
  {
    objc_super v14 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", location, length);
    [v13 replace:v14 with:v7];
  }
  return v13 != 0;
}

- (id)accessibilityDragSourceDescriptors
{
  id v3 = [(CRLTextRepAccessibility *)self _accessibilitySelectedTextRange];
  if (!v4) {
    goto LABEL_3;
  }
  -[CRLTextRepAccessibility _accessibilityBoundsForRange:](self, "_accessibilityBoundsForRange:", v3, v4);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  NSUInteger v13 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  objc_super v14 = [v13 crlaxTarget];
  [v14 convertRect:0 fromView:v6, v8, v10, v12];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  id v23 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
  __int16 v24 = +[NSBundle mainBundle];
  double v25 = [v24 localizedStringForKey:@"Drag Text" value:0 table:0];
  double v26 = sub_100065738(v16, v18, v20, v22);
  double v28 = v27;
  NSRange v29 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  id v30 = [v23 initWithName:v25 point:v29 inView:v26];

  id v34 = v30;
  double v31 = +[NSArray arrayWithObjects:&v34 count:1];

  if (!v31)
  {
LABEL_3:
    v33.receiver = self;
    v33.super_class = (Class)CRLTextRepAccessibility;
    double v31 = [(CRLCanvasRepAccessibility *)&v33 accessibilityDragSourceDescriptors];
  }

  return v31;
}

- (id)accessibilityDropPointDescriptors
{
  id v3 = [(CRLTextRepAccessibility *)self crlaxTarget];
  uint64_t v4 = [v3 selection];
  unsigned int v5 = [v4 isInsertionPoint];

  if (!v5) {
    goto LABEL_5;
  }
  double v6 = [(CRLTextRepAccessibility *)self crlaxTarget];
  [v6 caretRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v45.origin.double x = v8;
  v45.origin.CGFloat y = v10;
  v45.size.CGFloat width = v12;
  v45.size.CGFloat height = v14;
  if (CGRectIsNull(v45)) {
    goto LABEL_5;
  }
  v47.origin.double x = CGRectZero.origin.x;
  v47.origin.CGFloat y = CGRectZero.origin.y;
  v47.size.CGFloat width = CGRectZero.size.width;
  v47.size.CGFloat height = CGRectZero.size.height;
  v46.origin.double x = v8;
  v46.origin.CGFloat y = v10;
  v46.size.CGFloat width = v12;
  v46.size.CGFloat height = v14;
  if (CGRectEqualToRect(v46, v47)) {
    goto LABEL_5;
  }
  -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToUnscaledCanvas:](self, "crlaxConvertNaturalRectToUnscaledCanvas:", v8, v10, v12, v14);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  id v23 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  [v23 crlaxConvertUnscaledToBoundsRect:v16, v18, v20, v22];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  id v32 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
  objc_super v33 = +[NSBundle mainBundle];
  id v34 = [v33 localizedStringForKey:@"Drop Text" value:0 table:0];
  double v35 = sub_100065738(v25, v27, v29, v31);
  double v37 = v36;
  double v38 = [(CRLCanvasRepAccessibility *)self crlaxCanvasView];
  id v39 = [v32 initWithName:v34 point:v38 inView:v35];

  id v43 = v39;
  double v40 = +[NSArray arrayWithObjects:&v43 count:1];

  if (!v40)
  {
LABEL_5:
    v42.receiver = self;
    v42.super_class = (Class)CRLTextRepAccessibility;
    double v40 = [(CRLCanvasRepAccessibility *)&v42 accessibilityDropPointDescriptors];
  }

  return v40;
}

- (void)_cleanupRotorCache
{
  if (![(CRLTextRepAccessibility *)self crlaxPreventRotorCacheCleanup])
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLTextRepAccessibility;
    [(CRLTextRepAccessibility *)&v3 _cleanupRotorCache];
  }
}

- (BOOL)crlaxNeedsFormatEditOperation
{
  if ([(CRLCanvasRepAccessibility *)self crlaxIsSelected]
    || [(CRLCanvasRepAccessibility *)self crlaxIsSelectedIgnoringLocking])
  {
    objc_super v3 = [(CRLTextRepAccessibility *)self crlaxTarget];
    unsigned int v4 = [v3 isBeingEdited] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (id)crlaxTargetClassName
{
  return @"CRLWPRep";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_opt_class();
  unsigned int v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (CRLRepAccessibilitySelectionRangeCache)crlaxLastSelection
{
  return (CRLRepAccessibilitySelectionRangeCache *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9658);
}

- (void)crlaxSetLastSelection:(id)a3
{
}

- (CRLWPRep)crlaxRetainedTarget
{
  char v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CRLTextRepAccessibility;
  uint64_t v2 = [(CRLCanvasRepAccessibility *)&v7 crlaxRetainedTarget];
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v8);
  if (v8) {
    abort();
  }
  unsigned int v5 = (void *)v4;

  return (CRLWPRep *)v5;
}

- (id)crlaxLabel
{
  id v3 = [(CRLTextRepAccessibility *)self crlaxTarget];
  uint64_t v4 = [v3 info];
  unsigned int v5 = [v4 crlaxValueForKey:@"crlaxString"];

  double v6 = [(CRLTextRepAccessibility *)self crlaxCollaboratorDescription];
  double v13 = __CRLAccessibilityStringForVariables(1, v5, v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  return v13;
}

- (BOOL)crlaxIsBeingEdited
{
  uint64_t v2 = [(CRLTextRepAccessibility *)self crlaxRetainedTarget];
  unsigned __int8 v3 = [v2 isBeingEdited];

  return v3;
}

- (BOOL)crlaxIsLockedDirectly
{
  unsigned __int8 v3 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
  unsigned __int8 v4 = [v3 crlaxIsLockedDirectly];

  if (v4) {
    return 1;
  }
  char v11 = 0;
  double v6 = [(CRLCanvasRepAccessibility *)self crlaxInfo];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsClassAndProtocol(v7, (Protocol *)&OBJC_PROTOCOL___CRLCanvasLockableElementInfo, v6, 1, &v11);
  if (v11) {
    abort();
  }
  uint64_t v9 = (void *)v8;

  if (v9) {
    unsigned __int8 v5 = [v9 locked];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)crlaxIsDecorativeElement
{
  unsigned __int8 v3 = [(CRLCanvasRepAccessibility *)self crlaxRepForSelecting];
  if (v3 || [(CRLCanvasRepAccessibility *)self crlaxIsLocked])
  {
    char isKindOfClass = 0;
  }
  else
  {
    unsigned __int8 v5 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (_NSRange)crlaxStorageRangeOfRep
{
  uint64_t v2 = [(CRLTextRepAccessibility *)self crlaxTarget];
  id v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (CRLWPStorageAccessibility)crlaxStorage
{
  char v8 = 0;
  uint64_t v2 = [(CRLTextRepAccessibility *)self crlaxTarget];
  id v3 = [v2 storage];

  NSUInteger v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  NSUInteger v6 = (void *)v5;

  return (CRLWPStorageAccessibility *)v6;
}

- (CRLTextEditorAccessibility)crlaxTextEditor
{
  if ([(CRLTextRepAccessibility *)self crlaxIsBeingEdited])
  {
    char v11 = 0;
    id v3 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
    NSUInteger v4 = [v3 crlaxTarget];
    uint64_t v5 = [v4 editorController];
    NSUInteger v6 = [v5 textInputEditor];

    NSUInteger v7 = objc_opt_class();
    uint64_t v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 1, &v11);
    if (v11) {
      abort();
    }
    uint64_t v9 = (void *)v8;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (CRLTextEditorAccessibility *)v9;
}

- (BOOL)crlaxIsSelectionHighlightSuppressed
{
  uint64_t v2 = [(CRLTextRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isSelectionHighlightSuppressed];

  return v3;
}

- (NSArray)crlaxColumns
{
  char v8 = 0;
  uint64_t v2 = [(CRLTextRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 columns];

  NSUInteger v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  NSUInteger v6 = (void *)v5;

  return (NSArray *)v6;
}

- (BOOL)crlaxJumpToNextInferredHeading
{
  unsigned __int8 v3 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
  id v4 = [v3 crlaxSelectedTextRange];

  uint64_t v5 = [(CRLTextRepAccessibility *)self crlaxStorage];
  [v5 crlaxNextInferredHeadingRangeFromCharacterIndex:v4 wrap:1];

  return 0;
}

- (BOOL)crlaxJumpToPreviousInferredHeading
{
  unsigned __int8 v3 = [(CRLTextRepAccessibility *)self crlaxTextEditor];
  id v4 = [v3 crlaxSelectedTextRange];

  uint64_t v5 = [(CRLTextRepAccessibility *)self crlaxStorage];
  [v5 crlaxPreviousInferredHeadingRangeFromCharacterIndex:v4 wrap:1];

  return 0;
}

- (id)crlaxSelectionPathForTextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v6 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  char v16 = 0;
  NSUInteger v7 = [v6 crlaxTarget];
  char v8 = [v7 selectionModelTranslator];
  uint64_t v9 = [(CRLTextRepAccessibility *)self crlaxStorage];
  uint64_t v10 = [v9 crlaxTarget];
  char v11 = [v8 selectionPathForRange:location length:length onStorage:v10];

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = __CRLAccessibilityCastAsSafeCategory(v12, (uint64_t)v11, 1, &v16);
  if (v16) {
    abort();
  }
  double v14 = (void *)v13;

  return v14;
}

- (NSSet)crlaxSiblings
{
  uint64_t v2 = [(CRLTextRepAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 siblings];

  return (NSSet *)v3;
}

- (NSArray)crlaxAccessibilityLabelCustomAttributes
{
  unsigned __int8 v3 = +[NSMutableArray array];
  id v4 = [(CRLTextRepAccessibility *)self crlaxTarget];
  unsigned int v5 = [v4 textIsVertical];

  if (v5)
  {
    NSUInteger v6 = +[NSBundle mainBundle];
    NSUInteger v7 = [v6 localizedStringForKey:@"Vertical text" value:0 table:0];

    [v3 addObject:v7];
  }

  return (NSArray *)v3;
}

- (id)crlaxStringForNumberAttachment:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CRLTextRepAccessibility *)self crlaxAttachmentNumberProvider];
  if (v5)
  {
    NSUInteger v6 = [v4 stringEquivalentWithNumberProvider:v5];
  }
  else
  {
    NSUInteger v6 = &stru_101538650;
  }

  return v6;
}

- (CRLTextInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  char v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)CRLTextRepAccessibility;
  uint64_t v2 = [(CRLCanvasRepAccessibility *)&v7 crlaxInteractiveCanvasController];
  unsigned __int8 v3 = objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v8);
  if (v8) {
    abort();
  }
  unsigned int v5 = (void *)v4;

  return (CRLTextInteractiveCanvasControllerAccessibility *)v5;
}

- (id)crlaxCollaboratorDescription
{
  unsigned __int8 v3 = [(CRLTextRepAccessibility *)self crlaxCollaboratorDescriptionDirect];
  if (![v3 length])
  {
    uint64_t v4 = [(CRLCanvasRepAccessibility *)self crlaxParentRep];
    uint64_t v5 = [v4 crlaxCollaboratorDescriptionDirect];

    unsigned __int8 v3 = (void *)v5;
  }

  return v3;
}

- (id)crlaxCollaboratorDescriptionDirect
{
  v13.receiver = self;
  v13.super_class = (Class)CRLTextRepAccessibility;
  unsigned __int8 v3 = [(CRLCanvasRepAccessibility *)&v13 crlaxCollaboratorDescriptionDirect];
  uint64_t v4 = [(CRLTextRepAccessibility *)self crlaxTarget];
  unsigned int v5 = [v4 isShowingCaret];

  if (v5)
  {
    NSUInteger v6 = [(CRLTextRepAccessibility *)self crlaxTarget];
    objc_super v7 = [v6 p_currentCollaboratorPresence];
    char v8 = [v7 displayName];

    if ([v8 length])
    {
      uint64_t v9 = +[NSBundle mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"Edited by %@" value:0 table:0];

      uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8);

      unsigned __int8 v3 = (void *)v11;
    }
  }

  return v3;
}

- (id)crlaxBeginEditingRangeInStorage:(_NSRange)a3 chosenTextRepReference:(id *)a4
{
  NSUInteger length = a3.length;
  id location = (id)a3.location;
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if ([(CRLCanvasRepAccessibility *)self crlaxInReadOnlyMode])
    {
      int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Should not attempt to begin editing in read-only mode", v9, v10, v11, v12, v13, v42))goto LABEL_20; {
    }
      }
  }
  double v14 = self;
  double v15 = objc_opt_class();
  char v16 = [(CRLCanvasRepAccessibility *)v14 crlaxParentRep];
  double v17 = __CRLAccessibilityCastAsSafeCategory(v15, (uint64_t)v16, 0, 0);

  char v48 = 0;
  double v18 = [(CRLCanvasRepAccessibility *)v14 crlaxInfo];
  double v19 = objc_opt_class();
  uint64_t v20 = __CRLAccessibilityCastAsSafeCategory(v19, (uint64_t)v18, 1, &v48);
  if (v48) {
    goto LABEL_20;
  }
  double v21 = (void *)v20;

  double v22 = v14;
  if (v17)
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1002F8E30;
    v45[3] = &unk_1014CBE78;
    id v23 = v17;
    id v46 = v23;
    id v47 = v21;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v45)) {
      goto LABEL_20;
    }

    double v22 = [v23 crlaxContainedRep];
  }
  id v43 = v21;
  double v44 = v17;
  double v24 = a4;
  if (location == (id)0x7FFFFFFFFFFFFFFFLL && length == 0)
  {
    id location = [(CRLTextRepAccessibility *)v14 crlaxStorageRangeOfRep];
    NSUInteger length = 0;
  }
  id v26 = -[CRLTextRepAccessibility crlaxClampRangeToStorageRange:](v14, "crlaxClampRangeToStorageRange:", location, length);
  uint64_t v28 = v27;
  CGFloat v29 = [(CRLTextRepAccessibility *)v14 crlaxInteractiveCanvasController];
  char v48 = 0;
  double v30 = [v29 crlaxTarget];
  CGFloat v31 = [v30 selectionModelTranslator];
  id v32 = [v22 crlaxStorage];
  objc_super v33 = [v32 crlaxTarget];
  id v34 = [v31 selectionPathForRange:v26 onStorage:v28];

  double v35 = objc_opt_class();
  uint64_t v36 = __CRLAccessibilityCastAsSafeCategory(v35, (uint64_t)v34, 1, &v48);
  if (v48) {
LABEL_20:
  }
    abort();
  double v37 = (void *)v36;

  double v38 = [v29 crlaxEditorController];
  [v38 crlaxSetSelectionPath:v37];

  if (v24) {
    id *v24 = v22;
  }
  id v39 = [v29 crlaxEditorController];
  double v40 = [v39 crlaxTextInputEditor];

  return v40;
}

- (_NSRange)crlaxClampRangeToStorageRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unsigned int v5 = [(CRLTextRepAccessibility *)self crlaxStorage];
  v6.NSUInteger location = (NSUInteger)[v5 crlaxRange];
  if (location + length != v6.location + v6.length)
  {
    v11.NSUInteger location = location;
    v11.NSUInteger length = length;
    NSRange v7 = NSIntersectionRange(v6, v11);
    NSUInteger location = v7.location;
    NSUInteger length = v7.length;
  }

  NSUInteger v8 = location;
  NSUInteger v9 = length;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (id)crlaxContentSiblingInDirection:(unint64_t)a3
{
  unsigned int v5 = [(CRLTextRepAccessibility *)self crlaxSortedSiblingsByStorageRange];
  NSRange v6 = (char *)[v5 indexOfObject:self];
  NSRange v7 = v6;
  if (a3 == 1 && v6)
  {
    uint64_t v8 = -1;
LABEL_4:
    NSUInteger v9 = [v5 objectAtIndex:&v7[v8]];
    goto LABEL_9;
  }
  if (!a3 && v6 < (char *)[v5 count] - 1)
  {
    uint64_t v8 = 1;
    goto LABEL_4;
  }
  NSUInteger v9 = 0;
LABEL_9:

  return v9;
}

- (id)crlaxSortedSiblingsByStorageRange
{
  unsigned __int8 v3 = [(CRLTextRepAccessibility *)self crlaxSiblings];
  uint64_t v4 = [v3 allObjects];
  id v5 = [v4 mutableCopy];

  [v5 addObject:self];
  [v5 sortUsingComparator:&stru_1014EC350];
  id v6 = [v5 copy];

  return v6;
}

- (_NSRange)crlaxRepRangeWithStorageRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = [(CRLTextRepAccessibility *)self crlaxRepPositionWithStoragePosition:a3.location];
  NSUInteger v5 = length;
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (unint64_t)crlaxRepPositionWithStoragePosition:(unint64_t)a3
{
  return a3 - (void)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
}

- (_NSRange)crlaxStorageRangeWithRepRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger v4 = [(CRLTextRepAccessibility *)self crlaxStoragePositionWithRepPosition:a3.location];
  NSUInteger v5 = length;
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

- (unint64_t)crlaxStoragePositionWithRepPosition:(unint64_t)a3
{
  return (unint64_t)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep] + a3;
}

- (id)crlaxColumnForCharIndex:(unint64_t)a3
{
  char v15 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1002F9314;
  uint64_t v13 = sub_1002F9324;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002F932C;
  v8[3] = &unk_1014CC6B8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  id v3 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  NSUInteger v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v15);
  if (v15) {
    abort();
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)crlaxAttachmentNumberProvider
{
  return 0;
}

- (void)crlaxLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)CRLTextRepAccessibility;
  [(CRLTextRepAccessibility *)&v11 crlaxLoadAccessibilityInformation];
  id v3 = [(CRLTextRepAccessibility *)self crlaxStorage];
  char v10 = 0;
  NSUInteger v4 = [(CRLTextRepAccessibility *)self crlaxInteractiveCanvasController];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v4, 1, &v10);
  if (v10) {
    abort();
  }
  NSRange v7 = (void *)v6;

  if (v3 && v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002F9498;
    v8[3] = &unk_1014EC378;
    id v9 = v7;
    [v3 crlaxEnumerateSmartFieldsUsingBlock:v8];
  }
}

- (id)crlaxSummaryDescription
{
  id v3 = [(CRLTextRepAccessibility *)self crlaxStorage];
  NSUInteger v4 = [v3 crlaxInferredHeadingRanges];

  if ([v4 count])
  {
    uint64_t v5 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v31 + 1) + 8 * i) rangeValue];
          NSUInteger v13 = v12;
          v38.NSUInteger location = (NSUInteger)[(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
          v38.NSUInteger length = v14;
          v37.NSUInteger location = (NSUInteger)v11;
          v37.NSUInteger length = v13;
          if (NSIntersectionRange(v37, v38).length)
          {
            char v15 = [(CRLTextRepAccessibility *)self crlaxStorage];
            char v16 = [v15 crlaxSubstringWithRange:v11, v13];
            [v5 addObject:v16];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v8);
    }

    if ([v5 count])
    {
      double v17 = [v5 componentsJoinedByString:@", "];
    }
    else
    {
      double v17 = 0;
    }
  }
  else
  {
    double v17 = 0;
  }
  if (![v17 length]
    && [(CRLTextRepAccessibility *)self crlaxRespondsToSelector:"crlaxSubstringInStorageWithRange:" fromExtrasProtocol:&OBJC_PROTOCOL___CRLTextRepAccessibilityExtras])
  {
    id v18 = [(CRLTextRepAccessibility *)self crlaxStorageRangeOfRep];
    uint64_t v20 = -[CRLTextRepAccessibility crlaxSubstringInStorageWithRange:](self, "crlaxSubstringInStorageWithRange:", v18, v19);

    double v17 = (void *)v20;
  }
  if (![v17 length])
  {
    double v21 = [(CRLGroupRepAccessibility *)self crlaxChildReps];
    id v22 = [v21 count];

    if (v22)
    {
      id v23 = objc_opt_new();
      double v24 = [(CRLGroupRepAccessibility *)self crlaxChildReps];
      CGFloat v25 = [v24 sortedArrayUsingComparator:&stru_1014EC398];

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1002F98D8;
      v29[3] = &unk_1014EC3C0;
      id v30 = v23;
      id v26 = v23;
      [v25 crlaxPerformBlock:v29 onElementsOfType:[CRLAccessibilitySafeCategory crlaxTargetClass]];
      uint64_t v27 = [v26 componentsJoinedByString:@", "];

      double v17 = (void *)v27;
    }
  }

  return v17;
}

- (void)pulseCaret
{
  v3.receiver = self;
  v3.super_class = (Class)CRLTextRepAccessibility;
  [(CRLTextRepAccessibility *)&v3 pulseCaret];
  if ([(CRLTextRepAccessibility *)self crlaxRespondsToSelector:"crlaxDidPulseCaret" fromExtrasProtocol:&OBJC_PROTOCOL___CRLTextRepAccessibilityExtras])[(CRLTextRepAccessibility *)self crlaxDidPulseCaret]; {
}
  }

- (NSString)crlaxAccessibilityLabelCustomAttributesString
{
  return self->_crlaxAccessibilityLabelCustomAttributesString;
}

- (void).cxx_destruct
{
}

@end