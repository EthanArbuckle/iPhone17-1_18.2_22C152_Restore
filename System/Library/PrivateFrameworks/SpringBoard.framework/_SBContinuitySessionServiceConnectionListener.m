@interface _SBContinuitySessionServiceConnectionListener
- (_SBContinuitySessionServiceConnectionListener)initWithServiceQueue:(id)a3;
- (_SBContinuitySessionServiceConnectionListenerDelegate)delegate;
- (id)_clientForConnection:(id)a3;
- (id)_lock_clientForConnection:(id)a3;
- (id)_sessionServiceClientWithConnectionContext:(id)a3;
- (void)_removeClientForConnection:(id)a3;
- (void)activate;
- (void)clientActivated;
- (void)clientHasAdoptedScreenCaptureNotifications;
- (void)didCaptureScreenshot;
- (void)didStartScreenRecording;
- (void)didStopScreenRecording;
- (void)didUpdateExternalBlockedReasons:(id)a3;
- (void)handleContinuityButtonEvent:(id)a3;
- (void)handleLaunchEventOfType:(id)a3 payload:(id)a4;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)noteHIDServicesConfigured;
- (void)setDelegate:(id)a3;
- (void)setHostedInterfaceOrientation:(id)a3;
- (void)updatedAppearanceSettings:(id)a3 transitionContext:(id)a4 completion:(id)a5;
@end

@implementation _SBContinuitySessionServiceConnectionListener

- (_SBContinuitySessionServiceConnectionListener)initWithServiceQueue:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SBContinuitySessionServiceConnectionListener;
  v6 = [(_SBContinuitySessionServiceConnectionListener *)&v20 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    lock_connectionToClientMap = v7->_lock_connectionToClientMap;
    v7->_lock_connectionToClientMap = (NSMapTable *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F624B8]);
    uint64_t v11 = [v10 initWithEntitlement:*MEMORY[0x1E4FA7E90]];
    serviceClientAuthenticator = v7->_serviceClientAuthenticator;
    v7->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v11;

    objc_storeStrong((id *)&v7->_connectionQueue, a3);
    v13 = (void *)MEMORY[0x1E4F628A0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70___SBContinuitySessionServiceConnectionListener_initWithServiceQueue___block_invoke;
    v18[3] = &unk_1E6AF58F0;
    v14 = v7;
    v19 = v14;
    uint64_t v15 = [v13 listenerWithConfigurator:v18];
    connectionListener = v14->_connectionListener;
    v14->_connectionListener = (BSServiceConnectionListener *)v15;
  }
  return v7;
}

- (void)activate
{
}

- (void)invalidate
{
}

- (id)_clientForConnection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(_SBContinuitySessionServiceConnectionListener *)self _lock_clientForConnection:v5];

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_clientForConnection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6 = [(NSMapTable *)self->_lock_connectionToClientMap objectForKey:v5];

  return v6;
}

- (void)_removeClientForConnection:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMapTable *)self->_lock_connectionToClientMap removeObjectForKey:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)_sessionServiceClientWithConnectionContext:(id)a3
{
  id v5 = a3;
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  v7 = [v5 remoteToken];
  id v13 = 0;
  int v8 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v7 error:&v13];
  id v9 = v13;

  if (v8)
  {
    id v10 = [(_SBContinuitySessionServiceConnectionListener *)self _clientForConnection:v5];
    if (v10) {
      goto LABEL_7;
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_SBContinuitySessionServiceConnectionListener.m", 91, @"Invalid parameter not satisfying: %@", @"serviceClient" object file lineNumber description];
  }
  else
  {
    uint64_t v11 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](v5);
    }
  }

  id v10 = 0;
LABEL_7:

  return v10;
}

- (void)handleLaunchEventOfType:(id)a3 payload:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v7 = [MEMORY[0x1E4F62880] currentContext];
  int v8 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v7];

  if (v8) {
    objc_msgSend(v8, "_connectionQueue_handleLaunchEventOfType:payload:", v9, v6);
  }
}

- (void)handleContinuityButtonEvent:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v4 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v4];

  if (v5) {
    objc_msgSend(v5, "_connectionQueue_handleContinuityButtonEvent:", objc_msgSend(v6, "unsignedIntValue"));
  }
}

- (void)setHostedInterfaceOrientation:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v4 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v4];

  if (v5) {
    objc_msgSend(v5, "_connectionQueue_setHostedInterfaceOrientation:", objc_msgSend(v6, "unsignedIntValue"));
  }
}

- (void)didUpdateExternalBlockedReasons:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v4 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v4];

  if (v5) {
    objc_msgSend(v5, "_connectionQueue_handleUpdatedExternallyBlockedReasons:", v6);
  }
}

- (void)noteHIDServicesConfigured
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v3 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v3];

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_handleHIDServicesConfigured");
    v4 = v5;
  }
}

- (void)updatedAppearanceSettings:(id)a3 transitionContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  uint64_t v11 = [MEMORY[0x1E4F62880] currentContext];
  v12 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v11];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104___SBContinuitySessionServiceConnectionListener_updatedAppearanceSettings_transitionContext_completion___block_invoke;
  v16[3] = &unk_1E6B02370;
  id v17 = v10;
  id v13 = v10;
  v14 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](v16);
  if (v12)
  {
    objc_msgSend(v12, "_connectionQueue_updatedAppearanceSettings:transitionContext:completion:", v8, v9, v14);
  }
  else
  {
    uint64_t v15 = SBUIContinuitySessionErrorCreate();
    ((void (**)(void, void, void *))v14)[2](v14, 0, v15);
  }
}

- (void)clientActivated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v3 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v3];

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_handleActivated");
    v4 = v5;
  }
}

- (void)didCaptureScreenshot
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v3 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v3];

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_didCaptureScreenshot");
    v4 = v5;
  }
}

- (void)didStartScreenRecording
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v3 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v3];

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_didStartScreenRecording");
    v4 = v5;
  }
}

- (void)didStopScreenRecording
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v3 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v3];

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_didStopScreenRecording");
    v4 = v5;
  }
}

- (void)clientHasAdoptedScreenCaptureNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v3 = [MEMORY[0x1E4F62880] currentContext];
  id v5 = [(_SBContinuitySessionServiceConnectionListener *)self _sessionServiceClientWithConnectionContext:v3];

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_clientHasAdoptedScreenCaptureNotifications");
    v4 = v5;
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  id v9 = [v7 remoteToken];
  id v20 = 0;
  char v10 = [(FBServiceClientAuthenticator *)serviceClientAuthenticator authenticateAuditToken:v9 error:&v20];
  id v11 = v20;

  if ((v10 & 1) == 0)
  {
    id v17 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](v7);
    }
    goto LABEL_13;
  }
  if ((SBFIsOnenessAvailable() & 1) == 0)
  {
    id v17 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_SBContinuitySessionServiceConnectionListener listener:didReceiveConnection:withContext:](v7);
    }
    goto LABEL_13;
  }
  if (!+[SBContinuitySessionManager areContinuitySessionsAllowed])
  {
    id v17 = SBLogContinuitySessionService();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_SBContinuitySessionServiceConnectionListener listener:didReceiveConnection:withContext:](v7);
    }
LABEL_13:

    [v7 invalidate];
    goto LABEL_14;
  }
  v12 = [(_SBContinuitySessionServiceConnectionListener *)self _clientForConnection:v7];

  if (v12)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"_SBContinuitySessionServiceConnectionListener.m" lineNumber:219 description:@"Already tracking a client with this connection.. how???"];
  }
  id v13 = [_SBContinuitySessionServiceClient alloc];
  v14 = [v7 remoteToken];
  uint64_t v15 = -[_SBContinuitySessionServiceClient initWithConnection:pid:](v13, "initWithConnection:pid:", v7, [v14 pid]);

  os_unfair_lock_lock(&self->_lock);
  [(NSMapTable *)self->_lock_connectionToClientMap setObject:v15 forKey:v7];
  os_unfair_lock_unlock(&self->_lock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke;
  v19[3] = &unk_1E6AF7470;
  v19[4] = self;
  [v7 configureConnection:v19];
  [v7 activate];
  v16 = v15;
  BSDispatchMain();

LABEL_14:
}

- (_SBContinuitySessionServiceConnectionListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_SBContinuitySessionServiceConnectionListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_lock_connectionToClientMap, 0);
}

- (void)_sessionServiceClientWithConnectionContext:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 remoteToken];
  [v1 pid];
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_4(&dword_1D85BA000, v2, v3, "SBContinuitySessionService: Failed to authenticate client with pid %i - %{public}@", v4, v5, v6, v7, v8);
}

- (void)listener:(void *)a1 didReceiveConnection:withContext:.cold.1(void *a1)
{
  v1 = [a1 remoteToken];
  [v1 pid];
  OUTLINED_FUNCTION_2_16(&dword_1D85BA000, v2, v3, "SBContinuitySessionService: Not allowing connection from client with pid %i - continuity sessions aren't allowed", v4, v5, v6, v7, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:withContext:.cold.2(void *a1)
{
  v1 = [a1 remoteToken];
  [v1 pid];
  OUTLINED_FUNCTION_2_16(&dword_1D85BA000, v2, v3, "SBContinuitySessionService: Not allowing connection from client with pid %i - feature flag is disabled", v4, v5, v6, v7, 0);
}

@end