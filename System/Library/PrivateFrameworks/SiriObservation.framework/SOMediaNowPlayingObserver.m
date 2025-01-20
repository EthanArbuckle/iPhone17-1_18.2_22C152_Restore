@interface SOMediaNowPlayingObserver
+ (id)defaultObserver;
- (BOOL)_isProxyGroupPlayer;
- (BOOL)_supportsProxyGroupPlayer;
- (SOMediaNowPlayingObserver)initWithQueue:(id)a3;
- (SOMediaNowPlayingObserver)initWithQueue:(id)a3 instanceContext:(id)a4;
- (int64_t)playbackState;
- (void)_beginGroup;
- (void)_endGroup;
- (void)_fetchLastPlayingDateWithCompletion:(id)a3;
- (void)_fetchNowPlayingAppPlaybackStateForReason:(id)a3 completion:(id)a4;
- (void)_handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:(id)a3;
- (void)_handleLastPlayingDateChangedTo:(id)a3;
- (void)_handleNowPlayingApplicationPlaybackStateChange:(int64_t)a3;
- (void)_startObservingNowPlayingAppPlaybackState;
- (void)_stopObservingNowPlayingAppPlaybackState;
- (void)_updateProxyGroupPlayerState;
- (void)addListener:(id)a3;
- (void)controller:(id)a3 didFailWithError:(id)a4;
- (void)controller:(id)a3 didLoadResponse:(id)a4;
- (void)controller:(id)a3 playbackQueueDidChangeFrom:(id)a4 to:(id)a5;
- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5;
- (void)controllerWillReloadForInvalidation:(id)a3;
- (void)dealloc;
- (void)getNowPlayingApplicationBundleIdentifier:(id)a3;
- (void)getNowPlayingInfoForCurrentItemWithCompletion:(id)a3;
- (void)getPlaybackStateAndLastPlayingDateWithCompletion:(id)a3;
- (void)getPlaybackStateWithCompletion:(id)a3;
- (void)getProxyGroupPlayerStateWithCompletion:(id)a3;
- (void)mediaRemoteActiveDeviceInfoDidChange:(id)a3;
- (void)mediaRemoteNowPlayingApplicationPlaybackStateDidChange:(id)a3;
- (void)mediaRemoteNowPlayingInfoDidChange:(id)a3;
- (void)removeListener:(id)a3;
@end

@implementation SOMediaNowPlayingObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
  objc_storeStrong((id *)&self->_playbackStateGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_fetchLastPlayingDateWithCompletion:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke;
  v17[3] = &unk_264486C78;
  objc_copyWeak(&v19, &location);
  id v5 = v4;
  id v18 = v5;
  v6 = (void *)MEMORY[0x223C1AA80](v17);
  nowPlayingController = self->_nowPlayingController;
  v8 = *MEMORY[0x263F28348];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG);
  if (nowPlayingController)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]";
      __int16 v23 = 2048;
      v24 = self;
      _os_log_debug_impl(&dword_21DE53000, v8, OS_LOG_TYPE_DEBUG, "%s %p Calling -[MRNowPlayingController performRequestWithCompletion:]...", buf, 0x16u);
    }
    v10 = self->_queue;
    v11 = self->_nowPlayingController;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_28;
    v14[3] = &unk_264486CA0;
    v12 = v10;
    v15 = v12;
    id v16 = v6;
    [(MRNowPlayingController *)v11 performRequestWithCompletion:v14];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]";
      __int16 v23 = 2048;
      v24 = self;
      _os_log_debug_impl(&dword_21DE53000, v8, OS_LOG_TYPE_DEBUG, "%s %p Calling MRMediaRemote C APIs...", buf, 0x16u);
    }
    id v13 = v6;
    MRMediaRemoteGetActiveOrigin();
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v9 = 136315650;
    v10 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]_block_invoke";
    __int16 v11 = 2048;
    id v12 = WeakRetained;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_debug_impl(&dword_21DE53000, v7, OS_LOG_TYPE_DEBUG, "%s %p lastPlayingDate = %@", (uint8_t *)&v9, 0x20u);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 _handleLastPlayingDateChangedTo:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_2;
  block[3] = &unk_2644870F0;
  id v11 = v6;
  id v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, block);
}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_30(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F548F8]) initWithOrigin:a3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_2_32;
    v7[3] = &unk_264486CC8;
    id v8 = *(id *)(a1 + 40);
    [v4 requestLastPlayingDateOnQueue:v5 completion:v7];
  }
  else
  {
    id v6 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_21DE53000, v6, OS_LOG_TYPE_ERROR, "%s Failed fetching active origin for Last Playing Date", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_2_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "-[SOMediaNowPlayingObserver _fetchLastPlayingDateWithCompletion:]_block_invoke_2";
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_error_impl(&dword_21DE53000, v7, OS_LOG_TYPE_ERROR, "%s Failed fetching Last Playing Date with error: %@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

void __65__SOMediaNowPlayingObserver__fetchLastPlayingDateWithCompletion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    v1 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v1();
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 48);
    id v3 = [*(id *)(a1 + 40) deviceLastPlayingDate];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)_fetchNowPlayingAppPlaybackStateForReason:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[SOMediaNowPlayingObserver _fetchNowPlayingAppPlaybackStateForReason:completion:]";
    __int16 v19 = 2048;
    v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_21DE53000, v8, OS_LOG_TYPE_INFO, "%s %p reason = %@", buf, 0x20u);
  }
  int v9 = (void *)mach_absolute_time();
  objc_initWeak((id *)buf, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__SOMediaNowPlayingObserver__fetchNowPlayingAppPlaybackStateForReason_completion___block_invoke;
  v13[3] = &unk_264486C50;
  v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  v16[1] = v9;
  objc_copyWeak(v16, (id *)buf);
  id v11 = v7;
  id v15 = v11;
  id v12 = (void *)MEMORY[0x223C1AA80](v13);
  _AFGetPlaybackState();

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);
}

uint64_t __82__SOMediaNowPlayingObserver__fetchNowPlayingAppPlaybackStateForReason_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v3 = (a2 - 1);
  if (v3 < 5) {
    uint64_t v4 = v3 + 1;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = v5;
    int v9 = AFMediaPlaybackStateGetName();
    mach_absolute_time();
    AFMachAbsoluteTimeGetTimeInterval();
    int v13 = 136316162;
    id v14 = "-[SOMediaNowPlayingObserver _fetchNowPlayingAppPlaybackStateForReason:completion:]_block_invoke";
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v10;
    _os_log_impl(&dword_21DE53000, v8, OS_LOG_TYPE_INFO, "%s %p reason = %@, state = %@ (took %f seconds)", (uint8_t *)&v13, 0x34u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleNowPlayingApplicationPlaybackStateChange:v4];

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

- (void)_handleLastPlayingDateChangedTo:(id)a3
{
}

- (void)_handleNowPlayingApplicationPlaybackStateChange:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  int64_t playbackState = self->_playbackState;
  if (playbackState != a3)
  {
    uint64_t v6 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      instanceContext = self->_instanceContext;
      id v8 = v6;
      int v9 = AFMediaPlaybackStateGetName();
      uint64_t v10 = AFMediaPlaybackStateGetName();
      *(_DWORD *)buf = 136316162;
      uint64_t v18 = "-[SOMediaNowPlayingObserver _handleNowPlayingApplicationPlaybackStateChange:]";
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = instanceContext;
      __int16 v23 = 2112;
      v24 = v9;
      __int16 v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_21DE53000, v8, OS_LOG_TYPE_INFO, "%s %p %@ fromState = %@, toState = %@", buf, 0x34u);

      int64_t playbackState = self->_playbackState;
    }
    self->_int64_t playbackState = a3;
    if (a3 == 1 || playbackState == 1)
    {
      id v11 = [MEMORY[0x263EFF910] date];
      [(SOMediaNowPlayingObserver *)self _handleLastPlayingDateChangedTo:v11];
    }
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    id v16[2] = __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke;
    v16[3] = &unk_264486C00;
    v16[4] = self;
    v16[5] = playbackState;
    v16[6] = a3;
    id v12 = (void (**)(void))MEMORY[0x223C1AA80](v16);
    int v13 = v12;
    if (self->_lastPlayingDate)
    {
      v12[2](v12);
    }
    else
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke_2;
      v14[3] = &unk_264486C28;
      void v14[4] = self;
      __int16 v15 = v12;
      [(SOMediaNowPlayingObserver *)self _fetchLastPlayingDateWithCompletion:v14];
    }
  }
}

void __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1[4] + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:", a1[4], a1[5], a1[6], v3, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke_3;
  block[3] = &unk_2644870F0;
  void block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __77__SOMediaNowPlayingObserver__handleNowPlayingApplicationPlaybackStateChange___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 136315650;
    uint64_t v7 = "-[SOMediaNowPlayingObserver _handleNowPlayingApplicationPlaybackStateChange:]_block_invoke_3";
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_debug_impl(&dword_21DE53000, v2, OS_LOG_TYPE_DEBUG, "%s %p fetched last playing date from MediaRemote: %@", (uint8_t *)&v6, 0x20u);
  }
  [*(id *)(a1 + 32) _handleLastPlayingDateChangedTo:*(void *)(a1 + 40)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)mediaRemoteActiveDeviceInfoDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[SOMediaNowPlayingObserver mediaRemoteActiveDeviceInfoDidChange:]";
    __int16 v12 = 2048;
    long long v13 = self;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s %p notification = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66__SOMediaNowPlayingObserver_mediaRemoteActiveDeviceInfoDidChange___block_invoke;
  v8[3] = &unk_2644870A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __66__SOMediaNowPlayingObserver_mediaRemoteActiveDeviceInfoDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateProxyGroupPlayerState];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:v3];
}

- (void)_handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F54E50]];

  if (v5)
  {
    int v6 = [v5 airPlayGroupUID];
    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = "-[SOMediaNowPlayingObserver _handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:]";
      __int16 v23 = 2048;
      v24 = self;
      __int16 v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_21DE53000, v7, OS_LOG_TYPE_INFO, "%s #hal %p airPlayGroupUID from kMRActiveDeviceInfoDidChangeNotification: %@", buf, 0x20u);
    }
    if ([v6 length])
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      __int16 v8 = self->_listeners;
      uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0
              && (objc_msgSend(v13, "nowPlayingObserver:isGroupIdentifierFromMediaRemoteActiveDeviceInfoIdenticalToContext:", self, v6, (void)v16) & 1) == 0)
            {
              id v15 = *MEMORY[0x263F28348];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                uint64_t v22 = "-[SOMediaNowPlayingObserver _handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:]";
                _os_log_impl(&dword_21DE53000, v15, OS_LOG_TYPE_INFO, "%s #hal Group identifier in mediaRemoteActiveDeviceInfo is different to group identifier in device context.", buf, 0xCu);
              }
              if (objc_opt_respondsToSelector()) {
                [v13 nowPlayingObserverAirPlayGroupChanged:self];
              }
              goto LABEL_21;
            }
          }
          uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_21:
    }
  }
  else
  {
    __int16 v14 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "-[SOMediaNowPlayingObserver _handleGroupIdentifierUpdatesFromMediaRemoteActiveDeviceInfo:]";
      _os_log_debug_impl(&dword_21DE53000, v14, OS_LOG_TYPE_DEBUG, "%s #hal deviceRef from kMRActiveDeviceInfoDidChangeNotification was invalid. Returning.", buf, 0xCu);
    }
  }
}

- (void)_updateProxyGroupPlayerState
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int isProxyGroupPlayer = self->_isProxyGroupPlayer;
  int v4 = [(SOMediaNowPlayingObserver *)self _isProxyGroupPlayer];
  self->_int isProxyGroupPlayer = v4;
  if (isProxyGroupPlayer != v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = self->_listeners;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v10, "nowPlayingObserver:proxyGroupPlayerStateDidChangeFrom:to:", self, isProxyGroupPlayer != 0, self->_isProxyGroupPlayer, (void)v11);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)mediaRemoteNowPlayingInfoDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v9 = "-[SOMediaNowPlayingObserver mediaRemoteNowPlayingInfoDidChange:]";
    __int16 v10 = 2048;
    long long v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s %p notification = %@", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__SOMediaNowPlayingObserver_mediaRemoteNowPlayingInfoDidChange___block_invoke;
  block[3] = &unk_264486D88;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __64__SOMediaNowPlayingObserver_mediaRemoteNowPlayingInfoDidChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "nowPlayingObserverNowPlayingInfoDidChange:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)mediaRemoteNowPlayingApplicationPlaybackStateDidChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v12 = "-[SOMediaNowPlayingObserver mediaRemoteNowPlayingApplicationPlaybackStateDidChange:]";
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s %p notification = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__SOMediaNowPlayingObserver_mediaRemoteNowPlayingApplicationPlaybackStateDidChange___block_invoke;
  v8[3] = &unk_2644870A0;
  id v9 = v4;
  long long v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

void __84__SOMediaNowPlayingObserver_mediaRemoteNowPlayingApplicationPlaybackStateDidChange___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  id v6 = [v2 objectForKey:*MEMORY[0x263F54DF8]];

  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v6 unsignedIntValue] - 1;
  if (v4 < 5) {
    uint64_t v5 = v4 + 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [v3 _handleNowPlayingApplicationPlaybackStateChange:v5];
}

- (BOOL)_isProxyGroupPlayer
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(SOMediaNowPlayingObserver *)self _supportsProxyGroupPlayer])
  {
    MRMediaRemoteGetLocalOrigin();
    uint64_t v3 = MRMediaRemoteCopyDeviceInfo();
    if (v3)
    {
      uint64_t v4 = (const void *)v3;
      int v5 = MEMORY[0x223C1A6D0]();
      CFRelease(v4);
    }
    else
    {
      int v5 = 0;
    }
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315650;
      id v9 = "-[SOMediaNowPlayingObserver _isProxyGroupPlayer]";
      __int16 v10 = 2048;
      long long v11 = self;
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_debug_impl(&dword_21DE53000, v6, OS_LOG_TYPE_DEBUG, "%s %p int isProxyGroupPlayer = %d", (uint8_t *)&v8, 0x1Cu);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)_supportsProxyGroupPlayer
{
  return 0;
}

- (void)_stopObservingNowPlayingAppPlaybackState
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_isObserving)
  {
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      id v9 = "-[SOMediaNowPlayingObserver _stopObservingNowPlayingAppPlaybackState]";
      __int16 v10 = 2048;
      long long v11 = self;
      _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v8, 0x16u);
    }
    if ([(SOMediaNowPlayingObserver *)self _supportsProxyGroupPlayer])
    {
      uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
      [v4 removeObserver:self name:*MEMORY[0x263F54958] object:0];
    }
    nowPlayingController = self->_nowPlayingController;
    if (nowPlayingController)
    {
      [(MRNowPlayingController *)nowPlayingController endLoadingUpdates];
    }
    else
    {
      id v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 removeObserver:self name:*MEMORY[0x263F54B30] object:0];

      id v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 removeObserver:self name:*MEMORY[0x263F54B88] object:0];

      MRMediaRemoteSetWantsNowPlayingNotifications();
    }
    self->_isObserving = 0;
  }
}

- (void)_startObservingNowPlayingAppPlaybackState
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [(SOMediaNowPlayingObserver *)self _stopObservingNowPlayingAppPlaybackState];
  if (!self->_isObserving)
  {
    uint64_t v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      id v9 = "-[SOMediaNowPlayingObserver _startObservingNowPlayingAppPlaybackState]";
      __int16 v10 = 2048;
      long long v11 = self;
      _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v8, 0x16u);
    }
    if ([(SOMediaNowPlayingObserver *)self _supportsProxyGroupPlayer])
    {
      uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
      [v4 addObserver:self selector:sel_mediaRemoteActiveDeviceInfoDidChange_ name:*MEMORY[0x263F54958] object:0];
    }
    nowPlayingController = self->_nowPlayingController;
    if (nowPlayingController)
    {
      [(MRNowPlayingController *)nowPlayingController beginLoadingUpdates];
    }
    else
    {
      id v6 = [MEMORY[0x263F08A00] defaultCenter];
      [v6 addObserver:self selector:sel_mediaRemoteNowPlayingApplicationPlaybackStateDidChange_ name:*MEMORY[0x263F54B30] object:0];

      id v7 = [MEMORY[0x263F08A00] defaultCenter];
      [v7 addObserver:self selector:sel_mediaRemoteNowPlayingInfoDidChange_ name:*MEMORY[0x263F54B88] object:0];

      MRMediaRemoteSetWantsNowPlayingNotifications();
    }
    self->_isObserving = 1;
  }
}

- (void)_endGroup
{
  p_playbackStateGroup = &self->_playbackStateGroup;
  playbackStateGroup = self->_playbackStateGroup;
  self->_playbackStateGroupDepth = (int64_t)p_playbackStateGroup[1] - 1;
  dispatch_group_leave(playbackStateGroup);
  if (!self->_playbackStateGroupDepth)
  {
    int v5 = self->_playbackStateGroup;
    self->_playbackStateGroup = 0;
  }
}

- (void)_beginGroup
{
  playbackStateGroup = self->_playbackStateGroup;
  if (!playbackStateGroup)
  {
    uint64_t v4 = (OS_dispatch_group *)dispatch_group_create();
    int v5 = self->_playbackStateGroup;
    self->_playbackStateGroup = v4;

    playbackStateGroup = self->_playbackStateGroup;
  }
  dispatch_group_enter(playbackStateGroup);
  ++self->_playbackStateGroupDepth;
}

- (void)controller:(id)a3 didFailWithError:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    long long v11 = "-[SOMediaNowPlayingObserver controller:didFailWithError:]";
    __int16 v12 = 2048;
    int v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_error_impl(&dword_21DE53000, v7, OS_LOG_TYPE_ERROR, "%s %p %@", buf, 0x20u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SOMediaNowPlayingObserver_controller_didFailWithError___block_invoke;
  v9[3] = &unk_264486B88;
  v9[4] = self;
  v9[5] = a2;
  dispatch_async(queue, v9);
}

void __57__SOMediaNowPlayingObserver_controller_didFailWithError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (AFMediaPlaybackStateGetIsValidAndSpecified())
  {
    id v2 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = v2;
      int v5 = AFMediaPlaybackStateGetName();
      *(_DWORD *)buf = 136315650;
      id v9 = "-[SOMediaNowPlayingObserver controller:didFailWithError:]_block_invoke";
      __int16 v10 = 2048;
      uint64_t v11 = v3;
      __int16 v12 = 2112;
      int v13 = v5;
      _os_log_impl(&dword_21DE53000, v4, OS_LOG_TYPE_INFO, "%s %p Skipped fetching playback state because the playback state is %@ and it is valid.", buf, 0x20u);
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_fetchNowPlayingAppPlaybackStateForReason:completion:");
  }
}

- (void)controllerWillReloadForInvalidation:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v9 = "-[SOMediaNowPlayingObserver controllerWillReloadForInvalidation:]";
    __int16 v10 = 2048;
    uint64_t v11 = self;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__SOMediaNowPlayingObserver_controllerWillReloadForInvalidation___block_invoke;
  v7[3] = &unk_264486B88;
  void v7[4] = self;
  v7[5] = a2;
  dispatch_async(queue, v7);
}

void __65__SOMediaNowPlayingObserver_controllerWillReloadForInvalidation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleNowPlayingApplicationPlaybackStateChange:0];
  id v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _fetchNowPlayingAppPlaybackStateForReason:v3 completion:0];
}

- (void)controller:(id)a3 didLoadResponse:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v5 = objc_msgSend(a4, "playbackState", a3);
  id v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    int v8 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[SOMediaNowPlayingObserver controller:didLoadResponse:]";
    __int16 v15 = 2048;
    uint64_t v16 = self;
    __int16 v17 = 2112;
    long long v18 = v8;
    _os_log_impl(&dword_21DE53000, v7, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  uint64_t v9 = (v5 - 1);
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__SOMediaNowPlayingObserver_controller_didLoadResponse___block_invoke;
  v12[3] = &unk_264486B88;
  if (v9 < 5) {
    uint64_t v11 = v9 + 1;
  }
  else {
    uint64_t v11 = 0;
  }
  v12[4] = self;
  v12[5] = v11;
  dispatch_async(queue, v12);
}

uint64_t __56__SOMediaNowPlayingObserver_controller_didLoadResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNowPlayingApplicationPlaybackStateChange:*(void *)(a1 + 40)];
}

- (void)controller:(id)a3 playbackQueueDidChangeFrom:(id)a4 to:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v13 = "-[SOMediaNowPlayingObserver controller:playbackQueueDidChangeFrom:to:]";
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl(&dword_21DE53000, v9, OS_LOG_TYPE_INFO, "%s %p playback queue changed from %@ to %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__SOMediaNowPlayingObserver_controller_playbackQueueDidChangeFrom_to___block_invoke;
  block[3] = &unk_264486D88;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __70__SOMediaNowPlayingObserver_controller_playbackQueueDidChangeFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "nowPlayingObserverNowPlayingInfoDidChange:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)controller:(id)a3 playbackStateDidChangeFrom:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    long long v9 = v8;
    long long v10 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
    id v11 = v10;
    uint64_t v12 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
    *(_DWORD *)buf = 136315906;
    __int16 v18 = "-[SOMediaNowPlayingObserver controller:playbackStateDidChangeFrom:to:]";
    __int16 v19 = 2048;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    __int16 v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_21DE53000, v9, OS_LOG_TYPE_INFO, "%s %p %@ -> %@", buf, 0x2Au);
  }
  uint64_t v13 = a5 - 1;
  queue = self->_queue;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  id v16[2] = __70__SOMediaNowPlayingObserver_controller_playbackStateDidChangeFrom_to___block_invoke;
  v16[3] = &unk_264486B88;
  if (v13 < 5) {
    uint64_t v15 = v13 + 1;
  }
  else {
    uint64_t v15 = 0;
  }
  v16[4] = self;
  v16[5] = v15;
  dispatch_async(queue, v16);
}

uint64_t __70__SOMediaNowPlayingObserver_controller_playbackStateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNowPlayingApplicationPlaybackStateChange:*(void *)(a1 + 40)];
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__SOMediaNowPlayingObserver_removeListener___block_invoke;
    v7[3] = &unk_2644870A0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __44__SOMediaNowPlayingObserver_removeListener___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v5 = v2;
    uint64_t v6 = [v3 debugDescription];
    int v8 = 136315650;
    long long v9 = "-[SOMediaNowPlayingObserver removeListener:]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21DE53000, v5, OS_LOG_TYPE_INFO, "%s %p Attempting to delete listener: %@", (uint8_t *)&v8, 0x20u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 48) removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SOMediaNowPlayingObserver_addListener___block_invoke;
    v7[3] = &unk_2644870A0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __41__SOMediaNowPlayingObserver_addListener___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  uint64_t result = objc_opt_respondsToSelector();
  if ((result & 1) != 0 && *(void *)(*(void *)(a1 + 32) + 32))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    return objc_msgSend(v3, "nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:");
  }
  return result;
}

- (void)getProxyGroupPlayerStateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__SOMediaNowPlayingObserver_getProxyGroupPlayerStateWithCompletion___block_invoke;
    v7[3] = &unk_264487050;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __68__SOMediaNowPlayingObserver_getProxyGroupPlayerStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 72));
}

- (void)getNowPlayingApplicationBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__SOMediaNowPlayingObserver_getNowPlayingApplicationBundleIdentifier___block_invoke;
    v7[3] = &unk_264487050;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __70__SOMediaNowPlayingObserver_getNowPlayingApplicationBundleIdentifier___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F0EFF8](*(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 64), *(void *)(a1 + 40));
}

- (void)getNowPlayingInfoForCurrentItemWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__SOMediaNowPlayingObserver_getNowPlayingInfoForCurrentItemWithCompletion___block_invoke;
    v7[3] = &unk_264487050;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __75__SOMediaNowPlayingObserver_getNowPlayingInfoForCurrentItemWithCompletion___block_invoke(uint64_t a1)
{
  return MEMORY[0x270F0F000](*(void *)(*(void *)(a1 + 32) + 8), *(void *)(*(void *)(a1 + 32) + 64), *(void *)(a1 + 40));
}

- (void)getPlaybackStateAndLastPlayingDateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __78__SOMediaNowPlayingObserver_getPlaybackStateAndLastPlayingDateWithCompletion___block_invoke;
    v7[3] = &unk_264487050;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

void __78__SOMediaNowPlayingObserver_getPlaybackStateAndLastPlayingDateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  if (v3)
  {
    id v4 = *(NSObject **)(v2 + 8);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __78__SOMediaNowPlayingObserver_getPlaybackStateAndLastPlayingDateWithCompletion___block_invoke_2;
    v7[3] = &unk_264487050;
    id v5 = *(id *)(a1 + 40);
    void v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    dispatch_group_notify(v3, v4, v7);
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __78__SOMediaNowPlayingObserver_getPlaybackStateAndLastPlayingDateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 32), *(void *)(*(void *)(a1 + 32) + 40));
}

- (void)getPlaybackStateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__SOMediaNowPlayingObserver_getPlaybackStateWithCompletion___block_invoke;
    v6[3] = &unk_264486BD8;
    id v7 = v4;
    [(SOMediaNowPlayingObserver *)self getPlaybackStateAndLastPlayingDateWithCompletion:v6];
  }
}

uint64_t __60__SOMediaNowPlayingObserver_getPlaybackStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)playbackState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SOMediaNowPlayingObserver_playbackState__block_invoke;
  v5[3] = &unk_264486BB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__SOMediaNowPlayingObserver_playbackState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [(SOMediaNowPlayingObserver *)self _stopObservingNowPlayingAppPlaybackState];
  int64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    instanceContext = self->_instanceContext;
    *(_DWORD *)buf = 136315650;
    id v7 = "-[SOMediaNowPlayingObserver dealloc]";
    __int16 v8 = 2048;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = instanceContext;
    _os_log_impl(&dword_21DE53000, v3, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  v5.receiver = self;
  v5.super_class = (Class)SOMediaNowPlayingObserver;
  [(SOMediaNowPlayingObserver *)&v5 dealloc];
}

- (SOMediaNowPlayingObserver)initWithQueue:(id)a3
{
  id v4 = (void *)MEMORY[0x263F28528];
  id v5 = a3;
  uint64_t v6 = [v4 currentContext];
  id v7 = [(SOMediaNowPlayingObserver *)self initWithQueue:v5 instanceContext:v6];

  return v7;
}

- (SOMediaNowPlayingObserver)initWithQueue:(id)a3 instanceContext:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SOMediaNowPlayingObserver;
  __int16 v10 = [(SOMediaNowPlayingObserver *)&v23 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    v11->_playbackStateGroupDepth = 0;
    if (v9)
    {
      uint64_t v12 = (AFInstanceContext *)v9;
    }
    else
    {
      uint64_t v12 = [MEMORY[0x263F28528] defaultContext];
    }
    instanceContext = v11->_instanceContext;
    v11->_instanceContext = v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    listeners = v11->_listeners;
    v11->_listeners = (NSHashTable *)v14;

    __int16 v16 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      id v17 = v11->_instanceContext;
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "-[SOMediaNowPlayingObserver initWithQueue:instanceContext:]";
      __int16 v26 = 2048;
      uint64_t v27 = v11;
      __int16 v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_21DE53000, v16, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    [(SOMediaNowPlayingObserver *)v11 _beginGroup];
    queue = v11->_queue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59__SOMediaNowPlayingObserver_initWithQueue_instanceContext___block_invoke;
    v20[3] = &unk_264486B88;
    __int16 v21 = v11;
    SEL v22 = a2;
    dispatch_async(queue, v20);
  }
  return v11;
}

void __59__SOMediaNowPlayingObserver_initWithQueue_instanceContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startObservingNowPlayingAppPlaybackState];
  [*(id *)(a1 + 32) _updateProxyGroupPlayerState];
  uint64_t v2 = *(void **)(a1 + 32);
  int64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__SOMediaNowPlayingObserver_initWithQueue_instanceContext___block_invoke_2;
  v4[3] = &unk_264486B60;
  id v5 = *(id *)(a1 + 32);
  [v2 _fetchNowPlayingAppPlaybackStateForReason:v3 completion:v4];
}

uint64_t __59__SOMediaNowPlayingObserver_initWithQueue_instanceContext___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = v2;
    id v5 = AFMediaPlaybackStateGetName();
    int v7 = 136315650;
    id v8 = "-[SOMediaNowPlayingObserver initWithQueue:instanceContext:]_block_invoke_2";
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_21DE53000, v4, OS_LOG_TYPE_INFO, "%s %p Initial playback state is %@.", (uint8_t *)&v7, 0x20u);
  }
  return [*(id *)(a1 + 32) _endGroup];
}

+ (id)defaultObserver
{
  if (defaultObserver_onceToken != -1) {
    dispatch_once(&defaultObserver_onceToken, &__block_literal_global_311);
  }
  uint64_t v2 = (void *)defaultObserver_defaultObserver;
  return v2;
}

void __44__SOMediaNowPlayingObserver_defaultObserver__block_invoke()
{
  v0 = [SOMediaNowPlayingObserver alloc];
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v5 = dispatch_queue_create("SOMediaNowPlayingObserver.defaultObserver", v2);
  uint64_t v3 = [(SOMediaNowPlayingObserver *)v0 initWithQueue:v5];
  id v4 = (void *)defaultObserver_defaultObserver;
  defaultObserver_defaultObserver = v3;
}

@end