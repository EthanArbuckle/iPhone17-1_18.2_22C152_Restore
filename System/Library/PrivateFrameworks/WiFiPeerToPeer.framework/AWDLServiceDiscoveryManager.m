@interface AWDLServiceDiscoveryManager
- (AWDLServiceDiscoveryManager)init;
- (BOOL)_requiresConnection;
- (BOOL)_usingAWDLDiscoveryManagerProxy:(id)a3 onSuccess:(id)a4 error:(id *)a5;
- (BOOL)clearTrafficRegistration:(id)a3 error:(id *)a4;
- (BOOL)getActiveTrafficRegistrationWithCompletionHandler:(id)a3;
- (BOOL)performRealtimeConnectivityCheckWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)resumeAWDLWithError:(id *)a3;
- (BOOL)setTrafficRegistration:(id)a3 error:(id *)a4;
- (BOOL)setTrafficRegistration:(id)a3 onInvalidationHandler:(id)a4 error:(id *)a5;
- (BOOL)suspendAWDLWithError:(id *)a3;
- (void)_destroyConnection;
- (void)_removeFirstTrafficRegistrationMatching:(id)a3;
- (void)_retryConnection;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)invalidatedActiveTrafficRegistration:(id)a3;
@end

@implementation AWDLServiceDiscoveryManager

- (AWDLServiceDiscoveryManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AWDLServiceDiscoveryManager;
  v2 = [(AWDLServiceDiscoveryManager *)&v8 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v2->_lock;
    v2->_lock = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    activeTrafficRegistrations = v2->_activeTrafficRegistrations;
    v2->_activeTrafficRegistrations = (NSMutableArray *)v5;

    v2->_suspendCount = 0;
    v2->_notifyToken = -1;
  }
  return v2;
}

- (void)dealloc
{
  [(NSLock *)self->_lock lock];
  [(AWDLServiceDiscoveryManager *)self _destroyConnection];
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  self->_int notifyToken = -1;
  [(NSLock *)self->_lock unlock];
  v4.receiver = self;
  v4.super_class = (Class)AWDLServiceDiscoveryManager;
  [(AWDLServiceDiscoveryManager *)&v4 dealloc];
}

- (BOOL)_requiresConnection
{
  return [(NSMutableArray *)self->_activeTrafficRegistrations count] || self->_suspendCount > 0;
}

- (void)_destroyConnection
{
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)_retryConnection
{
  if ([(AWDLServiceDiscoveryManager *)self _requiresConnection])
  {
    if (!self->_xpcConnection)
    {
      self->_attemptedReconnect = 0;
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __47__AWDLServiceDiscoveryManager__retryConnection__block_invoke;
      v3[3] = &unk_1E633F380;
      v3[4] = self;
      [(AWDLServiceDiscoveryManager *)self _usingAWDLDiscoveryManagerProxy:v3 onSuccess:0 error:0];
    }
  }
}

void __47__AWDLServiceDiscoveryManager__retryConnection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "trafficRegistration:enabled:completionHandler:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), 1, &__block_literal_global_88, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  if (*(uint64_t *)(*(void *)(a1 + 32) + 40) >= 1) {
    [v3 setAWDLSuspendedState:1 completionHandler:&__block_literal_global_90];
  }
}

- (void)connectionInvalidated
{
  [(NSLock *)self->_lock lock];
  [(AWDLServiceDiscoveryManager *)self _destroyConnection];
  if ([(NSMutableArray *)self->_activeTrafficRegistrations count] && !self->_attemptedReconnect)
  {
    [(AWDLServiceDiscoveryManager *)self _retryConnection];
    self->_attemptedReconnect = 1;
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (BOOL)_usingAWDLDiscoveryManagerProxy:(id)a3 onSuccess:(id)a4 error:(id *)a5
{
  uint64_t v8 = (void (**)(id, void *, void *))a3;
  long long v9 = (void (**)(id, AWDLServiceDiscoveryManager *))a4;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  objc_initWeak(&location, self);
  p_int notifyToken = &self->_notifyToken;
  if (self->_notifyToken == -1)
  {
    long long v11 = +[WiFiP2PXPCConnection wifiPeerToPeerAvailableNotification];
    long long v12 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke;
    handler[3] = &unk_1E633F098;
    objc_copyWeak(&v55, &location);
    notify_register_dispatch(v11, &self->_notifyToken, v12, handler);

    objc_destroyWeak(&v55);
  }
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__1;
  v52 = __Block_byref_object_dispose__1;
  id v53 = 0;
  p_xpcConnection = &self->_xpcConnection;
  xpcConnection = self->_xpcConnection;
  if (xpcConnection) {
    goto LABEL_7;
  }
  v15 = +[WiFiP2PXPCConnection endpointForEndpointType:0];
  if (v15)
  {
    v32 = v9;
    v33 = v15;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__1;
    v46 = __Block_byref_object_dispose__1;
    id v47 = (id)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v15];
    v16 = (void *)v43[5];
    v17 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1815538];
    [v16 setRemoteObjectInterface:v17];

    v18 = (void *)v43[5];
    v19 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1813410];
    [v18 setExportedInterface:v19];

    v20 = (void *)v43[5];
    v21 = +[WiFiP2PXPCConnection weakExportedObjectProxy:self];
    [v20 setExportedObject:v21];

    [(id)v43[5] activate];
    v22 = (void *)v43[5];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_131;
    v41[3] = &unk_1E633EEB8;
    v41[4] = &v48;
    v41[5] = &v42;
    v23 = [v22 synchronousRemoteObjectProxyWithErrorHandler:v41];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_2;
    v40[3] = &unk_1E633F3A8;
    v40[4] = &v48;
    v40[5] = &v42;
    [v23 createXPCResponderWithType:1 completionHandler:v40];

    v24 = (void *)v43[5];
    v25 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18156B8];
    [v24 setRemoteObjectInterface:v25];

    v26 = (void *)v43[5];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_3;
    v38[3] = &unk_1E633EF30;
    objc_copyWeak(&v39, &location);
    [v26 setInvalidationHandler:v38];
    v27 = (void *)v43[5];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_5;
    v36[3] = &unk_1E633EF30;
    objc_copyWeak(&v37, &location);
    [v27 setInterruptionHandler:v36];
    objc_storeStrong((id *)&self->_xpcConnection, (id)v43[5]);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    _Block_object_dispose(&v42, 8);

    long long v9 = v32;
    v15 = v33;
  }

  xpcConnection = *p_xpcConnection;
  if (*p_xpcConnection)
  {
LABEL_7:
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_7;
    v35[3] = &unk_1E633EE68;
    v35[4] = &v48;
    v28 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v35, v32);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_8;
    v34[3] = &unk_1E633EEB8;
    v34[4] = &v57;
    v34[5] = &v48;
    v8[2](v8, v28, v34);
  }
  if (a5)
  {
    unint64_t v29 = (unint64_t) (id) v49[5];
    *a5 = (id)v29;
    if (!((unint64_t)*p_xpcConnection | v29))
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:6 userInfo:0];
    }
  }
  if (*((unsigned char *)v58 + 24))
  {
    if (v9) {
      v9[2](v9, self);
    }
    if (![(AWDLServiceDiscoveryManager *)self _requiresConnection])
    {
      [(AWDLServiceDiscoveryManager *)self _destroyConnection];
      if (*p_notifyToken != -1) {
        notify_cancel(*p_notifyToken);
      }
      *p_int notifyToken = -1;
    }
    if (a5) {
      *a5 = 0;
    }
  }
  char v30 = *((unsigned char *)v58 + 24);
  _Block_object_dispose(&v48, 8);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v57, 8);

  return v30;
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[1] lock];
    [v2 _retryConnection];
    [v2[1] unlock];
    WeakRetained = v2;
  }
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_131(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[WiFiP2PXPCConnection convertError:a2];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (a2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidate];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_3(uint64_t a1)
{
  v2 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_4;
  block[3] = &unk_1E633EF30;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_5(uint64_t a1)
{
  v2 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_6;
  block[3] = &unk_1E633EF30;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_7(uint64_t a1, void *a2)
{
}

void __79__AWDLServiceDiscoveryManager__usingAWDLDiscoveryManagerProxy_onSuccess_error___block_invoke_8(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

- (BOOL)setTrafficRegistration:(id)a3 error:(id *)a4
{
  return [(AWDLServiceDiscoveryManager *)self setTrafficRegistration:a3 onInvalidationHandler:0 error:a4];
}

- (BOOL)setTrafficRegistration:(id)a3 onInvalidationHandler:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = [v8 uniqueIdentifier];
  int v11 = [v10 isEqualToString:@"airplay-connectivity-check"];

  if (!v11)
  {
    uint64_t v14 = [v8 uniqueIdentifier];
    if ([v14 isEqualToString:@"airplay"])
    {
      v15 = [v8 peerAddress];
      v16 = +[WiFiMACAddress zeroAddress];
      if ([v15 isEqual:v16])
      {
        char v17 = [v8 options];

        if ((v17 & 1) == 0)
        {
          [v8 setActiveFlagOverride:1];
          BOOL v12 = [(AWDLServiceDiscoveryManager *)self clearTrafficRegistration:v8 error:a5];
          goto LABEL_3;
        }
LABEL_10:
        [v8 setInvalidationHandler:v9];
        [(NSLock *)self->_lock lock];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __82__AWDLServiceDiscoveryManager_setTrafficRegistration_onInvalidationHandler_error___block_invoke;
        v24[3] = &unk_1E633F380;
        id v25 = v8;
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        v21 = __82__AWDLServiceDiscoveryManager_setTrafficRegistration_onInvalidationHandler_error___block_invoke_2;
        v22 = &unk_1E633F3D0;
        id v23 = v25;
        BOOL v13 = [(AWDLServiceDiscoveryManager *)self _usingAWDLDiscoveryManagerProxy:v24 onSuccess:&v19 error:a5];
        [(NSLock *)self->_lock unlock];

        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
  BOOL v12 = [(AWDLServiceDiscoveryManager *)self queryAirPlayConnectivityWithConfiguration:v8 error:a5];
LABEL_3:
  BOOL v13 = v12;
LABEL_11:

  return v13;
}

void __82__AWDLServiceDiscoveryManager_setTrafficRegistration_onInvalidationHandler_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v6, "trafficRegistration:enabled:completionHandler:", v4, objc_msgSend(v4, "activeFlagOverride") ^ 1, v5);
}

void __82__AWDLServiceDiscoveryManager_setTrafficRegistration_onInvalidationHandler_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = a2;
  uint64_t v3 = [v7[4] indexOfObject:*(void *)(a1 + 32)];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v4 = v3,
        [v7[4] objectAtIndex:v3],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasSimilarOptionsTo:*(void *)(a1 + 32)],
        v5,
        (v6 & 1) != 0))
  {
    [v7[4] addObject:*(void *)(a1 + 32)];
  }
  else
  {
    [v7[4] replaceObjectAtIndex:v4 withObject:*(void *)(a1 + 32)];
  }
}

- (BOOL)clearTrafficRegistration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 uniqueIdentifier];
  if (![v7 isEqualToString:@"airplay"]) {
    goto LABEL_6;
  }
  id v8 = [v6 peerAddress];
  id v9 = +[WiFiMACAddress zeroAddress];
  if (([v8 isEqual:v9] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  char v10 = [v6 options];

  if ((v10 & 1) == 0)
  {
LABEL_7:
    [(NSLock *)self->_lock lock];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__AWDLServiceDiscoveryManager_clearTrafficRegistration_error___block_invoke;
    v18[3] = &unk_1E633F380;
    id v19 = v6;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __62__AWDLServiceDiscoveryManager_clearTrafficRegistration_error___block_invoke_2;
    v16 = &unk_1E633F3D0;
    id v17 = v19;
    BOOL v11 = [(AWDLServiceDiscoveryManager *)self _usingAWDLDiscoveryManagerProxy:v18 onSuccess:&v13 error:a4];
    [(NSLock *)self->_lock unlock];

    goto LABEL_8;
  }
  [v6 setActiveFlagOverride:1];
  BOOL v11 = [(AWDLServiceDiscoveryManager *)self setTrafficRegistration:v6 error:a4];
LABEL_8:

  return v11;
}

void __62__AWDLServiceDiscoveryManager_clearTrafficRegistration_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v6, "trafficRegistration:enabled:completionHandler:", v4, objc_msgSend(v4, "activeFlagOverride"), v5);
}

uint64_t __62__AWDLServiceDiscoveryManager_clearTrafficRegistration_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _removeFirstTrafficRegistrationMatching:*(void *)(a1 + 32)];
}

- (BOOL)getActiveTrafficRegistrationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__AWDLServiceDiscoveryManager_getActiveTrafficRegistrationWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E633F420;
  id v11 = 0;
  id v12 = v4;
  id v5 = v4;
  BOOL v6 = [(AWDLServiceDiscoveryManager *)self _usingAWDLDiscoveryManagerProxy:v10 onSuccess:&__block_literal_global_148 error:&v9];
  id v7 = v9;
  [(NSLock *)self->_lock unlock];

  return v6;
}

void __81__AWDLServiceDiscoveryManager_getActiveTrafficRegistrationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__AWDLServiceDiscoveryManager_getActiveTrafficRegistrationWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E633F3F8;
  id v6 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  [a2 getActiveTrafficRegistrationWithCompletionHandler:v4];
}

uint64_t __81__AWDLServiceDiscoveryManager_getActiveTrafficRegistrationWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!a3) {
    a3 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, a2, a3);
}

- (BOOL)resumeAWDLWithError:(id *)a3
{
  [(NSLock *)self->_lock lock];
  int64_t suspendCount = self->_suspendCount;
  BOOL v6 = __OFSUB__(suspendCount, 1);
  int64_t v7 = suspendCount - 1;
  if (v7)
  {
    if (v7 < 0 == v6) {
      self->_int64_t suspendCount = v7;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = [(AWDLServiceDiscoveryManager *)self _usingAWDLDiscoveryManagerProxy:&__block_literal_global_150 onSuccess:&__block_literal_global_152 error:a3];
  }
  [(NSLock *)self->_lock unlock];
  return v8;
}

uint64_t __51__AWDLServiceDiscoveryManager_resumeAWDLWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setAWDLSuspendedState:0 completionHandler:a3];
}

void __51__AWDLServiceDiscoveryManager_resumeAWDLWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (BOOL)suspendAWDLWithError:(id *)a3
{
  [(NSLock *)self->_lock lock];
  int64_t suspendCount = self->_suspendCount;
  if (suspendCount)
  {
    self->_int64_t suspendCount = suspendCount + 1;
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = [(AWDLServiceDiscoveryManager *)self _usingAWDLDiscoveryManagerProxy:&__block_literal_global_154 onSuccess:&__block_literal_global_156 error:a3];
  }
  [(NSLock *)self->_lock unlock];
  return v6;
}

uint64_t __52__AWDLServiceDiscoveryManager_suspendAWDLWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setAWDLSuspendedState:1 completionHandler:a3];
}

void __52__AWDLServiceDiscoveryManager_suspendAWDLWithError___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

- (BOOL)performRealtimeConnectivityCheckWithConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v21 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __87__AWDLServiceDiscoveryManager_performRealtimeConnectivityCheckWithConfiguration_error___block_invoke;
  id v19 = &unk_1E633F488;
  id v6 = v5;
  id v20 = v6;
  int64_t v7 = +[WiFiP2PXPCConnection directQueryOnEndpointType:2 error:&v21 querying:&v16];
  id v8 = v21;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    id v10 = v8;
    if (a4)
    {
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], 102, 0, v16, v17, v18, v19);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v10 = v10;
      BOOL v11 = 0;
      *a4 = v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend(v7, "integerValue", v16, v17, v18, v19);
    uint64_t v13 = v12;
    if (a4)
    {
      if (v12)
      {
        id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v12 userInfo:0];
        *a4 = v14;
      }
      else
      {
        *a4 = 0;
      }
    }
    id v10 = 0;
    BOOL v11 = v13 == 0;
  }

  return v11;
}

uint64_t __87__AWDLServiceDiscoveryManager_performRealtimeConnectivityCheckWithConfiguration_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 performRealtimeConnectivityCheckWithConfiguration:*(void *)(a1 + 32) completionHandler:a3];
}

- (void)_removeFirstTrafficRegistrationMatching:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_activeTrafficRegistrations indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    activeTrafficRegistrations = self->_activeTrafficRegistrations;
    [(NSMutableArray *)activeTrafficRegistrations removeObjectAtIndex:v5];
  }
}

- (void)invalidatedActiveTrafficRegistration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_activeTrafficRegistrations;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqual:", v4, (void)v14))
        {
          BOOL v11 = [v10 invalidationHandler];

          if (v11)
          {
            uint64_t v12 = [v10 invalidationHandler];
            ((void (**)(void, void *))v12)[2](v12, v10);
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_activeTrafficRegistrations removeObject:v4];
  if (![(AWDLServiceDiscoveryManager *)self _requiresConnection])
  {
    [(AWDLServiceDiscoveryManager *)self _destroyConnection];
    int notifyToken = self->_notifyToken;
    if (notifyToken != -1) {
      notify_cancel(notifyToken);
    }
    self->_int notifyToken = -1;
  }
  [(NSLock *)self->_lock unlock];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTrafficRegistrations, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

@end