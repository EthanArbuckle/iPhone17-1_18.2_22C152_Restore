@interface WGWidgetLifeCycleSequence
- (BOOL)_isValidTransitionToState:(int64_t)a3;
- (BOOL)isCurrentState:(int64_t)a3;
- (BOOL)isCurrentStateAtLeast:(int64_t)a3;
- (BOOL)isCurrentStateAtMost:(int64_t)a3;
- (BOOL)isCurrentStateNotYet:(int64_t)a3;
- (NSString)sequenceIdentifier;
- (WGWidgetLifeCycleSequence)_previousSequence;
- (WGWidgetLifeCycleSequence)initWithSequenceIdentifier:(id)a3;
- (WGWidgetLifeCycleSequence)sequenceWithIdentifier:(id)a3;
- (id)beginTransitionToState:(int64_t)a3 error:(id *)a4;
- (id)description;
- (id)transitionToState:(int64_t)a3;
- (int64_t)currentState;
- (void)_setCurrentState:(int64_t)a3;
- (void)_setPreviousSequence:(id)a3;
@end

@implementation WGWidgetLifeCycleSequence

- (WGWidgetLifeCycleSequence)initWithSequenceIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetLifeCycleSequence;
  v5 = [(WGWidgetLifeCycleSequence *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sequenceIdentifier = v5->_sequenceIdentifier;
    v5->_sequenceIdentifier = (NSString *)v6;
  }
  return v5;
}

- (WGWidgetLifeCycleSequence)sequenceWithIdentifier:(id)a3
{
  id v5 = a3;
  if (![(WGWidgetLifeCycleSequence *)self isCurrentStateAtLeast:5])
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v9 = [(WGWidgetLifeCycleSequence *)self currentState];
    if (v9 > 6) {
      v10 = @"[Invalid]";
    }
    else {
      v10 = off_264676AF8[v9];
    }
    [v8 handleFailureInMethod:a2, self, @"WGWidgetLifeCycleSequence.m", 39, @"Invalid initial state: %@", v10 object file lineNumber description];
  }
  uint64_t v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSequenceIdentifier:v5];

  [v6 _setPreviousSequence:self];
  return (WGWidgetLifeCycleSequence *)v6;
}

- (int64_t)currentState
{
  previousSequence = self->_previousSequence;
  if (previousSequence) {
    return [(WGWidgetLifeCycleSequence *)previousSequence currentState];
  }
  else {
    return self->_currentState;
  }
}

- (BOOL)isCurrentState:(int64_t)a3
{
  return [(WGWidgetLifeCycleSequence *)self currentState] == a3;
}

- (BOOL)isCurrentStateNotYet:(int64_t)a3
{
  return (unint64_t)a3 <= 6 && [(WGWidgetLifeCycleSequence *)self currentState] < a3;
}

- (BOOL)isCurrentStateAtLeast:(int64_t)a3
{
  return (unint64_t)a3 <= 6 && [(WGWidgetLifeCycleSequence *)self currentState] >= a3;
}

- (BOOL)isCurrentStateAtMost:(int64_t)a3
{
  return (unint64_t)a3 <= 6 && [(WGWidgetLifeCycleSequence *)self currentState] <= a3;
}

- (BOOL)_isValidTransitionToState:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WGWidgetLifeCycleSequence.m", 76, @"Invalid parameter not satisfying: %@", @"IsValidState(finalState)" object file lineNumber description];
  }
  previousSequence = self->_previousSequence;
  if (previousSequence)
  {
    if ((unint64_t)[(WGWidgetLifeCycleSequence *)previousSequence currentState] >= 7)
    {
      v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"WGWidgetLifeCycleSequence.m", 79, @"Invalid parameter not satisfying: %@", @"IsValidState([_previousSequence currentState])" object file lineNumber description];
    }
    if ([(WGWidgetLifeCycleSequence *)self->_previousSequence currentState] < a3) {
      return 1;
    }
  }
  else if ((unint64_t)[(WGWidgetLifeCycleSequence *)self currentState] >= 7)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WGWidgetLifeCycleSequence.m", 82, @"Invalid parameter not satisfying: %@", @"IsValidState([self currentState])" object file lineNumber description];
  }
  unint64_t currentState = self->_currentState;
  BOOL v9 = currentState <= 6 && a3 - 1 >= currentState;
  return (unint64_t)a3 <= 6 && v9;
}

- (void)_setCurrentState:(int64_t)a3
{
  if (a3 <= 0 && (id v5 = self->_previousSequence) != 0)
  {
    [(WGWidgetLifeCycleSequence *)v5 _setCurrentState:a3];
    if ([(WGWidgetLifeCycleSequence *)self->_previousSequence isCurrentState:0])
    {
      previousSequence = self->_previousSequence;
      self->_previousSequence = 0;
    }
  }
  else
  {
    v7 = (id)WGLogWidgets;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(WGWidgetLifeCycleSequence *)self _setCurrentState:v7];
    }

    v8 = self->_previousSequence;
    self->_previousSequence = 0;

    self->_unint64_t currentState = a3;
  }
}

- (id)beginTransitionToState:(int64_t)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  unint64_t v7 = [(WGWidgetLifeCycleSequence *)self currentState];
  BOOL v8 = [(WGWidgetLifeCycleSequence *)self _isValidTransitionToState:a3];
  BOOL v9 = (void *)WGLogWidgets;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
    {
      -[WGWidgetLifeCycleSequence beginTransitionToState:error:](v7, a3, v9);
      if (a4) {
        goto LABEL_6;
      }
    }
    else if (a4)
    {
LABEL_6:
      v12 = NSString;
      unint64_t v13 = [(WGWidgetLifeCycleSequence *)self currentState];
      if (v13 > 6) {
        v14 = @"[Invalid]";
      }
      else {
        v14 = off_264676AF8[v13];
      }
      if ((unint64_t)a3 > 6) {
        v15 = @"[Invalid]";
      }
      else {
        v15 = off_264676AF8[a3];
      }
      v16 = [v12 stringWithFormat:@"Invalid transition from '%@' to '%@' attempted", v14, v15];
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v27 = *MEMORY[0x263F08320];
      v28 = v16;
      v18 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      *a4 = [v17 errorWithDomain:@"WGWidgetLifeCycleErrorDomain" code:0 userInfo:v18];
    }
    v11 = 0;
    goto LABEL_14;
  }
  v10 = (id)WGLogWidgets;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = [(WGWidgetLifeCycleSequence *)self sequenceIdentifier];
    v22 = (void *)v21;
    if (v7 > 6) {
      v23 = @"[Invalid]";
    }
    else {
      v23 = off_264676AF8[v7];
    }
    if ((unint64_t)a3 > 6) {
      v24 = @"[Invalid]";
    }
    else {
      v24 = off_264676AF8[a3];
    }
    *(_DWORD *)location = 138544130;
    *(void *)&location[4] = v21;
    __int16 v30 = 2050;
    v31 = self;
    __int16 v32 = 2114;
    v33 = v23;
    __int16 v34 = 2114;
    v35 = v24;
    _os_log_debug_impl(&dword_222E49000, v10, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p> Beginning transition from '%{public}@' to '%{public}@'", location, 0x2Au);
  }
  objc_initWeak((id *)location, self);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __58__WGWidgetLifeCycleSequence_beginTransitionToState_error___block_invoke;
  v25[3] = &unk_264676AD8;
  objc_copyWeak(v26, (id *)location);
  v26[1] = (id)v7;
  v26[2] = (id)a3;
  v11 = (void *)MEMORY[0x223CAA850](v25);
  objc_destroyWeak(v26);
  objc_destroyWeak((id *)location);
LABEL_14:
  v19 = (void *)[v11 copy];

  return v19;
}

id __58__WGWidgetLifeCycleSequence_beginTransitionToState_error___block_invoke(uint64_t a1, unint64_t a2)
{
  v26[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [WeakRetained isCurrentState:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v5) {
    BOOL v7 = v6 == a2;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    [WeakRetained _setCurrentState:a2];
    BOOL v9 = 0;
    goto LABEL_28;
  }
  if ((v5 & 1) == 0)
  {
    v10 = NSString;
    unint64_t v11 = [WeakRetained currentState];
    if (v11 > 6) {
      v12 = @"[Invalid]";
    }
    else {
      v12 = off_264676AF8[v11];
    }
    unint64_t v16 = *(void *)(a1 + 40);
    if (v16 > 6) {
      v17 = @"[Invalid]";
    }
    else {
      v17 = off_264676AF8[v16];
    }
    [v10 stringWithFormat:@"A transition has occurred (to '%@') since this transition was begun (from '%@')", v12, v17, v24];
    goto LABEL_26;
  }
  if (v6 != a2)
  {
    unint64_t v13 = NSString;
    unint64_t v14 = [WeakRetained currentState];
    if (v14 > 6) {
      v15 = @"[Invalid]";
    }
    else {
      v15 = off_264676AF8[v14];
    }
    if (a2 > 6) {
      v18 = @"[Invalid]";
    }
    else {
      v18 = off_264676AF8[a2];
    }
    unint64_t v19 = *(void *)(a1 + 48);
    if (v19 > 6) {
      v20 = @"[Invalid]";
    }
    else {
      v20 = off_264676AF8[v19];
    }
    [v13 stringWithFormat:@"Unexpected state transition from '%@' to '%@' ('%@' was promised)", v15, v18, v20];
LABEL_26:
    BOOL v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  BOOL v8 = @"Unexpected error";
LABEL_27:
  uint64_t v21 = (void *)MEMORY[0x263F087E8];
  uint64_t v25 = *MEMORY[0x263F08320];
  v26[0] = v8;
  v22 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  BOOL v9 = [v21 errorWithDomain:@"WGWidgetLifeCycleErrorDomain" code:0 userInfo:v22];

LABEL_28:
  return v9;
}

- (id)transitionToState:(int64_t)a3
{
  id v10 = 0;
  uint64_t v6 = [(WGWidgetLifeCycleSequence *)self beginTransitionToState:a3 error:&v10];
  id v7 = v10;
  if (!v7)
  {
    if (!v6)
    {
      BOOL v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"WGWidgetLifeCycleSequence.m", 140, @"Invalid parameter not satisfying: %@", @"endTransitionBlock" object file lineNumber description];
    }
    v6[2](v6, a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  int v5 = [(WGWidgetLifeCycleSequence *)self sequenceIdentifier];
  unint64_t v6 = [(WGWidgetLifeCycleSequence *)self currentState];
  if (v6 > 6) {
    id v7 = @"[Invalid]";
  }
  else {
    id v7 = off_264676AF8[v6];
  }
  BOOL v8 = [v3 stringWithFormat:@"<%@: %p; sequenceID: %@; currentState: %@", v4, self, v5, v7];

  previousSequence = self->_previousSequence;
  if (previousSequence)
  {
    id v10 = [(WGWidgetLifeCycleSequence *)previousSequence description];
    [v8 appendFormat:@"; _previousSeqeunce: %@", v10];
  }
  [v8 appendString:@">"];
  return v8;
}

- (NSString)sequenceIdentifier
{
  return self->_sequenceIdentifier;
}

- (WGWidgetLifeCycleSequence)_previousSequence
{
  return self->_previousSequence;
}

- (void)_setPreviousSequence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSequence, 0);
  objc_storeStrong((id *)&self->_sequenceIdentifier, 0);
}

- (void)_setCurrentState:(NSObject *)a3 .cold.1(void *a1, unint64_t a2, NSObject *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 sequenceIdentifier];
  id v7 = (void *)v6;
  unint64_t v8 = a1[1];
  if (v8 >= 7) {
    BOOL v9 = @"[Invalid]";
  }
  else {
    BOOL v9 = off_264676AF8[v8];
  }
  if (a2 >= 7) {
    id v10 = @"[Invalid]";
  }
  else {
    id v10 = off_264676AF8[a2];
  }
  int v11 = 138544130;
  uint64_t v12 = v6;
  __int16 v13 = 2050;
  unint64_t v14 = a1;
  __int16 v15 = 2114;
  unint64_t v16 = v9;
  __int16 v17 = 2114;
  v18 = v10;
  _os_log_debug_impl(&dword_222E49000, a3, OS_LOG_TYPE_DEBUG, "<%{public}@: %{public}p> Transitioned from '%{public}@' to '%{public}@'", (uint8_t *)&v11, 0x2Au);
}

- (void)beginTransitionToState:(void *)a3 error:.cold.1(unint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 >= 7) {
    v3 = @"[Invalid]";
  }
  else {
    v3 = off_264676AF8[a1];
  }
  if (a2 >= 7) {
    uint64_t v4 = @"[Invalid]";
  }
  else {
    uint64_t v4 = off_264676AF8[a2];
  }
  int v6 = 138543618;
  id v7 = v3;
  __int16 v8 = 2114;
  BOOL v9 = v4;
  int v5 = a3;
  _os_log_error_impl(&dword_222E49000, v5, OS_LOG_TYPE_ERROR, "Invalid transition from '%{public}@' to '%{public}@' attempted", (uint8_t *)&v6, 0x16u);
}

@end