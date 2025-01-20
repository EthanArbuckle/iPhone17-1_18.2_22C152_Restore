@interface MDSetKeywordsDictionary
@end

@implementation MDSetKeywordsDictionary

CFTypeRef ____MDSetKeywordsDictionary_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 32);
  if (result)
  {
    CFTypeRef result = CFRetain(result);
    _keywordsDictionary = (uint64_t)result;
  }
  return result;
}

@end