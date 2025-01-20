@interface SBReversibleLayerPropertyAnimator
- (BOOL)hasReversed;
- (BOOL)hasReversedWithNewSettings;
- (BOOL)hasStarted;
- (BOOL)invalidated;
- (BOOL)isGoingForward;
- (BSAnimationSettings)currentAnimationSettings;
- (CALayer)layer;
- (NSMutableArray)reversalAnimationKeys;
- (NSString)forwardAnimationKey;
- (NSString)forwardOffsetAnimationKey;
- (NSString)keyPath;
- (SBReversibleLayerPropertyAnimator)initWithLayer:(id)a3 keyPath:(id)a4 initialValue:(double)a5 targetValue:(double)a6;
- (double)_inputPercentCompleteForAnimation:(id)a3 outputPercentComplete:(double)a4 precision:(double)a5;
- (double)_outputPercentCompleteForAnimation:(id)a3 inputPercentComplete:(double)a4;
- (double)_percentCompleteForAnimation:(id)a3 time:(double)a4;
- (double)initialValue;
- (double)targetValue;
- (id)_additiveAnimationForKeyPath:(id)a3 withSettings:(id)a4 beginTime:(id)a5 fromRelativeValue:(double)a6 toRelativeValue:(double)a7;
- (id)_animationWithSettings:(id)a3;
- (id)completion;
- (unint64_t)outstandingCAAnimationCompletionCount;
- (unint64_t)reversalCount;
- (void)_animateFromRelativeValue:(double)a3 toRelativeValue:(double)a4 withSettings:(id)a5 beginTime:(id)a6;
- (void)_animateFromValue:(double)a3 toValue:(double)a4 withSettings:(id)a5 beginTime:(id)a6;
- (void)_fireCompletionIfNecessary;
- (void)_reverseWithSettings:(id)a3 directionChangeSettings:(id)a4 headStart:(double)a5;
- (void)animateWithSettings:(id)a3 completion:(id)a4;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)invalidate;
- (void)reverse;
- (void)reverseWithSettings:(id)a3 directionChangeSettings:(id)a4 headStart:(double)a5;
- (void)setCompletion:(id)a3;
- (void)setCurrentAnimationSettings:(id)a3;
- (void)setForwardAnimationKey:(id)a3;
- (void)setForwardOffsetAnimationKey:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setOutstandingCAAnimationCompletionCount:(unint64_t)a3;
- (void)setReversalAnimationKeys:(id)a3;
- (void)setReversalCount:(unint64_t)a3;
- (void)setReversedWithNewSettings:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
@end

@implementation SBReversibleLayerPropertyAnimator

- (SBReversibleLayerPropertyAnimator)initWithLayer:(id)a3 keyPath:(id)a4 initialValue:(double)a5 targetValue:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBReversibleLayerPropertyAnimator;
  v13 = [(SBReversibleLayerPropertyAnimator *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_layer, a3);
    uint64_t v15 = [v12 copy];
    keyPath = v14->_keyPath;
    v14->_keyPath = (NSString *)v15;

    v14->_initialValue = a5;
    v14->_targetValue = a6;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    reversalAnimationKeys = v14->_reversalAnimationKeys;
    v14->_reversalAnimationKeys = v17;

    v14->_invalidated = 0;
  }

  return v14;
}

- (void)invalidate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    v3 = [(SBReversibleLayerPropertyAnimator *)self layer];
    v4 = [(SBReversibleLayerPropertyAnimator *)self forwardAnimationKey];
    if (v4) {
      [v3 removeAnimationForKey:v4];
    }
    v5 = [(SBReversibleLayerPropertyAnimator *)self forwardOffsetAnimationKey];
    if (v5) {
      [v3 removeAnimationForKey:v5];
    }
    v6 = [(SBReversibleLayerPropertyAnimator *)self reversalAnimationKeys];
    if ([v6 count])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v13;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v13 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v3, "removeAnimationForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v9);
      }
    }
    [(SBReversibleLayerPropertyAnimator *)self _fireCompletionIfNecessary];
  }
}

- (void)animateWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (self->_invalidated)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__SBReversibleLayerPropertyAnimator_animateWithSettings_completion___block_invoke;
    block[3] = &unk_1E6AAD4C8;
    id v19 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(SBReversibleLayerPropertyAnimator *)self setStarted:1];
    [(SBReversibleLayerPropertyAnimator *)self setCurrentAnimationSettings:v6];
    [(SBReversibleLayerPropertyAnimator *)self setCompletion:v8];
    [(SBReversibleLayerPropertyAnimator *)self initialValue];
    double v10 = v9;
    [(SBReversibleLayerPropertyAnimator *)self targetValue];
    double v12 = v11;
    long long v13 = [(SBReversibleLayerPropertyAnimator *)self layer];
    long long v14 = [NSNumber numberWithDouble:v12];
    long long v15 = [(SBReversibleLayerPropertyAnimator *)self keyPath];
    [v13 setValue:v14 forKeyPath:v15];

    v16 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.001];
    [(SBReversibleLayerPropertyAnimator *)self _animateFromRelativeValue:v16 toRelativeValue:0 withSettings:v10 - v12 beginTime:v10 - v12];
    uint64_t v17 = [(SBReversibleLayerPropertyAnimator *)self forwardAnimationKey];
    [(SBReversibleLayerPropertyAnimator *)self setForwardOffsetAnimationKey:v17];

    [(SBReversibleLayerPropertyAnimator *)self _animateFromValue:v6 toValue:0 withSettings:v10 beginTime:v12];
  }
}

uint64_t __68__SBReversibleLayerPropertyAnimator_animateWithSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isGoingForward
{
  return ([(SBReversibleLayerPropertyAnimator *)self reversalCount] & 1) == 0;
}

- (BOOL)hasReversed
{
  return [(SBReversibleLayerPropertyAnimator *)self reversalCount] != 0;
}

- (void)reverse
{
  id v3 = [(SBReversibleLayerPropertyAnimator *)self currentAnimationSettings];
  [(SBReversibleLayerPropertyAnimator *)self _reverseWithSettings:v3 directionChangeSettings:0 headStart:0.0];
}

- (void)reverseWithSettings:(id)a3 directionChangeSettings:(id)a4 headStart:(double)a5
{
  [(SBReversibleLayerPropertyAnimator *)self _reverseWithSettings:a3 directionChangeSettings:a4 headStart:a5];
  [(SBReversibleLayerPropertyAnimator *)self setReversedWithNewSettings:1];
}

- (void)_reverseWithSettings:(id)a3 directionChangeSettings:(id)a4 headStart:(double)a5
{
  id v61 = a3;
  id v8 = a4;
  if (!self->_invalidated)
  {
    [(SBReversibleLayerPropertyAnimator *)self setReversalCount:[(SBReversibleLayerPropertyAnimator *)self reversalCount] + 1];
    double v9 = [(SBReversibleLayerPropertyAnimator *)self layer];
    double v10 = [(SBReversibleLayerPropertyAnimator *)self forwardAnimationKey];
    double v11 = [v9 animationForKey:v10];
    double v12 = v11;
    if (v11)
    {
      [v11 beginTime];
      double v14 = v13;
      double v15 = CACurrentMediaTime();
      if (!BSFloatLessThanFloat())
      {
        [v9 removeAnimationForKey:v10];
LABEL_22:

        goto LABEL_23;
      }
      v16 = (void *)[v61 mutableCopy];
      uint64_t v17 = [(SBReversibleLayerPropertyAnimator *)self currentAnimationSettings];
      v18 = (void *)[v17 mutableCopy];

      if ([v16 isEqual:v18])
      {
        [v16 setDelay:0.0];
        if ([(SBReversibleLayerPropertyAnimator *)self isGoingForward])
        {
          [(SBReversibleLayerPropertyAnimator *)self initialValue];
          double v20 = v19;
          [(SBReversibleLayerPropertyAnimator *)self targetValue];
        }
        else
        {
          [(SBReversibleLayerPropertyAnimator *)self targetValue];
          double v20 = v60;
          [(SBReversibleLayerPropertyAnimator *)self initialValue];
        }
        [(SBReversibleLayerPropertyAnimator *)self _animateFromValue:v16 toValue:0 withSettings:v20 beginTime:v21];
      }
      else
      {
        [v18 setDelay:0.0];
        double v24 = -0.0;
        if (!v8) {
          double v24 = a5;
        }
        double v25 = v24 + v14;
        [(SBReversibleLayerPropertyAnimator *)self targetValue];
        double v27 = v26;
        [(SBReversibleLayerPropertyAnimator *)self initialValue];
        double v29 = v28;
        v30 = [NSNumber numberWithDouble:v25];
        [(SBReversibleLayerPropertyAnimator *)self _animateFromValue:v18 toValue:v30 withSettings:v27 beginTime:v29];

        double v31 = (0.08 - (v15 - v14)) / 0.08;
        if (v31 <= 0.0) {
          double v32 = 0.0;
        }
        else {
          double v32 = v31 * 0.04;
        }
        [(SBReversibleLayerPropertyAnimator *)self _percentCompleteForAnimation:v12 time:v15 - v14 + v32];
        double v34 = v33;
        [(SBReversibleLayerPropertyAnimator *)self initialValue];
        double v36 = v35;
        [(SBReversibleLayerPropertyAnimator *)self targetValue];
        double v38 = v37;
        [(SBReversibleLayerPropertyAnimator *)self initialValue];
        double v40 = v36 + v34 * (v38 - v39);
        [(SBReversibleLayerPropertyAnimator *)self initialValue];
        double v42 = v40 - v41;
        v43 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.001];
        [(SBReversibleLayerPropertyAnimator *)self _animateFromRelativeValue:v43 toRelativeValue:0 withSettings:v42 beginTime:v42];
        if (v8 && (BSFloatIsZero() & 1) == 0)
        {
          v44 = [(SBReversibleLayerPropertyAnimator *)self _animationWithSettings:v8];
          [(SBReversibleLayerPropertyAnimator *)self _inputPercentCompleteForAnimation:v44 outputPercentComplete:v34 precision:0.001];
          double v46 = v45;
          [v44 duration];
          double v48 = v15 - v46 * v47;
          [(SBReversibleLayerPropertyAnimator *)self initialValue];
          double v50 = v49;
          [(SBReversibleLayerPropertyAnimator *)self targetValue];
          double v52 = v51;
          v53 = [NSNumber numberWithDouble:v48];
          [(SBReversibleLayerPropertyAnimator *)self _animateFromValue:v8 toValue:v53 withSettings:v50 beginTime:v52];

          [(SBReversibleLayerPropertyAnimator *)self targetValue];
          double v55 = v54;
          [(SBReversibleLayerPropertyAnimator *)self initialValue];
          double v57 = v56;
          v58 = [NSNumber numberWithDouble:v48 + a5];
          [(SBReversibleLayerPropertyAnimator *)self _animateFromValue:v8 toValue:v58 withSettings:v55 beginTime:v57];
        }
        [(SBReversibleLayerPropertyAnimator *)self initialValue];
        [(SBReversibleLayerPropertyAnimator *)self _animateFromValue:v16 toValue:0 withSettings:v40 beginTime:v59];
      }
    }
    else
    {
      v22 = NSNumber;
      [(SBReversibleLayerPropertyAnimator *)self initialValue];
      v16 = objc_msgSend(v22, "numberWithDouble:");
      v23 = [(SBReversibleLayerPropertyAnimator *)self keyPath];
      [v9 setValue:v16 forKeyPath:v23];
    }
    goto LABEL_22;
  }
LABEL_23:
}

- (void)_animateFromValue:(double)a3 toValue:(double)a4 withSettings:(id)a5 beginTime:(id)a6
{
}

- (void)_animateFromRelativeValue:(double)a3 toRelativeValue:(double)a4 withSettings:(id)a5 beginTime:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v19 = [(SBReversibleLayerPropertyAnimator *)self layer];
  double v12 = [(SBReversibleLayerPropertyAnimator *)self keyPath];
  double v13 = [(SBReversibleLayerPropertyAnimator *)self _additiveAnimationForKeyPath:v12 withSettings:v11 beginTime:v10 fromRelativeValue:a3 toRelativeValue:a4];

  double v14 = NSString;
  double v15 = [MEMORY[0x1E4F29128] UUID];
  v16 = [v15 UUIDString];
  uint64_t v17 = [v14 stringWithFormat:@"%@-%@", v12, v16];

  [(SBReversibleLayerPropertyAnimator *)self setOutstandingCAAnimationCompletionCount:[(SBReversibleLayerPropertyAnimator *)self outstandingCAAnimationCompletionCount]+ 1];
  [v13 setDelegate:self];
  [v13 setRemovedOnCompletion:0];
  [v13 setFillMode:*MEMORY[0x1E4F39FA8]];
  if ([(SBReversibleLayerPropertyAnimator *)self hasReversed])
  {
    v18 = [(SBReversibleLayerPropertyAnimator *)self reversalAnimationKeys];
    [v18 addObject:v17];
  }
  else
  {
    [(SBReversibleLayerPropertyAnimator *)self setForwardAnimationKey:v17];
  }
  [v19 addAnimation:v13 forKey:v17];
}

- (id)_additiveAnimationForKeyPath:(id)a3 withSettings:(id)a4 beginTime:(id)a5 fromRelativeValue:(double)a6 toRelativeValue:(double)a7
{
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  double v15 = [(SBReversibleLayerPropertyAnimator *)self _animationWithSettings:v13];
  [v15 setKeyPath:v14];

  [v13 delay];
  double v17 = v16;

  if (v12)
  {
    [v15 setBeginTimeMode:*MEMORY[0x1E4F39D60]];
    [v12 doubleValue];
    double v17 = v17 + v18;
  }
  else
  {
    if (BSFloatIsZero()) {
      goto LABEL_6;
    }
    [v15 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  }
  [v15 setBeginTime:v17];
LABEL_6:
  id v19 = [NSNumber numberWithDouble:a6];
  [v15 setFromValue:v19];

  double v20 = [NSNumber numberWithDouble:a7];
  [v15 setToValue:v20];

  [v15 setAdditive:1];
  return v15;
}

- (id)_animationWithSettings:(id)a3
{
  id v3 = a3;
  if ([v3 isSpringAnimation])
  {
    v4 = [MEMORY[0x1E4F39C90] animation];
    [v3 applyToCAAnimation:v4];
    [v3 epsilon];
    double v6 = v5;

    [v4 durationForEpsilon:v6];
    objc_msgSend(v4, "setDuration:");
  }
  else
  {
    v4 = [MEMORY[0x1E4F39B48] animation];
    [v3 applyToCAAnimation:v4];
  }
  return v4;
}

- (double)_percentCompleteForAnimation:(id)a3 time:(double)a4
{
  id v6 = a3;
  [v6 duration];
  double v8 = v7;
  double v9 = 0.0;
  if (BSFloatGreaterThanFloat())
  {
    double v9 = fmin(fmax(a4 / v8, 0.0), 1.0);
    if ((BSFloatIsOne() & 1) == 0 && (BSFloatIsZero() & 1) == 0)
    {
      [(SBReversibleLayerPropertyAnimator *)self _outputPercentCompleteForAnimation:v6 inputPercentComplete:v9];
      double v9 = v10;
    }
  }

  return v9;
}

- (double)_inputPercentCompleteForAnimation:(id)a3 outputPercentComplete:(double)a4 precision:(double)a5
{
  id v7 = a3;
  double v8 = fmin(fmax(a4, 0.0), 1.0);
  if (BSFloatIsOne() & 1) != 0 || (BSFloatIsZero())
  {
    double v9 = v8;
  }
  else
  {
    double v9 = 0.5;
    [(SBReversibleLayerPropertyAnimator *)self _outputPercentCompleteForAnimation:v7 inputPercentComplete:0.5];
    if (BSFloatGreaterThanFloat())
    {
      double v11 = 0.0;
      double v12 = 1.0;
      uint64_t v13 = 101;
      double v14 = 0.5;
      while (--v13)
      {
        int v15 = BSFloatLessThanFloat();
        if (v15) {
          double v9 = v14 + (v12 - v14) * 0.5;
        }
        else {
          double v9 = v14 + (v14 - v11) * -0.5;
        }
        if (v15) {
          double v11 = v14;
        }
        else {
          double v12 = v14;
        }
        [(SBReversibleLayerPropertyAnimator *)self _outputPercentCompleteForAnimation:v7 inputPercentComplete:v9];
        double v14 = v9;
        if ((BSFloatGreaterThanFloat() & 1) == 0) {
          goto LABEL_4;
        }
      }
      double v9 = v14;
    }
  }
LABEL_4:

  return v9;
}

- (double)_outputPercentCompleteForAnimation:(id)a3 inputPercentComplete:(double)a4
{
  id v5 = a3;
  id v6 = [v5 timingFunction];
  double v8 = v6;
  if (v6)
  {
    *(float *)&double v7 = a4;
    [v6 _solveForInput:v7];
    a4 = v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)&double v10 = a4;
    [v5 _solveForInput:v10];
    a4 = v11;
  }

  return a4;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_invalidated)
  {
    [(SBReversibleLayerPropertyAnimator *)self setOutstandingCAAnimationCompletionCount:[(SBReversibleLayerPropertyAnimator *)self outstandingCAAnimationCompletionCount]- 1];
    if (![(SBReversibleLayerPropertyAnimator *)self outstandingCAAnimationCompletionCount])
    {
      id v6 = SBLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        double v7 = [(SBReversibleLayerPropertyAnimator *)self layer];
        double v8 = [v7 animationKeys];
        *(_DWORD *)buf = 138412802;
        id v27 = v5;
        __int16 v28 = 2112;
        double v29 = self;
        __int16 v30 = 2112;
        double v31 = v8;
        _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "animation completed [%@]: %@, layer: %@", buf, 0x20u);
      }
      float v9 = [(SBReversibleLayerPropertyAnimator *)self layer];
      double v10 = [(SBReversibleLayerPropertyAnimator *)self forwardAnimationKey];
      if (v10) {
        [v9 removeAnimationForKey:v10];
      }
      float v11 = [(SBReversibleLayerPropertyAnimator *)self forwardOffsetAnimationKey];
      if (v11) {
        [v9 removeAnimationForKey:v11];
      }
      if (![(SBReversibleLayerPropertyAnimator *)self isGoingForward])
      {
        double v12 = NSNumber;
        [(SBReversibleLayerPropertyAnimator *)self initialValue];
        uint64_t v13 = objc_msgSend(v12, "numberWithDouble:");
        double v14 = [(SBReversibleLayerPropertyAnimator *)self keyPath];
        [v9 setValue:v13 forKeyPath:v14];
      }
      int v15 = [(SBReversibleLayerPropertyAnimator *)self reversalAnimationKeys];
      if ([v15 count])
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v22 != v19) {
                objc_enumerationMutation(v16);
              }
              objc_msgSend(v9, "removeAnimationForKey:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v18);
        }
      }
      [(SBReversibleLayerPropertyAnimator *)self _fireCompletionIfNecessary];
    }
  }
}

- (void)_fireCompletionIfNecessary
{
  id v3 = [(SBReversibleLayerPropertyAnimator *)self completion];
  if (v3)
  {
    [(SBReversibleLayerPropertyAnimator *)self setCompletion:0];
    v3[2](v3, [(SBReversibleLayerPropertyAnimator *)self isGoingForward]);
  }
}

- (CALayer)layer
{
  return self->_layer;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (double)initialValue
{
  return self->_initialValue;
}

- (double)targetValue
{
  return self->_targetValue;
}

- (BOOL)hasStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (BSAnimationSettings)currentAnimationSettings
{
  return self->_currentAnimationSettings;
}

- (void)setCurrentAnimationSettings:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (unint64_t)reversalCount
{
  return self->_reversalCount;
}

- (void)setReversalCount:(unint64_t)a3
{
  self->_reversalCount = a3;
}

- (BOOL)hasReversedWithNewSettings
{
  return self->_reversedWithNewSettings;
}

- (void)setReversedWithNewSettings:(BOOL)a3
{
  self->_reversedWithNewSettings = a3;
}

- (unint64_t)outstandingCAAnimationCompletionCount
{
  return self->_outstandingCAAnimationCompletionCount;
}

- (void)setOutstandingCAAnimationCompletionCount:(unint64_t)a3
{
  self->_outstandingCAAnimationCompletionCount = a3;
}

- (NSString)forwardAnimationKey
{
  return self->_forwardAnimationKey;
}

- (void)setForwardAnimationKey:(id)a3
{
}

- (NSString)forwardOffsetAnimationKey
{
  return self->_forwardOffsetAnimationKey;
}

- (void)setForwardOffsetAnimationKey:(id)a3
{
}

- (NSMutableArray)reversalAnimationKeys
{
  return self->_reversalAnimationKeys;
}

- (void)setReversalAnimationKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reversalAnimationKeys, 0);
  objc_storeStrong((id *)&self->_forwardOffsetAnimationKey, 0);
  objc_storeStrong((id *)&self->_forwardAnimationKey, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_currentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end