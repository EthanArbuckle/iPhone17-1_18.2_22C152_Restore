@interface NSArray
@end

@implementation NSArray

void __131__NSArray_UIKBCandidateExtras___sortedArrayByFrequency_extensionCandidateIndex_maxEmojisPerCandidate_ignoreTransliterateCandidate___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  v6 = v5;
  id v12 = v5;
  if (*(unsigned char *)(a1 + 96) && (int v7 = [v5 isTransliterationCandidate], v6 = v12, v7))
  {
    v8 = (id *)(a1 + 32);
  }
  else
  {
    char v9 = [v6 isExtensionCandidate];
    int v10 = [v12 isStickerCandidate];
    BOOL v11 = a3 > 1;
    if (!v10) {
      BOOL v11 = v9;
    }
    if ((v11
       || (([v12 isEmojiCandidate] & 1) != 0 || objc_msgSend(v12, "isStickerCandidate"))
       && (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= *(void *)(a1 + 72)
        || *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= *(void *)(a1 + 80)))
      && (unint64_t)[*(id *)(a1 + 40) count] < *(void *)(a1 + 88))
    {
      v8 = (id *)(a1 + 48);
    }
    else
    {
      v8 = (id *)(a1 + 40);
      if ([*(id *)(a1 + 40) count] == *(void *)(a1 + 88))
      {
        [*(id *)(a1 + 40) addObjectsFromArray:*(void *)(a1 + 48)];
        [*(id *)(a1 + 48) removeAllObjects];
      }
      if ([v12 isEmojiCandidate])
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      }
      else
      {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      }
    }
    v6 = v12;
  }
  [*v8 addObject:v6];
}

BOOL __65__NSArray_UIKBCandidateExtras___arrayByFilteringEmojiCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEmojiCandidate] & 1) != 0 || objc_msgSend(v3, "isStickerCandidate"))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    unint64_t v5 = *(void *)(v4 + 24) + 1;
    *(void *)(v4 + 24) = v5;
    BOOL v6 = v5 <= *(void *)(a1 + 40);
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    BOOL v6 = 1;
  }

  return v6;
}

uint64_t __77__NSArray_UIKBCandidateExtras___arrayByFilteringCandidatesForNonExtendedView__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isExtensionCandidate] ^ 1;
}

@end