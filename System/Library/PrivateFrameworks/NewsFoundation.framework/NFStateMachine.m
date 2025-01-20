@interface NFStateMachine
- (NFMutexLock)lock;
- (NFStateMachine)initWithState:(id)a3 withOwner:(id)a4;
- (NFStateMachineState)state;
- (NSMutableDictionary)events;
- (NSMutableDictionary)states;
- (id)debugDescription;
- (id)description;
- (id)fireEventWithName:(id)a3 withContext:(id)a4;
- (id)owner;
- (int64_t)statusToken;
- (unint64_t)status;
- (void)activate;
- (void)activateIfNeeded;
- (void)addEvent:(id)a3;
- (void)addState:(id)a3;
- (void)deactivate;
- (void)deactivateIfNeeded;
- (void)setEvents:(id)a3;
- (void)setLock:(id)a3;
- (void)setOwner:(id)a3;
- (void)setState:(id)a3;
- (void)setStates:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setStatusToken:(int64_t)a3;
@end

@implementation NFStateMachine

- (void)activate
{
  [MEMORY[0x263F08B88] isMainThread];
  [(NFStateMachine *)self setStatusToken:[(NFStateMachine *)self statusToken] + 1];
  if (([(NFStateMachine *)self statusToken] & 0x8000000000000000) == 0)
  {
    [(NFStateMachine *)self setStatus:1];
  }
}

- (int64_t)statusToken
{
  return self->_statusToken;
}

- (void)setStatusToken:(int64_t)a3
{
  self->_statusToken = a3;
}

- (NFStateMachine)initWithState:(id)a3 withOwner:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NFStateMachine;
  v9 = [(NFStateMachine *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak(&v9->_owner, v8);
    objc_storeStrong((id *)&v10->_state, a3);
    v10->_status = 0;
    v10->_statusToken = 0;
    v11 = (void *)MEMORY[0x263EFF9A0];
    v12 = [v7 name];
    uint64_t v13 = [v11 dictionaryWithObject:v7 forKey:v12];
    states = v10->_states;
    v10->_states = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    events = v10->_events;
    v10->_events = (NSMutableDictionary *)v15;

    v17 = [[NFMutexLock alloc] initWithOptions:1];
    lock = v10->_lock;
    v10->_lock = v17;
  }
  return v10;
}

- (void)addState:(id)a3
{
  id v4 = a3;
  [MEMORY[0x263F08B88] isMainThread];
  v5 = [(NFStateMachine *)self states];
  v6 = [v4 name];
  id v7 = [v5 objectForKey:v6];

  if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NFStateMachine addState:]();
  }
  id v8 = [(NFStateMachine *)self states];
  v9 = [v4 name];
  [v8 setObject:v4 forKey:v9];
}

- (NSMutableDictionary)states
{
  return self->_states;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  [MEMORY[0x263F08B88] isMainThread];
  v5 = [(NFStateMachine *)self events];
  v6 = [v4 name];
  id v7 = [v5 objectForKey:v6];

  if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NFStateMachine addEvent:]();
  }
  id v8 = [(NFStateMachine *)self events];
  v9 = [v4 name];
  [v8 setObject:v4 forKey:v9];
}

- (NSMutableDictionary)events
{
  return self->_events;
}

- (id)fireEventWithName:(id)a3 withContext:(id)a4
{
  v60[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x263F08B88] isMainThread];
  id v8 = [(NFStateMachine *)self owner];
  v9 = v8;
  if (!v8)
  {
    v23 = __48__NFStateMachine_fireEventWithName_withContext___block_invoke();
    goto LABEL_16;
  }
  id v10 = v8;
  if ([(NFStateMachine *)self status] == 1)
  {
    v11 = [(NFStateMachine *)self events];
    v12 = [v11 objectForKey:v6];

    if (v12)
    {
      uint64_t v13 = [v12 states];
      v14 = [(NFStateMachine *)self state];
      char v15 = [v13 containsObject:v14];

      if (v15)
      {
        v16 = [(NFStateMachine *)self state];
        v17 = [v12 destinationState];
        v18 = [[NFStateMachineTransition alloc] initWithStateMachine:self event:v12 fromState:v16 toState:v17 context:v7];
        if ([v17 canTry:v18 withOwner:v10])
        {
          v19 = [(NFStateMachine *)self lock];
          [v19 lock];

          [v16 willExit:v18 withOwner:v10];
          [v17 willEnter:v18 withOwner:v10];
          [(NFStateMachine *)self setState:v17];
          v51[0] = MEMORY[0x263EF8330];
          v51[1] = 3221225472;
          v51[2] = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_3;
          v51[3] = &unk_264485990;
          id v52 = v16;
          v40 = v18;
          objc_super v20 = v18;
          v53 = v20;
          id v37 = v10;
          id v54 = v37;
          v41 = +[NFPromise firstly:v51];
          v39 = zalgoIfMain();
          v47[0] = MEMORY[0x263EF8330];
          v47[1] = 3221225472;
          v47[2] = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_4;
          v47[3] = &unk_2644859B8;
          id v48 = v17;
          v34 = v20;
          v49 = v34;
          id v33 = v37;
          id v50 = v33;
          v38 = [v41 thenOn:v39 then:v47];
          v36 = zalgoIfMain();
          v35 = [v38 errorOn:v36 error:&__block_literal_global_50];
          v32 = zalgoIfMain();
          v46[0] = MEMORY[0x263EF8330];
          v46[1] = 3221225472;
          v46[2] = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_54;
          v46[3] = &unk_264485A00;
          v46[4] = self;
          v21 = [v35 alwaysOn:v32 always:v46];
          v22 = zalgoIfMain();
          v42[0] = MEMORY[0x263EF8330];
          v42[1] = 3221225472;
          v42[2] = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_2_56;
          v42[3] = &unk_2644859B8;
          id v43 = v12;
          v44 = v34;
          id v45 = v33;
          v23 = [v21 thenOn:v22 then:v42];

          v18 = v40;
        }
        else
        {
          v23 = __48__NFStateMachine_fireEventWithName_withContext___block_invoke_2();
        }

        goto LABEL_14;
      }
      uint64_t v29 = *MEMORY[0x263F08320];
      v56[0] = @"event does not allow transition from current state";
      v55[0] = v29;
      v55[1] = @"currentState";
      v30 = [(NFStateMachine *)self state];
      v55[2] = @"event";
      v56[1] = v30;
      v56[2] = v12;
      v16 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];

      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = -102;
    }
    else
    {
      v57[0] = *MEMORY[0x263F08320];
      v57[1] = v6;
      v58[0] = @"event for name not found in state machine";
      v58[1] = @"eventName";
      v16 = [NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
      v27 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = -101;
    }
    v17 = objc_msgSend(v27, "fc_createStateMachineErrorForCode:userInfo:", v28, v16);
    v23 = +[NFPromise asVoid:v17];
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v24 = *MEMORY[0x263F08320];
  v60[0] = @"cannot fire event when state machine is not active";
  v59[0] = v24;
  v59[1] = @"status";
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NFStateMachine status](self, "status"));
  v60[1] = v25;
  v59[2] = @"statusToken";
  v26 = objc_msgSend(NSNumber, "numberWithInteger:", -[NFStateMachine statusToken](self, "statusToken"));
  v60[2] = v26;
  v12 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:3];

  v16 = objc_msgSend(MEMORY[0x263F087E8], "fc_createStateMachineErrorForCode:userInfo:", -100, v12);
  v23 = +[NFPromise asVoid:v16];
LABEL_15:

LABEL_16:
  return v23;
}

- (NFStateMachineState)state
{
  return self->_state;
}

uint64_t __48__NFStateMachine_fireEventWithName_withContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didExit:*(void *)(a1 + 40) withOwner:*(void *)(a1 + 48)];
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setState:(id)a3
{
}

- (id)owner
{
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  return WeakRetained;
}

uint64_t __48__NFStateMachine_fireEventWithName_withContext___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnter:*(void *)(a1 + 40) withOwner:*(void *)(a1 + 48)];
}

uint64_t __48__NFStateMachine_fireEventWithName_withContext___block_invoke_2_56(uint64_t a1)
{
  return [*(id *)(a1 + 32) fired:*(void *)(a1 + 40) withOwner:*(void *)(a1 + 48)];
}

void __48__NFStateMachine_fireEventWithName_withContext___block_invoke_54(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) lock];
  [v1 unlock];
}

- (NFMutexLock)lock
{
  return self->_lock;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NFStateMachine *)self state];
  v5 = [v3 stringWithFormat:@"{%p state=%@, status=%ld, statusToken=%ld}", self, v4, -[NFStateMachine status](self, "status"), -[NFStateMachine statusToken](self, "statusToken")];

  return v5;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = [(NFStateMachine *)self state];
  unint64_t v5 = [(NFStateMachine *)self status];
  int64_t v6 = [(NFStateMachine *)self statusToken];
  id v7 = [(NFStateMachine *)self states];
  id v8 = [(NFStateMachine *)self events];
  v9 = [v3 stringWithFormat:@"{%p state=%@, status=%ld, statusToken=%ld, states=%@, events=%@}", self, v4, v5, v6, v7, v8];

  return v9;
}

- (void)activateIfNeeded
{
  [MEMORY[0x263F08B88] isMainThread];
  if ([(NFStateMachine *)self status] != 1)
  {
    [(NFStateMachine *)self activate];
  }
}

- (void)deactivate
{
  [MEMORY[0x263F08B88] isMainThread];
  [(NFStateMachine *)self setStatusToken:[(NFStateMachine *)self statusToken] - 1];
  if ([(NFStateMachine *)self statusToken] <= 0)
  {
    [(NFStateMachine *)self setStatus:2];
  }
}

- (void)deactivateIfNeeded
{
  [MEMORY[0x263F08B88] isMainThread];
  if ([(NFStateMachine *)self status] != 2)
  {
    [(NFStateMachine *)self deactivate];
  }
}

id __48__NFStateMachine_fireEventWithName_withContext___block_invoke()
{
  v0 = objc_msgSend(MEMORY[0x263F087E8], "fc_createStateMachineErrorForCode:userInfo:", -104, 0);
  id v1 = +[NFPromise asVoid:v0];

  return v1;
}

id __48__NFStateMachine_fireEventWithName_withContext___block_invoke_2()
{
  v0 = objc_msgSend(MEMORY[0x263F087E8], "fc_createStateMachineErrorForCode:userInfo:", -103, 0);
  id v1 = +[NFPromise asVoid:v0];

  return v1;
}

void __48__NFStateMachine_fireEventWithName_withContext___block_invoke_5()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __48__NFStateMachine_fireEventWithName_withContext___block_invoke_5_cold_1();
  }
}

- (void)setOwner:(id)a3
{
}

- (void)setStates:(id)a3
{
}

- (void)setEvents:(id)a3
{
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_destroyWeak(&self->_owner);
  objc_storeStrong((id *)&self->_state, 0);
}

- (void)addState:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Attempting to register a state that already exists"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

- (void)addEvent:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Attempting to register an event that already exists"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

void __48__NFStateMachine_fireEventWithName_withContext___block_invoke_5_cold_1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"state machine did enter/exit is not allowed to throw errors as the state has already been alerted"];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_21DE44000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);
}

@end