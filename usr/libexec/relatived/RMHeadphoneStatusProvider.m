@interface RMHeadphoneStatusProvider
- (BOOL)activitySupported;
- (BOOL)requireActivity;
- (NSString)activeAudioRouteDeviceID;
- (OS_dispatch_queue)receiverQueue;
- (RMAudioAccessoryManager)audioAccessoryManager;
- (RMHeadphoneStatusProvider)initWithReceiverQueue:(id)a3 requireActivitySupport:(BOOL)a4;
- (id)callbackBlock;
- (id)startProducingDataWithCallback:(id)a3;
- (int64_t)lastDeviceStatus;
- (void)notifyClientWithStatusConnected:(BOOL)a3;
- (void)notifyConnectedToClient;
- (void)notifyDisconnectedToClient;
- (void)onActiveAudioRouteChanged:(id)a3;
- (void)setActiveAudioRouteDeviceID:(id)a3;
- (void)setActivitySupported:(BOOL)a3;
- (void)setAudioAccessoryManager:(id)a3;
- (void)setCallbackBlock:(id)a3;
- (void)setLastDeviceStatus:(int64_t)a3;
- (void)setReceiverQueue:(id)a3;
- (void)setRequireActivity:(BOOL)a3;
- (void)startMonitoringActiveAudioRoute;
- (void)stopMonitoringActiveAudioRoute;
- (void)stopProducingData;
- (void)updateActivityForCurrentRoute;
@end

@implementation RMHeadphoneStatusProvider

- (RMHeadphoneStatusProvider)initWithReceiverQueue:(id)a3 requireActivitySupport:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMHeadphoneStatusProvider;
  v7 = [(RMHeadphoneStatusProvider *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(RMHeadphoneStatusProvider *)v7 setReceiverQueue:v6];
    [(RMHeadphoneStatusProvider *)v8 setRequireActivity:v4];
  }

  return v8;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [(RMHeadphoneStatusProvider *)self setAudioAccessoryManager:v5];

  +[CMAudioAccessoryManager _isAvailable];
  [(RMHeadphoneStatusProvider *)self setCallbackBlock:v4];

  if ([(RMHeadphoneStatusProvider *)self requireActivity])
  {
    [(RMHeadphoneStatusProvider *)self startMonitoringActiveAudioRoute];
    [(RMHeadphoneStatusProvider *)self updateActivityForCurrentRoute];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000079D4;
  v9[3] = &unk_100024BC0;
  v9[4] = self;
  id v6 = objc_retainBlock(v9);
  v7 = [(RMHeadphoneStatusProvider *)self audioAccessoryManager];
  [v7 startStatusUpdatesWithHandler:v6];

  return 0;
}

- (void)stopProducingData
{
  if ([(RMHeadphoneStatusProvider *)self requireActivity]) {
    [(RMHeadphoneStatusProvider *)self stopMonitoringActiveAudioRoute];
  }
  v3 = [(RMHeadphoneStatusProvider *)self audioAccessoryManager];
  [v3 stopStatusUpdates];

  [(RMHeadphoneStatusProvider *)self setAudioAccessoryManager:0];
}

- (void)notifyDisconnectedToClient
{
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024C08);
  }
  v3 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[RMHeadphoneStatusProvider] About to notify disconnected to client.", v4, 2u);
  }
  [(RMHeadphoneStatusProvider *)self notifyClientWithStatusConnected:0];
}

- (void)notifyConnectedToClient
{
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024C08);
  }
  v3 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[RMHeadphoneStatusProvider] About to notify connected to client.", v4, 2u);
  }
  [(RMHeadphoneStatusProvider *)self notifyClientWithStatusConnected:1];
}

- (void)notifyClientWithStatusConnected:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = kCMHeadphoneMotionManagerEventTypeKey;
  v5 = (uint64_t *)&kCMHeadphoneMotionManagerEventTypeConnect;
  if (!a3) {
    v5 = (uint64_t *)&kCMHeadphoneMotionManagerEventTypeDisconnect;
  }
  uint64_t v20 = *v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:0 error:0];
  if (v7)
  {
    if ([(RMHeadphoneStatusProvider *)self requireActivity]
      && ![(RMHeadphoneStatusProvider *)self activitySupported]
      && v3)
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024C08);
      }
      uint64_t v8 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "[RMHeadphoneStatusProvider] Dropping connect event due to no activity support.";
        objc_super v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 2;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
      }
    }
    else
    {
      v13 = [(RMHeadphoneStatusProvider *)self receiverQueue];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100007E24;
      v15[3] = &unk_1000248B8;
      v15[4] = self;
      id v16 = v7;
      dispatch_async(v13, v15);
    }
  }
  else
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100024C08);
    }
    uint64_t v14 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      v9 = "[RMHeadphoneStatusProvider] Failed to serialize event NSDictionary object: %{public}@";
      objc_super v10 = v14;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
      goto LABEL_16;
    }
  }
}

- (void)startMonitoringActiveAudioRoute
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"onActiveAudioRouteChanged:" name:@"RMAudioDeviceChangeCompletedNotification" object:0];
}

- (void)stopMonitoringActiveAudioRoute
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"RMAudioDeviceChangeCompletedNotification" object:0];
}

- (void)onActiveAudioRouteChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"RMAudioDeviceChangeCompletedRouteIDKey"];

  if (v7)
  {
    uint64_t v8 = [(RMHeadphoneStatusProvider *)v5 activeAudioRouteDeviceID];
    unsigned __int8 v9 = [v8 isEqualToString:v7];

    if ((v9 & 1) == 0)
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024C08);
      }
      objc_super v10 = (id)qword_10002C540;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        os_log_type_t v11 = [(RMHeadphoneStatusProvider *)v5 activeAudioRouteDeviceID];
        int v13 = 138478083;
        uint64_t v14 = v7;
        __int16 v15 = 2113;
        id v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[RMHeadphoneStatusProvider] New audio route: %{private}@ (old route: %{private}@). Starting activity check.", (uint8_t *)&v13, 0x16u);
      }
      [(RMHeadphoneStatusProvider *)v5 setActiveAudioRouteDeviceID:v7];
      [(RMHeadphoneStatusProvider *)v5 updateActivityForCurrentRoute];
    }
  }
  else
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100024C08);
    }
    uint32_t v12 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[RMHeadphoneStatusProvider] Speaker route. Resetting activity support.", (uint8_t *)&v13, 2u);
    }
    [(RMHeadphoneStatusProvider *)v5 setActivitySupported:0];
    [(RMHeadphoneStatusProvider *)v5 setActiveAudioRouteDeviceID:0];
  }

  objc_sync_exit(v5);
}

- (void)updateActivityForCurrentRoute
{
  id v3 = [(RMHeadphoneStatusProvider *)self audioAccessoryManager];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008214;
  v4[3] = &unk_100024BE8;
  v4[4] = self;
  [v3 startActivityUpdatesWithHandler:v4];
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
}

- (RMAudioAccessoryManager)audioAccessoryManager
{
  return self->_audioAccessoryManager;
}

- (void)setAudioAccessoryManager:(id)a3
{
}

- (NSString)activeAudioRouteDeviceID
{
  return self->_activeAudioRouteDeviceID;
}

- (void)setActiveAudioRouteDeviceID:(id)a3
{
}

- (BOOL)activitySupported
{
  return self->_activitySupported;
}

- (void)setActivitySupported:(BOOL)a3
{
  self->_activitySupported = a3;
}

- (BOOL)requireActivity
{
  return self->_requireActivity;
}

- (void)setRequireActivity:(BOOL)a3
{
  self->_requireActivity = a3;
}

- (int64_t)lastDeviceStatus
{
  return self->_lastDeviceStatus;
}

- (void)setLastDeviceStatus:(int64_t)a3
{
  self->_lastDeviceStatus = a3;
}

- (id)callbackBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setCallbackBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callbackBlock, 0);
  objc_storeStrong((id *)&self->_activeAudioRouteDeviceID, 0);
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);

  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end