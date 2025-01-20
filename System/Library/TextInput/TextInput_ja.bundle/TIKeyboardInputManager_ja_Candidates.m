@interface TIKeyboardInputManager_ja_Candidates
+ (id)sortTitleFromSort:(unint64_t)a3;
+ (unint64_t)sortFromSortTitle:(id)a3;
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3;
- (BOOL)autoSelectFirstCandidate;
- (BOOL)delayedCandidateList;
- (BOOL)hardwareKeyboardMode;
- (BOOL)makeCandidatesWithInputString:(id)a3 autoCommitString:(id)a4 contextString:(id)a5 predictionEnabled:(BOOL)a6 reanalysisMode:(BOOL)a7 singlePhrase:(BOOL)a8 geometoryModelData:(id)a9;
- (BOOL)showsPartialCandidate;
- (BOOL)supportsCandidateGeneration;
- (BOOL)usesLiveConversion;
- (NSString)autoCommitString;
- (NSString)autoSelectCandidate;
- (NSString)inputString;
- (TICandidateSorter)candidateSorter;
- (TIKeyboardCandidate)defaultCandidate;
- (TIKeyboardInputManager_ja_Candidates)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5;
- (id)candidateResultSetFromCandidates:(id)a3;
- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4;
- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4;
- (id)keyboardConfiguration;
- (id)sortingMethods;
- (id)titleForSortingMethod:(id)a3;
- (id)transliterationCandidates;
- (id)wordSearch;
- (int64_t)autoSelectTransliterateCandidate;
- (int64_t)indexFromTransliterationType:(int64_t)a3;
- (int64_t)transliterationCandidatesCount;
- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4;
- (void)setAutoCommitString:(id)a3;
- (void)setAutoSelectCandidate:(id)a3;
- (void)setAutoSelectFirstCandidate:(BOOL)a3;
- (void)setAutoSelectTransliterateCandidate:(int64_t)a3;
- (void)setCandidateSorter:(id)a3;
- (void)setDefaultCandidate:(id)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setInputString:(id)a3;
- (void)setShowsPartialCandidate:(BOOL)a3;
@end

@implementation TIKeyboardInputManager_ja_Candidates

- (TIKeyboardInputManager_ja_Candidates)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManager_ja_Candidates;
  v10 = [(TIKeyboardInputManagerMecabra *)&v15 initWithConfig:a3 keyboardState:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_wordSearch, a5);
    v12 = objc_alloc_init(TICandidateSorter);
    candidateSorter = v11->_candidateSorter;
    v11->_candidateSorter = v12;

    [(TICandidateSorter *)v11->_candidateSorter setLiveConversionEnabled:1];
    v11->_hardwareKeyboardMode = 1;
  }

  return v11;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  if (![v4 transliterationType])
  {
    v5 = [v4 string];
    char v6 = [v5 _isSpace];

    if ((v6 & 1) == 0)
    {
      if ([v4 isBackspace]) {
        [(TIKeyboardInputManagerMecabra *)self cancelComposition];
      }
      else {
        [(TIKeyboardInputManagerMecabra *)self completeComposition];
      }
    }
  }

  return 0;
}

- (id)keyboardConfiguration
{
  return 0;
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (BOOL)makeCandidatesWithInputString:(id)a3 autoCommitString:(id)a4 contextString:(id)a5 predictionEnabled:(BOOL)a6 reanalysisMode:(BOOL)a7 singlePhrase:(BOOL)a8 geometoryModelData:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a6;
  id v15 = a3;
  v16 = (__CFString *)a4;
  objc_storeStrong((id *)&self->_inputString, a3);
  id v17 = a9;
  id v18 = a5;
  if (v16) {
    v19 = v16;
  }
  else {
    v19 = &stru_26F5DD710;
  }
  objc_storeStrong((id *)&self->_autoCommitString, v19);
  v20 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  v21 = [(TIKeyboardInputManager_ja_Candidates *)self wordSearch];
  v22 = [v18 stringByAppendingString:v19];

  BYTE2(v29) = [(TIKeyboardInputManager_ja_Candidates *)self hardwareKeyboardMode];
  LOWORD(v29) = 0;
  LOBYTE(v28) = 0;
  v23 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v20, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v21, v15, 0, v22, 0x7FFFFFFFFFFFFFFFLL, v10, v28, 0, self, sel__notifyUpdateCandidates_forOperation_, v17, v29, 0);

  [(TIWordSearchJapaneseOperationGetCandidates *)v23 setSinglePhrase:v9];
  v24 = [(TIWordSearchJapaneseOperationGetCandidates *)v23 results];

  if (v24)
  {
    v25 = [(TIWordSearchJapaneseOperationGetCandidates *)v23 results];
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v25];

    v26 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    [(TIKeyboardInputManager_ja_Candidates *)self _notifyUpdateCandidates:v26 forOperation:v23];
  }
  else
  {
    [(TIWordSearch *)self->_wordSearch performOperationAsync:v23];
  }

  return 0;
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  -[TIKeyboardInputManagerMecabra setWordSearchCandidateResultSet:](self, "setWordSearchCandidateResultSet:", a3, a4);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__TIKeyboardInputManager_ja_Candidates__notifyUpdateCandidates_forOperation___block_invoke;
  v7[3] = &unk_2650FA938;
  v7[4] = self;
  v5 = (void *)MEMORY[0x24563C640](v7);
  char v6 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  [(TIKeyboardInputManagerMecabra *)self addProactiveTriggers:v6 withCompletionHandler:v5];
}

- (id)transliterationCandidates
{
  if ([(TIKeyboardInputManager_ja_Candidates *)self hardwareKeyboardMode])
  {
    v3 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    for (uint64_t i = 0; i != 5; ++i)
    {
      uint64_t v5 = kTransliterationCandidatesTypes[i];
      char v6 = [(TIKeyboardInputManager_ja_Candidates *)self inputString];
      v7 = TIJapaneseTransliterate(v6, v5);

      v8 = [(TIKeyboardInputManager_ja_Candidates *)self autoCommitString];
      BOOL v9 = [v8 stringByAppendingString:v7];

      id v10 = objc_alloc(MEMORY[0x263F7E690]);
      v11 = [(TIKeyboardInputManager_ja_Candidates *)self inputString];
      v12 = (void *)[v10 initWithCandidate:v9 forInput:v11 label:v7 transliterationType:v5];
      [v3 addObject:v12];
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  return v3;
}

- (int64_t)indexFromTransliterationType:(int64_t)a3
{
  int64_t result = 0;
  while (kTransliterationCandidatesTypes[result] != a3)
  {
    if (++result == 5) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  v7 = (void *)MEMORY[0x263EFF980];
  v8 = [(TIKeyboardInputManager_ja_Candidates *)self transliterationCandidates];
  BOOL v9 = [v7 arrayWithArray:v8];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      uint64_t v25 = v11;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 mecabraCandidatePointerValue];
          uint64_t v16 = [v15 unsignedLongLongValue];

          id v17 = objc_alloc(MEMORY[0x263F7E698]);
          autoCommitString = self->_autoCommitString;
          v19 = [v14 candidate];
          v20 = [(NSString *)autoCommitString stringByAppendingString:v19];
          v21 = (void *)[v17 initWithMecabraCandidate:v16 candidate:v20];

          if ([(TIKeyboardInputManager_ja_Candidates *)self showsPartialCandidate]) {
            [v21 setPartialCandidate:0];
          }
          [v9 addObject:v21];

          uint64_t v11 = v25;
        }
        else
        {
          [v9 addObject:v14];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  v27.receiver = self;
  v27.super_class = (Class)TIKeyboardInputManager_ja_Candidates;
  v22 = [(TIKeyboardInputManager_ja_Candidates *)&v27 candidateResultSetFromCandidates:v9 proactiveTriggers:v24];
  +[TIKeyboardInputManager_ja addFullwidthAnnotationToResultSet:v22];

  return v22;
}

- (id)candidateResultSetFromCandidates:(id)a3
{
  return [(TIKeyboardInputManager_ja_Candidates *)self candidateResultSetFromCandidates:a3 proactiveTriggers:0];
}

- (BOOL)supportsCandidateGeneration
{
  return 0;
}

- (int64_t)transliterationCandidatesCount
{
  if ([(TIKeyboardInputManager_ja_Candidates *)self hardwareKeyboardMode]) {
    return 5;
  }
  else {
    return 0;
  }
}

+ (id)sortTitleFromSort:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_2650FA958[a3];
  }
}

+ (unint64_t)sortFromSortTitle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UI-Sort-Common"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"UI-Sort-Yomi"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"UI-Sort-Radical"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"UI-Sort-Facemark"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"UI-Sort-Emoji"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)titleForSortingMethod:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)sortingMethods
{
  unint64_t v4 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  uint64_t v5 = [v4 candidates];

  if ([v5 count])
  {
    id v6 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    for (uint64_t i = 0; i != 5; ++i)
    {
      v8 = objc_opt_class();
      uint64_t v9 = kCandidateSorts[i];
      uint64_t v10 = [v8 sortTitleFromSort:v9];
      if (v10)
      {
        uint64_t v11 = [(TIKeyboardInputManager_ja_Candidates *)self candidateSorter];
        uint64_t v12 = [(TIKeyboardInputManager_ja_Candidates *)self inputString];
        int v13 = [v11 hasCandidatesFromCandidates:v5 inputString:v12 sortedBy:v9 omittingEmoji:0];

        if (v13) {
          [v6 addObject:v10];
        }
      }
      else
      {
        v14 = [MEMORY[0x263F08690] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"TIKeyboardInputManager_ja_Candidates.m", 312, @"Invalid parameter not satisfying: %@", @"sortTitle != nil" object file lineNumber description];
      }
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v16 = [(id)objc_opt_class() sortTitleFromSort:0];
    id v6 = [v15 arrayWithObject:v16];
  }
  return v6;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = [(id)objc_opt_class() sortFromSortTitle:v8];
    uint64_t v10 = [(TIKeyboardInputManager_ja_Candidates *)self candidateSorter];
    uint64_t v11 = [(TIKeyboardInputManager_ja_Candidates *)self inputString];
    uint64_t v12 = [v10 candidatesFromCandidates:v7 inputString:v11 sortedBy:v9 omittingEmoji:0];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TIKeyboardInputManager_ja_Candidates.m", 323, @"Invalid parameter not satisfying: %@", @"sortTitle != nil" object file lineNumber description];
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  return [a3 isEqualToString:@"UI-Sort-Common"] ^ 1;
}

- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"UI-Sort-Yomi"]) {
    id v6 = &unk_26F5E1130;
  }
  else {
    id v6 = v5;
  }

  return v6;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  BOOL v5 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[TIKeyboardInputManager_ja_Candidates _adjustPhraseBoundaryInForwardDirection:granularity:]";
    __int16 v10 = 1024;
    BOOL v11 = v5;
    __int16 v12 = 1024;
    int v13 = a4;
    _os_log_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s  adjust phrase: %d %d", (uint8_t *)&v8, 0x18u);
  }
  [(TIKeyboardInputManagerMecabra *)self cancelComposition];
  return 0;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v5 = a3;
  id v6 = [(TIKeyboardInputManager_ja_Candidates *)self inputString];
  unint64_t v7 = [v6 length];
  int v8 = [v5 input];
  if (v7 <= [v8 length])
  {
    char v9 = 0;
  }
  else
  {
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass() ^ 1;
  }

  __int16 v10 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v5];
  BOOL v11 = [(TIKeyboardInputManager_ja_Candidates *)self wordSearch];
  [v11 performAccept:v10 isPartial:v9 & 1];

  [(TIKeyboardInputManagerMecabra *)self completeComposition];
  return 0;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (BOOL)showsPartialCandidate
{
  return self->_showsPartialCandidate;
}

- (void)setShowsPartialCandidate:(BOOL)a3
{
  self->_showsPartialCandidate = a3;
}

- (BOOL)autoSelectFirstCandidate
{
  return self->_autoSelectFirstCandidate;
}

- (void)setAutoSelectFirstCandidate:(BOOL)a3
{
  self->_autoSelectFirstCandidate = a3;
}

- (NSString)autoSelectCandidate
{
  return self->_autoSelectCandidate;
}

- (void)setAutoSelectCandidate:(id)a3
{
  self->_autoSelectCandidate = (NSString *)a3;
}

- (int64_t)autoSelectTransliterateCandidate
{
  return self->_autoSelectTransliterateCandidate;
}

- (void)setAutoSelectTransliterateCandidate:(int64_t)a3
{
  self->_autoSelectTransliterateCandidate = a3;
}

- (BOOL)hardwareKeyboardMode
{
  return self->_hardwareKeyboardMode;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  self->_hardwareKeyboardMode = a3;
}

- (TICandidateSorter)candidateSorter
{
  return self->_candidateSorter;
}

- (void)setCandidateSorter:(id)a3
{
}

- (NSString)inputString
{
  return self->_inputString;
}

- (void)setInputString:(id)a3
{
}

- (TIKeyboardCandidate)defaultCandidate
{
  return self->_defaultCandidate;
}

- (void)setDefaultCandidate:(id)a3
{
}

- (NSString)autoCommitString
{
  return self->_autoCommitString;
}

- (void)setAutoCommitString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoCommitString, 0);
  objc_storeStrong((id *)&self->_defaultCandidate, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_candidateSorter, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end