@interface BackLightCCSingle
- (BOOL)findBacklightServices;
- (BackLightCCSingle)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)refreshFunctionalTelemetry;
- (void)updateSensorExchangeTelemetry;
@end

@implementation BackLightCCSingle

- (void)refreshFunctionalTelemetry
{
  v23.receiver = self;
  v23.super_class = (Class)BackLightCCSingle;
  [(BackLightCC *)&v23 refreshFunctionalTelemetry];
  *(_DWORD *)&self->super.super.allowLIOverride = 0;
  CFDictionaryRef v3 = (const __CFDictionary *)sub_100008350(@"IODisplayParameters", *(_DWORD *)((char *)&self->super._brightnessSystemClient + 6));
  CFDictionaryRef v4 = v3;
  if (v3)
  {
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID())
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v4, @"brightness");
      v7 = CFDictionaryGetValue(v4, @"BrightnessMilliNits");
      if (Value && (CFTypeID v8 = CFGetTypeID(Value), v8 == CFDictionaryGetTypeID()))
      {
        int v21 = 0;
        *(_DWORD *)buf = 0;
        if (sub_100008280(Value, @"value", kCFNumberIntType, buf)
          && sub_100008280(Value, @"max", kCFNumberIntType, &v21))
        {
          int v9 = v21;
          if (v21)
          {
            if (v21 >= 0) {
              int v10 = v21;
            }
            else {
              int v10 = v21 + 1;
            }
            int v9 = (100 * *(_DWORD *)buf + (v10 >> 1)) / v21;
          }
          *(_DWORD *)&self->super.super.allowLIOverride = v9;
          if (!v7) {
            goto LABEL_28;
          }
LABEL_21:
          CFTypeID v11 = CFGetTypeID(v7);
          if (v11 == CFDictionaryGetTypeID())
          {
            if (!sub_100008280((CFDictionaryRef)v7, @"value", kCFNumberIntType, &self->super._solarDetectorPresent + 1)|| (sub_100008280((CFDictionaryRef)v7, @"max", kCFNumberIntType, &self->super._solarDetectorPresent + 5) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
                sub_10005A128();
              }
              *(_DWORD *)(&self->super._solarDetectorPresent + 1) = -1;
              *(_DWORD *)(&self->super._solarDetectorPresent + 5) = -1;
            }
            goto LABEL_30;
          }
LABEL_28:
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_10005A0F4();
          }
          goto LABEL_30;
        }
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_10005A190();
          if (!v7) {
            goto LABEL_28;
          }
          goto LABEL_21;
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_10005A15C();
        if (!v7) {
          goto LABEL_28;
        }
        goto LABEL_21;
      }
      if (!v7) {
        goto LABEL_28;
      }
      goto LABEL_21;
    }
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005A0C0();
  }
LABEL_30:
  if (byte_1000AB0E0)
  {
    io_registry_entry_t v12 = *(_DWORD *)((char *)&self->lastDisplayReading + 6);
    if (v12)
    {
      CFTypeRef v13 = sub_100008350(@"IOMFBBrightnessLevel", v12);
      v14 = (void *)v13;
      if (v13)
      {
        CFTypeID v15 = CFGetTypeID(v13);
        if (v15 == CFNumberGetTypeID())
        {
          *(float *)&dword_1000AADF4 = (float)(int)[v14 intValue] * 0.000015259;
LABEL_38:
          CFRelease(v14);
          goto LABEL_39;
        }
      }
      v16 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<Notice> IOMFB brightness not available or not a number type\n", buf, 2u);
      }
      if (v14) {
        goto LABEL_38;
      }
    }
  }
LABEL_39:
  if (!*(void *)((char *)&self->_brightnessMilliNitsMaximum + 6)
    || !*(void *)((char *)&self->_brightnessMilliNitsCurrent + 2))
  {
LABEL_44:
    if (v4) {
      CFRelease(v4);
    }
    return;
  }
  v17 = +[NSDate date];
  uint64_t Samples = IOReportCreateSamples();
  if (Samples)
  {
    v19 = (__IOReportSubscriptionCF *)Samples;
    SamplesDelta = (const void *)IOReportCreateSamplesDelta();
    CFRelease(*(CFTypeRef *)((char *)&self->displaySubscription + 6));
    *(__IOReportSubscriptionCF **)((char *)&self->displaySubscription + 6) = v19;
    [(NSDate *)v17 timeIntervalSinceDate:*(__CFDictionary **)((char *)&self->displayChannels + 6)];
    *(__CFDictionary **)((char *)&self->displayChannels + 6) = (__CFDictionary *)v17;
    IOReportIterate();
    if (SamplesDelta) {
      CFRelease(SamplesDelta);
    }
    goto LABEL_44;
  }
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_10005A08C();
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)BackLightCCSingle;
  return [(BackLightCC *)&v3 numberOfFields] + 2;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)BackLightCCSingle;
  if ([(BackLightCC *)&v12 numberOfFields] > a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)BackLightCCSingle;
    return [(BackLightCC *)&v11 copyFieldCurrentValueForIndex:v3];
  }
  v10.receiver = self;
  v10.super_class = (Class)BackLightCCSingle;
  int v6 = v3 - [(BackLightCC *)&v10 numberOfFields];
  if (v6 == 1)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 326;
    goto LABEL_7;
  }
  if (!v6)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t v8 = 322;
LABEL_7:
    uint64_t v9 = 274877907 * (*(_DWORD *)((char *)&self->super.super.super.super.isa + v8) + 500);
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%d", (v9 >> 38) + ((unint64_t)v9 >> 63));
  }
  return 0;
}

- (void)updateSensorExchangeTelemetry
{
  uint64_t v2 = 274877907 * (*(_DWORD *)(&self->super._solarDetectorPresent + 5) + 500);
  *(float *)&dword_1000AADF0 = (float)(int)((v2 >> 38) + ((unint64_t)v2 >> 63));
  *(float *)&dword_1000AAE04 = (float)*(unsigned int *)&self->super.super.allowLIOverride;
}

- (BackLightCCSingle)initWithParams:(__CFDictionary *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BackLightCCSingle;
  uint64_t v3 = [(BackLightCC *)&v10 initWithParams:a3];
  CFDictionaryRef v4 = v3;
  if (v3)
  {
    *((_DWORD *)v3 + 18) = 100;
    *(_DWORD *)(v3 + 322) = -1;
    *(_DWORD *)(v3 + 326) = -1;
    [v3 setSolarBehaviorSuppressed:0];
    if (byte_1000AB0E0)
    {
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:5 forSMCKey:@"zETM" atSMCIndex:5];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:4 forSMCKey:@"zETM" atSMCIndex:4];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:9 forSMCKey:@"zETM" atSMCIndex:9];
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:16 forSMCKey:@"zETM" atSMCIndex:16];
      int MainDisplay = IOMobileFramebufferGetMainDisplay();
      if (MainDisplay || !qword_1000AB150)
      {
        int v6 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005A014(MainDisplay, v6);
        }
        qword_1000AB150 = 0;
      }
      else
      {
        *(_DWORD *)(v4 + 366) = IOMobileFramebufferGetServiceObject();
      }
    }
    uint64_t v7 = IOReportCopyChannelsInGroup();
    if (v7)
    {
      uint64_t v8 = (const void *)v7;
      *(void *)(v4 + 334) = IOReportCreateSubscription();
      CFRelease(v8);
      if (*(void *)(v4 + 342) && *(void *)(v4 + 334))
      {
        *(void *)(v4 + 350) = IOReportCreateSamples();
        *(void *)(v4 + 358) = +[NSDate date];
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100059FE0();
    }
  }
  return (BackLightCCSingle *)v4;
}

- (BOOL)findBacklightServices
{
  unsigned int v3 = sub_100037CD4("AppleARMBacklight", @"backlight-control", kCFBooleanTrue);
  *(_DWORD *)((char *)&self->super._brightnessSystemClient + 6) = v3;
  if (!v3 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100059ECC();
  }
  return v3 != 0;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)BackLightCCSingle;
  if ([(BackLightCC *)&v10 numberOfFields] <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)BackLightCCSingle;
    unsigned int v6 = [(BackLightCC *)&v8 numberOfFields];
    if (v3 - v6 == 1) {
      uint64_t v7 = @"Backlight - nits maximum";
    }
    else {
      uint64_t v7 = 0;
    }
    if (v3 == v6) {
      return @"Backlight - nits current";
    }
    else {
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BackLightCCSingle;
    return [(BackLightCC *)&v9 copyHeaderForIndex:v3];
  }
}

@end