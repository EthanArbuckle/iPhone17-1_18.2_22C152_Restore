@interface SDConnectedBrowser
+ (id)sharedBrowser;
- (BOOL)opticalDisk:(id)a3;
- (NSArray)airDropNodes;
- (NSArray)nodes;
- (NSArray)odiskNodes;
- (SDConnectedBrowser)init;
- (id)URLForRemounting:(id)a3;
- (id)connectedNodes;
- (id)recentNodes;
- (int)addNode:(__SFNode *)a3;
- (int)removeNode:(__SFNode *)a3;
- (void)addAirDropPerson:(__SFNode *)a3;
- (void)browseAfterDelay:(double)a3;
- (void)buildNodesAndNotify:(BOOL)a3;
- (void)combineRecentAndConnectedNodes:(BOOL)a3;
- (void)postNotification;
- (void)removeAirDropPerson:(__SFNode *)a3;
- (void)removeAirDropPersonInternal:(__SFNode *)a3;
- (void)setODiskServers:(id)a3;
- (void)setServers:(id)a3;
- (void)start;
- (void)stop;
- (void)volumesChanged:(id)a3;
@end

@implementation SDConnectedBrowser

+ (id)sharedBrowser
{
  if (qword_100980340 != -1) {
    dispatch_once(&qword_100980340, &stru_1008D0068);
  }
  v2 = (void *)qword_100980348;

  return v2;
}

- (SDConnectedBrowser)init
{
  v10.receiver = self;
  v10.super_class = (Class)SDConnectedBrowser;
  v2 = [(SDConnectedBrowser *)&v10 init];
  v3 = v2;
  if (v2)
  {
    timer = v2->_timer;
    v2->_timer = 0;

    servers = v3->_servers;
    v3->_servers = 0;

    *(void *)&v3->_clientCount = 0;
    v3->_connectedCount = 0;
    odiskServers = v3->_odiskServers;
    v3->_odiskServers = 0;

    v3->_airDropPeople = 0;
    v3->_sendNotification = 0;
    uint64_t v7 = +[SDStatusMonitor sharedMonitor];
    monitor = v3->_monitor;
    v3->_monitor = (SDStatusMonitor *)v7;
  }
  return v3;
}

- (void)setServers:(id)a3
{
  id v5 = a3;
  if (sub_1000D9194(self->_servers, v5))
  {
    objc_storeStrong((id *)&self->_servers, a3);
    self->_sendNotification = 1;
  }
}

- (void)setODiskServers:(id)a3
{
  id v5 = a3;
  if (sub_1000D9194(self->_odiskServers, v5))
  {
    objc_storeStrong((id *)&self->_odiskServers, a3);
    self->_sendNotification = 1;
  }
}

- (NSArray)nodes
{
  return [(NSDictionary *)self->_servers allValues];
}

- (NSArray)odiskNodes
{
  return [(NSDictionary *)self->_odiskServers allValues];
}

- (void)postNotification
{
  if (self->_sendNotification)
  {
    self->_sendNotification = 0;
    id v2 = +[NSNotificationCenter defaultCenter];
    [v2 postNotificationName:@"com.apple.sharingd.ConnectedChanged" object:0 userInfo:0];
  }
}

- (void)browseAfterDelay:(double)a3
{
  timer = self->_timer;
  dispatch_time_t v4 = sub_1001B1AF8(a3);

  sub_1001B1BC4(timer, v4);
}

- (id)recentNodes
{
  id v2 = objc_opt_new();
  v3 = [v2 allValues];

  return v3;
}

- (int)addNode:(__SFNode *)a3
{
  return -1;
}

- (int)removeNode:(__SFNode *)a3
{
  return -1;
}

- (BOOL)opticalDisk:(id)a3
{
  CFTypeRef cf = 0;
  if (_CFURLGetVolumePropertyFlags()) {
    return 0;
  }
  dispatch_time_t v4 = browser_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1001D4B3C((uint64_t *)&cf, v4);
  }

  CFRelease(cf);
  return 0;
}

- (id)URLForRemounting:(id)a3
{
  id v9 = 0;
  id v8 = 0;
  unsigned __int8 v3 = [a3 getResourceValue:&v9 forKey:NSURLVolumeURLForRemountingKey error:&v8];
  id v4 = v9;
  id v5 = v8;
  if ((v3 & 1) == 0)
  {
    v6 = browser_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001D4BB8((uint64_t)v5, v6);
    }
  }

  return v4;
}

- (id)connectedNodes
{
  v37 = objc_opt_new();
  v41 = objc_opt_new();
  v40 = objc_opt_new();
  v36 = objc_opt_new();
  NSURLResourceKey v50 = NSURLVolumeURLForRemountingKey;
  uint64_t v3 = +[NSArray arrayWithObjects:&v50 count:1];
  id v4 = +[NSFileManager defaultManager];
  v33 = (void *)v3;
  id v5 = [v4 mountedVolumeURLsIncludingResourceValuesForKeys:v3 options:2];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v46;
    uint64_t v34 = kSFNodeProtocolAFP;
    uint64_t v35 = kSFNodeProtocolFile;
    uint64_t v38 = *(void *)v46;
    id v39 = v6;
    v43 = self;
    do
    {
      objc_super v10 = 0;
      id v42 = v8;
      do
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v10);
        unsigned __int8 v12 = [(SDConnectedBrowser *)self opticalDisk:v11];
        v13 = [(SDConnectedBrowser *)self URLForRemounting:v11];
        v14 = v13;
        if ((v12 & 1) != 0 || v13)
        {
          v15 = [v13 host];
          v16 = [v14 scheme];
          v44 = v16;
          if (v12)
          {
            variable initialization expression of HeadphoneProxFeatureClient.delegate();
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (v17) {
              goto LABEL_10;
            }
          }
          else
          {
            if (v15) {
              BOOL v20 = v16 == 0;
            }
            else {
              BOOL v20 = 1;
            }
            if (!v20 && ([v16 isEqual:v35] & 1) == 0)
            {
              v17 = [(SDStatusMonitor *)self->_monitor serverNameForHost:v15];
              if (!v17)
              {
                v21 = (__CFNetService *)_CFNetServiceCreateFromURL();
                if (!v21
                  || (v22 = v21,
                      CFNetServiceGetName(v21),
                      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(),
                      CFRelease(v22),
                      !v17))
                {
                  if (![v44 isEqual:v34]
                    || (sub_1001B3A38(v11), (v17 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
                  {
                    v17 = v15;
                  }
                }
              }
LABEL_10:
              if ([(__CFString *)v15 isEqual:v17])
              {
                v18 = sub_1001B4338(v15);
                v19 = (const void *)SFNodeCreate();
                CFRelease(v18);
              }
              else
              {
                v19 = (const void *)SFNodeCreate();
              }
              v23 = v40;
              v24 = v41;
              v25 = v17;
              if ((v12 & 1) == 0)
              {
                v26 = [v14 port];
                int v27 = [v26 intValue];

                SFNodeSetHostName();
                CFURLRef v28 = sub_1000D8564(v44, 0, 0, v15, v27, 0, 0, 0);
                v24 = v36;
                v23 = v37;
                v25 = v15;
                if (v28)
                {
                  CFURLRef v29 = v28;
                  SFNodeSetURL();
                  CFRelease(v29);
                  v24 = v36;
                  v23 = v37;
                  v25 = v15;
                }
              }
              SFNodeAddKind();
              [(SDConnectedBrowser *)v43 setNodeModel:v19 protocol:v44 url:v14];
              [v23 setValue:v19 forKey:v25];
              CFRelease(v19);
              v30 = [v24 objectForKeyedSubscript:v17];
              if (!v30)
              {
                v30 = +[NSMutableArray array];
                [v24 setValue:v30 forKey:v17];
              }
              [v30 addObject:v11];

              id v8 = v42;
              self = v43;
              uint64_t v9 = v38;
              id v6 = v39;
            }
          }
        }
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v8);
  }

  [(SDStatusMonitor *)self->_monitor setODiskMountPoints:v41];
  [(SDStatusMonitor *)self->_monitor setServerMountPoints:v36];
  [(SDConnectedBrowser *)self setODiskServers:v40];
  v31 = [v37 allValues];

  return v31;
}

- (void)combineRecentAndConnectedNodes:(BOOL)a3
{
  BOOL v29 = a3;
  uint64_t v3 = self;
  v31 = [(SDConnectedBrowser *)self recentNodes];
  id v4 = [(SDConnectedBrowser *)v3 connectedNodes];
  id v5 = objc_opt_new();
  id v28 = [v4 count];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v4;
  id v6 = (char *)[obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  v33 = v3;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        objc_super v10 = (const void *)SFNodeCopyRealName();
        servers = v3->_servers;
        if (servers
          && ([(NSDictionary *)servers objectForKeyedSubscript:v10],
              unsigned __int8 v12 = objc_claimAutoreleasedReturnValue(),
              v12,
              v12))
        {
          v13 = (const void *)SFNodeCopyURL();
          v14 = (const void *)SFNodeCopyModel();
          v15 = (void *)SFNodeCopyRealName();
          SFNodeSetURL();
          SFNodeSetModel();
          [v5 setObject:v12 forKeyedSubscript:v15];
          if (v14) {
            CFRelease(v14);
          }
          if (v13) {
            CFRelease(v13);
          }
          uint64_t v3 = v33;
        }
        else
        {
          Copy = (const void *)SFNodeCreateCopy();
          v15 = (void *)SFNodeCopyRealName();
          [v5 setObject:Copy forKeyedSubscript:v15];
          CFRelease(Copy);
        }

        SFNodeAddKind();
        CFRelease(v10);
      }
      id v7 = (char *)[obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v7);
  }

  if (v28 != (id)v3->_connectedCount)
  {
    v3->_connectedCount = (int)v28;
    v3->_sendNotification = 1;
  }
  if (v29) {
    [(SDConnectedBrowser *)v3 addToRecents:v5];
  }
  id v30 = [v31 count];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = v31;
  v18 = (char *)[v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v18)
  {
    v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = (void *)SFNodeCopyRealName();
        v23 = [v5 objectForKeyedSubscript:v22];

        if (v23) {
          goto LABEL_26;
        }
        v25 = v33->_servers;
        if (v25)
        {
          v23 = [(NSDictionary *)v25 objectForKeyedSubscript:v22];

          if (v23)
          {
            v26 = (const void *)SFNodeCopyURL();
            SFNodeSetURL();
            SFNodeRemoveKind();
            if (v26) {
              CFRelease(v26);
            }
LABEL_26:
            v24 = (const void *)SFNodeCopyRealName();
            [v5 setObject:v23 forKeyedSubscript:v24];
            goto LABEL_32;
          }
        }
        v24 = (const void *)SFNodeCreateCopy();
        int v27 = (const void *)SFNodeCopyRealName();
        [v5 setObject:v24 forKeyedSubscript:v27];
        CFRelease(v27);
LABEL_32:
        CFRelease(v24);
        SFNodeAddKind();
      }
      v19 = (char *)[v17 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v19);
  }

  if (v30 != (id)v33->_recentsCount)
  {
    v33->_recentsCount = (int)v30;
    v33->_sendNotification = 1;
  }
  [(SDConnectedBrowser *)v33 setServers:v5];
}

- (void)buildNodesAndNotify:(BOOL)a3
{
  [(SDConnectedBrowser *)self combineRecentAndConnectedNodes:a3];

  [(SDConnectedBrowser *)self postNotification];
}

- (void)addAirDropPerson:(__SFNode *)a3
{
  airDropPeople = self->_airDropPeople;
  if (!airDropPeople)
  {
    airDropPeople = CFBagCreateMutable(0, 0, &kCFTypeBagCallBacks);
    self->_airDropPeople = airDropPeople;
  }
  CFBagAddValue(airDropPeople, a3);
  if (CFBagGetCountOfValue(self->_airDropPeople, a3) == 1)
  {
    SFNodeAddKind();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001D46D0;
    block[3] = &unk_1008CA4B8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (NSArray)airDropNodes
{
  id v2 = sub_1000D82CC(0, 0, self->_airDropPeople);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [(__CFSet *)v2 allObjects];
    CFRelease(v3);
  }
  else
  {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)removeAirDropPersonInternal:(__SFNode *)a3
{
  CFBagRemoveValue(self->_airDropPeople, a3);
  if (!CFBagGetCountOfValue(self->_airDropPeople, a3))
  {
    SFNodeRemoveKind();
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1008D0088);
  }
}

- (void)removeAirDropPerson:(__SFNode *)a3
{
  CFRetain(a3);
  unsigned int v5 = [(SDStatusMonitor *)self->_monitor wirelessEnabled];
  double v6 = 0.0;
  if (v5) {
    double v6 = 2.0;
  }
  dispatch_time_t v7 = sub_1001B1AF8(v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001D4918;
  v8[3] = &unk_1008CBF30;
  v8[4] = self;
  v8[5] = a3;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)volumesChanged:(id)a3
{
}

- (void)start
{
  int clientCount = self->_clientCount;
  self->_int clientCount = clientCount + 1;
  if (!clientCount)
  {
    if (!self->_timer)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1001D4A50;
      v7[3] = &unk_1008CA4B8;
      v7[4] = self;
      sub_1001B1B10(1, &_dispatch_main_q, v7);
      id v4 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();
      timer = self->_timer;
      self->_timer = v4;

      dispatch_resume((dispatch_object_t)self->_timer);
    }
    double v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:self selector:"volumesChanged:" name:@"com.apple.sharingd.VolumesChanged" object:0];
  }
}

- (void)stop
{
  int v2 = self->_clientCount - 1;
  self->_int clientCount = v2;
  if (!v2)
  {
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_cancel(timer);
      unsigned int v5 = self->_timer;
      self->_timer = 0;
    }
    double v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self];

    servers = self->_servers;
    self->_servers = 0;

    odiskServers = self->_odiskServers;
    self->_odiskServers = 0;

    self->_recentsCount = 0;
    self->_connectedCount = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_odiskServers, 0);

  objc_storeStrong((id *)&self->_servers, 0);
}

@end