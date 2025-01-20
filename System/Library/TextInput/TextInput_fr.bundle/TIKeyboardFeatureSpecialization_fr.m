@interface TIKeyboardFeatureSpecialization_fr
- (id)accentKeyStringForInputPrefix:(id)a3;
- (id)accentKeyStringForKeyboardState:(id)a3;
- (id)allAccentKeyStrings;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)nonstopPunctuationCharacters;
- (id)terminatorsDeletingAutospace;
- (void)createInputManager:(id)a3;
@end

@implementation TIKeyboardFeatureSpecialization_fr

- (id)allAccentKeyStrings
{
  return &unk_26F5DC9A0;
}

- (id)accentKeyStringForInputPrefix:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [v3 lowercaseString];

    if (-[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::once != -1) {
      dispatch_once(&-[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::once, &__block_literal_global);
    }
    if (([v4 hasSuffix:@"qu"] & 1) != 0
      || ([(id)-[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::apostrophePrefixes containsObject:v4] & 1) != 0)
    {
LABEL_6:
      v5 = @"'’";
    }
    else
    {
      __int16 v7 = objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1);
      v5 = @"ˋ";
      switch(((unsigned __int16)(v7 - 97) >> 1) | (unsigned __int16)((v7 - 97) << 15))
      {
        case 0:
          break;
        case 2:
          v5 = @"´";
          break;
        case 4:
        case 7:
          v5 = @"ˆ";
          break;
        case 10:
          if (([v4 isEqualToString:@"ou"] & 1) == 0
            && ![v4 isEqualToString:@"dou"])
          {
            v5 = @"ˆ";
          }
          v5 = v5;
          break;
        default:
          goto LABEL_6;
      }
    }
  }
  else
  {
    v5 = @"´";
    v4 = v3;
  }

  return v5;
}

- (id)accentKeyStringForKeyboardState:(id)a3
{
  id v4 = a3;
  v5 = [v4 layoutState];
  int v6 = [v5 hasAccentKey];

  if (v6)
  {
    if (-[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::onceToken != -1) {
      dispatch_once(&-[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::onceToken, &__block_literal_global_27);
    }
    __int16 v7 = [v4 documentState];
    v8 = [v7 contextBeforeInput];

    uint64_t v9 = [v8 rangeOfCharacterFromSet:-[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::nonLetterSet options:4];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [v8 substringFromIndex:v9 + v10];

      v8 = (void *)v11;
    }
    uint64_t v12 = [(TIKeyboardFeatureSpecialization_fr *)self accentKeyStringForInputPrefix:v8];
    v13 = (void *)v12;
    v14 = @"UI-Nothing";
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)createInputManager:(id)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = a3;
  operator new();
}

- (id)externalStringToInternal:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (KB *)a3;
  __p = operator new(0x10uLL);
  _OWORD *__p = xmmword_241DF57D0;
  KB::utf8_string(v10, v4, v5);

  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
  KB::decompose_diacritics();
  __int16 v7 = KB::ns_string((KB *)v11, v6);
  KB::String::~String((KB::String *)v11);
  KB::String::~String((KB::String *)v10);
  if (__p) {
    operator delete(__p);
  }

  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  KB::utf8_string(v7, (KB *)a3, (NSString *)a2);
  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
  KB::compose_diacritics();
  uint64_t v5 = KB::ns_string((KB *)v8, v4);
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v7);

  return v5;
}

- (id)nonstopPunctuationCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_fr;
  v2 = [(TIKeyboardFeatureSpecialization *)&v5 nonstopPunctuationCharacters];
  id v3 = [v2 stringByAppendingString:@"-"];

  return v3;
}

- (id)terminatorsDeletingAutospace
{
  id v3 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  id v4 = [v3 languageWithRegion];

  if (([v4 isEqualToString:@"fr_CA"] & 1) != 0
    || [v4 isEqualToString:@"fr_CH"])
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardFeatureSpecialization_fr;
    id v5 = [(TIKeyboardFeatureSpecialization *)&v8 terminatorsDeletingAutospace];
  }
  else
  {
    if (-[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::onceToken != -1) {
      dispatch_once(&-[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::onceToken, &__block_literal_global_50);
    }
    id v5 = (id)-[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::result;
  }
  int v6 = v5;

  return v6;
}

@end