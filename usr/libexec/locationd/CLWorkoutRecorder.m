@interface CLWorkoutRecorder
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)acquireTokenWithSettings:(void *)a3 publisher:(id)a4;
- (BOOL)canStartRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5;
- (BOOL)createWorkingDirectory;
- (BOOL)didPublishRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5;
- (BOOL)workingDirectoryHasSufficientFreeSpace;
- (CLDaemonLocation)getRecentLocation;
- (CLWorkoutRecorder)init;
- (CLWorkoutRecorderPublisher)publisher;
- (id).cxx_construct;
- (id)getRecentWeatherData;
- (id)getWorkingDirectory;
- (void)beginService;
- (void)dealloc;
- (void)didUpdateWeather:(id)a3;
- (void)endService;
- (void)handleResponse:(id)a3;
- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onLocationNotification:(const int *)a3 data:(const void *)a4;
- (void)onWorkoutEffortScoreUpdate:(id)a3;
@end

@implementation CLWorkoutRecorder

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
  if (qword_102489830 != -1) {
    dispatch_once(&qword_102489830, &stru_10234D5F8);
  }
  return (id)qword_102489828;
}

- (CLWorkoutRecorder)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutRecorder;
  v2 = [(CLWorkoutRecorder *)&v5 initWithInboundProtocol:&OBJC_PROTOCOL___CLWorkoutRecorderProtocol outboundProtocol:&OBJC_PROTOCOL___CLWorkoutRecorderClientProtocol];
  v3 = v2;
  if (v2)
  {
    v2->_recentLocation.ellipsoidalAltitude = 0.0;
    v2->_workoutRecorderTrigger = [[CLWorkoutRecorderTrigger alloc] initWithDelegate:v2 andUniverse:[(CLWorkoutRecorder *)v2 universe]];
    v3->_drivingRecorderTrigger = [[CLDrivingRecorderTrigger alloc] initWithDelegate:v3 andUniverse:[(CLWorkoutRecorder *)v3 universe]];
    v3->_serviceLocationClient.__ptr_.__value_ = 0;
  }
  return v3;
}

- (void)dealloc
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D618);
  }
  v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: dealloc", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    __int16 v7 = 0;
    objc_super v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder dealloc]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }

  self->_workingDirectory = 0;
  self->_workoutRecorderTrigger = 0;

  self->_drivingRecorderTrigger = 0;
  value = self->_serviceLocationClient.__ptr_.__value_;
  if (value)
  {

    self->_serviceLocationClient.__ptr_.__value_ = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CLWorkoutRecorder;
  [(CLWorkoutRecorder *)&v6 dealloc];
}

+ (BOOL)isSupported
{
  sub_10006ACBC(buf, "WorkoutRecorderDisable", (unsigned __int8 *)&unk_101E544AC, 0);
  int v2 = buf[1];
  sub_10006ACBC(buf, "WorkoutRecorderAlwaysOn", byte_101E544AD, 0);
  int v3 = buf[1];
  if (objc_opt_class()) {
    id v4 = [[+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection") isHealthDataSubmissionAllowed];
  }
  else {
    id v4 = 0;
  }
  sub_100103240();
  if (sub_10016CCBC()) {
    BOOL v5 = +[CLWorkoutRecorderAvailability isSupportedForHardware:sub_1000B5AD4()];
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = +[CLWorkoutRecorderAvailability isSupportedWithExplicitDisable:v2 != 0 withIHAOverride:v3 != 0 withIHAOptIn:v4 withHwSupport:v5];
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D618);
  }
  __int16 v7 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67110144;
    int v11 = v2;
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 1024;
    int v15 = (int)v4;
    __int16 v16 = 1024;
    BOOL v17 = v5;
    __int16 v18 = 1024;
    BOOL v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: isSupported Flags - disable: %d, alwaysOn: %d, iha: %d, hwSupported: %d, isSupported, %d", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "+[CLWorkoutRecorder isSupported]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  return v6;
}

- (void)beginService
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D618);
  }
  int v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Beginning service.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    id v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  if ([(CLWorkoutRecorder *)self createWorkingDirectory]) {
    sub_100EB2E6C();
  }
}

- (void)endService
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D618);
  }
  int v3 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Ending service.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    __int16 v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder endService]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  double ellipsoidalAltitude = self->_recentLocation.ellipsoidalAltitude;
  if (ellipsoidalAltitude != 0.0)
  {
    (*(void (**)(double))(**(void **)&ellipsoidalAltitude + 8))(COERCE_DOUBLE(*(void *)&ellipsoidalAltitude));
    self->_recentLocation.double ellipsoidalAltitude = 0.0;
  }
  uint64_t v6 = *(void *)&self->_recentLocation.fromSimulationController;
  *(void *)&self->_recentLocation.fromSimulationController = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  [self->_serviceLocationProvider unregisterForWeatherUpdates:self];

  self->_serviceLocationProvider = 0;
}

- (BOOL)canStartRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5
{
  if (!+[CLWorkoutRecorder isSupported])
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    int v11 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, no longer allowed.", buf, 2u);
    }
    BOOL v10 = sub_10013D1A0(115, 2);
    if (!v10) {
      return v10;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1) {
      goto LABEL_72;
    }
LABEL_79:
    dispatch_once(&qword_102419190, &stru_10234D618);
    goto LABEL_72;
  }
  if (!self->_workingDirectory)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    __int16 v12 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, no working directory.", buf, 2u);
    }
    BOOL v10 = sub_10013D1A0(115, 2);
    if (!v10) {
      return v10;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1) {
      goto LABEL_72;
    }
    goto LABEL_79;
  }
  if (![(CLWorkoutRecorder *)self workingDirectoryHasSufficientFreeSpace])
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    int v13 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, not enough free space in working directory.", buf, 2u);
    }
    BOOL v10 = sub_10013D1A0(115, 2);
    if (!v10) {
      return v10;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1)
    {
LABEL_72:
      BOOL v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder canStartRecording:settings:publisher:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
      LOBYTE(v10) = 0;
      return v10;
    }
    goto LABEL_79;
  }
  if (*a3)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    v9 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, already recording.", buf, 2u);
    }
    BOOL v10 = sub_10013D1A0(115, 2);
    if (v10)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 == -1) {
        goto LABEL_72;
      }
      goto LABEL_79;
    }
    return v10;
  }
  if (!a5)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    int v15 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, no publisher.", buf, 2u);
    }
    BOOL v10 = sub_10013D1A0(115, 2);
    if (!v10) {
      return v10;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1) {
      goto LABEL_72;
    }
    goto LABEL_79;
  }
  if (([a5 canPublish] & 1) == 0)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    __int16 v16 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, publisher is not ready to publish.", buf, 2u);
    }
    BOOL v10 = sub_10013D1A0(115, 2);
    if (!v10) {
      return v10;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1) {
      goto LABEL_72;
    }
    goto LABEL_79;
  }
  if ([(CLRecordingTriggerBase *)self->_workoutRecorderTrigger isRecording]
    || [(CLRecordingTriggerBase *)self->_drivingRecorderTrigger isRecording])
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    __int16 v14 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Unable to start recording, session already being captured.", buf, 2u);
    }
    BOOL v10 = sub_10013D1A0(115, 2);
    if (!v10) {
      return v10;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1) {
      goto LABEL_72;
    }
    goto LABEL_79;
  }
  if ([(CLWorkoutRecorder *)self acquireTokenWithSettings:a4 publisher:a5])
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    BOOL v17 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Can Start Recording", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder canStartRecording:settings:publisher:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    LOBYTE(v10) = 1;
    return v10;
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D618);
  }
  __int16 v18 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: Not recording, rate limit reached.", buf, 2u);
  }
  BOOL v10 = sub_10013D1A0(115, 2);
  if (v10)
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1) {
      goto LABEL_72;
    }
    goto LABEL_79;
  }
  return v10;
}

- (BOOL)didPublishRecording:(id *)a3 settings:(void *)a4 publisher:(id)a5
{
  id v6 = *a3;
  if (!*a3) {
    return (char)v6;
  }
  [v6 stopTime];
  if (v10 == 0.0)
  {
LABEL_27:
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  if (self->_deviceUnlocked)
  {
    if (a5)
    {
      if (+[CLWorkoutRecorder isSupported])
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D618);
        }
        int v11 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Publishing Recording", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234D618);
          }
          BOOL v19 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]", "%s\n", v19);
          if (v19 != (char *)buf) {
            free(v19);
          }
        }
        id v12 = [*a3 recordingURLs];
        id v13 = [*a3 metadata];
        [*a3 startTime];
        __int16 v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
        [*a3 stopTime];
        [a5 publishDataFiles:v12 metadata:v13 startDate:[NSDate dateWithTimeIntervalSinceReferenceDate:NSDate, "dateWithTimeIntervalSinceReferenceDate:"] endDate:a4 settings:];
      }
      else
      {
        if (qword_102419190 != -1) {
          dispatch_once(&qword_102419190, &stru_10234D618);
        }
        __int16 v18 = qword_102419198;
        if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Unable to publish recording, no longer allowed.", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419190 != -1) {
            dispatch_once(&qword_102419190, &stru_10234D618);
          }
          v20 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]", "%s\n", v20);
          if (v20 != (char *)buf) {
            free(v20);
          }
        }
      }
      LOBYTE(v6) = 1;
      return (char)v6;
    }
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    __int16 v16 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Deferring publishing of recording until publisher is created.", buf, 2u);
    }
    LODWORD(v6) = sub_10013D1A0(115, 2);
    if (v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 == -1) {
        goto LABEL_25;
      }
      goto LABEL_43;
    }
  }
  else
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    int v15 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Deferring publishing of recording until device is unlocked.", buf, 2u);
    }
    LODWORD(v6) = sub_10013D1A0(115, 2);
    if (v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 == -1)
      {
LABEL_25:
        BOOL v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder didPublishRecording:settings:publisher:]", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
        goto LABEL_27;
      }
LABEL_43:
      dispatch_once(&qword_102419190, &stru_10234D618);
      goto LABEL_25;
    }
  }
  return (char)v6;
}

- (id)getWorkingDirectory
{
  return self->_workingDirectory;
}

- (CLDaemonLocation)getRecentLocation
{
  return &self->_recentLocation;
}

- (id)getRecentWeatherData
{
  return self->_serviceLocationClient.__ptr_.__value_;
}

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3)
  {
    if (*a3 != 1 || !*((unsigned char *)a4 + 4)) {
      return;
    }
    self->_deviceUnlocked = 1;
  }
  else
  {
    if (*(_DWORD *)a4 != 1)
    {
      self->_deviceUnlocked = 0;
      return;
    }
    self->_deviceUnlocked = 1;
  }
  [(CLRecordingTriggerBase *)self->_workoutRecorderTrigger publishRecording];
  drivingRecorderTrigger = self->_drivingRecorderTrigger;

  [(CLRecordingTriggerBase *)drivingRecorderTrigger publishRecording];
}

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  if (*a3 == 5)
  {
    long long v4 = *((_OWORD *)a4 + 1);
    *(_OWORD *)&self->_recentLocation.suitability = *(_OWORD *)a4;
    *(_OWORD *)&self->_recentLocation.coordinate.longitude = v4;
    long long v5 = *((_OWORD *)a4 + 5);
    long long v7 = *((_OWORD *)a4 + 2);
    long long v6 = *((_OWORD *)a4 + 3);
    *(_OWORD *)&self->_recentLocation.course = *((_OWORD *)a4 + 4);
    *(_OWORD *)&self->_recentLocation.timestamp = v5;
    *(_OWORD *)&self->_recentLocation.altitude = v7;
    *(_OWORD *)&self->_recentLocation.speed = v6;
    $AB5116BA7E623E054F959CECB034F4E7 v9 = ($AB5116BA7E623E054F959CECB034F4E7)*((_OWORD *)a4 + 7);
    long long v8 = *((_OWORD *)a4 + 8);
    long long v10 = *((_OWORD *)a4 + 6);
    *(_OWORD *)&self->_recentLocation.integrity = *(_OWORD *)((char *)a4 + 140);
    self->_recentLocation.rawCoordinate = v9;
    *(_OWORD *)&self->_recentLocation.rawCourse = v8;
    *(_OWORD *)&self->_recentLocation.lifespan = v10;
  }
}

- (BOOL)acquireTokenWithSettings:(void *)a3 publisher:(id)a4
{
  if (sub_101A21474(*(void *)a3))
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    long long v6 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: acquireTokenWithSettings, rate limiting is disabled", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      __int16 v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    goto LABEL_7;
  }
  if (!a4)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    long long v10 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token, no publisher.", buf, 2u);
    }
    BOOL v11 = sub_10013D1A0(115, 0);
    LOBYTE(v7) = 0;
    if (v11)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      id v12 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n");
      goto LABEL_43;
    }
    return v7;
  }
  if ((sub_101A21508(*(void *)a3) & 1) == 0)
  {
    sub_100103240();
    if (sub_10073E30C()) {
      goto LABEL_7;
    }
  }
  [a4 requestConfiguration];
  double v8 = sub_101A2159C(*(void *)a3);
  if ((double)rand() * 4.65661287e-10 > v8)
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    $AB5116BA7E623E054F959CECB034F4E7 v9 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token. Filtered out due to server side sampling rate.", buf, 2u);
    }
    BOOL v7 = sub_10013D1A0(115, 2);
    if (v7)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 == -1) {
        goto LABEL_42;
      }
      goto LABEL_46;
    }
    return v7;
  }
  unsigned int v13 = sub_101A212B8(*(void *)a3);
  unsigned int v14 = sub_101A2134C(*(void *)a3);
  unsigned int v15 = sub_101A210C8(*(void *)a3);
  uint64_t v16 = *(void *)a3;
  if (v15 >= v13)
  {
    sub_101A21144(v16, 1u);
    goto LABEL_31;
  }
  sub_101A21144(v16, v15 + 1);
  if (v15 <= v14)
  {
LABEL_7:
    LOBYTE(v7) = 1;
    return v7;
  }
LABEL_31:
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D618);
  }
  BOOL v17 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "CLWorkoutRecorder: acquireTokenWithSettings, Unable to aquire token due to system side sampling rate.", buf, 2u);
  }
  BOOL v7 = sub_10013D1A0(115, 2);
  if (v7)
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 == -1)
    {
LABEL_42:
      id v12 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder acquireTokenWithSettings:publisher:]", "%s\n");
LABEL_43:
      if (v12 != buf) {
        free(v12);
      }
      LOBYTE(v7) = 0;
      return v7;
    }
LABEL_46:
    dispatch_once(&qword_102419190, &stru_10234D618);
    goto LABEL_42;
  }
  return v7;
}

- (BOOL)createWorkingDirectory
{
  int v3 = +[NSFileManager defaultManager];
  long long v4 = [[(NSString *)NSTemporaryDirectory() stringByAppendingString:@"/WorkoutRecorder"] UTF8String];
  sub_100134750(v16, v4);
  sub_101A2A6C0((BOOL *)buf, "WorkoutRecorderWorkingDirectory", (long long *)v16, 0);
  if (SHIBYTE(v20) < 0)
  {
    sub_1000DC48C(&__dst, *(void **)&v19[4], *(unint64_t *)&v19[12]);
  }
  else
  {
    long long __dst = *(_OWORD *)&v19[4];
    uint64_t v22 = v20;
  }
  if (v22 >= 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (long long *)__dst;
  }
  long long v6 = +[NSString stringWithUTF8String:p_dst];
  if (SHIBYTE(v22) < 0) {
    operator delete((void *)__dst);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(*(void **)&v19[4]);
  }
  if (v17 < 0) {
    operator delete(v16[0]);
  }
  char v15 = 0;
  if ([(NSFileManager *)v3 fileExistsAtPath:v6 isDirectory:&v15])
  {
    if (!v15)
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      unsigned int v13 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)BOOL v19 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "CLWorkoutRecorder: Unable to create working directory, path exists as a file, path: %{public}@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      LODWORD(__dst) = 138543362;
      *(void *)((char *)&__dst + 4) = v6;
      double v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v8);
      goto LABEL_45;
    }
    v16[0] = 0;
    [(NSFileManager *)v3 removeItemAtPath:v6 error:v16];
    if (v16[0])
    {
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      BOOL v7 = qword_102419198;
      if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void **)BOOL v19 = v16[0];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "CLWorkoutRecorder: Unable to delete working directory, error: %{public}@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 0)) {
        return 0;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      LODWORD(__dst) = 138543362;
      *(void **)((char *)&__dst + 4) = v16[0];
      double v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v8);
LABEL_45:
      if (v8 != (char *)buf) {
        free(v8);
      }
      return 0;
    }
  }
  v16[0] = 0;
  [(NSFileManager *)v3 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:v16];
  BOOL v9 = v16[0] == 0;
  if (v16[0])
  {
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    long long v10 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void **)BOOL v19 = v16[0];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CLWorkoutRecorder: Unable to create working directory, error: %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      LODWORD(__dst) = 138543362;
      *(void **)((char *)&__dst + 4) = v16[0];
      BOOL v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder createWorkingDirectory]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
  else
  {
    p_workingDirectory = &self->_workingDirectory;

    *p_workingDirectory = +[NSURL fileURLWithPath:v6];
  }
  return v9;
}

- (BOOL)workingDirectoryHasSufficientFreeSpace
{
  if (!self->_workingDirectory) {
    return 0;
  }
  uint64_t v14 = 0;
  int v3 = [+[NSFileManager defaultManager] attributesOfFileSystemForPath:[(NSURL *)self->_workingDirectory path] error:&v14];
  if (!v14 && v3)
  {
    id v4 = [(NSDictionary *)v3 objectForKey:NSFileSystemFreeSize];
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    long long v5 = qword_102419198;
    if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)BOOL v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Working directory free space: %{public}@ bytes.", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419190 != -1) {
        dispatch_once(&qword_102419190, &stru_10234D618);
      }
      *(_DWORD *)char v15 = 138543362;
      *(void *)&v15[4] = v4;
      unsigned int v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder workingDirectoryHasSufficientFreeSpace]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    *(void *)char v15 = 209715200;
    sub_101A2AFB4(buf, "WorkoutRecorderWorkingDirectoryMinSpace", v15, 0);
    unint64_t v6 = *(void *)&v19[4];
    return (unint64_t)[v4 unsignedLongLongValue] > v6;
  }
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D618);
  }
  double v8 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_ERROR))
  {
    BOOL v9 = [(NSURL *)self->_workingDirectory path];
    *(_DWORD *)buf = 138543618;
    *(void *)BOOL v19 = v9;
    *(_WORD *)&v19[8] = 2114;
    *(void *)&v19[10] = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "CLWorkoutRecorder: Unable to get free space of working directory. Assuming no free space, path: %{public}@, error: %{public}@", buf, 0x16u);
  }
  BOOL v10 = sub_10013D1A0(115, 0);
  BOOL result = 0;
  if (v10)
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    BOOL v11 = [(NSURL *)self->_workingDirectory path];
    *(_DWORD *)char v15 = 138543618;
    *(void *)&v15[4] = v11;
    __int16 v16 = 2114;
    uint64_t v17 = v14;
    id v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutRecorder workingDirectoryHasSufficientFreeSpace]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
    return 0;
  }
  return result;
}

- (void)handleResponse:(id)a3
{
  if (qword_102419190 != -1) {
    dispatch_once(&qword_102419190, &stru_10234D618);
  }
  long long v5 = qword_102419198;
  if (os_log_type_enabled((os_log_t)qword_102419198, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CLWorkoutRecorder: Received configuration: %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419190 != -1) {
      dispatch_once(&qword_102419190, &stru_10234D618);
    }
    unint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutRecorder handleResponse:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [(CLRecordingTriggerBase *)self->_workoutRecorderTrigger handlePublisherResponse:a3];
  [(CLRecordingTriggerBase *)self->_drivingRecorderTrigger handlePublisherResponse:a3];
}

- (void)didUpdateWeather:(id)a3
{
  long long v5 = (Client *)[a3 copy];
  self->_serviceLocationClient.__ptr_.__value_ = v5;
  [(CLRecordingTriggerBase *)self->_workoutRecorderTrigger feedWeatherData:v5];
  drivingRecorderTrigger = self->_drivingRecorderTrigger;
  value = self->_serviceLocationClient.__ptr_.__value_;

  [(CLRecordingTriggerBase *)drivingRecorderTrigger feedWeatherData:value];
}

- (void)onWorkoutEffortScoreUpdate:(id)a3
{
  if (a3)
  {
    workoutRecorderTrigger = self->_workoutRecorderTrigger;
    (*((void (**)(void *__return_ptr, id, SEL))a3 + 2))(v4, a3, a2);
    [(CLRecordingTriggerBase *)workoutRecorderTrigger feedWorkoutEffortEstimate:v4];
  }
}

- (CLWorkoutRecorderPublisher)publisher
{
  return (CLWorkoutRecorderPublisher *)self->_recentWeatherData;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void *)&self->_recentLocation.fromSimulationController;
  *(void *)&self->_recentLocation.fromSimulationController = 0;
  if (v3) {
    (*(void (**)(uint64_t, SEL))(*(void *)v3 + 8))(v3, a2);
  }
  value = self->_dataProtectionClient.__ptr_.__value_;
  self->_dataProtectionClient.__ptr_.__value_ = 0;
  if (value)
  {
    long long v5 = *(void (**)(void))(*(void *)value + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((_DWORD *)self + 12) = 0xFFFF;
  *(void *)((char *)self + 60) = 0;
  *(void *)((char *)self + 52) = 0;
  *(_OWORD *)((char *)self + 68) = xmmword_101D1C320;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)self + 84) = _Q0;
  *(_OWORD *)((char *)self + 100) = _Q0;
  *(_OWORD *)((char *)self + 116) = _Q0;
  *((_DWORD *)self + 33) = 0;
  *((_DWORD *)self + 40) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0xBFF0000000000000;
  *(void *)((char *)self + 164) = 0xBFF0000000000000;
  *((_DWORD *)self + 43) = 0x7FFFFFFF;
  *((void *)self + 23) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 22) = 0;
  *((unsigned char *)self + 200) = 0;
  *((void *)self + 27) = 0;
  return self;
}

@end