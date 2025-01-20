@interface SiriAnalyticsMachAbsoluteTimeRate
@end

@implementation SiriAnalyticsMachAbsoluteTimeRate

void ___SiriAnalyticsMachAbsoluteTimeRate_block_invoke()
{
  kern_return_t v0;
  unint64_t v1;
  unint64_t v2;
  uint32_t v3;
  NSObject *v4;
  NSObject *v5;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint32_t numer;
  __int16 v11;
  uint32_t denom;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E4F143B8];
  info = 0;
  v0 = mach_timebase_info(&info);
  if (v0)
  {
    v3 = v0;
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v4 = SiriAnalyticsLogContextUtility;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextUtility, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "_SiriAnalyticsMachAbsoluteTimeRate_block_invoke";
      v9 = 1024;
      numer = v3;
      _os_log_error_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_ERROR, "%s mach_timebase_info() failed with %d.", buf, 0x12u);
    }
  }
  else
  {
    LODWORD(v1) = info.numer;
    LODWORD(v2) = info.denom;
    *(double *)&_SiriAnalyticsMachAbsoluteTimeRate_rate = (double)v1 / (double)v2;
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    v5 = SiriAnalyticsLogContextUtility;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextUtility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v8 = "_SiriAnalyticsMachAbsoluteTimeRate_block_invoke";
      v9 = 1024;
      numer = info.numer;
      v11 = 1024;
      denom = info.denom;
      v13 = 2048;
      v14 = _SiriAnalyticsMachAbsoluteTimeRate_rate;
      _os_log_impl(&dword_1A2B39000, v5, OS_LOG_TYPE_INFO, "%s machTimebaseInfo.numer = %u, machTimebaseInfo.denom = %u, rate = %f", buf, 0x22u);
    }
  }
}

@end