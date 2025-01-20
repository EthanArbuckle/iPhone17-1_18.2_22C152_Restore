@interface STYFrameworkHelper
+ (id)sharedHelper;
- (OS_dispatch_queue)sharedConcurrentQueueAtBackground;
- (OS_dispatch_queue)sharedConcurrentQueueAtUtility;
- (OS_dispatch_queue)sharedSerialQueueAtUtility;
- (OS_os_log)logHandle;
- (id)subsystemForSignposts;
- (void)setLogHandle:(id)a3;
- (void)setSharedConcurrentQueueAtBackground:(id)a3;
- (void)setSharedConcurrentQueueAtUtility:(id)a3;
- (void)setSharedSerialQueueAtUtility:(id)a3;
@end

@implementation STYFrameworkHelper

+ (id)sharedHelper
{
  if (sharedHelper_onceToken != -1) {
    dispatch_once(&sharedHelper_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)sharedHelper;
  return v2;
}

void __34__STYFrameworkHelper_sharedHelper__block_invoke()
{
  v0 = objc_alloc_init(STYFrameworkHelper);
  v1 = (void *)sharedHelper;
  sharedHelper = (uint64_t)v0;

  if (sharedHelper)
  {
    attr = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -15);
    v2 = MEMORY[0x1E4F14430];
    v3 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_UTILITY, -15);
    v4 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_BACKGROUND, -15);
    os_log_t v5 = os_log_create("com.apple.Sentry.Framework", "STYFrameworkHelper");
    [(id)sharedHelper setLogHandle:v5];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Sentry.Frameworking.STYFrameworkHelper.Serial.utility", attr);
    [(id)sharedHelper setSharedSerialQueueAtUtility:v6];

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.Sentry.Frameworking.STYFrameworkHelper.Conc.utility", v3);
    [(id)sharedHelper setSharedConcurrentQueueAtUtility:v7];

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.Sentry.Frameworking.STYFrameworkHelper.Conc.backgorund", v4);
    [(id)sharedHelper setSharedConcurrentQueueAtBackground:v8];
  }
}

- (id)subsystemForSignposts
{
  return @"com.apple.Sentry.FrameworkSignposts";
}

- (OS_dispatch_queue)sharedSerialQueueAtUtility
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSharedSerialQueueAtUtility:(id)a3
{
}

- (OS_dispatch_queue)sharedConcurrentQueueAtUtility
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSharedConcurrentQueueAtUtility:(id)a3
{
}

- (OS_dispatch_queue)sharedConcurrentQueueAtBackground
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSharedConcurrentQueueAtBackground:(id)a3
{
}

- (OS_os_log)logHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_sharedConcurrentQueueAtBackground, 0);
  objc_storeStrong((id *)&self->_sharedConcurrentQueueAtUtility, 0);
  objc_storeStrong((id *)&self->_sharedSerialQueueAtUtility, 0);
}

@end