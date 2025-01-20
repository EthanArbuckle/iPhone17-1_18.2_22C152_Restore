@interface SBMediaController
+ (BOOL)applicationCanBeConsideredNowPlaying:(id)a3;
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
+ (void)sendResetPlaybackTimeoutCommand;
- (BOOL)_sendMediaCommand:(unsigned int)a3 options:(id)a4;
- (BOOL)addTrackToWishListForEventSource:(int64_t)a3;
- (BOOL)banTrackForEventSource:(int64_t)a3;
- (BOOL)beginSeek:(int)a3 eventSource:(int64_t)a4;
- (BOOL)changeTrack:(int)a3 eventSource:(int64_t)a4;
- (BOOL)endSeek:(int)a3 eventSource:(int64_t)a4;
- (BOOL)handsetRouteIsSelected;
- (BOOL)hasTrack;
- (BOOL)isApplicationActivityActive;
- (BOOL)isFirstTrack;
- (BOOL)isLastTrack;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)likeTrackForEventSource:(int64_t)a3;
- (BOOL)pauseForEventSource:(int64_t)a3;
- (BOOL)playForEventSource:(int64_t)a3;
- (BOOL)routeOtherThanHandsetIsAvailable;
- (BOOL)setPlaybackSpeed:(int)a3 eventSource:(int64_t)a4;
- (BOOL)stopForEventSource:(int64_t)a3;
- (BOOL)suppressHUD;
- (BOOL)togglePlayPauseForEventSource:(int64_t)a3;
- (BOOL)toggleRepeatForEventSource:(int64_t)a3;
- (BOOL)toggleShuffleForEventSource:(int64_t)a3;
- (BOOL)volumeControlIsAvailable;
- (BOOL)wirelessDisplayRouteIsPicked;
- (NSDate)lastActivityDate;
- (SBApplication)nowPlayingApplication;
- (SBMediaController)init;
- (id)_nowPlayingInfo;
- (id)nameOfPickedRoute;
- (id)playingMediaType;
- (int)nowPlayingProcessPID;
- (void)_applicationActivityStatusDidChange:(id)a3;
- (void)_mediaRemoteNowPlayingApplicationDidChange:(id)a3;
- (void)_mediaRemoteNowPlayingApplicationIsPlayingDidChange:(id)a3;
- (void)_mediaRemoteNowPlayingInfoDidChange:(id)a3;
- (void)_nowPlayingAppDidExit:(id)a3;
- (void)_registerForNotifications;
- (void)_setNowPlayingApplication:(id)a3;
- (void)_unregisterForNotifications;
- (void)_updateLastRecentActivityDate;
- (void)cancelVolumeEvent;
- (void)dealloc;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setNowPlayingProcessPID:(int)a3;
- (void)setSuppressHUD:(BOOL)a3;
@end

@implementation SBMediaController

+ (id)sharedInstance
{
  if ([MEMORY[0x1E4F73138] inUserSessionLoginUI])
  {
    id v2 = 0;
  }
  else
  {
    v3 = (void *)__controllerInstance_1;
    if (!__controllerInstance_1)
    {
      kdebug_trace();
      v4 = objc_alloc_init(SBMediaController);
      v5 = (void *)__controllerInstance_1;
      __controllerInstance_1 = (uint64_t)v4;

      kdebug_trace();
      v3 = (void *)__controllerInstance_1;
    }
    id v2 = v3;
  }
  return v2;
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance_1;
}

- (SBMediaController)init
{
  v9.receiver = self;
  v9.super_class = (Class)SBMediaController;
  id v2 = [(SBMediaController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(SBMediaController *)v2 _registerForNotifications];
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F31850]) initWithName:@"SBMediaController"];
    routingController = v3->_routingController;
    v3->_routingController = (MPAVRoutingController *)v4;

    [(MPAVRoutingController *)v3->_routingController setDelegate:v3];
    uint64_t v6 = [(id)SBApp volumeControl];
    volumeControl = v3->_volumeControl;
    v3->_volumeControl = (SBVolumeControl *)v6;
  }
  return v3;
}

- (void)dealloc
{
  [(SBMediaController *)self _unregisterForNotifications];
  [(MPAVRoutingController *)self->_routingController setDelegate:0];
  nowPlayingInfo = self->_nowPlayingInfo;
  self->_nowPlayingInfo = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBMediaController;
  [(SBMediaController *)&v4 dealloc];
}

+ (BOOL)applicationCanBeConsideredNowPlaying:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 processState];
  if ([v4 isRunning]) {
    char v5 = [v4 isForeground];
  }
  else {
    char v5 = 0;
  }
  if ([v4 isRunning] && (objc_msgSend(v4, "isForeground") & 1) == 0)
  {
    v7 = [v3 info];
    char v6 = [v7 supportsAudioBackgroundMode];
  }
  else
  {
    char v6 = 0;
  }

  return v5 | v6;
}

+ (void)sendResetPlaybackTimeoutCommand
{
  id v2 = +[SBApplicationController sharedInstanceIfExists];
  id v3 = [v2 applicationWithBundleIdentifier:@"com.apple.Music"];
  objc_super v4 = [v3 processState];
  int v5 = [v4 pid];

  if (v5 >= 1)
  {
    int v6 = MRMediaRemoteSendCommand();
    v7 = SBLogCommon();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        objc_super v9 = "Successfully sent reset playback timeout command to Music app";
        v10 = (uint8_t *)&v14;
        v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
        _os_log_impl(&dword_1D85BA000, v11, v12, v9, v10, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = 0;
      objc_super v9 = "Unable to send reset playback timeout command to Music app.";
      v10 = (uint8_t *)&v13;
      v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }
}

- (id)_nowPlayingInfo
{
  int v3 = [(id)SBApp nowPlayingProcessPID];
  if (v3 == [(SBMediaController *)self nowPlayingProcessPID]) {
    objc_super v4 = self->_nowPlayingInfo;
  }
  else {
    objc_super v4 = 0;
  }
  return v4;
}

- (void)setNowPlayingInfo:(id)a3
{
  id v6 = a3;
  if ((-[NSDictionary isEqual:](self->_nowPlayingInfo, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_nowPlayingInfo, a3);
    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"SBMediaNowPlayingChangedNotification" object:self];
  }
}

- (BOOL)hasTrack
{
  id v2 = [(SBMediaController *)self _nowPlayingInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isFirstTrack
{
  BOOL v3 = [(SBMediaController *)self _nowPlayingInfo];
  objc_super v4 = [v3 objectForKey:@"isFirstTrack"];
  if (v4)
  {
    int v5 = [(SBMediaController *)self _nowPlayingInfo];
    id v6 = [v5 objectForKey:@"isFirstTrack"];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)isLastTrack
{
  BOOL v3 = [(SBMediaController *)self _nowPlayingInfo];
  objc_super v4 = [v3 objectForKey:@"isLastTrack"];
  if (v4)
  {
    int v5 = [(SBMediaController *)self _nowPlayingInfo];
    id v6 = [v5 objectForKey:@"isLastTrack"];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (id)playingMediaType
{
  id v2 = [(SBMediaController *)self _nowPlayingInfo];
  BOOL v3 = [v2 objectForKey:@"mediaType"];

  return v3;
}

- (BOOL)isPlaying
{
  return self->_lastNowPlayingAppIsPlaying;
}

- (BOOL)isPaused
{
  if (self->_lastNowPlayingAppIsPlaying) {
    return 0;
  }
  BOOL v3 = [(SBMediaController *)self _nowPlayingInfo];
  BOOL v2 = v3 != 0;

  return v2;
}

- (BOOL)isApplicationActivityActive
{
  return (self->_lastMediaRemoteAppActivityStatus - 1) < 2;
}

- (NSDate)lastActivityDate
{
  return self->_lastActivityDate;
}

- (BOOL)banTrackForEventSource:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F77770];
  if ((unint64_t)(a3 - 1) > 6) {
    objc_super v4 = @"unknown";
  }
  else {
    objc_super v4 = off_1E6AFC890[a3 - 1];
  }
  v9[0] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v6 = [(SBMediaController *)self _sendMediaCommand:22 options:v5];

  return v6;
}

- (BOOL)likeTrackForEventSource:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F77770];
  if ((unint64_t)(a3 - 1) > 6) {
    objc_super v4 = @"unknown";
  }
  else {
    objc_super v4 = off_1E6AFC890[a3 - 1];
  }
  v9[0] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v6 = [(SBMediaController *)self _sendMediaCommand:21 options:v5];

  return v6;
}

- (BOOL)addTrackToWishListForEventSource:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F77770];
  if ((unint64_t)(a3 - 1) > 6) {
    objc_super v4 = @"unknown";
  }
  else {
    objc_super v4 = off_1E6AFC890[a3 - 1];
  }
  v9[0] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v6 = [(SBMediaController *)self _sendMediaCommand:23 options:v5];

  return v6;
}

- (SBApplication)nowPlayingApplication
{
  if (self->_lastNowPlayingApplication)
  {
    if (+[SBMediaController applicationCanBeConsideredNowPlaying:](SBMediaController, "applicationCanBeConsideredNowPlaying:"))
    {
      BOOL v3 = self->_lastNowPlayingApplication;
      goto LABEL_8;
    }
    objc_super v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "nowplayingapp pid returned by mediaserverd was not actually a running app - probably background suspended - so returning nil", v6, 2u);
    }
  }
  BOOL v3 = 0;
LABEL_8:
  return v3;
}

- (BOOL)suppressHUD
{
  return self->_suppressHUD;
}

- (void)setSuppressHUD:(BOOL)a3
{
  if (self->_suppressHUD != a3)
  {
    self->_suppressHUD = a3;
    volumeControl = self->_volumeControl;
    if (a3) {
      [(SBVolumeControl *)volumeControl addAlwaysHiddenCategory:@"Audio/Video"];
    }
    else {
      [(SBVolumeControl *)volumeControl removeAlwaysHiddenCategory:@"Audio/Video"];
    }
  }
}

- (BOOL)_sendMediaCommand:(unsigned int)a3 options:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  char v7 = [v6 policyAggregator];
  char v8 = [v7 allowsCapability:6];

  if ((v8 & 1) == 0)
  {
    v11 = SBLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 67109378;
      unsigned int v15 = a3;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "_sendMediaCommand disallowed by policy; ignoring command:%d options:%{public}@",
        (uint8_t *)&v14,
        0x12u);
    }
    goto LABEL_10;
  }
  int v9 = MRMediaRemoteSendCommand();
  v10 = SBLogCommon();
  v11 = v10;
  if (!v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBMediaController _sendMediaCommand:options:]((uint64_t)v5, a3, v11);
    }
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 67109378;
    unsigned int v15 = a3;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_DEFAULT, "MRMediaRemoteSendCommand succeeded for command:%d options:%{public}@", (uint8_t *)&v14, 0x12u);
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)changeTrack:(int)a3 eventSource:(int64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    uint64_t v12 = *MEMORY[0x1E4F77770];
    if ((unint64_t)(a4 - 1) > 6) {
      id v5 = @"unknown";
    }
    else {
      id v5 = off_1E6AFC890[a4 - 1];
    }
    v13[0] = v5;
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v8 = self;
    uint64_t v9 = 109;
LABEL_8:
    BOOL v6 = [(SBMediaController *)v8 _sendMediaCommand:v9 options:v7];

    return v6;
  }
  if (a3 < 0)
  {
    uint64_t v12 = *MEMORY[0x1E4F77770];
    if ((unint64_t)(a4 - 1) > 6) {
      v11 = @"unknown";
    }
    else {
      v11 = off_1E6AFC890[a4 - 1];
    }
    v13[0] = v11;
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v8 = self;
    uint64_t v9 = 110;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)beginSeek:(int)a3 eventSource:(int64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    uint64_t v12 = *MEMORY[0x1E4F77770];
    if ((unint64_t)(a4 - 1) > 6) {
      id v5 = @"unknown";
    }
    else {
      id v5 = off_1E6AFC890[a4 - 1];
    }
    v13[0] = v5;
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v8 = self;
    uint64_t v9 = 8;
LABEL_8:
    BOOL v6 = [(SBMediaController *)v8 _sendMediaCommand:v9 options:v7];

    return v6;
  }
  if (a3 < 0)
  {
    uint64_t v12 = *MEMORY[0x1E4F77770];
    if ((unint64_t)(a4 - 1) > 6) {
      v11 = @"unknown";
    }
    else {
      v11 = off_1E6AFC890[a4 - 1];
    }
    v13[0] = v11;
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v8 = self;
    uint64_t v9 = 10;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)endSeek:(int)a3 eventSource:(int64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    uint64_t v12 = *MEMORY[0x1E4F77770];
    if ((unint64_t)(a4 - 1) > 6) {
      id v5 = @"unknown";
    }
    else {
      id v5 = off_1E6AFC890[a4 - 1];
    }
    v13[0] = v5;
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v8 = self;
    uint64_t v9 = 9;
LABEL_8:
    BOOL v6 = [(SBMediaController *)v8 _sendMediaCommand:v9 options:v7];

    return v6;
  }
  if (a3 < 0)
  {
    uint64_t v12 = *MEMORY[0x1E4F77770];
    if ((unint64_t)(a4 - 1) > 6) {
      v11 = @"unknown";
    }
    else {
      v11 = off_1E6AFC890[a4 - 1];
    }
    v13[0] = v11;
    char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    char v8 = self;
    uint64_t v9 = 11;
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)playForEventSource:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F77770];
  if ((unint64_t)(a3 - 1) > 6) {
    objc_super v4 = @"unknown";
  }
  else {
    objc_super v4 = off_1E6AFC890[a3 - 1];
  }
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v6 = [(SBMediaController *)self _sendMediaCommand:0 options:v5];

  return v6;
}

- (BOOL)pauseForEventSource:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F77770];
  if ((unint64_t)(a3 - 1) > 6) {
    objc_super v4 = @"unknown";
  }
  else {
    objc_super v4 = off_1E6AFC890[a3 - 1];
  }
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v6 = [(SBMediaController *)self _sendMediaCommand:1 options:v5];

  return v6;
}

- (BOOL)togglePlayPauseForEventSource:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F77770];
  if ((unint64_t)(a3 - 1) > 6) {
    objc_super v4 = @"unknown";
  }
  else {
    objc_super v4 = off_1E6AFC890[a3 - 1];
  }
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v6 = [(SBMediaController *)self _sendMediaCommand:2 options:v5];

  return v6;
}

- (BOOL)stopForEventSource:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F77770];
  if ((unint64_t)(a3 - 1) > 6) {
    objc_super v4 = @"unknown";
  }
  else {
    objc_super v4 = off_1E6AFC890[a3 - 1];
  }
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  BOOL v6 = [(SBMediaController *)self _sendMediaCommand:3 options:v5];

  return v6;
}

- (BOOL)toggleRepeatForEventSource:(int64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F77770];
  v9[0] = *MEMORY[0x1E4F772C0];
  v9[1] = v4;
  v10[0] = MEMORY[0x1E4F1CC38];
  if ((unint64_t)(a3 - 1) > 6) {
    id v5 = @"unknown";
  }
  else {
    id v5 = off_1E6AFC890[a3 - 1];
  }
  v10[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  BOOL v7 = [(SBMediaController *)self _sendMediaCommand:7 options:v6];

  return v7;
}

- (BOOL)toggleShuffleForEventSource:(int64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F77770];
  v9[0] = *MEMORY[0x1E4F772C8];
  v9[1] = v4;
  v10[0] = MEMORY[0x1E4F1CC38];
  if ((unint64_t)(a3 - 1) > 6) {
    id v5 = @"unknown";
  }
  else {
    id v5 = off_1E6AFC890[a3 - 1];
  }
  v10[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  BOOL v7 = [(SBMediaController *)self _sendMediaCommand:6 options:v6];

  return v7;
}

- (BOOL)setPlaybackSpeed:(int)a3 eventSource:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v15[2] = *MEMORY[0x1E4F143B8];
  BOOL v7 = +[SBSceneManagerCoordinator mainDisplaySceneManager];
  uint64_t v8 = [v7 policyAggregator];
  int v9 = [v8 allowsCapability:6];

  if (v9)
  {
    v14[0] = *MEMORY[0x1E4F77738];
    v10 = [NSNumber numberWithInt:v5];
    v15[0] = v10;
    v14[1] = *MEMORY[0x1E4F77770];
    if ((unint64_t)(a4 - 1) > 6) {
      v11 = @"unknown";
    }
    else {
      v11 = off_1E6AFC890[a4 - 1];
    }
    v15[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

    [(SBMediaController *)self _sendMediaCommand:19 options:v12];
  }
  return v9;
}

- (void)cancelVolumeEvent
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_increaseVolume object:0];
  BOOL v3 = (void *)MEMORY[0x1E4FBA8A8];
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel_decreaseVolume object:0];
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 postNotificationName:@"SBAudioRoutesChangedNotification" object:0];
}

- (BOOL)handsetRouteIsSelected
{
  return [(MPAVRoutingController *)self->_routingController handsetRouteIsPicked];
}

- (BOOL)volumeControlIsAvailable
{
  return [(MPAVRoutingController *)self->_routingController volumeControlIsAvailable];
}

- (BOOL)routeOtherThanHandsetIsAvailable
{
  return [(MPAVRoutingController *)self->_routingController routeOtherThanHandsetAvailable];
}

- (BOOL)wirelessDisplayRouteIsPicked
{
  return [(MPAVRoutingController *)self->_routingController wirelessDisplayRouteIsPicked];
}

- (id)nameOfPickedRoute
{
  BOOL v2 = [(MPAVRoutingController *)self->_routingController pickedRoute];
  id v3 = [v2 routeName];

  return v3;
}

- (void)_registerForNotifications
{
  [(SBMediaController *)self _unregisterForNotifications];
  MRMediaRemoteRegisterForNowPlayingNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)__mediaRemoteNowPlayingInfoDidChangeNotification, (CFStringRef)*MEMORY[0x1E4F774B8], 0, CFNotificationSuspensionBehaviorDrop);
  uint64_t v4 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)__mediaRemoteNowPlayingApplicationDidChangeNotification, (CFStringRef)*MEMORY[0x1E4F773C8], 0, CFNotificationSuspensionBehaviorDrop);
  uint64_t v5 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)__mediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification, (CFStringRef)*MEMORY[0x1E4F773D0], 0, CFNotificationSuspensionBehaviorDrop);
  BOOL v6 = CFNotificationCenterGetLocalCenter();
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F77150];
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)__applicationActivityStatusDidChangeNotification, v7, 0, CFNotificationSuspensionBehaviorDrop);
}

- (void)_unregisterForNotifications
{
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
}

- (void)_mediaRemoteNowPlayingInfoDidChange:(id)a3
{
}

void __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_cold_1(a3, v5);
    }
  }
  MRPlaybackQueueGetContentItemAtOffset();
  MRContentItemCopyNowPlayingInfo();
  MRMediaRemoteGetLocalOrigin();
  MRMediaRemoteGetNowPlayingClientForOrigin();
  BOOL v6 = *(const void **)(a1 + 40);
  if (v6) {
    CFRelease(v6);
  }
}

void __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_69(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_69_cold_1(a3, v5);
    }
  }
  uint64_t ProcessIdentifier = MRNowPlayingClientGetProcessIdentifier();
  if (BSPIDExists())
  {
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = *MEMORY[0x1E4F775A8];
      v10 = [v7 objectForKey:*MEMORY[0x1E4F775A8]];
      v11 = (void *)MEMORY[0x1E4F77580];
      if (v10)
      {
        uint64_t v12 = [v8 objectForKey:*MEMORY[0x1E4F77580]];
        if (v12)
        {
          __int16 v13 = [v8 objectForKey:*MEMORY[0x1E4F77608]];
          BOOL v14 = v13 != 0;
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }

      __int16 v16 = [v8 objectForKey:*MEMORY[0x1E4F77550]];
      unsigned int v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
      if (v14)
      {
        id v17 = [v8 objectForKey:*v11];
        int v18 = [v17 intValue];

        v19 = [v8 objectForKey:v9];
        LODWORD(v17) = [v19 intValue];

        v20 = [v8 objectForKey:*MEMORY[0x1E4F77608]];
        BOOL v21 = [v20 intValue] == v18;
        BOOL v22 = v17 == 1;
        BOOL v23 = v17 == 1 && v18 == 0;
        BOOL v24 = v22 && v21;
      }
      else
      {
        BOOL v23 = 0;
        BOOL v24 = 0;
      }
      v25 = [NSNumber numberWithInteger:v23];
      [v15 setObject:v25 forKey:@"isFirstTrack"];

      v26 = [NSNumber numberWithInteger:v24];
      [v15 setObject:v26 forKey:@"isLastTrack"];

      if (v16) {
        [v15 setObject:v16 forKey:@"mediaType"];
      }
    }
    else
    {
      unsigned int v15 = 0;
    }
    [(id)SBApp setNowPlayingInfo:v15 forProcessWithPID:ProcessIdentifier];
    [*(id *)(a1 + 32) setNowPlayingProcessPID:ProcessIdentifier];
  }
  else
  {
    [(id)SBApp setNowPlayingInfo:0 forProcessWithPID:0];
  }
  v27 = *(const void **)(a1 + 40);
  if (v27) {
    CFRelease(v27);
  }
}

- (void)_mediaRemoteNowPlayingApplicationDidChange:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F773E0]];
  uint64_t v5 = [v4 integerValue];

  BOOL v6 = +[SBApplicationController sharedInstance];
  id v7 = [v6 applicationWithPid:v5];

  [(SBMediaController *)self _setNowPlayingApplication:v7];
}

- (void)_setNowPlayingApplication:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (SBApplication *)a3;
  p_lastNowPlayingApplication = &self->_lastNowPlayingApplication;
  if (self->_lastNowPlayingApplication != v5)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:@"SBApplicationDidExitNotification" object:self->_lastNowPlayingApplication];
    [(SBApplication *)self->_lastNowPlayingApplication setPlayingAudio:0];
    objc_storeStrong((id *)&self->_lastNowPlayingApplication, a3);
    [(SBApplication *)self->_lastNowPlayingApplication setPlayingAudio:self->_lastNowPlayingAppIsPlaying];
    uint64_t v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *p_lastNowPlayingApplication;
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "now playing app is tracked as %@.", (uint8_t *)&v10, 0xCu);
    }

    if (*p_lastNowPlayingApplication) {
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__nowPlayingAppDidExit_, @"SBApplicationDidExitNotification");
    }
    [v7 postNotificationName:@"SBMediaNowPlayingAppChangedNotification" object:self];
  }
}

- (void)_mediaRemoteNowPlayingApplicationIsPlayingDidChange:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F773D8]];
  uint64_t v5 = [v4 BOOLValue];

  [(SBMediaController *)self _updateLastRecentActivityDate];
  if (self->_lastNowPlayingAppIsPlaying != v5)
  {
    self->_lastNowPlayingAppIsPlaying = v5;
    [(SBApplication *)self->_lastNowPlayingApplication setPlayingAudio:v5];
    BOOL v6 = +[SBIdleTimerGlobalCoordinator sharedInstance];
    [v6 resetIdleTimerForReason:@"MediaRemoteNowPlayingDidChange"];

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"SBMediaNowPlayingChangedNotification" object:self];
  }
}

- (void)_applicationActivityStatusDidChange:(id)a3
{
  if (![a3 objectForKey:*MEMORY[0x1E4F77158]])
  {
    self->_lastMediaRemoteAppActivityStatus = 0;
    return;
  }
  int v4 = MEMORY[0x1D9489950]();
  self->_lastMediaRemoteAppActivityStatus = v4;
  if ((v4 - 1) > 1)
  {
    if ((v4 - 3) > 1) {
      return;
    }
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = v5;
    BOOL v6 = @"SBMediaApplicationActivityDidEndNotification";
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = v5;
    BOOL v6 = @"SBMediaApplicationActivityDidBeginNotification";
  }
  [v5 postNotificationName:v6 object:self];
}

- (void)_nowPlayingAppDidExit:(id)a3
{
  lastNowPlayingApplication = self->_lastNowPlayingApplication;
  uint64_t v5 = [a3 object];

  if (lastNowPlayingApplication == v5)
  {
    [(SBApplication *)self->_lastNowPlayingApplication setPlayingAudio:0];
    [(SBMediaController *)self _setNowPlayingApplication:0];
  }
}

- (void)_updateLastRecentActivityDate
{
  id v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  lastActivityDate = self->_lastActivityDate;
  self->_lastActivityDate = v3;
}

- (int)nowPlayingProcessPID
{
  return self->_nowPlayingProcessPID;
}

- (void)setNowPlayingProcessPID:(int)a3
{
  self->_nowPlayingProcessPID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivityDate, 0);
  objc_storeStrong((id *)&self->_audioCategoryMusicVolume, 0);
  objc_storeStrong((id *)&self->_volumeControl, 0);
  objc_storeStrong((id *)&self->_routingController, 0);
  objc_storeStrong((id *)&self->_lastNowPlayingApplication, 0);
  objc_storeStrong((id *)&self->_volumeCommitTimer, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
}

- (void)_sendMediaCommand:(os_log_t)log options:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "MRMediaRemoteSendCommand failed for command:%d options:%{public}@", (uint8_t *)v3, 0x12u);
}

void __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Could not retrieve playback queue from Media Remote. Failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __57__SBMediaController__mediaRemoteNowPlayingInfoDidChange___block_invoke_69_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Could not retrieve now playing client. Failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end