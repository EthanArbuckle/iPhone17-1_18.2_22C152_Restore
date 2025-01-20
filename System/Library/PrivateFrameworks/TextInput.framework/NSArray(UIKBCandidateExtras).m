@interface NSArray(UIKBCandidateExtras)
- (id)_arrayByFilteringCandidatesForNonExtendedView;
- (id)_arrayByFilteringEmojiCandidates:()UIKBCandidateExtras;
- (id)_sortedArrayByFrequency:()UIKBCandidateExtras extensionCandidateIndex:maxEmojisPerCandidate:ignoreTransliterateCandidate:;
- (uint64_t)_sortedArrayByFrequency;
@end

@implementation NSArray(UIKBCandidateExtras)

- (id)_sortedArrayByFrequency:()UIKBCandidateExtras extensionCandidateIndex:maxEmojisPerCandidate:ignoreTransliterateCandidate:
{
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  v13 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __131__NSArray_UIKBCandidateExtras___sortedArrayByFrequency_extensionCandidateIndex_maxEmojisPerCandidate_ignoreTransliterateCandidate___block_invoke;
  v23 = &unk_1E5558F28;
  char v32 = a6;
  id v14 = v13;
  id v24 = v14;
  v27 = v34;
  v28 = v33;
  uint64_t v29 = a3;
  uint64_t v30 = a5;
  id v15 = v11;
  id v25 = v15;
  uint64_t v31 = a4;
  id v16 = v12;
  id v26 = v16;
  [a1 enumerateObjectsUsingBlock:&v20];
  if (objc_msgSend(v15, "count", v20, v21, v22, v23)) {
    [v14 addObjectsFromArray:v15];
  }
  if ([v16 count]) {
    [v14 addObjectsFromArray:v16];
  }
  v17 = v26;
  id v18 = v14;

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);

  return v18;
}

- (uint64_t)_sortedArrayByFrequency
{
  return [a1 _sortedArrayByFrequency:2 extensionCandidateIndex:8 maxEmojisPerCandidate:2 ignoreTransliterateCandidate:0];
}

- (id)_arrayByFilteringEmojiCandidates:()UIKBCandidateExtras
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__NSArray_UIKBCandidateExtras___arrayByFilteringEmojiCandidates___block_invoke;
  v7[3] = &unk_1E5558F00;
  v7[4] = v8;
  v7[5] = a3;
  v4 = [a1 indexesOfObjectsPassingTest:v7];
  v5 = [a1 objectsAtIndexes:v4];

  _Block_object_dispose(v8, 8);

  return v5;
}

- (id)_arrayByFilteringCandidatesForNonExtendedView
{
  v2 = [a1 indexesOfObjectsPassingTest:&__block_literal_global_4067];
  v3 = [a1 objectsAtIndexes:v2];

  if ([v3 count]) {
    v4 = v3;
  }
  else {
    v4 = a1;
  }
  id v5 = v4;

  return v5;
}

@end