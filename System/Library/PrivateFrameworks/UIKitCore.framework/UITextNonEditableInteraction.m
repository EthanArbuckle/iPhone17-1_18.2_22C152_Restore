@interface UITextNonEditableInteraction
- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)_shouldAllowOneFingerTapInUneditable:(id)a3;
- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3;
- (UITextNonEditableInteraction)initWithMode:(int64_t)a3;
- (void)_oneFingerTapInUneditableAcceleratedActionAtLocation:(CGPoint)a3 textInput:(id)a4 canReplaceText:(BOOL)a5;
- (void)_oneFingerTapInUneditableActionAtLocation:(CGPoint)a3 textInput:(id)a4 canReplaceText:(BOOL)a5 modifierFlags:(int64_t)a6;
- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7;
- (void)doubleTapInUneditable:(id)a3;
- (void)oneFingerTapInUneditable:(id)a3;
- (void)oneFingerTapInUneditableAccelerated:(id)a3;
- (void)toggleSelectionCommands;
@end

@implementation UITextNonEditableInteraction

- (UITextNonEditableInteraction)initWithMode:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UITextNonEditableInteraction;
  v4 = [(UITextInteraction *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    if (a3 == 2)
    {
      v6 = [(UITextInteraction *)v4 defaultTapRecognizerWithAction:sel_oneFingerTapInUneditableAccelerated_];
      [(UITextInteraction *)v5 addGestureRecognizer:v6 withName:0x1ED174000];

LABEL_5:
      v8 = [(UITextInteraction *)v5 defaultDoubleTapRecognizerWithAction:sel_doubleTapInUneditable_];
      [(UITextInteraction *)v5 addGestureRecognizer:v8 withName:0x1ED174080];

      return v5;
    }
    v7 = [(UITextInteraction *)v4 defaultTapRecognizerWithAction:sel_oneFingerTapInUneditable_];
    [(UITextInteraction *)v5 addGestureRecognizer:v7 withName:0x1ED174000];

    if (a3 != 1) {
      goto LABEL_5;
    }
  }
  return v5;
}

- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UITextInteraction *)self recognizerForName:0x1ED174080];

  id v9 = [(UITextInteraction *)self recognizerForName:0x1ED174000];

  if (v8 == v7 || v9 == v7) {
    int v11 = [v6 _originatesFromPointerEvent] ^ 1;
  }
  else {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (BOOL)_shouldAllowOneFingerTapInUneditable:(id)a3
{
  v4 = [(UITextInteraction *)self linkInteractionSession];
  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(UITextInteraction *)self assistantDelegate];
    id v7 = [(UITextInteraction *)self _textInput];
    if ([v6 viewCouldBecomeEditable:v7])
    {
      char v5 = 1;
    }
    else
    {
      id v8 = [(UITextInteraction *)self assistantDelegate];
      id v9 = [v8 view];
      if ([v9 isFirstResponder])
      {
        objc_super v10 = [(UITextInteraction *)self assistantDelegate];
        int v11 = [v10 view];
        v12 = [v11 _responderWindow];
        if ([v12 isKeyWindow])
        {
          v16 = [(UITextInteraction *)self assistantDelegate];
          v13 = [v16 activeSelection];
          [v13 selectedRange];
          v14 = v17 = v10;
          char v5 = [v14 _isRanged];

          objc_super v10 = v17;
        }
        else
        {
          char v5 = 1;
        }
      }
      else
      {
        char v5 = 1;
      }
    }
  }

  return v5;
}

- (void)oneFingerTapInUneditable:(id)a3
{
  id v26 = a3;
  v4 = [(UITextInteraction *)self linkInteractionSession];
  char v5 = [v4 tapOnLinkWithGesture:v26];

  id v6 = v26;
  if ((v5 & 1) == 0)
  {
    id v7 = [v26 view];
    id v8 = [v7 superview];

    [v26 locationInView:v8];
    double v10 = v9;
    double v12 = v11;
    v13 = [(UITextInteraction *)self assistantDelegate];
    v14 = [v13 activeSelection];
    v15 = [(UITextInteraction *)self view];
    v16 = [(UITextInteraction *)self _textInput];
    objc_msgSend(v13, "setNeedsGestureUpdate:", objc_msgSend(v16, "isFirstResponder") ^ 1);
    if ([v13 viewCouldBecomeEditable:v16]
      && ([v14 selectedRange],
          v17 = objc_claimAutoreleasedReturnValue(),
          char v18 = [v17 _isRanged],
          v17,
          (v18 & 1) == 0))
    {
      v20 = +[UIKeyboardImpl sharedInstance];
      [v20 updateChangeTimeAndIncrementCount];

      uint64_t v19 = 1;
      [v15 setEditable:1];
      [v13 setFirstResponderIfNecessaryActivatingSelection:0];
      [v13 setGestureRecognizers];
    }
    else
    {
      [v13 setFirstResponderIfNecessaryActivatingSelection:0];
      uint64_t v19 = 0;
    }
    [(UITextInteraction *)self _performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:v16];
    v21 = [v16 textInputView];
    objc_msgSend(v8, "convertPoint:toView:", v21, v10, v12);
    double v23 = v22;
    double v25 = v24;

    -[UITextNonEditableInteraction _oneFingerTapInUneditableActionAtLocation:textInput:canReplaceText:modifierFlags:](self, "_oneFingerTapInUneditableActionAtLocation:textInput:canReplaceText:modifierFlags:", v16, v19, [v26 modifierFlags], v23, v25);
    if ([v13 needsGestureUpdate] && objc_msgSend(v16, "isFirstResponder")) {
      [v13 setGestureRecognizers];
    }
    [v13 notifyKeyboardSelectionChanged];

    id v6 = v26;
  }
}

- (void)oneFingerTapInUneditableAccelerated:(id)a3
{
  id v4 = a3;
  char v5 = [v4 view];
  id v11 = [v5 superview];

  [v4 locationInView:v11];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(UITextInteraction *)self _textInput];
  -[UITextNonEditableInteraction _oneFingerTapInUneditableAcceleratedActionAtLocation:textInput:canReplaceText:](self, "_oneFingerTapInUneditableAcceleratedActionAtLocation:textInput:canReplaceText:", v10, 0, v7, v9);
}

- (void)_oneFingerTapInUneditableActionAtLocation:(CGPoint)a3 textInput:(id)a4 canReplaceText:(BOOL)a5 modifierFlags:(int64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  double v10 = [(UITextInteraction *)self assistantDelegate];
  [v10 setGrabberSuppressionAssertion:0];
  id v11 = [v10 activeSelection];
  if (!v9)
  {
    id v9 = [(UITextInteraction *)self _textInput];
  }
  if (![v10 viewCouldBecomeEditable:v9]) {
    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector())
  {
    char v12 = [v9 _usesAsynchronousProtocol];
    if (WebThreadIsEnabled())
    {
      char v13 = v12 ^ 1;
LABEL_9:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (v13 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    if (v12) {
      goto LABEL_14;
    }
  }
  else if (WebThreadIsEnabled())
  {
    char v13 = 1;
    goto LABEL_9;
  }
LABEL_13:
  v14 = [v11 selectedRange];
  char v15 = [v14 _isRanged];

  if ((v15 & 1) == 0)
  {
    char v18 = [(UITextInteraction *)self assistantDelegate];
    uint64_t v19 = [v18 activeSelectionController];

    [v19 beginSelection];
    objc_msgSend(v19, "selectPositionAtPoint:granularity:completionHandler:", 1, 0, x, y);
    [v19 endSelection];
    v20 = [v10 _editMenuAssistant];
    [v20 hideSelectionCommands];

    v21 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __113__UITextNonEditableInteraction__oneFingerTapInUneditableActionAtLocation_textInput_canReplaceText_modifierFlags___block_invoke;
    v24[3] = &__block_descriptor_48_e5__8__0l;
    *(double *)&v24[4] = x;
    *(double *)&v24[5] = y;
    [v21 logBlock:v24 domain:@"com.apple.keyboard.UIKit"];

LABEL_23:
    goto LABEL_24;
  }
LABEL_14:
  v16 = [v11 selectedRange];
  if ([v16 _isRanged])
  {
    char v17 = [v10 containerAllowsSelectionTintOnly];

    if ((v17 & 1) == 0)
    {
      if (-[UITextInteraction selection:containsPoint:](self, "selection:containsPoint:", v11, x, y))
      {
        [(UITextNonEditableInteraction *)self toggleSelectionCommands];
        [v10 setGrabberSuppressionAssertion:0];
      }
      else if (([v10 viewConformsToAsynchronousInteractionProtocol] & 1) == 0)
      {
        [v11 clearSelection];
        [v11 commit];
        double v22 = [v10 _editMenuAssistant];
        [v22 hideSelectionCommands];
      }
      uint64_t v19 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __113__UITextNonEditableInteraction__oneFingerTapInUneditableActionAtLocation_textInput_canReplaceText_modifierFlags___block_invoke_2;
      v23[3] = &__block_descriptor_48_e5__8__0l;
      *(double *)&v23[4] = x;
      *(double *)&v23[5] = y;
      [v19 logBlock:v23 domain:@"com.apple.keyboard.UIKit"];
      goto LABEL_23;
    }
  }
  else
  {
  }
LABEL_24:
}

id __113__UITextNonEditableInteraction__oneFingerTapInUneditableActionAtLocation_textInput_canReplaceText_modifierFlags___block_invoke(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v6[0] = @"KeyboardEventType";
  v6[1] = @"Operation";
  v7[0] = @"TextEditing";
  v7[1] = @"Uneditable text interaction";
  v7[2] = @"One finger";
  v6[2] = @"TriggerType";
  v6[3] = @"CursorLocationX";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v7[3] = v2;
  v6[4] = @"CursorLocationY";
  v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[4] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];

  return v4;
}

id __113__UITextNonEditableInteraction__oneFingerTapInUneditableActionAtLocation_textInput_canReplaceText_modifierFlags___block_invoke_2(uint64_t a1)
{
  v7[5] = *MEMORY[0x1E4F143B8];
  v6[0] = @"KeyboardEventType";
  v6[1] = @"Operation";
  v7[0] = @"TextEditing";
  v7[1] = @"Selected uneditable text";
  v7[2] = @"One finger";
  v6[2] = @"TriggerType";
  v6[3] = @"CursorLocationX";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v7[3] = v2;
  v6[4] = @"CursorLocationY";
  v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[4] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:5];

  return v4;
}

- (void)_oneFingerTapInUneditableAcceleratedActionAtLocation:(CGPoint)a3 textInput:(id)a4 canReplaceText:(BOOL)a5
{
  double y = a3.y;
  double x = a3.x;
  id v18 = a4;
  double v8 = [(UITextInteraction *)self view];
  id v9 = [(UITextInteraction *)self assistantDelegate];
  [v9 setGrabberSuppressionAssertion:0];
  double v10 = [(UITextInteraction *)self root];
  int v11 = [v10 _allowsSelectionCommands];

  [v9 setFirstResponderIfNecessary];
  char v12 = [v9 activeSelection];
  if (!v18)
  {
    id v18 = [(UITextInteraction *)self _textInput];
  }
  char v13 = [v12 selectedRange];
  if ([v13 _isRanged])
  {
    char v14 = [v9 containerAllowsSelectionTintOnly];

    if ((v14 & 1) == 0)
    {
      if (-[UITextInteraction selection:containsPoint:](self, "selection:containsPoint:", v12, x, y))
      {
        if (v11)
        {
          char v15 = [v9 _editMenuAssistant];
          [v15 showSelectionCommands];

          [(UITextNonEditableInteraction *)self toggleSelectionCommands];
        }
      }
      else
      {
        [v12 clearSelection];
        [v12 commit];
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  v16 = [v9 activeSelection];
  [(UITextInteraction *)self _beginSelectionChange];
  objc_msgSend(v16, "alterSelection:granularity:", 1, x, y);
  [v16 commit];
  [(UITextInteraction *)self _endSelectionChange];
  if (v11)
  {
    char v17 = [v9 _editMenuAssistant];
    [v17 showSelectionCommands];
  }
  [v9 scrollSelectionToVisible];

LABEL_12:
}

- (void)doubleTapInUneditable:(id)a3
{
  id v25 = a3;
  [(UITextInteraction *)self cancelLinkInteractionSession];
  id v4 = [(UITextInteraction *)self assistantDelegate];
  [v4 setSelectionHighlightMode:0];
  char v5 = [(UITextInteraction *)self view];
  double v6 = [(UITextInteraction *)self _textInput];
  double v7 = [v25 view];
  [v25 centroid];
  double v9 = v8;
  double v11 = v10;
  char v12 = [v6 textInputView];
  objc_msgSend(v7, "convertPoint:toView:", v12, v9, v11);
  double v14 = v13;
  double v16 = v15;

  [v4 setFirstResponderIfNecessary];
  [v4 setGrabberSuppressionAssertion:0];
  if ([v6 isFirstResponder])
  {
    char v17 = [v4 activeSelection];
    [(UITextInteraction *)self _beginSelectionChange];
    if ([(UITextInteraction *)self _shouldObscureTextInput])
    {
      uint64_t v18 = 5;
    }
    else
    {
      id v19 = [(UITextInteraction *)self recognizerForName:0x1ED174080];
      if (v19 == v25) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = 3;
      }
    }
    objc_msgSend(v17, "alterSelection:granularity:", v18, v14, v16);
    [v17 commit];
    [(UITextInteraction *)self _endSelectionChange];
    v20 = [(UITextInteraction *)self root];
    v21 = [v20 interactionWithGestureForName:0x1ED174100];

    if (v21) {
      objc_msgSend(v21, "updateInitialPoint:", v14, v16);
    }
    if (self->_mode != 2
      || ([(UITextInteraction *)self root],
          double v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v22 _allowsSelectionCommands],
          v22,
          v23))
    {
      double v24 = [v4 _editMenuAssistant];
      [v24 showSelectionCommands];
    }
    [v4 scrollSelectionToVisible];
  }
}

- (void)toggleSelectionCommands
{
  v3 = [(UITextInteraction *)self assistantDelegate];
  id v4 = [v3 _editMenuAssistant];
  int v5 = [v4 _editMenuIsVisibleOrDismissedRecently];

  id v8 = [(UITextInteraction *)self assistantDelegate];
  double v6 = [v8 _editMenuAssistant];
  double v7 = v6;
  if (v5) {
    [v6 hideSelectionCommands];
  }
  else {
    [v6 showSelectionCommands];
  }
}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7
{
  if (a3 == 1 && a4 == 3) {
    -[UITextNonEditableInteraction _oneFingerTapInUneditableActionAtLocation:textInput:canReplaceText:modifierFlags:](self, "_oneFingerTapInUneditableActionAtLocation:textInput:canReplaceText:modifierFlags:", 0, 1, 0, a5.x, a5.y, a6.x, a6.y);
  }
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if (self->_mode != 2
    && ([(UITextInteraction *)self recognizerForName:0x1ED174000],
        id v5 = (id)objc_claimAutoreleasedReturnValue(),
        v5,
        v5 == v4))
  {
    unsigned __int8 v6 = [(UITextNonEditableInteraction *)self _shouldAllowOneFingerTapInUneditable:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UITextNonEditableInteraction;
    unsigned __int8 v6 = [(UITextInteraction *)&v9 interaction_gestureRecognizerShouldBegin:v4];
  }
  BOOL v7 = v6;

  return v7;
}

@end