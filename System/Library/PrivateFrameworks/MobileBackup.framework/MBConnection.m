@interface MBConnection
- (MBConnection)initWithServiceName:(id)a3;
- (MBConnection)initWithServiceName:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (MBConnection)initWithXPCConnection:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (MBConnectionDelegate)delegate;
- (NSString)personaIdentifier;
- (NSString)processName;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)xpcConnection;
- (id)description;
- (id)sendMessageWithReplyAndSync:(id)a3 error:(id *)a4;
- (void)_handleXPCError:(id)a3;
- (void)_handleXPCEvent:(id)a3;
- (void)_refreshProcessInfoWithXPCConnection:(id)a3;
- (void)_setEventHandlerForXPCConnection:(id)a3;
- (void)cancel;
- (void)resume;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 barrierBlock:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setPersonaIdentifier:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)suspend;
@end

@implementation MBConnection

- (MBConnection)initWithXPCConnection:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  v9 = (_xpc_connection_s *)a3;
  id v10 = a4;
  v11 = a5;
  if (!v9) {
    -[MBConnection initWithXPCConnection:delegate:delegateQueue:]();
  }
  v12 = v11;
  if (!v11) {
    -[MBConnection initWithXPCConnection:delegate:delegateQueue:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)MBConnection;
  v13 = [(MBConnection *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v14->_queue, a5);
    xpc_connection_set_target_queue(v9, v12);
    [(MBConnection *)v14 _setEventHandlerForXPCConnection:v9];
    [(MBConnection *)v14 _refreshProcessInfoWithXPCConnection:v9];
    objc_storeStrong((id *)&v14->_xpcConnection, a3);
    v15 = [MEMORY[0x1E4FB3700] currentPersona];
    uint64_t v16 = [v15 userPersonaUniqueString];
    personaIdentifier = v14->_personaIdentifier;
    v14->_personaIdentifier = (NSString *)v16;
  }
  return v14;
}

- (MBConnection)initWithServiceName:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_queue_t v10 = (dispatch_queue_t)a5;
  v26.receiver = self;
  v26.super_class = (Class)MBConnection;
  v11 = [(MBConnection *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v9);
    id v13 = [NSString alloc];
    v14 = (objc_class *)objc_opt_class();
    v15 = objc_msgSend(v13, "initWithFormat:", @"%s.%p", class_getName(v14), v12);
    uint64_t v16 = v15;
    if (!v10)
    {
      v17 = (const char *)[v15 UTF8String];
      v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v10 = dispatch_queue_create(v17, v18);
    }
    objc_storeStrong((id *)&v12->_queue, v10);
    objc_super v19 = (objc_class *)objc_opt_class();
    Name = class_getName(v19);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = dispatch_queue_create(Name, v21);

    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v8 UTF8String], v22, 0);
    [(MBConnection *)v12 _setEventHandlerForXPCConnection:mach_service];
    atomic_store(0, (unsigned int *)&v12->_pid);
    xpcConnection = v12->_xpcConnection;
    v12->_xpcConnection = mach_service;
  }
  return v12;
}

- (MBConnection)initWithServiceName:(id)a3
{
  return [(MBConnection *)self initWithServiceName:a3 delegate:0 delegateQueue:0];
}

- (void)_refreshProcessInfoWithXPCConnection:(id)a3
{
  v3 = (unsigned int *)MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  pid_t pid = xpc_connection_get_pid(v4);
  if (pid)
  {
    int v6 = pid;
    atomic_store(pid, v3 + 2);
    if (MBIsRunningInDaemon())
    {
      int v7 = proc_pidpath(v6, buffer, 0x1000u);
      if (v7 < 1)
      {
        id v9 = 0;
      }
      else
      {
        id v8 = (void *)[[NSString alloc] initWithBytes:buffer length:v7 encoding:4];
        id v9 = [v8 lastPathComponent];
      }
      [v3 setProcessName:v9];
    }
  }
}

- (void)_setEventHandlerForXPCConnection:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__MBConnection__setEventHandlerForXPCConnection___block_invoke;
  v6[3] = &unk_1E6D013F8;
  v6[4] = self;
  id v7 = v4;
  v5 = (_xpc_connection_s *)v4;
  xpc_connection_set_event_handler(v5, v6);
}

void __49__MBConnection__setEventHandlerForXPCConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MBConnection__setEventHandlerForXPCConnection___block_invoke_2;
  block[3] = &unk_1E6D01300;
  v5 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __49__MBConnection__setEventHandlerForXPCConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!atomic_load((unsigned int *)(*(void *)(a1 + 32) + 8))) {
    [*(id *)(a1 + 32) _refreshProcessInfoWithXPCConnection:*(void *)(a1 + 40)];
  }
  uint64_t v3 = MEMORY[0x1E01C3220](*(void *)(a1 + 48));
  if (v3 == MEMORY[0x1E4F14590])
  {
    v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 48);
    [v14 _handleXPCEvent:v15];
  }
  else if (v3 == MEMORY[0x1E4F145A8])
  {
    [*(id *)(a1 + 32) _handleXPCError:*(void *)(a1 + 48)];
    if (*(void *)(a1 + 48) == MEMORY[0x1E4F14520]
      && atomic_exchange((atomic_uint *volatile)(*(void *)(a1 + 32) + 8), 0))
    {
      uint64_t v16 = *(void **)(a1 + 32);
      [v16 setProcessName:0];
    }
  }
  else
  {
    id v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = MBStringWithXPCObject();
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1DD9AE000, v4, OS_LOG_TYPE_ERROR, "%@ Received unexpected XPC message: %@", buf, 0x16u);

      uint64_t v7 = *(void *)(a1 + 32);
      v17 = MBStringWithXPCObject();
      _MBLog(@"ERROR", (uint64_t)"%@ Received unexpected XPC message: %@", v8, v9, v10, v11, v12, v13, v7);
    }
  }
}

- (void)_handleXPCEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MBConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [[MBMessage alloc] _initWithXPCObject:v4];
  if ((MBIsRunningInDaemon() & 1) == 0)
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_INFO, "%{public}@ received %{public}@", buf, 0x16u);
      _MBLog(@"INFO", (uint64_t)"%{public}@ received %{public}@", v8, v9, v10, v11, v12, v13, (uint64_t)self);
    }
  }
  v14 = [(MBConnection *)self delegate];
  [v14 connection:self didReceiveMessage:v6];
}

- (void)_handleXPCError:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MBConnection *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(MBConnection *)self delegate];
  if (a3 == (id)MEMORY[0x1E4F14528])
  {
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = self;
      __int16 v23 = 1024;
      BOOL v24 = v6 != 0;
      _os_log_impl(&dword_1DD9AE000, v14, OS_LOG_TYPE_INFO, "%{public}@ was invalidated (%d)", buf, 0x12u);
      _MBLog(@"INFO", (uint64_t)"%{public}@ was invalidated (%d)", v15, v16, v17, v18, v19, v20, (uint64_t)self);
    }

    [v6 connectionWasInvalidated:self];
  }
  else if (a3 == (id)MEMORY[0x1E4F14520])
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = self;
      __int16 v23 = 1024;
      BOOL v24 = v6 != 0;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_INFO, "%{public}@ was interrupted (%d)", buf, 0x12u);
      _MBLog(@"INFO", (uint64_t)"%{public}@ was interrupted (%d)", v8, v9, v10, v11, v12, v13, (uint64_t)self);
    }

    [v6 connectionWasInterrupted:self];
  }
}

- (void)sendMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1DD9AE000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ sending %@", buf, 0x16u);
    _MBLog(@"DEBUG", (uint64_t)"%{public}@ sending %@", v6, v7, v8, v9, v10, v11, (uint64_t)self);
  }

  uint64_t v12 = [v4 _xpcObject];
  xpc_connection_send_message(self->_xpcConnection, v12);
}

- (void)sendMessage:(id)a3 barrierBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1DD9AE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ sending (barrier) %@", buf, 0x16u);
    _MBLog(@"DEFAULT", (uint64_t)"%{public}@ sending (barrier) %@", v9, v10, v11, v12, v13, v14, (uint64_t)self);
  }

  __int16 v15 = [v6 _xpcObject];
  xpc_connection_send_message(self->_xpcConnection, v15);
  xpc_connection_send_barrier(self->_xpcConnection, v7);
}

- (id)sendMessageWithReplyAndSync:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 name];

  if (!v8)
  {
    objc_super v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"MBConnection.m" lineNumber:189 description:@"message must have a name"];
  }
  uint64_t v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v29 = self;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_1DD9AE000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ sending %@", buf, 0x16u);
    id v27 = v7;
    _MBLog(@"DEBUG", (uint64_t)"%{public}@ sending %@", v10, v11, v12, v13, v14, v15, (uint64_t)self);
  }

  id v16 = [v7 _xpcObject];
  uint64_t v17 = self->_xpcConnection;
  xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(v17, v16);
  if (MEMORY[0x1E01C3220]() == MEMORY[0x1E4F14590])
  {
    id v22 = [[MBMessage alloc] _initWithXPCObject:v18];
    __int16 v23 = 0;
  }
  else
  {
    id v19 = v18;
    uint64_t v20 = v19;
    if (v19 == (id)MEMORY[0x1E4F14528])
    {
      v21 = MBStringWithXPCObject();
      +[MBError errorWithCode:20, @"%@", v21, v27 format];
    }
    else if (v19 == (id)MEMORY[0x1E4F14520])
    {
      v21 = MBStringWithXPCObject();
      +[MBError errorWithCode:19, @"%@", v21, v27 format];
    }
    else
    {
      v21 = MBStringWithXPCObject();
      +[MBError errorWithCode:18, @"%@", v21, v27 format];
    __int16 v23 = };

    id v22 = 0;
  }
  if (!atomic_load((unsigned int *)&self->_pid)) {
    [(MBConnection *)self _refreshProcessInfoWithXPCConnection:v17];
  }
  if (a4 && v23) {
    *a4 = v23;
  }

  return v22;
}

- (void)cancel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = self;
    _os_log_impl(&dword_1DD9AE000, v3, OS_LOG_TYPE_INFO, "Canceling %{public}@", buf, 0xCu);
    _MBLog(@"INFO", (uint64_t)"Canceling %{public}@", v4, v5, v6, v7, v8, v9, (uint64_t)self);
  }

  [(MBConnection *)self setDelegate:0];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection) {
    xpc_connection_cancel(xpcConnection);
  }
}

- (void)suspend
{
}

- (void)resume
{
}

- (id)description
{
  uint64_t v3 = atomic_load((unsigned int *)&self->_pid);
  if (v3)
  {
    uint64_t v4 = [(MBConnection *)self processName];
    uint64_t v5 = NSString;
    uint64_t v6 = objc_opt_class();
    if (v4) {
      [v5 stringWithFormat:@"<%@: %p; %@(%d)>", v6, self, v4, v3];
    }
    else {
    uint64_t v7 = [v5 stringWithFormat:@"<%@: %p; %d>", v6, self, v3, v9];
    }
  }
  else
  {
    uint64_t v7 = [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
  }
  return v7;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProcessName:(id)a3
{
}

- (NSString)personaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPersonaIdentifier:(id)a3
{
}

- (MBConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)initWithXPCConnection:delegate:delegateQueue:.cold.1()
{
}

- (void)initWithXPCConnection:delegate:delegateQueue:.cold.2()
{
}

@end