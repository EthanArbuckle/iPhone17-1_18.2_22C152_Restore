@interface MRNowPlayingOriginClientManager
+ (id)sharedManager;
- (MRNowPlayingOriginClient)_createOriginClientForPlayerPath:(void *)a3 routingContextID:;
- (MRNowPlayingOriginClientManager)init;
- (NSArray)originClientRequests;
- (NSArray)originClients;
- (id)activeSystemEndpointOutputDeviceUIDForType:(int64_t)a3;
- (id)clientForPlayerPath:(id)a3;
- (id)clientRequestsForPlayerPath:(id)a3;
- (id)createCustomOriginClientForOrigin:(id)a3 routingContextID:(id)a4;
- (id)createNewPlayerCallback;
- (id)debugDescription;
- (id)destroyPlayerCallback;
- (id)existingClientRequestsForPlayerPath:(id)a3;
- (id)existingOriginClientForPlayerPath:(id *)a1;
- (id)existingOriginClientRequestsForPlayerPath:(id)a3;
- (id)existingPlayerClientRequestsForPlayerPath:(id)a3;
- (id)generatePlayerIDCallback;
- (id)localOriginClient;
- (id)originClientForOrigin:(id)a3;
- (id)originClientForPlayerPath:(id)a3;
- (id)originClientRequestsForPlayerPath:(id)a3;
- (id)playerClientForPlayerPath:(id)a3;
- (id)playerClientRequestsForPlayerPath:(id)a3;
- (uint64_t)_allowLocalOriginUsage;
- (void)_clearSystemEndpointForType:(void *)a3 reason:(void *)a4 queue:;
- (void)_resolveActiveSystemEndpointWithType:(void *)a3 requestName:(void *)a4 requestType:(void *)a5 requestID:(void *)a6 timeout:(void *)a7 queue:(double)a8 completion:;
- (void)clearActiveSystemEndpoints;
- (void)handleActiveSystemEndpointOutputDeviceUIDForType:(int64_t)a3 queue:(id)a4 completion:(id)a5;
- (void)removeOrigin:(id)a3;
- (void)removeOriginRequests:(id)a3;
- (void)resolveActiveSystemEndpointWithType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)restoreNowPlayingClientState;
- (void)setCreateNewPlayerCallback:(id)a3;
- (void)setDestroyPlayerCallback:(id)a3;
- (void)setGeneratePlayerIDCallback:(id)a3;
- (void)updateActiveSystemEndpointOutputDeviceUID:(id)a3 forType:(int64_t)a4;
@end

@implementation MRNowPlayingOriginClientManager

+ (id)sharedManager
{
  if (sharedManager___once_3 != -1) {
    dispatch_once(&sharedManager___once_3, &__block_literal_global_104);
  }
  v2 = (void *)sharedManager___sharedManager_1;

  return v2;
}

- (id)existingPlayerClientRequestsForPlayerPath:(id)a3
{
  id v4 = a3;
  v5 = [(MRNowPlayingOriginClientManager *)self existingClientRequestsForPlayerPath:v4];
  v6 = [v5 existingNowPlayingPlayerClientRequestsForPlayerPath:v4];

  return v6;
}

- (id)existingClientRequestsForPlayerPath:(id)a3
{
  id v4 = a3;
  v5 = [(MRNowPlayingOriginClientManager *)self existingOriginClientRequestsForPlayerPath:v4];
  v6 = [v5 existingNowPlayingClientRequestsForPlayerPath:v4];

  return v6;
}

- (id)existingOriginClientRequestsForPlayerPath:(id)a3
{
  id v4 = a3;
  v5 = [v4 origin];
  if (v5)
  {
    v6 = self->_originClientRequests;
    objc_sync_enter(v6);
    v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "identifier"));
    v8 = [(NSMutableDictionary *)self->_originClientRequests objectForKey:v7];

    objc_sync_exit(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)playerClientForPlayerPath:(id)a3
{
  id v4 = +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:a3];
  v5 = [(MRNowPlayingOriginClientManager *)self clientForPlayerPath:v4];
  v6 = [v5 nowPlayingPlayerClientForPlayerPath:v4];

  return v6;
}

- (id)clientForPlayerPath:(id)a3
{
  id v4 = +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:a3];
  v5 = [(MRNowPlayingOriginClientManager *)self originClientForPlayerPath:v4];
  v6 = [v5 nowPlayingClientForPlayerPath:v4];

  return v6;
}

- (id)originClientForPlayerPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:a3];
  v5 = [v4 origin];
  if (![v5 isLocal])
  {

LABEL_6:
    v7 = -[MRNowPlayingOriginClientManager existingOriginClientForPlayerPath:]((id *)&self->super.isa, v4);
    if (v7
      || ([v4 origin],
          v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isLocal],
          v9,
          (v10 & 1) != 0))
    {
      v11 = -[MRNowPlayingOriginClientManager _createOriginClientForPlayerPath:routingContextID:]((uint64_t)self, v4, 0);
      goto LABEL_13;
    }
    v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v14 = 138412546;
      v15 = v4;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientManager] Cannot implicitly create a custom originClient for %@: %@. Instead MediaRemote should be explicitly creating this originClient in NowPlayingSessionManager", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_11;
  }
  char v6 = -[MRNowPlayingOriginClientManager _allowLocalOriginUsage]((uint64_t)self);

  if (v6) {
    goto LABEL_6;
  }
  v7 = _MRLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [MEMORY[0x1E4F29060] callStackSymbols];
    int v14 = 138412546;
    v15 = v4;
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientManager] Cannot create a local originClient in framework for %@: %@", (uint8_t *)&v14, 0x16u);
LABEL_11:
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)existingOriginClientForPlayerPath:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:v3];
    v5 = [v4 origin];

    if (!v5)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      char v10 = [NSString stringWithUTF8String:"-[MRNowPlayingOriginClientManager existingOriginClientForPlayerPath:]"];
      [v9 handleFailureInFunction:v10, @"MRNowPlayingOriginClientManager.m", 159, @"Invalid parameter not satisfying: %@", @"origin" file lineNumber description];
    }
    id v6 = a1[1];
    objc_sync_enter(v6);
    v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "identifier"));
    a1 = [a1[1] objectForKey:v7];

    objc_sync_exit(v6);
  }

  return a1;
}

- (MRNowPlayingOriginClient)_createOriginClientForPlayerPath:(void *)a3 routingContextID:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:v5];
    v8 = [v7 origin];

    if (!v8)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      int v14 = [NSString stringWithUTF8String:"-[MRNowPlayingOriginClientManager _createOriginClientForPlayerPath:routingContextID:]"];
      [v13 handleFailureInFunction:v14, @"MRNowPlayingOriginClientManager.m", 215, @"Invalid parameter not satisfying: %@", @"origin" file lineNumber description];
    }
    id v9 = *(id *)(a1 + 8);
    objc_sync_enter(v9);
    char v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "identifier"));
    v11 = [*(id *)(a1 + 8) objectForKey:v10];
    if (!v11)
    {
      v11 = [[MRNowPlayingOriginClient alloc] initWithOrigin:v8 routingContextID:v6];
      if (v11) {
        [*(id *)(a1 + 8) setObject:v11 forKey:v10];
      }
    }

    objc_sync_exit(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)_allowLocalOriginUsage
{
  if (!a1) {
    return 0;
  }
  v1 = +[MRUserSettings currentSettings];
  if ([v1 supportMultiplayerHost]) {
    uint64_t v2 = __57__MRNowPlayingOriginClientManager__allowLocalOriginUsage__block_invoke();
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

- (id)originClientRequestsForPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 origin];
  if (v5)
  {
    id v6 = self->_originClientRequests;
    objc_sync_enter(v6);
    v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "identifier"));
    v8 = [(NSMutableDictionary *)self->_originClientRequests objectForKey:v7];
    if (!v8)
    {
      v8 = [[MRNowPlayingOriginClientRequests alloc] initWithOrigin:v5];
      [(NSMutableDictionary *)self->_originClientRequests setObject:v8 forKey:v7];
    }

    objc_sync_exit(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_51(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_3(uint64_t a1)
{
}

uint64_t __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_99(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (id)playerClientRequestsForPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MRNowPlayingOriginClientManager *)self clientRequestsForPlayerPath:v4];
  id v6 = [v5 nowPlayingPlayerClientRequestsForPlayerPath:v4];

  return v6;
}

- (id)clientRequestsForPlayerPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MRNowPlayingOriginClientManager *)self originClientRequestsForPlayerPath:v4];
  id v6 = [v5 nowPlayingClientRequestsForPlayerPath:v4];

  return v6;
}

void __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[MRAVOutputDevice localDeviceUID];
  if (v4 == v3)
  {

    goto LABEL_5;
  }
  id v5 = v4;
  int v6 = [v4 isEqual:v3];

  if (v6)
  {
LABEL_5:

    id v3 = 0;
  }
  if (*(void *)(a1 + 88) == 4)
  {
    v7 = +[MRGroupSessionRequestManager sharedManager];
    v8 = [v7 groupSessionInfo];

    if (v8)
    {
      int v9 = [v8 isHosted];
      if (v3 && v9)
      {
        char v10 = _MRLogForCategory(0xAuLL);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          uint64_t v45 = v11;
          __int16 v46 = 2114;
          uint64_t v47 = v12;
          __int16 v48 = 2112;
          v49 = @"Will override with local for supported client hosting GroupSession.";
          _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        id v3 = 0;
      }
      else if (([v8 isHosted] & 1) == 0)
      {
        id v13 = [v8 effectiveIdentifier];
        if (v3 == v13)
        {
        }
        else
        {
          int v14 = v13;
          char v15 = [v3 isEqual:v13];

          if ((v15 & 1) == 0)
          {
            __int16 v16 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v17 = *(void *)(a1 + 32);
              uint64_t v18 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138543874;
              uint64_t v45 = v17;
              __int16 v46 = 2114;
              uint64_t v47 = v18;
              __int16 v48 = 2112;
              v49 = @"Will override with remote GroupSession endpoint for supported client.";
              _os_log_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
            }

            uint64_t v19 = [v8 effectiveIdentifier];

            id v3 = (id)v19;
          }
        }
      }
    }
  }
  v20 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  v21 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
  double v22 = *(double *)(a1 + 96);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_78;
  v31[3] = &unk_1E57D9A58;
  uint64_t v24 = *(void *)(a1 + 48);
  uint64_t v23 = *(void *)(a1 + 56);
  v25 = *(void **)(a1 + 64);
  v32 = v21;
  uint64_t v33 = v23;
  id v34 = v25;
  id v26 = *(id *)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 88);
  id v35 = v26;
  uint64_t v41 = v27;
  id v28 = *(id *)(a1 + 32);
  uint64_t v42 = *(void *)(a1 + 104);
  id v36 = v28;
  id v37 = v3;
  id v38 = *(id *)(a1 + 72);
  uint64_t v43 = *(void *)(a1 + 96);
  id v39 = *(id *)(a1 + 48);
  id v40 = *(id *)(a1 + 80);
  id v29 = v3;
  v30 = v21;
  [(MRAVLightweightReconnaissanceSession *)v30 searchEndpointsForOutputDeviceUID:v29 timeout:v20 reason:v24 queue:v31 completion:v22];
}

- (void)_resolveActiveSystemEndpointWithType:(void *)a3 requestName:(void *)a4 requestType:(void *)a5 requestID:(void *)a6 timeout:(void *)a7 queue:(double)a8 completion:
{
  id v31 = a3;
  id v30 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (a1)
  {
    uint64_t v18 = a1;
    objc_sync_enter(v18);
    uint64_t v19 = (void *)v18[8];
    if (!v19)
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v21 = (void *)v18[8];
      v18[8] = v20;

      uint64_t v19 = (void *)v18[8];
    }
    if ((a2 & 0xFFFFFFFFFFFFFFFELL) == 4) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = a2;
    }
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", a2, v30);
    id v24 = [v19 objectForKeyedSubscript:v23];

    if (!v24)
    {
      id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v25 = (void *)v18[8];
      id v26 = [NSNumber numberWithInteger:a2];
      [v25 setObject:v24 forKeyedSubscript:v26];
    }
    uint64_t v27 = (void *)[v17 copy];
    id v28 = (void *)MEMORY[0x1997190F0]();
    [v24 setObject:v28 forKeyedSubscript:v15];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke;
    v32[3] = &unk_1E57D9A80;
    uint64_t v40 = a2;
    id v33 = v31;
    id v34 = v15;
    double v41 = a8;
    id v35 = v16;
    id v36 = v18;
    id v29 = v24;
    id v37 = v29;
    uint64_t v42 = v22;
    id v38 = v30;
    id v39 = v17;
    [v18 handleActiveSystemEndpointOutputDeviceUIDForType:v22 queue:v35 completion:v32];

    objc_sync_exit(v18);
  }
}

- (void)handleActiveSystemEndpointOutputDeviceUIDForType:(int64_t)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v9)
  {
    uint64_t v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"MRNowPlayingOriginClientManager.m", 363, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  char v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v12 = [v11 UUIDString];

  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(a3);
  int v14 = [MRBlockGuard alloc];
  id v15 = (void *)[[NSString alloc] initWithFormat:@"%@<%@>", @"handleActiveSystemEndpointOutputDeviceUIDForType", v12];
  id v16 = [(MRBlockGuard *)v14 initWithTimeout:v15 reason:0 handler:0.0];

  id v17 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"handleActiveSystemEndpointOutputDeviceUIDForType", v12];
  uint64_t v18 = v17;
  if (active) {
    [(__CFString *)v17 appendFormat:@" for %@", active];
  }
  uint64_t v19 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v62 = v18;
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke;
  v53[3] = &unk_1E57D9990;
  uint64_t v45 = v16;
  v54 = v45;
  id v20 = active;
  id v55 = v20;
  v56 = @"handleActiveSystemEndpointOutputDeviceUIDForType";
  id v21 = v12;
  id v57 = v21;
  id v44 = v10;
  id v58 = v44;
  id v22 = v8;
  id v59 = v22;
  id v43 = v9;
  id v60 = v43;
  uint64_t v23 = (void (**)(void, void, void))MEMORY[0x1997190F0](v53);
  id v24 = self;
  objc_sync_enter(v24);
  activeSystemEndpointUIDs = v24->_activeSystemEndpointUIDs;
  if (!activeSystemEndpointUIDs)
  {
    id v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v27 = v24->_activeSystemEndpointUIDs;
    v24->_activeSystemEndpointUIDs = v26;

    activeSystemEndpointUIDs = v24->_activeSystemEndpointUIDs;
  }
  id v28 = [NSNumber numberWithInteger:a3];
  id v29 = [(NSMutableDictionary *)activeSystemEndpointUIDs objectForKeyedSubscript:v28];

  if (v29)
  {
    id v30 = [(MRNowPlayingOriginClientManager *)v24 activeSystemEndpointOutputDeviceUIDForType:a3];
    ((void (**)(void, id, void))v23)[2](v23, v30, 0);
  }
  else
  {
    activeSystemEndpointUIDCompletions = v24->_activeSystemEndpointUIDCompletions;
    if (!activeSystemEndpointUIDCompletions)
    {
      v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v33 = v24->_activeSystemEndpointUIDCompletions;
      v24->_activeSystemEndpointUIDCompletions = v32;

      activeSystemEndpointUIDCompletions = v24->_activeSystemEndpointUIDCompletions;
    }
    id v34 = [NSNumber numberWithInteger:a3];
    id v30 = [(NSMutableDictionary *)activeSystemEndpointUIDCompletions objectForKeyedSubscript:v34];

    if (!v30)
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v35 = v24->_activeSystemEndpointUIDCompletions;
      id v36 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v35 setObject:v30 forKeyedSubscript:v36];
    }
    id v37 = (void *)[v23 copy];
    id v38 = (void *)MEMORY[0x1997190F0]();
    [v30 addObject:v38];

    if ([v30 count] == 1)
    {
      id v39 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v62 = @"handleActiveSystemEndpointOutputDeviceUIDForType";
        __int16 v63 = 2114;
        id v64 = v21;
        __int16 v65 = 2112;
        v66 = 0;
        __int16 v67 = 2112;
        id v68 = v20;
        _os_log_impl(&dword_194F3C000, v39, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
      }

      uint64_t v40 = (void *)MRGetSharedService();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_54;
      v47[3] = &unk_1E57D99B8;
      int64_t v52 = a3;
      v47[4] = v24;
      __int16 v48 = @"handleActiveSystemEndpointOutputDeviceUIDForType";
      id v49 = v21;
      id v50 = v20;
      id v30 = v30;
      id v51 = v30;
      MRMediaRemoteServiceGetActiveSystemEndpointUID(v40, a3, v22, v47);
    }
    else
    {
      double v41 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v62 = @"handleActiveSystemEndpointOutputDeviceUIDForType";
        __int16 v63 = 2114;
        id v64 = v21;
        __int16 v65 = 2112;
        v66 = @"waiting for previously batched request to respond";
        __int16 v67 = 2112;
        id v68 = v20;
        _os_log_impl(&dword_194F3C000, v41, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
      }
    }
  }

  objc_sync_exit(v24);
}

void __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  id v58 = __Block_byref_object_copy__47;
  id v59 = __Block_byref_object_dispose__47;
  id v8 = v5;
  id v60 = v8;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__47;
  void v53[4] = __Block_byref_object_dispose__47;
  id v9 = v6;
  id v54 = v9;
  id v10 = *(id *)(a1 + 40);
  objc_sync_enter(v10);
  uint64_t v11 = [*(id *)(a1 + 48) objectForKey:*(void *)(a1 + 56)];
  uint64_t v12 = (void *)v11;
  if (v8)
  {
    if (*(void *)(a1 + 104) != 5
      || ([v8 groupSessionInfo], (id v13 = objc_claimAutoreleasedReturnValue()) == 0)
      || (char v14 = [v8 isLocalEndpoint], v13, (v14 & 1) != 0))
    {
      uint64_t v15 = [*(id *)(a1 + 40) activeSystemEndpointOutputDeviceUIDForType:*(void *)(a1 + 112)];
      id v16 = (void *)v15;
      if (*(void *)(a1 + 104) == 4)
      {
        id v17 = +[MRGroupSessionRequestManager sharedManager];
        uint64_t v18 = [v17 groupSessionInfo];

        if (v18)
        {
          if ([v18 isHosted])
          {
            uint64_t v19 = 0;
          }
          else
          {
            uint64_t v19 = [v18 effectiveIdentifier];
          }
        }
        else
        {
          uint64_t v19 = v16;
        }
      }
      else
      {
        uint64_t v19 = (void *)v15;
      }
      id v31 = *(void **)(a1 + 72);
      id v32 = v19;
      id v33 = v31;
      if (v32 == v33)
      {
      }
      else
      {
        id v34 = v33;
        int v35 = [v32 isEqual:v33];

        if (!v35)
        {
          if (v12)
          {
            if (*(void *)(a1 + 104) == 4)
            {
              id v36 = _MRLogForCategory(0);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
                __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_78_cold_1((uint64_t)v32, v36);
              }

              id v37 = _MRLogForCategory(0xAuLL);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v39 = *(void *)(a1 + 56);
                uint64_t v38 = *(void *)(a1 + 64);
                *(_DWORD *)buf = 138543874;
                uint64_t v63 = v38;
                __int16 v64 = 2114;
                uint64_t v65 = v39;
                __int16 v66 = 2112;
                __int16 v67 = @"Failed to find endpoint for group session. Return local.";
                _os_log_impl(&dword_194F3C000, v37, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
              }

              uint64_t v40 = (void *)MEMORY[0x1997190F0](v12);
              v70[0] = v40;
              id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];

              uint64_t v41 = +[MRAVLocalEndpoint sharedLocalEndpoint];
              uint64_t v42 = (void *)v56[5];
              v56[5] = v41;

              [*(id *)(a1 + 48) removeObjectForKey:*(void *)(a1 + 56)];
              MRAVEndpointUpdateActiveSystemEndpointWithReason(0, 1, @"Failed to resolve group session endpoint", 0, 0);
              goto LABEL_40;
            }
            __int16 v48 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v50 = *(void *)(a1 + 56);
              uint64_t v49 = *(void *)(a1 + 64);
              uint64_t v51 = *(void *)(a1 + 80);
              *(_DWORD *)buf = 138544130;
              uint64_t v63 = v49;
              __int16 v64 = 2114;
              uint64_t v65 = v50;
              __int16 v66 = 2112;
              __int16 v67 = @"response is already stale";
              __int16 v68 = 2112;
              uint64_t v69 = v51;
              _os_log_impl(&dword_194F3C000, v48, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
            }

            -[MRNowPlayingOriginClientManager _resolveActiveSystemEndpointWithType:requestName:requestType:requestID:timeout:queue:completion:](*(void *)(a1 + 40), *(void *)(a1 + 104), *(void *)(a1 + 64), *(void *)(a1 + 80), *(void *)(a1 + 56), *(void *)(a1 + 88), *(void *)(a1 + 96), *(double *)(a1 + 120));
          }
          else
          {
            id v44 = _MRLogForCategory(0xAuLL);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v46 = *(void *)(a1 + 56);
              uint64_t v45 = *(void *)(a1 + 64);
              uint64_t v47 = *(void *)(a1 + 80);
              *(_DWORD *)buf = 138544130;
              uint64_t v63 = v45;
              __int16 v64 = 2114;
              uint64_t v65 = v46;
              __int16 v66 = 2112;
              __int16 v67 = @"resolve completed however previous response already fulfilled request (informational only, not further action required)";
              __int16 v68 = 2112;
              uint64_t v69 = v47;
              _os_log_impl(&dword_194F3C000, v44, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
            }
          }
          id v24 = 0;
LABEL_40:

          goto LABEL_41;
        }
      }
      id v43 = [*(id *)(a1 + 48) allValues];
      id v24 = (void *)[v43 copy];

      [*(id *)(a1 + 48) removeAllObjects];
      goto LABEL_40;
    }
    v25 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = *(void *)(a1 + 56);
      uint64_t v26 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      uint64_t v63 = v26;
      __int16 v64 = 2114;
      uint64_t v65 = v27;
      __int16 v66 = 2112;
      __int16 v67 = @"ASE is remote GroupSession, will override with local for unsupported client.";
      _os_log_impl(&dword_194F3C000, v25, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    uint64_t v28 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    id v29 = (void *)v56[5];
    v56[5] = v28;

    id v30 = [*(id *)(a1 + 48) allValues];
    id v24 = (void *)[v30 copy];

    [*(id *)(a1 + 48) removeAllObjects];
  }
  else if (v11)
  {
    if ([*(id *)(a1 + 48) count] == 1)
    {
      id v20 = (void *)[[NSString alloc] initWithFormat:@"Could not discover %@ for ResolveActiveEndpoint<%@> in <%lf> seconds", *(void *)(a1 + 72), *(void *)(a1 + 56), *(void *)(a1 + 120)];
      -[MRNowPlayingOriginClientManager _clearSystemEndpointForType:reason:queue:](*(void *)(a1 + 40), *(void *)(a1 + 104), v20, *(void **)(a1 + 88));
    }
    uint64_t v21 = +[MRAVLocalEndpoint sharedLocalEndpoint];
    id v22 = (void *)v56[5];
    v56[5] = v21;

    uint64_t v23 = (void *)MEMORY[0x1997190F0](v12);
    v61 = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];

    [*(id *)(a1 + 48) removeObjectForKey:*(void *)(a1 + 56)];
  }
  else
  {
    id v24 = 0;
  }
LABEL_41:

  objc_sync_exit(v10);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_99;
  v52[3] = &unk_1E57D9A30;
  v52[4] = &v55;
  v52[5] = v53;
  [v24 enumerateObjectsUsingBlock:v52];
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(&v55, 8);
}

- (id)activeSystemEndpointOutputDeviceUIDForType:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  activeSystemEndpointUIDs = v4->_activeSystemEndpointUIDs;
  id v6 = [NSNumber numberWithInteger:a3];
  id v7 = [(NSMutableDictionary *)activeSystemEndpointUIDs objectForKeyedSubscript:v6];

  objc_sync_exit(v4);
  if (!v7)
  {
    id v8 = MRGetSharedService();
    id v9 = [v8 getActiveSystemEndpointUIDForType:a3];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = +[MRAVOutputDevice localDeviceUID];
    }
    id v7 = v11;

    [(MRNowPlayingOriginClientManager *)v4 updateActiveSystemEndpointOutputDeviceUID:v7 forType:a3];
  }
  uint64_t v12 = +[MRAVOutputDevice localDeviceUID];
  int v13 = [v7 isEqualToString:v12];

  if (v13)
  {

    id v7 = 0;
  }
  char v14 = (void *)[v7 copy];

  return v14;
}

void __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) disarm];
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = _MRLogForCategory(0xAuLL);
  id v9 = v8;
  if (v5 && !v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v10)
      {
        uint64_t v12 = *(void *)(a1 + 48);
        uint64_t v11 = *(void *)(a1 + 56);
        uint64_t v13 = *(void *)(a1 + 40);
        char v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
        *(_DWORD *)buf = 138544386;
        uint64_t v44 = v12;
        __int16 v45 = 2114;
        uint64_t v46 = v11;
        __int16 v47 = 2112;
        id v48 = v5;
        __int16 v49 = 2114;
        uint64_t v50 = v13;
        __int16 v51 = 2048;
        uint64_t v52 = v15;
        id v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        id v17 = v9;
        uint32_t v18 = 52;
LABEL_16:
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v10) {
      goto LABEL_22;
    }
    uint64_t v29 = *(void *)(a1 + 48);
    uint64_t v30 = *(void *)(a1 + 56);
    char v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
    *(_DWORD *)buf = 138544130;
    uint64_t v44 = v29;
    __int16 v45 = 2114;
    uint64_t v46 = v30;
    __int16 v47 = 2112;
    id v48 = v5;
    __int16 v49 = 2048;
    uint64_t v50 = v31;
    id v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    id v17 = v9;
    uint32_t v18 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    BOOL v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v19)
      {
        uint64_t v21 = *(void *)(a1 + 48);
        uint64_t v20 = *(void *)(a1 + 56);
        uint64_t v22 = *(void *)(a1 + 40);
        char v14 = [MEMORY[0x1E4F1C9C8] date];
        [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
        *(_DWORD *)buf = 138544386;
        uint64_t v44 = v21;
        __int16 v45 = 2114;
        uint64_t v46 = v20;
        __int16 v47 = 2114;
        id v48 = v6;
        __int16 v49 = 2114;
        uint64_t v50 = v22;
        __int16 v51 = 2048;
        uint64_t v52 = v23;
        _os_log_error_impl(&dword_194F3C000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v19)
    {
      __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_cold_1(a1);
    }
    goto LABEL_22;
  }
  BOOL v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24) {
      goto LABEL_22;
    }
    uint64_t v32 = *(void *)(a1 + 48);
    uint64_t v33 = *(void *)(a1 + 56);
    char v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
    *(_DWORD *)buf = 138543874;
    uint64_t v44 = v32;
    __int16 v45 = 2114;
    uint64_t v46 = v33;
    __int16 v47 = 2048;
    id v48 = v34;
    id v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    id v17 = v9;
    uint32_t v18 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    uint64_t v26 = *(void *)(a1 + 48);
    uint64_t v25 = *(void *)(a1 + 56);
    uint64_t v27 = *(void **)(a1 + 40);
    char v14 = [MEMORY[0x1E4F1C9C8] date];
    [v14 timeIntervalSinceDate:*(void *)(a1 + 64)];
    *(_DWORD *)buf = 138544130;
    uint64_t v44 = v26;
    __int16 v45 = 2114;
    uint64_t v46 = v25;
    __int16 v47 = 2114;
    id v48 = v27;
    __int16 v49 = 2048;
    uint64_t v50 = v28;
    id v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_51;
  block[3] = &unk_1E57D0EA8;
  int v35 = *(NSObject **)(a1 + 72);
  id v36 = *(id *)(a1 + 80);
  id v41 = v6;
  id v42 = v36;
  id v40 = v5;
  id v37 = v6;
  id v38 = v5;
  dispatch_async(v35, block);
}

void __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v15 = [v5 debugName];

    uint64_t v16 = a1[4];
    id v8 = _MRLogForCategory(0xAuLL);
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v18 = a1[5];
        uint64_t v19 = a1[6];
        uint64_t v13 = [v5 debugName];
        uint64_t v20 = a1[4];
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544386;
        uint64_t v47 = v18;
        __int16 v48 = 2114;
        uint64_t v49 = v19;
        __int16 v50 = 2112;
        id v51 = v13;
        __int16 v52 = 2114;
        uint64_t v53 = v20;
        __int16 v54 = 2048;
        uint64_t v55 = v22;
        uint64_t v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        BOOL v24 = v8;
        uint32_t v25 = 52;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v33 = a1[5];
        uint64_t v34 = a1[6];
        uint64_t v13 = [v5 debugName];
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        [v21 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544130;
        uint64_t v47 = v33;
        __int16 v48 = 2114;
        uint64_t v49 = v34;
        __int16 v50 = 2112;
        id v51 = v13;
        __int16 v52 = 2048;
        uint64_t v53 = v35;
        uint64_t v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        BOOL v24 = v8;
        uint32_t v25 = 42;
      }
      _os_log_impl(&dword_194F3C000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    }
    else
    {
      if (v16)
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v27 = a1[5];
        uint64_t v26 = a1[6];
        uint64_t v28 = (void *)a1[4];
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138544130;
        uint64_t v47 = v27;
        __int16 v48 = 2114;
        uint64_t v49 = v26;
        __int16 v50 = 2114;
        id v51 = v28;
        __int16 v52 = 2048;
        uint64_t v53 = v29;
        uint64_t v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        uint64_t v31 = v8;
        uint32_t v32 = 42;
      }
      else
      {
        if (!v17) {
          goto LABEL_21;
        }
        uint64_t v36 = a1[5];
        uint64_t v37 = a1[6];
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
        [v13 timeIntervalSinceDate:a1[7]];
        *(_DWORD *)buf = 138543874;
        uint64_t v47 = v36;
        __int16 v48 = 2114;
        uint64_t v49 = v37;
        __int16 v50 = 2048;
        id v51 = v38;
        uint64_t v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        uint64_t v31 = v8;
        uint32_t v32 = 32;
      }
      _os_log_impl(&dword_194F3C000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    }
    goto LABEL_20;
  }
  uint64_t v7 = a1[4];
  id v8 = _MRLogForCategory(0xAuLL);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v9) {
      goto LABEL_21;
    }
    uint64_t v11 = a1[5];
    uint64_t v10 = a1[6];
    uint64_t v12 = a1[4];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSinceDate:a1[7]];
    *(_DWORD *)buf = 138544386;
    uint64_t v47 = v11;
    __int16 v48 = 2114;
    uint64_t v49 = v10;
    __int16 v50 = 2114;
    id v51 = v6;
    __int16 v52 = 2114;
    uint64_t v53 = v12;
    __int16 v54 = 2048;
    uint64_t v55 = v14;
    _os_log_error_impl(&dword_194F3C000, v8, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_20:

    goto LABEL_21;
  }
  if (v9) {
    __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_14_cold_1((uint64_t)a1);
  }
LABEL_21:

  uint64_t v39 = (void *)a1[9];
  if (v39)
  {
    id v40 = a1[8];
    id v41 = v40;
    if (!v40)
    {
      id v41 = MEMORY[0x1E4F14428];
      id v42 = MEMORY[0x1E4F14428];
      uint64_t v39 = (void *)a1[9];
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_65;
    v43[3] = &unk_1E57D0DB8;
    id v45 = v39;
    id v44 = v5;
    dispatch_async(v41, v43);
    if (!v40) {
  }
    }
}

- (void)resolveActiveSystemEndpointWithType:(int64_t)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  active = (void *)MRMediaRemoteActiveEndpointTypeCopyDescription(a3);
  uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v15 = [v14 UUIDString];

  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"ResolveActiveEndpoint", v15];
  BOOL v17 = v16;
  if (active) {
    [v16 appendFormat:@" for %@", active];
  }
  uint64_t v18 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v44 = v17;
    _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke;
  v36[3] = &unk_1E57D99E0;
  id v19 = active;
  id v37 = v19;
  id v38 = @"ResolveActiveEndpoint";
  id v20 = v15;
  id v39 = v20;
  id v40 = v13;
  id v41 = v10;
  id v42 = v11;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  BOOL v24 = (void *)MEMORY[0x1997190F0](v36);
  if (resolveActiveSystemEndpointWithType_timeout_queue_completion__onceToken != -1) {
    dispatch_once(&resolveActiveSystemEndpointWithType_timeout_queue_completion__onceToken, &__block_literal_global_68_0);
  }
  uint32_t v25 = resolveActiveSystemEndpointWithType_timeout_queue_completion__workerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_3;
  block[3] = &unk_1E57D9A08;
  void block[4] = self;
  uint64_t v30 = @"ResolveActiveEndpoint";
  id v31 = v19;
  id v32 = v20;
  double v35 = a4;
  id v33 = v24;
  int64_t v34 = a3;
  id v26 = v24;
  id v27 = v20;
  id v28 = v19;
  dispatch_async(v25, block);
}

uint64_t __48__MRNowPlayingOriginClientManager_sharedManager__block_invoke()
{
  sharedManager___sharedManager_1 = objc_alloc_init(MRNowPlayingOriginClientManager);

  return MEMORY[0x1F41817F8]();
}

- (MRNowPlayingOriginClientManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRNowPlayingOriginClientManager;
  uint64_t v2 = [(MRNowPlayingOriginClientManager *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    originClients = v2->_originClients;
    v2->_originClients = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    originClientRequests = v2->_originClientRequests;
    v2->_originClientRequests = v5;
  }
  return v2;
}

void __96__MRNowPlayingOriginClientManager_resolveActiveSystemEndpointWithType_timeout_queue_completion___block_invoke_2()
{
  uint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.mediaremote.resolveActiveSystemEndpoint.workerQueue", v2);
  v1 = (void *)resolveActiveSystemEndpointWithType_timeout_queue_completion__workerQueue;
  resolveActiveSystemEndpointWithType_timeout_queue_completion__workerQueue = (uint64_t)v0;
}

void __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_54(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 72)];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    objc_super v8 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138544130;
      uint64_t v23 = v9;
      __int16 v24 = 2114;
      uint64_t v25 = v10;
      __int16 v26 = 2112;
      id v27 = @"request completed however response is already stale";
      __int16 v28 = 2112;
      uint64_t v29 = v11;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }
  }
  else
  {
    [*(id *)(a1 + 32) updateActiveSystemEndpointOutputDeviceUID:v3 forType:*(void *)(a1 + 72)];
  }
  uint64_t v12 = [*(id *)(a1 + 32) activeSystemEndpointOutputDeviceUIDForType:*(void *)(a1 + 72)];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v13 = *(id *)(a1 + 64);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 64), "removeAllObjects", (void)v17);
  objc_sync_exit(v4);
}

- (void)updateActiveSystemEndpointOutputDeviceUID:(id)a3 forType:(int64_t)a4
{
  id v13 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  id v7 = v13;
  if (!v6->_activeSystemEndpointUIDs)
  {
    objc_super v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeSystemEndpointUIDs = v6->_activeSystemEndpointUIDs;
    v6->_activeSystemEndpointUIDs = v8;

    id v7 = v13;
  }
  uint64_t v10 = v7;
  if (!v7)
  {
    uint64_t v10 = +[MRAVOutputDevice localDeviceUID];
  }
  uint64_t v11 = v6->_activeSystemEndpointUIDs;
  uint64_t v12 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

  if (!v13) {
  objc_sync_exit(v6);
  }
}

- (id)debugDescription
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](v2->_activeSystemEndpointUIDs, "count"));
  activeSystemEndpointUIDs = v2->_activeSystemEndpointUIDs;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51__MRNowPlayingOriginClientManager_debugDescription__block_invoke;
  v23[3] = &unk_1E57D9968;
  id v21 = v3;
  id v24 = v21;
  [(NSMutableDictionary *)activeSystemEndpointUIDs enumerateKeysAndObjectsUsingBlock:v23];
  id v5 = NSString;
  id v22 = [(MRNowPlayingOriginClientManager *)v2 originClients];
  long long v19 = MRCreateIndentedDebugDescriptionFromArray(v22);
  long long v20 = [(MRNowPlayingOriginClientManager *)v2 originClientRequests];
  long long v18 = MRCreateIndentedDebugDescriptionFromArray(v20);
  uint64_t v16 = (void *)MEMORY[0x1997190F0](v2->_createPlayerCallback);
  long long v17 = MRCreateIndentedDebugDescriptionFromObject(v16);
  id v6 = (void *)MEMORY[0x1997190F0](v2->_destroyPlayerCallback);
  id v7 = MRCreateIndentedDebugDescriptionFromObject(v6);
  objc_super v8 = (void *)MEMORY[0x1997190F0](v2->_generatePlayerIDCallback);
  uint64_t v9 = MRCreateIndentedDebugDescriptionFromObject(v8);
  uint64_t v10 = MRCreateIndentedDebugDescriptionFromObject(v21);
  uint64_t v11 = MRCreateIndentedDebugDescriptionFromObject(v2->_activeSystemEndpointUIDCompletions);
  uint64_t v12 = MRCreateIndentedDebugDescriptionFromObject(v2->_resolveActiveSystemEndpointCompletions);
  id v13 = [v5 stringWithFormat:@"    originClients = %@\n    originClientRequests = %@\n    createPlayerCallback = %@\n    destroyPlayerCallback = %@\n    generatePlayerIDCallback = %@\n    activeSystemEndpoint = %@\n    activeSystemEndpointUIDCompletions = %@\n    resolveActiveSystemEndpointCompletions = %@\n", v19, v18, v17, v7, v9, v10, v11, v12];
  uint64_t v14 = MRCreateFormattedDebugDescriptionFromClass(v2, v13);

  objc_sync_exit(v2);

  return v14;
}

void __51__MRNowPlayingOriginClientManager_debugDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id active = (id)MRMediaRemoteActiveEndpointTypeCopyDescription((int)[a2 intValue]);
  [v4 setObject:v5 forKeyedSubscript:active];
}

- (NSArray)originClients
{
  id v3 = self->_originClients;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_originClients allValues];
  id v5 = (void *)[v4 copy];

  objc_sync_exit(v3);

  return (NSArray *)v5;
}

- (NSArray)originClientRequests
{
  id v3 = self->_originClientRequests;
  objc_sync_enter(v3);
  id v4 = [(NSMutableDictionary *)self->_originClientRequests allValues];
  id v5 = (void *)[v4 copy];

  objc_sync_exit(v3);

  return (NSArray *)v5;
}

- (void)setCreateNewPlayerCallback:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  id createPlayerCallback = v4->_createPlayerCallback;
  v4->_id createPlayerCallback = (id)v5;

  objc_sync_exit(v4);
}

- (id)createNewPlayerCallback
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[v2->_createPlayerCallback copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setDestroyPlayerCallback:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  id destroyPlayerCallback = v4->_destroyPlayerCallback;
  v4->_id destroyPlayerCallback = (id)v5;

  objc_sync_exit(v4);
}

- (id)destroyPlayerCallback
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[v2->_destroyPlayerCallback copy];
  objc_sync_exit(v2);

  return v3;
}

- (void)setGeneratePlayerIDCallback:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 copy];
  id generatePlayerIDCallback = v4->_generatePlayerIDCallback;
  v4->_id generatePlayerIDCallback = (id)v5;

  objc_sync_exit(v4);
}

- (id)generatePlayerIDCallback
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[v2->_generatePlayerIDCallback copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)localOriginClient
{
  id v3 = +[MROrigin localOrigin];
  id v4 = [(MRNowPlayingOriginClientManager *)self originClientForOrigin:v3];

  return v4;
}

- (id)originClientForOrigin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[MRPlayerPath alloc] initWithOrigin:v4 client:0 player:0];

  id v6 = [(MRNowPlayingOriginClientManager *)self originClientForPlayerPath:v5];

  return v6;
}

- (id)createCustomOriginClientForOrigin:(id)a3 routingContextID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"MRNowPlayingOriginClientManager.m", 171, @"Invalid parameter not satisfying: %@", @"origin" object file lineNumber description];
  }
  uint64_t v9 = [[MRPlayerPath alloc] initWithOrigin:v7 client:0 player:0];
  uint64_t v10 = +[MRPlayerPath localResolvedPlayerPathFromPlayerPath:v9];

  uint64_t v11 = -[MRNowPlayingOriginClientManager _createOriginClientForPlayerPath:routingContextID:]((uint64_t)self, v10, v8);

  return v11;
}

uint64_t __57__MRNowPlayingOriginClientManager__allowLocalOriginUsage__block_invoke()
{
  if (MRProcessIsMediaRemoteDaemon() & 1) != 0 || (MRProcessIsAirPlayDaemon()) {
    return 1;
  }

  return MRProcessIsHomePodCannedDemo();
}

- (void)restoreNowPlayingClientState
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [(MRNowPlayingOriginClientManager *)self originClientRequests];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) restoreNowPlayingClientState];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(MRNowPlayingOriginClientManager *)self originClients];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) restoreNowPlayingClientState];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)removeOrigin:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[MRNowPlayingOriginClientManager removeOrigin:]"];
    [v7 handleFailureInFunction:v8, @"MRNowPlayingOriginClientManager.m", 327, @"Invalid parameter not satisfying: %@", @"origin" file lineNumber description];
  }
  uint64_t v4 = self->_originClients;
  objc_sync_enter(v4);
  originClients = self->_originClients;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "identifier"));
  [(NSMutableDictionary *)originClients removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (void)removeOriginRequests:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = [NSString stringWithUTF8String:"-[MRNowPlayingOriginClientManager removeOriginRequests:]"];
    [v7 handleFailureInFunction:v8, @"MRNowPlayingOriginClientManager.m", 336, @"Invalid parameter not satisfying: %@", @"origin" file lineNumber description];
  }
  uint64_t v4 = self->_originClientRequests;
  objc_sync_enter(v4);
  originClientRequests = self->_originClientRequests;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "identifier"));
  [(NSMutableDictionary *)originClientRequests removeObjectForKey:v6];

  objc_sync_exit(v4);
}

- (void)clearActiveSystemEndpoints
{
  obj = self;
  objc_sync_enter(obj);
  activeSystemEndpointUIDs = obj->_activeSystemEndpointUIDs;
  obj->_activeSystemEndpointUIDs = 0;

  objc_sync_exit(obj);
}

- (void)_clearSystemEndpointForType:(void *)a3 reason:(void *)a4 queue:
{
  if (a1)
  {
    unint64_t v5 = a2;
    if (a2 <= 3) {
      unint64_t v5 = qword_195224708[a2];
    }
    id v6 = a4;
    id v7 = a3;
    id v8 = [[MRUpdateActiveSystemEndpointRequest alloc] initWithOutputDeviceUID:0 type:v5 reason:v7];

    [(MRUpdateActiveSystemEndpointRequest *)v8 setChangeType:1];
    [(MRUpdateActiveSystemEndpointRequest *)v8 perform:v6 completion:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolveActiveSystemEndpointCompletions, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpointUIDCompletions, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpointUIDs, 0);
  objc_storeStrong(&self->_generatePlayerIDCallback, 0);
  objc_storeStrong(&self->_destroyPlayerCallback, 0);
  objc_storeStrong(&self->_createPlayerCallback, 0);
  objc_storeStrong((id *)&self->_originClientRequests, 0);

  objc_storeStrong((id *)&self->_originClients, 0);
}

void __101__MRNowPlayingOriginClientManager_handleActiveSystemEndpointOutputDeviceUIDForType_queue_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 64)];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);
}

void __131__MRNowPlayingOriginClientManager__resolveActiveSystemEndpointWithType_requestName_requestType_requestID_timeout_queue_completion___block_invoke_78_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_194F3C000, a2, OS_LOG_TYPE_FAULT, "[MRNowPlayingOriginClientManager] Could not find endpoint for %@.", (uint8_t *)&v2, 0xCu);
}

@end