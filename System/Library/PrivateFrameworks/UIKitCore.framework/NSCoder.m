@interface NSCoder
@end

@implementation NSCoder

uint64_t __64__NSCoder__UIHyperCoding___ui_decodeVectorForKey_returnedCount___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    v3 = *(unint64_t **)(result + 40);
    do
    {
      unint64_t v4 = *v3++;
      *a2++ = bswap64(v4);
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t __74__NSCoder__UIHyperCoding___ui_decodeNSUIntegerVectorForKey_returnedCount___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32))
  {
    unint64_t v2 = 0;
    uint64_t v3 = *(void *)(result + 40);
    do
    {
      *(void *)(a2 + 8 * v2) = *(void *)(v3 + 8 * v2);
      ++v2;
    }
    while (v2 < *(void *)(result + 32));
  }
  return result;
}

@end