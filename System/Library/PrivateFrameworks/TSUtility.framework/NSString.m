@interface NSString
@end

@implementation NSString

id __110__NSString_TSUNumberFormatStringUtilities__newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand__block_invoke()
{
  id result = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"−\uFE6E－﹢＋"];
  newStringBySubstitutingCharactersCFNumberFormatterDoesntUnderstand_replacedCharacterSet = (uint64_t)result;
  return result;
}

void __55__NSString_SFUJsonAdditions__appendJsonStringToString___block_invoke()
{
  appendJsonStringToString__escapeCharacters = (uint64_t)(id)objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 0, 32);
  [(id)appendJsonStringToString__escapeCharacters addCharactersInString:@"\"\\""];
  int v1 = 539566120;
  v0 = (void *)[[NSString alloc] initWithCharacters:&v1 length:2];
  [(id)appendJsonStringToString__escapeCharacters addCharactersInString:v0];
}

@end