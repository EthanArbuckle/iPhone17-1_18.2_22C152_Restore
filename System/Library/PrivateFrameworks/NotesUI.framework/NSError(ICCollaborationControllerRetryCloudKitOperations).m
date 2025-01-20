@interface NSError(ICCollaborationControllerRetryCloudKitOperations)
- (uint64_t)ic_shouldRetryCloudKitError;
@end

@implementation NSError(ICCollaborationControllerRetryCloudKitOperations)

- (uint64_t)ic_shouldRetryCloudKitError
{
  v2 = [a1 domain];
  if ([v2 isEqualToString:*MEMORY[0x1E4F19C40]])
  {
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
    uint64_t v4 = [&unk_1F09A3FE0 containsObject:v3] ^ 1;
  }
  else
  {
    uint64_t v4 = 1;
  }

  return v4;
}

@end