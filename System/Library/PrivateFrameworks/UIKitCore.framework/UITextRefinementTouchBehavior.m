@interface UITextRefinementTouchBehavior
- (BOOL)_allowsPaintSelectionForLoupeInteraction:(id)a3;
- (BOOL)loupeGestureRecognizerShouldBegin:(id)a3 forTextLoupeInteraction:(id)a4;
- (BOOL)shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4;
- (BOOL)triggeredByLongPressGesture:(id)a3;
- (BOOL)usesTouchAlignment;
- (CGPoint)startPointForLoupeGesture:(id)a3;
- (CGPoint)translationInView:(id)a3 forLoupeGesture:(id)a4;
- (CGPoint)velocityInView:(id)a3 forLoupeGesture:(id)a4;
- (Class)gestureRecognizerClassForLoupeInteraction:(id)a3;
- (void)adjustVariableDelaySettingsForLoupeInteraction:(id)a3;
- (void)configureGestureExclusionRequirementsForTextLoupeInteraction:(id)a3;
- (void)configureLoupeGestureRecognizer:(id)a3 forTextLoupeInteraction:(id)a4;
- (void)textLoupeInteraction:(id)a3 gestureChangedWithState:(int64_t)a4 location:(id)a5 translation:(id)a6 velocity:(id)a7 modifierFlags:(int64_t)a8 shouldCancel:(BOOL *)a9;
@end

@implementation UITextRefinementTouchBehavior

- (void)configureGestureExclusionRequirementsForTextLoupeInteraction:(id)a3
{
  id v3 = a3;
  v4 = [v3 root];
  id v12 = [v4 recognizerForName:0x1ED174000];

  v5 = [v12 _pairedGestureIdentifiers];
  [v5 addObject:0x1ED174100];

  v6 = [v3 root];
  v7 = [v6 recognizerForName:0x1ED174020];

  v8 = [v7 _pairedGestureIdentifiers];
  [v8 addObject:0x1ED174100];

  v9 = [v3 root];

  v10 = [v9 recognizerForName:0x1ED174040];

  v11 = [v10 _pairedGestureIdentifiers];
  [v11 addObject:0x1ED174100];
}

- (void)adjustVariableDelaySettingsForLoupeInteraction:(id)a3
{
  id v3 = a3;
  id v7 = [v3 _textInput];
  v4 = [v3 recognizerForName:0x1ED174100];

  [v4 setTextView:v7];
  if (v7)
  {
    int v5 = [v7 isEditing];
    double v6 = 0.5;
    if (v5) {
      double v6 = 0.0;
    }
  }
  else
  {
    double v6 = 0.0;
  }
  [v4 setDelay:v6];
}

- (Class)gestureRecognizerClassForLoupeInteraction:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)configureLoupeGestureRecognizer:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  [v8 setNumberOfTouchesRequired:1];
  [v8 setDelaysTouchesEnded:0];
  int v6 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_TextRefinement_AllowableMovement, @"TextRefinement_AllowableMovement");
  double v7 = *(double *)&qword_1EB256E78;
  if (v6) {
    double v7 = 8.0;
  }
  [v8 setAllowableMovement:v7];
  [v8 setAllowedTouchTypes:&unk_1ED3EFA10];
  [v5 addGestureRecognizer:v8 withName:0x1ED174100];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberHandleSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_loupeSession, 0);
  objc_storeStrong((id *)&self->_activeSelectionController, 0);
  objc_storeStrong((id *)&self->_originalTextRange, 0);
}

- (BOOL)shouldAllowEnforcedTouchTypeForTouch:(id)a3 forGestureRecognizer:(id)a4
{
  return [a3 _originatesFromPointerEvent] ^ 1;
}

- (BOOL)loupeGestureRecognizerShouldBegin:(id)a3 forTextLoupeInteraction:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [v6 view];
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

- (BOOL)_allowsPaintSelectionForLoupeInteraction:(id)a3
{
  id v3 = [a3 _textInput];
  char v4 = [v3 isEditable] ^ 1;

  return v4;
}

- (BOOL)triggeredByLongPressGesture:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v7 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        goto LABEL_7;
      }
      double v10 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v10);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Gesture recognizer is type %@, but it should be a UIVariableDelayLoupeGesture", (uint8_t *)&v11, 0xCu);
    }
    else
    {
      id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &triggeredByLongPressGesture____s_category) + 8);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_2;
      }
      double v7 = v6;
      double v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Gesture recognizer is type %@, but it should be a UIVariableDelayLoupeGesture", (uint8_t *)&v11, 0xCu);
    }

LABEL_7:
  }
LABEL_2:
  char v4 = [v3 isLongPress];

  return v4;
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
  [a4 _translationInView:a3];
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
  id v128 = a3;
  uint64_t v13 = (double (**)(void))a5;
  v14 = (double (**)(void))a6;
  [v128 cancelLinkInteractionSession];
  v15 = [v128 _textInput];
  v16 = [v128 assistantDelegate];
  v17 = [v16 activeSelectionController];
  v18 = [v17 selection];

  BOOL v19 = [(UITextRefinementTouchBehavior *)self _allowsPaintSelectionForLoupeInteraction:v128];
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      BOOL v20 = v19;
      v21 = [v128 root];
      [v21 _createFeedbackIfNecessary];

      v22 = [v128 root];
      [v22 _prepareFeedbackForGesture];

      [v16 stashCurrentSelection];
      [v16 setAutoscrolled:0];
      [v128 setInGesture:1];
      [v16 setGrabberSuppressionAssertion:0];
      BOOL v23 = 0;
      if (objc_opt_respondsToSelector()) {
        BOOL v23 = [v15 keyboardType] == 122;
      }
      if (([v15 isEditing] & 1) == 0 && !v23)
      {
        v24 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        v25 = [v24 vendKeyboardSuppressionAssertionForReason:@"Loupe gesture"];
        [v16 setKeyboardSuppressionAssertion:v25];
      }
      v26 = [v15 selectedTextRange];
      originalTextRange = self->_originalTextRange;
      self->_originalTextRange = v26;

      v28 = +[UIKeyboardImpl activeInstance];
      self->_isShiftKeyBeingHeld = [v28 isShiftKeyBeingHeld];

      double v29 = *MEMORY[0x1E4F1DAD8];
      double v30 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      objc_msgSend(v16, "setLoupeGestureEndPoint:", *MEMORY[0x1E4F1DAD8], v30);
      objc_msgSend(v16, "setNeedsGestureUpdate:", objc_msgSend(v128, "_textInputIsInteractive") ^ 1);
      [v16 setFirstResponderIfNecessary];
      v31 = [v16 activeSelectionController];
      activeSelectionController = self->_activeSelectionController;
      self->_activeSelectionController = v31;

      if ([v128 _textInputIsInteractive])
      {
        [v128 disableClearsOnInsertion];
        [v16 willBeginSelectionInteraction];
        [v128 _beginSelectionChange];
        double v33 = v13[2](v13);
        double v35 = v34;
        v36 = [v18 selectedRange];
        objc_msgSend(v16, "convertPointToRenderSpace:textRange:", v36, v33, v35);
        double v38 = v37;
        double v40 = v39;

        objc_msgSend(v128, "updateInitialPoint:", v38, v40);
        [v18 caretRect];
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        double v126 = v40;
        double v127 = v38;
        UIDistanceBetweenPointAndRect(v38, v40, v41, v43, v45, v47);
        double v50 = v49;
        if (_UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_TextRefinement_NearCaretDistance, @"TextRefinement_NearCaretDistance"))double v51 = 40.0; {
        else
        }
          double v51 = *(double *)&qword_1E8FD4F60;
        if ([v15 isEditing] && v50 < v51)
        {
          self->_int64_t activeSelectionMode = 0;
          double v53 = v126;
          double v52 = v127;
          v54 = [v128 gestureTuning];
          objc_msgSend(v54, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", v126 - v44, v127 - (v42 + v46 * 0.5), v126 - (v44 + v48 * 0.5));
          uint64_t v55 = 0;
        }
        else
        {
          if (v20) {
            self->_int64_t activeSelectionMode = 2;
          }
          v84 = [v128 root];
          [v84 _playFeedbackForCursorMovement];

          [v128 _cancelRecognizerWithName:0x1ED174000];
          v54 = [v128 gestureTuning];
          objc_msgSend(v54, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", 0.0, v29, v30);
          uint64_t v55 = 1;
          double v53 = v126;
          double v52 = v127;
        }

        int64_t activeSelectionMode = self->_activeSelectionMode;
        if ((unint64_t)(activeSelectionMode - 1) >= 2)
        {
          if (!activeSelectionMode)
          {
            -[_UIKeyboardTextSelectionController selectPositionAtPoint:executionContext:](self->_activeSelectionController, "selectPositionAtPoint:executionContext:", 0, v52, v53);
            [v16 willBeginFloatingCursor:0];
            objc_msgSend(v16, "beginFloatingCursorAtPoint:", v52, v53);
          }
        }
        else
        {
          [v128 setStrongerBiasAgainstUp:1];
          [(_UIKeyboardTextSelectionController *)self->_activeSelectionController beginSelection];
          -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:executionContext:", v55, 0, v52, v53);
          [(_UIKeyboardTextSelectionController *)self->_activeSelectionController restartSelection];
        }
        v86 = [v16 _editMenuAssistant];
        [v86 hideSelectionCommands];

        [v16 resetWillHandoffLoupeMagnifier];
        if ([v128 triggeredByLongPress])
        {
          v87 = [v128 root];
          [v87 _playFeedbackForCursorMovement];
        }
        if ([v16 shouldDisplayLoupeSessionForTouchType:0])
        {
          v88 = [v16 _caretView];
          v89 = [v128 view];
          v90 = [v89 textInputView];
          +[UITextLoupeSession _beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:](UITextLoupeSession, "_beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:", v88, v90, [v16 loupeOrientation], v52, v53);
          v91 = (UITextLoupeSession *)objc_claimAutoreleasedReturnValue();
          loupeSession = self->_loupeSession;
          self->_loupeSession = v91;

          v93 = [v128 gestureTuning];
          [(UITextLoupeSession *)self->_loupeSession setGestureTuning:v93];
        }
      }
      else if (a9)
      {
        *a9 = 1;
      }
    }
    else if ((unint64_t)(a4 - 3) <= 1)
    {
      [v128 setInGesture:0];
      v69 = [v128 root];
      [v69 _cleanUpFeedbackForGesture];

      [v128 cancelDelayedLoupeActionIfNecessary];
      [v16 setKeyboardSuppressionAssertion:0];
      grabberHandleSuppressionAssertion = self->_grabberHandleSuppressionAssertion;
      self->_grabberHandleSuppressionAssertion = 0;

      if ([v128 _textInputIsInteractive])
      {
        double v71 = v13[2](v13);
        double v73 = v72;
        double v74 = v14[2](v14);
        double v76 = v75;
        objc_msgSend(v128, "pointIfPlacedCarefully:", v71, v73);
        objc_msgSend(v128, "touchAlignedPointForPoint:translation:");
        double v78 = v77;
        double v80 = v79;
        if (_UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_TextRefinement_AllowableMovement, @"TextRefinement_AllowableMovement"))double v81 = 8.0; {
        else
        }
          double v81 = *(double *)&qword_1EB256E78;
        if (([v16 autoscrolled] & 1) == 0)
        {
          objc_msgSend(v16, "setLoupeGestureEndPoint:", v78, v80);
          v82 = [v15 selectedTextRange];
          int v83 = [v82 isEmpty];

          if (v83)
          {
            -[_UIKeyboardTextSelectionController selectPositionAtPoint:executionContext:](self->_activeSelectionController, "selectPositionAtPoint:executionContext:", 0, v78, v80);
          }
          else if ([v15 conformsToProtocol:&unk_1ED7009A0])
          {
            id v102 = v15;
            if (objc_opt_respondsToSelector())
            {
              objc_msgSend(v102, "updateSelectionWithExtentPoint:boundary:completionHandler:", 1, &__block_literal_global_194, v78, v80);
            }
            else if (objc_opt_respondsToSelector())
            {
              objc_msgSend(v102, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", 1, &__block_literal_global_333_0, v78, v80);
            }
          }
          else if ([v15 conformsToProtocol:&unk_1ED700D60])
          {
            objc_msgSend(v15, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", 1, &__block_literal_global_391_0, v78, v80);
          }
          else if (self->_activeSelectionMode == 2)
          {
            -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:executionContext:", 0, v78, v80);
          }
        }
        [(_UIKeyboardTextSelectionController *)self->_activeSelectionController endSelection];
        v103 = self->_activeSelectionController;
        self->_activeSelectionController = 0;

        [v128 _endSelectionChange];
        [v16 didEndSelectionInteraction];
        [v16 cancelAutoscroll];
        if ([v16 needsGestureUpdate]
          && ([v16 willHandoffLoupeMagnifier] & 1) == 0)
        {
          [v16 setGestureRecognizers];
        }
        v104 = self->_originalTextRange;
        v105 = [v15 selectedTextRange];
        int v106 = [(UITextRange *)v104 isEqual:v105];

        v107 = [v15 selectedTextRange];
        int v108 = [v107 isEmpty];

        if (v108 && v74 * v74 + v76 * v76 > v81 * v81 && !self->_isShiftKeyBeingHeld)
        {
          [v16 setSelectionHighlightMode:0];
        }
        else if (v106)
        {
          v109 = [v16 _editMenuAssistant];
          [v109 showSelectionCommands];
        }
        if (([v15 isEditable] & 1) == 0)
        {
          v110 = [v16 _editMenuAssistant];
          [v110 showSelectionCommands];
        }
        [v16 updateDisplayedSelection];
        [v18 caretRect];
        if (v106)
        {
          CGFloat v115 = v111;
          CGFloat v116 = v112;
          CGFloat v117 = v113;
          CGFloat v118 = v114;
          v119 = [v15 selectedTextRange];

          if (v119)
          {
            UIDistanceBetweenPointAndRect(v78, v80, v115, v116, v117, v118);
            double v121 = v120;
            int v122 = _UIInternalPreferenceUsesDefault_1(&_UIInternalPreference_TextRefinement_NearCaretDistance, @"TextRefinement_NearCaretDistance");
            double v123 = *(double *)&qword_1E8FD4F60;
            if (v122) {
              double v123 = 40.0;
            }
            if (v121 < v123)
            {
              v124 = [v16 _editMenuAssistant];
              [v124 showSelectionCommandsAfterDelay:0.2];
            }
          }
        }
      }
      [(UITextLoupeSession *)self->_loupeSession invalidate];
      v125 = self->_loupeSession;
      self->_loupeSession = 0;

      [v16 endFloatingCursor];
      [v16 clearStashedSelection];
    }
    goto LABEL_77;
  }
  if (![v128 inGesture]) {
    goto LABEL_77;
  }
  double v56 = v13[2](v13);
  double v58 = v57;
  double v59 = v14[2](v14);
  double v61 = v60;
  objc_msgSend(v128, "touchAlignedPointForPoint:translation:", v56, v58, v59, v60);
  double v63 = v62;
  double v65 = v64;
  int64_t v66 = self->_activeSelectionMode;
  if (v66 == 2)
  {
    v67 = [v15 selectedTextRange];
    char v68 = [v67 isEmpty];

    if ((v68 & 1) == 0)
    {
      -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:withBoundary:executionContext:](self->_activeSelectionController, "updateSelectionWithExtentPoint:withBoundary:executionContext:", 1, 0, v63, v65);
      goto LABEL_44;
    }
    int64_t v66 = self->_activeSelectionMode;
  }
  if (v66)
  {
    if (v66 == 1)
    {
      -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](self->_activeSelectionController, "selectTextWithGranularity:atPoint:executionContext:", 1, 0, v63, v65);
LABEL_44:
      uint64_t v94 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    -[_UIKeyboardTextSelectionController selectPositionAtPoint:executionContext:](self->_activeSelectionController, "selectPositionAtPoint:executionContext:", 0, v63, v65);
  }
  uint64_t v94 = 1;
LABEL_47:
  objc_msgSend(v16, "startAutoscroll:", v63, v65);
  objc_msgSend(v128, "updateOrCancelDelayedLoupeActionWithPoint:translation:", v63, v65, v59, v61);
  v95 = [v128 gestureTuning];
  int v96 = [v95 shouldUseLineThreshold];

  if (v96)
  {
    objc_msgSend(v16, "updateFloatingCursorAtPoint:animated:", 0, v63, v65);
    v97 = self->_loupeSession;
    [v18 caretRect];
    -[UITextLoupeSession moveToPoint:withCaretRect:trackingCaret:](v97, "moveToPoint:withCaretRect:trackingCaret:", v94, v63, v65, v98, v99, v100, v101);
  }
LABEL_77:
}

@end