@interface NSPointerArray
@end

@implementation NSPointerArray

uint64_t __51__NSPointerArray_TSUAdditions__tsu_indexOfPointer___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(result + 40) == a2)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

@end