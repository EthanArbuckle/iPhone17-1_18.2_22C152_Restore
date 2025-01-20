@interface RBSProcessStateUpdate
+ (id)updateWithState:(id)a3 previousState:(id)a4 exitEvent:(id)a5;
- (RBSProcessExitEvent)exitEvent;
- (RBSProcessHandle)process;
- (RBSProcessState)previousState;
- (RBSProcessState)state;
- (id)description;
@end

@implementation RBSProcessStateUpdate

+ (id)updateWithState:(id)a3 previousState:(id)a4 exitEvent:(id)a5
{
  v9 = (RBSProcessState *)a3;
  v10 = (RBSProcessState *)a4;
  v11 = (RBSProcessExitEvent *)a5;
  v12 = v11;
  if (!v9 && !v10 && !v11)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"RBSProcessStateUpdate.m", 17, @"Invalid parameter not satisfying: %@", @"state || prevState || exitEvent" object file lineNumber description];
  }
  v13 = objc_alloc_init(RBSProcessStateUpdate);
  v14 = [(RBSProcessState *)v9 process];
  v15 = v14;
  if (v14)
  {
    v16 = v14;
    process = v13->_process;
    v13->_process = v16;
  }
  else
  {
    v18 = [(RBSProcessState *)v10 process];
    process = v18;
    if (v18)
    {
      v19 = v18;
    }
    else
    {
      v19 = [(RBSProcessExitEvent *)v12 process];
    }
    v20 = v13->_process;
    v13->_process = v19;
  }
  state = v13->_state;
  v13->_state = v9;
  v22 = v9;

  previousState = v13->_previousState;
  v13->_previousState = v10;
  v24 = v10;

  exitEvent = v13->_exitEvent;
  v13->_exitEvent = v12;

  return v13;
}

- (RBSProcessState)state
{
  return self->_state;
}

- (RBSProcessState)previousState
{
  return self->_previousState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitEvent, 0);
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (RBSProcessHandle)process
{
  return self->_process;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  v5 = (void *)[v3 initWithFormat:@"<%@| process:%@ oldState:%@ newState:%@ exitEvent:%@>", v4, self->_process, self->_previousState, self->_state, self->_exitEvent];

  return v5;
}

- (RBSProcessExitEvent)exitEvent
{
  return self->_exitEvent;
}

@end