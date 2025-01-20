@interface _UIFocusEffectsController
- (BOOL)displayOffsetAccumulatorEnabled;
- (CGPoint)currentOffset;
- (CGPoint)displayOffset;
- (_UIFocusEffectsController)init;
- (void)_notifyObserversForMovementDirection:(CGVector)a3;
- (void)addObserver:(id)a3;
- (void)adjustDisplayOffsetAccumulationFactorForFocusTransfer;
- (void)cancelRollbackAnimation;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)resetDisplayOffsetAccumulationFactor;
- (void)setDisplayOffsetAccumulatorEnabled:(BOOL)a3;
- (void)startRollbackAnimation;
- (void)updateCurrentOffset:(CGPoint)a3;
- (void)updateCurrentOffset:(CGPoint)a3 overrideDisplayOffset:(id)a4;
@end

@implementation _UIFocusEffectsController

- (_UIFocusEffectsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusEffectsController;
  result = [(_UIFocusEffectsController *)&v3 init];
  if (result)
  {
    result->_displayMovementAdjustment = 1.0;
    result->_displayOffsetAccumulatorEnabled = 0;
  }
  return result;
}

- (void)updateCurrentOffset:(CGPoint)a3
{
}

- (void)updateCurrentOffset:(CGPoint)a3 overrideDisplayOffset:(id)a4
{
  double x = a3.x;
  double y = a3.y;
  [a4 CGPointValue];
  if (a4)
  {
    BOOL v8 = self->_displayOffset.x != v6;
    if (self->_displayOffset.y != displayOffset.x) {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  CGPoint currentOffset = self->_currentOffset;
  if (currentOffset.x != x || self->_currentOffset.y != y || v8)
  {
    __asm
    {
      FMOV            V3.2D, #1.0
      FMOV            V4.2D, #-1.0
    }
    if (self->_displayOffsetAccumulatorEnabled)
    {
      if (a4)
      {
        self->_displayOffset.double x = v6;
        self->_displayOffset.double y = displayOffset.x;
      }
      else
      {
        v17.f64[0] = x;
        v17.f64[1] = y;
        CGPoint displayOffset = self->_displayOffset;
        self->_CGPoint displayOffset = (CGPoint)vmaxnmq_f64(vminnmq_f64(vaddq_f64((float64x2_t)displayOffset, vmulq_n_f64(vsubq_f64(v17, (float64x2_t)currentOffset), self->_displayMovementAdjustment)), _Q3), _Q4);
      }
    }
    else
    {
      self->_displayOffset.double x = x;
      self->_displayOffset.double y = y;
    }
    self->_currentOffset.double x = fmax(fmin(x, 1.0), -1.0);
    self->_currentOffset.double y = fmax(fmin(y, 1.0), -1.0);
    if (_UIInternalPreferencesRevisionOnce != -1)
    {
      float64x2_t v30 = _Q4;
      *(float64x2_t *)v34 = _Q3;
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
      _Q4 = v30;
      _Q3 = *(float64x2_t *)v34;
    }
    int v18 = _UIInternalPreferencesRevisionVar;
    displayOffset.double x = 0.8;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v26 = _UIInternalPreference_FocusEngineMotionEffectMaxOffset;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_FocusEngineMotionEffectMaxOffset)
      {
        CGPoint v27 = displayOffset;
        float64x2_t v31 = _Q4;
        *(float64x2_t *)v35 = _Q3;
        while (v18 >= v26)
        {
          _UIInternalPreferenceSync(v18, &_UIInternalPreference_FocusEngineMotionEffectMaxOffset, @"FocusEngineMotionEffectMaxOffset", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
          int v26 = _UIInternalPreference_FocusEngineMotionEffectMaxOffset;
          if (v18 == _UIInternalPreference_FocusEngineMotionEffectMaxOffset)
          {
            _Q4 = v31;
            _Q3 = *(float64x2_t *)v35;
            displayOffset.double x = v27.x;
            goto LABEL_21;
          }
        }
        *(void *)&displayOffset.double x = qword_1E8FD51D8;
        _Q4 = v31;
        _Q3 = *(float64x2_t *)v35;
      }
    }
LABEL_21:
    float64x2_t v19 = vmaxnmq_f64(vminnmq_f64(vdivq_f64((float64x2_t)self->_displayOffset, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&displayOffset.x, 0)), _Q3), _Q4);
    double v20 = v19.f64[1];
    double v29 = v19.f64[0];
    [(_UIFocusEffectsController *)self _notifyObserversForMovementDirection:v27];
    v21 = +[UIWindow _applicationKeyWindow];
    if (v21)
    {
      v33 = v21;
      v22 = [v21 _focusSystem];
      v23 = [v22 focusedItem];

      if (v23 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v24 = [UIFocusMovementHint alloc];
        [v23 frame];
        v25 = [(UIFocusMovementHint *)v24 initWithMovementDirection:v29 itemSize:v20];
        [v23 didHintFocusMovement:v25];
      }
      v21 = v33;
    }
  }
}

- (void)adjustDisplayOffsetAccumulationFactorForFocusTransfer
{
  self->_displayMovementAdjustment = 0.5;
}

- (void)resetDisplayOffsetAccumulationFactor
{
  self->_displayMovementAdjustment = 1.0;
}

- (void)reset
{
  [(_UIFocusEffectsController *)self resetDisplayOffsetAccumulationFactor];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *MEMORY[0x1E4F1DAD8], v4);
  -[_UIFocusEffectsController updateCurrentOffset:overrideDisplayOffset:](self, "updateCurrentOffset:overrideDisplayOffset:", v5, v3, v4);

  [(_UIFocusEffectsController *)self cancelRollbackAnimation];
}

- (void)startRollbackAnimation
{
  [(_UIFocusEffectsController *)self cancelRollbackAnimation];
  CGPoint displayOffset = self->_displayOffset;
  CGPoint currentOffset = self->_currentOffset;
  CGPoint v10 = displayOffset;
  double v4 = [[_UIDynamicValueConvergenceAnimation alloc] initWithValue:1.0 targetValue:0.0 convergenceRate:0.99 minimumDifference:0.01];
  v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51___UIFocusEffectsController_startRollbackAnimation__block_invoke;
  v8[3] = &unk_1E52EE3A8;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___UIFocusEffectsController_startRollbackAnimation__block_invoke_2;
  v7[3] = &unk_1E52DC3A0;
  [(_UIDynamicValueConvergenceAnimation *)v4 runWithValueApplier:v8 completion:v7];
  rollbackAnimation = self->_rollbackAnimation;
  self->_rollbackAnimation = v4;
  double v6 = v4;
}

- (void)cancelRollbackAnimation
{
  rollbackAnimation = self->_rollbackAnimation;
  if (rollbackAnimation)
  {
    [(_UIDynamicAnimation *)rollbackAnimation stop];
    double v4 = self->_rollbackAnimation;
    self->_rollbackAnimation = 0;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    double v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversForMovementDirection:(CGVector)a3
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v6 = [(NSHashTable *)self->_observers setRepresentation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "focusEffectsController:updateMovementDirection:", self, dx, dy);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (CGPoint)displayOffset
{
  double x = self->_displayOffset.x;
  double y = self->_displayOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)currentOffset
{
  double x = self->_currentOffset.x;
  double y = self->_currentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)displayOffsetAccumulatorEnabled
{
  return self->_displayOffsetAccumulatorEnabled;
}

- (void)setDisplayOffsetAccumulatorEnabled:(BOOL)a3
{
  self->_displayOffsetAccumulatorEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rollbackAnimation, 0);
}

@end