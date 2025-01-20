@interface UIFocusMovementPerformer
@end

@implementation UIFocusMovementPerformer

void __98___UIFocusMovementPerformer__findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 _linearFocusMovementSequences];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __98___UIFocusMovementPerformer__findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest___block_invoke_2;
    v9[3] = &unk_1E52EE680;
    uint64_t v14 = *(void *)(a1 + 64);
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    id v12 = v7;
    uint64_t v13 = v8;
    uint64_t v15 = a3;
    [v6 enumerateObjectsUsingBlock:v9];
  }
}

void __98___UIFocusMovementPerformer__findFocusCandidateBySearchingLinearFocusMovementSequencesForRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 64) & 0x110;
  id v23 = v6;
  uint64_t v8 = [v6 items];
  v9 = v8;
  if (!v7)
  {
    id v10 = [v8 reverseObjectEnumerator];
    uint64_t v11 = [v10 allObjects];

    v9 = (void *)v11;
  }
  uint64_t v12 = [v9 indexOfObjectIdenticalTo:*(void *)(a1 + 32)];
  uint64_t v13 = v12;
  if ((*(unsigned char *)(a1 + 64) & 0x30) != 0)
  {
    if (v12 <= 0x7FFFFFFFFFFFFFFDLL)
    {
      unint64_t i = v12 + 1;
      goto LABEL_8;
    }
  }
  else if ([v9 count])
  {
    for (unint64_t i = 0; ; ++i)
    {
LABEL_8:
      if (i >= [v9 count])
      {
        if ((*(unsigned char *)(a1 + 64) & 0x30) == 0 || ![v23 isLooping]) {
          goto LABEL_20;
        }
        unint64_t i = 0;
      }
      if (i == v13) {
        goto LABEL_20;
      }
      uint64_t v15 = [v9 objectAtIndexedSubscript:i];
      v16 = *(void **)(a1 + 40);
      v17 = [*(id *)(a1 + 48) searchInfo];
      LOBYTE(v16) = _UIFocusItemIsFocusableInFocusSystemWithSearchInfo(v15, v16, v17);

      if (v16) {
        break;
      }
    }
    if (v15)
    {
      id v18 = [[UIFocusUpdateContext alloc] _initWithFocusMovementRequest:*(void *)(a1 + 48) nextFocusedItem:v15];
      uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;

      if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) _isValidInFocusSystem:*(void *)(a1 + 40)])
      {
        *a4 = 1;
        **(unsigned char **)(a1 + 72) = 1;
      }
      else
      {
        uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
        v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = 0;
      }
    }
  }
LABEL_20:
}

void __63___UIFocusMovementPerformer__isMovementValidForFocusSequences___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 _linearFocusMovementSequences];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63___UIFocusMovementPerformer__isMovementValidForFocusSequences___block_invoke_2;
    v10[3] = &unk_1E52EE6D0;
    id v7 = *(id *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v11 = v7;
    uint64_t v12 = v9;
    uint64_t v13 = v8;
    uint64_t v14 = a3;
    [v6 enumerateObjectsUsingBlock:v10];
  }
}

void __63___UIFocusMovementPerformer__isMovementValidForFocusSequences___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  id v6 = [v11 items];
  id v7 = [*(id *)(a1 + 32) nextFocusedItem];
  uint64_t v8 = [v6 indexOfObjectIdenticalTo:v7];

  if (v8 != 0x7FFFFFFFFFFFFFFFLL && [v11 restrictsEnteringSequence])
  {
    if (!v8 || *(void *)(a1 + 48) != 16)
    {
      uint64_t v9 = [v11 items];
      if (v8 == [v9 count] - 1)
      {

LABEL_9:
        *a4 = 1;
        **(unsigned char **)(a1 + 56) = 1;
        goto LABEL_10;
      }
      uint64_t v10 = *(void *)(a1 + 48);

      if (v10 != 32) {
        goto LABEL_9;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_9;
  }
LABEL_10:
}

@end