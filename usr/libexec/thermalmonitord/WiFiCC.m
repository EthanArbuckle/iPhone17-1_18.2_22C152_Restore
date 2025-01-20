@interface WiFiCC
- (WiFiCC)initWithParams:(__CFDictionary *)a3;
- (void)defaultAction;
- (void)refreshTGraphTelemetry;
@end

@implementation WiFiCC

- (WiFiCC)initWithParams:(__CFDictionary *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiCC;
  v4 = [(ComponentControl *)&v9 initWithCC:9 :0];
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d WiFi ", 9);
    v5->super.previousValue = v5->super.currentLoadingIndex;
    uint64_t v6 = WiFiManagerClientCreate();
    *(void *)(&v5->super.currentPower + 1) = v6;
    if (!v6)
    {
      v7 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100055BB8(v7);
      }
    }
    [(ComponentControl *)v5 updatePowerParameters:a3];
    if (sub_100037D8C(a3, @"expectsCPMSSupport", 0)) {
      [(ComponentControl *)v5 setCPMSMitigationState:1];
    }
  }
  return v5;
}

- (void)defaultAction
{
  if (self->super.currentLoadingIndex != self->super.maxLoadingIndex)
  {
    WiFiManagerClientSetThermalIndex();
    if (byte_1000AA7A0)
    {
      v3 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
        v5[0] = 67109120;
        v5[1] = currentLoadingIndex;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> Set the WiFi maxLI to %d", (uint8_t *)v5, 8u);
      }
    }
    self->super.maxLoadingIndex = self->super.currentLoadingIndex;
  }
}

- (void)refreshTGraphTelemetry
{
  unsigned int ThermalIndex = WiFiManagerClientGetThermalIndex();
  *(_DWORD *)&self->super.allowLIOverride = ThermalIndex;
  if (ThermalIndex >= 0x66)
  {
    int v4 = ThermalIndex;
    v5 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055BFC(v4, v5);
    }
  }
}

@end