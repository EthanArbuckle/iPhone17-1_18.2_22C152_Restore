@interface BKHIDStudyLogEventProcessor
+ (BOOL)shouldCreateStudyLogger;
- (BKHIDStudyLogEventProcessor)initWithContext:(id)a3;
- (BKIOHIDService)gyroService;
- (BKIOHIDServiceMatcher)gyroMatcher;
- (BKSLocalDefaults)localDefaults;
- (BOOL)isButtonLoggingEnabled;
- (OS_dispatch_queue)matcherQueue;
- (SLGLog)keyboardLog;
- (SLGTimedLogger)cameraLog;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (void)dealloc;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)serviceDidDisappear:(id)a3;
- (void)setButtonLoggingEnabled:(BOOL)a3;
- (void)setCameraLog:(id)a3;
- (void)setGyroMatcher:(id)a3;
- (void)setGyroService:(id)a3;
- (void)setKeyboardLog:(id)a3;
- (void)setLocalDefaults:(id)a3;
- (void)setMatcherQueue:(id)a3;
@end

@implementation BKHIDStudyLogEventProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherQueue, 0);
  objc_storeStrong((id *)&self->_gyroService, 0);
  objc_storeStrong((id *)&self->_gyroMatcher, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_cameraLog, 0);

  objc_storeStrong((id *)&self->_keyboardLog, 0);
}

- (void)setMatcherQueue:(id)a3
{
}

- (OS_dispatch_queue)matcherQueue
{
  return self->_matcherQueue;
}

- (void)setGyroService:(id)a3
{
}

- (BKIOHIDService)gyroService
{
  return self->_gyroService;
}

- (void)setGyroMatcher:(id)a3
{
}

- (BKIOHIDServiceMatcher)gyroMatcher
{
  return self->_gyroMatcher;
}

- (void)setLocalDefaults:(id)a3
{
}

- (BKSLocalDefaults)localDefaults
{
  return self->_localDefaults;
}

- (void)setCameraLog:(id)a3
{
}

- (SLGTimedLogger)cameraLog
{
  return self->_cameraLog;
}

- (void)setKeyboardLog:(id)a3
{
}

- (SLGLog)keyboardLog
{
  return self->_keyboardLog;
}

- (void)setButtonLoggingEnabled:(BOOL)a3
{
  self->_buttonLoggingEnabled = a3;
}

- (BOOL)isButtonLoggingEnabled
{
  return self->_buttonLoggingEnabled;
}

- (void)serviceDidDisappear:(id)a3
{
  gyroService = self->_gyroService;
  self->_gyroService = 0;
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  [a4 firstObject:a3];
  v5 = (BKIOHIDService *)objc_claimAutoreleasedReturnValue();
  gyroService = self->_gyroService;
  self->_gyroService = v5;

  [(BKIOHIDService *)self->_gyroService addDisappearanceObserver:self queue:self->_matcherQueue];
  v7 = self->_gyroService;
  id v8 = +[NSNumber numberWithDouble:100000.0];
  [(BKIOHIDService *)v7 setProperty:v8 forKey:@"ReportInterval"];
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  v6 = *a3;
  int Type = IOHIDEventGetType();
  switch(Type)
  {
    case 20:
      localDefaults = self->_localDefaults;
      v19 = self->_cameraLog;
      if (([(BKSLocalDefaults *)localDefaults disableStudyLogGyroLogging] & 1) == 0)
      {
        v32 = _NSConcreteStackBlock;
        uint64_t v33 = 3221225472;
        v34 = sub_10002237C;
        v35 = &unk_1000F5C20;
        v36 = v6;
        CFStringRef v20 = @"com.apple.backboard.hid.gyro";
LABEL_16:
        [(SLGTimedLogger *)v19 logBlock:&v32 domain:v20];
      }
LABEL_17:

      return 0;
    case 12:
      v21 = self->_localDefaults;
      v19 = self->_cameraLog;
      if (([(BKSLocalDefaults *)v21 disableStudyLogALSLogging] & 1) == 0)
      {
        v32 = _NSConcreteStackBlock;
        uint64_t v33 = 3221225472;
        v34 = sub_100022544;
        v35 = &unk_1000F5C20;
        v36 = v6;
        CFStringRef v20 = @"com.apple.backboard.hid.als";
        goto LABEL_16;
      }
      goto LABEL_17;
    case 3:
      cameraLog = self->_cameraLog;
      v9 = self->_localDefaults;
      v10 = self->_keyboardLog;
      v11 = cameraLog;
      v12 = v9;
      if ([(BKSLocalDefaults *)v12 disableStudyLogButtonLogging])
      {
LABEL_36:
        int64_t v17 = 0;
        goto LABEL_37;
      }
      __int16 IntegerValue = IOHIDEventGetIntegerValue();
      __int16 v14 = IOHIDEventGetIntegerValue();
      uint64_t v15 = IOHIDEventGetIntegerValue();
      BOOL v16 = v15 != 0;
      if (IntegerValue == 144)
      {
        if (([(BKSLocalDefaults *)v12 disableStudyLogCameraKeyLogging] & 1) != 0
          || v14 != 33)
        {
          goto LABEL_35;
        }
        [(SLGTimedLogger *)v11 setActive:1];
        v27 = _NSConcreteStackBlock;
        uint64_t v28 = 3221225472;
        v29 = sub_100021F28;
        v30 = &unk_1000F5BC0;
        LOWORD(v31) = v14;
        BYTE2(v31) = v16;
        CFStringRef v22 = @"com.apple.backboard.hid.camera";
        v23 = &v27;
        v24 = v11;
        goto LABEL_34;
      }
      if (IntegerValue != 12)
      {
        if (IntegerValue == 7)
        {
          if (([(BKSLocalDefaults *)v12 disableStudyLogBTKeyboardEventLogging] & 1) == 0)
          {
            v27 = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472;
            v29 = sub_100021B48;
            v30 = &unk_1000F5BC0;
            LOWORD(v31) = v14;
            BYTE2(v31) = v16;
            [(SLGLog *)v10 logBlock:&v27 domain:@"com.apple.backboard.hid.keyboard"];
          }
          if (([(BKSLocalDefaults *)v12 disableStudyLogBTKeyboardEventRedirection] & 1) == 0)
          {
            int64_t v17 = 1;
LABEL_37:

            return v17;
          }
        }
        goto LABEL_35;
      }
      switch(v14)
      {
        case 48:
          if (([(BKSLocalDefaults *)v12 disableStudyLogPowerButtonLogging] & 1) == 0)
          {
            v27 = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472;
            v29 = sub_100021E3C;
            v30 = &unk_1000F6C68;
            LOBYTE(v31) = v16;
            CFStringRef v22 = @"com.apple.backboard.hid.power";
LABEL_32:
            v23 = &v27;
LABEL_33:
            v24 = v10;
LABEL_34:
            -[SLGLog logBlock:domain:](v24, "logBlock:domain:", v23, v22, v27, v28, v29, v30, v31);
          }
          break;
        case 233:
          if (([(BKSLocalDefaults *)v12 disableStudyLogVolumeKeyLogging] & 1) == 0)
          {
            v27 = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472;
            v29 = sub_100021D50;
            v30 = &unk_1000F6C68;
            LOBYTE(v31) = v16;
            CFStringRef v22 = @"com.apple.backboard.hid.volume";
            goto LABEL_32;
          }
          break;
        case 234:
          uint64_t v25 = v15;
          if ([(BKSLocalDefaults *)v12 disableStudyLogVolumeKeyLogging])break; {
          v27 = _NSConcreteStackBlock;
          }
          uint64_t v28 = 3221225472;
          v29 = sub_100021C64;
          v30 = &unk_1000F6C68;
          LOBYTE(v31) = v16;
          [(SLGLog *)v10 logBlock:&v27 domain:@"com.apple.backboard.hid.volume"];
          if (!v25) {
            break;
          }
          v23 = (void ***)&stru_1000F5C00;
          CFStringRef v22 = @"com.apple.backboard.hid.volume";
          goto LABEL_33;
        default:
          break;
      }
LABEL_35:
      v32 = _NSConcreteStackBlock;
      uint64_t v33 = 3221225472;
      v34 = sub_100022124;
      v35 = &unk_1000F5C20;
      v36 = v6;
      [(SLGLog *)v10 logBlock:&v32 domain:@"com.apple.backboard.hid.keyboard"];
      goto LABEL_36;
  }
  return 0;
}

- (void)dealloc
{
  [(BKIOHIDServiceMatcher *)self->_gyroMatcher invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKHIDStudyLogEventProcessor;
  [(BKHIDStudyLogEventProcessor *)&v3 dealloc];
}

- (BKHIDStudyLogEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  if (+[BKHIDStudyLogEventProcessor shouldCreateStudyLogger])
  {
    v22.receiver = self;
    v22.super_class = (Class)BKHIDStudyLogEventProcessor;
    v5 = [(BKHIDStudyLogEventProcessor *)&v22 init];
    if (v5)
    {
      uint64_t v6 = +[BKSDefaults localDefaults];
      localDefaults = v5->_localDefaults;
      v5->_localDefaults = (BKSLocalDefaults *)v6;

      uint64_t v8 = +[SLGLog sharedInstance];
      keyboardLog = v5->_keyboardLog;
      v5->_keyboardLog = (SLGLog *)v8;

      dispatch_queue_t v10 = dispatch_queue_create("BKHIDEventStudyLoggerMatcherQueue", 0);
      matcherQueue = v5->_matcherQueue;
      v5->_matcherQueue = (OS_dispatch_queue *)v10;

      v12 = [v4 serviceMatcherDataProvider];
      v13 = (BKIOHIDServiceMatcher *)[objc_alloc((Class)BKIOHIDServiceMatcher) initWithUsagePage:65280 usage:9 builtIn:1 dataProvider:v12];
      gyroMatcher = v5->_gyroMatcher;
      v5->_gyroMatcher = v13;

      [(BKIOHIDServiceMatcher *)v5->_gyroMatcher startObserving:v5 queue:v5->_matcherQueue];
      id v15 = objc_alloc((Class)SLGTimedLogger);
      id v16 = objc_alloc((Class)SLGActivatableLogger);
      int64_t v17 = +[SLGLog sharedInstance];
      id v18 = [v16 initWithLogger:v17];
      v19 = (SLGTimedLogger *)[v15 initWithLogger:v18 duration:1.0];
      cameraLog = v5->_cameraLog;
      v5->_cameraLog = v19;

      [(SLGTimedLogger *)v5->_cameraLog setActivationHandler:&stru_1000F5B80];
      [(SLGTimedLogger *)v5->_cameraLog setDeactivationHandler:&stru_1000F5BA0];
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldCreateStudyLogger
{
  v2 = +[SLGLog sharedInstance];
  unsigned int v3 = [v2 isEnabled];

  if (v3)
  {
    id v4 = sub_10005FA78();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "StudyLog is enabled", v6, 2u);
    }
  }
  return v3;
}

@end