@interface ICFolder(CloudKit)
- (void)fixBrokenReferences;
@end

@implementation ICFolder(CloudKit)

- (void)mergeParentFromRecord:()CloudKit .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v6 = [a1 className];
  v7 = [a1 identifier];
  v8 = [a1 className];
  OUTLINED_FUNCTION_1_5();
  v12 = v7;
  __int16 v13 = v9;
  uint64_t v14 = a2;
  __int16 v15 = v9;
  uint64_t v16 = v10;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Trying to set a parent for %@ (%@), but we couldn't find the parent (%@). Creating a temporary %@", v11, 0x2Au);
}

- (void)mergeParentFromRecord:()CloudKit .cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Folder has no local parent modification date %@", v4, v5, v6, v7, 2u);
}

- (void)mergeParentFromRecord:()CloudKit .cold.3(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Folder record has no parent modification date %@", v4, v5, v6, v7, 2u);
}

- (void)mergeParentFromRecord:()CloudKit .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a1 shortLoggingDescription];
  uint64_t v7 = [a1 parentModificationDate];
  OUTLINED_FUNCTION_1_5();
  uint64_t v11 = v8;
  __int16 v12 = v9;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Folder has local and cloud parent modification date: %@ local=%@ cloud=%@", v10, 0x20u);
}

- (void)fixBrokenReferences
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1C3A61000, a4, OS_LOG_TYPE_DEBUG, "Moving note (%@) to trash folder", a1, 0xCu);
}

@end