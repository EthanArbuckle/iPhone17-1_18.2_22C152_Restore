@interface _PASCoalescingTimer
- (_PASCoalescingTimer)initWithQueue:(id)a3 coalesceData:(id)a4 operation:(id)a5;
- (_PASCoalescingTimer)initWithQueue:(id)a3 leewaySeconds:(double)a4 coalesceData:(id)a5 operation:(id)a6;
- (void)_replaceCoalescingTimerUsingLockWitness:(id)a3;
- (void)cancelPendingOperations;
- (void)immediatelyProcessData:(id)a3;
- (void)processData:(id)a3 afterDelaySeconds:(double)a4 coalescingBehavior:(unsigned __int8)a5;
- (void)processData:(id)a3 afterStrictDelaySeconds:(double)a4;
@end

@implementation _PASCoalescingTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_operation, 0);
  objc_storeStrong(&self->_coalesceData, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (_PASCoalescingTimer)initWithQueue:(id)a3 leewaySeconds:(double)a4 coalesceData:(id)a5 operation:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_PASCoalescingTimer;
  v14 = [(_PASCoalescingTimer *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a3);
    double v16 = 0.0;
    if (a4 >= 0.0) {
      double v16 = a4;
    }
    v15->_leewaySeconds = v16;
    uint64_t v17 = MEMORY[0x1A6245320](v12);
    id coalesceData = v15->_coalesceData;
    v15->_id coalesceData = (id)v17;

    uint64_t v19 = MEMORY[0x1A6245320](v13);
    id operation = v15->_operation;
    v15->_id operation = (id)v19;

    v21 = objc_opt_new();
    uint64_t v22 = objc_opt_new();
    v23 = (void *)v21[4];
    v21[4] = v22;

    v24 = [[_PASLock alloc] initWithGuardedData:v21];
    lock = v15->_lock;
    v15->_lock = v24;
  }
  return v15;
}

- (void)processData:(id)a3 afterDelaySeconds:(double)a4 coalescingBehavior:(unsigned __int8)a5
{
  id v8 = a3;
  if (a4 < 0.0) {
    a4 = 0.0;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:a4];
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72___PASCoalescingTimer_processData_afterDelaySeconds_coalescingBehavior___block_invoke;
  v13[3] = &unk_1E5AEB058;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unsigned __int8 v16 = a5;
  id v11 = v9;
  id v12 = v8;
  [(_PASLock *)lock runWithLockAcquired:v13];
}

- (void)_replaceCoalescingTimerUsingLockWitness:(id)a3
{
  id v5 = a3;
  [*((id *)v5 + 3) timeIntervalSinceNow];
  double v7 = v6;
  id v8 = *((void *)v5 + 1);
  if (v8) {
    dispatch_source_cancel(v8);
  }
  dispatch_source_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  v10 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v9;

  id v11 = (void *)(*((void *)v5 + 2) + 1);
  *((void *)v5 + 2) = v11;
  objc_initWeak(&location, self);
  id v12 = *((void *)v5 + 1);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __63___PASCoalescingTimer__replaceCoalescingTimerUsingLockWitness___block_invoke;
  handler[3] = &unk_1E5AEB120;
  objc_copyWeak(v16, &location);
  v16[1] = v11;
  dispatch_source_set_event_handler(v12, handler);
  dispatch_time_t v13 = +[_PASDispatch dispatchTimeWithSecondsFromNow:v7];
  if (v13 == -1)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_PASCoalescingTimer.m" lineNumber:194 description:@"scheduledDelay is too large!"];
  }
  dispatch_source_set_timer(*((dispatch_source_t *)v5 + 1), v13, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_leewaySeconds * 1000000000.0));
  dispatch_resume(*((dispatch_object_t *)v5 + 1));
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

- (void)cancelPendingOperations
{
}

- (void)processData:(id)a3 afterStrictDelaySeconds:(double)a4
{
  id v7 = a3;
  lock = self->_lock;
  v11[1] = 3221225472;
  double v9 = 0.0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[2] = __59___PASCoalescingTimer_processData_afterStrictDelaySeconds___block_invoke;
  v11[3] = &unk_1E5AEB0D0;
  if (a4 >= 0.0) {
    double v9 = a4;
  }
  v11[4] = self;
  id v12 = v7;
  double v13 = v9;
  SEL v14 = a2;
  id v10 = v7;
  [(_PASLock *)lock runWithLockAcquired:v11];
}

- (void)immediatelyProcessData:(id)a3
{
}

- (_PASCoalescingTimer)initWithQueue:(id)a3 coalesceData:(id)a4 operation:(id)a5
{
  return [(_PASCoalescingTimer *)self initWithQueue:a3 leewaySeconds:a4 coalesceData:a5 operation:0.02];
}

@end