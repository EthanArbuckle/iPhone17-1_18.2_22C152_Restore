@interface DictionaryByReversingDictionary
@end

@implementation DictionaryByReversingDictionary

uint64_t ___DictionaryByReversingDictionary_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:a3];
}

@end