@interface UITextRefinementCursorBehavior
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

@implementation UITextRefinementCursorBehavior

- (Class)gestureRecognizerClassForLoupeInteraction:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureGestureExclusionRequirementsForTextLoupeInteraction:(id)a3
{
  id v3 = a3;
  id v6 = [v3 recognizerForName:0x1ED1740E0];
  v4 = [v3 root];

  v5 = [v4 recognizerForName:0x1ED174120];

  if (v5) {
    [v6 requireGestureRecognizerToFail:v5];
  }
}

- (void)configureLoupeGestureRecognizer:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v6 _setHysteresis:8.0];
  [v5 addGestureRecognizer:v6 withName:0x1ED1740E0];
}

- (BOOL)shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  return [a3 _isPointerTouch];
}

- (BOOL)loupeGestureRecognizerShouldBegin:(id)a3 forTextLoupeInteraction:(id)a4
{
  return 1;
}

- (BOOL)usesTouchAlignment
{
  return 0;
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
  int v9 = a8;
  id v36 = a3;
  v13 = (double (**)(void))a5;
  [v36 cancelLinkInteractionSession];
  double v14 = v13[2](v13);
  double v16 = v15;

  v17 = [v36 view];
  v18 = [v36 _textInput];
  v19 = [v36 assistantDelegate];
  if (a4 == 1)
  {
    v20 = [v36 root];
    v21 = [v20 interactionWithGestureForName:0x1ED174020];

    objc_msgSend(v36, "setInheritedGranularity:", objc_msgSend(v21, "handOffGranularity"));
  }
  if ([v36 inheritedGranularity] == -1) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = [v36 inheritedGranularity];
  }
  int v23 = [v18 _usesAsynchronousProtocol];
  if ((v9 & 0x20000) != 0)
  {
    int v25 = 1;
  }
  else
  {
    v24 = +[UIKeyboardImpl activeInstance];
    int v25 = [v24 isShiftKeyBeingHeld];
  }
  if (a4 == 1)
  {
    [v36 setInGesture:1];
    objc_msgSend(v19, "setNeedsGestureUpdate:", objc_msgSend(v36, "_textInputIsInteractive") ^ 1);
    [v19 setFirstResponderIfNecessary];
    v26 = [v19 activeSelectionController];
    activeSelectionController = self->_activeSelectionController;
    self->_activeSelectionController = v26;

    if ([v36 _textInputIsInteractive])
    {
      v28 = [v19 obtainSelectionGrabberSuppressionAssertion];
      id grabberHandleSuppressionAssertion = self->_grabberHandleSuppressionAssertion;
      self->_id grabberHandleSuppressionAssertion = v28;

      [v19 willBeginSelectionInteraction];
      [v36 _cancelRecognizerWithName:0x1ED174000];
      [(_UIKeyboardTextSelectionController *)self->_activeSelectionController beginSelection];
      if ((v25 & 1) == 0 && [v36 inheritedGranularity] == -1)
      {
        v35 = self->_activeSelectionController;
        if (v23) {
          -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](v35, "selectTextWithGranularity:atPoint:executionContext:", 0, 0, v14, v16);
        }
        else {
          -[_UIKeyboardTextSelectionController selectPositionAtPoint:executionContext:](v35, "selectPositionAtPoint:executionContext:", 0, v14, v16);
        }
      }
      else
      {
        -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v22, 0, v14, v16);
      }
      [(_UIKeyboardTextSelectionController *)self->_activeSelectionController restartSelection];
    }
    else if (a9)
    {
      *a9 = 1;
    }
    v32 = [v19 _editMenuAssistant];
    [v32 hideSelectionCommands];

    [v19 resetWillHandoffLoupeMagnifier];
  }
  else if (a4 == 2)
  {
    if (v22) {
      char v30 = 1;
    }
    else {
      char v30 = v23;
    }
    v31 = self->_activeSelectionController;
    if (v30) {
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](v31, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v22, 0, v14, v16);
    }
    else {
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](v31, "updateSelectionWithExtentPoint:executionContext:", 0, v14, v16);
    }
    objc_msgSend(v19, "startAutoscroll:", v14, v16);
  }
  else if ((unint64_t)(a4 - 3) <= 1)
  {
    if (v25) {
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:executionContext:", 0, v14, v16);
    }
    [(_UIKeyboardTextSelectionController *)self->_activeSelectionController endSelection];
    [v19 didEndSelectionInteraction];
    [v19 cancelAutoscroll];
    [v36 setInGesture:0];
    v33 = self->_activeSelectionController;
    self->_activeSelectionController = 0;

    [v19 setGrabberSuppressionAssertion:self->_grabberHandleSuppressionAssertion];
    id v34 = self->_grabberHandleSuppressionAssertion;
    self->_id grabberHandleSuppressionAssertion = 0;

    [v36 setInheritedGranularity:-1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_grabberHandleSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_activeSelectionController, 0);
}

@end