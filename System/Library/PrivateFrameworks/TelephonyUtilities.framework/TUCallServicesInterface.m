@interface TUCallServicesInterface
- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)hasReceivedInitialState;
- (BOOL)hasRequestedInitialState;
- (BOOL)hasServerLaunched;
- (BOOL)isServerLocal;
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)shouldHandleServerDisconnect;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (NSArray)currentCalls;
- (NSArray)localProxyCalls;
- (NSDate)lastDaemonConnectTime;
- (NSMapTable)uniqueProxyIdentifierToProxyCall;
- (NSString)debugDescription;
- (NSXPCConnection)xpcConnection;
- (NSXPCListenerEndpoint)anonymousXPCEndpoint;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TUCallContainerPrivate)callContainer;
- (TUCallNotificationManager)callNotificationManager;
- (TUCallServicesClientCapabilities)callServicesClientCapabilities;
- (TUCallServicesInterface)init;
- (TUCallServicesInterface)initWithQueue:(id)a3 callCenter:(id)a4;
- (TUCallServicesInterface)initWithQueue:(id)a3 callCenter:(id)a4 wantsCallNotifications:(BOOL)a5;
- (TUCallServicesXPCServer)asynchronousServer;
- (TUCallServicesXPCServer)server;
- (TUFeatureFlags)featureFlags;
- (TURouteController)localRouteController;
- (TURouteController)pairedHostDeviceRouteController;
- (id)_proxyCallWithCall:(id)a3;
- (id)_proxyCallWithUniqueProxyIdentifier:(id)a3;
- (id)asynchronousServerWithErrorHandler:(id)a3;
- (id)customGreetingForAccountUUID:(id)a3;
- (id)defaultGreeting;
- (id)dialWithRequest:(id)a3 completion:(id)a4;
- (id)fetchCurrentCallUpdates;
- (id)joinConversationWithRequest:(id)a3;
- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (id)routesByUniqueIdentifierForRouteController:(id)a3;
- (id)synchronousServerWithErrorHandler:(id)a3;
- (int)connectionRequestNotificationToken;
- (unint64_t)filterStatusForAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (void)_handleCurrentCallsChanged:(id)a3 callsDisconnected:(id)a4;
- (void)_ignorePendingServerDisconnectionHandlers;
- (void)_registerCall:(id)a3;
- (void)_setUpXPCConnection;
- (void)_tearDownXPCConnection;
- (void)_updateCurrentCalls:(id)a3;
- (void)_updateCurrentCalls:(id)a3 withNotificationsUsingUpdatedCalls:(id)a4;
- (void)_updateCurrentCallsWithoutNotifications:(id)a3;
- (void)activateInCallUIWithActivityContinuationIdentifier:(id)a3;
- (void)addScreenSharingType:(unint64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)answerCallWithRequest:(id)a3;
- (void)dealloc;
- (void)deleteCustomGreetingForAccountUUID:(id)a3;
- (void)disconnectAllCalls;
- (void)disconnectCallWithUniqueProxyIdentifier:(id)a3;
- (void)disconnectCurrentCallAndActivateHeld;
- (void)enteredBackgroundForAllCalls;
- (void)enteredForegroundForCallWithUniqueProxyIdentifier:(id)a3;
- (void)fetchAnonymousXPCEndpoint:(id)a3;
- (void)fetchCurrentCalls;
- (void)groupCallWithUniqueProxyIdentifier:(id)a3 withOtherCallWithUniqueProxyIdentifier:(id)a4;
- (void)handleCurrentCallsChanged:(id)a3 callDisconnected:(id)a4;
- (void)handleFrequencyChangedTo:(id)a3 inDirection:(int)a4 forCallsWithUniqueProxyIdentifiers:(id)a5;
- (void)handleLocalRoutesByUniqueIdentifierUpdated:(id)a3;
- (void)handleMeterLevelChangedTo:(float)a3 inDirection:(int)a4 forCallsWithUniqueProxyIdentifiers:(id)a5;
- (void)handleNotificationName:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4 userInfo:(id)a5;
- (void)handlePairedHostDeviceRoutesByUniqueIdentifierUpdated:(id)a3;
- (void)handleReceivedCallDTMFUpdate:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)handleServerDisconnect;
- (void)handleServerDisconnectIfNecessary;
- (void)handleServerReconnect;
- (void)handleUIXPCEndpointChanged:(id)a3;
- (void)holdCallWithUniqueProxyIdentifier:(id)a3;
- (void)performBlockOnQueue:(id)a3;
- (void)performBlockOnQueue:(id)a3 andWait:(BOOL)a4;
- (void)performRecordingRequest:(id)a3 completion:(id)a4;
- (void)pickRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4 forRouteController:(id)a5;
- (void)playDTMFToneForCallWithUniqueProxyIdentifier:(id)a3 key:(unsigned __int8)a4;
- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4;
- (void)pullHostedCallsFromPairedHostDevice;
- (void)pullPersistedChannel:(id)a3;
- (void)pullRelayingCallsFromClient;
- (void)pullRelayingGFTCallsFromClientIfNecessary;
- (void)pushHostedCallsToDestination:(id)a3;
- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3;
- (void)registerAnonymousXPCEndpoint:(id)a3;
- (void)registerCall:(id)a3;
- (void)reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:(id)a3;
- (void)requestCurrentStateWithCompletionHandler:(id)a3;
- (void)requestCurrentStateWithCompletionHandler:(id)a3 handleInitialState:(id)a4;
- (void)requestVideoUpgradeForCallWithUniqueProxyIdentifier:(id)a3;
- (void)resetCallProvisionalStates;
- (void)saveCustomGreeting:(id)a3 forAccountUUID:(id)a4;
- (void)screenWithRequest:(id)a3;
- (void)sendHardPauseDigitsForCallWithUniqueProxyIdentifier:(id)a3;
- (void)sendMMIOrUSSDCodeWithRequest:(id)a3;
- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4;
- (void)setAnonymousXPCEndpoint:(id)a3;
- (void)setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:(id)a3 bluetoothAudioFormat:(int64_t)a4;
- (void)setCallCenter:(id)a3;
- (void)setClientCapabilities:(id)a3;
- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3;
- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3;
- (void)setCurrentCalls:(id)a3;
- (void)setDownlinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setEmergencyMediaItems:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setHasEmergencyVideoStream:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setHasReceivedInitialState:(BOOL)a3;
- (void)setHasRequestedInitialState:(BOOL)a3;
- (void)setHasServerLaunched:(BOOL)a3;
- (void)setIsSendingVideo:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setLastDaemonConnectTime:(id)a3;
- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setLocalProxyCalls:(id)a3;
- (void)setLocalRouteController:(id)a3;
- (void)setMixesVoiceWithMedia:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setPairedHostDeviceRouteController:(id)a3;
- (void)setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:(id)a3 size:(CGSize)a4;
- (void)setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:(id)a3 presentationState:(int)a4;
- (void)setScreenShareAttributesForCallWithUniqueProxyIdentifier:(id)a3 attributes:(id)a4;
- (void)setServer:(id)a3;
- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4 forCallWithUniqueProxyIdentifier:(id)a5;
- (void)setSharingScreen:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setShouldHandleServerDisconnect:(BOOL)a3;
- (void)setTTYType:(int)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setUplinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4;
- (void)setXpcConnection:(id)a3;
- (void)shouldAllowRingingCallStatusIndicator:(BOOL)a3;
- (void)shouldSuppressInCallStatusBar:(BOOL)a3;
- (void)startTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4;
- (void)stopTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4;
- (void)swapCalls;
- (void)tearDownXPCConnection;
- (void)ungroupCallWithUniqueProxyIdentifier:(id)a3;
- (void)unholdCallWithUniqueProxyIdentifier:(id)a3;
- (void)updateCallWithProxy:(id)a3;
- (void)waitForInitialStateIfNecessary;
- (void)willEnterBackgroundForAllCalls;
@end

@implementation TUCallServicesInterface

- (TUCallContainerPrivate)callContainer
{
  v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [TUCallContainer alloc];
  v5 = [(TUCallServicesInterface *)self currentCalls];
  v6 = [(TUCallContainer *)v4 initWithCalls:v5];

  return (TUCallContainerPrivate *)v6;
}

- (NSArray)currentCalls
{
  v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  [(TUCallServicesInterface *)self waitForInitialStateIfNecessary];
  currentCalls = self->_currentCalls;

  return currentCalls;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)waitForInitialStateIfNecessary
{
  v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  if (!self->_currentCalls)
  {
    if (![(TUCallServicesInterface *)self hasRequestedInitialState]) {
      [(TUCallServicesInterface *)self requestCurrentStateWithCompletionHandler:0];
    }
    v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Waiting for initial state", v5, 2u);
    }

    [(TUCallServicesInterface *)self fetchCurrentCalls];
  }
}

- (void)performBlockOnQueue:(id)a3
{
}

- (void)requestCurrentStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __68__TUCallServicesInterface_requestCurrentStateWithCompletionHandler___block_invoke;
  v10 = &unk_1E58E75F8;
  v11 = self;
  id v12 = v4;
  id v5 = v4;
  v6 = _Block_copy(&v7);
  -[TUCallServicesInterface requestCurrentStateWithCompletionHandler:handleInitialState:](self, "requestCurrentStateWithCompletionHandler:handleInitialState:", v5, v6, v7, v8, v9, v10, v11);
}

- (void)requestCurrentStateWithCompletionHandler:(id)a3 handleInitialState:(id)a4
{
  id v5 = a4;
  v6 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v6);

  [(TUCallServicesInterface *)self setHasRequestedInitialState:1];
  uint64_t v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Requesting current state", buf, 2u);
  }

  uint64_t v8 = [(TUCallServicesInterface *)self callServicesClientCapabilities];
  [v8 save];

  if ([(TUCallServicesInterface *)self isServerLocal])
  {
    v9 = [(TUCallServicesInterface *)self asynchronousServer];
    [v9 requestInitialState:v5];
  }
  else if ([(TUCallServicesInterface *)self hasServerLaunched])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke;
    v13[3] = &unk_1E58E5CC8;
    id v10 = v5;
    id v14 = v10;
    v11 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:v13];
    [v11 requestInitialState:v10];
  }
  else
  {
    id v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "CSD hasn't launched since boot so assuming no current calls exist", buf, 2u);
    }

    (*((void (**)(id, void))v5 + 2))(v5, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)setHasRequestedInitialState:(BOOL)a3
{
  self->_hasRequestedInitialState = a3;
}

- (BOOL)hasServerLaunched
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_hasServerLaunched) {
    return 1;
  }
  if ([(TUCallServicesInterface *)self isServerLocal])
  {
    BOOL v2 = 1;
LABEL_10:
    self->_hasServerLaunched = v2;
    return v2;
  }
  uint64_t state64 = 0;
  uint32_t state = notify_get_state([(TUCallServicesInterface *)self connectionRequestNotificationToken], &state64);
  if (!state)
  {
    BOOL v2 = state64 != 0;
    goto LABEL_10;
  }
  uint32_t v5 = state;
  v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    uint32_t v10 = v5;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Bad status received attempting to get server launched state: %d", buf, 8u);
  }

  return self->_hasServerLaunched;
}

- (int)connectionRequestNotificationToken
{
  return self->_connectionRequestNotificationToken;
}

- (TUCallServicesClientCapabilities)callServicesClientCapabilities
{
  return self->_callServicesClientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint32_t v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying setClientCapabilities through CSD for capabilities %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 setClientCapabilities:v4];
}

- (void)_updateCurrentCalls:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)a3;
  uint32_t v5 = TUDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    currentCalls = self->_currentCalls;
    *(_DWORD *)buf = 138412546;
    v31 = currentCalls;
    __int16 v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_19C496000, v5, OS_LOG_TYPE_DEFAULT, "_currentCalls: %@ currentCalls: %@", buf, 0x16u);
  }

  if (![(NSArray *)self->_currentCalls isEqualToArray:v4] && self->_currentCalls != v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    int v8 = v4;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [(TUCallServicesInterface *)self _proxyCallWithCall:*(void *)(*((void *)&v24 + 1) + 8 * v12)];
          [(NSArray *)v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    [(TUCallServicesInterface *)self setLocalProxyCalls:v7];
    if ([(TUCallServicesInterface *)self isServerLocal]) {
      id v14 = v8;
    }
    else {
      id v14 = v7;
    }
    [(TUCallServicesInterface *)self setCurrentCalls:v14];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = self->_currentCalls;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          -[TUCallServicesInterface _registerCall:](self, "_registerCall:", *(void *)(*((void *)&v20 + 1) + 8 * v19++), (void)v20);
        }
        while (v17 != v19);
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }
  }
}

- (void)setLocalProxyCalls:(id)a3
{
}

- (void)setCurrentCalls:(id)a3
{
}

- (TUCallServicesXPCServer)asynchronousServer
{
  v3 = [(TUCallServicesInterface *)self server];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(TUCallServicesInterface *)self xpcConnection];
    id v5 = [v6 remoteObjectProxy];
  }

  return (TUCallServicesXPCServer *)v5;
}

- (id)asynchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self server];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    int v8 = [(TUCallServicesInterface *)self xpcConnection];
    id v7 = [v8 remoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (NSXPCConnection)xpcConnection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    [(TUCallServicesInterface *)self _setUpXPCConnection];
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

- (BOOL)isServerLocal
{
  BOOL v2 = [(TUCallServicesInterface *)self server];
  BOOL v3 = v2 != 0;

  return v3;
}

- (TUCallServicesXPCServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (TUCallServicesXPCServer *)WeakRetained;
}

- (void)_setUpXPCConnection
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = self;
    _os_log_impl(&dword_19C496000, v3, OS_LOG_TYPE_DEFAULT, "%@: Setting up XPC connection", buf, 0xCu);
  }

  id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.telephonyutilities.callservicesdaemon.callstatecontroller" options:0];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  v6 = [MEMORY[0x1E4F29268] callServicesServerXPCInterface];
  [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

  id v7 = [MEMORY[0x1E4F29268] callServicesClientXPCInterface];
  [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v7];

  [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__TUCallServicesInterface__setUpXPCConnection__block_invoke;
  v13[3] = &unk_1E58E5C50;
  objc_copyWeak(&v14, (id *)buf);
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v13];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_20;
  uint64_t v11 = &unk_1E58E5C50;
  objc_copyWeak(&v12, (id *)buf);
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:&v8];
  [(NSXPCConnection *)self->_xpcConnection resume];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (BOOL)hasRequestedInitialState
{
  return self->_hasRequestedInitialState;
}

- (void)fetchCurrentCalls
{
  BOOL v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying fetch current calls", buf, 2u);
  }

  [(TUCallServicesInterface *)self _ignorePendingServerDisconnectionHandlers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke;
  v7[3] = &unk_1E58E6A70;
  v7[4] = self;
  id v5 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke_26;
  v6[3] = &unk_1E58E7620;
  v6[4] = self;
  [v5 requestInitialState:v6];
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self server];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(TUCallServicesInterface *)self xpcConnection];
    id v7 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }

  return v7;
}

- (void)_ignorePendingServerDisconnectionHandlers
{
  BOOL v3 = [(TUCallServicesInterface *)self xpcConnection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__TUCallServicesInterface__ignorePendingServerDisconnectionHandlers__block_invoke;
  v4[3] = &unk_1E58E5BE0;
  v4[4] = self;
  [v3 performBlockOnQueue:v4];
}

void __68__TUCallServicesInterface_requestCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__TUCallServicesInterface_requestCurrentStateWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E58E75D0;
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v10 = v4;
  id v6 = v3;
  [v5 performBlockOnQueue:v7];
}

- (TUCallServicesInterface)initWithQueue:(id)a3 callCenter:(id)a4 wantsCallNotifications:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TUCallServicesInterface;
  uint64_t v11 = [(TUCallServicesInterface *)&v27 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    dispatch_queue_set_specific((dispatch_queue_t)v12->_queue, [(TUCallServicesInterface *)v12 queueContext], [(TUCallServicesInterface *)v12 queueContext], 0);
    objc_storeWeak((id *)&v12->_callCenter, v10);
    v13 = objc_alloc_init(TUFeatureFlags);
    featureFlags = v12->_featureFlags;
    v12->_featureFlags = v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uniqueProxyIdentifierToProxyCall = v12->_uniqueProxyIdentifierToProxyCall;
    v12->_uniqueProxyIdentifierToProxyCall = (NSMapTable *)v15;

    uint64_t v17 = objc_alloc_init(TUCallServicesClientCapabilities);
    callServicesClientCapabilities = v12->_callServicesClientCapabilities;
    v12->_callServicesClientCapabilities = v17;

    [(TUCallServicesClientCapabilities *)v12->_callServicesClientCapabilities setDelegate:v12];
    uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v20 = [[TUCallNotificationManager alloc] initWithNotificationCenter:v19 wantsCallNotifications:v5];
    callNotificationManager = v12->_callNotificationManager;
    v12->_callNotificationManager = v20;

    v12->_lastDaemonConnectTime = 0;
    objc_initWeak(&location, v12);
    long long v22 = [(TUCallServicesInterface *)v12 queue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__TUCallServicesInterface_initWithQueue_callCenter_wantsCallNotifications___block_invoke;
    v24[3] = &unk_1E58E5F18;
    objc_copyWeak(&v25, &location);
    notify_register_dispatch("com.apple.telephonyutilities.callservicesdaemon.connectionrequest", &v12->_connectionRequestNotificationToken, v22, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  return v12;
}

- (void)performBlockOnQueue:(id)a3 andWait:(BOOL)a4
{
  BOOL v4 = a4;
  block = (void (**)(void))a3;
  specific = dispatch_get_specific([(TUCallServicesInterface *)self queueContext]);
  if (specific == [(TUCallServicesInterface *)self queueContext])
  {
    block[2]();
  }
  else
  {
    id v7 = [(TUCallServicesInterface *)self queue];
    id v8 = v7;
    if (v4) {
      dispatch_sync(v7, block);
    }
    else {
      dispatch_async(v7, block);
    }
  }
}

- (void)setServer:(id)a3
{
}

- (void)fetchAnonymousXPCEndpoint:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying fetchAnonymousXPCEndpoint", v8, 2u);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:&__block_literal_global_63_1];
  [v7 fetchAnonymousXPCEndpoint:v4];
}

- (TURouteController)localRouteController
{
  return self->_localRouteController;
}

- (void)setLocalRouteController:(id)a3
{
}

- (void)setShouldHandleServerDisconnect:(BOOL)a3
{
  self->_shouldHandleServerDisconnect = a3;
}

uint64_t __68__TUCallServicesInterface__ignorePendingServerDisconnectionHandlers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldHandleServerDisconnect:0];
}

void __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Received current state with calls for synchronousServer: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 32) setHasReceivedInitialState:1];
  BOOL v5 = [*(id *)(a1 + 32) callNotificationManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke_27;
  v8[3] = &unk_1E58E5C08;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  [v5 deferNotificationsUntilAfterPerformingBlock:v8];
}

- (TUCallNotificationManager)callNotificationManager
{
  return self->_callNotificationManager;
}

void __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke_27(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 40) _proxyCallWithCall:v7];
        [v7 setComparativeCall:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  [*(id *)(a1 + 40) _updateCurrentCalls:*(void *)(a1 + 32) withNotificationsUsingUpdatedCalls:v2];
}

- (void)_updateCurrentCalls:(id)a3 withNotificationsUsingUpdatedCalls:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(TUCallServicesInterface *)self _updateCurrentCalls:a3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __82__TUCallServicesInterface__updateCurrentCalls_withNotificationsUsingUpdatedCalls___block_invoke;
        aBlock[3] = &unk_1E58E5BE0;
        aBlock[4] = v11;
        long long v12 = _Block_copy(aBlock);
        if ([(TUCallServicesInterface *)self isServerLocal])
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [v11 comparativeCall];
        }
        uint64_t v14 = v13;
        [(TUCallServicesInterface *)self _registerCall:v13];
        uint64_t v15 = [(TUCallServicesInterface *)self callNotificationManager];
        uint64_t v16 = [v11 comparativeCall];
        [v15 postNotificationsForCall:v14 usingComparisonCall:v16 afterUpdatesInBlock:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
}

uint64_t __68__TUCallServicesInterface_requestCurrentStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Received current state with calls for asynchronousServer: %@", (uint8_t *)&v8, 0xCu);
  }

  if ([*(id *)(a1 + 40) hasReceivedInitialState])
  {
    uint64_t v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Dropping asynchronous response for current state, since we already have received initial state", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    if (v5[10]) {
      [v5 _handleCurrentCallsChanged:v6 callsDisconnected:MEMORY[0x1E4F1CBF0]];
    }
    else {
      [v5 _updateCurrentCallsWithoutNotifications:v6];
    }
    [*(id *)(a1 + 40) setHasReceivedInitialState:1];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)hasReceivedInitialState
{
  return self->_hasReceivedInitialState;
}

- (void)setHasReceivedInitialState:(BOOL)a3
{
  self->_hasReceivedInitialState = a3;
}

- (void)_updateCurrentCallsWithoutNotifications:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TUCallServicesInterface *)self _updateCurrentCalls:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        long long v11 = -[TUCallServicesInterface _proxyCallWithCall:](self, "_proxyCallWithCall:", v10, (void)v12);
        [v11 updateWithCall:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (TUCallServicesInterface)init
{
  return 0;
}

- (TUCallServicesInterface)initWithQueue:(id)a3 callCenter:(id)a4
{
  return [(TUCallServicesInterface *)self initWithQueue:a3 callCenter:a4 wantsCallNotifications:1];
}

void __75__TUCallServicesInterface_initWithQueue_callCenter_wantsCallNotifications___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "com.apple.telephonyutilities.callservicesdaemon.connectionrequest";
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by requesting current state", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasReceivedInitialState:0];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [WeakRetained setLastDaemonConnectTime:v4];

  [WeakRetained _tearDownXPCConnection];
  [WeakRetained handleServerReconnect];
}

- (NSString)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(TUCallServicesInterface *)self currentCalls];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p calls=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (void)dealloc
{
  notify_cancel(self->_connectionRequestNotificationToken);
  [(TUCallServicesInterface *)self _tearDownXPCConnection];
  dispatch_queue_set_specific((dispatch_queue_t)self->_queue, [(TUCallServicesInterface *)self queueContext], 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)TUCallServicesInterface;
  [(TUCallServicesInterface *)&v3 dealloc];
}

void __46__TUCallServicesInterface__setUpXPCConnection__block_invoke(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldHandleServerDisconnect:1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_18;
  v4[3] = &unk_1E58E5BE0;
  v4[4] = WeakRetained;
  [WeakRetained performBlockOnQueue:v4];
}

uint64_t __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_18(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling XPC connection invalidation", v4, 2u);
  }

  [*(id *)(a1 + 32) handleServerDisconnectIfNecessary];
  return [*(id *)(a1 + 32) _tearDownXPCConnection];
}

void __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_20(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setShouldHandleServerDisconnect:1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_21;
  v4[3] = &unk_1E58E5BE0;
  v4[4] = WeakRetained;
  [WeakRetained performBlockOnQueue:v4];
}

uint64_t __46__TUCallServicesInterface__setUpXPCConnection__block_invoke_21(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling XPC connection interruption", v4, 2u);
  }

  return [*(id *)(a1 + 32) handleServerDisconnectIfNecessary];
}

- (void)_tearDownXPCConnection
{
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)_registerCall:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(TUCallServicesInterface *)self queue];
  [v5 setQueue:v4];

  [v5 setCallServicesInterface:self];
}

uint64_t __82__TUCallServicesInterface__updateCurrentCalls_withNotificationsUsingUpdatedCalls___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateComparativeCall];
}

- (id)_proxyCallWithCall:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  uint64_t v6 = [(TUCallServicesInterface *)self _proxyCallWithUniqueProxyIdentifier:v5];

  if (!v6)
  {
    uint64_t v7 = [TUProxyCall alloc];
    uint64_t v8 = [v4 uniqueProxyIdentifier];
    uint64_t v6 = [(TUCall *)v7 initWithUniqueProxyIdentifier:v8];

    -[TUProxyCall setIsVideo:](v6, "setIsVideo:", [v4 isVideo]);
    [(TUProxyCall *)v6 setProxyCallActionsDelegate:self];
    uint64_t v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v4 uniqueProxyIdentifier];
      int v14 = 138412546;
      long long v15 = v10;
      __int16 v16 = 2048;
      uint64_t v17 = v6;
      _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "No cached call found for %@. Initialized new proxy call %p", (uint8_t *)&v14, 0x16u);
    }
    long long v11 = [(TUCallServicesInterface *)self uniqueProxyIdentifierToProxyCall];
    long long v12 = [v4 uniqueProxyIdentifier];
    [v11 setObject:v6 forKey:v12];
  }

  return v6;
}

- (id)_proxyCallWithUniqueProxyIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(TUCallServicesInterface *)self uniqueProxyIdentifierToProxyCall];
    uint64_t v6 = [v5 objectForKey:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)registerCall:(id)a3
{
  id v5 = a3;
  id v4 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v4);

  [(TUCallServicesInterface *)self _registerCall:v5];
}

- (void)tearDownXPCConnection
{
  objc_super v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Asked to tear down XPC connection", v5, 2u);
  }

  [(TUCallServicesInterface *)self _tearDownXPCConnection];
}

void __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__TUCallServicesInterface_fetchCurrentCalls__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) handleServerDisconnect];
}

- (void)handleServerReconnect
{
  [(TUCallServicesInterface *)self setHasServerLaunched:1];
  [(TUCallServicesInterface *)self requestCurrentStateWithCompletionHandler:0];
  id v3 = [(TUCallServicesInterface *)self anonymousXPCEndpoint];

  if (v3)
  {
    id v4 = [(TUCallServicesInterface *)self anonymousXPCEndpoint];
    [(TUCallServicesInterface *)self registerAnonymousXPCEndpoint:v4];
  }
  id v5 = [(TUCallServicesInterface *)self localRouteController];
  [v5 handleServerReconnect];

  id v6 = [(TUCallServicesInterface *)self pairedHostDeviceRouteController];
  [v6 handleServerReconnect];
}

- (void)handleServerDisconnectIfNecessary
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(TUCallServicesInterface *)self shouldHandleServerDisconnect])
  {
    [(TUCallServicesInterface *)self handleServerDisconnect];
  }
  else
  {
    id v4 = TUDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring server disconnect", v5, 2u);
    }
  }
}

- (void)handleServerDisconnect
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(TUCallServicesInterface *)self hasReceivedInitialState])
  {
    [(TUCallServicesInterface *)self _ignorePendingServerDisconnectionHandlers];
    id v4 = (void *)MEMORY[0x1E4F1CA48];
    id v5 = [(TUCallServicesInterface *)self currentCalls];
    id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v17 = self;
    uint64_t v7 = [(TUCallServicesInterface *)self currentCalls];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          long long v13 = TUDefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v12;
            _os_log_error_impl(&dword_19C496000, v13, OS_LOG_TYPE_ERROR, "Disconnecting call with TUCallDisconnectedReasonComponentCrashed: %@", buf, 0xCu);
          }

          int v14 = +[TUProxyCall proxyCallWithCall:v12];
          [v14 setCallDisconnectedDueToComponentCrash];
          [v6 addObject:v14];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v9);
    }

    [(TUCallServicesInterface *)v17 _handleCurrentCallsChanged:MEMORY[0x1E4F1CBF0] callsDisconnected:v6];
    [(TUCallServicesInterface *)v17 resetCallProvisionalStates];
    long long v15 = [(TUCallServicesInterface *)v17 localRouteController];
    [v15 handleServerDisconnect];

    __int16 v16 = [(TUCallServicesInterface *)v17 pairedHostDeviceRouteController];
    [v16 handleServerDisconnect];
  }
}

- (id)dialWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v7;
    _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Proxying dial through CSD for %@", buf, 0xCu);
  }

  if (v8)
  {
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke;
    v39[3] = &unk_1E58E7648;
    v39[4] = self;
    id v11 = v8;
    id v40 = v11;
    uint64_t v12 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:v39];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_29;
    v37[3] = &unk_1E58E7698;
    v37[4] = self;
    id v38 = v11;
    [v12 dialWithRequest:v7 reply:v37];

    long long v13 = 0;
  }
  else
  {
    if ([(TUCallServicesInterface *)self isServerLocal])
    {
      int v14 = [NSString stringWithFormat:@"Local daemon delegate must pass in a completion block"];
      NSLog(&cfstr_TuassertionFai.isa, v14);

      if (_TUAssertShouldCrashApplication())
      {
        if ([(TUCallServicesInterface *)self isServerLocal])
        {
          v36 = [MEMORY[0x1E4F28B00] currentHandler];
          [v36 handleFailureInMethod:a2 object:self file:@"TUCallServicesInterface.m" lineNumber:530 description:@"Local daemon delegate must pass in a completion block"];
        }
      }
    }
    long long v15 = [TUProxyCall alloc];
    __int16 v16 = [v7 uniqueProxyIdentifier];
    uint64_t v17 = [(TUCall *)v15 initWithUniqueProxyIdentifier:v16];

    [(TUCallServicesInterface *)self registerCall:v17];
    [(TUProxyCall *)v17 setProxyCallActionsDelegate:self];
    long long v18 = [v7 provider];
    [(TUProxyCall *)v17 setProvider:v18];

    long long v19 = [v7 handle];
    [(TUProxyCall *)v17 setHandle:v19];

    long long v20 = [(TUProxyCall *)v17 handle];
    long long v21 = (void *)MEMORY[0x1E4F1CAD0];
    if (v20)
    {
      long long v22 = [(TUProxyCall *)v17 handle];
      uint64_t v23 = [v21 setWithObject:v22];
      [(TUProxyCall *)v17 setRemoteParticipantHandles:v23];
    }
    else
    {
      long long v22 = [MEMORY[0x1E4F1CAD0] set];
      [(TUProxyCall *)v17 setRemoteParticipantHandles:v22];
    }

    [(TUProxyCall *)v17 setCallStatus:3];
    uint64_t v24 = [v7 audioSourceIdentifier];
    [(TUCall *)v17 setSourceIdentifier:v24];

    uint64_t v25 = [v7 localSenderIdentityUUID];
    [(TUProxyCall *)v17 setLocalSenderIdentityUUID:v25];

    long long v26 = [v7 localSenderIdentityAccountUUID];
    [(TUProxyCall *)v17 setLocalSenderIdentityAccountUUID:v26];

    [(TUProxyCall *)v17 setOutgoing:1];
    -[TUProxyCall setVoicemail:](v17, "setVoicemail:", [v7 dialType] == 2);
    -[TUProxyCall setHostedOnCurrentDevice:](v17, "setHostedOnCurrentDevice:", [v7 hostOnCurrentDevice]);
    -[TUProxyCall setEndpointOnCurrentDevice:](v17, "setEndpointOnCurrentDevice:", [v7 endpointOnCurrentDevice]);
    -[TUProxyCall setIsVideo:](v17, "setIsVideo:", [v7 isVideo]);
    -[TUProxyCall setIsSendingVideo:](v17, "setIsSendingVideo:", [v7 isVideo]);
    -[TUProxyCall setEmergency:](v17, "setEmergency:", [v7 dialType] == 1);
    -[TUProxyCall setSOS:](v17, "setSOS:", [v7 isSOS]);
    -[TUProxyCall setTtyType:](v17, "setTtyType:", TUCallTTYTypeForTUDialRequestTTYType([v7 ttyType]));
    -[TUProxyCall setShouldSuppressInCallUI:](v17, "setShouldSuppressInCallUI:", [v7 shouldSuppressInCallUI]);
    -[TUProxyCall setOriginatingUIType:](v17, "setOriginatingUIType:", [v7 originatingUIType]);
    objc_super v27 = [TUDynamicCallDisplayContext alloc];
    v28 = [v7 contactIdentifier];
    v29 = [(TUCallServicesInterface *)self queue];
    v30 = [(TUDynamicCallDisplayContext *)v27 initWithCall:v17 contactIdentifier:v28 serialQueue:v29];

    [(TUProxyCall *)v17 setDisplayContext:v30];
    v31 = [(TUCallServicesInterface *)self asynchronousServer];
    __int16 v32 = (void *)[(TUDynamicCallDisplayContext *)v30 copy];
    [v31 dialWithRequest:v7 displayContext:v32];

    long long v13 = [(TUCallServicesInterface *)self _proxyCallWithCall:v17];
    v33 = [(TUCallServicesInterface *)self currentCalls];
    uint64_t v34 = [v33 arrayByAddingObject:v17];
    [(TUCallServicesInterface *)self _handleCurrentCallsChanged:v34 callsDisconnected:MEMORY[0x1E4F1CBF0]];
  }

  return v13;
}

void __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2;
  v6[3] = &unk_1E58E60D8;
  id v7 = v3;
  id v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 performBlockOnQueue:v6];
}

uint64_t __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2_30;
  v11[3] = &unk_1E58E7670;
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v12 = v5;
  long long v13 = v8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v6;
  id v10 = v5;
  [v8 performBlockOnQueue:v11];
}

uint64_t __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2_30(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  if (v2 && [v2 status] == 6)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    v9[0] = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v4 _handleCurrentCallsChanged:v3 callsDisconnected:v5];
  }
  else
  {
    [*(id *)(a1 + 40) _handleCurrentCallsChanged:*(void *)(a1 + 48) callsDisconnected:MEMORY[0x1E4F1CBF0]];
  }
  if (!*(void *)(a1 + 32))
  {
    id v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Passing nil call to dialWithRequest completion block", v8, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)joinConversationWithRequest:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v57 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying joinConversationWithRequest request: %@", buf, 0xCu);
  }

  uint64_t v7 = [v4 UUID];
  uint64_t v8 = [v7 UUIDString];
  id v9 = [(TUCallServicesInterface *)self _proxyCallWithUniqueProxyIdentifier:v8];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    id v11 = [TUProxyCall alloc];
    id v12 = [v4 UUID];
    long long v13 = [v12 UUIDString];
    id v10 = [(TUCall *)v11 initWithUniqueProxyIdentifier:v13];
  }
  [(TUCallServicesInterface *)self registerCall:v10];
  [(TUProxyCall *)v10 setProxyCallActionsDelegate:self];
  id v14 = [(TUCallServicesInterface *)self callCenter];
  id v15 = [v14 providerManager];

  __int16 v16 = [(TUCallServicesInterface *)self featureFlags];
  if ([v16 groupFacetimeAsAServiceEnabled])
  {
    uint64_t v17 = [v4 provider];
    long long v18 = [v17 identifier];
    long long v19 = [v15 providerWithIdentifier:v18];
  }
  else
  {
    long long v19 = [v15 faceTimeProvider];
  }

  [(TUProxyCall *)v10 setProvider:v19];
  [(TUProxyCall *)v10 setCallStatus:3];
  [(TUProxyCall *)v10 setOutgoing:1];
  [(TUProxyCall *)v10 setHostedOnCurrentDevice:1];
  [(TUProxyCall *)v10 setEndpointOnCurrentDevice:1];
  if ([v4 isVideo])
  {
    long long v20 = [v4 provider];
    -[TUProxyCall setIsVideo:](v10, "setIsVideo:", [v20 supportsVideo]);
  }
  else
  {
    [(TUProxyCall *)v10 setIsVideo:0];
  }
  -[TUProxyCall setShouldSuppressInCallUI:](v10, "setShouldSuppressInCallUI:", [v4 shouldSuppressInCallUI]);
  -[TUProxyCall setWantsStagingArea:](v10, "setWantsStagingArea:", [v4 wantsStagingArea]);
  long long v21 = [v4 callerID];
  long long v22 = [v19 senderIdentityForHandle:v21];
  uint64_t v23 = [v22 UUID];
  [(TUProxyCall *)v10 setLocalSenderIdentityUUID:v23];

  -[TUProxyCall setOriginatingUIType:](v10, "setOriginatingUIType:", [v4 originatingUIType]);
  if ([v4 requestToShareScreen]) {
    uint64_t v24 = 2;
  }
  else {
    uint64_t v24 = [v4 requestToShareMyScreen];
  }
  [(TUProxyCall *)v10 setScreenSharingIntention:v24];
  uint64_t v25 = [v4 remoteMembers];
  v50 = v15;
  if ([v25 count] == 1)
  {
    long long v26 = [v4 conversationLink];
    if (v26)
    {
      [(TUProxyCall *)v10 setConversation:1];
    }
    else
    {
      objc_super v27 = [v4 otherInvitedHandles];
      if ([v27 count])
      {
        [(TUProxyCall *)v10 setConversation:1];
      }
      else
      {
        v28 = [v4 provider];
        if ([v28 isDefaultProvider])
        {
          v48 = [v4 participantAssociation];
          [(TUProxyCall *)v10 setConversation:v48 != 0];
        }
        else
        {
          [(TUProxyCall *)v10 setConversation:1];
        }
      }
    }
  }
  else
  {
    [(TUProxyCall *)v10 setConversation:1];
  }

  if (v9)
  {
    objc_msgSend(v4, "setVideoEnabled:", -[TUProxyCall isSendingVideo](v10, "isSendingVideo"));
    objc_msgSend(v4, "setUplinkMuted:", -[TUProxyCall isUplinkMuted](v10, "isUplinkMuted"));
    v29 = TUDefaultLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = [v4 isVideoEnabled];
      int v31 = [v4 isUplinkMuted];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v57 = v30;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = v31;
      _os_log_impl(&dword_19C496000, v29, OS_LOG_TYPE_DEFAULT, "Updated joinConversationWithRequest videoEnable=%d uplinkMuted=%d", buf, 0xEu);
    }
  }
  -[TUProxyCall setIsSendingVideo:](v10, "setIsSendingVideo:", objc_msgSend(v4, "isVideoEnabled", v9));
  -[TUProxyCall setUplinkMuted:](v10, "setUplinkMuted:", [v4 isUplinkMuted]);
  __int16 v32 = [MEMORY[0x1E4F1CA80] set];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v33 = [v4 remoteMembers];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = [*(id *)(*((void *)&v51 + 1) + 8 * i) handle];
        [v32 addObject:v38];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v35);
  }

  [(TUProxyCall *)v10 setRemoteParticipantHandles:v32];
  v39 = [(TUProxyCall *)v10 remoteParticipantHandles];
  id v40 = [v39 anyObject];
  [(TUProxyCall *)v10 setHandle:v40];

  v41 = [TUDynamicCallDisplayContext alloc];
  id v42 = [(TUCallServicesInterface *)self queue];
  uint64_t v43 = [(TUDynamicCallDisplayContext *)v41 initWithCall:v10 contactIdentifier:0 serialQueue:v42];

  [(TUProxyCall *)v10 setDisplayContext:v43];
  v44 = [(TUCallServicesInterface *)self currentCalls];
  v45 = [v44 arrayByAddingObject:v10];
  [(TUCallServicesInterface *)self _handleCurrentCallsChanged:v45 callsDisconnected:MEMORY[0x1E4F1CBF0]];

  v46 = [(TUCallServicesInterface *)self asynchronousServer];
  [v46 joinConversationWithRequest:v4];

  return v10;
}

- (void)reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying reportLocalPreviewStopped for %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 reportLocalPreviewStoppedForCallWithUniqueProxyIdentifier:v4];
}

- (void)saveCustomGreeting:(id)a3 forAccountUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Proxying saveCustomGreeting", v11, 2u);
  }

  uint64_t v10 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:&__block_literal_global_33];
  [v10 saveCustomSandboxedURLGreeting:v7 forAccountUUID:v6];
}

void __61__TUCallServicesInterface_saveCustomGreeting_forAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __61__TUCallServicesInterface_saveCustomGreeting_forAccountUUID___block_invoke_cold_1();
  }
}

- (id)customGreetingForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying defaultGreetingForAccountUUID:", buf, 2u);
  }

  *(void *)buf = 0;
  id v12 = buf;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__9;
  id v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  id v7 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_47_0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke_48;
  v10[3] = &unk_1E58E76C0;
  v10[4] = buf;
  [v7 customSandboxedURLGreetingForAccountUUID:v4 withCompletion:v10];

  id v8 = *((id *)v12 + 5);
  _Block_object_dispose(buf, 8);

  return v8;
}

void __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke_cold_1();
  }
}

uint64_t __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke_48(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 URL];

  return MEMORY[0x1F41817F8]();
}

- (void)deleteCustomGreetingForAccountUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying deleteCustomGreetingForAccountUUID", v8, 2u);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:&__block_literal_global_51];
  [v7 deleteCustomGreetingForAccountUUID:v4];
}

void __62__TUCallServicesInterface_deleteCustomGreetingForAccountUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __61__TUCallServicesInterface_saveCustomGreeting_forAccountUUID___block_invoke_cold_1();
  }
}

- (id)defaultGreeting
{
  uint64_t v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying defaultGreeting", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v10 = buf;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__9;
  uint64_t v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  id v5 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_53];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__TUCallServicesInterface_defaultGreeting__block_invoke_54;
  v8[3] = &unk_1E58E76C0;
  void v8[4] = buf;
  [v5 defaultGreeting:v8];

  id v6 = *((id *)v10 + 5);
  _Block_object_dispose(buf, 8);

  return v6;
}

void __42__TUCallServicesInterface_defaultGreeting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __42__TUCallServicesInterface_defaultGreeting__block_invoke_cold_1();
  }
}

uint64_t __42__TUCallServicesInterface_defaultGreeting__block_invoke_54(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 URL];

  return MEMORY[0x1F41817F8]();
}

- (id)fetchCurrentCallUpdates
{
  uint64_t v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying fetchCurrentCallUpdates", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v10 = buf;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__9;
  uint64_t v13 = __Block_byref_object_dispose__9;
  id v14 = 0;
  id v5 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_56_0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke_57;
  v8[3] = &unk_1E58E6E00;
  void v8[4] = buf;
  [v5 fetchCurrentCallUpdates:v8];

  id v6 = (void *)[*((id *)v10 + 5) copy];
  _Block_object_dispose(buf, 8);

  return v6;
}

void __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke_cold_1();
  }
}

uint64_t __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke_57(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];

  return MEMORY[0x1F41817F8]();
}

- (void)screenWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying screenWithRequest", v8, 2u);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:&__block_literal_global_59_0];
  [v7 screenWithRequest:v4];
}

void __45__TUCallServicesInterface_screenWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __45__TUCallServicesInterface_screenWithRequest___block_invoke_cold_1();
  }
}

- (void)performRecordingRequest:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying perform recording request %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__TUCallServicesInterface_performRecordingRequest_completion___block_invoke;
  v11[3] = &unk_1E58E5CC8;
  id v12 = v7;
  id v9 = v7;
  uint64_t v10 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:v11];
  [v10 performRecordingRequest:v6 completion:v9];
}

void __62__TUCallServicesInterface_performRecordingRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__TUCallServicesInterface_performRecordingRequest_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerAnonymousXPCEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  [(TUCallServicesInterface *)self setAnonymousXPCEndpoint:v4];
  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying registerAnonymousXPCEndpoint", v8, 2u);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:&__block_literal_global_61_0];
  [v7 registerAnonymousXPCEndpoint:v4];
}

void __56__TUCallServicesInterface_registerAnonymousXPCEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __56__TUCallServicesInterface_registerAnonymousXPCEndpoint___block_invoke_cold_1();
  }
}

void __53__TUCallServicesInterface_fetchAnonymousXPCEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __53__TUCallServicesInterface_fetchAnonymousXPCEndpoint___block_invoke_cold_1();
  }
}

- (void)answerCallWithRequest:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying answer through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 answerCallWithRequest:v4];
}

- (void)holdCallWithUniqueProxyIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying hold through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 holdCallWithUniqueProxyIdentifier:v4];
}

- (void)unholdCallWithUniqueProxyIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying unhold through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 unholdCallWithUniqueProxyIdentifier:v4];
}

- (void)requestVideoUpgradeForCallWithUniqueProxyIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying upgrade video call through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 requestVideoUpgradeForCallWithUniqueProxyIdentifier:v4];
}

- (void)disconnectCallWithUniqueProxyIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying disconnect through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 disconnectCallWithUniqueProxyIdentifier:v4];
}

- (void)groupCallWithUniqueProxyIdentifier:(id)a3 withOtherCallWithUniqueProxyIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Proxying groupCall through CSD for %@ and %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [(TUCallServicesInterface *)self asynchronousServer];
  [v10 groupCallWithUniqueProxyIdentifier:v6 withOtherCallWithUniqueProxyIdentifier:v7];
}

- (void)ungroupCallWithUniqueProxyIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying ungroupCall through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 ungroupCallWithUniqueProxyIdentifier:v4];
}

- (void)swapCalls
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying swapCalls through CSD", v6, 2u);
  }

  id v5 = [(TUCallServicesInterface *)self asynchronousServer];
  [v5 swapCalls];
}

- (void)playDTMFToneForCallWithUniqueProxyIdentifier:(id)a3 key:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying playDTMFToneForCall:key: through CSD", v10, 2u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 playDTMFToneForCallWithUniqueProxyIdentifier:v6 key:v4];
}

- (void)disconnectCurrentCallAndActivateHeld
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying disconnectCurrentCallAndActivateHeld through CSD", v6, 2u);
  }

  id v5 = [(TUCallServicesInterface *)self asynchronousServer];
  [v5 disconnectCurrentCallAndActivateHeld];
}

- (void)disconnectAllCalls
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying disconnectAllCalls through CSD", v6, 2u);
  }

  id v5 = [(TUCallServicesInterface *)self asynchronousServer];
  [v5 disconnectAllCalls];
}

- (void)setTTYType:(int)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setTTYType:forCall: through CSD", v10, 2u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setTTYType:v4 forCallWithUniqueProxyIdentifier:v6];
}

- (void)setLiveVoicemailUnavailableReason:(int64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setLiveVoicemailUnavailableReason:forCall: through CSD", v10, 2u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setLiveVoicemailUnavailableReason:a3 forCallWithUniqueProxyIdentifier:v6];
}

- (void)pullRelayingCallsFromClient
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying pullRelayingCallsFromClient through CSD", v6, 2u);
  }

  id v5 = [(TUCallServicesInterface *)self asynchronousServer];
  [v5 pullRelayingCallsFromClient];
}

- (void)pullRelayingGFTCallsFromClientIfNecessary
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying pullRelayingGFTCallsFromClientIfNecessary through CSD", v6, 2u);
  }

  id v5 = [(TUCallServicesInterface *)self asynchronousServer];
  [v5 pullRelayingGFTCallsFromClientIfNecessary];
}

- (void)pushRelayingCallsToHostWithSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying pushRelayingCallsToHost through CSD", v8, 2u);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 pushRelayingCallsToHostWithSourceIdentifier:v4];
}

- (void)pullCallFromClientUsingHandoffActivityUserInfo:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int v8 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"non-nil";
    if (!v6) {
      uint64_t v10 = @"nil";
    }
    *(_DWORD *)buf = 138412290;
    long long v20 = v10;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Proxying pullCallFromClientUsingHandoffActivityUserInfo through CSD with completion block (%@)", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke;
  aBlock[3] = &unk_1E58E7698;
  aBlock[4] = self;
  id v18 = v6;
  id v11 = v6;
  id v12 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3;
  v15[3] = &unk_1E58E5CC8;
  id v16 = v12;
  id v13 = v12;
  id v14 = [(TUCallServicesInterface *)self asynchronousServerWithErrorHandler:v15];
  [v14 pullCallFromClientUsingHandoffActivityUserInfo:v7 reply:v13];
}

void __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_2;
  v11[3] = &unk_1E58E68A0;
  int v8 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v12 = v6;
  id v13 = v8;
  id v14 = v5;
  id v15 = v7;
  id v9 = v5;
  id v10 = v6;
  [v8 performBlockOnQueue:v11];
}

uint64_t __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) _handleCurrentCallsChanged:v2 callsDisconnected:MEMORY[0x1E4F1CBF0]];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pullPersistedChannel:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying pullPersistedChannel through CSD", v8, 2u);
  }

  id v7 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_71_1];
  [v7 pullPersistedChannel:v4];
}

void __48__TUCallServicesInterface_pullPersistedChannel___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1();
  }
}

- (void)startTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Proxying start transmission through CSD", v9, 2u);
  }

  int v8 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_73_0];
  [v8 startTransmissionForBargeCall:v6 sourceIsHandsfreeAccessory:v4];
}

void __84__TUCallServicesInterface_startTransmissionForBargeCall_sourceIsHandsfreeAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1();
  }
}

- (void)stopTransmissionForBargeCall:(id)a3 sourceIsHandsfreeAccessory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = TUDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19C496000, v7, OS_LOG_TYPE_DEFAULT, "Proxying stop transmission through CSD", v9, 2u);
  }

  int v8 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_75];
  [v8 stopTransmissionForBargeCall:v6 sourceIsHandsfreeAccessory:v4];
}

void __83__TUCallServicesInterface_stopTransmissionForBargeCall_sourceIsHandsfreeAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1();
  }
}

- (void)pushHostedCallsToDestination:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying pushHostedCallsToDestination through CSD for destination %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 pushHostedCallsToDestination:v4];
}

- (void)pullHostedCallsFromPairedHostDevice
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying pullHostedCallsFromPairedHostDevice through CSD", v6, 2u);
  }

  id v5 = [(TUCallServicesInterface *)self asynchronousServer];
  [v5 pullHostedCallsFromPairedHostDevice];
}

- (void)sendHardPauseDigitsForCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying sendHardPauseDigits through CSD", v8, 2u);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 sendHardPauseDigitsForCallWithUniqueProxyIdentifier:v4];
}

- (void)updateCallWithProxy:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying updateCallWithProxy through CSD for proxy call %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 updateCallWithProxy:v4];
}

- (void)enteredForegroundForCallWithUniqueProxyIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying enteredForegroundForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 enteredForegroundForCallWithUniqueProxyIdentifier:v4];
}

- (void)willEnterBackgroundForAllCalls
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying willEnterBackgroundForAllCalls through CSD", v6, 2u);
  }

  id v5 = [(TUCallServicesInterface *)self asynchronousServer];
  [v5 willEnterBackgroundForAllCalls];
}

- (void)enteredBackgroundForAllCalls
{
  id v3 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = TUDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_19C496000, v4, OS_LOG_TYPE_DEFAULT, "Proxying enteredBackgroundForAllCalls through CSD", v6, 2u);
  }

  id v5 = [(TUCallServicesInterface *)self asynchronousServer];
  [v5 enteredBackgroundForAllCalls];
}

- (void)setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v17.double width = width;
    v17.double height = height;
    uint64_t v10 = NSStringFromSize(v17);
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Proxying setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@, size %@", (uint8_t *)&v12, 0x16u);
  }
  id v11 = [(TUCallServicesInterface *)self asynchronousServer];
  objc_msgSend(v11, "setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:size:", v7, width, height);
}

- (void)setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:(id)a3 presentationState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@, presentationState %d", (uint8_t *)&v10, 0x12u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:v6 presentationState:v4];
}

- (void)setScreenShareAttributesForCallWithUniqueProxyIdentifier:(id)a3 attributes:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Proxying setScreenShareAttributesForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@, screenShareAttributes %@", (uint8_t *)&v11, 0x16u);
  }

  int v10 = [(TUCallServicesInterface *)self asynchronousServer];
  [v10 setScreenShareAttributesForCallWithUniqueProxyIdentifier:v6 attributes:v7];
}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4 forCallWithUniqueProxyIdentifier:(id)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v10);

  int v11 = TUDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109634;
    v13[1] = v6;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_19C496000, v11, OS_LOG_TYPE_DEFAULT, "Proxying setSharingScreen: %d through CSD for uniqueProxyIdentifier %@, screenShareAttributes %@", (uint8_t *)v13, 0x1Cu);
  }

  id v12 = [(TUCallServicesInterface *)self asynchronousServer];
  [v12 setSharingScreen:v6 attributes:v8 forCallWithUniqueProxyIdentifier:v9];
}

- (void)setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:(id)a3 bluetoothAudioFormat:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2048;
    int64_t v13 = a4;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setBluetoothAudioFormatForCallWithUniqueProxyIdentifier through CSD for uniqueProxyIdentifier %@, bluetoothAudioFormat %ld", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:v6 bluetoothAudioFormat:a4];
}

- (void)sendMMIOrUSSDCodeWithRequest:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Sending MMI/USSD code through CSD for %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 sendMMIOrUSSDCodeWithRequest:v4];
}

- (void)setUplinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setUplinkMuted=%d for %@", (uint8_t *)v10, 0x12u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setUplinkMuted:v4 forCallWithUniqueProxyIdentifier:v6];
}

- (void)setDownlinkMuted:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setDownlinkMuted=%d for %@", (uint8_t *)v10, 0x12u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setDownlinkMuted:v4 forCallWithUniqueProxyIdentifier:v6];
}

- (void)addScreenSharingType:(unint64_t)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    unint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying addScreenSharingType=%lu for %@", (uint8_t *)&v10, 0x16u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 addScreenSharingType:a3 forCallWithUniqueProxyIdentifier:v6];
}

- (void)setIsSendingVideo:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setIsSendingVideo=%d for %@", (uint8_t *)v10, 0x12u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setIsSendingVideo:v4 forCallWithUniqueProxyIdentifier:v6];
}

- (void)setMixesVoiceWithMedia:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setMixesVoiceWithMedia=%d for %@", (uint8_t *)v10, 0x12u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setMixesVoiceWithMedia:v4 forCallWithUniqueProxyIdentifier:v6];
}

- (void)setSharingScreen:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setSharingScreen=%d for %@", (uint8_t *)v10, 0x12u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setSharingScreen:v4 forCallWithUniqueProxyIdentifier:v6];
}

- (void)setHasEmergencyVideoStream:(BOOL)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = v4;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying setHasEmergencyVideoStream=%d for %@", (uint8_t *)v10, 0x12u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 setHasEmergencyVideoStream:v4 forCallWithUniqueProxyIdentifier:v6];
}

- (void)setEmergencyMediaItems:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = TUDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Proxying setEmergencyMediaItems=%@ for %@", (uint8_t *)&v11, 0x16u);
  }

  int v10 = [(TUCallServicesInterface *)self asynchronousServer];
  [v10 setEmergencyMediaItems:v6 forCallWithUniqueProxyIdentifier:v7];
}

- (void)shouldSuppressInCallStatusBar:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying shouldSuppressInCallStatusBar=%d through CSD", (uint8_t *)v8, 8u);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 shouldSuppressInCallStatusBar:v3];
}

- (void)shouldAllowRingingCallStatusIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying shouldAllowRingingCallStatusIndicator=%d through CSD", (uint8_t *)v8, 8u);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 shouldAllowRingingCallStatusIndicator:v3];
}

- (void)activateInCallUIWithActivityContinuationIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = TUDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proying activateInCallUIWithActivityContinuationIdentifier=%@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(TUCallServicesInterface *)self asynchronousServer];
  [v7 activateInCallUIWithActivityContinuationIdentifier:v4];
}

- (void)sendUserScoreToRTCReporting:(id)a3 withScore:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v7);

  int v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 1024;
    int v13 = v4;
    _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "CallServicesInterface: sendUserScoreToRTCReporting with UUID: %@ and Score: %d", (uint8_t *)&v10, 0x12u);
  }

  id v9 = [(TUCallServicesInterface *)self asynchronousServer];
  [v9 sendUserScoreToRTCReporting:v6 withScore:v4];
}

- (void)setCurrentAudioInputDeviceToDeviceWithUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![(TUCallServicesInterface *)self isServerLocal])
  {
    id v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying setCurrentAudioInputDeviceToDeviceWithUID through CSD for UID %@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(TUCallServicesInterface *)self asynchronousServer];
    [v7 setCurrentAudioInputDeviceToDeviceWithUID:v4];
  }
}

- (void)setCurrentAudioOutputDeviceToDeviceWithUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  if (![(TUCallServicesInterface *)self isServerLocal])
  {
    id v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_19C496000, v6, OS_LOG_TYPE_DEFAULT, "Proxying setCurrentOutputDeviceToDeviceWithUID through CSD for deviceUID %@", (uint8_t *)&v8, 0xCu);
    }

    id v7 = [(TUCallServicesInterface *)self asynchronousServer];
    [v7 setCurrentAudioOutputDeviceToDeviceWithUID:v4];
  }
}

- (id)routesByUniqueIdentifierForRouteController:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__9;
  long long v20 = __Block_byref_object_dispose__9;
  id v21 = (id)MEMORY[0x1E4F1CC08];
  id v6 = [(TUCallServicesInterface *)self localRouteController];

  if (v6 == v4)
  {
    uint64_t v10 = TUDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v10, OS_LOG_TYPE_DEFAULT, "Proxying localRoutesByUniqueIdentifier synchronously", buf, 2u);
    }

    id v9 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_77];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_78;
    v14[3] = &unk_1E58E76E8;
    v14[4] = &v16;
    [v9 localRoutesByUniqueIdentifier:v14];
  }
  else
  {
    id v7 = [(TUCallServicesInterface *)self pairedHostDeviceRouteController];

    if (v7 != v4) {
      goto LABEL_10;
    }
    int v8 = TUDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19C496000, v8, OS_LOG_TYPE_DEFAULT, "Proxying pairedHostDeviceRoutesByUniqueIdentifier synchronously", buf, 2u);
    }

    id v9 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_82_0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    _DWORD v13[2] = __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_83;
    v13[3] = &unk_1E58E76E8;
    void v13[4] = &v16;
    [v9 pairedHostDeviceRoutesByUniqueIdentifier:v13];
  }

LABEL_10:
  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_cold_1();
  }
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_78(uint64_t a1, void *a2)
{
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_80(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_80_cold_1();
  }
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_83(uint64_t a1, void *a2)
{
}

- (void)pickRouteWithUniqueIdentifier:(id)a3 shouldWaitUntilAvailable:(BOOL)a4 forRouteController:(id)a5
{
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(TUCallServicesInterface *)self localRouteController];

  if (v11 == v9)
  {
    uint64_t v15 = TUDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 1024;
      BOOL v19 = v6;
      _os_log_impl(&dword_19C496000, v15, OS_LOG_TYPE_DEFAULT, "Proxying pickLocalRouteWithUniqueIdentifier for %@ shouldWaitUntilAvailable: %d", (uint8_t *)&v16, 0x12u);
    }

    uint64_t v14 = [(TUCallServicesInterface *)self asynchronousServer];
    [v14 pickLocalRouteWithUniqueIdentifier:v8 shouldWaitUntilAvailable:v6];
    goto LABEL_9;
  }
  id v12 = [(TUCallServicesInterface *)self pairedHostDeviceRouteController];

  if (v12 == v9)
  {
    int v13 = TUDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 1024;
      BOOL v19 = v6;
      _os_log_impl(&dword_19C496000, v13, OS_LOG_TYPE_DEFAULT, "Proxying pickPairedHostDeviceRouteWithUniqueIdentifier for %@ shouldWaitUntilAvailable: %d", (uint8_t *)&v16, 0x12u);
    }

    uint64_t v14 = [(TUCallServicesInterface *)self asynchronousServer];
    [v14 pickPairedHostDeviceRouteWithUniqueIdentifier:v8 shouldWaitUntilAvailable:v6];
LABEL_9:
  }
}

- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v10);

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v11 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_85];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_86;
  v13[3] = &unk_1E58E7710;
  void v13[4] = &v14;
  [v11 containsRestrictedHandle:v8 forBundleIdentifier:v9 performSynchronously:v5 reply:v13];

  LOBYTE(v5) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_cold_1();
  }
}

uint64_t __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_86(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__9;
  char v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  id v9 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_89];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke_90;
  v12[3] = &unk_1E58E76E8;
  v12[4] = &v13;
  [v9 policyForAddresses:v6 forBundleIdentifier:v7 reply:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke_cold_1();
  }
}

void __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke_90(uint64_t a1, void *a2)
{
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TUCallServicesInterface *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v9 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_92];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__TUCallServicesInterface_willRestrictAddresses_forBundleIdentifier___block_invoke_93;
  v11[3] = &unk_1E58E7710;
  void v11[4] = &v12;
  [v9 willRestrictAddresses:v6 forBundleIdentifier:v7 reply:v11];

  LOBYTE(v9) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v9;
}

void __69__TUCallServicesInterface_willRestrictAddresses_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_cold_1();
  }
}

uint64_t __69__TUCallServicesInterface_willRestrictAddresses_forBundleIdentifier___block_invoke_93(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v10 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_95];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_96;
  v12[3] = &unk_1E58E7710;
  v12[4] = &v13;
  [v10 shouldRestrictAddresses:v8 forBundleIdentifier:v9 performSynchronously:v5 reply:v12];

  LOBYTE(v5) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v5;
}

void __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_cold_1();
  }
}

uint64_t __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_96(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (unint64_t)filterStatusForAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v8 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_98];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__TUCallServicesInterface_filterStatusForAddresses_forBundleIdentifier___block_invoke_99;
  v11[3] = &unk_1E58E7738;
  void v11[4] = &v12;
  [v8 filterStatusForAddresses:v6 forBundleIdentifier:v7 reply:v11];

  unint64_t v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __72__TUCallServicesInterface_filterStatusForAddresses_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_cold_1();
  }
}

uint64_t __72__TUCallServicesInterface_filterStatusForAddresses_forBundleIdentifier___block_invoke_99(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v11 = [(TUCallServicesInterface *)self synchronousServerWithErrorHandler:&__block_literal_global_102_0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke_103;
  v13[3] = &unk_1E58E7710;
  void v13[4] = &v14;
  [v11 isUnknownAddress:v8 normalizedAddress:v9 forBundleIdentifier:v10 reply:v13];

  LOBYTE(v11) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)v11;
}

void __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = TUDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke_cold_1();
  }
}

uint64_t __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke_103(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)handleLocalRoutesByUniqueIdentifierUpdated:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__TUCallServicesInterface_handleLocalRoutesByUniqueIdentifierUpdated___block_invoke;
  v6[3] = &unk_1E58E5C08;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TUCallServicesInterface *)self performBlockOnQueue:v6];
}

void __70__TUCallServicesInterface_handleLocalRoutesByUniqueIdentifierUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localRouteController];
  [v2 handleRoutesByUniqueIdentifierUpdated:*(void *)(a1 + 40)];
}

- (void)handlePairedHostDeviceRoutesByUniqueIdentifierUpdated:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__TUCallServicesInterface_handlePairedHostDeviceRoutesByUniqueIdentifierUpdated___block_invoke;
  v6[3] = &unk_1E58E5C08;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TUCallServicesInterface *)self performBlockOnQueue:v6];
}

void __81__TUCallServicesInterface_handlePairedHostDeviceRoutesByUniqueIdentifierUpdated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pairedHostDeviceRouteController];
  [v2 handleRoutesByUniqueIdentifierUpdated:*(void *)(a1 + 40)];
}

- (void)handleFrequencyChangedTo:(id)a3 inDirection:(int)a4 forCallsWithUniqueProxyIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__TUCallServicesInterface_handleFrequencyChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers___block_invoke;
  v12[3] = &unk_1E58E7760;
  id v13 = v9;
  uint64_t v14 = self;
  int v16 = a4;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  [(TUCallServicesInterface *)self performBlockOnQueue:v12];
}

void __99__TUCallServicesInterface_handleFrequencyChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1 + 40), "_proxyCallWithUniqueProxyIdentifier:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        id v8 = v7;
        int v9 = *(_DWORD *)(a1 + 56);
        if (v9 == 2)
        {
          [v7 setLocalFrequency:*(void *)(a1 + 48)];
        }
        else if (v9 == 1)
        {
          [v7 setRemoteFrequency:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)handleCurrentCallsChanged:(id)a3 callDisconnected:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v11 = v6;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a3;
    id v10 = [v8 arrayWithObjects:&v11 count:1];
    -[TUCallServicesInterface _handleCurrentCallsChanged:callsDisconnected:](self, "_handleCurrentCallsChanged:callsDisconnected:", v9, v10, v11, v12);
  }
  else
  {
    id v10 = a3;
    [(TUCallServicesInterface *)self _handleCurrentCallsChanged:v10 callsDisconnected:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)handleMeterLevelChangedTo:(float)a3 inDirection:(int)a4 forCallsWithUniqueProxyIdentifiers:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __100__TUCallServicesInterface_handleMeterLevelChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers___block_invoke;
  v10[3] = &unk_1E58E68F0;
  id v11 = v8;
  uint64_t v12 = self;
  int v13 = a4;
  float v14 = a3;
  id v9 = v8;
  [(TUCallServicesInterface *)self performBlockOnQueue:v10];
}

void __100__TUCallServicesInterface_handleMeterLevelChangedTo_inDirection_forCallsWithUniqueProxyIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1 + 40), "_proxyCallWithUniqueProxyIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        id v9 = v7;
        int v10 = *(_DWORD *)(a1 + 48);
        if (v10 == 2)
        {
          LODWORD(v8) = *(_DWORD *)(a1 + 52);
          [v7 setLocalMeterLevel:v8];
        }
        else if (v10 == 1)
        {
          LODWORD(v8) = *(_DWORD *)(a1 + 52);
          [v7 setRemoteMeterLevel:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)handleUIXPCEndpointChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__TUCallServicesInterface_handleUIXPCEndpointChanged___block_invoke;
  v6[3] = &unk_1E58E5C08;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TUCallServicesInterface *)self performBlockOnQueue:v6];
}

void __54__TUCallServicesInterface_handleUIXPCEndpointChanged___block_invoke(uint64_t a1)
{
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "HandlingUIXPCEndpointChanged", v8, 2u);
  }

  uint64_t v3 = [TUUIXPCClientConnection alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) callCenter];
  id v6 = [(TUUIXPCClientConnection *)v3 initWithListenerEndpoint:v4 callCenter:v5];
  id v7 = [*(id *)(a1 + 32) callCenter];
  [v7 setUiDataSource:v6];
}

- (void)handleReceivedCallDTMFUpdate:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __89__TUCallServicesInterface_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier___block_invoke;
  v10[3] = &unk_1E58E6258;
  id v11 = v6;
  id v12 = v7;
  long long v13 = self;
  id v8 = v7;
  id v9 = v6;
  [(TUCallServicesInterface *)self performBlockOnQueue:v10];
}

void __89__TUCallServicesInterface_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v13 = 138412546;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "handleReceivedCallDTMFUpdate %@ for call with unique proxy identifier %@", (uint8_t *)&v13, 0x16u);
  }

  id v5 = [*(id *)(a1 + 48) _proxyCallWithUniqueProxyIdentifier:*(void *)(a1 + 40)];
  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) callCenter];
    [v6 _handleReceivedCallDTMFUpdate:*(void *)(a1 + 32) forCall:v5];
  }
  else
  {
    id v6 = TUDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __89__TUCallServicesInterface_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier___block_invoke_cold_1(a1 + 40, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)_handleCurrentCallsChanged:(id)a3 callsDisconnected:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke;
  v10[3] = &unk_1E58E6258;
  id v11 = v6;
  uint64_t v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(TUCallServicesInterface *)self performBlockOnQueue:v10];
}

void __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling current calls changed: %@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) callNotificationManager];
  id v5 = [*(id *)(a1 + 40) callCenter];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke_105;
  v7[3] = &unk_1E58E6258;
  id v6 = *(void **)(a1 + 48);
  void v7[4] = *(void *)(a1 + 40);
  id v8 = v6;
  id v9 = *(id *)(a1 + 32);
  [v4 postNotificationsForCallContainer:v5 afterUpdatesInBlock:v7];
}

void __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke_105(id *a1)
{
  id v2 = [a1[4] callNotificationManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke_2;
  v5[3] = &unk_1E58E6258;
  id v6 = a1[5];
  id v3 = a1[6];
  id v4 = a1[4];
  id v7 = v3;
  id v8 = v4;
  [v2 deferNotificationsUntilAfterPerformingBlock:v5];
}

void __72__TUCallServicesInterface__handleCurrentCallsChanged_callsDisconnected___block_invoke_2(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a1[4] count])
  {
    id v2 = TUDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = a1[4];
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling call changed for disconnected calls: %@", buf, 0xCu);
    }

    id v4 = [a1[5] arrayByAddingObjectsFromArray:a1[4]];
  }
  else
  {
    id v4 = a1[5];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(a1[6], "_proxyCallWithCall:", v10, (void)v12);
        [v10 setComparativeCall:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [a1[6] _updateCurrentCalls:a1[5] withNotificationsUsingUpdatedCalls:v5];
}

- (void)resetCallProvisionalStates
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__TUCallServicesInterface_resetCallProvisionalStates__block_invoke;
  v2[3] = &unk_1E58E5BE0;
  v2[4] = self;
  [(TUCallServicesInterface *)self performBlockOnQueue:v2];
}

void __53__TUCallServicesInterface_resetCallProvisionalStates__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = @"TUCallCenterResetCallStateNotification";
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Resetting call transition states and posting %@", buf, 0xCu);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [*(id *)(a1 + 32) currentCalls];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        id v9 = [*(id *)(a1 + 32) callNotificationManager];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __53__TUCallServicesInterface_resetCallProvisionalStates__block_invoke_106;
        v11[3] = &unk_1E58E5BE0;
        void v11[4] = v8;
        [v9 postNotificationsForCall:v8 afterUpdatesInBlock:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"TUCallCenterResetCallStateNotification" object:0];
}

uint64_t __53__TUCallServicesInterface_resetCallProvisionalStates__block_invoke_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetProvisionalState];
}

- (void)handleNotificationName:(id)a3 forCallWithUniqueProxyIdentifier:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __92__TUCallServicesInterface_handleNotificationName_forCallWithUniqueProxyIdentifier_userInfo___block_invoke;
  v14[3] = &unk_1E58E63D8;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v18 = self;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(TUCallServicesInterface *)self performBlockOnQueue:v14];
}

void __92__TUCallServicesInterface_handleNotificationName_forCallWithUniqueProxyIdentifier_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v8 = 138412802;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling notification %@ for call with unique proxy identifier %@ userInfo %@", (uint8_t *)&v8, 0x20u);
  }

  uint64_t v6 = [*(id *)(a1 + 56) _proxyCallWithUniqueProxyIdentifier:*(void *)(a1 + 40)];
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:*(void *)(a1 + 32) object:v6 userInfo:*(void *)(a1 + 48)];
}

- (TUCallCenter)callCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callCenter);

  return (TUCallCenter *)WeakRetained;
}

- (void)setCallCenter:(id)a3
{
}

- (TURouteController)pairedHostDeviceRouteController
{
  return self->_pairedHostDeviceRouteController;
}

- (void)setPairedHostDeviceRouteController:(id)a3
{
}

- (NSDate)lastDaemonConnectTime
{
  return self->_lastDaemonConnectTime;
}

- (void)setLastDaemonConnectTime:(id)a3
{
  self->_lastDaemonConnectTime = (NSDate *)a3;
}

- (void)setXpcConnection:(id)a3
{
}

- (BOOL)shouldHandleServerDisconnect
{
  return self->_shouldHandleServerDisconnect;
}

- (NSMapTable)uniqueProxyIdentifierToProxyCall
{
  return self->_uniqueProxyIdentifierToProxyCall;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (NSXPCListenerEndpoint)anonymousXPCEndpoint
{
  return self->_anonymousXPCEndpoint;
}

- (void)setAnonymousXPCEndpoint:(id)a3
{
}

- (NSArray)localProxyCalls
{
  return self->_localProxyCalls;
}

- (void)setHasServerLaunched:(BOOL)a3
{
  self->_hasServerLaunched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProxyCalls, 0);
  objc_storeStrong((id *)&self->_anonymousXPCEndpoint, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callNotificationManager, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifierToProxyCall, 0);
  objc_storeStrong((id *)&self->_currentCalls, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pairedHostDeviceRouteController, 0);
  objc_storeStrong((id *)&self->_localRouteController, 0);
  objc_destroyWeak((id *)&self->_callCenter);
  objc_storeStrong((id *)&self->_callServicesClientCapabilities, 0);

  objc_destroyWeak((id *)&self->_server);
}

void __87__TUCallServicesInterface_requestCurrentStateWithCompletionHandler_handleInitialState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy: %@", v2, v3, v4, v5, v6);
}

void __54__TUCallServicesInterface_dialWithRequest_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__TUCallServicesInterface_saveCustomGreeting_forAccountUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting answering machine availability: %@", v2, v3, v4, v5, v6);
}

void __56__TUCallServicesInterface_customGreetingForAccountUUID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting custom greeting: %@", v2, v3, v4, v5, v6);
}

void __42__TUCallServicesInterface_defaultGreeting__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting default greeting: %@", v2, v3, v4, v5, v6);
}

void __50__TUCallServicesInterface_fetchCurrentCallUpdates__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when fetching TUCallUpdates: %@", v2, v3, v4, v5, v6);
}

void __45__TUCallServicesInterface_screenWithRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when screenWithRequest: %@", v2, v3, v4, v5, v6);
}

void __62__TUCallServicesInterface_performRecordingRequest_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when perform audio recording request: %@", v2, v3, v4, v5, v6);
}

void __56__TUCallServicesInterface_registerAnonymousXPCEndpoint___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when registerAnonymousXPCEndpoint: %@", v2, v3, v4, v5, v6);
}

void __53__TUCallServicesInterface_fetchAnonymousXPCEndpoint___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when fetchAnonymousXPCEndpoint: %@", v2, v3, v4, v5, v6);
}

void __85__TUCallServicesInterface_pullCallFromClientUsingHandoffActivityUserInfo_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy for %@", v2, v3, v4, v5, v6);
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting synchronous local routes: %@", v2, v3, v4, v5, v6);
}

void __70__TUCallServicesInterface_routesByUniqueIdentifierForRouteController___block_invoke_80_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting synchronous paired host device routes: %@", v2, v3, v4, v5, v6);
}

void __93__TUCallServicesInterface_containsRestrictedHandle_forBundleIdentifier_performSynchronously___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting synchronous restricted handle check: %@", v2, v3, v4, v5, v6);
}

void __66__TUCallServicesInterface_policyForAddresses_forBundleIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting synchronous policy check for addresses: %@", v2, v3, v4, v5, v6);
}

void __92__TUCallServicesInterface_shouldRestrictAddresses_forBundleIdentifier_performSynchronously___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting synchronous restricted addresses check: %@", v2, v3, v4, v5, v6);
}

void __82__TUCallServicesInterface_isUnknownAddress_normalizedAddress_forBundleIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_19C496000, v0, v1, "Error using remote object proxy when requesting synchronous unknown address check: %@", v2, v3, v4, v5, v6);
}

void __89__TUCallServicesInterface_handleReceivedCallDTMFUpdate_forCallWithUniqueProxyIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end