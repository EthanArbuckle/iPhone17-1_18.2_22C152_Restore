@interface UIAnalyticsTouchesSession
@end

@implementation UIAnalyticsTouchesSession

id __43___UIAnalyticsTouchesSession_processEvent___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = _uiMultitouchAnalyticsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218498;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    uint64_t v16 = v9;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "Analytics session %p: Sending combined data point: type: %s, duration: %llu ms", buf, 0x20u);
  }

  v11[0] = @"bundleID";
  v3 = _UIMainBundleIdentifier();
  v12[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithDouble:", *(double *)(a1 + 64), @"bundleID", @"touchDuration");
  v12[1] = v4;
  v11[2] = *(void *)(a1 + 40);
  v5 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
  v12[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  return v6;
}

@end