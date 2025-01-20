@interface NSCountedSet
@end

@implementation NSCountedSet

uint64_t __56__NSCountedSet_RTExtensions__arrayOrderedByHighestCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 <= v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v7 < v8) {
    return 1;
  }
  else {
    return v9;
  }
}

@end