@interface SRUIFStateMachine
- (NSMutableDictionary)_endStatesByEventByStartState;
- (SRUIFStateMachine)initWithInitialState:(int64_t)a3;
- (SRUIFStateMachineDelegate)delegate;
- (id)_descriptionForEvent:(int64_t)a3;
- (id)_endStateNumberFromDictionary:(id)a3 forEvent:(int64_t)a4;
- (int64_t)state;
- (void)_setState:(int64_t)a3;
- (void)_setState:(int64_t)a3 forEvent:(int64_t)a4 eventTimeStamp:(double)a5;
- (void)addTransitionFromState:(int64_t)a3 toState:(int64_t)a4 forEvent:(int64_t)a5;
- (void)performTransitionForEvent:(int64_t)a3;
- (void)performTransitionForEvent:(int64_t)a3 eventTimeStamp:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setEndStatesByEventByStartState:(id)a3;
@end

@implementation SRUIFStateMachine

- (SRUIFStateMachine)initWithInitialState:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SRUIFStateMachine;
  v4 = [(SRUIFStateMachine *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    endStatesByEventByStartState = v5->_endStatesByEventByStartState;
    v5->_endStatesByEventByStartState = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (void)_setState:(int64_t)a3 forEvent:(int64_t)a4 eventTimeStamp:(double)a5
{
  int64_t v9 = [(SRUIFStateMachine *)self state];
  [(SRUIFStateMachine *)self _setState:a3];
  v10 = [(SRUIFStateMachine *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  v12 = [(SRUIFStateMachine *)self delegate];
  id v13 = v12;
  if (v11) {
    [v12 stateMachine:self didTransitionFromState:v9 forEvent:a4 eventTimeStamp:a5];
  }
  else {
    [v12 stateMachine:self didTransitionFromState:v9 forEvent:a4];
  }
}

- (id)_descriptionForEvent:(int64_t)a3
{
  v5 = [(SRUIFStateMachine *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(SRUIFStateMachine *)self delegate];
    v8 = [v7 stateMachine:self descriptionForEvent:a3];
  }
  else
  {
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  }
  return v8;
}

- (void)addTransitionFromState:(int64_t)a3 toState:(int64_t)a4 forEvent:(int64_t)a5
{
  int64_t v9 = [(SRUIFStateMachine *)self _endStatesByEventByStartState];
  v10 = [NSNumber numberWithInteger:a3];
  id v15 = [v9 objectForKey:v10];

  if (!v15)
  {
    id v15 = [MEMORY[0x263EFF9A0] dictionary];
    char v11 = [(SRUIFStateMachine *)self _endStatesByEventByStartState];
    v12 = [NSNumber numberWithInteger:a3];
    [v11 setObject:v15 forKey:v12];
  }
  id v13 = [NSNumber numberWithInteger:a4];
  v14 = [NSNumber numberWithInteger:a5];
  [v15 setObject:v13 forKey:v14];
}

- (id)_endStateNumberFromDictionary:(id)a3 forEvent:(int64_t)a4
{
  char v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithInteger:a4];
  int64_t v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    v10 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SRUIFStateMachine _endStateNumberFromDictionary:forEvent:](v10, self, a4);
    }
    int64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[SRUIFStateMachine state](self, "state"));
  }
  return v9;
}

- (void)performTransitionForEvent:(int64_t)a3
{
  double v5 = (double)mach_absolute_time();
  [(SRUIFStateMachine *)self performTransitionForEvent:a3 eventTimeStamp:v5];
}

- (void)performTransitionForEvent:(int64_t)a3 eventTimeStamp:(double)a4
{
  id v7 = [(SRUIFStateMachine *)self _endStatesByEventByStartState];
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[SRUIFStateMachine state](self, "state"));
  id v10 = [v7 objectForKey:v8];

  int64_t v9 = [(SRUIFStateMachine *)self _endStateNumberFromDictionary:v10 forEvent:a3];
  -[SRUIFStateMachine _setState:forEvent:eventTimeStamp:](self, "_setState:forEvent:eventTimeStamp:", [v9 integerValue], a3, a4);
}

- (SRUIFStateMachineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFStateMachineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)_setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableDictionary)_endStatesByEventByStartState
{
  return self->_endStatesByEventByStartState;
}

- (void)setEndStatesByEventByStartState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endStatesByEventByStartState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_endStateNumberFromDictionary:(uint64_t)a3 forEvent:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v5 = a1;
  uint64_t v6 = [a2 state];
  id v7 = [a2 _descriptionForEvent:a3];
  int v8 = 136315650;
  int64_t v9 = "-[SRUIFStateMachine _endStateNumberFromDictionary:forEvent:]";
  __int16 v10 = 2050;
  uint64_t v11 = v6;
  __int16 v12 = 2114;
  id v13 = v7;
  _os_log_error_impl(&dword_225FBA000, v5, OS_LOG_TYPE_ERROR, "%s No transition is defined from state %{public}ld for event %{public}@. Let's not change state, then.", (uint8_t *)&v8, 0x20u);
}

@end