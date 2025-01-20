@interface TIKeyboardInputManager_mul
- (BOOL)choseSecondary;
- (BOOL)containsActiveLanguage:(id)a3 language:(id)a4;
- (BOOL)emphasizesAlternativeInput;
- (BOOL)forceAutomaticMultiLanguageSwitch;
- (BOOL)isFreezingInputMethodChoice;
- (BOOL)isHighMemoryManager;
- (BOOL)isUsingMultilingual;
- (BOOL)shouldDynamicallySwitchBetweenPrimaryAndSecondary;
- (BOOL)shouldFreezeInputMethodChoiceForPopupVariants;
- (BOOL)shouldPassAlternativeInputAsPrediction:(id)a3 isRecognized:(BOOL)a4;
- (BOOL)shouldUpdateDictionary;
- (BOOL)stringIsRecognizedByAlternativeIM:(id)a3;
- (BOOL)updateLanguageModelForKeyboardState;
- (BOOL)usesRetrocorrection;
- (BOOL)validEnglishTransformerMultilingualConfig;
- (TIKeyboardInputManager_mul)initWithConfig:(id)a3 keyboardState:(id)a4;
- (float)weightForInputMode:(id)a3;
- (id)candidateArray:(id)a3 withCandidateUniquelyInsertedToFront:(id)a4;
- (id)externalStringToInternal:(id)a3;
- (id)getBetterLexiconLocale:(BOOL *)a3;
- (id)getCurrentExternalStringGiven:(BOOL)a3;
- (id)getPlainCandidate;
- (id)handleKeyboardInput:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)keyLayoutMap;
- (id)keyLayoutMapAsNearbyKeys;
- (id)keyboardConfiguration;
- (id)lexiconLocaleOfString:(id)a3 inputMode:(id)a4;
- (id)listOfModelLocalesFromActiveInputModes;
- (id)modelLoaderForModelLocaleMapping:(id)a3 customResourcePaths:(id)a4 dynamicResourcePath:(id)a5 usesLinguisticContext:(BOOL)a6 isMultiLingualModeEnabled:(BOOL)a7 validEnglishTransformerMultilingualConfig:(BOOL)a8;
- (id)modelLocaleToInputModeMapping;
- (id)resourceInputModes;
- (int64_t)indexOfLastDynamicSwitch;
- (unsigned)externalIndexToInternal:(unsigned int)a3;
- (unsigned)internalIndexToExternal:(unsigned int)a3;
- (unsigned)lexiconIDForInputMode:(id)a3;
- (vector<KB::LexiconInfo,)lexiconInformationVector;
- (void)chooseBetterInputMethod;
- (void)clearInput;
- (void)didUpdateInputModeProbabilities:(id)a3;
- (void)didUpdateInputModes:(id)a3;
- (void)enumerateInputModesWithBlock:(id)a3;
- (void)handleAlternativeInput:(id)a3 givenCandidate:(id)a4;
- (void)keyLayoutDidChangeTo:(id)a3;
- (void)languageModelContainer;
- (void)loadDictionaries;
- (void)resume;
- (void)setChoseSecondary:(BOOL)a3;
- (void)setIndexOfLastDynamicSwitch:(int64_t)a3;
- (void)setIsFreezingInputMethodChoice:(BOOL)a3;
- (void)suspend;
- (void)updateAutocorrectionListGivenOutdatedInput:(id)a3 andUpdatedInput:(id)a4;
- (void)updateLanguagePriors;
@end

@implementation TIKeyboardInputManager_mul

- (void)setIndexOfLastDynamicSwitch:(int64_t)a3
{
  self->_indexOfLastDynamicSwitch = a3;
}

- (int64_t)indexOfLastDynamicSwitch
{
  return self->_indexOfLastDynamicSwitch;
}

- (void)setIsFreezingInputMethodChoice:(BOOL)a3
{
  self->_isFreezingInputMethodChoice = a3;
}

- (BOOL)isFreezingInputMethodChoice
{
  return self->_isFreezingInputMethodChoice;
}

- (void)setChoseSecondary:(BOOL)a3
{
  self->_choseSecondary = a3;
}

- (BOOL)choseSecondary
{
  return self->_choseSecondary;
}

- (id)resourceInputModes
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__TIKeyboardInputManager_mul_resourceInputModes__block_invoke;
  v6[3] = &unk_1E6E29E00;
  id v4 = v3;
  id v7 = v4;
  [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v6];

  return v4;
}

- (void)updateLanguagePriors
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(TIKeyboardInputManager *)self usesFavonius]
    && ![(TIKeyboardInputManager *)self isLinguisticResourceUpdateScheduled])
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel)
    {
      v3 = TIOSLogFacility();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s Updating input mode probabilities.", "-[TIKeyboardInputManager_mul updateLanguagePriors]");
        *(_DWORD *)buf = 138412290;
        v9 = v6;
        _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    id v4 = [(TIKeyboardInputManager_mul *)self languageModelContainer];
    if (v4)
    {
      uint64_t v5 = *(void *)(*((void *)self->super.m_impl + 28) + 8);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __50__TIKeyboardInputManager_mul_updateLanguagePriors__block_invoke;
      v7[3] = &unk_1E6E29FD8;
      v7[4] = self;
      v7[5] = v5;
      v7[6] = v4;
      [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v7];
    }
  }
}

- (void)didUpdateInputModeProbabilities:(id)a3
{
  if (!self->_isSuspended) {
    [(TIKeyboardInputManager_mul *)self updateLanguagePriors];
  }
}

- (void)didUpdateInputModes:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_mul;
  [(TIKeyboardInputManager *)&v6 didUpdateInputModes:a3];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel)
  {
    id v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s Scheduling active input mode update.", "-[TIKeyboardInputManager_mul didUpdateInputModes:]");
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  [(TIKeyboardInputManager *)self scheduleLinguisticResourceUpdateWithReason:@"Multilingual input modes changed"];
}

- (void)loadDictionaries
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->super.m_impl)
  {
    if ([(TIKeyboardInputManager *)self usesFavonius])
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        v3 = TIOSLogFacility();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        {
          v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading/reloading multilingual dictionaries.", "-[TIKeyboardInputManager_mul loadDictionaries]");
          LODWORD(v19[0]) = 138412290;
          *(void *)((char *)v19 + 4) = v16;
          _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)v19, 0xCu);
        }
      }
      m_impl = (TIInputManager *)self->super.m_impl;
      uint64_t v5 = [(TIKeyboardInputManager *)self primaryInputMode];
      objc_super v6 = [v5 languageWithRegion];
      KB::utf8_string(v6, (uint64_t)v19);
      TIInputManager::set_locale_identifier(m_impl, (const KB::String *)v19);
      if (*((void *)&v19[0] + 1) && BYTE6(v19[0]) == 1) {
        free(*((void **)&v19[0] + 1));
      }

      [(TIKeyboardInputManager_mul *)self lexiconInformationVector];
      id v7 = [(TIKeyboardInputManager *)self config];
      [v7 isTesting];

      v8 = [(TIKeyboardInputManager *)self languageSelectionController];
      uint64_t v9 = [v8 activeInputModes];
      unint64_t v10 = [v9 count];

      if (v10 >= 2)
      {
        v11 = [(TIKeyboardInputManager *)self languageSelectionController];
        v12 = [v11 activeInputModes];
        v13 = [v12 objectAtIndexedSubscript:1];

        v14 = +[TIKeyboardInputManagerConfig configurationForInputMode:v13];
        [v14 usesContinuousPath];
      }
      v15 = self->super.m_impl;
      memset(&v18, 0, 24);
      std::vector<KB::LexiconInfo>::__init_with_size[abi:nn180100]<KB::LexiconInfo*,KB::LexiconInfo*>(&v18, *(uint64_t *)&v19[0], *((uint64_t *)&v19[0] + 1), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)&v19[0] + 1) - *(void *)&v19[0]) >> 4));
      TIInputManager::load_dictionaries((uint64_t)v15, &v18);
    }
    v17.receiver = self;
    v17.super_class = (Class)TIKeyboardInputManager_mul;
    [(TIKeyboardInputManager *)&v17 loadDictionaries];
  }
}

- (BOOL)shouldUpdateDictionary
{
  if (!self->super.m_impl) {
    return 0;
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  unsigned __int8 v13 = 0;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_mul;
  unsigned __int8 v13 = [(TIKeyboardInputManager *)&v9 shouldUpdateDictionary];
  BOOL v3 = [(TIKeyboardInputManager *)self usesFavonius];
  id v4 = v11;
  if (v3 && !*((unsigned char *)v11 + 24))
  {
    uint64_t v5 = *(void *)(*((void *)self->super.m_impl + 28) + 8);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__TIKeyboardInputManager_mul_shouldUpdateDictionary__block_invoke;
    v8[3] = &unk_1E6E29FB0;
    v8[4] = self;
    v8[5] = &v10;
    v8[6] = v5;
    [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v8];
    id v4 = v11;
  }
  BOOL v6 = *((unsigned char *)v4 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)containsActiveLanguage:(id)a3 language:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) locale];
        unsigned __int8 v13 = [v12 languageCode];
        v9 |= [v13 hasPrefix:v6];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (BOOL)updateLanguageModelForKeyboardState
{
  v147[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TIKeyboardInputManager *)self config];
  [v3 usesWordNgramModel];

  id v4 = [(TIKeyboardInputManager *)self config];
  if ([v4 usesAdaptation])
  {
    uint64_t v5 = [(TIKeyboardInputManager *)self dynamicResourcePath];
  }
  else
  {
    uint64_t v5 = 0;
  }

  id v6 = [(TIKeyboardInputManager *)self config];
  if ([v6 usesCustomNgramModel])
  {
    uint64_t v7 = [(TIKeyboardInputManager *)self config];
    uint64_t v8 = [v7 ngramModelPath];
    v147[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:1];
  }
  else
  {
    uint64_t v9 = 0;
  }

  uint64_t v10 = [(TIKeyboardInputManager *)self languageSelectionController];
  v95 = v10;
  if (v10)
  {
    v11 = [v10 activeInputModes];
    [v11 count];
  }
  [(TIKeyboardInputManager_mul *)self validEnglishTransformerMultilingualConfig];
  uint64_t v12 = [(TIKeyboardInputManager_mul *)self listOfModelLocalesFromActiveInputModes];
  v103 = [(TIKeyboardInputManager_mul *)self modelLocaleToInputModeMapping];
  v96 = (void *)v9;
  v97 = (void *)v5;
  v102 = -[TIKeyboardInputManager_mul modelLoaderForModelLocaleMapping:customResourcePaths:dynamicResourcePath:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:](self, "modelLoaderForModelLocaleMapping:customResourcePaths:dynamicResourcePath:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:");
  unsigned __int8 v13 = [(TIKeyboardInputManager *)self keyboardState];
  v101 = [v13 clientIdentifier];

  v104 = self;
  v14 = [(TIKeyboardInputManager *)self keyboardState];
  v100 = [v14 recipientIdentifier];

  int64x2_t v139 = 0uLL;
  v140 = 0;
  v131 = 0;
  v132 = (void ***)&v131;
  uint64_t v133 = 0x5812000000;
  v134 = __Block_byref_object_copy__54;
  memset(v136, 0, sizeof(v136));
  v135 = __Block_byref_object_dispose__55;
  uint64_t v137 = 0;
  int v138 = 1065353216;
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  obuint64_t j = v12;
  uint64_t v105 = [obj countByEnumeratingWithState:&v127 objects:v146 count:16];
  if (v105)
  {
    uint64_t v99 = *(void *)v128;
    do
    {
      for (uint64_t i = 0; i != v105; ++i)
      {
        if (*(void *)v128 != v99) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v127 + 1) + 8 * i);
        long long v17 = [v102 objectForKeyedSubscript:v16];
        long long v18 = [v103 objectForKeyedSubscript:v16];
        v19 = objc_opt_new();
        long long v123 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        id v20 = v18;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v123 objects:v145 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v124;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v124 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = [*(id *)(*((void *)&v123 + 1) + 8 * j) locale];
              [v19 addObject:v25];
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v123 objects:v145 count:16];
          }
          while (v22);
        }

        v118[0] = 0;
        v118[1] = v118;
        uint64_t v119 = 0x3032000000;
        v120 = __Block_byref_object_copy__2588;
        v121 = __Block_byref_object_dispose__2589;
        v26 = v104;
        v122 = v26;
        v27 = [(TIKeyboardInputManager *)v26 keyboardState];
        v28 = [v27 clientIdentifier];
        v29 = [(TIKeyboardInputManager *)v26 keyboardState];
        v30 = [v29 recipientIdentifier];
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __65__TIKeyboardInputManager_mul_updateLanguageModelForKeyboardState__block_invoke;
        v114[3] = &unk_1E6E2BE88;
        id v115 = v101;
        v117 = v118;
        id v116 = v100;
        if (v17)
        {
          [v17 sharedLanguageModelForClient:v28 withRecipient:v30 forLanguageLocales:v19 completion:v114];
          long long v106 = *(_OWORD *)buf;
        }
        else
        {
          long long v106 = 0u;
        }
        *(void *)&buf[8] = 0;
        *(void *)buf = 0;

        std::string::basic_string[abi:nn180100]<0>(__p, (char *)[v16 UTF8String]);
        if (*((void *)&v106 + 1))
        {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v106 + 1) + 8), 1uLL, memory_order_relaxed);
          long long v143 = 0u;
          memset(buf, 0, sizeof(buf));
          int v144 = 1065353216;
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v106 + 1) + 8), 1uLL, memory_order_relaxed);
          v31 = *(std::__shared_weak_count **)&buf[8];
          *(_OWORD *)buf = v106;
          if (v31) {
            std::__shared_weak_count::__release_shared[abi:nn180100](v31);
          }
        }
        else
        {
          long long v143 = 0u;
          memset(buf, 0, sizeof(buf));
          int v144 = 1065353216;
          *(void *)buf = v106;
        }
        v32 = std::__hash_table<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)v132 + 6, (uint64_t)__p, (uint64_t)__p);
        long long v33 = *(_OWORD *)buf;
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        v34 = (std::__shared_weak_count *)*((void *)v32 + 6);
        *(_OWORD *)(v32 + 40) = v33;
        if (v34) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v34);
        }
        if (*((void *)v32 + 10))
        {
          v35 = (void *)*((void *)v32 + 9);
          if (v35)
          {
            do
            {
              v36 = (void *)*v35;
              operator delete(v35);
              v35 = v36;
            }
            while (v36);
          }
          *((void *)v32 + 9) = 0;
          uint64_t v37 = *((void *)v32 + 8);
          if (v37)
          {
            for (uint64_t k = 0; k != v37; ++k)
              *(void *)(*((void *)v32 + 7) + 8 * k) = 0;
          }
          *((void *)v32 + 10) = 0;
        }
        uint64_t v39 = *(void *)&buf[16];
        *(void *)&buf[16] = 0;
        v40 = (void *)*((void *)v32 + 7);
        *((void *)v32 + 7) = v39;
        if (v40) {
          operator delete(v40);
        }
        unint64_t v41 = *(void *)&buf[24];
        uint64_t v42 = v143;
        *((void *)v32 + 9) = v143;
        *((void *)v32 + 8) = v41;
        *(void *)&buf[24] = 0;
        uint64_t v43 = *((void *)&v143 + 1);
        *((void *)v32 + 10) = *((void *)&v143 + 1);
        *((_DWORD *)v32 + 22) = v144;
        if (v43)
        {
          unint64_t v44 = *(void *)(v42 + 8);
          if ((v41 & (v41 - 1)) != 0)
          {
            if (v44 >= v41) {
              v44 %= v41;
            }
          }
          else
          {
            v44 &= v41 - 1;
          }
          *(void *)(*((void *)v32 + 7) + 8 * v44) = v32 + 72;
          long long v143 = 0uLL;
        }
        std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&buf[16]);
        if (*(void *)&buf[8]) {
          std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
        }
        if (*((void *)&v106 + 1))
        {
          std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v106 + 1));
          uint64_t v45 = v139.i64[1];
          v46 = v140;
          if (v139.i64[1] < (unint64_t)v140)
          {
            *(_OWORD *)v139.i64[1] = v106;
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v106 + 1) + 8), 1uLL, memory_order_relaxed);
LABEL_52:
            v47 = (_OWORD *)(v45 + 16);
            goto LABEL_67;
          }
        }
        else
        {
          uint64_t v45 = v139.i64[1];
          v46 = v140;
          if (v139.i64[1] < (unint64_t)v140)
          {
            *(_OWORD *)v139.i64[1] = v106;
            goto LABEL_52;
          }
        }
        uint64_t v48 = (v45 - v139.i64[0]) >> 4;
        unint64_t v49 = v48 + 1;
        if ((unint64_t)(v48 + 1) >> 60) {
LABEL_129:
        }
          abort();
        uint64_t v50 = (uint64_t)&v46[-v139.i64[0]];
        if (v50 >> 3 > v49) {
          unint64_t v49 = v50 >> 3;
        }
        if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v51 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v51 = v49;
        }
        *(void *)&long long v143 = &v140;
        v52 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::shared_ptr<KB::LanguageModel>>>(v51);
        v54 = &v52[16 * v48];
        *(_OWORD *)v54 = v106;
        if (*((void *)&v106 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v106 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        v55 = (void *)v139.i64[1];
        v56 = (void *)v139.i64[0];
        if (v139.i64[1] == v139.i64[0])
        {
          int64x2_t v59 = vdupq_n_s64(v139.u64[1]);
          v57 = &v52[16 * v48];
        }
        else
        {
          v57 = &v52[16 * v48];
          do
          {
            long long v58 = *((_OWORD *)v55 - 1);
            v55 -= 2;
            *((_OWORD *)v57 - 1) = v58;
            v57 -= 16;
            void *v55 = 0;
            v55[1] = 0;
          }
          while (v55 != v56);
          int64x2_t v59 = v139;
        }
        v47 = v54 + 16;
        v139.i64[0] = (uint64_t)v57;
        v139.i64[1] = (uint64_t)(v54 + 16);
        *(int64x2_t *)&buf[8] = v59;
        v60 = v140;
        v140 = &v52[16 * v53];
        *(void *)&buf[24] = v60;
        *(void *)buf = v59.i64[0];
        std::__split_buffer<std::shared_ptr<KB::LanguageModel>>::~__split_buffer((uint64_t)buf);
LABEL_67:
        v139.i64[1] = (uint64_t)v47;
        if (v113 < 0) {
          operator delete(__p[0]);
        }

        if (*((void *)&v106 + 1)) {
          std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v106 + 1));
        }
        _Block_object_dispose(v118, 8);
      }
      uint64_t v105 = [obj countByEnumeratingWithState:&v127 objects:v146 count:16];
    }
    while (v105);
  }

  uint64_t v61 = [(TIKeyboardInputManager_mul *)v104 languageModelContainer];
  if (!v61) {
    goto LABEL_82;
  }
  KB::LanguageModelContainer::language_models(v61, (char **)buf);
  v62 = (void *)v139.i64[0];
  v63 = *(void **)buf;
  if (v139.i64[1] - v139.i64[0] != *(void *)&buf[8] - *(void *)buf)
  {
    v118[0] = buf;
LABEL_81:
    std::vector<std::shared_ptr<KB::LanguageModel>>::__destroy_vector::operator()[abi:nn180100]((void ***)v118);
LABEL_82:
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      v64 = TIOSLogFacility();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        v94 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading/reloading multilingual language models.", "-[TIKeyboardInputManager_mul updateLanguageModelForKeyboardState]", v95);
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v94;
        _os_log_debug_impl(&dword_1E3F0E000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    memset(buf, 0, 24);
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __65__TIKeyboardInputManager_mul_updateLanguageModelForKeyboardState__block_invoke_60;
    v111[3] = &unk_1E6E29F88;
    v111[4] = v104;
    v111[5] = &v131;
    [(TIKeyboardInputManager_mul *)v104 enumerateInputModesWithBlock:v111];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v65 = obj;
    uint64_t v66 = [v65 countByEnumeratingWithState:&v107 objects:v141 count:16];
    if (!v66)
    {
LABEL_128:

      operator new();
    }
    uint64_t v67 = v66;
    v68 = 0;
    uint64_t v69 = *(void *)v108;
LABEL_90:
    uint64_t v70 = 0;
    while (1)
    {
      if (*(void *)v108 != v69) {
        objc_enumerationMutation(v65);
      }
      std::string::basic_string[abi:nn180100]<0>(v118, (char *)[*(id *)(*((void *)&v107 + 1) + 8 * v70) UTF8String]);
      v71 = std::__hash_table<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)v132 + 6, (uint64_t)v118, (uint64_t)v118);
      v72 = v71;
      if ((unint64_t)v68 < *(void *)&buf[16])
      {
        void *v68 = *((void *)v71 + 5);
        uint64_t v73 = *((void *)v71 + 6);
        v68[1] = v73;
        if (v73) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v73 + 8), 1uLL, memory_order_relaxed);
        }
        std::unordered_map<unsigned int,float>::unordered_map((uint64_t)(v68 + 2), (uint64_t)(v71 + 56));
        v68 += 7;
        goto LABEL_124;
      }
      uint64_t v74 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v68 - *(void *)buf) >> 3);
      unint64_t v75 = v74 + 1;
      if ((unint64_t)(v74 + 1) > 0x492492492492492) {
        goto LABEL_129;
      }
      if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 3) > v75) {
        unint64_t v75 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 3);
      }
      if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 3)) >= 0x249249249249249) {
        unint64_t v76 = 0x492492492492492;
      }
      else {
        unint64_t v76 = v75;
      }
      if (v76) {
        unint64_t v76 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LanguageModelLexiconGroup>>(v76);
      }
      else {
        uint64_t v77 = 0;
      }
      v78 = (void *)(v76 + 56 * v74);
      void *v78 = *((void *)v72 + 5);
      uint64_t v79 = *((void *)v72 + 6);
      v78[1] = v79;
      if (v79) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v79 + 8), 1uLL, memory_order_relaxed);
      }
      unint64_t v80 = v76 + 56 * v77;
      std::unordered_map<unsigned int,float>::unordered_map(v76 + 56 * v74 + 16, (uint64_t)(v72 + 56));
      v68 = v78 + 7;
      v81 = *(char **)&buf[8];
      v82 = *(char **)buf;
      if (*(void *)&buf[8] == *(void *)buf) {
        break;
      }
      unint64_t v83 = 0;
      do
      {
        v84 = &v78[v83 / 8];
        v85 = &v81[v83];
        *(_OWORD *)(v84 - 7) = *(_OWORD *)&v81[v83 - 56];
        *((void *)v85 - 7) = 0;
        *((void *)v85 - 6) = 0;
        uint64_t v86 = *(void *)&v81[v83 - 40];
        *((void *)v85 - 5) = 0;
        *(v84 - 5) = v86;
        *(v84 - 4) = *(void *)&v81[v83 - 32];
        *((void *)v85 - 4) = 0;
        uint64_t v87 = *(void *)&v81[v83 - 24];
        v78[v83 / 8 - 3] = v87;
        uint64_t v88 = *(void *)&v81[v83 - 16];
        *(v84 - 2) = v88;
        *((_DWORD *)v84 - 2) = *(_DWORD *)&v81[v83 - 8];
        if (v88)
        {
          unint64_t v89 = *(void *)(v87 + 8);
          unint64_t v90 = *(v84 - 4);
          if ((v90 & (v90 - 1)) != 0)
          {
            if (v89 >= v90) {
              v89 %= v90;
            }
          }
          else
          {
            v89 &= v90 - 1;
          }
          *(void *)(v86 + 8 * v89) = &v78[v83 / 8 - 3];
          *(void *)&v81[v83 - 24] = 0;
          *(void *)&v81[v83 - 16] = 0;
        }
        v83 -= 56;
      }
      while (&v81[v83] != v82);
      v91 = &v78[v83 / 8];
      v92 = *(char **)buf;
      v81 = *(char **)&buf[8];
      *(void *)buf = v91;
      *(void *)&buf[8] = v68;
      *(void *)&buf[16] = v80;
      if (v81 == v92) {
        goto LABEL_122;
      }
      do
      {
        v81 -= 56;
        std::__destroy_at[abi:nn180100]<KB::LanguageModelLexiconGroup,0>((uint64_t)v81);
      }
      while (v81 != v92);
      v81 = v92;
      if (v92) {
LABEL_123:
      }
        operator delete(v81);
LABEL_124:
      *(void *)&buf[8] = v68;
      if (SHIBYTE(v119) < 0) {
        operator delete(v118[0]);
      }
      if (++v70 == v67)
      {
        uint64_t v67 = [v65 countByEnumeratingWithState:&v107 objects:v141 count:16];
        if (!v67) {
          goto LABEL_128;
        }
        goto LABEL_90;
      }
    }
    *(void *)buf = v78;
    *(void *)&buf[8] = v78 + 7;
    *(void *)&buf[16] = v80;
LABEL_122:
    if (v81) {
      goto LABEL_123;
    }
    goto LABEL_124;
  }
  if (*(void *)buf != *(void *)&buf[8])
  {
    while (*v63 == *v62)
    {
      v63 += 2;
      v62 += 2;
      if (v63 == *(void **)&buf[8]) {
        goto LABEL_78;
      }
    }
    v118[0] = buf;
    goto LABEL_81;
  }
LABEL_78:
  v118[0] = buf;
  std::vector<std::shared_ptr<KB::LanguageModel>>::__destroy_vector::operator()[abi:nn180100]((void ***)v118);
  _Block_object_dispose(&v131, 8);
  std::__hash_table<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>>>::~__hash_table((uint64_t)&v136[8]);
  v131 = &v139;
  std::vector<std::shared_ptr<KB::LanguageModel>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v131);

  return 0;
}

- (id)modelLoaderForModelLocaleMapping:(id)a3 customResourcePaths:(id)a4 dynamicResourcePath:(id)a5 usesLinguisticContext:(BOOL)a6 isMultiLingualModeEnabled:(BOOL)a7 validEnglishTransformerMultilingualConfig:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  long long v17 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __193__TIKeyboardInputManager_mul_modelLoaderForModelLocaleMapping_customResourcePaths_dynamicResourcePath_usesLinguisticContext_isMultiLingualModeEnabled_validEnglishTransformerMultilingualConfig___block_invoke;
  v25[3] = &unk_1E6E29F60;
  id v18 = v17;
  id v26 = v18;
  id v27 = v14;
  v28 = self;
  id v29 = v15;
  id v30 = v16;
  BOOL v31 = a6;
  BOOL v32 = a7;
  BOOL v33 = a8;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v25];
  uint64_t v22 = v30;
  id v23 = v18;

  return v23;
}

- (id)modelLocaleToInputModeMapping
{
  BOOL v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__TIKeyboardInputManager_mul_modelLocaleToInputModeMapping__block_invoke;
  v6[3] = &unk_1E6E29E00;
  id v4 = v3;
  id v7 = v4;
  [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v6];

  return v4;
}

- (id)listOfModelLocalesFromActiveInputModes
{
  BOOL v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__TIKeyboardInputManager_mul_listOfModelLocalesFromActiveInputModes__block_invoke;
  v6[3] = &unk_1E6E29E00;
  id v4 = v3;
  id v7 = v4;
  [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v6];

  return v4;
}

- (BOOL)validEnglishTransformerMultilingualConfig
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  if (isH13ANEPresentOnIOS()) {
    int v3 = _os_feature_enabled_impl() ^ 1;
  }
  else {
    LOBYTE(v3) = 1;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(TIKeyboardInputManager *)self languageSelectionController];
  id v6 = [v5 activeInputModes];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [v11 languageWithRegion];
        char v13 = [v12 isEqualToString:@"hi_Latn"] & v3;

        if ((v13 & 1) == 0)
        {
          id v14 = [v11 languageWithRegion];
          char v15 = [v14 isEqualToString:@"vi_VN"];

          if ((v15 & 1) == 0) {
            continue;
          }
        }
        BOOL v4 = 0;
        goto LABEL_18;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v4 = 1;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v4 = 1;
  }
LABEL_18:

  return v4;
}

- (void)languageModelContainer
{
  return (void *)*((void *)self->super.m_impl + 29);
}

- (vector<KB::LexiconInfo,)lexiconInformationVector
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x5812000000;
  BOOL v33 = __Block_byref_object_copy__45;
  memset(v35, 0, sizeof(v35));
  v34 = __Block_byref_object_dispose__46;
  uint64_t v36 = 0;
  int v37 = 1065353216;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x4812000000;
  id v26 = __Block_byref_object_copy__47;
  id v27 = __Block_byref_object_dispose__48;
  v28 = "";
  memset(v29, 0, sizeof(v29));
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54__TIKeyboardInputManager_mul_lexiconInformationVector__block_invoke;
  v18[3] = &unk_1E6E29F38;
  v18[4] = self;
  v18[5] = &v23;
  v18[6] = &v19;
  v18[7] = &v30;
  [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v18];
  if (*((unsigned char *)v20 + 24))
  {
    [(TIKeyboardInputManager *)self addMultilingualLexiconsFromDiskToVector:v24 + 6 excluding:v31 + 6];
    uint64_t v5 = v24;
    [(TIKeyboardInputManager *)self lexiconInfoForMultilingualDynamic:0];
    unint64_t v6 = v5[7];
    unint64_t v7 = v5[8];
    if (v6 >= v7)
    {
      uint64_t v9 = v5[6];
      uint64_t v10 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v6 - v9) >> 4);
      if ((unint64_t)(v10 + 1) > 0x1745D1745D1745DLL) {
        abort();
      }
      unint64_t v11 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v7 - v9) >> 4);
      uint64_t v12 = 2 * v11;
      if (2 * v11 <= v10 + 1) {
        uint64_t v12 = v10 + 1;
      }
      if (v11 >= 0xBA2E8BA2E8BA2ELL) {
        unint64_t v13 = 0x1745D1745D1745DLL;
      }
      else {
        unint64_t v13 = v12;
      }
      v38[4] = v5 + 8;
      if (v13) {
        unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v13);
      }
      else {
        uint64_t v14 = 0;
      }
      uint64_t v15 = v13 + 176 * v10;
      v38[0] = v13;
      v38[1] = v15;
      v38[3] = v13 + 176 * v14;
      std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v15, (uint64_t)&v39);
      v38[2] = v15 + 176;
      std::vector<KB::LexiconInfo>::__swap_out_circular_buffer(v5 + 6, v38);
      uint64_t v8 = v5[7];
      std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)v38);
    }
    else
    {
      uint64_t v8 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v6, (uint64_t)&v39) + 176;
    }
    v5[7] = v8;
    if (v48 && v47 == 1) {
      free(v48);
    }
    if (v46 && v45 == 1) {
      free(v46);
    }
    if (v44 && v43 == 1) {
      free(v44);
    }
    if (v42 && v41 == 1) {
      free(v42);
    }
    if (v40 && BYTE6(v39) == 1) {
      free(v40);
    }
  }
  id v16 = v24;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  std::vector<KB::LexiconInfo>::__init_with_size[abi:nn180100]<KB::LexiconInfo*,KB::LexiconInfo*>(retstr, v16[6], v16[7], 0x2E8BA2E8BA2E8BA3 * ((v16[7] - v16[6]) >> 4));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  uint64_t v39 = (void **)v29;
  std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100](&v39);
  _Block_object_dispose(&v30, 8);
  return (vector<KB::LexiconInfo, std::allocator<KB::LexiconInfo>> *)std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v35[8]);
}

- (BOOL)usesRetrocorrection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManager_mul;
  BOOL v3 = [(TIKeyboardInputManager *)&v17 usesRetrocorrection];
  if ([(TIKeyboardInputManager_mul *)self isUsingMultilingual])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v4 = [(TIKeyboardInputManager *)self languageSelectionController];
    uint64_t v5 = [v4 activeInputModes];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) languageWithRegion];
          char v11 = [v10 isEqualToString:@"vi_VN"];

          if (v11)
          {
            BOOL v3 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v3;
}

- (float)weightForInputMode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardInputManager *)self languageSelectionController];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 priorProbabilityForInputMode:v4];
    float v8 = v7;
  }
  else
  {
    float v8 = 1.0;
  }

  return v8;
}

- (unsigned)lexiconIDForInputMode:(id)a3
{
  BOOL v3 = [a3 locale];
  id v4 = [v3 localeIdentifier];
  unsigned int v5 = TILexiconIDForLocaleIdentifier((char *)[v4 UTF8String]);

  return v5;
}

- (void)enumerateInputModesWithBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  unsigned int v5 = [(TIKeyboardInputManager *)self languageSelectionController];
  uint64_t v6 = v5;
  if (v5)
  {
    float v7 = [v5 activeInputModes];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
  else
  {
    float v7 = [(TIKeyboardInputManager *)self primaryInputMode];
    ((void (**)(id, void *))v4)[2](v4, v7);
  }
}

- (id)keyLayoutMapAsNearbyKeys
{
  v2 = [(TIKeyboardInputManager_mul *)self keyLayoutMap];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__TIKeyboardInputManager_mul_keyLayoutMapAsNearbyKeys__block_invoke;
  v6[3] = &unk_1E6E29F10;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

- (id)keyLayoutMap
{
  return 0;
}

- (void)keyLayoutDidChangeTo:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(TIKeyboardInputManager_mul *)self keyLayoutMap];
  if ([(TIKeyboardInputManager_mul *)self isUsingMultilingual] && v5)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__TIKeyboardInputManager_mul_keyLayoutDidChangeTo___block_invoke;
    v6[3] = &unk_1E6E29EE8;
    id v7 = v5;
    id v8 = v4;
    uint64_t v9 = self;
    [v8 enumerateKeysUsingBlock:v6];
  }
}

- (id)getCurrentExternalStringGiven:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  TIInputManager::input_substring((unsigned __int16 *)self->super.m_impl + 4, 0, -858993459 * ((*((void *)self->super.m_impl + 2) - *((void *)self->super.m_impl + 1)) >> 3), (uint64_t)v11);
  uint64_t v6 = KB::ns_string((KB *)v11, v5);
  if (v12) {
    BOOL v7 = v11[6] == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    free(v12);
  }
  BOOL v8 = [(TIKeyboardInputManager_mul *)self choseSecondary];
  [(TIKeyboardInputManager_mul *)self setChoseSecondary:v3];
  uint64_t v9 = [(TIKeyboardInputManager_mul *)self internalStringToExternal:v6];
  [(TIKeyboardInputManager_mul *)self setChoseSecondary:v8];

  return v9;
}

- (unsigned)externalIndexToInternal:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (![(TIKeyboardInputManager_mul *)self choseSecondary])
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_mul;
    LODWORD(v3) = [(TIKeyboardInputManager *)&v6 externalIndexToInternal:v3];
  }
  return v3;
}

- (unsigned)internalIndexToExternal:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(TIKeyboardInputManager_mul *)self choseSecondary])
  {
    TIInputManager::input_substring((unsigned __int16 *)self->super.m_impl + 4, 0, v3, (uint64_t)v10);
    objc_super v6 = KB::ns_string((KB *)v10, v5);
    unsigned int v7 = [v6 length];

    if (v11 && v10[6] == 1) {
      free(v11);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIKeyboardInputManager_mul;
    return [(TIKeyboardInputManager *)&v9 internalIndexToExternal:v3];
  }
  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager_mul *)self choseSecondary])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_mul;
    id v5 = [(TIKeyboardInputManager *)&v8 internalStringToExternal:v4];
  }
  objc_super v6 = v5;

  return v6;
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager_mul *)self choseSecondary])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_mul;
    id v5 = [(TIKeyboardInputManager *)&v8 externalStringToInternal:v4];
  }
  objc_super v6 = v5;

  return v6;
}

- (BOOL)stringIsRecognizedByAlternativeIM:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
  if ([(TIKeyboardInputManager *)self usesFavonius])
  {
    objc_super v6 = [(TIKeyboardInputManager *)self languageSelectionController];
    unsigned int v7 = [v6 activeInputModes];
    objc_super v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_mul choseSecondary](self, "choseSecondary") ^ 1);

    objc_super v9 = [(TIKeyboardInputManager_mul *)self lexiconLocaleOfString:v4 inputMode:v8];
    BOOL v10 = v9 != 0;
  }
  else
  {
    char v11 = [v5 predictions];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__TIKeyboardInputManager_mul_stringIsRecognizedByAlternativeIM___block_invoke;
    v13[3] = &unk_1E6E2C7B0;
    id v14 = v4;
    BOOL v10 = [v11 indexOfObjectPassingTest:v13] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v10;
}

- (BOOL)shouldPassAlternativeInputAsPrediction:(id)a3 isRecognized:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
  int v8 = [v6 isEqualToString:self->super.m_composedText];

  if (v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[TIKeyboardInputManager_mul shouldPassAlternativeInputAsPrediction:isRecognized:]";
    __int16 v18 = 2080;
    uint64_t v19 = "-[TIKeyboardInputManager_mul shouldPassAlternativeInputAsPrediction:isRecognized:]";
    _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  %s should not be entered if alternative input == composed text", (uint8_t *)&v16, 0x16u);
    if (a4) {
      goto LABEL_6;
    }
LABEL_4:
    if ([(TIKeyboardInputManager_mul *)self emphasizesAlternativeInput])
    {
      if (-858993459 * ((*((void *)self->super.m_impl + 2) - *((void *)self->super.m_impl + 1)) >> 3) < 6) {
        goto LABEL_6;
      }
      BOOL v10 = [v7 corrections];
      char v11 = [v10 autocorrection];
      uint64_t v12 = [v11 lexiconLocale];
      if (v12)
      {
      }
      else
      {
        uint64_t v13 = [v7 predictions];
        uint64_t v14 = [v13 indexOfObjectPassingTest:&__block_literal_global_2608];

        if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_6;
        }
      }
    }
    BOOL v9 = 0;
    goto LABEL_11;
  }
  if (!a4) {
    goto LABEL_4;
  }
LABEL_6:
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)handleAlternativeInput:(id)a3 givenCandidate:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  if ([v27 isEqualToString:self->super.m_composedText]) {
    goto LABEL_15;
  }
  BOOL v7 = [(TIKeyboardInputManager_mul *)self stringIsRecognizedByAlternativeIM:v27];
  if ([(TIKeyboardInputManager_mul *)self emphasizesAlternativeInput]) {
    uint64_t v8 = [(TIKeyboardInputManager_mul *)self indexOfLastDynamicSwitch] != -1 || v7;
  }
  else {
    uint64_t v8 = 0;
  }
  [v6 setShouldHintAtAlternativeInput:v8];
  BOOL v9 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
  BOOL v10 = [v6 candidateByReplacingWithCandidate:v27];
  objc_msgSend(v10, "setIsAlternativeInput:", -[TIKeyboardInputManager_mul emphasizesAlternativeInput](self, "emphasizesAlternativeInput"));
  char v11 = [v9 corrections];
  uint64_t v12 = [v11 alternateCorrections];
  uint64_t v13 = [(TIKeyboardInputManager_mul *)self candidateArray:v12 withCandidateUniquelyInsertedToFront:v10];

  id v14 = objc_alloc(MEMORY[0x1E4FAE2A0]);
  long long v15 = [v9 corrections];
  int v16 = [v15 autocorrection];
  uint64_t v25 = (void *)v13;
  id v26 = (void *)[v14 initWithAutocorrection:v16 alternateCorrections:v13];

  if (![(TIKeyboardInputManager_mul *)self shouldPassAlternativeInputAsPrediction:v27 isRecognized:v7])
  {
    uint64_t v19 = (void *)MEMORY[0x1E4FAE278];
    goto LABEL_11;
  }
  uint64_t v17 = [v9 predictions];
  __int16 v18 = [(TIKeyboardInputManager_mul *)self candidateArray:v17 withCandidateUniquelyInsertedToFront:v10];

  uint64_t v19 = (void *)MEMORY[0x1E4FAE278];
  if (!v18)
  {
LABEL_11:
    uint64_t v21 = [v9 predictions];
    __int16 v18 = 0;
    int v20 = 1;
    goto LABEL_12;
  }
  int v20 = 0;
  uint64_t v21 = v18;
LABEL_12:
  char v22 = [v9 emojiList];
  uint64_t v23 = [v9 proactiveTriggers];
  v24 = [v19 listWithCorrections:v26 predictions:v21 emojiList:v22 proactiveTriggers:v23];

  if (v20) {
  [(TIKeyboardInputManager *)self setPregeneratedTypingAutocorrections:v24];
  }

LABEL_15:
}

- (BOOL)emphasizesAlternativeInput
{
  return 1;
}

- (id)candidateArray:(id)a3 withCandidateUniquelyInsertedToFront:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82__TIKeyboardInputManager_mul_candidateArray_withCandidateUniquelyInsertedToFront___block_invoke;
  v14[3] = &unk_1E6E29EA0;
  id v15 = v5;
  id v7 = v5;
  id v8 = a3;
  BOOL v9 = [v6 predicateWithBlock:v14];
  BOOL v10 = [v8 filteredArrayUsingPredicate:v9];

  v16[0] = v7;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  uint64_t v12 = [v11 arrayByAddingObjectsFromArray:v10];

  return v12;
}

- (id)getPlainCandidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  TIInputManager::input_substring((unsigned __int16 *)self->super.m_impl + 4, 0, -858993459 * ((*((void *)self->super.m_impl + 2) - *((void *)self->super.m_impl + 1)) >> 3), (uint64_t)v10);
  id v4 = KB::ns_string((KB *)v10, v3);
  if (v11) {
    BOOL v5 = v10[6] == 1;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    free(v11);
  }
  id v6 = [(TIKeyboardInputManager_mul *)self internalStringToExternal:v4];
  if ([(TIKeyboardInputManager *)self usesFavonius]) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FAE318]) initWithCandidate:v6 forInput:v6 rawInput:v4];
  }
  else {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FAE3B8]) initWithSurface:v6 input:v6 mecabraCandidatePointerValue:0];
  }
  id v8 = v7;
  [v7 setLexiconLocale:0];

  return v8;
}

- (void)updateAutocorrectionListGivenOutdatedInput:(id)a3 andUpdatedInput:(id)a4
{
  id v5 = a4;
  uint64_t v39 = self;
  id v6 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
  id v7 = [v6 corrections];
  id v8 = [v7 autocorrection];

  BOOL v9 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke;
  aBlock[3] = &unk_1E6E29E50;
  id v10 = v5;
  id v49 = v10;
  char v11 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  v38 = v11[2](v11, v8, 1);

  uint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v13 = [v9 corrections];
  id v14 = [v13 alternateCorrections];
  id v15 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v14, "count"));

  int v16 = [v9 corrections];
  uint64_t v17 = [v16 alternateCorrections];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_23;
  v45[3] = &unk_1E6E29E78;
  __int16 v18 = v11;
  id v46 = v15;
  char v47 = v18;
  id v37 = v15;
  [v17 enumerateObjectsUsingBlock:v45];

  id v19 = objc_alloc(MEMORY[0x1E4FAE2A0]);
  int v20 = (void *)[v37 copy];
  uint64_t v21 = (void *)[v19 initWithAutocorrection:v38 alternateCorrections:v20];

  char v22 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v23 = [v9 predictions];
  v24 = objc_msgSend(v22, "arrayWithCapacity:", objc_msgSend(v23, "count"));

  uint64_t v25 = [v9 predictions];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_2;
  v42[3] = &unk_1E6E29E78;
  id v43 = v24;
  unint64_t v44 = v18;
  id v26 = v24;
  id v27 = v18;
  [v25 enumerateObjectsUsingBlock:v42];

  v28 = (void *)[v26 copy];
  id v29 = (void *)MEMORY[0x1E4F28F60];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_3;
  v40[3] = &unk_1E6E29EA0;
  id v41 = v10;
  id v30 = v10;
  BOOL v31 = [v29 predicateWithBlock:v40];
  uint64_t v32 = [v28 filteredArrayUsingPredicate:v31];

  BOOL v33 = (void *)MEMORY[0x1E4FAE278];
  v34 = [v9 emojiList];
  v35 = [v9 proactiveTriggers];
  uint64_t v36 = [v33 listWithCorrections:v21 predictions:v32 emojiList:v34 proactiveTriggers:v35];

  [(TIKeyboardInputManager *)v39 setPregeneratedTypingAutocorrections:v36];
}

- (id)getBetterLexiconLocale:(BOOL *)a3
{
  id v5 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
  id v6 = [v5 corrections];
  id v7 = [v6 autocorrection];

  id v8 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
  BOOL v9 = [v8 predictions];
  id v10 = [v9 firstObject];

  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2588;
  uint64_t v25 = __Block_byref_object_dispose__2589;
  id v26 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
  }
  uint64_t v11 = [v7 lexiconLocale];
  uint64_t v12 = (void *)v22[5];
  v22[5] = v11;

  if (!v22[5])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __53__TIKeyboardInputManager_mul_getBetterLexiconLocale___block_invoke;
      v18[3] = &unk_1E6E29E28;
      int v20 = &v21;
      v18[4] = self;
      id v19 = v7;
      [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v18];
    }
  }
  if (!v22[5]
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    uint64_t v14 = [v10 lexiconLocale];
    id v15 = (void *)v22[5];
    v22[5] = v14;

    BOOL v13 = 0;
  }
  else
  {
LABEL_7:
    BOOL v13 = 1;
  }
  *a3 = v13;
  id v16 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v16;
}

- (void)chooseBetterInputMethod
{
  if (![(TIKeyboardInputManager_mul *)self isFreezingInputMethodChoice])
  {
    uint64_t v3 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
    id v4 = [v3 corrections];
    id v5 = [v4 autocorrection];

    id v6 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
    id v7 = [v6 predictions];
    id v8 = [v7 firstObject];

    char v18 = 0;
    BOOL v9 = [(TIKeyboardInputManager_mul *)self getBetterLexiconLocale:&v18];
    if (v9)
    {
      id v10 = [(TIKeyboardInputManager *)self primaryInputMode];
      uint64_t v11 = [v10 normalizedIdentifier];
      uint64_t v12 = [v9 caseInsensitiveCompare:v11];

      if (!v12)
      {
        [(TIKeyboardInputManager_mul *)self setChoseSecondary:0];
        if (v18) {
          id v15 = v5;
        }
        else {
          id v15 = v8;
        }
        id v16 = [v15 candidate];
        uint64_t v17 = [(TIKeyboardInputManager_mul *)self internalStringToExternal:v16];
        -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", [v17 compare:v16 options:129] != 0);

        goto LABEL_11;
      }
      BOOL v13 = self;
      BOOL choseSecondaryPrev = 1;
    }
    else
    {
      BOOL choseSecondaryPrev = self->_choseSecondaryPrev;
      BOOL v13 = self;
    }
    [(TIKeyboardInputManager_mul *)v13 setChoseSecondary:choseSecondaryPrev];
LABEL_11:
  }
}

- (BOOL)shouldFreezeInputMethodChoiceForPopupVariants
{
  return 1;
}

- (id)handleKeyboardInput:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (-[TIKeyboardInputManager_mul shouldFreezeInputMethodChoiceForPopupVariants](self, "shouldFreezeInputMethodChoiceForPopupVariants")&& [v4 isPopupVariant])
  {
    id v5 = [(TIKeyboardInputManager_mul *)self keyLayoutMap];
    id v6 = [v5 allKeys];
    id v7 = [v4 string];
    -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", [v6 indexOfObject:v7] == 0x7FFFFFFFFFFFFFFFLL);

    [(TIKeyboardInputManager_mul *)self setIsFreezingInputMethodChoice:1];
  }
  [(TIKeyboardInputManager *)self setPregeneratedTypingAutocorrections:0];
  int v8 = [(NSMutableString *)self->super.m_composedText length];
  v81.receiver = self;
  v81.super_class = (Class)TIKeyboardInputManager_mul;
  BOOL v9 = [(TIKeyboardInputManager *)&v81 handleKeyboardInput:v4];
  id v10 = [(TIKeyboardInputManager *)self keyboardState];
  int v11 = [v10 autocorrectionEnabled];

  uint64_t v12 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  int v13 = [v12 BOOLForPreferenceKey:*MEMORY[0x1E4FAE948]];

  if (![(TIKeyboardInputManager_mul *)self shouldDynamicallySwitchBetweenPrimaryAndSecondary]|| ![(TIKeyboardInputManager_mul *)self forceAutomaticMultiLanguageSwitch]&& (v11 & v13) == 0|| ![(NSMutableString *)self->super.m_composedText length])
  {
    goto LABEL_11;
  }
  uint64_t v14 = [v4 acceptedCandidate];
  if (v14)
  {

LABEL_11:
    [(TIKeyboardInputManager_mul *)self setIsFreezingInputMethodChoice:0];
    goto LABEL_12;
  }
  id v15 = [v4 string];
  BOOL v16 = [(TIKeyboardInputManager *)self stringEndsWord:v15];

  if (v16) {
    goto LABEL_11;
  }
  char v18 = -[TIKeyboardInputManager generateTypingAutocorrectionsWithCandidateRange:](self, "generateTypingAutocorrectionsWithCandidateRange:", 0, 3);
  m_impl = (unsigned __int16 *)self->super.m_impl;
  unint64_t v20 = *((unsigned int *)m_impl + 24);
  TIInputManager::input_substring(m_impl + 4, 0, -858993459 * ((*((void *)m_impl + 2) - *((void *)m_impl + 1)) >> 3), (uint64_t)v82);
  char v22 = KB::ns_string((KB *)v82, v21);
  unint64_t v78 = [v22 length];

  if (v84 && v83 == 1) {
    free(v84);
  }
  uint64_t v23 = [v18 corrections];
  v24 = [v23 autocorrection];

  if (v78 <= v20)
  {
    uint64_t v77 = self->super.m_composedText;
  }
  else
  {
    TIInputManager::input_substring((unsigned __int16 *)self->super.m_impl + 4, 0, *((_DWORD *)self->super.m_impl + 24), (uint64_t)v82);
    id v26 = KB::ns_string((KB *)v82, v25);
    uint64_t v77 = [(TIKeyboardInputManager_mul *)self internalStringToExternal:v26];

    if (v84 && v83 == 1) {
      free(v84);
    }
  }
  unint64_t v80 = [v18 predictions];
  unint64_t v73 = v20;
  if ([v4 isBackspace])
  {
    if (v24)
    {
      id v27 = [v24 candidate];
      char v28 = [v27 isEqualToString:v77];

      if ((v28 & 1) == 0)
      {
        id v29 = [v24 lexiconLocale];

        if (v29)
        {
          uint64_t v30 = [(TIKeyboardInputManager_mul *)self candidateArray:v80 withCandidateUniquelyInsertedToFront:v24];

          unint64_t v80 = (void *)v30;
        }
        uint64_t v31 = [v24 candidateByReplacingWithCandidate:v77];

        v24 = (void *)v31;
      }
    }
  }
  uint64_t v32 = [v18 corrections];
  BOOL v33 = [v32 autocorrection];
  unint64_t v76 = v24;
  if (v24 == v33)
  {
    v34 = [v18 predictions];

    if (v80 == v34) {
      goto LABEL_33;
    }
  }
  else
  {
  }
  id v35 = objc_alloc(MEMORY[0x1E4FAE2A0]);
  uint64_t v36 = [v18 corrections];
  id v37 = [v36 alternateCorrections];
  v38 = (void *)[v35 initWithAutocorrection:v24 alternateCorrections:v37];

  uint64_t v39 = (void *)MEMORY[0x1E4FAE278];
  v40 = [v18 emojiList];
  id v41 = [v18 proactiveTriggers];
  uint64_t v42 = [v39 listWithCorrections:v38 predictions:v80 emojiList:v40 proactiveTriggers:v41];

  char v18 = (void *)v42;
LABEL_33:
  [(TIKeyboardInputManager *)self setPregeneratedTypingAutocorrections:v18];
  if (v78 <= v73)
  {
    uint64_t v79 = self->super.m_composedText;
    TIInputManager::input_substring((unsigned __int16 *)self->super.m_impl + 4, 0, -858993459 * ((*((void *)self->super.m_impl + 2) - *((void *)self->super.m_impl + 1)) >> 3), (uint64_t)v82);
    uint64_t v44 = KB::ns_string((KB *)v82, v43);
    if (v84 && v83 == 1) {
      free(v84);
    }
    v72 = (void *)v44;
    if ([v4 isBackspace])
    {
      id v45 = [(TIKeyboardInputManager *)self internalStringToExternal:v44 ignoreCompositionDisabled:1];
      -[TIKeyboardInputManager_mul setChoseSecondary:](self, "setChoseSecondary:", [v45 isEqualToString:self->super.m_composedText] ^ 1);
      [(TIKeyboardInputManager_mul *)self setIndexOfLastDynamicSwitch:-1];
LABEL_47:

      unint64_t v51 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
      v52 = [v51 corrections];
      uint64_t v53 = [v52 autocorrection];
      v54 = v53;
      if (v53)
      {
        id v55 = v53;
      }
      else
      {
        uint64_t v74 = [(TIKeyboardInputManager *)self pregeneratedTypingAutocorrections];
        v71 = [v74 predictions];
        v56 = [v71 firstObject];
        v57 = v56;
        if (v56)
        {
          id v58 = v56;
        }
        else
        {
          id v58 = [(TIKeyboardInputManager_mul *)self getPlainCandidate];
        }
        id v55 = v58;
      }
      int64x2_t v59 = [(TIKeyboardInputManager_mul *)self getCurrentExternalStringGiven:[(TIKeyboardInputManager_mul *)self choseSecondary] ^ 1];
      [(TIKeyboardInputManager_mul *)self handleAlternativeInput:v59 givenCandidate:v55];
      v60 = [v55 input];
      uint64_t v75 = [v60 rangeOfString:v59 options:4];
      uint64_t v62 = v61;

      LODWORD(v60) = self->_choseSecondaryPrev;
      if (v60 != [(TIKeyboardInputManager_mul *)self choseSecondary]
        || ([v55 lexiconLocale],
            v63 = objc_claimAutoreleasedReturnValue(),
            v63,
            !v63)
        || v75 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v64 = v62;
        self->_BOOL choseSecondaryPrev = [(TIKeyboardInputManager_mul *)self choseSecondary];
        id v65 = [v55 input];
        if ([v65 length])
        {
          uint64_t v66 = [v55 input];
        }
        else
        {
          uint64_t v66 = v79;
        }
        uint64_t v67 = v66;

        m_composedText = self->super.m_composedText;
        if (v75 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v69 = m_composedText;
        }
        else
        {
          -[NSMutableString stringByReplacingCharactersInRange:withString:](v67, "stringByReplacingCharactersInRange:withString:", v75, v64, m_composedText);
          uint64_t v69 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v70 = v69;
        [(TIKeyboardInputManager_mul *)self updateAutocorrectionListGivenOutdatedInput:v67 andUpdatedInput:v69];
      }
      goto LABEL_64;
    }
    [(TIKeyboardInputManager_mul *)self chooseBetterInputMethod];
    id v45 = [(TIKeyboardInputManager *)self newKeyboardContext];
    objc_msgSend(v45, "deleteBackward:", -[NSMutableString length](self->super.m_composedText, "length"));
    [(TIKeyboardInputManager *)self updateComposedText];
    [v45 insertText:self->super.m_composedText];
    id v46 = [v9 shortcutConversion];
    char v47 = objc_opt_new();

    [v47 setShortcutConversion:v46];
    [v47 deleteBackward:v8];
    [v47 insertText:self->super.m_composedText];
    uint64_t v48 = *((unsigned int *)self->super.m_impl + 24);
    if (v48 >= 5)
    {
      BOOL choseSecondaryPrev = self->_choseSecondaryPrev;
      if (choseSecondaryPrev != [(TIKeyboardInputManager_mul *)self choseSecondary]) {
        goto LABEL_45;
      }
      int64_t v50 = [(TIKeyboardInputManager_mul *)self indexOfLastDynamicSwitch];
      if (v50 == -1 || v48 - v50 < 4) {
        goto LABEL_46;
      }
    }
    uint64_t v48 = -1;
LABEL_45:
    [(TIKeyboardInputManager_mul *)self setIndexOfLastDynamicSwitch:v48];
LABEL_46:

    BOOL v9 = v47;
    goto LABEL_47;
  }
LABEL_64:

LABEL_12:

  return v9;
}

- (void)clearInput
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_mul;
  [(TIKeyboardInputManager *)&v3 clearInput];
  self->_BOOL choseSecondaryPrev = 0;
  [(TIKeyboardInputManager_mul *)self setChoseSecondary:0];
  [(TIKeyboardInputManager_mul *)self setIndexOfLastDynamicSwitch:-1];
}

- (id)lexiconLocaleOfString:(id)a3 inputMode:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 lowercaseString];
  int v8 = [v7 componentsSeparatedByString:@" "];
  BOOL v9 = [v8 firstObject];

  LODWORD(v7) = [(TIKeyboardInputManager_mul *)self lexiconIDForInputMode:v6];
  KB::utf8_string(v9, (uint64_t)v16);
  KB::StaticDictionary::word_with_string(*(KB::StaticDictionary **)(*((void *)self->super.m_impl + 28) + 8), (const KB::String *)v16, (int)v7, (KB::Word *)v13);
  if ((v14 || (KB::String::compute_length(v13), v14)) && (unint64_t v10 = TILocaleIdentifierForLexiconID(v15)) != 0)
  {
    int v11 = [NSString stringWithUTF8String:v10];
  }
  else
  {
    int v11 = 0;
  }
  KB::Word::~Word((KB::Word *)v13);
  if (v17 && v16[6] == 1) {
    free(v17);
  }

  return v11;
}

- (id)keyboardConfiguration
{
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_mul;
  objc_super v3 = [(TIKeyboardInputManager *)&v9 keyboardConfiguration];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__TIKeyboardInputManager_mul_keyboardConfiguration__block_invoke;
  v7[3] = &unk_1E6E29E00;
  id v8 = v4;
  id v5 = v4;
  [(TIKeyboardInputManager_mul *)self enumerateInputModesWithBlock:v7];
  [v3 setMultilingualLanguages:v5];

  return v3;
}

- (BOOL)isHighMemoryManager
{
  if ([(TIKeyboardInputManager_mul *)self isUsingMultilingual]) {
    return 1;
  }
  m_impl = (TIInputManager *)self->super.m_impl;

  return TIInputManager::advanced_models_loaded(m_impl);
}

- (void)suspend
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_mul;
  [(TIKeyboardInputManager *)&v3 suspend];
  self->_isSuspended = 1;
}

- (void)resume
{
  self->_isSuspended = 0;
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_mul;
  [(TIKeyboardInputManager *)&v3 resume];
  if (![(TIKeyboardInputManager *)self isLinguisticResourceUpdateScheduled]) {
    [(TIKeyboardInputManager_mul *)self updateLanguagePriors];
  }
}

- (TIKeyboardInputManager_mul)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_mul;
  result = [(TIKeyboardInputManager *)&v5 initWithConfig:a3 keyboardState:a4];
  if (result)
  {
    result->_indexOfLastDynamicSwitch = -1;
    result->_BOOL choseSecondaryPrev = 0;
  }
  return result;
}

- (BOOL)forceAutomaticMultiLanguageSwitch
{
  return 0;
}

- (BOOL)shouldDynamicallySwitchBetweenPrimaryAndSecondary
{
  return 0;
}

- (BOOL)isUsingMultilingual
{
  v2 = [(TIKeyboardInputManager *)self languageSelectionController];
  objc_super v3 = [v2 activeInputModes];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

@end