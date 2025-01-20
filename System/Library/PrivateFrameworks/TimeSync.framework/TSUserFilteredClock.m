@interface TSUserFilteredClock
+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4;
+ (id)keyPathsForValuesAffectingAdaptive;
+ (id)keyPathsForValuesAffectingFilterShift;
+ (id)keyPathsForValuesAffectingNominalDomainInterval;
+ (id)keyPathsForValuesAffectingNominalMachInterval;
- (BOOL)addTimestampWithMachAbsolute:(unint64_t)a3 andDomainTime:(unint64_t)a4 error:(id *)a5;
- (BOOL)isAdaptive;
- (BOOL)resetFilterToNominal:(BOOL)a3 error:(id *)a4;
- (BOOL)resetSyncServiceWithError:(id *)a3;
- (BOOL)waitTimeSyncTimeUpdate;
- (TSUserFilteredClock)initWithImplDC:(id)a3;
- (unint64_t)nominalDomainInterval;
- (unint64_t)nominalMachInterval;
- (unsigned)filterShift;
@end

@implementation TSUserFilteredClock

- (TSUserFilteredClock)initWithImplDC:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v10 = "[kernelClock isKindOfClass:[TSDCUserFilteredClock class]]";
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2080;
      v16 = "";
      __int16 v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSUserFilteredClock.m";
      __int16 v19 = 1024;
      int v20 = 47;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    id v5 = 0;
    goto LABEL_4;
  }
  v8.receiver = self;
  v8.super_class = (Class)TSUserFilteredClock;
  id v5 = [(TSKernelClock *)&v8 initWithImplDC:v4];
  if (v5)
  {
    id v6 = v4;
    self = (TSUserFilteredClock *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v6;
LABEL_4:
  }
  return (TSUserFilteredClock *)v5;
}

- (BOOL)addTimestampWithMachAbsolute:(unint64_t)a3 andDomainTime:(unint64_t)a4 error:(id *)a5
{
  return [(TSDCUserFilteredClock *)self->_impl addTimestampWithMachAbsolute:a3 andDomainTime:a4 error:a5];
}

- (BOOL)resetSyncServiceWithError:(id *)a3
{
  return [(TSDCUserFilteredClock *)self->_impl resetSyncServiceWithError:a3];
}

- (BOOL)resetFilterToNominal:(BOOL)a3 error:(id *)a4
{
  return [(TSDCUserFilteredClock *)self->_impl resetFilterToNominal:a3 error:a4];
}

+ (id)keyPathsForValuesAffectingNominalMachInterval
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.nominalMachInterval", 0);
}

- (unint64_t)nominalMachInterval
{
  return [(TSDCUserFilteredClock *)self->_impl nominalMachInterval];
}

+ (id)keyPathsForValuesAffectingNominalDomainInterval
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.nominalDomainInterval", 0);
}

- (unint64_t)nominalDomainInterval
{
  return [(TSDCUserFilteredClock *)self->_impl nominalDomainInterval];
}

+ (id)keyPathsForValuesAffectingFilterShift
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.filterShift", 0);
}

- (unsigned)filterShift
{
  return [(TSDCUserFilteredClock *)self->_impl filterShift];
}

+ (id)keyPathsForValuesAffectingAdaptive
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_impl.adaptive", 0);
}

- (BOOL)isAdaptive
{
  return [(TSDCUserFilteredClock *)self->_impl isAdaptive];
}

- (BOOL)waitTimeSyncTimeUpdate
{
  impl = self->_impl;
  if (impl) {
    LOBYTE(impl) = [(TSDCUserFilteredClock *)impl waitTimeSyncTimeUpdate];
  }
  return (char)impl;
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___TSUserFilteredClock;
  objc_super v8 = objc_msgSendSuper2(&v17, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  [v8 appendFormat:@"%@    Nominal Mach Interval: ", v7];
  v9 = [v6 objectForKeyedSubscript:@"NominalMachInterval"];
  v10 = v9;
  if (v9) {
    objc_msgSend(v8, "appendFormat:", @"%llu\n", objc_msgSend(v9, "unsignedLongLongValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Nominal Domain Interval: ", v7];
  __int16 v11 = [v6 objectForKeyedSubscript:@"NominalDomainInterval"];

  if (v11) {
    objc_msgSend(v8, "appendFormat:", @"%llu\n", objc_msgSend(v11, "unsignedLongLongValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Filter Shift: ", v7];
  uint64_t v12 = [v6 objectForKeyedSubscript:@"FilterShift"];

  if (v12) {
    objc_msgSend(v8, "appendFormat:", @"%hu\n", objc_msgSend(v12, "unsignedShortValue"));
  }
  else {
    [v8 appendString:@"Could not read property\n"];
  }
  [v8 appendFormat:@"%@    Adaptive: ", v7];
  __int16 v13 = [v6 objectForKeyedSubscript:@"Adaptive"];

  if (v13)
  {
    int v14 = [v13 BOOLValue];
    __int16 v15 = @"NO";
    if (v14) {
      __int16 v15 = @"YES";
    }
    [v8 appendFormat:@"%@\n", v15];
  }
  else
  {
    [v8 appendString:@"Could not read property\n"];
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end