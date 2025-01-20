@interface ACTUserActionStream
@end

@implementation ACTUserActionStream

void __41___ACTUserActionStream_tryContinuousPath__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v17 = a2;
  if ([*(id *)(a1 + 32) length])
  {
    uint64_t v5 = 0;
    while (1)
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, 1);
      char v7 = [v17 isEqualToString:v6];

      if (v7) {
        break;
      }
      if (++v5 >= (unint64_t)[*(id *)(a1 + 32) length]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v8 = [*(id *)(a1 + 40) delegate];
    v9 = [v8 keyplane];

    v10 = objc_msgSend(*(id *)(a1 + 40), "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v17, v9, objc_msgSend(*(id *)(a1 + 40), "lastActionUseSecondaryString"), 1);
    if (v10
      || ([*(id *)(a1 + 40) delegate],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v11 mapShiftedKeyToUnShiftedKeyExcludeCapitalization:v17],
          v10 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10))
    {
      [*(id *)(a1 + 48) addObject:v10];
      if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        uint64_t v12 = [v10 representedString];
        uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
        v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      v15 = [v10 representedString];
      uint64_t v16 = [v15 caseInsensitiveCompare:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

      if (v16) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      *a3 = 1;
    }
  }
}

uint64_t __56___ACTUserActionStream_candidateToSelectFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) cursor];
  uint64_t v5 = [v4 rangeOfInputSegmentsForCandidate:v3];

  v6 = [v3 input];
  if ([v6 length])
  {
    char v7 = [*(id *)(a1 + 32) delegate];
    v8 = [v7 document];
    v9 = [v3 input];
    unsigned int v10 = [v8 hasSuffix:v9];
  }
  else
  {
    unsigned int v10 = 1;
  }

  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }

  return v11;
}

uint64_t __56___ACTUserActionStream_candidateToSelectFromCandidates___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 candidate];
  unint64_t v6 = [v5 length];

  char v7 = [v4 candidate];

  unint64_t v8 = [v7 length];
  if (v6 > v8) {
    return -1;
  }
  else {
    return v6 < v8;
  }
}

@end