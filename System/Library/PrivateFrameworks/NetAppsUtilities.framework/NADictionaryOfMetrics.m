@interface NADictionaryOfMetrics
@end

@implementation NADictionaryOfMetrics

id ___NADictionaryOfMetrics_block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28B88];
  id v3 = a2;
  v4 = [v2 whitespaceCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

@end