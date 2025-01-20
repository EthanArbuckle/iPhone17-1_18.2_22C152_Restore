@interface TSDTextInputResponder
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResignFirstResponder;
- (BOOL)hasText;
- (BOOL)isResigning;
- (BOOL)isSecureTextEntry;
- (BOOL)p_currentEditorIsNotOnMyCanvas;
- (BOOL)p_didEnterUITextInput;
- (BOOL)p_isExecutingUITextInput;
- (BOOL)p_requiresFirstResponderChangeForEditor:(id)a3;
- (BOOL)p_resignFirstResponder;
- (BOOL)p_wantRawArrowKeys;
- (BOOL)resignFirstResponder;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)firstRectForRange:(id)a3;
- (NSDictionary)markedTextStyle;
- (TSDTextInput)editor;
- (TSDTextInputResponder)initWithNextResponder:(id)a3;
- (UITextInputDelegate)inputDelegate;
- (UITextInputTokenizer)tokenizer;
- (UITextPosition)beginningOfDocument;
- (UITextPosition)endOfDocument;
- (UITextRange)markedTextRange;
- (UITextRange)selectedTextRange;
- (UIView)textInputView;
- (_NSRange)_nsrangeForTextRange:(id)a3;
- (_NSRange)_selectedNSRange;
- (float)preferredEndPosition;
- (float)preferredStartPosition;
- (id)_textRangeFromNSRange:(_NSRange)a3;
- (id)characterRangeAtPoint:(CGPoint)a3;
- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4;
- (id)closestPositionToPoint:(CGPoint)a3;
- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4;
- (id)editingTextRep;
- (id)editingTextReps;
- (id)inputAccessoryView;
- (id)inputView;
- (id)keyCommands;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)nextResponder;
- (id)p_ICC;
- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5;
- (id)positionFromPosition:(id)a3 offset:(int64_t)a4;
- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4;
- (id)selectionRectsForRange:(id)a3;
- (id)superview;
- (id)textInRange:(id)a3;
- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4;
- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)_indexForTextPosition:(id)a3;
- (int64_t)autocorrectionType;
- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4;
- (int64_t)comparePosition:(id)a3 toPosition:(id)a4;
- (int64_t)keyboardType;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4;
- (int64_t)returnKeyType;
- (void)acceptAutocorrection;
- (void)beginIgnoringKeyboardInput;
- (void)cancelDelayedResponderChange;
- (void)clearEditorAndResignFirstResponder;
- (void)customAction6:(id)a3;
- (void)customAction7:(id)a3;
- (void)customAction8:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)editorDidChangeSelection:(id)a3;
- (void)editorDidChangeSelection:(id)a3 withFlags:(unint64_t)a4;
- (void)endIgnoringKeyboardInput;
- (void)forceDelayedResponderChange;
- (void)forwardInvocation:(id)a3;
- (void)insertDictationResult:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)p_didUndoRedoChangeNotification:(id)a3;
- (void)p_editorSelectionWasForciblyChangedNotification:(id)a3;
- (void)p_editorWillClearSelectionNotification:(id)a3;
- (void)p_editorWillHandleTapNotification:(id)a3;
- (void)p_editorWillStyleTextNotification:(id)a3;
- (void)p_finishDynamicOperation:(id)a3;
- (void)p_setEditor:(id)a3;
- (void)p_setFirstResponder:(id)a3;
- (void)p_setFirstResponderAfterDelay;
- (void)p_setFirstResponderAndEditor:(id)a3;
- (void)p_setFirstResponderAndEditorAfterDelay;
- (void)p_setSelectedTextRange:(id)a3;
- (void)p_startDynamicOperation:(id)a3;
- (void)p_textChanged;
- (void)p_unmarkText;
- (void)p_willExitUITextInput;
- (void)p_willShowPopoverNotification:(id)a3;
- (void)p_willUndoChangeNotification:(id)a3;
- (void)replaceRange:(id)a3 withText:(id)a4;
- (void)resumeEditing;
- (void)selectAll:(id)a3;
- (void)setEditor:(id)a3;
- (void)setInputDelegate:(id)a3;
- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4;
- (void)setPreferredEndPosition:(float)a3;
- (void)setPreferredStartPosition:(float)a3;
- (void)setSelectedTextRange:(id)a3;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)unmarkText;
@end

@implementation TSDTextInputResponder

- (int64_t)keyboardType
{
  return 0;
}

- (TSDTextInputResponder)initWithNextResponder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSDTextInputResponder;
  v4 = [(TSDTextInputResponder *)&v9 init];
  if (v4)
  {
    v4->_nextResponder = (UIResponder *)a3;
    v4->_preferredEndPosition = NAN;
    v4->_preferredStartPosition = NAN;
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorSelectionWasForciblyChangedNotification_, @"TSDEditorControllerSelectionWasForciblyChanged", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorWillClearSelectionNotification_, @"TSDEditorControllerTextEditorWillClearSelection", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorWillStyleTextNotification_, @"TSDEditorControllerTextEditorWillStyleText", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorWillHandleTapNotification_, @"TSDEditorControllerTextEditorWillHandleTap", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_editorDidInsertTextNotification_, @"TSDEditorControllerTextEditorDidInsertText", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_willShowPopoverNotification_, @"TSKPopoverControllerWillShowPopoverNotification", 0);
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v4 selector:sel_p_willUndoChangeNotification_ name:*MEMORY[0x263F08650] object:0];
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v4 selector:sel_p_didUndoRedoChangeNotification_ name:*MEMORY[0x263F08638] object:0];
    v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v4 selector:sel_p_didUndoRedoChangeNotification_ name:*MEMORY[0x263F08630] object:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_startDynamicOperation_, @"TSDEditorControllerTextEditorStartDynamicOperation", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v4, sel_p_finishDynamicOperation_, @"TSDEditorControllerTextEditorFinishDynamicOperation", 0);
  }
  return v4;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  v3.receiver = self;
  v3.super_class = (Class)TSDTextInputResponder;
  [(TSDTextInputResponder *)&v3 dealloc];
}

- (BOOL)isResigning
{
  return self->_isResigning;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (void)p_setEditor:(id)a3
{
  if (a3 && self->_editor == a3)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDTextInputResponder p_setEditor:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 241, @"Editor validation should have happened through the public setEditor method.");
  }
  id v12 = [(TSDTextInputResponder *)self inputView];
  [(TSDTextInputResponder *)self willChangeValueForKey:@"inputView"];
  v7 = self->_editor;
  self->_editor = (TSDTextInput *)a3;
  if (objc_opt_respondsToSelector()) {
    char v8 = objc_opt_respondsToSelector();
  }
  else {
    char v8 = 0;
  }
  self->_editorRespondsToRawArrowKeySelectors = v8 & 1;
  if (!a3)
  {
    if (![(TSDTextInputResponder *)self p_isExecutingUITextInput])
    {
      [objc_loadWeak((id *)&self->_inputDelegate) selectionWillChange:self];
      [objc_loadWeak((id *)&self->_inputDelegate) selectionDidChange:self];
    }
    [(TSDTextInputResponder *)self p_textChanged];
  }
  [(TSDTextInputResponder *)self didChangeValueForKey:@"inputView"];
  id v9 = [(TSDTextInputResponder *)self inputView];
  if (self->_editor) {
    BOOL v10 = v9 == v12;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (v9 && ([v9 frame], v11 == 0.0))
    {
      [(TSDTextInputResponder *)self performSelector:sel_reloadInputViews withObject:0 afterDelay:0.0];
    }
    else
    {
      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_reloadInputViews object:0];
      [(TSDTextInputResponder *)self reloadInputViews];
    }
  }
}

- (BOOL)p_requiresFirstResponderChangeForEditor:(id)a3
{
  char v4 = [(TSDTextInputResponder *)self isFirstResponder];
  return v4 ^ [a3 wantsKeyboard];
}

- (void)p_setFirstResponderAfterDelay
{
  self->_pendingFirstResponderObject = 0;
}

- (void)p_setFirstResponder:(id)a3
{
  if (!-[TSDTextInputResponder p_requiresFirstResponderChangeForEditor:](self, "p_requiresFirstResponderChangeForEditor:"))return; {
  int v5 = [a3 wantsKeyboard];
  }
  id v6 = [(TSDTextInputResponder *)self p_ICC];
  if (v5)
  {
    [v6 delegate];
    v7 = (void *)TSUProtocolCast();
    if ((objc_opt_respondsToSelector() & 1) == 0 || [v7 allowTextEditingToBegin])
    {
      char v8 = self;
LABEL_14:
      [(TSDTextInputResponder *)v8 becomeFirstResponder];
      return;
    }
  }
  nextResponder = self->_nextResponder;
  if (nextResponder)
  {
    while (![(UIResponder *)nextResponder canBecomeFirstResponder])
    {
      nextResponder = [(UIResponder *)nextResponder nextResponder];
      if (!nextResponder) {
        goto LABEL_10;
      }
    }
    char v8 = (TSDTextInputResponder *)nextResponder;
    goto LABEL_14;
  }
LABEL_10:

  [(TSDTextInputResponder *)self p_resignFirstResponder];
}

- (void)p_setFirstResponderAndEditor:(id)a3
{
  self->_pendingEditorChange = 0;

  self->_pendingEditor = 0;
  if (a3 && [a3 wantsKeyboard])
  {
    [(TSDTextInputResponder *)self p_setEditor:a3];
    [(TSDTextInputResponder *)self p_setFirstResponder:a3];
  }
  else
  {
    [(TSDTextInputResponder *)self p_setFirstResponder:a3];
    [(TSDTextInputResponder *)self p_setEditor:a3];
  }
}

- (void)p_setFirstResponderAndEditorAfterDelay
{
  if (!self->_pendingEditorChange)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDTextInputResponder p_setFirstResponderAndEditorAfterDelay]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 378, @"Unexpectedly being asked to update the first responder when there's nothing to switch to.");
  }
  self->_pendingEditorChange = 0;
  int v5 = self->_pendingEditor;
  [(TSDTextInputResponder *)self p_setFirstResponderAndEditor:v5];
}

- (void)setEditor:(id)a3
{
  [(TSDTextInputResponder *)self cancelDelayedResponderChange];

  self->_pendingEditor = 0;
  self->_pendingEditorChange = 0;
  if (self->_editor != a3)
  {
    if (self->_isResigning
      || ![(TSDTextInputResponder *)self p_requiresFirstResponderChangeForEditor:a3])
    {
      [(TSDTextInputResponder *)self p_setEditor:a3];
    }
    else if ([(TSDTextInputResponder *)self isFirstResponder] {
           && ([a3 wantsKeyboard] & 1) == 0)
    }
    {
      self->_pendingEditor = (TSDTextInput *)a3;
      self->_pendingEditorChange = 1;
      [(TSDTextInputResponder *)self performSelector:sel_p_setFirstResponderAndEditorAfterDelay withObject:0 afterDelay:0.25];
    }
    else
    {
      [(TSDTextInputResponder *)self p_setFirstResponderAndEditor:a3];
    }
  }
}

- (void)beginIgnoringKeyboardInput
{
}

- (void)endIgnoringKeyboardInput
{
  if ((int)atomic_fetch_add(&self->_ignoreKeyboardInputCount, 0xFFFFFFFF) <= 0)
  {
    v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"-[TSDTextInputResponder endIgnoringKeyboardInput]"];
    uint64_t v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"];
    [v2 handleFailureInFunction:v3 file:v4 lineNumber:430 description:@"Unbalanced calls to -beginIgnoringKeyboardInput and -endIgnoringKeyboardInput"];
  }
}

- (void)clearEditorAndResignFirstResponder
{
  [(TSDTextInputResponder *)self acceptAutocorrection];

  self->_editor = 0;

  [(TSDTextInputResponder *)self p_setFirstResponder:0];
}

- (void)resumeEditing
{
}

- (void)cancelDelayedResponderChange
{
  self->_pendingFirstResponderObject = 0;

  self->_pendingEditor = 0;
  self->_pendingEditorChange = 0;
}

- (void)forceDelayedResponderChange
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_p_setFirstResponderAfterDelay object:0];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_p_setFirstResponderAndEditorAfterDelay object:0];
  self->_pendingFirstResponderObject = 0;
  if (self->_pendingEditorChange)
  {
    [(TSDTextInputResponder *)self p_setFirstResponderAndEditorAfterDelay];
  }
}

- (id)editingTextReps
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!self->_editor) {
    return 0;
  }
  id v3 = [(TSDTextInputResponder *)self nextResponder];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  do
  {
    objc_opt_class();
    int v5 = (void *)TSUDynamicCast();
    uint64_t v6 = [v4 nextResponder];
    uint64_t v4 = (void *)v6;
    if (v5) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v6 == 0;
    }
  }
  while (!v7);
  if (!v5) {
    return v5;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "controller", 0), "canvas"), "allReps");
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v9) {
    return 0;
  }
  uint64_t v10 = v9;
  int v5 = 0;
  uint64_t v11 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if ([v13 canEditWithEditor:self->_editor])
      {
        if (!v5) {
          int v5 = (void *)[MEMORY[0x263EFF9C0] set];
        }
        [v5 addObject:v13];
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v10);
  return v5;
}

- (id)editingTextRep
{
  id v2 = [(TSDTextInputResponder *)self editingTextReps];

  return (id)[v2 anyObject];
}

- (void)acceptAutocorrection
{
  if (!self->_inDynamicOperation && [(TSDTextInputResponder *)self autocorrectionType] != 1)
  {
    if (![(TSDTextInputResponder *)self p_isExecutingUITextInput])
    {
      [objc_loadWeak((id *)&self->_inputDelegate) selectionWillChange:self];
      [objc_loadWeak((id *)&self->_inputDelegate) selectionDidChange:self];
    }
    [(TSDTextInput *)self->_editor clearMarkedRange];
    [(TSDTextInputResponder *)self p_textChanged];
  }
}

- (id)nextResponder
{
  return self->_nextResponder;
}

- (BOOL)canBecomeFirstResponder
{
  return self->_editor != 0;
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)TSDTextInputResponder;
  BOOL v3 = [(TSDTextInputResponder *)&v5 becomeFirstResponder];
  if (v3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDTextInputResponderDidBecomeFirstResponder", self);
  }
  return v3;
}

- (BOOL)canResignFirstResponder
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  editor = self->_editor;

  return [(TSDTextInput *)editor canResignFirstResponder];
}

- (BOOL)p_resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)TSDTextInputResponder;
  BOOL v3 = [(TSDTextInputResponder *)&v5 resignFirstResponder];
  if (v3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDTextInputResponderDidResignFirstResponder", self);
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  BOOL v3 = [(TSDTextInputResponder *)self canResignFirstResponder];
  if (v3)
  {
    self->_isResigning = 1;
    if ([(TSDTextInput *)self->_editor wantsKeyboard])
    {
      [(TSDTextInputResponder *)self acceptAutocorrection];
      [(TSDTextInput *)self->_editor endEditing];
    }
    if ([(TSDTextInputResponder *)self isFirstResponder]) {
      LOBYTE(v3) = [(TSDTextInputResponder *)self p_resignFirstResponder];
    }
    else {
      LOBYTE(v3) = 1;
    }
    self->_isResigning = 0;
  }
  return v3;
}

- (BOOL)p_didEnterUITextInput
{
  int ignoreKeyboardInputCount = self->_ignoreKeyboardInputCount;
  if (!ignoreKeyboardInputCount) {
    ++self->_respondingToUITextInput;
  }
  return ignoreKeyboardInputCount == 0;
}

- (void)p_willExitUITextInput
{
  int respondingToUITextInput = self->_respondingToUITextInput;
  if (respondingToUITextInput <= 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDTextInputResponder p_willExitUITextInput]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 663, @"UITextInput counter is going negative");
    int respondingToUITextInput = self->_respondingToUITextInput;
  }
  self->_int respondingToUITextInput = respondingToUITextInput - 1;
}

- (BOOL)p_isExecutingUITextInput
{
  return self->_respondingToUITextInput > 0;
}

- (UITextRange)selectedTextRange
{
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    BOOL v3 = (TSDTextRange *)[(TSDTextInput *)self->_editor selectionForArrowKeys];
  }
  else
  {
    BOOL v3 = (TSDTextRange *)[(TSDTextInput *)self->_editor textInputSelection];
  }
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(TSDTextRange *)v3 range];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v7 = v5;
      uint64_t v8 = v6;
      uint64_t v9 = [(TSDTextRange *)v4 isAtEndOfLine];
      *(float *)&double v10 = self->_preferredStartPosition;
      *(float *)&double v11 = self->_preferredEndPosition;
      uint64_t v4 = +[TSDTextRange textRangeWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:](TSDTextRange, "textRangeWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", v7, v8, v9, v10, v11);
      if (v7 + v8 > (unint64_t)[(TSDTextInput *)self->_editor textLength])
      {
        id v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v13 = [NSString stringWithUTF8String:"-[TSDTextInputResponder selectedTextRange]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 694, @"Bad selected text range");
      }
    }
  }
  if (![(TSDTextInputResponder *)self p_wantRawArrowKeys]) {
    return &v4->super;
  }

  return (UITextRange *)[(TSDTextInputResponder *)self arrow_augmentTextRange:v4];
}

- (void)p_setSelectedTextRange:(id)a3
{
  id v5 = [(TSDTextInputResponder *)self p_ICC];
  [v5 delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend((id)objc_msgSend(v5, "delegate"), "selectableWordLimit"))
  {
    uint64_t v6 = [(TSDTextInputResponder *)self _nsrangeForTextRange:a3];
    uint64_t v8 = +[TSDRangeClamper clampSelectedRange:inFullString:toWordLimit:](TSDRangeClamper, "clampSelectedRange:inFullString:toWordLimit:", v6, v7, -[TSDTextInput unfilteredText](self->_editor, "unfilteredText"), objc_msgSend((id)objc_msgSend(v5, "delegate"), "selectableWordLimit"));
    a3 = -[TSDTextInputResponder _textRangeFromNSRange:](self, "_textRangeFromNSRange:", v8, v9);
  }
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys])
  {
    [(TSDTextInputResponder *)self arrow_setSelectedTextRange:a3];
  }
  else
  {
    objc_opt_class();
    uint64_t v10 = TSUDynamicCast();
    if (v10)
    {
      double v11 = (void *)v10;
      [(TSDTextInputResponder *)self acceptAutocorrection];
      float preferredStartPosition = self->_preferredStartPosition;
      float preferredEndPosition = self->_preferredEndPosition;
      self->_isSettingSelectedTextRange = 1;
      [v11 range];
      [(TSDTextInput *)self->_editor editRange];
      uint64_t v14 = TSUIntersectionRangeWithEdge();
      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        -[TSDTextInput setSelectionWithRange:endOfLine:](self->_editor, "setSelectionWithRange:endOfLine:", v14, v15, [v11 isAtEndOfLine]);
      }
      [v11 preferredStartPosition];
      if (preferredStartPosition == v16) {
        self->_float preferredStartPosition = preferredStartPosition;
      }
      [v11 preferredEndPosition];
      if (preferredEndPosition == v17) {
        self->_float preferredEndPosition = preferredEndPosition;
      }
      self->_isSettingSelectedTextRange = 0;
    }
    else
    {
      long long v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v19 = [NSString stringWithUTF8String:"-[TSDTextInputResponder p_setSelectedTextRange:]"];
      uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"];
      [v18 handleFailureInFunction:v19 file:v20 lineNumber:728 description:@"bad textRange"];
    }
  }
}

- (void)setSelectedTextRange:(id)a3
{
  if ([(TSDTextInputResponder *)self p_didEnterUITextInput])
  {
    if (a3)
    {
      [(TSDTextInputResponder *)self p_setSelectedTextRange:a3];
      [(TSDTextInputResponder *)self p_willExitUITextInput];
    }
    else if (objc_opt_respondsToSelector())
    {
      editor = self->_editor;
      [(TSDTextInput *)editor clearSelection];
    }
  }
}

- (UITextRange)markedTextRange
{
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys]) {
    return 0;
  }
  uint64_t v3 = [(TSDTextInput *)self->_editor markedRange];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  id v5 = +[TSDTextRange textRangeWithRange:](TSDTextRange, "textRangeWithRange:", v3, v4);
  if (v7 + v8 > (unint64_t)[(TSDTextInput *)self->_editor textLength])
  {
    uint64_t v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDTextInputResponder markedTextRange]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 797, @"Bad marked text range");
  }
  return &v5->super;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if ([(TSDTextInputResponder *)self p_didEnterUITextInput])
  {
    -[TSDTextInput setMarkedText:selectedRange:](self->_editor, "setMarkedText:selectedRange:", a3, location, length);
    [(TSDTextInputResponder *)self p_willExitUITextInput];
  }
}

- (void)p_unmarkText
{
}

- (void)unmarkText
{
  if ([(TSDTextInputResponder *)self p_didEnterUITextInput])
  {
    [(TSDTextInputResponder *)self p_unmarkText];
    [(TSDTextInputResponder *)self p_willExitUITextInput];
  }
}

- (UITextPosition)beginningOfDocument
{
  uint64_t v3 = +[TSDTextPosition textPositionWithCharIndex:[(TSDTextInput *)self->_editor editRange]];
  if (![(TSDTextInputResponder *)self p_wantRawArrowKeys]) {
    return &v3->super;
  }

  return (UITextPosition *)[(TSDTextInputResponder *)self arrow_augmentBeginningOfDocument:v3];
}

- (UITextPosition)endOfDocument
{
  uint64_t v3 = [(TSDTextInput *)self->_editor editRange];
  id v5 = +[TSDTextPosition textPositionWithCharIndex:v3 + v4];
  if (![(TSDTextInputResponder *)self p_wantRawArrowKeys]) {
    return &v5->super;
  }

  return (UITextPosition *)[(TSDTextInputResponder *)self arrow_augmentEndOfDocument:v5];
}

- (id)textInRange:(id)a3
{
  objc_opt_class();
  uint64_t v5 = TSUDynamicCast();
  uint64_t v6 = (void *)v5;
  if (!a3 || v5)
  {
    if (!a3) {
      return &stru_26D688A48;
    }
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDTextInputResponder textInRange:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 874, @"bad textRange");
  }
  editor = self->_editor;
  uint64_t v11 = [v6 range];

  return (id)-[TSDTextInput textInRange:](editor, "textInRange:", v11, v10);
}

- (void)replaceRange:(id)a3 withText:(id)a4
{
  if ([(TSDTextInputResponder *)self p_didEnterUITextInput])
  {
    if ([(TSDTextInputResponder *)self p_wantRawArrowKeys])
    {
      [(TSDTextInputResponder *)self insertText:a4];
    }
    else
    {
      objc_opt_class();
      uint64_t v6 = (void *)TSUDynamicCast();
      if (!v6)
      {
        uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v8 = [NSString stringWithUTF8String:"-[TSDTextInputResponder replaceRange:withText:]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 892, @"bad textRange");
      }
      uint64_t v9 = [(TSDTextInput *)self->_editor editRange];
      if (v6)
      {
        unint64_t v11 = v9;
        uint64_t v12 = v10;
        unint64_t v14 = [v6 range];
        if (v11 <= v14 && v11 + v12 >= v14 + v13)
        {
          -[TSDTextInput replaceRange:withText:](self->_editor, "replaceRange:withText:", v14, v13, a4);
        }
        else
        {
          float v16 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", v14);
          uint64_t v17 = [NSString stringWithUTF8String:"-[TSDTextInputResponder replaceRange:withText:]"];
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 900, @"Input range is bad.");
        }
      }
    }
    [(TSDTextInputResponder *)self p_willExitUITextInput];
  }
}

- (id)textRangeFromPosition:(id)a3 toPosition:(id)a4
{
  objc_opt_class();
  uint64_t v7 = (void *)TSUDynamicCast();
  objc_opt_class();
  uint64_t v8 = (void *)TSUDynamicCast();
  uint64_t v9 = v8;
  if (!v7)
  {
    v26 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v27 = [NSString stringWithUTF8String:"-[TSDTextInputResponder textRangeFromPosition:toPosition:]"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 930, @"bad textPosition");
    if (v9) {
      return 0;
    }
LABEL_15:
    v28 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v29 = [NSString stringWithUTF8String:"-[TSDTextInputResponder textRangeFromPosition:toPosition:]"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 931, @"bad textPosition");
    return 0;
  }
  if (!v8) {
    goto LABEL_15;
  }
  unint64_t v10 = [v8 charIndex];
  unint64_t v11 = [v7 charIndex];
  if (v10 <= v11) {
    uint64_t v12 = v9;
  }
  else {
    uint64_t v12 = v7;
  }
  if (v10 <= v11) {
    uint64_t v13 = v7;
  }
  else {
    uint64_t v13 = v9;
  }
  uint64_t v14 = [v12 charIndex];
  uint64_t v15 = [v13 charIndex];
  uint64_t v16 = [v12 charIndex];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v17 = v15 - v16;
  uint64_t v18 = [v7 endOfLineAffinity];
  [v7 preferredPosition];
  int v20 = v19;
  [v9 preferredPosition];
  LODWORD(v22) = v21;
  LODWORD(v23) = v20;
  v24 = +[TSDTextRange textRangeWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:](TSDTextRange, "textRangeWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", v14, v17, v18, v23, v22);
  if (![(TSDTextInputResponder *)self p_wantRawArrowKeys]) {
    return v24;
  }

  return (id)[(TSDTextInputResponder *)self arrow_augmentTextRange:v24 fromPosition:a3 toPosition:a4];
}

- (int64_t)comparePosition:(id)a3 toPosition:(id)a4
{
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys])
  {
    return [(TSDTextInputResponder *)self arrow_comparePosition:a3 toPosition:a4];
  }
  objc_opt_class();
  uint64_t v8 = (void *)TSUDynamicCast();
  objc_opt_class();
  uint64_t v9 = TSUDynamicCast();
  uint64_t v10 = v9;
  if (!v8)
  {
    unint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDTextInputResponder comparePosition:toPosition:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 962, @"bad textPosition");
    if (v10) {
      goto LABEL_7;
    }
LABEL_11:
    uint64_t v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSDTextInputResponder comparePosition:toPosition:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 963, @"bad textPosition");
    goto LABEL_7;
  }
  if (!v9) {
    goto LABEL_11;
  }
LABEL_7:

  return [v8 compare:v10];
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4
{
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys])
  {
    return [(TSDTextInputResponder *)self arrow_offsetFromPosition:a3 toPosition:a4];
  }
  objc_opt_class();
  uint64_t v8 = (void *)TSUDynamicCast();
  objc_opt_class();
  uint64_t v9 = TSUDynamicCast();
  uint64_t v10 = (void *)v9;
  if (!v8)
  {
    uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDTextInputResponder offsetFromPosition:toPosition:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 983, @"bad textPosition");
    if (v10) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSDTextInputResponder offsetFromPosition:toPosition:]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 984, @"bad textPosition");
    goto LABEL_7;
  }
  if (!v9) {
    goto LABEL_13;
  }
LABEL_7:
  unint64_t v11 = [(TSDTextInput *)self->_editor textLength];
  int64_t result = 0;
  if (v8 && v10)
  {
    if ([v10 charIndex] <= v11 && objc_msgSend(v8, "charIndex") <= v11)
    {
      uint64_t v16 = [v10 charIndex];
      return v16 - [v8 charIndex];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)positionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(int64_t)a5
{
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys])
  {
    return (id)[(TSDTextInputResponder *)self arrow_positionFromPosition:a3 inDirection:a4 offset:a5];
  }
  else
  {
    objc_opt_class();
    cachedPosition = (TSDTextPosition *)TSUDynamicCast();
    if (cachedPosition)
    {
      if ([[(TSDTextInputResponder *)self editor] textIsVerticalAtCharIndex:[(TSDTextPosition *)cachedPosition charIndex]]&& (unint64_t)(a4 - 2) <= 3)
      {
        a4 = qword_22383A2F8[a4 - 2];
      }
      if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
        return 0;
      }
      if ([(TSDTextPosition *)cachedPosition charIndex] == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v12 = [NSString stringWithUTF8String:"-[TSDTextInputResponder positionFromPosition:inDirection:offset:]"];
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1054, @"bad charIndex");
      }
      BOOL v13 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 4;
      if ([(TSDTextPosition *)cachedPosition charIndex] > 0x7FFFFFFFFFFFFFFELL)
      {
        return 0;
      }
      else
      {
        int v14 = [a3 isEqual:self->_referencePosition];
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4 && v14)
        {
          if (a4 == 4) {
            int64_t v15 = -a5;
          }
          else {
            int64_t v15 = a5;
          }
          int64_t referenceOffset = self->_referenceOffset;
          if (a4 == 4) {
            a4 = 5;
          }
          int64_t v17 = v15 - referenceOffset;
          if (v15 - referenceOffset >= 0) {
            unint64_t v18 = v15 - referenceOffset;
          }
          else {
            unint64_t v18 = referenceOffset - v15;
          }
          if (a5 >= 0) {
            unint64_t v19 = a5;
          }
          else {
            unint64_t v19 = -a5;
          }
          if (v18 >= v19)
          {

            self->_referencePosition = 0;
            self->_cachedPosition = 0;
          }
          else
          {
            cachedPosition = self->_cachedPosition;
            int64_t v15 = v17;
          }
        }
        else
        {
          int64_t v15 = a5;
        }
        if (v15 < 0)
        {
          int64_t v15 = -v15;
          switch(a4)
          {
            case 2:
              a4 = 3;
              break;
            case 3:
              a4 = 2;
              break;
            case 4:
              a4 = 5;
              break;
            case 5:
              a4 = 4;
              break;
            default:
              break;
          }
        }
        v33 = (TSDTextPosition *)a3;
        LODWORD(v20) = [(TSDTextPosition *)cachedPosition endOfLineAffinity];
        [(TSDTextPosition *)cachedPosition preferredPosition];
        double v34 = v21;
        if (v15)
        {
          uint64_t v22 = 0;
          uint64_t v23 = 4 * v13;
          if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4) {
            uint64_t v20 = v20;
          }
          else {
            uint64_t v20 = 0;
          }
          do
          {
            if (v22) {
              v24 = 0;
            }
            else {
              v24 = &v34;
            }
            uint64_t v25 = [(TSDTextInput *)self->_editor charIndexByMovingPosition:cachedPosition toBoundary:v23 inDirection:a4 preferPosition:v24];
            cachedPosition = 0;
            if (v25 != 0x7FFFFFFFFFFFFFFFLL)
            {
              HIDWORD(v26) = HIDWORD(v34);
              *(float *)&double v26 = v34;
              cachedPosition = +[TSDTextPosition textPositionWithCharIndex:v25 eolAffinity:v20 preferredPosition:1 isPreferredStart:v26];
            }
            --v22;
          }
          while (v15 + 1 + v22 > 1);
        }
        uint64_t v27 = self->_cachedPosition;
        if (cachedPosition)
        {
          if (![(TSDTextPosition *)cachedPosition isEqual:v27]
            || ![(TSDTextPosition *)self->_referencePosition isEqual:v33])
          {
            v28 = v33;

            self->_referencePosition = v33;
            BOOL v29 = a4 == 2 || a4 == 5;
            int64_t v30 = a5;
            if (!v29) {
              int64_t v30 = -a5;
            }
            self->_int64_t referenceOffset = v30;
            v31 = cachedPosition;

            self->_cachedPosition = cachedPosition;
          }
        }
        else if (v15 != 1 || v27 == 0)
        {
          return v33;
        }
        else
        {
          return self->_cachedPosition;
        }
      }
    }
    return cachedPosition;
  }
}

- (id)positionFromPosition:(id)a3 offset:(int64_t)a4
{
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys])
  {
    return (id)[(TSDTextInputResponder *)self arrow_positionFromPosition:a3 offset:a4];
  }
  objc_opt_class();
  uint64_t v8 = (void *)TSUDynamicCast();
  editor = self->_editor;
  if (editor) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    return 0;
  }
  unint64_t v11 = [(TSDTextInput *)editor editRange];
  uint64_t v13 = v12;
  unint64_t v14 = [v8 charIndex];
  unint64_t v16 = v14;
  if (a4 < 0 && v14 < -a4) {
    return 0;
  }
  if (!a4) {
    goto LABEL_24;
  }
  unint64_t v16 = v14 + a4;
  if (v14 + a4 > v11 + v13) {
    return 0;
  }
  char v17 = objc_opt_respondsToSelector();
  unint64_t v18 = self->_editor;
  if (v17) {
    unint64_t v19 = (void *)[(TSDTextInput *)v18 unfilteredText];
  }
  else {
    unint64_t v19 = (void *)-[TSDTextInput textInRange:](v18, "textInRange:", 0, [(TSDTextInput *)v18 textLength]);
  }
  if (v16 < v11 + v13)
  {
    unint64_t v20 = [v19 rangeOfComposedCharacterSequenceAtIndex:v16];
    if (v16 != v20 && v16 >= v20)
    {
      unint64_t v22 = a4 <= 0 ? 0 : v21;
      unint64_t v23 = v22 + v20;
      if (v16 - v20 < v21) {
        unint64_t v16 = v23;
      }
    }
  }
LABEL_24:
  if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  if (v16 < v11 || (v11 += v13, v16 > v11))
  {
    unint64_t v16 = v11;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
  }
  LODWORD(v15) = 2143289344;

  return +[TSDTextPosition textPositionWithCharIndex:v16 eolAffinity:0 preferredPosition:1 isPreferredStart:v15];
}

- (CGRect)firstRectForRange:(id)a3
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    editor = self->_editor;
    uint64_t v6 = [v4 range];
    -[TSDTextInput firstRectForRange:](editor, "firstRectForRange:", v6, v7);
    CGRect v19 = CGRectIntegral(v18);
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x263F001A0];
    CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
    uint64_t v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSDTextInputResponder firstRectForRange:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1213, @"bad textRange");
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)selectionRectsForRange:(id)a3
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (!v4)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDTextInputResponder selectionRectsForRange:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1226, @"bad textRange");
  }
  editor = self->_editor;
  uint64_t v9 = [v4 range];

  return (id)-[TSDTextInput selectionRectsForRange:](editor, "selectionRectsForRange:", v9, v8);
}

- (CGRect)caretRectForPosition:(id)a3
{
  if (self->_editor)
  {
    objc_opt_class();
    uint64_t v4 = (void *)TSUDynamicCast();
    if (!v4)
    {
      uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSDTextInputResponder caretRectForPosition:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1244, @"bad text position");
    }
    -[TSDTextInput firstRectForRange:](self->_editor, "firstRectForRange:", [v4 charIndex], 0);
    CGFloat x = v15.origin.x;
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
    if (!CGRectIsNull(v15))
    {
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      v17.origin.CGFloat x = round(CGRectGetMidX(v16));
      v17.size.CGFloat width = 0.0;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat height = height;
      CGRect v18 = CGRectIntegral(v17);
      CGFloat x = v18.origin.x;
      CGFloat y = v18.origin.y;
      CGFloat width = v18.size.width;
      CGFloat height = v18.size.height;
    }
  }
  else
  {
    CGFloat x = *MEMORY[0x263F001A0];
    CGFloat y = *(double *)(MEMORY[0x263F001A0] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A0] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A0] + 24);
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (id)textStylingAtPosition:(id)a3 inDirection:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v5 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  objc_opt_class();
  uint64_t v6 = (void *)TSUDynamicCast();
  if (!v6)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDTextInputResponder textStylingAtPosition:inDirection:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 1272, @"bad text position");
  }
  uint64_t v9 = [v6 charIndex];
  uint64_t v10 = [(TSDTextInput *)self->_editor textFontAtCharIndex:v9];
  if (v10) {
    [v5 setObject:v10 forKey:*MEMORY[0x263F1C238]];
  }
  uint64_t v11 = [(TSDTextInput *)self->_editor textColorAtCharIndex:v9];
  if (v11) {
    [v5 setObject:v11 forKey:*MEMORY[0x263F1C240]];
  }
  return v5;
}

- (id)keyCommands
{
  if (keyCommands_s_globalKeyCommandsOnce != -1) {
    dispatch_once(&keyCommands_s_globalKeyCommandsOnce, &__block_literal_global_38);
  }
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  id v4 = (id)[v3 initWithArray:keyCommands_s_globalKeyCommands];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "addObjectsFromArray:", -[TSDTextInput keyCommands](self->_editor, "keyCommands"));
  }
  return v4;
}

id __36__TSDTextInputResponder_keyCommands__block_invoke()
{
  v2[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F1C708] keyCommandWithInput:@"\r" modifierFlags:0x80000 action:sel_insertNewlineIgnoringFieldEditor_];
  v2[1] = objc_msgSend(MEMORY[0x263F1C708], "keyCommandWithInput:modifierFlags:action:", @"\r", 0x100000, sel_endEditingAndSelectParent_, v0);
  v2[2] = [MEMORY[0x263F1C708] keyCommandWithInput:@"\t" modifierFlags:0x80000 action:sel_insertTabIgnoringFieldEditor_];
  v2[3] = [MEMORY[0x263F1C708] keyCommandWithInput:@"\t" modifierFlags:0x20000 action:sel_insertBacktab_];
  v2[4] = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D0] modifierFlags:0 action:sel_cancelOperation_];
  keyCommands_s_globalKeyCommands = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  return (id)keyCommands_s_globalKeyCommands;
}

- (void)insertDictationResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(TSDTextInputResponder *)self p_didEnterUITextInput])
  {
    if (objc_opt_respondsToSelector())
    {
      [(TSDTextInput *)self->_editor insertDictationResult:a3];
    }
    else
    {
      uint64_t v5 = (void *)[MEMORY[0x263F089D8] string];
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v11;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(a3);
            }
            uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) text];
            if (v9) {
              [v5 appendString:v9];
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
      if ([v5 length]) {
        [(TSDTextInputResponder *)self insertText:v5];
      }
    }
    [(TSDTextInputResponder *)self p_willExitUITextInput];
  }
}

- (BOOL)p_currentEditorIsNotOnMyCanvas
{
  id v3 = objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "editorController");
  if (self->_editor) {
    return objc_msgSend((id)objc_msgSend(v3, "currentEditors"), "containsObject:", self->_editor) ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if ([(TSDTextInputResponder *)self p_currentEditorIsNotOnMyCanvas]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    int v7 = [(TSDTextInput *)self->_editor canPerformEditorAction:a3 withSender:a4];
    if (v7 == 1) {
      return v7;
    }
  }
  else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "layerHost"), "asiOSCVC"), "canPerformAction:withSender:", a3, a4))
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  int v7 = [(TSDTextInputResponder *)self p_accessibilityShouldCheckAncestorCanPerformAction:a3 withSender:a4];
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDTextInputResponder;
    LOBYTE(v7) = [(TSDTextInputResponder *)&v9 canPerformAction:a3 withSender:a4];
  }
  return v7;
}

- (void)selectAll:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(TSDTextInput *)self->_editor canPerformEditorAction:a2 withSender:a3] == 1)
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "hideMenu");
    editor = self->_editor;
    [(TSDTextInput *)editor selectAll:a3];
  }
}

- (void)delete:(id)a3
{
  [(TSDTextInputResponder *)self acceptAutocorrection];
  if (objc_opt_respondsToSelector()) {
    [(TSDTextInput *)self->_editor delete:a3];
  }
  uint64_t v5 = (void *)[MEMORY[0x263F1C7B0] sharedMenuController];

  [v5 hideMenu];
}

- (void)toggleBoldface:(id)a3
{
  if ([(TSDTextInput *)self->_editor canPerformEditorAction:a2 withSender:a3] == 1)
  {
    editor = self->_editor;
    [(TSDTextInput *)editor toggleBoldface:a3];
  }
}

- (void)toggleItalics:(id)a3
{
  if ([(TSDTextInput *)self->_editor canPerformEditorAction:a2 withSender:a3] == 1)
  {
    editor = self->_editor;
    [(TSDTextInput *)editor toggleItalics:a3];
  }
}

- (void)toggleUnderline:(id)a3
{
  if ([(TSDTextInput *)self->_editor canPerformEditorAction:a2 withSender:a3] == 1)
  {
    editor = self->_editor;
    [(TSDTextInput *)editor toggleUnderline:a3];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSDTextInputResponder;
  if (-[TSDTextInputResponder respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDTextInputResponder;
    return [(TSDTextInputResponder *)&v7 methodSignatureForSelector:a3];
  }
  else
  {
    if ([(TSDTextInputResponder *)self p_currentEditorIsNotOnMyCanvas]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      editor = self->_editor;
    }
    else
    {
      editor = (TSDTextInput *)objc_msgSend((id)objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "layerHost"), "asiOSCVC");
    }
    return (id)[(TSDTextInput *)editor methodSignatureForSelector:a3];
  }
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v5 = [a3 selector];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(-[TSDTextInputResponder p_ICC](self, "p_ICC"), "layerHost"), "asiOSCVC");
  if ([(TSDTextInputResponder *)self p_currentEditorIsNotOnMyCanvas]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "hideMenu");
    editor = self->_editor;
    id v8 = a3;
LABEL_6:
    [v8 invokeWithTarget:editor];
    return;
  }
  if (objc_opt_respondsToSelector())
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController"), "hideMenu");
    id v8 = a3;
    editor = (TSDTextInput *)v6;
    goto LABEL_6;
  }

  [(TSDTextInputResponder *)self doesNotRecognizeSelector:v5];
}

- (void)customAction6:(id)a3
{
}

- (void)customAction7:(id)a3
{
}

- (void)customAction8:(id)a3
{
}

- (int64_t)autocorrectionType
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  editor = self->_editor;

  return [(TSDTextInput *)editor autocorrectionType];
}

- (int64_t)returnKeyType
{
  return [(TSDTextInput *)self->_editor returnKeyType];
}

- (BOOL)isSecureTextEntry
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  editor = self->_editor;

  return [(TSDTextInput *)editor isSecureTextEntry];
}

- (BOOL)hasText
{
  return 1;
}

- (UITextInputTokenizer)tokenizer
{
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys])
  {
    return (UITextInputTokenizer *)[(TSDTextInputResponder *)self arrow_tokenizer];
  }
  else
  {
    CGRect result = (UITextInputTokenizer *)self->_tokenizer;
    if (!result)
    {
      CGRect result = [[TSDTextInputTokenizer alloc] initWithTextInput:self];
      self->_tokenizer = (TSDTextInputTokenizer *)result;
    }
  }
  return result;
}

- (id)_textRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v5 = [(TSDTextInputResponder *)self _selectableText];
  uint64_t v6 = objc_msgSend(v5, "positionFromPosition:offset:", objc_msgSend(v5, "beginningOfDocument"), location);
  if (!v6) {
    uint64_t v6 = [v5 endOfDocument];
  }
  uint64_t v7 = [v5 positionFromPosition:v6 offset:length];
  if (!v7) {
    uint64_t v7 = [v5 endOfDocument];
  }

  return (id)[v5 textRangeFromPosition:v6 toPosition:v7];
}

- (int64_t)_indexForTextPosition:(id)a3
{
  id v4 = [(TSDTextInputResponder *)self _selectableText];
  uint64_t v5 = [v4 beginningOfDocument];

  return [v4 offsetFromPosition:v5 toPosition:a3];
}

- (_NSRange)_nsrangeForTextRange:(id)a3
{
  id v5 = [(TSDTextInputResponder *)self _selectableText];
  int64_t v6 = -[TSDTextInputResponder _indexForTextPosition:](self, "_indexForTextPosition:", [a3 start]);
  NSUInteger v7 = objc_msgSend(v5, "offsetFromPosition:toPosition:", objc_msgSend(a3, "start"), objc_msgSend(a3, "end"));
  NSUInteger v8 = v6;
  result.NSUInteger length = v7;
  result.NSUInteger location = v8;
  return result;
}

- (_NSRange)_selectedNSRange
{
  id v3 = [(TSDTextInputResponder *)self _selectableText];
  if (v3 && (uint64_t v4 = [v3 selectedTextRange]) != 0)
  {
    NSUInteger v5 = [(TSDTextInputResponder *)self _nsrangeForTextRange:v4];
  }
  else
  {
    NSUInteger v6 = 0;
    NSUInteger v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (id)inputView
{
  [(TSDTextInputResponder *)self editor];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(TSDTextInputResponder *)self editor];

  return (id)[(TSDTextInput *)v3 inputView];
}

- (id)inputAccessoryView
{
  [(TSDTextInputResponder *)self editor];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(TSDTextInputResponder *)self editor];

  return (id)[(TSDTextInput *)v3 inputAccessoryView];
}

- (id)p_ICC
{
  nextResponder = self->_nextResponder;
  if (!nextResponder) {
    return 0;
  }
  do
  {
    objc_opt_class();
    id v3 = (void *)TSUDynamicCast();
    if (v3) {
      uint64_t v4 = (void *)[v3 controller];
    }
    else {
      uint64_t v4 = 0;
    }
    uint64_t v5 = [(UIResponder *)nextResponder nextResponder];
    if (!v5) {
      break;
    }
    nextResponder = (UIResponder *)v5;
  }
  while (!v4);
  return v4;
}

- (void)p_startDynamicOperation:(id)a3
{
  if ([(TSDTextInputResponder *)self isFirstResponder])
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
    self->_inDynamicOperation = 1;
  }
}

- (void)p_finishDynamicOperation:(id)a3
{
  if ([(TSDTextInputResponder *)self isFirstResponder]) {
    self->_inDynamicOperation = 0;
  }
}

- (BOOL)p_wantRawArrowKeys
{
  editor = self->_editor;
  if (editor && self->_editorRespondsToRawArrowKeySelectors) {
    return [(TSDTextInput *)editor wantsRawArrowKeyEvents];
  }
  else {
    return 0;
  }
}

- (void)p_textChanged
{
  if (![(TSDTextInputResponder *)self p_isExecutingUITextInput])
  {
    [objc_loadWeak((id *)&self->_inputDelegate) textWillChange:self];
    id Weak = objc_loadWeak((id *)&self->_inputDelegate);
    [Weak textDidChange:self];
  }
}

- (void)p_editorWillClearSelectionNotification:(id)a3
{
  if ((TSDTextInput *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"TSDEditorControllerEditorKey") == self->_editor)
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
  }
}

- (void)p_editorWillStyleTextNotification:(id)a3
{
  if ((TSDTextInput *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"TSDEditorControllerEditorKey") == self->_editor)
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
  }
}

- (void)p_editorWillHandleTapNotification:(id)a3
{
  if ((TSDTextInput *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"TSDEditorControllerEditorKey") == self->_editor)
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
  }
}

- (void)p_editorSelectionWasForciblyChangedNotification:(id)a3
{
  if ((TSDTextInput *)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", @"TSDEditorControllerEditorKey") == self->_editor)
  {
    [(TSDTextInputResponder *)self p_textChanged];
  }
}

- (void)editorDidChangeSelection:(id)a3
{
}

- (void)editorDidChangeSelection:(id)a3 withFlags:(unint64_t)a4
{
  if (!self->_pendingEditorChange && self->_editor == a3)
  {
    int v5 = a4;
    [(TSDTextInputResponder *)self cancelDelayedResponderChange];
    self->_float preferredEndPosition = NAN;
    self->_float preferredStartPosition = NAN;
    if (!self->_isSettingSelectedTextRange)
    {

      self->_referencePosition = 0;
      self->_cachedPosition = 0;
    }
    if (![(TSDTextInputResponder *)self p_isExecutingUITextInput])
    {
      [objc_loadWeak((id *)&self->_inputDelegate) selectionWillChange:self];
      [objc_loadWeak((id *)&self->_inputDelegate) selectionDidChange:self];
    }
    if ((TSUSupportsTextInteraction() & 1) == 0
      && [(TSDTextInputResponder *)self p_requiresFirstResponderChangeForEditor:self->_editor])
    {
      if ([(TSDTextInputResponder *)self isFirstResponder]
        && ([(TSDTextInput *)self->_editor wantsKeyboard] & 1) == 0)
      {
        self->_pendingFirstResponderObject = self->_editor;
        [(TSDTextInputResponder *)self performSelector:sel_p_setFirstResponderAfterDelay withObject:0 afterDelay:0.25];
      }
      else if ((v5 & 0x200000) == 0)
      {
        [(TSDTextInputResponder *)self p_setFirstResponder:self->_editor];
      }
    }
    [(TSDTextInputResponder *)self reloadInputViews];
  }
}

- (void)p_willShowPopoverNotification:(id)a3
{
  [(TSDTextInputResponder *)self acceptAutocorrection];

  [(TSDTextInputResponder *)self p_unmarkText];
}

- (void)p_willUndoChangeNotification:(id)a3
{
  if (![(TSDTextInputResponder *)self p_isExecutingUITextInput])
  {
    [(TSDTextInputResponder *)self acceptAutocorrection];
    id Weak = objc_loadWeak((id *)&self->_inputDelegate);
    [Weak textWillChange:self];
  }
}

- (void)p_didUndoRedoChangeNotification:(id)a3
{
  if (![(TSDTextInputResponder *)self p_isExecutingUITextInput])
  {
    id Weak = objc_loadWeak((id *)&self->_inputDelegate);
    [Weak textDidChange:self];
  }
}

- (NSDictionary)markedTextStyle
{
  return 0;
}

- (id)closestPositionToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unsigned __int8 v10 = 0;
  if (TSUSupportsTextInteraction()
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [(TSDTextInput *)self->_editor allowAutomaticTextEditingToBeginWithDifferentEditor])
  {
    -[TSDTextInput beginAutomaticTextEditingIfNeededForPoint:](self->_editor, "beginAutomaticTextEditingIfNeededForPoint:", x, y);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  unint64_t v6 = [(TSDTextInput *)self->_editor textLength];
  unint64_t v7 = -[TSDTextInput closestCharIndexToPoint:isAtEndOfLine:](self->_editor, "closestCharIndexToPoint:isAtEndOfLine:", &v10, x, y);
  if (v7 > v6) {
    return 0;
  }
  LODWORD(v8) = 2143289344;
  return +[TSDTextPosition textPositionWithCharIndex:v7 eolAffinity:v10 preferredPosition:0 isPreferredStart:v8];
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  unsigned __int8 v18 = 0;
  if (objc_opt_respondsToSelector())
  {
    unint64_t v7 = [(TSDTextInput *)self->_editor textLength];
    unint64_t v8 = -[TSDTextInput closestCharIndexToPoint:isAtEndOfLine:](self->_editor, "closestCharIndexToPoint:isAtEndOfLine:", &v18, x, y);
    if (v8 <= v7)
    {
      unint64_t v9 = v8;
      objc_opt_class();
      unsigned __int8 v10 = (void *)TSUDynamicCast();
      if (v10)
      {
        unint64_t v11 = [v10 range];
        if (v9 >= v11 && v9 <= v11 + v12)
        {
          LODWORD(v13) = 2143289344;
          return +[TSDTextPosition textPositionWithCharIndex:v9 eolAffinity:v18 preferredPosition:0 isPreferredStart:v13];
        }
      }
      else
      {
        CGRect v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v17 = [NSString stringWithUTF8String:"-[TSDTextInputResponder closestPositionToPoint:withinRange:]"];
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2017, @"Bad range in -closestPositionToPoint:withinRange:");
      }
    }
  }
  return 0;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)positionWithinRange:(id)a3 farthestInDirection:(int64_t)a4
{
  if (![(TSDTextInputResponder *)self p_wantRawArrowKeys]) {
    return 0;
  }

  return (id)[(TSDTextInputResponder *)self arrow_positionWithinRange:a3 farthestInDirection:a4];
}

- (id)characterRangeByExtendingPosition:(id)a3 inDirection:(int64_t)a4
{
  if (![(TSDTextInputResponder *)self p_wantRawArrowKeys]) {
    return 0;
  }

  return (id)[(TSDTextInputResponder *)self arrow_characterRangeByExtendingPosition:a3 inDirection:a4];
}

- (int64_t)baseWritingDirectionForPosition:(id)a3 inDirection:(int64_t)a4
{
  if ([(TSDTextInputResponder *)self p_wantRawArrowKeys])
  {
    return [(TSDTextInputResponder *)self arrow_baseWritingDirectionForPosition:a3 inDirection:a4];
  }
  objc_opt_class();
  unint64_t v8 = (void *)TSUDynamicCast();
  if (!v8)
  {
    uint64_t v11 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDTextInputResponder baseWritingDirectionForPosition:inDirection:]"];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"];
    double v14 = @"Bad text position.";
    uint64_t v15 = (void *)v11;
    uint64_t v16 = v12;
    uint64_t v17 = 2073;
    goto LABEL_20;
  }
  unint64_t v9 = v8;
  if (a4 != 1)
  {
    if (!a4)
    {
      uint64_t v10 = [v8 charIndex];
      goto LABEL_14;
    }
    uint64_t v21 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v22 = [NSString stringWithUTF8String:"-[TSDTextInputResponder baseWritingDirectionForPosition:inDirection:]"];
    uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"];
    double v14 = @"Unknown direction.";
    uint64_t v15 = (void *)v21;
    uint64_t v16 = v22;
    uint64_t v17 = 2095;
LABEL_20:
    [v15 handleFailureInFunction:v16 file:v13 lineNumber:v17 description:v14];
    return -1;
  }
  if (![v8 charIndex])
  {
    unsigned __int8 v18 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"-[TSDTextInputResponder baseWritingDirectionForPosition:inDirection:]"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTextInputResponder.m"), 2086, @"Bad text position for writing direction.");
  }
  if (![v9 charIndex]) {
    return -1;
  }
  uint64_t v10 = [v9 charIndex] - 1;
LABEL_14:
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || (objc_opt_respondsToSelector() & 1) == 0) {
    return -1;
  }
  editor = self->_editor;

  return [(TSDTextInput *)editor writingDirectionForCharIndex:v10];
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    editor = self->_editor;
    [(TSDTextInput *)editor reverseDirection:a3];
  }
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    editor = self->_editor;
    [(TSDTextInput *)editor reverseDirection:a3];
  }
}

- (UIView)textInputView
{
  if (objc_opt_respondsToSelector())
  {
    editor = self->_editor;
    return (UIView *)[(TSDTextInput *)editor textInputView];
  }
  else
  {
    int v5 = [(TSDTextInputResponder *)self nextResponder];
    if (v5)
    {
      unint64_t v6 = v5;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          return v6;
        }
        unint64_t v6 = (UIView *)[(UIView *)v6 nextResponder];
        if (!v6) {
          goto LABEL_9;
        }
      }
    }
    else
    {
LABEL_9:
      unint64_t v7 = (void *)[MEMORY[0x263F1C408] sharedApplication];
      return (UIView *)[v7 keyWindow];
    }
  }
}

- (id)superview
{
  id v2 = [(TSDTextInputResponder *)self textInputView];

  return [(UIView *)v2 superview];
}

- (TSDTextInput)editor
{
  return self->_editor;
}

- (UITextInputDelegate)inputDelegate
{
  return (UITextInputDelegate *)objc_loadWeak((id *)&self->_inputDelegate);
}

- (void)setInputDelegate:(id)a3
{
}

- (float)preferredStartPosition
{
  return self->_preferredStartPosition;
}

- (void)setPreferredStartPosition:(float)a3
{
  self->_float preferredStartPosition = a3;
}

- (float)preferredEndPosition
{
  return self->_preferredEndPosition;
}

- (void)setPreferredEndPosition:(float)a3
{
  self->_float preferredEndPosition = a3;
}

- (void).cxx_destruct
{
}

@end