@interface NFStateMachineEvent
- (BOOL)isEqual:(id)a3;
- (NFStateMachineEvent)initWithName:(id)a3 transitionFromStates:(id)a4 toState:(id)a5;
- (NFStateMachineState)destinationState;
- (NSSet)states;
- (NSString)name;
- (id)description;
- (id)fireBlock;
- (id)fired:(id)a3 withOwner:(id)a4;
- (id)onFire:(id)a3;
- (unint64_t)hash;
- (void)setDestinationState:(id)a3;
- (void)setFireBlock:(id)a3;
- (void)setName:(id)a3;
- (void)setStates:(id)a3;
@end

@implementation NFStateMachineEvent

- (NSString)name
{
  return self->_name;
}

- (NFStateMachineEvent)initWithName:(id)a3 transitionFromStates:(id)a4 toState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NFStateMachineEvent;
  v12 = [(NFStateMachineEvent *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_states, a4);
    objc_storeStrong((id *)&v13->_destinationState, a5);
  }

  return v13;
}

- (NSSet)states
{
  return self->_states;
}

- (NFStateMachineState)destinationState
{
  return self->_destinationState;
}

- (id)fired:(id)a3 withOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NFStateMachineEvent *)self fireBlock];

  if (v8)
  {
    id v9 = [(NFStateMachineEvent *)self fireBlock];
    id v10 = ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    id v10 = +[NFPromise asVoid];
  }

  return v10;
}

- (id)fireBlock
{
  return self->_fireBlock;
}

- (unint64_t)hash
{
  v2 = [(NFStateMachineEvent *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NFStateMachineEvent *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(NFStateMachineEvent *)self name];
      id v7 = [(NFStateMachineEvent *)v5 name];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(NFStateMachineEvent *)self name];
  v5 = [(NFStateMachineEvent *)self states];
  id v6 = [(NFStateMachineEvent *)self destinationState];
  id v7 = [v3 stringWithFormat:@"{%p name=%@, from=%@, to=%@}", self, v4, v5, v6];

  return v7;
}

- (id)onFire:(id)a3
{
  return self;
}

- (void)setName:(id)a3
{
}

- (void)setStates:(id)a3
{
}

- (void)setDestinationState:(id)a3
{
}

- (void)setFireBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fireBlock, 0);
  objc_storeStrong((id *)&self->_destinationState, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end