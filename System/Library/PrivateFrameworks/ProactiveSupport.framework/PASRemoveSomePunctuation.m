@interface PASRemoveSomePunctuation
@end

@implementation PASRemoveSomePunctuation

CFCharacterSetRef ___PASRemoveSomePunctuation_block_invoke()
{
  CFCharacterSetRef result = CFCharacterSetCreateWithCharactersInString(0, @"\"\\/'<>");
  _PASRemoveSomePunctuation_charset = (uint64_t)result;
  return result;
}

@end