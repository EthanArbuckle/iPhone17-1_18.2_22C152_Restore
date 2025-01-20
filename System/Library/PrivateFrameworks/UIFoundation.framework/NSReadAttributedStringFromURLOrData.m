@interface NSReadAttributedStringFromURLOrData
@end

@implementation NSReadAttributedStringFromURLOrData

id ___NSReadAttributedStringFromURLOrData_block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)(*(void *)(a1[4] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[5] + 8) + 40) = a3;
  id result = a4;
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

@end