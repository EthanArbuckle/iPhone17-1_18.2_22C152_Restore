@interface NSCharacterSet(SCRCCharacterSetExtras)
+ (id)emojiCharacterSet;
+ (id)modifierKeyCharacterSet;
+ (id)passwordBulletCharacterSet;
+ (id)whitespaceNewlineAndSpecialCharacterSet;
+ (id)wordBreakCharacterSet;
@end

@implementation NSCharacterSet(SCRCCharacterSetExtras)

+ (id)whitespaceNewlineAndSpecialCharacterSet
{
  if (whitespaceNewlineAndSpecialCharacterSet_CharacterSet)
  {
    id v0 = (id)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
  }
  else
  {
    id v1 = objc_alloc_init(MEMORY[0x263F089D8]);
    for (int i = 0; i != 15; ++i)
      objc_msgSend(v1, "appendFormat:", @"%C", (i + 65520));
    v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v4 = (void *)[v3 mutableCopy];

    [v4 addCharactersInString:v1];
    uint64_t v5 = [v4 copy];
    v6 = (void *)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
    whitespaceNewlineAndSpecialCharacterSet_CharacterSet = v5;

    id v0 = (id)whitespaceNewlineAndSpecialCharacterSet_CharacterSet;
  }
  return v0;
}

+ (id)passwordBulletCharacterSet
{
  id v0 = objc_opt_new();
  [v0 addCharactersInString:@"•"];
  [v0 addCharactersInString:@"⦁"];
  [v0 addCharactersInString:@""];
  return v0;
}

+ (id)wordBreakCharacterSet
{
  if (wordBreakCharacterSet_CharacterSetIncludesPunctuation)
  {
    id v0 = (id)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
  }
  else
  {
    id v1 = [MEMORY[0x263F08708] whitespaceNewlineAndSpecialCharacterSet];
    v2 = (void *)[v1 mutableCopy];

    [v2 addCharactersInString:@"\x05"];
    v3 = [MEMORY[0x263F08708] punctuationCharacterSet];
    [v2 formUnionWithCharacterSet:v3];
    uint64_t v4 = [v2 copy];
    uint64_t v5 = (void *)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
    wordBreakCharacterSet_CharacterSetIncludesPunctuation = v4;

    id v0 = (id)wordBreakCharacterSet_CharacterSetIncludesPunctuation;
  }
  return v0;
}

+ (id)emojiCharacterSet
{
  if (emojiCharacterSet_onceToken != -1) {
    dispatch_once(&emojiCharacterSet_onceToken, &__block_literal_global_0);
  }
  id v0 = (void *)emojiCharacterSet_EmojiCharacterSet;
  return v0;
}

+ (id)modifierKeyCharacterSet
{
  if (modifierKeyCharacterSet_onceToken != -1) {
    dispatch_once(&modifierKeyCharacterSet_onceToken, &__block_literal_global_18);
  }
  id v0 = (void *)modifierKeyCharacterSet_modifierKeyCharacterSet;
  return v0;
}

@end