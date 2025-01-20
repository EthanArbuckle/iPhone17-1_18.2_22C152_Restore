@interface WBSImageFetchingURLSessionTaskManager
@end

@implementation WBSImageFetchingURLSessionTaskManager

void __115__WBSImageFetchingURLSessionTaskManager_ReadingListMetadataFetcherAdditions__fetchThumbnailForBookmark_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [MEMORY[0x1E4F98BC8] readingListThumbnailDataFromImage:a2];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __115__WBSImageFetchingURLSessionTaskManager_ReadingListMetadataFetcherAdditions__fetchThumbnailForBookmark_completion___block_invoke_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __115__WBSImageFetchingURLSessionTaskManager_ReadingListMetadataFetcherAdditions__fetchThumbnailForBookmark_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Unable to download thumbnail image for Reading List item", v2, v3, v4, v5, v6);
}

@end