@interface TIKeyboardInputManager_zh_Candidates
- (BOOL)delayedCandidateList;
- (BOOL)hasIdeographicCandidates;
- (BOOL)makeCandidatesWithInputString:(id)a3 autoCommitString:(id)a4 predictionEnabled:(BOOL)a5 reanalysisMode:(BOOL)a6 geometoryModelData:(id)a7;
- (BOOL)shouldClearInputOnMarkedTextOutOfSync;
- (BOOL)skipLastCharacterCandidates;
- (BOOL)supportsCandidateGeneration;
- (BOOL)supportsNumberKeySelection;
- (BOOL)usesLiveConversion;
- (NSSet)autoSelectCandidates;
- (NSString)autoCommitString;
- (NSString)inputString;
- (NSString)syntheticCandidate;
- (TIKeyboardCandidate)defaultCandidate;
- (TIKeyboardInputManager_zh_Candidates)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5;
- (TIWordSearch)kbws;
- (TIWordSearchCandidateResultSet)lastCharacterCandidateResultSet;
- (TIWordSearchCandidateResultSet)wholePhraseCandidateResultSet;
- (id)candidateResultSetFromCandidateResultSet:(id)a3 lastCharacterCandidateResultSet:(id)a4;
- (id)candidateResultSetFromCandidates:(id)a3;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)inputStringForLastCharacter:(id)a3;
- (id)keyboardConfiguration;
- (id)punctuationCandiadtesFor:(id)a3 withAutoCommit:(id)a4;
- (void)_notifyLastCharacterCandidate:(id)a3 forOperation:(id)a4;
- (void)_notifyUpdateCandidates;
- (void)_notifyWholePhraseCandidate:(id)a3 forOperation:(id)a4;
- (void)mecabraCandidateRefFromCandidate:(id)a3;
- (void)performWordSearch:(id)a3 action:(SEL)a4 waitUntilFinished:(BOOL)a5;
- (void)setAutoCommitString:(id)a3;
- (void)setAutoSelectCandidates:(id)a3;
- (void)setDefaultCandidate:(id)a3;
- (void)setInputString:(id)a3;
- (void)setLastCharacterCandidateResultSet:(id)a3;
- (void)setSkipLastCharacterCandidates:(BOOL)a3;
- (void)setSyntheticCandidate:(id)a3;
- (void)setWholePhraseCandidateResultSet:(id)a3;
@end

@implementation TIKeyboardInputManager_zh_Candidates

- (TIKeyboardInputManager_zh_Candidates)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_zh_Candidates;
  v10 = [(TIKeyboardInputManagerChinesePhonetic *)&v13 initWithConfig:a3 keyboardState:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_kbws, a5);
  }

  return v11;
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  return 0;
}

- (id)keyboardConfiguration
{
  return 0;
}

- (BOOL)makeCandidatesWithInputString:(id)a3 autoCommitString:(id)a4 predictionEnabled:(BOOL)a5 reanalysisMode:(BOOL)a6 geometoryModelData:(id)a7
{
  id v10 = a3;
  v11 = (__CFString *)a4;
  objc_storeStrong((id *)&self->_inputString, a3);
  if (v11) {
    v12 = v11;
  }
  else {
    v12 = &stru_26F5E6580;
  }
  objc_storeStrong((id *)&self->_autoCommitString, v12);
  objc_super v13 = [(TIKeyboardInputManager_zh_Candidates *)self inputStringForLastCharacter:self->_inputString];
  [(TIKeyboardInputManager_zh_Candidates *)self setWholePhraseCandidateResultSet:0];
  [(TIKeyboardInputManager_zh_Candidates *)self setLastCharacterCandidateResultSet:0];
  [(TIKeyboardInputManager_zh_Candidates *)self setSkipLastCharacterCandidates:v13 == 0];
  [(TIKeyboardInputManager_zh_Candidates *)self performWordSearch:v10 action:sel__notifyWholePhraseCandidate_forOperation_ waitUntilFinished:1];
  if (v13) {
    [(TIKeyboardInputManager_zh_Candidates *)self performWordSearch:v13 action:sel__notifyLastCharacterCandidate_forOperation_ waitUntilFinished:0];
  }

  return 0;
}

- (id)inputStringForLastCharacter:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 2)
  {
    v6 = 0;
  }
  else
  {
    v4 = [MEMORY[0x263F08708] zhuyinToneCharacterSet];
    uint64_t v5 = objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", v4, 4, 0, objc_msgSend(v3, "length") - 1);

    v6 = 0;
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = [v3 substringFromIndex:v5 + 1];
    }
  }

  return v6;
}

- (void)_notifyWholePhraseCandidate:(id)a3 forOperation:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __81__TIKeyboardInputManager_zh_Candidates__notifyWholePhraseCandidate_forOperation___block_invoke;
  v13[3] = &unk_2650FE730;
  objc_copyWeak(&v15, &location);
  id v14 = v5;
  id v6 = v5;
  v7 = (void *)MEMORY[0x24563E920](v13);
  objc_initWeak(&from, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__TIKeyboardInputManager_zh_Candidates__notifyWholePhraseCandidate_forOperation___block_invoke_2;
  v9[3] = &unk_2650FE758;
  objc_copyWeak(&v11, &from);
  id v10 = v7;
  id v8 = v7;
  [(TIKeyboardInputManagerMecabra *)self addStickers:v6 withCompletionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_notifyLastCharacterCandidate:(id)a3 forOperation:(id)a4
{
  -[TIKeyboardInputManager_zh_Candidates setLastCharacterCandidateResultSet:](self, "setLastCharacterCandidateResultSet:", a3, a4);
  [(TIKeyboardInputManager_zh_Candidates *)self _notifyUpdateCandidates];
}

- (void)_notifyUpdateCandidates
{
  uint64_t v3 = [(TIKeyboardInputManager_zh_Candidates *)self wholePhraseCandidateResultSet];
  if (v3)
  {
    v4 = (void *)v3;
    if ([(TIKeyboardInputManager_zh_Candidates *)self skipLastCharacterCandidates])
    {
    }
    else
    {
      id v5 = [(TIKeyboardInputManager_zh_Candidates *)self lastCharacterCandidateResultSet];

      if (!v5) {
        return;
      }
    }
    id v6 = [(TIKeyboardInputManager_zh_Candidates *)self wholePhraseCandidateResultSet];
    v7 = [(TIKeyboardInputManager_zh_Candidates *)self lastCharacterCandidateResultSet];
    id v10 = [(TIKeyboardInputManager_zh_Candidates *)self candidateResultSetFromCandidateResultSet:v6 lastCharacterCandidateResultSet:v7];

    id v8 = [v10 candidates];
    id v9 = [v8 firstObject];
    [v10 setDefaultCandidate:v9];

    [(TIKeyboardInputManager_zh_Candidates *)self closeCandidateGenerationContextWithResults:v10];
  }
}

- (id)candidateResultSetFromCandidateResultSet:(id)a3 lastCharacterCandidateResultSet:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  v56 = v8;
  id v53 = v7;
  id v54 = v6;
  if (v6)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v9 = [v6 candidates];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (!v10) {
      goto LABEL_13;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v63;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        id v15 = [v14 input];
        if ([v15 isEqualToString:self->_inputString])
        {
          v16 = [v14 label];
          char v17 = [v16 isEqualToString:self->_inputString];

          if (v17) {
            continue;
          }
          v18 = [v14 mecabraCandidatePointerValue];
          uint64_t v19 = [v18 unsignedLongLongValue];

          id v20 = objc_alloc(MEMORY[0x263F7E698]);
          autoCommitString = self->_autoCommitString;
          v22 = [v14 candidate];
          v23 = [(NSString *)autoCommitString stringByAppendingString:v22];
          id v15 = (void *)[v20 initWithMecabraCandidate:v19 candidate:v23];

          [v56 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v62 objects:v67 count:16];
      if (!v11)
      {
LABEL_13:

        v24 = [(TIKeyboardInputManager_zh_Candidates *)self punctuationCandiadtesFor:self->_inputString withAutoCommit:self->_autoCommitString];
        id v8 = v56;
        [v56 addObjectsFromArray:v24];

        id v7 = v53;
        id v6 = v54;
        break;
      }
    }
  }
  if (v7)
  {
    v25 = [(TIKeyboardInputManager_zh_Candidates *)self inputStringForLastCharacter:self->_inputString];
    v26 = [v6 candidates];
    v27 = [v26 firstObject];
    v28 = [v27 label];

    id v8 = v56;
    v52 = v28;
    v51 = [v28 _stringByTrimmingLastCharacter];
    v55 = -[NSString stringByAppendingString:](self->_autoCommitString, "stringByAppendingString:");
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v29 = [v7 candidates];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v59 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          v35 = [v34 label];
          char v36 = [v35 isEqualToString:v25];

          if ((v36 & 1) == 0)
          {
            v37 = [v34 mecabraCandidatePointerValue];
            uint64_t v38 = [v37 unsignedLongLongValue];

            id v39 = objc_alloc(MEMORY[0x263F7E698]);
            v40 = [v34 candidate];
            v41 = [v55 stringByAppendingString:v40];
            v42 = (void *)[v39 initWithMecabraCandidate:v38 candidate:v41];

            id v8 = v56;
            [v56 addObject:v42];
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v31);
    }

    v43 = [(TIKeyboardInputManager_zh_Candidates *)self punctuationCandiadtesFor:v25 withAutoCommit:v55];
    [v8 addObjectsFromArray:v43];

    id v7 = v53;
    id v6 = v54;
  }
  id v44 = objc_alloc(MEMORY[0x263F7E640]);
  v45 = [(TIKeyboardInputManager_zh_Candidates *)self syntheticCandidate];
  v46 = [(TIKeyboardInputManager_zh_Candidates *)self syntheticCandidate];
  v47 = (void *)[v44 initWithCandidate:v45 forInput:v46 rawInput:0 extensionCandidate:1];

  [v47 setTypingEngine:5];
  [v8 addObject:v47];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __113__TIKeyboardInputManager_zh_Candidates_candidateResultSetFromCandidateResultSet_lastCharacterCandidateResultSet___block_invoke;
  v57[3] = &unk_2650FE780;
  v57[4] = self;
  uint64_t v48 = [v8 indexOfObjectPassingTest:v57];
  if (v48 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v49 = [(TIKeyboardInputManager_zh_Candidates *)self candidateResultSetFromCandidates:v8];
  }
  else
  {
    [v8 exchangeObjectAtIndex:0 withObjectAtIndex:v48];
    v49 = [(TIKeyboardInputManager_zh_Candidates *)self candidateResultSetFromCandidates:v8];
    [v49 setInitialSelectedIndex:0];
  }

  return v49;
}

- (id)candidateResultSetFromCandidates:(id)a3
{
  return [(TIKeyboardInputManagerChinese *)self candidateResultSetFromCandidates:a3 proactiveTriggers:0];
}

- (BOOL)supportsCandidateGeneration
{
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  if ([a3 isBackspace]) {
    [(TIKeyboardInputManagerMecabra *)self cancelComposition];
  }
  return 0;
}

- (BOOL)supportsNumberKeySelection
{
  return 1;
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v5 = a3;
  id v6 = [(TIKeyboardInputManager_zh_Candidates *)self inputString];
  unint64_t v7 = [v6 length];
  id v8 = [v5 input];
  if (v7 <= [v8 length])
  {
    char v9 = 0;
  }
  else
  {
    objc_opt_class();
    char v9 = objc_opt_isKindOfClass() ^ 1;
  }

  uint64_t v10 = [(TIKeyboardInputManager_zh_Candidates *)self mecabraCandidateRefFromCandidate:v5];
  uint64_t v11 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  [v11 performAccept:v10 isPartial:v9 & 1];

  [(TIKeyboardInputManagerMecabra *)self completeComposition];
  return 0;
}

- (void)performWordSearch:(id)a3 action:(SEL)a4 waitUntilFinished:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (objc_class *)MEMORY[0x263F7E980];
  id v9 = a3;
  id v10 = [v8 alloc];
  LOBYTE(v14) = 1;
  BYTE2(v13) = 0;
  LOWORD(v13) = 1;
  id v15 = (id)objc_msgSend(v10, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", self->_kbws, v9, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v13, self, a4, MEMORY[0x263EFFA68], v14, 0);

  uint64_t v11 = [v15 results];

  if (v11)
  {
    uint64_t v12 = [v15 results];
    objc_msgSend(self, a4, v12, v15);
  }
  else
  {
    [(TIWordSearch *)self->_kbws performOperationAsync:v15];
    if (v5) {
      [v15 waitUntilFinished];
    }
  }
}

- (id)punctuationCandiadtesFor:(id)a3 withAutoCommit:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v24 = a4;
  id v6 = +[TIZhuyinPunctuationManager shareZhuyinPunctuationManager];
  unint64_t v7 = v5;
  id v8 = [v6 candidatesFor:v5];

  id v9 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v15 = objc_alloc(MEMORY[0x263F7E690]);
        v16 = [v14 candidate];
        char v17 = [v24 stringByAppendingString:v16];
        v18 = [v14 label];
        uint64_t v19 = (void *)[v15 initWithCandidate:v17 forInput:v7 label:v18];

        id v20 = [v14 alternativeText];
        [v19 setAlternativeText:v20];

        [v9 addObject:v19];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  v21 = (void *)[v9 copy];
  return v21;
}

- (BOOL)hasIdeographicCandidates
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInputManager_zh_Candidates;
  if (![(TIKeyboardInputManagerChinese *)&v26 hasIdeographicCandidates])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v4 = [(TIKeyboardInputManager_zh_Candidates *)self wholePhraseCandidateResultSet];
    id v5 = [v4 candidates];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
LABEL_5:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v22 + 1) + 8 * v9) candidate];
        char v11 = [v10 _containsIdeographicCharacters];

        if (v11) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v12 = [(TIKeyboardInputManager_zh_Candidates *)self lastCharacterCandidateResultSet];
      id v5 = [v12 candidates];

      uint64_t v3 = [v5 countByEnumeratingWithState:&v18 objects:v27 count:16];
      if (!v3)
      {
LABEL_21:

        return v3;
      }
      uint64_t v13 = *(void *)v19;
LABEL_13:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v5);
        }
        id v15 = [*(id *)(*((void *)&v18 + 1) + 8 * v14) candidate];
        char v16 = [v15 _containsIdeographicCharacters];

        if (v16) {
          break;
        }
        if (v3 == ++v14)
        {
          uint64_t v3 = [v5 countByEnumeratingWithState:&v18 objects:v27 count:16];
          if (v3) {
            goto LABEL_13;
          }
          goto LABEL_21;
        }
      }
    }
    LOBYTE(v3) = 1;
    goto LABEL_21;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (void)mecabraCandidateRefFromCandidate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_zh_Candidates;
  id v5 = [(TIKeyboardInputManagerMecabra *)&v13 mecabraCandidateRefFromCandidate:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !v5)
  {
    uint64_t v6 = [(TIKeyboardInputManager_zh_Candidates *)self wholePhraseCandidateResultSet];
    uint64_t v7 = [v6 candidateRefsDictionary];
    uint64_t v8 = [v4 mecabraCandidatePointerValue];
    id v5 = (id)[v7 objectForKey:v8];

    if (!v5)
    {
      uint64_t v9 = [(TIKeyboardInputManager_zh_Candidates *)self lastCharacterCandidateResultSet];
      uint64_t v10 = [v9 candidateRefsDictionary];
      char v11 = [v4 mecabraCandidatePointerValue];
      id v5 = (id)[v10 objectForKey:v11];
    }
  }

  return v5;
}

- (NSSet)autoSelectCandidates
{
  return self->_autoSelectCandidates;
}

- (void)setAutoSelectCandidates:(id)a3
{
}

- (NSString)syntheticCandidate
{
  return self->_syntheticCandidate;
}

- (void)setSyntheticCandidate:(id)a3
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

- (TIWordSearch)kbws
{
  return self->_kbws;
}

- (NSString)autoCommitString
{
  return self->_autoCommitString;
}

- (void)setAutoCommitString:(id)a3
{
}

- (TIWordSearchCandidateResultSet)wholePhraseCandidateResultSet
{
  return self->_wholePhraseCandidateResultSet;
}

- (void)setWholePhraseCandidateResultSet:(id)a3
{
}

- (TIWordSearchCandidateResultSet)lastCharacterCandidateResultSet
{
  return self->_lastCharacterCandidateResultSet;
}

- (void)setLastCharacterCandidateResultSet:(id)a3
{
}

- (BOOL)skipLastCharacterCandidates
{
  return *(&self->_skipLastCharacterCandidates + 4);
}

- (void)setSkipLastCharacterCandidates:(BOOL)a3
{
  *(&self->_skipLastCharacterCandidates + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCharacterCandidateResultSet, 0);
  objc_storeStrong((id *)&self->_wholePhraseCandidateResultSet, 0);
  objc_storeStrong((id *)&self->_autoCommitString, 0);
  objc_storeStrong((id *)&self->_kbws, 0);
  objc_storeStrong((id *)&self->_defaultCandidate, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_syntheticCandidate, 0);
  objc_storeStrong((id *)&self->_autoSelectCandidates, 0);
}

@end