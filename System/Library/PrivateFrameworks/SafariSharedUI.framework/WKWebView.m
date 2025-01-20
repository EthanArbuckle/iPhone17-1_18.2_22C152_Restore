@interface WKWebView
@end

@implementation WKWebView

void __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_cold_1();
    }
    v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    if ((*(unsigned char *)(a1 + 72) & 2) != 0)
    {
      v6 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_10;
      v11[3] = &unk_1E5E406F8;
      id v16 = *(id *)(a1 + 64);
      id v12 = *(id *)(a1 + 40);
      id v7 = *(id *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      id v13 = v7;
      uint64_t v14 = v8;
      id v9 = *(id *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 80);
      id v15 = v9;
      uint64_t v17 = v10;
      [v6 takeSnapshotWithConfiguration:0 completionHandler:v11];

      goto LABEL_8;
    }
    v5 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v5();
LABEL_8:
}

void __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_10(uint64_t a1, UIImage *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_10_cold_3();
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v8 = UIImagePNGRepresentation(a2);
    id v9 = [*(id *)(a1 + 32) URLByAppendingPathComponent:@"capture.png"];
    id v23 = 0;
    char v10 = [v8 writeToURL:v9 options:0 error:&v23];
    id v6 = v23;

    if (v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F98358]);
      [v11 setUrl:*(void *)(a1 + 40)];
      id v12 = [*(id *)(a1 + 48) title];
      [v11 setPageTitle:v12];

      id v13 = [*(id *)(a1 + 48) _userAgent];
      [v11 setUserAgent:v13];

      [*(id *)(a1 + 48) frame];
      objc_msgSend(v11, "setViewportSize:", v14, v15);
      [v11 setIndexFileName:*(void *)(a1 + 56)];
      [v11 setScreenCaptureFileName:@"capture.png"];
      [v11 setCollectionMethod:*(void *)(a1 + 72)];
      id v16 = [*(id *)(a1 + 32) URLByAppendingPathComponent:@"safari_collection_metadata.json"];
      id v22 = v6;
      char v17 = [v11 writeMetadataJSONToURL:v16 error:&v22];
      id v18 = v22;

      if (v17)
      {
        v19 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      }
      else
      {
        v21 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_10_cold_1();
        }
        v19 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      }
      v19();

      id v6 = v18;
    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_10_cold_2();
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1ABB70000, v0, v1, "Failed to save web page: %{private}@", v2, v3, v4, v5, v6);
}

void __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1ABB70000, v0, v1, "Failed to write collection metadata with error: %{private}@", v2, v3, v4, v5, v6);
}

void __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_10_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1ABB70000, v0, v1, "Failed to write page snapshot with error: %{private}@", v2, v3, v4, v5, v6);
}

void __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke_10_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1ABB70000, v0, v1, "Failed to snapshot webpage: %{private}@", v2, v3, v4, v5, v6);
}

@end