@interface LifetimeServoController
- (BOOL)getFastDieEngagementStatus;
- (LifetimeServoController)init;
- (LifetimeServoController)initWithParams:(id)a3 sensorList:(__CFArray *)a4;
- (__CFDictionary)newChannelForDriver:(const char *)a3 channelID:(unint64_t)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)initPerfStateVoltages:(const char *)a3 propertyName:(__CFString *)a4 voltages:(int *)a5 maxVoltageCount:(int)a6;
- (int)initPerfStateVoltagesCPU;
- (int)initPerfStateVoltagesGPU;
- (int)numberOfFields;
- (int)writeToDriverService:(unsigned int)a3 key:(__CFString *)a4 value:(int64_t)a5;
- (void)initPerfStateReportingCPU;
- (void)initPerfStateReportingGPU;
- (void)initSensorList:(__CFArray *)a3;
- (void)overrideInstantaneousAF:(id)a3 value:(float)a4;
- (void)overrideParam:(id)a3 value:(int)a4;
- (void)updateCoreAnalyticsInfo;
- (void)updateForTempMax:(int)a3 tempAverage:(int)a4;
- (void)updatePerfStateReportingCPU;
- (void)updatePerfStateReportingGPU;
- (void)updateSystemPowerState:(BOOL)a3;
@end

@implementation LifetimeServoController

- (LifetimeServoController)init
{
  return [(LifetimeServoController *)self initWithParams:0 sensorList:0];
}

- (LifetimeServoController)initWithParams:(id)a3 sensorList:(__CFArray *)a4
{
  v58.receiver = self;
  v58.super_class = (Class)LifetimeServoController;
  v6 = [(LifetimeServoController *)&v58 init];
  v7 = v6;
  if (!v6) {
    return (LifetimeServoController *)v7;
  }
  *(void *)(v6 + 372) = 0;
  *((_DWORD *)v6 + 91) = -1;
  *((_DWORD *)v6 + 92) = -1;
  [+[TGraphSampler sharedInstance] addtGraphDataSource:v6];
  v7[398] = sub_100037D8C((const __CFDictionary *)a3, @"useRestoreSafePartition", 0);
  BOOL v8 = sub_100037D8C((const __CFDictionary *)a3, @"updateCPUFastDieTargetPMP", 0);
  v7[397] = v8;
  if (v8) {
    v9 = "ApplePMP";
  }
  else {
    v9 = "AppleDieTempController";
  }
  CFDictionaryRef v10 = IOServiceMatching(v9);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v10);
  *((_DWORD *)v7 + 2) = MatchingService;
  if (!MatchingService && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005B958();
  }
  BOOL v12 = sub_100037D8C((const __CFDictionary *)a3, @"updateGPUFastDieTarget", 0);
  v7[396] = v12;
  if (v12)
  {
    CFDictionaryRef v13 = IOServiceMatching(off_1000A2680);
    io_service_t v14 = IOServiceGetMatchingService(kIOMainPortDefault, v13);
    *((_DWORD *)v7 + 3) = v14;
    if (!v14 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005B924();
    }
  }
  time_t v15 = time(0);
  *((void *)v7 + 50) = v15;
  if (v15 == -1 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005B8F0();
  }
  *((_DWORD *)v7 + 4) = 0;
  v16 = (int *)(v7 + 16);
  id v55 = a3;
  if (sub_100008280((CFDictionaryRef)a3, @"variant", kCFNumberIntType, v7 + 16))
  {
    if (!byte_1000AA7A0) {
      goto LABEL_23;
    }
    uint64_t v17 = qword_1000AABC0;
    if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    int v18 = *v16;
    *(_DWORD *)buf = 67109120;
    int v60 = v18;
    v19 = "<Notice> LSController: variant %d";
    v20 = v17;
    uint32_t v21 = 8;
  }
  else
  {
    if (!byte_1000AA7A0) {
      goto LABEL_23;
    }
    uint64_t v22 = qword_1000AABC0;
    if (!os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v19 = "<Notice> LSController: variant classic";
    v20 = v22;
    uint32_t v21 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_23:
  [v7 initPerfStateReportingCPU];
  uint64_t v23 = 0;
  *((_DWORD *)v7 + 50) = [v7 initPerfStateVoltagesCPU];
  v54 = v7 + 72;
  int v24 = byte_1000AA7A0;
  do
  {
    if (v24)
    {
      v25 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = *(_DWORD *)&v7[4 * v23 + 72];
        *(_DWORD *)buf = 67109376;
        int v60 = v23;
        __int16 v61 = 1024;
        int v62 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: CPU[%d] %d", buf, 0xEu);
        int v24 = byte_1000AA7A0;
      }
    }
    ++v23;
  }
  while (v23 != 16);
  CFStringRef v27 = @"com.apple.cltm";
  if (v7[398])
  {
    if (&_lookupPathForPersistentData)
    {
      bzero(buf, 0x400uLL);
      lookupPathForPersistentData();
      v28 = +[NSFileManager defaultManager];
      v29 = +[NSString stringWithFormat:@"%s", buf];
      uint64_t v57 = 0;
      if ([(NSFileManager *)v28 fileExistsAtPath:v29 isDirectory:0]
        || [(NSFileManager *)v28 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v57])
      {
        CFStringRef v27 = +[NSString stringWithFormat:@"%s/%@", buf, @"com.apple.cltm"];
        goto LABEL_33;
      }
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_10005B8BC();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005AD0C();
    }
    return 0;
  }
LABEL_33:
  int v30 = *v16;
  if (v30 == 2)
  {
    [v7 initPerfStateReportingGPU];
    uint64_t v31 = 0;
    *((_DWORD *)v7 + 90) = [v7 initPerfStateVoltagesGPU];
    v53 = v7 + 232;
    int v32 = byte_1000AA7A0;
    do
    {
      if (v32)
      {
        v33 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = *(_DWORD *)&v7[4 * v31 + 232];
          *(_DWORD *)buf = 67109376;
          int v60 = v31;
          __int16 v61 = 1024;
          int v62 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "<Notice> LSController GPU[%d] %d", buf, 0xEu);
          int v32 = byte_1000AA7A0;
        }
      }
      ++v31;
    }
    while (v31 != 16);
    id v35 = [v55 objectForKeyedSubscript:@"params"];
    *((void *)v7 + 3) = 0;
    v36 = [LifetimeServoControlLoop alloc];
    id v37 = [v35 objectForKeyedSubscript:@"coreTypeP"];
    uint64_t v38 = *((unsigned int *)v7 + 50);
    uint64_t v39 = *((void *)v7 + 52);
    v40 = v36;
    v41 = v7 + 72;
  }
  else
  {
    if (v30 != 1)
    {
      if (v30)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005B854();
        }
      }
      else
      {
        *((void *)v7 + 3) = 0;
        *((void *)v7 + 4) = [[LifetimeServoControlLoop alloc] initWithParams:v55 perfStateVoltages:v54 voltageCount:*((unsigned int *)v7 + 50) loopType:0 persistancePath:v27 filer:*((void *)v7 + 52)];
        *((void *)v7 + 5) = 0;
      }
      goto LABEL_54;
    }
    [v7 initPerfStateReportingGPU];
    uint64_t v42 = 0;
    *((_DWORD *)v7 + 90) = [v7 initPerfStateVoltagesGPU];
    v53 = v7 + 232;
    int v43 = byte_1000AA7A0;
    do
    {
      if (v43)
      {
        v44 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v45 = *(_DWORD *)&v7[4 * v42 + 232];
          *(_DWORD *)buf = 67109376;
          int v60 = v42;
          __int16 v61 = 1024;
          int v62 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "<Notice> LSController GPU[%d] %d", buf, 0xEu);
          int v43 = byte_1000AA7A0;
        }
      }
      ++v42;
    }
    while (v42 != 16);
    id v35 = [v55 objectForKeyedSubscript:@"params"];
    *((void *)v7 + 3) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]([LifetimeServoControlLoop alloc], "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:", [v35 objectForKeyedSubscript:@"coreTypeE"], v54, 3, 1, v27, *((void *)v7 + 52));
    v46 = [LifetimeServoControlLoop alloc];
    id v37 = [v35 objectForKeyedSubscript:@"coreTypeP"];
    v41 = v7 + 84;
    uint64_t v38 = (*((_DWORD *)v7 + 50) - 3);
    uint64_t v39 = *((void *)v7 + 52);
    v40 = v46;
  }
  *((void *)v7 + 4) = [(LifetimeServoControlLoop *)v40 initWithParams:v37 perfStateVoltages:v41 voltageCount:v38 loopType:2 persistancePath:v27 filer:v39];
  *((void *)v7 + 5) = -[LifetimeServoControlLoop initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:]([LifetimeServoControlLoop alloc], "initWithParams:perfStateVoltages:voltageCount:loopType:persistancePath:filer:", [v35 objectForKeyedSubscript:@"coreTypeG"], v53, *((unsigned int *)v7 + 90), 3, v27, *((void *)v7 + 52));
  [v7 initSensorList:a4];
LABEL_54:
  [*((id *)v7 + 3) updatePersistedState];
  [*((id *)v7 + 4) updatePersistedState];
  [*((id *)v7 + 5) updatePersistedState];
  *((_DWORD *)v7 + 95) = [*((id *)v7 + 3) dieTempTarget];
  *((_DWORD *)v7 + 96) = [*((id *)v7 + 4) dieTempTarget];
  *((_DWORD *)v7 + 97) = [*((id *)v7 + 5) dieTempTarget];
  v47 = dispatch_queue_create("com.apple.thermalmonitor.lservo", 0);
  if (v47)
  {
    v48 = v47;
    v49 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v47);
    *((void *)v7 + 51) = v49;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004866C;
    handler[3] = &unk_100085248;
    handler[4] = v7;
    dispatch_source_set_event_handler(v49, handler);
    CFRelease(v48);
    v50 = *((void *)v7 + 51);
    dispatch_time_t v51 = dispatch_time(0x8000000000000000, 3600000000000);
    dispatch_source_set_timer(v50, v51, 0x34630B8A000uLL, 0x2540BE400uLL);
    dispatch_resume(*((dispatch_object_t *)v7 + 51));
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005B820();
  }
  return (LifetimeServoController *)v7;
}

- (__CFDictionary)newChannelForDriver:(const char *)a3 channelID:(unint64_t)a4
{
  CFMutableDictionaryRef v4 = IOServiceMatching(a3);
  if (v4)
  {
    CFMutableDictionaryRef v5 = v4;
    v6 = (__CFDictionary *)IOReportCopyChannelsWithID();
    CFRelease(v5);
    return v6;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005B98C();
    }
    return 0;
  }
}

- (void)initPerfStateReportingCPU
{
  self->_subscribedChannelsCPU = 0;
  self->_subscriptionCPU = 0;
  self->_lastReadingCPU = 0;
  if (self->_controllerVariant == 2) {
    uint64_t v3 = 0x43505620564F4C54;
  }
  else {
    uint64_t v3 = 0x43505520564F4C54;
  }
  CFMutableDictionaryRef v4 = [(LifetimeServoController *)self newChannelForDriver:"ApplePMGR" channelID:v3];
  if (v4)
  {
    CFMutableDictionaryRef v5 = v4;
    Subscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription();
    self->_subscriptionCPU = Subscription;
    if (Subscription)
    {
      self->_lastReadingCPU = (__CFDictionary *)IOReportCreateSamples();
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005BA34();
    }
    CFRelease(v5);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005BA00();
  }
}

- (void)initPerfStateReportingGPU
{
  self->_subscribedChannelsGPU = 0;
  self->_subscriptionGPU = 0;
  self->_lastReadingGPU = 0;
  uint64_t v3 = [(LifetimeServoController *)self newChannelForDriver:off_1000A2680 channelID:0x4750555048];
  if (v3)
  {
    CFMutableDictionaryRef v4 = v3;
    Subscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription();
    self->_subscriptionGPU = Subscription;
    if (Subscription)
    {
      self->_lastReadingGPU = (__CFDictionary *)IOReportCreateSamples();
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005BA9C();
    }
    CFRelease(v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
  {
    sub_10005BA68();
  }
}

- (int)initPerfStateVoltagesCPU
{
  if (self->_controllerVariant == 2) {
    CFStringRef v2 = @"voltage-states5";
  }
  else {
    CFStringRef v2 = @"voltage-states1";
  }
  return [(LifetimeServoController *)self initPerfStateVoltages:":/arm-io/pmgr" propertyName:v2 voltages:self->_perfStateVoltagesCPU maxVoltageCount:16];
}

- (int)initPerfStateVoltagesGPU
{
  return [(LifetimeServoController *)self initPerfStateVoltages:":/arm-io/sgx" propertyName:@"perf-states" voltages:self->_perfStateVoltagesGPU maxVoltageCount:16];
}

- (int)initPerfStateVoltages:(const char *)a3 propertyName:(__CFString *)a4 voltages:(int *)a5 maxVoltageCount:(int)a6
{
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)__str = 0u;
  long long v23 = 0u;
  int v9 = snprintf(__str, 0x200uLL, "%s%s", "IODeviceTree", a3);
  if (v9 <= 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005BAD0();
    }
    return 0;
  }
  if (v9 >= 0x200)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005BB38();
    }
    return 0;
  }
  io_registry_entry_t v10 = IORegistryEntryFromPath(kIOMainPortDefault, __str);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005BBA0();
    }
    return 0;
  }
  io_object_t v11 = v10;
  CFDataRef v12 = (const __CFData *)sub_100008350(a4, v10);
  if (v12)
  {
    CFDataRef v13 = v12;
    BytePtr = CFDataGetBytePtr(v12);
    int Length = CFDataGetLength(v13);
    int v16 = Length + 7;
    if (Length >= 0) {
      int v16 = Length;
    }
    if (v16 >> 3 <= a6)
    {
      a6 = v16 >> 3;
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005BC70();
    }
    if (a6 >= 1)
    {
      uint64_t v17 = a6;
      int v18 = (int *)(BytePtr + 4);
      do
      {
        int v20 = *v18;
        v18 += 2;
        int v19 = v20;
        if (v20) {
          *a5 = v19;
        }
        ++a5;
        --v17;
      }
      while (v17);
    }
    CFRelease(v13);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005BC08();
    }
    a6 = 0;
  }
  IOObjectRelease(v11);
  return a6;
}

- (void)initSensorList:(__CFArray *)a3
{
  if (self->_controllerVariant)
  {
    id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    id v19 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    if (CFArrayGetCount(a3) >= 1)
    {
      CFIndex v5 = 0;
      CFArrayRef theArray = a3;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v5);
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, @"lsSensorType");
        if (Value)
        {
          CFArrayRef v8 = Value;
          if (CFArrayGetCount(Value) >= 1)
          {
            CFIndex v9 = 0;
            do
            {
              CFStringRef v10 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFEqual(v10, @"coreTypeE"))
              {
                [v4 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5)]];
                io_object_t v11 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v22 = v5;
                  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<Notice> sensor coreTypeE index %d", buf, 8u);
                }
              }
              CFStringRef v12 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFEqual(v12, @"coreTypeP"))
              {
                [v20 addObject:[NSNumber numberWithInt:v5]];
                CFDataRef v13 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v22 = v5;
                  _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<Notice> sensor coreTypeP index %d", buf, 8u);
                }
              }
              CFStringRef v14 = (const __CFString *)CFArrayGetValueAtIndex(v8, v9);
              if (CFEqual(v14, @"coreTypeG"))
              {
                [v19 addObject:[NSNumber numberWithInt:v5]];
                time_t v15 = qword_1000AABC0;
                if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  int v22 = v5;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<Notice> sensor coreTypeG index %d", buf, 8u);
                }
              }
              ++v9;
            }
            while (CFArrayGetCount(v8) > v9);
          }
        }
        ++v5;
        a3 = theArray;
      }
      while (CFArrayGetCount(theArray) > v5);
    }
    if (objc_msgSend(v4, "count", self))
    {
      [v17[3] initSensorIndexSet:[v4 copy]];
    }
    if ([v20 count])
    {
      [v17[4] initSensorIndexSet:[v20 copy]];
    }
    if ([v19 count])
    {
      [v17[5] initSensorIndexSet:[v19 copy]];
    }
  }
}

- (int)writeToDriverService:(unsigned int)a3 key:(__CFString *)a4 value:(int64_t)a5
{
  kern_return_t v9;
  int64_t valuePtr;

  valuePtr = a5;
  if (!a3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005BCD8();
    }
    return 5;
  }
  CFNumberRef v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005BD0C();
    }
    return 5;
  }
  CFNumberRef v8 = v7;
  CFIndex v9 = IORegistryEntrySetCFProperty(a3, a4, v7);
  if (v9 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005BD40();
  }
  CFRelease(v8);
  return v9;
}

- (void)updateForTempMax:(int)a3 tempAverage:(int)a4
{
  LODWORD(v4) = a4;
  [(LifetimeServoController *)self updatePerfStateReportingCPU];
  if (self->_gCoreLoop) {
    [(LifetimeServoController *)self updatePerfStateReportingGPU];
  }
  unsigned int override_tempMax = self->_override_tempMax;
  if (override_tempMax == -1) {
    uint64_t v8 = a3;
  }
  else {
    uint64_t v8 = override_tempMax;
  }
  unsigned int override_tempAverage = self->_override_tempAverage;
  if (override_tempAverage == -1) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = override_tempAverage;
  }
  int controllerVariant = self->_controllerVariant;
  switch(controllerVariant)
  {
    case 2:
      uint64_t v13 = [(LifetimeServoControlLoop *)self->_pCoreLoop updateTempMax:v8];
      [(LifetimeServoControlLoop *)self->_pCoreLoop updateForPerfStateResidency:self->_perfStateFractionCPU count:self->_perfStateCountCPU tempMax:v13 tempAverage:v4];
      [(LifetimeServoControlLoop *)self->_gCoreLoop updateForPerfStateResidency:self->_perfStateFractionGPU count:self->_perfStateCountGPU tempMax:[(LifetimeServoControlLoop *)self->_gCoreLoop updateTempMax:v13] tempAverage:v4];
      signed int v14 = [(LifetimeServoControlLoop *)self->_pCoreLoop dieTempTarget];
      goto LABEL_15;
    case 1:
      uint64_t v15 = [(LifetimeServoControlLoop *)self->_eCoreLoop updateTempMax:v8];
      [(LifetimeServoControlLoop *)self->_eCoreLoop updateForPerfStateResidency:self->_perfStateFractionCPU count:3 tempMax:v15 tempAverage:v4];
      uint64_t v16 = [(LifetimeServoControlLoop *)self->_pCoreLoop updateTempMax:v15];
      [(LifetimeServoControlLoop *)self->_pCoreLoop updateForPerfStateResidency:&self->_perfStateFractionCPU[3] count:(self->_perfStateCountCPU - 3) tempMax:v16 tempAverage:v4];
      [(LifetimeServoControlLoop *)self->_gCoreLoop updateForPerfStateResidency:self->_perfStateFractionGPU count:self->_perfStateCountGPU tempMax:[(LifetimeServoControlLoop *)self->_gCoreLoop updateTempMax:v16] tempAverage:v4];
      self->_dieTempTargetCPU = [(LifetimeServoControlLoop *)self->_pCoreLoop dieTempTarget];
      signed int v14 = [(LifetimeServoControlLoop *)self->_eCoreLoop dieTempTarget];
      if (v14 >= self->_dieTempTargetCPU)
      {
LABEL_16:
        unsigned int v11 = [(LifetimeServoControlLoop *)self->_gCoreLoop dieTempTarget];
        goto LABEL_18;
      }
LABEL_15:
      self->_dieTempTargetCPU = v14;
      goto LABEL_16;
    case 0:
      [(LifetimeServoControlLoop *)self->_pCoreLoop updateForPerfStateResidency:self->_perfStateFractionCPU count:self->_perfStateCountCPU tempMax:v8 tempAverage:v4];
      unsigned int v11 = [(LifetimeServoControlLoop *)self->_pCoreLoop dieTempTarget];
      uint64_t v12 = 372;
      goto LABEL_19;
  }
  unsigned int v11 = 9500;
  self->_dieTempTargetCPU = 9500;
LABEL_18:
  uint64_t v12 = 376;
LABEL_19:
  *(_DWORD *)((char *)&self->super.isa + v12) = v11;
  int override_dieTempTarget = self->_override_dieTempTarget;
  if (override_dieTempTarget != -1)
  {
    self->_dieTempTargetCPU = override_dieTempTarget;
    self->_dieTempTargetGPU = override_dieTempTarget;
  }
  if (self->_cpuDieTempCtlService)
  {
    if ([(LifetimeServoControlLoop *)self->_eCoreLoop loopIsActive]
      || [(LifetimeServoControlLoop *)self->_pCoreLoop loopIsActive]
      || (unsigned int v18 = [(LifetimeServoControlLoop *)self->_gCoreLoop loopIsActive], override_dieTempTarget != -1)
      || v18)
    {
      if (dword_1000AA70C != self->_dieTempTargetCPU)
      {
        -[LifetimeServoController writeToDriverService:key:value:](self, "writeToDriverService:key:value:", self->_cpuDieTempCtlService, @"LifetimeServoDieTemperatureTargetPropertyKey");
        dword_1000AA70C = self->_dieTempTargetCPU;
      }
      if (dword_1000AA710 != self->_dieTempTargetGPU && self->updateGPUFastDieTarget)
      {
        -[LifetimeServoController writeToDriverService:key:value:](self, "writeToDriverService:key:value:", self->_gpuDieTempCtlService, @"LifetimeServoFastDieTemperatureTarget");
        dword_1000AA710 = self->_dieTempTargetGPU;
      }
    }
  }

  [(LifetimeServoController *)self updateCoreAnalyticsInfo];
}

- (void)updatePerfStateReportingCPU
{
  if (self->_subscriptionCPU)
  {
    if (self->_subscribedChannelsCPU)
    {
      *(_OWORD *)&self->_perfStateFractionCPU[12] = 0u;
      *(_OWORD *)&self->_perfStateFractionCPU[8] = 0u;
      *(_OWORD *)&self->_perfStateFractionCPU[4] = 0u;
      *(_OWORD *)self->_perfStateFractionCPU = 0u;
      Samples = (__CFDictionary *)IOReportCreateSamples();
      SamplesDelta = (const void *)IOReportCreateSamplesDelta();
      CFRelease(self->_lastReadingCPU);
      self->_lastReadingCPU = Samples;
      IOReportIterate();
      CFRelease(SamplesDelta);
    }
  }
}

- (void)updatePerfStateReportingGPU
{
  if (self->_subscriptionGPU)
  {
    if (self->_subscribedChannelsGPU)
    {
      *(_OWORD *)&self->_perfStateFractionGPU[8] = 0u;
      *(_OWORD *)&self->_perfStateFractionGPU[12] = 0u;
      *(_OWORD *)self->_perfStateFractionGPU = 0u;
      *(_OWORD *)&self->_perfStateFractionGPU[4] = 0u;
      Samples = (__CFDictionary *)IOReportCreateSamples();
      SamplesDelta = (const void *)IOReportCreateSamplesDelta();
      CFRelease(self->_lastReadingGPU);
      self->_lastReadingGPU = Samples;
      IOReportIterate();
      CFRelease(SamplesDelta);
    }
  }
}

- (void)overrideInstantaneousAF:(id)a3 value:(float)a4
{
  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_E"])
  {
    eCoreLoop = self->_eCoreLoop;
LABEL_7:
    *(float *)&double v7 = a4;
    [(LifetimeServoControlLoop *)eCoreLoop overrideInstantaneousAF:v7];
    return;
  }
  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_P"])
  {
    eCoreLoop = self->_pCoreLoop;
    goto LABEL_7;
  }
  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_G"])
  {
    eCoreLoop = self->_gCoreLoop;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005A7C4();
  }
}

- (void)overrideParam:(id)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (byte_1000AA7A0)
  {
    double v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = a3;
      __int16 v12 = 1024;
      int v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> LSController: setting %@ to %d", (uint8_t *)&v10, 0x12u);
    }
  }
  if ([a3 isEqualToString:@"LifetimeServoDieTempMaxMax"])
  {
    self->_unsigned int override_tempMax = v4;
    return;
  }
  if ([a3 isEqualToString:@"LifetimeServoDieTempMaxAverage"])
  {
    self->_unsigned int override_tempAverage = v4;
    return;
  }
  if ([a3 isEqualToString:@"LifetimeServoDieTempTarget"])
  {
    self->_int override_dieTempTarget = v4;
    return;
  }
  if ([a3 isEqualToString:@"LifetimeServoIntegratorState_E"])
  {
    eCoreLoop = self->_eCoreLoop;
LABEL_20:
    [(LifetimeServoControlLoop *)eCoreLoop overrideIS:v4];
    return;
  }
  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_E"])
  {
    pCoreLoop = self->_eCoreLoop;
LABEL_23:
    [(LifetimeServoControlLoop *)pCoreLoop overrideAFi:v4];
    return;
  }
  if ([a3 isEqualToString:@"LifetimeServoIntegratorState_P"])
  {
    eCoreLoop = self->_pCoreLoop;
    goto LABEL_20;
  }
  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_P"])
  {
    pCoreLoop = self->_pCoreLoop;
    goto LABEL_23;
  }
  if ([a3 isEqualToString:@"LifetimeServoIntegratorState_G"])
  {
    eCoreLoop = self->_gCoreLoop;
    goto LABEL_20;
  }
  if ([a3 isEqualToString:@"LifetimeServoInstantaneousAF_G"])
  {
    pCoreLoop = self->_gCoreLoop;
    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005A7C4();
  }
}

- (void)updateSystemPowerState:(BOOL)a3
{
  if (a3)
  {
    if (self->_lastSleepEntry == -1)
    {
      if (byte_1000AA7A0)
      {
        uint64_t v9 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          int v10 = "<Notice> LSController: last update time unavailable";
          id v11 = v9;
          uint32_t v12 = 2;
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
        }
      }
    }
    else
    {
      time_t v4 = time(0);
      if (v4 == -1)
      {
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005BE9C();
        }
      }
      else
      {
        time_t v5 = v4;
        int64_t lastSleepEntry = self->_lastSleepEntry;
        time_t v7 = v4 - lastSleepEntry;
        if (v4 < lastSleepEntry)
        {
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_10005BED0();
          }
          return;
        }
        [(LifetimeServoControlLoop *)self->_pCoreLoop processSleepInterval:v7];
        [(LifetimeServoControlLoop *)self->_gCoreLoop processSleepInterval:v7];
        [(LifetimeServoControlLoop *)self->_eCoreLoop processSleepInterval:v7];
        if (byte_1000AA7A0)
        {
          uint64_t v13 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v14 = self->_lastSleepEntry;
            int v15 = 134218496;
            int64_t v16 = v14;
            __int16 v17 = 2048;
            time_t v18 = v5;
            __int16 v19 = 2048;
            time_t v20 = v7;
            int v10 = "<Notice> LSController: lastSleepEntry %ld, now %ld, delta %ld";
            id v11 = v13;
            uint32_t v12 = 32;
            goto LABEL_18;
          }
        }
      }
    }
  }
  else
  {
    time_t v8 = time(0);
    self->_int64_t lastSleepEntry = v8;
    if (v8 == -1 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005BF04();
    }
  }
}

- (BOOL)getFastDieEngagementStatus
{
  CFStringRef v2 = +[PowerZoneTelemetry sharedInstance];

  return [(PowerZoneTelemetry *)v2 isFastDieEngaged];
}

- (void)updateCoreAnalyticsInfo
{
  [(LifetimeServoController *)self getFastDieEngagementStatus];
  unsigned int v3 = [(LifetimeServoControlLoop *)self->_eCoreLoop dieTempTarget];
  int v4 = v3 - [(LifetimeServoControlLoop *)self->_eCoreLoop defaultDieTempTarget];
  if (v4 >= 0) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = -v4;
  }
  unsigned int v6 = [(LifetimeServoControlLoop *)self->_pCoreLoop dieTempTarget];
  int v7 = v6 - [(LifetimeServoControlLoop *)self->_pCoreLoop defaultDieTempTarget];
  if (v7 >= 0) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = -v7;
  }
  unsigned int v9 = [(LifetimeServoControlLoop *)self->_gCoreLoop dieTempTarget];
  int v10 = v9 - [(LifetimeServoControlLoop *)self->_gCoreLoop defaultDieTempTarget];
  if (v10 >= 0) {
    unsigned int v11 = v10;
  }
  else {
    unsigned int v11 = -v10;
  }
  signed int v12 = [(LifetimeServoControlLoop *)self->_eCoreLoop dieTempTarget] - self->_previousECoreDieTempTarget;
  if (v12 >= 0) {
    unsigned int v13 = v12;
  }
  else {
    unsigned int v13 = -v12;
  }
  signed int v14 = [(LifetimeServoControlLoop *)self->_pCoreLoop dieTempTarget] - self->_previousPCoreDieTempTarget;
  if (v14 >= 0) {
    unsigned int v15 = v14;
  }
  else {
    unsigned int v15 = -v14;
  }
  signed int v16 = [(LifetimeServoControlLoop *)self->_gCoreLoop dieTempTarget] - self->_previousGCoreDieTempTarget;
  if (v16 < 0) {
    signed int v16 = -v16;
  }
  if ((v13 > 1 || v15 > 1 || v16 >= 2)
    && (v5 / 0xC8 != dword_1000AA714 || v8 / 0xC8 != dword_1000AA718 || v11 / 0xC8 != dword_1000AA71C))
  {
    AnalyticsSendEventLazy();
    self->_previousECoreDieTempTarget = [(LifetimeServoControlLoop *)self->_eCoreLoop dieTempTarget];
    self->_previousPCoreDieTempTarget = [(LifetimeServoControlLoop *)self->_pCoreLoop dieTempTarget];
    self->_previousGCoreDieTempTarget = [(LifetimeServoControlLoop *)self->_gCoreLoop dieTempTarget];
    dword_1000AA714 = v5 / 0xC8;
    dword_1000AA718 = v8 / 0xC8;
    dword_1000AA71C = v11 / 0xC8;
  }
}

- (int)numberOfFields
{
  return 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  unsigned int v3 = @"LS-target-GPU";
  if (a3 != 1) {
    unsigned int v3 = 0;
  }
  if (a3) {
    return v3;
  }
  else {
    return @"LS-target-CPU";
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (!a3)
  {
    uint64_t v3 = 372;
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", *(unsigned int *)((char *)&self->super.isa + v3));
  }
  if (a3 == 1)
  {
    uint64_t v3 = 376;
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", *(unsigned int *)((char *)&self->super.isa + v3));
  }
  return 0;
}

@end