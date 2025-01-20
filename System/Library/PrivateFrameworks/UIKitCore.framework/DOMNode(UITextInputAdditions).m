@interface DOMNode(UITextInputAdditions)
- (UIColor)textColorForCaretSelection;
- (UITextInputTraits)textInputTraits;
- (double)_lastRectForRange:()UITextInputAdditions;
- (double)caretRect;
- (double)caretRectForPosition:()UITextInputAdditions;
- (double)firstRectForRange:()UITextInputAdditions;
- (id)beginningOfDocument;
- (id)endOfDocument;
- (id)markedTextRange;
- (id)positionFromPosition:()UITextInputAdditions inDirection:offset:;
- (id)positionFromPosition:()UITextInputAdditions offset:;
- (id)positionFromPosition:()UITextInputAdditions toBoundary:inDirection:;
- (id)rangeEnclosingPosition:()UITextInputAdditions withGranularity:inDirection:;
- (id)rangeOfEnclosingWord:()UITextInputAdditions;
- (id)selectedTextRange;
- (id)selectionRectsForRange:()UITextInputAdditions;
- (id)textRangeFromPosition:()UITextInputAdditions toPosition:;
- (uint64_t)_textSelectingContainer;
- (uint64_t)acceptedAutoFillWord:()UITextInputAdditions;
- (uint64_t)automaticallySelectedOverlay;
- (uint64_t)baseWritingDirectionForPosition:()UITextInputAdditions inDirection:;
- (uint64_t)becomesEditableWithGestures;
- (uint64_t)beginFloatingCursorAtPoint:()UITextInputAdditions;
- (uint64_t)beginSelectionChange;
- (uint64_t)characterAfterCaretSelection;
- (uint64_t)characterInRelationToCaretSelection:()UITextInputAdditions;
- (uint64_t)characterRangeAtPoint:()UITextInputAdditions;
- (uint64_t)characterRangeByExtendingPosition:()UITextInputAdditions inDirection:;
- (uint64_t)clearMarkedText;
- (uint64_t)closestPositionToPoint:()UITextInputAdditions;
- (uint64_t)closestPositionToPoint:()UITextInputAdditions withinRange:;
- (uint64_t)comparePosition:()UITextInputAdditions toPosition:;
- (uint64_t)confirmMarkedText:()UITextInputAdditions;
- (uint64_t)constrainedPoint:()UITextInputAdditions;
- (uint64_t)content;
- (uint64_t)contentsIsSingleValue;
- (uint64_t)convertCaretRect:()UITextInputAdditions;
- (uint64_t)delegate;
- (uint64_t)deleteBackward;
- (uint64_t)editable;
- (uint64_t)editing;
- (uint64_t)endFloatingCursor;
- (uint64_t)endSelectionChange;
- (uint64_t)extendCurrentSelection:()UITextInputAdditions;
- (uint64_t)fontForCaretSelection;
- (uint64_t)frameForDictationResultPlaceholder:()UITextInputAdditions;
- (uint64_t)handleKeyWebEvent:()UITextInputAdditions;
- (uint64_t)hasContent;
- (uint64_t)hasSelection;
- (uint64_t)initialSelectionBehavior;
- (uint64_t)inputDelegate;
- (uint64_t)insertDictationResult:()UITextInputAdditions withCorrectionIdentifier:;
- (uint64_t)insertDictationResultPlaceholder;
- (uint64_t)insertText:()UITextInputAdditions;
- (uint64_t)insertTextPlaceholderWithSize:()UITextInputAdditions;
- (uint64_t)interactionAssistant;
- (uint64_t)isAutoFillMode;
- (uint64_t)isEditable;
- (uint64_t)isEditing;
- (uint64_t)isPosition:()UITextInputAdditions atBoundary:inDirection:;
- (uint64_t)isPosition:()UITextInputAdditions withinTextUnit:inDirection:;
- (uint64_t)isShowingPlaceholder;
- (uint64_t)isSingleLineDocument;
- (uint64_t)markedTextStyle;
- (uint64_t)metadataDictionariesForDictationResults;
- (uint64_t)moveDown;
- (uint64_t)moveLeft;
- (uint64_t)moveRight;
- (uint64_t)moveUp;
- (uint64_t)offsetFromPosition:()UITextInputAdditions toPosition:;
- (uint64_t)positionWithinRange:()UITextInputAdditions farthestInDirection:;
- (uint64_t)rangeByExtendingCurrentSelection:()UITextInputAdditions;
- (uint64_t)rangeByMovingCurrentSelection:()UITextInputAdditions;
- (uint64_t)rectsForNSRange:()UITextInputAdditions;
- (uint64_t)removeDictationResultPlaceholder:()UITextInputAdditions willInsertResult:;
- (uint64_t)removeTextPlaceholder:()UITextInputAdditions;
- (uint64_t)replaceCurrentWordWithText:()UITextInputAdditions;
- (uint64_t)replaceRange:()UITextInputAdditions withText:;
- (uint64_t)replaceRange:()UITextInputAdditions withText:closeTyping:;
- (uint64_t)replaceRangeWithTextWithoutClosingTyping:()UITextInputAdditions replacementText:;
- (uint64_t)requiresKeyEvents;
- (uint64_t)returnKeyType;
- (uint64_t)selectAll;
- (uint64_t)selectionAffinity;
- (uint64_t)selectionAtDocumentStart;
- (uint64_t)selectionAtWordStart;
- (uint64_t)selectionRange;
- (uint64_t)selectionState;
- (uint64_t)setInputDelegate:()UITextInputAdditions;
- (uint64_t)setMarkedText:()UITextInputAdditions selectedRange:;
- (uint64_t)setSelectedTextRange:()UITextInputAdditions;
- (uint64_t)setSelectedTextRange:()UITextInputAdditions withAffinityDownstream:;
- (uint64_t)setSelectionWithPoint:()UITextInputAdditions;
- (uint64_t)setSelectionWithPoint:()UITextInputAdditions inset:;
- (uint64_t)setText:()UITextInputAdditions;
- (uint64_t)takeTraitsFrom:()UITextInputAdditions;
- (uint64_t)text;
- (uint64_t)textInRange:()UITextInputAdditions;
- (uint64_t)textLoupeVisibility;
- (uint64_t)textSuggestionDelegate;
- (uint64_t)textTrimmingSet;
- (uint64_t)uiWebDocumentView;
- (uint64_t)unmarkText;
- (uint64_t)updateAutoscroll:()UITextInputAdditions;
- (uint64_t)updateFloatingCursorAtPoint:()UITextInputAdditions;
- (uint64_t)updateFloatingCursorAtPoint:()UITextInputAdditions animated:;
- (uint64_t)wordOffsetInRange:()UITextInputAdditions;
- (void)constrainedPoint:()UITextInputAdditions withInset:;
@end

@implementation DOMNode(UITextInputAdditions)

- (uint64_t)takeTraitsFrom:()UITextInputAdditions
{
  v4 = (void *)[a1 textInputTraits];
  return [v4 takeTraitsFrom:a3];
}

- (uint64_t)hasContent
{
  WebThreadLock();
  v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v2 focusedNodeHasContent];
}

- (uint64_t)isSingleLineDocument
{
  return [a1 isContentEditable] ^ 1;
}

- (UITextInputTraits)textInputTraits
{
  uint64_t v2 = [a1 isSecure];
  v3 = objc_alloc_init(UITextInputTraits);
  [(UITextInputTraits *)v3 setSecureTextEntry:v2];
  if (v2) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2;
  }
  [(UITextInputTraits *)v3 setAutocapitalizationType:v4];
  [(UITextInputTraits *)v3 setAutocorrectionType:v2];
  -[UITextInputTraits setKeyboardType:](v3, "setKeyboardType:", [a1 keyboardType]);
  -[UITextInputTraits setIsSingleLineDocument:](v3, "setIsSingleLineDocument:", [a1 isSingleLineDocument]);
  if ([a1 isContentEditable]) {
    -[UITextInputTraits setTextSuggestionDelegate:](v3, "setTextSuggestionDelegate:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_formDelegate"));
  }
  [(UITextInputTraits *)v3 setShortcutConversionType:v2];
  [(UITextInputTraits *)v3 setSmartInsertDeleteType:v2];
  [(UITextInputTraits *)v3 setSmartQuotesType:v2];
  [(UITextInputTraits *)v3 setSmartDashesType:v2];
  return v3;
}

- (uint64_t)delegate
{
  return 0;
}

- (uint64_t)requiresKeyEvents
{
  return 1;
}

- (uint64_t)handleKeyWebEvent:()UITextInputAdditions
{
  WebThreadLock();
  v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v5 _handleKeyEvent:a3];
}

- (uint64_t)beginSelectionChange
{
  uint64_t v2 = (void *)[a1 inputDelegate];
  return [v2 selectionWillChange:a1];
}

- (uint64_t)endSelectionChange
{
  uint64_t v2 = (void *)[a1 inputDelegate];
  return [v2 selectionDidChange:a1];
}

- (uint64_t)textTrimmingSet
{
  return 0;
}

- (uint64_t)deleteBackward
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  [v2 _setProhibitsScrolling:1];
  objc_msgSend((id)objc_msgSend(v2, "webView"), "deleteBackward:", a1);
  return [v2 _setProhibitsScrolling:0];
}

- (uint64_t)insertText:()UITextInputAdditions
{
  WebThreadLock();
  v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  [v5 _setProhibitsScrolling:1];
  objc_msgSend((id)objc_msgSend(v5, "webView"), "insertText:", a3);
  return [v5 _setProhibitsScrolling:0];
}

- (uint64_t)uiWebDocumentView
{
  v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView");
  return [v1 _UIKitDelegate];
}

- (uint64_t)beginFloatingCursorAtPoint:()UITextInputAdditions
{
  v5 = (void *)[a1 uiWebDocumentView];
  return objc_msgSend(v5, "beginFloatingCursorAtPoint:", a2, a3);
}

- (uint64_t)updateFloatingCursorAtPoint:()UITextInputAdditions
{
  v5 = (void *)[a1 uiWebDocumentView];
  return objc_msgSend(v5, "updateFloatingCursorAtPoint:", a2, a3);
}

- (uint64_t)updateFloatingCursorAtPoint:()UITextInputAdditions animated:
{
  v8 = (void *)[a1 uiWebDocumentView];
  return objc_msgSend(v8, "updateFloatingCursorAtPoint:animated:", a5, a2, a3);
}

- (uint64_t)endFloatingCursor
{
  v1 = (void *)[a1 uiWebDocumentView];
  return [v1 endFloatingCursor];
}

- (uint64_t)insertDictationResult:()UITextInputAdditions withCorrectionIdentifier:
{
  v6 = (void *)[a1 uiWebDocumentView];
  return [v6 insertDictationResult:a3 withCorrectionIdentifier:a4];
}

- (uint64_t)metadataDictionariesForDictationResults
{
  v1 = (void *)[a1 uiWebDocumentView];
  return [v1 metadataDictionariesForDictationResults];
}

- (uint64_t)insertDictationResultPlaceholder
{
  v1 = (void *)[a1 uiWebDocumentView];
  return [v1 insertDictationResultPlaceholder];
}

- (uint64_t)removeDictationResultPlaceholder:()UITextInputAdditions willInsertResult:
{
  v6 = (void *)[a1 uiWebDocumentView];
  return [v6 removeDictationResultPlaceholder:a3 willInsertResult:a4];
}

- (uint64_t)frameForDictationResultPlaceholder:()UITextInputAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "uiWebDocumentView"), "frameForDictationResultPlaceholder:", a3);
}

- (uint64_t)insertTextPlaceholderWithSize:()UITextInputAdditions
{
  v5 = (void *)[a1 uiWebDocumentView];
  return objc_msgSend(v5, "insertTextPlaceholderWithSize:", a2, a3);
}

- (uint64_t)removeTextPlaceholder:()UITextInputAdditions
{
  uint64_t v4 = (void *)[a1 uiWebDocumentView];
  return [v4 removeTextPlaceholder:a3];
}

- (uint64_t)characterInRelationToCaretSelection:()UITextInputAdditions
{
  WebThreadLock();
  v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v5 characterInRelationToCaretSelection:a3];
}

- (uint64_t)setMarkedText:()UITextInputAdditions selectedRange:
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  v9 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  [v9 _setProhibitsScrolling:1];
  objc_msgSend(v9, "setMarkedText:selectedRange:", a3, a4, a5);
  [v9 _setProhibitsScrolling:0];
  v10 = (void *)[a1 inputDelegate];
  return [v10 textDidChange:a1];
}

- (uint64_t)confirmMarkedText:()UITextInputAdditions
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  [v5 _setProhibitsScrolling:1];
  [v5 confirmMarkedText:a3];
  [v5 _setProhibitsScrolling:0];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "webView"), "_UIKitDelegate"), "interactionAssistant"), "setGestureRecognizers");
  v6 = (void *)[a1 inputDelegate];
  return [v6 textDidChange:a1];
}

- (uint64_t)rectsForNSRange:()UITextInputAdditions
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  WebThreadLock();
  v9 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  uint64_t v10 = objc_msgSend(v9, "convertNSRangeToDOMRange:", a3, a4);
  return [v9 selectionRectsForRange:v10];
}

- (uint64_t)clearMarkedText
{
  return objc_msgSend(a1, "setMarkedText:selectedRange:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (uint64_t)replaceCurrentWordWithText:()UITextInputAdditions
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  [a1 clearMarkedText];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "expandSelectionToWordContainingCaretSelection");
  if ([a3 length]) {
    [a1 insertText:a3];
  }
  else {
    [a1 deleteBackward];
  }
  v5 = (void *)[a1 inputDelegate];
  return [v5 textDidChange:a1];
}

- (uint64_t)characterAfterCaretSelection
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v2 characterAfterCaretSelection];
}

- (uint64_t)fontForCaretSelection
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  char v8 = 0;
  v3 = (void *)[v2 fontForSelection:&v8];
  if (v3)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "webView"), "_UIKitDelegate"), "_zoomedDocumentScale");
    double v5 = v4;
    if (fabs(v4 + -1.0) > 0.00000011920929)
    {
      [v3 pointSize];
      return objc_msgSend(off_1E52D39B8, "fontWithFamilyName:traits:size:", objc_msgSend(v3, "familyName"), objc_msgSend(v3, "traits"), v5 * v6);
    }
  }
  return (uint64_t)v3;
}

- (UIColor)textColorForCaretSelection
{
  return +[UIColor blackColor];
}

- (uint64_t)wordOffsetInRange:()UITextInputAdditions
{
  WebThreadLock();
  double v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v5 wordOffsetInRange:a3];
}

- (uint64_t)selectionRange
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v2 _selectedNSRange];
}

- (uint64_t)rangeByMovingCurrentSelection:()UITextInputAdditions
{
  WebThreadLock();
  double v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v5 rangeByMovingCurrentSelection:a3];
}

- (uint64_t)rangeByExtendingCurrentSelection:()UITextInputAdditions
{
  WebThreadLock();
  double v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v5 rangeByExtendingCurrentSelection:a3];
}

- (uint64_t)extendCurrentSelection:()UITextInputAdditions
{
  WebThreadLock();
  [a1 beginSelectionChange];
  double v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  objc_msgSend(v5, "setSelectedDOMRange:affinity:closeTyping:", objc_msgSend(v5, "rangeByExtendingCurrentSelection:", a3), (int)a3 >= 0, 0);
  return [a1 endSelectionChange];
}

- (uint64_t)hasSelection
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v2 hasSelection];
}

- (uint64_t)selectionAtDocumentStart
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v2 selectionAtDocumentStart];
}

- (uint64_t)selectionAtWordStart
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v2 selectionAtWordStart];
}

- (uint64_t)selectAll
{
  WebThreadLock();
  [a1 beginSelectionChange];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "_selectAll");
  return [a1 endSelectionChange];
}

- (uint64_t)selectionState
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  return [v2 selectionState];
}

- (void)constrainedPoint:()UITextInputAdditions withInset:
{
  WebThreadLock();
  if (a1) {
    [a1 innerFrameQuad];
  }
  else {
    memset(v6, 0, sizeof(v6));
  }
  v7.origin.CGFloat x = quadBoundingBox((double *)v6);
  CGFloat x = v7.origin.x;
  CGFloat y = v7.origin.y;
  CGFloat width = v7.size.width;
  CGFloat height = v7.size.height;
  CGRectGetMinX(v7);
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  CGRectGetMaxX(v8);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRectGetMinY(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetMaxY(v10);
}

- (uint64_t)setText:()UITextInputAdditions
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "expandSelectionToElementContainingCaretSelection");
  [a1 insertText:a3];
  double v5 = (void *)[a1 inputDelegate];
  return [v5 textDidChange:a1];
}

- (uint64_t)text
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  uint64_t v3 = [v2 elementRangeContainingCaretSelection];
  return [v2 stringForRange:v3];
}

- (uint64_t)setSelectionWithPoint:()UITextInputAdditions inset:
{
  objc_msgSend(a1, "constrainedPoint:withInset:");
  double v3 = v2;
  double v5 = v4;
  WebThreadLock();
  [a1 beginSelectionChange];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "moveSelectionToPoint:", v3, v5);
  return [a1 endSelectionChange];
}

- (uint64_t)setSelectionWithPoint:()UITextInputAdditions
{
  return objc_msgSend(a1, "setSelectionWithPoint:inset:", a3, a4, 2.0);
}

- (double)caretRect
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "caretRect");
  double v3 = v2;
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate"), "caretInsets");
  return v3 + v4;
}

- (uint64_t)convertCaretRect:()UITextInputAdditions
{
  CGRect v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "documentView");
  return objc_msgSend(v9, "convertRect:toView:", 0, a2, a3, a4, a5);
}

- (uint64_t)isShowingPlaceholder
{
  return 0;
}

- (uint64_t)textSuggestionDelegate
{
  return 0;
}

- (uint64_t)contentsIsSingleValue
{
  return 0;
}

- (uint64_t)textLoupeVisibility
{
  return 0;
}

- (uint64_t)returnKeyType
{
  return 0;
}

- (uint64_t)initialSelectionBehavior
{
  return 0;
}

- (uint64_t)automaticallySelectedOverlay
{
  v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView");
  return [v1 _UIKitDelegate];
}

- (uint64_t)updateAutoscroll:()UITextInputAdditions
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0) {
    return result;
  }
  int v6 = [a1 scrollLeft];
  int v7 = [a1 scrollTop];
  int v8 = [a1 scrollWidth];
  int v9 = [a1 scrollHeight];
  CGRect v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  [v10 _selectionClipRect];
  double v12 = v11;
  double v14 = v13;
  [v10 _zoomedDocumentScale];
  double v16 = v12 / v15 + -16.0;
  double v17 = v14 / v15 + -16.0;
  if (v16 >= 0.0) {
    double v18 = v16;
  }
  else {
    double v18 = 0.0;
  }
  if (v17 >= 0.0) {
    double v19 = v17;
  }
  else {
    double v19 = 0.0;
  }
  int v20 = [a3 directions];
  unint64_t v21 = [a3 count];
  double v22 = 10.0;
  if (v21 <= 4) {
    double v22 = (double)(int)(1.0 / (double)(unint64_t)(6 - [a3 count]) * 10.0);
  }
  double v23 = (double)v6;
  if (v20)
  {
    double v23 = v23 - v22;
    if (v23 < 0.0)
    {
      v20 &= ~1u;
      double v23 = 0.0;
    }
  }
  else if ((v20 & 2) != 0)
  {
    double v23 = v22 + v23;
    if (v18 + v23 > (double)v8)
    {
      v20 &= ~1u;
      double v23 = (double)v8;
    }
  }
  double v24 = (double)v7;
  if ((v20 & 4) == 0)
  {
    if ((v20 & 8) == 0) {
      goto LABEL_23;
    }
    double v25 = v22 + v24;
    double v22 = v19 + v22 + v24;
    double v24 = (double)v9;
    if (v22 > (double)v9)
    {
      v20 &= ~2u;
      goto LABEL_23;
    }
LABEL_24:
    [a1 setScrollLeft:(int)v23];
    [a1 setScrollTop:(int)v25];
    v26 = (void *)[a1 textInputView];
    objc_msgSend((id)objc_msgSend(v10, "interactionAssistant"), "autoscrollUntransformedExtentPoint");
    objc_msgSend(v26, "convertPoint:fromView:", 0);
    double v28 = v27;
    double v30 = v29;
    if ([a1 selectionState] == 1)
    {
      id v31 = +[UITextMagnifierCaret sharedCaretMagnifier];
      objc_msgSend(a1, "setSelectionWithPoint:", v28, v30);
    }
    else if ([a1 selectionState] == 2)
    {
      id v31 = +[UITextMagnifierRanged sharedRangedMagnifier];
      objc_msgSend((id)objc_msgSend(a1, "interactionAssistant"), "updateSelectionWithPoint:", v28, v30);
      objc_msgSend((id)objc_msgSend(a1, "interactionAssistant"), "updateDisplayedSelection");
    }
    else
    {
      id v31 = 0;
    }
    [v31 setNeedsDisplay];
    [a3 point];
    return objc_msgSend(v31, "postAutoscrollPoint:");
  }
  double v25 = v24 - v22;
  if (v24 - v22 >= 0.0) {
    goto LABEL_24;
  }
  v20 &= ~2u;
  double v24 = 0.0;
LABEL_23:
  double v25 = v24;
  if (v20) {
    goto LABEL_24;
  }
  return objc_msgSend(v10, "cancelAutoscroll", v23, v22);
}

- (uint64_t)constrainedPoint:()UITextInputAdditions
{
  return objc_msgSend(a1, "constrainedPoint:withInset:", a3, a4, 2.0);
}

- (uint64_t)acceptedAutoFillWord:()UITextInputAdditions
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return [v4 acceptedAutoFillWord:a3];
}

- (uint64_t)isAutoFillMode
{
  v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return [v1 isAutoFillMode];
}

- (uint64_t)interactionAssistant
{
  v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return [v1 interactionAssistant];
}

- (uint64_t)content
{
  return 0;
}

- (uint64_t)isEditable
{
  return 1;
}

- (uint64_t)isEditing
{
  return 1;
}

- (uint64_t)becomesEditableWithGestures
{
  return 0;
}

- (uint64_t)_textSelectingContainer
{
  WebThreadLock();
  double v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return [v2 _textSelectingContainer];
}

- (id)selectedTextRange
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "selectedDOMRange");
  uint64_t v3 = [a1 selectionAffinity];
  return +[UITextRangeImpl wrapDOMRange:v2 withAffinity:v3];
}

- (uint64_t)setSelectedTextRange:()UITextInputAdditions withAffinityDownstream:
{
  WebThreadLock();
  int v7 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  [a1 beginSelectionChange];
  if ([a3 domRange])
  {
    int v8 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
    objc_msgSend(v8, "setSelectedDOMRange:affinity:closeTyping:", objc_msgSend(a3, "domRange"), a4, 1);
    [v8 revealSelectionAtExtent:a4 ^ 1];
  }
  else
  {
    [v7 clearSelection];
  }
  return [a1 endSelectionChange];
}

- (uint64_t)setSelectedTextRange:()UITextInputAdditions
{
  if ([a3 isEmpty]) {
    BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "start"), "webVisiblePosition"), "affinity") == 1;
  }
  else {
    BOOL v5 = 0;
  }
  return [a1 setSelectedTextRange:a3 withAffinityDownstream:v5];
}

- (id)beginningOfDocument
{
  WebThreadLock();
  uint64_t v2 = [a1 startPosition];
  return +[UITextPositionImpl wrapWebVisiblePosition:v2];
}

- (id)endOfDocument
{
  WebThreadLock();
  uint64_t v2 = [a1 endPosition];
  return +[UITextPositionImpl wrapWebVisiblePosition:v2];
}

- (uint64_t)textInRange:()UITextInputAdditions
{
  WebThreadLock();
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "stringForRange:", objc_msgSend(a3, "domRange"));
  return [v5 _stringByReplacingCharacter:160 withCharacter:32];
}

- (id)textRangeFromPosition:()UITextInputAdditions toPosition:
{
  WebThreadLock();
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB6D78], "rangeForFirstPosition:second:", objc_msgSend(a3, "webVisiblePosition"), objc_msgSend(a4, "webVisiblePosition"));
  BOOL v7 = objc_msgSend((id)objc_msgSend(a4, "webVisiblePosition"), "affinity") != 1;
  return +[UITextRangeImpl wrapDOMRange:v6 withAffinity:v7];
}

- (id)rangeOfEnclosingWord:()UITextInputAdditions
{
  WebThreadLock();
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", 1, 1);
  return +[UITextRangeImpl wrapDOMRange:v4];
}

- (uint64_t)replaceRange:()UITextInputAdditions withText:closeTyping:
{
  WebThreadLock();
  objc_msgSend((id)objc_msgSend(a1, "inputDelegate"), "textWillChange:", a1);
  [a1 clearMarkedText];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "setSelectedDOMRange:affinity:closeTyping:", objc_msgSend(a3, "domRange"), 0, a5);
  if ([a4 length]) {
    [a1 insertText:a4];
  }
  else {
    [a1 deleteBackward];
  }
  int v9 = (void *)[a1 inputDelegate];
  return [v9 textDidChange:a1];
}

- (uint64_t)replaceRange:()UITextInputAdditions withText:
{
  return [a1 replaceRange:a3 withText:a4 closeTyping:1];
}

- (uint64_t)replaceRangeWithTextWithoutClosingTyping:()UITextInputAdditions replacementText:
{
  return [a1 replaceRange:a3 withText:a4 closeTyping:0];
}

- (double)firstRectForRange:()UITextInputAdditions
{
  WebThreadLock();
  BOOL v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  uint64_t v6 = (void *)[v5 documentView];
  BOOL v7 = objc_msgSend(v5, "selectionRectsForRange:", objc_msgSend(a3, "domRange"));
  if (![v7 count]) {
    return *MEMORY[0x1E4F1DB20];
  }
  objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", 0), "rect");
  objc_msgSend(v6, "convertRect:toView:", 0);
  return result;
}

- (double)_lastRectForRange:()UITextInputAdditions
{
  WebThreadLock();
  BOOL v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  uint64_t v6 = (void *)[v5 documentView];
  BOOL v7 = objc_msgSend(v5, "selectionRectsForRange:", objc_msgSend(a3, "domRange"));
  if (![v7 count]) {
    return *MEMORY[0x1E4F1DB20];
  }
  objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 1), "rect");
  objc_msgSend(v6, "convertRect:toView:", 0);
  return result;
}

- (uint64_t)moveRight
{
  WebThreadLock();
  [a1 beginSelectionChange];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "moveRight:", a1);
  return [a1 endSelectionChange];
}

- (uint64_t)moveLeft
{
  WebThreadLock();
  [a1 beginSelectionChange];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "moveLeft:", a1);
  return [a1 endSelectionChange];
}

- (uint64_t)moveUp
{
  WebThreadLock();
  [a1 beginSelectionChange];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "moveUp:", a1);
  return [a1 endSelectionChange];
}

- (uint64_t)moveDown
{
  WebThreadLock();
  [a1 beginSelectionChange];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "moveDown:", a1);
  return [a1 endSelectionChange];
}

- (id)markedTextRange
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "markedTextDOMRange");
  if ([v2 collapsed]) {
    return 0;
  }
  return +[UITextRangeImpl wrapDOMRange:v2];
}

- (uint64_t)unmarkText
{
  WebThreadLock();
  [a1 beginSelectionChange];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "selectedFrame"), "confirmMarkedText:", 0);
  return [a1 endSelectionChange];
}

- (uint64_t)comparePosition:()UITextInputAdditions toPosition:
{
  BOOL v5 = (void *)[a3 webVisiblePosition];
  uint64_t v6 = [a4 webVisiblePosition];
  return [v5 compare:v6];
}

- (uint64_t)offsetFromPosition:()UITextInputAdditions toPosition:
{
  return (int)objc_msgSend((id)objc_msgSend(a4, "webVisiblePosition"), "distanceFromPosition:", objc_msgSend(a3, "webVisiblePosition"));
}

- (id)positionFromPosition:()UITextInputAdditions offset:
{
  WebThreadLock();
  uint64_t v6 = (void *)[a3 webVisiblePosition];
  if (a4 >= 0) {
    uint64_t v7 = a4;
  }
  else {
    uint64_t v7 = -a4;
  }
  id result = (id)[v6 positionByMovingInDirection:a4 < 1 amount:v7];
  if (result)
  {
    return +[UITextPositionImpl wrapWebVisiblePosition:result];
  }
  return result;
}

- (id)positionFromPosition:()UITextInputAdditions inDirection:offset:
{
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionByMovingInDirection:amount:", a4, a5);
  if (result)
  {
    return +[UITextPositionImpl wrapWebVisiblePosition:result];
  }
  return result;
}

- (uint64_t)isPosition:()UITextInputAdditions atBoundary:inDirection:
{
  WebThreadLock();
  int v8 = (void *)[a3 webVisiblePosition];
  return [v8 atBoundaryOfGranularity:a4 inDirection:a5];
}

- (id)positionFromPosition:()UITextInputAdditions toBoundary:inDirection:
{
  WebThreadLock();
  id result = (id)objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "positionOfNextBoundaryOfGranularity:inDirection:", a4, a5);
  if (result)
  {
    return +[UITextPositionImpl wrapWebVisiblePosition:result];
  }
  return result;
}

- (uint64_t)isPosition:()UITextInputAdditions withinTextUnit:inDirection:
{
  WebThreadLock();
  int v8 = (void *)[a3 webVisiblePosition];
  return [v8 withinTextUnitOfGranularity:a4 inDirectionIfAtBoundary:a5];
}

- (id)rangeEnclosingPosition:()UITextInputAdditions withGranularity:inDirection:
{
  WebThreadLock();
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "enclosingTextUnitOfGranularity:inDirectionIfAtBoundary:", a4, a5);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "webVisiblePosition"), "affinity");
  if (!v8) {
    return 0;
  }
  return +[UITextRangeImpl wrapDOMRange:v8 withAffinity:v9 != 1];
}

- (uint64_t)inputDelegate
{
  WebThreadLock();
  uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return [v2 inputDelegate];
}

- (uint64_t)setInputDelegate:()UITextInputAdditions
{
  WebThreadLock();
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return [v5 setInputDelegate:a3];
}

- (double)caretRectForPosition:()UITextInputAdditions
{
  if (!a3) {
    return *MEMORY[0x1E4F1DB20];
  }
  WebThreadLock();
  BOOL v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  uint64_t v6 = (void *)[v5 documentView];
  objc_msgSend(v5, "caretRectForPosition:", objc_msgSend(a3, "webVisiblePosition"));
  objc_msgSend(v6, "convertRect:toView:", 0);
  return round(v8 + v7 - fmax(floor(v7), 2.0));
}

- (uint64_t)markedTextStyle
{
  return 0;
}

- (uint64_t)closestPositionToPoint:()UITextInputAdditions
{
  WebThreadLock();
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return objc_msgSend(v6, "closestPositionToPoint:", a2, a3);
}

- (uint64_t)closestPositionToPoint:()UITextInputAdditions withinRange:
{
  WebThreadLock();
  uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return objc_msgSend(v9, "closestPositionToPoint:withinRange:", a5, a2, a3);
}

- (uint64_t)characterRangeAtPoint:()UITextInputAdditions
{
  uint64_t v2 = objc_msgSend(a1, "closestPositionToPoint:");
  uint64_t v3 = [a1 positionFromPosition:v2 offset:1];
  if (v3)
  {
    uint64_t v4 = v3;
    BOOL v5 = a1;
    uint64_t v6 = v2;
  }
  else
  {
    uint64_t result = [a1 positionFromPosition:v2 offset:-1];
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    BOOL v5 = a1;
    uint64_t v4 = v2;
  }
  return [v5 textRangeFromPosition:v6 toPosition:v4];
}

- (uint64_t)positionWithinRange:()UITextInputAdditions farthestInDirection:
{
  uint64_t v6 = objc_msgSend(a1, "baseWritingDirectionForPosition:inDirection:", objc_msgSend(a3, "start"), 0);
  if ((unint64_t)(a4 - 3) > 1)
  {
    if (!v6) {
      goto LABEL_3;
    }
  }
  else if (v6)
  {
LABEL_3:
    return [a3 start];
  }
  return [a3 end];
}

- (uint64_t)characterRangeByExtendingPosition:()UITextInputAdditions inDirection:
{
  uint64_t v7 = [a1 baseWritingDirectionForPosition:a3 inDirection:0];
  uint64_t v8 = 1;
  if (v7) {
    uint64_t v8 = -1;
  }
  if ((unint64_t)(a4 - 3) >= 2) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t result = [a1 positionFromPosition:a3 offset:v9];
  if (result)
  {
    return [a1 textRangeFromPosition:a3 toPosition:result];
  }
  return result;
}

- (uint64_t)baseWritingDirectionForPosition:()UITextInputAdditions inDirection:
{
  return 0;
}

- (id)selectionRectsForRange:()UITextInputAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  WebThreadLock();
  BOOL v5 = objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame");
  uint64_t v6 = (void *)[v5 documentView];
  uint64_t v7 = objc_msgSend(v5, "selectionRectsForRange:", objc_msgSend(a3, "domRange"));
  if (!v7) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v8 = v7;
  if (![v7 count]) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v13 rect];
        objc_msgSend(v6, "convertRect:toView:", 0);
        objc_msgSend(v13, "setRect:");
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return +[UITextSelectionRectImpl rectsWithWebRects:v8];
}

- (uint64_t)editable
{
  return 1;
}

- (uint64_t)editing
{
  return 1;
}

- (uint64_t)selectionAffinity
{
  v1 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ownerDocument"), "webFrame"), "webView"), "_UIKitDelegate");
  return [v1 selectionAffinity];
}

@end