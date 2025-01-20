@interface STCoreAnalyticsReporter
+ (void)reportEvent:(id)a3;
@end

@implementation STCoreAnalyticsReporter

+ (void)reportEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 name];
  id v5 = v3;
  int v6 = AnalyticsSendEventLazy();

  v7 = +[STLog coreAnalytics];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v5 description];
      v10 = [v5 payload];
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1DA519000, v8, OS_LOG_TYPE_DEFAULT, "Sent Core Analytics event: %@ %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    +[STCoreAnalyticsReporter reportEvent:](v5, v8);
  }
}

uint64_t __39__STCoreAnalyticsReporter_reportEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) payload];
}

+ (void)reportEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1DA519000, a2, OS_LOG_TYPE_ERROR, "Failed to send Core Analytics event: %@", (uint8_t *)&v4, 0xCu);
}

@end