@interface SASPresentationServer
+ (id)interface;
+ (id)serverForConnection:(id)a3;
+ (id)serviceQuality;
+ (void)_unregisterConnection:(id)a3;
- (BOOL)invalidated;
- (BSServiceConnectionEndpointInjector)workspaceServiceInjector;
- (BSServiceConnectionHost)connection;
- (NSMutableArray)waitForConnectBlocks;
- (SASPresentationServer)init;
- (SASPresentationServerDelegate)weak_delegate;
- (id)allBulletins;
- (id)bulletinForIdentifier:(id)a3;
- (id)bulletinsOnLockScreen;
- (id)description;
- (int64_t)presentationIdentifier;
- (void)_setConnection:(id)a3;
- (void)dealloc;
- (void)didDismiss;
- (void)didPresentSiri;
- (void)didUpdatePresentationState:(id)a3;
- (void)failedToPresentSiriWithError:(id)a3;
- (void)init;
- (void)pong;
- (void)registerPresentationIdentifier:(id)a3;
- (void)resetSiriToActive;
- (void)setConnection:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setPresentationIdentifier:(int64_t)a3;
- (void)setWaitForConnectBlocks:(id)a3;
- (void)setWeak_delegate:(id)a3;
- (void)setWorkspaceServiceInjector:(id)a3;
- (void)speechRequestCancelledFromSiriOrb;
- (void)speechRequestStartedFromSiriOrb;
- (void)unregisterPresentationIdentifier:(id)a3;
- (void)willDismiss;
@end

@implementation SASPresentationServer

+ (id)serverForConnection:(id)a3
{
  id v4 = a3;
  v5 = [(id)serversByConnection objectForKey:v4];
  if (!v5)
  {
    v6 = objc_alloc_init(SASPresentationServer);
    os_unfair_lock_lock((os_unfair_lock_t)&lock);
    v7 = (void *)serversByConnection;
    if (!serversByConnection)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:4];
      v9 = (void *)serversByConnection;
      serversByConnection = v8;

      v7 = (void *)serversByConnection;
    }
    [v7 setObject:v6 forKey:v4];
    os_unfair_lock_unlock((os_unfair_lock_t)&lock);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __45__SASPresentationServer_serverForConnection___block_invoke;
    v14 = &unk_1E6B67870;
    v5 = v6;
    v15 = v5;
    id v16 = a1;
    [v4 configureConnection:&v11];
    -[SASPresentationServer _setConnection:](v5, "_setConnection:", v4, v11, v12, v13, v14);
  }
  return v5;
}

void __45__SASPresentationServer_serverForConnection___block_invoke(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__SASPresentationServer_serverForConnection___block_invoke_2;
  v9[3] = &unk_1E6B67820;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = a2;
  [v6 setInvalidationHandler:v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SASPresentationServer_serverForConnection___block_invoke_21;
  v7[3] = &unk_1E6B67848;
  id v8 = *(id *)(a1 + 32);
  [v6 setInterruptionHandler:v7];
}

void __45__SASPresentationServer_serverForConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315394;
    v7 = "+[SASPresentationServer serverForConnection:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation invalidated presentationServer: %@", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 40) _unregisterConnection:v3];
}

void __45__SASPresentationServer_serverForConnection___block_invoke_21(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    uint64_t v5 = "+[SASPresentationServer serverForConnection:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation interrupted presentationServer: %@", (uint8_t *)&v4, 0x16u);
  }
}

+ (void)_unregisterConnection:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  id v5 = [(id)serversByConnection objectForKey:v3];
  int v4 = +[SiriActivationService service];
  objc_msgSend(v4, "unregisterSiriPresentationIdentifier:", objc_msgSend(v5, "presentationIdentifier"));

  [(id)serversByConnection removeObjectForKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);
}

- (SASPresentationServer)init
{
  v4.receiver = self;
  v4.super_class = (Class)SASPresentationServer;
  v2 = [(SASPresentationServer *)&v4 init];
  if (v2 && os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
    -[SASPresentationServer init]();
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D9588000, v0, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)v1, 0x16u);
}

- (id)description
{
  id v3 = NSString;
  objc_super v4 = [(SASPresentationServer *)self connection];
  id v5 = objc_msgSend(NSString, "stringWithSiriPresentationIdentifier:", -[SASPresentationServer presentationIdentifier](self, "presentationIdentifier"));
  __int16 v6 = [v3 stringWithFormat:@"<SASPresentationServer connection:%@, presentationIdentifier:%@>", v4, v5];

  return v6;
}

- (void)_setConnection:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 remoteProcess];
  __int16 v6 = v5;
  if (v5 && ([v5 hasEntitlement:@"com.apple.siri.activation.service"] & 1) == 0)
  {
    uint64_t v8 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      [(SASPresentationServer *)(uint64_t)self _setConnection:v6];
    }
    [v4 invalidate];
  }
  else
  {
    uint64_t v7 = [(SASPresentationServer *)self connection];
    if (v7)
    {

LABEL_9:
      uint64_t v9 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[SASPresentationServer _setConnection:]";
        __int16 v26 = 2114;
        v27 = self;
        _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly attempted to assign a new connection to the activation server with an existing connection: %{public}@", buf, 0x16u);
      }
      [v4 invalidate];
      goto LABEL_12;
    }
    if ([(SASPresentationServer *)self invalidated]) {
      goto LABEL_9;
    }
    [(SASPresentationServer *)self setConnection:v4];
    objc_initWeak((id *)buf, self);
    connection = self->_connection;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __40__SASPresentationServer__setConnection___block_invoke;
    v21[3] = &unk_1E6B678C0;
    v21[4] = self;
    objc_copyWeak(&v22, (id *)buf);
    [(BSServiceConnectionHost *)connection configureConnection:v21];
    [(BSServiceConnectionHost *)self->_connection activate];
    uint64_t v11 = [(SASPresentationServer *)self waitForConnectBlocks];
    [(SASPresentationServer *)self setWaitForConnectBlocks:0];
    if ([v11 count])
    {
      uint64_t v12 = [(BSServiceConnectionHost *)self->_connection remoteTarget];
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v18;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v13);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * v16) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * v16));
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v14);
      }
    }
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
LABEL_12:
}

void __40__SASPresentationServer__setConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SASPresentationServer serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[SASPresentationServer interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__SASPresentationServer__setConnection___block_invoke_2;
  v6[3] = &unk_1E6B67898;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
}

void __40__SASPresentationServer__setConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 5);
    [v5 serverDidInvalidateConnection:v4];

    +[SASPresentationServer _unregisterConnection:v6];
  }
}

+ (id)interface
{
  uint64_t v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F338C068];
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F338C0C8];
  id v4 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v2 client:v3];

  return v4;
}

+ (id)serviceQuality
{
  return (id)[MEMORY[0x1E4F50BE0] userInteractive];
}

- (void)pong
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __29__SASPresentationServer_pong__block_invoke;
  v2[3] = &unk_1E6B675D8;
  objc_copyWeak(&v3, &location);
  SiriInvokeOnMainQueue(v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __29__SASPresentationServer_pong__block_invoke(uint64_t a1)
{
  id v3 = +[SiriActivationService service];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "pongWithPresentationIdentifier:", objc_msgSend(WeakRetained, "presentationIdentifier"));
}

- (void)registerPresentationIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  kdebug_trace();
  id v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSString;
    id v7 = v5;
    uint64_t v8 = objc_msgSend(v6, "stringWithSiriPresentationIdentifier:", objc_msgSend(v4, "siriPresentationIdentifier"));
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[SASPresentationServer registerPresentationIdentifier:]";
    __int16 v15 = 2048;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    long long v18 = v8;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s %p #activation registerPresentationIdentifier:%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SASPresentationServer_registerPresentationIdentifier___block_invoke;
  v10[3] = &unk_1E6B676F8;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v4;
  id v11 = v9;
  SiriInvokeOnMainQueue(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __56__SASPresentationServer_registerPresentationIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) siriPresentationIdentifier];
    [WeakRetained setPresentationIdentifier:v2];
    id v3 = +[SiriActivationService service];
    [v3 registerSiriPresentation:WeakRetained withIdentifier:v2];
  }
}

- (void)unregisterPresentationIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  kdebug_trace();
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[SASPresentationServer unregisterPresentationIdentifier:]";
    __int16 v11 = 2048;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s %p #activation unregisterPresentationIdentifier:%@", buf, 0x20u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SASPresentationServer_unregisterPresentationIdentifier___block_invoke;
  v7[3] = &unk_1E6B678E8;
  id v8 = v4;
  id v6 = v4;
  SiriInvokeOnMainQueue(v7);
}

void __58__SASPresentationServer_unregisterPresentationIdentifier___block_invoke(uint64_t a1)
{
  id v2 = +[SiriActivationService service];
  objc_msgSend(v2, "unregisterSiriPresentationIdentifier:", objc_msgSend(*(id *)(a1 + 32), "siriPresentationIdentifier"));
}

- (void)willDismiss
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[SASPresentationServer willDismiss]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s %p #activation willDismiss", buf, 0x16u);
  }
  int64_t v4 = [(SASPresentationServer *)self presentationIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__SASPresentationServer_willDismiss__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = v4;
  SiriInvokeOnMainQueue(v5);
}

void __36__SASPresentationServer_willDismiss__block_invoke(uint64_t a1)
{
  id v2 = +[SiriActivationService service];
  [v2 siriPresentationWillDismissWithIdentifier:*(void *)(a1 + 32)];
}

- (void)didDismiss
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[SASPresentationServer didDismiss]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s %p #activation didDismiss", buf, 0x16u);
  }
  int64_t v4 = [(SASPresentationServer *)self presentationIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__SASPresentationServer_didDismiss__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = v4;
  SiriInvokeOnMainQueue(v5);
}

void __35__SASPresentationServer_didDismiss__block_invoke(uint64_t a1)
{
  id v2 = +[SiriActivationService service];
  [v2 siriPresentationDismissedWithIdentifier:*(void *)(a1 + 32)];
}

- (void)didPresentSiri
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[SASPresentationServer didPresentSiri]";
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s %p #activation Shell indicates Siri is presented", buf, 0x16u);
  }
  int64_t v4 = [(SASPresentationServer *)self presentationIdentifier];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SASPresentationServer_didPresentSiri__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = v4;
  SiriInvokeOnMainQueue(v5);
}

void __39__SASPresentationServer_didPresentSiri__block_invoke(uint64_t a1)
{
  id v2 = +[SiriActivationService service];
  [v2 siriPresentationDisplayedWithIdentifier:*(void *)(a1 + 32)];
}

- (void)resetSiriToActive
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[SASPresentationServer resetSiriToActive]";
    __int16 v6 = 2048;
    id v7 = self;
    _os_log_impl(&dword_1D9588000, v3, OS_LOG_TYPE_DEFAULT, "%s %p #activation resetSiriToActive", (uint8_t *)&v4, 0x16u);
  }
  [(SASPresentationServer *)self didPresentSiri];
}

- (void)failedToPresentSiriWithError:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SASPresentationServer failedToPresentSiriWithError:]();
  }
  int64_t v5 = [(SASPresentationServer *)self presentationIdentifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SASPresentationServer_failedToPresentSiriWithError___block_invoke;
  v7[3] = &unk_1E6B67910;
  id v8 = v4;
  int64_t v9 = v5;
  id v6 = v4;
  SiriInvokeOnMainQueue(v7);
}

void __54__SASPresentationServer_failedToPresentSiriWithError___block_invoke(uint64_t a1)
{
  id v2 = +[SiriActivationService service];
  [v2 siriPresentationFailureWithIdentifier:*(void *)(a1 + 40) error:*(void *)(a1 + 32)];
}

- (void)didUpdatePresentationState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[SASPresentationServer didUpdatePresentationState:]";
    __int16 v11 = 2048;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s %p #activation Presentation state did update: %@", buf, 0x20u);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SASPresentationServer_didUpdatePresentationState___block_invoke;
  v7[3] = &unk_1E6B678E8;
  id v8 = v4;
  id v6 = v4;
  SiriInvokeOnMainQueue(v7);
}

void __52__SASPresentationServer_didUpdatePresentationState___block_invoke(uint64_t a1)
{
  id v2 = +[SiriActivationService service];
  [v2 siriPresentationDidUpdateState:*(void *)(a1 + 32)];
}

- (void)speechRequestStartedFromSiriOrb
{
}

void __56__SASPresentationServer_speechRequestStartedFromSiriOrb__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "-[SASPresentationServer speechRequestStartedFromSiriOrb]_block_invoke";
    _os_log_impl(&dword_1D9588000, v0, OS_LOG_TYPE_DEFAULT, "%s #activation Shell indicates that speech request was started via Siri orb", (uint8_t *)&v2, 0xCu);
  }
  v1 = +[SiriActivationService service];
  [v1 speechRequestStateDidChange:1];
}

- (void)speechRequestCancelledFromSiriOrb
{
}

void __58__SASPresentationServer_speechRequestCancelledFromSiriOrb__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  os_log_t v0 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "-[SASPresentationServer speechRequestCancelledFromSiriOrb]_block_invoke";
    _os_log_impl(&dword_1D9588000, v0, OS_LOG_TYPE_DEFAULT, "%s #activation Shell indicates that speech request was cancelled via Siri orb", (uint8_t *)&v2, 0xCu);
  }
  v1 = +[SiriActivationService service];
  [v1 speechRequestStateDidChange:2];
}

- (id)allBulletins
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SASPresentationServer allBulletins]";
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation allBulletins", (uint8_t *)&v6, 0xCu);
  }
  id v3 = +[SiriActivationService service];
  uint64_t v4 = [v3 allBulletins];

  return v4;
}

- (id)bulletinsOnLockScreen
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SASPresentationServer bulletinsOnLockScreen]";
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation bulletinsOnLockScreen", (uint8_t *)&v6, 0xCu);
  }
  id v3 = +[SiriActivationService service];
  uint64_t v4 = [v3 bulletinsOnLockScreen];

  return v4;
}

- (id)bulletinForIdentifier:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int64_t v9 = "-[SASPresentationServer bulletinForIdentifier:]";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation bulletinForIdentifier: %@", (uint8_t *)&v8, 0x16u);
  }
  int64_t v5 = +[SiriActivationService service];
  int v6 = [v5 bulletinForIdentifier:v3];

  return v6;
}

- (BSServiceConnectionEndpointInjector)workspaceServiceInjector
{
  return self->_workspaceServiceInjector;
}

- (void)setWorkspaceServiceInjector:(id)a3
{
}

- (BSServiceConnectionHost)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSMutableArray)waitForConnectBlocks
{
  return self->_waitForConnectBlocks;
}

- (void)setWaitForConnectBlocks:(id)a3
{
}

- (SASPresentationServerDelegate)weak_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_delegate);
  return (SASPresentationServerDelegate *)WeakRetained;
}

- (void)setWeak_delegate:(id)a3
{
}

- (int64_t)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setPresentationIdentifier:(int64_t)a3
{
  self->_presentationIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_delegate);
  objc_storeStrong((id *)&self->_waitForConnectBlocks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_workspaceServiceInjector, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D9588000, v0, OS_LOG_TYPE_DEBUG, "%s %p", (uint8_t *)v1, 0x16u);
}

- (void)_setConnection:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v5 = a2;
  int v6 = [a3 bundleIdentifier];
  int v7 = 136315650;
  int v8 = "-[SASPresentationServer _setConnection:]";
  __int16 v9 = 2048;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1D9588000, v5, OS_LOG_TYPE_ERROR, "%s %p #activation Unable to establish connection to un-entitled remote process: %@", (uint8_t *)&v7, 0x20u);
}

- (void)failedToPresentSiriWithError:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D9588000, v1, OS_LOG_TYPE_ERROR, "%s %p #activation Shell indicates Siri presentation failed : %@", (uint8_t *)v2, 0x20u);
}

@end