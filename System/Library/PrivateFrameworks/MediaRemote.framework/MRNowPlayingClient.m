@interface MRNowPlayingClient
- (BOOL)canBeNowPlaying;
- (BOOL)canBeNowPlayingForPlayer:(id)a3;
- (BOOL)perPlayerCanBeNowPlaying;
- (BOOL)useMediaRemoteActivePlayerHeuristic;
- (MRClient)client;
- (MRNowPlayingClient)initWithPlayerPath:(id)a3;
- (MRPlayerPath)activePlayerPath;
- (MRPlayerPath)playerPath;
- (NSArray)playerClients;
- (id)debugDescription;
- (id)description;
- (id)nowPlayingPlayerClientForPlayerPath:(id)a3;
- (void)_avSessionMediaServicesResetNotification:(id)a3;
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)dealloc;
- (void)enqueueCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5 commandCompletion:(id)a6;
- (void)mergeClient:(id)a3;
- (void)reevaluateActivePlayerWithReason:(id)a3 completion:(id)a4;
- (void)removePlayer:(id)a3;
- (void)requestActiveForPlayerPath:(id)a3 completion:(id)a4;
- (void)restoreNowPlayingClientState;
- (void)sendQueuedCommandsWithReason:(id)a3;
- (void)setActivePlayerPath:(id)a3 reason:(id)a4 completion:(id)a5;
- (void)setCanBeNowPlaying:(BOOL)a3;
- (void)setClient:(id)a3;
- (void)setPerPlayerCanBeNowPlaying:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)setUseMediaRemoteActivePlayerHeuristic:(BOOL)a3;
- (void)updateActivePlayerPath:(id)a3 completion:(id)a4;
@end

@implementation MRNowPlayingClient

- (id)nowPlayingPlayerClientForPlayerPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = v5->_playerClients;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v6);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      v11 = [v10 playerPath];
      if ([v11 isEqual:v4]) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v12 = v10;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v12 = [[MRNowPlayingPlayerClient alloc] initWithPlayerPath:v4];
  [(NSMutableArray *)v5->_playerClients addObject:v12];
  v13 = (void *)[[NSString alloc] initWithFormat:@"New player %@ was added", v4];
  [(MRNowPlayingClient *)v5 reevaluateActivePlayerWithReason:v13 completion:0];

LABEL_12:
  objc_sync_exit(v5);

  return v12;
}

uint64_t __60__MRNowPlayingClient_setActivePlayerPath_reason_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[4];
  v5 = _MRLogForCategory(0xAuLL);
  v6 = v5;
  if (!a2)
  {
    BOOL v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v12) {
        goto LABEL_14;
      }
      uint64_t v14 = a1[4];
      uint64_t v13 = a1[5];
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[6]];
      int v22 = 138544130;
      v23 = @"setNowPlayingPlayer";
      __int16 v24 = 2114;
      uint64_t v25 = v13;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      long long v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      long long v17 = v6;
      uint32_t v18 = 42;
    }
    else
    {
      if (!v12) {
        goto LABEL_14;
      }
      uint64_t v19 = a1[5];
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:a1[6]];
      int v22 = 138543874;
      v23 = @"setNowPlayingPlayer";
      __int16 v24 = 2114;
      uint64_t v25 = v19;
      __int16 v26 = 2048;
      uint64_t v27 = v20;
      long long v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      long long v17 = v6;
      uint32_t v18 = 32;
    }
    _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v22, v18);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v9 = a1[4];
    uint64_t v8 = a1[5];
    v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceDate:a1[6]];
    int v22 = 138544386;
    v23 = @"setNowPlayingPlayer";
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    __int16 v26 = 2114;
    uint64_t v27 = a2;
    __int16 v28 = 2114;
    uint64_t v29 = v9;
    __int16 v30 = 2048;
    uint64_t v31 = v11;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v22, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __60__MRNowPlayingClient_setActivePlayerPath_reason_completion___block_invoke_cold_1((uint64_t)a1);
  }
LABEL_14:

  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __41__MRNowPlayingClient_initWithPlayerPath___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = [(Class)getAVSystemControllerClass_0[0]() sharedAVSystemController];
  v3 = getAVSystemController_ServerConnectionDiedNotification[0]();
  v9[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v5 = getAVSystemController_SubscribeToNotificationsAttribute[0]();
  [v2 setAttribute:v4 forKey:v5 error:0];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = getAVSystemController_ServerConnectionDiedNotification[0]();
  [v6 addObserver:v7 selector:sel__avSessionMediaServicesResetNotification_ name:v8 object:0];
}

- (BOOL)canBeNowPlayingForPlayer:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_perPlayerCanBeNowPlaying || !self->_canBeNowPlaying)
  {
    playerClients = self->_playerClients;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__MRNowPlayingClient_canBeNowPlayingForPlayer___block_invoke;
    v10[3] = &unk_1E57D8F30;
    id v11 = v4;
    uint64_t v7 = [(NSMutableArray *)playerClients mr_first:v10];
    char v8 = [v7 canBeNowPlayingPlayer];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)canBeNowPlaying
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  if (v2->_perPlayerCanBeNowPlaying)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = v2->_playerClients;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "canBeNowPlayingPlayer", (void)v9))
          {

            BOOL canBeNowPlaying = 1;
            goto LABEL_13;
          }
        }
        uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    BOOL canBeNowPlaying = 0;
  }
  else
  {
    BOOL canBeNowPlaying = v2->_canBeNowPlaying;
  }
LABEL_13:
  objc_sync_exit(v2);

  return canBeNowPlaying;
}

- (void)setPerPlayerCanBeNowPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_perPlayerCanBeNowPlaying = v3;
  if (v3) {
    [(MRNowPlayingClient *)obj sendQueuedCommandsWithReason:@"perPlayCanBeNowPlaying=YES"];
  }
  objc_sync_exit(obj);
}

- (void)sendQueuedCommandsWithReason:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ([(NSMutableArray *)v5->_commandQueue count])
  {
    v6 = (void *)[(NSMutableArray *)v5->_commandQueue copy];
    [(NSMutableArray *)v5->_commandQueue removeAllObjects];
    replayQueue = v5->_replayQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __51__MRNowPlayingClient_sendQueuedCommandsWithReason___block_invoke;
    v9[3] = &unk_1E57D0790;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    dispatch_async(replayQueue, v9);
  }
  objc_sync_exit(v5);
}

BOOL __66__MRNowPlayingClient_reevaluateActivePlayerWithReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 playerPath];
  id v4 = [v3 player];
  if ([v4 isDefaultPlayer])
  {
    BOOL v5 = 0;
  }
  else
  {
    v6 = [v2 activeRequestedDate];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (MRClient)client
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(MRPlayerPath *)v2->_playerPath client];
  id v4 = (void *)[v3 copy];

  objc_sync_exit(v2);

  return (MRClient *)v4;
}

- (MRNowPlayingClient)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MRNowPlayingClient;
  BOOL v5 = [(MRNowPlayingClient *)&v35 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaRemote.MRNowPlayingOriginClient.avscQueue", v6);
    avscQueue = v5->_avscQueue;
    v5->_avscQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [v4 copy];
    playerPath = v5->_playerPath;
    v5->_playerPath = (MRPlayerPath *)v9;

    [(MRPlayerPath *)v5->_playerPath setPlayer:0];
    id v11 = v5->_playerPath;
    if (!v11)
    {
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v26 = [NSString stringWithUTF8String:"-[MRNowPlayingClient initWithPlayerPath:]"];
      [v25 handleFailureInFunction:v26, @"MRNowPlayingOriginClient.m", 448, @"Invalid parameter not satisfying: %@", @"_playerPath" file lineNumber description];

      id v11 = v5->_playerPath;
    }
    long long v12 = [(MRPlayerPath *)v11 client];
    if (!v12)
    {
      uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v28 = [NSString stringWithUTF8String:"-[MRNowPlayingClient initWithPlayerPath:]"];
      [v27 handleFailureInFunction:v28, @"MRNowPlayingOriginClient.m", 451, @"Invalid parameter not satisfying: %@", @"client" file lineNumber description];
    }
    uint64_t v13 = [v12 bundleIdentifier];

    if (!v13)
    {
      uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
      __int16 v30 = [NSString stringWithUTF8String:"-[MRNowPlayingClient initWithPlayerPath:]"];
      [v29 handleFailureInFunction:v30, @"MRNowPlayingOriginClient.m", 452, @"Invalid parameter not satisfying: %@", @"client.bundleIdentifier" file lineNumber description];
    }
    if (![v12 processIdentifier])
    {
      uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v32 = [NSString stringWithUTF8String:"-[MRNowPlayingClient initWithPlayerPath:]"];
      [v31 handleFailureInFunction:v32, @"MRNowPlayingOriginClient.m", 453, @"Invalid parameter not satisfying: %@", @"client.processIdentifier" file lineNumber description];
    }
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    playerClients = v5->_playerClients;
    v5->_playerClients = v14;

    long long v16 = [(MRPlayerPath *)v5->_playerPath origin];
    int v17 = [v16 isLocal];

    if (v17)
    {
      uint32_t v18 = v5->_avscQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __41__MRNowPlayingClient_initWithPlayerPath___block_invoke;
      block[3] = &unk_1E57D0518;
      v34 = v5;
      dispatch_async(v18, block);
    }
    v5->_isForeground = 1;
    v5->_useMediaRemoteActivePlayerHeuristic = 1;
    uint64_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("replayQueue", v19);
    replayQueue = v5->_replayQueue;
    v5->_replayQueue = (OS_dispatch_queue *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    commandQueue = v5->_commandQueue;
    v5->_commandQueue = (NSMutableArray *)v22;
  }
  return v5;
}

- (void)updateActivePlayerPath:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = self;
  objc_sync_enter(v7);
  v7->_useMediaRemoteActivePlayerHeuristic = 0;
  [(MRNowPlayingClient *)v7 setActivePlayerPath:v8 reason:@"API Usage" completion:v6];
  objc_sync_exit(v7);
}

- (void)reevaluateActivePlayerWithReason:(id)a3 completion:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if (v8->_useMediaRemoteActivePlayerHeuristic)
  {
    uint64_t v9 = [(MRNowPlayingClient *)v8 playerClients];
    id v10 = objc_msgSend(v9, "mr_filter:", &__block_literal_global_93);

    id v11 = (void *)MEMORY[0x1E4F29008];
    long long v12 = NSStringFromSelector(sel_activeRequestedDate);
    uint64_t v13 = [v11 sortDescriptorWithKey:v12 ascending:0];

    v24[0] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    uint64_t v15 = [v10 sortedArrayUsingDescriptors:v14];

    BOOL isForeground = v8->_isForeground;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __66__MRNowPlayingClient_reevaluateActivePlayerWithReason_completion___block_invoke_2;
    v22[3] = &__block_descriptor_33_e34_B16__0__MRNowPlayingPlayerClient_8l;
    BOOL v23 = isForeground;
    objc_msgSend(v15, "mr_first:", v22);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      uint32_t v18 = [v15 firstObject];
      uint64_t v19 = v18;
      if (v18)
      {
        id v17 = v18;
      }
      else
      {
        dispatch_queue_t v20 = [(MRNowPlayingClient *)v8 playerClients];
        objc_msgSend(v20, "mr_first:", &__block_literal_global_278_0);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v21 = [v17 playerPath];
    [(MRNowPlayingClient *)v8 setActivePlayerPath:v21 reason:v6 completion:v7];
  }
  objc_sync_exit(v8);
}

- (NSArray)playerClients
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = (void *)[(NSMutableArray *)v2->_playerClients copy];
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setActivePlayerPath:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  objc_sync_enter(v11);
  activePlayer = v11->_activePlayer;
  uint64_t v13 = [v8 player];
  uint64_t v14 = activePlayer;
  uint64_t v15 = v13;
  if (v14 == v15)
  {
  }
  else
  {
    long long v16 = v15;
    BOOL v17 = [(MRPlayer *)v14 isEqual:v15];

    if (!v17)
    {
      if (v11->_activePlayer)
      {
        uint32_t v18 = _MRLogForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = v11->_activePlayer;
          dispatch_queue_t v20 = [v8 player];
          *(_DWORD *)buf = 138544130;
          id v40 = v8;
          __int16 v41 = 2114;
          v42 = @"ActivePlayerPath";
          __int16 v43 = 2112;
          v44 = v19;
          __int16 v45 = 2112;
          v46 = v20;
          _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", buf, 0x2Au);
        }
      }
      else
      {
        uint32_t v18 = _MRLogForCategory(0);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [v8 player];
          *(_DWORD *)buf = 138543874;
          id v40 = v8;
          __int16 v41 = 2114;
          v42 = @"ActivePlayerPath";
          __int16 v43 = 2112;
          v44 = v21;
          _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);
        }
      }

      uint64_t v22 = [v8 player];
      BOOL v23 = v11->_activePlayer;
      v11->_activePlayer = (MRPlayer *)v22;

      __int16 v24 = [MEMORY[0x1E4F1C9C8] now];
      uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
      __int16 v26 = [v25 UUIDString];

      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", @"setNowPlayingPlayer", v26];
      __int16 v28 = v27;
      if (v8) {
        [v27 appendFormat:@" for %@", v8];
      }
      if (v9) {
        [v28 appendFormat:@" because %@", v9];
      }
      uint64_t v29 = _MRLogForCategory(0xAuLL);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v40 = v28;
        _os_log_impl(&dword_194F3C000, v29, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
      }

      __int16 v30 = (void *)MRGetSharedService();
      uint64_t v31 = dispatch_get_global_queue(0, 0);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __60__MRNowPlayingClient_setActivePlayerPath_reason_completion___block_invoke;
      v34[3] = &unk_1E57D0E80;
      id v35 = v8;
      id v32 = v26;
      id v36 = v32;
      id v33 = v24;
      id v37 = v33;
      id v38 = v10;
      MRMediaRemoteServiceSetNowPlayingPlayer(v30, v35, v31, v34);

      goto LABEL_18;
    }
  }
  if (v10) {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_18:
  objc_sync_exit(v11);
}

uint64_t __66__MRNowPlayingClient_reevaluateActivePlayerWithReason_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 playerPath];
  BOOL v3 = [v2 player];
  uint64_t v4 = [v3 isDefaultPlayer];

  return v4;
}

uint64_t __47__MRNowPlayingClient_canBeNowPlayingForPlayer___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 playerPath];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MRNowPlayingClient;
  [(MRNowPlayingClient *)&v2 dealloc];
}

- (void)setCanBeNowPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = obj;
  if (obj->_canBeNowPlaying != v3)
  {
    obj->_BOOL canBeNowPlaying = v3;
    if (v3)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v4 = obj;
      obj->_canBeNowPlayingTimestamp = v5;
      if (!obj->_perPlayerCanBeNowPlaying)
      {
        id v6 = (void *)[[NSString alloc] initWithFormat:@"canBeNowPlaying=YES for %@", obj->_playerPath];
        [(MRNowPlayingClient *)obj sendQueuedCommandsWithReason:v6];

        uint64_t v4 = obj;
      }
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)perPlayerCanBeNowPlaying
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  BOOL perPlayerCanBeNowPlaying = v2->_perPlayerCanBeNowPlaying;
  objc_sync_exit(v2);

  return perPlayerCanBeNowPlaying;
}

- (void)setClient:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [(MRPlayerPath *)v4->_playerPath setClient:v5];
  objc_sync_exit(v4);
}

- (void)mergeClient:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = [(MRPlayerPath *)v4->_playerPath client];
  [v5 mergeFrom:v6];

  objc_sync_exit(v4);
}

- (void)requestActiveForPlayerPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(MRNowPlayingClient *)v8 nowPlayingPlayerClientForPlayerPath:v6];
  id v10 = [MEMORY[0x1E4F1C9C8] now];
  [v9 setActiveRequestedDate:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__MRNowPlayingClient_requestActiveForPlayerPath_completion___block_invoke;
  v14[3] = &unk_1E57D8458;
  v14[4] = v8;
  id v11 = v6;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v7;
  id v17 = v13;
  [(MRNowPlayingClient *)v8 reevaluateActivePlayerWithReason:@"Attempting to set now playing player if possible" completion:v14];

  objc_sync_exit(v8);
}

uint64_t __60__MRNowPlayingClient_requestActiveForPlayerPath_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) activePlayerPath];
    if ([v4 isEqual:*(void *)(a1 + 40)])
    {
    }
    else
    {
      int v5 = [*(id *)(a1 + 48) isPictureInPictureEnabled];

      if (v5)
      {
        id v3 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:41];
        goto LABEL_7;
      }
    }
    id v3 = 0;
  }
LABEL_7:
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6)
  {
    id v8 = v3;
    uint64_t v6 = (*(uint64_t (**)(void))(v6 + 16))();
    id v3 = v8;
  }

  return MEMORY[0x1F41817F8](v6, v3);
}

uint64_t __66__MRNowPlayingClient_reevaluateActivePlayerWithReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!*(unsigned char *)(a1 + 32))
  {
    if ([v3 isPictureInPictureEnabled])
    {
      uint64_t v5 = 1;
      goto LABEL_7;
    }
    if (!*(unsigned char *)(a1 + 32))
    {
      uint64_t v5 = 0;
      goto LABEL_7;
    }
  }
  uint64_t v5 = [v4 isPictureInPictureEnabled] ^ 1;
LABEL_7:

  return v5;
}

- (void)applicationWillEnterForeground
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isForeground = 1;
  [(MRNowPlayingClient *)obj reevaluateActivePlayerWithReason:@"Application will enter foreground" completion:0];
  objc_sync_exit(obj);
}

- (void)applicationDidEnterBackground
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isForeground = 0;
  [(MRNowPlayingClient *)obj reevaluateActivePlayerWithReason:@"Application did enter background" completion:0];
  objc_sync_exit(obj);
}

- (MRPlayerPath)activePlayerPath
{
  objc_super v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(MRPlayerPath *)v2->_playerPath copy];
  uint64_t v4 = (void *)[(MRPlayer *)v2->_activePlayer copy];
  [v3 setPlayer:v4];

  objc_sync_exit(v2);

  return (MRPlayerPath *)v3;
}

- (void)removePlayer:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = v5->_playerClients;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = *(void *)v18;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v6);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      id v11 = [v10 playerPath];
      if ([v11 isEqual:v4])
      {
        [(NSMutableArray *)v5->_playerClients removeObject:v10];
        id v12 = [(MRNowPlayingClient *)v5 activePlayerPath];
        id v13 = v4;
        uint64_t v14 = v13;
        if (v12 == v13)
        {
        }
        else
        {
          int v15 = [v12 isEqual:v13];

          if (!v15) {
            goto LABEL_15;
          }
        }
        id v16 = (void *)[[NSString alloc] initWithFormat:@"Active player %@ was removed", v14];
        [(MRNowPlayingClient *)v5 reevaluateActivePlayerWithReason:v16 completion:0];

LABEL_15:
        goto LABEL_16;
      }
    }
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_16:

  objc_sync_exit(v5);
}

- (void)enqueueCommand:(unsigned int)a3 options:(id)a4 playerPath:(id)a5 commandCompletion:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v31 = a6;
  id v12 = objc_alloc_init(MRNowPlayingClientCommandQueueEntry);
  [(MRNowPlayingClientCommandQueueEntry *)v12 setCommand:v8];
  [(MRNowPlayingClientCommandQueueEntry *)v12 setOptions:v10];
  id v13 = (void *)[v11 copy];
  [(MRNowPlayingClientCommandQueueEntry *)v12 setPlayerPath:v13];

  uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
  [(MRNowPlayingClientCommandQueueEntry *)v12 setDateCreated:v14];

  [(MRNowPlayingClientCommandQueueEntry *)v12 setCommandCompletion:v31];
  int v15 = [v10 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];
  id v16 = MRMediaRemoteCopyCommandDescription(v8);
  __int16 v30 = [NSString stringWithFormat:@"Enqueueing command for %@", self->_playerPath];
  long long v17 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v39 = v16;
    __int16 v40 = 2114;
    __int16 v41 = v15;
    __int16 v42 = 2112;
    __int16 v43 = v30;
    _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  long long v18 = self;
  objc_sync_enter(v18);
  [(NSMutableArray *)v18->_commandQueue addObject:v12];
  if (!v18->_perPlayerCanBeNowPlaying && v18->_canBeNowPlaying)
  {
    __int16 v24 = (void *)[[NSString alloc] initWithFormat:@"canBeNowPlaying=YES for %@", self->_playerPath];
    [(MRNowPlayingClient *)v18 sendQueuedCommandsWithReason:v24];

    goto LABEL_11;
  }
  if (![v11 isResolved])
  {
LABEL_10:
    uint64_t v25 = +[MRUserSettings currentSettings];
    [v25 queuedCommandsTimeoutInterval];
    double v27 = v26;

    dispatch_time_t v28 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
    replayQueue = v18->_replayQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke_2;
    block[3] = &unk_1E57D3480;
    void block[4] = v18;
    id v33 = v12;
    id v34 = v16;
    id v35 = v15;
    dispatch_after(v28, replayQueue, block);

    goto LABEL_11;
  }
  playerClients = v18->_playerClients;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke;
  v36[3] = &unk_1E57D8F30;
  id v37 = v11;
  long long v20 = [(NSMutableArray *)playerClients msv_firstWhere:v36];
  if (![v20 canBeNowPlayingPlayer])
  {

    goto LABEL_10;
  }
  id v21 = [NSString alloc];
  uint64_t v22 = [v20 playerPath];
  BOOL v23 = (void *)[v21 initWithFormat:@"canBeNowPlayingPlayer=YES for %@", v22];

  [(MRNowPlayingClient *)v18 sendQueuedCommandsWithReason:v23];
LABEL_11:
  objc_sync_exit(v18);
}

uint64_t __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 playerPath];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if ([*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)])
  {
    id v3 = [NSString alloc];
    uint64_t v4 = [*(id *)(a1 + 40) dateCreated];
    [v4 timeIntervalSinceNow];
    uint64_t v6 = objc_msgSend(v3, "initWithFormat:", @"Removing previously queued command because it timed out (enqueued for %f seconds)", v5);

    uint64_t v7 = _MRLogForCategory(0xAuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      long long v19 = v6;
      _os_log_impl(&dword_194F3C000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    id v10 = [*(id *)(a1 + 40) commandCompletion];

    if (v10)
    {
      id v11 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke_302;
      block[3] = &unk_1E57D0518;
      id v13 = *(id *)(a1 + 40);
      dispatch_async(v11, block);
    }
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  }
  objc_sync_exit(v2);
}

void __74__MRNowPlayingClient_enqueueCommand_options_playerPath_commandCompletion___block_invoke_302(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) commandCompletion];
  v1 = +[MRCommandResult commandResultWithSendError:17];
  v2[2](v2, v1);
}

void __51__MRNowPlayingClient_sendQueuedCommandsWithReason___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v1 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v5 = [v4 options];
        uint64_t v6 = [v5 objectForKeyedSubscript:@"kMRMediaRemoteOptionCommandID"];

        uint64_t v7 = MRMediaRemoteCopyCommandDescription([v4 command]);
        uint64_t v8 = [NSString stringWithFormat:@"Sending previously queued command because %@", *(void *)(a1 + 40)];
        uint64_t v9 = _MRLogForCategory(0xAuLL);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v22 = v7;
          __int16 v23 = 2114;
          __int16 v24 = v6;
          __int16 v25 = 2112;
          double v26 = v8;
          _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
        }

        id v10 = [v4 playerPath];
        uint64_t v11 = [v4 command];
        id v12 = [v4 options];
        id v13 = [v4 commandCompletion];
        MRServiceClientRemotePlayerPathCommandCallback(v10, v11, v12, v13);
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v2);
  }
}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  uint64_t v4 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClient] AVAudioSessionMediaServicesWereReset notification received -- restoring now playing app eligibility state", buf, 2u);
  }

  avscQueue = self->_avscQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRNowPlayingClient__avSessionMediaServicesResetNotification___block_invoke;
  block[3] = &unk_1E57D0518;
  void block[4] = self;
  dispatch_async(avscQueue, block);
}

void __63__MRNowPlayingClient__avSessionMediaServicesResetNotification___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(Class)getAVSystemControllerClass_0[0]() sharedAVSystemController];
  id v3 = getAVSystemController_ServerConnectionDiedNotification[0]();
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v5 = getAVSystemController_SubscribeToNotificationsAttribute[0]();
  [v2 setAttribute:v4 forKey:v5 error:0];

  if ([*(id *)(a1 + 32) canBeNowPlaying])
  {
    uint64_t v6 = getAVSystemController_CanBeNowPlayingAppAttribute_0[0]();
    [v2 setAttribute:MEMORY[0x1E4F1CC38] forKey:v6 error:0];
  }
}

- (void)restoreNowPlayingClientState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_canBeNowPlaying)
  {
    id v3 = (void *)MRGetSharedService();
    MRMediaRemoteServiceSetCanBeNowPlayingApp(v3, 1, v2->_canBeNowPlayingTimestamp);
  }
  if (v2->_activePlayer)
  {
    uint64_t v4 = (void *)MRGetSharedService();
    uint64_t v5 = [(MRNowPlayingClient *)v2 activePlayerPath];
    MRMediaRemoteServiceSetNowPlayingPlayer(v4, v5, 0, 0);
  }
  uint64_t v6 = [(MRPlayerPath *)v2->_playerPath client];
  if ([v6 hasAuxiliaryProperties])
  {
    uint64_t v7 = (void *)MRGetSharedService();
    MRMediaRemoteServiceUpdateClientProperties(v7, v2->_playerPath, 0, 0);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v8 = v2->_playerClients;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "restoreNowPlayingClientState", (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v2);
}

- (id)description
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v7.receiver = v2;
  v7.super_class = (Class)MRNowPlayingClient;
  id v3 = [(MRNowPlayingClient *)&v7 description];
  uint64_t v4 = [(MRPlayerPath *)v2->_playerPath client];
  uint64_t v5 = [v3 stringByAppendingFormat:@"Client: %@ Players: %@", v4, v2->_playerClients];

  objc_sync_exit(v2);

  return v5;
}

- (id)debugDescription
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  id v3 = NSString;
  playerPath = v2->_playerPath;
  uint64_t v22 = [(MRPlayerPath *)playerPath client];
  id v21 = MRCreateIndentedDebugDescriptionFromObject(v22);
  long long v20 = MRCreateIndentedDebugDescriptionFromObject(v2->_activePlayer);
  if (v2->_isForeground) {
    uint64_t v5 = @"YES";
  }
  else {
    uint64_t v5 = @"NO";
  }
  long long v19 = MRCreateIndentedDebugDescriptionFromObject(v5);
  if (v2->_perPlayerCanBeNowPlaying) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  objc_super v7 = MRCreateIndentedDebugDescriptionFromObject(v6);
  if (v2->_canBeNowPlaying) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  uint64_t v9 = MRCreateIndentedDebugDescriptionFromObject(v8);
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v2->_canBeNowPlayingTimestamp];
  uint64_t v11 = MRCreateIndentedDebugDescriptionFromObject(v10);
  if ([(MRNowPlayingClient *)v2 canBeNowPlaying]) {
    long long v12 = @"YES";
  }
  else {
    long long v12 = @"NO";
  }
  long long v13 = MRCreateIndentedDebugDescriptionFromObject(v12);
  long long v14 = MRCreateIndentedDebugDescriptionFromArray(v2->_commandQueue);
  long long v15 = MRCreateIndentedDebugDescriptionFromArray(v2->_playerClients);
  __int16 v16 = [v3 stringWithFormat:@"    playerPath = %@\n    client = %@\n    activePlayer = %@\n    isForeground = %@\n    perPlayerCanBeNowPlaying = %@\n    canBeNowPlaying = %@\n    canBeNowPlayingTimeStamp = %@\n    effectiveCanBeNowPlaying = %@\n    enqueueCommands = %@\n    playerClients = %@\n", playerPath, v21, v20, v19, v7, v9, v11, v13, v14, v15];
  uint64_t v17 = MRCreateFormattedDebugDescriptionFromClass(v2, v16);

  objc_sync_exit(v2);

  return v17;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (BOOL)useMediaRemoteActivePlayerHeuristic
{
  return self->_useMediaRemoteActivePlayerHeuristic;
}

- (void)setUseMediaRemoteActivePlayerHeuristic:(BOOL)a3
{
  self->_useMediaRemoteActivePlayerHeuristic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_avscQueue, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_replayQueue, 0);
  objc_storeStrong((id *)&self->_playerClients, 0);

  objc_storeStrong((id *)&self->_activePlayer, 0);
}

void __60__MRNowPlayingClient_setActivePlayerPath_reason_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 48)];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_194F3C000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);
}

@end