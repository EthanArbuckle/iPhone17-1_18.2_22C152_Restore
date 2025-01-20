@interface TTMergeableString(TTMergeableStringPersistenceAdditions)
@end

@implementation TTMergeableString(TTMergeableStringPersistenceAdditions)

- (void)initWithData:()TTMergeableStringPersistenceAdditions andReplicaID:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "TTMergeableString protobuf corrupt.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "Corrupt mergeable string, bad string data.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "Corrupt mergeable string, zeroed UUID timestamp.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "Corrupt mergeable string, length of substrings != attributedString length.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "Corrupt mergeable string, uuid index > number of uuids - loading empty string.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "Corrupt mergeable string, child substring index > number of substrings.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.6()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "Corrupt mergeable string, substring max > string max.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()TTMergeableStringPersistenceAdditions andReplicaID:withOrderedSubstrings:timestamp:.cold.7()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_7(&dword_1B9AA2000, v0, v1, "Corrupt mergeable string, substring missing component.", v2, v3, v4, v5, v6);
}

@end