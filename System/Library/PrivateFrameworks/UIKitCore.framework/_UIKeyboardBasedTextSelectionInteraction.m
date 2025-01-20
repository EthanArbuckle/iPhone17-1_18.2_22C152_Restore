@interface _UIKeyboardBasedTextSelectionInteraction
- (BOOL)enclosingScrollViewIsScrolling;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (UITextGestureTuning)gestureTuning;
- (id)owner;
- (void)_createGestureTuningIfNecessary;
- (void)_processGestureForCustomHighlighter:(id)a3;
- (void)beginOneFingerSelectWithTranslation:(CGPoint)a3 executionContext:(id)a4;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)endOneFingerSelectWithExecutionContext:(id)a3;
- (void)oneFingerForcePan:(id)a3;
- (void)oneFingerForcePress:(id)a3;
- (void)transitionFromBlockMagnifyToBlockSelectWithLocation:(CGPoint)a3 viaDrag:(BOOL)a4;
- (void)updateOneFingerSelectWithTranslation:(CGPoint)a3 executionContext:(id)a4;
@end

@implementation _UIKeyboardBasedTextSelectionInteraction

- (void)didMoveToView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIKeyboardBasedTextSelectionInteraction;
  id v4 = a3;
  [(UITextInteraction *)&v5 didMoveToView:v4];
  -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v4, v5.receiver, v5.super_class);
}

- (id)owner
{
  v4.receiver = self;
  v4.super_class = (Class)_UIKeyboardBasedTextSelectionInteraction;
  v2 = [(_UIKeyboardTextSelectionInteraction *)&v4 owner];
  return v2;
}

- (void)dealloc
{
  gestureTuning = self->_gestureTuning;
  self->_gestureTuning = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIKeyboardBasedTextSelectionInteraction;
  [(_UIKeyboardTextSelectionInteraction *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

- (void)_createGestureTuningIfNecessary
{
  if (!self->_gestureTuning)
  {
    v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    objc_super v4 = [v3 preferencesActions];
    int v5 = [v4 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

    if (v5)
    {
      v6 = objc_alloc_init(UITextGestureTuning);
      gestureTuning = self->_gestureTuning;
      self->_gestureTuning = v6;

      v8 = [(UITextInteraction *)self view];
      [(UITextGestureTuning *)self->_gestureTuning setContainerCoordinateSpace:v8];

      [(UITextGestureTuning *)self->_gestureTuning setShouldUseLineThreshold:1];
      [(UITextGestureTuning *)self->_gestureTuning setIncludeTipProjection:1];
      v9 = self->_gestureTuning;
      [(UITextGestureTuning *)v9 setStrongerBiasAgainstUp:1];
    }
  }
}

- (void)_processGestureForCustomHighlighter:(id)a3
{
  id v4 = a3;
  int v5 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
  v6 = [(UITextInteraction *)self _textInput];
  v7 = [v6 textInputView];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = [(UITextInteraction *)self _textInput];
  v13 = [v12 textInputView];
  [v4 _translationInView:v13];
  long double v15 = v14;
  long double v17 = v16;

  if (![v4 didLongPress]) {
    goto LABEL_8;
  }
  id v18 = v4;
  if ([v18 state] != 3 && objc_msgSend(v18, "state") != 4)
  {
    uint64_t v20 = [v18 state];

    if (v20 != 5
      && ![(_UIKeyboardBasedTextSelectionInteraction *)self enclosingScrollViewIsScrolling])
    {
      double v34 = hypot(v15, v17);
      id v18 = +[_UITextSelectionSettings sharedInstance];
      [v18 allowableForceMovement];
      BOOL v19 = v34 > v35;
      goto LABEL_5;
    }
LABEL_8:
    BOOL v19 = 1;
    goto LABEL_9;
  }
  BOOL v19 = 1;
LABEL_5:

LABEL_9:
  v21 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v22 = [v21 preferencesActions];
  int v23 = [v22 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

  if (v23)
  {
    if ([v5 panGestureState]) {
      char v24 = 1;
    }
    else {
      char v24 = v19;
    }
    if ((v24 & 1) == 0)
    {
      [v5 setPanGestureState:6];
      v29 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      [v29 willBeginHighlighterGesture];

      v30 = [(UITextInteraction *)self root];
      [v30 _playFeedbackForCursorMovement];

      uint64_t v26 = 1;
      goto LABEL_22;
    }
    if ([v5 panGestureState] == 6)
    {
      id v25 = v4;
      if ([v25 state] == 3 || objc_msgSend(v25, "state") == 4)
      {
      }
      else
      {
        uint64_t v36 = [v25 state];

        if (v36 != 5)
        {
          uint64_t v26 = 2;
LABEL_19:
          -[UITextGestureTuning touchAlignedPointForPoint:translation:](self->_gestureTuning, "touchAlignedPointForPoint:translation:", v9, v11, (double)v15, (double)v17);
          if (v26)
          {
            double v9 = v27;
            double v11 = v28;
LABEL_22:
            v31 = [(UITextInteraction *)self root];
            v32 = [v31 delegate];
            objc_msgSend(v32, "_performHighlighterActionWithGestureState:location:", v26, v9, v11);

            goto LABEL_23;
          }
          goto LABEL_23;
        }
      }
      uint64_t v26 = [v25 state];
      goto LABEL_19;
    }
  }
LABEL_23:
  id v37 = v4;
  if ([v37 state] == 3 || objc_msgSend(v37, "state") == 4)
  {

LABEL_26:
    [v5 setDidLongForcePress:0];
    [v5 setDidFloatCursor:0];
    [v5 setDelayForceMagnify:0];
    [v5 setPreviousForcePressCount:0];
    [v5 setPanGestureState:0];
    objc_msgSend(v37, "setShouldFailWithoutForce:", objc_msgSend(v5, "oneFingerForcePressShouldFailWithoutForce"));
    goto LABEL_27;
  }
  uint64_t v33 = [v37 state];

  if (v33 == 5) {
    goto LABEL_26;
  }
LABEL_27:
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  v7 = [a3 view];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  return !-[UITextInteraction currentSelectionContainsPoint:](self, "currentSelectionContainsPoint:", v9, v11);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return [a4 _isGestureType:1];
}

- (BOOL)enclosingScrollViewIsScrolling
{
  v3 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
  id v4 = [v3 delegate];
  int v5 = [v4 textSelectionController];

  if (!v5) {
    return 0;
  }
  id v6 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  v7 = [v6 textInputView];
  double v8 = [v7 _scroller];

  if (v8) {
    char v9 = [v8 isDragging];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (void)transitionFromBlockMagnifyToBlockSelectWithLocation:(CGPoint)a3 viaDrag:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  double v8 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
  int v9 = [v8 delayForceMagnify];
  double v10 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  double v11 = v10;
  if (v9)
  {
    objc_msgSend(v10, "beginLoupeMagnifierAtPoint:", x, y);

    [v8 setDelayForceMagnify:0];
  }
  else
  {
    [v10 willHandoffLoupeMagnifier];
  }
  v12 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v12 setRangedSelectionShouldShowGrabbers:1];

  [v8 setDidSuppressSelectionGrabbers:0];
  [v8 setPreviousRepeatedGranularity:1];
  v13 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v13 endSelection];

  double v14 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v14 switchToRangedSelection];

  [v8 setPanGestureState:2];
  if (v4)
  {
    if (qword_1EB25B378 != -1) {
      dispatch_once(&qword_1EB25B378, &__block_literal_global_474);
    }
    long double v15 = [v8 delegate];
    double v16 = [v15 taskQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_3;
    v28[3] = &unk_1E52E3880;
    *(double *)&v29[1] = x;
    *(double *)&v29[2] = y;
    long double v17 = (id *)v29;
    v28[4] = self;
    v29[0] = v8;
    uint64_t v18 = qword_1EB25B370;
    id v19 = v8;
    uint64_t v20 = v28;
  }
  else
  {
    if (qword_1EB25B388 != -1) {
      dispatch_once(&qword_1EB25B388, &__block_literal_global_480);
    }
    long double v15 = [v8 delegate];
    double v16 = [v15 taskQueue];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    char v24 = __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_7;
    id v25 = &unk_1E52E3880;
    long double v17 = (id *)v27;
    uint64_t v26 = self;
    v27[0] = v8;
    *(double *)&v27[1] = x;
    *(double *)&v27[2] = y;
    uint64_t v18 = qword_1EB25B380;
    id v21 = v8;
    uint64_t v20 = &v22;
  }
  objc_msgSend(v16, "addTask:breadcrumb:", v20, v18, v22, v23, v24, v25, v26);
}

- (void)beginOneFingerSelectWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

  if (v8)
  {
    int v9 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    double v10 = v9;
    if (v7)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __97___UIKeyboardBasedTextSelectionInteraction_beginOneFingerSelectWithTranslation_executionContext___block_invoke;
      v13[3] = &unk_1E52E34C8;
      v13[4] = self;
      double v11 = [v7 childWithContinuation:v13];
      objc_msgSend(v10, "selectPositionAtPoint:executionContext:", v11, x, y);
    }
    else
    {
      objc_msgSend(v9, "selectPositionAtPoint:executionContext:", 0, x, y);

      v12 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      [v12 beginSelection];
    }
  }
  else
  {
    [v7 returnExecutionToParent];
  }
}

- (void)updateOneFingerSelectWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v7 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

  if (v7)
  {
    double v8 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v8, "updateSelectionWithExtentPoint:executionContext:", v9, x, y);
  }
  else
  {
    [v9 returnExecutionToParent];
  }
}

- (void)endOneFingerSelectWithExecutionContext:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v4 endSelection];

  [v5 returnExecutionToParent];
}

- (void)oneFingerForcePan:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
  id v6 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  id v7 = [v6 textInputView];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  v13 = [v12 textInputView];
  [v4 _translationInView:v13];
  double v15 = v14;
  double v17 = v16;

  if ([v4 didLongPress])
  {
    id v18 = v4;
    if ([v18 state] == 3 || objc_msgSend(v18, "state") == 4)
    {
      BOOL v19 = 0;
LABEL_5:

      goto LABEL_9;
    }
    uint64_t v20 = [v18 state];

    if (v20 != 5
      && ![(_UIKeyboardBasedTextSelectionInteraction *)self enclosingScrollViewIsScrolling])
    {
      v49 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      v50 = [v49 textInputView];
      [v18 _translationInView:v50];
      long double v52 = v51;
      long double v54 = v53;

      double v55 = hypot(v52, v54);
      id v18 = +[_UITextSelectionSettings sharedInstance];
      [v18 allowableForceMovement];
      BOOL v19 = v55 <= v56;
      goto LABEL_5;
    }
  }
  BOOL v19 = 0;
LABEL_9:
  [(_UIKeyboardBasedTextSelectionInteraction *)self _createGestureTuningIfNecessary];
  id v21 = [(_UIKeyboardBasedTextSelectionInteraction *)self gestureTuning];

  if (v21)
  {
    uint64_t v22 = [(_UIKeyboardBasedTextSelectionInteraction *)self gestureTuning];
    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    char v24 = [v4 touches];
    id v25 = [v23 setWithArray:v24];
    objc_msgSend(v22, "updateWithTouches:gestureState:", v25, objc_msgSend(v4, "state"));

    uint64_t v26 = [(_UIKeyboardBasedTextSelectionInteraction *)self gestureTuning];
    objc_msgSend(v26, "touchAlignedPointForPoint:translation:", v9, v11, v15, v17);
    double v9 = v27;
    double v11 = v28;
  }
  if (([v5 didLongForcePress] & 1) == 0
    && [v4 didLongPress]
    && [v5 panGestureState] == 5)
  {
    id v29 = v4;
    if ([v29 state] == 3 || objc_msgSend(v29, "state") == 4)
    {
    }
    else
    {
      uint64_t v57 = [v29 state];

      if (v57 != 5)
      {
        if (!v19) {
          -[_UIKeyboardBasedTextSelectionInteraction transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:](self, "transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:", 1, v9, v11);
        }
        [v5 setDidLongForcePress:1];
        v58 = [v29 view];
        +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePan:_isViewKeyboardLayoutPresent(v58)];

        v59 = [MEMORY[0x1E4FA8AA0] sharedInstance];
        v92[0] = MEMORY[0x1E4F143A8];
        v92[1] = 3221225472;
        v92[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke;
        v92[3] = &unk_1E52E1988;
        v92[4] = self;
        double v95 = v15;
        double v96 = v17;
        id v93 = v5;
        id v94 = v29;
        [v59 logBlock:v92 domain:@"com.apple.keyboard.UIKit"];
      }
    }
  }
  v30 = [(UITextInteraction *)self root];
  v31 = [v30 delegate];
  char v32 = objc_opt_respondsToSelector();

  if (v32)
  {
    [(_UIKeyboardBasedTextSelectionInteraction *)self _processGestureForCustomHighlighter:v4];
    goto LABEL_50;
  }
  if ([v5 panGestureState]) {
    BOOL v33 = 0;
  }
  else {
    BOOL v33 = v19;
  }
  if (v33)
  {
    [v5 setPanGestureState:1];
    [(_UIKeyboardTextSelectionInteraction *)self disableEnclosingScrollViewScrolling];
    double v34 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v34, "beginLoupeGestureAtPoint:translation:", v9, v11, v15, v17);
LABEL_24:

    goto LABEL_46;
  }
  if ([v5 panGestureState] == 1)
  {
    id v35 = v4;
    if ([v35 state] == 3 || objc_msgSend(v35, "state") == 4)
    {
    }
    else
    {
      uint64_t v60 = [v35 state];

      if (v60 != 5)
      {
        v61 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        v62 = [v61 textInputView];
        [v35 velocityInView:v62];
        double v64 = v63;
        double v66 = v65;

        double v34 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        objc_msgSend(v34, "updateLoupeGestureAtPoint:translation:velocity:", v9, v11, v15, v17, v64, v66);
        goto LABEL_24;
      }
    }
    [v5 setDidFloatCursor:0];
    uint64_t v36 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v36, "endLoupeGestureAtPoint:translation:", v9, v11, v15, v17);

    goto LABEL_45;
  }
  if ([v5 panGestureState] == 3)
  {
    id v37 = v4;
    if ([v37 state] == 3 || objc_msgSend(v37, "state") == 4)
    {

LABEL_34:
      if (qword_1EB25B398 != -1) {
        dispatch_once(&qword_1EB25B398, &__block_literal_global_487_0);
      }
      v38 = [v5 delegate];
      v39 = [v38 taskQueue];
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_4;
      v88[3] = &unk_1E52E3880;
      v88[4] = self;
      id v89 = v5;
      double v90 = v9;
      double v91 = v11;
      [v39 addTask:v88 breadcrumb:qword_1EB25B390];

      v40 = v89;
LABEL_37:

      goto LABEL_46;
    }
    uint64_t v69 = [v37 state];

    if (v69 == 5) {
      goto LABEL_34;
    }
    if (qword_1EB25B3A8 != -1) {
      dispatch_once(&qword_1EB25B3A8, &__block_literal_global_493);
    }
    double v34 = [v5 delegate];
    v70 = [v34 taskQueue];
    v71 = v70;
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_8;
    v87[3] = &unk_1E52E3EB0;
    v87[4] = self;
    *(double *)&v87[5] = v9;
    *(double *)&v87[6] = v11;
    uint64_t v72 = qword_1EB25B3A0;
    v73 = v87;
LABEL_75:
    [v70 addTask:v73 breadcrumb:v72];

    goto LABEL_24;
  }
  if ([v5 panGestureState] == 5)
  {
    id v41 = v4;
    if ([v41 state] == 3 || objc_msgSend(v41, "state") == 4)
    {
    }
    else
    {
      uint64_t v74 = [v41 state];

      if (v74 != 5)
      {
        if (([v5 delayForceMagnify] & 1) == 0)
        {
          v75 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
          objc_msgSend(v75, "updateLoupeMagnifierAtPoint:", v9, v11);
        }
        if (qword_1EB25B3B8 != -1) {
          dispatch_once(&qword_1EB25B3B8, &__block_literal_global_499_0);
        }
        double v34 = [v5 delegate];
        v70 = [v34 taskQueue];
        v71 = v70;
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_12;
        v86[3] = &unk_1E52E3EB0;
        v86[4] = self;
        *(double *)&v86[5] = v9;
        *(double *)&v86[6] = v11;
        uint64_t v72 = qword_1EB25B3B0;
        v73 = v86;
        goto LABEL_75;
      }
    }
    [v5 setDidFloatCursor:0];
    if (([v5 delayForceMagnify] & 1) == 0)
    {
      v42 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      objc_msgSend(v42, "endLoupeMagnifierAtPoint:", v9, v11);
    }
    v43 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v43 setRangedSelectionShouldShowGrabbers:1];

    [v5 setDidSuppressSelectionGrabbers:0];
LABEL_45:
    [v5 setPanGestureState:0];
    goto LABEL_46;
  }
  if ([v5 panGestureState] == 6)
  {
    if (_gestureIsEnded(v4))
    {
      if (qword_1EB25B3C8 != -1) {
        dispatch_once(&qword_1EB25B3C8, &__block_literal_global_505_0);
      }
      v67 = [v5 delegate];
      v68 = [v67 taskQueue];
      v82[0] = MEMORY[0x1E4F143A8];
      v82[1] = 3221225472;
      v82[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_15;
      v82[3] = &unk_1E52E3880;
      v82[4] = self;
      id v83 = v5;
      double v84 = v9;
      double v85 = v11;
      [v68 addTask:v82 breadcrumb:qword_1EB25B3C0];

      v40 = v83;
    }
    else
    {
      if (qword_1EB25B3D8 != -1) {
        dispatch_once(&qword_1EB25B3D8, &__block_literal_global_511);
      }
      v76 = [v5 delegate];
      v77 = [v76 taskQueue];
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_19;
      v78[3] = &unk_1E52E3880;
      v78[4] = self;
      double v80 = v9;
      double v81 = v11;
      id v79 = v5;
      [v77 addTask:v78 breadcrumb:qword_1EB25B3D0];

      v40 = v79;
    }
    goto LABEL_37;
  }
LABEL_46:
  v44 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  v45 = [v44 textInputView];
  [v4 _translationInView:v45];
  objc_msgSend(v5, "setLastPanTranslation:");

  id v46 = v4;
  if ([v46 state] == 3 || objc_msgSend(v46, "state") == 4)
  {
  }
  else
  {
    uint64_t v48 = [v46 state];

    if (v48 != 5) {
      goto LABEL_50;
    }
  }
  [v5 setDidLongForcePress:0];
  [v5 setDidFloatCursor:0];
  [v5 setDelayForceMagnify:0];
  [v5 setPreviousForcePressCount:0];
  [v5 setPanGestureState:0];
  v47 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v47 showSelectionCommands];

  objc_msgSend(v46, "setShouldFailWithoutForce:", objc_msgSend(v5, "oneFingerForcePressShouldFailWithoutForce"));
LABEL_50:
}

- (void)oneFingerForcePress:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
  id v6 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  uint64_t v7 = [v4 view];
  if (v7)
  {
    double v8 = (void *)v7;
    double v9 = [v5 delegate];
    double v10 = [v9 textSelectionController];

    if (v10)
    {
      double v11 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      uint64_t v17 = [v11 textInputView];
      [v4 velocityInView:v17];
      long double v13 = v12;
      long double v15 = v14;

      double v16 = hypot(v13, v15);
      LOBYTE(v17) = 0;
      if ([v5 panGestureState] && v16 > 65.0) {
        LODWORD(v17) = [v4 touchEclipsesVelocity] ^ 1;
      }
      id v18 = [v6 textInputView];
      [v4 locationInView:v18];
      double v20 = v19;
      double v22 = v21;

      if ([v4 currentPreviewForceState] >= 1)
      {
        unint64_t v23 = v4 ? v4[18] : 0;
        char v24 = v23 <= (int)[v5 previousForcePressCount] ? 1 : v17;
        if ((v24 & 1) == 0)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          [v5 lastPressTimestamp];
          double v27 = v26;
          double v28 = [v5 delegate];
          if (objc_opt_respondsToSelector())
          {
            id v29 = [v5 delegate];
            int v30 = [v29 hasMarkedText];
          }
          else
          {
            int v30 = 0;
          }

          if ([v5 panGestureState] == 6)
          {
            if (Current - v27 <= 0.8)
            {
              -[_UIKeyboardTextSelectionInteraction _granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:](self, "_granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:", 1, Current - v27);
            }
            else
            {
              if (qword_1EB25B3E8 != -1) {
                dispatch_once(&qword_1EB25B3E8, &__block_literal_global_515_3);
              }
              v31 = [v5 delegate];
              char v32 = [v31 taskQueue];
              v50[0] = MEMORY[0x1E4F143A8];
              v50[1] = 3221225472;
              v50[2] = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_3;
              v50[3] = &unk_1E52E3D20;
              v50[4] = self;
              id v51 = v5;
              id v52 = v6;
              double v53 = v20;
              double v54 = v22;
              [v32 addTask:v50 breadcrumb:qword_1EB25B3E0];
            }
          }
          if ([v5 panGestureState]
            || (([(_UIKeyboardBasedTextSelectionInteraction *)self enclosingScrollViewIsScrolling] | v30) & 1) != 0)
          {
            if ([v5 panGestureState] == 1 || objc_msgSend(v5, "panGestureState") == 5) {
              -[_UIKeyboardBasedTextSelectionInteraction transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:](self, "transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:", 0, v20, v22);
            }
          }
          else
          {
            [v5 setPanGestureState:5];
            [v5 setPanGestureState:6];
            [v5 setPreviousRepeatedGranularity:1];
            [(_UIKeyboardTextSelectionInteraction *)self disableEnclosingScrollViewScrolling];
            [v6 willBeginHighlighterGesture];
            BOOL v33 = [(UITextInteraction *)self root];
            [v33 _playFeedbackForCursorMovement];

            [v6 beginSelection];
            [v6 setRangedSelectionShouldShowGrabbers:1];
            [v5 setDidSuppressSelectionGrabbers:0];
            if (qword_1EB25B3F8 != -1) {
              dispatch_once(&qword_1EB25B3F8, &__block_literal_global_521_1);
            }
            double v34 = [v5 delegate];
            id v35 = [v34 taskQueue];
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_8;
            v44[3] = &unk_1E52E3D48;
            v44[4] = self;
            id v45 = v5;
            double v47 = v20;
            double v48 = v22;
            char v49 = 1;
            id v46 = v6;
            [v35 addTask:v44 breadcrumb:qword_1EB25B3F0];
          }
          [v5 setLastPressTimestamp:Current];
          uint64_t v36 = [v4 view];
          BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v36);
          if (v4) {
            uint64_t v38 = *((unsigned int *)v4 + 36);
          }
          else {
            uint64_t v38 = 0;
          }
          +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePress:isViewKeyboardLayoutPresent withPressCount:v38];

          v39 = [MEMORY[0x1E4FA8AA0] sharedInstance];
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_10;
          v41[3] = &unk_1E52E1960;
          id v42 = v5;
          v43 = v4;
          [v39 logBlock:v41 domain:@"com.apple.keyboard.UIKit"];
        }
      }
      if (v4) {
        uint64_t v40 = *((unsigned int *)v4 + 36);
      }
      else {
        uint64_t v40 = 0;
      }
      [v5 setPreviousForcePressCount:v40];
    }
  }
}

- (UITextGestureTuning)gestureTuning
{
  return self->_gestureTuning;
}

@end