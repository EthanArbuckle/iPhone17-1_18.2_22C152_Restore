@interface WBSImageFetchingURLSessionTaskManager(ReadingListMetadataFetcherAdditions)
- (void)fetchThumbnailForBookmark:()ReadingListMetadataFetcherAdditions completion:;
@end

@implementation WBSImageFetchingURLSessionTaskManager(ReadingListMetadataFetcherAdditions)

- (void)fetchThumbnailForBookmark:()ReadingListMetadataFetcherAdditions completion:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 readingListIconURL];
  v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = [v7 readingListIconURL];

  v11 = [v9 URLWithString:v10];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
    uint64_t v13 = objc_msgSend(v12, "webui_safariCookieAcceptPolicyEnumValue");

    if (v13 == 1) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 1;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __115__WBSImageFetchingURLSessionTaskManager_ReadingListMetadataFetcherAdditions__fetchThumbnailForBookmark_completion___block_invoke;
    v16[3] = &unk_1E6D7A7D0;
    id v18 = v6;
    id v17 = v8;
    [a1 downloadImageWithURL:v11 options:v14 completionHandler:v16];
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WBSImageFetchingURLSessionTaskManager(ReadingListMetadataFetcherAdditions) fetchThumbnailForBookmark:completion:]();
    }
    (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
  }
}

- (void)fetchThumbnailForBookmark:()ReadingListMetadataFetcherAdditions completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Unable to fetch thumbnail for Reading List item with invalid URL", v2, v3, v4, v5, v6);
}

@end