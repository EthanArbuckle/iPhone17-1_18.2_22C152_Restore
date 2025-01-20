@interface PLTimeReferenceKernel
- (BOOL)rebootOccurred;
- (NSDate)lastKernelTimeRecalibrated;
- (NSDate)lastSystemTimeRecalibrated;
- (double)resolution;
- (id)currentTime;
- (mach_timebase_info)getTimebaseInfo;
- (unint64_t)continuousTimeToAbsoluteNs:(unint64_t)a3;
- (void)currentTime;
- (void)initializeOffsetWithEntries:(id)a3;
- (void)quarantineWithExitReason:(signed __int16)a3;
- (void)setLastKernelTimeRecalibrated:(id)a3;
- (void)setLastSystemTimeRecalibrated:(id)a3;
- (void)setRebootOccurred:(BOOL)a3;
- (void)setSystemReboot:(BOOL)a3;
@end

@implementation PLTimeReferenceKernel

- (id)currentTime
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (currentTime_onceToken != -1) {
    dispatch_once(&currentTime_onceToken, &__block_literal_global_45);
  }
  v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [(PLTimeReferenceKernel *)self lastSystemTimeRecalibrated];
  if (!v4) {
    goto LABEL_8;
  }
  v5 = (void *)v4;
  v6 = [(PLTimeReferenceKernel *)self lastSystemTimeRecalibrated];
  [v3 timeIntervalSinceDate:v6];
  double v8 = v7;

  if (v8 >= 0.0 && v8 < 30.0)
  {
    v12 = [(PLTimeReferenceKernel *)self lastKernelTimeRecalibrated];
    v13 = [v12 dateByAddingTimeInterval:v8];

    v14 = PLLogTimeManager();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v19 = [(PLTimeReferenceKernel *)self lastSystemTimeRecalibrated];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v3;
      __int16 v22 = 2112;
      v23 = v19;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_debug_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEBUG, "Linear approximation: systemNow=%@, lastSystemTimeRecalibrated=%@, currentTime=%@", buf, 0x20u);
    }
  }
  else
  {
LABEL_8:
    size_t v20 = 8;
    *(void *)buf = 0;
    if (sysctl(currentTime_mib, currentTime_miblen, buf, &v20, 0, 0))
    {
      v10 = PLLogTimeManager();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PLTimeReferenceKernel currentTime]();
      }

      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    }
    else
    {
      double v15 = (double)*(unint64_t *)buf / 1000000.0;
      [(PLTimeReferenceKernel *)self resolution];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v15 + v16 * 0.5];
    }
    v13 = (void *)v11;
    [(PLTimeReferenceKernel *)self setLastSystemTimeRecalibrated:v3];
    [(PLTimeReferenceKernel *)self setLastKernelTimeRecalibrated:v13];
    v17 = PLLogTimeManager();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      [(PLTimeReferenceKernel *)(uint64_t)v3 currentTime];
    }
  }
  return v13;
}

- (NSDate)lastSystemTimeRecalibrated
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)lastKernelTimeRecalibrated
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastSystemTimeRecalibrated:(id)a3
{
}

- (void)setLastKernelTimeRecalibrated:(id)a3
{
}

- (double)resolution
{
  if (resolution_onceToken != -1) {
    dispatch_once(&resolution_onceToken, &__block_literal_global_14);
  }
  return *(double *)&resolution_sInterval;
}

- (void)initializeOffsetWithEntries:(id)a3
{
  id v4 = a3;
  v5 = [(PLTimeReferenceKernel *)self currentTime];
  if (v4 && [v4 count])
  {
    v6 = [v4 lastObject];
    double v7 = [v6 objectForKeyedSubscript:@"system"];
    [v7 doubleValue];
    double v9 = v8;

    v10 = [v6 objectForKeyedSubscript:@"kernel"];
    [v10 doubleValue];
    double v12 = v11;

    v13 = [v6 entryDate];
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)PLTimeReferenceKernel;
    v14 = objc_msgSend(-[PLTimeReferenceKernel class](&v36, sel_class), "defaultsKeyFromEntryDefinitionKey:", @"system");
    double v15 = +[PLDefaults objectForKey:v14];
    [v15 doubleValue];
    double v9 = v16;

    v35.receiver = self;
    v35.super_class = (Class)PLTimeReferenceKernel;
    v17 = objc_msgSend(-[PLTimeReferenceKernel class](&v35, sel_class), "defaultsKeyFromEntryDefinitionKey:", @"kernel");
    v18 = +[PLDefaults objectForKey:v17];
    [v18 doubleValue];
    double v12 = v19;

    size_t v20 = (void *)MEMORY[0x1E4F1C9C8];
    v34.receiver = self;
    v34.super_class = (Class)PLTimeReferenceKernel;
    v21 = objc_msgSend(-[PLTimeReferenceKernel class](&v34, sel_class), "defaultsKeyFromEntryDefinitionKey:", @"monotonic");
    __int16 v22 = +[PLDefaults objectForKey:v21];
    [v22 doubleValue];
    v13 = objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
  }
  if (v9 == 0.0 || (v12 != 0.0 ? (BOOL v23 = v13 == 0) : (BOOL v23 = 1), v23))
  {
    __int16 v24 = [(PLTimeReference *)self timeManager];
    v27 = [v24 initialMonotonicTime];
    [v5 timeIntervalSinceDate:v27];
    -[PLTimeReference setOffset:](&v31, sel_setOffset_, self, PLTimeReferenceKernel);
  }
  else
  {
    __int16 v24 = [v13 dateByAddingTimeInterval:v12];
    [v5 timeIntervalSinceDate:v24];
    if (v25 >= 0.0)
    {
      v32.receiver = self;
      v32.super_class = (Class)PLTimeReferenceKernel;
      [(PLTimeReference *)&v32 setOffset:v12];
      goto LABEL_19;
    }
    uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
    v27 = [v26 dateByAddingTimeInterval:-v9];

    [v27 timeIntervalSinceDate:v13];
    double v29 = v28;
    v30 = PLLogTimeManager();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[PLTimeReferenceKernel initializeOffsetWithEntries:](v29 < 0.0, v30);
    }

    if (v29 < 0.0) {
      [(PLTimeReferenceKernel *)self quarantineWithExitReason:1006];
    }
    [v5 timeIntervalSinceDate:v27];
    v33.receiver = self;
    v33.super_class = (Class)PLTimeReferenceKernel;
    -[PLTimeReference setOffset:](&v33, sel_setOffset_, v31.receiver, v31.super_class);
  }

LABEL_19:
}

- (void)quarantineWithExitReason:(signed __int16)a3
{
  uint64_t v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLTimeReferenceKernel;
  v5 = objc_msgSend(-[PLTimeReferenceKernel class](&v13, sel_class), "defaultsKeyFromEntryDefinitionKey:", @"monotonic");
  +[PLDefaults setObject:0 forKey:v5 saveToDisk:1];

  v12.receiver = self;
  v12.super_class = (Class)PLTimeReferenceKernel;
  v6 = objc_msgSend(-[PLTimeReferenceKernel class](&v12, sel_class), "defaultsKeyFromEntryDefinitionKey:", @"kernel");
  +[PLDefaults setObject:0 forKey:v6 saveToDisk:1];

  v11.receiver = self;
  v11.super_class = (Class)PLTimeReferenceKernel;
  double v7 = objc_msgSend(-[PLTimeReferenceKernel class](&v11, sel_class), "defaultsKeyFromEntryDefinitionKey:", @"system");
  +[PLDefaults setObject:0 forKey:v7 saveToDisk:1];

  v10.receiver = self;
  v10.super_class = (Class)PLTimeReferenceKernel;
  double v8 = objc_msgSend(-[PLTimeReferenceKernel class](&v10, sel_class), "defaultsKeyFromEntryDefinitionKey:", @"baseband");
  +[PLDefaults setObject:0 forKey:v8 saveToDisk:1];

  double v9 = dispatch_semaphore_create(0);
  +[PLUtilities exitWithReason:v3];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void __36__PLTimeReferenceKernel_currentTime__block_invoke()
{
  if (sysctlnametomib("kern.monotonicclock_usecs", currentTime_mib, (size_t *)&currentTime_miblen))
  {
    v0 = PLLogTimeManager();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __36__PLTimeReferenceKernel_currentTime__block_invoke_cold_1(v0);
    }
  }
}

double __35__PLTimeReferenceKernel_resolution__block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  resolution_sInterval = 0x3FF0000000000000;
  size_t v3 = 8;
  unint64_t v4 = 0;
  *(void *)v2 = 8;
  if (sysctlnametomib("kern.monotonicclock_rate_usecs", v5, (size_t *)v2))
  {
    v0 = PLLogTimeManager();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __35__PLTimeReferenceKernel_resolution__block_invoke_cold_2(v0);
    }
LABEL_7:

    goto LABEL_8;
  }
  if (sysctl(v5, v2[0], &v4, &v3, 0, 0))
  {
    v0 = PLLogTimeManager();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      __35__PLTimeReferenceKernel_resolution__block_invoke_cold_1();
    }
    goto LABEL_7;
  }
LABEL_8:
  double result = (double)v4 / 1000000.0;
  *(double *)&resolution_sInterval = result;
  return result;
}

- (void)setSystemReboot:(BOOL)a3
{
  self->_rebootOccurred = a3;
}

- (mach_timebase_info)getTimebaseInfo
{
  if (getTimebaseInfo_onceToken != -1) {
    dispatch_once(&getTimebaseInfo_onceToken, &__block_literal_global_17);
  }
  return (mach_timebase_info *)&getTimebaseInfo_machTimeInfo;
}

double __40__PLTimeReferenceKernel_getTimebaseInfo__block_invoke()
{
  if (mach_timebase_info((mach_timebase_info_t)&getTimebaseInfo_machTimeInfo))
  {
    _os_assumes_log();
  }
  else if (dword_1E9F8E40C)
  {
    return result;
  }
  *(void *)&double result = 0x100000001;
  getTimebaseInfo_machTimeInfo = 0x100000001;
  return result;
}

- (unint64_t)continuousTimeToAbsoluteNs:(unint64_t)a3
{
  unint64_t v4 = [(PLTimeReferenceKernel *)self getTimebaseInfo];
  return v4->numer * a3 / v4->denom;
}

- (BOOL)rebootOccurred
{
  return self->_rebootOccurred;
}

- (void)setRebootOccurred:(BOOL)a3
{
  self->_rebootOccurred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKernelTimeRecalibrated, 0);
  objc_storeStrong((id *)&self->_lastSystemTimeRecalibrated, 0);
}

- (void)initializeOffsetWithEntries:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "monotonicTimeWentBackwards=%d", (uint8_t *)v2, 8u);
}

- (void)currentTime
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_1BBD2F000, v1, v2, "PLTimeReferenceKernel::currentTime: error occurred %d %s", v3, v4, v5, v6, v7);
}

void __36__PLTimeReferenceKernel_currentTime__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "PLTimeReferenceKernel::currentTime: error occurred no mib to monotonic clock conversion", v1, 2u);
}

void __35__PLTimeReferenceKernel_resolution__block_invoke_cold_1()
{
  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_1BBD2F000, v1, v2, "PLTimeReferenceKernel::resolution: error occurred %d %s", v3, v4, v5, v6, v7);
}

void __35__PLTimeReferenceKernel_resolution__block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "PLTimeReferenceKernel::resolution: error occurred, no mib to monotonicclock_rate_usecs conversion", v1, 2u);
}

@end