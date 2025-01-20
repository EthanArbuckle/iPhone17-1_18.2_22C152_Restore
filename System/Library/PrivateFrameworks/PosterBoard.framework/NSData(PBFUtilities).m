@interface NSData(PBFUtilities)
- (id)pbf_sha256Hash;
@end

@implementation NSData(PBFUtilities)

- (id)pbf_sha256Hash
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([a1 length])
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x8810000000;
    v10 = &unk_1D33BE967;
    memset(&v11, 0, sizeof(v11));
    CC_SHA256_Init(&v11);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__NSData_PBFUtilities__pbf_sha256Hash__block_invoke;
    v6[3] = &unk_1E6983870;
    v6[4] = &v7;
    [a1 enumerateByteRangesUsingBlock:v6];
    CC_SHA256_Final(md, (CC_SHA256_CTX *)(v8 + 4));
    v2 = [MEMORY[0x1E4F28E78] stringWithCapacity:64];
    for (uint64_t i = 0; i != 32; ++i)
      objc_msgSend(v2, "appendFormat:", @"%02x", md[i]);
    v4 = [NSString stringWithString:v2];

    _Block_object_dispose(&v7, 8);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end