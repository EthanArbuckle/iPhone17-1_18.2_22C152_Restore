@interface MDSetKeywordsToNamesDictionary
@end

@implementation MDSetKeywordsToNamesDictionary

CFTypeRef ____MDSetKeywordsToNamesDictionary_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 32);
  if (result)
  {
    CFTypeRef result = CFRetain(result);
    _keywordsToNamesDictionary = (uint64_t)result;
  }
  return result;
}

@end