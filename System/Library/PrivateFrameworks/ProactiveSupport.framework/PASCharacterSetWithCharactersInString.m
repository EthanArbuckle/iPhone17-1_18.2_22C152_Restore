@interface PASCharacterSetWithCharactersInString
@end

@implementation PASCharacterSetWithCharactersInString

uint64_t ___PASCharacterSetWithCharactersInString_block_invoke(uint64_t a1, unsigned int a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCharactersInRange:", a2, 1);
}

@end