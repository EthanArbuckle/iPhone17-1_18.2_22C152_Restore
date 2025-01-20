@interface NSString(PBFUtilities)
+ (id)pbf_bootInstanceIdentifier;
- (id)pbf_sha256Hash;
@end

@implementation NSString(PBFUtilities)

+ (id)pbf_bootInstanceIdentifier
{
  if (pbf_bootInstanceIdentifier_onceToken != -1) {
    dispatch_once(&pbf_bootInstanceIdentifier_onceToken, &__block_literal_global_66);
  }
  v0 = (void *)pbf_bootInstanceIdentifier_uuid;
  return v0;
}

- (id)pbf_sha256Hash
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([a1 length])
  {
    v2 = (const char *)[a1 UTF8String];
    CC_LONG v3 = strlen(v2);
    CC_SHA256(v2, v3, md);
    v4 = [MEMORY[0x1E4F28E78] stringWithCapacity:64];
    for (uint64_t i = 0; i != 32; ++i)
      objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);
    v6 = [NSString stringWithString:v4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end