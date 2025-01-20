@interface UIKeyboardBasedTextSelectionInteraction
@end

@implementation UIKeyboardBasedTextSelectionInteraction

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_476 copy];
  v1 = (void *)qword_1EB25B370;
  qword_1EB25B370 = v0;
}

uint64_t __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) selectionController];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) selectionController];
    [v5 beginSelection];

    v6 = [*(id *)(a1 + 32) selectionController];
    uint64_t v7 = [*(id *)(a1 + 40) previousRepeatedGranularity];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_4;
    v9[3] = &unk_1E52E34C8;
    id v10 = *(id *)(a1 + 40);
    v8 = [v3 childWithContinuation:v9];
    objc_msgSend(v6, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v7, v8, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    [v3 returnExecutionToParent];
  }
}

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 setPanGestureState:6];
  [v3 returnExecutionToParent];
}

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_5()
{
  uint64_t v0 = [&__block_literal_global_482 copy];
  v1 = (void *)qword_1EB25B380;
  qword_1EB25B380 = v0;
}

uint64_t __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) selectionController];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) selectionController];
    uint64_t v6 = [*(id *)(a1 + 40) previousRepeatedGranularity];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_8;
    v13 = &unk_1E52E3880;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 32);
    id v14 = v7;
    uint64_t v15 = v8;
    long long v16 = *(_OWORD *)(a1 + 48);
    v9 = [v3 childWithContinuation:&v10];
    objc_msgSend(v5, "selectTextWithGranularity:atPoint:executionContext:", v6, v9, *(double *)(a1 + 48), *(double *)(a1 + 56), v10, v11, v12, v13);
  }
  else
  {
    [v3 returnExecutionToParent];
  }
}

void __104___UIKeyboardBasedTextSelectionInteraction_transitionFromBlockMagnifyToBlockSelectWithLocation_viaDrag___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 setPanGestureState:6];
  v4 = [*(id *)(a1 + 40) selectionController];
  [v4 beginSelection];

  v5 = [*(id *)(a1 + 40) selectionController];
  objc_msgSend(v5, "beginLoupeMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  [v6 returnExecutionToParent];
}

void __97___UIKeyboardBasedTextSelectionInteraction_beginOneFingerSelectWithTranslation_executionContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v2 selectionController];
  [v3 beginSelection];

  [v4 returnExecutionToParent];
}

id __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke(uint64_t a1)
{
  v17[6] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "cursorLocationForTranslation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v3 = v2;
  double v5 = v4;
  v17[0] = @"KeyboardTextSelection";
  v16[0] = @"KeyboardEventType";
  v16[1] = @"Operation";
  id v6 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 40) previousRepeatedGranularity]);
  v17[1] = v6;
  v16[2] = @"TriggerType";
  id v7 = [*(id *)(a1 + 48) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v7);
  v9 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    v9 = UIKBAnalyticsGestureIsOnCanvas;
  }
  uint64_t v10 = [@"Force pan" stringByAppendingString:*v9];
  v17[2] = v10;
  v16[3] = @"CursorLocationX";
  uint64_t v11 = [NSNumber numberWithDouble:v3];
  v17[3] = v11;
  v16[4] = @"CursorLocationY";
  v12 = [NSNumber numberWithDouble:v5];
  v17[4] = v12;
  v16[5] = @"GestureState";
  v13 = _UIGestureRecognizerStateString([*(id *)(a1 + 48) state]);
  v17[5] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_489 copy];
  v1 = (void *)qword_1EB25B390;
  qword_1EB25B390 = v0;
}

uint64_t __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_5;
  uint64_t v11 = &unk_1E52E3880;
  double v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v6;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v7 = [a2 childWithContinuation:&v8];
  objc_msgSend(v4, "endOneFingerSelectWithExecutionContext:", v7, v8, v9, v10, v11);
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_5(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 setPanGestureState:0];
  double v4 = [*(id *)(a1 + 40) selectionController];
  objc_msgSend(v4, "endLoupeMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  [*(id *)(a1 + 32) setDidFloatCursor:0];
  [v5 returnExecutionToParent];
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_6()
{
  uint64_t v0 = [&__block_literal_global_495_0 copy];
  v1 = (void *)qword_1EB25B3A0;
  qword_1EB25B3A0 = v0;
}

uint64_t __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_8(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_9;
  v5[3] = &unk_1E52E3EB0;
  v5[4] = v3;
  long long v6 = *(_OWORD *)(a1 + 40);
  double v4 = [a2 childWithContinuation:v5];
  objc_msgSend(v3, "updateOneFingerSelectWithTranslation:executionContext:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_9(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v5 = a2;
  double v4 = [v3 selectionController];
  objc_msgSend(v4, "updateLoupeMagnifierAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  [v5 returnExecutionToParent];
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_10()
{
  uint64_t v0 = [&__block_literal_global_501_0 copy];
  v1 = (void *)qword_1EB25B3B0;
  qword_1EB25B3B0 = v0;
}

uint64_t __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_12(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = [*(id *)(a1 + 32) selectionController];

  if (v3)
  {
    double v4 = [*(id *)(a1 + 32) selectionController];
    objc_msgSend(v4, "selectTextWithGranularity:atPoint:executionContext:", 1, v5, *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
  else
  {
    [v5 returnExecutionToParent];
  }
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_13()
{
  uint64_t v0 = [&__block_literal_global_507_0 copy];
  v1 = (void *)qword_1EB25B3C0;
  qword_1EB25B3C0 = v0;
}

uint64_t __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_16;
  uint64_t v11 = &unk_1E52E3880;
  double v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v6;
  long long v14 = *(_OWORD *)(a1 + 48);
  id v7 = [a2 childWithContinuation:&v8];
  objc_msgSend(v4, "endOneFingerSelectWithExecutionContext:", v7, v8, v9, v10, v11);
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_16(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 setPanGestureState:0];
  double v4 = [*(id *)(a1 + 40) selectionController];
  objc_msgSend(v4, "endLoupeMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  [*(id *)(a1 + 32) setDidFloatCursor:0];
  [v5 returnExecutionToParent];
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_17()
{
  uint64_t v0 = [&__block_literal_global_513_0 copy];
  v1 = (void *)qword_1EB25B3D0;
  qword_1EB25B3D0 = v0;
}

uint64_t __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_18(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) selectionController];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) selectionController];
    uint64_t v6 = [*(id *)(a1 + 40) previousRepeatedGranularity];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_20;
    v8[3] = &unk_1E52E3EB0;
    v8[4] = *(void *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 48);
    id v7 = [v3 childWithContinuation:v8];
    objc_msgSend(v5, "updateSelectionWithExtentPoint:withBoundary:executionContext:", v6, v7, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  else
  {
    [v3 returnExecutionToParent];
  }
}

void __62___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePan___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  double v4 = [v3 selectionController];
  objc_msgSend(v4, "updateLoupeMagnifierAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));

  [v5 returnExecutionToParent];
}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_517_1 copy];
  v1 = (void *)qword_1EB25B3E0;
  qword_1EB25B3E0 = v0;
}

uint64_t __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_4;
  long long v9 = &unk_1E52E3880;
  double v4 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  long long v12 = *(_OWORD *)(a1 + 56);
  id v5 = [a2 childWithContinuation:&v6];
  objc_msgSend(v4, "endOneFingerSelectWithExecutionContext:", v5, v6, v7, v8, v9);
}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setPanGestureState:0];
  [*(id *)(a1 + 40) willHandoffLoupeMagnifier];
  objc_msgSend(*(id *)(a1 + 40), "endLoupeMagnifierAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  [v4 returnExecutionToParent];
}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_6()
{
  uint64_t v0 = [&__block_literal_global_523 copy];
  v1 = (void *)qword_1EB25B3F0;
  qword_1EB25B3F0 = v0;
}

uint64_t __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) selectionController];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) selectionController];
    uint64_t v6 = [*(id *)(a1 + 40) previousRepeatedGranularity];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_9;
    v10[3] = &unk_1E52FE6A8;
    char v14 = *(unsigned char *)(a1 + 72);
    id v7 = *(id *)(a1 + 48);
    long long v13 = *(_OWORD *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = v7;
    uint64_t v12 = v8;
    long long v9 = [v3 childWithContinuation:v10];
    objc_msgSend(v5, "selectTextWithGranularity:atPoint:executionContext:", v6, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    [v3 returnExecutionToParent];
  }
}

void __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_9(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) restartSelection];
    objc_msgSend(*(id *)(a1 + 32), "selectedRectInLineWithPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    double y = v7.origin.y;
    id v4 = objc_msgSend(*(id *)(a1 + 40), "gestureTuning", CGRectGetMidY(v7));
    objc_msgSend(v4, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", *(double *)(a1 + 56) - y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  [v5 returnExecutionToParent];
}

id __64___UIKeyboardBasedTextSelectionInteraction_oneFingerForcePress___block_invoke_10(uint64_t a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"KeyboardTextSelection";
  v13[0] = @"KeyboardEventType";
  v13[1] = @"Operation";
  double v2 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 32) previousRepeatedGranularity]);
  v14[1] = v2;
  v13[2] = @"TriggerType";
  id v3 = [*(id *)(a1 + 40) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v3);
  id v5 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    id v5 = UIKBAnalyticsGestureIsOnCanvas;
  }
  uint64_t v6 = [@"Force press" stringByAppendingString:*v5];
  v14[2] = v6;
  v13[3] = @"Count";
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 144);
  }
  else {
    uint64_t v8 = 0;
  }
  long long v9 = [NSNumber numberWithUnsignedInteger:v8];
  v14[3] = v9;
  v13[4] = @"GestureState";
  id v10 = _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  v14[4] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

@end