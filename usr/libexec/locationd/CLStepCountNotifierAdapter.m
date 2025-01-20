@interface CLStepCountNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetEnabled;
- (BOOL)syncgetIsStrideCalibrationConvergedMedianForSpeed:(double)a3;
- (CLStepCountNotifierAdapter)init;
- (CLStepDistance)syncgetQueryStartTime:(SEL)a3 andStopTime:(double *)a4;
- (id)syncgetCopyRawSpeedToKValueBins;
- (id)syncgetCopyStepCadenceToStrideLengthBins;
- (id)syncgetDbUUID;
- (id)syncgetRawSpeedToKValueDefaultBins;
- (id)syncgetStepCadenceToStrideLengthDefaultBins;
- (int)syncgetQueryPedometerDataSince:(CLStepCountEntry *)a3 withResponseArray:(void *)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)getPedometerBinsAndHistoryWithReply:(id)a3;
- (void)getPedometerCalibrationBins:(int64_t)a3 withReply:(id)a4;
- (void)receiveWorkoutDistanceAnalyticsMessage:(id)a3;
- (void)reset;
- (void)resumeAfterPendingStepCountNotifications;
- (void)setEnabled:(BOOL)a3;
- (void)setRawSpeedToKValueBins:(id)a3;
- (void)setStepCadenceToStrideLengthBins:(id)a3;
- (void)strideCalibratorSetSession:(int64_t)a3;
@end

@implementation CLStepCountNotifierAdapter

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
  if (qword_102488CE0 != -1) {
    dispatch_once(&qword_102488CE0, &stru_10232E1F8);
  }
  return (id)qword_102488CD8;
}

- (CLStepCountNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLStepCountNotifierAdapter;
  return [(CLStepCountNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLStepCountNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLStepCountNotifierClientProtocol];
}

- (void)beginService
{
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_10158340C((uint64_t)[(CLStepCountNotifierAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier])
  {
    uint64_t v3 = sub_101ABD52C();
    sub_10158340C(v3);
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)doAsync:(id)a3
{
  v4 = [(CLStepCountNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLStepCountNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)strideCalibratorSetSession:(int64_t)a3
{
  v4 = (void *)*((void *)[(CLStepCountNotifierAdapter *)self adaptee] + 25);

  [v4 setSession:a3];
}

- (void)receiveWorkoutDistanceAnalyticsMessage:(id)a3
{
  v4 = [(CLStepCountNotifierAdapter *)self adaptee];

  sub_1015836A4((uint64_t)v4, (uint64_t)a3);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CLStepCountNotifierAdapter *)self adaptee];

  sub_101583880((uint64_t)v4, v3);
}

- (BOOL)syncgetEnabled
{
  [(CLStepCountNotifierAdapter *)self adaptee];
  v2 = *(uint64_t (**)(void))(*(void *)(sub_1000D2E34(0) + 32) + 24);

  return v2();
}

- (CLStepDistance)syncgetQueryStartTime:(SEL)a3 andStopTime:(double *)a4
{
  v8 = [(CLStepCountNotifierAdapter *)self adaptee];

  sub_101583A70((uint64_t)v8, a4, a5, (uint64_t)retstr);
  return result;
}

- (void)reset
{
  v2 = [(CLStepCountNotifierAdapter *)self adaptee];
  sub_10157F4FC(v2[16]);
  BOOL v3 = (void *)(v2[16] + 72);

  sub_1011F9E28(v3);
}

- (id)syncgetDbUUID
{
  id v2 = (id)sub_10157C27C(*((void *)[(CLStepCountNotifierAdapter *)self adaptee] + 16));

  return v2;
}

- (int)syncgetQueryPedometerDataSince:(CLStepCountEntry *)a3 withResponseArray:(void *)a4
{
  uint64_t v4 = *((void *)[(CLStepCountNotifierAdapter *)self adaptee] + 16);

  return sub_10157AC58(v4);
}

- (id)syncgetCopyRawSpeedToKValueBins
{
  [(CLStepCountNotifierAdapter *)self adaptee];
  id v2 = +[CMPedometerTableRawSpeedToKValue sharedInstance];

  return [(CMPedometerTable *)v2 copyBins];
}

- (id)syncgetCopyStepCadenceToStrideLengthBins
{
  [(CLStepCountNotifierAdapter *)self adaptee];
  id v2 = +[CMPedometerTableStepCadenceToStrideLength sharedInstance];

  return [(CMPedometerTable *)v2 copyBins];
}

- (void)setRawSpeedToKValueBins:(id)a3
{
  [(CLStepCountNotifierAdapter *)self adaptee];
  uint64_t v4 = +[CMPedometerTableRawSpeedToKValue sharedInstance];

  [(CMPedometerTable *)v4 setBins:a3];
}

- (void)setStepCadenceToStrideLengthBins:(id)a3
{
  [(CLStepCountNotifierAdapter *)self adaptee];
  uint64_t v4 = +[CMPedometerTableStepCadenceToStrideLength sharedInstance];

  [(CMPedometerTable *)v4 setBins:a3];
}

- (id)syncgetRawSpeedToKValueDefaultBins
{
  [(CLStepCountNotifierAdapter *)self adaptee];
  id v2 = [[-[CMPedometerTable defaultBins](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance")) copy];

  return v2;
}

- (id)syncgetStepCadenceToStrideLengthDefaultBins
{
  [(CLStepCountNotifierAdapter *)self adaptee];
  id v2 = [[-[CMPedometerTable defaultBins](+[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance")) copy];

  return v2;
}

- (BOOL)syncgetIsStrideCalibrationConvergedMedianForSpeed:(double)a3
{
  uint64_t v4 = (void *)*((void *)[(CLStepCountNotifierAdapter *)self adaptee] + 25);

  return _[v4 isCalibrationConvergedMedianForSpeed:a3];
}

- (void)getPedometerCalibrationBins:(int64_t)a3 withReply:(id)a4
{
  if (a3 == 1)
  {
    [(CLStepCountNotifierAdapter *)self adaptee];
    unint64_t v5 = CMPedometerTableStepCadenceToStrideLength;
    goto LABEL_5;
  }
  if (!a3)
  {
    [(CLStepCountNotifierAdapter *)self adaptee];
    unint64_t v5 = CMPedometerTableRawSpeedToKValue;
LABEL_5:
    id v6 = [[(__objc2_class *)v5 sharedInstance] copyBins];
    goto LABEL_12;
  }
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_10232E540);
  }
  v7 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Requested calibration type not recognized", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_10232E540);
    }
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLStepCountNotifierAdapter getPedometerCalibrationBins:withReply:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  id v6 = 0;
LABEL_12:
  (*((void (**)(id, id))a4 + 2))(a4, v6);
}

- (void)getPedometerBinsAndHistoryWithReply:(id)a3
{
  id v5 = [[*((id *)-[CLStepCountNotifierAdapter adaptee](self, "adaptee") + 25) copyHistory];
  [(CLStepCountNotifierAdapter *)self adaptee];
  id v6 = [+[CMPedometerTableRawSpeedToKValue sharedInstance] copyBins];
  [(CLStepCountNotifierAdapter *)self adaptee];
  id v7 = [+[CMPedometerTableStepCadenceToStrideLength sharedInstance] copyBins];
  id v8 = +[CMPedometerTable convertToCMStrideCalibrationData:v6];

  id v9 = +[CMPedometerTable convertToCMStrideCalibrationData:v7];
  id v10 = [objc_alloc((Class)CMStrideCalibrationHistory) initWithCalibrationTracks:v5 rawSpeedToKValueBins:v8 stepCadenceToStrideLengthBins:v9];

  v11 = (void (*)(id, id))*((void *)a3 + 2);

  v11(a3, v10);
}

- (void)resumeAfterPendingStepCountNotifications
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1015842DC;
  v2[3] = &unk_10229FED8;
  v2[4] = self;
  [silo async:v2];
}

+ (BOOL)isSupported
{
  if (qword_102488CF0 != -1) {
    dispatch_once(&qword_102488CF0, &stru_10232E218);
  }
  return byte_102488CE8;
}

@end