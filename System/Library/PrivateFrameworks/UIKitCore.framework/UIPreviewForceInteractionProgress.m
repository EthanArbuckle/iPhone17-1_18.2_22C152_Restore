@interface UIPreviewForceInteractionProgress
- (BOOL)_classifierShouldRespectSystemGestureTouchFiltering;
- (BOOL)completesAtTargetState;
- (BOOL)didEnd;
- (BOOL)enteredMinimumState;
- (UIPreviewForceInteractionProgress)initWithGestureRecognizer:(id)a3;
- (UIPreviewForceInteractionProgress)initWithGestureRecognizer:(id)a3 minimumRequiredState:(int64_t)a4;
- (UIPreviewForceInteractionProgress)initWithView:(id)a3 targetState:(int64_t)a4;
- (UIPreviewForceInteractionProgress)initWithView:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5;
- (id)_initWithObservable:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5;
- (id)_initWithObservable:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5 useLinearClassifier:(BOOL)a6;
- (id)_initWithView:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5 useLinearClassifier:(BOOL)a6;
- (int64_t)_targetState;
- (void)_forceLevelClassifier:(id)a3 currentForceLevelDidChange:(int64_t)a4;
- (void)_forceLevelClassifierDidReset:(id)a3;
- (void)_gestureRecognizerBegan:(BOOL)a3;
- (void)_installProgressObserver;
- (void)_setClassifierShouldRespectSystemGestureTouchFiltering:(BOOL)a3;
- (void)_setGestureBeginObservable:(id)a3;
- (void)_setTargetState:(int64_t)a3;
- (void)setCompletesAtTargetState:(BOOL)a3;
@end

@implementation UIPreviewForceInteractionProgress

- (UIPreviewForceInteractionProgress)initWithView:(id)a3 targetState:(int64_t)a4
{
  id v7 = a3;
  if (a4 <= 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"UIPreviewForceInteractionProgress.m", 57, @"Invalid parameter not satisfying: %@", @"targetState > UIPreviewForceStateNone" object file lineNumber description];
  }
  if ((unint64_t)(a4 - 1) >= 3) {
    int64_t v8 = 0xFFFFFFFF80000000;
  }
  else {
    int64_t v8 = a4 - 1;
  }
  v9 = [(UIPreviewForceInteractionProgress *)self initWithView:v7 targetState:a4 minimumRequiredState:v8];

  return v9;
}

- (UIPreviewForceInteractionProgress)initWithView:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5
{
  id v9 = a3;
  if (a4 <= 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UIPreviewForceInteractionProgress.m", 62, @"Invalid parameter not satisfying: %@", @"targetState > UIPreviewForceStateNone" object file lineNumber description];
  }
  if (a5 >= 3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIPreviewForceInteractionProgress.m", 63, @"Invalid parameter not satisfying: %@", @"minimumState < UIPreviewForceStateCommit" object file lineNumber description];
  }
  if (a5 >= a4)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIPreviewForceInteractionProgress.m", 64, @"Invalid parameter not satisfying: %@", @"minimumState < targetState" object file lineNumber description];
  }
  v10 = [v9 _touchForceObservable];
  v11 = [(UIPreviewForceInteractionProgress *)self _initWithObservable:v10 targetState:a4 minimumRequiredState:a5];

  return v11;
}

- (UIPreviewForceInteractionProgress)initWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requiredPreviewForceState];
  if ((unint64_t)(v5 - 1) >= 3) {
    unint64_t v6 = 0xFFFFFFFF80000000;
  }
  else {
    unint64_t v6 = v5 - 1;
  }
  id v7 = [(UIPreviewForceInteractionProgress *)self initWithGestureRecognizer:v4 minimumRequiredState:v6];

  if (v7) {
    v7->_updateMinimumStateWithTargetState = 1;
  }
  return v7;
}

- (UIPreviewForceInteractionProgress)initWithGestureRecognizer:(id)a3 minimumRequiredState:(int64_t)a4
{
  id v7 = a3;
  if (a4 >= 3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIPreviewForceInteractionProgress.m", 76, @"Invalid parameter not satisfying: %@", @"minimumState < UIPreviewForceStateCommit" object file lineNumber description];
  }
  int64_t v8 = [v7 _touchForceObservable];
  id v9 = -[UIPreviewForceInteractionProgress _initWithObservable:targetState:minimumRequiredState:](self, "_initWithObservable:targetState:minimumRequiredState:", v8, [v7 requiredPreviewForceState], a4);

  if (v9)
  {
    v9->_completesAtTargetState = 0;
    objc_initWeak(&location, v9);
    v10 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v7 path:"requiredPreviewForceState"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__UIPreviewForceInteractionProgress_initWithGestureRecognizer_minimumRequiredState___block_invoke;
    v15[3] = &unk_1E5301E00;
    objc_copyWeak(&v16, &location);
    uint64_t v11 = [v10 addObserverBlock:v15];
    targetStateUpdateObservation = v9->_targetStateUpdateObservation;
    v9->_targetStateUpdateObservation = (NSObservation *)v11;

    [(UIPreviewForceInteractionProgress *)v9 _setGestureBeginObservable:v7];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __84__UIPreviewForceInteractionProgress_initWithGestureRecognizer_minimumRequiredState___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 integerValue];

  [WeakRetained _setTargetState:v4];
}

- (void)_setGestureBeginObservable:(id)a3
{
  uint64_t v4 = (id *)a3;
  objc_initWeak(&location, self);
  uint64_t v5 = -[UIGestureRecognizer _beganObservable](v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__UIPreviewForceInteractionProgress__setGestureBeginObservable___block_invoke;
  v8[3] = &unk_1E5301E28;
  objc_copyWeak(&v9, &location);
  unint64_t v6 = [v5 addObserverBlock:v8];
  gestureBeganObservation = self->_gestureBeganObservation;
  self->_gestureBeganObservation = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__UIPreviewForceInteractionProgress__setGestureBeginObservable___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4) {
    objc_msgSend(WeakRetained, "_gestureRecognizerBegan:", objc_msgSend(v4, "BOOLValue"));
  }
}

- (id)_initWithView:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5 useLinearClassifier:(BOOL)a6
{
  BOOL v6 = a6;
  v10 = [a3 _touchForceObservable];
  id v11 = [(UIPreviewForceInteractionProgress *)self _initWithObservable:v10 targetState:a4 minimumRequiredState:a5 useLinearClassifier:v6];

  return v11;
}

- (id)_initWithObservable:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5
{
  return [(UIPreviewForceInteractionProgress *)self _initWithObservable:a3 targetState:a4 minimumRequiredState:a5 useLinearClassifier:0];
}

- (id)_initWithObservable:(id)a3 targetState:(int64_t)a4 minimumRequiredState:(int64_t)a5 useLinearClassifier:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIPreviewForceInteractionProgress;
  v12 = [(UIInteractionProgress *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_observable, a3);
    v13->_targetState = a4;
    v13->_minimumState = a5;
    if (v6) {
      v14 = _UILinearForceLevelClassifier;
    }
    else {
      v14 = _UIPreviewInteractionForceLevelClassifier;
    }
    v15 = (_UIForceLevelClassifier *)objc_alloc_init(v14);
    classifier = v13->_classifier;
    v13->_classifier = v15;

    [(_UIForceLevelClassifier *)v13->_classifier setDelegate:v13];
    uint64_t v17 = [(_UITouchForceObservable *)v13->_observable addObserver:v13->_classifier];
    classifierObservation = v13->_classifierObservation;
    v13->_classifierObservation = (NSObservation *)v17;

    v13->_completesAtTargetState = 1;
    [(UIPreviewForceInteractionProgress *)v13 _installProgressObserver];
  }

  return v13;
}

- (BOOL)didEnd
{
  return self->_didEnd;
}

- (BOOL)enteredMinimumState
{
  return self->_enteredMinimumState;
}

- (void)_installProgressObserver
{
  objc_initWeak(&location, self);
  id v3 = [(_UIForceLevelClassifier *)self->_classifier observableForProgressToForceLevel:self->_targetState minimumRequiredForceLevel:self->_minimumState];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__UIPreviewForceInteractionProgress__installProgressObserver__block_invoke;
  v6[3] = &unk_1E5301E28;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 addObserverBlock:v6];
  progressObservation = self->_progressObservation;
  self->_progressObservation = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __61__UIPreviewForceInteractionProgress__installProgressObserver__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 104) && !*((unsigned char *)WeakRetained + 105))
  {
    [v5 doubleValue];
    objc_msgSend(v4, "setPercentComplete:");
  }
}

- (void)_setTargetState:(int64_t)a3
{
  self->_targetState = a3;
  int64_t v3 = a3 - 1;
  if (a3 < 1)
  {
    if (self->_updateMinimumStateWithTargetState) {
      self->_minimumState = 0xFFFFFFFF80000000;
    }
    progressObservation = self->_progressObservation;
    self->_progressObservation = 0;
  }
  else
  {
    if (self->_updateMinimumStateWithTargetState)
    {
      if ((unint64_t)a3 >= 4) {
        int64_t v3 = 0xFFFFFFFF80000000;
      }
      self->_minimumState = v3;
    }
    [(UIPreviewForceInteractionProgress *)self _installProgressObserver];
  }
}

- (void)_gestureRecognizerBegan:(BOOL)a3
{
  BOOL v3 = a3;
  if ((!a3
     || [(_UIForceLevelClassifier *)self->_classifier currentForceLevel] >= self->_targetState
     && self->_enteredMinimumState)
    && !self->_didEnd)
  {
    [(UIInteractionProgress *)self endInteraction:v3];
    self->_didEnd = 1;
  }
}

- (void)_forceLevelClassifier:(id)a3 currentForceLevelDidChange:(int64_t)a4
{
  id v5 = a3;
  id v7 = v5;
  if (!self->_enteredMinimumState)
  {
    BOOL v6 = [v5 currentForceLevel] < self->_minimumState;
    id v5 = v7;
    if (!v6) {
      self->_enteredMinimumState = 1;
    }
  }
  if ([v5 currentForceLevel] >= self->_targetState
    && !self->_didEnd
    && self->_completesAtTargetState
    && self->_enteredMinimumState)
  {
    [(UIInteractionProgress *)self endInteraction:1];
    self->_didEnd = 1;
  }
}

- (void)_forceLevelClassifierDidReset:(id)a3
{
  if (!self->_didEnd) {
    [(UIInteractionProgress *)self endInteraction:0];
  }
  self->_didEnd = 0;
  self->_enteredMinimumState = 0;
}

- (void)_setClassifierShouldRespectSystemGestureTouchFiltering:(BOOL)a3
{
}

- (BOOL)_classifierShouldRespectSystemGestureTouchFiltering
{
  return [(_UIForceLevelClassifier *)self->_classifier respectsSystemGestureTouchFiltering];
}

- (int64_t)_targetState
{
  return self->_targetState;
}

- (BOOL)completesAtTargetState
{
  return self->_completesAtTargetState;
}

- (void)setCompletesAtTargetState:(BOOL)a3
{
  self->_completesAtTargetState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureBeganObservation, 0);
  objc_storeStrong((id *)&self->_targetStateUpdateObservation, 0);
  objc_storeStrong((id *)&self->_progressObservation, 0);
  objc_storeStrong((id *)&self->_classifierObservation, 0);
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_observable, 0);
}

@end