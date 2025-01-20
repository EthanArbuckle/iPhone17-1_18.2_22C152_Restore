@interface NSString
@end

@implementation NSString

uint64_t __54__NSString_SCROBrailleAdditions___illegalCharacterSet__block_invoke()
{
  _illegalCharacterSet___illegalCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\r\n\t"];

  return MEMORY[0x270F9A758]();
}

void __53__NSString_SCROBrailleAdditions___legalWhiteSpaceSet__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) _illegalCharacterSet];
  id v5 = [v1 invertedSet];

  v2 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v3 = [v2 mutableCopy];
  v4 = (void *)_legalWhiteSpaceSet___legalWhiteSpaceSet;
  _legalWhiteSpaceSet___legalWhiteSpaceSet = v3;

  [(id)_legalWhiteSpaceSet___legalWhiteSpaceSet formIntersectionWithCharacterSet:v5];
}

@end