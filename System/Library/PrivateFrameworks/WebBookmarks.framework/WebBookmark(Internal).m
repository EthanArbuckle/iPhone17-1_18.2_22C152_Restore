@interface WebBookmark(Internal)
@end

@implementation WebBookmark(Internal)

- (void)initWithSQLiteStatement:()Internal deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v5, v6, "Error reading bookmark local attributes: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)initWithSQLiteStatement:()Internal deviceIdentifier:hasIcon:collectionType:skipDecodingSyncData:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "wb_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_2(&dword_21C043000, v5, v6, "Error reading bookmark extra attributes: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)_setID:()Internal .cold.1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C043000, a2, OS_LOG_TYPE_ERROR, "Setting bookmark identifier to its parent identifier %ld", (uint8_t *)&v2, 0xCu);
}

@end