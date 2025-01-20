@interface WKWebView(WBSWKWebViewExtras)
- (void)safari_saveWebpageCompleteToURL:()WBSWKWebViewExtras withCollectionMethod:collectionOptions:completionHandler:;
@end

@implementation WKWebView(WBSWKWebViewExtras)

- (void)safari_saveWebpageCompleteToURL:()WBSWKWebViewExtras withCollectionMethod:collectionOptions:completionHandler:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v12 = [a1 _committedURL];
  v13 = WBS_LOG_CHANNEL_PREFIXDownloads();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558531;
    uint64_t v34 = 1752392040;
    __int16 v35 = 2117;
    v36 = v12;
    __int16 v37 = 2048;
    uint64_t v38 = a5;
    _os_log_impl(&dword_1ABB70000, v13, OS_LOG_TYPE_DEFAULT, "Saving Page Complete for %{sensitive, mask.hash}@ with options %zu", buf, 0x20u);
  }
  id v14 = v10;
  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v31 = 0;
  char v16 = [v15 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v31];
  id v17 = v31;

  if (v16)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F46750]);
    [v18 setDirectory:v14];
    [v18 setSuggestedFileName:@"index.html"];
    if ((a5 & 4) != 0)
    {
      uint64_t v23 = a4;
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F46758]) initWithElementLocalName:@"script" attributeLocalNames:0 attributeValues:0];
      v32[0] = v19;
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F46758]) initWithElementLocalName:@"noscript" attributeLocalNames:0 attributeValues:0];
      v32[1] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
      [v18 setExclusionRules:v21];

      a4 = v23;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __122__WKWebView_WBSWKWebViewExtras__safari_saveWebpageCompleteToURL_withCollectionMethod_collectionOptions_completionHandler___block_invoke;
    v24[3] = &unk_1E5E40720;
    id v28 = v11;
    uint64_t v29 = a5;
    v24[4] = a1;
    id v25 = v14;
    id v26 = v12;
    v27 = @"index.html";
    uint64_t v30 = a4;
    [a1 _archiveWithConfiguration:v18 completionHandler:v24];
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[WKWebView(WBSWKWebViewExtras) safari_saveWebpageCompleteToURL:withCollectionMethod:collectionOptions:completionHandler:]();
    }
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v17);
  }
}

- (void)safari_saveWebpageCompleteToURL:()WBSWKWebViewExtras withCollectionMethod:collectionOptions:completionHandler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2113;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1ABB70000, v1, OS_LOG_TYPE_ERROR, "Failed to create directory at %{private}@: %{private}@", v2, 0x16u);
}

@end