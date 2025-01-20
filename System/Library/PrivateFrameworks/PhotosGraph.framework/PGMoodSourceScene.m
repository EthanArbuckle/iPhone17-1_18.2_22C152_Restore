@interface PGMoodSourceScene
+ (BOOL)shouldUseSceneIdentifier:(id)a3;
+ (id)_plistName;
- (double)weight;
- (unint64_t)_sourceInputCount;
- (void)_combineMoodVectorsWithGraph:(id)a3;
@end

@implementation PGMoodSourceScene

- (void)_combineMoodVectorsWithGraph:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27 = objc_opt_new();
  v5 = objc_opt_new();
  v6 = [(PGMoodSource *)self options];
  v7 = [v6 sceneIdentifiersByMomentNodeIdentifier];

  if (!v7)
  {
    v8 = [(PGMoodSource *)self enrichedMemory];

    if (v8)
    {
      v9 = [(PGMoodSource *)self enrichedMemory];
      v10 = [v9 memoryMomentNodes];
      +[PGMoodUtilities moodSceneIdentifiersByMomentForMomentNodes:v10];
    }
    else
    {
      v9 = [(PGMoodSource *)self assetCollection];
      v10 = [(PGMoodSource *)self options];
      +[PGMoodUtilities moodSceneIdentifiersByMomentForAssetCollection:v9 withGraph:v4 moodOptions:v10];
    v7 = };

    v11 = [(PGMoodSource *)self options];
    [v11 setSceneIdentifiersByMomentNodeIdentifier:v7];
  }
  v23 = v7;
  v24 = v4;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [v7 objectEnumerator];
  uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v12;
        v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
        v14 = objc_opt_new();
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v34 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              if ([(id)objc_opt_class() shouldUseSceneIdentifier:v20])
              {
                v21 = [v20 moodIdentifier];
                v22 = [(PGMoodSource *)self _moodVectorForMoodIdentifier:v21];

                if (v22)
                {
                  v30[0] = MEMORY[0x1E4F143A8];
                  v30[1] = 3221225472;
                  v30[2] = __50__PGMoodSourceScene__combineMoodVectorsWithGraph___block_invoke;
                  v30[3] = &unk_1E68EC830;
                  id v31 = v14;
                  id v32 = v5;
                  [v22 enumerateWithBlock:v30];
                }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v17);
        }

        [v14 normalize];
        [v27 addMoodVector:v14];

        uint64_t v12 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v28);
  }

  objc_msgSend(v27, "multiplyByWeight:", 1.0 / (double)-[PGMoodSourceScene _sourceInputCount](self, "_sourceInputCount"));
  [(PGMoodSource *)self setPositiveVector:v27];
  [(PGMoodSource *)self setNegativeVector:v5];
}

uint64_t __50__PGMoodSourceScene__combineMoodVectorsWithGraph___block_invoke(uint64_t result, uint64_t a2, double a3)
{
  if (a3 == 1.0) {
    return [*(id *)(result + 32) addValue:a2 forMood:1.0];
  }
  if (a3 == -1.0) {
    return [*(id *)(result + 40) setValue:a2 forMood:1.0];
  }
  return result;
}

- (unint64_t)_sourceInputCount
{
  v3 = [(PGMoodSource *)self options];
  id v4 = [v3 momentIDs];
  unint64_t v5 = [v4 count];

  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)PGMoodSourceScene;
    return [(PGMoodSource *)&v7 _sourceInputCount];
  }
  return v5;
}

- (double)weight
{
  return 1.5;
}

+ (id)_plistName
{
  return @"MoodSourceScene";
}

+ (BOOL)shouldUseSceneIdentifier:(id)a3
{
  return 1;
}

@end