@interface SYBacklinkMonitor
- (BOOL)_needsActivityUpdate;
- (NSDate)_lastOperationStartTime;
- (OS_dispatch_queue)_monitorQueue;
- (SYBacklinkMonitor)init;
- (SYBacklinkMonitorDelegate)delegate;
- (SYBacklinkMonitorOperation)_activeOperation;
- (SYBacklinkMonitorTestingDelegate)testingDelegate;
- (double)testingOperationCoalescingInterval;
- (id)_delayedChangeEvaluationBlock;
- (void)_beginNewOperation;
- (void)_evaluatePendingRequests;
- (void)backlinkMonitorOperationDidFinish:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTestingDelegate:(id)a3;
- (void)setTestingOperationCoalescingInterval:(double)a3;
- (void)set_activeOperation:(id)a3;
- (void)set_delayedChangeEvaluationBlock:(id)a3;
- (void)set_lastOperationStartTime:(id)a3;
- (void)set_needsActivityUpdate:(BOOL)a3;
- (void)userActivityDidChange;
@end

@implementation SYBacklinkMonitor

- (SYBacklinkMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)SYBacklinkMonitor;
  v2 = [(SYBacklinkMonitor *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.synapse.BacklinkMonitor", v3);
    monitorQueue = v2->__monitorQueue;
    v2->__monitorQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)userActivityDidChange
{
  v3 = [(SYBacklinkMonitor *)self _monitorQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SYBacklinkMonitor_userActivityDidChange__block_invoke;
  block[3] = &unk_1E6463AB0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __42__SYBacklinkMonitor_userActivityDidChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_needsActivityUpdate:", 1);
  v2 = *(void **)(a1 + 32);
  return [v2 _evaluatePendingRequests];
}

- (void)_evaluatePendingRequests
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(SYBacklinkMonitor *)self _monitorQueue];
  dispatch_assert_queue_V2(v3);

  if ([(SYBacklinkMonitor *)self _needsActivityUpdate])
  {
    dispatch_queue_t v4 = [(SYBacklinkMonitor *)self _delayedChangeEvaluationBlock];

    if (v4)
    {
      v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: ignoring request to process activity change because there is a pending delayed evaluation.", buf, 2u);
      }
    }
    else
    {
      v6 = [(SYBacklinkMonitor *)self _lastOperationStartTime];

      if (!v6) {
        goto LABEL_13;
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v8 = v7;
      v9 = [(SYBacklinkMonitor *)self _lastOperationStartTime];
      [v9 timeIntervalSinceReferenceDate];
      double v11 = v8 - v10;

      [(SYBacklinkMonitor *)self testingOperationCoalescingInterval];
      double v13 = v12;
      double v14 = 2.0;
      if (v13 > 0.0) {
        [(SYBacklinkMonitor *)self testingOperationCoalescingInterval];
      }
      if (v11 < v14)
      {
        double v15 = v14 - v11;
        v16 = os_log_create("com.apple.synapse", "BacklinkMonitor");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          double v24 = v11;
          __int16 v25 = 2048;
          double v26 = v15;
          _os_log_impl(&dword_1C2C5F000, v16, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: ignoring request to process activity change because last request was %0.2fs ago, scheduling re-evaluation in %0.2fs.", buf, 0x16u);
        }

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __45__SYBacklinkMonitor__evaluatePendingRequests__block_invoke;
        block[3] = &unk_1E6463AB0;
        block[4] = self;
        dispatch_block_t v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
        [(SYBacklinkMonitor *)self set_delayedChangeEvaluationBlock:v17];

        dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
        v19 = [(SYBacklinkMonitor *)self _monitorQueue];
        v20 = [(SYBacklinkMonitor *)self _delayedChangeEvaluationBlock];
        dispatch_after(v18, v19, v20);
      }
      else
      {
LABEL_13:
        v21 = os_log_create("com.apple.synapse", "BacklinkMonitor");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C2C5F000, v21, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: will process request to process activity change.", buf, 2u);
        }

        [(SYBacklinkMonitor *)self _beginNewOperation];
      }
    }
  }
}

uint64_t __45__SYBacklinkMonitor__evaluatePendingRequests__block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v4 = 0;
    _os_log_impl(&dword_1C2C5F000, v2, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: delayed re-evaluation fired.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "set_delayedChangeEvaluationBlock:", 0);
  return [*(id *)(a1 + 32) _evaluatePendingRequests];
}

- (void)_beginNewOperation
{
  if (![(SYBacklinkMonitor *)self _needsActivityUpdate])
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"SYBacklinkMonitor.m" lineNumber:107 description:@"Cannot begin a new operation if there are no pending requests to process."];
  }
  [(SYBacklinkMonitor *)self set_needsActivityUpdate:0];
  dispatch_queue_t v4 = [MEMORY[0x1E4F1C9C8] date];
  [(SYBacklinkMonitor *)self set_lastOperationStartTime:v4];

  v5 = os_log_create("com.apple.synapse", "BacklinkMonitor");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v13 = 0;
    _os_log_impl(&dword_1C2C5F000, v5, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: will begin operation.", v13, 2u);
  }

  v6 = [SYBacklinkMonitorOperation alloc];
  double v7 = [(SYBacklinkMonitor *)self _monitorQueue];
  double v8 = [(SYBacklinkMonitorOperation *)v6 initWithDelegate:self processingQueue:v7 inputUserActivityInfo:0 processIdentifier:0];
  [(SYBacklinkMonitor *)self set_activeOperation:v8];

  v9 = [(SYBacklinkMonitor *)self testingDelegate];
  double v10 = [(SYBacklinkMonitor *)self _activeOperation];
  [v9 backlinkMonitor:self willBeginOperation:v10];

  double v11 = [(SYBacklinkMonitor *)self _activeOperation];
  [v11 beginProcessing];
}

- (void)backlinkMonitorOperationDidFinish:(id)a3
{
  id v5 = a3;
  v6 = [(SYBacklinkMonitor *)self _monitorQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(SYBacklinkMonitor *)self _activeOperation];

  if (v7 == v5)
  {
    [(SYBacklinkMonitor *)self set_activeOperation:0];
    if ([(SYBacklinkMonitor *)self _needsActivityUpdate])
    {
      double v8 = os_log_create("com.apple.synapse", "BacklinkMonitor");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: operation finished. Has more pending work, requesting evaluation.", v12, 2u);
      }
    }
    else
    {
      v9 = [(SYBacklinkMonitor *)self _delayedChangeEvaluationBlock];

      if (v9)
      {
        double v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"SYBacklinkMonitor.m" lineNumber:133 description:@"There shuould be no delayed request if there are no more changes to process."];
      }
      double v10 = os_log_create("com.apple.synapse", "BacklinkMonitor");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C2C5F000, v10, OS_LOG_TYPE_DEFAULT, "BacklinkMonitor: operation finished. No more pending work, notifying didFinishProcessing", buf, 2u);
      }

      double v8 = [(SYBacklinkMonitor *)self delegate];
      [v8 backlinkMonitorDidFinishProcessingActivityChanges:self];
    }

    [(SYBacklinkMonitor *)self _evaluatePendingRequests];
  }
}

- (SYBacklinkMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SYBacklinkMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)_monitorQueue
{
  return self->__monitorQueue;
}

- (BOOL)_needsActivityUpdate
{
  return self->__needsActivityUpdate;
}

- (void)set_needsActivityUpdate:(BOOL)a3
{
  self->__needsActivityUpdate = a3;
}

- (SYBacklinkMonitorOperation)_activeOperation
{
  return self->__activeOperation;
}

- (void)set_activeOperation:(id)a3
{
}

- (id)_delayedChangeEvaluationBlock
{
  return self->__delayedChangeEvaluationBlock;
}

- (void)set_delayedChangeEvaluationBlock:(id)a3
{
}

- (NSDate)_lastOperationStartTime
{
  return self->__lastOperationStartTime;
}

- (void)set_lastOperationStartTime:(id)a3
{
}

- (SYBacklinkMonitorTestingDelegate)testingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
  return (SYBacklinkMonitorTestingDelegate *)WeakRetained;
}

- (void)setTestingDelegate:(id)a3
{
}

- (double)testingOperationCoalescingInterval
{
  return self->_testingOperationCoalescingInterval;
}

- (void)setTestingOperationCoalescingInterval:(double)a3
{
  self->_testingOperationCoalescingInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->__lastOperationStartTime, 0);
  objc_storeStrong(&self->__delayedChangeEvaluationBlock, 0);
  objc_storeStrong((id *)&self->__activeOperation, 0);
  objc_storeStrong((id *)&self->__monitorQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end