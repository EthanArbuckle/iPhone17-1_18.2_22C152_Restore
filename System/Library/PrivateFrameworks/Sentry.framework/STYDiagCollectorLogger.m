@interface STYDiagCollectorLogger
+ (id)sharedLogger;
- (OS_os_log)logHandle;
- (void)setLogHandle:(id)a3;
@end

@implementation STYDiagCollectorLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1) {
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global);
  }
  v2 = (void *)logger;
  return v2;
}

void __38__STYDiagCollectorLogger_sharedLogger__block_invoke()
{
  v0 = objc_alloc_init(STYDiagCollectorLogger);
  v1 = (void *)logger;
  logger = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.Sentry.Framework", "PerfChecker");
  [(id)logger setLogHandle:v2];
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