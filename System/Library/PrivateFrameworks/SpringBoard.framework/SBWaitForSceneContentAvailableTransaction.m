@interface SBWaitForSceneContentAvailableTransaction
- (BOOL)_canBeInterrupted;
- (SBSceneHandle)sceneHandle;
- (SBWaitForSceneContentAvailableTransaction)initWithSceneHandle:(id)a3 manualListener:(BOOL)a4;
- (void)_begin;
- (void)_didComplete;
- (void)_noteSceneContentReadinessDidChange:(BOOL)a3;
- (void)dealloc;
- (void)noteSceneContentIsReady:(BOOL)a3;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4;
- (void)setSceneHandle:(id)a3;
@end

@implementation SBWaitForSceneContentAvailableTransaction

- (SBWaitForSceneContentAvailableTransaction)initWithSceneHandle:(id)a3 manualListener:(BOOL)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBWaitForSceneContentAvailableTransaction.m", 31, @"Invalid parameter not satisfying: %@", @"sceneHandle" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SBWaitForSceneContentAvailableTransaction;
  v9 = [(SBTransaction *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneHandle, a3);
    v10->_manualListener = a4;
    v10->_isContentStateReady = [v8 isContentReady];
    if (!v10->_manualListener) {
      [(SBSceneHandle *)v10->_sceneHandle addObserver:v10];
    }
  }

  return v10;
}

- (void)dealloc
{
  [(SBSceneHandle *)self->_sceneHandle removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneContentAvailableTransaction;
  [(SBWaitForSceneContentAvailableTransaction *)&v3 dealloc];
}

- (void)noteSceneContentIsReady:(BOOL)a3
{
  if (self->_manualListener)
  {
    BOOL v3 = a3;
    if (([(SBWaitForSceneContentAvailableTransaction *)self isComplete] & 1) == 0)
    {
      [(SBWaitForSceneContentAvailableTransaction *)self _noteSceneContentReadinessDidChange:v3];
    }
  }
}

- (void)_begin
{
  if (!self->_isContentStateReady) {
    [(SBWaitForSceneContentAvailableTransaction *)self addMilestone:@"SBWaitForSceneContentAvailableMilestone"];
  }
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneContentAvailableTransaction;
  [(SBWaitForSceneContentAvailableTransaction *)&v3 _begin];
}

- (void)_didComplete
{
  [(SBSceneHandle *)self->_sceneHandle removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBWaitForSceneContentAvailableTransaction;
  [(SBWaitForSceneContentAvailableTransaction *)&v3 _didComplete];
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)sceneHandle:(id)a3 didUpdateContentState:(int64_t)a4
{
  [(SBWaitForSceneContentAvailableTransaction *)self _noteSceneContentReadinessDidChange:a4 == 2];
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
}

- (void)_noteSceneContentReadinessDidChange:(BOOL)a3
{
  if (self->_isContentStateReady != a3)
  {
    self->_isContentStateReady = a3;
    if (a3) {
      [(SBWaitForSceneContentAvailableTransaction *)self evaluateMilestone:@"SBWaitForSceneContentAvailableMilestone" withEvaluator:&__block_literal_global_203];
    }
  }
}

uint64_t __81__SBWaitForSceneContentAvailableTransaction__noteSceneContentReadinessDidChange___block_invoke()
{
  return 1;
}

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (void)setSceneHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end