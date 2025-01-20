@interface XPCRequest
- (OS_xpc_object)message;
- (OS_xpc_object)reply;
- (XPCRequest)initWithMessage:(id)a3 sequence:(unint64_t)a4 connection:(id)a5;
- (unint64_t)sequence;
- (void)sendReply;
@end

@implementation XPCRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong(&self->_handler, 0);
}

- (OS_xpc_object)reply
{
  return self->_reply;
}

- (OS_xpc_object)message
{
  return self->_message;
}

- (unint64_t)sequence
{
  return self->_sequence;
}

- (XPCRequest)initWithMessage:(id)a3 sequence:(unint64_t)a4 connection:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)XPCRequest;
  v11 = [(XPCRequest *)&v23 init];
  if (v11)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v9);
    objc_storeStrong((id *)&v11->_reply, reply);
    objc_storeStrong((id *)&v11->_message, a3);
    v11->_sequence = a4;
    objc_initWeak(&location, v11);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__XPCRequest_initWithMessage_sequence_connection___block_invoke;
    v18[3] = &unk_1E6CFCCD8;
    id v19 = reply;
    v21[1] = (id)a4;
    id v20 = v10;
    id v13 = reply;
    objc_copyWeak(v21, &location);
    uint64_t v14 = MEMORY[0x1E01C17F0](v18);
    id handler = v11->_handler;
    v11->_id handler = (id)v14;

    v16 = v11;
    objc_destroyWeak(v21);

    objc_destroyWeak(&location);
  }

  return v11;
}

void __50__XPCRequest_initWithMessage_sequence_connection___block_invoke(uint64_t a1)
{
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "__xpcseq", *(void *)(a1 + 56));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    _XPCLog(7, @"%@ Sent reply to request.", v2, v3, v4, v5, v6, v7, (uint64_t)WeakRetained);
  }
}

- (void)sendReply
{
}

@end