@interface SBPressGestureRecognizer
- (BOOL)_didGestureBegin;
- (BOOL)_isDispatchingDelayedPresses;
- (BOOL)_isGestureFailedOrCancelled;
- (BOOL)_shouldStopDispatching;
- (NSArray)pressTypesWithPrecedence;
- (SBPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)latestPressTimestamp;
- (double)waitForPreemptionTimeInterval;
- (id)_allowedPressTypes;
- (id)_gestureStateInfoForPressInfo:(id)a3;
- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4;
- (id)name;
- (int64_t)_delayedPressesCount;
- (int64_t)latestPressPhase;
- (int64_t)latestPressType;
- (int64_t)requiredPressTypesCount;
- (void)_addDelayedPress:(id)a3;
- (void)_applyGestureStateInfo:(id)a3;
- (void)_cancelGesture;
- (void)_processDelayablePresses:(id)a3;
- (void)_processPrecedencePresses:(id)a3;
- (void)_reallyStartDispatchingDelayedPresses;
- (void)_resetDelayedPresses;
- (void)_resetPublishedPressInfo;
- (void)_resetState;
- (void)_startDispatchingDelayedPresses;
- (void)_stopWaitingGestureStateExpiration;
- (void)_updatePublicPressInfo:(id)a3;
- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:(int64_t)a3 andPhase:(int64_t)a4 result:(int64_t *)a5;
- (void)_waitGestureStateExpirationWithFireInterval:(double)a3 timerExpiredActionBlock:(id)a4;
- (void)dealloc;
- (void)processPresses:(id)a3;
- (void)reset;
- (void)setAllowedPressTypes:(id)a3;
- (void)setPressTypesWithPrecedence:(id)a3;
- (void)setWaitForPreemptionTimeInterval:(double)a3;
@end

@implementation SBPressGestureRecognizer

- (SBPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBPressGestureRecognizer;
  v4 = [(SBPressGestureRecognizer *)&v14 initWithTarget:a3 action:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    unbalancedPressBeganTypes = v4->_unbalancedPressBeganTypes;
    v4->_unbalancedPressBeganTypes = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    delayedPressesInfo = v4->_delayedPressesInfo;
    v4->_delayedPressesInfo = (NSMutableArray *)v7;

    v4->_internalGestureState = 0;
    uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
    delayablePressTypes = v4->_delayablePressTypes;
    v4->_delayablePressTypes = (NSSet *)v9;

    v4->_waitForPreemptionTimeInterval = 0.075;
    v4->_latestDispatchedPressTimestamp = -1.0;
    precedencePressTypes = v4->_precedencePressTypes;
    v4->_precedencePressTypes = 0;

    v4->_isDispatchingPresses = 0;
    v4->_precedencePressesTime = -1.79769313e308;
    [(SBPressGestureRecognizer *)v4 setCancelsTouchesInView:0];
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
    [(SBPressGestureRecognizer *)v4 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(SBPressGestureRecognizer *)v4 setAllowedPressTypes:v12];
  }
  return v4;
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_waitingGestureStateExpirationTimer invalidate];
  [(BSAbsoluteMachTimer *)self->_waitingForPreemptionTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBPressGestureRecognizer;
  [(SBPressGestureRecognizer *)&v3 dealloc];
}

- (id)name
{
  v7.receiver = self;
  v7.super_class = (Class)SBPressGestureRecognizer;
  v2 = [(SBPressGestureRecognizer *)&v7 name];
  objc_super v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [(id)objc_opt_class() description];
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setPressTypesWithPrecedence:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  precedencePressTypes = self->_precedencePressTypes;
  self->_precedencePressTypes = v4;

  v6 = [(SBPressGestureRecognizer *)self _allowedPressTypes];
  v7.receiver = self;
  v7.super_class = (Class)SBPressGestureRecognizer;
  [(SBPressGestureRecognizer *)&v7 setAllowedPressTypes:v6];
}

- (NSArray)pressTypesWithPrecedence
{
  return [(NSSet *)self->_precedencePressTypes allObjects];
}

- (void)setAllowedPressTypes:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    id v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    delayablePressTypes = self->_delayablePressTypes;
    self->_delayablePressTypes = v4;

    v6 = [(SBPressGestureRecognizer *)self _allowedPressTypes];
    v7.receiver = self;
    v7.super_class = (Class)SBPressGestureRecognizer;
    [(SBPressGestureRecognizer *)&v7 setAllowedPressTypes:v6];
  }
}

- (id)_allowedPressTypes
{
  objc_super v3 = self->_delayablePressTypes;
  p_precedencePressTypes = &self->_precedencePressTypes;
  if ([(NSSet *)self->_precedencePressTypes count])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithSet:*p_precedencePressTypes];
    [v5 minusSet:self->_delayablePressTypes];
    objc_storeStrong((id *)&self->_precedencePressTypes, v5);
    uint64_t v6 = [(NSSet *)v3 setByAddingObjectsFromSet:*p_precedencePressTypes];

    if (![(NSSet *)*p_precedencePressTypes count])
    {
      objc_super v7 = *p_precedencePressTypes;
      *p_precedencePressTypes = 0;
    }
    objc_super v3 = (NSSet *)v6;
  }
  v8 = [(NSSet *)v3 allObjects];

  return v8;
}

- (int64_t)latestPressType
{
  return self->_latestDispatchedPressType;
}

- (int64_t)latestPressPhase
{
  return self->_latestDispatchedPressPhase;
}

- (double)latestPressTimestamp
{
  return self->_latestDispatchedPressTimestamp;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBPressGestureRecognizer;
  [(SBPressGestureRecognizer *)&v3 reset];
  [(SBPressGestureRecognizer *)self _resetState];
}

- (void)processPresses:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSSet count](self->_precedencePressTypes, "count"));
  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSSet count](self->_delayablePressTypes, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v17 = v4;
  uint64_t v5 = [v4 allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        precedencePressTypes = self->_precedencePressTypes;
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "type"));
        LODWORD(precedencePressTypes) = [(NSSet *)precedencePressTypes containsObject:v12];

        if (precedencePressTypes)
        {
          uint64_t v13 = [v10 phase];
          objc_super v14 = v19;
          if (v13) {
            continue;
          }
        }
        else
        {
          delayablePressTypes = self->_delayablePressTypes;
          v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "type"));
          LODWORD(delayablePressTypes) = [(NSSet *)delayablePressTypes containsObject:v16];

          objc_super v14 = v18;
          if (!delayablePressTypes) {
            continue;
          }
        }
        [v14 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  [(SBPressGestureRecognizer *)self _processPrecedencePresses:v19];
  [(SBPressGestureRecognizer *)self _processDelayablePresses:v18];
}

- (void)_processPrecedencePresses:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "phase", (void)v11))
          {
            BSContinuousMachTimeNow();
            self->_precedencePressesTime = v10;
            if (self->_waitingForPreemptionTimer) {
              [(SBPressGestureRecognizer *)self _cancelGesture];
            }
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (void)_processDelayablePresses:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id obj = a3;
  if ([obj count] || -[SBPressGestureRecognizer _didGestureBegin](self, "_didGestureBegin"))
  {
    BSContinuousMachTimeNow();
    double v5 = v4;
    double precedencePressesTime = self->_precedencePressesTime;
    v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
    v42[0] = v27;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    uint64_t v8 = [obj sortedArrayUsingDescriptors:v7];

    uint64_t v9 = SBLogButtonsCombo();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(SBPressGestureRecognizer *)self _processDelayablePresses:v9];
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v8;
    char v10 = 0;
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v11)
    {
      uint64_t v13 = *(void *)v32;
      *(void *)&long long v12 = 138543874;
      long long v26 = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v15, "phase", v26) == 4)
          {

            [(SBPressGestureRecognizer *)self _cancelGesture];
            goto LABEL_19;
          }
          BOOL v16 = [v15 phase] == 0;
          v17 = SBLogButtonsCombo();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v18 = [(SBPressGestureRecognizer *)self name];
            uint64_t v19 = [v15 type];
            int v20 = [v15 phase];
            *(_DWORD *)buf = v26;
            v36 = v18;
            __int16 v37 = 2048;
            uint64_t v38 = v19;
            __int16 v39 = 1024;
            int v40 = v20;
            _os_log_debug_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEBUG, "QUEUED %{public}@ pressType: %li phase: %i", buf, 0x1Cu);
          }
          [(SBPressGestureRecognizer *)self _addDelayedPress:v15];
          v10 |= v16;
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    if (self->_precedencePressTypes
      && ![(SBPressGestureRecognizer *)self _didGestureBegin]
      && (v10 & 1) != 0)
    {
      if (v5 - precedencePressesTime >= self->_waitForPreemptionTimeInterval)
      {
        if ((v10 & 1) != 0 && !self->_waitingForPreemptionTimer)
        {
          objc_initWeak((id *)buf, self);
          long long v21 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBPressGestureRecognizer.waitingForPreemptionTimer"];
          waitingForPreemptionTimer = self->_waitingForPreemptionTimer;
          self->_waitingForPreemptionTimer = v21;

          long long v23 = self->_waitingForPreemptionTimer;
          double waitForPreemptionTimeInterval = self->_waitForPreemptionTimeInterval;
          id v25 = MEMORY[0x1E4F14428];
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __53__SBPressGestureRecognizer__processDelayablePresses___block_invoke;
          v29[3] = &unk_1E6AF5838;
          objc_copyWeak(&v30, (id *)buf);
          [(BSAbsoluteMachTimer *)v23 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v29 queue:waitForPreemptionTimeInterval handler:0.0];

          objc_destroyWeak(&v30);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        [(SBPressGestureRecognizer *)self _cancelGesture];
      }
    }
    else
    {
      [(SBPressGestureRecognizer *)self _startDispatchingDelayedPresses];
    }
LABEL_19:
  }
  else
  {
    [(SBPressGestureRecognizer *)self _cancelGesture];
  }
}

void __53__SBPressGestureRecognizer__processDelayablePresses___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startDispatchingDelayedPresses];
}

- (void)_addDelayedPress:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_alloc_init(SBDelayedPressInfo);
  -[SBDelayedPressInfo setType:](v7, "setType:", [v4 type]);
  -[SBDelayedPressInfo setPhase:](v7, "setPhase:", [v4 phase]);
  [v4 timestamp];
  double v6 = v5;

  [(SBDelayedPressInfo *)v7 setTimestamp:v6];
  [(NSMutableArray *)self->_delayedPressesInfo addObject:v7];
}

- (void)_startDispatchingDelayedPresses
{
  [(BSAbsoluteMachTimer *)self->_waitingForPreemptionTimer invalidate];
  waitingForPreemptionTimer = self->_waitingForPreemptionTimer;
  self->_waitingForPreemptionTimer = 0;

  if (![(SBPressGestureRecognizer *)self _isDispatchingDelayedPresses]
    && [(SBPressGestureRecognizer *)self _delayedPressesCount] >= 1)
  {
    [(SBPressGestureRecognizer *)self _reallyStartDispatchingDelayedPresses];
  }
}

- (void)_reallyStartDispatchingDelayedPresses
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(SBPressGestureRecognizer *)self _shouldStopDispatching])
  {
    self->_isDispatchingPresses = 0;
  }
  else
  {
    self->_isDispatchingPresses = 1;
    objc_super v3 = [(NSMutableArray *)self->_delayedPressesInfo firstObject];
    [(SBPressGestureRecognizer *)self _updatePublicPressInfo:v3];
    id v4 = [(SBPressGestureRecognizer *)self _gestureStateInfoForPressInfo:v3];
    [(SBPressGestureRecognizer *)self _applyGestureStateInfo:v4];
    [(NSMutableArray *)self->_delayedPressesInfo removeObject:v3];
    if ([(SBPressGestureRecognizer *)self _shouldStopDispatching])
    {
      self->_isDispatchingPresses = 0;
    }
    else if (self->_internalGestureState)
    {
      v6[0] = *MEMORY[0x1E4F1C4B0];
      double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
      [(SBPressGestureRecognizer *)self performSelector:sel__reallyStartDispatchingDelayedPresses withObject:0 afterDelay:v5 inModes:0.0];
    }
    else
    {
      [(SBPressGestureRecognizer *)self _reallyStartDispatchingDelayedPresses];
    }
  }
}

- (BOOL)_isDispatchingDelayedPresses
{
  return self->_isDispatchingPresses;
}

- (BOOL)_shouldStopDispatching
{
  int64_t v3 = [(SBPressGestureRecognizer *)self _delayedPressesCount];
  BOOL result = [(SBPressGestureRecognizer *)self _isGestureFailedOrCancelled];
  if (!v3) {
    return 1;
  }
  return result;
}

- (int64_t)_delayedPressesCount
{
  return [(NSMutableArray *)self->_delayedPressesInfo count];
}

- (void)_resetDelayedPresses
{
  [(BSAbsoluteMachTimer *)self->_waitingForPreemptionTimer invalidate];
  waitingForPreemptionTimer = self->_waitingForPreemptionTimer;
  self->_waitingForPreemptionTimer = 0;

  [(NSMutableArray *)self->_delayedPressesInfo removeAllObjects];
  unbalancedPressBeganTypes = self->_unbalancedPressBeganTypes;
  [(NSMutableArray *)unbalancedPressBeganTypes removeAllObjects];
}

- (id)_gestureStateInfoForPressInfo:(id)a3
{
  unbalancedPressBeganTypes = self->_unbalancedPressBeganTypes;
  id v5 = a3;
  uint64_t v6 = [(NSMutableArray *)unbalancedPressBeganTypes count];
  uint64_t v12 = 0;
  uint64_t v7 = [v5 type];
  uint64_t v8 = [v5 phase];

  [(SBPressGestureRecognizer *)self _updateUnbalancedPressBeganTypesWithCurrentPressType:v7 andPhase:v8 result:&v12];
  if ((unint64_t)(v12 - 3) > 1)
  {
    char v10 = [(SBPressGestureRecognizer *)self gestureStateInfoForUnbalancedPressBeganCount:[(NSMutableArray *)self->_unbalancedPressBeganTypes count] previousCount:v6];
  }
  else
  {
    if (self->_internalGestureState > 0) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = 5;
    }
    char v10 = objc_alloc_init(SBPressGestureStateInfo);
    [(SBPressGestureStateInfo *)v10 setState:v9];
  }
  return v10;
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:(int64_t)a3 andPhase:(int64_t)a4 result:(int64_t *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  uint64_t v8 = [NSNumber numberWithInteger:a3];
  uint64_t v9 = [(NSMutableArray *)self->_unbalancedPressBeganTypes indexOfObject:v8];
  uint64_t v10 = v9;
  if (a4 == 3)
  {
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v14 = SBLogButtonsCombo();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:]();
      }

      int64_t v13 = 4;
    }
    else
    {
      [(NSMutableArray *)self->_unbalancedPressBeganTypes removeObjectAtIndex:v9];
      BOOL v16 = SBLogButtonsCombo();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:].cold.4();
      }

      int64_t v13 = 2;
    }
    goto LABEL_20;
  }
  if (!a4)
  {
    uint64_t v11 = SBLogButtonsCombo();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v12) {
        -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:]();
      }

      [(NSMutableArray *)self->_unbalancedPressBeganTypes addObject:v8];
      int64_t v13 = 1;
    }
    else
    {
      if (v12) {
        -[SBPressGestureRecognizer _updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:]();
      }

      [(NSMutableArray *)self->_unbalancedPressBeganTypes removeObjectAtIndex:v10];
      int64_t v13 = 3;
    }
LABEL_20:
    *a5 = v13;
    goto LABEL_21;
  }
  v15 = SBLogButtonsCombo();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = [(UIGestureRecognizer *)self sb_briefDescription];
    v18 = [NSNumber numberWithInteger:a4];
    int v19 = 138543874;
    int v20 = v17;
    __int16 v21 = 2114;
    long long v22 = v8;
    __int16 v23 = 2114;
    v24 = v18;
    _os_log_debug_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ _updateUnbalanced type:%{public}@ phase is %{public}@, ignoring", (uint8_t *)&v19, 0x20u);
  }
LABEL_21:
}

- (void)_applyGestureStateInfo:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 state];
  char v6 = [v4 isCoalescing];
  self->_internalGestureState = v5;
  BOOL v7 = [(SBPressGestureRecognizer *)self _isGestureFailedOrCancelled];
  if ((v6 & 1) == 0 && !v7)
  {
    [(SBPressGestureRecognizer *)self _stopWaitingGestureStateExpiration];
    [v4 expirationTime];
    if (v8 != -1.0)
    {
      [v4 expirationTime];
      double v10 = v9;
      uint64_t v11 = objc_alloc_init(SBPressGestureStateInfo);
      -[SBPressGestureStateInfo setState:](v11, "setState:", [v4 stateUponExpiration]);
      BOOL v12 = SBLogButtonsCombo();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[SBPressGestureRecognizer _applyGestureStateInfo:]();
      }

      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __51__SBPressGestureRecognizer__applyGestureStateInfo___block_invoke;
      int v19 = &unk_1E6AF5290;
      int v20 = self;
      __int16 v21 = v11;
      int64_t v13 = v11;
      long long v14 = (void *)MEMORY[0x1D948C7A0](&v16);
      -[SBPressGestureRecognizer _waitGestureStateExpirationWithFireInterval:timerExpiredActionBlock:](self, "_waitGestureStateExpirationWithFireInterval:timerExpiredActionBlock:", v14, v10, v16, v17, v18, v19, v20);
    }
  }
  v15 = SBLogButtonsCombo();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[SBPressGestureRecognizer _applyGestureStateInfo:]();
  }

  [(SBPressGestureRecognizer *)self setState:self->_internalGestureState];
}

uint64_t __51__SBPressGestureRecognizer__applyGestureStateInfo___block_invoke(uint64_t a1)
{
  v2 = SBLogButtonsCombo();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __51__SBPressGestureRecognizer__applyGestureStateInfo___block_invoke_cold_1(a1);
  }

  return [*(id *)(a1 + 32) _applyGestureStateInfo:*(void *)(a1 + 40)];
}

- (void)_updatePublicPressInfo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (v4)
  {
    self->_latestDispatchedPressType = [v4 type];
    self->_latestDispatchedPressPhase = [v6 phase];
    [v6 timestamp];
    self->_latestDispatchedPressTimestamp = v5;
  }
  else
  {
    [(SBPressGestureRecognizer *)self _resetPublishedPressInfo];
  }
}

- (void)_waitGestureStateExpirationWithFireInterval:(double)a3 timerExpiredActionBlock:(id)a4
{
  id v6 = a4;
  BOOL v7 = SBLogButtonsCombo();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SBPressGestureRecognizer _waitGestureStateExpirationWithFireInterval:timerExpiredActionBlock:](self);
  }

  [(BSAbsoluteMachTimer *)self->_waitingGestureStateExpirationTimer invalidate];
  double v8 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"SBPressGestureRecognizer.waitingGestureStateExpirationTimer"];
  waitingGestureStateExpirationTimer = self->_waitingGestureStateExpirationTimer;
  self->_waitingGestureStateExpirationTimer = v8;

  double v10 = self->_waitingGestureStateExpirationTimer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__SBPressGestureRecognizer__waitGestureStateExpirationWithFireInterval_timerExpiredActionBlock___block_invoke;
  v12[3] = &unk_1E6B0EF20;
  id v13 = v6;
  id v11 = v6;
  [(BSAbsoluteMachTimer *)v10 scheduleWithFireInterval:MEMORY[0x1E4F14428] leewayInterval:v12 queue:a3 handler:0.0];
}

uint64_t __96__SBPressGestureRecognizer__waitGestureStateExpirationWithFireInterval_timerExpiredActionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_stopWaitingGestureStateExpiration
{
  v1 = objc_msgSend(a1, "sb_briefDescription");
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ timer cancel", v4, v5, v6, v7, 2u);
}

- (void)_cancelGesture
{
  int64_t internalGestureState = self->_internalGestureState;
  if (internalGestureState <= 2)
  {
    if (internalGestureState > 0) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = 5;
    }
    uint64_t v5 = objc_alloc_init(SBPressGestureStateInfo);
    [(SBPressGestureStateInfo *)v5 setState:v4];
    [(SBPressGestureRecognizer *)self _updatePublicPressInfo:0];
    [(SBPressGestureRecognizer *)self _applyGestureStateInfo:v5];
  }
}

- (BOOL)_didGestureBegin
{
  return (unint64_t)(self->_internalGestureState - 1) < 2;
}

- (BOOL)_isGestureFailedOrCancelled
{
  return (self->_internalGestureState & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)_resetState
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v2 = objc_msgSend(v1, "sb_briefDescription");
  uint64_t v3 = SBSystemGestureRecognizerStateDescription(*v0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v4, v5, "%{public}@ reset:%{public}@", v6, v7, v8, v9, v10);
}

- (void)_resetPublishedPressInfo
{
  self->_latestDispatchedPressTimestamp = -1.0;
}

- (double)waitForPreemptionTimeInterval
{
  return self->_waitForPreemptionTimeInterval;
}

- (void)setWaitForPreemptionTimeInterval:(double)a3
{
  self->_double waitForPreemptionTimeInterval = a3;
}

- (int64_t)requiredPressTypesCount
{
  return [(NSSet *)self->_delayablePressTypes count];
}

- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4
{
  uint64_t v7 = objc_alloc_init(SBPressGestureStateInfo);
  uint64_t v8 = v7;
  if (!a4)
  {
    if (a3 > 0)
    {
      uint64_t v9 = 1;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (a3)
  {
    if (a3 != a4)
    {
      uint64_t v9 = 2;
      goto LABEL_9;
    }
LABEL_7:
    [(SBPressGestureStateInfo *)v7 setIsCoalescing:1];
    uint64_t v9 = [(SBPressGestureRecognizer *)self state];
    goto LABEL_9;
  }
  uint64_t v9 = 3;
LABEL_9:
  [(SBPressGestureStateInfo *)v8 setState:v9];
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingForPreemptionTimer, 0);
  objc_storeStrong((id *)&self->_waitingGestureStateExpirationTimer, 0);
  objc_storeStrong((id *)&self->_unbalancedPressBeganTypes, 0);
  objc_storeStrong((id *)&self->_delayedPressesInfo, 0);
  objc_storeStrong((id *)&self->_precedencePressTypes, 0);
  objc_storeStrong((id *)&self->_delayablePressTypes, 0);
}

- (void)_processDelayablePresses:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 name];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 1024;
  int v9 = [a2 count];
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "QUEUEING %{public}@ presses:%d", (uint8_t *)&v6, 0x12u);
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  id v1 = objc_msgSend(v0, "sb_briefDescription");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "%{public}@ _updateUnbalanced type:%{public}@ press .Began: adding press", v4, v5, v6, v7, v8);
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  id v1 = objc_msgSend(v0, "sb_briefDescription");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "%{public}@ _updateUnbalanced type:%{public}@ press .Began: duplicate .Began ", v4, v5, v6, v7, v8);
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:.cold.3()
{
  OUTLINED_FUNCTION_3_3();
  id v1 = objc_msgSend(v0, "sb_briefDescription");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "%{public}@ _updateUnbalanced type:%{public}@ phase .Ended: missing .Began", v4, v5, v6, v7, v8);
}

- (void)_updateUnbalancedPressBeganTypesWithCurrentPressType:andPhase:result:.cold.4()
{
  OUTLINED_FUNCTION_3_3();
  id v1 = objc_msgSend(v0, "sb_briefDescription");
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "%{public}@ _updateUnbalanced type:%{public}@ phase .Ended: removing press", v4, v5, v6, v7, v8);
}

- (void)_applyGestureStateInfo:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v2 = objc_msgSend(v1, "sb_briefDescription");
  uint64_t v3 = SBSystemGestureRecognizerStateDescription(*v0);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v4, v5, "%{public}@ setState:%{public}@", v6, v7, v8, v9, v10);
}

- (void)_applyGestureStateInfo:.cold.2()
{
  OUTLINED_FUNCTION_3_3();
  uint64_t v2 = objc_msgSend(v1, "sb_briefDescription");
  uint64_t v3 = SBSystemGestureRecognizerStateDescription([v0 stateUponExpiration]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v4, v5, "%{public}@ state upon expiration:%{public}@", v6, v7, v8, v9, v10);
}

void __51__SBPressGestureRecognizer__applyGestureStateInfo___block_invoke_cold_1(uint64_t a1)
{
  id v1 = objc_msgSend(*(id *)(a1 + 32), "sb_briefDescription");
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v2, v3, "%{public}@ timer fired", v4, v5, v6, v7, 2u);
}

- (void)_waitGestureStateExpirationWithFireInterval:(void *)a1 timerExpiredActionBlock:.cold.1(void *a1)
{
  id v1 = objc_msgSend(a1, "sb_briefDescription");
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "%{public}@ timer start fireInterval:%g", v4, v5, v6, v7, 2u);
}

@end