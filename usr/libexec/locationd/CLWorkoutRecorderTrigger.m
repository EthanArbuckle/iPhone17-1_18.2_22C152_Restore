@interface CLWorkoutRecorderTrigger
- (BOOL)valid;
- (CLWorkoutRecorderTrigger)initWithDelegate:(id)a3 andUniverse:(id)a4;
- (id).cxx_construct;
- (unsigned)getMaxFileCountForRecording:(BOOL)a3;
- (void)dealloc;
- (void)onDeferredStopTimerShouldPublish:(BOOL)a3;
- (void)onDeferredStopTimerShouldPublish:(BOOL)a3 recordSubsequentSession:(BOOL)a4 isMultiSportSession:(BOOL)a5 withEvent:(WorkoutEvent *)a6 triggerDelay:(double)a7;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onWorkoutSessionUpdate:(WorkoutEvent *)a3 withOverview:(id)a4 andPriors:(id)a5;
- (void)setValid:(BOOL)a3;
- (void)setupListeners;
- (void)teardownListeners;
@end

@implementation CLWorkoutRecorderTrigger

- (CLWorkoutRecorderTrigger)initWithDelegate:(id)a3 andUniverse:(id)a4
{
  self->_valid = 0;
  self->_active_recording = 0;
  operator new();
}

- (void)dealloc
{
  self->_valid = 0;
  [(CLWorkoutRecorderTrigger *)self teardownListeners];
  v3.receiver = self;
  v3.super_class = (Class)CLWorkoutRecorderTrigger;
  [(CLRecordingTriggerBase *)&v3 dealloc];
}

- (void)setupListeners
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D5D8);
  }
  objc_super v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: Setting up workout recorder trigger listener.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D5D8);
    }
    __int16 v7 = 0;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger setupListeners]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CLWorkoutRecorderTrigger;
  [(CLRecordingTriggerBase *)&v6 initializePowerAssertion];
  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutRecorderTrigger;
  [(CLRecordingTriggerBase *)&v5 getDelegate];
  sub_1006A564C();
}

- (void)teardownListeners
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D5D8);
  }
  objc_super v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: Tearing down workout recorder trigger listener.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D5D8);
    }
    objc_super v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger teardownListeners]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  value = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  [(CLMotionStateMediatorProtocol *)self->_motionStateMediatorProtocol unregisterForWorkoutSessionUpdates:self];

  self->_motionStateMediatorProtocol = 0;
}

- (void)onMotionStateObserverNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*(double *)a4 == 1.79769313e308)
  {
    if (self->_active_recording)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D5D8);
      }
      objc_super v5 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: onMotionStateObserverNotification: Stop recording signal.", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D5D8);
        }
        __int16 v15 = 0;
        v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onMotionStateObserverNotification:data:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
      [(CLWorkoutRecorderTrigger *)self onDeferredStopTimerShouldPublish:1];
      self->_active_recording = 0;
    }
  }
  else
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D5D8);
    }
    __int16 v7 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: onMotionStateObserverNotification: Start recording signal.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D5D8);
      }
      __int16 v15 = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onMotionStateObserverNotification:data:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    if (!self->_active_recording)
    {
      self->_active_recording = 1;
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v18 = 1;
      *((void *)&v18 + 1) = +[CMWorkout CMWorkoutTypeFromCLMotionActivityType:*((unsigned int *)a4 + 2)];
      uuid_copy(buf, (const unsigned __int8 *)a4 + 20);
      BOOL isWorkoutPowerSaveModeEnabled = self->_isWorkoutPowerSaveModeEnabled;
      v14.receiver = self;
      v14.super_class = (Class)CLWorkoutRecorderTrigger;
      v9 = [(CLRecordingTriggerBase *)&v14 getSettings];
      uint64_t v10 = sub_101A213E0((uint64_t)v9);
      v16[0] = *(_OWORD *)buf;
      v16[1] = v18;
      v13.receiver = self;
      v13.super_class = (Class)CLWorkoutRecorderTrigger;
      [(CLRecordingTriggerBase *)&v13 startRecordingSpecifyTriggerDelay:isWorkoutPowerSaveModeEnabled powerSaveMode:v10 maxFileCount:v16 extraStartInfo:0.0];
    }
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  long long v8 = *((_OWORD *)a4 + 13);
  long long v42 = *((_OWORD *)a4 + 12);
  long long v43 = v8;
  uint64_t v44 = *((void *)a4 + 28);
  long long v9 = *((_OWORD *)a4 + 9);
  long long v38 = *((_OWORD *)a4 + 8);
  long long v39 = v9;
  long long v10 = *((_OWORD *)a4 + 10);
  long long v41 = *((_OWORD *)a4 + 11);
  long long v40 = v10;
  long long v11 = *((_OWORD *)a4 + 5);
  v36[0] = *((_OWORD *)a4 + 4);
  v36[1] = v11;
  long long v12 = *((_OWORD *)a4 + 6);
  long long v37 = *((_OWORD *)a4 + 7);
  v36[2] = v12;
  long long v13 = *((_OWORD *)a4 + 1);
  long long v32 = *(_OWORD *)a4;
  long long v33 = v13;
  long long v14 = *((_OWORD *)a4 + 2);
  long long v35 = *((_OWORD *)a4 + 3);
  long long v34 = v14;
  switch((void)v33)
  {
    case 0x13:
      self->_BOOL isWorkoutPowerSaveModeEnabled = v44 == 1;
      v23.receiver = self;
      v23.super_class = (Class)CLWorkoutRecorderTrigger;
      -[CLRecordingTriggerBase setPowerSaveMode:](&v23, "setPowerSaveMode:");
      break;
    case 0xALL:
      v24.receiver = self;
      v24.super_class = (Class)CLWorkoutRecorderTrigger;
      if (![(CLRecordingTriggerBase *)&v24 getDeferredStopTimer])
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D5D8);
        }
        v20 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: Received an AP de-escalation.", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234D5D8);
          }
          __int16 v27 = 0;
          v22 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onMotionStateMediatorNotification:data:]", "%s\n", v22);
          if (v22 != (char *)buf) {
            free(v22);
          }
        }
        sub_100103240();
        [(CLWorkoutRecorderTrigger *)self onDeferredStopTimerShouldPublish:sub_10073E30C()];
      }
      break;
    case 8:
      v28.receiver = self;
      v28.super_class = (Class)CLWorkoutRecorderTrigger;
      if (![(CLRecordingTriggerBase *)&v28 getDeferredStopTimer])
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D5D8);
        }
        v16 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorderTrigger: Received an AP escalation.", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234D5D8);
          }
          __int16 v27 = 0;
          v21 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onMotionStateMediatorNotification:data:]", "%s\n", v21);
          if (v21 != (char *)buf) {
            free(v21);
          }
        }
        uuid_copy(self->_workoutSession, (const unsigned __int8 *)v36);
        memset(buf, 0, sizeof(buf));
        *(void *)&long long v31 = 0;
        *((void *)&v31 + 1) = v37;
        uuid_copy(buf, (const unsigned __int8 *)a4 + 96);
        BOOL isWorkoutPowerSaveModeEnabled = self->_isWorkoutPowerSaveModeEnabled;
        v26.receiver = self;
        v26.super_class = (Class)CLWorkoutRecorderTrigger;
        long long v18 = [(CLRecordingTriggerBase *)&v26 getSettings];
        uint64_t v19 = sub_101A213E0((uint64_t)v18);
        v29[0] = *(_OWORD *)buf;
        v29[1] = v31;
        v25.receiver = self;
        v25.super_class = (Class)CLWorkoutRecorderTrigger;
        [(CLRecordingTriggerBase *)&v25 startRecordingSpecifyTriggerDelay:isWorkoutPowerSaveModeEnabled powerSaveMode:v19 maxFileCount:v29 extraStartInfo:0.0];
      }
      break;
  }
}

- (void)onDeferredStopTimerShouldPublish:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CLWorkoutRecorderTrigger;
  [(CLRecordingTriggerBase *)&v6 cancelDeferredStopTimer];
  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutRecorderTrigger;
  [(CLRecordingTriggerBase *)&v5 stopRecordingShouldPublish:v3];
  uuid_clear(self->_workoutSession);
  self->_BOOL isWorkoutPowerSaveModeEnabled = 0;
}

- (void)onDeferredStopTimerShouldPublish:(BOOL)a3 recordSubsequentSession:(BOOL)a4 isMultiSportSession:(BOOL)a5 withEvent:(WorkoutEvent *)a6 triggerDelay:(double)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  [(CLWorkoutRecorderTrigger *)self onDeferredStopTimerShouldPublish:a3];
  if (v10)
  {
    uuid_copy(self->_workoutSession, a6->var5.var0);
    self->_BOOL isWorkoutPowerSaveModeEnabled = a6->var5.var7 == 1;
    uint64_t v12 = [(CLWorkoutRecorderTrigger *)self getMaxFileCountForRecording:v9];
    memset(dst, 0, sizeof(dst));
    int64_t var3 = a6->var5.var3;
    *(void *)&long long v18 = 0;
    *((void *)&v18 + 1) = var3;
    uuid_copy(dst, a6->var5.var2);
    BOOL isWorkoutPowerSaveModeEnabled = self->_isWorkoutPowerSaveModeEnabled;
    v16[0] = *(_OWORD *)dst;
    v16[1] = v18;
    v15.receiver = self;
    v15.super_class = (Class)CLWorkoutRecorderTrigger;
    [(CLRecordingTriggerBase *)&v15 startRecordingSpecifyTriggerDelay:isWorkoutPowerSaveModeEnabled powerSaveMode:v12 maxFileCount:v16 extraStartInfo:a7];
  }
}

- (void)onWorkoutSessionUpdate:(WorkoutEvent *)a3 withOverview:(id)a4 andPriors:(id)a5
{
  int64_t var2 = a3->var2;
  if (var2 == 15)
  {
    v34.receiver = self;
    v34.super_class = (Class)CLWorkoutRecorderTrigger;
    if ([(CLRecordingTriggerBase *)&v34 getDeferredStopTimer])
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D5D8);
      }
      v20 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorderTrigger: Canceling and restarting deferred stop - user ended workout during deferred stop.", (uint8_t *)&buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(&buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D5D8);
        }
        LOWORD(v65[0]) = 0;
        __int16 v27 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onWorkoutSessionUpdate:withOverview:andPriors:]", "%s\n", v27);
        if (v27 != (char *)&buf) {
          free(v27);
        }
      }
      v33.receiver = self;
      v33.super_class = (Class)CLWorkoutRecorderTrigger;
      [(CLRecordingTriggerBase *)&v33 cancelDeferredStopTimer];
    }
    sub_101A1F180((unsigned __int8 *)&buf, "WorkoutRecorderTriggerStopEventDeferredStopDurationSeconds", &qword_101E544A0, 0);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_101A2745C;
    v32[3] = &unk_10229FED8;
    v32[4] = self;
    v31.receiver = self;
    v31.super_class = (Class)CLWorkoutRecorderTrigger;
    [(CLRecordingTriggerBase *)&v31 scheduleStop:v32 withHandler:*((double *)&buf + 1)];
  }
  else if (var2 == 13)
  {
    (*((void (**)(void *__return_ptr, id, SEL))a5 + 2))(v65, a5, a2);
    unint64_t v8 = v68;
    BOOL v9 = v68 > 1;
    if (uuid_compare(self->_workoutSession, a3->var5.var0))
    {
      uuid_copy(self->_workoutSession, a3->var5.var0);
      self->_BOOL isWorkoutPowerSaveModeEnabled = a3->var5.var7 == 1;
      v39.receiver = self;
      v39.super_class = (Class)CLWorkoutRecorderTrigger;
      if ([(CLRecordingTriggerBase *)&v39 getDeferredStopTimer])
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D5D8);
        }
        BOOL v10 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorderTrigger: Canceling and restarting deferred stop - user started new workout during deferred stop.", (uint8_t *)&buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234D5D8);
          }
          __int16 v41 = 0;
          objc_super v28 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onWorkoutSessionUpdate:withOverview:andPriors:]", "%s\n", v28);
          if (v28 != (char *)&buf) {
            free(v28);
          }
        }
        v38.receiver = self;
        v38.super_class = (Class)CLWorkoutRecorderTrigger;
        [(CLRecordingTriggerBase *)&v38 cancelDeferredStopTimer];
        sub_101A1F180((unsigned __int8 *)&buf, "WorkoutRecorderTriggerStartEventDeferredStopDurationSeconds", &qword_101E54490, 0);
        double v11 = *((double *)&buf + 1);
        sub_10006ACBC((unsigned __int8 *)&buf, "WorkoutRecorderTriggerShouldRecordConsecutiveWorkouts", byte_101E54498, 0);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        long long v12 = *(_OWORD *)&a3->var5.var6.var1[15];
        long long v56 = *(_OWORD *)&a3->var5.var6.var1[31];
        long long v13 = *(_OWORD *)&a3->var5.var6.var1[63];
        long long v57 = *(_OWORD *)&a3->var5.var6.var1[47];
        long long v58 = v13;
        long long v14 = *(_OWORD *)a3->var5.var2;
        long long v52 = *(_OWORD *)&a3->var5.var3;
        long long v15 = *(_OWORD *)&a3->var5.var6.var0;
        WorkoutAttrib var5 = a3->var5.var5;
        long long v54 = v15;
        long long v55 = v12;
        long long v16 = *(_OWORD *)&a3->var4.var0;
        long long v48 = *(_OWORD *)&a3->var4.var2;
        long long v17 = *(_OWORD *)a3->var5.var1;
        long long v49 = *(_OWORD *)a3->var5.var0;
        long long v50 = v17;
        long long v51 = v14;
        long long v18 = *(_OWORD *)&a3->var2;
        long long v45 = *(_OWORD *)&a3->var0;
        long long v46 = v18;
        v44[2] = sub_101A27354;
        v44[3] = &unk_10234D5B8;
        char v61 = BYTE1(buf);
        BOOL v62 = v9;
        unint64_t var7 = a3->var5.var7;
        v44[4] = self;
        unint64_t v59 = var7;
        long long v47 = v16;
        double v60 = v11;
        v37.receiver = self;
        v37.super_class = (Class)CLWorkoutRecorderTrigger;
        [(CLRecordingTriggerBase *)&v37 scheduleStop:v44 withHandler:v11];
      }
      else
      {
        uint64_t v22 = [(CLWorkoutRecorderTrigger *)self getMaxFileCountForRecording:v8 > 1];
        long long buf = 0uLL;
        int64_t var3 = a3->var5.var3;
        *(void *)&long long v64 = 0;
        *((void *)&v64 + 1) = var3;
        uuid_copy((unsigned __int8 *)&buf, a3->var5.var2);
        BOOL isWorkoutPowerSaveModeEnabled = self->_isWorkoutPowerSaveModeEnabled;
        v43[0] = buf;
        v43[1] = v64;
        v36.receiver = self;
        v36.super_class = (Class)CLWorkoutRecorderTrigger;
        [(CLRecordingTriggerBase *)&v36 startRecordingSpecifyTriggerDelay:isWorkoutPowerSaveModeEnabled powerSaveMode:v22 maxFileCount:v43 extraStartInfo:0.0];
        v35.receiver = self;
        v35.super_class = (Class)CLWorkoutRecorderTrigger;
        objc_super v25 = *[(CLRecordingTriggerBase *)&v35 getRecording];
        if (v25) {
          [v25 recordWorkoutSessionPriors:v65];
        }
      }
    }
    else
    {
      v42.receiver = self;
      v42.super_class = (Class)CLWorkoutRecorderTrigger;
      if ([(CLRecordingTriggerBase *)&v42 getDeferredStopTimer])
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D5D8);
        }
        v21 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorderTrigger: Canceling deferred stop - user resumed current workout.", (uint8_t *)&buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(&buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234D5D8);
          }
          __int16 v41 = 0;
          v29 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorderTrigger onWorkoutSessionUpdate:withOverview:andPriors:]", "%s\n", v29);
          if (v29 != (char *)&buf) {
            free(v29);
          }
        }
        v40.receiver = self;
        v40.super_class = (Class)CLWorkoutRecorderTrigger;
        [(CLRecordingTriggerBase *)&v40 cancelDeferredStopTimer];
      }
    }
    sub_1004F6960(v67);
    if (v66 < 0) {
      operator delete((void *)v65[2]);
    }
  }
  v30.receiver = self;
  v30.super_class = (Class)CLWorkoutRecorderTrigger;
  objc_super v26 = *[(CLRecordingTriggerBase *)&v30 getRecording];
  if (v26) {
    [v26 recordWorkoutSessionEvent:a3];
  }
}

- (unsigned)getMaxFileCountForRecording:(BOOL)a3
{
  BOOL v3 = a3;
  sub_100103240();
  if (sub_10073E30C() && v3)
  {
    sub_101A21DA8(v8, "WorkoutRecorderTriggerMaxFileCountForMultiSportWorkouts", &dword_101E544A8, 0);
    return v9;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CLWorkoutRecorderTrigger;
    objc_super v6 = [(CLRecordingTriggerBase *)&v7 getSettings];
    return sub_101A213E0((uint64_t)v6);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  value = self->_motionStateObserverClient.__ptr_.__value_;
  self->_motionStateObserverClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  v4 = self->_motionStateMediatorClient.__ptr_.__value_;
  self->_motionStateMediatorClient.__ptr_.__value_ = 0;
  if (v4)
  {
    objc_super v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 15) = 0;
  return self;
}

@end