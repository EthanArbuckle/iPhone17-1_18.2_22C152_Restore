@interface _UITouchForceObservable
- (BOOL)_shouldFilterDueToSystemGesturesForTouches:(id)a3;
- (_UITouchForceObservable)init;
- (_UITouchForceObservable)initWithView:(id)a3;
- (double)_maximumPossibleForceForTouches:(id)a3;
- (double)_timestampForTouches:(id)a3;
- (double)_unclampedTouchForceForTouches:(id)a3;
- (id)_touchForceMessageForTouches:(id)a3;
- (id)addObserver:(id)a3;
- (void)_cancelContinuousEvaluation;
- (void)_didEndHavingAnyObservers;
- (void)_updateForContinuousEvaluation:(id)a3;
- (void)_willBeginHavingAnyObservers;
- (void)dealloc;
- (void)receiveObservedValue:(id)a3;
- (void)removeObservation:(id)a3;
@end

@implementation _UITouchForceObservable

- (_UITouchForceObservable)init
{
  return [(_UITouchForceObservable *)self initWithView:0];
}

- (_UITouchForceObservable)initWithView:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UITouchForceObservable;
  v5 = [(_UITouchForceObservable *)&v16 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_view, v4);
    if (v4)
    {
      v7 = objc_alloc_init(_UITouchesObservingGestureRecognizer);
      gestureRecognizer = v6->_gestureRecognizer;
      v6->_gestureRecognizer = v7;

      objc_initWeak(&location, v6);
      v9 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v6->_gestureRecognizer path:"touches"];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __40___UITouchForceObservable_initWithView___block_invoke;
      v13[3] = &unk_1E5301E00;
      objc_copyWeak(&v14, &location);
      uint64_t v10 = [v9 addObserverBlock:v13];
      touchesObservation = v6->_touchesObservation;
      v6->_touchesObservation = (NSObservation *)v10;

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

- (void)dealloc
{
  gestureRecognizer = self->_gestureRecognizer;
  if (gestureRecognizer)
  {
    id v4 = [(UIGestureRecognizer *)gestureRecognizer view];
    [v4 removeGestureRecognizer:self->_gestureRecognizer];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UITouchForceObservable;
  [(NSObservationSource *)&v5 dealloc];
}

- (void)receiveObservedValue:(id)a3
{
  id v4 = a3;
  self->_lastObservationTime = CACurrentMediaTime();
  if (self->_currentTouches && ![v4 count])
  {
    currentTouches = self->_currentTouches;
    self->_currentTouches = 0;

    [(_UITouchForceObservable *)self _cancelContinuousEvaluation];
    uint64_t v10 = +[_UITouchForceMessage reset];
    -[_UITouchForceObservable receiveObservedValue:](&v13, sel_receiveObservedValue_, v10, v12.receiver, v12.super_class, self, _UITouchForceObservable);
LABEL_8:

    goto LABEL_9;
  }
  if ([v4 count])
  {
    if (!self->_currentTouches)
    {
      [(_UITouchForceObservable *)self _cancelContinuousEvaluation];
      objc_super v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__updateForContinuousEvaluation_];
      [(CADisplayLink *)v5 setPreferredFramesPerSecond:60];
      v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];

      continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
      self->_continuousEvaluationDisplayLink = v5;
    }
    v8 = (NSSet *)[v4 copy];
    v9 = self->_currentTouches;
    self->_currentTouches = v8;

    uint64_t v10 = [(_UITouchForceObservable *)self _touchForceMessageForTouches:v4];
    -[_UITouchForceObservable receiveObservedValue:](&v12, sel_receiveObservedValue_, v10, self, _UITouchForceObservable, v13.receiver, v13.super_class);
    goto LABEL_8;
  }
LABEL_9:
}

- (double)_unclampedTouchForceForTouches:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UITouchForceObservable.m", 87, @"Invalid parameter not satisfying: %@", @"[touches count] > 0" object file lineNumber description];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        double v10 = v10 + -[UITouch _unclampedForce](*(void **)(*((void *)&v15 + 1) + 8 * i));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  unint64_t v12 = [v6 count];
  return v10 / (double)v12;
}

- (double)_timestampForTouches:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UITouchForceObservable.m", 100, @"Invalid parameter not satisfying: %@", @"[touches count] > 0" object file lineNumber description];
  }
  id v6 = [v5 anyObject];
  [v6 timestamp];
  double v8 = v7;

  if ((unint64_t)[v5 count] >= 2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v13) timestamp];
          double v8 = fmax(v14, v8);
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (double)_maximumPossibleForceForTouches:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UITouchForceObservable.m", 113, @"Invalid parameter not satisfying: %@", @"[touches count] > 0" object file lineNumber description];
  }
  id v6 = [v5 anyObject];
  [v6 maximumPossibleForce];
  double v8 = v7;

  return v8;
}

- (BOOL)_shouldFilterDueToSystemGesturesForTouches:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (-[UITouch _mightBeConsideredForForceSystemGesture](*(void **)(*((void *)&v8 + 1) + 8 * i)))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)addObserver:(id)a3
{
  id v4 = a3;
  int64_t observerCount = self->_observerCount;
  self->_int64_t observerCount = observerCount + 1;
  if (!observerCount) {
    [(_UITouchForceObservable *)self _willBeginHavingAnyObservers];
  }
  v8.receiver = self;
  v8.super_class = (Class)_UITouchForceObservable;
  id v6 = [(_UITouchForceObservable *)&v8 addObserver:v4];

  return v6;
}

- (void)removeObservation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITouchForceObservable;
  [(_UITouchForceObservable *)&v5 removeObservation:a3];
  int64_t v4 = self->_observerCount - 1;
  self->_int64_t observerCount = v4;
  if (!v4) {
    [(_UITouchForceObservable *)self _didEndHavingAnyObservers];
  }
}

- (void)_willBeginHavingAnyObservers
{
  if (self->_gestureRecognizer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained addGestureRecognizer:self->_gestureRecognizer];
  }
}

- (void)_didEndHavingAnyObservers
{
  if (self->_gestureRecognizer)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained removeGestureRecognizer:self->_gestureRecognizer];
  }
}

- (id)_touchForceMessageForTouches:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56___UITouchForceObservable__touchForceMessageForTouches___block_invoke;
  v8[3] = &unk_1E5302040;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = +[_UITouchForceMessage observe:v8];

  return v6;
}

- (void)_updateForContinuousEvaluation:(id)a3
{
  if (CACurrentMediaTime() - self->_lastObservationTime > 0.0133333333)
  {
    currentTouches = self->_currentTouches;
    [(_UITouchForceObservable *)self receiveObservedValue:currentTouches];
  }
}

- (void)_cancelContinuousEvaluation
{
  [(CADisplayLink *)self->_continuousEvaluationDisplayLink invalidate];
  continuousEvaluationDisplayLink = self->_continuousEvaluationDisplayLink;
  self->_continuousEvaluationDisplayLink = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouches, 0);
  objc_storeStrong((id *)&self->_continuousEvaluationDisplayLink, 0);
  objc_storeStrong((id *)&self->_touchesObservation, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end