@interface MediaInfo
- ($2825F4736939C4A6D3AD43837233062D)currentSettings;
- (MediaInfo)init;
- (MediaInfoDelegate)delegate;
- (NSDictionary)currentInfo;
- (NSString)currentIdentifier;
- (__CFArray)currentSupportedCommands;
- (double)preferredIntervalForCommand:(unsigned int)a3;
- (float)defaultPlaybackRate;
- (float)playbackRate;
- (id)playerElapsedTime;
- (id)playerName;
- (id)playerPlaybackState;
- (id)playerVolume;
- (id)queueCount;
- (id)queueIndex;
- (id)queueRepeatMode;
- (id)queueShuffleMode;
- (id)supportedCommands;
- (id)trackAlbum;
- (id)trackArtist;
- (id)trackDuration;
- (id)trackTitle;
- (unsigned)currentPlaybackState;
- (void)applicationDidChange:(id)a3;
- (void)avEffectiveVolumeDidChangeNotification:(id)a3;
- (void)avServerConnectionDiedNotification;
- (void)dealloc;
- (void)infoDidChange:(id)a3;
- (void)mrApplicationDidChangeNotification:(id)a3;
- (void)mrInfoDidChangeNotification;
- (void)mrPlaybackStateDidChangeNotification:(id)a3;
- (void)mrSupportedCommandsDidChangeNotification;
- (void)playbackStateDidChange:(unsigned int)a3;
- (void)registerForAVNotifications;
- (void)sendCommand:(unsigned __int8)a3;
- (void)setCurrentIdentifier:(id)a3;
- (void)setCurrentInfo:(id)a3;
- (void)setCurrentPlaybackState:(unsigned int)a3;
- (void)setCurrentSettings:(id)a3;
- (void)setCurrentSupportedCommands:(__CFArray *)a3;
- (void)setDelegate:(id)a3;
- (void)supportedCommandsDidChange:(__CFArray *)a3;
- (void)unregisterForAVNotifications;
- (void)volumeDidChangeForCategory:(id)a3;
@end

@implementation MediaInfo

- (MediaInfo)init
{
  v13.receiver = self;
  v13.super_class = (Class)MediaInfo;
  v2 = [(MediaInfo *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_currentPlaybackState = 0;
    v2->_currentSettings = ($8A243AA3C134A41ABEE9DB00E2BD061F)0x100000001;
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"mrSupportedCommandsDidChangeNotification" name:kMRMediaRemoteSupportedCommandsDidChangeNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v3 selector:"mrApplicationDidChangeNotification:" name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"mrPlaybackStateDidChangeNotification:" name:kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"mrInfoDidChangeNotification" name:kMRMediaRemoteNowPlayingInfoDidChangeNotification object:0];

    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
    v12 = v3;
    MRMediaRemoteCopySupportedCommands();
    MRMediaRemoteRegisterForNowPlayingNotifications();

    v11 = v12;
    MRMediaRemoteGetNowPlayingApplicationDisplayID();

    v10 = v11;
    MRMediaRemoteGetNowPlayingApplicationPlaybackState();

    v9 = v10;
    MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();

    [(MediaInfo *)v9 registerForAVNotifications];
  }
  return v3;
}

- (void)sendCommand:(unsigned __int8)a3
{
  switch(a3)
  {
    case 0u:
    case 1u:
    case 2u:
    case 3u:
    case 4u:
    case 7u:
    case 8u:
    case 0xBu:
    case 0xCu:
    case 0xDu:
      MRMediaRemoteSendCommand();
      return;
    case 5u:
      v3 = +[AVSystemController sharedAVSystemController];
      int v5 = 1031798784;
      goto LABEL_4;
    case 6u:
      v3 = +[AVSystemController sharedAVSystemController];
      int v5 = -1115684864;
LABEL_4:
      LODWORD(v4) = v5;
      [v3 changeVolumeBy:@"Audio/Video" forCategory:v4];

      return;
    case 9u:
      uint64_t v12 = kMRMediaRemoteOptionSkipInterval;
      [(MediaInfo *)self preferredIntervalForCommand:17];
      v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      objc_super v13 = v6;
      v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

      goto LABEL_9;
    case 0xAu:
      uint64_t v10 = kMRMediaRemoteOptionSkipInterval;
      [(MediaInfo *)self preferredIntervalForCommand:18];
      v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      v11 = v8;
      v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

LABEL_9:
      MRMediaRemoteSendCommand();

      break;
    default:
      return;
  }
}

- (id)supportedCommands
{
  v3 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", &off_1000B7878, &off_1000B7890, 0);
  $2825F4736939C4A6D3AD43837233062D v4 = [(MediaInfo *)self currentSettings];
  unsigned int var0 = v4.var0;
  unint64_t IntegerValueForKey = HIDWORD(*(unint64_t *)&v4);
  if ([(MediaInfo *)self currentSupportedCommands]
    && CFArrayGetCount([(MediaInfo *)self currentSupportedCommands]) >= 1)
  {
    CFIndex v7 = 0;
    do
    {
      CFArrayGetValueAtIndex([(MediaInfo *)self currentSupportedCommands], v7);
      int Command = MRMediaRemoteCommandInfoGetCommand();
      id v9 = &off_1000B78A8;
      switch(Command)
      {
        case 0:
          goto LABEL_16;
        case 1:
          id v9 = &off_1000B78C0;
          goto LABEL_16;
        case 2:
          id v9 = &off_1000B78D8;
          goto LABEL_16;
        case 4:
          id v9 = &off_1000B78F0;
          goto LABEL_16;
        case 5:
          id v9 = &off_1000B7908;
          goto LABEL_16;
        case 6:
          id v9 = &off_1000B7938;
          goto LABEL_16;
        case 7:
          id v9 = &off_1000B7920;
          goto LABEL_16;
        case 17:
          id v9 = &off_1000B7950;
          goto LABEL_16;
        case 18:
          id v9 = &off_1000B7968;
          goto LABEL_16;
        case 21:
          id v9 = &off_1000B7980;
          goto LABEL_16;
        case 22:
          id v9 = &off_1000B7998;
          goto LABEL_16;
        case 23:
          id v9 = &off_1000B79B0;
LABEL_16:
          [v3 addObject:v9];
          break;
        case 25:
          unsigned int var0 = MRMediaRemoteCommandInfoGetIntegerValueForKey();
          break;
        case 26:
          unint64_t IntegerValueForKey = MRMediaRemoteCommandInfoGetIntegerValueForKey();
          break;
        default:
          break;
      }
      ++v7;
    }
    while (v7 < CFArrayGetCount([(MediaInfo *)self currentSupportedCommands]));
  }
  [(MediaInfo *)self setCurrentSettings:var0 | (IntegerValueForKey << 32)];

  return v3;
}

- (id)playerName
{
  v3 = [(MediaInfo *)self currentIdentifier];

  if (v3)
  {
    $2825F4736939C4A6D3AD43837233062D v4 = [(MediaInfo *)self currentIdentifier];
    int v5 = +[LSApplicationProxy applicationProxyForIdentifier:v4];

    v6 = [v5 localizedName];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)playerPlaybackState
{
  [(MediaInfo *)self playbackRate];
  if (v3 < 0.0) {
    return &off_1000B78D8;
  }
  if (v3 == 0.0) {
    return &off_1000B78A8;
  }
  float v5 = v3;
  $2825F4736939C4A6D3AD43837233062D v4 = &off_1000B78C0;
  if (v3 > 1.0)
  {
    [(MediaInfo *)self defaultPlaybackRate];
    if (v5 != v6) {
      return &off_1000B78F0;
    }
  }
  return v4;
}

- (id)playerVolume
{
  int v7 = 0;
  v2 = +[AVSystemController sharedAVSystemController];
  unsigned int v3 = [v2 getVolume:&v7 forCategory:@"Audio/Video"];

  if (v3)
  {
    LODWORD(v4) = v7;
    float v5 = +[NSNumber numberWithFloat:v4];
  }
  else
  {
    float v5 = 0;
  }

  return v5;
}

- (id)playerElapsedTime
{
  unsigned int v3 = [(MediaInfo *)self currentInfo];
  double v4 = [v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTimestamp];

  if (v4)
  {
    float v5 = [(MediaInfo *)self currentInfo];
    float v6 = [v5 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoElapsedTime];

    if (v6)
    {
      [v6 doubleValue];
      double v8 = v7 + 0.0;
    }
    else
    {
      double v8 = 0.0;
    }
    [(MediaInfo *)self playbackRate];
    if (v10 != 0.0)
    {
      float v11 = v10;
      uint64_t v12 = +[NSDate date];
      [v12 timeIntervalSinceDate:v4];
      double v14 = v13;

      double v8 = v8 + v14 * v11;
    }
    id v9 = +[NSNumber numberWithDouble:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)queueIndex
{
  v2 = [(MediaInfo *)self currentInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoQueueIndex];

  return v3;
}

- (id)queueCount
{
  v2 = [(MediaInfo *)self currentInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTotalQueueCount];

  return v3;
}

- (id)queueShuffleMode
{
  unsigned int v2 = ((unint64_t)[(MediaInfo *)self currentSettings] >> 32) - 1;
  if (v2 > 2) {
    return 0;
  }
  else {
    return (&off_1000B2698)[v2];
  }
}

- (id)queueRepeatMode
{
  unsigned int v2 = [(MediaInfo *)self currentSettings] - 1;
  if (v2 > 2) {
    return 0;
  }
  else {
    return (&off_1000B2698)[v2];
  }
}

- (id)trackArtist
{
  unsigned int v2 = [(MediaInfo *)self currentInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoArtist];

  return v3;
}

- (id)trackAlbum
{
  unsigned int v2 = [(MediaInfo *)self currentInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoAlbum];

  return v3;
}

- (id)trackTitle
{
  unsigned int v2 = [(MediaInfo *)self currentInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTitle];

  return v3;
}

- (id)trackDuration
{
  unsigned int v2 = [(MediaInfo *)self currentInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDuration];

  return v3;
}

- (void)setCurrentSupportedCommands:(__CFArray *)a3
{
  currentSupportedCommands = self->_currentSupportedCommands;
  if (currentSupportedCommands) {
    CFRelease(currentSupportedCommands);
  }
  if (a3) {
    float v6 = (__CFArray *)CFRetain(a3);
  }
  else {
    float v6 = 0;
  }
  self->_currentSupportedCommands = v6;
}

- (void)dealloc
{
  [(MediaInfo *)self unregisterForAVNotifications];
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(MediaInfo *)self setCurrentSupportedCommands:0];
  v4.receiver = self;
  v4.super_class = (Class)MediaInfo;
  [(MediaInfo *)&v4 dealloc];
}

- (void)registerForAVNotifications
{
  v11[0] = AVSystemController_EffectiveVolumeDidChangeNotification;
  v11[1] = AVSystemController_ServerConnectionDiedNotification;
  unsigned int v3 = +[NSArray arrayWithObjects:v11 count:2];
  objc_super v4 = +[AVSystemController sharedAVSystemController];
  [v4 setAttribute:v3 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  float v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = AVSystemController_EffectiveVolumeDidChangeNotification;
  double v7 = +[AVSystemController sharedAVSystemController];
  [v5 addObserver:self selector:"avEffectiveVolumeDidChangeNotification:" name:v6 object:v7];

  double v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v9 = AVSystemController_ServerConnectionDiedNotification;
  float v10 = +[AVSystemController sharedAVSystemController];
  [v8 addObserver:self selector:"avServerConnectionDiedNotification" name:v9 object:v10];
}

- (void)unregisterForAVNotifications
{
  unsigned int v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:AVSystemController_EffectiveVolumeDidChangeNotification object:0];
}

- (void)supportedCommandsDidChange:(__CFArray *)a3
{
  [(MediaInfo *)self setCurrentSupportedCommands:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained supportedCommandsDidChange];
}

- (void)applicationDidChange:(id)a3
{
  if (!a3) {
    a3 = @"com.apple.Music";
  }
  [(MediaInfo *)self setCurrentIdentifier:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mediaPlayerDidChange];
}

- (void)playbackStateDidChange:(unsigned int)a3
{
  [(MediaInfo *)self setCurrentPlaybackState:*(void *)&a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mediaStateDidChange];
}

- (void)infoDidChange:(id)a3
{
  [(MediaInfo *)self setCurrentInfo:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained mediaInfoDidChange];
}

- (void)volumeDidChangeForCategory:(id)a3
{
  if ([a3 isEqualToString:@"Audio/Video"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained mediaVolumeDidChange];
  }
}

- (void)mrSupportedCommandsDidChangeNotification
{
}

- (void)mrApplicationDidChangeNotification:(id)a3
{
}

- (void)mrPlaybackStateDidChangeNotification:(id)a3
{
}

- (void)mrInfoDidChangeNotification
{
}

- (void)avEffectiveVolumeDidChangeNotification:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKeyedSubscript:AVSystemController_EffectiveVolumeNotificationParameter_Category];
  [(MediaInfo *)self volumeDidChangeForCategory:v4];
}

- (void)avServerConnectionDiedNotification
{
  [(MediaInfo *)self unregisterForAVNotifications];

  [(MediaInfo *)self registerForAVNotifications];
}

- (float)playbackRate
{
  unsigned int v3 = [(MediaInfo *)self currentInfo];
  id v4 = [v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoPlaybackRate];

  if (v4)
  {
    [v4 floatValue];
    float v6 = v5;
  }
  else if ([(MediaInfo *)self currentPlaybackState] == 1)
  {
    float v6 = 1.0;
  }
  else
  {
    float v6 = 0.0;
  }

  return v6;
}

- (float)defaultPlaybackRate
{
  unsigned int v2 = [(MediaInfo *)self currentInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate];

  if (v3)
  {
    [v3 floatValue];
    float v5 = v4;
  }
  else
  {
    float v5 = 1.0;
  }

  return v5;
}

- (double)preferredIntervalForCommand:(unsigned int)a3
{
  if (CFArrayGetCount([(MediaInfo *)self currentSupportedCommands]) < 1)
  {
LABEL_5:
    float v6 = 0;
  }
  else
  {
    CFIndex v5 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex([(MediaInfo *)self currentSupportedCommands], v5);
      if (MRMediaRemoteCommandInfoGetCommand() == a3) {
        break;
      }
      if (++v5 >= CFArrayGetCount([(MediaInfo *)self currentSupportedCommands])) {
        goto LABEL_5;
      }
    }
    float v6 = (void *)MRMediaRemoteCommandInfoCopyValueForKey();
  }
  double v7 = [v6 firstObject];
  double v8 = v7;
  if (v7)
  {
    [v7 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = 15.0;
  }

  return v10;
}

- (__CFArray)currentSupportedCommands
{
  return self->_currentSupportedCommands;
}

- (MediaInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaInfoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)currentIdentifier
{
  return self->_currentIdentifier;
}

- (void)setCurrentIdentifier:(id)a3
{
}

- (unsigned)currentPlaybackState
{
  return self->_currentPlaybackState;
}

- (void)setCurrentPlaybackState:(unsigned int)a3
{
  self->_currentPlaybackState = a3;
}

- (NSDictionary)currentInfo
{
  return self->_currentInfo;
}

- (void)setCurrentInfo:(id)a3
{
}

- ($2825F4736939C4A6D3AD43837233062D)currentSettings
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_currentSettings;
}

- (void)setCurrentSettings:(id)a3
{
  self->_currentSettings = ($8A243AA3C134A41ABEE9DB00E2BD061F)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInfo, 0);
  objc_storeStrong((id *)&self->_currentIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end