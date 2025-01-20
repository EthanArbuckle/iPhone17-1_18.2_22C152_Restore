@interface NFCALogger
+ (id)sharedCALogger;
+ (unsigned)getBatteryPercent;
- (BOOL)_incrementMiddlewareExceptionCountWithReset:(BOOL)a3;
- (BOOL)restrictedMode;
- (NFCALogger)init;
- (id)generateDailyUUIDForCA;
- (id)generateUUID;
- (id)getCALoggerUserDefaults;
- (unint64_t)getMiddlewareExceptionCount;
- (unsigned)getDurationFrom:(unint64_t)a3;
- (unsigned)getHardwareTypeForCA:(unsigned int)a3;
- (void)getCAUniversityCode:(id)a3 universityCodes:(unsigned int *)a4;
- (void)postCAEventFor:(id)a3 eventInput:(id)a4;
- (void)removeRestrictedMode;
- (void)resetCALoadStackExceptionCount;
- (void)setRestrictedMode:(BOOL)a3;
@end

@implementation NFCALogger

id __40__NFCALogger_postCAEventFor_eventInput___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)sharedCALogger
{
  if (qword_1EB4D2758 != -1) {
    dispatch_once(&qword_1EB4D2758, &__block_literal_global);
  }
  v2 = (void *)_MergedGlobals_0;

  return v2;
}

- (unsigned)getDurationFrom:(unint64_t)a3
{
  uint64_t v4 = mach_continuous_time();
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  if ((v4 - a3) * info.numer / (1000000 * (unint64_t)info.denom) >= 0xFFFFFFFF) {
    LODWORD(v5) = -1;
  }
  else {
    return (v4 - a3) * info.numer / (1000000 * (unint64_t)info.denom);
  }
  return v5;
}

- (void)postCAEventFor:(id)a3 eventInput:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__NFCALogger_postCAEventFor_eventInput___block_invoke;
    v11[3] = &unk_1E65AB900;
    id v12 = v6;
    id v7 = v5;
    v8 = v11;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    v9 = (void (*)(id, void *))off_1EB4D2760;
    v17 = off_1EB4D2760;
    if (!off_1EB4D2760)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getAnalyticsSendEventLazySymbolLoc_block_invoke;
      v13[3] = &unk_1E65AB928;
      v13[4] = &v14;
      __getAnalyticsSendEventLazySymbolLoc_block_invoke((uint64_t)v13);
      v9 = (void (*)(id, void *))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v9)
    {
      dlerror();
      v10 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v14, 8);
      _Unwind_Resume(v10);
    }
    v9(v7, v8);
  }
}

uint64_t __28__NFCALogger_sharedCALogger__block_invoke()
{
  _MergedGlobals_0 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (NFCALogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)NFCALogger;
  return [(NFCALogger *)&v3 init];
}

- (id)getCALoggerUserDefaults
{
  userDefault = self->_userDefault;
  if (!userDefault)
  {
    uint64_t v4 = (NSUserDefaults *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.stockholm.analytics"];
    id v5 = self->_userDefault;
    self->_userDefault = v4;

    userDefault = self->_userDefault;
  }

  return userDefault;
}

- (id)generateDailyUUIDForCA
{
  v2 = [(NFCALogger *)self getCALoggerUserDefaults];
  objc_super v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 stringForKey:@"dailyDeviceUUID"];
    id v5 = [v3 objectForKey:@"uuidUpdateDate"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([MEMORY[0x1E4F1C9A8] currentCalendar],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 isDateInToday:v5],
          v6,
          !v4)
      || (v7 & 1) == 0)
    {
      v8 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v9 = [v8 UUIDString];

      if (v9)
      {
        [v3 setObject:v9 forKey:@"dailyDeviceUUID"];
        v10 = [MEMORY[0x1E4F1C9C8] date];
        [v3 setObject:v10 forKey:@"uuidUpdateDate"];

        [v3 synchronize];
        uint64_t v4 = (void *)v9;
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setRestrictedMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NFCALogger *)self getCALoggerUserDefaults];
  if (v5)
  {
    uint64_t v4 = [NSNumber numberWithBool:v3];
    [v5 setObject:v4 forKey:@"eSEInRestrictedMode"];

    [v5 synchronize];
  }
}

- (BOOL)restrictedMode
{
  v2 = [(NFCALogger *)self getCALoggerUserDefaults];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKey:@"eSEInRestrictedMode"];
    id v5 = v4;
    if (v4 && [v4 BOOLValue]) {
      char v6 = [v5 BOOLValue];
    }
    else {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)removeRestrictedMode
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(NFCALogger *)self getCALoggerUserDefaults];
  id v5 = v4;
  if (v4)
  {
    char v6 = [v4 objectForKey:@"eSEInRestrictedMode"];
    if (v6)
    {
      [v5 removeObjectForKey:@"eSEInRestrictedMode"];
      [v5 synchronize];
    }
    else
    {
      char v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific >= 4) {
        __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
      }
      uint64_t v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v9)
      {
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v13 = 45;
        if (isMetaClass) {
          uint64_t v13 = 43;
        }
        v9(3, "%c[%{public}s %{public}s]:%i Restricted mode for eSE is NOT set!", v13, ClassName, Name, 177);
        char v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      uint64_t v14 = dispatch_get_specific(v7);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v15 = (id)_NFSharedLogClient[(void)v14];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = object_getClass(self);
        if (class_isMetaClass(v16)) {
          int v17 = 43;
        }
        else {
          int v17 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v20 = v17;
        __int16 v21 = 2082;
        v22 = object_getClassName(self);
        __int16 v23 = 2082;
        v24 = sel_getName(a2);
        __int16 v25 = 1024;
        int v26 = 177;
        _os_log_impl(&dword_1CA51A000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Restricted mode for eSE is NOT set!", buf, 0x22u);
      }
    }
  }
}

- (unsigned)getHardwareTypeForCA:(unsigned int)a3
{
  if (a3 - 5 > 0xF) {
    return 0;
  }
  else {
    return dword_1CA544A14[a3 - 5];
  }
}

- (id)generateUUID
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = 0;
  v2 = [MEMORY[0x1E4F29128] UUID];
  [v2 getUUIDBytes:v5];

  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 length:16];

  return v3;
}

+ (unsigned)getBatteryPercent
{
  return 100;
}

- (void)getCAUniversityCode:(id)a3 universityCodes:(unsigned int *)a4
{
  id v5 = a3;
  char v6 = v5;
  *a4 = 0;
  if (v5 && [v5 count])
  {
    unsigned int v11 = 0;
    char v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [v7 NF_asHexString];
    uint64_t v9 = [MEMORY[0x1E4F28FE8] scannerWithString:v8];
    [v9 scanHexInt:&v11];
    uint64_t v10 = 0;
    while (v11 < gUniversityCodes[v10] || v11 > gUniversityCodes[v10 + 1])
    {
      v10 += 3;
      if (v10 == 15) {
        goto LABEL_9;
      }
    }
    *a4 = LOWORD(gUniversityCodes[v10 + 2]);
LABEL_9:
  }
}

- (unint64_t)getMiddlewareExceptionCount
{
  v2 = [(NFCALogger *)self getCALoggerUserDefaults];
  BOOL v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 integerForKey:@"middlewareExceptionCount"];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)resetCALoadStackExceptionCount
{
}

- (BOOL)_incrementMiddlewareExceptionCountWithReset:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NFCALogger *)self getCALoggerUserDefaults];
  char v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if (!v3)
  {
    unint64_t v7 = [(NFCALogger *)self getMiddlewareExceptionCount];
    if (v7 <= 9)
    {
      v8 = [NSNumber numberWithUnsignedInteger:v7 + 1];
      [v6 setObject:v8 forKey:@"middlewareExceptionCount"];

      goto LABEL_6;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  [v5 setObject:&unk_1F24D1E20 forKey:@"middlewareExceptionCount"];
LABEL_6:
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (void).cxx_destruct
{
}

@end