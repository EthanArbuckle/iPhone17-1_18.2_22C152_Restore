@interface TIIndicScriptComposer
- (BOOL)_characterBeforeCursorIsConsonant;
- (BOOL)_characterBeforeCursorIsVowel;
- (BOOL)_contextIsStartOfWord;
- (BOOL)composesConsonants;
- (NSString)context;
- (NSString)languageIdentifier;
- (TIIndicScriptComposer)initWithLanguage:(id)a3 contextFetcher:(id)a4;
- (id)_consonantLetters;
- (id)_consonantLettersSet;
- (id)_contextualVowelLetters;
- (id)_letterToSignConverter;
- (id)_stringByStrippingTrailingVirama:(id)a3;
- (id)_vowelLetterToSignConverter;
- (id)_vowelLettersAndSigns;
- (id)_vowelModifierLetterToSignConverter;
- (id)contextFetcher;
- (id)contextualDisplayKeys;
- (id)stringByComposingInput:(id)a3;
- (int)scriptCode;
- (unsigned)_viramaSign;
- (void)setContextFetcher:(id)a3;
- (void)setLanguageIdentifier:(id)a3;
@end

@implementation TIIndicScriptComposer

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextFetcher, 0);
  objc_storeStrong((id *)&self->_languageIdentifier, 0);
  objc_storeStrong(&self->_vowelModifierLetterToSignConverter, 0);
  objc_storeStrong(&self->_vowelLetterToSignConverter, 0);
  objc_storeStrong((id *)&self->_contextualVowelLetters, 0);
  objc_storeStrong((id *)&self->_consonantLetters, 0);
  objc_storeStrong((id *)&self->_vowelLettersAndSigns, 0);

  objc_storeStrong((id *)&self->_consonantLettersSet, 0);
}

- (void)setContextFetcher:(id)a3
{
}

- (id)contextFetcher
{
  return self->_contextFetcher;
}

- (void)setLanguageIdentifier:(id)a3
{
}

- (NSString)languageIdentifier
{
  return self->_languageIdentifier;
}

- (id)contextualDisplayKeys
{
  v2 = self;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TIIndicScriptComposer *)self languageIdentifier];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v42 = [(TIIndicScriptComposer *)v2 context];
  v5 = [v42 _lastConjunctInLanguage:v3];
  BOOL v6 = [(TIIndicScriptComposer *)v2 _characterBeforeCursorIsConsonant];
  BOOL v47 = [(TIIndicScriptComposer *)v2 _characterBeforeCursorIsVowel];
  v43 = (void *)v3;
  id v49 = v5;
  v45 = v49;
  if (([v49 _isSingleGlyphInLanguage:v3] & 1) == 0)
  {
    v45 = objc_msgSend(NSString, "_stringWithUnichar:", objc_msgSend(v49, "_lastLongCharacter"));
  }
  [(TIIndicScriptComposer *)v2 _contextualVowelLetters];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v59;
    v10 = v2;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        if (v6)
        {
          v13 = [(TIIndicScriptComposer *)v2 _vowelLetterToSignConverter];
          v14 = ((void (**)(void, uint64_t, id))v13)[2](v13, v12, v49);
          uint64_t v15 = [v14 length];

          if (v15)
          {
            v16 = v45;
LABEL_17:
            v20 = [v16 stringByAppendingString:v14];
            [v4 setObject:v20 forKeyedSubscript:v12];

            v2 = v10;
            goto LABEL_22;
          }
          v17 = v14;
          v2 = v10;
        }
        else
        {
          v17 = 0;
        }
        if (v47)
        {
          v18 = [(TIIndicScriptComposer *)v2 _vowelModifierLetterToSignConverter];
          v14 = ((void (**)(void, uint64_t, id))v18)[2](v18, v12, v49);

          if ([v14 length])
          {
            char v19 = [v14 isEqualToString:v12];

            if ((v19 & 1) == 0)
            {
              v16 = v49;
              goto LABEL_17;
            }
          }
          else
          {
          }
          v2 = v10;
        }
        else
        {
          v14 = v17;
        }
        [v4 setObject:@"UI-Nothing" forKeyedSubscript:v12];
LABEL_22:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
    }
    while (v8);
  }
  if ([(TIIndicScriptComposer *)v2 composesConsonants])
  {
    v44 = [(TIIndicScriptComposer *)v2 _stringByStrippingTrailingVirama:v42];
    unint64_t v21 = [v44 length];
    unint64_t v22 = [v42 length];
    v23 = [(TIIndicScriptComposer *)v2 _consonantLetters];
    v48 = [(TIIndicScriptComposer *)v2 _consonantLettersSet];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v24 = v23;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v55 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v54 + 1) + 8 * j);
          v30 = [v49 stringByAppendingString:v29];
          if (v21 < v22
            && objc_msgSend(v48, "longCharacterIsMember:", objc_msgSend(v44, "_lastLongCharacter"))
            && [(__CFString *)v30 _isSingleGlyphInLanguage:v43])
          {
            v31 = v4;
            v32 = v30;
          }
          else
          {
            v31 = v4;
            v32 = @"UI-Nothing";
          }
          [v31 setObject:v32 forKeyedSubscript:v29];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v26);
    }
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v33 = [v4 allKeys];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v51;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v51 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v50 + 1) + 8 * k);
        v39 = [v4 objectForKeyedSubscript:v38];
        v40 = [v39 _stringByRemovingOffensiveOrVulgarWords];
        if (([v39 isEqualToString:v40] & 1) == 0) {
          [v4 setObject:v40 forKeyedSubscript:v38];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v35);
  }

  return v4;
}

- (id)stringByComposingInput:(id)a3
{
  id v4 = a3;
  int v5 = [v4 _lastLongCharacter];
  if (v5 != [(TIIndicScriptComposer *)self _viramaSign])
  {
    v10 = [(TIIndicScriptComposer *)self _letterToSignConverter];
    if (v10)
    {
      v11 = [(TIIndicScriptComposer *)self context];
      ((void (**)(void, id, void *))v10)[2](v10, v4, v11);
      uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {

        goto LABEL_11;
      }
    }

    goto LABEL_9;
  }
  BOOL v6 = [(TIIndicScriptComposer *)self context];
  int v7 = [v6 _lastLongCharacter];
  int v8 = [(TIIndicScriptComposer *)self _viramaSign];

  if (v7 == v8)
  {
    uint64_t v9 = @"‌";
    goto LABEL_11;
  }
  if ([(TIIndicScriptComposer *)self _characterBeforeCursorIsConsonant])
  {
LABEL_9:
    uint64_t v9 = (__CFString *)v4;
    goto LABEL_11;
  }
  uint64_t v9 = &stru_1F3F7A998;
LABEL_11:

  return v9;
}

- (id)_letterToSignConverter
{
  if ([(TIIndicScriptComposer *)self _contextIsStartOfWord]) {
    goto LABEL_6;
  }
  if ([(TIIndicScriptComposer *)self _characterBeforeCursorIsConsonant])
  {
    uint64_t v3 = [(TIIndicScriptComposer *)self _vowelLetterToSignConverter];
    goto LABEL_7;
  }
  if (![(TIIndicScriptComposer *)self _characterBeforeCursorIsVowel])
  {
LABEL_6:
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(TIIndicScriptComposer *)self _vowelModifierLetterToSignConverter];
  }
LABEL_7:

  return v3;
}

- (id)_vowelModifierLetterToSignConverter
{
  id vowelModifierLetterToSignConverter = self->_vowelModifierLetterToSignConverter;
  if (!vowelModifierLetterToSignConverter)
  {
    self->_id vowelModifierLetterToSignConverter = &__block_literal_global_44_14817;
    id vowelModifierLetterToSignConverter = &__block_literal_global_44_14817;
  }
  id v4 = _Block_copy(vowelModifierLetterToSignConverter);

  return v4;
}

id __60__TIIndicScriptComposer__vowelModifierLetterToSignConverter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  int v5 = a3;
  KB::String::String((KB::String *)v22, (const char *)[v4 UTF8String]);
  KB::utf8_string(v5, (uint64_t)v20);

  KB::String::String((KB::String *)v13, (const KB::String *)v22);
  KB::String::String((KB::String *)v11, (const KB::String *)v20);
  TI::IndicUtils::convertModifierLetterToSign(v13, (const KB::String *)v11, (uint64_t)v16);
  if (v12 && v11[6] == 1) {
    free(v12);
  }
  if (v15 && v14 == 1) {
    free(v15);
  }
  if (KB::String::equal((KB::String *)v22, (const KB::String *)v16, 1))
  {
    id v6 = v4;
  }
  else
  {
    int v7 = (const char *)v18;
    if (!v18) {
      int v7 = (const char *)&v19;
    }
    if (v16[0]) {
      int v8 = v7;
    }
    else {
      int v8 = "";
    }
    id v6 = [NSString stringWithUTF8String:v8];
  }
  uint64_t v9 = v6;
  if (v18 && v17 == 1) {
    free(v18);
  }
  if (v21 && v20[6] == 1) {
    free(v21);
  }
  if (v23 && v22[6] == 1) {
    free(v23);
  }

  return v9;
}

- (id)_vowelLetterToSignConverter
{
  id vowelLetterToSignConverter = self->_vowelLetterToSignConverter;
  if (!vowelLetterToSignConverter)
  {
    self->_id vowelLetterToSignConverter = &__block_literal_global_42;
    id vowelLetterToSignConverter = &__block_literal_global_42;
  }
  id v4 = _Block_copy(vowelLetterToSignConverter);

  return v4;
}

KB *__52__TIIndicScriptComposer__vowelLetterToSignConverter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  int v5 = a3;
  KB::utf8_string(v4, (uint64_t)v21);
  KB::utf8_string(v5, (uint64_t)v19);

  KB::String::String((KB::String *)&v13, (const KB::String *)v21);
  KB::String::String((KB::String *)v11, (const KB::String *)v19);
  TI::IndicUtils::convertLetterToSign(&v13, (const KB::String *)v11, (uint64_t)v15);
  if (v12 && v11[6] == 1) {
    free(v12);
  }
  if (v14 && BYTE6(v13) == 1) {
    free(v14);
  }
  if (KB::String::equal((KB::String *)v21, (const KB::String *)v15, 1))
  {
    id v6 = v4;
  }
  else
  {
    int v7 = (const char *)v17;
    if (!v17) {
      int v7 = (const char *)&v18;
    }
    if (v15[0]) {
      int v8 = v7;
    }
    else {
      int v8 = "";
    }
    id v6 = [NSString stringWithUTF8String:v8];
  }
  uint64_t v9 = v6;
  if (v17 && v16 == 1) {
    free(v17);
  }
  if (v20 && v19[6] == 1) {
    free(v20);
  }
  if (v22 && v21[6] == 1) {
    free(v22);
  }

  return v9;
}

- (BOOL)_contextIsStartOfWord
{
  v2 = [(TIIndicScriptComposer *)self context];
  if ([v2 length])
  {
    if (-[TIIndicScriptComposer _contextIsStartOfWord]::__onceToken != -1) {
      dispatch_once(&-[TIIndicScriptComposer _contextIsStartOfWord]::__onceToken, &__block_literal_global_14820);
    }
    uint64_t v3 = objc_msgSend(v2, "characterAtIndex:", objc_msgSend(v2, "length") - 1);
    char v4 = [(id)-[TIIndicScriptComposer _contextIsStartOfWord]::__nonLetterCharacterSet characterIsMember:v3];
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

void __46__TIIndicScriptComposer__contextIsStartOfWord__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B88] letterCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)-[TIIndicScriptComposer _contextIsStartOfWord]::__nonLetterCharacterSet;
  -[TIIndicScriptComposer _contextIsStartOfWord]::__nonLetterCharacterSet = v0;
}

- (id)_stringByStrippingTrailingVirama:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && (int v5 = [v4 _lastLongCharacter], v5 == -[TIIndicScriptComposer _viramaSign](self, "_viramaSign"))
    && objc_msgSend(v4, "_rangeOfLongCharacterAtIndex:", objc_msgSend(v4, "length") - 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v4;
  }
  int v8 = v7;

  return v8;
}

- (unsigned)_viramaSign
{
  return TI::IndicUtils::initialVowelLetterForScript([(TIIndicScriptComposer *)self scriptCode]) + 72;
}

- (BOOL)_characterBeforeCursorIsConsonant
{
  uint64_t v3 = [(TIIndicScriptComposer *)self context];
  BOOL v6 = 0;
  if ([v3 length])
  {
    uint64_t v4 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
    int v5 = [(TIIndicScriptComposer *)self _consonantLettersSet];
    LOBYTE(v4) = [v5 characterIsMember:v4];

    if (v4) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (BOOL)_characterBeforeCursorIsVowel
{
  uint64_t v3 = [(TIIndicScriptComposer *)self context];
  BOOL v6 = 0;
  if ([v3 length])
  {
    uint64_t v4 = objc_msgSend(v3, "characterAtIndex:", objc_msgSend(v3, "length") - 1);
    int v5 = [(TIIndicScriptComposer *)self _vowelLettersAndSigns];
    LOBYTE(v4) = [v5 characterIsMember:v4];

    if (v4) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

- (id)_vowelLettersAndSigns
{
  vowelLettersAndSigns = self->_vowelLettersAndSigns;
  if (!vowelLettersAndSigns)
  {
    uint64_t v4 = (NSCharacterSet *)objc_opt_new();
    unsigned int v5 = TI::IndicUtils::initialVowelLetterForScript([(TIIndicScriptComposer *)self scriptCode]);
    -[NSCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", v5, 16);
    -[NSCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", v5 + 57, 15);
    BOOL v6 = self->_vowelLettersAndSigns;
    self->_vowelLettersAndSigns = v4;

    vowelLettersAndSigns = self->_vowelLettersAndSigns;
  }

  return vowelLettersAndSigns;
}

- (id)_contextualVowelLetters
{
  contextualVowelLetters = self->_contextualVowelLetters;
  if (!contextualVowelLetters)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:16];
    int v5 = [(TIIndicScriptComposer *)self scriptCode];
    unsigned int v6 = TI::IndicUtils::initialVowelLetterForScript(v5);
    if (v6 > (unsigned __int16)(v6 - 4))
    {
      unsigned int v7 = (unsigned __int16)(v6 - 4);
      do
      {
        v15[0] = v6;
        v15[1] = v7;
        int v8 = [NSString stringWithCharacters:v15 length:2];
        [(NSArray *)v4 addObject:v8];

        ++v7;
      }
      while (v6 > v7);
    }
    unsigned __int16 v9 = v6 + 15;
    unsigned __int16 v14 = v6 + 1;
    do
    {
      v10 = [NSString stringWithCharacters:&v14 length:1];
      [(NSArray *)v4 addObject:v10];

      ++v14;
    }
    while (v14 <= v9);
    if (v5 > 15)
    {
      if (v5 == 16)
      {
        [(NSArray *)v4 addObject:@"ਅੱ"];
        v11 = @"ਅੰ";
        goto LABEL_16;
      }
      if (v5 == 31)
      {
        v11 = @"ଅ‍୍ୟ";
        goto LABEL_16;
      }
    }
    else
    {
      if (v5 == 4)
      {
        v11 = @"অ‍্য";
        goto LABEL_16;
      }
      if (v5 == 10)
      {
        v11 = @"ॲ";
LABEL_16:
        [(NSArray *)v4 addObject:v11];
      }
    }
    uint64_t v12 = self->_contextualVowelLetters;
    self->_contextualVowelLetters = v4;

    contextualVowelLetters = self->_contextualVowelLetters;
  }

  return contextualVowelLetters;
}

- (id)_consonantLetters
{
  p_consonantLetters = &self->_consonantLetters;
  consonantLetters = self->_consonantLetters;
  if (!consonantLetters)
  {
    obuint64_t j = 0;
    GetConsonantLettersSetAndArray([(TIIndicScriptComposer *)self scriptCode], 0, &obj);
    objc_storeStrong((id *)p_consonantLetters, obj);
    consonantLetters = self->_consonantLetters;
  }

  return consonantLetters;
}

- (id)_consonantLettersSet
{
  p_consonantLettersSet = &self->_consonantLettersSet;
  consonantLettersSet = self->_consonantLettersSet;
  if (!consonantLettersSet)
  {
    obuint64_t j = 0;
    GetConsonantLettersSetAndArray([(TIIndicScriptComposer *)self scriptCode], &obj, 0);
    objc_storeStrong((id *)p_consonantLettersSet, obj);
    consonantLettersSet = self->_consonantLettersSet;
  }

  return consonantLettersSet;
}

- (BOOL)composesConsonants
{
  return 1;
}

- (int)scriptCode
{
  id v2 = [(TIIndicScriptComposer *)self languageIdentifier];
  int ScriptCodeForLanguage = GetScriptCodeForLanguage(v2);

  return ScriptCodeForLanguage;
}

- (NSString)context
{
  id v2 = [(TIIndicScriptComposer *)self contextFetcher];
  uint64_t v3 = v2[2]();

  return (NSString *)v3;
}

- (TIIndicScriptComposer)initWithLanguage:(id)a3 contextFetcher:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TIIndicScriptComposer;
  int v8 = [(TIIndicScriptComposer *)&v11 init];
  unsigned __int16 v9 = v8;
  if (v8)
  {
    [(TIIndicScriptComposer *)v8 setLanguageIdentifier:v6];
    [(TIIndicScriptComposer *)v9 setContextFetcher:v7];
  }

  return v9;
}

@end