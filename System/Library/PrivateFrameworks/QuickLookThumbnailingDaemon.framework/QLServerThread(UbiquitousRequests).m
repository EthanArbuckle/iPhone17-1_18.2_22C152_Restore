@interface QLServerThread(UbiquitousRequests)
@end

@implementation QLServerThread(UbiquitousRequests)

- (void)_downloadThumbnailForRequest:()UbiquitousRequests completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_9(&dword_1DDC5E000, v0, v1, "Will add thumbnail-download for request:%@ to queue: %@");
}

- (void)downloadThumbnails:()UbiquitousRequests forProvider:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 count];
  unsigned int v6 = atomic_load((unsigned int *)(a2 + 28));
  int v7 = 134218240;
  uint64_t v8 = v5;
  __int16 v9 = 1024;
  unsigned int v10 = v6;
  _os_log_debug_impl(&dword_1DDC5E000, a3, OS_LOG_TYPE_DEBUG, "Dequeueing batch of %lu thumbnail downloads (%d downloads are in flight)", (uint8_t *)&v7, 0x12u);
}

- (void)processedPNGAppIconDataForData:()UbiquitousRequests ofType:size:scale:.cold.1()
{
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_ERROR, "Failed to get rounded icon from app container icon", v1, 2u);
}

- (void)processedPNGAppIconDataForData:()UbiquitousRequests ofType:size:scale:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Computing app icon", v2, v3, v4, v5, v6);
}

@end