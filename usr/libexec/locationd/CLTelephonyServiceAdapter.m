@interface CLTelephonyServiceAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetActiveCall:(BOOL *)a3;
- (BOOL)syncgetCampOnlyState;
- (BOOL)syncgetCopyServingOperator:(id *)a3;
- (BOOL)syncgetCopyServingProvider:(id *)a3;
- (BOOL)syncgetCopyServingProviderFromCarrierBundle:(id *)a3;
- (BOOL)syncgetDetectedCells:(void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetIsRegisteredOnCell;
- (BOOL)syncgetRefreshCellMonitor;
- (BOOL)syncgetRefreshCellMonitorForSim:(int)a3;
- (BOOL)syncgetServingCells:(void *)a3 addNeighborCells:(BOOL)a4;
- (BOOL)syncgetServingGsmCell:(Cell *)a3;
- (BOOL)syncgetSignalStrength:(int *)a3;
- (BOOL)syncgetUplinkFrequency:(float *)a3 andBandwidth:(float *)a4;
- (CLTelephonyServiceAdapter)init;
- (id)syncgetCopyServingOperatorForSim:(int)a3;
- (id)syncgetCopyServingProviderFromCarrierBundleForSim:(int)a3;
- (id)syncgetRegistrationInfoDictionary;
- (int)syncgetCellTransmitStatus;
- (int)syncgetRadioAccessTechnology;
- (int)syncgetRadioAccessTechnologyForSim:(int)a3;
- (int)syncgetRegistrationStatus;
- (int)syncgetRegistrationStatusForSim:(int)a3;
- (int)syncgetSignalStrengthForSim:(int)a3;
- (void)adaptee;
- (void)assertCommCenter:(int)a3 with:(int)a4;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)dumpLogWithReason:(id)a3;
- (void)endService;
- (void)fetchActiveOrHeldWithReply:(id)a3;
- (void)fetchIratStreamingInfoWithReply:(id)a3;
- (void)fetchIsCellAvailableWithReply:(id)a3;
- (void)fetchSignalStrengthMeasurementForSim:(int)a3 withReply:(id)a4;
- (void)fetchUmtsApnForInstance:(int)a3 WithReply:(id)a4;
- (void)fetchUmtsApnWithReply:(id)a3;
- (void)requestCamping:(BOOL)a3;
- (void)resetModemWithReason:(id)a3;
- (void)sendNotificationToClients:(id)a3 notificationData:(id)a4;
- (void)updateTAInfo:(TAData *)a3;
@end

@implementation CLTelephonyServiceAdapter

- (void)fetchIsCellAvailableWithReply:(id)a3
{
  v4 = [(CLTelephonyServiceAdapter *)self adaptee];
  uint64_t v5 = (*(uint64_t (**)(void *))(*(void *)v4 + 216))(v4);
  v6 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v6(a3, v5);
}

- (void)fetchSignalStrengthMeasurementForSim:(int)a3 withReply:(id)a4
{
  v6 = [(CLTelephonyServiceAdapter *)self adaptee];

  sub_100029990((uint64_t)v6, a3, (uint64_t)a4);
}

- (void)sendNotificationToClients:(id)a3 notificationData:(id)a4
{
  v4 = *(void (**)(void))(*(void *)[(CLTelephonyServiceAdapter *)self adaptee] + 272);

  v4();
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (BOOL)syncgetRefreshCellMonitor
{
  return 1;
}

- (BOOL)syncgetRefreshCellMonitorForSim:(int)a3
{
  return 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (id)getSilo
{
  if (qword_10247B370 != -1) {
    dispatch_once(&qword_10247B370, &stru_1022BB030);
  }
  return (id)qword_10247B368;
}

- (CLTelephonyServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTelephonyServiceAdapter;
  return [(CLTelephonyServiceAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLTelephonyServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLTelephonyServiceClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A64E64();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLTelephonyServiceAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLTelephonyServiceAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)fetchActiveOrHeldWithReply:(id)a3
{
  char v7 = 0;
  BOOL v4 = sub_100550FC8((uint64_t)[(CLTelephonyServiceAdapter *)self adaptee], &v7);
  if (v7) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  v6 = (void (*)(id, BOOL))*((void *)a3 + 2);

  v6(a3, v5);
}

- (void)requestCamping:(BOOL)a3
{
  BOOL v3 = a3;
  if (*((void *)[(CLTelephonyServiceAdapter *)self adaptee] + 18)) {
    BOOL v4 = _CTServerConnectionSetCampOnlyMode() == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022BB288);
  }
  BOOL v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289538;
    v6[1] = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 1026;
    BOOL v10 = v3;
    __int16 v11 = 1026;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#camp request\", \"campRequest\":%{public}hhd, \"success\":%{public}hhd}", (uint8_t *)v6, 0x1Eu);
  }
}

- (BOOL)syncgetCampOnlyState
{
  v2 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_1005514B0((uint64_t)v2);
}

- (void)updateTAInfo:(TAData *)a3
{
  BOOL v4 = [(CLTelephonyServiceAdapter *)self adaptee];
  long long v5 = *(_OWORD *)&a3->var4;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v5;
  uint64_t v7 = *(void *)&a3->var6;
  sub_100551924((uint64_t)v4, (uint64_t)v6);
}

- (void)assertCommCenter:(int)a3 with:(int)a4
{
  v6 = [(CLTelephonyServiceAdapter *)self adaptee];

  sub_100551CEC((uint64_t)v6, a3, a4);
}

- (BOOL)syncgetUplinkFrequency:(float *)a3 andBandwidth:(float *)a4
{
  v6 = [(CLTelephonyServiceAdapter *)self adaptee];
  *a3 = v6[41];
  *a4 = v6[42];
  return 1;
}

- (id)syncgetRegistrationInfoDictionary
{
  v2 = (void *)sub_100551F04((uint64_t)[(CLTelephonyServiceAdapter *)self adaptee]);

  return v2;
}

- (void)fetchUmtsApnWithReply:(id)a3
{
  BOOL v4 = (char *)[(CLTelephonyServiceAdapter *)self adaptee] + 176;

  sub_10097C8E0((uint64_t)v4, (uint64_t)a3);
}

- (void)fetchUmtsApnForInstance:(int)a3 WithReply:(id)a4
{
  v6 = (char *)[(CLTelephonyServiceAdapter *)self adaptee] + 176;

  sub_10097D020((uint64_t)v6, a3, (uint64_t)a4);
}

- (void)fetchIratStreamingInfoWithReply:(id)a3
{
  BOOL v4 = [(CLTelephonyServiceAdapter *)self adaptee];

  sub_1005521A4((uint64_t)v4, (uint64_t)a3);
}

- (BOOL)syncgetDetectedCells:(void *)a3
{
  BOOL v4 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_1005522D0((uint64_t)v4, (uint64_t *)a3);
}

- (BOOL)syncgetIsRegisteredOnCell
{
  v2 = *(uint64_t (**)(void))(*(void *)[(CLTelephonyServiceAdapter *)self adaptee] + 216);

  return v2();
}

- (int)syncgetRadioAccessTechnology
{
  v2 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_10055332C((uint64_t)v2);
}

- (int)syncgetRadioAccessTechnologyForSim:(int)a3
{
  BOOL v4 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_1005533A0((uint64_t)v4, a3);
}

- (int)syncgetRegistrationStatus
{
  v2 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_10005E978((uint64_t)v2);
}

- (int)syncgetRegistrationStatusForSim:(int)a3
{
  BOOL v4 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_100553454((uint64_t)v4, a3);
}

- (int)syncgetCellTransmitStatus
{
  return *((_DWORD *)[(CLTelephonyServiceAdapter *)self adaptee] + 34);
}

- (BOOL)syncgetActiveCall:(BOOL *)a3
{
  BOOL v5 = 0;
  BOOL result = sub_100550FC8((uint64_t)[(CLTelephonyServiceAdapter *)self adaptee], &v5);
  *a3 = v5;
  return result;
}

- (BOOL)syncgetCopyServingOperator:(id *)a3
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
  char v4 = sub_10055359C((uint64_t)[(CLTelephonyServiceAdapter *)self adaptee]);
  *a3 = [objc_alloc((Class)NSString) initWithUTF8String:__p];
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

- (id)syncgetCopyServingOperatorForSim:(int)a3
{
  char v4 = (char *)[(CLTelephonyServiceAdapter *)self adaptee] + 176;

  return sub_10097DCD0((uint64_t)v4, a3);
}

- (BOOL)syncgetCopyServingProvider:(id *)a3
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
  char v4 = sub_10055359C((uint64_t)[(CLTelephonyServiceAdapter *)self adaptee]);
  *a3 = [objc_alloc((Class)NSString) initWithUTF8String:__p];
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

- (BOOL)syncgetCopyServingProviderFromCarrierBundle:(id *)a3
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v7 = 0;
  char v4 = sub_100553AB4((uint64_t)[(CLTelephonyServiceAdapter *)self adaptee]);
  *a3 = [objc_alloc((Class)NSString) initWithUTF8String:__p];
  if (SHIBYTE(v7) < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

- (id)syncgetCopyServingProviderFromCarrierBundleForSim:(int)a3
{
  char v4 = (char *)[(CLTelephonyServiceAdapter *)self adaptee] + 176;

  return sub_10097DCE0((uint64_t)v4, a3);
}

- (BOOL)syncgetSignalStrength:(int *)a3
{
  BOOL v3 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_100553ED4((uint64_t)v3);
}

- (int)syncgetSignalStrengthForSim:(int)a3
{
  char v4 = (char *)[(CLTelephonyServiceAdapter *)self adaptee] + 176;

  return sub_10097DC9C((uint64_t)v4, a3);
}

- (void)resetModemWithReason:(id)a3
{
  BOOL v4 = sub_100554480((uint64_t)-[CLTelephonyServiceAdapter adaptee](self, "adaptee"), (char *)[a3 UTF8String]);
  if (qword_102419380 != -1) {
    dispatch_once(&qword_102419380, &stru_1022BB2A8);
  }
  BOOL v5 = qword_102419388;
  if (os_log_type_enabled((os_log_t)qword_102419388, OS_LOG_TYPE_FAULT))
  {
    int v8 = 68289539;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    __int16 v14 = 2081;
    id v15 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"attempt to reset modem\", \"success\":%{public}hhd, \"reason\":%{private, location:escape_only}s}", (uint8_t *)&v8, 0x22u);
    if (qword_102419380 != -1) {
      dispatch_once(&qword_102419380, &stru_1022BB2A8);
    }
  }
  v6 = qword_102419388;
  if (os_signpost_enabled((os_log_t)qword_102419388))
  {
    id v7 = [a3 UTF8String];
    int v8 = 68289539;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    __int16 v14 = 2081;
    id v15 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "attempt to reset modem", "{\"msg%{public}.0s\":\"attempt to reset modem\", \"success\":%{public}hhd, \"reason\":%{private, location:escape_only}s}", (uint8_t *)&v8, 0x22u);
  }
}

- (void)dumpLogWithReason:(id)a3
{
  BOOL v4 = [(CLTelephonyServiceAdapter *)self adaptee];
  BOOL v5 = (char *)[a3 UTF8String];

  sub_100554878((uint64_t)v4, v5);
}

- (BOOL)syncgetServingCells:(void *)a3 addNeighborCells:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_100554C64((uint64_t)v6, (uint64_t *)a3, v4);
}

- (BOOL)syncgetServingGsmCell:(Cell *)a3
{
  BOOL v4 = [(CLTelephonyServiceAdapter *)self adaptee];

  return sub_100554E44((uint64_t)v4, (uint64_t)a3);
}

+ (BOOL)isSupported
{
  return 1;
}

@end