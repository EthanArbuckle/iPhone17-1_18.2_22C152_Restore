@interface MSDPricingUpdateController
+ (id)sharedInstance;
- (BOOL)canceled;
- (BOOL)completed;
- (BOOL)needUpdate;
- (BOOL)switchModeAfterCompletion;
- (NSTimer)heartBeatMonitor;
- (int)state;
- (void)operationCanceled;
- (void)pricingUpdateTimeOut:(id)a3;
- (void)receivedCompletionNotice:(id)a3 fromRequest:(id)a4;
- (void)receivedHeartBeat:(id)a3 fromRequest:(id)a4;
- (void)receivedOtherMessages:(id)a3 fromRequest:(id)a4;
- (void)receivedUpdateRequest:(id)a3 fromRequest:(id)a4;
- (void)restartMonitor;
- (void)setCanceled:(BOOL)a3;
- (void)setHeartBeatMonitor:(id)a3;
- (void)setNeedUpdate:(BOOL)a3;
- (void)setState:(int)a3;
- (void)setSwitchModeAfterCompletion:(BOOL)a3;
- (void)stopMonitor;
@end

@implementation MSDPricingUpdateController

+ (id)sharedInstance
{
  if (qword_100189978 != -1) {
    dispatch_once(&qword_100189978, &stru_100152800);
  }
  v2 = (void *)qword_100189970;

  return v2;
}

- (void)receivedUpdateRequest:(id)a3 fromRequest:(id)a4
{
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  v8 = +[MSDTargetDevice sharedInstance];
  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  id v10 = v8;
  objc_sync_enter(v10);
  if (([v10 aboutToReboot] & 1) != 0 || objc_msgSend(v10, "mode") == 7) {
    v11 = "NO";
  }
  else {
    v11 = "YES";
  }
  xpc_dictionary_set_string(reply, "MSDResult", v11);
  objc_sync_exit(v10);

  xpc_connection_send_message(v6, reply);
  v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received Pricing update request.", v13, 2u);
  }

  [(MSDPricingUpdateController *)self setState:1];
  if ([v10 mode] == 5) {
    [(MSDPricingUpdateController *)self setNeedUpdate:1];
  }
  if ([v10 mode] == 2 || objc_msgSend(v10, "mode") == 4) {
    [(MSDPricingUpdateController *)self restartMonitor];
  }
}

- (void)receivedHeartBeat:(id)a3 fromRequest:(id)a4
{
  id v6 = a4;
  id v7 = (_xpc_connection_s *)a3;
  v8 = +[MSDTargetDevice sharedInstance];
  xpc_object_t reply = xpc_dictionary_create_reply(v6);

  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v7, reply);

  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received Pricing heart beat.", v11, 2u);
  }

  if (([v8 mode] == 2 || objc_msgSend(v8, "mode") == 4)
    && [(MSDPricingUpdateController *)self state] <= 1)
  {
    [(MSDPricingUpdateController *)self restartMonitor];
  }
}

- (void)receivedCompletionNotice:(id)a3 fromRequest:(id)a4
{
  id v6 = a4;
  id v7 = (_xpc_connection_s *)a3;
  v8 = +[MSDTargetDevice sharedInstance];
  xpc_object_t reply = xpc_dictionary_create_reply(v6);

  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v7, reply);

  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received Pricing completion notice.", v11, 2u);
  }

  [(MSDPricingUpdateController *)self stopMonitor];
  [(MSDPricingUpdateController *)self setState:2];
  if ([(MSDPricingUpdateController *)self switchModeAfterCompletion]
    && ![(MSDPricingUpdateController *)self canceled])
  {
    [v8 switchModeImmediately:5];
  }
}

- (void)receivedOtherMessages:(id)a3 fromRequest:(id)a4
{
  v5 = (_xpc_connection_s *)a3;
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create(0, 0, 0);
  }
  xpc_object_t message = reply;
  xpc_dictionary_set_string(reply, "MSDResult", "YES");
  xpc_connection_send_message(v5, message);
}

- (void)operationCanceled
{
}

- (BOOL)completed
{
  unsigned int v2 = [(MSDPricingUpdateController *)self state];
  if (v2 - 2 < 2) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  if (v2)
  {
    id v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unknow Pricing app state.", v9, 2u);
    }

    return 1;
  }
  v3 = +[MSDTargetDevice sharedInstance];
  v4 = [v3 lastRebootTime];
  [v4 timeIntervalSinceNow];
  BOOL v6 = v5 <= -60.0;

  return v6;
}

- (void)stopMonitor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004015C;
  block[3] = &unk_100151AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)restartMonitor
{
  [(MSDPricingUpdateController *)self stopMonitor];
  v3 = +[MSDTargetDevice sharedInstance];
  unsigned __int8 v4 = [v3 aboutToReboot];

  if ((v4 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040274;
    block[3] = &unk_100151AF0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)pricingUpdateTimeOut:(id)a3
{
  unsigned __int8 v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Heart beat monitor timer triggered.", (uint8_t *)&v13, 2u);
  }

  [(MSDPricingUpdateController *)self stopMonitor];
  if ([(MSDPricingUpdateController *)self state] <= 1)
  {
    [(MSDPricingUpdateController *)self setState:3];
    double v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 67109120;
      int v14 = 120;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No XPC message from Pricing app for %d seconds.", (uint8_t *)&v13, 8u);
    }

    BOOL v6 = +[NSError errorDomainMSDWithCode:3727741024 message:@"Pricing app stopped."];
    id v7 = +[MSDDemoUpdateStatusHub sharedInstance];
    [v7 demoUpdateFailed:v6];
  }
  if ([(MSDPricingUpdateController *)self switchModeAfterCompletion])
  {
    v8 = +[MSDTestPreferences sharedInstance];
    uint64_t v9 = (uint64_t)[v8 timeShowingFatalError];

    if (v9)
    {
      id v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 67109120;
        int v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Override MSDTimeShowingFatalError timeout: %u", (uint8_t *)&v13, 8u);
      }
    }
    else
    {
      uint64_t v9 = 900;
    }
    v11 = +[MSDDemoUpdateTimeKeeper sharedInstance];
    id v12 = [v11 setCompletionTimeForFatalError:v9];
  }
}

- (BOOL)switchModeAfterCompletion
{
  return self->_switchModeAfterCompletion;
}

- (void)setSwitchModeAfterCompletion:(BOOL)a3
{
  self->_switchModeAfterCompletion = a3;
}

- (BOOL)needUpdate
{
  return self->_needUpdate;
}

- (void)setNeedUpdate:(BOOL)a3
{
  self->_needUpdate = a3;
}

- (NSTimer)heartBeatMonitor
{
  return self->_heartBeatMonitor;
}

- (void)setHeartBeatMonitor:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
}

@end