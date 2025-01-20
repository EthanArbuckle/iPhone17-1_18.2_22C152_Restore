@interface MFThreadFuzzyMatcher
- (id)matchMessageReferenceContext:(id)a3 withCandidateMessageReferenceContexts:(id)a4;
@end

@implementation MFThreadFuzzyMatcher

- (id)matchMessageReferenceContext:(id)a3 withCandidateMessageReferenceContexts:(id)a4
{
  id v5 = a3;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__MFThreadFuzzyMatcher_matchMessageReferenceContext_withCandidateMessageReferenceContexts___block_invoke;
  v17[3] = &unk_1E5D409C0;
  id v6 = v5;
  id v18 = v6;
  v7 = objc_msgSend(a4, "ef_filter:", v17);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __91__MFThreadFuzzyMatcher_matchMessageReferenceContext_withCandidateMessageReferenceContexts___block_invoke_2;
  v15 = &unk_1E5D409E8;
  id v8 = v6;
  id v16 = v8;
  v9 = [v7 sortedArrayUsingComparator:&v12];
  v10 = objc_msgSend(v9, "firstObject", v12, v13, v14, v15);

  return v10;
}

uint64_t __91__MFThreadFuzzyMatcher_matchMessageReferenceContext_withCandidateMessageReferenceContexts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 subject];
  id v5 = [*(id *)(a1 + 32) subject];
  int v6 = [v4 isEqualToSubjectIgnoringPrefix:v5];

  v7 = [v3 participants];
  id v8 = [*(id *)(a1 + 32) participants];
  LODWORD(a1) = [v7 intersectsSet:v8];

  return v6 & a1;
}

uint64_t __91__MFThreadFuzzyMatcher_matchMessageReferenceContext_withCandidateMessageReferenceContexts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = [*(id *)(a1 + 32) participants];
  v9 = [v7 setWithSet:v8];

  v10 = [v5 participants];
  [v9 intersectSet:v10];

  v11 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v12 = [*(id *)(a1 + 32) participants];
  uint64_t v13 = [v11 setWithSet:v12];

  v14 = [v6 participants];
  [v13 intersectSet:v14];

  unint64_t v15 = [v9 count];
  if (v15 <= [v13 count])
  {
    unint64_t v17 = [v9 count];
    if (v17 >= [v13 count])
    {
      [*(id *)(a1 + 32) dateSentInterval];
      double v19 = v18;
      [v5 dateSentInterval];
      double v21 = v20;
      [*(id *)(a1 + 32) dateSentInterval];
      double v23 = v22;
      [v6 dateSentInterval];
      double v24 = vabdd_f64(v19, v21);
      double v26 = vabdd_f64(v23, v25);
      double v27 = vabdd_f64(v24, v26);
      uint64_t v28 = -1;
      if (v24 >= v26) {
        uint64_t v28 = 1;
      }
      if (v27 >= 0.01) {
        uint64_t v16 = v28;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = -1;
  }

  return v16;
}

@end