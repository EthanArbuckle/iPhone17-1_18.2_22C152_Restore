@interface MRDMediaServerNowPlayingDataSource
- (AVSystemController)mediaServerController;
- (BOOL)nowPlayingApplicationIsInterrupted;
- (BOOL)nowPlayingApplicationIsPlaying;
- (BOOL)shouldSendCommand:(id)a3;
- (MRDMediaServerNowPlayingDataSource)init;
- (NSDictionary)nowPlayingApplications;
- (NSDictionary)nowPlayingAudioFormatContentInfos;
- (NSDictionary)nowPlayingSessions;
- (NSString)nowPlayingApplicationDisplayID;
- (id)_createMediaServerController;
- (id)audioFormatContentInfoForApplication:(id)a3 cachedAudioFormatContentInfo:(id)a4;
- (id)bestAvailableContentForConsolidatedSourceContentInfo:(id)a3;
- (id)contentInfoForConsolidatedSourceContentInfo:(id)a3;
- (id)description;
- (id)nowPlayingApplicationsFromSessionsArray:(id)a3;
- (id)nowPlayingAudioFormatContentInfosFromNowPlayingApplications:(id)a3;
- (id)topOfNowPlayingAppStack;
- (int)nowPlayingApplicationPID;
- (void)_avSessionMediaServicesResetNotification:(id)a3;
- (void)_nowPlayingAppDidChangeNotification:(id)a3;
- (void)_nowPlayingAppIsPlayingDidChangeNotification:(id)a3;
- (void)_popNowPlayingAppStack;
- (void)_renderingModeChangeNotification:(id)a3;
- (void)_someSessionIsPlayingDidChangeNotification:(id)a3;
- (void)_sourceFormatInfoDidChangeNotification:(id)a3;
- (void)_updateNowPlayingAudioFormatContentInfo;
- (void)addCachedAudioSession:(id)a3 forID:(unsigned int)a4;
- (void)dealloc;
- (void)loadMediaServerState;
- (void)loadMediaServerStateWithController:(id)a3;
- (void)resetMediaServerState;
- (void)setMediaServerController:(id)a3;
- (void)setNowPlayingApplicationDisplayID:(id)a3;
- (void)setNowPlayingApplicationIsPlaying:(BOOL)a3;
- (void)setNowPlayingApplicationPID:(int)a3;
- (void)setNowPlayingApplications:(id)a3;
- (void)setNowPlayingAudioFormatContentInfos:(id)a3;
- (void)setNowPlayingSessions:(id)a3;
@end

@implementation MRDMediaServerNowPlayingDataSource

- (MRDMediaServerNowPlayingDataSource)init
{
  v10.receiver = self;
  v10.super_class = (Class)MRDMediaServerNowPlayingDataSource;
  v2 = [(MRDNowPlayingDataSource *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaremote.MRDMediaServerNowPlayingDataSource", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    mediaServerControllerLock = v2->_mediaServerControllerLock;
    v2->_mediaServerControllerLock = (OS_dispatch_queue *)v3;

    [(MRDMediaServerNowPlayingDataSource *)v2 loadMediaServerState];
    v5 = (MSVLRUDictionary *)[objc_alloc((Class)MSVLRUDictionary) initWithMaximumCapacity:10];
    cachedAudioSessions = v2->_cachedAudioSessions;
    v2->_cachedAudioSessions = v5;

    v7 = (CXCallObserver *)objc_alloc_init((Class)MSVWeakLinkClass());
    callObserver = v2->_callObserver;
    v2->_callObserver = v7;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MRDMediaServerNowPlayingDataSource;
  [(MRDMediaServerNowPlayingDataSource *)&v4 dealloc];
}

- (NSDictionary)nowPlayingApplications
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSDictionary *)v2->_cachedNowPlayingApplications copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setNowPlayingApplications:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v4 allValues];
    v8 = MRCreateIndentedDebugDescriptionFromArray();
    int v12 = 138543874;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    CFStringRef v15 = @"nowPlayingApplications";
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v12, 0x20u);
  }
  v9 = self;
  objc_sync_enter(v9);
  objc_super v10 = (NSDictionary *)[v4 copy];
  cachedNowPlayingApplications = v9->_cachedNowPlayingApplications;
  v9->_cachedNowPlayingApplications = v10;

  objc_sync_exit(v9);
}

- (NSDictionary)nowPlayingSessions
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSDictionary *)v2->_cachedNowPlayingSessions copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setNowPlayingSessions:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v4 allValues];
    v8 = MRCreateIndentedDebugDescriptionFromArray();
    int v12 = 138543874;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    CFStringRef v15 = @"nowPlayingSessions";
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v12, 0x20u);
  }
  v9 = self;
  objc_sync_enter(v9);
  objc_super v10 = (NSDictionary *)[v4 copy];
  cachedNowPlayingSessions = v9->_cachedNowPlayingSessions;
  v9->_cachedNowPlayingSessions = v10;

  objc_sync_exit(v9);
}

- (NSDictionary)nowPlayingAudioFormatContentInfos
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSDictionary *)v2->_cachedAudioFormatContentInfos copy];
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (void)setNowPlayingAudioFormatContentInfos:(id)a3
{
  id v4 = a3;
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = [v4 allValues];
    v8 = MRCreateIndentedDebugDescriptionFromArray();
    int v12 = 138543874;
    uint64_t v13 = v6;
    __int16 v14 = 2114;
    CFStringRef v15 = @"nowPlayingAudioFormatContentInfos";
    __int16 v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v12, 0x20u);
  }
  v9 = self;
  objc_sync_enter(v9);
  objc_super v10 = (NSDictionary *)[v4 copy];
  cachedAudioFormatContentInfos = v9->_cachedAudioFormatContentInfos;
  v9->_cachedAudioFormatContentInfos = v10;

  objc_sync_exit(v9);
}

- (NSString)nowPlayingApplicationDisplayID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_cachedNowPlayingAppDisplayID;
  if ([(NSString *)v2->_cachedNowPlayingAppDisplayID isEqualToString:@"AirMusic"]
    || [(NSString *)v2->_cachedNowPlayingAppDisplayID isEqualToString:@"com.apple.AirMusic"])
  {
    CFStringRef v4 = @"com.apple.Music";
LABEL_4:

    id v3 = (__CFString *)v4;
    goto LABEL_5;
  }
  if ([(NSString *)v2->_cachedNowPlayingAppDisplayID isEqualToString:@"AirPodcasts"]
    || [(NSString *)v2->_cachedNowPlayingAppDisplayID isEqualToString:@"com.apple.AirPodcasts"])
  {
    CFStringRef v4 = @"com.apple.podcasts";
    goto LABEL_4;
  }
LABEL_5:
  id v5 = [(__CFString *)v3 copy];

  objc_sync_exit(v2);

  return (NSString *)v5;
}

- (void)setNowPlayingApplicationDisplayID:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    uint64_t v10 = objc_opt_class();
    __int16 v11 = 2114;
    CFStringRef v12 = @"nowPlayingApplicationDisplayID";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v9, 0x20u);
  }

  uint64_t v6 = self;
  objc_sync_enter(v6);
  v7 = (NSString *)[v4 copy];
  cachedNowPlayingAppDisplayID = v6->_cachedNowPlayingAppDisplayID;
  v6->_cachedNowPlayingAppDisplayID = v7;

  objc_sync_exit(v6);
}

- (int)nowPlayingApplicationPID
{
  v2 = self;
  objc_sync_enter(v2);
  int cachedNowPlayingAppPID = v2->_cachedNowPlayingAppPID;
  objc_sync_exit(v2);

  return cachedNowPlayingAppPID;
}

- (void)setNowPlayingApplicationPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = +[NSNumber numberWithInt:v3];
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    CFStringRef v12 = @"nowPlayingApplicationPID";
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v9, 0x20u);
  }
  v8 = self;
  objc_sync_enter(v8);
  v8->_int cachedNowPlayingAppPID = v3;
  objc_sync_exit(v8);
}

- (BOOL)nowPlayingApplicationIsPlaying
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cachedNowPlayingAppIsPlaying = v2->_cachedNowPlayingAppIsPlaying;
  objc_sync_exit(v2);

  return cachedNowPlayingAppIsPlaying;
}

- (void)setNowPlayingApplicationIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    CFStringRef v7 = @"NO";
    if (v3) {
      CFStringRef v7 = @"YES";
    }
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    CFStringRef v12 = @"nowPlayingApplicationIsPlaying";
    __int16 v13 = 2112;
    CFStringRef v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", (uint8_t *)&v9, 0x20u);
  }

  v8 = self;
  objc_sync_enter(v8);
  v8->_BOOL cachedNowPlayingAppIsPlaying = v3;
  objc_sync_exit(v8);
}

- (BOOL)shouldSendCommand:(id)a3
{
  if ([a3 originatedFromAccessory])
  {
    id v4 = [(MRDMediaServerNowPlayingDataSource *)self mediaServerController];
    id v5 = [v4 attributeForKey:AVSystemController_ShouldIgnorePlayCommandsFromAccessoryAttribute];

    if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      unsigned int v6 = [v5 BOOLValue] ^ 1;
      CFStringRef v7 = _MRLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        uint64_t v10 = AVSystemController_ShouldIgnorePlayCommandsFromAccessoryAttribute;
        __int16 v11 = 2112;
        CFStringRef v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MediaServerNowPlayingDataSource] AVSystemController.%@=%@", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)nowPlayingApplicationIsInterrupted
{
  v2 = [(MRDMediaServerNowPlayingDataSource *)self mediaServerController];
  BOOL v3 = [v2 attributeForKey:AVSystemController_NowPlayingAppIsInterruptedAttribute];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)topOfNowPlayingAppStack
{
  v2 = [(MRDMediaServerNowPlayingDataSource *)self mediaServerController];
  BOOL v3 = [v2 topOfNowPlayingAppStack];

  return v3;
}

- (void)_popNowPlayingAppStack
{
  BOOL v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MediaServerNowPlayingDataSource] Popping nowPlayingAppStack..", v5, 2u);
  }

  unsigned __int8 v4 = [(MRDMediaServerNowPlayingDataSource *)self mediaServerController];
  [v4 popNowPlayingAppStack];
}

- (void)_nowPlayingAppDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDMediaServerNowPlayingDataSource *)self mediaServerController];
  unsigned int v6 = [v5 attributeForKey:AVSystemController_NowPlayingAppDisplayIDAttribute];
  id v7 = [v6 copy];

  v8 = [v5 attributeForKey:AVSystemController_NowPlayingAppIsPlayingAttribute];
  id v9 = [v8 BOOLValue];

  uint64_t v10 = [v5 attributeForKey:AVSystemController_NowPlayingAppPIDAttribute];
  id v11 = [v10 intValue];

  CFStringRef v12 = self;
  objc_sync_enter(v12);
  [(MRDMediaServerNowPlayingDataSource *)v12 setNowPlayingApplicationDisplayID:v7];
  [(MRDMediaServerNowPlayingDataSource *)v12 setNowPlayingApplicationPID:v11];
  [(MRDMediaServerNowPlayingDataSource *)v12 setNowPlayingApplicationIsPlaying:v9];
  objc_sync_exit(v12);

  __int16 v13 = [(MRDNowPlayingDataSource *)v12 observersForSelector:"nowPlayingDataSourceNowPlayingApplicationDidChange:"];
  if ([v13 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v17), "nowPlayingDataSourceNowPlayingApplicationDidChange:", v12, (void)v18);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v14 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }
  }
}

- (void)_nowPlayingAppIsPlayingDidChangeNotification:(id)a3
{
  id v4 = [(MRDMediaServerNowPlayingDataSource *)self mediaServerController];
  id v5 = [v4 attributeForKey:AVSystemController_NowPlayingAppIsPlayingAttribute];
  -[MRDMediaServerNowPlayingDataSource setNowPlayingApplicationIsPlaying:](self, "setNowPlayingApplicationIsPlaying:", [v5 BOOLValue]);

  unsigned int v6 = [(MRDNowPlayingDataSource *)self observersForSelector:"nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:"];
  if ([v6 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:", self, (void)v13);
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  CFStringRef v12 = +[MRAVConcreteOutputContext sharedAudioPresentationContext];
  [v12 attemptLogicalDeviceRecovery];
}

- (void)_someSessionIsPlayingDidChangeNotification:(id)a3
{
  id v4 = [(MRDMediaServerNowPlayingDataSource *)self mediaServerController];
  id v5 = [v4 attributeForKey:AVSystemController_PlayingSessionsDescriptionAttribute];

  if (v5)
  {
    unsigned int v6 = [(MRDMediaServerNowPlayingDataSource *)self nowPlayingApplicationsFromSessionsArray:v5];
    [(MRDMediaServerNowPlayingDataSource *)self setNowPlayingApplications:v6];

    id v7 = [(MRDNowPlayingDataSource *)self observersForSelector:"nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:"];
    if ([v7 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          CFStringRef v12 = 0;
          do
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v12), "nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:", self, (void)v13);
            CFStringRef v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)_sourceFormatInfoDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MediaServerNowPlayingDataSource] %@ Handling %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned int v6 = self;
  objc_sync_enter(v6);
  [(MRDMediaServerNowPlayingDataSource *)v6 _updateNowPlayingAudioFormatContentInfo];
  objc_sync_exit(v6);
}

- (void)_renderingModeChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    uint64_t v8 = objc_opt_class();
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Handling %@", (uint8_t *)&v7, 0x16u);
  }

  unsigned int v6 = self;
  objc_sync_enter(v6);
  [(MRDMediaServerNowPlayingDataSource *)v6 _updateNowPlayingAudioFormatContentInfo];
  objc_sync_exit(v6);
}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 object];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MediaServerNowPlayingDataSource] AVAudioSessionMediaServicesWereReset notification received %@", (uint8_t *)&v7, 0xCu);
  }
  [(MRDMediaServerNowPlayingDataSource *)self resetMediaServerState];
  [(MRDMediaServerNowPlayingDataSource *)self loadMediaServerState];
}

- (id)_createMediaServerController
{
  return +[AVSystemController sharedAVSystemController];
}

- (void)setMediaServerController:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    CFStringRef v7 = @"YES";
    if (!v4) {
      CFStringRef v7 = @"NO";
    }
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v6;
    __int16 v18 = 2114;
    CFStringRef v19 = @"mediaServerController";
    __int16 v20 = 2112;
    CFStringRef v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);
  }

  mediaServerControllerLock = self->_mediaServerControllerLock;
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  CFStringRef v12 = sub_10014368C;
  long long v13 = &unk_1004158D8;
  long long v14 = self;
  id v15 = v4;
  id v9 = v4;
  dispatch_barrier_sync((dispatch_queue_t)mediaServerControllerLock, &v10);
  -[MRDMediaServerNowPlayingDataSource loadMediaServerStateWithController:](self, "loadMediaServerStateWithController:", v9, v10, v11, v12, v13, v14);
}

- (AVSystemController)mediaServerController
{
  uint64_t v6 = 0;
  CFStringRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100143798;
  id v10 = sub_1001437A8;
  id v11 = 0;
  mediaServerControllerLock = self->_mediaServerControllerLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001437B0;
  v5[3] = &unk_100415CF0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)mediaServerControllerLock, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AVSystemController *)v3;
}

- (void)loadMediaServerState
{
  id v3 = [(MRDMediaServerNowPlayingDataSource *)self _createMediaServerController];
  [(MRDMediaServerNowPlayingDataSource *)self setMediaServerController:v3];
}

- (void)loadMediaServerStateWithController:(id)a3
{
  id v4 = a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v86 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MediaServerNowPlayingDataSource] loadMediaServerState: %@", buf, 0xCu);
  }

  uint64_t v6 = off_1004779B0[0]();

  if (v6)
  {
    CFStringRef v7 = off_1004779B0[0]();
    v84 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v84 count:1];
    [v4 setAttribute:v8 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    id v9 = +[NSNotificationCenter defaultCenter];
    id v10 = off_1004779B0[0]();
    [v9 addObserver:self selector:"_avSessionMediaServicesResetNotification:" name:v10 object:v4];
  }
  if (AVSystemController_NowPlayingAppPIDDidChangeNotification)
  {
    uint64_t v83 = AVSystemController_NowPlayingAppPIDDidChangeNotification;
    id v11 = +[NSArray arrayWithObjects:&v83 count:1];
    [v4 setAttribute:v11 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    CFStringRef v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:self selector:"_nowPlayingAppDidChangeNotification:" name:AVSystemController_NowPlayingAppPIDDidChangeNotification object:v4];
  }
  if (AVSystemController_NowPlayingAppIsPlayingDidChangeNotification)
  {
    uint64_t v82 = AVSystemController_NowPlayingAppIsPlayingDidChangeNotification;
    long long v13 = +[NSArray arrayWithObjects:&v82 count:1];
    [v4 setAttribute:v13 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

    long long v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:self selector:"_nowPlayingAppIsPlayingDidChangeNotification:" name:AVSystemController_NowPlayingAppIsPlayingDidChangeNotification object:v4];
  }
  id v15 = +[MRUserSettings currentSettings];
  unsigned int v16 = [v15 needsMXApplications];

  if (v16)
  {
    if (AVSystemController_SomeSessionIsPlayingDidChangeNotification)
    {
      uint64_t v81 = AVSystemController_SomeSessionIsPlayingDidChangeNotification;
      uint64_t v17 = +[NSArray arrayWithObjects:&v81 count:1];
      [v4 setAttribute:v17 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

      __int16 v18 = +[NSNotificationCenter defaultCenter];
      [v18 addObserver:self selector:"_someSessionIsPlayingDidChangeNotification:" name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:v4];
    }
    if (AVSystemController_SourceFormatInfoDidChangeNotification)
    {
      uint64_t v80 = AVSystemController_SourceFormatInfoDidChangeNotification;
      CFStringRef v19 = +[NSArray arrayWithObjects:&v80 count:1];
      [v4 setAttribute:v19 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

      __int16 v20 = +[NSNotificationCenter defaultCenter];
      [v20 addObserver:self selector:"_sourceFormatInfoDidChangeNotification:" name:AVSystemController_SourceFormatInfoDidChangeNotification object:v4];
    }
  }
  CFStringRef v21 = [v4 attributeForKey:AVSystemController_NowPlayingAppDisplayIDAttribute];
  id v22 = [v21 copy];

  v23 = [v4 attributeForKey:AVSystemController_NowPlayingAppIsPlayingAttribute];
  id v24 = [v23 BOOLValue];

  v25 = [v4 attributeForKey:AVSystemController_NowPlayingAppPIDAttribute];
  id v26 = [v25 intValue];

  v27 = +[MRUserSettings currentSettings];
  unsigned int v28 = [v27 needsMXApplications];

  if (v28)
  {
    v29 = [v4 attributeForKey:AVSystemController_PlayingSessionsDescriptionAttribute];
    v30 = [(MRDMediaServerNowPlayingDataSource *)self nowPlayingApplicationsFromSessionsArray:v29];

    v31 = [(MRDMediaServerNowPlayingDataSource *)self nowPlayingAudioFormatContentInfosFromNowPlayingApplications:v30];
  }
  else
  {
    v30 = 0;
    v31 = 0;
  }
  v32 = self;
  objc_sync_enter(v32);
  [(MRDMediaServerNowPlayingDataSource *)v32 setNowPlayingApplicationDisplayID:v22];
  [(MRDMediaServerNowPlayingDataSource *)v32 setNowPlayingApplicationIsPlaying:v24];
  [(MRDMediaServerNowPlayingDataSource *)v32 setNowPlayingApplicationPID:v26];
  [(MRDMediaServerNowPlayingDataSource *)v32 setNowPlayingSessions:0];
  [(MRDMediaServerNowPlayingDataSource *)v32 setNowPlayingApplications:v30];
  [(MRDMediaServerNowPlayingDataSource *)v32 setNowPlayingAudioFormatContentInfos:v31];
  objc_sync_exit(v32);

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v33 = [(MRDNowPlayingDataSource *)v32 observersForSelector:"nowPlayingDataSourceNowPlayingApplicationDidChange:"];
  id v34 = [v33 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v72;
    do
    {
      v36 = 0;
      do
      {
        if (*(void *)v72 != v35) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v71 + 1) + 8 * (void)v36) nowPlayingDataSourceNowPlayingApplicationDidChange:v32];
        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      id v34 = [v33 countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v34);
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v37 = [(MRDNowPlayingDataSource *)v32 observersForSelector:"nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:"];
  id v38 = [v37 countByEnumeratingWithState:&v67 objects:v78 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v68;
    do
    {
      v40 = 0;
      do
      {
        if (*(void *)v68 != v39) {
          objc_enumerationMutation(v37);
        }
        [*(id *)(*((void *)&v67 + 1) + 8 * (void)v40) nowPlayingDataSourceNowPlayingApplicationPlaybackStateDidChange:v32];
        v40 = (char *)v40 + 1;
      }
      while (v38 != v40);
      id v38 = [v37 countByEnumeratingWithState:&v67 objects:v78 count:16];
    }
    while (v38);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v41 = [(MRDNowPlayingDataSource *)v32 observersForSelector:"nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:"];
  id v42 = [v41 countByEnumeratingWithState:&v63 objects:v77 count:16];
  if (v42)
  {
    uint64_t v43 = *(void *)v64;
    do
    {
      v44 = 0;
      do
      {
        if (*(void *)v64 != v43) {
          objc_enumerationMutation(v41);
        }
        [*(id *)(*((void *)&v63 + 1) + 8 * (void)v44) nowPlayingDataSourceNowPlayingSessionsPlaybackStateDidChange:v32];
        v44 = (char *)v44 + 1;
      }
      while (v42 != v44);
      id v42 = [v41 countByEnumeratingWithState:&v63 objects:v77 count:16];
    }
    while (v42);
  }

  v45 = +[MRUserSettings currentSettings];
  unsigned int v46 = [v45 needsMXApplications];

  if (v46)
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    v47 = [(MRDNowPlayingDataSource *)v32 observersForSelector:"nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:"];
    id v48 = [v47 countByEnumeratingWithState:&v59 objects:v76 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v60;
      do
      {
        v50 = 0;
        do
        {
          if (*(void *)v60 != v49) {
            objc_enumerationMutation(v47);
          }
          [*(id *)(*((void *)&v59 + 1) + 8 * (void)v50) nowPlayingDataSourceNowPlayingApplicationsPlaybackStateDidChange:v32];
          v50 = (char *)v50 + 1;
        }
        while (v48 != v50);
        id v48 = [v47 countByEnumeratingWithState:&v59 objects:v76 count:16];
      }
      while (v48);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v51 = -[MRDNowPlayingDataSource observersForSelector:](v32, "observersForSelector:", "nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:", 0);
    id v52 = [v51 countByEnumeratingWithState:&v55 objects:v75 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v56;
      do
      {
        v54 = 0;
        do
        {
          if (*(void *)v56 != v53) {
            objc_enumerationMutation(v51);
          }
          [*(id *)(*((void *)&v55 + 1) + 8 * (void)v54) nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:v32];
          v54 = (char *)v54 + 1;
        }
        while (v52 != v54);
        id v52 = [v51 countByEnumeratingWithState:&v55 objects:v75 count:16];
      }
      while (v52);
    }
  }
}

- (void)resetMediaServerState
{
  id v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[MediaServerNowPlayingDataSource] resetMediaServerState", v6, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  id v5 = off_1004779B0[0]();
  [v4 removeObserver:self name:v5 object:0];

  [v4 removeObserver:self name:AVSystemController_NowPlayingAppPIDDidChangeNotification object:0];
  [v4 removeObserver:self name:AVSystemController_NowPlayingAppIsPlayingDidChangeNotification object:0];
  [v4 removeObserver:self name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:0];
  [v4 removeObserver:self name:AVSystemController_SourceFormatInfoDidChangeNotification object:0];
}

- (id)nowPlayingApplicationsFromSessionsArray:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 objectForKeyedSubscript:AVSystemController_PlayingSessionsDescriptionKey_ClientPID];
        id v11 = [v9 objectForKeyedSubscript:AVSystemController_PlayingSessionsDescriptionKey_AudioSessionID];
        CFStringRef v12 = [v9 objectForKeyedSubscript:AVSystemController_PlayingSessionsDescriptionKey_MXSessionIDs];
        long long v13 = +[NSSet setWithArray:v12];

        long long v14 = [v9 objectForKeyedSubscript:AVSystemController_PlayingSessionsDescriptionKey_IsNowPlayingEligible];
        id v15 = -[MRDNowPlayingDataSourceApplication initWithPID:audioSessionID:mxSessionIDs:isEligible:]([MRDNowPlayingDataSourceApplication alloc], "initWithPID:audioSessionID:mxSessionIDs:isEligible:", [v10 intValue], v11, v13, objc_msgSend(v14, "BOOLValue"));
        [v4 setObject:v15 forKeyedSubscript:v11];
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  id v16 = [v4 copy];

  return v16;
}

- (id)nowPlayingAudioFormatContentInfosFromNowPlayingApplications:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "allValues", 0);
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        CFStringRef v12 = [(MRDMediaServerNowPlayingDataSource *)self audioFormatContentInfoForApplication:v11 cachedAudioFormatContentInfo:0];
        long long v13 = [v11 audioSessionID];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_updateNowPlayingAudioFormatContentInfo
{
  id v3 = [(MRDMediaServerNowPlayingDataSource *)self nowPlayingApplications];
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  id v5 = [(MRDMediaServerNowPlayingDataSource *)self nowPlayingAudioFormatContentInfos];
  if ([v3 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v25 = v3;
    id v6 = [v3 allValues];
    id v7 = [v6 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          CFStringRef v12 = [v11 audioSessionID];
          long long v13 = [v5 objectForKeyedSubscript:v12];

          long long v14 = [(MRDMediaServerNowPlayingDataSource *)self audioFormatContentInfoForApplication:v11 cachedAudioFormatContentInfo:v13];
          long long v15 = [v11 audioSessionID];
          [v4 setObject:v14 forKeyedSubscript:v15];
        }
        id v8 = [v6 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v8);
    }

    long long v16 = (NSDictionary *)[v4 copy];
    cachedAudioFormatContentInfos = self->_cachedAudioFormatContentInfos;
    self->_cachedAudioFormatContentInfos = v16;

    long long v18 = [(MRDNowPlayingDataSource *)self observersForSelector:"nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:"];
    if ([v18 count])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v18 = v18;
      id v19 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v27;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v27 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v26 + 1) + 8 * (void)j) nowPlayingDataSourceNowPlayingAudioFormatContentInfosDidChange:self];
          }
          id v20 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
        }
        while (v20);
      }
    }
    id v3 = v25;
  }
  else
  {
    long long v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      id v24 = self->_cachedAudioFormatContentInfos;
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v23;
      __int16 v36 = 2114;
      v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ skipping update with no now playing applications | cached audio format content info: %{public}@", buf, 0x16u);
    }
  }
}

- (id)audioFormatContentInfoForApplication:(id)a3 cachedAudioFormatContentInfo:(id)a4
{
  id v6 = a3;
  id v52 = a4;
  id v7 = [v6 audioSessionID];

  if (!v7)
  {
    id v16 = 0;
    goto LABEL_32;
  }
  id v8 = [v6 audioSessionID];
  id v9 = [v8 unsignedIntValue];

  v50 = sub_10016A1D8((int)[v6 pid]);
  id v10 = self;
  objc_sync_enter(v10);
  cachedAudioSessions = v10->_cachedAudioSessions;
  CFStringRef v12 = +[NSNumber numberWithUnsignedInt:v9];
  id v13 = [(MSVLRUDictionary *)cachedAudioSessions objectForKeyedSubscript:v12];

  if (!v13)
  {
    memset(v54, 0, 32);
    long long v14 = +[RBSProcessHandle currentProcess];
    long long v15 = v14;
    if (v14) {
      [v14 auditToken];
    }
    else {
      memset(v54, 0, 32);
    }

    id v17 = objc_alloc((Class)off_1004779B8[0]());
    *(_OWORD *)buf = *(_OWORD *)v54;
    *(_OWORD *)&buf[16] = *(_OWORD *)&v54[16];
    id v13 = [v17 initSiblingSession:v9 auditToken:buf clientIdentifier:@"MediaRemote" autoReconnect:0];
    long long v18 = _MRLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v9;
      *(_WORD *)&buf[18] = 2114;
      *(void *)&buf[20] = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ getting sibling audio session for: %u | session: %{public}@", buf, 0x1Cu);
    }

    [(MRDMediaServerNowPlayingDataSource *)v10 addCachedAudioSession:v13 forID:v9];
    if (!v13)
    {
      uint64_t v20 = [(Class)off_1004779B8[0]() retrieveSessionWithID:v9];
      uint64_t v21 = _MRLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_opt_class();
        *(_DWORD *)v54 = 138543874;
        *(void *)&v54[4] = v22;
        *(_WORD *)&v54[12] = 1024;
        *(_DWORD *)&v54[14] = v9;
        *(_WORD *)&v54[18] = 2114;
        *(void *)&v54[20] = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ falling back to retrieve audio session for: %u | session: %{public}@", v54, 0x1Cu);
      }

      id v13 = (id)v20;
      [(MRDMediaServerNowPlayingDataSource *)v10 addCachedAudioSession:v20 forID:v9];
    }
  }
  uint64_t v49 = v13;
  objc_sync_exit(v10);

  v51 = [v13 consolidatedSourceContentInfo];
  uint64_t v23 = _MRLogForCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = objc_opt_class();
    unsigned int v25 = [v6 pid];
    long long v26 = [v6 audioSessionID];
    *(_DWORD *)v54 = 138544386;
    *(void *)&v54[4] = v24;
    *(_WORD *)&v54[12] = 1024;
    *(_DWORD *)&v54[14] = v25;
    *(_WORD *)&v54[18] = 2114;
    *(void *)&v54[20] = v50;
    *(_WORD *)&v54[28] = 2114;
    *(void *)&v54[30] = v26;
    __int16 v55 = 2114;
    long long v56 = v51;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ pid: %i | bundle id: %{public}@ | session id: %{public}@ | consolidated info: %{public}@", v54, 0x30u);
  }
  long long v27 = [(MRDMediaServerNowPlayingDataSource *)v10 contentInfoForConsolidatedSourceContentInfo:v51];
  uint64_t v53 = [(MRDMediaServerNowPlayingDataSource *)v10 bestAvailableContentForConsolidatedSourceContentInfo:v51];
  long long v28 = off_1004779C0[0]();
  long long v29 = [v27 objectForKeyedSubscript:v28];

  long long v30 = off_1004779C8[0]();
  long long v31 = [v27 objectForKeyedSubscript:v30];

  long long v32 = off_1004779D0[0]();
  long long v33 = [v27 objectForKeyedSubscript:v32];

  id v34 = off_1004779D8[0]();
  uint64_t v35 = [v27 objectForKeyedSubscript:v34];

  id v48 = [v49 renderingMode];
  __int16 v36 = _MRLogForCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v37 = objc_opt_class();
    id v38 = [v6 audioSessionID];
    unsigned int v39 = [v6 pid];
    *(_DWORD *)v54 = 138545666;
    *(void *)&v54[4] = v37;
    *(_WORD *)&v54[12] = 2114;
    *(void *)&v54[14] = v38;
    *(_WORD *)&v54[22] = 1024;
    *(_DWORD *)&v54[24] = v39;
    *(_WORD *)&v54[28] = 2114;
    *(void *)&v54[30] = v50;
    __int16 v55 = 2114;
    long long v56 = v29;
    __int16 v57 = 2114;
    long long v58 = v31;
    __int16 v59 = 2114;
    long long v60 = v53;
    __int16 v61 = 2114;
    long long v62 = v33;
    __int16 v63 = 2114;
    long long v64 = v35;
    __int16 v65 = 2048;
    id v66 = v48;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ selected audio format info | session id: %{public}@ | pid: %i | bundle id: %{public}@ | audio format: %{public}@ | channel #: %{public}@ | available: %{public}@ | eligible: %{public}@ | active: %{public}@ | rendering mode: %ld", v54, 0x62u);
  }
  if (v29)
  {
    if (v31) {
      goto LABEL_22;
    }
  }
  else
  {
    long long v29 = [v52 audioFormat];
    if (v31) {
      goto LABEL_22;
    }
  }
  long long v31 = [v52 channelCount];
LABEL_22:
  if (!v53)
  {
    uint64_t v53 = [v52 bestAvailableContent];
  }
  if (v33)
  {
    if (!v35) {
      goto LABEL_28;
    }
  }
  else
  {
    long long v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v52 isEligibleForSpatialization]);
    if (!v35)
    {
LABEL_28:
      uint64_t v35 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v52 isSpatialized]);
    }
  }
  id v40 = objc_alloc((Class)MRNowPlayingAudioFormatContentInfo);
  id v41 = [v6 pid];
  id v42 = [v6 audioSessionID];
  id v16 = [v40 initWithPid:v41 bundleID:v50 audioSessionID:v42 audioFormat:v29 channelCount:v31 bestAvailableContent:v53 isEligibleForSpatialization:v33 isSpatialized:v35];

  [v16 setRenderingMode:v48];
  uint64_t v43 = _MRLogForCategory();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = objc_opt_class();
    v45 = [v6 audioSessionID];
    unsigned int v46 = [v6 pid];
    *(_DWORD *)v54 = 138545410;
    *(void *)&v54[4] = v44;
    *(_WORD *)&v54[12] = 2114;
    *(void *)&v54[14] = v45;
    *(_WORD *)&v54[22] = 1024;
    *(_DWORD *)&v54[24] = v46;
    *(_WORD *)&v54[28] = 2114;
    *(void *)&v54[30] = v50;
    __int16 v55 = 2114;
    long long v56 = v29;
    __int16 v57 = 2114;
    long long v58 = v31;
    __int16 v59 = 2114;
    long long v60 = v53;
    __int16 v61 = 2114;
    long long v62 = v33;
    __int16 v63 = 2114;
    long long v64 = v35;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ cached selected audio format info | session id: %{public}@ | pid: %i | bundle id: %{public}@ | audio format: %{public}@ | channel #: %{public}@ | available: %{public}@ | eligible: %{public}@ | active: %{public}@", v54, 0x58u);
  }
LABEL_32:

  return v16;
}

- (id)contentInfoForConsolidatedSourceContentInfo:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstObject];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    unsigned int v7 = 0;
    unsigned int v8 = 0;
    uint64_t v21 = *(void *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v21) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = off_1004779C8[0]();
        CFStringRef v12 = [v10 objectForKeyedSubscript:v11];
        unsigned int v13 = [v12 unsignedIntValue];

        long long v14 = off_1004779D0[0]();
        long long v15 = [v10 objectForKeyedSubscript:v14];
        unsigned int v16 = [v15 BOOLValue];

        if (v13 <= v7 && ((v16 & ~v8) != 1 || v13 != v7)) {
          continue;
        }
        id v18 = v10;

        unsigned int v7 = v13;
        unsigned int v8 = v16;
        id v4 = v18;
      }
      id v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)bestAvailableContentForConsolidatedSourceContentInfo:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = off_1004779E0[0]();
        CFStringRef v12 = objc_msgSend(v10, "objectForKeyedSubscript:", v11, (void)v18);

        if (v12) {
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  id v13 = kMXSession_SourceFormatInfoKey_BestAvailableContentType_Atmos;
  id v14 = kMXSession_SourceFormatInfoKey_BestAvailableContentType_Multichannel;
  if ([v4 containsObject:v13])
  {
    id v15 = v13;
  }
  else if ([v4 containsObject:v14])
  {
    id v15 = v14;
  }
  else
  {
    id v15 = [v4 anyObject];
  }
  unsigned int v16 = v15;

  return v16;
}

- (void)addCachedAudioSession:(id)a3 forID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  cachedAudioSessions = self->_cachedAudioSessions;
  uint64_t v8 = +[NSNumber numberWithUnsignedInt:v4];
  [(MSVLRUDictionary *)cachedAudioSessions setObject:v6 forKeyedSubscript:v8];

  uint64_t v9 = off_1004779E8[0]();
  id v10 = (void *)v9;
  id v11 = 0;
  if (v6 && v9)
  {
    uint64_t v21 = v9;
    CFStringRef v12 = +[NSArray arrayWithObjects:&v21 count:1];
    id v16 = 0;
    [v6 subscribeToNotifications:v12 error:&v16];
    id v11 = v16;

    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"_renderingModeChangeNotification:" name:v10 object:v6];
  }
  id v14 = _MRLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [(MSVLRUDictionary *)self->_cachedAudioSessions count];
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2048;
    id v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[MediaServerNowPlayingDataSource] Adding new audioSession %@ for a total of %ld", buf, 0x16u);
  }
}

- (id)description
{
  id v3 = [(MRDMediaServerNowPlayingDataSource *)self _createMediaServerController];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  id v5 = (objc_class *)objc_opt_class();
  long long v23 = NSStringFromClass(v5);
  mediaServerController = v4->_mediaServerController;
  uint64_t cachedNowPlayingAppPID = v4->_cachedNowPlayingAppPID;
  long long v25 = [v3 attributeForKey:AVSystemController_NowPlayingAppPIDAttribute];
  id v19 = [v25 intValue];
  cachedNowPlayingAppDisplayID = v4->_cachedNowPlayingAppDisplayID;
  long long v22 = [v3 attributeForKey:AVSystemController_NowPlayingAppDisplayIDAttribute];
  if (v4->_cachedNowPlayingAppIsPlaying) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  CFStringRef v17 = v6;
  long long v24 = [v3 attributeForKey:AVSystemController_NowPlayingAppIsPlayingAttribute];
  if ([v24 BOOLValue]) {
    CFStringRef v7 = @"true";
  }
  else {
    CFStringRef v7 = @"false";
  }
  uint64_t v8 = [(NSDictionary *)v4->_cachedNowPlayingApplications allValues];
  uint64_t v9 = MRCreateIndentedDebugDescriptionFromArray();
  id v10 = [v3 attributeForKey:AVSystemController_PlayingSessionsDescriptionAttribute];
  id v11 = [(NSDictionary *)v4->_cachedAudioFormatContentInfos allValues];
  CFStringRef v12 = MRCreateIndentedDebugDescriptionFromArray();
  id v13 = [(MSVLRUDictionary *)v4->_cachedAudioSessions count];
  id v14 = [v3 topOfNowPlayingAppStack];
  id v15 = +[NSString stringWithFormat:@"%@ %p {\n  %@ vs %@\n  cachedPID %d vs coreMedia %d\n  cachedDisplayID %@ vs CoreMedia %@\n  cachedIsPlaying %@ vs CoreMedia %@\n  cachedApplications %@ vs CoreMedia %@\n  cachedAudioFormatContentInfo = %@\n  audioSessions = %ld\n  topOfNowPlayingAppStack = %@\n}", v23, v4, mediaServerController, v3, cachedNowPlayingAppPID, v19, cachedNowPlayingAppDisplayID, v22, v17, v7, v9, v10, v12, v13, v14];

  objc_sync_exit(v4);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_mediaServerControllerLock, 0);
  objc_storeStrong((id *)&self->_mediaServerController, 0);
  objc_storeStrong((id *)&self->_cachedAudioFormatContentInfos, 0);
  objc_storeStrong((id *)&self->_cachedNowPlayingSessions, 0);
  objc_storeStrong((id *)&self->_cachedAudioSessions, 0);
  objc_storeStrong((id *)&self->_cachedNowPlayingApplications, 0);

  objc_storeStrong((id *)&self->_cachedNowPlayingAppDisplayID, 0);
}

@end