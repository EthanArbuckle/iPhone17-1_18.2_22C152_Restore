@interface FanCC
- (FanCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (int)setFanRPM:(unsigned int)a3;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation FanCC

- (FanCC)initWithParams:(__CFDictionary *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)FanCC;
  v4 = [(ComponentControl *)&v15 initWithCC:8 :a3];
  v5 = v4;
  if (v4)
  {
    *(&v4->super.currentPower + 1) = 0;
    v4->fanRPM = 0;
    v4->previousFanRPM = 0;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    p_currentFanRPM = &v4->currentFanRPM;
    if ((sub_100008280(a3, @"minRPM", kCFNumberIntType, &v4->currentFanRPM) & 1) == 0
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100057F1C();
    }
    p_minRPM = &v5->minRPM;
    if ((sub_100008280(a3, @"maxRPM", kCFNumberIntType, &v5->minRPM) & 1) == 0
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100057EE8();
    }
    unsigned int v8 = *p_currentFanRPM;
    unsigned int v9 = *p_minRPM;
    if (*p_currentFanRPM > *p_minRPM)
    {
      v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "<Error> FanCC: maxRPM not greater than minRPM", buf, 2u);
        unsigned int v9 = *p_minRPM;
        unsigned int v8 = *p_currentFanRPM;
      }
    }
    *(float *)&v5->maxRPM = (float)((v9 - v8) / 0x64);
    v5->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d Fan ", 8);
    v5->super.maxLoadingIndex = 101;
    CFDictionaryRef v11 = IOServiceMatching("ApplePMPThermal");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v11);
    if (!MatchingService && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100057EB4();
    }
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&v5->scalingFactor)
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100057E80();
    }
    IOObjectRelease(MatchingService);
    [(FanCC *)v5 setFanRPM:0];
  }
  return v5;
}

- (void)defaultAction
{
  unsigned int previousValue = self->super.previousValue;
  if (previousValue == 101)
  {
    *(&self->super.currentPower + 1) = 0;
  }
  else if (previousValue != self->super.maxLoadingIndex)
  {
    unsigned int currentFanRPM = self->currentFanRPM + (int)(float)(*(float *)&self->maxRPM * (float)(100 - previousValue));
    if ((currentFanRPM & 0x80000000) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100057F50();
      }
      unsigned int currentFanRPM = 0;
    }
    *(&self->super.currentPower + 1) = currentFanRPM;
    if (self->currentFanRPM > currentFanRPM) {
      unsigned int currentFanRPM = self->currentFanRPM;
    }
    *(&self->super.currentPower + 1) = currentFanRPM;
    if (self->minRPM < currentFanRPM) {
      unsigned int currentFanRPM = self->minRPM;
    }
    *(&self->super.currentPower + 1) = currentFanRPM;
    dword_1000AB160 = currentFanRPM;
  }
  self->super.maxLoadingIndex = self->super.previousValue;
  uint64_t v5 = *(&self->super.currentPower + 1);
  unsigned int fanRPM = self->fanRPM;
  if (v5 != fanRPM)
  {
    if (byte_1000AA7A0)
    {
      v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        v8[0] = 67109376;
        v8[1] = v5;
        __int16 v9 = 1024;
        unsigned int v10 = fanRPM;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> FanCC: cur RPM %u, prev RPM %u", (uint8_t *)v8, 0xEu);
        uint64_t v5 = *(&self->super.currentPower + 1);
      }
    }
    [(FanCC *)self setFanRPM:v5];
  }
}

- (int)setFanRPM:(unsigned int)a3
{
  kern_return_t v5;
  NSObject *v7;
  int v8;
  uint64_t input;
  uint8_t buf[4];
  int v11;

  input = a3;
  uint64_t v5 = IOConnectCallScalarMethod(LODWORD(self->scalingFactor), 0, &input, 1u, 0, 0);
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100057F84();
    }
  }
  else
  {
    self->unsigned int fanRPM = a3;
    if (byte_1000AA7A0)
    {
      v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v8 = *(&self->super.currentPower + 1);
        *(_DWORD *)buf = 67109120;
        CFDictionaryRef v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> FanCC: set fan RPM to %u", buf, 8u);
      }
    }
  }
  return v5;
}

- (void)refreshTGraphTelemetry
{
  self->previousFanRPM = *(&self->super.currentPower + 1);
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)FanCC;
  return [(ComponentControl *)&v3 numberOfFields] + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)FanCC;
  if ([(ComponentControl *)&v10 numberOfFields] <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)FanCC;
    unsigned int v6 = [(ComponentControl *)&v8 numberOfFields];
    if (v3 - v6 == 1) {
      v7 = @"FanCC current RPM";
    }
    else {
      v7 = 0;
    }
    if (v3 == v6) {
      return @"FanCC target RPM";
    }
    else {
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FanCC;
    return [(ComponentControl *)&v9 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)FanCC;
  if ([(ComponentControl *)&v11 numberOfFields] > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)FanCC;
    return [(ComponentControl *)&v10 copyFieldCurrentValueForIndex:v3];
  }
  v9.receiver = self;
  v9.super_class = (Class)FanCC;
  int v6 = v3 - [(ComponentControl *)&v9 numberOfFields];
  if (v6 == 1)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 148;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%u", *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 140;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%u", *(unsigned int *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end