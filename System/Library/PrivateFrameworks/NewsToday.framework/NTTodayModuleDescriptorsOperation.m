@interface NTTodayModuleDescriptorsOperation
- (BOOL)requireRefreshedAppConfig;
- (FCContentContext)contentContext;
- (FCReadablePrivateDataStorage)privateDataStorage;
- (NTTodayModuleContentRequest)contentRequest;
- (NTTodayModuleDescriptorsOperation)init;
- (id)descriptorsCompletion;
- (void)setContentContext:(id)a3;
- (void)setContentRequest:(id)a3;
- (void)setDescriptorsCompletion:(id)a3;
- (void)setPrivateDataStorage:(id)a3;
- (void)setRequireRefreshedAppConfig:(BOOL)a3;
@end

@implementation NTTodayModuleDescriptorsOperation

- (void)setContentContext:(id)a3
{
}

- (id)descriptorsCompletion
{
  return self->_descriptorsCompletion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptorsCompletion, 0);
  objc_storeStrong((id *)&self->_privateDataStorage, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);

  objc_storeStrong((id *)&self->_contentRequest, 0);
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

- (NTTodayModuleDescriptorsOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTTodayModuleDescriptorsOperation;
  return [(FCOperation *)&v3 init];
}

- (NTTodayModuleContentRequest)contentRequest
{
  return self->_contentRequest;
}

- (void)setContentRequest:(id)a3
{
}

- (BOOL)requireRefreshedAppConfig
{
  return self->_requireRefreshedAppConfig;
}

- (void)setRequireRefreshedAppConfig:(BOOL)a3
{
  self->_requireRefreshedAppConfig = a3;
}

- (FCReadablePrivateDataStorage)privateDataStorage
{
  return self->_privateDataStorage;
}

- (void)setPrivateDataStorage:(id)a3
{
}

- (void)setDescriptorsCompletion:(id)a3
{
}

@end