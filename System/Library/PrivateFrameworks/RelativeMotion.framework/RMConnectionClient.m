@interface RMConnectionClient
- (id)initWithQueue:(void *)a3 serviceName:(void *)a4 messageHandler:;
- (uint64_t)connectionTimerDelay;
- (uint64_t)setConnectionTimerDelay:(uint64_t)result;
- (void)connect;
- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6;
- (void)endpoint:(id)a3 didReceiveStreamedData:(id)a4;
- (void)endpointWasInterrupted:(id)a3;
- (void)endpointWasInvalidated:(id)a3;
- (void)handleDaemonStart;
- (void)invalidate;
- (void)replayCache;
- (void)requestStreamingWithMessage:(void *)a3 data:(void *)a4 callback:;
- (void)sendCachedMessage:(void *)a3 withData:;
- (void)sendMessage:(void *)a3 withData:(void *)a4 reply:;
- (void)setEndpoint:(uint64_t)a1;
- (void)setMessageHandler:(void *)a1;
- (void)stopStreaming;
- (void)stopStreamingInternal;
@end

@implementation RMConnectionClient

- (id)initWithQueue:(void *)a3 serviceName:(void *)a4 messageHandler:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)RMConnectionClient;
    v11 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 4, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_setProperty_nonatomic_copy(a1, v12, v10, 48);
      uint64_t v13 = objc_opt_new();
      id v14 = a1[7];
      a1[7] = (id)v13;

      *((unsigned char *)a1 + 8) = 1;
    }
  }

  return a1;
}

- (void)setMessageHandler:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
  }
}

- (void)replayCache
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v2 = *(id *)(a1 + 56);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (!v3)
    {
      v5 = (id *)v2;
LABEL_31:

      return;
    }
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * v7);
        if (v8 && *(void *)(v8 + 24))
        {
          id v9 = (id *)(id)v8;
          id v10 = v5;
          v5 = v9;
        }
        else
        {
          if (onceToken_ConnectionClient_Default != -1) {
            dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
          }
          v11 = (void *)logObject_ConnectionClient_Default;
          if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
          {
            if (v8) {
              uint64_t v12 = *(void *)(v8 + 8);
            }
            else {
              uint64_t v12 = 0;
            }
            *(_DWORD *)buf = 138412290;
            uint64_t v28 = v12;
            uint64_t v13 = v11;
            _os_log_impl(&dword_23673D000, v13, OS_LOG_TYPE_DEFAULT, "Sending cached message %@", buf, 0xCu);
          }
          id v14 = *(void **)(a1 + 16);
          if (v8)
          {
            id v15 = *(id *)(v8 + 8);
            objc_super v16 = *(void **)(v8 + 16);
          }
          else
          {
            id v15 = 0;
            objc_super v16 = 0;
          }
          id v10 = v14;
          -[RMConnectionEndpoint sendMessage:withData:]((uint64_t)v10, v15, v16);
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v17 = [v2 countByEnumeratingWithState:&v23 objects:v29 count:16];
      uint64_t v4 = v17;
    }
    while (v17);

    if (v5)
    {
      if (onceToken_ConnectionClient_Default != -1) {
        dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
      }
      v18 = logObject_ConnectionClient_Default;
      if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23673D000, v18, OS_LOG_TYPE_DEFAULT, "Restoring the streaming channel", buf, 2u);
      }
      id v19 = v5[1];
      id v20 = v5[3];
      id v21 = v5[2];
      id v22 = v19;
      -[RMConnectionClient requestStreamingWithMessage:data:callback:](a1, v22, v21, v20);

      goto LABEL_31;
    }
  }
}

- (void)requestStreamingWithMessage:(void *)a3 data:(void *)a4 callback:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_4;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!*(void *)(a1 + 40))
  {
    objc_setProperty_nonatomic_copy((id)a1, v10, v9, 40);
    uint64_t v11 = *(void *)(a1 + 16);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __64__RMConnectionClient_requestStreamingWithMessage_data_callback___block_invoke;
    id v19 = &unk_264CACC30;
    uint64_t v20 = a1;
    id v12 = v9;
    id v21 = v12;
    -[RMConnectionEndpoint requestStreamWithMessage:data:errorHandler:](v11, v7, v8, &v16);
    id v13 = *(id *)(a1 + 56);
    id v14 = -[RMConnectionClientCachedMessage initWithName:data:streamingCallback:]((id *)[RMConnectionClientCachedMessage alloc], v7, v8, v12);
    objc_msgSend(v13, "addObject:", v14, v16, v17, v18, v19, v20);

LABEL_4:
    return;
  }
  uint64_t v15 = -[RMConnectionClient requestStreamingWithMessage:data:callback:]();
  -[RMConnectionClient connect](v15);
}

- (void)connect
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (*(unsigned char *)(a1 + 8))
    {
      if (*(void *)(a1 + 16))
      {
        -[RMConnectionEndpoint setDataDelegate:](*(id **)(a1 + 16), 0);
        -[RMConnectionEndpoint setConnectionDelegate:](*(id **)(a1 + 16), 0);
        -[RMConnectionEndpoint invalidate](*(void *)(a1 + 16));
        id v2 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = 0;
      }
      id v3 = *(id *)(a1 + 24);
      xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v3 UTF8String], *(dispatch_queue_t *)(a1 + 32), 0);

      uint64_t v4 = [RMConnectionEndpoint alloc];
      id v5 = *(id *)(a1 + 32);
      uint64_t v6 = -[RMConnectionEndpoint initWithConnection:queue:]((id *)&v4->super.isa, mach_service, v5);
      id v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      -[RMConnectionEndpoint setConnectionDelegate:](*(id **)(a1 + 16), (void *)a1);
      -[RMConnectionEndpoint setDataDelegate:](*(id **)(a1 + 16), (void *)a1);
      -[RMConnectionEndpoint start](*(void *)(a1 + 16));
    }
    else
    {
      if (onceToken_ConnectionClient_Default != -1) {
        dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
      }
      id v8 = logObject_ConnectionClient_Default;
      if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23673D000, v8, OS_LOG_TYPE_FAULT, "Trying to connect after invalidation", buf, 2u);
      }
    }
  }
}

- (void)setEndpoint:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)sendMessage:(void *)a3 withData:(void *)a4 reply:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    uint64_t v10 = *(void *)(a1 + 16);
    if (v9) {
      -[RMConnectionEndpoint sendMessage:withData:reply:](v10, v7, v8, v9);
    }
    else {
      -[RMConnectionEndpoint sendMessage:withData:](v10, v7, v8);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = *(id *)(a1 + 56);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      int v14 = 0;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        int v17 = v14 + v13;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
          if (v18) {
            id v19 = *(void **)(v18 + 8);
          }
          else {
            id v19 = 0;
          }
          if (objc_msgSend(v19, "isEqualToString:", v7, (void)v21))
          {

            [*(id *)(a1 + 56) removeObjectAtIndex:(v14 + v16)];
            goto LABEL_19;
          }
          ++v16;
        }
        while (v13 != v16);
        uint64_t v20 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v13 = v20;
        int v14 = v17;
      }
      while (v20);
    }
  }
LABEL_19:
}

- (void)sendCachedMessage:(void *)a3 withData:
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    -[RMConnectionClient sendMessage:withData:reply:](a1, v6, v5, 0);
    id v7 = *(id *)(a1 + 56);
    id v8 = -[RMConnectionClientCachedMessage initWithName:data:]((id *)[RMConnectionClientCachedMessage alloc], v6, v5);

    [v7 addObject:v8];
  }
}

void __64__RMConnectionClient_requestStreamingWithMessage_data_callback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[RMConnectionClient stopStreamingInternal](*(void *)(a1 + 32));
  if ([v3 code] == -3
    && ((uint64_t v4 = *(void *)(a1 + 32)) == 0 ? (v5 = 0) : (v5 = *(void *)(v4 + 16)), -[RMConnectionEndpoint isValid](v5)))
  {
    if (onceToken_ConnectionClient_Default != -1) {
      dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
    }
    id v6 = logObject_ConnectionClient_Default;
    if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_23673D000, v6, OS_LOG_TYPE_DEFAULT, "#Warning The streaming connection has been interrupted", v7, 2u);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)stopStreamingInternal
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    id v2 = *(id *)(a1 + 40);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 16);

      if (v3)
      {
        if (onceToken_ConnectionClient_Default != -1) {
          dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
        }
        uint64_t v4 = logObject_ConnectionClient_Default;
        if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)id v6 = 0;
          _os_log_impl(&dword_23673D000, v4, OS_LOG_TYPE_DEBUG, "Stopping the streaming session", v6, 2u);
        }
        -[RMConnectionEndpoint stopReceivingStream](*(void *)(a1 + 16));
        objc_setProperty_nonatomic_copy((id)a1, v5, 0, 40);
      }
    }
  }
}

- (void)stopStreaming
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    -[RMConnectionClient stopStreamingInternal](a1);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v2 = *(id *)(a1 + 56);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      int v5 = 0;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        uint64_t v7 = 0;
        int v8 = v5 + v4;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          if (v9) {
            uint64_t v9 = *(void *)(v9 + 24);
          }
          if (v9)
          {

            objc_msgSend(*(id *)(a1 + 56), "removeObjectAtIndex:", (v5 + v7), (void)v10);
            return;
          }
          ++v7;
        }
        while (v4 != v7);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        int v5 = v8;
        if (v4) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)invalidate
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    *(unsigned char *)(a1 + 8) = 0;
    if (*(void *)(a1 + 64))
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
      id v2 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = 0;
    }
    [*(id *)(a1 + 56) removeAllObjects];
    objc_setProperty_nonatomic_copy((id)a1, v3, 0, 48);
    -[RMConnectionClient stopStreaming](a1);
    -[RMConnectionEndpoint invalidate](*(void *)(a1 + 16));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;
  }
}

- (void)handleDaemonStart
{
  if (a1)
  {
    if (onceToken_ConnectionClient_Default != -1) {
      dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
    }
    id v2 = logObject_ConnectionClient_Default;
    if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23673D000, v2, OS_LOG_TYPE_DEBUG, "Reconnection attempt", buf, 2u);
    }
    if (!*(void *)(a1 + 16))
    {
      -[RMConnectionClient connect](a1);
      -[RMConnectionClient replayCache](a1);
      -[RMConnectionEndpoint connection](*(id **)(a1 + 16));
      SEL v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      barrier[0] = MEMORY[0x263EF8330];
      barrier[1] = 3221225472;
      barrier[2] = __39__RMConnectionClient_handleDaemonStart__block_invoke;
      barrier[3] = &unk_264CACA08;
      barrier[4] = a1;
      xpc_connection_send_barrier(v3, barrier);
    }
  }
}

void __39__RMConnectionClient_handleDaemonStart__block_invoke(uint64_t a1)
{
  isa = *(NSObject **)(a1 + 32);
  if (isa) {
    isa = isa[4].isa;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__RMConnectionClient_handleDaemonStart__block_invoke_2;
  block[3] = &unk_264CACA08;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(isa, block);
}

void __39__RMConnectionClient_handleDaemonStart__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v2 = *(void *)(v2 + 16);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    -[RMConnectionEndpoint setPriorityBoostReplyMessage:](v3, 0);
  }
  else
  {
    if (v3)
    {
      *(void *)(v3 + 72) *= 2;
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4)
      {
        if (*(void *)(v4 + 72) >= 0x81uLL) {
          *(void *)(v4 + 72) = 128;
        }
      }
    }
    if (onceToken_ConnectionClient_Default != -1) {
      dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
    }
    int v5 = logObject_ConnectionClient_Default;
    if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        uint64_t v6 = *(void *)(v6 + 72);
      }
      int v12 = 134217984;
      uint64_t v13 = v6;
      _os_log_impl(&dword_23673D000, v5, OS_LOG_TYPE_DEBUG, "Connection stil invalid, next reconnection attempt will be in %lu seconds", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7) {
      uint64_t v7 = (void *)v7[8];
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      int64_t v9 = 1000000000 * *(void *)(v8 + 72);
    }
    else {
      int64_t v9 = 0;
    }
    long long v10 = v7;
    dispatch_time_t v11 = dispatch_time(0, v9);
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (uint64_t)connectionTimerDelay
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)setConnectionTimerDelay:(uint64_t)result
{
  if (result) {
    *(void *)(result + 72) = a2;
  }
  return result;
}

- (void)endpointWasInterrupted:(id)a3
{
  int v5 = (RMConnectionEndpoint *)a3;
  if (!self) {
    goto LABEL_8;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  for (i = self->_endpoint; i != v5; i = 0)
  {
    -[RMConnectionClient endpointWasInterrupted:]();
LABEL_8:
    dispatch_assert_queue_V2(0);
  }
  -[RMConnectionClient stopStreamingInternal]((uint64_t)self);
  -[RMConnectionClient replayCache]((uint64_t)self);
}

- (void)endpointWasInvalidated:(id)a3
{
  uint64_t v4 = (id *)a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    endpoint = self->_endpoint;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    endpoint = 0;
  }
  if (endpoint != (RMConnectionEndpoint *)v4)
  {
    -[RMConnectionClient endpointWasInvalidated:]();
LABEL_13:
    dispatch_once(&onceToken_ConnectionClient_Default, &__block_literal_global_3);
    goto LABEL_8;
  }
  -[RMConnectionClient stopStreamingInternal]((uint64_t)self);
  -[RMConnectionEndpoint setDataDelegate:](v4, 0);
  -[RMConnectionEndpoint setConnectionDelegate:](v4, 0);
  -[RMConnectionClient setEndpoint:]((uint64_t)self, 0);
  if (!self || !self->_valid || self->_connectionTimer) {
    goto LABEL_11;
  }
  if (onceToken_ConnectionClient_Default != -1) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v6 = logObject_ConnectionClient_Default;
  if (os_log_type_enabled((os_log_t)logObject_ConnectionClient_Default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23673D000, v6, OS_LOG_TYPE_DEBUG, "Connection invalidated, setting up the reconnection timer", buf, 2u);
  }
  uint64_t v7 = self->_queue;
  dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v7);
  -[RMConnectionEndpoint setPriorityBoostReplyMessage:]((uint64_t)self, v8);

  self->_connectionTimerDelay = 4;
  int64_t v9 = self->_connectionTimer;
  dispatch_time_t v10 = dispatch_time(0, 4000000000);
  dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);

  connectionTimer = self->_connectionTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __45__RMConnectionClient_endpointWasInvalidated___block_invoke;
  handler[3] = &unk_264CACA08;
  handler[4] = self;
  dispatch_source_set_event_handler(connectionTimer, handler);
  dispatch_resume((dispatch_object_t)self->_connectionTimer);
LABEL_11:
}

void __45__RMConnectionClient_endpointWasInvalidated___block_invoke(uint64_t a1)
{
}

- (void)endpoint:(id)a3 didReceiveStreamedData:(id)a4
{
  if (self) {
    self = (RMConnectionClient *)self->_streamingDataCallback;
  }
  ((void (*)(RMConnectionClient *, id, void))self->_endpoint)(self, a4, 0);
}

- (void)endpoint:(id)a3 didReceiveMessage:(id)a4 withData:(id)a5 replyBlock:(id)a6
{
  if (self) {
    self = (RMConnectionClient *)self->_messageHandler;
  }
  ((void (*)(RMConnectionClient *, id, id, id))self->_endpoint)(self, a4, a5, a6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_messageCache, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong(&self->_streamingDataCallback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

- (uint64_t)requestStreamingWithMessage:data:callback:.cold.1()
{
  v0 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_23673D000, v1, v2, "{\"msg%{public}.0s\":\"Stream requested while one is already present\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v22, v23, v24, v25, v26);
  }

  uint64_t v7 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_signpost_enabled(v7))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_23673D000, v8, v9, v10, "Stream requested while one is already present", "{\"msg%{public}.0s\":\"Stream requested while one is already present\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v22, v23, v24, v25, v26);
  }

  uint64_t v13 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_23673D000, v14, v15, "{\"msg%{public}.0s\":\"Stream requested while one is already present\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v22, v23, v24, v25, v26);
  }

  uint64_t v20 = abort_report_np();
  return -[RMConnectionClient endpointWasInterrupted:](v20);
}

- (uint64_t)endpointWasInterrupted:.cold.1()
{
  v0 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_23673D000, v1, v2, "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v22, v23, v24, v25, v26);
  }

  uint64_t v7 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_signpost_enabled(v7))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_23673D000, v8, v9, v10, "Received interruption event for an unmanaged endpoint", "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v22, v23, v24, v25, v26);
  }

  uint64_t v13 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_23673D000, v14, v15, "{\"msg%{public}.0s\":\"Received interruption event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v22, v23, v24, v25, v26);
  }

  uint64_t v20 = abort_report_np();
  return -[RMConnectionClient endpointWasInvalidated:](v20);
}

- (uint64_t)endpointWasInvalidated:.cold.1()
{
  v0 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_23673D000, v1, v2, "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, v22, v23, v24, v25, v26);
  }

  uint64_t v7 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_signpost_enabled(v7))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_23673D000, v8, v9, v10, "Received invalidation event for an unmanaged endpoint", "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v11, v12, v22, v23, v24, v25, v26);
  }

  uint64_t v13 = _CLLogObjectForCategory_ConnectionClient_Default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_23673D000, v14, v15, "{\"msg%{public}.0s\":\"Received invalidation event for an unmanaged endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v16, v17, v18, v19, v22, v23, v24, v25, v26);
  }

  uint64_t v20 = abort_report_np();
  return __53__RMDummyDataManager_startReceivingDummyDataUpdates___block_invoke_cold_1(v20);
}

@end