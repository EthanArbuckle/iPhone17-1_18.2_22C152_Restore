@interface PKSharingChannelHandleMessageWaiter
- (PKSharingChannelHandleMessageWaiter)initWithTimeout:(double)a3 messageHandler:(id)a4 invalidationHandler:(id)a5 replyQueue:(id)a6;
- (void)_endTimeoutTimer;
- (void)_invalidateWithShouldNotify:(BOOL)a3 fromTimeout:(BOOL)a4;
- (void)_messageReceived;
- (void)_startTimeoutTimer;
- (void)startForHandle:(id)a3;
@end

@implementation PKSharingChannelHandleMessageWaiter

- (PKSharingChannelHandleMessageWaiter)initWithTimeout:(double)a3 messageHandler:(id)a4 invalidationHandler:(id)a5 replyQueue:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PKSharingChannelHandleMessageWaiter;
  v13 = [(PKSharingChannelHandleMessageWaiter *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_timeout = a3;
    v15 = _Block_copy(v10);
    id messageHandler = v14->_messageHandler;
    v14->_id messageHandler = v15;

    v17 = _Block_copy(v11);
    id invalidationHandler = v14->_invalidationHandler;
    v14->_id invalidationHandler = v17;

    objc_storeStrong((id *)&v14->_replyQueue, a6);
    v14->_lock._os_unfair_lock_opaque = 0;
  }

  return v14;
}

- (void)startForHandle:(id)a3
{
  p_handle = &self->_handle;
  id v5 = a3;
  objc_storeWeak((id *)p_handle, v5);
  [(PKSharingChannelHandleMessageWaiter *)self _startTimeoutTimer];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PKSharingChannelHandleMessageWaiter_startForHandle___block_invoke;
  v7[3] = &unk_1E56D8AE0;
  v7[4] = self;
  [v5 setInvalidationHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PKSharingChannelHandleMessageWaiter_startForHandle___block_invoke_2;
  v6[3] = &unk_1E56D8AE0;
  v6[4] = self;
  [v5 setMessageReceivedHandler:v6];
}

uint64_t __54__PKSharingChannelHandleMessageWaiter_startForHandle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithShouldNotify:1 fromTimeout:0];
}

uint64_t __54__PKSharingChannelHandleMessageWaiter_startForHandle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _messageReceived];
}

- (void)_messageReceived
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = _Block_copy(self->_messageHandler);
  id v5 = v4;
  if (self->_isHandlingMessage || (!self->_isPendingInvalidation ? (BOOL v6 = v4 == 0) : (BOOL v6 = 1), v6))
  {
    int v11 = 0;
  }
  else
  {
    int v11 = 1;
    self->_isHandlingMessage = 1;
  }
  os_unfair_lock_unlock(p_lock);
  objc_initWeak(&location, self);
  uint64_t v19 = 0;
  objc_super v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__73;
  v23 = __Block_byref_object_dispose__73;
  id v24 = 0;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke;
  v15 = &unk_1E56F2840;
  objc_copyWeak(&v18, &location);
  id v7 = v5;
  id v16 = v7;
  v17 = &v19;
  v8 = (void (**)(void))_Block_copy(&v12);
  uint64_t v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
  id v10 = (void *)v20[5];
  v20[5] = v9;

  if (v11) {
    v8[2](v8);
  }

  objc_destroyWeak(&v18);
  _Block_object_dispose(&v19, 8);

  objc_destroyWeak(&location);
}

void __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 5);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke_2;
    v8[3] = &unk_1E56F2818;
    objc_copyWeak(&v11, v2);
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = v7;
    [v5 handleOutstandingMessage:v8];

    objc_destroyWeak(&v11);
  }
}

void __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _endTimeoutTimer];

    uint64_t v9 = *(void *)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke_3;
    v12[3] = &unk_1E56F27F0;
    objc_copyWeak(&v15, (id *)(a1 + 48));
    id v10 = v7;
    uint64_t v11 = *(void *)(a1 + 40);
    id v13 = v10;
    uint64_t v14 = v11;
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v5, v12);

    objc_destroyWeak(&v15);
  }
  else
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

void __55__PKSharingChannelHandleMessageWaiter__messageReceived__block_invoke_3(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v12 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    os_unfair_lock_lock((os_unfair_lock_t)v12 + 16);
    int v6 = v12[49];
    id v7 = objc_loadWeakRetained((id *)v12 + 5);
    int v8 = [v7 hasOutstandingMessage];

    unsigned __int8 v9 = a3 ^ 1;
    if (v6) {
      unsigned __int8 v9 = 0;
    }
    if (!v8) {
      unsigned __int8 v9 = 0;
    }
    v12[48] = v9;
    os_unfair_lock_unlock((os_unfair_lock_t)v12 + 16);
    if (a3)
    {
      id v10 = v12;
      uint64_t v11 = 0;
    }
    else
    {
      if (!v6)
      {
        if (v8) {
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
        }
        else {
          [v12 _startTimeoutTimer];
        }
        goto LABEL_11;
      }
      id v10 = v12;
      uint64_t v11 = 1;
    }
    [v10 _invalidateWithShouldNotify:v11 fromTimeout:0];
LABEL_11:
    id WeakRetained = v12;
  }
}

- (void)_invalidateWithShouldNotify:(BOOL)a3 fromTimeout:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_isHandlingMessage)
  {
    self->_isPendingInvalidation = 1;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (v5) {
      id v13 = (void (**)(id, BOOL))_Block_copy(self->_invalidationHandler);
    }
    else {
      id v13 = 0;
    }
    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id messageHandler = self->_messageHandler;
    self->_id messageHandler = 0;

    os_unfair_lock_unlock(p_lock);
    p_handle = &self->_handle;
    id WeakRetained = objc_loadWeakRetained((id *)p_handle);
    [WeakRetained setInvalidationHandler:0];

    id v12 = objc_loadWeakRetained((id *)p_handle);
    [v12 setMessageReceivedHandler:0];

    if (v13)
    {
      v13[2](v13, v4);
    }
  }
}

- (void)_startTimeoutTimer
{
  if (self->_timeout > 0.0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    timer = self->_timer;
    if (timer) {
      dispatch_source_cancel(timer);
    }
    dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_replyQueue);
    objc_storeStrong((id *)&self->_timer, v5);
    os_unfair_lock_unlock(p_lock);
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    objc_initWeak(&location, self);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __57__PKSharingChannelHandleMessageWaiter__startTimeoutTimer__block_invoke;
    handler[3] = &unk_1E56D9150;
    objc_copyWeak(&v10, &location);
    dispatch_source_t v9 = v5;
    id v7 = v5;
    dispatch_source_set_event_handler(v7, handler);
    dispatch_resume(v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__PKSharingChannelHandleMessageWaiter__startTimeoutTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[7];
    if (v3 == *(void **)(a1 + 32))
    {
      WeakRetained[7] = 0;
      id v4 = WeakRetained;

      [v4 _invalidateWithShouldNotify:1 fromTimeout:1];
      id WeakRetained = v4;
    }
  }
}

- (void)_endTimeoutTimer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    dispatch_source_t v5 = self->_timer;
    self->_timer = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_handle);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
}

@end