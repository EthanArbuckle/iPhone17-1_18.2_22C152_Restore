@interface MRDNowPlayingLauncher
- (MRDNowPlayingLauncher)initWithBundleIdentifier:(id)a3 options:(unint64_t)a4;
- (MRDNowPlayingLauncherDelegate)delegate;
- (MSVTimer)playbackStateTimer;
- (NSOperationQueue)notificationOperationQueue;
- (NSString)bundleIdentifier;
- (RBSProcessHandle)processHandle;
- (unint64_t)options;
- (void)_background;
- (void)_cleanup;
- (void)_launch;
- (void)_monitorForTermination:(int)a3;
- (void)_nowPlayingPlaybackStateDidChange:(id)a3;
- (void)_relaunch;
- (void)_startObservingNotifications;
- (void)_stopObservingNotifications;
- (void)_submitLaunchFailure;
- (void)_submitRelaunchEvent:(BOOL)a3;
- (void)_submitTerminationEvent:(unint64_t)a3;
- (void)background;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setNotificationOperationQueue:(id)a3;
- (void)setPlaybackStateTimer:(id)a3;
- (void)setProcessHandle:(id)a3;
@end

@implementation MRDNowPlayingLauncher

- (MRDNowPlayingLauncher)initWithBundleIdentifier:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRDNowPlayingLauncher;
  v8 = [(MRDNowPlayingLauncher *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.mediaremote.nowPlayingLauncherNotifications", v10);
    v12 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    notificationOperationQueue = v9->_notificationOperationQueue;
    v9->_notificationOperationQueue = v12;

    [(NSOperationQueue *)v9->_notificationOperationQueue setUnderlyingQueue:v11];
    v9->_options = a4;
    [(MRDNowPlayingLauncher *)v9 _startObservingNotifications];
  }
  return v9;
}

- (void)dealloc
{
  [(MRDNowPlayingLauncher *)self _stopObservingNotifications];
  [(MRDNowPlayingLauncher *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRDNowPlayingLauncher;
  [(MRDNowPlayingLauncher *)&v3 dealloc];
}

- (void)background
{
}

- (void)_cleanup
{
}

- (void)_launch
{
  objc_super v3 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  objc_initWeak(&location, self);
  v4 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
  v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ ...", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014A5D0;
  v7[3] = &unk_10041E6E8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v3 openApplication:v6 withOptions:0 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_background
{
  objc_super v3 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  uint64_t v13 = FBSOpenApplicationOptionKeyActivateSuspended;
  v14 = &__kCFBooleanTrue;
  v4 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v5 = +[FBSOpenApplicationOptions optionsWithDictionary:v4];

  id v6 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
  id v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Suspending %{public}@ ...", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10014A974;
  v9[3] = &unk_10041E710;
  id v10 = v6;
  id v8 = v6;
  [v3 openApplication:v8 withOptions:v5 completion:v9];
}

- (void)_relaunch
{
  uint64_t v3 = [(MRDNowPlayingLauncher *)self delegate];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(MRDNowPlayingLauncher *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(MRDNowPlayingLauncher *)self delegate];
      id v8 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
      id v9 = [v7 nowPlayingLauncher:self shouldRelaunch:v8];

      id v10 = _MRLogForCategory();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          v12 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
          int v14 = 138543362;
          objc_super v15 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Relaunching terminated process %{public}@", (uint8_t *)&v14, 0xCu);
        }
        [(MRDNowPlayingLauncher *)self _launch];
      }
      else
      {
        if (v11)
        {
          uint64_t v13 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
          int v14 = 138543362;
          objc_super v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not relaunching terminated process %{public}@", (uint8_t *)&v14, 0xCu);
        }
      }
      [(MRDNowPlayingLauncher *)self _submitRelaunchEvent:v9];
    }
  }
}

- (void)_monitorForTermination:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(MRDNowPlayingLauncher *)self processHandle];

  if (v5)
  {
    char v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
      id v8 = [(MRDNowPlayingLauncher *)self processHandle];
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      __int16 v18 = 1026;
      unsigned int v19 = [v8 pid];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Process %{public}@ at pid:%{public}d is already being monitored", buf, 0x12u);
    }
  }
  else
  {
    char v6 = +[RBSProcessIdentifier identifierWithPid:v3];
    id v15 = 0;
    id v9 = +[RBSProcessHandle handleForIdentifier:v6 error:&v15];
    id v10 = v15;
    [(MRDNowPlayingLauncher *)self setProcessHandle:v9];

    if (v10)
    {
      BOOL v11 = _MRLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1003308E4(self, (uint64_t)v10, v11);
      }

      [(MRDNowPlayingLauncher *)self _cleanup];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v12 = [(MRDNowPlayingLauncher *)self processHandle];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10014AE20;
      v13[3] = &unk_10041E738;
      objc_copyWeak(&v14, (id *)buf);
      [v12 monitorForDeath:v13];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_startObservingNotifications
{
  uint64_t v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    BOOL v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start observing NowPlaying notifications for %{public}@", buf, 0xCu);
  }
  MRMediaRemoteSetWantsNowPlayingNotifications();
  objc_initWeak((id *)buf, self);
  v5 = +[NSNotificationCenter defaultCenter];
  char v6 = [(MRDNowPlayingLauncher *)self notificationOperationQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014B170;
  v8[3] = &unk_100418620;
  objc_copyWeak(&v9, (id *)buf);
  id v7 = [v5 addObserverForName:kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification object:0 queue:v6 usingBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_stopObservingNotifications
{
  uint64_t v3 = _MRLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop observing NowPlaying notifications for %{public}@", (uint8_t *)&v6, 0xCu);
  }
  MRMediaRemoteSetWantsNowPlayingNotifications();
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationPlaybackStateDidChangeNotification object:0];
}

- (void)_nowPlayingPlaybackStateDidChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  int v6 = [v5 objectForKeyedSubscript:kMRMediaRemotePlaybackStateUserInfoKey];
  unsigned int v7 = [v6 unsignedIntValue];

  id v8 = [v4 userInfo];
  id v9 = [v8 objectForKeyedSubscript:kMRNowPlayingPlayerPathUserInfoKey];

  id v10 = [v4 userInfo];
  BOOL v11 = [v10 objectForKeyedSubscript:@"_MROriginatingNotification"];

  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10014B60C;
  v22[3] = &unk_10041E760;
  objc_copyWeak(&v25, &location);
  id v12 = v9;
  id v23 = v12;
  unsigned int v26 = v7;
  id v13 = v11;
  id v24 = v13;
  id v14 = +[MSVTimer timerWithInterval:0 repeats:v22 block:1.0];
  playbackStateTimer = self->_playbackStateTimer;
  self->_playbackStateTimer = v14;

  v16 = _MRLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
    *(_DWORD *)buf = 138543874;
    v29 = v17;
    __int16 v30 = 1026;
    unsigned int v31 = v7;
    __int16 v32 = 2114;
    id v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ received PlaybackStateDidChangeNotification. PlaybackState: %{public}d. PlayerPath: %{public}@.", buf, 0x1Cu);
  }
  __int16 v18 = +[MRUserSettings currentSettings];
  unsigned int v19 = [v18 homepodDemoMode];

  if (v19)
  {
    v20 = _MRLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
      *(_DWORD *)buf = 138543362;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ will ignore this notification (and future PlaybackStateDidChangeNotifications) since HomePod is in demo mode.", buf, 0xCu);
    }
    [(MRDNowPlayingLauncher *)self _stopObservingNotifications];
  }
  else if (v7 == 1)
  {
    [(MRDNowPlayingLauncher *)self launch];
  }
  else
  {
    [(MRDNowPlayingLauncher *)self background];
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (void)_submitLaunchFailure
{
  uint64_t v3 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
  id v2 = v3;
  MRAnalyticsSendEvent();
}

- (void)_submitRelaunchEvent:(BOOL)a3
{
  id v4 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
  id v3 = v4;
  MRAnalyticsSendEvent();
}

- (void)_submitTerminationEvent:(unint64_t)a3
{
  id v4 = [(MRDNowPlayingLauncher *)self bundleIdentifier];
  id v3 = v4;
  MRAnalyticsSendEvent();
}

- (MRDNowPlayingLauncherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDNowPlayingLauncherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSOperationQueue)notificationOperationQueue
{
  return self->_notificationOperationQueue;
}

- (void)setNotificationOperationQueue:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
}

- (MSVTimer)playbackStateTimer
{
  return self->_playbackStateTimer;
}

- (void)setPlaybackStateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackStateTimer, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_notificationOperationQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end