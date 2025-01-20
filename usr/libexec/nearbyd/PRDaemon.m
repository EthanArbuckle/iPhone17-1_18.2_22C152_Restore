@interface PRDaemon
- (PRDaemon)init;
- (void)checkForUnlockSinceBoot;
- (void)deviceHasUnlockedSinceBoot;
- (void)run;
- (void)startServices;
@end

@implementation PRDaemon

- (PRDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)PRDaemon;
  v2 = [(PRDaemon *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.nearbyd.eventQueue", 0);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v3;

    v5 = sub_1002F6464();
    v8[0] = off_1008473E0;
    v8[3] = v8;
    sub_1002F6500((uint64_t)v5, (uint64_t)v8);
    sub_10003E780(v8);
  }
  return v2;
}

- (void)run
{
  dispatch_queue_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PRDaemon] run", buf, 2u);
  }
  v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PRDaemon] registering for iokit xpc events", v9, 2u);
  }
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)self->_eventQueue, &stru_100847348);
  [(PRDaemon *)self checkForUnlockSinceBoot];
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PRDaemon] registering for notifyd xpc events", v8, 2u);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)self->_eventQueue, &stru_100847368);
  v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PRDaemon] registering for CBDiscovery xpc events", v7, 2u);
  }
  xpc_set_event_stream_handler("com.apple.bluetooth.discovery", (dispatch_queue_t)self->_eventQueue, &stru_100847388);
  [(PRDaemon *)self startServices];
}

- (void)startServices
{
  dispatch_queue_t v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PRDaemon] starting services", v8, 2u);
  }
  v4 = [[PRXPCActivityManager alloc] initWithQueue:self->_eventQueue];
  xpcActivityManager = self->_xpcActivityManager;
  self->_xpcActivityManager = v4;

  v6 = objc_alloc_init(PRXPCServicesManager);
  xpcManager = self->_xpcManager;
  self->_xpcManager = v6;

  [(PRXPCServicesManager *)self->_xpcManager startServices];
}

- (void)checkForUnlockSinceBoot
{
  eventQueue = self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000482D0;
  block[3] = &unk_1008473B0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)eventQueue, block);
}

- (void)deviceHasUnlockedSinceBoot
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048544;
  block[3] = &unk_1008473B0;
  block[4] = self;
  if (qword_1008A0420 != -1) {
    dispatch_once(&qword_1008A0420, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);

  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end