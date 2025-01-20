@interface MXMProbe
+ (id)probe;
- (BOOL)_setupWaitSemaphore;
- (BOOL)_shouldStop;
- (BOOL)_updating;
- (BOOL)performPreIterationActions;
- (BOOL)waitUntilStoppedWithTimeout:(double)a3;
- (MXMProbe)init;
- (MXMProbeDelegate)delegate;
- (MXMSampleFilter)filter;
- (OS_dispatch_queue)updateQueue;
- (id)sampleWithTimeout:(double)a3;
- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4;
- (void)_beginUpdates;
- (void)_handleIncomingData:(id)a3;
- (void)_stopUpdates;
- (void)setDelegate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)set_shouldStop:(BOOL)a3;
- (void)set_updating:(BOOL)a3;
- (void)updateNowUntilStopped;
- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3;
- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3 stopHandler:(id)a4;
- (void)updateNowUntilTimeout:(double)a3;
- (void)updateNowUntilTimeout:(double)a3 updateHandler:(id)a4;
- (void)updateNowUntilTimeout:(double)a3 updateHandler:(id)a4 stopHandler:(id)a5;
- (void)waitForeverUntilStopped;
@end

@implementation MXMProbe

- (OS_dispatch_queue)updateQueue
{
  updateQueue = self->_updateQueue;
  if (updateQueue)
  {
    v3 = updateQueue;
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v3 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)probe
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MXMProbe)init
{
  v3.receiver = self;
  v3.super_class = (Class)MXMProbe;
  return [(MXMProbe *)&v3 init];
}

- (void)updateNowUntilStopped
{
}

- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3
{
}

- (void)updateNowUntilStoppedWithUpdateHandler:(id)a3 stopHandler:(id)a4
{
  id v6 = a4;
  v7 = _Block_copy(a3);
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v7;

  v9 = _Block_copy(v6);
  id stopHandler = self->_stopHandler;
  self->_id stopHandler = v9;

  [(MXMProbe *)self _beginUpdates];
}

- (void)updateNowUntilTimeout:(double)a3
{
}

- (void)updateNowUntilTimeout:(double)a3 updateHandler:(id)a4
{
}

- (void)updateNowUntilTimeout:(double)a3 updateHandler:(id)a4 stopHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  [(MXMProbe *)self updateNowUntilStoppedWithUpdateHandler:v9 stopHandler:v10];
  objc_initWeak(&location, self);
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v12 = [(MXMProbe *)self updateQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__MXMProbe_updateNowUntilTimeout_updateHandler_stopHandler___block_invoke;
  v13[3] = &unk_264525258;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a2;
  v13[4] = self;
  dispatch_after(v11, v12, v13);

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __60__MXMProbe_updateNowUntilTimeout_updateHandler_stopHandler___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (!WeakRetained)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"MXMProbe.m" lineNumber:73 description:@"_w_self pointer is nil."];
  }
  id v5 = objc_loadWeakRetained(v2);
  [v5 _stopUpdates];
}

- (void)_beginUpdates
{
}

- (void)_handleIncomingData:(id)a3
{
  id v4 = a3;
  if ([(MXMProbe *)self _shouldStop]
    || ![v4 numberOfSets]
    || [(MXMProbe *)self _shouldStop])
  {
    id v5 = v4;
  }
  else
  {
    unsigned __int8 v10 = 0;
    id v6 = [(MXMProbe *)self filter];
    id v5 = [v4 dataMatchingFilter:v6];

    v7 = [(MXMProbe *)self delegate];
    [v7 probeDidUpdate:self data:v5 stop:&v10];

    id updateHandler = (void (**)(id, MXMProbe *, void *, unsigned char *))self->_updateHandler;
    int v9 = v10;
    if (updateHandler && !v10)
    {
      updateHandler[2](updateHandler, self, v5, &v10);
      int v9 = v10;
    }
    if (v9)
    {
      [(MXMProbe *)self set_shouldStop:1];
      [(MXMProbe *)self _stopUpdates];
    }
  }
}

- (void)_stopUpdates
{
  [(MXMProbe *)self set_updating:0];
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = 0;

  id stopHandler = self->_stopHandler;
  self->_id stopHandler = 0;

  stopWaiter = self->_stopWaiter;
  if (stopWaiter)
  {
    dispatch_semaphore_signal(stopWaiter);
    id v6 = self->_stopWaiter;
    self->_stopWaiter = 0;
  }
}

- (BOOL)_setupWaitSemaphore
{
  id v2 = self;
  objc_sync_enter(v2);
  if ([(MXMProbe *)v2 _updating] && !v2->_stopWaiter)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    stopWaiter = v2->_stopWaiter;
    v2->_stopWaiter = (OS_dispatch_semaphore *)v5;

    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)waitForeverUntilStopped
{
  if ([(MXMProbe *)self _setupWaitSemaphore])
  {
    stopWaiter = self->_stopWaiter;
    dispatch_semaphore_wait(stopWaiter, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (BOOL)waitUntilStoppedWithTimeout:(double)a3
{
  BOOL v4 = [(MXMProbe *)self _setupWaitSemaphore];
  if (v4) {
    LOBYTE(v4) = dispatch_semaphore_wait((dispatch_semaphore_t)self->_stopWaiter, 0xFFFFFFFFFFFFFFFFLL) != 0;
  }
  return v4;
}

- (id)sampleWithTimeout:(double)a3
{
  return [(MXMProbe *)self sampleWithTimeout:0 stopReason:a3];
}

- (id)sampleWithTimeout:(double)a3 stopReason:(unint64_t *)a4
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__1;
  v27 = __Block_byref_object_dispose__1;
  id v28 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __41__MXMProbe_sampleWithTimeout_stopReason___block_invoke;
  v16[3] = &unk_264525280;
  v18 = &v23;
  int v9 = v8;
  v17 = v9;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __41__MXMProbe_sampleWithTimeout_stopReason___block_invoke_2;
  v15[3] = &unk_2645252A8;
  v15[4] = &v19;
  [(MXMProbe *)self updateNowUntilStoppedWithUpdateHandler:v16 stopHandler:v15];
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  if (!dispatch_semaphore_wait(v9, v10))
  {
    if (!a4) {
      goto LABEL_8;
    }
    unint64_t v11 = v20[3];
    goto LABEL_7;
  }
  [(MXMProbe *)self stopUpdates];
  if ([(MXMProbe *)self waitUntilStoppedWithTimeout:60.0])
  {
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2 object:self file:@"MXMProbe.m" lineNumber:197 description:@"Failed to stop the probe!"];

  if (a4)
  {
LABEL_4:
    unint64_t v11 = 1;
LABEL_7:
    *a4 = v11;
  }
LABEL_8:
  id v12 = (id)v24[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

void __41__MXMProbe_sampleWithTimeout_stopReason___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __41__MXMProbe_sampleWithTimeout_stopReason___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (BOOL)performPreIterationActions
{
  return 1;
}

- (MXMSampleFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void)setUpdateQueue:(id)a3
{
}

- (MXMProbeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MXMProbeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_updating
{
  return self->__updating;
}

- (void)set_updating:(BOOL)a3
{
  self->__updating = a3;
}

- (BOOL)_shouldStop
{
  return self->__shouldStop;
}

- (void)set_shouldStop:(BOOL)a3
{
  self->__shouldStop = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_stopWaiter, 0);
  objc_storeStrong(&self->_stopHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

@end