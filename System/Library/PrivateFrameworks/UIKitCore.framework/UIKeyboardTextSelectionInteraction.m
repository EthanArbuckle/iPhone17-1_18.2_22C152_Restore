@interface UIKeyboardTextSelectionInteraction
@end

@implementation UIKeyboardTextSelectionInteraction

uint64_t __53___UIKeyboardTextSelectionInteraction_registerOwner___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 128);
  *(void *)(v2 + 128) = 0;

  v4 = *(void **)(a1 + 32);
  return [v4 detach];
}

void __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_67_3 copy];
  v1 = (void *)_MergedGlobals_13_1;
  _MergedGlobals_13_1 = v0;
}

uint64_t __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  switch(v5)
  {
    case 3:
      v6 = *(void **)(a1 + 32);
      if (*(void *)(a1 + 64))
      {
        uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "layoutDirectionFromFlickDirection:");
        v8 = *(void **)(a1 + 32);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_4;
        v11[3] = &unk_1E52E34C8;
        v11[4] = v8;
        v9 = [v4 childWithContinuation:v11];
        [v8 handleTwoFingerFlickInDirection:v7 executionContext:v9];
      }
      else
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_5;
        v10[3] = &unk_1E52E34C8;
        v10[4] = v6;
        v9 = [v3 childWithContinuation:v10];
        objc_msgSend(v6, "updateTwoFingerPanWithTranslation:executionContext:", v9, *(double *)(a1 + 48), *(double *)(a1 + 56));
      }

      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "updateTwoFingerPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "beginTwoFingerCursorPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    default:
      [*(id *)(a1 + 32) cancelTwoFingerPanWithExecutionContext:v3];
      break;
  }
}

uint64_t __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) endTwoFingerPanWithExecutionContext:a2];
}

uint64_t __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) endTwoFingerPanWithExecutionContext:a2];
}

void __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_72 copy];
  v1 = (void *)qword_1EB25B310;
  qword_1EB25B310 = v0;
}

uint64_t __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  switch(v5)
  {
    case 3:
      v6 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke_4;
      v8[3] = &unk_1E52E34C8;
      v8[4] = v6;
      uint64_t v7 = [v3 childWithContinuation:v8];
      objc_msgSend(v6, "updateIndirectBlockPanWithTranslation:executionContext:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "updateIndirectBlockPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "beginIndirectBlockPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    default:
      [*(id *)(a1 + 32) endIndirectBlockPanWithExecutionContext:v3];
      break;
  }
}

uint64_t __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) endIndirectBlockPanWithExecutionContext:a2];
}

void __93___UIKeyboardTextSelectionInteraction_beginIndirectBlockPanWithTranslation_executionContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v2 selectionController];
  [v3 beginSelection];

  [v4 returnExecutionToParent];
}

void __88___UIKeyboardTextSelectionInteraction_handleTwoFingerFlickInDirection_executionContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selectionController];

  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 64);
    id v4 = [*(id *)(a1 + 32) selectionController];
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    if (v3) {
      [v4 selectPositionAtBoundary:v6 inDirection:v7 executionContext:v8];
    }
    else {
      [v4 selectImmediatePositionAtBoundary:v6 inDirection:v7 executionContext:v8];
    }

    id v10 = [*(id *)(a1 + 32) selectionController];
    [v10 scrollSelectionToVisible];
  }
  else
  {
    v9 = *(void **)(a1 + 40);
    [v9 returnExecutionToParent];
  }
}

void __70___UIKeyboardTextSelectionInteraction_clearKeyboardTouchesForGesture___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_76_1 copy];
  v1 = (void *)qword_1EB25B320;
  qword_1EB25B320 = v0;
}

uint64_t __70___UIKeyboardTextSelectionInteraction_clearKeyboardTouchesForGesture___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __70___UIKeyboardTextSelectionInteraction_clearKeyboardTouchesForGesture___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 cancelTouchesForTwoFingerTapGesture:v3];
  [v4 returnExecutionToParent];
}

void __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_80_0 copy];
  v1 = (void *)qword_1EB25B330;
  qword_1EB25B330 = v0;
}

uint64_t __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) selectionController];
  [v4 caretRectForCursorPosition];
  BOOL IsNull = CGRectIsNull(v33);

  if (IsNull)
  {
LABEL_19:
    [v3 returnExecutionToParent];
    goto LABEL_22;
  }
  uint64_t v6 = [*(id *)(a1 + 32) selectionController];
  [v6 caretRectForCursorPosition];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = *(double *)(a1 + 48);
  double v16 = *(double *)(a1 + 56);
  if (v15 < v16)
  {
    char v18 = 0;
  }
  else
  {
    v17 = [*(id *)(a1 + 32) selectionController];
    char v18 = [v17 hasRangedSelection];
  }
  if (!*(unsigned char *)(a1 + 64))
  {
    v21 = [*(id *)(a1 + 32) selectionController];
    uint64_t v19 = [v21 selectionGranularity];

    if (v18) {
      goto LABEL_7;
    }
LABEL_9:
    int64_t v20 = +[UITextInteractionAssistant _nextGranularityInCycle:v19 forTouchType:0];
    goto LABEL_10;
  }
  uint64_t v19 = [*(id *)(a1 + 40) previousRepeatedGranularity];
  if ((v18 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_7:
  int64_t v20 = 0;
LABEL_10:
  if (v15 < v16 && !*(unsigned char *)(a1 + 64) && ![*(id *)(a1 + 40) previousRepeatedGranularity]) {
    int64_t v20 = 2;
  }
  [*(id *)(a1 + 40) setPreviousRepeatedGranularity:v20];
  v22 = [*(id *)(a1 + 32) selectionController];

  if (!v22) {
    goto LABEL_19;
  }
  double v23 = v12 * 0.5;
  double v24 = v14 * 0.5;
  if (!*(unsigned char *)(a1 + 64))
  {
    v25 = [*(id *)(a1 + 32) selectionController];
    [v25 beginSelection];
  }
  double v26 = v8 + v23;
  v27 = [*(id *)(a1 + 32) selectionController];
  if (v20)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_5;
    v29[3] = &unk_1E52E4108;
    char v30 = *(unsigned char *)(a1 + 64);
    v29[4] = *(void *)(a1 + 32);
    v28 = [v3 childWithContinuation:v29];
    objc_msgSend(v27, "selectTextWithGranularity:atPoint:executionContext:", v20, v28, v26, v10 + v24);
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_4;
    v31[3] = &unk_1E52E4108;
    char v32 = *(unsigned char *)(a1 + 64);
    v31[4] = *(void *)(a1 + 32);
    v28 = [v3 childWithContinuation:v31];
    objc_msgSend(v27, "selectPositionAtPoint:executionContext:", v28, v26, v10 + v24);
  }

LABEL_22:
}

void __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_4(uint64_t a1, void *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 selectionController];
  uint64_t v5 = v4;
  if (v2) {
    [v4 restartSelection];
  }
  else {
    [v4 endSelection];
  }

  [v6 returnExecutionToParent];
}

void __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_5(uint64_t a1, void *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 selectionController];
  uint64_t v5 = v4;
  if (v2) {
    [v4 restartSelection];
  }
  else {
    [v4 endSelection];
  }

  [v6 returnExecutionToParent];
}

void __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_86_1 copy];
  v1 = (void *)qword_1EB25B340;
  qword_1EB25B340 = v0;
}

uint64_t __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 3)
  {
    [*(id *)(a1 + 32) endLongPressWithExecutionContext:v3];
    uint64_t v5 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    id v6 = v5;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    int64_t v20 = __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_5;
    v21 = &unk_1E52FE6D0;
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 32);
    long long v23 = *(_OWORD *)(a1 + 48);
    uint64_t v24 = v9;
    double v8 = &v18;
LABEL_8:
    objc_msgSend(v5, "logBlock:domain:", v8, @"com.apple.keyboard.UIKit", v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31);

    goto LABEL_9;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "beginLongPressWithTranslation:touchCount:executionContext:", *(void *)(a1 + 64), v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      uint64_t v5 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      id v6 = v5;
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_4;
      v28 = &unk_1E52FE6D0;
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v29 = *(void *)(a1 + 32);
      long long v30 = *(_OWORD *)(a1 + 48);
      uint64_t v31 = v7;
      double v8 = &v25;
    }
    else
    {
      [*(id *)(a1 + 32) cancelLongPressWithExecutionContext:v3];
      uint64_t v5 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      id v6 = v5;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      double v13 = __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_6;
      double v14 = &unk_1E52FE6D0;
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 32);
      long long v16 = *(_OWORD *)(a1 + 48);
      uint64_t v17 = v10;
      double v8 = &v11;
    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "updateLongPressWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
LABEL_9:
}

id __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_4(uint64_t a1)
{
  v21[6] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v3 = v2;
  double v5 = v4;
  v21[0] = @"KeyboardTextSelection";
  v20[0] = @"KeyboardEventType";
  v20[1] = @"Operation";
  id v6 = [*(id *)(a1 + 32) owner];
  uint64_t v7 = [v6 delegate];
  double v8 = [v7 textSelectionController];
  int v9 = [v8 hasRangedSelection];
  uint64_t v10 = (void *)MEMORY[0x1E4FAEE58];
  if (!v9) {
    uint64_t v10 = (void *)MEMORY[0x1E4FAEE60];
  }
  v21[1] = *v10;
  v20[2] = @"TriggerType";
  uint64_t v11 = [*(id *)(a1 + 32) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v11);
  double v13 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    double v13 = UIKBAnalyticsGestureIsOnCanvas;
  }
  double v14 = [@"Two fingers" stringByAppendingString:*v13];
  v21[2] = v14;
  v20[3] = @"CursorLocationX";
  uint64_t v15 = [NSNumber numberWithDouble:v3];
  v21[3] = v15;
  v20[4] = @"CursorLocationY";
  long long v16 = [NSNumber numberWithDouble:v5];
  v21[4] = v16;
  v20[5] = @"GestureState";
  uint64_t v17 = _UIGestureRecognizerStateString(*(void *)(a1 + 56));
  v21[5] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];

  return v18;
}

id __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_5(uint64_t a1)
{
  v21[6] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v3 = v2;
  double v5 = v4;
  v21[0] = @"KeyboardTextSelection";
  v20[0] = @"KeyboardEventType";
  v20[1] = @"Operation";
  id v6 = [*(id *)(a1 + 32) owner];
  uint64_t v7 = [v6 delegate];
  double v8 = [v7 textSelectionController];
  int v9 = [v8 hasRangedSelection];
  uint64_t v10 = (void *)MEMORY[0x1E4FAEE58];
  if (!v9) {
    uint64_t v10 = (void *)MEMORY[0x1E4FAEE60];
  }
  v21[1] = *v10;
  v20[2] = @"TriggerType";
  uint64_t v11 = [*(id *)(a1 + 32) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v11);
  double v13 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    double v13 = UIKBAnalyticsGestureIsOnCanvas;
  }
  double v14 = [@"Two fingers" stringByAppendingString:*v13];
  v21[2] = v14;
  v20[3] = @"CursorLocationX";
  uint64_t v15 = [NSNumber numberWithDouble:v3];
  v21[3] = v15;
  v20[4] = @"CursorLocationY";
  long long v16 = [NSNumber numberWithDouble:v5];
  v21[4] = v16;
  v20[5] = @"GestureState";
  uint64_t v17 = _UIGestureRecognizerStateString(*(void *)(a1 + 56));
  v21[5] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];

  return v18;
}

id __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_6(uint64_t a1)
{
  v16[6] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v3 = v2;
  double v5 = v4;
  v15[0] = @"KeyboardEventType";
  v15[1] = @"Operation";
  v16[0] = @"KeyboardTextSelection";
  v16[1] = @"Cancel cursor";
  v15[2] = @"TriggerType";
  id v6 = [*(id *)(a1 + 32) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v6);
  double v8 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    double v8 = UIKBAnalyticsGestureIsOnCanvas;
  }
  int v9 = [@"Two fingers" stringByAppendingString:*v8];
  v16[2] = v9;
  v15[3] = @"CursorLocationX";
  uint64_t v10 = [NSNumber numberWithDouble:v3];
  v16[3] = v10;
  v15[4] = @"CursorLocationY";
  uint64_t v11 = [NSNumber numberWithDouble:v5];
  v16[4] = v11;
  v15[5] = @"GestureState";
  uint64_t v12 = _UIGestureRecognizerStateString(*(void *)(a1 + 56));
  v16[5] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:6];

  return v13;
}

void __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_97_0 copy];
  v1 = (void *)qword_1EB25B350;
  qword_1EB25B350 = v0;
}

uint64_t __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = v3;
  switch(*(void *)(a1 + 40))
  {
    case 0:
      goto LABEL_4;
    case 1:
      double v5 = [*(id *)(a1 + 32) owner];
      int v6 = [v5 didFloatCursor];

      if (v6) {
        [v4 returnExecutionToParent];
      }
      else {
LABEL_4:
      }
        objc_msgSend(*(id *)(a1 + 32), "beginTwoFingerPanWithTranslation:isShiftKeyBeingHeld:executionContext:", *(unsigned __int8 *)(a1 + 72), v4, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "updateTwoFingerPanWithTranslation:executionContext:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56));
      break;
    case 3:
      uint64_t v7 = *(void **)(a1 + 32);
      if (*(void *)(a1 + 64))
      {
        uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "layoutDirectionFromFlickDirection:");
        int v9 = *(void **)(a1 + 32);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_4;
        v12[3] = &unk_1E52E34C8;
        v12[4] = v9;
        uint64_t v10 = [v4 childWithContinuation:v12];
        [v9 handleTwoFingerFlickInDirection:v8 executionContext:v10];
      }
      else
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_5;
        v11[3] = &unk_1E52E34C8;
        v11[4] = v7;
        uint64_t v10 = [v3 childWithContinuation:v11];
        objc_msgSend(v7, "updateTwoFingerPanWithTranslation:executionContext:", v10, *(double *)(a1 + 48), *(double *)(a1 + 56));
      }

      break;
    default:
      [*(id *)(a1 + 32) cancelTwoFingerPanWithExecutionContext:v3];
      break;
  }
}

uint64_t __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) endTwoFingerPanWithExecutionContext:a2];
}

uint64_t __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) endTwoFingerPanWithExecutionContext:a2];
}

id __57___UIKeyboardTextSelectionInteraction_oneFingerForcePan___block_invoke(uint64_t a1)
{
  v17[6] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v3 = v2;
  double v5 = v4;
  v17[0] = @"KeyboardTextSelection";
  v16[0] = @"KeyboardEventType";
  v16[1] = @"Operation";
  int v6 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 40) previousRepeatedGranularity]);
  v17[1] = v6;
  v16[2] = @"TriggerType";
  uint64_t v7 = [*(id *)(a1 + 48) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v7);
  int v9 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    int v9 = UIKBAnalyticsGestureIsOnCanvas;
  }
  uint64_t v10 = [@"Force pan" stringByAppendingString:*v9];
  v17[2] = v10;
  v16[3] = @"CursorLocationX";
  uint64_t v11 = [NSNumber numberWithDouble:v3];
  v17[3] = v11;
  v16[4] = @"CursorLocationY";
  uint64_t v12 = [NSNumber numberWithDouble:v5];
  v17[4] = v12;
  v16[5] = @"GestureState";
  double v13 = _UIGestureRecognizerStateString([*(id *)(a1 + 48) state]);
  v17[5] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

id __57___UIKeyboardTextSelectionInteraction_oneFingerForcePan___block_invoke_2(uint64_t a1)
{
  v10[6] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v3 = v2;
  v9[0] = @"KeyboardEventType";
  v9[1] = @"Operation";
  v10[0] = @"KeyboardTextSelection";
  v10[1] = @"End selection gesture";
  v10[2] = @"Force pan";
  v9[2] = @"TriggerType";
  v9[3] = @"CursorLocationX";
  double v4 = objc_msgSend(NSNumber, "numberWithDouble:");
  v10[3] = v4;
  v9[4] = @"CursorLocationY";
  double v5 = [NSNumber numberWithDouble:v3];
  v10[4] = v5;
  v9[5] = @"GestureState";
  int v6 = _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  void v10[5] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];

  return v7;
}

id __52___UIKeyboardTextSelectionInteraction_twoFingerTap___block_invoke(uint64_t a1)
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"KeyboardTextSelection";
  v8[0] = @"KeyboardEventType";
  v8[1] = @"Operation";
  double v2 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 32) previousRepeatedGranularity]);
  v9[1] = v2;
  v8[2] = @"TriggerType";
  double v3 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!*(unsigned char *)(a1 + 48)) {
    double v3 = UIKBAnalyticsGestureIsOnCanvas;
  }
  double v4 = [@"Two fingers" stringByAppendingString:*v3];
  v9[2] = v4;
  v8[3] = @"GestureState";
  double v5 = _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  v8[4] = @"Count";
  v9[3] = v5;
  v9[4] = &unk_1ED3F5790;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

id __52___UIKeyboardTextSelectionInteraction_twoFingerTap___block_invoke_2(uint64_t a1)
{
  void v12[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"KeyboardTextSelection";
  v11[0] = @"KeyboardEventType";
  v11[1] = @"Operation";
  double v2 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 32) previousRepeatedGranularity]);
  v12[1] = v2;
  v11[2] = @"TriggerType";
  double v3 = [*(id *)(a1 + 40) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v3);
  double v5 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    double v5 = UIKBAnalyticsGestureIsOnCanvas;
  }
  int v6 = [@"Two fingers" stringByAppendingString:*v5];
  v12[2] = v6;
  v11[3] = @"GestureState";
  uint64_t v7 = _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  v12[3] = v7;
  v11[4] = @"Count";
  uint64_t v8 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v12[4] = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

id __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke(uint64_t a1)
{
  v18[7] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([*(id *)(a1 + 32) isSpacePan])
  {
    double v3 = UIKBAnalyticsSpaceBarPan;
  }
  else
  {
    char GestureKeyboardFlag = _getGestureKeyboardFlag(*(void **)(a1 + 40));
    double v3 = UIKBAnalyticsOneFingerTap;
    if ((GestureKeyboardFlag & 4) == 0) {
      double v3 = UIKBAnalyticsTwoFingerTap;
    }
  }
  [v2 appendString:*v3];
  double v5 = [*(id *)(a1 + 40) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v5);
  uint64_t v7 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    uint64_t v7 = UIKBAnalyticsGestureIsOnCanvas;
  }
  [v2 appendString:*v7];

  v18[0] = @"TextEditing";
  v17[0] = @"KeyboardEventType";
  v17[1] = @"Operation";
  uint64_t v8 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 32) previousRepeatedGranularity]);
  v18[1] = v8;
  v18[2] = v2;
  v17[2] = @"TriggerType";
  v17[3] = @"GestureState";
  int v9 = _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  v18[3] = v9;
  v17[4] = @"CursorLocationX";
  uint64_t v10 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v18[4] = v10;
  v17[5] = @"CursorLocationY";
  uint64_t v11 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v18[5] = v11;
  v17[6] = @"UsingShiftKey";
  uint64_t v12 = NSNumber;
  double v13 = +[UIKeyboardImpl activeInstance];
  double v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isShiftKeyBeingHeld"));
  v18[6] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];

  return v15;
}

id __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke_2(uint64_t a1)
{
  v18[7] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if ([*(id *)(a1 + 32) isSpacePan])
  {
    double v3 = UIKBAnalyticsSpaceBarPan;
  }
  else
  {
    char GestureKeyboardFlag = _getGestureKeyboardFlag(*(void **)(a1 + 40));
    double v3 = UIKBAnalyticsOneFingerTap;
    if ((GestureKeyboardFlag & 4) == 0) {
      double v3 = UIKBAnalyticsTwoFingerTap;
    }
  }
  [v2 appendString:*v3];
  double v5 = [*(id *)(a1 + 40) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v5);
  uint64_t v7 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    uint64_t v7 = UIKBAnalyticsGestureIsOnCanvas;
  }
  [v2 appendString:*v7];

  v18[0] = @"TextEditing";
  v17[0] = @"KeyboardEventType";
  v17[1] = @"Operation";
  uint64_t v8 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 32) previousRepeatedGranularity]);
  v18[1] = v8;
  v18[2] = v2;
  v17[2] = @"TriggerType";
  v17[3] = @"GestureState";
  int v9 = _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  v18[3] = v9;
  v17[4] = @"CursorLocationX";
  uint64_t v10 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v18[4] = v10;
  v17[5] = @"CursorLocationY";
  uint64_t v11 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
  v18[5] = v11;
  v17[6] = @"UsingShiftKey";
  uint64_t v12 = NSNumber;
  double v13 = +[UIKeyboardImpl activeInstance];
  double v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isShiftKeyBeingHeld"));
  v18[6] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];

  return v15;
}

void __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recognizerForName:@"_UIKeyboardTextSelectionGestureForcePress"];
  objc_msgSend(v2, "setShouldFailWithoutForce:", objc_msgSend(*(id *)(a1 + 40), "oneFingerForcePressShouldFailWithoutForce"));
  [*(id *)(a1 + 32) _didEndIndirectSelectionGesture:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _clearTouchPadCallback];
}

void __73___UIKeyboardTextSelectionInteraction__startTouchPadTimerWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelTouchPadTimer];
  id v2 = (void (**)(void))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  [*(id *)(a1 + 32) _clearTouchPadCallback];
  v2[2]();
}

id __59___UIKeyboardTextSelectionInteraction_oneFingerForcePress___block_invoke(uint64_t a1)
{
  void v16[7] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v3 = v2;
  double v5 = v4;
  v16[0] = @"KeyboardTextSelection";
  v15[0] = @"KeyboardEventType";
  v15[1] = @"Operation";
  int v6 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 40) previousRepeatedGranularity]);
  v16[1] = v6;
  v16[2] = @"Force press";
  v15[2] = @"TriggerType";
  v15[3] = @"Count";
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 144);
  }
  else {
    uint64_t v8 = 0;
  }
  int v9 = [NSNumber numberWithUnsignedInteger:v8];
  v16[3] = v9;
  v15[4] = @"GestureState";
  uint64_t v10 = UIKBAnalyticsSelectionTypeForGestureState([*(id *)(a1 + 40) panGestureState]);
  v16[4] = v10;
  v15[5] = @"CursorLocationX";
  uint64_t v11 = [NSNumber numberWithDouble:v3];
  v16[5] = v11;
  void v15[6] = @"CursorLocationY";
  uint64_t v12 = [NSNumber numberWithDouble:v5];
  void v16[6] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:7];

  return v13;
}

@end