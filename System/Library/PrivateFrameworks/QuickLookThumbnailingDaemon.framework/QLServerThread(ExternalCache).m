@interface QLServerThread(ExternalCache)
@end

@implementation QLServerThread(ExternalCache)

- (void)findUncachedThumbnailInExternalThumbnailCacheForRequest:()ExternalCache item:URL:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1DDC5E000, v0, OS_LOG_TYPE_DEBUG, "Trying external cache for %@", v1, 0xCu);
}

- (void)receivedExternalCacheConnection:()ExternalCache error:forProviderDomainID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DDC5E000, v0, v1, "Could not get connection to external thumbnail cache: %@", v2, v3, v4, v5, v6);
}

@end