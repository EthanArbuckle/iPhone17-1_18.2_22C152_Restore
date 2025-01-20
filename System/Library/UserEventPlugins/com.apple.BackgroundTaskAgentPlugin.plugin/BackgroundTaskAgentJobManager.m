@interface BackgroundTaskAgentJobManager
- (BOOL)areNetworkingRequirementsMetForJob:(id)a3 withCurrentDeviceState:(id *)a4;
- (BOOL)hasPendingJobs;
- (BOOL)validateAndAddDefaults:(id)a3;
- (BackgroundTaskAgentJobManager)initWithUserEventAgentProvider:(void *)a3;
- (BackgroundTaskAgentMonitor)monitor;
- (__CFDictionary)jobList;
- (void)BackgroundTaskAgentMonitoredConditionChangedWithTimeChange:(double *)a3;
- (void)addJobToQueue:(id)a3 withToken:(__CFNumber *)a4;
- (void)adjustTime:(double)a3;
- (void)cancelJobWithToken:(unint64_t)a3;
- (void)cancelTimer;
- (void)dealloc;
- (void)evalJobConditions:(id)a3 withCurrentDeviceState:(id *)a4 andStoreJobStatusIn:(id *)a5;
- (void)getCurrentDeviceState:(id *)a3;
- (void)hardTimerFired:(id)a3;
- (void)hasJobStatusChanged:(id)a3 withToken:(__CFNumber *)a4 withCurrentDeviceState:(id *)a5 withPointerToExpiredJobs:(__CFDictionary *)a6;
- (void)newJob:(id)a3 withToken:(unint64_t)a4;
- (void)pcTimerFired:(id)a3;
- (void)postClientNotificationForJob:(id)a3 withToken:(__CFNumber *)a4;
- (void)printCurrentDeviceState:(id *)a3;
- (void)printJob:(id)a3 withToken:(__CFNumber *)a4 withPrefix:(const char *)a5 withLogLevel:(unsigned __int8)a6 withJobStatus:(BOOL)a7;
- (void)printJobListwithPrefix:(const char *)a3 withLogLevel:(unsigned __int8)a4 withJobStatus:(BOOL)a5;
- (void)processJobList;
- (void)processJobListImmediately;
- (void)processPendingJobs:(id)a3;
- (void)removeJob:(id)a3 withToken:(__CFNumber *)a4;
- (void)scheduleTimerIfNecessary;
- (void)setHasPendingJobs:(BOOL)a3;
- (void)userEventAgentProvider;
@end

@implementation BackgroundTaskAgentJobManager

- (BackgroundTaskAgentJobManager)initWithUserEventAgentProvider:(void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)BackgroundTaskAgentJobManager;
  v4 = [(BackgroundTaskAgentJobManager *)&v17 init];
  v5 = v4;
  if (v4)
  {
    v4->_userEventAgentProvider = a3;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0);
    v5->_jobList = Mutable;
    if (Mutable)
    {
      v7 = [BackgroundTaskAgentMonitor alloc];
      xpc_event_provider_get_queue();
    }
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_5C18(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    return 0;
  }
  return v5;
}

- (void)processPendingJobs:(id)a3
{
  if ([(BackgroundTaskAgentJobManager *)self hasPendingJobs])
  {
    [(BackgroundTaskAgentJobManager *)self processJobListImmediately];
  }
}

- (void)newJob:(id)a3 withToken:(unint64_t)a4
{
  unint64_t valuePtr = a4;
  v17[0] = *(_OWORD *)"<unknown>";
  memset(&v17[1], 0, 112);
  xpc_get_event_name();
  if (a3)
  {
    CFNumberRef v7 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
    if ([(BackgroundTaskAgentJobManager *)self validateAndAddDefaults:a3])
    {
      [(BackgroundTaskAgentJobManager *)self addJobToQueue:a3 withToken:v7];
      [(BackgroundTaskAgentJobManager *)self processJobList];
    }
    else
    {
      [(BackgroundTaskAgentJobManager *)self postClientNotificationForJob:a3 withToken:v7];
    }
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] debugPrintMonitorStatus];
    v15[0] = @"event";
    v15[1] = @"token";
    v16[0] = @"add";
    v16[1] = v7;
    v15[2] = @"name";
    v16[2] = +[NSString stringWithUTF8String:v17];
    v15[3] = @"client";
    v16[3] = +[NSString stringWithUTF8String:xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName")];
    +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
    PLLogRegisteredEvent();
    CFRelease(v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_5C90((uint64_t)v17, a4, v8, v9, v10, v11, v12, v13);
  }
}

- (void)cancelJobWithToken:(unint64_t)a3
{
  unint64_t v6 = a3;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberSInt64Type, &v6);
  if (CFDictionaryContainsKey([(BackgroundTaskAgentJobManager *)self jobList], v4))
  {
    Value = (OS_xpc_object *)CFDictionaryGetValue([(BackgroundTaskAgentJobManager *)self jobList], v4);
    v7[0] = @"event";
    v7[1] = @"token";
    v8[0] = @"remove";
    v8[1] = v4;
    v7[2] = @"client";
    v8[2] = +[NSString stringWithUTF8String:xpc_dictionary_get_string(Value, "BackgroundTaskAgentClientName")];
    +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
    PLLogRegisteredEvent();
    [(BackgroundTaskAgentJobManager *)self removeJob:Value withToken:v4];
  }
  else
  {
    Value = 0;
  }
  if (self->_nextHardDeadlineJob == Value || self->_nextSoftDeadlineJob == Value) {
    [(BackgroundTaskAgentJobManager *)self processJobList];
  }
  CFRelease(v4);
}

- (void)dealloc
{
  if (self->_jobList)
  {
    if (CFDictionaryGetCount([(BackgroundTaskAgentJobManager *)self jobList]) >= 1)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_1564;
      v4[3] = &unk_C488;
      v4[4] = self;
      [(__CFDictionary *)[(BackgroundTaskAgentJobManager *)self jobList] enumerateKeysAndObjectsUsingBlock:v4];
    }
    CFRelease(self->_jobList);
  }

  [(BackgroundTaskAgentJobManager *)self cancelTimer];
  v3.receiver = self;
  v3.super_class = (Class)BackgroundTaskAgentJobManager;
  [(BackgroundTaskAgentJobManager *)&v3 dealloc];
}

- (BOOL)validateAndAddDefaults:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentJobWindowStartTime);
  if (v6 < Current + -300.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5D10();
    }
LABEL_41:
    xpc_dictionary_set_int64(a3, kBackgroundTaskAgentJobStatus, 1);
    return 0;
  }
  double v7 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentJobWindowEndTime);
  if (v7 < v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5DA4();
    }
    goto LABEL_41;
  }
  if (v7 > v6 + 3024000.0 + 300.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5E38();
    }
    goto LABEL_41;
  }
  if (v7 > Current + 3024000.0 + 300.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5ECC();
    }
    goto LABEL_41;
  }
  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobExpired, 0);
  uint64_t v8 = (const char *)kBackgroundTaskAgentJobWindowAdjustTime;
  if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobWindowAdjustTime))
  {
    BOOL v9 = xpc_dictionary_get_BOOL(a3, v8);
  }
  else
  {
    BOOL v9 = 1;
    xpc_dictionary_set_BOOL(a3, v8, 1);
  }
  uint64_t v10 = (const char *)kBackgroundTaskAgentNetworkRequired;
  BOOL v11 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentNetworkRequired);
  uint64_t v12 = (const char *)kBackgroundTaskAgentCellularAllowed;
  BOOL v13 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentCellularAllowed);
  if (!v11)
  {
    xpc_dictionary_set_BOOL(a3, v10, 0);
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusNetwork, 1);
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_6198(a3);
      }
      goto LABEL_41;
    }
    goto LABEL_22;
  }
  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusNetwork, 0);
  if (!v13) {
LABEL_22:
  }
    xpc_dictionary_set_BOOL(a3, v12, 0);
  uint64_t v14 = (const char *)kBackgroundTaskAgentPowerOptLevel;
  unsigned int int64 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentPowerOptLevel);
  int v16 = int64;
  if (int64)
  {
    if (int64 >= 3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_60F8(a3, v16);
      }
      goto LABEL_41;
    }
  }
  else
  {
    int v16 = 2;
    xpc_dictionary_set_int64(a3, v14, 2);
  }
  double v17 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentScreenBlankedTime);
  if (v17 < 0.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_6070(a3);
    }
    goto LABEL_41;
  }
  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusScreenBlanked, 0);
  double v18 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentPowerPluggedinTime);
  if (v18 < 0.0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5FE8(a3);
    }
    goto LABEL_41;
  }
  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusPowerPluggedin, 0);
  v19 = (const char *)kBackgroundTaskAgentRequiredBatteryLevel;
  double v20 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentRequiredBatteryLevel);
  double v21 = v20;
  if (v20 < 0.0 || v20 > 0.0)
  {
    if (v20 < 0.0 || v20 > 100.0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_5F60(a3);
      }
      goto LABEL_41;
    }
  }
  else
  {
    xpc_dictionary_set_double(a3, v19, 0.0);
  }
  xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusBatteryLevel, v21 == 0.0);
  v23 = (const char *)kBackgroundTaskAgentAllowedDuringVoiceCall;
  BOOL v24 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringVoiceCall);
  if (!v24) {
    xpc_dictionary_set_BOOL(a3, v23, 0);
  }
  v25 = (const char *)kBackgroundTaskAgentAllowedDuringRoaming;
  BOOL v26 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringRoaming);
  if (v26)
  {
    xpc_dictionary_set_int64(a3, kBackgroundTaskAgentJobStatus, 3);
    if (!v9) {
      goto LABEL_46;
    }
  }
  else
  {
    xpc_dictionary_set_BOOL(a3, v25, 0);
    xpc_dictionary_set_int64(a3, kBackgroundTaskAgentJobStatus, 3);
    if (!v9)
    {
LABEL_46:
      if (!v11) {
        goto LABEL_48;
      }
      goto LABEL_47;
    }
  }
  [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] incrementNumAdjustTimeJobs];
  if (v11) {
LABEL_47:
  }
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] incrementNumNetworkJobs];
LABEL_48:
  if (v17 >= 0.0) {
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] incrementNumScreenBlankedJobs];
  }
  if (v16 != 2 && v18 < 0.0)
  {
    if (v24) {
      goto LABEL_53;
    }
LABEL_60:
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] incrementNumJobsNotAllowedDuringVoiceCall];
    if (v26) {
      return 1;
    }
    goto LABEL_54;
  }
  [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] incrementNumPowerPluggedinJobs];
  if (!v24) {
    goto LABEL_60;
  }
LABEL_53:
  if (!v26) {
LABEL_54:
  }
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] incrementNumJobsNotAllowedWhileRoaming];
  return 1;
}

- (void)addJobToQueue:(id)a3 withToken:(__CFNumber *)a4
{
  if (CFDictionaryContainsKey([(BackgroundTaskAgentJobManager *)self jobList], a4))
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v7) {
      sub_6220(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    [(BackgroundTaskAgentJobManager *)self removeJob:CFDictionaryGetValue([(BackgroundTaskAgentJobManager *)self jobList], a4) withToken:a4];
  }
  xpc_retain(a3);
  CFDictionaryAddValue([(BackgroundTaskAgentJobManager *)self jobList], a4, a3);
}

- (void)printCurrentDeviceState:(id *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v4 = +[NSMutableString string];
    [v4 appendFormat:@"CurrentDeviceState = {\n"];
    objc_msgSend(v4, "appendFormat:", @"    currentTime               = %@;\n",
      stringFromCFAbsoluteTime(a3->var0));
    objc_msgSend(v4, "appendFormat:", @"    currentBatteryLevel       = %.1f;\n", *(void *)&a3->var3);
    objc_msgSend(v4, "appendFormat:", @"    currentScreenBlankedTime  = %.1f;\n", *(void *)&a3->var1);
    objc_msgSend(v4, "appendFormat:", @"    currentPowerPluggedinTime = %.1f;\n", *(void *)&a3->var2);
    objc_msgSend(v4, "appendFormat:", @"    isInVoiceCall             = %d;\n", a3->var4);
    objc_msgSend(v4, "appendFormat:", @"    isRoaming                 = %d;\n", a3->var5);
    objc_msgSend(v4, "appendFormat:", @"    primaryLinkQuality        = %d;\n", a3->var6);
    objc_msgSend(v4, "appendFormat:", @"    primaryLinkIsCellular     = %d;\n", a3->var7);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_625C(v4);
    }
  }
}

- (void)getCurrentDeviceState:(id *)a3
{
  a3->double var0 = CFAbsoluteTimeGetCurrent();
  a3->var6 = [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] primaryLinkQuality];
  a3->var7 = [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] primaryLinkIsCellular];
  [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] batteryLevel];
  a3->var3 = v5;
  a3->var4 = [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] isInVoiceCall];
  a3->var5 = [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] isRoaming];
  unsigned int v6 = [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] isScreenBlanked];
  double v7 = -1.0;
  double v8 = -1.0;
  if (v6)
  {
    double var0 = a3->var0;
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] lastScreenBlankedTime];
    double v8 = var0 - v10;
  }
  a3->var1 = v8;
  if ([(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] isPowerPluggedin])
  {
    double v11 = a3->var0;
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] lastPowerPluggedinTime];
    double v7 = v11 - v12;
  }
  a3->var2 = v7;

  [(BackgroundTaskAgentJobManager *)self printCurrentDeviceState:a3];
}

- (void)processJobList
{
  if ((byte_D938 & 1) == 0)
  {
    byte_D938 = 1;
    dispatch_time(0, 200000000);
    [(BackgroundTaskAgentJobManager *)self userEventAgentProvider];
    xpc_event_provider_get_queue();
  }
}

- (void)processJobListImmediately
{
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  if ([(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] pendingNetworkUpdate])
  {
    [(BackgroundTaskAgentJobManager *)self setHasPendingJobs:1];
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v3) {
      sub_62E0(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else
  {
    [(BackgroundTaskAgentJobManager *)self setHasPendingJobs:0];
    [(BackgroundTaskAgentJobManager *)self getCurrentDeviceState:&v22];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      double v11 = [(BackgroundTaskAgentJobManager *)self jobList];
      CFIndex Count = CFDictionaryGetCount([(BackgroundTaskAgentJobManager *)self jobList]);
      sub_6364((uint64_t)v30, (uint64_t)v11, Count);
    }
    self->_shouldScheduleConditionTimer = 0;
    self->_nextHardDeadlineJob = 0;
    self->_nextSoftDeadlineJob = 0;
    self->_nextSoftDeadlineTime = 6048000.0;
    *(_OWORD *)&self->_batteryLevelNotificationThreshold = xmmword_8F40;
    uint64_t v13 = [(BackgroundTaskAgentJobManager *)self jobList];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_21F8;
    v18[3] = &unk_C4D8;
    long long v19 = v22;
    long long v20 = v23;
    long long v21 = v24;
    v18[4] = self;
    v18[5] = &v25;
    [(__CFDictionary *)v13 enumerateKeysAndObjectsUsingBlock:v18];
    uint64_t v14 = (void *)v26[3];
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "processJobList: Removing all expired jobs", buf, 2u);
        uint64_t v14 = (void *)v26[3];
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_2214;
      v17[3] = &unk_C488;
      v17[4] = self;
      [v14 enumerateKeysAndObjectsUsingBlock:v17];
      CFRelease((CFTypeRef)v26[3]);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = [(BackgroundTaskAgentJobManager *)self jobList];
      CFIndex v16 = CFDictionaryGetCount([(BackgroundTaskAgentJobManager *)self jobList]);
      sub_631C((uint64_t)buf, (uint64_t)v15, v16);
    }
    [(BackgroundTaskAgentJobManager *)self scheduleTimerIfNecessary];
    if (self->_batteryLevelNotificationThreshold <= 100.0) {
      [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] notifyWhenBatteryLevel:self->_batteryLevelNotificationThreshold];
    }
  }
  _Block_object_dispose(&v25, 8);
}

- (void)hasJobStatusChanged:(id)a3 withToken:(__CFNumber *)a4 withCurrentDeviceState:(id *)a5 withPointerToExpiredJobs:(__CFDictionary *)a6
{
  *(_OWORD *)value = 0u;
  long long v30 = 0u;
  double v11 = (const char *)kBackgroundTaskAgentJobStatus;
  int int64 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentJobStatus);
  string = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
  double v14 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentJobWindowStartTime);
  double v15 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentJobWindowEndTime);
  int64_t v16 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentPowerOptLevel);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v32 = [(NSString *)stringFromCFAbsoluteTime(v14) UTF8String];
    __int16 v33 = 2080;
    v34 = [(NSString *)stringFromCFAbsoluteTime(v15) UTF8String];
    __int16 v35 = 2080;
    v36 = string;
    __int16 v37 = 2080;
    id v38 = objc_msgSend(-[__CFNumber description](a4, "description"), "UTF8String");
    __int16 v39 = 1024;
    int v40 = int64;
    _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "[Job Window] Start = %s; End = %s; Client=%s; Token=%s; Status = %d;",
      buf,
      0x30u);
  }
  double v17 = v14 - a5->var0;
  double v18 = v15 - a5->var0;
  if (v17 <= 0.0)
  {
    [(BackgroundTaskAgentJobManager *)self evalJobConditions:a3 withCurrentDeviceState:a5 andStoreJobStatusIn:value];
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusNetwork, value[1]);
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusScreenBlanked, value[2]);
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobStatusPowerPluggedin, value[3]);
    if (v18 >= 0.0)
    {
      self->_shouldScheduleConditionTimer = 1;
      xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobExpired, 0);
      if (value[0])
      {
        if (int64 == 3)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_6634((uint64_t)string, a4);
          }
          xpc_dictionary_set_int64(a3, v11, 2);
          [(BackgroundTaskAgentJobManager *)self postClientNotificationForJob:a3 withToken:a4];
        }
      }
      else
      {
        if (int64 == 2)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_65B4((uint64_t)string, a4);
          }
          xpc_dictionary_set_int64(a3, v11, 3);
          [(BackgroundTaskAgentJobManager *)self postClientNotificationForJob:a3 withToken:a4];
        }
        if (value[5] && *(double *)&value[8] < self->_batteryLevelNotificationThreshold) {
          self->_batteryLevelNotificationThreshold = *(double *)&value[8];
        }
        if ((_BYTE)v30)
        {
          double v20 = *((double *)&v30 + 1);
          if (*((double *)&v30 + 1) < self->_nextHardDeadlineTime)
          {
            self->_nextHardDeadlineJob = (OS_xpc_object *)a3;
            self->_nextHardDeadlineTime = v20;
          }
        }
      }
      goto LABEL_34;
    }
    xpc_dictionary_set_BOOL(a3, kBackgroundTaskAgentJobExpired, 1);
    if (value[0])
    {
      xpc_dictionary_set_int64(a3, v11, 2);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_6534((uint64_t)string, a4);
      }
    }
    else
    {
      xpc_dictionary_set_int64(a3, v11, 3);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_64B4((uint64_t)string, a4);
      }
    }
    [(BackgroundTaskAgentJobManager *)self postClientNotificationForJob:a3 withToken:a4];
    CFMutableDictionaryRef Mutable = *a6;
    if (*a6
      || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, 0),
          (*a6 = Mutable) != 0))
    {
      CFDictionaryAddValue(Mutable, a4, a3);
    }
    else
    {
      BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v21) {
        sub_6478(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }
  else if (v16 == 1)
  {
    if (v17 < self->_nextHardDeadlineTime)
    {
      self->_nextHardDeadlineJob = (OS_xpc_object *)a3;
      self->_nextHardDeadlineTime = v17;
    }
  }
  else if (v16 == 2 && v17 < self->_nextSoftDeadlineTime)
  {
    self->_nextSoftDeadlineJob = (OS_xpc_object *)a3;
    self->_nextSoftDeadlineTime = v17;
LABEL_34:
    if (v18 < self->_nextHardDeadlineTime)
    {
      self->_nextHardDeadlineJob = (OS_xpc_object *)a3;
      self->_nextHardDeadlineTime = v18;
    }
  }
}

- (void)postClientNotificationForJob:(id)a3 withToken:(__CFNumber *)a4
{
  [(BackgroundTaskAgentJobManager *)self printJob:a3 withToken:a4 withPrefix:"JobNotification" withLogLevel:2 withJobStatus:1];
  xpc_dictionary_set_BOOL(a3, "BackgroundTaskAgentMessage", 1);
  uint64_t valuePtr = 0;
  CFNumberGetValue(a4, kCFNumberLongLongType, &valuePtr);
  xpc_event_provider_token_fire();
}

- (void)removeJob:(id)a3 withToken:(__CFNumber *)a4
{
  BOOL v7 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentJobWindowAdjustTime);
  BOOL v8 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentNetworkRequired);
  double v9 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentScreenBlankedTime);
  double v10 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentPowerPluggedinTime);
  int int64 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentPowerOptLevel);
  BOOL v12 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringVoiceCall);
  BOOL v13 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringRoaming);
  if (v7) {
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] decrementNumAdjustTimeJobs];
  }
  if (v8) {
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] decrementNumNetworkJobs];
  }
  if (v9 >= 0.0) {
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] decrementNumScreenBlankedJobs];
  }
  if (v10 >= 0.0 || int64 == 2)
  {
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] decrementNumPowerPluggedinJobs];
    if (v12)
    {
LABEL_12:
      if (v13) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if (v12)
  {
    goto LABEL_12;
  }
  [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] decrementNumJobsNotAllowedDuringVoiceCall];
  if (!v13) {
LABEL_13:
  }
    [(BackgroundTaskAgentMonitor *)[(BackgroundTaskAgentJobManager *)self monitor] decrementNumJobsNotAllowedWhileRoaming];
LABEL_14:
  CFDictionaryRemoveValue([(BackgroundTaskAgentJobManager *)self jobList], a4);

  xpc_release(a3);
}

- (void)scheduleTimerIfNecessary
{
  if (CFDictionaryGetCount([(BackgroundTaskAgentJobManager *)self jobList]) <= 0)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v10) {
      sub_675C(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    [(BackgroundTaskAgentJobManager *)self cancelTimer];
  }
  else
  {
    [(PCSimpleTimer *)self->_softTimer invalidate];

    self->_softTimer = 0;
    nextSoftDeadlineJob = self->_nextSoftDeadlineJob;
    if (nextSoftDeadlineJob)
    {
      uint64_t v4 = (PCSimpleTimer *)[objc_alloc((Class)PCSimpleTimer) initWithTimeInterval:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"BTA-%s", xpc_dictionary_get_string(nextSoftDeadlineJob, "BackgroundTaskAgentClientName")), self, "pcTimerFired:", 0, self->_nextSoftDeadlineTime serviceIdentifier target selector userInfo];
      self->_softTimer = v4;
      [(PCSimpleTimer *)v4 setDisableSystemWaking:1];
      [(BackgroundTaskAgentJobManager *)self userEventAgentProvider];
      xpc_event_provider_get_queue();
    }
    nextHardDeadlineJob = self->_nextHardDeadlineJob;
    if (self->_shouldScheduleConditionTimer)
    {
      if (!nextHardDeadlineJob || self->_nextHardDeadlineTime > 3600.0)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        BOOL v7 = @"BTA-PeriodicConditionMonitor";
        double nextHardDeadlineTime = 3600.0;
        double v9 = 0.45;
        if (Current - *(double *)&qword_D928 < 180.0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_687C();
          }
          return;
        }
        goto LABEL_19;
      }
    }
    else if (!nextHardDeadlineJob)
    {
      BOOL v7 = 0;
      double v9 = 0.0;
      double nextHardDeadlineTime = NAN;
LABEL_20:
      [(PCPersistentTimer *)self->_hardTimer invalidate];

      self->_hardTimer = 0;
      uint64_t v23 = (PCPersistentTimer *)[objc_alloc((Class)PCPersistentTimer) initWithTimeInterval:v7 serviceIdentifier:self target:"hardTimerFired:" selector:0 userInfo:nextHardDeadlineTime];
      self->_hardTimer = v23;
      [(PCPersistentTimer *)v23 setMinimumEarlyFireProportion:v9];
      [(BackgroundTaskAgentJobManager *)self userEventAgentProvider];
      xpc_event_provider_get_queue();
    }
    double v18 = +[NSDate dateWithTimeIntervalSinceNow:self->_nextHardDeadlineTime];
    lastFireDate = self->_lastFireDate;
    double v20 = self->_nextHardDeadlineJob;
    if (!lastFireDate || self->_lastHardDeadlineJob != v20)
    {
LABEL_18:
      self->_lastHardDeadlineJob = v20;

      self->_lastFireDate = v18;
      uint64_t v22 = v18;
      BOOL v7 = +[NSString stringWithFormat:@"BTA-%s", xpc_dictionary_get_string(self->_nextHardDeadlineJob, "BackgroundTaskAgentClientName")];
      double nextHardDeadlineTime = self->_nextHardDeadlineTime;
      double v9 = 1.0;
      double Current = NAN;
LABEL_19:
      qword_D928 = *(void *)&Current;
      goto LABEL_20;
    }
    [(NSDate *)lastFireDate timeIntervalSinceDate:v18];
    if (v21 > 1.0)
    {
      double v20 = self->_nextHardDeadlineJob;
      lastFireDate = self->_lastFireDate;
      goto LABEL_18;
    }
    BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v24) {
      sub_6840(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
}

- (void)hardTimerFired:(id)a3
{
  self->_lastHardDeadlineJob = 0;
  [(BackgroundTaskAgentJobManager *)self pcTimerFired:a3];
}

- (void)pcTimerFired:(id)a3
{
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    sub_6984(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  [(BackgroundTaskAgentJobManager *)self processJobListImmediately];
}

- (void)cancelTimer
{
  self->_hardTimer = 0;
  [(PCSimpleTimer *)self->_softTimer invalidate];

  self->_softTimer = 0;
}

- (void)BackgroundTaskAgentMonitoredConditionChangedWithTimeChange:(double *)a3
{
  BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    sub_69C0(v5, v6, v7, v8, v9, v10, v11, v12);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a3) {
LABEL_3:
  }
    [(BackgroundTaskAgentJobManager *)self adjustTime:*a3];
LABEL_4:
  [(BackgroundTaskAgentJobManager *)self processJobList];
}

- (void)adjustTime:(double)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2DAC;
  v3[3] = &unk_C4F8;
  *(double *)&v3[4] = a3;
  [(__CFDictionary *)[(BackgroundTaskAgentJobManager *)self jobList] enumerateKeysAndObjectsUsingBlock:v3];
}

- (void)evalJobConditions:(id)a3 withCurrentDeviceState:(id *)a4 andStoreJobStatusIn:(id *)a5
{
  double var1 = a4->var1;
  double var2 = a4->var2;
  string = xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName");
  double v12 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentScreenBlankedTime);
  if (v12 < 0.0)
  {
    a5->double var2 = 1;
LABEL_5:
    double v13 = -1.0;
    goto LABEL_6;
  }
  if (var1 < 0.0)
  {
    a5->double var2 = 0;
    goto LABEL_5;
  }
  double v13 = v12 - a4->var1;
  a5->double var2 = v13 <= 0.0;
LABEL_6:
  double v14 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentPowerPluggedinTime);
  if (v14 >= 0.0)
  {
    if (var2 >= 0.0)
    {
      double v15 = v14 - a4->var2;
      a5->double var3 = v15 <= 0.0;
      goto LABEL_11;
    }
    a5->double var3 = 0;
  }
  else
  {
    a5->double var3 = 1;
  }
  double v15 = -1.0;
LABEL_11:
  a5->double var1 = [(BackgroundTaskAgentJobManager *)self areNetworkingRequirementsMetForJob:a3 withCurrentDeviceState:a4];
  double v16 = xpc_dictionary_get_double(a3, kBackgroundTaskAgentRequiredBatteryLevel);
  double v17 = v16;
  double var3 = a4->var3;
  a5->var4 = var3 >= v16;
  BOOL v19 = a5->var1;
  if (!a5->var1) {
    goto LABEL_35;
  }
  if (a5->var2 && a5->var3)
  {
    if (var3 >= v16)
    {
      int v20 = 0;
      int v21 = 0;
      int v22 = 1;
      a5->double var0 = 1;
LABEL_36:
      uint64_t v27 = 0x4059400000000000;
      a5->var5 = 0;
      a5->var6 = 101.0;
      a5->var7 = 0;
LABEL_37:
      double v28 = -1.0;
      a5->var8 = -1.0;
      goto LABEL_38;
    }
LABEL_45:
    int v20 = 0;
    int v22 = 0;
    a5->double var0 = 0;
    int v21 = 1;
    a5->var5 = 1;
    a5->var6 = v16;
    a5->var7 = 0;
    uint64_t v27 = *(void *)&v16;
    goto LABEL_37;
  }
  BOOL v23 = v12 < 0.0;
  if (var1 < 0.0) {
    BOOL v23 = 1;
  }
  if (v12 >= 0.0 && v23) {
    goto LABEL_35;
  }
  BOOL v25 = v14 < 0.0;
  if (var2 < 0.0) {
    BOOL v25 = 1;
  }
  if (v14 >= 0.0 && v25)
  {
LABEL_35:
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    a5->double var0 = 0;
    goto LABEL_36;
  }
  if (var3 < v16) {
    goto LABEL_45;
  }
  int v21 = 0;
  int v22 = 0;
  uint64_t v27 = 0x4059400000000000;
  a5->double var0 = 0;
  a5->var5 = 0;
  a5->var6 = 101.0;
  int v20 = 1;
  a5->var7 = 1;
  if (v13 <= v15) {
    double v28 = v15;
  }
  else {
    double v28 = v13;
  }
  a5->var8 = v28;
LABEL_38:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    BOOL v29 = a5->var2;
    BOOL v30 = a5->var3;
    int v31 = 136317442;
    v32 = string;
    __int16 v33 = 1024;
    int v34 = v22;
    __int16 v35 = 1024;
    BOOL v36 = v19;
    __int16 v37 = 1024;
    BOOL v38 = v29;
    __int16 v39 = 1024;
    BOOL v40 = v30;
    __int16 v41 = 1024;
    BOOL v42 = var3 >= v17;
    __int16 v43 = 1024;
    int v44 = v21;
    __int16 v45 = 2048;
    uint64_t v46 = v27;
    __int16 v47 = 1024;
    int v48 = v20;
    __int16 v49 = 2048;
    double v50 = v28;
    _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "evalJobConditions(%s): isSatisfied = %d, isNetworkSatisfied = %d, isScreenBlankedSatisfied = %d, isPowerPluggedinSatisfied = %d, isBatteryLevelSatisfied = %d, isBatteryLevelNotificationNeeded = %d, notificationBatteryLevel = %.1f, isOnlyTimeWaitNeeded = %d, waitTime = %.1f", (uint8_t *)&v31, 0x4Au);
  }
}

- (BOOL)areNetworkingRequirementsMetForJob:(id)a3 withCurrentDeviceState:(id *)a4
{
  unsigned int var6 = a4->var6;
  double var2 = a4->var2;
  BOOL var7 = a4->var7;
  BOOL var4 = a4->var4;
  BOOL var5 = a4->var5;
  int int64 = xpc_dictionary_get_int64(a3, kBackgroundTaskAgentPowerOptLevel);
  BOOL v11 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentNetworkRequired);
  BOOL v12 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentCellularAllowed);
  BOOL v13 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringVoiceCall);
  BOOL v14 = xpc_dictionary_get_BOOL(a3, kBackgroundTaskAgentAllowedDuringRoaming);
  int v15 = !var4 || v13;
  char v16 = !var5 || v14;
  if (!v12 || v15 == 0) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v16;
  }
  if (!v11) {
    return 1;
  }
  if (!var7) {
    BOOL v18 = 1;
  }
  if (var2 < 0.0 && int64 != 1) {
    return var6 > 1 && v18;
  }
  return var6 && v18;
}

- (void)printJobListwithPrefix:(const char *)a3 withLogLevel:(unsigned __int8)a4 withJobStatus:(BOOL)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, (os_log_type_t)a4))
  {
    if ([(BackgroundTaskAgentJobManager *)self jobList])
    {
      if (CFDictionaryGetCount([(BackgroundTaskAgentJobManager *)self jobList]) < 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_6A80();
        }
      }
      else
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_33F8;
        v9[3] = &unk_C520;
        v9[4] = self;
        v9[5] = a3;
        unsigned __int8 v10 = a4;
        BOOL v11 = a5;
        [(__CFDictionary *)[(BackgroundTaskAgentJobManager *)self jobList] enumerateKeysAndObjectsUsingBlock:v9];
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_69FC((void *)a3);
    }
  }
}

- (void)printJob:(id)a3 withToken:(__CFNumber *)a4 withPrefix:(const char *)a5 withLogLevel:(unsigned __int8)a6 withJobStatus:(BOOL)a7
{
  BOOL v7 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, (os_log_type_t)a6))
  {
    id v12 = +[NSMutableString string];
    memset(v35, 0, sizeof(v35));
    [v12 appendFormat:@"%s\n(%s, %@) = {\n", a5, xpc_dictionary_get_string(a3, "BackgroundTaskAgentClientName"), a4, 0];
    CFNumberGetValue(a4, kCFNumberSInt64Type, &valuePtr);
    if (xpc_get_event_name()) {
      objc_msgSend(v12, "appendFormat:", @"--- Job Name = %s\n", v35);
    }
    [v12 appendString:@"--- Job Requirements ---------\n"];
    BOOL v13 = (const char *)kBackgroundTaskAgentJobWindowStartTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobWindowStartTime))
    {
      double v14 = xpc_dictionary_get_double(a3, v13);
      [v12 appendFormat:@"    StartTime              = %@;\n", stringFromCFAbsoluteTime(v14)];
    }
    int v15 = (const char *)kBackgroundTaskAgentJobWindowEndTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobWindowEndTime))
    {
      double v16 = xpc_dictionary_get_double(a3, v15);
      [v12 appendFormat:@"    EndTime                = %@;\n", stringFromCFAbsoluteTime(v16)];
    }
    double v17 = (const char *)kBackgroundTaskAgentJobWindowAdjustTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobWindowAdjustTime)) {
      objc_msgSend(v12, "appendFormat:", @"    AdjustTime             = %3d;", xpc_dictionary_get_BOOL(a3, v17));
    }
    BOOL v18 = (const char *)kBackgroundTaskAgentNetworkRequired;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentNetworkRequired)) {
      objc_msgSend(v12, "appendFormat:", @"    NetworkRequired        = %3d;", xpc_dictionary_get_BOOL(a3, v18));
    }
    BOOL v19 = (const char *)kBackgroundTaskAgentCellularAllowed;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentCellularAllowed)) {
      objc_msgSend(v12, "appendFormat:", @"    CellularAllowed        = %3d;\n", xpc_dictionary_get_BOOL(a3, v19));
    }
    int v20 = (const char *)kBackgroundTaskAgentAllowedDuringVoiceCall;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentAllowedDuringVoiceCall)) {
      objc_msgSend(v12, "appendFormat:", @"    allowedDuringVoiceCall = %3d;", xpc_dictionary_get_BOOL(a3, v20));
    }
    int v21 = (const char *)kBackgroundTaskAgentAllowedDuringRoaming;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentAllowedDuringRoaming)) {
      objc_msgSend(v12, "appendFormat:", @"    allowedDuringRoaming   = %3d;", xpc_dictionary_get_BOOL(a3, v21));
    }
    int v22 = (const char *)kBackgroundTaskAgentPowerOptLevel;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentPowerOptLevel)) {
      objc_msgSend(v12, "appendFormat:", @"    PowerOptLevel          = %3lld;\n",
    }
        xpc_dictionary_get_int64(a3, v22));
    BOOL v23 = (const char *)kBackgroundTaskAgentScreenBlankedTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentScreenBlankedTime)) {
      objc_msgSend(v12, "appendFormat:", @"    ScreenBlankedTime      = %.1f;",
    }
        xpc_dictionary_get_double(a3, v23));
    BOOL v24 = (const char *)kBackgroundTaskAgentPowerPluggedinTime;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentPowerPluggedinTime)) {
      objc_msgSend(v12, "appendFormat:", @"    PowerPluggedinTime     = %.1f;",
    }
        xpc_dictionary_get_double(a3, v24));
    BOOL v25 = (const char *)kBackgroundTaskAgentRequiredBatteryLevel;
    if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentRequiredBatteryLevel)) {
      objc_msgSend(v12, "appendFormat:", @"    RequiredBatteryLevel   = %.1f;\n",
    }
        xpc_dictionary_get_double(a3, v25));
    if (v7)
    {
      [v12 appendString:@"\n--- Status Info --------------\n"];
      uint64_t v26 = (const char *)kBackgroundTaskAgentJobStatus;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobStatus)) {
        objc_msgSend(v12, "appendFormat:", @"    JobStatus              = %3lld;",
      }
          xpc_dictionary_get_int64(a3, v26));
      uint64_t v27 = (const char *)kBackgroundTaskAgentJobExpired;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobExpired)) {
        objc_msgSend(v12, "appendFormat:", @"    JobExpired             = %3d;", xpc_dictionary_get_BOOL(a3, v27));
      }
      double v28 = (const char *)kBackgroundTaskAgentJobStatusNetwork;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobStatusNetwork)) {
        objc_msgSend(v12, "appendFormat:", @"    JobStatusNetwork       = %3d;\n",
      }
          xpc_dictionary_get_BOOL(a3, v28));
      BOOL v29 = (const char *)kBackgroundTaskAgentJobStatusScreenBlanked;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobStatusScreenBlanked)) {
        objc_msgSend(v12, "appendFormat:", @"    JobStatusScreenBlanked = %3d;", xpc_dictionary_get_BOOL(a3, v29));
      }
      BOOL v30 = (const char *)kBackgroundTaskAgentJobStatusPowerPluggedin;
      if (xpc_dictionary_get_value(a3, kBackgroundTaskAgentJobStatusPowerPluggedin)) {
        objc_msgSend(v12, "appendFormat:", @"    JobStatusPowerPluggedin= %3d;", xpc_dictionary_get_BOOL(a3, v30));
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, (os_log_type_t)a6))
    {
      id v31 = objc_msgSend(objc_msgSend(v12, "description"), "UTF8String");
      *(_DWORD *)buf = 136315138;
      id v34 = v31;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, (os_log_type_t)a6, "%s\n}", buf, 0xCu);
    }
  }
}

- (void)userEventAgentProvider
{
  return self->_userEventAgentProvider;
}

- (__CFDictionary)jobList
{
  return self->_jobList;
}

- (BackgroundTaskAgentMonitor)monitor
{
  return self->_monitor;
}

- (BOOL)hasPendingJobs
{
  return self->_hasPendingJobs;
}

- (void)setHasPendingJobs:(BOOL)a3
{
  self->_hasPendingJobs = a3;
}

@end