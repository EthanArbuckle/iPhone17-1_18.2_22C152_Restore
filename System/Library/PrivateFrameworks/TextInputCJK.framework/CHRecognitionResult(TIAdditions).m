@interface CHRecognitionResult(TIAdditions)
- (id)mecabraHandwritingCandidate;
@end

@implementation CHRecognitionResult(TIAdditions)

- (id)mecabraHandwritingCandidate
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = [a1 wordIDs];
  uint64_t v3 = [v2 count];

  if (v3
    && ([a1 wordRanges],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v3 == v5))
  {
    v26[1] = v26;
    MEMORY[0x270FA5388]();
    v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v8 = [a1 wordIDs];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v8);
          }
          *(_DWORD *)&v7[4 * v11 + 4 * i] = [*(id *)(*((void *)&v33 + 1) + 8 * i) unsignedIntValue];
        }
        v11 += i;
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }

    MEMORY[0x270FA5388]();
    id v27 = a1;
    v28 = &v26[-2 * v3];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = [a1 wordRanges];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = *(void *)v30;
      v19 = v28 + 1;
      do
      {
        uint64_t v20 = 0;
        v21 = &v19[2 * v17];
        do
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v14);
          }
          *(v21 - 1) = [*(id *)(*((void *)&v29 + 1) + 8 * v20) rangeValue];
          void *v21 = v22;
          ++v20;
          v21 += 2;
        }
        while (v16 != v20);
        v17 += v20;
        uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v16);
    }

    v23 = [v27 string];
    v24 = MecabraCreateHandwritingCandidate();
  }
  else
  {
    v24 = 0;
  }
  return v24;
}

@end