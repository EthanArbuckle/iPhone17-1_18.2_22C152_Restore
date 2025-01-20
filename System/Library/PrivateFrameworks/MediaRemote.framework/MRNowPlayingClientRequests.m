@interface MRNowPlayingClientRequests
- (MRClient)client;
- (MRClient)clientProperties;
- (MRNowPlayingClientRequests)initWithPlayerPath:(id)a3;
- (MRPlayerPath)playerPath;
- (NSArray)nowPlayingClients;
- (id)debugDescription;
- (id)existingNowPlayingPlayerClientRequestsForPlayerPath:(id)a3;
- (id)nowPlayingPlayerClientRequestsForPlayerPath:(id)a3;
- (void)handleClientPropertiesRequestWithCompletion:(id)a3;
- (void)removePlayer:(id)a3;
- (void)restoreNowPlayingClientState;
- (void)setClientProperties:(id)a3;
@end

@implementation MRNowPlayingClientRequests

- (MRClient)client
{
  return [(MRPlayerPath *)self->_playerPath client];
}

- (MRNowPlayingClientRequests)initWithPlayerPath:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MRNowPlayingClientRequests;
  v6 = [(MRNowPlayingClientRequests *)&v17 init];
  if (v6)
  {
    v7 = [v5 client];

    if (!v7)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[MRNowPlayingClientRequests initWithPlayerPath:]"];
      [v13 handleFailureInFunction:v14, @"MRNowPlayingOriginClientRequests.m", 342, @"Invalid parameter not satisfying: %@", @"playerPath.client" file lineNumber description];
    }
    v8 = [v5 client];
    int v9 = [v8 processIdentifier];

    if (!v9)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = [NSString stringWithUTF8String:"-[MRNowPlayingClientRequests initWithPlayerPath:]"];
      [v15 handleFailureInFunction:v16, @"MRNowPlayingOriginClientRequests.m", 343, @"Invalid parameter not satisfying: %@", @"playerPath.client.processIdentifier" file lineNumber description];
    }
    objc_storeStrong((id *)&v6->_playerPath, a3);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    playerClients = v6->_playerClients;
    v6->_playerClients = v10;
  }
  return v6;
}

- (id)existingNowPlayingPlayerClientRequestsForPlayerPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 player];

  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = v6->_playerClients;
    id v8 = (id)[(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "playerPath", (void)v15);
          int v13 = [v12 isEqual:v4];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v6);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)nowPlayingPlayerClientRequestsForPlayerPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 player];

  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = v6->_playerClients;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "playerPath", (void)v16);
        char v13 = [v12 isEqual:v4];

        if (v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v14 = v11;

      if (v14) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
    v14 = [[MRNowPlayingPlayerClientRequests alloc] initWithPlayerPath:v4];
    [(NSMutableArray *)v6->_playerClients addObject:v14];
LABEL_13:
    objc_sync_exit(v6);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  id v4 = MRCreateIndentedDebugDescriptionFromObject(v2->_playerPath);
  id v5 = MRCreateIndentedDebugDescriptionFromObject(v2->_clientProperties);
  v6 = MRCreateIndentedDebugDescriptionFromArray(v2->_playerClients);
  v7 = [v3 stringWithFormat:@"    playerPath = %@\n    clientProperties = %@\n    playerClients = %@\n", v4, v5, v6];
  uint64_t v8 = MRCreateFormattedDebugDescriptionFromClass(v2, v7);

  objc_sync_exit(v2);

  return v8;
}

- (void)setClientProperties:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v7 = [(MRPlayerPath *)v6->_playerPath client];
  char v8 = [v7 isEqual:v5];

  if ((v8 & 1) == 0)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, v6, @"MRNowPlayingOriginClientRequests.m", 381, @"Invalid parameter not satisfying: %@", @"[_playerPath.client isEqual:clientProperties]" object file lineNumber description];
  }
  uint64_t v9 = +[MRUserSettings currentSettings];
  int v10 = [v9 verboseOriginClientLogging];

  if (v10)
  {
    v11 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      playerPath = v6->_playerPath;
      *(_DWORD *)buf = 138543618;
      long long v17 = playerPath;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: clientProperties %{public}@", buf, 0x16u);
    }
  }
  uint64_t v13 = [v5 copy];
  clientProperties = v6->_clientProperties;
  v6->_clientProperties = (MRClient *)v13;

  objc_sync_exit(v6);
}

- (MRClient)clientProperties
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)[(MRClient *)v2->_clientProperties copy];
  objc_sync_exit(v2);

  return (MRClient *)v3;
}

- (void)removePlayer:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = v5->_playerClients;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "playerPath", (void)v13);
        int v12 = [v11 isEqual:v4];

        if (v12)
        {
          [(NSMutableArray *)v5->_playerClients removeObject:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
}

- (void)handleClientPropertiesRequestWithCompletion:(id)a3
{
  id v5 = (void (**)(id, MRClient *, void))a3;
  if (!v5)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MRNowPlayingOriginClientRequests.m", 448, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v6 = self;
  objc_sync_enter(v6);
  clientProperties = v6->_clientProperties;
  if (clientProperties)
  {
    v5[2](v5, clientProperties, 0);
  }
  else
  {
    clientPropertiesCompletions = v6->_clientPropertiesCompletions;
    if (!clientPropertiesCompletions)
    {
      uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v10 = v6->_clientPropertiesCompletions;
      v6->_clientPropertiesCompletions = v9;

      clientPropertiesCompletions = v6->_clientPropertiesCompletions;
    }
    v11 = (void *)[v5 copy];
    int v12 = (void *)MEMORY[0x1997190F0]();
    [(NSMutableArray *)clientPropertiesCompletions addObject:v12];

    if ([(NSMutableArray *)v6->_clientPropertiesCompletions count] == 1)
    {
      long long v13 = (void *)MRGetSharedService();
      playerPath = v6->_playerPath;
      long long v15 = +[MRMediaRemoteServiceClient sharedServiceClient];
      long long v16 = [v15 workerQueue];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __74__MRNowPlayingClientRequests_handleClientPropertiesRequestWithCompletion___block_invoke;
      v18[3] = &unk_1E57D49F8;
      v18[4] = v6;
      MRMediaRemoteServiceGetClientProperties(v13, playerPath, v16, v18);
    }
  }
  objc_sync_exit(v6);
}

void __74__MRNowPlayingClientRequests_handleClientPropertiesRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(void *)(v9 + 8))
  {
    objc_storeStrong((id *)(v9 + 8), a2);
    uint64_t v9 = *(void *)(a1 + 32);
  }
  int v10 = (void *)[*(id *)(v9 + 24) copy];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  objc_sync_exit(v8);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * i));
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)restoreNowPlayingClientState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v3 = v2->_playerClients;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "restoreNowPlayingClientState", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (NSArray)nowPlayingClients
{
  return self->_nowPlayingClients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingClients, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_clientPropertiesCompletions, 0);
  objc_storeStrong((id *)&self->_playerClients, 0);

  objc_storeStrong((id *)&self->_clientProperties, 0);
}

@end