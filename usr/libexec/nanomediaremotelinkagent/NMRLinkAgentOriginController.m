@interface NMRLinkAgentOriginController
- (NMRLinkAgentOriginController)initWithOrigin:(id)a3 externalOriginIdentifier:(id)a4;
- (NMRLinkAgentOriginControllerDelegate)delegate;
- (NMROrigin)origin;
- (NSNumber)externalOriginIdentifier;
- (id)_currentFullPlaybackQueueIgnoringDigestMatches:(BOOL)a3 digest:(id)a4 digestMatched:(BOOL *)a5;
- (id)_currentNowPlayingApplicationInfoIgnoringDigestMatches:(BOOL)a3 digest:(id)a4 digestMatched:(BOOL *)a5;
- (id)_currentNowPlayingIgnoringDigestMatches:(BOOL)a3 digest:(id)a4 digestMatched:(BOOL *)a5;
- (id)_currentSupportedCommandsIgnoringDigestMatches:(BOOL)a3 digest:(id)a4 digestMatches:(BOOL *)a5;
- (void)_handleMRNotification:(id)a3;
- (void)_performUpdateBlock:(id)a3 forCFNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)_refreshArtworkWithCompletion:(id)a3;
- (void)_refreshCurrentNowPlayingApplicationInfoWithCompletion:(id)a3;
- (void)_refreshCurrentNowPlayingInfoWithCompletion:(id)a3;
- (void)_refreshCurrentSupportedCommands;
- (void)_registerForMediaRemoteNotifications;
- (void)_scheduleEagerUpdate:(unsigned int)a3;
- (void)_updateNowPlayingInfoWithContentItem:(void *)a3;
- (void)dealloc;
- (void)eagerUpdateTimerFired;
- (void)handleMediaRemoteGetArtworkRequest:(id)a3 completion:(id)a4;
- (void)handleMediaRemoteGetStateRequest:(id)a3 completion:(id)a4;
- (void)handleMediaRemoteSendCommandRequest:(id)a3 completion:(id)a4;
- (void)handlePlaybackQueueRequest:(id)a3 completion:(id)a4;
- (void)playbackQueue:(id)a3 contentItemsDidChange:(id)a4;
- (void)playbackQueueDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updatePlaybackQueuePendingRecordsWithIdentifier:(id)a3 success:(BOOL)a4;
@end

@implementation NMRLinkAgentOriginController

- (NMRLinkAgentOriginController)initWithOrigin:(id)a3 externalOriginIdentifier:(id)a4
{
  id v48 = a3;
  id v47 = a4;
  v60.receiver = self;
  v60.super_class = (Class)NMRLinkAgentOriginController;
  v7 = [(NMRLinkAgentOriginController *)&v60 init];
  v8 = v7;
  if (v7)
  {
    p_origin = (id *)&v7->_origin;
    objc_storeStrong((id *)&v7->_origin, a3);
    objc_storeStrong((id *)&v8->_externalOriginIdentifier, a4);
    v10 = sub_10002C428(2);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [*p_origin displayName];
      v12 = [*p_origin uniqueIdentifier];
      *(_DWORD *)buf = 138412802;
      v62 = v11;
      __int16 v63 = 2112;
      v64 = v12;
      __int16 v65 = 2112;
      id v66 = v48;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Creating origin controller for %@", buf, 0x20u);
    }
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.nanomediaremotelinkagent.NMRLinkAgentServer", v14);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.nanomediaremotelinkagent.NMRLinkAgentServer.appstate", v14);
    refreshingQueue = v8->_refreshingQueue;
    v8->_refreshingQueue = (OS_dispatch_queue *)v17;

    dispatch_source_t v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v8->_serialQueue);
    eagerUpdateTimer = v8->_eagerUpdateTimer;
    v8->_eagerUpdateTimer = (OS_dispatch_source *)v19;

    v21 = v19;
    objc_initWeak((id *)buf, v8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100015A00;
    handler[3] = &unk_100044F68;
    v22 = v21;
    v58 = v22;
    objc_copyWeak(&v59, (id *)buf);
    dispatch_source_set_event_handler(v22, handler);
    dispatch_resume(v22);
    uint64_t v23 = objc_opt_new();
    playbackQueue = v8->_playbackQueue;
    v8->_playbackQueue = (NMRPlaybackQueue *)v23;

    [(NMRPlaybackQueue *)v8->_playbackQueue setDelegate:v8];
    uint64_t v25 = objc_opt_new();
    playbackQueuePendingSendRecords = v8->_playbackQueuePendingSendRecords;
    v8->_playbackQueuePendingSendRecords = (NSMutableDictionary *)v25;

    uint64_t v27 = objc_opt_new();
    playbackQueueInvalidatedMetadataIdentifiers = v8->_playbackQueueInvalidatedMetadataIdentifiers;
    v8->_playbackQueueInvalidatedMetadataIdentifiers = (NSCountedSet *)v27;

    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.nanomediaremotelinkagent.NMRLinkAgentServer.playbackQueueMessages", v29);
    playbackQueueMessageQueue = v8->_playbackQueueMessageQueue;
    v8->_playbackQueueMessageQueue = (OS_dispatch_queue *)v30;

    v32 = [NMRMediaRemoteUpdater alloc];
    v33 = v8->_refreshingQueue;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100015A64;
    v54[3] = &unk_100044FB8;
    objc_copyWeak(&v56, (id *)buf);
    v34 = v8;
    v55 = v34;
    v35 = [(NMRMediaRemoteUpdater *)v32 initWithQueue:v33 updateBlock:v54];
    nowPlayingInfoUpdater = v34->_nowPlayingInfoUpdater;
    v34->_nowPlayingInfoUpdater = v35;

    v37 = [NMRMediaRemoteUpdater alloc];
    v38 = v8->_refreshingQueue;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100015DD4;
    v52[3] = &unk_100044DD8;
    objc_copyWeak(&v53, (id *)buf);
    v39 = [(NMRMediaRemoteUpdater *)v37 initWithQueue:v38 updateBlock:v52];
    applicationInfoUpdater = v34->_applicationInfoUpdater;
    v34->_applicationInfoUpdater = v39;

    v41 = [NMRMediaRemoteUpdater alloc];
    v42 = v8->_refreshingQueue;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100015E38;
    v49[3] = &unk_100044FB8;
    objc_copyWeak(&v51, (id *)buf);
    v43 = v34;
    v50 = v43;
    v44 = [(NMRMediaRemoteUpdater *)v41 initWithQueue:v42 updateBlock:v49];
    artworkUpdater = v43->_artworkUpdater;
    v43->_artworkUpdater = v44;

    [(NMRLinkAgentOriginController *)v43 _registerForMediaRemoteNotifications];
    objc_destroyWeak(&v51);
    objc_destroyWeak(&v53);

    objc_destroyWeak(&v56);
    objc_destroyWeak(&v59);

    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)dealloc
{
  v3 = sub_10002C428(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NMROrigin *)self->_origin displayName];
    v5 = [(NMROrigin *)self->_origin uniqueIdentifier];
    origin = self->_origin;
    *(_DWORD *)buf = 138412802;
    v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    __int16 v12 = 2112;
    v13 = origin;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Destroying origin controller for %@", buf, 0x20u);
  }
  v7.receiver = self;
  v7.super_class = (Class)NMRLinkAgentOriginController;
  [(NMRLinkAgentOriginController *)&v7 dealloc];
}

- (void)_scheduleEagerUpdate:(unsigned int)a3
{
  if (a3 > 3) {
    CFStringRef v5 = @"Unknown";
  }
  else {
    CFStringRef v5 = *(&off_1000451B8 + (int)a3);
  }
  v6 = sub_10002C428(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [(NMROrigin *)self->_origin displayName];
    v8 = [(NMROrigin *)self->_origin uniqueIdentifier];
    int v11 = 138412802;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    v14 = v8;
    __int16 v15 = 2112;
    CFStringRef v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Scheduling eager update because of %@.", (uint8_t *)&v11, 0x20u);
  }
  if (((0x80u >> (a3 & 7)) & atomic_fetch_or((atomic_uchar *volatile)&self->_eagerUpdateFlags + ((unint64_t)a3 >> 3), 0x80u >> (a3 & 7))) == 0)
  {
    eagerUpdateTimer = self->_eagerUpdateTimer;
    dispatch_time_t v10 = dispatch_time(0, 100000000);
    dispatch_source_set_timer(eagerUpdateTimer, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  }
}

- (void)eagerUpdateTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  atomic_fetch_and((atomic_uchar *volatile)&self->_eagerUpdateFlags, 0x7Fu);
  atomic_fetch_and((atomic_uchar *volatile)&self->_eagerUpdateFlags, 0xBFu);
  atomic_fetch_and((atomic_uchar *volatile)&self->_eagerUpdateFlags, 0xDFu);
  atomic_fetch_and((atomic_uchar *volatile)&self->_eagerUpdateFlags, 0xEFu);
  v3 = [(NSDictionary *)self->_currentNowPlayingInfo objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTitle];
  v4 = [(NSDictionary *)self->_currentNowPlayingInfo objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoArtist];
  CFStringRef v5 = +[NSString stringWithFormat:@"%@-%@", v3, v4];

  v6 = sub_10002C428(2);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [(NMROrigin *)self->_origin displayName];
    v8 = [(NMROrigin *)self->_origin uniqueIdentifier];
    currentApplicationBundleIdentifier = self->_currentApplicationBundleIdentifier;
    NSUInteger v10 = [(NSArray *)self->_currentSupportedCommands count];
    *(_DWORD *)buf = 138414082;
    uint64_t v27 = v7;
    __int16 v28 = 2112;
    v29 = v8;
    __int16 v30 = 2112;
    CFStringRef v31 = @"YES";
    __int16 v32 = 2112;
    CFStringRef v33 = @"YES";
    __int16 v34 = 2112;
    CFStringRef v35 = @"YES";
    __int16 v36 = 2112;
    v37 = currentApplicationBundleIdentifier;
    __int16 v38 = 2112;
    v39 = v5;
    __int16 v40 = 2048;
    NSUInteger v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Sending eager state update (now playing: %@, now playing app: %@, commands: %@), app: %@, info: %@, %tu total commands.", buf, 0x52u);
  }
  int v11 = [(NMRLinkAgentOriginController *)self _currentNowPlayingIgnoringDigestMatches:1 digest:0 digestMatched:0];
  __int16 v12 = [(NMRLinkAgentOriginController *)self _currentNowPlayingApplicationInfoIgnoringDigestMatches:1 digest:0 digestMatched:0];
  __int16 v13 = [(NMRLinkAgentOriginController *)self _currentSupportedCommandsIgnoringDigestMatches:1 digest:0 digestMatches:0];
  v14 = [(NMRPlaybackQueue *)self->_playbackQueue deltaPlaybackQueueDataFromPreviousData:self->_playbackQueueSentData invalidatedMetadataIdentifiers:self->_playbackQueueInvalidatedMetadataIdentifiers];
  __int16 v15 = +[NMRMediaRemoteSetStateMessage messageWithNowPlayingInfo:v11 applicationInfo:v12 supportedCommands:v13 playbackQueue:v14 originIdentifier:self->_externalOriginIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v25 = 0;
  [WeakRetained originController:self sendSetStateMessage:v15 resultingMessageIdentifier:&v25];
  id v17 = v25;

  if (v17 && v14)
  {
    v18 = [(NMRPlaybackQueue *)self->_playbackQueue fullPlaybackQueueData];
    objc_initWeak((id *)buf, self);
    playbackQueueMessageQueue = self->_playbackQueueMessageQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001678C;
    block[3] = &unk_100044FE0;
    objc_copyWeak(&v24, (id *)buf);
    id v22 = v18;
    id v23 = v17;
    id v20 = v18;
    dispatch_async(playbackQueueMessageQueue, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

- (void)handleMediaRemoteGetStateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000168F4;
  block[3] = &unk_100045008;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

- (void)handleMediaRemoteGetArtworkRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100016B1C;
  v8[3] = &unk_100045030;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(serialQueue, v8);
}

- (void)handlePlaybackQueueRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016E5C;
  block[3] = &unk_100045008;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

- (void)handleMediaRemoteSendCommandRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016F34;
  block[3] = &unk_100045008;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

- (void)updatePlaybackQueuePendingRecordsWithIdentifier:(id)a3 success:(BOOL)a4
{
  id v6 = a3;
  playbackQueueMessageQueue = self->_playbackQueueMessageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000173D4;
  block[3] = &unk_100045080;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(playbackQueueMessageQueue, block);
}

- (void)playbackQueueDidChange:(id)a3
{
}

- (void)playbackQueue:(id)a3 contentItemsDidChange:(id)a4
{
  id v5 = a4;
  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017658;
  v8[3] = &unk_100044CB8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(serialQueue, v8);
}

- (void)_updateNowPlayingInfoWithContentItem:(void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v5 = sub_10002C428(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NMROrigin *)self->_origin displayName];
    id v7 = [(NMROrigin *)self->_origin uniqueIdentifier];
    id v8 = (const void *)MRContentItemCopyMinimalReadableDescription();
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    CFTypeRef v67 = CFAutorelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Updating now playing content item %@", buf, 0x20u);
  }
  if (sub_1000177EC((uint64_t)self->_nowPlayingContentItemRef, (uint64_t)a3))
  {
    MRContentItemMerge();
  }
  else
  {
    if (a3) {
      CFRetain(a3);
    }
    nowPlayingContentItemRef = self->_nowPlayingContentItemRef;
    if (nowPlayingContentItemRef) {
      CFRelease(nowPlayingContentItemRef);
    }
    self->_nowPlayingContentItemRef = a3;
  }
  id v10 = (void *)MRContentItemCopyNowPlayingInfo();
  id v11 = [v10 mutableCopy];

  MRContentItemGetArtworkData();
  id v12 = objc_claimAutoreleasedReturnValue();
  v61 = [NSData dataWithBytes:[v12 bytes] length:[v12 length]];
  __int16 v13 = sub_10000A734(v61);
  if (v13) {
    [v11 setObject:v13 forKeyedSubscript:@"NMRAugmentedNowPlayingInfoArtworkDataDigest"];
  }
  id v14 = [v11 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoIsMusicApp];
  unsigned __int8 v15 = [v14 BOOLValue];

  if ((v15 & 1) == 0) {
    [v11 removeObjectForKey:kMRMediaRemoteNowPlayingInfoUniqueIdentifier];
  }
  currentNowPlayingInfo = self->_currentNowPlayingInfo;
  if (!currentNowPlayingInfo || !v11) {
    goto LABEL_27;
  }
  id v17 = currentNowPlayingInfo;
  v18 = (NSDictionary *)v11;
  dispatch_source_t v19 = v18;
  if (v17 == v18)
  {

    goto LABEL_21;
  }
  id v20 = [(NSDictionary *)v17 count];
  if (v20 == (id)[(NSDictionary *)v19 count])
  {
    uint64_t v62 = 0;
    __int16 v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 1;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100019C9C;
    CFTypeRef v67 = &unk_100045198;
    v21 = v19;
    v68 = v21;
    v69 = &v62;
    [(NSDictionary *)v17 enumerateKeysAndObjectsUsingBlock:buf];
    BOOL v22 = *((unsigned char *)v63 + 24) == 0;

    _Block_object_dispose(&v62, 8);
    if (v22) {
      goto LABEL_27;
    }
LABEL_21:
    id v23 = self->_currentNowPlayingInfo;
    uint64_t v24 = kMRMediaRemoteNowPlayingInfoElapsedTime;
    id v25 = [(NSDictionary *)v19 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoElapsedTime];
    [v25 doubleValue];
    double v27 = v26;

    __int16 v28 = [(NSDictionary *)v23 objectForKeyedSubscript:v24];
    [v28 doubleValue];
    double v30 = v29;

    uint64_t v31 = kMRMediaRemoteNowPlayingInfoTimestamp;
    objc_super v60 = [(NSDictionary *)self->_previousIgnoredNowPlayingInfo objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoTimestamp];
    [v60 timeIntervalSinceNow];
    if (v32 >= 0.0) {
      double v33 = v32;
    }
    else {
      double v33 = -v32;
    }
    __int16 v34 = v23;
    CFStringRef v35 = [(NSDictionary *)v34 objectForKeyedSubscript:v31];
    if (v35)
    {
      __int16 v36 = [(NSDictionary *)v34 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoPlaybackRate];
      [v36 floatValue];
      float v38 = v37;

      v39 = [(NSDictionary *)v34 objectForKeyedSubscript:v24];
      [v39 doubleValue];
      double v41 = v40;

      v42 = +[NSDate date];
      [v42 timeIntervalSinceDate:v35];
      double v44 = v43;

      double v45 = v41 + fmax(v44 * v38, 0.0);
    }
    else
    {
      double v45 = 0.0;
    }
    id v47 = [(NSDictionary *)v34 objectForKeyedSubscript:kMRMediaRemoteNowPlayingInfoDuration];
    [v47 doubleValue];
    double v49 = v48;

    if (v45 < v49) {
      double v49 = v45;
    }

    double v50 = v49 - v27;
    if (v49 - v27 < 0.0) {
      double v50 = -(v49 - v27);
    }
    BOOL v51 = v27 < v30;
    if (v33 > 30.0) {
      BOOL v51 = 1;
    }
    int v52 = v50 > 5.0 || v51;
    p_super = sub_10002C428(2);
    BOOL v54 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    if (v52)
    {
      if (v54)
      {
        v55 = [(NMROrigin *)self->_origin displayName];
        id v56 = [(NMROrigin *)self->_origin uniqueIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v56;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Allowing now-playing update with only elapsed time difference", buf, 0x16u);
      }
    }
    else
    {
      if (v54)
      {
        id v59 = [(NMROrigin *)self->_origin displayName];
        v57 = [(NMROrigin *)self->_origin uniqueIdentifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v57;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Suppressing now-playing update with only elapsed time difference", buf, 0x16u);
      }
      if (self->_previousIgnoredNowPlayingInfo)
      {
LABEL_48:

        objc_storeStrong((id *)&self->_currentNowPlayingInfo, v11);
        if ((v52 & 1) == 0) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
      v58 = v19;
      p_super = &self->_previousIgnoredNowPlayingInfo->super;
      self->_previousIgnoredNowPlayingInfo = v58;
    }

    goto LABEL_48;
  }

LABEL_27:
  objc_storeStrong((id *)&self->_currentNowPlayingInfo, v11);
LABEL_28:
  previousIgnoredNowPlayingInfo = self->_previousIgnoredNowPlayingInfo;
  self->_previousIgnoredNowPlayingInfo = 0;

  [(NMRLinkAgentOriginController *)self _scheduleEagerUpdate:0];
LABEL_29:
}

- (void)_refreshCurrentNowPlayingInfoWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_refreshingQueue);
  id v5 = sub_10002C428(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NMROrigin *)self->_origin displayName];
    id v7 = [(NMROrigin *)self->_origin uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Fetching now playing info", buf, 0x16u);
  }
  [(NMROrigin *)self->_origin mediaRemoteOrigin];
  id v8 = (const void *)MRNowPlayingPlayerPathCreate();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unsigned __int8 v15 = sub_100018298;
  CFStringRef v16 = sub_1000182A8;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000182B0;
  block[3] = &unk_100044E28;
  void block[4] = self;
  void block[5] = buf;
  dispatch_sync(serialQueue, block);
  if (*(void *)(*(void *)&buf[8] + 40)) {
    uint64_t v10 = MRPlaybackQueueRequestCreateWithCurrentState();
  }
  else {
    uint64_t v10 = MRPlaybackQueueRequestCreate();
  }
  id v11 = (const void *)v10;
  MRPlaybackQueueRequestSetIncludeMetadata();
  MRPlaybackQueueRequestSetIncludeArtwork();
  id v12 = v4;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
  if (v8) {
    CFRelease(v8);
  }
  if (v11) {
    CFRelease(v11);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_refreshArtworkWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_refreshingQueue);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100018298;
  v21 = sub_1000182A8;
  id v22 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000188E8;
  block[3] = &unk_100044E28;
  void block[4] = self;
  void block[5] = &v17;
  dispatch_sync(serialQueue, block);
  if (v18[5])
  {
    id v6 = sub_10002C428(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(NMROrigin *)self->_origin displayName];
      id v8 = [(NMROrigin *)self->_origin uniqueIdentifier];
      uint64_t v9 = v18[5];
      *(_DWORD *)buf = 138412802;
      id v25 = v7;
      __int16 v26 = 2112;
      double v27 = v8;
      __int16 v28 = 2112;
      uint64_t v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Fetching artwork for %@", buf, 0x20u);
    }
    [(NMROrigin *)self->_origin mediaRemoteOrigin];
    uint64_t v10 = (const void *)MRNowPlayingPlayerPathCreate();
    uint64_t v23 = v18[5];
    +[NSArray arrayWithObjects:&v23 count:1];
    id v11 = (const void *)MRPlaybackQueueRequestCreateWithIdentifiers();
    MRPlaybackQueueRequestSetIncludeArtwork();
    unsigned __int8 v15 = v4;
    MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
    if (v10) {
      CFRelease(v10);
    }
    if (v11) {
      CFRelease(v11);
    }
  }
  else
  {
    id v12 = sub_10002C428(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = [(NMROrigin *)self->_origin displayName];
      id v14 = [(NMROrigin *)self->_origin uniqueIdentifier];
      *(_DWORD *)buf = 138412546;
      id v25 = v13;
      __int16 v26 = 2112;
      double v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) No contentItemIdentifier, not fetching artwork", buf, 0x16u);
    }
    if (v4) {
      v4[2](v4);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)_refreshCurrentSupportedCommands
{
}

- (void)_refreshCurrentNowPlayingApplicationInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002C428(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(NMROrigin *)self->_origin displayName];
    id v7 = [(NMROrigin *)self->_origin uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    double v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[LinkAgent] (%@-%@) Fetching now playing application info", buf, 0x16u);
  }
  id v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  [(NMROrigin *)self->_origin mediaRemoteOrigin];
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = sub_100018EC0;
  uint64_t v23 = &unk_1000450F8;
  uint64_t v24 = self;
  dispatch_group_t v25 = v8;
  MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();
  dispatch_group_enter(v25);
  [(NMROrigin *)self->_origin mediaRemoteOrigin];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  CFStringRef v16 = sub_100018FE0;
  uint64_t v17 = &unk_100045120;
  v18 = self;
  id v19 = v25;
  uint64_t v9 = v25;
  MRMediaRemoteGetNowPlayingClientForOrigin();
  serialQueue = self->_serialQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000191AC;
  v12[3] = &unk_100045030;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_group_notify(v9, serialQueue, v12);
}

- (id)_currentNowPlayingIgnoringDigestMatches:(BOOL)a3 digest:(id)a4 digestMatched:(BOOL *)a5
{
  currentNowPlayingInfo = self->_currentNowPlayingInfo;
  id v8 = a4;
  uint64_t v9 = sub_10000FF40(currentNowPlayingInfo);
  uint64_t v10 = sub_10000A734(v9);
  int v11 = sub_10000A7EC(v10, v8);

  if (a5) {
    *a5 = v11;
  }
  if (!a3 && ((v11 ^ 1) & 1) == 0)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_currentNowPlayingApplicationInfoIgnoringDigestMatches:(BOOL)a3 digest:(id)a4 digestMatched:(BOOL *)a5
{
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  [v9 setCompanionBundleIdentifier:self->_currentApplicationBundleIdentifier];
  [v9 setLocalizedDisplayName:self->_currentApplicationLocalizedDisplayName];
  [v9 setPlaybackState:self->_currentApplicationPlaybackState];
  [v9 setProcessID:self->_currentApplicationProcessID];
  uint64_t v10 = [v9 protobufData];
  int v11 = sub_10000A734(v10);
  int v12 = sub_10000A7EC(v11, v8);

  if (a5) {
    *a5 = v12;
  }
  if (!a3 && ((v12 ^ 1) & 1) == 0)
  {

    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_currentSupportedCommandsIgnoringDigestMatches:(BOOL)a3 digest:(id)a4 digestMatches:(BOOL *)a5
{
  currentSupportedCommands = self->_currentSupportedCommands;
  id v8 = a4;
  uint64_t v9 = sub_100009D38(currentSupportedCommands);
  uint64_t v10 = sub_10000A734(v9);
  int v11 = sub_10000A7EC(v10, v8);

  if (a5) {
    *a5 = v11;
  }
  if (!a3 && ((v11 ^ 1) & 1) == 0)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_currentFullPlaybackQueueIgnoringDigestMatches:(BOOL)a3 digest:(id)a4 digestMatched:(BOOL *)a5
{
  playbackQueue = self->_playbackQueue;
  id v8 = a4;
  uint64_t v9 = [(NMRPlaybackQueue *)playbackQueue fullPlaybackQueueData];
  uint64_t v10 = sub_10000A734(v9);
  int v11 = sub_10000A7EC(v10, v8);

  if (a5) {
    *a5 = v11;
  }
  if (!a3 && ((v11 ^ 1) & 1) == 0)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_registerForMediaRemoteNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  MRMediaRemoteRegisterForNowPlayingNotifications();
  [v3 addObserver:self selector:"_handleMRNotification:" name:kMRNowPlayingPlaybackQueueChangedNotification object:0];
  [v3 addObserver:self selector:"_handleMRNotification:" name:kMRPlaybackQueueContentItemsChangedNotification object:0];
  [v3 addObserver:self selector:"_handleMRNotification:" name:kMRPlaybackQueueContentItemArtworkChangedNotification object:0];
  MRMediaRemoteSetWantsSupportedCommandsChangedNotifications();
  [v3 addObserver:self selector:"_handleMRNotification:" name:kMRMediaRemoteSupportedCommandsDidChangeNotification object:0];
  [v3 addObserver:self selector:"_handleMRNotification:" name:kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification object:0];
  [v3 addObserver:self selector:"_handleMRNotification:" name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];
  [v3 addObserver:self selector:"_handleMRNotification:" name:kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification object:0];
  [(NMRMediaRemoteUpdater *)self->_nowPlayingInfoUpdater executeUpdateBlock];
  [(NMRMediaRemoteUpdater *)self->_applicationInfoUpdater executeUpdateBlock];
  [(NMRLinkAgentOriginController *)self _refreshCurrentSupportedCommands];
  [(NMRPlaybackQueue *)self->_playbackQueue beginObservingMediaRemotePlaybackQueueForOrigin:self->_origin];
}

- (void)_handleMRNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v4 userInfo];
  [v6 objectForKeyedSubscript:kMRMediaRemoteOriginUserInfoKey];

  [(NMROrigin *)self->_origin mediaRemoteOrigin];
  if (MROriginEqualToOrigin())
  {
    id v7 = [v4 name];
    if ([v7 isEqualToString:kMRNowPlayingPlaybackQueueChangedNotification]) {
      goto LABEL_3;
    }
    if ([v7 isEqualToString:kMRPlaybackQueueContentItemsChangedNotification])
    {
      uint64_t v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      uint64_t v17 = sub_10001986C;
      v18 = &unk_100045148;
      id v19 = self;
      uint64_t v9 = &v15;
    }
    else
    {
      if (![v7 isEqualToString:kMRPlaybackQueueContentItemArtworkChangedNotification])
      {
        if ([v7 isEqualToString:kMRMediaRemoteSupportedCommandsDidChangeNotification])
        {
          [(NMRLinkAgentOriginController *)self _refreshCurrentSupportedCommands];
          goto LABEL_10;
        }
        if (![v7 isEqualToString:kMRMediaRemoteNowPlayingApplicationDidChangeNotification])
        {
          if (([v7 isEqualToString:kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification] & 1) == 0&& !objc_msgSend(v7, "isEqualToString:", kMRMediaRemoteNowPlayingApplicationIsPlayingDidChangeNotification))
          {
            goto LABEL_10;
          }
          applicationInfoUpdater = self->_applicationInfoUpdater;
          goto LABEL_4;
        }
        [(NMRLinkAgentOriginController *)self _refreshCurrentSupportedCommands];
        [(NMRMediaRemoteUpdater *)self->_applicationInfoUpdater executeUpdateBlock];
LABEL_3:
        applicationInfoUpdater = self->_nowPlayingInfoUpdater;
LABEL_4:
        [(NMRMediaRemoteUpdater *)applicationInfoUpdater executeUpdateBlock];
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      int v12 = sub_100019878;
      id v13 = &unk_100045148;
      id v14 = self;
      uint64_t v9 = &v10;
    }
    -[NMRLinkAgentOriginController _performUpdateBlock:forCFNotificationWithName:userInfo:](self, "_performUpdateBlock:forCFNotificationWithName:userInfo:", v9, v7, v5, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_performUpdateBlock:(id)a3 forCFNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019974;
  v15[3] = &unk_100045170;
  v15[4] = self;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(serialQueue, v15);
}

- (NMROrigin)origin
{
  return self->_origin;
}

- (NSNumber)externalOriginIdentifier
{
  return self->_externalOriginIdentifier;
}

- (NMRLinkAgentOriginControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NMRLinkAgentOriginControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_externalOriginIdentifier, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_playbackQueueSentData, 0);
  objc_storeStrong((id *)&self->_playbackQueueInvalidatedMetadataIdentifiers, 0);
  objc_storeStrong((id *)&self->_playbackQueuePendingSendRecords, 0);
  objc_storeStrong((id *)&self->_playbackQueueMessageQueue, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_artworkUpdater, 0);
  objc_storeStrong((id *)&self->_applicationInfoUpdater, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfoUpdater, 0);
  objc_storeStrong((id *)&self->_currentApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_currentApplicationLocalizedDisplayName, 0);
  objc_storeStrong((id *)&self->_currentSupportedCommands, 0);
  objc_storeStrong((id *)&self->_previousIgnoredNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_currentNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_eagerUpdateTimer, 0);
  objc_storeStrong((id *)&self->_refreshingQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end