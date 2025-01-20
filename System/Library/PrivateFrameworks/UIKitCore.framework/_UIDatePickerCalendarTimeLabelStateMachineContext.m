@interface _UIDatePickerCalendarTimeLabelStateMachineContext
- (BOOL)currentSateCanTransitionWithEvents:(id)a3;
- (BOOL)isFirstResponder;
- (_UIDatePickerCalendarTimeLabelStateMachineContext)initWithUpdateHandler:(id)a3;
- (unint64_t)currentState;
- (unint64_t)currentStateRef;
- (unint64_t)lastDistinctState;
- (unint64_t)previousState;
- (void)_updateFromState:(unint64_t)a3;
- (void)setIsFirstResponder:(BOOL)a3;
@end

@implementation _UIDatePickerCalendarTimeLabelStateMachineContext

- (_UIDatePickerCalendarTimeLabelStateMachineContext)initWithUpdateHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIDatePickerCalendarTimeLabelStateMachine.m", 20, @"Invalid parameter not satisfying: %@", @"updateHandler" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)_UIDatePickerCalendarTimeLabelStateMachineContext;
  v6 = [(_UIDatePickerCalendarTimeLabelStateMachineContext *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_currentState = 1;
    v8 = _Block_copy(v5);
    id updateHandler = v7->_updateHandler;
    v7->_id updateHandler = v8;
  }
  return v7;
}

- (void)_updateFromState:(unint64_t)a3
{
  if (self->_currentState != a3) {
    self->_lastDistinctState = a3;
  }
  self->_previousState = a3;
  (*((void (**)(void))self->_updateHandler + 2))();
}

- (unint64_t)currentStateRef
{
  return &self->_currentState;
}

- (BOOL)currentSateCanTransitionWithEvents:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  unint64_t currentState = self->_currentState;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88___UIDatePickerCalendarTimeLabelStateMachineContext_currentSateCanTransitionWithEvents___block_invoke;
  v7[3] = &unk_1E52E7810;
  v7[4] = &v8;
  v7[5] = currentState;
  [v4 enumerateIndexesUsingBlock:v7];
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (unint64_t)lastDistinctState
{
  return self->_lastDistinctState;
}

- (unint64_t)previousState
{
  return self->_previousState;
}

- (BOOL)isFirstResponder
{
  return self->_isFirstResponder;
}

- (void)setIsFirstResponder:(BOOL)a3
{
  self->_isFirstResponder = a3;
}

- (void).cxx_destruct
{
}

@end