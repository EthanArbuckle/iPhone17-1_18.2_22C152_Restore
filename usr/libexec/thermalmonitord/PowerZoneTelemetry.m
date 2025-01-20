@interface PowerZoneTelemetry
+ (id)sharedInstance;
- (BOOL)isFastDieEngaged;
- (PowerZoneTelemetry)init;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (float)getCpuPowerZoneLimited;
- (float)getCurrentPackagePower;
- (float)getGpuPowerZoneLimited;
- (float)getPackagePowerZoneLimited;
- (int)numberOfFields;
- (void)dealloc;
- (void)queryData;
@end

@implementation PowerZoneTelemetry

- (void)queryData
{
  size_t v31 = -3;
  vm_address_t outputStruct = 0;
  if (IOConnectCallMethod(self->clpcConnect, 6u, 0, 0, 0, 0, 0, 0, &outputStruct, &v31))
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000553E4();
    }
    return;
  }
  if (v31 <= 0x6F)
  {
    vm_deallocate(mach_task_self_, outputStruct, v31);
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055314();
    }
    return;
  }
  vm_address_t v3 = outputStruct;
  if (*(void *)(outputStruct + 8) == v31)
  {
    unint64_t v4 = *(void *)(outputStruct + 24);
    uint64_t v5 = mach_absolute_time();
    unint64_t lastCLPCReadingTimestamp = self->lastCLPCReadingTimestamp;
    self->unint64_t lastCLPCReadingTimestamp = v5;
    vm_address_t v7 = outputStruct;
    if (v4 >= *(void *)(v3 + 8))
    {
LABEL_23:
      if (v7 | v31) {
        vm_deallocate(mach_task_self_, v7, v31);
      }
      if (self->gpuChannels && self->gpuSubscription)
      {
        uint64_t v27 = mach_absolute_time();
        uint64_t Samples = IOReportCreateSamples();
        if (!Samples)
        {
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_10005544C();
          }
          return;
        }
        v29 = (__CFDictionary *)Samples;
        SamplesDelta = (const void *)IOReportCreateSamplesDelta();
        CFRelease(self->lastGPUReading);
        self->lastGPUReading = v29;
        self->lastGPUReadingTimestamp = v27;
        IOReportIterate();
        if (SamplesDelta) {
          CFRelease(SamplesDelta);
        }
      }
      dword_1000AAE24 = LODWORD(self->packagePowerZoneLimited);
      return;
    }
    unint64_t v8 = v5 - lastCLPCReadingTimestamp;
    float v9 = (float)v8;
    while (1)
    {
      vm_address_t v10 = v7 + v4;
      int v11 = *(_DWORD *)(v7 + v4);
      if (v11 == 14)
      {
        int v17 = *(_DWORD *)(v10 + 16);
        if (v17 == 1)
        {
          uint64_t v23 = *(void *)(v10 + 24);
          uint64_t v24 = qword_1000A2380;
          long long v25 = *(_OWORD *)(v10 + 16);
          xmmword_1000A2368 = *(_OWORD *)v10;
          *(_OWORD *)algn_1000A2378 = v25;
          unint64_t v26 = v23 - v24;
          float v22 = (float)v26;
          self->cluster1FastDieLimitedMhz = (float)v26;
          if (!v26) {
            goto LABEL_17;
          }
        }
        else
        {
          if (v17) {
            goto LABEL_17;
          }
          uint64_t v18 = *(void *)(v10 + 24);
          uint64_t v19 = qword_1000A2360;
          long long v20 = *(_OWORD *)(v10 + 16);
          xmmword_1000A2348 = *(_OWORD *)v10;
          *(_OWORD *)algn_1000A2358 = v20;
          unint64_t v21 = v18 - v19;
          float v22 = (float)v21;
          self->cluster0FastDieLimitedMhz = (float)v21;
          if (!v21) {
            goto LABEL_17;
          }
        }
        self->cpuFastDieLimitedMhz = (unint64_t)v22;
      }
      else
      {
        if (v11 != 13)
        {
          if (v7 | v31) {
            vm_deallocate(mach_task_self_, v7, v31);
          }
          if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
            sub_100055348();
          }
          return;
        }
        uint64_t v12 = *(void *)(v10 + 16) - qword_1000A2330;
        uint64_t v13 = *(void *)(v10 + 32) - qword_1000A2340;
        unint64_t v14 = *(void *)(v10 + 24) - unk_1000A2338;
        long long v16 = *(_OWORD *)v10;
        long long v15 = *(_OWORD *)(v10 + 16);
        qword_1000A2340 = *(void *)(v10 + 32);
        xmmword_1000A2320 = v16;
        *(_OWORD *)&qword_1000A2330 = v15;
        self->cpuPowerZoneLimited = (float)v14 / v9;
        *(float *)&long long v15 = (float)(unint64_t)v13 / (self->tbfactor * (double)v8);
        self->packagePowerZoneLimited = (float)(unint64_t)v12 / v9;
        LODWORD(self->currentPackagePower) = v15;
      }
LABEL_17:
      v4 += *(void *)(v10 + 8);
      if (v4 >= *(void *)(v3 + 8)) {
        goto LABEL_23;
      }
    }
  }
  vm_deallocate(mach_task_self_, outputStruct, v31);
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_1000553B0();
  }
}

- (int)numberOfFields
{
  return 5;
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%f", *(float *)((char *)&self->super.isa + qword_100067E78[a3]));
  }
}

- (float)getCurrentPackagePower
{
  return self->currentPackagePower;
}

+ (id)sharedInstance
{
  if (qword_1000A26C8 != -1) {
    dispatch_once(&qword_1000A26C8, &stru_100085698);
  }
  return (id)qword_1000A26D0;
}

- (PowerZoneTelemetry)init
{
  v22.receiver = self;
  v22.super_class = (Class)PowerZoneTelemetry;
  v2 = [(PowerZoneTelemetry *)&v22 init];
  if (!v2) {
    return v2;
  }
  CFDictionaryRef v3 = IOServiceMatching("AppleCLPC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  v2->appleCLPCService = MatchingService;
  vm_size_t size = -3;
  vm_address_t address = 0;
  if (!MatchingService)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000552E0();
    }
    goto LABEL_38;
  }
  if (IOServiceOpen(MatchingService, mach_task_self_, 0, &v2->clpcConnect))
  {
    if ((byte_1000A26D8 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100055418();
      }
      byte_1000A26D8 = 1;
    }
LABEL_8:
    IOObjectRelease(v2->appleCLPCService);
    goto LABEL_38;
  }
  if (IOConnectCallMethod(v2->clpcConnect, 6u, 0, 0, 0, 0, 0, 0, &address, &size))
  {
    IOObjectRelease(v2->appleCLPCService);
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000553E4();
    }
    goto LABEL_38;
  }
  if (size <= 0x6F)
  {
    IOObjectRelease(v2->appleCLPCService);
    vm_deallocate(mach_task_self_, address, size);
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_100055314();
    }
    goto LABEL_38;
  }
  vm_address_t v5 = address;
  if (*(void *)(address + 8) != size)
  {
    IOObjectRelease(v2->appleCLPCService);
    vm_deallocate(mach_task_self_, address, size);
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_1000553B0();
    }
LABEL_38:

    return 0;
  }
  unint64_t v6 = *(void *)(address + 24);
  for (v2->unint64_t lastCLPCReadingTimestamp = mach_absolute_time(); v6 < *(void *)(v5 + 8); v6 += *(void *)(v7 + 8))
  {
    vm_address_t v7 = address + v6;
    int v8 = *(_DWORD *)(address + v6);
    if (v8 == 14)
    {
      int v11 = *(_DWORD *)(v7 + 16);
      if (v11 == 1)
      {
        long long v13 = *(_OWORD *)(v7 + 16);
        xmmword_1000A2368 = *(_OWORD *)v7;
        *(_OWORD *)algn_1000A2378 = v13;
      }
      else if (!v11)
      {
        long long v12 = *(_OWORD *)(v7 + 16);
        xmmword_1000A2348 = *(_OWORD *)v7;
        *(_OWORD *)algn_1000A2358 = v12;
      }
    }
    else
    {
      if (v8 != 13)
      {
        IOObjectRelease(v2->appleCLPCService);
        vm_deallocate(mach_task_self_, address, size);
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
          sub_100055348();
        }
        goto LABEL_38;
      }
      long long v9 = *(_OWORD *)v7;
      long long v10 = *(_OWORD *)(v7 + 16);
      qword_1000A2340 = *(void *)(v7 + 32);
      xmmword_1000A2320 = v9;
      *(_OWORD *)&qword_1000A2330 = v10;
    }
  }
  if (address) {
    vm_deallocate(mach_task_self_, address, size);
  }
  CFMutableDictionaryRef v14 = IOServiceMatching("AGXAccelerator");
  long long v15 = (const void *)IOReportCopyChannelsWithID();
  CFRelease(v14);
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005537C();
    }
    goto LABEL_8;
  }
  v2->gpuSubscription = (__IOReportSubscriptionCF *)IOReportCreateSubscription();
  CFRelease(v15);
  if (v2->gpuChannels && v2->gpuSubscription)
  {
    v2->lastGPUReading = (__CFDictionary *)IOReportCreateSamples();
    v2->lastGPUReadingTimestamp = mach_absolute_time();
  }
  if (byte_1000AB0E0)
  {
    [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:17 forSMCKey:@"zETM" atSMCIndex:17];
    dword_1000AAE24 = 0;
  }
  [+[TGraphSampler sharedInstance] addtGraphDataSource:v2];
  mach_timebase_info(&info);
  LODWORD(v16) = info.numer;
  LODWORD(v17) = info.denom;
  v2->tbfactor = (double)v16 / (double)v17;
  return v2;
}

- (float)getCpuPowerZoneLimited
{
  return self->cpuPowerZoneLimited;
}

- (float)getGpuPowerZoneLimited
{
  return self->gpuPowerZoneLimited;
}

- (float)getPackagePowerZoneLimited
{
  return self->packagePowerZoneLimited;
}

- (BOOL)isFastDieEngaged
{
  return self->cpuFastDieLimitedMhz != 0;
}

- (void)dealloc
{
  io_object_t appleCLPCService = self->appleCLPCService;
  if (appleCLPCService) {
    IOObjectRelease(appleCLPCService);
  }
  v4.receiver = self;
  v4.super_class = (Class)PowerZoneTelemetry;
  [(PowerZoneTelemetry *)&v4 dealloc];
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, *(&off_1000856E0 + a3), 0);
  }
}

@end