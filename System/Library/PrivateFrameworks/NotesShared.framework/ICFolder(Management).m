@interface ICFolder(Management)
@end

@implementation ICFolder(Management)

+ (void)deleteFolder:()Management .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 identifier];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Deleting folder %@", (uint8_t *)&v4, 0xCu);
}

+ (void)countOfFoldersMatchingPredicate:()Management context:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Error counting folder matching predicate %@: %@", (uint8_t *)&v3, 0x16u);
}

@end