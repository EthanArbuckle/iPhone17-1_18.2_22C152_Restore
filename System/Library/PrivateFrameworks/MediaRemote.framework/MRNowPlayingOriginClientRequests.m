@interface MRNowPlayingOriginClientRequests
- (MRDeviceInfo)deviceInfo;
- (MRNowPlayingOriginClientRequests)initWithOrigin:(id)a3;
- (MROrigin)origin;
- (MRPlayerPath)playerPath;
- (NSArray)nowPlayingClientRequests;
- (NSDate)lastPlayingDate;
- (NSNumber)volume;
- (NSNumber)volumeCapabilities;
- (id)debugDescription;
- (id)existingNowPlayingClientRequestsForPlayerPath:(id)a3;
- (id)nowPlayingClientRequestsForPlayerPath:(id)a3;
- (void)dealloc;
- (void)handleDeviceInfoRequestWithCompletion:(id)a3;
- (void)handleLastPlayingDateRequestWithCompletion:(id)a3;
- (void)handleVolumeCapabilitiesRequestWithCompletion:(id)a3;
- (void)handleVolumeRequestWithCompletion:(id)a3;
- (void)removeAllClients;
- (void)removeClient:(id)a3;
- (void)restoreNowPlayingClientState;
- (void)setDeviceInfo:(id)a3;
- (void)setLastPlayingDate:(id)a3;
- (void)setVolume:(id)a3;
- (void)setVolumeCapabilities:(id)a3;
@end

@implementation MRNowPlayingOriginClientRequests

void __82__MRNowPlayingOriginClientRequests_existingNowPlayingClientRequestsForPlayerPath___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "client", (void)v11);
        v9 = [*(id *)(a1 + 40) client];
        int v10 = [v8 isEqual:v9];

        if (v10)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void __74__MRNowPlayingOriginClientRequests_nowPlayingClientRequestsForPlayerPath___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "client", (void)v14);
        v9 = [*(id *)(a1 + 40) client];
        int v10 = [v8 isEqual:v9];

        if (v10)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v11 = [[MRNowPlayingClientRequests alloc] initWithPlayerPath:*(void *)(a1 + 40)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

- (id)existingNowPlayingClientRequestsForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__17;
  long long v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  uint64_t v5 = [v4 client];

  if (v5)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__MRNowPlayingOriginClientRequests_existingNowPlayingClientRequestsForPlayerPath___block_invoke;
    block[3] = &unk_1E57D3118;
    block[4] = self;
    id v10 = v4;
    long long v11 = &v12;
    dispatch_sync(serialQueue, block);
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __46__MRNowPlayingOriginClientRequests_deviceInfo__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];

  return MEMORY[0x1F41817F8]();
}

- (MRDeviceInfo)deviceInfo
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__17;
  v8 = __Block_byref_object_dispose__17;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRDeviceInfo *)v2;
}

void __74__MRNowPlayingOriginClientRequests_handleDeviceInfoRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(void *)(v7 + 16))
  {
    [(id)v7 setDeviceInfo:v5];
    uint64_t v7 = *(void *)(a1 + 32);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(v7 + 56);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "removeAllObjects", (void)v13);
}

- (void)setDeviceInfo:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (id)nowPlayingClientRequestsForPlayerPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = __Block_byref_object_copy__17;
  long long v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  id v5 = [v4 client];

  if (v5)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__MRNowPlayingOriginClientRequests_nowPlayingClientRequestsForPlayerPath___block_invoke;
    block[3] = &unk_1E57D3118;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(serialQueue, block);
  }
  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)handleVolumeCapabilitiesRequestWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MRNowPlayingOriginClientRequests.m", 255, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__MRNowPlayingOriginClientRequests_handleVolumeCapabilitiesRequestWithCompletion___block_invoke;
  block[3] = &unk_1E57D03B0;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

- (void)handleVolumeRequestWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MRNowPlayingOriginClientRequests.m", 223, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__MRNowPlayingOriginClientRequests_handleVolumeRequestWithCompletion___block_invoke;
  block[3] = &unk_1E57D03B0;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

uint64_t __74__MRNowPlayingOriginClientRequests_handleDeviceInfoRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 16))
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  else
  {
    id v5 = *(void **)(v2 + 56);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 56);
      *(void *)(v7 + 56) = v6;

      id v5 = *(void **)(*(void *)(a1 + 32) + 56);
    }
    uint64_t v9 = (void *)[*(id *)(a1 + 40) copy];
    id v10 = (void *)MEMORY[0x1997190F0]();
    [v5 addObject:v10];

    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 56) count];
    if (result == 1)
    {
      uint64_t v11 = (void *)MRGetSharedService();
      uint64_t v12 = *(void *)(a1 + 32);
      long long v13 = *(const char **)(v12 + 96);
      uint64_t v14 = *(void *)(v12 + 8);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __74__MRNowPlayingOriginClientRequests_handleDeviceInfoRequestWithCompletion___block_invoke_2;
      v15[3] = &unk_1E57D49A8;
      v15[4] = v12;
      return MRMediaRemoteServiceGetDeviceInfo(v11, v13, v14, (uint64_t)v15);
    }
  }
  return result;
}

- (void)handleDeviceInfoRequestWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MRNowPlayingOriginClientRequests.m", 191, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MRNowPlayingOriginClientRequests_handleDeviceInfoRequestWithCompletion___block_invoke;
  block[3] = &unk_1E57D03B0;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

void __58__MRNowPlayingOriginClientRequests_setVolumeCapabilities___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MRUserSettings currentSettings];
  int v3 = [v2 verboseOriginClientLogging];

  if (v3)
  {
    id v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
      id v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription([*(id *)(a1 + 40) intValue]);
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v6;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: volumeCapabilities %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (MRNowPlayingOriginClientRequests)initWithOrigin:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MRNowPlayingOriginClientRequests;
  id v6 = [(MRNowPlayingOriginClientRequests *)&v21 init];
  int v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_origin, a3);
    uint64_t v8 = [[MRPlayerPath alloc] initWithOrigin:v5 client:0 player:0];
    playerPath = v7->_playerPath;
    v7->_playerPath = v8;

    id v10 = (objc_class *)objc_opt_class();
    Name = class_getName(v10);
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create(Name, v12);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v13;

    long long v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nowPlayingClients = v7->_nowPlayingClients;
    v7->_nowPlayingClients = v15;

    id v17 = +[MRUserSettings currentSettings];
    LODWORD(v12) = [v17 verboseOriginClientLogging];

    if (v12)
    {
      uint64_t v18 = _MRLogForCategory(1uLL);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138412802;
        v23 = v7;
        __int16 v24 = 2112;
        id v25 = v5;
        __int16 v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] Creating %@ for origin %@ at %@", buf, 0x20u);
      }
    }
  }

  return v7;
}

void __46__MRNowPlayingOriginClientRequests_setVolume___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MRUserSettings currentSettings];
  int v3 = [v2 verboseOriginClientLogging];

  if (v3)
  {
    id v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 96);
      [*(id *)(a1 + 40) floatValue];
      int v7 = 138543618;
      uint64_t v8 = v5;
      __int16 v9 = 2048;
      double v10 = v6;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: volume %lf", (uint8_t *)&v7, 0x16u);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

void __50__MRNowPlayingOriginClientRequests_setDeviceInfo___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MRUserSettings currentSettings];
  int v3 = [v2 verboseOriginClientLogging];

  if (v3)
  {
    id v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v5;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: deviceInfo %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v7 = [*(id *)(a1 + 40) copy];
  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v7;
}

void __70__MRNowPlayingOriginClientRequests_handleVolumeRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 32);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 floatValue];
    uint64_t v5 = *(void (**)(uint64_t, void))(v4 + 16);
    v5(v4, 0);
  }
  else
  {
    uint64_t v6 = *(void **)(v2 + 64);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = *(void *)(a1 + 32);
      __int16 v9 = *(void **)(v8 + 64);
      *(void *)(v8 + 64) = v7;

      uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 64);
    }
    int v10 = (void *)[*(id *)(a1 + 40) copy];
    uint64_t v11 = (void *)MEMORY[0x1997190F0]();
    [v6 addObject:v11];

    if ([*(id *)(*(void *)(a1 + 32) + 64) count] == 1)
    {
      __int16 v12 = (void *)MRGetSharedService();
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(v13 + 8);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__MRNowPlayingOriginClientRequests_handleVolumeRequestWithCompletion___block_invoke_2;
      v15[3] = &unk_1E57D2F70;
      v15[4] = v13;
      MRMediaRemoteServiceGetMediaPlaybackVolume(v12, v14, v15);
    }
  }
}

void __82__MRNowPlayingOriginClientRequests_handleVolumeCapabilitiesRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(void **)(v2 + 24);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [v3 intValue];
    uint64_t v6 = *(void (**)(uint64_t, uint64_t, void))(v4 + 16);
    v6(v4, v5, 0);
  }
  else
  {
    id v7 = *(void **)(v2 + 72);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = *(void **)(v9 + 72);
      *(void *)(v9 + 72) = v8;

      id v7 = *(void **)(*(void *)(a1 + 32) + 72);
    }
    uint64_t v11 = (void *)[*(id *)(a1 + 40) copy];
    __int16 v12 = (void *)MEMORY[0x1997190F0]();
    [v7 addObject:v12];

    if ([*(id *)(*(void *)(a1 + 32) + 72) count] == 1)
    {
      uint64_t v13 = (void *)MRGetSharedService();
      uint64_t v14 = *(void *)(a1 + 32);
      long long v15 = *(void **)(v14 + 96);
      long long v16 = *(void **)(v14 + 8);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __82__MRNowPlayingOriginClientRequests_handleVolumeCapabilitiesRequestWithCompletion___block_invoke_2;
      v17[3] = &unk_1E57D2F98;
      v17[4] = v14;
      MRMediaRemoteServiceGetPickedRouteVolumeControlCapabilities(v13, v15, v16, v17);
    }
  }
}

uint64_t __82__MRNowPlayingOriginClientRequests_handleVolumeCapabilitiesRequestWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 24))
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInt:a2];
    [*(id *)(a1 + 32) setVolumeCapabilities:v4];

    uint64_t v3 = *(void *)(a1 + 32);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = *(id *)(v3 + 72);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "removeAllObjects", (void)v11);
}

- (void)setVolumeCapabilities:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

uint64_t __70__MRNowPlayingOriginClientRequests_handleVolumeRequestWithCompletion___block_invoke_2(uint64_t a1, double a2)
{
  float v2 = *(float *)&a2;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(void *)(v4 + 32))
  {
    id v5 = [NSNumber numberWithFloat:a2];
    [*(id *)(a1 + 32) setVolume:v5];

    uint64_t v4 = *(void *)(a1 + 32);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)(v4 + 64);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(float))(*(void *)(*((void *)&v12 + 1) + 8 * v10++) + 16))(v2);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "removeAllObjects", (void)v12);
}

- (void)setVolume:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = +[MRUserSettings currentSettings];
  int v4 = [v3 verboseOriginClientLogging];

  if (v4)
  {
    id v5 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      origin = self->_origin;
      uint64_t v7 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138412802;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      long long v12 = origin;
      __int16 v13 = 2112;
      long long v14 = v7;
      _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] Destroying %@ for origin %@ at %@", buf, 0x20u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)MRNowPlayingOriginClientRequests;
  [(MRNowPlayingOriginClientRequests *)&v8 dealloc];
}

- (id)debugDescription
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__17;
  objc_super v8 = __Block_byref_object_dispose__17;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __52__MRNowPlayingOriginClientRequests_debugDescription__block_invoke(uint64_t a1)
{
  id v2 = *(void ***)(a1 + 32);
  id v3 = NSString;
  MRCreateIndentedDebugDescriptionFromObject(v2[11]);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(void *)(a1 + 32) + 16));
  [*(id *)(*(void *)(a1 + 32) + 24) floatValue];
  uint64_t v6 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(v5);
  uint64_t v7 = MRCreateIndentedDebugDescriptionFromObject(v6);
  objc_super v8 = MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(void *)(a1 + 32) + 32));
  id v9 = MRCreateIndentedDebugDescriptionFromObject(*(void **)(*(void *)(a1 + 32) + 40));
  uint64_t v10 = MRCreateIndentedDebugDescriptionFromArray(*(void **)(*(void *)(a1 + 32) + 48));
  __int16 v11 = [v3 stringWithFormat:@"    origin = %@\n    deviceInfo = %@\n    volumeCapabilities = %@\n    volume = %@\n    lastPlayingDate = %@\n    nowPlayingClients = %@\n", v15, v4, v7, v8, v9, v10];
  uint64_t v12 = MRCreateFormattedDebugDescriptionFromClass(v2, v11);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MRNowPlayingOriginClientRequests_removeClient___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

void __49__MRNowPlayingOriginClientRequests_removeClient___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "client", (void)v11);
        id v9 = [*(id *)(a1 + 40) client];
        int v10 = [v8 isEqual:v9];

        if (v10)
        {
          [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v7];
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)removeAllClients
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MRNowPlayingOriginClientRequests_removeAllClients__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __52__MRNowPlayingOriginClientRequests_removeAllClients__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
}

- (NSArray)nowPlayingClientRequests
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__17;
  int v10 = __Block_byref_object_dispose__17;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__MRNowPlayingOriginClientRequests_nowPlayingClientRequests__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __60__MRNowPlayingOriginClientRequests_nowPlayingClientRequests__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x1F41817F8]();
}

- (NSNumber)volumeCapabilities
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__17;
  uint64_t v8 = __Block_byref_object_dispose__17;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSNumber *)v2;
}

void __54__MRNowPlayingOriginClientRequests_volumeCapabilities__block_invoke(uint64_t a1)
{
}

- (NSNumber)volume
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__17;
  uint64_t v8 = __Block_byref_object_dispose__17;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSNumber *)v2;
}

void __42__MRNowPlayingOriginClientRequests_volume__block_invoke(uint64_t a1)
{
}

- (void)setLastPlayingDate:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

void __55__MRNowPlayingOriginClientRequests_setLastPlayingDate___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = +[MRUserSettings currentSettings];
  int v3 = [v2 verboseOriginClientLogging];

  if (v3)
  {
    id v4 = _MRLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 96);
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingOriginClientRequests] %{public}@ UpdatingCache: lastPlayingDate %@", (uint8_t *)&v7, 0x16u);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

- (NSDate)lastPlayingDate
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  int v7 = __Block_byref_object_copy__17;
  uint64_t v8 = __Block_byref_object_dispose__17;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSDate *)v2;
}

void __51__MRNowPlayingOriginClientRequests_lastPlayingDate__block_invoke(uint64_t a1)
{
}

- (void)handleLastPlayingDateRequestWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MRNowPlayingOriginClientRequests.m", 286, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__MRNowPlayingOriginClientRequests_handleLastPlayingDateRequestWithCompletion___block_invoke;
  block[3] = &unk_1E57D03B0;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(serialQueue, block);
}

void __79__MRNowPlayingOriginClientRequests_handleLastPlayingDateRequestWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    int v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 80);
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 80);
      *(void *)(v6 + 80) = v5;

      uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 80);
    }
    uint64_t v8 = (void *)[*(id *)(a1 + 40) copy];
    id v9 = (void *)MEMORY[0x1997190F0]();
    [v4 addObject:v9];

    if ([*(id *)(*(void *)(a1 + 32) + 80) count] == 1)
    {
      id v10 = (void *)MRGetSharedService();
      uint64_t v11 = *(void *)(a1 + 32);
      long long v12 = *(void **)(v11 + 96);
      long long v13 = *(void **)(v11 + 8);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __79__MRNowPlayingOriginClientRequests_handleLastPlayingDateRequestWithCompletion___block_invoke_2;
      v14[3] = &unk_1E57D49D0;
      v14[4] = v11;
      MRMediaRemoteServiceGetLastPlayingDateForPlayer(v10, v12, v13, v14);
    }
  }
}

void __79__MRNowPlayingOriginClientRequests_handleLastPlayingDateRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  if (!*(void *)(v7 + 40))
  {
    [(id)v7 setLastPlayingDate:v5];
    uint64_t v7 = *(void *)(a1 + 32);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(v7 + 80);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "removeAllObjects", (void)v13);
}

- (void)restoreNowPlayingClientState
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MRNowPlayingOriginClientRequests_restoreNowPlayingClientState__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __64__MRNowPlayingOriginClientRequests_restoreNowPlayingClientState__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "restoreNowPlayingClientState", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (MROrigin)origin
{
  return self->_origin;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_lastPlayingDateCompletions, 0);
  objc_storeStrong((id *)&self->_volumeCapabilitiesCompletions, 0);
  objc_storeStrong((id *)&self->_volumeCompletions, 0);
  objc_storeStrong((id *)&self->_deviceInfoCompletions, 0);
  objc_storeStrong((id *)&self->_nowPlayingClients, 0);
  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_volumeCapabilities, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end