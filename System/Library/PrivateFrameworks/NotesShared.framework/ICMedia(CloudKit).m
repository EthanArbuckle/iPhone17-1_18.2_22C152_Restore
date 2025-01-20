@interface ICMedia(CloudKit)
@end

@implementation ICMedia(CloudKit)

- (void)mergeCloudKitRecord:()CloudKit accountID:approach:mergeableFieldState:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [a1 recordID];
  v4 = [v3 recordName];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Found a media (%@) in the cloud from an old version that used filename extensions. Re-pushing it to the cloud with the correct fields", (uint8_t *)&v5, 0xCu);
}

@end