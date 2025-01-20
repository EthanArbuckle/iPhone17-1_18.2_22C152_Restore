@interface SDServerBrowser
+ (id)sharedBrowser;
- (BOOL)isAirDropEnabled;
- (NSString)description;
- (SDServerBrowser)init;
- (id)airDropNodesForDomain:(id)a3;
- (id)bonjourNodesForDomain:(id)a3;
- (id)odiskNodesForDomain:(id)a3;
- (id)stringForBrowserMode:(int64_t)a3;
- (id)windowsNodesForWorkgroup:(id)a3;
- (void)airDropTransferRequested:(id)a3;
- (void)bonjourNodesDidChange:(id)a3;
- (void)incrementTransfersCompleted;
- (void)incrementTransfersInitiated;
- (void)postNotification:(id)a3 forNeighborhood:(id)a4;
- (void)setBonjourBrowserMode:(int64_t)a3;
- (void)setIconData:(id)a3 iconHash:(id)a4 forPerson:(__SFNode *)a5;
- (void)startAirDropBrowsing:(id)a3 bundleID:(id)a4 sessionID:(id)a5 helperConnection:(id)a6 delayBonjour:(BOOL)a7;
- (void)startAirDropBrowsing:(id)a3 connection:(id)a4 sessionID:(id)a5;
- (void)startBrowsingDomain:(id)a3;
- (void)startBrowsingWorkgroup:(id)a3;
- (void)startODiskBrowsing:(id)a3;
- (void)stopAirDropBrowsing:(id)a3;
- (void)stopBrowsingDomain:(id)a3;
- (void)stopBrowsingWorkgroup:(id)a3;
- (void)stopODiskBrowsing:(id)a3;
- (void)windowsNodesDidChange:(id)a3;
@end

@implementation SDServerBrowser

+ (id)sharedBrowser
{
  if (qword_100980000 != -1) {
    dispatch_once(&qword_100980000, &stru_1008CD768);
  }
  v2 = (void *)qword_100980008;

  return v2;
}

- (SDServerBrowser)init
{
  v14.receiver = self;
  v14.super_class = (Class)SDServerBrowser;
  v2 = [(SDServerBrowser *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_mode = 0;
    uint64_t v4 = objc_opt_new();
    odiskBrowsers = v3->_odiskBrowsers;
    v3->_odiskBrowsers = (NSMutableDictionary *)v4;

    uint64_t v6 = objc_opt_new();
    bonjourBrowsers = v3->_bonjourBrowsers;
    v3->_bonjourBrowsers = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    windowsBrowsers = v3->_windowsBrowsers;
    v3->_windowsBrowsers = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    airDropBrowsers = v3->_airDropBrowsers;
    v3->_airDropBrowsers = (NSMutableDictionary *)v10;

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v3 selector:"airDropTransferRequested:" name:@"com.apple.sharingd.AirDropTransferInitiated" object:0];
  }
  return v3;
}

- (void)postNotification:(id)a3 forNeighborhood:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    CFStringRef v10 = @"NeighborhoodName";
    id v11 = v6;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:v5 object:0 userInfo:v8];
}

- (void)airDropTransferRequested:(id)a3
{
  uint64_t v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SDServerBrowser: AirDrop transfer requested notification received", buf, 2u);
  }

  id v5 = [(NSMutableDictionary *)self->_airDropBrowsers objectForKeyedSubscript:@"local"];
  id v6 = [v5 objectForKeyedSubscript:@"Browser"];
  if (([v6 startCalled] & 1) == 0)
  {
    [v6 start];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100102968;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)bonjourNodesDidChange:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 types];
  if ([v4 containsObject:@"_afpovertcp._tcp."])
  {
    id v5 = [v7 domain];
    CFStringRef v6 = @"com.apple.sharingd.BonjourChanged";
  }
  else if ([v4 containsObject:sub_1000D94A0()])
  {
    id v5 = [v7 domain];
    CFStringRef v6 = @"com.apple.sharingd.AirDropChanged";
  }
  else
  {
    if (![v4 containsObject:@"_odisk._tcp."]) {
      goto LABEL_8;
    }
    id v5 = [v7 domain];
    CFStringRef v6 = @"com.apple.sharingd.ODisksChanged";
  }
  [(SDServerBrowser *)self postNotification:v6 forNeighborhood:v5];

LABEL_8:
}

- (void)windowsNodesDidChange:(id)a3
{
  id v4 = [a3 workgroup];
  [(SDServerBrowser *)self postNotification:@"com.apple.sharingd.WindowsChanged" forNeighborhood:v4];
}

- (void)startBrowsingDomain:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_bonjourBrowsers objectForKeyedSubscript:v4];
  if (v5)
  {
    CFStringRef v6 = v5;
    id v7 = [v5 objectForKeyedSubscript:@"Count"];
    uint64_t v8 = [v7 intValue] + 1;

    v9 = +[NSNumber numberWithInt:v8];
    [v6 setObject:v9 forKeyedSubscript:@"Count"];
  }
  else
  {
    v11[0] = @"_afpovertcp._tcp.";
    v11[1] = @"_smb._tcp.";
    v11[2] = @"_rfb._tcp.";
    v11[3] = @"_adisk._tcp.";
    v9 = +[NSArray arrayWithObjects:v11 count:4];
    CFStringRef v10 = [[SDBonjourBrowser alloc] initWithDomain:v4 types:v9];
    CFStringRef v6 = objc_opt_new();
    [v6 setObject:&off_100902B38 forKeyedSubscript:@"Count"];
    [v6 setObject:v10 forKeyedSubscript:@"Browser"];
    [(NSMutableDictionary *)self->_bonjourBrowsers setObject:v6 forKeyedSubscript:v4];
    [(SDBonjourBrowser *)v10 setDelegate:self];
    [(SDBonjourBrowser *)v10 setMode:self->_mode];
    [(SDBonjourBrowser *)v10 start];
  }
}

- (void)setBonjourBrowserMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    id v5 = [(NSMutableDictionary *)self->_bonjourBrowsers objectForKeyedSubscript:@"local"];
    id v4 = [v5 objectForKeyedSubscript:@"Browser"];
    [v4 setMode:a3];
  }
}

- (id)bonjourNodesForDomain:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_bonjourBrowsers objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"Browser"];
    CFStringRef v6 = [v5 nodes];
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return v6;
}

- (void)stopBrowsingDomain:(id)a3
{
  id v11 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    CFStringRef v6 = [v4 objectForKeyedSubscript:@"Count"];
    uint64_t v7 = [v6 intValue] - 1;

    if (v7)
    {
      uint64_t v8 = +[NSNumber numberWithInt:v7];
      [v5 setObject:v8 forKeyedSubscript:@"Count"];
    }
    else
    {
      v9 = [v5 objectForKeyedSubscript:@"Browser"];
      [v9 invalidate];

      CFStringRef v10 = [v5 objectForKeyedSubscript:@"Browser"];
      [v10 setDelegate:0];

      [(NSMutableDictionary *)self->_bonjourBrowsers removeObjectForKey:v11];
    }
  }
}

- (void)startODiskBrowsing:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_odiskBrowsers objectForKeyedSubscript:v4];
  if (v5)
  {
    CFStringRef v6 = v5;
    uint64_t v7 = [v5 objectForKeyedSubscript:@"Count"];
    uint64_t v8 = [v7 intValue] + 1;

    v9 = +[NSNumber numberWithInt:v8];
    [v6 setObject:v9 forKeyedSubscript:@"Count"];
  }
  else
  {
    CFStringRef v11 = @"_odisk._tcp.";
    v9 = +[NSArray arrayWithObjects:&v11 count:1];
    CFStringRef v10 = [[SDBonjourBrowser alloc] initWithDomain:v4 types:v9];
    CFStringRef v6 = objc_opt_new();
    [v6 setObject:&off_100902B38 forKeyedSubscript:@"Count"];
    [v6 setObject:v10 forKeyedSubscript:@"Browser"];
    [(NSMutableDictionary *)self->_odiskBrowsers setObject:v6 forKeyedSubscript:v4];
    [(SDBonjourBrowser *)v10 setDelegate:self];
    [(SDBonjourBrowser *)v10 start];
  }
}

- (id)odiskNodesForDomain:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_odiskBrowsers objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"Browser"];
    CFStringRef v6 = [v5 nodes];
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return v6;
}

- (void)stopODiskBrowsing:(id)a3
{
  id v11 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_odiskBrowsers, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    CFStringRef v6 = [v4 objectForKeyedSubscript:@"Count"];
    uint64_t v7 = [v6 intValue] - 1;

    if (v7)
    {
      uint64_t v8 = +[NSNumber numberWithInt:v7];
      [v5 setObject:v8 forKeyedSubscript:@"Count"];
    }
    else
    {
      v9 = [v5 objectForKeyedSubscript:@"Browser"];
      [v9 invalidate];

      CFStringRef v10 = [v5 objectForKeyedSubscript:@"Browser"];
      [v10 setDelegate:0];

      [(NSMutableDictionary *)self->_odiskBrowsers removeObjectForKey:v11];
    }
  }
}

- (void)startAirDropBrowsing:(id)a3 bundleID:(id)a4 sessionID:(id)a5 helperConnection:(id)a6 delayBonjour:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [(NSMutableDictionary *)self->_airDropBrowsers objectForKeyedSubscript:v12];
  if (v16)
  {
    v17 = v16;
    v18 = [v16 objectForKeyedSubscript:@"Count"];
    uint64_t v19 = [v18 intValue] + 1;

    v20 = +[NSNumber numberWithInt:v19];
    [v17 setObject:v20 forKeyedSubscript:@"Count"];
  }
  else
  {
    CFStringRef v25 = sub_1000D94A0();
    v20 = +[NSArray arrayWithObjects:&v25 count:1];
    v21 = [[SDBonjourBrowser alloc] initWithDomain:v12 types:v20];
    [(SDBonjourBrowser *)v21 setHelperConnection:v15];
    v17 = objc_opt_new();
    [v17 setObject:&off_100902B38 forKeyedSubscript:@"Count"];
    [v17 setObject:v21 forKeyedSubscript:@"Browser"];
    [(NSMutableDictionary *)self->_airDropBrowsers setObject:v17 forKeyedSubscript:v12];
    [(SDBonjourBrowser *)v21 setBundleID:v13];
    [(SDBonjourBrowser *)v21 setSessionID:v14];
    [(SDBonjourBrowser *)v21 setDelegate:self];
    if (a7)
    {
      v22 = airdrop_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Delayed Bonjour browsing requested", v23, 2u);
      }
    }
    else
    {
      [(SDBonjourBrowser *)v21 start];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100103464;
      block[3] = &unk_1008CA4B8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)startAirDropBrowsing:(id)a3 connection:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(NSMutableDictionary *)self->_airDropBrowsers objectForKeyedSubscript:v8];
  if (v11)
  {
    id v12 = v11;
    id v13 = [v11 objectForKeyedSubscript:@"Count"];
    uint64_t v14 = [v13 intValue] + 1;

    id v15 = +[NSNumber numberWithInt:v14];
    [v12 setObject:v15 forKeyedSubscript:@"Count"];

    v16 = [v12 objectForKeyedSubscript:@"Browser"];
    if (([v16 startCalled] & 1) == 0)
    {
      [v16 start];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100103728;
      v18[3] = &unk_1008CA4B8;
      v18[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);
    }
  }
  else
  {
    CFStringRef v20 = sub_1000D94A0();
    v16 = +[NSArray arrayWithObjects:&v20 count:1];
    v17 = [[SDBonjourBrowser alloc] initWithDomain:v8 types:v16];
    id v12 = objc_opt_new();
    [v12 setObject:&off_100902B38 forKeyedSubscript:@"Count"];
    [v12 setObject:v17 forKeyedSubscript:@"Browser"];
    [(NSMutableDictionary *)self->_airDropBrowsers setObject:v12 forKeyedSubscript:v8];
    [(SDBonjourBrowser *)v17 setXpcConnection:v9];
    [(SDBonjourBrowser *)v17 setSessionID:v10];
    [(SDBonjourBrowser *)v17 setDelegate:self];
    [(SDBonjourBrowser *)v17 start];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100103714;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setIconData:(id)a3 iconHash:(id)a4 forPerson:(__SFNode *)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = [(NSMutableDictionary *)self->_airDropBrowsers objectForKeyedSubscript:@"local"];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 objectForKeyedSubscript:@"Browser"];
    [v11 setIconData:v12 iconHash:v8 forPerson:a5];
  }
}

- (void)incrementTransfersInitiated
{
  v2 = [(NSMutableDictionary *)self->_airDropBrowsers objectForKeyedSubscript:@"local"];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"Browser"];
    [v4 setTransfersInitiated:[v4 transfersInitiated] + 1];
  }
  else
  {
    id v4 = browser_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100104614(v4);
    }
  }
}

- (void)incrementTransfersCompleted
{
  v2 = [(NSMutableDictionary *)self->_airDropBrowsers objectForKeyedSubscript:@"local"];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"Browser"];
    [v4 setTransfersCompleted:[v4 transfersCompleted] + 1];
  }
  else
  {
    id v4 = browser_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "incrementTransfersCompleted: No AirDrop browsers are running", v5, 2u);
    }
  }
}

- (id)airDropNodesForDomain:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_airDropBrowsers objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"Browser"];
    CFStringRef v6 = [v5 nodes];
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return v6;
}

- (BOOL)isAirDropEnabled
{
  return [(NSMutableDictionary *)self->_airDropBrowsers count] != 0;
}

- (void)stopAirDropBrowsing:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_airDropBrowsers objectForKeyedSubscript:v4];
  CFStringRef v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"Count"];
    uint64_t v8 = [v7 intValue] - 1;

    if (v8)
    {
      id v9 = +[NSNumber numberWithInt:v8];
      [v6 setObject:v9 forKeyedSubscript:@"Count"];
    }
    else
    {
      id v10 = [v6 objectForKeyedSubscript:@"Browser"];
      [v10 invalidate];

      id v11 = [v6 objectForKeyedSubscript:@"Browser"];
      [v11 setDelegate:0];

      [(NSMutableDictionary *)self->_airDropBrowsers removeObjectForKey:v4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100103B40;
      block[3] = &unk_1008CA4B8;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)startBrowsingWorkgroup:(id)a3
{
  id v9 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:");
  if (v4)
  {
    id v5 = v4;
    CFStringRef v6 = [v4 objectForKeyedSubscript:@"Count"];
    uint64_t v7 = [v6 intValue] + 1;

    uint64_t v8 = +[NSNumber numberWithInt:v7];
    [v5 setObject:v8 forKeyedSubscript:@"Count"];
  }
  else
  {
    uint64_t v8 = [[SDWindowsBrowser alloc] initWithWorkgroup:v9];
    id v5 = objc_opt_new();
    [v5 setObject:&off_100902B38 forKeyedSubscript:@"Count"];
    [v5 setObject:v8 forKeyedSubscript:@"Browser"];
    [(NSMutableDictionary *)self->_windowsBrowsers setObject:v5 forKeyedSubscript:v9];
    [(SDWindowsBrowser *)v8 setDelegate:self];
    [(SDWindowsBrowser *)v8 start];
  }
}

- (id)windowsNodesForWorkgroup:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_windowsBrowsers objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"Browser"];
    CFStringRef v6 = [v5 nodes];
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return v6;
}

- (void)stopBrowsingWorkgroup:(id)a3
{
  id v9 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    CFStringRef v6 = [v4 objectForKeyedSubscript:@"Count"];
    uint64_t v7 = [v6 intValue] - 1;

    if (v7)
    {
      uint64_t v8 = +[NSNumber numberWithInt:v7];
      [v5 setObject:v8 forKeyedSubscript:@"Count"];
    }
    else
    {
      uint64_t v8 = [v5 objectForKeyedSubscript:@"Browser"];
      [v8 stop];
      [v8 setDelegate:0];
      [(NSMutableDictionary *)self->_windowsBrowsers removeObjectForKey:v9];
    }
  }
}

- (id)stringForBrowserMode:(int64_t)a3
{
  int v3 = a3;
  if ((unint64_t)a3 < 3) {
    return off_1008CD788[a3];
  }
  id v5 = browser_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unrecognized browser mode %d", (uint8_t *)v6, 8u);
  }

  return 0;
}

- (NSString)description
{
  uint64_t v83 = 0;
  NSAppendPrintF();
  id v82 = 0;
  NSAppendPrintF();
  id v3 = v82;

  id v81 = v3;
  v42 = [(SDServerBrowser *)self stringForBrowserMode:self->_mode];
  NSAppendPrintF();
  id v4 = v3;

  if ([(NSMutableDictionary *)self->_bonjourBrowsers count])
  {
    id v80 = v4;
    NSAppendPrintF();
    id v5 = v4;

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obj = self->_bonjourBrowsers;
    id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v76 objects:v87 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v77;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v77 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v76 + 1) + 8 * i);
          id v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bonjourBrowsers, "objectForKeyedSubscript:", v10, v43);
          id v12 = [v11 objectForKeyedSubscript:@"Browser"];
          id v75 = v5;
          uint64_t v44 = v10;
          NSAppendPrintF();
          id v13 = v5;

          id v74 = v13;
          v43 = [v12 description:v44];
          NSAppendPrintF();
          id v5 = v13;
        }
        id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v87, 16, v43);
      }
      while (v7);
    }

    id v73 = v5;
    NSAppendPrintF();
    id v4 = v5;
  }
  if ([(NSMutableDictionary *)self->_airDropBrowsers count])
  {
    id v72 = v4;
    NSAppendPrintF();
    id v14 = v4;

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obja = self->_airDropBrowsers;
    id v15 = [(NSMutableDictionary *)obja countByEnumeratingWithState:&v68 objects:v86 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v69;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v69 != v17) {
            objc_enumerationMutation(obja);
          }
          uint64_t v19 = *(void *)(*((void *)&v68 + 1) + 8 * (void)j);
          CFStringRef v20 = -[NSMutableDictionary objectForKeyedSubscript:](self->_airDropBrowsers, "objectForKeyedSubscript:", v19, v43);
          v21 = [v20 objectForKeyedSubscript:@"Browser"];
          id v67 = v14;
          uint64_t v45 = v19;
          NSAppendPrintF();
          id v22 = v14;

          id v66 = v22;
          v43 = [v21 description:v45];
          NSAppendPrintF();
          id v14 = v22;
        }
        id v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v68, v86, 16, v43);
      }
      while (v16);
    }

    id v65 = v14;
    NSAppendPrintF();
    id v4 = v14;
  }
  if ([(NSMutableDictionary *)self->_windowsBrowsers count])
  {
    id v64 = v4;
    NSAppendPrintF();
    id v23 = v4;

    long long v62 = 0u;
    long long v63 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    objb = self->_windowsBrowsers;
    id v24 = [(NSMutableDictionary *)objb countByEnumeratingWithState:&v60 objects:v85 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v61;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(void *)v61 != v26) {
            objc_enumerationMutation(objb);
          }
          uint64_t v28 = *(void *)(*((void *)&v60 + 1) + 8 * (void)k);
          v29 = -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsBrowsers, "objectForKeyedSubscript:", v28, v43);
          v30 = [v29 objectForKeyedSubscript:@"Browser"];
          id v59 = v23;
          uint64_t v46 = v28;
          NSAppendPrintF();
          id v31 = v23;

          id v58 = v31;
          v43 = [v30 description:v46];
          NSAppendPrintF();
          id v23 = v31;
        }
        id v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v60, v85, 16, v43);
      }
      while (v25);
    }

    id v57 = v23;
    NSAppendPrintF();
    id v4 = v23;
  }
  if ([(NSMutableDictionary *)self->_odiskBrowsers count])
  {
    id v56 = v4;
    NSAppendPrintF();
    id v32 = v4;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    objc = self->_odiskBrowsers;
    id v33 = [(NSMutableDictionary *)objc countByEnumeratingWithState:&v52 objects:v84 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v53;
      do
      {
        for (m = 0; m != v34; m = (char *)m + 1)
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(objc);
          }
          uint64_t v37 = *(void *)(*((void *)&v52 + 1) + 8 * (void)m);
          v38 = -[NSMutableDictionary objectForKeyedSubscript:](self->_odiskBrowsers, "objectForKeyedSubscript:", v37, v43);
          v39 = [v38 objectForKeyedSubscript:@"Browser"];
          uint64_t v47 = v37;
          NSAppendPrintF();
          id v40 = v32;

          v43 = [v39 description:v47];
          NSAppendPrintF();
          id v32 = v40;
        }
        id v34 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](objc, "countByEnumeratingWithState:objects:count:", &v52, v84, 16, v43);
      }
      while (v34);
    }

    NSAppendPrintF();
    id v4 = v32;
  }

  return (NSString *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airDropBrowsers, 0);
  objc_storeStrong((id *)&self->_windowsBrowsers, 0);
  objc_storeStrong((id *)&self->_bonjourBrowsers, 0);

  objc_storeStrong((id *)&self->_odiskBrowsers, 0);
}

@end