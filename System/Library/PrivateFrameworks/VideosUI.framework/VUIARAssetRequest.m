@interface VUIARAssetRequest
- (BOOL)isDownloading;
- (NSString)cacheKey;
- (NSString)fileName;
- (NSURL)remoteURL;
- (NSURL)shareURL;
- (NSURLSessionDownloadTask)task;
- (VUIARAssetRequest)initWithRemoteURL:(id)a3 shareURL:(id)a4 fileName:(id)a5;
- (id)_prefixForString:(id)a3;
- (id)cacheDownloadedFileFromLocation:(id)a3;
- (id)cachePath;
- (id)completionHandler;
- (void)cancelDownload;
- (void)recordLog:(id)a3;
- (void)setCacheKey:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setFileName:(id)a3;
- (void)setIsDownloading:(BOOL)a3;
- (void)setRemoteURL:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setTask:(id)a3;
- (void)startDownloadWithSession:(id)a3 completionHandler:(id)a4;
@end

@implementation VUIARAssetRequest

- (VUIARAssetRequest)initWithRemoteURL:(id)a3 shareURL:(id)a4 fileName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VUIARAssetRequest;
  v11 = [(VUIARAssetRequest *)&v20 init];
  v12 = v11;
  if (v11)
  {
    [(VUIARAssetRequest *)v11 setFileName:v10];
    [(VUIARAssetRequest *)v12 setRemoteURL:v8];
    [(VUIARAssetRequest *)v12 setShareURL:v9];
    v13 = [v8 relativePath];
    v14 = [(VUIARAssetRequest *)v12 _prefixForString:v13];

    fileName = v12->_fileName;
    if (fileName) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16)
    {
      v17 = fileName;
    }
    else
    {
      objc_msgSend(v14, "stringByAppendingString:");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    [(VUIARAssetRequest *)v12 setCacheKey:v17];
  }
  return v12;
}

- (void)startDownloadWithSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  [(VUIARAssetRequest *)self setCompletionHandler:a4];
  id v7 = [v6 downloadTaskWithURL:self->_remoteURL];

  [(VUIARAssetRequest *)self setTask:v7];
  [(VUIARAssetRequest *)self setIsDownloading:1];
  [v7 resume];
}

- (void)cancelDownload
{
  [(VUIARAssetRequest *)self setIsDownloading:0];
  id v3 = [(VUIARAssetRequest *)self task];
  [v3 cancel];
}

- (id)cachePath
{
  VUIRequireMainThread();
  id v3 = [MEMORY[0x1E4FB3C30] sharedInstance];
  v4 = [v3 assetPathForKey:self->_cacheKey inGroupOfType:3];

  return v4;
}

- (id)cacheDownloadedFileFromLocation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  VUIRequireMainThread();
  if (v4 && self->_cacheKey)
  {
    v5 = [MEMORY[0x1E4FB3C30] sharedInstance];
    id v6 = [v4 relativePath];
    [v5 setImageAssetFromPath:v6 forKey:self->_cacheKey inGroupOfType:3 expiryDate:0];

    id v7 = [v5 assetPathForKey:self->_cacheKey inGroupOfType:3];
    id v8 = VUIDefaultLogObject();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v13 = 138412290;
        v14 = v7;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIARAssetRequest - Downloaded file is successfully cached: %@", (uint8_t *)&v13, 0xCu);
      }

      id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    }
    else
    {
      if (v9)
      {
        cacheKey = self->_cacheKey;
        int v13 = 138412546;
        v14 = cacheKey;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIARAssetRequest - Unable to cache the downloaded file with VUIAssetLibrary: %@, %@", (uint8_t *)&v13, 0x16u);
      }

      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)recordLog:(id)a3
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v13[0] = @"AR download failure";
    v12[0] = @"message";
    v12[1] = @"errorCode";
    id v3 = (void *)MEMORY[0x1E4F28ED0];
    id v4 = a3;
    uint64_t v5 = objc_msgSend(v3, "numberWithLong:", objc_msgSend(v4, "code"));
    id v6 = (void *)v5;
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    else {
      id v7 = &stru_1F3E921E0;
    }
    v13[1] = v7;
    v12[2] = @"errorDomain";
    id v8 = [v4 domain];

    if (v8) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = &stru_1F3E921E0;
    }
    v13[2] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];

    v11 = +[VUIMetricsController sharedInstance];
    [v11 recordLog:v10];
  }
}

- (id)_prefixForString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if ([v3 length])
    {
      uint64_t v4 = 0;
      unsigned int v5 = 1;
      uint64_t v6 = 0x7FFFFFFFLL;
      do
      {
        v6 ^= [v3 characterAtIndex:v4];
        uint64_t v4 = v5;
      }
      while ([v3 length] > (unint64_t)v5++);
    }
    else
    {
      uint64_t v6 = 0x7FFFFFFFLL;
    }
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld_", v6);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)isDownloading
{
  return self->_isDownloading;
}

- (void)setIsDownloading:(BOOL)a3
{
  self->_isDownloading = a3;
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSURLSessionDownloadTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
}

@end