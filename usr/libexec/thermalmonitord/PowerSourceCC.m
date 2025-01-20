@interface PowerSourceCC
- (PowerSourceCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)dealloc;
- (void)defaultAction;
- (void)getAdaptorPMUValue;
- (void)refreshTGraphTelemetry;
@end

@implementation PowerSourceCC

- (PowerSourceCC)initWithParams:(__CFDictionary *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PowerSourceCC;
  v4 = [(ComponentControl *)&v13 initWithCC:1 :a3];
  v5 = v4;
  if (v4)
  {
    *(&v4->super.currentPower + 1) = 0;
    v4->chargeLevel = -1;
    *(_DWORD *)&v4->super.allowLIOverride = 100;
    v4->super.maxLoadingIndex = 0;
    v4->previousChargeLevel = 1199570944;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d PwrSrc ", 1);
    unsigned int v6 = sub_100037CD4("IOPMPowerSource", @"BatteryInstalled", kCFBooleanTrue);
    LODWORD(v5->smcThermalChargeRate) = v6;
    if (!v6 && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005BF6C();
      if (!a3) {
        goto LABEL_11;
      }
    }
    else if (!a3)
    {
      goto LABEL_11;
    }
    if (CFDictionaryContainsKey(a3, @"ChargeLimitTable"))
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a3, @"ChargeLimitTable");
      if (Value)
      {
        CFDictionaryRef v8 = Value;
        *(void *)&v5->familyCode = (id)CFDictionaryGetValue(Value, @"maxLIs");
        *(NSArray **)((char *)&v5->maxLITable + 4) = (NSArray *)(id)CFDictionaryGetValue(v8, @"chargeLimit");
        id v9 = [*(id *)&v5->familyCode count];
        if (v9 != [*(id *)((char *)&v5->maxLITable + 4) count]
          && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
        {
          sub_10005BF38();
        }
      }
LABEL_15:
      [(PowerSourceCC *)v5 getAdaptorPMUValue];
      return v5;
    }
LABEL_11:
    if (byte_1000AA7A0)
    {
      v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> No chargeLimit table defined in the plist, using the default one", buf, 2u);
      }
    }
    *(void *)&v5->familyCode = &off_10008D928;
    *(NSArray **)((char *)&v5->maxLITable + 4) = (NSArray *)&off_10008D940;
    goto LABEL_15;
  }
  return v5;
}

- (void)dealloc
{
  float smcThermalChargeRate = self->smcThermalChargeRate;
  if (smcThermalChargeRate != 0.0) {
    IOObjectRelease(LODWORD(smcThermalChargeRate));
  }

  *(void *)&self->familyCode = 0;
  *(NSArray **)((char *)&self->maxLITable + 4) = 0;
  v4.receiver = self;
  v4.super_class = (Class)PowerSourceCC;
  [(PidComponent *)&v4 dealloc];
}

- (void)defaultAction
{
  kern_return_t v17;
  NSObject *v18;
  _DWORD v19[2];

  if (LODWORD(self->smcThermalChargeRate))
  {
    if (self->super.previousValue != self->super.maxLoadingIndex)
    {
      v3 = (char *)[*(id *)&self->familyCode count];
      if (v3)
      {
        objc_super v4 = 0;
        v5 = v3 - 1;
        do
        {
          unsigned int v6 = [[objc_msgSend(*(id *)((char *)&self->maxLITable + 4), "objectAtIndex:", v4) intValue];
          unsigned int v7 = [[objc_msgSend(*(id *)&self->familyCode, "objectAtIndex:", v4) intValue];
          previousCFDictionaryRef Value = self->super.previousValue;
          if (previousValue > v7) {
            break;
          }
          *(&self->super.currentPower + 1) = v6;
        }
        while (previousValue != v7 && v5 != v4++);
      }
    }
    self->super.maxLoadingIndex = self->super.previousValue;
    BOOL v10 = sub_100038064(LODWORD(self->smcThermalChargeRate), @"IsCharging");
    v11 = &self->super.currentPower + 1;
    int v12 = *(&self->super.currentPower + 1);
    if (v12 != self->chargeLevel && v10)
    {
      if (byte_1000AA7A0)
      {
        v14 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          v19[0] = 67109120;
          v19[1] = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "<Notice> Setting chargeLimit to %d", (uint8_t *)v19, 8u);
        }
      }
      CFNumberRef v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, v11);
      if (v15)
      {
        CFNumberRef v16 = v15;
        v17 = IORegistryEntrySetCFProperty(LODWORD(self->smcThermalChargeRate), @"AppleChargeRateLimitIndex", v15);
        CFRelease(v16);
        if (v17)
        {
          if (((++dword_1000AA724 & 0x1F) == 0 || byte_1000AA7A0)
            && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            sub_10005C050();
          }
        }
        else
        {
          self->chargeLevel = *v11;
        }
      }
      else
      {
        v18 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_10005BFD4((int *)v11, v18);
        }
      }
    }
  }
  else if ((byte_1000AA720 & 1) == 0)
  {
    byte_1000AA720 = 1;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005BFA0();
    }
  }
}

- (void)getAdaptorPMUValue
{
  CFDictionaryRef v3 = IOPSCopyExternalPowerAdapterDetails();
  if (v3)
  {
    CFDictionaryRef v4 = v3;
    if (CFDictionaryContainsKey(v3, @"AdapterID"))
    {
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v4, @"AdapterID");
      if (Value)
      {
        CFNumberRef v6 = Value;
        CFTypeID v7 = CFGetTypeID(Value);
        if (v7 == CFNumberGetTypeID()) {
          CFNumberGetValue(v6, kCFNumberShortType, (char *)&self->pmuPowerService + 2);
        }
      }
    }
    if (CFDictionaryContainsKey(v4, @"Watts"))
    {
      CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(v4, @"Watts");
      if (v8)
      {
        CFNumberRef v9 = v8;
        CFTypeID v10 = CFGetTypeID(v8);
        if (v10 == CFNumberGetTypeID()) {
          CFNumberGetValue(v9, kCFNumberIntType, &self->inputCurrent);
        }
      }
    }
    if (CFDictionaryContainsKey(v4, @"FamilyCode"))
    {
      CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v4, @"FamilyCode");
      if (v11)
      {
        CFNumberRef v12 = v11;
        CFTypeID v13 = CFGetTypeID(v11);
        if (v13 == CFNumberGetTypeID()) {
          CFNumberGetValue(v12, kCFNumberIntType, &self->watts);
        }
      }
    }
    if (CFDictionaryContainsKey(v4, @"Current"))
    {
      CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(v4, @"Current");
      if (v14)
      {
        CFNumberRef v15 = v14;
        CFTypeID v16 = CFGetTypeID(v14);
        if (v16 == CFNumberGetTypeID()) {
          CFNumberGetValue(v15, kCFNumberShortType, &self->pmuPowerService);
        }
      }
    }
    if (CFDictionaryContainsKey(v4, @"PMUConfiguration"))
    {
      CFNumberRef v17 = (const __CFNumber *)CFDictionaryGetValue(v4, @"PMUConfiguration");
      if (v17)
      {
        CFNumberRef v18 = v17;
        CFTypeID v19 = CFGetTypeID(v17);
        if (v19 == CFNumberGetTypeID()) {
          CFNumberGetValue(v18, kCFNumberShortType, &self->availableCurrent);
        }
      }
    }
    CFRelease(v4);
  }
}

- (void)refreshTGraphTelemetry
{
  float smcThermalChargeRate = self->smcThermalChargeRate;
  if (smcThermalChargeRate != 0.0)
  {
    if (sub_100038064(LODWORD(smcThermalChargeRate), @"IsCharging")) {
      previousCFNumberRef Value = self->super.previousValue;
    }
    else {
      previousCFNumberRef Value = sub_100038064(LODWORD(self->smcThermalChargeRate), @"ExternalConnected");
    }
    *(_DWORD *)&self->super.allowLIOverride = previousValue;
    self->previousChargeLevel = [+[SensorDispatcherHelper sharedInstance] getValueFromSMCForKey:@"B1TI"];
  }
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)PowerSourceCC;
  return [(ComponentControl *)&v3 numberOfFields] + 2;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)PowerSourceCC;
  if ([(ComponentControl *)&v10 numberOfFields] <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)PowerSourceCC;
    unsigned int v6 = [(ComponentControl *)&v8 numberOfFields];
    if (v3 - v6 == 1) {
      CFTypeID v7 = @"B1TI - Charge rate thermal";
    }
    else {
      CFTypeID v7 = 0;
    }
    if (v3 == v6) {
      return @"PwrSrc - Charge limit index";
    }
    else {
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PowerSourceCC;
    return [(ComponentControl *)&v9 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)PowerSourceCC;
  if ([(ComponentControl *)&v9 numberOfFields] <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PowerSourceCC;
    int v6 = v3 - [(ComponentControl *)&v7 numberOfFields];
    if (v6 == 1)
    {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%f", *(float *)&self->previousChargeLevel);
    }
    else if (v6)
    {
      return 0;
    }
    else
    {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", *(&self->super.currentPower + 1));
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PowerSourceCC;
    return [(ComponentControl *)&v8 copyFieldCurrentValueForIndex:v3];
  }
}

@end