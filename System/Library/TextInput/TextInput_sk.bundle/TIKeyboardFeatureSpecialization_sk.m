@interface TIKeyboardFeatureSpecialization_sk
- (BOOL)doesComposeText;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (id)accentKeyStringForKeyboardState:(id)a3;
- (id)allAccentKeyStrings;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)nonstopPunctuationCharacters;
@end

@implementation TIKeyboardFeatureSpecialization_sk

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)allAccentKeyStrings
{
  return &unk_26F5E4428;
}

- (id)accentKeyStringForKeyboardState:(id)a3
{
  v3 = [a3 layoutState];
  int v4 = [v3 hasAccentKey];

  if (v4) {
    return @"´";
  }
  else {
    return 0;
  }
}

- (BOOL)doesComposeText
{
  return 1;
}

- (id)externalStringToInternal:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = (KB *)a3;
  __p = operator new(8uLL);
  void *__p = 0x2C7000000B4;
  KB::utf8_string(v10, v4, v5);

  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
  KB::decompose_diacritics();
  v7 = KB::ns_string((KB *)v11, v6);
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
  v5 = KB::ns_string((KB *)v8, v4);
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v7);

  return v5;
}

- (id)nonstopPunctuationCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_sk;
  v2 = [(TIKeyboardFeatureSpecialization *)&v5 nonstopPunctuationCharacters];
  v3 = [v2 stringByAppendingString:@"ˇ´"];

  return v3;
}

@end