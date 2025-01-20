@interface ICAudioController
+ (ICAudioController)sharedAudioController;
+ (void)pauseIfPlaying;
- (AVAsset)currentAsset;
- (AVPlayer)currentPlayer;
- (BOOL)isPlaying;
- (BOOL)registeredForRemoteControlEvents;
- (ICAttachment)currentAttachment;
- (ICAudioController)init;
- (NSObject)playbackTimeObserver;
- (double)pendingSeekTime;
- (int64_t)remoteChangePlaybackPosition:(id)a3;
- (int64_t)remoteChangeRate:(id)a3;
- (int64_t)remotePause:(id)a3;
- (int64_t)remotePlay:(id)a3;
- (int64_t)remoteSkipBackward:(id)a3;
- (int64_t)remoteSkipForward:(id)a3;
- (int64_t)remoteStop:(id)a3;
- (int64_t)remoteTogglePlayPause:(id)a3;
- (void)attachmentWillBeDeletedNotification:(id)a3;
- (void)deviceWillLock:(id)a3;
- (void)notifyPaused;
- (void)notifyPlaying;
- (void)notifyStopped;
- (void)pause;
- (void)play;
- (void)play:(id)a3;
- (void)playerItemDidPlayToEndTime:(id)a3;
- (void)prepareToPlayAttachment:(id)a3;
- (void)prepareToPlayAttachment:(id)a3 completion:(id)a4;
- (void)registerForRemoteControlEvents;
- (void)seekToTime:(double)a3 completion:(id)a4;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentAttachment:(id)a3;
- (void)setCurrentPlayer:(id)a3;
- (void)setPendingSeekTime:(double)a3;
- (void)setPlaybackTimeObserver:(id)a3;
- (void)setRegisteredForRemoteControlEvents:(BOOL)a3;
- (void)skipAheadByInterval:(double)a3 completion:(id)a4;
- (void)skipBackByInterval:(double)a3 completion:(id)a4;
- (void)stop;
- (void)togglePlayPause;
- (void)unregisterForRemoteControlEvents;
- (void)updateNowPlayingInfo;
- (void)updateTime:(double)a3 duration:(double)a4;
@end

@implementation ICAudioController

+ (void)pauseIfPlaying
{
  if (sDidCreateSharedController == 1)
  {
    v3 = [a1 sharedAudioController];
    int v4 = [v3 isPlaying];

    if (v4)
    {
      id v5 = [a1 sharedAudioController];
      [v5 pause];
    }
  }
}

+ (ICAudioController)sharedAudioController
{
  if (sharedAudioController_once != -1) {
    dispatch_once(&sharedAudioController_once, &__block_literal_global_55);
  }
  v2 = (void *)sharedAudioController_sharedAudioController;
  return (ICAudioController *)v2;
}

void __42__ICAudioController_sharedAudioController__block_invoke()
{
  v0 = objc_alloc_init(ICAudioController);
  v1 = (void *)sharedAudioController_sharedAudioController;
  sharedAudioController_sharedAudioController = (uint64_t)v0;

  sDidCreateSharedController = 1;
}

- (ICAudioController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICAudioController;
  v2 = [(ICAudioController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_playerItemDidPlayToEndTime_ name:*MEMORY[0x1E4F16020] object:0];

    int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_deviceWillLock_ name:*MEMORY[0x1E4FB26F0] object:0];
  }
  return v2;
}

- (void)registerForRemoteControlEvents
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAudioController registerForRemoteControlEvents]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if (![(ICAudioController *)self registeredForRemoteControlEvents])
  {
    id v15 = [MEMORY[0x1E4F31A10] sharedCommandCenter];
    v3 = [v15 pauseCommand];
    [v3 addTarget:self action:sel_remotePause_];

    int v4 = [v15 playCommand];
    [v4 addTarget:self action:sel_remotePlay_];

    id v5 = [v15 stopCommand];
    [v5 addTarget:self action:sel_remoteStop_];

    objc_super v6 = [v15 togglePlayPauseCommand];
    [v6 addTarget:self action:sel_remoteTogglePlayPause_];

    v7 = [v15 skipBackwardCommand];
    [v7 setEnabled:1];
    [v7 setPreferredIntervals:&unk_1F09A3F98];
    [v7 addTarget:self action:sel_remoteSkipBackward_];
    v8 = [v15 skipForwardCommand];

    [v8 setEnabled:1];
    [v8 setPreferredIntervals:&unk_1F09A3FB0];
    [v8 addTarget:self action:sel_remoteSkipForward_];
    v9 = [v15 seekForwardCommand];
    [v9 setEnabled:0];

    v10 = [v15 seekBackwardCommand];
    [v10 setEnabled:0];

    v11 = [v15 nextTrackCommand];
    [v11 setEnabled:0];

    v12 = [v15 previousTrackCommand];
    [v12 setEnabled:0];

    v13 = [v15 changePlaybackPositionCommand];
    [v13 setEnabled:1];
    [v13 addTarget:self action:sel_remoteChangePlaybackPosition_];
    v14 = [v15 changePlaybackRateCommand];
    [v14 setEnabled:1];
    [v14 setSupportedPlaybackRates:&unk_1F09A3FC8];
    [v14 addTarget:self action:sel_remoteChangeRate_];
    [(ICAudioController *)self setRegisteredForRemoteControlEvents:1];
  }
}

- (void)unregisterForRemoteControlEvents
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICAudioController unregisterForRemoteControlEvents]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  if ([(ICAudioController *)self registeredForRemoteControlEvents])
  {
    id v11 = [MEMORY[0x1E4F31A10] sharedCommandCenter];
    v3 = [v11 pauseCommand];
    [v3 removeTarget:self];

    int v4 = [v11 playCommand];
    [v4 removeTarget:self];

    id v5 = [v11 stopCommand];
    [v5 removeTarget:self];

    objc_super v6 = [v11 togglePlayPauseCommand];
    [v6 removeTarget:self];

    v7 = [v11 skipBackwardCommand];
    [v7 removeTarget:self];

    v8 = [v11 skipForwardCommand];
    [v8 removeTarget:self];

    v9 = [v11 changePlaybackPositionCommand];
    [v9 removeTarget:self];

    v10 = [v11 changePlaybackRateCommand];
    [v10 removeTarget:self];

    [(ICAudioController *)self setRegisteredForRemoteControlEvents:0];
  }
}

- (void)setCurrentAttachment:(id)a3
{
  id v5 = (ICAttachment *)a3;
  currentAttachment = self->_currentAttachment;
  v10 = v5;
  if (currentAttachment != v5)
  {
    v7 = (void *)MEMORY[0x1E4F830A8];
    if (currentAttachment)
    {
      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 removeObserver:self name:*v7 object:self->_currentAttachment];
    }
    objc_storeStrong((id *)&self->_currentAttachment, a3);
    if (self->_currentAttachment)
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:self selector:sel_attachmentWillBeDeletedNotification_ name:*v7 object:self->_currentAttachment];
    }
  }
}

- (BOOL)isPlaying
{
  v2 = [(ICAudioController *)self currentPlayer];
  [v2 rate];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)play
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Unable to set category for audio session", v2, v3, v4, v5, v6);
}

- (void)pause
{
  uint64_t v3 = [(ICAudioController *)self currentPlayer];

  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isLocked"))
    {
      [(ICAudioController *)self stop];
    }
    else
    {
      uint64_t v4 = [(ICAudioController *)self currentPlayer];
      [v4 pause];

      [(ICAudioController *)self notifyPaused];
      [(ICAudioController *)self updateNowPlayingInfo];
    }
  }
}

- (void)togglePlayPause
{
  if ([(ICAudioController *)self isPlaying])
  {
    [(ICAudioController *)self pause];
  }
  else
  {
    [(ICAudioController *)self play];
  }
}

- (void)stop
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "Unable to deactivate background audio session", v2, v3, v4, v5, v6);
}

- (void)prepareToPlayAttachment:(id)a3
{
}

- (void)prepareToPlayAttachment:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 attachmentType] == 4)
  {
    id v8 = [(ICAudioController *)self currentAttachment];

    if (v8 != v6)
    {
      v9 = [(ICAudioController *)self currentPlayer];
      [v9 pause];

      [(ICAudioController *)self notifyStopped];
    }
    [(ICAudioController *)self setCurrentAttachment:0];
    v10 = [v6 managedObjectContext];
    id v11 = [v6 attachmentModel];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke;
    v13[3] = &unk_1E5FDC8D0;
    id v14 = v10;
    id v15 = self;
    id v16 = v6;
    id v17 = v7;
    id v12 = v10;
    [v11 assetWithCompletion:v13];
  }
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_107;
    v7[3] = &unk_1E5FDC8A8;
    uint64_t v5 = *(void **)(a1 + 32);
    v7[4] = *(void *)(a1 + 40);
    id v8 = v3;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    [v5 performBlock:v7];
  }
  else
  {
    id v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_cold_1();
    }
  }
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_107(uint64_t a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 32;
  [*(id *)(a1 + 32) setCurrentAsset:*(void *)(a1 + 40)];
  [*(id *)v1 setCurrentAttachment:*(void *)(v1 + 16)];
  uint64_t v2 = (void *)MEMORY[0x1E4F16620];
  id v3 = [*(id *)v1 currentAsset];
  uint64_t v4 = [v2 playerItemWithAsset:v3];

  uint64_t v5 = [*(id *)v1 currentPlayer];

  if (v5)
  {
    objc_opt_class();
    id v6 = [*(id *)(a1 + 32) currentPlayer];
    id v7 = [v6 currentItem];
    id v8 = [v7 asset];
    id v9 = ICDynamicCast();

    objc_opt_class();
    id v10 = [*(id *)(a1 + 32) currentAsset];
    id v11 = ICDynamicCast();

    char v12 = 0;
    if (v9 && v11)
    {
      v13 = [v9 URL];
      id v14 = [v11 URL];
      char v12 = [v13 isEqual:v14];
    }
    objc_opt_class();
    id v15 = [*(id *)(a1 + 32) currentPlayer];
    id v16 = [v15 currentItem];
    id v17 = [v16 asset];
    v18 = ICDynamicCast();

    objc_opt_class();
    v19 = [*(id *)(a1 + 32) currentAsset];
    v20 = ICDynamicCast();

    if (v18 && v20)
    {
      v21 = ICKeyPathFromSelectors();
      v22 = objc_msgSend(v18, "valueForKeyPath:", v21, sel_segments, 0);
      v23 = [v20 valueForKeyPath:v21];
      char v24 = [v22 isEqual:v23];

      if (v24) {
        goto LABEL_13;
      }
    }
    else if (v12)
    {
LABEL_13:

      goto LABEL_16;
    }
    v27 = [*(id *)(a1 + 32) currentPlayer];
    [v27 replaceCurrentItemWithPlayerItem:v4];

    goto LABEL_13;
  }
  v25 = [MEMORY[0x1E4F16608] playerWithPlayerItem:v4];
  [*(id *)(a1 + 32) setCurrentPlayer:v25];

  v26 = [*(id *)(a1 + 32) currentPlayer];
  if ([v26 status] == 1)
  {
  }
  else
  {
    v28 = [*(id *)(a1 + 32) currentPlayer];
    uint64_t v29 = [v28 status];

    if (v29) {
      goto LABEL_16;
    }
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v30 = [*(id *)(a1 + 32) currentPlayer];
  CMTimeMakeWithSeconds(&v44, 0.0333333333, 90000);
  id v31 = MEMORY[0x1E4F14428];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_2;
  v42[3] = &unk_1E5FDC880;
  objc_copyWeak(&v43, &location);
  v32 = [v30 addPeriodicTimeObserverForInterval:&v44 queue:MEMORY[0x1E4F14428] usingBlock:v42];
  [*(id *)(a1 + 32) setPlaybackTimeObserver:v32];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
LABEL_16:
  v33 = NSStringFromSelector(sel_tracks);
  v34 = [*(id *)(a1 + 32) currentAsset];
  BOOL v35 = [v34 statusOfValueForKey:v33 error:0] == 2;

  if (v35)
  {
    uint64_t v36 = *(void *)(a1 + 56);
    if (v36) {
      (*(void (**)(void))(v36 + 16))();
    }
  }
  else
  {
    v37 = [*(id *)(a1 + 32) currentAsset];
    v46[0] = v33;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_3;
    v40[3] = &unk_1E5FDBB10;
    v40[4] = *(void *)(a1 + 32);
    v40[5] = v33;
    id v41 = *(id *)(a1 + 56);
    [v37 loadValuesAsynchronouslyForKeys:v38 completionHandler:v40];
  }
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_2(uint64_t a1, CMTime *a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained currentAsset];
  id v6 = v5;
  if (v5) {
    [v5 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  CMTime v10 = *a2;
  double v8 = CMTimeGetSeconds(&v10);
  id v9 = objc_loadWeakRetained(v3);
  [v9 updateTime:v8 duration:Seconds];
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentAsset];
  uint64_t v3 = [v2 statusOfValueForKey:*(void *)(a1 + 40) error:0];

  if (v3 == 2)
  {
    performBlockOnMainThread();
  }
}

- (void)play:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__ICAudioController_play___block_invoke;
  v6[3] = &unk_1E5FD91D0;
  id v7 = v4;
  double v8 = self;
  id v5 = v4;
  [(ICAudioController *)self prepareToPlayAttachment:v5 completion:v6];
}

uint64_t __26__ICAudioController_play___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F831A0];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4F83198];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v2 postNotificationName:v3 object:0 userInfo:v5];

  return [*(id *)(a1 + 40) play];
}

- (void)seekToTime:(double)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ICAudioController *)self currentPlayer];

  if (v7)
  {
    double v8 = [(ICAudioController *)self currentPlayer];
    CMTimeMakeWithSeconds(&v15, a3, 600);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__ICAudioController_seekToTime_completion___block_invoke;
    v13[3] = &unk_1E5FDC8F8;
    void v13[4] = self;
    id v14 = v6;
    long long v11 = *MEMORY[0x1E4F1FA48];
    uint64_t v12 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v9 = v11;
    uint64_t v10 = v12;
    [v8 seekToTime:&v15 toleranceBefore:&v11 toleranceAfter:&v9 completionHandler:v13];
  }
  else
  {
    [(ICAudioController *)self setPendingSeekTime:a3];
    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

uint64_t __43__ICAudioController_seekToTime_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) updateNowPlayingInfo];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)skipAheadByInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[ICAudioController sharedAudioController];
  double v8 = [v7 currentPlayer];
  long long v9 = [v8 currentItem];
  uint64_t v10 = v9;
  if (v9) {
    [v9 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  uint64_t v12 = +[ICAudioController sharedAudioController];
  v13 = [v12 currentPlayer];
  id v14 = v13;
  if (v13) {
    [v13 currentTime];
  }
  else {
    memset(&v17, 0, sizeof(v17));
  }
  double v15 = CMTimeGetSeconds(&v17) + a3;

  if (Seconds >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = Seconds;
  }
  -[ICAudioController seekToTime:completion:](self, "seekToTime:completion:", v6, v16, v17.value, *(void *)&v17.timescale, v17.epoch, time.value, *(void *)&time.timescale, time.epoch);
}

- (void)skipBackByInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ICAudioController *)self currentPlayer];
  double v8 = v7;
  if (v7) {
    [v7 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double v9 = CMTimeGetSeconds(&time) - a3;

  [(ICAudioController *)self seekToTime:v6 completion:fmax(v9, 0.0)];
}

- (int64_t)remotePlay:(id)a3
{
  return 0;
}

- (int64_t)remotePause:(id)a3
{
  return 0;
}

- (int64_t)remoteStop:(id)a3
{
  return 0;
}

- (int64_t)remoteTogglePlayPause:(id)a3
{
  return 0;
}

- (int64_t)remoteSkipBackward:(id)a3
{
  return 0;
}

- (int64_t)remoteSkipForward:(id)a3
{
  return 0;
}

- (int64_t)remoteChangePlaybackPosition:(id)a3
{
  return 0;
}

- (int64_t)remoteChangeRate:(id)a3
{
  [a3 playbackRate];
  int v5 = v4;
  id v6 = [(ICAudioController *)self currentPlayer];
  LODWORD(v7) = v5;
  [v6 setRate:v7];

  return 0;
}

- (void)attachmentWillBeDeletedNotification:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(ICAudioController *)self currentAttachment];

  int v5 = v6;
  if (v6 == v4)
  {
    if ([(ICAudioController *)self isPlaying]) {
      [(ICAudioController *)self stop];
    }
    [(ICAudioController *)self setCurrentAttachment:0];
    int v5 = v6;
  }
}

- (void)playerItemDidPlayToEndTime:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int v5 = [v4 object];

  ICDynamicCast();
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = v10;
  if (v10)
  {
    double v7 = [(ICAudioController *)self currentPlayer];
    double v8 = [v7 currentItem];
    int v9 = [v10 isEqual:v8];

    id v6 = v10;
    if (v9)
    {
      [(ICAudioController *)self notifyStopped];
      id v6 = v10;
    }
  }
}

- (void)deviceWillLock:(id)a3
{
  if (![(ICAudioController *)self isPlaying])
  {
    [(ICAudioController *)self stop];
  }
}

- (void)notifyPlaying
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = [(ICAudioController *)self currentAttachment];
  [v4 postNotificationName:@"ICAudioPlaybackPlayNotification" object:v3];
}

- (void)notifyPaused
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = [(ICAudioController *)self currentAttachment];
  [v4 postNotificationName:@"ICAudioPlaybackPauseNotification" object:v3];
}

- (void)notifyStopped
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = [(ICAudioController *)self currentAttachment];
  [v4 postNotificationName:@"ICAudioPlaybackStopNotification" object:v3];
}

- (void)updateTime:(double)a3 duration:(double)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v8 = [(ICAudioController *)self currentAttachment];
  v12[0] = @"ICAudioPlaybackNotificationTimeKey";
  int v9 = [NSNumber numberWithDouble:a3];
  v12[1] = @"ICAudioPlaybackNotificationDurationKey";
  v13[0] = v9;
  id v10 = [NSNumber numberWithDouble:a4];
  v13[1] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v7 postNotificationName:@"ICAudioPlaybackTimeChangedNotification" object:v8 userInfo:v11];
}

- (void)updateNowPlayingInfo
{
  v32[4] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isLocked")
    && ![(ICAudioController *)self isPlaying])
  {
    id v28 = [MEMORY[0x1E4F319E8] defaultCenter];
    [v28 setNowPlayingInfo:0];
  }
  else
  {
    uint64_t v3 = [(ICAudioController *)self currentAttachment];
    id v4 = [v3 title];
    int v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      double v7 = [(ICAudioController *)self currentAttachment];
      uint64_t v8 = [v7 defaultTitle];
      int v9 = (void *)v8;
      id v10 = &stru_1F0973378;
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      id v6 = v10;
    }
    long long v11 = [(ICAudioController *)self currentAsset];
    uint64_t v12 = v11;
    if (v11) {
      [v11 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);

    id v14 = [(ICAudioController *)self currentPlayer];
    double v15 = v14;
    if (v14) {
      [v14 currentTime];
    }
    else {
      memset(&v29, 0, sizeof(v29));
    }
    double v16 = CMTimeGetSeconds(&v29);

    CMTime v17 = [(ICAudioController *)self currentPlayer];
    [v17 rate];
    int v19 = v18;

    uint64_t v20 = *MEMORY[0x1E4F31538];
    v32[0] = v6;
    uint64_t v21 = *MEMORY[0x1E4F317A8];
    v31[0] = v20;
    v31[1] = v21;
    v22 = [NSNumber numberWithDouble:v16];
    v32[1] = v22;
    v31[2] = *MEMORY[0x1E4F31440];
    v23 = [NSNumber numberWithDouble:Seconds];
    v32[2] = v23;
    v31[3] = *MEMORY[0x1E4F317B8];
    LODWORD(v24) = v19;
    v25 = [NSNumber numberWithFloat:v24];
    v32[3] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
    v27 = [MEMORY[0x1E4F319E8] defaultCenter];
    [v27 setNowPlayingInfo:v26];
  }
}

- (AVPlayer)currentPlayer
{
  return self->_currentPlayer;
}

- (void)setCurrentPlayer:(id)a3
{
}

- (ICAttachment)currentAttachment
{
  return self->_currentAttachment;
}

- (AVAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setCurrentAsset:(id)a3
{
}

- (NSObject)playbackTimeObserver
{
  return self->_playbackTimeObserver;
}

- (void)setPlaybackTimeObserver:(id)a3
{
}

- (double)pendingSeekTime
{
  return self->_pendingSeekTime;
}

- (void)setPendingSeekTime:(double)a3
{
  self->_pendingSeekTime = a3;
}

- (BOOL)registeredForRemoteControlEvents
{
  return self->_registeredForRemoteControlEvents;
}

- (void)setRegisteredForRemoteControlEvents:(BOOL)a3
{
  self->_registeredForRemoteControlEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackTimeObserver, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_currentAttachment, 0);
  objc_storeStrong((id *)&self->_currentPlayer, 0);
}

void __56__ICAudioController_prepareToPlayAttachment_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1B08EB000, v0, v1, "ICAudioController attempted to play nil asset, bailing", v2, v3, v4, v5, v6);
}

@end