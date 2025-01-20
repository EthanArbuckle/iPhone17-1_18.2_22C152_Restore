@interface NSString
@end

@implementation NSString

void __56__NSString_CACHelpers__cac_stringByFilteringPunctuation__block_invoke()
{
  id v3 = [MEMORY[0x263F089C0] alphanumericCharacterSet];
  v0 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  [v3 formUnionWithCharacterSet:v0];

  [v3 addCharactersInString:@"&+'’-"];
  uint64_t v1 = [v3 invertedSet];
  v2 = (void *)cac_stringByFilteringPunctuation___punctuationSet;
  cac_stringByFilteringPunctuation___punctuationSet = v1;
}

uint64_t __56__NSString_CACHelpers__cac_stringByCollapsingWhitespace__block_invoke()
{
  cac_stringByCollapsingWhitespace___regex = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"  +" options:1 error:0];
  return MEMORY[0x270F9A758]();
}

@end