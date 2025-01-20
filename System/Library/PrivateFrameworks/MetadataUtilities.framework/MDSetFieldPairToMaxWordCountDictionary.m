@interface MDSetFieldPairToMaxWordCountDictionary
@end

@implementation MDSetFieldPairToMaxWordCountDictionary

CFTypeRef ____MDSetFieldPairToMaxWordCountDictionary_block_invoke(uint64_t a1)
{
  CFTypeRef result = *(CFTypeRef *)(a1 + 32);
  if (result)
  {
    CFTypeRef result = CFRetain(result);
    _fieldPairToMaxWordCountDictionary = (uint64_t)result;
  }
  return result;
}

@end