@interface WBSOnDeviceSearchSuggestionsModelDownloader
- (WBSOnDeviceSearchSuggestionsModelDownloader)init;
- (void)_callCompletionHandlerWithError:(id)a3;
- (void)_cancelPendingDownload;
- (void)_downloadModelAtEndpoint:(id)a3 forLocale:(id)a4;
- (void)downloadOnDeviceSearchSuggestionsModelForLocale:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation WBSOnDeviceSearchSuggestionsModelDownloader

- (WBSOnDeviceSearchSuggestionsModelDownloader)init
{
  v10.receiver = self;
  v10.super_class = (Class)WBSOnDeviceSearchSuggestionsModelDownloader;
  v2 = [(WBSOnDeviceSearchSuggestionsModelDownloader *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(WBSOnDeviceSearchSuggestionsModelEndpointFetcher);
    endpointFetcher = v2->_endpointFetcher;
    v2->_endpointFetcher = v3;

    v5 = objc_msgSend(MEMORY[0x1E4F18DD0], "safari_ephemeralSessionConfiguration");
    [v5 setURLCache:0];
    uint64_t v6 = [MEMORY[0x1E4F18DC0] sessionWithConfiguration:v5];
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)_cancelPendingDownload
{
  [(NSURLSessionDownloadTask *)self->_downloadTask cancel];
  downloadTask = self->_downloadTask;
  self->_downloadTask = 0;

  id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSOnDeviceSearchSuggestionsModelDownloaderErrorDomain" code:0 userInfo:0];
  [(WBSOnDeviceSearchSuggestionsModelDownloader *)self _callCompletionHandlerWithError:v4];
}

- (void)_callCompletionHandlerWithError:(id)a3
{
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, a3);
    id v5 = self->_completionHandler;
    self->_completionHandler = 0;

    downloadTask = self->_downloadTask;
    self->_downloadTask = 0;
  }
}

- (void)downloadOnDeviceSearchSuggestionsModelForLocale:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WBSOnDeviceSearchSuggestionsModelDownloader *)self _cancelPendingDownload];
  v8 = (void *)[v7 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v8;

  objc_super v10 = +[WBSOnDeviceSearchSuggestionsModelManager sharedManager];
  objc_initWeak(&location, self);
  endpointFetcher = self->_endpointFetcher;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __117__WBSOnDeviceSearchSuggestionsModelDownloader_downloadOnDeviceSearchSuggestionsModelForLocale_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E5C9DF88;
  objc_copyWeak(&v17, &location);
  id v12 = v6;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [(WBSOnDeviceSearchSuggestionsModelEndpointFetcher *)endpointFetcher fetchModelEndpointURLsWithCompletionHandler:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __117__WBSOnDeviceSearchSuggestionsModelDownloader_downloadOnDeviceSearchSuggestionsModelForLocale_withCompletionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      [WeakRetained _callCompletionHandlerWithError:v6];
      goto LABEL_19;
    }
    v9 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_DEFAULT, "Model endpoint successfully fetched", buf, 2u);
    }
    objc_super v10 = a1 + 4;
    v11 = objc_msgSend(a1[4], "safari_localeStringInOfflineSearchModelFormat");
    id v12 = [v5 objectForKeyedSubscript:v11];

    id v13 = a1[5];
    v14 = [v5 allKeys];
    [v13 updateSupportedModelLocales:v14];

    if (v12)
    {
      if ((unint64_t)[v12 sizeInBytes] > 0xA00000)
      {
        id v15 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
          __117__WBSOnDeviceSearchSuggestionsModelDownloader_downloadOnDeviceSearchSuggestionsModelForLocale_withCompletionHandler___block_invoke_cold_1(v10, v15, v12);
        }
        goto LABEL_18;
      }
      id v16 = [a1[5] currentChecksumForModelWithLocale:a1[4]];
      v19 = [v12 checksumString];
      int v20 = [v19 isEqualToString:v16];

      if (!v20)
      {
        [v8 _downloadModelAtEndpoint:v12 forLocale:*v10];
        goto LABEL_17;
      }
      v21 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v22 = 0;
        _os_log_impl(&dword_1A6B5F000, v21, OS_LOG_TYPE_DEFAULT, "No new model for the given checksum", v22, 2u);
      }
      id v17 = v8;
      v18 = 0;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSOnDeviceSearchSuggestionsModelDownloaderErrorDomain" code:1 userInfo:0];
      id v17 = v8;
      v18 = v16;
    }
    [v17 _callCompletionHandlerWithError:v18];
LABEL_17:

LABEL_18:
  }
LABEL_19:
}

- (void)_downloadModelAtEndpoint:(id)a3 forLocale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F18D50];
  v9 = [v6 endpointURL];
  objc_super v10 = [v8 requestWithURL:v9 cachePolicy:1 timeoutInterval:10.0];

  uint64_t v22 = 0;
  v23 = (id *)&v22;
  uint64_t v24 = 0x3042000000;
  v25 = __Block_byref_object_copy__29;
  v26 = __Block_byref_object_dispose__29;
  id v27 = 0;
  objc_initWeak(&location, self);
  urlSession = self->_urlSession;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke;
  v16[3] = &unk_1E5C9DFB0;
  objc_copyWeak(&v20, &location);
  v19 = &v22;
  id v12 = v7;
  id v17 = v12;
  id v13 = v6;
  id v18 = v13;
  v14 = [(NSURLSession *)urlSession downloadTaskWithRequest:v10 completionHandler:v16];
  downloadTask = self->_downloadTask;
  self->_downloadTask = v14;

  objc_storeWeak(v23 + 5, v14);
  [(NSURLSessionDownloadTask *)self->_downloadTask resume];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&v27);
}

void __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      [WeakRetained _callCompletionHandlerWithError:v7];
    }
    else
    {
      id v10 = (id)WeakRetained[1];
      if (v10)
      {
        id v11 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

        if (v10 == v11)
        {
          id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v13 = [v6 absoluteString];
          v14 = [v12 attributesOfItemAtPath:v13 error:0];
          unint64_t v15 = [v14 fileSize];

          if (v15 <= 0xA00000)
          {
            id v17 = (void *)MEMORY[0x1E4F1C9B8];
            id v18 = [v6 path];
            id v44 = 0;
            v19 = [v17 dataWithContentsOfFile:v18 options:8 error:&v44];
            id v20 = v44;

            v21 = NSString;
            uint64_t v22 = objc_msgSend(v19, "safari_SHA1Hash");
            v23 = objc_msgSend(v21, "safari_stringAsHexWithData:", v22);

            uint64_t v24 = [*(id *)(a1 + 40) checksumString];
            uint64_t v25 = [v23 caseInsensitiveCompare:v24];

            v26 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
            id v27 = v26;
            if (v25)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke_cold_2((uint64_t)v23, (void **)(a1 + 40), v27);
              }
              v28 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSOnDeviceSearchSuggestionsModelDownloaderErrorDomain" code:2 userInfo:0];
              [v9 _callCompletionHandlerWithError:v28];
            }
            else
            {
              v40 = v19;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A6B5F000, v27, OS_LOG_TYPE_DEFAULT, "Succeeded in downloading new model data", buf, 2u);
              }
              v28 = +[WBSOnDeviceSearchSuggestionsModelManager sharedManager];
              uint64_t v29 = *(void *)(a1 + 32);
              v30 = [*(id *)(a1 + 40) checksumString];
              [v28 addOrUpdateModelForLocale:v29 withChecksum:v30];

              v31 = [v28 fileURLForModelWithLocale:*(void *)(a1 + 32)];
              v32 = [MEMORY[0x1E4F28CB8] defaultManager];
              v39 = v31;
              v33 = [v31 path];
              LODWORD(v31) = [v32 fileExistsAtPath:v33];

              v34 = [MEMORY[0x1E4F28CB8] defaultManager];
              v35 = v34;
              if (v31)
              {
                id v42 = v20;
                v36 = v39;
                [v34 replaceItemAtURL:v39 withItemAtURL:v6 backupItemName:0 options:1 resultingItemURL:0 error:&v42];
                id v37 = v42;
                v19 = v40;
              }
              else
              {
                uint64_t v38 = [v28 fileURLForModelWithLocale:*(void *)(a1 + 32)];
                id v41 = v20;
                [v35 copyItemAtURL:v6 toURL:v38 error:&v41];
                id v37 = v41;

                id v20 = (id)v38;
                v19 = v40;
                v36 = v39;
              }

              [v9 _callCompletionHandlerWithError:v37];
              id v20 = v37;
            }
          }
          else
          {
            id v16 = WBS_LOG_CHANNEL_PREFIXOfflineSearchSuggestions();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
              __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke_cold_1(a1, v16);
            }
          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_endpointFetcher, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
}

void __117__WBSOnDeviceSearchSuggestionsModelDownloader_downloadOnDeviceSearchSuggestionsModelForLocale_withCompletionHandler___block_invoke_cold_1(void **a1, void *a2, void *a3)
{
  id v4 = *a1;
  id v5 = a2;
  id v6 = objc_msgSend(v4, "safari_localeStringInOfflineSearchModelFormat");
  id v7 = [a3 checksumString];
  [a3 sizeInBytes];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_11(&dword_1A6B5F000, v8, v9, "Model for locale: %{private}@ with checksum: %{public}@ reports size: %ld which exceeds maximum (10 MB)", v10, v11, v12, v13, v14);
}

void __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke_cold_1(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = objc_msgSend(v3, "safari_localeStringInOfflineSearchModelFormat");
  id v6 = [*(id *)(a1 + 40) checksumString];
  [*(id *)(a1 + 40) sizeInBytes];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_11(&dword_1A6B5F000, v7, v8, "Downloaded model for locale: %{private}@ with checksum: %{public}@ has size: %ld which exceeds maximum (10 MB)", v9, v10, v11, v12, v13);
}

void __82__WBSOnDeviceSearchSuggestionsModelDownloader__downloadModelAtEndpoint_forLocale___block_invoke_cold_2(uint64_t a1, void **a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = *a2;
  id v5 = a3;
  id v6 = [v4 checksumString];
  int v7 = 138543618;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1A6B5F000, v5, OS_LOG_TYPE_ERROR, "Computed SHA1 checksum: %{public}@ does not the expected checksum: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end