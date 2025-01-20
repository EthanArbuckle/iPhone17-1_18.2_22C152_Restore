@interface STKSIMToolkitAlertSession
- (STKSIMToolkitAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 event:(int64_t)a5 options:(id)a6 behavior:(id)a7 sound:(id)a8;
- (STKSessionBehavior)behavior;
- (int64_t)event;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)sendResponse:(int64_t)a3 withBOOLResult:(BOOL)a4;
- (void)sendSuccessWithSelectedIndex:(unint64_t)a3;
@end

@implementation STKSIMToolkitAlertSession

- (STKSIMToolkitAlertSession)initWithLogger:(id)a3 responseProvider:(id)a4 event:(int64_t)a5 options:(id)a6 behavior:(id)a7 sound:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v18)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"STKAlertSession.m", 227, @"Invalid parameter not satisfying: %@", @"behavior" object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)STKSIMToolkitAlertSession;
  v20 = [(STKAlertSession *)&v24 initWithLogger:v15 responseProvider:v16 options:v17 sound:v19];
  v21 = v20;
  if (v20)
  {
    v20->_event = a5;
    objc_storeStrong((id *)&v20->_behavior, a7);
  }

  return v21;
}

- (void)sendResponse:(int64_t)a3 withBOOLResult:(BOOL)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__STKSIMToolkitAlertSession_sendResponse_withBOOLResult___block_invoke;
  v4[3] = &unk_2645F4850;
  v4[4] = self;
  v4[5] = a3;
  BOOL v5 = a4;
  _STKWithLock((os_unfair_lock_s *)self, v4);
}

uint64_t __57__STKSIMToolkitAlertSession_sendResponse_withBOOLResult___block_invoke(uint64_t result)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 41))
  {
    uint64_t v2 = result;
    v3 = *(NSObject **)(v1 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      unint64_t v5 = *(void *)(v2 + 40) - 1;
      if (v5 > 6) {
        v6 = @"Success";
      }
      else {
        v6 = off_2645F4948[v5];
      }
      int v7 = *(unsigned __int8 *)(v2 + 48);
      *(_DWORD *)v9 = 134218498;
      *(void *)&v9[4] = v4;
      *(_WORD *)&v9[12] = 2114;
      *(void *)&v9[14] = v6;
      *(_WORD *)&v9[22] = 1024;
      LODWORD(v10) = v7;
      v8 = v3;
      _os_log_impl(&dword_221DC0000, v8, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending response with type: %{public}@ - BOOL result: %d", v9, 0x1Cu);
    }
    return objc_msgSend(*(id *)(*(void *)(v2 + 32) + 16), "sendResponse:withBOOLResult:", *(void *)(v2 + 40), *(unsigned __int8 *)(v2 + 48), *(_OWORD *)v9, *(void *)&v9[16], v10);
  }
  return result;
}

- (void)sendSuccessWithSelectedIndex:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__STKSIMToolkitAlertSession_sendSuccessWithSelectedIndex___block_invoke;
  v3[3] = &unk_2645F43C0;
  v3[4] = self;
  v3[5] = a3;
  _STKWithLock((os_unfair_lock_s *)self, v3);
}

uint64_t __58__STKSIMToolkitAlertSession_sendSuccessWithSelectedIndex___block_invoke(uint64_t result)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 41))
  {
    uint64_t v2 = result;
    v3 = *(NSObject **)(v1 + 48);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(v2 + 32);
      uint64_t v5 = *(void *)(v2 + 40);
      int v6 = 134218498;
      uint64_t v7 = v4;
      __int16 v8 = 2114;
      v9 = @"Success";
      __int16 v10 = 2048;
      uint64_t v11 = v5;
      _os_log_impl(&dword_221DC0000, v3, OS_LOG_TYPE_DEFAULT, "Session <%p> - Sending response with type: %{public}@ - index result: %lu", (uint8_t *)&v6, 0x20u);
    }
    return [*(id *)(*(void *)(v2 + 32) + 16) sendSuccessWithSelectedIndex:*(void *)(v2 + 40)];
  }
  return result;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)STKSIMToolkitAlertSession;
  [(STKAlertSession *)&v7 remoteAlertHandleDidActivate:a3];
  logger = self->super._logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = self;
    _os_log_impl(&dword_221DC0000, logger, OS_LOG_TYPE_DEFAULT, "Session <%p> - UI was presented.", buf, 0xCu);
  }
  uint64_t v5 = [(STKSIMToolkitAlertSession *)self behavior];
  int v6 = [v5 shouldSendResponseUponDisplay];

  if (v6) {
    [(STKAlertSession *)self sendResponse:0];
  }
}

- (int64_t)event
{
  return self->_event;
}

- (STKSessionBehavior)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
}

@end