@interface TIWordSearchKana
+ (id)configureContactCollectionObserver:(id)a3 previousObserver:(id)a4;
+ (id)sharedMecabraWrapper;
+ (void)clearCachedContactObserver;
+ (void)resetSharedMecabraWrapper;
- (BOOL)_insertString:(id)a3 input:(id)a4 at:(unint64_t)a5 force:(BOOL)a6;
- (BOOL)flickOnly;
- (BOOL)isAnalyzingJapaneseRomaji;
- (BOOL)shouldMoveCursor:(id)a3;
- (BOOL)supportsPairedPunctutationInput;
- (TIWordSearchCandidateResultSet)candidateResultSet;
- (id)candidateForDefault:(id)a3 rawInputString:(id)a4;
- (id)candidatesCacheKeyForOperation:(id)a3;
- (id)initTIWordSearchWithInputMode:(id)a3;
- (id)initTIWordSearchWithInputMode:(id)a3 mecabraWrapper:(id)a4;
- (id)makeCandidates:(id)a3 input:(id)a4 contextString:(id)a5 predictionEnabled:(BOOL)a6 reanalysisMode:(BOOL)a7 withInputManager:(id)a8 geometryModelData:(id)a9 flickUsed:(BOOL)a10 hardwareKeyboardMode:(BOOL)a11 referenceMode:(BOOL)a12 singlePhrase:(BOOL)a13;
- (int)mecabraInputMethodType;
- (unint64_t)mecabraCreationOptions;
- (void)dealloc;
- (void)dynamicDictionariesRemoved:(id)a3;
- (void)setCandidateResultSet:(id)a3;
- (void)setFlickOnly:(BOOL)a3;
- (void)setInsertKatakanaAtIndex:(unint64_t)a3;
- (void)setSupportsPairedPunctutationInput:(BOOL)a3;
- (void)updateMecabraState;
@end

@implementation TIWordSearchKana

+ (id)sharedMecabraWrapper
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)__mecabraWrapper;
  if (!__mecabraWrapper)
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x263F7EB18]), "initWithInputMethodType:learningDictionaryDirectoryURL:creationOptions:", 1, objc_msgSend((id)objc_opt_class(), "mecabraLearningDictionaryDirectory"), 3);
    v5 = (void *)__mecabraWrapper;
    __mecabraWrapper = v4;

    uint64_t v6 = [(id)objc_opt_class() configureContactCollectionObserver:__mecabraWrapper previousObserver:__contactCollectionObserver];
    v7 = (void *)__contactCollectionObserver;
    __contactCollectionObserver = v6;

    uint64_t v8 = [(id)objc_opt_class() configureUserDictionaryObserver:__mecabraWrapper previousObserver:__userDictionaryObserver];
    v9 = (void *)__userDictionaryObserver;
    __userDictionaryObserver = v8;

    v3 = (void *)__mecabraWrapper;
  }
  id v10 = v3;
  objc_sync_exit(v2);

  return v10;
}

+ (void)resetSharedMecabraWrapper
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = (void *)__mecabraWrapper;
  __mecabraWrapper = 0;

  objc_sync_exit(obj);
}

+ (id)configureContactCollectionObserver:(id)a3 previousObserver:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() sharedOperationQueue];
  uint64_t v8 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIWordSearchKana:configureContactCollectionObserver - adding observer", "+[TIWordSearchKana configureContactCollectionObserver:previousObserver:]");
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_241DFD000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v10 = [MEMORY[0x263F7EB40] sharedInstance];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __72__TIWordSearchKana_configureContactCollectionObserver_previousObserver___block_invoke;
  v19[3] = &unk_2650FA760;
  id v11 = v7;
  id v20 = v11;
  id v12 = v5;
  id v21 = v12;
  v13 = [v10 addContactObserver:v19];

  if (v6)
  {
    v14 = TIPersonalizationContactOSLogFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIWordSearchKana:configureContactCollectionObserver - removing observer", "+[TIWordSearchKana configureContactCollectionObserver:previousObserver:]");
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_241DFD000, v14, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    v16 = [MEMORY[0x263F7EB40] sharedInstance];
    [v16 removeContactObserver:v6];
  }
  v17 = (void *)MEMORY[0x24563C640](v13);

  return v17;
}

void __72__TIWordSearchKana_configureContactCollectionObserver_previousObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s TITextCheckerExemptions:addObserverAssertion - processing %ld contacts", "+[TIWordSearchKana configureContactCollectionObserver:previousObserver:]_block_invoke", objc_msgSend(v3, "count"));
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_241DFD000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  id v6 = (void *)[v3 copy];

  v7 = (void *)MEMORY[0x263F7EB20];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__TIWordSearchKana_configureContactCollectionObserver_previousObserver___block_invoke_7;
  v11[3] = &unk_2650FA738;
  uint64_t v8 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v9 = v6;
  id v10 = [v7 blockOperationWithBlock:v11];
  [v8 addOperation:v10];
}

uint64_t __72__TIWordSearchKana_configureContactCollectionObserver_previousObserver___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) mecabraRef];
  uint64_t v2 = TICreateNameReadingPairsFromContactCollection();
  return MEMORY[0x270F99E50](v1, v2);
}

- (int)mecabraInputMethodType
{
  return 1;
}

- (unint64_t)mecabraCreationOptions
{
  return objc_opt_isKindOfClass() & 1 | 2;
}

- (id)initTIWordSearchWithInputMode:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() sharedMecabraWrapper];
  id v6 = [(TIWordSearchKana *)self initTIWordSearchWithInputMode:v4 mecabraWrapper:v5];

  return v6;
}

- (id)initTIWordSearchWithInputMode:(id)a3 mecabraWrapper:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TIWordSearchKana;
  id v4 = [(TIWordSearch *)&v10 initTIWordSearchWithInputMode:a3 mecabraWrapper:a4];
  id v5 = v4;
  if (v4)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__TIWordSearchKana_initTIWordSearchWithInputMode_mecabraWrapper___block_invoke;
    block[3] = &unk_2650FA788;
    id v6 = v4;
    id v9 = v6;
    if (-[TIWordSearchKana initTIWordSearchWithInputMode:mecabraWrapper:]::onceToken != -1) {
      dispatch_once(&-[TIWordSearchKana initTIWordSearchWithInputMode:mecabraWrapper:]::onceToken, block);
    }
    v6[11] = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

uint64_t __65__TIWordSearchKana_initTIWordSearchWithInputMode_mecabraWrapper___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDictionaryPaths];
}

- (void)dealloc
{
  [(TIWordSearch *)self completeOperationsInQueue];
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchKana;
  [(TIWordSearch *)&v3 dealloc];
}

- (void)setInsertKatakanaAtIndex:(unint64_t)a3
{
  self->_insertKatakanaAtIndex = a3;
}

- (BOOL)shouldMoveCursor:(id)a3
{
  id v4 = a3;
  if ([(TIWordSearchKana *)self supportsPairedPunctutationInput])
  {
    if (pairedPunctuations(void)::__onceToken != -1) {
      dispatch_once(&pairedPunctuations(void)::__onceToken, &__block_literal_global_0);
    }
    char v5 = [(id)pairedPunctuations(void)::__pairedPunctuations containsObject:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)candidateForDefault:(id)a3 rawInputString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(TIWordSearchKana *)self shouldMoveCursor:v7];
  id v9 = [MEMORY[0x263F7E640] candidateWithCandidate:v7 forInput:v6 cursorMovement:v8 << 63 >> 63];

  return v9;
}

- (BOOL)_insertString:(id)a3 input:(id)a4 at:(unint64_t)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = 0;
  if (v10 && a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v10 length])
    {
      id v13 = [(TIWordSearchKana *)self candidateResultSet];
      v14 = [v13 candidates];

      unint64_t v15 = [v14 count];
      if (v15 >= a5) {
        unint64_t v16 = a5;
      }
      else {
        unint64_t v16 = v15;
      }
      unint64_t v24 = v16;
      if (v15)
      {
        unint64_t v17 = v15;
        unint64_t v18 = 0;
        v19 = 0;
        while (1)
        {
          id v20 = v19;
          v19 = [v14 objectAtIndex:v18];

          id v21 = [v19 candidate];
          LODWORD(v20) = [v10 isEqualToString:v21];

          if (v20) {
            break;
          }
          if (v17 == ++v18) {
            goto LABEL_14;
          }
        }
        if (v24 >= v18 && v17 != v18 && !v6)
        {
          BOOL v12 = 0;
LABEL_21:

          goto LABEL_22;
        }
        v22 = [(TIWordSearchKana *)self candidateResultSet];
        [v22 moveCandidate:v19 fromIndex:v18 toIndex:v24];
      }
      else
      {
        v19 = 0;
LABEL_14:
        v22 = [(TIWordSearchKana *)self candidateResultSet];
        [v22 insertSyntheticMecabraCandidateWithSurface:v10 input:v11 atIndex:v24];
      }

      BOOL v12 = 1;
      goto LABEL_21;
    }
    BOOL v12 = 0;
  }
LABEL_22:

  return v12;
}

- (BOOL)isAnalyzingJapaneseRomaji
{
  return 0;
}

- (id)candidatesCacheKeyForOperation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 keyboardInput];
  if (!v4)
  {
    uint64_t v5 = [v3 inputString];
    goto LABEL_5;
  }
  if ([v4 hasKindOf:objc_opt_class()])
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lud", v4);
LABEL_5:
    BOOL v6 = (void *)v5;
    goto LABEL_8;
  }
  id v7 = [v4 asSearchString];
  BOOL v6 = objc_msgSend(v7, "stringByAppendingFormat:", @"%lud", objc_msgSend(v4, "asSearchTextCursorIndex"));

  if (![v6 length])
  {
    uint64_t v8 = [v4 asInlineText];

    BOOL v6 = (void *)v8;
  }
LABEL_8:
  if (([v3 phraseBoundarySet] & 1) != 0 || (objc_msgSend(v3, "predictionEnabled") & 1) == 0)
  {
    uint64_t v9 = [v6 stringByAppendingString:@" *"];

    BOOL v6 = (void *)v9;
  }
  if ([v3 allowIncompleteRomaji])
  {
    uint64_t v10 = [v6 stringByAppendingString:@" #"];

    BOOL v6 = (void *)v10;
  }
  if ([v3 referenceMode])
  {
    uint64_t v11 = [v6 stringByAppendingString:@" r"];

    BOOL v6 = (void *)v11;
  }
  if ([v3 segmentBreakIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = v6;
  }
  else
  {
    objc_msgSend(v6, "stringByAppendingFormat:", @" %ld", objc_msgSend(v3, "segmentBreakIndex"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v13 = v12;

  return v13;
}

- (id)makeCandidates:(id)a3 input:(id)a4 contextString:(id)a5 predictionEnabled:(BOOL)a6 reanalysisMode:(BOOL)a7 withInputManager:(id)a8 geometryModelData:(id)a9 flickUsed:(BOOL)a10 hardwareKeyboardMode:(BOOL)a11 referenceMode:(BOOL)a12 singlePhrase:(BOOL)a13
{
  BOOL v14 = a7;
  BOOL v15 = a6;
  id v19 = a3;
  unint64_t v20 = (unint64_t)a4;
  id v45 = a5;
  id v46 = a8;
  unint64_t v21 = (unint64_t)a9;
  id v22 = objc_alloc_init(MEMORY[0x263F7EB68]);
  if (v15) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = 2;
  }
  if ([(TIWordSearchKana *)self isAnalyzingJapaneseRomaji]) {
    v23 |= 0x100uLL;
  }
  BOOL v24 = [(TIWordSearch *)self shouldLearnAcceptedCandidate];
  uint64_t v25 = v23 | 0x80;
  if (v24) {
    uint64_t v25 = v23;
  }
  if (v14) {
    v25 |= 0x4000uLL;
  }
  if (!v14 || a12) {
    uint64_t v26 = v25 | 8;
  }
  else {
    uint64_t v26 = v25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!a10 && ![(TIWordSearchKana *)self flickOnly]) {
      v26 |= 0x1000000uLL;
    }
    if (![(TIWordSearchKana *)self flickOnly]) {
      v26 |= 0x4000000uLL;
    }
  }
  BOOL v27 = [(TIWordSearch *)self autoCorrects];
  uint64_t v28 = v26 | 0x40;
  if (v20 | v21) {
    uint64_t v29 = v26 | 0x40;
  }
  else {
    uint64_t v29 = v26;
  }
  if (!v15) {
    uint64_t v28 = v26;
  }
  if (a11) {
    uint64_t v29 = v28;
  }
  if (!v27) {
    uint64_t v29 = v26;
  }
  uint64_t v30 = v29 | a12;
  if (a13) {
    v30 |= 0x400000uLL;
  }
  if (a11) {
    uint64_t v31 = v30 | 0x20000000;
  }
  else {
    uint64_t v31 = v30;
  }
  v32 = [(TIWordSearch *)self mecabraEnvironment];
  [v32 setGeometryModel:v46 modelData:v21];

  if (![v19 length])
  {
    v33 = [(id)v20 inputs];
    uint64_t v34 = [v33 count];

    if (!v34)
    {
      v35 = [(TIWordSearch *)self mecabraEnvironment];
      [v35 setLeftDocumentContext:v45];

      v36 = [(TIWordSearch *)self mecabraEnvironment];
      [v36 adjustEnvironmentDirectly:0];
    }
  }
  v37 = [(TIWordSearch *)self mecabraEnvironment];
  v38 = v37;
  if (v20)
  {
    char v39 = [v37 analyzeInput:v20 options:v31];

    if ((v39 & 1) == 0) {
      goto LABEL_43;
    }
  }
  else
  {
    int v40 = [v37 analyzeString:v19 options:v31];

    if (!v40) {
      goto LABEL_43;
    }
  }
  [(TIWordSearch *)self mecabra];
  uint64_t NextCandidate = MecabraGetNextCandidate();
  if (NextCandidate)
  {
    uint64_t v42 = NextCandidate;
    do
    {
      v43 = objc_msgSend(objc_alloc(MEMORY[0x263F7E6A0]), "initWithMecabraCandidate:cursorMovement:", v42, -[TIWordSearchKana shouldMoveCursor:](self, "shouldMoveCursor:", MecabraCandidateGetSurface()) << 63 >> 63);
      [v22 addMecabraCandidate:v43 mecabraCandidateRef:v42];

      [(TIWordSearch *)self mecabra];
      uint64_t v42 = MecabraGetNextCandidate();
    }
    while (v42);
  }
LABEL_43:
  if (![v19 length]) {
    [(TIWordSearch *)self insertTopSupplementalCandidateSurroundingCursorToFrontOfResultSet:v22];
  }

  return v22;
}

- (void)updateMecabraState
{
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchKana;
  [(TIWordSearch *)&v3 updateMecabraState];
  [(TIWordSearch *)self updateUserWordEntries];
}

- (void)dynamicDictionariesRemoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIWordSearch *)self mecabraWrapper];
  v8.receiver = self;
  v8.super_class = (Class)TIWordSearchKana;
  [(TIWordSearch *)&v8 dynamicDictionariesRemoved:v4];

  BOOL v6 = [(id)objc_opt_class() sharedMecabraWrapper];

  if (v5 == v6) {
    [(id)objc_opt_class() resetSharedMecabraWrapper];
  }
  id v7 = [(id)objc_opt_class() sharedMecabraWrapper];
  [(TIWordSearch *)self setMecabraWrapper:v7];

  [(TIWordSearch *)self updateDictionaryPaths];
}

- (TIWordSearchCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setCandidateResultSet:(id)a3
{
}

- (BOOL)supportsPairedPunctutationInput
{
  return self->_supportsPairedPunctutationInput;
}

- (void)setSupportsPairedPunctutationInput:(BOOL)a3
{
  self->_supportsPairedPunctutationInput = a3;
}

- (BOOL)flickOnly
{
  return self->_flickOnly;
}

- (void)setFlickOnly:(BOOL)a3
{
  self->_flickOnly = a3;
}

- (void).cxx_destruct
{
}

+ (void)clearCachedContactObserver
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__contactCollectionObserver)
  {
    uint64_t v2 = TIPersonalizationContactOSLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_super v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s TIWordSearchKana:clearCachedContactObserver - removing observer", "+[TIWordSearchKana(TestingSupport) clearCachedContactObserver]");
      *(_DWORD *)buf = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_241DFD000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    id v4 = [MEMORY[0x263F7EB40] sharedInstance];
    [v4 removeContactObserver:__contactCollectionObserver];

    uint64_t v5 = (void *)__contactCollectionObserver;
    __contactCollectionObserver = 0;
  }
}

@end