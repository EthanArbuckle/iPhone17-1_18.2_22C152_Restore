@interface WBSConfigurationDownloader
+ (id)new;
- (WBSConfigurationDownloader)init;
- (WBSConfigurationDownloader)initWithFileName:(id)a3 dataTransformer:(id)a4;
- (void)cancel;
- (void)downloadConfigurationWithCompletionHandler:(id)a3;
@end

@implementation WBSConfigurationDownloader

- (WBSConfigurationDownloader)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (WBSConfigurationDownloader)initWithFileName:(id)a3 dataTransformer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WBSConfigurationDownloader;
  v8 = [(WBSConfigurationDownloader *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transformer, a4);
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://configuration.apple.com/configurations/internetservices/safari/"];
    baseURL = v9->_baseURL;
    v9->_baseURL = (NSURL *)v10;

    uint64_t v12 = [v6 copy];
    fileName = v9->_fileName;
    v9->_fileName = (NSString *)v12;

    v14 = v9;
  }

  return v9;
}

- (void)downloadConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [MEMORY[0x1E4F18DC0] sharedSession];
  baseURL = self->_baseURL;
  id v7 = [(NSString *)self->_fileName stringByAppendingPathExtension:@"plist"];
  v8 = [(NSURL *)baseURL URLByAppendingPathComponent:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__WBSConfigurationDownloader_downloadConfigurationWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E615AAB0;
  objc_copyWeak(&v14, &location);
  id v9 = v4;
  id v13 = v9;
  uint64_t v10 = [v5 dataTaskWithURL:v8 completionHandler:v12];
  dataTask = self->_dataTask;
  self->_dataTask = v10;

  [(NSURLSessionDataTask *)self->_dataTask resume];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

void __73__WBSConfigurationDownloader_downloadConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 40))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v7)
    {
      id v6 = objc_msgSend(WeakRetained[1], "objectFromData:");
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
    else
    {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
}

- (void)cancel
{
  self->_isCancelled = 1;
  [(NSURLSessionDataTask *)self->_dataTask cancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
}

@end