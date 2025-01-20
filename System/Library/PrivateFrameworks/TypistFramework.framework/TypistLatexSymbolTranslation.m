@interface TypistLatexSymbolTranslation
+ (id)charactersRequiringExtentionCharacterSet;
+ (id)latexSymbolMap;
@end

@implementation TypistLatexSymbolTranslation

+ (id)charactersRequiringExtentionCharacterSet
{
  if (charactersRequiringExtentionCharacterSet_onceToken_0 != -1) {
    dispatch_once(&charactersRequiringExtentionCharacterSet_onceToken_0, &__block_literal_global_11);
  }
  v2 = (void *)charactersRequiringExtentionCharacterSet_charSet_0;
  return v2;
}

uint64_t __72__TypistLatexSymbolTranslation_charactersRequiringExtentionCharacterSet__block_invoke()
{
  charactersRequiringExtentionCharacterSet_charSet_0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-√"];
  return MEMORY[0x270F9A758]();
}

+ (id)latexSymbolMap
{
  if (latexSymbolMap_onceToken != -1) {
    dispatch_once(&latexSymbolMap_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)latexSymbolMap_latexSymbolMap;
  return v2;
}

void __46__TypistLatexSymbolTranslation_latexSymbolMap__block_invoke()
{
  v0 = (void *)latexSymbolMap_latexSymbolMap;
  latexSymbolMap_latexSymbolMap = (uint64_t)&unk_270C6FCD8;
}

@end