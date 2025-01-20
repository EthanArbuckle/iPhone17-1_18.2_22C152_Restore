@interface SBSceneLayoutSynchronizeTransitionTransaction
- (BOOL)_canBeInterrupted;
- (SBSceneLayoutSynchronizeTransitionTransaction)init;
- (SBSceneLayoutSynchronizeTransitionTransaction)initWithDebugName:(id)a3;
- (id)_graphNodeDebugName;
- (void)synchronize;
@end

@implementation SBSceneLayoutSynchronizeTransitionTransaction

- (void).cxx_destruct
{
}

- (SBSceneLayoutSynchronizeTransitionTransaction)initWithDebugName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneLayoutSynchronizeTransitionTransaction;
  v5 = [(SBSceneLayoutSynchronizeTransitionTransaction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    debugName = v5->_debugName;
    v5->_debugName = (NSString *)v6;

    [(SBSceneLayoutSynchronizeTransitionTransaction *)v5 addMilestone:*MEMORY[0x1E4F623C0]];
  }

  return v5;
}

- (void)synchronize
{
}

- (SBSceneLayoutSynchronizeTransitionTransaction)init
{
  return [(SBSceneLayoutSynchronizeTransitionTransaction *)self initWithDebugName:0];
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (id)_graphNodeDebugName
{
  debugName = self->_debugName;
  if (debugName)
  {
    v3 = debugName;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBSceneLayoutSynchronizeTransitionTransaction;
    v3 = [(SBSceneLayoutSynchronizeTransitionTransaction *)&v5 _graphNodeDebugName];
  }
  return v3;
}

@end