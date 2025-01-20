@interface TIKeyboardInputManagerTransliteration
+ (id)transliteratorInputCharacterSet;
- (BOOL)acceptsCharacter:(unsigned int)a3;
- (BOOL)hasCandidates;
- (BOOL)hasInputToTransliterate;
- (BOOL)isTransliterationManager;
- (BOOL)prioritizeLatinCandidates;
- (CandidateCollection)autocorrectionCandidateStrings;
- (Class)keyEventMapClass;
- (NSArray)currentCandidates;
- (NSMapTable)transliteratorCandidateByMecabraCandidatePointerValue;
- (NSMutableArray)committedCandidates;
- (TIKeyboardInputManager)nativeModelManager;
- (TIKeyboardInputManagerTransliteration)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TLTransliterator)autocorrectionTransliterator;
- (TLTransliterator)exactStringTransliterator;
- (TLTransliterator)transliterator;
- (id)autocorrectionListForEmptyInputWithDesiredCandidateCount:(unint64_t)a3;
- (id)candidateContextFromDocumentStateOnly;
- (id)candidatesForInputString:(id)a3;
- (id)candidatesForInputString:(id)a3 transliterator:(id)a4;
- (id)candidatesWithTypedString:(id)a3 autocorrectedCandidates:(id)a4;
- (id)candidatesWithTypedString:(id)a3 autocorrectedString:(id)a4;
- (id)dictionaryInputMode;
- (id)generateTypingAutocorrectionsWithCandidateRange:(_NSRange)a3;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)keyEventMap;
- (id)keyboardConfiguration;
- (id)lexiconLocales;
- (id)mecabraCandidatePointerValueWithCandidate:(id)a3;
- (id)scoreAndResortCandidates:(id)a3 string:(id)a4 geometryScore:(float)a5;
- (id)sortedCandidatesFromTypedStringCandidates:(id)a3 autocorrectedStringCandidates:(id)a4 autocorrectedLatinString:(id)a5;
- (shared_ptr<KB::LanguageModel>)loadNewLanguageModel;
- (void)decrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6;
- (void)deleteFromInputWithContext:(id)a3;
- (void)incrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6 saveToDifferentialPrivacy:(int)a7;
- (void)initImplementation;
- (void)loadDictionaries;
- (void)loadFavoniusTypingModel;
- (void)processCandidates:(id)a3 withGeometryScore:(float)a4 originalLatinString:(id)a5 context:(void *)a6 intoCandidateCollection:(void *)a7 intoStringCandidateMap:(id)a8;
- (void)setAutocorrectionTransliterator:(id)a3;
- (void)setCommittedCandidates:(id)a3;
- (void)setCurrentCandidates:(id)a3;
- (void)setExactStringTransliterator:(id)a3;
- (void)setHasCandidates:(BOOL)a3;
- (void)setNativeModelManager:(id)a3;
- (void)setPrioritizeLatinCandidates:(BOOL)a3;
- (void)setTransliterator:(id)a3;
- (void)setTransliteratorCandidateByMecabraCandidatePointerValue:(id)a3;
- (void)suspend;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
@end

@implementation TIKeyboardInputManagerTransliteration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_committedCandidates, 0);
  objc_storeStrong((id *)&self->_transliteratorCandidateByMecabraCandidatePointerValue, 0);
  objc_storeStrong((id *)&self->_nativeModelManager, 0);
  objc_storeStrong((id *)&self->_currentCandidates, 0);
  objc_storeStrong((id *)&self->_autocorrectionTransliterator, 0);
  objc_storeStrong((id *)&self->_exactStringTransliterator, 0);

  objc_storeStrong((id *)&self->_transliterator, 0);
}

- (void)setCommittedCandidates:(id)a3
{
}

- (NSMutableArray)committedCandidates
{
  return self->_committedCandidates;
}

- (void)setTransliteratorCandidateByMecabraCandidatePointerValue:(id)a3
{
}

- (NSMapTable)transliteratorCandidateByMecabraCandidatePointerValue
{
  return self->_transliteratorCandidateByMecabraCandidatePointerValue;
}

- (void)setNativeModelManager:(id)a3
{
}

- (TIKeyboardInputManager)nativeModelManager
{
  return self->_nativeModelManager;
}

- (void)setCurrentCandidates:(id)a3
{
}

- (NSArray)currentCandidates
{
  return self->_currentCandidates;
}

- (void)setHasCandidates:(BOOL)a3
{
  *(&self->_hasCandidates + 1) = a3;
}

- (BOOL)hasCandidates
{
  return *(&self->_hasCandidates + 1);
}

- (void)setPrioritizeLatinCandidates:(BOOL)a3
{
  self->_hasCandidates = a3;
}

- (BOOL)prioritizeLatinCandidates
{
  return self->_hasCandidates;
}

- (void)setAutocorrectionTransliterator:(id)a3
{
}

- (void)setExactStringTransliterator:(id)a3
{
}

- (void)setTransliterator:(id)a3
{
}

- (void)decrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  [(TIKeyboardInputManager *)self decrementLanguageModelCount:a4 tokenID:a5 contextTokens:v10];
  v12 = [(TIKeyboardInputManagerTransliteration *)self nativeModelManager];
  uint64_t v13 = [v12 findTokenIDForWord:v11 contextTokens:0 tokenLookupMode:0];

  id v14 = [(TIKeyboardInputManagerTransliteration *)self nativeModelManager];
  [v14 decrementLanguageModelCount:v11 tokenID:v13 contextTokens:v10];
}

- (void)incrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6 saveToDifferentialPrivacy:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a6;
  id v13 = a3;
  [(TIKeyboardInputManager *)self incrementLanguageModelCount:a4 tokenID:a5 contextTokens:0 saveToDifferentialPrivacy:v7];
  id v14 = [(TIKeyboardInputManagerTransliteration *)self nativeModelManager];
  uint64_t v15 = [v14 findTokenIDForWord:v13 contextTokens:0 tokenLookupMode:0];

  id v16 = [(TIKeyboardInputManagerTransliteration *)self nativeModelManager];
  [v16 incrementLanguageModelCount:v13 tokenID:v15 contextTokens:v12 saveToDifferentialPrivacy:v7];
}

- (void)processCandidates:(id)a3 withGeometryScore:(float)a4 originalLatinString:(id)a5 context:(void *)a6 intoCandidateCollection:(void *)a7 intoStringCandidateMap:(id)a8
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a8;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v10;
  uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v17 = [v16 candidate];
        KB::String::String((KB::String *)&v44, (const char *)[v17 cStringUsingEncoding:4]);
        KB::Candidate::Candidate((KB::Candidate *)v37, (const KB::String *)&v44, 0);
        if (v45 && BYTE6(v44) == 1) {
          free(v45);
        }
        objc_opt_class();
        int v18 = 0;
        int v19 = 0;
        if (objc_opt_isKindOfClass())
        {
          [v16 seq2seqScore];
          int v19 = v20;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v16 lmScore];
          int v18 = v21;
        }
        int v38 = 0;
        int v39 = v18;
        uint64_t v40 = 0x3E80000000000000;
        int v41 = v19;
        KB::LanguageModelContext::operator=((uint64_t)&v42, (uint64_t *)a6);
        v22 = (KB::Candidate *)*((void *)a7 + 1);
        unint64_t v23 = *((void *)a7 + 2);
        if ((unint64_t)v22 >= v23)
        {
          uint64_t v25 = 0x1CAC083126E978D5 * (((uint64_t)v22 - *(void *)a7) >> 3);
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) > 0x4189374BC6A7EFLL) {
            abort();
          }
          unint64_t v27 = 0x1CAC083126E978D5 * ((uint64_t)(v23 - *(void *)a7) >> 3);
          if (2 * v27 > v26) {
            unint64_t v26 = 2 * v27;
          }
          if (v27 >= 0x20C49BA5E353F7) {
            unint64_t v28 = 0x4189374BC6A7EFLL;
          }
          else {
            unint64_t v28 = v26;
          }
          v48 = (char *)a7 + 16;
          if (v28) {
            unint64_t v28 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::Candidate>>(v28);
          }
          else {
            uint64_t v29 = 0;
          }
          v30 = (char *)(v28 + 1000 * v25);
          unint64_t v44 = v28;
          v45 = v30;
          unint64_t v47 = v28 + 1000 * v29;
          KB::Candidate::Candidate((KB::Candidate *)v30, (const KB::Candidate *)v37);
          v46 = v30 + 1000;
          std::vector<KB::Candidate>::__swap_out_circular_buffer((uint64_t *)a7, &v44);
          v24 = (char *)*((void *)a7 + 1);
          std::__split_buffer<KB::Candidate>::~__split_buffer((uint64_t)&v44);
        }
        else
        {
          v24 = (char *)KB::Candidate::Candidate(v22, (const KB::Candidate *)v37) + 1000;
        }
        *((void *)a7 + 1) = v24;
        [v11 setObject:v16 forKeyedSubscript:v17];
        KB::Candidate::~Candidate((KB::Candidate *)v37);
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v13);
  }
}

- (id)scoreAndResortCandidates:(id)a3 string:(id)a4 geometryScore:(float)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v44 = 0;
  memset(v42, 0, sizeof(v42));
  memset(v43, 0, sizeof(v43));
  id v10 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  *(_OWORD *)__p = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v39);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v40);
  memset(v41, 0, 24);
  int v34 = 0;
  nativeModelManager = self->_nativeModelManager;
  uint64_t v12 = [(TIKeyboardInputManager *)self keyboardState];
  uint64_t v13 = [v12 documentState];
  uint64_t v14 = [v13 contextBeforeInput];
  KB::utf8_string(v14, (uint64_t)&v45);
  [(TIKeyboardInputManager *)nativeModelManager tokenizeString:&v45 context:&v35 sentences:&v34];
  if (v46 && BYTE6(v45) == 1) {
    free(v46);
  }

  long long v33 = v9;
  *(float *)&double v15 = a5;
  [(TIKeyboardInputManagerTransliteration *)self processCandidates:v8 withGeometryScore:v9 originalLatinString:&v35 context:v42 intoCandidateCollection:v10 intoStringCandidateMap:v15];
  [(TIKeyboardInputManager *)self->_nativeModelManager scoreCandidates:v42];
  uint64_t v16 = 0x1CAC083126E978D5 * ((uint64_t)(v42[1] - v42[0]) >> 3);
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v16];
  int v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v16];
  uint64_t v19 = v42[1];
  for (uint64_t i = v42[0]; i != v19; i += 1000)
  {
    int v21 = NSString;
    int v22 = *(unsigned __int16 *)(i + 888);
    if (!*(_WORD *)(i + 888))
    {
      KB::Candidate::compute_string((KB::Candidate *)i);
      int v22 = *(unsigned __int16 *)(i + 888);
    }
    unint64_t v23 = *(const char **)(i + 896);
    if (!v23) {
      unint64_t v23 = (const char *)(i + 904);
    }
    if (v22) {
      v24 = v23;
    }
    else {
      v24 = "";
    }
    uint64_t v25 = [v21 stringWithUTF8String:v24];
    unint64_t v26 = [v10 objectForKeyedSubscript:v25];
    if (([v18 containsObject:v25] & 1) == 0)
    {
      if (*(void *)i)
      {
        uint64_t v28 = 240 * *(void *)i;
        uint64_t v29 = (float *)(*(void *)(i + 8) + 56);
        LODWORD(v27) = 1.0;
        do
        {
          float v30 = *v29;
          v29 += 60;
          *(float *)&double v27 = *(float *)&v27 * v30;
          v28 -= 240;
        }
        while (v28);
      }
      else
      {
        LODWORD(v27) = 1.0;
      }
      v31 = [NSNumber numberWithFloat:v27];
      [v26 setStaticLinguisticLikelihood:v31];

      [v17 addObject:v26];
      [v18 addObject:v25];
    }
  }
  v45 = (void **)v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v45);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v40);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v39);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*((void *)&v35 + 1)) {
    std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v35 + 1));
  }

  *(void *)&long long v35 = (char *)&v43[1] + 8;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v35);
  *(void *)&long long v35 = v43;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v35);
  *(void *)&long long v35 = &v42[3];
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v35);
  *(void *)&long long v35 = v42;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v35);

  return v17;
}

- (id)keyboardConfiguration
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerTransliteration;
  v3 = [(TIKeyboardInputManager *)&v9 keyboardConfiguration];
  v4 = [(TIKeyboardInputManager *)self config];
  v5 = [v4 inputMode];
  v6 = [v5 languageWithRegion];
  v10[0] = v6;
  v10[1] = @"en_IN";
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v3 setMultilingualLanguages:v7];

  return v3;
}

- (id)candidatesForInputString:(id)a3 transliterator:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (![v5 length])
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_30;
  }
  id v43 = v5;
  id v7 = v5;
  uint64_t i = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v9 = [v7 rangeOfCharacterFromSet:i options:8];
  uint64_t v11 = v10;

  uint64_t v40 = v7;
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v46 = 0;
    uint64_t v12 = v7;
  }
  else
  {
    v46 = objc_msgSend(v7, "substringWithRange:", v9, v11);
    uint64_t v12 = [v7 substringFromIndex:v9 + v11];
  }
  int v41 = [(TIKeyboardInputManagerTransliteration *)self candidateContextFromDocumentStateOnly];
  id v42 = v6;
  uint64_t v14 = objc_msgSend(v6, "generateCandidatesForInputWord:candidateContextStrings:maxCandidatesCount:", v12);
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v14;
  uint64_t v48 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (v48)
  {
    int v44 = v13;
    uint64_t v45 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        double v15 = v12;
        if (*(void *)v53 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v17 = [v16 transliteratedWord];
        uint64_t v18 = [obj firstObject];
        if (v16 == (void *)v18)
        {

          LODWORD(v20) = 0;
        }
        else
        {
          uint64_t v19 = (void *)v18;
          LODWORD(v20) = [v16 isExtensionCandidate];
        }
        if ([v16 type] == 3) {
          uint64_t v20 = v20 | 2;
        }
        else {
          uint64_t v20 = v20;
        }
        if ([v46 length])
        {
          uint64_t v21 = [v46 stringByAppendingString:v17];

          id v17 = (void *)v21;
        }
        id v22 = objc_alloc(MEMORY[0x1E4FAE3B8]);
        unint64_t v23 = [(TIKeyboardInputManager *)self inputString];
        v24 = [NSNumber numberWithUnsignedLongLong:v16];
        uint64_t v25 = v22;
        uint64_t v12 = v15;
        unint64_t v26 = (void *)[v25 initWithCandidate:v17 forInput:v23 latinCandidate:v15 mecabraCandidatePointerValue:v24 withFlags:v20];

        [v16 lmScore];
        *(float *)&double v27 = v27;
        [v26 setLmScore:v27];
        uint64_t v28 = [(TIKeyboardInputManagerTransliteration *)self transliteratorCandidateByMecabraCandidatePointerValue];
        uint64_t v29 = [NSNumber numberWithUnsignedLongLong:v16];
        [v28 setObject:v16 forKey:v29];

        [v16 seq2seqScore];
        *(float *)&double v30 = v30;
        [v26 setSeq2seqScore:v30];
        uint64_t v13 = v44;
        [v44 addObject:v26];
      }
      uint64_t v48 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v48);
  }

  id v6 = v42;
  if ([(TIKeyboardInputManagerTransliteration *)self prioritizeLatinCandidates]
    || ![v13 count])
  {
    uint64_t v31 = [v13 count];
    if (v31)
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __81__TIKeyboardInputManagerTransliteration_candidatesForInputString_transliterator___block_invoke;
      v50[3] = &unk_1E6E2C7B0;
      uint64_t i = (uint64_t)&v51;
      v32 = v40;
      id v51 = v40;
      uint64_t v33 = [v13 indexOfObjectPassingTest:v50];
      if (v33 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v34 = v33;
        long long v35 = [v13 objectAtIndexedSubscript:v33];
        [v13 removeObjectAtIndex:v34];
        [v13 insertObject:v35 atIndex:0];

LABEL_28:
        goto LABEL_29;
      }
    }
    else
    {
      v32 = v40;
    }
    long long v36 = (void *)MEMORY[0x1E4FAE318];
    long long v37 = [(TIKeyboardInputManager *)self inputString];
    long long v38 = [v36 candidateWithCandidate:v32 forInput:v37];

    [v13 insertObject:v38 atIndex:0];
    if (v31) {
      goto LABEL_28;
    }
  }
LABEL_29:

  id v5 = v43;
LABEL_30:

  return v13;
}

uint64_t __81__TIKeyboardInputManagerTransliteration_candidatesForInputString_transliterator___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 candidate];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)autocorrectionListForEmptyInputWithDesiredCandidateCount:(unint64_t)a3
{
  nativeModelManager = self->_nativeModelManager;
  id v6 = [(TIKeyboardInputManager *)self keyboardState];
  [(TIKeyboardInputManager *)nativeModelManager syncToKeyboardState:v6];

  id v7 = self->_nativeModelManager;

  return [(TIKeyboardInputManager *)v7 autocorrectionListForEmptyInputWithDesiredCandidateCount:a3];
}

- (id)generateTypingAutocorrectionsWithCandidateRange:(_NSRange)a3
{
  v3 = self;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)TIKeyboardInputManagerTransliteration;
  uint64_t v4 = -[TIKeyboardInputManager generateTypingAutocorrectionsWithCandidateRange:](&v57, sel_generateTypingAutocorrectionsWithCandidateRange_, a3.location, a3.length);
  id v5 = v4;
  int v6 = *((_DWORD *)v3->super.super.m_impl + 98);
  if ((v6 & 0x80000000) == 0)
  {
    id v7 = [v4 corrections];
    id v8 = [v7 autocorrection];
    uint64_t v9 = [v8 candidate];
    uint64_t v10 = 0;
LABEL_5:

    goto LABEL_6;
  }
  uint64_t v9 = [(TIKeyboardInputManager *)v3 inputString];
  uint64_t v11 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  int v12 = [v11 autocorrectionEnabled];

  if (v12)
  {
    id v7 = [v5 corrections];
    id v8 = [v7 autocorrection];
    uint64_t v10 = [v8 candidate];
    goto LABEL_5;
  }
  uint64_t v10 = 0;
LABEL_6:
  id v51 = (void *)v10;
  long long v52 = (void *)v9;
  if (v9 == v10) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v10;
  }
  uint64_t v14 = [(TIKeyboardInputManagerTransliteration *)v3 candidatesWithTypedString:v9 autocorrectedString:v13];
  double v15 = (void *)[v14 mutableCopy];

  if (![v15 count])
  {
    long long v35 = [v5 candidates];
    uint64_t v36 = [v35 count];

    if (v36)
    {
      id v37 = v5;
      goto LABEL_46;
    }
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v17 = v16;
  v50 = v5;
  if ((v6 & 0x80000000) == 0)
  {
    uint64_t v48 = v16;
    uint64_t v49 = v3;
    uint64_t v18 = [v5 corrections];
    uint64_t v19 = [v18 autocorrection];

    if ([v15 count])
    {
      for (unint64_t i = 0; i < [v15 count]; ++i)
      {
        uint64_t v21 = [v15 objectAtIndexedSubscript:i];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = v21;
          [v22 setContinuousPathConversion:1];
          objc_msgSend(v22, "setShouldInsertSpaceAfterSelection:", objc_msgSend(v19, "shouldInsertSpaceAfterSelection"));
          if (!i) {
            goto LABEL_15;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_20;
          }
          [v21 setContinuousPathConversion:1];
          if (!i) {
LABEL_15:
          }
            objc_msgSend(v21, "setShouldAccept:", objc_msgSend(v19, "shouldAccept"));
        }

LABEL_20:
        if (i)
        {
          unint64_t v23 = [v21 candidate];
          v24 = [v15 objectAtIndexedSubscript:0];
          uint64_t v25 = [v24 candidate];
          unint64_t v26 = [v21 candidateByReplacingWithCandidate:v23 input:v25];

          [v15 setObject:v26 atIndexedSubscript:i];
        }
      }
    }
    id v17 = v48;
    if ([v15 count])
    {
      if (v19)
      {
        double v27 = [v19 candidate];
        uint64_t v28 = [v15 objectAtIndexedSubscript:0];
        uint64_t v29 = [v28 candidate];
        double v30 = [v19 candidateByReplacingWithCandidate:v27 input:v29];

        if (v30)
        {
          [v48 insertObject:v30 atIndex:0];
        }
      }
    }

    v3 = v49;
  }
  if (!(*(unsigned int (**)(void))(**((void **)v3->super.super.m_impl + 23) + 232))(*((void *)v3->super.super.m_impl + 23)))
  {
    uint64_t v33 = 0;
    uint64_t v34 = v17;
    id v17 = v15;
    goto LABEL_34;
  }
  id v31 = objc_alloc(MEMORY[0x1E4FAE2A0]);
  v32 = [v15 firstObject];
  uint64_t v33 = (void *)[v31 initWithAutocorrection:v32 alternateCorrections:0];

  if ((unint64_t)[v15 count] >= 2)
  {
    uint64_t v34 = objc_msgSend(v15, "subarrayWithRange:", 1, objc_msgSend(v15, "count") - 1);
    [v17 addObjectsFromArray:v34];
LABEL_34:
  }
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v40 = v17;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v54 != v43) {
          objc_enumerationMutation(v40);
        }
        id v45 = *(id *)(*((void *)&v53 + 1) + 8 * j);
        if ([v45 isEmojiCandidate]) {
          v46 = v39;
        }
        else {
          v46 = v38;
        }
        [v46 addObject:v45];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v42);
  }

  id v37 = [MEMORY[0x1E4FAE278] listWithCorrections:v33 predictions:v38 emojiList:v39];

  id v5 = v50;
LABEL_46:

  return v37;
}

- (id)candidatesForInputString:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardInputManagerTransliteration *)self transliterator];
  int v6 = [(TIKeyboardInputManagerTransliteration *)self candidatesForInputString:v4 transliterator:v5];

  return v6;
}

- (id)sortedCandidatesFromTypedStringCandidates:(id)a3 autocorrectedStringCandidates:(id)a4 autocorrectedLatinString:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v47 = a5;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [v9 firstObject];
  objc_opt_class();
  id v45 = v9;
  v46 = v8;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_10;
  }
  int v12 = [v9 firstObject];

  if (!v12)
  {
LABEL_10:
    [v10 addObjectsFromArray:v8];
    goto LABEL_27;
  }
  uint64_t v13 = [v8 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v8 firstObject];

    if (v14)
    {
      [v14 lmScore];
      float v16 = v15;
      [v12 lmScore];
      uint64_t v43 = v14;
      int v44 = v12;
      if (v16 >= v17)
      {
        [v10 addObjectsFromArray:v8];
        uint64_t v19 = [v9 objectAtIndex:0];
        [v10 addObject:v19];

        id v9 = v8;
      }
      else
      {
        uint64_t v18 = [v9 objectAtIndex:0];
        [v10 addObject:v18];

        if (_os_feature_enabled_impl()) {
          [v10 addObject:v47];
        }
        [v10 addObjectsFromArray:v8];
      }
      id v20 = v9;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v53 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            unint64_t v26 = [(TIKeyboardInputManagerTransliteration *)self mecabraCandidatePointerValueWithCandidate:v25];
            if (v26)
            {
              double v27 = [(TIKeyboardInputManagerTransliteration *)self transliteratorCandidateByMecabraCandidatePointerValue];
              uint64_t v28 = [v27 objectForKey:v26];

              if ([v28 type] != 3) {
                [v10 addObject:v25];
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v22);
      }

      int v12 = v44;
      goto LABEL_26;
    }
  }
  else
  {
  }
  [v10 addObjectsFromArray:v9];
LABEL_26:

LABEL_27:
  uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
  double v30 = [MEMORY[0x1E4F1CA48] array];
  id v31 = [MEMORY[0x1E4F1CA80] set];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v32 = v10;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v49 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        id v38 = [v37 candidate];
        char v39 = [v31 containsObject:v38];

        if ((v39 & 1) == 0)
        {
          id v40 = [v37 candidate];
          [v31 addObject:v40];

          if ([v37 isExtensionCandidate]) {
            uint64_t v41 = v30;
          }
          else {
            uint64_t v41 = v29;
          }
          [v41 addObject:v37];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v34);
  }

  [v29 addObjectsFromArray:v30];

  return v29;
}

- (id)candidatesWithTypedString:(id)a3 autocorrectedCandidates:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 firstObject];
  uint64_t v21 = [v8 candidate];

  if ([v6 length])
  {
    id v9 = [(TIKeyboardInputManagerTransliteration *)self candidatesForInputString:v6];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        float v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) candidate];
        float v17 = [(TIKeyboardInputManagerTransliteration *)self candidatesForInputString:v16];
        [v10 addObjectsFromArray:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FAE318]) initWithCandidate:v21];
  uint64_t v19 = [(TIKeyboardInputManagerTransliteration *)self sortedCandidatesFromTypedStringCandidates:v9 autocorrectedStringCandidates:v10 autocorrectedLatinString:v18];

  return v19;
}

- (id)candidatesWithTypedString:(id)a3 autocorrectedString:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = (objc_class *)MEMORY[0x1E4FAE500];
    id v8 = a3;
    id v9 = (void *)[[v7 alloc] initWithCandidate:v6];
    v14[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v11 = [(TIKeyboardInputManagerTransliteration *)self candidatesWithTypedString:v8 autocorrectedCandidates:v10];
  }
  else
  {
    id v12 = a3;
    id v11 = [(TIKeyboardInputManagerTransliteration *)self candidatesWithTypedString:v12 autocorrectedCandidates:MEMORY[0x1E4F1CBF0]];
  }

  return v11;
}

- (id)mecabraCandidatePointerValueWithCandidate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 mecabraCandidatePointerValue];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (TLTransliterator)transliterator
{
  transliterator = self->_transliterator;
  if (!transliterator)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA20];
    id v5 = [(TIKeyboardInputManager *)self config];
    id v6 = [v5 inputMode];
    id v7 = [v6 languageWithRegion];
    id v8 = [v4 localeWithLocaleIdentifier:v7];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB0008]) initWithLocale:v8];
    uint64_t v10 = (TLTransliterator *)[objc_alloc(MEMORY[0x1E4FB0000]) initWithParameters:v9];
    id v11 = self->_transliterator;
    self->_transliterator = v10;

    transliterator = self->_transliterator;
  }

  return transliterator;
}

- (TLTransliterator)autocorrectionTransliterator
{
  autocorrectionTransliterator = self->_autocorrectionTransliterator;
  if (!autocorrectionTransliterator)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA20];
    id v5 = [(TIKeyboardInputManager *)self config];
    id v6 = [v5 inputMode];
    id v7 = [v6 languageWithRegion];
    id v8 = [v4 localeWithLocaleIdentifier:v7];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB0008]) initWithLocale:v8];
    [v9 setUseLanguageModel:0];
    [v9 setUseSeq2SeqModel:0];
    uint64_t v10 = (TLTransliterator *)[objc_alloc(MEMORY[0x1E4FB0000]) initWithParameters:v9];
    id v11 = self->_autocorrectionTransliterator;
    self->_autocorrectionTransliterator = v10;

    autocorrectionTransliterator = self->_autocorrectionTransliterator;
  }

  return autocorrectionTransliterator;
}

- (TLTransliterator)exactStringTransliterator
{
  exactStringTransliterator = self->_exactStringTransliterator;
  if (!exactStringTransliterator)
  {
    id v4 = (void *)MEMORY[0x1E4F1CA20];
    id v5 = [(TIKeyboardInputManager *)self config];
    id v6 = [v5 inputMode];
    id v7 = [v6 languageWithRegion];
    id v8 = [v4 localeWithLocaleIdentifier:v7];

    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB0008]) initWithLocale:v8];
    [v9 setUseLanguageModel:0];
    uint64_t v10 = (TLTransliterator *)[objc_alloc(MEMORY[0x1E4FB0000]) initWithParameters:v9];
    id v11 = self->_exactStringTransliterator;
    self->_exactStringTransliterator = v10;

    exactStringTransliterator = self->_exactStringTransliterator;
  }

  return exactStringTransliterator;
}

- (CandidateCollection)autocorrectionCandidateStrings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(TIKeyboardInputManager *)self keyboardState];
  if (([v5 autocorrectionEnabled] & 1) == 0)
  {

    goto LABEL_7;
  }
  id v6 = [(TIKeyboardInputManager *)self keyboardState];
  id v7 = [v6 textInputTraits];
  uint64_t v8 = [v7 autocorrectionType];

  if (v8 == 1)
  {
LABEL_7:
    retstr->var5 = 0;
    *(_OWORD *)&retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var2.var0 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var2.var0 = 0u;
    *(_OWORD *)&retstr->var2.var2.var0 = 0u;
    *(_OWORD *)&retstr->var3.var1 = 0u;
    return result;
  }
  uint64_t v10 = [(TIKeyboardInputManager *)self keyboardState];
  if ([v10 hardwareKeyboardMode])
  {
    BOOL v11 = [(TIKeyboardInputManager *)self isHardwareKeyboardAutocorrectionEnabled];

    if (v11) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }

LABEL_10:
  (*(void (**)(const KB::Candidate **__return_ptr, void *, void))(*(void *)self->super.super.m_impl + 16))(v13, self->super.super.m_impl, [(TIKeyboardInputManager *)self shiftContext]);
  KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)retstr, v13);
  if (v17)
  {
    if (v16[38] == 1) {
      free(v17);
    }
  }
  id v12 = (const KB::Candidate **)v16;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  id v12 = (const KB::Candidate **)&v15;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  id v12 = (const KB::Candidate **)&v14;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  id v12 = v13;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  return result;
}

- (void)loadFavoniusTypingModel
{
  id v3 = [(TIKeyboardInputManager *)self config];
  id v4 = [v3 inputMode];
  id v5 = [v4 autocorrectionLocaleIdentifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerTransliteration;
    [(TIKeyboardInputManager *)&v7 loadFavoniusTypingModel];
  }
}

- (shared_ptr<KB::LanguageModel>)loadNewLanguageModel
{
  id v32 = v2;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(TIKeyboardInputManager *)self config];
  unsigned int v30 = [v4 usesWordNgramModel];

  id v5 = [(TIKeyboardInputManager *)self config];
  if ([v5 usesAdaptation])
  {
    uint64_t v6 = [(TIKeyboardInputManager *)self dynamicResourcePath];
  }
  else
  {
    uint64_t v6 = 0;
  }

  objc_super v7 = [(TIKeyboardInputManager *)self config];
  id v31 = (void *)v6;
  if ([v7 usesCustomNgramModel])
  {
    uint64_t v8 = [(TIKeyboardInputManager *)self config];
    id v9 = [v8 ngramModelPath];
    v33[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  }
  else
  {
    uint64_t v10 = 0;
  }

  BOOL v11 = [(TIKeyboardInputManager *)self languageModelAssets];
  id v12 = [(TIKeyboardInputManagerTransliteration *)self dictionaryInputMode];
  uint64_t v13 = +[TITrialManagerProxy sharedManager];
  uint64_t v14 = [v12 locale];
  uint64_t v15 = [v13 encodedLMTrialParametersForLocale:v14];

  float v16 = [v12 preferredModelLocaleIdentifier];
  uint64_t v17 = [v12 preferredModelLocaleIsMultilingual];
  uint64_t v18 = [(TIKeyboardInputManagerBase *)self inputMode];
  char v19 = [v18 isSiriMode];
  LOBYTE(v29) = [v12 doesSupportInlineCompletion];
  BYTE2(v28) = v19;
  LOWORD(v28) = 0;
  id v20 = +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v16, v17, v10, v31, v11, v30, v28, v15, v29);

  uint64_t v21 = [(TIKeyboardInputManager *)self keyboardState];
  long long v22 = [v21 clientIdentifier];

  long long v23 = [(TIKeyboardInputManager *)self keyboardState];
  long long v24 = [v23 recipientIdentifier];

  long long v25 = [(TIKeyboardInputManagerTransliteration *)self lexiconLocales];
  if (v20)
  {
    [v20 loadStubLanguageModelForLanguageLocales:v25 withModelLocale:0 withAdaptationContext:0];
  }
  else
  {
    void *v32 = 0;
    v32[1] = 0;
  }

  result.__cntrl_ = v27;
  result.__ptr_ = v26;
  return result;
}

- (void)loadDictionaries
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (self->super.super.m_impl)
  {
    id v3 = [(TIKeyboardInputManagerBase *)self inputMode];
    id v4 = [v3 normalizedIdentifier];
    char v5 = [v4 isEqualToString:@"hi-Translit"];

    if (v5)
    {
      if (TICanLogMessageAtLevel_onceToken != -1) {
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
      }
      if (TICanLogMessageAtLevel_logLevel)
      {
        uint64_t v6 = TIOSLogFacility();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading/reloading dictionaries.", "-[TIKeyboardInputManagerTransliteration loadDictionaries]");
          LODWORD(buf[0]) = 138412290;
          *(void *)((char *)buf + 4) = v26;
          _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);
        }
      }
      m_impl = (TIInputManager *)self->super.super.m_impl;
      uint64_t v8 = [(TIKeyboardInputManagerTransliteration *)self dictionaryInputMode];
      id v9 = [v8 languageWithRegion];
      KB::utf8_string(v9, (uint64_t)buf);
      TIInputManager::set_locale_identifier(m_impl, (const KB::String *)buf);
      if (*((void *)&buf[0] + 1) && BYTE6(buf[0]) == 1) {
        free(*((void **)&buf[0] + 1));
      }

      uint64_t v10 = [(TIKeyboardInputManagerTransliteration *)self dictionaryInputMode];
      [(TIKeyboardInputManager *)self lexiconInfoForInputMode:v10];

      BOOL v11 = [(TIKeyboardInputManager *)self config];
      [v11 isTesting];

      id v12 = +[TIInputMode inputModeWithIdentifier:@"en_IN"];
      [(TIKeyboardInputManager *)self lexiconInfoForInputMode:v12];

      int v71 = 1061997773;
      int v58 = 1045220557;
      KB::String::String((KB::String *)buf, (const KB::String *)v59);
      KB::String::String((KB::String *)&v35, (const KB::String *)v61);
      KB::String::String((KB::String *)&v36, (const KB::String *)v64);
      KB::String::String((KB::String *)&v37, (const KB::String *)v66);
      KB::String::String((KB::String *)v38, (const KB::String *)v68);
      v38[4] = v70;
      int v39 = v71;
      KB::String::String((KB::String *)&v40, (const KB::String *)v46);
      KB::String::String((KB::String *)&v41, (const KB::String *)v48);
      KB::String::String((KB::String *)&v42, (const KB::String *)v51);
      KB::String::String((KB::String *)&v43, (const KB::String *)v53);
      KB::String::String((KB::String *)v44, (const KB::String *)v55);
      v44[4] = v57;
      int v45 = v58;
      uint64_t v13 = (char *)operator new(0x160uLL);
      uint64_t v14 = 0;
      v30.length = (uint64_t)v13;
      id v32 = v13 + 352;
      do
      {
        std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)&v13[v14 * 16], (uint64_t)&buf[v14]);
        v14 += 11;
      }
      while (v14 != 22);
      id v31 = v13 + 352;
      uint64_t v15 = 22;
      do
      {
        float v16 = &buf[v15];
        uint64_t v17 = *(void **)((char *)&v30.length + v15 * 16);
        if (v17 && *((unsigned char *)v16 - 42) == 1) {
          free(v17);
        }
        uint64_t v18 = (void *)*((void *)v16 - 9);
        if (v18 && *((unsigned char *)&buf[v15 - 4] - 10) == 1) {
          free(v18);
        }
        char v19 = &buf[v15];
        id v20 = (void *)*((void *)&buf[v15 - 6] - 1);
        if (v20 && *((unsigned char *)v19 - 106) == 1) {
          free(v20);
        }
        uint64_t v21 = (void *)*((void *)v19 - 17);
        if (v21 && *((unsigned char *)&buf[v15 - 8] - 10) == 1) {
          free(v21);
        }
        long long v22 = (void *)*((void *)&buf[v15 - 10] - 1);
        if (v22 && *((unsigned char *)&buf[v15 - 10] - 10) == 1) {
          free(v22);
        }
        v15 -= 11;
      }
      while (v15 * 16);
      if (v61[0] && v48[0])
      {
        long long v23 = self->super.super.m_impl;
        memset(&v30, 0, 24);
        std::vector<KB::LexiconInfo>::__init_with_size[abi:nn180100]<KB::LexiconInfo*,KB::LexiconInfo*>(&v30, v30.length, (uint64_t)v31, 0x2E8BA2E8BA2E8BA3 * ((uint64_t)&v31[-v30.length] >> 4));
        TIInputManager::load_dictionaries((uint64_t)v23, &v30);
      }
      uint64_t v24 = *((void *)self->super.super.m_impl + 28);
      if (!v24 || **(void **)(v24 + 8) == *(void *)(*(void *)(v24 + 8) + 8))
      {
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        long long v25 = TIOSLogFacility();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v27 = NSString;
          uint64_t v28 = [(TIKeyboardInputManagerTransliteration *)self dictionaryInputMode];
          uint64_t v29 = [v27 stringWithFormat:@"%s WARNING: Input manager failed to load static dictionary for: %@", "-[TIKeyboardInputManagerTransliteration loadDictionaries]", v28];
          LODWORD(buf[0]) = 138412290;
          *(void *)((char *)buf + 4) = v29;
          _os_log_debug_impl(&dword_1E3F0E000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);
        }
      }
      else
      {
        [(TIKeyboardInputManagerTransliteration *)self loadFavoniusTypingModel];
      }
      *(void *)&buf[0] = &v30.length;
      std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
      if (v56 && v55[6] == 1) {
        free(v56);
      }
      if (v54 && v53[6] == 1) {
        free(v54);
      }
      if (v52 && v51[6] == 1) {
        free(v52);
      }
      if (v50 && v49 == 1) {
        free(v50);
      }
      if (v47 && v46[6] == 1) {
        free(v47);
      }
      if (v69 && v68[6] == 1) {
        free(v69);
      }
      if (v67 && v66[6] == 1) {
        free(v67);
      }
      if (v65 && v64[6] == 1) {
        free(v65);
      }
      if (v63 && v62 == 1) {
        free(v63);
      }
      if (v60)
      {
        if (v59[6] == 1) {
          free(v60);
        }
      }
    }
    else
    {
      v33.receiver = self;
      v33.super_class = (Class)TIKeyboardInputManagerTransliteration;
      [(TIKeyboardInputManager *)&v33 loadDictionaries];
    }
  }
}

- (id)lexiconLocales
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(TIKeyboardInputManagerTransliteration *)self dictionaryInputMode];
  id v4 = [v3 locale];

  char v5 = [(TIKeyboardInputManagerBase *)self inputMode];
  uint64_t v6 = [v5 normalizedIdentifier];
  int v7 = [v6 isEqualToString:@"hi-Translit"];

  if (v7)
  {
    uint64_t v8 = +[TIInputMode inputModeWithIdentifier:@"en_IN"];
    id v9 = [v8 locale];

    v13[0] = v4;
    v13[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }
  else
  {
    id v12 = v4;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  }

  return v10;
}

- (id)dictionaryInputMode
{
  id v3 = [(TIKeyboardInputManager *)self config];
  id v4 = [v3 inputMode];
  char v5 = [v4 autocorrectionLocaleIdentifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    int v7 = [(TIKeyboardInputManager *)self config];
    uint64_t v8 = [v7 inputMode];
    id v9 = [v8 autocorrectionLocaleIdentifier];
    uint64_t v10 = +[TIInputMode inputModeWithIdentifier:v9];
  }
  else
  {
    uint64_t v10 = +[TIInputMode inputModeWithIdentifier:&stru_1F3F7A998];
  }

  return v10;
}

- (id)candidateContextFromDocumentStateOnly
{
  v2 = [(TIKeyboardInputManager *)self keyboardState];
  id v3 = [v2 documentState];
  id v4 = [v3 contextBeforeInput];
  char v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v6 = [v4 componentsSeparatedByCharactersInSet:v5];

  if ((unint64_t)[v6 count] > 0x20)
  {
    objc_msgSend(v6, "subarrayWithRange:", objc_msgSend(v6, "count") - 33, 32);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v6;
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)deleteFromInputWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [(TIKeyboardInputManagerTransliteration *)self transliteratorCandidateByMecabraCandidatePointerValue];
  [v5 removeAllObjects];

  uint64_t v6 = [(TIKeyboardInputManagerTransliteration *)self committedCandidates];
  [v6 removeAllObjects];

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerTransliteration;
  [(TIKeyboardInputManager *)&v7 deleteFromInputWithContext:v4];
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TIKeyboardInputManager *)self isWordLearningEnabled])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    uint64_t v8 = [(TIKeyboardInputManagerTransliteration *)self transliteratorCandidateByMecabraCandidatePointerValue];
    id v9 = [v6 mecabraCandidatePointerValue];
    uint64_t v10 = [v8 objectForKey:v9];

    if (v10)
    {
      BOOL v11 = [(TIKeyboardInputManagerTransliteration *)self committedCandidates];
      [v11 addObject:v10];
    }
    else
    {
LABEL_5:
      uint64_t v10 = [(TIKeyboardInputManagerTransliteration *)self committedCandidates];
      [v10 removeAllObjects];
    }

    id v12 = [(TIKeyboardInputManagerTransliteration *)self committedCandidates];
    unint64_t v13 = [v12 count];

    if (v13 >= 0xB)
    {
      uint64_t v14 = [(TIKeyboardInputManagerTransliteration *)self committedCandidates];
      uint64_t v15 = [(TIKeyboardInputManagerTransliteration *)self committedCandidates];
      objc_msgSend(v14, "removeObjectsInRange:", 0, objc_msgSend(v15, "count") - 10);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManagerTransliteration;
  float v16 = [(TIKeyboardInputManager *)&v18 handleAcceptedCandidate:v6 keyboardState:v7];

  return v16;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(id)objc_opt_class() transliteratorInputCharacterSet];
  LOBYTE(v3) = [v4 longCharacterIsMember:v3];

  return v3;
}

- (BOOL)hasInputToTransliterate
{
  uint64_t v3 = [(TIKeyboardInputManager *)self inputString];
  if ([v3 length]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = *((_DWORD *)self->super.super.m_impl + 98) >= 0;
  }

  return v4;
}

- (void)suspend
{
  uint64_t v3 = [(TIKeyboardInputManagerTransliteration *)self transliteratorCandidateByMecabraCandidatePointerValue];
  [v3 removeAllObjects];

  BOOL v4 = [(TIKeyboardInputManagerTransliteration *)self committedCandidates];
  [v4 removeAllObjects];

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerTransliteration;
  [(TIKeyboardInputManager *)&v5 suspend];
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManagerTransliteration;
  id v8 = a3;
  [(TIKeyboardInputManager *)&v11 syncToKeyboardState:v8 from:a4 afterContextChange:v5];
  id v9 = objc_msgSend(v8, "textInputTraits", v11.receiver, v11.super_class);

  uint64_t v10 = [v9 keyboardType];
  [(TIKeyboardInputManagerTransliteration *)self setPrioritizeLatinCandidates:(v10 & 0xFFFFFFFFFFFFFFFBLL) == 3];
}

- (id)keyEventMap
{
  uint64_t v3 = [(TIKeyboardInputManager *)self keyboardState];
  int v4 = [v3 hardwareKeyboardMode];

  if (v4) {
    id v5 = objc_alloc_init([(TIKeyboardInputManagerTransliteration *)self keyEventMapClass]);
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (Class)keyEventMapClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isTransliterationManager
{
  return 1;
}

- (void)initImplementation
{
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerTransliteration;
  uint64_t v3 = [(TIKeyboardInputManagerTransliterationBase *)&v17 initImplementation];
  int v4 = [(TIKeyboardInputManagerBase *)self inputMode];
  id v5 = [v4 locale];
  id v6 = (std::__shared_weak_count *)operator new(0x28uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F3F76B78;
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F3F73A58;
  v6[1].__shared_owners_ = (uint64_t)v5;
  if (v5)
  {
    CFRetain(v5);
    v6[1].__shared_owners_ = (uint64_t)v5;
  }
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1F3F76BB0;

  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  v3[68] = v6 + 1;
  id v7 = (std::__shared_weak_count *)v3[69];
  v3[69] = v6;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
  uint64_t v8 = v3[23];
  if (v8)
  {
    (*(void (**)(atomic_uint **__return_ptr))(*(void *)v8 + 168))(&v21);
    if (v21)
    {
      unsigned int v9 = atomic_load((unsigned int *)v21 + 2);
      if (v9 == 1) {
        (*(void (**)(void))(*(void *)v21 + 40))();
      }
      else {
        atomic_fetch_add(v21 + 2, 0xFFFFFFFF);
      }
      uint64_t v10 = v3[68];
      objc_super v11 = *(atomic_uint **)TIInputManager::favonius_layout((TIInputManager *)v3);
      id v20 = v11;
      if (v11) {
        atomic_fetch_add(v11, 1u);
      }
      (*(void (**)(atomic_uint **__return_ptr, uint64_t, atomic_uint **))(*(void *)v10 + 16))(&v21, v10, &v20);
      if (v20) {
        WTF::RefCounted<TI::Favonius::KeyboardLayout>::deref((uint64_t)v20);
      }
      (*(void (**)(unsigned int **__return_ptr))(*(void *)v3[23] + 168))(&v19);
      id v12 = (unsigned int *)v21;
      uint64_t v21 = 0;
      objc_super v18 = v12;
      (*(void (**)(unsigned int *, unsigned int **))(*(void *)v19 + 24))(v19, &v18);
      if (v18)
      {
        unsigned int v13 = atomic_load(v18 + 2);
        if (v13 == 1) {
          (*(void (**)(void))(*(void *)v18 + 8))();
        }
        else {
          atomic_fetch_add((atomic_uint *volatile)v18 + 2, 0xFFFFFFFF);
        }
      }
      if (v19)
      {
        unsigned int v14 = atomic_load(v19 + 2);
        if (v14 == 1) {
          (*(void (**)(void))(*(void *)v19 + 40))();
        }
        else {
          atomic_fetch_add((atomic_uint *volatile)v19 + 2, 0xFFFFFFFF);
        }
      }
      if (v21)
      {
        unsigned int v15 = atomic_load((unsigned int *)v21 + 2);
        if (v15 == 1) {
          (*(void (**)(void))(*(void *)v21 + 8))();
        }
        else {
          atomic_fetch_add(v21 + 2, 0xFFFFFFFF);
        }
      }
    }
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  std::__shared_weak_count::__release_shared[abi:nn180100](v6);
  return v3;
}

- (TIKeyboardInputManagerTransliteration)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TIKeyboardInputManagerTransliteration;
  id v7 = [(TIKeyboardInputManager *)&v19 initWithConfig:v6 keyboardState:a4];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    transliteratorCandidateByMecabraCandidatePointerValue = v7->_transliteratorCandidateByMecabraCandidatePointerValue;
    v7->_transliteratorCandidateByMecabraCandidatePointerValue = (NSMapTable *)v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    committedCandidates = v7->_committedCandidates;
    v7->_committedCandidates = v10;

    id v12 = [v6 inputMode];
    unsigned int v13 = [v12 normalizedIdentifier];
    unsigned int v14 = TIInputModeGetLanguage();

    unsigned int v15 = +[TIInputMode inputModeWithIdentifier:v14];
    float v16 = [[TIKeyboardInputManager alloc] initWithInputMode:v15 keyboardState:0];
    nativeModelManager = v7->_nativeModelManager;
    v7->_nativeModelManager = v16;
  }
  return v7;
}

+ (id)transliteratorInputCharacterSet
{
  if (+[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__onceToken != -1) {
    dispatch_once(&+[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__onceToken, &__block_literal_global_13144);
  }
  v2 = (void *)+[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__transliteratorInputCharacterSet;

  return v2;
}

uint64_t __72__TIKeyboardInputManagerTransliteration_transliteratorInputCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];
  uint64_t v1 = +[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__transliteratorInputCharacterSet;
  +[TIKeyboardInputManagerTransliteration transliteratorInputCharacterSet]::__transliteratorInputCharacterSet = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end