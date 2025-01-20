@interface WLKSubscriptionDataRequestOperation
+ (id)_requestURL:(id *)a3;
- (NSDictionary)response;
- (WLKSubscriptionDataRequestOperation)init;
- (void)prepareURLRequest:(id)a3;
- (void)processResponse;
@end

@implementation WLKSubscriptionDataRequestOperation

- (WLKSubscriptionDataRequestOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)WLKSubscriptionDataRequestOperation;
  return [(WLKNetworkRequestOperation *)&v3 initWithURLRequest:0 options:0];
}

- (void)prepareURLRequest:(id)a3
{
  objc_super v3 = (void (**)(id, void *, void))a3;
  id v7 = 0;
  v4 = [(id)objc_opt_class() _requestURL:&v7];
  id v5 = v7;
  if (v4)
  {
    v6 = [MEMORY[0x1E4F18D50] requestWithURL:v4];
    [v6 setTimeoutInterval:15.0];
    v3[2](v3, v6, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v3)[2](v3, 0, v5);
  }
}

- (void)processResponse
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(WLKDictionaryResponseProcessor);
  v4 = [(WLKNetworkRequestOperation *)self data];
  id v5 = [(WLKDictionaryResponseProcessor *)v3 processResponseData:v4 error:0];

  p_response = &self->_response;
  objc_storeStrong((id *)&self->_response, v5);
  id v7 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *p_response;
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1BA2E8000, v7, OS_LOG_TYPE_DEFAULT, "WLKSubscriptionDataRequestOperation - response: %@", (uint8_t *)&v9, 0xCu);
  }
}

+ (id)_requestURL:(id *)a3
{
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.WatchListKit"];
  v4 = [v3 stringForKey:@"SubscriptionSyncTestEndpointURL"];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    v6 = [MEMORY[0x1E4FA9C70] app];
    id v5 = [v6 urlForKey:@"tvSubscriptionStatus"];
  }

  return v5;
}

- (NSDictionary)response
{
  return self->_response;
}

- (void).cxx_destruct
{
}

@end