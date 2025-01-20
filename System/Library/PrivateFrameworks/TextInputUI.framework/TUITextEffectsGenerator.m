@interface TUITextEffectsGenerator
- (BOOL)_endsWithWhitespace:(id)a3;
- (BOOL)enabled;
- (NSLocale)locale;
- (TESLocaleData)localeData;
- (TUITextEffectsGenerator)initWithLocale:(id)a3;
- (id)_keyboardPrimaryLanguageLocale;
- (id)supportedTextEffectNames;
- (int64_t)candidateSourceType;
- (int64_t)generatedCandidateType;
- (void)_updateTESLocaleDataIfNeeded;
- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setLocaleData:(id)a3;
- (void)syncToKeyboardState:(id)a3;
@end

@implementation TUITextEffectsGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeData, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setLocaleData:(id)a3
{
}

- (TESLocaleData)localeData
{
  return self->_localeData;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (id)_keyboardPrimaryLanguageLocale
{
  v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  v3 = [v2 currentInputMode];

  v4 = [v3 primaryLanguage];
  v5 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v4];

  return v5;
}

- (void)_updateTESLocaleDataIfNeeded
{
  v3 = [(TUITextEffectsGenerator *)self _keyboardPrimaryLanguageLocale];
  p_locale = &self->_locale;
  if (self->_locale != v3)
  {
    v7 = v3;
    objc_storeStrong((id *)p_locale, v3);
    v5 = (TESLocaleData *)[objc_alloc(MEMORY[0x1E4F610C0]) initWithLocale:self->_locale];
    localeData = self->_localeData;
    self->_localeData = v5;

    v3 = v7;
  }
  MEMORY[0x1F41817F8](p_locale, v3);
}

- (void)syncToKeyboardState:(id)a3
{
  id v9 = a3;
  v4 = [v9 textInputTraits];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [v9 textInputTraits];
    uint64_t v7 = [v6 allowsTextAnimationsType];

    BOOL v8 = v7 == 2;
  }
  else
  {
    BOOL v8 = 0;
  }
  [(TUITextEffectsGenerator *)self setEnabled:v8];
  [(TUITextEffectsGenerator *)self _updateTESLocaleDataIfNeeded];
}

- (id)supportedTextEffectNames
{
  v2 = [MEMORY[0x1E4FB23C0] animationNamesForDomain:0];
  v3 = (void *)[v2 copy];

  return v3;
}

- (int64_t)generatedCandidateType
{
  return 3;
}

- (BOOL)_endsWithWhitespace:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    char v5 = objc_msgSend(v4, "longCharacterIsMember:", objc_msgSend(v3, "_lastLongCharacter"));
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)generateCandidatesForKeyboardState:(id)a3 completion:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [a3 documentState];
  BOOL v8 = [v7 contextBeforeInput];

  if (![v8 length] || -[TUITextEffectsGenerator _endsWithWhitespace:](self, "_endsWithWhitespace:", v8)) {
    goto LABEL_11;
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5808;
  v43 = __Block_byref_object_dispose__5809;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5808;
  v37 = __Block_byref_object_dispose__5809;
  id v38 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  id v9 = [(TUITextEffectsGenerator *)self localeData];
  uint64_t v10 = [v8 length];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __73__TUITextEffectsGenerator_generateCandidatesForKeyboardState_completion___block_invoke;
  v24 = &unk_1E5593D10;
  id v25 = v8;
  v26 = &v39;
  v27 = &v33;
  v28 = &v29;
  objc_msgSend(v9, "enumerateTextEffectCandidatesInString:searchRange:options:usingBlock:", v25, 0, v10, 6, &v21);

  uint64_t v11 = v40[5];
  if (!v11) {
    goto LABEL_7;
  }
  if (v34[5])
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FAE448], "candidateWithCandidate:forInput:forTextEffectName:", v11, v40[5], v21, v22, v23, v24);
    v13 = (void *)v12;
    if (*((unsigned char *)v30 + 24))
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4FAE2A0]) initWithAutocorrection:v12 alternateCorrections:0];
      v15 = (void *)MEMORY[0x1E4FAE278];
      v16 = v14;
      v17 = 0;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4FAE278];
      v45[0] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
      v15 = v19;
      v16 = 0;
      v17 = v14;
    }
    v20 = [v15 listWithCorrections:v16 predictions:v17 emojiList:0 inlineCompletions:0];

    v6[2](v6, v20);
    int v18 = 0;
  }
  else
  {
LABEL_7:
    int v18 = 1;
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  if (v18) {
LABEL_11:
  }
    v6[2](v6, 0);
}

void __73__TUITextEffectsGenerator_generateCandidatesForKeyboardState_completion___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v14 = a2;
  uint64_t v5 = [v14 matchRange];
  uint64_t v7 = v6
     + _isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext(v5, v6, *(void **)(a1 + 32));
  if (v7 + v5 == [*(id *)(a1 + 32) length])
  {
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, v7);
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F610C0], "animationNameForTextEffectType:", objc_msgSend(v14, "effectType"));
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v14 suggestionBehavior] == 2;
    *a3 = 1;
  }
}

- (int64_t)candidateSourceType
{
  return 3;
}

- (TUITextEffectsGenerator)initWithLocale:(id)a3
{
  v4 = (NSLocale *)a3;
  v11.receiver = self;
  v11.super_class = (Class)TUITextEffectsGenerator;
  uint64_t v5 = [(TUITextEffectsGenerator *)&v11 init];
  locale = v5->_locale;
  v5->_locale = v4;
  uint64_t v7 = v4;

  uint64_t v8 = [MEMORY[0x1E4F610C0] localeDataWithLocale:v5->_locale];
  localeData = v5->_localeData;
  v5->_localeData = (TESLocaleData *)v8;

  return v5;
}

@end