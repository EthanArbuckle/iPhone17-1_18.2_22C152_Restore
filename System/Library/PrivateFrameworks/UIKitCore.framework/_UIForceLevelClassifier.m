@interface _UIForceLevelClassifier
- (BOOL)respectsSystemGestureTouchFiltering;
- (BOOL)wantsUnclampedForceValues;
- (_UIForceLevelClassifier)init;
- (_UIForceLevelClassifierDelegate)delegate;
- (double)currentTouchForceMultiplier;
- (id)observableForProgressToForceLevel:(int64_t)a3;
- (id)observableForProgressToForceLevel:(int64_t)a3 minimumRequiredForceLevel:(int64_t)a4;
- (int64_t)currentForceLevel;
- (void)_accessibilityForceSensitivityChanged:(id)a3;
- (void)_notifyDelegateOfProgress:(double)a3 toForceLevel:(int64_t)a4;
- (void)dealloc;
- (void)receiveObservedValue:(id)a3;
- (void)reset;
- (void)setCurrentForceLevel:(int64_t)a3;
- (void)setCurrentTouchForceMultiplier:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setRespectsSystemGestureTouchFiltering:(BOOL)a3;
@end

@implementation _UIForceLevelClassifier

- (_UIForceLevelClassifier)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIForceLevelClassifier;
  v2 = [(_UIForceLevelClassifier *)&v8 init];
  if (v2)
  {
    v3 = (NSObservationSource *)objc_alloc_init(MEMORY[0x1E4F28EF0]);
    progressTouchForceObservable = v2->_progressTouchForceObservable;
    v2->_progressTouchForceObservable = v3;

    _AXSForceTouchSensitivity();
    [(_UIForceLevelClassifier *)v2 setCurrentTouchForceMultiplier:v5];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel__accessibilityForceSensitivityChanged_ name:@"UIAccessibilityForceTouchSensitivityChangedNotification" object:0];

    v2->_respectsSystemGestureTouchFiltering = 1;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIAccessibilityForceTouchSensitivityChangedNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIForceLevelClassifier;
  [(_UIForceLevelClassifier *)&v4 dealloc];
}

- (void)reset
{
  id v3 = [(_UIForceLevelClassifier *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _forceLevelClassifierDidReset:self];
  }
}

- (BOOL)wantsUnclampedForceValues
{
  return 0;
}

- (void)setCurrentForceLevel:(int64_t)a3
{
  int64_t currentForceLevel = self->_currentForceLevel;
  if (currentForceLevel != a3)
  {
    self->_int64_t currentForceLevel = a3;
    id v5 = [(_UIForceLevelClassifier *)self delegate];
    [v5 _forceLevelClassifier:self currentForceLevelDidChange:currentForceLevel];
  }
}

- (void)_accessibilityForceSensitivityChanged:(id)a3
{
  _AXSForceTouchSensitivity();
  [(_UIForceLevelClassifier *)self setCurrentTouchForceMultiplier:v4];
  [(_UIForceLevelClassifier *)self touchForceMultiplierDidChange];
}

- (void)receiveObservedValue:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48___UIForceLevelClassifier_receiveObservedValue___block_invoke;
  aBlock[3] = &unk_1E52F0FE0;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  if ([(_UIForceLevelClassifier *)self wantsUnclampedForceValues])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48___UIForceLevelClassifier_receiveObservedValue___block_invoke_2;
    v7[3] = &unk_1E52D9F70;
    v7[4] = self;
    [a3 ifObservationUnclamped:v5 ifReset:v7];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48___UIForceLevelClassifier_receiveObservedValue___block_invoke_3;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    [a3 ifObservation:v5 ifReset:v6];
  }
  [(NSObservationSource *)self->_progressTouchForceObservable receiveObservedValue:a3];
}

- (id)observableForProgressToForceLevel:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    int64_t v3 = 0xFFFFFFFF80000000;
  }
  else {
    int64_t v3 = a3 - 1;
  }
  return [(_UIForceLevelClassifier *)self observableForProgressToForceLevel:a3 minimumRequiredForceLevel:v3];
}

- (id)observableForProgressToForceLevel:(int64_t)a3 minimumRequiredForceLevel:(int64_t)a4
{
  float v4 = 0;
  if (a3 > a4 && a3 >= 1 && (a4 & 0x8000000000000000) == 0)
  {
    if ((unint64_t)a4 >= 3)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __progressObservableCacheKey_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a4;
      if (progressObservableCacheKey_once != -1) {
        dispatch_once(&progressObservableCacheKey_once, block);
      }
    }
    objc_super v8 = [NSNumber numberWithInteger:a4 + 4 * a3];
    cachedProgressObservables = self->_cachedProgressObservables;
    if (!cachedProgressObservables)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v11 = self->_cachedProgressObservables;
      self->_cachedProgressObservables = v10;

      cachedProgressObservables = self->_cachedProgressObservables;
    }
    float v4 = [(NSMutableDictionary *)cachedProgressObservables objectForKey:v8];
    if (!v4)
    {
      v12 = [(_UIForceLevelClassifier *)self transformerFromTouchForceMessageToProgressToForceLevel:a3 minimumRequiredForceLevel:a4];
      float v4 = [(NSObservationSource *)self->_progressTouchForceObservable addObserver:v12];
      [(NSMutableDictionary *)self->_cachedProgressObservables setObject:v4 forKey:v8];
    }
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0 && !self->_delegateObservations)
  {
    float v4 = [MEMORY[0x1E4F1CA48] array];
    for (uint64_t i = 1; ; uint64_t i = 3)
    {
      do
      {
        v6 = (void *)i;
        objc_initWeak(&location, self);
        v7 = [(_UIForceLevelClassifier *)self observableForProgressToForceLevel:v6];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __39___UIForceLevelClassifier_setDelegate___block_invoke;
        v9[3] = &unk_1E52F1208;
        objc_copyWeak(v10, &location);
        v10[1] = v6;
        objc_super v8 = [v7 addObserverBlock:v9];

        [v4 addObject:v8];
        objc_storeStrong((id *)&self->_delegateObservations, v4);

        objc_destroyWeak(v10);
        objc_destroyWeak(&location);
        uint64_t i = 2;
      }
      while (v6 == (void *)1);
      if (v6 != (void *)2) {
        break;
      }
    }
  }
}

- (void)_notifyDelegateOfProgress:(double)a3 toForceLevel:(int64_t)a4
{
  id v7 = [(_UIForceLevelClassifier *)self delegate];
  [v7 _forceLevelClassifier:self didUpdateProgress:a4 toForceLevel:a3];
}

- (int64_t)currentForceLevel
{
  return self->_currentForceLevel;
}

- (_UIForceLevelClassifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIForceLevelClassifierDelegate *)WeakRetained;
}

- (double)currentTouchForceMultiplier
{
  return self->_currentTouchForceMultiplier;
}

- (void)setCurrentTouchForceMultiplier:(double)a3
{
  self->_currentTouchForceMultiplier = a3;
}

- (BOOL)respectsSystemGestureTouchFiltering
{
  return self->_respectsSystemGestureTouchFiltering;
}

- (void)setRespectsSystemGestureTouchFiltering:(BOOL)a3
{
  self->_respectsSystemGestureTouchFiltering = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateObservations, 0);
  objc_storeStrong((id *)&self->_cachedProgressObservables, 0);
  objc_storeStrong((id *)&self->_progressTouchForceObservable, 0);
}

@end