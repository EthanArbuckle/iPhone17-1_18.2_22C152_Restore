@interface RMConnectionEndpoint
- (BOOL)isValid;
- (BOOL)startServingStreamToEndpoint:(void *)a3 error:;
- (id)connection;
- (id)connectionDelegate;
- (id)dataDelegate;
- (id)initWithConnection:(void *)a3 queue:;
- (id)setConnectionDelegate:(id *)result;
- (id)setDataDelegate:(id *)result;
- (uint64_t)messagingConnection;
- (uint64_t)priorityBoostReplyMessage;
- (uint64_t)queue;
- (uint64_t)startServingStreamWithHandler:(uint64_t)a1;
- (void)handleInterruption;
- (void)handleStreamXpcError:(void *)a3 withErrorHandler:;
- (void)handleStreamXpcReply:(void *)a3 withErrorHandler:;
- (void)handleXpcMessage:(void *)a3 replyBlock:;
- (void)invalidate;
- (void)pause;
- (void)requestStreamWithMessage:(void *)a3 data:(void *)a4 errorHandler:;
- (void)sendMessage:(void *)a3 withData:;
- (void)sendMessage:(void *)a3 withData:(void *)a4 reply:;
- (void)setMessagingConnection:(uint64_t)a1;
- (void)setPriorityBoostReplyMessage:(uint64_t)a1;
- (void)setQueue:(uint64_t)a1;
- (void)setStreamingClientConnection:(uint64_t)a1;
- (void)setStreamingServerConnection:(uint64_t)a1;
- (void)start;
- (void)startReceivingStreamOnConnection:(void *)a3 errorHandler:;
- (void)stopReceivingStream;
- (void)stopServingStream;
- (void)wrapReplyToXpcMessage:(void *)a3 withName:(void *)a4 data:;
@end

@implementation RMConnectionEndpoint

- (void)wrapReplyToXpcMessage:(void *)a3 withName:(void *)a4 data:
{
  id v13 = a4;
  if (a1)
  {
    id v7 = a3;
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    id v9 = v7;
    v10 = (const char *)[v9 UTF8String];

    xpc_dictionary_set_string(reply, "kRMConnectionMessageNameKey", v10);
    if (v13)
    {
      id v11 = v13;
      xpc_object_t v12 = xpc_data_create((const void *)[v11 bytes], objc_msgSend(v11, "length"));
      xpc_dictionary_set_value(reply, "kRMConnectionMessageDataKey", v12);
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  }
}

- (uint64_t)messagingConnection
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (BOOL)startServingStreamToEndpoint:(void *)a3 error:
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    BOOL v20 = 0;
    goto LABEL_30;
  }
  if (MEMORY[0x237E03530](v5) != MEMORY[0x263EF8718])
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    id v7 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_23673D000, v7, OS_LOG_TYPE_ERROR, "The client did not send streaming endpoint correctly", (uint8_t *)&v22, 2u);
    }
    BOOL v8 = 0;
    goto LABEL_29;
  }
  WeakRetained = (_xpc_endpoint_s *)objc_loadWeakRetained((id *)(a1 + 24));
  xpc_connection_t v10 = xpc_connection_create_from_endpoint(v6);
  if (v10)
  {
    id v11 = (void **)(a1 + 32);
    objc_storeStrong((id *)(a1 + 32), v10);
    if ((-[RMConnectionEndpoint startServingStreamWithHandler:](a1, WeakRetained) & 1) == 0)
    {
      BOOL v8 = a3 != 0;
      if (a3)
      {
        if (onceToken_IPC_Default != -1) {
          dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
        }
        xpc_object_t v12 = logObject_IPC_Default;
        if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
        {
          int v22 = 138412290;
          v23 = WeakRetained;
          _os_log_impl(&dword_23673D000, v12, OS_LOG_TYPE_ERROR, "Failed to start the streaming with handler %@", (uint8_t *)&v22, 0xCu);
        }
        *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"RMConnectionStreaming" code:-2 userInfo:0];
      }
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      id v13 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_xpc_endpoint_s **)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 32);
        int v22 = 134283777;
        v23 = v14;
        __int16 v24 = 2049;
        uint64_t v25 = v15;
        v16 = v14;
        v17 = v13;
        _os_log_impl(&dword_23673D000, v17, OS_LOG_TYPE_DEFAULT, "Cancelling the streaming server connection %{private}p.%{private}p", (uint8_t *)&v22, 0x16u);
      }
      xpc_connection_cancel(v10);
      v18 = *v11;
      *id v11 = 0;

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (onceToken_IPC_Default != -1) {
    dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
  }
  v19 = logObject_IPC_Default;
  if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
  {
    int v22 = 138412290;
    v23 = v6;
    _os_log_impl(&dword_23673D000, v19, OS_LOG_TYPE_ERROR, "Failed to create connection from endpoint %@", (uint8_t *)&v22, 0xCu);
  }
  if (!a3)
  {
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }
  *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"RMConnectionStreaming" code:-1 userInfo:0];
  BOOL v8 = 1;
LABEL_28:

LABEL_29:
  BOOL v20 = !v8;
LABEL_30:

  return v20;
}

- (id)dataDelegate
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)setStreamingServerConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)startServingStreamWithHandler:(uint64_t)a1
{
  keys[1] = *(char **)MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v3 = *(_xpc_connection_s **)(a1 + 32);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __54__RMConnectionEndpoint_startServingStreamWithHandler___block_invoke;
  handler[3] = &unk_264CACB60;
  handler[4] = a1;
  id v4 = a2;
  xpc_connection_set_event_handler(v3, handler);
  v5 = *(NSObject **)(a1 + 8);
  v6 = (_xpc_connection_s *)*(id *)(a1 + 32);
  xpc_connection_set_target_queue(v6, v5);

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 32));
  xpc_object_t v7 = xpc_string_create("kRMConnectionMessageDataStream");
  keys[0] = "kRMConnectionMessageNameKey";
  id v8 = v7;
  xpc_object_t values = v8;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__RMConnectionEndpoint_startServingStreamWithHandler___block_invoke_80;
  v19[3] = &unk_264CACBB0;
  v19[4] = a1;
  id v10 = v9;
  id v20 = v10;
  uint64_t v11 = [v4 endpoint:a1 shouldStartStreamingDataToReceiver:v19];

  if (onceToken_IPC_Default != -1) {
    dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
  }
  xpc_object_t v12 = (void *)logObject_IPC_Default;
  if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
  {
    id v13 = *(void **)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = "NO";
    if (v11) {
      uint64_t v15 = "YES";
    }
    *(_DWORD *)buf = 134284035;
    v23 = v13;
    __int16 v24 = 2049;
    uint64_t v25 = v14;
    __int16 v26 = 2080;
    v27 = v15;
    id v16 = v13;
    v17 = v12;
    _os_log_impl(&dword_23673D000, v17, OS_LOG_TYPE_DEBUG, "shouldStartStreamingDataToReceiver returned on streaming server connection %{private}p.%{private}p: %s", buf, 0x20u);
  }
  return v11;
}

- (void)handleXpcMessage:(void *)a3 replyBlock:
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v5, "kRMConnectionMessageNameKey"));
    id v8 = (char *)objc_claimAutoreleasedReturnValue();
    xpc_object_t v9 = xpc_dictionary_get_value(v5, "kRMConnectionMessageDataKey");
    id v10 = v9;
    if (v9)
    {
      bytes_ptr = (void *)xpc_data_get_bytes_ptr(v9);
      if (bytes_ptr) {
        bytes_ptr = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:bytes_ptr length:xpc_data_get_length(v10)];
      }
    }
    else
    {
      bytes_ptr = 0;
    }
    uint64_t v12 = xpc_dictionary_get_value(v5, "kRMConnectionRequestSteamingKey");
    id v13 = (void *)v12;
    if (v8)
    {
      if (!v12)
      {
        if (v6)
        {
          v6[2](v6, v8, bytes_ptr);
          goto LABEL_31;
        }
        if ([v8 isEqualToString:@"kRMConnectionMessagePriorityBoost"])
        {
          if (onceToken_IPC_Default != -1) {
            dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
          }
          v30 = logObject_IPC_Default;
          if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v40 = v8;
            _os_log_impl(&dword_23673D000, v30, OS_LOG_TYPE_INFO, "Creating reply to hold onto priority boost: %{private}@", buf, 0xCu);
          }
          xpc_object_t reply = xpc_dictionary_create_reply(v5);
          v32 = *(void **)(a1 + 64);
          *(void *)(a1 + 64) = reply;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            if (onceToken_IPC_Default != -1) {
              dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
            }
            uint64_t v33 = logObject_IPC_Default;
            if (!os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_FAULT)) {
              goto LABEL_31;
            }
            *(_WORD *)buf = 0;
            uint64_t v25 = "Message received but the handler doesn't implement the selector 'endpoint:didReceiveMessage:withData:replyBlock:'";
            __int16 v26 = v33;
            os_log_type_t v27 = OS_LOG_TYPE_FAULT;
            uint32_t v28 = 2;
            goto LABEL_14;
          }
          v35[0] = MEMORY[0x263EF8330];
          v35[1] = 3221225472;
          v35[2] = __52__RMConnectionEndpoint_handleXpcMessage_replyBlock___block_invoke;
          v35[3] = &unk_264CACB38;
          v35[4] = a1;
          id v36 = v5;
          [WeakRetained endpoint:a1 didReceiveMessage:v8 withData:bytes_ptr replyBlock:v35];
          v32 = v36;
        }

        goto LABEL_31;
      }
      uint64_t v14 = [WeakRetained conformsToProtocol:&unk_26E9B2C68];
      if (v14)
      {
        [WeakRetained endpoint:a1 didReceiveStreamingRequest:v8 withData:bytes_ptr];
        id v38 = 0;
        -[RMConnectionEndpoint startServingStreamToEndpoint:error:](a1, v13, &v38);
        id v15 = v38;
        if (v15)
        {
          id v16 = v15;
          id v37 = v15;
          v17 = [MEMORY[0x263F08910] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:&v37];
          v34 = v10;
          v18 = v8;
          v19 = v13;
          id v20 = bytes_ptr;
          id v21 = WeakRetained;
          int v22 = v6;
          id v23 = v37;

          -[RMConnectionEndpoint wrapReplyToXpcMessage:withName:data:](a1, v5, @"kRMConnectionMessageError", v17);
          v6 = v22;
          id WeakRetained = v21;
          bytes_ptr = v20;
          id v13 = v19;
          id v8 = v18;
          id v10 = v34;
        }
        else
        {
          if (onceToken_IPC_Default != -1) {
            dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
          }
          v29 = logObject_IPC_Default;
          if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_23673D000, v29, OS_LOG_TYPE_INFO, "Streaming session started, sending acknowledgement", buf, 2u);
          }
          -[RMConnectionEndpoint wrapReplyToXpcMessage:withName:data:](a1, v5, @"kRMConnectionMessageSuccess", 0);
        }
        goto LABEL_31;
      }
      -[RMConnectionEndpoint handleXpcMessage:replyBlock:](v14);
    }
    else if (onceToken_IPC_Default == -1)
    {
LABEL_12:
      uint64_t v24 = logObject_IPC_Default;
      if (!os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 136315138;
      v40 = "kRMConnectionMessageNameKey";
      uint64_t v25 = "XPC message missing key \"%s\"";
      __int16 v26 = v24;
      os_log_type_t v27 = OS_LOG_TYPE_ERROR;
      uint32_t v28 = 12;
LABEL_14:
      _os_log_impl(&dword_23673D000, v26, v27, v25, buf, v28);
      goto LABEL_31;
    }
    dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    goto LABEL_12;
  }
LABEL_32:
}

- (void)setPriorityBoostReplyMessage:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

void __52__RMConnectionEndpoint_handleXpcMessage_replyBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
}

- (id)initWithConnection:(void *)a3 queue:
{
  v6 = a2;
  xpc_object_t v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)RMConnectionEndpoint;
    id v8 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 7, a2);
      objc_storeStrong(a1 + 1, a3);
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __49__RMConnectionEndpoint_initWithConnection_queue___block_invoke;
      handler[3] = &unk_264CACB60;
      a1 = a1;
      uint64_t v11 = a1;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_set_target_queue(v6, v7);
    }
  }

  return a1;
}

- (void)setMessagingConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setQueue:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

void __49__RMConnectionEndpoint_initWithConnection_queue___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x237E03530]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (v3 == (id)MEMORY[0x263EF86A0])
    {
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      xpc_object_t v9 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          uint64_t v10 = *(void *)(v10 + 56);
        }
        int v12 = 134283521;
        uint64_t v13 = v10;
        uint64_t v11 = v9;
        _os_log_impl(&dword_23673D000, v11, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p interrupted!", (uint8_t *)&v12, 0xCu);
      }
      -[RMConnectionEndpoint handleInterruption](*(void *)(a1 + 32));
    }
    else if (v3 == (id)MEMORY[0x263EF86A8])
    {
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      v6 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (v7) {
          uint64_t v7 = *(void *)(v7 + 56);
        }
        int v12 = 134283521;
        uint64_t v13 = v7;
        id v8 = v6;
        _os_log_impl(&dword_23673D000, v8, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p invalidated!", (uint8_t *)&v12, 0xCu);
      }
      -[RMConnectionEndpoint invalidate](*(void *)(a1 + 32));
    }
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    -[RMConnectionEndpoint handleXpcMessage:replyBlock:](*(void *)(a1 + 32), v3, 0);
  }
  else
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    id v5 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_23673D000, v5, OS_LOG_TYPE_ERROR, "Got unexpected xpc event", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)handleInterruption
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained endpointWasInterrupted:a1];
  }
}

- (void)invalidate
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    if (*(void *)(a1 + 32)) {
      -[RMConnectionEndpoint stopServingStream](a1);
    }
    if (*(void *)(a1 + 40)) {
      -[RMConnectionEndpoint stopReceivingStream](a1);
    }
    if (*(void *)(a1 + 56))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
      id v3 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained endpointWasInvalidated:a1];
  }
}

- (void)start
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = *(_xpc_connection_s **)(a1 + 56);
    xpc_connection_resume(v2);
  }
}

- (uint64_t)queue
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void)pause
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = *(_xpc_connection_s **)(a1 + 56);
    xpc_connection_suspend(v2);
  }
}

- (void)sendMessage:(void *)a3 withData:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t v7 = (void *)-[RMConnectionEndpoint sendMessage:withData:](v9);
      CreateXpcMessage(v7, v8);
      return;
    }
    v6 = CreateXpcMessage(v9, v5);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), v6);
  }
}

- (void)sendMessage:(void *)a3 withData:(void *)a4 reply:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_4;
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v10 = CreateXpcMessage(v7, v8);
    uint64_t v11 = *(void **)(a1 + 56);
    int v12 = *(NSObject **)(a1 + 8);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __51__RMConnectionEndpoint_sendMessage_withData_reply___block_invoke;
    handler[3] = &unk_264CACB88;
    void handler[4] = a1;
    id v18 = v9;
    id v17 = v7;
    uint64_t v13 = v11;
    xpc_connection_send_message_with_reply(v13, v10, v12, handler);

LABEL_4:
    return;
  }
  uint64_t v14 = -[RMConnectionEndpoint sendMessage:withData:reply:]();
  __51__RMConnectionEndpoint_sendMessage_withData_reply___block_invoke(v14, v15);
}

void __51__RMConnectionEndpoint_sendMessage_withData_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x237E03040]();
  uint64_t v5 = MEMORY[0x237E03530](v3);
  if (v5 == MEMORY[0x263EF8720])
  {
    if (v3 == (id)MEMORY[0x263EF86A0])
    {
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      uint64_t v10 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        if (v11) {
          uint64_t v11 = *(void *)(v11 + 56);
        }
        int v13 = 134283521;
        uint64_t v14 = v11;
        int v12 = v10;
        _os_log_impl(&dword_23673D000, v12, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p interrupted in sendMessageWithReply!", (uint8_t *)&v13, 0xCu);
      }
      (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40));
      -[RMConnectionEndpoint handleInterruption](*(void *)(a1 + 32));
    }
    else if (v3 == (id)MEMORY[0x263EF86A8])
    {
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      id v7 = (void *)logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        if (v8) {
          uint64_t v8 = *(void *)(v8 + 56);
        }
        int v13 = 134283521;
        uint64_t v14 = v8;
        id v9 = v7;
        _os_log_impl(&dword_23673D000, v9, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p invalidated!", (uint8_t *)&v13, 0xCu);
      }
      (*(void (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40));
      -[RMConnectionEndpoint invalidate](*(void *)(a1 + 32));
    }
  }
  else if (v5 == MEMORY[0x263EF8708])
  {
    -[RMConnectionEndpoint handleXpcMessage:replyBlock:](*(void *)(a1 + 32), v3, *(void **)(a1 + 48));
  }
  else
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    v6 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_23673D000, v6, OS_LOG_TYPE_FAULT, "Got unexpected xpc event", (uint8_t *)&v13, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __54__RMConnectionEndpoint_startServingStreamWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (MEMORY[0x237E03530](a2) == MEMORY[0x263EF8720])
  {
    if (a2 == MEMORY[0x263EF86A0])
    {
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      uint64_t v10 = (void *)logObject_IPC_Default;
      if (!os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      uint64_t v11 = *(void **)(a1 + 32);
      if (v11) {
        uint64_t v11 = (void *)v11[7];
      }
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        uint64_t v12 = *(void *)(v12 + 32);
      }
      int v13 = 134283777;
      uint64_t v14 = v11;
      __int16 v15 = 2049;
      uint64_t v16 = v12;
      id v7 = v11;
      uint64_t v8 = v10;
      id v9 = "#Warning Streaming server connection %{private}p.%{private}p interrupted!";
    }
    else
    {
      if (a2 != MEMORY[0x263EF86A8]) {
        return;
      }
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      uint64_t v4 = (void *)logObject_IPC_Default;
      if (!os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      uint64_t v5 = *(void **)(a1 + 32);
      if (v5) {
        uint64_t v5 = (void *)v5[7];
      }
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        uint64_t v6 = *(void *)(v6 + 32);
      }
      int v13 = 134283777;
      uint64_t v14 = v5;
      __int16 v15 = 2049;
      uint64_t v16 = v6;
      id v7 = v5;
      uint64_t v8 = v4;
      id v9 = "#Warning Streaming server connection %{private}p.%{private}p invalidated!";
    }
    _os_log_impl(&dword_23673D000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v13, 0x16u);

LABEL_21:
    -[RMConnectionEndpoint stopServingStream](*(void *)(a1 + 32));
  }
}

- (void)stopServingStream
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(void *)(a1 + 32))
    {
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 32), &__block_literal_global_2);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      v2 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      [WeakRetained endpointShouldStopStreamingData:a1];
    }
    else
    {
      -[RMConnectionEndpoint stopServingStream]();
    }
  }
}

void __54__RMConnectionEndpoint_startServingStreamWithHandler___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 32);
  }
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v9 = v3;
    id v6 = v3;
    xpc_dictionary_set_data(v5, "kRMConnectionMessageDataStreamKey", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v8 = *(_xpc_connection_s **)(v7 + 32);
    }
    else {
      uint64_t v8 = 0;
    }
    xpc_connection_send_message(v8, *(xpc_object_t *)(a1 + 40));
    id v3 = v9;
  }
}

- (void)handleStreamXpcError:(void *)a3 withErrorHandler:
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_22;
  }
  if (v5 == (id)MEMORY[0x263EF86A0])
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    id v9 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      uint64_t v10 = "#Warning Streaming connection interrupted";
LABEL_19:
      _os_log_impl(&dword_23673D000, v9, OS_LOG_TYPE_DEFAULT, v10, v12, 2u);
    }
LABEL_20:
    uint64_t v8 = -3;
    if (!v6) {
      goto LABEL_22;
    }
LABEL_21:
    uint64_t v11 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"RMConnectionStreaming", v8, 0, *(void *)v12);
    v6[2](v6, v11);

    goto LABEL_22;
  }
  if (v5 == (id)MEMORY[0x263EF86A8])
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    id v9 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      uint64_t v10 = "#Warning Streaming connection dropped";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (v5 != (id)MEMORY[0x263EF86C0])
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    uint64_t v7 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v12 = 138412290;
      *(void *)&v12[4] = v5;
      _os_log_impl(&dword_23673D000, v7, OS_LOG_TYPE_ERROR, "Unknown xpc error received %@", v12, 0xCu);
    }
    uint64_t v8 = -4;
    if (v6) {
      goto LABEL_21;
    }
  }
LABEL_22:
}

- (void)startReceivingStreamOnConnection:(void *)a3 errorHandler:
{
  id v6 = a2;
  id v7 = a3;
  if (!a1) {
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  char v9 = [WeakRetained conformsToProtocol:&unk_26E9B24A0];

  if (v9)
  {
    objc_storeStrong((id *)(a1 + 40), a2);
    uint64_t v10 = *(_xpc_connection_s **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__RMConnectionEndpoint_startReceivingStreamOnConnection_errorHandler___block_invoke;
    v12[3] = &unk_264CACBF8;
    v12[4] = a1;
    id v13 = v7;
    xpc_connection_set_event_handler(v10, v12);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 40));

LABEL_4:
    return;
  }
  uint64_t v11 = -[RMConnectionEndpoint startReceivingStreamOnConnection:errorHandler:]();
  -[RMConnectionEndpoint setStreamingClientConnection:](v11);
}

- (void)setStreamingClientConnection:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

void __70__RMConnectionEndpoint_startReceivingStreamOnConnection_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x237E03530]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    uint64_t v8 = (void *)logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (v9) {
        uint64_t v9 = *(void *)(v9 + 40);
      }
      int v17 = 134283521;
      uint64_t v18 = v9;
      uint64_t v10 = v8;
      _os_log_impl(&dword_23673D000, v10, OS_LOG_TYPE_DEBUG, "Error received on the streaming client connection %{private}p", (uint8_t *)&v17, 0xCu);
    }
    -[RMConnectionEndpoint handleStreamXpcError:withErrorHandler:](*(void *)(a1 + 32), v3, *(void **)(a1 + 40));
    -[RMConnectionEndpoint stopReceivingStream](*(void *)(a1 + 32));
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    uint64_t v5 = xpc_dictionary_get_value(v3, "kRMConnectionMessageDataStreamKey");
    id v6 = (void *)v5;
    if (v5
      && MEMORY[0x237E03530](v5) == MEMORY[0x263EF86F8]
      && (bytes_ptr = xpc_data_get_bytes_ptr(v6)) != 0
      && (uint64_t v12 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:bytes_ptr length:xpc_data_get_length(v6)]) != 0)
    {
      id v13 = (void *)v12;
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(v14 + 24));
        uint64_t v16 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v16 = 0;
        id WeakRetained = 0;
      }
      [WeakRetained endpoint:v16 didReceiveStreamedData:v13];
    }
    else
    {
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      id v7 = logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_23673D000, v7, OS_LOG_TYPE_ERROR, "Message without a payload received from the stream connection", (uint8_t *)&v17, 2u);
      }
    }
  }
}

- (void)stopReceivingStream
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(void *)(a1 + 40))
    {
      xpc_connection_suspend(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &__block_literal_global_92);
      xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      v2 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }
    if (*(void *)(a1 + 48))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 48));
      id v3 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = 0;
    }
  }
}

- (void)handleStreamXpcReply:(void *)a3 withErrorHandler:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  if (a1)
  {
    id v6 = NSString;
    id v7 = a2;
    uint64_t v8 = objc_msgSend(v6, "stringWithUTF8String:", xpc_dictionary_get_string(v7, "kRMConnectionMessageNameKey"));
    uint64_t v9 = xpc_dictionary_get_value(v7, "kRMConnectionMessageError");

    if (v9 && MEMORY[0x237E03530](v9) == MEMORY[0x263EF86F8])
    {
      bytes_ptr = (void *)xpc_data_get_bytes_ptr(v9);
      if (bytes_ptr) {
        bytes_ptr = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:bytes_ptr length:xpc_data_get_length(v9)];
      }
    }
    else
    {
      bytes_ptr = 0;
    }
    if ([v8 isEqualToString:@"kRMConnectionMessageError"])
    {
      if (bytes_ptr)
      {
        uint64_t v11 = (void *)MEMORY[0x263F08928];
        uint64_t v12 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
        id v19 = 0;
        id v13 = [v11 unarchivedObjectOfClasses:v12 fromData:bytes_ptr error:&v19];
        id v14 = v19;

        if (v13)
        {
          if (onceToken_IPC_Default != -1) {
            dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
          }
          __int16 v15 = logObject_IPC_Default;
          if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = v13;
            _os_log_impl(&dword_23673D000, v15, OS_LOG_TYPE_ERROR, "Error while receiving a stream : %@", buf, 0xCu);
          }
          if (v5) {
            v5[2](v5, v13);
          }
        }
        else
        {
          if (onceToken_IPC_Default != -1) {
            dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
          }
          uint64_t v18 = logObject_IPC_Default;
          if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = v14;
            _os_log_impl(&dword_23673D000, v18, OS_LOG_TYPE_FAULT, "Can't decode the error returned to the streaming request. Unarchiver error: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        if (onceToken_IPC_Default != -1) {
          dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
        }
        int v17 = logObject_IPC_Default;
        if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v8;
          _os_log_impl(&dword_23673D000, v17, OS_LOG_TYPE_FAULT, "No data in error message: %@", buf, 0xCu);
        }
      }
      -[RMConnectionEndpoint stopReceivingStream](a1);
    }
    else if ([v8 isEqualToString:@"kRMConnectionMessageSuccess"])
    {
      if (onceToken_IPC_Default != -1) {
        dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
      }
      uint64_t v16 = logObject_IPC_Default;
      if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23673D000, v16, OS_LOG_TYPE_DEFAULT, "Streaming connection acknowledged from remote endpoint", buf, 2u);
      }
    }
  }
}

- (void)requestStreamWithMessage:(void *)a3 data:(void *)a4 errorHandler:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (!a1) {
    goto LABEL_7;
  }
  if (*(void *)(a1 + 48))
  {
    -[RMConnectionEndpoint requestStreamWithMessage:data:errorHandler:]();
    goto LABEL_9;
  }
  uint64_t v12 = *(id *)(a1 + 8);
  xpc_connection_t v13 = xpc_connection_create(0, v12);
  id v14 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v13;

  __int16 v15 = *(_xpc_connection_s **)(a1 + 48);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __67__RMConnectionEndpoint_requestStreamWithMessage_data_errorHandler___block_invoke;
  handler[3] = &unk_264CACBF8;
  void handler[4] = a1;
  id v16 = v11;
  id v28 = v16;
  xpc_connection_set_event_handler(v15, handler);
  uint64_t v4 = CreateXpcMessage(v9, v10);
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 48));
  xpc_endpoint_t v5 = xpc_endpoint_create(*(xpc_connection_t *)(a1 + 48));
  xpc_dictionary_set_value(v4, "kRMConnectionRequestSteamingKey", v5);
  int v17 = *(void **)(a1 + 56);
  uint64_t v18 = *(NSObject **)(a1 + 8);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __67__RMConnectionEndpoint_requestStreamWithMessage_data_errorHandler___block_invoke_97;
  v25[3] = &unk_264CACBF8;
  v25[4] = a1;
  id v26 = v16;
  id v19 = v17;
  xpc_connection_send_message_with_reply(v19, v4, v18, v25);

  if (onceToken_IPC_Default != -1) {
LABEL_9:
  }
    dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
  id v20 = (void *)logObject_IPC_Default;
  if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 48);
    id v21 = *(void **)(a1 + 56);
    *(_DWORD *)buf = 134283777;
    v30 = v21;
    __int16 v31 = 2049;
    uint64_t v32 = v22;
    id v23 = v21;
    uint64_t v24 = v20;
    _os_log_impl(&dword_23673D000, v24, OS_LOG_TYPE_DEFAULT, "Streaming request sent on streaming listener %{private}p.%{private}p", buf, 0x16u);
  }
LABEL_7:
}

void __67__RMConnectionEndpoint_requestStreamWithMessage_data_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x237E03530]() == MEMORY[0x263EF86F0])
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    uint64_t v4 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_23673D000, v4, OS_LOG_TYPE_DEFAULT, "Peer connection detected", v8, 2u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      id v6 = *(NSObject **)(v5 + 8);
    }
    else {
      id v6 = 0;
    }
    id v7 = (_xpc_connection_s *)v3;
    xpc_connection_set_target_queue(v7, v6);
    -[RMConnectionEndpoint startReceivingStreamOnConnection:errorHandler:](*(void *)(a1 + 32), v7, *(void **)(a1 + 40));
  }
}

void __67__RMConnectionEndpoint_requestStreamWithMessage_data_errorHandler___block_invoke_97(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x237E03530]();
  if (v4 == MEMORY[0x263EF8720])
  {
    if (onceToken_IPC_Default != -1) {
      dispatch_once(&onceToken_IPC_Default, &__block_literal_global_118);
    }
    uint64_t v5 = logObject_IPC_Default;
    if (os_log_type_enabled((os_log_t)logObject_IPC_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_23673D000, v5, OS_LOG_TYPE_DEFAULT, "Error received while trying to start the streaming connection", v6, 2u);
    }
    -[RMConnectionEndpoint handleStreamXpcError:withErrorHandler:](*(void *)(a1 + 32), v3, *(void **)(a1 + 40));
    -[RMConnectionEndpoint stopReceivingStream](*(void *)(a1 + 32));
  }
  else if (v4 == MEMORY[0x263EF8708])
  {
    -[RMConnectionEndpoint handleStreamXpcReply:withErrorHandler:](*(void *)(a1 + 32), v3, *(void **)(a1 + 40));
  }
}

- (id)connectionDelegate
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (BOOL)isValid
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 8));
    return *(void *)(v1 + 56) != 0;
  }
  return result;
}

- (id)connection
{
  if (a1)
  {
    a1 = (id *)a1[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)setConnectionDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 2, a2);
  }
  return result;
}

- (id)setDataDelegate:(id *)result
{
  if (result) {
    return (id *)objc_storeWeak(result + 3, a2);
  }
  return result;
}

- (uint64_t)priorityBoostReplyMessage
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityBoostReplyMessage, 0);
  objc_storeStrong((id *)&self->_messagingConnection, 0);
  objc_storeStrong((id *)&self->_streamingClientListener, 0);
  objc_storeStrong((id *)&self->_streamingClientConnection, 0);
  objc_storeStrong((id *)&self->_streamingServerConnection, 0);
  objc_destroyWeak((id *)&self->_dataDelegate);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end