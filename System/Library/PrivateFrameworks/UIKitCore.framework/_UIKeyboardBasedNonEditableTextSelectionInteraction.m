@interface _UIKeyboardBasedNonEditableTextSelectionInteraction
- (void)_synchronousGranularityExpandingGestureWithTimeInterval:(double)a3 timeGranularity:(double)a4 isMidPan:(BOOL)a5;
- (void)oneFingerForcePan:(id)a3;
- (void)oneFingerForcePress:(id)a3;
- (void)transitionFromBlockMagnifyToBlockSelectWithLocation:(CGPoint)a3 viaDrag:(BOOL)a4;
@end

@implementation _UIKeyboardBasedNonEditableTextSelectionInteraction

- (void)_synchronousGranularityExpandingGestureWithTimeInterval:(double)a3 timeGranularity:(double)a4 isMidPan:(BOOL)a5
{
  v9 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v9 caretRectForCursorPosition];
  BOOL IsNull = CGRectIsNull(v35);

  if (!IsNull)
  {
    v11 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v11 caretRectForCursorPosition];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    if (a3 >= a4)
    {
      v21 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      char v20 = [v21 hasRangedSelection];
    }
    else
    {
      char v20 = 0;
    }
    if (a5)
    {
      v22 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
      uint64_t v23 = [v22 previousRepeatedGranularity];
    }
    else
    {
      v22 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      uint64_t v23 = [v22 selectionGranularity];
    }
    uint64_t v24 = v23;

    if (v20) {
      int64_t v25 = 0;
    }
    else {
      int64_t v25 = +[UITextInteractionAssistant _nextGranularityInCycle:v24 forTouchType:0];
    }
    double v26 = v17 * 0.5;
    double v27 = v19 * 0.5;
    v28 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
    [v28 setPreviousRepeatedGranularity:v25];

    if (!a5)
    {
      v29 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      [v29 beginSelection];
    }
    double v30 = v13 + v26;
    v31 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    v32 = v31;
    if (v25) {
      objc_msgSend(v31, "selectTextWithGranularity:atPoint:executionContext:", v25, 0, v30, v15 + v27);
    }
    else {
      objc_msgSend(v31, "selectPositionAtPoint:executionContext:", 0, v30, v15 + v27);
    }

    id v33 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    if (a5) {
      [v33 restartSelection];
    }
    else {
      [v33 endSelection];
    }
  }
}

- (void)transitionFromBlockMagnifyToBlockSelectWithLocation:(CGPoint)a3 viaDrag:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  id v12 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
  v8 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v8 setRangedSelectionShouldShowGrabbers:1];

  [v12 setDidSuppressSelectionGrabbers:0];
  [v12 setPreviousRepeatedGranularity:1];
  [v12 setPanGestureState:6];
  v9 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  v10 = v9;
  if (v4)
  {
    [v9 beginSelection];

    v11 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v11, "updateSelectionWithExtentPoint:withBoundary:executionContext:", objc_msgSend(v12, "previousRepeatedGranularity"), 0, x, y);
  }
  else
  {
    objc_msgSend(v9, "selectTextWithGranularity:atPoint:executionContext:", objc_msgSend(v12, "previousRepeatedGranularity"), 0, x, y);

    v11 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v11 beginSelection];
  }
}

- (void)oneFingerForcePan:(id)a3
{
  id v4 = a3;
  v5 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
  v6 = [v5 delegate];
  v7 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  v8 = [v7 textInputView];
  [v4 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [v7 textInputView];
  [v4 _translationInView:v13];
  long double v15 = v14;
  long double v17 = v16;

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
      double v43 = hypot(v15, v17);
      id v18 = +[_UITextSelectionSettings sharedInstance];
      [v18 allowableForceMovement];
      BOOL v19 = v43 <= v44;
      goto LABEL_5;
    }
  }
  BOOL v19 = 0;
LABEL_9:
  [(_UIKeyboardBasedTextSelectionInteraction *)self _createGestureTuningIfNecessary];
  v21 = [(_UIKeyboardBasedTextSelectionInteraction *)self gestureTuning];

  if (v21)
  {
    v22 = [(_UIKeyboardBasedTextSelectionInteraction *)self gestureTuning];
    uint64_t v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = [v4 touches];
    int64_t v25 = [v23 setWithArray:v24];
    objc_msgSend(v22, "updateWithTouches:gestureState:", v25, objc_msgSend(v4, "state"));

    double v26 = [(_UIKeyboardBasedTextSelectionInteraction *)self gestureTuning];
    objc_msgSend(v26, "touchAlignedPointForPoint:translation:", v10, v12, (double)v15, (double)v17);
    double v10 = v27;
    double v12 = v28;
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
      uint64_t v45 = [v29 state];

      if (v45 != 5)
      {
        if (!v19) {
          -[_UIKeyboardBasedNonEditableTextSelectionInteraction transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:](self, "transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:", 1, v10, v12);
        }
        [v5 setDidLongForcePress:1];
        v46 = [v29 view];
        +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePan:_isViewKeyboardLayoutPresent(v46)];

        v47 = [MEMORY[0x1E4FA8AA0] sharedInstance];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __73___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePan___block_invoke;
        v66[3] = &unk_1E52FE7B8;
        id v67 = v29;
        id v68 = v7;
        id v69 = v5;
        [v47 logBlock:v66 domain:@"com.apple.keyboard.UIKit"];
      }
    }
  }
  double v30 = [(UITextInteraction *)self root];
  v31 = [v30 delegate];
  char v32 = objc_opt_respondsToSelector();

  if (v32)
  {
    [(_UIKeyboardBasedTextSelectionInteraction *)self _processGestureForCustomHighlighter:v4];
    goto LABEL_72;
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
    v34 = +[UIKeyboardImpl activeInstance];
    self->_isShiftKeyBeingHeld = [v34 isShiftKeyBeingHeld];

    CGRect v35 = [(UITextInteraction *)self root];
    [v35 _createFeedbackIfNecessary];

    v36 = [(UITextInteraction *)self root];
    [v36 _prepareFeedbackForGesture];

    self->_isShiftKeyBeingHeld = 1;
    [v5 setPanGestureState:6];
    [v5 setPreviousRepeatedGranularity:1];
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v6 willBeginGesture];
    }
    [(_UIKeyboardTextSelectionInteraction *)self disableEnclosingScrollViewScrolling];
    [v7 willBeginHighlighterGesture];
    v37 = [(UITextInteraction *)self root];
    [v37 _playFeedbackForCursorMovement];

    [v7 beginSelection];
    [v7 setRangedSelectionShouldShowGrabbers:1];
    [v5 setDidSuppressSelectionGrabbers:1];
    uint64_t v57 = MEMORY[0x1E4F143A8];
    uint64_t v58 = 3221225472;
    v59 = __73___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePan___block_invoke_2;
    v60 = &unk_1E52FE680;
    char v65 = 1;
    double v63 = v10;
    double v64 = v12;
    id v61 = v7;
    v62 = self;
    objc_msgSend(v61, "selectTextWithGranularity:atPoint:completionHandler:", 1, &v57, v10, v12);

    goto LABEL_62;
  }
  if ([v5 panGestureState] == 1)
  {
    id v38 = v4;
    if ([v38 state] == 3 || objc_msgSend(v38, "state") == 4)
    {

LABEL_31:
      [v5 setDidFloatCursor:0];
      objc_msgSend(v7, "endRangedMagnifierAtPoint:", v10, v12);
      objc_msgSend(v7, "selectTextWithGranularity:atPoint:executionContext:", 1, 0, v10, v12);
LABEL_37:
      [v5 setPanGestureState:0];
      goto LABEL_62;
    }
    uint64_t v48 = [v38 state];

    if (v48 == 5) {
      goto LABEL_31;
    }
    objc_msgSend(v7, "updateRangedMagnifierAtPoint:", v10, v12);
    v42 = v7;
    uint64_t v41 = 1;
    goto LABEL_52;
  }
  if ([v5 panGestureState] != 3)
  {
    if ([v5 panGestureState] != 5)
    {
      if ([v5 panGestureState] == 6)
      {
        if (_gestureIsEnded(v4))
        {
          [(_UIKeyboardBasedTextSelectionInteraction *)self endOneFingerSelectWithExecutionContext:0];
          [v5 setPanGestureState:0];
          objc_msgSend(v7, "endRangedMagnifierAtPoint:", v10, v12);
          [v5 setDidFloatCursor:0];
        }
        else
        {
          objc_msgSend(v7, "updateSelectionWithExtentPoint:withBoundary:executionContext:", objc_msgSend(v5, "previousRepeatedGranularity"), 0, v10, v12);
          objc_msgSend(v7, "updateRangedMagnifierAtPoint:", v10, v12);
        }
      }
      goto LABEL_62;
    }
    id v40 = v4;
    if ([v40 state] == 3 || objc_msgSend(v40, "state") == 4)
    {
    }
    else
    {
      uint64_t v50 = [v40 state];

      if (v50 != 5)
      {
        if (([v5 delayForceMagnify] & 1) == 0) {
          objc_msgSend(v7, "updateRangedMagnifierAtPoint:", v10, v12);
        }
        goto LABEL_44;
      }
    }
    [v5 setDidFloatCursor:0];
    if (([v5 delayForceMagnify] & 1) == 0) {
      objc_msgSend(v7, "endRangedMagnifierAtPoint:", v10, v12);
    }
LABEL_44:
    uint64_t v41 = [v5 previousRepeatedGranularity];
    v42 = v7;
LABEL_52:
    objc_msgSend(v42, "selectTextWithGranularity:atPoint:executionContext:", v41, 0, v10, v12);
    goto LABEL_62;
  }
  id v39 = v4;
  if ([v39 state] == 3 || objc_msgSend(v39, "state") == 4)
  {

LABEL_36:
    [v5 setDidFloatCursor:0];
    [v7 endSelection];
    objc_msgSend(v7, "endRangedMagnifierAtPoint:", v10, v12);
    goto LABEL_37;
  }
  uint64_t v49 = [v39 state];

  if (v49 == 5) {
    goto LABEL_36;
  }
  objc_msgSend(v7, "updateRangedMagnifierAtPoint:", v10, v12);
  objc_msgSend(v7, "updateSelectionWithExtentPoint:executionContext:", 0, v10, v12);
LABEL_62:
  id v51 = v4;
  if ([v51 state] == 3 || objc_msgSend(v51, "state") == 4)
  {
  }
  else
  {
    uint64_t v56 = [v51 state];

    if (v56 != 5) {
      goto LABEL_72;
    }
  }
  objc_msgSend(v5, "setDidLongForcePress:", 0, v57, v58, v59, v60);
  [v5 setDidFloatCursor:0];
  [v5 setPreviousForcePressCount:0];
  [v5 setPanGestureState:0];
  v52 = [(UITextInteraction *)self root];
  [v52 _cleanUpFeedbackForGesture];

  uint64_t v53 = [v6 textSelectionController];
  if (v53)
  {
    v54 = (void *)v53;
    int v55 = [v5 didSuppressSelectionGrabbers];

    if (v55)
    {
      [v7 setRangedSelectionShouldShowGrabbers:1];
      [v5 setDidSuppressSelectionGrabbers:0];
    }
  }
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 didEndGesture];
  }
  [v7 showSelectionCommands];
LABEL_72:
}

- (void)oneFingerForcePress:(id)a3
{
  id v4 = a3;
  v5 = [(_UIKeyboardBasedTextSelectionInteraction *)self owner];
  v6 = [v5 delegate];
  v7 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  uint64_t v8 = [v4 view];
  if (v8)
  {
    double v9 = (void *)v8;
    double v10 = [v6 textSelectionController];

    if (v10)
    {
      double v11 = [v7 textInputView];
      [v4 velocityInView:v11];
      long double v13 = v12;
      long double v15 = v14;

      double v16 = hypot(v13, v15);
      LOBYTE(v17) = 0;
      if ([v5 panGestureState] && v16 > 65.0) {
        int v17 = [v4 touchEclipsesVelocity] ^ 1;
      }
      id v18 = [v7 textInputView];
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
          if ([v5 panGestureState] == 6)
          {
            if (Current - v27 <= 0.8) {
              -[_UIKeyboardBasedNonEditableTextSelectionInteraction _synchronousGranularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:](self, "_synchronousGranularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:", 1, Current - v27);
            }
            else {
              objc_msgSend(v7, "endRangedMagnifierAtPoint:", v20, v22);
            }
          }
          if ([v5 panGestureState]
            || -[_UIKeyboardBasedTextSelectionInteraction enclosingScrollViewIsScrolling](self, "enclosingScrollViewIsScrolling")|| (objc_opt_respondsToSelector() & 1) != 0&& ([v4 view], BOOL v33 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "locationInView:", v33), v34 = objc_msgSend(v6, "shouldAllowSelectionGestures:atPoint:toBegin:", 1, 1), v33, !v34))
          {
            if ([v5 panGestureState] == 1 || objc_msgSend(v5, "panGestureState") == 5) {
              -[_UIKeyboardBasedNonEditableTextSelectionInteraction transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:](self, "transitionFromBlockMagnifyToBlockSelectWithLocation:viaDrag:", 0, v20, v22);
            }
          }
          else
          {
            [v5 setPanGestureState:5];
            self->_isShiftKeyBeingHeld = 1;
            [v5 setPanGestureState:6];
            [v5 setPreviousRepeatedGranularity:1];
            if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
              [v6 willBeginGesture];
            }
            [(_UIKeyboardTextSelectionInteraction *)self disableEnclosingScrollViewScrolling];
            [v7 willBeginHighlighterGesture];
            CGRect v35 = [(UITextInteraction *)self root];
            [v35 _playFeedbackForCursorMovement];

            [v7 beginSelection];
            [v7 setRangedSelectionShouldShowGrabbers:1];
            [v5 setDidSuppressSelectionGrabbers:0];
            uint64_t v36 = [v5 previousRepeatedGranularity];
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __75___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePress___block_invoke_2;
            v40[3] = &unk_1E52FE680;
            char v45 = 1;
            double v43 = v20;
            double v44 = v22;
            id v41 = v7;
            v42 = self;
            objc_msgSend(v41, "selectTextWithGranularity:atPoint:completionHandler:", v36, v40, v20, v22);
          }
          [v5 setLastPressTimestamp:Current];
          double v28 = [v4 view];
          BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v28);
          if (v4) {
            uint64_t v30 = *((unsigned int *)v4 + 36);
          }
          else {
            uint64_t v30 = 0;
          }
          +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePress:isViewKeyboardLayoutPresent withPressCount:v30];

          v31 = [MEMORY[0x1E4FA8AA0] sharedInstance];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __75___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePress___block_invoke_3;
          v37[3] = &unk_1E52E1960;
          id v38 = v5;
          id v39 = v4;
          [v31 logBlock:v37 domain:@"com.apple.keyboard.UIKit"];
        }
      }
      if (v4) {
        uint64_t v32 = *((unsigned int *)v4 + 36);
      }
      else {
        uint64_t v32 = 0;
      }
      [v5 setPreviousForcePressCount:v32];
    }
  }
}

@end