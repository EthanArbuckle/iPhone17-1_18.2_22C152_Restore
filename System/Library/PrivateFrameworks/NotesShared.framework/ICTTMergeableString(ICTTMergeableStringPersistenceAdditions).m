@interface ICTTMergeableString(ICTTMergeableStringPersistenceAdditions)
@end

@implementation ICTTMergeableString(ICTTMergeableStringPersistenceAdditions)

- (void)initWithData:()ICTTMergeableStringPersistenceAdditions replicaID:fragment:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "ICTTMergeableString protobuf corrupt.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Corrupt mergeable string, bad string data.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Corrupt mergeable string, zeroed UUID timestamp.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Corrupt mergeable string, uuid index > number of uuids - loading empty string.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Corrupt mergeable string, child substring index > number of substrings.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Corrupt mergeable string, substring max > string max. Starting a new string from available data.", v2, v3, v4, v5, v6);
}

- (void)initWithArchive:()ICTTMergeableStringPersistenceAdditions replicaID:orderedSubstrings:timestamp:fragment:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Corrupt mergeable string, substring missing component.", v2, v3, v4, v5, v6);
}

@end