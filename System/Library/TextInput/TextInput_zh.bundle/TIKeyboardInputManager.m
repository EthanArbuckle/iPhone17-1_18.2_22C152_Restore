@interface TIKeyboardInputManager
@end

@implementation TIKeyboardInputManager

uint64_t __89__TIKeyboardInputManager_zh_Toneless_groupedCandidatesFromCandidates_usingSortingMethod___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 candidate];
  uint64_t v4 = [*(id *)(a1 + 32) candidate];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = &stru_26F5E6580;
  }
  uint64_t v7 = [v3 isEqualToString:v6] ^ 1;

  return v7;
}

uint64_t __96__TIKeyboardInputManager_zh_RetroCorrection_groupedCandidatesFromCandidates_usingSortingMethod___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 candidate];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

void __61__TIKeyboardInputManager_zh_SegmentPicker_setPhraseBoundary___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 surface];
  *(void *)(*(void *)(a1[5] + 8) + 24) += [v7 length];

  if (a1[6] <= *(void *)(*(void *)(a1[5] + 8) + 24))
  {
    *(void *)(a1[4] + 800) = a3;
    *a4 = 1;
  }
}

void __94__TIKeyboardInputManager_zh_SegmentPicker_openCandidateGenerationContextWithCandidateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [*(id *)(a1 + 32) keyboardState];
  uint64_t v4 = [v3 inputForMarkedText];

  if (v4)
  {
    [*(id *)(a1 + 32) updateMarkedText];
    v5 = [*(id *)(a1 + 32) markedText];
    [v6 setUncommittedText:v5];
  }
  [*(id *)(a1 + 40) pushCandidateResultSet:v6];
}

void __81__TIKeyboardInputManager_zh_Candidates__notifyWholePhraseCandidate_forOperation___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setWholePhraseCandidateResultSet:v1];

  id v4 = objc_loadWeakRetained(v2);
  [v4 _notifyUpdateCandidates];
}

void __81__TIKeyboardInputManager_zh_Candidates__notifyWholePhraseCandidate_forOperation___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained addProactiveTriggers:v4 withCompletionHandler:*(void *)(a1 + 32)];
}

uint64_t __113__TIKeyboardInputManager_zh_Candidates_candidateResultSetFromCandidateResultSet_lastCharacterCandidateResultSet___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 autoSelectCandidates];
  v5 = [v3 label];

  uint64_t v6 = [v4 containsObject:v5];
  return v6;
}

@end