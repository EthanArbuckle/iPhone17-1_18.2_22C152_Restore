@interface CLRecordingTriggerBase
- (BOOL)isRecording;
- (CLRecordingSettings)getSettings;
- (CLRecordingTriggerBase)initWithDelegate:(id)a3 universe:(id)a4 andSettings:()unique_ptr<CLRecordingSettings;
- (id).cxx_construct;
- (id)getDeferredStopTimer;
- (id)getDelegate;
- (id)getRecording;
- (id)getUniverse;
- (void)cancelDeferredStopTimer;
- (void)dealloc;
- (void)feedWeatherData:(id)a3;
- (void)feedWorkoutEffortEstimate:(const Result *)a3;
- (void)handlePublisherResponse:(id)a3;
- (void)initializePowerAssertion;
- (void)publishRecording;
- (void)releasePowerAssertion:(id)a3;
- (void)scheduleStop:(double)a3 withHandler:(id)a4;
- (void)setPowerSaveMode:(BOOL)a3;
- (void)startRecordingSpecifyTriggerDelay:(double)a3 powerSaveMode:(BOOL)a4 maxFileCount:(unsigned int)a5 extraStartInfo:(WatchStartInfo *)a6;
- (void)stopRecordingShouldPublish:(BOOL)a3;
- (void)takePower;
- (void)takePowerAndScheduleRelease:(double)a3;
@end

@implementation CLRecordingTriggerBase

- (CLRecordingTriggerBase)initWithDelegate:(id)a3 universe:(id)a4 andSettings:()unique_ptr<CLRecordingSettings
{
  v14.receiver = self;
  v14.super_class = (Class)CLRecordingTriggerBase;
  v8 = [(CLRecordingTriggerBase *)&v14 init];
  if (v8)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v9 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: Initializing CLRecordingTriggerBase instance", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase initWithDelegate:universe:andSettings:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    v8->_delegate = (CLRecordingTriggerDelegate *)a3;
    v8->_universe = (CLIntersiloUniverse *)a4;
    var0 = a5.__ptr_.__value_->var0;
    a5.__ptr_.__value_->var0 = 0;
    value = v8->_settings.__ptr_.__value_;
    v8->_settings.__ptr_.__value_ = (CLRecordingSettings *)var0;
    if (value) {
      (*((void (**)(CLRecordingSettings *))value->var0 + 1))(value);
    }
    v8->_publisher = 0;
    v8->_workoutStartedOnWatch = 1;
  }
  return v8;
}

- (void)dealloc
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D590);
  }
  v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: dealloc", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    __int16 v7 = 0;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase dealloc]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }

  self->_publisher = 0;
  self->_delegate = 0;
  value = self->_powerAssertion.__ptr_.__value_;
  self->_powerAssertion.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(CLPowerAssertion *))(*(void *)value + 8))(value);
  }

  self->_recording = 0;
  [(CLRecordingTriggerBase *)self cancelDeferredStopTimer];
  v6.receiver = self;
  v6.super_class = (Class)CLRecordingTriggerBase;
  [(CLRecordingTriggerBase *)&v6 dealloc];
}

- (void)initializePowerAssertion
{
  (*((void (**)(void **__return_ptr))self->_settings.__ptr_.__value_->var0 + 5))(&__p);
  operator new();
}

- (void)startRecordingSpecifyTriggerDelay:(double)a3 powerSaveMode:(BOOL)a4 maxFileCount:(unsigned int)a5 extraStartInfo:(WatchStartInfo *)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v29 = a4;
  p_recording = (id *)&self->_recording;
  p_settings = &self->_settings;
  if (![(CLRecordingTriggerDelegate *)self->_delegate canStartRecording:&self->_recording settings:&self->_settings publisher:self->_publisher])return; {
  self->_workoutStartedOnWatch = a6->var1;
  }
  self->_transaction = [[CLOSTransaction alloc] initWithDescription:"WorkoutRecorder.CLRecordingTriggerBase"];
  id v12 = [[CLWorkoutModuleFactory alloc] initFor:1];
  v13 = [[CLWorkoutModuleSettings alloc] initWith:&self->_settings];
  objc_super v14 = v13;
  long long v15 = *(_OWORD *)&a6->var1;
  v44[0] = *(_OWORD *)a6->var0;
  v44[1] = v15;
  if (v13)
  {
    [(CLWorkoutModuleSettings *)v13 getStructSetting:v44];
    delegate = self->_delegate;
    universe = self->_universe;
    long long v34 = v47;
    long long v35 = v48;
    long long v36 = v49;
    long long v37 = v50;
    long long v32 = v45;
    long long v33 = v46;
    if ((v52[7] & 0x80000000) != 0)
    {
      sub_1000DC48C(&__p, __src[0], (unint64_t)__src[1]);
      goto LABEL_8;
    }
  }
  else
  {
    memset(v52, 0, sizeof(v52));
    *(_OWORD *)__src = 0u;
    long long v50 = 0u;
    long long v49 = 0u;
    long long v48 = 0u;
    long long v47 = 0u;
    long long v46 = 0u;
    long long v45 = 0u;
    delegate = self->_delegate;
    universe = self->_universe;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
  }
  long long __p = *(_OWORD *)__src;
  uint64_t v39 = *(void *)v52;
LABEL_8:
  long long v40 = *(_OWORD *)&v52[8];
  long long v41 = *(_OWORD *)&v52[24];
  long long v42 = *(_OWORD *)&v52[40];
  long long v43 = *(_OWORD *)&v52[56];
  id v18 = [v12 generateTheRecording:delegate universe:universe settings:&v32];
  id *p_recording = v18;
  if (SHIBYTE(v39) < 0)
  {
    operator delete((void *)__p);
    id v18 = *p_recording;
  }
  if (objc_msgSend(v18, "start:recentLocation:triggerDelay:recentWeatherData:maxFileCount:", -[CLRecordingTriggerDelegate getWorkingDirectory](self->_delegate, "getWorkingDirectory"), -[CLRecordingTriggerDelegate getRecentLocation](self->_delegate, "getRecentLocation"), -[CLRecordingTriggerDelegate getRecentWeatherData](self->_delegate, "getRecentWeatherData"), v7, a3))
  {

    if (a6->var1)
    {
      uint64_t v19 = (*((uint64_t (**)(void))p_settings->__ptr_.__value_->var0 + 8))();
      float v20 = *(float *)&v19;
      if ((v19 & 0xFF00000000) != 0)
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D590);
        }
        float v21 = v20;
        v22 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v31 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase, Power assertion for %f seconds", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234D590);
          }
          double v23 = v21;
          v27 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:]", "%s\n", v27);
          if (v27 != (char *)buf) {
            free(v27);
          }
        }
        else
        {
          double v23 = v21;
        }
        [(CLRecordingTriggerBase *)self takePowerAndScheduleRelease:v23];
      }
      else
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D590);
        }
        v25 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase, Power Assertion time not found in recording settings, will not take power", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234D590);
          }
          v28 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:]", "%s\n", v28);
          if (v28 != (char *)buf) {
            free(v28);
          }
        }
      }
    }
    else
    {
      [(CLRecordingTriggerBase *)self setPowerSaveMode:v29];
    }
  }
  else
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v24 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "CLRecordingTriggerBase: Unable to start recording, releasing CLWorkoutRecording, CLWorkoutModuleSettings, and CLOSTransaction pointers", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      v26 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLRecordingTriggerBase startRecordingSpecifyTriggerDelay:powerSaveMode:maxFileCount:extraStartInfo:]", "%s\n", v26);
      if (v26 != (char *)buf) {
        free(v26);
      }
    }

    self->_recording = 0;
    self->_transaction = 0;
  }
  if ((v52[7] & 0x80000000) != 0) {
    operator delete(__src[0]);
  }
}

- (void)scheduleStop:(double)a3 withHandler:(id)a4
{
  if (self->_deferredStopTimer)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v4 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: scheduleStop, Deferred stop already created and scheduled.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      LOWORD(v16) = 0;
LABEL_10:
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase scheduleStop:withHandler:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  else if (self->_recording)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v9 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: scheduleStop, Scheduling stop for %f seconds in the future.", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      int v16 = 134217984;
      double v17 = a3;
      objc_super v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase scheduleStop:withHandler:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    v10 = (OS_dispatch_source *)[objc_msgSend(-[CLRecordingTriggerDelegate silo](self->_delegate, "silo"), "queue") dispatch_source_create:(dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0];
    self->_deferredStopTimer = v10;
    dispatch_time_t v11 = dispatch_time(0, (unint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v10, v11, (unint64_t)(a3 * 1000000000.0), 0);
    deferredStopTimer = self->_deferredStopTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_101A24054;
    handler[3] = &unk_1022F5FB0;
    handler[4] = deferredStopTimer;
    handler[5] = self;
    handler[6] = a4;
    dispatch_source_set_event_handler(deferredStopTimer, handler);
    dispatch_resume((dispatch_object_t)self->_deferredStopTimer);
  }
  else
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v13 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: scheduleStop, Unable to create deferred stop timer, not currently recording.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      LOWORD(v16) = 0;
      goto LABEL_10;
    }
  }
}

- (void)setPowerSaveMode:(BOOL)a3
{
  if (a3 || !self->_recording)
  {
    [(CLRecordingTriggerBase *)self releasePowerAssertion:@"Set Power save mode."];
  }
  else
  {
    if (*((int *)self->_powerAssertion.__ptr_.__value_ + 2) >= 1)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      v3 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289539;
        int v7 = 0;
        __int16 v8 = 2082;
        v9 = "";
        __int16 v10 = 2082;
        dispatch_time_t v11 = "assert";
        __int16 v12 = 2081;
        v13 = "!_powerAssertion->isPowerAssertionTaken()";
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"How did we have an assertion if we weren't recording?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D590);
        }
      }
      v4 = qword_102419198;
      if (os_signpost_enabled((os_log_t)qword_102419198))
      {
        *(_DWORD *)buf = 68289539;
        int v7 = 0;
        __int16 v8 = 2082;
        v9 = "";
        __int16 v10 = 2082;
        dispatch_time_t v11 = "assert";
        __int16 v12 = 2081;
        v13 = "!_powerAssertion->isPowerAssertionTaken()";
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "How did we have an assertion if we weren't recording?", "{\"msg%{public}.0s\":\"How did we have an assertion if we weren't recording?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D590);
        }
      }
      v5 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289539;
        int v7 = 0;
        __int16 v8 = 2082;
        v9 = "";
        __int16 v10 = 2082;
        dispatch_time_t v11 = "assert";
        __int16 v12 = 2081;
        v13 = "!_powerAssertion->isPowerAssertionTaken()";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"How did we have an assertion if we weren't recording?\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      }
      abort_report_np();
    }
    [(CLRecordingTriggerBase *)self takePower];
  }
}

- (void)feedWeatherData:(id)a3
{
  recording = self->_recording;
  if (recording) {
    [(CLWorkoutRecording *)recording recordWeatherData:a3];
  }
}

- (void)feedWorkoutEffortEstimate:(const Result *)a3
{
  recording = self->_recording;
  if (recording) {
    [(CLWorkoutRecording *)recording recordWorkoutEffort:a3];
  }
}

- (void)cancelDeferredStopTimer
{
  deferredStopTimer = self->_deferredStopTimer;
  if (deferredStopTimer)
  {
    dispatch_source_cancel(deferredStopTimer);
    dispatch_release((dispatch_object_t)self->_deferredStopTimer);
    self->_deferredStopTimer = 0;
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v4 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: cancelDeferredStopTimer", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase cancelDeferredStopTimer]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (void)stopRecordingShouldPublish:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D590);
  }
  v5 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: Stopping Recording", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase stopRecordingShouldPublish:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  recording = self->_recording;
  if (recording)
  {
    [(CLWorkoutRecording *)recording stop];
    if (v3)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      int v7 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: Publishing Recording", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D590);
        }
        dispatch_time_t v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase stopRecordingShouldPublish:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
      [(CLRecordingTriggerBase *)self publishRecording];
    }
    else
    {

      self->_recording = 0;
    }
  }

  self->_transaction = 0;
  if (self->_workoutStartedOnWatch)
  {
    if (*((int *)self->_powerAssertion.__ptr_.__value_ + 2) < 1) {
      return;
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    __int16 v8 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: Workout ended before deferred timer limit, releasing power", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      __int16 v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase stopRecordingShouldPublish:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  [(CLRecordingTriggerBase *)self releasePowerAssertion:@"CLRecordingTriggerBase stop recording should publish."];
}

- (void)publishRecording
{
  publisher = self->_publisher;
  if (!publisher)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v4 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: publishRecording, creating publisher", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      __int16 v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase publishRecording]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    publisher = [[CLWorkoutRecorderPublisher alloc] initWithDelegate:self->_delegate settings:&self->_settings];
    self->_publisher = publisher;
  }
  p_recording = &self->_recording;
  if ([(CLRecordingTriggerDelegate *)self->_delegate didPublishRecording:&self->_recording settings:&self->_settings publisher:publisher])
  {
    [(CLWorkoutRecording *)*p_recording cleanup];

    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    objc_super v6 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: publishRecording, done with publishing releasing CLWorkoutRecording ptr", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D590);
      }
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase publishRecording]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    id *p_recording = 0;
  }
}

- (void)handlePublisherResponse:(id)a3
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D590);
  }
  v5 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLRecordingTriggerBase: handlePublisherResponse", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    __int16 v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase handlePublisherResponse:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  id v6 = [a3 objectForKey:[NSString stringWithUTF8String:((*((uint64_t (**)(CLRecordingSettings *))self->_settings.__ptr_.__value_->var0 + 7))(self->_settings.__ptr_.__value_))]];
  [v6 doubleValue];
  if (!v6
    || (double v8 = v7,
        value = self->_settings.__ptr_.__value_,
        (*((double (**)(CLRecordingSettings *))value->var0 + 25))(value) > v7)
    || (*((double (**)(CLRecordingSettings *))value->var0 + 24))(value) < v8)
  {
    sub_101A21A34((uint64_t)self->_settings.__ptr_.__value_);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    __int16 v10 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: handlePublisherResponse,clearing sampling rate", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1)
    {
LABEL_27:
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase handlePublisherResponse:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
      return;
    }
LABEL_29:
    dispatch_once(&qword_102419190, &stru_10234D590);
    goto LABEL_27;
  }
  sub_101A217FC((uint64_t)self->_settings.__ptr_.__value_, v8);
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D590);
  }
  dispatch_time_t v11 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: handlePublisherResponse, setting sampling rate to %f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1) {
      goto LABEL_27;
    }
    goto LABEL_29;
  }
}

- (id)getDelegate
{
  return self->_delegate;
}

- (id)getUniverse
{
  return self->_universe;
}

- (id)getDeferredStopTimer
{
  return self->_deferredStopTimer;
}

- (BOOL)isRecording
{
  return self->_recording != 0;
}

- (id)getRecording
{
  return (id *)&self->_recording;
}

- (CLRecordingSettings)getSettings
{
  return self->_settings.__ptr_.__value_;
}

- (void)releasePowerAssertion:(id)a3
{
  sub_100EBC6AC((uint64_t)self->_powerAssertion.__ptr_.__value_);
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D590);
  }
  v4 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: releasePowerAssertion, Power is released in:%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    [a3 UTF8String];
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase releasePowerAssertion:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
}

- (void)takePower
{
  value = self->_powerAssertion.__ptr_.__value_;
  sub_100134750(__p, "none");
  sub_100EBBFD8((uint64_t)value, (uint64_t *)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D590);
  }
  BOOL v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CLRecordingTriggerBase: Power is taken", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D590);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRecordingTriggerBase takePower]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)takePowerAndScheduleRelease:(double)a3
{
  [(CLRecordingTriggerBase *)self takePower];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_101A25564;
  v5[3] = &unk_10229FED8;
  v5[4] = self;
  [(CLRecordingTriggerBase *)self scheduleStop:v5 withHandler:a3];
}

- (void).cxx_destruct
{
  value = self->_settings.__ptr_.__value_;
  self->_settings.__ptr_.__value_ = 0;
  if (value) {
    (*((void (**)(CLRecordingSettings *, SEL))value->var0 + 1))(value, a2);
  }
  v4 = self->_powerAssertion.__ptr_.__value_;
  self->_powerAssertion.__ptr_.__value_ = 0;
  if (v4)
  {
    v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end