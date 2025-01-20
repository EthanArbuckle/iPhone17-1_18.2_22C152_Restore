@interface SBClickGestureRecognizer
- (BOOL)_areRequiredPressTypesContainedInSet:(id)a3;
- (BOOL)allPressesUpRequired;
- (BOOL)didReceiveRequiredPressBeganCount;
- (BOOL)didReceiveRequiredPressEndedCount;
- (SBClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)maximumBetweenClicksDelay;
- (double)maximumClickDownDuration;
- (double)maximumClickFormationDuration;
- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4;
- (unint64_t)numberOfClicksRequired;
- (void)_notePressReceivedWithType:(int64_t)a3 phase:(int64_t)a4;
- (void)addShortcutWithPressTypes:(id)a3;
- (void)reset;
- (void)resetShortcutsTracking;
- (void)setAllPressesUpRequired:(BOOL)a3;
- (void)setMaximumBetweenClicksDelay:(double)a3;
- (void)setMaximumClickDownDuration:(double)a3;
- (void)setMaximumClickFormationDuration:(double)a3;
- (void)setNumberOfClicksRequired:(unint64_t)a3;
@end

@implementation SBClickGestureRecognizer

- (SBClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBClickGestureRecognizer;
  v4 = [(SBPressGestureRecognizer *)&v13 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_gestureWasRecognized = 0;
    v4->_numberOfClicksRequired = 1;
    v4->_allPressesUpRequired = 1;
    v4->_maximumClickDownDuration = 0.75;
    v4->_maximumBetweenClicksDelay = 0.35;
    v4->_maximumClickFormationDuration = 0.75;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    shortcutPressTypesSubsets = v5->_shortcutPressTypesSubsets;
    v5->_shortcutPressTypesSubsets = (NSMutableArray *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
    receivedPressBeganTypes = v5->_receivedPressBeganTypes;
    v5->_receivedPressBeganTypes = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
    receivedPressEndedTypes = v5->_receivedPressEndedTypes;
    v5->_receivedPressEndedTypes = (NSMutableSet *)v10;
  }
  return v5;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBClickGestureRecognizer;
  [(SBPressGestureRecognizer *)&v3 reset];
  [(SBClickGestureRecognizer *)self resetShortcutsTracking];
  self->_recognizedClicksCount = 0;
  self->_gestureWasRecognized = 0;
}

- (BOOL)_areRequiredPressTypesContainedInSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSMutableArray *)self->_shortcutPressTypesSubsets count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = self->_shortcutPressTypesSubsets;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isSubsetOfSet:", v4, (void)v11))
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    int64_t v9 = [(SBPressGestureRecognizer *)self requiredPressTypesCount];
    LOBYTE(v6) = v9 == [v4 count];
  }

  return v6;
}

- (void)addShortcutWithPressTypes:(id)a3
{
  shortcutPressTypesSubsets = self->_shortcutPressTypesSubsets;
  id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  [(NSMutableArray *)shortcutPressTypesSubsets addObject:v4];
}

- (void)_notePressReceivedWithType:(int64_t)a3 phase:(int64_t)a4
{
  if ([(SBPressGestureRecognizer *)self latestPressPhase])
  {
    if ([(SBPressGestureRecognizer *)self latestPressPhase] != 3) {
      return;
    }
    uint64_t v6 = 448;
  }
  else
  {
    uint64_t v6 = 440;
  }
  uint64_t v7 = *(Class *)((char *)&self->super.super.super.isa + v6);
  id v8 = [NSNumber numberWithInteger:a3];
  objc_msgSend(v7, "addObject:");
}

- (id)gestureStateInfoForUnbalancedPressBeganCount:(int64_t)a3 previousCount:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_alloc_init(SBPressGestureStateInfo);
  [(SBClickGestureRecognizer *)self _notePressReceivedWithType:[(SBPressGestureRecognizer *)self latestPressType] phase:[(SBPressGestureRecognizer *)self latestPressPhase]];
  if (!self->_numberOfClicksRequired || self->_gestureWasRecognized)
  {
    [(SBPressGestureStateInfo *)v7 setState:3];
    goto LABEL_20;
  }
  if (a4 < a3)
  {
    BOOL v8 = [(SBClickGestureRecognizer *)self didReceiveRequiredPressBeganCount];
    self->_allPressBeganReceived = v8;
    if (!a4 || v8)
    {
      [(SBPressGestureStateInfo *)v7 setState:0];
      if (self->_allPressBeganReceived) {
        int64_t v9 = &OBJC_IVAR___SBClickGestureRecognizer__maximumClickDownDuration;
      }
      else {
        int64_t v9 = &OBJC_IVAR___SBClickGestureRecognizer__maximumClickFormationDuration;
      }
      uint64_t v10 = *v9;
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  if (a4 <= a3)
  {
LABEL_17:
    [(SBPressGestureStateInfo *)v7 setIsCoalescing:1];
    uint64_t v13 = [(SBClickGestureRecognizer *)self state];
    long long v14 = v7;
LABEL_18:
    [(SBPressGestureStateInfo *)v14 setState:v13];
    goto LABEL_19;
  }
  if (!self->_allPressBeganReceived)
  {
    long long v14 = v7;
    uint64_t v13 = 5;
    goto LABEL_18;
  }
  unint64_t recognizedClicksCount = self->_recognizedClicksCount;
  if (!self->_allPressesUpRequired)
  {
    unint64_t v12 = recognizedClicksCount + 1;
    goto LABEL_27;
  }
  if ([(SBClickGestureRecognizer *)self didReceiveRequiredPressEndedCount])
  {
    unint64_t v12 = self->_recognizedClicksCount + 1;
LABEL_27:
    self->_unint64_t recognizedClicksCount = v12;
    goto LABEL_29;
  }
  [(SBPressGestureStateInfo *)v7 setIsCoalescing:1];
  [(SBPressGestureStateInfo *)v7 setState:[(SBClickGestureRecognizer *)self state]];
  unint64_t v12 = self->_recognizedClicksCount;
LABEL_29:
  if (recognizedClicksCount >= v12) {
    goto LABEL_19;
  }
  if (v12 == self->_numberOfClicksRequired)
  {
    long long v14 = v7;
    uint64_t v13 = 3;
    goto LABEL_18;
  }
  self->_allPressBeganReceived = 0;
  [(SBClickGestureRecognizer *)self resetShortcutsTracking];
  [(SBPressGestureStateInfo *)v7 setState:0];
  uint64_t v10 = 408;
LABEL_11:
  [(SBPressGestureStateInfo *)v7 setExpirationTime:*(double *)((char *)&self->super.super.super.isa + v10)];
  [(SBPressGestureStateInfo *)v7 setStateUponExpiration:5];
LABEL_19:
  self->_gestureWasRecognized = [(SBPressGestureStateInfo *)v7 state] == 3;
LABEL_20:
  v15 = SBLogButtonsCombo();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = [(SBPressGestureRecognizer *)self name];
    v18 = SBSystemGestureRecognizerStateDescription([(SBPressGestureStateInfo *)v7 state]);
    [(SBPressGestureStateInfo *)v7 expirationTime];
    uint64_t v20 = v19;
    v21 = SBSystemGestureRecognizerStateDescription([(SBPressGestureStateInfo *)v7 stateUponExpiration]);
    int v22 = 138544642;
    v23 = v17;
    __int16 v24 = 1024;
    int v25 = a3;
    __int16 v26 = 1024;
    int v27 = a4;
    __int16 v28 = 2114;
    v29 = v18;
    __int16 v30 = 2048;
    uint64_t v31 = v20;
    __int16 v32 = 2114;
    v33 = v21;
    _os_log_debug_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ gestureStateInfoForUnbalancedPressBeganCount:%d previousCount:%d outState:%{public}@ expiration:%g setStateUponExpiration:%{public}@", (uint8_t *)&v22, 0x36u);
  }
  return v7;
}

- (void)resetShortcutsTracking
{
  [(NSMutableSet *)self->_receivedPressBeganTypes removeAllObjects];
  receivedPressEndedTypes = self->_receivedPressEndedTypes;
  [(NSMutableSet *)receivedPressEndedTypes removeAllObjects];
}

- (BOOL)didReceiveRequiredPressBeganCount
{
  return [(SBClickGestureRecognizer *)self _areRequiredPressTypesContainedInSet:self->_receivedPressBeganTypes];
}

- (BOOL)didReceiveRequiredPressEndedCount
{
  return [(SBClickGestureRecognizer *)self _areRequiredPressTypesContainedInSet:self->_receivedPressEndedTypes];
}

- (unint64_t)numberOfClicksRequired
{
  return self->_numberOfClicksRequired;
}

- (void)setNumberOfClicksRequired:(unint64_t)a3
{
  self->_numberOfClicksRequired = a3;
}

- (BOOL)allPressesUpRequired
{
  return self->_allPressesUpRequired;
}

- (void)setAllPressesUpRequired:(BOOL)a3
{
  self->_allPressesUpRequired = a3;
}

- (double)maximumClickFormationDuration
{
  return self->_maximumClickFormationDuration;
}

- (void)setMaximumClickFormationDuration:(double)a3
{
  self->_maximumClickFormationDuration = a3;
}

- (double)maximumClickDownDuration
{
  return self->_maximumClickDownDuration;
}

- (void)setMaximumClickDownDuration:(double)a3
{
  self->_maximumClickDownDuration = a3;
}

- (double)maximumBetweenClicksDelay
{
  return self->_maximumBetweenClicksDelay;
}

- (void)setMaximumBetweenClicksDelay:(double)a3
{
  self->_maximumBetweenClicksDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedPressEndedTypes, 0);
  objc_storeStrong((id *)&self->_receivedPressBeganTypes, 0);
  objc_storeStrong((id *)&self->_shortcutPressTypesSubsets, 0);
}

@end