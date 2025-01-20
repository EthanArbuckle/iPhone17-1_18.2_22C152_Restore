@interface ICAttachment(CloudKit)
@end

@implementation ICAttachment(CloudKit)

- (void)mergeCloudKitRecord:()CloudKit accountID:approach:mergeableFieldState:newAttachment:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Error creating unarchiver: %@", v1, 0xCu);
}

- (void)makeCloudKitRecordForApproach:()CloudKit mergeableFieldState:.cold.1(void *a1)
{
  v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Couldn't archive placemark: %@", v4, v5, v6, v7, v8);
}

+ (void)noteFromAttachmentUserSpecificRecord:()CloudKit accountID:context:.cold.1()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 recordID];
  uint64_t v2 = [v1 recordName];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v3, v4, "Attachment user-specific record (%@) for account (%@) does not have a note reference", v5, v6, v7, v8, v9);
}

+ (void)addPreviewImages:()CloudKit toRecord:.cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 identifier];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1C3A61000, a4, OS_LOG_TYPE_ERROR, "Error creating asset for preview image: %@", a1, 0xCu);
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Cannot begin attachment fallback asset generation {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Processed fallback asset — committing… {attachment: %@}", v4, 0xCu);
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.3()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot copy unsupported attachment fallback asset — rolling back… {attachment: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.4()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot link unsupported attachment fallback asset — trying copying… {attachment: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.5()
{
  OUTLINED_FUNCTION_12();
  v1 = [v0 shortLoggingDescription];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Cannot move unsupported attachment fallback asset — trying linking… {attachment: %@, error: %@}", v4, v5, v6, v7, v8);
}

- (void)processFallbackAsset:()CloudKit fallbackAssetType:.cold.6(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_2(&dword_1C3A61000, v2, v3, "Fallback asset URL is not reachable {attachment: %@}", v4, v5, v6, v7, v8);
}

- (void)mergePaperBundleFromRecord:()CloudKit .cold.1()
{
  OUTLINED_FUNCTION_12();
  v1 = objc_msgSend(v0, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1(&dword_1C3A61000, v2, v3, "Failed writing new version of synced paper bundle (%@): %@", v4, v5, v6, v7, v8);
}

@end