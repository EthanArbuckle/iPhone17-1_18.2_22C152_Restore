@interface WiFi3BarsObserver
+ (id)sharedWiFi3BarsObserver;
- (NSXPCConnection)connectionToService;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_source)timer;
- (WiFi3BarsObserver)init;
- (void)_cleanupMaintenanceTask;
- (void)_installDeferMonitorForActivity:(id)a3 proxy:(id)a4;
- (void)dealloc;
- (void)fetch3BarsNetworksForLocation:(id)a3;
- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4;
- (void)prune3BarsNetworks:(unint64_t)a3;
- (void)run3BarsObserver:(void *)a3 withActivity:(id)a4 withCompletion:(id)a5;
- (void)setTimer:(id)a3;
- (void)setTimerQueue:(id)a3;
@end

@implementation WiFi3BarsObserver

+ (id)sharedWiFi3BarsObserver
{
  if (qword_10027DC68 != -1) {
    dispatch_once(&qword_10027DC68, &stru_100243300);
  }
  v3 = (void *)qword_10027DC60;
  return v3;
}

- (WiFi3BarsObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)WiFi3BarsObserver;
  v2 = [(WiFi3BarsObserver *)&v7 init];
  if (v2)
  {
    v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.wifi.ThreeBarsXPCService"];
    v2->_connectionToService = v3;
    if (v3)
    {
      [(NSXPCConnection *)v2->_connectionToService setRemoteObjectInterface:+[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TBXPCServiceProtocol]];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100175228;
      v6[3] = &unk_10023EFA8;
      v6[4] = v2;
      [(NSXPCConnection *)v2->_connectionToService setInvalidationHandler:v6];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_100175320;
      v5[3] = &unk_10023EFA8;
      v5[4] = v2;
      [(NSXPCConnection *)v2->_connectionToService setInterruptionHandler:v5];
      [(NSXPCConnection *)v2->_connectionToService resume];
      v2->_timerQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.wifid.3BarsObserverTimer", 0);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connectionToService invalidate];
  dispatch_release((dispatch_object_t)self->_timerQueue);
  v3.receiver = self;
  v3.super_class = (Class)WiFi3BarsObserver;
  [(WiFi3BarsObserver *)&v3 dealloc];
}

- (void)_installDeferMonitorForActivity:(id)a3 proxy:(id)a4
{
  objc_super v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_timerQueue);
  self->_timer = v7;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001755BC;
  handler[3] = &unk_10023EFA8;
  handler[4] = self;
  dispatch_source_set_cancel_handler((dispatch_source_t)v7, handler);
  self->_activityStartTimestamp = +[NSDate date];
  timer = self->_timer;
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(timer, v9, 0x12A05F200uLL, 0x12A05F200uLL);
  v10 = self->_timer;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001755F0;
  v11[3] = &unk_1002425E0;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a3;
  dispatch_source_set_event_handler(v10, v11);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)run3BarsObserver:(void *)a3 withActivity:(id)a4 withCompletion:(id)a5
{
  if (!sub_100089448((uint64_t)a3))
  {
    if (qword_10027DD68) {
      [[(id)qword_10027DD68 WFLog:message:3, "%s: availability engine is not enabled", "-[WiFi3BarsObserver run3BarsObserver:withActivity:withCompletion:]"];
    }
    dispatch_time_t v9 = 0;
LABEL_13:
    (*((void (**)(id, void))a5 + 2))(a5, 0);
    if (!v9) {
      return;
    }
    goto LABEL_6;
  }
  dispatch_time_t v9 = sub_1000A36E4((id *)a3);
  if (!sub_1000A3740((uint64_t)a3, (uint64_t)v9))
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: location not valid", "-[WiFi3BarsObserver run3BarsObserver:withActivity:withCompletion:]");
    }
    goto LABEL_13;
  }
  connectionToService = self->_connectionToService;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100175964;
  v15[3] = &unk_100243328;
  v15[4] = a5;
  id v11 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v15];
  if (v11)
  {
    v12 = v11;
    [(WiFi3BarsObserver *)self _installDeferMonitorForActivity:a4 proxy:v11];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001759F4;
    v14[3] = &unk_100243350;
    v14[4] = self;
    v14[5] = a5;
    [v12 maintenanceTask:104857600 location:v9 predictedForDuration:1 maxPredictedLocations:v14 completionHandler:86400.0];
  }
  if (v9) {
LABEL_6:
  }
    CFRelease(v9);
}

- (void)_cleanupMaintenanceTask
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, @"%s: cleaning maintenance task", @"-[WiFi3BarsObserver _cleanupMaintenanceTask]"];
  }
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
  }
}

- (void)fetch3BarsNetworksForLocation:(id)a3
{
  id v4 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxyWithErrorHandler:&stru_100243390];
  if (v4)
  {
    [v4 fetch3BarsNetworksForLocation:a3];
  }
}

- (void)prune3BarsNetworks:(unint64_t)a3
{
  id v4 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxyWithErrorHandler:&stru_1002433B0];
  if (v4)
  {
    [v4 prune3BarsNetworks:a3];
  }
}

- (void)forceFetch3BarsNetworkMatchingBSSID:(id)a3 completionHandler:(id)a4
{
  id v6 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxyWithErrorHandler:&stru_1002433D0];
  if (v6)
  {
    [v6 forceFetch3BarsNetworkMatchingBSSID:a3 completionHandler:a4];
  }
}

- (NSXPCConnection)connectionToService
{
  return self->_connectionToService;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  self->_timer = (OS_dispatch_source *)a3;
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
}

@end