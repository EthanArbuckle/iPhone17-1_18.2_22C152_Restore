@interface TSDCKernelClock
+ (id)clockWithIdentifier:(unint64_t)a3;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (NSString)clockName;
- (OS_dispatch_queue)propertyUpdateQueue;
- (TSClock)translationClock;
- (TSDCKernelClock)initWithKernelClock:(id)a3;
- (TSKernelClock)client;
- (double)hostRateRatio;
- (id)getOsLog;
- (int)internalLockState;
- (int)lockState;
- (os_unfair_lock_s)getUpdateLock;
- (os_unfair_lock_s)updateLock;
- (unint64_t)clockIdentifier;
- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3;
- (unint64_t)getSignpostId;
- (unsigned)getCoreAudioReanchors;
- (unsigned)validIndex;
- (void)_getInitialSyncInfo;
- (void)dealloc;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)didResetClock:(id)a3;
- (void)postLockStateChange:(int)a3;
- (void)setClient:(id)a3;
- (void)setClockIdentifier:(unint64_t)a3;
- (void)setHostRateRatio:(double)a3;
- (void)setInternalLockState:(int)a3;
- (void)setLockState:(int)a3;
- (void)setPropertyUpdateQueue:(id)a3;
- (void)setTranslationClock:(id)a3;
- (void)setUpdateLock:(os_unfair_lock_s)a3;
- (void)setValidIndex:(unsigned int)a3;
- (void)updateCoreAudioReanchors:(unsigned int)a3;
- (void)updateLockState:(int)a3;
- (void)updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6;
@end

@implementation TSDCKernelClock

+ (id)clockWithIdentifier:(unint64_t)a3
{
  v4 = +[_TSF_TSDClockManager sharedClockManager];
  v5 = [v4 clockWithClockIdentifier:a3];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = off_1E622A6E8;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v6 = off_1E622A6D0;
      if (isKindOfClass) {
        v6 = off_1E622A6E0;
      }
    }
    v7 = (void *)[objc_alloc(*v6) initWithKernelClock:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TSDCKernelClock)initWithKernelClock:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TSDCKernelClock;
  v6 = [(TSDCKernelClock *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->_updateLock._os_unfair_lock_opaque = 0;
    v6->_clockIdentifier = [v5 clockIdentifier];
    v7->_hostRateRatio = 1.0;
    v7->_validIndex = -1;
    v8 = +[TSClockManager sharedClockManager];
    uint64_t v9 = [v8 translationClock];
    translationClock = v7->_translationClock;
    v7->_translationClock = (TSClock *)v9;

    objc_storeStrong((id *)&v7->_kernelClock, a3);
    [(_TSF_TSDKernelClock *)v7->_kernelClock addClient:v7];
    v11 = +[_TSF_TSDClockSyncManager sharedClockSyncManager];
    uint64_t v12 = objc_msgSend(v11, "clockSyncForClockIdentifier:pid:", -[_TSF_TSDKernelClock clockIdentifier](v7->_kernelClock, "clockIdentifier"), 0);
    clockSync = v7->_clockSync;
    v7->_clockSync = (_TSF_TSDClockSync *)v12;

    [(_TSF_TSDClockSync *)v7->_clockSync addUpdateClient:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [(TSDCKernelClock *)v7 _getInitialSyncInfo];
    }
  }

  return v7;
}

- (void)dealloc
{
  [(_TSF_TSDClockSync *)self->_clockSync removeUpdateClient:self];
  v3 = +[_TSF_TSDClockSyncManager sharedClockSyncManager];
  objc_msgSend(v3, "releaseClockSyncForClockIdentifier:", -[_TSF_TSDKernelClock clockIdentifier](self->_kernelClock, "clockIdentifier"));

  [(_TSF_TSDKernelClock *)self->_kernelClock finalizeNotifications];
  [(_TSF_TSDKernelClock *)self->_kernelClock removeClient:self];
  v4.receiver = self;
  v4.super_class = (Class)TSDCKernelClock;
  [(TSDCKernelClock *)&v4 dealloc];
}

- (NSString)clockName
{
  return 0;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = [(TSDCKernelClock *)self getOsLog];
  unint64_t v6 = [(TSDCKernelClock *)self getSignpostId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      int v15 = 136315138;
      v16 = "-[TSDCKernelClock convertFromMachAbsoluteToDomainTime:]";
      _os_signpost_emit_with_name_impl(&dword_1BA88B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v15, 0xCu);
    }
  }

  unint64_t v8 = [(TSClock *)self->_translationClock convertFromMachAbsoluteToDomainTime:a3];
  unint64_t v9 = [(TSClock *)self->_translationClock convertFromDomainToTimeSyncTime:v8];
  unint64_t v10 = [(TSDCKernelClock *)self convertFromTimeSyncToDomainTime:v9];
  v11 = [(TSDCKernelClock *)self getOsLog];
  unint64_t v12 = [(TSDCKernelClock *)self getSignpostId];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      int v15 = 136316162;
      v16 = "-[TSDCKernelClock convertFromMachAbsoluteToDomainTime:]";
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2048;
      unint64_t v20 = v8;
      __int16 v21 = 2048;
      unint64_t v22 = v9;
      __int16 v23 = 2048;
      unint64_t v24 = v10;
      _os_signpost_emit_with_name_impl(&dword_1BA88B000, v11, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1BA8E2971, "%s MachAbsoluteTime=%llu intermediateTime=%llu timeSyncTime=%llu  domainTime=%llu", (uint8_t *)&v15, 0x34u);
    }
  }

  return v10;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = [(TSDCKernelClock *)self getOsLog];
  unint64_t v6 = [(TSDCKernelClock *)self getSignpostId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      int v15 = 136315138;
      v16 = "-[TSDCKernelClock convertFromDomainToMachAbsoluteTime:]";
      _os_signpost_emit_with_name_impl(&dword_1BA88B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v15, 0xCu);
    }
  }

  unint64_t v8 = [(TSDCKernelClock *)self convertFromDomainToTimeSyncTime:a3];
  unint64_t v9 = [(TSClock *)self->_translationClock convertFromTimeSyncToDomainTime:v8];
  unint64_t v10 = [(TSClock *)self->_translationClock convertFromDomainToMachAbsoluteTime:v9];
  v11 = [(TSDCKernelClock *)self getOsLog];
  unint64_t v12 = [(TSDCKernelClock *)self getSignpostId];
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      int v15 = 136316162;
      v16 = "-[TSDCKernelClock convertFromDomainToMachAbsoluteTime:]";
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2048;
      unint64_t v20 = v8;
      __int16 v21 = 2048;
      unint64_t v22 = v9;
      __int16 v23 = 2048;
      unint64_t v24 = v10;
      _os_signpost_emit_with_name_impl(&dword_1BA88B000, v11, OS_SIGNPOST_INTERVAL_END, v13, (const char *)&unk_1BA8E2971, "%s domainTime=%llu timeSyncTime=%llu intermediateTime=%llu MachAbsoluteTime=%llu", (uint8_t *)&v15, 0x34u);
    }
  }

  return v10;
}

- (id)getOsLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__TSDCKernelClock_getOsLog__block_invoke;
  block[3] = &unk_1E622A8F8;
  block[4] = self;
  if (getOsLog_onceToken != -1) {
    dispatch_once(&getOsLog_onceToken, block);
  }
  return (id)getOsLog_clockLog;
}

void __27__TSDCKernelClock_getOsLog__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("TimeSync", (const char *)[v3 UTF8String]);
  v2 = (void *)getOsLog_clockLog;
  getOsLog_clockLog = (uint64_t)v1;
}

- (unint64_t)getSignpostId
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__TSDCKernelClock_getSignpostId__block_invoke;
  block[3] = &unk_1E622A8F8;
  block[4] = self;
  if (getSignpostId_onceToken != -1) {
    dispatch_once(&getSignpostId_onceToken, block);
  }
  return getSignpostId_signpostId;
}

void __32__TSDCKernelClock_getSignpostId__block_invoke(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) getOsLog];
  getSignpostId_signpostId = os_signpost_id_generate(v1);
}

- (os_unfair_lock_s)getUpdateLock
{
  return &self->_updateLock;
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
    int v15 = "machAbsoluteTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v24 = 1024;
    int v25 = 189;
    unint64_t v12 = MEMORY[0x1E4F14500];
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
    int v15 = "domainTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v24 = 1024;
    int v25 = 190;
    unint64_t v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    unint64_t v6 = a3;
    uint64_t v8 = a5;
    do
    {
      uint64_t v9 = *v6++;
      *v5++ = [(TSDCKernelClock *)self convertFromMachAbsoluteToDomainTime:v9];
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
    int v15 = "machAbsoluteTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v24 = 1024;
    int v25 = 207;
    unint64_t v12 = MEMORY[0x1E4F14500];
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
    int v15 = "domainTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v24 = 1024;
    int v25 = 208;
    unint64_t v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    unint64_t v6 = a4;
    uint64_t v8 = a5;
    do
    {
      uint64_t v9 = *v5++;
      *v6++ = [(TSDCKernelClock *)self convertFromDomainToMachAbsoluteTime:v9];
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  unint64_t v4 = [(TSClock *)self->_translationClock convertFromDomainIntervalToTimeSyncTimeInterval:[(TSClock *)self->_translationClock convertFromMachAbsoluteIntervalToDomainInterval:a3]];
  return [(TSDCKernelClock *)self convertFromTimeSyncTimeIntervalToDomainInterval:v4];
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  unint64_t v4 = [(TSClock *)self->_translationClock convertFromTimeSyncTimeIntervalToDomainInterval:[(TSDCKernelClock *)self convertFromDomainIntervalToTimeSyncTimeInterval:a3]];
  translationClock = self->_translationClock;
  return [(TSClock *)translationClock convertFromDomainIntervalToMachAbsoluteInterval:v4];
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
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
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = 0;
  if (!-[TSDCKernelClock getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:](self, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:", &v22, &v21, &v20))
  {
    BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v12) {
      return result;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v24 = "[self getTimeSyncTimeRateRatioNumerator:&thisNumer denominator:&thisDenom timeSyncAnchor:&thisTSAnchor andDoma"
          "inAnchor:domainAnchor withError:error]";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    v30 = "";
    __int16 v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v33 = 1024;
    int v34 = 260;
    BOOL v13 = MEMORY[0x1E4F14500];
    goto LABEL_22;
  }
  if (![(TSClock *)self->_translationClock getTimeSyncTimeRateRatioNumerator:&v19 denominator:&v18 timeSyncAnchor:0 andDomainAnchor:0 withError:0])
  {
    BOOL v14 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v14) {
      return result;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v24 = "[_translationClock getTimeSyncTimeRateRatioNumerator:&transNumer denominator:&transDenom timeSyncAnchor:nil an"
          "dDomainAnchor:nil withError:nil]";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    v30 = "";
    __int16 v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v33 = 1024;
    int v34 = 262;
    BOOL v13 = MEMORY[0x1E4F14500];
    goto LABEL_22;
  }
  if (![(TSClock *)self->_translationClock getMachAbsoluteRateRatioNumerator:&v17 denominator:&v16 machAnchor:0 andDomainAnchor:0 withError:0])
  {
    BOOL v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v15) {
      return result;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v24 = "[_translationClock getMachAbsoluteRateRatioNumerator:&machNumer denominator:&machDenom machAnchor:nil andDomai"
          "nAnchor:nil withError:nil]";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2048;
    uint64_t v28 = 0;
    __int16 v29 = 2080;
    v30 = "";
    __int16 v31 = 2080;
    v32 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v33 = 1024;
    int v34 = 264;
    BOOL v13 = MEMORY[0x1E4F14500];
LABEL_22:
    _os_log_impl(&dword_1BA88B000, v13, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    return 0;
  }
  __C(v22, v19, v17, v21, v18, v16, a3, a4);
  if (a5) {
    *a5 = [(TSClock *)self->_translationClock convertFromDomainToMachAbsoluteTime:[(TSClock *)self->_translationClock convertFromTimeSyncToDomainTime:v20]];
  }
  return 1;
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316418;
      BOOL v12 = "TSInvalidTime != timeSyncTime";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v21 = 1024;
      int v22 = 287;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
    }
    return -1;
  }
  uint64_t validIndex = self->_validIndex;
  if (validIndex >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316418;
      BOOL v12 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v21 = 1024;
      int v22 = 288;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
    }
    return -1;
  }
  id v5 = &self->super.isa + 4 * validIndex;
  unint64_t v6 = (unint64_t)v5[1];
  uint64_t v7 = (uint64_t)v5[2];
  unint64_t v8 = (unint64_t)v5[3];
  unint64_t v9 = (unint64_t)v5[4];
  return TSTimeXtoTimeY(a3, v6, v8, v7, v9);
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316418;
      BOOL v12 = "TSInvalidTime != domainTime";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v21 = 1024;
      int v22 = 301;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
    }
    return -1;
  }
  uint64_t validIndex = self->_validIndex;
  if (validIndex >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136316418;
      BOOL v12 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v21 = 1024;
      int v22 = 302;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
    }
    return -1;
  }
  id v5 = &self->super.isa + 4 * validIndex;
  uint64_t v7 = (uint64_t)v5[1];
  unint64_t v6 = (unint64_t)v5[2];
  unint64_t v9 = (unint64_t)v5[3];
  unint64_t v8 = (unint64_t)v5[4];
  return TSTimeXtoTimeY(a3, v6, v8, v7, v9);
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
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
    __int16 v15 = "timeSyncTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v24 = 1024;
    int v25 = 314;
    BOOL v12 = MEMORY[0x1E4F14500];
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
    __int16 v15 = "domainTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v24 = 1024;
    int v25 = 315;
    BOOL v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    unint64_t v6 = a3;
    uint64_t v8 = a5;
    do
    {
      uint64_t v9 = *v6++;
      *v5++ = [(TSDCKernelClock *)self convertFromTimeSyncToDomainTime:v9];
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
    __int16 v15 = "timeSyncTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v24 = 1024;
    int v25 = 332;
    BOOL v12 = MEMORY[0x1E4F14500];
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
    __int16 v15 = "domainTime != NULL";
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v24 = 1024;
    int v25 = 333;
    BOOL v12 = MEMORY[0x1E4F14500];
LABEL_12:
    _os_log_impl(&dword_1BA88B000, v12, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v14, 0x3Au);
    return 0;
  }
  if (a5)
  {
    unint64_t v6 = a4;
    uint64_t v8 = a5;
    do
    {
      uint64_t v9 = *v5++;
      *v6++ = [(TSDCKernelClock *)self convertFromDomainToTimeSyncTime:v9];
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      unint64_t v10 = "TSInvalidTime != timeSyncInterval";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v19 = 1024;
      int v20 = 351;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    return -1;
  }
  uint64_t validIndex = self->_validIndex;
  if (validIndex >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      unint64_t v10 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v19 = 1024;
      int v20 = 352;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    return -1;
  }
  id v5 = (char *)self + 32 * validIndex;
  unint64_t v6 = *((void *)v5 + 3);
  unint64_t v7 = *((void *)v5 + 4);
  return TSIntervalXtoIntervalY(a3, v6, v7);
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      unint64_t v10 = "TSInvalidTime != domainInterval";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v19 = 1024;
      int v20 = 365;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    return -1;
  }
  uint64_t validIndex = self->_validIndex;
  if (validIndex >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      unint64_t v10 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v19 = 1024;
      int v20 = 366;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    return -1;
  }
  id v5 = (char *)self + 32 * validIndex;
  unint64_t v7 = *((void *)v5 + 3);
  unint64_t v6 = *((void *)v5 + 4);
  return TSIntervalXtoIntervalY(a3, v6, v7);
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t validIndex = self->_validIndex;
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
  if (validIndex >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      unint64_t v10 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
      __int16 v19 = 1024;
      int v20 = 396;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
  }
  else
  {
    if (a3) {
      *a3 = self->_timeInfo[validIndex].timeSyncTimeInterval;
    }
    if (a4) {
      *a4 = self->_timeInfo[validIndex].domainTimeInterval;
    }
    if (a5) {
      *a5 = self->_timeInfo[validIndex].timeSyncTime;
    }
    if (a6) {
      *a6 = self->_timeInfo[validIndex].domainTime;
    }
  }
  return validIndex < 8;
}

- (void)_getInitialSyncInfo
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  id v0 = [0 description];
  int v1 = 136315138;
  uint64_t v2 = [v0 UTF8String];
  _os_log_error_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error getting initial sync info \"%s\"", (uint8_t *)&v1, 0xCu);
}

- (void)postLockStateChange:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v11 = [(TSDCKernelClock *)self clockIdentifier];
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) postLockStateChange:%d", buf, 0x12u);
  }
  id v5 = [(TSDCKernelClock *)self propertyUpdateQueue];

  if (v5)
  {
    unint64_t v6 = [(TSDCKernelClock *)self propertyUpdateQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__TSDCKernelClock_postLockStateChange___block_invoke;
    v8[3] = &unk_1E622AB48;
    v8[4] = self;
    int v9 = v3;
    dispatch_async(v6, v8);
  }
  else
  {
    [(TSDCKernelClock *)self setLockState:v3];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  [WeakRetained didChangeLockStateTo:v3];
}

void __39__TSDCKernelClock_postLockStateChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(a1 + 32) setLockState:*(unsigned int *)(a1 + 40)];
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
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) updateLockState:%d", (uint8_t *)&v5, 0x12u);
  }
  os_unfair_lock_lock(&self->_updateLock);
  self->_internalLockState = v3;
  if (v3 == 2)
  {
    if (self->_validIndex >= 8) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
  }
  os_unfair_lock_unlock(&self->_updateLock);
  [(TSDCKernelClock *)self postLockStateChange:v3];
}

- (void)updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  int v11 = [(TSDCKernelClock *)self lockState];
  if (a3 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v29 = "timeSyncTime != TSInvalidTime";
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2048;
    uint64_t v33 = 0;
    __int16 v34 = 2080;
    uint64_t v35 = "";
    __int16 v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v38 = 1024;
    int v39 = 496;
    uint64_t v23 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  if (a5 == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v29 = "domainTime != TSInvalidTime";
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2048;
    uint64_t v33 = 0;
    __int16 v34 = 2080;
    uint64_t v35 = "";
    __int16 v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v38 = 1024;
    int v39 = 497;
    uint64_t v23 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  if (!a4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v29 = "timeSyncInterval > 0";
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2048;
    uint64_t v33 = 0;
    __int16 v34 = 2080;
    uint64_t v35 = "";
    __int16 v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v38 = 1024;
    int v39 = 498;
    uint64_t v23 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  if (!a6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v29 = "domainInterval > 0";
    __int16 v30 = 2048;
    uint64_t v31 = 0;
    __int16 v32 = 2048;
    uint64_t v33 = 0;
    __int16 v34 = 2080;
    uint64_t v35 = "";
    __int16 v36 = 2080;
    v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCKernelClock.m";
    __int16 v38 = 1024;
    int v39 = 499;
    uint64_t v23 = MEMORY[0x1E4F14500];
LABEL_31:
    _os_log_impl(&dword_1BA88B000, v23, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    return;
  }
  unsigned int v12 = v11;
  os_unfair_lock_lock(&self->_updateLock);
  uint64_t v13 = (self->_validIndex + 1) & 7;
  uint64_t v14 = &self->super.isa + 4 * v13;
  v14[1] = (Class)a3;
  v14[2] = (Class)a5;
  v14[3] = (Class)a4;
  v14[4] = (Class)a6;
  self->_uint64_t validIndex = v13;
  unint64_t v26 = 0;
  unint64_t v27 = 0;
  [(TSDCKernelClock *)self getMachAbsoluteRateRatioNumerator:&v27 denominator:&v26 machAnchor:0 andDomainAnchor:0 withError:0];
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v26 /= info.denom;
  v27 /= info.numer;
  double v15 = (double)v27 / (double)v26;
  __int16 v16 = [(TSDCKernelClock *)self propertyUpdateQueue];

  if (v16)
  {
    __int16 v17 = [(TSDCKernelClock *)self propertyUpdateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__TSDCKernelClock_updateTimeSyncTime_timeSyncInterval_domainTime_domainInterval___block_invoke;
    block[3] = &unk_1E622AB70;
    block[4] = self;
    *(double *)&void block[5] = v15;
    dispatch_async(v17, block);
  }
  else
  {
    [(TSDCKernelClock *)self setHostRateRatio:v15];
  }
  int internalLockState = self->_internalLockState;
  if (v12 != 1 && internalLockState == 1) {
    unsigned int v20 = 1;
  }
  else {
    unsigned int v20 = v12;
  }
  if (v12 != 2 && internalLockState == 2) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = v20;
  }
  os_unfair_lock_unlock(&self->_updateLock);
  if (v12 != v22) {
    [(TSDCKernelClock *)self postLockStateChange:v22];
  }
}

void __81__TSDCKernelClock_updateTimeSyncTime_timeSyncInterval_domainTime_domainInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(a1 + 32) setHostRateRatio:*(double *)(a1 + 40)];
}

- (void)didResetClock:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = [(TSDCKernelClock *)self clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) didResetClock", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  [WeakRetained didResetClock];
}

- (void)didChangeClockMasterForClock:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = [(TSDCKernelClock *)self clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) didChangeClockMasterForClock", (uint8_t *)&v5, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  [WeakRetained didChangeClockMaster];
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = [(TSDCKernelClock *)self clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCKernelClock(0x%016llx) didChangeLockStateTo", (uint8_t *)&v6, 0xCu);
  }
  [(TSDCKernelClock *)self updateLockState:v4];
}

- (void)updateCoreAudioReanchors:(unsigned int)a3
{
}

- (unsigned)getCoreAudioReanchors
{
  return [(_TSF_TSDKernelClock *)self->_kernelClock getCoreAudioReanchors];
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (int)lockState
{
  return self->_lockState;
}

- (void)setLockState:(int)a3
{
  self->_lockState = a3;
}

- (double)hostRateRatio
{
  return self->_hostRateRatio;
}

- (void)setHostRateRatio:(double)a3
{
  self->_hostRateRatio = a3;
}

- (unsigned)validIndex
{
  return self->_validIndex;
}

- (void)setValidIndex:(unsigned int)a3
{
  self->_uint64_t validIndex = a3;
}

- (TSClock)translationClock
{
  return self->_translationClock;
}

- (void)setTranslationClock:(id)a3
{
}

- (os_unfair_lock_s)updateLock
{
  return self->_updateLock;
}

- (void)setUpdateLock:(os_unfair_lock_s)a3
{
  self->_updateLock = a3;
}

- (int)internalLockState
{
  return self->_internalLockState;
}

- (void)setInternalLockState:(int)a3
{
  self->_int internalLockState = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (void)setPropertyUpdateQueue:(id)a3
{
}

- (TSKernelClock)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  return (TSKernelClock *)WeakRetained;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_translationClock, 0);
  objc_storeStrong((id *)&self->_clockSync, 0);
  objc_storeStrong((id *)&self->_kernelClock, 0);
}

@end