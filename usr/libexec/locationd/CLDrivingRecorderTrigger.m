@interface CLDrivingRecorderTrigger
- (CLDrivingRecorderTrigger)initWithDelegate:(id)a3 andUniverse:(id)a4;
- (id).cxx_construct;
- (void)cancelDeferredStartTimer;
- (void)dealloc;
- (void)onDeferredStartTimerSpecifyTriggerDelay:(double)a3;
- (void)onDeferredStopTimerShouldPublish:(BOOL)a3;
- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)scheduleStart;
- (void)setupListeners;
- (void)teardownListeners;
@end

@implementation CLDrivingRecorderTrigger

- (CLDrivingRecorderTrigger)initWithDelegate:(id)a3 andUniverse:(id)a4
{
}

- (void)dealloc
{
  [(CLDrivingRecorderTrigger *)self teardownListeners];
  [(CLDrivingRecorderTrigger *)self cancelDeferredStartTimer];
  v3.receiver = self;
  v3.super_class = (Class)CLDrivingRecorderTrigger;
  [(CLRecordingTriggerBase *)&v3 dealloc];
}

- (void)setupListeners
{
  if (self->_enableVehicularNotifications)
  {
    if (qword_1024191B0 != -1) {
      dispatch_once(&qword_1024191B0, &stru_10234E558);
    }
    objc_super v3 = qword_1024191B8;
    if (os_log_type_enabled((os_log_t)qword_1024191B8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Setting up driving recorder trigger listener.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191B0 != -1) {
        dispatch_once(&qword_1024191B0, &stru_10234E558);
      }
      __int16 v7 = 0;
      v4 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger setupListeners]", "%s\n", v4);
      if (v4 != (char *)buf) {
        free(v4);
      }
    }
    v6.receiver = self;
    v6.super_class = (Class)CLDrivingRecorderTrigger;
    [(CLRecordingTriggerBase *)&v6 initializePowerAssertion];
    v5.receiver = self;
    v5.super_class = (Class)CLDrivingRecorderTrigger;
    [(CLRecordingTriggerBase *)&v5 getDelegate];
    sub_10121D8E0();
  }
}

- (void)scheduleStart
{
  if (self->_deferredStartTimer)
  {
    if (qword_1024191B0 != -1) {
      dispatch_once(&qword_1024191B0, &stru_10234E558);
    }
    v2 = qword_1024191B8;
    if (os_log_type_enabled((os_log_t)qword_1024191B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CLDrivingRecorderTrigger:  Deferred start already scheduled.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191B0 != -1) {
        dispatch_once(&qword_1024191B0, &stru_10234E558);
      }
      LOWORD(v13) = 0;
LABEL_19:
      objc_super v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger scheduleStart]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CLDrivingRecorderTrigger;
    if ([(CLRecordingTriggerBase *)&v12 isRecording])
    {
      if (qword_1024191B0 != -1) {
        dispatch_once(&qword_1024191B0, &stru_10234E558);
      }
      v4 = qword_1024191B8;
      if (os_log_type_enabled((os_log_t)qword_1024191B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger:  Unable to schedule start, currently recording", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191B0 != -1) {
          dispatch_once(&qword_1024191B0, &stru_10234E558);
        }
        LOWORD(v13) = 0;
        goto LABEL_19;
      }
    }
    else
    {
      sub_101A1F180(buf, "DrivingRecorderTriggerDeferredStartDurationSeconds", &qword_101E54830, 0);
      double v6 = *(double *)&v16[4];
      if (qword_1024191B0 != -1) {
        dispatch_once(&qword_1024191B0, &stru_10234E558);
      }
      __int16 v7 = qword_1024191B8;
      if (os_log_type_enabled((os_log_t)qword_1024191B8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Scheduling start for %f seconds in the future.", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191B0 != -1) {
          dispatch_once(&qword_1024191B0, &stru_10234E558);
        }
        int v13 = 134217984;
        double v14 = v6;
        v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger scheduleStart]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
      v11.receiver = self;
      v11.super_class = (Class)CLDrivingRecorderTrigger;
      v8 = (CLTimer *)[objc_msgSend(-[CLRecordingTriggerBase getUniverse](&v11, "getUniverse"), "silo") newTimer];
      self->_deferredStartTimer = v8;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_101A4E82C;
      v10[3] = &unk_1022A56E0;
      v10[4] = self;
      *(double *)&v10[5] = v6;
      [(CLTimer *)v8 setHandler:v10];
      [(CLTimer *)self->_deferredStartTimer setNextFireDelay:v6 interval:v6];
    }
  }
}

- (void)cancelDeferredStartTimer
{
  self->_deferredStartTimer = 0;
}

- (void)teardownListeners
{
  if (qword_1024191B0 != -1) {
    dispatch_once(&qword_1024191B0, &stru_10234E558);
  }
  objc_super v3 = qword_1024191B8;
  if (os_log_type_enabled((os_log_t)qword_1024191B8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Tearing down driving recorder trigger listener.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191B0 != -1) {
      dispatch_once(&qword_1024191B0, &stru_10234E558);
    }
    objc_super v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger teardownListeners]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  value = self->_motionStateObserverClient.__ptr_.__value_;
  self->_motionStateObserverClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
}

- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (self->_enableVehicularNotifications)
  {
    if (*((_DWORD *)a4 + 3) == 4)
    {
      if (!self->_deferredStartTimer)
      {
        v9.receiver = self;
        v9.super_class = (Class)CLDrivingRecorderTrigger;
        if (![(CLRecordingTriggerBase *)&v9 getDeferredStopTimer])
        {
          if (qword_1024191B0 != -1) {
            dispatch_once(&qword_1024191B0, &stru_10234E558);
          }
          objc_super v5 = qword_1024191B8;
          if (os_log_type_enabled((os_log_t)qword_1024191B8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Received high confidence driving notification.", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191B0 != -1) {
              dispatch_once(&qword_1024191B0, &stru_10234E558);
            }
            v8 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger onMotionStateObserverNotification:data:]", "%s\n", v8);
            if (v8 != (char *)buf) {
              free(v8);
            }
          }
          [(CLDrivingRecorderTrigger *)self scheduleStart];
        }
      }
    }
    else
    {
      if (qword_1024191B0 != -1) {
        dispatch_once(&qword_1024191B0, &stru_10234E558);
      }
      double v6 = qword_1024191B8;
      if (os_log_type_enabled((os_log_t)qword_1024191B8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLDrivingRecorderTrigger: Received low confidence driving notification.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191B0 != -1) {
          dispatch_once(&qword_1024191B0, &stru_10234E558);
        }
        __int16 v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLDrivingRecorderTrigger onMotionStateObserverNotification:data:]", "%s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
      }
      [(CLDrivingRecorderTrigger *)self cancelDeferredStartTimer];
      [(CLDrivingRecorderTrigger *)self onDeferredStopTimerShouldPublish:1];
    }
  }
}

- (void)onDeferredStartTimerSpecifyTriggerDelay:(double)a3
{
  [(CLDrivingRecorderTrigger *)self cancelDeferredStartTimer];
  memset(out, 0, sizeof(out));
  uuid_generate_random(out);
  v12.receiver = self;
  v12.super_class = (Class)CLDrivingRecorderTrigger;
  objc_super v5 = [(CLRecordingTriggerBase *)&v12 getSettings];
  uint64_t v6 = sub_101A213E0((uint64_t)v5);
  memset(v13, 0, sizeof(v13));
  v11.receiver = self;
  v11.super_class = (Class)CLDrivingRecorderTrigger;
  [(CLRecordingTriggerBase *)&v11 startRecordingSpecifyTriggerDelay:0 powerSaveMode:v6 maxFileCount:v13 extraStartInfo:a3];
  sub_101A1F180(v9, "DrivingRecorderTriggerDeferredStopDurationSeconds", &qword_101E54838, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101A4EEB8;
  v8[3] = &unk_10229FED8;
  v8[4] = self;
  v7.receiver = self;
  v7.super_class = (Class)CLDrivingRecorderTrigger;
  [(CLRecordingTriggerBase *)&v7 scheduleStop:v8 withHandler:v10];
}

- (void)onDeferredStopTimerShouldPublish:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CLDrivingRecorderTrigger;
  [(CLRecordingTriggerBase *)&v6 cancelDeferredStopTimer];
  v5.receiver = self;
  v5.super_class = (Class)CLDrivingRecorderTrigger;
  [(CLRecordingTriggerBase *)&v5 stopRecordingShouldPublish:v3];
}

- (void).cxx_destruct
{
  value = self->_motionStateObserverClient.__ptr_.__value_;
  self->_motionStateObserverClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  return self;
}

@end