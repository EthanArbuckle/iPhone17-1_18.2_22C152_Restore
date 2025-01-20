@interface ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions)
@end

@implementation ICTTMergeableAttributedString(TTAttributedStringPersistenceAdditions)

- (void)initWithArchive:()TTAttributedStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_FAULT, "ICTTMergeableAttributedString attribute length is not equal to string length. Continuing with available data.", v1, 2u);
}

- (void)initWithArchive:()TTAttributedStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "ICTTMergeableAttributedString cannot load attributes.", v2, v3, v4, v5, v6);
}

+ (void)attributesForRun:()TTAttributedStringPersistenceAdditions .cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "ICTTMergeableAttributedString cannot load attachment without identifier/info.", v2, v3, v4, v5, v6);
}

+ (void)saveAttributes:()TTAttributedStringPersistenceAdditions toArchive:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Saving attachment without identifier!", v2, v3, v4, v5, v6);
}

@end