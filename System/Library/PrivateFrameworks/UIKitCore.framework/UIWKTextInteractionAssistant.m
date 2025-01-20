@interface UIWKTextInteractionAssistant
- (BOOL)containerAllowsSelection;
- (BOOL)containerAllowsSelectionTintOnly;
- (BOOL)containerIsAtom;
- (BOOL)containerIsBrowserView;
- (BOOL)overrideGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)overrideGestureRecognizerShouldBegin:(id)a3;
- (BOOL)requiresImmediateUpdate;
- (BOOL)shouldDelayActivatingSelectionView;
- (BOOL)shouldSuppressSelectionCommands;
- (BOOL)shouldTryReplacementsForText:(id)a3 withOptions:(unint64_t)a4;
- (BOOL)usesAsynchronousSelectionController;
- (BOOL)wantsLinkInteraction;
- (CGRect)caretBeforeTap;
- (Class)selectionInteractionClass;
- (NSString)wordBeforeTap;
- (UIWKTextInteractionAssistant)initWithView:(id)a3;
- (UIWKTextInteractionAssistantDelegate)delegate;
- (id)_asText;
- (id)alternativesForSelectedText;
- (id)asyncInteractionDelegate;
- (id)asyncTextInteractionDelegate;
- (id)asyncWebKitInteractionDelegate;
- (id)generatorForRange:(id)a3 withOptions:(unint64_t)a4;
- (id)textChecker;
- (id)webInteractionDelegate;
- (int64_t)currentCursorBehavior;
- (void)addGestureRecognizersToView:(id)a3;
- (void)beginSelectionChange;
- (void)changeSelectionWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 baseIsStart:(BOOL)a5 withFlags:(int64_t)a6;
- (void)dealloc;
- (void)didEndScrollingOverflow;
- (void)didEndSelectionInteraction;
- (void)endSelectionChange;
- (void)lookup:(id)a3 fromRect:(CGRect)a4;
- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5;
- (void)rangeSelectionCanceled;
- (void)rangeSelectionEnded:(CGPoint)a3;
- (void)rangeSelectionMoved:(CGPoint)a3 withTouchPoint:(CGPoint)a4;
- (void)rangeSelectionStarted:(CGPoint)a3;
- (void)scheduleChineseTransliterationForText:(id)a3;
- (void)scheduleReplacementsForText:(id)a3;
- (void)scheduleReplacementsForText:(id)a3 withOptions:(unint64_t)a4;
- (void)scheduleReplacementsWithOptions:(unint64_t)a3;
- (void)selectAll:(id)a3;
- (void)selectTextForReplacement:(id)a3 withOptions:(unint64_t)a4;
- (void)selectWord;
- (void)selectionChanged;
- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(int64_t)a6;
- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(int64_t)a5;
- (void)setCaretBeforeTap:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setShouldDelayActivatingSelectionView:(BOOL)a3;
- (void)setWordBeforeTap:(id)a3;
- (void)showDictionaryFor:(id)a3 fromRect:(CGRect)a4;
- (void)showReplacementsForText:(id)a3 withOptions:(unint64_t)a4;
- (void)showReplacementsForText:(id)a3 withOptions:(unint64_t)a4 rects:(id)a5;
- (void)showSelectionView;
- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4;
- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4;
- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4;
- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4;
- (void)textRangeAdjustmentInteraction:(id)a3 selectionMoved:(CGPoint)a4 withTouchPoint:(CGPoint)a5;
- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3;
- (void)translate:(id)a3 fromRect:(CGRect)a4;
- (void)updateActivatingSelectionView;
- (void)updateSelectionWithPoint:(CGPoint)a3;
- (void)updateWithMagnifierTerminalPoint:(BOOL)a3;
- (void)willBeginSelectionInteraction;
- (void)willChangeSelection;
- (void)willStartScrollingOverflow;
@end

@implementation UIWKTextInteractionAssistant

- (void)addGestureRecognizersToView:(id)a3
{
  if ([a3 isEditable]) {
    [(UIWKTextInteractionAssistant *)self textChecker];
  }
  v6.receiver = self;
  v6.super_class = (Class)UIWKTextInteractionAssistant;
  [(UITextInteractionAssistant *)&v6 addGestureRecognizersToView:a3];
  v5 = [(UITextInteractionAssistant *)self forcePressGesture];
  if (v5) {
    [(UIGestureRecognizer *)v5 setAllowedTouchTypes:&unk_1ED3F14B0];
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (UIWKTextInteractionAssistantDelegate *)a3;
}

- (UIWKTextInteractionAssistant)initWithView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWKTextInteractionAssistant;
  result = [(UITextInteractionAssistant *)&v5 initWithView:a3];
  if (result)
  {
    result->_selectionOperation = 0;
    result->_options = 0;
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    result->_caretBeforeTap.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    result->_caretBeforeTap.size = v4;
  }
  return result;
}

- (BOOL)usesAsynchronousSelectionController
{
  return 1;
}

- (BOOL)wantsLinkInteraction
{
  return 0;
}

- (Class)selectionInteractionClass
{
  return (Class)objc_opt_class();
}

- (int64_t)currentCursorBehavior
{
  return 2;
}

- (BOOL)containerIsBrowserView
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  [(UITextInteractionAssistant *)&v3 dealloc];
}

- (id)textChecker
{
  id result = self->_textChecker;
  if (!result)
  {
    id result = [[UITextChecker alloc] _initWithAsynchronousLoading:1];
    self->_textChecker = (UITextChecker *)result;
  }
  return result;
}

- (BOOL)overrideGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)overrideGestureRecognizerShouldBegin:(id)a3
{
  objc_msgSend(a3, "locationInView:", objc_msgSend(a3, "view"));
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = gestureTypeForGestureRecognizer(a3, objc_msgSend((id)objc_msgSend(a3, "view"), "isEditable"));
  if (objc_msgSend((id)objc_msgSend(a3, "view"), "conformsToProtocolCached:", &unk_1ED7009A0))
  {
    v10 = (UITextInput *)[a3 view];
    if ((unint64_t)(v9 - 1) > 9) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_186B9D7C8[v9 - 1];
    }
  }
  else
  {
    v12 = [(UITextInteractionAssistant *)self view];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return 0;
    }
    v10 = v12;
    uint64_t v11 = v9;
  }
  return -[UITextInput textInteractionGesture:shouldBeginAtPoint:](v10, "textInteractionGesture:shouldBeginAtPoint:", v11, v6, v8);
}

- (BOOL)containerIsAtom
{
  return 0;
}

- (BOOL)containerAllowsSelection
{
  return 1;
}

- (BOOL)containerAllowsSelectionTintOnly
{
  return 0;
}

- (void)scheduleChineseTransliterationForText:(id)a3
{
  if ([a3 length])
  {
    double v6 = objc_alloc_init(UITextReplacementGeneratorForChineseTransliteration);
    [(UITextReplacementGenerator *)v6 setReplacementRange:[(UITextSelection *)[(UITextInteractionAssistant *)self activeSelection] selectedRange]];
    [(UITextReplacementGenerator *)v6 setStringToReplace:a3];
    id v5 = [(UITextReplacementGeneratorForChineseTransliteration *)v6 replacements];
    if ([v5 count]) {
      -[UIKeyboardImpl replaceText:](+[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance"), "replaceText:", [v5 firstObject]);
    }
  }
}

- (void)scheduleReplacementsWithOptions:(unint64_t)a3
{
  if ((a3 & 0x10) != 0)
  {
    self->_options = a3;
    self->_selectionOperation = 3;
  }
  else
  {
    uint64_t v5 = [(UITextInput *)[(UITextInteractionAssistant *)self view] selectedText];
    [(UIWKTextInteractionAssistant *)self scheduleReplacementsForText:v5 withOptions:a3];
  }
}

- (void)scheduleReplacementsForText:(id)a3
{
}

- (BOOL)shouldTryReplacementsForText:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  LODWORD(v7) = objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "autocorrectSpellingEnabled");
  if (v7)
  {
    uint64_t v7 = [a3 length];
    if (v7)
    {
      LODWORD(v7) = objc_msgSend(-[UIWKTextInteractionAssistant textChecker](self, "textChecker"), "_doneLoading");
      if (v7)
      {
        if ((v4 & 7) == 0
          || (uint64_t v8 = objc_msgSend(-[UIWKTextInteractionAssistant textChecker](self, "textChecker"), "rangeOfMisspelledWordInString:range:startingAt:wrap:languages:", a3, 0, objc_msgSend(a3, "length"), 0, 0, +[UITextChecker keyboardLanguages](UITextChecker, "keyboardLanguages")), LOBYTE(v7) = 0, v8 != 0x7FFFFFFFFFFFFFFFLL))
        {
          LOBYTE(v7) = 1;
        }
      }
    }
  }
  return v7;
}

- (void)scheduleReplacementsForText:(id)a3 withOptions:(unint64_t)a4
{
  if (-[UIWKTextInteractionAssistant shouldTryReplacementsForText:withOptions:](self, "shouldTryReplacementsForText:withOptions:"))
  {
    [(UIWKTextInteractionAssistant *)self showReplacementsForText:a3 withOptions:a4];
  }
}

- (id)generatorForRange:(id)a3 withOptions:(unint64_t)a4
{
  if (objc_msgSend(a3, "isEqual:", -[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange")))
  {
    if (objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "autocorrectSpellingEnabled"))
    {
      uint64_t v7 = objc_alloc_init(UITextReplacementGeneratorForCorrections);
      [(UITextReplacementGenerator *)v7 setReplacementRange:[(UITextSelection *)[(UITextInteractionAssistant *)self activeSelection] selectedRange]];
      [(UITextReplacementGenerator *)v7 setStringToReplace:[(UITextInput *)[(UITextInteractionAssistant *)self view] selectedText]];
      [(UITextReplacementGeneratorForCorrections *)v7 setTextChecker:[(UIWKTextInteractionAssistant *)self textChecker]];
      [(UITextReplacementGeneratorForCorrections *)v7 setAutocorrectionRecord:[+[UIKeyboardImpl sharedInstance] autocorrectionRecordForWord:[(UITextInput *)[(UITextInteractionAssistant *)self view] selectedText]]];
      [(UITextReplacementGeneratorForCorrections *)v7 setMaxEditDistance:2];
      [(UITextReplacementGeneratorForCorrections *)v7 setMaxCountAfterAutocorrectionGuesses:1];
      id CurrentInputMode = UIKeyboardGetCurrentInputMode();
      if (UIKeyboardCheckSpellingForInputMode(CurrentInputMode)) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 0;
      }
      [(UITextReplacementGeneratorForCorrections *)v7 setMaxCountAfterSpellingGuesses:v9];
      [(UITextReplacementGeneratorForCorrections *)v7 setForceHistoryReplacement:(self->_options & 4) == 0];
      [(UITextReplacementGeneratorForCorrections *)v7 setForceAutocorrectionGuesses:(self->_options & 2) == 0];
      [(UITextReplacementGeneratorForCorrections *)v7 setForceSpellingGuesses:(self->_options & 1) == 0];
      return v7;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIWKTextInteractionAssistant;
    return [(UITextInteractionAssistant *)&v11 generatorForRange:a3 withOptions:a4];
  }
}

- (void)showReplacementsForText:(id)a3 withOptions:(unint64_t)a4
{
  if ((a4 & 0x20) != 0)
  {
    uint64_t v7 = [(UITextInteractionAssistant *)self _textChoicesAssistant];
    uint64_t v8 = [(UITextRange *)[(UITextSelection *)[(UITextInteractionAssistant *)self activeSelection] selectedRange] start];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke;
    v9[3] = &unk_1E530AD78;
    v9[4] = a3;
    v9[5] = self;
    v9[6] = a4;
    [(_UITextChoiceAccelerationAssistant *)v7 fullAutocorrectionForWord:a3 atPosition:v8 completionHandler:v9];
  }
  else
  {
    -[UIWKTextInteractionAssistant showReplacementsForText:withOptions:rects:](self, "showReplacementsForText:withOptions:rects:");
  }
}

uint64_t __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!a2) {
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v4 = [*(id *)(a1 + 40) webInteractionDelegate];
  uint64_t v5 = *(void **)(a1 + 40);
  if (v4)
  {
    double v6 = (void *)[v5 webInteractionDelegate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_2;
    v17[3] = &unk_1E530AD28;
    uint64_t v7 = *(void *)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    v17[5] = v2;
    v17[6] = v7;
    uint64_t v8 = v17;
  }
  else
  {
    uint64_t v9 = [v5 asyncInteractionDelegate];
    v10 = *(void **)(a1 + 40);
    if (!v9)
    {
      v13 = (void *)[v10 asyncWebKitInteractionDelegate];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_4;
      v15[3] = &unk_1E530AD50;
      uint64_t v14 = *(void *)(a1 + 48);
      v15[4] = *(void *)(a1 + 40);
      v15[5] = v2;
      v15[6] = v14;
      return [v13 requestAutocorrectionRectsForString:v2 withCompletionHandler:v15];
    }
    double v6 = (void *)[v10 asyncInteractionDelegate];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_3;
    v16[3] = &unk_1E530AD28;
    uint64_t v11 = *(void *)(a1 + 48);
    v16[4] = *(void *)(a1 + 40);
    v16[5] = v2;
    v16[6] = v11;
    uint64_t v8 = v16;
  }
  return [v6 requestTextRectsForString:v2 withCompletionHandler:v8];
}

uint64_t __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a2);
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F29238];
        [*(id *)(*((void *)&v11 + 1) + 8 * v8) rect];
        objc_msgSend(v4, "addObject:", objc_msgSend(v9, "valueWithCGRect:"));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [*(id *)(a1 + 32) showReplacementsForText:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) rects:v4];
}

uint64_t __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a2);
        }
        uint64_t v9 = (void *)MEMORY[0x1E4F29238];
        [*(id *)(*((void *)&v11 + 1) + 8 * v8) rect];
        objc_msgSend(v4, "addObject:", objc_msgSend(v9, "valueWithCGRect:"));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return [*(id *)(a1 + 32) showReplacementsForText:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) rects:v4];
}

uint64_t __68__UIWKTextInteractionAssistant_showReplacementsForText_withOptions___block_invoke_4(uint64_t a1, void *a2)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F29238];
    [a2 firstRect];
    v8[0] = objc_msgSend(v4, "valueWithCGRect:");
    uint64_t v5 = (void *)MEMORY[0x1E4F29238];
    [a2 lastRect];
    v8[1] = objc_msgSend(v5, "valueWithCGRect:");
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return [*(id *)(a1 + 32) showReplacementsForText:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) rects:v6];
}

- (void)showReplacementsForText:(id)a3 withOptions:(unint64_t)a4 rects:(id)a5
{
  BOOL v9 = (self->_options & 8) == 0;
  uint64_t v10 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"), 2);
  id v11 = [(UIWKTextInteractionAssistant *)self generatorForRange:[(UITextSelection *)[(UITextInteractionAssistant *)self activeSelection] selectedRange] withOptions:a4];
  double v12 = dbl_186B9D760[v9];
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    long long v13 = (void *)[v11 replacements];
    uint64_t v14 = [v13 count];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = v14;
      if (![v11 autocorrectionRecord]
        && ([v11 forceAutocorrectionGuesses] & 1) == 0
        && !v15)
      {
LABEL_11:
        [(_UITextChoiceAccelerationAssistant *)[(UITextInteractionAssistant *)self _textChoicesAssistant] dismissWithoutSelection];
        goto LABEL_12;
      }
      if (v15) {
        [(_UITextChoiceAccelerationAssistant *)[(UITextInteractionAssistant *)self _textChoicesAssistant] updateReplacements:v13 forCandidate:a3];
      }
    }
    else
    {
      [(_UITextChoiceAccelerationAssistant *)[(UITextInteractionAssistant *)self _textChoicesAssistant] updateReplacementsForSavedCandidate:a3];
    }
    if ([(_UITextChoiceAccelerationAssistant *)[(UITextInteractionAssistant *)self _textChoicesAssistant] presentTextChoicePromptForText:a3 delay:a5 autocorrectionRects:v12])
    {
      return;
    }
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v16 = [(UITextInteractionAssistant *)self _editMenuAssistant];
  [(_UITextInteractionEditMenuAssistant *)v16 showReplacementsWithGenerator:v11 forDictation:0 afterDelay:v12];
}

- (void)selectTextForReplacement:(id)a3 withOptions:(unint64_t)a4
{
  if (-[UIWKTextInteractionAssistant shouldTryReplacementsForText:withOptions:](self, "shouldTryReplacementsForText:withOptions:", a3))
  {
    [(UITextInteractionAssistant *)self view];
    self->_options = a4;
    self->_selectionOperation = 3;
    uint64_t v6 = [(UITextInteractionAssistant *)self view];
    [(UITextInput *)v6 selectWordForReplacement];
  }
}

- (BOOL)requiresImmediateUpdate
{
  return self->_selectionOperation == 0;
}

- (void)updateActivatingSelectionView
{
  if ([(UIWKTextInteractionAssistant *)self shouldDelayActivatingSelectionView])
  {
    [(UITextInteractionAssistant *)self activateSelection];
    [(UIWKTextInteractionAssistant *)self setShouldDelayActivatingSelectionView:0];
  }
}

- (void)selectionChanged
{
  [(UIWKTextInteractionAssistant *)self updateActivatingSelectionView];
  [+[UIKeyboardImpl sharedInstance] postInputResponderCapabilitiesChangedNotification];
  [(UITextInteractionAssistant *)self setExpectingCommit:0];
  v10.receiver = self;
  v10.super_class = (Class)UIWKTextInteractionAssistant;
  [(UITextInteractionAssistant *)&v10 selectionChanged];
  if (objc_msgSend((id)-[UITextInput selectedTextRange](-[UITextInteractionAssistant view](self, "view"), "selectedTextRange"), "isEmpty"))-[UITextInteractionAssistant setGrabberSuppressionAssertion:](self, "setGrabberSuppressionAssertion:", 0); {
  objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "updateShiftStateAfterAsyncSelectionChange");
  }
  int64_t selectionOperation = self->_selectionOperation;
  if (selectionOperation == 3)
  {
    self->_options &= ~0x10uLL;
    int v4 = [(UITextInput *)[(UITextInteractionAssistant *)self view] conformsToProtocol:&unk_1ED7009A0];
    uint64_t v5 = [(UITextInteractionAssistant *)self view];
    int v6 = [(UITextInput *)v5 isReplaceAllowed];
    if (v4)
    {
      if (!v6) {
        goto LABEL_15;
      }
      uint64_t v7 = v5;
    }
    else
    {
      if (!v6) {
        goto LABEL_15;
      }
      uint64_t v7 = [(UITextInteractionAssistant *)self view];
    }
    [(UIWKTextInteractionAssistant *)self showReplacementsForText:[(UITextInput *)v7 selectedText] withOptions:self->_options];
    goto LABEL_15;
  }
  if (!selectionOperation)
  {
    [(UITextInteractionAssistant *)self scrollSelectionToVisible];
    goto LABEL_18;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__UIWKTextInteractionAssistant_selectionChanged__block_invoke;
  v9[3] = &unk_1E530ADA0;
  v9[4] = self;
  if (qword_1EB25E990 != -1) {
    dispatch_once(&qword_1EB25E990, &__block_literal_global_566);
  }
  uint64_t v8 = [+[UIKeyboardImpl sharedInstance] taskQueue];
  [(UIKeyboardTaskQueue *)v8 addTask:v9 breadcrumb:_MergedGlobals_15_5];
LABEL_15:
  if (self->_selectionOperation == 1) {
    [(UITextInteractionAssistant *)self scrollSelectionToVisible];
  }
  self->_int64_t selectionOperation = 0;
LABEL_18:
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
}

uint64_t __48__UIWKTextInteractionAssistant_selectionChanged__block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) endSelectionChange];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_editMenuAssistant"), "showSelectionCommandsAfterDelay:", 0.2);
  return [a2 returnExecutionToParent];
}

uint64_t __48__UIWKTextInteractionAssistant_selectionChanged__block_invoke_2()
{
  uint64_t result = [&__block_literal_global_348_0 copy];
  _MergedGlobals_15_5 = result;
  return result;
}

uint64_t __48__UIWKTextInteractionAssistant_selectionChanged__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)_asText
{
  uint64_t v2 = [(UITextInteractionAssistant *)self view];
  return (id)[(UITextInput *)v2 _proxyTextInput];
}

- (void)showSelectionView
{
  [(UITextInteractionAssistant *)self activateSelection];
  [(UIWKTextInteractionAssistant *)self setShouldDelayActivatingSelectionView:0];
}

- (id)alternativesForSelectedText
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(UITextInteractionAssistant *)self view];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  if ([(UITextInput *)[(UITextInteractionAssistant *)self view] conformsToProtocolCached:&unk_1ED7009A0])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    int v4 = (void *)[(UITextInput *)[(UITextInteractionAssistant *)self view] alternativesForSelectedText];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "_nsTextAlternative"));
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
  else
  {
    objc_msgSend(v3, "addObjectsFromArray:", -[UITextInput alternativesForSelectedText](-[UITextInteractionAssistant view](self, "view"), "alternativesForSelectedText"));
  }
  return v3;
}

- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(int64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  if ([(UIKeyboardTaskQueue *)[+[UIKeyboardImpl sharedInstance] taskQueue] isMainThreadExecutingTask])
  {
    switch(a4)
    {
      case 0:
        id v13 = +[UITextMagnifierCaret sharedCaretMagnifier];
        switch(a5)
        {
          case 1:
            [(UITextInteractionAssistant *)self configureForHighlightMode];
            if ([(UITextInteractionAssistant *)self willHandoffLoupeMagnifier])
            {
              [(UITextInteractionAssistant *)self resetWillHandoffLoupeMagnifier];
            }
            else
            {
              uint64_t v48 = [(UITextInput *)[(UITextInteractionAssistant *)self view] textInputView];
              v49 = [(UITextInteractionAssistant *)self view];
              double v50 = *MEMORY[0x1E4F1DAD8];
              double v51 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
              objc_msgSend(v13, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v48, v49, 1, x, y, v50, v51);
            }
            break;
          case 2:
            goto LABEL_47;
          case 3:
            UIDistanceBetweenPointAndRect(x, y, self->_caretBeforeTap.origin.x, self->_caretBeforeTap.origin.y, self->_caretBeforeTap.size.width, self->_caretBeforeTap.size.height);
            double v43 = v42;
            double v44 = _UIGetTextRefinement_NearCaretDistance();
            char v45 = [(UITextInput *)[(UITextInteractionAssistant *)self view] isFirstResponder];
            objc_msgSend(v13, "setMagnificationPoint:", x, y);
            v46 = [(UITextInteractionAssistant *)self activeSelection];
            if (v43 >= v44
              && ![(UITextRange *)[(UITextSelection *)v46 selectedRange] _isRanged])
            {
              [(UITextInteractionAssistant *)self configureForSelectionMode];
            }
            if (![(UITextInteractionAssistant *)self willHandoffLoupeMagnifier]) {
              [v13 stopMagnifying:1];
            }
            [(UIWKTextInteractionAssistant *)self endSelectionChange];
            [(UITextInteractionAssistant *)self cancelAutoscroll];
            if ((v45 & 1) == 0
              && ![(UITextInteractionAssistant *)self willHandoffLoupeMagnifier])
            {
              [(UITextInteractionAssistant *)self setGestureRecognizers];
            }
            break;
          case 4:
            [(UIWKTextInteractionAssistant *)self endSelectionChange];
            [(UITextInteractionAssistant *)self cancelAutoscroll];
            break;
          default:
            return;
        }
        return;
      case 1:
        uint64_t v14 = [(UITextInteractionAssistant *)self activeSelection];
        if (-[UITextInput isFirstResponder](-[UITextInteractionAssistant view](self, "view"), "isFirstResponder"))int v15 = objc_msgSend((id)-[UITextInput _responderWindow](-[UITextInteractionAssistant view](self, "view"), "_responderWindow"), "_isApplicationKeyWindow"); {
        else
        }
          int v15 = 0;
        [(_UITextInteractionEditMenuAssistant *)[(UITextInteractionAssistant *)self _editMenuAssistant] _editMenuIsVisibleOrDismissedRecently];
        UIDistanceBetweenPointAndRect(x, y, self->_caretBeforeTap.origin.x, self->_caretBeforeTap.origin.y, self->_caretBeforeTap.size.width, self->_caretBeforeTap.size.height);
        double v25 = v24;
        double v26 = _UIGetTextRefinement_NearCaretDistance();
        [(UIWKTextInteractionAssistant *)self endSelectionChange];
        id v27 = [(UIWKTextInteractionAssistant *)self alternativesForSelectedText];
        if (!objc_msgSend((id)-[UITextInput selectedText](-[UITextInteractionAssistant view](self, "view"), "selectedText"), "compare:", self->_wordBeforeTap)&& -[UITextRange _isRanged](-[UITextSelection selectedRange](v14, "selectedRange"), "_isRanged"))
        {
          v28 = 0;
          int v29 = 0;
          if ([(_UITextInteractionEditMenuAssistant *)[(UITextInteractionAssistant *)self _editMenuAssistant] _hasTextReplacements])
          {
            double v30 = 0.4;
            v31 = 0;
            goto LABEL_37;
          }
          v31 = 0;
LABEL_86:
          [(_UITextInteractionEditMenuAssistant *)[(UITextInteractionAssistant *)self _editMenuAssistant] hideSelectionCommands];
          goto LABEL_97;
        }
        v32 = (void *)[(UITextInput *)[(UITextInteractionAssistant *)self view] selectedText];
        v31 = v32;
        if ((a6 & 1) != 0 && [v32 length])
        {
          v28 = objc_msgSend(-[UIWKTextInteractionAssistant textChecker](self, "textChecker"), "grammarAlternativesForString:", v31);
          int v33 = 1;
        }
        else
        {
          int v33 = 0;
          v28 = 0;
        }
        double v30 = 0.2;
        if ([v28 count])
        {
          int v29 = 0;
        }
        else if (v15 {
               && (v25 < v26
        }
                || ([(UITextSelection *)v14 caretRect],
                    v60.origin.double x = v38,
                    v60.origin.double y = v39,
                    v60.size.width = v40,
                    v60.size.height = v41,
                    CGRectEqualToRect(self->_caretBeforeTap, v60))))
        {
          int v29 = 0;
          double v30 = 0.4;
        }
        else
        {
          int v29 = a6 & v33;
          if (![v27 count]) {
            goto LABEL_86;
          }
        }
LABEL_37:
        if (![v27 count]) {
          id v27 = (id)[v28 mutableCopy];
        }
        if (![v27 count]) {
          goto LABEL_96;
        }
        int v34 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v27, "firstObject"), "alternativeStrings"), "containsObject:", 0x1ED1450A0);
        if ((v34 & 1) == 0)
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v27, "firstObject"), "alternativeStrings"), "containsObject:", 0x1ED145080))
          {
            int v35 = 0;
            int v36 = 0;
            int v37 = 1;
            goto LABEL_89;
          }
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v27, "firstObject"), "alternativeStrings"), "containsObject:", 0x1ED1450C0))
          {
            int v36 = 0;
            int v37 = 0;
            int v35 = 1;
            goto LABEL_89;
          }
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v27, "firstObject"), "alternativeStrings"), "containsObject:", 0x1ED1450E0))
          {
            int v35 = 0;
            int v37 = 0;
            int v36 = 1;
            goto LABEL_89;
          }
          v55 = -[UITextReplacementGeneratorForDictation initWithAlternatives:stringToReplace:replacementRange:]([UITextReplacementGeneratorForDictation alloc], "initWithAlternatives:stringToReplace:replacementRange:", [v27 firstObject], v31, -[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange"));
          [(_UITextInteractionEditMenuAssistant *)[(UITextInteractionAssistant *)self _editMenuAssistant] showReplacementsWithGenerator:v55 forDictation:1 afterDelay:v30];
        }
        int v35 = 0;
        int v36 = 0;
        int v37 = 0;
LABEL_89:
        self->_options = 8;
        self->_int64_t selectionOperation = 0;
        [(UITextInput *)[(UITextInteractionAssistant *)self view] selectWordForReplacement];
        if (v35)
        {
          [+[UIDictationController sharedInstance] handleWKActionMoveAfter];
        }
        else if (v36)
        {
          [+[UIDictationController sharedInstance] handleWKActionMoveBefore];
        }
        else
        {
          if (!v37)
          {
            int v29 = 0;
            if (!v34) {
              goto LABEL_97;
            }
            goto LABEL_96;
          }
          objc_msgSend((id)objc_msgSend(+[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance"), "inputDelegateManager"), "deleteBackward");
        }
        int v29 = 0;
        if ((v34 & 1) == 0)
        {
LABEL_97:
          v52 = (void *)[(UITextInput *)[(UITextInteractionAssistant *)self view] selectedTextRange];
          if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled]&& v52)
          {
            v53 = [(UITextInteractionAssistant *)self _textChoicesAssistant];
            uint64_t v54 = [v52 start];
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke_4;
            v56[3] = &unk_1E530ADF0;
            char v57 = v29;
            v56[4] = self;
            v56[5] = v31;
            [(_UITextChoiceAccelerationAssistant *)v53 shouldShowPromptForWebKitText:v31 atPosition:v54 completionHandler:v56];
          }
          else
          {
            [(UIWKTextInteractionAssistant *)self setWordBeforeTap:0];
            if (v29)
            {
              [(UIWKTextInteractionAssistant *)self selectTextForReplacement:v31 withOptions:15];
            }
          }
          return;
        }
LABEL_96:
        [(_UITextInteractionEditMenuAssistant *)[(UITextInteractionAssistant *)self _editMenuAssistant] showSelectionCommandsAfterDelay:v30];
        goto LABEL_97;
      case 2:
        id v16 = +[UITextMagnifierRanged sharedRangedMagnifier];
        v17 = v16;
        switch(a5)
        {
          case 1:
            objc_msgSend(v16, "setIsHorizontal:", +[UITextSelectionRect startIsHorizontal:](UITextSelectionRect, "startIsHorizontal:", -[UITextSelection selectionRects](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectionRects")));
            uint64_t v18 = [(UITextInput *)[(UITextInteractionAssistant *)self view] textInputView];
            v19 = [(UITextInteractionAssistant *)self view];
            objc_msgSend(v17, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v18, v19, 1, x, y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
            [(UIWKTextInteractionAssistant *)self endSelectionChange];
            [(UITextSelection *)[(UITextInteractionAssistant *)self activeSelection] setRangedSelectionBaseToCurrentSelection];
            [(UITextSelection *)[(UITextInteractionAssistant *)self activeSelection] clearRangedSelectionInitialExtent];
            goto LABEL_4;
          case 2:
            objc_msgSend(v16, "setMagnificationPoint:", x, y);
            -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
            [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
            v47 = [(UITextInteractionAssistant *)self activeSelection];
            -[UITextSelection updateBaseIsStartWithDocumentPoint:](v47, "updateBaseIsStartWithDocumentPoint:", x, y);
            return;
          case 3:
            [(UITextInteractionAssistant *)self cancelAutoscroll];
            objc_msgSend(v17, "setMagnificationPoint:", x, y);
            [v17 stopMagnifying:1];
            if (!-[UITextRange _isRanged](-[UITextSelection selectedRange](-[UITextInteractionAssistant activeSelection](self, "activeSelection"), "selectedRange"), "_isRanged"))[v17 stopMagnifying:1]; {
            goto LABEL_75;
            }
          case 4:
            [(UITextInteractionAssistant *)self cancelAutoscroll];
LABEL_75:
            [(UITextInteractionAssistant *)self setNeedsSelectionDisplayUpdate];
            break;
          default:
            return;
        }
        return;
      case 8:
      case 9:
      case 10:
        [(UIWKTextInteractionAssistant *)self endSelectionChange];
        [(_UITextInteractionEditMenuAssistant *)[(UITextInteractionAssistant *)self _editMenuAssistant] showSelectionCommands];
        goto LABEL_4;
      case 11:
LABEL_4:
        [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
        return;
      case 14:
        id v20 = +[UIKeyboardImpl activeInstance];
        if ((a6 & 4) != 0) {
          [v20 didChangePhraseBoundary];
        }
        id v21 = +[UITextMagnifierRanged sharedRangedMagnifier];
        id v13 = v21;
        if ((unint64_t)(a5 - 3) < 2)
        {
          if (v21)
          {
            objc_msgSend(v21, "setMagnificationPoint:", x, y);
            [v13 stopMagnifying:1];
          }
          [(UITextCursorAssertion *)self->_blinkAssertion invalidate];

          self->_blinkAssertion = 0;
          objc_msgSend((id)objc_msgSend(-[UIWKTextInteractionAssistant _asText](self, "_asText"), "inputDelegate"), "selectionDidChange:", -[UIWKTextInteractionAssistant _asText](self, "_asText"));
          [(UITextInteractionAssistant *)self cancelAutoscroll];
          [(UITextInteractionAssistant *)self setInGesture:0];
        }
        else if (a5 == 2)
        {
LABEL_47:
          -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
          objc_msgSend(v13, "setMagnificationPoint:", x, y);
        }
        else if (a5 == 1)
        {
          objc_msgSend(v21, "setMagnificationPoint:", x, y);
          uint64_t v22 = objc_msgSend(-[UIWKTextInteractionAssistant _asText](self, "_asText"), "textInputView");
          id v23 = [(UIWKTextInteractionAssistant *)self _asText];
          objc_msgSend(v13, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v22, v23, 1, x, y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
          [(UITextInteractionAssistant *)self setInGesture:1];
          self->_blinkAssertion = (UITextCursorAssertion *)[(UITextCursorAssertionController *)[(UITextInteractionAssistant *)self _assertionController] nonBlinkingAssertionWithReason:@"WebKit2 Phrase Boundary gesture"];
        }
        return;
      default:
        return;
    }
  }
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke;
  v58[3] = &unk_1E530ADC8;
  v58[4] = self;
  *(double *)&v58[5] = x;
  *(double *)&v58[6] = y;
  v58[7] = a4;
  v58[8] = a5;
  v58[9] = a6;
  if (qword_1EB25E9A0 != -1) {
    dispatch_once(&qword_1EB25E9A0, &__block_literal_global_351_4);
  }
  long long v12 = [+[UIKeyboardImpl sharedInstance] taskQueue];
  [(UIKeyboardTaskQueue *)v12 addTask:v58 breadcrumb:qword_1EB25E998];
}

uint64_t __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "selectionChangedWithGestureAt:withGesture:withState:withFlags:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48));
  return [a2 returnExecutionToParent];
}

uint64_t __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke_2()
{
  uint64_t result = [&__block_literal_global_353_1 copy];
  qword_1EB25E998 = result;
  return result;
}

uint64_t __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __94__UIWKTextInteractionAssistant_selectionChangedWithGestureAt_withGesture_withState_withFlags___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) selectTextForReplacement:*(void *)(a1 + 40) withOptions:32];
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 setWordBeforeTap:0];
  }
  else
  {
    int v5 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_textChoicesAssistant"), "dismissWithoutSelection");
    uint64_t result = [*(id *)(a1 + 32) setWordBeforeTap:0];
    if (v5)
    {
      uint64_t v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      return [v6 selectTextForReplacement:v7 withOptions:15];
    }
  }
  return result;
}

- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(int64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  if ((a5 & 2) != 0) {
    [(UITextRangeAdjustmentInteraction *)[(UITextInteractionAssistant *)self rangeAdjustmentInteraction] setBaseIsStart:[(UITextRangeAdjustmentInteraction *)[(UITextInteractionAssistant *)self rangeAdjustmentInteraction] baseIsStart] ^ 1];
  }
  if ((unint64_t)(a4 - 3) < 3)
  {
    [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
    [(UITextInteractionAssistant *)self cancelAutoscroll];
    +[UIView commitAnimations];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke_4;
    int v15 = &unk_1E530ADA0;
    id v16 = self;
    if (qword_1EB25E9C0 != -1) {
      dispatch_once(&qword_1EB25E9C0, &__block_literal_global_369_1);
    }
    BOOL v9 = [+[UIKeyboardImpl sharedInstance] taskQueue];
    uint64_t v10 = qword_1EB25E9B8;
    long long v11 = &v12;
LABEL_15:
    [(UIKeyboardTaskQueue *)v9 addTask:v11 breadcrumb:v10];
    return;
  }
  if (a4 == 2)
  {
    [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
    [(UITextInteractionAssistant *)self cancelAutoscroll];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke;
    v17[3] = &unk_1E530ADA0;
    v17[4] = self;
    if (qword_1EB25E9B0 != -1) {
      dispatch_once(&qword_1EB25E9B0, &__block_literal_global_362_1);
    }
    BOOL v9 = [+[UIKeyboardImpl sharedInstance] taskQueue];
    uint64_t v10 = qword_1EB25E9A8;
    long long v11 = v17;
    goto LABEL_15;
  }
  if (a4 == 1)
  {
    -[UITextInteractionAssistant startAutoscroll:](self, "startAutoscroll:", x, y);
    [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
  }
}

uint64_t __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) endSelectionChange];
  return [a2 returnExecutionToParent];
}

uint64_t __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke_2()
{
  uint64_t result = [&__block_literal_global_364_1 copy];
  qword_1EB25E9A8 = result;
  return result;
}

uint64_t __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke_4(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) endSelectionChange];
  return [a2 returnExecutionToParent];
}

uint64_t __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke_5()
{
  uint64_t result = [&__block_literal_global_371_2 copy];
  qword_1EB25E9B8 = result;
  return result;
}

uint64_t __89__UIWKTextInteractionAssistant_selectionChangedWithTouchAt_withSelectionTouch_withFlags___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(UITextInteractionAssistant *)self activeSelection];
  uint64_t v7 = objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "rangeView");
  objc_msgSend(v7, "convertPoint:toView:", -[UITextInput textInputView](-[UITextInteractionAssistant view](self, "view"), "textInputView"), x, y);
  double v9 = v8;
  double v11 = v10;
  [(UITextSelection *)v6 setGranularity:0];
  uint64_t v12 = -[UITextSelection setRangedSelectionExtentPoint:baseIsStart:](v6, "setRangedSelectionExtentPoint:baseIsStart:", [v7 baseIsStart], v9, v11);
  [(UITextSelection *)v6 commit];
  if (v12 != [v7 baseIsStart]) {
    [v7 setBaseIsStart:v12];
  }
  [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
}

- (void)updateWithMagnifierTerminalPoint:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "rangeView");
  id v6 = +[UITextMagnifierRanged sharedRangedMagnifier];
  if ([v6 target])
  {
    if ((![v6 terminalPointPlacedCarefully]
       || [(UITextInteractionAssistant *)self autoscrolled])
      && [(UITextInteractionAssistant *)self _legacySelectionView])
    {
      [(UIWKTextInteractionAssistant *)self beginSelectionChange];
      [v5 setAnimateUpdate:1];
      objc_msgSend((id)objc_msgSend(v5, "startGrabber"), "setAnimating:", 1);
      objc_msgSend((id)objc_msgSend(v5, "endGrabber"), "setAnimating:", 1);
      +[UIView beginAnimations:0 context:self];
      +[UIView setAnimationDuration:0.2];
      +[UIView setAnimationCurve:2];
      +[UIView setAnimationDelegate:self];
      +[UIView setAnimationDidStopSelector:sel_selectionAnimationDidStop_finished_];
      int v7 = [v6 horizontalMovement];
      uint64_t v8 = 4;
      if (v7 >= 0) {
        uint64_t v8 = 5;
      }
      if (v7 <= 0) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 3;
      }
      [v5 updateBaseAndExtentPointsFromEdges];
      [v5 extentPoint];
      objc_msgSend(v5, "convertPoint:toView:", -[UITextInput textInputView](-[UITextInteractionAssistant view](self, "view"), "textInputView"), v10, v11);
      objc_msgSend(v6, "setAnimationPoint:");
      [v6 animationPoint];
      double v13 = v12;
      double v15 = v14;
    }
    else
    {
      if (!v3)
      {
LABEL_17:
        [v6 stopMagnifying:1];
        if (![(_UITextInteractionEditMenuAssistant *)[(UITextInteractionAssistant *)self _editMenuAssistant] _editMenuIsVisible])[(_UITextInteractionEditMenuAssistant *)[(UITextInteractionAssistant *)self _editMenuAssistant] showSelectionCommandsAfterDelay:0.2]; {
        [(UITextInteractionAssistant *)self notifyKeyboardSelectionChanged];
        }
        return;
      }
      [v6 terminalPoint];
      objc_msgSend(v6, "setMagnificationPoint:");
      [v5 activeTouchPoint];
      [v6 terminalPoint];
      double v13 = v16;
      double v15 = v17;
      uint64_t v9 = 5;
    }
    -[UIWKTextInteractionAssistant changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](self, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", v9, [v5 baseIsStart], 0, v13, v15);
    goto LABEL_17;
  }
  [v6 stopMagnifying:0];
}

- (void)rangeSelectionStarted:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[UITextInteraction _callDelegateWillMoveTextRangeExtentAtPoint:]([(UITextInteractionAssistant *)self interactions], "_callDelegateWillMoveTextRangeExtentAtPoint:", a3.x, a3.y);
  [(UITextSelection *)[(UITextInteractionAssistant *)self activeSelection] setGranularity:0];
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view"), "convertPoint:fromView:", objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "rangeView"), x, y);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__UIWKTextInteractionAssistant_rangeSelectionStarted___block_invoke;
  v9[3] = &unk_1E530AE18;
  v9[4] = self;
  void v9[5] = v6;
  v9[6] = v7;
  if (qword_1EB25E9D0 != -1) {
    dispatch_once(&qword_1EB25E9D0, &__block_literal_global_375_2);
  }
  uint64_t v8 = [+[UIKeyboardImpl sharedInstance] taskQueue];
  [(UIKeyboardTaskQueue *)v8 addTask:v9 breadcrumb:qword_1EB25E9C8];
}

uint64_t __54__UIWKTextInteractionAssistant_rangeSelectionStarted___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) beginSelectionChange];
  objc_msgSend(*(id *)(a1 + 32), "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 0, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_legacySelectionView"), "rangeView"), "baseIsStart"), 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  return [a2 returnExecutionToParent];
}

uint64_t __54__UIWKTextInteractionAssistant_rangeSelectionStarted___block_invoke_2()
{
  uint64_t result = [&__block_literal_global_377_1 copy];
  qword_1EB25E9C8 = result;
  return result;
}

uint64_t __54__UIWKTextInteractionAssistant_rangeSelectionStarted___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)rangeSelectionEnded:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (objc_msgSend(+[UITextMagnifierRanged sharedRangedMagnifier](UITextMagnifierRanged, "sharedRangedMagnifier"), "target"))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__UIWKTextInteractionAssistant_rangeSelectionEnded___block_invoke;
    v11[3] = &unk_1E530ADA0;
    v11[4] = self;
    if (qword_1EB25E9E0 != -1) {
      dispatch_once(&qword_1EB25E9E0, &__block_literal_global_379_3);
    }
    uint64_t v6 = [+[UIKeyboardImpl sharedInstance] taskQueue];
    [(UIKeyboardTaskQueue *)v6 addTask:v11 breadcrumb:qword_1EB25E9D8];
  }
  else
  {
    uint64_t v7 = [(UITextInteractionAssistant *)self _editMenuAssistant];
    if (![(_UITextInteractionEditMenuAssistant *)v7 _editMenuIsVisible]) {
      [(_UITextInteractionEditMenuAssistant *)v7 showSelectionCommands];
    }
    uint64_t v8 = [(UITextInteractionAssistant *)self rangeAdjustmentInteraction];
    uint64_t v9 = [(UITextInteractionAssistant *)self view];
    uint64_t v10 = [(UITextRangeAdjustmentInteraction *)v8 baseIsStart];
    -[UITextInput changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](v9, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 5, v10, 0, x, y);
  }
}

uint64_t __52__UIWKTextInteractionAssistant_rangeSelectionEnded___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) updateWithMagnifierTerminalPoint:1];
  return [a2 returnExecutionToParent];
}

uint64_t __52__UIWKTextInteractionAssistant_rangeSelectionEnded___block_invoke_2()
{
  uint64_t result = [&__block_literal_global_381_4 copy];
  qword_1EB25E9D8 = result;
  return result;
}

uint64_t __52__UIWKTextInteractionAssistant_rangeSelectionEnded___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)rangeSelectionMoved:(CGPoint)a3 withTouchPoint:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = [(UITextInteractionAssistant *)self rangeAdjustmentInteraction];
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view"), "convertPoint:fromView:", objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "rangeView"), x, y);
  double v9 = v8;
  double v11 = v10;
  double v12 = [(UITextInteractionAssistant *)self view];
  uint64_t v13 = [(UITextRangeAdjustmentInteraction *)v7 baseIsStart];
  -[UITextInput changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](v12, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 1, v13, 0, v9, v11);
}

- (void)rangeSelectionCanceled
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__UIWKTextInteractionAssistant_rangeSelectionCanceled__block_invoke;
  v3[3] = &unk_1E530ADA0;
  v3[4] = self;
  if (qword_1EB25E9F0 != -1) {
    dispatch_once(&qword_1EB25E9F0, &__block_literal_global_383_1);
  }
  uint64_t v2 = [+[UIKeyboardImpl sharedInstance] taskQueue];
  [(UIKeyboardTaskQueue *)v2 addTask:v3 breadcrumb:qword_1EB25E9E8];
}

uint64_t __54__UIWKTextInteractionAssistant_rangeSelectionCanceled__block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) beginSelectionChange];
  return [a2 returnExecutionToParent];
}

uint64_t __54__UIWKTextInteractionAssistant_rangeSelectionCanceled__block_invoke_2()
{
  uint64_t result = [&__block_literal_global_385_2 copy];
  qword_1EB25E9E8 = result;
  return result;
}

uint64_t __54__UIWKTextInteractionAssistant_rangeSelectionCanceled__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)selectWord
{
  self->_int64_t selectionOperation = 1;
  [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
  [(UITextInteractionAssistant *)self configureForSelectionMode];
  if (qword_1EB25EA00 != -1) {
    dispatch_once(&qword_1EB25EA00, &__block_literal_global_387_3);
  }
  BOOL v3 = [+[UIKeyboardImpl sharedInstance] taskQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__UIWKTextInteractionAssistant_selectWord__block_invoke_3;
  v4[3] = &unk_1E530ADA0;
  v4[4] = self;
  [(UIKeyboardTaskQueue *)v3 addTask:v4 breadcrumb:qword_1EB25E9F8];
}

uint64_t __42__UIWKTextInteractionAssistant_selectWord__block_invoke()
{
  uint64_t result = [&__block_literal_global_389_2 copy];
  qword_1EB25E9F8 = result;
  return result;
}

uint64_t __42__UIWKTextInteractionAssistant_selectWord__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __42__UIWKTextInteractionAssistant_selectWord__block_invoke_3(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) beginSelectionChange];
  return [a2 returnExecutionToParent];
}

- (void)selectAll:(id)a3
{
  self->_int64_t selectionOperation = 2;
  [(UITextInteractionAssistant *)self setFirstResponderIfNecessary];
  if (qword_1EB25EA10 != -1) {
    dispatch_once(&qword_1EB25EA10, &__block_literal_global_391_3);
  }
  int v4 = [+[UIKeyboardImpl sharedInstance] taskQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__UIWKTextInteractionAssistant_selectAll___block_invoke_3;
  v5[3] = &unk_1E530ADA0;
  v5[4] = self;
  [(UIKeyboardTaskQueue *)v4 addTask:v5 breadcrumb:qword_1EB25EA08];
}

uint64_t __42__UIWKTextInteractionAssistant_selectAll___block_invoke()
{
  uint64_t result = [&__block_literal_global_393_0 copy];
  qword_1EB25EA08 = result;
  return result;
}

uint64_t __42__UIWKTextInteractionAssistant_selectAll___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __42__UIWKTextInteractionAssistant_selectAll___block_invoke_3(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) beginSelectionChange];
  return [a2 returnExecutionToParent];
}

- (void)showDictionaryFor:(id)a3 fromRect:(CGRect)a4
{
  int v5 = (_UITextServiceSession *)(id)[(UITextInput *)[(UITextInteractionAssistant *)self view] _showServiceForType:2 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, [(UITextInteractionAssistant *)self view], a4.origin.x, a4.origin.y, a4.size.width, a4.size.height)];
  self->_definitionSession = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__UIWKTextInteractionAssistant_showDictionaryFor_fromRect___block_invoke;
  v6[3] = &unk_1E530AE40;
  v6[4] = self;
  [(_UITextServiceSession *)v5 setDismissedHandler:v6];
}

void __59__UIWKTextInteractionAssistant_showDictionaryFor_fromRect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 352) = 0;
}

- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)[(_UITextServiceSession *)self->_learnSession dismissTextServiceAnimated:0]; {
  double v10 = (_UITextServiceSession *)(id)[(UITextInput *)[(UITextInteractionAssistant *)self view] _showServiceForType:4 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, [(UITextInteractionAssistant *)self view], x, y, width, height)];
  }
  self->_learnSession = v10;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__UIWKTextInteractionAssistant_showTextServiceFor_fromRect___block_invoke;
  v11[3] = &unk_1E530AE40;
  v11[4] = self;
  [(_UITextServiceSession *)v10 setDismissedHandler:v11];
}

UIUserInterfaceIdiom __60__UIWKTextInteractionAssistant_showTextServiceFor_fromRect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 360) = 0;
  UIUserInterfaceIdiom result = [+[UIDevice currentDevice] userInterfaceIdiom];
  if ((result & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    BOOL v3 = (void *)[*(id *)(a1 + 32) view];
    return [v3 becomeFirstResponder];
  }
  return result;
}

- (BOOL)shouldSuppressSelectionCommands
{
  if (self->_shareSession
    || self->_learnSession
    || self->_definitionSession
    || self->_lookupSession
    || self->_translateSession)
  {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  return [(UITextInteractionAssistant *)&v3 shouldSuppressSelectionCommands];
}

- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if (([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1)[(_UITextServiceSession *)self->_shareSession dismissTextServiceAnimated:0]; {
  double v10 = (_UITextServiceSession *)(id)[(UITextInput *)[(UITextInteractionAssistant *)self view] _showServiceForType:8 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, [(UITextInteractionAssistant *)self view], x, y, width, height)];
  }
  self->_shareSession = v10;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__UIWKTextInteractionAssistant_showShareSheetFor_fromRect___block_invoke;
  v11[3] = &unk_1E530AE40;
  v11[4] = self;
  [(_UITextServiceSession *)v10 setDismissedHandler:v11];
}

UIUserInterfaceIdiom __59__UIWKTextInteractionAssistant_showShareSheetFor_fromRect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 368) = 0;
  UIUserInterfaceIdiom result = [+[UIDevice currentDevice] userInterfaceIdiom];
  if ((result & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    objc_super v3 = (void *)[*(id *)(a1 + 32) view];
    return [v3 becomeFirstResponder];
  }
  return result;
}

- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5
{
  uint64_t v6 = (_UITextServiceSession *)(id)[(UITextInput *)[(UITextInteractionAssistant *)self view] _showServiceForType:16 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withRange:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withRange:withView:", a3, a4.location, a4.length, [(UITextInteractionAssistant *)self view], a5.origin.x, a5.origin.y, a5.size.width, a5.size.height)];
  self->_lookupSession = v6;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UIWKTextInteractionAssistant_lookup_withRange_fromRect___block_invoke;
  v7[3] = &unk_1E530AE40;
  v7[4] = self;
  [(_UITextServiceSession *)v6 setDismissedHandler:v7];
}

void __58__UIWKTextInteractionAssistant_lookup_withRange_fromRect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 376) = 0;
}

- (void)lookup:(id)a3 fromRect:(CGRect)a4
{
  int v5 = (_UITextServiceSession *)(id)[(UITextInput *)[(UITextInteractionAssistant *)self view] _showServiceForType:16 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, [(UITextInteractionAssistant *)self view], a4.origin.x, a4.origin.y, a4.size.width, a4.size.height)];
  self->_lookupSession = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__UIWKTextInteractionAssistant_lookup_fromRect___block_invoke;
  v6[3] = &unk_1E530AE40;
  v6[4] = self;
  [(_UITextServiceSession *)v5 setDismissedHandler:v6];
}

void __48__UIWKTextInteractionAssistant_lookup_fromRect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 376) = 0;
}

- (void)translate:(id)a3 fromRect:(CGRect)a4
{
  int v5 = (_UITextServiceSession *)(id)[(UITextInput *)[(UITextInteractionAssistant *)self view] _showServiceForType:32 withContext:+[_UITextServiceSessionContext sessionContextWithText:withRect:withView:](_UITextServiceSessionContext, "sessionContextWithText:withRect:withView:", a3, [(UITextInteractionAssistant *)self view], a4.origin.x, a4.origin.y, a4.size.width, a4.size.height)];
  self->_translateSession = v5;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__UIWKTextInteractionAssistant_translate_fromRect___block_invoke;
  v6[3] = &unk_1E530AE40;
  v6[4] = self;
  [(_UITextServiceSession *)v5 setDismissedHandler:v6];
}

void __51__UIWKTextInteractionAssistant_translate_fromRect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 384) = 0;
}

- (void)willStartScrollingOverflow
{
  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  [(UITextInteractionAssistant *)&v3 willStartScrollingOrZooming];
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    [(UITextSelectionDisplayInteraction *)[(UITextInteractionAssistant *)self _selectionViewManager] setActivated:0];
  }
  else
  {
    objc_msgSend(-[UITextInteractionAssistant _selectionView](self, "_selectionView"), "setVisible:", 0);
  }
}

- (void)didEndScrollingOverflow
{
  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  [(UITextInteractionAssistant *)&v3 didEndScrollingOrZooming];
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    if (![(UIWKTextInteractionAssistant *)self shouldSuppressSelectionCommands]) {
      [(UITextSelectionDisplayInteraction *)[(UITextInteractionAssistant *)self _selectionViewManager] setActivated:1];
    }
  }
  else
  {
    objc_msgSend(-[UITextInteractionAssistant _legacySelectionView](self, "_legacySelectionView"), "setVisible:", 1);
  }
}

- (void)willChangeSelection
{
  p_caretBeforeTap = &self->_caretBeforeTap;
  [(_UIKeyboardTextSelectionController *)[(UITextInteractionAssistant *)self activeSelectionController] caretRectForCursorPosition];
  p_caretBeforeTap->origin.double x = v3;
  p_caretBeforeTap->origin.double y = v4;
  p_caretBeforeTap->size.double width = v5;
  p_caretBeforeTap->size.double height = v6;
}

- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(UITextSelectionDisplayInteraction *)[(UITextInteractionAssistant *)self _selectionViewManager] _didBeginRangeAdjustmentInteraction:a3];
  -[UITextInteraction _callDelegateWillMoveTextRangeExtentAtPoint:]([(UITextInteractionAssistant *)self interactions], "_callDelegateWillMoveTextRangeExtentAtPoint:", x, y);
  [(UITextSelection *)[(UITextInteractionAssistant *)self activeSelection] setGranularity:0];
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view"), "convertPoint:fromView:", [a3 view], x, y);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __79__UIWKTextInteractionAssistant_textRangeAdjustmentInteraction_didBeginAtPoint___block_invoke;
  double v14 = &unk_1E530AE68;
  uint64_t v17 = v8;
  uint64_t v18 = v9;
  double v15 = self;
  id v16 = a3;
  if (qword_1EB25EA20 != -1) {
    dispatch_once(&qword_1EB25EA20, &__block_literal_global_403_1);
  }
  double v10 = [+[UIKeyboardImpl sharedInstance] taskQueue];
  [(UIKeyboardTaskQueue *)v10 addTask:&v11 breadcrumb:qword_1EB25EA18];
}

uint64_t __79__UIWKTextInteractionAssistant_textRangeAdjustmentInteraction_didBeginAtPoint___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) beginSelectionChange];
  objc_msgSend(*(id *)(a1 + 32), "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 0, objc_msgSend(*(id *)(a1 + 40), "baseIsStart"), 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  return [a2 returnExecutionToParent];
}

uint64_t __79__UIWKTextInteractionAssistant_textRangeAdjustmentInteraction_didBeginAtPoint___block_invoke_2()
{
  uint64_t result = [&__block_literal_global_405_1 copy];
  qword_1EB25EA18 = result;
  return result;
}

uint64_t __79__UIWKTextInteractionAssistant_textRangeAdjustmentInteraction_didBeginAtPoint___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)textRangeAdjustmentInteraction:(id)a3 selectionMoved:(CGPoint)a4 withTouchPoint:(CGPoint)a5
{
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view", a4.x, a4.y, a5.x, a5.y), "convertPoint:fromView:", [a3 view], a4.x, a4.y);
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [a3 baseIsStart];
  -[UIWKTextInteractionAssistant changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](self, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 1, v11, 0, v8, v10);
}

- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(UITextSelectionDisplayInteraction *)[(UITextInteractionAssistant *)self _selectionViewManager] _didEndRangeAdjustmentInteraction:a3];
  double v8 = [(UITextInteractionAssistant *)self _editMenuAssistant];
  -[UITextInput convertPoint:fromView:](-[UITextInteractionAssistant view](self, "view"), "convertPoint:fromView:", [a3 view], x, y);
  double v10 = v9;
  double v12 = v11;
  if (![(_UITextInteractionEditMenuAssistant *)v8 _editMenuIsVisible]) {
    [(_UITextInteractionEditMenuAssistant *)v8 showSelectionCommands];
  }
  uint64_t v13 = [a3 baseIsStart];
  -[UIWKTextInteractionAssistant changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](self, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", 5, v13, 0, v10, v12);
}

- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__UIWKTextInteractionAssistant_textRangeAdjustmentInteractionWasCancelled___block_invoke;
  v4[3] = &unk_1E530ADA0;
  v4[4] = self;
  if (qword_1EB25EA30 != -1) {
    dispatch_once(&qword_1EB25EA30, &__block_literal_global_407_0);
  }
  CGFloat v3 = [+[UIKeyboardImpl sharedInstance] taskQueue];
  [(UIKeyboardTaskQueue *)v3 addTask:v4 breadcrumb:qword_1EB25EA28];
}

uint64_t __75__UIWKTextInteractionAssistant_textRangeAdjustmentInteractionWasCancelled___block_invoke(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) beginSelectionChange];
  return [a2 returnExecutionToParent];
}

uint64_t __75__UIWKTextInteractionAssistant_textRangeAdjustmentInteractionWasCancelled___block_invoke_2()
{
  uint64_t result = [&__block_literal_global_409_0 copy];
  qword_1EB25EA28 = result;
  return result;
}

uint64_t __75__UIWKTextInteractionAssistant_textRangeAdjustmentInteractionWasCancelled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)webInteractionDelegate
{
  if (![(UITextInput *)[(UITextInteractionAssistant *)self view] conformsToProtocolCached:&unk_1ED7009A0])return 0; {
  return [(UITextInteractionAssistant *)self view];
  }
}

- (id)asyncWebKitInteractionDelegate
{
  if (![(UITextInput *)[(UITextInteractionAssistant *)self view] conformsToProtocolCached:&unk_1ED700D60])return 0; {
  return [(UITextInteractionAssistant *)self view];
  }
}

- (id)asyncInteractionDelegate
{
  if (![(UITextInput *)[(UITextInteractionAssistant *)self view] conformsToProtocolCached:&unk_1ED700940])return 0; {
  return [(UITextInteractionAssistant *)self view];
  }
}

- (id)asyncTextInteractionDelegate
{
  return self->_delegate;
}

- (void)beginSelectionChange
{
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    CGFloat v3 = [(UIWKTextInteractionAssistant *)self delegate];
    [(UIWKTextInteractionAssistantDelegate *)v3 selectionWillChange:self];
  }
  else
  {
    CGFloat v4 = [(UITextInteractionAssistant *)self view];
    [(UITextInput *)v4 beginSelectionChange];
  }
}

- (void)endSelectionChange
{
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    CGFloat v3 = [(UIWKTextInteractionAssistant *)self delegate];
    [(UIWKTextInteractionAssistantDelegate *)v3 selectionDidChange:self];
  }
  else
  {
    CGFloat v4 = [(UITextInteractionAssistant *)self view];
    [(UITextInput *)v4 endSelectionChange];
  }
}

- (void)willBeginSelectionInteraction
{
  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  [(UITextInteractionAssistant *)&v3 willBeginSelectionInteraction];
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled])
  {
    if ([(UIWKTextInteractionAssistant *)self delegate]) {
      [(UIWKTextInteractionAssistantDelegate *)[(UIWKTextInteractionAssistant *)self delegate] selectionWillChange:self];
    }
  }
}

- (void)didEndSelectionInteraction
{
  if (+[UIKBInputDelegateManager isAsyncTextInputEnabled]&& [(UIWKTextInteractionAssistant *)self delegate])
  {
    [(UIWKTextInteractionAssistantDelegate *)[(UIWKTextInteractionAssistant *)self delegate] selectionDidChange:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)UIWKTextInteractionAssistant;
  [(UITextInteractionAssistant *)&v3 didEndSelectionInteraction];
}

- (void)changeSelectionWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 baseIsStart:(BOOL)a5 withFlags:(int64_t)a6
{
  BOOL v7 = a5;
  double y = a3.y;
  double x = a3.x;
  int v12 = [(UITextInput *)[(UITextInteractionAssistant *)self view] conformsToProtocolCached:&unk_1ED7009A0];
  uint64_t v13 = [(UITextInteractionAssistant *)self view];
  if (v12)
  {
    if ((unint64_t)a4 >= 5) {
      int64_t v14 = 5;
    }
    else {
      int64_t v14 = a4;
    }
    -[UITextInput adjustSelectionBoundaryToPoint:touchPhase:baseIsStart:flags:](v13, "adjustSelectionBoundaryToPoint:touchPhase:baseIsStart:flags:", v14, v7, a6, x, y);
  }
  else
  {
    [(UITextInput *)v13 conformsToProtocolCached:&unk_1ED700940];
    double v15 = [(UITextInteractionAssistant *)self view];
    -[UITextInput changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:](v15, "changeSelectionWithTouchAt:withSelectionTouch:baseIsStart:withFlags:", a4, v7, a6, x, y);
  }
}

- (NSString)wordBeforeTap
{
  return self->_wordBeforeTap;
}

- (void)setWordBeforeTap:(id)a3
{
}

- (CGRect)caretBeforeTap
{
  double x = self->_caretBeforeTap.origin.x;
  double y = self->_caretBeforeTap.origin.y;
  double width = self->_caretBeforeTap.size.width;
  double height = self->_caretBeforeTap.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCaretBeforeTap:(CGRect)a3
{
  self->_caretBeforeTap = a3;
}

- (BOOL)shouldDelayActivatingSelectionView
{
  return self->_shouldDelayActivatingSelectionView;
}

- (void)setShouldDelayActivatingSelectionView:(BOOL)a3
{
  self->_shouldDelayActivatingSelectionView = a3;
}

- (UIWKTextInteractionAssistantDelegate)delegate
{
  return self->_delegate;
}

@end