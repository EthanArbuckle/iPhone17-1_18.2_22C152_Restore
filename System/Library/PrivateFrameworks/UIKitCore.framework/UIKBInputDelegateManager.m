@interface UIKBInputDelegateManager
+ (BOOL)isAsyncTextInputEnabled;
+ (_NSRange)rangeForTextRange:(id)a3 document:(id)a4;
- (BOOL)_deleteForwardAndNotify:(BOOL)a3;
- (BOOL)_hasMarkedText;
- (BOOL)_selectionAtDocumentStart;
- (BOOL)callKeyboardWillDismiss;
- (BOOL)callShouldDeleteBackwardWithCount:(unint64_t)a3;
- (BOOL)callShouldReplaceExtendedRange:(int64_t)a3 withText:(id)a4 includeMarkedText:(BOOL)a5;
- (BOOL)canHandleInputDelegateCommandAction:(unint64_t)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)continuousSpellCheckingEnabled;
- (BOOL)delegateAdoptsWebTextInputPrivate;
- (BOOL)delegateRespondsToSelector:(SEL)a3;
- (BOOL)hasAsyncCapableInputDelegate;
- (BOOL)hasMarkedText;
- (BOOL)hasText;
- (BOOL)insertSupplementalItem:(id)a3 candidate:(id)a4 replacementRange:(id)a5;
- (BOOL)insertTextSuggestion:(id)a3;
- (BOOL)insideKeyInputDelegateCall;
- (BOOL)requiresKeyEvents;
- (BOOL)selectionIsEndOfWord;
- (BOOL)selectionIsWord;
- (BOOL)shouldDeleteForward;
- (BOOL)shouldRespectForwardingInputDelegate;
- (BOOL)shouldSuppressUpdateCandidateView;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)selectionClipRect;
- (CGRect)textFirstRect;
- (CGRect)textLastRect;
- (CGRect)visibleTextRect;
- (SEL)selectorForCommand:(unint64_t)a3;
- (UIAsyncTextInputClient)asyncInputDelegate;
- (UIKBInputDelegateManager)init;
- (UIKeyInput)forwardingInputDelegate;
- (UIKeyInput)keyInputDelegate;
- (UIKeyboardImplStateProtocol)keyboardStateDelegate;
- (UIKeyboardInput)legacyInputDelegate;
- (UITextInputTraits)textInputTraits;
- (UITextInteractionAssistant)textInteractionAssistant;
- (UITextInteractionSelectableInputDelegate)selectableDelegate;
- (UITextSelectionDisplayInteraction)selectionDisplayInteraction;
- (UIView)automaticallySelectedOverlay;
- (id)__content;
- (id)_moveDown:(BOOL)a3 withHistory:(id)a4;
- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4;
- (id)_moveRight:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4;
- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4;
- (id)_moveUp:(BOOL)a3 withHistory:(id)a4;
- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4;
- (id)_textRangeFromNSRange:(_NSRange)a3;
- (id)_textSelectingContainer;
- (id)asyncCapableInputDelegate;
- (id)asyncWebKitInteractionDelegate;
- (id)attributedMarkedText;
- (id)beginningOfDocument;
- (id)delegateAsResponder;
- (id)delegateRespectingForwardingDelegate:(BOOL)a3;
- (id)endOfDocument;
- (id)inputSystemSourceSession;
- (id)markedText;
- (id)markedTextRange;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)privateInputDelegate;
- (id)privateInputDelegateRespectingForwardingDelegate:(BOOL)a3;
- (id)privateKeyInputDelegate;
- (id)selectedText;
- (id)selectedTextRange;
- (id)selectionRectsForRange:(id)a3;
- (id)textInRange:(id)a3;
- (id)textInputDelegate;
- (id)textInputView;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)tintColor;
- (id)webInputDelegate;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete;
- (unint64_t)delegateConformanceType;
- (unsigned)_characterBeforeCaretSelection;
- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4;
- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4 overrideOriginalContextBeforeInputWith:(id)a5;
- (void)_deleteBackwardWhileOverridingContextAndNotifyAtEnd:(BOOL)a3 deletionCount:(unint64_t)a4 reinsertTextInLoop:(BOOL)a5;
- (void)_deleteByWord;
- (void)_deleteForwardByWord;
- (void)_deleteToEndOfLine;
- (void)_deleteToEndOfParagraph;
- (void)_deleteToStartOfLine;
- (void)_firstResponderDidChange:(id)a3;
- (void)_moveCurrentSelection:(int)a3;
- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)_setSelectionToPosition:(id)a3;
- (void)addTextAlternatives:(id)a3;
- (void)adjustSelection:(id)a3 completionHandler:(id)a4;
- (void)applyAutocorrection:(id)a3 toString:(id)a4 shouldUnderline:(BOOL)a5 withCompletionHandler:(id)a6;
- (void)applyAutocorrection:(id)a3 toString:(id)a4 withCompletionHandler:(id)a5;
- (void)changedSelection;
- (void)clearDelegate;
- (void)clearForwardingInputDelegateAndResign:(BOOL)a3;
- (void)collapseSelectionAndAdjustByOffset:(int64_t)a3;
- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4;
- (void)deleteBackward;
- (void)handleClearWithInsertBeforeAdvance:(id)a3;
- (void)handleKeyWebEvent:(id)a3;
- (void)handleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4;
- (void)insertAttributedText:(id)a3;
- (void)insertDictationResult:(id)a3;
- (void)insertText:(id)a3;
- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5;
- (void)insertText:(id)a3 updateInputSource:(BOOL)a4;
- (void)insertTextAfterSelection:(id)a3;
- (void)moveSelectionToEndOfWord;
- (void)replaceRange:(id)a3 oldText:(id)a4 withAttributedText:(id)a5 forReplaceAction:(int)a6;
- (void)replaceRange:(id)a3 oldText:(id)a4 withText:(id)a5 forReplaceAction:(int)a6;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)replaceSelectionOffset:(int64_t)a3 length:(unint64_t)a4 withAnnotatedString:(id)a5 relativeReplacementRange:(_NSRange)a6;
- (void)requestDocumentContext:(id)a3 completionHandler:(id)a4;
- (void)requestTextContextForAutocorrectionWithCompletionHandler:(id)a3;
- (void)requestTextRectsForString:(id)a3 withCompletionHandler:(id)a4;
- (void)setAsyncInputDelegate:(id)a3;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4;
- (void)setContinuousSpellCheckingEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForwardingInputDelegate:(id)a3;
- (void)setInsideKeyInputDelegateCall:(BOOL)a3;
- (void)setKeyInputDelegate:(id)a3;
- (void)setKeyboardStateDelegate:(id)a3;
- (void)setSelectableDelegate:(id)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)setShouldRespectForwardingInputDelegate:(BOOL)a3;
- (void)setupResponderChangeListeners;
- (void)shiftKeyStateChangedFrom:(int)a3 to:(int)a4;
- (void)storeDelegateConformance;
- (void)transposeCharacters;
- (void)unmarkText;
- (void)unmarkText:(id)a3;
- (void)updateRespectForwardingInputDelegateFlagInDestination;
- (void)updateSelectableInputDelegateIfNecessary;
@end

@implementation UIKBInputDelegateManager

- (void)setContinuousSpellCheckingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UIKBInputDelegateManager *)self keyInputDelegate];
    [v7 setContinuousSpellCheckingEnabled:v3];
  }
}

- (void)clearForwardingInputDelegateAndResign:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(UIKBInputDelegateManager *)self forwardingInputDelegate];

  if (v5)
  {
    if (v3)
    {
      char v6 = [(UIKBInputDelegateManager *)self forwardingInputDelegate];
      [v6 resignFirstResponder];
    }
    [(UIKBInputDelegateManager *)self setForwardingInputDelegate:0];
    self->m_originalDelegateConformanceType = 0;
  }
}

- (BOOL)_hasMarkedText
{
  BOOL v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_7:
    id v7 = v4;
    char v8 = [v4 hasMarkedText];
    goto LABEL_8;
  }
  v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v5)
  {
    v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_7;
  }
  char v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

  if (v6)
  {
    v4 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    goto LABEL_7;
  }
  v10 = [(UIKBInputDelegateManager *)self textInputDelegate];
  id v7 = [v10 markedTextRange];

  if (v7)
  {
    v11 = [(UIKBInputDelegateManager *)self textInputDelegate];
    v12 = [v11 textInRange:v7];
    char v8 = [v12 length] != 0;
  }
  else
  {
    char v8 = 0;
  }
LABEL_8:

  return v8;
}

- (void)_firstResponderDidChange:(id)a3
{
  id v7 = a3;
  v4 = [v7 object];
  if ([v4 _isApplicationKeyWindow])
  {
    self->m_firstResponderAdoptsTextInput = 0;
    v5 = [v7 userInfo];
    char v6 = [v5 objectForKey:@"UIWindowFirstResponderUserInfoKey"];

    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v6 conformsToProtocol:&unk_1ED42F658])
    {
      self->m_firstResponderAdoptsTextInput = 1;
    }
  }
}

- (id)delegateAsResponder
{
  BOOL v3 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 window],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 screen],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 _userInterfaceIdiom],
        v5,
        v4,
        v6 == 3))
  {
    id v7 = v3;
  }
  else
  {
    char v8 = [(id)UIApp keyWindow];
    id v7 = [v8 firstResponder];
    v9 = [(UIKBInputDelegateManager *)self forwardingInputDelegate];

    if (v9)
    {
      uint64_t v10 = [(UIKBInputDelegateManager *)self forwardingInputDelegate];

      id v7 = (id)v10;
    }
    if (v7) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v3 == 0;
    }
    if (!v11) {
      id v7 = v3;
    }
  }
  return v7;
}

- (UIKeyInput)keyInputDelegate
{
  return (UIKeyInput *)[(UIKBInputDelegateManager *)self delegateRespectingForwardingDelegate:1];
}

- (UIKeyInput)forwardingInputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
  return (UIKeyInput *)WeakRetained;
}

- (id)asyncCapableInputDelegate
{
  BOOL v3 = [(UIKBInputDelegateManager *)self webInputDelegate];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    }
    id v5 = v8;
  }
  return v5;
}

- (id)webInputDelegate
{
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_7; {
  if ([(UIKBInputDelegateManager *)self shouldRespectForwardingInputDelegate])
  }
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);

    if (WeakRetained)
    {
      if (self->_forwardingInputDelegateConformsToBETextInput)
      {
        v4 = (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
  if ((self->m_delegateConformanceType & 0x800) == 0)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_9;
  }
  v4 = self->_keyInputDelegate;
LABEL_9:
  return v4;
}

- (id)asyncWebKitInteractionDelegate
{
  if ([(UIKBInputDelegateManager *)self shouldRespectForwardingInputDelegate])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);

    if (WeakRetained)
    {
      if (self->_forwardingInputDelegateConformsToWKInteraction)
      {
        v4 = (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
        goto LABEL_8;
      }
      goto LABEL_6;
    }
  }
  if ((self->m_delegateConformanceType & 8) == 0)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = self->_keyInputDelegate;
LABEL_8:
  return v4;
}

- (UIAsyncTextInputClient)asyncInputDelegate
{
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled])goto LABEL_7; {
  if ([(UIKBInputDelegateManager *)self shouldRespectForwardingInputDelegate])
  }
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);

    if (WeakRetained)
    {
      if (self->_forwardingInputDelegateConformsToAsyncTextInputClient)
      {
        v4 = (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
  if ((self->m_delegateConformanceType & 0x400) == 0)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_9;
  }
  v4 = self->_keyInputDelegate;
LABEL_9:
  return v4;
}

+ (BOOL)isAsyncTextInputEnabled
{
  if (qword_1EB260808 != -1) {
    dispatch_once(&qword_1EB260808, &__block_literal_global_226);
  }
  if (qword_1EB260800) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = _MergedGlobals_1054 == 0;
  }
  if (!v2 && (qword_1EB260800 != 1 || _MergedGlobals_1054 != 0)) {
    return 0;
  }
  return _os_feature_enabled_impl();
}

- (id)delegateRespectingForwardingDelegate:(BOOL)a3
{
  if (a3
    && [(UIKBInputDelegateManager *)self shouldRespectForwardingInputDelegate])
  {
    id WeakRetained = (UIKeyInput *)objc_loadWeakRetained((id *)&self->_forwardingInputDelegate);
  }
  else
  {
    id WeakRetained = self->_keyInputDelegate;
  }
  return WeakRetained;
}

- (BOOL)shouldRespectForwardingInputDelegate
{
  return self->_shouldRespectForwardingInputDelegate;
}

- (BOOL)hasAsyncCapableInputDelegate
{
  BOOL v2 = [(UIKBInputDelegateManager *)self asyncCapableInputDelegate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (UITextInteractionAssistant)textInteractionAssistant
{
  BOOL v3 = [(UIKBInputDelegateManager *)self privateInputDelegate];

  if (v3) {
    [(UIKBInputDelegateManager *)self privateInputDelegate];
  }
  else {
  v4 = [(UIKBInputDelegateManager *)self textInputDelegate];
  }
  id v5 = [v4 interactionAssistant];

  return (UITextInteractionAssistant *)v5;
}

- (id)privateInputDelegate
{
  if ((self->m_delegateConformanceType & 4) != 0)
  {
    BOOL v2 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (id)textInputDelegate
{
  if ((self->m_delegateConformanceType & 2) != 0)
  {
    BOOL v2 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (id)endOfDocument
{
  BOOL v2 = [(UIKBInputDelegateManager *)self textInputDelegate];
  BOOL v3 = [v2 endOfDocument];

  return v3;
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIKBInputDelegateManager *)self textInputDelegate];
  int64_t v9 = [v8 comparePosition:v7 toPosition:v6];

  return v9;
}

- (id)beginningOfDocument
{
  BOOL v2 = [(UIKBInputDelegateManager *)self textInputDelegate];
  BOOL v3 = [v2 beginningOfDocument];

  return v3;
}

- (UITextInputTraits)textInputTraits
{
  uint64_t v3 = +[UIKeyboard usesInputSystemUI] ^ 1;
  v4 = [(UIKBInputDelegateManager *)self privateInputDelegateRespectingForwardingDelegate:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 textInputTraits];
    id v7 = +[UITextInputTraits traitsByAdoptingTraits:v6];

    if ([v5 conformsToProtocol:&unk_1ED42EE38])
    {
      id v8 = +[UITextInputTraits traitsByAdoptingTraits:v5];
      [v7 overrideWithTraits:v8];
    }
  }
  else
  {
    id v7 = 0;
  }
  int64_t v9 = [(UIKBInputDelegateManager *)self delegateRespectingForwardingDelegate:v3];
  if (v9)
  {
    uint64_t v10 = +[UITextInputTraits traitsByAdoptingTraits:v9];
    BOOL v11 = (void *)v10;
    if (v7)
    {
      [v7 overrideWithTraits:v10];
    }
    else
    {
      id v7 = (void *)v10;
    }
  }

  return (UITextInputTraits *)v7;
}

- (id)privateInputDelegateRespectingForwardingDelegate:(BOOL)a3
{
  if ((self->m_delegateConformanceType & 4) != 0)
  {
    uint64_t v3 = [(UIKBInputDelegateManager *)self delegateRespectingForwardingDelegate:a3];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)textInputView
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v5)
    {
      v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      id v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v6) {
        [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      }
      else {
      v4 = [(UIKBInputDelegateManager *)self textInputDelegate];
      }
    }
  }
  id v7 = v4;
  id v8 = [v4 textInputView];

  return v8;
}

- (void)setShouldRespectForwardingInputDelegate:(BOOL)a3
{
  self->_shouldRespectForwardingInputDelegate = a3;
}

- (void)updateSelectableInputDelegateIfNecessary
{
  self->m_firstResponderAdoptsTextInput = 0;
  uint64_t v3 = +[UIWindow _applicationKeyWindow];
  id v4 = [v3 firstResponder];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 conformsToProtocol:&unk_1ED42F658]) {
    self->m_firstResponderAdoptsTextInput = 1;
  }
}

void __51__UIKBInputDelegateManager_isAsyncTextInputEnabled__block_invoke()
{
  qword_1EB260800 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  _MergedGlobals_1054 = [v0 isEqualToString:@"com.apple.iBooks"];
}

- (UIKBInputDelegateManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIKBInputDelegateManager;
  return [(UIKBInputDelegateManager *)&v3 init];
}

- (void)setupResponderChangeListeners
{
  [(UIKBInputDelegateManager *)self updateSelectableInputDelegateIfNecessary];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel_updateSelectableInputDelegateIfNecessary name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
}

- (void)setDelegate:(id)a3
{
  id v12 = a3;
  selectableDelegate = self->_selectableDelegate;
  self->_selectableDelegate = 0;

  objc_storeStrong((id *)&self->_keyInputDelegate, a3);
  [(UIKBInputDelegateManager *)self storeDelegateConformance];
  id v6 = [(UIKBInputDelegateManager *)self textInputDelegate];
  id v7 = [v6 interactionAssistant];

  id v8 = [v7 externalInteractions];

  if (v8)
  {
    int64_t v9 = [(UIKBInputDelegateManager *)self textInputDelegate];
    uint64_t v10 = +[UITextInteractionSelectableInputDelegate selectableInputDelegateWithTextInput:v9];
    BOOL v11 = self->_selectableDelegate;
    self->_selectableDelegate = v10;
  }
  [(UIKBInputDelegateManager *)self setShouldRespectForwardingInputDelegate:0];
}

- (void)clearDelegate
{
  [(UIKBInputDelegateManager *)self setSelectableDelegate:0];
  keyInputDelegate = self->_keyInputDelegate;
  self->_keyInputDelegate = 0;

  self->m_originalDelegateConformanceType = 0;
  id v4 = [(UIKBInputDelegateManager *)self forwardingInputDelegate];

  if (v4)
  {
    id v5 = [(UIKBInputDelegateManager *)self forwardingInputDelegate];
    [v5 resignFirstResponder];

    [(UIKBInputDelegateManager *)self setForwardingInputDelegate:0];
  }
}

- (void)setForwardingInputDelegate:(id)a3
{
  p_forwardingInputDelegate = &self->_forwardingInputDelegate;
  id v10 = a3;
  id v5 = objc_storeWeak((id *)p_forwardingInputDelegate, v10);
  char v6 = [v10 conformsToProtocol:&unk_1ED700D60];

  self->_forwardingInputDelegateConformsToWKInteraction = v6;
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_forwardingInputDelegate);
    self->_forwardingInputDelegateConformsToAsyncTextInputClient = [WeakRetained conformsToProtocol:&unk_1ED700940];

    id v8 = objc_loadWeakRetained((id *)p_forwardingInputDelegate);
    self->_forwardingInputDelegateConformsToBETextInput = [v8 conformsToProtocol:&unk_1ED7009A0];
  }
  [(UIKBInputDelegateManager *)self setShouldRespectForwardingInputDelegate:v10 != 0];
  self->m_originalDelegateConformanceType = self->m_delegateConformanceType;
  [(UIKBInputDelegateManager *)self storeDelegateConformance];
  int64_t v9 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v9 didChangeForwardingInputDelegate:v10];

  [(UIKBInputDelegateManager *)self updateRespectForwardingInputDelegateFlagInDestination];
}

- (void)updateRespectForwardingInputDelegateFlagInDestination
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v3 = [(UIKBInputDelegateManager *)self inputSystemSourceSession];
    if (v3)
    {
      id v6 = v3;
      id v4 = [v3 textOperations];
      [v4 setCustomInfoType:0x1ED14BA60];
      id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[UIKBInputDelegateManager shouldRespectForwardingInputDelegate](self, "shouldRespectForwardingInputDelegate"));
      [v4 setCustomInfo:v5];

      [v6 flushOperations];
      id v3 = v6;
    }
  }
}

- (unint64_t)delegateConformanceType
{
  return self->m_delegateConformanceType;
}

- (void)storeDelegateConformance
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  self->unint64_t m_delegateConformanceType = 0;
  id v3 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  int v4 = [v3 conformsToProtocol:&unk_1ED42F658];

  if (v4) {
    self->m_delegateConformanceType |= 2uLL;
  }
  id v5 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  int v6 = [v5 conformsToProtocol:&unk_1ED431E48];

  if (v6) {
    self->m_delegateConformanceType |= 4uLL;
  }
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    id v7 = [(UIKBInputDelegateManager *)self keyInputDelegate];
    int v8 = [v7 conformsToProtocol:&unk_1ED700940];

    if (v8)
    {
      self->m_delegateConformanceType |= 0x720uLL;
      int64_t v9 = _UIKeyboardImplLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v29 = [(UIKBInputDelegateManager *)self keyInputDelegate];
        int v31 = 138412290;
        v32 = v29;
        _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "Delegate: %@, conforms to UIAsyncTextInputClient", (uint8_t *)&v31, 0xCu);
      }
    }
    id v10 = [(UIKBInputDelegateManager *)self keyInputDelegate];
    int v11 = [v10 conformsToProtocol:&unk_1ED7009A0];

    if (v11)
    {
      self->m_delegateConformanceType |= 0x920uLL;
      id v12 = _UIKeyboardImplLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v30 = [(UIKBInputDelegateManager *)self keyInputDelegate];
        int v31 = 138412290;
        v32 = v30;
        _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "Delegate: %@, conforms to BETextInput", (uint8_t *)&v31, 0xCu);
      }
    }
  }
  v13 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  int v14 = [v13 conformsToProtocol:&unk_1ED700D60];

  if (v14) {
    self->m_delegateConformanceType |= 8uLL;
  }
  v15 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  int v16 = [v15 conformsToProtocol:&unk_1ED42EEC0];

  if (v16) {
    self->m_delegateConformanceType |= 1uLL;
  }
  v17 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  int v18 = [v17 conformsToProtocol:&unk_1ED457D18];

  unint64_t m_delegateConformanceType = self->m_delegateConformanceType;
  if (v18)
  {
    m_delegateConformanceType |= 0x10uLL;
    self->unint64_t m_delegateConformanceType = m_delegateConformanceType;
  }
  if ((m_delegateConformanceType & 4) != 0)
  {
    v20 = [(UIKBInputDelegateManager *)self textInputDelegate];
    char v21 = objc_opt_respondsToSelector();

    if (v21) {
      self->m_delegateConformanceType |= 0x20uLL;
    }
  }
  v22 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  int v23 = [v22 conformsToProtocol:&unk_1ED42E8E0];

  if (v23) {
    self->m_delegateConformanceType |= 0x40uLL;
  }
  v24 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  char v25 = objc_opt_respondsToSelector();

  if (v25) {
    self->m_delegateConformanceType |= 0x80uLL;
  }
  v26 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  if (objc_opt_respondsToSelector())
  {
    v27 = [(UIKBInputDelegateManager *)self keyInputDelegate];
    int v28 = [v27 requiresKeyEvents];

    if (v28) {
      self->m_delegateConformanceType |= 0x100uLL;
    }
  }
  else
  {
  }
}

- (BOOL)delegateAdoptsWebTextInputPrivate
{
  return (LOBYTE(self->m_delegateConformanceType) >> 5) & 1;
}

- (UIView)automaticallySelectedOverlay
{
  id v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    int v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_5:
    int v6 = v4;
    id v7 = [v4 unscaledView];
    goto LABEL_6;
  }
  id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v5)
  {
    int v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_5;
  }
  int v6 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  if (objc_opt_respondsToSelector())
  {
    int64_t v9 = [(UIKBInputDelegateManager *)self keyInputDelegate];
    id v7 = [v9 automaticallySelectedOverlay];
  }
  else
  {
    id v7 = 0;
  }
LABEL_6:

  return (UIView *)v7;
}

- (CGRect)selectionClipRect
{
  id v3 = [(UIKBInputDelegateManager *)self webInputDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_5:
    int v8 = v5;
    [v5 selectionClipRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    goto LABEL_6;
  }
  int v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_5;
  }
  int v8 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  if (objc_opt_respondsToSelector())
  {
    char v21 = [(UIKBInputDelegateManager *)self keyInputDelegate];
    [v21 _selectionClipRect];
    double v10 = v22;
    double v12 = v23;
    double v14 = v24;
    double v16 = v25;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB20];
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
LABEL_6:

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)privateKeyInputDelegate
{
  if ((self->m_delegateConformanceType & 0x10) != 0)
  {
    BOOL v2 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  }
  else
  {
    BOOL v2 = 0;
  }
  return v2;
}

- (UITextInteractionSelectableInputDelegate)selectableDelegate
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self textInputDelegate];
  if (v3)
  {
    char v4 = (void *)v3;
    selectableDelegate = self->_selectableDelegate;
    if (selectableDelegate)
    {
      int v6 = [(UITextInteractionSelectableInputDelegate *)selectableDelegate textInput];

      char v7 = self->_selectableDelegate;
      if (v6 == v4)
      {
LABEL_7:
        double v12 = v7;
LABEL_11:
        double v13 = v12;

        char v4 = v13;
        goto LABEL_13;
      }
      if (v7) {
        goto LABEL_13;
      }
    }
    int v8 = [v4 interactionAssistant];
    double v9 = [v8 externalInteractions];

    if (!v9) {
      goto LABEL_13;
    }
    double v10 = +[UITextInteractionSelectableInputDelegate selectableInputDelegateWithTextInput:v4];
    double v11 = self->_selectableDelegate;
    self->_selectableDelegate = v10;

    char v7 = self->_selectableDelegate;
    goto LABEL_7;
  }
  if (self->m_firstResponderAdoptsTextInput)
  {
    char v4 = [(UIKBInputDelegateManager *)self delegateAsResponder];
    if (!v4) {
      goto LABEL_13;
    }
    double v12 = +[UITextInteractionSelectableInputDelegate selectableInputDelegateWithTextInput:v4];
    goto LABEL_11;
  }
  char v4 = 0;
LABEL_13:
  return (UITextInteractionSelectableInputDelegate *)v4;
}

- (UIKeyboardInput)legacyInputDelegate
{
  if ((self->m_delegateConformanceType & 0x40) != 0)
  {
    BOOL v2 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  }
  else
  {
    BOOL v2 = 0;
  }
  return (UIKeyboardInput *)v2;
}

- (UITextSelectionDisplayInteraction)selectionDisplayInteraction
{
  BOOL v2 = [(UIKBInputDelegateManager *)self delegateAsResponder];
  uint64_t v3 = [v2 _responderForEditing];
  char v4 = [v3 _selectionDisplayInteraction];

  return (UITextSelectionDisplayInteraction *)v4;
}

- (id)inputSystemSourceSession
{
  if ((self->m_delegateConformanceType & 0x80) != 0
    || ([(UIKBInputDelegateManager *)self forwardingInputDelegate],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (unint64_t m_originalDelegateConformanceType = self->m_originalDelegateConformanceType,
        v3,
        (m_originalDelegateConformanceType & 0x80) != 0))
  {
    int v6 = [(UIKBInputDelegateManager *)self delegateRespectingForwardingDelegate:0];
    id v5 = [v6 _rtiSourceSession];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)canHandleInputDelegateCommandAction:(unint64_t)a3
{
  char v4 = [(UIKBInputDelegateManager *)self selectorForCommand:a3];
  id v5 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v5)
  {
    uint64_t v6 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    char v7 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v7)
    {
      uint64_t v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      double v12 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v12)
      {
        int v8 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
        char v9 = [v8 canPerformAction:v4 withSender:0];
        goto LABEL_6;
      }
      uint64_t v6 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  int v8 = (void *)v6;
  char v9 = objc_opt_respondsToSelector();
LABEL_6:
  char v10 = v9;

  return v10 & 1;
}

- (SEL)selectorForCommand:(unint64_t)a3
{
  id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    char v7 = [(UIKBInputDelegateManager *)self webInputDelegate];
    BOOL v6 = v7 != 0;
  }
  switch(a3)
  {
    case 0uLL:
      char v9 = &selRef_transposeCharacters;
      char v10 = &selRef__transpose;
      goto LABEL_12;
    case 1uLL:
      char v9 = &selRef_deleteInDirection_toGranularity_;
      char v10 = &selRef__deleteForwardAndNotify_;
      goto LABEL_12;
    case 2uLL:
      char v9 = &selRef_deleteInDirection_toGranularity_;
      char v10 = &selRef__deleteByWord;
      goto LABEL_12;
    case 3uLL:
      char v9 = &selRef_deleteInDirection_toGranularity_;
      char v10 = &selRef__deleteForwardByWord;
      goto LABEL_12;
    case 4uLL:
      char v9 = &selRef_deleteInDirection_toGranularity_;
      char v10 = &selRef__deleteToStartOfLine;
      goto LABEL_12;
    case 5uLL:
      char v9 = &selRef_deleteInDirection_toGranularity_;
      char v10 = &selRef__deleteToEndOfLine;
      goto LABEL_12;
    case 6uLL:
      char v9 = &selRef_deleteInDirection_toGranularity_;
      char v10 = &selRef__deleteToEndOfParagraph;
LABEL_12:
      if (!v6) {
        char v9 = v10;
      }
      SEL result = *v9;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  char v7 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  if (v7)
  {
  }
  else
  {
    int v8 = [(UIKBInputDelegateManager *)self webInputDelegate];

    if (!v8)
    {
      char v9 = [(UIKBInputDelegateManager *)self delegateAsResponder];
      char v13 = [v9 canPerformAction:a3 withSender:v6];
      goto LABEL_13;
    }
  }
  if (sel_isEqual(a3, sel__moveUp_withHistory_)
    || sel_isEqual(a3, sel__moveDown_withHistory_)
    || sel_isEqual(a3, sel__moveLeft_withHistory_)
    || sel_isEqual(a3, sel__moveRight_withHistory_))
  {
    char v9 = [(UIKBInputDelegateManager *)self delegateAsResponder];
    if (![v9 canPerformAction:sel_moveInLayoutDirection_ withSender:v6])
    {
      char v13 = 0;
      goto LABEL_13;
    }
    char v10 = [(UIKBInputDelegateManager *)self delegateAsResponder];
    double v11 = v10;
    double v12 = sel_extendInLayoutDirection_;
  }
  else
  {
    if (!sel_isEqual(a3, sel__moveToStartOfWord_withHistory_)
      && !sel_isEqual(a3, sel__moveToStartOfLine_withHistory_)
      && !sel_isEqual(a3, sel__moveToStartOfParagraph_withHistory_)
      && !sel_isEqual(a3, sel__moveToStartOfDocument_withHistory_)
      && !sel_isEqual(a3, sel__moveToEndOfWord_withHistory_)
      && !sel_isEqual(a3, sel__moveToEndOfParagraph_withHistory_)
      && !sel_isEqual(a3, sel__moveToEndOfLine_withHistory_)
      && !sel_isEqual(a3, sel__moveToEndOfDocument_withHistory_))
    {
      char v13 = 0;
      goto LABEL_14;
    }
    char v9 = [(UIKBInputDelegateManager *)self delegateAsResponder];
    if ([v9 canPerformAction:sel_moveInDirection_byGranularity_ withSender:v6])
    {
      char v13 = 1;
      goto LABEL_13;
    }
    char v10 = [(UIKBInputDelegateManager *)self delegateAsResponder];
    double v11 = v10;
    double v12 = sel_extendInDirection_byGranularity_;
  }
  char v13 = [v10 canPerformAction:v12 withSender:v6];

LABEL_13:
LABEL_14:

  return v13;
}

- (BOOL)delegateRespondsToSelector:(SEL)a3
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)continuousSpellCheckingEnabled
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  char v6 = [v5 continuousSpellCheckingEnabled];

  return v6;
}

- (BOOL)hasText
{
  BOOL v2 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  char v3 = [v2 hasText];

  return v3;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    char v6 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "inserting text", v7, 2u);
    }
  }
  id v5 = [(UIKBInputDelegateManager *)self privateInputDelegate];
  -[UIKBInputDelegateManager insertText:updateInputSource:](self, "insertText:updateInputSource:", v4, [v5 _textInputSource] != 3);
}

- (void)deleteBackward
{
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    double v24 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25[0]) = 0;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "inserting text", (uint8_t *)v25, 2u);
    }
  }
  char v10 = [(UIKBInputDelegateManager *)self webInputDelegate];
  unsigned __int8 v11 = objc_opt_respondsToSelector();

  double v12 = [(UIKBInputDelegateManager *)self webInputDelegate];
  unsigned __int8 v13 = objc_opt_respondsToSelector();

  double v14 = [(UIKBInputDelegateManager *)self textInputDelegate];
  char v15 = objc_opt_respondsToSelector();

  if ((v11 | v13) & 1) != 0 || (v15)
  {
    [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:1];
    if ((v11 | v13))
    {
      double v17 = (void *)[objc_alloc((Class)off_1E52D2EA8) initWithPrimaryString:v8 alternativeStrings:v9 isLowConfidence:a5 == 1];
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x2050000000;
      double v18 = (void *)getBETextAlternativesClass_softClass;
      uint64_t v29 = getBETextAlternativesClass_softClass;
      if (!getBETextAlternativesClass_softClass)
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __getBETextAlternativesClass_block_invoke;
        v25[3] = &unk_1E52D9900;
        v25[4] = &v26;
        __getBETextAlternativesClass_block_invoke((uint64_t)v25);
        double v18 = (void *)v27[3];
      }
      double v19 = v18;
      _Block_object_dispose(&v26, 8);
      double v20 = (void *)[[v19 alloc] _initWithNSTextAlternatives:v17];
      char v21 = [(UIKBInputDelegateManager *)self webInputDelegate];
      double v22 = v21;
      if (v13)
      {
        [v21 insertTextAlternatives:v20];
      }
      else if (v11)
      {
        [v21 insertText:v8 textAlternatives:v20 style:a5];
      }
    }
    else
    {
      double v17 = [(UIKBInputDelegateManager *)self textInputDelegate];
      [v17 insertText:v8 alternatives:v9 style:a5];
    }

    double v23 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    [v23 updateTextInputKeyboardSource];

    [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:0];
    double v16 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    [v16 updateKeyboardStateForInsertion:v8];
  }
  else
  {
    double v16 = [off_1E52D2EA8 attributedText:v8 withAlternativeTexts:v9 style:a5];
    [(UIKBInputDelegateManager *)self insertAttributedText:v16];
  }
}

- (id)textInRange:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v5)
  {
    char v6 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    char v7 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v7) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    char v6 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  id v8 = v6;
  id v9 = [v6 textInRange:v4];

  return v9;
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIKBInputDelegateManager *)self textInputDelegate];
  [v8 replaceRange:v7 withText:v6];
}

- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(UIKBInputDelegateManager *)self textInputDelegate];
    [v9 correctedTypedText:v10 rangeOfReplacement:v6];
  }
}

- (void)replaceRange:(id)a3 oldText:(id)a4 withText:(id)a5 forReplaceAction:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    v55 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v55, OS_LOG_TYPE_DEFAULT, "replacing text", buf, 2u);
    }
  }
  switch(a6)
  {
    case 0:
      unsigned __int8 v13 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      if (v13
        || ([(UIKBInputDelegateManager *)self webInputDelegate],
            (unsigned __int8 v13 = objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_6:
        double v14 = [(UIKBInputDelegateManager *)self selectableDelegate];
        [v14 replaceRange:v10 withText:v12];
        goto LABEL_35;
      }
      uint64_t v33 = [(UIKBInputDelegateManager *)self textInputDelegate];
      char v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) == 0) {
        goto LABEL_6;
      }
      double v14 = [(UIKBInputDelegateManager *)self textInputDelegate];
      [v14 replaceRangeWithTextWithoutClosingTyping:v10 replacementText:v12];
      goto LABEL_35;
    case 1:
      char v15 = [(UIKBInputDelegateManager *)self webInputDelegate];

      if (v15)
      {
        double v16 = [(UIKBInputDelegateManager *)self webInputDelegate];
        double v17 = [v16 selectedText];

        if ([v17 length])
        {
          double v18 = [(UIKBInputDelegateManager *)self webInputDelegate];
          [v18 replaceSelectedText:v17 withText:v12];
LABEL_28:

LABEL_30:
          goto LABEL_36;
        }
LABEL_29:
        [(UIKBInputDelegateManager *)self insertText:v12];
        goto LABEL_30;
      }
      uint64_t v29 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

      if (v29)
      {
        v30 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
        double v17 = [v30 selectedText];

        if (![v17 length]) {
          goto LABEL_29;
        }
        int v31 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
LABEL_27:
        double v18 = v31;
        [v31 replaceText:v17 withText:v12];
        goto LABEL_28;
      }
      v35 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v35)
      {
        v36 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
        double v17 = [v36 selectedText];

        if (![v17 length]) {
          goto LABEL_29;
        }
        int v31 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
        goto LABEL_27;
      }
      v38 = [(UIKBInputDelegateManager *)self textInputDelegate];
      double v17 = [v38 selectedTextRange];

      if (v17)
      {
        if (![v17 isEmpty]) {
          goto LABEL_40;
        }
        v39 = [(UIKBInputDelegateManager *)self textInputDelegate];
        v40 = [v17 end];
        uint64_t v41 = [v39 _rangeOfEnclosingWord:v40];

        double v17 = (void *)v41;
        if (v41)
        {
LABEL_40:
          v42 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
          [v42 setShouldIgnoreTextInputChanges:1];

          v43 = [(UIKBInputDelegateManager *)self textInputDelegate];
          v44 = [v43 textInRange:v17];

          v45 = [(UIKBInputDelegateManager *)self selectableDelegate];
          [v45 replaceRange:v17 withText:v12];

          v59 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
          v46 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
          v47 = [v46 keyboardState];
          v48 = [v47 documentState];
          v49 = [v48 documentStateAfterReplacingText:v44 withText:v12];
          if (v49)
          {
            [v59 setDocumentState:v49];
          }
          else
          {
            v57 = (void *)MEMORY[0x1E4FAE2A8];
            v56 = [(UIKBInputDelegateManager *)self textInputDelegate];
            [v57 documentStateOfDocument:v56];
            v53 = v58 = v44;
            [v59 setDocumentState:v53];

            v44 = v58;
          }

          v54 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
          [v54 setShouldIgnoreTextInputChanges:0];

          goto LABEL_30;
        }
      }
      goto LABEL_44;
    case 2:
      double v19 = [(UIKBInputDelegateManager *)self textInputDelegate];
      double v20 = [(UIKBInputDelegateManager *)self textInputDelegate];
      char v21 = [v20 beginningOfDocument];
      double v22 = [(UIKBInputDelegateManager *)self textInputDelegate];
      double v23 = [v22 endOfDocument];
      double v17 = [v19 textRangeFromPosition:v21 toPosition:v23];

      double v24 = [(UIKBInputDelegateManager *)self textInputDelegate];
      double v25 = [v24 textInRange:v17];
      uint64_t v26 = [v25 length];

      if (![(UIKBInputDelegateManager *)self callShouldReplaceExtendedRange:v26 withText:v12 includeMarkedText:1])goto LABEL_30; {
      double v18 = [(UIKBInputDelegateManager *)self textInputDelegate];
      }
      [v18 replaceRange:v17 withText:v12];
      goto LABEL_28;
    case 3:
      if (!v12) {
        goto LABEL_36;
      }
      v27 = [(UIKBInputDelegateManager *)self webInputDelegate];

      if (v27)
      {
        if (![v11 length]) {
          goto LABEL_44;
        }
        uint64_t v28 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_34:
        double v14 = v28;
        [v28 replaceDictatedText:v11 withText:v12];
        goto LABEL_35;
      }
      v32 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

      if (v32)
      {
        if (![v11 length]) {
          goto LABEL_44;
        }
        uint64_t v28 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
        goto LABEL_34;
      }
      v37 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v37)
      {
        if (![v11 length]) {
          goto LABEL_44;
        }
        uint64_t v28 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
        goto LABEL_34;
      }
      if (v10 && ([v10 isEmpty] & 1) == 0)
      {
        v50 = [(UIKBInputDelegateManager *)self textInputDelegate];
        char v51 = objc_opt_respondsToSelector();

        if (v51)
        {
          v52 = [(UIKBInputDelegateManager *)self textInputDelegate];
          [v52 replaceRangeWithTextWithoutClosingTyping:v10 replacementText:v12];
        }
        else
        {
          v52 = [(UIKBInputDelegateManager *)self selectableDelegate];
          [v52 replaceRange:v10 withText:v12];
        }

        double v14 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
        [v14 updateKeyboardStateForReplacingText:v11 withText:v12];
LABEL_35:
      }
      else
      {
LABEL_44:
        [(UIKBInputDelegateManager *)self insertText:v12];
      }
LABEL_36:

      return;
    default:
      goto LABEL_36;
  }
}

- (void)replaceRange:(id)a3 oldText:(id)a4 withAttributedText:(id)a5 forReplaceAction:(int)a6
{
  id v9 = a3;
  id v10 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    double v18 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v19 = 0;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "replacing text", v19, 2u);
    }

    if (a6) {
      goto LABEL_9;
    }
  }
  else if (a6)
  {
    goto LABEL_9;
  }
  id v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  if (v11
    || ([(UIKBInputDelegateManager *)self webInputDelegate],
        (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    double v16 = [(UIKBInputDelegateManager *)self textInputDelegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      double v14 = [(UIKBInputDelegateManager *)self textInputDelegate];
      goto LABEL_8;
    }
  }
  id v12 = [(UIKBInputDelegateManager *)self selectableDelegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    double v14 = [(UIKBInputDelegateManager *)self selectableDelegate];
LABEL_8:
    char v15 = v14;
    [v14 replaceRange:v9 withAttributedText:v10];
  }
LABEL_9:
}

- (void)replaceSelectionOffset:(int64_t)a3 length:(unint64_t)a4 withAnnotatedString:(id)a5 relativeReplacementRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v17 = a5;
  id v11 = [(UIKBInputDelegateManager *)self webInputDelegate];

  id v12 = v17;
  if (!v11)
  {
    char v13 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v13)
    {
      double v14 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      char v15 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      id v12 = v17;
      if (!v15) {
        goto LABEL_7;
      }
      double v14 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    }
    double v16 = v14;
    objc_msgSend(v14, "replaceSelectionOffset:length:withAnnotatedString:relativeReplacementRange:", a3, a4, v17, location, length);

    id v12 = v17;
  }
LABEL_7:
}

- (id)markedTextRange
{
  char v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v5) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    id v4 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  id v6 = v4;
  id v7 = [v4 markedTextRange];

  return v7;
}

- (void)transposeCharacters
{
  char v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v5 = [(UIKBInputDelegateManager *)self webInputDelegate];
    [v5 transposeCharactersAroundSelection];
  }
  else
  {
    id v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v4)
    {
      id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      [v5 transposeCharacters];
    }
    else
    {
      id v5 = [(UIKBInputDelegateManager *)self textInputDelegate];
      [v5 _transpose];
    }
  }
}

- (id)selectedText
{
  char v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v5)
    {
      id v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      id v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (!v6) {
        goto LABEL_8;
      }
      id v4 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    }
  }
  id v7 = v4;
  id v6 = [v4 selectedText];

LABEL_8:
  return v6;
}

- (id)selectedTextRange
{
  char v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v5) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    id v4 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  id v6 = v4;
  id v7 = [v4 selectedTextRange];

  return v7;
}

- (void)setSelectedTextRange:(id)a3
{
  id v8 = a3;
  id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v4)
  {
    id v5 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v6) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    id v5 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  id v7 = v5;
  [v5 setSelectedTextRange:v8];
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    id v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v9) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    id v8 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  id v10 = v8;
  objc_msgSend(v8, "_setAttributedMarkedText:selectedRange:", v11, location, length);
}

- (id)selectionRectsForRange:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v5)
  {
    id v6 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v7 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v7) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    id v6 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  id v8 = v6;
  id v9 = [v6 selectionRectsForRange:v4];

  return v9;
}

- (BOOL)hasMarkedText
{
  char v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_7:
    id v7 = v4;
    char v8 = [v4 hasMarkedText];

    return v8;
  }
  id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v5)
  {
    id v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_7;
  }
  id v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

  if (v6)
  {
    id v4 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    goto LABEL_7;
  }
  return 0;
}

- (void)unmarkText
{
  char v3 = [(UIKBInputDelegateManager *)self selectableDelegate];
  [v3 _unmarkText];

  id v4 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  id v5 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  id v6 = [v5 keyboardState];
  id v7 = [v6 documentState];
  char v8 = [v7 documentStateAfterUnmarkingText];
  [v4 setDocumentState:v8];

  id v9 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v9 clearInputForMarkedText];
}

- (id)markedText
{
  char v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v5)
    {
      id v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      id v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (!v6)
      {
        id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
        id v10 = [v7 markedTextRange];
        if (v10)
        {
          id v11 = [(UIKBInputDelegateManager *)self textInputDelegate];
          id v12 = [(UIKBInputDelegateManager *)self textInputDelegate];
          char v13 = [v12 markedTextRange];
          char v8 = [v11 textInRange:v13];
        }
        else
        {
          char v8 = 0;
        }

        goto LABEL_8;
      }
      id v4 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    }
  }
  id v7 = v4;
  char v8 = [v4 markedText];
LABEL_8:

  return v8;
}

- (id)attributedMarkedText
{
  char v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
    char v5 = objc_opt_respondsToSelector();

    id v6 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_7:
    id v11 = v6;
    if (v5)
    {
      id v12 = [v6 attributedMarkedText];
LABEL_13:

      goto LABEL_14;
    }
    uint64_t v13 = [v6 markedText];

    if (v13)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13];
      id v11 = (void *)v13;
      goto LABEL_13;
    }
    id v11 = 0;
LABEL_12:
    id v12 = 0;
    goto LABEL_13;
  }
  id v7 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v7)
  {
    char v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    char v5 = objc_opt_respondsToSelector();

    id v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_7;
  }
  id v9 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

  if (v9)
  {
    id v10 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    char v5 = objc_opt_respondsToSelector();

    id v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    goto LABEL_7;
  }
  char v15 = [(UIKBInputDelegateManager *)self textInputDelegate];
  char v16 = objc_opt_respondsToSelector();

  id v11 = [(UIKBInputDelegateManager *)self textInputDelegate];
  uint64_t v17 = [v11 markedTextRange];
  double v18 = (void *)v17;
  if (v16)
  {
    if (v17)
    {
      double v19 = [(UIKBInputDelegateManager *)self textInputDelegate];
      double v20 = [(UIKBInputDelegateManager *)self textInputDelegate];
      char v21 = [v20 markedTextRange];
      id v12 = [v19 attributedTextInRange:v21];
    }
    else
    {
      id v12 = 0;
    }

    goto LABEL_13;
  }
  if (!v17) {
    goto LABEL_12;
  }
  double v22 = [(UIKBInputDelegateManager *)self textInputDelegate];
  double v23 = [(UIKBInputDelegateManager *)self textInputDelegate];
  double v24 = [v23 markedTextRange];
  uint64_t v25 = [v22 textInRange:v24];

  if (v25)
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v25];
    id v11 = (void *)v25;
    goto LABEL_13;
  }
  id v12 = 0;
LABEL_14:
  return v12;
}

- (id)tintColor
{
  BOOL v2 = [(UIKBInputDelegateManager *)self delegateAsResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [v2 tintColor];
  }
  else
  {
    id v4 = [v2 _responderForEditing];
    if (!v4) {
      goto LABEL_9;
    }
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      char v3 = [v4 nextResponder];

      id v4 = v3;
    }
    while (v3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v3 = [v4 tintColor];
    }
    else
    {
LABEL_9:
      char v3 = 0;
    }
  }
  return v3;
}

- (id)_textSelectingContainer
{
  if ([(UIKBInputDelegateManager *)self hasAsyncCapableInputDelegate])
  {
    char v3 = [(UIKBInputDelegateManager *)self asyncCapableInputDelegate];
  }
  else
  {
    id v4 = [(UIKBInputDelegateManager *)self textInputDelegate];
    char v3 = [v4 _textSelectingContainer];
  }
  return v3;
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
  char v8 = [v7 positionFromPosition:v6 offset:a4];

  return v8;
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [(UIKBInputDelegateManager *)self textInputDelegate];
  id v9 = [v8 textRangeFromPosition:v7 toPosition:v6];

  return v9;
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
  int64_t v8 = [v7 baseWritingDirectionForPosition:v6 inDirection:a4];

  return v8;
}

- (void)setBaseWritingDirection:(int64_t)a3 forRange:(id)a4
{
  id v10 = a4;
  id v6 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v6)
  {
    id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v8) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  id v9 = v7;
  [v7 setBaseWritingDirection:a3 forRange:v10];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v8)
  {
    id v9 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v10) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    id v9 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  id v11 = v9;
  int64_t v12 = [v9 offsetFromPosition:v6 toPosition:v7];

  return v12;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4 = a3;
  char v5 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v5)
  {
    id v6 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v7 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v7) {
      [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else {
    id v6 = [(UIKBInputDelegateManager *)self textInputDelegate];
    }
  }
  int64_t v8 = v6;
  [v6 caretRectForPosition:v4];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_moveUp:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_5:
    double v10 = v8;
    if (v4) {
      [v8 extendInLayoutDirection:4];
    }
    else {
      [v8 moveInLayoutDirection:4];
    }
    double v11 = 0;
    goto LABEL_9;
  }
  double v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v9)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_5;
  }
  double v10 = [(UIKBInputDelegateManager *)self selectableDelegate];
  double v11 = [v10 _moveUp:v4 withHistory:v6];
LABEL_9:

  return v11;
}

- (id)_moveDown:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_5:
    double v10 = v8;
    if (v4) {
      [v8 extendInLayoutDirection:5];
    }
    else {
      [v8 moveInLayoutDirection:5];
    }
    double v11 = 0;
    goto LABEL_9;
  }
  double v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v9)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_5;
  }
  double v10 = [(UIKBInputDelegateManager *)self selectableDelegate];
  double v11 = [v10 _moveDown:v4 withHistory:v6];
LABEL_9:

  return v11;
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_5:
    double v10 = v8;
    if (v4) {
      [v8 extendInLayoutDirection:3];
    }
    else {
      [v8 moveInLayoutDirection:3];
    }
    double v11 = 0;
    goto LABEL_9;
  }
  double v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v9)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_5;
  }
  double v10 = [(UIKBInputDelegateManager *)self selectableDelegate];
  double v11 = [v10 _moveLeft:v4 withHistory:v6];
LABEL_9:

  return v11;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_5:
    double v10 = v8;
    if (v4) {
      [v8 extendInLayoutDirection:2];
    }
    else {
      [v8 moveInLayoutDirection:2];
    }
    double v11 = 0;
    goto LABEL_9;
  }
  double v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v9)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_5;
  }
  double v10 = [(UIKBInputDelegateManager *)self selectableDelegate];
  double v11 = [v10 _moveRight:v4 withHistory:v6];
LABEL_9:

  return v11;
}

- (id)_moveToStartOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    double v9 = v8;
    if (v4) {
      [v8 extendInStorageDirection:1 byGranularity:1];
    }
    else {
      [v8 moveInStorageDirection:1 byGranularity:1];
    }
  }
  else
  {
    double v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      double v9 = [(UIKBInputDelegateManager *)self selectableDelegate];
      double v12 = [v9 _moveToStartOfWord:v4 withHistory:v6];
      goto LABEL_11;
    }
    double v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    double v9 = v11;
    if (v4) {
      [v11 extendInDirection:1 byGranularity:1];
    }
    else {
      [v11 moveInDirection:1 byGranularity:1];
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (id)_moveToStartOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    double v9 = v8;
    if (v4) {
      [v8 extendInStorageDirection:1 byGranularity:3];
    }
    else {
      [v8 moveInStorageDirection:1 byGranularity:3];
    }
  }
  else
  {
    double v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      double v9 = [(UIKBInputDelegateManager *)self selectableDelegate];
      double v12 = [v9 _moveToStartOfParagraph:v4 withHistory:v6];
      goto LABEL_11;
    }
    double v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    double v9 = v11;
    if (v4) {
      [v11 extendInDirection:1 byGranularity:3];
    }
    else {
      [v11 moveInDirection:1 byGranularity:3];
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (id)_moveToStartOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    double v9 = v8;
    if (v4) {
      [v8 extendInStorageDirection:1 byGranularity:4];
    }
    else {
      [v8 moveInStorageDirection:1 byGranularity:4];
    }
  }
  else
  {
    double v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      double v9 = [(UIKBInputDelegateManager *)self selectableDelegate];
      double v12 = [v9 _moveToStartOfLine:v4 withHistory:v6];
      goto LABEL_11;
    }
    double v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    double v9 = v11;
    if (v4) {
      [v11 extendInDirection:1 byGranularity:4];
    }
    else {
      [v11 moveInDirection:1 byGranularity:4];
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (id)_moveToStartOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    double v9 = v8;
    if (v4) {
      [v8 extendInStorageDirection:1 byGranularity:5];
    }
    else {
      [v8 moveInStorageDirection:1 byGranularity:5];
    }
  }
  else
  {
    double v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      double v9 = [(UIKBInputDelegateManager *)self selectableDelegate];
      double v12 = [v9 _moveToStartOfDocument:v4 withHistory:v6];
      goto LABEL_11;
    }
    double v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    double v9 = v11;
    if (v4) {
      [v11 extendInDirection:1 byGranularity:5];
    }
    else {
      [v11 moveInDirection:1 byGranularity:5];
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (id)_moveToEndOfWord:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    double v9 = v8;
    if (v4) {
      [v8 extendInStorageDirection:0 byGranularity:1];
    }
    else {
      [v8 moveInStorageDirection:0 byGranularity:1];
    }
  }
  else
  {
    double v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      double v9 = [(UIKBInputDelegateManager *)self selectableDelegate];
      double v12 = [v9 _moveToEndOfWord:v4 withHistory:v6];
      goto LABEL_11;
    }
    double v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    double v9 = v11;
    if (v4) {
      [v11 extendInDirection:0 byGranularity:1];
    }
    else {
      [v11 moveInDirection:0 byGranularity:1];
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (id)_moveToEndOfParagraph:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    double v9 = v8;
    if (v4) {
      [v8 extendInStorageDirection:0 byGranularity:3];
    }
    else {
      [v8 moveInStorageDirection:0 byGranularity:3];
    }
  }
  else
  {
    double v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      double v9 = [(UIKBInputDelegateManager *)self selectableDelegate];
      double v12 = [v9 _moveToEndOfParagraph:v4 withHistory:v6];
      goto LABEL_11;
    }
    double v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    double v9 = v11;
    if (v4) {
      [v11 extendInDirection:0 byGranularity:3];
    }
    else {
      [v11 moveInDirection:0 byGranularity:3];
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (id)_moveToEndOfLine:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    double v9 = v8;
    if (v4) {
      [v8 extendInStorageDirection:0 byGranularity:4];
    }
    else {
      [v8 moveInStorageDirection:0 byGranularity:4];
    }
  }
  else
  {
    double v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      double v9 = [(UIKBInputDelegateManager *)self selectableDelegate];
      double v12 = [v9 _moveToEndOfLine:v4 withHistory:v6];
      goto LABEL_11;
    }
    double v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    double v9 = v11;
    if (v4) {
      [v11 extendInDirection:0 byGranularity:4];
    }
    else {
      [v11 moveInDirection:0 byGranularity:4];
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (id)_moveToEndOfDocument:(BOOL)a3 withHistory:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    int64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    double v9 = v8;
    if (v4) {
      [v8 extendInStorageDirection:0 byGranularity:5];
    }
    else {
      [v8 moveInStorageDirection:0 byGranularity:5];
    }
  }
  else
  {
    double v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      double v9 = [(UIKBInputDelegateManager *)self selectableDelegate];
      double v12 = [v9 _moveToEndOfDocument:v4 withHistory:v6];
      goto LABEL_11;
    }
    double v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    double v9 = v11;
    if (v4) {
      [v11 extendInDirection:0 byGranularity:5];
    }
    else {
      [v11 moveInDirection:0 byGranularity:5];
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)insertSupplementalItem:(id)a3 candidate:(id)a4 replacementRange:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(UIKBInputDelegateManager *)self textInputDelegate];
  if (!v11)
  {
    double v11 = [(UIKBInputDelegateManager *)self delegateAsResponder];
    if (v11)
    {
      double v16 = [(UIKBInputDelegateManager *)self delegateAsResponder];
      int v17 = [v16 conformsToProtocol:&unk_1ED42F658];

      if (v17)
      {
        double v11 = [(UIKBInputDelegateManager *)self delegateAsResponder];
      }
      else
      {
        double v11 = 0;
      }
    }
  }
  char v12 = objc_opt_respondsToSelector();
  if (v12)
  {
    if (v11)
    {
      double v13 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
      [v13 textWillChange:v11];

      double v14 = [v9 candidate];
      [v11 _insertSupplementalItem:v8 forString:v14 replacementRange:v10];

      double v15 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
      [v15 textSuggestionDidChange:v11];
    }
    else
    {
      double v15 = [v9 candidate];
      [0 _insertSupplementalItem:v8 forString:v15 replacementRange:v10];
    }

    double v18 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    [v18 syncDocumentStateToInputDelegate];
  }
  return v12 & 1;
}

- (BOOL)insertTextSuggestion:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  id v6 = [(UIKBInputDelegateManager *)self webInputDelegate];
  if (!v6)
  {
    id v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    if (!v6)
    {
      id v6 = [(UIKBInputDelegateManager *)self textInputDelegate];
      if (!v6)
      {
        id v6 = [(UIKBInputDelegateManager *)self delegateAsResponder];
        if (!v6) {
          goto LABEL_8;
        }
        char v21 = [(UIKBInputDelegateManager *)self delegateAsResponder];
        int v22 = [v21 conformsToProtocol:&unk_1ED42F658];

        if (!v22)
        {
          id v6 = 0;
          goto LABEL_8;
        }
        id v6 = [(UIKBInputDelegateManager *)self delegateAsResponder];
      }
    }
  }
  if ((v6 == 0) | isKindOfClass & 1)
  {
LABEL_8:
    char v7 = 1;
    goto LABEL_10;
  }
  id v8 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v8 textWillChange:v6];

  char v7 = 0;
LABEL_10:
  if (objc_opt_respondsToSelector())
  {
    [v6 insertTextSuggestion:v4 completionHandler:&__block_literal_global_1028];
LABEL_33:
    BOOL v12 = 1;
    goto LABEL_34;
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(UIKBInputDelegateManager *)self webInputDelegate];

    if (!v9)
    {
      double v13 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

      if (v13)
      {
        double v14 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
        [v14 insertTextSuggestion:v4];
      }
      else
      {
        [v6 insertTextSuggestion:v4];
      }
      goto LABEL_33;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v4;
      double v11 = (void *)[objc_alloc((Class)getBEAutoFillTextSuggestionClass()) _initWithUIKitTextSuggestion:v10];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v29 = 0;
        v30 = &v29;
        uint64_t v31 = 0x2050000000;
        double v23 = (void *)getBETextSuggestionClass_softClass;
        uint64_t v32 = getBETextSuggestionClass_softClass;
        if (!getBETextSuggestionClass_softClass)
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __getBETextSuggestionClass_block_invoke;
          v28[3] = &unk_1E52D9900;
          v28[4] = &v29;
          __getBETextSuggestionClass_block_invoke((uint64_t)v28);
          double v23 = (void *)v30[3];
        }
        double v24 = v23;
        _Block_object_dispose(&v29, 8);
        double v11 = (void *)[[v24 alloc] _initWithUIKitTextSuggestion:v4];
        goto LABEL_32;
      }
      id v10 = v4;
      double v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      double v16 = [v10 username];

      if (v16)
      {
        int v17 = [v10 username];
        [v15 setObject:v17 forKeyedSubscript:@"username"];
      }
      double v18 = [v10 password];

      if (v18)
      {
        double v19 = [v10 password];
        [v15 setObject:v19 forKeyedSubscript:@"password"];
      }
      double v20 = +[UIAutoFillTextSuggestion autoFillSuggestionWithContents:v15];
      double v11 = (void *)[objc_alloc((Class)getBEAutoFillTextSuggestionClass()) _initWithUIKitTextSuggestion:v20];
    }
LABEL_32:
    uint64_t v25 = [(UIKBInputDelegateManager *)self webInputDelegate];
    [v25 insertTextSuggestion:v11];

    goto LABEL_33;
  }
  BOOL v12 = 0;
LABEL_34:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 isSecureTextEntry]) {
    [v6 _forceObscureAllText];
  }
  if ((v7 & 1) == 0)
  {
    uint64_t v26 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    [v26 textSuggestionDidChange:v6];
  }
  return v12;
}

void __49__UIKBInputDelegateManager_insertTextSuggestion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 count])
  {
    char v3 = _UIKeyboardImplLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Uninserted AutoFill types: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)insertAttributedText:(id)a3
{
  id v25 = a3;
  int v4 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  id v5 = [v4 keyboardState];
  uint64_t v6 = [v5 documentState];
  uint64_t v7 = [v6 selectedText];
  uint64_t v8 = [(id)v7 length];

  [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:1];
  id v9 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  id v10 = [(UIKBInputDelegateManager *)self selectableDelegate];
  double v11 = [(UIKBInputDelegateManager *)self privateInputDelegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    BOOL v12 = [(UIKBInputDelegateManager *)self privateInputDelegate];
    [v12 insertAttributedText:v25];
  }
  else
  {
    BOOL v12 = [v25 string];
    if (v10) {
      double v13 = v10;
    }
    else {
      double v13 = v9;
    }
    [v13 insertText:v12];
  }

  double v14 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v14 updateTextInputKeyboardSource];

  [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:0];
  uint64_t v15 = [v25 length];
  if (v15)
  {
    uint64_t v16 = v15;
    int v17 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    double v18 = [v25 string];
    double v19 = objc_msgSend(v18, "substringWithRange:", 0, v16);
    [v17 updateKeyboardStateForInsertion:v19];
  }
  double v20 = [(UIKBInputDelegateManager *)self privateInputDelegate];
  uint64_t v21 = [v20 _textInputSource];

  if (v21 != 2)
  {
    int v22 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v23 = [v22 _textInputSessionAnalytics];
    double v24 = [v25 string];
    objc_msgSend(v23, "didInsertText:relativeRangeBefore:", v24, 0, v8);
  }
}

- (void)insertDictationResult:(id)a3
{
  id v4 = a3;
  id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v7 insertDictationResult:v4];
  }
  else
  {
    id v5 = [v4 firstObject];

    uint64_t v6 = [v5 text];
    [v7 insertText:v6];

    id v4 = v5;
  }
}

- (BOOL)requiresKeyEvents
{
  char v3 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UIKBInputDelegateManager *)self keyInputDelegate];
    char v5 = [v4 requiresKeyEvents];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)handleKeyWebEvent:(id)a3
{
  id v7 = a3;
  id v4 = [(UIKBInputDelegateManager *)self privateInputDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(UIKBInputDelegateManager *)self privateInputDelegate];
    [v6 handleKeyWebEvent:v7];
  }
}

- (void)handleKeyWebEvent:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v8)
  {
    id v9 = [[UIKeyEvent alloc] initWithWebEvent:v6];
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2050000000;
    id v10 = (void *)getBEKeyEntryClass_softClass;
    uint64_t v33 = getBEKeyEntryClass_softClass;
    if (!getBEKeyEntryClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __getBEKeyEntryClass_block_invoke;
      uint64_t v28 = &unk_1E52D9900;
      uint64_t v29 = &v30;
      __getBEKeyEntryClass_block_invoke((uint64_t)buf);
      id v10 = (void *)v31[3];
    }
    double v11 = v10;
    _Block_object_dispose(&v30, 8);
    BOOL v12 = (void *)[[v11 alloc] _initWithUIKitKeyEvent:v9];
    double v13 = [(UIKBInputDelegateManager *)self webInputDelegate];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke;
    v23[3] = &unk_1E52EED78;
    id v24 = v7;
    [v13 handleKeyEntry:v12 withCompletionHandler:v23];

    goto LABEL_7;
  }
  double v14 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v14)
  {
    id v9 = [[UIKeyEvent alloc] initWithWebEvent:v6];
    uint64_t v15 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E52EEDA0;
    id v22 = v7;
    [v15 handleAsyncKeyEvent:v9 withCompletionHandler:v21];

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v16 = [(UIKBInputDelegateManager *)self privateInputDelegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    if (+[UIKeyboard isKeyboardProcess])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "webkey event shouldn't be handled here", buf, 2u);
      }
    }
    else
    {
      double v18 = [(UIKBInputDelegateManager *)self privateInputDelegate];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke_1039;
      v19[3] = &unk_1E52EEDC8;
      id v20 = v7;
      [v18 handleKeyWebEvent:v6 withCompletionHandler:v19];
    }
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
LABEL_8:
}

void __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = [a2 _uikitKeyEvent];
  char v5 = [v6 webEvent];
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);
}

void __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a2 webEvent];
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

uint64_t __68__UIKBInputDelegateManager_handleKeyWebEvent_withCompletionHandler___block_invoke_1039(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = [(UIKBInputDelegateManager *)self selectableDelegate];
  objc_msgSend(v8, "_setMarkedText:selectedRange:", v7, location, length);
}

- (void)_moveCurrentSelection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v5)
  {
    id v6 = [(UIKBInputDelegateManager *)self webInputDelegate];
    id v9 = v6;
LABEL_8:
    [v6 moveByOffset:(int)v3];
    goto LABEL_9;
  }
  id v7 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v7)
  {
    id v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
LABEL_7:
    id v9 = v6;
    goto LABEL_8;
  }
  id v8 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

  if (v8)
  {
    id v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    goto LABEL_7;
  }
  id v9 = [(UIKBInputDelegateManager *)self textInputDelegate];
  [v9 _moveCurrentSelection:v3];
LABEL_9:
}

- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4 overrideOriginalContextBeforeInputWith:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = v8;
  BOOL v47 = v6;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    double v11 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    BOOL v12 = [v11 documentState];
    double v13 = [v12 contextBeforeInput];
    id v10 = (id)[v13 copy];
  }
  uint64_t v14 = [v10 length];
  uint64_t v15 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  uint64_t v16 = [v15 documentState];
  char v17 = [v16 markedText];
  uint64_t v18 = [v17 length];

  [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:1];
  double v19 = [(UIKBInputDelegateManager *)self legacyInputDelegate];

  uint64_t v50 = v14;
  char v51 = v10;
  uint64_t v49 = v18;
  if (v19)
  {
    id v20 = 0;
  }
  else
  {
    uint64_t v21 = [(UIKBInputDelegateManager *)self textInputDelegate];
    id v22 = v21;
    if (a4)
    {
      id v52 = 0;
      [v21 _expandSelectionToBackwardDeletionClusterWithReinsertionOut:&v52];
      id v20 = v52;
    }
    else
    {
      [v21 _expandSelectionToBackwardDeletionClusterWithReinsertionOut:0];
      id v20 = 0;
    }
  }
  double v23 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  id v24 = [v23 keyboardState];
  id v25 = [v24 documentState];
  uint64_t v26 = [v25 selectedText];
  v27 = (void *)[v26 copy];

  uint64_t v48 = [v27 length];
  uint64_t v28 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  uint64_t v29 = [(UIKBInputDelegateManager *)self selectableDelegate];
  uint64_t v30 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  uint64_t v31 = [(UIKBInputDelegateManager *)self webInputDelegate];
  uint64_t v32 = v31;
  if (v31) {
    goto LABEL_13;
  }
  if (v30)
  {
    uint64_t v31 = v30;
LABEL_13:
    [v31 deleteInDirection:1 toGranularity:0];
    goto LABEL_14;
  }
  if (v29)
  {
    [v29 _deleteBackwardAndNotify:v47];
    if (!v20) {
      goto LABEL_15;
    }
    [v29 insertText:v20];
  }
  else
  {
    [v28 _deleteBackwardAndNotify:v47];
  }
LABEL_14:

LABEL_15:
  uint64_t v33 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v33 updateTextInputKeyboardSource];

  [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:0];
  char v34 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  v35 = [v34 documentState];
  v36 = [v35 contextBeforeInput];
  uint64_t v37 = [v36 length];

  v38 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  v39 = [v38 documentState];
  v40 = [v39 markedText];
  uint64_t v41 = [v40 length];

  if (v50 == v37 && v49 == v41)
  {
    v42 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    [v42 updateKeyboardStateForDeletion];
  }
  v43 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  v44 = [v43 documentState];
  v45 = [v44 markedText];

  if (!v45)
  {
    if (v48)
    {
      +[UIKBAnalyticsDispatcher didDeleteBackwardText:v27];
    }
    else if (v50)
    {
      v46 = objc_msgSend(v51, "substringFromIndex:", objc_msgSend(v51, "_rangeOfBackwardDeletionClusterAtIndex:", v50 - 1));
      +[UIKBAnalyticsDispatcher didDeleteBackwardText:v46];
    }
  }
}

- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4
{
}

- (void)_deleteBackwardWhileOverridingContextAndNotifyAtEnd:(BOOL)a3 deletionCount:(unint64_t)a4 reinsertTextInLoop:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v7 = a3;
  id v9 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  id v10 = [v9 documentState];
  double v11 = (void *)[v10 copy];

  unint64_t v12 = a4 - v7;
  if (a4 != v7)
  {
    do
    {
      double v13 = [v11 contextBeforeInput];
      [(UIKBInputDelegateManager *)self _deleteBackwardAndNotify:0 reinsertText:v5 overrideOriginalContextBeforeInputWith:v13];

      id v16 = [v11 documentStateAfterDeletingBackward];

      uint64_t v14 = v16;
      double v11 = v16;
      --v12;
    }
    while (v12);
    if ((v7 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  uint64_t v14 = v11;
  if (v7)
  {
LABEL_4:
    id v17 = v14;
    uint64_t v15 = [v14 contextBeforeInput];
    [(UIKBInputDelegateManager *)self _deleteBackwardAndNotify:1 reinsertText:0 overrideOriginalContextBeforeInputWith:v15];

    uint64_t v14 = v17;
  }
LABEL_5:
}

- (void)_deleteByWord
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    uint64_t v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    BOOL v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v5)
    {
      BOOL v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v6) {
        [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      }
      else {
      id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
      }
      [v7 _deleteByWord];
      goto LABEL_6;
    }
    uint64_t v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  }
  id v7 = v4;
  [v4 deleteInDirection:1 toGranularity:1];
LABEL_6:
}

- (void)_deleteForwardByWord
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    uint64_t v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    BOOL v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v5)
    {
      BOOL v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v6) {
        [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      }
      else {
      id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
      }
      [v7 _deleteForwardByWord];
      goto LABEL_6;
    }
    uint64_t v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  }
  id v7 = v4;
  [v4 deleteInDirection:0 toGranularity:1];
LABEL_6:
}

- (void)_deleteToStartOfLine
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    uint64_t v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    BOOL v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v5)
    {
      BOOL v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v6) {
        [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      }
      else {
      id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
      }
      [v7 _deleteToStartOfLine];
      goto LABEL_6;
    }
    uint64_t v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  }
  id v7 = v4;
  [v4 deleteInDirection:1 toGranularity:4];
LABEL_6:
}

- (void)_deleteToEndOfLine
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    uint64_t v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    BOOL v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v5)
    {
      BOOL v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v6) {
        [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      }
      else {
      id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
      }
      [v7 _deleteToEndOfLine];
      goto LABEL_6;
    }
    uint64_t v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  }
  id v7 = v4;
  [v4 deleteInDirection:0 toGranularity:4];
LABEL_6:
}

- (void)_deleteToEndOfParagraph
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    uint64_t v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    BOOL v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v5)
    {
      BOOL v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v6) {
        [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      }
      else {
      id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
      }
      [v7 _deleteToEndOfParagraph];
      goto LABEL_6;
    }
    uint64_t v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  }
  id v7 = v4;
  [v4 deleteInDirection:0 toGranularity:3];
LABEL_6:
}

- (BOOL)_deleteForwardAndNotify:(BOOL)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__UIKBInputDelegateManager__deleteForwardAndNotify___block_invoke;
  aBlock[3] = &unk_1E52E97E0;
  aBlock[4] = self;
  uint64_t v4 = (void (**)(void))_Block_copy(aBlock);
  BOOL v5 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v5) {
    goto LABEL_5;
  }
  BOOL v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v6
    || ([(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7)
    || ([(UIKBInputDelegateManager *)self textInputDelegate],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
LABEL_5:
    v4[2](v4);
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __52__UIKBInputDelegateManager__deleteForwardAndNotify___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  BOOL v5 = [v3 keyboardStateDelegate];
  BOOL v6 = [*(id *)(a1 + 32) keyboardStateDelegate];
  id v7 = [v6 keyboardState];
  id v8 = [v7 documentState];
  BOOL v9 = [v8 documentStateAfterDeletingForward];
  [v5 setDocumentState:v9];

  [*(id *)(a1 + 32) setInsideKeyInputDelegateCall:1];
  id v12 = [*(id *)(a1 + 32) textInputDelegate];
  id v10 = [*(id *)(a1 + 32) selectableDelegate];
  v4[2](v4);

  double v11 = [*(id *)(a1 + 32) keyboardStateDelegate];
  [v11 updateTextInputKeyboardSource];

  [*(id *)(a1 + 32) setInsideKeyInputDelegateCall:0];
}

void __52__UIKBInputDelegateManager__deleteForwardAndNotify___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) webInputDelegate];
  [v1 deleteInDirection:0 toGranularity:0];
}

void __52__UIKBInputDelegateManager__deleteForwardAndNotify___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) asyncInputDelegate];
  [v1 deleteInDirection:0 toGranularity:0];
}

void __52__UIKBInputDelegateManager__deleteForwardAndNotify___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) asyncWebKitInteractionDelegate];
  [v2 _deleteForwardAndNotify:*(unsigned __int8 *)(a1 + 40)];
}

void __52__UIKBInputDelegateManager__deleteForwardAndNotify___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textInputDelegate];
  [v2 _deleteForwardAndNotify:*(unsigned __int8 *)(a1 + 40)];
}

- (unint64_t)_textLengthToDeleteBeforeSelectedRangeForSmartDelete
{
  id v2 = [(UIKBInputDelegateManager *)self selectableDelegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    unint64_t v3 = [v2 _textLengthToDeleteBeforeSelectedRangeForSmartDelete];
  }
  else {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)__content
{
  id v2 = [(UIKBInputDelegateManager *)self privateInputDelegate];
  unint64_t v3 = [v2 _proxyTextInput];

  return v3;
}

- (unsigned)_characterBeforeCaretSelection
{
  id v2 = [(UIKBInputDelegateManager *)self textInputDelegate];
  unsigned int v3 = [v2 _characterBeforeCaretSelection];

  return v3;
}

- (id)_textRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v5 = [(UIKBInputDelegateManager *)self textInputDelegate];
  BOOL v6 = objc_msgSend(v5, "_textRangeFromNSRange:", location, length);

  return v6;
}

- (void)_setSelectionToPosition:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKBInputDelegateManager *)self textInputDelegate];
  [v5 _setSelectionToPosition:v4];
}

- (BOOL)_selectionAtDocumentStart
{
  unsigned int v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
    char v5 = [v4 isSelectionAtDocumentStart];
  }
  else
  {
    BOOL v6 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v6)
    {
      id v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      char v5 = [v4 selectionAtDocumentStart];
    }
    else
    {
      id v4 = [(UIKBInputDelegateManager *)self textInputDelegate];
      char v5 = [v4 _selectionAtDocumentStart];
    }
  }
  BOOL v7 = v5;

  return v7;
}

- (void)applyAutocorrection:(id)a3 toString:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v11)
  {
    id v12 = [(UIKBInputDelegateManager *)self webInputDelegate];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E52E3E60;
    double v13 = &v20;
    id v20 = v10;
    [v12 replaceText:v8 withText:v9 options:0 completionHandler:v19];
  }
  else
  {
    uint64_t v14 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v14)
    {
      id v12 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke_2;
      v17[3] = &unk_1E52E3E60;
      double v13 = &v18;
      id v18 = v10;
      [v12 replaceText:v8 withText:v9 options:0 withCompletionHandler:v17];
    }
    else
    {
      id v12 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke_3;
      v15[3] = &unk_1E52E3E88;
      double v13 = &v16;
      id v16 = v10;
      [v12 applyAutocorrection:v8 toString:v9 withCompletionHandler:v15];
    }
  }
}

void __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    [v3 rect];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

void __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    [v3 rect];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

uint64_t __79__UIKBInputDelegateManager_applyAutocorrection_toString_withCompletionHandler___block_invoke_3(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    [a2 firstRect];
    id v3 = *(uint64_t (**)(uint64_t))(v2 + 16);
    return v3(v2);
  }
  return result;
}

- (void)applyAutocorrection:(id)a3 toString:(id)a4 shouldUnderline:(BOOL)a5 withCompletionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v13)
  {
    uint64_t v14 = [(UIKBInputDelegateManager *)self webInputDelegate];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E52E3E60;
    id v25 = v12;
    [v14 replaceText:v11 withText:v10 options:v7 completionHandler:v24];

    uint64_t v15 = v25;
  }
  else
  {
    id v16 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v16)
    {
      id v17 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke_2;
      v22[3] = &unk_1E52E3E60;
      id v23 = v12;
      [v17 replaceText:v11 withText:v10 options:v7 withCompletionHandler:v22];

      uint64_t v15 = v23;
    }
    else
    {
      id v18 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (!v18)
      {
        [(UIKBInputDelegateManager *)self applyAutocorrection:v10 toString:v11 withCompletionHandler:v12];
        goto LABEL_8;
      }
      double v19 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke_3;
      v20[3] = &unk_1E52E3E88;
      id v21 = v12;
      [v19 applyAutocorrection:v10 toString:v11 shouldUnderline:v7 withCompletionHandler:v20];

      uint64_t v15 = v21;
    }
  }

LABEL_8:
}

void __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    [v3 rect];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

void __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    [v3 rect];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
}

uint64_t __95__UIKBInputDelegateManager_applyAutocorrection_toString_shouldUnderline_withCompletionHandler___block_invoke_3(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    [a2 firstRect];
    id v3 = *(uint64_t (**)(uint64_t))(v2 + 16);
    return v3(v2);
  }
  return result;
}

- (BOOL)shouldSuppressUpdateCandidateView
{
  id v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    uint64_t v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    char v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v5)
    {
      BOOL v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      if (objc_opt_respondsToSelector())
      {
        BOOL v7 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
        goto LABEL_7;
      }
LABEL_10:
      char v9 = 0;
      goto LABEL_11;
    }
    uint64_t v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
  }
  BOOL v6 = (void *)v4;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  BOOL v7 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
LABEL_7:
  id v8 = v7;
  char v9 = [v7 shouldSuppressUpdateCandidateView];

LABEL_11:
  return v9;
}

- (id)_rangeOfText:(id)a3 endingAtPosition:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIKBInputDelegateManager *)self textInputDelegate];
  char v9 = [v8 _rangeOfText:v7 endingAtPosition:v6];

  return v9;
}

- (void)requestDocumentContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (!v8)
  {
    uint64_t v14 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v14)
    {
      uint64_t v15 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      id v16 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (!v16) {
        goto LABEL_10;
      }
      uint64_t v15 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    }
    id v17 = v15;
    [v15 requestDocumentContext:v6 completionHandler:v7];

    goto LABEL_10;
  }
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2050000000;
  char v9 = (void *)getBETextDocumentRequestClass_softClass;
  uint64_t v27 = getBETextDocumentRequestClass_softClass;
  if (!getBETextDocumentRequestClass_softClass)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __getBETextDocumentRequestClass_block_invoke;
    v23[3] = &unk_1E52D9900;
    void v23[4] = &v24;
    __getBETextDocumentRequestClass_block_invoke((uint64_t)v23);
    char v9 = (void *)v25[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v24, 8);
  id v11 = (void *)[[v10 alloc] _initWithUIKitDocumentRequest:v6];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __69__UIKBInputDelegateManager_requestDocumentContext_completionHandler___block_invoke;
  id v21 = &unk_1E52EEDF0;
  id v22 = v7;
  id v12 = _Block_copy(&v18);
  double v13 = [(UIKBInputDelegateManager *)self webInputDelegate];
  [v13 requestDocumentContext:v11 completionHandler:v12];

LABEL_10:
}

void __69__UIKBInputDelegateManager_requestDocumentContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _uikitDocumentContext];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestTextContextForAutocorrectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  char v5 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __85__UIKBInputDelegateManager_requestTextContextForAutocorrectionWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E52EEDF0;
    id v11 = v4;
    id v6 = _Block_copy(aBlock);
    id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];
    [v7 requestTextContextForAutocorrectionWithCompletionHandler:v6];
  }
  else
  {
    id v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v8)
    {
      char v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      [v9 requestTextContextForAutocorrectionWithCompletionHandler:v4];
    }
  }
}

void __85__UIKBInputDelegateManager_requestTextContextForAutocorrectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 _uikitDocumentContext];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)adjustSelection:(id)a3 completionHandler:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v10 = a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    id v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
    objc_msgSend(v8, "adjustSelectionByRange:completionHandler:", var0, var1, v10);
  }
  else
  {
    char v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v9)
    {
      id v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      objc_msgSend(v8, "adjustSelection:completionHandler:", var0, var1, v10);
    }
    else
    {
      id v8 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      objc_msgSend(v8, "adjustSelectionWithDelta:completionHandler:", var0, var1, v10);
    }
  }
}

- (void)requestTextRectsForString:(id)a3 withCompletionHandler:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    id v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
LABEL_5:
    id v10 = v8;
    [v8 requestTextRectsForString:v11 withCompletionHandler:v6];
    goto LABEL_6;
  }
  char v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v9)
  {
    id v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    goto LABEL_5;
  }
  id v10 = objc_opt_new();
  v6[2](v6, v10);
LABEL_6:
}

- (CGRect)textFirstRect
{
  id v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    char v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v5)
    {
      id v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      id v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (!v6)
      {
        double v9 = *MEMORY[0x1E4F1DB20];
        double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        goto LABEL_8;
      }
      id v4 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    }
  }
  id v7 = v4;
  [v4 textFirstRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

LABEL_8:
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)textLastRect
{
  id v3 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v3)
  {
    id v4 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    char v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v5)
    {
      id v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      id v6 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (!v6)
      {
        double v9 = *MEMORY[0x1E4F1DB20];
        double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        goto LABEL_8;
      }
      id v4 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    }
  }
  id v7 = v4;
  [v4 textLastRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

LABEL_8:
  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)callKeyboardWillDismiss
{
  id v3 = [(UIKBInputDelegateManager *)self webInputDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(UIKBInputDelegateManager *)self webInputDelegate];
    [v5 keyboardWillDismiss];
  }
  return v4 & 1;
}

- (void)insertText:(id)a3 updateInputSource:(BOOL)a4
{
  BOOL v4 = a4;
  id v41 = a3;
  id v6 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  id v7 = [v6 keyboardState];
  double v8 = [v7 documentState];
  double v9 = [v8 selectedText];
  double v10 = (void *)[v9 copy];

  double v11 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  double v12 = [v11 keyboardState];
  double v13 = [v12 documentState];
  double v14 = [v13 selectedText];
  uint64_t v15 = [v14 length];

  [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:1];
  double v16 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  double v17 = [(UIKBInputDelegateManager *)self selectableDelegate];
  double v18 = [(UIKBInputDelegateManager *)self privateKeyInputDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v19 = [v18 insertFilteredText:v41];
    uint64_t v21 = v20;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v17) {
    id v22 = v17;
  }
  else {
    id v22 = v16;
  }
  [v22 insertText:v41];
  uint64_t v21 = [v41 length];
  uint64_t v19 = 0;
  if (v4)
  {
LABEL_8:
    id v23 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    [v23 updateTextInputKeyboardSource];
  }
LABEL_9:

  [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:0];
  if (v21 && v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v24 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    id v25 = objc_msgSend(v41, "substringWithRange:", v19, v21);
    [v24 updateKeyboardStateForInsertion:v25];
  }
  uint64_t v26 = [(UIKBInputDelegateManager *)self privateInputDelegate];
  if ([v26 _textInputSource] == 2)
  {
    BOOL v27 = 0;
  }
  else
  {
    uint64_t v28 = +[UIKBAnalyticsDispatcher sharedInstance];
    if ([v28 nextCandidateReplacementSource] == 2)
    {
      BOOL v27 = 1;
    }
    else
    {
      uint64_t v29 = +[UIKBAnalyticsDispatcher sharedInstance];
      BOOL v27 = [v29 nextCandidateReplacementSource] == 1;
    }
  }

  uint64_t v30 = [(UIKBInputDelegateManager *)self privateInputDelegate];
  if ([v30 _textInputSource] == 5)
  {
    if (!+[UIKeyboard inputUIOOP])
    {

      goto LABEL_25;
    }
    BOOL v31 = +[UIKeyboard isInputSystemUI];
  }
  else
  {
    BOOL v31 = 0;
  }

  if (v27 || v31)
  {
LABEL_25:
    uint64_t v32 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v33 = [v32 _textInputSessionAnalytics];
    objc_msgSend(v33, "didInsertText:relativeRangeBefore:selectedTextBefore:withLanguage:", v41, 0, v15, v10, 0);
  }
  char v34 = +[UIKBAnalyticsDispatcher sharedInstance];
  if ([v34 nextCandidateReplacementSource] == 3)
  {
LABEL_33:

LABEL_34:
    v38 = +[UIKBAnalyticsDispatcher sharedInstance];
    [v38 setNextCandidateReplacementPostCandidateInsertedText:v41];

    goto LABEL_35;
  }
  v35 = +[UIKBAnalyticsDispatcher sharedInstance];
  if ([v35 nextCandidateReplacementSource] == 4)
  {
LABEL_32:

    goto LABEL_33;
  }
  v36 = +[UIKBAnalyticsDispatcher sharedInstance];
  if ([v36 nextCandidateReplacementSource] == 5)
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v37 = +[UIKBAnalyticsDispatcher sharedInstance];
  if ([v37 nextCandidateReplacementSource] == 7)
  {

    goto LABEL_31;
  }
  v39 = +[UIKBAnalyticsDispatcher sharedInstance];
  uint64_t v40 = [v39 nextCandidateReplacementSource];

  if (v40 == 6) {
    goto LABEL_34;
  }
LABEL_35:
}

- (void)insertTextAfterSelection:(id)a3
{
  id v14 = a3;
  BOOL v4 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  char v5 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  id v6 = [v5 keyboardState];
  id v7 = [v6 documentState];
  double v8 = [v7 documentStateAfterInsertingTextAfterSelection:v14];
  [v4 setDocumentState:v8];

  double v9 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v9 clearInputForMarkedText];

  [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:1];
  double v10 = [(UIKBInputDelegateManager *)self keyInputDelegate];
  double v11 = [(UIKBInputDelegateManager *)self selectableDelegate];
  double v12 = v11;
  if (!v11) {
    double v11 = v10;
  }
  [v11 insertText:v14];
  double v13 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v13 updateTextInputKeyboardSource];

  [(UIKBInputDelegateManager *)self setInsideKeyInputDelegateCall:0];
  -[UIKBInputDelegateManager _moveCurrentSelection:](self, "_moveCurrentSelection:", -[v14 length]);
}

- (void)unmarkText:(id)a3
{
  id v4 = a3;
  char v5 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v5 setShouldIgnoreTextInputChanges:1];

  id v6 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  id v7 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  double v8 = [v7 keyboardState];
  double v9 = [v8 documentState];
  double v10 = objc_msgSend(v9, "documentStateAfterSettingMarkedText:selectedRange:", v4, objc_msgSend(v4, "length"), 0);
  [v6 setDocumentState:v10];

  double v11 = [(UIKBInputDelegateManager *)self selectableDelegate];
  objc_msgSend(v11, "_setMarkedText:selectedRange:", v4, objc_msgSend(v4, "length"), 0);

  [(UIKBInputDelegateManager *)self unmarkText];
  id v12 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v12 setShouldIgnoreTextInputChanges:0];
}

- (void)handleClearWithInsertBeforeAdvance:(id)a3
{
  id v14 = a3;
  id v4 = [(UIKBInputDelegateManager *)self textInputDelegate];
  char v5 = [(UIKBInputDelegateManager *)self textInputDelegate];
  id v6 = [v5 beginningOfDocument];
  id v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
  double v8 = [v7 endOfDocument];
  double v9 = [v4 textRangeFromPosition:v6 toPosition:v8];

  double v10 = [(UIKBInputDelegateManager *)self textInputDelegate];
  double v11 = [v10 textInRange:v9];
  uint64_t v12 = [v11 length];

  if ([(UIKBInputDelegateManager *)self callShouldReplaceExtendedRange:v12 withText:v14 includeMarkedText:1])
  {
    double v13 = [(UIKBInputDelegateManager *)self textInputDelegate];
    [v13 replaceRange:v9 withText:v14];
  }
}

- (BOOL)callShouldReplaceExtendedRange:(int64_t)a3 withText:(id)a4 includeMarkedText:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  double v9 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    double v11 = [(UIKBInputDelegateManager *)self privateInputDelegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      double v13 = [(UIKBInputDelegateManager *)self privateInputDelegate];
      uint64_t v14 = [v13 selectionRange];
      uint64_t v16 = v15;
    }
    else
    {
      uint64_t v24 = objc_opt_class();
      double v13 = [(UIKBInputDelegateManager *)self textInputDelegate];
      id v25 = [v13 selectedTextRange];
      uint64_t v26 = [(UIKBInputDelegateManager *)self textInputDelegate];
      uint64_t v14 = [v24 rangeForTextRange:v25 document:v26];
      uint64_t v16 = v27;
    }
    if (v5)
    {
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = [(UIKBInputDelegateManager *)self textInputDelegate];
      uint64_t v30 = [v29 markedTextRange];
      BOOL v31 = [(UIKBInputDelegateManager *)self textInputDelegate];
      uint64_t v32 = [v28 rangeForTextRange:v30 document:v31];
      uint64_t v34 = v33;

      uint64_t v35 = v16;
      uint64_t v16 = v34;
    }
    else
    {
      uint64_t v35 = 0;
      uint64_t v32 = v14;
    }
    if (v16)
    {
      uint64_t v35 = v16;
      unint64_t v37 = v32;
    }
    else
    {
      unint64_t v37 = v14;
    }
    uint64_t v38 = v35 + a3;
    if (v37 >= a3) {
      int64_t v39 = a3;
    }
    else {
      int64_t v39 = v37;
    }
    unint64_t v40 = v37 - v39;
    uint64_t v41 = v39 + v35;
    if (a3 < 0)
    {
      unint64_t v42 = v37;
    }
    else
    {
      uint64_t v38 = v41;
      unint64_t v42 = v40;
    }
    if (v37 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v43 = v35;
    }
    else {
      uint64_t v43 = v38;
    }
    if (v37 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v44 = v42;
    }
    v45 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
    uint64_t v21 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
    char v36 = objc_msgSend(v45, "keyboardInput:shouldReplaceTextInRange:replacementText:", v21, v44, v43, v8);
    goto LABEL_29;
  }
  double v17 = [(UIKBInputDelegateManager *)self textInputDelegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    uint64_t v19 = [(UIKBInputDelegateManager *)self textInputDelegate];
    uint64_t v20 = v19;
    if (v5)
    {
      uint64_t v21 = [v19 markedTextRange];

      if ([v21 isEmpty])
      {
        id v22 = [(UIKBInputDelegateManager *)self textInputDelegate];
        uint64_t v23 = [v22 selectedTextRange];

        uint64_t v21 = (void *)v23;
      }
    }
    else
    {
      uint64_t v21 = [v19 selectedTextRange];

      [v21 isEmpty];
    }
    BOOL v47 = [(UIKBInputDelegateManager *)self textInputDelegate];
    uint64_t v48 = [v21 start];
    v45 = [v47 positionFromPosition:v48 offset:-a3];

    if (v45)
    {
      uint64_t v49 = [(UIKBInputDelegateManager *)self textInputDelegate];
      uint64_t v50 = [v21 end];
      uint64_t v51 = [v49 textRangeFromPosition:v45 toPosition:v50];

      if (!v51)
      {
        char v36 = 1;
        goto LABEL_30;
      }
      id v52 = [(UIKBInputDelegateManager *)self textInputDelegate];
      char v36 = [v52 shouldChangeTextInRange:v51 replacementText:v8];

      uint64_t v21 = (void *)v51;
    }
    else
    {
      char v36 = 1;
    }
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  char v36 = 1;
LABEL_31:

  return v36;
}

- (BOOL)callShouldDeleteBackwardWithCount:(unint64_t)a3
{
  BOOL v5 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v5 setShouldIgnoreTextInputChanges:1];

  id v6 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (a3 >= 2)
    {
      id v8 = [(UIKBInputDelegateManager *)self textInputDelegate];
      [v8 _extendCurrentSelection:-(int)a3];

      double v9 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
      char v10 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
      char v11 = [v9 keyboardInputShouldDelete:v10];

      char v12 = [(UIKBInputDelegateManager *)self textInputDelegate];
      [v12 _setCaretSelectionAtEndOfSelection];

      double v13 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
      [v13 syncDocumentStateToInputDelegate];
LABEL_16:

      goto LABEL_17;
    }
    double v13 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
    uint64_t v26 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
    char v27 = [v13 keyboardInputShouldDelete:v26];
LABEL_15:
    char v11 = v27;

    goto LABEL_16;
  }
  uint64_t v14 = [(UIKBInputDelegateManager *)self textInputDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    double v13 = [(UIKBInputDelegateManager *)self selectedTextRange];
    if ([v13 isEmpty])
    {
      uint64_t v16 = [(UIKBInputDelegateManager *)self textInputDelegate];
      double v17 = [v13 start];
      char v18 = [(UIKBInputDelegateManager *)self beginningOfDocument];
      uint64_t v19 = [v16 comparePosition:v17 toPosition:v18];

      if (v19)
      {
        uint64_t v20 = [(UIKBInputDelegateManager *)self textInputDelegate];
        uint64_t v21 = [v13 start];
        id v22 = [v20 positionFromPosition:v21 offset:-1];

        if (v22)
        {
          uint64_t v23 = [(UIKBInputDelegateManager *)self textInputDelegate];
          uint64_t v24 = [v13 end];
          uint64_t v25 = [v23 textRangeFromPosition:v22 toPosition:v24];

          double v13 = v23;
        }
        else
        {
          uint64_t v25 = 0;
        }

        double v13 = (void *)v25;
      }
    }
    if (!v13)
    {
      char v11 = 1;
      goto LABEL_16;
    }
    uint64_t v26 = [(UIKBInputDelegateManager *)self textInputDelegate];
    char v27 = [v26 shouldChangeTextInRange:v13 replacementText:&stru_1ED0E84C0];
    goto LABEL_15;
  }
  char v11 = 1;
LABEL_17:
  uint64_t v28 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v28 setShouldIgnoreTextInputChanges:0];

  return v11;
}

- (void)addTextAlternatives:(id)a3
{
  id v17 = a3;
  id v4 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

  if (v4)
  {
    BOOL v5 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    [v5 addTextAlternatives:v17];
  }
  id v6 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v6)
  {
    char v7 = [(UIKBInputDelegateManager *)self webInputDelegate];
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_14;
    }
    double v9 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    char v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (v10)
    {
      char v11 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        goto LABEL_14;
      }
      double v9 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      double v13 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];

      if (v13)
      {
        uint64_t v14 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
        char v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) == 0) {
          goto LABEL_14;
        }
        double v9 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      }
      else
      {
        double v9 = [(UIKBInputDelegateManager *)self privateInputDelegate];
      }
    }
  }
  uint64_t v16 = v9;
  [v9 addTextAlternatives:v17];

LABEL_14:
}

- (CGRect)visibleTextRect
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self asyncCapableInputDelegate];
  if (!v3
    || (id v4 = (void *)v3,
        [(UIKBInputDelegateManager *)self asyncCapableInputDelegate],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    uint64_t v25 = [(UIKBInputDelegateManager *)self textInputDelegate];
    if (v25
      && (uint64_t v26 = (void *)v25,
          [(UIKBInputDelegateManager *)self textInputDelegate],
          char v27 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v27,
          v26,
          (isKindOfClass & 1) != 0))
    {
      uint64_t v19 = [(UIKBInputDelegateManager *)self textInputDelegate];
      [v19 visibleTextRect];
    }
    else
    {
      [(UIKBInputDelegateManager *)self selectionClipRect];
      double x = v37.origin.x;
      double y = v37.origin.y;
      double width = v37.size.width;
      double height = v37.size.height;
      if (!CGRectIsNull(v37)) {
        goto LABEL_12;
      }
      uint64_t v19 = [(UIKBInputDelegateManager *)self textInputView];
      [v19 bounds];
    }
    double x = v29;
    double y = v30;
    double width = v31;
    double height = v32;
    goto LABEL_11;
  }
  char v7 = [(UIKBInputDelegateManager *)self asyncCapableInputDelegate];
  [v7 unobscuredContentRect];
  double x = v8;
  double y = v10;
  double width = v12;
  double height = v14;

  uint64_t v16 = [(UIKBInputDelegateManager *)self textInteractionAssistant];
  id v17 = [v16 view];
  int v18 = [v17 isEditing];

  if (v18)
  {
    uint64_t v19 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
    uint64_t v20 = [(UIKBInputDelegateManager *)self textInputView];
    objc_msgSend(v19, "subtractKeyboardFrameFromRect:inView:", v20, x, y, width, height);
    double x = v21;
    double y = v22;
    double width = v23;
    double height = v24;

LABEL_11:
  }
LABEL_12:
  double v33 = x;
  double v34 = y;
  double v35 = width;
  double v36 = height;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.double y = v34;
  result.origin.double x = v33;
  return result;
}

+ (_NSRange)rangeForTextRange:(id)a3 document:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    char v7 = [v5 beginningOfDocument];
    double v8 = [v6 start];
    id v4 = (id)[v5 offsetFromPosition:v7 toPosition:v8];

    double v9 = [v6 start];
    double v10 = [v6 end];

    uint64_t v11 = [v5 offsetFromPosition:v9 toPosition:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = (NSUInteger)v4;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (BOOL)shouldDeleteForward
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
  {
    uint64_t v19 = [(UIKBInputDelegateManager *)self textInputDelegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      uint64_t v16 = [(UIKBInputDelegateManager *)self selectedTextRange];
      if ([v16 isEmpty])
      {
        double v21 = [(UIKBInputDelegateManager *)self textInputDelegate];
        double v22 = [v16 end];
        double v23 = [(UIKBInputDelegateManager *)self endOfDocument];
        uint64_t v24 = [v21 comparePosition:v22 toPosition:v23];

        if (v24)
        {
          uint64_t v25 = [(UIKBInputDelegateManager *)self textInputDelegate];
          uint64_t v26 = [v16 end];
          char v27 = [v25 positionFromPosition:v26 offset:1];

          if (v27)
          {
            uint64_t v28 = [(UIKBInputDelegateManager *)self textInputDelegate];
            double v29 = [v16 start];
            uint64_t v30 = [v28 textRangeFromPosition:v29 toPosition:v27];

            uint64_t v16 = v28;
          }
          else
          {
            uint64_t v30 = 0;
          }

          uint64_t v16 = (void *)v30;
        }
      }
      if (!v16)
      {
        LOBYTE(v10) = 1;
        goto LABEL_17;
      }
      id v17 = [(UIKBInputDelegateManager *)self textInputDelegate];
      char v18 = [v17 shouldChangeTextInRange:v16 replacementText:&stru_1ED0E84C0];
LABEL_16:
      LOBYTE(v10) = v18;

LABEL_17:
      return v10;
    }
    goto LABEL_11;
  }
  id v5 = objc_opt_class();
  id v6 = [(UIKBInputDelegateManager *)self selectedTextRange];
  char v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
  uint64_t v8 = [v5 rangeForTextRange:v6 document:v7];
  BOOL v10 = v9;

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_11:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (v10) {
    goto LABEL_5;
  }
  uint64_t v11 = [(UIKBInputDelegateManager *)self textInputDelegate];
  NSUInteger v12 = [(UIKBInputDelegateManager *)self selectedTextRange];
  NSUInteger v13 = [v12 end];
  double v14 = [(UIKBInputDelegateManager *)self endOfDocument];
  uint64_t v15 = [v11 comparePosition:v13 toPosition:v14];

  BOOL v10 = 1;
  if (v15)
  {
LABEL_5:
    uint64_t v16 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
    id v17 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
    char v18 = objc_msgSend(v16, "keyboardInput:shouldReplaceTextInRange:replacementText:", v17, v8, v10, &stru_1ED0E84C0);
    goto LABEL_16;
  }
  return v10;
}

- (void)changedSelection
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
  if (v3)
  {
    char v4 = (void *)v3;
    id v5 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v8 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
      char v7 = [(UIKBInputDelegateManager *)self legacyInputDelegate];
      [v8 keyboardInputChangedSelection:v7];
    }
  }
}

- (BOOL)selectionIsEndOfWord
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self selectedTextRange];
  char v4 = v3;
  if (v3 && ([v3 _isRanged] & 1) == 0)
  {
    char v6 = [(UIKBInputDelegateManager *)self textInputDelegate];
    char v7 = [v4 start];
    id v8 = [v6 _rangeOfEnclosingWord:v7];

    if (v8)
    {
      BOOL v9 = [(UIKBInputDelegateManager *)self textInputDelegate];
      BOOL v10 = [v4 end];
      uint64_t v11 = [v8 end];
      if ([v9 comparePosition:v10 toPosition:v11])
      {
        BOOL v5 = 0;
      }
      else
      {
        NSUInteger v12 = [(UIKBInputDelegateManager *)self textInputDelegate];
        NSUInteger v13 = [v12 textInRange:v8];
        BOOL v5 = [v13 length] != 0;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)collapseSelectionAndAdjustByOffset:(int64_t)a3
{
  BOOL v5 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v5 setShouldIgnoreTextInputChanges:1];

  if (![(UIKBInputDelegateManager *)self hasAsyncCapableInputDelegate])
  {
    BOOL v9 = [(UIKBInputDelegateManager *)self selectedTextRange];
    BOOL v10 = [v9 end];

    if (a3 && v10)
    {
      uint64_t v11 = [(UIKBInputDelegateManager *)self textInputDelegate];
      NSUInteger v12 = [v11 positionFromPosition:v10 offset:a3];

      if (v12)
      {
        id v13 = v12;

        BOOL v10 = v13;
      }
    }
    else if (!v10)
    {
      goto LABEL_17;
    }
    double v14 = [(UIKBInputDelegateManager *)self textInputDelegate];
    uint64_t v15 = [v14 textRangeFromPosition:v10 toPosition:v10];

    if (v15)
    {
      [(UIKBInputDelegateManager *)self setSelectedTextRange:v15];
      uint64_t v16 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
      [v16 syncDocumentStateToInputDelegate];
    }
    goto LABEL_17;
  }
  char v6 = [(UIKBInputDelegateManager *)self webInputDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(UIKBInputDelegateManager *)self webInputDelegate];
  }
  else
  {
    id v17 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      id v8 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
    }
    else
    {
      uint64_t v19 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
      char v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0) {
        goto LABEL_18;
      }
      id v8 = [(UIKBInputDelegateManager *)self asyncWebKitInteractionDelegate];
    }
  }
  BOOL v10 = v8;
  [v8 moveByOffset:a3];
LABEL_17:

LABEL_18:
  id v21 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
  [v21 setShouldIgnoreTextInputChanges:0];
}

- (void)moveSelectionToEndOfWord
{
  id v17 = [(UIKBInputDelegateManager *)self selectedTextRange];
  if (v17)
  {
    uint64_t v3 = [(UIKBInputDelegateManager *)self textInputDelegate];
    char v4 = [v17 end];
    BOOL v5 = [v3 _rangeOfEnclosingWord:v4];

    if (v5)
    {
      char v6 = [(UIKBInputDelegateManager *)self textInputDelegate];
      char v7 = [v17 end];
      id v8 = [v5 end];
      uint64_t v9 = [v6 comparePosition:v7 toPosition:v8];

      if (v9 == -1)
      {
        BOOL v10 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
        [v10 setShouldIgnoreTextInputChanges:1];

        uint64_t v11 = [(UIKBInputDelegateManager *)self textInputDelegate];
        NSUInteger v12 = [v5 end];
        id v13 = [v5 end];
        double v14 = [v11 textRangeFromPosition:v12 toPosition:v13];
        [(UIKBInputDelegateManager *)self setSelectedTextRange:v14];

        uint64_t v15 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
        [v15 syncDocumentStateToInputDelegate];

        uint64_t v16 = [(UIKBInputDelegateManager *)self keyboardStateDelegate];
        [v16 setShouldIgnoreTextInputChanges:0];
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }
}

- (BOOL)selectionIsWord
{
  uint64_t v3 = [(UIKBInputDelegateManager *)self selectedTextRange];
  char v4 = [(UIKBInputDelegateManager *)self textInputDelegate];
  BOOL v5 = [v3 start];
  char v6 = [(UIKBInputDelegateManager *)self beginningOfDocument];
  if ([v4 comparePosition:v5 toPosition:v6])
  {
    char v7 = [(UIKBInputDelegateManager *)self textInputDelegate];
    id v8 = [v7 tokenizer];
    uint64_t v9 = [v3 start];
    int v10 = [v8 isPosition:v9 atBoundary:1 inDirection:1];

    if (!v10)
    {
      char v11 = 0;
      goto LABEL_9;
    }
  }
  else
  {
  }
  NSUInteger v12 = [(UIKBInputDelegateManager *)self textInputDelegate];
  id v13 = [v3 end];
  double v14 = [(UIKBInputDelegateManager *)self endOfDocument];
  if ([v12 comparePosition:v13 toPosition:v14])
  {
    uint64_t v15 = [(UIKBInputDelegateManager *)self textInputDelegate];
    uint64_t v16 = [v15 tokenizer];
    id v17 = [v3 end];
    char v11 = [v16 isPosition:v17 atBoundary:1 inDirection:0];
  }
  else
  {
    char v11 = 1;
  }

LABEL_9:
  return v11;
}

- (void)shiftKeyStateChangedFrom:(int)a3 to:(int)a4
{
  char v7 = [(UIKBInputDelegateManager *)self webInputDelegate];

  if (v7)
  {
    if (a3 == 3) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = a3 == 1;
    }
    if (a4 == 3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = a4 == 1;
    }
    if (v8 != v9)
    {
      id v18 = [(UIKBInputDelegateManager *)self webInputDelegate];
      [v18 shiftKeyStateChangedFromState:v8 toState:v9];
LABEL_27:
    }
  }
  else
  {
    int v10 = [(UIKBInputDelegateManager *)self asyncInputDelegate];

    if (!v10)
    {
      id v13 = [(UIKBInputDelegateManager *)self privateInputDelegate];
      char v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0) {
        return;
      }
      uint64_t v15 = [(UIKBInputDelegateManager *)self privateInputDelegate];
      if (a3 == 3) {
        unint64_t v16 = 0x10000;
      }
      else {
        unint64_t v16 = (unint64_t)(a3 == 1) << 17;
      }
      if (a4 == 3) {
        unint64_t v17 = 0x10000;
      }
      else {
        unint64_t v17 = (unint64_t)(a4 == 1) << 17;
      }
      id v18 = v15;
      [v15 modifierFlagsDidChangeFrom:v16 to:v17];
      goto LABEL_27;
    }
    if (a3 == 3) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = a3 == 1;
    }
    if (a4 == 3) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = a4 == 1;
    }
    if (v11 != v12)
    {
      id v18 = [(UIKBInputDelegateManager *)self asyncInputDelegate];
      [v18 shiftKeyStateChangedFrom:v11 to:v12];
      goto LABEL_27;
    }
  }
}

- (UIKeyboardImplStateProtocol)keyboardStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardStateDelegate);
  return (UIKeyboardImplStateProtocol *)WeakRetained;
}

- (void)setKeyboardStateDelegate:(id)a3
{
}

- (void)setKeyInputDelegate:(id)a3
{
}

- (void)setSelectableDelegate:(id)a3
{
}

- (BOOL)insideKeyInputDelegateCall
{
  return self->_insideKeyInputDelegateCall;
}

- (void)setInsideKeyInputDelegateCall:(BOOL)a3
{
  self->_insideKeyInputDelegateCall = a3;
}

- (void)setAsyncInputDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncInputDelegate, 0);
  objc_destroyWeak((id *)&self->_forwardingInputDelegate);
  objc_storeStrong((id *)&self->_selectableDelegate, 0);
  objc_storeStrong((id *)&self->_keyInputDelegate, 0);
  objc_destroyWeak((id *)&self->_keyboardStateDelegate);
}

@end