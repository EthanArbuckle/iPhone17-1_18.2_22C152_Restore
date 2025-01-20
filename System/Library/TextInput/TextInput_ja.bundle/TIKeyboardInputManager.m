@interface TIKeyboardInputManager
@end

@implementation TIKeyboardInputManager

void __68__TIKeyboardInputManager_ja_Kana_validCharacterSetForAutocorrection__block_invoke()
{
  objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 12353, 84);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addCharactersInString:@"、。？！"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)-[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManager_ja_Kana validCharacterSetForAutocorrection]::__validCharSet = v0;
}

void __87__TIKeyboardInputManager_ja_Inline_openCandidateGenerationContextWithCandidateHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained removeInlineCandidate:v4];
  v5 = [WeakRetained markedText];
  [v4 setUncommittedText:v5];

  v6 = [WeakRetained inlineCandidate];
  [v4 setDefaultCandidate:v6];

  [*(id *)(a1 + 32) pushCandidateResultSet:v4];
}

uint64_t __58__TIKeyboardInputManager_ja_Inline_removeInlineCandidate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 candidate];
  uint64_t v4 = [*(id *)(a1 + 32) candidate];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = &stru_26F5DD710;
  }
  uint64_t v7 = [v3 isEqualToString:v6] ^ 1;

  return v7;
}

BOOL __51__TIKeyboardInputManager_ja_Romaji__convertToKana___block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

BOOL __51__TIKeyboardInputManager_ja_Romaji__convertToKana___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

void __52__TIKeyboardInputManager_ja_Romaji_deleteFromInput___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x263F7EA30];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = (id)[v5 initWithCharacters:v4 nearbyKeys:MEMORY[0x263EFFA68]];

  [v2 composeNew:v6];
}

void __70__TIKeyboardInputManager_ja_Romaji_validCharacterSetForAutocorrection__block_invoke()
{
  objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 97, 26);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addCharactersInString:@"ー、。？！「」()-/:@$&[]{}#%^*+=_;|<>”’€£.,？！・\\""];
  uint64_t v0 = [v2 copy];
  v1 = (void *)-[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManager_ja_Romaji validCharacterSetForAutocorrection]::__validCharSet = v0;
}

void __94__TIKeyboardInputManager_ja_SegmentPicker_openCandidateGenerationContextWithCandidateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) keyboardState];
  id v4 = [v3 inputForMarkedText];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) liveConversionSegments];
    [v5 buildMarkedText];

    id v6 = [*(id *)(a1 + 32) markedText];
    [v7 setUncommittedText:v6];
  }
  [*(id *)(a1 + 40) pushCandidateResultSet:v7];
}

void __77__TIKeyboardInputManager_ja_Candidates__notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 wordSearchCandidateResultSet];
  id v4 = [v2 candidateResultSetFromWordSearchCandidateResultSet:v3];

  id v5 = [v4 candidates];
  unint64_t v6 = [v5 count];
  unint64_t v7 = [*(id *)(a1 + 32) transliterationCandidatesCount];

  if (v6 > v7)
  {
    v8 = [v4 candidates];
    v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "transliterationCandidatesCount"));
    [v4 setDefaultCandidate:v9];
  }
  if ([*(id *)(a1 + 32) autoSelectTransliterateCandidate])
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "indexFromTransliterationType:", objc_msgSend(*(id *)(a1 + 32), "autoSelectTransliterateCandidate"));
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = v10;
      [v4 setInitialSelectedIndex:v10];
      v12 = [*(id *)(a1 + 32) transliterationCandidates];
      v13 = [v12 objectAtIndexedSubscript:v11];
      [v4 setDefaultCandidate:v13];
    }
  }
  uint64_t v14 = [*(id *)(a1 + 32) autoSelectCandidate];
  if (v14)
  {
    v15 = (void *)v14;
    uint64_t v16 = [v4 initialSelectedIndex];

    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __77__TIKeyboardInputManager_ja_Candidates__notifyUpdateCandidates_forOperation___block_invoke_2;
      v27 = &unk_2650FA910;
      uint64_t v28 = *(void *)(a1 + 32);
      id v17 = v4;
      id v29 = v17;
      v18 = (void *)MEMORY[0x24563C640](&v24);
      v19 = objc_msgSend(v17, "sortMethodGroups", v24, v25, v26, v27, v28);
      v20 = [v19 objectForKeyedSubscript:@"UI-Sort-Common"];
      v21 = [v20 firstObject];

      if (v21)
      {
        v22 = [v21 candidates];
        [v22 enumerateObjectsUsingBlock:v18];
      }
      if ([v17 initialSelectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = [v17 candidates];
        [v23 enumerateObjectsUsingBlock:v18];
      }
    }
  }
  if ([*(id *)(a1 + 32) autoSelectFirstCandidate]
    && [v4 initialSelectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "setInitialSelectedIndex:", objc_msgSend(*(id *)(a1 + 32), "transliterationCandidatesCount"));
  }
  [*(id *)(a1 + 32) closeCandidateGenerationContextWithResults:v4];
}

void __77__TIKeyboardInputManager_ja_Candidates__notifyUpdateCandidates_forOperation___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  unint64_t v7 = [v10 label];
  v8 = [*(id *)(a1 + 32) autoSelectCandidate];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    [*(id *)(a1 + 40) setInitialSelectedIndex:a3];
    [*(id *)(a1 + 40) setDefaultCandidate:v10];
    *a4 = 1;
  }
}

void __66__TIKeyboardInputManager_ja__notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 wordSearchCandidateResultSet];
  id v4 = [*(id *)(a1 + 32) rawInputString];
  [v2 updateProactiveCandidatesForCandidateResultSet:v3 withInput:v4];

  if ([*(id *)(a1 + 32) isTypologyEnabled]) {
    [*(id *)(a1 + 32) logInputString];
  }
  [*(id *)(a1 + 32) setMarkedText];
  id v5 = *(void **)(a1 + 32);
  unint64_t v6 = [v5 wordSearchCandidateResultSet];
  id v7 = [v5 candidateResultSetFromWordSearchCandidateResultSet:v6];

  [*(id *)(a1 + 32) closeCandidateGenerationContextWithResults:v7];
}

void __66__TIKeyboardInputManager_ja__notifyUpdateCandidates_forOperation___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addProactiveTriggers:v4 withCompletionHandler:*(void *)(a1 + 32)];
}

void __91__TIKeyboardInputManager_ja_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) groupedCandidatesFromCandidates:*(void *)(a1 + 40) usingSortingMethod:*(void *)(a1 + 48) inputString:*(void *)(a1 + 56)];
  v3 = [MEMORY[0x263F08A48] mainQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __91__TIKeyboardInputManager_ja_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke_2;
  v6[3] = &unk_2650FA9D8;
  id v4 = *(id *)(a1 + 64);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 addOperationWithBlock:v6];
}

uint64_t __91__TIKeyboardInputManager_ja_groupedCandidatesFromCandidates_usingSortingMethod_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __73__TIKeyboardInputManager_ja_addRecentlyCommittedCandidatesForReanalysis___block_invoke(uint64_t a1)
{
  Surface = (void *)MecabraCandidateGetSurface();
  uint64_t v3 = *(void *)(a1 + 32);
  return [Surface _containsSubstring:v3];
}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_cold_1(v5);
    }
  }
  else if (a2)
  {
    if (notificationQueue(void)::onceToken != -1) {
      dispatch_once(&notificationQueue(void)::onceToken, &__block_literal_global_366);
    }
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    TIDispatchAsync();
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v9 = "-[TIKeyboardInputManager_ja mecabraLearningValidator:]_block_invoke";
    __int16 v10 = 2080;
    uint64_t v11 = "-[TIKeyboardInputManager_ja mecabraLearningValidator:]_block_invoke";
    _os_log_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "%s  [%s]Notifications are disabled.", buf, 0x16u);
  }
}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_189(uint64_t a1)
{
  id v11 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  [v11 setTitle:@"Learning corruption detected"];
  [v11 setShouldIgnoreDoNotDisturb:1];
  [v11 setShouldIgnoreDowntime:1];
  [v11 setRelevanceScore:1.0];
  [v11 setInterruptionLevel:2];
  id v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F8C548]];

  id v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F8C550]];

  id v6 = [NSString stringWithFormat:@"We learned %@ as %@. If it's wrong, please report us.", v5, v3];
  [v11 setBody:v6];

  id v7 = (void *)MEMORY[0x263F1DF48];
  id v8 = objc_opt_new();
  int v9 = [v8 UUIDString];
  __int16 v10 = [v7 requestWithIdentifier:v9 content:v11 trigger:0];

  [*(id *)(a1 + 40) addNotificationRequest:v10 withCompletionHandler:&__block_literal_global_5];
}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_2_cold_1(v2);
  }
}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_cold_1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [a1 localizedDescription];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s  [%s]Error requesting notification authorization: %@", (uint8_t *)v2, 0x20u);
}

void __54__TIKeyboardInputManager_ja_mecabraLearningValidator___block_invoke_2_cold_1(void *a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1 = [a1 localizedDescription];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "%s  [%s]Notification posted with error: %@", (uint8_t *)v2, 0x20u);
}

@end