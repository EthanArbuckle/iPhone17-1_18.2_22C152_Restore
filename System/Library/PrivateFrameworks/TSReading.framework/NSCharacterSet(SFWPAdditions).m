@interface NSCharacterSet(SFWPAdditions)
+ (uint64_t)allQuotesCharacterSetExcludingLeft;
+ (uint64_t)allQuotesCharacterSetExcludingRight;
+ (uint64_t)breakingSpaceCharacterSet;
+ (uint64_t)invisibleCharacterSet;
+ (uint64_t)lineBreakingCharacterSet;
+ (uint64_t)normalQuotesCharacterSet;
+ (uint64_t)smartDoubleQuotesCharacterSet;
+ (uint64_t)smartQuotesCharacterSet;
+ (uint64_t)smartSingleQuotesCharacterSet;
+ (uint64_t)spaceCharacterSet;
+ (void)postSmartSet;
+ (void)preSmartSet;
@end

@implementation NSCharacterSet(SFWPAdditions)

+ (uint64_t)breakingSpaceCharacterSet
{
  uint64_t result = +[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet)
  {
    v1 = (void *)[[NSString alloc] initWithCharacters:&sBreakingSpaceCharacterArray length:15];
    +[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:v1];
    id v2 = (id)+[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet;

    return +[NSCharacterSet(SFWPAdditions) breakingSpaceCharacterSet]::sBreakingSpaceCharacterSet;
  }
  return result;
}

+ (uint64_t)invisibleCharacterSet
{
  uint64_t result = +[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet)
  {
    v1 = (void *)[[NSString alloc] initWithCharacters:&sInvisibleCharacterArray length:31];
    +[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:v1];
    id v2 = (id)+[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet;

    return +[NSCharacterSet(SFWPAdditions) invisibleCharacterSet]::sInvisibleCharacterSet;
  }
  return result;
}

+ (uint64_t)spaceCharacterSet
{
  uint64_t result = +[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet)
  {
    v1 = (void *)[[NSString alloc] initWithCharacters:&sSpaceCharacterArray length:19];
    +[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:v1];
    id v2 = (id)+[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet;

    return +[NSCharacterSet(SFWPAdditions) spaceCharacterSet]::sSpaceCharacterSet;
  }
  return result;
}

+ (uint64_t)normalQuotesCharacterSet
{
  uint64_t result = +[NSCharacterSet(SFWPAdditions) normalQuotesCharacterSet]::sNormalQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) normalQuotesCharacterSet]::sNormalQuotesCharacterSet)
  {
    int v1 = 2555938;
    uint64_t result = [objc_alloc(MEMORY[0x263F089C0]) initWithCharacters:&v1 length:2];
    +[NSCharacterSet(SFWPAdditions) normalQuotesCharacterSet]::sNormalQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)smartSingleQuotesCharacterSet
{
  uint64_t result = +[NSCharacterSet(SFWPAdditions) smartSingleQuotesCharacterSet]::sSmartSingleQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) smartSingleQuotesCharacterSet]::sSmartSingleQuotesCharacterSet)
  {
    int v1 = 538517528;
    uint64_t result = [objc_alloc(MEMORY[0x263F089C0]) initWithCharacters:&v1 length:2];
    +[NSCharacterSet(SFWPAdditions) smartSingleQuotesCharacterSet]::sSmartSingleQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)smartDoubleQuotesCharacterSet
{
  uint64_t result = +[NSCharacterSet(SFWPAdditions) smartDoubleQuotesCharacterSet]::sSmartDoubleQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) smartDoubleQuotesCharacterSet]::sSmartDoubleQuotesCharacterSet)
  {
    int v1 = 538779676;
    uint64_t result = [objc_alloc(MEMORY[0x263F089C0]) initWithCharacters:&v1 length:2];
    +[NSCharacterSet(SFWPAdditions) smartDoubleQuotesCharacterSet]::sSmartDoubleQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)smartQuotesCharacterSet
{
  v1[1] = *MEMORY[0x263EF8340];
  uint64_t result = +[NSCharacterSet(SFWPAdditions) smartQuotesCharacterSet]::sSmartQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) smartQuotesCharacterSet]::sSmartQuotesCharacterSet)
  {
    v1[0] = 0x201D201C20192018;
    uint64_t result = [objc_alloc(MEMORY[0x263F089C0]) initWithCharacters:v1 length:4];
    +[NSCharacterSet(SFWPAdditions) smartQuotesCharacterSet]::sSmartQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)allQuotesCharacterSetExcludingLeft
{
  v1[1] = *MEMORY[0x263EF8340];
  uint64_t result = +[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingLeft]::sAllQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingLeft]::sAllQuotesCharacterSet)
  {
    v1[0] = 0x270022201D2019;
    uint64_t result = [objc_alloc(MEMORY[0x263F089C0]) initWithCharacters:v1 length:6];
    +[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingLeft]::sAllQuotesCharacterSet = result;
  }
  return result;
}

+ (uint64_t)allQuotesCharacterSetExcludingRight
{
  v1[1] = *MEMORY[0x263EF8340];
  uint64_t result = +[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingRight]::sAllQuotesCharacterSet;
  if (!+[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingRight]::sAllQuotesCharacterSet)
  {
    v1[0] = 0x270022201C2018;
    uint64_t result = [objc_alloc(MEMORY[0x263F089C0]) initWithCharacters:v1 length:4];
    +[NSCharacterSet(SFWPAdditions) allQuotesCharacterSetExcludingRight]::sAllQuotesCharacterSet = result;
  }
  return result;
}

+ (void)preSmartSet
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = 0xEFFFC00050004;
  __int16 v5 = 6;
  uint64_t v0 = [NSString stringWithCharacters:&v4 length:5];
  uint64_t v1 = [MEMORY[0x263F089C0] characterSetWithCharactersInString:v0];
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"));
  [v2 formUnionWithCharacterSet:v1];
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "allQuotesCharacterSetExcludingRight"));
  return v2;
}

+ (void)postSmartSet
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = 0xEFFFC00050004;
  __int16 v5 = 6;
  uint64_t v0 = [NSString stringWithCharacters:&v4 length:5];
  uint64_t v1 = [MEMORY[0x263F089C0] characterSetWithCharactersInString:v0];
  id v2 = (void *)[MEMORY[0x263F089C0] characterSetWithCharactersInString:@"].,;:?'!\"%*-/}"]);
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"));
  [v2 formUnionWithCharacterSet:v1];
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "allQuotesCharacterSetExcludingLeft"));
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"));
  return v2;
}

+ (uint64_t)lineBreakingCharacterSet
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  long long v2 = xmmword_22383AD0A;
  int v3 = 539492356;
  uint64_t v0 = [NSString stringWithCharacters:&v2 length:10];
  return [MEMORY[0x263F08708] characterSetWithCharactersInString:v0];
}

@end