@interface ComponentControl
- (BOOL)allowLIOverride;
- (BOOL)initialCPMSBudgetSent;
- (BOOL)isCPMSControlActive;
- (BOOL)isCPMSControlEnabled;
- (BOOL)isEqualMType:(int)a3;
- (BOOL)shouldDoCPMSActions;
- (ComponentControl)initWithCC:(int)a3 :(__CFDictionary *)a4;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (__CFString)getPowerlogKey;
- (int)getPowerlogFieldCurrentValue;
- (int)getReleaseMaxLI;
- (int)getReleaseRate;
- (int)numberOfFields;
- (unint64_t)mitigationDetails;
- (unsigned)computePowerTarget;
- (unsigned)currentLoadingIndex;
- (unsigned)currentPower;
- (unsigned)maxLoadingIndex;
- (unsigned)powerTarget;
- (unsigned)releaseMaxLI;
- (unsigned)releaseRate;
- (void)defaultAction;
- (void)defaultCPMSAction;
- (void)refreshCPMSTGraphTelemetry;
- (void)resetCPMSMitigationState;
- (void)setAllowLIOverride:(BOOL)a3;
- (void)setCPMSMitigationState:(BOOL)a3;
- (void)setCurrentLoadingIndex:(unsigned int)a3;
- (void)setCurrentPower:(unsigned int)a3;
- (void)setInitialCPMSBudgetSent:(BOOL)a3;
- (void)setIsCPMSControlActive:(BOOL)a3;
- (void)setIsCPMSControlEnabled:(BOOL)a3;
- (void)setMaxLoadingIndex:(unsigned int)a3;
- (void)setMaxLoadingIndex:(unsigned int)a3 releaseIndex:(unsigned int)a4;
- (void)setMitigationDetails:(unint64_t)a3;
- (void)setPowerTarget:(unsigned int)a3;
- (void)setReleaseMaxLI:(unsigned int)a3;
- (void)setReleaseRate:(unsigned int)a3;
- (void)testLoadingIndexLevel;
- (void)updatePowerParameters:(__CFDictionary *)a3;
@end

@implementation ComponentControl

- (void)testLoadingIndexLevel
{
  if (sub_1000052E4())
  {
    [(ComponentControl *)self refreshTGraphTelemetry];
    if (!byte_1000AA7A1) {
      [(ComponentControl *)self refreshCPMSTGraphTelemetry];
    }
  }
  [(ComponentControl *)self refreshFunctionalTelemetry];
  [(ComponentControl *)self updateSensorExchangeTelemetry];
  if (byte_1000A2510) {
    BOOL v3 = byte_1000AA7A1 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    if ([(ComponentControl *)self shouldDoCPMSActions])
    {
      [(ComponentControl *)self defaultCPMSAction];
    }
    else
    {
      [(ComponentControl *)self defaultAction];
    }
  }
}

- (int)numberOfFields
{
  return 6;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  switch(a3)
  {
    case 0:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t v4 = 72;
      goto LABEL_9;
    case 1:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t v4 = 76;
      goto LABEL_9;
    case 2:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t v4 = 84;
      goto LABEL_9;
    case 3:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t isCPMSControlActive = self->isCPMSControlActive;
      goto LABEL_10;
    case 4:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t v4 = 132;
      goto LABEL_9;
    case 5:
      CFAllocatorRef v3 = kCFAllocatorDefault;
      uint64_t v4 = 136;
LABEL_9:
      uint64_t isCPMSControlActive = *(unsigned int *)((char *)&self->super.super.isa + v4);
LABEL_10:
      result = (__CFString *)CFStringCreateWithFormat(v3, 0, @"%d", isCPMSControlActive);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)isEqualMType:(int)a3
{
  return [(PidComponent *)self mitigationType] == a3;
}

- (void)setMaxLoadingIndex:(unsigned int)a3 releaseIndex:(unsigned int)a4
{
  if (!*((unsigned char *)&self->super.controlEffort + 4))
  {
    self->currentLoadingIndex = a3;
    self->previousValue = a4;
  }
}

- (int)getReleaseMaxLI
{
  return self->previousValue;
}

- (ComponentControl)initWithCC:(int)a3 :(__CFDictionary *)a4
{
  uint64_t v5 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)ComponentControl;
  v6 = [(PidComponent *)&v9 initPIDWith:a4];
  v7 = v6;
  if (v6)
  {
    *((unsigned char *)&v6->super.controlEffort + 4) = 0;
    *(_DWORD *)&v6->allowLIOverride = 0;
    v6->currentLoadingIndex = 100;
    v6->previousValue = 100;
    v6->super.mitigationType = v5;
    v6->super.nameofComponent = 0;
    v6->maxLoadingIndex = 100;
    v6->releaseMaxLI = 999;
    sub_100008280(a4, @"MaxReleaseRate", kCFNumberIntType, &v6->releaseMaxLI);
    v7->_powerlogKeyMaxLI = (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"Max LI%d", v5);
    v7->_nominalPowerTarget = 0;
    v7->_maxPower = 0;
    v7->powerTarget = 0;
    v7->currentPower = 0;
    v7->uint64_t isCPMSControlActive = 0;
    LOBYTE(v7->_minPower) = 0;
    v7->mitigationDetails = 0;
    v7->initialCPMSBudgetSent = 0;
  }
  return v7;
}

- (void)defaultAction
{
  v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100056FF0(v2);
  }
}

- (void)defaultCPMSAction
{
  uint64_t v3 = [(ComponentControl *)self computePowerTarget];
  if (self->initialCPMSBudgetSent)
  {
    if (self->previousValue != self->maxLoadingIndex)
    {
      if (v3 != [(ComponentControl *)self powerTarget])
      {
        [(ComponentControl *)self setPowerTarget:v3];
        if (byte_1000AA7A0)
        {
          uint64_t v4 = qword_1000AABC0;
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
          {
            int v6 = 138412802;
            v7 = [(PidComponent *)self nameofComponent];
            __int16 v8 = 1024;
            unsigned int v9 = [(ComponentControl *)self powerTarget];
            __int16 v10 = 2048;
            unint64_t v11 = [(ComponentControl *)self mitigationDetails];
            _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> DefaultCPMSAction for %@, set powerTarget:%u with details: %llu", (uint8_t *)&v6, 0x1Cu);
          }
        }
        [+[CPMSHelper sharedInstance] addToCPMSMitigationArray:[(ComponentControl *)self powerTarget] withDetails:[(ComponentControl *)self mitigationDetails] forComponent:[(PidComponent *)self mitigationType]];
      }
      self->maxLoadingIndex = self->previousValue;
    }
  }
  else
  {
    if (byte_1000AA7A0)
    {
      uint64_t v5 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 138412802;
        v7 = [(PidComponent *)self nameofComponent];
        __int16 v8 = 1024;
        unsigned int v9 = v3;
        __int16 v10 = 2048;
        unint64_t v11 = [(ComponentControl *)self mitigationDetails];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Initial CPMS budget sent for %@, set powerTarget:%u with details: %llu", (uint8_t *)&v6, 0x1Cu);
      }
    }
    [+[CPMSHelper sharedInstance] addToCPMSMitigationArray:v3 withDetails:[(ComponentControl *)self mitigationDetails] forComponent:[(PidComponent *)self mitigationType]];
    self->initialCPMSBudgetSent = 1;
  }
}

- (unsigned)computePowerTarget
{
  unsigned int result = self->releaseRate;
  unsigned int maxPower = self->_maxPower;
  int v5 = self->_nominalPowerTarget - maxPower;
  if (v5 >= 1)
  {
    unsigned int previousValue = self->previousValue;
    if (previousValue <= 0x64) {
      return previousValue * v5 / 0x64 + maxPower;
    }
  }
  return result;
}

- (void)refreshCPMSTGraphTelemetry
{
  if ([(ComponentControl *)self shouldDoCPMSActions])
  {
    uint64_t v3 = +[CPMSHelper sharedInstance];
    uint64_t v4 = [(PidComponent *)self mitigationType];
    [(CPMSHelper *)v3 requestCurrentPowerCallbackForComponent:v4];
  }
}

- (BOOL)shouldDoCPMSActions
{
  BOOL v3 = [(ComponentControl *)self isCPMSControlEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(ComponentControl *)self isCPMSControlActive];
  }
  return v3;
}

- (void)setCPMSMitigationState:(BOOL)a3
{
  if (!a3)
  {
    -[ComponentControl setIsCPMSControlEnabled:](self, "setIsCPMSControlEnabled:");
LABEL_6:
    [(ComponentControl *)self resetCPMSMitigationState];
    return;
  }
  [(ComponentControl *)self setIsCPMSControlEnabled:1];
  [+[CPMSHelper sharedInstance] updateCPMSClientState:[(PidComponent *)self mitigationType]];
  if (![+[CPMSHelper sharedInstance] isCPMSSupportedClient:[(PidComponent *)self mitigationType]])
  {
    if (byte_1000AA7A0)
    {
      uint64_t v4 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 67109120;
        unsigned int v11 = [(PidComponent *)self mitigationType];
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> mitigationType:%u is not a supported cpms client!", (uint8_t *)&v10, 8u);
      }
    }
    goto LABEL_6;
  }
  if (!LOBYTE(self->_minPower))
  {
    self->_unsigned int nominalPowerTarget = [+[CPMSHelper sharedInstance] getMaxPowerForComponent:[(PidComponent *)self mitigationType]];
    self->_unsigned int maxPower = [+[CPMSHelper sharedInstance] getMinPowerForComponent:[(PidComponent *)self mitigationType]];
    self->releaseRate = self->_nominalPowerTarget;
  }
  unsigned int nominalPowerTarget = self->_nominalPowerTarget;
  unsigned int maxPower = self->_maxPower;
  if (nominalPowerTarget) {
    BOOL v7 = nominalPowerTarget >= maxPower;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    __int16 v8 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      int v10 = 67109632;
      unsigned int v11 = nominalPowerTarget;
      __int16 v12 = 1024;
      unsigned int v13 = maxPower;
      __int16 v14 = 1024;
      unsigned int v15 = [(PidComponent *)self mitigationType];
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "<Error> Invalid power range (max:%d min%d) for mitigationType:%u", (uint8_t *)&v10, 0x14u);
    }
    goto LABEL_6;
  }
  if (byte_1000AA7A0)
  {
    unsigned int v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109120;
      unsigned int v11 = [(PidComponent *)self mitigationType];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Setting CPMS control Active for mitigationType:%u", (uint8_t *)&v10, 8u);
    }
  }
  [(ComponentControl *)self setIsCPMSControlActive:1];
}

- (void)updatePowerParameters:(__CFDictionary *)a3
{
  if (a3)
  {
    if (CFDictionaryContainsKey(a3, @"maxThermalPower"))
    {
      LOBYTE(self->_minPower) = 1;
      sub_100008280(a3, @"maxPower", kCFNumberIntType, &self->releaseRate);
      sub_100008280(a3, @"maxThermalPower", kCFNumberIntType, &self->_nominalPowerTarget);
      sub_100008280(a3, @"minThermalPower", kCFNumberIntType, &self->_maxPower);
      if (byte_1000AA7A0)
      {
        int v5 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = [(PidComponent *)self nameofComponent];
          unsigned int releaseRate = self->releaseRate;
          unsigned int nominalPowerTarget = self->_nominalPowerTarget;
          unsigned int maxPower = self->_maxPower;
          int v10 = 138413058;
          unsigned int v11 = v6;
          __int16 v12 = 1024;
          unsigned int v13 = releaseRate;
          __int16 v14 = 1024;
          unsigned int v15 = nominalPowerTarget;
          __int16 v16 = 1024;
          unsigned int v17 = maxPower;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<Notice> Updated %@ power params with nominal:%d max: %d min: %d", (uint8_t *)&v10, 0x1Eu);
        }
      }
    }
  }
}

- (void)resetCPMSMitigationState
{
  if (!LOBYTE(self->_minPower))
  {
    self->_unsigned int maxPower = 0;
    self->_unsigned int nominalPowerTarget = 0;
  }
  [(ComponentControl *)self setInitialCPMSBudgetSent:0];

  [(ComponentControl *)self setIsCPMSControlActive:0];
}

- (int)getReleaseRate
{
  return self->releaseMaxLI;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, off_100085D50[a3], self->super.nameofComponent);
  }
}

- (__CFString)getPowerlogKey
{
  return self->_powerlogKeyMaxLI;
}

- (int)getPowerlogFieldCurrentValue
{
  return self->currentLoadingIndex;
}

- (BOOL)allowLIOverride
{
  return *((unsigned char *)&self->super.controlEffort + 4);
}

- (void)setAllowLIOverride:(BOOL)a3
{
  *((unsigned char *)&self->super.controlEffort + 4) = a3;
}

- (unsigned)maxLoadingIndex
{
  return self->currentLoadingIndex;
}

- (void)setMaxLoadingIndex:(unsigned int)a3
{
  self->currentLoadingIndex = a3;
}

- (unsigned)currentLoadingIndex
{
  return *(_DWORD *)&self->allowLIOverride;
}

- (void)setCurrentLoadingIndex:(unsigned int)a3
{
  *(_DWORD *)&self->allowLIOverride = a3;
}

- (unsigned)releaseMaxLI
{
  return self->previousValue;
}

- (void)setReleaseMaxLI:(unsigned int)a3
{
  self->unsigned int previousValue = a3;
}

- (unsigned)releaseRate
{
  return self->releaseMaxLI;
}

- (void)setReleaseRate:(unsigned int)a3
{
  self->releaseMaxLI = a3;
}

- (BOOL)isCPMSControlEnabled
{
  return self->isCPMSControlEnabled;
}

- (void)setIsCPMSControlEnabled:(BOOL)a3
{
  self->isCPMSControlEnabled = a3;
}

- (BOOL)isCPMSControlActive
{
  return self->isCPMSControlActive;
}

- (void)setIsCPMSControlActive:(BOOL)a3
{
  self->uint64_t isCPMSControlActive = a3;
}

- (unsigned)powerTarget
{
  return self->powerTarget;
}

- (void)setPowerTarget:(unsigned int)a3
{
  self->powerTarget = a3;
}

- (unsigned)currentPower
{
  return self->currentPower;
}

- (void)setCurrentPower:(unsigned int)a3
{
  self->currentPower = a3;
}

- (unint64_t)mitigationDetails
{
  return self->mitigationDetails;
}

- (void)setMitigationDetails:(unint64_t)a3
{
  self->mitigationDetails = a3;
}

- (BOOL)initialCPMSBudgetSent
{
  return self->initialCPMSBudgetSent;
}

- (void)setInitialCPMSBudgetSent:(BOOL)a3
{
  self->initialCPMSBudgetSent = a3;
}

@end