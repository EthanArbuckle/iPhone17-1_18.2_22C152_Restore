@interface TURepeatingActor
- (BOOL)_hasIterationsRemaining;
- (BOOL)isCurrentlyPerformingAction;
- (BOOL)isRunning;
- (BOOL)isStopped;
- (OS_dispatch_queue)queue;
- (TURepeatingAction)currentRepeatingAction;
- (TURepeatingAction)pendingRepeatingAction;
- (TURepeatingActor)init;
- (id)attemptNextIterationBlock;
- (os_unfair_lock_s)accessorLock;
- (void)_attemptNextIteration;
- (void)_beginRepeatingAction:(id)a3;
- (void)_completeWithDidFinish:(BOOL)a3;
- (void)_stopWithDidFinish:(BOOL)a3;
- (void)beginRepeatingAction:(id)a3 iterations:(unint64_t)a4 completion:(id)a5;
- (void)beginRepeatingAction:(id)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5 completion:(id)a6;
- (void)setAttemptNextIterationBlock:(id)a3;
- (void)setCurrentRepeatingAction:(id)a3;
- (void)setCurrentlyPerformingAction:(BOOL)a3;
- (void)setPendingRepeatingAction:(id)a3;
- (void)setStopped:(BOOL)a3;
- (void)stop;
@end

@implementation TURepeatingActor

- (TURepeatingActor)init
{
  v8.receiver = self;
  v8.super_class = (Class)TURepeatingActor;
  v2 = [(TURepeatingActor *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.telephonyutilities.turepeatingactor", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (TURepeatingAction)currentRepeatingAction
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_currentRepeatingAction;
  os_unfair_lock_unlock(p_accessorLock);

  return v4;
}

- (void)setCurrentRepeatingAction:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v5 = (TURepeatingAction *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  currentRepeatingAction = self->_currentRepeatingAction;
  p_currentRepeatingAction = (id *)&self->_currentRepeatingAction;
  if (currentRepeatingAction != v5)
  {
    v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *p_currentRepeatingAction;
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "setCurrentRepeatingAction to: %@", (uint8_t *)&v11, 0xCu);
    }

    objc_storeStrong(p_currentRepeatingAction, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)isRunning
{
  v2 = [(TURepeatingActor *)self currentRepeatingAction];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)beginRepeatingAction:(id)a3 iterations:(unint64_t)a4 completion:(id)a5
{
}

- (void)beginRepeatingAction:(id)a3 iterations:(unint64_t)a4 pauseDurationBetweenIterations:(double)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(TURepeatingActor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__TURepeatingActor_beginRepeatingAction_iterations_pauseDurationBetweenIterations_completion___block_invoke;
  block[3] = &unk_1E58E6420;
  id v17 = v11;
  unint64_t v18 = a4;
  double v19 = a5;
  block[4] = self;
  id v16 = v10;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __94__TURepeatingActor_beginRepeatingAction_iterations_pauseDurationBetweenIterations_completion___block_invoke(uint64_t a1)
{
  v2 = [[TURepeatingAction alloc] initWithAction:*(void *)(a1 + 40)];
  [(TURepeatingAction *)v2 setCompletion:*(void *)(a1 + 48)];
  [(TURepeatingAction *)v2 setRemainingIterations:*(void *)(a1 + 56)];
  [(TURepeatingAction *)v2 setPauseDuration:*(double *)(a1 + 64)];
  [*(id *)(a1 + 32) _beginRepeatingAction:v2];
}

- (void)stop
{
  BOOL v3 = [(TURepeatingActor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__TURepeatingActor_stop__block_invoke;
  block[3] = &unk_1E58E5BE0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __24__TURepeatingActor_stop__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopWithDidFinish:0];
}

- (void)_beginRepeatingAction:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = (TURepeatingAction *)a3;
  dispatch_queue_t v5 = [(TURepeatingActor *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(TURepeatingActor *)self currentRepeatingAction];

  if (v6)
  {
    v7 = TUDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "add to pendingRepeatingAction: %@", (uint8_t *)&v10, 0xCu);
    }

    [(TURepeatingActor *)self setPendingRepeatingAction:v4];
  }
  else
  {
    [(TURepeatingActor *)self setCurrentRepeatingAction:v4];
    objc_super v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      currentRepeatingAction = self->_currentRepeatingAction;
      int v10 = 138412290;
      id v11 = currentRepeatingAction;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "currentRepeatingAction changed to: %@", (uint8_t *)&v10, 0xCu);
    }

    [(TURepeatingActor *)self _attemptNextIteration];
  }
}

- (void)_attemptNextIteration
{
  BOOL v3 = [(TURepeatingActor *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(TURepeatingActor *)self currentRepeatingAction];
  if (v4)
  {
    dispatch_queue_t v5 = (void *)v4;
    BOOL v6 = [(TURepeatingActor *)self isStopped];

    if (!v6)
    {
      if ([(TURepeatingActor *)self _hasIterationsRemaining])
      {
        v7 = [(TURepeatingActor *)self currentRepeatingAction];
        uint64_t v8 = [v7 remainingIterations];

        if (v8 != -1)
        {
          v9 = [(TURepeatingActor *)self currentRepeatingAction];
          objc_msgSend(v9, "setRemainingIterations:", objc_msgSend(v9, "remainingIterations") - 1);
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __41__TURepeatingActor__attemptNextIteration__block_invoke;
        aBlock[3] = &unk_1E58E5BE0;
        aBlock[4] = self;
        int v10 = _Block_copy(aBlock);
        [(TURepeatingActor *)self setCurrentlyPerformingAction:1];
        id v11 = [(TURepeatingActor *)self currentRepeatingAction];
        uint64_t v12 = [v11 action];
        ((void (**)(void, void *))v12)[2](v12, v10);
      }
      else
      {
        [(TURepeatingActor *)self _stopWithDidFinish:1];
      }
    }
  }
}

void __41__TURepeatingActor__attemptNextIteration__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__TURepeatingActor__attemptNextIteration__block_invoke_2;
  block[3] = &unk_1E58E5BE0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __41__TURepeatingActor__attemptNextIteration__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentlyPerformingAction:0];
  uint64_t v2 = [*(id *)(a1 + 32) currentRepeatingAction];
  if (v2 && (BOOL v3 = (void *)v2, v4 = [*(id *)(a1 + 32) isStopped], v3, (v4 & 1) == 0))
  {
    if ([*(id *)(a1 + 32) _hasIterationsRemaining])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__TURepeatingActor__attemptNextIteration__block_invoke_3;
      block[3] = &unk_1E58E5BE0;
      block[4] = *(void *)(a1 + 32);
      dispatch_block_t v7 = dispatch_block_create((dispatch_block_flags_t)0, block);
      [*(id *)(a1 + 32) setAttemptNextIterationBlock:v7];
      uint64_t v8 = [*(id *)(a1 + 32) currentRepeatingAction];
      [v8 pauseDuration];
      double v10 = v9;

      id v11 = *(void **)(a1 + 32);
      if (v10 <= 0.0)
      {
        v15 = [v11 queue];
        dispatch_async(v15, v7);
      }
      else
      {
        uint64_t v12 = [v11 currentRepeatingAction];
        [v12 pauseDuration];
        dispatch_time_t v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));

        v15 = [*(id *)(a1 + 32) queue];
        dispatch_after(v14, v15, v7);
      }
    }
    else
    {
      id v16 = *(void **)(a1 + 32);
      [v16 _stopWithDidFinish:1];
    }
  }
  else
  {
    dispatch_queue_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 _hasIterationsRemaining] ^ 1;
    [v5 _completeWithDidFinish:v6];
  }
}

uint64_t __41__TURepeatingActor__attemptNextIteration__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAttemptNextIterationBlock:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _attemptNextIteration];
}

- (BOOL)_hasIterationsRemaining
{
  BOOL v3 = [(TURepeatingActor *)self queue];
  dispatch_assert_queue_V2(v3);

  char v4 = [(TURepeatingActor *)self currentRepeatingAction];
  if ([v4 remainingIterations])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(TURepeatingActor *)self currentRepeatingAction];
    BOOL v5 = [v6 remainingIterations] == -1;
  }
  return v5;
}

- (void)_stopWithDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(TURepeatingActor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "_stopWithDidFinish: %d", (uint8_t *)v10, 8u);
  }

  dispatch_block_t v7 = [(TURepeatingActor *)self currentRepeatingAction];

  if (v7)
  {
    [(TURepeatingActor *)self setStopped:1];
    uint64_t v8 = [(TURepeatingActor *)self attemptNextIterationBlock];
    double v9 = v8;
    if (v8)
    {
      dispatch_block_cancel(v8);
      [(TURepeatingActor *)self setAttemptNextIterationBlock:0];
    }
    if (![(TURepeatingActor *)self isCurrentlyPerformingAction]) {
      [(TURepeatingActor *)self _completeWithDidFinish:v3];
    }
  }
}

- (void)_completeWithDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(TURepeatingActor *)self queue];
  dispatch_assert_queue_V2(v5);

  [(TURepeatingActor *)self setStopped:0];
  [(TURepeatingActor *)self setAttemptNextIterationBlock:0];
  uint64_t v6 = [(TURepeatingActor *)self currentRepeatingAction];
  dispatch_block_t v7 = [v6 completion];

  if (v7)
  {
    uint64_t v8 = [(TURepeatingActor *)self currentRepeatingAction];
    double v9 = [v8 completion];
    v9[2](v9, v3);
  }
  [(TURepeatingActor *)self setCurrentRepeatingAction:0];
  double v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = v3;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "completeWithDidFinish: %d currentRepeatingAction changed to nil", (uint8_t *)v13, 8u);
  }

  uint64_t v11 = [(TURepeatingActor *)self pendingRepeatingAction];

  if (v11)
  {
    uint64_t v12 = [(TURepeatingActor *)self pendingRepeatingAction];
    [(TURepeatingActor *)self _beginRepeatingAction:v12];

    [(TURepeatingActor *)self setPendingRepeatingAction:0];
  }
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isStopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BOOL)isCurrentlyPerformingAction
{
  return self->_currentlyPerformingAction;
}

- (void)setCurrentlyPerformingAction:(BOOL)a3
{
  self->_currentlyPerformingAction = a3;
}

- (TURepeatingAction)pendingRepeatingAction
{
  return self->_pendingRepeatingAction;
}

- (void)setPendingRepeatingAction:(id)a3
{
}

- (id)attemptNextIterationBlock
{
  return self->_attemptNextIterationBlock;
}

- (void)setAttemptNextIterationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attemptNextIterationBlock, 0);
  objc_storeStrong((id *)&self->_pendingRepeatingAction, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_currentRepeatingAction, 0);
}

@end