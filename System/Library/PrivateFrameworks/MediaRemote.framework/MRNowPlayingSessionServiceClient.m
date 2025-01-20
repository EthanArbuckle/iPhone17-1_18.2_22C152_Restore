@interface MRNowPlayingSessionServiceClient
- (MRNowPlayingSessionServiceClient)initWithService:(id)a3;
- (id)_existingPlayerPathForOrigin:(id)a3;
- (id)_generatePlayerID;
- (id)_generatePlayerPathForOrigin:(id)a3;
- (void)_handleCreatePlayerForOrigin:(id)a3 deviceInfo:(id)a4 completion:(id)a5;
- (void)_handleDestroyPlayersForOrigin:(id)a3;
- (void)mediaServicesResetNotification:(id)a3;
@end

@implementation MRNowPlayingSessionServiceClient

- (MRNowPlayingSessionServiceClient)initWithService:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MRNowPlayingSessionServiceClient;
  v6 = [(MRNowPlayingSessionServiceClient *)&v28 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    playerPathsByOrigin = v6->_playerPathsByOrigin;
    v6->_playerPathsByOrigin = (NSMutableDictionary *)v7;

    v9 = [v5 service];
    v10 = [v9 mrXPCConnection];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke;
    v25[3] = &unk_1E57DA3C0;
    SEL v27 = a2;
    v11 = v6;
    v26 = v11;
    [v10 addCustomXPCHandler:v25 forKey:0x40000000000000BLL];

    v12 = [v5 service];
    v13 = [v12 mrXPCConnection];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke_3;
    v23 = &unk_1E57DA3E8;
    v14 = v11;
    v24 = v14;
    [v13 addCustomXPCHandler:&v20 forKey:0x40000000000000CLL];

    v15 = getAVAudioSessionMediaServicesWereLostNotification[0]();

    if (!v15)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v14, @"MRNowPlayingSessionServiceClient.m", 65, @"Invalid parameter not satisfying: %@", @"AVAudioSessionMediaServicesWereLostNotification", v20, v21, v22, v23 object file lineNumber description];
    }
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v17 = getAVAudioSessionMediaServicesWereLostNotification[0]();
    [v16 addObserver:v14 selector:sel_mediaServicesResetNotification_ name:v17 object:0];
  }
  return v6;
}

void __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = MRCreatePlayerPathFromXPCMessage(v3);
  id v5 = MRCreateDeviceInfoFromXPCMessage(v3);
  v6 = [v5 routingContextID];

  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"MRNowPlayingSessionServiceClient.m", 45, @"Invalid parameter not satisfying: %@", @"deviceInfo.routingContextID" object file lineNumber description];
  }
  uint64_t v7 = *(void **)(a1 + 32);
  v8 = [v4 origin];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke_2;
  v11[3] = &unk_1E57DA398;
  id v12 = v3;
  id v9 = v3;
  [v7 _handleCreatePlayerForOrigin:v8 deviceInfo:v5 completion:v11];
}

void __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    v8 = reply;
    if (reply)
    {
      MRAddPlayerPathToXPCMessage(reply, v9);
      MRAddClientErrorToXPCMessage(v8, (uint64_t)v5);
      xpc_connection_send_message(v6, v8);
    }
  }
}

void __52__MRNowPlayingSessionServiceClient_initWithService___block_invoke_3(uint64_t a1, void *a2)
{
  MRCreateOriginFromXPCMessage(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _handleDestroyPlayersForOrigin:v3];
}

- (void)mediaServicesResetNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[MRNowPlayingOriginClientManager sharedManager];
  v6 = [v5 destroyPlayerCallback];

  uint64_t v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)[(NSMutableDictionary *)v7->_playerPathsByOrigin copy];
  objc_sync_exit(v7);

  if ([v8 count])
  {
    id v9 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionServiceClient] Destroying all players %@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__MRNowPlayingSessionServiceClient_mediaServicesResetNotification___block_invoke;
  v12[3] = &unk_1E57DA410;
  id v10 = v6;
  id v13 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
  v11 = v7;
  objc_sync_enter(v11);
  [(NSMutableDictionary *)v7->_playerPathsByOrigin removeAllObjects];
  objc_sync_exit(v11);
}

void __67__MRNowPlayingSessionServiceClient_mediaServicesResetNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a3);
  }
  v6 = +[MRNowPlayingOriginClientManager sharedManager];
  [v6 removeOrigin:v7];
}

- (void)_handleDestroyPlayersForOrigin:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[MRNowPlayingOriginClientManager sharedManager];
  v6 = [v5 destroyPlayerCallback];

  id v7 = self;
  objc_sync_enter(v7);
  v8 = [(NSMutableDictionary *)v7->_playerPathsByOrigin objectForKeyedSubscript:v4];
  [(NSMutableDictionary *)v7->_playerPathsByOrigin setObject:0 forKeyedSubscript:v4];
  objc_sync_exit(v7);

  if (v8)
  {
    id v9 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionServiceClient] Destroying player %@ created for origin: %@", (uint8_t *)&v11, 0x16u);
    }

    if (v6) {
      ((void (**)(void, void *))v6)[2](v6, v8);
    }
  }
  id v10 = +[MRNowPlayingOriginClientManager sharedManager];
  [v10 removeOrigin:v4];
}

- (void)_handleCreatePlayerForOrigin:(id)a3 deviceInfo:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, void *, void *))a5;
  id v12 = [(MRNowPlayingSessionServiceClient *)self _existingPlayerPathForOrigin:v9];
  if (!v12)
  {
    id v14 = +[MRNowPlayingOriginClientManager sharedManager];
    uint64_t v15 = [v14 createNewPlayerCallback];

    if (v15)
    {
      uint64_t v16 = [v10 routingContextID];

      if (!v16)
      {
        SEL v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:a2, self, @"MRNowPlayingSessionServiceClient.m", 137, @"Invalid parameter not satisfying: %@", @"deviceInfo.routingContextID" object file lineNumber description];
      }
      v17 = +[MRNowPlayingOriginClientManager sharedManager];
      v18 = [v10 routingContextID];
      v19 = [v17 createCustomOriginClientForOrigin:v9 routingContextID:v18];

      id v12 = [(MRNowPlayingSessionServiceClient *)self _generatePlayerPathForOrigin:v9];
      uint64_t v20 = +[MRNowPlayingOriginClientManager sharedManager];
      uint64_t v21 = [v20 playerClientForPlayerPath:v12];

      v22 = [v10 routingContextID];
      ((void (**)(void, MRPlayerPath *, void *))v15)[2](v15, v12, v22);
    }
    else
    {
      if (![v9 isLocal])
      {
        v26 = _MRLogForCategory(1uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_194F3C000, v26, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionServiceClient] Not creating new player for origin because createNewPlayerCallback was not registered", buf, 2u);
        }

        v24 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:14];
        id v12 = 0;
        goto LABEL_12;
      }
      v23 = [MRPlayerPath alloc];
      v19 = +[MRClient localClient];
      id v12 = [(MRPlayerPath *)v23 initWithOrigin:v9 client:v19 player:0];
    }

    v24 = 0;
LABEL_12:
    v25 = self;
    objc_sync_enter(v25);
    [(NSMutableDictionary *)v25->_playerPathsByOrigin setObject:v12 forKeyedSubscript:v9];
    objc_sync_exit(v25);

    v11[2](v11, v12, v24);
    goto LABEL_13;
  }
  __int16 v13 = _MRLogForCategory(1uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v12;
    _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionServiceClient] Not creating new player for origin because playerPath already exists: %@", buf, 0xCu);
  }

  v11[2](v11, v12, 0);
LABEL_13:
}

- (id)_existingPlayerPathForOrigin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_playerPathsByOrigin objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)_generatePlayerPathForOrigin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRNowPlayingSessionServiceClient *)self _generatePlayerID];
  v6 = [MRPlayerPath alloc];
  id v7 = +[MRClient localClient];
  v8 = [[MRPlayer alloc] initWithIdentifier:v5 displayName:v5];
  id v9 = [(MRPlayerPath *)v6 initWithOrigin:v4 client:v7 player:v8];

  return v9;
}

- (id)_generatePlayerID
{
  v2 = +[MRNowPlayingOriginClientManager sharedManager];
  id v3 = [v2 generatePlayerIDCallback];

  if (!v3 || (v3[2](v3), (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    id v4 = [v5 UUIDString];
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end