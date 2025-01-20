@interface BTAVRCP_NowPlayingInfo
- ($2825F4736939C4A6D3AD43837233062D)currentSettings;
- (BOOL)isBrowsablePlayer;
- (BOOL)isLocalOrigin;
- (BOOL)isMusicApp;
- (BOOL)mrAppIsPlaying;
- (BTAVRCP_NowPlayingInfo)init;
- (BTAVRCP_NowPlayingInfoDelegate)delegate;
- (NSDictionary)mrInfo;
- (NSSet)browsablePlayers;
- (NSString)currentArtworkIdentifier;
- (NSString)mrAppIdentifier;
- (float)_defaultPlaybackRate;
- (float)_playbackRate;
- (id)encodings;
- (id)heights;
- (id)playerName;
- (id)trackAlbum;
- (id)trackArtist;
- (id)trackDuration;
- (id)trackGenre;
- (id)trackImageHandle;
- (id)trackPosition;
- (id)trackQueueCount;
- (id)trackQueueIndex;
- (id)trackTitle;
- (id)widths;
- (int)playerId;
- (int64_t)currentPlaybackState;
- (int64_t)playbackState;
- (unint64_t)_getEncodingForMimeType:(id)a3;
- (unint64_t)_trackHash;
- (unint64_t)currentTrackHash;
- (unint64_t)trackId;
- (void)_activeOriginDidChange:(void *)a3;
- (void)_activeOriginDidChangeNotification;
- (void)_appDidChange:(id)a3;
- (void)_appDidChangeNotification:(id)a3;
- (void)_appIsPlayingDidChange:(BOOL)a3;
- (void)_appIsPlayingDidChangeNotification:(id)a3;
- (void)_infoDidChange:(id)a3;
- (void)_infoDidChangeNotification;
- (void)_initializeState;
- (void)_playbackQueueDidChange;
- (void)_playbackQueueDidChangeNotification;
- (void)_playbackStateDidChange;
- (void)_refreshActiveOrigin;
- (void)_refreshApp;
- (void)_refreshAppIsPlaying;
- (void)_refreshInfo;
- (void)_refreshSupportedCommands;
- (void)_settingsDidChange:(id)a3;
- (void)_supportedCommandsDidChange:(id)a3;
- (void)_supportedCommandsDidChangeNotification;
- (void)_trackDidChange;
- (void)dealloc;
- (void)mrActiveOrigin;
- (void)setCurrentArtworkIdentifier:(id)a3;
- (void)setCurrentPlaybackState:(int64_t)a3;
- (void)setCurrentSettings:(id)a3;
- (void)setCurrentTrackHash:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMrActiveOrigin:(void *)a3;
- (void)setMrAppIdentifier:(id)a3;
- (void)setMrAppIsPlaying:(BOOL)a3;
- (void)setMrInfo:(id)a3;
@end

@implementation BTAVRCP_NowPlayingInfo

- (BTAVRCP_NowPlayingInfo)init
{
  v14.receiver = self;
  v14.super_class = (Class)BTAVRCP_NowPlayingInfo;
  v2 = [(BTAVRCP_NowPlayingInfo *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSSet);
    v15[0] = off_10001F048;
    v15[1] = off_10001F050;
    v15[2] = off_10001F058;
    v4 = +[NSArray arrayWithObjects:v15 count:3];
    id v5 = [v3 initWithArray:v4];
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    objc_storeStrong((id *)v2 + 5, off_10001F048);
    v2[8] = 0;
    *(_OWORD *)(v2 + 56) = xmmword_1000141C0;
    *((void *)v2 + 9) = 0x100000001;
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_infoDidChangeNotification" name:kMRMediaRemoteNowPlayingInfoDidChangeNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_appDidChangeNotification:" name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_appIsPlayingDidChangeNotification:" name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_playbackQueueDidChangeNotification" name:MPMusicPlayerControllerQueueDidChangeNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_activeOriginDidChangeNotification" name:kMRMediaRemoteActiveOriginDidChangeNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_supportedCommandsDidChangeNotification" name:kMRMediaRemoteSupportedCommandsDidChangeNotification object:0];

    MRMediaRemoteRegisterForNowPlayingNotifications();
    MRMediaRemoteSetWantsOriginChangeNotifications();
    MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
    [v2 _initializeState];
  }
  return (BTAVRCP_NowPlayingInfo *)v2;
}

- (void)_initializeState
{
  id v3 = dispatch_get_global_queue(2, 0);
  v4 = objc_alloc_init(BTAVRCP_Syncifier);
  id v5 = [(BTAVRCP_Syncifier *)v4 createSwitcher];
  MRMediaRemoteGetNowPlayingInfoWithOptionalArtwork();
  id v6 = [(BTAVRCP_Syncifier *)v4 createSwitcher];
  MRMediaRemoteGetNowPlayingApplicationDisplayID();
  id v7 = [(BTAVRCP_Syncifier *)v4 createSwitcher];
  MRMediaRemoteGetNowPlayingApplicationIsPlaying();
  id v8 = [(BTAVRCP_Syncifier *)v4 createSwitcher];
  MRMediaRemoteGetActiveOrigin();
  id v9 = [(BTAVRCP_Syncifier *)v4 createSwitcher];
  MRMediaRemoteCopySupportedCommands();
  if (!-[BTAVRCP_Syncifier wait:](v4, "wait:", 3.0, _NSConcreteStackBlock, 3221225472, sub_10000D5D8, &unk_100018C98, self))
  {
    v10 = qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR)) {
      sub_10000FEEC(v10);
    }
  }
}

- (void)dealloc
{
  id v3 = qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_10000FF30(v3);
  }
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  MRMediaRemoteSetWantsOriginChangeNotifications();
  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  if ([(BTAVRCP_NowPlayingInfo *)self mrActiveOrigin]) {
    CFRelease([(BTAVRCP_NowPlayingInfo *)self mrActiveOrigin]);
  }
  v4.receiver = self;
  v4.super_class = (Class)BTAVRCP_NowPlayingInfo;
  [(BTAVRCP_NowPlayingInfo *)&v4 dealloc];
}

- (void)_refreshInfo
{
}

- (void)_refreshApp
{
}

- (void)_refreshAppIsPlaying
{
}

- (void)_refreshActiveOrigin
{
}

- (void)_refreshSupportedCommands
{
}

- (unint64_t)_getEncodingForMimeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"image/jpeg"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"image/png"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_infoDidChangeNotification
{
}

- (void)_appDidChangeNotification:(id)a3
{
}

- (void)_appIsPlayingDidChangeNotification:(id)a3
{
  unint64_t v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey];
  id v6 = [v5 BOOLValue];

  [(BTAVRCP_NowPlayingInfo *)self _appIsPlayingDidChange:v6];
}

- (void)_playbackQueueDidChangeNotification
{
}

- (void)_activeOriginDidChangeNotification
{
}

- (void)_supportedCommandsDidChangeNotification
{
}

- (void)_infoDidChange:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_10000FF74();
  }
  [(BTAVRCP_NowPlayingInfo *)self setMrInfo:v4];
  [(BTAVRCP_NowPlayingInfo *)self _playbackStateDidChange];
  [(BTAVRCP_NowPlayingInfo *)self _trackDidChange];
}

- (void)_appDidChange:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = v4;
  id v6 = off_10001F048;
  if (v4) {
    id v6 = v4;
  }
  id v7 = v6;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_10000FFDC();
  }
  id v8 = [(BTAVRCP_NowPlayingInfo *)self mrAppIdentifier];
  unsigned __int8 v9 = [(__CFString *)v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    [(BTAVRCP_NowPlayingInfo *)self setMrAppIdentifier:v7];
    v10 = [(BTAVRCP_NowPlayingInfo *)self delegate];
    [v10 playerDidChange:-[BTAVRCP_NowPlayingInfo playerId](self, "playerId")];
  }
}

- (void)_appIsPlayingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_100010044(v3, v5, v6, v7, v8, v9, v10, v11);
  }
  [(BTAVRCP_NowPlayingInfo *)self setMrAppIsPlaying:v3];
  [(BTAVRCP_NowPlayingInfo *)self _playbackStateDidChange];
  [(BTAVRCP_NowPlayingInfo *)self _trackDidChange];
}

- (void)_playbackQueueDidChange
{
  BOOL v3 = qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_1000100C8(v3);
  }
  id v4 = [(BTAVRCP_NowPlayingInfo *)self delegate];
  [v4 playbackQueueDidChange];
}

- (void)_activeOriginDidChange:(void *)a3
{
  id v5 = (void *)qword_10001F1C0;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_10001010C(v5, a3);
  }
  if ([(BTAVRCP_NowPlayingInfo *)self mrActiveOrigin] != a3)
  {
    if ([(BTAVRCP_NowPlayingInfo *)self mrActiveOrigin]) {
      CFRelease([(BTAVRCP_NowPlayingInfo *)self mrActiveOrigin]);
    }
    [(BTAVRCP_NowPlayingInfo *)self setMrActiveOrigin:a3];
    if ([(BTAVRCP_NowPlayingInfo *)self mrActiveOrigin]) {
      CFRetain([(BTAVRCP_NowPlayingInfo *)self mrActiveOrigin]);
    }
  }
}

- (void)_supportedCommandsDidChange:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_DEBUG)) {
    sub_1000101AC();
  }
  if ([v4 count])
  {
    unint64_t v5 = 0;
    unsigned int v6 = 1;
    uint64_t IntegerValueForKey = 1;
    do
    {
      [v4 objectAtIndex:v5];
      int Command = MRMediaRemoteCommandInfoGetCommand();
      if (Command == 26)
      {
        uint64_t IntegerValueForKey = MRMediaRemoteCommandInfoGetIntegerValueForKey();
      }
      else if (Command == 25)
      {
        unsigned int v6 = MRMediaRemoteCommandInfoGetIntegerValueForKey();
      }
      ++v5;
    }
    while (v5 < (unint64_t)[v4 count]);
  }
  else
  {
    uint64_t IntegerValueForKey = 1;
    unsigned int v6 = 1;
  }
  [(BTAVRCP_NowPlayingInfo *)self _settingsDidChange:v6 | (unint64_t)(IntegerValueForKey << 32)];
}

- (id)trackTitle
{
  v2 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTitle];

  return v3;
}

- (id)trackAlbum
{
  BOOL v3 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  id v4 = [v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoAlbum];

  if (!v4)
  {
    unint64_t v5 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    id v4 = [v5 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoRadioStationName];
  }

  return v4;
}

- (id)trackArtist
{
  v2 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoArtist];

  return v3;
}

- (id)trackGenre
{
  v2 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoGenre];

  return v3;
}

- (id)trackQueueIndex
{
  BOOL v3 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  id v4 = [v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoQueueIndex];

  if (v4)
  {
    unint64_t v5 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v4 unsignedIntValue] + 1);
  }
  else
  {
    unsigned int v6 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    unint64_t v5 = [v6 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTrackNumber];
  }

  return v5;
}

- (id)trackQueueCount
{
  BOOL v3 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  id v4 = [v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoQueueIndex];

  unint64_t v5 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  unsigned int v6 = v5;
  uint64_t v7 = &kMRMediaRemoteNowPlayingInfoTotalTrackCount;
  if (v4) {
    uint64_t v7 = &kMRMediaRemoteNowPlayingInfoTotalQueueCount;
  }
  uint64_t v8 = [v5 objectForKeyedSubscript:*v7];

  return v8;
}

- (id)trackDuration
{
  v2 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDuration];

  if (v3)
  {
    [v3 doubleValue];
    unint64_t v5 = +[NSNumber numberWithDouble:v4 * 1000.0];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)trackPosition
{
  BOOL v3 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  double v4 = [v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTimestamp];

  if (v4)
  {
    unint64_t v5 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    unsigned int v6 = [v5 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoElapsedTime];

    if (v6)
    {
      [v6 doubleValue];
      double v8 = v7 * 1000.0 + 0.0;
    }
    else
    {
      double v8 = 0.0;
    }
    [(BTAVRCP_NowPlayingInfo *)self _playbackRate];
    if (v10 != 0.0)
    {
      float v11 = v10;
      v12 = +[NSDate date];
      [v12 timeIntervalSinceDate:v4];
      double v14 = v13;

      double v8 = v8 + v14 * v11 * 1000.0;
    }
    uint64_t v9 = +[NSNumber numberWithDouble:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)trackImageHandle
{
  BOOL v3 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  double v4 = [v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoArtworkIdentifier];

  if (v4)
  {
    currentArtworkIdentifier = self->_currentArtworkIdentifier;
    p_currentArtworkIdentifier = &self->_currentArtworkIdentifier;
    if (([v4 isEqualToString:currentArtworkIdentifier] & 1) == 0)
    {
      ++qword_10001F180;
      objc_storeStrong((id *)p_currentArtworkIdentifier, v4);
    }
    double v7 = +[NSString stringWithFormat:@"%tu", qword_10001F180];
  }
  else
  {
    double v8 = qword_10001F1C0;
    if (os_log_type_enabled((os_log_t)qword_10001F1C0, OS_LOG_TYPE_ERROR)) {
      sub_100010214((uint64_t)self, v8);
    }
    double v7 = 0;
  }

  return v7;
}

- (BOOL)isBrowsablePlayer
{
  BOOL v3 = [(BTAVRCP_NowPlayingInfo *)self browsablePlayers];
  double v4 = [(BTAVRCP_NowPlayingInfo *)self mrAppIdentifier];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (int)playerId
{
  if ([(BTAVRCP_NowPlayingInfo *)self isBrowsablePlayer]) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)playerName
{
  v2 = [(BTAVRCP_NowPlayingInfo *)self mrAppIdentifier];
  BOOL v3 = +[LSApplicationProxy applicationProxyForIdentifier:v2];

  double v4 = [v3 localizedName];

  if (v4)
  {
    unsigned __int8 v5 = [v3 localizedName];
  }
  else
  {
    unsigned int v6 = +[NSBundle mobileBluetoothBundle];
    unsigned __int8 v5 = [v6 localizedStringForKey:@"UNKNOWN_MEDIA_PLAYER" value:@"Unknown Media Player" table:0];
  }

  return v5;
}

- (float)_playbackRate
{
  BOOL v3 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  double v4 = [v3 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoPlaybackRate];

  if (v4)
  {
    [v4 floatValue];
    float v6 = v5;
  }
  else if ([(BTAVRCP_NowPlayingInfo *)self mrAppIsPlaying])
  {
    float v6 = 1.0;
  }
  else
  {
    float v6 = 0.0;
  }

  return v6;
}

- (float)_defaultPlaybackRate
{
  v2 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  BOOL v3 = [v2 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDefaultPlaybackRate];

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

- (int64_t)playbackState
{
  if (![(BTAVRCP_NowPlayingInfo *)self mrAppIsPlaying]) {
    return 2 * ([(BTAVRCP_NowPlayingInfo *)self trackId] != -1);
  }
  [(BTAVRCP_NowPlayingInfo *)self _playbackRate];
  if (v3 < 0.0) {
    return 4;
  }
  float v5 = v3;
  if (v3 <= 1.0) {
    return 1;
  }
  [(BTAVRCP_NowPlayingInfo *)self _defaultPlaybackRate];
  if (v5 <= v6) {
    return 1;
  }
  else {
    return 3;
  }
}

- (void)_playbackStateDidChange
{
  float v3 = [(BTAVRCP_NowPlayingInfo *)self playbackState];
  if (v3 != (void *)[(BTAVRCP_NowPlayingInfo *)self currentPlaybackState])
  {
    [(BTAVRCP_NowPlayingInfo *)self setCurrentPlaybackState:v3];
    id v4 = [(BTAVRCP_NowPlayingInfo *)self delegate];
    [v4 playbackStateDidChange:v3];
  }
}

- (unint64_t)_trackHash
{
  float v3 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];

  if (v3)
  {
    v31 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    v30 = [v31 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoAlbum];
    unint64_t v4 = (unint64_t)[v30 hash];
    v29 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    v28 = [v29 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoArtist];
    unint64_t v5 = (unint64_t)[v28 hash] ^ v4;
    v27 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    v26 = [v27 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTitle];
    unint64_t v6 = (unint64_t)[v26 hash];
    v25 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    v24 = [v25 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoGenre];
    unint64_t v7 = v5 ^ v6 ^ (unint64_t)[v24 hash];
    v23 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    v22 = [v23 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoQueueIndex];
    unint64_t v8 = (unint64_t)[v22 hash];
    v21 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    uint64_t v9 = [v21 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTotalQueueCount];
    unint64_t v10 = v8 ^ (unint64_t)[v9 hash];
    float v11 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    v12 = [v11 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTrackNumber];
    unint64_t v13 = v7 ^ v10 ^ (unint64_t)[v12 hash];
    double v14 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    v15 = [v14 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTotalTrackCount];
    unint64_t v16 = (unint64_t)[v15 hash];
    v17 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    v18 = [v17 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDuration];
    unint64_t v19 = v13 ^ v16 ^ (unint64_t)[v18 hash];
  }
  else if ([(BTAVRCP_NowPlayingInfo *)self isBrowsablePlayer])
  {
    return -1;
  }
  else
  {
    return [(BTAVRCP_NowPlayingInfo *)self mrAppIsPlaying] - 1;
  }
  return v19;
}

- (unint64_t)trackId
{
  unsigned int v3 = [(BTAVRCP_NowPlayingInfo *)self isBrowsablePlayer];
  unint64_t v4 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
  unint64_t v5 = v4;
  if (v3)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoUniqueIdentifier];

    if (v6) {
      goto LABEL_7;
    }
    unint64_t v7 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    unint64_t v6 = [v7 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoiTunesStoreIdentifier];

    if (v6) {
      goto LABEL_7;
    }
    unint64_t v8 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    unint64_t v6 = [v8 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoExternalContentIdentifier];

    if (v6) {
      goto LABEL_7;
    }
    uint64_t v9 = [(BTAVRCP_NowPlayingInfo *)self mrInfo];
    unint64_t v6 = [v9 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoiTunesStoreSubscriptionAdamIdentifier];

    if (v6
      || ([(BTAVRCP_NowPlayingInfo *)self mrInfo],
          unint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v10 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoRadioStationIdentifier],
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          v10,
          v6))
    {
LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v11 = [v6 unsignedLongLongValue];
      }
      else {
        id v11 = [v6 hash];
      }
      unint64_t v12 = (unint64_t)v11;
    }
    else
    {
      return -1;
    }
  }
  else if (v4)
  {

    return 0;
  }
  else
  {
    return [(BTAVRCP_NowPlayingInfo *)self mrAppIsPlaying] - 1;
  }
  return v12;
}

- (void)_trackDidChange
{
  unsigned int v3 = [(BTAVRCP_NowPlayingInfo *)self _trackHash];
  if (v3 != (void *)[(BTAVRCP_NowPlayingInfo *)self currentTrackHash])
  {
    [(BTAVRCP_NowPlayingInfo *)self setCurrentTrackHash:v3];
    id v4 = [(BTAVRCP_NowPlayingInfo *)self delegate];
    [v4 trackDidChange:-[BTAVRCP_NowPlayingInfo trackId](self, "trackId")];
  }
}

- (void)_settingsDidChange:(id)a3
{
  if (a3.var0 != [(BTAVRCP_NowPlayingInfo *)self currentSettings]
    || a3.var1 != (unint64_t)[(BTAVRCP_NowPlayingInfo *)self currentSettings] >> 32)
  {
    [(BTAVRCP_NowPlayingInfo *)self setCurrentSettings:a3];
    id v5 = [(BTAVRCP_NowPlayingInfo *)self delegate];
    [v5 settingsDidChange:-[BTAVRCP_NowPlayingInfo currentSettings](self, "currentSettings")];
  }
}

- (BOOL)isLocalOrigin
{
  return MROriginIsLocalOrigin() != 0;
}

- (BOOL)isMusicApp
{
  v2 = [(BTAVRCP_NowPlayingInfo *)self mrAppIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:off_10001F048];

  return v3;
}

- (id)encodings
{
  return &off_100019C00;
}

- (id)widths
{
  return &off_100019C18;
}

- (id)heights
{
  return &off_100019C30;
}

- (BTAVRCP_NowPlayingInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BTAVRCP_NowPlayingInfoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)browsablePlayers
{
  return self->_browsablePlayers;
}

- (NSDictionary)mrInfo
{
  return self->_mrInfo;
}

- (void)setMrInfo:(id)a3
{
}

- (NSString)mrAppIdentifier
{
  return self->_mrAppIdentifier;
}

- (void)setMrAppIdentifier:(id)a3
{
}

- (BOOL)mrAppIsPlaying
{
  return self->_mrAppIsPlaying;
}

- (void)setMrAppIsPlaying:(BOOL)a3
{
  self->_mrAppIsPlaying = a3;
}

- (void)mrActiveOrigin
{
  return self->_mrActiveOrigin;
}

- (void)setMrActiveOrigin:(void *)a3
{
  self->_mrActiveOrigin = a3;
}

- (int64_t)currentPlaybackState
{
  return self->_currentPlaybackState;
}

- (void)setCurrentPlaybackState:(int64_t)a3
{
  self->_currentPlaybackState = a3;
}

- (unint64_t)currentTrackHash
{
  return self->_currentTrackHash;
}

- (void)setCurrentTrackHash:(unint64_t)a3
{
  self->_currentTrackHash = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)currentSettings
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_currentSettings;
}

- (void)setCurrentSettings:(id)a3
{
  self->_currentSettings = ($8A243AA3C134A41ABEE9DB00E2BD061F)a3;
}

- (NSString)currentArtworkIdentifier
{
  return self->_currentArtworkIdentifier;
}

- (void)setCurrentArtworkIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentArtworkIdentifier, 0);
  objc_storeStrong((id *)&self->_mrAppIdentifier, 0);
  objc_storeStrong((id *)&self->_mrInfo, 0);
  objc_storeStrong((id *)&self->_browsablePlayers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end