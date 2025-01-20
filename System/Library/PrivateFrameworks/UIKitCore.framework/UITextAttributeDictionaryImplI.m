@interface UITextAttributeDictionaryImplI
@end

@implementation UITextAttributeDictionaryImplI

void __46___UITextAttributeDictionaryImplI_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id key = a2;
  id v5 = a3;
  if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 16), key))
  {
    v6 = *(void **)(a1 + 40);
    v7 = [NSString stringWithFormat:@"က00%@က00", key];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
}

@end