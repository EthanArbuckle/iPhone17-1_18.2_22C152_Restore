@interface SBApplicationProcessState
- (BOOL)isBeingDebugged;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForeground;
- (BOOL)isRunning;
- (NSString)description;
- (id)_initWithProcess:(id)a3 stateSnapshot:(id)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pid;
- (int64_t)taskState;
- (int64_t)visibility;
- (unint64_t)hash;
@end

@implementation SBApplicationProcessState

- (BOOL)isRunning
{
  return [(FBProcessState *)self->_processState isRunning];
}

- (int)pid
{
  return [(FBProcessState *)self->_processState pid];
}

- (NSString)description
{
  return (NSString *)[(SBApplicationProcessState *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isForeground
{
  return [(FBProcessState *)self->_processState isForeground];
}

- (id)_initWithProcess:(id)a3 stateSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBApplicationProcessState;
  v9 = [(SBApplicationProcessState *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_process, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBApplicationProcessState *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInt:withName:", -[SBApplicationProcessState pid](self, "pid"), @"pid");
  [(SBApplicationProcessState *)self taskState];
  v5 = NSStringFromFBProcessTaskState();
  id v6 = (id)[v3 appendObject:v5 withName:@"taskState"];

  [(SBApplicationProcessState *)self visibility];
  id v7 = NSStringFromFBProcessVisibility();
  id v8 = (id)[v3 appendObject:v7 withName:@"visibility"];

  return v3;
}

- (int64_t)visibility
{
  return [(FBProcessState *)self->_processState visibility];
}

- (int64_t)taskState
{
  return [(FBProcessState *)self->_processState taskState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processState, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (BOOL)isBeingDebugged
{
  v2 = self->_process;
  if ([(FBApplicationProcess *)v2 isApplicationProcess]) {
    char v3 = [(FBApplicationProcess *)v2 isBeingDebugged];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBApplicationProcessState *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(FBProcessState *)self->_processState isEqual:v4->_processState];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(FBProcessState *)self->_processState hash];
}

- (id)succinctDescription
{
  v2 = [(SBApplicationProcessState *)self succinctDescriptionBuilder];
  char v3 = [v2 build];

  return v3;
}

@end