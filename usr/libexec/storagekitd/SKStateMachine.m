@interface SKStateMachine
+ (id)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5;
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

+ (id)machineWithStateTransitionTable:(id)a3 startState:(id)a4 startEvent:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)objc_opt_class());
  [v10 setState:v8];

  [v10 setEvent:v7];
  [v10 setTable:v9];

  return v10;
}

- (BOOL)nextWithError:(id *)a3
{
  v5 = [(SKStateMachine *)self table];
  v6 = [(SKStateMachine *)self state];
  id v7 = [(SKStateMachine *)self event];
  id v8 = [v5 entryForState:v6 event:v7];

  if (v8)
  {
    id v9 = sub_10000DD48();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [(SKStateMachine *)self state];
      v11 = [(SKStateMachine *)self event];
      v12 = [v8 nextState];
      int v26 = 136315906;
      v27 = "-[SKStateMachine nextWithError:]";
      __int16 v28 = 2112;
      v29 = v10;
      __int16 v30 = 2112;
      v31 = v11;
      __int16 v32 = 2112;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s: State transition (%@,%@)->%@", (uint8_t *)&v26, 0x2Au);
    }
    uint64_t v13 = [v8 action];
    if (v13)
    {
      v14 = (void *)v13;
      id v15 = [v8 selector];

      if (v15) {
        goto LABEL_6;
      }
    }
    v17 = [v8 action];

    if (v17)
    {
      v18 = [v8 action];
      v16 = ((void (**)(void, id *))v18)[2](v18, a3);
    }
    else
    {
      if (![v8 selector])
      {
LABEL_6:
        v16 = 0;
LABEL_13:
        [(SKStateMachine *)self setEvent:v16];
        v24 = [v8 nextState];
        [(SKStateMachine *)self setState:v24];

        unsigned __int8 v19 = 1;
        goto LABEL_14;
      }
      v20 = [(SKStateMachine *)self table];
      v21 = [v20 selectorTarget];
      v22 = (void (*)(void *, id, id *))[v21 methodForSelector:[v8 selector]];

      v18 = [(SKStateMachine *)self table];
      v23 = [v18 selectorTarget];
      v16 = v22(v23, [v8 selector], a3);
    }
    if (!v16)
    {
      unsigned __int8 v19 = 0;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  unsigned __int8 v19 = +[SKError failWithSKErrorCode:102 error:a3];
LABEL_14:

  return v19;
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