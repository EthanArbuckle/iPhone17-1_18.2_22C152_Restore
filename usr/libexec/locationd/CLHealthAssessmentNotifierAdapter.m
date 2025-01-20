@interface CLHealthAssessmentNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)anySubscribedToSensorRecorder;
- (BOOL)syncgetDoSync:(id)a3;
- (CLHealthAssessmentChoreaDetectionService)choreaDetectionService;
- (CLHealthAssessmentNotifierAdapter)init;
- (CLHealthAssessmentTremorDetectionService)tremorDetectionService;
- (CLTimer)fAggregateRecordsTimer;
- (CLTimer)fSensorRecorderQueryTimer;
- (CLTimer)fSensorRecorderSubscribeTimer;
- (CMSensorRecorder)sensorRecorder;
- (double)lastProcessedTime;
- (double)monitorKinesiasExpiration;
- (double)monitorKinesiasStart;
- (double)updateStartTime;
- (void)adaptee;
- (void)addMonitoringPeriodFrom:(double)a3 until:(double)a4;
- (void)aggregateRecords;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)processDataWithMaxDuration:(double)a3 endTime:(double)a4;
- (void)processNextIntervalWithRemainingDurationToProcess:(double *)a3 endTime:(double)a4 updateCanContinue:(BOOL *)a5;
- (void)setChoreaDetectionService:(id)a3;
- (void)setFAggregateRecordsTimer:(id)a3;
- (void)setFSensorRecorderQueryTimer:(id)a3;
- (void)setFSensorRecorderSubscribeTimer:(id)a3;
- (void)setLastProcessedTime:(double)a3;
- (void)setMonitorKinesiasExpiration:(double)a3;
- (void)setMonitorKinesiasStart:(double)a3;
- (void)setSensorRecorder:(id)a3;
- (void)setTremorDetectionService:(id)a3;
- (void)setUpdateStartTime:(double)a3;
- (void)setupService;
- (void)startUpdatesforAnalyzer:(int)a3;
- (void)stopMonitoring;
- (void)syncgetResultReady:(id)a3 ForAnalyzer:(int)a4;
- (void)teardownService;
- (void)updateSensorRecorderQuery;
- (void)updateSensorRecorderSubscription;
@end

@implementation CLHealthAssessmentNotifierAdapter

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
  if (qword_10247AA08 != -1) {
    dispatch_once(&qword_10247AA08, &stru_1022B2740);
  }
  return (id)qword_10247AA00;
}

- (CLHealthAssessmentNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLHealthAssessmentNotifierAdapter;
  return [(CLHealthAssessmentNotifierAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLHealthAssessmentNotifierProtocol outboundProtocol:&OBJC_PROTOCOL___CLHealthAssessmentNotifierClientProtocol];
}

- (void)beginService
{
  if (qword_102419350 != -1) {
    dispatch_once(&qword_102419350, &stru_1022B28B0);
  }
  objc_super v3 = off_102419358;
  if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLHealthAssessmentNotifier starting up", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
  [(CLNotifierServiceAdapter *)self setAdaptedNotifier:sub_10043D2B0((uint64_t)[(CLHealthAssessmentNotifierAdapter *)self universe])];
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A6011C();
  }
  uint64_t v4 = sub_1000A6958();
  if (sub_1004D0138(v4))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = sub_1000A6958();
    p_double monitorKinesiasStart = &self->_monitorKinesiasStart;
    sub_1000A6A10(v6, @"kMonitorKinesiasStart", &self->_monitorKinesiasStart);
    double monitorKinesiasStart = self->_monitorKinesiasStart;
    if (Current < monitorKinesiasStart) {
      double monitorKinesiasStart = Current;
    }
    double *p_monitorKinesiasStart = monitorKinesiasStart;
    uint64_t v9 = sub_1000A6958();
    p_monitorKinesiasExpiration = &self->_monitorKinesiasExpiration;
    sub_1000A6A10(v9, @"kMonitorKinesiasExpiration", &self->_monitorKinesiasExpiration);
    double v11 = *p_monitorKinesiasStart + 604800.0;
    if (v11 >= self->_monitorKinesiasExpiration) {
      double v11 = *p_monitorKinesiasExpiration;
    }
    double *p_monitorKinesiasExpiration = v11;
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    v12 = off_102419358;
    if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
    {
      double v13 = *p_monitorKinesiasStart;
      double v14 = *p_monitorKinesiasExpiration;
      *(_DWORD *)buf = 134349312;
      double v23 = v13;
      __int16 v24 = 2050;
      double v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Loaded monitoring period start: %{public}f expiration date: %{public}f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    uint64_t v15 = sub_1000A6958();
    sub_1000A6A10(v15, @"kMonitorKinesiasLastProcessed", &self->_lastProcessedTime);
    double lastProcessedTime = self->_lastProcessedTime;
    if (Current < lastProcessedTime) {
      double lastProcessedTime = Current;
    }
    self->_double lastProcessedTime = lastProcessedTime;
    [(CLHealthAssessmentNotifierAdapter *)self setupService];
    [(CLHealthAssessmentNotifierAdapter *)self monitorKinesiasExpiration];
    if (v17 > Current)
    {
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      v18 = off_102419358;
      if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Resume sensor recording on service start", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419350 != -1) {
          dispatch_once(&qword_102419350, &stru_1022B28B0);
        }
        v21 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v21);
        if (v21 != (char *)buf) {
          free(v21);
        }
      }
      [(CLHealthAssessmentNotifierAdapter *)self updateSensorRecorderSubscription];
      self->fDyskinesiaSubscribed = 1;
      self->fTremorSubscribed = 1;
    }
  }
}

- (void)endService
{
  objc_super v3 = [(CLNotifierServiceAdapter *)self notifier];
  (*((void (**)(CLNotifierBase *))v3->var0 + 2))(v3);

  uint64_t v4 = [(CLHealthAssessmentNotifierAdapter *)self tremorDetectionService];
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
  uint64_t v4 = [(CLHealthAssessmentNotifierAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLHealthAssessmentNotifierAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)setupService
{
  if (![(CLHealthAssessmentNotifierAdapter *)self sensorRecorder])
  {
    [(CLHealthAssessmentNotifierAdapter *)self setSensorRecorder:objc_alloc_init((Class)CMSensorRecorder)];
    sub_10043D89C((uint64_t)[(CLHealthAssessmentNotifierAdapter *)self adaptee]);
    [(CLHealthAssessmentNotifierAdapter *)self setChoreaDetectionService:objc_alloc_init(CLHealthAssessmentChoreaDetectionService)];
    [(CLHealthAssessmentChoreaDetectionService *)[(CLHealthAssessmentNotifierAdapter *)self choreaDetectionService] setDelegate:self];
    [(CLHealthAssessmentNotifierAdapter *)self setTremorDetectionService:objc_alloc_init(CLHealthAssessmentTremorDetectionService)];
    [(CLHealthAssessmentTremorDetectionService *)[(CLHealthAssessmentNotifierAdapter *)self tremorDetectionService] setDelegate:self];
    -[CLHealthAssessmentNotifierAdapter setFSensorRecorderQueryTimer:](self, "setFSensorRecorderQueryTimer:", [objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo") newTimer]);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10043DA78;
    v11[3] = &unk_10229FED8;
    v11[4] = self;
    [(CLTimer *)[(CLHealthAssessmentNotifierAdapter *)self fSensorRecorderQueryTimer] setHandler:v11];
    double v10 = 15.0;
    uint64_t v3 = sub_1000D3E78();
    sub_10006B564(v3, buf);
    sub_1000A699C(*(uint64_t *)&buf[0], "kMonitorKinesiasProcessingDelay", &v10);
    if (*((void *)&buf[0] + 1)) {
      sub_1000DB0A0(*((std::__shared_weak_count **)&buf[0] + 1));
    }
    uint64_t v4 = [(CLHealthAssessmentNotifierAdapter *)self fSensorRecorderQueryTimer];
    [(CLTimer *)v4 setNextFireDelay:v10];
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    unint64_t v5 = off_102419358;
    if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
    {
      [(CLTimer *)[(CLHealthAssessmentNotifierAdapter *)self fSensorRecorderQueryTimer] nextFireTime];
      LODWORD(buf[0]) = 134349056;
      *(void *)((char *)buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fSensorRecorderQueryTimer.nextFireTime, %{public}f", (uint8_t *)buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      [(CLTimer *)[(CLHealthAssessmentNotifierAdapter *)self fSensorRecorderQueryTimer] nextFireTime];
      int v12 = 134349056;
      uint64_t v13 = v7;
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter setupService]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    -[CLHealthAssessmentNotifierAdapter setFAggregateRecordsTimer:](self, "setFAggregateRecordsTimer:", [objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo") newTimer]);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10043DA80;
    v9[3] = &unk_10229FED8;
    v9[4] = self;
    [(CLTimer *)[(CLHealthAssessmentNotifierAdapter *)self fAggregateRecordsTimer] setHandler:v9];
    [(CLHealthAssessmentNotifierAdapter *)self aggregateRecords];
  }
}

- (void)teardownService
{
  if (qword_102419350 != -1) {
    dispatch_once(&qword_102419350, &stru_1022B28B0);
  }
  uint64_t v3 = off_102419358;
  if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down service", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter teardownService]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  uint64_t v4 = sub_1000A6958();
  sub_1004CF870(v4);
  uint64_t v5 = sub_1000A6958();
  sub_1004CF870(v5);
  self->_double monitorKinesiasStart = 0.0;
  uint64_t v6 = sub_1000A6958();
  sub_1004CF870(v6);
  self->_monitorKinesiasExpiration = 0.0;
  uint64_t v7 = sub_1000A6958();
  sub_1004CF870(v7);
  self->_double lastProcessedTime = 0.0;
  self->_updateStartTime = 0.0;
  uint64_t v8 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v8 + 944))();
  [(CLHealthAssessmentNotifierAdapter *)self setFSensorRecorderQueryTimer:0];
  [(CLHealthAssessmentNotifierAdapter *)self setFAggregateRecordsTimer:0];
  [(CLHealthAssessmentNotifierAdapter *)self setFSensorRecorderSubscribeTimer:0];

  [(CLHealthAssessmentNotifierAdapter *)self setChoreaDetectionService:0];
  [(CLHealthAssessmentNotifierAdapter *)self setTremorDetectionService:0];

  [(CLHealthAssessmentNotifierAdapter *)self setSensorRecorder:0];
}

- (void)updateSensorRecorderSubscription
{
  [+[NSDate date] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(CLHealthAssessmentNotifierAdapter *)self monitorKinesiasExpiration];
  if (v4 >= v5)
  {
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    uint64_t v7 = off_102419358;
    if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Stop renewing sensorRecorder subscription", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
  else
  {
    if (![(CLHealthAssessmentNotifierAdapter *)self fSensorRecorderSubscribeTimer])
    {
      -[CLHealthAssessmentNotifierAdapter setFSensorRecorderSubscribeTimer:](self, "setFSensorRecorderSubscribeTimer:", [objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo") newTimer]);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10043DFD4;
      v10[3] = &unk_10229FED8;
      v10[4] = self;
      [(CLTimer *)[(CLHealthAssessmentNotifierAdapter *)self fSensorRecorderSubscribeTimer] setHandler:v10];
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10043DFDC;
    block[3] = &unk_10229FED8;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
}

- (void)updateSensorRecorderQuery
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10043E650;
  v2[3] = &unk_10229FED8;
  v2[4] = self;
  [objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo") async:v2];
}

- (void)processDataWithMaxDuration:(double)a3 endTime:(double)a4
{
  if (a3 > 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= a4)
    {
      double v8 = a4;
    }
    else
    {
      double v8 = Current;
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      uint64_t v9 = off_102419358;
      if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349312;
        double v29 = v8;
        __int16 v30 = 2050;
        double v31 = a4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Limiting processing up to timestamp %{public}lf (asked %{public}lf)", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419350 != -1) {
          dispatch_once(&qword_102419350, &stru_1022B28B0);
        }
        int v20 = 134349312;
        double v21 = v8;
        __int16 v22 = 2050;
        double v23 = a4;
        double v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
    double v19 = a3;
    char v18 = 1;
    unsigned int v11 = 0;
    if (a3 > 0.0)
    {
      while (v11 <= 0x1D)
      {
        [(CLHealthAssessmentNotifierAdapter *)self processNextIntervalWithRemainingDurationToProcess:&v19 endTime:&v18 updateCanContinue:v8];
        if (qword_102419350 != -1) {
          dispatch_once(&qword_102419350, &stru_1022B28B0);
        }
        int v12 = off_102419358;
        if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349312;
          double v29 = v19;
          __int16 v30 = 1026;
          LODWORD(v31) = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Remaining duration to process = %{public}lf, current iteration = %{public}i", buf, 0x12u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419350 != -1) {
            dispatch_once(&qword_102419350, &stru_1022B28B0);
          }
          int v20 = 134349312;
          double v21 = v19;
          __int16 v22 = 1026;
          LODWORD(v23) = v11;
          uint64_t v13 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]", "%s\n", v13);
          if (v13 != (char *)buf) {
            free(v13);
          }
        }
        ++v11;
        if (v19 <= 0.0 || !v18) {
          goto LABEL_33;
        }
      }
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      double v14 = off_102419358;
      if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v29) = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Exceeding maximum number of iterations when processing data = %{public}i - interrupting the processing", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419350 != -1) {
          dispatch_once(&qword_102419350, &stru_1022B28B0);
        }
        int v20 = 67240192;
        LODWORD(v21) = v11;
        double v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
      char v18 = 0;
    }
LABEL_33:
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    uint64_t v15 = off_102419358;
    if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349824;
      double v29 = a3;
      __int16 v30 = 2050;
      double v31 = v8;
      __int16 v32 = 2050;
      double v33 = a3 - v19;
      __int16 v34 = 1026;
      unsigned int v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Processed data up to max duration = %{public}lf, endTime = %{public}lf, total duration processed = %{public}lf, number of iterations %{public}i", buf, 0x26u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      int v20 = 134349824;
      double v21 = a3;
      __int16 v22 = 2050;
      double v23 = v8;
      __int16 v24 = 2050;
      double v25 = a3 - v19;
      __int16 v26 = 1026;
      unsigned int v27 = v11;
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
  }
}

- (void)processNextIntervalWithRemainingDurationToProcess:(double *)a3 endTime:(double)a4 updateCanContinue:(BOOL *)a5
{
  double v5 = __chkstk_darwin(self);
  uint64_t v7 = v6;
  double v8 = v5;
  double v10 = v9;
  int v12 = v11;
  if (sub_100082064(*((void *)[v11 adaptee] + 20) + 72))
  {
    [v12 updateStartTime];
    if (v13 == 0.0)
    {
      [v12 lastProcessedTime];
      if (v14 > 0.0)
      {
        if (qword_102419350 != -1) {
          dispatch_once(&qword_102419350, &stru_1022B28B0);
        }
        uint64_t v15 = off_102419358;
        if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
        {
          [v12 lastProcessedTime];
          int v122 = 134349056;
          double v123 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Updating start time to %{public}f based on last processed time", (uint8_t *)&v122, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&v122, 0x65CuLL);
          if (qword_102419350 != -1) {
            dispatch_once(&qword_102419350, &stru_1022B28B0);
          }
          [v12 lastProcessedTime];
          int v116 = 134349056;
          double v117 = v89;
          v90 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v90);
          if (v90 != (char *)&v122) {
            free(v90);
          }
        }
        [v12 lastProcessedTime];
        [v12 setUpdateStartTime:];
      }
    }
    if (*v10 <= 0.0 || (objc_msgSend(v12, "updateStartTime", *v10), v17 > v8))
    {
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      char v18 = off_102419358;
      if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
      {
        double v19 = *v10;
        [v12 updateStartTime];
        int v122 = 134349568;
        double v123 = v19;
        __int16 v124 = 2050;
        double v125 = v8;
        __int16 v126 = 2050;
        uint64_t v127 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "No processing to do, remainingDurationToProcess=%{public}f, endTime=%{public}f, updateStartTime=%{public}f", (uint8_t *)&v122, 0x20u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_17;
      }
      bzero(&v122, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      double v86 = *v10;
      [v12 updateStartTime];
      int v116 = 134349568;
      double v117 = v86;
      __int16 v118 = 2050;
      double v119 = v8;
      __int16 v120 = 2050;
      uint64_t v121 = v87;
LABEL_106:
      v88 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v88);
      if (v88 != (char *)&v122) {
        free(v88);
      }
LABEL_17:
      *uint64_t v7 = 0;
      return;
    }
    double v22 = fmin(*v10, 43200.0);
    [v12 updateStartTime];
    double v108 = v8;
    double v109 = v23;
    +[CLHealthAssessmentUtilities limitStart:&v109 andEnd:&v108 maxDuration:259190.0 from:CFAbsoluteTimeGetCurrent()];
    if (!sub_100440038([v12 adaptee], &v109, &v108, v22))
    {
      [v12 setLastProcessedTime:v108];
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      v72 = off_102419358;
      if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
      {
        int v122 = 134349056;
        double v123 = v108;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "No valid period, marking up to %{public}f as processed", (uint8_t *)&v122, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_17;
      }
      bzero(&v122, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      int v116 = 134349056;
      double v117 = v108;
      goto LABEL_106;
    }
    v102 = v7;
    double v108 = fmin(v108, v8);
    id v24 = objc_alloc((Class)NSDate);
    id v25 = [v24 initWithTimeIntervalSinceReferenceDate:v109];
    id v26 = objc_alloc((Class)NSDate);
    id v27 = [v26 initWithTimeIntervalSinceReferenceDate:v108 + 2.0];
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    v28 = &qword_102419000;
    double v29 = off_102419358;
    if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
    {
      int v122 = 134349312;
      double v123 = v109;
      __int16 v124 = 2050;
      double v125 = v108;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Requesting sensorRecorder data from %{public}f to %{public}f", (uint8_t *)&v122, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(&v122, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      int v116 = 134349312;
      double v117 = v109;
      __int16 v118 = 2050;
      double v119 = v108;
      v91 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v91);
      if (v91 != (char *)&v122) {
        free(v91);
      }
      v28 = &qword_102419000;
    }
    id v105 = [objc_msgSend(v12, "sensorRecorder") accelerometerDataFromDate:v25 toDate:v27];
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    __int16 v30 = v28[107];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      LOWORD(v122) = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Received accel data", (uint8_t *)&v122, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(&v122, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      LOWORD(v116) = 0;
      v92 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v92);
      if (v92 != (char *)&v122) {
        free(v92);
      }
      v28 = &qword_102419000;
    }
    id v104 = [objc_msgSend(v12, "sensorRecorder") gyroDataFromDate:v25 toDate:v27];
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    double v31 = v28[107];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      LOWORD(v122) = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Received gyro data", (uint8_t *)&v122, 2u);
    }
    v101 = v10;
    if (sub_10013D1A0(115, 2))
    {
      bzero(&v122, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      LOWORD(v116) = 0;
      v93 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v93);
      if (v93 != (char *)&v122) {
        free(v93);
      }
    }
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    unint64_t v34 = 0;
    unint64_t v35 = 0;
    uint64_t v103 = 0;
    uint64_t v36 = 0;
    while (1)
    {
      if (v34 >= v32)
      {
        id v37 = [v105 countByEnumeratingWithState:v107 objects:&v122 count:700];
        if (!v37) {
          goto LABEL_73;
        }
        unint64_t v32 = (unint64_t)v37;
        unint64_t v34 = 0;
      }
      if (v35 >= v33)
      {
        id v38 = [v104 countByEnumeratingWithState:v106 objects:&v116 count:700];
        if (!v38) {
          goto LABEL_73;
        }
        unint64_t v33 = (unint64_t)v38;
        unint64_t v35 = 0;
      }
      v39 = (void *)*((void *)&v122 + v34);
      v40 = (void *)*((void *)&v116 + v35);
      [v39 startTime];
      double v42 = v41;
      [v40 startTime];
      double v44 = v43;
      if (v42 > v108 && v43 > v108) {
        break;
      }
      if (v42 < v43)
      {
        if (v42 <= v108 && v42 > v109)
        {
          [v39 acceleration];
          float v59 = v58;
          [v39 acceleration];
          float v61 = v60;
          [v39 acceleration];
          float v63 = v62;
          id v64 = [v12 tremorDetectionService];
          *(float *)&double v65 = v59;
          *(float *)&double v66 = v61;
          *(float *)&double v67 = v63;
          [v64 feedAccelSample:v65 time:v66];
          id v68 = [v12 choreaDetectionService];
          *(float *)&double v69 = v59;
          *(float *)&double v70 = v61;
          *(float *)&double v71 = v63;
          [v68 feedAccelSample:v69 time:v70];
          [v12 setUpdateStartTime:v42];
          ++v103;
        }
        ++v34;
      }
      else
      {
        if (v43 <= v108 && v43 > v109)
        {
          [v40 rotationRate];
          float v48 = v47;
          [v40 rotationRate];
          float v50 = v49;
          [v40 rotationRate];
          float v52 = v51;
          id v53 = [v12 tremorDetectionService];
          *(float *)&double v54 = v48;
          *(float *)&double v55 = v50;
          *(float *)&double v56 = v52;
          [v53 feedGyroSample:v54 time:v55];
          [v12 setUpdateStartTime:v44];
          ++v36;
        }
        ++v35;
      }
    }
    [v12 setUpdateStartTime:];
LABEL_73:
    if (v103 | v36)
    {
      v74 = v102;
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      v79 = off_102419358;
      if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
      {
        [v12 updateStartTime];
        *(_DWORD *)buf = 67240704;
        *(_DWORD *)v114 = v103;
        *(_WORD *)&v114[4] = 1026;
        *(_DWORD *)&v114[6] = v36;
        *(_WORD *)v115 = 2050;
        *(double *)&v115[2] = v80 - v109;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "New records read, accel = %{public}d, gyro = %{public}d, duration processed = %{public}lf", buf, 0x18u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419350 != -1) {
          dispatch_once(&qword_102419350, &stru_1022B28B0);
        }
        [v12 updateStartTime];
        int v110 = 67240704;
        *(_DWORD *)v111 = v103;
        *(_WORD *)&v111[4] = 1026;
        *(_DWORD *)&v111[6] = v36;
        *(_WORD *)v112 = 2050;
        *(double *)&v112[2] = v94 - v109;
        v95 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v95);
        if (v95 != (char *)buf) {
          free(v95);
        }
        v74 = v102;
      }
      [v12 updateStartTime];
      double *v101 = *v101 - (v81 - v109);
    }
    else
    {
      double v73 = CFAbsoluteTimeGetCurrent() + -600.0;
      [v12 updateStartTime];
      v74 = v102;
      if (v75 >= v73)
      {
        if (qword_102419350 != -1) {
          dispatch_once(&qword_102419350, &stru_1022B28B0);
        }
        v83 = off_102419358;
        if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
        {
          [v12 updateStartTime];
          *(_DWORD *)buf = 134349056;
          *(void *)v114 = v84;
          _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_INFO, "No new records from sensorRecorder, updateStartTime is up to date (%{public}f)", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419350 != -1) {
            dispatch_once(&qword_102419350, &stru_1022B28B0);
          }
          [v12 updateStartTime];
          int v110 = 134349056;
          *(void *)v111 = v99;
          v100 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v100);
          if (v100 != (char *)buf) {
            free(v100);
          }
          char v82 = 0;
          v74 = v102;
          goto LABEL_97;
        }
        goto LABEL_96;
      }
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      v76 = off_102419358;
      if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
      {
        [v12 updateStartTime];
        double v78 = v108;
        if (v73 < v108) {
          double v78 = v73;
        }
        *(_DWORD *)buf = 134349312;
        *(void *)v114 = v77;
        *(_WORD *)&v114[8] = 2050;
        *(double *)v115 = v78;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "No new records from sensorRecorder, advancing startUpdateTime from %{public}f to %{public}f", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419350 != -1) {
          dispatch_once(&qword_102419350, &stru_1022B28B0);
        }
        [v12 updateStartTime];
        double v97 = v108;
        if (v73 < v108) {
          double v97 = v73;
        }
        int v110 = 134349312;
        *(void *)v111 = v96;
        *(_WORD *)&v111[8] = 2050;
        *(double *)v112 = v97;
        v98 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v98);
        if (v98 != (char *)buf) {
          free(v98);
        }
        v74 = v102;
      }
      if (v73 < v108)
      {
        [v12 setUpdateStartTime:v73];
LABEL_96:
        char v82 = 0;
        goto LABEL_97;
      }
      [v12 setUpdateStartTime:];
    }
    char v82 = 1;
LABEL_97:
    char *v74 = v82;
    return;
  }
  if (qword_102419350 != -1) {
    dispatch_once(&qword_102419350, &stru_1022B28B0);
  }
  double v21 = off_102419358;
  if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v122) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "DB not accessible, cannot process accel, gyro data", (uint8_t *)&v122, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(&v122, 0x65CuLL);
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    LOWORD(v116) = 0;
    v85 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]", "%s\n", v85);
    if (v85 != (char *)&v122) {
      free(v85);
    }
  }
  *uint64_t v7 = 0;
  [v12 adaptee];
  sub_10043FF9C();
}

- (BOOL)anySubscribedToSensorRecorder
{
  return self->fTremorSubscribed || self->fDyskinesiaSubscribed;
}

- (void)addMonitoringPeriodFrom:(double)a3 until:(double)a4
{
  [(CLHealthAssessmentNotifierAdapter *)self monitorKinesiasStart];
  if (v7 == 0.0
    || ([(CLHealthAssessmentNotifierAdapter *)self monitorKinesiasExpiration], v8 < a3))
  {
    self->_double monitorKinesiasStart = a3;
    uint64_t v9 = sub_1000A6958();
    sub_100163398(v9, @"kMonitorKinesiasStart", &self->_monitorKinesiasStart);
    uint64_t v10 = sub_1000A6958();
    buf[0] = 1;
    sub_1000EA52C(v10, @"kMonitorKinesiasHasData", buf);
  }
  self->_double monitorKinesiasExpiration = a4;
  uint64_t v11 = sub_1000A6958();
  sub_100163398(v11, @"kMonitorKinesiasExpiration", &self->_monitorKinesiasExpiration);
  uint64_t v12 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v12 + 944))();
  if (qword_102419350 != -1) {
    dispatch_once(&qword_102419350, &stru_1022B28B0);
  }
  double v13 = off_102419358;
  if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
  {
    double monitorKinesiasStart = self->_monitorKinesiasStart;
    double monitorKinesiasExpiration = self->_monitorKinesiasExpiration;
    *(_DWORD *)buf = 134349312;
    double v18 = monitorKinesiasStart;
    __int16 v19 = 2050;
    double v20 = monitorKinesiasExpiration;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Updated monitoring period to %{public}f - %{public}f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    double v16 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter addMonitoringPeriodFrom:until:]", "%s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
}

- (void)startUpdatesforAnalyzer:(int)a3
{
  unsigned __int8 v5 = [(CLHealthAssessmentNotifierAdapter *)self anySubscribedToSensorRecorder];
  if (!a3)
  {
    uint64_t v6 = &OBJC_IVAR___CLHealthAssessmentNotifierAdapter_fTremorSubscribed;
    if (v5) {
      goto LABEL_7;
    }
LABEL_6:
    [(CLHealthAssessmentNotifierAdapter *)self updateSensorRecorderSubscription];
    goto LABEL_7;
  }
  if (a3 != 1) {
    return;
  }
  uint64_t v6 = &OBJC_IVAR___CLHealthAssessmentNotifierAdapter_fDyskinesiaSubscribed;
  if ((v5 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
  self->super.CLIntersiloService_opaque[*v6] = 1;
}

- (void)stopMonitoring
{
  [+[NSDate date] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(CLHealthAssessmentNotifierAdapter *)self monitorKinesiasExpiration];
  if (v5 > v4)
  {
    self->_double monitorKinesiasExpiration = v4;
    uint64_t v6 = sub_1000A6958();
    sub_100163398(v6, @"kMonitorKinesiasExpiration", &self->_monitorKinesiasExpiration);
    uint64_t v7 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v7 + 944))();
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    double v8 = off_102419358;
    if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
    {
      double monitorKinesiasStart = self->_monitorKinesiasStart;
      double monitorKinesiasExpiration = self->_monitorKinesiasExpiration;
      *(_DWORD *)buf = 134349312;
      double v13 = monitorKinesiasStart;
      __int16 v14 = 2050;
      double v15 = monitorKinesiasExpiration;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Stop monitoring, set period to %{public}f - %{public}f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter stopMonitoring]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    self->fDyskinesiaSubscribed = 0;
    self->fTremorSubscribed = 0;
    [(CLHealthAssessmentNotifierAdapter *)self updateSensorRecorderSubscription];
  }
}

- (void)syncgetResultReady:(id)a3 ForAnalyzer:(int)a4
{
  uint64_t v6 = [(CLHealthAssessmentNotifierAdapter *)self adaptee];

  sub_100441258((uint64_t)v6, a3, a4);
}

- (void)aggregateRecords
{
  if (sub_100441D1C((uint64_t)[(CLHealthAssessmentNotifierAdapter *)self adaptee]))
  {
    [(CLTimer *)[(CLHealthAssessmentNotifierAdapter *)self fAggregateRecordsTimer] setNextFireDelay:3600.0];
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    double v3 = off_102419358;
    if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
    {
      [(CLTimer *)[(CLHealthAssessmentNotifierAdapter *)self fAggregateRecordsTimer] nextFireTime];
      *(_DWORD *)buf = 134349056;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "fAggregateRecordsTimer.nextFireTime, %{public}f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      [(CLTimer *)[(CLHealthAssessmentNotifierAdapter *)self fAggregateRecordsTimer] nextFireTime];
      double v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter aggregateRecords]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  else
  {
    if (qword_102419350 != -1) {
      dispatch_once(&qword_102419350, &stru_1022B28B0);
    }
    uint64_t v6 = off_102419358;
    if (os_log_type_enabled((os_log_t)off_102419358, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Closing down CLHealthAssessmentNotifier, past timeout period for stored data", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419350 != -1) {
        dispatch_once(&qword_102419350, &stru_1022B28B0);
      }
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLHealthAssessmentNotifierAdapter aggregateRecords]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(CLHealthAssessmentNotifierAdapter *)self teardownService];
  }
}

- (void)setLastProcessedTime:(double)a3
{
  p_double lastProcessedTime = &self->_lastProcessedTime;
  if (self->_lastProcessedTime < a3)
  {
    *p_double lastProcessedTime = a3;
    uint64_t v6 = sub_1000A6958();
    sub_100163398(v6, @"kMonitorKinesiasLastProcessed", p_lastProcessedTime);
    uint64_t v7 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v7 + 944))();
  }
  [(CLHealthAssessmentNotifierAdapter *)self updateStartTime];
  if (v8 < a3) {
    double v8 = a3;
  }

  [(CLHealthAssessmentNotifierAdapter *)self setUpdateStartTime:v8];
}

- (CMSensorRecorder)sensorRecorder
{
  return self->_sensorRecorder;
}

- (void)setSensorRecorder:(id)a3
{
}

- (CLTimer)fSensorRecorderSubscribeTimer
{
  return self->_fSensorRecorderSubscribeTimer;
}

- (void)setFSensorRecorderSubscribeTimer:(id)a3
{
}

- (CLTimer)fSensorRecorderQueryTimer
{
  return self->_fSensorRecorderQueryTimer;
}

- (void)setFSensorRecorderQueryTimer:(id)a3
{
}

- (CLTimer)fAggregateRecordsTimer
{
  return self->_fAggregateRecordsTimer;
}

- (void)setFAggregateRecordsTimer:(id)a3
{
}

- (double)updateStartTime
{
  return self->_updateStartTime;
}

- (void)setUpdateStartTime:(double)a3
{
  self->_updateStartTime = a3;
}

- (double)monitorKinesiasStart
{
  return self->_monitorKinesiasStart;
}

- (void)setMonitorKinesiasStart:(double)a3
{
  self->_double monitorKinesiasStart = a3;
}

- (double)monitorKinesiasExpiration
{
  return self->_monitorKinesiasExpiration;
}

- (void)setMonitorKinesiasExpiration:(double)a3
{
  self->_double monitorKinesiasExpiration = a3;
}

- (double)lastProcessedTime
{
  return self->_lastProcessedTime;
}

- (CLHealthAssessmentChoreaDetectionService)choreaDetectionService
{
  return self->_choreaDetectionService;
}

- (void)setChoreaDetectionService:(id)a3
{
}

- (CLHealthAssessmentTremorDetectionService)tremorDetectionService
{
  return self->_tremorDetectionService;
}

- (void)setTremorDetectionService:(id)a3
{
}

+ (BOOL)isSupported
{
  if (qword_10247AA18 != -1) {
    dispatch_once(&qword_10247AA18, &stru_1022B2770);
  }
  return byte_10247AA10;
}

@end