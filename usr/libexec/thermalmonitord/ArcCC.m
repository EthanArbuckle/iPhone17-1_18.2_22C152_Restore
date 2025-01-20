@interface ArcCC
- (ArcCC)initWithParams:(__CFDictionary *)a3 product:(id)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation ArcCC

- (ArcCC)initWithParams:(__CFDictionary *)a3 product:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ArcCC;
  v6 = [(ComponentControl *)&v11 initWithCC:11 :0];
  v7 = (ArcCC *)v6;
  if (v6)
  {
    *(void *)(v6 + 140) = a4;
    *((_DWORD *)v6 + 18) = 100;
    *((_DWORD *)v6 + 39) = 1065353216;
    *((_DWORD *)v6 + 40) = -1082130432;
    *((void *)v6 + 6) = CFStringCreateWithFormat(0, 0, @"%d Arc ", 11);
    v7->super.previousValue = v7->super.currentLoadingIndex;
    sub_100008280(a3, @"thresholdModule", kCFNumberIntType, (char *)&v7->_product + 4);
    if (byte_1000AA7A0)
    {
      v8 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int product_high = HIDWORD(v7->_product);
        *(_DWORD *)buf = 67109120;
        int v13 = product_high;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Got ArcCC module threshold: %d", buf, 8u);
      }
    }
  }
  return v7;
}

- (void)defaultAction
{
  int v3 = [*(id *)(&self->super.currentPower + 1) arcModuleTemperature];
  self->_thresholdModuleTemperature = v3;
  if (*(void *)(&self->super.currentPower + 1))
  {
    if (v3 <= SHIDWORD(self->_product))
    {
      float v6 = *(float *)&self->_latestModuleTemperature;
      float v7 = 1.0;
      if (v6 < 1.0)
      {
        self->_latestModuleTemperature = 1065353216;
        float v6 = 1.0;
      }
    }
    else
    {
      LODWORD(v4) = self->super.currentLoadingIndex;
      float v5 = (double)v4 / 100.0;
      *(float *)&unint64_t v4 = v5 * v5;
      if (*(float *)&v4 <= 1.0) {
        float v6 = *(float *)&v4;
      }
      else {
        float v6 = 1.0;
      }
      *(float *)&self->_latestModuleTemperature = v6;
      float v7 = v6;
    }
    if (self->_currentHapticGain != v6)
    {
      if (byte_1000AA7A0)
      {
        v8 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 134217984;
          double v13 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> ArcCC: setting gain %.4f", (uint8_t *)&v12, 0xCu);
        }
      }
      v9 = +[AVAudioSession sharedInstance];
      *(float *)&double v10 = v7;
      if (([(AVAudioSession *)v9 setHapticThermalGain:0 error:v10] & 1) == 0)
      {
        objc_super v11 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005A344(v11);
        }
      }
    }
    LODWORD(self->_currentHapticGain) = self->_latestModuleTemperature;
  }
}

- (void)refreshTGraphTelemetry
{
  [+[AVAudioSession sharedInstance] hapticThermalGain];
  float v4 = v3;
  if (v3 < 0.0 || v3 > 1.0)
  {
    *(_DWORD *)&self->super.allowLIOverride = 0;
    float v6 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005A388(v6, v4);
    }
  }
  else
  {
    self->_targetHapticGain = v3;
    float v7 = fabsf(sqrtf(v3)) * 100.0;
    if (v4 == -INFINITY) {
      float v7 = INFINITY;
    }
    *(_DWORD *)&self->super.allowLIOverride = (int)v7;
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)ArcCC;
  return [(ComponentControl *)&v3 numberOfFields] + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)ArcCC;
  if ([(ComponentControl *)&v10 numberOfFields] <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)ArcCC;
    unsigned int v6 = [(ComponentControl *)&v8 numberOfFields];
    if (v3 - v6 == 1) {
      float v7 = @"ArcCC current gain";
    }
    else {
      float v7 = 0;
    }
    if (v3 == v6) {
      return @"ArcCC target gain";
    }
    else {
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)ArcCC;
    return [(ComponentControl *)&v9 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)ArcCC;
  if ([(ComponentControl *)&v11 numberOfFields] > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)ArcCC;
    return [(ComponentControl *)&v10 copyFieldCurrentValueForIndex:v3];
  }
  v9.receiver = self;
  v9.super_class = (Class)ArcCC;
  int v6 = v3 - [(ComponentControl *)&v9 numberOfFields];
  if (v6 == 1)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 160;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%f", *(float *)((char *)&self->super.super.super.isa + v8));
  }
  if (!v6)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 156;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%f", *(float *)((char *)&self->super.super.super.isa + v8));
  }
  return 0;
}

@end