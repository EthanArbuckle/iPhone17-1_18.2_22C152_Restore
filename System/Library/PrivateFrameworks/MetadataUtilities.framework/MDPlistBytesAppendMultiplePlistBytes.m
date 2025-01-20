@interface MDPlistBytesAppendMultiplePlistBytes
@end

@implementation MDPlistBytesAppendMultiplePlistBytes

void *___MDPlistBytesAppendMultiplePlistBytes_block_invoke(void *result, uint64_t a2)
{
  size_t v2 = *(void *)(result[4] + 8 * a2);
  if (v2)
  {
    uint64_t v3 = 8 * a2;
    uint64_t v4 = *(void *)(result[6] + 8 * a2);
    if (v4 && !*(_WORD *)(v4 + 32)) {
      v5 = *(const void **)(v4 + 8);
    }
    else {
      v5 = 0;
    }
    v6 = *(void **)(result[5] + v3);
    return memcpy(v6, v5, v2);
  }
  return result;
}

@end