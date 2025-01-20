@interface TTMergeableAttributedString(TTAttributedStringPersistenceAdditions)
@end

@implementation TTMergeableAttributedString(TTAttributedStringPersistenceAdditions)

- (void)initWithArchive:()TTAttributedStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "TTMergeableAttributedString attribute length is not equal to string length.", v1, 2u);
}

- (void)initWithArchive:()TTAttributedStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.2()
{
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_ERROR, "TTMergeableAttributedString cannot load attributes.", v1, 2u);
}

+ (void)attributesForRun:()TTAttributedStringPersistenceAdditions .cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "TTMergeableAttributedString cannot load attachment without identifier/info.", v1, 2u);
}

+ (void)saveAttributes:()TTAttributedStringPersistenceAdditions toArchive:.cold.1()
{
  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "Saving hashtag without identifier!", v1, 2u);
}

+ (void)saveAttributes:()TTAttributedStringPersistenceAdditions toArchive:.cold.2(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = 4;
  __int16 v3 = 1024;
  int v4 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Incorrect number of color components for foreground color. Expected %d and got %d", (uint8_t *)v2, 0xEu);
}

@end