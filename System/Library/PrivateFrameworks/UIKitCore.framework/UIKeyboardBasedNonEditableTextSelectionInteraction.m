@interface UIKeyboardBasedNonEditableTextSelectionInteraction
@end

@implementation UIKeyboardBasedNonEditableTextSelectionInteraction

id __73___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePan___block_invoke(id *a1)
{
  v19[6] = *MEMORY[0x1E4F143B8];
  id v2 = a1[4];
  v3 = [a1[5] textInputView];
  [v2 _translationInView:v3];
  double v5 = v4;
  double v7 = v6;

  v19[0] = @"KeyboardTextSelection";
  v18[0] = @"KeyboardEventType";
  v18[1] = @"Operation";
  v8 = UIKBAnalyticsSelectionTypeForGranularity([a1[6] previousRepeatedGranularity]);
  v19[1] = v8;
  v18[2] = @"TriggerType";
  v9 = [a1[4] view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v9);
  v11 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    v11 = UIKBAnalyticsGestureIsOnCanvas;
  }
  v12 = [@"Force pan" stringByAppendingString:*v11];
  v19[2] = v12;
  v18[3] = @"GestureState";
  v13 = _UIGestureRecognizerStateString([a1[4] state]);
  v19[3] = v13;
  v18[4] = @"CursorLocationX";
  v14 = [NSNumber numberWithDouble:v5];
  v19[4] = v14;
  v18[5] = @"CursorLocationY";
  v15 = [NSNumber numberWithDouble:v7];
  v19[5] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];

  return v16;
}

uint64_t __73___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePan___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) restartSelection];
    objc_msgSend(*(id *)(a1 + 32), "selectedRectInLineWithPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    double y = v9.origin.y;
    v3 = objc_msgSend(*(id *)(a1 + 40), "gestureTuning", CGRectGetMidY(v9));
    objc_msgSend(v3, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", *(double *)(a1 + 56) - y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  double v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  return objc_msgSend(v4, "beginRangedMagnifierAtPoint:", v5, v6);
}

void __75___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePress___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(a1 + 32) restartSelection];
    objc_msgSend(*(id *)(a1 + 32), "selectedRectInLineWithPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    double y = v5.origin.y;
    objc_msgSend(*(id *)(a1 + 40), "gestureTuning", CGRectGetMidY(v5));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertInitialPositionFromTopOfCaret:distanceFromCaret:", *(double *)(a1 + 56) - y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

id __75___UIKeyboardBasedNonEditableTextSelectionInteraction_oneFingerForcePress___block_invoke_3(uint64_t a1)
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"KeyboardTextSelection";
  v10[0] = @"KeyboardEventType";
  v10[1] = @"Operation";
  id v2 = UIKBAnalyticsSelectionTypeForGranularity([*(id *)(a1 + 32) previousRepeatedGranularity]);
  v11[1] = v2;
  v10[2] = @"TriggerType";
  id v3 = [*(id *)(a1 + 40) view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v3);
  CGRect v5 = UIKBAnalyticsGestureIsOnKeyboard;
  if (!isViewKeyboardLayoutPresent) {
    CGRect v5 = UIKBAnalyticsGestureIsOnCanvas;
  }
  double v6 = [@"Force press" stringByAppendingString:*v5];
  v11[2] = v6;
  v10[3] = @"GestureState";
  double v7 = _UIGestureRecognizerStateString([*(id *)(a1 + 40) state]);
  v11[3] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

@end