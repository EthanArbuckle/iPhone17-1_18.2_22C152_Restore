@interface NDFeedPersonalizerFactory
- (NDFeedPersonalizerFactory)init;
- (id)newFeedPersonalizerWithAggregateStore:(id)a3 appConfigurationManager:(id)a4 todayPrivateData:(id)a5;
@end

@implementation NDFeedPersonalizerFactory

- (NDFeedPersonalizerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)NDFeedPersonalizerFactory;
  return [(NDFeedPersonalizerFactory *)&v3 init];
}

- (id)newFeedPersonalizerWithAggregateStore:(id)a3 appConfigurationManager:(id)a4 todayPrivateData:(id)a5
{
  return objc_alloc_init(NDNoSupportFeedPersonalizer);
}

@end