@interface NTTodayResultOperation
- (FCContentContext)contentContext;
- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory;
- (NFCopying)prefetchedContent;
- (NTPBTodayResultOperationInfo)operationInfo;
- (NTTodayBannerValidator)todayBannerValidator;
- (NTTodayResultOperation)init;
- (id)headlineResultCompletionHandler;
- (void)setContentContext:(id)a3;
- (void)setFeedPersonalizerFactory:(id)a3;
- (void)setHeadlineResultCompletionHandler:(id)a3;
- (void)setOperationInfo:(id)a3;
- (void)setPrefetchedContent:(id)a3;
- (void)setTodayBannerValidator:(id)a3;
@end

@implementation NTTodayResultOperation

- (NTTodayResultOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTTodayResultOperation;
  return [(FCOperation *)&v3 init];
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
}

- (FCFeedPersonalizerFactoryType)feedPersonalizerFactory
{
  return self->_feedPersonalizerFactory;
}

- (void)setFeedPersonalizerFactory:(id)a3
{
}

- (NTTodayBannerValidator)todayBannerValidator
{
  return self->_todayBannerValidator;
}

- (void)setTodayBannerValidator:(id)a3
{
}

- (NTPBTodayResultOperationInfo)operationInfo
{
  return self->_operationInfo;
}

- (void)setOperationInfo:(id)a3
{
}

- (NFCopying)prefetchedContent
{
  return self->_prefetchedContent;
}

- (void)setPrefetchedContent:(id)a3
{
}

- (id)headlineResultCompletionHandler
{
  return self->_headlineResultCompletionHandler;
}

- (void)setHeadlineResultCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_headlineResultCompletionHandler, 0);
  objc_storeStrong((id *)&self->_prefetchedContent, 0);
  objc_storeStrong((id *)&self->_operationInfo, 0);
  objc_storeStrong((id *)&self->_todayBannerValidator, 0);
  objc_storeStrong((id *)&self->_feedPersonalizerFactory, 0);

  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end