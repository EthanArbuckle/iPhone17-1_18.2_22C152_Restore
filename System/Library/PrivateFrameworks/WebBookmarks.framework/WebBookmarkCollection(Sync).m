@interface WebBookmarkCollection(Sync)
+ (void)_lockSync;
- (void)_markSpecialBookmarks;
- (void)beginSyncTransaction;
@end

@implementation WebBookmarkCollection(Sync)

- (void)_markSpecialBookmarks
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Failed to mark special bookmarks. Sqlite error: %d", v2, v3, v4, v5, v6);
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Failed to calculate cached children count during bookmark merge. Sqlite error: %d", v2, v3, v4, v5, v6);
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mergeWithBookmarksDictionary:()Sync clearHidden:clearSyncData:error:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Failed to delete existing bokmarks as part of merging with new set of bookmarks. SQlite error: %d", v2, v3, v4, v5, v6);
}

- (void)_syncSetString:()Sync forKey:updatedExistingKey:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_2(&dword_21C043000, v0, v1, "Failed to set sync properties value for key %{private}@. Sqlite error: %d", v2);
}

- (void)setSyncData:()Sync forKey:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_2(&dword_21C043000, v0, v1, "Failed to set sync data for key %{public}@. Sqlite error: %d", v2);
}

- (void)beginSyncTransaction
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21C043000, v0, v1, "Bookmarks failed to begin sync transaction with result code: %i", v2, v3, v4, v5, v6);
}

+ (void)_lockSync
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136446210;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "Failed to open bookmarks sync lock file at: %{public}s", (uint8_t *)&v2, 0xCu);
}

@end