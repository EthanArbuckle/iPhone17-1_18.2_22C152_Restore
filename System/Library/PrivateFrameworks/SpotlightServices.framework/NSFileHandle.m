@interface NSFileHandle
@end

@implementation NSFileHandle

uint64_t __38__NSFileHandle_mapped__prs_mappedData__block_invoke(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

@end