@interface CKDatabaseOperation
- (void)fc_canBypassEncryptionRequirement;
- (void)setFc_canBypassEncryptionRequirement:(void *)a1;
@end

@implementation CKDatabaseOperation

- (void)fc_canBypassEncryptionRequirement
{
  if (result)
  {
    v1 = objc_getAssociatedObject(result, (const void *)FCShouldBypassEncryptionKey);
    uint64_t v2 = [v1 BOOLValue];

    return (void *)v2;
  }
  return result;
}

- (void)setFc_canBypassEncryptionRequirement:(void *)a1
{
  if (a1)
  {
    id v3 = [NSNumber numberWithBool:a2];
    objc_setAssociatedObject(a1, (const void *)FCShouldBypassEncryptionKey, v3, (void *)0x301);
  }
}

@end