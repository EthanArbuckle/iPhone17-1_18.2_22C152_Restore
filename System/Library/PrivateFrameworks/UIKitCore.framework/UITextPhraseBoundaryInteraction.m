@interface UITextPhraseBoundaryInteraction
- (CGPoint)pointIfPlacedCarefully:(CGPoint)result;
- (CGPoint)touchAlignedPointForPoint:(CGPoint)result translation:(CGPoint)a4;
- (UITextPhraseBoundaryInteraction)initWithTextInput:(id)a3;
- (id)_phraseBoundaryGestureRecognizer;
- (void)_createGestureTuningIfNecessary;
- (void)_phraseBoundaryGesture:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)updateVisibilityOffsetForGesture:(id)a3;
@end

@implementation UITextPhraseBoundaryInteraction

- (UITextPhraseBoundaryInteraction)initWithTextInput:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITextPhraseBoundaryInteraction;
  v5 = [(UITextInteraction *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(UITextInteraction *)v5 setTextInput:v4];
    v7 = [(UITextPhraseBoundaryInteraction *)v6 _phraseBoundaryGestureRecognizer];
    [(UITextInteraction *)v6 addGestureRecognizer:v7 withName:0x1ED174140];
  }
  return v6;
}

- (void)didMoveToView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITextPhraseBoundaryInteraction;
  id v4 = a3;
  [(UITextInteraction *)&v5 didMoveToView:v4];
  -[UITextGestureTuning setContainerCoordinateSpace:](self->_gestureTuning, "setContainerCoordinateSpace:", v4, v5.receiver, v5.super_class);
}

- (CGPoint)pointIfPlacedCarefully:(CGPoint)result
{
  gestureTuning = self->_gestureTuning;
  if (gestureTuning) {
    -[UITextGestureTuning pointIfPlacedCarefully:](gestureTuning, "pointIfPlacedCarefully:", result.x, result.y);
  }
  return result;
}

- (CGPoint)touchAlignedPointForPoint:(CGPoint)result translation:(CGPoint)a4
{
  gestureTuning = self->_gestureTuning;
  if (gestureTuning) {
    -[UITextGestureTuning touchAlignedPointForPoint:translation:](gestureTuning, "touchAlignedPointForPoint:translation:", result.x, result.y, a4.x, a4.y);
  }
  return result;
}

- (void)_createGestureTuningIfNecessary
{
  if (!self->_gestureTuning)
  {
    v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v4 = [v3 preferencesActions];
    int v5 = [v4 BOOLForPreferenceKey:@"YukonMagnifiersDisabled"];

    if (v5)
    {
      v6 = objc_alloc_init(UITextGestureTuning);
      gestureTuning = self->_gestureTuning;
      self->_gestureTuning = v6;

      v8 = [(UITextInteraction *)self view];
      [(UITextGestureTuning *)self->_gestureTuning setContainerCoordinateSpace:v8];

      objc_super v9 = self->_gestureTuning;
      [(UITextGestureTuning *)v9 setShouldUseLineThreshold:1];
    }
  }
}

- (void)updateVisibilityOffsetForGesture:(id)a3
{
  id v4 = a3;
  [(UITextPhraseBoundaryInteraction *)self _createGestureTuningIfNecessary];
  gestureTuning = self->_gestureTuning;
  id v7 = [v4 _allActiveTouches];
  uint64_t v6 = [v4 state];

  [(UITextGestureTuning *)gestureTuning updateWithTouches:v7 gestureState:v6];
}

- (id)_phraseBoundaryGestureRecognizer
{
  v3 = [[UIPhraseBoundaryGestureRecognizer alloc] initWithTarget:self action:sel__phraseBoundaryGesture_];
  id v4 = [(UITextInteraction *)self textInput];
  [(UIPhraseBoundaryGestureRecognizer *)v3 setTextInput:v4];

  [(UILongPressGestureRecognizer *)v3 setDelay:0.0];
  [(UIPhraseBoundaryGestureRecognizer *)v3 setSecondDelay:0.2];
  [(UILongPressGestureRecognizer *)v3 setNumberOfTouchesRequired:1];
  [(UIGestureRecognizer *)v3 setDelaysTouchesEnded:0];
  [(UILongPressGestureRecognizer *)v3 setAllowableMovement:1.79769313e308];
  return v3;
}

- (void)_phraseBoundaryGesture:(id)a3
{
  id v4 = a3;
  int v5 = [(UITextInteraction *)self _textInput];
  uint64_t v6 = [(UITextInteraction *)self assistantDelegate];
  [(UITextPhraseBoundaryInteraction *)self updateVisibilityOffsetForGesture:v4];
  id v7 = +[UIKeyboardImpl activeInstance];
  if (([v5 isFirstResponder] & 1) == 0)
  {
    v10 = [v7 inputDelegate];
    BOOL v8 = v5 != v10;

    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    int v9 = 0;
    goto LABEL_6;
  }
  BOOL v8 = 0;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  int v9 = [v6 useGesturesForEditableContent] ^ 1;
LABEL_6:
  if ((v8 | v9) & 1) == 0 && ([v5 _hasMarkedText])
  {
    if ([v5 _usesAsynchronousProtocol])
    {
      [v4 centroid];
      double v12 = v11;
      double v14 = v13;
      if ([v4 state] == 1)
      {
        v15 = [v5 inputDelegate];
        [v15 selectionWillChange:v5];
      }
      else
      {
        v37 = [v5 textInputView];
        [v4 _translationInView:v37];
        double v39 = v38;
        double v41 = v40;

        -[UITextPhraseBoundaryInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:", v12, v14, v39, v41);
        double v12 = v42;
        double v14 = v43;
      }
      if ([v5 conformsToProtocolCached:&unk_1ED7009A0])
      {
        id v16 = v5;
        v44 = [v16 textInputView];
        v45 = [v4 view];
        objc_msgSend(v44, "convertPoint:fromView:", v45, v12, v14);
        double v47 = v46;
        double v49 = v48;

        objc_msgSend(v16, "updateCurrentSelectionTo:fromGesture:inState:", 14, objc_msgSend(v4, "state"), v47, v49);
      }
      else
      {
        [v5 conformsToProtocolCached:&unk_1ED700940];
        id v16 = [v6 view];
        v50 = [v5 textInputView];
        v51 = [v4 view];
        objc_msgSend(v50, "convertPoint:fromView:", v51, v12, v14);
        objc_msgSend(v16, "changeSelectionWithGestureAt:withGesture:withState:", 14, objc_msgSend(v4, "state"), v52, v53);
      }
      goto LABEL_32;
    }
    id v16 = [v4 userData];
    v17 = [v5 markedTextRange];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UITextPhraseBoundaryInteraction__phraseBoundaryGesture___block_invoke;
    aBlock[3] = &unk_1E530A890;
    id v18 = v5;
    id v103 = v18;
    id v19 = v17;
    id v104 = v19;
    id v105 = v7;
    v20 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
    uint64_t v21 = [v4 state];
    if ((unint64_t)(v21 - 3) < 2)
    {
      [v18 textInputView];
      v54 = v101 = v16;
      [v4 centroid];
      double v56 = v55;
      double v58 = v57;
      v59 = [v4 view];
      objc_msgSend(v54, "convertPoint:fromView:", v59, v56, v58);
      double v61 = v60;
      double v63 = v62;

      v64 = [v18 textInputView];
      [v4 _translationInView:v64];
      double v66 = v65;
      double v68 = v67;

      -[UITextPhraseBoundaryInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:", v61, v63, v66, v68);
      v33 = objc_msgSend(v18, "closestPositionToPoint:withinRange:", v19);
      [v18 caretRectForPosition:v33];
      double v70 = v69;
      double v72 = v71;
      v20[2](v20, 1, v33);
      if (v101)
      {
        objc_msgSend(v101, "setMagnificationPoint:", v70, v72);
        [v101 stopMagnifying:1];
        [v4 setUserData:0];
      }
      [(UITextCursorAssertion *)self->_blinkAssertion invalidate];
      blinkAssertion = self->_blinkAssertion;
      self->_blinkAssertion = 0;

      v74 = [v18 inputDelegate];
      [v74 selectionDidChange:v18];

      id v16 = v101;
      [v6 cancelAutoscroll];
      [(UITextInteraction *)self setInGesture:0];
    }
    else if (v21 == 2)
    {
      [v18 textInputView];
      v99 = v20;
      id v75 = v19;
      v77 = id v76 = v16;
      [v4 centroid];
      double v79 = v78;
      double v81 = v80;
      v82 = [v4 view];
      objc_msgSend(v77, "convertPoint:fromView:", v82, v79, v81);
      double v84 = v83;
      double v86 = v85;

      v87 = [v18 textInputView];
      [v4 _translationInView:v87];
      double v89 = v88;
      double v91 = v90;

      id v16 = v76;
      id v19 = v75;
      v20 = v99;
      -[UITextPhraseBoundaryInteraction touchAlignedPointForPoint:translation:](self, "touchAlignedPointForPoint:translation:", v84, v86, v89, v91);
      v33 = objc_msgSend(v18, "closestPositionToPoint:withinRange:", v19);
      [v18 caretRectForPosition:v33];
      double v93 = v92;
      double v95 = v94;
      char v96 = ((uint64_t (*)(void *, uint64_t, void *))v20[2])(v20, 1, v33);
      if (v16)
      {
        objc_msgSend(v16, "setMagnificationPoint:", v93, v95);
      }
      else if (v96 & 1) != 0 || ([v4 secondDelayElapsed])
      {
        v97 = +[UITextMagnifierRanged sharedRangedMagnifier];
        [v4 setUserData:v97];
        v98 = [v18 textInputView];
        objc_msgSend(v97, "beginMagnifyingTarget:text:magnificationPoint:offset:animated:", v98, v18, 1, v93, v95, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

        id v16 = v97;
      }
      else
      {
        id v16 = 0;
      }
      objc_msgSend(v6, "startAutoscroll:", v93, v95);
    }
    else
    {
      if (v21 != 1)
      {
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      [(UITextInteraction *)self setInGesture:1];
      v22 = [v18 inputDelegate];
      [v22 selectionWillChange:v18];

      v23 = [v18 textInputView];
      [v4 centroid];
      double v25 = v24;
      double v27 = v26;
      [v4 view];
      v28 = id v100 = v16;
      objc_msgSend(v23, "convertPoint:fromView:", v28, v25, v27);
      double v30 = v29;
      double v32 = v31;

      v33 = objc_msgSend(v18, "closestPositionToPoint:withinRange:", v19, v30, v32);
      v20[2](v20, 0, v33);
      v34 = [(UITextInteraction *)self _assertionController];
      v35 = [v34 nonBlinkingAssertionWithReason:@"Phrase Boundary gesture"];
      v36 = self->_blinkAssertion;
      self->_blinkAssertion = v35;

      id v16 = v100;
    }

    goto LABEL_31;
  }
  NSLog(&cfstr_WarningPhraseB_0.isa);
  [(UITextInteraction *)self setInGesture:0];
  [v6 setGestureRecognizers];
LABEL_33:
}

uint64_t __58__UITextPhraseBoundaryInteraction__phraseBoundaryGesture___block_invoke(id *a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = a1[4];
    id v7 = [a1[5] start];
    BOOL v8 = [a1[4] selectedTextRange];
    int v9 = [v8 start];
    uint64_t v10 = [v6 offsetFromPosition:v7 toPosition:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  double v11 = [a1[4] textRangeFromPosition:v5 toPosition:v5];
  [a1[4] setSelectedTextRange:v11];

  id v12 = a1[4];
  double v13 = [a1[5] start];
  uint64_t v14 = [v12 offsetFromPosition:v13 toPosition:v5];

  if (v14 == v10) {
    uint64_t v15 = a2 ^ 1u;
  }
  else {
    uint64_t v15 = 1;
  }
  if (v15 == 1) {
    [a1[6] didChangePhraseBoundary];
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blinkAssertion, 0);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
}

@end