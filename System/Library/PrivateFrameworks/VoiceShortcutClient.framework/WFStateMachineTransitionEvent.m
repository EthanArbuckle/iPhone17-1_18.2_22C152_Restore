@interface WFStateMachineTransitionEvent
+ (id)transitionEventWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5;
- (BOOL)isValid;
- (NSString)reason;
- (WFState)state;
- (WFStateMachineTransitionEvent)initWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5;
- (id)description;
@end

@implementation WFStateMachineTransitionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (NSString)reason
{
  return self->_reason;
}

- (WFState)state
{
  return self->_state;
}

- (id)description
{
  v3 = NSString;
  if ([(WFStateMachineTransitionEvent *)self isValid]) {
    v4 = &stru_1F0C7EBE0;
  }
  else {
    v4 = @"<INVALID TRANSITION>";
  }
  v5 = [(WFStateMachineTransitionEvent *)self state];
  v6 = [v5 description];
  v7 = [(WFStateMachineTransitionEvent *)self reason];
  v8 = [v3 stringWithFormat:@"%@[%@, reason: %@]", v4, v6, v7];

  return v8;
}

- (WFStateMachineTransitionEvent)initWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)WFStateMachineTransitionEvent;
  v11 = [(WFStateMachineTransitionEvent *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_state, a3);
    uint64_t v13 = [v10 copy];
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    v12->_valid = a5;
    v15 = v12;
  }

  return v12;
}

+ (id)transitionEventWithState:(id)a3 reason:(id)a4 valid:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithState:v9 reason:v8 valid:v5];

  return v10;
}

@end