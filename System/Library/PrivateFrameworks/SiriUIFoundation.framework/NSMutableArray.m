@interface NSMutableArray
@end

@implementation NSMutableArray

uint64_t __75__NSMutableArray_SiriUIFoundationAdditions__sruif_isValidIndexSetToInsert___block_invoke(uint64_t result, unint64_t a2, unsigned char *a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v4 = *(void *)(v3 + 24);
  if (v4 >= a2)
  {
    *(void *)(v3 + 24) = v4 + 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

@end