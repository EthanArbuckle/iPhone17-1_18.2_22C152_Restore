@interface RUIHTTPRequest
+ (BOOL)anyRequestLoading;
+ (id)errorWithCode:(unint64_t)a3;
+ (id)invalidResponseErrorWithResponse:(id)a3;
+ (id)nonSecureConnectionNotAllowedError;
+ (id)safeBaseURL;
+ (id)serviceUnavailableError;
- (BOOL)isLoading;
- (BOOL)receivedValidResponse:(id)a3 forRequest:(id)a4;
- (RUIHTTPRequest)init;
- (id)delegate;
- (id)handleWillLoadRequest:(id)a3;
- (id)request;
- (id)sessionConfiguration;
- (id)urlSessionDelegate;
- (void)_finishedLoading;
- (void)_loadRequestMain:(id)a3;
- (void)_preLoadCancel;
- (void)_startedLoading;
- (void)dealloc;
- (void)failWithError:(id)a3 forRequest:(id)a4;
- (void)loadRequest:(id)a3;
- (void)loadStatusChanged;
- (void)parseData:(id)a3;
- (void)parseData:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)shouldLoadRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation RUIHTTPRequest

+ (id)errorWithCode:(unint64_t)a3
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:RUIHTTPRequestErrorDomain code:a3 userInfo:0];
}

+ (id)serviceUnavailableError
{
  return (id)[a1 errorWithCode:2];
}

+ (id)invalidResponseErrorWithResponse:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = @"statusCode";
    v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "statusCode"));
    v8[1] = RUIHTTPResponseKey;
    v9[0] = v4;
    v9[1] = v3;
    v5 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  }
  else
  {
    v5 = 0;
  }
  v6 = [MEMORY[0x263F087E8] errorWithDomain:RUIHTTPRequestErrorDomain code:3 userInfo:v5];

  return v6;
}

+ (id)nonSecureConnectionNotAllowedError
{
  return (id)[a1 errorWithCode:5];
}

+ (BOOL)anyRequestLoading
{
  return _loadingRequestCount != 0;
}

+ (id)safeBaseURL
{
  v2 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v2 UUIDString];

  v4 = NSURL;
  v5 = [NSString stringWithFormat:@"x-remoteui://%@/", v3];
  v6 = [v4 URLWithString:v5];

  if (!v6)
  {
    v7 = NSURL;
    v8 = [NSString stringWithFormat:@"x-remoteui://remoteui/"];
    v6 = [v7 URLWithString:v8];
  }
  return v6;
}

- (RUIHTTPRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)RUIHTTPRequest;
  return [(RUIHTTPRequest *)&v3 init];
}

- (void)dealloc
{
  if (self->_dataTask && _isInternalInstall())
  {
    objc_super v3 = _RUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, v3, OS_LOG_TYPE_DEFAULT, "RUIHTTPRequest dealloc, canceling active reqeust", buf, 2u);
    }
  }
  [(RUIHTTPRequest *)self cancel];
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  v4.receiver = self;
  v4.super_class = (Class)RUIHTTPRequest;
  [(RUIHTTPRequest *)&v4 dealloc];
}

- (void)_startedLoading
{
}

- (void)_finishedLoading
{
  --_loadingRequestCount;
  dataTask = self->_dataTask;
  self->_dataTask = 0;

  [(RUIHTTPRequest *)self loadStatusChanged];
}

- (void)_loadRequestMain:(id)a3
{
  id v4 = a3;
  [(RUIHTTPRequest *)self _preLoadCancel];
  if (_isInternalInstall())
  {
    v5 = _RUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, v5, OS_LOG_TYPE_INFO, "Querying overrides before loading the request...", buf, 2u);
    }
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__RUIHTTPRequest__loadRequestMain___block_invoke;
  v6[3] = &unk_264211860;
  v6[4] = self;
  [(RUIHTTPRequest *)self shouldLoadRequest:v4 completionHandler:v6];
}

void __35__RUIHTTPRequest__loadRequestMain___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (!*(void *)(v8 + 24))
    {
      v9 = [(id)v8 sessionConfiguration];
      if (!v9)
      {
        v9 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
      }
      v10 = [*(id *)(a1 + 32) urlSessionDelegate];
      v11 = (void *)MEMORY[0x263F08BF8];
      v12 = [MEMORY[0x263F08A48] mainQueue];
      uint64_t v13 = [v11 sessionWithConfiguration:v9 delegate:v10 delegateQueue:v12];
      uint64_t v14 = *(void *)(a1 + 32);
      v15 = *(void **)(v14 + 24);
      *(void *)(v14 + 24) = v13;

      uint64_t v8 = *(void *)(a1 + 32);
    }
    objc_storeStrong((id *)(v8 + 8), a2);
    v16 = [v6 HTTPMethod];
    v17 = [v16 lowercaseString];
    int v18 = [v17 isEqualToString:@"post"];

    int isInternalInstall = _isInternalInstall();
    if (v18)
    {
      if (isInternalInstall)
      {
        v20 = _RUILoggingFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [*(id *)(*(void *)(a1 + 32) + 8) URL];
          *(_DWORD *)buf = 138412290;
          v35 = v21;
          _os_log_impl(&dword_2144F2000, v20, OS_LOG_TYPE_DEFAULT, "RUIHTTPRequest POST, URL = %@", buf, 0xCu);
LABEL_13:

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (isInternalInstall)
    {
      v20 = _RUILoggingFacility();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v6 HTTPMethod];
        v22 = [*(id *)(*(void *)(a1 + 32) + 8) URL];
        *(_DWORD *)buf = 138412546;
        v35 = v21;
        __int16 v36 = 2112;
        v37 = v22;
        _os_log_impl(&dword_2144F2000, v20, OS_LOG_TYPE_DEFAULT, "RUIHTTPRequest %@, URL = %@", buf, 0x16u);

        goto LABEL_13;
      }
LABEL_14:
    }
    uint64_t v23 = *(void *)(a1 + 32);
    v24 = *(void **)(v23 + 24);
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    v30 = __35__RUIHTTPRequest__loadRequestMain___block_invoke_30;
    v31 = &unk_264211838;
    uint64_t v32 = v23;
    id v33 = v6;
    uint64_t v25 = [v24 dataTaskWithRequest:v33 completionHandler:&v28];
    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(void **)(v26 + 16);
    *(void *)(v26 + 16) = v25;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "resume", v28, v29, v30, v31, v32);
    [*(id *)(a1 + 32) _startedLoading];
  }
}

void __35__RUIHTTPRequest__loadRequestMain___block_invoke_30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__RUIHTTPRequest__loadRequestMain___block_invoke_2;
  block[3] = &unk_264211810;
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  id v16 = v9;
  uint64_t v17 = v10;
  id v18 = v8;
  id v19 = v11;
  id v20 = v7;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __35__RUIHTTPRequest__loadRequestMain___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32)) {
    int v2 = 0;
  }
  else {
    int v2 = [*(id *)(a1 + 40) receivedValidResponse:*(void *)(a1 + 48) forRequest:*(void *)(a1 + 56)];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && _isInternalInstall())
  {
    objc_super v3 = _RUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 48) allHeaderFields];
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_2144F2000, v3, OS_LOG_TYPE_DEFAULT, "Response Headers: %@", buf, 0xCu);
    }
  }
  v5 = *(void **)(a1 + 40);
  if (v5[2]) {
    [v5 _finishedLoading];
  }
  if (v2)
  {
    [*(id *)(a1 + 40) willParseData];
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 64);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__RUIHTTPRequest__loadRequestMain___block_invoke_31;
    v11[3] = &unk_2642112D8;
    v11[4] = v6;
    [v6 parseData:v7 completion:v11];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    if (v8)
    {
      [*(id *)(a1 + 40) failWithError:v8 forRequest:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v10 = +[RUIHTTPRequest invalidResponseErrorWithResponse:*(void *)(a1 + 48)];
      [v9 failWithError:v10 forRequest:*(void *)(a1 + 56)];
    }
  }
}

void __35__RUIHTTPRequest__loadRequestMain___block_invoke_31(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__RUIHTTPRequest__loadRequestMain___block_invoke_2_32;
  block[3] = &unk_2642112D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __35__RUIHTTPRequest__loadRequestMain___block_invoke_2_32(uint64_t a1)
{
  return [*(id *)(a1 + 32) didParseData];
}

- (void)loadRequest:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__RUIHTTPRequest_loadRequest___block_invoke;
  v6[3] = &unk_264211888;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __30__RUIHTTPRequest_loadRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadRequestMain:*(void *)(a1 + 40)];
}

- (void)shouldLoadRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = [(RUIHTTPRequest *)self handleWillLoadRequest:a3];
  (*((void (**)(id, id, void))a4 + 2))(v7, v8, 0);
}

- (id)handleWillLoadRequest:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)sessionConfiguration
{
  return 0;
}

- (id)urlSessionDelegate
{
  return 0;
}

- (void)_preLoadCancel
{
  dataTask = self->_dataTask;
  if (dataTask)
  {
    [(NSURLSessionDataTask *)dataTask cancel];
    [(RUIHTTPRequest *)self _finishedLoading];
  }
  request = self->_request;
  self->_request = 0;
}

- (BOOL)isLoading
{
  return self->_dataTask != 0;
}

- (void)loadStatusChanged
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:RUIHTTPRequestLoadingStatusDidChangeNotification object:self];
}

- (id)request
{
  return self->_request;
}

- (void)parseData:(id)a3
{
  NSStringFromSelector(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_ToBeImplemente.isa, v3);
}

- (void)parseData:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  [(RUIHTTPRequest *)self parseData:a3];
  v6[2]();
}

- (void)failWithError:(id)a3 forRequest:(id)a4
{
  NSStringFromSelector(a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_ToBeImplemente.isa, v4);
}

- (BOOL)receivedValidResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (_isInternalInstall())
    {
      id v6 = _RUILoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        uint64_t v10 = [v5 statusCode];
        _os_log_impl(&dword_2144F2000, v6, OS_LOG_TYPE_DEFAULT, "RUIHTTPRequest Response StatusCode: %ld", (uint8_t *)&v9, 0xCu);
      }
    }
    BOOL v7 = (unint64_t)([v5 statusCode] / 100 - 6) < 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end