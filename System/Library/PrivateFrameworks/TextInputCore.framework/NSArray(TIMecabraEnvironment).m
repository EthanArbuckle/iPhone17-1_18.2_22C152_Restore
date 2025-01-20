@interface NSArray(TIMecabraEnvironment)
- (id)deletionRangesWithElementsToKeep:()TIMecabraEnvironment;
- (id)mecabraCandidateSurfaces;
@end

@implementation NSArray(TIMecabraEnvironment)

- (id)mecabraCandidateSurfaces
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "addObject:", MecabraCandidateGetSurface(), v9);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v2;
}

- (id)deletionRangesWithElementsToKeep:()TIMecabraEnvironment
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v20 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  id v19 = v4;
  uint64_t v21 = 0;
  uint64_t v9 = *(void *)v23;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v14 = v11;
      uint64_t v15 = v10;
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      if ([v5 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * i)])
      {
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v14, v15);
          [v20 addObject:v16];

          uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else
      {
        BOOL v17 = v12 == 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v12 = v21 + i;
        if (v17) {
          uint64_t v10 = 1;
        }
        else {
          ++v10;
        }
        if (v17) {
          uint64_t v11 = v21 + i;
        }
      }
    }
    v21 += i;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v8);

  id v4 = v19;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v11, v10);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v20 addObject:v6];
LABEL_18:
  }

  return v20;
}

@end