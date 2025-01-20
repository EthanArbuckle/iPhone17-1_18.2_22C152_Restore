@interface SiriUIURLSession
+ (id)sharedURLSession;
- (NSString)description;
- (SiriUIURLSession)init;
- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 completionHandler:(id)a5;
- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 completionHandler:(id)a6;
- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 fillColor:(id)a6 completionHandler:(id)a7;
- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 fillColor:(id)a6 userAgent:(id)a7 completionHandler:(id)a8;
- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 incremental:(BOOL)a6 progressHandler:(id)a7 fillColor:(id)a8;
- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 incremental:(BOOL)a6 progressHandler:(id)a7 fillColor:(id)a8 userAgent:(id)a9;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_registerTask:(id)a3 forClient:(id)a4;
- (void)_unregisterTask:(id)a3 forClient:(id)a4;
- (void)cancelAllTasksForClient:(id)a3;
@end

@implementation SiriUIURLSession

+ (id)sharedURLSession
{
  if (sharedURLSession_onceToken != -1) {
    dispatch_once(&sharedURLSession_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedURLSession_sharedURLSession;
  return v2;
}

uint64_t __36__SiriUIURLSession_sharedURLSession__block_invoke()
{
  v0 = objc_alloc_init(SiriUIURLSession);
  uint64_t v1 = sharedURLSession_sharedURLSession;
  sharedURLSession_sharedURLSession = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SiriUIURLSession)init
{
  v13.receiver = self;
  v13.super_class = (Class)SiriUIURLSession;
  v2 = [(SiriUIURLSession *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    [v3 setHTTPShouldSetCookies:0];
    [v3 setHTTPCookieAcceptPolicy:1];
    v4 = (void *)MEMORY[0x263F08BF8];
    v5 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v6 = [v4 sessionWithConfiguration:v3 delegate:v2 delegateQueue:v5];
    URLSession = v2->_URLSession;
    v2->_URLSession = (NSURLSession *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    tasksForClient = v2->_tasksForClient;
    v2->_tasksForClient = (NSMapTable *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    imageDownloadForTask = v2->_imageDownloadForTask;
    v2->_imageDownloadForTask = (NSMapTable *)v10;
  }
  return v2;
}

- (NSString)description
{
  v8.receiver = self;
  v8.super_class = (Class)SiriUIURLSession;
  v3 = [(SiriUIURLSession *)&v8 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(NSMapTable *)self->_tasksForClient dictionaryRepresentation];
  uint64_t v6 = [v5 description];

  if (v6)
  {
    [v4 appendString:@" tasksForClient="];
    [v4 appendString:v6];
  }

  return (NSString *)v4;
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 completionHandler:(id)a5
{
  return -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:completionHandler:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:completionHandler:", a3, a4, a5, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 completionHandler:(id)a6
{
  return -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:completionHandler:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:completionHandler:", a3, a4, 0, a6, a5.width, a5.height);
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 fillColor:(id)a6 completionHandler:(id)a7
{
  return -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:userAgent:completionHandler:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:fillColor:userAgent:completionHandler:", a3, a4, a6, 0, a7, a5.width, a5.height);
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 fillColor:(id)a6 userAgent:(id)a7 completionHandler:(id)a8
{
  double height = a5.height;
  double width = a5.width;
  id v15 = a8;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __103__SiriUIURLSession_imageTaskWithHTTPGetRequest_client_fitToSize_fillColor_userAgent_completionHandler___block_invoke;
  v19[3] = &unk_26469F120;
  id v20 = v15;
  id v16 = v15;
  v17 = -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:", a3, a4, 0, v19, a6, a7, width, height);

  return v17;
}

uint64_t __103__SiriUIURLSession_imageTaskWithHTTPGetRequest_client_fitToSize_fillColor_userAgent_completionHandler___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 incremental:(BOOL)a6 progressHandler:(id)a7 fillColor:(id)a8
{
  return -[SiriUIURLSession imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:](self, "imageTaskWithHTTPGetRequest:client:fitToSize:incremental:progressHandler:fillColor:userAgent:", a3, a4, a6, a7, a8, 0, a5.width, a5.height);
}

- (id)imageTaskWithHTTPGetRequest:(id)a3 client:(id)a4 fitToSize:(CGSize)a5 incremental:(BOOL)a6 progressHandler:(id)a7 fillColor:(id)a8 userAgent:(id)a9
{
  BOOL v12 = a6;
  double height = a5.height;
  double width = a5.width;
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v17)
  {
    v22 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v17];
    if ([v21 length]) {
      [v22 setValue:v21 forHTTPHeaderField:@"User-Agent"];
    }
    v23 = [(NSURLSession *)self->_URLSession dataTaskWithRequest:v22];
    [(SiriUIURLSession *)self _registerTask:v23 forClient:v18];
    if ([v23 state] == 1) {
      [v23 resume];
    }
    v24 = [SiriUIURLSessionImageDownload alloc];
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __113__SiriUIURLSession_imageTaskWithHTTPGetRequest_client_fitToSize_incremental_progressHandler_fillColor_userAgent___block_invoke;
    v32 = &unk_26469F148;
    id v36 = v19;
    v33 = self;
    id v25 = v23;
    id v34 = v25;
    id v35 = v18;
    v26 = -[SiriUIURLSessionImageDownload initWithFitToSize:progressHandler:incremental:client:fillColor:](v24, "initWithFitToSize:progressHandler:incremental:client:fillColor:", &v29, v12, v35, v20, width, height);
    -[NSMapTable setObject:forKey:](self->_imageDownloadForTask, "setObject:forKey:", v26, v25, v29, v30, v31, v32, v33);
    id v27 = v25;
  }
  else
  {
    if (v19) {
      (*((void (**)(id, void, uint64_t))v19 + 2))(v19, 0, 1);
    }
    id v27 = 0;
  }

  return v27;
}

uint64_t __113__SiriUIURLSession_imageTaskWithHTTPGetRequest_client_fitToSize_incremental_progressHandler_fillColor_userAgent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = v5;
  if (v6)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v5, a3);
    id v5 = v8;
  }
  if (a3)
  {
    uint64_t v6 = [*(id *)(a1 + 32) _unregisterTask:*(void *)(a1 + 40) forClient:*(void *)(a1 + 48)];
    id v5 = v8;
  }
  return MEMORY[0x270F9A758](v6, v5);
}

- (void)cancelAllTasksForClient:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v3 = -[NSMapTable objectForKey:](self->_tasksForClient, "objectForKey:");
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) cancel];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)_registerTask:(id)a3 forClient:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    id v7 = [(NSMapTable *)self->_tasksForClient objectForKey:v6];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(NSMapTable *)self->_tasksForClient setObject:v7 forKey:v6];
    }
    [v7 addObject:v8];
  }
}

- (void)_unregisterTask:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  if (a3 && v6)
  {
    tasksForClient = self->_tasksForClient;
    id v10 = v6;
    id v8 = a3;
    long long v9 = [(NSMapTable *)tasksForClient objectForKey:v10];
    [v9 removeObject:v8];

    if (![v9 count]) {
      [(NSMapTable *)self->_tasksForClient removeObjectForKey:v10];
    }

    id v6 = v10;
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  imageDownloadForTask = self->_imageDownloadForTask;
  id v7 = a5;
  id v8 = a4;
  id v11 = [(NSMapTable *)imageDownloadForTask objectForKey:v8];
  long long v9 = [v8 originalRequest];

  id v10 = [v9 URL];
  [v11 appendDownloadedData:v7 fromURL:v10];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  imageDownloadForTask = self->_imageDownloadForTask;
  id v8 = a5;
  id v9 = a4;
  id v12 = [(NSMapTable *)imageDownloadForTask objectForKey:v9];
  id v10 = [v9 originalRequest];
  id v11 = [v10 URL];
  [v12 finishedFromURL:v11 error:v8];

  [(NSMapTable *)self->_imageDownloadForTask removeObjectForKey:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDownloadForTask, 0);
  objc_storeStrong((id *)&self->_tasksForClient, 0);
  objc_storeStrong((id *)&self->_URLSession, 0);
}

@end