@interface UILinearForceLevelClassifier
@end

@implementation UILinearForceLevelClassifier

id __114___UILinearForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__104;
  v15 = __Block_byref_object_dispose__104;
  id v16 = 0;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __114___UILinearForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke_13;
    v9[3] = &unk_1E52F1230;
    v9[4] = WeakRetained;
    v9[5] = &v11;
    long long v10 = *(_OWORD *)(a1 + 40);
    [a2 ifObservation:v9 ifReset:0];
    v6 = (void *)v12[5];
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __114___UILinearForceLevelClassifier_transformerFromTouchForceMessageToProgressToForceLevel_minimumRequiredForceLevel___block_invoke_13(void *a1, void *a2)
{
  v3 = NSNumber;
  v4 = (void *)a1[4];
  [a2 touchForce];
  objc_msgSend(v4, "_calculateProgressOfTouchForceValue:toForceLevel:minimumRequiredForceLevel:", a1[6], a1[7]);
  uint64_t v5 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v6 = *(void *)(a1[5] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end