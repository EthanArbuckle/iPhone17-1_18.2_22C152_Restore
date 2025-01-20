@interface PASLPReaderBinaryPlist
@end

@implementation PASLPReaderBinaryPlist

uint64_t __112___PASLPReaderBinaryPlist__decodeOffset_decodedObject_ifEqualToReferenceObject_validationDepth_unlazyCopyCache___block_invoke(uint64_t a1, const void *a2, uint64_t a3, size_t __n, unsigned char *a5)
{
  uint64_t result = memcmp((const void *)(*(void *)(a1 + 40) + a3), a2, __n);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

@end