@interface PGMemoryDebugConvenience
+ (id)memoryDebugInformationWithMomentNodes:(id)a3 meaningLabels:(id)a4 serviceManager:(id)a5;
@end

@implementation PGMemoryDebugConvenience

+ (id)memoryDebugInformationWithMomentNodes:(id)a3 meaningLabels:(id)a4 serviceManager:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v31 = a4;
  id v8 = a5;
  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "debugDictionaryWithServiceManager:", v8, v28);
        [v30 addObject:v15];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __95__PGMemoryDebugConvenience_memoryDebugInformationWithMomentNodes_meaningLabels_serviceManager___block_invoke;
        v36[3] = &unk_1E68ECC10;
        id v37 = v9;
        [v14 enumerateMeaningfulEventsUsingBlock:v36];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v11);
  }

  v16 = v28;
  [v28 setObject:v30 forKeyedSubscript:@"backingMoments"];
  if ([v31 count])
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          if (v31)
          {
            v24 = [*(id *)(*((void *)&v32 + 1) + 8 * j) meaningLabels];
            int v25 = [v24 intersectsSet:v31];

            if (!v25) {
              continue;
            }
          }
          v26 = objc_msgSend(v23, "debugDictionaryWithServiceManager:", v8, v28);
          [v17 addObject:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v42 count:16];
      }
      while (v20);
    }

    v16 = v28;
    [v28 setObject:v17 forKeyedSubscript:@"collectionsInfo"];
  }
  return v16;
}

uint64_t __95__PGMemoryDebugConvenience_memoryDebugInformationWithMomentNodes_meaningLabels_serviceManager___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

@end