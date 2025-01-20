@interface CpuCC
- (BOOL)useDirectMap;
- (CpuCC)initWithParams:(__CFDictionary *)a3 powerScale:(float)a4 listID:(int)a5 needspowerZones:(BOOL)a6;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (float)directMapIntercept;
- (float)directMapSlope;
- (int)numberOfFields;
- (unsigned)getUserUsage;
- (unsigned)minReachableLoadIndex;
- (void)defaultAction;
- (void)refreshFunctionalTelemetry;
- (void)refreshTGraphTelemetry;
- (void)setDirectMapIntercept:(float)a3;
- (void)setDirectMapSlope:(float)a3;
- (void)setMinReachableLoadIndex:(unsigned int)a3;
- (void)setUseDirectMap:(BOOL)a3;
@end

@implementation CpuCC

- (CpuCC)initWithParams:(__CFDictionary *)a3 powerScale:(float)a4 listID:(int)a5 needspowerZones:(BOOL)a6
{
  v16.receiver = self;
  v16.super_class = (Class)CpuCC;
  v10 = [(ComponentControl *)&v16 initWithCC:2 :a3];
  v11 = v10;
  if (v10)
  {
    *(&v10->super.currentPower + 1) = 101;
    v10->kDVD1Level = a5;
    *(float *)&v10->prevCpu.cpu_ticks[3] = a4;
    v10->super.super.nameofComponent = (__CFString *)CFStringCreateWithFormat(0, 0, @"%d CPU ", 2);
    v11->listIDPos = mach_host_self();
    v11->super.super.boundCheckLow = 0;
    v11->super.super.boundCheckHigh = 101;
    *(void *)&v11->host = 0;
    *(void *)&v11->currCpu.cpu_ticks[1] = 0;
    *(void *)&v11->currCpu.cpu_ticks[3] = 0;
    *(void *)&v11->prevCpu.cpu_ticks[1] = 0;
    p_usesPowerZoneControl = (unsigned int *)&v11->_usesPowerZoneControl;
    if (sub_100008280(a3, @"minReachableLoadIndex", kCFNumberIntType, &v11->_usesPowerZoneControl))
    {
      unsigned int v13 = *p_usesPowerZoneControl;
      *(float *)&unsigned int v14 = 100.0 / (float)(100 - *p_usesPowerZoneControl);
      v11->_minReachableLoadIndex = v14;
      v11->_directMapSlope = 0.5 - (float)(*(float *)&v14 * (float)v13);
    }
    LOBYTE(v11->timeActive) = a6;
  }
  return v11;
}

- (void)defaultAction
{
  [(id)qword_1000AB158 setCPUPowerCeiling:*(&self->super.currentPower + 1) forDVD1Contributor:0];
  [(id)qword_1000AB158 setCPUPowerCeiling:*(&self->super.currentPower + 1) fromDecisionSource:self->kDVD1Level];
  v3 = (void *)qword_1000AB158;

  [v3 updateCPU];
}

- (unsigned)getUserUsage
{
  mach_msg_type_number_t host_info_outCnt = 4;
  p_host = (host_cpu_load_info *)&self->host;
  if (host_statistics(self->listIDPos, 3, (host_info_t)&self->host, &host_info_outCnt))
  {
    v4 = qword_1000AABC0;
    LODWORD(v5) = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      sub_100055D3C(v4);
      LODWORD(v5) = 0;
    }
  }
  else
  {
    natural_t v6 = self->currCpu.cpu_ticks[2]
       + self->host
       - (self->currCpu.cpu_ticks[3]
        + self->prevCpu.cpu_ticks[2])
       + self->currCpu.cpu_ticks[0]
       - self->prevCpu.cpu_ticks[0];
    unint64_t v7 = self->currCpu.cpu_ticks[1] - self->prevCpu.cpu_ticks[1] + v6;
    *(host_cpu_load_info *)((char *)&self->currCpu + 12) = *p_host;
    return 100 * (unint64_t)v6 / v7;
  }
  return v5;
}

- (void)refreshTGraphTelemetry
{
  self->powerScale = (float)[(CpuCC *)self getUserUsage];
}

- (void)refreshFunctionalTelemetry
{
  unsigned int currentLoadingIndex = self->super.currentLoadingIndex;
  if (currentLoadingIndex != 101)
  {
    float v3 = self->_directMapSlope + (float)(*(float *)&self->_minReachableLoadIndex * (float)currentLoadingIndex);
    unsigned int currentLoadingIndex = (int)v3 & ~((int)v3 >> 31);
  }
  *(&self->super.currentPower + 1) = currentLoadingIndex;
  *(_DWORD *)&self->super.allowLIOverride = self->super.currentLoadingIndex;
}

- (int)numberOfFields
{
  v3.receiver = self;
  v3.super_class = (Class)CpuCC;
  return [(ComponentControl *)&v3 numberOfFields] + 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)CpuCC;
  if ([(ComponentControl *)&v8 numberOfFields] <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CpuCC;
    if ([(ComponentControl *)&v6 numberOfFields] == v3) {
      return @"CPU - timeActive";
    }
    else {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CpuCC;
    return [(ComponentControl *)&v7 copyHeaderForIndex:v3];
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)CpuCC;
  if ([(ComponentControl *)&v8 numberOfFields] <= a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CpuCC;
    if ([(ComponentControl *)&v6 numberOfFields] == v3) {
      return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%.3f", self->powerScale);
    }
    else {
      return 0;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CpuCC;
    return [(ComponentControl *)&v7 copyFieldCurrentValueForIndex:v3];
  }
}

- (BOOL)useDirectMap
{
  return BYTE1(self->timeActive);
}

- (void)setUseDirectMap:(BOOL)a3
{
  BYTE1(self->timeActive) = a3;
}

- (unsigned)minReachableLoadIndex
{
  return *(_DWORD *)&self->_usesPowerZoneControl;
}

- (void)setMinReachableLoadIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_usesPowerZoneControl = a3;
}

- (float)directMapSlope
{
  return *(float *)&self->_minReachableLoadIndex;
}

- (void)setDirectMapSlope:(float)a3
{
  *(float *)&self->_minReachableLoadIndex = a3;
}

- (float)directMapIntercept
{
  return self->_directMapSlope;
}

- (void)setDirectMapIntercept:(float)a3
{
  self->_directMapSlope = a3;
}

@end