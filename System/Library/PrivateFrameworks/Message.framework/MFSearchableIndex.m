@interface MFSearchableIndex
@end

@implementation MFSearchableIndex

void __28__MFSearchableIndex_iOS_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_30;
  log_log_30 = (uint64_t)v1;
}

void __49__MFSearchableIndex_iOS_dataSourceRefreshReasons__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"MonitoredActivityReasonCompacting";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v0];
  v2 = (void *)dataSourceRefreshReasons_reasons;
  dataSourceRefreshReasons_reasons = v1;
}

void __37__MFSearchableIndex_iOS_purgeReasons__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"MonitoredActivityReasonCompacting";
  v3[1] = @"MonitoredActivityReasonMoving";
  void v3[2] = @"MonitoredActivityReasonArchiving";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v0];
  v2 = (void *)purgeReasons_reasons;
  purgeReasons_reasons = v1;
}

void __41__MFSearchableIndex_iOS_exclusionReasons__block_invoke()
{
  void v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"MonitoredActivityReasonDeleting";
  v3[1] = @"MonitoredActivityReasonJunking";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v0];
  v2 = (void *)exclusionReasons_reasons;
  exclusionReasons_reasons = v1;
}

@end