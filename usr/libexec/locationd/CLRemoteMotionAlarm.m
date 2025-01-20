@interface CLRemoteMotionAlarm
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection;
- (CLRemoteMotionAlarm)init;
- (CLTimer)resendTimer;
- (CLTimer)revertToUnknownTimer;
- (NSMutableSet)motionAlarmClients;
- (int)lastKnownMotionState;
- (void)beginService;
- (void)delayRevertToUnknownTimer;
- (void)endService;
- (void)evaluateMotionAlarmState;
- (void)pairedDeviceIsNearby:(BOOL)a3;
- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4;
- (void)registerClientForRemoteMotionAlarm:(id)a3;
- (void)sendMotionAlarmRequest;
- (void)setLastKnownMotionState:(int)a3;
- (void)setMotionAlarmClients:(id)a3;
- (void)setResendTimer:(id)a3;
- (void)setRevertToUnknownTimer:(id)a3;
- (void)setStreamingConnection:(id)a3;
- (void)unregisterClientForRemoteMotionAlarm:(id)a3;
@end

@implementation CLRemoteMotionAlarm

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102481818 != -1) {
    dispatch_once(&qword_102481818, &stru_1022F9690);
  }
  return (id)qword_102481810;
}

+ (BOOL)isSupported
{
  if (qword_102481828 != -1) {
    dispatch_once(&qword_102481828, &stru_1022F96B0);
  }
  return byte_102481820;
}

- (CLRemoteMotionAlarm)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLRemoteMotionAlarm;
  return [(CLRemoteMotionAlarm *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLRemoteMotionAlarmServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLRemoteMotionAlarmClientProtocol];
}

- (void)beginService
{
  [self universe] silo
  -[CLRemoteMotionAlarm setStreamingConnection:](self, "setStreamingConnection:", [objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "vendor") proxyForService:@"CLLocationStreamingConnectionManager" forClient:@"CLRemoteMotionAlarm"]);
  [(CLLocationStreamingConnectionManagerServiceProtocol *)[(CLRemoteMotionAlarm *)self streamingConnection] addClient:self];
  [(CLRemoteMotionAlarm *)self setMotionAlarmClients:+[NSMutableSet set]];
  [(CLRemoteMotionAlarm *)self setLastKnownMotionState:0];
  -[CLRemoteMotionAlarm setResendTimer:](self, "setResendTimer:", [objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "silo") newTimer]);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100DF8724;
  v4[3] = &unk_10229FED8;
  v4[4] = self;
  [(CLTimer *)[(CLRemoteMotionAlarm *)self resendTimer] setHandler:v4];
  -[CLRemoteMotionAlarm setRevertToUnknownTimer:](self, "setRevertToUnknownTimer:", [objc_msgSend(-[CLRemoteMotionAlarm universe](self, "universe"), "silo") newTimer]);
  [(CLTimer *)[(CLRemoteMotionAlarm *)self revertToUnknownTimer] setHandler:&v3];
}

- (void)endService
{
  [self universe].silo
  [(CLLocationStreamingConnectionManagerServiceProtocol *)[(CLRemoteMotionAlarm *)self streamingConnection] retireClient:self];
  [(CLRemoteMotionAlarm *)self setStreamingConnection:0];
  [(CLRemoteMotionAlarm *)self setMotionAlarmClients:0];
  [(CLRemoteMotionAlarm *)self setResendTimer:0];

  [(CLRemoteMotionAlarm *)self setRevertToUnknownTimer:0];
}

- (void)setLastKnownMotionState:(int)a3
{
  if (self->_lastKnownMotionState != a3)
  {
    uint64_t v3 = *(void *)&a3;
    self->_lastKnownMotionState = a3;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022F96D0);
    }
    unint64_t v5 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289282;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 2050;
      uint64_t v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Notifying motion alarm\", \"state\":%{public, location:CLLocationProvider_Type::MotionDetected}lld}", (uint8_t *)&buf, 0x1Cu);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = [(CLRemoteMotionAlarm *)self motionAlarmClients];
    id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * i) remoteDeviceMotionUpdate:v3 atTime:CFAbsoluteTimeGetCurrent()];
        }
        id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)evaluateMotionAlarmState
{
  if ([(NSMutableSet *)[(CLRemoteMotionAlarm *)self motionAlarmClients] count])
  {
    [(CLTimer *)[(CLRemoteMotionAlarm *)self resendTimer] nextFireDelay];
    if (v3 == 1.79769313e308)
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022F96D0);
      }
      v4 = qword_102419548;
      if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
      {
        int v7 = 68289026;
        int v8 = 0;
        __int16 v9 = 2082;
        v10 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"enabling motion alarm\"}", (uint8_t *)&v7, 0x12u);
      }
      [(CLTimer *)[(CLRemoteMotionAlarm *)self resendTimer] setFireInterval:30.0];
      [(CLTimer *)[(CLRemoteMotionAlarm *)self resendTimer] setNextFireDelay:30.0];
LABEL_15:
      [(CLRemoteMotionAlarm *)self sendMotionAlarmRequest];
      return;
    }
  }
  if (![(NSMutableSet *)[(CLRemoteMotionAlarm *)self motionAlarmClients] count])
  {
    [(CLTimer *)[(CLRemoteMotionAlarm *)self resendTimer] nextFireDelay];
    if (v5 != 1.79769313e308)
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022F96D0);
      }
      v6 = qword_102419548;
      if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
      {
        int v7 = 68289026;
        int v8 = 0;
        __int16 v9 = 2082;
        v10 = "";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"disabling motion alarm\"}", (uint8_t *)&v7, 0x12u);
      }
      [(CLTimer *)[(CLRemoteMotionAlarm *)self resendTimer] setNextFireDelay:1.79769313e308];
      [(CLTimer *)[(CLRemoteMotionAlarm *)self resendTimer] setFireInterval:1.79769313e308];
      [(CLTimer *)[(CLRemoteMotionAlarm *)self revertToUnknownTimer] setNextFireDelay:1.79769313e308];
      [(CLRemoteMotionAlarm *)self setLastKnownMotionState:0];
      goto LABEL_15;
    }
  }
}

- (void)delayRevertToUnknownTimer
{
  v2 = [(CLRemoteMotionAlarm *)self revertToUnknownTimer];

  [(CLTimer *)v2 setNextFireDelay:60.0];
}

- (void)sendMotionAlarmRequest
{
  double v3 = objc_alloc_init(CLLocationStreamingMessage);
  [(CLLocationStreamingMessage *)v3 setMessageType:@"kCLLocationStreamingMessageTypeSetMotionAlarm"];
  CFStringRef v6 = @"kCLLocationStreamingMessageMotionAlarmStateKey";
  int v7 = +[NSNumber numberWithBool:[(NSMutableSet *)[(CLRemoteMotionAlarm *)self motionAlarmClients] count] != 0];
  [(CLLocationStreamingMessage *)v3 setPayload:+[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1]];
  [(CLLocationStreamingMessage *)v3 setPriority:300];
  v4[0] = IDSSendMessageOptionTimeoutKey;
  v5[0] = +[NSNumber numberWithDouble:30.0];
  v5[1] = &__kCFBooleanTrue;
  v4[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v4[2] = IDSSendMessageOptionEncryptPayloadKey;
  v5[2] = &__kCFBooleanTrue;
  v5[3] = &__kCFBooleanTrue;
  v4[3] = IDSSendMessageOptionRequireBluetoothKey;
  v4[4] = IDSSendMessageOptionQueueOneIdentifierKey;
  v5[4] = @"kCLLocationStreamingMessageTypeSetMotionAlarm";
  [(CLLocationStreamingMessage *)v3 setIdsOptions:+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5]];
  [(CLLocationStreamingMessage *)v3 setProtocolVersion:0];
  [(CLLocationStreamingConnectionManagerServiceProtocol *)[(CLRemoteMotionAlarm *)self streamingConnection] sendMessage:v3];
}

- (void)registerClientForRemoteMotionAlarm:(id)a3
{
  if (([(NSMutableSet *)[(CLRemoteMotionAlarm *)self motionAlarmClients] containsObject:a3] & 1) == 0)
  {
    [(NSMutableSet *)[(CLRemoteMotionAlarm *)self motionAlarmClients] addObject:a3];
    [(CLRemoteMotionAlarm *)self evaluateMotionAlarmState];
    uint64_t v5 = [(CLRemoteMotionAlarm *)self lastKnownMotionState];
    double Current = CFAbsoluteTimeGetCurrent();
    [a3 remoteDeviceMotionUpdate:v5 atTime:Current];
  }
}

- (void)unregisterClientForRemoteMotionAlarm:(id)a3
{
  [(NSMutableSet *)[(CLRemoteMotionAlarm *)self motionAlarmClients] removeObject:a3];

  [(CLRemoteMotionAlarm *)self evaluateMotionAlarmState];
}

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
  if ([a3 isEqual:@"kCLLocationStreamingMessageTypeMotionAlarmUpdate"])
  {
    id v7 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageInMotionKey"];
    if (v7)
    {
      if ([v7 BOOLValue]) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = 2;
      }
      [(CLRemoteMotionAlarm *)self setLastKnownMotionState:v8];
      [(CLRemoteMotionAlarm *)self delayRevertToUnknownTimer];
    }
    else
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022F96D0);
      }
      __int16 v9 = qword_102419548;
      if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
      {
        int v11 = 68289026;
        int v12 = 0;
        __int16 v13 = 2082;
        long long v14 = "";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Motion alarm update without any state\"}", (uint8_t *)&v11, 0x12u);
        if (qword_102419540 != -1) {
          dispatch_once(&qword_102419540, &stru_1022F96D0);
        }
      }
      v10 = qword_102419548;
      if (os_signpost_enabled((os_log_t)qword_102419548))
      {
        int v11 = 68289026;
        int v12 = 0;
        __int16 v13 = 2082;
        long long v14 = "";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Motion alarm update without any state", "{\"msg%{public}.0s\":\"Motion alarm update without any state\"}", (uint8_t *)&v11, 0x12u);
      }
      [(CLRemoteMotionAlarm *)self setLastKnownMotionState:0];
    }
  }
  else if ([a3 isEqual:@"kCLLocationStreamingMessageTypeAliveAgain"])
  {
    [(CLRemoteMotionAlarm *)self sendMotionAlarmRequest];
  }
}

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  if (!a3) {
    [(CLRemoteMotionAlarm *)self setLastKnownMotionState:0];
  }
}

- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection
{
  return self->_streamingConnection;
}

- (void)setStreamingConnection:(id)a3
{
}

- (NSMutableSet)motionAlarmClients
{
  return self->_motionAlarmClients;
}

- (void)setMotionAlarmClients:(id)a3
{
}

- (int)lastKnownMotionState
{
  return self->_lastKnownMotionState;
}

- (CLTimer)resendTimer
{
  return self->_resendTimer;
}

- (void)setResendTimer:(id)a3
{
}

- (CLTimer)revertToUnknownTimer
{
  return self->_revertToUnknownTimer;
}

- (void)setRevertToUnknownTimer:(id)a3
{
}

@end