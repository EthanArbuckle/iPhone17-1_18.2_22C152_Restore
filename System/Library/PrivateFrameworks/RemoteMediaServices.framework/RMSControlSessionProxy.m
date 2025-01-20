@interface RMSControlSessionProxy
- (RMSControlSessionDelegate)delegate;
- (RMSControlSessionProxy)init;
- (RMSService)service;
- (void)_handleAudioRoutesDidUpdateNotification:(id)a3;
- (void)_handleDidBeginEditingTextNotification:(id)a3;
- (void)_handleDidEndEditingTextNotification:(id)a3;
- (void)_handleDidReceivePairingChallengeRequestNotification:(id)a3;
- (void)_handleNowPlayingArtworkDidBecomeAvailableNotification:(id)a3;
- (void)_handleNowPlayingInfoDidUpdateNotification:(id)a3;
- (void)_handleSessionDidEndNotification:(id)a3;
- (void)_handleVolumeDidUpdateNotification:(id)a3;
- (void)_notifyDelegateForArtworkChange;
- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5;
- (void)beginObservingNowPlaying;
- (void)connectToService:(id)a3 pairingGUID:(id)a4 allowPairing:(BOOL)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)endObservingNowPlaying;
- (void)heartbeatDidFail;
- (void)logout;
- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4;
- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4;
- (void)sendNavigationCommand:(int64_t)a3;
- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4;
- (void)sendText:(id)a3 completionHandler:(id)a4;
- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4;
- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4;
- (void)setDelegate:(id)a3;
- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6;
- (void)setVolume:(float)a3 completionHandler:(id)a4;
@end

@implementation RMSControlSessionProxy

- (RMSControlSessionProxy)init
{
  v7.receiver = self;
  v7.super_class = (Class)RMSControlSessionProxy;
  v2 = [(RMSSessionProxy *)&v7 initWithTimeout:*(double *)&RMSControlSessionTimeout];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__handleDidReceivePairingChallengeRequestNotification_ name:@"RMSIDSClientDidReceivePairingChallengeRequestNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleNowPlayingInfoDidUpdateNotification_ name:@"RMSIDSClientNowPlayingInfoDidUpdateNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleNowPlayingArtworkDidBecomeAvailableNotification_ name:@"RMSIDSClientNowPlayingArtworkDidBecomeAvailableNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleAudioRoutesDidUpdateNotification_ name:@"RMSIDSClientNowPlayingAudioRoutesDidUpdateNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleVolumeDidUpdateNotification_ name:@"RMSIDSClientNowPlayingVolumeDidUpdateNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleSessionDidEndNotification_ name:@"RMSIDSClientSessionDidEndNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleDidBeginEditingTextNotification_ name:@"RMSIDSClientDidBeginEditingTextNotification" object:0];
    [v3 addObserver:v2 selector:sel__handleDidEndEditingTextNotification_ name:@"RMSIDSClientDidEndEditingTextNotification" object:0];
    uint64_t v4 = +[RMSIDSClient sharedClient];
    idsClient = v2->_idsClient;
    v2->_idsClient = (RMSIDSClient *)v4;
  }
  return v2;
}

- (void)dealloc
{
  [(RMSSessionProxy *)self endHeartbeat];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RMSControlSessionProxy;
  [(RMSSessionProxy *)&v4 dealloc];
}

- (void)connectToService:(id)a3 pairingGUID:(id)a4 allowPairing:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_storeStrong((id *)&self->_service, a3);
  [(RMSSessionProxy *)self setSessionIdentifier:0];
  objc_initWeak(&location, self);
  idsClient = self->_idsClient;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__RMSControlSessionProxy_connectToService_pairingGUID_allowPairing_completionHandler___block_invoke;
  v17[3] = &unk_264E74B98;
  id v15 = v11;
  id v18 = v15;
  objc_copyWeak(&v20, &location);
  id v16 = v13;
  id v19 = v16;
  [(RMSIDSClient *)idsClient connectToService:v15 pairingGUID:v12 allowPairing:v7 completionHandler:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __86__RMSControlSessionProxy_connectToService_pairingGUID_allowPairing_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  if (a2 == 3)
  {
    id v16 = +[RMSPairingRecordStore sharedRecordStore];
    v17 = [*(id *)(a1 + 32) networkName];
    [v16 removePairingRecordForServiceWithNetworkName:v17];

LABEL_10:
    goto LABEL_11;
  }
  if (a2 == 1)
  {
    v9 = RMSLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 67109120;
      v18[1] = a5;
      _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "Control session proxy received successful connection response, sessionIdentifier=%d", (uint8_t *)v18, 8u);
    }

    if (([*(id *)(a1 + 32) isTVRemoteCoreSupported] & 1) == 0)
    {
      v10 = [*(id *)(a1 + 32) networkName];

      if (v10)
      {
        id v11 = +[RMSPairingRecordStore sharedRecordStore];
        id v12 = [MEMORY[0x263F08C38] UUID];
        id v13 = [v12 UUIDString];
        v14 = [*(id *)(a1 + 32) networkName];
        [v11 savePairingRecord:v13 forServiceWithNetworkName:v14];
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setSessionIdentifier:a5];

    id v16 = objc_loadWeakRetained((id *)(a1 + 48));
    [v16 beginHeartbeat];
    goto LABEL_10;
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)logout
{
  if ([(RMSSessionProxy *)self sessionIdentifier])
  {
    [(RMSIDSClient *)self->_idsClient logoutWithSessionIdentifier:[(RMSSessionProxy *)self sessionIdentifier]];
    [(RMSSessionProxy *)self endHeartbeat];
  }
}

- (void)sendPlaybackCommand:(int64_t)a3 completionHandler:(id)a4
{
  idsClient = self->_idsClient;
  uint64_t v6 = [(RMSSessionProxy *)self sessionIdentifier];
  [(RMSIDSClient *)idsClient sendPlaybackCommand:a3 sessionIdentifier:v6];
}

- (void)setVolume:(float)a3 completionHandler:(id)a4
{
  idsClient = self->_idsClient;
  uint64_t v6 = [(RMSSessionProxy *)self sessionIdentifier];
  *(float *)&double v7 = a3;
  [(RMSIDSClient *)idsClient setVolume:v6 sessionIdentifier:v7];
}

- (void)pickAudioRoute:(id)a3 completionHandler:(id)a4
{
  idsClient = self->_idsClient;
  id v7 = a4;
  -[RMSIDSClient pickAudioRouteWithMacAddress:sessionIdentifier:completionHandler:](idsClient, "pickAudioRouteWithMacAddress:sessionIdentifier:completionHandler:", [a3 macAddress], -[RMSSessionProxy sessionIdentifier](self, "sessionIdentifier"), v7);
}

- (void)seekToPlaybackTime:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  idsClient = self->_idsClient;
  uint64_t v6 = [(RMSSessionProxy *)self sessionIdentifier];
  [(RMSIDSClient *)idsClient seekToPlaybackTime:v4 sessionIdentifier:v6];
}

- (void)setLikedState:(int64_t)a3 itemID:(unint64_t)a4 databaseID:(unint64_t)a5 completionHandler:(id)a6
{
  idsClient = self->_idsClient;
  id v11 = a6;
  [(RMSIDSClient *)idsClient setLikedState:a3 itemID:a4 databaseID:a5 sessionIdentifier:[(RMSSessionProxy *)self sessionIdentifier] completionHandler:v11];
}

- (void)addToWishlist:(unint64_t)a3 databaseID:(unint64_t)a4 completionHandler:(id)a5
{
  idsClient = self->_idsClient;
  id v9 = a5;
  [(RMSIDSClient *)idsClient addToWishlist:a3 databaseID:a4 sessionIdentifier:[(RMSSessionProxy *)self sessionIdentifier] completionHandler:v9];
}

- (void)beginObservingNowPlaying
{
  objc_initWeak(&location, self);
  idsClient = self->_idsClient;
  uint64_t v4 = [(RMSSessionProxy *)self sessionIdentifier];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__RMSControlSessionProxy_beginObservingNowPlaying__block_invoke;
  v5[3] = &unk_264E740F0;
  objc_copyWeak(&v6, &location);
  [(RMSIDSClient *)idsClient beginObservingNowPlayingWithSessionIdentifier:v4 completionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __50__RMSControlSessionProxy_beginObservingNowPlaying__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained beginObservingNowPlaying];
  }
}

- (void)endObservingNowPlaying
{
  if ([(RMSSessionProxy *)self sessionIdentifier])
  {
    idsClient = self->_idsClient;
    uint64_t v4 = [(RMSSessionProxy *)self sessionIdentifier];
    [(RMSIDSClient *)idsClient endObservingNowPlayingWithSessionIdentifier:v4];
  }
}

- (void)sendTouchMoveWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  idsClient = self->_idsClient;
  uint64_t v7 = [(RMSSessionProxy *)self sessionIdentifier];
  [(RMSIDSClient *)idsClient sendTouchMoveWithDirection:a3 repeatCount:v4 sessionIdentifier:v7];
}

- (void)sendTouchEndWithDirection:(int64_t)a3 repeatCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  idsClient = self->_idsClient;
  uint64_t v7 = [(RMSSessionProxy *)self sessionIdentifier];
  [(RMSIDSClient *)idsClient sendTouchEndWithDirection:a3 repeatCount:v4 sessionIdentifier:v7];
}

- (void)sendNavigationCommand:(int64_t)a3
{
  idsClient = self->_idsClient;
  uint64_t v5 = [(RMSSessionProxy *)self sessionIdentifier];
  [(RMSIDSClient *)idsClient sendNavigationCommand:a3 sessionIdentifier:v5];
}

- (void)sendText:(id)a3 completionHandler:(id)a4
{
  idsClient = self->_idsClient;
  id v7 = a4;
  id v8 = a3;
  [(RMSIDSClient *)idsClient sendText:v8 sessionIdentifier:[(RMSSessionProxy *)self sessionIdentifier] completionHandler:v7];
}

- (void)heartbeatDidFail
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlSessionDidEnd:self];
}

- (void)_notifyDelegateForArtworkChange
{
  id v6 = [(RMSNowPlayingInfo *)self->_nowPlayingInfo artworkIdentifier];
  v3 = +[RMSNowPlayingArtworkCache sharedArtworkCache];
  uint64_t v4 = [v3 artworkDataForIdentifier:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained controlSession:self artworkDataDidBecomeAvailable:v4 identifier:v6];
}

- (void)_handleDidReceivePairingChallengeRequestNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __79__RMSControlSessionProxy__handleDidReceivePairingChallengeRequestNotification___block_invoke;
  v6[3] = &unk_264E747C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __79__RMSControlSessionProxy__handleDidReceivePairingChallengeRequestNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = [*(id *)(a1 + 40) userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"RMSIDSClientPairingCredentialsNotificationKey"];
  id v5 = [*(id *)(a1 + 40) userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"RMSIDSClientPairingCompletionHandlerNotificationKey"];
  [WeakRetained controlSession:v2 didReceivePairingChallengeRequestWithCredentials:v4 completionHandler:v6];
}

- (void)_handleNowPlayingInfoDidUpdateNotification:(id)a3
{
  id v9 = a3;
  if ([(RMSSessionProxy *)self sessionMatchesNotification:v9])
  {
    id v4 = [v9 userInfo];
    id v5 = [v4 objectForKeyedSubscript:@"RMSIDSClientNowPlayingInfoNotificationKey"];

    LODWORD(v4) = [v5 revisionNumber];
    if ((int)v4 >= [(RMSNowPlayingInfo *)self->_nowPlayingInfo revisionNumber])
    {
      id v6 = [(RMSNowPlayingInfo *)self->_nowPlayingInfo artworkIdentifier];
      id v7 = [v5 artworkIdentifier];
      objc_storeStrong((id *)&self->_nowPlayingInfo, v5);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained controlSession:self didUpdateNowPlayingInfo:v5];

      if (([v7 isEqualToString:v6] & 1) == 0 && v7 != v6) {
        [(RMSControlSessionProxy *)self _notifyDelegateForArtworkChange];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)_handleAudioRoutesDidUpdateNotification:(id)a3
{
  id v7 = a3;
  if (-[RMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    id v4 = [v7 userInfo];
    id v5 = [v4 objectForKeyedSubscript:@"RMSIDSClientNowPlayingAudioRoutesNotificationKey"];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained controlSession:self didUpdateAudioRoutes:v5];
  }
}

- (void)_handleVolumeDidUpdateNotification:(id)a3
{
  id v10 = a3;
  if (-[RMSSessionProxy sessionMatchesNotification:](self, "sessionMatchesNotification:"))
  {
    id v4 = [v10 userInfo];
    id v5 = [v4 objectForKeyedSubscript:@"RMSIDSClientNowPlayingVolumeNotificationKey"];
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
  if ([(RMSSessionProxy *)self sessionMatchesNotification:v4])
  {
    id v5 = [v4 userInfo];
    int v6 = [v5 objectForKey:@"RMSIDSClientNowPlayingArtworkIdentifierKey"];

    int v7 = [(RMSNowPlayingInfo *)self->_nowPlayingInfo artworkIdentifier];
    if ([v6 isEqualToString:v7])
    {
      id v8 = +[RMSNowPlayingArtworkCache sharedArtworkCache];
      double v9 = [v8 artworkDataForIdentifier:v7];

      if (v9)
      {
        id v10 = RMSLogger();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v6;
          _os_log_impl(&dword_23C83A000, v10, OS_LOG_TYPE_DEFAULT, "Control session was notified of avialable artwork for [%@], but data is already in cache", buf, 0xCu);
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
        v19[2] = __81__RMSControlSessionProxy__handleNowPlayingArtworkDidBecomeAvailableNotification___block_invoke;
        v19[3] = &unk_264E74BC0;
        id v20 = v6;
        objc_copyWeak(&v21, (id *)buf);
        LODWORD(v18) = 1050253722;
        [(RMSIDSClient *)idsClient requestArtworkDataForNowPlayingInfo:nowPlayingInfo width:v13 height:v15 compressionQuality:v19 completionHandler:v18];
        objc_destroyWeak(&v21);

        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      double v9 = RMSLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v6;
        __int16 v24 = 2112;
        v25 = v7;
        _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "Control session was notified of available artwork for [%@], but current now playing is [%@]", buf, 0x16u);
      }
    }
  }
}

void __81__RMSControlSessionProxy__handleNowPlayingArtworkDidBecomeAvailableNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RMSNowPlayingArtworkCache sharedArtworkCache];
  [v4 setArtworkData:v3 forIdentifier:*(void *)(a1 + 32)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _notifyDelegateForArtworkChange];
}

- (void)_handleSessionDidEndNotification:(id)a3
{
  if ([(RMSSessionProxy *)self sessionMatchesNotification:a3])
  {
    id v4 = RMSLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C83A000, v4, OS_LOG_TYPE_DEFAULT, "Control session ended", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__RMSControlSessionProxy__handleSessionDidEndNotification___block_invoke;
    block[3] = &unk_264E740A8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __59__RMSControlSessionProxy__handleSessionDidEndNotification___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) endHeartbeat];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained controlSessionDidEnd:*(void *)(a1 + 32)];
}

- (void)_handleDidBeginEditingTextNotification:(id)a3
{
  if ([(RMSSessionProxy *)self sessionMatchesNotification:a3])
  {
    id v4 = RMSLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C83A000, v4, OS_LOG_TYPE_DEFAULT, "Control session did begin editing text", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__RMSControlSessionProxy__handleDidBeginEditingTextNotification___block_invoke;
    block[3] = &unk_264E740A8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __65__RMSControlSessionProxy__handleDidBeginEditingTextNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained controlSessionDidBeginEditingText:*(void *)(a1 + 32)];
}

- (void)_handleDidEndEditingTextNotification:(id)a3
{
  if ([(RMSSessionProxy *)self sessionMatchesNotification:a3])
  {
    id v4 = RMSLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C83A000, v4, OS_LOG_TYPE_DEFAULT, "Control session did end diting text", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__RMSControlSessionProxy__handleDidEndEditingTextNotification___block_invoke;
    block[3] = &unk_264E740A8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __63__RMSControlSessionProxy__handleDidEndEditingTextNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained controlSessionDidEndEditingText:*(void *)(a1 + 32)];
}

- (RMSControlSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSControlSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RMSService)service
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