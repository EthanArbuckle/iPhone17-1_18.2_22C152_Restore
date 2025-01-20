@interface _QLCacheThread(Private)
- (void)_cleanUpDatabaseDone;
@end

@implementation _QLCacheThread(Private)

- (void)_addThumbnailRequestIntoDiskCacheQueryQueue:()Private .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "-_addThumbnailRequestIntoDiskCacheQueryQueue: waiting for server thread", v2, v3, v4, v5, v6);
}

- (void)_cleanUpDatabaseDone
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DDC5E000, v0, v1, "Clean-up database done", v2, v3, v4, v5, v6);
}

@end