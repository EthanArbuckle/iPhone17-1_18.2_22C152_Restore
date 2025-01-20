@interface TVRDServer
- (BOOL)_hasNowPlayingControlsForButtons:(id)a3;
- (BOOL)_isButtonOfNowPlayingType:(id)a3;
- (BOOL)clientConnection:(id)a3 isConnectedToDeviceWithIdentifier:(id)a4;
- (BOOL)deviceShouldAllowConnectionAuthentication:(id)a3;
- (BOOL)informDeviceQueryObserversWithUpdatedSuggestions;
- (BOOL)isScreenLocked;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CUSystemMonitor)systemMonitor;
- (NSCountedSet)deviceIdentifiers;
- (NSDate)lastConnectionTimestamp;
- (NSMutableDictionary)authChallengesByID;
- (NSMutableDictionary)connectionContextByID;
- (NSMutableSet)cachedDevices;
- (NSMutableSet)clientConnections;
- (NSMutableSet)deviceQueryObservers;
- (NSMutableSet)identifiersRequestingConnection;
- (TVRDIRSessionManager)irSessionManager;
- (TVRDServer)init;
- (TVRXDevice)lastConnectedDevice;
- (TVRXDeviceLocator)deviceSearch;
- (TVRXDeviceQuery)generalDeviceQuery;
- (id)_cachedDeviceForIdentifier:(id)a3;
- (id)_deviceForIdentifierInDeviceQuery:(id)a3;
- (id)_deviceForKeyboardController:(id)a3;
- (id)_interestedClientProcessConnectionsForDevice:(id)a3;
- (void)_activateIRSessionManager;
- (void)_becameInterestedInDeviceWithIdentifier:(id)a3;
- (void)_connectToDeviceIfNeeded:(id)a3;
- (void)_informClientCouldNotLocateDeviceWithIdentifier:(id)a3;
- (void)_invalidateIRSessionManager;
- (void)_lostInterestInDeviceWithIdentifier:(id)a3;
- (void)_startGeneralDeviceQuery;
- (void)_stopGeneralDeviceQuery;
- (void)_switchToCurrentUserProfileForDevice:(id)a3;
- (void)_updateDevicesWithRecommendations:(id)a3;
- (void)clientConnection:(id)a3 addItemForDeviceWithIdentifier:(id)a4 mediaIdentifier:(id)a5 completion:(id)a6;
- (void)clientConnection:(id)a3 addedInterestedDeviceIdentifier:(id)a4 connectionContext:(int64_t)a5;
- (void)clientConnection:(id)a3 cancelledAuthChallengeForDeviceIdentifier:(id)a4;
- (void)clientConnection:(id)a3 fetchUpNextInfoForDeviceWithIdentifier:(id)a4 paginationToken:(id)a5 completion:(id)a6;
- (void)clientConnection:(id)a3 markAsWatchedForDeviceWithIdentifier:(id)a4 mediaIdentifier:(id)a5 completion:(id)a6;
- (void)clientConnection:(id)a3 playItem:(id)a4 deviceIdentifier:(id)a5 completion:(id)a6;
- (void)clientConnection:(id)a3 receivedAuthChallengeLocallyEnteredCode:(id)a4 forDeviceIdentifier:(id)a5;
- (void)clientConnection:(id)a3 reiteratedInterestInDeviceIdentifier:(id)a4 connectionContext:(int64_t)a5;
- (void)clientConnection:(id)a3 removeItemForDeviceWithIdentifier:(id)a4 mediaIdentifier:(id)a5 completion:(id)a6;
- (void)clientConnection:(id)a3 removedInterestedDeviceIdentifier:(id)a4;
- (void)clientConnection:(id)a3 requestsEnablingFindingSession:(BOOL)a4 forDeviceWithIdentifier:(id)a5;
- (void)clientConnection:(id)a3 requestsEnablingRemoteOnLockscreen:(BOOL)a4 forDeviceWithIdentifier:(id)a5;
- (void)clientConnection:(id)a3 requestsSendingButtonEvent:(id)a4 toDeviceIdentifier:(id)a5;
- (void)clientConnection:(id)a3 requestsSendingEvent:(id)a4 toDeviceWithIdentifier:(id)a5 options:(id)a6 response:(id)a7;
- (void)clientConnection:(id)a3 requestsSendingGameControllerEvent:(id)a4 toDeviceIdentifier:(id)a5;
- (void)clientConnection:(id)a3 requestsSendingInputDataPayload:(id)a4 toDeviceIdentifier:(id)a5;
- (void)clientConnection:(id)a3 requestsSendingInputReturnKeyToDeviceIdentifier:(id)a4;
- (void)clientConnection:(id)a3 requestsSendingInputText:(id)a4 toDeviceIdentifier:(id)a5;
- (void)clientConnection:(id)a3 requestsSendingTouchEvent:(id)a4 toDeviceIdentifier:(id)a5;
- (void)clientConnection:(id)a3 requestsSuggestedDeviceWithResponse:(id)a4;
- (void)clientConnectionRequestsEndingDeviceQuery:(id)a3;
- (void)clientConnectionRequestsStartingDeviceQuery:(id)a3 withResponse:(id)a4;
- (void)clientConnectionSeveredConnection:(id)a3;
- (void)dealloc;
- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5;
- (void)device:(id)a3 encounteredAuthenticationChallenge:(id)a4;
- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4;
- (void)device:(id)a3 updatedAttentionState:(int64_t)a4;
- (void)device:(id)a3 updatedNowPlayingInfo:(id)a4;
- (void)device:(id)a3 updatedPairedRemoteInfo:(id)a4;
- (void)device:(id)a3 updatedSiriRemoteFindingState:(int64_t)a4;
- (void)device:(id)a3 updatedSupportedButtons:(id)a4;
- (void)deviceBeganConnecting:(id)a3;
- (void)deviceConnected:(id)a3;
- (void)deviceNameChanged:(id)a3;
- (void)devicePoweredOff:(id)a3;
- (void)deviceQueryDidUpdateDevices:(id)a3;
- (void)keyboardController:(id)a3 beganTextEditingWithAttributes:(id)a4;
- (void)keyboardController:(id)a3 didUpdateAttributes:(id)a4;
- (void)keyboardController:(id)a3 didUpdateText:(id)a4;
- (void)keyboardControllerEndedTextEditing:(id)a3;
- (void)setAuthChallengesByID:(id)a3;
- (void)setCachedDevices:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setConnectionContextByID:(id)a3;
- (void)setDeviceIdentifiers:(id)a3;
- (void)setDeviceQueryObservers:(id)a3;
- (void)setDeviceSearch:(id)a3;
- (void)setGeneralDeviceQuery:(id)a3;
- (void)setIdentifiersRequestingConnection:(id)a3;
- (void)setInformDeviceQueryObserversWithUpdatedSuggestions:(BOOL)a3;
- (void)setIrSessionManager:(id)a3;
- (void)setIsScreenLocked:(BOOL)a3;
- (void)setLastConnectedDevice:(id)a3;
- (void)setLastConnectionTimestamp:(id)a3;
- (void)setSystemMonitor:(id)a3;
@end

@implementation TVRDServer

- (TVRDServer)init
{
  v31.receiver = self;
  v31.super_class = (Class)TVRDServer;
  v2 = [(TVRDServer *)&v31 init];
  if (v2)
  {
    v3 = +[TVRXManagedConfigManager sharedInstance];
    [v3 refreshState];

    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    authChallengesByID = v2->_authChallengesByID;
    v2->_authChallengesByID = v4;

    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    cachedDevices = v2->_cachedDevices;
    v2->_cachedDevices = v6;

    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    connectionContextByID = v2->_connectionContextByID;
    v2->_connectionContextByID = v10;

    v12 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    deviceIdentifiers = v2->_deviceIdentifiers;
    v2->_deviceIdentifiers = v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    deviceQueryObservers = v2->_deviceQueryObservers;
    v2->_deviceQueryObservers = v14;

    v16 = (TVRXDeviceLocator *)objc_alloc_init((Class)TVRXDeviceLocator);
    deviceSearch = v2->_deviceSearch;
    v2->_deviceSearch = v16;

    v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    identifiersRequestingConnection = v2->_identifiersRequestingConnection;
    v2->_identifiersRequestingConnection = v18;

    v20 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = v2->_systemMonitor;
    v2->_systemMonitor = v20;

    objc_initWeak(&location, v2);
    v22 = v2->_systemMonitor;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __18__TVRDServer_init__block_invoke;
    v28[3] = &unk_10001C5D8;
    objc_copyWeak(&v29, &location);
    [(CUSystemMonitor *)v22 setScreenLockedChangedHandler:v28];
    [(CUSystemMonitor *)v2->_systemMonitor activateWithCompletion:&__block_literal_global_4];
    v23 = v2->_systemMonitor;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = __18__TVRDServer_init__block_invoke_14;
    v26[3] = &unk_10001C5D8;
    objc_copyWeak(&v27, &location);
    [(CUSystemMonitor *)v23 setFirstUnlockHandler:v26];
    objc_copyWeak(&v25, &location);
    _TVRCAddStateHandlerWithName();
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __18__TVRDServer_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained systemMonitor];
    unsigned int v4 = [v3 screenLocked];

    v5 = _TVRDXPCLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"unlocked";
      if (v4) {
        CFStringRef v6 = @"locked";
      }
      int v7 = 138412290;
      CFStringRef v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Screen is now %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __18__TVRDServer_init__block_invoke_13(id a1)
{
  v1 = _TVRDXPCLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Screen lock monitor activated", v2, 2u);
  }
}

void __18__TVRDServer_init__block_invoke_14(uint64_t a1)
{
  v2 = _TVRDXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "First unlock. Activating IRSessionManager", v8, 2u);
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained systemMonitor];
  unsigned int v6 = [v5 firstUnlocked];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v3);
    [v7 _activateIRSessionManager];
  }
}

id __18__TVRDServer_init__block_invoke_16(uint64_t a1)
{
  v2 = +[NSMutableDictionary dictionary];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned int v4 = +[NSMutableDictionary dictionary];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = WeakRetained[4];
    id v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v11 = [v10 stateDictionary];
          v12 = [v10 identifier];
          [v4 setObject:v11 forKeyedSubscript:v12];
        }
        id v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }

    [v2 setObject:v4 forKeyedSubscript:@"cachedDevices"];
    v13 = [WeakRetained[7] description];
    [v2 setObject:v13 forKeyedSubscript:@"deviceQueryObservers"];

    v14 = [WeakRetained[2] description];
    [v2 setObject:v14 forKeyedSubscript:@"clientConnections"];

    v15 = +[NSMutableDictionary dictionary];
    v16 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = [WeakRetained[10] devices];
    id v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) stateDictionary];
          [v16 addObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [v15 setObject:v16 forKeyedSubscript:@"devices"];
    [v2 setObject:v15 forKeyedSubscript:@"deviceQueryResults"];
  }

  return v2;
}

- (void)dealloc
{
  v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deallocating TVRDServer", buf, 2u);
  }

  unsigned int v4 = [(TVRDServer *)self systemMonitor];
  [v4 invalidate];

  [(TVRDServer *)self _invalidateIRSessionManager];
  v5.receiver = self;
  v5.super_class = (Class)TVRDServer;
  [(TVRDServer *)&v5 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = _TVRDXPCLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "shouldAcceptNewConnection: %{public}@", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __49__TVRDServer_listener_shouldAcceptNewConnection___block_invoke;
  v9[3] = &unk_10001C858;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  return 1;
}

void __49__TVRDServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = [[TVRDClientProcessConnection alloc] initWithXPCConnection:*(void *)(a1 + 32) delegate:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 40) + 16) addObject:v2];
  v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(*(void *)(a1 + 40) + 16) count];
    int v5 = 138543618;
    id v6 = v2;
    __int16 v7 = 2048;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Added new %{public}@. Total connections: %ld", (uint8_t *)&v5, 0x16u);
  }
}

- (void)clientConnection:(id)a3 addedInterestedDeviceIdentifier:(id)a4 connectionContext:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = _TVRDXPCLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ requested connection to %{public}@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __81__TVRDServer_clientConnection_addedInterestedDeviceIdentifier_connectionContext___block_invoke;
  block[3] = &unk_10001C880;
  block[4] = self;
  id v13 = v9;
  int64_t v14 = a5;
  id v11 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __81__TVRDServer_clientConnection_addedInterestedDeviceIdentifier_connectionContext___block_invoke(uint64_t a1)
{
  v2 = +[NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v3 = (id *)(a1 + 32);
  id v4 = [*(id *)(a1 + 32) connectionContextByID];
  uint64_t v6 = *(void *)(a1 + 40);
  int v5 = (uint64_t *)(a1 + 40);
  [v4 setObject:v2 forKeyedSubscript:v6];

  uint64_t v7 = (uint64_t)[*((id *)*v3 + 3) countForObject:*v5];
  if (v7)
  {
    if (v7 >= 1)
    {
      id v8 = [*v3 _cachedDeviceForIdentifier:*v5];
      if (v8)
      {
        [*v3 _connectToDeviceIfNeeded:v8];
      }
      else
      {
        id v11 = _TVRDXPCLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __81__TVRDServer_clientConnection_addedInterestedDeviceIdentifier_connectionContext___block_invoke_cold_1(v5, (uint64_t)v3, v11);
        }

        [*v3 _informClientCouldNotLocateDeviceWithIdentifier:*v5];
      }
    }
  }
  else
  {
    id v9 = *v3;
    uint64_t v10 = *v5;
    [v9 _becameInterestedInDeviceWithIdentifier:v10];
  }
}

- (void)clientConnection:(id)a3 reiteratedInterestInDeviceIdentifier:(id)a4 connectionContext:(int64_t)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __86__TVRDServer_clientConnection_reiteratedInterestInDeviceIdentifier_connectionContext___block_invoke;
  v11[3] = &unk_10001C8A8;
  v11[4] = self;
  id v12 = a4;
  id v13 = v8;
  int64_t v14 = a5;
  id v9 = v8;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

void __86__TVRDServer_clientConnection_reiteratedInterestInDeviceIdentifier_connectionContext___block_invoke(uint64_t a1)
{
  v2 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v3 = [*(id *)(a1 + 32) connectionContextByID];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v4 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  int v5 = *(id **)(a1 + 32);
  id v7 = (id)v4;
  if (v4)
  {
    [v5 _connectToDeviceIfNeeded:v4];
  }
  else
  {
    if ((int)[v5[3] countForObject:*(void *)(a1 + 40)] >= 1)
    {
      int v6 = 0;
      do
      {
        [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
        ++v6;
      }
      while (v6 < (int)[*(id *)(*(void *)(a1 + 32) + 24) countForObject:*(void *)(a1 + 40)]);
    }
    [*(id *)(a1 + 32) clientConnection:*(void *)(a1 + 48) addedInterestedDeviceIdentifier:*(void *)(a1 + 40) connectionContext:*(void *)(a1 + 56)];
  }
}

- (void)clientConnection:(id)a3 removedInterestedDeviceIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = v6;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ requested disconnection to %{public}@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __65__TVRDServer_clientConnection_removedInterestedDeviceIdentifier___block_invoke;
  v10[3] = &unk_10001C858;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

void __65__TVRDServer_clientConnection_removedInterestedDeviceIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) countForObject:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v4 = [v2 allIdentifiers];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
  }
  if (![*(id *)(*(void *)(a1 + 32) + 24) countForObject:*(void *)(a1 + 40)]) {
    [*(id *)(a1 + 32) _lostInterestInDeviceWithIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)clientConnection:(id)a3 receivedAuthChallengeLocallyEnteredCode:(id)a4 forDeviceIdentifier:(id)a5
{
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __91__TVRDServer_clientConnection_receivedAuthChallengeLocallyEnteredCode_forDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  id v11 = a5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __91__TVRDServer_clientConnection_receivedAuthChallengeLocallyEnteredCode_forDeviceIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
    id v5 = [v2 identifier];
    id v6 = [v4 objectForKey:v5];

    if (v6)
    {
      [v6 userEnteredCodeLocally:*(void *)(a1 + 48)];
      id v7 = *(void **)(*(void *)(a1 + 32) + 48);
      id v8 = [v3 identifier];
      [v7 removeObjectForKey:v8];
    }
    else
    {
      id v8 = _TVRDXPCLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = 138412290;
        uint64_t v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client attempted to fulfill an auth challenge that appears to no longer exist, for device with identifier %@. Ignoring.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    id v6 = _TVRDXPCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client attempted to fulfill an auth challenge for a device that appears to no longer exist, device identifier %@. Ignoring.", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)clientConnection:(id)a3 cancelledAuthChallengeForDeviceIdentifier:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __73__TVRDServer_clientConnection_cancelledAuthChallengeForDeviceIdentifier___block_invoke;
  v5[3] = &unk_10001C858;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void __73__TVRDServer_clientConnection_cancelledAuthChallengeForDeviceIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 48);
    id v5 = [v2 identifier];
    id v6 = [v4 objectForKey:v5];

    if (v6)
    {
      [v6 cancel];
      id v7 = *(void **)(*(void *)(a1 + 32) + 48);
      id v8 = [v3 identifier];
      [v7 removeObjectForKey:v8];
    }
    else
    {
      id v8 = _TVRDXPCLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        int v11 = 138412290;
        uint64_t v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client attempted to cancel an auth challenge that appears to no longer exist, for device with identifier %@. Ignoring.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    id v6 = _TVRDXPCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138412290;
      uint64_t v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client attempted to fulfill an auth challenge for a device that appears to no longer exist, device identifier %@. Ignoring.", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)clientConnection:(id)a3 requestsSendingButtonEvent:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __77__TVRDServer_clientConnection_requestsSendingButtonEvent_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  id v11 = a5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __77__TVRDServer_clientConnection_requestsSendingButtonEvent_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    [v2 sendButtonEvent:*(void *)(a1 + 48)];
    id v4 = [*(id *)(a1 + 48) button];
    unint64_t v5 = (unint64_t)[v4 buttonType];

    if (v5 <= 0x1E && ((1 << v5) & 0x4000000C) != 0) {
      [*(id *)(a1 + 32) _switchToCurrentUserProfileForDevice:v3];
    }
    if ([*(id *)(a1 + 48) eventType] != (id)1)
    {
      id v7 = [*(id *)(a1 + 32) irSessionManager];
      [v7 didInteractWithDevice:v3];
    }
  }
  else
  {
    id v8 = _TVRDXPCLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [*(id *)(a1 + 32) cachedDevices];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No cached device found with identifier %@. All cached devices - %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)clientConnection:(id)a3 requestsSendingGameControllerEvent:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __85__TVRDServer_clientConnection_requestsSendingGameControllerEvent_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  id v11 = a5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __85__TVRDServer_clientConnection_requestsSendingGameControllerEvent_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = v2;
    [v2 sendGameControllerEvent:*(void *)(a1 + 48)];
    v3 = [*(id *)(a1 + 32) irSessionManager];
    [v3 didInteractWithDevice:v4];

    v2 = v4;
  }
}

- (void)clientConnection:(id)a3 requestsSendingTouchEvent:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __76__TVRDServer_clientConnection_requestsSendingTouchEvent_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  id v11 = a5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __76__TVRDServer_clientConnection_requestsSendingTouchEvent_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v5 = v2;
    [v2 sendTouchEvent:*(void *)(a1 + 48)];
    BOOL v3 = [*(id *)(a1 + 48) phase] == (id)1;
    v2 = v5;
    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) irSessionManager];
      [v4 didInteractWithDevice:v5];

      v2 = v5;
    }
  }
}

- (void)clientConnection:(id)a3 fetchUpNextInfoForDeviceWithIdentifier:(id)a4 paginationToken:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __97__TVRDServer_clientConnection_fetchUpNextInfoForDeviceWithIdentifier_paginationToken_completion___block_invoke;
  v11[3] = &unk_10001C8F8;
  v11[4] = self;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

uint64_t __97__TVRDServer_clientConnection_fetchUpNextInfoForDeviceWithIdentifier_paginationToken_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 fetchUpNextInfoWithPaginationToken:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
  }

  return _objc_release_x4();
}

- (void)clientConnection:(id)a3 addItemForDeviceWithIdentifier:(id)a4 mediaIdentifier:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __89__TVRDServer_clientConnection_addItemForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke;
  v11[3] = &unk_10001C8F8;
  v11[4] = self;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

uint64_t __89__TVRDServer_clientConnection_addItemForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 addItemWithMediaIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
  }

  return _objc_release_x4();
}

- (void)clientConnection:(id)a3 markAsWatchedForDeviceWithIdentifier:(id)a4 mediaIdentifier:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __95__TVRDServer_clientConnection_markAsWatchedForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke;
  v11[3] = &unk_10001C8F8;
  v11[4] = self;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

uint64_t __95__TVRDServer_clientConnection_markAsWatchedForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 markAsWatchedWithMediaIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
  }

  return _objc_release_x4();
}

- (void)clientConnection:(id)a3 removeItemForDeviceWithIdentifier:(id)a4 mediaIdentifier:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __92__TVRDServer_clientConnection_removeItemForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke;
  v11[3] = &unk_10001C8F8;
  v11[4] = self;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

uint64_t __92__TVRDServer_clientConnection_removeItemForDeviceWithIdentifier_mediaIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 removeItemWithMediaIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
  }

  return _objc_release_x4();
}

- (void)clientConnection:(id)a3 playItem:(id)a4 deviceIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __68__TVRDServer_clientConnection_playItem_deviceIdentifier_completion___block_invoke;
  v13[3] = &unk_10001C8F8;
  v13[4] = self;
  id v14 = a5;
  id v15 = v9;
  id v16 = a6;
  id v10 = v16;
  id v11 = v9;
  id v12 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

uint64_t __68__TVRDServer_clientConnection_playItem_deviceIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 playItem:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
    }
  }

  return _objc_release_x4();
}

- (void)clientConnection:(id)a3 requestsSendingInputText:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__TVRDServer_clientConnection_requestsSendingInputText_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  id v11 = a5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __75__TVRDServer_clientConnection_requestsSendingInputText_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = v2;
    BOOL v3 = [v2 keyboardController];
    [v3 setText:*(void *)(a1 + 48)];

    uint64_t v2 = v4;
  }
}

- (void)clientConnection:(id)a3 requestsSendingInputReturnKeyToDeviceIdentifier:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __79__TVRDServer_clientConnection_requestsSendingInputReturnKeyToDeviceIdentifier___block_invoke;
  v5[3] = &unk_10001C858;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void __79__TVRDServer_clientConnection_requestsSendingInputReturnKeyToDeviceIdentifier___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v1)
  {
    id v3 = v1;
    uint64_t v2 = [v1 keyboardController];
    [v2 sendReturnKey];

    v1 = v3;
  }
}

- (void)clientConnection:(id)a3 requestsSendingInputDataPayload:(id)a4 toDeviceIdentifier:(id)a5
{
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __82__TVRDServer_clientConnection_requestsSendingInputDataPayload_toDeviceIdentifier___block_invoke;
  block[3] = &unk_10001C8D0;
  block[4] = self;
  id v11 = a5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __82__TVRDServer_clientConnection_requestsSendingInputDataPayload_toDeviceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v4 = v2;
    id v3 = [v2 keyboardController];
    [v3 sendTextActionPayload:*(void *)(a1 + 48)];

    uint64_t v2 = v4;
  }
}

- (void)clientConnectionRequestsStartingDeviceQuery:(id)a3 withResponse:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __71__TVRDServer_clientConnectionRequestsStartingDeviceQuery_withResponse___block_invoke;
  block[3] = &unk_10001C920;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __71__TVRDServer_clientConnectionRequestsStartingDeviceQuery_withResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = _TVRDXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ requested starting general device query", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 56) addObject:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
  if ([*(id *)(*(void *)(a1 + 40) + 56) count] == (id)1)
  {
    [*(id *)(a1 + 40) _startGeneralDeviceQuery];
  }
  else
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 80) devices];
    id v6 = +[TVRCDeviceState setOfStatesFromDevices:v5];

    id v7 = [*(id *)(a1 + 32) remoteObjectProxy];
    [v7 deviceQueryUpdatedDiscoveredDevices:v6];
  }
}

- (void)clientConnectionRequestsEndingDeviceQuery:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __56__TVRDServer_clientConnectionRequestsEndingDeviceQuery___block_invoke;
  v5[3] = &unk_10001C858;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void __56__TVRDServer_clientConnectionRequestsEndingDeviceQuery___block_invoke(uint64_t a1)
{
  uint64_t v2 = _TVRDXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ requested ending general device query", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 56) removeObject:*(void *)(a1 + 32)];
  if ([*(id *)(*(void *)(a1 + 40) + 56) count])
  {
    id v4 = _TVRDXPCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 56);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not ending device query - %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) _stopGeneralDeviceQuery];
  }
}

- (void)clientConnection:(id)a3 requestsSuggestedDeviceWithResponse:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__TVRDServer_clientConnection_requestsSuggestedDeviceWithResponse___block_invoke;
  block[3] = &unk_10001C920;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __67__TVRDServer_clientConnection_requestsSuggestedDeviceWithResponse___block_invoke(uint64_t a1)
{
  uint64_t v2 = _TVRDXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ requested suggested device", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) irSessionManager];
  uint64_t v5 = [v4 suggestedDevices];

  id v6 = +[TVRCDeviceState arrayOfStatesFromDevices:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)clientConnectionSeveredConnection:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_clientConnections removeObject:v4];
  uint64_t v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NSMutableSet *)self->_clientConnections count];
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2048;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removed %{public}@. Total connections: %ld", (uint8_t *)&v7, 0x16u);
  }
}

- (void)clientConnection:(id)a3 requestsSendingEvent:(id)a4 toDeviceWithIdentifier:(id)a5 options:(id)a6 response:(id)a7
{
  id v11 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __92__TVRDServer_clientConnection_requestsSendingEvent_toDeviceWithIdentifier_options_response___block_invoke;
  block[3] = &unk_10001C948;
  void block[4] = self;
  id v17 = a5;
  id v18 = v11;
  id v19 = a6;
  id v20 = a7;
  id v12 = v20;
  id v13 = v19;
  id v14 = v11;
  id v15 = v17;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __92__TVRDServer_clientConnection_requestsSendingEvent_toDeviceWithIdentifier_options_response___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _cachedDeviceForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = v2;
    [v2 sendEvent:*(void *)(a1 + 48) options:*(void *)(a1 + 56) response:*(void *)(a1 + 64)];
    uint64_t v2 = v3;
  }
}

- (void)clientConnection:(id)a3 requestsEnablingRemoteOnLockscreen:(BOOL)a4 forDeviceWithIdentifier:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __90__TVRDServer_clientConnection_requestsEnablingRemoteOnLockscreen_forDeviceWithIdentifier___block_invoke;
  v9[3] = &unk_10001C970;
  BOOL v13 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = self;
  id v7 = v11;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

void __90__TVRDServer_clientConnection_requestsEnablingRemoteOnLockscreen_forDeviceWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = _TVRDXPCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v3 = *(const __CFString **)(a1 + 32);
    CFStringRef v4 = @"enable";
    if (!*(unsigned char *)(a1 + 56)) {
      CFStringRef v4 = @"disable";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v19 = v3;
    __int16 v20 = 2112;
    CFStringRef v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ requested to %@ remote on lockscreen", buf, 0x16u);
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v5 = [*(id *)(a1 + 48) _cachedDeviceForIdentifier:];
    id v6 = v5;
    BOOL v7 = !v5 || [v5 connectionType] != (id)1 || [v6 attentionState] != (id)1;
    id v8 = _TVRDXPCLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        CFStringRef v9 = @"awake";
      }
      else {
        CFStringRef v9 = @"asleep";
      }
      id v10 = (char *)[v6 attentionState];
      if ((unint64_t)(v10 - 1) >= 3)
      {
        id v11 = +[NSString stringWithFormat:@"(unknown: %ld)", v10];
      }
      else
      {
        id v11 = off_10001CA30[(void)(v10 - 1)];
      }
      [v6 connectionType];
      BOOL v13 = TVRCDeviceConnectionTypeDescription();
      *(_DWORD *)buf = 138412802;
      CFStringRef v19 = v9;
      __int16 v20 = 2114;
      CFStringRef v21 = v11;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device is %@ attentionState:%{public}@ connectionType:%{public}@", buf, 0x20u);
    }
    if (*(unsigned char *)(a1 + 56)) {
      char v14 = v7;
    }
    else {
      char v14 = 1;
    }
    if (v14)
    {
      if (*(unsigned char *)(a1 + 56))
      {
LABEL_28:
        id v15 = +[TVRDAssertionManager sharedInstance];
        [v15 acquireLockScreenAssertion];
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      id v16 = [*(id *)(a1 + 48) systemMonitor];
      unsigned __int8 v17 = [v16 screenLocked];

      if (v17) {
        goto LABEL_28;
      }
    }
    id v15 = +[TVRDAssertionManager sharedInstance];
    [v15 releaseLockScreenAssertion];
    goto LABEL_31;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    id v12 = _TVRDXPCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Client requested to enable lock screen assertion for nil device identifier. Releasing lock screen assertion", buf, 2u);
    }
  }
  id v6 = +[TVRDAssertionManager sharedInstance];
  [v6 releaseLockScreenAssertion];
LABEL_32:
}

- (BOOL)clientConnection:(id)a3 isConnectedToDeviceWithIdentifier:(id)a4
{
  CFStringRef v4 = [(TVRDServer *)self _cachedDeviceForIdentifier:a4];
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = [v4 connectionState] == (id)2;
  }
  else {
    BOOL v6 = 0;
  }
  BOOL v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 1024;
    BOOL v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Connection to %{public}@ : %d", (uint8_t *)&v9, 0x12u);
  }

  return v6;
}

- (void)clientConnection:(id)a3 requestsEnablingFindingSession:(BOOL)a4 forDeviceWithIdentifier:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __86__TVRDServer_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier___block_invoke;
  v9[3] = &unk_10001C970;
  BOOL v13 = a4;
  id v10 = a3;
  __int16 v11 = self;
  id v12 = a5;
  id v7 = v12;
  id v8 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
}

void __86__TVRDServer_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  CFStringRef v3 = _TVRDXPCLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 138543362;
      uint64_t v12 = v5;
      BOOL v6 = "Client connection %{public}@ requested to start finding session";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v4)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v7;
    BOOL v6 = "Client connection %{public}@ requested to stop finding session";
    goto LABEL_6;
  }

  id v8 = [*(id *)(a1 + 40) _cachedDeviceForIdentifier:*(void *)(a1 + 48)];
  int v9 = v8;
  if (v8 && [v8 connectionType] == (id)1)
  {
    [v9 _enableFindingSession:*(unsigned __int8 *)(a1 + 56)];
  }
  else
  {
    id v10 = _TVRDXPCLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __86__TVRDServer_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier___block_invoke_cold_1();
    }
  }
}

- (void)deviceBeganConnecting:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device started connecting: %{public}@", buf, 0xCu);
  }

  BOOL v6 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = _TVRDXPCLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v20 = v11;
          __int16 v21 = 2114;
          id v22 = v4;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device started connecting: %{public}@", buf, 0x16u);
        }

        BOOL v13 = [v11 remoteObjectProxy];
        char v14 = +[TVRCDeviceState deviceStateFromDevice:v4];
        [v13 deviceUpdatedState:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v8);
  }
}

- (BOOL)deviceShouldAllowConnectionAuthentication:(id)a3
{
  return 1;
}

- (void)device:(id)a3 encounteredAuthenticationChallenge:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Encountered auth challenge for device: %{public}@", buf, 0xCu);
  }

  authChallengesByID = self->_authChallengesByID;
  id v10 = [v6 identifier];
  int v11 = [(NSMutableDictionary *)authChallengesByID objectForKey:v10];

  if (v11)
  {
    uint64_t v12 = _TVRDXPCLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Already a pending auth challenge for device %@, cancelling.", buf, 0xCu);
    }

    [v11 cancel];
  }
  long long v28 = v11;
  BOOL v13 = self->_authChallengesByID;
  char v14 = [v6 identifier];
  [(NSMutableDictionary *)v13 setObject:v7 forKey:v14];

  long long v15 = self;
  long long v16 = v6;
  [(TVRDServer *)v15 _interestedClientProcessConnectionsForDevice:v6];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v17 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v31;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        __int16 v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v22 = _TVRDXPCLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v36 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending auth challenge to interested client %{public}@", buf, 0xCu);
        }

        v23 = [v21 remoteObjectProxy];
        long long v24 = +[TVRCDeviceState deviceStateFromDevice:v16];
        id v25 = [v7 challengeType];
        id v26 = [v7 challengeAttributes];
        long long v27 = [v7 codeToEnterOnDevice];
        [v23 deviceWithState:v24
encounteredAuthChallengeOfType:v25
attributes:v26
codeToEnterOnDevice:v27
throttleSeconds:[v7 throttleSeconds]];
      }
      id v18 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v18);
  }
}

- (void)deviceConnected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Device became connected: %{public}@", buf, 0xCu);
  }

  authChallengesByID = self->_authChallengesByID;
  id v7 = [v4 identifier];
  [(NSMutableDictionary *)authChallengesByID removeObjectForKey:v7];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = [v4 allIdentifiers];
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NSCountedSet *)self->_deviceIdentifiers addObject:*(void *)(*((void *)&v28 + 1) + 8 * i)];
      }
      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v10);
  }

  BOOL v13 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
        uint64_t v19 = _TVRDXPCLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v33 = v18;
          __int16 v34 = 2114;
          id v35 = v4;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device became connected: %{public}@", buf, 0x16u);
        }

        id v20 = [v18 remoteObjectProxy];
        __int16 v21 = +[TVRCDeviceState deviceStateFromDevice:v4];
        [v20 deviceUpdatedState:v21];
      }
      id v15 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v15);
  }
  objc_storeWeak((id *)&self->_lastConnectedDevice, v4);
  id v22 = +[NSDate date];
  lastConnectionTimestamp = self->_lastConnectionTimestamp;
  self->_lastConnectionTimestamp = v22;

  [(TVRDServer *)self _switchToCurrentUserProfileForDevice:v4];
}

- (void)_switchToCurrentUserProfileForDevice:(id)a3
{
  id v3 = a3;
  if ([v3 attentionState] == (id)1)
  {
    id v4 = +[ACAccountStore defaultStore];
    uint64_t v5 = [v4 ams_activeiCloudAccount];
    id v6 = [v5 aa_altDSID];

    if (v6)
    {
      uint64_t v7 = TVRCSwitchActiveUserAccountEvent;
      uint64_t v15 = TVRCiCloudAltDSID;
      uint64_t v16 = v6;
      id v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __51__TVRDServer__switchToCurrentUserProfileForDevice___block_invoke;
      v11[3] = &unk_10001C998;
      id v6 = v6;
      uint64_t v12 = v6;
      [v3 sendEvent:v7 options:v8 response:v11];
    }
  }
  else
  {
    id v6 = _TVRDXPCLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (char *)[v3 attentionState];
      if ((unint64_t)(v9 - 1) >= 3)
      {
        id v10 = +[NSString stringWithFormat:@"(unknown: %ld)", v9];
      }
      else
      {
        id v10 = off_10001CA30[(void)(v9 - 1)];
      }
      *(_DWORD *)buf = 138543362;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device is: %{public}@. Ignore switching users", buf, 0xCu);
    }
  }
}

void __51__TVRDServer__switchToCurrentUserProfileForDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = _TVRDXPCLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__TVRDServer__switchToCurrentUserProfileForDevice___block_invoke_cold_1();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully switched to account %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)device:(id)a3 disconnectedForReason:(int64_t)a4 error:(id)a5
{
  id v7 = a3;
  id v30 = a5;
  uint64_t v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device disconnected: %{public}@", buf, 0xCu);
  }

  authChallengesByID = self->_authChallengesByID;
  uint64_t v10 = [v7 identifier];
  [(NSMutableDictionary *)authChallengesByID removeObjectForKey:v10];

  [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v7];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v36;
    *(void *)&long long v12 = 138543618;
    long long v27 = v12;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v15);
        id v17 = _TVRDXPCLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v27;
          id v41 = v16;
          __int16 v42 = 2114;
          id v43 = v7;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device disconnected: %{public}@", buf, 0x16u);
        }

        id v18 = +[TVRCDeviceState deviceStateFromDevice:v7];
        [v18 setDisconnectReason:a4];
        [v18 setDisconnectError:v30];
        uint64_t v19 = [v16 remoteObjectProxy];
        [v19 deviceUpdatedState:v18];

        id v20 = [v7 identifier];
        [v16 removeInterestForDeviceWithIdentifier:v20];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        __int16 v21 = [v7 alternateIdentifiers];
        id v22 = [v21 allValues];

        id v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v32;
          do
          {
            long long v26 = 0;
            do
            {
              if (*(void *)v32 != v25) {
                objc_enumerationMutation(v22);
              }
              [v16 removeInterestForDeviceWithIdentifier:*(void *)(*((void *)&v31 + 1) + 8 * (void)v26), v27];
              long long v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            id v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v24);
        }

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v13);
  }
}

- (void)deviceNameChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = _TVRDXPCLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v19 = v10;
          __int16 v20 = 2114;
          id v21 = v4;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device name changed: %{public}@", buf, 0x16u);
        }

        long long v12 = [v10 remoteObjectProxy];
        id v13 = +[TVRCDeviceState deviceStateFromDevice:v4];
        [v12 deviceUpdatedState:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)device:(id)a3 updatedSupportedButtons:(id)a4
{
  id v5 = a3;
  id v6 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = _TVRDXPCLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          __int16 v20 = v11;
          __int16 v21 = 2114;
          id v22 = v5;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated supported buttons: %{public}@", buf, 0x16u);
        }

        id v13 = [v11 remoteObjectProxy];
        long long v14 = +[TVRCDeviceState deviceStateFromDevice:v5];
        [v13 deviceUpdatedState:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)device:(id)a3 updatedAttentionState:(int64_t)a4
{
  id v6 = (__CFString *)a3;
  id v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(__CFString *)v6 name];
    if ((unint64_t)(a4 - 1) >= 3)
    {
      uint64_t v9 = +[NSString stringWithFormat:@"(unknown: %ld)", a4];
    }
    else
    {
      uint64_t v9 = off_10001CA30[a4 - 1];
    }
    *(_DWORD *)buf = 138543618;
    long long v26 = v8;
    __int16 v27 = 2114;
    long long v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ updateState to: %{public}@", buf, 0x16u);
  }
  switch(a4)
  {
    case 0:
    case 3:
      uint64_t v10 = +[TVRDAssertionManager sharedInstance];
      [v10 acquireLockScreenAssertion];
      goto LABEL_10;
    case 1:
      uint64_t v10 = +[TVRDAssertionManager sharedInstance];
      [v10 releaseLockScreenAssertion];
      goto LABEL_10;
    case 2:
      uint64_t v10 = +[TVRDAssertionManager sharedInstance];
      [v10 startAssertionExpirationTimer];
LABEL_10:

      break;
    default:
      break;
  }
  id v11 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v17 = _TVRDXPCLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          long long v26 = v16;
          __int16 v27 = 2114;
          long long v28 = v6;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device's attention state updated: %{public}@", buf, 0x16u);
        }

        long long v18 = [v16 remoteObjectProxy];
        uint64_t v19 = +[TVRCDeviceState deviceStateFromDevice:v6];
        [v18 deviceUpdatedState:v19];
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)device:(id)a3 updatedSiriRemoteFindingState:(int64_t)a4
{
  id v6 = a3;
  id v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (unint64_t)a4 < 7 && ((0x77u >> a4))
    {
      uint64_t v9 = off_10001CA48[a4];
    }
    else
    {
      id v8 = +[NSNumber numberWithInteger:a4];
      uint64_t v9 = +[NSString stringWithFormat:@"Unknown %@", v8];
    }
    *(_DWORD *)buf = 138543362;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Updated remote finding state to: %{public}@", buf, 0xCu);
  }
  uint64_t v10 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(__CFString **)(*((void *)&v19 + 1) + 8 * i);
        long long v16 = _TVRDXPCLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v24 = v15;
          __int16 v25 = 2114;
          id v26 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that siri remote finding session was updated: %{public}@", buf, 0x16u);
        }

        long long v17 = [(__CFString *)v15 remoteObjectProxy];
        long long v18 = +[TVRCDeviceState deviceStateFromDevice:v6];
        [v17 deviceUpdatedState:v18];
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v12);
  }
}

- (void)device:(id)a3 updatedPairedRemoteInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = v6;
    __int16 v26 = 2114;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "'%{public}@' pairedRemoteInfo: %{public}@", buf, 0x16u);
  }
  long long v18 = v7;

  uint64_t v9 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = _TVRDXPCLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v25 = v14;
          __int16 v26 = 2114;
          id v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that paired remote was updated: %{public}@", buf, 0x16u);
        }

        long long v16 = [v14 remoteObjectProxy];
        long long v17 = +[TVRCDeviceState deviceStateFromDevice:v6];
        [v16 deviceUpdatedState:v17];
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)device:(id)a3 updatedNowPlayingInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = v6;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "'%{public}@' nowPlayingInfo: %@", buf, 0x16u);
  }
  long long v18 = v7;

  uint64_t v9 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v15 = _TVRDXPCLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v25 = v14;
          __int16 v26 = 2114;
          id v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that now playing info was updated: %{public}@", buf, 0x16u);
        }

        long long v16 = [v14 remoteObjectProxy];
        long long v17 = +[TVRCDeviceState deviceStateFromDevice:v6];
        [v16 deviceUpdatedState:v17];
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = "no";
    if (v4) {
      id v8 = "yes";
    }
    *(_DWORD *)buf = 138543618;
    id v40 = v6;
    __int16 v41 = 2080;
    __int16 v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "'%{public}@' supports find my remote: %s", buf, 0x16u);
  }

  generalDeviceQuery = self->_generalDeviceQuery;
  if (generalDeviceQuery && [(TVRXDeviceQuery *)generalDeviceQuery isRunning]) {
    [(TVRDServer *)self deviceQueryDidUpdateDevices:self->_generalDeviceQuery];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = self->_clientConnections;
  id v10 = [(NSMutableSet *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v35;
    uint64_t v14 = &CFGetInt64_ptr;
    *(void *)&long long v11 = 138543618;
    long long v31 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v17 = v14[109];
        long long v18 = [v6 alternateIdentifiers:v31];
        long long v19 = [v18 allValues];
        long long v20 = [v17 setWithArray:v19];

        long long v21 = [v16 deviceIdentifiers];
        long long v22 = [v6 identifier];
        if ([v21 containsObject:v22])
        {
        }
        else
        {
          [v16 deviceIdentifiers];
          id v23 = v6;
          id v24 = v12;
          uint64_t v25 = v13;
          id v27 = v26 = v14;
          unsigned int v33 = [v27 intersectsSet:v20];

          uint64_t v14 = v26;
          uint64_t v13 = v25;
          id v12 = v24;
          id v6 = v23;

          if (!v33) {
            goto LABEL_19;
          }
        }
        long long v28 = _TVRDXPCLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v31;
          id v40 = v16;
          __int16 v41 = 2114;
          __int16 v42 = (const char *)v6;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that paired remote was updated: %{public}@", buf, 0x16u);
        }

        long long v29 = [v16 remoteObjectProxy];
        id v30 = +[TVRCDeviceState deviceStateFromDevice:v6];
        [v29 deviceUpdatedState:v30];

LABEL_19:
      }
      id v12 = [(NSMutableSet *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }
}

- (void)devicePoweredOff:(id)a3
{
  id v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[TVRDServer devicePoweredOff:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  BOOL v4 = +[TVRDAssertionManager sharedInstance];
  [v4 releaseLockScreenAssertion];
}

- (void)keyboardController:(id)a3 beganTextEditingWithAttributes:(id)a4
{
  -[TVRDServer _deviceForKeyboardController:](self, "_deviceForKeyboardController:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v6 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v5];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = _TVRDXPCLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v23 = v11;
            __int16 v24 = 2114;
            id v25 = v5;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated keyboard state: %{public}@", buf, 0x16u);
          }

          uint64_t v13 = [v11 remoteObjectProxy];
          uint64_t v14 = +[TVRCDeviceState deviceStateFromDevice:v5];
          [v13 deviceUpdatedState:v14];
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v8);
    }
    [(NSDate *)self->_lastConnectionTimestamp timeIntervalSinceNow];
    if (fabs(v15) < 5.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_lastConnectedDevice);

      if (WeakRetained == v5)
      {
        lastConnectionTimestamp = self->_lastConnectionTimestamp;
        self->_lastConnectionTimestamp = 0;

        objc_storeWeak((id *)&self->_lastConnectedDevice, 0);
      }
    }
  }
}

- (void)keyboardControllerEndedTextEditing:(id)a3
{
  BOOL v4 = [(TVRDServer *)self _deviceForKeyboardController:a3];
  if (v4)
  {
    id v5 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v11 = _TVRDXPCLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            long long v19 = v10;
            __int16 v20 = 2114;
            long long v21 = v4;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated keyboard state: %{public}@", buf, 0x16u);
          }

          id v12 = [v10 remoteObjectProxy];
          uint64_t v13 = +[TVRCDeviceState deviceStateFromDevice:v4];
          [v12 deviceUpdatedState:v13];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v7);
    }
  }
}

- (void)keyboardController:(id)a3 didUpdateText:(id)a4
{
  id v5 = -[TVRDServer _deviceForKeyboardController:](self, "_deviceForKeyboardController:", a3, a4);
  if (v5)
  {
    id v6 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = _TVRDXPCLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            __int16 v20 = v11;
            __int16 v21 = 2114;
            long long v22 = v5;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated keyboard state: %{public}@", buf, 0x16u);
          }

          uint64_t v13 = [v11 remoteObjectProxy];
          long long v14 = +[TVRCDeviceState deviceStateFromDevice:v5];
          [v13 deviceUpdatedState:v14];
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v8);
    }
  }
}

- (void)keyboardController:(id)a3 didUpdateAttributes:(id)a4
{
  id v5 = -[TVRDServer _deviceForKeyboardController:](self, "_deviceForKeyboardController:", a3, a4);
  if (v5)
  {
    id v6 = [(TVRDServer *)self _interestedClientProcessConnectionsForDevice:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v12 = _TVRDXPCLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            __int16 v20 = v11;
            __int16 v21 = 2114;
            long long v22 = v5;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Broadcasting to %{public}@, that device updated keyboard state: %{public}@", buf, 0x16u);
          }

          uint64_t v13 = [v11 remoteObjectProxy];
          long long v14 = +[TVRCDeviceState deviceStateFromDevice:v5];
          [v13 deviceUpdatedState:v14];
        }
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v8);
    }
  }
}

- (void)_becameInterestedInDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server became interested in %{public}@", buf, 0xCu);
  }

  id v6 = [(TVRDServer *)self _deviceForIdentifierInDeviceQuery:v4];
  if (v6)
  {
    id v7 = _TVRDXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(TVRDServer *)self cachedDevices];
      *(_DWORD *)buf = 138543618;
      id v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device Query contains device %{public}@. Adding to cachedDevices: %@", buf, 0x16u);
    }
    [(NSMutableSet *)self->_cachedDevices addObject:v6];
    [(TVRDServer *)self _connectToDeviceIfNeeded:v6];
  }
  else
  {
    unsigned int v9 = [(TVRXDeviceQuery *)self->_generalDeviceQuery isRunning];
    id v10 = _TVRDXPCLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412546;
        id v17 = 0;
        __int16 v18 = 2048;
        uint64_t v19 = 0x4024000000000000;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Device Query does not contain device %@, but device query is running. Putting a %.1f second timer to find the device", buf, 0x16u);
      }

      [(NSMutableSet *)self->_identifiersRequestingConnection addObject:v4];
      [(TVRDServer *)self performSelector:"_informClientCouldNotLocateDeviceWithIdentifier:" withObject:v4 afterDelay:10.0];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        id v17 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No device query running. Will attempt to locate device with ID %{public}@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      deviceSearch = self->_deviceSearch;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __54__TVRDServer__becameInterestedInDeviceWithIdentifier___block_invoke;
      v13[3] = &unk_10001C9C0;
      objc_copyWeak(&v15, (id *)buf);
      v13[4] = self;
      id v14 = v4;
      [(TVRXDeviceLocator *)deviceSearch findDeviceWithIdentifier:v14 timeout:v13 completion:10.0];

      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __54__TVRDServer__becameInterestedInDeviceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = _TVRDXPCLog();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) cachedDevices];
      int v14 = 138543618;
      id v15 = v3;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Search found device %{public}@. Adding to cachedDevices: %@", (uint8_t *)&v14, 0x16u);
    }
    [WeakRetained[4] addObject:v3];
    [WeakRetained _connectToDeviceIfNeeded:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __54__TVRDServer__becameInterestedInDeviceWithIdentifier___block_invoke_cold_1(a1, v6, v8, v9, v10, v11, v12, v13);
    }

    [WeakRetained _informClientCouldNotLocateDeviceWithIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)_informClientCouldNotLocateDeviceWithIdentifier:(id)a3
{
  identifiersRequestingConnection = self->_identifiersRequestingConnection;
  id v5 = a3;
  [(NSMutableSet *)identifiersRequestingConnection removeObject:v5];
  id v7 = [objc_alloc((Class)TVRXDevice) _init];
  [v7 _setIdentifier:v5 alternateIdentifiers:&__NSDictionary0__struct name:0 model:0 supportedButtons:0];

  id v6 = TVRCMakeError();
  [(TVRDServer *)self device:v7 disconnectedForReason:3 error:v6];
}

- (id)_deviceForIdentifierInDeviceQuery:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(TVRXDeviceQuery *)self->_generalDeviceQuery devices];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 containsIdentifier:v4])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_lostInterestInDeviceWithIdentifier:(id)a3
{
  id v4 = a3;
  [(TVRXDeviceLocator *)self->_deviceSearch cancelSearchForDeviceWithIdentifier:v4];
  id v5 = [(NSMutableDictionary *)self->_authChallengesByID objectForKey:v4];
  [v5 cancel];
  [(NSMutableDictionary *)self->_authChallengesByID removeObjectForKey:v4];
  id v6 = [(TVRDServer *)self _cachedDeviceForIdentifier:v4];
  if (v6)
  {
    uint64_t v7 = _TVRDXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v4;
      __int16 v12 = 2114;
      long long v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server lost interest in %{public}@, calling -disconnect on TVRCDevice %{public}@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v8 = [v6 keyboardController];
    [v8 setDelegate:0];

    [v6 disconnect];
    [(NSMutableSet *)self->_cachedDevices removeObject:v6];
  }
  if ([(NSMutableSet *)self->_identifiersRequestingConnection containsObject:v4])
  {
    uint64_t v9 = _TVRDXPCLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Server lost interest in %{public}@, removing identifier", (uint8_t *)&v10, 0xCu);
    }

    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_informClientCouldNotLocateDeviceWithIdentifier:" object:v4];
    [(NSMutableSet *)self->_identifiersRequestingConnection removeObject:v4];
  }
}

- (id)_interestedClientProcessConnectionsForDevice:(id)a3
{
  id v4 = a3;
  id v23 = objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = self->_clientConnections;
  id v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    uint64_t v8 = &CFGetInt64_ptr;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = v8[109];
        __int16 v12 = [v4 alternateIdentifiers];
        long long v13 = [v12 allValues];
        long long v14 = [v11 setWithArray:v13];

        id v15 = [v10 deviceIdentifiers];
        __int16 v16 = [v4 identifier];
        if ([v15 containsObject:v16])
        {
        }
        else
        {
          [v10 deviceIdentifiers];
          id v17 = v6;
          uint64_t v18 = v7;
          v20 = uint64_t v19 = v8;
          unsigned int v24 = [v20 intersectsSet:v14];

          uint64_t v8 = v19;
          uint64_t v7 = v18;
          id v6 = v17;

          if (!v24) {
            goto LABEL_10;
          }
        }
        [v23 addObject:v10];
LABEL_10:
      }
      id v6 = [(NSMutableSet *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  return v23;
}

- (id)_deviceForKeyboardController:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_cachedDevices;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 keyboardController:v12];
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_hasNowPlayingControlsForButtons:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [(TVRDServer *)self _isButtonOfNowPlayingType:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

- (BOOL)_isButtonOfNowPlayingType:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 buttonType];
  return (v3 & 0xFFFFFFFFFFFFFFFELL) == 6 || (v3 & 0xFFFFFFFFFFFFFFFELL) == 8 || v3 == 31;
}

- (void)_connectToDeviceIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connecting to device: %{public}@", buf, 0xCu);
  }

  [v4 setDelegate:self];
  id v6 = [v4 keyboardController];
  [v6 setDelegate:self];

  if ([v4 connectionState] == (id)2)
  {
    int v7 = _TVRDXPCLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device %{public}@ is already connected, informing clients...", buf, 0xCu);
    }

    [(TVRDServer *)self deviceConnected:v4];
  }
  else
  {
    if ([v4 connectionState] == (id)1)
    {
      [v4 setDelegate:0];
      [v4 disconnect];
    }
    [v4 setDelegate:self];
    [v4 connect];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v4 allIdentifiers];
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v12);
        long long v14 = [(TVRDServer *)self connectionContextByID];
        long long v15 = [v14 allKeys];
        unsigned int v16 = [v15 containsObject:v13];

        if (v16)
        {
          id v17 = [(TVRDServer *)self connectionContextByID];
          uint64_t v18 = [v17 objectForKeyedSubscript:v13];
          id v19 = [v18 integerValue];

          __int16 v20 = [(TVRDServer *)self irSessionManager];
          [v20 updateDevice:v4 withConnectionContext:v19];
        }
        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

- (id)_cachedDeviceForIdentifier:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_cachedDevices;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsIdentifier:", v4, (void)v11))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_startGeneralDeviceQuery
{
  unint64_t v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting general device query", (uint8_t *)&v9, 2u);
  }

  id v4 = _TVRDXPCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(TVRDServer *)self cachedDevices];
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Existing cached devices: %@", (uint8_t *)&v9, 0xCu);
  }
  if (!self->_generalDeviceQuery)
  {
    id v6 = (TVRXDeviceQuery *)objc_alloc_init((Class)TVRXDeviceQuery);
    generalDeviceQuery = self->_generalDeviceQuery;
    self->_generalDeviceQuery = v6;

    [(TVRXDeviceQuery *)self->_generalDeviceQuery setDelegate:self];
  }
  uint64_t v8 = _TVRDXPCLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing cached devices", (uint8_t *)&v9, 2u);
  }

  [(NSMutableSet *)self->_cachedDevices removeAllObjects];
  [(TVRXDeviceQuery *)self->_generalDeviceQuery start];
  [(TVRDServer *)self _activateIRSessionManager];
}

- (void)_activateIRSessionManager
{
  irSessionManager = self->_irSessionManager;
  if (!irSessionManager)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc_init(TVRDIRSessionManager);
    id v5 = self->_irSessionManager;
    self->_irSessionManager = v4;

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = __39__TVRDServer__activateIRSessionManager__block_invoke;
    v7[3] = &unk_10001C9E8;
    objc_copyWeak(&v8, &location);
    [(TVRDIRSessionManager *)self->_irSessionManager setFilteredDeviceListHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    irSessionManager = self->_irSessionManager;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __39__TVRDServer__activateIRSessionManager__block_invoke_77;
  v6[3] = &unk_10001CA10;
  v6[4] = self;
  [(TVRDIRSessionManager *)irSessionManager activateWithCompletion:v6];
}

void __39__TVRDServer__activateIRSessionManager__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v5 = WeakRetained;
      id v6 = [WeakRetained generalDeviceQuery];
      uint64_t v7 = [v6 devices];
      id v8 = [v7 count];

      if (v8)
      {
        int v9 = +[TVRCDeviceState arrayOfStatesFromDevices:v3];
        id v10 = _TVRDXPCLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          long long v23 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "IRSessionManager updated devices with deviceStates %{public}@", buf, 0xCu);
        }

        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v11 = [v5 deviceQueryObservers];
        id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v18;
          do
          {
            long long v15 = 0;
            do
            {
              if (*(void *)v18 != v14) {
                objc_enumerationMutation(v11);
              }
              unsigned int v16 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v15) remoteObjectProxy];
              [v16 suggestedDevices:v9];

              long long v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
          }
          while (v13);
        }
      }
      else
      {
        [v5 setInformDeviceQueryObserversWithUpdatedSuggestions:1];
      }
    }
  }
}

void __39__TVRDServer__activateIRSessionManager__block_invoke_77(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TVRDXPCLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__TVRDServer__activateIRSessionManager__block_invoke_77_cold_1();
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) irSessionManager];
    [v4 requestCurrentRecommendedDevices];
  }
}

- (void)_invalidateIRSessionManager
{
  id v3 = [(TVRDServer *)self irSessionManager];
  [v3 invalidate];

  [(TVRDServer *)self setIrSessionManager:0];
}

- (void)_stopGeneralDeviceQuery
{
  id v3 = _TVRDXPCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping general device query", v6, 2u);
  }

  [(TVRXDeviceQuery *)self->_generalDeviceQuery stop];
  [(TVRXDeviceQuery *)self->_generalDeviceQuery setDelegate:0];
  generalDeviceQuery = self->_generalDeviceQuery;
  self->_generalDeviceQuery = 0;

  id v5 = [(TVRDServer *)self irSessionManager];
  [v5 pause];
}

- (void)_updateDevicesWithRecommendations:(id)a3
{
  id v4 = a3;
  id v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v41 = "-[TVRDServer _updateDevicesWithRecommendations:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(TVRDServer *)self irSessionManager];
  uint64_t v7 = [v6 suggestedDevices];
  id v8 = [v7 count];

  if (v8)
  {
    int v9 = [(TVRDServer *)self irSessionManager];
    id v10 = [v9 suggestedDevices];
    long long v11 = +[NSMutableSet setWithArray:v10];

    id v12 = [v4 mutableCopy];
    id v13 = _TVRDXPCLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[TVRDServer _updateDevicesWithRecommendations:]();
    }

    uint64_t v14 = _TVRDXPCLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[TVRDServer _updateDevicesWithRecommendations:]();
    }
    id v33 = v4;

    [v12 intersectSet:v11];
    long long v15 = _TVRDXPCLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[TVRDServer _updateDevicesWithRecommendations:]();
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v12;
    id v16 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v37;
      long long v19 = &CFGetInt64_ptr;
      uint64_t v34 = *(void *)v37;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          long long v22 = v19[107];
          long long v23 = [v21 identifier];
          long long v24 = [v22 predicateWithFormat:@"identifier ==[c] %@", v23];
          long long v25 = [v11 filteredSetUsingPredicate:v24];

          long long v26 = [v25 anyObject];
          if (v26)
          {
            id v27 = _TVRDXPCLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              [v26 conciseDescription];
              long long v28 = v11;
              long long v29 = v19;
              id v30 = (char *)objc_claimAutoreleasedReturnValue();
              [v21 conciseDescription];
              v32 = id v31 = v17;
              *(_DWORD *)buf = 138543618;
              __int16 v41 = v30;
              __int16 v42 = 2114;
              id v43 = v32;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Assigning classification from suggestedDevice: %{public}@ to device: %{public}@", buf, 0x16u);

              id v17 = v31;
              long long v19 = v29;
              long long v11 = v28;
              uint64_t v18 = v34;
            }

            [v21 setClassification:[v26 classification]];
          }
        }
        id v17 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v17);
    }

    id v4 = v33;
  }
  else
  {
    long long v11 = _TVRDXPCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "There are no suggested devices. Skipping updating devices with recommendations", buf, 2u);
    }
  }
}

- (void)deviceQueryDidUpdateDevices:(id)a3
{
  uint64_t v4 = [a3 devices];
  id v5 = _TVRDXPCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v49 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "General device query updated set of devices %{public}@", buf, 0xCu);
  }

  [(TVRDServer *)self _updateDevicesWithRecommendations:v4];
  uint64_t v6 = +[TVRCDeviceState setOfStatesFromDevices:v4];
  uint64_t v7 = _TVRDXPCLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "General device query updated deviceStates %{public}@", buf, 0xCu);
  }

  id v8 = [(TVRDServer *)self irSessionManager];
  long long v35 = (void *)v4;
  [v8 processNewDevices:v4];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  int v9 = self->_deviceQueryObservers;
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v45;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v45 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        long long v15 = [v14 remoteObjectProxy];
        [v15 deviceQueryUpdatedDiscoveredDevices:v6];

        if ([(TVRDServer *)self informDeviceQueryObserversWithUpdatedSuggestions])
        {
          id v16 = [(TVRDServer *)self irSessionManager];
          id v17 = [v16 suggestedDevices];
          uint64_t v18 = +[TVRCDeviceState arrayOfStatesFromDevices:v17];

          long long v19 = [v14 remoteObjectProxy];
          [v19 suggestedDevices:v18];

          [(TVRDServer *)self setInformDeviceQueryObserversWithUpdatedSuggestions:0];
        }
      }
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v11);
  }
  id v33 = (void *)v6;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v35;
  id v20 = [obj countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v41;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v24 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        [v24 setDelegate:self];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v25 = [v24 allIdentifiers];
        id v26 = [v25 countByEnumeratingWithState:&v36 objects:v52 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v37;
          while (2)
          {
            for (k = 0; k != v27; k = (char *)k + 1)
            {
              if (*(void *)v37 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * (void)k);
              if ([(NSMutableSet *)self->_identifiersRequestingConnection containsObject:v30])
              {
                +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_informClientCouldNotLocateDeviceWithIdentifier:" object:v30];
                [(NSMutableSet *)self->_identifiersRequestingConnection removeObject:v30];
                id v31 = _TVRDXPCLog();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  long long v32 = [(TVRDServer *)self cachedDevices];
                  *(_DWORD *)buf = 138543618;
                  uint64_t v49 = (uint64_t)v24;
                  __int16 v50 = 2112;
                  v51 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Adding %{public}@ to cachedDevices: %@", buf, 0x16u);
                }
                [(NSMutableSet *)self->_cachedDevices addObject:v24];
                [(TVRDServer *)self _connectToDeviceIfNeeded:v24];
                goto LABEL_31;
              }
            }
            id v27 = [v25 countByEnumeratingWithState:&v36 objects:v52 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }
LABEL_31:
      }
      id v21 = [obj countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v21);
  }
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (NSCountedSet)deviceIdentifiers
{
  return self->_deviceIdentifiers;
}

- (void)setDeviceIdentifiers:(id)a3
{
}

- (NSMutableSet)cachedDevices
{
  return self->_cachedDevices;
}

- (void)setCachedDevices:(id)a3
{
}

- (NSMutableDictionary)connectionContextByID
{
  return self->_connectionContextByID;
}

- (void)setConnectionContextByID:(id)a3
{
}

- (NSMutableDictionary)authChallengesByID
{
  return self->_authChallengesByID;
}

- (void)setAuthChallengesByID:(id)a3
{
}

- (NSMutableSet)deviceQueryObservers
{
  return self->_deviceQueryObservers;
}

- (void)setDeviceQueryObservers:(id)a3
{
}

- (NSMutableSet)identifiersRequestingConnection
{
  return self->_identifiersRequestingConnection;
}

- (void)setIdentifiersRequestingConnection:(id)a3
{
}

- (TVRXDeviceLocator)deviceSearch
{
  return self->_deviceSearch;
}

- (void)setDeviceSearch:(id)a3
{
}

- (TVRXDeviceQuery)generalDeviceQuery
{
  return self->_generalDeviceQuery;
}

- (void)setGeneralDeviceQuery:(id)a3
{
}

- (NSDate)lastConnectionTimestamp
{
  return self->_lastConnectionTimestamp;
}

- (void)setLastConnectionTimestamp:(id)a3
{
}

- (TVRXDevice)lastConnectedDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastConnectedDevice);

  return (TVRXDevice *)WeakRetained;
}

- (void)setLastConnectedDevice:(id)a3
{
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)setIsScreenLocked:(BOOL)a3
{
  self->_isScreenLocked = a3;
}

- (BOOL)informDeviceQueryObserversWithUpdatedSuggestions
{
  return self->_informDeviceQueryObserversWithUpdatedSuggestions;
}

- (void)setInformDeviceQueryObserversWithUpdatedSuggestions:(BOOL)a3
{
  self->_informDeviceQueryObserversWithUpdatedSuggestions = a3;
}

- (TVRDIRSessionManager)irSessionManager
{
  return self->_irSessionManager;
}

- (void)setIrSessionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irSessionManager, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_destroyWeak((id *)&self->_lastConnectedDevice);
  objc_storeStrong((id *)&self->_lastConnectionTimestamp, 0);
  objc_storeStrong((id *)&self->_generalDeviceQuery, 0);
  objc_storeStrong((id *)&self->_deviceSearch, 0);
  objc_storeStrong((id *)&self->_identifiersRequestingConnection, 0);
  objc_storeStrong((id *)&self->_deviceQueryObservers, 0);
  objc_storeStrong((id *)&self->_authChallengesByID, 0);
  objc_storeStrong((id *)&self->_connectionContextByID, 0);
  objc_storeStrong((id *)&self->_cachedDevices, 0);
  objc_storeStrong((id *)&self->_deviceIdentifiers, 0);

  objc_storeStrong((id *)&self->_clientConnections, 0);
}

void __81__TVRDServer_clientConnection_addedInterestedDeviceIdentifier_connectionContext___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)a2 + 32);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find cached device with ID %@, even though someone is already interested in that device. All cached devices - %@", (uint8_t *)&v5, 0x16u);
}

void __86__TVRDServer_clientConnection_requestsEnablingFindingSession_forDeviceWithIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Find My not avaiable for device: %{public}@", v2, v3, v4, v5, v6);
}

void __51__TVRDServer__switchToCurrentUserProfileForDevice___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Failed to switch user profile %{public}@", v2, v3, v4, v5, v6);
}

void __54__TVRDServer__becameInterestedInDeviceWithIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __39__TVRDServer__activateIRSessionManager__block_invoke_77_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Failed to active IRSession: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_updateDevicesWithRecommendations:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Queried devices subset: %@", v2, v3, v4, v5, v6);
}

- (void)_updateDevicesWithRecommendations:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Queried devices: %@", v2, v3, v4, v5, v6);
}

- (void)_updateDevicesWithRecommendations:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, v0, v1, "Suggested devices: %@", v2, v3, v4, v5, v6);
}

@end