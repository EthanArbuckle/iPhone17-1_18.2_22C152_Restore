@interface MRDMediaAppInFocusMonitor
+ (BOOL)isRemoteControllableApp:(id)a3;
- (BOOL)lockScreenVisible;
- (MRDDisplayMonitor)displayMonitor;
- (MRDMediaAppInFocusMonitor)initWithDelegate:(id)a3;
- (MRDMediaAppInFocusMonitorDelegate)delegate;
- (NSSet)bundlesInFocus;
- (NSSet)mediaBundlesInFocus;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (void)_handleLayoutDidChangeNotification:(id)a3;
- (void)notifyDelegate;
- (void)setBundlesInFocus:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setLockScreenVisible:(BOOL)a3;
- (void)setMediaBundlesInFocus:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MRDMediaAppInFocusMonitor

+ (BOOL)isRemoteControllableApp:(id)a3
{
  uint64_t v3 = qword_10047E060;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10047E060, &stru_100419C38);
  }
  unsigned __int8 v5 = [(id)qword_10047E068 containsObject:v4];

  return v5;
}

- (BOOL)lockScreenVisible
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(MRDMediaAppInFocusMonitor *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000142B0;
  v5[3] = &unk_100415CF0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)notifyDelegate
{
  id v3 = [(NSSet *)self->_mediaBundlesInFocus copy];
  id v4 = [(MRDMediaAppInFocusMonitor *)self delegateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008A08;
  v6[3] = &unk_1004158D8;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (NSSet)mediaBundlesInFocus
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100092290;
  v11 = sub_1000922A0;
  id v12 = 0;
  id v3 = [(MRDMediaAppInFocusMonitor *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014290;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (MRDMediaAppInFocusMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDMediaAppInFocusMonitorDelegate *)WeakRetained;
}

- (void)setLockScreenVisible:(BOOL)a3
{
  id v5 = [(MRDMediaAppInFocusMonitor *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001426C;
  v6[3] = &unk_100417720;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

- (void)setBundlesInFocus:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDMediaAppInFocusMonitor *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000142A4;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setMediaBundlesInFocus:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDMediaAppInFocusMonitor *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C624;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (NSSet)bundlesInFocus
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100092290;
  v11 = sub_1000922A0;
  id v12 = 0;
  id v3 = [(MRDMediaAppInFocusMonitor *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014140;
  v6[3] = &unk_100415CF0;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_handleLayoutDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDMediaAppInFocusMonitor *)self displayMonitor];
  unsigned int v6 = [v5 displayOn];

  if (!v6)
  {
    [(MRDMediaAppInFocusMonitor *)self setLockScreenVisible:0];
LABEL_10:
    v16 = +[NSSet set];
    [(MRDMediaAppInFocusMonitor *)self setBundlesInFocus:v16];

    id v17 = +[NSSet set];
    [(MRDMediaAppInFocusMonitor *)self setMediaBundlesInFocus:v17];
    goto LABEL_19;
  }
  uint64_t v7 = [(MRDMediaAppInFocusMonitor *)self displayMonitor];
  if ([v7 lockScreenVisible])
  {
    id v8 = [(MRDMediaAppInFocusMonitor *)self displayMonitor];
    uint64_t v9 = [v8 controlCenterVisible] ^ 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  v10 = [(MRDMediaAppInFocusMonitor *)self displayMonitor];
  unsigned __int8 v11 = [v10 controlCenterVisible];

  [(MRDMediaAppInFocusMonitor *)self setLockScreenVisible:v9];
  if (v9 & 1) != 0 || (v11) {
    goto LABEL_10;
  }
  id v12 = [(MRDMediaAppInFocusMonitor *)self displayMonitor];
  v13 = [v12 presentedBundleIdentifiers];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NSSet set];
  }
  v18 = v15;

  v19 = +[MRDMediaBundleManager shared];
  unsigned __int8 v20 = [v19 isSupported];

  if ((v20 & 1) == 0)
  {
    v21 = _MRLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IFM MRDMediaBundleManager not supported on this platform", (uint8_t *)buf, 2u);
    }
  }
  v22 = _MRLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[MRDRRC].IFM always using dynamicEligibility check", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v23 = +[MRDMediaBundleManager shared];
  v24 = [v18 allObjects];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000D550;
  v25[3] = &unk_100419C18;
  objc_copyWeak(&v27, buf);
  id v17 = v18;
  id v26 = v17;
  [v23 queryEligibilityOfAll:v24 completionHandler:v25];

  objc_destroyWeak(&v27);
  objc_destroyWeak(buf);
LABEL_19:
}

- (MRDDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (MRDMediaAppInFocusMonitor)initWithDelegate:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MRDMediaAppInFocusMonitor;
  id v5 = [(MRDMediaAppInFocusMonitor *)&v20 init];
  if (v5)
  {
    unsigned int v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaremote.MediaAppInFocus", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mediaremote.MediaAppInFocusDelegate", v9);
    delegateQueue = v5->_delegateQueue;
    v5->_delegateQueue = (OS_dispatch_queue *)v10;

    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v12 = +[MRDDisplayMonitor sharedMonitor];
    displayMonitor = v5->_displayMonitor;
    v5->_displayMonitor = (MRDDisplayMonitor *)v12;

    uint64_t v14 = +[NSSet set];
    bundlesInFocus = v5->_bundlesInFocus;
    v5->_bundlesInFocus = (NSSet *)v14;

    uint64_t v16 = +[NSSet set];
    mediaBundlesInFocus = v5->_mediaBundlesInFocus;
    v5->_mediaBundlesInFocus = (NSSet *)v16;

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v5 selector:"_handleLayoutDidChangeNotification:" name:@"MRDisplayMonitorLayoutDidChangeNotification" object:v5->_displayMonitor];
  }
  return v5;
}

- (void)setQueue:(id)a3
{
}

- (void)setDelegateQueue:(id)a3
{
}

- (void)setDisplayMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaBundlesInFocus, 0);

  objc_storeStrong((id *)&self->_bundlesInFocus, 0);
}

@end