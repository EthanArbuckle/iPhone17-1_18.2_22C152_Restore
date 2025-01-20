@interface MRDiOSSimulatorNowPlayingDataSource
- (BKSApplicationStateMonitor)appStateMonitor;
- (BOOL)nowPlayingApplicationIsInterrupted;
- (BOOL)nowPlayingApplicationIsPlaying;
- (BOOL)shouldSendCommand:(id)a3;
- (MRContentItem)cachedNowPlayingContentItem;
- (MRDiOSSimulatorNowPlayingDataSource)init;
- (NSSet)cachedNowPlayingClients;
- (OS_dispatch_queue)serialQueue;
- (id)_mostRecentlyUpdatedClient;
- (id)nowPlayingApplicationDisplayID;
- (int)nowPlayingApplicationPID;
- (void)_activeNowPlayingClientDidChangeNotification:(id)a3;
- (void)_frontmostApplicationDidChange:(id)a3;
- (void)_notifyDelegateNowPlayingApplicationDidChange;
- (void)_notifyDelegateNowPlayingPlaybackStateDidChange;
- (void)_registerNotifications;
- (void)_reloadCachedNowPlayingClients;
- (void)_reloadCachedNowPlayingItem;
- (void)_unregisterNotifications;
- (void)dealloc;
- (void)setAppStateMonitor:(id)a3;
- (void)setCachedNowPlayingClients:(id)a3;
- (void)setCachedNowPlayingContentItem:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation MRDiOSSimulatorNowPlayingDataSource

- (MRDiOSSimulatorNowPlayingDataSource)init
{
  v17.receiver = self;
  v17.super_class = (Class)MRDiOSSimulatorNowPlayingDataSource;
  v2 = [(MRDNowPlayingDataSource *)&v17 init];
  if (v2)
  {
    v3 = (BKSApplicationStateMonitor *)[objc_alloc((Class)BKSApplicationStateMonitor) initWithBundleIDs:0 states:8];
    appStateMonitor = v2->_appStateMonitor;
    v2->_appStateMonitor = v3;

    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v8;

    objc_initWeak(&location, v2);
    v10 = v2->_appStateMonitor;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10014703C;
    v14[3] = &unk_10041E620;
    objc_copyWeak(&v15, &location);
    [(BKSApplicationStateMonitor *)v10 setHandler:v14];
    [(MRDiOSSimulatorNowPlayingDataSource *)v2 _registerNotifications];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001470A0;
    block[3] = &unk_100415CC8;
    v13 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(MRDiOSSimulatorNowPlayingDataSource *)self _unregisterNotifications];
  [(BKSApplicationStateMonitor *)self->_appStateMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MRDiOSSimulatorNowPlayingDataSource;
  [(MRDiOSSimulatorNowPlayingDataSource *)&v3 dealloc];
}

- (int)nowPlayingApplicationPID
{
  v2 = [(MRDiOSSimulatorNowPlayingDataSource *)self _mostRecentlyUpdatedClient];
  objc_super v3 = [v2 client];
  int v4 = [v3 processIdentifier];

  return v4;
}

- (id)nowPlayingApplicationDisplayID
{
  int v2 = proc_pidpath([(MRDiOSSimulatorNowPlayingDataSource *)self nowPlayingApplicationPID], buffer, 0x1000u);
  if (v2 < 1)
  {
    v9 = 0;
  }
  else
  {
    objc_super v3 = (__CFString *)[objc_alloc((Class)NSString) initWithBytes:buffer length:v2 encoding:4];
    CFURLRef v4 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v3, kCFURLPOSIXPathStyle, 0);
    if (v4)
    {
      CFURLRef v5 = v4;
      uint64_t v6 = _CFBundleCopyBundleURLForExecutableURL();
      if (v6)
      {
        v7 = (const void *)v6;
        dispatch_queue_t v8 = +[NSBundle bundleWithURL:v6];
        v9 = [v8 bundleIdentifier];
        CFRelease(v7);
      }
      else
      {
        v9 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)nowPlayingApplicationIsPlaying
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = sub_1001473C8;
  v7[4] = sub_1001473D8;
  id v8 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001473E0;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  v6[5] = v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v6);
  MRContentItemGetPlaybackRate();
  BOOL v4 = v3 > 0.00000011921;
  _Block_object_dispose(v7, 8);

  return v4;
}

- (BOOL)nowPlayingApplicationIsInterrupted
{
  return 0;
}

- (BOOL)shouldSendCommand:(id)a3
{
  return 1;
}

- (void)_activeNowPlayingClientDidChangeNotification:(id)a3
{
}

- (void)_registerNotifications
{
  MRMediaRemoteRegisterForNowPlayingNotifications();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_nowPlayingClientDidRegisterNotification:" name:kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying object:0];
  [v3 addObserver:self selector:"_nowPlayingClientDidUnregisterNotification:" name:kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying object:0];
  [v3 addObserver:self selector:"_activeNowPlayingClientDidChangeNotification:" name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];
}

- (void)_unregisterNotifications
{
  MRMediaRemoteUnregisterForNowPlayingNotifications();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying object:0];
  [v3 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying object:0];
  [v3 removeObserver:self name:kMRMediaRemoteNowPlayingApplicationDidChangeNotification object:0];
}

- (void)_frontmostApplicationDidChange:(id)a3
{
}

- (void)_reloadCachedNowPlayingClients
{
  id v3 = +[MRDMediaRemoteServer server];
  BOOL v4 = [v3 nowPlayingServer];
  CFURLRef v5 = [v4 allLocalNowPlayingInfoClients];

  serialQueue = self->_serialQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014765C;
  v8[3] = &unk_1004158D8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)serialQueue, v8);
}

- (void)_reloadCachedNowPlayingItem
{
  id v2 = objc_msgSend(objc_alloc((Class)MRPlaybackQueueRequest), "initWithRange:", 0, 1);
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
}

- (void)_notifyDelegateNowPlayingApplicationDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001478AC;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifyDelegateNowPlayingPlaybackStateDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100147A20;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_mostRecentlyUpdatedClient
{
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1001473C8;
  v29 = sub_1001473D8;
  id v30 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100147E28;
  block[3] = &unk_100415CF0;
  void block[4] = self;
  void block[5] = &v25;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)v26[5];
  id v3 = 0;
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v31 count:16];
  if (v4)
  {
    uint64_t v19 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v3)
        {
          id v7 = [v3 activePlayerClient];
          id v8 = [v7 playbackQueue];

          id v9 = MRPlaybackQueueGetContentItemAtOffset();
          MRContentItemGetElapsedTimeTimestamp();
          v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          v11 = [v6 activePlayerClient];
          v12 = [v11 playbackQueue];

          v13 = MRPlaybackQueueGetContentItemAtOffset();
          MRContentItemGetElapsedTimeTimestamp();
          v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          if ([v10 compare:v14] == (id)-1)
          {
            id v15 = v6;

            id v3 = v15;
          }
        }
        else
        {
          id v3 = v6;
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v20 objects:v31 count:16];
    }
    while (v4);
  }

  id v16 = v3;
  _Block_object_dispose(&v25, 8);

  return v16;
}

- (BKSApplicationStateMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (void)setAppStateMonitor:(id)a3
{
}

- (NSSet)cachedNowPlayingClients
{
  return self->_cachedNowPlayingClients;
}

- (void)setCachedNowPlayingClients:(id)a3
{
}

- (MRContentItem)cachedNowPlayingContentItem
{
  return self->_cachedNowPlayingContentItem;
}

- (void)setCachedNowPlayingContentItem:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_cachedNowPlayingContentItem, 0);
  objc_storeStrong((id *)&self->_cachedNowPlayingClients, 0);

  objc_storeStrong((id *)&self->_appStateMonitor, 0);
}

@end