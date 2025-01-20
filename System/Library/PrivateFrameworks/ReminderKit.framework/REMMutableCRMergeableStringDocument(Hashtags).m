@interface REMMutableCRMergeableStringDocument(Hashtags)
@end

@implementation REMMutableCRMergeableStringDocument(Hashtags)

- (void)addHashtag:()Hashtags range:.cold.1(void *a1, NSUInteger a2, NSUInteger a3, NSObject *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v8 = [a1 replicaIDSource];
  v17.location = a2;
  v17.length = a3;
  v9 = NSStringFromRange(v17);
  int v10 = 134218498;
  v11 = a1;
  __int16 v12 = 2112;
  v13 = v8;
  __int16 v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_1B9AA2000, a4, OS_LOG_TYPE_ERROR, "Invalid nil value provided when trying to -addHashtag:range: to REMMutableCRMergeableStringDocument {self: %p, replicaID: %@, range: %@}", (uint8_t *)&v10, 0x20u);
}

@end