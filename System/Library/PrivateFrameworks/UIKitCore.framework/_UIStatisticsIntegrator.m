@interface _UIStatisticsIntegrator
+ (id)sharedInstance;
+ (void)createSharedInstanceIfNecessary;
+ (void)setSharedInstance:(id)a3;
- (_UIStatisticsIntegrator)init;
- (void)batchRecord:(id)a3;
@end

@implementation _UIStatisticsIntegrator

+ (id)sharedInstance
{
  [a1 createSharedInstanceIfNecessary];
  v2 = (void *)_statisticsIntegrator;
  return v2;
}

+ (void)createSharedInstanceIfNecessary
{
  if (createSharedInstanceIfNecessary_onceToken != -1) {
    dispatch_once(&createSharedInstanceIfNecessary_onceToken, &__block_literal_global_614);
  }
}

- (_UIStatisticsIntegrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatisticsIntegrator;
  v2 = [(_UIStatisticsIntegrator *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.UIKit.statisticsIntegrator", 0);
    reportingQueue = v2->_reportingQueue;
    v2->_reportingQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (void)setSharedInstance:(id)a3
{
}

- (void)batchRecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end