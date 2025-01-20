@interface TVRCRPCompanionLinkClientWrapper
+ (TVRCRPCompanionLinkClientWrapper)wrapperWithDevice:(id)a3;
- (BOOL)_featureSupported:(id)a3;
- (BOOL)_findMyRemoteSupportedForDevice:(id)a3;
- (BOOL)activated;
- (BOOL)authenticated;
- (BOOL)connected;
- (BOOL)hidSessionActivated;
- (BOOL)hidTouchSessionActivated;
- (BOOL)isGuideButtonSupported;
- (BOOL)isInvalidating;
- (BOOL)isPaired;
- (BOOL)isSiriEnabled;
- (BOOL)pttFeatureSupported;
- (BOOL)receivedSiriSettings;
- (BOOL)receivedVolumeSettings;
- (BOOL)startedSetup;
- (BOOL)supportsDirectCaptionQueries;
- (BOOL)supportsFindMyRemote;
- (BOOL)supportsTouchEvents;
- (BOOL)textInputSessionActivated;
- (NSDictionary)alternateIdentifiers;
- (NSString)description;
- (NSString)identifier;
- (NSString)idsIdentifier;
- (NSString)model;
- (NSString)name;
- (NSString)sourceVersion;
- (RPCompanionLinkClient)companionClient;
- (RPCompanionLinkDevice)device;
- (RPHIDSession)hidSession;
- (RPHIDTouchSession)hidTouchSession;
- (RPSiriSession)siriSession;
- (RPTextInputSession)textInputSession;
- (TVRCNowPlayingInfo)nowPlayingInfo;
- (TVRCRPCompanionLinkClientWrapper)initWithDevice:(id)a3;
- (TVRCRapportMediaEventsManager)mediaManager;
- (TVRCSiriRemoteFindingManager)remoteFindingManager;
- (TVRCSiriRemoteInfo)pairedRemoteInfo;
- (_TVRCCompanionLinkClientWrapperDelegate)delegate;
- (id)_stringForFeatureFlags:(unint64_t)a3;
- (id)invalidationCompletionBlock;
- (id)newCompanionLinkClient;
- (id)rtiSessionHandler;
- (id)supportedButtons;
- (int)_commandForButtonEvent:(id)a3;
- (int)_stateForButtonEvent:(id)a3;
- (int64_t)attentionState;
- (int64_t)connectionType;
- (int64_t)linkType;
- (int64_t)siriRemoteFindingSessionState;
- (unint64_t)featureFlags;
- (void)_disconnectWithError:(id)a3;
- (void)_fetchSiriEnabledWithSiriInfo:(id)a3 completionHandler:(id)a4;
- (void)_fetchTVSystemStatusAndStartMonitoring;
- (void)_handleSideEffectsForEvent:(id)a3;
- (void)_invalidateAndReset;
- (void)_invalidateAndResetWithCompletionHandler:(id)a3;
- (void)_invalidateRemoteFindingManager;
- (void)_launchApplicationOrURL:(id)a3;
- (void)_resetState;
- (void)_resolveFeatureFlags;
- (void)_sendSessionStart;
- (void)_sendSessionStop;
- (void)_setupFeatureServicesIfNeeded;
- (void)_setupHidSessionIfNeeded;
- (void)_setupRemoteFindingManagerIfNeeded;
- (void)_setupTextInputSessionIfNeeded;
- (void)_setupTouchSessionIfNeeded;
- (void)_startMonitoringNowPlayingInfo;
- (void)_startMonitoringSupportedActions;
- (void)_startMonitoringTVSystemStatus;
- (void)_stopMonitoringNowPlayingInfo;
- (void)_stopMonitoringSupportedActions;
- (void)_stopMonitoringTVSystemStatus;
- (void)_updateAttentionState:(int64_t)a3;
- (void)_updateConnectedState;
- (void)_updateNowPlayingInfo:(id)a3;
- (void)_updateSiriRemoteFindingState:(int64_t)a3;
- (void)_updateSiriStatusFromSiriInfo:(id)a3;
- (void)_updateSupportedButtons;
- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)connect;
- (void)dealloc;
- (void)deregisterEvent:(id)a3;
- (void)disconnect;
- (void)disconnectWithError:(id)a3;
- (void)enableFindingSession:(BOOL)a3;
- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4;
- (void)getCurrentRTISourceSession:(id)a3;
- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)playItem:(id)a3 completion:(id)a4;
- (void)reconnect;
- (void)reestablishConnectionWithCompletionHandler:(id)a3;
- (void)registerEvent:(id)a3 options:(id)a4 handler:(id)a5;
- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4;
- (void)rpSiriSessionDidReceiveStopRecording;
- (void)sendButtonEvent:(id)a3;
- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5;
- (void)sendEvent:(id)a3 options:(id)a4 shouldRetry:(BOOL)a5 response:(id)a6;
- (void)sendTouchEvent:(id)a3;
- (void)setActivated:(BOOL)a3;
- (void)setAttentionState:(int64_t)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setCompanionClient:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFeatureFlags:(unint64_t)a3;
- (void)setGuideButtonSupported:(BOOL)a3;
- (void)setHidSession:(id)a3;
- (void)setHidSessionActivated:(BOOL)a3;
- (void)setHidTouchSession:(id)a3;
- (void)setHidTouchSessionActivated:(BOOL)a3;
- (void)setInvalidationCompletionBlock:(id)a3;
- (void)setIsInvalidating:(BOOL)a3;
- (void)setMediaManager:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setPttFeatureSupported:(BOOL)a3;
- (void)setRTISessionHandler:(id)a3;
- (void)setReceivedSiriSettings:(BOOL)a3;
- (void)setReceivedVolumeSettings:(BOOL)a3;
- (void)setRemoteFindingManager:(id)a3;
- (void)setRtiSessionHandler:(id)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)setSiriRemoteFindingSessionState:(int64_t)a3;
- (void)setSiriSession:(id)a3;
- (void)setStartedSetup:(BOOL)a3;
- (void)setTextInputSession:(id)a3;
- (void)setTextInputSessionActivated:(BOOL)a3;
- (void)toggleCaptions:(BOOL)a3;
- (void)updateWithDevice:(id)a3;
@end

@implementation TVRCRPCompanionLinkClientWrapper

+ (TVRCRPCompanionLinkClientWrapper)wrapperWithDevice:(id)a3
{
  id v3 = a3;
  v4 = [[TVRCRPCompanionLinkClientWrapper alloc] initWithDevice:v3];

  return v4;
}

- (TVRCRPCompanionLinkClientWrapper)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRCRPCompanionLinkClientWrapper;
  v6 = [(TVRCRPCompanionLinkClientWrapper *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v7->_connected = 0;
    [(TVRCRPCompanionLinkClientWrapper *)v7 _resolveFeatureFlags];
  }

  return v7;
}

- (NSString)name
{
  v2 = [(RPCompanionLinkDevice *)self->_device name];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)identifier
{
  v2 = [(RPCompanionLinkDevice *)self->_device effectiveIdentifier];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)idsIdentifier
{
  v2 = [(RPCompanionLinkDevice *)self->_device idsDeviceIdentifier];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSDictionary)alternateIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [(RPCompanionLinkDevice *)self->_device mediaRemoteIdentifier];
  id v5 = [(RPCompanionLinkDevice *)self->_device mediaRouteIdentifier];
  v6 = [(RPCompanionLinkDevice *)self->_device name];
  if (v4) {
    [v3 setObject:v4 forKey:@"MediaRemoteID"];
  }
  if (v5) {
    [v3 setObject:v5 forKey:@"AirplayID"];
  }
  if (v6) {
    [v3 setObject:v6 forKey:@"DeviceName"];
  }
  v7 = [NSDictionary dictionaryWithDictionary:v3];

  return (NSDictionary *)v7;
}

- (NSString)model
{
  v2 = [(RPCompanionLinkDevice *)self->_device model];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)isPaired
{
  return ([(RPCompanionLinkDevice *)self->_device flags] & 1) == 0 || self->_authenticated;
}

- (int64_t)connectionType
{
  return 1;
}

- (int64_t)linkType
{
  if (([(RPCompanionLinkDevice *)self->_device statusFlags] & 4) != 0) {
    return 3;
  }
  if (([(RPCompanionLinkDevice *)self->_device statusFlags] & 0x200) != 0) {
    return 2;
  }
  return ((unint64_t)[(RPCompanionLinkDevice *)self->_device statusFlags] >> 1) & 1;
}

- (void)updateWithDevice:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = _TVRCRapportLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    *(void *)v19 = "-[TVRCRPCompanionLinkClientWrapper updateWithDevice:]";
    *(_WORD *)&v19[8] = 2114;
    id v20 = v5;
    __int16 v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "%s - device: %{public}@, %@", (uint8_t *)&v18, 0x20u);
  }

  p_device = &self->_device;
  BOOL v8 = [(RPCompanionLinkDevice *)self->_device isEqualToRPDevice:v5];
  objc_super v9 = _TVRCRapportLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Devices ids are the same. Skip reconnecting.", (uint8_t *)&v18, 2u);
    }

    int v11 = [(RPCompanionLinkDevice *)*p_device deviceCapabilityFlags];
    if (v11 == [v5 deviceCapabilityFlags])
    {
      objc_storeStrong((id *)&self->_device, a3);
    }
    else
    {
      v13 = _TVRCRapportLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = [(RPCompanionLinkDevice *)*p_device deviceCapabilityFlags];
        int v15 = [v5 deviceCapabilityFlags];
        int v18 = 67109376;
        *(_DWORD *)v19 = v14;
        *(_WORD *)&v19[4] = 1024;
        *(_DWORD *)&v19[6] = v15;
        _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Device capabilities changed: old: %d, new: %d", (uint8_t *)&v18, 0xEu);
      }

      objc_storeStrong((id *)&self->_device, a3);
      BOOL v16 = [(TVRCRPCompanionLinkClientWrapper *)self _findMyRemoteSupportedForDevice:v5];
      v17 = [(TVRCRPCompanionLinkClientWrapper *)self delegate];
      [v17 deviceSupportsFindMyRemote:v16];
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Devices are not the same", (uint8_t *)&v18, 2u);
    }

    objc_storeStrong((id *)&self->_device, a3);
    if ([(TVRCRPCompanionLinkClientWrapper *)self connected])
    {
      v12 = _TVRCRapportLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect to new device.", (uint8_t *)&v18, 2u);
      }

      [(TVRCRPCompanionLinkClientWrapper *)self reconnect];
    }
  }
}

- (void)reconnect
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[TVRCRPCompanionLinkClientWrapper reconnect]";
    __int16 v7 = 2112;
    BOOL v8 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__TVRCRPCompanionLinkClientWrapper_reconnect__block_invoke;
  v4[3] = &unk_2647AEA98;
  v4[4] = self;
  [(TVRCRPCompanionLinkClientWrapper *)self _invalidateAndResetWithCompletionHandler:v4];
}

uint64_t __45__TVRCRPCompanionLinkClientWrapper_reconnect__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connect];
}

- (void)reestablishConnectionWithCompletionHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[TVRCRPCompanionLinkClientWrapper reestablishConnectionWithCompletionHandler:]";
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(TVRCRPCompanionLinkClientWrapper *)self newCompanionLinkClient];
  objc_initWeak((id *)buf, v6);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__TVRCRPCompanionLinkClientWrapper_reestablishConnectionWithCompletionHandler___block_invoke;
  v8[3] = &unk_2647AFF08;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, (id *)buf);
  [v6 activateWithCompletion:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak((id *)buf);
}

void __79__TVRCRPCompanionLinkClientWrapper_reestablishConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _TVRCRapportLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__TVRCRPCompanionLinkClientWrapper_reestablishConnectionWithCompletionHandler___block_invoke_cold_1(v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Reestablished connection with success", v8, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

- (void)connect
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    device = self->_device;
    *(_DWORD *)buf = 136315650;
    v31 = (TVRCRPCompanionLinkClientWrapper *)"-[TVRCRPCompanionLinkClientWrapper connect]";
    __int16 v32 = 2112;
    v33 = self;
    __int16 v34 = 2114;
    v35 = device;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@ %{public}@", buf, 0x20u);
  }

  objc_initWeak(&location, self);
  if ([(TVRCRPCompanionLinkClientWrapper *)self activated])
  {
    id v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "CompanionClient is already activated %@", buf, 0xCu);
    }

    [(TVRCRPCompanionLinkClientWrapper *)self _updateConnectedState];
  }
  else
  {
    if (!self->_companionClient)
    {
      uint64_t v6 = [(TVRCRPCompanionLinkClientWrapper *)self newCompanionLinkClient];
      companionClient = self->_companionClient;
      self->_companionClient = v6;

      BOOL v8 = self->_companionClient;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke;
      v27[3] = &unk_2647AEB88;
      objc_copyWeak(&v28, &location);
      [(RPCompanionLinkClient *)v8 setInvalidationHandler:v27];
      id v9 = self->_companionClient;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_4;
      v25[3] = &unk_2647AEB88;
      objc_copyWeak(&v26, &location);
      [(RPCompanionLinkClient *)v9 setInterruptionHandler:v25];
      char v10 = [(RPCompanionLinkDevice *)self->_device flags];
      self->_authenticated = (v10 & 1) == 0;
      if (v10)
      {
        int v11 = _TVRCRapportLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Device is not authenticated. Setting up prompt for password handlers.", buf, 2u);
        }

        [(RPCompanionLinkClient *)self->_companionClient setFlags:1];
        [(RPCompanionLinkClient *)self->_companionClient setPasswordType:1];
        v12 = self->_companionClient;
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_5;
        v23[3] = &unk_2647AFF58;
        objc_copyWeak(&v24, &location);
        [(RPCompanionLinkClient *)v12 setPromptForPasswordHandler:v23];
        uint64_t v13 = self->_companionClient;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_10;
        v21[3] = &unk_2647AFA68;
        objc_copyWeak(&v22, &location);
        [(RPCompanionLinkClient *)v13 setAuthCompletionHandler:v21];
        objc_destroyWeak(&v22);
        objc_destroyWeak(&v24);
      }
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
    }
    int v14 = _TVRCRapportLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "Activate companion client %@", buf, 0xCu);
    }

    int v15 = self->_companionClient;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    int v18 = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_11;
    v19 = &unk_2647AFA68;
    objc_copyWeak(&v20, &location);
    [(RPCompanionLinkClient *)v15 activateWithCompletion:&v16];
    -[RPCompanionLinkClient setEventIDRegistrationCompletion:](self->_companionClient, "setEventIDRegistrationCompletion:", &__block_literal_global_17, v16, v17, v18, v19);
    [(TVRCRPCompanionLinkClientWrapper *)self _updateConnectedState];
    objc_destroyWeak(&v20);
  }
  objc_destroyWeak(&location);
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _TVRCRapportLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "companionLinkClient invalidationHandler", buf, 2u);
    }

    if (WeakRetained[8])
    {
      id v3 = TVRCMakeError(400, 0);
      [WeakRetained _disconnectWithError:v3];
    }
    WeakRetained[18] = 0;
    id v4 = [WeakRetained invalidationCompletionBlock];

    if (v4)
    {
      id v5 = _TVRCRapportLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Executing queued connection request", v7, 2u);
      }

      uint64_t v6 = [WeakRetained invalidationCompletionBlock];
      v6[2]();

      [WeakRetained setInvalidationCompletionBlock:0];
    }
  }
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _TVRCRapportLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "companionLinkClient interruptionHandler", v3, 2u);
    }
  }
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_5(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *((void *)WeakRetained + 3);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "PromptForPasswordHandler called on companionLinkClient for device %{public}@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_7;
    v10[3] = &unk_2647AFF30;
    v10[4] = WeakRetained;
    id v7 = +[TVRXDeviceAuthenticationChallenge _challengeWithCodeToEnterLocally:v10];
    [v7 setThrottleSeconds:a3];
    if ([*((id *)WeakRetained + 9) passwordTypeActual] == 7)
    {
      BOOL v8 = _TVRCRapportLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "companionLinkClient reports password type is text", buf, 2u);
      }

      [v7 setChallengeAttributes:2];
    }
    id v9 = objc_loadWeakRetained((id *)WeakRetained + 7);
    [v9 deviceEncounteredAuthenticationChallenge:v7];
  }
}

uint64_t __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_7(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    id v4 = _TVRCRapportLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_7_cold_1();
    }

    return [*(id *)(a1 + 32) disconnect];
  }
  else
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 72);
    return [v6 tryPassword:a2];
  }
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = WeakRetained[3];
      int v9 = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "AuthCompletionHandler called on companionLinkClient for device %{public}@. Error - %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (v3)
    {
      id v7 = _TVRCRapportLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_10_cold_1();
      }

      if ([v3 code] == -6776)
      {
        BOOL v8 = TVRCMakeError(104, 0);
        [WeakRetained _disconnectWithError:v8];
      }
      else
      {
        [WeakRetained _disconnectWithError:v3];
      }
    }
    else
    {
      *((unsigned char *)WeakRetained + 10) = 1;
      [WeakRetained _updateConnectedState];
    }
  }
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = _TVRCRapportLog();
    uint64_t v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_11_cold_1();
      }

      [WeakRetained _disconnectWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138412290;
        BOOL v8 = WeakRetained;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "companionLinkClient activateWithCompletion %@", (uint8_t *)&v7, 0xCu);
      }

      WeakRetained[9] = 1;
      [WeakRetained _updateConnectedState];
    }
  }
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Successfully registered %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)disconnect
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(TVRCRPCompanionLinkClientWrapper *)self device];
    int v5 = 136315650;
    uint64_t v6 = "-[TVRCRPCompanionLinkClientWrapper disconnect]";
    __int16 v7 = 2114;
    BOOL v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s - Disconnecting %{public}@ %@", (uint8_t *)&v5, 0x20u);
  }
  [(TVRCRPCompanionLinkClientWrapper *)self _disconnectWithError:0];
}

- (void)disconnectWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    __int16 v7 = "-[TVRCRPCompanionLinkClientWrapper disconnectWithError:]";
    __int16 v8 = 2112;
    id v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s error:%@ %@", (uint8_t *)&v6, 0x20u);
  }

  [(TVRCRPCompanionLinkClientWrapper *)self _disconnectWithError:v4];
}

- (id)supportedButtons
{
  v33[12] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if ([(TVRCRPCompanionLinkClientWrapper *)self featureFlags])
  {
    id v29 = [[TVRCButton alloc] _initWithButtonType:12];
    v33[0] = v29;
    id v28 = [[TVRCButton alloc] _initWithButtonType:13];
    v33[1] = v28;
    id v27 = [[TVRCButton alloc] _initWithButtonType:14];
    v33[2] = v27;
    id v26 = [[TVRCButton alloc] _initWithButtonType:15];
    v33[3] = v26;
    id v25 = [[TVRCButton alloc] _initWithButtonType:5];
    v33[4] = v25;
    id v24 = [[TVRCButton alloc] _initWithButtonType:3];
    v33[5] = v24;
    id v23 = [[TVRCButton alloc] _initWithButtonType:2];
    v33[6] = v23;
    id v4 = [[TVRCButton alloc] _initWithButtonType:1];
    v33[7] = v4;
    id v5 = [[TVRCButton alloc] _initWithButtonType:21];
    v33[8] = v5;
    id v6 = [[TVRCButton alloc] _initWithButtonType:22];
    v33[9] = v6;
    id v7 = [[TVRCButton alloc] _initWithButtonType:19];
    v33[10] = v7;
    id v8 = [[TVRCButton alloc] _initWithButtonType:20 hasTapAction:1 properties:0];
    v33[11] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:12];
    [v3 addObjectsFromArray:v9];
  }
  if ([(TVRCRPCompanionLinkClientWrapper *)self isSiriEnabled])
  {
    id v10 = [[TVRCButton alloc] _initWithButtonType:4];
    id v32 = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
    [v3 addObjectsFromArray:v11];
  }
  if (([(TVRCRPCompanionLinkClientWrapper *)self featureFlags] & 2) != 0)
  {
    id v12 = [[TVRCButton alloc] _initWithButtonType:5];
    v31[0] = v12;
    id v13 = [[TVRCButton alloc] _initWithButtonType:16 hasTapAction:1 properties:0];
    v31[1] = v13;
    int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
    [v3 addObjectsFromArray:v14];

    int v15 = [(TVRCRapportMediaEventsManager *)self->_mediaManager supportedMediaCommands];
    if (v15) {
      [v3 unionSet:v15];
    }
  }
  if (([(TVRCRPCompanionLinkClientWrapper *)self featureFlags] & 8) != 0)
  {
    id v16 = [[TVRCButton alloc] _initWithButtonType:30];
    v30[0] = v16;
    id v17 = [[TVRCButton alloc] _initWithButtonType:26];
    v30[1] = v17;
    id v18 = [[TVRCButton alloc] _initWithButtonType:27];
    v30[2] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
    [v3 addObjectsFromArray:v19];
  }
  if ([(TVRCRPCompanionLinkClientWrapper *)self isGuideButtonSupported])
  {
    id v20 = [[TVRCButton alloc] _initWithButtonType:28];
    [v3 addObject:v20];
  }
  __int16 v21 = [MEMORY[0x263EFFA08] setWithSet:v3];

  return v21;
}

- (BOOL)_findMyRemoteSupportedForDevice:(id)a3
{
  return [(RPCompanionLinkDevice *)self->_device deviceCapabilityFlags] & 1;
}

- (BOOL)supportsDirectCaptionQueries
{
  return ([(TVRCRPCompanionLinkClientWrapper *)self featureFlags] >> 5) & 1;
}

- (BOOL)supportsFindMyRemote
{
  return [(TVRCRPCompanionLinkClientWrapper *)self _findMyRemoteSupportedForDevice:self->_device];
}

- (BOOL)supportsTouchEvents
{
  return ((unint64_t)[(RPCompanionLinkDevice *)self->_device statusFlags] >> 18) & 1;
}

- (void)sendButtonEvent:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v28 = "-[TVRCRPCompanionLinkClientWrapper sendButtonEvent:]";
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 2112;
    id v32 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s event:%@ %@", buf, 0x20u);
  }

  if ([(TVRCRPCompanionLinkClientWrapper *)self connected])
  {
    if (+[TVRCButton _isMediaButtonEvent:v4])
    {
      [(TVRCRapportMediaEventsManager *)self->_mediaManager sendMediaEvent:v4];
      id v6 = [v4 button];
      uint64_t v7 = [v6 buttonType];

      if ((unint64_t)(v7 - 17) <= 1) {
        [(TVRCRPCompanionLinkClientWrapper *)self toggleCaptions:v7 == 17];
      }
      goto LABEL_24;
    }
    id v9 = [v4 button];
    if ([v9 buttonType] == 20)
    {
      BOOL v10 = [v4 eventType] == 0;

      if (v10)
      {
        uint64_t v11 = [v4 button];
        id v12 = [v11 properties];

        id v13 = [v12 objectForKey:@"TVRCButtonApplicationBundleIDKey"];
        [(TVRCRPCompanionLinkClientWrapper *)self _launchApplicationOrURL:v13];

        goto LABEL_24;
      }
    }
    else
    {
    }
    int v14 = [v4 button];
    if ([v14 buttonType] == 2)
    {
    }
    else
    {
      int v15 = [v4 button];
      BOOL v16 = [v15 buttonType] == 23;

      if (!v16)
      {
LABEL_21:
        uint64_t v19 = [(TVRCRPCompanionLinkClientWrapper *)self _commandForButtonEvent:v4];
        uint64_t v20 = [(TVRCRPCompanionLinkClientWrapper *)self _stateForButtonEvent:v4];
        __int16 v21 = _TVRCRapportLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          -[TVRCRPCompanionLinkClientWrapper sendButtonEvent:]();
        }

        objc_initWeak((id *)buf, self);
        hidSession = self->_hidSession;
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __52__TVRCRPCompanionLinkClientWrapper_sendButtonEvent___block_invoke;
        v24[3] = &unk_2647AFFA0;
        objc_copyWeak(&v26, (id *)buf);
        uint64_t v23 = *MEMORY[0x263F62C08];
        v24[4] = self;
        id v25 = v4;
        [(RPHIDSession *)hidSession hidCommand:v19 buttonState:v20 destinationID:v23 completion:v24];

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
        goto LABEL_24;
      }
    }
    if (self->_siriSession)
    {
      id v17 = _TVRCRapportLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[TVRCRPCompanionLinkClientWrapper sendButtonEvent:]();
      }

      [(RPSiriSession *)self->_siriSession invalidate];
      siriSession = self->_siriSession;
      self->_siriSession = 0;
    }
    goto LABEL_21;
  }
  id v8 = _TVRCRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[TVRCRPCompanionLinkClientWrapper sendButtonEvent:]();
  }

LABEL_24:
}

void __52__TVRCRPCompanionLinkClientWrapper_sendButtonEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      id v6 = _TVRCRapportLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __52__TVRCRPCompanionLinkClientWrapper_sendButtonEvent___block_invoke_cold_1();
      }

      uint64_t v7 = _TVRCRapportLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect after an issue sending a HID event", v8, 2u);
      }

      [*(id *)(a1 + 32) reconnect];
    }
    else
    {
      [WeakRetained _handleSideEffectsForEvent:*(void *)(a1 + 40)];
    }
  }
}

- (void)sendTouchEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v12 = "-[TVRCRPCompanionLinkClientWrapper sendTouchEvent:]";
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    BOOL v16 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s event:%@ %@", buf, 0x20u);
  }

  if (![(TVRCRPCompanionLinkClientWrapper *)self connected])
  {
    id v6 = _TVRCRapportLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[TVRCRPCompanionLinkClientWrapper sendTouchEvent:]();
    }
    goto LABEL_15;
  }
  if (self->_hidTouchSession)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F62BA0]);
    -[NSObject setFinger:](v6, "setFinger:", [v4 finger]);
    [v4 digitizerLocation];
    -[NSObject setLocation:](v6, "setLocation:");
    switch([v4 phase])
    {
      case 1:
        uint64_t v7 = 1;
        break;
      case 2:
        [v6 setPhase:2];
        goto LABEL_11;
      case 3:
LABEL_11:
        uint64_t v7 = 3;
        break;
      case 4:
        uint64_t v7 = 4;
        break;
      case 5:
        uint64_t v7 = 5;
        break;
      default:
        uint64_t v7 = 0;
        break;
    }
    [v6 setPhase:v7];
    [v4 timestamp];
    -[NSObject setTimestampSeconds:](v6, "setTimestampSeconds:");
    objc_initWeak((id *)buf, self);
    hidTouchSession = self->_hidTouchSession;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__TVRCRPCompanionLinkClientWrapper_sendTouchEvent___block_invoke;
    v9[3] = &unk_2647AFFC8;
    objc_copyWeak(&v10, (id *)buf);
    v9[4] = self;
    [(RPHIDTouchSession *)hidTouchSession sendTouchEvent:v6 completion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
LABEL_15:
  }
}

void __51__TVRCRPCompanionLinkClientWrapper_sendTouchEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    id v6 = _TVRCRapportLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__TVRCRPCompanionLinkClientWrapper_sendTouchEvent___block_invoke_cold_1();
    }

    uint64_t v7 = _TVRCRapportLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reconnect after an issue sending a touch event", v8, 2u);
    }

    [*(id *)(a1 + 32) reconnect];
  }
}

- (void)getCurrentRTISourceSession:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[TVRCRPCompanionLinkClientWrapper getCurrentRTISourceSession:]";
    __int16 v12 = 2112;
    __int16 v13 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__TVRCRPCompanionLinkClientWrapper_getCurrentRTISourceSession___block_invoke;
  v7[3] = &unk_2647AFC68;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __63__TVRCRPCompanionLinkClientWrapper_getCurrentRTISourceSession___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v5 = WeakRetained;
      id v4 = [WeakRetained[13] rtiSession];
      (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);

      id WeakRetained = v5;
    }
  }
}

- (void)setRTISessionHandler:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[TVRCRPCompanionLinkClientWrapper setRTISessionHandler:]";
    __int16 v12 = 2112;
    __int16 v13 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  [(TVRCRPCompanionLinkClientWrapper *)self setRtiSessionHandler:v4];
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__TVRCRPCompanionLinkClientWrapper_setRTISessionHandler___block_invoke;
  v7[3] = &unk_2647AFC68;
  objc_copyWeak(&v9, (id *)buf);
  id v6 = v4;
  id v8 = v6;
  [(RPTextInputSession *)self->_textInputSession setRtiUpdatedHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __57__TVRCRPCompanionLinkClientWrapper_setRTISessionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v5 = WeakRetained;
      id v4 = [WeakRetained[13] rtiSession];
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

      id WeakRetained = v5;
    }
  }
}

- (void)sendEvent:(id)a3 options:(id)a4 response:(id)a5
{
}

- (void)sendEvent:(id)a3 options:(id)a4 shouldRetry:(BOOL)a5 response:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = _TVRCRapportLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v10;
    __int16 v29 = 2112;
    id v30 = self;
    _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@ %@", buf, 0x16u);
  }

  uint64_t v14 = (void *)MEMORY[0x263EFFA78];
  if (v11) {
    uint64_t v14 = v11;
  }
  id v15 = v14;
  objc_initWeak((id *)buf, self);
  companionClient = self->_companionClient;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke;
  v21[3] = &unk_2647B0018;
  id v17 = v10;
  id v22 = v17;
  BOOL v26 = a5;
  objc_copyWeak(&v25, (id *)buf);
  uint64_t v18 = *MEMORY[0x263F62C08];
  id v19 = v12;
  id v24 = v19;
  id v20 = v11;
  id v23 = v20;
  [(RPCompanionLinkClient *)companionClient sendRequestID:v17 request:v15 destinationID:v18 options:0 responseHandler:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = _TVRCRapportLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v11;
    __int16 v24 = 2114;
    id v25 = v7;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", buf, 0x20u);
  }

  if (v9 && *(unsigned char *)(a1 + 64))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      __int16 v13 = _TVRCRapportLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Reestablishing connection after error", buf, 2u);
      }

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke_19;
      v15[3] = &unk_2647AFFF0;
      id v16 = *(id *)(a1 + 32);
      id v20 = *(id *)(a1 + 48);
      id v17 = v7;
      id v18 = v8;
      objc_copyWeak(&v21, (id *)(a1 + 56));
      id v19 = *(id *)(a1 + 40);
      [WeakRetained reestablishConnectionWithCompletionHandler:v15];

      objc_destroyWeak(&v21);
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(uint64_t, id, id, id))(v14 + 16))(v14, v7, v8, v9);
    }
  }
}

void __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TVRCRapportLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke_19_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 64);
    if (v5) {
      (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, *(void *)(a1 + 40), *(void *)(a1 + 48), v3);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained sendEvent:*(void *)(a1 + 32) options:*(void *)(a1 + 56) shouldRetry:0 response:*(void *)(a1 + 64)];
  }
}

- (void)registerEvent:(id)a3 options:(id)a4 handler:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(TVRCRPCompanionLinkClientWrapper *)self activated];
  id v12 = _TVRCRapportLog();
  __int16 v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543618;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = self;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Registering event with ID %{public}@ %@", (uint8_t *)&v14, 0x16u);
    }

    __int16 v13 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
    [v13 registerEventID:v8 options:v9 handler:v10];
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    -[TVRCRPCompanionLinkClientWrapper registerEvent:options:handler:]();
  }
}

- (void)deregisterEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "De-registering event %{public}@ %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  [v6 deregisterEventID:v4];
}

- (void)toggleCaptions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(TVRCRPCompanionLinkClientWrapper *)self supportsDirectCaptionQueries])
  {
    uint64_t v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v13 = "-[TVRCRPCompanionLinkClientWrapper toggleCaptions:]";
      __int16 v14 = 1026;
      BOOL v15 = v3;
      __int16 v16 = 2112;
      id v17 = self;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s: %{public,BOOL}d %@", buf, 0x1Cu);
    }

    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    id v10 = @"CaptionsEnabled";
    uint64_t v11 = v6;
    int v7 = NSDictionary;
    id v8 = v6;
    __int16 v9 = [v7 dictionaryWithObjects:&v11 forKeys:&v10 count:1];

    [(TVRCRPCompanionLinkClientWrapper *)self sendEvent:@"ToggleCaptions", v9, 0, 0, v10, v11 options shouldRetry response];
  }
}

- (void)fetchUpNextInfoWithPaginationToken:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = @"FetchUpNextInfoEvent";
  __int16 v9 = _TVRCRapportLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v8;
    __int16 v23 = 2112;
    __int16 v24 = self;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@ %@", buf, 0x16u);
  }

  companionClient = self->_companionClient;
  id v19 = @"PaginationTokenKey";
  uint64_t v11 = v6;
  if (!v6)
  {
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
  }
  id v20 = v11;
  id v12 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  uint64_t v13 = *MEMORY[0x263F62C08];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__TVRCRPCompanionLinkClientWrapper_fetchUpNextInfoWithPaginationToken_completion___block_invoke;
  v16[3] = &unk_2647B0040;
  __int16 v14 = v8;
  id v17 = v14;
  id v18 = v7;
  id v15 = v7;
  [(RPCompanionLinkClient *)companionClient sendRequestID:v14 request:v12 destinationID:v13 options:0 responseHandler:v16];

  if (!v6) {
}
  }

void __82__TVRCRPCompanionLinkClientWrapper_fetchUpNextInfoWithPaginationToken_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = _TVRCRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v11 = 138543874;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v11, 0x20u);
  }

  id v10 = [v6 objectForKeyedSubscript:@"PaginationTokenKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    id v10 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)markAsWatchedWithMediaIdentifier:(id)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = @"MarkAsWatchedEvent";
  if ([v6 length])
  {
    id v21 = @"IdentifierKey";
    v22[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v10 = _TVRCRapportLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = self;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@ %@", buf, 0x16u);
    }

    companionClient = self->_companionClient;
    uint64_t v12 = *MEMORY[0x263F62C08];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __80__TVRCRPCompanionLinkClientWrapper_markAsWatchedWithMediaIdentifier_completion___block_invoke;
    v14[3] = &unk_2647B0040;
    __int16 v15 = v8;
    id v16 = v7;
    [(RPCompanionLinkClient *)companionClient sendRequestID:v15 request:v9 destinationID:v12 options:0 responseHandler:v14];
  }
  else
  {
    __int16 v13 = _TVRCRapportLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Invalid mediaIdentifier sent to %@", buf, 0xCu);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __80__TVRCRPCompanionLinkClientWrapper_markAsWatchedWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = _TVRCRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543874;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = @"AddToUpNextEvent";
  if ([v6 length])
  {
    id v21 = @"IdentifierKey";
    v22[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    int v10 = _TVRCRapportLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = self;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@ %@", buf, 0x16u);
    }

    companionClient = self->_companionClient;
    uint64_t v12 = *MEMORY[0x263F62C08];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__TVRCRPCompanionLinkClientWrapper_addItemWithMediaIdentifier_completion___block_invoke;
    v14[3] = &unk_2647B0040;
    id v15 = v8;
    id v16 = v7;
    [(RPCompanionLinkClient *)companionClient sendRequestID:v15 request:v9 destinationID:v12 options:0 responseHandler:v14];
  }
  else
  {
    id v13 = _TVRCRapportLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Invalid mediaIdentifier sent to %@", buf, 0xCu);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __74__TVRCRPCompanionLinkClientWrapper_addItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = _TVRCRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543874;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)removeItemWithMediaIdentifier:(id)a3 completion:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = @"RemoveFromUpNextEvent";
  if ([v6 length])
  {
    id v21 = @"IdentifierKey";
    v22[0] = v6;
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    int v10 = _TVRCRapportLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = self;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@ %@", buf, 0x16u);
    }

    companionClient = self->_companionClient;
    uint64_t v12 = *MEMORY[0x263F62C08];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77__TVRCRPCompanionLinkClientWrapper_removeItemWithMediaIdentifier_completion___block_invoke;
    v14[3] = &unk_2647B0040;
    id v15 = v8;
    id v16 = v7;
    [(RPCompanionLinkClient *)companionClient sendRequestID:v15 request:v9 destinationID:v12 options:0 responseHandler:v14];
  }
  else
  {
    id v13 = _TVRCRapportLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Invalid mediaIdentifier sent to %@", buf, 0xCu);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __77__TVRCRPCompanionLinkClientWrapper_removeItemWithMediaIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = _TVRCRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543874;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)playItem:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = @"PlayMediaEvent";
  if ([v6 isValid])
  {
    uint64_t v9 = [v6 dictionaryRepresentation];
    int v10 = _TVRCRapportLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = self;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Sending companion request with ID %@ %@", buf, 0x16u);
    }

    companionClient = self->_companionClient;
    uint64_t v12 = *MEMORY[0x263F62C08];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __56__TVRCRPCompanionLinkClientWrapper_playItem_completion___block_invoke;
    v14[3] = &unk_2647B0040;
    id v15 = v8;
    id v16 = v7;
    [(RPCompanionLinkClient *)companionClient sendRequestID:v15 request:v9 destinationID:v12 options:0 responseHandler:v14];
  }
  else
  {
    id v13 = _TVRCRapportLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Invalid item sent to %@", buf, 0xCu);
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __56__TVRCRPCompanionLinkClientWrapper_playItem_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  id v8 = _TVRCRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543874;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Received request response with ID %{public}@, response %{public}@, error %{public}@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)description
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(TVRCRPCompanionLinkClientWrapper *)self name];
  [v3 appendString:v4 withName:@"name"];

  uint64_t v5 = [(TVRCRPCompanionLinkClientWrapper *)self identifier];
  [v3 appendString:v5 withName:@"Identifier"];

  id v6 = [(TVRCRPCompanionLinkClientWrapper *)self model];
  [v3 appendString:v6 withName:@"model"];

  id v7 = [(TVRCRPCompanionLinkClientWrapper *)self sourceVersion];
  [v3 appendString:v7 withName:@"sourceVersion"];

  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper isSiriEnabled](self, "isSiriEnabled"), @"siriEnabled");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper activated](self, "activated"), @"activated");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper authenticated](self, "authenticated"), @"authenticated");
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper pttFeatureSupported](self, "pttFeatureSupported"), @"siriPTTEnabled");
  __int16 v12 = [(TVRCRPCompanionLinkClientWrapper *)self _stringForFeatureFlags:self->_featureFlags];
  [v3 appendString:v12 withName:@"featureFlags"];

  id v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper connected](self, "connected"), @"connected");
  id v14 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper isPaired](self, "isPaired"), @"isPaired");
  id v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRCRPCompanionLinkClientWrapper supportsFindMyRemote](self, "supportsFindMyRemote"), @"supportsFindMyRemote");
  uint64_t v16 = [(TVRCRPCompanionLinkClientWrapper *)self alternateIdentifiers];
  [v3 appendDictionarySection:v16 withName:@"alternateIdentifiers" skipIfEmpty:0];

  uint64_t v17 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  id v18 = (id)[v3 appendObject:v17 withName:@"companionClient"];

  __int16 v19 = [v3 build];

  return (NSString *)v19;
}

- (BOOL)_featureSupported:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TVRCRPCompanionLinkClientWrapper *)self sourceVersion];
  unint64_t v6 = [v5 compare:v4 options:64];
  id v7 = _TVRCRapportLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(TVRCRPCompanionLinkClientWrapper *)self name];
    int v10 = 138413058;
    id v11 = v4;
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 1024;
    BOOL v17 = v6 < 2;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Checking if '%@' is supported on '%@' for sourceVersion '%@': %{BOOL}d", (uint8_t *)&v10, 0x26u);
  }
  return v6 < 2;
}

- (NSString)sourceVersion
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  BOOL v3 = [(TVRCRPCompanionLinkClientWrapper *)self device];
  id v4 = [v3 sourceVersion];

  uint64_t v5 = NSString;
  unint64_t v6 = [(TVRCRPCompanionLinkClientWrapper *)self device];
  id v7 = [v6 name];
  id v8 = [v5 stringWithFormat:@"%@-SourceVersion", v7];

  uint64_t v9 = [(__CFString *)v4 length];
  int v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v11 = [v10 objectForKey:v8];
  if (v9)
  {

    if ([(__CFString *)v11 length])
    {
      __int16 v12 = _TVRCRapportLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v24 = v11;
        __int16 v25 = 2112;
        __int16 v26 = v8;
        id v13 = "Currently cached sourceVersion '%@' for '%@'";
LABEL_11:
        _os_log_impl(&dword_2266D3000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
      }
    }
    else
    {

      __int16 v12 = _TVRCRapportLog();
      id v11 = @"0.0";
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v24 = @"0.0";
        __int16 v25 = 2112;
        __int16 v26 = v8;
        id v13 = "Setting default cached sourceVersion '%@' for '%@'";
        goto LABEL_11;
      }
    }

    unint64_t v18 = [(__CFString *)v11 compare:v4 options:64];
    __int16 v19 = _TVRCRapportLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18 > 1)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412802;
        __int16 v24 = v4;
        __int16 v25 = 2112;
        __int16 v26 = v8;
        __int16 v27 = 2112;
        uint64_t v28 = v11;
        _os_log_impl(&dword_2266D3000, v19, OS_LOG_TYPE_DEFAULT, "sourceVersion '%@' for '%@' is greater than cached version '%@' so caching and returning it", buf, 0x20u);
      }

      __int16 v19 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v19 setObject:v4 forKey:v8];
      uint64_t v21 = v4;
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412802;
        __int16 v24 = v11;
        __int16 v25 = 2112;
        __int16 v26 = v8;
        __int16 v27 = 2112;
        uint64_t v28 = v4;
        _os_log_impl(&dword_2266D3000, v19, OS_LOG_TYPE_DEFAULT, "Cached version '%@' for '%@' is >= reported version '%@' so returning it", buf, 0x20u);
      }
      uint64_t v21 = v11;
    }

    BOOL v17 = v21;
    goto LABEL_20;
  }

  uint64_t v14 = [(__CFString *)v11 length];
  id v15 = _TVRCRapportLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412546;
      __int16 v24 = v11;
      __int16 v25 = 2112;
      __int16 v26 = v8;
      _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Found cached sourceVersion '%@' for '%@'", buf, 0x16u);
    }

    id v4 = v11;
    BOOL v17 = v4;
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Unknown sourceVersion, allowing all features", buf, 2u);
    }

    BOOL v17 = @"9999.9";
    id v4 = v11;
  }
LABEL_20:

  return (NSString *)v17;
}

- (void)_resolveFeatureFlags
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    __int16 v12 = "-[TVRCRPCompanionLinkClientWrapper _resolveFeatureFlags]";
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  unsigned int v4 = [(RPCompanionLinkDevice *)self->_device flags];
  unsigned int v5 = ([(RPCompanionLinkDevice *)self->_device flags] >> 7) & 2 | (v4 >> 10) & 1;
  unint64_t v6 = v5 | ([(RPCompanionLinkDevice *)self->_device flags] >> 10) & 4;
  if ([(TVRCRPCompanionLinkClientWrapper *)self _featureSupported:@"250.3"]) {
    v6 |= 8uLL;
  }
  if ([(TVRCRPCompanionLinkClientWrapper *)self _featureSupported:@"340.15"]) {
    v6 |= 0x10uLL;
  }
  if ([(TVRCRPCompanionLinkClientWrapper *)self _featureSupported:@"600.20"]) {
    v6 |= 0x20uLL;
  }
  id v7 = _TVRCRapportLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(TVRCRPCompanionLinkClientWrapper *)self _stringForFeatureFlags:v6];
    int v11 = 138543362;
    __int16 v12 = v8;
    _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Resolved Feature Flags: %{public}@", (uint8_t *)&v11, 0xCu);
  }
  self->_BOOL pttFeatureSupported = 0;
  uint64_t v9 = _TVRCRapportLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL pttFeatureSupported = self->_pttFeatureSupported;
    int v11 = 67109120;
    LODWORD(v12) = pttFeatureSupported;
    _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "PTT feature supported: %d", (uint8_t *)&v11, 8u);
  }

  self->_featureFlags = v6;
}

- (id)_stringForFeatureFlags:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  unsigned int v5 = v4;
  if (v3)
  {
    [v4 addObject:@"HID"];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"MediaControl"];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  [v5 addObject:@"TextInput"];
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  [v5 addObject:@"MVPD"];
  if ((v3 & 0x10) != 0) {
LABEL_6:
  }
    [v5 addObject:@"SiriPTT"];
LABEL_7:
  unint64_t v6 = NSString;
  id v7 = [v5 componentsJoinedByString:@" | "];
  id v8 = [v6 stringWithFormat:@"[%@]", v7];

  return v8;
}

- (void)_disconnectWithError:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = _TVRCRapportLog();
  unint64_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(TVRCRPCompanionLinkClientWrapper *)(uint64_t)v4 _disconnectWithError:v6];
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[TVRCRPCompanionLinkClientWrapper _disconnectWithError:]";
    __int16 v10 = 2112;
    int v11 = self;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  [(TVRCRPCompanionLinkClientWrapper *)self _invalidateAndReset];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained disconnectedFromDevice:self error:v4];
}

- (void)_invalidateAndReset
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  char v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    unsigned int v5 = "-[TVRCRPCompanionLinkClientWrapper _invalidateAndReset]";
    __int16 v6 = 2112;
    id v7 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v4, 0x16u);
  }

  [(TVRCRPCompanionLinkClientWrapper *)self _invalidateAndResetWithCompletionHandler:0];
}

- (void)_invalidateAndResetWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned int v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v27 = (TVRCRPCompanionLinkClientWrapper *)"-[TVRCRPCompanionLinkClientWrapper _invalidateAndResetWithCompletionHandler:]";
    __int16 v28 = 2112;
    uint64_t v29 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  if (![(TVRCRPCompanionLinkClientWrapper *)self isInvalidating])
  {
    self->_isInvalidating = 1;
    [(TVRCRPCompanionLinkClientWrapper *)self _sendSessionStop];
    [(TVRCRPCompanionLinkClientWrapper *)self _stopMonitoringTVSystemStatus];
    [(TVRCRPCompanionLinkClientWrapper *)self _stopMonitoringSupportedActions];
    [(TVRCRPCompanionLinkClientWrapper *)self _stopMonitoringNowPlayingInfo];
    [(TVRCRPCompanionLinkClientWrapper *)self _invalidateRemoteFindingManager];
    id v7 = dispatch_group_create();
    uint64_t v8 = MEMORY[0x263EF83A0];
    id v9 = MEMORY[0x263EF83A0];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke;
    block[3] = &unk_2647AEA98;
    block[4] = self;
    dispatch_group_async(v7, v8, block);
    __int16 v10 = [(TVRCRPCompanionLinkClientWrapper *)self siriSession];

    if (v10)
    {
      dispatch_group_enter(v7);
      int v11 = [(TVRCRPCompanionLinkClientWrapper *)self siriSession];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_111;
      v23[3] = &unk_2647AFB08;
      void v23[4] = self;
      __int16 v24 = v7;
      [v11 invalidateWithCompletion:v23];
    }
    uint64_t v12 = [(TVRCRPCompanionLinkClientWrapper *)self hidTouchSession];
    if (v12)
    {
    }
    else if (![(TVRCRPCompanionLinkClientWrapper *)self hidTouchSessionActivated])
    {
LABEL_14:
      id v15 = dispatch_get_global_queue(25, 0);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_113;
      v16[3] = &unk_2647B0090;
      BOOL v17 = v7;
      unint64_t v18 = v8;
      __int16 v19 = self;
      id v20 = v4;
      __int16 v6 = v7;
      dispatch_async(v15, v16);

      goto LABEL_15;
    }
    uint64_t v13 = _TVRCRapportLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v13, OS_LOG_TYPE_DEFAULT, "Invalidating HIDTouchSession", buf, 2u);
    }

    dispatch_group_enter(v7);
    uint64_t v14 = [(TVRCRPCompanionLinkClientWrapper *)self hidTouchSession];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_112;
    v21[3] = &unk_2647AFB08;
    void v21[4] = self;
    id v22 = v7;
    [v14 invalidateWithCompletion:v21];

    goto LABEL_14;
  }
  __int16 v6 = _TVRCRapportLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v27 = self;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Already in the process of invalidating. Ignoring this request. %@", buf, 0xCu);
  }
LABEL_15:
}

uint64_t __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = _TVRCRapportLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating MediaManager", buf, 2u);
  }

  char v3 = [*(id *)(a1 + 32) mediaManager];
  [v3 invalidate];

  [*(id *)(a1 + 32) setMediaManager:0];
  id v4 = _TVRCRapportLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v10 = 0;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating HIDSession", v10, 2u);
  }

  unsigned int v5 = [*(id *)(a1 + 32) hidSession];
  [v5 invalidate];

  [*(id *)(a1 + 32) setHidSession:0];
  [*(id *)(a1 + 32) setHidSessionActivated:0];
  __int16 v6 = _TVRCRapportLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Invalidating TextInputSession", v9, 2u);
  }

  id v7 = [*(id *)(a1 + 32) textInputSession];
  [v7 invalidate];

  [*(id *)(a1 + 32) setTextInputSession:0];
  return [*(id *)(a1 + 32) setTextInputSessionActivated:0];
}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_111(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _TVRCRapportLog();
  unsigned int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_111_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Successfully invalidated RPSiriSession", v6, 2u);
  }

  if ([*(id *)(a1 + 32) isInvalidating]) {
    [*(id *)(a1 + 32) setSiriSession:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_112(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _TVRCRapportLog();
  unsigned int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_112_cold_1();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v6 = 0;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Successfully invalidated HIDTouchSession", v6, 2u);
  }

  if ([*(id *)(a1 + 32) isInvalidating])
  {
    [*(id *)(a1 + 32) setHidTouchSession:0];
    [*(id *)(a1 + 32) setHidTouchSessionActivated:0];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_113(void *a1)
{
  id v2 = _TVRCRapportLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Waiting for rapport to invalidate all sessions", buf, 2u);
  }

  id v3 = a1[4];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  intptr_t v5 = dispatch_group_wait(v3, v4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_114;
  block[3] = &unk_2647B0068;
  id v7 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v8 = (void *)a1[7];
  intptr_t v11 = v5;
  block[4] = v6;
  id v10 = v8;
  dispatch_sync(v7, block);
}

uint64_t __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_114(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = _TVRCRapportLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (!v4) {
      goto LABEL_7;
    }
    __int16 v8 = 0;
    intptr_t v5 = "Failed to invalidate all sessions. Will force reset rapport sessions";
    uint64_t v6 = (uint8_t *)&v8;
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    intptr_t v5 = "Invalidated all sessions. Invalidating CompanionLinkClient.";
    uint64_t v6 = buf;
  }
  _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
LABEL_7:

  [*(id *)(a1 + 32) _resetState];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  }
  return result;
}

- (void)_resetState
{
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Resetting state", v6, 2u);
  }

  BOOL v4 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  [v4 invalidate];

  companionClient = self->_companionClient;
  self->_companionClient = 0;

  [(TVRCRPCompanionLinkClientWrapper *)self setConnected:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setActivated:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setAuthenticated:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setHidSession:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setHidSessionActivated:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setHidTouchSession:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setHidTouchSessionActivated:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setMediaManager:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setReceivedVolumeSettings:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setTextInputSession:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setTextInputSessionActivated:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setSiriSession:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setReceivedSiriSettings:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setStartedSetup:0];
  [(TVRCRPCompanionLinkClientWrapper *)self setIsInvalidating:0];
}

- (void)_sendSessionStart
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__TVRCRPCompanionLinkClientWrapper__sendSessionStart__block_invoke;
  v3[3] = &unk_2647AF548;
  objc_copyWeak(&v4, &location);
  [(TVRCRPCompanionLinkClientWrapper *)self sendEvent:@"TVRCSessionStart" options:0 shouldRetry:1 response:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __53__TVRCRPCompanionLinkClientWrapper__sendSessionStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = _TVRCRapportLog();
    __int16 v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __53__TVRCRPCompanionLinkClientWrapper__sendSessionStart__block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = WeakRetained[9];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Session started for companionLinkClient %{public}@.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_sendSessionStop
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__TVRCRPCompanionLinkClientWrapper__sendSessionStop__block_invoke;
  v3[3] = &unk_2647AF548;
  objc_copyWeak(&v4, &location);
  [(TVRCRPCompanionLinkClientWrapper *)self sendEvent:@"TVRCSessionStop" options:0 shouldRetry:1 response:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__TVRCRPCompanionLinkClientWrapper__sendSessionStop__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = _TVRCRapportLog();
    __int16 v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __52__TVRCRPCompanionLinkClientWrapper__sendSessionStop__block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = WeakRetained[9];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Session stopped for companionLinkClient %{public}@.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_setupHidSessionIfNeeded
{
  if (self->_hidSession)
  {
    uint64_t v2 = _TVRCRapportLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Active HIDSession already exists", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    id v4 = (RPHIDSession *)objc_alloc_init(MEMORY[0x263F62B98]);
    hidSession = self->_hidSession;
    self->_hidSession = v4;

    [(RPHIDSession *)self->_hidSession setMessenger:self->_companionClient];
    objc_initWeak(buf, self);
    uint64_t v6 = self->_hidSession;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__TVRCRPCompanionLinkClientWrapper__setupHidSessionIfNeeded__block_invoke;
    v7[3] = &unk_2647AFFC8;
    objc_copyWeak(&v8, buf);
    void v7[4] = self;
    [(RPHIDSession *)v6 activateWithCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __60__TVRCRPCompanionLinkClientWrapper__setupHidSessionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = _TVRCRapportLog();
    uint64_t v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __60__TVRCRPCompanionLinkClientWrapper__setupHidSessionIfNeeded__block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) _disconnectWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = WeakRetained[9];
        int v8 = 138543362;
        uint64_t v9 = v7;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Successfully created hidSession for companionLinkClient %{public}@.", (uint8_t *)&v8, 0xCu);
      }

      *((unsigned char *)WeakRetained + 12) = 1;
      [WeakRetained _updateConnectedState];
    }
  }
}

- (void)_setupFeatureServicesIfNeeded
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v23 = "-[TVRCRPCompanionLinkClientWrapper _setupFeatureServicesIfNeeded]";
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  BOOL v4 = self->_mediaManager == 0;
  id v5 = _TVRCRapportLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Setting up _TVRCRapportMediaEventsManager", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    uint64_t v7 = [TVRCRapportMediaEventsManager alloc];
    companionClient = self->_companionClient;
    BOOL v9 = [(TVRCRPCompanionLinkClientWrapper *)self supportsDirectCaptionQueries];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__TVRCRPCompanionLinkClientWrapper__setupFeatureServicesIfNeeded__block_invoke;
    v20[3] = &unk_2647AEB88;
    objc_copyWeak(&v21, (id *)buf);
    uint64_t v10 = [(TVRCRapportMediaEventsManager *)v7 initWithCompanionLinkClient:companionClient supportsDirectCaptionQueries:v9 eventHandler:v20];
    mediaManager = self->_mediaManager;
    self->_mediaManager = v10;

    dispatch_time_t v12 = dispatch_time(0, 300000000);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    BOOL v17 = __65__TVRCRPCompanionLinkClientWrapper__setupFeatureServicesIfNeeded__block_invoke_123;
    unint64_t v18 = &unk_2647AEB88;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_after(v12, MEMORY[0x263EF83A0], &v15);
    uint64_t v13 = [(TVRCRPCompanionLinkClientWrapper *)self device];
    uint64_t v14 = [v13 siriInfo];
    [(TVRCRPCompanionLinkClientWrapper *)self _updateSiriStatusFromSiriInfo:v14];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "_TVRCRapportMediaEventsManager is already set up", buf, 2u);
    }
  }
}

void __65__TVRCRPCompanionLinkClientWrapper__setupFeatureServicesIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = _TVRCRapportLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "_TVRCRapportMediaEventsManager eventHandlerCalled", (uint8_t *)&v6, 2u);
    }

    if (![WeakRetained[8] volumeSupported] || *((unsigned char *)WeakRetained + 16)) {
      goto LABEL_11;
    }
    id v3 = _TVRCRapportLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [WeakRetained[8] volumeSupported];
      id v5 = @"unsupported";
      if (v4) {
        id v5 = @"supported";
      }
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "_TVRCRapportMediaEventsManager volume control is %@", (uint8_t *)&v6, 0xCu);
    }

    *((unsigned char *)WeakRetained + 16) = 1;
    if (*((unsigned char *)WeakRetained + 8)) {
LABEL_11:
    }
      [WeakRetained _updateSupportedButtons];
    else {
      [WeakRetained _updateConnectedState];
    }
  }
}

void __65__TVRCRPCompanionLinkClientWrapper__setupFeatureServicesIfNeeded__block_invoke_123(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && (!WeakRetained[16] || !WeakRetained[15]))
  {
    id v3 = _TVRCRapportLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = v2[16];
      int v5 = v2[15];
      v6[0] = 67109376;
      v6[1] = v4;
      __int16 v7 = 1024;
      int v8 = v5;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "_TVRCRapportMediaEventsManager timed out waiting for volume:%d or siri:%d settings, meaning it is unsupported", (uint8_t *)v6, 0xEu);
    }

    *(_WORD *)(v2 + 15) = 257;
    [v2 _updateConnectedState];
  }
}

- (void)_setupTouchSessionIfNeeded
{
  if (self->_hidTouchSession)
  {
    uint64_t v2 = _TVRCRapportLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Active HIDTouchSession already exists", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    int v4 = (RPHIDTouchSession *)objc_alloc_init(MEMORY[0x263F62BA8]);
    hidTouchSession = self->_hidTouchSession;
    self->_hidTouchSession = v4;

    [(RPHIDTouchSession *)self->_hidTouchSession setMessenger:self->_companionClient];
    objc_initWeak(buf, self);
    int v6 = self->_hidTouchSession;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__TVRCRPCompanionLinkClientWrapper__setupTouchSessionIfNeeded__block_invoke;
    v7[3] = &unk_2647AFA68;
    objc_copyWeak(&v8, buf);
    [(RPHIDTouchSession *)v6 activateWithCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __62__TVRCRPCompanionLinkClientWrapper__setupTouchSessionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v5 = _TVRCRapportLog();
    int v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __62__TVRCRPCompanionLinkClientWrapper__setupTouchSessionIfNeeded__block_invoke_cold_1();
      }

      WeakRetained[13] = 0;
      [WeakRetained _disconnectWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *((void *)WeakRetained + 9);
        int v8 = 138543362;
        uint64_t v9 = v7;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Successfully created hidTouchSession for companionLinkClient %{public}@.", (uint8_t *)&v8, 0xCu);
      }

      WeakRetained[13] = 1;
      [WeakRetained _updateConnectedState];
    }
  }
}

- (void)_setupTextInputSessionIfNeeded
{
  if (self->_textInputSession)
  {
    uint64_t v2 = _TVRCRapportLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "Active TextInputSession already exists", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    int v4 = (RPTextInputSession *)objc_alloc_init(MEMORY[0x263F62C00]);
    textInputSession = self->_textInputSession;
    self->_textInputSession = v4;

    [(RPTextInputSession *)self->_textInputSession setMessenger:self->_companionClient];
    objc_initWeak(buf, self);
    int v6 = self->_textInputSession;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __66__TVRCRPCompanionLinkClientWrapper__setupTextInputSessionIfNeeded__block_invoke;
    v7[3] = &unk_2647AFA68;
    objc_copyWeak(&v8, buf);
    [(RPTextInputSession *)v6 activateWithCompletion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

void __66__TVRCRPCompanionLinkClientWrapper__setupTextInputSessionIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v5 = _TVRCRapportLog();
    int v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __66__TVRCRPCompanionLinkClientWrapper__setupTextInputSessionIfNeeded__block_invoke_cold_1();
      }

      [WeakRetained _disconnectWithError:v3];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = WeakRetained[9];
        int v10 = 138543362;
        id v11 = v7;
        _os_log_impl(&dword_2266D3000, v6, OS_LOG_TYPE_DEFAULT, "Successfully created textInputSession for companionLinkClient %{public}@.", (uint8_t *)&v10, 0xCu);
      }

      *((unsigned char *)WeakRetained + 14) = 1;
      [WeakRetained _updateConnectedState];
      id v8 = (void (**)(id, void *))WeakRetained[14];
      if (v8)
      {
        uint64_t v9 = [WeakRetained[13] rtiSession];
        v8[2](v8, v9);
      }
    }
  }
}

- (void)_updateSupportedButtons
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(TVRCRPCompanionLinkClientWrapper *)self receivedSiriSettings]
    && [(TVRCRPCompanionLinkClientWrapper *)self receivedVolumeSettings])
  {
    id v4 = [(TVRCRPCompanionLinkClientWrapper *)self delegate];
    [v4 deviceUpdatedSupportedButtons:self];
  }
  else
  {
    id v3 = _TVRCRapportLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      BOOL v6 = [(TVRCRPCompanionLinkClientWrapper *)self receivedSiriSettings];
      __int16 v7 = 1024;
      BOOL v8 = [(TVRCRPCompanionLinkClientWrapper *)self receivedVolumeSettings];
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Waiting for volume or siri settings before notifying client of updated supproted buttons. receivedSiriSettings:%d, receivedVolumeSettings:%d", buf, 0xEu);
    }
  }
}

- (void)_updateAttentionState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(TVRCRPCompanionLinkClientWrapper *)self attentionState] != a3)
  {
    int v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a3 - 1) >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", a3);
        BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v6 = off_2647B0178[a3 - 1];
      }
      __int16 v7 = v6;
      int64_t v8 = [(TVRCRPCompanionLinkClientWrapper *)self attentionState];
      if ((unint64_t)(v8 - 1) >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", v8);
        uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v9 = off_2647B0178[v8 - 1];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "TV attention state updated to %{public}@ from %{public}@", buf, 0x16u);
    }
    self->_attentionState = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deviceUpdatedAttentionState];
  }
}

- (void)_fetchTVSystemStatusAndStartMonitoring
{
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Fetching TV System Status", buf, 2u);
  }

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__TVRCRPCompanionLinkClientWrapper__fetchTVSystemStatusAndStartMonitoring__block_invoke;
  v4[3] = &unk_2647B00B8;
  v4[4] = self;
  [(TVRCRPCompanionLinkClientWrapper *)self sendEvent:@"FetchAttentionState" options:MEMORY[0x263EFFA78] response:v4];
  [(TVRCRPCompanionLinkClientWrapper *)self _startMonitoringTVSystemStatus];
}

void __74__TVRCRPCompanionLinkClientWrapper__fetchTVSystemStatusAndStartMonitoring__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"state"];
  objc_msgSend(*(id *)(a1 + 32), "_updateAttentionState:", (int)objc_msgSend(v3, "intValue"));
}

- (void)_startMonitoringTVSystemStatus
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[TVRCRPCompanionLinkClientWrapper _startMonitoringTVSystemStatus]";
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  uint64_t v8 = *MEMORY[0x263F62C38];
  uint64_t v9 = MEMORY[0x263EFFA88];
  id v4 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  objc_initWeak((id *)buf, self);
  int v5 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __66__TVRCRPCompanionLinkClientWrapper__startMonitoringTVSystemStatus__block_invoke;
  v6[3] = &unk_2647AF570;
  objc_copyWeak(&v7, (id *)buf);
  [v5 registerEventID:@"TVSystemStatus" options:v4 handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __66__TVRCRPCompanionLinkClientWrapper__startMonitoringTVSystemStatus__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v5 objectForKeyedSubscript:@"state"];
    objc_msgSend(WeakRetained, "_updateAttentionState:", (int)objc_msgSend(v4, "intValue"));
  }
}

- (void)_stopMonitoringTVSystemStatus
{
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stopped monitoring TVSystemStatus", v5, 2u);
  }

  id v4 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  [v4 deregisterRequestID:@"TVSystemStatus"];
}

- (void)_setupRemoteFindingManagerIfNeeded
{
  remoteFindingManager = self->_remoteFindingManager;
  id v4 = _TVRCRapportLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (remoteFindingManager)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Active RemoteFindingManager already exists", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Creating RemoteFindingManager", v8, 2u);
    }

    BOOL v6 = [[TVRCSiriRemoteFindingManager alloc] initWithCompanionLinkClientWrapper:self];
    id v7 = self->_remoteFindingManager;
    self->_remoteFindingManager = v6;

    [(TVRCSiriRemoteFindingManager *)self->_remoteFindingManager addObserver:self forKeyPath:@"pairedRemoteInfo" options:0 context:TVRCSiriRemoteObserverContext];
  }
}

- (void)enableFindingSession:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = "no";
    if (v3) {
      BOOL v6 = "yes";
    }
    int v8 = 136315394;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Enable Finding Session enabled: %s %@", (uint8_t *)&v8, 0x16u);
  }

  [(TVRCRPCompanionLinkClientWrapper *)self _setupRemoteFindingManagerIfNeeded];
  id v7 = [(TVRCRPCompanionLinkClientWrapper *)self remoteFindingManager];
  [v7 enableFindingSession:v3];
}

- (void)_invalidateRemoteFindingManager
{
  BOOL v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating RemoteFindingManager", v5, 2u);
  }

  [(TVRCSiriRemoteFindingManager *)self->_remoteFindingManager removeObserver:self forKeyPath:@"pairedRemoteInfo" context:TVRCSiriRemoteObserverContext];
  remoteFindingManager = self->_remoteFindingManager;
  self->_remoteFindingManager = 0;
}

- (TVRCSiriRemoteInfo)pairedRemoteInfo
{
  return [(TVRCSiriRemoteFindingManager *)self->_remoteFindingManager pairedRemoteInfo];
}

- (void)_updateSiriRemoteFindingState:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    int v8 = "-[TVRCRPCompanionLinkClientWrapper _updateSiriRemoteFindingState:]";
    __int16 v9 = 2112;
    __int16 v10 = self;
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  if (self->_siriRemoteFindingSessionState != a3)
  {
    self->_siriRemoteFindingSessionState = a3;
    BOOL v6 = [(TVRCRPCompanionLinkClientWrapper *)self delegate];
    [v6 deviceUpdateSiriRemoteFindingState];
  }
}

- (void)_startMonitoringNowPlayingInfo
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F62C38];
  v9[0] = MEMORY[0x263EFFA88];
  BOOL v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  objc_initWeak(&location, self);
  id v4 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__TVRCRPCompanionLinkClientWrapper__startMonitoringNowPlayingInfo__block_invoke;
  v5[3] = &unk_2647AF570;
  objc_copyWeak(&v6, &location);
  [v4 registerEventID:@"NowPlayingInfo" options:v3 handler:v5];

  [(TVRCRPCompanionLinkClientWrapper *)self sendEvent:@"FetchCurrentNowPlayingInfoEvent" options:MEMORY[0x263EFFA78] response:&__block_literal_global_137];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__TVRCRPCompanionLinkClientWrapper__startMonitoringNowPlayingInfo__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateNowPlayingInfo:v5];
  }
}

- (void)_stopMonitoringNowPlayingInfo
{
  BOOL v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Stopped monitoring NowPlayingInfo", v5, 2u);
  }

  id v4 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  [v4 deregisterEventID:@"NowPlayingInfo"];
}

- (void)_updateNowPlayingInfo:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [a3 objectForKeyedSubscript:@"NowPlayingInfoKey"];
  if (v4)
  {
    id v9 = 0;
    id v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];
    id v6 = v9;
    int v7 = _TVRCRapportLog();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[TVRCRPCompanionLinkClientWrapper _updateNowPlayingInfo:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = v5;
        _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Updated now playing info: %{public}@", buf, 0xCu);
      }

      [(TVRCRPCompanionLinkClientWrapper *)self setNowPlayingInfo:v5];
      uint64_t v8 = [(TVRCRPCompanionLinkClientWrapper *)self delegate];
      [v8 deviceUpdatedNowPlayingInfo:self];
    }
  }
}

- (void)_startMonitoringSupportedActions
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F62C38];
  v9[0] = MEMORY[0x263EFFA88];
  BOOL v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  objc_initWeak(&location, self);
  id v4 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__TVRCRPCompanionLinkClientWrapper__startMonitoringSupportedActions__block_invoke;
  v5[3] = &unk_2647AF570;
  objc_copyWeak(&v6, &location);
  [v4 registerEventID:@"SupportedActions" options:v3 handler:v5];

  [(TVRCRPCompanionLinkClientWrapper *)self sendEvent:@"FetchSupportedActionsEvent" options:MEMORY[0x263EFFA78] response:0];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __68__TVRCRPCompanionLinkClientWrapper__startMonitoringSupportedActions__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v5 objectForKeyedSubscript:@"GuideSupportedKey"];
    objc_msgSend(WeakRetained, "setGuideButtonSupported:", objc_msgSend(v4, "BOOLValue"));
    [WeakRetained _updateSupportedButtons];
  }
}

- (void)_stopMonitoringSupportedActions
{
  id v2 = [(TVRCRPCompanionLinkClientWrapper *)self companionClient];
  [v2 deregisterEventID:@"SupportedActions"];
}

- (int)_commandForButtonEvent:(id)a3
{
  BOOL v3 = [a3 button];
  uint64_t v4 = [v3 buttonType];

  if ((unint64_t)(v4 - 1) > 0x1D) {
    return 0;
  }
  else {
    return dword_226798BB8[v4 - 1];
  }
}

- (int)_stateForButtonEvent:(id)a3
{
  uint64_t v3 = [a3 eventType];
  if (v3 == 1) {
    return 1;
  }
  else {
    return 2 * (v3 == 2);
  }
}

- (void)_handleSideEffectsForEvent:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke;
  v6[3] = &unk_2647B00E0;
  objc_copyWeak(&v9, &location);
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke(id *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v2 = a1 + 6;
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v4 = [a1[4] button];
    uint64_t v5 = [v4 buttonType];

    if (v5 == 4)
    {
      uint64_t v6 = [a1[4] eventType];
      if ([a1[5] attentionState] == 1 && (v6 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      {
        id v7 = _TVRCRapportLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [a1[5] attentionState];
          if ((unint64_t)(v8 - 1) >= 3)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", v8);
            id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v9 = off_2647B0178[v8 - 1];
          }
          *(_DWORD *)buf = 138543362;
          v38 = v9;
          _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "TV is in %{public}@ state. Ignoring Siri invocation", buf, 0xCu);
        }
      }
      else
      {
        if (![a1[5] attentionState])
        {
          __int16 v10 = _TVRCRapportLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "TV is in an unkown state. Allowing Siri invocation", buf, 2u);
          }
        }
        switch(v6)
        {
          case 3:
            if (!*((void *)WeakRetained + 10))
            {
              id v23 = objc_alloc_init(MEMORY[0x263F62BE8]);
              uint64_t v24 = (void *)*((void *)WeakRetained + 10);
              *((void *)WeakRetained + 10) = v23;

              [*((id *)WeakRetained + 10) setIsDestinationPTTEligible:WeakRetained[17]];
              if (WeakRetained[17]) {
                [*((id *)WeakRetained + 10) setDelegate:a1[5]];
              }
            }
            __int16 v25 = _TVRCRapportLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2266D3000, v25, OS_LOG_TYPE_DEFAULT, "Prewarming Siri Session", buf, 2u);
            }

            __int16 v26 = (void *)*((void *)WeakRetained + 10);
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_146;
            v32[3] = &unk_2647AFA68;
            objc_copyWeak(&v33, v2);
            [v26 prewarmWithCompletion:v32];
            objc_destroyWeak(&v33);
            break;
          case 2:
            [*((id *)WeakRetained + 10) setIsDestinationPTTEligible:WeakRetained[17]];
            if (WeakRetained[17])
            {
              __int16 v27 = (void *)*((void *)WeakRetained + 10);
              v30[0] = MEMORY[0x263EF8330];
              v30[1] = 3221225472;
              v30[2] = __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_147;
              void v30[3] = &unk_2647AFA68;
              objc_copyWeak(&v31, v2);
              [v27 receivedButtonUpWithCompletion:v30];
              objc_destroyWeak(&v31);
            }
            else
            {
              __int16 v28 = _TVRCRapportLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_cold_2();
              }

              [*((id *)WeakRetained + 10) invalidate];
              uint64_t v29 = (void *)*((void *)WeakRetained + 10);
              *((void *)WeakRetained + 10) = 0;
            }
            break;
          case 1:
            if (!*((void *)WeakRetained + 10))
            {
              id v11 = objc_alloc_init(MEMORY[0x263F62BE8]);
              uint64_t v12 = (void *)*((void *)WeakRetained + 10);
              *((void *)WeakRetained + 10) = v11;

              [*((id *)WeakRetained + 10) setIsDestinationPTTEligible:WeakRetained[17]];
              if (WeakRetained[17]) {
                [*((id *)WeakRetained + 10) setDelegate:a1[5]];
              }
            }
            if (WeakRetained[17])
            {
              __int16 v13 = [*((id *)WeakRetained + 9) localDevice];
              uint64_t v14 = [v13 effectiveIdentifier];

              uint64_t v15 = _TVRCRapportLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v38 = v14;
                _os_log_impl(&dword_2266D3000, v15, OS_LOG_TYPE_DEFAULT, "Setting source Id - %@", buf, 0xCu);
              }

              [*((id *)WeakRetained + 10) setSourceID:v14];
            }
            [*((id *)WeakRetained + 10) setMessenger:*((void *)WeakRetained + 9)];
            uint64_t v16 = (void *)*((void *)WeakRetained + 10);
            BOOL v17 = [WeakRetained identifier];
            [v16 setDestinationID:v17];

            unint64_t v18 = _TVRCRapportLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2266D3000, v18, OS_LOG_TYPE_DEFAULT, "Activating Siri Session", buf, 2u);
            }

            id v19 = [MEMORY[0x263EF93E0] sharedInstance];
            id v36 = 0;
            [v19 setHostProcessAttribution:&unk_26DA62FE0 error:&v36];
            id v20 = v36;

            if (v20)
            {
              id v21 = _TVRCRapportLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
                __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_cold_1();
              }
            }
            id v22 = (void *)*((void *)WeakRetained + 10);
            v34[0] = MEMORY[0x263EF8330];
            v34[1] = 3221225472;
            v34[2] = __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_145;
            v34[3] = &unk_2647AFA68;
            objc_copyWeak(&v35, v2);
            [v22 activateWithCompletion:v34];
            objc_destroyWeak(&v35);

            break;
        }
      }
    }
  }
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_145(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v5 = WeakRetained;
      uint64_t v6 = _TVRCRapportLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_145_cold_1();
      }
    }
  }
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_146(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Prewarmed Rapport Siri Session", v7, 2u);
    }
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    uint64_t v6 = _TVRCRapportLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_146_cold_1();
    }

LABEL_8:
  }
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_147(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v5 = WeakRetained;
      uint64_t v6 = _TVRCRapportLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_145_cold_1();
      }
    }
  }
}

- (void)_updateConnectedState
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[TVRCRPCompanionLinkClientWrapper _updateConnectedState]";
    __int16 v9 = 2112;
    __int16 v10 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v7, 0x16u);
  }

  if (!self->_isInvalidating)
  {
    if (!self->_startedSetup && self->_activated && self->_authenticated)
    {
      self->_startedSetup = 1;
      self->_isInvalidating = 0;
      [(TVRCRPCompanionLinkClientWrapper *)self _sendSessionStart];
      [(TVRCRPCompanionLinkClientWrapper *)self _setupHidSessionIfNeeded];
      [(TVRCRPCompanionLinkClientWrapper *)self _setupFeatureServicesIfNeeded];
      [(TVRCRPCompanionLinkClientWrapper *)self _setupTouchSessionIfNeeded];
      [(TVRCRPCompanionLinkClientWrapper *)self _setupTextInputSessionIfNeeded];
      [(TVRCRPCompanionLinkClientWrapper *)self _fetchTVSystemStatusAndStartMonitoring];
      [(TVRCRPCompanionLinkClientWrapper *)self _setupRemoteFindingManagerIfNeeded];
      [(TVRCRPCompanionLinkClientWrapper *)self _startMonitoringSupportedActions];
      [(TVRCRPCompanionLinkClientWrapper *)self _startMonitoringNowPlayingInfo];
    }
    if (!self->_connected
      && self->_hidSessionActivated
      && self->_hidTouchSessionActivated
      && self->_textInputSessionActivated
      && self->_receivedSiriSettings
      && self->_receivedVolumeSettings)
    {
      id v4 = _TVRCRapportLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        companionClient = self->_companionClient;
        int v7 = 138543362;
        uint64_t v8 = (const char *)companionClient;
        _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Successfully set up companionLinkClient %{public}@. Letting clients know we connected successfully", (uint8_t *)&v7, 0xCu);
      }

      self->_connected = 1;
      [(TVRCRPCompanionLinkClientWrapper *)self _updateSupportedButtons];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained connectedToDevice:self];
    }
  }
}

- (void)_launchApplicationOrURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 containsString:@"://"])
    {
      uint64_t v6 = (void *)[objc_alloc(NSURL) initWithString:v5];
      int v7 = _TVRCRapportLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to launch application with URL %@", buf, 0xCu);
      }

      companionClient = self->_companionClient;
      uint64_t v9 = *MEMORY[0x263F62C08];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke;
      v16[3] = &unk_2647AFAE0;
      id v17 = v6;
      __int16 v10 = v6;
      [(RPCompanionLinkClient *)companionClient launchAppWithURL:v10 destinationID:v9 completion:v16];
    }
    else
    {
      uint64_t v11 = _TVRCRapportLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v5;
        _os_log_impl(&dword_2266D3000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to launch application with bundle ID %@", buf, 0xCu);
      }

      uint64_t v12 = self->_companionClient;
      uint64_t v13 = *MEMORY[0x263F62C08];
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_152;
      v14[3] = &unk_2647AFAE0;
      uint64_t v15 = v5;
      [(RPCompanionLinkClient *)v12 launchAppWithBundleID:v15 destinationID:v13 completion:v14];
      __int16 v10 = v15;
    }
  }
  else
  {
    __int16 v10 = _TVRCRapportLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = 0;
      _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Failed to launch App/URL %@", buf, 0xCu);
    }
  }
}

void __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRCRapportLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_cold_1();
    }
  }
}

void __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_152(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TVRCRapportLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_152_cold_1();
    }
  }
}

- (id)newCompanionLinkClient
{
  id v3 = objc_alloc_init(MEMORY[0x263F62B70]);
  objc_msgSend(v3, "setControlFlags:", objc_msgSend(v3, "controlFlags"));
  [v3 setDispatchQueue:MEMORY[0x263EF83A0]];
  [v3 setDestinationDevice:self->_device];
  [v3 setRssiThreshold:-75];
  objc_msgSend(v3, "tvrc_setAllowedTVs");
  [v3 setServiceType:@"com.apple.tvremoteservices"];
  return v3;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TVRCRapportLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v6 = "-[TVRCRPCompanionLinkClientWrapper dealloc]";
    __int16 v7 = 2112;
    uint64_t v8 = self;
    _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)TVRCRPCompanionLinkClientWrapper;
  [(TVRCRPCompanionLinkClientWrapper *)&v4 dealloc];
}

- (void)_fetchSiriEnabledWithSiriInfo:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _TVRCRapportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[TVRCRPCompanionLinkClientWrapper _fetchSiriEnabledWithSiriInfo:completionHandler:]";
    _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__2;
  id v17 = __Block_byref_object_dispose__2;
  id v18 = objc_alloc_init(MEMORY[0x263F285E0]);
  uint64_t v9 = *(void **)(*((void *)&buf + 1) + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke;
  v11[3] = &unk_2647B0130;
  v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  p_long long buf = &buf;
  [v9 getAssistantIsEnabledForDeviceWithSiriInfo:v6 withCompletion:v11];

  _Block_object_dispose(&buf, 8);
}

void __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke(void *a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke_2;
  block[3] = &unk_2647B0108;
  char v16 = a2;
  uint64_t v6 = a1[4];
  id v7 = (void *)a1[5];
  id v12 = v5;
  uint64_t v13 = v6;
  id v8 = v7;
  uint64_t v9 = a1[6];
  id v14 = v8;
  uint64_t v15 = v9;
  id v10 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = _TVRCRapportLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    int v17 = 67109378;
    *(_DWORD *)id v18 = v3;
    *(_WORD *)&v18[4] = 2114;
    *(void *)&v18[6] = v4;
    _os_log_impl(&dword_2266D3000, v2, OS_LOG_TYPE_DEFAULT, "getAssistantIsEnabledForDeviceWithSiriInfo, enabled=%{BOOL}d, error=%{public}@", (uint8_t *)&v17, 0x12u);
  }

  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) setSiriEnabled:1];
    id v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke_2_cold_1(a1 + 32, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setSiriEnabled:*(unsigned __int8 *)(a1 + 64)];
    id v5 = _TVRCRapportLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 40) device];
      int v13 = *(unsigned __int8 *)(a1 + 64);
      int v17 = 138543618;
      *(void *)id v18 = v12;
      *(_WORD *)&v18[8] = 1024;
      *(_DWORD *)&v18[10] = v13;
      _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "Siri Enabled on device %{public}@ : %d", (uint8_t *)&v17, 0x12u);
    }
  }

  uint64_t v14 = *(void *)(a1 + 48);
  if (v14)
  {
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, [*(id *)(a1 + 40) isSiriEnabled]);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    char v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = 0;
  }
}

- (void)_updateSiriStatusFromSiriInfo:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TVRCRapportLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v9 = "-[TVRCRPCompanionLinkClientWrapper _updateSiriStatusFromSiriInfo:]";
    _os_log_impl(&dword_2266D3000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  _DWORD v6[2] = __66__TVRCRPCompanionLinkClientWrapper__updateSiriStatusFromSiriInfo___block_invoke;
  v6[3] = &unk_2647B0158;
  objc_copyWeak(&v7, (id *)buf);
  [(TVRCRPCompanionLinkClientWrapper *)self _fetchSiriEnabledWithSiriInfo:v4 completionHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __66__TVRCRPCompanionLinkClientWrapper__updateSiriStatusFromSiriInfo___block_invoke(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = _TVRCRapportLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = @"disabled";
      if (a2) {
        id v5 = @"enabled";
      }
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Siri is %{public}@. Calling delegate to update supported buttons", (uint8_t *)&v6, 0xCu);
    }

    WeakRetained[15] = 1;
    if (WeakRetained[8]) {
      [WeakRetained _updateSupportedButtons];
    }
    else {
      [WeakRetained _updateConnectedState];
    }
  }
}

- (void)rpSiriSessionDidReceiveStopRecording
{
  if (self->_pttFeatureSupported)
  {
    objc_initWeak(&location, self);
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __72__TVRCRPCompanionLinkClientWrapper_rpSiriSessionDidReceiveStopRecording__block_invoke;
    v2[3] = &unk_2647AEB88;
    objc_copyWeak(&v3, &location);
    dispatch_async(MEMORY[0x263EF83A0], v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

void __72__TVRCRPCompanionLinkClientWrapper_rpSiriSessionDidReceiveStopRecording__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && WeakRetained[10])
  {
    id v3 = _TVRCRapportLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "Received Stop recording - Invalidating RPSiriSession", v5, 2u);
    }

    [v2[10] invalidate];
    id v4 = v2[10];
    v2[10] = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)TVRCSiriRemoteObserverContext == a6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__TVRCRPCompanionLinkClientWrapper_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2647AEA98;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TVRCRPCompanionLinkClientWrapper;
    -[TVRCRPCompanionLinkClientWrapper observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __83__TVRCRPCompanionLinkClientWrapper_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 deviceUpdatedPairedRemoteInfo:*(void *)(a1 + 32)];
}

- (RPCompanionLinkDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (int64_t)attentionState
{
  return self->_attentionState;
}

- (void)setAttentionState:(int64_t)a3
{
  self->_attentionState = a3;
}

- (int64_t)siriRemoteFindingSessionState
{
  return self->_siriRemoteFindingSessionState;
}

- (void)setSiriRemoteFindingSessionState:(int64_t)a3
{
  self->_siriRemoteFindingSessionState = a3;
}

- (TVRCNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (void)setNowPlayingInfo:(id)a3
{
}

- (_TVRCCompanionLinkClientWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_TVRCCompanionLinkClientWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRCRapportMediaEventsManager)mediaManager
{
  return self->_mediaManager;
}

- (void)setMediaManager:(id)a3
{
}

- (RPCompanionLinkClient)companionClient
{
  return self->_companionClient;
}

- (void)setCompanionClient:(id)a3
{
}

- (RPSiriSession)siriSession
{
  return self->_siriSession;
}

- (void)setSiriSession:(id)a3
{
}

- (RPHIDSession)hidSession
{
  return self->_hidSession;
}

- (void)setHidSession:(id)a3
{
}

- (RPHIDTouchSession)hidTouchSession
{
  return self->_hidTouchSession;
}

- (void)setHidTouchSession:(id)a3
{
}

- (RPTextInputSession)textInputSession
{
  return self->_textInputSession;
}

- (void)setTextInputSession:(id)a3
{
}

- (id)rtiSessionHandler
{
  return self->_rtiSessionHandler;
}

- (void)setRtiSessionHandler:(id)a3
{
}

- (unint64_t)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(unint64_t)a3
{
  self->_featureFlags = a3;
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)startedSetup
{
  return self->_startedSetup;
}

- (void)setStartedSetup:(BOOL)a3
{
  self->_startedSetup = a3;
}

- (BOOL)hidSessionActivated
{
  return self->_hidSessionActivated;
}

- (void)setHidSessionActivated:(BOOL)a3
{
  self->_hidSessionActivated = a3;
}

- (BOOL)hidTouchSessionActivated
{
  return self->_hidTouchSessionActivated;
}

- (void)setHidTouchSessionActivated:(BOOL)a3
{
  self->_hidTouchSessionActivated = a3;
}

- (BOOL)textInputSessionActivated
{
  return self->_textInputSessionActivated;
}

- (void)setTextInputSessionActivated:(BOOL)a3
{
  self->_textInputSessionActivated = a3;
}

- (BOOL)receivedSiriSettings
{
  return self->_receivedSiriSettings;
}

- (void)setReceivedSiriSettings:(BOOL)a3
{
  self->_receivedSiriSettings = a3;
}

- (BOOL)receivedVolumeSettings
{
  return self->_receivedVolumeSettings;
}

- (void)setReceivedVolumeSettings:(BOOL)a3
{
  self->_receivedVolumeSettings = a3;
}

- (BOOL)pttFeatureSupported
{
  return self->_pttFeatureSupported;
}

- (void)setPttFeatureSupported:(BOOL)a3
{
  self->_BOOL pttFeatureSupported = a3;
}

- (BOOL)isInvalidating
{
  return self->_isInvalidating;
}

- (void)setIsInvalidating:(BOOL)a3
{
  self->_isInvalidating = a3;
}

- (id)invalidationCompletionBlock
{
  return self->_invalidationCompletionBlock;
}

- (void)setInvalidationCompletionBlock:(id)a3
{
}

- (BOOL)isSiriEnabled
{
  return self->_siriEnabled;
}

- (void)setSiriEnabled:(BOOL)a3
{
  self->_siriEnabled = a3;
}

- (TVRCSiriRemoteFindingManager)remoteFindingManager
{
  return self->_remoteFindingManager;
}

- (void)setRemoteFindingManager:(id)a3
{
}

- (BOOL)isGuideButtonSupported
{
  return self->_guideButtonSupported;
}

- (void)setGuideButtonSupported:(BOOL)a3
{
  self->_guideButtonSupported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteFindingManager, 0);
  objc_storeStrong(&self->_invalidationCompletionBlock, 0);
  objc_storeStrong(&self->_rtiSessionHandler, 0);
  objc_storeStrong((id *)&self->_textInputSession, 0);
  objc_storeStrong((id *)&self->_hidTouchSession, 0);
  objc_storeStrong((id *)&self->_hidSession, 0);
  objc_storeStrong((id *)&self->_siriSession, 0);
  objc_storeStrong((id *)&self->_companionClient, 0);
  objc_storeStrong((id *)&self->_mediaManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

void __79__TVRCRPCompanionLinkClientWrapper_reestablishConnectionWithCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2266D3000, a2, OS_LOG_TYPE_ERROR, "Failed to reestablish connection with client: %{public}@", v4, 0xCu);
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0(&dword_2266D3000, v0, v1, "User cancelled PIN pairing, disconnecting", v2, v3, v4, v5, v6);
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "companionLinkClient authCompletionHandler, diconnecting with error=%{public}@", v2, v3, v4, v5, v6);
}

void __43__TVRCRPCompanionLinkClientWrapper_connect__block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_2266D3000, v0, v1, "Could not create companionLinkClient for device %{public}@. Error - %{public}@ %@");
}

- (void)sendButtonEvent:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_2266D3000, v1, OS_LOG_TYPE_DEBUG, "Attempting to send button event %@ to Rapport device - %{public}@", v2, 0x16u);
}

- (void)sendButtonEvent:.cold.2()
{
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_2266D3000, v0, OS_LOG_TYPE_DEBUG, "Push To Talk Menu/Back detected. Invalidating Siri Session.", v1, 2u);
}

- (void)sendButtonEvent:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0(&dword_2266D3000, v0, v1, "No active companion link client found. Ignoring sendButton event.", v2, v3, v4, v5, v6);
}

void __52__TVRCRPCompanionLinkClientWrapper_sendButtonEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error sending HID event to Rapport companionLinkClient %{public}@. Error - %{public}@");
}

- (void)sendTouchEvent:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0(&dword_2266D3000, v0, v1, "No active companion link client found. Ignoring sendTouch event.", v2, v3, v4, v5, v6);
}

void __51__TVRCRPCompanionLinkClientWrapper_sendTouchEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error sending Touch event to Rapport companionLinkClient %{public}@. Error - %{public}@");
}

void __75__TVRCRPCompanionLinkClientWrapper_sendEvent_options_shouldRetry_response___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Failed to reestablish connection for %{public}@: %{public}@");
}

- (void)registerEvent:options:handler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_2266D3000, v1, OS_LOG_TYPE_FAULT, "Unable to register %{public}@. CompanionLinkClient is not active! %@", v2, 0x16u);
}

- (void)_disconnectWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)__int16 v3 = 136315650;
  *(void *)&void v3[4] = "-[TVRCRPCompanionLinkClientWrapper _disconnectWithError:]";
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_7(&dword_2266D3000, a2, a3, "%s, error=%{public}@ %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_111_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "RPSiriSession invalidation failed %@", v2, v3, v4, v5, v6);
}

void __77__TVRCRPCompanionLinkClientWrapper__invalidateAndResetWithCompletionHandler___block_invoke_112_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "HIDTouchSession invalidation failed %@", v2, v3, v4, v5, v6);
}

void __53__TVRCRPCompanionLinkClientWrapper__sendSessionStart__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Could not send SessionStart for companionLinkClient %{public}@. Error - %{public}@");
}

void __52__TVRCRPCompanionLinkClientWrapper__sendSessionStop__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Could not send SessionStop for companionLinkClient %{public}@. Error - %{public}@");
}

void __60__TVRCRPCompanionLinkClientWrapper__setupHidSessionIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Could not create hidSession for companionLinkClient %{public}@. Error - %{public}@");
}

void __62__TVRCRPCompanionLinkClientWrapper__setupTouchSessionIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Could not create hidTouchSession for companionLinkClient %{public}@. Error - %{public}@");
}

void __66__TVRCRPCompanionLinkClientWrapper__setupTextInputSessionIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Could not create textInputSession for companionLinkClient %{public}@. Error - %{public}@");
}

- (void)_updateNowPlayingInfo:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2266D3000, v0, v1, "AVAudioSession hostProcessAttribution error: %@", v2, v3, v4, v5, v6);
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_5_0(&dword_2266D3000, v0, v1, "Releasing RPSiriSession", v2, v3, v4, v5, v6);
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_145_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error activating Siri session for Rapport companionLinkClient %{public}@. Error - %{public}@");
}

void __63__TVRCRPCompanionLinkClientWrapper__handleSideEffectsForEvent___block_invoke_146_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error prewarming Siri session for Rapport companionLinkClient %{public}@. Error - %{public}@");
}

void __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error launching URL %@. Error - %{public}@");
}

void __60__TVRCRPCompanionLinkClientWrapper__launchApplicationOrURL___block_invoke_152_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2266D3000, v0, v1, "Error launching application %@. Error - %{public}@");
}

void __84__TVRCRPCompanionLinkClientWrapper__fetchSiriEnabledWithSiriInfo_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end