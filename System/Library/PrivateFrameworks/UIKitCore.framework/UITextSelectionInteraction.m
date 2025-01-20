@interface UITextSelectionInteraction
- (BOOL)_hasMarkedTextAtLocation:(CGPoint)a3;
- (BOOL)_hasTextAlternativesAtLocation:(CGPoint)a3;
- (BOOL)_isNowWithinRepeatedTapTime;
- (BOOL)_isRepeatedTap:(id)a3 gestureLocationOut:(CGPoint *)a4;
- (BOOL)_isShiftKeyBeingHeldForGesture:(id)a3;
- (BOOL)_isWithinRepeatedTapTimeForTouch:(id)a3;
- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)_usesIndirectSelectionBehavior;
- (BOOL)_usesPencilSelectionBehaviorForGesture:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldHandleOneFingerTapInUneditable:(id)a3;
- (UITextSelectionInteraction)initWithMode:(int64_t)a3;
- (UITextSelectionInteraction)initWithMode:(int64_t)a3 indirect:(BOOL)a4;
- (id)_transientState;
- (int64_t)_textGranularityForNumberOfTaps:(unint64_t)a3;
- (int64_t)handOffGranularity;
- (void)_applyTransientState:(id)a3;
- (void)_checkForRepeatedTap:(id)a3 gestureLocationOut:(CGPoint *)a4;
- (void)_createGestureTuningIfNecessary;
- (void)_handleMultiTapGesture:(id)a3;
- (void)_showSelectionCommandsIfApplicableAfterDelay:(double)a3;
- (void)_updateTapGestureHistoryWithLocation:(CGPoint)a3;
- (void)confirmMarkedText:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)didUpdateSelectionWithGesture:(id)a3;
- (void)finishSetup;
- (void)oneFingerTapSelectsAll:(id)a3;
- (void)setHybridSelectionWithPoint:(CGPoint)a3;
- (void)tapAndAHalf:(id)a3;
- (void)tappedToPositionCursorWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6;
- (void)tappedToSelectTextWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6;
- (void)tappedToUpdateSelectionWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6;
- (void)toggleSelectionCommands;
- (void)twoFingerRangedSelectGesture:(id)a3;
- (void)willUpdateSelectionWithGesture:(id)a3;
@end

@implementation UITextSelectionInteraction

- (UITextSelectionInteraction)initWithMode:(int64_t)a3 indirect:(BOOL)a4
{
  BOOL v4 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UITextSelectionInteraction;
  v6 = [(UITextInteraction *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_indirectSelectionType = v4;
    v8 = 0;
    switch(a3)
    {
      case 0:
        v8 = sel__handleMultiTapGesture_;
        goto LABEL_4;
      case 1:
        v8 = sel_oneFingerTapSelectsAll_;
        goto LABEL_8;
      case 2:
        v8 = sel_confirmMarkedText_;
        if (!sel_confirmMarkedText_) {
          goto LABEL_15;
        }
        goto LABEL_9;
      case 3:
LABEL_4:
        if (v4)
        {
LABEL_8:
          if (!v8) {
            goto LABEL_15;
          }
        }
        else
        {
          v9 = [[UITapAndAHalfRecognizer alloc] initWithTarget:v6 action:sel_tapAndAHalf_];
          [(UIGestureRecognizer *)v9 setName:@"com.apple.UIKit.textTapAndAHalf"];
          [(UITapAndAHalfRecognizer *)v9 setAllowableMovement:60.0];
          [(UITextInteraction *)v7 addGestureRecognizer:v9 withName:0x1ED174040];

          if (!v8) {
            goto LABEL_15;
          }
        }
LABEL_9:
        v10 = [[UITextMultiTapRecognizer alloc] initWithTarget:v7 tapAction:v8];
        v11 = v10;
        if (v4)
        {
          [(UITextMultiTapRecognizer *)v10 setRequiredButtonMask:1];
          [(UITextMultiTapRecognizer *)v11 setRecognizesOnSubsequentTouchDowns:1];
          double v12 = 10.0;
        }
        else
        {
          double v12 = 60.0;
        }
        [(UITextMultiTapRecognizer *)v11 setAllowableMovement:v12];
        [(UIGestureRecognizer *)v11 setDelaysTouchesEnded:0];
        v13 = &UITextInteractionNameIndirectSingleTap;
        if (!v4) {
          v13 = &UITextInteractionNameSingleTap;
        }
        [(UITextInteraction *)v7 addGestureRecognizer:v11 withName:*v13];

LABEL_15:
        v14 = [MEMORY[0x1E4F28F80] processInfo];
        [v14 systemUptime];
        v7->_lastTapTimestamp = v15 + -0.5;

        CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
        v7->_originalCaretRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
        v7->_originalCaretRect.size = v16;
        v7->_granularityToHandOff = -1;
        v7->_isCharacterGranularityOnMarkedTextPresenceEnabled = _os_feature_enabled_impl();
        break;
      default:
        goto LABEL_15;
    }
  }
  return v7;
}

- (void)didMoveToView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextSelectionInteraction;
  id v4 = a3;
  [(UITextInteraction *)&v6 didMoveToView:v4];
  -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v4, v6.receiver, v6.super_class);
  char v5 = [v4 conformsToProtocol:&unk_1ED42F658];

  self->_viewConformsToTextInput = v5;
}

- (void)finishSetup
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)UITextSelectionInteraction;
  [(UITextInteraction *)&v18 finishSetup];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v19[0] = 0x1ED1740E0;
  v19[1] = 0x1ED174100;
  v3 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 2, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        v9 = [(UITextInteraction *)self root];
        v10 = [v9 recognizerForName:v8];

        if (v10)
        {
          v11 = [v10 _pairedGestureIdentifiers];
          [v11 addObject:0x1ED174000];

          double v12 = [v10 _pairedGestureIdentifiers];
          [v12 addObject:0x1ED174040];

          v13 = [v10 _pairedGestureIdentifiers];
          [v13 addObject:0x1ED174020];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)_applyTransientState:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    uint64_t v5 = [v4 objectForKey:@"lastTapTimestamp"];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 doubleValue];
      self->_lastTapTimestamp = v7;
    }
    uint64_t v8 = [v13 objectForKey:@"lastTapLocation"];
    v9 = v8;
    if (v8)
    {
      p_lastTapLocation = &self->_lastTapLocation;
      [v8 CGPointValue];
      p_lastTapLocation->x = v11;
      p_lastTapLocation->y = v12;
    }

    id v4 = v13;
  }
}

- (id)_transientState
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"lastTapTimestamp";
  v3 = [NSNumber numberWithDouble:self->_lastTapTimestamp];
  v7[1] = @"lastTapLocation";
  v8[0] = v3;
  id v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", self->_lastTapLocation.x, self->_lastTapLocation.y);
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_activeSelectionController, 0);
  objc_storeStrong((id *)&self->_activeLoupeSession, 0);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
}

- (UITextSelectionInteraction)initWithMode:(int64_t)a3
{
  return [(UITextSelectionInteraction *)self initWithMode:a3 indirect:0];
}

- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  BOOL v4 = !self->_indirectSelectionType;
  return [a3 _isPointerTouch] ^ v4;
}

- (void)toggleSelectionCommands
{
  v3 = [(UITextInteraction *)self assistantDelegate];
  BOOL v4 = [v3 _editMenuAssistant];
  int v5 = [v4 _editMenuIsVisibleOrDismissedRecently];

  id v8 = [(UITextInteraction *)self assistantDelegate];
  uint64_t v6 = [v8 _editMenuAssistant];
  double v7 = v6;
  if (v5) {
    [v6 hideSelectionCommands];
  }
  else {
    [v6 showSelectionCommands];
  }
}

- (void)_showSelectionCommandsIfApplicableAfterDelay:(double)a3
{
  if (![(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
  {
    id v7 = [(UITextInteraction *)self assistantDelegate];
    int v5 = [v7 _editMenuAssistant];
    uint64_t v6 = v5;
    if (a3 == 0.0) {
      [v5 showSelectionCommands];
    }
    else {
      [v5 showSelectionCommandsAfterDelay:a3];
    }
  }
}

- (BOOL)_usesIndirectSelectionBehavior
{
  return self->_indirectSelectionType;
}

- (BOOL)_usesPencilSelectionBehaviorForGesture:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend(a3, "touchesForTap", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) type] == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_isShiftKeyBeingHeldForGesture:(id)a3
{
  v3 = +[UIKeyboardImpl activeInstance];
  char v4 = [v3 isShiftKeyBeingHeld];

  return v4;
}

- (BOOL)_isNowWithinRepeatedTapTime
{
  return [(UITextSelectionInteraction *)self _isWithinRepeatedTapTimeForTouch:0];
}

- (BOOL)_isWithinRepeatedTapTimeForTouch:(id)a3
{
  if (a3)
  {
    [a3 timestamp];
    double v5 = v4;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28F80] processInfo];
    [v6 systemUptime];
    double v5 = v7;
  }
  return v5 - self->_lastTapTimestamp <= 0.35;
}

- (BOOL)_isRepeatedTap:(id)a3 gestureLocationOut:(CGPoint *)a4
{
  id v6 = a3;
  double v7 = [(UITextInteraction *)self _textInput];
  long long v8 = [v6 view];
  long long v9 = [v8 superview];

  [v6 locationInView:v9];
  double v11 = v10;
  double v13 = v12;
  long long v14 = [v7 textInputView];
  objc_msgSend(v9, "convertPoint:toView:", v14, v11, v13);
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  if (a4)
  {
    a4->x = v16;
    a4->y = v18;
  }
  unint64_t v19 = [v6 tapCount];

  return v19 > 1;
}

- (int64_t)handOffGranularity
{
  int64_t granularityToHandOff = self->_granularityToHandOff;
  self->_int64_t granularityToHandOff = -1;
  return granularityToHandOff;
}

- (int64_t)_textGranularityForNumberOfTaps:(unint64_t)a3
{
  if (a3 >= 2 && [(UITextInteraction *)self _shouldObscureTextInput]) {
    return 5;
  }
  if (a3 > 2) {
    return 3;
  }
  return qword_186B9D700[a3];
}

- (void)_checkForRepeatedTap:(id)a3 gestureLocationOut:(CGPoint *)a4
{
  id v6 = a3;
  double v7 = [(UITextInteraction *)self view];
  long long v8 = [(UITextInteraction *)self assistantDelegate];
  long long v9 = [v8 activeSelectionController];
  double v10 = [v9 selection];

  CGPoint v40 = (CGPoint)0;
  BOOL v11 = [(UITextSelectionInteraction *)self _isRepeatedTap:v6 gestureLocationOut:&v40];
  if ([v6 state] == 1)
  {
    double v12 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v12 clearAnimationStyleForUserDrivenPresentation];

    [v8 setFirstResponderIfNecessary];
    [v8 setSelectionHighlightMode:0];
  }
  double v13 = +[UIKeyboardImpl activeInstance];
  [v13 updateIdleDetection:4];

  [(UITextInteraction *)self _beginSelectionChange];
  if ([v6 state] == 1)
  {
    long long v14 = [v8 activeSelectionController];
    activeSelectionController = self->_activeSelectionController;
    self->_activeSelectionController = v14;

    CGFloat v16 = [v8 _editMenuAssistant];
    [v16 hideSelectionCommands];
  }
  [(UITextSelectionInteraction *)self willUpdateSelectionWithGesture:v6];
  BOOL v17 = [(UITextSelectionInteraction *)self _isShiftKeyBeingHeldForGesture:v6];
  if (v11)
  {
    int64_t v18 = -[UITextSelectionInteraction _textGranularityForNumberOfTaps:](self, "_textGranularityForNumberOfTaps:", [v6 tapCount]);
    self->_int64_t granularityToHandOff = v18;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke;
    v38[3] = &unk_1E52D9F98;
    v38[4] = self;
    id v39 = v6;
    [(UITextSelectionInteraction *)self tappedToSelectTextWithGesture:v39 atPoint:v18 granularity:v38 completionHandler:v40];
    unint64_t v19 = v39;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v20 = v17;
  if ([(UITextInteraction *)self _shouldObscureTextInput])
  {
    uint64_t v21 = 5;
  }
  else if (self->_isCharacterGranularityOnMarkedTextPresenceEnabled)
  {
    v22 = [(UITextInteraction *)self _textInput];
    v23 = [v22 markedTextRange];
    uint64_t v21 = v23 == 0;
  }
  else
  {
    uint64_t v21 = 1;
  }
  BOOL v24 = [(UITextSelectionInteraction *)self _usesPencilSelectionBehaviorForGesture:v6];
  if ([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior] || v24) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = v21;
  }
  if (v20)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke_2;
    v36[3] = &unk_1E52D9F98;
    v36[4] = self;
    id v37 = v6;
    [(UITextSelectionInteraction *)self tappedToUpdateSelectionWithGesture:v37 atPoint:0 granularity:v36 completionHandler:v40];
    unint64_t v19 = v37;
    goto LABEL_17;
  }
  uint64_t v32 = v25;
  v33 = v7;
  v26 = [(UITextInteraction *)self _textInput];
  v27 = [v26 selectedTextRange];
  int v28 = [v27 isEmpty];

  BOOL v29 = [(UITextInteraction *)self containerChangesSelectionOnOneFingerTap];
  BOOL v30 = self->_wasOriginallyFirstResponder
     && [(UITextInteraction *)self _textInputLivesInKeyWindow];
  BOOL v31 = [(UITextInteraction *)self selection:v10 containsPoint:v40];
  if (((([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior] || v24) | v28) & 1) != 0
    || !v31)
  {
    if (v29)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke_3;
      v34[3] = &unk_1E52D9F98;
      v34[4] = self;
      id v35 = v6;
      [(UITextSelectionInteraction *)self tappedToPositionCursorWithGesture:v35 atPoint:v32 granularity:v34 completionHandler:v40];
    }
    else
    {
      [(UITextSelectionInteraction *)self didUpdateSelectionWithGesture:v6];
    }
    double v7 = v33;
  }
  else
  {
    double v7 = v33;
    if (v30) {
      [(UITextSelectionInteraction *)self toggleSelectionCommands];
    }
  }
LABEL_18:
  [v8 notifyKeyboardSelectionChanged];
  [(UITextInteraction *)self _endSelectionChange];
  if (a4) {
    *a4 = v40;
  }
}

uint64_t __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateSelectionWithGesture:*(void *)(a1 + 40)];
}

uint64_t __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateSelectionWithGesture:*(void *)(a1 + 40)];
}

uint64_t __70__UITextSelectionInteraction__checkForRepeatedTap_gestureLocationOut___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateSelectionWithGesture:*(void *)(a1 + 40)];
}

- (void)tappedToUpdateSelectionWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  activeSelectionController = self->_activeSelectionController;
  BOOL v11 = (void (**)(void))a6;
  double v10 = [(_UIKeyboardTextSelectionController *)activeSelectionController initialSelection];

  if (!v10) {
    [(_UIKeyboardTextSelectionController *)self->_activeSelectionController beginSelection];
  }
  -[_UIKeyboardTextSelectionController modifySelectionWithExtentPoint:executionContext:](self->_activeSelectionController, "modifySelectionWithExtentPoint:executionContext:", 0, x, y);
  v11[2]();
}

- (BOOL)_hasTextAlternativesAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(UITextInteraction *)self _textInput];
  double v7 = [v6 selectedTextRange];
  char v8 = [v7 _isRanged];

  if (v8) {
    return 0;
  }
  double v10 = [(UITextInteraction *)self _textInput];
  BOOL v11 = objc_msgSend(v10, "closestPositionToPoint:", x, y);

  uint64_t v14 = 0;
  double v12 = [(UITextInteraction *)self rangeWithTextAlternatives:&v14 atPosition:v11];
  BOOL v9 = v12 != 0;

  return v9;
}

- (BOOL)_hasMarkedTextAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = +[UIKeyboardImpl activeInstance];
  LODWORD(v7) = [v6 hasInlineCompletionAsMarkedText];

  if (v7)
  {
    char v8 = [(UITextInteraction *)self _textInput];
    BOOL v9 = [v8 markedTextRange];

    if (v9)
    {
      double v10 = [(UITextInteraction *)self _textInput];
      BOOL v11 = [v10 selectionRectsForRange:v9];

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v12 = v11;
      uint64_t v7 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v7)
      {
        uint64_t v13 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v12);
            }
            double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            objc_msgSend(v15, "rect", (void)v21);
            CGFloat v17 = fmin((v16 + -44.0) * 0.5, 0.0);
            [v15 rect];
            CGFloat v19 = fmin((v18 + -44.0) * 0.5, 0.0);
            [v15 rect];
            CGRect v29 = CGRectInset(v28, v17, v19);
            v27.CGFloat x = x;
            v27.CGFloat y = y;
            if (CGRectContainsPoint(v29, v27))
            {
              LOBYTE(v7) = 1;
              goto LABEL_13;
            }
          }
          uint64_t v7 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_13:
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)tappedToPositionCursorWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a6;
  BOOL v11 = [(UITextInteraction *)self assistantDelegate];
  id v12 = [(UITextInteraction *)self _textInput];
  int v13 = [v12 isFirstResponder];

  uint64_t v14 = [(UITextInteraction *)self _textInput];
  double v15 = [v14 selectedTextRange];
  int v16 = [v15 _isRanged];

  CGFloat v17 = [(UITextInteraction *)self _textInput];
  double v18 = objc_msgSend(v17, "closestPositionToPoint:", x, y);

  CGFloat v19 = 0;
  BOOL v20 = 0;
  if (v16 || !v13) {
    goto LABEL_9;
  }
  id v27 = 0;
  BOOL v20 = [(UITextInteraction *)self rangeWithTextAlternatives:&v27 atPosition:v18];
  id v21 = v27;
  if (v21)
  {
    CGFloat v19 = v21;
    [v11 scheduleDictationReplacementsForAlternatives:v21 range:v20];
    goto LABEL_12;
  }
  long long v22 = [(UITextInteraction *)self _textInput];
  long long v23 = [v22 textRangeFromPosition:v18 toPosition:v18];

  if (!+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled](UITextSelectionDisplayInteraction, "isTextAccelerationUIEnabled")|| ([v11 _textChoicesAssistant], v24 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v24, "rangeForTextChoicesAtPosition:", v18), CGFloat v19 = objc_claimAutoreleasedReturnValue(), v24, !v19))
  {
    CGFloat v19 = [v11 rangeForTextReplacement:v23];
  }
  char v25 = [v11 scheduleReplacementsForRange:v19 withOptions:47];

  if ((v25 & 1) == 0)
  {
LABEL_9:
    if (([v19 isEmpty] & 1) == 0)
    {
      uint64_t v26 = [v11 _textChoicesAssistant];
      [v26 clearUnderlinesInRange:v19 animated:1];
    }
    [(_UIKeyboardTextSelectionController *)self->_activeSelectionController beginSelection];
    -[_UIKeyboardTextSelectionController selectPositionAtPoint:granularity:completionHandler:](self->_activeSelectionController, "selectPositionAtPoint:granularity:completionHandler:", a5, v10, x, y);
    [(_UIKeyboardTextSelectionController *)self->_activeSelectionController endSelection];
  }
LABEL_12:
}

- (void)tappedToSelectTextWithGesture:(id)a3 atPoint:(CGPoint)a4 granularity:(int64_t)a5 completionHandler:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  activeSelectionController = self->_activeSelectionController;
  id v11 = a6;
  [(_UIKeyboardTextSelectionController *)activeSelectionController beginSelection];
  -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:completionHandler:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:completionHandler:", a5, v11, x, y);

  id v12 = [(UITextInteraction *)self assistantDelegate];
  LOBYTE(activeSelectionController) = [v12 didPerformLoupeSelectionHandoff];

  if ((activeSelectionController & 1) == 0)
  {
    int v13 = +[UIKeyboardImpl activeInstance];
    uint64_t v14 = [v13 inputDelegateManager];
    char v15 = [v14 hasAsyncCapableInputDelegate];

    if ((v15 & 1) == 0)
    {
      int v16 = self->_activeSelectionController;
      [(_UIKeyboardTextSelectionController *)v16 endSelection];
    }
  }
}

- (void)oneFingerTapSelectsAll:(id)a3
{
  id v8 = a3;
  double v4 = [(UITextInteraction *)self assistantDelegate];
  if ([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
  {
    double v5 = [(UITextInteraction *)self view];

    if (v5) {
      -[UITextSelectionInteraction tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:](self, "tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:", v8, 5, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
  }
  else
  {
    [v4 setSelectionHighlightMode:0];
    [v4 setFirstResponderIfNecessary];
    id v6 = [v4 activeSelectionController];
    uint64_t v7 = [v6 selection];

    -[UITextSelectionInteraction tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:](self, "tappedToSelectTextWithGesture:atPoint:granularity:completionHandler:", v8, 5, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [v7 commit];
    [v4 notifyKeyboardSelectionChanged];
  }
}

- (void)_handleMultiTapGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 state] == 1 || objc_msgSend(v4, "state") == 2 || objc_msgSend(v4, "state") == 4;
  id v6 = +[UIKeyboardImpl activeInstance];
  int v7 = [v6 hasInlineCompletionAsMarkedText];

  if (!v7)
  {
    if (!v5) {
      goto LABEL_16;
    }
LABEL_10:
    [(UITextInteraction *)self cancelLinkInteractionSession];
    BOOL v9 = [(UITextInteraction *)self _textInput];
    [(UITextInteraction *)self _performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:v9];

    id v10 = [(UITextInteraction *)self assistantDelegate];
    id v11 = [(UITextInteraction *)self _textInput];
    id v12 = [v10 _editMenuAssistant];
    if ([v4 state] == 1)
    {
      int v13 = [v10 activeSelectionController];
      activeSelectionController = self->_activeSelectionController;
      self->_activeSelectionController = v13;
    }
    if ([v4 state] != 1) {
      goto LABEL_25;
    }
    if ([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
    {
      char v15 = [v10 obtainSelectionGrabberSuppressionAssertion];
      grabberSuppressionAssertion = self->_grabberSuppressionAssertion;
      self->_grabberSuppressionAssertion = v15;

      [v12 hideSelectionCommands];
      dispatch_time_t v17 = dispatch_time(0, 750000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__UITextSelectionInteraction__handleMultiTapGesture___block_invoke;
      block[3] = &unk_1E52D9F98;
      block[4] = self;
      id v28 = v10;
      dispatch_after(v17, MEMORY[0x1E4F14428], block);

      goto LABEL_25;
    }
    CGFloat v19 = [v10 grabberSuppressionAssertion];

    if (v19)
    {
      [v10 setGrabberSuppressionAssertion:0];
      BOOL v20 = [v11 selectedTextRange];
      char v21 = [v20 isEmpty];

      if (v21)
      {
LABEL_25:
        if ([v10 viewCouldBecomeEditable:v11])
        {
          double v25 = 0.0;
          double v26 = 0.0;
          [(UITextSelectionInteraction *)self _checkForRepeatedTap:v4 gestureLocationOut:&v25];
          -[UITextSelectionInteraction _updateTapGestureHistoryWithLocation:](self, "_updateTapGestureHistoryWithLocation:", v25, v26);
        }
        else
        {
          [(UITextInteraction *)self setInGesture:1];
          double v25 = 0.0;
          double v26 = 0.0;
          [(UITextSelectionInteraction *)self _checkForRepeatedTap:v4 gestureLocationOut:&v25];
          -[UITextSelectionInteraction _updateTapGestureHistoryWithLocation:](self, "_updateTapGestureHistoryWithLocation:", v25, v26);
          [(UITextInteraction *)self setInGesture:0];
        }
        goto LABEL_28;
      }
      long long v22 = [v10 _textChoicesAssistant];
      [v22 dismissWithoutSelection];
    }
    else
    {
      if (![(UITextInteraction *)self _textInputIsInteractive]) {
        goto LABEL_25;
      }
      if ([v10 selectionHighlightMode] != 1) {
        goto LABEL_25;
      }
      long long v23 = +[UIKeyboardImpl activeInstance];
      char v24 = [v23 _shouldSuppressSoftwareKeyboardByDictation];

      if (v24) {
        goto LABEL_25;
      }
      [v10 setSelectionHighlightMode:0];
    }
    [v12 showSelectionCommands];
LABEL_28:

    goto LABEL_29;
  }
  [v4 location];
  if (-[UITextSelectionInteraction _hasMarkedTextAtLocation:](self, "_hasMarkedTextAtLocation:"))
  {
    if ([v4 state] == 3)
    {
      id v8 = +[UIKeyboardImpl activeInstance];
      [v8 acceptInlineCompletionWithCompletionHandler:0];
    }
    goto LABEL_16;
  }
  double v18 = +[UIKeyboardImpl activeInstance];
  [v18 removeInlineTextCompletionPrompt];

  if (v5) {
    goto LABEL_10;
  }
LABEL_16:
  if ([v4 state] == 3) {
    self->_int64_t granularityToHandOff = -1;
  }
LABEL_29:
}

void __53__UITextSelectionInteraction__handleMultiTapGesture___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 224))
  {
    objc_msgSend(*(id *)(a1 + 40), "setGrabberSuppressionAssertion:");
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 224);
    *(void *)(v2 + 224) = 0;
  }
}

- (void)willUpdateSelectionWithGesture:(id)a3
{
  p_originalCaretRect = &self->_originalCaretRect;
  [(_UIKeyboardTextSelectionController *)self->_activeSelectionController caretRectForCursorPosition];
  p_originalCaretRect->origin.double x = v4;
  p_originalCaretRect->origin.double y = v5;
  p_originalCaretRect->size.width = v6;
  p_originalCaretRect->size.height = v7;
}

- (void)didUpdateSelectionWithGesture:(id)a3
{
  id v4 = a3;
  [(UITextInteraction *)self cancelLinkInteractionSession];
  CGFloat v5 = [(UITextInteraction *)self _textInput];
  [(UITextInteraction *)self _performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:v5];

  CGFloat v6 = [(UITextInteraction *)self assistantDelegate];
  CGFloat v7 = [v6 activeSelectionController];
  id v8 = [v7 selection];

  BOOL v9 = [(UITextInteraction *)self view];
  BOOL v31 = [(UITextInteraction *)self _textInput];
  long long v32 = *MEMORY[0x1E4F1DAD8];
  id v10 = [(UITextInteraction *)self _textInput];
  id v11 = [v10 selectedTextRange];

  char v12 = [v11 isEmpty];
  BOOL v13 = [(UITextSelectionInteraction *)self _isShiftKeyBeingHeldForGesture:v4];
  LODWORD(v7) = [(UITextInteraction *)self selection:v8 containsPoint:v32];
  BOOL v14 = [(UITextSelectionInteraction *)self _isRepeatedTap:v4 gestureLocationOut:&v32];
  [(UITextSelectionInteraction *)self _usesPencilSelectionBehaviorForGesture:v4];

  if (v7 && !v13 && !v14)
  {
    [(UITextSelectionInteraction *)self toggleSelectionCommands];
    char v15 = [(UITextInteraction *)self root];
    int v16 = [v15 assistantDelegate];
    [v16 setGrabberSuppressionAssertion:0];

    goto LABEL_33;
  }
  if (v12)
  {
    dispatch_time_t v17 = [(UITextInteraction *)self assistantDelegate];
    double v18 = [v17 _editMenuAssistant];

    BOOL v19 = self->_wasOriginallyFirstResponder
       && [(UITextInteraction *)self _textInputLivesInKeyWindow];
    if ([v18 _editMenuIsVisibleOrDismissedRecently]) {
      int v21 = [v18 _hasTextReplacements];
    }
    else {
      int v21 = 1;
    }
    [(UITextInteraction *)self _performPreemtiveLayoutToEnsureNoMoreLayoutWhileSelecting:v31];
    if (!v19) {
      goto LABEL_20;
    }
    [(UITextInteraction *)self disableClearsOnInsertion];
    if (![(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
    {
      long long v22 = +[UIKeyboardImpl activeInstance];
      [v22 showKeyboardIfNeeded];
    }
    if (v21
      && ([(_UIKeyboardTextSelectionController *)self->_activeSelectionController caretRectForCursorPosition], x = v33.origin.x, CGFloat y = v33.origin.y, width = v33.size.width, height = v33.size.height, !CGRectIsEmpty(v33)))
    {
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.CGFloat width = width;
      v34.size.CGFloat height = height;
      BOOL v27 = CGRectEqualToRect(v34, self->_originalCaretRect);
    }
    else
    {
LABEL_20:
      BOOL v27 = 0;
    }
    id v28 = [(UITextInteraction *)self root];
    CGRect v29 = [v28 recognizerForName:0x1ED174100];

    if ([v29 state] == 5)
    {
      if (!v27) {
        goto LABEL_29;
      }
    }
    else if ([v29 state] != 4 || !v27)
    {
LABEL_29:
      if (!v19 && [(UITextInteraction *)self _textInputIsInteractive])
      {
        [(UITextSelectionInteraction *)self _updateTapGestureHistoryWithLocation:v32];
        [v6 setGestureRecognizers];
      }

      goto LABEL_33;
    }
    [(UITextSelectionInteraction *)self _showSelectionCommandsIfApplicableAfterDelay:0.2];
    goto LABEL_29;
  }
  BOOL v20 = [v6 _editMenuAssistant];
  [v20 showSelectionCommands];

  if (self->_wasOriginallyFirstResponder
    && [(UITextInteraction *)self _textInputLivesInKeyWindow])
  {
    [(UITextInteraction *)self disableClearsOnInsertion];
  }
LABEL_33:
}

- (void)_updateTapGestureHistoryWithLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  CGFloat v6 = [MEMORY[0x1E4F28F80] processInfo];
  [v6 systemUptime];
  self->_lastTapTimestamp = v7;

  self->_lastTapLocation.CGFloat x = x;
  self->_lastTapLocation.CGFloat y = y;
}

- (void)confirmMarkedText:(id)a3
{
  if ([a3 state] != 4)
  {
    id v3 = +[UIKeyboard activeKeyboard];
    [v3 acceptAutocorrectionWithCompletionHandler:0];
  }
}

- (void)_createGestureTuningIfNecessary
{
  if (!self->_gestureTuning)
  {
    id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v4 = [v3 preferencesActions];
    int v5 = [v4 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

    if (v5)
    {
      CGFloat v6 = objc_alloc_init(UITextGestureTuning);
      gestureTuning = self->_gestureTuning;
      self->_gestureTuning = v6;

      id v8 = [(UITextInteraction *)self view];
      [(UITextGestureTuning *)self->_gestureTuning setContainerCoordinateSpace:v8];

      [(UITextGestureTuning *)self->_gestureTuning setShouldUseLineThreshold:1];
      BOOL v9 = self->_gestureTuning;
      [(UITextGestureTuning *)v9 setStrongerBiasAgainstUp:1];
    }
  }
}

- (void)tapAndAHalf:(id)a3
{
  id v61 = a3;
  [(UITextInteraction *)self cancelLinkInteractionSession];
  id v4 = [(UITextInteraction *)self assistantDelegate];
  v60 = +[UITextMagnifierRanged sharedRangedMagnifier];
  uint64_t v59 = [(UITextInteraction *)self view];
  int v5 = [(UITextInteraction *)self _textInput];
  CGFloat v6 = [v61 touch];
  double v7 = [v5 textInputView];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  [v61 translationInWindowCoordinates];
  double v13 = v12;
  double v15 = v14;
  char v16 = [v4 isDisplayingVerticalSelection];
  [v4 setSelectionHighlightMode:0];
  dispatch_time_t v17 = [v4 _editMenuAssistant];
  [v17 cancelDelayedCommandRequests];

  [(UITextSelectionInteraction *)self _createGestureTuningIfNecessary];
  gestureTuning = self->_gestureTuning;
  BOOL v19 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v20 = [v61 touch];
  int v21 = [v19 setWithObject:v20];
  -[UITextGestureTuning updateWithTouches:gestureState:](gestureTuning, "updateWithTouches:gestureState:", v21, [v61 state]);

  long long v22 = [v61 name];
  LODWORD(v21) = [v22 isEqualToString:0x1ED174060];

  if (v21) {
    uint64_t v23 = 3;
  }
  else {
    uint64_t v23 = 1;
  }
  if (self->_activeLoupeSession && ![(UITextInteraction *)self _textInputIsInteractive])
  {
    [(UITextLoupeSession *)self->_activeLoupeSession invalidate];
    activeLoupeSession = self->_activeLoupeSession;
    self->_activeLoupeSession = 0;
  }
  if ([v61 state] == 1)
  {
    double v25 = [v4 activeSelectionController];
    activeSelectionController = self->_activeSelectionController;
    self->_activeSelectionController = v25;

    BOOL v27 = [v5 textInputView];
    [v61 locationOfFirstTap];
    objc_msgSend(v27, "convertPoint:fromView:", 0);
    double v29 = v28;
    double v31 = v30;

    [(UITextInteraction *)self setInGesture:1];
    if ([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
    {
      long long v32 = [v4 obtainSelectionGrabberSuppressionAssertion];
      grabberSuppressionAssertion = self->_grabberSuppressionAssertion;
      self->_grabberSuppressionAssertion = v32;

      [(UITextInteraction *)self _cancelRecognizerWithName:0x1ED1740E0];
      -[UITextSelectionInteraction _updateTapGestureHistoryWithLocation:](self, "_updateTapGestureHistoryWithLocation:", v29, v31);
    }
    [v4 setFirstResponderIfNecessary];
    CGRect v34 = [(_UIKeyboardTextSelectionController *)self->_activeSelectionController selection];
    [v34 caretRect];
    double v36 = v35;

    -[UITextGestureTuning assertInitialPositionFromTopOfCaret:distanceFromCaret:](self->_gestureTuning, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", v31 - v36, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    if ([(UITextInteraction *)self _textInputIsInteractive])
    {
      if (![(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
      {
        id v37 = [v61 touch];
        int v38 = objc_msgSend(v4, "shouldDisplayLoupeSessionForTouchType:", objc_msgSend(v37, "type"));

        if (v38)
        {
          id v39 = [v4 _caretView];
          CGPoint v40 = [v5 textInputView];
          +[UITextLoupeSession _beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:](UITextLoupeSession, "_beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:", v39, v40, [v4 loupeOrientation], v29, v31);
          v41 = (UITextLoupeSession *)objc_claimAutoreleasedReturnValue();
          v42 = self->_activeLoupeSession;
          self->_activeLoupeSession = v41;

          [(UITextLoupeSession *)self->_activeLoupeSession setGestureTuning:self->_gestureTuning];
        }
      }
      [v4 willBeginSelectionInteraction];
      [(UITextInteraction *)self _beginSelectionChange];
      [(UITextInteraction *)self _cancelRecognizerWithName:0x1ED174000];
      [(_UIKeyboardTextSelectionController *)self->_activeSelectionController beginSelection];
      -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:completionHandler:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:completionHandler:", v23, 0, v29, v31);
      [(_UIKeyboardTextSelectionController *)self->_activeSelectionController restartSelection];
    }
    [v4 notifyKeyboardSelectionChanged];
    v44 = (void *)v59;
    v43 = v60;
  }
  else if ([v61 state] == 2 {
         && [(UITextInteraction *)self _textInputIsInteractive])
  }
  {
    if ([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
    {
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v23, 0, v9, v11);
      double v45 = v9;
      double v46 = v11;
      v43 = v60;
    }
    else
    {
      v49 = self->_gestureTuning;
      if (v49) {
        char v50 = v16;
      }
      else {
        char v50 = 1;
      }
      double v45 = v9;
      double v46 = v11;
      if ((v50 & 1) == 0)
      {
        -[UITextGestureTuning touchAlignedPointForPoint:translation:](v49, "touchAlignedPointForPoint:translation:", v9, v11, v13, v15);
        double v45 = v51;
        double v46 = v52;
      }
      v43 = v60;
      objc_msgSend(v60, "setMagnificationPoint:", v45, v46);
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v23, 0, v45, v46);
      v53 = self->_activeLoupeSession;
      v54 = [(_UIKeyboardTextSelectionController *)self->_activeSelectionController selection];
      [v54 caretRect];
      -[UITextLoupeSession moveToPoint:withCaretRect:trackingCaret:](v53, "moveToPoint:withCaretRect:trackingCaret:", 0, v9, v11, v55, v56, v57, v58);
    }
    v44 = (void *)v59;
    [v4 notifyKeyboardSelectionChanged];
    objc_msgSend(v4, "startAutoscroll:", v45, v46);
  }
  else
  {
    v44 = (void *)v59;
    v43 = v60;
    if (([v61 state] == 3 || objc_msgSend(v61, "state") == 4)
      && [(UITextInteraction *)self _textInputIsInteractive])
    {
      [v4 cancelAutoscroll];
      if (self->_grabberSuppressionAssertion)
      {
        objc_msgSend(v4, "setGrabberSuppressionAssertion:");
        v47 = self->_grabberSuppressionAssertion;
        self->_grabberSuppressionAssertion = 0;
      }
      [(UITextLoupeSession *)self->_activeLoupeSession invalidate];
      v48 = self->_activeLoupeSession;
      self->_activeLoupeSession = 0;

      [(UITextSelectionInteraction *)self _showSelectionCommandsIfApplicableAfterDelay:0.0];
      [(UITextInteraction *)self setInGesture:0];
      [v4 setExpectingCommit:1];
      [(UITextInteraction *)self _endSelectionChange];
      [v4 setExpectingCommit:0];
      [v4 didEndSelectionInteraction];
      [(_UIKeyboardTextSelectionController *)self->_activeSelectionController endSelection];
    }
  }
}

- (void)twoFingerRangedSelectGesture:(id)a3
{
  id v26 = a3;
  id v4 = [(UITextInteraction *)self assistantDelegate];
  [v4 setFirstResponderIfNecessary];
  [v4 setSelectionHighlightMode:0];
  int v5 = [v26 touches];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    double v7 = [v26 touches];
    double v8 = [v7 objectAtIndex:0];

    double v9 = [v26 touches];
    double v10 = [v9 objectAtIndex:1];

    double v11 = [(UITextInteraction *)self view];
    double v12 = [v11 _proxyTextInput];
    double v13 = [v12 textInputView];
    [v8 locationInView:v13];
    double v15 = v14;
    double v17 = v16;

    double v18 = [v11 _proxyTextInput];
    BOOL v19 = [v18 textInputView];
    [v10 locationInView:v19];
    double v21 = v20;
    double v23 = v22;

    char v24 = [v4 activeSelectionController];
    double v25 = [v24 selection];

    [v25 setGranularity:1];
    objc_msgSend(v25, "setSelectionWithFirstPoint:secondPoint:", v15, v17, v21, v23);
    [v25 commit];
    if ([v26 state] == 3) {
      [(UITextSelectionInteraction *)self _showSelectionCommandsIfApplicableAfterDelay:0.0];
    }
    [v4 notifyKeyboardSelectionChanged];
  }
}

- (void)setHybridSelectionWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(UITextInteraction *)self assistantDelegate];
  double v7 = [v6 activeSelectionController];
  id v10 = [v7 selection];

  double v8 = [(UITextInteraction *)self view];
  if ([v8 isEditable])
  {
  }
  else
  {
    char v9 = [v10 hasEditableSelection];

    if ((v9 & 1) == 0) {
      goto LABEL_5;
    }
  }
  objc_msgSend(v10, "setHybridSelectionWithPoint:", x, y);
LABEL_5:
}

- (BOOL)interaction_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
  {
    double v8 = [(UITextInteraction *)self assistantDelegate];
    v17.receiver = self;
    v17.super_class = (Class)UITextSelectionInteraction;
    if (![(UITextInteraction *)&v17 interaction_gestureRecognizer:v6 shouldReceiveTouch:v7])
    {
      BOOL v13 = 0;
LABEL_13:

      goto LABEL_14;
    }
    BOOL v9 = [(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior];
    id v10 = &UITextInteractionNameIndirectSingleTap;
    if (!v9) {
      id v10 = &UITextInteractionNameSingleTap;
    }
    id v11 = (id)*v10;
    id v12 = [(UITextInteraction *)self recognizerForName:v11];
    if (v12 == v6)
    {
      char v14 = [v8 useGesturesForEditableContent];

      if ((v14 & 1) == 0
        && ![(UITextSelectionInteraction *)self shouldHandleOneFingerTapInUneditable:v6])
      {
        BOOL v13 = 0;
        goto LABEL_12;
      }
    }
    else
    {
    }
    BOOL v13 = 1;
LABEL_12:

    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)UITextSelectionInteraction;
  BOOL v13 = [(UITextInteraction *)&v16 interaction_gestureRecognizer:v6 shouldReceiveTouch:v7];
LABEL_14:

  return v13;
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  self->_wasOriginallyFirstResponder = [(UITextInteraction *)self _textInputIsInteractive];
  int v5 = [(UITextInteraction *)self assistantDelegate];
  v15.receiver = self;
  v15.super_class = (Class)UITextSelectionInteraction;
  if ([(UITextInteraction *)&v15 interaction_gestureRecognizerShouldBegin:v4])
  {
    BOOL v6 = [(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior];
    id v7 = &UITextInteractionNameIndirectSingleTap;
    if (!v6) {
      id v7 = &UITextInteractionNameSingleTap;
    }
    id v8 = (id)*v7;
    id v9 = [(UITextInteraction *)self recognizerForName:v8];
    if (v9 == v4)
    {
      char v11 = [v5 useGesturesForEditableContent];

      if ((v11 & 1) == 0
        && ![(UITextSelectionInteraction *)self shouldHandleOneFingerTapInUneditable:v4])
      {
        char v10 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    if ([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
    {
      id v12 = [(UITextInteraction *)self parent];
      BOOL v13 = [v12 recognizerForName:0x1ED174120];

      if (v13)
      {
        if ([v13 state] == 3) {
          char v10 = 0;
        }
        else {
          char v10 = -1;
        }
      }
      else
      {
        char v10 = 1;
      }
    }
    else
    {
      char v10 = 1;
    }
    goto LABEL_17;
  }
  char v10 = 0;
LABEL_18:

  return v10 & 1;
}

- (BOOL)shouldHandleOneFingerTapInUneditable:(id)a3
{
  id v4 = [(UITextInteraction *)self assistantDelegate];
  if ([(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior])
  {
    int v5 = [(UITextInteraction *)self recognizerForName:0x1ED174020];
    BOOL v6 = [v4 activeSelectionController];
    id v7 = [v6 selection];
    id v8 = [v7 selectedRange];
    int v9 = [v8 _isRanged];

    BOOL v10 = 1;
    if (v9) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    [v5 setMinimumNumberOfTapsRequired:v11];
  }
  else
  {
    id v12 = [(UITextInteraction *)self view];
    char v13 = [v4 viewCouldBecomeEditable:v12];

    if (v13) {
      goto LABEL_8;
    }
    char v14 = [v4 activeSelectionController];
    objc_super v15 = [v14 selection];
    objc_super v16 = [v15 selectedRange];
    char v17 = [v16 _isRanged];

    if (v17)
    {
LABEL_8:
      BOOL v10 = 1;
    }
    else
    {
      double v18 = [(UITextInteraction *)self linkInteractionSession];

      BOOL v10 = v18 != 0;
    }
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UITextInteraction *)self recognizerForName:0x1ED174040];
  if (v8 != v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_6;
  }
  int v9 = [v7 _isForPointer];
  int v10 = [(UITextSelectionInteraction *)self _usesIndirectSelectionBehavior];

  if (v9 != v10)
  {
LABEL_6:
    BOOL v11 = 0;
    goto LABEL_7;
  }
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UITextInteraction *)self recognizerForName:0x1ED174020];
  if (v8 == v6 && [v7 _isGestureType:0])
  {
    if (self->_viewConformsToTextInput)
    {
      int v9 = [v7 view];
      int v10 = [(UITextInteraction *)self view];
      unsigned __int8 v11 = [v9 isDescendantOfView:v10];
    }
    else
    {
      unsigned __int8 v11 = 1;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UITextSelectionInteraction;
    unsigned __int8 v11 = [(UITextInteraction *)&v13 gestureRecognizer:v6 shouldRecognizeSimultaneouslyWithGestureRecognizer:v7];
  }

  return v11;
}

@end