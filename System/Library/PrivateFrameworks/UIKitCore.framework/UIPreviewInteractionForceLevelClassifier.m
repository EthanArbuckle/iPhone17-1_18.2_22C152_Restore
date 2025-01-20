@interface UIPreviewInteractionForceLevelClassifier
@end

@implementation UIPreviewInteractionForceLevelClassifier

id __126___UIPreviewInteractionForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__105;
  v14 = __Block_byref_object_dispose__105;
  id v15 = 0;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __126___UIPreviewInteractionForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke_4;
    v9[3] = &unk_1E52F1298;
    v9[4] = WeakRetained;
    v9[5] = &v10;
    v9[6] = *(void *)(a1 + 40);
    [a2 ifObservation:v9 ifReset:0];
    v6 = (void *)v11[5];
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __126___UIPreviewInteractionForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke_4(void *a1)
{
  v2 = *(void **)(a1[4] + 64);
  if (v2)
  {
    v3 = NSNumber;
    if ((unint64_t)(a1[6] - 1) >= 3) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = a1[6];
    }
    [v2 currentProgressToState:v4];
    uint64_t v5 = objc_msgSend(v3, "numberWithDouble:");
    uint64_t v6 = *(void *)(a1[5] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

@end