@interface _SBExternalDisplayServiceConnectionListener
- (_SBExternalDisplayServiceConnectionListener)initWithServiceQueue:(id)a3;
- (_SBExternalDisplayServiceConnectionListenerDelegate)delegate;
- (id)_clientForConnection:(id)a3;
- (id)_createClientForConnection:(id)a3;
- (void)_handleDisconnectForServiceConnection:(id)a3;
- (void)_removeClientForConnection:(id)a3;
- (void)activate;
- (void)getConnectedDisplayInfoWithCompletion:(id)a3;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)notifyObserversExternalDisplayDidConnect:(id)a3;
- (void)notifyObserversExternalDisplayDidUpdateProperties:(id)a3 requestingClient:(id)a4;
- (void)notifyObserversExternalDisplayWillDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayArrangement:(id)a3 forDisplay:(id)a4;
- (void)setDisplayMirroringEnabled:(id)a3 forDisplay:(id)a4;
- (void)setDisplayModeSettings:(id)a3 forDisplay:(id)a4 options:(id)a5 completionHandler:(id)a6;
@end

@implementation _SBExternalDisplayServiceConnectionListener

- (_SBExternalDisplayServiceConnectionListener)initWithServiceQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SBExternalDisplayServiceConnectionListener;
  v6 = [(_SBExternalDisplayServiceConnectionListener *)&v19 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_connectionToClientMap = v7->_lock_connectionToClientMap;
    v7->_lock_connectionToClientMap = (NSMapTable *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F624B8]) initWithEntitlement:@"com.apple.springboard.externaldisplay.displayArrangements"];
    serviceClientAuthenticator = v7->_serviceClientAuthenticator;
    v7->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v10;

    objc_storeStrong((id *)&v7->_serviceQueue, a3);
    v12 = (void *)MEMORY[0x1E4F628A0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68___SBExternalDisplayServiceConnectionListener_initWithServiceQueue___block_invoke;
    v17[3] = &unk_1E6AF58F0;
    v13 = v7;
    v18 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v17];
    connectionListener = v13->_connectionListener;
    v13->_connectionListener = (BSServiceConnectionListener *)v14;
  }
  return v7;
}

- (void)activate
{
}

- (void)invalidate
{
}

- (void)notifyObserversExternalDisplayDidUpdateProperties:(id)a3 requestingClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayDidUpdateProperties_requestingClient___block_invoke;
  block[3] = &unk_1E6AF4E00;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(serviceQueue, block);
}

- (void)notifyObserversExternalDisplayDidConnect:(id)a3
{
  id v4 = a3;
  serviceQueue = self->_serviceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __88___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayDidConnect___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serviceQueue, v7);
}

- (void)notifyObserversExternalDisplayWillDisconnect:(id)a3
{
  id v4 = a3;
  serviceQueue = self->_serviceQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayWillDisconnect___block_invoke;
  v7[3] = &unk_1E6AF5290;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serviceQueue, v7);
}

- (id)_clientForConnection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMapTable *)self->_lock_connectionToClientMap objectForKey:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_createClientForConnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 150, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  id v6 = [v5 remoteProcess];

  if (!v6)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 151, @"Invalid parameter not satisfying: %@", @"[connection remoteProcess]" object file lineNumber description];
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMapTable *)self->_lock_connectionToClientMap objectForKey:v5];

  if (v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 156, @"Already tracking connection: %@", v5 object file lineNumber description];
  }
  id v8 = [_SBExternalDisplayServiceClient alloc];
  id v9 = [v5 remoteProcess];
  id v10 = [(_SBExternalDisplayServiceClient *)v8 initWithConnection:v5 remoteProcess:v9];

  [(NSMapTable *)self->_lock_connectionToClientMap setObject:v10 forKey:v5];
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

- (void)_removeClientForConnection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->_lock_connectionToClientMap removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)getConnectedDisplayInfoWithCompletion:(id)a3
{
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  id v6 = [(_SBExternalDisplayServiceConnectionListener *)self _clientForConnection:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = WeakRetained;
  if (v6)
  {
    if (WeakRetained) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 178, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 179, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  [v8 client:v6 getConnectedDisplayInfoWithCompletion:v11];
}

- (void)setDisplayArrangement:(id)a3 forDisplay:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v8 = [MEMORY[0x1E4F62880] currentContext];
  id v9 = [(_SBExternalDisplayServiceConnectionListener *)self _clientForConnection:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = WeakRetained;
  if (v9)
  {
    if (WeakRetained) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 187, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 188, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  [v11 client:v9 setDisplayArrangement:v14 forDisplay:v7];
}

- (void)setDisplayMirroringEnabled:(id)a3 forDisplay:(id)a4
{
  id v14 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v8 = [MEMORY[0x1E4F62880] currentContext];
  id v9 = [(_SBExternalDisplayServiceConnectionListener *)self _clientForConnection:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = WeakRetained;
  if (v9)
  {
    if (WeakRetained) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 196, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 197, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  [v11 client:v9 setDisplayMirroringEnabled:v14 forDisplay:v7];
}

- (void)setDisplayModeSettings:(id)a3 forDisplay:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v20 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v14 = [MEMORY[0x1E4F62880] currentContext];
  v15 = [(_SBExternalDisplayServiceConnectionListener *)self _clientForConnection:v14];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = WeakRetained;
  if (v15)
  {
    if (WeakRetained) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 205, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  objc_super v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 206, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_3:
  [v17 client:v15 setDisplayModeSettings:v20 forDisplay:v11 options:v12 completionHandler:v13];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = SBLogDisplayControlling();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v7;
    _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "SBExternalDisplayService: Received Connection: %{public}@", buf, 0xCu);
  }

  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  id v10 = [v7 remoteProcess];
  id v11 = [v10 auditToken];
  id v19 = 0;
  char v12 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v11 error:&v19];
  id v13 = v19;

  if ((v12 & 1) == 0)
  {
    v16 = SBLogDisplayControlling();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_SBExternalDisplayServiceConnectionListener listener:didReceiveConnection:withContext:]((uint64_t)v13, (uint64_t)v7, v16);
    }
    goto LABEL_14;
  }
  if ((SBFIsChamoisExternalDisplayControllerAvailable() & 1) == 0)
  {
    v16 = SBLogDisplayControlling();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[_SBExternalDisplayServiceConnectionListener listener:didReceiveConnection:withContext:](v16);
    }
LABEL_14:

    [v7 invalidate];
    goto LABEL_15;
  }
  id v14 = [(_SBExternalDisplayServiceConnectionListener *)self _createClientForConnection:v7];
  if (!v14)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 223, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke;
  v18[3] = &unk_1E6AF7470;
  v18[4] = self;
  [v7 configureConnection:v18];
  v15 = SBLogDisplayControlling();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[_SBExternalDisplayServiceConnectionListener listener:didReceiveConnection:withContext:]((uint64_t)v14, v15);
  }

  [v7 activate];
LABEL_15:
}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  serviceQueue = self->_serviceQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  [(_SBExternalDisplayServiceConnectionListener *)self _removeClientForConnection:v5];
}

- (_SBExternalDisplayServiceConnectionListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBExternalDisplayServiceConnectionListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_lock_connectionToClientMap, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "SBExternalDisplayService: connecting client %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)listener:(os_log_t)log didReceiveConnection:withContext:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBExternalDisplayService: Service unavailable. Invalidating connection.", v1, 2u);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(uint64_t)a2 withContext:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "SBExternalDisplayService: Connection did not pass entitlement validation: %{public}@\n %{public}@", (uint8_t *)&v3, 0x16u);
}

@end