@interface JSAStoreHTTPRequest
+ (void)incrementPostLaunchCacheCount;
+ (void)prewarmOfflineCache;
- (BOOL)disableATS;
- (BOOL)frozen;
- (BOOL)personalized;
- (BOOL)shouldSuppressMetrics;
- (BOOL)shouldSuppressResponseDialogs;
- (JSAStoreHTTPRequest)init;
- (JSValue)onResponse;
- (NSArray)cookiesToSuppress;
- (NSArray)lowercaseRestrictedHeaders;
- (NSDictionary)headers;
- (NSDictionary)queryItems;
- (NSNumber)retryCount;
- (NSNumber)timeout;
- (NSString)method;
- (NSString)url;
- (float)priority;
- (id)body;
- (id)completion;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
- (void)cancel;
- (void)send;
- (void)setBody:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCookiesToSuppress:(id)a3;
- (void)setDisableATS:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setHeaders:(id)a3;
- (void)setLowercaseRestrictedHeaders:(id)a3;
- (void)setMethod:(id)a3;
- (void)setOnResponse:(id)a3;
- (void)setPersonalized:(BOOL)a3;
- (void)setPriority:(float)a3;
- (void)setQueryItems:(id)a3;
- (void)setRetryCount:(id)a3;
- (void)setShouldSuppressMetrics:(BOOL)a3;
- (void)setShouldSuppressResponseDialogs:(BOOL)a3;
- (void)setTimeout:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation JSAStoreHTTPRequest

+ (void)prewarmOfflineCache
{
  id v2 = +[_JSAStoreHTTPReqestOfflineCache sharedOfflineCache];
}

+ (void)incrementPostLaunchCacheCount
{
  id v2 = +[_JSAStoreHTTPReqestOfflineCache sharedOfflineCache];
  [v2 incrementPostLaunchCacheCount];
}

- (void)send
{
  if (!self->_frozen)
  {
    self->_frozen = 1;
    sub_1663C(self);
  }
}

- (void)cancel
{
  [(NSURLSessionDataTask *)self->_dataTask cancel];
  dataTask = self->_dataTask;
  self->_dataTask = 0;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
  dataTask = self->_dataTask;
  if (dataTask) {
    -[NSURLSessionDataTask setPriority:](dataTask, "setPriority:");
  }
}

- (JSAStoreHTTPRequest)init
{
  v13.receiver = self;
  v13.super_class = (Class)JSAStoreHTTPRequest;
  id v2 = [(JSAStoreHTTPRequest *)&v13 init];
  v3 = v2;
  if (v2)
  {
    method = v2->_method;
    v2->_method = (NSString *)@"GET";

    uint64_t v5 = objc_opt_new();
    queryItems = v3->_queryItems;
    v3->_queryItems = (NSDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    headers = v3->_headers;
    v3->_headers = (NSDictionary *)v7;

    v3->_timeout = 30.0;
    v3->_retryCount = 0;
    *(_DWORD *)&v3->_shouldSuppressResponseDialogs = 0x10000;
    v3->_frozen = 0;
    lowercaseRestrictedHeaders = v3->_lowercaseRestrictedHeaders;
    v3->_lowercaseRestrictedHeaders = (NSArray *)&off_B9BF8;

    uint64_t v10 = objc_opt_new();
    cookiesToSuppress = v3->_cookiesToSuppress;
    v3->_cookiesToSuppress = (NSArray *)v10;
  }
  return v3;
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  if ([(JSAStoreHTTPRequest *)self shouldSuppressResponseDialogs])
  {
    uint64_t v10 = [(JSAStoreHTTPRequest *)self url];
    v11 = [v9 title];
    v12 = [v9 message];

    objc_super v13 = +[NSString stringWithFormat:@"[JSAStoreHTTPRequest] (%@) caller suppressed dialog of title '%@' and message '%@'", v10, v11, v12];

    v14 = (void (**)(id, void, void *))objc_retainBlock(v8);
    if (v14)
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      v22 = v13;
      v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      v16 = +[NSError errorWithDomain:@"JSAErrorDomain" code:970 userInfo:v15];
      v14[2](v14, 0, v16);
    }
  }
  else
  {
    id v17 = objc_alloc((Class)AMSUIAlertDialogTask);
    v18 = +[UIViewController jsa_topMostViewControllerForWindow:0];
    id v20 = [v17 initWithRequest:v9 presentingViewController:v18];

    v19 = [v20 present];
    [v19 addFinishBlock:v8];
  }
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = a5;
  id v9 = objc_alloc((Class)AMSUIAuthenticateTask);
  uint64_t v10 = +[UIViewController jsa_topMostViewControllerForWindow:0];
  id v12 = [v9 initWithRequest:v8 presentingViewController:v10];

  v11 = [v12 performAuthentication];
  [v11 addFinishBlock:v7];
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = a5;
  id v13 = +[BUBag defaultBag];
  id v9 = objc_alloc((Class)AMSUIEngagementTask);
  uint64_t v10 = +[UIViewController jsa_topMostViewControllerForWindow:0];
  id v11 = [v9 initWithRequest:v8 bag:v13 presentingViewController:v10];

  id v12 = [v11 presentEngagement];
  [v12 addFinishBlock:v7];
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  if (!self->_frozen)
  {
    uint64_t v5 = +[NSURL URLWithString:v4];
    url = self->_url;
    self->_url = v5;

    if (!self->_url)
    {
      id v7 = JSALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_853D4();
      }
    }
  }
}

- (NSString)url
{
  return [(NSURL *)self->_url absoluteString];
}

- (void)setMethod:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (!self->_frozen)
  {
    if (([v5 isEqualToString:@"GET"] & 1) != 0
      || ([v6 isEqualToString:@"HEAD"] & 1) != 0
      || ([v6 isEqualToString:@"POST"] & 1) != 0
      || ([v6 isEqualToString:@"PUT"] & 1) != 0
      || ([v6 isEqualToString:@"PATCH"] & 1) != 0
      || [v6 isEqualToString:@"DELETE"])
    {
      objc_storeStrong((id *)&self->_method, a3);
    }
    else
    {
      id v7 = JSALog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_8544C();
      }
    }
  }
}

- (NSString)method
{
  return self->_method;
}

- (void)setBody:(id)a3
{
  id v5 = a3;
  if (!self->_frozen)
  {
    id v6 = v5;
    objc_storeStrong(&self->_body, a3);
    id v5 = v6;
  }
}

- (id)body
{
  return self->_body;
}

- (void)setQueryItems:(id)a3
{
  if (!self->_frozen)
  {
    [a3 jsa_stringDictionaryForRequestHeaderOrURLParam];
    self->_queryItems = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    _objc_release_x1();
  }
}

- (NSDictionary)queryItems
{
  return self->_queryItems;
}

- (void)setHeaders:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_frozen)
  {
    id v6 = [v4 jsa_stringDictionaryForRequestHeaderOrURLParam];
    id v7 = objc_opt_new();
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_18198;
    v11[3] = &unk_B2B28;
    objc_copyWeak(&v13, &location);
    id v8 = v7;
    id v12 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    id v9 = (NSDictionary *)[v8 copy];
    headers = self->_headers;
    self->_headers = v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setTimeout:(id)a3
{
  if (!self->_frozen)
  {
    [a3 doubleValue];
    self->_timeout = v4;
  }
}

- (NSNumber)timeout
{
  return +[NSNumber numberWithDouble:self->_timeout];
}

- (void)setRetryCount:(id)a3
{
  if (!self->_frozen) {
    self->_retryCount = (int64_t)[a3 integerValue];
  }
}

- (NSNumber)retryCount
{
  return +[NSNumber numberWithInteger:self->_retryCount];
}

- (void)setShouldSuppressResponseDialogs:(BOOL)a3
{
  if (!self->_frozen) {
    self->_shouldSuppressResponseDialogs = a3;
  }
}

- (BOOL)shouldSuppressResponseDialogs
{
  return self->_shouldSuppressResponseDialogs;
}

- (void)setShouldSuppressMetrics:(BOOL)a3
{
  if (!self->_frozen) {
    self->_shouldSuppressMetrics = a3;
  }
}

- (BOOL)shouldSuppressMetrics
{
  return self->_shouldSuppressMetrics;
}

- (void)setPersonalized:(BOOL)a3
{
  if (!self->_frozen) {
    self->_personalized = a3;
  }
}

- (BOOL)personalized
{
  return self->_personalized;
}

- (void)setCookiesToSuppress:(id)a3
{
  id v5 = a3;
  if (!self->_frozen)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_cookiesToSuppress, a3);
    id v5 = v6;
  }
}

- (NSArray)cookiesToSuppress
{
  return self->_cookiesToSuppress;
}

- (void)setDisableATS:(BOOL)a3
{
  if (!self->_frozen) {
    self->_disableATS = a3;
  }
}

- (BOOL)disableATS
{
  return self->_disableATS;
}

- (void)setOnResponse:(id)a3
{
  id v5 = a3;
  if (!self->_frozen)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_onResponse, a3);
    id v5 = v6;
  }
}

- (JSValue)onResponse
{
  return self->_onResponse;
}

- (void)setCompletion:(id)a3
{
  if (!self->_frozen)
  {
    self->_completion = objc_retainBlock(a3);
    _objc_release_x1();
  }
}

- (float)priority
{
  return self->_priority;
}

- (id)completion
{
  return self->_completion;
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (NSArray)lowercaseRestrictedHeaders
{
  return self->_lowercaseRestrictedHeaders;
}

- (void)setLowercaseRestrictedHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowercaseRestrictedHeaders, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_cookiesToSuppress, 0);
  objc_storeStrong((id *)&self->_onResponse, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_queryItems, 0);
  objc_storeStrong(&self->_body, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end