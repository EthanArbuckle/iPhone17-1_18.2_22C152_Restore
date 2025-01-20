@interface NSString(ChineseJapanese)
- (MCKeyboardInput)_asTypeInputsWithNearbyKeyMap:()ChineseJapanese;
- (id)_firstComposedCharacter;
- (uint64_t)_asTypeInputs;
@end

@implementation NSString(ChineseJapanese)

- (id)_firstComposedCharacter
{
  id v1 = a1;
  if ([v1 length])
  {
    uint64_t v2 = [v1 rangeOfComposedCharacterSequenceAtIndex:0];
    uint64_t v4 = v3;
    if (v3 != [v1 length])
    {
      uint64_t v5 = objc_msgSend(v1, "substringWithRange:", v2, v4);

      id v1 = (id)v5;
    }
  }

  return v1;
}

- (MCKeyboardInput)_asTypeInputsWithNearbyKeyMap:()ChineseJapanese
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(MCKeyboardInput);
  if ([a1 length])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = objc_msgSend(NSString, "_stringWithUnichar:", objc_msgSend(a1, "characterAtIndex:", v6));
      v8 = [MEMORY[0x1E4F1CA48] array];
      v9 = [v4 valueForKey:v7];
      if (v9)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __59__NSString_ChineseJapanese___asTypeInputsWithNearbyKeyMap___block_invoke;
        v12[3] = &unk_1E6E2B4E8;
        id v13 = v8;
        [v9 enumerateObjectsUsingBlock:v12];
      }
      v10 = [[MCTypeInput alloc] initWithCharacters:v7 nearbyKeys:v8];
      [(MCKeyboardInput *)v5 composeNew:v10];

      ++v6;
    }
    while ([a1 length] > v6);
  }

  return v5;
}

- (uint64_t)_asTypeInputs
{
  return [a1 _asTypeInputsWithNearbyKeyMap:0];
}

@end