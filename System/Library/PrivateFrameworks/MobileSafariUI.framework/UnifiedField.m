@interface UnifiedField
- (BOOL)_allowsReflectedTopHit;
- (BOOL)_hasContent;
- (BOOL)_waitingForTopHitForCurrentText;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)endEditing:(BOOL)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasSelectedQuerySuggestion;
- (BOOL)isPastingText;
- (BOOL)isResigningFirstResponder;
- (BOOL)isUsingPencilInput;
- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5;
- (BOOL)keyboardInputShouldDelete:(id)a3;
- (BOOL)lastEditWasADeletion;
- (BOOL)lastInputWasQuerySuggestion;
- (BOOL)performingExternalSearch;
- (BOOL)preserveSelectionOnResignFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)supportsImagePaste;
- (CGRect)editRect;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CKContextCompleter)contextCompleter;
- (CompletionItem)reflectedItem;
- (NSArray)querySuggestions;
- (UIColor)placeholderColor;
- (UnifiedField)initWithFrame:(CGRect)a3;
- (double)placeholderHorizontalInset;
- (id)_allCombinationsOfModifierKeys;
- (id)_reflectedItemCompletionString;
- (id)_textForPasteboard;
- (id)_textWithoutWhitespace;
- (id)_topHitForCurrentText;
- (id)_voiceSearchInputModeForFirstResponder:(BOOL)a3;
- (id)keyCommands;
- (int64_t)voiceSearchState;
- (unint64_t)_unifiedFieldInputType;
- (void)_cancelPendingTopHitNavigation;
- (void)_endEditingWithCurrentText;
- (void)_layoutTopHitCompletionView;
- (void)_promoteCompletionToSelection;
- (void)_promoteCompletionToSelectionSelectingSuffix:(BOOL)a3 andMoveForward:(BOOL)a4;
- (void)_reflectedItemCompletionString;
- (void)_removeTopHitCompletionView;
- (void)_restoreUserTypedText;
- (void)_setReflectedItem:(id)a3 updateUserTypedPrefix:(BOOL)a4;
- (void)_setTopHit:(id)a3;
- (void)_textDidChangeFromTyping;
- (void)_updateReturnKey;
- (void)buildMenuWithBuilder:(id)a3;
- (void)clearUserTypedText;
- (void)completeDictation;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dictationRecognitionFailed;
- (void)dictationRecordingDidEnd;
- (void)focusAndInsertCursorAtEnd;
- (void)focusNextKeyViewKeyPressed;
- (void)focusPreviousKeyViewKeyPressed;
- (void)insertTextSuggestion:(id)a3;
- (void)layoutSubviews;
- (void)moveLeftKeyPressed;
- (void)moveRightKeyPressed;
- (void)nextCompletionSelectionByRowKeyPressed;
- (void)nextCompletionSelectionBySectionKeyPressed;
- (void)paste:(id)a3;
- (void)pasteAndGo:(id)a3;
- (void)pasteAndSearch:(id)a3;
- (void)previousCompletionSelectionByRowKeyPressed;
- (void)previousCompletionSelectionBySectionKeyPressed;
- (void)selectAll:(id)a3;
- (void)selectCompletionKeyPressed;
- (void)setAttributedText:(id)a3;
- (void)setContextCompleter:(id)a3;
- (void)setFont:(id)a3;
- (void)setIsResigningFirstResponder:(BOOL)a3;
- (void)setLastEditWasADeletion:(BOOL)a3;
- (void)setPerformingExternalSearch:(BOOL)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPreserveSelectionOnResignFirstResponder:(BOOL)a3;
- (void)setReflectedItem:(id)a3;
- (void)setText:(id)a3;
- (void)setVoiceSearchState:(int64_t)a3;
- (void)topHitDidBecomeReady;
- (void)willBeginPencilTextInputEditing;
@end

@implementation UnifiedField

- (UnifiedField)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UnifiedField;
  v3 = -[UnifiedField initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UnifiedField *)v3 addTarget:v3 action:sel__endEditingWithCurrentText forControlEvents:0x80000];
    [(UnifiedField *)v4 addTarget:v4 action:sel__textDidChangeFromTyping forControlEvents:0x20000];
    [(UnifiedField *)v4 setTextDragOptions:1];
    uint64_t v5 = [MEMORY[0x1E4FB1708] isEnabledByDefault];
    v6 = [(UnifiedField *)v4 textDragInteraction];
    [v6 setEnabled:v5];

    [(UnifiedField *)v4 setClipsToBounds:1];
    [(UnifiedField *)v4 setEnablesReturnKeyAutomatically:0];
    [(UnifiedField *)v4 setUseAutomaticEndpointing:1];
    v7 = [(UnifiedField *)v4 _clearButton];
    [v7 setAccessibilityIdentifier:@"ClearTextButton"];

    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v4 selector:sel_dictationDidFinish_ name:*MEMORY[0x1E4FB2830] object:0];

    v9 = (UITextCursorAssertionController *)objc_alloc_init(MEMORY[0x1E4FB1D58]);
    textCursorAssertionController = v4->_textCursorAssertionController;
    v4->_textCursorAssertionController = v9;

    v11 = v4;
  }

  return v4;
}

- (void)paste:(id)a3
{
  self->_pastingText = 1;
  v3.receiver = self;
  v3.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v3 paste:a3];
}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v12 buildMenuWithBuilder:v4];
  uint64_t v5 = [v4 system];
  v6 = [MEMORY[0x1E4FB1998] contextSystem];

  if (v5 == v6)
  {
    v7 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v8 = objc_msgSend(v7, "safari_pasteAndNavigateCommand");

    if (v8)
    {
      uint64_t v9 = *MEMORY[0x1E4FB2D90];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __37__UnifiedField_buildMenuWithBuilder___block_invoke;
      v10[3] = &unk_1E6D7B8A8;
      id v11 = v8;
      [v4 replaceChildrenOfMenuForIdentifier:v9 fromChildrenBlock:v10];
    }
  }
}

id __37__UnifiedField_buildMenuWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_40];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = (void *)[v3 mutableCopy];

    [v6 insertObject:*(void *)(a1 + 32) atIndex:v5 + 1];
  }
  else
  {
    v6 = [v3 arrayByAddingObject:*(void *)(a1 + 32)];
  }
  return v6;
}

BOOL __37__UnifiedField_buildMenuWithBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = (objc_opt_isKindOfClass() & 1) != 0 && [v2 action] == (void)sel_paste_;

  return v3;
}

- (void)pasteAndGo:(id)a3
{
  id v4 = [(UnifiedField *)self delegate];
  [v4 unifiedFieldShouldPasteAndNavigate:self];
}

- (void)pasteAndSearch:(id)a3
{
  id v4 = [(UnifiedField *)self delegate];
  [v4 unifiedFieldShouldPasteAndNavigate:self];
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UnifiedField;
  -[UnifiedField rightViewRectForBounds:](&v8, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6 + -2.5;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v7;
  return result;
}

- (BOOL)_hasContent
{
  if (self->_topHitCompletionView) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UnifiedField;
  return [(UnifiedField *)&v3 _hasContent];
}

- (void)setPlaceholderColor:(id)a3
{
  id v8 = a3;
  id v4 = [(UnifiedField *)self placeholderColor];
  if (v4 != v8)
  {
    double v5 = [(UnifiedField *)self _placeholderLabel];
    double v6 = v5;
    if (v8)
    {
      objc_msgSend(v5, "setTextColor:");
    }
    else
    {
      double v7 = [(UnifiedField *)self _placeholderColor];
      [v6 setTextColor:v7];
    }
  }
}

- (UIColor)placeholderColor
{
  id v2 = [(UnifiedField *)self _placeholderLabel];
  objc_super v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (id)_textWithoutWhitespace
{
  id v2 = [(UnifiedField *)self text];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28B88], "safari_whitespaceAndNewlineCharacterSet");
  id v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (unint64_t)_unifiedFieldInputType
{
  if (self->_topHit)
  {
    objc_opt_class();
    return (objc_opt_isKindOfClass() & 1) == 0;
  }
  else
  {
    objc_super v3 = [(UnifiedField *)self text];
    unint64_t v4 = WBSUnifiedFieldInputTypeForString();

    return v4;
  }
}

- (void)_endEditingWithCurrentText
{
  id v5 = [(UnifiedField *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 unifiedField:self didEndEditingWithParsecTopHit:self->_topHit];
LABEL_3:
    [(UnifiedField *)self setVoiceSearchState:0];
  }
  else
  {
    switch([(UnifiedField *)self _unifiedFieldInputType])
    {
      case 0uLL:
      case 3uLL:
        if (self->_voiceSearchState == 2)
        {
          [v5 unifiedFieldVoiceSearchStateDidChange:self];
        }
        else if (self->_performingExternalSearch)
        {
          [v5 unifiedFieldExternalSearchDidEnd:self];
        }
        else
        {
          objc_super v3 = [(UnifiedField *)self _textWithoutWhitespace];
          [v5 unifiedField:self didEndEditingWithSearch:v3];
LABEL_10:
        }
        break;
      case 1uLL:
      case 2uLL:
        objc_super v3 = [(CompletionItem *)self->_topHit userVisibleURLString];
        if (v3)
        {
          [(UnifiedField *)self setText:v3];
          objc_storeStrong((id *)&self->_userTypedText, v3);
        }
        unint64_t v4 = [(UnifiedField *)self _textWithoutWhitespace];
        [v5 unifiedField:self didEndEditingWithAddress:v4];

        [(UnifiedField *)self setVoiceSearchState:0];
        goto LABEL_10;
      case 4uLL:
        goto LABEL_3;
      default:
        break;
    }
  }
}

- (void)_updateReturnKey
{
  if (![(UnifiedField *)self _waitingForTopHitForCurrentText])
  {
    reflectedItem = self->_reflectedItem;
    if (reflectedItem)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(UnifiedField *)self _textWithoutWhitespace];
      BOOL v4 = [v6 length] != 0;
    }
    id v5 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    [v5 setReturnKeyEnabled:v4];

    if (!reflectedItem)
    {
    }
  }
}

- (void)_textDidChangeFromTyping
{
  if (!self->_isResigningFirstResponder)
  {
    objc_super v3 = [(UnifiedField *)self delegate];
    BOOL v4 = [(UnifiedField *)self text];
    id v5 = (void *)[v4 copy];

    [v3 unifiedField:self willUpdateUserTypedText:self->_userTypedText toText:v5];
    objc_storeStrong((id *)&self->_userTypedText, v5);
    [(UnifiedField *)self _cancelPendingTopHitNavigation];
    if (self->_reflectedItem == self->_topHit)
    {
      id v6 = [(UnifiedField *)self _topHitForCurrentText];
      [(UnifiedField *)self _setTopHit:v6];
    }
    else
    {
      [(UnifiedField *)self setReflectedItem:0];
    }
    [(UnifiedField *)self _updateReturnKey];
    [v3 unifiedFieldDidUpdateUserTypedText:self forQueryString:self->_userTypedText];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__UnifiedField__textDidChangeFromTyping__block_invoke;
    block[3] = &unk_1E6D77E20;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __40__UnifiedField__textDidChangeFromTyping__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1120) = 0;
  return result;
}

- (BOOL)_waitingForTopHitForCurrentText
{
  if (self->_lastEditWasADeletion || ![(UnifiedField *)self _allowsReflectedTopHit]) {
    return 0;
  }
  objc_super v3 = [(UnifiedField *)self delegate];
  BOOL v4 = [(UnifiedField *)self text];
  char v5 = [v3 unifiedField:self shouldWaitForTopHitForText:v4];

  return v5;
}

- (id)_topHitForCurrentText
{
  if (self->_lastEditWasADeletion || ![(UnifiedField *)self _allowsReflectedTopHit])
  {
    char v5 = 0;
  }
  else
  {
    objc_super v3 = [(UnifiedField *)self delegate];
    BOOL v4 = [(UnifiedField *)self text];
    char v5 = [v3 unifiedField:self topHitForText:v4];
  }
  return v5;
}

- (void)_cancelPendingTopHitNavigation
{
  pendingTopHitNavigationText = self->_pendingTopHitNavigationText;
  self->_pendingTopHitNavigationText = 0;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  self->_lastEditWasADeletion = 0;
  if ([v9 isEqualToString:@"\n"]
    && [(UnifiedField *)self _waitingForTopHitForCurrentText])
  {
    v10 = [(UnifiedField *)self text];
    char v11 = [v10 isEqual:self->_pendingTopHitNavigationText];

    if ((v11 & 1) == 0)
    {
      [(UnifiedField *)self sendActionsForControlEvents:0x20000];
      objc_super v12 = [(UnifiedField *)self text];
      objc_super v13 = (NSString *)[v12 copy];
      pendingTopHitNavigationText = self->_pendingTopHitNavigationText;
      self->_pendingTopHitNavigationText = v13;
    }
    BOOL v15 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UnifiedField;
    BOOL v15 = [(UnifiedField *)&v17 keyboardInput:v8 shouldInsertText:v9 isMarkedText:v5];
  }

  return v15;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UnifiedField;
  if (![(UnifiedField *)&v10 keyboardInputShouldDelete:a3]) {
    return 0;
  }
  BOOL v4 = 1;
  if (!self->_lastEditWasADeletion)
  {
    self->_lastEditWasADeletion = 1;
    topHitCompletionView = self->_topHitCompletionView;
    BOOL v4 = topHitCompletionView == 0;
    [(UnifiedField *)self _setTopHit:0];
    if (topHitCompletionView)
    {
      id v6 = [(UnifiedField *)self text];
      double v7 = (NSString *)[v6 copy];
      userTypedText = self->_userTypedText;
      self->_userTypedText = v7;

      if (![(NSString *)self->_userTypedText length]) {
        [(UnifiedField *)self sendActionsForControlEvents:0x20000];
      }
    }
    [(UnifiedField *)self _updateReturnKey];
  }
  return v4;
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v4 setText:a3];
  [(UnifiedField *)self _updateReturnKey];
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v4 setAttributedText:a3];
  [(UnifiedField *)self _updateReturnKey];
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)UnifiedField;
  -[UnifiedField placeholderRectForBounds:](&v20, sel_placeholderRectForBounds_);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMaxX(v21) + -8.0;
  v22.origin.CGFloat x = v8;
  v22.origin.CGFloat y = v10;
  v22.size.CGFloat width = v12;
  v22.size.CGFloat height = v14;
  double v16 = v12 + v15 - CGRectGetMaxX(v22);
  double v17 = v8;
  double v18 = v10;
  double v19 = v14;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)_textForPasteboard
{
  objc_super v3 = [(UnifiedField *)self selectedText];
  if ([(UnifiedField *)self selectionRange]) {
    goto LABEL_4;
  }
  uint64_t v5 = v4;
  if ([(UnifiedField *)self _unifiedFieldInputType] != 2) {
    goto LABEL_4;
  }
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  double v7 = [(UnifiedField *)self text];
  CGFloat v8 = [v6 URLWithString:v7];
  double v9 = [v8 scheme];

  if (v9)
  {
LABEL_4:
    id v10 = v3;
  }
  else
  {
    double v12 = [(UnifiedField *)self text];
    double v13 = [@"http://" stringByAppendingString:v12];

    uint64_t v14 = objc_msgSend(v13, "_web_rangeOfURLHost");
    if (v14 == 0x7FFFFFFFFFFFFFFFLL || v5 + 7 < (unint64_t)(v14 + v15))
    {
      id v16 = v3;
    }
    else
    {
      id v16 = [@"http://" stringByAppendingString:v3];
    }
    id v10 = v16;
  }
  return v10;
}

- (void)copy:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  uint64_t v5 = [(UnifiedField *)self delegate];
  if ([v5 shouldPutMetadataOnPasteboardForUnifiedField:self])
  {
    id v6 = [v5 currentMetadataForUnifiedField:self];
    if (v6) {
      objc_msgSend(v4, "safari_registerLinkMetadata:", v6);
    }
  }
  double v7 = [(UnifiedField *)self _textForPasteboard];
  [v4 registerObject:v7 visibility:0];

  v10[0] = v4;
  CGFloat v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  double v9 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v9 setItemProviders:v8];
}

- (void)cut:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UnifiedField *)self _textForPasteboard];
  v7.receiver = self;
  v7.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v7 cut:v4];

  id v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v6 setString:v5];
}

- (void)_removeTopHitCompletionView
{
  [(TopHitCompletionView *)self->_topHitCompletionView removeFromSuperview];
  topHitCompletionView = self->_topHitCompletionView;
  self->_topHitCompletionView = 0;

  if (self->_topHitCompletionPromotionRecognizer)
  {
    -[UnifiedField removeGestureRecognizer:](self, "removeGestureRecognizer:");
    topHitCompletionPromotionRecognizer = self->_topHitCompletionPromotionRecognizer;
    self->_topHitCompletionPromotionRecognizer = 0;
  }
  uint64_t v5 = [(UnifiedField *)self _fieldEditor];
  [v5 setHidden:0];

  [(UITextCursorAssertion *)self->_textCursorHiddenAssertion invalidate];
  textCursorHiddenAssertion = self->_textCursorHiddenAssertion;
  self->_textCursorHiddenAssertion = 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_topHitCompletionPromotionRecognizer == a3)
  {
    [a4 locationInView:self];
    id v6 = -[UnifiedField hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    objc_opt_class();
    char v4 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v4 = 1;
  }
  return v4 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_topHitCompletionPromotionRecognizer == a3)
  {
    id v5 = a4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v4 = isKindOfClass ^ 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (id)_reflectedItemCompletionString
{
  objc_super v3 = [(CompletionItem *)self->_reflectedItem reflectedStringForUserTypedString:self->_userTypedText];
  if (!v3)
  {
    if (self->_topHitInitiallySelected) {
      objc_super v3 = self->_userTypedText;
    }
    else {
      objc_super v3 = 0;
    }
  }
  uint64_t v4 = [(NSString *)v3 safari_caseAndDiacriticInsensitiveStandardRangeOfString:self->_userTypedText additionalOptions:8];
  uint64_t v6 = v5;
  if (![(NSString *)self->_userTypedText length])
  {
    objc_super v7 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[UnifiedField _reflectedItemCompletionString](v7);
    }
  }
  unint64_t v8 = [(NSString *)v3 length];
  if (v8 < [(NSString *)self->_userTypedText length] || v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v3;
  }
  else
  {
    id v10 = [(NSString *)v3 substringFromIndex:v6];
  }
  double v11 = v10;

  return v11;
}

- (void)_promoteCompletionToSelection
{
}

- (void)_promoteCompletionToSelectionSelectingSuffix:(BOOL)a3 andMoveForward:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v15 = self->_reflectedItem;
  [(UnifiedField *)self _setTopHit:0];
  objc_super v7 = [(CompletionItem *)v15 reflectedStringForUserTypedString:self->_userTypedText];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ![(CompletionItem *)v15 matchLocationIsInURL])
    {
      goto LABEL_14;
    }
    unint64_t v8 = objc_msgSend(v7, "safari_bestURLForUserTypedString");
    double v9 = [v8 path];
    if ([v9 isEqualToString:@"/"])
    {
      char v10 = [v7 hasSuffix:@"/"];

      if (v10)
      {
LABEL_14:
        [(UnifiedField *)self setText:v7];
        goto LABEL_15;
      }
      [v7 stringByAppendingString:@"/"];
      objc_super v7 = v8 = v7;
    }
    else
    {
    }
    goto LABEL_14;
  }
  [(UnifiedField *)self setText:v7];
  double v11 = [(UnifiedField *)self beginningOfDocument];
  double v12 = [(UnifiedField *)self positionFromPosition:v11 inDirection:2 offset:[(NSString *)self->_userTypedText length]];

  double v13 = v12;
  if (v5)
  {
    double v13 = [(UnifiedField *)self endOfDocument];
  }
  uint64_t v14 = [(UnifiedField *)self textRangeFromPosition:v12 toPosition:v13];
  [(UnifiedField *)self setSelectedTextRange:v14];

  if (v5) {
LABEL_15:
  }
}

- (void)_setTopHit:(id)a3
{
  p_topHit = &self->_topHit;
  unint64_t v8 = (CompletionItem *)a3;
  if ([(CompletionItem *)v8 isEquivalentTo:*p_topHit]) {
    char v6 = 1;
  }
  else {
    char v6 = [(CompletionItem *)v8 isEquivalentTo:self->_lastTopHit];
  }
  self->_topHitInitiallySelected = v6;
  objc_storeStrong((id *)&self->_lastTopHit, a3);
  [(UnifiedField *)self _setReflectedItem:v8 updateUserTypedPrefix:0];
  objc_super v7 = v8;
  if (*p_topHit != v8)
  {
    objc_storeStrong((id *)&self->_topHit, a3);
    [(UnifiedField *)self _cancelPendingTopHitNavigation];
    [(UnifiedField *)self _updateReturnKey];
    objc_super v7 = v8;
  }
}

- (void)_restoreUserTypedText
{
  objc_super v3 = [(UnifiedField *)self text];
  char v4 = [v3 isEqualToString:self->_userTypedText];

  if ((v4 & 1) == 0)
  {
    userTypedText = self->_userTypedText;
    [(UnifiedField *)self setText:userTypedText];
  }
}

- (void)setReflectedItem:(id)a3
{
}

- (void)_setReflectedItem:(id)a3 updateUserTypedPrefix:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (CompletionItem *)a3;
  p_reflectedItem = &self->_reflectedItem;
  if (self->_reflectedItem != v6)
  {
    if (![(UnifiedField *)self _allowsReflectedTopHit])
    {

      char v6 = 0;
    }
    objc_storeStrong((id *)&self->_reflectedItem, v6);
    unint64_t v8 = [(UnifiedField *)self delegate];
    [v8 unifiedFieldReflectedItemDidChange:self];

    if (*p_reflectedItem)
    {
      self->_lastEditWasADeletion = 0;
      if (*p_reflectedItem)
      {
        if (!self->_topHitCompletionView)
        {
          double v9 = [TopHitCompletionView alloc];
          char v10 = -[TopHitCompletionView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          topHitCompletionView = self->_topHitCompletionView;
          self->_topHitCompletionView = v10;

          double v12 = [MEMORY[0x1E4FB1618] clearColor];
          [(TopHitCompletionView *)self->_topHitCompletionView setBackgroundColor:v12];

          [(TopHitCompletionView *)self->_topHitCompletionView setContentMode:3];
          double v13 = [(UnifiedField *)self selectionHighlightColor];
          [(TopHitCompletionView *)self->_topHitCompletionView setHighlightColor:v13];
        }
        if (!self->_topHitCompletionPromotionRecognizer)
        {
          uint64_t v14 = [[TopHitCompletionPromotionRecognizer alloc] initWithTarget:self action:sel__promoteCompletionToSelection];
          topHitCompletionPromotionRecognizer = self->_topHitCompletionPromotionRecognizer;
          self->_topHitCompletionPromotionRecognizer = v14;

          [(TopHitCompletionPromotionRecognizer *)self->_topHitCompletionPromotionRecognizer setDelegate:self];
          [(UnifiedField *)self addGestureRecognizer:self->_topHitCompletionPromotionRecognizer];
        }
        id v16 = [(CompletionItem *)*p_reflectedItem reflectedStringForUserTypedString:self->_userTypedText];
        double v17 = v16;
        if (v16 || self->_topHitInitiallySelected)
        {
          uint64_t v18 = objc_msgSend(v16, "safari_caseAndDiacriticInsensitiveStandardRangeOfString:additionalOptions:", self->_userTypedText, 8);
          uint64_t v20 = v19;
          if (![(NSString *)self->_userTypedText length])
          {
            CGRect v21 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[UnifiedField _setReflectedItem:updateUserTypedPrefix:](v21);
            }
          }
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v4) {
              [(UnifiedField *)self setText:&stru_1F3C268E8];
            }
          }
          else
          {
            CGRect v22 = [v17 substringToIndex:v20];
            if (v4)
            {
              v23 = [(UnifiedField *)self text];
              char v24 = [v23 isEqualToString:v22];

              if ((v24 & 1) == 0) {
                [(UnifiedField *)self setText:v22];
              }
            }
            uint64_t v25 = [v17 length];
            if (v25 == [(NSString *)self->_userTypedText length])
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                [(UnifiedField *)self _removeTopHitCompletionView];

                goto LABEL_26;
              }
            }
          }
          v26 = [(UITextCursorAssertionController *)self->_textCursorAssertionController nonVisibleAssertionWithReason:@"UnifiedField is reflecting a Top Hit completion item"];
          textCursorHiddenAssertion = self->_textCursorHiddenAssertion;
          self->_textCursorHiddenAssertion = v26;

          [(UnifiedField *)self addSubview:self->_topHitCompletionView];
          v28 = [(UnifiedField *)self _fieldEditor];
          [v28 setHidden:1];

          [(UnifiedField *)self setNeedsLayout];
        }
        else
        {
          [(UnifiedField *)self _restoreUserTypedText];
          [(UnifiedField *)self _removeTopHitCompletionView];
        }
LABEL_26:

        goto LABEL_27;
      }
    }
    [(UnifiedField *)self _restoreUserTypedText];
    [(UnifiedField *)self _removeTopHitCompletionView];
  }
LABEL_27:
}

- (void)topHitDidBecomeReady
{
  if ([(UnifiedField *)self isFirstResponder]
    && [(UnifiedField *)self _allowsReflectedTopHit])
  {
    char v6 = self->_pendingTopHitNavigationText;
    objc_super v3 = [(UnifiedField *)self _topHitForCurrentText];
    [(UnifiedField *)self _setTopHit:v3];

    if (v6)
    {
      BOOL v4 = [(UnifiedField *)self text];
      if ([(NSString *)v6 isEqualToString:v4])
      {
        BOOL v5 = [(UnifiedField *)self _waitingForTopHitForCurrentText];

        if (!v5) {
          [(UnifiedField *)self _endEditingWithCurrentText];
        }
      }
      else
      {
      }
    }
    [(UnifiedField *)self _updateReturnKey];
  }
}

- (void)_layoutTopHitCompletionView
{
  v60[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UnifiedField *)self _reflectedItemCompletionString];
  if (!v3)
  {
    [(UnifiedField *)self _removeTopHitCompletionView];
    goto LABEL_21;
  }
  uint64_t v4 = *MEMORY[0x1E4FB0700];
  uint64_t v59 = *MEMORY[0x1E4FB0700];
  BOOL v5 = [(UnifiedField *)self textColor];
  v60[0] = v5;
  char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];

  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v3 attributes:v6];
  unint64_t v8 = [(UnifiedField *)self attributedText];
  [v7 insertAttributedString:v8 atIndex:0];
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  char v10 = [(UnifiedField *)self font];
  objc_msgSend(v7, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v7, "length"));

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v55 = v4;
    double v11 = self->_reflectedItem;
    uint64_t v12 = [(CompletionItem *)v11 matchLocation];
    double v13 = [(CompletionItem *)v11 title];
    if (!v13 || (unint64_t)(v12 - 11) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v53 = v6;
      uint64_t v14 = [(CompletionItem *)v11 alternativeDisplayTextForURL];
      uint64_t v15 = [v14 length];

      if (v15)
      {
        uint64_t v16 = [(CompletionItem *)v11 alternativeDisplayTextForURL];
      }
      else
      {
        double v17 = [(CompletionItem *)v11 userVisibleURLString];
        uint64_t v16 = objc_msgSend(v17, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 1, 0);

        double v13 = v17;
      }

      double v13 = (void *)v16;
      char v6 = v53;
    }
    uint64_t v18 = [(CompletionItem *)self->_reflectedItem reflectedStringForUserTypedString:self->_userTypedText];
    if (!v18)
    {
      [(UnifiedField *)self _restoreUserTypedText];
      [(CompletionItem *)v11 userVisibleURLString];
      v54 = v8;
      v20 = uint64_t v19 = v6;
      uint64_t v21 = objc_msgSend(v20, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 1, 0);

      char v6 = v19;
      unint64_t v8 = v54;
      double v13 = (void *)v21;
    }

    uint64_t v4 = v55;
    if (!v13) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v13 = [(CompletionItem *)self->_reflectedItem safari_titleForReflection];
    if (v13)
    {
LABEL_16:
      v57[0] = v9;
      CGRect v22 = [(UnifiedField *)self font];
      v57[1] = v4;
      v58[0] = v22;
      v23 = [(UnifiedField *)self _inheritedInteractionTintColor];
      v58[1] = v23;
      char v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];

      id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
      v26 = [NSString stringWithFormat:@" %C %@", 8212, v13];
      v27 = (void *)[v25 initWithString:v26 attributes:v24];

      [v7 appendAttributedString:v27];
    }
  }
LABEL_17:
  -[TopHitCompletionView setAttributedText:highlightStartIndex:](self->_topHitCompletionView, "setAttributedText:highlightStartIndex:", v7, [v8 length]);
  v28 = CTLineCreateWithAttributedString((CFAttributedStringRef)v7);
  v29 = [(UnifiedField *)self attributedText];
  double v30 = round(CTLineGetOffsetForStringIndex(v28, [v29 length], 0));
  v31 = [(UnifiedField *)self _fieldEditor];
  [v31 bounds];
  double v33 = fmax(v30 - v32, 0.0);

  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v28, 0);
  double width = BoundsWithOptions.size.width;
  CFRelease(v28);
  [(UnifiedField *)self bounds];
  -[UnifiedField editingRectForBounds:](self, "editingRectForBounds:");
  double v36 = v35;
  CGFloat v38 = v37;
  double v40 = v39;
  CGFloat v42 = v41;
  [(UnifiedField *)self paddingLeft];
  CGFloat v44 = v36 + v43;
  [(UnifiedField *)self paddingLeft];
  float v46 = v45;
  [(UnifiedField *)self paddingRight];
  v62.size.double width = v40 - (float)(v46 + v47);
  double v48 = v44 - v33;
  double v49 = width + 3.0;
  v62.origin.CGFloat x = v44;
  v62.origin.CGFloat y = v38;
  v62.size.CGFloat height = v42;
  double MaxX = CGRectGetMaxX(v62);
  v63.origin.CGFloat x = v48;
  v63.origin.CGFloat y = v38;
  v63.size.double width = v49;
  v63.size.CGFloat height = v42;
  CGFloat v51 = CGRectGetMaxX(v63);
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __43__UnifiedField__layoutTopHitCompletionView__block_invoke;
  v56[3] = &unk_1E6D7BCB8;
  v56[4] = self;
  if (v51 <= MaxX) {
    double v52 = v49;
  }
  else {
    double v52 = MaxX - v48;
  }
  *(double *)&v56[5] = v48;
  *(CGFloat *)&v56[6] = v38;
  *(double *)&v56[7] = v52;
  *(CGFloat *)&v56[8] = v42;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v56];

LABEL_21:
}

uint64_t __43__UnifiedField__layoutTopHitCompletionView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1064), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (double)placeholderHorizontalInset
{
  return 2.0;
}

- (CGRect)editRect
{
  v16.receiver = self;
  v16.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v16 editRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(TopHitCompletionView *)self->_topHitCompletionView superview];

  if (v11) {
    double v12 = v8 + -30.0;
  }
  else {
    double v12 = v8;
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.double width = v12;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v8 layoutSubviews];
  double v3 = [(UnifiedField *)self _placeholderLabel];
  [v3 frame];
  [v3 setFrame:v4 + 2.0];
  if (!self->_userTypedText)
  {
    double v5 = [(UnifiedField *)self text];
    double v6 = (NSString *)[v5 copy];
    userTypedText = self->_userTypedText;
    self->_userTypedText = v6;
  }
  if (self->_topHitCompletionView) {
    [(UnifiedField *)self _layoutTopHitCompletionView];
  }
}

- (BOOL)canBecomeFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)UnifiedField;
  if (![(UnifiedField *)&v6 canBecomeFirstResponder]) {
    return 0;
  }
  double v3 = [(UnifiedField *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 unifiedFieldCanBecomeFirstResponder:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)resignFirstResponder
{
  self->_isResigningFirstResponder = 1;
  [(UnifiedField *)self _setTopHit:0];
  [(UnifiedField *)self _cancelPendingTopHitNavigation];
  self->_usingPencilInput = 0;
  double v3 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_INFO, "Resigning first responder; allows reflected Top Hits: YES",
      buf,
      2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)UnifiedField;
  unsigned int v4 = [(UnifiedField *)&v9 resignFirstResponder];
  BOOL v5 = v4;
  self->_isResigningFirstResponder = 0;
  if (self->_preserveSelectionOnResignFirstResponder && v4 != 0)
  {
    double v7 = [(UnifiedField *)self interactionAssistant];
    [v7 activateSelection];
  }
  return v5;
}

- (BOOL)becomeFirstResponder
{
  v8.receiver = self;
  v8.super_class = (Class)UnifiedField;
  BOOL v3 = [(UnifiedField *)&v8 becomeFirstResponder];
  if (v3)
  {
    [(UnifiedField *)self _updateReturnKey];
    self->_hasSelectedQuerySuggestion = 0;
    self->_usingPencilInput = 0;
    unsigned int v4 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_INFO, "Becoming first responder; allows reflected Top Hits: YES",
        v7,
        2u);
    }
    BOOL v5 = [(UnifiedField *)self delegate];
    [v5 unifiedFieldMakeWindowKey:self];
  }
  return v3;
}

- (BOOL)endEditing:(BOOL)a3
{
  BOOL preserveSelectionOnResignFirstResponder = self->_preserveSelectionOnResignFirstResponder;
  self->_BOOL preserveSelectionOnResignFirstResponder = 0;
  v6.receiver = self;
  v6.super_class = (Class)UnifiedField;
  BOOL result = [(UnifiedField *)&v6 endEditing:a3];
  self->_BOOL preserveSelectionOnResignFirstResponder = preserveSelectionOnResignFirstResponder;
  return result;
}

- (void)focusAndInsertCursorAtEnd
{
  [(UnifiedField *)self becomeFirstResponder];
  id v5 = [(UnifiedField *)self endOfDocument];
  BOOL v3 = [(UnifiedField *)self endOfDocument];
  unsigned int v4 = [(UnifiedField *)self textRangeFromPosition:v5 toPosition:v3];
  [(UnifiedField *)self setSelectedTextRange:v4];
}

- (void)clearUserTypedText
{
  BOOL v3 = [(UnifiedField *)self delegate];
  [v3 unifiedField:self willUpdateUserTypedText:self->_userTypedText toText:0];

  userTypedText = self->_userTypedText;
  self->_userTypedText = 0;
}

- (id)keyCommands
{
  v42[8] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)keyCommands_commands;
  if (!keyCommands_commands)
  {
    BOOL v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B90] modifierFlags:0 action:sel_moveRightKeyPressed];
    v42[0] = v3;
    unsigned int v4 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B78] modifierFlags:0 action:sel_moveLeftKeyPressed];
    v42[1] = v4;
    uint64_t v5 = *MEMORY[0x1E4FB2AF8];
    objc_super v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2AF8] modifierFlags:0 action:sel_nextCompletionSelectionByRowKeyPressed];
    v42[2] = v6;
    double v7 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v5 modifierFlags:0x100000 action:sel_nextCompletionSelectionBySectionKeyPressed];
    v42[3] = v7;
    uint64_t v8 = *MEMORY[0x1E4FB2B98];
    objc_super v9 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B98] modifierFlags:0 action:sel_previousCompletionSelectionByRowKeyPressed];
    v42[4] = v9;
    double v10 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v8 modifierFlags:0x100000 action:sel_previousCompletionSelectionBySectionKeyPressed];
    v42[5] = v10;
    double v11 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\t" modifierFlags:0 action:sel_focusNextKeyViewKeyPressed];
    v42[6] = v11;
    double v12 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\t" modifierFlags:0x20000 action:sel_focusPreviousKeyViewKeyPressed];
    v42[7] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
    double v14 = (void *)keyCommands_commands;
    keyCommands_commands = v13;

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = (id)keyCommands_commands;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v37;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * v19++) setWantsPriorityOverSystemBehavior:1];
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v17);
    }

    uint64_t v20 = [(UnifiedField *)self _allCombinationsOfModifierKeys];
    uint64_t v21 = objc_msgSend(v20, "safari_arrayByMappingObjectsUsingBlock:", &__block_literal_global_166);

    uint64_t v22 = [(id)keyCommands_commands arrayByAddingObjectsFromArray:v21];
    v23 = (void *)keyCommands_commands;
    keyCommands_commands = v22;

    id v2 = (void *)keyCommands_commands;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v24 = v2;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * v28++) setWantsPriorityOverSystemBehavior:1];
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v26);
  }

  v29 = (void *)keyCommands_commands;
  return v29;
}

uint64_t __27__UnifiedField_keyCommands__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB18D0];
  uint64_t v3 = [a2 integerValue];
  return [v2 keyCommandWithInput:@"\r" modifierFlags:v3 action:sel_selectCompletionKeyPressed];
}

- (id)_allCombinationsOfModifierKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3C73ED8];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (NSSelectorFromString((NSString *)@"_define:") == a3
    || NSSelectorFromString((NSString *)@"_share:") == a3)
  {
    goto LABEL_23;
  }
  if (sel_pasteAndGo_ == a3 || sel_pasteAndSearch_ == a3)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    char v9 = objc_msgSend(v8, "safari_canPasteAndNavigate");
    goto LABEL_9;
  }
  if (sel_moveRightKeyPressed == a3 || sel_moveLeftKeyPressed == a3)
  {
    if (([(UnifiedField *)self hasMarkedText] & 1) == 0)
    {
      LOBYTE(self) = self->_topHitCompletionView != 0;
      goto LABEL_24;
    }
LABEL_23:
    LOBYTE(self) = 0;
    goto LABEL_24;
  }
  if (sel_nextCompletionSelectionByRowKeyPressed == a3
    || sel_nextCompletionSelectionBySectionKeyPressed == a3
    || sel_previousCompletionSelectionByRowKeyPressed == a3
    || sel_previousCompletionSelectionBySectionKeyPressed == a3)
  {
    if ([(UnifiedField *)self hasMarkedText]) {
      goto LABEL_23;
    }
    uint64_t v8 = [(UnifiedField *)self delegate];
    char v9 = [v8 unifiedFieldShouldMoveCompletionSelection:self];
LABEL_9:
    LOBYTE(self) = v9;

    goto LABEL_24;
  }
  if (sel_focusNextKeyViewKeyPressed == a3
    || sel_focusPreviousKeyViewKeyPressed == a3
    || sel_selectCompletionKeyPressed == a3)
  {
    LODWORD(self) = [(UnifiedField *)self hasMarkedText] ^ 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UnifiedField;
    LOBYTE(self) = [(UnifiedField *)&v11 canPerformAction:a3 withSender:v6];
  }
LABEL_24:

  return (char)self;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UnifiedField *)self traitCollection];
  id v6 = [v4 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v5];

  v7.receiver = self;
  v7.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v7 setFont:v6];
}

- (void)moveRightKeyPressed
{
  if (self->_topHitCompletionView) {
    [(UnifiedField *)self _promoteCompletionToSelectionSelectingSuffix:0 andMoveForward:1];
  }
}

- (void)moveLeftKeyPressed
{
  if (self->_topHitCompletionView) {
    [(UnifiedField *)self _promoteCompletionToSelectionSelectingSuffix:0 andMoveForward:0];
  }
}

- (void)nextCompletionSelectionByRowKeyPressed
{
  id v3 = [(UnifiedField *)self delegate];
  [v3 unifiedField:self moveCompletionSelectionByRowOffset:1];
}

- (void)nextCompletionSelectionBySectionKeyPressed
{
  id v3 = [(UnifiedField *)self delegate];
  [v3 unifiedField:self moveCompletionSelectionBySectionOffset:1];
}

- (void)previousCompletionSelectionByRowKeyPressed
{
  id v3 = [(UnifiedField *)self delegate];
  [v3 unifiedField:self moveCompletionSelectionByRowOffset:-1];
}

- (void)previousCompletionSelectionBySectionKeyPressed
{
  id v3 = [(UnifiedField *)self delegate];
  [v3 unifiedField:self moveCompletionSelectionBySectionOffset:-1];
}

- (void)focusNextKeyViewKeyPressed
{
  id v3 = [(UnifiedField *)self delegate];
  [v3 unifiedField:self focusNextKeyView:1];
}

- (void)focusPreviousKeyViewKeyPressed
{
  id v3 = [(UnifiedField *)self delegate];
  [v3 unifiedField:self focusNextKeyView:0];
}

- (void)selectCompletionKeyPressed
{
  id v3 = [(UnifiedField *)self delegate];
  [v3 unifiedFieldSelectCompletionItemIfAvailable:self];
}

- (void)insertTextSuggestion:(id)a3
{
  id v4 = a3;
  querySuggestions = self->_querySuggestions;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __37__UnifiedField_insertTextSuggestion___block_invoke;
  v10[3] = &unk_1E6D7BD00;
  id v11 = v4;
  id v6 = v4;
  objc_super v7 = [(NSArray *)querySuggestions safari_firstObjectPassingTest:v10];
  [(CKContextCompleter *)self->_contextCompleter logEngagement:v7 forInput:self->_userTypedText];
  uint64_t v8 = [(UnifiedField *)self delegate];
  [v8 unifiedField:self didEngageWithQuerySuggestion:v7 forQueryString:self->_userTypedText];

  char v9 = [v6 inputText];
  [(UnifiedField *)self setText:v9];

  self->_lastInputWasQuerySuggestion = 1;
  self->_hasSelectedQuerySuggestion = 1;
  [(UnifiedField *)self sendActionsForControlEvents:0x20000];
  self->_lastInputWasQuerySuggestion = 0;
}

uint64_t __37__UnifiedField_insertTextSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 title];
  id v4 = [*(id *)(a1 + 32) inputText];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  if (self->_reflectedItem) {
    [(UnifiedField *)self _promoteCompletionToSelection];
  }
  v5.receiver = self;
  v5.super_class = (Class)UnifiedField;
  [(UnifiedField *)&v5 selectAll:v4];
}

- (void)setContextCompleter:(id)a3
{
}

- (void)setVoiceSearchState:(int64_t)a3
{
  if (self->_voiceSearchState != a3)
  {
    self->_voiceSearchState = a3;
    id v7 = [MEMORY[0x1E4FB1910] sharedInputModeController];
    if (a3 == 1)
    {
      [(UnifiedField *)self setText:0];
      objc_super v5 = [(UnifiedField *)self _voiceSearchInputModeForFirstResponder:[(UnifiedField *)self isFirstResponder]];
      [v7 toggleDictationForResponder:self withOption:v5 firstResponderSetupCompletion:0];
    }
    else if (!a3)
    {
      [v7 stopDictation];
    }
    id v6 = [(UnifiedField *)self delegate];
    [v6 unifiedFieldVoiceSearchStateDidChange:self];
  }
}

- (void)completeDictation
{
  if (self->_voiceSearchState == 1)
  {
    self->_voiceSearchState = 2;
    [(UnifiedField *)self _endEditingWithCurrentText];
  }
}

- (void)dictationRecordingDidEnd
{
}

- (void)dictationRecognitionFailed
{
}

- (id)_voiceSearchInputModeForFirstResponder:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FB16D8]);
  objc_super v5 = v4;
  if (v3) {
    id v6 = @"UIDictationInputModeInvocationSourceMicButtonInFirstResponderSafariAddressBar";
  }
  else {
    id v6 = @"UIDictationInputModeInvocationSourceMicButtonInSafariAddressBar";
  }
  [v4 setInvocationSource:v6];
  [v5 setShouldStayInDictationInputModeIfAutoEndpointed:0];
  [v5 setShouldSupressShowingAlternativesAutomatically:1];
  return v5;
}

- (BOOL)_allowsReflectedTopHit
{
  return !self->_usingPencilInput && self->_voiceSearchState == 0;
}

- (void)willBeginPencilTextInputEditing
{
  self->_usingPencilInput = 1;
  BOOL v3 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_INFO, "Beginning Pencil text input; allows reflected Top Hits: NO",
      v4,
      2u);
  }
  [(UnifiedField *)self _removeTopHitCompletionView];
  [(UnifiedField *)self _cancelPendingTopHitNavigation];
}

- (CompletionItem)reflectedItem
{
  return self->_reflectedItem;
}

- (BOOL)isPastingText
{
  return self->_pastingText;
}

- (BOOL)isUsingPencilInput
{
  return self->_usingPencilInput;
}

- (BOOL)performingExternalSearch
{
  return self->_performingExternalSearch;
}

- (void)setPerformingExternalSearch:(BOOL)a3
{
  self->_performingExternalSearch = a3;
}

- (NSArray)querySuggestions
{
  return self->_querySuggestions;
}

- (BOOL)lastInputWasQuerySuggestion
{
  return self->_lastInputWasQuerySuggestion;
}

- (BOOL)hasSelectedQuerySuggestion
{
  return self->_hasSelectedQuerySuggestion;
}

- (CKContextCompleter)contextCompleter
{
  return self->_contextCompleter;
}

- (int64_t)voiceSearchState
{
  return self->_voiceSearchState;
}

- (BOOL)lastEditWasADeletion
{
  return self->_lastEditWasADeletion;
}

- (void)setLastEditWasADeletion:(BOOL)a3
{
  self->_lastEditWasADeletion = a3;
}

- (BOOL)isResigningFirstResponder
{
  return self->_isResigningFirstResponder;
}

- (void)setIsResigningFirstResponder:(BOOL)a3
{
  self->_isResigningFirstResponder = a3;
}

- (BOOL)preserveSelectionOnResignFirstResponder
{
  return self->_preserveSelectionOnResignFirstResponder;
}

- (void)setPreserveSelectionOnResignFirstResponder:(BOOL)a3
{
  self->_BOOL preserveSelectionOnResignFirstResponder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextCompleter, 0);
  objc_storeStrong((id *)&self->_querySuggestions, 0);
  objc_storeStrong((id *)&self->_reflectedItem, 0);
  objc_storeStrong((id *)&self->_lastTopHit, 0);
  objc_storeStrong((id *)&self->_textCursorHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_textCursorAssertionController, 0);
  objc_storeStrong((id *)&self->_userTypedText, 0);
  objc_storeStrong((id *)&self->_topHitCompletionPromotionRecognizer, 0);
  objc_storeStrong((id *)&self->_topHitCompletionView, 0);
  objc_storeStrong((id *)&self->_topHit, 0);
  objc_storeStrong((id *)&self->_pendingTopHitNavigationText, 0);
}

- (void)_reflectedItemCompletionString
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "User typed string is nil when getting completion string for reflected completion item", v1, 2u);
}

- (void)_setReflectedItem:(os_log_t)log updateUserTypedPrefix:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "User typed string is nil with non-nil reflected completion item", v1, 2u);
}

@end