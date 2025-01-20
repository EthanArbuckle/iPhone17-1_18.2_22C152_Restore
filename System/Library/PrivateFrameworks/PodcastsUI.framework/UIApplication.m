@interface UIApplication
@end

@implementation UIApplication

void __39__UIApplication_Metrics___metricsQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.podcasts.UIApplicationMetrics.metricsQueue", v2);
  v1 = (void *)_metricsQueue_metricsQueue;
  _metricsQueue_metricsQueue = (uint64_t)v0;
}

void __45__UIApplication_Metrics__recordAppOpenEvent___block_invoke(void *a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F91F28]) initWithReason:a1[6]];
  [v2 setReferringAppName:a1[4]];
  [v2 setReferringURL:a1[5]];
  [MEMORY[0x1E4F91F18] recordEvent:v2];
}

uint64_t __46__UIApplication_Metrics__recordMemoryWarning___block_invoke()
{
  return [MEMORY[0x1E4F91F18] recordMemory:@"low memory notification"];
}

@end