@interface STKAlertSession
+ (BOOL)_requiresResponseProvider;
- (BOOL)hasSentResponse;
- (NSDictionary)options;
- (SBSRemoteAlertHandle)alertHandle;
- (STKAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6;
- (STKSessionAction)alertAction;
- (STKSound)sound;
- (void)_lock_sendResponse:(int64_t)a3;
- (void)dealloc;
- (void)invalidate;
- (void)presentRemoteAlertHandle:(id)a3 withAction:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)sendResponse:(int64_t)a3;
- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4;
- (void)setSound:(id)a3;
@end

@implementation STKAlertSession

- (STKAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 options:(id)a5 sound:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  int v16 = [(id)objc_opt_class() _requiresResponseProvider];
  if (!v13 && v16)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"STKAlertSession.m", 87, @"Invalid parameter not satisfying: %@", @"responseProvider" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
LABEL_9:
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"STKAlertSession.m", 89, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v14) {
    goto LABEL_9;
  }
LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)STKAlertSession;
  v17 = [(STKAlertSession *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_logger, a3);
    v18->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_responseProvider, a4);
    objc_storeStrong((id *)&v18->_options, a5);
    objc_storeStrong((id *)&v18->_sound, a6);
    logger = v18->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = v18;
      _os_log_impl(&dword_221DC0000, logger, OS_LOG_TYPE_DEFAULT, "Session <%p> - Created", buf, 0xCu);
    }
  }

  return v18;
}

- (void)dealloc
{
  if (!self->_invalidated)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"STKAlertSession.m" lineNumber:104 description:@"Cannot deallocate an alert session unless it was explicitly invalidated."];
  }
  v5.receiver = self;
  v5.super_class = (Class)STKAlertSession;
  [(STKAlertSession *)&v5 dealloc];
}

- (SBSRemoteAlertHandle)alertHandle
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__STKAlertSession_alertHandle__block_invoke;
  v4[3] = &unk_2645F4890;
  v4[4] = self;
  v4[5] = &v5;
  _STKWithLock((os_unfair_lock_s *)self, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SBSRemoteAlertHandle *)v2;
}

void __30__STKAlertSession_alertHandle__block_invoke(uint64_t a1)
{
}

- (void)presentRemoteAlertHandle:(id)a3 withAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__STKAlertSession_presentRemoteAlertHandle_withAction___block_invoke;
  v11[3] = &unk_2645F44D0;
  v11[4] = self;
  id v12 = v8;
  id v13 = v7;
  SEL v14 = a2;
  id v9 = v7;
  id v10 = v8;
  _STKWithLock((os_unfair_lock_s *)self, v11);
}

void __55__STKAlertSession_presentRemoteAlertHandle_withAction___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 41))
  {
    v3 = *(NSObject **)(v2 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v4;
      _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "Session <%p> - Attempted to present an already invalidated session.  Ignoring.", buf, 0xCu);
    }
    uint64_t v5 = *(void **)(a1 + 48);
    if (v5) {
      [v5 invalidate];
    }
    v6 = *(void **)(a1 + 40);
    if (v6)
    {
      id v7 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __55__STKAlertSession_presentRemoteAlertHandle_withAction___block_invoke_88;
      block[3] = &unk_2645F4458;
      id v12 = v6;
      dispatch_async(v7, block);
    }
  }
  else
  {
    if (*(void *)(v2 + 24))
    {
      id v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"STKAlertSession.m" lineNumber:120 description:@"Cannot set multiple alert handles for a given session."];

      uint64_t v2 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v2 + 32), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addObserver:");
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v14 = v9;
      _os_log_impl(&dword_221DC0000, v8, OS_LOG_TYPE_DEFAULT, "Session <%p> - Presenting remote alert", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) activateWithContext:0];
  }
}

uint64_t __55__STKAlertSession_presentRemoteAlertHandle_withAction___block_invoke_88(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (BOOL)hasSentResponse
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __34__STKAlertSession_hasSentResponse__block_invoke;
  v4[3] = &unk_2645F4890;
  v4[4] = self;
  v4[5] = &v5;
  _STKWithLock((os_unfair_lock_s *)self, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __34__STKAlertSession_hasSentResponse__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) hasSentResponse];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)invalidate
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __29__STKAlertSession_invalidate__block_invoke;
  v2[3] = &unk_2645F4458;
  v2[4] = self;
  _STKWithLock((os_unfair_lock_s *)self, v2);
}

void __29__STKAlertSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 41))
  {
    v3 = *(NSObject **)(v1 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      uint64_t v13 = v4;
      _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "Session <%p> - Invalidated", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 64) stopSound];
    if (([*(id *)(*(void *)(a1 + 32) + 16) hasSentResponse] & 1) == 0) {
      objc_msgSend(*(id *)(a1 + 32), "_lock_sendResponse:", 1);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 41) = 1;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeObserver:");
    [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
    id v5 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0;

    char v8 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__STKAlertSession_invalidate__block_invoke_89;
    block[3] = &unk_2645F4458;
    id v11 = v5;
    id v9 = v5;
    dispatch_async(v8, block);
  }
}

uint64_t __29__STKAlertSession_invalidate__block_invoke_89(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)sendResponse:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__STKAlertSession_sendResponse___block_invoke;
  v3[3] = &unk_2645F43C0;
  v3[4] = self;
  v3[5] = a3;
  _STKWithLock((os_unfair_lock_s *)self, v3);
}

uint64_t __32__STKAlertSession_sendResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_sendResponse:", *(void *)(a1 + 40));
}

- (void)sendResponse:(int64_t)a3 withStringResult:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__STKAlertSession_sendResponse_withStringResult___block_invoke;
  v8[3] = &unk_2645F43E8;
  id v9 = v6;
  int64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  _STKWithLock((os_unfair_lock_s *)self, v8);
}

uint64_t __49__STKAlertSession_sendResponse_withStringResult___block_invoke(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 41))
  {
    char v2 = (void *)result;
    v3 = *(NSObject **)(v1 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v2[4];
      unint64_t v5 = v2[6] - 1;
      if (v5 > 6) {
        id v6 = @"Success";
      }
      else {
        id v6 = off_2645F4948[v5];
      }
      uint64_t v7 = *(void *)(v2[4] + 16);
      *(_DWORD *)id v9 = 134218498;
      *(void *)&v9[4] = v4;
      *(_WORD *)&v9[12] = 2114;
      *(void *)&v9[14] = v6;
      *(_WORD *)&v9[22] = 2112;
      uint64_t v10 = v7;
      char v8 = v3;
      _os_log_impl(&dword_221DC0000, v8, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending response with type: %{public}@ - string result: <redacted> (responsProvider: %@)", v9, 0x20u);
    }
    return objc_msgSend(*(id *)(v2[4] + 16), "sendResponse:withStringResult:", v2[6], v2[5], *(_OWORD *)v9, *(void *)&v9[16], v10);
  }
  return result;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3 = [(STKAlertSession *)self sound];
  [v3 playSound];
}

+ (BOOL)_requiresResponseProvider
{
  return 1;
}

- (void)_lock_sendResponse:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_invalidated)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) > 6) {
        id v6 = @"Success";
      }
      else {
        id v6 = off_2645F4948[a3 - 1];
      }
      *(_DWORD *)char v8 = 134218242;
      *(void *)&v8[4] = self;
      *(_WORD *)&v8[12] = 2114;
      *(void *)&v8[14] = v6;
      uint64_t v7 = logger;
      _os_log_impl(&dword_221DC0000, v7, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending response with type: %{public}@", v8, 0x16u);
    }
    -[STKAlertSessionResponseProvider sendResponse:](self->_responseProvider, "sendResponse:", a3, *(_OWORD *)v8, *(void *)&v8[16], v9);
  }
}

- (NSDictionary)options
{
  return self->_options;
}

- (STKSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (STKSessionAction)alertAction
{
  return self->_alertAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_alertAction, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);

  objc_storeStrong((id *)&self->_responseProvider, 0);
}

@end