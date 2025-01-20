@interface UIKBRTRecognizer
@end

@implementation UIKBRTRecognizer

uint64_t __26___UIKBRTRecognizer_reset__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "copy", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [*(id *)(*(void *)(a1 + 32) + 24) logTouchInfo:v7 withPhase:4];
        [v7 invalidateTimer];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 80) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 88) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
  uint64_t v8 = *(void *)(a1 + 32);
  if (_UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_HorizontalRestScaleValue, @"_UIKBRT_HorizontalRestScaleValue"))double v9 = 2.0; {
  else
  }
    double v9 = *(double *)&qword_1E8FD5010;
  int v10 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_VerticalRestScaleValue, @"_UIKBRT_VerticalRestScaleValue");
  double v11 = *(double *)&qword_1E8FD5000;
  if (v10) {
    double v11 = 0.666666667;
  }
  *(double *)(v8 + 136) = v9;
  *(double *)(v8 + 144) = v11;
  uint64_t result = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_MaximumNonRestMovePercent, @"_UIKBRT_MaximumNonRestMovePercent");
  double v13 = *(double *)&qword_1E8FD5020;
  if (result) {
    double v13 = 0.333333333;
  }
  *(double *)(*(void *)(a1 + 32) + 56) = v13;
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  return result;
}

double __45___UIKBRTRecognizer_setStandardKeyPixelSize___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  int v4 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_HorizontalRestScaleValue, @"_UIKBRT_HorizontalRestScaleValue");
  double v5 = *(double *)&qword_1E8FD5010;
  if (v4) {
    double v5 = 2.0;
  }
  double v6 = v3 * v5;
  double v7 = *(double *)(a1 + 48);
  int v8 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_VerticalRestScaleValue, @"_UIKBRT_VerticalRestScaleValue");
  double v9 = *(double *)&qword_1E8FD5000;
  if (v8) {
    double v9 = 0.666666667;
  }
  *(double *)(v2 + 136) = v6;
  *(double *)(v2 + 144) = v7 * v9;
  double v10 = *(double *)(a1 + 48);
  int v11 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference__UIKBRT_MaximumNonRestMovePercent, @"_UIKBRT_MaximumNonRestMovePercent");
  double v12 = *(double *)&qword_1E8FD5020;
  if (v11) {
    double v12 = 0.333333333;
  }
  double result = v10 * v12;
  *(double *)(*(void *)(a1 + 32) + 56) = result;
  return result;
}

uint64_t __45___UIKBRTRecognizer_setDisableHomeRowReturn___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = *(unsigned char *)(result + 40);
  return result;
}

BOOL __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  [a2 originalTimestamp];
  return v2 < v3;
}

uint64_t __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke_2()
{
  return +[_UIKeyboardUsageTracking restAndTypeTriggered];
}

uint64_t __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke_3()
{
  return +[_UIKeyboardUsageTracking restAndTypeTriggered];
}

void __48___UIKBRTRecognizer__doBeginTouchWithTouchInfo___block_invoke_4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained letRulesModifyPendingTouchInfo:v6];
    int v5 = [v6 currentTouchState];
    if ((v5 - 1) < 3)
    {
      [v4 kbStatusMessage:@"Resting touch on %@", v6];
      goto LABEL_6;
    }
    if ((v5 - 6) < 2)
    {
      [v4 kbStatusMessage:@"Rested touch on %@", v6];
      goto LABEL_10;
    }
    if (!v5)
    {
      if ([v4 makeTouchActive:v6])
      {
        [v4 kbStatusMessage:@"Activating touch on %@", v6];
        goto LABEL_10;
      }
      [v4 kbStatusMessage:@"Deactiving beginning touch on %@", v6];
LABEL_6:
      [v4 makeTouchIgnored:v6 force:1];
    }
  }
LABEL_10:
}

uint64_t __58___UIKBRTRecognizer_touchDown_withIdentifier_canLogTouch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doBeginTouchWithTouchInfo:*(void *)(a1 + 40)];
}

uint64_t __49___UIKBRTRecognizer_touchDragged_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doMovedTouchWithTouchInfo:*(void *)(a1 + 40)];
}

uint64_t __48___UIKBRTRecognizer__doEndedTouchWithTouchInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) removeObject:*(void *)(a1 + 40)];
}

uint64_t __44___UIKBRTRecognizer_touchUp_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doEndedTouchWithTouchInfo:*(void *)(a1 + 40)];
}

uint64_t __52___UIKBRTRecognizer__doCancelledTouchWithTouchInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) removeObject:*(void *)(a1 + 40)];
}

uint64_t __51___UIKBRTRecognizer_touchCancelled_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doCancelledTouchWithTouchInfo:*(void *)(a1 + 40)];
}

uint64_t __56___UIKBRTRecognizer__doMarkTouchProcessedWithTouchInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 104) removeObject:*(void *)(a1 + 40)];
}

uint64_t __55___UIKBRTRecognizer_markTouchProcessed_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doMarkTouchProcessedWithTouchInfo:*(void *)(a1 + 40)];
}

uint64_t __58___UIKBRTRecognizer_explicitlyIgnoreTouch_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doIgnoreTouchWithTouchInfo:*(void *)(a1 + 40)];
}

uint64_t __83___UIKBRTRecognizer_updateIgnoredTouchesForTouchInfo_whenTouchInfo_changesStateTo___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    for (uint64_t result = [*(id *)(a1 + 40) currentTouchState];
          result == 3;
    if ((char)result <= 5 && (char)result != 3)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = *(void **)(*(void *)(a1 + 32) + 104);
      return [v4 removeObject:v3];
    }
  }
  return result;
}

uint64_t __42___UIKBRTRecognizer_addedToActiveTouches___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 88) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result ^ 1;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = a1[5];
    int v4 = *(void **)(a1[4] + 88);
    return [v4 addObject:v3];
  }
  return result;
}

uint64_t __46___UIKBRTRecognizer_removedFromActiveTouches___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 88) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v3 = a1[5];
    int v4 = *(void **)(a1[4] + 88);
    return [v4 removeObject:v3];
  }
  return result;
}

void __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) addedToActiveTouches:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 16);
    int v4 = [*(id *)(a1 + 40) touchIdentifier];
    [*(id *)(a1 + 40) originalTouchPoint];
    double v6 = v5;
    double v8 = v7;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke_2;
    v29[3] = &unk_1E52FDBF8;
    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v32 = *(void *)(a1 + 56);
    id v30 = *(id *)(a1 + 40);
    id v31 = *(id *)(a1 + 48);
    objc_msgSend(v3, "recognizer:beginTouchDownForTouchWithId:atPoint:forBeginState:whenStateReady:", v2, v4, v9, v29, v6, v8);

    double v10 = v30;
LABEL_5:

    return;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    double v12 = *(void **)(v11 + 16);
    double v13 = [*(id *)(a1 + 40) touchIdentifier];
    [*(id *)(a1 + 40) originalTimestamp];
    double v15 = v14;
    [*(id *)(a1 + 40) originalTouchPoint];
    double v17 = v16;
    double v19 = v18;
    [*(id *)(a1 + 40) currentTouchPoint];
    double v21 = v20;
    double v23 = v22;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke_3;
    v25[3] = &unk_1E52FDBF8;
    uint64_t v28 = *(void *)(a1 + 56);
    id v26 = *(id *)(a1 + 40);
    id v27 = *(id *)(a1 + 48);
    objc_msgSend(v12, "recognizer:restartTouchDownForTouchWithId:startingAt:atPoint:currentPoint:whenStateReady:", v11, v13, v25, v15, v17, v19, v21, v23);

    double v10 = v26;
    goto LABEL_5;
  }
  if (*(void *)(a1 + 64) == 2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  v24 = *(NSObject **)(a1 + 48);
  dispatch_semaphore_signal(v24);
}

void __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  double v5 = *(void **)(a1 + 32);
  id v8 = a2;
  id v6 = [v5 touchIdentifier];
  if (v6 == v8) {
    char v7 = a3;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __80___UIKBRTRecognizer_queryDelegateToBeginTouch_forBeginState_restartIfNecessary___block_invoke_3(uint64_t a1, void *a2, char a3)
{
  double v5 = *(void **)(a1 + 32);
  id v8 = a2;
  id v6 = [v5 touchIdentifier];
  if (v6 == v8) {
    char v7 = a3;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53___UIKBRTRecognizer_notifyDelegateOfSuccessfulTouch___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  int v4 = [*(id *)(a1 + 40) touchIdentifier];
  [*(id *)(a1 + 40) originalTouchPoint];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 40) currentTouchPoint];
  double v10 = v9;
  double v12 = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53___UIKBRTRecognizer_notifyDelegateOfSuccessfulTouch___block_invoke_2;
  v14[3] = &unk_1E52FDC48;
  double v13 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v13;
  id v16 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:releaseTouchToLayoutWithId:startPoint:endPoint:whenReady:", v2, v4, v14, v6, v8, v10, v12);
}

intptr_t __53___UIKBRTRecognizer_notifyDelegateOfSuccessfulTouch___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removedFromActiveTouches:*(void *)(a1 + 40)];
  uint64_t v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

void __52___UIKBRTRecognizer_notifyDelegateOfCancelledTouch___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  int v4 = [*(id *)(a1 + 40) touchIdentifier];
  [*(id *)(a1 + 40) originalTouchPoint];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 40) currentTouchPoint];
  double v10 = v9;
  double v12 = v11;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52___UIKBRTRecognizer_notifyDelegateOfCancelledTouch___block_invoke_2;
  v14[3] = &unk_1E52FDC48;
  double v13 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v13;
  id v16 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:cancelTouchOnLayoutWithId:startPoint:endPoint:whenReady:", v2, v4, v14, v6, v8, v10, v12);
}

intptr_t __52___UIKBRTRecognizer_notifyDelegateOfCancelledTouch___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removedFromActiveTouches:*(void *)(a1 + 40)];
  uint64_t v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

void __48___UIKBRTRecognizer_notifyDelegateOfMovedTouch___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  int v4 = [*(id *)(a1 + 40) touchIdentifier];
  [*(id *)(a1 + 40) originalTimestamp];
  double v6 = v5;
  [*(id *)(a1 + 40) originalTouchPoint];
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 40) currentTouchPoint];
  double v12 = v11;
  double v14 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48___UIKBRTRecognizer_notifyDelegateOfMovedTouch___block_invoke_2;
  v15[3] = &unk_1E52FDBF8;
  uint64_t v18 = *(void *)(a1 + 56);
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:shouldContinueTrackingTouchWithId:startingAt:atPoint:currentPoint:forContinueState:whenStateReady:", v2, v4, 0, v15, v6, v8, v10, v12, v14);
}

void __48___UIKBRTRecognizer_notifyDelegateOfMovedTouch___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  double v5 = *(void **)(a1 + 32);
  id v8 = a2;
  id v6 = [v5 touchIdentifier];
  if (v6 == v8) {
    char v7 = a3;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55___UIKBRTRecognizer_notifyDelegateOfMovedIgnoredTouch___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  int v4 = [*(id *)(a1 + 40) touchIdentifier];
  [*(id *)(a1 + 40) currentTouchPoint];
  double v6 = v5;
  double v8 = v7;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55___UIKBRTRecognizer_notifyDelegateOfMovedIgnoredTouch___block_invoke_2;
  v9[3] = &unk_1E52FDC70;
  id v10 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:continueTrackingIgnoredTouchWithId:currentPoint:whenReady:", v2, v4, v9, v6, v8);
}

intptr_t __55___UIKBRTRecognizer_notifyDelegateOfMovedIgnoredTouch___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __64___UIKBRTRecognizer_queryDelegateOfIgnoringTouch_forOtherTouch___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  int v4 = [*(id *)(a1 + 40) touchIdentifier];
  [*(id *)(a1 + 40) originalTimestamp];
  double v6 = v5;
  [*(id *)(a1 + 40) originalTouchPoint];
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 40) currentTouchPoint];
  double v12 = v11;
  double v14 = v13;
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 1;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64___UIKBRTRecognizer_queryDelegateOfIgnoringTouch_forOtherTouch___block_invoke_2;
  v16[3] = &unk_1E52FDBF8;
  uint64_t v19 = *(void *)(a1 + 56);
  id v17 = *(id *)(a1 + 40);
  id v18 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:shouldContinueTrackingTouchWithId:startingAt:atPoint:currentPoint:forContinueState:whenStateReady:", v2, v4, v15, v16, v6, v8, v10, v12, v14);
}

void __64___UIKBRTRecognizer_queryDelegateOfIgnoringTouch_forOtherTouch___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  double v5 = *(void **)(a1 + 32);
  id v8 = a2;
  id v6 = [v5 touchIdentifier];
  char v7 = a3 ^ 1;
  if (v6 != v8) {
    char v7 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __51___UIKBRTRecognizer_notifyDelegateOfIgnoringTouch___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  int v4 = [*(id *)(a1 + 40) touchIdentifier];
  [*(id *)(a1 + 40) originalTimestamp];
  double v6 = v5;
  [*(id *)(a1 + 40) originalTouchPoint];
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 40) currentTouchPoint];
  double v12 = v11;
  double v14 = v13;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51___UIKBRTRecognizer_notifyDelegateOfIgnoringTouch___block_invoke_2;
  v15[3] = &unk_1E52FDC70;
  id v16 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:willIgnoreTouchWithId:startingAt:atPoint:currentPoint:whenReady:", v2, v4, v15, v6, v8, v10, v12, v14);
}

intptr_t __51___UIKBRTRecognizer_notifyDelegateOfIgnoringTouch___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54___UIKBRTRecognizer_cancelTouchOnLayoutWithTouchInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  int v4 = [*(id *)(a1 + 40) touchIdentifier];
  [*(id *)(a1 + 40) originalTouchPoint];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 40) currentTouchPoint];
  double v10 = v9;
  double v12 = v11;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54___UIKBRTRecognizer_cancelTouchOnLayoutWithTouchInfo___block_invoke_2;
  v13[3] = &unk_1E52FDC70;
  id v14 = *(id *)(a1 + 48);
  objc_msgSend(v3, "recognizer:cancelTouchOnLayoutWithId:startPoint:endPoint:whenReady:", v2, v4, v13, v6, v8, v10, v12);
}

intptr_t __54___UIKBRTRecognizer_cancelTouchOnLayoutWithTouchInfo___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __37___UIKBRTRecognizer_makeTouchActive___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained queryDelegateOfRestingTouch:v5])
    {
      [v4 notifyDelegateOfRestingTouch:v5];
    }
    else if ([v5 currentTouchState] != 5)
    {
      ++*(void *)(*(void *)(a1 + 32) + 120);
      [v5 setCurrentTouchState:5];
    }
  }
}

uint64_t __56___UIKBRTRecognizer_makeTouchIgnored_force_withMessage___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = *(void **)(*(void *)(a1 + 32) + 104);
    return [v4 addObject:v3];
  }
  return result;
}

@end