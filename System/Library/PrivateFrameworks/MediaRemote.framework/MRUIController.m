@interface MRUIController
- (BOOL)hasLockScreenControlsAssertion;
- (BOOL)hasNowPlayingActivityAssertion;
- (BOOL)hasQuickControlsAssertion;
- (BOOL)hasRouteRecommendationAssertion;
- (BOOL)hasScreenMirroringQuickControlsAssertion;
- (BOOL)hasUIAssertions;
- (BOOL)shouldRestoreState;
- (MRUIController)init;
- (MRUIServerXPCProtocol)server;
- (NSXPCConnection)xpcConnection;
- (id)acquireQuickControlsAssertion;
- (id)contextForActivityIdentifier:(id)a3;
- (os_unfair_lock_s)lock;
- (void)_restoreState;
- (void)acquireLockScreenControlsAssertion;
- (void)acquireNowPlayingActivityAssertionForRouteIdentifier:(id)a3 withDuration:(int64_t)a4 preferredState:(int64_t)a5;
- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3;
- (void)acquireScreenMirroringQuickControlsAssertion;
- (void)dealloc;
- (void)releaseLockScreenControlsAssertion;
- (void)releaseQuickControlsAssertion;
- (void)releaseRouteRecommendationAssertion;
- (void)releaseScreenMirroringQuickControlsAssertion;
- (void)setHasLockScreenControlsAssertion:(BOOL)a3;
- (void)setHasNowPlayingActivityAssertion:(BOOL)a3;
- (void)setHasQuickControlsAssertion:(BOOL)a3;
- (void)setHasRouteRecommendationAssertion:(BOOL)a3;
- (void)setHasScreenMirroringQuickControlsAssertion:(BOOL)a3;
- (void)setPreferredState:(int64_t)a3;
- (void)setShouldRestoreState:(BOOL)a3;
- (void)suppressPresentationOverBundleIdentifiers:(id)a3;
- (void)xpcConnection;
@end

@implementation MRUIController

- (MRUIController)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)MRUIController;
  v2 = [(MRUIController *)&v5 init];
  if (v2)
  {
    v3 = _MRLogForCategory(0xBuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = v2;
      _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> Initializing external controller.", buf, 0xCu);
    }

    v2->_lock._os_unfair_lock_opaque = 0;
    *(_DWORD *)&v2->_hasLockScreenControlsAssertion = 0;
    *(_WORD *)&v2->_hasNowPlayingActivityAssertion = 256;
  }
  return v2;
}

- (void)_restoreState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(MRUIController *)self hasUIAssertions])
  {
    v3 = [(MRUIController *)self xpcConnection];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__MRUIController__restoreState__block_invoke;
    v7[3] = &unk_1E57D1148;
    v7[4] = self;
    v4 = [v3 remoteObjectProxyWithErrorHandler:v7];

    if (v4)
    {
      if ([(MRUIController *)self hasLockScreenControlsAssertion]) {
        [v4 acquireLockScreenControlsAssertionWithReply:&__block_literal_global_92];
      }
      if ([(MRUIController *)self hasQuickControlsAssertion]) {
        [v4 acquireQuickControlsAssertionWithReply:&__block_literal_global_58];
      }
      if ([(MRUIController *)self hasScreenMirroringQuickControlsAssertion]) {
        [v4 acquireScreenMirroringQuickControlsAssertionWithReply:&__block_literal_global_60];
      }
    }
    else
    {
      objc_super v5 = _MRLogForCategory(0xBuLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v9 = self;
        _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> Failed to get server proxy to restore state. Giving up.", buf, 0xCu);
      }

      [(MRUIController *)self setShouldRestoreState:0];
      v6 = [(MRUIController *)self xpcConnection];
      [v6 invalidate];
    }
  }
}

void __31__MRUIController__restoreState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _MRLogForCategory(0xBuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> Server proxy error %@.", (uint8_t *)&v6, 0x16u);
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRUIController][C] <%p> Deallocated while still holding lock screen assertion.", v2, v3, v4, v5, v6);
}

- (BOOL)hasUIAssertions
{
  if ([(MRUIController *)self hasQuickControlsAssertion]
    || [(MRUIController *)self hasScreenMirroringQuickControlsAssertion]
    || [(MRUIController *)self hasLockScreenControlsAssertion])
  {
    return 1;
  }

  return [(MRUIController *)self hasRouteRecommendationAssertion];
}

- (NSXPCConnection)xpcConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    uint64_t v5 = MRGetSharedService();
    uint8_t v6 = [v5 UIServerEndpoint];
    if (v6)
    {
      uint64_t v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v6];
      __int16 v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE6B6A98];
      id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE6B6AF8];
      uint64_t v10 = [MEMORY[0x1E4F77A40] proxyWithObject:self protocol:&unk_1EE6B6A98];
      [(NSXPCConnection *)v7 setExportedObject:v10];

      [(NSXPCConnection *)v7 setExportedInterface:v8];
      [(NSXPCConnection *)v7 setRemoteObjectInterface:v9];
      objc_initWeak(&location, self);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __31__MRUIController_xpcConnection__block_invoke;
      v16[3] = &unk_1E57D12D0;
      objc_copyWeak(&v17, &location);
      [(NSXPCConnection *)v7 setInterruptionHandler:v16];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __31__MRUIController_xpcConnection__block_invoke_165;
      v14[3] = &unk_1E57D12D0;
      objc_copyWeak(&v15, &location);
      [(NSXPCConnection *)v7 setInvalidationHandler:v14];
      [(NSXPCConnection *)v7 resume];
      v11 = self->_xpcConnection;
      self->_xpcConnection = v7;

      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      __int16 v8 = _MRLogForCategory(0xBuLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MRUIController xpcConnection]();
      }
    }

    xpcConnection = self->_xpcConnection;
  }
  v12 = xpcConnection;
  os_unfair_lock_unlock(p_lock);

  return v12;
}

void __31__MRUIController_xpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = _MRLogForCategory(0xBuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      id v5 = WeakRetained;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> XPC interrupted.", (uint8_t *)&v4, 0xCu);
    }

    uint64_t v3 = [WeakRetained xpcConnection];
    [v3 invalidate];
  }
}

void __31__MRUIController_xpcConnection__block_invoke_165(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = _MRLogForCategory(0xBuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      id v5 = WeakRetained;
      _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> XPC invalidated.", (uint8_t *)&v4, 0xCu);
    }

    os_unfair_lock_lock(WeakRetained + 4);
    uint64_t v3 = *(void **)&WeakRetained[6]._os_unfair_lock_opaque;
    *(void *)&WeakRetained[6]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(WeakRetained + 4);
    if ([(os_unfair_lock_s *)WeakRetained shouldRestoreState]) {
      [(os_unfair_lock_s *)WeakRetained _restoreState];
    }
  }
}

- (MRUIServerXPCProtocol)server
{
  uint64_t v3 = [(MRUIController *)self xpcConnection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__MRUIController_server__block_invoke;
  v6[3] = &unk_1E57D1148;
  v6[4] = self;
  int v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v6];

  return (MRUIServerXPCProtocol *)v4;
}

void __24__MRUIController_server__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _MRLogForCategory(0xBuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRUIController][C] <%p> Server proxy error %@.", (uint8_t *)&v6, 0x16u);
  }
}

- (void)acquireLockScreenControlsAssertion
{
  [(MRUIController *)self setHasLockScreenControlsAssertion:1];
  id v3 = [(MRUIController *)self server];
  [v3 acquireLockScreenControlsAssertionWithReply:&__block_literal_global_167_0];
}

- (void)releaseLockScreenControlsAssertion
{
  [(MRUIController *)self setHasLockScreenControlsAssertion:0];
  id v3 = [(MRUIController *)self server];
  [v3 releaseLockScreenControlsAssertionWithReply:&__block_literal_global_169];
}

- (id)acquireQuickControlsAssertion
{
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__38;
  v11 = __Block_byref_object_dispose__38;
  id v12 = 0;
  [(MRUIController *)self setHasQuickControlsAssertion:1];
  id v3 = [(MRUIController *)self server];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MRUIController_acquireQuickControlsAssertion__block_invoke;
  v6[3] = &unk_1E57D8C60;
  v6[4] = &v7;
  [v3 acquireQuickControlsAssertionWithReply:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__MRUIController_acquireQuickControlsAssertion__block_invoke(uint64_t a1, void *a2)
{
}

- (void)releaseQuickControlsAssertion
{
  [(MRUIController *)self setHasQuickControlsAssertion:0];
  id v3 = [(MRUIController *)self server];
  [v3 releaseQuickControlsAssertionWithReply:&__block_literal_global_171];
}

- (void)acquireScreenMirroringQuickControlsAssertion
{
  [(MRUIController *)self setHasScreenMirroringQuickControlsAssertion:1];
  id v3 = [(MRUIController *)self server];
  [v3 acquireScreenMirroringQuickControlsAssertionWithReply:&__block_literal_global_173];
}

- (void)releaseScreenMirroringQuickControlsAssertion
{
  [(MRUIController *)self setHasScreenMirroringQuickControlsAssertion:0];
  id v3 = [(MRUIController *)self server];
  [v3 releaseScreenMirroringQuickControlsAssertionWithReply:&__block_literal_global_175_1];
}

- (id)contextForActivityIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__38;
  v13 = __Block_byref_object_dispose__38;
  id v14 = 0;
  uint64_t v5 = [(MRUIController *)self server];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__MRUIController_contextForActivityIdentifier___block_invoke;
  v8[3] = &unk_1E57D8C60;
  v8[4] = &v9;
  [v5 contextForActivityIdentifier:v4 reply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __47__MRUIController_contextForActivityIdentifier___block_invoke(uint64_t a1, void *a2)
{
}

- (void)acquireRouteRecommendationAssertionForIdentifiers:(id)a3
{
  id v4 = a3;
  [(MRUIController *)self setHasRouteRecommendationAssertion:1];
  id v5 = [(MRUIController *)self server];
  [v5 acquireRouteRecommendationAssertionForIdentifiers:v4 withReply:&__block_literal_global_177_0];
}

- (void)releaseRouteRecommendationAssertion
{
  [(MRUIController *)self setHasRouteRecommendationAssertion:0];
  id v3 = [(MRUIController *)self server];
  [v3 releaseRouteRecommendationAssertionWithReply:&__block_literal_global_179];
}

- (void)acquireNowPlayingActivityAssertionForRouteIdentifier:(id)a3 withDuration:(int64_t)a4 preferredState:(int64_t)a5
{
  id v9 = a3;
  if (!a4) {
    [(MRUIController *)self setHasNowPlayingActivityAssertion:1];
  }
  __int16 v8 = [(MRUIController *)self server];
  [v8 acquireNowPlayingActivityAssertionForRouteIdentifier:v9 withDuration:a4 preferredState:a5 withReply:&__block_literal_global_181_0];
}

- (void)setPreferredState:(int64_t)a3
{
  id v4 = [(MRUIController *)self server];
  [v4 setPreferredState:a3 reply:&__block_literal_global_183_0];
}

- (void)suppressPresentationOverBundleIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUIController *)self server];
  [v5 suppressPresentationOverBundleIdentifiers:v4 reply:&__block_literal_global_185];
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (BOOL)hasLockScreenControlsAssertion
{
  return self->_hasLockScreenControlsAssertion;
}

- (void)setHasLockScreenControlsAssertion:(BOOL)a3
{
  self->_hasLockScreenControlsAssertion = a3;
}

- (BOOL)hasQuickControlsAssertion
{
  return self->_hasQuickControlsAssertion;
}

- (void)setHasQuickControlsAssertion:(BOOL)a3
{
  self->_hasQuickControlsAssertion = a3;
}

- (BOOL)hasScreenMirroringQuickControlsAssertion
{
  return self->_hasScreenMirroringQuickControlsAssertion;
}

- (void)setHasScreenMirroringQuickControlsAssertion:(BOOL)a3
{
  self->_hasScreenMirroringQuickControlsAssertion = a3;
}

- (BOOL)hasRouteRecommendationAssertion
{
  return self->_hasRouteRecommendationAssertion;
}

- (void)setHasRouteRecommendationAssertion:(BOOL)a3
{
  self->_hasRouteRecommendationAssertion = a3;
}

- (BOOL)hasNowPlayingActivityAssertion
{
  return self->_hasNowPlayingActivityAssertion;
}

- (void)setHasNowPlayingActivityAssertion:(BOOL)a3
{
  self->_hasNowPlayingActivityAssertion = a3;
}

- (BOOL)shouldRestoreState
{
  return self->_shouldRestoreState;
}

- (void)setShouldRestoreState:(BOOL)a3
{
  self->_shouldRestoreState = a3;
}

- (void).cxx_destruct
{
}

- (void)xpcConnection
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[MRUIController][C] <%p> Received nil XPC endpoint. Failing.", v2, v3, v4, v5, v6);
}

@end