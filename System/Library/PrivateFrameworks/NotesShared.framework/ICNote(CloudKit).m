@interface ICNote(CloudKit)
@end

@implementation ICNote(CloudKit)

- (void)mergeCloudKitRecord:()CloudKit mergePolicy:account:approach:mergeableFieldState:.cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6 = [a1 defaultFolder];
  v7 = [v6 identifier];
  v8 = [a1 identifier];
  v9 = [a2 recordID];
  v10 = objc_msgSend(v9, "ic_loggingDescription");
  int v12 = 138412802;
  v13 = v7;
  OUTLINED_FUNCTION_6_4();
  uint64_t v14 = v11;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Setting default folder %@ in account %@ for shared note with no folder: %@", (uint8_t *)&v12, 0x20u);
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "Attempting to merge data, but document is nil — replacing local document", v1, 2u);
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.2(void *a1)
{
  [a1 mergeableString];
  objc_claimAutoreleasedReturnValue();
  v2 = [(id)OUTLINED_FUNCTION_4_2() identifier];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Failed to merge incoming delta %p for note %@.", v5, v6, v7, v8, v9);
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.3(void *a1)
{
  v1 = [a1 mergeableString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed merge %p: Replacing local note content with cloud note.", v4, v5, v6, v7, v8);
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.4(void *a1)
{
  v1 = [a1 mergeableString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed merge %p: Keeping local note content.", v4, v5, v6, v7, v8);
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.5(void *a1)
{
  v1 = [a1 mergeableString];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed merge %p: Coping note and replacing local note content with cloud note.", v4, v5, v6, v7, v8);
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.6(void *a1)
{
  [a1 mergeableString];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_4_2() identifier];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Failed to merge note %p %@.", v5, v6, v7, v8, v9);
}

- (void)mergeTextDataFromRecord:()CloudKit mergePolicy:mergeableFieldState:.cold.7(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Skipping merge of the note body for note (%@) because it wasn't found on the incoming record", v4, v5, v6, v7, v8);
}

- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:()CloudKit .cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Failed to serialize timestamp for note: %@", v4, v5, v6, v7, v8);
}

- (void)folderReferenceFromRecord:()CloudKit .cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Falling back to folders reference array for %@", v4, v5, v6, v7, v8);
}

- (void)folderReferenceFromRecord:()CloudKit .cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "'Folder' and 'Folders' key are different. Falling back to 'Folders' for %@", v4, v5, v6, v7, v8);
}

- (void)mergeFoldersFromRecord:()CloudKit account:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 shortLoggingDescription];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_4_2() shortLoggingDescription];
  OUTLINED_FUNCTION_3_3();
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "%@ is marked for deletion but not in the trash. Moving to trash folder %@.", v6, 0x16u);
}

- (void)mergeFoldersFromRecord:()CloudKit account:.cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Could not get a folder reference for %@", v4, v5, v6, v7, v8);
}

- (void)mergeFoldersFromRecord:()CloudKit account:.cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint8_t v8 = [a1 recordID];
  uint8_t v9 = [v8 recordName];
  v10 = [a2 shortLoggingDescription];
  uint64_t v11 = (objc_class *)objc_opt_class();
  int v12 = NSStringFromClass(v11);
  int v15 = 138413058;
  v16 = v7;
  OUTLINED_FUNCTION_6_4();
  v17 = v10;
  __int16 v18 = v13;
  uint64_t v19 = v14;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Trying to set a %@ (%@) for %@, but we couldn't find the %@. Creating a temporary one.", (uint8_t *)&v15, 0x2Au);
}

- (void)addNoteBodyToRecord:()CloudKit forApproach:mergeableFieldState:.cold.1(void *a1)
{
  objc_msgSend(a1, "ic_loggingIdentifier");
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_4_2() length];
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Unable to generate CRDT delta for note (%@) because the starting timestamp data (length=%lu) was invalid", v4, v5, v6, v7, 2u);
}

- (void)addNoteBodyToRecord:()CloudKit forApproach:mergeableFieldState:.cold.2(void *a1)
{
  v1 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Generated delta was empty for note: %@", v4, v5, v6, v7, v8);
}

- (void)makeUserSpecificCloudKitRecordForApproach:()CloudKit .cold.1(void *a1, void *a2)
{
  [a1 isSystemPaper];
  uint64_t v3 = objc_msgSend(a2, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_29(&dword_1C3A61000, v4, v5, "Setting isSystemPaper to %d on record: %@", v6, v7, v8, v9, v10);
}

- (void)makeUserSpecificCloudKitRecordForApproach:()CloudKit .cold.2(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Not saving trash folder in user-specific note record for %@", v4, v5, v6, v7, v8);
}

- (void)mergeDataFromUserSpecificRecord:()CloudKit accountID:.cold.1(void *a1)
{
  [a1 isSystemPaper];
  uint64_t v2 = objc_msgSend(a1, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_29(&dword_1C3A61000, v3, v4, "Setting isSystemPaper on note %d from CK: %@", v5, v6, v7, v8, v9);
}

- (void)mergePolicyForRecord:()CloudKit .cold.1(void *a1)
{
  v1 = [a1 identifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_0(&dword_1C3A61000, v2, v3, "Found a note (%@) in the cloud with a record whose creation date is not equal to our own cached version.", v4, v5, v6, v7, v8);
}

@end