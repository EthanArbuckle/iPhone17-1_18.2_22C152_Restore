@interface SBHIconLibraryQueryCanonicalizedString
@end

@implementation SBHIconLibraryQueryCanonicalizedString

void ___SBHIconLibraryQueryCanonicalizedString_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\uFFFC"];
  v1 = (void *)_SBHIconLibraryQueryCanonicalizedString_queryDisallowedCharacterSet;
  _SBHIconLibraryQueryCanonicalizedString_queryDisallowedCharacterSet = v0;
}

BOOL ___SBHIconLibraryQueryCanonicalizedString_block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

@end