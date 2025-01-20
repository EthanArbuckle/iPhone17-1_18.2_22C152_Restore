@interface NSData
@end

@implementation NSData

uint64_t __38__NSData_PBFUtilities__pbf_sha256Hash__block_invoke(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA256_Update((CC_SHA256_CTX *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), a2, len);
}

@end