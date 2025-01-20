@interface PCSFPMasterKeyIDHintConflict
@end

@implementation PCSFPMasterKeyIDHintConflict

unint64_t ___PCSFPMasterKeyIDHintConflict_block_invoke(unint64_t result, CFDataRef theData)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    unint64_t v3 = result;
    result = CFDataGetLength(theData);
    if (result >= *(void *)(v3 + 40))
    {
      BytePtr = CFDataGetBytePtr(theData);
      v5 = CFDataGetBytePtr(*(CFDataRef *)(v3 + 48));
      result = memcmp(BytePtr, v5, *(void *)(v3 + 40));
      *(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = result == 0;
    }
  }
  return result;
}

@end