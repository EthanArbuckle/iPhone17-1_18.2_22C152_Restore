@interface UIViewKeyframeAnimationState
- (BOOL)_isKeyframeAnimation;
- (UIViewKeyframeAnimationState)init;
- (id)_createDeferredAnimationForKey:(id)a3 ignoringKeyFrames:(BOOL)a4;
- (id)_updateAnimationFrameWithAnimationProperties:(id)a3;
- (id)animationForLayer:(id)a3 forKey:(id)a4 forView:(id)a5;
- (void)addKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5;
- (void)cleanupTrackedLayers;
- (void)pop;
- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10;
@end

@implementation UIViewKeyframeAnimationState

- (UIViewKeyframeAnimationState)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIViewKeyframeAnimationState;
  v2 = [(UIViewAnimationState *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    keyframeLayers = v2->_keyframeLayers;
    v2->_keyframeLayers = v3;
  }
  return v2;
}

- (BOOL)_isKeyframeAnimation
{
  return 1;
}

- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10
{
  v12.receiver = self;
  v12.super_class = (Class)UIViewKeyframeAnimationState;
  [(UIViewAnimationState *)&v12 setupWithDuration:a5 delay:a6 view:a7 options:a8 factory:a9 parentState:a10 start:a3 completion:a4];
  self->_calculationMode = (a6 >> 10) & 7;
}

- (id)animationForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_inFrame)
  {
    v11 = 0;
    if (v8 && v9)
    {
      objc_getAssociatedObject(v8, &_UITrackedKeyframeActionsForLayerKey);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        objc_setAssociatedObject(v8, &_UITrackedKeyframeActionsForLayerKey, v12, (void *)1);
      }
      v13 = [v12 objectForKeyedSubscript:v9];
      if (!v13)
      {
        v13 = objc_alloc_init(_UIViewDeferredKeyframeAnimation);
        [(_UIViewDeferredAnimation *)v13 setKey:v9];
        [(_UIViewDeferredAnimation *)v13 setDuration:self->super._duration];
        v14 = [v10 _initialValueForLayer:v8 keyPath:v9 usePresentationValue:(*((unsigned __int8 *)&self->super + 172) >> 1) & 1];
        [(_UIViewDeferredAnimation *)v13 setInitialValue:v14];

        [(_UIViewDeferredAnimation *)v13 setRepeatCount:self->super._repeatCount];
        [(_UIViewDeferredAnimation *)v13 setAutoreverses:(*((unsigned __int8 *)&self->super + 172) >> 3) & 1];
        [v12 setObject:v13 forKeyedSubscript:v9];
      }
      [(NSMutableSet *)self->_keyframeLayers addObject:v8];
      id v15 = [(NSMutableDictionary *)self->_keyframeLayersForCurrentKeyFrameDict objectForKeyedSubscript:v9];
      if (!v15)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        [(NSMutableDictionary *)self->_keyframeLayersForCurrentKeyFrameDict setObject:v15 forKeyedSubscript:v9];
      }
      [v15 addObject:v8];

      v11 = 0;
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIViewKeyframeAnimationState;
    v11 = [(UIViewAnimationState *)&v17 animationForLayer:v8 forKey:v9 forView:v10];
  }

  return v11;
}

- (void)addKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5
{
  v13 = (void (**)(void))a5;
  if (self->_inFrame)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIView.m" lineNumber:2769 description:@"calls to +[UIView addKeyframeWithStartTime:duration:animations:] cannot be nested within a single keyframe animation"];
  }
  self->_inFrame = 1;
  self->_frameStartTime = a3;
  self->_frameDuration = a4;
  id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  keyframeLayersForCurrentKeyFrameDict = self->_keyframeLayersForCurrentKeyFrameDict;
  self->_keyframeLayersForCurrentKeyFrameDict = v9;

  v13[2]();
  [(NSMutableDictionary *)self->_keyframeLayersForCurrentKeyFrameDict enumerateKeysAndObjectsUsingBlock:&__block_literal_global_497_0];
  v11 = self->_keyframeLayersForCurrentKeyFrameDict;
  self->_keyframeLayersForCurrentKeyFrameDict = 0;

  self->_inFrame = 0;
}

void __93__UIViewKeyframeAnimationState_addKeyframeWithRelativeStartTime_relativeDuration_animations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    id v9 = &_UITrackedKeyframeActionsForLayerKey;
    id v10 = @"backgroundColor";
    do
    {
      uint64_t v11 = 0;
      uint64_t v21 = v7;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        v13 = objc_getAssociatedObject(v12, v9);
        v14 = [v13 objectForKeyedSubscript:v4];
        id v15 = [v12 valueForKeyPath:v4];
        if (!v15)
        {
          if ([(__CFString *)v10 isEqualToString:v4])
          {
            +[UIColor clearColor];
            uint64_t v16 = v8;
            objc_super v17 = v9;
            id v18 = v5;
            v19 = v10;
            id v20 = objc_claimAutoreleasedReturnValue();
            id v15 = [v20 CGColor];

            id v10 = v19;
            id v5 = v18;
            id v9 = v17;
            uint64_t v8 = v16;
            uint64_t v7 = v21;
          }
          else
          {
            id v15 = [MEMORY[0x1E4F39BE8] defaultValueForKey:v4];
          }
        }
        [v14 addAnimationFrameForValue:v15];

        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }
}

- (id)_createDeferredAnimationForKey:(id)a3 ignoringKeyFrames:(BOOL)a4
{
  if (self->_inFrame && !a4)
  {
    id v5 = objc_alloc_init(_UIViewDeferredKeyframeAnimation);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewKeyframeAnimationState;
    id v5 = [(UIViewAnimationState *)&v7 _createDeferredAnimationForKey:a3 ignoringKeyFrames:a4];
  }
  return v5;
}

- (id)_updateAnimationFrameWithAnimationProperties:(id)a3
{
  id v4 = (_UIViewAnimationFrame *)a3;
  if (!v4) {
    id v4 = objc_alloc_init(_UIViewAnimationFrame);
  }
  [(_UIViewAnimationFrame *)v4 setStartTime:self->_frameStartTime];
  [(_UIViewAnimationFrame *)v4 setDuration:self->_frameDuration];
  return v4;
}

- (void)pop
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)UIViewKeyframeAnimationState;
  [(UIViewAnimationState *)&v22 pop];
  unint64_t v3 = self->_calculationMode - 1;
  if (v3 > 3) {
    id v4 = (id *)MEMORY[0x1E4F39D80];
  }
  else {
    id v4 = (id *)qword_1E53101C0[v3];
  }
  id v5 = *v4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_keyframeLayers;
  uint64_t v6 = [(NSMutableSet *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = objc_getAssociatedObject(v10, &_UITrackedKeyframeActionsForLayerKey);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __35__UIViewKeyframeAnimationState_pop__block_invoke;
        v14[3] = &unk_1E530FC28;
        id v15 = v5;
        uint64_t v16 = self;
        objc_super v17 = v10;
        [v11 enumerateKeysAndObjectsUsingBlock:v14];
      }
      uint64_t v7 = [(NSMutableSet *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v7);
  }

  [(UIViewKeyframeAnimationState *)self cleanupTrackedLayers];
  keyframeLayers = self->_keyframeLayers;
  self->_keyframeLayers = 0;
}

void __35__UIViewKeyframeAnimationState_pop__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 _finalize];
  if (([v6 isEmpty] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:v5];
    [v6 repeatCount];
    double v9 = v8;
    uint64_t v10 = [v6 autoreverses];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __35__UIViewKeyframeAnimationState_pop__block_invoke_2;
    v18[3] = &unk_1E52D9F70;
    id v11 = v7;
    id v19 = v11;
    +[UIView modifyAnimationsWithRepeatCount:v10 autoreverses:v18 animations:v9];
    [v11 setCalculationMode:*(void *)(a1 + 32)];
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v14 = *(double *)(*(void *)(a1 + 40) + 56);
    if (v14 == 0.0)
    {
      id v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "unsafeUnretainedDelegate"), "_screen");
      [v15 _refreshRate];
      double v14 = v16;

      if (v14 == 0.0) {
        double v14 = 0.0166666667;
      }
    }
    [v6 calculateFrameValues:v12 frameTimes:v13 withFrameInterval:0 valueTransformer:v14];
    [v11 setValues:v12];
    [v11 setKeyTimes:v13];
    if (+[UIView _shouldTrackActionWithAnimator:v11]) {
      id v17 = +[UIViewPropertyAnimator _trackNonAdditiveAnimationWithAnimator:v11 forLayer:*(void *)(a1 + 48) forKey:v5];
    }
    [*(id *)(a1 + 48) addAnimation:v11 forKey:v5];
    if ([*(id *)(a1 + 40) _isTrackingEnabled]) {
      [*(id *)(a1 + 40) _trackAnimation:v11 withAnimationKey:v5 forKeyPath:v5 inLayer:*(void *)(a1 + 48)];
    }
  }
}

uint64_t __35__UIViewKeyframeAnimationState_pop__block_invoke_2(uint64_t a1)
{
  return +[UIView _setAnimationAttributes:*(void *)(a1 + 32)];
}

- (void)cleanupTrackedLayers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_keyframeLayers;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_setAssociatedObject(*(id *)(*((void *)&v7 + 1) + 8 * v6++), &_UITrackedKeyframeActionsForLayerKey, 0, (void *)1);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyframeLayersForCurrentKeyFrameDict, 0);
  objc_storeStrong((id *)&self->_keyframeLayers, 0);
}

@end