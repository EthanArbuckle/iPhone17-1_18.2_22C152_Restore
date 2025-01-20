@interface WBSBrowsingDataImportService
- (void)parseChromeExtensionsFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)parseChromeHistoryJSONFromFileHandle:(id)a3 ageLimit:(double)a4 delegate:(id)a5 completionHandler:(id)a6;
- (void)parseCreditCardJSONFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)parseExtensionsFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)parseHistoryJSONFromFileHandle:(id)a3 ageLimit:(double)a4 delegate:(id)a5 completionHandler:(id)a6;
- (void)parseNetscapeBookmarkFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5;
- (void)scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSBrowsingDataImportService

- (void)parseChromeExtensionsFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = objc_alloc_init(WBSChromeExtensionsImporter);
  [(WBSChromeExtensionsImporter *)v10 setDelegate:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__WBSBrowsingDataImportService_parseChromeExtensionsFromFileHandle_delegate_completionHandler___block_invoke;
  v13[3] = &unk_1E615BB68;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(WBSChromeExtensionsImporter *)v10 parseFileHandle:v9 completionHandler:v13];
}

void __95__WBSBrowsingDataImportService_parseChromeExtensionsFromFileHandle_delegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95__WBSBrowsingDataImportService_parseChromeExtensionsFromFileHandle_delegate_completionHandler___block_invoke_cold_1(v4);
    }
  }
  [*(id *)(a1 + 32) finishWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)parseHistoryJSONFromFileHandle:(id)a3 ageLimit:(double)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init(WBSHistoryImporter);
  [(WBSHistoryImporter *)v12 setDelegate:v10];
  [(WBSHistoryImporter *)v12 setAgeLimit:a4];
  uint64_t v13 = 0;
  [(WBSHistoryImporter *)v12 parseFileHandle:v11 error:&v13];

  [v10 finishWithCompletionHandler:v9];
}

- (void)parseCreditCardJSONFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(WBSCreditCardImporter);
  [(WBSCreditCardImporter *)v10 setDelegate:v8];
  uint64_t v11 = 0;
  [(WBSCreditCardImporter *)v10 parseFileHandle:v9 error:&v11];

  [v8 finishWithCompletionHandler:v7];
}

- (void)parseNetscapeBookmarkFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(WBSNetscapeBookmarkFileReader);
  [(WBSNetscapeBookmarkFileReader *)v10 setDelegate:v8];
  id v17 = 0;
  [(WBSNetscapeBookmarkFileReader *)v10 readFromFileHandle:v9 error:&v17];

  id v11 = v17;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__WBSBrowsingDataImportService_parseNetscapeBookmarkFromFileHandle_delegate_completionHandler___block_invoke;
  v14[3] = &unk_1E615B808;
  id v15 = v11;
  id v16 = v7;
  id v12 = v11;
  id v13 = v7;
  [v8 finishWithCompletionHandler:v14];
}

void __95__WBSBrowsingDataImportService_parseNetscapeBookmarkFromFileHandle_delegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __95__WBSBrowsingDataImportService_parseNetscapeBookmarkFromFileHandle_delegate_completionHandler___block_invoke_cold_1(v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)parseExtensionsFromFileHandle:(id)a3 delegate:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init(WBSExtensionsImporter);
  [(WBSExtensionsImporter *)v10 setDelegate:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__WBSBrowsingDataImportService_parseExtensionsFromFileHandle_delegate_completionHandler___block_invoke;
  v13[3] = &unk_1E615BB68;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [(WBSExtensionsImporter *)v10 parseFileHandle:v9 completionHandler:v13];
}

void __89__WBSBrowsingDataImportService_parseExtensionsFromFileHandle_delegate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __89__WBSBrowsingDataImportService_parseExtensionsFromFileHandle_delegate_completionHandler___block_invoke_cold_1(v4);
    }
  }
  [*(id *)(a1 + 32) finishWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)parseChromeHistoryJSONFromFileHandle:(id)a3 ageLimit:(double)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init(WBSChromeHistoryImporter);
  [(WBSChromeHistoryImporter *)v12 setDelegate:v10];
  [(WBSChromeHistoryImporter *)v12 setAgeLimit:a4];
  uint64_t v13 = 0;
  [(WBSChromeHistoryImporter *)v12 parseFileHandle:v11 error:&v13];

  [v10 finishWithCompletionHandler:v9];
}

- (void)scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_msgSend(v8, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_63);
  id v11 = objc_alloc_init(_WBSBrowsingDataImportScanner);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__WBSBrowsingDataImportService_scanImportURLs_sandboxExtensions_completionHandler___block_invoke_9;
  v14[3] = &unk_1E615DBD8;
  id v15 = v10;
  id v16 = v7;
  id v12 = v7;
  id v13 = v10;
  [(_WBSBrowsingDataImportScanner *)v11 scanImportURLs:v9 sandboxExtensions:v8 completionHandler:v14];
}

id __83__WBSBrowsingDataImportService_scanImportURLs_sandboxExtensions_completionHandler___block_invoke(int a1, id a2)
{
  [a2 UTF8String];
  uint64_t v2 = sandbox_extension_consume();
  if (v2 == -1)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__WBSBrowsingDataImportService_scanImportURLs_sandboxExtensions_completionHandler___block_invoke_cold_1(v4);
    }
    id v3 = 0;
  }
  else
  {
    id v3 = [NSNumber numberWithLongLong:v2];
  }
  return v3;
}

void __83__WBSBrowsingDataImportService_scanImportURLs_sandboxExtensions_completionHandler___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "unsignedLongLongValue", (void)v12);
        sandbox_extension_release();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __95__WBSBrowsingDataImportService_parseChromeExtensionsFromFileHandle_delegate_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v4, v5, "Failed to parse the Chrome extensions JSON file: %{public}@", v6, v7, v8, v9, v10);
}

void __95__WBSBrowsingDataImportService_parseNetscapeBookmarkFromFileHandle_delegate_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v4, v5, "Unable to finish reading bookmarks with error: %{public}@", v6, v7, v8, v9, v10);
}

void __89__WBSBrowsingDataImportService_parseExtensionsFromFileHandle_delegate_completionHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v4, v5, "Failed to parse the extensions JSON file: %{public}@", v6, v7, v8, v9, v10);
}

void __83__WBSBrowsingDataImportService_scanImportURLs_sandboxExtensions_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1B728F000, v1, OS_LOG_TYPE_ERROR, "Failed to consume extension: %{errno}i", (uint8_t *)v3, 8u);
}

@end