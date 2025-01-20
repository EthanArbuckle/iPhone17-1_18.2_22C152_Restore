@interface PGMoodSource
+ (id)_plistName;
- (NSDictionary)moodSourceDictionary;
- (PGEnrichedMemory)enrichedMemory;
- (PGMoodGeneratorOptions)options;
- (PGMoodSource)initWithAssetCollection:(id)a3 photoLibrary:(id)a4 options:(id)a5;
- (PGMoodSource)initWithEnrichedMemory:(id)a3 photoLibrary:(id)a4 options:(id)a5;
- (PGMoodVector)negativeVector;
- (PGMoodVector)positiveVector;
- (PHAssetCollection)assetCollection;
- (PHPhotoLibrary)photoLibrary;
- (double)weight;
- (id)_moodVectorForMoodIdentifier:(id)a3;
- (id)_moodVectorsWithGraph:(id)a3;
- (id)_plistMoodIdentifiersWithGraph:(id)a3;
- (id)negativeVectorWithGraph:(id)a3;
- (id)positiveVectorWithGraph:(id)a3;
- (unint64_t)_sourceInputCount;
- (void)_combineMoodVectorsWithGraph:(id)a3;
- (void)setNegativeVector:(id)a3;
- (void)setPositiveVector:(id)a3;
@end

@implementation PGMoodSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichedMemory, 0);
  objc_storeStrong((id *)&self->_moodSourceDictionary, 0);
  objc_storeStrong((id *)&self->_negativeVector, 0);
  objc_storeStrong((id *)&self->_positiveVector, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (PGEnrichedMemory)enrichedMemory
{
  return (PGEnrichedMemory *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNegativeVector:(id)a3
{
}

- (PGMoodVector)negativeVector
{
  return (PGMoodVector *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPositiveVector:(id)a3
{
}

- (PGMoodVector)positiveVector
{
  return (PGMoodVector *)objc_getProperty(self, a2, 32, 1);
}

- (PGMoodGeneratorOptions)options
{
  return (PGMoodGeneratorOptions *)objc_getProperty(self, a2, 24, 1);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_getProperty(self, a2, 16, 1);
}

- (PHAssetCollection)assetCollection
{
  return (PHAssetCollection *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)moodSourceDictionary
{
  moodSourceDictionary = self->_moodSourceDictionary;
  if (!moodSourceDictionary)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [(id)objc_opt_class() _plistName];
    v6 = [v4 pathForResource:v5 ofType:@"plist"];

    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
    v8 = self->_moodSourceDictionary;
    self->_moodSourceDictionary = v7;

    moodSourceDictionary = self->_moodSourceDictionary;
  }
  return moodSourceDictionary;
}

- (unint64_t)_sourceInputCount
{
  v2 = [(PGMoodSource *)self enrichedMemory];
  v3 = [v2 memoryMomentNodes];
  unint64_t v4 = [v3 count];

  if (v4 <= 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (void)_combineMoodVectorsWithGraph:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (PGMoodVector *)objc_opt_new();
  v6 = objc_opt_new();
  v19 = self;
  v20 = v4;
  v7 = [(PGMoodSource *)self _moodVectorsWithGraph:v4];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __45__PGMoodSource__combineMoodVectorsWithGraph___block_invoke;
        v23[3] = &unk_1E68EC830;
        v24 = v5;
        id v25 = v6;
        [v12 enumerateWithBlock:v23];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }
  unint64_t v13 = [(PGMoodSource *)v19 _sourceInputCount];
  if (v13 > 1) {
    [(PGMoodVector *)v5 multiplyByWeight:1.0 / (double)v13];
  }
  else {
    [(PGMoodVector *)v5 normalize];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__PGMoodSource__combineMoodVectorsWithGraph___block_invoke_2;
  v21[3] = &unk_1E68EA070;
  v14 = v6;
  v22 = v14;
  [(PGMoodVector *)v14 enumerateWithBlock:v21];
  positiveVector = v19->_positiveVector;
  v19->_positiveVector = v5;
  v16 = v5;

  negativeVector = v19->_negativeVector;
  v19->_negativeVector = v14;
  v18 = v14;
}

uint64_t __45__PGMoodSource__combineMoodVectorsWithGraph___block_invoke(uint64_t result, uint64_t a2, double a3)
{
  if (a3 == 1.0)
  {
    v3 = (id *)(result + 32);
  }
  else
  {
    if (a3 != -1.0) {
      return result;
    }
    v3 = (id *)(result + 40);
  }
  return [*v3 addValue:a2 forMood:1.0];
}

uint64_t __45__PGMoodSource__combineMoodVectorsWithGraph___block_invoke_2(uint64_t result, uint64_t a2, double a3)
{
  if (a3 != 0.0) {
    return [*(id *)(result + 32) setValue:a2 forMood:1.0];
  }
  return result;
}

- (id)_moodVectorsWithGraph:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(PGMoodSource *)self _plistMoodIdentifiersWithGraph:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [(PGMoodSource *)self _moodVectorForMoodIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_moodVectorForMoodIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PGMoodSource *)self moodSourceDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    uint64_t v7 = [[PGMoodVector alloc] initWithArray:v6];
  }
  else
  {
    uint64_t v7 = +[PGMoodHolidayResolver moodVectorForMoodIdentifier:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)_plistMoodIdentifiersWithGraph:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)negativeVectorWithGraph:(id)a3
{
  negativeVector = self->_negativeVector;
  if (!negativeVector)
  {
    [(PGMoodSource *)self _combineMoodVectorsWithGraph:a3];
    negativeVector = self->_negativeVector;
  }
  return negativeVector;
}

- (id)positiveVectorWithGraph:(id)a3
{
  positiveVector = self->_positiveVector;
  if (!positiveVector)
  {
    [(PGMoodSource *)self _combineMoodVectorsWithGraph:a3];
    positiveVector = self->_positiveVector;
  }
  return positiveVector;
}

- (double)weight
{
  return 0.0;
}

- (PGMoodSource)initWithEnrichedMemory:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMoodSource;
  v12 = [(PGMoodSource *)&v15 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_enrichedMemory, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (PGMoodSource)initWithAssetCollection:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMoodSource;
  v12 = [(PGMoodSource *)&v15 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollection, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

+ (id)_plistName
{
  return &stru_1F283BC78;
}

@end