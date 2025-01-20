@interface _TSF_TSDgPTPClock
+ (id)availablegPTPClockIdentifiers;
+ (id)clockNameForClockIdentifier:(unint64_t)a3;
+ (id)diagnosticInfoForService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
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
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9;
- (BOOL)getSyncInfoWithSyncInfoValid:(BOOL *)a3 syncFlags:(char *)a4 timeSyncTime:(unint64_t *)a5 domainTimeHi:(unint64_t *)a6 domainTimeLo:(unint64_t *)a7 cumulativeScaledRate:(unint64_t *)a8 inverseCumulativeScaledRate:(unint64_t *)a9 grandmasterID:(unint64_t *)a10 localPortNumber:(unsigned __int16 *)a11 error:(id *)a12;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9;
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
- (_TSF_TSDgPTPClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4;
- (id)_gptpPath;
- (id)clockName;
- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3;
- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3;
- (id)getMetrics;
- (id)getMetricsWithDelta:(id)a3;
- (id)portWithPortNumber:(unsigned __int16)a3;
- (unint64_t)_grandmasterIdentity;
- (unint64_t)clockIdentity;
- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3;
- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3;
- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5;
- (unint64_t)grandmasterIdentity;
- (unint64_t)machAbsoluteFromgPTPTime:(id)a3;
- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3;
- (unsigned)clockAccuracy;
- (unsigned)clockClass;
- (unsigned)clockPriority1;
- (unsigned)clockPriority2;
- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4;
- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5;
- (void)_handleRefreshConnection;
- (void)_refreshGrandmasterIdentityOnNotificationQueue;
- (void)addImplClock:(id)a3;
- (void)dealloc;
- (void)removeImplClock:(id)a3;
- (void)setGptpPath:(id)a3;
- (void)setGrandmasterIdentity:(unint64_t)a3;
@end

@implementation _TSF_TSDgPTPClock

+ (id)availablegPTPClockIdentifiers
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = (void *)MEMORY[0x1E4F6EC30];
  v4 = [MEMORY[0x1E4F6EC30] serviceMatching:@"IOTimeSyncDomain"];
  v5 = [v3 matchingServices:v4 error:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50___TSF_TSDgPTPClock_availablegPTPClockIdentifiers__block_invoke;
  v8[3] = &unk_1E622AB20;
  id v6 = v2;
  id v9 = v6;
  [v5 enumerateWithBlock:v8];

  return v6;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"IOProviderClass";
  v9[1] = @"IOPropertyMatch";
  v10[0] = @"IOTimeSyncDomain";
  v7 = @"ClockIdentifier";
  v3 = [NSNumber numberWithUnsignedLongLong:a3];
  v8 = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v5;
}

- (_TSF_TSDgPTPClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  implClocks = self->_implClocks;
  self->_implClocks = v7;

  self->_implClocksLock._os_unfair_lock_opaque = 0;
  v14.receiver = self;
  v14.super_class = (Class)_TSF_TSDgPTPClock;
  id v9 = [(_TSF_TSDKernelClock *)&v14 initWithClockIdentifier:a3 pid:v4];
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = [(_TSF_TSDgPTPClock *)v9 _gptpPath];
    gptpPath = v10->_gptpPath;
    v10->_gptpPath = (NSArray *)v11;

    v10->_grandmasterIdentity = [(_TSF_TSDgPTPClock *)v10 _grandmasterIdentity];
  }
  return v10;
}

- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  int v6 = 1;
  unint64_t v19 = -1;
  v20[0] = a3;
  v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:32 scalarInputs:v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    objc_super v14 = "";
    __int16 v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v17 = 1024;
    int v18 = 136;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19;
  }
  else {
    return -1;
  }
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a5 < 0xC)
  {
    uint64_t v19 = 0;
    BOOL v20 = 1;
    if (!a5) {
      return v20;
    }
    goto LABEL_13;
  }
  uint64_t v9 = 0;
  unsigned int v25 = 12 * ((a5 - 12) / 0xC);
  char v26 = 1;
  uint64_t v10 = a3;
  do
  {
    uint64_t v11 = 0;
    int v27 = 12;
    uint64_t v12 = v10;
    do
    {
      long long v13 = *(_OWORD *)v12;
      v12 += 4;
      *(void *)&long long v14 = v13;
      *((void *)&v14 + 1) = DWORD1(v13);
      long long v15 = v14;
      *(void *)&long long v14 = DWORD2(v13);
      *((void *)&v14 + 1) = HIDWORD(v13);
      v16 = &v40[v11];
      _OWORD *v16 = v15;
      v16[1] = v14;
      v11 += 4;
    }
    while (v11 != 12);
    __int16 v17 = [(_TSF_TSDKernelClock *)self connection];
    char v18 = [v17 callMethodWithSelector:33 scalarInputs:v40 scalarInputCount:12 scalarOutputs:&a4[v9] scalarOutputCount:&v27 error:0];

    if ((v18 & 1) == 0)
    {
      char v26 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        __int16 v30 = 2048;
        uint64_t v31 = 0;
        __int16 v32 = 2048;
        uint64_t v33 = 0;
        __int16 v34 = 2080;
        v35 = "";
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
        __int16 v38 = 1024;
        int v39 = 164;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        char v26 = 0;
      }
    }
    uint64_t v5 = (v5 - 12);
    v9 += 12;
    v10 += 12;
  }
  while (v5 > 0xB);
  BOOL v20 = v26;
  uint64_t v19 = v25 + 12;
  if (v5)
  {
LABEL_13:
    uint64_t v21 = 0;
    int v27 = v5;
    do
    {
      v40[v21] = a3[v19 + v21];
      ++v21;
    }
    while (v5 != v21);
    v22 = [(_TSF_TSDKernelClock *)self connection];
    char v23 = [v22 callMethodWithSelector:33 scalarInputs:v40 scalarInputCount:v5 scalarOutputs:&a4[v19] scalarOutputCount:&v27 error:0];

    if ((v23 & 1) == 0)
    {
      BOOL v20 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        __int16 v30 = 2048;
        uint64_t v31 = 0;
        __int16 v32 = 2048;
        uint64_t v33 = 0;
        __int16 v34 = 2080;
        v35 = "";
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
        __int16 v38 = 1024;
        int v39 = 184;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v20;
}

- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = -1;
  uint64_t v26 = -1;
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  uint64_t v27 = -1;
  int v12 = 5;
  v30[0] = a3;
  v3 = [(_TSF_TSDKernelClock *)self connection];
  char v4 = [v3 callMethodWithSelector:37 scalarInputs:v30 scalarInputCount:1 scalarOutputs:&v25 scalarOutputCount:&v12 error:0];

  if (v4)
  {
    uint64_t v5 = v29 & 1;
    uint64_t v6 = (v29 >> 1) & 1;
    unsigned int v7 = (v29 >> 2) & 1;
    v8 = [TSgPTPTime alloc];
    LOBYTE(v11) = v7;
    uint64_t v9 = [(TSgPTPTime *)v8 initWithSeconds:v25 nanoseconds:v26 onGrandmaster:v27 withLocalPortNumber:(unsigned __int16)v28 ptpTimescale:v5 timeTraceable:v6 frequencyTraceable:v11];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      long long v14 = "callResult == YES";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      BOOL v20 = "";
      __int16 v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v23 = 1024;
      int v24 = 205;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    uint64_t v9 = 0;
  }
  return v9;
}

- (unint64_t)machAbsoluteFromgPTPTime:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  unint64_t v22 = -1;
  int v9 = 1;
  id v4 = a3;
  v23[0] = [v4 seconds];
  unsigned int v5 = [v4 nanoseconds];

  v23[1] = v5;
  uint64_t v6 = [(_TSF_TSDKernelClock *)self connection];
  int v7 = [v6 callMethodWithSelector:36 scalarInputs:v23 scalarInputCount:2 scalarOutputs:&v22 scalarOutputCount:&v9 error:0];

  if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v11 = "callResult == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    __int16 v17 = "";
    __int16 v18 = 2080;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v20 = 1024;
    int v21 = 234;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7) {
    return v22;
  }
  else {
    return -1;
  }
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = -1;
  uint64_t v25 = -1;
  uint64_t v26 = -1;
  unint64_t v27 = -1;
  uint64_t v28 = 0xFFFFLL;
  int v12 = 4;
  v29[0] = a3;
  v8 = [(_TSF_TSDKernelClock *)self connection];
  char v9 = [v8 callMethodWithSelector:35 scalarInputs:v29 scalarInputCount:1 scalarOutputs:&v25 scalarOutputCount:&v12 error:0];

  if (v9)
  {
    unint64_t v10 = v25;
    uint64_t v7 = v26;
    if (a4) {
      *a4 = v27;
    }
    if (a5) {
      *a5 = v28;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v14 = "callResult == YES";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = "";
      __int16 v21 = 2080;
      unint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v23 = 1024;
      int v24 = 254;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    unint64_t v10 = -1;
  }
  unint64_t v11 = v7;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = -1;
  uint64_t v24 = -1;
  unint64_t v25 = -1;
  uint64_t v26 = 0xFFFFLL;
  int v11 = 3;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v27 = a3;
  v8 = [(_TSF_TSDKernelClock *)self connection];
  char v9 = [v8 callMethodWithSelector:34 scalarInputs:&v27 scalarInputCount:2 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if (v9)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    __int16 v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 285;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = -1;
  uint64_t v24 = -1;
  unint64_t v25 = -1;
  uint64_t v26 = 0;
  int v11 = 3;
  v27[0] = a3;
  v8 = [(_TSF_TSDKernelClock *)self connection];
  char v9 = [v8 callMethodWithSelector:38 scalarInputs:v27 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if (v9)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    __int16 v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 314;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = -1;
  uint64_t v24 = -1;
  unint64_t v25 = -1;
  uint64_t v26 = 0xFFFFLL;
  int v11 = 3;
  v27[0] = a3;
  v8 = [(_TSF_TSDKernelClock *)self connection];
  char v9 = [v8 callMethodWithSelector:39 scalarInputs:v27 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if (v9)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    __int16 v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 343;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int64x2_t v31 = vdupq_n_s64(1uLL);
  unint64_t v32 = -1;
  unint64_t v33 = -1;
  unint64_t v34 = -1;
  uint64_t v35 = 0xFFFFLL;
  int v18 = 6;
  uint64_t v15 = [(_TSF_TSDKernelClock *)self connection];
  char v16 = [v15 callMethodWithSelector:40 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v31 scalarOutputCount:&v18 error:0];

  if (v16)
  {
    if (a3) {
      *a3 = v31.i64[0];
    }
    if (a4) {
      *a4 = v31.u64[1];
    }
    if (a5) {
      *a5 = v32;
    }
    if (a6) {
      *a6 = v33;
    }
    if (a7) {
      *a7 = v34;
    }
    if (a8) {
      *a8 = v35;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v20 = "result == YES";
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    __int16 v23 = 2048;
    uint64_t v24 = 0;
    __int16 v25 = 2080;
    uint64_t v26 = "";
    __int16 v27 = 2080;
    uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v29 = 1024;
    int v30 = 369;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v16;
}

- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  int v6 = 1;
  unint64_t v19 = -1;
  v20[0] = a3;
  v3 = [(_TSF_TSDKernelClock *)self connection];
  int v4 = [v3 callMethodWithSelector:43 scalarInputs:v20 scalarInputCount:1 scalarOutputs:&v19 scalarOutputCount:&v6 error:0];

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = "";
    __int16 v15 = 2080;
    char v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v17 = 1024;
    int v18 = 420;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4) {
    return v19;
  }
  else {
    return -1;
  }
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a5 < 0xC)
  {
    uint64_t v19 = 0;
    BOOL v20 = 1;
    if (!a5) {
      return v20;
    }
    goto LABEL_13;
  }
  uint64_t v9 = 0;
  unsigned int v25 = 12 * ((a5 - 12) / 0xC);
  char v26 = 1;
  uint64_t v10 = a3;
  do
  {
    uint64_t v11 = 0;
    int v27 = 12;
    uint64_t v12 = v10;
    do
    {
      long long v13 = *(_OWORD *)v12;
      v12 += 4;
      *(void *)&long long v14 = v13;
      *((void *)&v14 + 1) = DWORD1(v13);
      long long v15 = v14;
      *(void *)&long long v14 = DWORD2(v13);
      *((void *)&v14 + 1) = HIDWORD(v13);
      char v16 = &v40[v11];
      _OWORD *v16 = v15;
      v16[1] = v14;
      v11 += 4;
    }
    while (v11 != 12);
    __int16 v17 = [(_TSF_TSDKernelClock *)self connection];
    char v18 = [v17 callMethodWithSelector:44 scalarInputs:v40 scalarInputCount:12 scalarOutputs:&a4[v9] scalarOutputCount:&v27 error:0];

    if ((v18 & 1) == 0)
    {
      char v26 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v29 = "callResult == YES";
        __int16 v30 = 2048;
        uint64_t v31 = 0;
        __int16 v32 = 2048;
        uint64_t v33 = 0;
        __int16 v34 = 2080;
        uint64_t v35 = "";
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
        __int16 v38 = 1024;
        int v39 = 448;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        char v26 = 0;
      }
    }
    uint64_t v5 = (v5 - 12);
    v9 += 12;
    v10 += 12;
  }
  while (v5 > 0xB);
  BOOL v20 = v26;
  uint64_t v19 = v25 + 12;
  if (v5)
  {
LABEL_13:
    uint64_t v21 = 0;
    int v27 = v5;
    do
    {
      v40[v21] = a3[v19 + v21];
      ++v21;
    }
    while (v5 != v21);
    uint64_t v22 = [(_TSF_TSDKernelClock *)self connection];
    char v23 = [v22 callMethodWithSelector:44 scalarInputs:v40 scalarInputCount:v5 scalarOutputs:&a4[v19] scalarOutputCount:&v27 error:0];

    if ((v23 & 1) == 0)
    {
      BOOL v20 = 0;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v29 = "callResult == YES";
        __int16 v30 = 2048;
        uint64_t v31 = 0;
        __int16 v32 = 2048;
        uint64_t v33 = 0;
        __int16 v34 = 2080;
        uint64_t v35 = "";
        __int16 v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
        __int16 v38 = 1024;
        int v39 = 468;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v20;
}

- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = -1;
  uint64_t v26 = -1;
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  uint64_t v27 = -1;
  int v12 = 5;
  v30[0] = a3;
  v3 = [(_TSF_TSDKernelClock *)self connection];
  char v4 = [v3 callMethodWithSelector:48 scalarInputs:v30 scalarInputCount:1 scalarOutputs:&v25 scalarOutputCount:&v12 error:0];

  if (v4)
  {
    uint64_t v5 = v29 & 1;
    uint64_t v6 = (v29 >> 1) & 1;
    unsigned int v7 = (v29 >> 2) & 1;
    v8 = [TSgPTPTime alloc];
    LOBYTE(v11) = v7;
    uint64_t v9 = [(TSgPTPTime *)v8 initWithSeconds:v25 nanoseconds:v26 onGrandmaster:v27 withLocalPortNumber:(unsigned __int16)v28 ptpTimescale:v5 timeTraceable:v6 frequencyTraceable:v11];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      long long v14 = "callResult == YES";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      BOOL v20 = "";
      __int16 v21 = 2080;
      uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v23 = 1024;
      int v24 = 489;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    uint64_t v9 = 0;
  }
  return v9;
}

- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  unint64_t v22 = -1;
  int v9 = 1;
  id v4 = a3;
  v23[0] = [v4 seconds];
  unsigned int v5 = [v4 nanoseconds];

  v23[1] = v5;
  uint64_t v6 = [(_TSF_TSDKernelClock *)self connection];
  int v7 = [v6 callMethodWithSelector:47 scalarInputs:v23 scalarInputCount:2 scalarOutputs:&v22 scalarOutputCount:&v9 error:0];

  if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v11 = "callResult == YES";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    __int16 v17 = "";
    __int16 v18 = 2080;
    __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v20 = 1024;
    int v21 = 518;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7) {
    return v22;
  }
  else {
    return -1;
  }
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = -1;
  uint64_t v25 = -1;
  uint64_t v26 = -1;
  unint64_t v27 = -1;
  uint64_t v28 = 0xFFFFLL;
  int v12 = 4;
  v29[0] = a3;
  v8 = [(_TSF_TSDKernelClock *)self connection];
  char v9 = [v8 callMethodWithSelector:46 scalarInputs:v29 scalarInputCount:1 scalarOutputs:&v25 scalarOutputCount:&v12 error:0];

  if (v9)
  {
    unint64_t v10 = v25;
    uint64_t v7 = v26;
    if (a4) {
      *a4 = v27;
    }
    if (a5) {
      *a5 = v28;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v14 = "callResult == YES";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = "";
      __int16 v21 = 2080;
      unint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v23 = 1024;
      int v24 = 538;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    unint64_t v10 = -1;
  }
  unint64_t v11 = v7;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = -1;
  uint64_t v24 = -1;
  unint64_t v25 = -1;
  uint64_t v26 = 0xFFFFLL;
  int v11 = 3;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v27 = a3;
  v8 = [(_TSF_TSDKernelClock *)self connection];
  char v9 = [v8 callMethodWithSelector:45 scalarInputs:&v27 scalarInputCount:2 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if (v9)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    __int16 v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 569;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = -1;
  uint64_t v24 = -1;
  unint64_t v25 = -1;
  uint64_t v26 = 0;
  int v11 = 3;
  v27[0] = a3;
  v8 = [(_TSF_TSDKernelClock *)self connection];
  char v9 = [v8 callMethodWithSelector:49 scalarInputs:v27 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if (v9)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    __int16 v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 598;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = -1;
  uint64_t v24 = -1;
  unint64_t v25 = -1;
  uint64_t v26 = 0xFFFFLL;
  int v11 = 3;
  v27[0] = a3;
  v8 = [(_TSF_TSDKernelClock *)self connection];
  char v9 = [v8 callMethodWithSelector:50 scalarInputs:v27 scalarInputCount:1 scalarOutputs:&v24 scalarOutputCount:&v11 error:0];

  if (v9)
  {
    unint64_t v7 = v24;
    if (a4) {
      *a4 = v25;
    }
    if (a5) {
      *a5 = v26;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v13 = "callResult == YES";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    __int16 v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v22 = 1024;
    int v23 = 627;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int64x2_t v31 = vdupq_n_s64(1uLL);
  unint64_t v32 = -1;
  unint64_t v33 = -1;
  unint64_t v34 = -1;
  uint64_t v35 = 0xFFFFLL;
  int v18 = 6;
  uint64_t v15 = [(_TSF_TSDKernelClock *)self connection];
  char v16 = [v15 callMethodWithSelector:51 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v31 scalarOutputCount:&v18 error:0];

  if (v16)
  {
    if (a3) {
      *a3 = v31.i64[0];
    }
    if (a4) {
      *a4 = v31.u64[1];
    }
    if (a5) {
      *a5 = v32;
    }
    if (a6) {
      *a6 = v33;
    }
    if (a7) {
      *a7 = v34;
    }
    if (a8) {
      *a8 = v35;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v20 = "result == YES";
    __int16 v21 = 2048;
    uint64_t v22 = 0;
    __int16 v23 = 2048;
    uint64_t v24 = 0;
    __int16 v25 = 2080;
    uint64_t v26 = "";
    __int16 v27 = 2080;
    uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v29 = 1024;
    int v30 = 653;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v16;
}

- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)_TSF_TSDgPTPClock;
  [(_TSF_TSDKernelClock *)&v25 _handleInterestNotification:*(void *)&a3 withArgument:a4];
  if (a3 == -536870608)
  {
    uint64_t v6 = [(_TSF_TSDKernelClock *)self propertyUpdateQueue];
    if (!v6)
    {
      uint64_t v6 = [(_TSF_TSDKernelClock *)self notificationQueue];
    }
    unint64_t v7 = [(_TSF_TSDgPTPClock *)self _grandmasterIdentity];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62___TSF_TSDgPTPClock__handleInterestNotification_withArgument___block_invoke;
    block[3] = &unk_1E622AB70;
    block[4] = self;
    block[5] = v7;
    dispatch_async(v6, block);
    v8 = [(_TSF_TSDgPTPClock *)self _gptpPath];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62___TSF_TSDgPTPClock__handleInterestNotification_withArgument___block_invoke_2;
    v21[3] = &unk_1E622AAB0;
    id v9 = v8;
    id v22 = v9;
    __int16 v23 = self;
    dispatch_async(v6, v21);
    p_implClocksLock = &self->_implClocksLock;
    os_unfair_lock_lock(&self->_implClocksLock);
    [(NSPointerArray *)self->_implClocks compact];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v11 = self->_implClocks;
    uint64_t v12 = [(NSPointerArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          char v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_1F145A220, (void)v17)) {
            [v16 updateGrandmasterIdentity:v7 andgPTPPath:v9];
          }
        }
        uint64_t v13 = [(NSPointerArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v13);
    }

    os_unfair_lock_unlock(p_implClocksLock);
  }
}

- (void)_refreshGrandmasterIdentityOnNotificationQueue
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(_TSF_TSDgPTPClock *)self _grandmasterIdentity];
  id v4 = [(_TSF_TSDgPTPClock *)self _gptpPath];
  uint64_t v5 = [(_TSF_TSDKernelClock *)self propertyUpdateQueue];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = (void *)v5;
  unint64_t v7 = [(_TSF_TSDKernelClock *)self propertyUpdateQueue];
  v8 = [(_TSF_TSDKernelClock *)self notificationQueue];

  if (v7 == v8)
  {
LABEL_4:
    if (v3 != [(_TSF_TSDgPTPClock *)self grandmasterIdentity]) {
      [(_TSF_TSDgPTPClock *)self setGrandmasterIdentity:v3];
    }
    unint64_t v10 = [(_TSF_TSDgPTPClock *)self gptpPath];
    char v11 = [v4 isEqual:v10];

    if ((v11 & 1) == 0) {
      [(_TSF_TSDgPTPClock *)self setGptpPath:v4];
    }
  }
  else
  {
    id v9 = [(_TSF_TSDKernelClock *)self propertyUpdateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67___TSF_TSDgPTPClock__refreshGrandmasterIdentityOnNotificationQueue__block_invoke;
    block[3] = &unk_1E622AC38;
    unint64_t v25 = v3;
    block[4] = self;
    id v24 = v4;
    dispatch_sync(v9, block);
  }
  p_implClocksLock = &self->_implClocksLock;
  os_unfair_lock_lock(&self->_implClocksLock);
  [(NSPointerArray *)self->_implClocks compact];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = self->_implClocks;
  uint64_t v14 = [(NSPointerArray *)v13 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v18, "conformsToProtocol:", &unk_1F145A220, (void)v19)) {
          [v18 updateGrandmasterIdentity:v3 andgPTPPath:v4];
        }
      }
      uint64_t v15 = [(NSPointerArray *)v13 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_implClocksLock);
}

- (void)_handleRefreshConnection
{
  v3.receiver = self;
  v3.super_class = (Class)_TSF_TSDgPTPClock;
  [(_TSF_TSDKernelClock *)&v3 _handleRefreshConnection];
  [(_TSF_TSDgPTPClock *)self _refreshGrandmasterIdentityOnNotificationQueue];
}

- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (a3 == 2004) {
    [(_TSF_TSDgPTPClock *)self _refreshGrandmasterIdentityOnNotificationQueue];
  }
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPClock;
  [(_TSF_TSDKernelClock *)&v9 _handleNotification:v7 withArg1:a4 andArg2:a5];
}

- (unint64_t)_grandmasterIdentity
{
  v2 = [(_TSF_TSDKernelClock *)self service];
  objc_super v3 = [v2 iodPropertyForKey:@"GrandmasterID"];

  if (v3) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (id)_gptpPath
{
  v2 = [(_TSF_TSDKernelClock *)self service];
  objc_super v3 = [v2 iodPropertyForKey:@"ASPath"];

  if (v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)clockIdentity
{
  v2 = [(_TSF_TSDKernelClock *)self service];
  objc_super v3 = [v2 iodPropertyForKey:@"ClockIdentity"];

  if (v3) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = -1;
  }

  return v4;
}

- (unsigned)clockPriority1
{
  v2 = [(_TSF_TSDKernelClock *)self service];
  objc_super v3 = [v2 iodPropertyForKey:@"ClockPriority1"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)clockPriority2
{
  v2 = [(_TSF_TSDKernelClock *)self service];
  objc_super v3 = [v2 iodPropertyForKey:@"ClockPriority2"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)clockClass
{
  v2 = [(_TSF_TSDKernelClock *)self service];
  objc_super v3 = [v2 iodPropertyForKey:@"ClockClass"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (unsigned)clockAccuracy
{
  v2 = [(_TSF_TSDKernelClock *)self service];
  objc_super v3 = [v2 iodPropertyForKey:@"ClockAccuracy"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v27[0] = 0;
  int v14 = 1;
  v8 = [a3 dataUsingEncoding:4];
  objc_super v9 = [(_TSF_TSDKernelClock *)self connection];
  id v10 = v8;
  char v11 = objc_msgSend(v9, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 18, 0, 0, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), v27, &v14, a5);

  if (v11)
  {
    if (a4)
    {
      unsigned __int16 v12 = v27[0];
LABEL_4:
      *a4 = v12;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v16 = "result == YES";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      long long v22 = "";
      __int16 v23 = 2080;
      id v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v25 = 1024;
      int v26 = 982;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a4)
    {
      unsigned __int16 v12 = -1;
      goto LABEL_4;
    }
  }

  return v11;
}

- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 dataUsingEncoding:4];
  uint64_t v7 = [(_TSF_TSDKernelClock *)self connection];
  id v8 = v6;
  char v9 = objc_msgSend(v7, "callMethodWithSelector:structInput:structInputSize:error:", 19, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), a4);

  if ((v9 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136316418;
    unsigned __int16 v12 = "result == YES";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2048;
    uint64_t v16 = 0;
    __int16 v17 = 2080;
    uint64_t v18 = "";
    __int16 v19 = 2080;
    uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v21 = 1024;
    int v22 = 1009;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
  }

  return v9;
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v32[0] = 0;
  int v18 = 1;
  unsigned int v19 = a4;
  char v9 = (void *)MEMORY[0x1E4F1CA58];
  id v10 = a3;
  int v11 = [v9 dataWithBytes:&v19 length:4];
  unsigned __int16 v12 = [v10 dataUsingEncoding:4];

  [v11 appendData:v12];
  __int16 v13 = [(_TSF_TSDKernelClock *)self connection];
  id v14 = v11;
  char v15 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 20, 0, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), v32, &v18, a6);

  if (v15)
  {
    if (a5)
    {
      unsigned __int16 v16 = v32[0];
LABEL_4:
      *a5 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v21 = "result == YES";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      uint64_t v27 = "";
      __int16 v28 = 2080;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v30 = 1024;
      int v31 = 1025;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      unsigned __int16 v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v15 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA58];
  id v8 = a3;
  char v9 = [v7 dataWithBytes:&v15 length:4];
  id v10 = [v8 dataUsingEncoding:4];

  [v9 appendData:v10];
  int v11 = [(_TSF_TSDKernelClock *)self connection];
  id v12 = v9;
  char v13 = objc_msgSend(v11, "callMethodWithSelector:structInput:structInputSize:error:", 21, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a5);

  if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v17 = "result == YES";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = "";
    __int16 v24 = 2080;
    uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v26 = 1024;
    int v27 = 1053;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v32[0] = 0;
  int v19 = 1;
  id v10 = (void *)MEMORY[0x1E4F1CA58];
  id v11 = a3;
  id v12 = [v10 dataWithBytes:a4 length:16];
  char v13 = [v11 dataUsingEncoding:4];

  [v12 appendData:v13];
  id v14 = [(_TSF_TSDKernelClock *)self connection];
  id v15 = v12;
  char v16 = objc_msgSend(v14, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 22, 0, 0, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v32, &v19, a6);

  if (v16)
  {
    if (a5)
    {
      unsigned __int16 v17 = v32[0];
LABEL_4:
      *a5 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "result == YES";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      int v27 = "";
      __int16 v28 = 2080;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v30 = 1024;
      int v31 = 1070;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      unsigned __int16 v17 = -1;
      goto LABEL_4;
    }
  }

  return v16;
}

- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F1CA58];
  id v9 = a3;
  id v10 = [v8 dataWithBytes:a4 length:16];
  id v11 = [v9 dataUsingEncoding:4];

  [v10 appendData:v11];
  id v12 = [(_TSF_TSDKernelClock *)self connection];
  id v13 = v10;
  char v14 = objc_msgSend(v12, "callMethodWithSelector:structInput:structInputSize:error:", 23, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), a5);

  if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316418;
    unsigned __int16 v17 = "result == YES";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = "";
    __int16 v24 = 2080;
    uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v26 = 1024;
    int v27 = 1098;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }

  return v14;
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v32[0] = 0;
  int v19 = 1;
  id v10 = (void *)MEMORY[0x1E4F1CA58];
  id v11 = a3;
  id v12 = [v10 dataWithBytes:a4 length:6];
  id v13 = [v11 dataUsingEncoding:4];

  [v12 appendData:v13];
  char v14 = [(_TSF_TSDKernelClock *)self connection];
  id v15 = v12;
  char v16 = objc_msgSend(v14, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 24, 0, 0, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v32, &v19, a6);

  if (v16)
  {
    if (a5)
    {
      unsigned __int16 v17 = v32[0];
LABEL_4:
      *a5 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "result == YES";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      int v27 = "";
      __int16 v28 = 2080;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v30 = 1024;
      int v31 = 1114;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      unsigned __int16 v17 = -1;
      goto LABEL_4;
    }
  }

  return v16;
}

- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F1CA58];
  id v9 = a3;
  id v10 = [v8 dataWithBytes:a4 length:6];
  id v11 = [v9 dataUsingEncoding:4];

  [v10 appendData:v11];
  id v12 = [(_TSF_TSDKernelClock *)self connection];
  id v13 = v10;
  char v14 = objc_msgSend(v12, "callMethodWithSelector:structInput:structInputSize:error:", 25, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), a5);

  if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316418;
    unsigned __int16 v17 = "result == YES";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = "";
    __int16 v24 = 2080;
    uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v26 = 1024;
    int v27 = 1142;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }

  return v14;
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v32[0] = 0;
  int v18 = 1;
  unsigned int v19 = a4;
  id v9 = (void *)MEMORY[0x1E4F1CA58];
  id v10 = a3;
  id v11 = [v9 dataWithBytes:&v19 length:4];
  id v12 = [v10 dataUsingEncoding:4];

  [v11 appendData:v12];
  id v13 = [(_TSF_TSDKernelClock *)self connection];
  id v14 = v11;
  char v15 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 26, 0, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), v32, &v18, a6);

  if (v15)
  {
    if (a5)
    {
      unsigned __int16 v16 = v32[0];
LABEL_4:
      *a5 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "result == YES";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      int v27 = "";
      __int16 v28 = 2080;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v30 = 1024;
      int v31 = 1158;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      unsigned __int16 v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int v15 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA58];
  id v8 = a3;
  id v9 = [v7 dataWithBytes:&v15 length:4];
  id v10 = [v8 dataUsingEncoding:4];

  [v9 appendData:v10];
  id v11 = [(_TSF_TSDKernelClock *)self connection];
  id v12 = v9;
  char v13 = objc_msgSend(v11, "callMethodWithSelector:structInput:structInputSize:error:", 27, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a5);

  if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    unsigned __int16 v17 = "result == YES";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = "";
    __int16 v24 = 2080;
    uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v26 = 1024;
    int v27 = 1186;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v32[0] = 0;
  int v19 = 1;
  id v10 = (void *)MEMORY[0x1E4F1CA58];
  id v11 = a3;
  id v12 = [v10 dataWithBytes:a4 length:16];
  char v13 = [v11 dataUsingEncoding:4];

  [v12 appendData:v13];
  id v14 = [(_TSF_TSDKernelClock *)self connection];
  id v15 = v12;
  char v16 = objc_msgSend(v14, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 28, 0, 0, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v32, &v19, a6);

  if (v16)
  {
    if (a5)
    {
      unsigned __int16 v17 = v32[0];
LABEL_4:
      *a5 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "result == YES";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      int v27 = "";
      __int16 v28 = 2080;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v30 = 1024;
      int v31 = 1202;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      unsigned __int16 v17 = -1;
      goto LABEL_4;
    }
  }

  return v16;
}

- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F1CA58];
  id v9 = a3;
  id v10 = [v8 dataWithBytes:a4 length:16];
  id v11 = [v9 dataUsingEncoding:4];

  [v10 appendData:v11];
  id v12 = [(_TSF_TSDKernelClock *)self connection];
  id v13 = v10;
  char v14 = objc_msgSend(v12, "callMethodWithSelector:structInput:structInputSize:error:", 29, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), a5);

  if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316418;
    unsigned __int16 v17 = "result == YES";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = "";
    __int16 v24 = 2080;
    uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v26 = 1024;
    int v27 = 1230;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }

  return v14;
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v32[0] = 0;
  int v19 = 1;
  id v10 = (void *)MEMORY[0x1E4F1CA58];
  id v11 = a3;
  id v12 = [v10 dataWithBytes:a4 length:6];
  id v13 = [v11 dataUsingEncoding:4];

  [v12 appendData:v13];
  char v14 = [(_TSF_TSDKernelClock *)self connection];
  id v15 = v12;
  char v16 = objc_msgSend(v14, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 30, 0, 0, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v32, &v19, a6);

  if (v16)
  {
    if (a5)
    {
      unsigned __int16 v17 = v32[0];
LABEL_4:
      *a5 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = "result == YES";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      int v27 = "";
      __int16 v28 = 2080;
      __int16 v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      __int16 v30 = 1024;
      int v31 = 1246;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      unsigned __int16 v17 = -1;
      goto LABEL_4;
    }
  }

  return v16;
}

- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F1CA58];
  id v9 = a3;
  id v10 = [v8 dataWithBytes:a4 length:6];
  id v11 = [v9 dataUsingEncoding:4];

  [v10 appendData:v11];
  id v12 = [(_TSF_TSDKernelClock *)self connection];
  id v13 = v10;
  char v14 = objc_msgSend(v12, "callMethodWithSelector:structInput:structInputSize:error:", 31, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), a5);

  if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316418;
    unsigned __int16 v17 = "result == YES";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    uint64_t v23 = "";
    __int16 v24 = 2080;
    uint64_t v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v26 = 1024;
    int v27 = 1274;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }

  return v14;
}

- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v26[0] = a4;
  v26[1] = a5;
  int v13 = 0;
  id v8 = [a3 dataUsingEncoding:4];
  id v9 = [(_TSF_TSDKernelClock *)self connection];
  id v10 = v8;
  char v11 = objc_msgSend(v9, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 41, v26, 2, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0, &v13, a6);

  if ((v11 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v15 = "result == YES";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    uint64_t v21 = "";
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v24 = 1024;
    int v25 = 1293;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v11;
}

- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v25[0] = a4;
  int v12 = 0;
  uint64_t v7 = [a3 dataUsingEncoding:4];
  id v8 = [(_TSF_TSDKernelClock *)self connection];
  id v9 = v7;
  char v10 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 42, v25, 1, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 0, &v12, a5);

  if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    char v14 = "result == YES";
    __int16 v15 = 2048;
    uint64_t v16 = 0;
    __int16 v17 = 2048;
    uint64_t v18 = 0;
    __int16 v19 = 2080;
    __int16 v20 = "";
    __int16 v21 = 2080;
    __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v23 = 1024;
    int v24 = 1311;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v10;
}

- (BOOL)getSyncInfoWithSyncInfoValid:(BOOL *)a3 syncFlags:(char *)a4 timeSyncTime:(unint64_t *)a5 domainTimeHi:(unint64_t *)a6 domainTimeLo:(unint64_t *)a7 cumulativeScaledRate:(unint64_t *)a8 inverseCumulativeScaledRate:(unint64_t *)a9 grandmasterID:(unint64_t *)a10 localPortNumber:(unsigned __int16 *)a11 error:(id *)a12
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  unint64_t v34 = -1;
  unint64_t v35 = -1;
  unint64_t v36 = -1;
  int64x2_t v37 = vdupq_n_s64(1uLL);
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  unint64_t v38 = -1;
  uint64_t v41 = 0xFFFFLL;
  int v21 = 9;
  uint64_t v18 = [(_TSF_TSDKernelClock *)self connection];
  char v19 = [v18 callMethodWithSelector:52 scalarInputs:0 scalarInputCount:0 scalarOutputs:&v34 scalarOutputCount:&v21 error:a12];

  if ((v19 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v23 = "result == YES";
    __int16 v24 = 2048;
    uint64_t v25 = 0;
    __int16 v26 = 2048;
    uint64_t v27 = 0;
    __int16 v28 = 2080;
    __int16 v29 = "";
    __int16 v30 = 2080;
    int v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    __int16 v32 = 1024;
    int v33 = 1324;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (a5) {
    *a5 = v34;
  }
  if (a6) {
    *a6 = v35;
  }
  if (a7) {
    *a7 = v36;
  }
  if (a8) {
    *a8 = v37.i64[0];
  }
  if (a9) {
    *a9 = v37.u64[1];
  }
  if (a10) {
    *a10 = v38;
  }
  if (a3) {
    *a3 = v39 != 0;
  }
  if (a4) {
    *a4 = v40;
  }
  if (a11) {
    *a11 = v41;
  }
  return v19;
}

- (id)clockName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"gPTP Domain with Clock Identifier 0x%016llx", -[_TSF_TSDKernelClock clockIdentifier](self, "clockIdentifier"));
}

- (NSArray)ports
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  unsigned __int8 v4 = [(_TSF_TSDKernelClock *)self service];
  uint64_t v5 = [v4 childIteratorInServicePlaneWithError:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26___TSF_TSDgPTPClock_ports__block_invoke;
  v8[3] = &unk_1E622AB20;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateWithBlock:v8];

  return (NSArray *)v6;
}

- (id)portWithPortNumber:(unsigned __int16)a3
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x3032000000;
  int v13 = __Block_byref_object_copy__1;
  char v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  unsigned __int8 v4 = [(_TSF_TSDKernelClock *)self service];
  uint64_t v5 = [v4 childIteratorInServicePlaneWithError:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40___TSF_TSDgPTPClock_portWithPortNumber___block_invoke;
  v8[3] = &unk_1E622B3B0;
  unsigned __int16 v9 = a3;
  void v8[4] = &v10;
  [v5 enumerateWithBlock:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)getMetrics
{
  v2 = [[_TSF_TSDClockMetrics alloc] initWithClock:self];
  return v2;
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_TSF_TSDgPTPClock *)self getMetrics];
  id v6 = [v5 getDelta:v4];

  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_TSF_TSDgPTPClock;
  [(_TSF_TSDgPTPClock *)&v2 dealloc];
}

+ (id)diagnosticInfoForService:(id)a3
{
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPClock;
  id v3 = a3;
  id v4 = objc_msgSendSuper2(&v11, sel_diagnosticInfoForService_, v3);
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = [v3 childIteratorInServicePlaneWithError:0];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __46___TSF_TSDgPTPClock_diagnosticInfoForService___block_invoke;
  v9[3] = &unk_1E622AB20;
  id v10 = v5;
  id v7 = v5;
  [v6 enumerateWithBlock:v9];
  [v4 setObject:v7 forKeyedSubscript:@"Ports"];

  return v4;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"gPTP Domain with Clock Identifier 0x%016llx", a3);
}

- (void)addImplClock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_implClocksLock);
  [(NSPointerArray *)self->_implClocks compact];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_implClocks;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * v9) == v4)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_implClocks, "addPointer:", v4, (void)v10);
LABEL_11:
  os_unfair_lock_unlock(&self->_implClocksLock);
}

- (void)removeImplClock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_implClocksLock);
  [(NSPointerArray *)self->_implClocks compact];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_implClocks;
  uint64_t v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v8 + v7;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_implClocks, "removePointerAtIndex:", v8 + v10, (void)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v8 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_implClocksLock);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gptpPath, 0);
  objc_storeStrong((id *)&self->_implClocks, 0);
}

@end