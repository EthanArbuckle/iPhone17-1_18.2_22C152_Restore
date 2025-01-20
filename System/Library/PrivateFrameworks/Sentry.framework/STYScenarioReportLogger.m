@interface STYScenarioReportLogger
+ (id)sharedLogger;
- (OS_os_log)logHandle;
- (void)setLogHandle:(id)a3;
@end

@implementation STYScenarioReportLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_0 != -1) {
    dispatch_once(&sharedLogger_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)logger_0;
  return v2;
}

void __39__STYScenarioReportLogger_sharedLogger__block_invoke()
{
  v0 = objc_alloc_init(STYScenarioReportLogger);
  v1 = (void *)logger_0;
  logger_0 = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.Sentry.Framework", "STYScenarioReport");
  [(id)logger_0 setLogHandle:v2];
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end