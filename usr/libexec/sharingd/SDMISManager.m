@interface SDMISManager
+ (id)sharedManager;
- (BOOL)hostIsOnlyUSBEthernet;
- (SDMISManager)init;
- (SDMISManagerDelegate)delegate;
- (int64_t)connectedHosts;
- (int64_t)readConnectHosts;
- (void)attachMIS;
- (void)dealloc;
- (void)detachMIS;
- (void)getState:(int *)a3 andReason:(int *)a4;
- (void)handleMISStateChanged;
- (void)readMISState:(int *)a3 andReason:(int *)a4;
- (void)setDelegate:(id)a3;
- (void)setState:(int)a3;
- (void)stopService;
@end

@implementation SDMISManager

+ (id)sharedManager
{
  if (qword_10097FB28 != -1) {
    dispatch_once(&qword_10097FB28, &stru_1008CA308);
  }
  v2 = (void *)qword_10097FB20;

  return v2;
}

- (SDMISManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SDMISManager;
  v2 = [(SDMISManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    authTimer = v2->_authTimer;
    v2->_attachCount = 0;
    v2->_authTimer = 0;
    v2->_netClient = 0;
    *(void *)&v2->_state = 1020;
    v2->_needStateUpdate = 1;

    v8.version = 0;
    memset(&v8.retain, 0, 24);
    v8.info = v3;
    SCDynamicStoreRef v5 = SCDynamicStoreCreate(0, @"com.apple.wirelessmodemsettings.MISManager", (SCDynamicStoreCallBack)sub_100017B80, &v8);
    v3->_scDynamicStore = v5;
    if (v5)
    {
      SCDynamicStoreAddWatchedKey();
      v3->_scRunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v3->_scDynamicStore, 0);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v3->_scRunLoopSource, kCFRunLoopCommonModes);
    }
  }
  return v3;
}

- (void)dealloc
{
  self->_attachCount = 0;
  [(SDMISManager *)self detachMIS];
  if (self->_scDynamicStore)
  {
    SCDynamicStoreRemoveWatchedKey();
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_scRunLoopSource, kCFRunLoopCommonModes);
    CFRelease(self->_scDynamicStore);
  }
  v4.receiver = self;
  v4.super_class = (Class)SDMISManager;
  [(SDMISManager *)&v4 dealloc];
}

- (void)attachMIS
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_netClient)
  {
    id v3 = &_dispatch_main_q;
    v2->_netClient = (NETRBClient *)_NETRBClientCreate();

    objc_super v4 = tethering_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      netClient = v2->_netClient;
      int v6 = 138412290;
      v7 = netClient;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Created NETRB client = %@", (uint8_t *)&v6, 0xCu);
    }
  }
  ++v2->_attachCount;
  objc_sync_exit(v2);
}

- (void)detachMIS
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t attachCount = v2->_attachCount;
  v2->_uint64_t attachCount = attachCount - 1;
  if (v2->_netClient) {
    BOOL v4 = attachCount <= 1;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    _NETRBClientDestroy();
    v2->_netClient = 0;
    v2->_uint64_t attachCount = 0;
    SCDynamicStoreRef v5 = tethering_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Destroyed NETRB client", v6, 2u);
    }
  }
  objc_sync_exit(v2);
}

- (void)stopService
{
  if (self->_netClient)
  {
    _NETRBClientStopService();
    v2 = tethering_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Stopping Auth", v3, 2u);
    }
  }
}

- (void)setState:(int)a3
{
  [(SDMISManager *)self attachMIS];
  if (self->_netClient)
  {
    _NETRBClientSetGlobalServiceState();
    SCDynamicStoreRef v5 = tethering_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting state = %d", (uint8_t *)v6, 8u);
    }
  }
  [(SDMISManager *)self detachMIS];
}

- (void)getState:(int *)a3 andReason:(int *)a4
{
  if (self->_needStateUpdate)
  {
    [(SDMISManager *)self readMISState:&self->_state andReason:&self->_reason];
    self->_needStateUpdate = 0;
  }
  if (a3) {
    *a3 = self->_state;
  }
  if (a4) {
    *a4 = self->_reason;
  }
  v7 = tethering_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int state = self->_state;
    int reason = self->_reason;
    v10[0] = 67109376;
    v10[1] = state;
    __int16 v11 = 1024;
    int v12 = reason;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "int state = %d, reason = %d", (uint8_t *)v10, 0xEu);
  }
}

- (int64_t)connectedHosts
{
  if (!self->_needStateUpdate) {
    return self->_connectedHosts;
  }
  int64_t result = [(SDMISManager *)self readConnectHosts];
  self->_connectedHosts = result;
  return result;
}

- (BOOL)hostIsOnlyUSBEthernet
{
  if ((id)[(SDMISManager *)self connectedHosts] != (id)1) {
    return 0;
  }
  id v3 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, @"com.apple.MobileInternetSharing");
  BOOL v4 = v3;
  if (v3)
  {
    SCDynamicStoreRef v5 = [v3 objectForKeyedSubscript:@"Hosts"];
    int v6 = v5;
    if (v5)
    {
      v7 = [v5 objectForKeyedSubscript:@"Type"];
      SCDynamicStoreContext v8 = v7;
      if (v7)
      {
        objc_super v9 = [v7 objectForKeyedSubscript:@"USB-Ethernet"];
        BOOL v10 = [v9 integerValue] == (id)1;
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)readMISState:(int *)a3 andReason:(int *)a4
{
  unsigned int state = self->_state;
  unsigned int reason = self->_reason;
  SCDynamicStoreContext v8 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, @"com.apple.MobileInternetSharing");
  id v11 = v8;
  if (v8)
  {
    objc_super v9 = [v8 objectForKeyedSubscript:@"State"];
    unsigned int state = [v9 intValue];

    BOOL v10 = [v11 objectForKeyedSubscript:@"Reason"];
    unsigned int reason = [v10 intValue];
  }
  if (a3) {
    *a3 = state;
  }
  if (a4) {
    *a4 = reason;
  }
}

- (int64_t)readConnectHosts
{
  id connectedHosts = self->_connectedHosts;
  id v3 = (void *)SCDynamicStoreCopyValue(self->_scDynamicStore, @"com.apple.MobileInternetSharing");
  BOOL v4 = v3;
  if (v3)
  {
    SCDynamicStoreRef v5 = [v3 objectForKeyedSubscript:@"Hosts"];
    int v6 = v5;
    if (v5)
    {
      v7 = [v5 objectForKeyedSubscript:@"Current"];
      id connectedHosts = [v7 integerValue];
    }
  }
  SCDynamicStoreContext v8 = tethering_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = connectedHosts;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Connected Hosts = %d", (uint8_t *)v10, 8u);
  }

  return (int64_t)connectedHosts;
}

- (void)handleMISStateChanged
{
  uint64_t v12 = 0;
  int64_t v3 = [(SDMISManager *)self readConnectHosts];
  [(SDMISManager *)self readMISState:(char *)&v12 + 4 andReason:&v12];
  int v4 = v12;
  if (v12 == __PAIR64__(self->_state, self->_reason) && v3 == self->_connectedHosts)
  {
    SCDynamicStoreRef v5 = tethering_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "No state change not notifying";
      v7 = v5;
      uint32_t v8 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else
  {
    self->_int state = HIDWORD(v12);
    self->_int reason = v4;
    self->_id connectedHosts = v3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained misStateChanged:self];

    SCDynamicStoreRef v5 = tethering_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int state = self->_state;
      int reason = self->_reason;
      *(_DWORD *)buf = 67109376;
      int v14 = state;
      __int16 v15 = 1024;
      int v16 = reason;
      int v6 = "Update MIS state = %d for reason = %d";
      v7 = v5;
      uint32_t v8 = 14;
      goto LABEL_7;
    }
  }
}

- (SDMISManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDMISManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authTimer, 0);

  objc_storeStrong((id *)&self->_radioPrefs, 0);
}

@end