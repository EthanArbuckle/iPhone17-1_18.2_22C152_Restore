@interface UITextRefinementInteraction
- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldUseLineThreshold;
- (BOOL)strongerBiasAgainstUp;
- (BOOL)translationIsWithinAllowableMovement:(CGPoint)a3;
- (BOOL)triggeredByLongPress;
- (CGPoint)pointIfPlacedCarefully:(CGPoint)result;
- (CGPoint)touchAlignedPointForPoint:(CGPoint)a3 translation:(CGPoint)a4;
- (UITextGestureTuning)gestureTuning;
- (UITextRefinementInteraction)initWithBehaviorDelegate:(id)a3;
- (UITextRefinementInteractionBehaviorDelegate)behaviorDelegate;
- (_UITextLoupeResponderProxy)responderProxy;
- (int64_t)inheritedGranularity;
- (void)_createGestureTuningIfNecessary;
- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7;
- (void)_processGestureForCustomHighlighter:(id)a3;
- (void)canBeginDragCursor:(id)a3;
- (void)cancelDelayedLoupeActionIfNecessary;
- (void)delayedDisplayLoupe:(id)a3;
- (void)delayedLoupeAction:(id)a3;
- (void)delayedSelectionAction:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)finishSetup;
- (void)loupeGesture:(id)a3;
- (void)loupeGestureWithState:(int64_t)a3 location:(id)a4 translation:(id)a5 velocity:(id)a6 modifierFlags:(int64_t)a7 shouldCancel:(BOOL *)a8;
- (void)setBehaviorDelegate:(id)a3;
- (void)setInheritedGranularity:(int64_t)a3;
- (void)setResponderProxy:(id)a3;
- (void)setShouldUseLineThreshold:(BOOL)a3;
- (void)setStrongerBiasAgainstUp:(BOOL)a3;
- (void)setTriggeredByLongPress:(BOOL)a3;
- (void)setupDelayedLoupeActionWithInitialPoint:(CGPoint)a3;
- (void)setupGestureExclusionRequirements;
- (void)updateInitialPoint:(CGPoint)a3;
- (void)updateOrCancelDelayedLoupeActionWithPoint:(CGPoint)a3 translation:(CGPoint)a4;
- (void)updateVisibilityOffsetForGesture:(id)a3;
- (void)willBeginExternalGesture;
- (void)willMoveToView:(id)a3;
@end

@implementation UITextRefinementInteraction

- (void)willMoveToView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextRefinementInteraction;
  [(UITextInteraction *)&v6 willMoveToView:a3];
  [(UIDelayedAction *)self->_delayedLoupeAction cancel];
  delayedLoupeAction = self->_delayedLoupeAction;
  self->_delayedLoupeAction = 0;

  [(UIDelayedAction *)self->_delayedSelectionAction cancel];
  delayedSelectionAction = self->_delayedSelectionAction;
  self->_delayedSelectionAction = 0;
}

- (void)finishSetup
{
  v7.receiver = self;
  v7.super_class = (Class)UITextRefinementInteraction;
  [(UITextInteraction *)&v7 finishSetup];
  v3 = [(UITextRefinementInteraction *)self behaviorDelegate];
  [v3 adjustVariableDelaySettingsForLoupeInteraction:self];

  [(UITextRefinementInteraction *)self setupGestureExclusionRequirements];
  v4 = [(UITextInteraction *)self _textInput];
  v5 = +[_UITextLoupeResponderProxy _proxyWithResponder:v4];
  [(UITextRefinementInteraction *)self setResponderProxy:v5];

  objc_super v6 = [(UITextRefinementInteraction *)self responderProxy];
  [v6 setDelegate:self];
}

- (void)didMoveToView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITextRefinementInteraction;
  id v4 = a3;
  [(UITextInteraction *)&v6 didMoveToView:v4];
  -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v4, v6.receiver, v6.super_class);

  v5 = [(UITextRefinementInteraction *)self behaviorDelegate];
  [v5 adjustVariableDelaySettingsForLoupeInteraction:self];

  self->_inheritedGranularity = -1;
}

- (UITextRefinementInteractionBehaviorDelegate)behaviorDelegate
{
  return self->_behaviorDelegate;
}

- (void)setupGestureExclusionRequirements
{
  id v3 = [(UITextRefinementInteraction *)self behaviorDelegate];
  [v3 configureGestureExclusionRequirementsForTextLoupeInteraction:self];
}

- (void)setResponderProxy:(id)a3
{
}

- (_UITextLoupeResponderProxy)responderProxy
{
  return self->_responderProxy;
}

- (UITextRefinementInteraction)initWithBehaviorDelegate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UITextRefinementInteraction;
  objc_super v6 = [(UITextInteraction *)&v10 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_behaviorDelegate, a3);
    v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "gestureRecognizerClassForLoupeInteraction:", v7)), "initWithTarget:action:", v7, sel_loupeGesture_);
    [v5 configureLoupeGestureRecognizer:v8 forTextLoupeInteraction:v7];
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responderProxy, 0);
  objc_storeStrong((id *)&self->_behaviorDelegate, 0);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
  objc_storeStrong((id *)&self->_delayedSelectionAction, 0);
  objc_storeStrong((id *)&self->_delayedLoupeAction, 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (void)updateInitialPoint:(CGPoint)a3
{
  self->_hasPerformedInteraction = 1;
  self->_initialPointFromPreviousInteraction = a3;
  [(UITextGestureTuning *)self->_gestureTuning setStrongerBiasAgainstUp:1];
}

- (BOOL)_shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(UITextRefinementInteraction *)self behaviorDelegate];
  char v9 = [v8 shouldAllowEnforcedTouchTypeForTouch:v7 forGestureRecognizer:v6];

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UITextRefinementInteraction;
  if ([(UITextInteraction *)&v15 gestureRecognizer:v6 shouldRecognizeSimultaneouslyWithGestureRecognizer:v7])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = [(UITextInteraction *)self recognizerForName:0x1ED1740E0];

    if (v9 != v6) {
      goto LABEL_4;
    }
    if (![(UITextInteraction *)self inGesture])
    {
      char v8 = [v7 _isGestureType:0];
      goto LABEL_5;
    }
    v11 = [v7 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v13 = [v7 view];
      id v14 = [v13 panGestureRecognizer];
      char v8 = v14 == v7;
    }
    else
    {
LABEL_4:
      char v8 = 0;
    }
  }
LABEL_5:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UITextInteraction *)self recognizerForName:0x1ED1740E0];

  BOOL v9 = 0;
  if (v8 == v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UITextInteraction *)self recognizerForName:0x1ED1740E0];
  if (v8 != v6)
  {

LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  char v9 = [v7 _isGestureType:10];

  if ((v9 & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)interaction_gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextRefinementInteraction *)self behaviorDelegate];
  LOBYTE(self) = [v5 loupeGestureRecognizerShouldBegin:v4 forTextLoupeInteraction:self];

  return (char)self;
}

- (void)loupeGesture:(id)a3
{
  id v4 = a3;
  char v24 = 0;
  [(UITextRefinementInteraction *)self updateVisibilityOffsetForGesture:v4];
  id v5 = [(UITextInteraction *)self root];
  id v6 = [v5 delegate];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v4 modifierFlags];
    id v8 = [v4 _activeEventOfType:0];
    uint64_t v9 = [v8 _containsHIDPointerEvent] ? 3 : 0;
    int v10 = [v6 _shouldBeginCustomHighlighterActionForTouchType:v9 modifierFlags:v7];

    if (!v10) {
      goto LABEL_8;
    }
  }
  v11 = [(UITextInteraction *)self root];
  v12 = [v11 delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    [(UITextRefinementInteraction *)self _processGestureForCustomHighlighter:v4];
  }
  else
  {
LABEL_8:
    id v14 = [(UITextRefinementInteraction *)self behaviorDelegate];
    -[UITextRefinementInteraction setTriggeredByLongPress:](self, "setTriggeredByLongPress:", [v14 triggeredByLongPressGesture:v4]);

    uint64_t v15 = [v4 state];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__UITextRefinementInteraction_loupeGesture___block_invoke;
    v21[3] = &unk_1E52EE9A8;
    id v22 = v4;
    v23 = self;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__UITextRefinementInteraction_loupeGesture___block_invoke_2;
    v19[3] = &unk_1E52EE9A8;
    v19[4] = self;
    id v20 = v22;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__UITextRefinementInteraction_loupeGesture___block_invoke_3;
    v17[3] = &unk_1E52EE9A8;
    v17[4] = self;
    v16 = v20;
    id v18 = v16;
    [(UITextRefinementInteraction *)self loupeGestureWithState:v15 location:v21 translation:v19 velocity:v17 modifierFlags:0 shouldCancel:&v24];
    if (v16 && v24 && (v16[1] & 0x200000000) != 0) {
      [v16 setState:5];
    }
  }
}

double __44__UITextRefinementInteraction_loupeGesture___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 1)
  {
    v2 = [*(id *)(a1 + 40) behaviorDelegate];
    [v2 startPointForLoupeGesture:*(void *)(a1 + 32)];
    double v4 = v3;
    double v6 = v5;

    uint64_t v7 = [*(id *)(a1 + 32) view];
    id v8 = [*(id *)(a1 + 40) _textInput];
    uint64_t v9 = [v8 textInputView];
    objc_msgSend(v7, "convertPoint:toView:", v9, v4, v6);
    double v11 = v10;
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) _textInput];
    id v8 = [v7 textInputView];
    [v12 locationInView:v8];
    double v11 = v13;
  }

  return v11;
}

double __44__UITextRefinementInteraction_loupeGesture___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) behaviorDelegate];
  double v3 = [*(id *)(a1 + 32) _textInput];
  double v4 = [v3 textInputView];
  [v2 translationInView:v4 forLoupeGesture:*(void *)(a1 + 40)];
  double v6 = v5;

  return v6;
}

double __44__UITextRefinementInteraction_loupeGesture___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) behaviorDelegate];
  double v3 = [*(id *)(a1 + 32) _textInput];
  double v4 = [v3 textInputView];
  [v2 velocityInView:v4 forLoupeGesture:*(void *)(a1 + 40)];
  double v6 = v5;

  return v6;
}

- (void)_processGestureForCustomHighlighter:(id)a3
{
  id v31 = a3;
  double v4 = [(UITextInteraction *)self _textInput];
  double v5 = [v4 textInputView];
  [v31 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(UITextRefinementInteraction *)self behaviorDelegate];
  double v11 = [(UITextInteraction *)self _textInput];
  v12 = [v11 textInputView];
  [v10 translationInView:v12 forLoupeGesture:v31];
  double v14 = v13;
  double v16 = v15;

  v17 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v18 = [v17 preferencesActions];
  LODWORD(v12) = [v18 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

  if (v12)
  {
    if ([v31 state] == 1)
    {
      -[UITextRefinementInteraction updateInitialPoint:](self, "updateInitialPoint:", v7, v9);
      v19 = [(UITextInteraction *)self root];
      [v19 _playFeedbackForCursorMovement];
LABEL_4:

      goto LABEL_10;
    }
    if ([v31 state] != 2)
    {
      if ([v31 state] != 3 && objc_msgSend(v31, "state") != 4) {
        goto LABEL_10;
      }
      -[UITextRefinementInteraction pointIfPlacedCarefully:](self, "pointIfPlacedCarefully:", v7, v9);
      -[UITextRefinementInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:");
      double v7 = v22;
      double v9 = v23;
      double v24 = _UIGetTextRefinement_AllowableMovement();
      v25 = [(UITextInteraction *)self _textInput];
      char v26 = [v25 isEditable];

      if (v26) {
        goto LABEL_10;
      }
      v29 = [(UITextInteraction *)self assistantDelegate];
      v19 = v29;
      if (v14 * v14 + v16 * v16 <= v24 * v24)
      {
        v30 = [v29 _editMenuAssistant];
        [v30 showSelectionCommands];
      }
      [v19 setNeedsSelectionDisplayUpdate];
      goto LABEL_4;
    }
    -[UITextRefinementInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:", v7, v9, v14, v16);
    double v7 = v20;
    double v9 = v21;
  }
LABEL_10:
  v27 = [(UITextInteraction *)self root];
  v28 = [v27 delegate];
  objc_msgSend(v28, "_performHighlighterActionWithGestureState:location:", objc_msgSend(v31, "state"), v7, v9);
}

- (void)loupeGestureWithState:(int64_t)a3 location:(id)a4 translation:(id)a5 velocity:(id)a6 modifierFlags:(int64_t)a7 shouldCancel:(BOOL *)a8
{
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = [(UITextRefinementInteraction *)self behaviorDelegate];
  [v17 textLoupeInteraction:self gestureChangedWithState:a3 location:v16 translation:v15 velocity:v14 modifierFlags:a7 shouldCancel:a8];
}

- (void)willBeginExternalGesture
{
  gestureTuning = self->_gestureTuning;
  self->_gestureTuning = 0;
}

- (CGPoint)pointIfPlacedCarefully:(CGPoint)result
{
  gestureTuning = self->_gestureTuning;
  if (gestureTuning) {
    -[UITextGestureTuning pointIfPlacedCarefully:](gestureTuning, "pointIfPlacedCarefully:", result.x, result.y);
  }
  return result;
}

- (void)_createGestureTuningIfNecessary
{
  if (!self->_gestureTuning)
  {
    double v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v4 = [v3 preferencesActions];
    int v5 = [v4 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

    if (v5)
    {
      double v6 = objc_alloc_init(UITextGestureTuning);
      gestureTuning = self->_gestureTuning;
      self->_gestureTuning = v6;

      double v8 = [(UITextInteraction *)self view];
      [(UITextGestureTuning *)self->_gestureTuning setContainerCoordinateSpace:v8];

      double v9 = self->_gestureTuning;
      [(UITextGestureTuning *)v9 setShouldUseLineThreshold:1];
    }
  }
}

- (BOOL)shouldUseLineThreshold
{
  return [(UITextGestureTuning *)self->_gestureTuning shouldUseLineThreshold];
}

- (void)setShouldUseLineThreshold:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITextRefinementInteraction *)self _createGestureTuningIfNecessary];
  gestureTuning = self->_gestureTuning;
  [(UITextGestureTuning *)gestureTuning setShouldUseLineThreshold:v3];
}

- (BOOL)strongerBiasAgainstUp
{
  return [(UITextGestureTuning *)self->_gestureTuning strongerBiasAgainstUp];
}

- (void)setStrongerBiasAgainstUp:(BOOL)a3
{
  BOOL v3 = a3;
  [(UITextRefinementInteraction *)self _createGestureTuningIfNecessary];
  gestureTuning = self->_gestureTuning;
  [(UITextGestureTuning *)gestureTuning setStrongerBiasAgainstUp:v3];
}

- (void)updateVisibilityOffsetForGesture:(id)a3
{
  id v4 = a3;
  [(UITextRefinementInteraction *)self _createGestureTuningIfNecessary];
  gestureTuning = self->_gestureTuning;
  id v7 = [v4 _allActiveTouches];
  uint64_t v6 = [v4 state];

  [(UITextGestureTuning *)gestureTuning updateWithTouches:v7 gestureState:v6];
}

- (CGPoint)touchAlignedPointForPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  if (self->_gestureTuning)
  {
    double v6 = a4.y;
    double v7 = a4.x;
    double v9 = [(UITextRefinementInteraction *)self behaviorDelegate];
    int v10 = [v9 usesTouchAlignment];

    if (v10)
    {
      -[UITextGestureTuning touchAlignedPointForPoint:translation:](self->_gestureTuning, "touchAlignedPointForPoint:translation:", x, y, v7, v6);
      double x = v11;
      double y = v12;
    }
  }
  double v13 = x;
  double v14 = y;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)setupDelayedLoupeActionWithInitialPoint:(CGPoint)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", a3.x, a3.y);
  delayedLoupeAction = self->_delayedLoupeAction;
  id v11 = (id)v4;
  if (!delayedLoupeAction)
  {
    double v6 = [[UIDelayedAction alloc] initWithTarget:self action:sel_delayedLoupeAction_ userInfo:0 delay:0.0];
    double v7 = self->_delayedLoupeAction;
    self->_delayedLoupeAction = v6;

    uint64_t v4 = (uint64_t)v11;
    delayedLoupeAction = self->_delayedLoupeAction;
  }
  [(UIDelayedAction *)delayedLoupeAction setUserInfo:v4];
  [(UIDelayedAction *)self->_delayedLoupeAction touch];
  delayedSelectionAction = self->_delayedSelectionAction;
  if (!delayedSelectionAction)
  {
    double v9 = [[UIDelayedAction alloc] initWithTarget:self action:sel_delayedSelectionAction_ userInfo:0 delay:0.5];
    int v10 = self->_delayedSelectionAction;
    self->_delayedSelectionAction = v9;

    delayedSelectionAction = self->_delayedSelectionAction;
  }
  [(UIDelayedAction *)delayedSelectionAction setUserInfo:v11];
  [(UIDelayedAction *)self->_delayedSelectionAction touch];
}

- (BOOL)translationIsWithinAllowableMovement:(CGPoint)a3
{
  CGFloat v3 = a3.x * a3.x + a3.y * a3.y;
  double v4 = _UIGetTextRefinement_AllowableMovement();
  return v3 < v4 * v4;
}

- (void)updateOrCancelDelayedLoupeActionWithPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v7 = -[UITextRefinementInteraction translationIsWithinAllowableMovement:](self, "translationIsWithinAllowableMovement:", a4.x, a4.y);
  if (self->_delayedLoupeAction)
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
    [(UIDelayedAction *)self->_delayedLoupeAction setUserInfo:v8];

    if (!v7)
    {
      if ([(UIDelayedAction *)self->_delayedLoupeAction scheduled])
      {
        if ([(UITextGestureTuning *)self->_gestureTuning shouldUseLineThreshold])
        {
          double v9 = [(UITextInteraction *)self assistantDelegate];
          [v9 willBeginFloatingCursor:0];
          objc_msgSend(v9, "beginFloatingCursorAtPoint:", x, y);
        }
        [(UIDelayedAction *)self->_delayedLoupeAction cancel];
        int v10 = +[UITextMagnifierCaret sharedCaretMagnifier];
        id v11 = [(UITextInteraction *)self _textInput];
        double v12 = [v11 textInputView];
        objc_msgSend(v10, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v12, v11, 1, x, y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      }
    }
  }
  if (self->_delayedSelectionAction)
  {
    double v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
    [(UIDelayedAction *)self->_delayedSelectionAction setUserInfo:v13];

    if (!v7)
    {
      if ([(UIDelayedAction *)self->_delayedSelectionAction scheduled])
      {
        delayedSelectionAction = self->_delayedSelectionAction;
        [(UIDelayedAction *)delayedSelectionAction cancel];
      }
    }
  }
}

- (void)cancelDelayedLoupeActionIfNecessary
{
  delayedLoupeAction = self->_delayedLoupeAction;
  if (delayedLoupeAction) {
    [(UIDelayedAction *)delayedLoupeAction cancel];
  }
  delayedSelectionAction = self->_delayedSelectionAction;
  if (delayedSelectionAction)
  {
    [(UIDelayedAction *)delayedSelectionAction cancel];
  }
}

- (void)delayedLoupeAction:(id)a3
{
  id v5 = a3;
  if ([(UITextGestureTuning *)self->_gestureTuning shouldUseLineThreshold])
  {
    double v4 = [(UITextInteraction *)self assistantDelegate];
    [v4 willBeginFloatingCursor:0];
    [v5 CGPointValue];
    objc_msgSend(v4, "beginFloatingCursorAtPoint:");
  }
}

- (void)delayedSelectionAction:(id)a3
{
}

- (void)delayedDisplayLoupe:(id)a3
{
  [a3 CGPointValue];
  double v5 = v4;
  double v7 = v6;
  id v10 = +[UITextMagnifierCaret sharedCaretMagnifier];
  double v8 = [(UITextInteraction *)self _textInput];
  double v9 = [v8 textInputView];
  objc_msgSend(v10, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v9, v8, 1, v5, v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)canBeginDragCursor:(id)a3
{
  id v4 = a3;
  id v5 = [(UITextInteraction *)self assistantDelegate];
  [v5 canBeginDragCursor:v4];
}

- (void)_performGestureType:(int64_t)a3 state:(int64_t)a4 location:(CGPoint)a5 locationOfFirstTouch:(CGPoint)a6 forTouchType:(int64_t)a7
{
  double y = a5.y;
  double x = a5.x;
  if (a3 == 4)
  {
    double v11 = a6.y;
    double v12 = a6.x;
    id v13 = [(UITextInteraction *)self assistantDelegate];
    objc_msgSend(v13, "lollipopGestureWithState:location:locationOfFirstTouch:forTouchType:", a4, a7, x, y, v12, v11);
  }
  else if (a3 == 3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __100__UITextRefinementInteraction__performGestureType_state_location_locationOfFirstTouch_forTouchType___block_invoke;
    v14[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
    CGPoint v15 = a5;
    [(UITextRefinementInteraction *)self loupeGestureWithState:a4 location:v14 translation:&__block_literal_global_559 velocity:&__block_literal_global_47_3 modifierFlags:0 shouldCancel:0];
  }
}

double __100__UITextRefinementInteraction__performGestureType_state_location_locationOfFirstTouch_forTouchType___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __100__UITextRefinementInteraction__performGestureType_state_location_locationOfFirstTouch_forTouchType___block_invoke_2()
{
  return *MEMORY[0x1E4F1DAD8];
}

double __100__UITextRefinementInteraction__performGestureType_state_location_locationOfFirstTouch_forTouchType___block_invoke_3()
{
  return *MEMORY[0x1E4F1DAD8];
}

- (BOOL)triggeredByLongPress
{
  return self->_triggeredByLongPress;
}

- (void)setTriggeredByLongPress:(BOOL)a3
{
  self->_triggeredByLongPress = a3;
}

- (UITextGestureTuning)gestureTuning
{
  return self->_gestureTuning;
}

- (int64_t)inheritedGranularity
{
  return self->_inheritedGranularity;
}

- (void)setInheritedGranularity:(int64_t)a3
{
  self->_inheritedGranularitdouble y = a3;
}

- (void)setBehaviorDelegate:(id)a3
{
}

@end