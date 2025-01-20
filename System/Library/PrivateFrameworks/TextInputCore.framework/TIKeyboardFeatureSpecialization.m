@interface TIKeyboardFeatureSpecialization
+ (USet)createAcceptableCharacterSetForKeyboardLocale:(id)a3;
+ (id)createSpecializationForInputMode:(id)a3;
+ (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6;
- (BOOL)acceptsCharacter:(unsigned int)a3;
- (BOOL)allowsAutocorrectionOfValidWords;
- (BOOL)canConvertExternalToExternal;
- (BOOL)canHandleKeyHitTest;
- (BOOL)deletesByComposedCharacterSequence;
- (BOOL)dictionaryUsesExternalEncoding;
- (BOOL)doesComposeText;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (BOOL)shouldClearInput:(id)a3;
- (BOOL)shouldConvertAutocorrectionCandidatesToFullWidth;
- (BOOL)shouldConvertCandidateToExternal;
- (BOOL)shouldConvertEagerly;
- (BOOL)shouldExtendPriorWord;
- (BOOL)shouldLearnLowercaseAtBeginningOfSentence;
- (BOOL)skipCandidateQualityFilter;
- (BOOL)supportsLearning;
- (BOOL)supportsReversionUI;
- (BOOL)useRelaxedOVSPolicy;
- (TIInputMode)inputMode;
- (TIKeyboardFeatureSpecialization)initWithInputMode:(id)a3;
- (USet)createAcceptableCharacterSet;
- (const)precomposedCharacterSet;
- (id)accentKeyStringForKeyboardState:(id)a3;
- (id)allAccentKeyStrings;
- (id)compositionMapForLayout:(id)a3 reverse:(BOOL)a4;
- (id)externalStringToInternal:(id)a3;
- (id)externalStringToInternal:(id)a3 byConvertingEagerly:(BOOL)a4;
- (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6;
- (id)getComposedStringFor:(id)a3 usingMap:(id)a4;
- (id)getComposedStringFor:(id)a3 usingMap:(id)a4 byConvertingEagerly:(BOOL)a5;
- (id)internalStringToExternal:(id)a3;
- (id)keyboardBehaviors;
- (id)layoutTags;
- (id)nonstopPunctuationCharacters;
- (id)replacementForDoubleSpace;
- (id)sentenceDelimitingCharacters;
- (id)sentencePrefixingCharacters;
- (id)sentenceTrailingCharacters;
- (id)spaceDeletingCharacters;
- (id)supplementalLexiconWordExtraCharacters;
- (id)terminatorsDeletingAutospace;
- (id)wordCharacters;
- (id)wordMedialPunctuationCharacters;
- (id)wordSeparator;
- (int64_t)currentUserInterfaceIdiom;
- (unint64_t)maxPriorWordTokensAfterTrimming;
- (void)createInputManager:(id)a3;
- (void)dealloc;
- (void)reloadPrecomposedCharacterSetWithIdiom:(int64_t)a3;
- (void)setCurrentUserInterfaceIdiom:(int64_t)a3;
- (void)setSkipCandidateQualityFilter:(BOOL)a3;
- (void)setUseRelaxedOVSPolicy:(BOOL)a3;
- (void)specializeInputManager:(void *)a3 forLayoutState:(id)a4;
@end

@implementation TIKeyboardFeatureSpecialization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->m_reverseCompositionMaps, 0);
  objc_storeStrong((id *)&self->m_compositionMaps, 0);

  objc_storeStrong((id *)&self->m_softwareLayout, 0);
}

- (void)setSkipCandidateQualityFilter:(BOOL)a3
{
  self->_skipCandidateQualityFilter = a3;
}

- (BOOL)skipCandidateQualityFilter
{
  return self->_skipCandidateQualityFilter;
}

- (void)setUseRelaxedOVSPolicy:(BOOL)a3
{
  self->_useRelaxedOVSPolicy = a3;
}

- (BOOL)useRelaxedOVSPolicy
{
  return self->_useRelaxedOVSPolicy;
}

- (int64_t)currentUserInterfaceIdiom
{
  return self->_currentUserInterfaceIdiom;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (BOOL)shouldConvertEagerly
{
  return 1;
}

- (id)replacementForDoubleSpace
{
  v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  v3 = [v2 replacementForDoubleSpace];
  v4 = v3;
  if (!v3) {
    v3 = @". ";
  }
  v5 = v3;

  return v5;
}

- (id)accentKeyStringForKeyboardState:(id)a3
{
  return 0;
}

- (id)layoutTags
{
  v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  v3 = [v2 layoutTags];

  return v3;
}

- (id)allAccentKeyStrings
{
  v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  v3 = [v2 allAccentKeyStrings];

  return v3;
}

- (id)wordSeparator
{
  return @" ";
}

- (BOOL)shouldLearnLowercaseAtBeginningOfSentence
{
  return 1;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 1;
}

- (BOOL)supportsLearning
{
  return 1;
}

- (BOOL)supportsReversionUI
{
  return 1;
}

- (BOOL)shouldExtendPriorWord
{
  return 1;
}

- (id)keyboardBehaviors
{
  return 0;
}

- (void)reloadPrecomposedCharacterSetWithIdiom:(int64_t)a3
{
  if (self->m_precomposedCharacterSet) {
    uset_close();
  }
  m_precomposedCharacterSet = (USet *)uset_openEmpty();
  self->m_precomposedCharacterSet = m_precomposedCharacterSet;
  if (a3 != -1)
  {
    v6 = [(TIKeyboardFeatureSpecialization *)self inputMode];
    v7 = [v6 normalizedIdentifier];
    v8 = TIKeyboardPopupVariantsForInputMode();

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__TIKeyboardFeatureSpecialization_reloadPrecomposedCharacterSetWithIdiom___block_invoke;
    v9[3] = &unk_1E6E2A698;
    v9[4] = self;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];

    m_precomposedCharacterSet = self->m_precomposedCharacterSet;
  }
  MEMORY[0x1E4E7CD50](m_precomposedCharacterSet);
}

uint64_t __74__TIKeyboardFeatureSpecialization_reloadPrecomposedCharacterSetWithIdiom___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__TIKeyboardFeatureSpecialization_reloadPrecomposedCharacterSetWithIdiom___block_invoke_2;
  v4[3] = &unk_1E6E2B4E8;
  v4[4] = *(void *)(a1 + 32);
  return [a3 enumerateObjectsUsingBlock:v4];
}

uint64_t __74__TIKeyboardFeatureSpecialization_reloadPrecomposedCharacterSetWithIdiom___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 _firstLongCharacter];
  if (result)
  {
    JUMPOUT(0x1E4E7CD00);
  }
  return result;
}

- (void)setCurrentUserInterfaceIdiom:(int64_t)a3
{
  if (self->_currentUserInterfaceIdiom != a3)
  {
    self->_currentUserInterfaceIdiom = a3;
    -[TIKeyboardFeatureSpecialization reloadPrecomposedCharacterSetWithIdiom:](self, "reloadPrecomposedCharacterSetWithIdiom:");
  }
}

- (void)dealloc
{
  if (self->m_acceptableCharacterSet) {
    uset_close();
  }
  if (self->m_precomposedCharacterSet) {
    uset_close();
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardFeatureSpecialization;
  [(TIKeyboardFeatureSpecialization *)&v3 dealloc];
}

- (TIKeyboardFeatureSpecialization)initWithInputMode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardFeatureSpecialization;
  v6 = [(TIKeyboardFeatureSpecialization *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inputMode, a3);
  }

  return v7;
}

+ (id)createSpecializationForInputMode:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "keyboardFeatureSpecializationClass")), "initWithInputMode:", v3);

  return v4;
}

- (BOOL)shouldConvertAutocorrectionCandidatesToFullWidth
{
  return 0;
}

- (BOOL)allowsAutocorrectionOfValidWords
{
  return 1;
}

- (BOOL)canConvertExternalToExternal
{
  return 1;
}

- (BOOL)shouldConvertCandidateToExternal
{
  return 1;
}

- (const)precomposedCharacterSet
{
  uint64_t result = self->m_precomposedCharacterSet;
  if (!result)
  {
    [(TIKeyboardFeatureSpecialization *)self reloadPrecomposedCharacterSetWithIdiom:[(TIKeyboardFeatureSpecialization *)self currentUserInterfaceIdiom]];
    return self->m_precomposedCharacterSet;
  }
  return result;
}

- (BOOL)canHandleKeyHitTest
{
  return 1;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return 1;
}

- (USet)createAcceptableCharacterSet
{
  v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  id v3 = [v2 locale];
  v4 = +[TIKeyboardFeatureSpecialization createAcceptableCharacterSetForKeyboardLocale:v3];

  return v4;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  if (!self->m_acceptableCharacterSet) {
    self->m_acceptableCharacterSet = [(TIKeyboardFeatureSpecialization *)self createAcceptableCharacterSet];
  }
  return MEMORY[0x1E4E7CD40]() != 0;
}

- (unint64_t)maxPriorWordTokensAfterTrimming
{
  return 1;
}

- (id)spaceDeletingCharacters
{
  v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  uint64_t v3 = [v2 spaceDeletingCharacters];
  v4 = (void *)v3;
  id v5 = &stru_1F3F7A998;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v6 = v5;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__TIKeyboardFeatureSpecialization_ZephyrSpecialization__spaceDeletingCharacters__block_invoke;
  block[3] = &unk_1E6E2DE00;
  v12 = v6;
  uint64_t v7 = -[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::onceToken;
  v8 = v6;
  if (v7 != -1) {
    dispatch_once(&-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::onceToken, block);
  }
  id v9 = (id)-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::result;

  return v9;
}

uint64_t __80__TIKeyboardFeatureSpecialization_ZephyrSpecialization__spaceDeletingCharacters__block_invoke(uint64_t a1)
{
  -[TIKeyboardFeatureSpecialization(ZephyrSpecialization) spaceDeletingCharacters]::uint64_t result = [objc_alloc(MEMORY[0x1E4FAE290]) initWithCharactersInString:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

- (id)terminatorsDeletingAutospace
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__TIKeyboardFeatureSpecialization_ZephyrSpecialization__terminatorsDeletingAutospace__block_invoke;
  block[3] = &unk_1E6E2DE00;
  void block[4] = self;
  if (-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::onceToken != -1) {
    dispatch_once(&-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::onceToken, block);
  }
  return (id)-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::result;
}

void __85__TIKeyboardFeatureSpecialization_ZephyrSpecialization__terminatorsDeletingAutospace__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FAE290]);
  id v6 = [*(id *)(a1 + 32) sentenceDelimitingCharacters];
  uint64_t v3 = [v6 stringByAppendingString:@",.:?!]}/-"]);;
  uint64_t v4 = [v2 initWithCharactersInString:v3];
  id v5 = (void *)-[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::result;
  -[TIKeyboardFeatureSpecialization(ZephyrSpecialization) terminatorsDeletingAutospace]::uint64_t result = v4;
}

- (id)supplementalLexiconWordExtraCharacters
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FAE3C8]) initWithCharactersInString:@"-"];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (id)wordCharacters
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FAE3C8]) initWithBaseCharacterSet:10];
  uint64_t v4 = [(TIKeyboardFeatureSpecialization *)self nonstopPunctuationCharacters];
  [v3 addCharactersInString:v4];

  return v3;
}

- (id)wordMedialPunctuationCharacters
{
  id v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  uint64_t v3 = [v2 wordMedialPunctuationCharacters];
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = @"'’";
  }
  id v5 = v3;

  return v5;
}

- (id)sentenceTrailingCharacters
{
  id v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  uint64_t v3 = [v2 sentenceTrailingCharacters];
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = @"'\"’”";
  }
  id v5 = v3;

  return v5;
}

- (id)sentenceDelimitingCharacters
{
  id v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  uint64_t v3 = [v2 sentenceDelimitingCharacters];
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = @".?!";
  }
  id v5 = v3;

  return v5;
}

- (id)sentencePrefixingCharacters
{
  id v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  uint64_t v3 = [v2 sentencePrefixingCharacters];
  uint64_t v4 = v3;
  if (!v3) {
    uint64_t v3 = CFSTR("¡¿'\"‘“(");
  }
  id v5 = v3;

  return v5;
}

- (id)nonstopPunctuationCharacters
{
  id v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  uint64_t v3 = [v2 nonstopPunctuationCharacters];
  uint64_t v4 = v3;
  if (!v3) {
  id v5 = v3;
  }

  return v5;
}

- (id)internalStringToExternal:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (KB *)a3;
  if ([(TIKeyboardFeatureSpecialization *)self doesComposeText])
  {
    id v5 = [(TIKeyboardFeatureSpecialization *)self compositionMapForLayout:self->m_softwareLayout reverse:0];
    if ([v5 count])
    {
      id v6 = [(TIKeyboardFeatureSpecialization *)self getComposedStringFor:v4 usingMap:v5];
    }
    else
    {
      KB::utf8_string(v4, (uint64_t)v9);
      KB::compose_diacritics((KB *)v9, [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet], (uint64_t)v11);
      KB::ns_string((KB *)v11, v7);
      id v6 = (KB *)objc_claimAutoreleasedReturnValue();
      if (v12 && v11[6] == 1) {
        free(v12);
      }
      if (v10 && v9[6] == 1) {
        free(v10);
      }
    }
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)externalStringToInternal:(id)a3 byConvertingEagerly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = (KB *)a3;
  if ([(TIKeyboardFeatureSpecialization *)self doesComposeText])
  {
    uint64_t v7 = [(TIKeyboardFeatureSpecialization *)self compositionMapForLayout:self->m_softwareLayout reverse:1];
    if ([v7 count])
    {
      v8 = [(TIKeyboardFeatureSpecialization *)self getComposedStringFor:v6 usingMap:v7 byConvertingEagerly:v4];
    }
    else
    {
      v29 = v7;
      v30 = v6;
      v35 = 0;
      v36 = 0;
      unint64_t v37 = 0;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v28 = self;
      id v9 = [(TIKeyboardFeatureSpecialization *)self allAccentKeyStrings];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        v12 = 0;
        uint64_t v13 = 0;
        unint64_t v14 = 0;
        uint64_t v15 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v32 != v15) {
              objc_enumerationMutation(v9);
            }
            int v17 = [*(id *)(*((void *)&v31 + 1) + 8 * i) _firstLongCharacter];
            int v18 = v17;
            if ((unint64_t)v12 >= v14)
            {
              uint64_t v19 = (v12 - v13) >> 2;
              unint64_t v20 = v19 + 1;
              if ((unint64_t)(v19 + 1) >> 62) {
                abort();
              }
              if ((uint64_t)(v14 - (void)v13) >> 1 > v20) {
                unint64_t v20 = (uint64_t)(v14 - (void)v13) >> 1;
              }
              if (v14 - (unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v21 = v20;
              }
              if (v21) {
                unint64_t v21 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v21);
              }
              else {
                uint64_t v22 = 0;
              }
              v23 = (char *)(v21 + 4 * v19);
              *(_DWORD *)v23 = v18;
              v24 = v23 + 4;
              while (v12 != v13)
              {
                int v25 = *((_DWORD *)v12 - 1);
                v12 -= 4;
                *((_DWORD *)v23 - 1) = v25;
                v23 -= 4;
              }
              unint64_t v14 = v21 + 4 * v22;
              v36 = v24;
              if (v13) {
                operator delete(v13);
              }
              uint64_t v13 = v23;
              v12 = v24;
            }
            else
            {
              *(_DWORD *)v12 = v17;
              v12 += 4;
            }
            v36 = v12;
          }
          unint64_t v37 = v14;
          v35 = v13;
          uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v43 count:16];
        }
        while (v11);
      }
      else
      {
        uint64_t v13 = 0;
      }

      id v6 = v30;
      KB::utf8_string(v30, (uint64_t)v38);
      KB::decompose_diacritics(v38, (unsigned int **)&v35, (uint64_t)[(TIKeyboardFeatureSpecialization *)v28 precomposedCharacterSet], (uint64_t)v41);
      KB::ns_string((KB *)v41, v26);
      v8 = (KB *)objc_claimAutoreleasedReturnValue();
      if (v42 && v41[6] == 1) {
        free(v42);
      }
      uint64_t v7 = v29;
      if (v40 && v39 == 1) {
        free(v40);
      }
      if (v13)
      {
        v36 = v13;
        operator delete(v13);
      }
    }
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardFeatureSpecialization *)self externalStringToInternal:v4 byConvertingEagerly:[(TIKeyboardFeatureSpecialization *)self shouldConvertEagerly]];

  return v5;
}

- (BOOL)shouldClearInput:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TIKeyboardFeatureSpecialization *)self compositionMapForLayout:self->m_softwareLayout reverse:0];
  uint64_t v6 = [v5 count];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    unint64_t v11 = 20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v11 <= objc_msgSend(v13, "length", (void)v16)) {
          unint64_t v11 = [v13 length];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    unint64_t v11 = 20;
  }

  if (v6)
  {
    if ([v4 length] <= v11)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      unint64_t v14 = [(TIKeyboardFeatureSpecialization *)self getComposedStringFor:v4 usingMap:v7 byConvertingEagerly:0];
      if ([v14 length])
      {
        LODWORD(v6) = objc_msgSend(v14, "characterAtIndex:", objc_msgSend(v14, "length") - 1);
        LOBYTE(v6) = v6 != objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1);
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
  }

  return v6;
}

- (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  unint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v21 = v9;
  v12 = [(id)objc_opt_class() findPrefixMatchesFor:v9 fromIndex:a4 usingCompositionMap:v10 matchesInputAsPrefix:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = [v10 objectForKeyedSubscript:v17];
        long long v19 = +[TICompositionMapItem itemWithKey:v17 value:v18];

        [v11 addObject:v19];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  return v11;
}

- (id)getComposedStringFor:(id)a3 usingMap:(id)a4 byConvertingEagerly:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (![v7 length] || !objc_msgSend(v8, "count"))
  {
    id v9 = v7;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v7, "length"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (![v7 length]) {
    goto LABEL_12;
  }
  unint64_t v10 = 0;
  BOOL v11 = !v5;
  while (1)
  {
    v12 = [(TIKeyboardFeatureSpecialization *)self findPrefixMatchesFor:v7 fromIndex:v10 usingCompositionMap:v8 matchesInputAsPrefix:v11];
    if (![v12 count])
    {
      objc_msgSend(v9, "appendFormat:", @"%C", objc_msgSend(v7, "characterAtIndex:", v10));
      uint64_t v17 = 1;
      goto LABEL_9;
    }
    uint64_t v13 = [v12 firstObject];
    uint64_t v14 = [v13 key];
    unint64_t v15 = [v14 length];
    if (v15 > [v7 length] - v10) {
      break;
    }
    long long v16 = [v13 value];
    [v9 appendString:v16];
    uint64_t v17 = [v14 length];

LABEL_9:
    v10 += v17;

    if (v10 >= [v7 length]) {
      goto LABEL_12;
    }
  }
  long long v19 = [v7 substringFromIndex:v10];
  [v9 appendString:v19];

LABEL_12:

  return v9;
}

- (id)getComposedStringFor:(id)a3 usingMap:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIKeyboardFeatureSpecialization *)self getComposedStringFor:v7 usingMap:v6 byConvertingEagerly:[(TIKeyboardFeatureSpecialization *)self shouldConvertEagerly]];

  return v8;
}

- (id)compositionMapForLayout:(id)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v7 = 32;
    if (v4) {
      uint64_t v7 = 40;
    }
    id v8 = (id *)((char *)&self->super.isa + v7);
    id v9 = *(id *)((char *)&self->super.isa + v7);
    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_storeStrong(v8, v9);
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__TIKeyboardFeatureSpecialization_ZephyrSpecialization__compositionMapForLayout_reverse___block_invoke;
    aBlock[3] = &unk_1E6E2A6C0;
    BOOL v18 = v4;
    id v16 = v9;
    uint64_t v17 = self;
    id v10 = v9;
    BOOL v11 = (void (**)(void *, id))_Block_copy(aBlock);
    v12 = v11[2](v11, v6);
    if (![v12 count])
    {
      uint64_t v13 = v11[2](v11, @"AnyLayout");

      v12 = (void *)v13;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __89__TIKeyboardFeatureSpecialization_ZephyrSpecialization__compositionMapForLayout_reverse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  if (![v4 count])
  {
    int v5 = *(unsigned __int8 *)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) inputMode];
    uint64_t v7 = v6;
    if (v5) {
      [v6 reverseCompositionMap];
    }
    else {
    id v8 = [v6 compositionMap];
    }
    uint64_t v9 = [v8 objectForKeyedSubscript:v3];

    BOOL v4 = (void *)v9;
  }
  if (![v4 count])
  {
    int v10 = *(unsigned __int8 *)(a1 + 48);
    BOOL v11 = [*(id *)(a1 + 40) inputMode];
    v12 = v11;
    if (v10) {
      [v11 compositionMap];
    }
    else {
    uint64_t v13 = [v11 reverseCompositionMap];
    }
    uint64_t v14 = [v13 objectForKeyedSubscript:v3];

    if ([v14 count])
    {
      unint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v25 = v14;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            long long v22 = [v16 objectForKeyedSubscript:v21];
            [v15 setObject:v21 forKeyedSubscript:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v18);
      }

      id v23 = v15;
      [*(id *)(a1 + 32) setObject:v23 forKeyedSubscript:v3];

      BOOL v4 = v23;
      uint64_t v14 = v25;
    }
  }

  return v4;
}

- (BOOL)deletesByComposedCharacterSequence
{
  id v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  char v3 = [v2 deletesByComposedCharacterSequence];

  return v3;
}

- (BOOL)doesComposeText
{
  id v2 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  char v3 = [v2 doesComposeText];

  return v3;
}

- (void)specializeInputManager:(void *)a3 forLayoutState:(id)a4
{
  objc_msgSend(a4, "softwareLayout", a3);
  self->m_softwareLayout = (NSString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1F41817F8]();
}

- (void)createInputManager:(id)a3
{
  id v3 = a3;
  operator new();
}

+ (USet)createAcceptableCharacterSetForKeyboardLocale:(id)a3
{
  id v3 = [a3 localeIdentifier];
  [v3 UTF8String];
  uint64_t v4 = ulocdata_open();

  uint64_t ExemplarSet = ulocdata_getExemplarSet();
  uint64_t v6 = ulocdata_getExemplarSet();
  uint64_t v7 = (USet *)uset_openEmpty();
  MEMORY[0x1E4E7CD20](v7, 48, 57);
  MEMORY[0x1E4E7CD00](v7, 39);
  MEMORY[0x1E4E7CD00](v7, 38);
  MEMORY[0x1E4E7CD00](v7, 8217);
  if (ExemplarSet)
  {
    MEMORY[0x1E4E7CD10](v7, ExemplarSet);
    uset_close();
  }
  if (v6)
  {
    MEMORY[0x1E4E7CD10](v7, v6);
    uset_close();
  }
  if (v4) {
    ulocdata_close();
  }
  return v7;
}

+ (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  if ([v9 length] && objc_msgSend(v9, "length") > a4)
  {
    BOOL v11 = [v9 substringFromIndex:a4];
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v11, "hasPrefix:", v18, (void)v21) & 1) != 0
            || v6 && [v18 hasPrefix:v11])
          {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    uint64_t v19 = [v12 sortedArrayUsingComparator:&__block_literal_global_3942];
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

uint64_t __129__TIKeyboardFeatureSpecialization_ZephyrSpecialization__findPrefixMatchesFor_fromIndex_usingCompositionMap_matchesInputAsPrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v5 length];
  if (v6 >= [v4 length])
  {
    unint64_t v8 = [v5 length];
    uint64_t v7 = v8 > [v4 length];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

@end