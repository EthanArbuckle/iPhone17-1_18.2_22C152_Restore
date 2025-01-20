@interface SESSession
- (SESSession)init;
- (id)endRemoteSession;
- (id)proxy;
- (id)queue;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)state;
- (void)dealloc;
- (void)didEndUnexpectedly:(id)a3;
- (void)didStartSession:(id)a3;
- (void)endSession;
- (void)endSessionWithError:(id)a3;
- (void)resume;
- (void)setDidEndCallback:(id)a3;
- (void)setDidStartCallback:(id)a3;
- (void)setProxy:(id)a3;
@end

@implementation SESSession

- (SESSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)SESSession;
  v2 = [(SESSession *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->state = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.seserviced.session.queue", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

    dispatch_suspend((dispatch_object_t)v3->_queue);
    v3->_isQueueSuspended = 1;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->state != 2)
  {
    v3 = SESDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      unint64_t state = self->state;
      *(_DWORD *)buf = 134217984;
      unint64_t v7 = state;
      _os_log_impl(&dword_2146ED000, v3, OS_LOG_TYPE_INFO, "Deallocating session in state %lu", buf, 0xCu);
    }
  }
  if (self->_isQueueSuspended) {
    dispatch_resume((dispatch_object_t)self->_queue);
  }
  v5.receiver = self;
  v5.super_class = (Class)SESSession;
  [(SESSession *)&v5 dealloc];
}

- (void)resume
{
  if (self->_isQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_queue);
    self->_isQueueSuspended = 0;
  }
}

- (id)queue
{
  return self->_queue;
}

- (void)setDidStartCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SESSession_setDidStartCallback___block_invoke;
  v7[3] = &unk_264219AC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __34__SESSession_setDidStartCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x270F9A758]();
}

- (void)setDidEndCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__SESSession_setDidEndCallback___block_invoke;
  v7[3] = &unk_264219AC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __32__SESSession_setDidEndCallback___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x270F9A758]();
}

- (void)didStartSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__SESSession_didStartSession___block_invoke;
  v7[3] = &unk_264219888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __30__SESSession_didStartSession___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = SESDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v14 = 138412290;
    uint64_t v15 = v3;
    _os_log_impl(&dword_2146ED000, v2, OS_LOG_TYPE_INFO, "didStartSession %@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 48))
  {
    if (!*(void *)(a1 + 40))
    {
      *(void *)(v4 + 48) = 1;
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 24);
      if (!v11) {
        return;
      }
      (*(void (**)(void))(v11 + 16))();
      uint64_t v10 = 24;
      goto LABEL_11;
    }
    *(void *)(v4 + 48) = 2;
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(v5 + 24);
    if (v6)
    {
      (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, 0, *(void *)(a1 + 40));
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 24);
      *(void *)(v7 + 24) = 0;

      uint64_t v5 = *(void *)(a1 + 32);
    }
    uint64_t v9 = *(void *)(v5 + 32);
    if (v9)
    {
      (*(void (**)(void))(v9 + 16))();
      uint64_t v10 = 32;
LABEL_11:
      uint64_t v12 = *(void *)(a1 + 32);
      v13 = *(void **)(v12 + v10);
      *(void *)(v12 + v10) = 0;
    }
  }
}

- (void)endSession
{
}

- (void)endSessionWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SESSession_endSessionWithError___block_invoke;
  v7[3] = &unk_264219888;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __34__SESSession_endSessionWithError___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = SESDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    _os_log_impl(&dword_2146ED000, v2, OS_LOG_TYPE_INFO, "endSession %@ with error %@", buf, 0x16u);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[6];
  if (v6 != 2)
  {
    if (!v6)
    {
      uint64_t v7 = v5[3];
      if (v7)
      {
        if (*(void *)(a1 + 40))
        {
          (*(void (**)(void, void))(v7 + 16))(v5[3], 0);
        }
        else
        {
          id v8 = SESDefaultLogObject();
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v9 = SESCreateAndLogError();
          (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v9);
        }
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v11 = *(void **)(v10 + 24);
        *(void *)(v10 + 24) = 0;

        uint64_t v5 = *(void **)(a1 + 32);
      }
    }
    uint64_t v12 = objc_msgSend(v5, "endRemoteSession", v18);
    if (v12)
    {
      v13 = SESDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_impl(&dword_2146ED000, v13, OS_LOG_TYPE_ERROR, "Failed to end remote session %@", buf, 0xCu);
      }
    }
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(v14 + 32);
    if (v15)
    {
      (*(void (**)(void))(v15 + 16))();
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(v16 + 32);
      *(void *)(v16 + 32) = 0;

      uint64_t v14 = *(void *)(a1 + 32);
    }
    *(void *)(v14 + 48) = 2;
  }
}

- (id)endRemoteSession
{
  uint64_t v3 = [(SESSession *)self proxy];

  if (v3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__5;
    v13 = __Block_byref_object_dispose__5;
    id v14 = 0;
    uint64_t v4 = [(SESSession *)self proxy];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __30__SESSession_endRemoteSession__block_invoke;
    v8[3] = &unk_2642194D8;
    v8[4] = &v9;
    uint64_t v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v8];
    [v5 endSession:&__block_literal_global_4];

    [(SESSession *)self setProxy:0];
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void __30__SESSession_endRemoteSession__block_invoke(uint64_t a1, void *a2)
{
}

- (void)didEndUnexpectedly:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SESDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_2146ED000, v5, OS_LOG_TYPE_ERROR, "Session %@ ended unexpectedly with error %@", (uint8_t *)&v6, 0x16u);
  }

  [(SESSession *)self endSession];
}

- (id)proxy
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProxy:(id)a3
{
  id v4 = (SESSessionInterface *)a3;
  obj = self;
  objc_sync_enter(obj);
  proxy = obj->_proxy;
  obj->_proxy = v4;

  objc_sync_exit(obj);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(SESSession *)self proxy];
  int v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  if (!v6)
  {
    uint64_t v7 = SESDefaultLogObject();
    __int16 v8 = SESCreateAndLogError();
    v4[2](v4, v8);
  }
  return v6;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(SESSession *)self proxy];
  int v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  if (!v6)
  {
    uint64_t v7 = SESDefaultLogObject();
    __int16 v8 = SESCreateAndLogError();
    v4[2](v4, v8);
  }
  return v6;
}

- (unint64_t)state
{
  return self->state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong(&self->_didEndCallback, 0);
  objc_storeStrong(&self->_didStartCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end