@interface RMSDAAPNowPlayingManager
- (BOOL)_audioRoutes:(id)a3 equalAudioRoutes:(id)a4;
- (BOOL)isObserving;
- (RMSControlInterface)controlInterface;
- (RMSDAAPNowPlayingManager)initWithRequestManager:(id)a3;
- (RMSDAAPNowPlayingManagerDelegate)delegate;
- (void)_cancelArtworkRetryTimer;
- (void)_refreshNowPlayingInfoRequest;
- (void)_requestArtworkDataIfNecessaryForNowPlayingInfo:(id)a3;
- (void)_requestAudioRoutes;
- (void)_requestNowPlayingInfoWithCompletionHandler:(id)a3;
- (void)_requestVolume;
- (void)_scheduleArtworkRetryForNowPlayingInfo:(id)a3 delay:(double)a4;
- (void)beginObservingNowPlaying;
- (void)endObservingNowPlaying;
- (void)setControlInterface:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation RMSDAAPNowPlayingManager

- (RMSDAAPNowPlayingManager)initWithRequestManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMSDAAPNowPlayingManager;
  v6 = [(RMSDAAPNowPlayingManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestManager, a3);
  }

  return v7;
}

- (void)beginObservingNowPlaying
{
  if (self->_isObserving)
  {
    v2 = RMSLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_23C83A000, v2, OS_LOG_TYPE_DEFAULT, "NowPlayingManager asked to begin observing, but observing was already in progress", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    self->_isObserving = 1;
    objc_initWeak(buf, self);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __52__RMSDAAPNowPlayingManager_beginObservingNowPlaying__block_invoke;
    v4[3] = &unk_264E74548;
    objc_copyWeak(&v5, buf);
    [(RMSDAAPNowPlayingManager *)self _requestNowPlayingInfoWithCompletionHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(buf);
  }
}

void __52__RMSDAAPNowPlayingManager_beginObservingNowPlaying__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v9 = WeakRetained;
  if (WeakRetained)
  {
    if (a2 == 1)
    {
      objc_storeStrong(WeakRetained + 2, a3);
      v9[9] = 0;
      id v10 = objc_loadWeakRetained(v9 + 15);
      [v10 nowPlayingManager:v9 didUpdateNowPlayingInfo:v6];

      [v9 _requestArtworkDataIfNecessaryForNowPlayingInfo:v6];
      if ([v9[3] supportsSpeakerSelection]) {
        [v9 _requestAudioRoutes];
      }
      if ([v9[3] supportsVolumeControl]) {
        [v9 _requestVolume];
      }
      [v9 _refreshNowPlayingInfoRequest];
    }
    else
    {
      [WeakRetained[2] setRevisionNumber:0];
      uint64_t v11 = (uint64_t)v9[9];
      if (v11 >= 9) {
        uint64_t v11 = 9;
      }
      v9[9] = (id)(v11 + 1);
      v12 = RMSLogger();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v9[9];
        *(_DWORD *)buf = 134217984;
        id v18 = v13;
        _os_log_impl(&dword_23C83A000, v12, OS_LOG_TYPE_DEFAULT, "Now playing info unavailable, retrying in %zd seconds", buf, 0xCu);
      }

      dispatch_time_t v14 = dispatch_time(0, 1000000000 * (void)v9[9]);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __52__RMSDAAPNowPlayingManager_beginObservingNowPlaying__block_invoke_1;
      block[3] = &unk_264E74058;
      objc_copyWeak(&v16, v7);
      dispatch_after(v14, MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v16);
    }
  }
}

void __52__RMSDAAPNowPlayingManager_beginObservingNowPlaying__block_invoke_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _refreshNowPlayingInfoRequest];
}

- (void)endObservingNowPlaying
{
  self->_isObserving = 0;
  currentNowPlayingInfo = self->_currentNowPlayingInfo;
  self->_currentNowPlayingInfo = 0;

  currentAudioRoutes = self->_currentAudioRoutes;
  self->_currentAudioRoutes = 0;

  lastVolume = self->_lastVolume;
  self->_lastVolume = 0;

  self->_requestBackoffInterval = 0;
  self->_artworkRequestBackoffInterval = 0;
  [(NSURLSessionDataTask *)self->_nowPlayingInfoRequest cancel];
  [(NSURLSessionDataTask *)self->_artworkRequest cancel];
  [(NSURLSessionDataTask *)self->_audioRoutesRequest cancel];
  [(NSURLSessionDataTask *)self->_volumeRequest cancel];
  [(RMSDAAPNowPlayingManager *)self _cancelArtworkRetryTimer];
}

- (void)_refreshNowPlayingInfoRequest
{
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    [(RMSDAAPNowPlayingManager *)self beginObservingNowPlaying];
  }
}

- (void)_requestNowPlayingInfoWithCompletionHandler:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "playstatusupdate");
  [(NSURLSessionDataTask *)self->_nowPlayingInfoRequest cancel];
  dispatch_time_t v14 = @"revision-number";
  requestManager = self->_requestManager;
  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[RMSNowPlayingInfo revisionNumber](self->_currentNowPlayingInfo, "revisionNumber"));
  v15[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__RMSDAAPNowPlayingManager__requestNowPlayingInfoWithCompletionHandler___block_invoke;
  v12[3] = &unk_264E744B0;
  id v13 = v4;
  id v9 = v4;
  id v10 = [(RMSDAAPRequestManager *)requestManager requestWithPath:v5 method:@"GET" postData:0 queryArgs:v8 completionHandler:v12];
  nowPlayingInfoRequest = self->_nowPlayingInfoRequest;
  self->_nowPlayingInfoRequest = v10;
}

void __72__RMSDAAPNowPlayingManager__requestNowPlayingInfoWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 == 1)
  {
    id v6 = +[RMSDAAPParser objectWithData:v5];
    v7 = RMSLogger();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 138412290;
      v35 = v6;
      _os_log_impl(&dword_23C83A000, v7, OS_LOG_TYPE_DEFAULT, "Received now-playing info: %@", (uint8_t *)&v34, 0xCu);
    }

    v8 = objc_opt_new();
    id v9 = [v6 objectForKeyedSubscript:@"dmap.itemid"];
    objc_msgSend(v8, "setItemID:", objc_msgSend(v9, "longLongValue"));

    id v10 = [v6 objectForKeyedSubscript:@"dmap.databaseid"];
    objc_msgSend(v8, "setDatabaseID:", objc_msgSend(v10, "longLongValue"));

    uint64_t v11 = [v6 objectForKeyedSubscript:@"dmap.itemname"];
    [v8 setTrackName:v11];

    v12 = [v6 objectForKeyedSubscript:@"daap.songartist"];
    [v8 setArtistName:v12];

    id v13 = [v6 objectForKeyedSubscript:@"daap.songalbum"];
    [v8 setAlbumName:v13];

    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    objc_msgSend(v8, "setTimestamp:");
    dispatch_time_t v14 = [v6 objectForKeyedSubscript:@"daap.songtimeremaining"];
    objc_msgSend(v8, "setTimeRemaining:", (double)objc_msgSend(v14, "unsignedIntValue"));

    v15 = [v6 objectForKeyedSubscript:@"daap.songtime"];
    objc_msgSend(v8, "setTotalDuration:", (double)objc_msgSend(v15, "unsignedIntValue"));

    id v16 = [v6 objectForKeyedSubscript:@"dmcp.playstatusrevision"];
    objc_msgSend(v8, "setRevisionNumber:", objc_msgSend(v16, "intValue"));

    v17 = [v6 objectForKeyedSubscript:@"com.apple.itunes.likeable"];
    objc_msgSend(v8, "setLikeable:", objc_msgSend(v17, "BOOLValue"));

    id v18 = [v6 objectForKeyedSubscript:@"com.apple.itunes.can-add-to-wishlist"];
    objc_msgSend(v8, "setCanWishlist:", objc_msgSend(v18, "BOOLValue"));

    uint64_t v19 = [v6 objectForKeyedSubscript:@"com.apple.itunes.has-chapter-data"];
    objc_msgSend(v8, "setHasChapterData:", objc_msgSend(v19, "BOOLValue"));

    v20 = [v6 objectForKeyedSubscript:@"mediaKind"];
    uint64_t v21 = [v20 integerValue];

    if (v21 <= 4095)
    {
      if (v21 > 127)
      {
        if (v21 <= 511)
        {
          if (v21 != 128 && v21 != 256) {
            goto LABEL_53;
          }
        }
        else if (v21 != 512 && v21 != 1024 && v21 != 2048)
        {
          goto LABEL_53;
        }
      }
      else if ((unint64_t)(v21 - 1) > 0x3F || ((1 << (v21 - 1)) & 0x800000008000808BLL) == 0)
      {
        goto LABEL_53;
      }
    }
    else if (v21 < 0x40000)
    {
      if (v21 >= 0x8000)
      {
        if (v21 != 0x8000 && v21 != 0x10000 && v21 != 0x20000) {
          goto LABEL_53;
        }
      }
      else if (v21 != 4096 && v21 != 0x2000 && v21 != 0x4000)
      {
        goto LABEL_53;
      }
    }
    else if (v21 < 0x200000)
    {
      if (v21 != 0x40000 && v21 != 0x80000 && v21 != 0x100000) {
        goto LABEL_53;
      }
    }
    else if (v21 >= 0x800000)
    {
      if (v21 != 0x800000 && v21 != 0x1000000) {
        goto LABEL_53;
      }
    }
    else if (v21 != 0x200000 && v21 != 0x400000)
    {
LABEL_53:
      uint64_t v21 = 0;
    }
    [v8 setMediaKind:v21];
    v22 = [v6 objectForKeyedSubscript:@"dacp.available-skip-states"];
    unint64_t v23 = [v22 integerValue];

    [v8 setCanSkipPrevious:(v23 >> 2) & 1];
    [v8 setCanSkipNext:(v23 >> 1) & 1];
    v24 = [v6 objectForKeyedSubscript:@"dacp.playerstate"];
    uint64_t v25 = [v24 integerValue];

    if ((unint64_t)(v25 - 1) >= 6) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = v25;
    }
    [v8 setPlaybackState:v26];
    v27 = [v6 objectForKeyedSubscript:@"com.apple.itunes.liked-state"];
    uint64_t v28 = [v27 integerValue];

    if ((unint64_t)(v28 - 1) >= 3) {
      uint64_t v29 = 0;
    }
    else {
      uint64_t v29 = v28;
    }
    [v8 setLikedState:v29];
    v30 = [v6 objectForKeyedSubscript:@"dacp.scrubbable"];
    v31 = v30;
    if (v30)
    {
      if ([v30 BOOLValue]) {
        uint64_t v32 = 1;
      }
      else {
        uint64_t v32 = -1;
      }
    }
    else
    {
      uint64_t v32 = 0;
    }
    [v8 setScrubbableState:v32];

    goto LABEL_27;
  }
  v8 = 0;
LABEL_27:
  uint64_t v33 = *(void *)(a1 + 32);
  if (v33) {
    (*(void (**)(uint64_t, uint64_t, void *))(v33 + 16))(v33, a2, v8);
  }
}

- (void)_requestArtworkDataIfNecessaryForNowPlayingInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 artworkIdentifier];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v11 = RMSLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "Now playing is empty, don't fetch artwork", buf, 2u);
    }

    [(NSURLSessionDataTask *)self->_artworkRequest cancel];
    currentArtworkIdentifier = self->_currentArtworkIdentifier;
    self->_currentArtworkIdentifier = 0;
    goto LABEL_12;
  }
  if (([v5 isEqualToString:self->_currentArtworkIdentifier] & 1) == 0)
  {
    [(NSURLSessionDataTask *)self->_artworkRequest cancel];
    [(RMSDAAPNowPlayingManager *)self _cancelArtworkRetryTimer];
    objc_storeStrong((id *)&self->_currentArtworkIdentifier, v6);
    v7 = +[RMSNowPlayingArtworkCache sharedArtworkCache];
    currentArtworkIdentifier = [v7 artworkDataForNowPlayingInfo:v4];

    if (currentArtworkIdentifier)
    {
      id v9 = RMSLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_impl(&dword_23C83A000, v9, OS_LOG_TYPE_DEFAULT, "Artwork was cached for identifier: %@", buf, 0xCu);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained nowPlayingManager:self artworkDataDidBecomeAvailable:currentArtworkIdentifier identifier:v6];
    }
    else
    {
      id WeakRetained = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "nowplayingartwork");
      objc_initWeak((id *)buf, self);
      requestManager = self->_requestManager;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      void v15[2] = __76__RMSDAAPNowPlayingManager__requestArtworkDataIfNecessaryForNowPlayingInfo___block_invoke;
      v15[3] = &unk_264E74570;
      objc_copyWeak(&v18, (id *)buf);
      id v16 = v4;
      id v17 = v6;
      id v13 = [(RMSDAAPRequestManager *)requestManager requestWithPath:WeakRetained method:@"GET" postData:0 queryArgs:0 completionHandler:v15];
      artworkRequest = self->_artworkRequest;
      self->_artworkRequest = v13;

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }

LABEL_12:
  }
}

void __76__RMSDAAPNowPlayingManager__requestArtworkDataIfNecessaryForNowPlayingInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2 == 1 && [v5 length])
    {
      *((void *)WeakRetained + 10) = 0;
      v7 = +[RMSNowPlayingArtworkCache sharedArtworkCache];
      [v7 setArtworkData:v5 forNowPlayingInfo:*(void *)(a1 + 32)];

      id v8 = objc_loadWeakRetained((id *)WeakRetained + 15);
      [v8 nowPlayingManager:WeakRetained artworkDataDidBecomeAvailable:v5 identifier:*(void *)(a1 + 40)];
    }
    else
    {
      id v9 = (void *)*((void *)WeakRetained + 11);
      *((void *)WeakRetained + 11) = 0;

      uint64_t v10 = *((void *)WeakRetained + 10);
      if (v10 >= 9) {
        uint64_t v10 = 9;
      }
      *((void *)WeakRetained + 10) = v10 + 1;
      uint64_t v11 = RMSLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *((void *)WeakRetained + 10);
        int v13 = 134217984;
        uint64_t v14 = v12;
        _os_log_impl(&dword_23C83A000, v11, OS_LOG_TYPE_DEFAULT, "Artwork unavailable, retrying in %zd seconds", (uint8_t *)&v13, 0xCu);
      }

      [WeakRetained _scheduleArtworkRetryForNowPlayingInfo:*(void *)(a1 + 32) delay:(double)*((uint64_t *)WeakRetained + 10)];
    }
  }
}

- (void)_scheduleArtworkRetryForNowPlayingInfo:(id)a3 delay:(double)a4
{
  id v6 = a3;
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  artworkRetryTimer = self->_artworkRetryTimer;
  self->_artworkRetryTimer = v7;

  objc_initWeak(&location, self);
  id v9 = self->_artworkRetryTimer;
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(a4 * 1000000000.0) / 10);
  uint64_t v11 = self->_artworkRetryTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __73__RMSDAAPNowPlayingManager__scheduleArtworkRetryForNowPlayingInfo_delay___block_invoke;
  handler[3] = &unk_264E74370;
  objc_copyWeak(&v15, &location);
  id v14 = v6;
  id v12 = v6;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_artworkRetryTimer);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __73__RMSDAAPNowPlayingManager__scheduleArtworkRetryForNowPlayingInfo_delay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _requestArtworkDataIfNecessaryForNowPlayingInfo:*(void *)(a1 + 32)];
}

- (void)_cancelArtworkRetryTimer
{
  artworkRetryTimer = self->_artworkRetryTimer;
  if (artworkRetryTimer)
  {
    dispatch_source_cancel(artworkRetryTimer);
    id v4 = self->_artworkRetryTimer;
    self->_artworkRetryTimer = 0;
  }
}

- (void)_requestAudioRoutes
{
  objc_initWeak(&location, self);
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "getspeakers");
  [(NSURLSessionDataTask *)self->_audioRoutesRequest cancel];
  requestManager = self->_requestManager;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__RMSDAAPNowPlayingManager__requestAudioRoutes__block_invoke;
  v7[3] = &unk_264E74598;
  objc_copyWeak(&v8, &location);
  id v5 = [(RMSDAAPRequestManager *)requestManager requestWithPath:v3 method:@"POST" postData:0 queryArgs:0 completionHandler:v7];
  audioRoutesRequest = self->_audioRoutesRequest;
  self->_audioRoutesRequest = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__RMSDAAPNowPlayingManager__requestAudioRoutes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (a2 == 1 && WeakRetained)
  {
    unint64_t v23 = WeakRetained;
    id v24 = v5;
    id v8 = +[RMSDAAPParser objectWithData:v5];
    id v9 = objc_opt_new();
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(obj);
          }
          id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v15 = objc_opt_new();
          id v16 = [v14 objectForKeyedSubscript:@"dmap.itemname"];
          [v15 setDisplayName:v16];

          id v17 = [v14 objectForKeyedSubscript:@"dacp.macAddress"];
          objc_msgSend(v15, "setMacAddress:", objc_msgSend(v17, "longLongValue"));

          id v18 = [v14 objectForKeyedSubscript:@"dacp.supportsVideo"];
          objc_msgSend(v15, "setSupportsVideo:", objc_msgSend(v18, "BOOLValue"));

          uint64_t v19 = [v14 objectForKeyedSubscript:@"dacp.selectedForVideo"];
          int v20 = [v19 BOOLValue];

          uint64_t v21 = [v14 objectForKeyedSubscript:@"dacp.selectedForAudio"];
          LODWORD(v19) = [v21 BOOLValue];

          [v15 setSelected:v19 | v20];
          [v9 addObject:v15];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }

    v7 = v23;
    if (([v23 _audioRoutes:v9 equalAudioRoutes:v23[12]] & 1) == 0)
    {
      objc_storeStrong(v23 + 12, v9);
      id v22 = objc_loadWeakRetained(v23 + 15);
      [v22 nowPlayingManager:v23 didUpdateAudioRoutes:v9];
    }
    id v5 = v24;
  }
}

- (void)_requestVolume
{
  v12[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s/1/%s", "ctrl-int", "getproperty");
  [(NSURLSessionDataTask *)self->_volumeRequest cancel];
  requestManager = self->_requestManager;
  uint64_t v11 = @"properties";
  v12[0] = @"dmcp.volume";
  id v5 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__RMSDAAPNowPlayingManager__requestVolume__block_invoke;
  v8[3] = &unk_264E74598;
  objc_copyWeak(&v9, &location);
  id v6 = [(RMSDAAPRequestManager *)requestManager requestWithPath:v3 method:@"POST" postData:0 queryArgs:v5 completionHandler:v8];
  volumeRequest = self->_volumeRequest;
  self->_volumeRequest = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __42__RMSDAAPNowPlayingManager__requestVolume__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = +[RMSDAAPParser objectWithData:v14];
    id v6 = [v5 objectForKeyedSubscript:@"dacp.volume"];
    [v6 floatValue];
    float v8 = v7;

    [WeakRetained[13] floatValue];
    if (v8 != *(float *)&v9 || !WeakRetained[13])
    {
      *(float *)&double v9 = v8;
      uint64_t v10 = [NSNumber numberWithFloat:v9];
      id v11 = WeakRetained[13];
      WeakRetained[13] = (id)v10;

      id v12 = objc_loadWeakRetained(WeakRetained + 15);
      *(float *)&double v13 = v8;
      [v12 nowPlayingManager:WeakRetained didUpdateVolume:v13];
    }
  }
}

- (BOOL)_audioRoutes:(id)a3 equalAudioRoutes:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      id v21 = v5;
      while (1)
      {
        uint64_t v12 = 0;
LABEL_5:
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v14 = v6;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (!v15) {
          break;
        }
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v23;
LABEL_9:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          if ([v13 isEqualToAudioRoute:*(void *)(*((void *)&v22 + 1) + 8 * v18)]) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v16) {
              goto LABEL_9;
            }
            goto LABEL_20;
          }
        }

        if (++v12 != v10) {
          goto LABEL_5;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
        BOOL v19 = 1;
        id v5 = v21;
        if (!v10) {
          goto LABEL_22;
        }
      }
LABEL_20:

      BOOL v19 = 0;
      id v5 = v21;
    }
    else
    {
      BOOL v19 = 1;
    }
LABEL_22:
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (RMSDAAPNowPlayingManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RMSDAAPNowPlayingManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RMSControlInterface)controlInterface
{
  return self->_controlInterface;
}

- (void)setControlInterface:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_observing;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastVolume, 0);
  objc_storeStrong((id *)&self->_currentAudioRoutes, 0);
  objc_storeStrong((id *)&self->_currentArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_artworkRetryTimer, 0);
  objc_storeStrong((id *)&self->_volumeRequest, 0);
  objc_storeStrong((id *)&self->_audioRoutesRequest, 0);
  objc_storeStrong((id *)&self->_artworkRequest, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoRequest, 0);
  objc_storeStrong((id *)&self->_controlInterface, 0);
  objc_storeStrong((id *)&self->_currentNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_requestManager, 0);
}

@end