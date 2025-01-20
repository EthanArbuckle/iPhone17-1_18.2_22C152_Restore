@interface TIKeyboardFeatureSpecialization_cs
- (BOOL)doesComposeText;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (id)accentKeyStringForKeyboardState:(id)a3;
- (id)allAccentKeyStrings;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)nonstopPunctuationCharacters;
@end

@implementation TIKeyboardFeatureSpecialization_cs

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)allAccentKeyStrings
{
  return &unk_26F5DB7B0;
}

- (id)accentKeyStringForKeyboardState:(id)a3
{
  id v4 = a3;
  v5 = [v4 layoutState];
  int v6 = [v5 hasAccentKey];

  if (v6)
  {
    v7 = [v4 documentState];
    v8 = [v7 contextBeforeInput];

    unint64_t v9 = [v8 length];
    unint64_t v10 = v9 - 2;
    if (v9 < 2)
    {
      v11 = @"´";
    }
    else
    {
      v11 = @"´";
      if ([v8 characterAtIndex:v9 - 1] == 117)
      {
        uint64_t v12 = [v8 rangeOfComposedCharacterSequenceAtIndex:v10];
        v14 = objc_msgSend(v8, "substringWithRange:", v12, v13);
        uint64_t v15 = [v14 _firstLongCharacter];
        v16 = [(TIKeyboardFeatureSpecialization *)self wordCharacters];
        v17 = [v16 characterSet];
        LODWORD(v15) = [v17 longCharacterIsMember:v15];

        if (v15) {
          v11 = @"˚";
        }
      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)doesComposeText
{
  return 1;
}

- (id)externalStringToInternal:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (KB *)a3;
  v5 = operator new(0xCuLL);
  *(void *)v5 = 0x2C7000000B4;
  v5[2] = 730;
  __p = v5;
  KB::utf8_string(v11, v4, v6);

  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
  KB::decompose_diacritics();
  v8 = KB::ns_string((KB *)v12, v7);
  KB::String::~String((KB::String *)v12);
  KB::String::~String((KB::String *)v11);
  if (__p) {
    operator delete(__p);
  }
  return v8;
}

- (id)internalStringToExternal:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  KB::utf8_string(v7, (KB *)a3, (NSString *)a2);
  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
  KB::compose_diacritics();
  v5 = KB::ns_string((KB *)v8, v4);
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v7);
  return v5;
}

- (id)nonstopPunctuationCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_cs;
  v2 = [(TIKeyboardFeatureSpecialization *)&v5 nonstopPunctuationCharacters];
  v3 = [v2 stringByAppendingString:@"ˇ´˚"];

  return v3;
}

@end