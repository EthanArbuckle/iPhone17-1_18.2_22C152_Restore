@interface XPCClientConnection
- (XPCClientConnection)initWithServiceName:(id)a3 delegate:(id)a4;
- (XPCClientConnectionDelegate)delegate;
- (id)debugDescription;
- (void)_handleConnectionEvent:(id)a3;
- (void)_handleIncomingMessage:(id)a3;
- (void)_reallySendMessage:(id)a3 handler:(id)a4 sequence:(unint64_t)a5 retryCount:(unint64_t)a6;
- (void)sendMessage:(id)a3 withHandler:(id)a4;
- (void)shutDownCompletionBlock:(id)a3;
@end

@implementation XPCClientConnection

- (void)sendMessage:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
    _XPCLog(7, @"%@ Scheduling message for sending.", v8, v9, v10, v11, v12, v13, (uint64_t)self);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__XPCClientConnection_sendMessage_withHandler___block_invoke;
  block[3] = &unk_1E6CFCDC8;
  block[4] = self;
  id v18 = v6;
  id v19 = v7;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (XPCClientConnectionDelegate)delegate
{
  return self->_delegate;
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__XPCClientConnection_shutDownCompletionBlock___block_invoke;
  v7[3] = &unk_1E6CFCD50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__XPCClientConnection_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    xpc_connection_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;

    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      id v6 = *(NSObject **)(*(void *)(a1 + 32) + 24);
      dispatch_async(v6, v5);
    }
  }
}

- (XPCClientConnection)initWithServiceName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = (XPCClientConnectionDelegate *)a4;
  v15.receiver = self;
  v15.super_class = (Class)XPCClientConnection;
  id v8 = [(XPCClientConnection *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v9;

    v8->_delegate = v7;
    id v11 = [v6 stringByAppendingString:@".queue"];
    dispatch_queue_t v12 = dispatch_queue_create((const char *)[v11 UTF8String], 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;
  }
  return v8;
}

uint64_t __47__XPCClientConnection_sendMessage_withHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallySendMessage:*(void *)(a1 + 40) handler:*(void *)(a1 + 48) sequence:0 retryCount:0];
}

- (void)_reallySendMessage:(id)a3 handler:(id)a4 sequence:(unint64_t)a5 retryCount:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!v11) {
    __assert_rtn("-[XPCClientConnection _reallySendMessage:handler:sequence:retryCount:]", "XPCKitBasic.m", 136, "handler");
  }
  dispatch_queue_t v12 = v11;
  if (self->_connection)
  {
    if (a5)
    {
LABEL_4:
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
      {
        _XPCLog(6, @"%@: Redriving message with sequence %llu", v13, v14, v15, v16, v17, v18, (uint64_t)self);
      }
      goto LABEL_14;
    }
  }
  else
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
    {
      _XPCLog(6, @"%@: Creating connection to service %@", v19, v20, v21, v22, v23, v24, (uint64_t)self);
    }
    mach_service = xpc_connection_create_mach_service([(NSString *)self->_serviceName UTF8String], (dispatch_queue_t)self->_queue, 0);
    connection = self->_connection;
    self->_connection = mach_service;

    objc_initWeak(&location, self);
    v27 = self->_connection;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __70__XPCClientConnection__reallySendMessage_handler_sequence_retryCount___block_invoke;
    handler[3] = &unk_1E6CFCD00;
    objc_copyWeak(&v57, &location);
    xpc_connection_set_event_handler(v27, handler);
    xpc_connection_resume(self->_connection);
    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);
    if (a5) {
      goto LABEL_4;
    }
  }
  a5 = _reallySendMessage_handler_sequence_retryCount__currentMessageSequence++;
  if (_shouldLogBlock
    && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
  {
    _XPCLog(7, @"%@: Setting sequence number to %llu", v28, v29, v30, v31, v32, v33, (uint64_t)self);
  }
LABEL_14:
  xpc_dictionary_set_uint64(v10, "__xpcseq", a5);
  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6)) {
      _XPCLog(6, @"%@: Sending message.", v34, v35, v36, v37, v38, v39, (uint64_t)self);
    }
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
    {
      v40 = (void *)MEMORY[0x1E01C19E0](v10);
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
      {
        _XPCLog(7, @"Message: %s", v41, v42, v43, v44, v45, v46, (uint64_t)v40);
      }
      free(v40);
    }
  }
  v47 = self->_connection;
  queue = self->_queue;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __70__XPCClientConnection__reallySendMessage_handler_sequence_retryCount___block_invoke_2;
  v51[3] = &unk_1E6CFCD28;
  id v53 = v12;
  unint64_t v54 = a5;
  v51[4] = self;
  id v52 = v10;
  unint64_t v55 = a6;
  id v49 = v10;
  id v50 = v12;
  xpc_connection_send_message_with_reply(v47, v49, queue, v51);
}

void __70__XPCClientConnection__reallySendMessage_handler_sequence_retryCount___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleConnectionEvent:v3];
}

uint64_t __70__XPCClientConnection__reallySendMessage_handler_sequence_retryCount___block_invoke_2(uint64_t *a1, void *a2)
{
  id v3 = a2;
  xpc_object_t xdict = v3;
  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
      _XPCLog(7, @"%@: Message sent: sequence: %llu.", v4, v5, v6, v7, v8, v9, a1[4]);
    }
    id v3 = xdict;
    if (_shouldLogBlock)
    {
      int v10 = (*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7);
      id v3 = xdict;
      if (v10)
      {
        id v11 = (void *)MEMORY[0x1E01C19E0](xdict);
        if (_shouldLogBlock
          && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
        {
          _XPCLog(7, @"Reply: %s", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
        }
        free(v11);
        id v3 = xdict;
      }
    }
  }
  uint64_t v18 = MEMORY[0x1E01C1A80](v3);
  if (v18 != MEMORY[0x1E4F145A8])
  {
    if (v18 == MEMORY[0x1E4F14590])
    {
      xpc_dictionary_get_uint64(xdict, "__xpcseq");
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
      {
        _XPCLog(7, @"%@ Handling reply for message with sequence %llu.", v47, v48, v49, v50, v51, v52, a1[4]);
      }
      v26 = *(uint64_t (**)(void))(a1[6] + 16);
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1E01C19E0](xdict);
      if (_shouldLogBlock
        && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
      {
        _XPCLog(3, @"%@ Received unknown XPC event type: %s", v20, v21, v22, v23, v24, v25, a1[4]);
      }
      free(v19);
      v26 = *(uint64_t (**)(void))(a1[6] + 16);
    }
LABEL_32:
    uint64_t v53 = v26();
    goto LABEL_33;
  }
  if (_shouldLogBlock
    && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
  {
    uint64_t v27 = a1[4];
    xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
    _XPCLog(3, @"%@: Received an error when receiving reply. Error: %s", v28, v29, v30, v31, v32, v33, v27);
  }
  if (xdict == (xpc_object_t)MEMORY[0x1E4F14528])
  {
    if (_shouldLogBlock
      && ((*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6) & 1) != 0)
    {
      v60 = @"%@: Connection invalid.";
LABEL_42:
      _XPCLog(6, v60, v54, v55, v56, v57, v58, v59, a1[4]);
    }
  }
  else
  {
    if (xdict != (xpc_object_t)MEMORY[0x1E4F14520])
    {
      if (_shouldLogBlock)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
        {
          uint64_t v34 = a1[4];
          xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
          _XPCLog(3, @"%@: Unknown XPC error: %s", v35, v36, v37, v38, v39, v40, v34);
        }
        if (_shouldLogBlock
          && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
        {
          _XPCLog(3, @"%@: Message send failed. Not retrying.", v41, v42, v43, v44, v45, v46, a1[4]);
        }
      }
      v26 = *(uint64_t (**)(void))(a1[6] + 16);
      goto LABEL_32;
    }
    if (_shouldLogBlock
      && ((*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6) & 1) != 0)
    {
      v60 = @"%@: Connection interrupted.";
      goto LABEL_42;
    }
  }
  char v61 = (*(uint64_t (**)(void))(a1[6] + 16))();
  uint64_t v53 = _shouldLogBlock;
  if (!_shouldLogBlock)
  {
    if ((v61 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_48;
  }
  uint64_t v53 = (*(uint64_t (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6);
  if (v61)
  {
    if (v53) {
      _XPCLog(6, @"%@: Trying to resend last message.", v62, v63, v64, v65, v66, v67, a1[4]);
    }
LABEL_48:
    uint64_t v53 = [(id)a1[4] _reallySendMessage:a1[5] handler:a1[6] sequence:a1[7] retryCount:a1[8] + 1];
    goto LABEL_33;
  }
  if (v53) {
    _XPCLog(6, @"%@: Did not want to retry sending the last message. Message send failed.", (uint64_t)xdict, v63, v64, v65, v66, v67, a1[4]);
  }
LABEL_33:

  return MEMORY[0x1F4181820](v53);
}

- (void)_handleIncomingMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[XPCRequest alloc] initWithMessage:v4 sequence:0 connection:self->_connection];

  [(XPCClientConnectionDelegate *)self->_delegate XPCClientConnection:self didReceiveRequest:v5];
}

- (void)_handleConnectionEvent:(id)a3
{
  id v4 = a3;
  xpc_object_t xdict = v4;
  if (_shouldLogBlock)
  {
    int v5 = (*(uint64_t (**)(void))(_shouldLogBlock + 16))();
    id v4 = xdict;
    if (v5)
    {
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
      _XPCLog(7, @"%@: Connection event handler received event: %s", v6, v7, v8, v9, v10, v11, (uint64_t)self);
      id v4 = xdict;
    }
  }
  uint64_t v12 = MEMORY[0x1E01C1A80](v4);
  if (v12 == MEMORY[0x1E4F14590])
  {
    [(XPCClientConnection *)self _handleIncomingMessage:xdict];
    goto LABEL_21;
  }
  if (v12 != MEMORY[0x1E4F145A8])
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 5))
    {
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]);
      _XPCLog(5, @"%@: Connection event handler ignoring unknown XPC event: %s", v13, v14, v15, v16, v17, v18, (uint64_t)self);
    }
    goto LABEL_21;
  }
  if (_shouldLogBlock
    && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
  {
    xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
    _XPCLog(3, @"%@: Connection event handler received error: %s", v19, v20, v21, v22, v23, v24, (uint64_t)self);
  }
  if (xdict == (xpc_object_t)MEMORY[0x1E4F14528]) {
    goto LABEL_19;
  }
  if (xdict != (xpc_object_t)MEMORY[0x1E4F14520])
  {
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 3))
    {
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14530]);
      _XPCLog(3, @"%@: Connection event handler found unknown XPC Error: %s", v25, v26, v27, v28, v29, v30, (uint64_t)self);
    }
LABEL_19:
    connection = self->_connection;
    if (connection)
    {
      xpc_connection_cancel(connection);
      uint64_t v32 = self->_connection;
      self->_connection = 0;
    }
    goto LABEL_21;
  }
  if (_shouldLogBlock
    && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 7))
  {
    _XPCLog(7, @"%@: Connection event handler ignoring interrupted connection.", v33, v34, v35, v36, v37, v38, (uint64_t)self);
  }
LABEL_21:
}

- (id)debugDescription
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)XPCClientConnection;
  id v4 = [(XPCClientConnection *)&v7 description];
  int v5 = [v3 stringWithFormat:@"%@: name: %@, connection %p, delegate %p, queue %p", v4, self->_serviceName, self->_connection, self->_delegate, self->_queue];

  return v5;
}

@end