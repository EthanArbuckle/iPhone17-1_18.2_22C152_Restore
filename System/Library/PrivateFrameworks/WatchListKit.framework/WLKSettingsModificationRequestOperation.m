@interface WLKSettingsModificationRequestOperation
+ (id)_requestURL:(id *)a3;
- (WLKSettingsModificationRequestOperation)initWithModifications:(id)a3;
- (id)_postBody;
- (void)prepareURLRequest:(id)a3;
@end

@implementation WLKSettingsModificationRequestOperation

- (WLKSettingsModificationRequestOperation)initWithModifications:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKSettingsModificationRequestOperation;
  v6 = [(WLKNetworkRequestOperation *)&v9 initWithURLRequest:0 options:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modifications, a3);
  }

  return v7;
}

- (void)prepareURLRequest:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  id v9 = 0;
  id v5 = [(id)objc_opt_class() _requestURL:&v9];
  id v6 = v9;
  if (v5)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v5];
    [v7 setHTTPMethod:@"POST"];
    v8 = [(WLKSettingsModificationRequestOperation *)self _postBody];
    [v7 setHTTPBody:v8];

    [v7 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    v4[2](v4, v7, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, 0, v6);
  }
}

+ (id)_requestURL:(id *)a3
{
  v3 = objc_msgSend(MEMORY[0x1E4FA9C70], "app", a3);
  v4 = [v3 cachedURLForKey:kBagKeyUpdateWatchListSettings];

  return v4;
}

- (id)_postBody
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    modifications = self->_modifications;
    *(_DWORD *)buf = 138412290;
    v12 = modifications;
    _os_log_impl(&dword_1BA2E8000, v3, OS_LOG_TYPE_DEFAULT, "WLKSettingsModificationRequestOperation - posting: %@", buf, 0xCu);
  }

  id v5 = self->_modifications;
  uint64_t v10 = 0;
  id v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:0 error:&v10];
  v7 = v6;
  id v8 = 0;
  if (!v10) {
    id v8 = v6;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end