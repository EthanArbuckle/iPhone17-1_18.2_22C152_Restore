@interface RUIImageLoad
- (BOOL)receivedValidResponse:(id)a3;
- (NSURL)URL;
- (void)dealloc;
- (void)setURL:(id)a3;
- (void)start;
@end

@implementation RUIImageLoad

- (void)dealloc
{
  [(NSURLSession *)self->_urlSession invalidateAndCancel];
  v3.receiver = self;
  v3.super_class = (Class)RUIImageLoad;
  [(RUIImageLoad *)&v3 dealloc];
}

- (BOOL)receivedValidResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0
    || (unint64_t)([v3 statusCode] / 100 - 6) < 0xFFFFFFFFFFFFFFFELL;

  return v4;
}

- (void)start
{
  id v3 = [MEMORY[0x263F089E0] requestWithURL:self->_URL];
  urlSession = self->_urlSession;
  if (!urlSession)
  {
    v5 = (void *)MEMORY[0x263F08BF8];
    v6 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v7 = [v5 sessionWithConfiguration:v6];
    v8 = self->_urlSession;
    self->_urlSession = v7;

    urlSession = self->_urlSession;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __21__RUIImageLoad_start__block_invoke;
  v11[3] = &unk_2642116D8;
  v11[4] = self;
  v9 = [(NSURLSession *)urlSession dataTaskWithRequest:v3 completionHandler:v11];
  dataTask = self->_dataTask;
  self->_dataTask = v9;

  [(NSURLSessionDataTask *)self->_dataTask resume];
}

void __21__RUIImageLoad_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  v9 = *(void **)(a1 + 32);
  id v10 = a4;
  if (([v9 receivedValidResponse:v8] & 1) == 0)
  {
    if (_isInternalInstall())
    {
      v11 = _RUILoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v8;
        _os_log_impl(&dword_2144F2000, v11, OS_LOG_TYPE_DEFAULT, "RUIImageLoad received invalid response: %@", (uint8_t *)&v16, 0xCu);
      }
    }
    id v7 = 0;
  }
  v12 = +[RUIImageLoader sharedImageLoader];
  [v12 _setImageData:v7 forURL:*(void *)(*(void *)(a1 + 32) + 24) error:v10];

  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 16);
  *(void *)(v13 + 16) = 0;

  v15 = +[RUIImageLoader sharedImageLoader];
  [v15 _imageLoadFinished:*(void *)(a1 + 32)];
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end