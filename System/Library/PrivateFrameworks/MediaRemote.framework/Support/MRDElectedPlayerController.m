@interface MRDElectedPlayerController
- (BOOL)_shouldUseNotification:(id)a3;
- (MRDElectedPlayerController)initWithOriginClient:(id)a3;
- (MRDElectedPlayerControllerDelegate)delegate;
- (MRDNowPlayingOriginClient)originClient;
- (MRPlayerPath)electedPlayerPath;
- (MRPlayerPath)previousElectedPlayerPath;
- (NSString)activeSystemEndpointOutputDeviceUID;
- (NSString)event;
- (NSString)eventReason;
- (NSString)mostRecentEvent;
- (NSString)mostRecentEventReason;
- (NSString)mostRecentSelectionReason;
- (NSString)selectionReason;
- (id)_onSyncSelf_calculateElectedPlayerForOriginClient:(id)a3 event:(int64_t)a4 reason:(id *)a5;
- (int64_t)_resolveChangeTypeWithOriginClient:(id)a3 forEvent:(int64_t)a4;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_handleIsPlayingDidChangeNotification:(id)a3;
- (void)_handleNowPlayingApplicationDidChangeNotification:(id)a3;
- (void)_handleNowPlayingApplicationDidForegroundNotification:(id)a3;
- (void)_handlePlaybackQueueChangedNotification:(id)a3;
- (void)_onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:(int64_t)a3;
- (void)_onSyncSelf_reevaluateElectedPlayerForEvent:(int64_t)a3 withReason:(id)a4;
- (void)setActiveSystemEndpointOutputDeviceUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOriginClient:(id)a3;
- (void)setOriginClient:(id)a3 withChangeType:(int64_t)a4;
@end

@implementation MRDElectedPlayerController

- (MRDElectedPlayerController)initWithOriginClient:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRDElectedPlayerController;
  v5 = [(MRDElectedPlayerController *)&v12 init];
  if (v5)
  {
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_handlePlaybackQueueChangedNotification:" name:kMRNowPlayingPlaybackQueueChangedNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v5 selector:"_handleIsPlayingDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationIsPlayingDidChangeNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v5 selector:"_handleNowPlayingApplicationDidChangeNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationDidChangeNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v5 selector:"_handleNowPlayingApplicationDidForegroundNotification:" name:kMRMediaRemoteOriginNowPlayingApplicationDidForegroundNotification object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v5 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];

    [(MRDElectedPlayerController *)v5 setOriginClient:v4];
  }

  return v5;
}

- (void)setOriginClient:(id)a3
{
  v20 = (MRDNowPlayingOriginClient *)a3;
  v5 = self;
  objc_sync_enter(v5);
  p_originClient = (id *)&v5->_originClient;
  originClient = v5->_originClient;
  if (originClient) {
    BOOL v8 = originClient == v20;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    v9 = originClient;
    objc_storeStrong((id *)&v5->_originClient, a3);
    id v10 = objc_alloc((Class)NSString);
    v19 = [(MRDNowPlayingOriginClient *)v9 deviceInfo];
    v11 = [v19 deviceUID];
    objc_super v12 = [(MRDNowPlayingOriginClient *)v9 deviceInfo];
    v13 = [v12 name];
    v14 = [*p_originClient deviceInfo];
    v15 = [v14 deviceUID];
    v16 = [*p_originClient deviceInfo];
    v17 = [v16 name];
    id v18 = [v10 initWithFormat:@"ElectedOrigin changed from <%@> (<%@>) to <%@> (<%@>)", v11, v13, v15, v17];
    [(MRDElectedPlayerController *)v5 _onSyncSelf_reevaluateElectedPlayerForEvent:0 withReason:v18];
  }
  objc_sync_exit(v5);
}

- (void)setOriginClient:(id)a3 withChangeType:(int64_t)a4
{
  id v9 = a3;
  v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = +[NSNumber numberWithInteger:a4];
  changeType = v6->_changeType;
  v6->_changeType = (NSNumber *)v7;

  [(MRDElectedPlayerController *)v6 setOriginClient:v9];
  objc_sync_exit(v6);
}

- (void)setActiveSystemEndpointOutputDeviceUID:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  activeSystemEndpointOutputDeviceUID = obj->_activeSystemEndpointOutputDeviceUID;
  obj->_activeSystemEndpointOutputDeviceUID = v4;

  objc_sync_exit(obj);
}

- (NSString)activeSystemEndpointOutputDeviceUID
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSString *)v2->_activeSystemEndpointOutputDeviceUID copy];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (MRPlayerPath)electedPlayerPath
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_electedPlayerPath;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_shouldUseNotification:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = MRGetOriginFromUserInfo();

  v6 = [(MRDNowPlayingOriginClient *)self->_originClient origin];
  LOBYTE(v4) = [v5 isEqual:v6];

  return (char)v4;
}

- (void)_handlePlaybackQueueChangedNotification:(id)a3
{
  id v7 = a3;
  id v4 = [v7 playerPath];
  v5 = self;
  objc_sync_enter(v5);
  if ([(MRDElectedPlayerController *)v5 _shouldUseNotification:v7])
  {
    id v6 = [objc_alloc((Class)NSString) initWithFormat:@"%@ PlaybackQueueChanged", v4];
    [(MRDElectedPlayerController *)v5 _onSyncSelf_reevaluateElectedPlayerForEvent:5 withReason:v6];

    [(MRDElectedPlayerController *)v5 _onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:5];
  }
  objc_sync_exit(v5);
}

- (void)_handleIsPlayingDidChangeNotification:(id)a3
{
  id v12 = a3;
  id v4 = [v12 userInfo];
  v5 = [v4 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = [v12 playerPath];
  BOOL v8 = self;
  objc_sync_enter(v8);
  if ([(MRDElectedPlayerController *)v8 _shouldUseNotification:v12])
  {
    id v9 = objc_alloc((Class)NSString);
    CFStringRef v10 = @"stopped";
    if (v6) {
      CFStringRef v10 = @"started";
    }
    id v11 = [v9 initWithFormat:@"%@ Playback %@", v7, v10];
    [(MRDElectedPlayerController *)v8 _onSyncSelf_reevaluateElectedPlayerForEvent:1 withReason:v11];

    [(MRDElectedPlayerController *)v8 _onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:1];
  }
  objc_sync_exit(v8);
}

- (void)_handleNowPlayingApplicationDidChangeNotification:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([(MRDElectedPlayerController *)v4 _shouldUseNotification:v8])
  {
    v5 = [v8 userInfo];
    unsigned int v6 = MRGetPlayerPathFromUserInfo();

    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"NowPlayingAppChanged to %@", v6];
    [(MRDElectedPlayerController *)v4 _onSyncSelf_reevaluateElectedPlayerForEvent:3 withReason:v7];
  }
  objc_sync_exit(v4);
}

- (void)_handleNowPlayingApplicationDidForegroundNotification:(id)a3
{
  id v11 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if ([(MRDElectedPlayerController *)v4 _shouldUseNotification:v11])
  {
    v5 = [v11 userInfo];
    unsigned int v6 = [v5 objectForKeyedSubscript:kMRMediaRemoteApplicationForegroundUserInfoKey];
    unsigned int v7 = [v6 BOOLValue];

    id v8 = objc_alloc((Class)NSString);
    CFStringRef v9 = @"Back";
    if (v7) {
      CFStringRef v9 = @"Fore";
    }
    id v10 = [v8 initWithFormat:@"Was %@grounded", v9];
    [(MRDElectedPlayerController *)v4 _onSyncSelf_reevaluateElectedPlayerForEvent:4 withReason:v10];
  }
  objc_sync_exit(v4);
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  unsigned int v6 = [v5 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];
  id v7 = [v6 integerValue];

  if (v7 == (id)1)
  {
    id v8 = [v4 userInfo];
    CFStringRef v9 = [v8 objectForKeyedSubscript:kMRAVEndpointOutputDeviceIdentifierUserInfoKey];

    [(MRDElectedPlayerController *)self setActiveSystemEndpointOutputDeviceUID:v9];
    id v10 = [v4 userInfo];
    id v11 = [v10 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointChangeTypeUserInfoKey];
    [v11 integerValue];

    id v12 = v9;
    MRAVEndpointResolveActiveSystemEndpointWithType();
  }
}

- (void)_onSyncSelf_reevaluateElectedPlayerForEvent:(int64_t)a3 withReason:(id)a4
{
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10032F66C(a3, (uint64_t)v7, v8);
  }

  originClient = self->_originClient;
  id v40 = 0;
  id v10 = [(MRDElectedPlayerController *)self _onSyncSelf_calculateElectedPlayerForOriginClient:originClient event:a3 reason:&v40];
  id v11 = v40;
  id v12 = v40;
  v13 = [v10 playerPath];
  objc_storeStrong((id *)&self->_mostRecentEventReason, a4);
  objc_storeStrong((id *)&self->_mostRecentSelectionReason, v11);
  v14 = 0;
  if ((unint64_t)a3 <= 5) {
    v14 = (NSString *)*(&off_10041D458 + a3);
  }
  mostRecentEvent = self->_mostRecentEvent;
  self->_mostRecentEvent = v14;

  v16 = self->_electedPlayerPath;
  if (v13 == v16)
  {
  }
  else
  {
    v17 = v16;
    id v18 = v13;
    unsigned __int8 v19 = [(MRPlayerPath *)v18 isEqual:v17];

    if ((v19 & 1) == 0)
    {
      v20 = (MRPlayerPath *)[(MRPlayerPath *)self->_electedPlayerPath copy];
      previousElectedPlayerPath = self->_previousElectedPlayerPath;
      self->_previousElectedPlayerPath = v20;

      v22 = (MRPlayerPath *)[(MRPlayerPath *)v18 copy];
      electedPlayerPath = self->_electedPlayerPath;
      self->_electedPlayerPath = v22;

      objc_storeStrong((id *)&self->_eventReason, self->_mostRecentEventReason);
      objc_storeStrong((id *)&self->_selectionReason, self->_mostRecentSelectionReason);
      objc_storeStrong((id *)&self->_event, self->_mostRecentEvent);
      int64_t v24 = [(MRDElectedPlayerController *)self _resolveChangeTypeWithOriginClient:self->_originClient forEvent:a3];
      v25 = _MRLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = v7;
        v26 = self->_previousElectedPlayerPath;
        v33 = self->_electedPlayerPath;
        uint64_t v27 = MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
        v28 = (void *)v27;
        if ((unint64_t)a3 > 5) {
          uint64_t v29 = 0;
        }
        else {
          uint64_t v29 = (uint64_t)*(&off_10041D458 + a3);
        }
        *(_DWORD *)buf = 138413570;
        v42 = v26;
        __int16 v43 = 2112;
        id v7 = v34;
        v44 = v33;
        __int16 v45 = 2114;
        uint64_t v46 = v27;
        __int16 v47 = 2114;
        uint64_t v48 = v29;
        __int16 v49 = 2114;
        id v50 = v34;
        __int16 v51 = 2114;
        id v52 = v12;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[MRDElectedPlayerController] ElectedPlayer changed from <%@> to <%@> changeType=<%{public}@>, event=%{public}@, eventReason=%{public}@, selectionReason=%{public}@", buf, 0x3Eu);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100114158;
      block[3] = &unk_10041D438;
      block[4] = self;
      v36 = v18;
      int64_t v38 = v24;
      int64_t v39 = a3;
      id v37 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      changeType = self->_changeType;
      self->_changeType = 0;

      [(MRDElectedPlayerController *)self _onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:a3];
      goto LABEL_17;
    }
  }
  v30 = _MRLogForCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v32 = self->_electedPlayerPath;
    *(_DWORD *)buf = 138412802;
    v42 = v32;
    __int16 v43 = 2114;
    v44 = (MRPlayerPath *)v7;
    __int16 v45 = 2114;
    uint64_t v46 = (uint64_t)v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "[MRDElectedPlayerController] ElectedPlayer remained <%@> eventReason=%{public}@, selectionReason=%{public}@", buf, 0x20u);
  }

LABEL_17:
}

- (int64_t)_resolveChangeTypeWithOriginClient:(id)a3 forEvent:(int64_t)a4
{
  id v5 = a3;
  changeType = self->_changeType;
  if (!changeType)
  {
    int64_t v7 = 0;
LABEL_13:
    if (!self->_electedPlayerPath)
    {
      if (self->_previousElectedPlayerPath)
      {
        v16 = [v5 activeNowPlayingClient];
        v17 = [v16 activePlayerClient];
        id v18 = [v17 playerPath];
        unsigned int v19 = [v18 isEqual:self->_previousElectedPlayerPath];

        if (v19)
        {
          v20 = +[MRDMediaRemoteServer server];
          v21 = [v20 nowPlayingServer];
          v22 = [v21 queryExistingPlayerPath:self->_previousElectedPlayerPath];

          v23 = [v22 playerClient];

          if (v23)
          {
            int64_t v24 = _MRLogForCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
              electedPlayerPath = self->_electedPlayerPath;
              previousElectedPlayerPath = self->_previousElectedPlayerPath;
              int v28 = 138543874;
              uint64_t v29 = v25;
              __int16 v30 = 2114;
              v31 = electedPlayerPath;
              __int16 v32 = 2114;
              v33 = previousElectedPlayerPath;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[MRDElectedPlayerController] Manually setting changeType to %{public}@ because changeType uninitialized and playerPath %{public}@ is nil and previousPlayerPath %{public}@ is still valid", (uint8_t *)&v28, 0x20u);
            }
            int64_t v7 = 1;
          }
        }
      }
    }
    goto LABEL_14;
  }
  int64_t v7 = [(NSNumber *)changeType integerValue];
  if (v7 == 1)
  {
    if (self->_previousElectedPlayerPath)
    {
      id v8 = +[MRDMediaRemoteServer server];
      CFStringRef v9 = [v8 nowPlayingServer];
      id v10 = [v9 queryExistingPlayerPath:self->_previousElectedPlayerPath];

      id v11 = [v10 playerClient];

      if (v11)
      {
        int64_t v7 = 1;
      }
      else
      {
        id v12 = _MRLogForCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = (void *)MRMediaRemoteActiveEndpointChangeTypeCopyDescription();
          v14 = self->_previousElectedPlayerPath;
          int v28 = 138543618;
          uint64_t v29 = v13;
          __int16 v30 = 2114;
          v31 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[MRDElectedPlayerController] Manually setting changeType to %{public}@ because previousPlayerPath %{public}@ does not exist anymore", (uint8_t *)&v28, 0x16u);
        }
        int64_t v7 = 0;
      }
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  if (!self->_changeType) {
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (id)_onSyncSelf_calculateElectedPlayerForOriginClient:(id)a3 event:(int64_t)a4 reason:(id *)a5
{
  id v7 = a3;
  id v8 = [v7 activeNowPlayingClient];
  CFStringRef v9 = [v8 activePlayerClient];
  if ([v9 isPlaying])
  {
    id v10 = @"is playing";
LABEL_5:
    *a5 = v10;
LABEL_6:
    id v11 = v9;
    goto LABEL_7;
  }
  if ([v7 isActivityActive])
  {
    id v10 = @"SiriIntent";
    goto LABEL_5;
  }
  if (([v8 isForegrounded] & 1) != 0
    || [v8 supportsBackgroundAudio])
  {
    [v9 timeSincePlaying];
    double v14 = v13;
    if (a4 == 2)
    {
      id v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"was not playing sort of recently <%lf> seconds ago", *(void *)&v13);
LABEL_21:
      id v25 = v15;
      id v11 = 0;
LABEL_22:
      *a5 = v25;
      goto LABEL_7;
    }
    v16 = +[MRUserSettings currentSettings];
    [v16 electedPlayerInterval];
    double v18 = v17;

    if (v14 < v18)
    {
      id v11 = [v9 nowPlayingContentItem];

      id v19 = objc_alloc((Class)NSString);
      if (v11)
      {
        *a5 = objc_msgSend(v19, "initWithFormat:", @"was playing recently <%lf> seconds ago", *(void *)&v14);
        goto LABEL_6;
      }
      id v25 = objc_msgSend(v19, "initWithFormat:", @"was playing recently <%lf> seconds ago but not nowPlayingData", *(void *)&v14);
      goto LABEL_22;
    }
    id v23 = objc_alloc((Class)NSString);
    int64_t v24 = v23;
    if (v9)
    {
      id v15 = objc_msgSend(v23, "initWithFormat:", @"was not playing recently. Last played <%lf> seconds ago", *(void *)&v14);
      goto LABEL_21;
    }
    v21 = [v8 playerPath];
    id v22 = [v24 initWithFormat:@"%@ has no activePlayer", v21];
  }
  else
  {
    id v20 = objc_alloc((Class)NSString);
    if (v8)
    {
      v21 = [v8 playerPath];
      id v22 = [v20 initWithFormat:@"%@ is not foregrounded and does not support background audio", v21];
    }
    else
    {
      v21 = [v7 origin];
      id v22 = [v20 initWithFormat:@"%@ has no activeNowPlayingClient", v21];
    }
  }
  *a5 = v22;

  id v11 = 0;
LABEL_7:

  return v11;
}

- (void)_onSyncSelf_maybeSetupPlaybackTimeoutTimerForEvent:(int64_t)a3
{
  if (self->_electedPlayerPath)
  {
    id v5 = [(MRDNowPlayingOriginClient *)self->_originClient activeNowPlayingClient];
    unsigned int v6 = [v5 activePlayerClient];

    if ([v6 isPlaying])
    {
      playbackTimer = self->_playbackTimer;
      id v8 = objc_alloc((Class)NSString);
      if ((unint64_t)a3 > 5) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = (uint64_t)*(&off_10041D458 + a3);
      }
      id v23 = [v8 initWithFormat:@"electedPlayer %@ is playing for event <%@>", self->_electedPlayerPath, v9];
    }
    else
    {
      [v6 timeSincePlaying];
      double v14 = v13;
      id v15 = +[MRUserSettings currentSettings];
      [v15 electedPlayerInterval];
      double v17 = v16 + 5.0;

      if (v14 < v17)
      {
        double v18 = [v6 playerPath];
        id v19 = objc_alloc((Class)MRPersistentTimer);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1001148E4;
        v27[3] = &unk_100415B20;
        v27[4] = self;
        id v28 = v18;
        int64_t v29 = a3;
        double v30 = v17;
        id v20 = v18;
        v21 = (MRPersistentTimer *)[v19 initWithInterval:@"com.apple.mediaremote.electedplayercontroller.playbacktimer" name:&_dispatch_main_q queue:v27 block:v17 - v14];
        id v22 = self->_playbackTimer;
        self->_playbackTimer = v21;

LABEL_20:
        return;
      }
      playbackTimer = self->_playbackTimer;
      id v24 = objc_alloc((Class)NSString);
      if ((unint64_t)a3 > 5) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = (uint64_t)*(&off_10041D458 + a3);
      }
      id v23 = [v24 initWithFormat:@"electedPlayer %@ was not playing recently for event <%@>", self->_electedPlayerPath, v25];
    }
    id v20 = v23;
    [(MRPersistentTimer *)playbackTimer invalidateWithReason:v23];
    goto LABEL_20;
  }
  id v10 = self->_playbackTimer;
  id v11 = objc_alloc((Class)NSString);
  if ((unint64_t)a3 > 5) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = (uint64_t)*(&off_10041D458 + a3);
  }
  id v26 = [v11 initWithFormat:@"no electedPlayer for event <%@>", v12];
  [(MRPersistentTimer *)v10 invalidateWithReason:v26];
}

- (MRPlayerPath)previousElectedPlayerPath
{
  return self->_previousElectedPlayerPath;
}

- (NSString)event
{
  return self->_event;
}

- (NSString)eventReason
{
  return self->_eventReason;
}

- (NSString)selectionReason
{
  return self->_selectionReason;
}

- (NSString)mostRecentEvent
{
  return self->_mostRecentEvent;
}

- (NSString)mostRecentEventReason
{
  return self->_mostRecentEventReason;
}

- (NSString)mostRecentSelectionReason
{
  return self->_mostRecentSelectionReason;
}

- (MRDElectedPlayerControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MRDElectedPlayerControllerDelegate *)a3;
}

- (MRDNowPlayingOriginClient)originClient
{
  return self->_originClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originClient, 0);
  objc_storeStrong((id *)&self->_mostRecentSelectionReason, 0);
  objc_storeStrong((id *)&self->_mostRecentEventReason, 0);
  objc_storeStrong((id *)&self->_mostRecentEvent, 0);
  objc_storeStrong((id *)&self->_selectionReason, 0);
  objc_storeStrong((id *)&self->_eventReason, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_previousElectedPlayerPath, 0);
  objc_storeStrong((id *)&self->_playbackTimer, 0);
  objc_storeStrong((id *)&self->_changeType, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpointOutputDeviceUID, 0);

  objc_storeStrong((id *)&self->_electedPlayerPath, 0);
}

@end