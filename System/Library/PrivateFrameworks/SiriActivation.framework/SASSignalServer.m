@interface SASSignalServer
+ (id)interface;
+ (id)serverForConnection:(id)a3;
+ (id)serviceQuality;
+ (void)_unregisterConnection:(id)a3;
- (BOOL)invalidated;
- (BSServiceConnectionEndpointInjector)workspaceServiceInjector;
- (BSServiceConnectionHost)connection;
- (NSMutableArray)waitForConnectBlocks;
- (NSString)assertionClientIdentifier;
- (SASSignalServerDelegate)weak_delegate;
- (void)_activationRequestFromDirectActionEventWithContext:(id)a3 completion:(id)a4;
- (void)_registerSourceForIdentifier:(id)a3;
- (void)_setConnection:(id)a3;
- (void)_unregisterSourceForIdentifier:(id)a3;
- (void)activationRequestFromBluetoothKeyboardActivation:(id)a3;
- (void)activationRequestFromBreadcrumb;
- (void)activationRequestFromButtonIdentifier:(id)a3 context:(id)a4;
- (void)activationRequestFromContinuityWithContext:(id)a3;
- (void)activationRequestFromDirectActionEventWithContext:(id)a3;
- (void)activationRequestFromRemotePresentationBringUpWithContext:(id)a3;
- (void)activationRequestFromSimpleActivation:(id)a3;
- (void)activationRequestFromSpotlightWithContext:(id)a3;
- (void)activationRequestFromTestingWithContext:(id)a3;
- (void)activationRequestFromTostadaWithContext:(id)a3;
- (void)activationRequestFromVocalShortcutWithContext:(id)a3;
- (void)buttonDownFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5;
- (void)buttonLongPressFromButtonIdentifier:(id)a3 context:(id)a4;
- (void)buttonTapFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5;
- (void)buttonUpFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6;
- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGesture;
- (void)cancelPrewarmFromButtonIdentifier:(id)a3;
- (void)deactivationRequestFromButtonIdentifier:(id)a3 context:(id)a4 options:(id)a5;
- (void)prewarmForFirstTapOfQuickTypeToSiriGesture;
- (void)prewarmFromButtonIdentifier:(id)a3;
- (void)prewarmFromButtonIdentifier:(id)a3 longPressInterval:(id)a4;
- (void)registerAssertionWithIdentifier:(id)a3 reason:(id)a4;
- (void)registerButtonEventListenerWithIdentifier:(id)a3;
- (void)registerButtonIdentifier:(id)a3 withUUID:(id)a4;
- (void)registerNonButtonSourceWithType:(id)a3 withUUID:(id)a4;
- (void)setAssertionClientIdentifier:(id)a3;
- (void)setConnection:(id)a3;
- (void)setHintGlowAssertionFromButtonIdentifier:(id)a3 context:(id)a4;
- (void)setInvalidated:(BOOL)a3;
- (void)setWaitForConnectBlocks:(id)a3;
- (void)setWeak_delegate:(id)a3;
- (void)setWorkspaceServiceInjector:(id)a3;
- (void)specifySenderForInstrumentation:(id)a3;
- (void)unregisterAssertionWithIdentifier:(id)a3;
- (void)unregisterButtonEventListenerWithIdentifier:(id)a3;
- (void)unregisterButtonIdentifier:(id)a3 withUUID:(id)a4;
- (void)unregisterNonButtonSourceWithType:(id)a3 withUUID:(id)a4;
@end

@implementation SASSignalServer

- (void)registerNonButtonSourceWithType:(id)a3 withUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    v10 = [(SASSignalServer *)self connection];
    v11 = [v10 remoteProcess];
    v12 = [v11 bundleIdentifier];
    int v13 = 136315906;
    v14 = "-[SASSignalServer registerNonButtonSourceWithType:withUUID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Non-button source of type %@ with uuid '%@' registered by %@", (uint8_t *)&v13, 0x2Au);
  }
  [(SASSignalServer *)self _registerSourceForIdentifier:v7];
}

- (void)_registerSourceForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[SiriActivationService service];
  [v5 registerActivationSource:self withIdentifier:v4];
}

+ (id)serverForConnection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [(id)serversByConnection_0 objectForKey:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init(SASSignalServer);
    id v5 = (os_log_t *)MEMORY[0x1E4F4E360];
    id v6 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)MEMORY[0x1E4F29060];
      v8 = v6;
      v9 = [v7 currentThread];
      int v16 = 136315394;
      __int16 v17 = "+[SASSignalServer serverForConnection:]";
      __int16 v18 = 2048;
      uint64_t v19 = [v9 qualityOfService];
      _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock about to lock with qos: %zd", (uint8_t *)&v16, 0x16u);
    }
    os_unfair_lock_lock(&lock_0);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      __int16 v17 = "+[SASSignalServer serverForConnection:]";
      _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock successfully locked", (uint8_t *)&v16, 0xCu);
    }
    v11 = (void *)serversByConnection_0;
    if (!serversByConnection_0)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:0 capacity:4];
      int v13 = (void *)serversByConnection_0;
      serversByConnection_0 = v12;

      v11 = (void *)serversByConnection_0;
    }
    [v11 setObject:v4 forKey:v3];
    os_unfair_lock_unlock(&lock_0);
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      __int16 v17 = "+[SASSignalServer serverForConnection:]";
      _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock unlocked", (uint8_t *)&v16, 0xCu);
    }
    [(SASSignalServer *)v4 _setConnection:v3];
  }

  return v4;
}

- (void)specifySenderForInstrumentation:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[SASActivationInstrumentation alloc] initWithSender:v4];

  activationInstrumentation = self->_activationInstrumentation;
  self->_activationInstrumentation = v5;

  id v7 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_activationInstrumentation;
    int v9 = 136315394;
    v10 = "-[SASSignalServer specifySenderForInstrumentation:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_setConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 remoteProcess];
  char v6 = [v5 hasEntitlement:@"com.apple.siri.activation.service"];
  if (!v5 || (v6 & 1) != 0)
  {
    v8 = [(SASSignalServer *)self connection];
    if (v8)
    {
    }
    else if (![(SASSignalServer *)self invalidated])
    {
      [(SASSignalServer *)self setConnection:v4];
      connection = self->_connection;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __34__SASSignalServer__setConnection___block_invoke;
      v11[3] = &unk_1E6B68900;
      v11[4] = self;
      [(BSServiceConnectionHost *)connection configureConnection:v11];
      [(BSServiceConnectionHost *)self->_connection activate];
      goto LABEL_11;
    }
    int v9 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[SASSignalServer _setConnection:]";
      __int16 v14 = 2114;
      __int16 v15 = self;
      _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly attempted to assign a new connection to the activation server with an existing connection: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v7 = (void *)*MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      [(SASSignalServer *)(uint64_t)self _setConnection:v5];
    }
  }
  [v4 invalidate];
LABEL_11:
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

void __34__SASSignalServer__setConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[SASSignalServer serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[SASSignalServer interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __34__SASSignalServer__setConnection___block_invoke_2;
  int v9 = &unk_1E6B67898;
  objc_copyWeak(&v10, &location);
  [v3 setInvalidationHandler:&v6];
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_25, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

+ (id)serviceQuality
{
  return (id)[MEMORY[0x1E4F50BE0] userInteractive];
}

+ (id)interface
{
  v2 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F338C128];
  id v3 = [MEMORY[0x1E4F4F7B8] protocolForProtocol:&unk_1F338C188];
  id v4 = [MEMORY[0x1E4F50BD0] interfaceWithServer:v2 client:v3];

  return v4;
}

void __34__SASSignalServer__setConnection___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[7];
    uint64_t v7 = *MEMORY[0x1E4F4E360];
    BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        uint64_t v9 = v5[7];
        *(_DWORD *)uint64_t v13 = 136315650;
        *(void *)&v13[4] = "-[SASSignalServer _setConnection:]_block_invoke_2";
        *(_WORD *)&v13[12] = 2112;
        *(void *)&v13[14] = v3;
        *(_WORD *)&v13[22] = 2112;
        uint64_t v14 = v9;
        id v10 = "%s #activation Invalidating connection - %@ as client %@ terminated";
        __int16 v11 = v7;
        uint32_t v12 = 32;
LABEL_7:
        _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, v10, v13, v12);
      }
    }
    else if (v8)
    {
      *(_DWORD *)uint64_t v13 = 136315394;
      *(void *)&v13[4] = "-[SASSignalServer _setConnection:]_block_invoke";
      *(_WORD *)&v13[12] = 2112;
      *(void *)&v13[14] = v3;
      id v10 = "%s #activation Invalidating connection - %@";
      __int16 v11 = v7;
      uint32_t v12 = 22;
      goto LABEL_7;
    }
    +[SASSignalServer _unregisterConnection:](SASSignalServer, "_unregisterConnection:", v3, *(_OWORD *)v13, *(void *)&v13[16], v14);
  }
}

void __34__SASSignalServer__setConnection___block_invoke_23(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)serversByConnection_0;
    id v5 = v3;
    uint64_t v6 = [v4 objectForKey:a2];
    int v7 = 136315394;
    BOOL v8 = "-[SASSignalServer _setConnection:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation interrupted signalserver: %@", (uint8_t *)&v7, 0x16u);
  }
}

+ (void)_unregisterConnection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v5 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F29060];
    int v7 = v5;
    BOOL v8 = [v6 currentThread];
    int v14 = 136315394;
    uint64_t v15 = "+[SASSignalServer _unregisterConnection:]";
    __int16 v16 = 2048;
    uint64_t v17 = [v8 qualityOfService];
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock about to lock with qos: %zd", (uint8_t *)&v14, 0x16u);
  }
  os_unfair_lock_lock(&lock_0);
  __int16 v9 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "+[SASSignalServer _unregisterConnection:]";
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock successfully locked", (uint8_t *)&v14, 0xCu);
  }
  id v10 = [(id)serversByConnection_0 objectForKey:v3];
  uint64_t v11 = +[SiriActivationService service];
  uint32_t v12 = [v10 assertionClientIdentifier];
  [v11 unregisterActivationAssertionWithIdentifier:v12];

  [(id)serversByConnection_0 removeObjectForKey:v3];
  os_unfair_lock_unlock(&lock_0);
  uint64_t v13 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    uint64_t v15 = "+[SASSignalServer _unregisterConnection:]";
    _os_log_impl(&dword_1D9588000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy lock unlocked", (uint8_t *)&v14, 0xCu);
  }
}

- (void)_unregisterSourceForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SiriActivationService service];
  [v4 unregisterActivationSourceIdentifier:v3];
}

- (void)registerButtonIdentifier:(id)a3 withUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  BOOL v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = v8;
    id v10 = [(SASSignalServer *)self connection];
    uint64_t v11 = [v10 remoteProcess];
    uint32_t v12 = [v11 bundleIdentifier];
    int v13 = 136315906;
    int v14 = "-[SASSignalServer registerButtonIdentifier:withUUID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Button identifier %@ with uuid '%@' registered by %@", (uint8_t *)&v13, 0x2Au);
  }
  [(SASSignalServer *)self _registerSourceForIdentifier:v7];
}

- (void)unregisterButtonIdentifier:(id)a3 withUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  BOOL v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = v8;
    id v10 = [(SASSignalServer *)self connection];
    uint64_t v11 = [v10 remoteProcess];
    uint32_t v12 = [v11 bundleIdentifier];
    int v13 = 136315906;
    int v14 = "-[SASSignalServer unregisterButtonIdentifier:withUUID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Button identifier %@ with uuid '%@' unregistered by %@", (uint8_t *)&v13, 0x2Au);
  }
  [(SASSignalServer *)self _unregisterSourceForIdentifier:v7];
}

- (void)unregisterNonButtonSourceWithType:(id)a3 withUUID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)*MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = v8;
    id v10 = [(SASSignalServer *)self connection];
    uint64_t v11 = [v10 remoteProcess];
    uint32_t v12 = [v11 bundleIdentifier];
    int v13 = 136315906;
    int v14 = "-[SASSignalServer unregisterNonButtonSourceWithType:withUUID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Non-button source of type %@ with uuid '%@' unregistered by %@", (uint8_t *)&v13, 0x2Au);
  }
  [(SASSignalServer *)self _unregisterSourceForIdentifier:v7];
}

- (void)activationRequestFromButtonIdentifier:(id)a3 context:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  kdebug_trace();
  id v7 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[SASSignalServer activationRequestFromButtonIdentifier:context:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromButtonIdentifier:%@ context:%@", (uint8_t *)&v9, 0x20u);
  }
  BOOL v8 = +[SiriActivationService service];
  objc_msgSend(v8, "activationRequestFromButtonIdentifier:context:", objc_msgSend(v5, "siriButtonIdentifier"), v6);
}

- (void)deactivationRequestFromButtonIdentifier:(id)a3 context:(id)a4 options:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    __int16 v13 = "-[SASSignalServer deactivationRequestFromButtonIdentifier:context:options:]";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_1D9588000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation deactivationRequestFromButtonIdentifier:%@ context:%@", (uint8_t *)&v12, 0x20u);
  }
  __int16 v11 = +[SiriActivationService service];
  objc_msgSend(v11, "deactivationRequestFromButtonIdentifier:context:options:", objc_msgSend(v7, "siriButtonIdentifier"), v8, v9);
}

- (void)activationRequestFromDirectActionEventWithContext:(id)a3
{
}

- (void)_activationRequestFromDirectActionEventWithContext:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = (SiriDirectActionContext *)a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = (os_log_t *)MEMORY[0x1E4F4E360];
  id v9 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    v24 = "-[SASSignalServer _activationRequestFromDirectActionEventWithContext:completion:]";
    __int16 v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_1D9588000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation _activationRequestFromDirectActionEventWithContext:%@", (uint8_t *)&v23, 0x16u);
  }
  uint64_t v10 = [(SiriDirectActionContext *)v6 payload];
  if (v10)
  {
    __int16 v11 = (void *)v10;
    int v12 = [(SiriDirectActionContext *)v6 payload];
    __int16 v13 = [v12 allKeys];
    char v14 = [v13 containsObject:@"SBSAssistantActivationContextBundleID"];

    if ((v14 & 1) == 0)
    {
      id v15 = [(SASSignalServer *)self connection];
      __int16 v16 = [v15 remoteProcess];
      id v17 = [v16 bundleIdentifier];

      uint64_t v18 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315394;
        v24 = "-[SASSignalServer _activationRequestFromDirectActionEventWithContext:completion:]";
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation _activationRequestFromDirectActionEventWithContext payload missing bundleId, using connection bundle id:%@", (uint8_t *)&v23, 0x16u);
      }
      __int16 v19 = [(SiriDirectActionContext *)v6 payload];
      uint64_t v20 = (void *)[v19 mutableCopy];

      [v20 setValue:v17 forKey:@"SBSAssistantActivationContextBundleID"];
      uint64_t v21 = [[SiriDirectActionContext alloc] initWithPayload:v20];

      id v6 = v21;
    }
  }
  v22 = +[SiriActivationService service];
  [v22 activationRequestFromDirectActionEventWithContext:v6 completion:v7];
}

- (void)activationRequestFromContinuityWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  kdebug_trace();
  id v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SASSignalServer activationRequestFromContinuityWithContext:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromContinuityWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  [v5 activationRequestFromContinuityWithContext:v3];
}

- (void)activationRequestFromRemotePresentationBringUpWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  kdebug_trace();
  id v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SASSignalServer activationRequestFromRemotePresentationBringUpWithContext:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromRemotePresentationBringUpWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  [v5 activationRequestFromRemotePresentationBringUpWithContext:v3];
}

- (void)activationRequestFromBreadcrumb
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SASSignalServer activationRequestFromBreadcrumb]";
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromBreadcrumb", (uint8_t *)&v4, 0xCu);
  }
  id v3 = +[SiriActivationService service];
  [v3 activationRequestFromBreadcrumb];
}

- (void)activationRequestFromBluetoothKeyboardActivation:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SASSignalServer activationRequestFromBluetoothKeyboardActivation:]";
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromBluetoothKeyboardActivation", (uint8_t *)&v6, 0xCu);
  }
  id v5 = +[SiriActivationService service];
  objc_msgSend(v5, "activationRequestFromBluetoothKeyboardActivation:", objc_msgSend(v3, "integerValue"));
}

- (void)activationRequestFromSimpleActivation:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SASSignalServer activationRequestFromSimpleActivation:]";
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSimpleActivation", (uint8_t *)&v6, 0xCu);
  }
  id v5 = +[SiriActivationService service];
  objc_msgSend(v5, "activationRequestFromSimpleActivation:", objc_msgSend(v3, "integerValue"));
}

- (void)activationRequestFromSpotlightWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  kdebug_trace();
  int v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SASSignalServer activationRequestFromSpotlightWithContext:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromSpotlightWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  [v5 activationRequestFromSpotlightWithContext:v3];
}

- (void)activationRequestFromTestingWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  kdebug_trace();
  int v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SASSignalServer activationRequestFromTestingWithContext:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromTestingWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  [v5 activationRequestFromTestingWithContext:v3];
}

- (void)activationRequestFromVocalShortcutWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SASSignalServer activationRequestFromVocalShortcutWithContext:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromVocalShortcutWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  [v5 activationRequestFromVocalShortcutWithContext:v3];
}

- (void)activationRequestFromTostadaWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SASSignalServer activationRequestFromTostadaWithContext:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s #activation activationRequestFromTostadaWithContext:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  [v5 activationRequestFromTostadaWithContext:v3];
}

- (void)setHintGlowAssertionFromButtonIdentifier:(id)a3 context:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = "-[SASSignalServer setHintGlowAssertionFromButtonIdentifier:context:]";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s #activation setHintGlowAssertionFromButtonIdentifier: %@, context: %@", (uint8_t *)&v9, 0x20u);
  }
  __int16 v8 = +[SiriActivationService service];
  objc_msgSend(v8, "setHintGlowAssertionFromButtonIdentifier:context:", objc_msgSend(v5, "siriButtonIdentifier"), v6);
}

- (void)prewarmFromButtonIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  kdebug_trace();
  int v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SASSignalServer prewarmFromButtonIdentifier:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s prewarmFromButtonIdentifier:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  objc_msgSend(v5, "prewarmFromButtonIdentifier:longPressInterval:", objc_msgSend(v3, "siriButtonIdentifier"), 0.0);
}

- (void)prewarmFromButtonIdentifier:(id)a3 longPressInterval:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  kdebug_trace();
  id v7 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    __int16 v13 = "-[SASSignalServer prewarmFromButtonIdentifier:longPressInterval:]";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1D9588000, v7, OS_LOG_TYPE_DEFAULT, "%s prewarmFromButtonIdentifier:%@", (uint8_t *)&v12, 0x16u);
  }
  __int16 v8 = +[SiriActivationService service];
  uint64_t v9 = [v5 siriButtonIdentifier];
  [v6 timeInterval];
  double v11 = v10;

  [v8 prewarmFromButtonIdentifier:v9 longPressInterval:v11];
}

- (void)cancelPrewarmFromButtonIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  kdebug_trace();
  int v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SASSignalServer cancelPrewarmFromButtonIdentifier:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s cancelPrewarmFromButtonIdentifier:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  objc_msgSend(v5, "cancelPrewarmFromButtonIdentifier:", objc_msgSend(v3, "siriButtonIdentifier"));
}

- (void)buttonDownFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  double v11 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v27 = "-[SASSignalServer buttonDownFromButtonIdentifier:timestamp:context:]";
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s buttonDownFromButtonIdentifier:%@ timestamp:%@", buf, 0x20u);
  }
  int v12 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v13 = [v12 assistantIsEnabled];

  if (v13)
  {
    __int16 v14 = objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", objc_msgSend(v8, "siriButtonIdentifier", @"eventSource"));
    __int16 v25 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    uint64_t v16 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    id v17 = AFAnalyticsEventCreateCurrent();
    [v16 logEvent:v17];

    activationInstrumentation = self->_activationInstrumentation;
    __int16 v19 = objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", objc_msgSend(v8, "siriButtonIdentifier"));
    uint64_t v20 = [(SASActivationInstrumentation *)activationInstrumentation buttonDownWithIdentifier:v19];

    [v10 setActivationEventInstrumentationIdentifier:v20];
    uint64_t v21 = [v8 siriButtonIdentifier];
    if (unint64_t)(v21 - 1) <= 8 && ((0x173u >> (v21 - 1))) {
      kdebug_trace();
    }
  }
  v22 = +[SiriActivationService service];
  uint64_t v23 = [v8 siriButtonIdentifier];
  [v9 timeInterval];
  objc_msgSend(v22, "buttonDownFromButtonIdentifier:timestamp:context:", v23, v10);
}

- (void)buttonUpFromButtonIdentifier:(id)a3 deviceIdentifier:(id)a4 timestamp:(id)a5 context:(id)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  kdebug_trace();
  __int16 v14 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v30 = "-[SASSignalServer buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:]";
    __int16 v31 = 2112;
    id v32 = v10;
    __int16 v33 = 2112;
    id v34 = v11;
    _os_log_impl(&dword_1D9588000, v14, OS_LOG_TYPE_DEFAULT, "%s buttonUpFromButtonIdentifier:%@ timestamp:%@", buf, 0x20u);
  }
  id v15 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v16 = [v15 assistantIsEnabled];

  if (v16)
  {
    id v17 = objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", objc_msgSend(v10, "siriButtonIdentifier", @"eventSource"));
    __int16 v28 = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    __int16 v19 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    uint64_t v20 = AFAnalyticsEventCreateCurrent();
    [v19 logEvent:v20];

    activationInstrumentation = self->_activationInstrumentation;
    v22 = objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", objc_msgSend(v10, "siriButtonIdentifier"));
    uint64_t v23 = [(SASActivationInstrumentation *)activationInstrumentation buttonUpWithIdentifier:v22];

    [v12 setActivationEventInstrumentationIdentifier:v23];
    uint64_t v24 = [v10 siriButtonIdentifier];
    if (unint64_t)(v24 - 1) <= 8 && ((0x173u >> (v24 - 1))) {
      kdebug_trace();
    }
  }
  __int16 v25 = +[SiriActivationService service];
  uint64_t v26 = [v10 siriButtonIdentifier];
  [v11 timeInterval];
  objc_msgSend(v25, "buttonUpFromButtonIdentifier:deviceIdentifier:timestamp:context:", v26, v13, v12);
}

- (void)buttonTapFromButtonIdentifier:(id)a3 timestamp:(id)a4 context:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  kdebug_trace();
  id v11 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315394;
    uint64_t v20 = "-[SASSignalServer buttonTapFromButtonIdentifier:timestamp:context:]";
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1D9588000, v11, OS_LOG_TYPE_DEFAULT, "%s buttonTapFromButtonIdentifier:%@", (uint8_t *)&v19, 0x16u);
  }
  activationInstrumentation = self->_activationInstrumentation;
  id v13 = objc_msgSend(NSString, "stringWithSiriButtonIdentifier:", objc_msgSend(v8, "siriButtonIdentifier"));
  __int16 v14 = [(SASActivationInstrumentation *)activationInstrumentation buttonTapWithIdentifier:v13 associateWithButtonDown:1];

  [v9 setActivationEventInstrumentationIdentifier:v14];
  id v15 = +[SiriActivationService service];
  uint64_t v16 = [v8 siriButtonIdentifier];
  [v10 timeInterval];
  double v18 = v17;

  [v15 buttonTapFromButtonIdentifier:v16 timestamp:v9 context:v18];
}

- (void)buttonLongPressFromButtonIdentifier:(id)a3 context:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[SASSignalServer buttonLongPressFromButtonIdentifier:context:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s buttonLongPressFromButtonIdentifier:%@ context:%@", (uint8_t *)&v11, 0x20u);
  }
  id v9 = [(SASActivationInstrumentation *)self->_activationInstrumentation mostRecentAtivationEvenIdentifier];
  [v7 setActivationEventInstrumentationIdentifier:v9];

  id v10 = +[SiriActivationService service];
  objc_msgSend(v10, "buttonLongPressFromButtonIdentifier:context:", objc_msgSend(v6, "siriButtonIdentifier"), v7);
}

- (void)prewarmForFirstTapOfQuickTypeToSiriGesture
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SASSignalServer prewarmForFirstTapOfQuickTypeToSiriGesture]";
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation #quickTypeGate prewarm", (uint8_t *)&v4, 0xCu);
  }
  id v3 = +[SiriActivationService service];
  [v3 prewarmForFirstTapOfQuickTypeToSiriGesture];
}

- (void)cancelPrewarmForFirstTapOfQuickTypeToSiriGesture
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v2 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SASSignalServer cancelPrewarmForFirstTapOfQuickTypeToSiriGesture]";
    _os_log_impl(&dword_1D9588000, v2, OS_LOG_TYPE_DEFAULT, "%s #activation #quickTypeGate cancel prewarm", (uint8_t *)&v4, 0xCu);
  }
  id v3 = +[SiriActivationService service];
  [v3 cancelPrewarmForFirstTapOfQuickTypeToSiriGesture];
}

- (void)registerAssertionWithIdentifier:(id)a3 reason:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    int v11 = "-[SASSignalServer registerAssertionWithIdentifier:reason:]";
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1D9588000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation registerAssertionWithIdentifier:%@ reason:%@", (uint8_t *)&v10, 0x20u);
  }
  id v9 = +[SiriActivationService service];
  [v9 registerActivationAssertion:self withIdentifier:v6];

  [(SASSignalServer *)self setAssertionClientIdentifier:v6];
}

- (void)unregisterAssertionWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SASSignalServer unregisterAssertionWithIdentifier:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s #activation unregisterAssertionWithIdentifier:%@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = +[SiriActivationService service];
  [v6 unregisterActivationAssertionWithIdentifier:v4];

  [(SASSignalServer *)self setAssertionClientIdentifier:0];
}

- (void)registerButtonEventListenerWithIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SASSignalServer registerButtonEventListenerWithIdentifier:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1D9588000, v5, OS_LOG_TYPE_DEFAULT, "%s registerButtonEventListenerWithIdentifier:%@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = +[SiriActivationService service];
  [v6 registerButtonEventListenerServer:self identifier:v4];
}

- (void)unregisterButtonEventListenerWithIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[SASSignalServer unregisterButtonEventListenerWithIdentifier:]";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1D9588000, v4, OS_LOG_TYPE_DEFAULT, "%s unregisterButtonEventListenerWithIdentifier:%@", (uint8_t *)&v6, 0x16u);
  }
  id v5 = +[SiriActivationService service];
  [v5 unregisterButtonEventListenerWithIdentifier:v3];
}

- (BSServiceConnectionEndpointInjector)workspaceServiceInjector
{
  return self->_workspaceServiceInjector;
}

- (void)setWorkspaceServiceInjector:(id)a3
{
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

- (SASSignalServerDelegate)weak_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_delegate);
  return (SASSignalServerDelegate *)WeakRetained;
}

- (void)setWeak_delegate:(id)a3
{
}

- (NSString)assertionClientIdentifier
{
  return self->_assertionClientIdentifier;
}

- (void)setAssertionClientIdentifier:(id)a3
{
  self->_assertionClientIdentifier = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weak_delegate);
  objc_storeStrong((id *)&self->_waitForConnectBlocks, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_workspaceServiceInjector, 0);
  objc_storeStrong((id *)&self->_activationInstrumentation, 0);
}

- (void)_setConnection:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  int v6 = [a3 bundleIdentifier];
  int v7 = 136315650;
  __int16 v8 = "-[SASSignalServer _setConnection:]";
  __int16 v9 = 2048;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  __int16 v12 = v6;
  _os_log_error_impl(&dword_1D9588000, v5, OS_LOG_TYPE_ERROR, "%s %p #activation Unable to establish connection to un-entitled remote process: %@", (uint8_t *)&v7, 0x20u);
}

@end