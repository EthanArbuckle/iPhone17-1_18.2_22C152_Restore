@interface MRXPCConnection
- (MRXPCConnection)initWithConnection:(id)a3 queue:(id)a4 defaultReplyQueue:(id)a5;
- (OS_xpc_object)connection;
- (id)invalidationHandler;
- (id)messageHandler;
- (id)sendSyncMessage:(id)a3 error:(id *)a4;
- (id)sendSyncMessageWithType:(unint64_t)a3 error:(id *)a4;
- (int)pid;
- (unsigned)uid;
- (void)_registerCallbacks;
- (void)addCustomXPCHandler:(id)a3 forKey:(unint64_t)a4;
- (void)dealloc;
- (void)removeCustomXPCHandler:(unint64_t)a3;
- (void)sendMessage:(id)a3 queue:(id)a4 reply:(id)a5;
- (void)sendMessageWithType:(unint64_t)a3 queue:(id)a4 reply:(id)a5;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessageHandler:(id)a3;
@end

@implementation MRXPCConnection

- (int)pid
{
  return xpc_connection_get_pid(self->_connection);
}

void __37__MRXPCConnection__registerCallbacks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3 == (id)MEMORY[0x1E4F14520] || v3 == (id)MEMORY[0x1E4F14528])
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__22;
    v31 = __Block_byref_object_dispose__22;
    id v32 = 0;
    v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MRXPCConnection__registerCallbacks__block_invoke_28;
    block[3] = &unk_1E57D07E0;
    v25 = WeakRetained;
    v26 = &v27;
    dispatch_sync(v7, block);
    uint64_t v8 = v28[5];
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    }
    v9 = v25;
  }
  else
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v3, "MRXPC_MESSAGE_ID_KEY");
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__22;
    v31 = __Block_byref_object_dispose__22;
    id v32 = 0;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__22;
    v22 = __Block_byref_object_dispose__22;
    v23 = 0;
    v11 = v5[1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__MRXPCConnection__registerCallbacks__block_invoke_2;
    v13[3] = &unk_1E57D5148;
    v15 = &v18;
    v16 = &v27;
    uint64_t v17 = uint64;
    v14 = v5;
    dispatch_sync(v11, v13);
    uint64_t v12 = v19[5];
    if (!v12) {
      uint64_t v12 = v28[5];
    }
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v3);

    _Block_object_dispose(&v18, 8);
    v9 = v23;
  }

  _Block_object_dispose(&v27, 8);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (unsigned)uid
{
  return xpc_connection_get_euid(self->_connection);
}

- (id)sendSyncMessage:(id)a3 error:(id *)a4
{
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);
  v6 = v5;
  if (a4)
  {
    if (v5 == (xpc_object_t)MEMORY[0x1E4F14520])
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v8 = MRCreateStringFromXPCMessage(MEMORY[0x1E4F14520], (const char *)*MEMORY[0x1E4F14530]);
      v9 = (void *)[v7 initWithMRError:1, @"Connection interrupted with error=%@", v8 format];
    }
    else
    {
      if (v5 != (xpc_object_t)MEMORY[0x1E4F14528])
      {
        *a4 = (id)MRCreateClientErrorFromXPCMessage(v5);
        goto LABEL_8;
      }
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v8 = MRCreateStringFromXPCMessage(MEMORY[0x1E4F14528], (const char *)*MEMORY[0x1E4F14530]);
      v9 = (void *)[v10 initWithMRError:1, @"Connection invalid with error=%@", v8 format];
    }
    *a4 = v9;
  }
LABEL_8:

  return v6;
}

void __46__MRXPCConnection_addCustomXPCHandler_forKey___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 24);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = a1[4];
    xpc_object_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    v2 = *(void **)(a1[4] + 24);
  }
  v6 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  id v12 = [v2 objectForKey:v6];

  if (v12)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = [NSString stringWithUTF8String:"-[MRXPCConnection addCustomXPCHandler:forKey:]_block_invoke"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"MRXPCConnection.m", 68, @"A custom xpc handler already exists with key %llu", a1[6]);
  }
  id v7 = *(void **)(a1[4] + 24);
  uint64_t v8 = (void *)MEMORY[0x1997190F0](a1[5]);
  v9 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  [v7 setObject:v8 forKey:v9];
}

uint64_t __37__MRXPCConnection__registerCallbacks__block_invoke_2(void *a1)
{
  v2 = *(void **)(a1[4] + 24);
  id v3 = [NSNumber numberWithUnsignedLongLong:a1[7]];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(void *)(*(void *)(a1[6] + 8) + 40) = MEMORY[0x1997190F0](*(void *)(a1[4] + 40));

  return MEMORY[0x1F41817F8]();
}

- (void)addCustomXPCHandler:(id)a3 forKey:(unint64_t)a4
{
  id v6 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__MRXPCConnection_addCustomXPCHandler_forKey___block_invoke;
  block[3] = &unk_1E57D1FA8;
  id v10 = v6;
  unint64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
}

- (void)setMessageHandler:(id)a3
{
}

- (void)setInvalidationHandler:(id)a3
{
}

- (MRXPCConnection)initWithConnection:(id)a3 queue:(id)a4 defaultReplyQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MRXPCConnection;
  id v12 = [(MRXPCConnection *)&v19 init];
  if (v12)
  {
    if (!v9)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v18 = [NSString stringWithUTF8String:"-[MRXPCConnection initWithConnection:queue:defaultReplyQueue:]"];
      [v17 handleFailureInFunction:v18, @"MRXPCConnection.m", 30, @"Invalid parameter not satisfying: %@", @"connection" file lineNumber description];
    }
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v12->_defaultReplyQueue, a5);
    if (v10) {
      xpc_connection_set_target_queue(v12->_connection, v10);
    }
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mediaremote.MRXPCConnection", v13);
    serialQueue = v12->_serialQueue;
    v12->_serialQueue = (OS_dispatch_queue *)v14;

    -[MRXPCConnection _registerCallbacks](&v12->super.isa);
  }

  return v12;
}

- (void)_registerCallbacks
{
  if (val)
  {
    objc_initWeak(&location, val);
    v2 = val[4];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37__MRXPCConnection__registerCallbacks__block_invoke;
    handler[3] = &unk_1E57D5170;
    objc_copyWeak(&v4, &location);
    handler[4] = val;
    xpc_connection_set_event_handler(v2, handler);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)sendMessage:(id)a3 queue:(id)a4 reply:(id)a5
{
  id v9 = a3;
  id v10 = (OS_dispatch_queue *)a4;
  id v11 = a5;
  if (v11)
  {
    if (!v10)
    {
      id v10 = self->_defaultReplyQueue;
      if (!v10)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"MRXPCConnection.m", 93, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

        id v10 = 0;
      }
    }
    connection = self->_connection;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __43__MRXPCConnection_sendMessage_queue_reply___block_invoke;
    handler[3] = &unk_1E57D2550;
    id v15 = v11;
    xpc_connection_send_message_with_reply(connection, v9, (dispatch_queue_t)v10, handler);
  }
  else
  {
    xpc_connection_send_message(self->_connection, v9);
  }
}

void __43__MRXPCConnection_sendMessage_queue_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v6 = MRCreateStringFromXPCMessage(MEMORY[0x1E4F14520], (const char *)*MEMORY[0x1E4F14530]);
    uint64_t v7 = [v5 initWithMRError:1, @"Connection interrupted with error=%@", v6 format];
  }
  else
  {
    if (v3 != (id)MEMORY[0x1E4F14528])
    {
      id v4 = (void *)MRCreateClientErrorFromXPCMessage(v3);
      goto LABEL_7;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v6 = MRCreateStringFromXPCMessage(MEMORY[0x1E4F14528], (const char *)*MEMORY[0x1E4F14530]);
    uint64_t v7 = [v8 initWithMRError:1, @"Connection invalid with error=%@", v6 format];
  }
  id v4 = (void *)v7;

LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  xpc_connection_cancel(self->_connection);
  v3.receiver = self;
  v3.super_class = (Class)MRXPCConnection;
  [(MRXPCConnection *)&v3 dealloc];
}

- (void)removeCustomXPCHandler:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__MRXPCConnection_removeCustomXPCHandler___block_invoke;
  v4[3] = &unk_1E57D2098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

void __42__MRXPCConnection_removeCustomXPCHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  [v1 removeObjectForKey:v2];
}

- (void)sendMessageWithType:(unint64_t)a3 queue:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  MRCreateXPCMessage(a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(MRXPCConnection *)self sendMessage:v10 queue:v9 reply:v8];
}

- (id)sendSyncMessageWithType:(unint64_t)a3 error:(id *)a4
{
  id v6 = MRCreateXPCMessage(a3);
  uint64_t v7 = [(MRXPCConnection *)self sendSyncMessage:v6 error:a4];

  return v7;
}

uint64_t __37__MRXPCConnection__registerCallbacks__block_invoke_28(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 48);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = MEMORY[0x1997190F0]();
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)messageHandler
{
  return self->_messageHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_customXpcHandlers, 0);
  objc_storeStrong((id *)&self->_defaultReplyQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end