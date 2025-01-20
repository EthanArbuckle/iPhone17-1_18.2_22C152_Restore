@interface _SBKeyboardServiceConnectionListener
- (_SBKeyboardServiceConnectionListener)initWithServiceQueue:(id)a3;
- (_SBKeyboardServiceConnectionListenerDelegate)delegate;
- (id)_clientForConnectionContext:(id)a3;
- (void)_handleDisconnectForServiceConnection:(id)a3;
- (void)_removeClientForConnectionContext:(id)a3;
- (void)activate;
- (void)deferAdditionalEnvironments:(id)a3 whenSceneHasKeyboardFocus:(id)a4 pid:(id)a5;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeKeyboardFocusFromSceneIdentity:(id)a3 pid:(id)a4;
- (void)requestKeyboardFocusForSceneIdentity:(id)a3 pid:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setExternalSceneIdentities:(id)a3;
- (void)stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:(id)a3 pid:(id)a4;
@end

@implementation _SBKeyboardServiceConnectionListener

- (_SBKeyboardServiceConnectionListener)initWithServiceQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SBKeyboardServiceConnectionListener;
  v6 = [(_SBKeyboardServiceConnectionListener *)&v19 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    connectionContextToClientMap = v6->_connectionContextToClientMap;
    v6->_connectionContextToClientMap = (NSMapTable *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v10 = [v9 initWithEntitlement:*MEMORY[0x1E4FA7008]];
    serviceClientAuthenticator = v6->_serviceClientAuthenticator;
    v6->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v10;

    objc_storeStrong((id *)&v6->_serviceQueue, a3);
    v12 = (void *)MEMORY[0x1E4F628A0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __61___SBKeyboardServiceConnectionListener_initWithServiceQueue___block_invoke;
    v17[3] = &unk_1E6AF58F0;
    v13 = v6;
    v18 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v17];
    connectionListener = v13->_connectionListener;
    v13->_connectionListener = (BSServiceConnectionListener *)v14;
  }
  return v6;
}

- (void)activate
{
}

- (void)invalidate
{
}

- (id)_clientForConnectionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_connectionContextToClientMap objectForKey:v4];
  if (!v5)
  {
    id v5 = [[_SBKeyboardServiceClient alloc] initWithConnectionContext:v4];
    [(NSMapTable *)self->_connectionContextToClientMap setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)_removeClientForConnectionContext:(id)a3
{
}

- (void)requestKeyboardFocusForSceneIdentity:(id)a3 pid:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  v12 = [MEMORY[0x1E4F62880] currentContext];
  v13 = [(_SBKeyboardServiceConnectionListener *)self _clientForConnectionContext:v12];

  if (!v13)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 108, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  v15 = [MEMORY[0x1E4F62880] currentContext];
  v16 = [v15 remoteToken];
  id v23 = 0;
  int v17 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v16 error:&v23];
  id v18 = v23;

  if (v17)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 114, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
    }
    [WeakRetained client:v13 requestKeyboardFocusForSceneIdentity:v9 pid:v10 completion:v11];
  }
  else
  {
    v20 = SBLogKeyboardFocus();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:]();
    }

    v11[2](v11, MEMORY[0x1E4F1CC28], v18);
  }
}

- (void)removeKeyboardFocusFromSceneIdentity:(id)a3 pid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v9 = [MEMORY[0x1E4F62880] currentContext];
  id v10 = [(_SBKeyboardServiceConnectionListener *)self _clientForConnectionContext:v9];

  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 125, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  v12 = [v10 auditToken];
  id v18 = 0;
  int v13 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v12 error:&v18];
  id v14 = v18;

  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      int v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 130, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
    }
    [WeakRetained client:v10 removeKeyboardFocusFromSceneIdentity:v7 pid:v8];
  }
  else
  {
    id WeakRetained = SBLogKeyboardFocus();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:]();
    }
  }
}

- (void)deferAdditionalEnvironments:(id)a3 whenSceneHasKeyboardFocus:(id)a4 pid:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  v12 = [MEMORY[0x1E4F62880] currentContext];
  int v13 = [(_SBKeyboardServiceConnectionListener *)self _clientForConnectionContext:v12];

  if (!v13)
  {
    objc_super v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 140, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  v15 = [v13 auditToken];
  id v21 = 0;
  int v16 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v15 error:&v21];
  id v17 = v21;

  if (v16)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 145, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
    }
    [WeakRetained client:v13 deferAdditionalEnvironments:v9 whenSceneHasKeyboardFocus:v10 pid:v11];
  }
  else
  {
    id WeakRetained = SBLogKeyboardFocus();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:]();
    }
  }
}

- (void)stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:(id)a3 pid:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v9 = [MEMORY[0x1E4F62880] currentContext];
  id v10 = [(_SBKeyboardServiceConnectionListener *)self _clientForConnectionContext:v9];

  if (!v10)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 155, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  v12 = [v10 auditToken];
  id v18 = 0;
  int v13 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v12 error:&v18];
  id v14 = v18;

  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 160, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
    }
    [WeakRetained client:v10 stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:v7 pid:v8];
  }
  else
  {
    id WeakRetained = SBLogKeyboardFocus();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:]();
    }
  }
}

- (void)setExternalSceneIdentities:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  v6 = [MEMORY[0x1E4F62880] currentContext];
  id v7 = [(_SBKeyboardServiceConnectionListener *)self _clientForConnectionContext:v6];

  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 170, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  id v9 = [v7 auditToken];
  id v15 = 0;
  int v10 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v9 error:&v15];
  id v11 = v15;

  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 175, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];
    }
    [WeakRetained client:v7 setExternalSceneIdentities:v5];
  }
  else
  {
    id WeakRetained = SBLogKeyboardFocus();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:]();
    }
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F62880];
  id v8 = a4;
  id v9 = [v7 currentContext];
  int v10 = [(_SBKeyboardServiceConnectionListener *)self _clientForConnectionContext:v9];

  if (!v10)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 188, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke;
  v13[3] = &unk_1E6AF7470;
  v13[4] = self;
  [v8 configureConnection:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientDidConnect:v10];

  [v8 activate];
}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  id v5 = [MEMORY[0x1E4F62880] currentContext];
  v6 = [(_SBKeyboardServiceConnectionListener *)self _clientForConnectionContext:v5];

  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_SBKeyboardServiceConnectionListener.m", 221, @"Invalid parameter not satisfying: %@", @"client" object file lineNumber description];
  }
  [(_SBKeyboardServiceConnectionListener *)self _removeClientForConnectionContext:v9];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clientDidDisconnect:v6];
}

- (_SBKeyboardServiceConnectionListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBKeyboardServiceConnectionListenerDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_connectionContextToClientMap, 0);
}

- (void)requestKeyboardFocusForSceneIdentity:pid:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  [v0 pid];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_4(&dword_1D85BA000, v1, v2, "SBKeyboardFocusService: Failed to authenticate client with pid %i -  %{public}@", v3, v4, v5, v6, v7);
}

@end