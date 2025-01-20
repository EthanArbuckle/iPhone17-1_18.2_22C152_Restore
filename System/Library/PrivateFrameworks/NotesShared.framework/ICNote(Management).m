@interface ICNote(Management)
@end

@implementation ICNote(Management)

+ (void)newObjectWithIdentifier:()Management context:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_5(&dword_1C3A61000, v0, v1, "Trying to add note to a read only persistent store", v2, v3, v4, v5, v6);
}

+ (void)newObjectWithIdentifier:()Management context:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Trying to create a new note with Identifier %@ with a nil context", v2, v3, v4, v5, v6);
}

+ (void)deleteEmptyNote:()Management .cold.1(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Deleting empty note %@", v4, v5, v6, v7, v8);
}

+ (void)deleteNote:()Management .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Trying to delete note with a read only persistent store %@", v2, v3, v4, v5, v6);
}

+ (void)deleteNote:()Management .cold.2(void *a1)
{
  uint64_t v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Marking note %@ for deletion from deleteNote", v4, v5, v6, v7, v8);
}

+ (void)purgeNote:()Management .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1C3A61000, v0, v1, "Trying to purge note with a read only persistent store %@", v2, v3, v4, v5, v6);
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.1(void *a1)
{
  [a1 hash];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v1, v2, "POST REFRESH noteData.hash %lu", v3, v4, v5, v6, v7);
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.2(void *a1)
{
  uint64_t v1 = [a1 noteData];
  uint64_t v2 = [v1 objectID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v3, v4, "POST REFRESH noteData objectID = %@", v5, v6, v7, v8, v9);
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.3(void *a1)
{
  uint64_t v1 = [a1 noteData];
  uint64_t v2 = [v1 committedValuesForKeys:0];
  uint64_t v3 = [v2 allKeys];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v4, v5, "POST REFRESH noteData all keys of committedValuesForKeys:nil %@", v6, v7, v8, v9, v10);
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.4(void *a1)
{
  uint64_t v1 = [a1 noteData];
  uint64_t v2 = [v1 changedValues];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v3, v4, "POST REFRESH noteData.changedValues %@", v5, v6, v7, v8, v9);
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.5(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "POST REFRESH note objectID = %@", v4, v5, v6, v7, v8);
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.6(void *a1)
{
  uint64_t v1 = [a1 noteData];
  uint64_t v2 = [v1 objectID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v3, v4, "PRE REFRESH noteData objectID = %@", v5, v6, v7, v8, v9);
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.7(void *a1)
{
  uint64_t v1 = [a1 objectID];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "PRE REFRESH note objectID = %@", v4, v5, v6, v7, v8);
}

+ (void)refreshAllOfNoteWithIdentifier:()Management context:.cold.8()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1C3A61000, v0, v1, "PRE FETCH fetchRequest %@", v2);
}

+ (void)noteIdentifiersMatchingPredicate:()Management context:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_13(&dword_1C3A61000, v0, v1, "Error fetching note identifiers for predicate %@: %@");
}

@end