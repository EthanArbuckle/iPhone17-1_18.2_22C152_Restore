@interface SRUIFSiriSessionStateHandler
- (SRUIFSiriSessionStateHandler)initWithDelegate:(id)a3;
- (SRUIFSiriSessionStateHandlerDelegate)delegate;
- (id)_stateMachine;
- (id)stateMachine:(id)a3 descriptionForEvent:(int64_t)a4;
- (int64_t)state;
- (void)_reportTransitionFromState:(int64_t)a3 toState:(int64_t)a4 forEvent:(int64_t)a5 machAbsoluteTime:(double)a6;
- (void)performTransitionForEvent:(int64_t)a3;
- (void)performTransitionForEvent:(int64_t)a3 eventTimeStamp:(double)a4;
- (void)setDelegate:(id)a3;
- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5;
- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5 eventTimeStamp:(double)a6;
@end

@implementation SRUIFSiriSessionStateHandler

- (SRUIFSiriSessionStateHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRUIFSiriSessionStateHandler;
  v5 = [(SRUIFSiriSessionStateHandler *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D9B6070];
    siriSessionPassthroughEvents = v6->_siriSessionPassthroughEvents;
    v6->_siriSessionPassthroughEvents = (NSSet *)v7;

    v9 = objc_alloc_init(SRUIFSiriSessionStateSignpostLogger);
    signpostLogger = v6->_signpostLogger;
    v6->_signpostLogger = v9;
  }
  return v6;
}

- (id)_stateMachine
{
  stateMachine = self->_stateMachine;
  if (!stateMachine)
  {
    id v4 = [[SRUIFStateMachine alloc] initWithInitialState:0];
    v5 = self->_stateMachine;
    self->_stateMachine = v4;

    [(SRUIFStateMachine *)self->_stateMachine setDelegate:self];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:1 forEvent:1];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:1 forEvent:1];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:1 forEvent:14];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:0 forEvent:7];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:0 forEvent:10];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:0 forEvent:7];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:3 forEvent:6];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:3 forEvent:6];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:3 forEvent:10];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:0 forEvent:3];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:0 forEvent:3];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:0 forEvent:4];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:0 forEvent:4];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:0 forEvent:5];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:0 forEvent:5];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:2 forEvent:0];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:2 forEvent:0];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:0 forEvent:2];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:0 forEvent:2];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:2 forEvent:8];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:0 toState:2 forEvent:16];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:3 toState:2 forEvent:8];
    if ([MEMORY[0x263F28510] isStateFeedbackEnabled]) {
      uint64_t v6 = 15;
    }
    else {
      uint64_t v6 = 2;
    }
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:2 forEvent:v6];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:2 forEvent:8];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:2 forEvent:16];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:0 forEvent:3];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:0 forEvent:4];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:0 forEvent:5];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:3 forEvent:6];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:0 forEvent:7];
    if ([MEMORY[0x263F28510] isStateFeedbackEnabled]) {
      [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:0 forEvent:6];
    }
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:1 toState:1 forEvent:1];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:0 forEvent:5];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:3 forEvent:6];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:0 forEvent:7];
    if ([MEMORY[0x263F28510] isStateFeedbackEnabled]) {
      uint64_t v7 = 15;
    }
    else {
      uint64_t v7 = 2;
    }
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:2 forEvent:v7];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:2 forEvent:4];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:2 forEvent:8];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:1 forEvent:1];
    [(SRUIFStateMachine *)self->_stateMachine addTransitionFromState:2 toState:1 forEvent:12];
    stateMachine = self->_stateMachine;
  }
  return stateMachine;
}

- (int64_t)state
{
  v2 = [(SRUIFSiriSessionStateHandler *)self _stateMachine];
  int64_t v3 = [v2 state];

  return v3;
}

- (id)stateMachine:(id)a3 descriptionForEvent:(int64_t)a4
{
  return SRUIFSiriSessionEventGetDescription(a4);
}

- (void)performTransitionForEvent:(int64_t)a3
{
  double v5 = (double)mach_absolute_time();
  [(SRUIFSiriSessionStateHandler *)self performTransitionForEvent:a3 eventTimeStamp:v5];
}

- (void)performTransitionForEvent:(int64_t)a3 eventTimeStamp:(double)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = SRUIFSiriSessionStateGetDescription([(SRUIFSiriSessionStateHandler *)self state]);
    v10 = SRUIFSiriSessionEventGetDescription(a3);
    int v14 = 136315650;
    v15 = "-[SRUIFSiriSessionStateHandler performTransitionForEvent:eventTimeStamp:]";
    __int16 v16 = 2112;
    v17 = v9;
    __int16 v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s Current state %@; event %@", (uint8_t *)&v14, 0x20u);
  }
  siriSessionPassthroughEvents = self->_siriSessionPassthroughEvents;
  objc_super v12 = [NSNumber numberWithInteger:a3];
  LODWORD(siriSessionPassthroughEvents) = [(NSSet *)siriSessionPassthroughEvents containsObject:v12];

  if (siriSessionPassthroughEvents)
  {
    [(SRUIFSiriSessionStateHandler *)self _reportTransitionFromState:[(SRUIFSiriSessionStateHandler *)self state] toState:[(SRUIFSiriSessionStateHandler *)self state] forEvent:a3 machAbsoluteTime:a4];
  }
  else
  {
    v13 = [(SRUIFSiriSessionStateHandler *)self _stateMachine];
    [v13 performTransitionForEvent:a3 eventTimeStamp:a4];
  }
}

- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5
{
  id v8 = a3;
  [(SRUIFSiriSessionStateHandler *)self stateMachine:v8 didTransitionFromState:a4 forEvent:a5 eventTimeStamp:(double)mach_absolute_time()];
}

- (void)stateMachine:(id)a3 didTransitionFromState:(int64_t)a4 forEvent:(int64_t)a5 eventTimeStamp:(double)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v10 = [(SRUIFSiriSessionStateHandler *)self state];
  v11 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = v11;
    v13 = SRUIFSiriSessionStateGetDescription(a4);
    int v14 = SRUIFSiriSessionStateGetDescription(v10);
    v15 = SRUIFSiriSessionEventGetDescription(a5);
    int v16 = 136315906;
    v17 = "-[SRUIFSiriSessionStateHandler stateMachine:didTransitionFromState:forEvent:eventTimeStamp:]";
    __int16 v18 = 2112;
    v19 = v13;
    __int16 v20 = 2112;
    v21 = v14;
    __int16 v22 = 2112;
    v23 = v15;
    _os_log_impl(&dword_225FBA000, v12, OS_LOG_TYPE_DEFAULT, "%s From %@; To %@; Event %@", (uint8_t *)&v16, 0x2Au);
  }
  [(SRUIFSiriSessionStateHandler *)self _reportTransitionFromState:a4 toState:v10 forEvent:a5 machAbsoluteTime:a6];
}

- (void)_reportTransitionFromState:(int64_t)a3 toState:(int64_t)a4 forEvent:(int64_t)a5 machAbsoluteTime:(double)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sessionStateHandler:self didTransitionFromState:a3 toState:a4 forEvent:a5 machAbsoluteTime:a6];

  signpostLogger = self->_signpostLogger;
  [(SRUIFSiriSessionStateSignpostLogger *)signpostLogger sessionStateHandler:self didTransitionFromState:a3 toState:a4 forEvent:a5 machAbsoluteTime:a6];
}

- (SRUIFSiriSessionStateHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFSiriSessionStateHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_signpostLogger, 0);
  objc_storeStrong((id *)&self->_siriSessionPassthroughEvents, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end