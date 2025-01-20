@interface TSDCUserFilteredClock
- (BOOL)addTimestampWithMachAbsolute:(unint64_t)a3 andDomainTime:(unint64_t)a4 error:(id *)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)isAdaptive;
- (BOOL)resetFilterToNominal:(BOOL)a3 error:(id *)a4;
- (BOOL)resetSyncServiceWithError:(id *)a3;
- (BOOL)waitTimeSyncTimeUpdate;
- (TSDCUserFilteredClock)initWithKernelClock:(id)a3;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3;
- (unint64_t)nominalDomainInterval;
- (unint64_t)nominalMachInterval;
- (unsigned)filterShift;
@end

@implementation TSDCUserFilteredClock

- (TSDCUserFilteredClock)initWithKernelClock:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDCUserFilteredClock;
    v6 = [(TSDCKernelClock *)&v8 initWithKernelClock:v5];
    self = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_userFilteredClock, a3);
    }
    self->_lastValidIndex = -1;
    self->_needTimeSyncTimeUpdate = 0;
  }

  return self;
}

- (BOOL)waitTimeSyncTimeUpdate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_needTimeSyncTimeUpdate) {
    return 1;
  }
  unsigned int v3 = (self->_lastValidIndex + 1) & 7;
  if ([(TSDCKernelClock *)self validIndex] == v3)
  {
    unsigned int v4 = 0;
    BOOL v5 = 1;
LABEL_8:
    if (v4 < 2) {
      return 1;
    }
  }
  else
  {
    unsigned int v6 = -1;
    while (1)
    {
      usleep(0x2710u);
      if (v6 == 98) {
        break;
      }
      ++v6;
      if ([(TSDCKernelClock *)self validIndex] == v3)
      {
        BOOL v5 = v6 < 0x63;
        unsigned int v4 = v6 + 1;
        goto LABEL_8;
      }
    }
    BOOL v5 = 0;
    unsigned int v4 = 100;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = 10000 * v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "waitTimeSyncTimeUpdate delayed %u us\n", (uint8_t *)v8, 8u);
  }
  return v5;
}

- (BOOL)addTimestampWithMachAbsolute:(unint64_t)a3 andDomainTime:(unint64_t)a4 error:(id *)a5
{
  self->_needTimeSyncTimeUpdate = 1;
  self->_lastValidIndex = [(TSDCKernelClock *)self validIndex];
  userFilteredClock = self->_userFilteredClock;
  return [(_TSF_TSDUserFilteredClock *)userFilteredClock addTimestampWithMachAbsolute:a3 andDomainTime:a4 error:a5];
}

- (BOOL)resetSyncServiceWithError:(id *)a3
{
  return [(_TSF_TSDUserFilteredClock *)self->_userFilteredClock resetSyncServiceWithError:a3];
}

- (BOOL)resetFilterToNominal:(BOOL)a3 error:(id *)a4
{
  return [(_TSF_TSDUserFilteredClock *)self->_userFilteredClock resetFilterToNominal:a3 error:a4];
}

- (unint64_t)nominalMachInterval
{
  return [(_TSF_TSDUserFilteredClock *)self->_userFilteredClock nominalMachInterval];
}

- (unint64_t)nominalDomainInterval
{
  return [(_TSF_TSDUserFilteredClock *)self->_userFilteredClock nominalDomainInterval];
}

- (unsigned)filterShift
{
  return [(_TSF_TSDUserFilteredClock *)self->_userFilteredClock filterShift];
}

- (BOOL)isAdaptive
{
  return [(_TSF_TSDUserFilteredClock *)self->_userFilteredClock isAdaptive];
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(TSDCKernelClock *)self getOsLog];
  unint64_t v6 = [(TSDCKernelClock *)self getSignpostId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      int v13 = 136315138;
      v14 = "-[TSDCUserFilteredClock convertFromMachAbsoluteToDomainTime:]";
      _os_signpost_emit_with_name_impl(&dword_1BA88B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v13, 0xCu);
    }
  }

  unint64_t v8 = [(TSDCKernelClock *)self convertFromTimeSyncToDomainTime:a3];
  uint64_t v9 = [(TSDCKernelClock *)self getOsLog];
  unint64_t v10 = [(TSDCKernelClock *)self getSignpostId];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      int v13 = 136315650;
      v14 = "-[TSDCUserFilteredClock convertFromMachAbsoluteToDomainTime:]";
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      __int16 v17 = 2048;
      unint64_t v18 = v8;
      _os_signpost_emit_with_name_impl(&dword_1BA88B000, v9, OS_SIGNPOST_INTERVAL_END, v11, (const char *)&unk_1BA8E2971, "%s machAbsoluteTime=%llu domainTime=%llu", (uint8_t *)&v13, 0x20u);
    }
  }

  return v8;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(TSDCKernelClock *)self getOsLog];
  unint64_t v6 = [(TSDCKernelClock *)self getSignpostId];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      int v13 = 136315138;
      v14 = "-[TSDCUserFilteredClock convertFromDomainToMachAbsoluteTime:]";
      _os_signpost_emit_with_name_impl(&dword_1BA88B000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, (const char *)&unk_1BA8E2971, "%s", (uint8_t *)&v13, 0xCu);
    }
  }

  unint64_t v8 = [(TSDCKernelClock *)self convertFromDomainToTimeSyncTime:a3];
  uint64_t v9 = [(TSDCKernelClock *)self getOsLog];
  unint64_t v10 = [(TSDCKernelClock *)self getSignpostId];
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      int v13 = 136315650;
      v14 = "-[TSDCUserFilteredClock convertFromDomainToMachAbsoluteTime:]";
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      __int16 v17 = 2048;
      unint64_t v18 = v8;
      _os_signpost_emit_with_name_impl(&dword_1BA88B000, v9, OS_SIGNPOST_INTERVAL_END, v11, (const char *)&unk_1BA8E2971, "%s domainTime=%llu machAbsoluteTime=%llu", (uint8_t *)&v13, 0x20u);
    }
  }

  return v8;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(TSDCKernelClock *)self getTimeSyncTimeRateRatioNumerator:a3 denominator:a4 timeSyncAnchor:a5 andDomainAnchor:a6 withError:a7];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136316418;
    unint64_t v10 = "[self getTimeSyncTimeRateRatioNumerator:numerator denominator:denominator timeSyncAnchor:machAnchor andDomainA"
          "nchor:domainAnchor withError:error]";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    unint64_t v16 = "";
    __int16 v17 = 2080;
    unint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/DC/TSDCUserFilteredClock.m";
    __int16 v19 = 1024;
    int v20 = 141;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end