@interface MRDNowPlayingPlayerClient
- (BOOL)_onQueue_isPlaying;
- (BOOL)canBeNowPlayingPlayer;
- (BOOL)hasNowPlayingData;
- (BOOL)isPictureInPictureEnabled;
- (BOOL)isPlaying;
- (BOOL)pushStateCanBeNowPlayingPlayer;
- (BOOL)pushStateHasNowPlayingData;
- (BOOL)pushStateIsPlaying;
- (BOOL)pushStatePictureInPictureEnabled;
- (MRContentItem)nowPlayingContentItem;
- (MRDNowPlayingPlayerClient)initWithPlayerPath:(id)a3;
- (MRDNowPlayingPlayerClientDelegate)delegate;
- (MRDNowPlayingPlayerClientPlaybackState)pushStatePlaybackState;
- (MRDPlaybackQueueParticipantDataSource)participantDataSource;
- (MRDPlaybackQueueRemoteParticipantDataSource)remoteParticipantDataSource;
- (MRNowPlayingState)nowPlayingState;
- (MRPlaybackQueue)playbackQueue;
- (MRPlaybackQueueSubscriptionController)subscriptionController;
- (MRPlayer)player;
- (MRPlayer)pushStatePlayer;
- (MRPlayerPath)playerPath;
- (NSArray)participants;
- (NSArray)snapshots;
- (NSArray)supportedRemoteControlCommands;
- (NSData)supportedRemoteControlCommandsData;
- (NSDate)canBeNowPlayingPlayerTimestamp;
- (NSDate)lastPlayingDate;
- (NSDate)playbackStateTimestamp;
- (NSMapTable)handoffSessions;
- (NSString)description;
- (double)timeSincePlaying;
- (id)_onQueue_lastPlayingDate;
- (id)_onQueue_playbackState;
- (id)_sortSnapshots:(id)a3;
- (id)activeContent;
- (id)handleHandoffEvent:(id)a3;
- (id)playbackQueueForRequest:(id)a3 cachingPolicy:(unsigned int)a4 playerPath:(id)a5 partiallyCachedItems:(id *)a6;
- (id)snapshotForIsPlaying:(BOOL)a3;
- (id)snapshotForPlaybackState:(unsigned int)a3;
- (id)snapshotsForIsPlaying:(BOOL)a3;
- (unint64_t)playbackQueueCapabilities;
- (unsigned)inferredPlaybackState;
- (unsigned)playbackState;
- (void)_handleNowPlayingAppDidChange:(id)a3;
- (void)_onQueue_canBeNowPlayingDidChange:(BOOL)a3;
- (void)_onQueue_isPlayingDidChange:(BOOL)a3;
- (void)_onQueue_pictureInPictureEnabledDidChanged:(BOOL)a3;
- (void)_onQueue_playbackQueueCapabilitiesDidChange:(unint64_t)a3;
- (void)_onQueue_playbackQueueContentItemsArtworkDidChange:(id)a3;
- (void)_onQueue_playbackQueueContentItemsDidChange:(id)a3;
- (void)_onQueue_playbackQueueDidChange:(id)a3 nowPlayingItemChanged:(BOOL)a4;
- (void)_onQueue_playbackStateDidChanged:(id)a3;
- (void)_onQueue_popState;
- (void)_onQueue_pushState;
- (void)_onQueue_supportedCommandsDidChange:(id)a3;
- (void)_onQueue_updatePlaybackQueue:(id)a3 fromRequest:(id)a4;
- (void)dataSource:(id)a3 didUpdateParticipants:(id)a4;
- (void)notifyArtworkChangedForContentItems:(id)a3;
- (void)registerHandoffSession:(id)a3;
- (void)setCanBeNowPlayingPlayer:(BOOL)a3;
- (void)setCanBeNowPlayingPlayerTimestamp:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInferredPlaybackState:(unsigned int)a3;
- (void)setParticipantDataSource:(id)a3;
- (void)setPictureInPictureEnabled:(BOOL)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackQueueCapabilities:(unint64_t)a3;
- (void)setPlayerPath:(id)a3;
- (void)setPushStateCanBeNowPlayingPlayer:(BOOL)a3;
- (void)setPushStateHasNowPlayingData:(BOOL)a3;
- (void)setPushStateIsPlaying:(BOOL)a3;
- (void)setPushStatePictureInPictureEnabled:(BOOL)a3;
- (void)setPushStatePlaybackState:(id)a3;
- (void)setPushStatePlayer:(id)a3;
- (void)setSupportedRemoteControlCommands:(id)a3;
- (void)setSupportedRemoteControlCommandsData:(id)a3;
- (void)updateClient:(id)a3;
- (void)updateLastPlayingDate:(id)a3;
- (void)updatePlaybackQueue:(id)a3;
- (void)updatePlaybackQueue:(id)a3 fromRequest:(id)a4;
- (void)updatePlaybackState:(unsigned int)a3 date:(id)a4;
- (void)updatePlayer:(id)a3;
@end

@implementation MRDNowPlayingPlayerClient

- (id)activeContent
{
  v2 = [(MRDNowPlayingPlayerClient *)self playbackQueue];
  v3 = [v2 contentItemWithOffset:0];
  v4 = [v3 metadata];
  v5 = [v4 title];

  return v5;
}

- (MRDNowPlayingPlayerClient)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)MRDNowPlayingPlayerClient;
  v5 = [(MRDNowPlayingPlayerClient *)&v48 init];
  if (v5)
  {
    v6 = [v4 client];
    unsigned int v7 = [v6 processIdentifier];
    pid_t v8 = getpid();

    if (v7 == v8 && (MSVDeviceOSIsInternalInstall() & 1) == 0)
    {
      v9 = _MRLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10032B3CC(v9);
      }
    }
    v10 = (MRPlayerPath *)[v4 copy];
    playerPath = v5->_playerPath;
    v5->_playerPath = v10;

    id v12 = objc_alloc((Class)NSString);
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = [v4 description];
    id v16 = [v12 initWithFormat:@"com.apple.mediaremote.%@.%@", v14, v15];

    id v17 = v16;
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v20;

    v22 = (MRPlaybackQueueSubscriptionController *)[objc_alloc((Class)MRPlaybackQueueSubscriptionController) initWithPlayerPath:v4];
    subscriptionController = v5->_subscriptionController;
    v5->_subscriptionController = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    playbackStateHistory = v5->_playbackStateHistory;
    v5->_playbackStateHistory = v24;

    uint64_t v26 = +[NSDate distantPast];
    lastPlayingDate = v5->_lastPlayingDate;
    v5->_lastPlayingDate = (NSDate *)v26;

    v28 = [v4 client];
    LODWORD(v19) = [v28 isSystemMediaApplication];

    if (!v19) {
      goto LABEL_20;
    }
    v29 = +[MRUserSettings currentSettings];
    unsigned __int8 v30 = [v29 supportMultiplayerHost];

    v31 = [v4 origin];
    v32 = v31;
    if (v30)
    {
      unsigned int v33 = [v31 isHosted];

      if (v33)
      {
        v34 = [[MRDPlaybackQueueParticipantDataSource alloc] initWithDelegate:v5];
        participantDataSource = v5->_participantDataSource;
        v5->_participantDataSource = v34;

        p_super = _MRLogForCategory();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          v37 = v5->_participantDataSource;
          *(_DWORD *)buf = 138543618;
          v50 = v37;
          __int16 v51 = 2114;
          id v52 = v4;
          v38 = "[MRDNowPlayingPlayerClient] Installed MRDPlaybackQueueParticipantDataSource: %{public}@ on %{public}@ be"
                "cause - LocallyHosted origin";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, v38, buf, 0x16u);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
    }
    else
    {
      unsigned int v39 = [v31 isLocal];

      if (v39)
      {
        v40 = [[MRDPlaybackQueueParticipantDataSource alloc] initWithDelegate:v5];
        v41 = v5->_participantDataSource;
        v5->_participantDataSource = v40;

        p_super = _MRLogForCategory();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          v42 = v5->_participantDataSource;
          *(_DWORD *)buf = 138543618;
          v50 = v42;
          __int16 v51 = 2114;
          id v52 = v4;
          v38 = "[MRDNowPlayingPlayerClient] Installed MRDPlaybackQueueParticipantDataSource: %{public}@ on %{public}@ be"
                "cause - LOCL origin";
          goto LABEL_15;
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    p_super = [v4 origin];
    if (([p_super isLocal] & 1) == 0)
    {
      v43 = [v4 origin];
      unsigned __int8 v44 = [v43 isLocallyHosted];

      if (v44)
      {
LABEL_20:
        v46 = +[NSNotificationCenter defaultCenter];
        [v46 addObserver:v5 selector:"_handleNowPlayingAppDidChange:" name:kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification object:0];

        goto LABEL_21;
      }
      v45 = [[MRDPlaybackQueueRemoteParticipantDataSource alloc] initWithDelegate:v5];
      p_super = &v5->_remoteParticipantDataSource->super;
      v5->_remoteParticipantDataSource = v45;
    }
    goto LABEL_19;
  }
LABEL_21:

  return v5;
}

- (NSString)description
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unsigned int v7 = sub_100046398;
  pid_t v8 = sub_1000463A8;
  id v9 = objc_alloc_init((Class)NSMutableString);
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

- (NSData)supportedRemoteControlCommandsData
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unsigned int v7 = sub_100046398;
  pid_t v8 = sub_1000463A8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSData *)v2;
}

- (MRPlayerPath)playerPath
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unsigned int v7 = sub_100046398;
  pid_t v8 = sub_1000463A8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRPlayerPath *)v2;
}

- (MRPlayer)player
{
  id v2 = [(MRDNowPlayingPlayerClient *)self playerPath];
  v3 = [v2 player];

  return (MRPlayer *)v3;
}

- (NSArray)supportedRemoteControlCommands
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unsigned int v7 = sub_100046398;
  pid_t v8 = sub_1000463A8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSArray *)v2;
}

- (void)setSupportedRemoteControlCommands:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)setSupportedRemoteControlCommandsData:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)setPlaybackQueue:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (MRPlaybackQueue)playbackQueue
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  unsigned int v7 = sub_100046398;
  pid_t v8 = sub_1000463A8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRPlaybackQueue *)v2;
}

- (MRContentItem)nowPlayingContentItem
{
  id v2 = [(MRDNowPlayingPlayerClient *)self playbackQueue];
  id v3 = [v2 contentItemWithOffset:0];

  return (MRContentItem *)v3;
}

- (void)setInferredPlaybackState:(unsigned int)a3
{
}

- (unsigned)inferredPlaybackState
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  pid_t v8 = sub_100046398;
  id v9 = sub_1000463A8;
  id v10 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = objc_msgSend((id)v6[5], "playbackState", _NSConcreteStackBlock, 3221225472, sub_1000478CC, &unk_100415CF0, self, &v5);
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)updatePlaybackState:(unsigned int)a3 date:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  msv_dispatch_sync_on_queue();
}

- (void)updateLastPlayingDate:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100047C08;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (BOOL)canBeNowPlayingPlayer
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)setCanBeNowPlayingPlayer:(BOOL)a3
{
}

- (NSDate)canBeNowPlayingPlayerTimestamp
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  char v7 = sub_100046398;
  id v8 = sub_1000463A8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSDate *)v2;
}

- (void)setCanBeNowPlayingPlayerTimestamp:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (unsigned)playbackState
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100046398;
  id v9 = sub_1000463A8;
  id v10 = 0;
  msv_dispatch_sync_on_queue();
  unsigned int v2 = objc_msgSend((id)v6[5], "playbackState", _NSConcreteStackBlock, 3221225472, sub_1000480B8, &unk_100415CF0, self, &v5);
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (NSDate)playbackStateTimestamp
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100046398;
  id v10 = sub_1000463A8;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000481F4;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDate *)v3;
}

- (id)_onQueue_playbackState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = self->_playerPlaybackState;
  if (![(MRDNowPlayingPlayerClientPlaybackState *)v3 playbackState])
  {
    id v4 = self->_inferredPlayerPlaybackState;

    id v3 = v4;
  }
  if (![(MRDNowPlayingPlayerClientPlaybackState *)v3 playbackState])
  {
    uint64_t v5 = +[NSDate date];
    uint64_t v6 = [(MRDPlaybackQueue *)self->_playbackQueueInternal playbackQueue];
    uint64_t v7 = [v6 contentItemWithOffset:0];

    uint64_t v8 = [v7 metadata];
    unsigned int v9 = [v8 hasPlaybackRate];

    if (v9)
    {
      MRContentItemGetPlaybackRate();
      if (fabsf(v10) > 0.00000011921) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    id v12 = [v7 metadata];
    unsigned int v13 = [v12 hasElapsedTimeTimestamp];

    if (v13)
    {
      id v14 = objc_alloc((Class)NSDate);
      v15 = [v7 metadata];
      [v15 elapsedTimeTimestamp];
      id v16 = objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:");

      uint64_t v5 = v16;
    }
    id v17 = [[MRDNowPlayingPlayerClientPlaybackState alloc] initWithPlaybackState:v11 date:v5];

    id v3 = v17;
  }

  return v3;
}

- (void)setPlaybackQueueCapabilities:(unint64_t)a3
{
}

- (unint64_t)playbackQueueCapabilities
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  msv_dispatch_sync_on_queue();
  unint64_t v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)isPlaying
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)_onQueue_isPlaying
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v3 = [(MRDNowPlayingPlayerClient *)self _onQueue_playbackState];
  [v3 playbackState];
  char IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing();

  return IsAdvancing;
}

- (BOOL)isPictureInPictureEnabled
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)hasNowPlayingData
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  msv_dispatch_sync_on_queue();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (MRNowPlayingState)nowPlayingState
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  char v7 = sub_100046398;
  uint64_t v8 = sub_1000463A8;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRNowPlayingState *)v2;
}

- (double)timeSincePlaying
{
  uint64_t v4 = 0;
  uint64_t v5 = (double *)&v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  msv_dispatch_sync_on_queue();
  double v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (id)_onQueue_lastPlayingDate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([(MRDNowPlayingPlayerClient *)self _onQueue_isPlaying])
  {
    id v3 = +[NSDate date];
  }
  else
  {
    id v3 = self->_lastPlayingDate;
  }

  return v3;
}

- (NSMapTable)handoffSessions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100046398;
  float v10 = sub_1000463A8;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100048F18;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSMapTable *)v3;
}

- (void)setPlayerPath:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)setPictureInPictureEnabled:(BOOL)a3
{
}

- (void)updateClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)updatePlayer:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (void)updatePlaybackQueue:(id)a3
{
}

- (void)updatePlaybackQueue:(id)a3 fromRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  msv_dispatch_sync_on_queue();
}

- (void)_onQueue_updatePlaybackQueue:(id)a3 fromRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = [(MRDPlaybackQueue *)self->_playbackQueueInternal playbackQueue];
  id v9 = [v8 copy];

  [(MRDNowPlayingPlayerClient *)self _onQueue_pushState];
  playbackQueueInternal = self->_playbackQueueInternal;
  id v11 = [v6 contentItems];
  [(MRDPlaybackQueue *)playbackQueueInternal updatePlaybackQueueWithContentItems:v11 fromRequest:v7];

  [(MRDNowPlayingPlayerClient *)self _onQueue_popState];
  if (!v7)
  {
    id v34 = v6;
    id v12 = [v6 contentItems];
    if ([v12 count]) {
      [(MRDNowPlayingPlayerClient *)self _onQueue_playbackQueueContentItemsDidChange:v12];
    }
    v32 = v12;
    id v13 = objc_alloc_init((Class)NSMutableArray);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    unsigned int v33 = self;
    id v14 = [(MRDPlaybackQueue *)self->_playbackQueueInternal playbackQueue];
    v15 = [v14 contentItems];

    id obj = v15;
    id v38 = [v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v38)
    {
      uint64_t v36 = *(void *)v45;
      id v37 = v9;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v45 != v36) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = v16;
          id v17 = *(void **)(*((void *)&v44 + 1) + 8 * v16);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v18 = [v9 contentItems];
          id v19 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v41;
            do
            {
              for (i = 0; i != v20; i = (char *)i + 1)
              {
                if (*(void *)v41 != v21) {
                  objc_enumerationMutation(v18);
                }
                v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                v24 = [v17 identifier];
                v25 = [v23 identifier];
                unsigned int v26 = [v24 isEqualToString:v25];

                if (v26)
                {
                  v27 = [v17 artwork];
                  uint64_t v28 = [v27 imageData];
                  if (v28)
                  {
                    v29 = (void *)v28;
                    unsigned __int8 v30 = [v23 artwork];
                    v31 = [v30 imageData];

                    if (!v31) {
                      [v13 addObject:v17];
                    }
                  }
                  else
                  {
                  }
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v20);
          }

          uint64_t v16 = v39 + 1;
          id v9 = v37;
        }
        while ((id)(v39 + 1) != v38);
        id v38 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v38);
    }

    [(MRDNowPlayingPlayerClient *)v33 _onQueue_playbackQueueContentItemsArtworkDidChange:v13];
    id v7 = 0;
    id v6 = v34;
  }
}

- (void)notifyArtworkChangedForContentItems:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    serialQueue = self->_serialQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000497A4;
    v7[3] = &unk_1004158D8;
    v7[4] = self;
    id v8 = v5;
    dispatch_sync((dispatch_queue_t)serialQueue, v7);
  }
}

- (id)snapshotForPlaybackState:(unsigned int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_100046398;
  id v12 = sub_1000463A8;
  id v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000498D8;
  block[3] = &unk_100417748;
  block[4] = self;
  block[5] = &v8;
  unsigned int v7 = a3;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)snapshotsForIsPlaying:(BOOL)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049A30;
  block[3] = &unk_100417770;
  BOOL v12 = a3;
  block[4] = self;
  id v11 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  uint64_t v8 = [(MRDNowPlayingPlayerClient *)self _sortSnapshots:v7];

  return v8;
}

- (id)snapshotForIsPlaying:(BOOL)a3
{
  id v3 = [(MRDNowPlayingPlayerClient *)self snapshotsForIsPlaying:a3];
  id v4 = [v3 firstObject];

  return v4;
}

- (NSArray)snapshots
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100046398;
  uint64_t v10 = sub_1000463A8;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100049C8C;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)_sortSnapshots:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_1004177B0];
}

- (id)playbackQueueForRequest:(id)a3 cachingPolicy:(unsigned int)a4 playerPath:(id)a5 partiallyCachedItems:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v29 = 0;
  unsigned __int8 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100046398;
  unsigned int v33 = sub_1000463A8;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unsigned int v26 = sub_100046398;
  v27 = sub_1000463A8;
  id v28 = 0;
  serialQueue = self->_serialQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100049EDC;
  v17[3] = &unk_1004177D8;
  v17[4] = self;
  id v20 = &v29;
  id v13 = v10;
  id v18 = v13;
  unsigned int v22 = a4;
  id v14 = v11;
  id v19 = v14;
  uint64_t v21 = &v23;
  dispatch_sync((dispatch_queue_t)serialQueue, v17);
  if (a6) {
    *a6 = (id) v24[5];
  }
  id v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (NSArray)participants
{
  participantDataSource = self->_participantDataSource;
  if (participantDataSource || (participantDataSource = self->_remoteParticipantDataSource) != 0)
  {
    participantDataSource = [participantDataSource participants];
  }

  return (NSArray *)participantDataSource;
}

- (void)registerHandoffSession:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004A088;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (id)handleHandoffEvent:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100046398;
  id v17 = sub_1000463A8;
  id v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004A500;
  block[3] = &unk_100416730;
  BOOL v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (void *)v14[5];
  if (v7)
  {
    [v7 handleEvent:v6];
    id v8 = 0;
  }
  else
  {
    id v8 = [objc_alloc((Class)NSError) initWithMRError:185];
  }

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)_handleNowPlayingAppDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = MRGetPlayerPathFromUserInfo();

  id v6 = [(MRDNowPlayingPlayerClient *)self playerPath];
  unsigned int v7 = [v5 isEqual:v6];

  if (v7)
  {
    serialQueue = self->_serialQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004A644;
    block[3] = &unk_100415CC8;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)serialQueue, block);
  }
}

- (void)dataSource:(id)a3 didUpdateParticipants:(id)a4
{
  id v5 = a4;
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004A6E8;
  v8[3] = &unk_1004158D8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)serialQueue, v8);
}

- (void)_onQueue_canBeNowPlayingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self playerCanBeNowPlayingDidChange:v3];
}

- (void)_onQueue_isPlayingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!v3)
  {
    id v5 = +[NSDate date];
    lastPlayingDate = self->_lastPlayingDate;
    self->_lastPlayingDate = v5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self isPlayingDidChange:v3];
}

- (void)_onQueue_pictureInPictureEnabledDidChanged:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self pictureInPictureEnabledDidChange:v3];
}

- (void)_onQueue_playbackStateDidChanged:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)serialQueue);
  id v10 = objc_alloc_init(MRDNowPlayingPlayerClientPlaybackStateSnapshot);
  [(MRDNowPlayingPlayerClientPlaybackStateSnapshot *)v10 setPlayerPlaybackState:v5];
  playbackStateHistory = self->_playbackStateHistory;
  id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v5 playbackState]);
  [(NSMutableDictionary *)playbackStateHistory setObject:v10 forKeyedSubscript:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [v5 playbackState];

  [WeakRetained nowPlayingPlayerClient:self playbackStateDidChange:v9];
}

- (void)_onQueue_supportedCommandsDidChange:(id)a3
{
  serialQueue = self->_serialQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [v5 copy];

  [WeakRetained nowPlayingPlayerClient:self supportedCommandsDidChange:v6];
}

- (void)_onQueue_playbackQueueDidChange:(id)a3 nowPlayingItemChanged:(BOOL)a4
{
  BOOL v4 = a4;
  serialQueue = self->_serialQueue;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [v7 copy];

  [WeakRetained nowPlayingPlayerClient:self playbackQueueDidChange:v8 nowPlayingItemDidChange:v4];
}

- (void)_onQueue_playbackQueueCapabilitiesDidChange:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self playbackQueueCapabilitiesDidChange:a3];
}

- (void)_onQueue_playbackQueueContentItemsDidChange:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [objc_alloc((Class)NSArray) initWithArray:v6 copyItems:1];
    [WeakRetained nowPlayingPlayerClient:self playbackQueueContentItemsDidChange:v5];
  }
}

- (void)_onQueue_playbackQueueContentItemsArtworkDidChange:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if ([v6 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [objc_alloc((Class)NSArray) initWithArray:v6 copyItems:1];
    [WeakRetained nowPlayingPlayerClient:self playbackQueueArtworkContentItemsDidChange:v5];
  }
}

- (void)_onQueue_pushState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  [(MRDNowPlayingPlayerClient *)self setPushStateIsPlaying:[(MRDNowPlayingPlayerClient *)self _onQueue_isPlaying]];
  BOOL v3 = [(MRDNowPlayingPlayerClient *)self _onQueue_playbackState];
  [(MRDNowPlayingPlayerClient *)self setPushStatePlaybackState:v3];

  BOOL v4 = [(MRPlayerPath *)self->_playerPath player];
  id v5 = [v4 copy];
  [(MRDNowPlayingPlayerClient *)self setPushStatePlayer:v5];

  [(MRDNowPlayingPlayerClient *)self setPushStateHasNowPlayingData:[(MRDNowPlayingPlayerClient *)self hasNowPlayingData]];
  [(MRDNowPlayingPlayerClient *)self setPushStatePictureInPictureEnabled:[(MRDNowPlayingPlayerClient *)self isPictureInPictureEnabled]];
  BOOL v6 = [(MRDNowPlayingPlayerClient *)self canBeNowPlayingPlayer];

  [(MRDNowPlayingPlayerClient *)self setPushStateCanBeNowPlayingPlayer:v6];
}

- (void)_onQueue_popState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  unsigned int v3 = [(MRDNowPlayingPlayerClient *)self hasNowPlayingData];
  if (v3 != [(MRDNowPlayingPlayerClient *)self pushStateHasNowPlayingData])
  {
    if (v3)
    {
      if (self->_hasNowPlayingDataTransaction) {
        goto LABEL_11;
      }
      BOOL v4 = _MRLogForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        playerPath = self->_playerPath;
        *(_DWORD *)buf = 138543362;
        *(void *)v61 = playerPath;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] Taking hasNowPlayingData transaction for %{public}@", buf, 0xCu);
      }

      BOOL v6 = [(MRPlayerPath *)self->_playerPath description];
      id v7 = +[NSString stringWithFormat:@"com.apple.mediaremoted.MRDNowPlayingPlayerClient/%@", v6];

      id v8 = (MROSTransaction *)[objc_alloc((Class)MROSTransaction) initWithName:v7];
      hasNowPlayingDataTransaction = self->_hasNowPlayingDataTransaction;
      self->_hasNowPlayingDataTransaction = v8;

      MRRegisterTransaction();
    }
    else
    {
      id v10 = _MRLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->_playerPath;
        *(_DWORD *)buf = 138543362;
        *(void *)v61 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] Removing hasNowPlayingData transaction for %{public}@", buf, 0xCu);
      }

      id v7 = self->_hasNowPlayingDataTransaction;
      self->_hasNowPlayingDataTransaction = 0;
    }
  }
LABEL_11:
  BOOL v12 = [(MRDNowPlayingPlayerClient *)self isPictureInPictureEnabled];
  if (v12 != [(MRDNowPlayingPlayerClient *)self pushStatePictureInPictureEnabled])
  {
    uint64_t v13 = _MRLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v14 = @"false";
      uint64_t v15 = self->_playerPath;
      if (v12) {
        CFStringRef v14 = @"true";
      }
      *(_DWORD *)buf = 138543618;
      *(void *)v61 = v14;
      *(_WORD *)&v61[8] = 2114;
      *(void *)v62 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] isPictureInPictureEnabled changed to %{public}@ for %{public}@", buf, 0x16u);
    }

    [(MRDNowPlayingPlayerClient *)self _onQueue_pictureInPictureEnabledDidChanged:v12];
  }
  BOOL v16 = [(MRDNowPlayingPlayerClient *)self _onQueue_isPlaying];
  BOOL v17 = v16 ^ [(MRDNowPlayingPlayerClient *)self pushStateIsPlaying];
  id v18 = [(MRDNowPlayingPlayerClient *)self _onQueue_playbackState];
  id v19 = [(MRDNowPlayingPlayerClient *)self pushStatePlaybackState];
  unsigned int v20 = [v19 playbackState];
  unsigned int v21 = [v18 playbackState];

  if (v20 != v21)
  {
    unsigned int v22 = [(MRDNowPlayingPlayerClient *)self pushStatePlaybackState];
    [v22 playbackState];
    uint64_t v23 = (void *)MRMediaRemoteCopyPlaybackStateDescription();

    [v18 playbackState];
    v24 = (void *)MRMediaRemoteCopyPlaybackStateDescription();
    uint64_t v25 = _MRLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v26 = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      *(void *)v61 = v23;
      *(_WORD *)&v61[8] = 2114;
      *(void *)v62 = v24;
      *(_WORD *)&v62[8] = 2114;
      v63 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] PlaybackState changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
    }

    [(MRDNowPlayingPlayerClient *)self _onQueue_playbackStateDidChanged:v18];
  }
  if (v17)
  {
    v27 = _MRLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v28 = @"false";
      uint64_t v29 = self->_playerPath;
      if (v16) {
        CFStringRef v28 = @"true";
      }
      *(_DWORD *)buf = 138543618;
      *(void *)v61 = v28;
      *(_WORD *)&v61[8] = 2114;
      *(void *)v62 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] isPlaying changed to %{public}@ for %{public}@", buf, 0x16u);
    }

    [(MRDNowPlayingPlayerClient *)self _onQueue_isPlayingDidChange:v16];
  }
  BOOL v30 = [(MRDNowPlayingPlayerClient *)self canBeNowPlayingPlayer];
  if (v30 != [(MRDNowPlayingPlayerClient *)self pushStateCanBeNowPlayingPlayer])
  {
    uint64_t v31 = _MRLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v32 = @"false";
      unsigned int v33 = self->_playerPath;
      if (v30) {
        CFStringRef v32 = @"true";
      }
      *(_DWORD *)buf = 138543618;
      *(void *)v61 = v32;
      *(_WORD *)&v61[8] = 2114;
      *(void *)v62 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] CanBeNowPlayingPlayer changed to %{public}@ for %{public}@", buf, 0x16u);
    }

    [(MRDNowPlayingPlayerClient *)self _onQueue_canBeNowPlayingDidChange:v30];
  }
  id v34 = [(MRPlayerPath *)self->_playerPath player];
  v35 = [v34 displayName];
  uint64_t v36 = [(MRPlayer *)self->_pushStatePlayer displayName];
  v59 = v18;
  if (v35 && ([v35 isEqualToString:v36] & 1) == 0)
  {
    id v38 = _MRLogForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = self->_playerPath;
      *(_DWORD *)buf = 138412802;
      *(void *)v61 = v36;
      *(_WORD *)&v61[8] = 2112;
      *(void *)v62 = v35;
      *(_WORD *)&v62[8] = 2114;
      v63 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] DisplayName changed from %@ to %@ for %{public}@", buf, 0x20u);
    }

    int v37 = 1;
  }
  else
  {
    int v37 = 0;
  }
  id v40 = [v34 audioSessionType];
  if (v40 != [(MRPlayer *)self->_pushStatePlayer audioSessionType])
  {
    long long v41 = NSStringFromMRPlayerAudioSessionType();
    long long v42 = NSStringFromMRPlayerAudioSessionType();
    long long v43 = _MRLogForCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      long long v44 = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      *(void *)v61 = v41;
      *(_WORD *)&v61[8] = 2114;
      *(void *)v62 = v42;
      *(_WORD *)&v62[8] = 2114;
      v63 = v44;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] AudioSessionType changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
    }

    int v37 = 1;
  }
  long long v45 = [v34 mxSessionIDs];
  long long v46 = [(MRPlayer *)self->_pushStatePlayer mxSessionIDs];
  if (v45 == v46)
  {
    objc_super v48 = v45;
  }
  else
  {
    unsigned __int8 v47 = [v45 isEqual:v46];

    if (v47) {
      goto LABEL_49;
    }
    int v37 = 1;
    objc_super v48 = _MRLogForCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = self->_playerPath;
      *(_DWORD *)buf = 138543874;
      *(void *)v61 = v46;
      *(_WORD *)&v61[8] = 2114;
      *(void *)v62 = v45;
      *(_WORD *)&v62[8] = 2114;
      v63 = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] MXSessionIDs changed from %{public}@ to %{public}@ for %{public}@", buf, 0x20u);
      int v37 = 1;
    }
  }

LABEL_49:
  v50 = [(MRDNowPlayingPlayerClient *)self pushStatePlayer];
  unsigned int v51 = [v50 audioSessionID];
  unsigned int v52 = [v34 audioSessionID];

  if (v51 == v52)
  {
    if (!v37) {
      goto LABEL_56;
    }
  }
  else
  {
    v53 = _MRLogForCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v54 = [(MRDNowPlayingPlayerClient *)self pushStatePlayer];
      unsigned int v55 = [v54 audioSessionID];
      unsigned int v56 = [v34 audioSessionID];
      v57 = self->_playerPath;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v61 = v55;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = v56;
      *(_WORD *)v62 = 2114;
      *(void *)&v62[2] = v57;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[MRDNowPlayingPlayerClient] AudioSessionID changed from %u to %u for %{public}@", buf, 0x18u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained nowPlayingPlayerClient:self playerStateDidChange:v34];

LABEL_56:
}

- (NSDate)lastPlayingDate
{
  return self->_lastPlayingDate;
}

- (MRPlaybackQueueSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (MRDPlaybackQueueParticipantDataSource)participantDataSource
{
  return self->_participantDataSource;
}

- (void)setParticipantDataSource:(id)a3
{
}

- (MRDPlaybackQueueRemoteParticipantDataSource)remoteParticipantDataSource
{
  return self->_remoteParticipantDataSource;
}

- (MRDNowPlayingPlayerClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDNowPlayingPlayerClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)pushStateIsPlaying
{
  return self->_pushStateIsPlaying;
}

- (void)setPushStateIsPlaying:(BOOL)a3
{
  self->_pushStateIsPlaying = a3;
}

- (MRDNowPlayingPlayerClientPlaybackState)pushStatePlaybackState
{
  return self->_pushStatePlaybackState;
}

- (void)setPushStatePlaybackState:(id)a3
{
}

- (MRPlayer)pushStatePlayer
{
  return self->_pushStatePlayer;
}

- (void)setPushStatePlayer:(id)a3
{
}

- (BOOL)pushStateHasNowPlayingData
{
  return self->_pushStateHasNowPlayingData;
}

- (void)setPushStateHasNowPlayingData:(BOOL)a3
{
  self->_pushStateHasNowPlayingData = a3;
}

- (BOOL)pushStatePictureInPictureEnabled
{
  return self->_pushStatePictureInPictureEnabled;
}

- (void)setPushStatePictureInPictureEnabled:(BOOL)a3
{
  self->_pushStatePictureInPictureEnabled = a3;
}

- (BOOL)pushStateCanBeNowPlayingPlayer
{
  return self->_pushStateCanBeNowPlayingPlayer;
}

- (void)setPushStateCanBeNowPlayingPlayer:(BOOL)a3
{
  self->_pushStateCanBeNowPlayingPlayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushStatePlayer, 0);
  objc_storeStrong((id *)&self->_pushStatePlaybackState, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteParticipantDataSource, 0);
  objc_storeStrong((id *)&self->_participantDataSource, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_lastPlayingDate, 0);
  objc_storeStrong((id *)&self->_handoffSessions, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_hasNowPlayingDataTransaction, 0);
  objc_storeStrong((id *)&self->_playbackStateHistory, 0);
  objc_storeStrong((id *)&self->_inferredPlayerPlaybackState, 0);
  objc_storeStrong((id *)&self->_playerPlaybackState, 0);
  objc_storeStrong((id *)&self->_canBeNowPlayingPlayerTimestamp, 0);
  objc_storeStrong((id *)&self->_playbackQueueInternal, 0);
  objc_storeStrong((id *)&self->_supportedRemoteControlCommandsData, 0);
  objc_storeStrong((id *)&self->_supportedRemoteControlCommands, 0);

  objc_storeStrong((id *)&self->_playerPath, 0);
}

@end