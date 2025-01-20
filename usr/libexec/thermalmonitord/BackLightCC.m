@interface BackLightCC
- (BOOL)findBacklightServices;
- (BOOL)shouldSuppressMitigations;
- (BOOL)solarBehaviorSuppressed;
- (BOOL)solarDetectorPresent;
- (BackLightCC)initWithParams:(__CFDictionary *)a3;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)numberOfFields;
- (void)defaultAction;
- (void)defaultCPMSAction;
- (void)initBrightnessTable:(__CFArray *)a3;
- (void)initPowerTable:(__CFArray *)a3;
- (void)refreshFunctionalTelemetry;
- (void)setBrightnessKey:(id)a3 value:(int)a4;
- (void)setCPMSMitigationState:(BOOL)a3;
- (void)setMaxLICeiling:(int)a3;
- (void)setMaxLICeilingSoft:(int)a3;
- (void)setSolarBehaviorSuppressed:(BOOL)a3;
- (void)setSolarDetectorPresent:(BOOL)a3;
@end

@implementation BackLightCC

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)BackLightCC;
  return [(ComponentControl *)&v3 numberOfFields] + 3;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11.receiver = self;
  v11.super_class = (Class)BackLightCC;
  if ([(ComponentControl *)&v11 numberOfFields] > a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)BackLightCC;
    return [(ComponentControl *)&v10 copyFieldCurrentValueForIndex:v3];
  }
  v9.receiver = self;
  v9.super_class = (Class)BackLightCC;
  int v6 = v3 - [(ComponentControl *)&v9 numberOfFields];
  if (v6 == 2)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t maxLICeiling = self->_maxLICeiling;
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%d", maxLICeiling);
  }
  if (v6 == 1)
  {
    CFAllocatorRef v7 = kCFAllocatorDefault;
    uint64_t maxLICeiling = self->brightnessLevelDown[5];
    return (__CFString *)CFStringCreateWithFormat(v7, 0, @"%d", maxLICeiling);
  }
  if (v6) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", [+[ContextAwareThermalManager sharedInstance] getContextState:0]);
  }
}

- (BOOL)shouldSuppressMitigations
{
  if (*((unsigned char *)&self->super.currentPower + 4)) {
    return ![(BackLightCC *)self solarBehaviorSuppressed];
  }
  else {
    return 0;
  }
}

- (void)refreshFunctionalTelemetry
{
  if (BYTE5(self->_brightnessSystemClient)) {
    *((unsigned char *)&self->super.currentPower + 4) = [+[ContextAwareThermalManager sharedInstance] isContextTriggered:0];
  }
}

- (BackLightCC)initWithParams:(__CFDictionary *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BackLightCC;
  v4 = [(ComponentControl *)&v13 initWithCC:0 :0];
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)&v4->super.currentPower + 5) = 0;
    *((unsigned char *)&v4->super.currentPower + 6) = 0;
    v4->brightnessLevelDown[6] = 100;
    v4->brightnessLevelDown[5] = 100;
    *(_DWORD *)&v4->super.allowLIOverride = -1;
    *(_DWORD *)&v4->brightnessLevelDown[7] = 100;
    v4->_uint64_t maxLICeiling = 100;
    v4->_maxLICeilingSoft = -1;
    v4->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d BackLight ", 0);
    v5->super.releaseMaxLI = 2;
    sub_100008280(a3, @"MaxReleaseRate", kCFNumberIntType, &v5->super.releaseMaxLI);
    if (![(BackLightCC *)v5 findBacklightServices]
      && os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100059ECC();
    }
    id v6 = objc_alloc_init((Class)BrightnessSystemClient);
    *(void *)&v5->currentPowerLevel = v6;
    if (v6)
    {
      if (byte_1000AA7A0)
      {
        id v7 = v6;
        v8 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> brightness client %p", buf, 0xCu);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_100059E98();
    }
    LOBYTE(v5->powerLevelDown[8]) = 0;
    [(ComponentControl *)v5 updatePowerParameters:a3];
    if (sub_100037D8C(a3, @"expectsCPMSSupport", 0))
    {
      Value = CFDictionaryGetValue(a3, @"BacklightPower");
      if (Value)
      {
        [(BackLightCC *)v5 initPowerTable:Value];
        [(BackLightCC *)v5 setCPMSMitigationState:1];
      }
      else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
      {
        sub_100059E64();
      }
    }
    objc_super v10 = CFDictionaryGetValue(a3, @"BacklightBrightness");
    if (v10) {
      [(BackLightCC *)v5 initBrightnessTable:v10];
    }
    LOBYTE(v5->_maxLICeilingSoftPrevious) = 0;
    *(_DWORD *)&v5->powerLevelElem = 0;
    if (LOBYTE(v5->super._minPower)) {
      int releaseRate = v5->super.releaseRate;
    }
    else {
      int releaseRate = 65000;
    }
    *(_DWORD *)&v5->powerLevelTableDefined = releaseRate;
  }
  return v5;
}

- (void)setBrightnessKey:(id)a3 value:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (byte_1000AA7A0)
  {
    id v7 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = a3;
      __int16 v13 = 1024;
      int v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<Notice> BL set %@ to %d", (uint8_t *)&v11, 0x12u);
    }
  }
  id v8 = [objc_alloc((Class)NSNumber) initWithInt:v4];
  if (v8)
  {
    objc_super v9 = v8;
    if (([*(id *)&self->currentPowerLevel setProperty:v8 forKey:a3] & 1) == 0)
    {
      objc_super v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100059F00((uint64_t)a3, v10);
      }
    }
  }
}

- (void)defaultAction
{
  unsigned int previousValue = self->super.previousValue;
  uint64_t v4 = *((unsigned __int8 *)&self->super.currentPower + 6);
  if (previousValue > *((unsigned __int8 *)&self->super.currentPower + v4 + 7))
  {
    if (!*((unsigned char *)&self->super.currentPower + 6)) {
      goto LABEL_8;
    }
    char v5 = -1;
    goto LABEL_7;
  }
  if (previousValue < self->brightnessLevels[v4 + 5]
    && *((unsigned __int8 *)&self->super.currentPower + 5) - 1 > (int)v4)
  {
    char v5 = 1;
LABEL_7:
    *((unsigned char *)&self->super.currentPower + 6) = v4 + v5;
  }
LABEL_8:
  self->brightnessLevelDown[6] = self->brightnessLevelDown[5];
  uint64_t v6 = self->brightnessLevelUp[*((unsigned __int8 *)&self->super.currentPower + 6) + 5];
  self->brightnessLevelDown[5] = v6;
  int v7 = *(_DWORD *)&self->brightnessLevelDown[7];
  if (v7 < (int)v6)
  {
    uint64_t v6 = *(_DWORD *)&self->brightnessLevelDown[7];
    self->brightnessLevelDown[5] = v7;
  }
  if (!LOBYTE(self->powerLevelDown[8]))
  {
    if (v6 != self->brightnessLevelDown[6])
    {
      id v8 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 67109120;
        int v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> set Backlight: %d", (uint8_t *)&v11, 8u);
        uint64_t v6 = self->brightnessLevelDown[5];
      }
      [(BackLightCC *)self setBrightnessKey:@"MaxBrightness" value:v6];
    }
    uint64_t maxLICeiling = self->_maxLICeiling;
    if (maxLICeiling != self->_maxLICeilingSoft)
    {
      objc_super v10 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 67109120;
        int v12 = maxLICeiling;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> BL soft: %d", (uint8_t *)&v11, 8u);
        uint64_t maxLICeiling = self->_maxLICeiling;
      }
      [(BackLightCC *)self setBrightnessKey:@"BrightnessWeakCap" value:maxLICeiling];
      self->_maxLICeilingSoft = self->_maxLICeiling;
    }
  }
}

- (void)defaultCPMSAction
{
  unsigned int previousValue = self->super.previousValue;
  uint64_t v4 = *(unsigned int *)&self->powerLevelElem;
  if (previousValue <= *(&self->powerLevelPointer + v4))
  {
    if (previousValue >= self->powerLevels[v4 + 8]
      || v4 >= LOBYTE(self->_maxLICeilingSoftPrevious) - 1)
    {
      goto LABEL_8;
    }
    int v5 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_8;
    }
    int v5 = -1;
  }
  LODWORD(v4) = v4 + v5;
  *(_DWORD *)&self->powerLevelElem = v4;
LABEL_8:
  if (self->super.previousValue == 101) {
    unsigned int releaseRate = self->super.releaseRate;
  }
  else {
    unsigned int releaseRate = self->powerLevelUp[v4 + 8];
  }
  *(_DWORD *)&self->powerLevelTableDefined = releaseRate;
  unsigned int v7 = self->super.releaseRate;
  if (releaseRate > v7)
  {
    *(_DWORD *)&self->powerLevelTableDefined = v7;
    unsigned int releaseRate = v7;
  }
  if (releaseRate != [(ComponentControl *)self powerTarget])
  {
    [(ComponentControl *)self setPowerTarget:*(unsigned int *)&self->powerLevelTableDefined];
    if (byte_1000AA7A0)
    {
      id v8 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        objc_super v10 = [(PidComponent *)self nameofComponent];
        __int16 v11 = 1024;
        unsigned int v12 = [(ComponentControl *)self powerTarget];
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<Notice> DefaultCPMSAction for %@, set powerTarget:%u", (uint8_t *)&v9, 0x12u);
      }
    }
    [+[CPMSHelper sharedInstance] addToCPMSMitigationArray:[(ComponentControl *)self powerTarget] forComponent:self->super.super.mitigationType];
  }
}

- (void)setMaxLICeiling:(int)a3
{
  *(_DWORD *)&self->brightnessLevelDown[7] = a3;
}

- (void)setMaxLICeilingSoft:(int)a3
{
  self->_uint64_t maxLICeiling = a3;
}

- (void)initBrightnessTable:(__CFArray *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == CFArrayGetTypeID()))
  {
    uint64_t v17 = 0;
    int valuePtr = 0;
    char Count = CFArrayGetCount(a3);
    *((unsigned char *)&self->super.currentPower + 5) = Count;
    if (Count)
    {
      unint64_t v7 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        if (ValueAtIndex && (CFDictionaryRef v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 == CFDictionaryGetTypeID()))
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"up");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            *((unsigned char *)&self->super.currentPower + v7 + 7) = valuePtr;
          }
          CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v9, @"down");
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->brightnessLevels[v7 + 5] = v17;
          }
          CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v9, @"level");
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->brightnessLevelUp[v7 + 5] = BYTE4(v17);
          }
        }
        else
        {
          int v14 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v19 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<Error> Missing Brightness Dictionary %d", buf, 8u);
          }
        }
        ++v7;
      }
      while (v7 < *((unsigned __int8 *)&self->super.currentPower + 5));
    }
  }
  else
  {
    for (uint64_t i = 0; i != 9; ++i)
    {
      self->brightnessLevelUp[i + 5] = 100;
      self->brightnessLevels[i + 5] = 100;
      *((unsigned char *)&self->super.currentPower + i + 7) = 100;
    }
    *((unsigned char *)&self->super.currentPower + 5) = 5;
  }
}

- (void)initPowerTable:(__CFArray *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == CFArrayGetTypeID()))
  {
    uint64_t v17 = 0;
    unsigned int valuePtr = 0;
    char Count = CFArrayGetCount(a3);
    LOBYTE(self->_maxLICeilingSoftPrevious) = Count;
    if (Count)
    {
      unint64_t v7 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a3, v7);
        if (ValueAtIndex && (CFDictionaryRef v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 == CFDictionaryGetTypeID()))
        {
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v9, @"up");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
            *(&self->powerLevelPointer + v7) = valuePtr;
          }
          CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v9, @"down");
          if (v12)
          {
            CFNumberGetValue(v12, kCFNumberSInt32Type, &v17);
            self->powerLevels[v7 + 8] = v17;
          }
          CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v9, @"level");
          if (v13)
          {
            CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)&v17 + 4);
            self->powerLevelUp[v7 + 8] = HIDWORD(v17);
          }
        }
        else
        {
          int v14 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v19 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<Error> Missing Display Power Dictionary %d", buf, 8u);
          }
        }
        ++v7;
      }
      while (v7 < LOBYTE(self->_maxLICeilingSoftPrevious));
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100059F78();
    }
    for (uint64_t i = 0; i != 9; ++i)
    {
      self->powerLevelUp[i + 8] = 65000;
      self->powerLevels[i + 8] = 100;
      *(unsigned int *)((char *)&self->powerLevelPointer + i * 4) = 100;
    }
    LOBYTE(self->_maxLICeilingSoftPrevious) = 5;
  }
  LOBYTE(self->powerLevelDown[8]) = 1;
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  if (a3)
  {
    if (LOBYTE(self->powerLevelDown[8]))
    {
      *(void *)&a3 = 1;
    }
    else
    {
      uint64_t v4 = qword_1000AABC0;
      BOOL v5 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT);
      *(void *)&a3 = 0;
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> No powerLevelTable defined, cannot enable CPMS Mitigations for backlightCC", buf, 2u);
        *(void *)&a3 = 0;
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)BackLightCC;
  [(ComponentControl *)&v6 setCPMSMitigationState:a3];
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)BackLightCC;
  if ([(ComponentControl *)&v9 numberOfFields] <= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)BackLightCC;
    unsigned int v6 = v3 - [(ComponentControl *)&v7 numberOfFields];
    if (v6 > 2) {
      return 0;
    }
    else {
      return off_1000861E0[v6];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BackLightCC;
    return [(ComponentControl *)&v8 copyHeaderForIndex:v3];
  }
}

- (BOOL)findBacklightServices
{
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100059FAC();
  }
  return 0;
}

- (BOOL)solarBehaviorSuppressed
{
  return BYTE4(self->_brightnessSystemClient);
}

- (void)setSolarBehaviorSuppressed:(BOOL)a3
{
  BYTE4(self->_brightnessSystemClient) = a3;
}

- (BOOL)solarDetectorPresent
{
  return BYTE5(self->_brightnessSystemClient);
}

- (void)setSolarDetectorPresent:(BOOL)a3
{
  BYTE5(self->_brightnessSystemClient) = a3;
}

@end