@interface NSTextContentStorageCacheElementIndexRange
@end

@implementation NSTextContentStorageCacheElementIndexRange

void *____NSTextContentStorageCacheElementIndexRange_block_invoke_3(uint64_t a1, void *__dst, uint64_t a3, uint64_t a4)
{
  return memmove(__dst, (const void *)(*(void *)(a1 + 32) + 8 * (a3 - *(void *)(a1 + 40))), 8 * a4);
}

uint64_t ____NSTextContentStorageCacheElementIndexRange_block_invoke(NSRange *a1, uint64_t a2)
{
  if (NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken != -1) {
    dispatch_once(&NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken, &__block_literal_global_206);
  }
  return [NSString stringWithFormat:@"%@: Inconsistent element cache state. Elements for range %@ are already cached while trying to insert", a2, NSStringFromRange(a1[2])];
}

uint64_t ____NSTextContentStorageCacheElementIndexRange_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken != -1) {
    dispatch_once(&NSTextContentStorageBreakOnEnumerateWhileEditing_onceToken, &__block_literal_global_206);
  }
  v5.length = *(void *)(a1 + 32);
  v5.location = 0;
  return [NSString stringWithFormat:@"%@: Inconsistent element cache state. Elements for range %@ are not cached while trying to insert", a2, NSStringFromRange(v5)];
}

@end