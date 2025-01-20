@interface TIEmojiCandidateGenerator
- (BOOL)isLocaleDisabled:(id)a3;
- (NSArray)activeInputModes;
- (TIEmojiCandidateGenerator)initWithActiveInputModes:(id)a3;
- (TIEmojiCandidateGenerator)initWithActiveInputModes:(id)a3 inputManager:(id)a4;
- (TIInputMode)primaryInputMode;
- (__EmojiLocaleDataWrapper)emojiDataForInputModeIdx:(unint64_t)a3;
- (id)createAndAddEmojiTokensFrom:(__CFArray *)a3 inArray:(id)a4 forInputString:(id)a5;
- (id)emojiAdornmentCandidates:(id)a3;
- (id)emojiAdornmentCandidates:(id)a3 emojiGenerator:(void *)a4 emojiData:(__EmojiLocaleDataWrapper *)a5;
- (id)emojiAdornmentCandidatesForKeyboardState:(id)a3;
- (id)emojiAlternativesForText:(id)a3 matchedString:(id *)a4;
- (id)emojiAppendCandidates:(id)a3;
- (id)emojiReplacementCandidates:(id)a3;
- (id)emojiReplacementCandidates:(id)a3 matchedString:(id *)a4;
- (id)emojiReplacementCandidatesForKeyboardState:(id)a3;
- (id)emojiReplacementCandidatesForText:(id)a3;
- (id)enumerateForEmojiAlternativesInText:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 matchedString:(id *)a5;
- (id)enumerateForEmojiCandidatesIn:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 asReplacementCandidate:(BOOL)a5;
- (id)enumerateForEmojiCandidatesIn:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 asReplacementCandidate:(BOOL)a5 matchedString:(id *)a6;
- (id)extractTokensForEmojiComputation:(id)a3;
- (id)generateEmojiAdornmentCandidates:(id)a3;
- (id)getSkinToneSensitiveEmojis:(id)a3;
- (id)randomShuffle:(id)a3;
- (id)skinToneModifiedAdornmentEmojis:(id)a3 forLocale:(__EmojiLocaleDataWrapper *)a4 forInput:(id)a5;
- (int64_t)emojiPredominantInputModeIdxFromContext;
- (void)dealloc;
- (void)emojiAlternativesForText:(id)a3 completionHandler:(id)a4;
- (void)emojiGeneratorForInputModeIdx:(unint64_t)a3;
- (void)emojiReplacementCandidatesForText:(id)a3 completionHandler:(id)a4;
- (void)setActiveInputModes:(id)a3;
- (void)updateEmojiAdornmentGenerators;
- (void)updateEmojiLocale;
- (void)updateEmojiStatusForKeyboardState:(id)a3;
- (void)updateEmojiStatusForKeyboardType:(unint64_t)a3 appIdentifier:(id)a4;
- (void)updateForActiveInputModes:(id)a3;
- (void)updateForMultilingualKeyboard:(id)a3;
@end

@implementation TIEmojiCandidateGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInputModes, 0);
  objc_destroyWeak((id *)&self->m_inputManager);

  objc_storeStrong((id *)&self->m_disabledLocales, 0);
}

- (void)setActiveInputModes:(id)a3
{
}

- (NSArray)activeInputModes
{
  return self->_activeInputModes;
}

- (void)emojiGeneratorForInputModeIdx:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return (void *)*((void *)&self->m_emojiGeneratorPrimaryLanguage + a3);
  }
}

- (__EmojiLocaleDataWrapper)emojiDataForInputModeIdx:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return (__EmojiLocaleDataWrapper *)*((void *)&self->m_emojiDataForPrimaryLocale + a3);
  }
}

- (int64_t)emojiPredominantInputModeIdxFromContext
{
  p_m_inputManager = &self->m_inputManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_inputManager);
  if (!WeakRetained) {
    return -1;
  }
  v5 = WeakRetained;
  int v6 = _os_feature_enabled_impl();

  if (!v6) {
    return -1;
  }
  id v7 = objc_loadWeakRetained((id *)p_m_inputManager);
  int v8 = [v7 predominantLexiconInContext];

  unint64_t v9 = TILocaleIdentifierForLexiconID(v8);
  int64_t v10 = -1;
  if (v8 && v9)
  {
    v11 = [NSString stringWithCString:TILocaleIdentifierForLexiconID(v8) encoding:4];
    v12 = [(TIEmojiCandidateGenerator *)self primaryInputMode];
    v13 = [v12 locale];
    v14 = [v13 localeIdentifier];
    char v15 = [v14 isEqualToString:v11];

    if (v15)
    {
      int64_t v10 = 0;
LABEL_18:

      return v10;
    }
    v17 = [(TIEmojiCandidateGenerator *)self activeInputModes];
    if ((unint64_t)[v17 count] <= 1)
    {
    }
    else
    {
      v18 = [(TIEmojiCandidateGenerator *)self activeInputModes];
      int64_t v10 = 1;
      v19 = [v18 objectAtIndexedSubscript:1];
      v20 = [v19 locale];
      v21 = [v20 localeIdentifier];
      char v22 = [v21 isEqualToString:v11];

      if (v22) {
        goto LABEL_18;
      }
    }
    v23 = [(TIEmojiCandidateGenerator *)self activeInputModes];
    if ((unint64_t)[v23 count] <= 2)
    {

      int64_t v10 = -1;
    }
    else
    {
      v24 = [(TIEmojiCandidateGenerator *)self activeInputModes];
      v25 = [v24 objectAtIndexedSubscript:2];
      v26 = [v25 locale];
      v27 = [v26 localeIdentifier];
      int v28 = [v27 isEqualToString:v11];

      if (v28) {
        int64_t v10 = 2;
      }
      else {
        int64_t v10 = -1;
      }
    }
    goto LABEL_18;
  }
  return v10;
}

- (BOOL)isLocaleDisabled:(id)a3
{
  id v4 = a3;
  BOOL v5 = (_os_feature_enabled_impl() & 1) == 0 && [(NSSet *)self->m_disabledLocales containsObject:v4];

  return v5;
}

- (id)emojiAdornmentCandidatesForKeyboardState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1C978] array];
  if (self->m_shouldShowEmojis)
  {
    int v6 = [v4 documentState];
    id v7 = [v6 contextBeforeInput];
    uint64_t v8 = [(TIEmojiCandidateGenerator *)self generateEmojiAdornmentCandidates:v7];

    BOOL v5 = (void *)v8;
  }

  return v5;
}

- (void)emojiReplacementCandidatesForText:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, __CFString *, void *))a4;
  uint64_t v8 = [MEMORY[0x1E4F1C978] array];
  if (!self->m_shouldShowEmojis)
  {
    v12 = &stru_1F3F7A998;
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  unint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  int64_t v10 = [v6 componentsSeparatedByCharactersInSet:v9];
  v11 = [v10 lastObject];

  if ([v11 _looksLikeEmailAddress])
  {
    v12 = &stru_1F3F7A998;
  }
  else
  {
    v12 = &stru_1F3F7A998;
    if (([v11 _looksLikeURL] & 1) == 0)
    {
      v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      v14 = [v6 componentsSeparatedByCharactersInSet:v13];

      char v15 = [(TIEmojiCandidateGenerator *)self extractTokensForEmojiComputation:v14];
      v17 = &stru_1F3F7A998;
      uint64_t v16 = [(TIEmojiCandidateGenerator *)self emojiReplacementCandidates:v15 matchedString:&v17];
      v12 = v17;

      uint64_t v8 = (void *)v16;
    }
  }

  if (v7) {
LABEL_9:
  }
    v7[2](v7, v12, v8);
LABEL_10:
}

- (id)enumerateForEmojiAlternativesInText:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 matchedString:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  CFStringRef LocaleIdentifier = (const __CFString *)CEMEmojiLocaleDataGetLocaleIdentifier();
  v42 = self;
  if ([(TIEmojiCandidateGenerator *)self isLocaleDisabled:LocaleIdentifier])
  {
    id v11 = v9;
  }
  else
  {
    v12 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
    [v12 setString:v8];
    [v12 setLanguage:LocaleIdentifier];
    v36 = v12;
    v13 = objc_msgSend(v12, "tokensForRange:", 0, objc_msgSend(v8, "length"));
    v37 = a5;
    if ((unint64_t)[v13 count] >= 8)
    {
      uint64_t v14 = objc_msgSend(v13, "subarrayWithRange:", objc_msgSend(v13, "count") - 7, 7);

      v13 = (void *)v14;
    }
    char v15 = [v13 lastObject];
    uint64_t v16 = [v15 rangeValue];
    uint64_t v18 = v17;

    if ([v13 count])
    {
      v19 = 0;
      unint64_t v20 = 0;
      uint64_t v43 = v16 + v18;
      v40 = a4;
      id v41 = v8;
      CFStringRef v38 = LocaleIdentifier;
      v39 = v13;
      while (![v9 count])
      {
        v21 = [v13 objectAtIndexedSubscript:v20];
        uint64_t v22 = [v21 rangeValue];

        v23 = objc_msgSend(v8, "substringWithRange:", v22, v43 - v22);

        uint64_t v24 = [v13 count];
        if (!LocaleIdentifier
          || v24 - v20 != 2
          || !CFStringHasPrefix(LocaleIdentifier, @"en")
          || [v23 caseInsensitiveCompare:@"northern ireland"]
          && [v23 caseInsensitiveCompare:@"inner mongolia"])
        {
          EmojiTokensForString = (const void *)CEMEmojiLocaleDataCreateEmojiTokensForString();
          v26 = [MEMORY[0x1E4F610A0] emojiTokensForCEMEmojiTokens:EmojiTokensForString];
          if ([v26 count])
          {
            v44 = v9;
            v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v26, "count"));
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v28 = v26;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v45 objects:v49 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v46;
              do
              {
                for (uint64_t i = 0; i != v30; ++i)
                {
                  if (*(void *)v46 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = [*(id *)(*((void *)&v45 + 1) + 8 * i) string];
                  [v27 addObject:v33];
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v45 objects:v49 count:16];
              }
              while (v30);
            }

            unint64_t v9 = [(TIEmojiCandidateGenerator *)v42 skinToneModifiedAdornmentEmojis:v27 forLocale:v40 forInput:v23];

            id v8 = v41;
            CFStringRef LocaleIdentifier = v38;
            v13 = v39;
          }
          if (EmojiTokensForString) {
            CFRelease(EmojiTokensForString);
          }

          ++v20;
          v19 = v23;
          if (v20 < [v13 count]) {
            continue;
          }
        }
        goto LABEL_28;
      }
      v23 = v19;
    }
    else
    {
      v23 = 0;
    }
LABEL_28:
    uint64_t v34 = [v9 count];
    if (v37 && v34) {
      id *v37 = v23;
    }
    id v11 = v9;
  }

  return v11;
}

- (id)emojiAlternativesForText:(id)a3 matchedString:(id *)a4
{
  id v6 = a3;
  if (!self->m_isEmojiInputModeEnabled)
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_14;
  }
  id v7 = [MEMORY[0x1E4F1C978] array];
  [(TIEmojiCandidateGenerator *)self updateEmojiLocale];
  int64_t v8 = [(TIEmojiCandidateGenerator *)self emojiPredominantInputModeIdxFromContext];
  if (v8 < 0)
  {
    m_emojiDataForPrimaryLocale = self->m_emojiDataForPrimaryLocale;
    if (!m_emojiDataForPrimaryLocale) {
      goto LABEL_14;
    }
    int64_t v10 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiAlternativesInText:v6 forEmojiLocaleData:m_emojiDataForPrimaryLocale matchedString:a4];
    if (![v10 count])
    {
      m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
      if (m_emojiDataForSecondaryLocale)
      {
        uint64_t v13 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiAlternativesInText:v6 forEmojiLocaleData:m_emojiDataForSecondaryLocale matchedString:a4];

        int64_t v10 = (void *)v13;
      }
    }
    if (![v10 count])
    {
      m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
      if (m_emojiDataForTertiaryLocale)
      {
        uint64_t v15 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiAlternativesInText:v6 forEmojiLocaleData:m_emojiDataForTertiaryLocale matchedString:a4];

        int64_t v10 = (void *)v15;
      }
    }
  }
  else
  {
    unint64_t v9 = [(TIEmojiCandidateGenerator *)self emojiDataForInputModeIdx:v8];
    if (!v9) {
      goto LABEL_14;
    }
    int64_t v10 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiAlternativesInText:v6 forEmojiLocaleData:v9 matchedString:a4];
  }

  id v7 = v10;
LABEL_14:

  return v7;
}

- (void)emojiAlternativesForText:(id)a3 completionHandler:(id)a4
{
  id v9 = 0;
  id v6 = (void (**)(id, id, void *))a4;
  id v7 = [(TIEmojiCandidateGenerator *)self emojiAlternativesForText:a3 matchedString:&v9];
  id v8 = v9;
  v6[2](v6, v8, v7);
}

- (id)emojiReplacementCandidatesForText:(id)a3
{
  uint64_t v9 = 0;
  int64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__6224;
  uint64_t v13 = __Block_byref_object_dispose__6225;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v14 = [v4 array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__TIEmojiCandidateGenerator_emojiReplacementCandidatesForText___block_invoke;
  v8[3] = &unk_1E6E2ABE8;
  v8[4] = &v9;
  [(TIEmojiCandidateGenerator *)self emojiReplacementCandidatesForText:v5 completionHandler:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __63__TIEmojiCandidateGenerator_emojiReplacementCandidatesForText___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (id)emojiReplacementCandidatesForKeyboardState:(id)a3
{
  id v4 = [a3 documentState];
  id v5 = [v4 contextBeforeInput];
  id v6 = [(TIEmojiCandidateGenerator *)self emojiReplacementCandidatesForText:v5];

  return v6;
}

- (id)emojiReplacementCandidates:(id)a3 matchedString:(id *)a4
{
  id v6 = a3;
  if (!self->m_isEmojiInputModeEnabled)
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  id v7 = [MEMORY[0x1E4F1C978] array];
  [(TIEmojiCandidateGenerator *)self updateEmojiLocale];
  uint64_t v8 = [v6 lastObject];
  int64_t v9 = [(TIEmojiCandidateGenerator *)self emojiPredominantInputModeIdxFromContext];
  if (self->m_emojiDataForPrimaryLocale && v8)
  {
    int64_t v10 = v9;
    if (CEMStringIsSingleEmoji())
    {
      uint64_t v11 = (const void *)CEMEmojiTokenCreateWithString();
      v12 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v13 = (const void *)CEMEmojiTokenCopyRelatedEmoji();
      if (v11) {
        CFRelease(v11);
      }
      if (!v13) {
        goto LABEL_18;
      }
      uint64_t v14 = [(TIEmojiCandidateGenerator *)self createAndAddEmojiTokensFrom:v13 inArray:v12 forInputString:v8];

      CFRelease(v13);
    }
    else
    {
      if ((v10 & 0x8000000000000000) == 0)
      {
        uint64_t v15 = [(TIEmojiCandidateGenerator *)self emojiDataForInputModeIdx:v10];
        if (!v15) {
          goto LABEL_19;
        }
        v12 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiCandidatesIn:v6 forEmojiLocaleData:v15 asReplacementCandidate:1 matchedString:a4];
        goto LABEL_18;
      }
      v12 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiCandidatesIn:v6 forEmojiLocaleData:self->m_emojiDataForPrimaryLocale asReplacementCandidate:1 matchedString:a4];
      if (![v12 count])
      {
        m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
        if (m_emojiDataForSecondaryLocale)
        {
          uint64_t v17 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiCandidatesIn:v6 forEmojiLocaleData:m_emojiDataForSecondaryLocale asReplacementCandidate:1 matchedString:a4];

          v12 = (void *)v17;
        }
      }
      if ([v12 count] || (m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale) == 0)
      {
LABEL_18:

        id v7 = v12;
        goto LABEL_19;
      }
      uint64_t v14 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiCandidatesIn:v6 forEmojiLocaleData:m_emojiDataForTertiaryLocale asReplacementCandidate:1 matchedString:a4];
    }
    v12 = (void *)v14;
    goto LABEL_18;
  }
LABEL_19:

  return v7;
}

- (id)emojiReplacementCandidates:(id)a3
{
  return [(TIEmojiCandidateGenerator *)self emojiReplacementCandidates:a3 matchedString:0];
}

- (void)updateEmojiStatusForKeyboardType:(unint64_t)a3 appIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  uint64_t v8 = [v7 enabledInputModeIdentifiers];

  self->m_isEmojiInputModeEnabled = [v8 indexOfObjectPassingTest:&__block_literal_global_6228] != 0x7FFFFFFFFFFFFFFFLL;
  unsigned int v9 = (a3 < 0x10) & (0x99FAu >> a3);
  if (TIGetShowEmojisByDefaultValue_onceToken != -1) {
    dispatch_once(&TIGetShowEmojisByDefaultValue_onceToken, &__block_literal_global_153);
  }
  int64_t v10 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  uint64_t v11 = [v10 valueForPreferenceKey:@"ShowEmojisByDefault"];

  int v12 = [v11 BOOLValue];
  if (v9) {
    goto LABEL_4;
  }
  if (v12)
  {
    BOOL v13 = 1;
LABEL_15:
    self->m_shouldShowEmojis = v13;
    goto LABEL_16;
  }
  if (self->m_isEmojiInputModeEnabled && v6)
  {
    uint64_t v20 = 0;
    uint64_t v14 = +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
    uint64_t v15 = [v14 emojiUsageCountForApp:&stru_1F3F7A998 lastEmojiCountUpdateTime:&v20];

    uint64_t v16 = +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
    uint64_t v17 = [v16 emojiUsageCountForApp:v6 lastEmojiCountUpdateTime:&v19];

    if (v15) {
      BOOL v18 = v17 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    BOOL v13 = !v18;
    goto LABEL_15;
  }
LABEL_4:
  self->m_shouldShowEmojis = 0;
LABEL_16:
}

uint64_t __76__TIEmojiCandidateGenerator_updateEmojiStatusForKeyboardType_appIdentifier___block_invoke()
{
  v0 = TIInputModeGetLanguage();
  uint64_t v1 = [v0 isEqualToString:@"emoji"];

  return v1;
}

- (void)updateEmojiStatusForKeyboardState:(id)a3
{
  id v4 = a3;
  id v7 = [v4 textInputTraits];
  uint64_t v5 = [v7 keyboardType];
  id v6 = [v4 clientIdentifier];

  [(TIEmojiCandidateGenerator *)self updateEmojiStatusForKeyboardType:v5 appIdentifier:v6];
}

- (void)updateForActiveInputModes:(id)a3
{
  id v8 = a3;
  [(TIEmojiCandidateGenerator *)self setActiveInputModes:v8];
  if ((unint64_t)[v8 count] < 2)
  {
    m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
    if (m_emojiDataForSecondaryLocale)
    {
      CFRelease(m_emojiDataForSecondaryLocale);
      self->m_emojiDataForSecondaryLocale = 0;
    }
    m_emojiGeneratorSecondaryLanguage = self->m_emojiGeneratorSecondaryLanguage;
    if (m_emojiGeneratorSecondaryLanguage)
    {
      CFRelease(m_emojiGeneratorSecondaryLanguage);
      self->m_emojiGeneratorSecondaryLanguage = 0;
    }
    m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
    if (m_emojiDataForTertiaryLocale)
    {
      CFRelease(m_emojiDataForTertiaryLocale);
      self->m_emojiDataForTertiaryLocale = 0;
    }
    m_emojiGeneratorTertiaryLanguage = self->m_emojiGeneratorTertiaryLanguage;
    if (m_emojiGeneratorTertiaryLanguage)
    {
      CFRelease(m_emojiGeneratorTertiaryLanguage);
      self->m_emojiGeneratorTertiaryLanguage = 0;
    }
  }
  else
  {
    [(TIEmojiCandidateGenerator *)self updateForMultilingualKeyboard:v8];
  }
}

- (void)updateForMultilingualKeyboard:(id)a3
{
  id v22 = a3;
  if ((unint64_t)[v22 count] >= 2)
  {
    if ((unint64_t)[v22 count] >= 2)
    {
      m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
      if (m_emojiDataForSecondaryLocale) {
        CFRelease(m_emojiDataForSecondaryLocale);
      }
      uint64_t v5 = [v22 objectAtIndexedSubscript:1];
      id v6 = [v5 locale];
      MEMORY[0x1E4E79AD0]();

      self->m_emojiDataForSecondaryLocale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
      m_emojiGeneratorSecondaryLanguage = self->m_emojiGeneratorSecondaryLanguage;
      if (m_emojiGeneratorSecondaryLanguage) {
        CFRelease(m_emojiGeneratorSecondaryLanguage);
      }
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      unsigned int v9 = (const void *)*MEMORY[0x1E4F79BC8];
      int64_t v10 = [v22 objectAtIndexedSubscript:1];
      uint64_t v11 = [v10 locale];
      int v12 = (const void *)MEMORY[0x1E4E79AD0]();
      CFDictionaryAddValue(Mutable, v9, v12);

      self->m_emojiGeneratorSecondaryLanguage = (void *)NLEmojiPredictorCreate();
      CFRelease(Mutable);
    }
    if ((unint64_t)[v22 count] >= 3)
    {
      m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
      if (m_emojiDataForTertiaryLocale) {
        CFRelease(m_emojiDataForTertiaryLocale);
      }
      uint64_t v14 = [v22 objectAtIndexedSubscript:2];
      uint64_t v15 = [v14 locale];
      MEMORY[0x1E4E79AD0]();

      self->m_emojiDataForTertiaryLocale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
      m_emojiGeneratorTertiaryLanguage = self->m_emojiGeneratorTertiaryLanguage;
      if (m_emojiGeneratorTertiaryLanguage) {
        CFRelease(m_emojiGeneratorTertiaryLanguage);
      }
      uint64_t v17 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      BOOL v18 = (const void *)*MEMORY[0x1E4F79BC8];
      uint64_t v19 = [v22 objectAtIndexedSubscript:2];
      uint64_t v20 = [v19 locale];
      v21 = (const void *)MEMORY[0x1E4E79AD0]();
      CFDictionaryAddValue(v17, v18, v21);

      self->m_emojiGeneratorTertiaryLanguage = (void *)NLEmojiPredictorCreate();
      CFRelease(v17);
    }
  }
}

- (id)generateEmojiAdornmentCandidates:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] array];
  if ([v4 length])
  {
    uint64_t v43 = v5;
    id v6 = [MEMORY[0x1E4F28B88] punctuationAndWhitespaceCharacterSet];
    id v44 = v4;
    id v7 = [v4 stringByTrimmingCharactersInSet:v6];

    id v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v42 = v7;
    unsigned int v9 = [v7 componentsSeparatedByCharactersInSet:v8];

    int64_t v10 = [MEMORY[0x1E4F1CA48] array];
    if ([v9 count])
    {
      uint64_t v11 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v9, "count") - 1);
      [v11 length];
      uint64_t v62 = MEMORY[0x1E4F143A8];
      uint64_t v63 = 3221225472;
      v64 = __62__TIEmojiCandidateGenerator_generateEmojiAdornmentCandidates___block_invoke;
      v65 = &unk_1E6E2ABA0;
      id v66 = v10;
      CEMEnumerateEmojiTokensInStringWithBlock();
    }
    v49 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = v9;
    long long v48 = v10;
    v40 = self;
    if ([v9 count])
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      obuint64_t j = v9;
      uint64_t v12 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v59 != v14) {
              objc_enumerationMutation(obj);
            }
            id v16 = *(id *)(*((void *)&v58 + 1) + 8 * i);
            if (CEMStringContainsEmoji())
            {
              long long v56 = 0u;
              long long v57 = 0u;
              long long v54 = 0u;
              long long v55 = 0u;
              id v17 = v10;
              uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v68 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v55;
                do
                {
                  uint64_t v21 = 0;
                  id v22 = v16;
                  do
                  {
                    if (*(void *)v55 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", *(void *)(*((void *)&v54 + 1) + 8 * v21), &stru_1F3F7A998, v40);
                    id v16 = (id)objc_claimAutoreleasedReturnValue();

                    ++v21;
                    id v22 = v16;
                  }
                  while (v19 != v21);
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v68 count:16];
                }
                while (v19);
              }

              int64_t v10 = v48;
            }
            if (objc_msgSend(v16, "length", v40)) {
              [v49 addObject:v16];
            }
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
        }
        while (v13);
      }

      self = v40;
    }
    -[TIEmojiCandidateGenerator extractTokensForEmojiComputation:](self, "extractTokensForEmojiComputation:", v49, v40);
    id obja = (id)objc_claimAutoreleasedReturnValue();
    v23 = [obja componentsJoinedByString:@" "];
    uint64_t v24 = [(TIEmojiCandidateGenerator *)self emojiAdornmentCandidates:v23];
    v25 = [MEMORY[0x1E4F1CA48] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v26 = v24;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v67 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          v32 = [v31 candidate];
          char v33 = [v10 containsObject:v32];

          if ((v33 & 1) == 0) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v67 count:16];
      }
      while (v28);
    }

    if ([v25 count] || objc_msgSend(v10, "count"))
    {
      id v34 = v25;
      v35 = v43;
      v36 = v45;
      v37 = obja;
    }
    else
    {
      v36 = v45;
      uint64_t v5 = v43;
      if (![v45 count])
      {
        v37 = obja;
        goto LABEL_37;
      }
      v35 = objc_msgSend(v45, "objectAtIndex:", objc_msgSend(v45, "count") - 1);
      id v34 = [MEMORY[0x1E4F1C978] array];
      v37 = obja;
      if (!CEMStringContainsEmoji())
      {
        uint64_t v39 = [v41 emojiAppendCandidates:obja];

        id v34 = (id)v39;
      }
    }
    uint64_t v5 = v34;
LABEL_37:

    id v4 = v44;
  }

  return v5;
}

uint64_t __62__TIEmojiCandidateGenerator_generateEmojiAdornmentCandidates___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t String = CEMEmojiTokenGetString();

  return [v1 addObject:String];
}

- (id)emojiAdornmentCandidates:(id)a3 emojiGenerator:(void *)a4 emojiData:(__EmojiLocaleDataWrapper *)a5
{
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  unsigned int v9 = [v7 array];
  CandidatesForuint64_t String = (const __CFArray *)NLEmojiPredictorCreateCandidatesForString();

  [(TIEmojiCandidateGenerator *)self updateEmojiLocale];
  if (CandidatesForString)
  {
    CFIndex Count = CFArrayGetCount(CandidatesForString);
    if (a5 && Count >= 1)
    {
      uint64_t v12 = [(TIEmojiCandidateGenerator *)self skinToneModifiedAdornmentEmojis:CandidatesForString forLocale:a5 forInput:&stru_1F3F7A998];

      unsigned int v9 = (void *)v12;
    }
    CFRelease(CandidatesForString);
  }

  return v9;
}

- (id)emojiAdornmentCandidates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (![v4 length]) {
    goto LABEL_19;
  }
  [(TIEmojiCandidateGenerator *)self updateEmojiAdornmentGenerators];
  int64_t v6 = [(TIEmojiCandidateGenerator *)self emojiPredominantInputModeIdxFromContext];
  if (v6 < 0)
  {
    if (self->m_emojiGeneratorPrimaryLanguage)
    {
      id v17 = [(TIEmojiCandidateGenerator *)self primaryInputMode];
      uint64_t v18 = [v17 locale];
      uint64_t v19 = [v18 localeIdentifier];
      BOOL v20 = [(TIEmojiCandidateGenerator *)self isLocaleDisabled:v19];

      if (!v20)
      {
        uint64_t v21 = [(TIEmojiCandidateGenerator *)self emojiAdornmentCandidates:v4 emojiGenerator:self->m_emojiGeneratorPrimaryLanguage emojiData:self->m_emojiDataForPrimaryLocale];

        uint64_t v5 = (void *)v21;
      }
    }
    if ([v5 count] || !self->m_emojiGeneratorSecondaryLanguage) {
      goto LABEL_17;
    }
    id v22 = [(TIEmojiCandidateGenerator *)self activeInputModes];
    if ((unint64_t)[v22 count] >= 2)
    {
      v23 = [(TIEmojiCandidateGenerator *)self activeInputModes];
      uint64_t v24 = [v23 objectAtIndexedSubscript:1];
      v25 = [v24 locale];
      id v26 = [v25 localeIdentifier];
      BOOL v27 = [(TIEmojiCandidateGenerator *)self isLocaleDisabled:v26];

      if (v27) {
        goto LABEL_17;
      }
      [(TIEmojiCandidateGenerator *)self emojiAdornmentCandidates:v4 emojiGenerator:self->m_emojiGeneratorSecondaryLanguage emojiData:self->m_emojiDataForSecondaryLocale];
      v5 = id v22 = v5;
    }

LABEL_17:
    id v16 = v5;
    if ([v5 count] || !self->m_emojiGeneratorTertiaryLanguage) {
      goto LABEL_18;
    }
    uint64_t v5 = [(TIEmojiCandidateGenerator *)self activeInputModes];
    if ([v5 count] != 3) {
      goto LABEL_7;
    }
    uint64_t v30 = [(TIEmojiCandidateGenerator *)self activeInputModes];
    uint64_t v31 = [v30 objectAtIndexedSubscript:2];
    v32 = [v31 locale];
    char v33 = [v32 localeIdentifier];
    BOOL v34 = [(TIEmojiCandidateGenerator *)self isLocaleDisabled:v33];

    if (v34) {
      goto LABEL_18;
    }
    uint64_t v15 = [(TIEmojiCandidateGenerator *)self emojiAdornmentCandidates:v4 emojiGenerator:self->m_emojiGeneratorTertiaryLanguage emojiData:self->m_emojiDataForTertiaryLocale];
    uint64_t v5 = v16;
LABEL_6:
    id v16 = (void *)v15;
LABEL_7:

LABEL_18:
    uint64_t v5 = v16;
    goto LABEL_19;
  }
  int64_t v7 = v6;
  id v8 = [(TIEmojiCandidateGenerator *)self emojiGeneratorForInputModeIdx:v6];
  if (v8)
  {
    unsigned int v9 = v8;
    int64_t v10 = [(TIEmojiCandidateGenerator *)self activeInputModes];
    uint64_t v11 = [v10 objectAtIndexedSubscript:v7];
    uint64_t v12 = [v11 locale];
    uint64_t v13 = [v12 localeIdentifier];
    BOOL v14 = [(TIEmojiCandidateGenerator *)self isLocaleDisabled:v13];

    if (!v14)
    {
      uint64_t v15 = [(TIEmojiCandidateGenerator *)self emojiAdornmentCandidates:v4 emojiGenerator:v9 emojiData:[(TIEmojiCandidateGenerator *)self emojiDataForInputModeIdx:v7]];
      goto LABEL_6;
    }
  }
LABEL_19:
  uint64_t v28 = [(TIEmojiCandidateGenerator *)self randomShuffle:v5];

  return v28;
}

- (id)emojiAppendCandidates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] array];
  [(TIEmojiCandidateGenerator *)self updateEmojiLocale];
  int64_t v6 = [(TIEmojiCandidateGenerator *)self emojiPredominantInputModeIdxFromContext];
  if ((v6 & 0x8000000000000000) == 0)
  {
    int64_t v7 = [(TIEmojiCandidateGenerator *)self emojiDataForInputModeIdx:v6];
    if (!v7) {
      goto LABEL_11;
    }
    m_emojiDataForTertiaryLocale = v7;
    goto LABEL_4;
  }
  m_emojiDataForPrimaryLocale = self->m_emojiDataForPrimaryLocale;
  if (m_emojiDataForPrimaryLocale)
  {
    uint64_t v11 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiCandidatesIn:v4 forEmojiLocaleData:m_emojiDataForPrimaryLocale asReplacementCandidate:0];

    if ([v11 count] || (m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale) == 0)
    {
      uint64_t v5 = v11;
    }
    else
    {
      uint64_t v5 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiCandidatesIn:v4 forEmojiLocaleData:m_emojiDataForSecondaryLocale asReplacementCandidate:0];
    }
    if (![v5 count])
    {
      m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
      if (m_emojiDataForTertiaryLocale)
      {
LABEL_4:
        uint64_t v9 = [(TIEmojiCandidateGenerator *)self enumerateForEmojiCandidatesIn:v4 forEmojiLocaleData:m_emojiDataForTertiaryLocale asReplacementCandidate:0];

        uint64_t v5 = (void *)v9;
      }
    }
  }
LABEL_11:

  return v5;
}

- (id)skinToneModifiedAdornmentEmojis:(id)a3 forLocale:(__EmojiLocaleDataWrapper *)a4 forInput:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [(TIEmojiCandidateGenerator *)self getSkinToneSensitiveEmojis:a3];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4FAE318], "candidateWithCandidate:forInput:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)getSkinToneSensitiveEmojis:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!getSkinToneSensitiveEmojis__fistEmoji)
  {
    uint64_t v4 = [MEMORY[0x1E4F610A0] emojiTokenWithString:@"✊" localeData:0];
    uint64_t v5 = (void *)getSkinToneSensitiveEmojis__fistEmoji;
    getSkinToneSensitiveEmojis__fistEmojuint64_t i = v4;
  }
  int64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    id v7 = [MEMORY[0x1E4F61098] sharedServiceWithMachName:0];
    id v8 = [v7 preferences];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v3;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = [MEMORY[0x1E4F610A0] emojiTokenWithString:*(void *)(*((void *)&v19 + 1) + 8 * i) localeData:0];
          if ([v14 supportsSkinToneVariants]
            && (![v14 skinTone]
             || ([v14 isEqualIgnoringModifiers:getSkinToneSensitiveEmojis__fistEmoji] & 1) == 0))
          {
            uint64_t v15 = [v8 lastUsedVariantEmojiForEmoji:v14];

            BOOL v14 = (void *)v15;
          }
          if (v14)
          {
            id v16 = [v14 string];
            [v6 addObject:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    id v3 = v18;
  }

  return v6;
}

- (id)extractTokensForEmojiComputation:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] < 8)
  {
    id v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "subarrayWithRange:", objc_msgSend(v3, "count") - 7, 7);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)randomShuffle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "insertObject:atIndex:", *(void *)(*((void *)&v12 + 1) + 8 * i), arc4random_uniform(objc_msgSend(v4, "count", (void)v12) + 1));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return v10;
}

- (id)enumerateForEmojiCandidatesIn:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 asReplacementCandidate:(BOOL)a5 matchedString:(id *)a6
{
  BOOL v38 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  CFStringRef LocaleIdentifier = (const __CFString *)CEMEmojiLocaleDataGetLocaleIdentifier();
  v37 = self;
  if ([(TIEmojiCandidateGenerator *)self isLocaleDisabled:LocaleIdentifier])
  {
    id v12 = v10;
  }
  else
  {
    char v33 = a6;
    if ([v9 count])
    {
      long long v13 = 0;
      unint64_t v14 = 0;
      v35 = a4;
      id v36 = v9;
      CFStringRef v34 = LocaleIdentifier;
      while (![v10 count])
      {
        long long v15 = objc_msgSend(v9, "subarrayWithRange:", v14, objc_msgSend(v9, "count") - v14);
        id v16 = [v15 componentsJoinedByString:@" "];

        uint64_t v17 = [v9 count];
        if (LocaleIdentifier
          && v17 - v14 == 2
          && CFStringHasPrefix(LocaleIdentifier, @"en")
          && (![(__CFString *)v16 caseInsensitiveCompare:@"northern ireland"]
           || ![(__CFString *)v16 caseInsensitiveCompare:@"inner mongolia"]))
        {
          goto LABEL_31;
        }
        EmojiTokensForuint64_t String = (const void *)CEMEmojiLocaleDataCreateEmojiTokensForString();
        id v19 = [MEMORY[0x1E4F610A0] emojiTokensForCEMEmojiTokens:EmojiTokensForString];
        if ([v19 count])
        {
          uint64_t v39 = v10;
          long long v20 = [MEMORY[0x1E4F61098] sharedServiceWithMachName:0];
          long long v21 = [v20 preferences];

          long long v22 = (void *)[v21 copySortedEmojis:v19 keyword:v16 localeIdentifier:LocaleIdentifier];
          v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v22, "count"));
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v19 = v22;
          uint64_t v24 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v25; ++i)
              {
                if (*(void *)v41 != v26) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v28 = [*(id *)(*((void *)&v40 + 1) + 8 * i) string];
                [v23 addObject:v28];
              }
              uint64_t v25 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
            }
            while (v25);
          }

          uint64_t v29 = &stru_1F3F7A998;
          if (v38) {
            uint64_t v29 = v16;
          }
          uint64_t v30 = v29;
          uint64_t v10 = [(TIEmojiCandidateGenerator *)v37 skinToneModifiedAdornmentEmojis:v23 forLocale:v35 forInput:v30];

          id v9 = v36;
          CFStringRef LocaleIdentifier = v34;
        }
        if (EmojiTokensForString) {
          CFRelease(EmojiTokensForString);
        }
        ++v14;

        long long v13 = v16;
        if (v14 >= [v9 count]) {
          goto LABEL_28;
        }
      }
      id v16 = v13;
    }
    else
    {
      id v16 = 0;
    }
LABEL_28:
    uint64_t v31 = [v10 count];
    if (v33 && v31) {
      id *v33 = v16;
    }
LABEL_31:
    id v12 = v10;
  }

  return v12;
}

- (id)enumerateForEmojiCandidatesIn:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 asReplacementCandidate:(BOOL)a5
{
  return [(TIEmojiCandidateGenerator *)self enumerateForEmojiCandidatesIn:a3 forEmojiLocaleData:a4 asReplacementCandidate:a5 matchedString:0];
}

- (id)createAndAddEmojiTokensFrom:(__CFArray *)a3 inArray:(id)a4 forInputString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  for (CFIndex i = 0; i < CFArrayGetCount(a3); ++i)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4FAE318];
    CFArrayGetValueAtIndex(a3, i);
    uint64_t v11 = [v10 candidateWithCandidate:CEMEmojiTokenGetString() forInput:v8];
    [v7 addObject:v11];
  }

  return v7;
}

- (void)updateEmojiAdornmentGenerators
{
  if (!self->m_didAttemptPrimaryEmojiGeneratorLoad)
  {
    self->m_didAttemptPrimaryEmojiGeneratorLoad = 1;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    id v4 = (const void *)*MEMORY[0x1E4F79BC8];
    id v5 = [(TIEmojiCandidateGenerator *)self primaryInputMode];
    uint64_t v6 = [v5 locale];
    id v7 = (const void *)MEMORY[0x1E4E79AD0]();
    CFDictionaryAddValue(Mutable, v4, v7);

    self->m_emojiGeneratorPrimaryLanguage = (void *)NLEmojiPredictorCreate();
    CFRelease(Mutable);
  }
  if (!self->m_didAttemptSecondaryEmojiGeneratorLoad)
  {
    self->m_didAttemptSecondaryEmojiGeneratorLoad = 1;
    id v8 = [(TIEmojiCandidateGenerator *)self activeInputModes];
    if ((unint64_t)[v8 count] < 2)
    {
      if ([v8 count] == 1)
      {
        m_emojiGeneratorSecondaryLanguage = self->m_emojiGeneratorSecondaryLanguage;
        if (m_emojiGeneratorSecondaryLanguage)
        {
          CFRelease(m_emojiGeneratorSecondaryLanguage);
          self->m_emojiGeneratorSecondaryLanguage = 0;
        }
      }
    }
    else
    {
      id v9 = self->m_emojiGeneratorSecondaryLanguage;
      if (v9) {
        CFRelease(v9);
      }
      uint64_t v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      uint64_t v11 = (const void *)*MEMORY[0x1E4F79BC8];
      id v12 = [v8 objectAtIndexedSubscript:1];
      long long v13 = [v12 locale];
      unint64_t v14 = (const void *)MEMORY[0x1E4E79AD0]();
      CFDictionaryAddValue(v10, v11, v14);

      self->m_emojiGeneratorSecondaryLanguage = (void *)NLEmojiPredictorCreate();
      CFRelease(v10);
    }
  }
  if (!self->m_didAttemptTertiaryEmojiGeneratorLoad)
  {
    self->m_didAttemptTertiaryEmojiGeneratorLoad = 1;
    id v23 = [(TIEmojiCandidateGenerator *)self activeInputModes];
    if ([v23 count] == 3)
    {
      m_emojiGeneratorTertiaryLanguage = self->m_emojiGeneratorTertiaryLanguage;
      if (m_emojiGeneratorTertiaryLanguage) {
        CFRelease(m_emojiGeneratorTertiaryLanguage);
      }
      uint64_t v17 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      id v18 = (const void *)*MEMORY[0x1E4F79BC8];
      id v19 = [v23 objectAtIndexedSubscript:2];
      long long v20 = [v19 locale];
      long long v21 = (const void *)MEMORY[0x1E4E79AD0]();
      CFDictionaryAddValue(v17, v18, v21);

      self->m_emojiGeneratorTertiaryLanguage = (void *)NLEmojiPredictorCreate();
      CFRelease(v17);
    }
    else if ((unint64_t)[v23 count] <= 2)
    {
      long long v22 = self->m_emojiGeneratorTertiaryLanguage;
      if (v22)
      {
        CFRelease(v22);
        self->m_emojiGeneratorTertiaryLanguage = 0;
      }
    }
  }
}

- (void)updateEmojiLocale
{
  id v3 = [(TIEmojiCandidateGenerator *)self activeInputModes];
  uint64_t v17 = v3;
  if (!self->m_didAttemptPrimaryLocaleForEmojiLoad)
  {
    self->m_didAttemptPrimaryLocaleForEmojiLoad = 1;
    id v4 = [(TIEmojiCandidateGenerator *)self primaryInputMode];
    id v5 = [v4 locale];
    MEMORY[0x1E4E79AD0]();

    uint64_t v6 = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
    id v3 = v17;
    self->m_emojiDataForPrimaryLocale = v6;
  }
  if (!self->m_didAttemptSecondaryLocaleForEmojiLoad)
  {
    self->m_didAttemptSecondaryLocaleForEmojiLoad = 1;
    if ((unint64_t)[v3 count] < 2)
    {
      uint64_t v11 = [v17 count];
      id v3 = v17;
      if (v11 == 1)
      {
        m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
        if (m_emojiDataForSecondaryLocale)
        {
          CFRelease(m_emojiDataForSecondaryLocale);
          id v3 = v17;
          self->m_emojiDataForSecondaryLocale = 0;
        }
      }
    }
    else
    {
      id v7 = self->m_emojiDataForSecondaryLocale;
      if (v7) {
        CFRelease(v7);
      }
      id v8 = [v17 objectAtIndexedSubscript:1];
      id v9 = [v8 locale];
      MEMORY[0x1E4E79AD0]();

      uint64_t v10 = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
      id v3 = v17;
      self->m_emojiDataForSecondaryLocale = v10;
    }
  }
  if (!self->m_didAttemptTertiaryLocaleForEmojiLoad)
  {
    self->m_didAttemptTertiaryLocaleForEmojiLoad = 1;
    if ((unint64_t)[v3 count] < 3)
    {
      if ((unint64_t)[v17 count] <= 2)
      {
        m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
        if (m_emojiDataForTertiaryLocale)
        {
          CFRelease(m_emojiDataForTertiaryLocale);
          self->m_emojiDataForTertiaryLocale = 0;
        }
      }
    }
    else
    {
      long long v13 = self->m_emojiDataForTertiaryLocale;
      if (v13) {
        CFRelease(v13);
      }
      unint64_t v14 = [v17 objectAtIndexedSubscript:2];
      long long v15 = [v14 locale];
      MEMORY[0x1E4E79AD0]();

      self->m_emojiDataForTertiaryLocale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
    }
  }

  MEMORY[0x1F41817F8]();
}

- (TIInputMode)primaryInputMode
{
  v2 = [(TIEmojiCandidateGenerator *)self activeInputModes];
  id v3 = [v2 firstObject];

  return (TIInputMode *)v3;
}

- (void)dealloc
{
  m_emojiGeneratorPrimaryLanguage = self->m_emojiGeneratorPrimaryLanguage;
  if (m_emojiGeneratorPrimaryLanguage) {
    CFRelease(m_emojiGeneratorPrimaryLanguage);
  }
  m_emojiGeneratorSecondaryLanguage = self->m_emojiGeneratorSecondaryLanguage;
  if (m_emojiGeneratorSecondaryLanguage) {
    CFRelease(m_emojiGeneratorSecondaryLanguage);
  }
  m_emojiGeneratorTertiaryLanguage = self->m_emojiGeneratorTertiaryLanguage;
  if (m_emojiGeneratorTertiaryLanguage) {
    CFRelease(m_emojiGeneratorTertiaryLanguage);
  }
  m_emojiDataForPrimaryLocale = self->m_emojiDataForPrimaryLocale;
  if (m_emojiDataForPrimaryLocale) {
    CFRelease(m_emojiDataForPrimaryLocale);
  }
  m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
  if (m_emojiDataForSecondaryLocale) {
    CFRelease(m_emojiDataForSecondaryLocale);
  }
  m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
  if (m_emojiDataForTertiaryLocale) {
    CFRelease(m_emojiDataForTertiaryLocale);
  }
  v9.receiver = self;
  v9.super_class = (Class)TIEmojiCandidateGenerator;
  [(TIEmojiCandidateGenerator *)&v9 dealloc];
}

- (TIEmojiCandidateGenerator)initWithActiveInputModes:(id)a3 inputManager:(id)a4
{
  id v6 = a4;
  id v7 = [(TIEmojiCandidateGenerator *)self initWithActiveInputModes:a3];
  id v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->m_inputManager, v6);
  }

  return v8;
}

- (TIEmojiCandidateGenerator)initWithActiveInputModes:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIEmojiCandidateGenerator;
  id v6 = [(TIEmojiCandidateGenerator *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activeInputModes, a3);
    v7->m_shouldShowEmojis = 0;
    v7->m_emojiGeneratorSecondaryLanguage = 0;
    v7->m_emojiGeneratorTertiaryLanguage = 0;
    v7->m_emojiGeneratorPrimaryLanguage = 0;
    v7->m_emojiDataForSecondaryLocale = 0;
    v7->m_emojiDataForTertiaryLocale = 0;
    v7->m_emojiDataForPrimaryLocale = 0;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"gu", @"mr", @"te", @"ta", @"pa", @"bn", @"gu-Latn", @"mr-Latn", @"te-Latn", @"ta-Latn", @"pa-Latn", @"bn-Latn", 0);
    m_disabledLocales = v7->m_disabledLocales;
    v7->m_disabledLocales = (NSSet *)v8;
  }
  return v7;
}

@end