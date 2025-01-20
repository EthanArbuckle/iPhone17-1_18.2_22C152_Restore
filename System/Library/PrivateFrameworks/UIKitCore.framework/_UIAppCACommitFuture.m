@interface _UIAppCACommitFuture
+ (id)scheduledPostCommitFuture:(id)a3;
+ (id)scheduledPreCommitFuture:(id)a3;
- (BOOL)_isFinished;
- (BOOL)_isInvalidated;
- (_UIAppCACommitFuture)initWithPhase:(unint64_t)a3 block:(id)a4;
- (void)_invoke;
- (void)invalidate;
@end

@implementation _UIAppCACommitFuture

+ (id)scheduledPreCommitFuture:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPhase:1 block:v4];

  return v5;
}

- (_UIAppCACommitFuture)initWithPhase:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_UIAppCACommitFuture;
  v7 = [(_UIAppCACommitFuture *)&v18 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id block = v7->_block;
    v7->_id block = (id)v8;

    *(_WORD *)&v7->_invalidated = 0;
    if (a3 == 1)
    {
      [MEMORY[0x1E4F39CF8] activate];
      v12 = (void *)MEMORY[0x1E4F39CF8];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __44___UIAppCACommitFuture_initWithPhase_block___block_invoke_2;
      v14[3] = &unk_1E52D9F70;
      v11 = (id *)&v15;
      v15 = v7;
      [v12 addCommitHandler:v14 forPhase:1];
      goto LABEL_6;
    }
    if (!a3)
    {
      v10 = (void *)UIApp;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __44___UIAppCACommitFuture_initWithPhase_block___block_invoke;
      v16[3] = &unk_1E52D9F70;
      v11 = (id *)&v17;
      v17 = v7;
      [v10 _performBlockAfterCATransactionCommits:v16];
LABEL_6:
    }
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (void)_invoke
{
  if (!self->_invalidated)
  {
    [(_UIAppCACommitFuture *)self willChangeValueForKey:@"finished"];
    id block = (void (**)(void))self->_block;
    if (block)
    {
      block[2]();
      id v4 = self->_block;
    }
    else
    {
      id v4 = 0;
    }
    self->_finished = 1;
    self->_id block = 0;

    [(_UIAppCACommitFuture *)self didChangeValueForKey:@"finished"];
  }
}

+ (id)scheduledPostCommitFuture:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithPhase:0 block:v4];

  return v5;
}

- (void)invalidate
{
  if (!self->_invalidated && !self->_finished)
  {
    [(_UIAppCACommitFuture *)self willChangeValueForKey:@"invalidated"];
    self->_invalidated = 1;
    id block = self->_block;
    self->_id block = 0;

    [(_UIAppCACommitFuture *)self didChangeValueForKey:@"invalidated"];
  }
}

- (BOOL)_isInvalidated
{
  return self->_invalidated;
}

- (BOOL)_isFinished
{
  return self->_finished;
}

@end