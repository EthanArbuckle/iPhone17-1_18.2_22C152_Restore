@interface SKStateMachine
+ (SKStateMachine)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5;
- (BOOL)finished;
- (BOOL)nextWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (NSString)event;
- (NSString)state;
- (SKStateTransitionTable)table;
- (void)setEvent:(id)a3;
- (void)setState:(id)a3;
- (void)setTable:(id)a3;
@end

@implementation SKStateMachine

+ (SKStateMachine)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setState:v8];

  [v10 setEvent:v7];
  [v10 setTable:v9];

  return (SKStateMachine *)v10;
}

- (BOOL)nextWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v6 = [(SKStateMachine *)self table];
  id v7 = [(SKStateMachine *)self state];
  id v8 = [(SKStateMachine *)self event];
  id v9 = [v6 entryForState:v7 event:v8];

  if (v9)
  {
    id v10 = SKGetOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = [(SKStateMachine *)self state];
      v12 = [(SKStateMachine *)self event];
      v13 = [v9 nextState];
      int v28 = 136315906;
      v29 = "-[SKStateMachine nextWithError:]";
      __int16 v30 = 2112;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v13;
      _os_log_impl(&dword_23F40C000, v10, OS_LOG_TYPE_DEBUG, "%s: State transition (%@,%@)->%@", (uint8_t *)&v28, 0x2Au);
    }
    uint64_t v14 = [v9 action];
    if (v14)
    {
      v15 = (void *)v14;
      uint64_t v16 = [v9 selector];

      if (v16)
      {
        v17 = [MEMORY[0x263F08690] currentHandler];
        [v17 handleFailureInMethod:a2, self, @"SKStateMachine.m", 140, @"Should have either action or selector, not both" object file lineNumber description];

LABEL_7:
        v18 = 0;
LABEL_14:
        [(SKStateMachine *)self setEvent:v18];
        v26 = [v9 nextState];
        [(SKStateMachine *)self setState:v26];

        BOOL v21 = 1;
        goto LABEL_15;
      }
    }
    v19 = [v9 action];

    if (v19)
    {
      v20 = [v9 action];
      v18 = ((void (**)(void, id *))v20)[2](v20, a3);
    }
    else
    {
      if (![v9 selector]) {
        goto LABEL_7;
      }
      v22 = [(SKStateMachine *)self table];
      v23 = [v22 selectorTarget];
      v24 = (void (*)(void *, uint64_t, id *))objc_msgSend(v23, "methodForSelector:", objc_msgSend(v9, "selector"));

      v20 = [(SKStateMachine *)self table];
      v25 = [v20 selectorTarget];
      v18 = v24(v25, [v9 selector], a3);
    }
    if (!v18)
    {
      BOOL v21 = 0;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  BOOL v21 = +[SKError failWithSKErrorCode:102 error:a3];
LABEL_15:

  return v21;
}

- (BOOL)finished
{
  v2 = [(SKStateMachine *)self state];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)runWithError:(id *)a3
{
  do
    BOOL v5 = [(SKStateMachine *)self finished];
  while (!v5 && [(SKStateMachine *)self nextWithError:a3]);
  return v5;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (SKStateTransitionTable)table
{
  return self->_table;
}

- (void)setTable:(id)a3
{
}

- (NSString)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_table, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end