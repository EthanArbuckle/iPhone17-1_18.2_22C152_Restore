@interface WCDFirstUnlockManager
- (BOOL)receivedFirstUnlockState;
- (BOOL)remoteDeviceFirstUnlocked;
- (NSNumber)localDeviceFirstUnlocked;
- (NSString)state;
- (WCDFirstUnlockManager)init;
- (id)loadRemoteAcknowledgedState;
- (id)loadRemoteFirstUnlockState;
- (void)clearRemoteAcknowledgedState;
- (void)dealloc;
- (void)handlLocalFirstUnlockStateChanged;
- (void)handleFirstUnlockAck:(id)a3;
- (void)handleFirstUnlockState:(id)a3;
- (void)initializeRemoteFirstUnlockState;
- (void)saveRemoteAcknowledgedState:(id)a3;
- (void)saveRemoteFirstUnlockState;
- (void)sendFirstUnlockAck:(BOOL)a3;
- (void)sendFirstUnlockRequest;
- (void)sendFirstUnlockState;
- (void)sendStateIfNeccessary;
- (void)setLocalDeviceFirstUnlocked:(id)a3;
- (void)setReceivedFirstUnlockState:(BOOL)a3;
- (void)setRemoteDeviceFirstUnlocked:(BOOL)a3;
- (void)subscribeToAllNotifications;
- (void)systemObserverPairedListChanged;
- (void)updateLocalFirstUnlockState;
@end

@implementation WCDFirstUnlockManager

- (WCDFirstUnlockManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WCDFirstUnlockManager;
  v2 = [(WCDFirstUnlockManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_remoteDeviceFirstUnlocked = 0;
    [(WCDFirstUnlockManager *)v2 updateLocalFirstUnlockState];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002CAC;
    block[3] = &unk_100044A68;
    v4 = v3;
    v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    [(WCDFirstUnlockManager *)v4 subscribeToAllNotifications];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WCDFirstUnlockManager;
  [(WCDFirstUnlockManager *)&v4 dealloc];
}

- (void)subscribeToAllNotifications
{
  v3 = +[WCDSystemMonitor sharedSystemMonitor];
  [v3 addObserver:self];

  objc_initWeak(&location, self);
  int out_token = 0;
  objc_super v4 = (const char *)kMobileKeyBagLockStatusNotifyToken;
  id v5 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002E30;
  handler[3] = &unk_100044A90;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v4, &out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (NSString)state
{
  v3 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  NSAppendPrintF();
  id v5 = v4;

  v6 = [(WCDFirstUnlockManager *)self localDeviceFirstUnlocked];
  if ([v6 BOOLValue]) {
    id v7 = "YES";
  }
  else {
    id v7 = "NO";
  }
  v13 = v7;
  NSAppendPrintF();
  id v8 = v5;

  v9 = [(WCDFirstUnlockManager *)self loadRemoteAcknowledgedState];
  [v9 BOOLValue];
  NSAppendPrintF();
  id v10 = v8;

  return (NSString *)v10;
}

- (void)systemObserverPairedListChanged
{
  v3 = +[WCDSystemMonitor sharedSystemMonitor];
  unsigned int v4 = [v3 isPaired];

  if (v4)
  {
    [(WCDFirstUnlockManager *)self requestFirstUnlockStateIfNeccessary];
  }
}

- (void)handlLocalFirstUnlockStateChanged
{
  v3 = [(WCDFirstUnlockManager *)self localDeviceFirstUnlocked];

  if (!v3)
  {
    [(WCDFirstUnlockManager *)self updateLocalFirstUnlockState];
    unsigned int v4 = [(WCDFirstUnlockManager *)self localDeviceFirstUnlocked];

    if (v4)
    {
      [(WCDFirstUnlockManager *)self sendFirstUnlockState];
    }
  }
}

- (void)sendStateIfNeccessary
{
  v3 = wc_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446210;
    id v10 = "-[WCDFirstUnlockManager sendStateIfNeccessary]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  unsigned int v4 = [(WCDFirstUnlockManager *)self loadRemoteAcknowledgedState];
  id v5 = v4;
  if (!v4
    || (unsigned int v6 = [v4 BOOLValue],
        [(WCDFirstUnlockManager *)self localDeviceFirstUnlocked],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 BOOLValue],
        v7,
        v6 != v8))
  {
    [(WCDFirstUnlockManager *)self sendFirstUnlockState];
  }
}

- (void)sendFirstUnlockState
{
  [(WCDFirstUnlockManager *)self clearRemoteAcknowledgedState];
  v3 = objc_opt_new();
  [v3 setVersion:1];
  unsigned int v4 = [(WCDFirstUnlockManager *)self localDeviceFirstUnlocked];
  [v3 setFirstUnlocked:[v4 BOOLValue]];

  id v5 = wc_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(WCDFirstUnlockManager *)self localDeviceFirstUnlocked];
    unsigned int v7 = [v6 BOOLValue];
    unsigned int v8 = "NO";
    if (v7) {
      unsigned int v8 = "YES";
    }
    int v10 = 136315138;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }
  int v9 = +[WatchConnectivityDaemon sharedDaemon];
  [v9 sendFirstUnlockState:v3];
}

- (void)updateLocalFirstUnlockState
{
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    [(WCDFirstUnlockManager *)self setLocalDeviceFirstUnlocked:&__kCFBooleanTrue];
  }
}

- (void)handleFirstUnlockAck:(id)a3
{
  id v4 = a3;
  id v5 = [[WCDProtoFirstUnlockAck alloc] initWithData:v4];

  if ([(WCDProtoFirstUnlockAck *)v5 hasAcknowledgedState])
  {
    BOOL v6 = [(WCDProtoFirstUnlockAck *)v5 acknowledgedState];
    unsigned int v7 = wc_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = "NO";
      if (v6) {
        unsigned int v8 = "YES";
      }
      int v10 = 136315138;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
    }

    int v9 = +[NSNumber numberWithBool:v6];
    [(WCDFirstUnlockManager *)self saveRemoteAcknowledgedState:v9];
  }
}

- (void)handleFirstUnlockState:(id)a3
{
  id v4 = a3;
  id v5 = [[WCDProtoFirstUnlockState alloc] initWithData:v4];

  [(WCDFirstUnlockManager *)self setRemoteDeviceFirstUnlocked:[(WCDProtoFirstUnlockState *)v5 firstUnlocked]];
  BOOL v6 = wc_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(WCDFirstUnlockManager *)self remoteDeviceFirstUnlocked];
    unsigned int v8 = "NO";
    if (v7) {
      unsigned int v8 = "YES";
    }
    int v9 = 136315138;
    int v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  [(WCDFirstUnlockManager *)self sendFirstUnlockAck:[(WCDFirstUnlockManager *)self remoteDeviceFirstUnlocked]];
  [(WCDFirstUnlockManager *)self setReceivedFirstUnlockState:1];
}

- (void)setRemoteDeviceFirstUnlocked:(BOOL)a3
{
  if (self->_remoteDeviceFirstUnlocked != a3)
  {
    self->_remoteDeviceFirstUnlocked = a3;
    id v4 = +[WCDSystemMonitor sharedSystemMonitor];
    [v4 setRemoteFirstUnlocked:self->_remoteDeviceFirstUnlocked];

    [(WCDFirstUnlockManager *)self saveRemoteFirstUnlockState];
  }
}

- (void)sendFirstUnlockAck:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(WCDProtoFirstUnlockAck);
  [(WCDProtoFirstUnlockAck *)v5 setVersion:1];
  [(WCDProtoFirstUnlockAck *)v5 setAcknowledgedState:v3];
  id v4 = +[WatchConnectivityDaemon sharedDaemon];
  [v4 sendFirstUnlockAck:v5];
}

- (void)sendFirstUnlockRequest
{
  v2 = wc_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    BOOL v6 = "-[WCDFirstUnlockManager sendFirstUnlockRequest]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  BOOL v3 = objc_alloc_init(WCDProtoFirstUnlockRequest);
  [(WCDProtoFirstUnlockRequest *)v3 setVersion:1];
  id v4 = +[WatchConnectivityDaemon sharedDaemon];
  [v4 sendFirstUnlockRequest:v3];
}

- (void)initializeRemoteFirstUnlockState
{
  BOOL v3 = [(WCDFirstUnlockManager *)self loadRemoteFirstUnlockState];
  id v4 = wc_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v3 BOOLValue];
    BOOL v6 = "NO";
    if (v5) {
      BOOL v6 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    int v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (![(WCDFirstUnlockManager *)self receivedFirstUnlockState]
    && (!v3 || ([v3 BOOLValue] & 1) == 0))
  {
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000038E8;
    block[3] = &unk_100044A68;
    void block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  -[WCDFirstUnlockManager setRemoteDeviceFirstUnlocked:](self, "setRemoteDeviceFirstUnlocked:", [v3 BOOLValue]);
}

- (void)saveRemoteAcknowledgedState:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setObject:v3 forKey:@"WCDRemoteAcknowledgedState"];

    id v5 = +[NSUserDefaults standardUserDefaults];
    [v5 synchronize];
  }
}

- (id)loadRemoteAcknowledgedState
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"WCDRemoteAcknowledgedState"];

  return v3;
}

- (void)clearRemoteAcknowledgedState
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"WCDRemoteAcknowledgedState"];

  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 synchronize];
}

- (void)saveRemoteFirstUnlockState
{
  v2 = +[WCDSystemMonitor sharedSystemMonitor];
  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 remoteFirstUnlocked]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setObject:v5 forKey:@"WCDRemoteFirstUnlockState"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 synchronize];
}

- (id)loadRemoteFirstUnlockState
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"WCDRemoteFirstUnlockState"];

  return v3;
}

- (NSNumber)localDeviceFirstUnlocked
{
  return self->_localDeviceFirstUnlocked;
}

- (void)setLocalDeviceFirstUnlocked:(id)a3
{
}

- (BOOL)remoteDeviceFirstUnlocked
{
  return self->_remoteDeviceFirstUnlocked;
}

- (BOOL)receivedFirstUnlockState
{
  return self->_receivedFirstUnlockState;
}

- (void)setReceivedFirstUnlockState:(BOOL)a3
{
  self->_receivedFirstUnlockState = a3;
}

- (void).cxx_destruct
{
}

@end