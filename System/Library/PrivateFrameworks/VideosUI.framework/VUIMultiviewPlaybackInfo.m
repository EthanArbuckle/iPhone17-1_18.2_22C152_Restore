@interface VUIMultiviewPlaybackInfo
+ (id)prospectivePlaybackInfo;
- (AVPlayerViewController)playerViewController;
- (BOOL)_audioContainsAirPlayRoute;
- (BOOL)isAtLiveEdge;
- (BOOL)pausedDueToInterruption;
- (BOOL)playsFromStart;
- (NSDate)resumeDate;
- (NSString)broadcastLocale;
- (TVPPlaybackState)backgroundPlayerState;
- (VUILivePostPlayController)livePostPlayController;
- (VUIMultiviewPlaybackInfo)initWithPlayer:(id)a3 playerViewController:(id)a4 playsFromStart:(BOOL)a5 broadcastLocale:(id)a6 livePostPlayController:(id)a7;
- (VUIPlayer)player;
- (id)_audioTrackForPlayer:(id)a3 withIdentifier:(int)a4;
- (id)_enabledAudioTrackForPlayer:(id)a3;
- (id)notificationToken;
- (int)disabledAudioTrackId;
- (int64_t)context;
- (void)_waitForExternalPlaybackToEndForPlayer:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setBackgroundPlayerState:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDisabledAudioTrackId:(int)a3;
- (void)setLivePostPlayController:(id)a3;
- (void)setNotificationToken:(id)a3;
- (void)setPausedDueToInterruption:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setResumeDate:(id)a3;
- (void)swapActiveAudioWithPlaybackInfo:(id)a3 completion:(id)a4;
- (void)waitForExternalPlaybackToBecomeType:(int64_t)a3 forPlayer:(id)a4 completion:(id)a5;
@end

@implementation VUIMultiviewPlaybackInfo

- (VUIMultiviewPlaybackInfo)initWithPlayer:(id)a3 playerViewController:(id)a4 playsFromStart:(BOOL)a5 broadcastLocale:(id)a6 livePostPlayController:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)VUIMultiviewPlaybackInfo;
  v17 = [(VUIMultiviewPlaybackInfo *)&v26 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_player, a3);
    objc_storeStrong((id *)&v18->_playerViewController, a4);
    v18->_context = 0;
    v18->_playsFromStart = a5;
    objc_storeStrong((id *)&v18->_broadcastLocale, a6);
    v18->_pausedDueToInterruption = 0;
    if (_os_feature_enabled_impl())
    {
      if (v16)
      {
        v19 = (VUILivePostPlayController *)v16;
        livePostPlayController = v18->_livePostPlayController;
        v18->_livePostPlayController = v19;
LABEL_8:

        goto LABEL_9;
      }
      if (v13 && v14)
      {
        livePostPlayController = +[VUIInterfaceFactory sharedInstance];
        v21 = [livePostPlayController documentCreator];
        v22 = [v14 view];
        uint64_t v23 = [v21 initializeLivePostPlayControllerWithPlayer:v13 playerViewController:v14 presentationView:v22];
        v24 = v18->_livePostPlayController;
        v18->_livePostPlayController = (VUILivePostPlayController *)v23;

        goto LABEL_8;
      }
    }
  }
LABEL_9:

  return v18;
}

- (void)dealloc
{
  [(VUILivePostPlayController *)self->_livePostPlayController cleanup];
  v3.receiver = self;
  v3.super_class = (Class)VUIMultiviewPlaybackInfo;
  [(VUIMultiviewPlaybackInfo *)&v3 dealloc];
}

+ (id)prospectivePlaybackInfo
{
  if (prospectivePlaybackInfo_onceToken != -1) {
    dispatch_once(&prospectivePlaybackInfo_onceToken, &__block_literal_global_58);
  }
  v2 = (void *)prospectivePlaybackInfo_instance;
  return v2;
}

void __51__VUIMultiviewPlaybackInfo_prospectivePlaybackInfo__block_invoke()
{
  v0 = [[VUIMultiviewPlaybackInfo alloc] initWithPlayer:0 playerViewController:0 playsFromStart:0 broadcastLocale:0 livePostPlayController:0];
  v1 = (void *)prospectivePlaybackInfo_instance;
  prospectivePlaybackInfo_instance = (uint64_t)v0;
}

- (BOOL)isAtLiveEdge
{
  v2 = [(VUIMultiviewPlaybackInfo *)self player];
  char v3 = [v2 isLive];

  return v3;
}

- (BOOL)_audioContainsAirPlayRoute
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F153E0] sharedInstance];
  char v3 = [v2 currentRoute];
  v4 = [v3 outputs];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    v8 = (void *)*MEMORY[0x1E4F150B8];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "portType", (void)v12);

        if (v10 == v8)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)waitForExternalPlaybackToBecomeType:(int64_t)a3 forPlayer:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(void))a5;
  if (v8 && [v8 externalPlaybackType] != a3)
  {
    objc_initWeak(&location, self);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v11 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v12 = *MEMORY[0x1E4FAA3F8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85__VUIMultiviewPlaybackInfo_waitForExternalPlaybackToBecomeType_forPlayer_completion___block_invoke;
    v14[3] = &unk_1E6DF6F50;
    id v15 = v8;
    v17[1] = (id)a3;
    objc_copyWeak(v17, &location);
    id v16 = v9;
    long long v13 = [v10 addObserverForName:v12 object:v15 queue:v11 usingBlock:v14];

    [(VUIMultiviewPlaybackInfo *)self setNotificationToken:v13];
    objc_destroyWeak(v17);

    objc_destroyWeak(&location);
  }
  else if (v9)
  {
    v9[2](v9);
  }
}

uint64_t __85__VUIMultiviewPlaybackInfo_waitForExternalPlaybackToBecomeType_forPlayer_completion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) externalPlaybackType];
  if (result == *(void *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = [WeakRetained notificationToken];

    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v6 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v7 = [v6 notificationToken];

      [v5 removeObserver:v7];
    }
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v8 = *(uint64_t (**)(void))(result + 16);
      return v8();
    }
  }
  return result;
}

- (void)_waitForExternalPlaybackToEndForPlayer:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__VUIMultiviewPlaybackInfo__waitForExternalPlaybackToEndForPlayer_completion___block_invoke;
  v9[3] = &unk_1E6DF3DD0;
  id v10 = v6;
  id v7 = v6;
  id v8 = a3;
  [(VUIMultiviewPlaybackInfo *)self waitForExternalPlaybackToBecomeType:0 forPlayer:v8 completion:v9];
  [v8 setAllowsExternalPlayback:0];
}

uint64_t __78__VUIMultiviewPlaybackInfo__waitForExternalPlaybackToEndForPlayer_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_enabledAudioTrackForPlayer:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  char v3 = objc_msgSend(a3, "avPlayer", 0);
  v4 = [v3 currentItem];
  id v5 = [v4 tracks];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = *MEMORY[0x1E4F15BA8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 assetTrack];
        long long v13 = [v12 mediaType];
        if ([v13 isEqualToString:v9])
        {
          char v14 = [v11 isEnabled];

          if (v14)
          {
            id v15 = v11;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  id v15 = 0;
LABEL_13:

  return v15;
}

- (id)_audioTrackForPlayer:(id)a3 withIdentifier:(int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = objc_msgSend(a3, "avPlayer", 0);
  uint64_t v6 = [v5 currentItem];
  uint64_t v7 = [v6 tracks];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v13 = [v12 assetTrack];
        int v14 = [v13 trackID];

        if (v14 == a4)
        {
          id v15 = v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

- (void)swapActiveAudioWithPlaybackInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = [v6 player];
  uint64_t v9 = [v6 playerViewController];
  uint64_t v10 = [(VUIMultiviewPlaybackInfo *)self player];
  v11 = [(VUIMultiviewPlaybackInfo *)self playerViewController];
  if ([(VUIMultiviewPlaybackInfo *)self _audioContainsAirPlayRoute])
  {
    [v8 pause];
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v17[2] = __71__VUIMultiviewPlaybackInfo_swapActiveAudioWithPlaybackInfo_completion___block_invoke;
    v17[3] = &unk_1E6DF6F78;
    id v18 = v8;
    objc_copyWeak(&v23, &location);
    id v19 = v9;
    id v20 = v10;
    id v21 = v11;
    uint64_t v22 = v7;
    [(VUIMultiviewPlaybackInfo *)self _waitForExternalPlaybackToEndForPlayer:v18 completion:v17];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    [v8 setAllowsExternalPlayback:0];
    [v9 setUpdatesNowPlayingInfoCenter:0];
    uint64_t v12 = [v9 playerController];
    [v12 setAllowsAudioPlayback:0];

    [v8 setMuted:1];
    long long v13 = [(VUIMultiviewPlaybackInfo *)self _enabledAudioTrackForPlayer:v8];
    [v13 setEnabled:0];
    [v10 setAllowsExternalPlayback:1];
    [v11 setUpdatesNowPlayingInfoCenter:1];
    int v14 = [v11 playerController];
    [v14 setAllowsAudioPlayback:1];

    [v10 setMuted:0];
    id v15 = [(VUIMultiviewPlaybackInfo *)self _audioTrackForPlayer:v10 withIdentifier:[(VUIMultiviewPlaybackInfo *)self disabledAudioTrackId]];
    [v15 setEnabled:1];
    id v16 = [v13 assetTrack];
    -[VUIMultiviewPlaybackInfo setDisabledAudioTrackId:](self, "setDisabledAudioTrackId:", [v16 trackID]);

    [v9 setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:0];
    [v11 setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:4];
    if (v7) {
      v7[2](v7);
    }
  }
}

void __71__VUIMultiviewPlaybackInfo_swapActiveAudioWithPlaybackInfo_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMuted:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v12 = [WeakRetained _enabledAudioTrackForPlayer:*(void *)(a1 + 32)];

  [v12 setEnabled:0];
  char v3 = [*(id *)(a1 + 40) playerController];
  [v3 setAllowsAudioPlayback:0];

  [*(id *)(a1 + 32) play];
  [*(id *)(a1 + 48) pause];
  [*(id *)(a1 + 48) setAllowsExternalPlayback:1];
  [*(id *)(a1 + 48) setMuted:0];
  id v4 = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v6, "_audioTrackForPlayer:withIdentifier:", v5, objc_msgSend(v6, "disabledAudioTrackId"));

  [v7 setEnabled:1];
  uint64_t v8 = [*(id *)(a1 + 56) playerController];
  [v8 setAllowsAudioPlayback:1];

  [*(id *)(a1 + 48) play];
  id v9 = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v10 = [v12 assetTrack];
  objc_msgSend(v9, "setDisabledAudioTrackId:", objc_msgSend(v10, "trackID"));

  [*(id *)(a1 + 40) setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:0];
  [*(id *)(a1 + 56) setPreferredPlaybackControlsSupplementalSubtitleDisplayOption:4];
  uint64_t v11 = *(void *)(a1 + 64);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

- (VUIPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (VUILivePostPlayController)livePostPlayController
{
  return self->_livePostPlayController;
}

- (void)setLivePostPlayController:(id)a3
{
}

- (BOOL)playsFromStart
{
  return self->_playsFromStart;
}

- (NSString)broadcastLocale
{
  return self->_broadcastLocale;
}

- (BOOL)pausedDueToInterruption
{
  return self->_pausedDueToInterruption;
}

- (void)setPausedDueToInterruption:(BOOL)a3
{
  self->_pausedDueToInterruption = a3;
}

- (NSDate)resumeDate
{
  return self->_resumeDate;
}

- (void)setResumeDate:(id)a3
{
}

- (TVPPlaybackState)backgroundPlayerState
{
  return self->_backgroundPlayerState;
}

- (void)setBackgroundPlayerState:(id)a3
{
}

- (id)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
}

- (int)disabledAudioTrackId
{
  return self->_disabledAudioTrackId;
}

- (void)setDisabledAudioTrackId:(int)a3
{
  self->_disabledAudioTrackId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_backgroundPlayerState, 0);
  objc_storeStrong((id *)&self->_resumeDate, 0);
  objc_storeStrong((id *)&self->_broadcastLocale, 0);
  objc_storeStrong((id *)&self->_livePostPlayController, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end