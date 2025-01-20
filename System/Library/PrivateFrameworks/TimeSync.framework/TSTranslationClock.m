@interface TSTranslationClock
+ (id)keyPathsForValuesAffectingHostRateRatio;
+ (id)keyPathsforvaluesaffectingLockState;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5;
- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7;
- (TSTranslationClock)initWithTranslationClock:(id)a3;
- (double)hostRateRatio;
- (int)lockState;
- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3;
- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3;
- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3;
- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3;
- (void)setPropertyUpdateQueue:(id)a3;
@end

@implementation TSTranslationClock

- (TSTranslationClock)initWithTranslationClock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v13 = "kernelClock != nil";
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      __int16 v18 = 2080;
      v19 = "";
      __int16 v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSTranslationClock.m";
      __int16 v22 = 1024;
      int v23 = 35;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v8 = 0;
    goto LABEL_4;
  }
  v11.receiver = self;
  v11.super_class = (Class)TSTranslationClock;
  v7 = -[TSClock initWithClockIdentifier:](&v11, sel_initWithClockIdentifier_, [v5 clockIdentifier]);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_impl, a3);
    v10.receiver = v8;
    v10.super_class = (Class)TSTranslationClock;
    self = [(TSClock *)&v10 propertyUpdateQueue];
    [(TSXTranslationClock *)v8->_impl setPropertyUpdateQueue:self];
LABEL_4:
  }
  return v8;
}

- (void)setPropertyUpdateQueue:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTranslationClock;
  [(TSClock *)&v6 setPropertyUpdateQueue:a3];
  v5.receiver = self;
  v5.super_class = (Class)TSTranslationClock;
  v4 = [(TSClock *)&v5 propertyUpdateQueue];
  [(TSXTranslationClock *)self->_impl setPropertyUpdateQueue:v4];
}

+ (id)keyPathsforvaluesaffectingLockState
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.lockState", 0);
}

- (int)lockState
{
  return [(TSXTranslationClock *)self->_impl lockState];
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3
{
  return [(TSXTranslationClock *)self->_impl convertFromMachAbsoluteToDomainTime:a3];
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3
{
  return [(TSXTranslationClock *)self->_impl convertFromDomainToMachAbsoluteTime:a3];
}

- (BOOL)convertFromMachAbsoluteTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSXTranslationClock *)self->_impl convertFromMachAbsoluteTime:a3 toDomainTime:a4 withCount:*(void *)&a5];
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSXTranslationClock *)self->_impl convertFromDomainTime:a3 toMachAbsoluteTime:a4 withCount:*(void *)&a5];
}

- (unint64_t)convertFromMachAbsoluteIntervalToDomainInterval:(unint64_t)a3
{
  return [(TSXTranslationClock *)self->_impl convertFromMachAbsoluteIntervalToDomainInterval:a3];
}

- (unint64_t)convertFromDomainIntervalToMachAbsoluteInterval:(unint64_t)a3
{
  return [(TSXTranslationClock *)self->_impl convertFromDomainIntervalToMachAbsoluteInterval:a3];
}

+ (id)keyPathsForValuesAffectingHostRateRatio
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.hostRateRatio", 0);
}

- (double)hostRateRatio
{
  [(TSXTranslationClock *)self->_impl hostRateRatio];
  return result;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return [(TSXTranslationClock *)self->_impl getMachAbsoluteRateRatioNumerator:a3 denominator:a4 machAnchor:a5 andDomainAnchor:a6 withError:a7];
}

- (unint64_t)convertFromTimeSyncToDomainTime:(unint64_t)a3
{
  return [(TSXTranslationClock *)self->_impl convertFromTimeSyncToDomainTime:a3];
}

- (unint64_t)convertFromDomainToTimeSyncTime:(unint64_t)a3
{
  return [(TSXTranslationClock *)self->_impl convertFromDomainToTimeSyncTime:a3];
}

- (BOOL)convertFromTimeSyncTime:(unint64_t *)a3 toDomainTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSXTranslationClock *)self->_impl convertFromTimeSyncTime:a3 toDomainTime:a4 withCount:*(void *)&a5];
}

- (BOOL)convertFromDomainTime:(unint64_t *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  return [(TSXTranslationClock *)self->_impl convertFromDomainTime:a3 toTimeSyncTime:a4 withCount:*(void *)&a5];
}

- (unint64_t)convertFromTimeSyncTimeIntervalToDomainInterval:(unint64_t)a3
{
  return [(TSXTranslationClock *)self->_impl convertFromTimeSyncTimeIntervalToDomainInterval:a3];
}

- (unint64_t)convertFromDomainIntervalToTimeSyncTimeInterval:(unint64_t)a3
{
  return [(TSXTranslationClock *)self->_impl convertFromDomainIntervalToTimeSyncTimeInterval:a3];
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 withError:(id *)a7
{
  return [(TSXTranslationClock *)self->_impl getTimeSyncTimeRateRatioNumerator:a3 denominator:a4 timeSyncAnchor:a5 andDomainAnchor:a6 withError:a7];
}

- (void).cxx_destruct
{
}

@end