@interface BackLightCCSiriPlusButtonLED
- (BOOL)findBacklightServices;
- (BOOL)solarBehaviorSuppressed;
- (BOOL)solarDetectorPresent;
- (BackLightCCSiriPlusButtonLED)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)refreshFunctionalTelemetry;
- (void)setBrightnessKey:(id)a3 value:(int)a4;
- (void)setSolarBehaviorSuppressed:(BOOL)a3;
- (void)setSolarDetectorPresent:(BOOL)a3;
@end

@implementation BackLightCCSiriPlusButtonLED

- (BackLightCCSiriPlusButtonLED)initWithParams:(__CFDictionary *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BackLightCCSiriPlusButtonLED;
  v3 = [(BackLightCC *)&v6 initWithParams:a3];
  v4 = (BackLightCCSiriPlusButtonLED *)v3;
  if (v3)
  {
    *(_DWORD *)(v3 + 330) = -1;
    *(_DWORD *)(v3 + 338) = -1;
    *(_DWORD *)(v3 + 346) = 100;
    *(_DWORD *)(v3 + 334) = -1;
    *(_DWORD *)(v3 + 342) = -1;
    *(_DWORD *)(v3 + 350) = 100;
    [v3 setSolarBehaviorSuppressed:0];
  }
  return v4;
}

- (BOOL)findBacklightServices
{
  kern_return_t MatchingServices;
  BOOL v6;
  io_object_t v7;
  NSObject *v8;
  int v9;
  unsigned int v10;
  io_object_t v11;
  io_iterator_t existing;
  uint8_t buf[4];
  int v15;
  void *v16;
  void *v17;
  void *values;
  void *keys;

  keys = @"backlight-control";
  values = kCFBooleanTrue;
  *(&self->super._solarDetectorPresent + 5) = 0;
  CFDictionaryRef v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v16 = v3;
  v17 = @"IOPropertyMatch";
  CFDictionaryRef v4 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&v17, (const void **)&v16, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(v3);
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing);
  objc_super v6 = 0;
  if (!MatchingServices)
  {
    if (*((unsigned __int8 *)&self->super._solarDetectorPresent + 5) > 1u)
    {
      objc_super v6 = 0;
    }
    else
    {
      v7 = IOIteratorNext(existing);
      *(_DWORD *)((char *)&self->super._brightnessSystemClient
                + 4 * *((unsigned __int8 *)&self->super._solarDetectorPresent + 5)
                + 6) = v7;
      objc_super v6 = v7 != 0;
      if (v7)
      {
        do
        {
          if (byte_1000AA7A0)
          {
            v8 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              v9 = *((unsigned __int8 *)&self->super._solarDetectorPresent + 5);
              *(_DWORD *)buf = 67109120;
              v15 = v9;
              _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> Found display no:%d", buf, 8u);
            }
          }
          v10 = ++*(&self->super._solarDetectorPresent + 5);
          if (v10 >= 2) {
            break;
          }
          v11 = IOIteratorNext(existing);
          *(_DWORD *)((char *)&self->super._brightnessSystemClient
                    + 4 * *((unsigned __int8 *)&self->super._solarDetectorPresent + 5)
                    + 6) = v11;
        }
        while (v11);
      }
    }
    IOObjectRelease(existing);
  }
  return v6;
}

- (void)refreshFunctionalTelemetry
{
  v25.receiver = self;
  v25.super_class = (Class)BackLightCCSiriPlusButtonLED;
  [(BackLightCC *)&v25 refreshFunctionalTelemetry];
  if (*(&self->super._solarDetectorPresent + 5))
  {
    uint64_t v3 = 0;
    for (i = self; ; i = (BackLightCCSiriPlusButtonLED *)((char *)i + 4))
    {
      *(int *)((char *)&i->_brightnessMilliNitsCurrent[1] + 2) = 0;
      CFTypeRef v5 = sub_100008350(@"IODisplayParameters", *(_DWORD *)((char *)&i->super._brightnessSystemClient + 6));
      objc_super v6 = v5;
      if (v5)
      {
        CFTypeID v7 = CFGetTypeID(v5);
        if (v7 == CFDictionaryGetTypeID()) {
          break;
        }
      }
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_100054AC4(&v14, v15);
        if (!v6) {
          goto LABEL_36;
        }
      }
      else if (!v6)
      {
        goto LABEL_36;
      }
LABEL_35:
      CFRelease(v6);
LABEL_36:
      if (++v3 >= (unint64_t)*((unsigned __int8 *)&self->super._solarDetectorPresent + 5)) {
        return;
      }
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v6, @"brightness");
    v9 = CFDictionaryGetValue((CFDictionaryRef)v6, @"BrightnessMilliNits");
    if (Value && (CFTypeID v10 = CFGetTypeID(Value), v10 == CFDictionaryGetTypeID()))
    {
      uint64_t v24 = 0;
      if (sub_100008280(Value, @"value", kCFNumberIntType, (char *)&v24 + 4)
        && sub_100008280(Value, @"max", kCFNumberIntType, &v24))
      {
        int v11 = v24;
        if (v24)
        {
          if ((int)v24 >= 0) {
            int v12 = v24;
          }
          else {
            int v12 = v24 + 1;
          }
          int v11 = (100 * HIDWORD(v24) + (v12 >> 1)) / (int)v24;
        }
        *(int *)((char *)&i->_brightnessMilliNitsCurrent[1] + 2) = v11;
        if (!v9) {
          goto LABEL_33;
        }
LABEL_24:
        CFTypeID v13 = CFGetTypeID(v9);
        if (v13 == CFDictionaryGetTypeID())
        {
          if (!sub_100008280((CFDictionaryRef)v9, @"value", kCFNumberIntType, (char *)i->gPowerServiceBL + 2)|| (sub_100008280((CFDictionaryRef)v9, @"max", kCFNumberIntType, &i->displayCount + 2) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
              sub_100054B1C(&v18, v19);
            }
            *(unsigned int *)((char *)i->gPowerServiceBL + 2) = -1;
            *(_DWORD *)(&i->displayCount + 2) = -1;
          }
          goto LABEL_35;
        }
        goto LABEL_33;
      }
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_100054B74(&v22, v23);
        if (v9) {
          goto LABEL_24;
        }
LABEL_33:
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100054AF0(&v16, v17);
        }
        goto LABEL_35;
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100054B48(&v20, v21);
      if (v9) {
        goto LABEL_24;
      }
      goto LABEL_33;
    }
    if (v9) {
      goto LABEL_24;
    }
    goto LABEL_33;
  }
}

- (void)setBrightnessKey:(id)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (byte_1000AA7A0)
  {
    CFTypeID v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = a3;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> BL set %@ to %d", (uint8_t *)&v16, 0x12u);
    }
  }
  id v8 = [objc_alloc((Class)NSNumber) initWithInt:v4];
  id v9 = objc_alloc((Class)NSNumber);
  if ((int)v4 <= 15) {
    uint64_t v10 = 15;
  }
  else {
    uint64_t v10 = v4;
  }
  id v11 = [v9 initWithInt:v10];
  int v12 = v11;
  if (v8) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ([*(id *)&self->super.currentPowerLevel setProperty:@"DisplayTypeSiri" forKey:@"DisplaySelect"])
    {
      if (([*(id *)&self->super.currentPowerLevel setProperty:v12 forKey:a3] & 1) == 0)
      {
        char v14 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100054C18((uint64_t)a3, v14);
        }
      }
    }
    if ([*(id *)&self->super.currentPowerLevel setProperty:@"DisplayTypeIcon" forKey:@"DisplaySelect"])
    {
      if (([*(id *)&self->super.currentPowerLevel setProperty:v8 forKey:a3] & 1) == 0)
      {
        v15 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100054BA0((uint64_t)a3, v15);
        }
      }
    }
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)BackLightCCSiriPlusButtonLED;
  return [(BackLightCC *)&v3 numberOfFields] + 6;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)BackLightCCSiriPlusButtonLED;
  if ([(BackLightCC *)&v9 numberOfFields] <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BackLightCCSiriPlusButtonLED;
    unsigned int v6 = v3 - [(BackLightCC *)&v7 numberOfFields];
    if (v6 > 5) {
      return 0;
    }
    else {
      return off_100085268[v6];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BackLightCCSiriPlusButtonLED;
    return [(BackLightCC *)&v8 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)BackLightCCSiriPlusButtonLED;
  if ([(BackLightCC *)&v13 numberOfFields] <= a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)BackLightCCSiriPlusButtonLED;
    switch(v3 - [(BackLightCC *)&v11 numberOfFields])
    {
      case 0:
        CFAllocatorRef v6 = kCFAllocatorDefault;
        uint64_t v7 = 330;
        goto LABEL_7;
      case 1:
        CFAllocatorRef v6 = kCFAllocatorDefault;
        uint64_t v7 = 338;
LABEL_7:
        int v8 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v7);
        goto LABEL_12;
      case 2:
        CFAllocatorRef v6 = kCFAllocatorDefault;
        uint64_t v9 = *(unsigned int *)((char *)&self->_brightnessMilliNitsCurrent[1] + 2);
        goto LABEL_14;
      case 3:
        CFAllocatorRef v6 = kCFAllocatorDefault;
        uint64_t v10 = 330;
        goto LABEL_11;
      case 4:
        CFAllocatorRef v6 = kCFAllocatorDefault;
        uint64_t v10 = 338;
LABEL_11:
        int v8 = *(_DWORD *)((char *)&self->super.super.super.super.isa + v10 + 4);
LABEL_12:
        uint64_t v9 = ((v8 + 500) / 1000);
        goto LABEL_14;
      case 5:
        CFAllocatorRef v6 = kCFAllocatorDefault;
        uint64_t v9 = *(unsigned int *)((char *)self->_brightnessMilliNitsMaximum + 2);
LABEL_14:
        result = (__CFString *)CFStringCreateWithFormat(v6, 0, @"%d", v9);
        break;
      default:
        result = 0;
        break;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BackLightCCSiriPlusButtonLED;
    return [(BackLightCC *)&v12 copyFieldCurrentValueForIndex:v3];
  }
  return result;
}

- (BOOL)solarBehaviorSuppressed
{
  return BYTE2(self->_brightnessMilliNitsMaximum[1]);
}

- (void)setSolarBehaviorSuppressed:(BOOL)a3
{
  BYTE2(self->_brightnessMilliNitsMaximum[1]) = a3;
}

- (BOOL)solarDetectorPresent
{
  return HIBYTE(self->_brightnessMilliNitsMaximum[1]);
}

- (void)setSolarDetectorPresent:(BOOL)a3
{
  HIBYTE(self->_brightnessMilliNitsMaximum[1]) = a3;
}

@end