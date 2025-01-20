@interface IMBaseStoreService
+ (BOOL)isValidResponseJson:(id)a3 response:(id)a4 error:(id)a5;
+ (BOOL)shouldFollowRedirects;
+ (id)signatureQueryParams;
- (BOOL)personalizeRequests;
- (BOOL)wantsJSSignature;
- (IMBaseStoreService)init;
- (IMBaseStoreService)initWithConcurrentOperationCount:(int64_t)a3 requestEncodingType:(unint64_t)a4;
- (IMURLSession)amsUrlSession;
- (NSURLSessionConfiguration)configuration;
- (id)bag;
- (id)callback;
- (unint64_t)encodingType;
- (void)cancelAllRequests;
- (void)performDataRequest:(id)a3 account:(id)a4 callback:(id)a5;
- (void)performDataRequest:(id)a3 callback:(id)a4;
- (void)performUrlRequest:(id)a3 callback:(id)a4;
- (void)setAmsUrlSession:(id)a3;
- (void)setCallback:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setEncodingType:(unint64_t)a3;
- (void)setPersonalizeRequests:(BOOL)a3;
- (void)setURLProtocolDelegate:(id)a3;
- (void)setWantsJSSignature:(BOOL)a3;
- (void)signRequest:(id)a3;
@end

@implementation IMBaseStoreService

- (void)setPersonalizeRequests:(BOOL)a3
{
  self->_personalizeRequests = a3;
}

- (void)performDataRequest:(id)a3 account:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  BOOL wantsJSSignature = self->_wantsJSSignature;
  unint64_t encodingType = self->_encodingType;
  if (encodingType == 1)
  {
    v16 = [IMMediaRequestEncoder alloc];
    v14 = [(IMBaseStoreService *)self bag];
    uint64_t v15 = [(IMMediaRequestEncoder *)v16 initWithBag:v14 session:self->_amsUrlSession];
  }
  else
  {
    if (encodingType)
    {
      v17 = 0;
      goto LABEL_7;
    }
    v13 = [IMURLRequestEncoder alloc];
    v14 = [(IMBaseStoreService *)self bag];
    uint64_t v15 = [(IMURLRequestEncoder *)v13 initWithBag:v14];
  }
  v17 = (void *)v15;

LABEL_7:
  objc_msgSend(v17, "setPersonalizeRequests:", -[IMBaseStoreService personalizeRequests](self, "personalizeRequests"));
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__IMBaseStoreService_performDataRequest_account_callback___block_invoke;
  v19[3] = &unk_1E5E63220;
  BOOL v22 = wantsJSSignature;
  v19[4] = self;
  objc_copyWeak(&v21, &location);
  id v18 = v10;
  id v20 = v18;
  [v17 prepareRequest:v8 account:v9 completion:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (BOOL)personalizeRequests
{
  return self->_personalizeRequests;
}

- (id)bag
{
  return +[IMURLBag sharedInstance];
}

- (IMURLSession)amsUrlSession
{
  return self->_amsUrlSession;
}

- (IMBaseStoreService)initWithConcurrentOperationCount:(int64_t)a3 requestEncodingType:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)IMBaseStoreService;
  v6 = [(IMBaseStoreService *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    configuration = v6->_configuration;
    v6->_configuration = (NSURLSessionConfiguration *)v7;

    if (a3 != -1) {
      [(NSURLSessionConfiguration *)v6->_configuration setHTTPMaximumConnectionsPerHost:a3];
    }
    id v9 = [(AMSURLSession *)[IMURLSession alloc] initWithConfiguration:v6->_configuration];
    amsUrlSession = v6->_amsUrlSession;
    v6->_amsUrlSession = v9;

    -[IMURLSession setFollowsRedirects:](v6->_amsUrlSession, "setFollowsRedirects:", [(id)objc_opt_class() shouldFollowRedirects]);
    v6->_unint64_t encodingType = a4;
    if (a4 == 1) {
      v6->_personalizeRequests = 1;
    }
  }
  return v6;
}

+ (BOOL)shouldFollowRedirects
{
  return 1;
}

- (IMBaseStoreService)init
{
  return [(IMBaseStoreService *)self initWithConcurrentOperationCount:-1 requestEncodingType:0];
}

- (void)setURLProtocolDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(IMBaseStoreService *)self amsUrlSession];
  [v5 setDelegate:v4];
}

+ (BOOL)isValidResponseJson:(id)a3 response:(id)a4 error:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = _IMStoreLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = v9;
      v11 = "performUrlRequest completed with error %{public}@";
LABEL_9:
      _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0xCu);
    }
  }
  else if (v8 && ([v8 statusCode] < 200 || objc_msgSend(v8, "statusCode") >= 300))
  {
    id v10 = _IMStoreLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 134217984;
      id v16 = (id)[v8 statusCode];
      v11 = "performUrlRequest completed with bad status code: %ld";
      goto LABEL_9;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v12 = 1;
      goto LABEL_11;
    }
    id v10 = _IMStoreLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543362;
      id v16 = (id)objc_opt_class();
      id v14 = v16;
      _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_ERROR, "Recived non-dictionary response. Discarding. (%{public}@)", (uint8_t *)&v15, 0xCu);
    }
  }

  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)performUrlRequest:(id)a3 callback:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__IMBaseStoreService_performUrlRequest_callback___block_invoke;
  v8[3] = &unk_1E5E61310;
  id v9 = v6;
  id v7 = v6;
  [(IMBaseStoreService *)self performDataRequest:a3 callback:v8];
}

void __49__IMBaseStoreService_performUrlRequest_callback___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v13 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (*(void *)(a1 + 32))
  {
    if (+[IMBaseStoreService isValidResponseJson:v9 response:v10 error:v11])
    {
      id v12 = v9;
    }
    else
    {
      id v12 = 0;
    }
    (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v12);
  }
}

- (void)performDataRequest:(id)a3 callback:(id)a4
{
}

void __58__IMBaseStoreService_performDataRequest_account_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) signRequest:v5];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = [WeakRetained amsUrlSession];
  objc_initWeak(&location, v8);

  id v9 = objc_loadWeakRetained((id *)(a1 + 48));
  id v10 = [v9 amsUrlSession];
  id v11 = [v10 dataTaskPromiseWithRequest:v5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__IMBaseStoreService_performDataRequest_account_callback___block_invoke_2;
  v12[3] = &unk_1E5E631F8;
  objc_copyWeak(&v14, &location);
  id v13 = *(id *)(a1 + 40);
  [v11 resultWithTimeout:v12 completion:60.0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __58__IMBaseStoreService_performDataRequest_account_callback___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained && ![WeakRetained state])
  {
    if (!*(void *)(a1 + 32)) {
      goto LABEL_6;
    }
    id v10 = [v5 response];
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v12 = [v5 response];
      if (v6) {
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v12 = 0;
      if (v6) {
        goto LABEL_20;
      }
    }
    id v13 = [v5 data];
    if (v13)
    {
      uint64_t isKindOfClass = [v5 data];
      if ([(id)isKindOfClass length])
      {

LABEL_19:
        id v6 = 0;
        goto LABEL_20;
      }
    }
    uint64_t v14 = [v5 object];
    BOOL v15 = (v14 | v12) == 0;

    if (v13)
    {

      if (!v15) {
        goto LABEL_19;
      }
    }
    else if (!v15)
    {
      goto LABEL_19;
    }
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.podcasts.IMBaseStoreService" code:1 userInfo:0];
LABEL_20:
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = [v5 data];
    id v18 = [v5 object];
    (*(void (**)(uint64_t, void *, void *, uint64_t, id))(v16 + 16))(v16, v17, v18, v12, v6);

    goto LABEL_6;
  }
  id v9 = _IMStoreLogCategoryDefault();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1AC9D5000, v9, OS_LOG_TYPE_ERROR, "Discarding response for invalidated session", v19, 2u);
  }

LABEL_6:
}

- (void)cancelAllRequests
{
  id v5 = self->_amsUrlSession;
  v3 = [(AMSURLSession *)[IMURLSession alloc] initWithConfiguration:self->_configuration];
  amsUrlSession = self->_amsUrlSession;
  self->_amsUrlSession = v3;

  [(IMURLSession *)v5 invalidateAndCancel];
}

- (void)signRequest:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  uint64_t v8 = v7;

  objc_msgSend(v5, "appendFormat:", @"%.0f", v8);
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"X-JS-TIMESTAMP=%.0f", v8);
  [v4 addObject:v9];

  id v10 = [v3 valueForHTTPHeaderField:@"X-Apple-Store-Front"];
  if (v10) {
    [v5 appendString:v10];
  }
  id v11 = (void *)MEMORY[0x1E4F29088];
  uint64_t v12 = [v3 URL];
  id v13 = [v11 componentsWithURL:v12 resolvingAgainstBaseURL:0];

  v32 = v13;
  uint64_t v14 = [v13 query];
  BOOL v15 = +[NSURLUtil queryStringToQueryDictionary:v14];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v16 = [(id)objc_opt_class() signatureQueryParams];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [v15 valueForKey:*(void *)(*((void *)&v33 + 1) + 8 * v20)];
        if (v21) {
          [v5 appendString:v21];
        }

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v18);
  }

  id v22 = v5;
  uint64_t v23 = [v22 UTF8String];
  if (v23)
  {
    v24 = (const void *)v23;
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:20];
    CC_LONG v26 = [v22 length];
    id v27 = v25;
    CC_SHA1(v24, v26, (unsigned __int8 *)[v27 mutableBytes]);
    [v27 setLength:16];
    id v28 = v27;
    fd3fa4R8(3, [v28 mutableBytes]);
    v29 = [v28 base64EncodedStringWithOptions:0];
    if (v29)
    {
      v30 = [NSString stringWithFormat:@"X-JS-SP-TOKEN=%@", v29];
      [v4 addObject:v30];
    }
  }
  if ([v4 count])
  {
    v31 = [v4 componentsJoinedByString:@"; "];
    [v3 setValue:v31 forHTTPHeaderField:@"Cookie"];
  }
}

+ (id)signatureQueryParams
{
  if (signatureQueryParams_predicate != -1) {
    dispatch_once(&signatureQueryParams_predicate, &__block_literal_global_17);
  }
  v2 = (void *)signatureQueryParams_signatureQueryParams;
  return v2;
}

void __42__IMBaseStoreService_signatureQueryParams__block_invoke()
{
  v0 = (void *)signatureQueryParams_signatureQueryParams;
  signatureQueryParams_signatureQueryParams = (uint64_t)&unk_1F03D88F8;
}

- (BOOL)wantsJSSignature
{
  return self->_wantsJSSignature;
}

- (void)setWantsJSSignature:(BOOL)a3
{
  self->_BOOL wantsJSSignature = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSURLSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (unint64_t)encodingType
{
  return self->_encodingType;
}

- (void)setEncodingType:(unint64_t)a3
{
  self->_unint64_t encodingType = a3;
}

- (void)setAmsUrlSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amsUrlSession, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end