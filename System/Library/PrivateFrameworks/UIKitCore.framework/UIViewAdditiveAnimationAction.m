@interface UIViewAdditiveAnimationAction
@end

@implementation UIViewAdditiveAnimationAction

void __67___UIViewAdditiveAnimationAction_runActionForKey_object_arguments___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v36 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v36 fromValue];
  if (v7)
  {
    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v16 = *(void **)(a1 + 32);
  v17 = [v36 keyPath];
  id v7 = [v16 valueForKeyPath:v17];

  if (!v8)
  {
LABEL_3:
    v10 = [*(id *)(a1 + 40) animationObject];
    [v10 _setOriginalToValue:v7 forKey:*(void *)(a1 + 48) inLayer:*(void *)(a1 + 32)];
  }
LABEL_4:
  v11 = [v36 fromValue];
  uint64_t v12 = objc_msgSend(v11, "CA_addValue:multipliedBy:", v7, 0xFFFFFFFFLL);

  [v36 setAdditive:1];
  v35 = (void *)v12;
  [v36 setFromValue:v12];
  v13 = objc_msgSend(v7, "CA_addValue:multipliedBy:", v7, 0xFFFFFFFFLL);
  [v36 setToValue:v13];

  v14 = [*(id *)(a1 + 40) animationObject];

  if (v14)
  {
    v15 = 0;
  }
  else
  {
    v18 = objc_getAssociatedObject(*(id *)(a1 + 32), &unk_1EB25C099);
    v15 = [v18 objectForKeyedSubscript:*(void *)(a1 + 48)];
    if (!v15)
    {
      v15 = [MEMORY[0x1E4F39B48] animationWithKeyPath:*(void *)(a1 + 48)];
      [v15 setFromValue:v9];
      [v18 setObject:v15 forKeyedSubscript:*(void *)(a1 + 48)];
    }
    [v15 setToValue:v7];
  }
  v19 = *(void **)(a1 + 32);
  v20 = [v36 keyPath];
  v21 = UniqueAnimationKeyForLayer(v19, v20, v8);

  v22 = [v36 keyPath];

  if (v8 && v21 == v22)
  {
    v23 = (void *)v9;
    v24 = [v36 keyPath];
    uint64_t v25 = [v24 stringByAppendingString:v8];

    v21 = (void *)v25;
  }
  else
  {
    v23 = (void *)v9;
  }
  uint64_t v26 = [*(id *)(a1 + 40) animationObject];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = +[UIView _currentViewAnimationState];
    int v29 = [v28 _isTrackingEnabled];

    if (v29) {
      [v36 setRemovedOnCompletion:0];
    }
  }
  id v30 = *(id *)(a1 + 32);
  if (+[UIView _shouldTrackActionWithAnimator:v36])
  {
    v31 = [v36 keyPath];
    v32 = +[UIViewPropertyAnimator _trackAdditiveAnimationWithAnimator:v36 nonAdditiveAnimation:v15 withAnimationKey:v21 forKeyPath:v31 forLayer:v30];

    [v32 _setOriginalToValue:v7 forKey:*(void *)(a1 + 48) inLayer:v30];
  }
  [v30 addAnimation:v36 forKey:v21];
  if (+[UIView _isAnimationTracking])
  {
    v33 = (void *)__currentViewAnimationState;
    v34 = [v36 keyPath];
    [v33 _trackAnimation:v36 nonAdditiveAnimation:v15 withAnimationKey:v21 forKeyPath:v34 inLayer:v30];
  }
}

void __67___UIViewAdditiveAnimationAction_runActionForKey_object_arguments___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 keyPath];
  id v16 = [v3 valueForKeyPath:v5];

  v6 = [*(id *)(a1 + 40) animationObject];
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 40) view];
  uint64_t v9 = [v6 _explicitAnimationUpdateForProperty:v7 forView:v8 withValue:v16];

  if (!v9)
  {
    v10 = [*(id *)(a1 + 40) animationObject];
    uint64_t v9 = (void *)[v10 _newAnimationUpdateForProperty:*(void *)(a1 + 48) implicit:1 additive:*(unsigned __int8 *)(a1 + 56)];
  }
  v11 = [v4 fromValue];
  [v9 setFromValue:v11];

  [v9 setToValue:v16];
  [v4 duration];
  double v13 = v12;

  [v9 setDuration:v13];
  [*(id *)(a1 + 32) convertTime:0 fromLayer:CACurrentMediaTime()];
  objc_msgSend(v9, "setStartTime:");
  v14 = [*(id *)(a1 + 40) animationObject];
  v15 = [*(id *)(a1 + 40) view];
  [v14 _notePropertyAnimationUpdate:v9 forView:v15];
}

@end