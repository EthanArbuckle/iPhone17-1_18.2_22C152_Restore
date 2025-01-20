@interface DictionaryRepresentationToString
@end

@implementation DictionaryRepresentationToString

void ___DictionaryRepresentationToString_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v3)
  {
    v4 = [v6 stringByAppendingString:@"="];
    v5 = [v4 stringByAppendingString:v3];

    [*(id *)(a1 + 40) addObject:v5];
  }
}

@end