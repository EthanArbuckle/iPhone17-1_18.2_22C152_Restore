@interface UITextRefinementAcceleratedTouchBehavior
- (BOOL)loupeGestureRecognizerShouldBegin:(id)a3 forTextLoupeInteraction:(id)a4;
- (BOOL)shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)triggeredByLongPressGesture:(id)a3;
- (BOOL)usesTouchAlignment;
- (CGPoint)startPointForLoupeGesture:(id)a3;
- (CGPoint)translationInView:(id)a3 forLoupeGesture:(id)a4;
- (CGPoint)velocityInView:(id)a3 forLoupeGesture:(id)a4;
- (Class)gestureRecognizerClassForLoupeInteraction:(id)a3;
- (void)configureGestureExclusionRequirementsForTextLoupeInteraction:(id)a3;
- (void)configureLoupeGestureRecognizer:(id)a3 forTextLoupeInteraction:(id)a4;
- (void)textLoupeInteraction:(id)a3 gestureChangedWithState:(int64_t)a4 location:(id)a5 translation:(id)a6 velocity:(id)a7 modifierFlags:(int64_t)a8 shouldCancel:(BOOL *)a9;
@end

@implementation UITextRefinementAcceleratedTouchBehavior

- (Class)gestureRecognizerClassForLoupeInteraction:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureGestureExclusionRequirementsForTextLoupeInteraction:(id)a3
{
  v3 = [a3 root];
  id v5 = [v3 recognizerForName:0x1ED174000];

  v4 = [v5 _pairedGestureIdentifiers];
  [v4 addObject:0x1ED174100];
}

- (void)configureLoupeGestureRecognizer:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v6 setMaximumNumberOfTouches:1];
  [v6 setMinimumNumberOfTouches:1];
  [v6 setAllowedTouchTypes:&unk_1ED3F17C8];
  [v5 addGestureRecognizer:v6 withName:0x1ED174100];
}

- (BOOL)shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  return [a3 _originatesFromPointerEvent] ^ 1;
}

- (BOOL)loupeGestureRecognizerShouldBegin:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 view];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  LOBYTE(v6) = objc_msgSend(v5, "currentSelectionContainsPoint:", v9, v11);
  return v6 ^ 1;
}

- (BOOL)usesTouchAlignment
{
  return 1;
}

- (BOOL)triggeredByLongPressGesture:(id)a3
{
  return 0;
}

- (CGPoint)startPointForLoupeGesture:(id)a3
{
  [a3 startPoint];
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)translationInView:(id)a3 forLoupeGesture:(id)a4
{
  [a4 translationInView:a3];
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)velocityInView:(id)a3 forLoupeGesture:(id)a4
{
  [a4 velocityInView:a3];
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)textLoupeInteraction:(id)a3 gestureChangedWithState:(int64_t)a4 location:(id)a5 translation:(id)a6 velocity:(id)a7 modifierFlags:(int64_t)a8 shouldCancel:(BOOL *)a9
{
  id v64 = a3;
  v13 = (double (**)(void))a5;
  v14 = (double (**)(void))a6;
  [v64 cancelLinkInteractionSession];
  v15 = [v64 _textInput];
  v16 = [v64 assistantDelegate];
  v17 = [v64 root];
  int v18 = [v17 _allowsSelectionCommands];

  if (a4 == 2)
  {
    if ([v64 inGesture])
    {
      double v25 = v13[2](v13);
      double v27 = v26;
      double v28 = v14[2](v14);
      double v30 = v29;
      objc_msgSend(v64, "touchAlignedPointForPoint:translation:", v25, v27, v28, v29);
      double v32 = v31;
      double v34 = v33;
      v35 = [v15 selectedTextRange];
      int v36 = [v35 isEmpty];

      if (!v36) {
        -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", 1, 0, v32, v34);
      }
      objc_msgSend(v16, "startAutoscroll:", v32, v34);
      objc_msgSend(v64, "updateOrCancelDelayedLoupeActionWithPoint:translation:", v32, v34, v28, v30);
      char v37 = objc_msgSend(v64, "translationIsWithinAllowableMovement:", v28, v30);
      v38 = [v64 gestureTuning];
      int v39 = [v38 shouldUseLineThreshold];

      if (v39 && (v37 & 1) == 0)
      {
        objc_msgSend(v16, "updateFloatingCursorAtPoint:animated:", 1, v32, v34);
        loupeSession = self->_loupeSession;
        v41 = [v16 activeSelection];
        [v41 caretRect];
        -[UITextLoupeSession moveToPoint:withCaretRect:trackingCaret:](loupeSession, "moveToPoint:withCaretRect:trackingCaret:", 1, v25, v27, v42, v43, v44, v45);
      }
    }
  }
  else if (a4 == 1)
  {
    v19 = [v64 root];
    [v19 _createFeedbackIfNecessary];

    v20 = [v64 root];
    [v20 _prepareFeedbackForGesture];

    [v16 stashCurrentSelection];
    [v16 setAutoscrolled:0];
    [v64 setInGesture:1];
    [v16 setGrabberSuppressionAssertion:0];
    v21 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v22 = [v21 vendKeyboardSuppressionAssertionForReason:@"Loupe gesture"];
    [v16 setKeyboardSuppressionAssertion:v22];

    v23 = [v15 selectedTextRange];
    originalTextRange = self->_originalTextRange;
    self->_originalTextRange = v23;

    objc_msgSend(v16, "setLoupeGestureEndPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    if (v18)
    {
      objc_msgSend(v16, "setNeedsGestureUpdate:", objc_msgSend(v64, "_textInputIsInteractive") ^ 1);
      [v16 setFirstResponderIfNecessary];
    }
    else
    {
      [v16 setNeedsGestureUpdate:1];
    }
    v57 = [v16 activeSelectionController];
    activeSelectionController = self->_activeSelectionController;
    self->_activeSelectionController = v57;

    if (v18 && ![v64 _textInputIsInteractive])
    {
      if (a9) {
        *a9 = 1;
      }
    }
    else
    {
      [v64 disableClearsOnInsertion];
      [v16 willBeginSelectionInteraction];
      [v64 _beginSelectionChange];
      double v59 = v13[2](v13);
      double v61 = v60;
      objc_msgSend(v64, "updateInitialPoint:");
      v62 = [v64 root];
      [v62 _playFeedbackForCursorMovement];

      [v64 _cancelRecognizerWithName:0x1ED174000];
      [v64 setStrongerBiasAgainstUp:1];
      [(_UIKeyboardTextSelectionController *)self->_activeSelectionController beginSelection];
      -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:executionContext:", 1, 0, v59, v61);
      [(_UIKeyboardTextSelectionController *)self->_activeSelectionController restartSelection];
      if (v18)
      {
        v63 = [v16 _editMenuAssistant];
        [v63 hideSelectionCommands];
      }
      [v16 resetWillHandoffLoupeMagnifier];
    }
  }
  else if ((unint64_t)(a4 - 3) <= 1)
  {
    [v64 setInGesture:0];
    v46 = [v64 root];
    [v46 _cleanUpFeedbackForGesture];

    [v64 cancelDelayedLoupeActionIfNecessary];
    v47 = self->_loupeSession;
    self->_loupeSession = 0;

    [v16 setKeyboardSuppressionAssertion:0];
    if ([v64 _textInputIsInteractive])
    {
      double v48 = v13[2](v13);
      double v50 = v49;
      v14[2](v14);
      objc_msgSend(v64, "pointIfPlacedCarefully:", v48, v50);
      objc_msgSend(v64, "touchAlignedPointForPoint:translation:");
      double v52 = v51;
      double v54 = v53;
      if (([v16 autoscrolled] & 1) == 0)
      {
        objc_msgSend(v16, "setLoupeGestureEndPoint:", v52, v54);
        -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:executionContext:", 0, v52, v54);
      }
      [(_UIKeyboardTextSelectionController *)self->_activeSelectionController endSelection];
      v55 = self->_activeSelectionController;
      self->_activeSelectionController = 0;

      [v64 _endSelectionChange];
      [v16 didEndSelectionInteraction];
      [v16 cancelAutoscroll];
      if ([v16 needsGestureUpdate]
        && ([v16 willHandoffLoupeMagnifier] & 1) == 0)
      {
        [v16 setGestureRecognizers];
      }
      if (v18)
      {
        v56 = [v16 _editMenuAssistant];
        [v56 showSelectionCommands];
      }
      [v16 setNeedsSelectionDisplayUpdate];
    }
    [v16 endFloatingCursor];
    [v16 clearStashedSelection];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loupeSession, 0);
  objc_storeStrong((id *)&self->_activeSelectionController, 0);
  objc_storeStrong((id *)&self->_originalTextRange, 0);
}

@end