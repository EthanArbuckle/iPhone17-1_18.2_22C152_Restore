@interface IMAVPlayer
+ (BOOL)isMaxSpeed:(unint64_t)a3;
+ (BOOL)isMinSpeed:(unint64_t)a3;
+ (NSArray)availableSpeeds;
+ (float)rateForPlaybackSpeed:(unint64_t)a3;
+ (id)avPlaybackSpeedForSpeed:(unint64_t)a3;
+ (id)playerID;
+ (id)sharedPlayer;
+ (unint64_t)decrementPlaybackSpeed:(unint64_t)a3;
+ (unint64_t)incrementPlaybackSpeed:(unint64_t)a3;
+ (unint64_t)playbackSpeedForRate:(float)a3;
+ (void)performOnAvSessionQueue:(id)a3;
+ (void)performOnMainQueue:(id)a3;
- ($A179B7F90EACB6BD9E7D7430050708F9)delegateFlags;
- ($FE7ED0E05F0D31DE1948BDABFA0192D4)_skipToPreviousThreshold;
- (AVAudioSession)audioSession;
- (AVPlayer)player;
- (AVPlayerItem)playerItem;
- (AVPlayerLayer)videoLayer;
- (BOOL)_pause;
- (BOOL)_pause:(BOOL)a3;
- (BOOL)_stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4 stopBlock:(id)a5;
- (BOOL)_validatePlay;
- (BOOL)airplayVideoActive;
- (BOOL)bufferEmpty;
- (BOOL)externalDisplay;
- (BOOL)hasChapters;
- (BOOL)isAtEnd;
- (BOOL)isDurationReady;
- (BOOL)isPlaybackActive;
- (BOOL)isPlaybackRequested;
- (BOOL)isScanning;
- (BOOL)isSeeking;
- (BOOL)isStalled;
- (BOOL)isUpdatingCurrentTime;
- (BOOL)nextRemote;
- (BOOL)pause;
- (BOOL)pauseWithInitiator:(unint64_t)a3;
- (BOOL)pauseWithInitiator:(unint64_t)a3 interruptionEvent:(BOOL)a4;
- (BOOL)play;
- (BOOL)previousRemote;
- (BOOL)previousRemote:(BOOL)a3;
- (BOOL)providesVideoView;
- (BOOL)scrubbing;
- (BOOL)seekForward;
- (BOOL)shouldEnforceHDCP;
- (BOOL)stateChangeInterruptionFlag;
- (BOOL)stop;
- (BOOL)stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4;
- (BOOL)timeObserverNeedsUpdate;
- (BOOL)togglePlayPause;
- (BOOL)wasInterrupted;
- (BOOL)wasInterruptedEarly;
- (IMAVPlaybackCausalityObserver)causalityObserver;
- (IMAVPlayer)init;
- (IMAVPlayer)initWithCommandCenter:(id)a3 infoCenter:(id)a4 audioSession:(id)a5;
- (IMAVPlayerDelegate)delegate;
- (IMAVPlayerVideoViewController)videoViewController;
- (IMPlayerChapterInfo)currentChapter;
- (IMPlayerItem)currentItem;
- (IMPlayerManifest)manifest;
- (MPNowPlayingInfoCenter)infoCenter;
- (MPRemoteCommandCenter)commandCenter;
- (NSMutableArray)observingTimes;
- (NSMutableArray)timeObservers;
- (NSTimer)autoStopTimer;
- (NSTimer)hdcpTimer;
- (NSTimer)seekTimer;
- (NSURL)lastPlayingURL;
- (OS_dispatch_source)fadeOutTimer;
- (UIWindow)externalVideoWindow;
- (double)autoStopMediaTime;
- (double)autoStopTimeRemaining;
- (double)autoStopTimerPausedTime;
- (double)autoStopTimerTime;
- (double)currentInterruptionTime;
- (double)currentTime;
- (double)duration;
- (double)durationBeforeItemLoaded;
- (double)loadedDuration;
- (double)previousInterruptionTime;
- (float)actualRate;
- (float)requestedRate;
- (float)scanRate;
- (float)storedVolume;
- (float)volume;
- (id)nowPlayingInfoPeriodicTimeObserver;
- (id)periodicTimeObserver;
- (id)playbackErrorFallback;
- (id)stillFrameAt:(double)a3 maxSize:(CGSize)a4 scale:(double)a5;
- (int)loops;
- (unint64_t)autoStop;
- (unint64_t)backgroundTask;
- (unint64_t)chapterCount;
- (unint64_t)chapterMetadataMode;
- (unint64_t)currentChapterIndex;
- (unint64_t)loadState;
- (unint64_t)playbackSpeed;
- (unint64_t)state;
- (unint64_t)videoScale;
- (void)_autoStopTimerFired;
- (void)_clearAutoStop;
- (void)_clearAutoStopTimmer;
- (void)_configureAudioSessionWithCompletion:(id)a3;
- (void)_createPlayer;
- (void)_durationAvailable;
- (void)_failedToPlayToEndNotification:(id)a3;
- (void)_pauseAutoStopTimer;
- (void)_postNotificationName:(id)a3 userInfo:(id)a4;
- (void)_primitiveSetCurrentItem:(id)a3;
- (void)_setChapterIndex:(unint64_t)a3;
- (void)_setCurrentTime:(double)a3;
- (void)_setupAutoStopTimer;
- (void)_updateForCurrentRateAndTimeControlStatus;
- (void)_updatePlayerForCurrentItem;
- (void)_updatePlayerTimeCompleted:(double)a3 completion:(id)a4;
- (void)_updatePlayerToCurrentTime:(id)a3;
- (void)addCMTimeObserver:(id *)a3;
- (void)addPeriodicTimeObservers;
- (void)addTimeObserver:(double)a3;
- (void)becomeActiveMediaPlayer;
- (void)beginBackgroundTask;
- (void)cancelFadeOut;
- (void)cancelSeek;
- (void)clearTimeObservers;
- (void)configureAudioSessionAndSetActive:(BOOL)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)endBackgroundTask;
- (void)endSeek;
- (void)enforceAutoStopForMode:(unint64_t)a3;
- (void)fadeOut;
- (void)fadeOutWithDuration:(double)a3;
- (void)fadeOutWithDuration:(double)a3 completion:(id)a4;
- (void)forceTriggerTimeObserverAt:(double)a3;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)handlePlayerInterruption:(id)a3;
- (void)hdcpTimer:(id)a3;
- (void)manifestCurrentItemDidChange;
- (void)nextChapter;
- (void)nextMediaItem;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)onChaptersLoaded:(id)a3;
- (void)onRouteChange:(id)a3;
- (void)onSeekTimer:(id)a3;
- (void)play:(id)a3 interruptionEvent:(BOOL)a4;
- (void)playerItemDidReachEnd:(id)a3;
- (void)previousChapter;
- (void)previousMediaItem;
- (void)registerAVSessionCategoryAndMode;
- (void)removeAllTimeObservers;
- (void)removeCMTimeObserver:(id *)a3;
- (void)removePeriodicTimeObservers;
- (void)removeTimeObserver:(double)a3;
- (void)resetPlayer:(id)a3;
- (void)scanWithRate:(float)a3;
- (void)sendDurationLoadedCoreAnalyticsEvents;
- (void)sendItemEndedNotification;
- (void)sendPeriodicTimeEvent:(double)a3 duration:(double)a4 finished:(BOOL)a5;
- (void)setAudioSession:(id)a3;
- (void)setAutoStop:(unint64_t)a3;
- (void)setAutoStopMediaTime:(double)a3;
- (void)setAutoStopTimer:(id)a3;
- (void)setAutoStopTimerPausedTime:(double)a3;
- (void)setAutoStopTimerTime:(double)a3;
- (void)setBackgroundTask:(unint64_t)a3;
- (void)setCausalityObserver:(id)a3;
- (void)setChapterMetadataMode:(unint64_t)a3;
- (void)setCommandCenter:(id)a3;
- (void)setCurrentChapterIndex:(unint64_t)a3;
- (void)setCurrentInterruptionTime:(double)a3;
- (void)setCurrentItem:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTime:(double)a3 fromMediaRemote:(BOOL)a4;
- (void)setCurrentTimeRemote:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateFlags:(id)a3;
- (void)setDurationBeforeItemLoaded:(double)a3;
- (void)setExternalVideoWindow:(id)a3;
- (void)setFadeOutTimer:(id)a3;
- (void)setHdcpTimer:(id)a3;
- (void)setInfoCenter:(id)a3;
- (void)setIsUpdatingCurrentTime:(BOOL)a3;
- (void)setLastPlayingURL:(id)a3;
- (void)setLoops:(int)a3;
- (void)setManifest:(id)a3 completion:(id)a4;
- (void)setNowPlayingInfoPeriodicTimeObserver:(id)a3;
- (void)setObservingTimes:(id)a3;
- (void)setPeriodicTimeObserver:(id)a3;
- (void)setPlaybackErrorFallback:(id)a3;
- (void)setPlaybackSpeed:(unint64_t)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setPreviousInterruptionTime:(double)a3;
- (void)setProvidesVideoView:(BOOL)a3;
- (void)setRequestedRate:(float)a3;
- (void)setScanRate:(float)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setSeekForward:(BOOL)a3;
- (void)setSeekTimer:(id)a3;
- (void)setShouldEnforceHDCP:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 additionalUserInfo:(id)a4 completion:(id)a5;
- (void)setStateChangeInterruptionFlag:(BOOL)a3;
- (void)setTimeObserverNeedsUpdate:(BOOL)a3;
- (void)setTimeObservers:(id)a3;
- (void)setVideoLayer:(id)a3;
- (void)setVideoScale:(unint64_t)a3;
- (void)setVideoViewController:(id)a3;
- (void)setVolume:(float)a3;
- (void)setWasInterrupted:(BOOL)a3;
- (void)setWasInterruptedEarly:(BOOL)a3;
- (void)setupChapterAtTime:(double)a3;
- (void)setupChapterTimeObservers;
- (void)setupTimeObserver:(id)a3;
- (void)sleep;
- (void)startSeek:(BOOL)a3;
- (void)stopObservingPlayer:(id)a3;
- (void)stopObservingPlayerItem:(id)a3;
- (void)toggleVideoAspectScaleMode;
- (void)triggerTimeObserverAt:(id)a3;
- (void)updateInfoCenterPlaybackState;
- (void)updateNowPlayingDurationSnapshot;
- (void)updateNowPlayingMetadataIncludingArtwork:(BOOL)a3;
- (void)updateRateForCurrentState;
- (void)updateRateForCurrentState:(id)a3;
- (void)updateTimeObservers;
@end

@implementation IMAVPlayer

- (void)setCommandCenter:(id)a3
{
}

- (IMAVPlayer)init
{
  return [(IMAVPlayer *)self initWithCommandCenter:0 infoCenter:0 audioSession:0];
}

- (IMAVPlayer)initWithCommandCenter:(id)a3 infoCenter:(id)a4 audioSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)IMAVPlayer;
  v11 = [(IMAVPlayer *)&v26 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_13;
  }
  v11->_loops = 0;
  v11->_state = 0;
  if (v10)
  {
    [(IMAVPlayer *)v11 setAudioSession:v10];
    if (v9) {
      goto LABEL_4;
    }
LABEL_7:
    id v14 = objc_alloc(MEMORY[0x1E4F319E8]);
    v15 = [(id)objc_opt_class() playerID];
    v16 = (void *)[v14 initWithPlayerID:v15];
    [(IMAVPlayer *)v12 setInfoCenter:v16];

    if (v8) {
      goto LABEL_5;
    }
    goto LABEL_8;
  }
  v13 = [MEMORY[0x1E4F153E0] sharedInstance];
  [(IMAVPlayer *)v12 setAudioSession:v13];

  if (!v9) {
    goto LABEL_7;
  }
LABEL_4:
  [(IMAVPlayer *)v12 setInfoCenter:v9];
  if (v8)
  {
LABEL_5:
    [(IMAVPlayer *)v12 setCommandCenter:v8];
    goto LABEL_9;
  }
LABEL_8:
  id v17 = objc_alloc(MEMORY[0x1E4F31A10]);
  v18 = [(id)objc_opt_class() playerID];
  v19 = (void *)[v17 initWithPlayerID:v18];
  [(IMAVPlayer *)v12 setCommandCenter:v19];

LABEL_9:
  v20 = [(IMAVPlayer *)v12 infoCenter];
  [v20 setPlaybackState:2];

  [(IMAVPlayer *)v12 setChapterMetadataMode:0];
  [(IMAVPlayer *)v12 setScanRate:0.0];
  if ([MEMORY[0x1E4F91FC8] platformSupportsVideo])
  {
    v12->_videoScale = 0;
    -[IMAVPlayer setProvidesVideoView:](v12, "setProvidesVideoView:", [MEMORY[0x1E4F91FC8] isRunningOnTV] ^ 1);
    if ((os_feature_enabled_red_sun() & 1) == 0)
    {
      v21 = [[IMAVPlayerVideoViewController alloc] initWithPlayer:v12];
      [(IMAVPlayer *)v12 setVideoViewController:v21];
    }
  }
  v22 = objc_opt_class();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__IMAVPlayer_initWithCommandCenter_infoCenter_audioSession___block_invoke;
  v24[3] = &unk_1E6E1FAA8;
  v25 = v12;
  [v22 performOnMainQueue:v24];

LABEL_13:
  return v12;
}

void __60__IMAVPlayer_initWithCommandCenter_infoCenter_audioSession___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createPlayer];
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(*(id *)(a1 + 32), "setPlaybackSpeed:", objc_msgSend(v2, "integerForKey:", @"IMAVPlayerPlaybackSpeedUserDefaultKey"));

  [*(id *)(a1 + 32) storedVolume];
  objc_msgSend(*(id *)(a1 + 32), "setVolume:");
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *MEMORY[0x1E4F15000];
  v6 = [v4 audioSession];
  [v3 addObserver:v4 selector:sel_handleAudioSessionInterruption_ name:v5 object:v6];

  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *MEMORY[0x1E4F15168];
  id v10 = [v8 audioSession];
  [v7 addObserver:v8 selector:sel_onRouteChange_ name:v9 object:v10];

  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:*(void *)(a1 + 32) selector:sel_resetPlayer_ name:*MEMORY[0x1E4F15048] object:0];

  v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 addObserver:*(void *)(a1 + 32) selector:sel_handlePlayerInterruption_ name:*MEMORY[0x1E4F16060] object:0];

  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:*(void *)(a1 + 32) selector:sel_playerItemDidReachEnd_ name:*MEMORY[0x1E4F16020] object:0];

  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:*(void *)(a1 + 32) selector:sel__failedToPlayToEndNotification_ name:*MEMORY[0x1E4F16030] object:0];

  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 addObserver:*(void *)(a1 + 32) selector:sel_onChaptersLoaded_ name:@"IMMediaItemDidLoadChaptersNotification" object:0];
}

- (void)dealloc
{
  v3 = [(IMAVPlayer *)self playerItem];
  [(IMAVPlayer *)self stopObservingPlayerItem:v3];

  v4 = [(IMAVPlayer *)self player];
  [(IMAVPlayer *)self stopObservingPlayer:v4];

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(IMAVPlayer *)self removeAllTimeObservers];
  [(IMAVPlayer *)self removePeriodicTimeObservers];
  [(NSTimer *)self->_hdcpTimer invalidate];
  hdcpTimer = self->_hdcpTimer;
  self->_hdcpTimer = 0;

  [(NSTimer *)self->_seekTimer invalidate];
  seekTimer = self->_seekTimer;
  self->_seekTimer = 0;

  v8.receiver = self;
  v8.super_class = (Class)IMAVPlayer;
  [(IMAVPlayer *)&v8 dealloc];
}

+ (id)sharedPlayer
{
  if ([MEMORY[0x1E4F91FC8] isRunningOnHomepod]
    && ([MEMORY[0x1E4F770F0] currentSettings],
        v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 isMultiplayerHost],
        v2,
        v3))
  {
    v4 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_FAULT, "HomePod attempted to access the shared IMAVPlayer", v7, 2u);
    }

    id v5 = 0;
  }
  else
  {
    os_feature_enabled_bluemoon();
    if (sharedPlayer_onceToken != -1) {
      dispatch_once(&sharedPlayer_onceToken, &__block_literal_global_3);
    }
    id v5 = (id)_IMAVPlayer;
  }

  return v5;
}

uint64_t __26__IMAVPlayer_sharedPlayer__block_invoke()
{
  _IMAVPlayer = objc_alloc_init(IMAVPlayer);

  return MEMORY[0x1F41817F8]();
}

- (void)registerAVSessionCategoryAndMode
{
}

- (void)configureAudioSessionAndSetActive:(BOOL)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__IMAVPlayer_configureAudioSessionAndSetActive_withCompletion___block_invoke;
  v8[3] = &unk_1E6E1FAF8;
  BOOL v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(IMAVPlayer *)self _configureAudioSessionWithCompletion:v8];
}

void __63__IMAVPlayer_configureAudioSessionAndSetActive_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!a2)
  {
    v11 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v6 code];
      v13 = [v6 domain];
      id v14 = [v6 userInfo];
      id v15 = [v14 description];
      *(_DWORD *)buf = 134218498;
      uint64_t v27 = v12;
      __int16 v28 = 2112;
      v29 = v13;
      __int16 v30 = 2112;
      v31 = v15;
      v16 = "Error setting AVAudioSession Category to Playback: [%ld %@] %@";
LABEL_8:
      _os_log_impl(&dword_1E3BC5000, v11, OS_LOG_TYPE_ERROR, v16, buf, 0x20u);
    }
LABEL_9:

    char v10 = 0;
    goto LABEL_10;
  }

  id v7 = [*(id *)(a1 + 32) audioSession];
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  id v25 = 0;
  char v9 = [v7 setActive:v8 error:&v25];
  id v6 = v25;

  if ((v9 & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [v6 code];
      v13 = [v6 domain];
      id v14 = [v6 userInfo];
      id v15 = [v14 description];
      *(_DWORD *)buf = 134218498;
      uint64_t v27 = v17;
      __int16 v28 = 2112;
      v29 = v13;
      __int16 v30 = 2112;
      v31 = v15;
      v16 = "Error setting AVAudioSession to Active: [%ld %@] %@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  char v10 = 1;
LABEL_10:
  v18 = objc_opt_class();
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__IMAVPlayer_configureAudioSessionAndSetActive_withCompletion___block_invoke_153;
  v21[3] = &unk_1E6E1FAD0;
  id v19 = *(id *)(a1 + 40);
  char v24 = v10;
  id v22 = v6;
  id v23 = v19;
  id v20 = v6;
  [v18 performOnMainQueue:v21];
}

uint64_t __63__IMAVPlayer_configureAudioSessionAndSetActive_withCompletion___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_configureAudioSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__IMAVPlayer__configureAudioSessionWithCompletion___block_invoke;
  v7[3] = &unk_1E6E1FB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performOnAvSessionQueue:v7];
}

void __51__IMAVPlayer__configureAudioSessionWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x1E4F14F98];
  uint64_t v3 = *MEMORY[0x1E4F15068];
  int v4 = [MEMORY[0x1E4F91FC8] isRunningOnHomepod];
  id v5 = [*(id *)(a1 + 32) audioSession];
  id v6 = v5;
  if (v4)
  {
    uint64_t v13 = 0;
    id v7 = (id *)&v13;
    uint64_t v8 = [v5 setCategory:v2 mode:v3 options:0 error:&v13];
  }
  else
  {
    uint64_t v12 = 0;
    id v7 = (id *)&v12;
    uint64_t v8 = [v5 setCategory:v2 mode:v3 routeSharingPolicy:1 options:0 error:&v12];
  }
  uint64_t v9 = v8;
  id v10 = *v7;

  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v10);
  }
}

- (void)becomeActiveMediaPlayer
{
  id v3 = (id)[MEMORY[0x1E4F319E8] defaultCenter];
  id v4 = (id)[MEMORY[0x1E4F31A10] sharedCommandCenter];
  infoCenter = self->_infoCenter;

  [(MPNowPlayingInfoCenter *)infoCenter becomeActive];
}

- (void)nextMediaItem
{
  id v3 = objc_opt_class();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__IMAVPlayer_nextMediaItem__block_invoke;
  v4[3] = &unk_1E6E1FAA8;
  v4[4] = self;
  [v3 performOnMainQueue:v4];
}

uint64_t __27__IMAVPlayer_nextMediaItem__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "nextMediaItem", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) manifest];
  [v3 next];

  return [*(id *)(a1 + 32) enforceAutoStopForMode:3];
}

- (void)previousMediaItem
{
  id v3 = objc_opt_class();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__IMAVPlayer_previousMediaItem__block_invoke;
  v4[3] = &unk_1E6E1FAA8;
  v4[4] = self;
  [v3 performOnMainQueue:v4];
}

void __31__IMAVPlayer_previousMediaItem__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "previousMediaItem", v4, 2u);
  }

  id v3 = [*(id *)(a1 + 32) manifest];
  [v3 previous];
}

- (void)setManifest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  if (![v7 isEqual:self->_manifest]
    || ([v7 currentItem],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [(IMAVPlayer *)self currentItem],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v9 isEqual:v10],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    if (self->_manifest)
    {
      uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 removeObserver:self name:@"IMPlayerManifestCurrentItemDidChange" object:self->_manifest];
    }
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_ManifestWillChange" userInfo:0];
    objc_storeStrong((id *)&self->_manifest, a3);
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_ManifestDidChange" userInfo:0];
    if (v7)
    {
      uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 addObserver:self selector:sel_manifestCurrentItemDidChange name:@"IMPlayerManifestCurrentItemDidChange" object:self->_manifest];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __37__IMAVPlayer_setManifest_completion___block_invoke;
      v14[3] = &unk_1E6E1FB48;
      id v15 = v8;
      [v7 load:v14];

      goto LABEL_10;
    }
    [(IMAVPlayer *)self setCurrentItem:0];
  }
  if (v8) {
    v8[2](v8);
  }
LABEL_10:
}

uint64_t __37__IMAVPlayer_setManifest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)manifestCurrentItemDidChange
{
  id v4 = [(IMAVPlayer *)self manifest];
  id v3 = [v4 currentItem];
  [(IMAVPlayer *)self setCurrentItem:v3];
}

- (void)setCurrentItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [MEMORY[0x1E4F29060] callStackSymbols];
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_INFO, "setCurrentItem trace: %@", buf, 0xCu);
  }
  id v7 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    currentItem = self->_currentItem;
    *(_DWORD *)buf = 138412546;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = currentItem;
    _os_log_impl(&dword_1E3BC5000, v7, OS_LOG_TYPE_DEFAULT, "setCurrentItem: %@, old: %@", buf, 0x16u);
  }

  uint64_t v9 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v4 title];
    char v11 = [(IMPlayerItem *)self->_currentItem title];
    *(_DWORD *)buf = 138412546;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_DEFAULT, "setCurrentItemTitle: %@, old: %@", buf, 0x16u);
  }
  uint64_t v12 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __29__IMAVPlayer_setCurrentItem___block_invoke;
  v14[3] = &unk_1E6E1FB70;
  void v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  [v12 performOnMainQueue:v14];
}

void __29__IMAVPlayer_setCurrentItem___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 104);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    id v5 = [*(id *)(a1 + 32) currentItem];
    if (v5) {
      [v4 setObject:v5 forKey:@"IMAVPlayerNotificationKey_OldMediaItem"];
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      [v4 setObject:v6 forKey:@"IMAVPlayerNotificationKey_NewMediaItem"];
    }
    BOOL v7 = [*(id *)(a1 + 32) autoStop] == 3;
    uint64_t v8 = [NSNumber numberWithBool:v7];
    [v4 setObject:v8 forKey:@"IMAVPlayerNotificationKey_DidSleepAtAssetEnd"];

    uint64_t v9 = NSNumber;
    [*(id *)(a1 + 32) currentTime];
    *(float *)&double v10 = v10;
    char v11 = [v9 numberWithFloat:v10];
    [v4 setObject:v11 forKey:@"IMAVPlayerNotificationKey_CurrentPlayheadTime"];

    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "state"));
    uint64_t v13 = [*(id *)(a1 + 32) state];
    [v4 setObject:v12 forKey:@"IMAVPlayerNotificationKey_CurrentPlayerState"];
    id v14 = *(void **)(a1 + 32);
    if (v5 && v13 == 1)
    {
      id v15 = [v14 causalityObserver];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = [*(id *)(a1 + 32) causalityObserver];
        [v17 player:*(void *)(a1 + 32) willStopWithReason:2 initiator:1];
      }
      [*(id *)(a1 + 32) _postNotificationName:@"IMMediaPlayerNotification_MediaItemWillChange" userInfo:v4];
      [*(id *)(a1 + 32) _primitiveSetCurrentItem:*(void *)(a1 + 40)];
      [v5 invalidateAsset];
      [*(id *)(a1 + 32) _updatePlayerForCurrentItem];
      __int16 v18 = [*(id *)(a1 + 32) causalityObserver];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        uint64_t v20 = [*(id *)(a1 + 32) causalityObserver];
        [v20 player:*(void *)(a1 + 32) didStopWithReason:2 initiator:1];
      }
    }
    else
    {
      [v14 _postNotificationName:@"IMMediaPlayerNotification_MediaItemWillChange" userInfo:v4];
      [*(id *)(a1 + 32) _primitiveSetCurrentItem:*(void *)(a1 + 40)];
      [v5 invalidateAsset];
      [*(id *)(a1 + 32) _updatePlayerForCurrentItem];
    }
    [*(id *)(a1 + 32) _postNotificationName:@"IMMediaPlayerNotification_MediaItemDidChange" userInfo:v4];
    uint64_t v21 = [*(id *)(a1 + 40) isVideo] ^ 1;
    id v22 = [*(id *)(a1 + 32) commandCenter];
    id v23 = [v22 setPlaybackSessionCommand];
    [v23 setEnabled:v21];

    if (([*(id *)(a1 + 32) delegateFlags] & 0x800) != 0)
    {
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      __int16 v30 = __29__IMAVPlayer_setCurrentItem___block_invoke_2;
      v31 = &unk_1E6E1FB70;
      char v24 = *(void **)(a1 + 40);
      uint64_t v32 = *(void *)(a1 + 32);
      id v33 = v24;
      id v25 = (void (**)(void))_Block_copy(&v28);
      objc_super v26 = objc_msgSend(MEMORY[0x1E4F29060], "currentThread", v28, v29, v30, v31, v32);
      uint64_t v27 = [MEMORY[0x1E4F29060] mainThread];

      if (v26 == v27) {
        v25[2](v25);
      }
      else {
        dispatch_sync(MEMORY[0x1E4F14428], v25);
      }
    }
  }
}

void __29__IMAVPlayer_setCurrentItem___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 player:*(void *)(a1 + 32) currentManifestItemChanged:*(void *)(a1 + 40)];
}

- (void)_primitiveSetCurrentItem:(id)a3
{
}

- (void)setPlayerItem:(id)a3
{
  id v4 = (AVPlayerItem *)a3;
  id v5 = [(IMAVPlayer *)self playerItem];

  if (v5)
  {
    uint64_t v6 = [(IMAVPlayer *)self playerItem];
    [(IMAVPlayer *)self stopObservingPlayerItem:v6];
  }
  playerItem = self->_playerItem;
  self->_playerItem = v4;
}

- (void)_updatePlayerForCurrentItem
{
  id v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "updatePlayerForCurrentItem", (uint8_t *)buf, 2u);
  }

  [(IMAVPlayer *)self setIsUpdatingCurrentTime:0];
  [(IMAVPlayer *)self removePeriodicTimeObservers];
  [(IMAVPlayer *)self removeAllTimeObservers];
  id v4 = [(IMAVPlayer *)self currentItem];

  if (v4)
  {
    id v5 = [(IMAVPlayer *)self currentItem];
    uint64_t v6 = [v5 isVideo];

    [(AVPlayer *)self->_player setAllowsExternalPlayback:v6];
    [(AVPlayer *)self->_player setUsesExternalPlaybackWhileExternalScreenIsActive:v6];
    objc_initWeak(buf, self);
    if ([MEMORY[0x1E4F91FC8] platformSupportsVideo]
      && [(IMAVPlayer *)self providesVideoView])
    {
      BOOL v7 = objc_opt_class();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __41__IMAVPlayer__updatePlayerForCurrentItem__block_invoke;
      v23[3] = &unk_1E6E1FB98;
      v23[4] = self;
      char v25 = v6;
      objc_copyWeak(&v24, buf);
      [v7 performOnMainQueue:v23];
      objc_destroyWeak(&v24);
    }
    uint64_t v8 = (void *)MEMORY[0x1E4F16620];
    uint64_t v9 = [(IMAVPlayer *)self currentItem];
    double v10 = [v9 asset];
    char v11 = [v8 playerItemWithAsset:v10];
    [(IMAVPlayer *)self setPlayerItem:v11];

    uint64_t v12 = [(IMAVPlayer *)self playerItem];
    [v12 setAudioTimePitchAlgorithm:*MEMORY[0x1E4F157C8]];

    [(IMAVPlayer *)self playerItem];
    if (v6) {
      uint64_t v13 = {;
    }
      [v13 setAllowedAudioSpatializationFormats:7];
    }
    else {
      uint64_t v13 = {;
    }
      [v13 setAllowedAudioSpatializationFormats:4];
    }

    id v14 = [(IMAVPlayer *)self currentItem];
    [v14 playhead];
    -[IMAVPlayer setCurrentTime:](self, "setCurrentTime:");

    id v15 = [(IMAVPlayer *)self playerItem];
    [v15 setPreferredForwardBufferDuration:0.0];

    char v16 = [(IMAVPlayer *)self playerItem];
    [v16 setPlaybackLikelyToKeepUpTrigger:1];

    id v17 = [(IMAVPlayer *)self currentItem];
    char v18 = [v17 isPlayable];

    if ((v18 & 1) == 0 && [(IMAVPlayer *)self isPlaybackRequested])
    {
      char v19 = objc_opt_class();
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __41__IMAVPlayer__updatePlayerForCurrentItem__block_invoke_2;
      v22[3] = &unk_1E6E1FAA8;
      v22[4] = self;
      [v19 performOnMainQueue:v22];
    }
    objc_destroyWeak(buf);
  }
  else
  {
    [(IMAVPlayer *)self setPlayerItem:0];
    if ([(IMAVPlayer *)self autoStop]) {
      [(IMAVPlayer *)self enforceAutoStopForMode:[(IMAVPlayer *)self autoStop]];
    }
    [(IMAVPlayer *)self _pause];
  }
  player = self->_player;
  uint64_t v21 = [(IMAVPlayer *)self playerItem];
  [(AVPlayer *)player replaceCurrentItemWithPlayerItem:v21];

  [(IMAVPlayer *)self addPeriodicTimeObservers];
  [(IMAVPlayer *)self updateRateForCurrentState];
  [(IMAVPlayer *)self updateNowPlayingDurationSnapshot];
}

void __41__IMAVPlayer__updatePlayerForCurrentItem__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = [WeakRetained player];
  }
  else
  {
    id v3 = 0;
  }
  id v4 = [*(id *)(a1 + 32) videoViewController];
  [v4 setPlayer:v3];

  if (v2)
  {
  }
}

void __41__IMAVPlayer__updatePlayerForCurrentItem__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) currentItem];
  char v3 = [v2 notifyUserIsNotPlayable];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_DEFAULT, "Pausing: episode is not playable", v12, 2u);
    }

    id v5 = [*(id *)(a1 + 32) causalityObserver];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      BOOL v7 = [*(id *)(a1 + 32) causalityObserver];
      [v7 player:*(void *)(a1 + 32) willStopWithReason:10 initiator:2];
    }
    [*(id *)(a1 + 32) _pause];
    uint64_t v8 = [*(id *)(a1 + 32) causalityObserver];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      double v10 = [*(id *)(a1 + 32) causalityObserver];
      [v10 player:*(void *)(a1 + 32) didStopWithReason:10 initiator:2];
    }
  }
  else
  {
    char v11 = *(void **)(a1 + 32);
    [v11 nextMediaItem];
  }
}

- (void)updateRateForCurrentState
{
}

- (void)updateRateForCurrentState:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__IMAVPlayer_updateRateForCurrentState___block_invoke;
  v7[3] = &unk_1E6E1FB20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performOnMainQueue:v7];
}

void __40__IMAVPlayer_updateRateForCurrentState___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "updateRateForCurrentState", buf, 2u);
  }

  [*(id *)(a1 + 32) cancelFadeOut];
  uint64_t v3 = [*(id *)(a1 + 32) state];
  if (!v3)
  {
    [*(id *)(a1 + 32) cancelSeek];
    [*(id *)(a1 + 32) endBackgroundTask];
    [*(id *)(a1 + 32) _pauseAutoStopTimer];
    [*(id *)(a1 + 32) setRequestedRate:0.0];
LABEL_8:
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
    return;
  }
  if (v3 != 1)
  {
    if (v3 != 2) {
      return;
    }
    [*(id *)(a1 + 32) cancelSeek];
    [*(id *)(a1 + 32) endBackgroundTask];
    [*(id *)(a1 + 32) _pauseAutoStopTimer];
    [*(id *)(a1 + 32) setRequestedRate:0.0];
    [*(id *)(a1 + 32) updateNowPlayingDurationSnapshot];
    goto LABEL_8;
  }
  id v5 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_DEFAULT, "Activate session begin", buf, 2u);
  }

  id v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__IMAVPlayer_updateRateForCurrentState___block_invoke_165;
  v7[3] = &unk_1E6E1FBC0;
  v7[4] = v6;
  id v8 = *(id *)(a1 + 40);
  [v6 configureAudioSessionAndSetActive:1 withCompletion:v7];
}

uint64_t __40__IMAVPlayer_updateRateForCurrentState___block_invoke_165(uint64_t a1, int a2)
{
  uint64_t v4 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_DEFAULT, "Session active", v7, 2u);
  }

  if ([*(id *)(a1 + 32) state] != 1)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  if (a2) {
    [*(id *)(a1 + 32) becomeActiveMediaPlayer];
  }
  [*(id *)(a1 + 32) beginBackgroundTask];
  [*(id *)(a1 + 32) _setupAutoStopTimer];
  [*(id *)(a1 + 32) updateTimeObservers];
  objc_msgSend((id)objc_opt_class(), "rateForPlaybackSpeed:", objc_msgSend(*(id *)(a1 + 32), "playbackSpeed"));
  objc_msgSend(*(id *)(a1 + 32), "setRequestedRate:");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_updateForCurrentRateAndTimeControlStatus
{
  uint64_t v3 = objc_opt_class();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__IMAVPlayer__updateForCurrentRateAndTimeControlStatus__block_invoke;
  v4[3] = &unk_1E6E1FAA8;
  v4[4] = self;
  [v3 performOnMainQueue:v4];
}

uint64_t __55__IMAVPlayer__updateForCurrentRateAndTimeControlStatus__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) player];
    [v3 rate];
    double v5 = v4;
    id v6 = [*(id *)(a1 + 32) player];
    int v24 = 134218240;
    *(double *)char v25 = v5;
    *(_WORD *)&v25[8] = 2048;
    uint64_t v26 = [v6 timeControlStatus];
    _os_log_impl(&dword_1E3BC5000, v2, OS_LOG_TYPE_DEFAULT, "rate changed: %f. timeControlStatus: %lu", (uint8_t *)&v24, 0x16u);
  }
  BOOL v7 = [*(id *)(a1 + 32) player];
  [v7 rate];
  float v9 = fabsf(v8);

  if (v9 < 0.00000011921)
  {
    double v10 = [*(id *)(a1 + 32) playerItem];
    if ([v10 status] != 1
      || ([*(id *)(a1 + 32) isStalled] & 1) != 0
      || [*(id *)(a1 + 32) isAtEnd])
    {
    }
    else
    {
      char v23 = [*(id *)(a1 + 32) wasInterrupted];

      if ((v23 & 1) == 0)
      {
        [*(id *)(a1 + 32) _pause];
        goto LABEL_15;
      }
    }
  }
  char v11 = [*(id *)(a1 + 32) player];
  [v11 rate];
  float v13 = v12;

  id v14 = *(void **)(a1 + 32);
  if (v13 <= 0.00000011921)
  {
    id v15 = [v14 player];
    [v15 rate];
    float v17 = fabsf(v16);

    if (v17 < 0.00000011921)
    {
      char v18 = [MEMORY[0x1E4F91F08] player];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [*(id *)(a1 + 32) isStalled];
        int v20 = [*(id *)(a1 + 32) isAtEnd];
        int v21 = [*(id *)(a1 + 32) wasInterrupted];
        int v24 = 67109632;
        *(_DWORD *)char v25 = v19;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = v20;
        LOWORD(v26) = 1024;
        *(_DWORD *)((char *)&v26 + 2) = v21;
        _os_log_impl(&dword_1E3BC5000, v18, OS_LOG_TYPE_DEFAULT, "rate change to 0 did not result in a pause.  isStalled: %d, isAtEnd: %d, wasInterrupted: %d", (uint8_t *)&v24, 0x14u);
      }
    }
  }
  else if (![v14 state])
  {
    [*(id *)(a1 + 32) play];
  }
LABEL_15:
  [*(id *)(a1 + 32) _postNotificationName:@"IMAVPlayerNotification_RateChanged" userInfo:0];
  return [*(id *)(a1 + 32) updateNowPlayingDurationSnapshot];
}

- (BOOL)nextRemote
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(IMAVPlayer *)self manifest];
  int v4 = [v3 hasNext];

  double v5 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_DEFAULT, "nextRemote", (uint8_t *)&v16, 2u);
  }

  if ([(IMAVPlayer *)self hasChapters])
  {
    id v6 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v7 = [(IMAVPlayer *)self currentChapterIndex];
      float v8 = [(IMAVPlayer *)self currentItem];
      float v9 = [v8 timeChapters];
      uint64_t v10 = [v9 count];
      int v16 = 134218240;
      unint64_t v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1E3BC5000, v6, OS_LOG_TYPE_DEFAULT, "Current Chapter Index: %lu, Chapter Count: %lu", (uint8_t *)&v16, 0x16u);
    }
    unint64_t v11 = [(IMAVPlayer *)self currentChapterIndex];
    float v12 = [(IMAVPlayer *)self currentItem];
    float v13 = [v12 timeChapters];
    unint64_t v14 = [v13 count] - 1;

    if (v11 < v14)
    {
      [(IMAVPlayer *)self nextChapter];
      return 1;
    }
  }
  if (v4)
  {
    [(IMAVPlayer *)self nextMediaItem];
    return 1;
  }
  return 0;
}

- (BOOL)previousRemote
{
  return [(IMAVPlayer *)self previousRemote:0];
}

- (BOOL)previousRemote:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = [(IMAVPlayer *)self manifest];
  int v6 = [v5 hasPrevious];

  unint64_t v7 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.start.value) = 0;
    _os_log_impl(&dword_1E3BC5000, v7, OS_LOG_TYPE_DEFAULT, "previousRemote", (uint8_t *)&buf, 2u);
  }

  memset(&buf, 0, sizeof(buf));
  [(IMAVPlayer *)self _skipToPreviousThreshold];
  CMTimeRange range = buf;
  CMTimeRangeGetEnd(&time, &range);
  double Seconds = CMTimeGetSeconds(&time);
  float v9 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [(IMAVPlayer *)self currentTime];
    CMTimeValue v11 = v10;
    *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
    range.start.epoch = buf.start.epoch;
    *(double *)&CMTimeValue v12 = CMTimeGetSeconds(&range.start);
    LODWORD(range.start.value) = 134218496;
    *(CMTimeValue *)((char *)&range.start.value + 4) = v11;
    LOWORD(range.start.flags) = 2048;
    *(double *)((char *)&range.start.flags + 2) = Seconds;
    HIWORD(range.start.epoch) = 2048;
    range.duration.value = v12;
    _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_DEFAULT, "previousRemote: %f, %f, %f", (uint8_t *)&range, 0x20u);
  }

  if (!a3)
  {
    [(IMAVPlayer *)self currentTime];
    if (v13 > Seconds)
    {
      *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
      range.start.epoch = buf.start.epoch;
      double v14 = CMTimeGetSeconds(&range.start);
      double v15 = 0.0;
      if (v14 >= 0.0)
      {
        *(_OWORD *)&range.start.value = *(_OWORD *)&buf.start.value;
        range.start.epoch = buf.start.epoch;
        double v15 = CMTimeGetSeconds(&range.start);
      }
      [(IMAVPlayer *)self setCurrentTime:v15];
      return 1;
    }
  }
  if ([(IMAVPlayer *)self hasChapters] && [(IMAVPlayer *)self currentChapterIndex])
  {
    [(IMAVPlayer *)self previousChapter];
    return 1;
  }
  if (v6)
  {
    [(IMAVPlayer *)self previousMediaItem];
    return 1;
  }
  return 0;
}

- ($FE7ED0E05F0D31DE1948BDABFA0192D4)_skipToPreviousThreshold
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  if ([(IMAVPlayer *)self hasChapters])
  {
    double v5 = [(IMAVPlayer *)self currentChapter];
    int v6 = v5;
    if (v5) {
      [v5 mediaTimeRange];
    }
    else {
      memset(&v14, 0, sizeof(v14));
    }
    long long v8 = *(_OWORD *)&v14.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v14.start.value;
    *(_OWORD *)&retstr->var0.var3 = v8;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v14.duration.timescale;

    CMTimeMakeWithSeconds(&duration, 4.0, retstr->var1.var1);
    CMTime start = (CMTime)retstr->var0;
    p_CMTime duration = &duration;
  }
  else
  {
    CMTimeMakeWithSeconds(&v11, 4.0, 600);
    CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    p_CMTime duration = &v11;
  }
  uint64_t result = ($FE7ED0E05F0D31DE1948BDABFA0192D4 *)CMTimeRangeMake(&v14, &start, p_duration);
  long long v10 = *(_OWORD *)&v14.start.epoch;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&v14.start.value;
  *(_OWORD *)&retstr->var0.var3 = v10;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&v14.duration.timescale;
  return result;
}

- (void)setCurrentTimeRemote:(double)a3
{
}

- (void)hdcpTimer:(id)a3
{
  int v4 = objc_opt_class();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__IMAVPlayer_hdcpTimer___block_invoke;
  v5[3] = &unk_1E6E1FAA8;
  v5[4] = self;
  [v4 performOnMainQueue:v5];
}

uint64_t __24__IMAVPlayer_hdcpTimer___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPlaybackRequested])
  {
    int v2 = [*(id *)(a1 + 32) player];
    uint64_t v3 = [v2 currentItem];
    int v4 = [v3 _isExternalProtectionRequiredForPlayback];

    if (v4)
    {
      double v5 = [*(id *)(a1 + 32) player];
      uint64_t v6 = [v5 _externalProtectionStatus];

      if (v6)
      {
        [*(id *)(a1 + 32) _pause];
        if (([*(id *)(a1 + 32) delegateFlags] & 2) != 0)
        {
          unint64_t v7 = (void *)MEMORY[0x1E4F28C58];
          long long v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"HDCP error", *MEMORY[0x1E4F28568], 0);
          float v9 = [v7 errorWithDomain:@"IMAVPlayer" code:-1 userInfo:v8];

          long long v10 = [*(id *)(a1 + 32) delegate];
          [v10 playerErrorDidOccur:*(void *)(a1 + 32) error:v9];
        }
      }
    }
  }
  uint64_t result = [*(id *)(a1 + 32) shouldEnforceHDCP];
  if (result)
  {
    CMTimeValue v12 = *(void **)(a1 + 32);
    return [v12 setShouldEnforceHDCP:1];
  }
  return result;
}

- (void)setShouldEnforceHDCP:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSTimer *)self->_hdcpTimer invalidate];
  hdcpTimer = self->_hdcpTimer;
  self->_hdcpTimer = 0;

  if (v3)
  {
    self->_hdcpTimer = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_hdcpTimer_ selector:0 userInfo:0 repeats:3.0];
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)shouldEnforceHDCP
{
  return self->_hdcpTimer != 0;
}

- (void)setRequestedRate:(float)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(IMAVPlayer *)self isScanning])
  {
    [(IMAVPlayer *)self scanRate];
    a3 = v5;
  }
  else if (self->_seekTimer && self->_seekForward)
  {
    a3 = 2.0;
  }
  uint64_t v6 = [(IMAVPlayer *)self player];
  [v6 rate];
  float v8 = v7;

  if (v8 != a3)
  {
    float v9 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [(IMAVPlayer *)self player];
      [v10 rate];
      int v14 = 134218240;
      double v15 = a3;
      __int16 v16 = 2048;
      double v17 = v11;
      _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_DEFAULT, "setRate: %f, old: %f", (uint8_t *)&v14, 0x16u);
    }
    CMTimeValue v12 = [(IMAVPlayer *)self player];
    *(float *)&double v13 = a3;
    [v12 setRate:v13];
  }
}

- (float)requestedRate
{
  [(AVPlayer *)self->_player rate];
  return result;
}

- (float)volume
{
  if (self->_fadeOutTimer || [(IMAVPlayer *)self isScanning])
  {
    [(IMAVPlayer *)self storedVolume];
  }
  else
  {
    player = self->_player;
    [(AVPlayer *)player volume];
  }
  return result;
}

- (void)setVolume:(float)a3
{
  if (a3 >= 1.0)
  {
    if (a3 > 1.0) {
      a3 = 1.0;
    }
    if (a3 >= 0.0) {
      float v4 = a3;
    }
    else {
      float v4 = 0.0;
    }
    *(float *)&double v5 = v4;
    [(AVPlayer *)self->_player setVolume:v5];
    uint64_t v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    *(float *)&double v7 = v4;
    [v6 setFloat:@"IMAVPlayerVolumeUserDefaultKey" forKey:v7];

    id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v8 setBool:1 forKey:@"IMAVPlayerHasStoredVolumeDefaultKey"];
  }
}

- (float)storedVolume
{
  int v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"IMAVPlayerHasStoredVolumeDefaultKey"];

  if (!v3) {
    return 1.0;
  }
  float v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 floatForKey:@"IMAVPlayerVolumeUserDefaultKey"];
  float v6 = v5;

  return v6;
}

- (float)actualRate
{
  if ([(AVPlayer *)self->_player timeControlStatus] != AVPlayerTimeControlStatusPlaying) {
    return 0.0;
  }
  player = self->_player;

  [(AVPlayer *)player rate];
  return result;
}

- (void)setPlaybackSpeed:(unint64_t)a3
{
  unint64_t playbackSpeed = self->_playbackSpeed;
  self->_unint64_t playbackSpeed = a3;
  float v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 setInteger:a3 forKey:@"IMAVPlayerPlaybackSpeedUserDefaultKey"];

  if ([(IMAVPlayer *)self wasInterrupted])
  {
    [(IMAVPlayer *)self play];
  }
  else
  {
    [(IMAVPlayer *)self updateRateForCurrentState];
    if (playbackSpeed != a3 && ![(IMAVPlayer *)self state]) {
      [(IMAVPlayer *)self updateNowPlayingDurationSnapshot];
    }
  }
  [(id)objc_opt_class() rateForPlaybackSpeed:a3];
  int v8 = v7;
  float v9 = [(IMAVPlayer *)self player];
  LODWORD(v10) = v8;
  [v9 setDefaultRate:v10];

  [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_PlaybackSpeedChanged" userInfo:0];
}

+ (float)rateForPlaybackSpeed:(unint64_t)a3
{
  float result = 0.0;
  if (a3 <= 5) {
    return flt_1E3E85198[a3];
  }
  return result;
}

+ (unint64_t)playbackSpeedForRate:(float)a3
{
  if (a3 <= 0.75) {
    return 1;
  }
  unint64_t v3 = 4;
  uint64_t v4 = 2;
  uint64_t v5 = 3;
  if (a3 < 2.0) {
    uint64_t v5 = 5;
  }
  if (a3 >= 1.75) {
    uint64_t v4 = v5;
  }
  if (a3 >= 1.5) {
    unint64_t v3 = v4;
  }
  if (a3 >= 1.25) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (id)avPlaybackSpeedForSpeed:(unint64_t)a3
{
  [(id)objc_opt_class() rateForPlaybackSpeed:a3];
  int v4 = v3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v5 setMaximumFractionDigits:2];
  [v5 setMinimumFractionDigits:0];
  [v5 setNumberStyle:1];
  LODWORD(v6) = v4;
  int v7 = [NSNumber numberWithFloat:v6];
  int v8 = [v5 stringFromNumber:v7];

  float v9 = NSString;
  double v10 = [MEMORY[0x1E4F28B50] mainBundle];
  float v11 = [v10 localizedStringForKey:@"MENU_PLAYBACK_SPEED" value:&stru_1F3F553C0 table:0];
  CMTimeValue v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);

  id v13 = objc_alloc(MEMORY[0x1E4F16740]);
  LODWORD(v14) = v4;
  double v15 = (void *)[v13 initWithRate:v12 localizedName:v14];

  return v15;
}

+ (NSArray)availableSpeeds
{
  v10[6] = *MEMORY[0x1E4F143B8];
  int v2 = [(id)objc_opt_class() avPlaybackSpeedForSpeed:1];
  v10[0] = v2;
  int v3 = [(id)objc_opt_class() avPlaybackSpeedForSpeed:0];
  v10[1] = v3;
  int v4 = [(id)objc_opt_class() avPlaybackSpeedForSpeed:4];
  v10[2] = v4;
  id v5 = [(id)objc_opt_class() avPlaybackSpeedForSpeed:2];
  v10[3] = v5;
  double v6 = [(id)objc_opt_class() avPlaybackSpeedForSpeed:5];
  v10[4] = v6;
  int v7 = [(id)objc_opt_class() avPlaybackSpeedForSpeed:3];
  v10[5] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return (NSArray *)v8;
}

+ (unint64_t)incrementPlaybackSpeed:(unint64_t)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return qword_1E3E851B0[a3];
  }
}

+ (unint64_t)decrementPlaybackSpeed:(unint64_t)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return qword_1E3E851E0[a3];
  }
}

+ (BOOL)isMaxSpeed:(unint64_t)a3
{
  return a3 == 3;
}

+ (BOOL)isMinSpeed:(unint64_t)a3
{
  return a3 == 1;
}

- (BOOL)play
{
  BOOL v3 = [(IMAVPlayer *)self _validatePlay];
  if (v3) {
    [(IMAVPlayer *)self setState:1];
  }
  return v3;
}

- (void)play:(id)a3 interruptionEvent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 && !self->_stateChangeInterruptionFlag)
  {
    float v9 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_DEFAULT, "Dropping play command because it was the result of an interruption event", (uint8_t *)&location, 2u);
    }

    double v10 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__IMAVPlayer_play_interruptionEvent___block_invoke;
    v18[3] = &unk_1E6E1FB48;
    id v19 = v6;
    [v10 performOnMainQueue:v18];
    int v8 = v19;
    goto LABEL_10;
  }
  if (![(IMAVPlayer *)self _validatePlay])
  {
    if (!v6) {
      goto LABEL_11;
    }
    [(IMAVPlayer *)self setStateChangeInterruptionFlag:v4];
    int v7 = objc_opt_class();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__IMAVPlayer_play_interruptionEvent___block_invoke_3;
    v11[3] = &unk_1E6E1FB48;
    id v12 = v6;
    [v7 performOnMainQueue:v11];
    int v8 = v12;
LABEL_10:

    goto LABEL_11;
  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__IMAVPlayer_play_interruptionEvent___block_invoke_2;
  v13[3] = &unk_1E6E1FBE8;
  objc_copyWeak(&v15, &location);
  BOOL v16 = v4;
  id v14 = v6;
  [(IMAVPlayer *)self setState:1 additionalUserInfo:0 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
LABEL_11:
}

uint64_t __37__IMAVPlayer_play_interruptionEvent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37__IMAVPlayer_play_interruptionEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setStateChangeInterruptionFlag:v2];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __37__IMAVPlayer_play_interruptionEvent___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_validatePlay
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMAVPlayer *)self currentItem];
  char v4 = [v3 isPlayable];

  if (v4)
  {
    id v5 = [(IMAVPlayer *)self currentItem];
    id v6 = [v5 asset];
    int v7 = [(IMAVPlayer *)self playerItem];
    int v8 = [v7 asset];

    if (v6 != v8) {
      [(IMAVPlayer *)self _updatePlayerForCurrentItem];
    }
    float v9 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_DEFAULT, "play", buf, 2u);
    }
  }
  else
  {
    double v10 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      float v11 = [(IMAVPlayer *)self currentItem];
      id v12 = [v11 title];
      id v13 = [(IMAVPlayer *)self currentItem];
      id v14 = &stru_1F3F553C0;
      if (!v13) {
        id v14 = @" - currentItem is nil";
      }
      *(_DWORD *)CMTimeRange buf = 138412546;
      id v19 = v12;
      __int16 v20 = 2112;
      int v21 = v14;
      _os_log_impl(&dword_1E3BC5000, v10, OS_LOG_TYPE_ERROR, "play validation failed for %@%@", buf, 0x16u);
    }
    id v15 = objc_opt_class();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __27__IMAVPlayer__validatePlay__block_invoke;
    v17[3] = &unk_1E6E1FAA8;
    v17[4] = self;
    [v15 performOnMainQueue:v17];
    float v9 = [(IMAVPlayer *)self currentItem];
    [v9 invalidateAsset];
  }

  return v4;
}

void __27__IMAVPlayer__validatePlay__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentItem];
  [v1 notifyUserIsNotPlayable];
}

- (BOOL)pauseWithInitiator:(unint64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__IMAVPlayer_pauseWithInitiator___block_invoke;
  v4[3] = &unk_1E6E1FC10;
  v4[4] = self;
  return [(IMAVPlayer *)self _stopWithReason:3 initiator:a3 stopBlock:v4];
}

uint64_t __33__IMAVPlayer_pauseWithInitiator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pause];
}

- (BOOL)pauseWithInitiator:(unint64_t)a3 interruptionEvent:(BOOL)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__IMAVPlayer_pauseWithInitiator_interruptionEvent___block_invoke;
  v5[3] = &unk_1E6E1FC38;
  v5[4] = self;
  BOOL v6 = a4;
  return [(IMAVPlayer *)self _stopWithReason:3 initiator:a3 stopBlock:v5];
}

uint64_t __51__IMAVPlayer_pauseWithInitiator_interruptionEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pause:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__IMAVPlayer_stopWithReason_initiator___block_invoke;
  v5[3] = &unk_1E6E1FC10;
  v5[4] = self;
  return [(IMAVPlayer *)self _stopWithReason:a3 initiator:a4 stopBlock:v5];
}

uint64_t __39__IMAVPlayer_stopWithReason_initiator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

- (BOOL)_stopWithReason:(unint64_t)a3 initiator:(unint64_t)a4 stopBlock:(id)a5
{
  int v8 = (uint64_t (**)(void))a5;
  float v9 = [(IMAVPlayer *)self causalityObserver];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    float v11 = [(IMAVPlayer *)self causalityObserver];
    [v11 player:self willStopWithReason:a3 initiator:a4];
  }
  int v12 = v8[2](v8);
  if (v12)
  {
    id v13 = [(IMAVPlayer *)self causalityObserver];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = [(IMAVPlayer *)self causalityObserver];
      [v15 player:self didStopWithReason:a3 initiator:a4];
LABEL_8:

      goto LABEL_9;
    }
  }
  BOOL v16 = [(IMAVPlayer *)self causalityObserver];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v15 = [(IMAVPlayer *)self causalityObserver];
    [v15 player:self failedToStopWithReason:a3 initiator:a4];
    goto LABEL_8;
  }
LABEL_9:

  return v12;
}

- (BOOL)pause
{
  BOOL v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "pause", v5, 2u);
  }

  [(IMAVPlayer *)self setWasInterruptedEarly:0];
  return [(IMAVPlayer *)self _pause];
}

- (BOOL)_pause
{
  if ([(IMAVPlayer *)self state] != 2) {
    [(IMAVPlayer *)self setState:0];
  }
  return 1;
}

- (BOOL)_pause:(BOOL)a3
{
  if (a3 && !self->_stateChangeInterruptionFlag)
  {
    BOOL v6 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1E3BC5000, v6, OS_LOG_TYPE_DEFAULT, "Dropping pause command because it was the result of an interruption event", v7, 2u);
    }

    BOOL result = 0;
  }
  else
  {
    BOOL result = [(IMAVPlayer *)self pause];
  }
  self->_stateChangeInterruptionFlag = a3;
  return result;
}

- (BOOL)stop
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "stop", v8, 2u);
  }

  float v9 = @"IMAVPlayerNotificationKey_OldPlayheadTime";
  double currentTime = self->_currentTime;
  *(float *)&double currentTime = currentTime;
  id v5 = [NSNumber numberWithFloat:currentTime];
  v10[0] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  [(IMAVPlayer *)self setCurrentTime:0.0];
  [(IMAVPlayer *)self setState:2 additionalUserInfo:v6 completion:0];

  return 1;
}

- (BOOL)togglePlayPause
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(IMAVPlayer *)self isPlaybackRequested];
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "togglePlayPause: %d", (uint8_t *)v5, 8u);
  }

  if ([(IMAVPlayer *)self isPlaybackRequested]) {
    return [(IMAVPlayer *)self pause];
  }
  else {
    return [(IMAVPlayer *)self play];
  }
}

- (void)toggleVideoAspectScaleMode
{
  BOOL v3 = [(IMAVPlayer *)self videoScale] == 0;

  [(IMAVPlayer *)self setVideoScale:v3];
}

- (void)sleep
{
  BOOL v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "sleep", buf, 2u);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __19__IMAVPlayer_sleep__block_invoke;
  v4[3] = &unk_1E6E1FAA8;
  v4[4] = self;
  [(IMAVPlayer *)self fadeOutWithDuration:v4 completion:2.0];
}

uint64_t __19__IMAVPlayer_sleep__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pauseWithInitiator:2];
}

- (void)fadeOut
{
}

- (void)fadeOutWithDuration:(double)a3
{
}

- (void)fadeOutWithDuration:(double)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(void))a4;
  int v7 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1E3BC5000, v7, OS_LOG_TYPE_DEFAULT, "fadeOutWithDuration: %f", (uint8_t *)&buf, 0xCu);
  }

  if (self->_fadeOutTimer)
  {
    int v8 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1E3BC5000, v8, OS_LOG_TYPE_DEFAULT, "fadeOutWithDuration: skipping!", (uint8_t *)&buf, 2u);
    }

    goto LABEL_16;
  }
  float v9 = [(AVPlayer *)self->_player currentItem];
  if (v9 && [(IMAVPlayer *)self isPlaybackActive])
  {

    if (a3 > 2.22044605e-16)
    {
      char v10 = [MEMORY[0x1E4F91F08] player];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1E3BC5000, v10, OS_LOG_TYPE_DEFAULT, "fadeOutWithDuration: starting!", (uint8_t *)&buf, 2u);
      }

      float v11 = 0.05 / a3;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v23 = 0x2020000000;
      int v24 = 0;
      int v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      fadeOutTimer = self->_fadeOutTimer;
      self->_fadeOutTimer = v12;

      dispatch_source_set_timer((dispatch_source_t)self->_fadeOutTimer, 0, 0x2FAF080uLL, 0);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __45__IMAVPlayer_fadeOutWithDuration_completion___block_invoke;
      aBlock[3] = &unk_1E6E1FC60;
      float v20 = v11;
      aBlock[4] = self;
      p_long long buf = &buf;
      unsigned int v21 = vcvtps_s32_f32(1.0 / v11);
      uint64_t v18 = v6;
      char v14 = _Block_copy(aBlock);
      dispatch_source_set_event_handler((dispatch_source_t)self->_fadeOutTimer, v14);
      id v15 = self->_fadeOutTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __45__IMAVPlayer_fadeOutWithDuration_completion___block_invoke_2;
      handler[3] = &unk_1E6E1FAA8;
      handler[4] = self;
      dispatch_source_set_cancel_handler(v15, handler);
      dispatch_resume((dispatch_object_t)self->_fadeOutTimer);

      _Block_object_dispose(&buf, 8);
      goto LABEL_16;
    }
  }
  else
  {
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_16:
}

void __45__IMAVPlayer_fadeOutWithDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) player];
  [v2 volume];
  float v4 = v3;

  float v5 = v4 - *(float *)(a1 + 56);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v5 <= 0.00000011921 || *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(_DWORD *)(a1 + 60))
  {
    int v7 = [*(id *)(a1 + 32) player];
    [v7 setVolume:0.0];

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(void))(v8 + 16))();
    }
    float v9 = *(void **)(a1 + 32);
    [v9 cancelFadeOut];
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) player];
    *(float *)&double v6 = v5;
    [v10 setVolume:v6];
  }
}

void __45__IMAVPlayer_fadeOutWithDuration_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) player];
  LODWORD(v1) = 1.0;
  [v2 setVolume:v1];
}

- (void)cancelFadeOut
{
  fadeOutTimer = self->_fadeOutTimer;
  if (fadeOutTimer)
  {
    dispatch_source_cancel(fadeOutTimer);
    float v4 = self->_fadeOutTimer;
    self->_fadeOutTimer = 0;
  }
}

- (void)setState:(unint64_t)a3
{
}

- (void)setState:(unint64_t)a3 additionalUserInfo:(id)a4 completion:(id)a5
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  float v9 = (void (**)(id, void))a5;
  unint64_t state = self->_state;
  if (state != a3)
  {
    v23[0] = @"IMAVPlayerNotificationKey_CurrentPlayheadTime";
    double currentTime = self->_currentTime;
    *(float *)&double currentTime = currentTime;
    int v12 = [NSNumber numberWithFloat:currentTime];
    v24[0] = v12;
    v23[1] = @"IMAVPlayerNotificationKey_OldPlayerState";
    id v13 = [NSNumber numberWithUnsignedInteger:self->_state];
    v24[1] = v13;
    v23[2] = @"IMAVPlayerNotificationKey_NewPlayerState";
    char v14 = [NSNumber numberWithUnsignedInteger:a3];
    v24[2] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    BOOL v16 = (void *)[v15 mutableCopy];

    char v17 = [(IMAVPlayer *)self currentItem];

    if (v17)
    {
      uint64_t v18 = [(IMAVPlayer *)self currentItem];
      [v16 setObject:v18 forKey:@"IMAVPlayerNotificationKey_CurrentMediaItem"];
    }
    if (v8) {
      [v16 addEntriesFromDictionary:v8];
    }
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_StateWillChange" userInfo:v16];
    self->_unint64_t state = a3;
    id v19 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 134217984;
      unint64_t v22 = a3;
      _os_log_impl(&dword_1E3BC5000, v19, OS_LOG_TYPE_DEFAULT, "setState %lu", (uint8_t *)&v21, 0xCu);
    }

    if (*(_WORD *)&self->_delegateFlags)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained playerStateChanged:self];
    }
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_StateDidChange" userInfo:v16];
    [(IMAVPlayer *)self updateRateForCurrentState:v9];
  }
  [(IMAVPlayer *)self scanWithRate:0.0];
  [(IMAVPlayer *)self setWasInterrupted:0];
  [(IMAVPlayer *)self setCurrentInterruptionTime:0.0];
  [(IMAVPlayer *)self setStateChangeInterruptionFlag:0];
  if (v9 && state == a3) {
    v9[2](v9, 0);
  }
}

- (unint64_t)loadState
{
  id v2 = [(IMAVPlayer *)self player];
  uint64_t v3 = [v2 timeControlStatus];

  unint64_t v4 = 2;
  if (!v3) {
    unint64_t v4 = 3;
  }
  if (v3 == 2) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)isStalled
{
  return [(IMAVPlayer *)self loadState] == 2;
}

- (BOOL)isAtEnd
{
  [(IMAVPlayer *)self duration];
  double v4 = v3;
  [(IMAVPlayer *)self currentTime];
  return v4 - v5 < 0.5;
}

- (BOOL)isPlaybackRequested
{
  return [(IMAVPlayer *)self state] == 1;
}

- (BOOL)isPlaybackActive
{
  [(IMAVPlayer *)self actualRate];
  return v2 > 0.00000011921;
}

- (void)setWasInterrupted:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_wasInterrupted != a3)
  {
    BOOL v3 = a3;
    double v5 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_DEFAULT, "setWasInterrupted: %d", (uint8_t *)v6, 8u);
    }

    self->_wasInterrupted = v3;
    [(IMAVPlayer *)self updateInfoCenterPlaybackState];
  }
}

- (void)setWasInterruptedEarly:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_wasInterruptedEarly != a3)
  {
    BOOL v3 = a3;
    double v5 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_DEFAULT, "setWasInterruptedEarly: %d", (uint8_t *)v6, 8u);
    }

    self->_wasInterruptedEarly = v3;
    [(IMAVPlayer *)self updateInfoCenterPlaybackState];
  }
}

- (void)beginBackgroundTask
{
  if (!self->_backgroundTask)
  {
    BOOL v3 = objc_opt_class();
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __33__IMAVPlayer_beginBackgroundTask__block_invoke;
    v4[3] = &unk_1E6E1FAA8;
    v4[4] = self;
    [v3 performOnMainQueue:v4];
  }
  IMEnsureCanInitiatePlaybackInBackground();
}

void __33__IMAVPlayer_beginBackgroundTask__block_invoke(uint64_t a1)
{
  if (![*(id *)(a1 + 32) backgroundTask])
  {
    float v2 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v2 backgroundTimeRemaining];
    double v4 = v3;

    if (v4 > 1.0)
    {
      double v5 = [MEMORY[0x1E4FB1438] sharedApplication];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __33__IMAVPlayer_beginBackgroundTask__block_invoke_2;
      v8[3] = &unk_1E6E1FAA8;
      v8[4] = *(void *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 32), "setBackgroundTask:", objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", @"IMAVPlayer", v8));

      double v6 = [MEMORY[0x1E4F91F08] player];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1E3BC5000, v6, OS_LOG_TYPE_DEFAULT, "beginBackgroundTask", v7, 2u);
      }
    }
  }
}

uint64_t __33__IMAVPlayer_beginBackgroundTask__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endBackgroundTask];
}

- (void)endBackgroundTask
{
  if (self->_backgroundTask)
  {
    double v3 = objc_opt_class();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __31__IMAVPlayer_endBackgroundTask__block_invoke;
    v6[3] = &unk_1E6E1FAA8;
    v6[4] = self;
    [v3 performOnMainQueue:v6];
    double v4 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_DEFAULT, "endBackgroundTask", v5, 2u);
    }
  }
}

uint64_t __31__IMAVPlayer_endBackgroundTask__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) backgroundTask];
  if (result)
  {
    double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v3, "endBackgroundTask:", objc_msgSend(*(id *)(a1 + 32), "backgroundTask"));

    double v4 = *(void **)(a1 + 32);
    return [v4 setBackgroundTask:0];
  }
  return result;
}

- (id)stillFrameAt:(double)a3 maxSize:(CGSize)a4 scale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  float v9 = (void *)MEMORY[0x1E4F16368];
  id v10 = [(IMAVPlayer *)self currentItem];
  float v11 = [v10 asset];
  int v12 = [v9 assetImageGeneratorWithAsset:v11];

  if (a5 < 1.0)
  {
    id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v13 scale];
    a5 = v14;
  }
  objc_msgSend(v12, "setMaximumSize:", width * a5, height * a5);
  long long v31 = *MEMORY[0x1E4F1FA10];
  long long v26 = v31;
  uint64_t v32 = *(void *)(MEMORY[0x1E4F1FA10] + 16);
  uint64_t v15 = v32;
  [v12 setRequestedTimeToleranceBefore:&v31];
  long long v29 = v26;
  uint64_t v30 = v15;
  [v12 setRequestedTimeToleranceAfter:&v29];
  CMTimeMakeWithSeconds(&v28, a3, 1000000000);
  id v27 = 0;
  BOOL v16 = (CGImage *)[v12 copyCGImageAtTime:&v28 actualTime:0 error:&v27];
  id v17 = v27;
  uint64_t v18 = v17;
  if (v17)
  {
    id v19 = [v17 localizedDescription];
    NSLog(&cfstr_ImavplayerStil.isa, v19);

    float v20 = 0;
  }
  else
  {
    int v21 = (void *)MEMORY[0x1E4FB1818];
    unint64_t v22 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v22 scale];
    double v24 = v23;

    float v20 = [v21 imageWithCGImage:v16 scale:0 orientation:v24];
  }
  CGImageRelease(v16);

  return v20;
}

- (BOOL)airplayVideoActive
{
  BOOL v3 = [(AVPlayer *)self->_player isExternalPlaybackActive];
  if (v3) {
    LOBYTE(v3) = [(AVPlayer *)self->_player externalPlaybackType] == 1;
  }
  return v3;
}

- (void)handlePlayerInterruption:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(IMAVPlayer *)self setWasInterruptedEarly:[(IMAVPlayer *)self isPlaybackRequested]];
  double v4 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = [(IMAVPlayer *)self wasInterruptedEarly];
    _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_DEFAULT, "didHandlePlayerInterruption, wasInterruptedEarly %d", (uint8_t *)v5, 8u);
  }
}

- (void)handleAudioSessionInterruption:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4F15020]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F15008]];
  uint64_t v8 = [v7 unsignedIntegerValue];

  BOOL v9 = [(IMAVPlayer *)self isPlaybackRequested];
  id v10 = [v4 objectForKey:*MEMORY[0x1E4F15010]];
  uint64_t v11 = [v10 unsignedIntegerValue];

  if (v11 == 1)
  {
    int v12 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 67109632;
      *(_DWORD *)CMTime v28 = v9;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = [(IMAVPlayer *)self wasInterrupted];
      *(_WORD *)long long v29 = 1024;
      *(_DWORD *)&v29[2] = [(IMAVPlayer *)self wasInterruptedEarly];
      _os_log_impl(&dword_1E3BC5000, v12, OS_LOG_TYPE_DEFAULT, "ignoring wasSuspended interruption, wasPlaying: %d, wasInterrupted: %d, wasInterruptedEarly: %d", (uint8_t *)&v27, 0x14u);
    }
  }
  else if (v6)
  {
    if (v6 == 1)
    {
      id v13 = [MEMORY[0x1E4F91F08] player];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v27 = 67109376;
        *(_DWORD *)CMTime v28 = v9;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = [(IMAVPlayer *)self wasInterruptedEarly];
        _os_log_impl(&dword_1E3BC5000, v13, OS_LOG_TYPE_DEFAULT, "handleInterruption began, wasPlaying %d, wasInterruptedEarly %d", (uint8_t *)&v27, 0xEu);
      }

      [(IMAVPlayer *)self _pause];
      BOOL v14 = v9 || [(IMAVPlayer *)self wasInterruptedEarly];
      [(IMAVPlayer *)self setWasInterrupted:v14];
      [(IMAVPlayer *)self currentTime];
      -[IMAVPlayer setCurrentInterruptionTime:](self, "setCurrentInterruptionTime:");
      [(IMAVPlayer *)self setWasInterruptedEarly:0];
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 134218496;
      *(void *)CMTime v28 = v8;
      *(_WORD *)&v28[8] = 1024;
      *(_DWORD *)long long v29 = [(IMAVPlayer *)self wasInterrupted];
      *(_WORD *)&v29[4] = 1024;
      int v30 = v8 & 1;
      _os_log_impl(&dword_1E3BC5000, v15, OS_LOG_TYPE_DEFAULT, "handleInterruption ended: %lu wasInterrupted: %d resumable: %d", (uint8_t *)&v27, 0x18u);
    }

    if ((v8 & 1) != 0 && [(IMAVPlayer *)self wasInterrupted])
    {
      [(IMAVPlayer *)self currentTime];
      double v17 = v16;
      [(IMAVPlayer *)self currentInterruptionTime];
      if (v17 == v18)
      {
        [(IMAVPlayer *)self currentTime];
        if (v19 >= 3.0)
        {
          [(IMAVPlayer *)self currentTime];
          double v21 = v20;
          [(IMAVPlayer *)self previousInterruptionTime];
          if (v21 < v22 + -3.0
            || ([(IMAVPlayer *)self currentTime],
                double v24 = v23,
                [(IMAVPlayer *)self previousInterruptionTime],
                v24 > v25 + 3.0))
          {
            [(IMAVPlayer *)self currentTime];
            -[IMAVPlayer setPreviousInterruptionTime:](self, "setPreviousInterruptionTime:");
            [(IMAVPlayer *)self currentTime];
            [(IMAVPlayer *)self setCurrentTime:v26 + -3.0];
          }
        }
      }
      [(IMAVPlayer *)self play];
    }
    [(IMAVPlayer *)self setWasInterrupted:0];
    [(IMAVPlayer *)self setCurrentInterruptionTime:0.0];
  }
}

- (void)onRouteChange:(id)a3
{
  double v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4F15178]];

  if ([v5 integerValue] == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1E3BC5000, v6, OS_LOG_TYPE_DEFAULT, "route change: old device unavailable", buf, 2u);
    }

    BOOL v7 = [(IMAVPlayer *)self wasInterrupted];
    uint64_t v8 = [MEMORY[0x1E4F91F08] player];
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1E3BC5000, v8, OS_LOG_TYPE_DEFAULT, "next endInterruption should NOT be resumable", buf, 2u);
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1E3BC5000, v8, OS_LOG_TYPE_DEFAULT, "pausing: old device is unavailable", buf, 2u);
      }

      id v10 = objc_opt_class();
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __28__IMAVPlayer_onRouteChange___block_invoke;
      v11[3] = &unk_1E6E1FAA8;
      void v11[4] = self;
      [v10 performOnMainQueue:v11];
    }
  }
}

uint64_t __28__IMAVPlayer_onRouteChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pause];
}

- (void)_createPlayer
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F16608]);
  [(IMAVPlayer *)self setPlayer:v3];

  double v4 = [(IMAVPlayer *)self audioSession];

  if (v4)
  {
    double v5 = [(IMAVPlayer *)self audioSession];
    uint64_t v6 = [(IMAVPlayer *)self player];
    [v6 setAudioSession:v5];
  }
  id v7 = [(IMAVPlayer *)self player];
  [v7 setActionAtItemEnd:2];
}

- (void)setPlayer:(id)a3
{
  double v5 = (AVPlayer *)a3;
  if (self->_player != v5)
  {
    id v7 = v5;
    [(IMAVPlayer *)self willChangeValueForKey:@"player"];
    if (self->_player)
    {
      -[IMAVPlayer stopObservingPlayer:](self, "stopObservingPlayer:");
      [(IMAVPlayer *)self setPlayerItem:0];
    }
    [(IMAVPlayer *)self removePeriodicTimeObservers];
    [(IMAVPlayer *)self clearTimeObservers];
    objc_storeStrong((id *)&self->_player, a3);
    player = self->_player;
    if (player)
    {
      [(AVPlayer *)player setAppliesMediaSelectionCriteriaAutomatically:1];
      [(AVPlayer *)self->_player setAudiovisualBackgroundPlaybackPolicy:3];
      if ([MEMORY[0x1E4F91FC8] platformSupportsVideo]) {
        [(AVPlayer *)self->_player addObserver:self forKeyPath:@"externalPlaybackActive" options:4 context:0];
      }
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"currentItem" options:6 context:0];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"rate" options:6 context:0];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"timeControlStatus" options:6 context:0];
      [(AVPlayer *)self->_player addObserver:self forKeyPath:@"volume" options:6 context:0];
    }
    [(IMAVPlayer *)self didChangeValueForKey:@"player"];
    double v5 = v7;
  }
}

- (void)stopObservingPlayerItem:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self forKeyPath:@"status"];
  [v4 removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
  [v4 removeObserver:self forKeyPath:@"playbackBufferEmpty"];
  [v4 removeObserver:self forKeyPath:@"loadedTimeRanges"];
  [v4 removeObserver:self forKeyPath:@"presentationSize"];
}

- (void)stopObservingPlayer:(id)a3
{
  id v4 = a3;
  [v4 removeObserver:self forKeyPath:@"currentItem" context:0];
  [v4 removeObserver:self forKeyPath:@"rate" context:0];
  [v4 removeObserver:self forKeyPath:@"timeControlStatus" context:0];
  [v4 removeObserver:self forKeyPath:@"volume" context:0];
  if ([MEMORY[0x1E4F91FC8] platformSupportsVideo]) {
    [v4 removeObserver:self forKeyPath:@"externalPlaybackActive" context:0];
  }
}

- (void)resetPlayer:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F91F08], "player", a3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_ERROR, "resetPlayer!", buf, 2u);
  }

  double v5 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  _DWORD v6[2] = __26__IMAVPlayer_resetPlayer___block_invoke;
  v6[3] = &unk_1E6E1FAA8;
  v6[4] = self;
  [v5 performOnMainQueue:v6];
}

uint64_t __26__IMAVPlayer_resetPlayer___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _postNotificationName:@"IMAVPlayerNotification_MediaServicesWillReset" userInfo:0];
  [*(id *)(a1 + 32) setPlayer:0];
  float v2 = [*(id *)(a1 + 32) currentItem];
  [v2 reset];

  [*(id *)(a1 + 32) _pause];
  [*(id *)(a1 + 32) _createPlayer];
  [*(id *)(a1 + 32) _updatePlayerForCurrentItem];
  [*(id *)(a1 + 32) currentTime];
  [*(id *)(a1 + 32) setCurrentTime:v3 + -1.0];
  id v4 = *(void **)(a1 + 32);

  return [v4 _postNotificationName:@"IMAVPlayerNotification_MediaServicesDidReset" userInfo:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"currentItem"])
  {
    id v13 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [(AVPlayer *)self->_player currentItem];
      uint64_t v15 = [(IMAVPlayer *)self currentItem];
      double v16 = [v15 title];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v101 = (uint64_t)v14;
      __int16 v102 = 2112;
      uint64_t v103 = (uint64_t)v16;
      _os_log_impl(&dword_1E3BC5000, v13, OS_LOG_TYPE_DEFAULT, "currentItem changed: %@. Title: %@", buf, 0x16u);
    }
    double v17 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [(IMAVPlayer *)self stopObservingPlayerItem:v17];
      }
    }
    if ((*(_WORD *)&self->_delegateFlags & 0x40) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained playerCurrentItemChanged:self];
    }
    double v19 = [(AVPlayer *)self->_player currentItem];

    if (v19)
    {
      double v20 = objc_opt_class();
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v95[3] = &unk_1E6E1FAA8;
      v95[4] = self;
      [v20 performOnMainQueue:v95];
      double v21 = [(AVPlayer *)self->_player currentItem];
      [v21 addObserver:self forKeyPath:@"status" options:6 context:0];

      double v22 = [(AVPlayer *)self->_player currentItem];
      [v22 addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:0 context:0];

      double v23 = [(AVPlayer *)self->_player currentItem];
      [v23 addObserver:self forKeyPath:@"playbackBufferEmpty" options:0 context:0];

      double v24 = [(AVPlayer *)self->_player currentItem];
      [v24 addObserver:self forKeyPath:@"loadedTimeRanges" options:0 context:0];

      double v25 = [(AVPlayer *)self->_player currentItem];
      [v25 addObserver:self forKeyPath:@"presentationSize" options:0 context:0];

      double v26 = [(AVPlayer *)self->_player currentItem];
      [v26 willChangeValueForKey:@"status"];

      int v27 = [(AVPlayer *)self->_player currentItem];
      [v27 didChangeValueForKey:@"status"];

      CMTime v28 = [(AVPlayer *)self->_player currentItem];
      [v28 willChangeValueForKey:@"playbackLikelyToKeepUp"];

      long long v29 = [(AVPlayer *)self->_player currentItem];
      [v29 didChangeValueForKey:@"playbackLikelyToKeepUp"];

      int v30 = [(AVPlayer *)self->_player currentItem];
      [v30 willChangeValueForKey:@"playbackBufferEmpty"];

      uint64_t v31 = [(AVPlayer *)self->_player currentItem];
      [v31 didChangeValueForKey:@"playbackBufferEmpty"];

      uint64_t v32 = [(AVPlayer *)self->_player currentItem];
      [v32 willChangeValueForKey:@"loadedTimeRanges"];

      id v33 = [(AVPlayer *)self->_player currentItem];
      [v33 didChangeValueForKey:@"loadedTimeRanges"];

      v34 = [(AVPlayer *)self->_player currentItem];
      [v34 willChangeValueForKey:@"presentationSize"];

      v35 = [(AVPlayer *)self->_player currentItem];
      [v35 didChangeValueForKey:@"presentationSize"];

      [(IMPlayerItem *)self->_currentItem duration];
      -[IMAVPlayer setDurationBeforeItemLoaded:](self, "setDurationBeforeItemLoaded:");
      v36 = [(AVPlayer *)self->_player currentItem];
      v37 = [v36 asset];
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
      v94[3] = &unk_1E6E1FAA8;
      v94[4] = self;
      [v37 loadValuesAsynchronouslyForKeys:&unk_1F3F6F8B8 completionHandler:v94];
    }
    goto LABEL_21;
  }
  if ([v10 isEqualToString:@"rate"])
  {
    v38 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
    v39 = v38;
    if (v38)
    {
      uint64_t v40 = [v38 longValue];
      [(AVPlayer *)self->_player rate];
      if (v40 == (uint64_t)v41) {
        goto LABEL_20;
      }
    }
    goto LABEL_19;
  }
  if ([v10 isEqualToString:@"timeControlStatus"])
  {
    v42 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
    v39 = v42;
    if (v42)
    {
      uint64_t v43 = [v42 longValue];
      if (v43 == [(AVPlayer *)self->_player timeControlStatus]) {
        goto LABEL_20;
      }
    }
LABEL_19:
    [(IMAVPlayer *)self _updateForCurrentRateAndTimeControlStatus];
LABEL_20:

    goto LABEL_21;
  }
  if ([v10 isEqualToString:@"volume"])
  {
    if (self->_fadeOutTimer || [(IMAVPlayer *)self isScanning]) {
      goto LABEL_21;
    }
    v44 = @"IMAVPlayerNotification_PlayerVolumeDidChange";
LABEL_26:
    [(IMAVPlayer *)self _postNotificationName:v44 userInfo:0];
    goto LABEL_21;
  }
  if ([v10 isEqualToString:@"status"])
  {
    v45 = [(AVPlayer *)self->_player currentItem];

    if (!v45) {
      goto LABEL_21;
    }
    uint64_t v46 = *MEMORY[0x1E4F284E0];
    v47 = [v12 objectForKey:*MEMORY[0x1E4F284E0]];
    v39 = v47;
    if (v47)
    {
      uint64_t v48 = [v47 longValue];
      v49 = [(AVPlayer *)self->_player currentItem];
      uint64_t v50 = [v49 status];

      if (v48 == v50)
      {
        v51 = [MEMORY[0x1E4F91F08] player];
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v101 = [v39 longValue];
          _os_log_impl(&dword_1E3BC5000, v51, OS_LOG_TYPE_DEFAULT, "ignoring item status KVO because it is unchanged: %ld", buf, 0xCu);
        }
        goto LABEL_75;
      }
    }
    id v90 = v11;
    v53 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v54 = [v39 longValue];
      v55 = [(AVPlayer *)self->_player currentItem];
      *(_DWORD *)long long buf = 134218240;
      uint64_t v101 = v54;
      __int16 v102 = 2048;
      uint64_t v103 = [v55 status];
      _os_log_impl(&dword_1E3BC5000, v53, OS_LOG_TYPE_DEFAULT, "item status changed from: %ld to: %ld", buf, 0x16u);
    }
    if (v39)
    {
      uint64_t v106 = v46;
      v107[0] = v39;
      v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:&v106 count:1];
    }
    else
    {
      v51 = 0;
    }
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_MediaItemStatusDidChange" userInfo:v51];
    v69 = [(AVPlayer *)self->_player currentItem];
    uint64_t v70 = [v69 status];

    if (v70 == 1)
    {
      v84 = [(IMAVPlayer *)self currentItem];

      if (!v84)
      {
LABEL_75:

        goto LABEL_20;
      }
      v96 = @"IMAVPlayerNotificationKey_CurrentMediaItem";
      v72 = [(IMAVPlayer *)self currentItem];
      v97 = v72;
      v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
      [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_PlayerItemReadyToPlay" userInfo:v85];
    }
    else
    {
      if (v70 != 2) {
        goto LABEL_75;
      }
      v71 = [(AVPlayer *)self->_player currentItem];
      v72 = [v71 error];

      BOOL v89 = [(IMAVPlayer *)self isPlaybackRequested];
      if ((*(_WORD *)&self->_delegateFlags & 2) != 0)
      {
        id v73 = objc_loadWeakRetained((id *)&self->_delegate);
        [v73 playerErrorDidOccur:self error:v72];
      }
      v74 = [MEMORY[0x1E4F91F08] player];
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      {
        uint64_t v75 = [v72 code];
        uint64_t v76 = [v72 domain];
        v77 = (void *)v76;
        v78 = @"no";
        *(_DWORD *)long long buf = 134218498;
        uint64_t v101 = v75;
        __int16 v102 = 2112;
        if (v89) {
          v78 = @"yes";
        }
        uint64_t v103 = v76;
        __int16 v104 = 2112;
        v105 = v78;
        _os_log_impl(&dword_1E3BC5000, v74, OS_LOG_TYPE_ERROR, "Player error encountered, code %ld domain: %@, was playing: %@. Invalidating asset.", buf, 0x20u);
      }
      if (v89)
      {
        uint64_t v79 = [(IMAVPlayer *)self playbackErrorFallback];
        if (v79)
        {
          v80 = (void *)v79;
          v81 = [(IMAVPlayer *)self playbackErrorFallback];
          v82 = [(IMAVPlayer *)self currentItem];
          char v83 = ((uint64_t (**)(void, void *, void *))v81)[2](v81, v82, v72);

          if (v83)
          {
            id v11 = v90;
LABEL_74:

            goto LABEL_75;
          }
        }
      }
      if ([v72 code] != -11819)
      {
        v86 = objc_opt_class();
        v93[0] = MEMORY[0x1E4F143A8];
        v93[1] = 3221225472;
        v93[2] = __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_245;
        v93[3] = &unk_1E6E1FAA8;
        v93[4] = self;
        [v86 performOnMainQueue:v93];
      }
      v87 = [(IMAVPlayer *)self currentItem];
      [v87 cleanupAfterError];

      v99[0] = v72;
      v98[0] = @"IMAVPlayerNotificationKey_Error";
      v98[1] = @"IMAVPlayerNotificationKey_PlaybackInterrupted";
      v85 = [NSNumber numberWithBool:v89];
      v99[1] = v85;
      v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:2];
      [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_ErrorDidOccur" userInfo:v88];

      id v11 = v90;
    }

    goto LABEL_74;
  }
  if ([v10 isEqualToString:@"externalPlaybackActive"]
    && [MEMORY[0x1E4F91FC8] platformSupportsVideo])
  {
    [(IMAVPlayer *)self willChangeValueForKey:@"airPlayVideoActive"];
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_AirplayActiveDidChange" userInfo:0];
    [(IMAVPlayer *)self didChangeValueForKey:@"airPlayVideoActive"];
    goto LABEL_21;
  }
  if ([v10 isEqualToString:@"playbackBufferEmpty"])
  {
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_BufferEmptyChanged" userInfo:0];
    v39 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v52 = [(AVPlayer *)self->_player currentItem];
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v101) = [v52 isPlaybackBufferEmpty];
      _os_log_impl(&dword_1E3BC5000, v39, OS_LOG_TYPE_DEFAULT, "playbackBufferEmpty: %d", buf, 8u);
    }
    goto LABEL_20;
  }
  if ([v10 isEqualToString:@"playbackLikelyToKeepUp"])
  {
    v56 = [(AVPlayer *)self->_player currentItem];
    [v56 isPlaybackLikelyToKeepUp];

    v39 = [(IMAVPlayer *)self currentItem];
    v57 = [(IMAVPlayer *)self currentItem];
    [v57 isVideo];
    kdebug_trace();

    goto LABEL_20;
  }
  if (![v10 isEqualToString:@"loadedTimeRanges"])
  {
    if (![v10 isEqualToString:@"presentationSize"])
    {
      v91.receiver = self;
      v91.super_class = (Class)IMAVPlayer;
      [(IMAVPlayer *)&v91 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_21;
    }
    v44 = @"IMAVPlayerNotification_MediaItemPresentationSizeDidChange";
    goto LABEL_26;
  }
  v58 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E3BC5000, v58, OS_LOG_TYPE_INFO, "loadedTimeRanges did change", buf, 2u);
  }

  [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_LoadedDurationDidChange" userInfo:0];
  if ((*(_WORD *)&self->_delegateFlags & 0x200) != 0)
  {
    v59 = [(IMAVPlayer *)self delegate];
    [v59 playerLoadedDurationChanged:self];
  }
  if ([(IMAVPlayer *)self loadState] == 2)
  {
    v60 = [(IMAVPlayer *)self currentItem];
    [v60 playhead];
    double v62 = floor(v61);

    v63 = [(IMAVPlayer *)self player];
    v64 = [v63 currentItem];
    v65 = [v64 loadedTimeRanges];
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_249;
    v92[3] = &__block_descriptor_40_e24_B32__0__NSValue_8Q16_B24l;
    *(double *)&v92[4] = v62;
    uint64_t v66 = [v65 indexOfObjectPassingTest:v92];

    if (v66 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(IMAVPlayer *)self requestedRate];
      if (v67 > 0.0)
      {
        v68 = [(IMAVPlayer *)self player];
        [(IMAVPlayer *)self requestedRate];
        objc_msgSend(v68, "playImmediatelyAtRate:");
      }
    }
  }
LABEL_21:
}

uint64_t __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTimeObservers];
}

uint64_t __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _durationAvailable];
}

uint64_t __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_245(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pause];
}

BOOL __61__IMAVPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke_249(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  memset(v16, 0, 24);
  if (v3) {
    [v3 CMTimeRangeValue];
  }
  *(_OWORD *)&time.value = 0u;
  time.epoch = *(void *)&v16[0];
  double v5 = floor(CMTimeGetSeconds(&time));
  *(_OWORD *)&time.value = *(_OWORD *)((char *)v16 + 8);
  time.epoch = 0;
  double v6 = floor(CMTimeGetSeconds(&time));
  double v7 = *(double *)(a1 + 32);
  BOOL v8 = v7 >= v5;
  if (v7 > v5 + v6) {
    BOOL v8 = 0;
  }
  BOOL v9 = v5 + v6 - v7 > 30.0 && v8;
  id v10 = objc_msgSend(MEMORY[0x1E4F91F08], "player", (unsigned __int128)0, *(void *)&v16[0]);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      CMTimeValue v12 = *(void *)(a1 + 32);
      LODWORD(time.value) = 134218752;
      *(CMTimeValue *)((char *)&time.value + 4) = v12;
      LOWORD(time.flags) = 2048;
      *(double *)((char *)&time.flags + 2) = v5;
      HIWORD(time.epoch) = 2048;
      double v18 = v6;
      __int16 v19 = 2048;
      double v20 = v5 + v6;
      id v13 = "Found resumable time range: playhead %f, start %f, duration %f, end %f";
LABEL_13:
      _os_log_impl(&dword_1E3BC5000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&time, 0x2Au);
    }
  }
  else if (v11)
  {
    CMTimeValue v14 = *(void *)(a1 + 32);
    LODWORD(time.value) = 134218752;
    *(CMTimeValue *)((char *)&time.value + 4) = v14;
    LOWORD(time.flags) = 2048;
    *(double *)((char *)&time.flags + 2) = v5;
    HIWORD(time.epoch) = 2048;
    double v18 = v6;
    __int16 v19 = 2048;
    double v20 = v5 + v6;
    id v13 = "Time range not resumable: playhead %f, start %f, duration %f, end %f";
    goto LABEL_13;
  }

  return v9;
}

- (void)_durationAvailable
{
  id v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "_durationAvailable", v7, 2u);
  }

  __int16 delegateFlags = (__int16)self->_delegateFlags;
  if ((delegateFlags & 4) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained playerMediaTypeAvailable:self];

    __int16 delegateFlags = (__int16)self->_delegateFlags;
  }
  if ((delegateFlags & 8) != 0)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 playerDurationAvailable:self];
  }
  [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_DurationAvailable" userInfo:0];
  [(IMAVPlayer *)self sendDurationLoadedCoreAnalyticsEvents];
}

- (void)sendDurationLoadedCoreAnalyticsEvents
{
  id v19 = (id)objc_opt_new();
  id v3 = [(IMAVPlayer *)self currentItem];
  char v4 = [v3 paidSubscriptionActive];

  if ((v4 & 1) == 0)
  {
    double v5 = (void *)MEMORY[0x1E4F91FC0];
    id v6 = [(IMAVPlayer *)self currentItem];
    uint64_t v7 = [v6 episodeStoreId];
    BOOL v8 = [(IMAVPlayer *)self currentItem];
    [v8 duration];
    BOOL v9 = objc_msgSend(v5, "episodeDurationComparisonWithEpisodeAdamId:duration:", v7);
    [v19 sendEvent:v9];
  }
  id v10 = [(IMAVPlayer *)self currentItem];
  [v10 playhead];
  if (v11 == 0.0)
  {
    CMTimeValue v12 = [(IMAVPlayer *)self currentItem];
    uint64_t v13 = [v12 playCount];

    if (v13) {
      goto LABEL_7;
    }
    CMTimeValue v14 = (void *)MEMORY[0x1E4F91FC0];
    [(IMAVPlayer *)self durationBeforeItemLoaded];
    double v16 = v15;
    id v10 = [(IMAVPlayer *)self currentItem];
    [v10 duration];
    double v18 = [v14 episodeDurationComparisonWithMapiProvidedDuration:v16 playerItemDuration:v17];
    [v19 sendEvent:v18];
  }
LABEL_7:
}

- (void)playerItemDidReachEnd:(id)a3
{
  player = self->_player;
  id v5 = a3;
  id v6 = [(AVPlayer *)player currentItem];
  uint64_t v7 = [v5 object];

  if (v6 == v7)
  {
    if (self->_loops)
    {
      [(IMAVPlayer *)self setCurrentTime:0.0];
      int loops = self->_loops;
      BOOL v9 = __OFSUB__(loops, 1);
      int v10 = loops - 1;
      if (v10 < 0 == v9) {
        self->_int loops = v10;
      }
    }
    else if (![(IMAVPlayer *)self scrubbing])
    {
      [(IMAVPlayer *)self sendItemEndedNotification];
    }
  }
}

- (void)sendItemEndedNotification
{
  id v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTimeValue v14 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "sendItemEndedNotification", v14, 2u);
  }

  [(IMAVPlayer *)self duration];
  double v5 = v4;
  [(IMAVPlayer *)self duration];
  [(IMAVPlayer *)self sendPeriodicTimeEvent:1 duration:v5 finished:v6];
  if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained playerCurrentItemEnded:self];
  }
  BOOL v8 = [(IMAVPlayer *)self causalityObserver];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [(IMAVPlayer *)self causalityObserver];
    [v10 player:self willStopWithReason:13 initiator:2];
  }
  [(IMAVPlayer *)self nextMediaItem];
  double v11 = [(IMAVPlayer *)self causalityObserver];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(IMAVPlayer *)self causalityObserver];
    [v13 player:self didStopWithReason:13 initiator:2];
  }
}

- (void)_failedToPlayToEndNotification:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v12 = 0;
    _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_DEFAULT, "_failedToPlayToEndNotification", v12, 2u);
  }

  double v6 = [v4 object];
  uint64_t v7 = [(IMAVPlayer *)self playerItem];

  if (v6 == v7)
  {
    BOOL v8 = [v4 userInfo];
    char v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F16028]];

    if ([v9 code] != -11870 && -[IMAVPlayer isPlaybackRequested](self, "isPlaybackRequested"))
    {
      [(IMAVPlayer *)self pause];
      [(IMAVPlayer *)self nextMediaItem];
    }
    int v10 = [(IMAVPlayer *)self currentItem];
    [v10 cleanupAfterError];

    uint64_t v13 = @"IMAVPlayerNotificationKey_Error";
    v14[0] = v9;
    double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_FailedToPlayToEndTime" userInfo:v11];
  }
}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__IMAVPlayer__postNotificationName_userInfo___block_invoke;
  v11[3] = &unk_1E6E1FCA8;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performOnMainQueue:v11];
}

void __45__IMAVPlayer__postNotificationName_userInfo___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:a1[4] object:a1[5] userInfo:a1[6]];
}

- (void)_setCurrentTime:(double)a3
{
  self->_double currentTime = a3;
}

- (void)setCurrentTime:(double)a3
{
}

- (void)setCurrentTime:(double)a3 fromMediaRemote:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    double v23 = a3;
    __int16 v24 = 1024;
    BOOL v25 = v4;
    _os_log_impl(&dword_1E3BC5000, v7, OS_LOG_TYPE_DEFAULT, "setCurrentTime %f fromMediaRemote %d", buf, 0x12u);
  }

  double v8 = 0.0;
  if (a3 >= 0.0)
  {
    if ([(IMAVPlayer *)self isDurationReady])
    {
      [(IMAVPlayer *)self duration];
      double v8 = a3;
      if (v9 < a3)
      {
        [(IMAVPlayer *)self duration];
        double v8 = v10;
      }
    }
    else
    {
      double v8 = a3;
    }
  }
  v20[0] = @"IMAVPlayerNotificationKey_OldPlayheadTime";
  double currentTime = self->_currentTime;
  *(float *)&double currentTime = currentTime;
  id v12 = objc_msgSend(NSNumber, "numberWithFloat:", currentTime, @"IMAVPlayerNotificationKey_OldPlayheadTime");
  v21[0] = v12;
  v20[1] = @"IMAVPlayerNotificationKey_NewPlayheadTime";
  *(float *)&double v13 = v8;
  id v14 = [NSNumber numberWithFloat:v13];
  v21[1] = v14;
  v20[2] = @"IMAVPlayerNotificationKey_FromMediaRemote";
  double v15 = [NSNumber numberWithBool:v4];
  v21[2] = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
  double v17 = (void *)[v16 mutableCopy];

  double v18 = [(IMAVPlayer *)self currentItem];

  if (v18)
  {
    id v19 = [(IMAVPlayer *)self currentItem];
    [v17 setObject:v19 forKey:@"IMAVPlayerNotificationKey_CurrentMediaItem"];
  }
  [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_PlayerHeadWillChange" userInfo:v17];
  self->_double currentTime = v8;
  if (![(IMAVPlayer *)self isUpdatingCurrentTime])
  {
    [(IMAVPlayer *)self setIsUpdatingCurrentTime:1];
    [(IMAVPlayer *)self _updatePlayerToCurrentTime:0];
  }
  [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_PlayerHeadDidChange" userInfo:v17];
}

- (void)_updatePlayerToCurrentTime:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(IMAVPlayer *)self playerItem];

  double currentTime = self->_currentTime;
  if (v5)
  {
    id v7 = [(IMAVPlayer *)self playerItem];
    double v8 = v7;
    if (v7) {
      [v7 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);

    if (vabdd_f64(Seconds, currentTime) <= 0.5)
    {
      [(IMAVPlayer *)self _updatePlayerTimeCompleted:v4 completion:currentTime];
    }
    else
    {
      double v10 = [MEMORY[0x1E4F91F08] player];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134218240;
        *(double *)&uint8_t buf[4] = currentTime;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = Seconds;
        _os_log_impl(&dword_1E3BC5000, v10, OS_LOG_TYPE_DEFAULT, "_updatePlayerToTime: %f currentTime: %f", buf, 0x16u);
      }

      double v11 = [(IMAVPlayer *)self playerItem];
      CMTimeMakeWithSeconds(&v17, currentTime, 1000000000);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      void v14[2] = __41__IMAVPlayer__updatePlayerToCurrentTime___block_invoke;
      v14[3] = &unk_1E6E1FCD0;
      double v16 = currentTime;
      void v14[4] = self;
      id v15 = v4;
      *(_OWORD *)long long buf = *MEMORY[0x1E4F1FA48];
      *(void *)&uint8_t buf[16] = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      long long v12 = *(_OWORD *)buf;
      uint64_t v13 = *(void *)&buf[16];
      [v11 seekToTime:&v17 toleranceBefore:buf toleranceAfter:&v12 completionHandler:v14];
    }
  }
  else
  {
    [(IMAVPlayer *)self _updatePlayerTimeCompleted:v4 completion:self->_currentTime];
    [(IMAVPlayer *)self updateNowPlayingDurationSnapshot];
  }
}

void __41__IMAVPlayer__updatePlayerToCurrentTime___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 134218240;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_DEFAULT, "_updatePlayerToTime: %f Finished %d", (uint8_t *)&v6, 0x12u);
  }

  if (a2)
  {
    [*(id *)(a1 + 32) _updatePlayerTimeCompleted:*(void *)(a1 + 40) completion:*(double *)(a1 + 48)];
    [*(id *)(a1 + 32) updateNowPlayingDurationSnapshot];
  }
}

- (void)_updatePlayerTimeCompleted:(double)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v6 = (void (**)(void))a4;
  uint64_t v7 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double currentTime = self->_currentTime;
    int v9 = [(IMAVPlayer *)self playerItem];
    uint64_t v10 = v9;
    if (v9) {
      [v9 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    *(_DWORD *)long long buf = 134218496;
    double v18 = a3;
    __int16 v19 = 2048;
    double v20 = currentTime;
    __int16 v21 = 2048;
    Float64 v22 = Seconds;
    _os_log_impl(&dword_1E3BC5000, v7, OS_LOG_TYPE_DEFAULT, "_updatePlayerTimeCompleted set time %f, currentTime %f, playerTime: %f", buf, 0x20u);
  }
  if (vabdd_f64(self->_currentTime, a3) >= 1.0)
  {
    dispatch_time_t v13 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__IMAVPlayer__updatePlayerTimeCompleted_completion___block_invoke;
    block[3] = &unk_1E6E1FB20;
    block[4] = self;
    id v15 = v6;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(IMAVPlayer *)self setIsUpdatingCurrentTime:0];
    [(IMAVPlayer *)self forceTriggerTimeObserverAt:a3];
    if (![(IMAVPlayer *)self isPlaybackActive])
    {
      [(IMAVPlayer *)self duration];
      [(IMAVPlayer *)self sendPeriodicTimeEvent:0 duration:a3 finished:v12];
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

uint64_t __52__IMAVPlayer__updatePlayerTimeCompleted_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlayerToCurrentTime:*(void *)(a1 + 40)];
}

- (void)startSeek:(BOOL)a3
{
  if (a3) {
    double v5 = 2.0;
  }
  else {
    double v5 = 1.0;
  }
  if (![(IMAVPlayer *)self isSeeking] || ([(IMAVPlayer *)self requestedRate], v5 != v6))
  {
    [(IMAVPlayer *)self cancelFadeOut];
    [(IMAVPlayer *)self endSeek];
    self->_seekForward = a3;
    uint64_t v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_onSeekTimer_ selector:0 userInfo:1 repeats:0.8];
    seekTimer = self->_seekTimer;
    self->_seekTimer = v7;

    *(float *)&double v9 = v5;
    [(IMAVPlayer *)self setRequestedRate:v9];
    [(IMAVPlayer *)self updateNowPlayingDurationSnapshot];
  }
}

- (void)cancelSeek
{
  [(NSTimer *)self->_seekTimer invalidate];
  seekTimer = self->_seekTimer;
  self->_seekTimer = 0;
}

- (void)endSeek
{
  [(IMAVPlayer *)self cancelSeek];
  [(IMAVPlayer *)self updateRateForCurrentState];

  [(IMAVPlayer *)self updateNowPlayingDurationSnapshot];
}

- (BOOL)isSeeking
{
  return self->_seekTimer != 0;
}

- (void)onSeekTimer:(id)a3
{
  BOOL seekForward = self->_seekForward;
  [(IMAVPlayer *)self currentTime];
  if (seekForward)
  {
    double v6 = v5 + 10.0;
  }
  else
  {
    double v7 = v5 + -10.0;
    double v6 = 0.0;
    if (v7 >= 0.0)
    {
      [(IMAVPlayer *)self currentTime];
      double v6 = v8 + -10.0;
    }
  }

  [(IMAVPlayer *)self setCurrentTime:v6];
}

- (void)setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3) {
    self->_scrubbing = a3;
  }
}

- (BOOL)isDurationReady
{
  id v3 = [(IMAVPlayer *)self currentItem];
  if ([v3 isAssetLoaded])
  {
    id v4 = [(IMAVPlayer *)self currentItem];
    double v5 = [v4 asset];
    BOOL v6 = [v5 statusOfValueForKey:@"duration" error:0] == 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)duration
{
  id v2 = [(IMAVPlayer *)self currentItem];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (double)loadedDuration
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v3 = [(IMAVPlayer *)self playerItem];

  if (!v3) {
    return 0.0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v4 = [(IMAVPlayer *)self playerItem];
  double v5 = [v4 loadedTimeRanges];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v11) {
          [v11 CMTimeRangeValue];
        }
        else {
          memset(&v14, 0, sizeof(v14));
        }
        CMTimeRangeGetEnd(&time, &v14);
        double Seconds = CMTimeGetSeconds(&time);
        if (Seconds > v9) {
          double v9 = Seconds;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (BOOL)bufferEmpty
{
  id v2 = [(AVPlayer *)self->_player currentItem];
  char v3 = [v2 isPlaybackBufferEmpty];

  return v3;
}

- (void)scanWithRate:(float)a3
{
  [(IMAVPlayer *)self scanRate];
  if (*(float *)&v5 != a3)
  {
    *(float *)&double v5 = a3;
    [(IMAVPlayer *)self setScanRate:v5];
    [(IMAVPlayer *)self updateRateForCurrentState];
    if ([(IMAVPlayer *)self isScanning])
    {
      uint64_t v6 = [(IMAVPlayer *)self player];
      double v7 = 0.0;
      id v10 = v6;
    }
    else
    {
      [(IMAVPlayer *)self storedVolume];
      int v9 = v8;
      uint64_t v6 = [(IMAVPlayer *)self player];
      id v10 = v6;
      LODWORD(v7) = v9;
    }
    [v6 setVolume:v7];
  }
}

- (BOOL)isScanning
{
  [(IMAVPlayer *)self scanRate];
  return v2 != 0.0;
}

- (void)addTimeObserver:(double)a3
{
  if (a3 >= 0.0)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    CMTimeMakeWithSeconds(&v6, a3, 1000000000);
    [(IMAVPlayer *)self addCMTimeObserver:&v6];
  }
}

- (void)removeTimeObserver:(double)a3
{
  CMTimeMakeWithSeconds(&v4, a3, 1000000000);
  [(IMAVPlayer *)self removeCMTimeObserver:&v4];
}

- (void)addCMTimeObserver:(id *)a3
{
  if (a3->var2)
  {
    if (!self->_observingTimes)
    {
      double v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      observingTimes = self->_observingTimes;
      self->_observingTimes = v5;
    }
    long long v8 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    uint64_t v7 = [MEMORY[0x1E4F29238] valueWithCMTime:&v8];
    [(NSMutableArray *)self->_observingTimes addObject:v7];
    self->_timeObserverNeedsUpdate = 1;
  }
}

- (void)removeCMTimeObserver:(id *)a3
{
  observingTimes = self->_observingTimes;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  CMTime v4 = [MEMORY[0x1E4F29238] valueWithCMTime:&v5];
  [(NSMutableArray *)observingTimes removeObject:v4];
}

- (void)removeAllTimeObservers
{
  [(IMAVPlayer *)self clearTimeObservers];
  [(NSMutableArray *)self->_observingTimes removeAllObjects];
  observingTimes = self->_observingTimes;
  self->_observingTimes = 0;
}

- (void)clearTimeObservers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_timeObservers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[AVPlayer removeTimeObserver:](self->_player, "removeTimeObserver:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_timeObservers removeAllObjects];
  timeObservers = self->_timeObservers;
  self->_timeObservers = 0;
}

- (void)addPeriodicTimeObservers
{
  if (self->_player)
  {
    objc_initWeak(&location, self);
    uint64_t v3 = [(IMAVPlayer *)self periodicTimeObserver];

    if (!v3)
    {
      player = self->_player;
      CMTimeMakeWithSeconds(&v14, 1.0, 1000000000);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __38__IMAVPlayer_addPeriodicTimeObservers__block_invoke;
      v12[3] = &unk_1E6E1FCF8;
      objc_copyWeak(&v13, &location);
      uint64_t v5 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:&v14 queue:0 usingBlock:v12];
      [(IMAVPlayer *)self setPeriodicTimeObserver:v5];

      objc_destroyWeak(&v13);
    }
    uint64_t v6 = [(IMAVPlayer *)self nowPlayingInfoPeriodicTimeObserver];

    if (!v6)
    {
      uint64_t v7 = self->_player;
      CMTimeMakeWithSeconds(&v11, 10.0, 1000000000);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __38__IMAVPlayer_addPeriodicTimeObservers__block_invoke_2;
      v9[3] = &unk_1E6E1FCF8;
      objc_copyWeak(&v10, &location);
      long long v8 = [(AVPlayer *)v7 addPeriodicTimeObserverForInterval:&v11 queue:0 usingBlock:v9];
      [(IMAVPlayer *)self setNowPlayingInfoPeriodicTimeObserver:v8];

      objc_destroyWeak(&v10);
    }
    objc_destroyWeak(&location);
  }
}

void __38__IMAVPlayer_addPeriodicTimeObservers__block_invoke(uint64_t a1, CMTime *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained duration];
  double v5 = v4;
  CMTime v7 = *a2;
  double Seconds = CMTimeGetSeconds(&v7);
  if ([WeakRetained isPlaybackActive]) {
    [WeakRetained sendPeriodicTimeEvent:0 duration:Seconds finished:v5];
  }
}

void __38__IMAVPlayer_addPeriodicTimeObservers__block_invoke_2(uint64_t a1, CMTime *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v4 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CMTime v9 = *a2;
    Float64 Seconds = CMTimeGetSeconds(&v9);
    LODWORD(v9.value) = 134217984;
    *(Float64 *)((char *)&v9.value + 4) = Seconds;
    _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_DEFAULT, "periodic time observer: %f", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isPlaybackActive]
    && ([WeakRetained isUpdatingCurrentTime] & 1) == 0)
  {
    CMTime v9 = *a2;
    double v7 = CMTimeGetSeconds(&v9);
    objc_msgSend(WeakRetained, "_setCurrentTime:");
    long long v8 = [WeakRetained currentItem];
    [v8 setPlayhead:v7];
  }
  [WeakRetained updateNowPlayingDurationSnapshot];
}

- (void)removePeriodicTimeObservers
{
  uint64_t v3 = [(IMAVPlayer *)self periodicTimeObserver];

  if (v3)
  {
    player = self->_player;
    double v5 = [(IMAVPlayer *)self periodicTimeObserver];
    [(AVPlayer *)player removeTimeObserver:v5];

    [(IMAVPlayer *)self setPeriodicTimeObserver:0];
  }
  uint64_t v6 = [(IMAVPlayer *)self nowPlayingInfoPeriodicTimeObserver];

  if (v6)
  {
    double v7 = self->_player;
    long long v8 = [(IMAVPlayer *)self nowPlayingInfoPeriodicTimeObserver];
    [(AVPlayer *)v7 removeTimeObserver:v8];

    [(IMAVPlayer *)self setNowPlayingInfoPeriodicTimeObserver:0];
  }
}

- (void)sendPeriodicTimeEvent:(double)a3 duration:(double)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (![(IMAVPlayer *)self isUpdatingCurrentTime])
  {
    CMTime v9 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(IMAVPlayer *)self currentItem];
      CMTime v11 = [v10 title];
      long long v12 = [(IMAVPlayer *)self player];
      id v13 = v12;
      if (v12) {
        [v12 currentTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      Float64 Seconds = CMTimeGetSeconds(&time);
      double currentTime = self->_currentTime;
      *(_DWORD *)long long buf = 138413314;
      uint64_t v23 = v11;
      __int16 v24 = 2048;
      double v25 = a3;
      __int16 v26 = 2048;
      double v27 = a4;
      __int16 v28 = 2048;
      Float64 v29 = Seconds;
      __int16 v30 = 2048;
      double v31 = currentTime;
      _os_log_impl(&dword_1E3BC5000, v9, OS_LOG_TYPE_INFO, "sendPeriodicTimeEvent for episode: %@, time: %f, duration: %f, playerTime: %f, storedTime: %f", buf, 0x34u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      __int16 delegateFlags = (__int16)self->_delegateFlags;

      if ((delegateFlags & 0x20) != 0)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 playerPeriodicUpdate:self elapsed:v5 duration:a3 isFinished:a4];
      }
    }
    [(IMAVPlayer *)self autoStopMediaTime];
    if (a3 + -2.0 >= v19) {
      [(IMAVPlayer *)self enforceAutoStopForMode:4];
    }
    self->_double currentTime = a3;
    double v20 = [(IMAVPlayer *)self currentItem];
    [v20 setPlayhead:a3];

    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_PeriodicUpdate" userInfo:0];
  }
}

- (void)updateTimeObservers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(IMAVPlayer *)self _assertMainThread];
  if (self->_timeObserverNeedsUpdate)
  {
    [(IMAVPlayer *)self clearTimeObservers];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = self->_observingTimes;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[IMAVPlayer setupTimeObserver:](self, "setupTimeObserver:", *(void *)(*((void *)&v8 + 1) + 8 * i), (void)v8);
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    self->_timeObserverNeedsUpdate = 0;
    [(IMAVPlayer *)self currentTime];
    -[IMAVPlayer forceTriggerTimeObserverAt:](self, "forceTriggerTimeObserverAt:");
  }
}

- (void)setupTimeObserver:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(IMAVPlayer *)self _assertMainThread];
  uint64_t v5 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_INFO, "add BoundaryTimeObserver timeValue %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy_;
  __int16 v24 = __Block_byref_object_dispose_;
  uint64_t v6 = self;
  double v25 = v6;
  player = v6->_player;
  long long v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v4];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  long long v17 = __32__IMAVPlayer_setupTimeObserver___block_invoke;
  id v18 = &unk_1E6E1FD20;
  p_long long buf = &buf;
  id v9 = v4;
  id v19 = v9;
  long long v10 = [(AVPlayer *)player addBoundaryTimeObserverForTimes:v8 queue:0 usingBlock:&v15];

  timeObservers = v6->_timeObservers;
  if (!timeObservers)
  {
    long long v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CMTime v14 = v6->_timeObservers;
    p_timeObservers = &v6->_timeObservers;
    *p_timeObservers = v12;

    timeObservers = *p_timeObservers;
  }
  -[NSMutableArray addObject:](timeObservers, "addObject:", v10, v15, v16, v17, v18);

  _Block_object_dispose(&buf, 8);
}

uint64_t __32__IMAVPlayer_setupTimeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) triggerTimeObserverAt:*(void *)(a1 + 32)];
}

- (void)triggerTimeObserverAt:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    [v4 CMTimeValue];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  -[IMAVPlayer setupChapterAtTime:](self, "setupChapterAtTime:");
  [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_DidCrossTimeBoundry" userInfo:0];
  if ((*(_WORD *)&self->_delegateFlags & 0x10) != 0)
  {
    double v7 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      double v11 = Seconds;
      _os_log_impl(&dword_1E3BC5000, v7, OS_LOG_TYPE_INFO, "triggerTimeObserver %f", buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained player:self callbackForTime:Seconds];
  }
}

- (void)forceTriggerTimeObserverAt:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_observingTimes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        if (v12) {
          [*(id *)(*((void *)&v15 + 1) + 8 * v10) CMTimeValue];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        double Seconds = CMTimeGetSeconds(&time);
        if (Seconds > a3)
        {
          uint64_t v11 = v8 + v10;
          goto LABEL_16;
        }
        if (Seconds == a3) {
          goto LABEL_18;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_16:

  if (v11)
  {
    uint64_t v12 = [(NSMutableArray *)self->_observingTimes objectAtIndex:v11 - 1];
    uint64_t v5 = (NSMutableArray *)v12;
LABEL_18:
    [(IMAVPlayer *)self triggerTimeObserverAt:v12];
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v7;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 4;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v9;

    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 8;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v11;

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 16;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v13;

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 32;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v15;

    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 64;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v17;

    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = 128;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v19;

    id v20 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = 256;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v21;

    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = 512;
    }
    else {
      __int16 v23 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v23;

    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v25 = 1024;
    }
    else {
      __int16 v25 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFBFF | v25;

    id v26 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      __int16 v27 = 2048;
    }
    else {
      __int16 v27 = 0;
    }
    *(_WORD *)&self->___int16 delegateFlags = *(_WORD *)&self->_delegateFlags & 0xF7FF | v27;
  }
}

- (void)updateNowPlayingMetadataIncludingArtwork:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(IMAVPlayer *)self currentItem];

  if (!v5) {
    return;
  }
  id v6 = [(IMAVPlayer *)self currentItem];
  __int16 v7 = [v6 title];

  id v8 = [(IMAVPlayer *)self currentItem];
  __int16 v9 = [v8 album];

  id v34 = v7;
  id v10 = v9;
  __int16 v11 = [(IMAVPlayer *)self currentItem];
  uint64_t v12 = [v11 timeChapters];
  if (!v12)
  {
    id v18 = v10;
    id v19 = v34;
LABEL_15:

    goto LABEL_16;
  }
  __int16 v13 = (void *)v12;
  unint64_t currentChapterIndex = self->_currentChapterIndex;
  __int16 v15 = [(IMAVPlayer *)self currentItem];
  id v16 = [v15 timeChapters];
  unint64_t v17 = [v16 count];

  id v18 = v10;
  id v19 = v34;
  if (currentChapterIndex < v17)
  {
    id v20 = [(IMAVPlayer *)self currentItem];
    __int16 v21 = [v20 timeChapters];
    id v22 = [v21 objectAtIndexedSubscript:self->_currentChapterIndex];
    __int16 v11 = [v22 title];

    __int16 v23 = [(IMAVPlayer *)self currentItem];
    id v24 = [v23 title];

    id v18 = v10;
    id v19 = v34;
    if ([v11 length])
    {
      unint64_t v25 = [(IMAVPlayer *)self chapterMetadataMode];
      uint64_t v26 = [v24 length];
      if (v25 == 1)
      {
        id v19 = v34;
        if (v26)
        {
          id v19 = v24;
        }
        id v18 = v11;
        __int16 v27 = v10;
        goto LABEL_13;
      }
      id v18 = v10;
      id v19 = v34;
      if (v26)
      {
        id v19 = [NSString stringWithFormat:@"%@ - %@", v11, v24];
        __int16 v27 = v34;
        id v18 = v10;
LABEL_13:
      }
    }

    goto LABEL_15;
  }
LABEL_16:
  __int16 v28 = [(IMAVPlayer *)self currentItem];
  Float64 v29 = [v28 contentItem];

  if (v3)
  {
    __int16 v30 = objc_msgSend(NSString, "stringWithFormat:", @"-%lu", -[IMAVPlayer currentChapterIndex](self, "currentChapterIndex"));
    double v31 = [(IMAVPlayer *)self currentItem];
    uint64_t v32 = [v31 artworkIdentifier];
    id v33 = [v32 stringByAppendingString:v30];

    [v29 setArtworkIdentifier:v33];
    [v29 invalidateArtwork];
  }
  [v29 setTitle:v19];
  [v29 setAlbumName:v18];
}

- (void)updateNowPlayingDurationSnapshot
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_opt_class(), "rateForPlaybackSpeed:", -[IMAVPlayer playbackSpeed](self, "playbackSpeed"));
  int v4 = v3;
  float v5 = 0.0;
  if ([(IMAVPlayer *)self isPlaybackRequested])
  {
    [(IMAVPlayer *)self actualRate];
    float v5 = v6;
    if (self->_seekTimer)
    {
      if (!self->_seekForward) {
        float v5 = -v6;
      }
    }
  }
  __int16 v7 = [(IMAVPlayer *)self playerItem];
  if ([v7 status] == 1)
  {
    id v8 = [(IMAVPlayer *)self playerItem];
    __int16 v9 = v8;
    if (v8) {
      [v8 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    [(IMAVPlayer *)self currentTime];
    double Seconds = v10;
  }

  if (Seconds <= 0.00000011920929) {
    double Seconds = 0.1;
  }
  uint64_t v12 = [(IMAVPlayer *)self currentItem];
  __int16 v13 = [v12 contentItem];

  LODWORD(v14) = v4;
  [v13 setDefaultPlaybackRate:v14];
  [(IMAVPlayer *)self duration];
  objc_msgSend(v13, "setDuration:");
  [v13 playbackRate];
  float v16 = vabds_f32(v15, v5);
  [v13 elapsedTime];
  HIDWORD(v18) = 872415232;
  if (v16 > 0.00000011921 || (double v18 = 0.5, vabdd_f64(v17, Seconds) > 0.5))
  {
    *(float *)&double v18 = v5;
    [v13 setElapsedTime:Seconds playbackRate:v18];
    id v19 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      [(IMAVPlayer *)self duration];
      *(_DWORD *)long long buf = 134218496;
      double v37 = Seconds;
      __int16 v38 = 2048;
      uint64_t v39 = v20;
      __int16 v40 = 2048;
      double v41 = v5;
      _os_log_impl(&dword_1E3BC5000, v19, OS_LOG_TYPE_INFO, "Updated MPNowPlayingContentItem snapshot: elapsedTime: %f, duration: %f, playbackRate: %f", buf, 0x20u);
    }
  }
  __int16 v21 = [(IMAVPlayer *)self manifest];
  if (v21)
  {
    id v22 = [(IMAVPlayer *)self manifest];
    if ([v22 currentIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v23 = 0;
    }
    else
    {
      id v24 = [(IMAVPlayer *)self manifest];
      uint64_t v23 = [v24 currentIndex];
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

  unint64_t v25 = [(IMAVPlayer *)self manifest];
  if (v25)
  {
    uint64_t v26 = [(IMAVPlayer *)self manifest];
    uint64_t v27 = [v26 count];
  }
  else
  {
    uint64_t v27 = 1;
  }

  v34[0] = *MEMORY[0x1E4F77580];
  __int16 v28 = [NSNumber numberWithUnsignedInteger:v23];
  v35[0] = v28;
  v34[1] = *MEMORY[0x1E4F77608];
  Float64 v29 = [NSNumber numberWithUnsignedInteger:v27];
  v35[1] = v29;
  __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];

  [v13 updateNowPlayingInfoIfNeeded:v30];
  double v31 = [(IMAVPlayer *)self currentItem];
  if ([v31 isPlaceholder])
  {
    uint64_t v32 = 1;
  }
  else if ([(IMAVPlayer *)self isPlaybackRequested])
  {
    uint64_t v32 = [(IMAVPlayer *)self isPlaybackActive] ^ 1;
  }
  else
  {
    uint64_t v32 = 0;
  }

  if (v32 != [v13 isLoading]) {
    [v13 setLoading:v32];
  }
  [(IMAVPlayer *)self updateInfoCenterPlaybackState];
}

- (void)updateInfoCenterPlaybackState
{
  unint64_t v3 = [(IMAVPlayer *)self state];
  if (v3)
  {
    if (v3 == 2) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = v3 == 1;
    }
  }
  else if ([(IMAVPlayer *)self wasInterrupted])
  {
    uint64_t v4 = 4;
  }
  else if ([(IMAVPlayer *)self wasInterruptedEarly])
  {
    uint64_t v4 = 4;
  }
  else
  {
    uint64_t v4 = 2;
  }
  id v5 = [(IMAVPlayer *)self infoCenter];
  [v5 setPlaybackState:v4];
}

- (BOOL)hasChapters
{
  return [(IMAVPlayer *)self chapterCount] != 0;
}

- (unint64_t)chapterCount
{
  float v2 = [(IMAVPlayer *)self currentItem];
  unint64_t v3 = [v2 timeChapters];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)setupChapterTimeObservers
{
  [(IMAVPlayer *)self _assertMainThread];
  [(IMAVPlayer *)self removeAllTimeObservers];
  unint64_t v3 = [(IMAVPlayer *)self currentItem];
  unint64_t v4 = [v3 chapters];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      __int16 v7 = [(IMAVPlayer *)self currentItem];
      id v8 = [v7 chapters];
      __int16 v9 = [v8 objectAtIndex:v6];

      if (v9)
      {
        [v9 assetTimeRange];
      }
      else
      {
        long long v14 = 0u;
        long long v15 = 0u;
        long long v13 = 0u;
      }
      long long v16 = v13;
      uint64_t v17 = v14;
      -[IMAVPlayer addCMTimeObserver:](self, "addCMTimeObserver:", &v16, v13, v14, v15);

      ++v6;
      double v10 = [(IMAVPlayer *)self currentItem];
      __int16 v11 = [v10 chapters];
      unint64_t v12 = [v11 count];
    }
    while (v6 < v12);
  }
  [(IMAVPlayer *)self updateTimeObservers];
}

- (void)setCurrentChapterIndex:(unint64_t)a3
{
  if ([(IMAVPlayer *)self chapterCount] > a3)
  {
    [(IMAVPlayer *)self _setChapterIndex:a3];
    uint64_t v5 = [(IMAVPlayer *)self currentItem];
    unint64_t v6 = [v5 timeChapters];
    __int16 v7 = [v6 objectAtIndex:a3];

    if (v7) {
      [v7 assetTimeRange];
    }
    else {
      memset(&v8, 0, sizeof(v8));
    }
    CMTime time = v8;
    [(IMAVPlayer *)self setCurrentTime:CMTimeGetSeconds(&time)];
  }
}

- (IMPlayerChapterInfo)currentChapter
{
  unint64_t v3 = [(IMAVPlayer *)self currentItem];
  unint64_t v4 = [v3 timeChapters];

  uint64_t v5 = [(IMAVPlayer *)self currentItem];
  uint64_t v6 = [v5 timeChapters];
  if (v6)
  {
    __int16 v7 = (void *)v6;
    unint64_t currentChapterIndex = self->_currentChapterIndex;
    unint64_t v9 = [v4 count];

    if (currentChapterIndex < v9)
    {
      double v10 = [v4 objectAtIndex:self->_currentChapterIndex];
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v10 = 0;
LABEL_6:

  return (IMPlayerChapterInfo *)v10;
}

- (void)setupChapterAtTime:(double)a3
{
  if (![(IMAVPlayer *)self scrubbing])
  {
    uint64_t v5 = [(IMAVPlayer *)self currentItem];
    uint64_t v6 = [v5 chapters];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        unint64_t v9 = [(IMAVPlayer *)self currentItem];
        double v10 = [v9 chapters];
        __int16 v11 = [v10 objectAtIndex:v8];

        if (v11)
        {
          [v11 assetTimeRange];
          *(_OWORD *)&time.value = v29;
          time.epoch = v30;
          double Seconds = CMTimeGetSeconds(&time);
          [v11 assetTimeRange];
        }
        else
        {
          long long v30 = 0u;
          long long v31 = 0u;
          long long v29 = 0u;
          memset(&time, 0, sizeof(time));
          double Seconds = CMTimeGetSeconds(&time);
          long long v26 = 0u;
          memset(v27, 0, sizeof(v27));
        }
        CMTime v28 = *(CMTime *)((char *)v27 + 8);
        double v13 = Seconds + CMTimeGetSeconds(&v28);
        if (Seconds + -0.001 < a3 && v13 > a3)
        {
          if (!objc_msgSend(v11, "type", v13, Seconds + -0.001))
          {
            long long v15 = [(IMAVPlayer *)self currentItem];
            long long v16 = [v15 timeChapters];
            uint64_t v17 = [v16 indexOfObject:v11];

            if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
              [(IMAVPlayer *)self _setChapterIndex:v17];
            }
            [(IMAVPlayer *)self updateNowPlayingMetadataIncludingArtwork:1];
          }
          if ((*(_WORD *)&self->_delegateFlags & 0x400) != 0)
          {
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __33__IMAVPlayer_setupChapterAtTime___block_invoke;
            v24[3] = &unk_1E6E1FB70;
            void v24[4] = self;
            id v25 = v11;
            double v18 = (void (**)(void))_Block_copy(v24);
            id v19 = [MEMORY[0x1E4F29060] currentThread];
            uint64_t v20 = [MEMORY[0x1E4F29060] mainThread];

            if (v19 == v20) {
              v18[2](v18);
            }
            else {
              dispatch_sync(MEMORY[0x1E4F14428], v18);
            }
          }
        }

        ++v8;
        __int16 v21 = [(IMAVPlayer *)self currentItem];
        id v22 = [v21 chapters];
        unint64_t v23 = [v22 count];
      }
      while (v8 < v23);
    }
  }
}

void __33__IMAVPlayer_setupChapterAtTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 player:*(void *)(a1 + 32) chapterStarted:*(void *)(a1 + 40)];
}

- (void)_setChapterIndex:(unint64_t)a3
{
  if (self->_currentChapterIndex < a3) {
    [(IMAVPlayer *)self enforceAutoStopForMode:2];
  }
  self->_unint64_t currentChapterIndex = a3;

  [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_CurrentChapterDidChange" userInfo:0];
}

- (void)onChaptersLoaded:(id)a3
{
  unint64_t v4 = [a3 object];
  currentItem = self->_currentItem;

  if (v4 == currentItem)
  {
    uint64_t v6 = objc_opt_class();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __31__IMAVPlayer_onChaptersLoaded___block_invoke;
    v7[3] = &unk_1E6E1FAA8;
    v7[4] = self;
    [v6 performOnMainQueue:v7];
  }
}

void __31__IMAVPlayer_onChaptersLoaded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentItem];

  if (v2)
  {
    [*(id *)(a1 + 32) setupChapterTimeObservers];
    unint64_t v3 = *(void **)(a1 + 32);
    [v3 currentTime];
    objc_msgSend(v3, "setupChapterAtTime:");
  }
}

- (void)nextChapter
{
  unint64_t v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "nextChapter", v4, 2u);
  }

  [(IMAVPlayer *)self setCurrentChapterIndex:[(IMAVPlayer *)self currentChapterIndex] + 1];
}

- (void)previousChapter
{
  unint64_t v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v4 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_DEFAULT, "previousChapter", v4, 2u);
  }

  [(IMAVPlayer *)self setCurrentChapterIndex:[(IMAVPlayer *)self currentChapterIndex] - 1];
}

- (void)setAutoStop:(unint64_t)a3
{
  if (self->_autoStop != a3)
  {
    [(IMAVPlayer *)self _clearAutoStop];
    self->_autoStop = a3;
    if (a3 == 1)
    {
      [(IMAVPlayer *)self _setupAutoStopTimer];
    }
  }
}

- (void)setAutoStopTimerTime:(double)a3
{
  self->_autoStopTimerTime = a3;
  [(IMAVPlayer *)self _clearAutoStopTimmer];

  [(IMAVPlayer *)self _setupAutoStopTimer];
}

- (double)autoStopTimeRemaining
{
  switch([(IMAVPlayer *)self autoStop])
  {
    case 1uLL:
      [(IMAVPlayer *)self autoStopTimerPausedTime];
      if (v3 > 0.0)
      {
        [(IMAVPlayer *)self autoStopTimerPausedTime];
        double v5 = v4;
        return v5 + 2.0;
      }
      uint64_t v17 = [(IMAVPlayer *)self autoStopTimer];

      if (v17)
      {
        double v18 = [(IMAVPlayer *)self autoStopTimer];
        id v19 = [v18 fireDate];
        [v19 timeIntervalSinceReferenceDate];
        double v21 = v20;
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v5 = v21 - v22;

        return v5 + 2.0;
      }
      [(IMAVPlayer *)self autoStopTimerTime];
      return result;
    case 2uLL:
      uint64_t v7 = [(IMAVPlayer *)self currentChapter];
      [v7 time];
      double v9 = v8;
      double v10 = [(IMAVPlayer *)self currentChapter];
      [v10 duration];
      double v12 = v9 + v11;
      [(IMAVPlayer *)self currentTime];
      double v6 = v12 - v13;

      return v6;
    case 3uLL:
      [(IMAVPlayer *)self duration];
      goto LABEL_8;
    case 4uLL:
      [(IMAVPlayer *)self autoStopMediaTime];
LABEL_8:
      double v15 = v14;
      [(IMAVPlayer *)self currentTime];
      return v15 - v16;
    default:
      return 0.0;
  }
}

- (void)_setupAutoStopTimer
{
  double v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_INFO, "_setupAutoStopTimer", buf, 2u);
  }

  if ([(IMAVPlayer *)self autoStop] != 1 || ![(IMAVPlayer *)self isPlaybackRequested])
  {
    double v5 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      double v6 = "_setupAutoStopTimer: abort, not timer mode or playing back!";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  double v4 = [(IMAVPlayer *)self autoStopTimer];

  if (v4)
  {
    double v5 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      double v6 = "_setupAutoStopTimer: abort, timer exists!";
LABEL_10:
      _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_INFO, v6, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  [(IMAVPlayer *)self autoStopTimerPausedTime];
  if (v7 <= 0.0)
  {
    [(IMAVPlayer *)self autoStopTimerTime];
    if (v10 <= 0.0)
    {
      double v5 = [MEMORY[0x1E4F91F08] player];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_11;
      }
      *(_WORD *)long long buf = 0;
      double v6 = "_setupAutoStopTimer: abort, no time!";
      goto LABEL_10;
    }
    [(IMAVPlayer *)self autoStopTimerTime];
    double v9 = v11 + -2.0;
  }
  else
  {
    [(IMAVPlayer *)self autoStopTimerPausedTime];
    double v9 = v8;
  }
  double v12 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E3BC5000, v12, OS_LOG_TYPE_INFO, "_setupAutoStopTimer: created timer!", buf, 2u);
  }

  double v13 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __33__IMAVPlayer__setupAutoStopTimer__block_invoke;
  v14[3] = &unk_1E6E1FD48;
  void v14[4] = self;
  *(double *)&void v14[5] = v9;
  [v13 performOnMainQueue:v14];
}

uint64_t __33__IMAVPlayer__setupAutoStopTimer__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel__autoStopTimerFired selector:0 userInfo:0 repeats:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setAutoStopTimer:v2];

  double v3 = *(void **)(a1 + 32);

  return [v3 setAutoStopTimerPausedTime:0.0];
}

- (void)_pauseAutoStopTimer
{
  double v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_INFO, "_pauseAutoStopTimer", v5, 2u);
  }

  [(IMAVPlayer *)self autoStopTimeRemaining];
  [(IMAVPlayer *)self setAutoStopTimerPausedTime:v4 + -2.0];
  [(IMAVPlayer *)self _clearAutoStopTimmer];
}

- (void)_clearAutoStopTimmer
{
  double v3 = [(IMAVPlayer *)self autoStopTimer];

  if (v3)
  {
    double v4 = [MEMORY[0x1E4F91F08] player];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1E3BC5000, v4, OS_LOG_TYPE_INFO, "_clearAutoStopTimmer", v6, 2u);
    }

    double v5 = [(IMAVPlayer *)self autoStopTimer];
    [v5 invalidate];

    [(IMAVPlayer *)self setAutoStopTimer:0];
  }
}

- (void)_autoStopTimerFired
{
  double v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_INFO, "_autoStopTimerFired", v4, 2u);
  }

  [(IMAVPlayer *)self enforceAutoStopForMode:1];
}

- (void)enforceAutoStopForMode:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v5 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134218240;
    unint64_t v7 = a3;
    __int16 v8 = 2048;
    unint64_t v9 = [(IMAVPlayer *)self autoStop];
    _os_log_impl(&dword_1E3BC5000, v5, OS_LOG_TYPE_INFO, "enforceAutoStopForMode: %lu, withCurrentMode: %lu", (uint8_t *)&v6, 0x16u);
  }

  if ([(IMAVPlayer *)self autoStop] == a3)
  {
    if (a3 <= 4 && ((1 << a3) & 0x13) != 0) {
      [(IMAVPlayer *)self sleep];
    }
    else {
      [(IMAVPlayer *)self pauseWithInitiator:2];
    }
    [(IMAVPlayer *)self setAutoStop:0];
    [(IMAVPlayer *)self _postNotificationName:@"IMAVPlayerNotification_AutoStopModeDidChange" userInfo:0];
  }
}

- (void)_clearAutoStop
{
  double v3 = [MEMORY[0x1E4F91F08] player];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1E3BC5000, v3, OS_LOG_TYPE_INFO, "clearAutoStop", v4, 2u);
  }

  self->_autoStop = 0;
  [(IMAVPlayer *)self setAutoStopTimerPausedTime:0.0];
  [(IMAVPlayer *)self setAutoStopTimerTime:0.0];
  [(IMAVPlayer *)self _clearAutoStopTimmer];
}

+ (void)performOnMainQueue:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F29060];
  block = (void (**)(void))a3;
  if ([v3 isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

+ (void)performOnAvSessionQueue:(id)a3
{
  uint64_t v3 = performOnAvSessionQueue__onceToken;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    double v5 = v4;
  }
  else
  {
    dispatch_once(&performOnAvSessionQueue__onceToken, &__block_literal_global_295);
    double v5 = v6;
  }
  dispatch_async((dispatch_queue_t)performOnAvSessionQueue__IMAVSessionConfigurationQueue, v5);
}

void __38__IMAVPlayer_performOnAvSessionQueue___block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("IMAVPlayer.avsession_queue", v2);
  double v1 = (void *)performOnAvSessionQueue__IMAVSessionConfigurationQueue;
  performOnAvSessionQueue__IMAVSessionConfigurationQueue = (uint64_t)v0;
}

+ (id)playerID
{
  if (os_feature_enabled_bluemoon()) {
    return @"Podcasts-Legacy";
  }
  else {
    return @"Podcasts";
  }
}

- (double)currentTime
{
  return self->_currentTime;
}

- (IMAVPlaybackCausalityObserver)causalityObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_causalityObserver);

  return (IMAVPlaybackCausalityObserver *)WeakRetained;
}

- (void)setCausalityObserver:(id)a3
{
}

- (IMAVPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IMAVPlayerDelegate *)WeakRetained;
}

- (MPNowPlayingInfoCenter)infoCenter
{
  return self->_infoCenter;
}

- (void)setInfoCenter:(id)a3
{
}

- (MPRemoteCommandCenter)commandCenter
{
  return self->_commandCenter;
}

- (unint64_t)state
{
  return self->_state;
}

- (AVPlayer)player
{
  return self->_player;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (IMPlayerManifest)manifest
{
  return self->_manifest;
}

- (IMPlayerItem)currentItem
{
  return self->_currentItem;
}

- (id)playbackErrorFallback
{
  return self->_playbackErrorFallback;
}

- (void)setPlaybackErrorFallback:(id)a3
{
}

- (unint64_t)autoStop
{
  return self->_autoStop;
}

- (double)autoStopTimerTime
{
  return self->_autoStopTimerTime;
}

- (double)autoStopMediaTime
{
  return self->_autoStopMediaTime;
}

- (void)setAutoStopMediaTime:(double)a3
{
  self->_autoStopMediaTime = a3;
}

- (BOOL)providesVideoView
{
  return self->_providesVideoView;
}

- (void)setProvidesVideoView:(BOOL)a3
{
  self->_providesVideoView = a3;
}

- (unint64_t)videoScale
{
  return self->_videoScale;
}

- (void)setVideoScale:(unint64_t)a3
{
  self->_videoScale = a3;
}

- (IMAVPlayerVideoViewController)videoViewController
{
  return self->_videoViewController;
}

- (void)setVideoViewController:(id)a3
{
}

- (BOOL)externalDisplay
{
  return self->_externalDisplay;
}

- (unint64_t)currentChapterIndex
{
  return self->_currentChapterIndex;
}

- (unint64_t)chapterMetadataMode
{
  return self->_chapterMetadataMode;
}

- (void)setChapterMetadataMode:(unint64_t)a3
{
  self->_chapterMetadataMode = a3;
}

- (int)loops
{
  return self->_loops;
}

- (void)setLoops:(int)a3
{
  self->_int loops = a3;
}

- (BOOL)scrubbing
{
  return self->_scrubbing;
}

- (unint64_t)playbackSpeed
{
  return self->_playbackSpeed;
}

- (NSURL)lastPlayingURL
{
  return self->_lastPlayingURL;
}

- (void)setLastPlayingURL:(id)a3
{
}

- (unint64_t)backgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(unint64_t)a3
{
  self->_backgroundTask = a3;
}

- (NSTimer)hdcpTimer
{
  return self->_hdcpTimer;
}

- (void)setHdcpTimer:(id)a3
{
}

- (NSTimer)seekTimer
{
  return self->_seekTimer;
}

- (void)setSeekTimer:(id)a3
{
}

- (NSMutableArray)timeObservers
{
  return self->_timeObservers;
}

- (void)setTimeObservers:(id)a3
{
}

- (NSMutableArray)observingTimes
{
  return self->_observingTimes;
}

- (void)setObservingTimes:(id)a3
{
}

- (BOOL)timeObserverNeedsUpdate
{
  return self->_timeObserverNeedsUpdate;
}

- (void)setTimeObserverNeedsUpdate:(BOOL)a3
{
  self->_timeObserverNeedsUpdate = a3;
}

- (BOOL)seekForward
{
  return self->_seekForward;
}

- (void)setSeekForward:(BOOL)a3
{
  self->_BOOL seekForward = a3;
}

- ($A179B7F90EACB6BD9E7D7430050708F9)delegateFlags
{
  return ($A179B7F90EACB6BD9E7D7430050708F9)self->_delegateFlags;
}

- (void)setDelegateFlags:(id)a3
{
  self->___int16 delegateFlags = ($2C1CFCBF620F04027A96DCE3CA271CD9)a3;
}

- (OS_dispatch_source)fadeOutTimer
{
  return self->_fadeOutTimer;
}

- (void)setFadeOutTimer:(id)a3
{
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
}

- (id)periodicTimeObserver
{
  return self->_periodicTimeObserver;
}

- (void)setPeriodicTimeObserver:(id)a3
{
}

- (id)nowPlayingInfoPeriodicTimeObserver
{
  return self->_nowPlayingInfoPeriodicTimeObserver;
}

- (void)setNowPlayingInfoPeriodicTimeObserver:(id)a3
{
}

- (BOOL)isUpdatingCurrentTime
{
  return self->_isUpdatingCurrentTime;
}

- (void)setIsUpdatingCurrentTime:(BOOL)a3
{
  self->_isUpdatingCurrentTime = a3;
}

- (BOOL)wasInterrupted
{
  return self->_wasInterrupted;
}

- (BOOL)wasInterruptedEarly
{
  return self->_wasInterruptedEarly;
}

- (BOOL)stateChangeInterruptionFlag
{
  return self->_stateChangeInterruptionFlag;
}

- (void)setStateChangeInterruptionFlag:(BOOL)a3
{
  self->_stateChangeInterruptionFlag = a3;
}

- (double)currentInterruptionTime
{
  return self->_currentInterruptionTime;
}

- (void)setCurrentInterruptionTime:(double)a3
{
  self->_currentInterruptionTime = a3;
}

- (double)previousInterruptionTime
{
  return self->_previousInterruptionTime;
}

- (void)setPreviousInterruptionTime:(double)a3
{
  self->_previousInterruptionTime = a3;
}

- (NSTimer)autoStopTimer
{
  return self->_autoStopTimer;
}

- (void)setAutoStopTimer:(id)a3
{
}

- (double)autoStopTimerPausedTime
{
  return self->_autoStopTimerPausedTime;
}

- (void)setAutoStopTimerPausedTime:(double)a3
{
  self->_autoStopTimerPausedTime = a3;
}

- (AVPlayerLayer)videoLayer
{
  return self->_videoLayer;
}

- (void)setVideoLayer:(id)a3
{
}

- (UIWindow)externalVideoWindow
{
  return self->_externalVideoWindow;
}

- (void)setExternalVideoWindow:(id)a3
{
}

- (double)durationBeforeItemLoaded
{
  return self->_durationBeforeItemLoaded;
}

- (void)setDurationBeforeItemLoaded:(double)a3
{
  self->_durationBeforeItemLoaded = a3;
}

- (float)scanRate
{
  return self->_scanRate;
}

- (void)setScanRate:(float)a3
{
  self->_scanRate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVideoWindow, 0);
  objc_storeStrong((id *)&self->_videoLayer, 0);
  objc_storeStrong((id *)&self->_autoStopTimer, 0);
  objc_storeStrong(&self->_nowPlayingInfoPeriodicTimeObserver, 0);
  objc_storeStrong(&self->_periodicTimeObserver, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_fadeOutTimer, 0);
  objc_storeStrong((id *)&self->_observingTimes, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong((id *)&self->_seekTimer, 0);
  objc_storeStrong((id *)&self->_hdcpTimer, 0);
  objc_storeStrong((id *)&self->_lastPlayingURL, 0);
  objc_storeStrong((id *)&self->_videoViewController, 0);
  objc_storeStrong(&self->_playbackErrorFallback, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_commandCenter, 0);
  objc_storeStrong((id *)&self->_infoCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_causalityObserver);
}

@end