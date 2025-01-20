@interface TSXTranslationClock
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (NSString)clockName;
- (OS_dispatch_queue)propertyUpdateQueue;
- (TSXTranslationClock)init;
- (TSXTranslationClock)initWithClockIdentifier:(unint64_t)a3;
- (double)hostRateRatio;
- (int)lockState;
- (unint64_t)clockIdentifier;
- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3;
- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3;
- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3;
- (void)_changedClockMaster;
- (void)_updateLockState:(int)a3;
- (void)_updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6;
- (void)setHostRateRatio:(double)a3;
- (void)setLockState:(int)a3;
- (void)setPropertyUpdateQueue:(id)a3;
@end

@implementation TSXTranslationClock

- (TSXTranslationClock)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  v4 = [NSString stringWithUTF8String:"-[TSXTranslationClock init]"];
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"Do not call %@", v4 format];

  return 0;
}

- (TSXTranslationClock)initWithClockIdentifier:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSXTranslationClock;
  v4 = [(TSXTranslationClock *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_clockIdentifier = a3;
    v4->_validIndex = -1;
    mach_timebase_info(&v4->_timebaseInfo);
    v5->_updateLock._os_unfair_lock_opaque = 0;
    LODWORD(v6) = v5->_timebaseInfo.numer;
    LODWORD(v7) = v5->_timebaseInfo.denom;
    v5->_hostRateRatio = (double)v6 / (double)v7;
  }
  return v5;
}

- (unint64_t)machAbsoluteTicksToNanoseconds:(unint64_t)a3
{
  uint64_t numer = self->_timebaseInfo.numer;
  if (numer != self->_timebaseInfo.denom)
  {
    *(void *)&long long v7 = IOTS_uint64mul(a3, numer);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.denom;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
}

- (unint64_t)machAbsoluteNanosecondsToTicks:(unint64_t)a3
{
  uint64_t denom = self->_timebaseInfo.denom;
  if (self->_timebaseInfo.numer != denom)
  {
    *(void *)&long long v7 = IOTS_uint64mul(a3, denom);
    *((void *)&v7 + 1) = v5;
    v8[0] = self->_timebaseInfo.numer;
    v8[1] = 0;
    return IOTS_U128::operator/(&v7, v8);
  }
  return a3;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    __int16 v24 = 1024;
    int v25 = 132;
    v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  uint64_t v5 = a4;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    __int16 v24 = 1024;
    int v25 = 133;
    v12 = MEMORY[0x1E4F14500];
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
      *v5++ = [(TSXTranslationClock *)self machAbsoluteTicksToNanoseconds:v9];
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    __int16 v24 = 1024;
    int v25 = 150;
    v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  uint64_t v5 = a3;
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
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    __int16 v24 = 1024;
    int v25 = 151;
    v12 = MEMORY[0x1E4F14500];
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
      *v6++ = [(TSXTranslationClock *)self machAbsoluteNanosecondsToTicks:v9];
      --v8;
    }
    while (v8);
  }
  return 1;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a3) {
    *a3 = self->_timebaseInfo.numer;
  }
  if (a4) {
    *a4 = self->_timebaseInfo.denom;
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
      v12 = "TSInvalidTime != timeSyncTime";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      __int16 v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v21 = 1024;
      int v22 = 201;
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
      v12 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      __int16 v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v21 = 1024;
      int v22 = 202;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
    }
    return -1;
  }
  uint64_t v5 = &self->super.isa + 4 * validIndex;
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
      v12 = "TSInvalidTime != domainTime";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      __int16 v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v21 = 1024;
      int v22 = 215;
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
      v12 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      __int16 v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v21 = 1024;
      int v22 = 216;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
    }
    return -1;
  }
  uint64_t v5 = &self->super.isa + 4 * validIndex;
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
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    __int16 v24 = 1024;
    int v25 = 228;
    v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  uint64_t v5 = a4;
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
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    __int16 v24 = 1024;
    int v25 = 229;
    v12 = MEMORY[0x1E4F14500];
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
      *v5++ = [(TSXTranslationClock *)self convertFromTimeSyncToDomainTime:v9];
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
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    __int16 v24 = 1024;
    int v25 = 246;
    v12 = MEMORY[0x1E4F14500];
    goto LABEL_12;
  }
  uint64_t v5 = a3;
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
    uint64_t v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
    __int16 v24 = 1024;
    int v25 = 247;
    v12 = MEMORY[0x1E4F14500];
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
      *v6++ = [(TSXTranslationClock *)self convertFromDomainToTimeSyncTime:v9];
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
      v10 = "TSInvalidTime != timeSyncInterval";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v19 = 1024;
      int v20 = 265;
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
      v10 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v19 = 1024;
      int v20 = 266;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    return -1;
  }
  uint64_t v5 = (char *)self + 32 * validIndex;
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
      v10 = "TSInvalidTime != domainInterval";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v19 = 1024;
      int v20 = 279;
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
      v10 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v19 = 1024;
      int v20 = 280;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    }
    return -1;
  }
  uint64_t v5 = (char *)self + 32 * validIndex;
  unint64_t v7 = *((void *)v5 + 3);
  unint64_t v6 = *((void *)v5 + 4);
  return TSIntervalXtoIntervalY(a3, v6, v7);
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t validIndex = self->_validIndex;
  if (validIndex >= 8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316418;
      v10 = "workingIndex < INFO_ENTRY_COUNT";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      __int16 v16 = "";
      __int16 v17 = 2080;
      __int16 v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/XPC/TSXTranslationClock.mm";
      __int16 v19 = 1024;
      int v20 = 293;
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

- (void)_updateLockState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v11 = [(TSXTranslationClock *)self clockIdentifier];
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSXTranslationClock(0x%016llx) updateLockState:%d", buf, 0x12u);
  }
  uint64_t v5 = [(TSXTranslationClock *)self propertyUpdateQueue];
  BOOL v6 = v5 == 0;

  if (v6)
  {
    [(TSXTranslationClock *)self setLockState:v3];
  }
  else
  {
    unint64_t v7 = [(TSXTranslationClock *)self propertyUpdateQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    unint64_t v8[2] = __40__TSXTranslationClock__updateLockState___block_invoke;
    v8[3] = &unk_1E622B388;
    v8[4] = self;
    int v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __40__TSXTranslationClock__updateLockState___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9F1DF0]();
  [*(id *)(a1 + 32) setLockState:*(unsigned int *)(a1 + 40)];
}

- (void)_updateTimeSyncTime:(unint64_t)a3 timeSyncInterval:(unint64_t)a4 domainTime:(unint64_t)a5 domainInterval:(unint64_t)a6
{
  p_updateLock = &self->_updateLock;
  os_unfair_lock_lock(&self->_updateLock);
  uint64_t v12 = (self->_validIndex + 1) & 7;
  int v13 = &self->super.isa + 4 * v12;
  v13[1] = (Class)a3;
  v13[2] = (Class)a5;
  v13[3] = (Class)a4;
  v13[4] = (Class)a6;
  self->_uint64_t validIndex = v12;
  os_unfair_lock_unlock(p_updateLock);
}

- (void)_changedClockMaster
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    unint64_t v4 = [(TSXTranslationClock *)self clockIdentifier];
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSXTranslationClock(0x%016llx) changedClockMaster", (uint8_t *)&v3, 0xCu);
  }
  os_unfair_lock_lock(&self->_updateLock);
  self->_uint64_t validIndex = -1;
  os_unfair_lock_unlock(&self->_updateLock);
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
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

- (NSString)clockName
{
  return self->_clockName;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (void)setPropertyUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_clockName, 0);
}

@end