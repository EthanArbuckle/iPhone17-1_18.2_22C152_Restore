@interface TIKeyboardInputManagerLiveConversion
@end

@implementation TIKeyboardInputManagerLiveConversion

void __77__TIKeyboardInputManagerLiveConversion_ja_validCharacterSetForAutocorrection__block_invoke()
{
  objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 97, 26);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addCharactersInString:@"ー"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)-[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__validCharSet = v0;
}

void __94__TIKeyboardInputManagerLiveConversion_ja_openCandidateGenerationContextWithCandidateHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTimer:0];
  id v2 = [*(id *)(a1 + 32) candidateHandlerForOpenRequest];
  [*(id *)(a1 + 32) setCandidateHandlerForOpenRequest:0];
  v3 = [*(id *)(a1 + 32) composingKeyboardInputManager];

  if (!v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = [TIKeyboardInputManager_ja_Candidates alloc];
    v6 = [*(id *)(a1 + 32) config];
    v7 = [*(id *)(a1 + 32) keyboardState];
    v8 = [*(id *)(a1 + 32) wordSearch];
    v9 = [(TIKeyboardInputManager_ja_Candidates *)v5 initWithConfig:v6 keyboardState:v7 wordSearch:v8];
    [v4 composeTextWith:v9];
  }
  uint64_t v10 = [*(id *)(a1 + 32) candidateRange];
  uint64_t v12 = v11;
  v13 = [*(id *)(a1 + 32) composingKeyboardInputManager];
  objc_msgSend(v13, "setCandidateRange:", v10, v12);

  v14 = [*(id *)(a1 + 32) composingKeyboardInputManager];
  id v15 = objc_alloc(MEMORY[0x263F7EA38]);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __94__TIKeyboardInputManagerLiveConversion_ja_openCandidateGenerationContextWithCandidateHandler___block_invoke_2;
  v21 = &unk_2650FA7B0;
  uint64_t v22 = *(void *)(a1 + 32);
  id v23 = v2;
  id v16 = v2;
  v17 = (void *)[v15 initWithWrappedCandidateHandler:v16 resultSetHandlerBlock:&v18];
  objc_msgSend(v14, "openCandidateGenerationContextWithCandidateHandler:", v17, v18, v19, v20, v21, v22);

  [*(id *)(a1 + 32) startPrediction];
}

void __94__TIKeyboardInputManagerLiveConversion_ja_openCandidateGenerationContextWithCandidateHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldShowPredictionCandidate:"))
  {
    [*(id *)(a1 + 32) addInlineCandidateIfNeeded:v13];
    v3 = [*(id *)(a1 + 32) keyboardState];
    v4 = [v3 inputForMarkedText];

    if (v4)
    {
      v5 = [*(id *)(a1 + 32) markedText];
      [v13 setUncommittedText:v5];
    }
    v6 = [*(id *)(a1 + 32) keyboardState];
    v7 = [v6 inputForMarkedText];

    if (v7)
    {
      v8 = [*(id *)(a1 + 32) markedText];
      [v13 setUncommittedText:v8];
    }
    if ([v13 initialSelectedIndex] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)MEMORY[0x263F7E640];
      uint64_t v10 = [*(id *)(a1 + 32) inputString];
      uint64_t v11 = [*(id *)(a1 + 32) rawInputString];
      uint64_t v12 = [v9 candidateWithCandidate:v10 forInput:v11];
      [v13 setDefaultCandidate:v12];
    }
    [*(id *)(a1 + 40) pushCandidateResultSet:v13];
  }
}

void __70__TIKeyboardInputManagerLiveConversion_ja_addInlineCandidateIfNeeded___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if ([v10 isPartialCandidate])
  {
    *a4 = 1;
    goto LABEL_9;
  }
  if (([v10 isTransliterationCandidate] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v10 candidate];
      int v8 = [v7 isEqualToString:a1[4]];

      if (v8)
      {
        uint64_t v9 = *(void *)(a1[5] + 8);
      }
      else
      {
        uint64_t v9 = *(void *)(a1[6] + 8);
        if (*(void *)(v9 + 24) != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_9;
        }
      }
      *(void *)(v9 + 24) = a3;
    }
  }
LABEL_9:
}

@end