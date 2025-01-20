@interface SDAirDropPublisher
- (SDAirDropPublisher)initWithPort:(id)a3 identity:(__SecIdentity *)a4;
- (SDAirDropPublisherDelegate)delegate;
- (void)addObservers;
- (void)dealloc;
- (void)invalidate;
- (void)publish;
- (void)publishCallBack:(id *)a3;
- (void)removeObservers;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)updateTXTRecordAndNotify;
@end

@implementation SDAirDropPublisher

- (SDAirDropPublisher)initWithPort:(id)a3 identity:(__SecIdentity *)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SDAirDropPublisher;
  v8 = [(SDAirDropPublisher *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_port, a3);
    objc_storeWeak((id *)&v9->_delegate, 0);
    v9->_service = 0;
    v9->_retryCount = 0;
    uint64_t v10 = objc_opt_new();
    txtRecord = v9->_txtRecord;
    v9->_txtRecord = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    properties = v9->_properties;
    v9->_properties = (NSMutableDictionary *)v12;

    uint64_t v14 = +[SDStatusMonitor sharedMonitor];
    monitor = v9->_monitor;
    v9->_monitor = (SDStatusMonitor *)v14;

    if (a4) {
      v16 = (__SecIdentity *)CFRetain(a4);
    }
    else {
      v16 = 0;
    }
    v9->_identity = v16;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100034558;
    v21[3] = &unk_1008CA4B8;
    v17 = v9;
    v22 = v17;
    uint64_t v18 = sub_1001B1B10(0, &_dispatch_main_q, v21);
    restartTimer = v17->_restartTimer;
    v17->_restartTimer = (OS_dispatch_source *)v18;

    v17->_bonjourNameConflictDetected = 0;
    dispatch_resume((dispatch_object_t)v17->_restartTimer);
    [(SDAirDropPublisher *)v17 addObservers];
  }
  return v9;
}

- (void)dealloc
{
  [(SDAirDropPublisher *)self removeObservers];
  identity = self->_identity;
  if (identity) {
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)SDAirDropPublisher;
  [(SDAirDropPublisher *)&v4 dealloc];
}

- (void)publishCallBack:(id *)a3
{
  p_int var1 = &a3->var1;
  int var1 = a3->var1;
  if (a3->var0 == kCFStreamErrorDomainNetServices && var1 == -72001)
  {
    v9 = sub_10004FD54(0, 0);
    v13 = airdrop_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000350F8((uint64_t)v9, v13);
    }

    self->_bonjourNameConflictDetected = 1;
    sub_10004FFE4();
    restartTimer = self->_restartTimer;
    dispatch_time_t v15 = sub_1001B1AF8(1.0);
    sub_1001B1BC4(restartTimer, v15);
    goto LABEL_20;
  }
  if (!var1)
  {
    self->_int64_t retryCount = 0;
    v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef Name = CFNetServiceGetName(self->_service);
      *(_DWORD *)v20 = 138412290;
      *(void *)&v20[4] = Name;
      v17 = "Bonjour advertise %@ started";
      uint64_t v18 = v9;
      uint32_t v19 = 12;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, v20, v19);
    }
LABEL_20:

    goto LABEL_21;
  }
  id v7 = airdrop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100035170();
  }

  int64_t retryCount = self->_retryCount;
  self->_int64_t retryCount = retryCount + 1;
  v9 = airdrop_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (retryCount > 8)
  {
    if (v10)
    {
      *(_WORD *)v20 = 0;
      v17 = "Giving up trying to advertise with Bonjour";
      uint64_t v18 = v9;
      uint32_t v19 = 2;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  if (v10)
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Retrying Bonjour advertise in 3 seconds...", v20, 2u);
  }

  v11 = self->_restartTimer;
  dispatch_time_t v12 = sub_1001B1AF8(3.0);
  sub_1001B1BC4(v11, v12);
LABEL_21:
  -[SDStatusMonitor setAirDropPublished:](self->_monitor, "setAirDropPublished:", *p_var1 == 0, *(_OWORD *)v20);
}

- (void)updateTXTRecordAndNotify
{
  if (self->_service)
  {
    if (SFWalletAppAvailable())
    {
      if ([(SDStatusMonitor *)self->_monitor myAppleIDIsManaged]) {
        uint64_t v3 = 871;
      }
      else {
        uint64_t v3 = 887;
      }
    }
    else
    {
      uint64_t v3 = 871;
    }
    if (MGGetBoolAnswer()) {
      v3 |= 0x80uLL;
    }
    int Boolean = GestaltGetBoolean();
    uint64_t v5 = v3 | 0x400;
    if (!Boolean) {
      uint64_t v5 = v3;
    }
    v6 = +[NSString stringWithFormat:@"%ld", v5];
    p_txtRecord = &self->_txtRecord;
    [(NSMutableDictionary *)self->_txtRecord setObject:v6 forKeyedSubscript:@"flags"];

    if ([(SDStatusMonitor *)self->_monitor enableStrangers])
    {
      v8 = [(SDStatusMonitor *)self->_monitor discoverableMode];
      unsigned int v9 = [v8 isEqual:kSFOperationDiscoverableModeEveryone];

      if (v9)
      {
        BOOL v10 = +[SDNearbyAgent sharedNearbyAgent];
        v11 = [v10 bleAuthTag];

        dispatch_time_t v12 = [v11 base64EncodedStringWithOptions:0];
        [(NSMutableDictionary *)*p_txtRecord setObject:v12 forKeyedSubscript:@"atag"];
      }
      else
      {
        [(NSMutableDictionary *)*p_txtRecord setObject:0 forKeyedSubscript:@"atag"];
      }
    }
    CFDataRef v13 = +[NSNetService dataFromTXTRecordDictionary:*p_txtRecord];
    if (v13)
    {
      CFNetServiceSetTXTData(self->_service, v13);
    }
    else
    {
      uint64_t v14 = airdrop_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10003526C(v14);
      }

      dispatch_time_t v15 = airdrop_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000351F0((uint64_t *)&self->_txtRecord, v15);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100034A7C;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.UserPictureChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.ComputerNameChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"com.apple.sharingd.DiscoverableModeChanged" object:0];
  [v3 addObserver:self selector:"somethingChanged:" name:@"SDNotificationNameNearbyBLEAuthTagChanged" object:0];
}

- (void)removeObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)publish
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    service = self->_service;

    if (!service)
    {
      clientContext.version = 0;
      clientContext.info = self;
      clientContext.retain = (CFAllocatorRetainCallBack)&_CFRetain;
      clientContext.release = (CFAllocatorReleaseCallBack)&_CFRelease;
      clientContext.copyDescription = 0;
      CFStringRef v5 = sub_10004FD54(0, self->_bonjourNameConflictDetected);
      self->_bonjourNameConflictDetected = 0;
      if (v5)
      {
        CFStringRef v6 = v5;
        error.domain = 0;
        *(void *)&error.CFStreamError error = 0;
        CFStringRef v7 = sub_1000D94A0();
        v8 = CFNetServiceCreate(kCFAllocatorDefault, @"local", v7, v6, [(NSNumber *)self->_port intValue]);
        self->_service = v8;
        CFNetServiceSetClient(v8, (CFNetServiceClientCallBack)sub_100034E40, &clientContext);
        unsigned int v9 = self->_service;
        Main = CFRunLoopGetMain();
        CFNetServiceScheduleWithRunLoop(v9, Main, kCFRunLoopDefaultMode);
        [(SDAirDropPublisher *)self updateTXTRecordAndNotify];
        if (sub_1001B3C24() || [(SDStatusMonitor *)self->_monitor enableDemoMode])
        {
          CFOptionFlags v11 = 2049;
        }
        else if ([(SDStatusMonitor *)self->_monitor registerAllInterfaces])
        {
          CFOptionFlags v11 = 1050625;
        }
        else
        {
          CFOptionFlags v11 = 3147777;
        }
        CFDataRef v13 = airdrop_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Bonjour advertise %@", buf, 0xCu);
        }

        if (!CFNetServiceRegisterWithOptions(self->_service, v11, &error))
        {
          uint64_t v14 = airdrop_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1000352F4();
          }
        }
        CFRelease(v6);
      }
      else
      {
        dispatch_time_t v12 = airdrop_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000352B0(v12);
        }
      }
    }
  }
}

- (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034EC0;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)stop
{
  if (self->_service)
  {
    [(NSMutableDictionary *)self->_txtRecord removeAllObjects];
    [(SDStatusMonitor *)self->_monitor setAirDropPublished:0];
    id v3 = airdrop_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef Name = CFNetServiceGetName(self->_service);
      int v7 = 138412290;
      CFStringRef v8 = Name;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bonjour advertise %@ stopped", (uint8_t *)&v7, 0xCu);
    }

    service = self->_service;
    Main = CFRunLoopGetMain();
    CFNetServiceUnscheduleFromRunLoop(service, Main, kCFRunLoopDefaultMode);
    CFNetServiceSetClient(self->_service, 0, 0);
    CFNetServiceCancel(self->_service);
    CFRelease(self->_service);
    if (![(SDStatusMonitor *)self->_monitor disableRotation]) {
      sub_10004FFE4();
    }
    self->_service = 0;
  }
}

- (void)invalidate
{
  [(SDAirDropPublisher *)self stop];
  restartTimer = self->_restartTimer;
  if (restartTimer)
  {
    dispatch_source_cancel(restartTimer);
    objc_super v4 = self->_restartTimer;
    self->_restartTimer = 0;
  }
}

- (SDAirDropPublisherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDAirDropPublisherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_restartTimer, 0);
  objc_storeStrong((id *)&self->_monitor, 0);

  objc_storeStrong((id *)&self->_port, 0);
}

@end