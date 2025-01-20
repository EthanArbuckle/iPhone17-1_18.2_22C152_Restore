@interface UIVisualEffectFilterEntry
@end

@implementation UIVisualEffectFilterEntry

uint64_t __36___UIVisualEffectFilterEntry_filter__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setValue:a3 forKey:a2];
}

void __41___UIVisualEffectFilterEntry_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@", (")];
  }
  v6 = *(void **)(a1 + 32);
  v7 = _UIVisualEffectFilterEntryDescribeValue(v5);
  [v6 appendFormat:@"%@=%@", v8, v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __41___UIVisualEffectFilterEntry_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@", (")];
  }
  v6 = [*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v10];
  v7 = *(void **)(a1 + 32);
  id v8 = _UIVisualEffectFilterEntryDescribeValue(v6);
  v9 = _UIVisualEffectFilterEntryDescribeValue(v5);
  [v7 appendFormat:@"%@=[%@][%@]", v10, v8, v9];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

@end