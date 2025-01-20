@interface NTKGreenfieldDownloader
- (BOOL)_copyFileFromURL:(id)a3;
- (NTKGreenfieldDownloader)initWithWatchFaceURL:(id)a3;
- (id)_downloadURL;
- (id)_downloadedFolderURL;
- (int64_t)_greenfieldErrorFromURLSessionError:(int64_t)a3;
- (void)cancelDownload;
- (void)downloadCleanUp;
- (void)downloadWithCompletionBlock:(id)a3;
@end

@implementation NTKGreenfieldDownloader

- (NTKGreenfieldDownloader)initWithWatchFaceURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldDownloader;
  v6 = [(NTKGreenfieldDownloader *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteWatchFaceURL, a3);
    id v8 = [NSString alloc];
    v9 = [MEMORY[0x1E4F29128] UUID];
    v10 = (void *)[v8 initWithFormat:@"%@.watchface", v9];

    v11 = [(NTKGreenfieldDownloader *)v7 _downloadedFolderURL];
    uint64_t v12 = [v11 URLByAppendingPathComponent:v10];
    downloadedFileURL = v7->_downloadedFileURL;
    v7->_downloadedFileURL = (NSURL *)v12;
  }
  return v7;
}

- (id)_downloadedFolderURL
{
  if (_downloadedFolderURL_onceToken != -1) {
    dispatch_once(&_downloadedFolderURL_onceToken, &__block_literal_global_86);
  }
  v2 = (void *)_downloadedFolderURL_downloadedFolderURL;
  return v2;
}

void __47__NTKGreenfieldDownloader__downloadedFolderURL__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CB10];
  NSTemporaryDirectory();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v0 fileURLWithPath:v4];
  uint64_t v2 = [v1 URLByAppendingPathComponent:@"watchfacesDownload"];
  v3 = (void *)_downloadedFolderURL_downloadedFolderURL;
  _downloadedFolderURL_downloadedFolderURL = v2;
}

- (id)_downloadURL
{
  uint64_t v2 = [(NSURL *)self->_remoteWatchFaceURL lastPathComponent];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://watch-app.cdn-apple.com/A/com.apple.watchfaces/production/_defaultZone"];
    id v4 = [v3 URLByAppendingPathComponent:v2];

    id v5 = [v4 URLByAppendingPathComponent:@"WatchFaceFile"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)downloadWithCompletionBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NTKGreenfieldDownloader *)self _downloadURL];
  v6 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Downloading file from url: %@", buf, 0xCu);
  }

  if (v5)
  {
    v7 = [MEMORY[0x1E4F290E0] sharedSession];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke;
    v12[3] = &unk_1E62C4D80;
    id v13 = v5;
    v14 = self;
    id v15 = v4;
    id v8 = [v7 downloadTaskWithURL:v13 completionHandler:v12];
    downloadTask = self->_downloadTask;
    self->_downloadTask = v8;

    [(NSURLSessionDownloadTask *)self->_downloadTask resume];
  }
  else
  {
    v10 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(NTKGreenfieldDownloader *)(uint64_t)self downloadWithCompletionBlock:v11];
    }

    v7 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 10);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v7);
  }
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = dispatch_get_global_queue(0, 0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2;
  v17[3] = &unk_1E62C4D58;
  id v18 = v9;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(a1 + 48);
  id v19 = v11;
  uint64_t v20 = v12;
  id v22 = v7;
  id v23 = v13;
  id v21 = v8;
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(v10, v17);
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_3(a1, v2, v3);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_15;
    block[3] = &unk_1E62C0098;
    block[4] = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 72);
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v4 = v16;
  }
  else
  {
    id v5 = (id *)(a1 + 56);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [*v5 statusCode] != 200)
    {
      id v8 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_2(a1, (id *)(a1 + 56), v8);
      }

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_18;
      v13[3] = &unk_1E62C0718;
      id v14 = *(id *)(a1 + 72);
      dispatch_async(MEMORY[0x1E4F14428], v13);
      id v4 = v14;
    }
    else if ([*(id *)(a1 + 48) _copyFileFromURL:*(void *)(a1 + 64)])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_20;
      v9[3] = &unk_1E62C0AE8;
      id v6 = *(id *)(a1 + 72);
      v9[4] = *(void *)(a1 + 48);
      id v10 = v6;
      dispatch_async(MEMORY[0x1E4F14428], v9);
      id v4 = v10;
    }
    else
    {
      id v7 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_1(v7);
      }

      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_19;
      v11[3] = &unk_1E62C0718;
      id v12 = *(id *)(a1 + 72);
      dispatch_async(MEMORY[0x1E4F14428], v11);
      id v4 = v12;
    }
  }
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_15(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", objc_msgSend(*(id *)(a1 + 32), "_greenfieldErrorFromURLSessionError:", objc_msgSend(*(id *)(a1 + 40), "code")));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_18(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_19(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_addWatchFaceErrorWithCode:", 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) path];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)cancelDownload
{
  downloadTask = self->_downloadTask;
  if (downloadTask)
  {
    [(NSURLSessionDownloadTask *)downloadTask cancel];
    id v4 = self->_downloadTask;
    self->_downloadTask = 0;
  }
}

- (void)downloadCleanUp
{
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__NTKGreenfieldDownloader_downloadCleanUp__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(v3, block);
}

void __42__NTKGreenfieldDownloader_downloadCleanUp__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 32);
  id v5 = [v4 _downloadedFolderURL];
  id v6 = [v5 path];
  char v7 = [v2 removeItemAtPath:v6 error:0];

  if ((v7 & 1) == 0)
  {
    id v8 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __42__NTKGreenfieldDownloader_downloadCleanUp__block_invoke_cold_1(v3, v8);
    }
  }
  id v9 = (void *)*((void *)*v3 + 2);
  *((void *)*v3 + 2) = 0;
}

- (int64_t)_greenfieldErrorFromURLSessionError:(int64_t)a3
{
  if ((unint64_t)(a3 + 1010) >= 0xB) {
    return 4;
  }
  else {
    return 10;
  }
}

- (BOOL)_copyFileFromURL:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [(NTKGreenfieldDownloader *)self _downloadedFolderURL];
  char v7 = [v5 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];

  if ((v7 & 1) == 0)
  {
    id v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKGreenfieldDownloader _copyFileFromURL:](self, v9);
    }
    goto LABEL_11;
  }
  if (([v5 copyItemAtURL:v4 toURL:self->_downloadedFileURL error:0] & 1) == 0)
  {
    id v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKGreenfieldDownloader _copyFileFromURL:]();
    }
    goto LABEL_11;
  }
  if (([v5 removeItemAtURL:v4 error:0] & 1) == 0)
  {
    id v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[NTKGreenfieldDownloader _copyFileFromURL:]();
    }
LABEL_11:

    BOOL v8 = 0;
    goto LABEL_12;
  }
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedFileURL, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_remoteWatchFaceURL, 0);
}

- (void)downloadWithCompletionBlock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_1BC5A9000, a2, a3, "No valid remote url for: %@", (uint8_t *)&v4);
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "File IO Error", v1, 2u);
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [*a2 statusCode];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1BC5A9000, a3, OS_LOG_TYPE_ERROR, "Download failed for url:%@ with status code:%ld", (uint8_t *)&v6, 0x16u);
}

void __55__NTKGreenfieldDownloader_downloadWithCompletionBlock___block_invoke_2_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412290;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0_6(&dword_1BC5A9000, a2, a3, "Download failed for: %@", (uint8_t *)&v4);
}

void __42__NTKGreenfieldDownloader_downloadCleanUp__block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 _downloadedFolderURL];
  int v4 = [v3 path];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_6(&dword_1BC5A9000, a2, v5, "File IO Error Could not remove file at: %@", v6);
}

- (void)_copyFileFromURL:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_6(&dword_1BC5A9000, v0, v1, "File IO Error Could not remove file at: %@", v2);
}

- (void)_copyFileFromURL:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1BC5A9000, v1, OS_LOG_TYPE_ERROR, "File IO Error copying: %@ to %@", v2, 0x16u);
}

- (void)_copyFileFromURL:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  __int16 v3 = [a1 _downloadedFolderURL];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_6(&dword_1BC5A9000, a2, v4, "File IO Error Could not create folder: %@", v5);
}

@end