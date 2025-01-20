@interface TVRMSDAAPControlSessionProxy
- (TVRMSDAAPControlSessionDelegate)delegate;
- (TVRMSDAAPControlSessionProxy)init;
- (TVRMSService)service;
- (void)_handleAudioRoutesDidUpdateNotification:(id)a3;
- (void)_handleNowPlayingArtworkDidBecomeAvailableNotification:(id)a3;
- (void)_handleNowPlayingInfoDidUpdateNotification:(id)a3;
- (void)_handleSessionDidEndNotification:(id)a3;
- (void)_handleVolumeDidUpdateNotification:(id)a3;
- (void)_notifyDelegateForArtworkChange;
- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5;
- (void)beginObservingNowPlaying;
- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)endObservingNowPlaying;
- (void)heartbeatDidFail;
- (void)logout;
- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4;
- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4;
- (void)sendNavigationCommand:(int64_t)a3;
- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4;
- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4;
- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6;
- (void)setVolume:(float)a3 completionHandler:(id)a4;
@end

@implementation TVRMSDAAPControlSessionProxy

- (TVRMSDAAPControlSessionProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)TVRMSDAAPControlSessionProxy;
  v2 = [(TVRMSSessionProxy *)&v7 initWithTimeout:*(double *)&TVRMSDAAPControlSessionTimeout];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleNowPlayingInfoDidUpdateNotification_ name:@"RMSIDSClientNowPlayingInfoDidUpdateNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleNowPlayingArtworkDidBecomeAvailableNotification_ name:@"RMSIDSClientNowPlayingArtworkDidBecomeAvailableNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleAudioRoutesDidUpdateNotification_ name:@"RMSIDSClientNowPlayingAudioRoutesDidUpdateNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleVolumeDidUpdateNotification_ name:@"RMSIDSClientNowPlayingVolumeDidUpdateNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleSessionDidEndNotification_ name:@"RMSIDSClientSessionDidEndNotification" object:0];
    uint64_t v4 = +[TVRMSIDSClient sharedClient];
    idsClient = v2->_idsClient;
    v2->_idsClient = (TVRMSIDSClient *)v4;
  }
  return v2;
}

- (void)dealloc
{
  [(TVRMSSessionProxy *)self endHeartbeat];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVRMSDAAPControlSessionProxy;
  [(TVRMSSessionProxy *)&v4 dealloc];
}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->_service, a3);
  [(TVRMSSessionProxy *)self setSessionIdentifier:0];
  objc_initWeak(&location, self);
  idsClient = self->_idsClient;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__TVRMSDAAPControlSessionProxy_connectToService_pairingGUID_completionHandler___block_invoke;
  v14[3] = &unk_2647AEA20;
  objc_copyWeak(&v16, &location);
  id v13 = v11;
  id v15 = v13;
  [(TVRMSIDSClient *)idsClient connectToService:v9 pairingGUID:v10 completionHandler:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __79__TVRMSDAAPControlSessionProxy_connectToService_pairingGUID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (a2 == 1)
  {
    v8 = _TVRCRMSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109120;
      v11[1] = a4;
      _os_log_impl(&dword_2266D3000, v8, OS_LOG_TYPE_DEFAULT, "Control session proxy received successful connection response, sessionIdentifier=%d", (uint8_t *)v11, 8u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setSessionIdentifier:a4];

    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    [v10 beginHeartbeat];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logout
{
  if ([(TVRMSSessionProxy *)self sessionIdentifier])
  {
    [(TVRMSIDSClient *)self->_idsClient logoutWithSessionIdentifier:[(TVRMSSessionProxy *)self sessionIdentifier]];
    [(TVRMSSessionProxy *)self endHeartbeat];
  }
}

- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4
{
  idsClient = self->_idsClient;
  uint64_t v6 = [(TVRMSSessionProxy *)self sessionIdentifier];

  [(TVRMSIDSClient *)idsClient sendPlaybackCommand:a3 sessionIdentifier:v6];
}

- (void)setVolume:(float)a3 completionHandler:(id)a4
{
  idsClient = self->_idsClient;
  uint64_t v6 = [(TVRMSSessionProxy *)self sessionIdentifier];
  *(float *)&double v7 = a3;

  [(TVRMSIDSClient *)idsClient setVolume:v6 sessionIdentifier:v7];
}

- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4
{
  idsClient = self->_idsClient;
  id v7 = a4;
  -[TVRMSIDSClient pickAudioRouteWithMacAddress:sessionIdentifier:completionHandler:](idsClient, "pickAudioRouteWithMacAddress:sessionIdentifier:completionHandler:", [a3 macAddress], -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier"), v7);
}

- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  idsClient = self->_idsClient;
  uint64_t v6 = [(TVRMSSessionProxy *)self sessionIdentifier];

  [(TVRMSIDSClient *)idsClient seekToPlaybackTime:v4 sessionIdentifier:v6];
}

- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6
{
  idsClient = self->_idsClient;
  id v11 = a6;
  [(TVRMSIDSClient *)idsClient setLikedState:a3 itemID:a4 databaseID:a5 sessionIdentifier:[(TVRMSSessionProxy *)self sessionIdentifier] completionHandler:v11];
}

- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5
{
  idsClient = self->_idsClient;
  id v9 = a5;
  [(TVRMSIDSClient *)idsClient addToWishlist:a3 databaseID:a4 sessionIdentifier:[(TVRMSSessionProxy *)self sessionIdentifier] completionHandler:v9];
}

- (void)beginObservingNowPlaying
{
  objc_initWeak(&location, self);
  idsClient = self->_idsClient;
  uint64_t v4 = [(TVRMSSessionProxy *)self sessionIdentifier];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__TVRMSDAAPControlSessionProxy_beginObservingNowPlaying__block_invoke;
  v5[3] = &unk_2647AEA48;
  objc_copyWeak(&v6, &location);
  [(TVRMSIDSClient *)idsClient beginObservingNowPlayingWithSessionIdentifier:v4 completionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__TVRMSDAAPControlSessionProxy_beginObservingNowPlaying__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained beginObservingNowPlaying];
  }
}

- (void)endObservingNowPlaying
{
  if ([(TVRMSSessionProxy *)self sessionIdentifier])
  {
    idsClient = self->_idsClient;
    uint64_t v4 = [(TVRMSSessionProxy *)self sessionIdentifier];
    [(TVRMSIDSClient *)idsClient endObservingNowPlayingWithSessionIdentifier:v4];
  }
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  idsClient = self->_idsClient;
  uint64_t v7 = [(TVRMSSessionProxy *)self sessionIdentifier];

  [(TVRMSIDSClient *)idsClient sendTouchMoveWithDirection:a3 repeatCount:v4 sessionIdentifier:v7];
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  idsClient = self->_idsClient;
  uint64_t v7 = [(TVRMSSessionProxy *)self sessionIdentifier];

  [(TVRMSIDSClient *)idsClient sendTouchEndWithDirection:a3 repeatCount:v4 sessionIdentifier:v7];
}

- (void)sendNavigationCommand:(int64_t)a3
{
  idsClient = self->_idsClient;
  uint64_t v5 = [(TVRMSSessionProxy *)self sessionIdentifier];

  [(TVRMSIDSClient *)idsClient sendNavigationCommand:a3 sessionIdentifier:v5];
}

- (void)heartbeatDidFail
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlSessionDidEnd:self];
}

- (void)_notifyDelegateForArtworkChange
{
  id v6 = [(TVRMSNowPlayingInfo *)self->_nowPlayingInfo artworkIdentifier];
  v3 = +[TVRMSNowPlayingArtworkCache sharedArtworkCache];
  uint64_t v4 = [v3 artworkDataForIdentifier:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlSession:self artworkDataDidBecomeAvailable:v4 identifier:v6];
}

- (void)_handleNowPlayingInfoDidUpdateNotification:(id)a3
{
  id v9 = a3;
  if ([(TVRMSSessionProxy *)self sessionMatchesNotification:v9])
  {
    uint64_t v4 = [v9 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"RMSIDSClientNowPlayingInfoNotificationKey"];

    LODWORD(v4) = [v5 revisionNumber];
    if ((int)v4 >= [(TVRMSNowPlayingInfo *)self->_nowPlayingInfo revisionNumber])
    {
      id v6 = [(TVRMSNowPlayingInfo *)self->_nowPlayingInfo artworkIdentifier];
      uint64_t v7 = [v5 artworkIdentifier];
      objc_storeStrong((id *)&self->_nowPlayingInfo, v5);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained controlSession:self didUpdateNowPlayingInfo:v5];

      if (([v7 isEqualToString:v6] & 1) == 0 && v7 != v6) {
        [(TVRMSDAAPControlSessionProxy *)self _notifyDelegateForArtworkChange];
      }
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)_handleAudioRoutesDidUpdateNotification:(id)a3
{
  id v7 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    uint64_t v4 = [v7 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"RMSIDSClientNowPlayingAudioRoutesNotificationKey"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained controlSession:self didUpdateAudioRoutes:v5];
  }
}

- (void)_handleVolumeDidUpdateNotification:(id)a3
{
  id v10 = a3;
  if (-[TVRMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    uint64_t v4 = [v10 userInfo];
    uint64_t v5 = [v4 objectForKeyedSubscript:@"RMSIDSClientNowPlayingVolumeNotificationKey"];
    [v5 floatValue];
    int v7 = v6;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    LODWORD(v9) = v7;
    [WeakRetained controlSession:self didUpdateVolume:v9];
  }
}

- (void)_handleNowPlayingArtworkDidBecomeAvailableNotification:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(TVRMSSessionProxy *)self sessionMatchesNotification:v4])
  {
    uint64_t v5 = [v4 userInfo];
    int v6 = [v5 objectForKey:@"RMSIDSClientNowPlayingArtworkIdentifierKey"];

    int v7 = [(TVRMSNowPlayingInfo *)self->_nowPlayingInfo artworkIdentifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = +[TVRMSNowPlayingArtworkCache sharedArtworkCache];
      double v9 = [v8 artworkDataForIdentifier:v7];

      if (v9)
      {
        id v10 = _TVRCRMSLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v6;
          _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "Control session was notified of avialable artwork for [%@], but data is already in cache", buf, 0xCu);
        }
      }
      else
      {
        id v11 = [MEMORY[0x263F1C920] mainScreen];
        [v11 bounds];
        double v13 = v12;
        double v15 = v14;

        objc_initWeak((id *)buf, self);
        idsClient = self->_idsClient;
        nowPlayingInfo = self->_nowPlayingInfo;
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __87__TVRMSDAAPControlSessionProxy__handleNowPlayingArtworkDidBecomeAvailableNotification___block_invoke;
        v19[3] = &unk_2647AEA70;
        id v20 = v6;
        objc_copyWeak(&v21, (id *)buf);
        LODWORD(v18) = 1050253722;
        [(TVRMSIDSClient *)idsClient requestArtworkDataForNowPlayingInfo:nowPlayingInfo width:v13 height:v15 compressionQuality:v19 completionHandler:v18];
        objc_destroyWeak(&v21);

        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      double v9 = _TVRCRMSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v6;
        __int16 v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_2266D3000, v9, OS_LOG_TYPE_DEFAULT, "Control session was notified of available artwork for [%@], but current now playing is [%@]", buf, 0x16u);
      }
    }
  }
}

void __87__TVRMSDAAPControlSessionProxy__handleNowPlayingArtworkDidBecomeAvailableNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[TVRMSNowPlayingArtworkCache sharedArtworkCache];
  [v4 setArtworkData:v3 forIdentifier:*(void *)(a1 + 32)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _notifyDelegateForArtworkChange];
}

- (void)_handleSessionDidEndNotification:(id)a3
{
  if ([(TVRMSSessionProxy *)self sessionMatchesNotification:a3])
  {
    id v4 = _TVRCRMSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "Control session ended", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__TVRMSDAAPControlSessionProxy__handleSessionDidEndNotification___block_invoke;
    block[3] = &unk_2647AEA98;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __65__TVRMSDAAPControlSessionProxy__handleSessionDidEndNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) endHeartbeat];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained controlSessionDidEnd:*(void *)(a1 + 32)];
}

- (TVRMSDAAPControlSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TVRMSDAAPControlSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TVRMSService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);

  objc_storeStrong((id *)&self->_idsClient, 0);
}

@end