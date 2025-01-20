@interface UABestAppSuggestionManager
- (BOOL)determineBestAppWithDelay:(double)a3 withBlock:(id)a4;
- (BOOL)fetchAllNearbyAppSuggestions;
- (BOOL)isActivityInfo:(id)a3 atTime:(id)a4 similarToAppSuggestion:(id)a5;
- (NSXPCConnection)connection;
- (UABestAppSuggestionManager)init;
- (UABestAppSuggestionManagerDelegate)delegate;
- (UABestAppSuggestionManagerProxy)proxyManager;
- (id)bestAppSuggestion;
- (id)bestAppSuggestions:(int64_t)a3;
- (id)createAppSuggestionFromActivityInfo:(id)a3 atTime:(id)a4;
- (void)bestAppSuggestionLaunchWasCancelled:(id)a3;
- (void)bestAppSuggestionWasLaunched:(id)a3 withInteractionType:(unint64_t)a4;
- (void)dealloc;
- (void)invalidate;
- (void)launchAppWithBundleIdentifier:(id)a3 taskContinuationIdentifier:(id)a4;
- (void)launchAppWithBundleIdentifier:(id)a3 userActivityUniqueIdentifier:(id)a4 userActivityTypeIdentifier:(id)a5;
- (void)notifyBestAppsChanged:(id)a3 when:(id)a4 confidence:(double)a5;
- (void)queueFetchOfPayloadForBestAppSuggestion:(id)a3;
- (void)removeBestApp:(id)a3 options:(id)a4;
- (void)removeBestAppByUUID:(id)a3 options:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProxyManager:(id)a3;
- (void)startListeningForBestAppSuggestions;
- (void)stopListeningForBestAppSuggestions;
@end

@implementation UABestAppSuggestionManager

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = [(UABestAppSuggestionManager *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)UABestAppSuggestionManager;
  [(UABestAppSuggestionManager *)&v4 dealloc];
}

- (id)bestAppSuggestion
{
  v2 = [(UABestAppSuggestionManager *)self bestAppSuggestions:0];
  v3 = v2;
  if (v2)
  {
    objc_super v4 = [v2 firstObject];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (id)bestAppSuggestions:(int64_t)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = [(UABestAppSuggestionManager *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__UABestAppSuggestionManager_bestAppSuggestions___block_invoke;
  v16[3] = &unk_1E6083780;
  v7 = v5;
  v17 = v7;
  v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v16];

  if (v8)
  {
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__UABestAppSuggestionManager_bestAppSuggestions___block_invoke_27;
    v13[3] = &unk_1E6083AD0;
    v13[4] = &v18;
    objc_copyWeak(&v14, &location);
    [v8 doDetermineBestAppSuggestionWithCompletionHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  v9 = (void *)v19[5];
  if (v9 && [v9 count])
  {
    if (a3 && [(id)v19[5] count] > (unint64_t)a3)
    {
      objc_msgSend((id)v19[5], "subarrayWithRange:", 0, a3);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = (id)v19[5];
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (UABestAppSuggestionManager)init
{
  v20.receiver = self;
  v20.super_class = (Class)UABestAppSuggestionManager;
  v2 = [(UABestAppSuggestionManager *)&v20 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    objc_copyWeak(&to, (id *)&v2->_delegate);
    v3 = objc_alloc_init(UABestAppSuggestionManagerProxy);
    proxyManager = v2->_proxyManager;
    v2->_proxyManager = v3;

    [(UABestAppSuggestionManagerProxy *)v2->_proxyManager setWeakManager:v2];
    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    v6 = UABestAppSuggestionManagerServiceName();
    uint64_t v7 = [v5 initWithMachServiceName:v6 options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v7;

    v9 = _LSGetBestAppSuggestionManagerProtocolInterface();
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v9];

    id v10 = [(UABestAppSuggestionManager *)v2 proxyManager];
    [(NSXPCConnection *)v2->_connection setExportedObject:v10];

    v11 = _LSGetBestAppSuggestionManagerResponseProtocolInterface();
    [(NSXPCConnection *)v2->_connection setExportedInterface:v11];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __34__UABestAppSuggestionManager_init__block_invoke;
    v15[3] = &unk_1E6083A80;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &to);
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__UABestAppSuggestionManager_init__block_invoke_15;
    v13[3] = &unk_1E60833D0;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v13];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (UABestAppSuggestionManagerProxy)proxyManager
{
  return (UABestAppSuggestionManagerProxy *)objc_getProperty(self, a2, 40, 1);
}

void __34__UABestAppSuggestionManager_init__block_invoke_15(uint64_t a1)
{
  v2 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_DEBUG, "-- Connection to useractivityd invalidated; this object won't work anymore.",
      v4,
      2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stopListeningForBestAppSuggestions];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lastBestAppSuggestion, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __49__UABestAppSuggestionManager_bestAppSuggestions___block_invoke_27(uint64_t a1, void *a2, void *a3, double a4)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  v9 = [v7 firstObject];
  id v10 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v32 = [v9 uuid];
    v33 = [v32 UUIDString];
    v29 = suggestedActionTypeString([v9 type]);
    v28 = [v9 bundleIdentifier];
    [v9 activityType];
    v12 = v11 = v9;
    v31 = [v11 peerDevice];
    v13 = [v31 name];
    v30 = [v11 peerDevice];
    id v14 = [v30 uniqueID];
    v15 = [v11 peerDeviceType];
    *(_DWORD *)buf = 138545667;
    v40 = v33;
    __int16 v41 = 2114;
    v42 = v29;
    __int16 v43 = 2113;
    v44 = v28;
    __int16 v45 = 2113;
    v46 = v12;
    __int16 v47 = 2114;
    id v48 = v8;
    __int16 v49 = 2048;
    double v50 = a4;
    __int16 v51 = 2113;
    v52 = v13;
    __int16 v53 = 2113;
    v54 = v14;
    __int16 v55 = 2113;
    v56 = v15;
    __int16 v57 = 2048;
    uint64_t v58 = [v7 count] - 1;
    _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ %{private}@ %{private}@ %{public}@ %g %{private}@ %{private}@ %{private}@ (and %lu more app suggestions)", buf, 0x66u);

    v9 = v11;
  }

  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = v7;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v25 = [v24 uuid];

        if (v25)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
          v27 = [WeakRetained createAppSuggestionFromActivityInfo:v24 atTime:v8];

          if (v27) {
            [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v27];
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v21);
  }
}

void __34__UABestAppSuggestionManager_init__block_invoke(uint64_t a1)
{
  v2 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "-- connection to useractivityd interrupted.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (unsigned __int8 *)WeakRetained;
    objc_sync_enter(v5);
    int v6 = v5[16];
    v5[16] = 0;
    objc_sync_exit(v5);

    id v7 = (id *)(a1 + 40);
    id v8 = objc_loadWeakRetained(v7);
    if (v8
      && (v9 = v8,
          id v10 = objc_loadWeakRetained(v7),
          char v11 = objc_opt_respondsToSelector(),
          v10,
          v9,
          (v11 & 1) != 0))
    {
      v12 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_INFO, "-- calling .delegate with -(void) connectionInterrupted to tell client that the server has gone away.", v16, 2u);
      }

      id v13 = objc_loadWeakRetained(v7);
      [v13 connectionInterrupted];
    }
    else if (v6)
    {
      id v14 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1B3DF6000, v14, OS_LOG_TYPE_INFO, "-- reestablishing connection to server because it was interrupted but the client has a delegate for us to call.", v15, 2u);
      }

      [v5 startListeningForBestAppSuggestions];
    }
  }
}

- (void)removeBestAppByUUID:(id)a3 options:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v6 UUIDString];
    id v10 = [v7 description];
    char v11 = stringRemovingNewlines(v10);
    int v14 = 138543618;
    v15 = v9;
    __int16 v16 = 2114;
    uint64_t v17 = v11;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "removeBestAppByUUID:%{public}@ opts=%{public}@", (uint8_t *)&v14, 0x16u);
  }
  v12 = [(UABestAppSuggestionManager *)self connection];
  id v13 = [v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_11];

  if (v13) {
    [v13 doRemoveBestAppSuggestion:v6 options:v7];
  }
}

void __58__UABestAppSuggestionManager_removeBestAppByUUID_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)removeBestApp:(id)a3 options:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v6 uniqueIdentifier];
    id v10 = [v9 UUIDString];
    char v11 = [v7 description];
    v12 = stringRemovingNewlines(v11);
    int v14 = 138543875;
    v15 = v10;
    __int16 v16 = 2113;
    id v17 = v6;
    __int16 v18 = 2114;
    id v19 = v12;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "removeBestApp:%{public}@/%{private}@ opts=%{public}@", (uint8_t *)&v14, 0x20u);
  }
  id v13 = [v6 uniqueIdentifier];
  [(UABestAppSuggestionManager *)self removeBestAppByUUID:v13 options:v7];
}

- (void)invalidate
{
  v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "invalidate", v7, 2u);
  }

  int v4 = self;
  objc_sync_enter(v4);
  id v5 = [(UABestAppSuggestionManager *)v4 connection];

  if (v5)
  {
    id v6 = [(UABestAppSuggestionManager *)v4 connection];
    [v6 invalidate];

    [(UABestAppSuggestionManager *)v4 setConnection:0];
  }
  objc_sync_exit(v4);
}

- (void)startListeningForBestAppSuggestions
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL listeningForBestAppSuggestions = v2->_listeningForBestAppSuggestions;
  v2->_BOOL listeningForBestAppSuggestions = 1;
  objc_sync_exit(v2);

  if (!listeningForBestAppSuggestions)
  {
    int v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "-- Registering with useractivityd to receive bestAppSuggestion", v10, 2u);
    }

    id v5 = [(UABestAppSuggestionManager *)v2 connection];
    id v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_20];

    if (v6)
    {
      v2->_BOOL listeningForBestAppSuggestions = 1;
      uint64_t v7 = [(UABestAppSuggestionManager *)v2 delegate];
      id v8 = (void *)v7;
      if (v2->_lastBestAppSuggestion && v7)
      {
        if (objc_opt_respondsToSelector())
        {
          [v8 bestAppSuggestionChanged:0 withAdditionalSuggestions:0];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v8 bestAppSuggestionChanged:0];
        }
        lastBestAppSuggestion = v2->_lastBestAppSuggestion;
        v2->_lastBestAppSuggestion = 0;
      }
      [v6 doRegisterForBestAppChangeNotification];
    }
  }
}

void __65__UABestAppSuggestionManager_startListeningForBestAppSuggestions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)stopListeningForBestAppSuggestions
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL listeningForBestAppSuggestions = v2->_listeningForBestAppSuggestions;
  v2->_BOOL listeningForBestAppSuggestions = 0;
  objc_sync_exit(v2);

  if (listeningForBestAppSuggestions)
  {
    int v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "-- Unregistering with useractivityd to receive bestAppSuggestion", v7, 2u);
    }

    id v5 = [(UABestAppSuggestionManager *)v2 connection];
    uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_26];

    if (v6) {
      [v6 doUnregisterForBestAppChangeNotification];
    }
  }
}

void __64__UABestAppSuggestionManager_stopListeningForBestAppSuggestions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)determineBestAppWithDelay:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(UABestAppSuggestionManager *)self bestAppSuggestion];
  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__UABestAppSuggestionManager_determineBestAppWithDelay_withBlock___block_invoke;
    v10[3] = &unk_1E6083AA8;
    id v12 = v6;
    id v11 = v7;
    dispatch_after(v8, MEMORY[0x1E4F14428], v10);
  }
  return 0;
}

uint64_t __66__UABestAppSuggestionManager_determineBestAppWithDelay_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __49__UABestAppSuggestionManager_bestAppSuggestions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "error from xpc request to server, %{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)fetchAllNearbyAppSuggestions
{
  id v3 = _uaGetLogForCategory(@"multi-handoff");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "fetchAllNearbyAppSuggestions called", buf, 2u);
  }

  int v4 = [(UABestAppSuggestionManager *)self connection];
  int v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_34_0];

  *(void *)buf = 0;
  v9 = buf;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UABestAppSuggestionManager_fetchAllNearbyAppSuggestions__block_invoke_35;
  v7[3] = &unk_1E6083600;
  v7[4] = buf;
  [v5 fetchAllNearbyAppSuggestions:v7];
  LOBYTE(v4) = v9[24];
  _Block_object_dispose(buf, 8);

  return (char)v4;
}

void __58__UABestAppSuggestionManager_fetchAllNearbyAppSuggestions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "Error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __58__UABestAppSuggestionManager_fetchAllNearbyAppSuggestions__block_invoke_35(uint64_t a1, char a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = _uaGetLogForCategory(@"multi-handoff");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEFAULT, "expectResults: %@", (uint8_t *)&v6, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (void)queueFetchOfPayloadForBestAppSuggestion:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v4 uniqueIdentifier];
    uint64_t v7 = [v6 UUIDString];
    LODWORD(v17) = 138543362;
    *(void *)((char *)&v17 + 4) = v7;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "queueFetchOfPayloadForBestAppSuggestion:%{public}@", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v8 = [(UABestAppSuggestionManager *)self connection];
  v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_39];

  if (v9)
  {
    uint64_t v10 = _uaGetLogForCategory(@"signposts");
    char v11 = [v4 uniqueIdentifier];
    if (v11)
    {
      id v12 = v11;
      long long v17 = 0uLL;
      [v11 getUUIDBytes:&v17];
      uint64_t v13 = 0;
      os_signpost_id_t v14 = 0;
      do
      {
        os_signpost_id_t v14 = (*((unsigned char *)&v17 + v13 + 1) ^ *((unsigned char *)&v17 + v13)) | (v14 << 8);
        v13 += 2;
      }
      while (v13 != 16);

      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        v15 = [v4 uniqueIdentifier];
        LODWORD(v17) = 138543362;
        *(void *)((char *)&v17 + 4) = v15;
        _os_signpost_emit_with_name_impl(&dword_1B3DF6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v14, "fetchUserActivityQueued", "Fetching handoff payload:%{public}@", (uint8_t *)&v17, 0xCu);
      }
    }

    __int16 v16 = [v4 uniqueIdentifier];
    [v9 doQueueFetchOfPayloadForBestAppSuggestion:v16 completionHandler:&__block_literal_global_42_0];
  }
}

void __70__UABestAppSuggestionManager_queueFetchOfPayloadForBestAppSuggestion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "Error from xpc request to server, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)bestAppSuggestionWasLaunched:(id)a3 withInteractionType:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    uint64_t v7 = [(UABestAppSuggestionManager *)self connection];
    uint64_t v8 = [v7 remoteObjectProxy];

    if (v8)
    {
      v9 = [v10 uniqueIdentifier];
      [v8 doLaunchFollowUp:v9 interactionType:a4 cancelled:0];
    }
    id v6 = v10;
  }
}

- (void)bestAppSuggestionLaunchWasCancelled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    id v5 = [(UABestAppSuggestionManager *)self connection];
    id v6 = [v5 remoteObjectProxy];

    if (v6)
    {
      uint64_t v7 = [v8 uniqueIdentifier];
      [v6 doLaunchFollowUp:v7 interactionType:0 cancelled:1];
    }
    id v4 = v8;
  }
}

- (id)createAppSuggestionFromActivityInfo:(id)a3 atTime:(id)a4
{
  id v22 = a4;
  id v5 = a3;
  id v6 = [UABestAppSuggestion alloc];
  uint64_t v7 = [v5 bundleIdentifier];
  uint64_t v21 = [v5 uuid];
  uint64_t v20 = [v5 activityType];
  id v19 = [v5 dynamicActivityType];
  uint64_t v18 = [v5 when];
  uint64_t v8 = [v5 type];
  id v23 = [v5 peerDevice];
  __int16 v16 = [v23 name];
  v9 = [v5 peerDevice];
  id v10 = [v9 uniqueID];
  char v11 = [v5 peerDeviceType];
  id v12 = [v5 options];
  char v13 = [v5 active];

  LOBYTE(v15) = v13;
  long long v17 = [(UABestAppSuggestion *)v6 initWithBundleIdentifier:v7 uuid:v21 activityType:v20 dynamicIdentifier:v19 lastUpdateTime:v22 lastActiveTime:v18 type:v8 deviceName:v16 deviceIdentifier:v10 deviceType:v11 options:v12 isActive:v15];

  return v17;
}

- (BOOL)isActivityInfo:(id)a3 atTime:(id)a4 similarToAppSuggestion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    uint64_t v12 = [v9 type];
    if (v12 == [v11 type])
    {
      char v13 = [v9 uuid];
      os_signpost_id_t v14 = [v11 uniqueIdentifier];
      if (![v13 isEqual:v14])
      {
        char v16 = 0;
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v15 = [v9 bundleIdentifier];
      if (v15)
      {
        id v5 = [v9 bundleIdentifier];
        id v6 = [v11 bundleIdentifier];
        long long v36 = v5;
        if (![v5 isEqual:v6])
        {
          char v16 = 0;
          goto LABEL_28;
        }
      }
      long long v17 = [v9 activityType];
      if (v17)
      {
        uint64_t v18 = [v9 activityType];
        long long v34 = [v11 activityType];
        long long v35 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          char v16 = 0;
          goto LABEL_25;
        }
      }
      uint64_t v19 = [v9 options];
      if (v19)
      {
        id v5 = [v9 options];
        v31 = [v11 options];
        v32 = v5;
        if (!objc_msgSend(v5, "isEqual:"))
        {
          uint64_t v20 = (void *)v19;
          char v16 = 0;
          goto LABEL_22;
        }
      }
      v33 = (void *)v19;
      if (!v10
        || ([v11 when],
            id v5 = objc_claimAutoreleasedReturnValue(),
            [v10 compare:v5] == -1))
      {
        uint64_t v21 = [v9 peerDevice];
        uint64_t v22 = [v21 uniqueID];
        if (v22)
        {
          v28 = (void *)v22;
          v27 = [v9 peerDevice];
          [v27 uniqueID];
          id v23 = v30 = v6;
          [v11 originatingDeviceIdentifier];
          v24 = v29 = v5;
          v26 = v21;
          char v16 = [v23 isEqual:v24];

          id v5 = v29;
          id v6 = v30;

          if (!v10) {
            goto LABEL_21;
          }
        }
        else
        {

          char v16 = 1;
          if (!v10)
          {
LABEL_21:
            uint64_t v20 = v33;
            if (!v33)
            {
              if (!v17)
              {
LABEL_26:

                goto LABEL_27;
              }
LABEL_25:

              goto LABEL_26;
            }
LABEL_22:

            if (!v17)
            {
LABEL_27:
              if (!v15)
              {
LABEL_29:

                goto LABEL_30;
              }
LABEL_28:

              goto LABEL_29;
            }
            goto LABEL_25;
          }
        }
      }
      else
      {
        char v16 = 0;
      }

      goto LABEL_21;
    }
  }
  char v16 = 0;
LABEL_31:

  return v16;
}

- (void)notifyBestAppsChanged:(id)a3 when:(id)a4 confidence:(double)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v54 = a4;
  __int16 v55 = v8;
  v56 = [v8 firstObject];
  id v9 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v56 uuid];
    __int16 v53 = [v10 UUIDString];
    double v50 = suggestedActionTypeString([v56 type]);
    v52 = [v56 bundleIdentifier];
    __int16 v51 = [v56 activityType];
    id v11 = [v56 options];
    uint64_t v12 = [v11 description];
    __int16 v49 = stringRemovingNewlines(v12);
    char v13 = [v56 peerDevice];
    os_signpost_id_t v14 = [v13 name];
    uint64_t v15 = [v56 peerDevice];
    char v16 = [v15 uniqueID];
    *(_DWORD *)buf = 138545667;
    id v62 = v53;
    __int16 v63 = 2114;
    v64 = v50;
    __int16 v65 = 2113;
    v66 = v52;
    __int16 v67 = 2113;
    v68 = v51;
    __int16 v69 = 2114;
    v70 = v49;
    __int16 v71 = 2114;
    id v72 = v54;
    __int16 v73 = 2048;
    double v74 = a5;
    __int16 v75 = 2113;
    v76 = v14;
    __int16 v77 = 2113;
    v78 = v16;
    __int16 v79 = 2048;
    uint64_t v80 = [v55 count] - 1;
    _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_DEFAULT, "notifyBestAppsChanged:%{public}@ %{public}@ %{private}@/%{private}@ opts=%{public}@ when=%{public}@ confidence=%g from=%{private}@/%{private}@  (and %lu more best app suggestions)", buf, 0x66u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v18 = WeakRetained == 0;

  if (!v18)
  {
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        int v22 = 1;
        goto LABEL_10;
      }
    }
    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    if (!v23
      || (id v24 = objc_loadWeakRetained((id *)&self->_delegate),
          char v25 = objc_opt_respondsToSelector(),
          v24,
          v23,
          (v25 & 1) != 0))
    {
      int v22 = 0;
LABEL_10:
      v26 = [v56 activityType];
      if (v26)
      {
        v27 = [v56 activityType];
        if ([v27 length])
        {
          int v28 = [v56 active];

          if (v28)
          {
            v29 = self;
            objc_sync_enter(v29);
            ++v29->_bestAppNotificationCount;
            if ((v22 & 1) != 0
              || ![(UABestAppSuggestionManager *)v29 isActivityInfo:v56 atTime:v54 similarToAppSuggestion:v29->_lastBestAppSuggestion])
            {
              long long v37 = [(UABestAppSuggestionManager *)v29 createAppSuggestionFromActivityInfo:v56 atTime:v54];
              objc_storeStrong((id *)&v29->_lastBestAppSuggestion, v37);
              objc_sync_exit(v29);

              if (v22)
              {
                v38 = [MEMORY[0x1E4F1CA80] set];
                v39 = v38;
                if (v37) {
                  [v38 addObject:v37];
                }
                if ((unint64_t)[v55 count] >= 2)
                {
                  unint64_t v40 = 1;
                  do
                  {
                    __int16 v41 = [v55 objectAtIndex:v40];
                    v42 = [MEMORY[0x1E4F1C9C8] date];
                    __int16 v43 = [v41 when];
                    [v42 timeIntervalSinceDate:v43];
                    BOOL v45 = v44 > 600.0;

                    if (!v45)
                    {
                      v46 = [(UABestAppSuggestionManager *)v29 createAppSuggestionFromActivityInfo:v41 atTime:v54];
                      if (v46) {
                        [v39 addObject:v46];
                      }
                    }
                    ++v40;
                  }
                  while (v40 < [v55 count]);
                }
                id v47 = objc_loadWeakRetained((id *)&self->_delegate);
                [v47 bestAppSuggestionChanged:v37 withAdditionalSuggestions:v39];
              }
              else
              {
                if (!v37) {
                  goto LABEL_21;
                }
                id v48 = objc_loadWeakRetained((id *)&self->_delegate);
                [v48 bestAppSuggestionChanged:v37];
              }
              v29 = v37;
            }
            else
            {
              v30 = _uaGetLogForCategory(0);
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                v31 = [v56 uuid];
                id v32 = [v31 UUIDString];
                v33 = [v56 bundleIdentifier];
                *(_DWORD *)buf = 138543619;
                id v62 = v32;
                __int16 v63 = 2113;
                v64 = v33;
                _os_log_impl(&dword_1B3DF6000, v30, OS_LOG_TYPE_DEBUG, " -- ignoring delivery of %{public}@ %{private}@ because it matches the last bestApp we got told about.", buf, 0x16u);
              }
              objc_sync_exit(v29);
            }
            goto LABEL_20;
          }
        }
        else
        {
        }
      }
      int bestAppNotificationCount = self->_bestAppNotificationCount;
      id v35 = objc_loadWeakRetained((id *)&self->_delegate);
      dispatch_time_t v36 = dispatch_time(0, 750000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__UABestAppSuggestionManager_notifyBestAppsChanged_when_confidence___block_invoke;
      block[3] = &unk_1E6083AF8;
      int v59 = bestAppNotificationCount;
      char v60 = v22;
      block[4] = self;
      id v58 = v35;
      v29 = (UABestAppSuggestionManager *)v35;
      dispatch_after(v36, MEMORY[0x1E4F14428], block);

LABEL_20:
    }
  }
LABEL_21:
}

void __68__UABestAppSuggestionManager_notifyBestAppsChanged_when_confidence___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 20) == *(_DWORD *)(a1 + 48))
  {
    id v3 = *(void **)(v2 + 24);
    if (v3)
    {
      *(void *)(v2 + 24) = 0;
    }
    id v4 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 52)) {
      [v4 bestAppSuggestionChanged:0 withAdditionalSuggestions:0];
    }
    else {
      [v4 bestAppSuggestionChanged:0];
    }
  }
  objc_sync_exit(obj);
}

- (void)launchAppWithBundleIdentifier:(id)a3 taskContinuationIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543619;
    id v10 = v7;
    __int16 v11 = 2113;
    id v12 = v6;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ %{private}@", (uint8_t *)&v9, 0x16u);
  }

  [(UABestAppSuggestionManager *)self launchAppWithBundleIdentifier:v6 userActivityUniqueIdentifier:v7 userActivityTypeIdentifier:0];
}

- (void)launchAppWithBundleIdentifier:(id)a3 userActivityUniqueIdentifier:(id)a4 userActivityTypeIdentifier:(id)a5
{
}

- (void)setConnection:(id)a3
{
}

- (UABestAppSuggestionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UABestAppSuggestionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setProxyManager:(id)a3
{
}

@end