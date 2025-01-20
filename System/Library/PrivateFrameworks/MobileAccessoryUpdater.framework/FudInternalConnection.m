@interface FudInternalConnection
- (FudInternalConnection)initWithClientIdentifier:(id)a3 handlerQueue:(id)a4 messageHandler:(id)a5;
- (int64_t)getNextMessageID;
- (void)dealloc;
- (void)handleInboundNotification:(id)a3;
- (void)sendMessageToFud:(id)a3;
- (void)sendMessageToFud:(id)a3 reply:(id)a4;
- (void)stop;
@end

@implementation FudInternalConnection

- (FudInternalConnection)initWithClientIdentifier:(id)a3 handlerQueue:(id)a4 messageHandler:(id)a5
{
  v20.receiver = self;
  v20.super_class = (Class)FudInternalConnection;
  v14 = [(FudInternalConnection *)&v20 init];
  if (initWithClientIdentifier_handlerQueue_messageHandler__onceToken != -1) {
    dispatch_once(&initWithClientIdentifier_handlerQueue_messageHandler__onceToken, &__block_literal_global_0);
  }
  if (!_msgIDLock)
  {
    v18 = @"Failed to create msg id mutex";
LABEL_17:
    FudLog(3, (uint64_t)v18, v8, v9, v10, v11, v12, v13, (uint64_t)v20.receiver);
    v19 = v14;
    return 0;
  }
  if (!a3)
  {
    v18 = @"Can't create connection without client identifier";
    goto LABEL_17;
  }
  if (!a5)
  {
    v18 = @"Can't create connection without handler";
    goto LABEL_17;
  }
  if (!a4)
  {
    v18 = @"Can't create connection without handler queue";
    goto LABEL_17;
  }
  v14->didStop = 0;
  v14->clientIdentifier = (NSString *)a3;
  v15 = _Block_copy(a5);
  v14->messageHandler = v15;
  if (!v15)
  {
    v18 = @"Failed to copy block handler";
    goto LABEL_17;
  }
  uint64_t v16 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:0];
  v14->pendingRequests = (NSMutableDictionary *)v16;
  if (!v16)
  {
    v18 = @"Failed to create pending requests dict";
    goto LABEL_17;
  }
  v14->handlerQueue = (OS_dispatch_queue *)a4;
  dispatch_retain((dispatch_object_t)a4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v14, sel_handleInboundNotification_, @"MAUInternalMessageClientNotification", 0);
  return v14;
}

dispatch_semaphore_t __78__FudInternalConnection_initWithClientIdentifier_handlerQueue_messageHandler___block_invoke()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(1);
  _msgIDLock = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  handlerQueue = self->handlerQueue;
  if (handlerQueue) {
    dispatch_release(handlerQueue);
  }
  id messageHandler = self->messageHandler;
  if (messageHandler) {
    _Block_release(messageHandler);
  }

  v5.receiver = self;
  v5.super_class = (Class)FudInternalConnection;
  [(FudInternalConnection *)&v5 dealloc];
}

- (int64_t)getNextMessageID
{
  dispatch_semaphore_wait((dispatch_semaphore_t)_msgIDLock, 0xFFFFFFFFFFFFFFFFLL);
  int64_t v2 = ++_gNextMsgID;
  dispatch_semaphore_signal((dispatch_semaphore_t)_msgIDLock);
  return v2;
}

- (void)handleInboundNotification:(id)a3
{
  FudLog(7, @"Client got an internal notification", (uint64_t)a3, v3, v4, v5, v6, v7, v27[0]);
  if (a3)
  {
    uint64_t v16 = (void *)[a3 userInfo];
    if (v16)
    {
      v17 = (void *)[v16 objectForKey:@"InternalMessage"];
      if (v17)
      {
        v18 = v17;
        uint64_t v19 = [v17 objectForKey:@"ClientIdentifier"];
        if (v19)
        {
          if (![(NSString *)self->clientIdentifier isEqualToString:v19]) {
            return;
          }
          uint64_t v20 = [v18 objectForKey:@"MessageID"];
          if (v20
            && (uint64_t v21 = v20,
                id messageHandler = (id)[(NSMutableDictionary *)self->pendingRequests objectForKey:v20],
                [(NSMutableDictionary *)self->pendingRequests removeObjectForKey:v21],
                messageHandler)
            || (id messageHandler = self->messageHandler) != 0)
          {
            uint64_t v23 = _CFXPCCreateXPCObjectFromCFObject();
            if (v23)
            {
              v24 = (void *)v23;
              handlerQueue = self->handlerQueue;
              v27[0] = MEMORY[0x263EF8330];
              v27[1] = 3221225472;
              v27[2] = (uint64_t)__51__FudInternalConnection_handleInboundNotification___block_invoke;
              v27[3] = (uint64_t)&unk_2647FCB10;
              v27[4] = (uint64_t)v24;
              v27[5] = (uint64_t)messageHandler;
              dispatch_sync(handlerQueue, v27);
              xpc_release(v24);
              return;
            }
            v26 = @"Failed to convert dict to xpc dict";
          }
          else
          {
            v26 = @"No handler found for msg ID";
          }
        }
        else
        {
          v26 = @"Failed to convert client identifier to string";
        }
      }
      else
      {
        v26 = @"Can't handle NULL msg in notification";
      }
    }
    else
    {
      v26 = @"Can't handle NULL user info in notification";
    }
  }
  else
  {
    v26 = @"Can't handle NULL notification";
  }
  FudLog(3, (uint64_t)v26, v10, v11, v12, v13, v14, v15, v29);
}

uint64_t __51__FudInternalConnection_handleInboundNotification___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)stop
{
  self->didStop = 1;
}

- (void)sendMessageToFud:(id)a3
{
  if (a3)
  {
    if (self->didStop)
    {
      uint64_t v20 = @"Can't send message after it was explicitly stopped";
    }
    else
    {
      int64_t v10 = [(FudInternalConnection *)self getNextMessageID];
      if (v10)
      {
        int64_t v11 = v10;
        uint64_t v12 = [(NSString *)self->clientIdentifier cStringUsingEncoding:4];
        if (v12)
        {
          xpc_dictionary_set_string(a3, "ClientIdentifier", v12);
          xpc_dictionary_set_int64(a3, "MessageID", v11);
          xpc_dictionary_set_BOOL(a3, "InternalClient", 1);
          id v22 = (id)_CFXPCCreateCFObjectFromXPCObject();
          if (v22)
          {
            uint64_t v13 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
            [v13 setObject:v22 forKey:@"InternalMessage"];
            objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"MAUInternalMessageFudNotification", self, v13);
            FudLog(7, @"Client sent an internal message", v14, v15, v16, v17, v18, v19, v21);
            goto LABEL_7;
          }
          uint64_t v20 = @"Failed to convert xpc dict into cf dict";
        }
        else
        {
          uint64_t v20 = @"Failed to get c client identifier";
        }
      }
      else
      {
        uint64_t v20 = @"Failed to get message ID";
      }
    }
  }
  else
  {
    uint64_t v20 = @"Can't send NULL msg";
  }
  FudLog(3, (uint64_t)v20, (uint64_t)a3, v3, v4, v5, v6, v7, v21);
  id v22 = 0;
LABEL_7:
}

- (void)sendMessageToFud:(id)a3 reply:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      if (self->didStop)
      {
        uint64_t v21 = @"Can't send message after it was explicitly stopped";
      }
      else
      {
        int64_t v11 = [(FudInternalConnection *)self getNextMessageID];
        if (v11)
        {
          int64_t v12 = v11;
          uint64_t v13 = [(NSString *)self->clientIdentifier cStringUsingEncoding:4];
          if (v13)
          {
            xpc_dictionary_set_string(a3, "ClientIdentifier", v13);
            xpc_dictionary_set_int64(a3, "MessageID", v12);
            xpc_dictionary_set_BOOL(a3, "InternalClient", 1);
            id v23 = (id)_CFXPCCreateCFObjectFromXPCObject();
            if (v23)
            {
              _Block_copy(a4);
              -[NSMutableDictionary setObject:forKey:](self->pendingRequests, "setObject:forKey:", a4, [NSNumber numberWithLongLong:v12]);
              _Block_release(a4);
              uint64_t v14 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
              [v14 setObject:v23 forKey:@"InternalMessage"];
              objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"MAUInternalMessageFudNotification", self, v14);
              FudLog(7, @"Client sent an internal message, expecting reply for msg ID %lld.", v15, v16, v17, v18, v19, v20, v12);
              goto LABEL_8;
            }
            uint64_t v21 = @"Failed to convert xpc dict into cf dict";
          }
          else
          {
            uint64_t v21 = @"Failed to get c client identifier";
          }
        }
        else
        {
          uint64_t v21 = @"Failed to get message ID";
        }
      }
    }
    else
    {
      uint64_t v21 = @"Can't handle reply with NULL handler";
    }
  }
  else
  {
    uint64_t v21 = @"Can't send NULL msg";
  }
  FudLog(3, (uint64_t)v21, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v22);
  id v23 = 0;
LABEL_8:
}

@end