@interface TILanguageSelectionController
+ (id)inferAdditionalInputModesForPrimary:(id)a3;
+ (id)inferInputModeForLanguage:(id)a3 enabled:(id)a4;
+ (id)inferSecondaryInputModeForPrimary:(id)a3 enabled:(id)a4 isSimulation:(BOOL)a5;
+ (id)inferSecondaryInputModeForPrimary:(id)a3 enabled:(id)a4 isSimulation:(BOOL)a5 enabledExcludingPreferredLanguages:(id)a6;
+ (id)inputModeForLanguageIdentifier:(id)a3;
+ (id)inputModesForLanguageIdentifiers:(id)a3;
+ (id)multilingualInputModesForInputModes:(id)a3;
+ (id)sharedLanguageLikelihoodModel;
+ (void)reportTypedTokens:(const void *)a3 activeInputModes:(id)a4;
- (BOOL)bufferIsCompatibleWithContext:(const TITokenID *)a3 contextLength:(unint64_t)a4;
- (BOOL)didProbabilityChangeSignificantly;
- (BOOL)didUpdatedInputModesChange:(id)a3;
- (BOOL)updateInputModeProbabilities;
- (NSArray)activeInputModes;
- (NSArray)inferredAdditionalInputModes;
- (NSArray)preferredAdditionalInputModes;
- (NSArray)userEnabledInputModes;
- (NSDictionary)referenceInputModeProbabilities;
- (NSMutableArray)bufferedTokenStrings;
- (NSMutableDictionary)inputModeProbabilities;
- (TIInputMode)inferredSecondaryInputMode;
- (TIInputMode)preferredSecondaryInputMode;
- (TIInputMode)primaryInputMode;
- (TILanguageLikelihoodModeling)languageLikelihoodModel;
- (TILanguageModelAdaptationContext)adaptationContext;
- (TILanguageSelectionController)init;
- (TILanguageSelectionController)initWithLanguageLikelihoodModel:(id)a3 preferenceProvider:(id)a4;
- (TILanguageSelectionControllerDelegate)delegate;
- (TIMultilingualPreferenceProviding)preferenceProvider;
- (double)lastOfflineAdaptationTimeForApp:(id)a3;
- (float)priorProbabilityForInputMode:(id)a3;
- (id).cxx_construct;
- (id)additionalInputModesForUpdatedPrimaryInputMode:(id)a3 withSecondaryInputMode:(id)a4;
- (id)dynamicallyDetectedInputModesForPrimaryInputMode:(id)a3 isSimulation:(BOOL)a4;
- (id)fetchPreferredAdditionalInputModes;
- (id)fetchPreferredSecondaryInputMode;
- (id)fetchUserEnabledInputModes;
- (id)fetchUserEnabledInputModesExcludingPreferredLanguages;
- (id)secondaryInputModeForUpdatedPrimaryInputMode:(id)a3;
- (id)simulateImplicitInputModeDetectionForPrimaryInputMode:(id)a3;
- (vector<float,)retreiveExcessInputModeWeightRatiosFromCurrentWeights:()vector<float;
- (void)addTokenString:(id)a3 tokenID:(TITokenID)a4 context:(const TITokenID *)a5 contextLength:(unint64_t)a6;
- (void)appleKeyboardsInternalSettingsChanged:(id)a3;
- (void)appleKeyboardsPreferencesChanged:(id)a3;
- (void)dealloc;
- (void)feedBufferedTokenStringsToModel;
- (void)rebalanceBilingualInputModeWeights:(void *)a3;
- (void)rebalanceMultipleInputModeWeights:(void *)a3;
- (void)removeTokenString:(id)a3 tokenID:(TITokenID)a4 context:(const TITokenID *)a5 contextLength:(unint64_t)a6;
- (void)setActiveInputModes:(id)a3;
- (void)setAdaptationContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInferredAdditionalInputModes:(id)a3;
- (void)setInferredSecondaryInputMode:(id)a3;
- (void)setPreferredAdditionalInputModes:(id)a3;
- (void)setPreferredSecondaryInputMode:(id)a3;
- (void)setPrimaryInputMode:(id)a3;
- (void)setReferenceInputModeProbabilities:(id)a3;
- (void)setUserEnabledInputModes:(id)a3;
- (void)updateActiveInputModesSuppressingNotification:(BOOL)a3;
@end

@implementation TILanguageSelectionController

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedTokenStrings, 0);
  objc_storeStrong((id *)&self->_referenceInputModeProbabilities, 0);
  objc_storeStrong((id *)&self->_inputModeProbabilities, 0);
  objc_storeStrong((id *)&self->_userEnabledInputModes, 0);
  objc_storeStrong((id *)&self->_inferredAdditionalInputModes, 0);
  objc_storeStrong((id *)&self->_inferredSecondaryInputMode, 0);
  objc_storeStrong((id *)&self->_preferredAdditionalInputModes, 0);
  objc_storeStrong((id *)&self->_preferredSecondaryInputMode, 0);
  objc_storeStrong((id *)&self->_primaryInputMode, 0);
  objc_storeStrong((id *)&self->_preferenceProvider, 0);
  objc_storeStrong((id *)&self->_activeInputModes, 0);
  objc_storeStrong((id *)&self->_adaptationContext, 0);
  begin = self->m_buffered_tokens.__begin_;
  if (begin)
  {
    self->m_buffered_tokens.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_languageLikelihoodModel, 0);
}

- (NSMutableArray)bufferedTokenStrings
{
  return self->_bufferedTokenStrings;
}

- (void)setReferenceInputModeProbabilities:(id)a3
{
}

- (NSDictionary)referenceInputModeProbabilities
{
  return self->_referenceInputModeProbabilities;
}

- (NSMutableDictionary)inputModeProbabilities
{
  return self->_inputModeProbabilities;
}

- (void)setUserEnabledInputModes:(id)a3
{
}

- (NSArray)userEnabledInputModes
{
  return self->_userEnabledInputModes;
}

- (void)setInferredAdditionalInputModes:(id)a3
{
}

- (NSArray)inferredAdditionalInputModes
{
  return self->_inferredAdditionalInputModes;
}

- (void)setInferredSecondaryInputMode:(id)a3
{
}

- (TIInputMode)inferredSecondaryInputMode
{
  return self->_inferredSecondaryInputMode;
}

- (void)setPreferredAdditionalInputModes:(id)a3
{
}

- (NSArray)preferredAdditionalInputModes
{
  return self->_preferredAdditionalInputModes;
}

- (void)setPreferredSecondaryInputMode:(id)a3
{
}

- (TIInputMode)preferredSecondaryInputMode
{
  return self->_preferredSecondaryInputMode;
}

- (void)setPrimaryInputMode:(id)a3
{
}

- (TIInputMode)primaryInputMode
{
  return self->_primaryInputMode;
}

- (TIMultilingualPreferenceProviding)preferenceProvider
{
  return self->_preferenceProvider;
}

- (TILanguageLikelihoodModeling)languageLikelihoodModel
{
  return self->_languageLikelihoodModel;
}

- (void)setActiveInputModes:(id)a3
{
}

- (NSArray)activeInputModes
{
  return self->_activeInputModes;
}

- (TILanguageModelAdaptationContext)adaptationContext
{
  return self->_adaptationContext;
}

- (TILanguageSelectionControllerDelegate)delegate
{
  return self->_delegate;
}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  id v4 = a3;
  v5 = [(TILanguageSelectionController *)self languageLikelihoodModel];
  [v5 lastOfflineAdaptationTimeForApp:v4];
  double v7 = v6;

  return v7;
}

- (id)simulateImplicitInputModeDetectionForPrimaryInputMode:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 addObject:v4];
  double v6 = [(TILanguageSelectionController *)self userEnabledInputModes];
  double v7 = [(TILanguageSelectionController *)self fetchUserEnabledInputModesExcludingPreferredLanguages];
  v8 = +[TILanguageSelectionController inferSecondaryInputModeForPrimary:v4 enabled:v6 isSimulation:1 enabledExcludingPreferredLanguages:v7];

  if (v8)
  {
    [v5 addObject:v8];
    id v9 = v5;
  }
  else
  {
    id v9 = [(TILanguageSelectionController *)self dynamicallyDetectedInputModesForPrimaryInputMode:v4 isSimulation:1];
  }
  v10 = v9;

  return v10;
}

- (void)removeTokenString:(id)a3 tokenID:(TITokenID)a4 context:(const TITokenID *)a5 contextLength:(unint64_t)a6
{
  id v10 = a3;
  end = self->m_buffered_tokens.__end_;
  if (self->m_buffered_tokens.__begin_ != end)
  {
    id v31 = v10;
    TITokenID v12 = end[-1];
    self->m_buffered_tokens.__end_ = end - 1;
    v13 = [(TILanguageSelectionController *)self bufferedTokenStrings];
    v14 = [v13 lastObject];

    v15 = [(TILanguageSelectionController *)self bufferedTokenStrings];
    [v15 removeLastObject];

    if (v12 != a4
      || ![(TILanguageSelectionController *)self bufferIsCompatibleWithContext:a5 contextLength:a6])
    {
      v17 = self->m_buffered_tokens.__end_;
      value = self->m_buffered_tokens.__end_cap_.__value_;
      if (v17 >= value)
      {
        begin = self->m_buffered_tokens.__begin_;
        uint64_t v20 = v17 - begin;
        if ((unint64_t)(v20 + 1) >> 61) {
          abort();
        }
        uint64_t v21 = (char *)value - (char *)begin;
        uint64_t v22 = v21 >> 2;
        if (v21 >> 2 <= (unint64_t)(v20 + 1)) {
          uint64_t v22 = v20 + 1;
        }
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v23) {
          unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v23);
        }
        else {
          uint64_t v24 = 0;
        }
        v25 = (TITokenID *)(v23 + 8 * v20);
        v26 = (TITokenID *)(v23 + 8 * v24);
        TITokenID *v25 = v12;
        v18 = v25 + 1;
        v28 = self->m_buffered_tokens.__begin_;
        v27 = self->m_buffered_tokens.__end_;
        if (v27 != v28)
        {
          do
          {
            TITokenID v29 = v27[-1];
            --v27;
            v25[-1] = v29;
            --v25;
          }
          while (v27 != v28);
          v27 = self->m_buffered_tokens.__begin_;
        }
        self->m_buffered_tokens.__begin_ = v25;
        self->m_buffered_tokens.__end_ = v18;
        self->m_buffered_tokens.__end_cap_.__value_ = v26;
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        TITokenID *v17 = v12;
        v18 = v17 + 1;
      }
      self->m_buffered_tokens.__end_ = v18;
      v30 = [(TILanguageSelectionController *)self bufferedTokenStrings];
      [v30 addObject:v14];

      [(TILanguageSelectionController *)self feedBufferedTokenStringsToModel];
    }

    id v10 = v31;
  }
}

- (void)addTokenString:(id)a3 tokenID:(TITokenID)a4 context:(const TITokenID *)a5 contextLength:(unint64_t)a6
{
  id v27 = a3;
  BOOL v10 = [(TILanguageSelectionController *)self bufferIsCompatibleWithContext:a5 contextLength:a6];
  unint64_t v11 = *(void *)&a4 & 0xFFFFFFFF00000000;
  if (!v10
    || v11 == 0x100000000
    || v11 == 0x200000000
    || (TITokenID *)((char *)self->m_buffered_tokens.__end_ - (char *)self->m_buffered_tokens.__begin_) >= (TITokenID *)0x191)
  {
    [(TILanguageSelectionController *)self feedBufferedTokenStringsToModel];
  }
  if (v11 != 0x200000000)
  {
    TITokenID v12 = [(TILanguageSelectionController *)self bufferedTokenStrings];
    [v12 addObject:v27];

    end = self->m_buffered_tokens.__end_;
    value = self->m_buffered_tokens.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->m_buffered_tokens.__begin_;
      uint64_t v17 = end - begin;
      if ((unint64_t)(v17 + 1) >> 61) {
        abort();
      }
      uint64_t v18 = (char *)value - (char *)begin;
      uint64_t v19 = v18 >> 2;
      if (v18 >> 2 <= (unint64_t)(v17 + 1)) {
        uint64_t v19 = v17 + 1;
      }
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v19;
      }
      if (v20) {
        unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v20);
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = (TITokenID *)(v20 + 8 * v17);
      unint64_t v23 = (TITokenID *)(v20 + 8 * v21);
      *uint64_t v22 = a4;
      v15 = v22 + 1;
      v25 = self->m_buffered_tokens.__begin_;
      uint64_t v24 = self->m_buffered_tokens.__end_;
      if (v24 != v25)
      {
        do
        {
          TITokenID v26 = v24[-1];
          --v24;
          v22[-1] = v26;
          --v22;
        }
        while (v24 != v25);
        uint64_t v24 = self->m_buffered_tokens.__begin_;
      }
      self->m_buffered_tokens.__begin_ = v22;
      self->m_buffered_tokens.__end_ = v15;
      self->m_buffered_tokens.__end_cap_.__value_ = v23;
      if (v24) {
        operator delete(v24);
      }
    }
    else
    {
      TITokenID *end = a4;
      v15 = end + 1;
    }
    self->m_buffered_tokens.__end_ = v15;
  }
}

- (BOOL)bufferIsCompatibleWithContext:(const TITokenID *)a3 contextLength:(unint64_t)a4
{
  begin = self->m_buffered_tokens.__begin_;
  end = self->m_buffered_tokens.__end_;
  unint64_t v6 = end - begin;
  if (v6 < a4)
  {
    if (begin != end)
    {
      double v7 = &a3[a4 - v6];
      do
      {
        unsigned int lexicon_id = begin->lexicon_id;
        unsigned int word_id = begin->word_id;
        ++begin;
        unsigned int v10 = v7->lexicon_id;
        unsigned int v11 = v7->word_id;
        ++v7;
        BOOL v13 = lexicon_id == v10 && word_id == v11;
      }
      while (v13 && begin != end);
      return v13;
    }
LABEL_30:
    LOBYTE(v13) = 1;
    return v13;
  }
  if (!a4) {
    goto LABEL_30;
  }
  v15 = &a3[a4];
  v16 = &begin[v6 - a4];
  do
  {
    unsigned int v17 = a3->lexicon_id;
    unsigned int v18 = a3->word_id;
    ++a3;
    unsigned int v19 = v16->lexicon_id;
    unsigned int v20 = v16->word_id;
    ++v16;
    BOOL v13 = v17 == v19 && v18 == v20;
  }
  while (v13 && a3 != v15);
  return v13;
}

- (float)priorProbabilityForInputMode:(id)a3
{
  id v4 = a3;
  v5 = [(TILanguageSelectionController *)self inputModeProbabilities];
  unint64_t v6 = [v5 objectForKey:v4];

  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (void)setAdaptationContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v5 = (TILanguageModelAdaptationContext *)a3;
  if (self->_adaptationContext != v5)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      unint64_t v6 = TIOSLogFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v11 = [NSString stringWithFormat:@"%s Setting adaptation context = %@", "-[TILanguageSelectionController setAdaptationContext:]", v5];
        *(_DWORD *)buf = 138412290;
        BOOL v13 = v11;
        _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    float v7 = NSString;
    float v8 = [(TILanguageModelAdaptationContext *)v5 recipientNameDigest];
    id v9 = [(TILanguageSelectionController *)self adaptationContext];
    unsigned int v10 = [v9 recipientNameDigest];
    LOBYTE(v7) = [v7 _string:v8 matchesString:v10];

    objc_storeStrong((id *)&self->_adaptationContext, a3);
    if ((v7 & 1) == 0) {
      [(TILanguageSelectionController *)self updateActiveInputModesSuppressingNotification:0];
    }
  }
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (TILanguageSelectionControllerDelegate *)a3;
    id v4 = a3;
    v5 = [v4 primaryInputMode];
    [(TILanguageSelectionController *)self setPrimaryInputMode:v5];

    unint64_t v6 = [(TILanguageSelectionController *)self primaryInputMode];
    float v7 = [(TILanguageSelectionController *)self userEnabledInputModes];
    float v8 = [(TILanguageSelectionController *)self fetchUserEnabledInputModesExcludingPreferredLanguages];
    id v9 = +[TILanguageSelectionController inferSecondaryInputModeForPrimary:v6 enabled:v7 isSimulation:0 enabledExcludingPreferredLanguages:v8];
    [(TILanguageSelectionController *)self setInferredSecondaryInputMode:v9];

    unsigned int v10 = [(TILanguageSelectionController *)self primaryInputMode];
    unsigned int v11 = +[TILanguageSelectionController inferAdditionalInputModesForPrimary:v10];

    [(TILanguageSelectionController *)self setInferredAdditionalInputModes:v11];
    [(TILanguageSelectionController *)self updateActiveInputModesSuppressingNotification:1];
  }
}

- (void)rebalanceMultipleInputModeWeights:(void *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*((void *)a3 + 1) - *(void *)a3 >= 0xCuLL)
  {
    if (_os_feature_enabled_impl())
    {
      unint64_t v5 = *((void *)a3 + 1) - *(void *)a3;
      if ((int)(v5 >> 2) >= 1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = (v5 >> 2);
        unint64_t v8 = 0x1E4F29000uLL;
        do
        {
          float v9 = *(float *)(*(void *)a3 + 4 * v6);
          if (v9 < 0.15)
          {
            if (TICanLogMessageAtLevel_onceToken != -1) {
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
            }
            if (TICanLogMessageAtLevel_logLevel >= 2)
            {
              unsigned int v10 = TIOSLogFacility();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(*(id *)(v8 + 24), "stringWithFormat:", @"%s Boosting language %i weight to minimum (%.2g)", "-[TILanguageSelectionController rebalanceMultipleInputModeWeights:]", (v6 + 1), 0x3FC3333340000000);
                v16 = unint64_t v15 = v8;
                LODWORD(__p) = 138412290;
                *(void *)((char *)&__p + 4) = v16;
                _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&__p, 0xCu);

                unint64_t v8 = v15;
              }
            }
            float v11 = 0.15 - v9;
            [(TILanguageSelectionController *)self retreiveExcessInputModeWeightRatiosFromCurrentWeights:a3];
            uint64_t v12 = 0;
            BOOL v13 = (float *)__p;
            uint64_t v14 = *(void *)a3;
            do
            {
              if (v6 != v12) {
                *(float *)(v14 + 4 * v12) = *(float *)(v14 + 4 * v12) - (float)(v11 * v13[v12]);
              }
              ++v12;
            }
            while (v7 != v12);
            *(float *)(v14 + 4 * v6) = v11 + *(float *)(v14 + 4 * v6);
            if (v13)
            {
              *((void *)&__p + 1) = v13;
              operator delete(v13);
            }
          }
          ++v6;
        }
        while (v6 != v7);
      }
    }
  }
}

- (vector<float,)retreiveExcessInputModeWeightRatiosFromCurrentWeights:()vector<float
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  id v4 = *(float **)a4;
  unint64_t v5 = (float *)*((void *)a4 + 1);
  if (*(float **)a4 != v5)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    float v9 = 0;
    do
    {
      if (*v4 <= 0.15) {
        float v10 = 0.0;
      }
      else {
        float v10 = *v4 + -0.15;
      }
      if (v8 >= v9)
      {
        uint64_t v11 = v8 - v7;
        unint64_t v12 = v11 + 1;
        if ((unint64_t)(v11 + 1) >> 62) {
LABEL_54:
        }
          abort();
        if (((char *)v9 - (char *)v7) >> 1 > v12) {
          unint64_t v12 = ((char *)v9 - (char *)v7) >> 1;
        }
        if ((unint64_t)((char *)v9 - (char *)v7) >= 0x7FFFFFFFFFFFFFFCLL) {
          self = (vector<float, std::allocator<float>> *)0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          self = (vector<float, std::allocator<float>> *)v12;
        }
        if (self) {
          self = (vector<float, std::allocator<float>> *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((unint64_t)self);
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v14 = (float *)((char *)self + 4 * v11);
        float *v14 = v10;
        unint64_t v15 = v14 + 1;
        while (v8 != v7)
        {
          int v16 = *((_DWORD *)v8-- - 1);
          *((_DWORD *)v14-- - 1) = v16;
        }
        float v9 = (float *)((char *)self + 4 * v13);
        if (v7) {
          operator delete(v7);
        }
        uint64_t v7 = v14;
        unint64_t v8 = v15;
      }
      else
      {
        *v8++ = v10;
      }
      ++v4;
    }
    while (v4 != v5);
    if (v7 == v8) {
      goto LABEL_50;
    }
    float v17 = 0.0;
    uint64_t v18 = v7;
    do
    {
      float v19 = *v18++;
      float v17 = v17 + v19;
    }
    while (v18 != v8);
    var1 = 0;
    var0 = retstr->var2.var0;
    uint64_t v22 = retstr->var0;
    unint64_t v23 = v7;
    do
    {
      if (*v23 == 0.0) {
        float v24 = 0.0;
      }
      else {
        float v24 = *v23 / v17;
      }
      if (var1 >= var0)
      {
        uint64_t v26 = var1 - v22;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 62) {
          goto LABEL_54;
        }
        if (((char *)var0 - (char *)v22) >> 1 > v27) {
          unint64_t v27 = ((char *)var0 - (char *)v22) >> 1;
        }
        if ((unint64_t)((char *)var0 - (char *)v22) >= 0x7FFFFFFFFFFFFFFCLL) {
          self = (vector<float, std::allocator<float>> *)0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          self = (vector<float, std::allocator<float>> *)v27;
        }
        if (self)
        {
          self = (vector<float, std::allocator<float>> *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((unint64_t)self);
          var1 = retstr->var1;
        }
        else
        {
          uint64_t v28 = 0;
        }
        TITokenID v29 = (float *)((char *)self + 4 * v26);
        *TITokenID v29 = v24;
        v25 = v29 + 1;
        while (var1 != v22)
        {
          int v30 = *((_DWORD *)var1-- - 1);
          *((_DWORD *)v29-- - 1) = v30;
        }
        var0 = (float *)((char *)self + 4 * v28);
        retstr->var0 = v29;
        retstr->var1 = v25;
        retstr->var2.var0 = var0;
        if (v22) {
          operator delete(v22);
        }
        uint64_t v22 = v29;
      }
      else
      {
        float *var1 = v24;
        v25 = var1 + 1;
      }
      retstr->var1 = v25;
      ++v23;
      var1 = v25;
    }
    while (v23 != v8);
    if (v7)
    {
LABEL_50:
      operator delete(v7);
    }
  }
  return self;
}

- (void)rebalanceBilingualInputModeWeights:(void *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = *(float **)a3;
  if (*((void *)a3 + 1) - *(void *)a3 != 8) {
    return;
  }
  float v6 = *v3;
  float v7 = 0.5;
  if (*v3 < 0.5)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
    {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      float v7 = 0.5;
    }
    float v8 = v7 - v6;
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      float v9 = TIOSLogFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s Boosting primary language weight to minimum (%.2g)", "-[TILanguageSelectionController rebalanceBilingualInputModeWeights:]", 0x3FE0000000000000);
        *(_DWORD *)buf = 138412290;
        id v31 = v28;
        _os_log_debug_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    float v10 = *(float **)a3;
    float v11 = *(float *)(*(void *)a3 + 4) - v8;
    float *v10 = v8 + **(float **)a3;
    v10[1] = v11;
  }
  unint64_t v12 = [(TILanguageSelectionController *)self preferredSecondaryInputMode];
  uint64_t v13 = [(TILanguageSelectionController *)self activeInputModes];
  uint64_t v14 = [v13 objectAtIndex:1];
  if ([v12 isEqual:v14])
  {

    goto LABEL_13;
  }
  unint64_t v15 = [(TILanguageSelectionController *)self inferredSecondaryInputMode];
  int v16 = [(TILanguageSelectionController *)self activeInputModes];
  float v17 = [v16 objectAtIndex:1];
  int v18 = [v15 isEqual:v17];

  if (v18)
  {
LABEL_13:
    float v19 = [(TILanguageSelectionController *)self activeInputModes];
    unsigned int v20 = [v19 objectAtIndex:1];
    uint64_t v21 = [v20 normalizedIdentifier];

    if (([v21 hasPrefix:@"nl_"] & 1) != 0
      || [v21 hasPrefix:@"hi_Latn"])
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      float v22 = 0.1;
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        unint64_t v23 = TIOSLogFacility();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"%s Using reduced minimum prior %.2g for language %s", "-[TILanguageSelectionController rebalanceBilingualInputModeWeights:]", 0x3FB99999A0000000, objc_msgSend(v21, "UTF8String"));
          *(_DWORD *)buf = 138412290;
          id v31 = v27;
          _os_log_debug_impl(&dword_1E3F0E000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    else
    {
      float v22 = 0.1666;
    }

    goto LABEL_24;
  }
  float v22 = 0.0476;
LABEL_24:
  if (*(float *)(*(void *)a3 + 4) < v22)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      float v24 = TIOSLogFacility();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        TITokenID v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s Boosting secondary language weight to minimum (%.2g)", "-[TILanguageSelectionController rebalanceBilingualInputModeWeights:]", v22);
        *(_DWORD *)buf = 138412290;
        id v31 = v29;
        _os_log_debug_impl(&dword_1E3F0E000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    v25 = *(float **)a3;
    float v26 = *(float *)(*(void *)a3 + 4);
    float *v25 = **(float **)a3 - (float)(v22 - v26);
    v25[1] = v26 + (float)(v22 - v26);
  }
}

- (id)dynamicallyDetectedInputModesForPrimaryInputMode:(id)a3 isSimulation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  float v6 = (TIInputMode *)a3;
  if (v6 && (!_os_feature_enabled_impl() || v4))
  {
    float v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
    float v8 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v9 = _TILSCLanguageForInputMode(v6);
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      float v10 = TIOSLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        float v24 = [NSString stringWithFormat:@"%s Primary language = %@", "-[TILanguageSelectionController dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:]", v9];
        *(_DWORD *)buf = 138412290;
        v35 = v24;
        _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    [v8 addObject:v9];
    float v11 = [(TILanguageSelectionController *)self languageLikelihoodModel];
    unint64_t v12 = [v11 rankedLanguagesForRecipient:0];

    unint64_t v27 = (void *)v9;
    uint64_t v28 = v6;
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      uint64_t v13 = TIOSLogFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v25 = [NSString stringWithFormat:@"%s Detected languages = %@", "-[TILanguageSelectionController dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:]", v12];
        *(_DWORD *)buf = 138412290;
        v35 = v25;
        _os_log_debug_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v30;
LABEL_19:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * v18);
        if (([v8 containsObject:v19] & 1) == 0)
        {
          unsigned int v20 = [(TILanguageSelectionController *)self userEnabledInputModes];
          uint64_t v21 = +[TILanguageSelectionController inferInputModeForLanguage:v19 enabled:v20];

          if (v21 && [v21 supportsMultilingualKeyboard])
          {
            if (TICanLogMessageAtLevel_onceToken != -1) {
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
            }
            if (TICanLogMessageAtLevel_logLevel >= 2)
            {
              float v22 = TIOSLogFacility();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                float v26 = [NSString stringWithFormat:@"%s Adding active input mode = %@", "-[TILanguageSelectionController dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:]", v21];
                *(_DWORD *)buf = 138412290;
                v35 = v26;
                _os_log_debug_impl(&dword_1E3F0E000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
            [v7 addObject:v21];
            [v8 addObject:v19];
          }
        }
        if ((unint64_t)[v7 count] > 1) {
          break;
        }
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v16) {
            goto LABEL_19;
          }
          break;
        }
      }
    }

    float v6 = v28;
  }
  else
  {
    float v7 = 0;
  }

  return v7;
}

- (id)additionalInputModesForUpdatedPrimaryInputMode:(id)a3 withSecondaryInputMode:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  float v6 = (TIInputMode *)a3;
  float v7 = (TIInputMode *)a4;
  float v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v6 && v7 && TILSCMaximumActiveInputModes >= 3 && _os_feature_enabled_impl())
  {
    uint64_t v9 = objc_opt_new();
    float v10 = _TILSCLanguageForInputMode(v6);
    float v11 = _TILSCLanguageForInputMode(v8);
    unint64_t v12 = [(TILanguageSelectionController *)self preferredAdditionalInputModes];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v14 = [(TILanguageSelectionController *)self preferredAdditionalInputModes];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        long long v32 = v6;
        v33 = v8;
        uint64_t v17 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(TIInputMode **)(*((void *)&v38 + 1) + 8 * i);
            unsigned int v20 = _TILSCLanguageForInputMode(v19);
            char v21 = [v20 isEqualToString:v10];
            char v22 = [v20 isEqualToString:v11];
            if ((v21 & 1) == 0 && (v22 & 1) == 0) {
              [v9 addObject:v19];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v16);
        float v6 = v32;
LABEL_25:
        float v8 = v33;
      }
    }
    else
    {
      unint64_t v23 = [(TILanguageSelectionController *)self inferredAdditionalInputModes];
      uint64_t v24 = [v23 count];

      if (!v24)
      {
LABEL_27:

        goto LABEL_28;
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v14 = [(TILanguageSelectionController *)self inferredAdditionalInputModes];
      uint64_t v25 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        v33 = v8;
        uint64_t v27 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v35 != v27) {
              objc_enumerationMutation(v14);
            }
            long long v29 = *(TIInputMode **)(*((void *)&v34 + 1) + 8 * j);
            long long v30 = _TILSCLanguageForInputMode(v29);
            [v9 addObject:v29];
          }
          uint64_t v26 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v26);
        goto LABEL_25;
      }
    }

    goto LABEL_27;
  }
LABEL_28:

  return v9;
}

- (id)secondaryInputModeForUpdatedPrimaryInputMode:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    float v6 = 0;
    goto LABEL_14;
  }
  BOOL v4 = _TILSCLanguageForInputMode((TIInputMode *)a3);
  unint64_t v5 = [(TILanguageSelectionController *)self preferredSecondaryInputMode];

  if (v5)
  {
    float v6 = [(TILanguageSelectionController *)self preferredSecondaryInputMode];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      float v7 = [(TIInputMode *)v6 originalIdentifier];
      int v12 = 136315650;
      uint64_t v13 = "-[TILanguageSelectionController secondaryInputModeForUpdatedPrimaryInputMode:]";
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Configured secondary input mode = %@ with original identifier = %@", (uint8_t *)&v12, 0x20u);
    }
    float v8 = _TILSCLanguageForInputMode(v6);
    if ([v8 isEqualToString:v4])
    {

      float v6 = 0;
    }
  }
  else
  {
    uint64_t v9 = [(TILanguageSelectionController *)self inferredSecondaryInputMode];

    if (!v9)
    {
      float v6 = 0;
      goto LABEL_13;
    }
    float v6 = [(TILanguageSelectionController *)self inferredSecondaryInputMode];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      float v10 = [(TIInputMode *)v6 originalIdentifier];
      int v12 = 136315650;
      uint64_t v13 = "-[TILanguageSelectionController secondaryInputModeForUpdatedPrimaryInputMode:]";
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Inferred secondary input mode = %@ with original identifier = %@", (uint8_t *)&v12, 0x20u);
    }
    float v8 = _TILSCLanguageForInputMode(v6);
  }

LABEL_13:
LABEL_14:

  return v6;
}

- (void)feedBufferedTokenStringsToModel
{
  p_m_buffered_tokens = &self->m_buffered_tokens;
  BOOL v4 = [(TILanguageSelectionController *)self activeInputModes];
  +[TILanguageSelectionController reportTypedTokens:p_m_buffered_tokens activeInputModes:v4];

  begin = self->m_buffered_tokens.__begin_;
  if (self->m_buffered_tokens.__end_ == begin)
  {
    char v21 = &stru_1F3F7A998;
  }
  else
  {
    unint64_t v6 = 0;
    char v21 = &stru_1F3F7A998;
    do
    {
      TITokenID v7 = begin[v6];
      float v8 = [(TILanguageSelectionController *)self bufferedTokenStrings];
      uint64_t v9 = [v8 objectAtIndex:v6];

      if ([v9 length])
      {
        if ([(__CFString *)v21 length]
          && v7.word_id - 500 <= 0xFFFFFE0C
          && (uint64_t v10 = [(__CFString *)v21 _lastLongCharacter],
              [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet],
              float v11 = objc_claimAutoreleasedReturnValue(),
              LOBYTE(v10) = [v11 longCharacterIsMember:v10],
              v11,
              (v10 & 1) == 0))
        {
          uint64_t v14 = [(__CFString *)v21 stringByAppendingFormat:@" "];

          int v12 = (void *)v14;
        }
        else
        {
          int v12 = v21;
        }
        id v22 = v12;
        uint64_t v13 = [v12 stringByAppendingString:v9];

        char v21 = (__CFString *)v13;
      }

      ++v6;
      begin = self->m_buffered_tokens.__begin_;
    }
    while (v6 < self->m_buffered_tokens.__end_ - begin);
  }
  if ([(__CFString *)v21 length])
  {
    uint64_t v15 = [(TILanguageSelectionController *)self adaptationContext];
    __int16 v16 = [v15 recipientNameDigest];

    uint64_t v17 = [(TILanguageSelectionController *)self adaptationContext];
    uint64_t v18 = [v17 appContext];

    uint64_t v19 = [(TILanguageSelectionController *)self languageLikelihoodModel];
    [v19 addEvidence:v21 timestamp:0 adaptationType:v16 forRecipient:v18 app:0 language:CFAbsoluteTimeGetCurrent()];

    [(TILanguageSelectionController *)self updateActiveInputModesSuppressingNotification:0];
  }
  unsigned int v20 = [(TILanguageSelectionController *)self bufferedTokenStrings];
  [v20 removeAllObjects];

  self->m_buffered_tokens.__end_ = self->m_buffered_tokens.__begin_;
}

- (BOOL)updateInputModeProbabilities
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v3 = [(TILanguageSelectionController *)self activeInputModes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      unint64_t v5 = TIOSLogFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v45 = objc_msgSend(NSString, "stringWithFormat:", @"%s Update input mode probabilities", "-[TILanguageSelectionController updateInputModeProbabilities]");
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v45;
        _os_log_debug_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    TITokenID v7 = [(TILanguageSelectionController *)self activeInputModes];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = _TILSCLanguageForInputMode(*(TIInputMode **)(*((void *)&v49 + 1) + 8 * i));
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v9);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v56 = 0x4812000000;
    v57 = __Block_byref_object_copy__15986;
    v58 = __Block_byref_object_dispose__15987;
    v59 = "";
    v61 = 0;
    uint64_t v62 = 0;
    long long __p = 0;
    uint64_t v13 = [(TILanguageSelectionController *)self adaptationContext];
    uint64_t v14 = [v13 recipientNameDigest];

    uint64_t v15 = [(TILanguageSelectionController *)self languageLikelihoodModel];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __61__TILanguageSelectionController_updateInputModeProbabilities__block_invoke;
    v48[3] = &unk_1E6E2CDE8;
    v48[4] = &buf;
    [v15 priorProbabilityForLanguages:v6 recipient:v14 handler:v48];

    __int16 v16 = *(float **)(*((void *)&buf + 1) + 48);
    uint64_t v17 = *(float **)(*((void *)&buf + 1) + 56);
    if (v16 == v17) {
      goto LABEL_30;
    }
    float v18 = 0.0;
    do
    {
      float v19 = *v16++;
      float v18 = v18 + v19;
    }
    while (v16 != v17);
    if (v18 <= 0.0)
    {
LABEL_30:
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        unint64_t v23 = TIOSLogFacility();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v46 = objc_msgSend(NSString, "stringWithFormat:", @"%s All weights are zero -- dividing probability equally", "-[TILanguageSelectionController updateInputModeProbabilities]");
          *(_DWORD *)v53 = 138412290;
          v54 = v46;
          _os_log_debug_impl(&dword_1E3F0E000, v23, OS_LOG_TYPE_DEBUG, "%@", v53, 0xCu);
        }
      }
      uint64_t v25 = *(float **)(*((void *)&buf + 1) + 48);
      uint64_t v24 = *(float **)(*((void *)&buf + 1) + 56);
      if (v24 != v25)
      {
        float v26 = 1.0 / (float)(unint64_t)(v24 - v25);
        do
          *v25++ = v26;
        while (v25 != v24);
      }
    }
    else
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        unsigned int v20 = TIOSLogFacility();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v47 = objc_msgSend(NSString, "stringWithFormat:", @"%s Scaling sum weights to 1.", "-[TILanguageSelectionController updateInputModeProbabilities]");
          *(_DWORD *)v53 = 138412290;
          v54 = v47;
          _os_log_debug_impl(&dword_1E3F0E000, v20, OS_LOG_TYPE_DEBUG, "%@", v53, 0xCu);
        }
      }
      char v21 = *(float **)(*((void *)&buf + 1) + 48);
      id v22 = *(float **)(*((void *)&buf + 1) + 56);
      while (v21 != v22)
      {
        *char v21 = *v21 / v18;
        ++v21;
      }
    }
    uint64_t v27 = *((void *)&buf + 1) + 48;
    unint64_t v28 = *(void *)(*((void *)&buf + 1) + 56) - *(void *)(*((void *)&buf + 1) + 48);
    if (v28 == 8)
    {
      [(TILanguageSelectionController *)self rebalanceBilingualInputModeWeights:v27];
    }
    else if (v28 >= 9)
    {
      [(TILanguageSelectionController *)self rebalanceMultipleInputModeWeights:v27];
    }
    long long v31 = [(TILanguageSelectionController *)self inputModeProbabilities];
    [v31 removeAllObjects];

    long long v32 = [(TILanguageSelectionController *)self activeInputModes];
    uint64_t v33 = [v32 count];

    if (v33)
    {
      unint64_t v34 = 0;
      do
      {
        long long v35 = [(TILanguageSelectionController *)self activeInputModes];
        long long v36 = [v35 objectAtIndex:v34];

        int v37 = *(_DWORD *)(*(void *)(*((void *)&buf + 1) + 48) + 4 * v34);
        long long v38 = [(TILanguageSelectionController *)self inputModeProbabilities];
        LODWORD(v39) = v37;
        long long v40 = [NSNumber numberWithFloat:v39];
        [v38 setObject:v40 forKey:v36];

        ++v34;
        long long v41 = [(TILanguageSelectionController *)self activeInputModes];
        unint64_t v42 = [v41 count];
      }
      while (v34 < v42);
    }
    BOOL v30 = [(TILanguageSelectionController *)self didProbabilityChangeSignificantly];
    if (v30)
    {
      v43 = [(TILanguageSelectionController *)self inputModeProbabilities];
      [(TILanguageSelectionController *)self setReferenceInputModeProbabilities:v43];
    }
    _Block_object_dispose(&buf, 8);
    if (__p)
    {
      v61 = __p;
      operator delete(__p);
    }
  }
  else
  {
    long long v29 = [(TILanguageSelectionController *)self inputModeProbabilities];
    [v29 removeAllObjects];

    [(TILanguageSelectionController *)self setReferenceInputModeProbabilities:MEMORY[0x1E4F1CC08]];
    return 0;
  }
  return v30;
}

uint64_t __61__TILanguageSelectionController_updateInputModeProbabilities__block_invoke(uint64_t a1, void *a2, float a3)
{
  unint64_t v5 = a2;
  unint64_t v6 = v5;
  TITokenID v7 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = (float *)v7[7];
  unint64_t v8 = v7[8];
  if ((unint64_t)v9 >= v8)
  {
    unint64_t v5 = (float *)v7[6];
    uint64_t v11 = v9 - v5;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 62) {
      abort();
    }
    char v21 = v6;
    uint64_t v13 = v8 - (void)v5;
    if (v13 >> 1 > v12) {
      unint64_t v12 = v13 >> 1;
    }
    BOOL v14 = (unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v14) {
      unint64_t v15 = v12;
    }
    if (v15)
    {
      unint64_t v15 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v15);
      unint64_t v5 = (float *)v7[6];
      uint64_t v9 = (float *)v7[7];
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t v17 = (float *)(v15 + 4 * v11);
    unint64_t v18 = v15 + 4 * v16;
    float *v17 = a3;
    uint64_t v10 = v17 + 1;
    while (v9 != v5)
    {
      int v19 = *((_DWORD *)v9-- - 1);
      *((_DWORD *)v17-- - 1) = v19;
    }
    v7[6] = v17;
    v7[7] = v10;
    v7[8] = v18;
    if (v5) {
      operator delete(v5);
    }
    unint64_t v6 = v21;
  }
  else
  {
    *uint64_t v9 = a3;
    uint64_t v10 = v9 + 1;
  }
  v7[7] = v10;

  return MEMORY[0x1F41817F8](v5, v6);
}

- (BOOL)didProbabilityChangeSignificantly
{
  v3 = [(TILanguageSelectionController *)self referenceInputModeProbabilities];
  uint64_t v4 = [v3 count];
  unint64_t v5 = [(TILanguageSelectionController *)self inputModeProbabilities];
  uint64_t v6 = [v5 count];

  if (v4 != v6) {
    return 1;
  }
  TITokenID v7 = [(TILanguageSelectionController *)self activeInputModes];
  uint64_t v8 = [v7 count];

  if (!v8) {
    return 0;
  }
  unint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = [(TILanguageSelectionController *)self activeInputModes];
    uint64_t v11 = [v10 objectAtIndex:v9];

    unint64_t v12 = [(TILanguageSelectionController *)self referenceInputModeProbabilities];
    uint64_t v13 = [v12 objectForKey:v11];
    [v13 floatValue];
    float v15 = v14;

    uint64_t v16 = [(TILanguageSelectionController *)self inputModeProbabilities];
    uint64_t v17 = [v16 objectForKey:v11];
    [v17 floatValue];
    float v19 = v18;

    float v20 = vabds_f32(v15, v19);
    BOOL result = v20 >= 0.05;
    if (v20 >= 0.05) {
      break;
    }
    ++v9;
    id v22 = [(TILanguageSelectionController *)self activeInputModes];
    unint64_t v23 = [v22 count];

    if (v9 >= v23) {
      return 0;
    }
  }
  return result;
}

- (BOOL)didUpdatedInputModesChange:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = [(TILanguageSelectionController *)self activeInputModes];
    TITokenID v7 = [v5 setWithArray:v6];

    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];

    char v9 = [v7 isEqualToSet:v8];
    id v4 = (id)v8;
  }
  else
  {
    TITokenID v7 = [(TILanguageSelectionController *)self activeInputModes];
    char v9 = [v4 isEqualToArray:v7];
  }

  return v9 ^ 1;
}

- (void)updateActiveInputModesSuppressingNotification:(BOOL)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_opt_new();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(TILanguageSelectionController *)self primaryInputMode];
    TITokenID v7 = [(TILanguageSelectionController *)self primaryInputMode];
    uint64_t v8 = [v7 originalIdentifier];
    int v29 = 136315650;
    BOOL v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
    __int16 v31 = 2112;
    long long v32 = v6;
    __int16 v33 = 2112;
    unint64_t v34 = v8;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Found primary input mode = %@ with original identifier = %@", (uint8_t *)&v29, 0x20u);
  }
  char v9 = [(TILanguageSelectionController *)self primaryInputMode];

  if (v9)
  {
    uint64_t v10 = [(TILanguageSelectionController *)self primaryInputMode];

    if (v10)
    {
      uint64_t v11 = [(TILanguageSelectionController *)self primaryInputMode];
      [v5 addObject:v11];
    }
  }
  unint64_t v12 = [(TILanguageSelectionController *)self primaryInputMode];
  uint64_t v13 = [(TILanguageSelectionController *)self secondaryInputModeForUpdatedPrimaryInputMode:v12];

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      float v14 = [v13 originalIdentifier];
      int v29 = 136315650;
      BOOL v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
      __int16 v31 = 2112;
      long long v32 = v13;
      __int16 v33 = 2112;
      unint64_t v34 = v14;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Found secondary input mode = %@ with original identifier = %@", (uint8_t *)&v29, 0x20u);
    }
    [v5 addObject:v13];
  }
  float v15 = [(TILanguageSelectionController *)self primaryInputMode];
  uint64_t v16 = [(TILanguageSelectionController *)self additionalInputModesForUpdatedPrimaryInputMode:v15 withSecondaryInputMode:v13];

  if ([v16 count]) {
    [v5 addObjectsFromArray:v16];
  }
  uint64_t v17 = [(TILanguageSelectionController *)self primaryInputMode];
  id v18 = (id)v17;
  if (!v13 && v17)
  {
    char v19 = _os_feature_enabled_impl();

    if (v19) {
      goto LABEL_18;
    }
    float v20 = [(TILanguageSelectionController *)self primaryInputMode];
    id v18 = [(TILanguageSelectionController *)self dynamicallyDetectedInputModesForPrimaryInputMode:v20 isSimulation:0];

    if (v18)
    {
      id v18 = v18;

      unint64_t v5 = v18;
    }
  }

LABEL_18:
  if ([(TILanguageSelectionController *)self didUpdatedInputModesChange:v5])
  {
    [(TILanguageSelectionController *)self setActiveInputModes:v5];
    [(TILanguageSelectionController *)self updateInputModeProbabilities];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      char v21 = [(TILanguageSelectionController *)self adaptationContext];
      id v22 = [v21 recipientNameDigest];
      unint64_t v23 = [(TILanguageSelectionController *)self inputModeProbabilities];
      int v29 = 136315650;
      BOOL v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
      __int16 v31 = 2112;
      long long v32 = v22;
      __int16 v33 = 2112;
      unint64_t v34 = v23;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Activating new input modes (recipient=%@) = %@", (uint8_t *)&v29, 0x20u);
    }
    if (!a3)
    {
      uint64_t v24 = [(TILanguageSelectionController *)self delegate];
      [v24 didUpdateInputModes:self];
LABEL_30:
    }
  }
  else
  {
    BOOL v25 = [(TILanguageSelectionController *)self updateInputModeProbabilities];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      float v26 = [(TILanguageSelectionController *)self adaptationContext];
      uint64_t v27 = [v26 recipientNameDigest];
      unint64_t v28 = [(TILanguageSelectionController *)self inputModeProbabilities];
      int v29 = 136315650;
      BOOL v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
      __int16 v31 = 2112;
      long long v32 = v27;
      __int16 v33 = 2112;
      unint64_t v34 = v28;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Updating input mode probs (recipient=%@) = %@", (uint8_t *)&v29, 0x20u);
    }
    if (v25 && !a3)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315138;
        BOOL v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
        _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Notifying delegate about significant probability change", (uint8_t *)&v29, 0xCu);
      }
      uint64_t v24 = [(TILanguageSelectionController *)self delegate];
      [v24 didUpdateInputModeProbabilities:self];
      goto LABEL_30;
    }
  }
}

- (void)appleKeyboardsInternalSettingsChanged:(id)a3
{
  id v4 = [(TILanguageSelectionController *)self fetchPreferredSecondaryInputMode];
  [(TILanguageSelectionController *)self setPreferredSecondaryInputMode:v4];

  unint64_t v5 = [(TILanguageSelectionController *)self fetchPreferredAdditionalInputModes];
  [(TILanguageSelectionController *)self setPreferredAdditionalInputModes:v5];

  uint64_t v6 = [(TILanguageSelectionController *)self primaryInputMode];
  TITokenID v7 = [(TILanguageSelectionController *)self userEnabledInputModes];
  uint64_t v8 = [(TILanguageSelectionController *)self fetchUserEnabledInputModesExcludingPreferredLanguages];
  char v9 = +[TILanguageSelectionController inferSecondaryInputModeForPrimary:v6 enabled:v7 isSimulation:0 enabledExcludingPreferredLanguages:v8];
  [(TILanguageSelectionController *)self setInferredSecondaryInputMode:v9];

  uint64_t v10 = [(TILanguageSelectionController *)self primaryInputMode];
  uint64_t v11 = +[TILanguageSelectionController inferAdditionalInputModesForPrimary:v10];
  [(TILanguageSelectionController *)self setInferredAdditionalInputModes:v11];

  [(TILanguageSelectionController *)self updateActiveInputModesSuppressingNotification:0];
}

- (void)appleKeyboardsPreferencesChanged:(id)a3
{
  id v4 = [(TILanguageSelectionController *)self fetchUserEnabledInputModes];
  [(TILanguageSelectionController *)self setUserEnabledInputModes:v4];

  unint64_t v5 = [(TILanguageSelectionController *)self primaryInputMode];
  uint64_t v6 = [(TILanguageSelectionController *)self userEnabledInputModes];
  TITokenID v7 = [(TILanguageSelectionController *)self fetchUserEnabledInputModesExcludingPreferredLanguages];
  uint64_t v8 = +[TILanguageSelectionController inferSecondaryInputModeForPrimary:v5 enabled:v6 isSimulation:0 enabledExcludingPreferredLanguages:v7];
  [(TILanguageSelectionController *)self setInferredSecondaryInputMode:v8];

  char v9 = [(TILanguageSelectionController *)self primaryInputMode];
  uint64_t v10 = +[TILanguageSelectionController inferAdditionalInputModesForPrimary:v9];
  [(TILanguageSelectionController *)self setInferredAdditionalInputModes:v10];

  [(TILanguageSelectionController *)self updateActiveInputModesSuppressingNotification:0];
}

- (id)fetchPreferredAdditionalInputModes
{
  v2 = [(TILanguageSelectionController *)self preferenceProvider];
  v3 = [v2 preferredAdditionalInputModes];

  return v3;
}

- (id)fetchPreferredSecondaryInputMode
{
  v2 = [(TILanguageSelectionController *)self preferenceProvider];
  v3 = [v2 preferredSecondaryInputMode];

  return v3;
}

- (id)fetchUserEnabledInputModesExcludingPreferredLanguages
{
  v2 = [(TILanguageSelectionController *)self preferenceProvider];
  v3 = [v2 userEnabledInputModes];
  id v4 = +[TILanguageSelectionController multilingualInputModesForInputModes:v3];

  return v4;
}

- (id)fetchUserEnabledInputModes
{
  v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v4 = [(TILanguageSelectionController *)self preferenceProvider];
  unint64_t v5 = [v4 userEnabledInputModes];
  [v3 addObjectsFromArray:v5];

  uint64_t v6 = objc_opt_class();
  TITokenID v7 = [(TILanguageSelectionController *)self preferenceProvider];
  uint64_t v8 = [v7 userPreferredLanguages];
  char v9 = [v6 inputModesForLanguageIdentifiers:v8];
  [v3 addObjectsFromArray:v9];

  uint64_t v10 = [v3 array];
  uint64_t v11 = +[TILanguageSelectionController multilingualInputModesForInputModes:v10];

  return v11;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TILanguageSelectionController;
  [(TILanguageSelectionController *)&v4 dealloc];
}

- (TILanguageSelectionController)initWithLanguageLikelihoodModel:(id)a3 preferenceProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)TILanguageSelectionController;
  char v9 = [(TILanguageSelectionController *)&v29 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_languageLikelihoodModel, a3);
    objc_storeStrong((id *)&v10->_preferenceProvider, a4);
    uint64_t v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    activeInputModes = v10->_activeInputModes;
    v10->_activeInputModes = v11;

    uint64_t v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    inferredAdditionalInputModes = v10->_inferredAdditionalInputModes;
    v10->_inferredAdditionalInputModes = v13;

    float v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    preferredAdditionalInputModes = v10->_preferredAdditionalInputModes;
    v10->_preferredAdditionalInputModes = v15;

    uint64_t v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inputModeProbabilities = v10->_inputModeProbabilities;
    v10->_inputModeProbabilities = v17;

    char v19 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    referenceInputModeProbabilities = v10->_referenceInputModeProbabilities;
    v10->_referenceInputModeProbabilities = v19;

    char v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    bufferedTokenStrings = v10->_bufferedTokenStrings;
    v10->_bufferedTokenStrings = v21;

    unint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v10 selector:sel_appleKeyboardsPreferencesChanged_ name:@"AppleKeyboardsPreferencesChangedNotification_Private" object:0];

    uint64_t v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v10 selector:sel_appleKeyboardsInternalSettingsChanged_ name:@"AppleKeyboardsInternalSettingsChangedNotification" object:0];
  }
  BOOL v25 = [(TILanguageSelectionController *)v10 fetchPreferredSecondaryInputMode];
  [(TILanguageSelectionController *)v10 setPreferredSecondaryInputMode:v25];

  float v26 = [(TILanguageSelectionController *)v10 fetchPreferredAdditionalInputModes];
  [(TILanguageSelectionController *)v10 setPreferredAdditionalInputModes:v26];

  uint64_t v27 = [(TILanguageSelectionController *)v10 fetchUserEnabledInputModes];
  [(TILanguageSelectionController *)v10 setUserEnabledInputModes:v27];

  return v10;
}

- (TILanguageSelectionController)init
{
  v3 = +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
  objc_super v4 = objc_alloc_init(_TIMultilingualPreferences);
  unint64_t v5 = [(TILanguageSelectionController *)self initWithLanguageLikelihoodModel:v3 preferenceProvider:v4];

  return v5;
}

+ (void)reportTypedTokens:(const void *)a3 activeInputModes:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ((unint64_t)[v5 count] >= 2 && *(void *)a3 != *((void *)a3 + 1))
  {
    uint64_t v6 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v48 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = [*(id *)(*((void *)&v47 + 1) + 8 * i) locale];
          uint64_t v13 = [v12 localeIdentifier];
          [v6 addObject:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v9);
    }

    float v14 = TIStatisticGetKeyForMultilingual();
    TIStatisticScalarSetValue();

    id v15 = [v6 objectAtIndexedSubscript:0];
    int v16 = TILexiconIDForLocaleIdentifier((char *)[v15 UTF8String]);

    uint64_t v17 = *(uint64_t **)a3;
    id v18 = (uint64_t *)*((void *)a3 + 1);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    uint64_t v44 = __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke;
    v45 = &__block_descriptor_36_e21_B16__0_TITokenID_II_8l;
    int v46 = v16;
    char v19 = v43;
    while (v17 != v18)
    {
      uint64_t v20 = *v17++;
      ((uint64_t (*)(void *, uint64_t))v44)(v19, v20);
    }

    char v21 = TIStatisticGetKeyForMultilingual();
    TIStatisticScalarAddValue();

    id v22 = [v6 objectAtIndexedSubscript:1];
    LODWORD(v21) = TILexiconIDForLocaleIdentifier((char *)[v22 UTF8String]);

    unint64_t v23 = *(uint64_t **)a3;
    uint64_t v24 = (uint64_t *)*((void *)a3 + 1);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    long long v40 = __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke_2;
    long long v41 = &__block_descriptor_36_e21_B16__0_TITokenID_II_8l;
    int v42 = (int)v21;
    BOOL v25 = v39;
    while (v23 != v24)
    {
      uint64_t v26 = *v23++;
      ((uint64_t (*)(void *, uint64_t))v40)(v25, v26);
    }

    uint64_t v27 = TIStatisticGetKeyForMultilingual();
    TIStatisticScalarAddValue();

    if ([v6 count] == 3)
    {
      id v28 = [v6 objectAtIndexedSubscript:2];
      int v29 = TILexiconIDForLocaleIdentifier((char *)[v28 UTF8String]);

      BOOL v30 = *(uint64_t **)a3;
      __int16 v31 = (uint64_t *)*((void *)a3 + 1);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      long long v36 = __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke_3;
      int v37 = &__block_descriptor_36_e21_B16__0_TITokenID_II_8l;
      int v38 = v29;
      long long v32 = v35;
      while (v30 != v31)
      {
        uint64_t v33 = *v30++;
        ((uint64_t (*)(void *, uint64_t))v36)(v32, v33);
      }

      unint64_t v34 = TIStatisticGetKeyForMultilingual();
      TIStatisticScalarAddValue();
    }
  }
}

BOOL __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke(uint64_t a1, int a2)
{
  return *(_DWORD *)(a1 + 32) == a2;
}

BOOL __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke_2(uint64_t a1, int a2)
{
  return *(_DWORD *)(a1 + 32) == a2;
}

BOOL __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke_3(uint64_t a1, int a2)
{
  return *(_DWORD *)(a1 + 32) == a2;
}

+ (id)inputModesForLanguageIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "inputModeForLanguageIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)inputModeForLanguageIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = TIGetDefaultInputModesForLanguage();
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = (void *)MEMORY[0x1E4F28B50];
    v14[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v7 = [v5 preferredLocalizationsFromArray:v4 forPreferences:v6];
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v4 firstObject];
    }
    uint64_t v11 = v10;

    if (!v11) {
      goto LABEL_8;
    }
LABEL_5:
    unint64_t v12 = +[TIInputMode inputModeWithIdentifier:v11];
    goto LABEL_9;
  }
  uint64_t v11 = [v4 firstObject];
  if (v11) {
    goto LABEL_5;
  }
LABEL_8:
  unint64_t v12 = 0;
LABEL_9:

  return v12;
}

+ (id)inferInputModeForLanguage:(id)a3 enabled:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(TIInputMode **)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = _TILSCLanguageForInputMode(v14);
        if (objc_msgSend(v15, "isEqualToString:", v6, (void)v18)) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    [v8 firstObject];
  }
  else {
  long long v16 = [a1 inputModeForLanguageIdentifier:v6];
  }

  return v16;
}

+ (id)inferAdditionalInputModesForPrimary:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  if (_os_feature_enabled_impl())
  {
    id v5 = [v3 additionalConfiguredLatinLanguages];
    unint64_t v6 = [v5 count];

    if (v6 >= 2)
    {
      id v7 = [v3 additionalConfiguredLatinLanguages];
      unint64_t v8 = [v7 count];

      if (v8 >= 2)
      {
        unint64_t v9 = 1;
        do
        {
          uint64_t v10 = [v3 additionalConfiguredLatinLanguages];
          uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

          if (v11)
          {
            uint64_t v12 = +[TIInputMode inputModeWithIdentifier:v11];
            [v4 addObject:v12];
          }
          ++v9;
          long long v13 = [v3 additionalConfiguredLatinLanguages];
          unint64_t v14 = [v13 count];
        }
        while (v14 > v9);
      }
    }
  }

  return v4;
}

+ (id)inferSecondaryInputModeForPrimary:(id)a3 enabled:(id)a4 isSimulation:(BOOL)a5 enabledExcludingPreferredLanguages:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = +[TILanguageSelectionController inferSecondaryInputModeForPrimary:v9 enabled:a4 isSimulation:v7];
  if (!v11)
  {
    uint64_t v11 = +[TILanguageSelectionController inferSecondaryInputModeForPrimary:v9 enabled:v10 isSimulation:v7];
  }

  return v11;
}

+ (id)inferSecondaryInputModeForPrimary:(id)a3 enabled:(id)a4 isSimulation:(BOOL)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (TIInputMode *)a3;
  id v8 = a4;
  if (!_os_feature_enabled_impl() || a5)
  {
    if (!v7 || (unint64_t)[v8 count] < 2)
    {
      uint64_t v12 = 0;
      goto LABEL_25;
    }
    id v10 = [MEMORY[0x1E4F1CA80] set];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = _TILSCLanguageForInputMode(*(TIInputMode **)(*((void *)&v27 + 1) + 8 * i));
          [v10 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }

    long long v19 = _TILSCLanguageForInputMode(v7);
    [v10 removeObject:v19];
    if ([v10 count] == 1)
    {
      long long v20 = [v10 anyObject];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __88__TILanguageSelectionController_inferSecondaryInputModeForPrimary_enabled_isSimulation___block_invoke;
      v25[3] = &unk_1E6E2CDC0;
      id v26 = v20;
      id v21 = v20;
      id v22 = [v13 indexesOfObjectsPassingTest:v25];
      uint64_t v23 = [v13 objectsAtIndexes:v22];

      uint64_t v12 = [v23 firstObject];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v9 = [(TIInputMode *)v7 additionalConfiguredLatinLanguages];
    id v10 = [v9 firstObject];

    BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        *(_DWORD *)long long buf = 136315394;
        uint64_t v33 = "+[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:]";
        __int16 v34 = 2112;
        uint64_t v35 = v10;
        _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Sucessfully inferred secondary input mode = %@", buf, 0x16u);
      }
      uint64_t v12 = +[TIInputMode inputModeWithIdentifier:v10];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v33 = "+[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:]";
        _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Unable to infer secondary input mode due to no additional input modes found for primary input mode.", buf, 0xCu);
      }
      id v10 = 0;
      uint64_t v12 = 0;
    }
  }

LABEL_25:

  return v12;
}

uint64_t __88__TILanguageSelectionController_inferSecondaryInputModeForPrimary_enabled_isSimulation___block_invoke(uint64_t a1, TIInputMode *a2)
{
  id v3 = _TILSCLanguageForInputMode(a2);
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)multilingualInputModesForInputModes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_129];
  id v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

uint64_t __69__TILanguageSelectionController_multilingualInputModesForInputModes___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 normalizedIdentifier];
  id v3 = TIGetInputModeProperties();

  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4FAE738]];
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

+ (id)sharedLanguageLikelihoodModel
{
  return +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
}

@end