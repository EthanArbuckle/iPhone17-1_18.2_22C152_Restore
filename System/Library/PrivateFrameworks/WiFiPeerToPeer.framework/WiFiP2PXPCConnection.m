@interface WiFiP2PXPCConnection
+ (BOOL)directRequestOnEndpointType:(unint64_t)a3 error:(id *)a4 requesting:(id)a5;
+ (BOOL)supportsWiFiP2P;
+ (const)wifiPeerToPeerAvailableNotification;
+ (id)convertError:(int64_t)a3;
+ (id)directQueryOnEndpointType:(unint64_t)a3 error:(id *)a4 querying:(id)a5;
+ (id)directQueryOnEndpointType:(unint64_t)a3 exportedObject:(id)a4 withExportedInterface:(id)a5 error:(id *)a6 querying:(id)a7;
+ (id)endpointForEndpointType:(unint64_t)a3;
+ (id)frameworkBundle;
+ (id)localization;
+ (id)weakExportedObjectProxy:(id)a3;
+ (id)wifiPeerToPeerWorkloop;
+ (id)wifip2pRemoteXPCInterface;
+ (int64_t)defaultRetryTimeout;
- (WiFiP2PXPCConnection)initWithEndpointType:(unint64_t)a3 queue:(id)a4 retryTimeout:(int64_t)a5;
- (WiFiP2PXPCConnectionDelegate)delegate;
- (void)attemptConnection;
- (void)cleanUpRemovingNotifyToken:(BOOL)a3;
- (void)dealloc;
- (void)handleConnectionInvalidated;
- (void)handleError:(int64_t)a3;
- (void)invalidate;
- (void)reconnectOnAvailableNotification;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)withRemoteObjectProxy:(id)a3;
- (void)withRemoteObjectProxy:(id)a3 clientCompletionHandler:(id)a4;
- (void)withRemoteObjectProxy:(id)a3 clientErrorHandler:(id)a4;
@end

@implementation WiFiP2PXPCConnection

uint64_t __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[5])
  {
    v3 = (void *)v2[4];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_2;
    v17[3] = &unk_1E633EFF8;
    v4 = &v18;
    uint64_t v5 = *(void *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    v6 = [v3 remoteObjectProxyWithErrorHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E633EBE8;
    v7 = &v16;
    id v16 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v15);
  }
  else
  {
    [v2 attemptConnection];
    v8 = *(void **)(*(void *)(a1 + 32) + 64);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_4;
    v12 = &unk_1E633F020;
    v4 = &v13;
    id v13 = *(id *)(a1 + 40);
    v7 = &v14;
    id v14 = *(id *)(a1 + 48);
    v6 = (void *)MEMORY[0x1C187F470](&v9);
    objc_msgSend(v8, "addObject:", v6, v9, v10, v11, v12);
  }
}

- (void)withRemoteObjectProxy:(id)a3 clientCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke;
  block[3] = &unk_1E633F048;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)handleError:(int64_t)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = [(WiFiP2PXPCConnection *)self delegate];
  id v6 = self->_queuedRequests;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  queuedRequests = self->_queuedRequests;
  self->_queuedRequests = v7;

  if (a3)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = v6;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v24 + 1) + 8 * v13) + 16))(*(void *)(*((void *)&v24 + 1) + 8 * v13));
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v11);
    }

    char v14 = objc_opt_respondsToSelector();
    if (v14) {
      objc_msgSend(v5, "handleError:", a3, (void)v24);
    }
    -[WiFiP2PXPCConnection cleanUpRemovingNotifyToken:](self, "cleanUpRemovingNotifyToken:", v14 & 1, (void)v24);
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      connection = self->_connection;
      id v16 = [v5 remoteObjectInterface];
      [(NSXPCConnection *)connection setRemoteObjectInterface:v16];
    }
    v17 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
    id remoteObject = self->_remoteObject;
    self->_id remoteObject = v17;

    if (objc_opt_respondsToSelector()) {
      [v5 handleConnectionEstablishedWithProxy:self->_remoteObject];
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v19 = v6;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v28 + 1) + 8 * v23++) + 16))();
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v21);
    }
  }
}

uint64_t __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 || (v8 = (void *)*((void *)v5 + 4)) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
    }
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_5;
    v13[3] = &unk_1E633EFF8;
    uint64_t v9 = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_6;
    v11[3] = &unk_1E633EBE8;
    id v12 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v11);
  }
}

void __48__WiFiP2PXPCConnection_endpointForEndpointType___block_invoke_2(uint64_t a1, void *a2)
{
}

void __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleError:a2];
}

- (void)stop
{
}

- (void)reconnectOnAvailableNotification
{
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken < 0)
  {
    objc_initWeak(&location, self);
    v4 = +[WiFiP2PXPCConnection wifiPeerToPeerAvailableNotification];
    queue = self->_queue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__WiFiP2PXPCConnection_reconnectOnAvailableNotification__block_invoke;
    v6[3] = &unk_1E633F098;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch(v4, p_notifyToken, queue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (WiFiP2PXPCConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WiFiP2PXPCConnectionDelegate *)WeakRetained;
}

- (void)cleanUpRemovingNotifyToken:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = self->_queuedRequests;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  queuedRequests = self->_queuedRequests;
  self->_queuedRequests = v6;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = v5;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0, (void)v18);
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  id remoteObject = self->_remoteObject;
  self->_id remoteObject = 0;

  int notifyToken = self->_notifyToken;
  if ((notifyToken & 0x80000000) == 0 && v3)
  {
    notify_cancel(notifyToken);
    self->_int notifyToken = -1;
  }
  retryTimer = self->_retryTimer;
  if (retryTimer)
  {
    dispatch_source_cancel(retryTimer);
    v17 = self->_retryTimer;
    self->_retryTimer = 0;
  }
}

- (void)attemptConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_connection)
  {
    BOOL v3 = [(WiFiP2PXPCConnection *)self delegate];
    if (v3)
    {
      if (self->_retryTimeout < 0 || (objc_opt_respondsToSelector() & 1) == 0) {
        [(WiFiP2PXPCConnection *)self reconnectOnAvailableNotification];
      }
      v4 = +[WiFiP2PXPCConnection endpointForEndpointType:self->_endpointType];
      if (v4)
      {
        id remoteObject = self->_remoteObject;
        self->_id remoteObject = 0;

        id v6 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v4];
        connection = self->_connection;
        self->_connection = v6;

        [(NSXPCConnection *)self->_connection _setQueue:self->_queue];
        v8 = self->_connection;
        uint64_t v9 = +[WiFiP2PXPCConnection wifip2pRemoteXPCInterface];
        [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = self->_connection;
          uint64_t v11 = [v3 exportedInterface];
          [(NSXPCConnection *)v10 setExportedInterface:v11];
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = self->_connection;
          uint64_t v13 = [v3 exportedObject];
          id v14 = +[WiFiP2PXPCConnection weakExportedObjectProxy:v13];
          [(NSXPCConnection *)v12 setExportedObject:v14];
        }
        objc_initWeak(&location, self);
        v15 = self->_connection;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __41__WiFiP2PXPCConnection_attemptConnection__block_invoke;
        v25[3] = &unk_1E633EF30;
        objc_copyWeak(&v26, &location);
        [(NSXPCConnection *)v15 setInvalidationHandler:v25];
        id v16 = self->_connection;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_2;
        v23[3] = &unk_1E633EF30;
        objc_copyWeak(&v24, &location);
        [(NSXPCConnection *)v16 setInterruptionHandler:v23];
        v17 = self->_connection;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_3;
        v21[3] = &unk_1E633EF58;
        objc_copyWeak(&v22, &location);
        long long v18 = [(NSXPCConnection *)v17 remoteObjectProxyWithErrorHandler:v21];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_4;
        v19[3] = &unk_1E633EF80;
        objc_copyWeak(&v20, &location);
        [v3 startConnectionUsingProxy:v18 completionHandler:v19];

        [(NSXPCConnection *)self->_connection activate];
        objc_destroyWeak(&v20);
        objc_destroyWeak(&v22);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
      else
      {
        [(WiFiP2PXPCConnection *)self handleError:1];
      }
    }
  }
}

+ (id)wifip2pRemoteXPCInterface
{
  if (qword_1EB6F1648 != -1) {
    dispatch_once(&qword_1EB6F1648, &__block_literal_global_108);
  }
  v2 = (void *)qword_1EB6F1650;
  return v2;
}

+ (const)wifiPeerToPeerAvailableNotification
{
  return (const char *)[@"com.apple.wifip2pd.available" UTF8String];
}

+ (BOOL)supportsWiFiP2P
{
  if (qword_1EB6F1620 != -1) {
    dispatch_once(&qword_1EB6F1620, &__block_literal_global_3);
  }
  return _MergedGlobals_0;
}

+ (id)endpointForEndpointType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (+[WiFiP2PXPCConnection supportsWiFiP2P])
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    long long v18 = __Block_byref_object_dispose__0;
    id v19 = 0;
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.wifip2pd" options:4096];
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18154D8];
    [v4 setRemoteObjectInterface:v5];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __48__WiFiP2PXPCConnection_endpointForEndpointType___block_invoke;
    v13[3] = &unk_1E633EE68;
    void v13[4] = &v14;
    id v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v13];
    [v4 activate];
    pid_t v7 = getpid();
    int v8 = proc_name(v7, buffer, 0x20u);
    if (v8 < 1)
    {
      uint64_t v9 = &stru_1F1806D08;
    }
    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:buffer];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __48__WiFiP2PXPCConnection_endpointForEndpointType___block_invoke_2;
    v12[3] = &unk_1E633EE90;
    v12[4] = &v14;
    [v6 endpointForType:a3 processName:v9 completionHandler:v12];
    if (v8 >= 1) {

    }
    [v4 invalidate];
    id v10 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void __39__WiFiP2PXPCConnection_supportsWiFiP2P__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, @"com.apple.wifip2pd", 0);
    if (v2)
    {
      CFBooleanRef v3 = v2;
      CFTypeID v4 = CFGetTypeID(v2);
      BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) != 0;
      CFRelease(v3);
    }
    else
    {
      BOOL v5 = 0;
    }
    CFRelease(v1);
  }
  else
  {
    BOOL v5 = 0;
  }
  getpid();
  int v6 = sandbox_check();
  if (v6 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v10 = *__error();
      buffer[0] = 67109120;
      buffer[1] = v10;
      _os_log_error_impl(&dword_1BD645000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to check sandbox profile: %{errno}d", (uint8_t *)buffer, 8u);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = v6 == 0;
  }
  pid_t v8 = getpid();
  uint64_t v9 = (const char *)buffer;
  if (proc_name(v8, buffer, 0x20u) <= 0) {
    uint64_t v9 = "unknown";
  }
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = v9;
    _os_log_fault_impl(&dword_1BD645000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Process %{public}s is missing entitlement required for peer to peer Wi-Fi access: <key>com.apple.wifip2pd</key><true/>", buf, 0xCu);
    if (v7) {
      goto LABEL_22;
    }
  }
  else if (v7)
  {
    goto LABEL_22;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = v9;
    _os_log_fault_impl(&dword_1BD645000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Process %{public}s is missing sandbox rule for peer to peer Wi-Fi access: (allow mach-lookup (global-name \"com.apple.wifip2pd\"))", buf, 0xCu);
  }
LABEL_22:
  _MergedGlobals_0 = v5 && v7;
}

void __48__WiFiP2PXPCConnection_endpointForEndpointType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  CFBooleanRef v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

+ (id)directQueryOnEndpointType:(unint64_t)a3 exportedObject:(id)a4 withExportedInterface:(id)a5 error:(id *)a6 querying:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, uint64_t, void *))a7;
  uint64_t v14 = +[WiFiP2PXPCConnection endpointForEndpointType:a3];
  if (v14)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v14];
    if (v12)
    {
      uint64_t v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v12];
      [v15 setExportedInterface:v16];
    }
    [v15 setExportedObject:v11];
    v17 = +[WiFiP2PXPCConnection wifip2pRemoteXPCInterface];
    [v15 setRemoteObjectInterface:v17];

    [v15 activate];
    uint64_t v30 = 0;
    long long v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__0;
    uint64_t v34 = __Block_byref_object_dispose__0;
    id v35 = 0;
    uint64_t v24 = 0;
    long long v25 = &v24;
    uint64_t v26 = 0x3032000000;
    long long v27 = __Block_byref_object_copy__0;
    long long v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __102__WiFiP2PXPCConnection_directQueryOnEndpointType_exportedObject_withExportedInterface_error_querying___block_invoke;
    v23[3] = &unk_1E633EEB8;
    void v23[4] = &v24;
    v23[5] = &v30;
    uint64_t v18 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v23];
    id v19 = (void *)v18;
    if (v15 && v18)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__WiFiP2PXPCConnection_directQueryOnEndpointType_exportedObject_withExportedInterface_error_querying___block_invoke_2;
      v22[3] = &unk_1E633EEE0;
      v22[4] = &v30;
      v13[2](v13, v18, v22);
      if (a6) {
        *a6 = (id) v25[5];
      }
      [v15 invalidate];
    }
    else
    {
      [v15 invalidate];
      if (a6 && !*a6)
      {
        *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:102 userInfo:0];
      }
    }
    id v20 = (id)v31[5];

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else if (a6)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:0];
    id v20 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

void __102__WiFiP2PXPCConnection_directQueryOnEndpointType_exportedObject_withExportedInterface_error_querying___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __102__WiFiP2PXPCConnection_directQueryOnEndpointType_exportedObject_withExportedInterface_error_querying___block_invoke_2(uint64_t a1, void *a2)
{
}

+ (id)directQueryOnEndpointType:(unint64_t)a3 error:(id *)a4 querying:(id)a5
{
  return +[WiFiP2PXPCConnection directQueryOnEndpointType:a3 exportedObject:0 withExportedInterface:0 error:a4 querying:a5];
}

+ (BOOL)directRequestOnEndpointType:(unint64_t)a3 error:(id *)a4 requesting:(id)a5
{
  id v7 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__WiFiP2PXPCConnection_directRequestOnEndpointType_error_requesting___block_invoke;
  v13[3] = &unk_1E633EF08;
  id v8 = v7;
  id v14 = v8;
  uint64_t v9 = +[WiFiP2PXPCConnection directQueryOnEndpointType:a3 error:a4 querying:v13];
  int v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 integerValue];
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v11 = 7;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!*a4)
  {
    *a4 = +[WiFiP2PXPCConnection convertError:v11];
  }
LABEL_7:

  return v11 == 0;
}

void __69__WiFiP2PXPCConnection_directRequestOnEndpointType_error_requesting___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__WiFiP2PXPCConnection_directRequestOnEndpointType_error_requesting___block_invoke_2;
  v9[3] = &unk_1E633EBE8;
  id v10 = v5;
  id v7 = *(void (**)(uint64_t, uint64_t, void *))(v6 + 16);
  id v8 = v5;
  v7(v6, a2, v9);
}

void __69__WiFiP2PXPCConnection_directRequestOnEndpointType_error_requesting___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (WiFiP2PXPCConnection)initWithEndpointType:(unint64_t)a3 queue:(id)a4 retryTimeout:(int64_t)a5
{
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WiFiP2PXPCConnection;
  id v10 = [(WiFiP2PXPCConnection *)&v18 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_endpointType = a3;
    v10->_retryTimeout = a5;
    objc_storeStrong((id *)&v10->_queue, a4);
    connection = v11->_connection;
    v11->_connection = 0;

    id remoteObject = v11->_remoteObject;
    v11->_id remoteObject = 0;

    retryTimer = v11->_retryTimer;
    v11->_retryTimer = 0;

    v11->_int notifyToken = -1;
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    queuedRequests = v11->_queuedRequests;
    v11->_queuedRequests = (NSMutableArray *)v15;
  }
  return v11;
}

- (void)dealloc
{
  [(WiFiP2PXPCConnection *)self stop];
  v3.receiver = self;
  v3.super_class = (Class)WiFiP2PXPCConnection;
  [(WiFiP2PXPCConnection *)&v3 dealloc];
}

void __41__WiFiP2PXPCConnection_attemptConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleConnectionInvalidated];
}

void __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[4] setInvalidationHandler:0];
    [v2[4] invalidate];
    [v2 handleConnectionInvalidated];
    id WeakRetained = v2;
  }
}

void __41__WiFiP2PXPCConnection_attemptConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleError:1];
}

- (void)withRemoteObjectProxy:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__WiFiP2PXPCConnection_withRemoteObjectProxy___block_invoke;
  v7[3] = &unk_1E633EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __46__WiFiP2PXPCConnection_withRemoteObjectProxy___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[5])
  {
    objc_super v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    [v2 attemptConnection];
    id v4 = *(void **)(*(void *)(a1 + 32) + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__WiFiP2PXPCConnection_withRemoteObjectProxy___block_invoke_2;
    v6[3] = &unk_1E633EFA8;
    id v7 = *(id *)(a1 + 40);
    id v5 = (void *)MEMORY[0x1C187F470](v6);
    [v4 addObject:v5];
  }
}

void __46__WiFiP2PXPCConnection_withRemoteObjectProxy___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a2 && v5[5])
  {
    id v6 = v5;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = v6;
  }
}

uint64_t __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __70__WiFiP2PXPCConnection_withRemoteObjectProxy_clientCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)withRemoteObjectProxy:(id)a3 clientErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke;
  block[3] = &unk_1E633F048;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[5])
  {
    objc_super v3 = (void *)v2[4];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_2;
    v17[3] = &unk_1E633EFF8;
    id v4 = &v18;
    uint64_t v5 = *(void *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v6 = [v3 remoteObjectProxyWithErrorHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_3;
    v15[3] = &unk_1E633EFF8;
    id v7 = &v16;
    id v16 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v15);
  }
  else
  {
    [v2 attemptConnection];
    id v8 = *(void **)(*(void *)(a1 + 32) + 64);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_4;
    id v12 = &unk_1E633F020;
    id v4 = &v13;
    id v13 = *(id *)(a1 + 40);
    id v7 = &v14;
    id v14 = *(id *)(a1 + 48);
    id v6 = (void *)MEMORY[0x1C187F470](&v9);
    objc_msgSend(v8, "addObject:", v6, v9, v10, v11, v12);
  }
}

uint64_t __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2 || (uint64_t v9 = (void *)*((void *)v5 + 4)) == 0)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      id v8 = +[WiFiP2PXPCConnection convertError:a2];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
    }
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_5;
    v14[3] = &unk_1E633EFF8;
    uint64_t v10 = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_6;
    v12[3] = &unk_1E633EFF8;
    id v13 = *(id *)(a1 + 40);
    (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v12);
  }
}

uint64_t __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __65__WiFiP2PXPCConnection_withRemoteObjectProxy_clientErrorHandler___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WiFiP2PXPCConnection_start__block_invoke;
  block[3] = &unk_1E633F070;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __29__WiFiP2PXPCConnection_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) attemptConnection];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__WiFiP2PXPCConnection_invalidate__block_invoke;
  block[3] = &unk_1E633F070;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __34__WiFiP2PXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

- (void)handleConnectionInvalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  connection = self->_connection;
  self->_connection = 0;

  id remoteObject = self->_remoteObject;
  self->_id remoteObject = 0;

  objc_initWeak(&location, self);
  int64_t retryTimeout = self->_retryTimeout;
  if (retryTimeout)
  {
    if (retryTimeout >= 1)
    {
      retryTimer = self->_retryTimer;
      if (retryTimer)
      {
        dispatch_source_cancel(retryTimer);
        uint64_t v7 = self->_retryTimer;
        self->_retryTimer = 0;
      }
      id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
      uint64_t v9 = self->_retryTimer;
      self->_retryTimer = v8;

      uint64_t v10 = self->_retryTimer;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__WiFiP2PXPCConnection_handleConnectionInvalidated__block_invoke;
      v13[3] = &unk_1E633EF30;
      objc_copyWeak(&v14, &location);
      dispatch_source_set_event_handler(v10, v13);
      uint64_t v11 = self->_retryTimer;
      dispatch_time_t v12 = dispatch_time(0, self->_retryTimeout);
      dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
      dispatch_activate((dispatch_object_t)self->_retryTimer);
      objc_destroyWeak(&v14);
    }
  }
  else
  {
    [(WiFiP2PXPCConnection *)self attemptConnection];
  }
  objc_destroyWeak(&location);
}

void __51__WiFiP2PXPCConnection_handleConnectionInvalidated__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[7];
    WeakRetained[7] = 0;
    id v3 = WeakRetained;

    [v3 attemptConnection];
    id WeakRetained = v3;
  }
}

void __56__WiFiP2PXPCConnection_reconnectOnAvailableNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained attemptConnection];
}

+ (id)wifiPeerToPeerWorkloop
{
  if (qword_1EB6F1628 != -1) {
    dispatch_once(&qword_1EB6F1628, &__block_literal_global_96);
  }
  uint64_t v2 = (void *)qword_1EB6F1630;
  return v2;
}

uint64_t __46__WiFiP2PXPCConnection_wifiPeerToPeerWorkloop__block_invoke()
{
  qword_1EB6F1630 = (uint64_t)dispatch_workloop_create("com.apple.framework.WiFiPeerToPeer");
  return MEMORY[0x1F41817F8]();
}

+ (int64_t)defaultRetryTimeout
{
  return 1000000000;
}

+ (id)convertError:(int64_t)a3
{
  uint64_t v5 = 16;
  id v6 = 0;
  switch(a3)
  {
    case 0:
      goto LABEL_10;
    case 1:
      uint64_t v5 = 57;
      goto LABEL_9;
    case 2:
      uint64_t v5 = 22;
      goto LABEL_9;
    case 3:
      uint64_t v5 = 2;
      goto LABEL_9;
    case 4:
      uint64_t v5 = 12;
      goto LABEL_9;
    case 6:
      uint64_t v5 = 1;
      goto LABEL_9;
    case 7:
      uint64_t v5 = 35;
      goto LABEL_9;
    case 8:
      uint64_t v5 = 45;
      goto LABEL_9;
    default:
LABEL_9:
      id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], v5, 0, v3);
LABEL_10:
      return v6;
  }
}

+ (id)frameworkBundle
{
  if (qword_1EB6F1640 != -1) {
    dispatch_once(&qword_1EB6F1640, &__block_literal_global_99);
  }
  uint64_t v2 = (void *)qword_1EB6F1638;
  return v2;
}

void __39__WiFiP2PXPCConnection_frameworkBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v1 = (void *)qword_1EB6F1638;
  qword_1EB6F1638 = v0;

  if (!qword_1EB6F1638)
  {
    qword_1EB6F1638 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/PrivateFrameworks/WiFiPeerToPeer.framework"];
    MEMORY[0x1F41817F8]();
  }
}

+ (id)localization
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = +[WiFiP2PXPCConnection frameworkBundle];
  uint64_t v4 = [v3 localizations];
  uint64_t v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v6 = [v2 preferredLocalizationsFromArray:v4 forPreferences:v5];
  uint64_t v7 = [v6 firstObject];

  if (!v7)
  {
    id v8 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v9 = +[WiFiP2PXPCConnection frameworkBundle];
    uint64_t v10 = [v9 localizations];
    uint64_t v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    dispatch_time_t v12 = [v11 localeIdentifier];
    v17[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    id v14 = [v8 preferredLocalizationsFromArray:v10 forPreferences:v13];
    uint64_t v7 = [v14 firstObject];

    if (!v7)
    {
      id v15 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v7 = [v15 localeIdentifier];
    }
  }
  return v7;
}

+ (id)weakExportedObjectProxy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(WiFiP2PXPCExportedObjectProxy);
  [(WiFiP2PXPCExportedObjectProxy *)v4 setExportedObject:v3];

  return v4;
}

void __49__WiFiP2PXPCConnection_wifip2pRemoteXPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1815538];
  uint64_t v1 = (void *)qword_1EB6F1650;
  qword_1EB6F1650 = v0;

  uint64_t v2 = (void *)qword_1EB6F1650;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v5 forSelector:sel_updateAWDLLTERestrictedChannels_completionHandler_ argumentIndex:0 ofReply:0];
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedRequests, 0);
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong(&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end