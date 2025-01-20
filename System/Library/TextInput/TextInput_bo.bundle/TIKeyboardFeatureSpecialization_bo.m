@interface TIKeyboardFeatureSpecialization_bo
- (BOOL)doesComposeText;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
@end

@implementation TIKeyboardFeatureSpecialization_bo

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)internalStringToExternal:(id)a3
{
  id v3 = a3;
  if (!-[TIKeyboardFeatureSpecialization_bo internalStringToExternal:]::gFullToSubscriptMap)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"ྐ", @"ཀ", @"ྑ", @"ཁ", @"ྒ", @"ག", @"ྒྷ", @"གྷ", @"ྔ", @"ང", @"ྕ", @"ཅ", @"ྖ", @"ཆ", @"ྗ", @"ཇ", @"ྙ",
           @"ཉ",
           @"ྚ",
           @"ཊ",
           @"ྛ",
           @"ཋ",
           @"ྜ",
           @"ཌ",
           @"ྜྷ",
           @"ཌྷ",
           @"ྞ",
           @"ཎ",
           @"ྟ",
           @"ཏ",
           @"ྠ",
           @"ཐ",
           @"ྡ",
           @"ད",
           @"ྡྷ",
           @"དྷ",
           @"ྣ",
           @"ན",
           @"ྤ",
           @"པ",
           @"ྥ",
           @"ཕ",
           @"ྦ",
           @"བ",
           @"ྦྷ",
           @"བྷ",
           @"ྨ",
           @"མ",
           @"ྩ",
           @"ཙ",
           @"ྪ",
           @"ཚ",
           @"ྫ",
           @"ཛ",
           @"ྫྷ",
           @"ཛྷ",
           @"ྭ",
           @"ཝ",
           @"ྮ",
           @"ཞ",
           @"ྯ");
    v5 = (void *)-[TIKeyboardFeatureSpecialization_bo internalStringToExternal:]::gFullToSubscriptMap;
    -[TIKeyboardFeatureSpecialization_bo internalStringToExternal:]::gFullToSubscriptMap = v4;
  }
  v6 = [MEMORY[0x263F089D8] string];
  if ([v3 length])
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      int v9 = [v3 characterAtIndex:v7];
      if (v8 == 2)
      {
        if (v9 != 3972)
        {
          v10 = objc_msgSend(v3, "substringWithRange:", v7, 1);
          [v6 appendString:v10];
          goto LABEL_19;
        }
      }
      else
      {
        if (v8 != 1)
        {
          if (v9 == 3972) {
            uint64_t v8 = 1;
          }
          else {
            uint64_t v8 = 3;
          }
          v10 = objc_msgSend(v3, "substringWithRange:", v7, 1);
          [v6 appendString:v10];
          goto LABEL_20;
        }
        if (v9 != 3972)
        {
          v10 = objc_msgSend(v3, "substringWithRange:", v7, 1);
          v11 = [(id)-[TIKeyboardFeatureSpecialization_bo internalStringToExternal:]::gFullToSubscriptMap objectForKey:v10];
          if (v11) {
            objc_msgSend(v6, "replaceCharactersInRange:withString:", objc_msgSend(v6, "length") - 1, 1, v11);
          }
          else {
            [v6 appendString:v10];
          }

LABEL_19:
          uint64_t v8 = 3;
LABEL_20:

          goto LABEL_21;
        }
      }
      uint64_t v8 = 2;
LABEL_21:
      ++v7;
    }
    while ([v3 length] > v7);
  }

  return v6;
}

- (id)externalStringToInternal:(id)a3
{
  id v3 = a3;
  if (!-[TIKeyboardFeatureSpecialization_bo externalStringToInternal:]::gSubscriptToFullMap)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"྄ཀ", @"ྐ", @"྄ཁ", @"ྑ", @"྄ག", @"ྒ", @"྄གྷ", @"ྒྷ", @"྄ང", @"ྔ", @"྄ཅ", @"ྕ", @"྄ཆ", @"ྖ", @"྄ཇ", @"ྗ", @"྄ཉ",
           @"ྙ",
           @"྄ཊ",
           @"ྚ",
           @"྄ཋ",
           @"ྛ",
           @"྄ཌ",
           @"ྜ",
           @"྄ཌྷ",
           @"ྜྷ",
           @"྄ཎ",
           @"ྞ",
           @"྄ཏ",
           @"ྟ",
           @"྄ཐ",
           @"ྠ",
           @"྄ད",
           @"ྡ",
           @"྄དྷ",
           @"ྡྷ",
           @"྄ན",
           @"ྣ",
           @"྄པ",
           @"ྤ",
           @"྄ཕ",
           @"ྥ",
           @"྄བ",
           @"ྦ",
           @"྄བྷ",
           @"ྦྷ",
           @"྄མ",
           @"ྨ",
           @"྄ཙ",
           @"ྩ",
           @"྄ཚ",
           @"ྪ",
           @"྄ཛ",
           @"ྫ",
           @"྄ཛྷ",
           @"ྫྷ",
           @"྄ཝ",
           @"ྭ",
           @"྄ཞ",
           @"ྮ",
           @"྄ཟ");
    v5 = (void *)-[TIKeyboardFeatureSpecialization_bo externalStringToInternal:]::gSubscriptToFullMap;
    -[TIKeyboardFeatureSpecialization_bo externalStringToInternal:]::gSubscriptToFullMap = v4;
  }
  v6 = [MEMORY[0x263F089D8] string];
  if ([v3 length])
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = objc_msgSend(v3, "substringWithRange:", v7, 1);
      int v9 = [(id)-[TIKeyboardFeatureSpecialization_bo externalStringToInternal:]::gSubscriptToFullMap objectForKey:v8];
      if (v9) {
        v10 = v9;
      }
      else {
        v10 = v8;
      }
      [v6 appendString:v10];

      ++v7;
    }
    while ([v3 length] > v7);
  }

  return v6;
}

@end