@interface W5WiFiConnectionMonitor
- (W5WiFiConnectionMonitor)init;
- (W5WiFiConnectionMonitor)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4;
- (id)__followupTests;
- (id)__initialTests;
- (id)droppedWiFiConnectionCallback;
- (void)__runDiagnosticsTests:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)pauseMonitoring;
- (void)resumeMonitoringAfterDelay:(double)a3;
- (void)setDroppedWiFiConnectionCallback:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation W5WiFiConnectionMonitor

- (W5WiFiConnectionMonitor)initWithStatusManager:(id)a3 diagnosticsManager:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)W5WiFiConnectionMonitor;
  v6 = [(W5WiFiConnectionMonitor *)&v12 init];
  v7 = v6;
  if (a3 && v6 && (v6->_status = (W5StatusManager *)a3, a4))
  {
    v7->_diagnostics = (W5DiagnosticsManager *)a4;
    v8 = dispatch_queue_create("com.apple.wifivelocity.wifi-conn-monitor", 0);
    v7->_queue = (OS_dispatch_queue *)v8;
    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
    v7->_pingTimer = (OS_dispatch_source *)v9;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100035644;
    handler[3] = &unk_1000DDC80;
    handler[4] = v7;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer((dispatch_source_t)v7->_pingTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v7->_pingTimer);
  }
  else
  {

    return 0;
  }
  return v7;
}

- (W5WiFiConnectionMonitor)init
{
}

- (void)dealloc
{
  pingTimer = self->_pingTimer;
  if (pingTimer)
  {
    dispatch_source_cancel(pingTimer);
    dispatch_release((dispatch_object_t)self->_pingTimer);
  }
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiConnectionMonitor;
  [(W5WiFiConnectionMonitor *)&v5 dealloc];
}

- (void)setDroppedWiFiConnectionCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_droppedWiFiConnectionCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100035CD4;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)__runDiagnosticsTests:(id)a3 reply:(id)a4
{
  v7 = objc_alloc_init(W5DiagnosticsTestRequestInternal);
  [(W5DiagnosticsTestRequestInternal *)v7 setUuid:+[NSUUID UUID]];
  [(W5DiagnosticsTestRequestInternal *)v7 setTestRequests:a3];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035DFC;
  v8[3] = &unk_1000DE028;
  v8[4] = self;
  v8[5] = a4;
  [(W5DiagnosticsTestRequestInternal *)v7 setReply:v8];
  [(W5DiagnosticsManager *)self->_diagnostics addRequest:v7];
}

- (id)__initialTests
{
  v3[1] = +[W5DiagnosticsTestRequest requestWithTestID:configuration:](W5DiagnosticsTestRequest, "requestWithTestID:configuration:", 3, 0, +[W5DiagnosticsTestRequest requestWithTestID:52 configuration:0]);
  v3[2] = +[W5DiagnosticsTestRequest requestWithTestID:6 configuration:0];
  v3[3] = +[W5DiagnosticsTestRequest requestWithTestID:7 configuration:0];
  v3[4] = +[W5DiagnosticsTestRequest requestWithTestID:9 configuration:0];
  v3[5] = +[W5DiagnosticsTestRequest requestWithTestID:11 configuration:0];
  v3[6] = +[W5DiagnosticsTestRequest requestWithTestID:32 configuration:0];
  return +[NSArray arrayWithObjects:v3 count:7];
}

- (id)__followupTests
{
  v3[0] = +[W5DiagnosticsTestRequest requestWithTestID:52 configuration:0];
  v3[1] = +[W5DiagnosticsTestRequest requestWithTestID:3 configuration:0];
  v3[2] = +[W5DiagnosticsTestRequest requestWithTestID:6 configuration:0];
  v3[3] = +[W5DiagnosticsTestRequest requestWithTestID:7 configuration:0];
  v3[4] = +[W5DiagnosticsTestRequest requestWithTestID:9 configuration:0];
  v3[5] = +[W5DiagnosticsTestRequest requestWithTestID:11 configuration:0];
  v3[6] = +[W5DiagnosticsTestRequest requestWithTestID:24 configuration:0];
  void v3[7] = +[W5DiagnosticsTestRequest requestWithTestID:32 configuration:0];
  return +[NSArray arrayWithObjects:v3 count:8];
}

- (void)startMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000362FC;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000363DC;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)pauseMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000364B8;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resumeMonitoringAfterDelay:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100036594;
  v4[3] = &unk_1000DE4C8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)droppedWiFiConnectionCallback
{
  return self->_droppedWiFiConnectionCallback;
}

@end