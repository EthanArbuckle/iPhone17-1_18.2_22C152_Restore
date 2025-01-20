@interface CLLocationMulticlientStreamer
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)emergencyEnablementAssertionActive;
- (BOOL)isClientActivityTypeAirborneActive;
- (BOOL)isClientActivityTypeFitnessActive;
- (CLLocationMulticlientStreamer)init;
- (NSMutableSet)activeStreamingClients;
- (RPCompanionLinkClient)rapportDiscoveryLink;
- (RPCompanionLinkClient)rapportStreamingLink;
- (id).cxx_construct;
- (int)currentGranularity;
- (void)activateRapportLinkIfNecessary;
- (void)beginService;
- (void)endService;
- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4;
- (void)registerRequestHandlers;
- (void)setActiveStreamingClients:(id)a3;
- (void)setClientActivityTypeAirborneActive:(BOOL)a3;
- (void)setClientActivityTypeFitnessActive:(BOOL)a3;
- (void)setCurrentGranularity:(int)a3;
- (void)setEmergencyEnablementAssertionActive:(BOOL)a3;
- (void)setRapportDiscoveryLink:(id)a3;
- (void)setRapportStreamingLink:(id)a3;
- (void)stopLocation;
- (void)toggleLocationUpdates:(BOOL)a3 inFitnessSession:(BOOL)a4 inAirborneSession:(BOOL)a5 emergencyEnablementAssertionActive:(BOOL)a6;
@end

@implementation CLLocationMulticlientStreamer

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
  if (qword_102487CF8 != -1) {
    dispatch_once(&qword_102487CF8, &stru_102327FF8);
  }
  return (id)qword_102487CF0;
}

+ (BOOL)isSupported
{
  if (qword_102487D08 != -1) {
    dispatch_once(&qword_102487D08, &stru_102328018);
  }
  return byte_102487D00;
}

- (CLLocationMulticlientStreamer)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationMulticlientStreamer;
  return [(CLLocationMulticlientStreamer *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLLocationMulticlientStreamerServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLLocationMulticlientStreamerClientProtocol];
}

- (void)beginService
{
  [self universe].silo
  [(CLLocationMulticlientStreamer *)self setCurrentGranularity:0];
  [self universe] silo
  objc_super v3 = _NSConcreteStackBlock;
  uint64_t v4 = 3221225472;
  unint64_t v5 = sub_101484FC0;
  v6 = &unk_10229FED8;
  v7 = self;
  operator new();
}

- (void)endService
{
  [self universe].silo
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  sub_100884E1C((uint64_t **)&self->_locationAssertion, 0);
  [(RPCompanionLinkClient *)[(CLLocationMulticlientStreamer *)self rapportStreamingLink] invalidate];
  [(CLLocationMulticlientStreamer *)self setRapportStreamingLink:0];
  [(RPCompanionLinkClient *)[(CLLocationMulticlientStreamer *)self rapportDiscoveryLink] invalidate];

  [(CLLocationMulticlientStreamer *)self setRapportDiscoveryLink:0];
}

- (void)setEmergencyEnablementAssertionActive:(BOOL)a3
{
  if (self->_emergencyEnablementAssertionActive != a3)
  {
    BOOL v3 = a3;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1023280C0);
    }
    unint64_t v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289282;
      v6[1] = 0;
      __int16 v7 = 2082;
      v8 = "";
      __int16 v9 = 1026;
      BOOL v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient #CLEEA change\", \"needed\":%{public}hhd}", (uint8_t *)v6, 0x18u);
    }
    [objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "vendor") proxyForService:@"CLClientManager"] markClientEmergencyEnablementTransition:v3;
    self->_emergencyEnablementAssertionActive = v3;
  }
}

- (void)setClientActivityTypeFitnessActive:(BOOL)a3
{
  if (self->_clientActivityTypeFitnessActive != a3)
  {
    BOOL v3 = a3;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1023280C0);
    }
    unint64_t v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient Setting fitness activity type\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
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
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1023280C0);
    }
    unint64_t v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289282;
      v9[1] = 0;
      __int16 v10 = 2082;
      v11 = "";
      __int16 v12 = 1026;
      BOOL v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient Setting airborne activity type\", \"state\":%{public}hhd}", (uint8_t *)v9, 0x18u);
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

- (void)toggleLocationUpdates:(BOOL)a3 inFitnessSession:(BOOL)a4 inAirborneSession:(BOOL)a5 emergencyEnablementAssertionActive:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  [self universe].silo
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1023280C0);
  }
  v11 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68290050;
    v12[1] = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 1026;
    BOOL v16 = v9;
    __int16 v17 = 1026;
    BOOL v18 = v8;
    __int16 v19 = 1026;
    BOOL v20 = v7;
    __int16 v21 = 1026;
    BOOL v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient toggling streaming\", \"state\":%{public}hhd, \"fitness\":%{public}hhd, \"airborne\":%{public}hhd, \"emergency\":%{public}hhd}", (uint8_t *)v12, 0x2Au);
  }
  if (v9)
  {
    [(CLLocationMulticlientStreamer *)self setClientActivityTypeFitnessActive:[(CLLocationMulticlientStreamer *)self isClientActivityTypeFitnessActive] | v8];
    [(CLLocationMulticlientStreamer *)self setClientActivityTypeAirborneActive:[(CLLocationMulticlientStreamer *)self isClientActivityTypeAirborneActive] | v7];
    [(CLLocationMulticlientStreamer *)self setEmergencyEnablementAssertionActive:[(CLLocationMulticlientStreamer *)self emergencyEnablementAssertionActive] | v6];
    if (!-[NSMutableSet count](-[CLLocationMulticlientStreamer activeStreamingClients](self, "activeStreamingClients"), "count"))[*((id *)self->_locationClient.__ptr_.__value_ + 2) register:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0]; {
  }
    }
  else
  {
    [(CLLocationMulticlientStreamer *)self stopLocation];
  }
}

- (void)onLocationNotification:(const int *)a3 withData:(const void *)a4
{
  [self universe].silo
  if (*a3 > 2u)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1023280C0);
    }
    __int16 v10 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = *a3;
      uint64_t buf = 68289282;
      __int16 v29 = 2082;
      v30 = "";
      __int16 v31 = 2050;
      uint64_t v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#Multiclient Unexpected notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld}", (uint8_t *)&buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1023280C0);
      }
    }
    __int16 v12 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      uint64_t v13 = *a3;
      uint64_t buf = 68289282;
      __int16 v29 = 2082;
      v30 = "";
      __int16 v31 = 2050;
      uint64_t v32 = v13;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#Multiclient Unexpected notification", "{\"msg%{public}.0s\":\"#Multiclient Unexpected notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else if ([(NSMutableSet *)[(CLLocationMulticlientStreamer *)self activeStreamingClients] count])
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
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1023280C0);
      }
      BOOL v22 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)((char *)a4 + 76);
        uint64_t v24 = *((void *)a4 + 11);
        uint64_t buf = 68289538;
        __int16 v29 = 2082;
        v30 = "";
        __int16 v31 = 2050;
        uint64_t v32 = v23;
        __int16 v33 = 2050;
        uint64_t v34 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient Dropping location due to expiration\", \"timestamp\":\"%{public}f\", \"lifespan\":\"%{public}f\"}", (uint8_t *)&buf, 0x26u);
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
      [v20 setObject:-[CLStreamedLocationPrivate data](-[CLStreamedLocationPrivate initWithDaemonLocationPrivate:]([CLStreamedLocationPrivate alloc], "initWithDaemonLocationPrivate:", (char *)a4 + 160), "data") forKeyedSubscript:@"kCLLocationStreamingMessageLocationPrivateKey"];
      [v20 setObject:[-[CLStreamedLocationInternal data](-[CLStreamedLocationInternal initWithDaemonLocation:]([CLStreamedLocationInternal alloc], "initWithDaemonLocation:", a4), "data")] forKeyedSubscript:@"kCLLocationStreamingMessageLocationInternalKey"];
      __int16 v21 = [(CLLocationMulticlientStreamer *)self rapportStreamingLink];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_101485AD4;
      v25[3] = &unk_1022B8750;
      v25[4] = self;
      [(RPCompanionLinkClient *)v21 sendEventID:@"com.apple.locationd.rapport.stream-event" event:v20 destinationID:RPDestinationIdentifierInterestedPeers options:0 completion:v25];
    }
  }
}

- (void)registerRequestHandlers
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1023280C0);
  }
  BOOL v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    int v14 = 0;
    __int16 v15 = 2082;
    long long v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Multiclient registering request handlers\"}", buf, 0x12u);
  }
  rapportDiscoveryLink = self->_rapportDiscoveryLink;
  uint64_t v5 = RPOptionStatusFlags;
  uint64_t v11 = RPOptionStatusFlags;
  __int16 v12 = +[NSNumber numberWithUnsignedLongLong:532482];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101485F58;
  v8[3] = &unk_102328040;
  v8[4] = self;
  [(RPCompanionLinkClient *)rapportDiscoveryLink registerRequestID:@"com.apple.locationd.rapport.availability-interest" options:+[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1] handler:v8];
  BOOL v6 = self->_rapportDiscoveryLink;
  v9[1] = v5;
  v10[0] = &__kCFBooleanTrue;
  v9[0] = RPOptionInterest;
  v10[1] = +[NSNumber numberWithUnsignedLongLong:532482];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10148616C;
  v7[3] = &unk_102328040;
  v7[4] = self;
  [(RPCompanionLinkClient *)v6 registerRequestID:@"com.apple.locationd.rapport.stream-request" options:+[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2] handler:v7];
}

- (void)activateRapportLinkIfNecessary
{
  if (!self->_rapportDiscoveryLink)
  {
    self->_rapportDiscoveryLink = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    -[RPCompanionLinkClient setDispatchQueue:](self->_rapportDiscoveryLink, "setDispatchQueue:", [objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo") queue]);
    [(RPCompanionLinkClient *)self->_rapportDiscoveryLink setControlFlags:2];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1014866F0;
    v4[3] = &unk_1022B8778;
    v4[4] = self;
    [(RPCompanionLinkClient *)self->_rapportDiscoveryLink setDeviceLostHandler:v4];
    [(RPCompanionLinkClient *)self->_rapportDiscoveryLink setDeviceFoundHandler:&stru_102328060];
    [(CLLocationMulticlientStreamer *)self registerRequestHandlers];
    [(RPCompanionLinkClient *)self->_rapportDiscoveryLink activateWithCompletion:&stru_102328080];
  }
  if (![(CLLocationMulticlientStreamer *)self rapportStreamingLink])
  {
    BOOL v3 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    self->_rapportStreamingLink = v3;
    if (v3)
    {
      -[RPCompanionLinkClient setDispatchQueue:](self->_rapportStreamingLink, "setDispatchQueue:", [objc_msgSend(-[CLLocationMulticlientStreamer universe](self, "universe"), "silo") queue]);
      [(RPCompanionLinkClient *)self->_rapportStreamingLink setControlFlags:2];
      [(RPCompanionLinkClient *)[(CLLocationMulticlientStreamer *)self rapportStreamingLink] activateWithCompletion:&stru_1023280A0];
    }
  }
}

- (void)stopLocation
{
  [self universe].silo
  [*((id *)self->_locationClient.__ptr_.__value_ + 2) unregister:*((void *)self->_locationClient.__ptr_.__value_ + 1) forNotification:0];
  [(NSMutableSet *)[(CLLocationMulticlientStreamer *)self activeStreamingClients] removeAllObjects];
  [(CLLocationMulticlientStreamer *)self setEmergencyEnablementAssertionActive:0];
  [(CLLocationMulticlientStreamer *)self setCurrentGranularity:0];
  [(CLLocationMulticlientStreamer *)self setClientActivityTypeFitnessActive:0];
  [(CLLocationMulticlientStreamer *)self setClientActivityTypeAirborneActive:0];
  value = self->_locationAssertion.__ptr_.__value_;
  [*((id *)value + 1) setNextFireDelay:1.79769313e308];
  uint64_t v4 = *(void *)value;
  *(void *)value = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1023280C0);
  }
  uint64_t v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    __int16 v7 = 2082;
    double v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Multiclient Shut down location streaming\"}", (uint8_t *)v6, 0x12u);
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

- (BOOL)isClientActivityTypeFitnessActive
{
  return self->_clientActivityTypeFitnessActive;
}

- (BOOL)isClientActivityTypeAirborneActive
{
  return self->_clientActivityTypeAirborneActive;
}

- (BOOL)emergencyEnablementAssertionActive
{
  return self->_emergencyEnablementAssertionActive;
}

- (RPCompanionLinkClient)rapportDiscoveryLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRapportDiscoveryLink:(id)a3
{
}

- (NSMutableSet)activeStreamingClients
{
  return self->_activeStreamingClients;
}

- (void)setActiveStreamingClients:(id)a3
{
}

- (RPCompanionLinkClient)rapportStreamingLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRapportStreamingLink:(id)a3
{
}

- (void).cxx_destruct
{
  sub_100884E1C((uint64_t **)&self->_locationAssertion, 0);
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end