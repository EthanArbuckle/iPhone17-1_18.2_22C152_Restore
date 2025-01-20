@interface UIAnimator
+ (id)sharedAnimator;
+ (void)disableAnimation;
+ (void)enableAnimation;
- (BOOL)_isRunningAnimation:(id)a3;
- (UIAnimator)init;
- (void)_addAnimation:(id)a3 withDuration:(double)a4 start:(BOOL)a5 startTime:(double)a6;
- (void)_advanceAnimationsOnScreenWithIdentifier:(id)a3 withTimestamp:(double)a4;
- (void)_startAnimation:(id)a3 withStartTime:(double)a4;
- (void)addAnimation:(id)a3 withDuration:(double)a4 start:(BOOL)a5;
- (void)addAnimations:(id)a3 withDuration:(double)a4 start:(BOOL)a5;
- (void)dealloc;
- (void)removeAnimationsForTarget:(id)a3;
- (void)removeAnimationsForTarget:(id)a3 ofKind:(Class)a4;
- (void)startAnimation:(id)a3;
- (void)stopAnimation:(id)a3;
@end

@implementation UIAnimator

- (void)removeAnimationsForTarget:(id)a3 ofKind:(Class)a4
{
  id v6 = a3;
  animations = self->_animations;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__UIAnimator_removeAnimationsForTarget_ofKind___block_invoke;
  v12[3] = &unk_1E52DC498;
  id v13 = v6;
  Class v14 = a4;
  id v8 = v6;
  v9 = [(NSMutableArray *)animations indexesOfObjectsPassingTest:v12];
  v10 = [(NSMutableArray *)animations objectsAtIndexes:v9];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__UIAnimator_removeAnimationsForTarget_ofKind___block_invoke_2;
  v11[3] = &unk_1E52DC4C0;
  v11[4] = self;
  [v10 enumerateObjectsWithOptions:2 usingBlock:v11];
}

+ (id)sharedAnimator
{
  v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];

  v4 = [v3 objectForKey:@"sharedAnimator"];
  if (!v4)
  {
    v4 = objc_alloc_init(UIAnimator);
    if (v4) {
      [v3 setObject:v4 forKey:@"sharedAnimator"];
    }
  }

  return v4;
}

- (UIAnimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIAnimator;
  v2 = [(UIAnimator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    animatorScreenLinks = v2->_animatorScreenLinks;
    v2->_animatorScreenLinks = v3;
  }
  return v2;
}

+ (void)disableAnimation
{
  __animatorEnabled = 1;
}

+ (void)enableAnimation
{
  __animatorEnabled = 0;
}

- (void)dealloc
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = self->_animations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        [(UIAnimator *)self stopAnimation:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [(NSMutableDictionary *)self->_animatorScreenLinks allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * j);
        Class v14 = [(NSMutableDictionary *)self->_animatorScreenLinks objectForKeyedSubscript:v13];
        [v14 invalidate];

        [(NSMutableDictionary *)self->_animatorScreenLinks removeObjectForKey:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }

  v15.receiver = self;
  v15.super_class = (Class)UIAnimator;
  [(UIAnimator *)&v15 dealloc];
}

- (void)addAnimation:(id)a3 withDuration:(double)a4 start:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  double v8 = 0.0;
  if (v5) {
    double v8 = CACurrentMediaTime();
  }
  [(UIAnimator *)self _addAnimation:v9 withDuration:v5 start:a4 startTime:v8];
}

- (void)addAnimations:(id)a3 withDuration:(double)a4 start:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = 0.0;
  id v15 = v8;
  if (v5)
  {
    CFTimeInterval v10 = CACurrentMediaTime();
    id v8 = v15;
    double v9 = v10;
  }
  int v11 = [v8 count];
  if (v11 >= 1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = v11;
    do
    {
      Class v14 = [v15 objectAtIndex:v12];
      [(UIAnimator *)self _addAnimation:v14 withDuration:v5 start:a4 startTime:v9];

      ++v12;
    }
    while (v13 != v12);
  }
}

- (void)removeAnimationsForTarget:(id)a3
{
  id v4 = a3;
  [(UIAnimator *)self removeAnimationsForTarget:v4 ofKind:objc_opt_class()];
}

uint64_t __47__UIAnimator_removeAnimationsForTarget_ofKind___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 target];
  if (v4 == *(void **)(a1 + 32)) {
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

void __47__UIAnimator_removeAnimationsForTarget_ofKind___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "containsObject:")) {
    [*(id *)(a1 + 32) stopAnimation:v3];
  }
}

- (void)startAnimation:(id)a3
{
  id v4 = a3;
  [(UIAnimator *)self _startAnimation:v4 withStartTime:CACurrentMediaTime()];
}

- (void)stopAnimation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 _screenIdentifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_animatorScreenLinks objectForKeyedSubscript:v5];
  [v4 fractionForTime:CACurrentMediaTime()];
  int v8 = v7;
  if ([v4 state] == 1) {
    objc_msgSend(v6, "setAnimationCount:", (unsigned __int16)(objc_msgSend(v6, "animationCount") - 1));
  }
  [v4 markStop];
  if (v6 && ![v6 animationCount])
  {
    [v6 invalidate];
    [(NSMutableDictionary *)self->_animatorScreenLinks removeObjectForKey:v5];
  }
  id v15 = v4;
  [(NSMutableArray *)self->_animations removeObject:v15];
  uint64_t v9 = [v15 completion];
  CFTimeInterval v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
    [v15 setCompletion:0];
  }
  int v11 = [v15 delegate];
  if (v11)
  {
    uint64_t v12 = [v15 action];
    if (v12)
    {
      uint64_t v13 = (const char *)v12;
      if (dyld_program_sdk_at_least()) {
        objc_msgSend(v11, v13, v15);
      }
      else {
        objc_msgSend(v11, sel_performSelector_withObject_, v13, v15);
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      LODWORD(v14) = v8;
      [v11 animator:self stopAnimation:v15 fraction:v14];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v11 animator:self stopAnimation:v15];
    }
  }
}

- (void)_addAnimation:(id)a3 withDuration:(double)a4 start:(BOOL)a5 startTime:(double)a6
{
  BOOL v7 = a5;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([v10 state] == 1)
  {
    int v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Animation", &_addAnimation_withDuration_start_startTime____s_category)+ 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Attempted to add running animation: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    [v10 setDuration:UIAnimationDragCoefficient() * a4];
    animations = self->_animations;
    if (!animations)
    {
      uint64_t v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v14 = self->_animations;
      self->_animations = v13;

      animations = self->_animations;
    }
    [(NSMutableArray *)animations addObject:v10];
    if (v7) {
      [(UIAnimator *)self _startAnimation:v10 withStartTime:a6];
    }
  }
}

- (void)_startAnimation:(id)a3 withStartTime:(double)a4
{
  id v6 = a3;
  if ([v6 state] != 1)
  {
    BOOL v7 = [v6 _screenIdentifier];
    int v8 = [(NSMutableDictionary *)self->_animatorScreenLinks objectForKeyedSubscript:v7];

    if (v8)
    {
      uint64_t v9 = [(NSMutableDictionary *)self->_animatorScreenLinks objectForKeyedSubscript:v7];
      objc_msgSend(v9, "setAnimationCount:", (unsigned __int16)(objc_msgSend(v9, "animationCount") + 1));
    }
    else
    {
      id v10 = [v6 _screen];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __44__UIAnimator__startAnimation_withStartTime___block_invoke;
      long long v18 = &unk_1E52DC4E8;
      long long v19 = self;
      id v11 = v7;
      id v20 = v11;
      uint64_t v12 = +[UIAnimatorScreenLink startTimerWithScreen:v10 action:&v15];

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_animatorScreenLinks, "setObject:forKeyedSubscript:", v12, v11, v15, v16, v17, v18, v19);
    }
    [v6 markStart:a4];
    self->_lastUpdateTime = a4;
    uint64_t v13 = [v6 delegate];
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v13 animator:self startAnimation:v6];
    }
    if (__animatorEnabled == 1)
    {
      LODWORD(v14) = 1.0;
      [v6 setProgress:v14];
      [(UIAnimator *)self stopAnimation:v6];
    }
  }
}

uint64_t __44__UIAnimator__startAnimation_withStartTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_advanceAnimationsOnScreenWithIdentifier:withTimestamp:", *(void *)(a1 + 40));
}

- (void)_advanceAnimationsOnScreenWithIdentifier:(id)a3 withTimestamp:(double)a4
{
  id v13 = a3;
  id v6 = (void *)[(NSMutableArray *)self->_animations copy];
  int v7 = [v6 count];
  if (v7 >= 1)
  {
    unint64_t v8 = v7 + 1;
    do
    {
      uint64_t v9 = [v6 objectAtIndex:(v8 - 2)];
      if ([v9 state] == 1)
      {
        id v10 = [v9 _screenIdentifier];

        if (v10 == v13)
        {
          [v9 fractionForTime:a4];
          float v12 = v11;
          objc_msgSend(v9, "progressForFraction:");
          objc_msgSend(v9, "setProgress:");
          if (v12 == 1.0) {
            [(UIAnimator *)self stopAnimation:v9];
          }
        }
      }

      --v8;
    }
    while (v8 > 1);
  }
  self->_lastUpdateTime = a4;
}

- (BOOL)_isRunningAnimation:(id)a3
{
  return [(NSMutableArray *)self->_animations containsObject:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatorScreenLinks, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end