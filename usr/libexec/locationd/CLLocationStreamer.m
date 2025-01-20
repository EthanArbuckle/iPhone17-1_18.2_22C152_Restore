@interface CLLocationStreamer
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)emergencyEnablementAssertionActive;
- (BOOL)isClientActivityTypeAirborneActive;
- (BOOL)isClientActivityTypeFitnessActive;
- (BOOL)isClientMapMatchingActive;
- (BOOL)isSubscribedForMotion;
- (BOOL)locationUpdatesIncludeMotionState;
- (BOOL)motionAlarmActive;
- (CLLocationStreamer)init;
- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection;
- (CLTimer)aliveAgainThrottleTimer;
- (CLTimer)resendMotionStateTimer;
- (id).cxx_construct;
- (int)currentGranularity;
- (void)beginService;
- (void)endService;
- (void)failedToSendMessage:(id)a3 withError:(id)a4 isFatal:(BOOL)a5;
- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4;
- (void)onMotionStateNotification:(const int *)a3 withData:(const NotificationData *)a4;
- (void)pairedDeviceIsNearby:(BOOL)a3;
- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4;
- (void)reevaluateMotionSubscription;
- (void)sendAliveAgainMessage;
- (void)sendMotionState;
- (void)setAliveAgainThrottleTimer:(id)a3;
- (void)setClientActivityTypeAirborneActive:(BOOL)a3;
- (void)setClientActivityTypeFitnessActive:(BOOL)a3;
- (void)setClientMapMatchingActive:(BOOL)a3;
- (void)setCurrentGranularity:(int)a3;
- (void)setEmergencyEnablementAssertionActive:(BOOL)a3;
- (void)setIsSubscribedForMotion:(BOOL)a3;
- (void)setLocationUpdatesIncludeMotionState:(BOOL)a3;
- (void)setMotionAlarmActive:(BOOL)a3;
- (void)setResendMotionStateTimer:(id)a3;
- (void)setStreamingConnection:(id)a3;
- (void)startMotionAlarm;
- (void)startUpdatingLocationWithGranularity:(int)a3 includeMotion:(BOOL)a4 inFitnessSession:(BOOL)a5 inAirborneSession:(BOOL)a6 emergencyEnablementAssertionActive:(BOOL)a7 hasMapMatching:(BOOL)a8;
- (void)stopLocation;
- (void)stopMotionAlarm;
- (void)successfullySentMessage:(id)a3;
- (void)unregisterAllLocationNotifications;
@end

@implementation CLLocationStreamer

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
  if (qword_10247E6C0 != -1) {
    dispatch_once(&qword_10247E6C0, &stru_1022CE358);
  }
  return (id)qword_10247E6B8;
}

+ (BOOL)isSupported
{
  if (qword_10247E6D0 != -1) {
    dispatch_once(&qword_10247E6D0, &stru_1022CE378);
  }
  return byte_10247E6C8;
}

- (CLLocationStreamer)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationStreamer;
  return [(CLLocationStreamer *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLLocationStreamerServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLLocationStreamerClientProtocol];
}

- (void)beginService
{
  [self universe].silo
  [(CLLocationStreamer *)self setCurrentGranularity:0];
  [self universe].silo
  objc_super v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  unint64_t v5 = sub_1008849FC;
  v6 = &unk_10229FED8;
  v7 = self;
  operator new();
}

- (void)endService
{
  [(-[CLLocationStreamer universe](self, "universe")) silo];
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  sub_100884E1C((uint64_t **)&self->_locationAssertion, 0);
  sub_100884E1C((uint64_t **)&self->_motionAlarmAssertion, 0);
  uint64_t v4 = self->_lastMotionActivity.__ptr_.__value_;
  self->_lastMotionActivity.__ptr_.__value_ = 0;
  if (v4) {
    operator delete();
  }
  [(CLTimer *)[(CLLocationStreamer *)self resendMotionStateTimer] invalidate];
  [(CLLocationStreamer *)self setResendMotionStateTimer:0];
  [(CLLocationStreamingConnectionManagerServiceProtocol *)[(CLLocationStreamer *)self streamingConnection] retireClient:self];
  [(CLLocationStreamer *)self setStreamingConnection:0];
  [(CLTimer *)[(CLLocationStreamer *)self aliveAgainThrottleTimer] invalidate];

  [(CLLocationStreamer *)self setAliveAgainThrottleTimer:0];
}

- (void)sendAliveAgainMessage
{
  uint64_t v3 = sub_1000A6958();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  sub_10016332C(v3, "kCLLocationStreamerLastAliveAgainMessageTimestamp", &Current);
  uint64_t v4 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v4 + 944))();
  unint64_t v5 = objc_alloc_init(CLLocationStreamingMessage);
  [(CLLocationStreamingMessage *)v5 setMessageType:@"kCLLocationStreamingMessageTypeAliveAgain"];
  [(CLLocationStreamingMessage *)v5 setPriority:300];
  v8[0] = IDSSendMessageOptionTimeoutKey;
  v6 = +[NSNumber numberWithDouble:30.0];
  v8[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v8[2] = IDSSendMessageOptionEncryptPayloadKey;
  v9[0] = v6;
  v9[1] = &__kCFBooleanTrue;
  v9[2] = &__kCFBooleanTrue;
  v9[3] = &__kCFBooleanTrue;
  v8[3] = IDSSendMessageOptionRequireBluetoothKey;
  v8[4] = IDSSendMessageOptionQueueOneIdentifierKey;
  v9[4] = @"kCLLocationStreamingMessageTypeAliveAgain";
  [(CLLocationStreamingMessage *)v5 setIdsOptions:+[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5]];
  [(CLLocationStreamingConnectionManagerServiceProtocol *)[(CLLocationStreamer *)self streamingConnection] sendMessage:v5];
}

- (void)unregisterAllLocationNotifications
{
  [self universe].silo
  [*((id *)self->_locationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:0];
  [*((id *)self->_locationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:1];
  value = self->_locationClient.__ptr_.__value_;
  uint64_t v5 = *((void *)value + 1);
  uint64_t v4 = (void *)*((void *)value + 2);

  [v4 unregister:v5 forNotification:2];
}

- (void)stopLocation
{
  [universe silo];
  [(CLLocationStreamer *)self unregisterAllLocationNotifications];
  [(CLLocationStreamer *)self setEmergencyEnablementAssertionActive:0];
  [(CLLocationStreamer *)self setCurrentGranularity:0];
  [(CLLocationStreamer *)self setLocationUpdatesIncludeMotionState:0];
  [(CLLocationStreamer *)self reevaluateMotionSubscription];
  [(CLLocationStreamer *)self setClientActivityTypeFitnessActive:0];
  [(CLLocationStreamer *)self setClientActivityTypeAirborneActive:0];
  [(CLLocationStreamer *)self setClientMapMatchingActive:0];
  value = self->_locationAssertion.__ptr_.__value_;
  [*((id *)value + 1) setNextFireDelay:1.79769313e308];
  uint64_t v4 = *(void *)value;
  *(void *)value = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  uint64_t v5 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Shut down location streaming\"}", (uint8_t *)v6, 0x12u);
  }
}

- (void)setEmergencyEnablementAssertionActive:(BOOL)a3
{
  if (self->_emergencyEnablementAssertionActive != a3)
  {
    BOOL v3 = a3;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
    uint64_t v5 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289282;
      v6[1] = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 1026;
      BOOL v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLEEA change\", \"needed\":%{public}hhd}", (uint8_t *)v6, 0x18u);
    }
    [objc_msgSend(-[CLLocationStreamer universe](self, "universe"), "vendor") proxyForService:@"CLClientManager"] markClientEmergencyEnablementTransition:v3];
    self->_emergencyEnablementAssertionActive = v3;
  }
}

- (void)setClientMapMatchingActive:(BOOL)a3
{
  if (self->_clientMapMatchingActive != a3)
  {
    BOOL v3 = a3;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
    uint64_t v5 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLMM Setting client map matching\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
    }
    self->_clientMapMatchingActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 1);
    __int16 v7 = (void *)*((void *)value + 2);
    if (v3) {
      [v7 register:v8 forNotification:17 registrationInfo:0];
    }
    else {
      [v7 unregister:v8 forNotification:17];
    }
  }
}

- (void)setClientActivityTypeFitnessActive:(BOOL)a3
{
  if (self->_clientActivityTypeFitnessActive != a3)
  {
    BOOL v3 = a3;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
    uint64_t v5 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Setting fitness activity type\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
    }
    self->_clientActivityTypeFitnessActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 1);
    __int16 v7 = (void *)*((void *)value + 2);
    if (v3) {
      [v7 register:v8 forNotification:28 registrationInfo:0];
    }
    else {
      [v7 unregister:v8 forNotification:28];
    }
  }
}

- (void)setClientActivityTypeAirborneActive:(BOOL)a3
{
  if (self->_clientActivityTypeAirborneActive != a3)
  {
    BOOL v3 = a3;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
    uint64_t v5 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Setting airborne activity type\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
    }
    self->_clientActivityTypeAirborneActive = v3;
    value = self->_locationClient.__ptr_.__value_;
    uint64_t v8 = *((void *)value + 1);
    __int16 v7 = (void *)*((void *)value + 2);
    if (v3) {
      [v7 register:v8 forNotification:29 registrationInfo:0];
    }
    else {
      [v7 unregister:v8 forNotification:29];
    }
  }
}

- (void)startUpdatingLocationWithGranularity:(int)a3 includeMotion:(BOOL)a4 inFitnessSession:(BOOL)a5 inAirborneSession:(BOOL)a6 emergencyEnablementAssertionActive:(BOOL)a7 hasMapMatching:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  uint64_t v13 = *(void *)&a3;
  [self universe].silo
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  v15 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
  {
    [(CLLocationStreamer *)self currentGranularity];
    int v19 = 68289538;
    int v20 = 0;
    __int16 v21 = 2082;
    v22 = "";
    __int16 v23 = 2050;
    uint64_t v24 = v13;
    __int16 v25 = 2050;
    uint64_t v26 = [(CLLocationStreamer *)self currentGranularity];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Starting\", \"new granularity\":%{public, location:CLLocationStreamingGranularity}lld, \"current granularity\":%{public, location:CLLocationStreamingGranularity}lld}", (uint8_t *)&v19, 0x26u);
  }
  if (v13)
  {
    [(CLLocationStreamer *)self setLocationUpdatesIncludeMotionState:v12];
    [(CLLocationStreamer *)self reevaluateMotionSubscription];
    [(CLLocationStreamer *)self setClientActivityTypeFitnessActive:v11];
    [(CLLocationStreamer *)self setClientActivityTypeAirborneActive:v10];
    [(CLLocationStreamer *)self setEmergencyEnablementAssertionActive:v9];
    [(CLLocationStreamer *)self setClientMapMatchingActive:v8];
    if ([(CLLocationStreamer *)self currentGranularity] == v13) {
      goto LABEL_9;
    }
    [(CLLocationStreamer *)self unregisterAllLocationNotifications];
    if (v13 < 4)
    {
      [*((id *)self->_locationClient.__ptr_.__value_ + 2) register:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:(3 - v13) registrationInfo:0];
      [(CLLocationStreamer *)self setCurrentGranularity:v13];
LABEL_9:
      sub_1008859E8((uint64_t)self->_locationAssertion.__ptr_.__value_);
    }
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
    v16 = qword_102419548;
    uint64_t v17 = v13;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
    {
      int v19 = 68289282;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2050;
      uint64_t v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected granularity\", \"granularity\":%{public, location:CLLocationStreamingGranularity}lld}", (uint8_t *)&v19, 0x1Cu);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022CE398);
      }
    }
    v18 = qword_102419548;
    if (os_signpost_enabled((os_log_t)qword_102419548))
    {
      int v19 = 68289282;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2050;
      uint64_t v24 = v17;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unexpected granularity", "{\"msg%{public}.0s\":\"Unexpected granularity\", \"granularity\":%{public, location:CLLocationStreamingGranularity}lld}", (uint8_t *)&v19, 0x1Cu);
    }
  }
  else
  {
    [(CLLocationStreamer *)self stopLocation];
  }
}

- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4
{
  [self universe].silo
  if (*a3 > 2u)
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
    BOOL v10 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *a3;
      uint64_t buf = 68289282;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2050;
      uint64_t v34 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld}", (uint8_t *)&buf, 0x1Cu);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022CE398);
      }
    }
    BOOL v12 = qword_102419548;
    if (os_signpost_enabled((os_log_t)qword_102419548))
    {
      uint64_t v13 = *a3;
      uint64_t buf = 68289282;
      __int16 v31 = 2082;
      v32 = "";
      __int16 v33 = 2050;
      uint64_t v34 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unexpected notification", "{\"msg%{public}.0s\":\"Unexpected notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else
  {
    double v7 = *((double *)a4 + 11);
    if (v7 <= 0.0)
    {
      double v9 = 15.0;
    }
    else
    {
      double v8 = v7 + *(double *)((char *)a4 + 76);
      double v9 = v8 - CFAbsoluteTimeGetCurrent();
    }
    if (v9 <= 0.0)
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022CE398);
      }
      __int16 v23 = qword_102419548;
      if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = *(void *)((char *)a4 + 76);
        uint64_t v25 = *((void *)a4 + 11);
        uint64_t buf = 68289538;
        __int16 v31 = 2082;
        v32 = "";
        __int16 v33 = 2050;
        uint64_t v34 = v24;
        __int16 v35 = 2050;
        uint64_t v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Dropping location due to expiration\", \"timestamp\":\"%{public}f\", \"lifespan\":\"%{public}f\"}", (uint8_t *)&buf, 0x26u);
      }
    }
    else
    {
      id v14 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
      id v15 = objc_alloc((Class)CLLocation);
      long long v16 = *((_OWORD *)a4 + 7);
      v26[6] = *((_OWORD *)a4 + 6);
      v26[7] = v16;
      v27[0] = *((_OWORD *)a4 + 8);
      *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)((char *)a4 + 140);
      long long v17 = *((_OWORD *)a4 + 3);
      v26[2] = *((_OWORD *)a4 + 2);
      v26[3] = v17;
      long long v18 = *((_OWORD *)a4 + 5);
      v26[4] = *((_OWORD *)a4 + 4);
      v26[5] = v18;
      long long v19 = *((_OWORD *)a4 + 1);
      v26[0] = *(_OWORD *)a4;
      v26[1] = v19;
      [v14 encodeObject:[v15 initWithClientLocation:v26] forKey:@"kCLLocationStreamingMessageLocationKey"];
      id v20 = objc_alloc_init((Class)NSMutableDictionary);
      [v20 setObject:objc_msgSend(v14, "encodedData") forKeyedSubscript:@"kCLLocationStreamingMessageLocationKey"];
      if ([(CLLocationStreamer *)self locationUpdatesIncludeMotionState])
      {
        value = self->_lastMotionActivity.__ptr_.__value_;
        if (value) {
          [v20 setObject:+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", CLMotionActivity::isMoving(value)) forKeyedSubscript:@"kCLLocationStreamingMessageInMotionKey"];
        }
      }
      [v20 setObject:-[CLStreamedLocationPrivate data](-[CLStreamedLocationPrivate initWithDaemonLocationPrivate:]([CLStreamedLocationPrivate alloc], "initWithDaemonLocationPrivate:", (char *)a4 + 160), "data") forKeyedSubscript:@"kCLLocationStreamingMessageLocationPrivateKey"];
      [v20 setObject:[-[CLStreamedLocationInternal data](-[CLStreamedLocationInternal initWithDaemonLocation:]([CLStreamedLocationInternal alloc], "initWithDaemonLocation:", a4), "data")] forKeyedSubscript:@"kCLLocationStreamingMessageLocationInternalKey"];
      v22 = objc_alloc_init(CLLocationStreamingMessage);
      [(CLLocationStreamingMessage *)v22 setMessageType:@"kCLLocationStreamingMessageTypeLocation"];
      [(CLLocationStreamingMessage *)v22 setPayload:v20];
      [(CLLocationStreamingMessage *)v22 setPriority:300];
      v28[0] = IDSSendMessageOptionTimeoutKey;
      v29[0] = +[NSNumber numberWithDouble:v9];
      v29[1] = &__kCFBooleanTrue;
      v28[1] = IDSSendMessageOptionForceLocalDeliveryKey;
      v28[2] = IDSSendMessageOptionEncryptPayloadKey;
      v28[3] = IDSSendMessageOptionRequireBluetoothKey;
      v29[2] = &__kCFBooleanTrue;
      v29[3] = &__kCFBooleanTrue;
      [(CLLocationStreamingMessage *)v22 setIdsOptions:+[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4]];
      [(CLLocationStreamingConnectionManagerServiceProtocol *)[(CLLocationStreamer *)self streamingConnection] sendMessage:v22];
    }
  }
}

- (void)reevaluateMotionSubscription
{
  if ([(CLLocationStreamer *)self motionAlarmActive]
    || [(CLLocationStreamer *)self locationUpdatesIncludeMotionState])
  {
    if (![(CLLocationStreamer *)self isSubscribedForMotion])
    {
      [*((id *)self->_motionStateClient.__ptr_.__value_ + 2) register:*((void *)self->_motionStateClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
      [(CLLocationStreamer *)self setIsSubscribedForMotion:1];
    }
  }
  else if ([(CLLocationStreamer *)self isSubscribedForMotion])
  {
    [*((id *)self->_motionStateClient.__ptr_.__value_ + 2) unregister:*((void *)self->_motionStateClient.__ptr_.__value_ + 1) forNotification:0];
    value = self->_lastMotionActivity.__ptr_.__value_;
    self->_lastMotionActivity.__ptr_.__value_ = 0;
    if (value) {
      operator delete();
    }
    [(CLLocationStreamer *)self setIsSubscribedForMotion:0];
    [(CLTimer *)[(CLLocationStreamer *)self resendMotionStateTimer] setNextFireDelay:1.79769313e308];
  }
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  uint64_t v4 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    double v7 = "";
    __int16 v8 = 1026;
    unsigned int v9 = [(CLLocationStreamer *)self isSubscribedForMotion];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Motion state subscription\", \"is subscribed\":%{public}d}", (uint8_t *)v5, 0x18u);
  }
}

- (void)startMotionAlarm
{
  [self.universe silo];
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  BOOL v3 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
  {
    v4[0] = 68289282;
    v4[1] = 0;
    __int16 v5 = 2082;
    __int16 v6 = "";
    __int16 v7 = 1026;
    unsigned int v8 = [(CLLocationStreamer *)self motionAlarmActive];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Start motion alarm\", \"currently active\":%{public}d}", (uint8_t *)v4, 0x18u);
  }
  sub_1008859E8((uint64_t)self->_motionAlarmAssertion.__ptr_.__value_);
}

- (void)stopMotionAlarm
{
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  BOOL v3 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    __int16 v7 = 2082;
    unsigned int v8 = "";
    __int16 v9 = 1026;
    unsigned int v10 = [(CLLocationStreamer *)self motionAlarmActive];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Stop motion alarm\", \"currently active\":%{public}d}", (uint8_t *)v6, 0x18u);
  }
  [(CLLocationStreamer *)self setMotionAlarmActive:0];
  [(CLLocationStreamer *)self reevaluateMotionSubscription];
  value = self->_motionAlarmAssertion.__ptr_.__value_;
  [*((id *)value + 1) setNextFireDelay:1.79769313e308];
  uint64_t v5 = *(void *)value;
  *(void *)value = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
}

- (void)sendMotionState
{
  uint64_t isMoving = CLMotionActivity::isMoving(self->_lastMotionActivity.__ptr_.__value_);
  uint64_t v4 = objc_alloc_init(CLLocationStreamingMessage);
  [(CLLocationStreamingMessage *)v4 setMessageType:@"kCLLocationStreamingMessageTypeMotionAlarmUpdate"];
  CFStringRef v8 = @"kCLLocationStreamingMessageInMotionKey";
  __int16 v9 = +[NSNumber numberWithBool:isMoving];
  [(CLLocationStreamingMessage *)v4 setPayload:+[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1]];
  [(CLLocationStreamingMessage *)v4 setPriority:300];
  v6[0] = IDSSendMessageOptionTimeoutKey;
  uint64_t v5 = +[NSNumber numberWithDouble:*(double *)&qword_10247E6D8];
  v6[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  _DWORD v6[2] = IDSSendMessageOptionEncryptPayloadKey;
  v7[0] = v5;
  v7[1] = &__kCFBooleanTrue;
  v6[3] = IDSSendMessageOptionRequireBluetoothKey;
  v7[2] = &__kCFBooleanTrue;
  v7[3] = &__kCFBooleanTrue;
  [(CLLocationStreamingMessage *)v4 setIdsOptions:+[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4]];
  [(CLLocationStreamingConnectionManagerServiceProtocol *)[(CLLocationStreamer *)self streamingConnection] sendMessage:v4];
}

- (void)onMotionStateNotification:(const int *)a3 withData:(const NotificationData *)a4
{
  if (!*a3)
  {
    if (self->_lastMotionActivity.__ptr_.__value_) {
      CLMotionActivity::isMoving(self->_lastMotionActivity.__ptr_.__value_);
    }
    operator new();
  }
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  CFStringRef v8 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
  {
    int v9 = *a3;
    *(_DWORD *)uint64_t buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v13[0] = 2082;
    *(void *)&v13[1] = "";
    __int16 v14 = 1026;
    int v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unexpected motion notification\", \"notification\":%{public}d}", buf, 0x18u);
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
  }
  unsigned int v10 = qword_102419548;
  if (os_signpost_enabled((os_log_t)qword_102419548))
  {
    int v11 = *a3;
    *(_DWORD *)uint64_t buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v13[0] = 2082;
    *(void *)&v13[1] = "";
    __int16 v14 = 1026;
    int v15 = v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unexpected motion notification", "{\"msg%{public}.0s\":\"Unexpected motion notification\", \"notification\":%{public}d}", buf, 0x18u);
  }
}

- (void)receivedMessageOfType:(id)a3 withPayload:(id)a4
{
  if ([a3 isEqual:@"kCLLocationStreamingMessageTypeRequestLocation"])
  {
    id v7 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageGranularityKey"];
    id v8 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageIncludeMotionKey"];
    id v9 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageInFitnessSessionKey"];
    id v10 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageActivityTypeAirborneKey"];
    id v11 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageEmergencyEnablementKey"];
    id v12 = [a4 objectForKeyedSubscript:@"kCLLocationStreamingMessageMapMatching"];
    if (v7)
    {
      uint64_t v13 = v12;
      [v7 intValue];
      [v8 BOOLValue];
      [v9 BOOLValue];
      [v10 BOOLValue];
      [v11 BOOLValue];
      [v13 BOOLValue];
      -[CLLocationStreamer startUpdatingLocationWithGranularity:includeMotion:inFitnessSession:inAirborneSession:emergencyEnablementAssertionActive:hasMapMatching:](self, "startUpdatingLocationWithGranularity:includeMotion:inFitnessSession:inAirborneSession:emergencyEnablementAssertionActive:hasMapMatching:");
    }
    else
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022CE398);
      }
      int v15 = qword_102419548;
      if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
      {
        int v18 = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2082;
        id v23 = [@"kCLLocationStreamingMessageGranularityKey" UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Missing data\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&v18, 0x1Cu);
        if (qword_102419540 != -1) {
          dispatch_once(&qword_102419540, &stru_1022CE398);
        }
      }
      long long v16 = qword_102419548;
      if (os_signpost_enabled((os_log_t)qword_102419548))
      {
        id v17 = [@"kCLLocationStreamingMessageGranularityKey" UTF8String];
        int v18 = 68289282;
        int v19 = 0;
        __int16 v20 = 2082;
        __int16 v21 = "";
        __int16 v22 = 2082;
        id v23 = v17;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Missing data", "{\"msg%{public}.0s\":\"Missing data\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&v18, 0x1Cu);
      }
    }
  }
  else if ([a3 isEqual:@"kCLLocationStreamingMessageTypeSetMotionAlarm"])
  {
    if (objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"kCLLocationStreamingMessageMotionAlarmStateKey"), "BOOLValue"))
    {
      [(CLLocationStreamer *)self startMotionAlarm];
    }
    else
    {
      [(CLLocationStreamer *)self stopMotionAlarm];
    }
  }
  else
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
    __int16 v14 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
    {
      int v18 = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      __int16 v21 = "";
      __int16 v22 = 2082;
      id v23 = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Unrecognized message type\", \"type\":%{public, location:escape_only}s}", (uint8_t *)&v18, 0x1Cu);
    }
  }
}

- (void)failedToSendMessage:(id)a3 withError:(id)a4 isFatal:(BOOL)a5
{
  BOOL v5 = a5;
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  id v8 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289794;
    v9[1] = 0;
    __int16 v10 = 2082;
    id v11 = "";
    __int16 v12 = 2082;
    id v13 = [[objc_msgSend(a3, "messageType") UTF8String];
    __int16 v14 = 2114;
    id v15 = a4;
    __int16 v16 = 1026;
    BOOL v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Message failed to send\", \"type\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@, \"fatal\":%{public}d}", (uint8_t *)v9, 0x2Cu);
  }
}

- (void)successfullySentMessage:(id)a3
{
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  uint64_t v4 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    __int16 v8 = 2082;
    id v9 = [[objc_msgSend(a3, "messageType") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Message sent\", \"type\":%{public, location:escape_only}s}", (uint8_t *)v5, 0x1Cu);
  }
}

- (void)pairedDeviceIsNearby:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022CE398);
  }
  BOOL v5 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 1026;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Nearby status change\", \"is nearby\":%{public}d}", (uint8_t *)&v7, 0x18u);
  }
  if (!v3)
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022CE398);
    }
    __int16 v6 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289026;
      int v8 = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Paired device has left us, stopping location\"}", (uint8_t *)&v7, 0x12u);
    }
    [(CLLocationStreamer *)self stopLocation];
  }
}

- (int)currentGranularity
{
  return self->_currentGranularity;
}

- (void)setCurrentGranularity:(int)a3
{
  self->_currentGranularity = a3;
}

- (BOOL)locationUpdatesIncludeMotionState
{
  return self->_locationUpdatesIncludeMotionState;
}

- (void)setLocationUpdatesIncludeMotionState:(BOOL)a3
{
  self->_locationUpdatesIncludeMotionState = a3;
}

- (BOOL)isClientActivityTypeFitnessActive
{
  return self->_clientActivityTypeFitnessActive;
}

- (BOOL)isClientActivityTypeAirborneActive
{
  return self->_clientActivityTypeAirborneActive;
}

- (BOOL)motionAlarmActive
{
  return self->_motionAlarmActive;
}

- (void)setMotionAlarmActive:(BOOL)a3
{
  self->_motionAlarmActive = a3;
}

- (BOOL)isSubscribedForMotion
{
  return self->_isSubscribedForMotion;
}

- (void)setIsSubscribedForMotion:(BOOL)a3
{
  self->_isSubscribedForMotion = a3;
}

- (CLTimer)resendMotionStateTimer
{
  return self->_resendMotionStateTimer;
}

- (void)setResendMotionStateTimer:(id)a3
{
}

- (BOOL)emergencyEnablementAssertionActive
{
  return self->_emergencyEnablementAssertionActive;
}

- (BOOL)isClientMapMatchingActive
{
  return self->_clientMapMatchingActive;
}

- (CLLocationStreamingConnectionManagerServiceProtocol)streamingConnection
{
  return self->_streamingConnection;
}

- (void)setStreamingConnection:(id)a3
{
}

- (CLTimer)aliveAgainThrottleTimer
{
  return self->_aliveAgainThrottleTimer;
}

- (void)setAliveAgainThrottleTimer:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_lastMotionActivity.__ptr_.__value_;
  self->_lastMotionActivity.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }
  sub_100884E1C((uint64_t **)&self->_motionAlarmAssertion, 0);
  uint64_t v4 = self->_motionStateClient.__ptr_.__value_;
  self->_motionStateClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
  }
  sub_100884E1C((uint64_t **)&self->_locationAssertion, 0);
  BOOL v5 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (v5)
  {
    __int16 v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end