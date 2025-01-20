@interface XPCNSServiceConnection
- (NSObject)context;
- (NSString)serviceName;
- (XPCNSServiceConnection)initWithXPCServiceConnection:(id)a3;
- (XPCNSServiceConnectionDelegate)delegate;
- (void)XPCServiceConnection:(id)a3 didReceiveRequest:(id)a4 sequenceNumber:(unint64_t)a5;
- (void)XPCServiceConnectionDidDisconnect:(id)a3;
- (void)sendMessage:(id)a3 withHandler:(id)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
@end

@implementation XPCNSServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)setContext:(id)a3
{
}

- (NSObject)context
{
  return self->_context;
}

- (void)setDelegate:(id)a3
{
}

- (XPCNSServiceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XPCNSServiceConnectionDelegate *)WeakRetained;
}

- (void)shutDownCompletionBlock:(id)a3
{
}

- (void)XPCServiceConnectionDidDisconnect:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained XPCNSServiceConnectionDidDisconnect:self];
}

- (void)XPCServiceConnection:(id)a3 didReceiveRequest:(id)a4 sequenceNumber:(unint64_t)a5
{
  p_delegate = &self->_delegate;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v9 = [[XPCNSRequest alloc] initWithXPCRequest:v8];

  [WeakRetained XPCNSServiceConnection:self didReceiveRequest:v9 sequenceNumber:a5];
}

- (NSString)serviceName
{
  return [(XPCServiceConnection *)self->_serviceConnection serviceName];
}

- (void)sendMessage:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  int inserted = _insertMessage(v8, v7, 0, 0, 0);

  if (inserted)
  {
    serviceConnection = self->_serviceConnection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__XPCNSServiceConnection_sendMessage_withHandler___block_invoke;
    v11[3] = &unk_1E6CFCEB8;
    v11[4] = self;
    id v12 = v6;
    [(XPCServiceConnection *)serviceConnection sendMessage:v8 withHandler:v11];
  }
}

void __50__XPCNSServiceConnection_sendMessage_withHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    id v4 = 0;
  }
  else
  {
    id v12 = 0;
    char v5 = _unpack(a3, &v12, 0);
    id v4 = v12;
    if ((v5 & 1) == 0 && _shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))()) {
      _XPCLog(3, @"%@: Could not unserialize reply.", v6, v7, v8, v9, v10, v11, *(void *)(a1 + 32));
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (XPCNSServiceConnection)initWithXPCServiceConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XPCNSServiceConnection;
  uint64_t v6 = [(XPCNSServiceConnection *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceConnection, a3);
    [(XPCServiceConnection *)v7->_serviceConnection setDelegate:v7];
    [(XPCServiceConnection *)v7->_serviceConnection setContext:v7];
  }

  return v7;
}

@end