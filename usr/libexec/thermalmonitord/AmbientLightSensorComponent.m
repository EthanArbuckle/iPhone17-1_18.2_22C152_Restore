@interface AmbientLightSensorComponent
- (AmbientLightSensorComponent)init;
- (BOOL)isContextTriggered;
- (BOOL)synchContext;
- (__CFArray)copySensorArray;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)ALS_FS;
- (int)ALS_IR;
- (int)IR_PRED;
- (int)getContextState;
- (int)numberOfFields;
- (int)temperature;
- (void)initHIDServices;
@end

@implementation AmbientLightSensorComponent

- (AmbientLightSensorComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)AmbientLightSensorComponent;
  v2 = [(AmbientLightSensorComponent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->ALS_FS = 0;
    v2->ALS_IR = 0;
    v2->IR_PRED = 0;
    v2->super.ctxType = 0;
    v2->previousSunlightLoadingIndexValue = 0;
    v2->sunlightLoadingIndexValue = 0;
    v2->temperature = 0;
    v2->thermalSunlightStateToken = -1;
    if (notify_register_check("com.apple.system.thermalsunlightstate", &v2->thermalSunlightStateToken)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054D0C();
    }
    [(AmbientLightSensorComponent *)v3 initHIDServices];
    [+[TGraphSampler sharedInstance] addtGraphDataSource:v3];
  }
  return v3;
}

- (int)getContextState
{
  return self->sunlightLoadingIndexValue;
}

- (BOOL)isContextTriggered
{
  return self->sunlightLoadingIndexValue == 100;
}

- (void)initHIDServices
{
  if (!self->_hidEventSystem)
  {
    v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    self->_hidEventSystem = v3;
    if (v3)
    {
      CFDictionaryRef v4 = sub_100039788(65280, 4);
      if (v4)
      {
        CFDictionaryRef v5 = v4;
        IOHIDEventSystemClientSetMatching();
        IOHIDEventSystemClientScheduleWithRunLoop();
        CFRelease(v5);
        v6 = [(AmbientLightSensorComponent *)self copySensorArray];
        if (v6)
        {
          CFArrayRef v7 = v6;
          if (CFArrayGetCount(v6) >= 1)
          {
            ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v7, 0);
            self->_service = ValueAtIndex;
            if (ValueAtIndex)
            {
              IOHIDServiceClientRegisterRemovalCallback();
            }
            else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
            {
              sub_100054D40();
            }
          }
          CFRelease(v7);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054934();
    }
  }
}

- (BOOL)synchContext
{
  if (!self->_service)
  {
    [(AmbientLightSensorComponent *)self initHIDServices];
LABEL_11:
    LOBYTE(v9) = 0;
    return v9;
  }
  uint64_t v3 = IOHIDServiceClientCopyEvent();
  if (!v3)
  {
    BOOL v9 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (!v9) {
      return v9;
    }
    sub_100054D74();
    goto LABEL_11;
  }
  CFDictionaryRef v4 = (const void *)v3;
  self->ALS_FS = IOHIDEventGetIntegerValue();
  int IntegerValue = IOHIDEventGetIntegerValue();
  self->ALS_IR = IntegerValue;
  int v6 = (int)((double)self->ALS_FS * -0.234 + 500.0 + (double)IntegerValue * 0.234);
  self->IR_PRED = v6;
  int v7 = (int)((double)self->ALS_IR * 0.5 + 50.0 + (double)v6 * -0.5);
  if (v7 <= -350) {
    int v7 = -350;
  }
  if (v7 >= 450) {
    int v7 = 450;
  }
  self->unsigned int temperature = v7;
  CFRelease(v4);
  self->previousSunlightLoadingIndexValue = self->sunlightLoadingIndexValue;
  if (dword_1000AA7BC < 0) {
    goto LABEL_17;
  }
  if (dword_1000AA7BC) {
    goto LABEL_9;
  }
  unsigned int temperature = self->temperature;
  if ((temperature & 0x80000000) != 0)
  {
LABEL_17:
    int sunlightLoadingIndexValue = 0;
    self->int sunlightLoadingIndexValue = 0;
    goto LABEL_18;
  }
  if (temperature <= 0x64)
  {
    int sunlightLoadingIndexValue = self->sunlightLoadingIndexValue;
    goto LABEL_18;
  }
LABEL_9:
  int sunlightLoadingIndexValue = 100;
  self->int sunlightLoadingIndexValue = 100;
LABEL_18:
  if (sunlightLoadingIndexValue == self->previousSunlightLoadingIndexValue
    || ((v11 = +[TGraphSampler sharedInstance],
         self->sunlightLoadingIndexValue)
      ? (uint64_t v12 = 100)
      : (uint64_t v12 = 0),
        [(TGraphSampler *)v11 updatePowerlogMiscState:2 value:v12],
        !notify_set_state(self->thermalSunlightStateToken, self->sunlightLoadingIndexValue)))
  {
    LOBYTE(v9) = 1;
    return v9;
  }
  BOOL v9 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    sub_100054DA8();
    goto LABEL_11;
  }
  return v9;
}

- (__CFArray)copySensorArray
{
  CFArrayRef v3 = IOHIDEventSystemClientCopyServices(self->_hidEventSystem);
  CFArrayRef v4 = v3;
  if (!v3 || (CFTypeID v5 = CFGetTypeID(v3), v5 != CFArrayGetTypeID()) || CFArrayGetCount(v4) <= 0)
  {
    if (self->_hidEventSystem)
    {
      IOHIDEventSystemClientUnscheduleWithRunLoop();
      CFRelease(self->_hidEventSystem);
      self->_hidEventSystem = 0;
    }
    v13 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054DDC(v13);
      if (!v4) {
        return 0;
      }
    }
    else if (!v4)
    {
      return 0;
    }
    CFArrayRef v14 = v4;
LABEL_21:
    CFRelease(v14);
    return 0;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (CFArrayGetCount(v4) >= 1)
  {
    CFIndex v7 = 0;
    do
    {
      ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v4, v7);
      int v9 = sub_10003985C(ValueAtIndex, @"PrimaryUsage");
      if (sub_10003985C(ValueAtIndex, @"PrimaryUsagePage") == 65280 && v9 == 4) {
        CFArrayAppendValue(Mutable, ValueAtIndex);
      }
      ++v7;
    }
    while (CFArrayGetCount(v4) > v7);
  }
  CFRelease(v4);
  if (!CFArrayGetCount(Mutable))
  {
    CFArrayRef v14 = Mutable;
    goto LABEL_21;
  }
  if (Mutable)
  {
    Copy = CFArrayCreateCopy(kCFAllocatorDefault, Mutable);
    CFRelease(Mutable);
    return Copy;
  }
  return 0;
}

- (int)numberOfFields
{
  return 3;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1000852B8[a3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", *(unsigned int *)((char *)&self->super.super.isa + *off_1000852D0[a3]));
  }
}

- (int)temperature
{
  return self->temperature;
}

- (int)ALS_FS
{
  return self->ALS_FS;
}

- (int)ALS_IR
{
  return self->ALS_IR;
}

- (int)IR_PRED
{
  return self->IR_PRED;
}

@end