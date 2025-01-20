@interface SAThreadState
+ (SAThreadState)stateWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)stateWithKCDataDeltaThreadV2:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(void *)a11 oldThreadState:(void *)a12 waitInfo:(void *)a13 turnstileInfo:;
+ (id)stateWithKCDataDeltaThreadV3:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(void *)a11 oldThreadState:(void *)a12 waitInfo:(void *)a13 turnstileInfo:(int)a14 threadPolicyVersion:;
+ (id)stateWithKCDataThreadV2:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(uint64_t)a11 machTimebase:(void *)a12 waitInfo:(void *)a13 turnstileInfo:;
+ (id)stateWithKCDataThreadV4:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(uint64_t)a11 machTimebase:(void *)a12 waitInfo:(void *)a13 turnstileInfo:(int)a14 threadPolicyVersion:(uint64_t)a15 threadInstructionCycles:;
+ (id)stateWithoutReferencesFromPAStyleSerializedThread:(uint64_t)a1;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)filledCyclesInstructions;
- (BOOL)filledDispatchQueue;
- (BOOL)filledName;
- (BOOL)filledScheduling;
- (BOOL)filledSnapshot;
- (BOOL)filledSwiftTask;
- (BOOL)filledUserStack;
- (BOOL)hasDispatchQueue;
- (BOOL)hasSameStackAs:(id)a3;
- (BOOL)hasSwiftTask;
- (BOOL)isAbortingInterruptibleWaits;
- (BOOL)isAbortingInterruptibleWaitsAtSafePoints;
- (BOOL)isBatteryAndUserActivityValid;
- (BOOL)isDarwinBG;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHaltedAtTermination;
- (BOOL)isIOPassive;
- (BOOL)isIORecord;
- (BOOL)isIdleWorkQueue;
- (BOOL)isInterruptRecord;
- (BOOL)isMicrostackshot;
- (BOOL)isOnBattery;
- (BOOL)isPromotedAboveTask;
- (BOOL)isRunnable;
- (BOOL)isRunning;
- (BOOL)isStopped;
- (BOOL)isSuspended;
- (BOOL)isTimerArmingRecord;
- (BOOL)isUserActive;
- (BOOL)isUserMode;
- (BOOL)isWaiting;
- (BOOL)isWaitingUninterruptibly;
- (BOOL)needsExclave;
- (NSString)debugDescription;
- (NSString)name;
- (SADispatchQueue)dispatchQueue;
- (SAFrame)leafKernelFrame;
- (SAFrame)leafOfCRootFramesReplacedBySwiftAsync;
- (SAFrame)leafUserFrame;
- (SASwiftTask)swiftTask;
- (SAThreadState)init;
- (SAThreadState)initWithKCDataDeltaThreadV2:(const thread_delta_snapshot_v2 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 oldThreadState:(id)a12 waitInfo:(id)a13 turnstileInfo:(id)a14;
- (SAThreadState)initWithKCDataDeltaThreadV3:(const thread_delta_snapshot_v3 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 oldThreadState:(id)a12 waitInfo:(id)a13 turnstileInfo:(id)a14 threadPolicyVersion:(unsigned int)a15;
- (SAThreadState)initWithKCDataThreadV2:(const thread_snapshot_v2 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 machTimebase:(mach_timebase_info)a12 waitInfo:(id)a13 turnstileInfo:(id)a14;
- (SAThreadState)initWithKCDataThreadV4:(const thread_snapshot_v4 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 machTimebase:(mach_timebase_info)a12 waitInfo:(id)a13 turnstileInfo:(id)a14 threadPolicyVersion:(unsigned int)a15 threadInstructionCycles:(const instrs_cycles_snapshot *)a16;
- (SAThreadState)initWithStackshotThreadV1:(const thread_snapshot *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 leafUserFrame:(id)a8 leafOfCRootFramesReplacedBySwiftAsync:(id)a9 leafKernelFrame:(id)a10 machTimebase:(mach_timebase_info)a11;
- (SAThreadState)initWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6;
- (SATimestamp)endTimestamp;
- (SATimestamp)startTimestamp;
- (SATimestamp)timestampLastMadeRunnable;
- (SATurnstileInfo)turnstileInfo;
- (SAWaitInfo)waitInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithThread:(id *)a1;
- (id)stack;
- (id)stackIgnoringKernelStackWithLeafFrame:(id)a3;
- (id)stackWithBacktraceStyle:(unint64_t)a3;
- (id)stackWithBacktraceStyle:(unint64_t)a3 ignoringKernelStackWithLeafFrame:(id)a4;
- (int)basePriority;
- (int)onBehalfOfPid;
- (int)originPid;
- (int)proximatePid;
- (int)scheduledPriority;
- (int)setBasePriority:(int *)result;
- (int)setScheduledPriority:(int *)result;
- (uint64_t)setCpuNum:(uint64_t)result;
- (uint64_t)setEndSampleIndex:(uint64_t)result;
- (uint64_t)setStartSampleIndex:(uint64_t)result;
- (uint64_t)setThreadQos:(uint64_t)result;
- (uint64_t)setThreadQosKEventOverride:(uint64_t)result;
- (uint64_t)setThreadQosPromote:(uint64_t)result;
- (uint64_t)setThreadQosWorkQueueOverride:(uint64_t)result;
- (uint64_t)setThreadQosWorkloopServicerOverride:(uint64_t)result;
- (uint64_t)setThreadRequestedQos:(uint64_t)result;
- (uint64_t)setThreadRequestedQosOverride:(uint64_t)result;
- (unint64_t)cpuTimeNs;
- (unint64_t)cycles;
- (unint64_t)endSampleIndex;
- (unint64_t)hash;
- (unint64_t)instructions;
- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unint64_t)startSampleIndex;
- (unint64_t)systemTimeInNs;
- (unint64_t)userTimeInNs;
- (unint64_t)voucherIdentifier;
- (unsigned)cpuNum;
- (unsigned)cpuSpeedMhz;
- (unsigned)ioTier;
- (unsigned)microstackshotFlags;
- (unsigned)schedulerFlags;
- (unsigned)threadQos;
- (unsigned)threadQosIpcOverride;
- (unsigned)threadQosKEventOverride;
- (unsigned)threadQosPromote;
- (unsigned)threadQosSyncIpcOverride;
- (unsigned)threadQosWorkQueueOverride;
- (unsigned)threadQosWorkloopServicerOverride;
- (unsigned)threadRequestedQos;
- (unsigned)threadRequestedQosOverride;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)applyPAStyleSampleTimestamp:(uint64_t)a1;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
- (void)populateReferencesUsingPAStyleSerializedThread:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:;
- (void)setFilledCyclesInstructions:(BOOL)a3;
- (void)setFilledDispatchQueue:(BOOL)a3;
- (void)setFilledName:(BOOL)a3;
- (void)setFilledScheduling:(BOOL)a3;
- (void)setFilledSnapshot:(BOOL)a3;
- (void)setFilledSwiftTask:(BOOL)a3;
- (void)setFilledUserStack:(BOOL)a3;
- (void)setNeedsExclave:(BOOL)a3;
@end

@implementation SAThreadState

- (unint64_t)cpuTimeNs
{
  return self->_systemTimeInNs + self->_userTimeInNs;
}

- (SATimestamp)startTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 48, 1);
}

- (uint64_t)setEndSampleIndex:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v3 = *(_DWORD *)(result + 16) | 0x3FFFFFFF;
    }
    else
    {
      if (a2 >= 0x3FFFFFFF)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "endSampleIndex is %lu", buf, 0xCu);
        }

        *__error() = v4;
        _SASetCrashLogMessage(865, "endSampleIndex is %lu", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      int v3 = *(_DWORD *)(result + 16) & 0xC0000000 | a2;
    }
    *(_DWORD *)(result + 16) = v3;
  }
  return result;
}

- (unint64_t)endSampleIndex
{
  if ((*((_DWORD *)self + 4) & 0x3FFFFFFF) == 0x3FFFFFFF) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return *((_DWORD *)self + 4) & 0x3FFFFFFF;
  }
}

- (SAWaitInfo)waitInfo
{
  return (SAWaitInfo *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)startSampleIndex
{
  if ((*((_DWORD *)self + 3) & 0x3FFFFFFF) == 0x3FFFFFFF) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return *((_DWORD *)self + 3) & 0x3FFFFFFF;
  }
}

- (BOOL)isRunning
{
  return (*((unsigned __int8 *)self + 19) >> 6) & 1;
}

- (SATimestamp)endTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)sampleCountInSampleIndexRangeStart:(unint64_t)a3 end:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0x7FFFFFFFFFFFFFFFLL && a3 > a4)
  {
    int v19 = *__error();
    p_super = _sa_logt();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v37 = a3;
      __int16 v38 = 2048;
      unint64_t v39 = a4;
      _os_log_error_impl(&dword_1BF22B000, p_super, OS_LOG_TYPE_ERROR, "startSampleIndexCap %lu > endSampleIndexCap %lu", buf, 0x16u);
    }

    *__error() = v19;
    _SASetCrashLogMessage(1050, "startSampleIndexCap %lu > endSampleIndexCap %lu", v20, v21, v22, v23, v24, v25, a3);
    _os_crash();
    __break(1u);
    goto LABEL_29;
  }
  p_super = &self->super;
  unint64_t v9 = [(SAThreadState *)self startSampleIndex];
  uint64_t v10 = [p_super endSampleIndex];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    return v10 == 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_29:
    int v26 = *__error();
    v27 = _sa_logt();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = [p_super startSampleIndex];
      *(_DWORD *)buf = 134217984;
      unint64_t v37 = v28;
      _os_log_error_impl(&dword_1BF22B000, v27, OS_LOG_TYPE_ERROR, "endSampleIndex NSNotFound, startSampleIndex %lu", buf, 0xCu);
    }

    *__error() = v26;
    char v29 = [p_super startSampleIndex];
    _SASetCrashLogMessage(1053, "endSampleIndex NSNotFound, startSampleIndex %lu", v30, v31, v32, v33, v34, v35, v29);
    _os_crash();
    __break(1u);
  }
  unint64_t v12 = [p_super endSampleIndex];
  if (v12 >= a4) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = v12;
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v14 = v12;
  }
  else {
    unint64_t v14 = v13;
  }
  unint64_t v15 = [p_super startSampleIndex];
  if (v15 <= a3) {
    unint64_t v16 = a3;
  }
  else {
    unint64_t v16 = v15;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v16 = v15;
  }
  BOOL v17 = v14 >= v16;
  unint64_t v18 = v14 - v16;
  if (v17) {
    return v18 + 1;
  }
  else {
    return 0;
  }
}

- (SATurnstileInfo)turnstileInfo
{
  return (SATurnstileInfo *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isIdleWorkQueue
{
  return *((unsigned __int8 *)self + 15) >> 7;
}

- (id)stackIgnoringKernelStackWithLeafFrame:(id)a3
{
  return [(SAThreadState *)self stackWithBacktraceStyle:0 ignoringKernelStackWithLeafFrame:a3];
}

- (BOOL)filledName
{
  return *((unsigned __int8 *)self + 19) >> 7;
}

- (void)setFilledName:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 19) = v3 & 0x80 | *((unsigned char *)self + 19) & 0x7F;
}

- (BOOL)filledDispatchQueue
{
  return *((unsigned char *)self + 20) & 1;
}

- (void)setFilledDispatchQueue:(BOOL)a3
{
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xFE | a3;
}

- (BOOL)filledSwiftTask
{
  return (*((unsigned __int8 *)self + 20) >> 1) & 1;
}

- (void)setFilledSwiftTask:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xFD | v3;
}

- (BOOL)filledUserStack
{
  return (*((unsigned __int8 *)self + 20) >> 2) & 1;
}

- (void)setFilledUserStack:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xFB | v3;
}

- (BOOL)filledScheduling
{
  return (*((unsigned __int8 *)self + 20) >> 3) & 1;
}

- (void)setFilledScheduling:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xF7 | v3;
}

- (BOOL)filledCyclesInstructions
{
  return (*((unsigned __int8 *)self + 20) >> 4) & 1;
}

- (void)setFilledCyclesInstructions:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xEF | v3;
}

- (BOOL)filledSnapshot
{
  return (*((unsigned __int8 *)self + 20) >> 5) & 1;
}

- (void)setFilledSnapshot:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xDF | v3;
}

- (uint64_t)setStartSampleIndex:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v3 = *(_DWORD *)(result + 12) | 0x3FFFFFFF;
    }
    else
    {
      if (a2 >= 0x3FFFFFFF)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "startSampleIndex is %lu", buf, 0xCu);
        }

        *__error() = v4;
        _SASetCrashLogMessage(850, "startSampleIndex is %lu", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      int v3 = *(_DWORD *)(result + 12) & 0xC0000000 | a2;
    }
    *(_DWORD *)(result + 12) = v3;
  }
  return result;
}

- (int)onBehalfOfPid
{
  return self->_originPid;
}

- (unsigned)cpuNum
{
  return self->_cpuNum - 1;
}

- (uint64_t)setCpuNum:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == -1)
    {
      char v3 = 0;
    }
    else
    {
      if (a2 >= 0xFF)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "cpuNum is %u", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(884, "cpuNum is %u", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      char v3 = a2 + 1;
    }
    *(unsigned char *)(result + 8) = v3;
  }
  return result;
}

- (int)basePriority
{
  if (self->_basePriority == 255) {
    return -1;
  }
  else {
    return self->_basePriority;
  }
}

- (int)setBasePriority:(int *)result
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unsigned int v2 = a2;
    char v3 = result;
    if (a2 >= 0xFF)
    {
      int v4 = *__error();
      v5 = _sa_logt();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v2;
        _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "basePriority %d", (uint8_t *)v6, 8u);
      }

      result = __error();
      *result = v4;
      LOBYTE(v2) = -1;
    }
    *((unsigned char *)v3 + 9) = v2;
  }
  return result;
}

- (int)scheduledPriority
{
  if (self->_scheduledPriority == 255) {
    return -1;
  }
  else {
    return self->_scheduledPriority;
  }
}

- (int)setScheduledPriority:(int *)result
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unsigned int v2 = a2;
    char v3 = result;
    if (a2 >= 0xFF)
    {
      int v4 = *__error();
      v5 = _sa_logt();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109120;
        v6[1] = v2;
        _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "scheduledPriority %d", (uint8_t *)v6, 8u);
      }

      result = __error();
      *result = v4;
      LOBYTE(v2) = -1;
    }
    *((unsigned char *)v3 + 10) = v2;
  }
  return result;
}

- (unsigned)threadQos
{
  if ((*((unsigned char *)self + 11) & 7) == 7) {
    return 125;
  }
  else {
    return *((unsigned char *)self + 11) & 7;
  }
}

- (uint64_t)setThreadQos:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 125)
    {
      char v3 = *(unsigned char *)(result + 11) | 7;
    }
    else
    {
      if (a2 >= 7)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "threadQos %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(937, "threadQos %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      char v3 = *(unsigned char *)(result + 11) & 0xF8 | a2;
    }
    *(unsigned char *)(result + 11) = v3;
  }
  return result;
}

- (unsigned)threadRequestedQos
{
  if (((*((unsigned __int8 *)self + 11) >> 3) & 7) == 7) {
    return 125;
  }
  else {
    return (*((unsigned char *)self + 11) >> 3) & 7;
  }
}

- (uint64_t)setThreadRequestedQos:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 125)
    {
      char v3 = *(unsigned char *)(result + 11) | 0x38;
    }
    else
    {
      if (a2 >= 7)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "threadRequestedQos %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(938, "threadRequestedQos %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      char v3 = *(unsigned char *)(result + 11) & 0xC7 | (8 * (a2 & 7));
    }
    *(unsigned char *)(result + 11) = v3;
  }
  return result;
}

- (unsigned)threadRequestedQosOverride
{
  if ((*((unsigned char *)self + 21) & 7) == 7) {
    return 125;
  }
  else {
    return *((unsigned char *)self + 21) & 7;
  }
}

- (uint64_t)setThreadRequestedQosOverride:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 125)
    {
      char v3 = *(unsigned char *)(result + 21) | 7;
    }
    else
    {
      if (a2 >= 7)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "threadRequestedQosOverride %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(939, "threadRequestedQosOverride %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      char v3 = *(unsigned char *)(result + 21) & 0xF8 | a2;
    }
    *(unsigned char *)(result + 21) = v3;
  }
  return result;
}

- (unsigned)threadQosPromote
{
  if (((*((unsigned __int8 *)self + 21) >> 3) & 7) == 7) {
    return 125;
  }
  else {
    return (*((unsigned char *)self + 21) >> 3) & 7;
  }
}

- (uint64_t)setThreadQosPromote:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 125)
    {
      char v3 = *(unsigned char *)(result + 21) | 0x38;
    }
    else
    {
      if (a2 >= 7)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "threadQosPromote %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(940, "threadQosPromote %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      char v3 = *(unsigned char *)(result + 21) & 0xC7 | (8 * (a2 & 7));
    }
    *(unsigned char *)(result + 21) = v3;
  }
  return result;
}

- (unsigned)threadQosKEventOverride
{
  if ((*((unsigned char *)self + 22) & 7) == 7) {
    return 125;
  }
  else {
    return *((unsigned char *)self + 22) & 7;
  }
}

- (uint64_t)setThreadQosKEventOverride:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 125)
    {
      char v3 = *(unsigned char *)(result + 22) | 7;
    }
    else
    {
      if (a2 >= 7)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "threadQosKEventOverride %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(941, "threadQosKEventOverride %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      char v3 = *(unsigned char *)(result + 22) & 0xF8 | a2;
    }
    *(unsigned char *)(result + 22) = v3;
  }
  return result;
}

- (unsigned)threadQosWorkQueueOverride
{
  if (((*((unsigned __int8 *)self + 22) >> 3) & 7) == 7) {
    return 125;
  }
  else {
    return (*((unsigned char *)self + 22) >> 3) & 7;
  }
}

- (uint64_t)setThreadQosWorkQueueOverride:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 125)
    {
      char v3 = *(unsigned char *)(result + 22) | 0x38;
    }
    else
    {
      if (a2 >= 7)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "threadQosWorkQueueOverride %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(942, "threadQosWorkQueueOverride %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      char v3 = *(unsigned char *)(result + 22) & 0xC7 | (8 * (a2 & 7));
    }
    *(unsigned char *)(result + 22) = v3;
  }
  return result;
}

- (unsigned)threadQosWorkloopServicerOverride
{
  if ((self->_ioTier & 7) == 7) {
    return 125;
  }
  else {
    return self->_ioTier & 7;
  }
}

- (uint64_t)setThreadQosWorkloopServicerOverride:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 == 125)
    {
      char v3 = *(unsigned char *)(result + 23) | 7;
    }
    else
    {
      if (a2 >= 7)
      {
        int v4 = *__error();
        v5 = _sa_logt();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v13 = a2;
          _os_log_error_impl(&dword_1BF22B000, v5, OS_LOG_TYPE_ERROR, "threadQosWorkloopServicerOverride %d", buf, 8u);
        }

        *__error() = v4;
        _SASetCrashLogMessage(943, "threadQosWorkloopServicerOverride %d", v6, v7, v8, v9, v10, v11, a2);
        _os_crash();
        __break(1u);
      }
      char v3 = *(unsigned char *)(result + 23) & 0xF8 | a2;
    }
    *(unsigned char *)(result + 23) = v3;
  }
  return result;
}

- (BOOL)isSuspended
{
  return (*((unsigned __int8 *)self + 11) >> 6) & 1;
}

- (BOOL)isIOPassive
{
  return *((unsigned __int8 *)self + 11) >> 7;
}

- (BOOL)isDarwinBG
{
  return (*((unsigned __int8 *)self + 15) >> 6) & 1;
}

- (BOOL)isPromotedAboveTask
{
  return (self->_ioTier >> 3) & 1;
}

- (BOOL)isWaiting
{
  return self->_state & 1;
}

- (BOOL)isStopped
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (BOOL)isRunnable
{
  return (LOBYTE(self->_state) >> 2) & 1;
}

- (BOOL)isWaitingUninterruptibly
{
  return (LOBYTE(self->_state) >> 3) & 1;
}

- (BOOL)isHaltedAtTermination
{
  return (LOBYTE(self->_state) >> 4) & 1;
}

- (BOOL)isAbortingInterruptibleWaits
{
  return (LOBYTE(self->_state) >> 5) & 1;
}

- (BOOL)isAbortingInterruptibleWaitsAtSafePoints
{
  return (LOBYTE(self->_state) >> 6) & 1;
}

- (BOOL)hasDispatchQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)hasSwiftTask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swiftTask);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)isMicrostackshot
{
  return 0;
}

- (BOOL)isInterruptRecord
{
  return 0;
}

- (BOOL)isTimerArmingRecord
{
  return 0;
}

- (BOOL)isIORecord
{
  return 0;
}

- (BOOL)isUserMode
{
  return 0;
}

- (BOOL)isBatteryAndUserActivityValid
{
  return 0;
}

- (BOOL)isUserActive
{
  return 0;
}

- (BOOL)isOnBattery
{
  return 0;
}

- (unsigned)cpuSpeedMhz
{
  return 0;
}

- (unsigned)microstackshotFlags
{
  return 0;
}

- (SAThreadState)init
{
  v3.receiver = self;
  v3.super_class = (Class)SAThreadState;
  result = [(SAThreadState *)&v3 init];
  if (result) {
    *(void *)&result->_originPid = -1;
  }
  return result;
}

- (SAThreadState)initWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  unsigned int v13 = [(SAThreadState *)self init];
  uint64_t v14 = (uint64_t)v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startTimestamp, a3);
    objc_storeStrong((id *)(v14 + 56), a4);
    -[SAThreadState setStartSampleIndex:](v14, a5);
    -[SAThreadState setEndSampleIndex:](v14, a6);
    *(unsigned char *)(v14 + 21) |= 0x38u;
    *(unsigned char *)(v14 + 22) |= 0x3Fu;
    *(unsigned char *)(v14 + 23) |= 7u;
  }

  return (SAThreadState *)v14;
}

+ (SAThreadState)stateWithStartTimestamp:(id)a3 endTimestamp:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = (void *)[objc_alloc((Class)a1) initWithStartTimestamp:v11 endTimestamp:v10 startSampleIndex:a5 endSampleIndex:a6];

  return (SAThreadState *)v12;
}

- (SAThreadState)initWithKCDataThreadV4:(const thread_snapshot_v4 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 machTimebase:(mach_timebase_info)a12 waitInfo:(id)a13 turnstileInfo:(id)a14 threadPolicyVersion:(unsigned int)a15 threadInstructionCycles:(const instrs_cycles_snapshot *)a16
{
  BOOL v17 = [(SAThreadState *)self initWithKCDataThreadV2:a3 startTimestamp:a4 endTimestamp:a5 startSampleIndex:a6 endSampleIndex:a7 name:a8 leafUserFrame:a9 leafOfCRootFramesReplacedBySwiftAsync:a10 leafKernelFrame:a11 machTimebase:a12 waitInfo:a13 turnstileInfo:a14];
  if (v17)
  {
    if (a16) {
      *(instrs_cycles_snapshot *)&v17->_instructions = *a16;
    }
    switch(a15)
    {
      case 0u:
        return v17;
      case 4u:
        -[SAThreadState setThreadQosPromote:]((uint64_t)v17, (LODWORD(a3->ths_requested_policy) >> 25) & 7);
        break;
      case 5u:
        uint64_t ths_requested_policy = a3->ths_requested_policy;
        -[SAThreadState setThreadQosPromote:]((uint64_t)v17, (ths_requested_policy >> 25) & 7);
        -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v17, (ths_requested_policy >> 35) & 7);
        break;
      case 6u:
      case 7u:
        uint64_t v18 = a3->ths_requested_policy;
        unsigned int ths_effective_policy = a3->ths_effective_policy;
        -[SAThreadState setThreadQosPromote:]((uint64_t)v17, (v18 >> 25) & 7);
        -[SAThreadState setThreadQosKEventOverride:]((uint64_t)v17, (v18 >> 28) & 7);
        -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v17, BYTE4(v18) & 7);
        -[SAThreadState setThreadQosWorkloopServicerOverride:]((uint64_t)v17, (v18 >> 35) & 7);
        v17->_ioTier = v17->_ioTier & 0xF7 | (ths_effective_policy >> 21) & 8;
        break;
      default:
        SAComplainAboutUnknownThreadPolicyVersion(a15);
        break;
    }
  }
  return v17;
}

+ (id)stateWithKCDataThreadV4:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(uint64_t)a11 machTimebase:(void *)a12 waitInfo:(void *)a13 turnstileInfo:(int)a14 threadPolicyVersion:(uint64_t)a15 threadInstructionCycles:
{
  id v19 = a13;
  id v20 = a12;
  id v21 = a10;
  id v22 = a9;
  id v23 = a8;
  id v24 = a7;
  id v25 = a4;
  id v26 = a3;
  LODWORD(v29) = a14;
  v27 = (void *)[objc_alloc((Class)self) initWithKCDataThreadV4:a2 startTimestamp:v26 endTimestamp:v25 startSampleIndex:a5 endSampleIndex:a6 name:v24 leafUserFrame:v23 leafOfCRootFramesReplacedBySwiftAsync:v22 leafKernelFrame:v21 machTimebase:a11 waitInfo:v20 turnstileInfo:v19 threadPolicyVersion:v29 threadInstructionCycles:a15];

  return v27;
}

- (SAThreadState)initWithKCDataThreadV2:(const thread_snapshot_v2 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 machTimebase:(mach_timebase_info)a12 waitInfo:(id)a13 turnstileInfo:(id)a14
{
  id v17 = a4;
  id v18 = a8;
  id v35 = a9;
  id v34 = a10;
  id v33 = a11;
  id v32 = a13;
  id v31 = a14;
  id v19 = [(SAThreadState *)self initWithStartTimestamp:v17 endTimestamp:a5 startSampleIndex:a6 endSampleIndex:a7];
  uint64_t v20 = (uint64_t)v19;
  if (v19)
  {
    v19->_voucherIdentifier = a3->ths_voucher_identifier;
    if (a12.numer && a12.denom)
    {
      if (a12.numer == a12.denom)
      {
        v19->_systemTimeInNs = a3->ths_sys_time;
        uint64_t ths_user_time = a3->ths_user_time;
      }
      else
      {
        v19->_systemTimeInNs = __udivti3();
        uint64_t ths_user_time = __udivti3();
      }
    }
    else
    {
      uint64_t ths_user_time = 0;
      *(void *)(v20 + 144) = 0;
    }
    *(void *)(v20 + 136) = ths_user_time;
    *(void *)(v20 + 152) = 0;
    *(void *)(v20 + 160) = 0;
    *(_DWORD *)(v20 + 40) = a3->ths_state;
    -[SAThreadState setBasePriority:]((int *)v20, a3->ths_base_priority);
    -[SAThreadState setScheduledPriority:]((int *)v20, a3->ths_sched_priority);
    *(_DWORD *)(v20 + 36) = a3->ths_sched_flags;
    -[SAThreadState setThreadQos:](v20, a3->ths_eqos);
    -[SAThreadState setThreadRequestedQos:](v20, a3->ths_rqos);
    -[SAThreadState setThreadRequestedQosOverride:](v20, a3->ths_rqos_override);
    *(unsigned char *)(v20 + 23) &= ~8u;
    *(unsigned char *)(v20 + 24) = a3->ths_io_tier;
    if (a3->ths_last_made_runnable_time + 1 >= 2)
    {
      uint64_t v22 = +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", 0.0, 0.0, 0.0);
      id v23 = *(void **)(v20 + 168);
      *(void *)(v20 + 168) = v22;

      [*(id *)(v20 + 168) guessMissingTimesBasedOnTimestamp:v17];
    }
    objc_storeStrong((id *)(v20 + 64), a9);
    objc_storeStrong((id *)(v20 + 72), a10);
    objc_storeStrong((id *)(v20 + 80), a11);
    objc_storeStrong((id *)(v20 + 88), a13);
    objc_storeStrong((id *)(v20 + 96), a14);
    uint64_t ths_ss_flags = a3->ths_ss_flags;
    if ((ths_ss_flags & 0x40) != 0)
    {
      *(unsigned char *)(v20 + 11) |= 0x40u;
      uint64_t ths_ss_flags = a3->ths_ss_flags;
      if ((ths_ss_flags & 0x20) == 0)
      {
LABEL_12:
        if ((ths_ss_flags & 0x10) == 0) {
          goto LABEL_13;
        }
        goto LABEL_20;
      }
    }
    else if ((ths_ss_flags & 0x20) == 0)
    {
      goto LABEL_12;
    }
    *(unsigned char *)(v20 + 11) |= 0x80u;
    uint64_t ths_ss_flags = a3->ths_ss_flags;
    if ((ths_ss_flags & 0x10) == 0)
    {
LABEL_13:
      if ((ths_ss_flags & 0x1000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
LABEL_20:
    *(unsigned char *)(v20 + 15) |= 0x40u;
    uint64_t ths_ss_flags = a3->ths_ss_flags;
    if ((ths_ss_flags & 0x1000) == 0)
    {
LABEL_14:
      if ((ths_ss_flags & 0x800) == 0)
      {
LABEL_16:
        uint64_t v25 = objc_msgSend(v18, "copy", a9);
        id v26 = *(void **)(v20 + 104);
        *(void *)(v20 + 104) = v25;

        goto LABEL_17;
      }
LABEL_15:
      *(unsigned char *)(v20 + 19) |= 0x40u;
      goto LABEL_16;
    }
LABEL_21:
    *(unsigned char *)(v20 + 15) |= 0x80u;
    if ((a3->ths_ss_flags & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_17:

  return (SAThreadState *)v20;
}

+ (id)stateWithKCDataThreadV2:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(uint64_t)a11 machTimebase:(void *)a12 waitInfo:(void *)a13 turnstileInfo:
{
  id v17 = a13;
  id v18 = a12;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a4;
  id v24 = a3;
  uint64_t v25 = (void *)[objc_alloc((Class)self) initWithKCDataThreadV2:a2 startTimestamp:v24 endTimestamp:v23 startSampleIndex:a5 endSampleIndex:a6 name:v22 leafUserFrame:v21 leafOfCRootFramesReplacedBySwiftAsync:v20 leafKernelFrame:v19 machTimebase:a11 waitInfo:v18 turnstileInfo:v17];

  return v25;
}

- (SAThreadState)initWithKCDataDeltaThreadV2:(const thread_delta_snapshot_v2 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 oldThreadState:(id)a12 waitInfo:(id)a13 turnstileInfo:(id)a14
{
  id v17 = a8;
  id v32 = a9;
  id v31 = a10;
  id v30 = a11;
  id v18 = a12;
  id v29 = a13;
  id v28 = a14;
  id v19 = [(SAThreadState *)self initWithStartTimestamp:a4 endTimestamp:a5 startSampleIndex:a6 endSampleIndex:a7];
  uint64_t v20 = (uint64_t)v19;
  if (v19)
  {
    v19->_voucherIdentifier = a3->tds_voucher_identifier;
    v19->_systemTimeInNs = v18[18];
    v19->_userTimeInNs = v18[17];
    v19->_instructions = v18[19];
    v19->_cycles = v18[20];
    v19->_state = a3->tds_state;
    -[SAThreadState setBasePriority:]((int *)v19, a3->tds_base_priority);
    -[SAThreadState setScheduledPriority:]((int *)v20, a3->tds_sched_priority);
    *(_DWORD *)(v20 + 36) = a3->tds_sched_flags;
    -[SAThreadState setThreadQos:](v20, a3->tds_eqos);
    -[SAThreadState setThreadRequestedQos:](v20, a3->tds_rqos);
    -[SAThreadState setThreadRequestedQosOverride:](v20, a3->tds_rqos_override);
    *(unsigned char *)(v20 + 23) &= ~8u;
    *(unsigned char *)(v20 + 24) = a3->tds_io_tier;
    objc_storeStrong((id *)(v20 + 64), a9);
    objc_storeStrong((id *)(v20 + 72), a10);
    objc_storeStrong((id *)(v20 + 80), a11);
    objc_storeStrong((id *)(v20 + 88), a13);
    objc_storeStrong((id *)(v20 + 96), a14);
    uint64_t tds_ss_flags = a3->tds_ss_flags;
    if ((tds_ss_flags & 0x40) != 0)
    {
      *(unsigned char *)(v20 + 11) |= 0x40u;
      uint64_t tds_ss_flags = a3->tds_ss_flags;
      if ((tds_ss_flags & 0x20) == 0)
      {
LABEL_4:
        if ((tds_ss_flags & 0x10) == 0) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    else if ((tds_ss_flags & 0x20) == 0)
    {
      goto LABEL_4;
    }
    *(unsigned char *)(v20 + 11) |= 0x80u;
    uint64_t tds_ss_flags = a3->tds_ss_flags;
    if ((tds_ss_flags & 0x10) == 0)
    {
LABEL_5:
      if ((tds_ss_flags & 0x1000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
LABEL_12:
    *(unsigned char *)(v20 + 15) |= 0x40u;
    uint64_t tds_ss_flags = a3->tds_ss_flags;
    if ((tds_ss_flags & 0x1000) == 0)
    {
LABEL_6:
      if ((tds_ss_flags & 0x800) == 0)
      {
LABEL_8:
        uint64_t v22 = [v17 copy];
        id v23 = *(void **)(v20 + 104);
        *(void *)(v20 + 104) = v22;

        goto LABEL_9;
      }
LABEL_7:
      *(unsigned char *)(v20 + 19) |= 0x40u;
      goto LABEL_8;
    }
LABEL_13:
    *(unsigned char *)(v20 + 15) |= 0x80u;
    if ((a3->tds_ss_flags & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_9:

  return (SAThreadState *)v20;
}

+ (id)stateWithKCDataDeltaThreadV2:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(void *)a11 oldThreadState:(void *)a12 waitInfo:(void *)a13 turnstileInfo:
{
  id v16 = a13;
  id v17 = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a4;
  id v24 = a3;
  uint64_t v25 = (void *)[objc_alloc((Class)self) initWithKCDataDeltaThreadV2:a2 startTimestamp:v24 endTimestamp:v23 startSampleIndex:a5 endSampleIndex:a6 name:v22 leafUserFrame:v21 leafOfCRootFramesReplacedBySwiftAsync:v20 leafKernelFrame:v19 oldThreadState:v18 waitInfo:v17 turnstileInfo:v16];

  return v25;
}

- (SAThreadState)initWithKCDataDeltaThreadV3:(const thread_delta_snapshot_v3 *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 name:(id)a8 leafUserFrame:(id)a9 leafOfCRootFramesReplacedBySwiftAsync:(id)a10 leafKernelFrame:(id)a11 oldThreadState:(id)a12 waitInfo:(id)a13 turnstileInfo:(id)a14 threadPolicyVersion:(unsigned int)a15
{
  id v16 = [(SAThreadState *)self initWithKCDataDeltaThreadV2:a3 startTimestamp:a4 endTimestamp:a5 startSampleIndex:a6 endSampleIndex:a7 name:a8 leafUserFrame:a9 leafOfCRootFramesReplacedBySwiftAsync:a10 leafKernelFrame:a11 oldThreadState:a12 waitInfo:a13 turnstileInfo:a14];
  if (v16)
  {
    switch(a15)
    {
      case 0u:
        return v16;
      case 4u:
        -[SAThreadState setThreadQosPromote:]((uint64_t)v16, (LODWORD(a3->tds_requested_policy) >> 25) & 7);
        break;
      case 5u:
        uint64_t tds_requested_policy = a3->tds_requested_policy;
        -[SAThreadState setThreadQosPromote:]((uint64_t)v16, (tds_requested_policy >> 25) & 7);
        -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v16, (tds_requested_policy >> 35) & 7);
        break;
      case 6u:
      case 7u:
        uint64_t v17 = a3->tds_requested_policy;
        unsigned int tds_effective_policy = a3->tds_effective_policy;
        -[SAThreadState setThreadQosPromote:]((uint64_t)v16, (v17 >> 25) & 7);
        -[SAThreadState setThreadQosKEventOverride:]((uint64_t)v16, (v17 >> 28) & 7);
        -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v16, BYTE4(v17) & 7);
        -[SAThreadState setThreadQosWorkloopServicerOverride:]((uint64_t)v16, (v17 >> 35) & 7);
        v16->_ioTier = v16->_ioTier & 0xF7 | (tds_effective_policy >> 21) & 8;
        break;
      default:
        SAComplainAboutUnknownThreadPolicyVersion(a15);
        break;
    }
  }
  return v16;
}

+ (id)stateWithKCDataDeltaThreadV3:(void *)a3 startTimestamp:(void *)a4 endTimestamp:(uint64_t)a5 startSampleIndex:(uint64_t)a6 endSampleIndex:(void *)a7 name:(void *)a8 leafUserFrame:(void *)a9 leafOfCRootFramesReplacedBySwiftAsync:(void *)a10 leafKernelFrame:(void *)a11 oldThreadState:(void *)a12 waitInfo:(void *)a13 turnstileInfo:(int)a14 threadPolicyVersion:
{
  id v17 = a13;
  id v18 = a12;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a4;
  id v25 = a3;
  LODWORD(v28) = a14;
  id v26 = (void *)[objc_alloc((Class)self) initWithKCDataDeltaThreadV3:a2 startTimestamp:v25 endTimestamp:v24 startSampleIndex:a5 endSampleIndex:a6 name:v23 leafUserFrame:v22 leafOfCRootFramesReplacedBySwiftAsync:v21 leafKernelFrame:v20 oldThreadState:v19 waitInfo:v18 turnstileInfo:v17 threadPolicyVersion:v28];

  return v26;
}

- (SAThreadState)initWithStackshotThreadV1:(const thread_snapshot *)a3 startTimestamp:(id)a4 endTimestamp:(id)a5 startSampleIndex:(unint64_t)a6 endSampleIndex:(unint64_t)a7 leafUserFrame:(id)a8 leafOfCRootFramesReplacedBySwiftAsync:(id)a9 leafKernelFrame:(id)a10 machTimebase:(mach_timebase_info)a11
{
  id v25 = a8;
  id v24 = a9;
  id v18 = a10;
  id v19 = [(SAThreadState *)self initWithStartTimestamp:a4 endTimestamp:a5 startSampleIndex:a6 endSampleIndex:a7];
  uint64_t v20 = (uint64_t)v19;
  if (!v19) {
    goto LABEL_16;
  }
  v19->_voucherIdentifier = *(unint64_t *)((char *)&a3->var31 + 4);
  if (a11.numer && a11.denom)
  {
    if (a11.numer == a11.denom)
    {
      v19->_systemTimeInNs = *(unint64_t *)((char *)&a3->var6 + 4);
      uint64_t v21 = *(unint64_t *)((char *)&a3->var5 + 4);
    }
    else
    {
      v19->_systemTimeInNs = __udivti3();
      uint64_t v21 = __udivti3();
    }
  }
  else
  {
    uint64_t v21 = 0;
    *(void *)(v20 + 144) = 0;
  }
  *(void *)(v20 + 136) = v21;
  *(void *)(v20 + 152) = 0;
  *(void *)(v20 + 160) = 0;
  *(_DWORD *)(v20 + 40) = HIDWORD(a3->var7);
  -[SAThreadState setBasePriority:]((int *)v20, a3->var8);
  -[SAThreadState setScheduledPriority:]((int *)v20, a3->var9);
  *(_DWORD *)(v20 + 36) = a3->var10;
  -[SAThreadState setThreadQos:](v20, BYTE1(a3->var11));
  -[SAThreadState setThreadRequestedQos:](v20, BYTE2(a3->var11));
  -[SAThreadState setThreadRequestedQosOverride:](v20, HIBYTE(a3->var11));
  *(unsigned char *)(v20 + 23) &= ~8u;
  *(unsigned char *)(v20 + 24) = a3->var12;
  objc_storeStrong((id *)(v20 + 64), a8);
  objc_storeStrong((id *)(v20 + 72), a9);
  objc_storeStrong((id *)(v20 + 80), a10);
  LOBYTE(var11_low) = a3->var11;
  if ((var11_low & 0x40) == 0)
  {
    if ((a3->var11 & 0x20) == 0) {
      goto LABEL_10;
    }
LABEL_18:
    *(unsigned char *)(v20 + 11) |= 0x80u;
    LOBYTE(var11_low) = a3->var11;
    if ((var11_low & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  *(unsigned char *)(v20 + 11) |= 0x40u;
  LOBYTE(var11_low) = a3->var11;
  if ((var11_low & 0x20) != 0) {
    goto LABEL_18;
  }
LABEL_10:
  if ((var11_low & 0x10) != 0)
  {
LABEL_11:
    *(unsigned char *)(v20 + 15) |= 0x40u;
    LOBYTE(var11_low) = a3->var11;
  }
LABEL_12:
  __int16 var11_low = (char)var11_low;
  if (((char)var11_low & 0x1000) != 0)
  {
    *(unsigned char *)(v20 + 15) |= 0x80u;
    __int16 var11_low = SLOBYTE(a3->var11);
  }
  if ((var11_low & 0x800) != 0) {
    *(unsigned char *)(v20 + 19) |= 0x40u;
  }
LABEL_16:

  return (SAThreadState *)v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 48), self->_startTimestamp);
  objc_storeStrong((id *)(v4 + 56), self->_endTimestamp);
  int v5 = *(_DWORD *)(v4 + 16);
  *(_DWORD *)(v4 + 12) = *(_DWORD *)(v4 + 12) & 0xC0000000 | *((_DWORD *)self + 3) & 0x3FFFFFFF;
  *(_DWORD *)(v4 + 16) = v5 & 0xC0000000 | *((_DWORD *)self + 4) & 0x3FFFFFFF;
  objc_storeStrong((id *)(v4 + 64), self->_leafUserFrame);
  objc_storeStrong((id *)(v4 + 72), self->_leafOfCRootFramesReplacedBySwiftAsync);
  objc_storeStrong((id *)(v4 + 80), self->_leafKernelFrame);
  objc_storeStrong((id *)(v4 + 176), self->_exclavesInfo);
  objc_storeStrong((id *)(v4 + 88), self->_waitInfo);
  objc_storeStrong((id *)(v4 + 96), self->_turnstileInfo);
  uint64_t v6 = [(NSString *)self->_name copy];
  uint64_t v7 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
  objc_storeWeak((id *)(v4 + 112), WeakRetained);

  id v9 = objc_loadWeakRetained((id *)&self->_swiftTask);
  objc_storeWeak((id *)(v4 + 120), v9);

  *(void *)(v4 + 128) = self->_voucherIdentifier;
  *(_DWORD *)(v4 + 28) = self->_originPid;
  *(_DWORD *)(v4 + 32) = self->_proximatePid;
  *(void *)(v4 + 136) = self->_userTimeInNs;
  *(void *)(v4 + 144) = self->_systemTimeInNs;
  *(void *)(v4 + 152) = self->_instructions;
  *(void *)(v4 + 160) = self->_cycles;
  *(unsigned char *)(v4 + 9) = self->_basePriority;
  *(unsigned char *)(v4 + 10) = self->_scheduledPriority;
  *(_DWORD *)(v4 + 36) = self->_schedulerFlags;
  objc_storeStrong((id *)(v4 + 168), self->_timestampLastMadeRunnable);
  char v10 = *(unsigned char *)(v4 + 11) & 0xF8 | *((unsigned char *)self + 11) & 7;
  *(unsigned char *)(v4 + 11) = v10;
  char v11 = v10 & 0xC7 | (8 * ((*((unsigned char *)self + 11) >> 3) & 7));
  *(unsigned char *)(v4 + 11) = v11;
  char v12 = *(unsigned char *)(v4 + 21) & 0xF8 | *((unsigned char *)self + 21) & 7;
  *(unsigned char *)(v4 + 21) = v12;
  *(unsigned char *)(v4 + 21) = v12 & 0xC7 | *((unsigned char *)self + 21) & 0x38;
  char v13 = *(unsigned char *)(v4 + 22) & 0xF8 | *((unsigned char *)self + 22) & 7;
  *(unsigned char *)(v4 + 22) = v13;
  *(unsigned char *)(v4 + 22) = v13 & 0xC7 | *((unsigned char *)self + 22) & 0x38;
  char v14 = *(unsigned char *)(v4 + 23) & 0xF8 | self->_ioTier & 7;
  *(unsigned char *)(v4 + 23) = v14;
  *(unsigned char *)(v4 + 23) = v14 & 0xF7 | self->_ioTier & 8;
  *(unsigned char *)(v4 + 24) = self->_threadQosIpcOverride;
  char v15 = *((unsigned char *)self + 11) & 0x80 | v11 & 0x7F;
  *(unsigned char *)(v4 + 11) = v15;
  *(unsigned char *)(v4 + 11) = v15 & 0xBF | *((unsigned char *)self + 11) & 0x40;
  char v16 = *(unsigned char *)(v4 + 15) & 0xBF | (((*((unsigned char *)self + 15) & 0x40) != 0) << 6);
  *(unsigned char *)(v4 + 15) = v16;
  *(unsigned char *)(v4 + 15) = *((unsigned char *)self + 15) & 0x80 | v16 & 0x7F;
  *(unsigned char *)(v4 + 19) = *(unsigned char *)(v4 + 19) & 0xBF | *((unsigned char *)self + 19) & 0x40;
  *(_DWORD *)(v4 + 40) = self->_state;
  return (id)v4;
}

- (unint64_t)hash
{
  return (uint64_t)self->_leafKernelFrame ^ (uint64_t)self->_leafUserFrame;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SAThreadState *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
    goto LABEL_19;
  }
  if (![(SAThreadState *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v7 = 0;
    goto LABEL_19;
  }
  int v5 = v4;
  if (self->_systemTimeInNs == v5->_systemTimeInNs
    && self->_userTimeInNs == v5->_userTimeInNs
    && self->_state == v5->_state
    && self->_basePriority == v5->_basePriority
    && self->_scheduledPriority == v5->_scheduledPriority
    && self->_schedulerFlags == v5->_schedulerFlags
    && self->_voucherIdentifier == v5->_voucherIdentifier
    && self->_originPid == v5->_originPid
    && self->_proximatePid == v5->_proximatePid)
  {
    unsigned int v6 = *((unsigned __int8 *)v5 + 11) ^ *((unsigned __int8 *)self + 11);
    if ((v6 & 0x3F) == 0
      && ((*((unsigned char *)v5 + 21) ^ *((unsigned char *)self + 21)) & 7) == 0
      && ((*((unsigned char *)v5 + 22) ^ *((unsigned char *)self + 22)) & 0x3F) == 0)
    {
      id v9 = v5;
      if ((*((unsigned char *)v5 + 21) ^ *((unsigned char *)self + 21)) & 0x38 | (v5->_ioTier ^ self->_ioTier) & 7) {
        goto LABEL_21;
      }
      BOOL v7 = 0;
      if (v6 > 0x3F || self->_threadQosIpcOverride != v5->_threadQosIpcOverride) {
        goto LABEL_16;
      }
      if (((*((unsigned __int8 *)v5 + 19) ^ *((unsigned __int8 *)self + 19)) & 0x40) != 0
        || (*((unsigned __int8 *)v5 + 15) ^ *((unsigned __int8 *)self + 15)) > 0x3F
        || self->_leafUserFrame != v5->_leafUserFrame
        || self->_leafOfCRootFramesReplacedBySwiftAsync != v5->_leafOfCRootFramesReplacedBySwiftAsync
        || self->_leafKernelFrame != v5->_leafKernelFrame
        || self->_exclavesInfo != v5->_exclavesInfo)
      {
LABEL_21:
        BOOL v7 = 0;
        goto LABEL_16;
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
      id v11 = objc_loadWeakRetained((id *)&v9->_dispatchQueue);
      if (WeakRetained != v11)
      {
        BOOL v12 = 0;
LABEL_36:

        int v5 = v9;
        BOOL v7 = v12;
        goto LABEL_16;
      }
      id v13 = objc_loadWeakRetained((id *)&self->_swiftTask);
      id v14 = objc_loadWeakRetained((id *)&v9->_swiftTask);
      if (v13 != v14) {
        goto LABEL_34;
      }
      waitInfo = self->_waitInfo;
      char v16 = v9->_waitInfo;
      if (waitInfo)
      {
        if (!v16 || !-[SAWaitInfo isEqual:](waitInfo, "isEqual:")) {
          goto LABEL_34;
        }
      }
      else if (v16)
      {
        goto LABEL_34;
      }
      turnstileInfo = self->_turnstileInfo;
      id v18 = v9->_turnstileInfo;
      if (turnstileInfo)
      {
        if (v18 && -[SATurnstileInfo isEqual:](turnstileInfo, "isEqual:"))
        {
LABEL_47:
          name = self->_name;
          uint64_t v20 = v9->_name;
          BOOL v12 = ((unint64_t)name | (unint64_t)v20) == 0;
          if (name && v20) {
            BOOL v12 = -[NSString isEqualToString:](name, "isEqualToString:");
          }
          goto LABEL_35;
        }
      }
      else if (!v18)
      {
        goto LABEL_47;
      }
LABEL_34:
      BOOL v12 = 0;
LABEL_35:

      goto LABEL_36;
    }
  }
  BOOL v7 = 0;
LABEL_16:

LABEL_19:
  return v7;
}

- (id)stackWithBacktraceStyle:(unint64_t)a3 ignoringKernelStackWithLeafFrame:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = (SAFrame *)a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((a3 & 0x19) == 0 && self->_leafKernelFrame != v6)
  {
    uint64_t v18 = [(SAFrame *)v6 instruction];
    if (!v18) {
      goto LABEL_24;
    }
    id v19 = (void *)v18;
    uint64_t v20 = [(SAFrame *)v6 instruction];
    uint64_t v21 = [(SAFrame *)self->_leafKernelFrame instruction];

    if (v20 != v21)
    {
LABEL_24:
      id v22 = self->_leafKernelFrame;
      if (v22)
      {
        id v23 = v22;
        v69 = self;
        v70 = v6;
        unint64_t v72 = a3;
        while ([(SAFrame *)v23 isExclave])
        {
          if ((a3 & 0x20) != 0) {
            goto LABEL_59;
          }
          id v25 = objc_getProperty(self, v24, 176, 1);
          v27 = v25;
          if (!v25
            || (id v28 = objc_getProperty(v25, v26, 16, 1),
                uint64_t v29 = [v28 count],
                v28,
                !v29))
          {
            [v7 insertObject:v23 atIndex:0];
            goto LABEL_58;
          }
          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v31 = objc_getProperty(v27, v30, 16, 1);
          uint64_t v32 = [v31 countByEnumeratingWithState:&v73 objects:v79 count:16];
          if (!v32)
          {

LABEL_58:
            a3 = v72;
LABEL_59:
            parentFrame = v23->_parentFrame;
            goto LABEL_60;
          }
          uint64_t v34 = v32;
          v71 = v27;
          uint64_t v35 = *(void *)v74;
          do
          {
            uint64_t v36 = 0;
            do
            {
              if (*(void *)v74 != v35) {
                objc_enumerationMutation(v31);
              }
              unint64_t v37 = *(void **)(*((void *)&v73 + 1) + 8 * v36);
              if (v37) {
                id Property = objc_getProperty(*(id *)(*((void *)&v73 + 1) + 8 * v36), v33, 16, 1);
              }
              else {
                id Property = 0;
              }
              id v39 = Property;

              if (v39)
              {
                if (v37)
                {
                  uint64_t v40 = objc_getProperty(v37, v33, 16, 1);
                  if (v40)
                  {
                    v41 = v40;
                    do
                    {
                      [v7 insertObject:v41 atIndex:0];
                      v42 = (void *)v41[4];
                      v43 = v42;

                      v41 = v43;
                    }
                    while (v42);
                  }
                }
              }
              else
              {
                v45 = [SAExclaveFrame alloc];
                if (v37) {
                  id v46 = objc_getProperty(v37, v44, 8, 1);
                }
                else {
                  id v46 = 0;
                }
                id v47 = v46;
                v48 = -[SAExclaveFrame initWithExclave:](v45, v47);

                if (v48) {
                  v48[8] |= 8u;
                }
                [v7 insertObject:v48 atIndex:0];
              }
              ++v36;
            }
            while (v36 != v34);
            uint64_t v49 = [v31 countByEnumeratingWithState:&v73 objects:v79 count:16];
            uint64_t v34 = v49;
          }
          while (v49);

          self = v69;
          unsigned int v6 = v70;
          a3 = v72;
          if (v23) {
            goto LABEL_59;
          }
          parentFrame = 0;
LABEL_60:
          v51 = parentFrame;

          id v23 = v51;
          if (!v51) {
            goto LABEL_2;
          }
        }
        [v7 insertObject:v23 atIndex:0];
        goto LABEL_59;
      }
    }
  }
LABEL_2:
  if ((a3 & 2) == 0)
  {
    if ((a3 & 8) != 0 && (a3 & 0x14) != 0)
    {
      int v61 = *__error();
      v62 = _sa_logt();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v78 = a3;
        _os_log_error_impl(&dword_1BF22B000, v62, OS_LOG_TYPE_ERROR, "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx", buf, 0xCu);
      }

      *__error() = v61;
      _SASetCrashLogMessage(1719, "backtrace style specified both swift async only and prefer/only C root frames: 0x%llx", v63, v64, v65, v66, v67, v68, a3);
      _os_crash();
      __break(1u);
    }
    BOOL v8 = [(SAThreadState *)self hasSwiftTask];
    unsigned int v9 = 1;
    if ((a3 & 0x10) == 0 && v8) {
      unsigned int v9 = (self->_leafOfCRootFramesReplacedBySwiftAsync != 0) & (a3 >> 2);
    }
    BOOL v10 = (a3 & 0x18) != 0 && v8;
    id v11 = self;
    BOOL v12 = self->_leafUserFrame;
    if (v12)
    {
      id v13 = v12;
      p_isa = 0;
      while (![(SAFrame *)v13 isSwiftAsync])
      {
        if (!v10) {
          goto LABEL_18;
        }
        char v15 = v13;

        p_isa = (id *)&v15->super.isa;
LABEL_19:
        char v16 = v13->_parentFrame;
        id v17 = v16;

        id v13 = v17;
        if (!v16) {
          goto LABEL_64;
        }
      }
      if (v9)
      {

        goto LABEL_65;
      }
LABEL_18:
      [v7 insertObject:v13 atIndex:0];
      goto LABEL_19;
    }
    p_isa = 0;
LABEL_64:
    if (v9)
    {
LABEL_65:
      v52 = v11->_leafOfCRootFramesReplacedBySwiftAsync;
      if (v52)
      {
        v53 = v52;
        do
        {
          [v7 insertObject:v53 atIndex:0];
          v54 = v53->_parentFrame;
          v55 = v54;

          v53 = v55;
        }
        while (v54);
      }
    }
    if (p_isa) {
      BOOL v56 = v10;
    }
    else {
      BOOL v56 = 0;
    }
    if (v56)
    {
      id v57 = p_isa[4];
      v58 = (unsigned char *)[p_isa copyWithNewParent:v57];

      if (v58)
      {
        if (v9) {
          char v59 = 18;
        }
        else {
          char v59 = 16;
        }
        v58[8] = v59 | v58[8] & 0xED;
      }
      [v7 addObject:v58];
    }
  }

  return v7;
}

- (id)stackWithBacktraceStyle:(unint64_t)a3
{
  return [(SAThreadState *)self stackWithBacktraceStyle:a3 ignoringKernelStackWithLeafFrame:0];
}

- (id)stack
{
  return [(SAThreadState *)self stackWithBacktraceStyle:0 ignoringKernelStackWithLeafFrame:0];
}

- (BOOL)hasSameStackAs:(id)a3
{
  uint64_t v4 = a3;
  int v5 = v4;
  if (*(_OWORD *)&self->_leafUserFrame == *((_OWORD *)v4 + 4) && self->_leafKernelFrame == (SAFrame *)v4[10])
  {
    uint64_t exclavesInfo = (uint64_t)self->_exclavesInfo;
    unint64_t v9 = v5[22];
    char v6 = (exclavesInfo | v9) == 0;
    if (exclavesInfo && v9) {
      char v6 = -[SAThreadExclavesInfo matchesStack:](exclavesInfo, (void *)v9);
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)debugDescriptionWithThread:(id *)a1
{
  unsigned int v2 = a1;
  if (a1)
  {
    objc_super v3 = [a2 debugDescription];
    uint64_t v4 = (void *)[v3 mutableCopy];

    id WeakRetained = objc_loadWeakRetained(v2 + 15);
    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained(v2 + 15);
      id v7 = [v6 debugDescription];
      [v4 appendFormat:@" (%@)", v7];
    }
    id v8 = objc_loadWeakRetained(v2 + 14);

    if (v8)
    {
      id v9 = objc_loadWeakRetained(v2 + 14);
      BOOL v10 = [v9 debugDescription];
      [v4 appendFormat:@" (%@)", v10];
    }
    id v11 = v2[6];
    if (v11 == v2[7])
    {
      id v14 = [v11 debugDescription];
      [v4 appendFormat:@" at %@ sample index %lu", v14, objc_msgSend(v2, "startSampleIndex")];
    }
    else
    {
      uint64_t v12 = [v2 startSampleIndex];
      uint64_t v13 = [v2 endSampleIndex];
      id v14 = [v2[6] debugDescription];
      char v15 = [v2[7] debugDescription];
      [v4 appendFormat:@" at sample indexes %lu-%lu\nstart:%@\n  end:%@", v12, v13, v14, v15];
    }
    unsigned int v2 = (id *)[v4 copy];
  }
  return v2;
}

- (NSString)debugDescription
{
  objc_super v3 = (void *)[@"thread state" mutableCopy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swiftTask);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_swiftTask);
    id v6 = [v5 debugDescription];
    [v3 appendFormat:@" (%@)", v6];
  }
  id v7 = objc_loadWeakRetained((id *)&self->_dispatchQueue);

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_dispatchQueue);
    id v9 = [v8 debugDescription];
    [v3 appendFormat:@" (%@)", v9];
  }
  startTimestamp = self->_startTimestamp;
  endTimestamp = self->_endTimestamp;
  unint64_t v12 = [(SAThreadState *)self startSampleIndex];
  if (startTimestamp == endTimestamp)
  {
    id v14 = [(SATimestamp *)self->_startTimestamp debugDescription];
    [v3 appendFormat:@" at sample index %lu\n%@", v12, v14];
  }
  else
  {
    unint64_t v13 = [(SAThreadState *)self endSampleIndex];
    id v14 = [(SATimestamp *)self->_startTimestamp debugDescription];
    char v15 = [(SATimestamp *)self->_endTimestamp debugDescription];
    [v3 appendFormat:@" at sample indexes %lu-%lu\nstart:%@\n  end:%@", v12, v13, v14, v15];
  }
  char v16 = (void *)[v3 copy];

  return (NSString *)v16;
}

- (SAFrame)leafUserFrame
{
  return (SAFrame *)objc_getProperty(self, a2, 64, 1);
}

- (SAFrame)leafOfCRootFramesReplacedBySwiftAsync
{
  return (SAFrame *)objc_getProperty(self, a2, 72, 1);
}

- (SAFrame)leafKernelFrame
{
  return (SAFrame *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (SADispatchQueue)dispatchQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
  return (SADispatchQueue *)WeakRetained;
}

- (SASwiftTask)swiftTask
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swiftTask);
  return (SASwiftTask *)WeakRetained;
}

- (unint64_t)voucherIdentifier
{
  return self->_voucherIdentifier;
}

- (int)originPid
{
  return self->_originPid;
}

- (int)proximatePid
{
  return self->_proximatePid;
}

- (unint64_t)userTimeInNs
{
  return self->_userTimeInNs;
}

- (unint64_t)systemTimeInNs
{
  return self->_systemTimeInNs;
}

- (unint64_t)instructions
{
  return self->_instructions;
}

- (unint64_t)cycles
{
  return self->_cycles;
}

- (unsigned)schedulerFlags
{
  return self->_schedulerFlags;
}

- (SATimestamp)timestampLastMadeRunnable
{
  return (SATimestamp *)objc_getProperty(self, a2, 168, 1);
}

- (unsigned)ioTier
{
  return self->_threadQosIpcOverride;
}

- (unsigned)threadQosIpcOverride
{
  return self->_threadQosSyncIpcOverride;
}

- (unsigned)threadQosSyncIpcOverride
{
  return *(&self->_threadQosSyncIpcOverride + 1);
}

- (BOOL)needsExclave
{
  return (*((unsigned __int8 *)self + 20) >> 6) & 1;
}

- (void)setNeedsExclave:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xBF | v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclavesInfo, 0);
  objc_storeStrong((id *)&self->_timestampLastMadeRunnable, 0);
  objc_destroyWeak((id *)&self->_swiftTask);
  objc_destroyWeak((id *)&self->_dispatchQueue);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_turnstileInfo, 0);
  objc_storeStrong((id *)&self->_waitInfo, 0);
  objc_storeStrong((id *)&self->_leafKernelFrame, 0);
  objc_storeStrong((id *)&self->_leafOfCRootFramesReplacedBySwiftAsync, 0);
  objc_storeStrong((id *)&self->_leafUserFrame, 0);
  objc_storeStrong((id *)&self->_endTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

+ (id)classDictionaryKey
{
  return @"SAThreadState";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 199;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(SAThreadState *)self sizeInBytesForSerializedVersion] != a4)
  {
    int v17 = *__error();
    uint64_t v18 = _sa_logt();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = [(SAThreadState *)self debugDescription];
      *(_DWORD *)buf = 136315650;
      uint64_t v29 = [v19 UTF8String];
      __int16 v30 = 2048;
      unint64_t v31 = [(SAThreadState *)self sizeInBytesForSerializedVersion];
      __int16 v32 = 2048;
      unint64_t v33 = a4;
      _os_log_error_impl(&dword_1BF22B000, v18, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }
    *__error() = v17;
    id v20 = [(SAThreadState *)self debugDescription];
    char v21 = [v20 UTF8String];
    [(SAThreadState *)self sizeInBytesForSerializedVersion];
    _SASetCrashLogMessage(4669, "%s: size %lu != buffer length %lu", v22, v23, v24, v25, v26, v27, v21);

    _os_crash();
    __break(1u);
  }
  *(_WORD *)&a3->var0 = 2049;
  *(unint64_t *)((char *)&a3->var3 + 2) = [(SAThreadState *)self startSampleIndex];
  *(unint64_t *)((char *)&a3->var4 + 2) = [(SAThreadState *)self endSampleIndex];
  *(unint64_t *)((char *)&a3->var10 + 2) = self->_voucherIdentifier;
  *(unint64_t *)((char *)&a3->var11 + 2) = self->_userTimeInNs;
  *(unint64_t *)((char *)&a3->var12 + 2) = self->_systemTimeInNs;
  *(unint64_t *)((char *)&a3->var13 + 2) = self->_instructions;
  *(unint64_t *)((char *)&a3->var14 + 2) = self->_cycles;
  *(_DWORD *)((char *)&a3->var15 + 2) = [(SAThreadState *)self basePriority];
  *(_DWORD *)((char *)&a3->var15 + 6) = [(SAThreadState *)self scheduledPriority];
  *(int *)((char *)&a3->var16 + 2) = self->_schedulerFlags;
  *((unsigned char *)&a3->var18 + 6) = *((unsigned char *)self + 11) & 7;
  *((unsigned char *)&a3->var18 + 7) = (*((unsigned char *)self + 11) >> 3) & 7;
  LOBYTE(a3->var19) = *((unsigned char *)self + 21) & 7;
  BYTE1(a3->var19) = (*((unsigned char *)self + 21) >> 3) & 7;
  WORD1(a3->var19) = 1799;
  BYTE4(a3->var19) = self->_threadQosIpcOverride;
  *(_DWORD *)((char *)&a3->var19 + 5) = self->_state;
  a3->var21 = [(SAThreadState *)self microstackshotFlags];
  int v9 = a3->var22 & 0xFE | (*((unsigned __int8 *)self + 11) >> 7);
  a3->var22 = v9;
  unsigned int v10 = v9 & 0xFFFFFFFD | (2 * ((*((unsigned __int8 *)self + 11) >> 6) & 1));
  a3->var22 = v10;
  unsigned int v11 = v10 & 0xFFFFFFFB | (4 * ((*((unsigned __int8 *)self + 15) >> 6) & 1));
  a3->var22 = v11;
  unsigned int v12 = v11 & 0xFFFFFFF7 | (8 * ((*((unsigned __int8 *)self + 15) >> 7) & 1));
  a3->var22 = v12;
  a3->var22 = v12 & 0xEF | (*((unsigned char *)self + 19) >> 2) & 0x10;
  *(void *)(&a3->var1 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_startTimestamp, v8);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_endTimestamp, v8);
  *(unint64_t *)((char *)&a3->var5 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_leafUserFrame, v8);
  *(unint64_t *)((char *)&a3->var30 + 7) = SASerializableIndexForPointerFromSerializationDictionary(self->_leafOfCRootFramesReplacedBySwiftAsync, v8);
  *(unint64_t *)((char *)&a3->var6 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_leafKernelFrame, v8);
  *(unint64_t *)((char *)&a3->var7 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_waitInfo, v8);
  *(unint64_t *)((char *)&a3->var8 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_name, v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
  *(unint64_t *)((char *)&a3->var9 + 2) = SASerializableIndexForPointerFromSerializationDictionary(WeakRetained, v8);

  id v14 = objc_loadWeakRetained((id *)&self->_swiftTask);
  *(void *)((char *)&a3->var29 + 7) = SASerializableIndexForPointerFromSerializationDictionary(v14, v8);

  *(void *)((char *)&a3->var17 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_timestampLastMadeRunnable, v8);
  *(void *)&a3->var24 = SASerializableIndexForPointerFromSerializationDictionary(self->_turnstileInfo, v8);
  *(_DWORD *)&a3->var28 = [(SAThreadState *)self cpuNum];
  a3->var29.var1 = ($A4FF59F43F4B20644E55A5E6B3BB4A05)[(SAThreadState *)self cpuSpeedMhz];
  *((unsigned char *)&a3->var29 + 4) = [(SAThreadState *)self threadQosKEventOverride];
  *((unsigned char *)&a3->var29 + 5) = [(SAThreadState *)self threadQosWorkQueueOverride];
  *((unsigned char *)&a3->var29 + 6) = [(SAThreadState *)self threadQosWorkloopServicerOverride];
  if ([(SAThreadState *)self isPromotedAboveTask]) {
    char v15 = 32;
  }
  else {
    char v15 = 0;
  }
  a3->var22 = a3->var22 & 0xDF | v15;
  *(unsigned int *)((char *)&a3->var32 + 3) = [(SAThreadState *)self originPid];
  *(_DWORD *)(&a3->var35 + 1) = [(SAThreadState *)self proximatePid];
  *(void *)(&a3->var35 + 5) = SASerializableIndexForPointerFromSerializationDictionary(self->_exclavesInfo, v8);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(id)objc_opt_class() classDictionaryKey];
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v8, self, v4);

  if (v5)
  {
    [(SATimestamp *)self->_startTimestamp addSelfToSerializationDictionary:v8];
    [(SATimestamp *)self->_endTimestamp addSelfToSerializationDictionary:v8];
    [(SAFrame *)self->_leafUserFrame addSelfToSerializationDictionary:v8];
    [(SAFrame *)self->_leafOfCRootFramesReplacedBySwiftAsync addSelfToSerializationDictionary:v8];
    [(SAFrame *)self->_leafKernelFrame addSelfToSerializationDictionary:v8];
    [(SAWaitInfo *)self->_waitInfo addSelfToSerializationDictionary:v8];
    [(SATurnstileInfo *)self->_turnstileInfo addSelfToSerializationDictionary:v8];
    [(NSString *)self->_name addSelfToSerializationDictionary:v8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatchQueue);
    [WeakRetained addSelfToSerializationDictionary:v8];

    id v7 = objc_loadWeakRetained((id *)&self->_swiftTask);
    [v7 addSelfToSerializationDictionary:v8];

    [(SATimestamp *)self->_timestampLastMadeRunnable addSelfToSerializationDictionary:v8];
    [(SAThreadExclavesInfo *)self->_exclavesInfo addSelfToSerializationDictionary:v8];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)a3 >= 9u) {
    goto LABEL_46;
  }
  if (a4 <= 0x93)
  {
    int v21 = *__error();
    uint64_t v22 = _sa_logt();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 134218240;
      *(void *)&v70[4] = a4;
      *(_WORD *)&v70[12] = 2048;
      *(void *)&v70[14] = 148;
      _os_log_error_impl(&dword_1BF22B000, v22, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState struct %lu", v70, 0x16u);
    }

    *__error() = v21;
    _SASetCrashLogMessage(4765, "bufferLength %lu < serialized SAThreadState struct %lu", v23, v24, v25, v26, v27, v28, a4);
    _os_crash();
    __break(1u);
    goto LABEL_31;
  }
  if (*((unsigned char *)a3 + 145))
  {
    if (*((unsigned __int8 *)a3 + 1) < 3u)
    {
      LOWORD(v7) = 0;
    }
    else
    {
      if (a4 <= 0xA3)
      {
LABEL_34:
        int v37 = *__error();
        __int16 v38 = _sa_logt();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v70 = 134218240;
          *(void *)&v70[4] = a4;
          *(_WORD *)&v70[12] = 2048;
          *(void *)&v70[14] = 164;
          _os_log_error_impl(&dword_1BF22B000, v38, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v3 struct %lu", v70, 0x16u);
        }

        *__error() = v37;
        _SASetCrashLogMessage(4775, "bufferLength %lu < serialized SAThreadState v3 struct %lu", v39, v40, v41, v42, v43, v44, a4);
        _os_crash();
        __break(1u);
LABEL_37:
        int v45 = *__error();
        id v46 = _sa_logt();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v70 = 134218240;
          *(void *)&v70[4] = a4;
          *(_WORD *)&v70[12] = 2048;
          *(void *)&v70[14] = 167;
          _os_log_error_impl(&dword_1BF22B000, v46, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v4 struct %lu", v70, 0x16u);
        }

        *__error() = v45;
        _SASetCrashLogMessage(4827, "bufferLength %lu < serialized SAThreadState v4 struct %lu", v47, v48, v49, v50, v51, v52, a4);
        _os_crash();
        __break(1u);
        goto LABEL_40;
      }
      unsigned int v7 = *((_DWORD *)a3 + 40) / 0x64u;
    }
    id v8 = [SAThreadStateMicrostackshot alloc];
    if (v8)
    {
      char v9 = *((unsigned char *)a3 + 145);
      *(void *)v70 = v8;
      *(void *)&v70[8] = SAThreadStateMicrostackshot;
      unsigned int v10 = (SAThreadState *)objc_msgSendSuper2((objc_super *)v70, sel_init);
      id v6 = v10;
      if (v10)
      {
        LOBYTE(v10[1].super.isa) = v9;
        WORD1(v10[1].super.isa) = v7;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = objc_alloc_init(SAThreadState);
  }
  uint64_t v11 = *(void *)((char *)a3 + 18);
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 != 0x7FFFFFFF && v11 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v12 = *(void *)((char *)a3 + 18);
  }
  -[SAThreadState setStartSampleIndex:]((uint64_t)v6, v12);
  uint64_t v13 = *(void *)((char *)a3 + 26);
  unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v13 != 0x7FFFFFFF && v13 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v14 = *(void *)((char *)a3 + 26);
  }
  -[SAThreadState setEndSampleIndex:]((uint64_t)v6, v14);
  v6->_voucherIdentifier = *(void *)((char *)a3 + 74);
  v6->_userTimeInNs = *(void *)((char *)a3 + 82);
  v6->_systemTimeInNs = *(void *)((char *)a3 + 90);
  v6->_instructions = *(void *)((char *)a3 + 98);
  v6->_cycles = *(void *)((char *)a3 + 106);
  -[SAThreadState setBasePriority:]((int *)v6, *(_DWORD *)((char *)a3 + 114));
  -[SAThreadState setScheduledPriority:]((int *)v6, *(_DWORD *)((char *)a3 + 118));
  v6->_schedulerFlags = *(_DWORD *)((char *)a3 + 122);
  char v15 = *((unsigned char *)v6 + 11) & 0xF8 | *((unsigned char *)a3 + 134) & 7;
  *((unsigned char *)v6 + 11) = v15;
  char v16 = v15 & 0xC7 | (8 * (*((unsigned char *)a3 + 135) & 7));
  *((unsigned char *)v6 + 11) = v16;
  char v17 = *((unsigned char *)v6 + 21) & 0xF8 | *((unsigned char *)a3 + 136) & 7;
  *((unsigned char *)v6 + 21) = v17;
  *((unsigned char *)v6 + 21) = (8 * (*((unsigned char *)a3 + 137) & 7)) | v17 & 0xC7;
  v6->_threadQosIpcOverride = *((unsigned char *)a3 + 140);
  v6->_state = *(_DWORD *)((char *)a3 + 141);
  char v18 = v16 & 0x7F | (*((unsigned char *)a3 + 146) << 7);
  *((unsigned char *)v6 + 11) = v18;
  *((unsigned char *)v6 + 11) = (32 * *((unsigned char *)a3 + 146)) & 0x40 | v18 & 0xBF;
  int v19 = *((unsigned char *)v6 + 15) & 0xBF | (((*((unsigned __int8 *)a3 + 146) >> 2) & 1) << 6);
  *((unsigned char *)v6 + 15) = v19;
  *((unsigned char *)v6 + 15) = v19 & 0x7F | (((*((unsigned char *)a3 + 146) & 8) != 0) << 7);
  *((unsigned char *)v6 + 19) = *((unsigned char *)v6 + 19) & 0xBF | (4 * *((unsigned char *)a3 + 146)) & 0x40;
  if (*((unsigned __int8 *)a3 + 1) < 3u) {
    return v6;
  }
  if (a4 <= 0xA3)
  {
LABEL_31:
    int v29 = *__error();
    __int16 v30 = _sa_logt();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 134218240;
      *(void *)&v70[4] = a4;
      *(_WORD *)&v70[12] = 2048;
      *(void *)&v70[14] = 164;
      _os_log_error_impl(&dword_1BF22B000, v30, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v3 struct %lu", v70, 0x16u);
    }

    *__error() = v29;
    _SASetCrashLogMessage(4820, "bufferLength %lu < serialized SAThreadState v3 struct %lu", v31, v32, v33, v34, v35, v36, a4);
    _os_crash();
    __break(1u);
    goto LABEL_34;
  }
  -[SAThreadState setCpuNum:]((uint64_t)v6, *((_DWORD *)a3 + 39));
  if (*((unsigned __int8 *)a3 + 1) < 4u) {
    return v6;
  }
  if (a4 <= 0xA6) {
    goto LABEL_37;
  }
  -[SAThreadState setThreadQosKEventOverride:]((uint64_t)v6, *((unsigned __int8 *)a3 + 164));
  -[SAThreadState setThreadQosWorkQueueOverride:]((uint64_t)v6, *((unsigned __int8 *)a3 + 165));
  -[SAThreadState setThreadQosWorkloopServicerOverride:]((uint64_t)v6, *((unsigned __int8 *)a3 + 166));
  v6->_ioTier = v6->_ioTier & 0xF7 | (*((unsigned char *)a3 + 146) >> 2) & 8;
  if (*((unsigned __int8 *)a3 + 1) < 6u) {
    return v6;
  }
  if (a4 <= 0xBA)
  {
LABEL_40:
    int v53 = *__error();
    v54 = _sa_logt();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 134218240;
      *(void *)&v70[4] = a4;
      *(_WORD *)&v70[12] = 2048;
      *(void *)&v70[14] = 187;
      _os_log_error_impl(&dword_1BF22B000, v54, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v6 struct %lu", v70, 0x16u);
    }

    *__error() = v53;
    _SASetCrashLogMessage(4837, "bufferLength %lu < serialized SAThreadState v6 struct %lu", v55, v56, v57, v58, v59, v60, a4);
    _os_crash();
    __break(1u);
LABEL_43:
    int v61 = *__error();
    v62 = _sa_logt();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v70 = 134218240;
      *(void *)&v70[4] = a4;
      *(_WORD *)&v70[12] = 2048;
      *(void *)&v70[14] = 191;
      _os_log_error_impl(&dword_1BF22B000, v62, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v7 struct %lu", v70, 0x16u);
    }

    *__error() = v61;
    _SASetCrashLogMessage(4844, "bufferLength %lu < serialized SAThreadState v7 struct %lu", v63, v64, v65, v66, v67, v68, a4);
    _os_crash();
    __break(1u);
LABEL_46:
    id v69 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAThreadState version" userInfo:0];
    objc_exception_throw(v69);
  }
  v6->_originPid = *(_DWORD *)((char *)a3 + 183);
  if (*((unsigned __int8 *)a3 + 1) >= 7u)
  {
    if (a4 > 0xBE)
    {
      v6->_proximatePid = *(_DWORD *)((char *)a3 + 187);
      return v6;
    }
    goto LABEL_43;
  }
  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v91 = a5;
  id v10 = a6;
  if (*(unsigned __int8 *)a3 >= 9u) {
    goto LABEL_25;
  }
  if (a4 <= 0x93)
  {
    int v58 = *__error();
    uint64_t v59 = _sa_logt();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v93 = a4;
      __int16 v94 = 2048;
      uint64_t v95 = 148;
      _os_log_error_impl(&dword_1BF22B000, v59, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState struct %lu", buf, 0x16u);
    }

    *__error() = v58;
    _SASetCrashLogMessage(4857, "bufferLength %lu < serialized SAThreadState struct %lu", v60, v61, v62, v63, v64, v65, a4);
    _os_crash();
    __break(1u);
LABEL_16:
    int v66 = *__error();
    uint64_t v67 = _sa_logt();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v93 = a4;
      __int16 v94 = 2048;
      uint64_t v95 = 156;
      _os_log_error_impl(&dword_1BF22B000, v67, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v2 struct %lu", buf, 0x16u);
    }

    *__error() = v66;
    _SASetCrashLogMessage(4874, "bufferLength %lu < serialized SAThreadState v2 struct %lu", v68, v69, v70, v71, v72, v73, a4);
    _os_crash();
    __break(1u);
LABEL_19:
    int v74 = *__error();
    long long v75 = _sa_logt();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v93 = a4;
      __int16 v94 = 2048;
      uint64_t v95 = 183;
      _os_log_error_impl(&dword_1BF22B000, v75, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v5 struct %lu", buf, 0x16u);
    }

    *__error() = v74;
    _SASetCrashLogMessage(4880, "bufferLength %lu < serialized SAThreadState v5 struct %lu", v76, v77, v78, v79, v80, v81, a4);
    _os_crash();
    __break(1u);
LABEL_22:
    int v82 = *__error();
    v83 = _sa_logt();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v93 = a4;
      __int16 v94 = 2048;
      uint64_t v95 = 199;
      _os_log_error_impl(&dword_1BF22B000, v83, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThreadState v8 struct %lu", buf, 0x16u);
    }

    *__error() = v82;
    _SASetCrashLogMessage(4888, "bufferLength %lu < serialized SAThreadState v8 struct %lu", v84, v85, v86, v87, v88, v89, a4);
    _os_crash();
    __break(1u);
LABEL_25:
    id v90 = +[SAException exceptionWithName:@"Decoding failure" reason:@"Unknown SAThreadState version" userInfo:0];
    objc_exception_throw(v90);
  }
  uint64_t v11 = v10;
  unint64_t v12 = *(void *)((char *)a3 + 2);
  uint64_t v13 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v91, v11, v13);
  unint64_t v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  startTimestamp = self->_startTimestamp;
  self->_startTimestamp = v14;

  unint64_t v16 = *(void *)((char *)a3 + 10);
  char v17 = objc_opt_class();
  SASerializableNonnullInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v91, v11, v17);
  char v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  endTimestamp = self->_endTimestamp;
  self->_endTimestamp = v18;

  unint64_t v20 = *(void *)((char *)a3 + 34);
  int v21 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v20, v91, v11, v21, 0);
  uint64_t v22 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  leafUserFrame = self->_leafUserFrame;
  self->_leafUserFrame = v22;

  unint64_t v24 = *(void *)((char *)a3 + 42);
  uint64_t v25 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v24, v91, v11, v25, 0);
  uint64_t v26 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  leafKernelFrame = self->_leafKernelFrame;
  self->_leafKernelFrame = v26;

  unint64_t v28 = *(void *)((char *)a3 + 50);
  int v29 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v28, v91, v11, v29, 0);
  __int16 v30 = (SAWaitInfo *)objc_claimAutoreleasedReturnValue();
  waitInfo = self->_waitInfo;
  self->_waitInfo = v30;

  unint64_t v32 = *(void *)((char *)a3 + 58);
  uint64_t v33 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v32, v91, v11, v33, 0);
  uint64_t v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v34;

  unint64_t v36 = *(void *)((char *)a3 + 66);
  int v37 = objc_opt_class();
  __int16 v38 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v36, v91, v11, v37, 0);
  objc_storeWeak((id *)&self->_dispatchQueue, v38);

  unint64_t v39 = *(void *)((char *)a3 + 126);
  uint64_t v40 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v39, v91, v11, v40, 0);
  uint64_t v41 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  timestampLastMadeRunnable = self->_timestampLastMadeRunnable;
  self->_timestampLastMadeRunnable = v41;

  if (*((unsigned __int8 *)a3 + 1) < 2u) {
    goto LABEL_10;
  }
  if (a4 <= 0x9B) {
    goto LABEL_16;
  }
  unint64_t v43 = *(void *)((char *)a3 + 148);
  uint64_t v44 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v43, v91, v11, v44, 0);
  int v45 = (SATurnstileInfo *)objc_claimAutoreleasedReturnValue();
  turnstileInfo = self->_turnstileInfo;
  self->_turnstileInfo = v45;

  if (*((unsigned __int8 *)a3 + 1) < 5u) {
    goto LABEL_10;
  }
  if (a4 <= 0xB6) {
    goto LABEL_19;
  }
  unint64_t v47 = *(void *)((char *)a3 + 167);
  uint64_t v48 = objc_opt_class();
  uint64_t v49 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v47, v91, v11, v48, 0);
  objc_storeWeak((id *)&self->_swiftTask, v49);

  unint64_t v50 = *(void *)((char *)a3 + 175);
  uint64_t v51 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v50, v91, v11, v51, 0);
  uint64_t v52 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  leafOfCRootFramesReplacedBySwiftAsync = self->_leafOfCRootFramesReplacedBySwiftAsync;
  self->_leafOfCRootFramesReplacedBySwiftAsync = v52;

  if (*((unsigned __int8 *)a3 + 1) < 8u) {
    goto LABEL_10;
  }
  if (a4 <= 0xC6) {
    goto LABEL_22;
  }
  unint64_t v54 = *(void *)((char *)a3 + 191);
  uint64_t v55 = objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v54, v91, v11, v55, 0);
  uint64_t v56 = (SAThreadExclavesInfo *)objc_claimAutoreleasedReturnValue();
  uint64_t exclavesInfo = self->_exclavesInfo;
  self->_uint64_t exclavesInfo = v56;

LABEL_10:
}

+ (id)stateWithoutReferencesFromPAStyleSerializedThread:(uint64_t)a1
{
  self;
  char v3 = objc_alloc_init(SAThreadState);
  uint64_t v4 = (uint64_t)v3;
  if (v3)
  {
    *((unsigned char *)v3 + 22) |= 0x3Fu;
    v3->_ioTier = v3->_ioTier & 0xF0 | 7;
  }
  unint64_t v5 = *(void *)a2;
  if (*(void *)a2 > 0x11235818uLL)
  {
    v3->_voucherIdentifier = *(void *)(a2 + 56);
    v3->_userTimeInNs = *(void *)(a2 + 64);
    v3->_systemTimeInNs = *(void *)(a2 + 72);
    v3->_instructions = *(void *)(a2 + 80);
    v3->_cycles = *(void *)(a2 + 88);
    v3->_state = *(_DWORD *)(a2 + 96);
    -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 104));
    -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 106));
    *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 100);
    *(unsigned char *)(v4 + 24) = *(unsigned char *)(a2 + 114);
    -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 108));
    -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 109));
    -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 110));
    -[SAThreadState setThreadQosPromote:](v4, *(unsigned __int8 *)(a2 + 111));
    uint64_t v6 = *(void *)(a2 + 115);
    if (v6)
    {
      *(unsigned char *)(v4 + 11) |= 0x40u;
      uint64_t v6 = *(void *)(a2 + 115);
      if ((v6 & 2) == 0)
      {
LABEL_6:
        if ((v6 & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_17;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_6;
    }
    *(unsigned char *)(v4 + 11) |= 0x80u;
    uint64_t v6 = *(void *)(a2 + 115);
    if ((v6 & 4) == 0)
    {
LABEL_7:
      if ((v6 & 0x10) == 0) {
        goto LABEL_38;
      }
LABEL_18:
      *(unsigned char *)(v4 + 15) |= 0x80u;
      uint64_t v6 = *(void *)(a2 + 115);
      goto LABEL_38;
    }
LABEL_17:
    *(unsigned char *)(v4 + 15) |= 0x40u;
    uint64_t v6 = *(void *)(a2 + 115);
    if ((v6 & 0x10) == 0) {
      goto LABEL_38;
    }
    goto LABEL_18;
  }
  if (*(void *)a2 == 287528984)
  {
    v3->_voucherIdentifier = *(void *)(a2 + 56);
    v3->_userTimeInNs = *(void *)(a2 + 64);
    v3->_systemTimeInNs = *(void *)(a2 + 72);
    v3->_state = *(_DWORD *)(a2 + 80);
    -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 88));
    -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 90));
    *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 84);
    *(unsigned char *)(v4 + 24) = *(unsigned char *)(a2 + 98);
    -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 92));
    -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 93));
    -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 94));
    -[SAThreadState setThreadQosPromote:](v4, *(unsigned __int8 *)(a2 + 95));
    uint64_t v6 = *(void *)(a2 + 99);
    if (v6)
    {
      *(unsigned char *)(v4 + 11) |= 0x40u;
      uint64_t v6 = *(void *)(a2 + 99);
      if ((v6 & 2) == 0)
      {
LABEL_12:
        if ((v6 & 4) == 0) {
          goto LABEL_13;
        }
        goto LABEL_27;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_12;
    }
    *(unsigned char *)(v4 + 11) |= 0x80u;
    uint64_t v6 = *(void *)(a2 + 99);
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 0x10) == 0) {
        goto LABEL_38;
      }
LABEL_28:
      *(unsigned char *)(v4 + 15) |= 0x80u;
      uint64_t v6 = *(void *)(a2 + 99);
      goto LABEL_38;
    }
LABEL_27:
    *(unsigned char *)(v4 + 15) |= 0x40u;
    uint64_t v6 = *(void *)(a2 + 99);
    if ((v6 & 0x10) == 0) {
      goto LABEL_38;
    }
    goto LABEL_28;
  }
  if (v5 <= 0x11235816)
  {
    switch(v5)
    {
      case 0x11235813uLL:
        v3->_voucherIdentifier = 0;
        v3->_userTimeInNs = *(void *)(a2 + 40);
        v3->_systemTimeInNs = *(void *)(a2 + 48);
        v3->_state = *(_DWORD *)(a2 + 64);
        -[SAThreadState setBasePriority:]((int *)v3, *(_DWORD *)(a2 + 68));
        -[SAThreadState setScheduledPriority:]((int *)v4, *(_DWORD *)(a2 + 72));
        *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 76);
        *(unsigned char *)(v4 + 24) = *(unsigned char *)(a2 + 84);
        -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 80));
        char v7 = *(unsigned char *)(v4 + 11);
        char v8 = v7 | 0x38;
        *(unsigned char *)(v4 + 11) = v7 | 0x38;
        *(unsigned char *)(v4 + 21) |= 0x3Fu;
        char v9 = *(unsigned char *)(a2 + 86);
        if ((v9 & 0x40) != 0)
        {
          char v8 = v7 | 0x78;
          *(unsigned char *)(v4 + 11) = v7 | 0x78;
          char v9 = *(unsigned char *)(a2 + 86);
          if ((v9 & 0x20) == 0)
          {
LABEL_32:
            if ((v9 & 0x10) != 0) {
              goto LABEL_63;
            }
            goto LABEL_41;
          }
        }
        else if ((*(unsigned char *)(a2 + 86) & 0x20) == 0)
        {
          goto LABEL_32;
        }
        *(unsigned char *)(v4 + 11) = v8 | 0x80;
        if ((*(unsigned char *)(a2 + 86) & 0x10) != 0) {
          goto LABEL_63;
        }
        goto LABEL_41;
      case 0x11235814uLL:
        v3->_voucherIdentifier = 0;
        v3->_userTimeInNs = *(void *)(a2 + 40);
        v3->_systemTimeInNs = *(void *)(a2 + 48);
        v3->_state = *(_DWORD *)(a2 + 64);
        -[SAThreadState setBasePriority:]((int *)v3, *(_DWORD *)(a2 + 68));
        -[SAThreadState setScheduledPriority:]((int *)v4, *(_DWORD *)(a2 + 72));
        *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 76);
        *(unsigned char *)(v4 + 24) = *(unsigned char *)(a2 + 84);
        -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 80));
        -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 81));
        -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 82));
        *(unsigned char *)(v4 + 21) |= 0x38u;
        char v12 = *(unsigned char *)(a2 + 86);
        if ((v12 & 0x40) != 0)
        {
          *(unsigned char *)(v4 + 11) |= 0x40u;
          char v12 = *(unsigned char *)(a2 + 86);
        }
        if ((v12 & 0x20) != 0)
        {
          *(unsigned char *)(v4 + 11) |= 0x80u;
          char v12 = *(unsigned char *)(a2 + 86);
        }
        if ((v12 & 0x10) != 0) {
          goto LABEL_63;
        }
        goto LABEL_41;
      case 0x11235815uLL:
        v3->_voucherIdentifier = *(void *)(a2 + 40);
        v3->_userTimeInNs = *(void *)(a2 + 48);
        v3->_systemTimeInNs = *(void *)(a2 + 56);
        v3->_state = *(_DWORD *)(a2 + 64);
        -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 72));
        -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 74));
        *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 68);
        *(unsigned char *)(v4 + 24) = *(unsigned char *)(a2 + 79);
        -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 76));
        -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 77));
        -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 78));
        *(unsigned char *)(v4 + 21) |= 0x38u;
        char v13 = *(unsigned char *)(a2 + 80);
        if (v13)
        {
          *(unsigned char *)(v4 + 11) |= 0x40u;
          char v13 = *(unsigned char *)(a2 + 80);
        }
        if ((v13 & 2) != 0)
        {
          *(unsigned char *)(v4 + 11) |= 0x80u;
          char v13 = *(unsigned char *)(a2 + 80);
        }
        if ((v13 & 4) != 0)
        {
LABEL_63:
          uint64_t v10 = 15;
          goto LABEL_40;
        }
        goto LABEL_41;
      case 0x11235816uLL:
        v3->_voucherIdentifier = *(void *)(a2 + 48);
        v3->_userTimeInNs = *(void *)(a2 + 56);
        v3->_systemTimeInNs = *(void *)(a2 + 64);
        v3->_state = *(_DWORD *)(a2 + 72);
        -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 80));
        -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 82));
        *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 76);
        *(unsigned char *)(v4 + 24) = *(unsigned char *)(a2 + 87);
        -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 84));
        -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 85));
        -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 86));
        *(unsigned char *)(v4 + 21) |= 0x38u;
        uint64_t v6 = *(void *)(a2 + 88);
        if (v6)
        {
          *(unsigned char *)(v4 + 11) |= 0x40u;
          uint64_t v6 = *(void *)(a2 + 88);
          if ((v6 & 2) == 0)
          {
LABEL_58:
            if ((v6 & 4) == 0) {
              goto LABEL_59;
            }
            goto LABEL_66;
          }
        }
        else if ((v6 & 2) == 0)
        {
          goto LABEL_58;
        }
        *(unsigned char *)(v4 + 11) |= 0x80u;
        uint64_t v6 = *(void *)(a2 + 88);
        if ((v6 & 4) == 0)
        {
LABEL_59:
          if ((v6 & 0x10) == 0) {
            goto LABEL_38;
          }
LABEL_67:
          *(unsigned char *)(v4 + 15) |= 0x80u;
          uint64_t v6 = *(void *)(a2 + 88);
          goto LABEL_38;
        }
LABEL_66:
        *(unsigned char *)(v4 + 15) |= 0x40u;
        uint64_t v6 = *(void *)(a2 + 88);
        if ((v6 & 0x10) == 0) {
          goto LABEL_38;
        }
        goto LABEL_67;
      default:
        goto LABEL_41;
    }
  }
  v3->_voucherIdentifier = *(void *)(a2 + 56);
  v3->_userTimeInNs = *(void *)(a2 + 64);
  v3->_systemTimeInNs = *(void *)(a2 + 72);
  v3->_state = *(_DWORD *)(a2 + 80);
  -[SAThreadState setBasePriority:]((int *)v3, *(__int16 *)(a2 + 88));
  -[SAThreadState setScheduledPriority:]((int *)v4, *(__int16 *)(a2 + 90));
  *(_DWORD *)(v4 + 36) = *(_DWORD *)(a2 + 84);
  *(unsigned char *)(v4 + 24) = *(unsigned char *)(a2 + 95);
  -[SAThreadState setThreadQos:](v4, *(unsigned __int8 *)(a2 + 92));
  -[SAThreadState setThreadRequestedQos:](v4, *(unsigned __int8 *)(a2 + 93));
  -[SAThreadState setThreadRequestedQosOverride:](v4, *(unsigned __int8 *)(a2 + 94));
  *(unsigned char *)(v4 + 21) |= 0x38u;
  uint64_t v6 = *(void *)(a2 + 96);
  if (v6)
  {
    *(unsigned char *)(v4 + 11) |= 0x40u;
    uint64_t v6 = *(void *)(a2 + 96);
    if ((v6 & 2) == 0)
    {
LABEL_22:
      if ((v6 & 4) == 0) {
        goto LABEL_23;
      }
LABEL_36:
      *(unsigned char *)(v4 + 15) |= 0x40u;
      uint64_t v6 = *(void *)(a2 + 96);
      if ((v6 & 0x10) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_22;
  }
  *(unsigned char *)(v4 + 11) |= 0x80u;
  uint64_t v6 = *(void *)(a2 + 96);
  if ((v6 & 4) != 0) {
    goto LABEL_36;
  }
LABEL_23:
  if ((v6 & 0x10) != 0)
  {
LABEL_37:
    *(unsigned char *)(v4 + 15) |= 0x80u;
    uint64_t v6 = *(void *)(a2 + 96);
  }
LABEL_38:
  if ((v6 & 0x20) != 0)
  {
    uint64_t v10 = 19;
LABEL_40:
    *(unsigned char *)(v4 + v10) |= 0x40u;
  }
LABEL_41:
  return (id)v4;
}

- (void)populateReferencesUsingPAStyleSerializedThread:(void *)a3 andDeserializationDictionary:(void *)a4 andDataBufferDictionary:
{
  id v61 = a3;
  id v7 = a4;
  if (a1)
  {
    char v8 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    if (*a2 <= 0x11235816uLL)
    {
      if (*a2 != 287528982)
      {
        unint64_t v46 = a2[1];
        if (v46 >= 0xFFFFFFFFFFFFFFFELL)
        {
          uint64_t v59 = @"Bad leaf frame index";
        }
        else
        {
          unint64_t v47 = objc_opt_class();
          uint64_t v48 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v46, v61, v7, v47, 0);
          if (v48)
          {
            char v13 = v48;
            id v50 = objc_getProperty(v48, v49, 8, 1);

            if (!v50)
            {
              id v52 = objc_getProperty(v13, v51, 8, 1);
              int v53 = *(void **)(a1 + 64);
              *(void *)(a1 + 64) = v52;

              unint64_t v54 = *(void **)(a1 + 80);
              *(void *)(a1 + 80) = 0;

              if (*a2 <= 0x11235814uLL)
              {
                int v58 = *(void **)(a1 + 104);
                *(void *)(a1 + 104) = 0;
              }
              else
              {
                unint64_t v55 = a2[2];
                if (v55 == -2)
                {
LABEL_35:
                  uint64_t v59 = @"Bad thread name index";
                  goto LABEL_46;
                }
                uint64_t v56 = objc_opt_class();
                uint64_t v57 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v55, v61, v7, v56, 0);
                int v58 = *(void **)(a1 + 104);
                *(void *)(a1 + 104) = v57;
              }

              int v19 = *(void **)(a1 + 88);
              *(void *)(a1 + 88) = 0;
              goto LABEL_31;
            }
          }
          uint64_t v59 = @"nil leaf frame";
        }
LABEL_46:
        id v60 = +[SAException exceptionWithName:@"Decoding failure" reason:v59 userInfo:0];
        objc_exception_throw(v60);
      }
      unint64_t v31 = a2[1];
      if (v31 != -2)
      {
        unint64_t v32 = objc_opt_class();
        uint64_t v33 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v61, v7, v32, 0);
        char v13 = v33;
        if (v33) {
          id Property = objc_getProperty(v33, v34, 8, 1);
        }
        else {
          id Property = 0;
        }
        objc_storeStrong((id *)(a1 + 64), Property);
        unint64_t v36 = a2[2];
        if (v36 != -2)
        {
          int v37 = objc_opt_class();
          __int16 v38 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v36, v61, v7, v37, 0);
          int v19 = v38;
          if (v38) {
            id v40 = objc_getProperty(v38, v39, 8, 1);
          }
          else {
            id v40 = 0;
          }
          objc_storeStrong((id *)(a1 + 80), v40);
          unint64_t v41 = a2[3];
          if (v41 != -2)
          {
            uint64_t v42 = objc_opt_class();
            uint64_t v43 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v41, v61, v7, v42, 0);
            uint64_t v44 = *(void **)(a1 + 104);
            *(void *)(a1 + 104) = v43;

            int v45 = *(void **)(a1 + 88);
            *(void *)(a1 + 88) = 0;

            goto LABEL_31;
          }
          goto LABEL_35;
        }
        goto LABEL_37;
      }
    }
    else
    {
      unint64_t v9 = a2[1];
      if (v9 != -2)
      {
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v9, v61, v7, v10, 0);
        char v13 = v11;
        if (v11) {
          id v14 = objc_getProperty(v11, v12, 8, 1);
        }
        else {
          id v14 = 0;
        }
        objc_storeStrong((id *)(a1 + 64), v14);
        unint64_t v15 = a2[2];
        if (v15 != -2)
        {
          unint64_t v16 = objc_opt_class();
          char v17 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v15, v61, v7, v16, 0);
          int v19 = v17;
          if (v17) {
            id v20 = objc_getProperty(v17, v18, 8, 1);
          }
          else {
            id v20 = 0;
          }
          objc_storeStrong((id *)(a1 + 80), v20);
          unint64_t v21 = a2[3];
          if (v21 != -2)
          {
            uint64_t v22 = objc_opt_class();
            uint64_t v23 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v21, v61, v7, v22, 0);
            uint64_t v25 = v23;
            if (v23) {
              id v26 = objc_getProperty(v23, v24, 8, 1);
            }
            else {
              id v26 = 0;
            }
            objc_storeStrong((id *)(a1 + 88), v26);
            unint64_t v27 = a2[4];
            if (v27 != -2)
            {
              unint64_t v28 = objc_opt_class();
              uint64_t v29 = _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v27, v61, v7, v28, 0);
              __int16 v30 = *(void **)(a1 + 104);
              *(void *)(a1 + 104) = v29;

LABEL_31:
              goto LABEL_32;
            }
            goto LABEL_35;
          }
          uint64_t v59 = @"Bad wait info index";
          goto LABEL_46;
        }
LABEL_37:
        uint64_t v59 = @"Bad leaf kernel frame index";
        goto LABEL_46;
      }
    }
    uint64_t v59 = @"Bad leaf user frame index";
    goto LABEL_46;
  }
LABEL_32:
}

- (void)applyPAStyleSampleTimestamp:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    if (!*(void *)(a1 + 48)) {
      objc_storeStrong((id *)(a1 + 48), a2);
    }
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

@end