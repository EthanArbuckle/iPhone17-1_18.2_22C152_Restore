@interface TSDCgPTPClock
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5 flags:(unint64_t *)a6;
- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5;
- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6;
- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6;
- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4;
- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5;
- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5;
- (NSArray)gptpPath;
- (NSArray)ports;
- (TSDCgPTPClock)initWithKernelClock:(id)a3;
- (id).cxx_construct;
- (id)clockName;
- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3;
- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3;
- (id)getMetrics;
- (id)getMetricsWithDelta:(id)a3;
- (id)portWithPortNumber:(unsigned __int16)a3;
- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3;
- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3;
- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3;
- (unint64_t)grandmasterIdentity;
- (unint64_t)machAbsoluteFromgPTPTime:(id)a3;
- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3;
- (unsigned)clockAccuracy;
- (unsigned)clockClass;
- (unsigned)clockPriority1;
- (unsigned)clockPriority2;
- (void)_getInitialSyncInfo;
- (void)dealloc;
- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5;
- (void)setClockAccuracy:(unsigned __int8)a3;
- (void)setClockClass:(unsigned __int8)a3;
- (void)setClockPriority1:(unsigned __int8)a3;
- (void)setClockPriority2:(unsigned __int8)a3;
- (void)setGptpPath:(id)a3;
- (void)setGrandmasterIdentity:(unint64_t)a3;
- (void)updateGrandmasterIdentity:(unint64_t)a3 andgPTPPath:(id)a4;
- (void)updateLockState:(int)a3;
- (void)updateWithSyncInfoValid:(BOOL)a3 syncFlags:(unsigned __int8)a4 timeSyncTime:(unint64_t)a5 domainTimeHi:(unint64_t)a6 domainTimeLo:(unint64_t)a7 cumulativeScaledRate:(unint64_t)a8 inverseCumulativeScaledRate:(unint64_t)a9 grandmasterID:(unint64_t)a10 localPortNumber:(unsigned __int16)a11;
@end

@implementation TSDCgPTPClock

- (TSDCgPTPClock)initWithKernelClock:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12.receiver = self;
    v12.super_class = (Class)TSDCgPTPClock;
    v6 = [(TSDCKernelClock *)&v12 initWithKernelClock:v5];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_gPTPClock, a3);
      v8 = +[TSClockManager sharedClockManager];
      uint64_t v9 = [v8 timeSyncClock];
      timeSyncClock = v7->_timeSyncClock;
      v7->_timeSyncClock = (TSClock *)v9;

      [(_TSF_TSDgPTPClock *)v7->_gPTPClock addImplClock:v7];
      [(TSDCgPTPClock *)v7 _getInitialSyncInfo];
    }
  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (void)dealloc
{
  [(_TSF_TSDgPTPClock *)self->_gPTPClock removeImplClock:self];
  v3.receiver = self;
  v3.super_class = (Class)TSDCgPTPClock;
  [(TSDCKernelClock *)&v3 dealloc];
}

- (id)clockName
{
  return 0;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return [(TSDCgPTPClock *)self convertFromMachAbsoluteToDomainTime:a3 grandmasterUsed:0 portNumber:0];
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return [(TSDCgPTPClock *)self convertFromDomainToMachAbsoluteTime:a3 grandmasterUsed:0 portNumber:0];
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v11) {
      return result;
    }
    int v14 = 136316418;
    v15 = "machAbsoluteTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    v21 = "";
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 143;
    objc_super v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  id v5 = a4;
  if (!a4)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    int v14 = 136316418;
    v15 = "domainTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    v21 = "";
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 144;
    objc_super v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    v6 = a3;
    uint64_t v8 = a5;
    do
    {
      uint64_t v9 = *v6++;
      *v5++ = [(TSDCgPTPClock *)self convertFromMachAbsoluteToDomainTime:v9 grandmasterUsed:0 portNumber:0];
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v11) {
      return result;
    }
    int v14 = 136316418;
    v15 = "machAbsoluteTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    v21 = "";
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 161;
    objc_super v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  id v5 = a3;
  if (!a3)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    int v14 = 136316418;
    v15 = "domainTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    v21 = "";
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 162;
    objc_super v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    v6 = a4;
    uint64_t v8 = a5;
    do
    {
      uint64_t v9 = *v5++;
      *v6++ = [(TSDCgPTPClock *)self convertFromDomainToMachAbsoluteTime:v9 grandmasterUsed:0 portNumber:0];
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  id v5 = [(TSDCKernelClock *)self translationClock];
  uint64_t v6 = [v5 convertFromMachAbsoluteIntervalToDomainInterval:a3];

  v7 = [(TSDCKernelClock *)self translationClock];
  uint64_t v8 = [v7 convertFromDomainIntervalToTimeSyncTimeInterval:v6];

  return [(TSDCgPTPClock *)self convertFromTimeSyncTimeIntervalToDomainInterval:v8];
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  unint64_t v4 = [(TSDCgPTPClock *)self convertFromDomainIntervalToTimeSyncTimeInterval:a3];
  id v5 = [(TSDCKernelClock *)self translationClock];
  uint64_t v6 = [v5 convertFromTimeSyncTimeIntervalToDomainInterval:v4];

  v7 = [(TSDCKernelClock *)self translationClock];
  unint64_t v8 = [v7 convertFromDomainIntervalToMachAbsoluteInterval:v6];

  return v8;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return [(TSDCgPTPClock *)self getMachAbsoluteRateRatioNumerator:a3 denominator:a4 machAnchor:a5 andDomainAnchor:a6 forGrandmasterIdentity:0 portNumber:0 withError:a7];
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return [(TSDCgPTPClock *)self convertFromTimeSyncTimeToDomainTime:a3 grandmasterUsed:0 portNumber:0];
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return [(TSDCgPTPClock *)self convertFromDomainTimeToTimeSyncTime:a3 grandmasterUsed:0 portNumber:0];
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    int v16 = 136316418;
    uint64_t v17 = "timeSyncTime != NULL";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    v23 = "";
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v26 = 1024;
    int v27 = 210;
    int v14 = MEMORY[0x1E4F14500];
    goto LABEL_14;
  }
  id v5 = a4;
  if (!a4)
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v15) {
      return result;
    }
    int v16 = 136316418;
    uint64_t v17 = "domainTime != NULL";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    v23 = "";
    __int16 v24 = 2080;
    int v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v26 = 1024;
    int v27 = 211;
    int v14 = MEMORY[0x1E4F14500];
LABEL_14:
    _os_log_impl(&dword_1BA88B000, v14, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
    return 0;
  }
  if (a5)
  {
    uint64_t v6 = a3;
    uint64_t v8 = a5;
    do
    {
      uint64_t v10 = *v6++;
      uint64_t v9 = v10;
      unint64_t v11 = -1;
      if (v10) {
        unint64_t v11 = [(TSDCgPTPClock *)self convertFromTimeSyncTimeToDomainTime:v9 grandmasterUsed:0 portNumber:0];
      }
      *v5++ = v11;
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v11) {
      return result;
    }
    int v14 = 136316418;
    BOOL v15 = "timeSyncTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    uint64_t v21 = "";
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 235;
    objc_super v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  id v5 = a3;
  if (!a3)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    int v14 = 136316418;
    BOOL v15 = "domainTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    uint64_t v21 = "";
    __int16 v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 236;
    objc_super v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    uint64_t v6 = a4;
    uint64_t v8 = a5;
    do
    {
      uint64_t v9 = *v5++;
      *v6++ = [(TSDCgPTPClock *)self convertFromDomainTimeToTimeSyncTime:v9 grandmasterUsed:0 portNumber:0];
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(TSDCKernelClock *)self validIndex];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      uint64_t v9 = "TSInvalidTime != timeSyncInterval";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      BOOL v15 = "";
      __int16 v16 = 2080;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      __int16 v18 = 1024;
      int v19 = 254;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    return -1;
  }
  if (v5 >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      uint64_t v9 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      BOOL v15 = "";
      __int16 v16 = 2080;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      __int16 v18 = 1024;
      int v19 = 255;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    return -1;
  }
  unint64_t cumulativeScaledRate = self->_timeInfo[(unint64_t)v5].cumulativeScaledRate;
  return scaledInterval(a3, cumulativeScaledRate);
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(TSDCKernelClock *)self validIndex];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      uint64_t v9 = "TSInvalidTime != domainInterval";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      BOOL v15 = "";
      __int16 v16 = 2080;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      __int16 v18 = 1024;
      int v19 = 268;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    return -1;
  }
  if (v5 >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316418;
      uint64_t v9 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      BOOL v15 = "";
      __int16 v16 = 2080;
      uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      __int16 v18 = 1024;
      int v19 = 269;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
    }
    return -1;
  }
  unint64_t inverseCumulativeScaledRate = self->_timeInfo[(unint64_t)v5].inverseCumulativeScaledRate;
  return scaledInterval(a3, inverseCumulativeScaledRate);
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return [(TSDCgPTPClock *)self getTimeSyncTimeRateRatioNumerator:a3 denominator:a4 timeSyncAnchor:a5 andDomainAnchor:a6 forGrandmasterIdentity:0 portNumber:0 withError:a7];
}

- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v6 = [(TSDCKernelClock *)self getSignpostId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v17 = 136315138;
    __int16 v18 = "-[TSDCgPTPClock gPTPTimeFromMachAbsoluteTime:]";
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v17, 0xCu);
  }

  v7 = [(TSDCKernelClock *)self translationClock];
  uint64_t v8 = [v7 convertFromMachAbsoluteToDomainTime:a3];

  uint64_t v9 = [(TSDCKernelClock *)self translationClock];
  uint64_t v10 = [v9 convertFromDomainToTimeSyncTime:v8];

  uint64_t v11 = [(TSDCgPTPClock *)self gPTPTimeFromTimeSyncTime:v10];
  __int16 v12 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v13 = [(TSDCKernelClock *)self getSignpostId];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    uint64_t v14 = [v11 seconds];
    int v15 = [v11 nanoseconds];
    int v17 = 136316418;
    __int16 v18 = "-[TSDCgPTPClock gPTPTimeFromMachAbsoluteTime:]";
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2048;
    uint64_t v22 = v8;
    __int16 v23 = 2048;
    uint64_t v24 = v10;
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    __int16 v27 = 1024;
    int v28 = v15;
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v12, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1BA8E2971, "%s MachAbsoluteTime=%llu intermediateTime=%llu timeSyncTime=%llu gPTPTime.seconds=%llu gPTPTime.nanoseconds=%u", (uint8_t *)&v17, 0x3Au);
  }

  return v11;
}

- (unint64_t)machAbsoluteFromgPTPTime:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v6 = [(TSDCKernelClock *)self getSignpostId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v17 = 136315138;
    __int16 v18 = "-[TSDCgPTPClock machAbsoluteFromgPTPTime:]";
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v17, 0xCu);
  }

  unint64_t v7 = [(TSDCgPTPClock *)self timeSyncTimeFromgPTPTime:v4];
  uint64_t v8 = [(TSDCKernelClock *)self translationClock];
  uint64_t v9 = [v8 convertFromTimeSyncToDomainTime:v7];

  uint64_t v10 = [(TSDCKernelClock *)self translationClock];
  unint64_t v11 = [v10 convertFromDomainToMachAbsoluteTime:v9];

  __int16 v12 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v13 = [(TSDCKernelClock *)self getSignpostId];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    uint64_t v14 = [v4 seconds];
    int v15 = [v4 nanoseconds];
    int v17 = 136316418;
    __int16 v18 = "-[TSDCgPTPClock machAbsoluteFromgPTPTime:]";
    __int16 v19 = 2048;
    uint64_t v20 = v14;
    __int16 v21 = 1024;
    int v22 = v15;
    __int16 v23 = 2048;
    unint64_t v24 = v7;
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 2048;
    unint64_t v28 = v11;
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v12, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1BA8E2971, "%s gPTPTime.seconds=%llu gPTPTime.nanoseconds=%u timeSyncTime=%llu intermediateTime=%llu MachAbsoluteTime=%llu", (uint8_t *)&v17, 0x3Au);
  }

  return v11;
}

- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v6 = [(TSDCKernelClock *)self getSignpostId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    int v15 = 136315138;
    __int16 v16 = "-[TSDCgPTPClock convertFrom32BitASToMachAbsoluteTime:]";
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v15, 0xCu);
  }

  unint64_t v7 = [(TSDCgPTPClock *)self convertFrom32BitASToTimeSyncTime:v3];
  uint64_t v8 = [(TSDCKernelClock *)self translationClock];
  uint64_t v9 = [v8 convertFromTimeSyncToDomainTime:v7];

  uint64_t v10 = [(TSDCKernelClock *)self translationClock];
  unint64_t v11 = [v10 convertFromDomainToMachAbsoluteTime:v9];

  __int16 v12 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v13 = [(TSDCKernelClock *)self getSignpostId];
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v15 = 136316162;
    __int16 v16 = "-[TSDCgPTPClock convertFrom32BitASToMachAbsoluteTime:]";
    __int16 v17 = 1024;
    int v18 = v3;
    __int16 v19 = 2048;
    unint64_t v20 = v7;
    __int16 v21 = 2048;
    uint64_t v22 = v9;
    __int16 v23 = 2048;
    unint64_t v24 = v11;
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v12, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1BA8E2971, "%s domainTime=%u timeSyncTime=%llu intermediateTime=%llu MachAbsoluteTime=%llu", (uint8_t *)&v15, 0x30u);
  }

  return v11;
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v11) {
      return result;
    }
    int v14 = 136316418;
    int v15 = "domain32Time != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 327;
    __int16 v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  unsigned int v5 = a4;
  if (!a4)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    int v14 = 136316418;
    int v15 = "machAbsoluteTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 328;
    __int16 v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    os_signpost_id_t v6 = a3;
    uint64_t v8 = a5;
    do
    {
      unsigned int v9 = *v6++;
      *v5++ = [(TSDCgPTPClock *)self convertFrom32BitASToMachAbsoluteTime:v9];
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v10 = [(TSDCKernelClock *)self getSignpostId];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v19 = 136315138;
    __int16 v20 = "-[TSDCgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:]";
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v19, 0xCu);
  }

  BOOL v11 = [(TSDCKernelClock *)self translationClock];
  uint64_t v12 = [v11 convertFromMachAbsoluteToDomainTime:a3];

  BOOL v13 = [(TSDCKernelClock *)self translationClock];
  uint64_t v14 = [v13 convertFromDomainToTimeSyncTime:v12];

  unint64_t v15 = [(TSDCgPTPClock *)self convertFromTimeSyncTimeToDomainTime:v14 grandmasterUsed:a4 portNumber:a5];
  __int16 v16 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v17 = [(TSDCKernelClock *)self getSignpostId];
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v19 = 136316162;
    __int16 v20 = "-[TSDCgPTPClock convertFromMachAbsoluteToDomainTime:grandmasterUsed:portNumber:]";
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    __int16 v25 = 2048;
    uint64_t v26 = v14;
    __int16 v27 = 2048;
    unint64_t v28 = v15;
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v16, OS_SIGNPOST_INTERVAL_END, v17, (const char *)&unk_1BA8E2971, "%s machAbsoluteTime=%llu intermediateTime=%llu timeSyncTime=%llu domainTime=%llu", (uint8_t *)&v19, 0x34u);
  }

  return v15;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v10 = [(TSDCKernelClock *)self getSignpostId];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v19 = 136315138;
    __int16 v20 = "-[TSDCgPTPClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]";
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v19, 0xCu);
  }

  unint64_t v11 = [(TSDCgPTPClock *)self convertFromDomainTimeToTimeSyncTime:a3 grandmasterUsed:a4 portNumber:a5];
  uint64_t v12 = [(TSDCKernelClock *)self translationClock];
  uint64_t v13 = [v12 convertFromTimeSyncToDomainTime:v11];

  uint64_t v14 = [(TSDCKernelClock *)self translationClock];
  unint64_t v15 = [v14 convertFromDomainToMachAbsoluteTime:v13];

  __int16 v16 = [(TSDCKernelClock *)self getOsLog];
  os_signpost_id_t v17 = [(TSDCKernelClock *)self getSignpostId];
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    int v19 = 136316162;
    __int16 v20 = "-[TSDCgPTPClock convertFromDomainToMachAbsoluteTime:grandmasterUsed:portNumber:]";
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    __int16 v23 = 2048;
    unint64_t v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    __int16 v27 = 2048;
    unint64_t v28 = v15;
    _os_signpost_emit_with_name_impl(&dword_1BA88B000, v16, OS_SIGNPOST_INTERVAL_END, v17, (const char *)&unk_1BA8E2971, "%s domainTime=%llu timeSyncTime=%llu intermediateTime=%llu  machAbsoluteTime=%llu", (uint8_t *)&v19, 0x34u);
  }

  return v15;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a3) {
    *a3 = 1;
  }
  if (a4) {
    *a4 = 1;
  }
  if (a5) {
    *a5 = -1;
  }
  if (a6) {
    *a6 = -1;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = 0;
  if (!-[TSDCgPTPClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:](self, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:", &v30, &v29, &v28, a9))
  {
    BOOL v20 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v20) {
      return result;
    }
    *(_DWORD *)buf = 136316418;
    v32 = "[self getTimeSyncTimeRateRatioNumerator:&thisNumer denominator:&thisDenom timeSyncAnchor:&thisTSAnchor andDoma"
          "inAnchor:domainAnchor forGrandmasterIdentity:grandmasterIdentity portNumber:portNumber withError:error]";
    __int16 v33 = 2048;
    uint64_t v34 = 0;
    __int16 v35 = 2048;
    uint64_t v36 = 0;
    __int16 v37 = 2080;
    v38 = "";
    __int16 v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v41 = 1024;
    int v42 = 392;
    __int16 v21 = MEMORY[0x1E4F14500];
    goto LABEL_22;
  }
  uint64_t v13 = [(TSDCKernelClock *)self translationClock];
  char v14 = [v13 getTimeSyncTimeRateRatioNumerator:&v27 denominator:&v26 timeSyncAnchor:0 andDomainAnchor:0 withError:0];

  if ((v14 & 1) == 0)
  {
    BOOL v22 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v22) {
      return result;
    }
    *(_DWORD *)buf = 136316418;
    v32 = "[self.translationClock getTimeSyncTimeRateRatioNumerator:&transNumer denominator:&transDenom timeSyncAnchor:ni"
          "l andDomainAnchor:nil withError:nil]";
    __int16 v33 = 2048;
    uint64_t v34 = 0;
    __int16 v35 = 2048;
    uint64_t v36 = 0;
    __int16 v37 = 2080;
    v38 = "";
    __int16 v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v41 = 1024;
    int v42 = 394;
    __int16 v21 = MEMORY[0x1E4F14500];
    goto LABEL_22;
  }
  unint64_t v15 = [(TSDCKernelClock *)self translationClock];
  char v16 = [v15 getMachAbsoluteRateRatioNumerator:&v25 denominator:&v24 machAnchor:0 andDomainAnchor:0 withError:0];

  if ((v16 & 1) == 0)
  {
    BOOL v23 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v23) {
      return result;
    }
    *(_DWORD *)buf = 136316418;
    v32 = "[self.translationClock getMachAbsoluteRateRatioNumerator:&machNumer denominator:&machDenom machAnchor:nil andD"
          "omainAnchor:nil withError:nil]";
    __int16 v33 = 2048;
    uint64_t v34 = 0;
    __int16 v35 = 2048;
    uint64_t v36 = 0;
    __int16 v37 = 2080;
    v38 = "";
    __int16 v39 = 2080;
    v40 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v41 = 1024;
    int v42 = 396;
    __int16 v21 = MEMORY[0x1E4F14500];
LABEL_22:
    _os_log_impl(&dword_1BA88B000, v21, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    return 0;
  }
  __C(v30, v27, v25, v29, v26, v24, a3, a4);
  if (a5)
  {
    os_signpost_id_t v17 = [(TSDCKernelClock *)self translationClock];
    __int16 v18 = [(TSDCKernelClock *)self translationClock];
    *a5 = objc_msgSend(v17, "convertFromDomainToMachAbsoluteTime:", objc_msgSend(v18, "convertFromTimeSyncToDomainTime:", v28));
  }
  return 1;
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock addLinkLayerPortOnInterfaceNamed:a3 allocatedPortNumber:a4 error:a5];
}

- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock removeLinkLayerPortFromInterfaceNamed:a3 error:a4];
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock addUnicastUDPv4PtPPortOnInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock removeUnicastUDPv4PtPPortFromInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 error:a5];
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock addUnicastUDPv6PtPPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock removeUnicastUDPv6PtPPortFromInterfaceNamed:a3 withDestinationAddress:a4 error:a5];
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock addUnicastLinkLayerPtPPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock removeUnicastLinkLayerPtPPortFromInterfaceNamed:a3 withDestinationAddress:a4 error:a5];
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock addUnicastUDPv4EtEPortOnInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock removeUnicastUDPv4EtEPortFromInterfaceNamed:a3 withDestinationAddress:*(void *)&a4 error:a5];
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock addUnicastUDPv6EtEPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock removeUnicastUDPv6EtEPortFromInterfaceNamed:a3 withDestinationAddress:a4 error:a5];
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock addUnicastLinkLayerEtEPortOnInterfaceNamed:a3 withDestinationAddress:a4 allocatedPortNumber:a5 error:a6];
}

- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock removeUnicastLinkLayerEtEPortFromInterfaceNamed:a3 withDestinationAddress:a4 error:a5];
}

- (NSArray)ports
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock ports];
}

- (id)portWithPortNumber:(unsigned __int16)a3
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock portWithPortNumber:a3];
}

- (id)getMetrics
{
  v2 = [(_TSF_TSDgPTPClock *)self->_gPTPClock getMetrics];
  return v2;
}

- (id)getMetricsWithDelta:(id)a3
{
  uint64_t v3 = [(_TSF_TSDgPTPClock *)self->_gPTPClock getMetricsWithDelta:a3];
  return v3;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unsigned int v9 = [(TSDCKernelClock *)self translationClock];
  uint64_t v10 = [v9 convertFromMachAbsoluteToDomainTime:a3];

  unint64_t v11 = [(TSDCKernelClock *)self translationClock];
  uint64_t v12 = [v11 convertFromDomainToTimeSyncTime:v10];

  unint64_t v13 = [(TSDCgPTPClock *)self convertFromTimeSyncTimeTo128BitgPTPTime:v12 grandmasterUsed:a4 portNumber:a5];
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v6 = -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", a3.var0, a3.var1, a4, a5);
  unint64_t v7 = [(TSDCKernelClock *)self translationClock];
  uint64_t v8 = [v7 convertFromTimeSyncToDomainTime:v6];

  unsigned int v9 = [(TSDCKernelClock *)self translationClock];
  unint64_t v10 = [v9 convertFromDomainToMachAbsoluteTime:v8];

  return v10;
}

- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3
{
  uint64_t v20 = 0;
  unint64_t v21 = 0;
  unsigned __int16 v19 = 0;
  uint64_t v3 = [(TSDCgPTPClock *)self convertFromTimeSyncTimeTo128BitgPTPTime:a3 grandmasterUsed:&v20 portNumber:&v19 flags:&v21];
  unsigned int v5 = 0;
  if (v3 != -1 || v4 != -1)
  {
    uint64_t v7 = v21 & 1;
    uint64_t v8 = (v21 >> 1) & 1;
    unsigned int v9 = (v21 >> 2) & 1;
    *(void *)&long long v18 = v4;
    *((void *)&v18 + 1) = v3;
    *(_OWORD *)char v16 = xmmword_1BA8E27F0;
    v17[0] = IOTS_U128::operator/(&v18, v16);
    v17[1] = v10;
    operator*(v17, 1000000000, (uint64_t)v16);
    int v11 = v16[0];
    int v12 = v18;
    unint64_t v13 = [TSgPTPTime alloc];
    LOBYTE(v15) = v9;
    unsigned int v5 = [(TSgPTPTime *)v13 initWithSeconds:v17[0] nanoseconds:(v12 - v11) onGrandmaster:v20 withLocalPortNumber:v19 ptpTimescale:v7 timeTraceable:v8 frequencyTraceable:v15];
  }
  return v5;
}

- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3
{
  id v4 = a3;
  unint64_t v5 = IOTS_uint64mul([v4 seconds], 1000000000);
  uint64_t v7 = v6;
  unsigned int v8 = [v4 nanoseconds];
  LODWORD(v9) = __CFADD__(v5, v8);
  if (v5 + v8 < v5) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = v9;
  }
  unint64_t v10 = -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", v7 + v9);

  return v10;
}

- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v40 = -1;
  __int16 v39 = -1;
  unint64_t v34 = [(TSClock *)self->_timeSyncClock convertFromMachAbsoluteToDomainTime:mach_absolute_time()];
  unint64_t v4 = -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:");
  unint64_t v35 = v4;
  uint64_t v6 = v5;
  unint64_t v7 = -1;
  if (v4 == -1 && v5 == (const char *)-1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return v7;
    }
    *(_DWORD *)buf = 136316418;
    int v42 = "tsNow.hi != TSInvalidTime || tsNow.lo != TSInvalidTime";
    __int16 v43 = 2048;
    uint64_t v44 = 0;
    __int16 v45 = 2048;
    unint64_t v46 = 0;
    __int16 v47 = 2080;
    v48 = "";
    __int16 v49 = 2080;
    v50 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v51 = 1024;
    LODWORD(v52) = 581;
    uint64_t v30 = MEMORY[0x1E4F14500];
    v31 = "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n";
    uint32_t v32 = 58;
    goto LABEL_64;
  }
  unint64_t v9 = (unint64_t)v5 & 0xFFFFFFFF00000000 | a3;
  BOOL v10 = (unint64_t)v5 >> 32 == 0;
  unint64_t v11 = v9 - 0x100000000;
  unint64_t v12 = v9 + 0x100000000;
  BOOL v13 = v9 > 0xFFFFFFFEFFFFFFFFLL;
  if (v9 <= 0xFFFFFFFEFFFFFFFFLL) {
    unint64_t v14 = v4;
  }
  else {
    unint64_t v14 = v4 + 1;
  }
  if (v9 <= (unint64_t)v5) {
    unint64_t v15 = (unint64_t)&v5[-v9];
  }
  else {
    unint64_t v15 = v9 - (void)v5;
  }
  uint64_t v16 = (__PAIR128__(v4, (unint64_t)v5 >> 32) - 1) >> 64;
  if (v11 <= (unint64_t)v5) {
    BOOL v10 = 1;
  }
  if ((__PAIR128__(v4, (unint64_t)v5 >> 32) - 1) >> 64 <= v4 && v10) {
    unint64_t v17 = (unint64_t)&v5[-v11];
  }
  else {
    unint64_t v17 = v11 - (void)v5;
  }
  if (v12 <= (unint64_t)v5) {
    BOOL v13 = 1;
  }
  if (v14 <= v4 && v13) {
    unint64_t v18 = (unint64_t)&v5[-v12];
  }
  else {
    unint64_t v18 = v12 - (void)v5;
  }
  uint64_t v38 = -1;
  __int16 v37 = -1;
  if (v15 <= v17 && v15 <= v18)
  {
    if (v15 <= 0x59682EFF)
    {
      int v25 = 0;
      goto LABEL_48;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134219008;
      int v42 = [(TSDCKernelClock *)self clockIdentifier];
      __int16 v43 = 2048;
      uint64_t v44 = 1500;
      __int16 v45 = 2048;
      unint64_t v46 = v15;
      __int16 v47 = 2048;
      v48 = (const char *)v17;
      __int16 v49 = 2048;
      v50 = (const char *)v18;
      BOOL v22 = MEMORY[0x1E4F14500];
      BOOL v23 = "TSDCgPTPClock(0x%016llx): Converted a 32 time with spliced which is more than %llu milliseconds from now. no"
            "wSplicedDiffMag %llu nowPastDiffMag %llu nowFutureDiffMag %llu\n";
      uint32_t v24 = 52;
      goto LABEL_41;
    }
    goto LABEL_42;
  }
  if (v17 > v15 || v17 > v18)
  {
    if (v18 > v15 || v18 > v17)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        int v42 = [(TSDCKernelClock *)self clockIdentifier];
        __int16 v43 = 2048;
        uint64_t v44 = v15;
        __int16 v45 = 2048;
        unint64_t v46 = v17;
        __int16 v47 = 2048;
        v48 = (const char *)v18;
        BOOL v22 = MEMORY[0x1E4F14500];
        BOOL v23 = "TSDCgPTPClock(0x%016llx): Converted a 32 time which didn't match a closest one condition. nowSplicedDiffMa"
              "g %llu nowPastDiffMag %llu nowFutureDiffMag %llu\n";
        uint32_t v24 = 42;
LABEL_41:
        _os_log_impl(&dword_1BA88B000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
      }
LABEL_42:
      int v25 = 1;
LABEL_48:
      uint64_t v16 = v35;
      goto LABEL_57;
    }
    if (v18 <= 0x59682EFF)
    {
      int v25 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v27 = [(TSDCKernelClock *)self clockIdentifier];
        *(_DWORD *)buf = 134219008;
        int v42 = (const char *)v27;
        __int16 v43 = 2048;
        uint64_t v44 = 1500;
        __int16 v45 = 2048;
        unint64_t v46 = v15;
        __int16 v47 = 2048;
        v48 = (const char *)v17;
        __int16 v49 = 2048;
        v50 = (const char *)v18;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Converted a 32 time with future which is more than %llu milliseconds from now. nowSplicedDiffMag %llu nowPastDiffMag %llu nowFutureDiffMag %llu\n", buf, 0x34u);
      }
      int v25 = 1;
    }
    uint64_t v16 = v14;
    v9 += 0x100000000;
  }
  else
  {
    if (v17 <= 0x59682EFF)
    {
      int v25 = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v26 = [(TSDCKernelClock *)self clockIdentifier];
        *(_DWORD *)buf = 134219008;
        int v42 = (const char *)v26;
        __int16 v43 = 2048;
        uint64_t v44 = 1500;
        __int16 v45 = 2048;
        unint64_t v46 = v15;
        __int16 v47 = 2048;
        v48 = (const char *)v17;
        __int16 v49 = 2048;
        v50 = (const char *)v18;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Converted a 32 time with past which is more than %llu milliseconds from now. nowSplicedDiffMag %llu nowPastDiffMag %llu nowFutureDiffMag %llu\n", buf, 0x34u);
      }
      int v25 = 1;
    }
    v9 -= 0x100000000;
  }
LABEL_57:
  unint64_t v7 = -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", v16, v9, &v38, &v37);
  if ((v40 != v38 || v39 != v37) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v28 = [(TSDCKernelClock *)self clockIdentifier];
    *(_DWORD *)buf = 134218496;
    int v42 = (const char *)v28;
    __int16 v43 = 2048;
    uint64_t v44 = v40;
    __int16 v45 = 2048;
    unint64_t v46 = v38;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Converted a 32 time with the expansion performed on a different GrandMaster 0x%016llx than the conversion 0x%016llx.\n", buf, 0x20u);
  }
  if (v25 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v29 = [(TSDCKernelClock *)self clockIdentifier];
    *(_DWORD *)buf = 134220288;
    int v42 = (const char *)v29;
    __int16 v43 = 2048;
    uint64_t v44 = (uint64_t)v6;
    __int16 v45 = 2048;
    unint64_t v46 = v35;
    __int16 v47 = 2048;
    v48 = v6;
    __int16 v49 = 2048;
    v50 = (const char *)v34;
    __int16 v51 = 2048;
    unint64_t v52 = v9;
    __int16 v53 = 2048;
    uint64_t v54 = v16;
    __int16 v55 = 2048;
    unint64_t v56 = v9;
    __int16 v57 = 2048;
    unint64_t v58 = v7;
    __int16 v59 = 2048;
    v60 = &v6[-v9];
    uint64_t v30 = MEMORY[0x1E4F14500];
    v31 = "TSDCgPTPClock(0x%016llx): Now gPTP %llu (%llx.%016llx) now mach %llu convert gPTP %llu (%llx.%016llx) mach %llu diff %lld\n";
    uint32_t v32 = 102;
LABEL_64:
    _os_log_impl(&dword_1BA88B000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
  }
  return v7;
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v11) {
      return result;
    }
    int v14 = 136316418;
    unint64_t v15 = "domain32Time != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    unint64_t v21 = "";
    __int16 v22 = 2080;
    BOOL v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 661;
    unint64_t v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  unint64_t v5 = a4;
  if (!a4)
  {
    BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v13) {
      return result;
    }
    int v14 = 136316418;
    unint64_t v15 = "timeSyncTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    unint64_t v21 = "";
    __int16 v22 = 2080;
    BOOL v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v24 = 1024;
    int v25 = 662;
    unint64_t v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    uint64_t v6 = a3;
    uint64_t v8 = a5;
    do
    {
      unsigned int v9 = *v6++;
      *v5++ = [(TSDCgPTPClock *)self convertFrom32BitASToTimeSyncTime:v9];
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  [(TSDCgPTPClock *)self convertFromTimeSyncTimeTo128BitgPTPTime:a3 grandmasterUsed:a4 portNumber:a5];
  return v5;
}

- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v42 = -1;
  __int16 v41 = -1;
  unint64_t v35 = [(TSClock *)self->_timeSyncClock convertFromMachAbsoluteToDomainTime:mach_absolute_time()];
  uint64_t v7 = -[TSDCgPTPClock convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:](self, "convertFromTimeSyncTimeTo128BitgPTPTime:grandmasterUsed:portNumber:");
  uint64_t v9 = v7;
  BOOL v10 = v8;
  unint64_t v11 = -1;
  if (v7 != -1 || v8 != (const char *)-1)
  {
    unint64_t v13 = a3 - (void)v8;
    uint64_t v36 = &v8[-a3];
    if ((unint64_t)v8 >= a3) {
      unint64_t v14 = (unint64_t)&v8[-a3];
    }
    else {
      unint64_t v14 = a3 - (void)v8;
    }
    if (v7)
    {
      unint64_t v15 = (unint64_t)v8 >= a3;
      if (v7 == -1)
      {
        if ((unint64_t)v8 < a3) {
          unint64_t v17 = -2;
        }
        else {
          unint64_t v17 = -1;
        }
        unint64_t v13 = (unint64_t)&v8[-a3];
        unint64_t v16 = (unint64_t)&v8[-a3];
LABEL_20:
        unint64_t v40 = -1;
        unsigned __int16 v39 = -1;
        if (v15) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v16 >= v14;
        }
        if (v18)
        {
          if (v17) {
            BOOL v19 = 1;
          }
          else {
            BOOL v19 = v13 >= v14;
          }
          if (v19)
          {
            if (v14 <= 0x8BB2C96FFFLL)
            {
              int v31 = 0;
              goto LABEL_70;
            }
            if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
LABEL_68:
              int v31 = 1;
LABEL_70:
              uint64_t v28 = v9;
              goto LABEL_71;
            }
            *(_DWORD *)buf = 134219776;
            uint64_t v44 = [(TSDCKernelClock *)self clockIdentifier];
            __int16 v45 = 2048;
            uint64_t v46 = 600000;
            __int16 v47 = 2048;
            unint64_t v48 = 0;
            __int16 v49 = 2048;
            v50 = (const char *)v14;
            __int16 v51 = 2048;
            unint64_t v52 = (const char *)v15;
            __int16 v53 = 2048;
            unint64_t v54 = v16;
            __int16 v55 = 2048;
            unint64_t v56 = v17;
            __int16 v57 = 2048;
            unint64_t v58 = v13;
            __int16 v20 = MEMORY[0x1E4F14500];
            unint64_t v21 = "TSDCgPTPClock(0x%016llx): Converted a 64 time with spliced which is more than %llu milliseconds from n"
                  "ow. nowSplicedDiffMag %llx.%016llx nowPastDiffMag %llx.%016llx nowFutureDiffMag %llx.%016llx\n";
            uint32_t v22 = 82;
LABEL_67:
            _os_log_impl(&dword_1BA88B000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
            goto LABEL_68;
          }
          if (v15) {
            BOOL v23 = 0;
          }
          else {
            BOOL v23 = v14 >= v16;
          }
          if (v23 && v13 >= v16)
          {
LABEL_59:
            uint64_t v28 = v7 - 1;
            if (v16 > 0x8BB2C96FFFLL)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134219776;
                uint64_t v44 = [(TSDCKernelClock *)self clockIdentifier];
                __int16 v45 = 2048;
                uint64_t v46 = 600000;
                __int16 v47 = 2048;
                unint64_t v48 = 0;
                __int16 v49 = 2048;
                v50 = (const char *)v14;
                __int16 v51 = 2048;
                unint64_t v52 = (const char *)v15;
                __int16 v53 = 2048;
                unint64_t v54 = v16;
                __int16 v55 = 2048;
                unint64_t v56 = v17;
                __int16 v57 = 2048;
                unint64_t v58 = v13;
                unint64_t v29 = MEMORY[0x1E4F14500];
                uint64_t v30 = "TSDCgPTPClock(0x%016llx): Converted a 64 time with past which is more than %llu milliseconds from "
                      "now. nowSplicedDiffMag %llx.%016llx nowPastDiffMag %llx.%016llx nowFutureDiffMag %llx.%016llx\n";
                goto LABEL_62;
              }
              goto LABEL_63;
            }
            goto LABEL_64;
          }
        }
        else if (v17 == v15)
        {
          if (v13 >= v16) {
            goto LABEL_59;
          }
        }
        else if (v17 > v15)
        {
          goto LABEL_59;
        }
        if (v15) {
          BOOL v25 = 1;
        }
        else {
          BOOL v25 = v16 >= v13;
        }
        char v26 = !v25;
        if (v17) {
          BOOL v27 = 0;
        }
        else {
          BOOL v27 = v14 >= v13;
        }
        if (v27 && (v26 & 1) == 0)
        {
          uint64_t v28 = v7 + 1;
          if (v13 > 0x8BB2C96FFFLL)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134219776;
              uint64_t v44 = [(TSDCKernelClock *)self clockIdentifier];
              __int16 v45 = 2048;
              uint64_t v46 = 600000;
              __int16 v47 = 2048;
              unint64_t v48 = 0;
              __int16 v49 = 2048;
              v50 = (const char *)v14;
              __int16 v51 = 2048;
              unint64_t v52 = (const char *)v15;
              __int16 v53 = 2048;
              unint64_t v54 = v16;
              __int16 v55 = 2048;
              unint64_t v56 = 0;
              __int16 v57 = 2048;
              unint64_t v58 = v13;
              unint64_t v29 = MEMORY[0x1E4F14500];
              uint64_t v30 = "TSDCgPTPClock(0x%016llx): Converted a 64 time with future which is more than %llu milliseconds from "
                    "now. nowSplicedDiffMag %llx.%016llx nowPastDiffMag %llx.%016llx nowFutureDiffMag %llx.%016llx\n";
LABEL_62:
              _os_log_impl(&dword_1BA88B000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0x52u);
            }
LABEL_63:
            int v31 = 1;
LABEL_71:
            unint64_t v11 = -[TSDCgPTPClock convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:](self, "convertFrom128BitgPTPTimeToTimeSyncTime:grandmasterUsed:portNumber:", v28, a3, &v40, &v39);
            if ((v42 != v40 || (unsigned __int16)v41 != v39)
              && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v32 = [(TSDCKernelClock *)self clockIdentifier];
              *(_DWORD *)buf = 134218496;
              uint64_t v44 = (const char *)v32;
              __int16 v45 = 2048;
              uint64_t v46 = v42;
              __int16 v47 = 2048;
              unint64_t v48 = v40;
              _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Converted a 64 time with the expansion performed on a different GrandMaster 0x%016llx than the conversion 0x%016llx.\n", buf, 0x20u);
            }
            if (v31 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v33 = [(TSDCKernelClock *)self clockIdentifier];
              *(_DWORD *)buf = 134220288;
              uint64_t v44 = (const char *)v33;
              __int16 v45 = 2048;
              uint64_t v46 = (uint64_t)v10;
              __int16 v47 = 2048;
              unint64_t v48 = v9;
              __int16 v49 = 2048;
              v50 = v10;
              __int16 v51 = 2048;
              unint64_t v52 = (const char *)v35;
              __int16 v53 = 2048;
              unint64_t v54 = a3;
              __int16 v55 = 2048;
              unint64_t v56 = v28;
              __int16 v57 = 2048;
              unint64_t v58 = a3;
              __int16 v59 = 2048;
              unint64_t v60 = v11;
              __int16 v61 = 2048;
              v62 = v36;
              _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Now gPTP %llu (%llx.%016llx) now mach %llu convert gPTP %llu (%llx.%016llx) mach %llu diff %lld\n", buf, 0x66u);
            }
            if (a4) {
              *a4 = v40;
            }
            if (a5) {
              *a5 = v39;
            }
            return v11;
          }
LABEL_64:
          int v31 = 0;
          goto LABEL_71;
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        *(_DWORD *)buf = 134219520;
        uint64_t v44 = [(TSDCKernelClock *)self clockIdentifier];
        __int16 v45 = 2048;
        uint64_t v46 = 0;
        __int16 v47 = 2048;
        unint64_t v48 = v14;
        __int16 v49 = 2048;
        v50 = (const char *)v15;
        __int16 v51 = 2048;
        unint64_t v52 = (const char *)v16;
        __int16 v53 = 2048;
        unint64_t v54 = v17;
        __int16 v55 = 2048;
        unint64_t v56 = v13;
        __int16 v20 = MEMORY[0x1E4F14500];
        unint64_t v21 = "TSDCgPTPClock(0x%016llx): Converted a 64 time which didn't match a closest one condition. nowSplicedDiffMa"
              "g %llx.%016llx nowPastDiffMag %llx.%016llx nowFutureDiffMag %llx.%016llx\n";
        uint32_t v22 = 72;
        goto LABEL_67;
      }
      unint64_t v16 = (unint64_t)&v8[-a3];
    }
    else
    {
      if ((unint64_t)v8 > a3) {
        unint64_t v15 = -2;
      }
      else {
        unint64_t v15 = -1;
      }
      unint64_t v16 = a3 - (void)v8;
    }
    unint64_t v17 = (unint64_t)v8 <= a3;
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v44 = "tsNow.hi != TSInvalidTime || tsNow.lo != TSInvalidTime";
    __int16 v45 = 2048;
    uint64_t v46 = 0;
    __int16 v47 = 2048;
    unint64_t v48 = 0;
    __int16 v49 = 2080;
    v50 = "";
    __int16 v51 = 2080;
    unint64_t v52 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v53 = 1024;
    LODWORD(v54) = 691;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v11;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned int v16 = [(TSDCKernelClock *)self validIndex];
  unsigned int v17 = v16;
  if (a3) {
    *a3 = 1;
  }
  if (a4) {
    *a4 = 1;
  }
  if (a5) {
    *a5 = -1;
  }
  if (a6) {
    *a6 = -1;
  }
  if (a7) {
    *a7 = -1;
  }
  if (a8) {
    *a8 = -1;
  }
  if (v16 >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136316418;
      __int16 v20 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2080;
      char v26 = "";
      __int16 v27 = 2080;
      uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      __int16 v29 = 1024;
      int v30 = 803;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v19, 0x3Au);
    }
  }
  else
  {
    if (a3) {
      *a3 = self->_timeInfo[(unint64_t)v16].cumulativeScaledRate;
    }
    if (a4) {
      *a4 = 0x20000000000;
    }
    if (a5) {
      *a5 = self->_timeInfo[(unint64_t)v16].timeSyncTime;
    }
    if (a6) {
      *a6 = self->_timeInfo[(unint64_t)v16].domainTime.lo;
    }
    if (a7) {
      *a7 = self->_timeInfo[(unint64_t)v16].grandmasterID;
    }
    if (a8) {
      *a8 = self->_timeInfo[(unint64_t)v16].localPortNumber;
    }
  }
  return v17 < 8;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v5 = [(TSDCgPTPClock *)self convertFromTimeSyncTimeTo128BitgPTPTime:a3 grandmasterUsed:a4 portNumber:a5 flags:0];
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5 flags:(unint64_t *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = -1;
  unsigned int v12 = [(TSDCKernelClock *)self validIndex];
  unsigned int v13 = v12;
  if (a3 == -1 || v12 == -1)
  {
    if (v12 == -1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v43 = [(TSDCKernelClock *)self clockIdentifier];
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Attempting to convert from Mach but index == -1\n", buf, 0xCu);
    }
    if (a4) {
      *a4 = -1;
    }
    if (a5) {
      *a5 = -1;
    }
    if (!a6) {
      goto LABEL_33;
    }
    goto LABEL_14;
  }
  timeInfo = self->_timeInfo;
  if (!self->_timeInfo[(unint64_t)v12].syncInfoValid)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v43 = [(TSDCKernelClock *)self clockIdentifier];
      __int16 v44 = 1024;
      LODWORD(v45) = v13;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Attempting to convert from Mach but sync info at index %u is not valid\n", buf, 0x12u);
    }
    if (a4) {
      *a4 = -1;
    }
    if (a5) {
      *a5 = -1;
    }
    if (!a6)
    {
LABEL_33:
      unint64_t v16 = -1;
      goto LABEL_53;
    }
LABEL_14:
    unint64_t v15 = 0x8000000000000000;
    unint64_t v16 = -1;
LABEL_52:
    *a6 = v15;
    goto LABEL_53;
  }
  __int16 v41 = a5;
  BOOL v18 = a6;
  uint64_t v40 = v12;
  int v19 = &timeInfo[(unint64_t)v12];
  unint64_t timeSyncTime = v19->timeSyncTime;
  if (timeSyncTime <= a3) {
    uint64_t v21 = a3 - timeSyncTime;
  }
  else {
    uint64_t v21 = timeSyncTime - a3;
  }
  unint64_t v22 = scaledInterval(v21, v19->cumulativeScaledRate);
  unint64_t v23 = v22;
  p_lo = &v19->domainTime.lo;
  unint64_t hi = v19->domainTime.hi;
  if (timeSyncTime <= a3)
  {
    unint64_t v11 = *p_lo + v22;
    BOOL v29 = __CFADD__(*p_lo, v22);
    uint64_t v30 = v11 < *p_lo || v29;
    unint64_t v16 = hi + v30;
    a6 = v18;
    goto LABEL_41;
  }
  unint64_t v26 = *p_lo;
  if (hi) {
    BOOL v27 = 1;
  }
  else {
    BOOL v27 = v26 > v22;
  }
  a6 = v18;
  if (v27)
  {
    unsigned long long v28 = __PAIR128__(hi, v26) - v22;
    unint64_t v16 = *((void *)&v28 + 1);
    unint64_t v11 = v28;
LABEL_41:
    uint64_t v31 = v41;
    goto LABEL_45;
  }
  BOOL v32 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  uint64_t v31 = v41;
  if (v32)
  {
    unint64_t v33 = [(TSDCKernelClock *)self clockIdentifier];
    unint64_t v34 = [(TSClock *)self->_timeSyncClock convertFromMachAbsoluteToDomainTime:mach_absolute_time()];
    unint64_t v35 = *p_lo;
    *(_DWORD *)buf = 134219008;
    unint64_t v43 = v33;
    __int16 v44 = 2048;
    unint64_t v45 = a3;
    __int16 v46 = 2048;
    unint64_t v47 = v34;
    __int16 v48 = 2048;
    unint64_t v49 = v23;
    __int16 v50 = 2048;
    unint64_t v51 = v35;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Trying to convert from a timesync time nanosecond time %llu (%llu) that would result in a negative gPTP time %llu %llu\n", buf, 0x34u);
  }
  unint64_t v16 = -1;
LABEL_45:
  if (a4) {
    *a4 = timeInfo[v40].grandmasterID;
  }
  if (v31) {
    unsigned __int16 *v31 = timeInfo[v40].localPortNumber;
  }
  if (a6)
  {
    uint64_t v36 = &timeInfo[v40];
    unint64_t v37 = ((unint64_t)v36->syncFlags >> 3) & 1;
    *a6 = v37;
    unsigned int syncFlags = v36->syncFlags;
    if ((syncFlags & 0x30) != 0)
    {
      unint64_t v15 = (syncFlags >> 3) & 6 | v37;
      goto LABEL_52;
    }
  }
LABEL_53:
  unint64_t v39 = v11;
  result.var1 = v39;
  result.var0 = v16;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = -1;
  unsigned int v11 = [(TSDCKernelClock *)self validIndex];
  unsigned int v12 = v11;
  if (var0 == -1)
  {
    if (var1 == -1 || v11 == -1)
    {
      if (v11 != -1) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }
  }
  else if (v11 == -1)
  {
LABEL_14:
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    int v31 = 134217984;
    unint64_t v32 = [(TSDCKernelClock *)self clockIdentifier];
    int v19 = MEMORY[0x1E4F14500];
    __int16 v20 = "TSDCgPTPClock(0x%016llx): Attempting to convert to Mach but index == -1\n";
    uint32_t v21 = 12;
    goto LABEL_20;
  }
  timeInfo = self->_timeInfo;
  if (!self->_timeInfo[(unint64_t)v11].syncInfoValid)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    int v31 = 134218240;
    unint64_t v32 = [(TSDCKernelClock *)self clockIdentifier];
    __int16 v33 = 1024;
    LODWORD(v34) = v12;
    int v19 = MEMORY[0x1E4F14500];
    __int16 v20 = "TSDCgPTPClock(0x%016llx): Attempting to convert to Mach but sync info at index %u is not valid\n";
    uint32_t v21 = 18;
LABEL_20:
    _os_log_impl(&dword_1BA88B000, v19, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v31, v21);
LABEL_21:
    if (a4) {
      *a4 = -1;
    }
    if (a5)
    {
      unsigned __int16 localPortNumber = -1;
LABEL_31:
      *a5 = localPortNumber;
      return v10;
    }
    return v10;
  }
  uint64_t v14 = v11;
  unint64_t v15 = &timeInfo[(unint64_t)v11];
  unint64_t lo = v15->domainTime.lo;
  unint64_t hi = v15->domainTime.hi;
  if (hi > var0 || (hi == var0 ? (BOOL v18 = lo > var1) : (BOOL v18 = 0), v18))
  {
    unint64_t v22 = scaledInterval(lo - var1, v15->inverseCumulativeScaledRate);
    unint64_t timeSyncTime = v15->timeSyncTime;
    p_unint64_t timeSyncTime = &v15->timeSyncTime;
    unint64_t v25 = timeSyncTime - v22;
    if (timeSyncTime <= v22)
    {
      unint64_t v27 = v22;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v28 = [(TSDCKernelClock *)self clockIdentifier];
        unint64_t v29 = *p_timeSyncTime;
        int v31 = 134219520;
        unint64_t v32 = v28;
        __int16 v33 = 2048;
        unint64_t v34 = var0;
        __int16 v35 = 2048;
        unint64_t v36 = var1;
        __int16 v37 = 2048;
        unint64_t v38 = var1;
        __int16 v39 = 2048;
        unint64_t v40 = v27;
        __int16 v41 = 2048;
        unint64_t v42 = v29;
        __int16 v43 = 2048;
        uint64_t v44 = mach_absolute_time();
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx): Trying to convert from a gPTP time %llx.%016llx (%llu) that would result in a negative mach_absolute time %llu %llu %llu\n", (uint8_t *)&v31, 0x48u);
      }
    }
    else
    {
      unint64_t v10 = v25;
    }
  }
  else
  {
    unint64_t v10 = timeInfo[(unint64_t)v11].timeSyncTime
        + scaledInterval(var1 - lo, timeInfo[(unint64_t)v11].inverseCumulativeScaledRate);
  }
  if (a4) {
    *a4 = timeInfo[v14].grandmasterID;
  }
  if (a5)
  {
    unsigned __int16 localPortNumber = timeInfo[v14].localPortNumber;
    goto LABEL_31;
  }
  return v10;
}

- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock addReverseSyncOnInterfaceNamed:a3 withDomainNumner:a4 syncInterval:*(void *)&a5 error:a6];
}

- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5
{
  return [(_TSF_TSDgPTPClock *)self->_gPTPClock removeReverseSyncFromInterfaceNamed:a3 withDomainNumner:a4 error:a5];
}

- (void)_getInitialSyncInfo
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  __int16 v20 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  __int16 v13 = 0;
  p_gPTPClock = (id *)&self->_gPTPClock;
  uint64_t v4 = [(_TSF_TSDKernelClock *)self->_gPTPClock lockState];
  id v5 = *p_gPTPClock;
  id v12 = 0;
  char v6 = [v5 getSyncInfoWithSyncInfoValid:(char *)&v20 + 1 syncFlags:&v20 timeSyncTime:&v19 domainTimeHi:&v18 domainTimeLo:&v17 cumulativeScaledRate:&v16 inverseCumulativeScaledRate:&v15 grandmasterID:&v14 localPortNumber:&v13 error:&v12];
  id v7 = v12;
  uint64_t v8 = [*p_gPTPClock gptpPath];
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t v23 = 136316418;
      uint64_t v24 = "success == YES";
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2048;
      uint64_t v28 = 0;
      __int16 v29 = 2080;
      uint64_t v30 = "";
      __int16 v31 = 2080;
      unint64_t v32 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
      __int16 v33 = 1024;
      int v34 = 1070;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v23, 0x3Au);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v10 = [v7 description];
      -[TSDCTranslationClock getInitialSyncInfo]([v10 UTF8String], v23, v10);
    }
    uint64_t v4 = 0;
    uint64_t v18 = -1;
    uint64_t v19 = -1;
    uint64_t v16 = 1;
    uint64_t v17 = -1;
    uint64_t v15 = 1;
    uint64_t v14 = -1;
    __int16 v13 = -1;
    __int16 v20 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v9 = [(TSDCKernelClock *)self clockIdentifier];
    *(_DWORD *)buf = 134217984;
    unint64_t v22 = v9;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) _getInitialSyncInfo: response", buf, 0xCu);
  }
  LOWORD(v11) = v13;
  [(TSDCgPTPClock *)self updateWithSyncInfoValid:HIBYTE(v20) syncFlags:v20 timeSyncTime:v19 domainTimeHi:v18 domainTimeLo:v17 cumulativeScaledRate:v16 inverseCumulativeScaledRate:v15 grandmasterID:v14 localPortNumber:v11];
  [(TSDCgPTPClock *)self updateGrandmasterIdentity:v14 andgPTPPath:v8];
  [(TSDCgPTPClock *)self updateLockState:v4];
}

- (void)didBeginClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    unint64_t v12 = [(TSDCKernelClock *)self clockIdentifier];
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    __int16 v15 = 1024;
    int v16 = v5;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) didBeginClockGrandmasterChangeWithGrandmasterID:0x%016llx localPort:%hu", (uint8_t *)&v11, 0x1Cu);
  }
  unint64_t v9 = [(TSDCKernelClock *)self client];
  [v9 didBeginClockGrandmasterChange];

  id v10 = [(TSDCKernelClock *)self client];
  [v10 didBeginClockGrandmasterChangeWithGrandmasterID:a3 localPort:v5];
}

- (void)didEndClockGrandmasterChangeWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218496;
    unint64_t v12 = [(TSDCKernelClock *)self clockIdentifier];
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    __int16 v15 = 1024;
    int v16 = v5;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) didEndClockGrandmasterChangeWithGrandmasterID:0x%016llx localPort:%hu", (uint8_t *)&v11, 0x1Cu);
  }
  unint64_t v9 = [(TSDCKernelClock *)self client];
  [v9 didEndClockGrandmasterChange];

  id v10 = [(TSDCKernelClock *)self client];
  [v10 didEndClockGrandmasterChangeWithGrandmasterID:a3 localPort:v5];
}

- (void)didChangeLocalPortWithGrandmasterID:(unint64_t)a3 localPort:(unsigned __int16)a4 forClock:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218496;
    unint64_t v11 = [(TSDCKernelClock *)self clockIdentifier];
    __int16 v12 = 2048;
    unint64_t v13 = a3;
    __int16 v14 = 1024;
    int v15 = v5;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) didChangeLocalPortWithGrandmasterID:0x%016llx localPort:%hu", (uint8_t *)&v10, 0x1Cu);
  }
  unint64_t v9 = [(TSDCKernelClock *)self client];
  [v9 didChangeLocalPortWithGrandmasterID:a3 localPort:v5];
}

- (void)updateLockState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218240;
    unint64_t v6 = [(TSDCKernelClock *)self clockIdentifier];
    __int16 v7 = 1024;
    int v8 = v3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) updateLockState:%d", (uint8_t *)&v5, 0x12u);
  }
  os_unfair_lock_lock([(TSDCKernelClock *)self getUpdateLock]);
  [(TSDCKernelClock *)self setInternalLockState:v3];
  if ([(TSDCKernelClock *)self internalLockState] == 2)
  {
    if ([(TSDCKernelClock *)self validIndex] >= 8) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = v3;
    }
  }
  os_unfair_lock_unlock([(TSDCKernelClock *)self getUpdateLock]);
  [(TSDCKernelClock *)self postLockStateChange:v3];
}

- (void)updateWithSyncInfoValid:(BOOL)a3 syncFlags:(unsigned __int8)a4 timeSyncTime:(unint64_t)a5 domainTimeHi:(unint64_t)a6 domainTimeLo:(unint64_t)a7 cumulativeScaledRate:(unint64_t)a8 inverseCumulativeScaledRate:(unint64_t)a9 grandmasterID:(unint64_t)a10 localPortNumber:(unsigned __int16)a11
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = [(TSDCKernelClock *)self lockState];
  unint64_t v25 = 0;
  unint64_t v26 = 0;
  if (a5 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)info = 136316418;
    *(void *)&info[4] = "timeSyncTime != TSInvalidTime";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2080;
    __int16 v33 = "";
    __int16 v34 = 2080;
    uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v36 = 1024;
    int v37 = 1144;
    unint64_t v23 = MEMORY[0x1E4F14500];
    goto LABEL_16;
  }
  if (a6 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)info = 136316418;
    *(void *)&info[4] = "domainTimeHi != TSInvalidTime";
    __int16 v28 = 2048;
    uint64_t v29 = 0;
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2080;
    __int16 v33 = "";
    __int16 v34 = 2080;
    uint64_t v35 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCgPTPClock.mm";
    __int16 v36 = 1024;
    int v37 = 1145;
    unint64_t v23 = MEMORY[0x1E4F14500];
LABEL_16:
    _os_log_impl(&dword_1BA88B000, v23, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", info, 0x3Au);
    return;
  }
  uint64_t v18 = v17;
  os_unfair_lock_lock([(TSDCKernelClock *)self getUpdateLock]);
  uint64_t v19 = &self->_timeInfo[(unint64_t)(([(TSDCKernelClock *)self validIndex] + 1) & 7)];
  v19->syncInfoValid = 1;
  v19->unsigned int syncFlags = a4;
  v19->unint64_t timeSyncTime = a5;
  v19->domainTime.unint64_t lo = a7;
  v19->domainTime.unint64_t hi = a6;
  v19->unint64_t cumulativeScaledRate = a8;
  v19->unint64_t inverseCumulativeScaledRate = a9;
  v19->grandmasterID = a10;
  v19->unsigned __int16 localPortNumber = a11;
  -[TSDCKernelClock setValidIndex:](self, "setValidIndex:");
  [(TSDCgPTPClock *)self getMachAbsoluteRateRatioNumerator:&v26 denominator:&v25 machAnchor:0 andDomainAnchor:0 withError:0];
  mach_timebase_info((mach_timebase_info_t)info);
  v25 /= *(unsigned int *)&info[4];
  v26 /= *(unsigned int *)info;
  double v20 = (double)v26 / (double)v25;
  uint32_t v21 = [(TSDCKernelClock *)self propertyUpdateQueue];

  if (v21)
  {
    unint64_t v22 = [(TSDCKernelClock *)self propertyUpdateQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __169__TSDCgPTPClock_updateWithSyncInfoValid_syncFlags_timeSyncTime_domainTimeHi_domainTimeLo_cumulativeScaledRate_inverseCumulativeScaledRate_grandmasterID_localPortNumber___block_invoke;
    v24[3] = &unk_1E622AD30;
    v24[4] = self;
    *(double *)&v24[5] = v20;
    dispatch_async(v22, v24);
  }
  else
  {
    [(TSDCKernelClock *)self setHostRateRatio:v20];
  }
  if ([(TSDCKernelClock *)self internalLockState] == 2 && v18 != 2) {
    uint64_t v18 = [(TSDCKernelClock *)self internalLockState];
  }
  os_unfair_lock_unlock([(TSDCKernelClock *)self getUpdateLock]);
  if (v18 != [(TSDCKernelClock *)self lockState]) {
    [(TSDCKernelClock *)self postLockStateChange:v18];
  }
}

void __169__TSDCgPTPClock_updateWithSyncInfoValid_syncFlags_timeSyncTime_domainTimeHi_domainTimeLo_cumulativeScaledRate_inverseCumulativeScaledRate_grandmasterID_localPortNumber___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(a1 + 32) setHostRateRatio:*(double *)(a1 + 40)];
}

- (void)updateGrandmasterIdentity:(unint64_t)a3 andgPTPPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v14 = [(TSDCKernelClock *)self clockIdentifier];
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock(0x%016llx) updateGrandmasterIdentity:0x%016llx andgPTPPath:...", buf, 0x16u);
  }
  __int16 v7 = [(TSDCKernelClock *)self propertyUpdateQueue];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    [(TSDCgPTPClock *)self setGrandmasterIdentity:a3];
    [(TSDCgPTPClock *)self setGptpPath:v6];
  }
  else
  {
    uint64_t v9 = [(TSDCKernelClock *)self propertyUpdateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__TSDCgPTPClock_updateGrandmasterIdentity_andgPTPPath___block_invoke;
    block[3] = &unk_1E622AD58;
    block[4] = self;
    unint64_t v12 = a3;
    id v11 = v6;
    dispatch_async(v9, block);
  }
}

void __55__TSDCgPTPClock_updateGrandmasterIdentity_andgPTPPath___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(a1 + 32) setGrandmasterIdentity:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setGptpPath:*(void *)(a1 + 40)];
}

- (NSArray)gptpPath
{
  return self->_gptpPath;
}

- (void)setGptpPath:(id)a3
{
}

- (unint64_t)grandmasterIdentity
{
  return self->_grandmasterIdentity;
}

- (void)setGrandmasterIdentity:(unint64_t)a3
{
  self->_grandmasterIdentity = a3;
}

- (unsigned)clockPriority1
{
  return self->_clockPriority1;
}

- (void)setClockPriority1:(unsigned __int8)a3
{
  self->_clockPriority1 = a3;
}

- (unsigned)clockPriority2
{
  return self->_clockPriority2;
}

- (void)setClockPriority2:(unsigned __int8)a3
{
  self->_clockPriority2 = a3;
}

- (unsigned)clockClass
{
  return self->_clockClass;
}

- (void)setClockClass:(unsigned __int8)a3
{
  self->_clockClass = a3;
}

- (unsigned)clockAccuracy
{
  return self->_clockAccuracy;
}

- (void)setClockAccuracy:(unsigned __int8)a3
{
  self->_clockAccuracy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gptpPath, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_gPTPClock, 0);
}

- (id).cxx_construct
{
  for (uint64_t i = 0; i != 512; i += 64)
  {
    uint64_t v3 = (char *)self + i + 360;
    *uint64_t v3 = 0;
    v3[1] = 0;
  }
  return self;
}

@end