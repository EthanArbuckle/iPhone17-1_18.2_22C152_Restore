@interface PGMoodGenerator
- (PGMoodGenerator)initWithAssetCollection:(id)a3 photoLibrary:(id)a4 options:(id)a5;
- (PGMoodGenerator)initWithEnrichedMemory:(id)a3 photoLibrary:(id)a4 options:(id)a5;
- (PGMoodGeneratorOptions)options;
- (double)negativeThreshold;
- (double)positiveThreshold;
- (id)_moodSources;
- (id)historyWeightedPositiveMoodVectorWithGraph:(id)a3;
- (id)negativeMoodVectorWithGraph:(id)a3;
- (id)positiveMoodVectorWithGraph:(id)a3;
- (unint64_t)forbiddenMoodsWithGraph:(id)a3;
- (unint64_t)recommendedMoodsWithGraph:(id)a3;
- (unint64_t)suggestedMoodWithGraph:(id)a3;
- (void)_processMoodSourcesWithGraph:(id)a3;
- (void)setNegativeThreshold:(double)a3;
- (void)setOptions:(id)a3;
- (void)setPositiveThreshold:(double)a3;
@end

@implementation PGMoodGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssets, 0);
  objc_storeStrong((id *)&self->_enrichedMemory, 0);
  objc_storeStrong((id *)&self->_historyWeightedPositiveMoodVector, 0);
  objc_storeStrong((id *)&self->_negativeMoodVector, 0);
  objc_storeStrong((id *)&self->_positiveMoodVector, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

- (void)setNegativeThreshold:(double)a3
{
  self->_negativeThreshold = a3;
}

- (double)negativeThreshold
{
  return self->_negativeThreshold;
}

- (void)setPositiveThreshold:(double)a3
{
  self->_positiveThreshold = a3;
}

- (double)positiveThreshold
{
  return self->_positiveThreshold;
}

- (void)setOptions:(id)a3
{
}

- (PGMoodGeneratorOptions)options
{
  return (PGMoodGeneratorOptions *)objc_getProperty(self, a2, 72, 1);
}

- (void)_processMoodSourcesWithGraph:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (PGMoodVector *)objc_opt_new();
  v24 = (PGMoodVector *)objc_opt_new();
  v6 = [(PGMoodGenerator *)self _moodSources];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        enrichedMemory = self->_enrichedMemory;
        id v12 = objc_alloc(*(Class *)(*((void *)&v25 + 1) + 8 * v10));
        photoLibrary = self->_photoLibrary;
        options = self->_options;
        if (enrichedMemory) {
          v15 = (void *)[v12 initWithEnrichedMemory:self->_enrichedMemory photoLibrary:photoLibrary options:options];
        }
        else {
          v15 = (void *)[v12 initWithAssetCollection:self->_assetCollection photoLibrary:photoLibrary options:options];
        }
        v16 = v15;
        [v15 weight];
        if (v17 != 0.0)
        {
          double v18 = v17;
          v19 = [v16 positiveVectorWithGraph:v4];
          [v19 multiplyByWeight:v18];
          [(PGMoodVector *)v5 addMoodVector:v19];
          v20 = [v16 negativeVectorWithGraph:v4];
          [v20 multiplyByWeight:v18];
          [(PGMoodVector *)v24 addMoodVector:v20];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }
  positiveMoodVector = self->_positiveMoodVector;
  self->_positiveMoodVector = v5;
  v22 = v5;

  negativeMoodVector = self->_negativeMoodVector;
  self->_negativeMoodVector = v24;
}

- (id)historyWeightedPositiveMoodVectorWithGraph:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  historyWeightedPositiveMoodVector = self->_historyWeightedPositiveMoodVector;
  if (!historyWeightedPositiveMoodVector)
  {
    v5 = [(PGMoodGenerator *)self positiveMoodVectorWithGraph:a3];
    v6 = (PGMoodVector *)[v5 copy];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [(PGMoodGeneratorOptions *)self->_options moodHistory];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          -[PGMoodVector multiplyByWeight:forMood:](v6, "multiplyByWeight:forMood:", [*(id *)(*((void *)&v14 + 1) + 8 * v11++) unsignedIntegerValue], 0.9);
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    id v12 = self->_historyWeightedPositiveMoodVector;
    self->_historyWeightedPositiveMoodVector = v6;

    historyWeightedPositiveMoodVector = self->_historyWeightedPositiveMoodVector;
  }
  return historyWeightedPositiveMoodVector;
}

- (id)negativeMoodVectorWithGraph:(id)a3
{
  negativeMoodVector = self->_negativeMoodVector;
  if (!negativeMoodVector)
  {
    [(PGMoodGenerator *)self _processMoodSourcesWithGraph:a3];
    negativeMoodVector = self->_negativeMoodVector;
  }
  return negativeMoodVector;
}

- (id)positiveMoodVectorWithGraph:(id)a3
{
  positiveMoodVector = self->_positiveMoodVector;
  if (!positiveMoodVector)
  {
    [(PGMoodGenerator *)self _processMoodSourcesWithGraph:a3];
    positiveMoodVector = self->_positiveMoodVector;
  }
  return positiveMoodVector;
}

- (unint64_t)forbiddenMoodsWithGraph:(id)a3
{
  id v4 = [(PGMoodGenerator *)self negativeMoodVectorWithGraph:a3];
  unint64_t v5 = [v4 moodsWithThreshold:self->_negativeThreshold];

  return v5;
}

- (unint64_t)recommendedMoodsWithGraph:(id)a3
{
  id v4 = [(PGMoodGenerator *)self positiveMoodVectorWithGraph:a3];
  unint64_t v5 = [v4 moodsWithThreshold:self->_positiveThreshold];

  return v5;
}

- (unint64_t)suggestedMoodWithGraph:(id)a3
{
  unint64_t result = self->_suggestedMood;
  if (!result)
  {
    id v5 = a3;
    unint64_t v6 = [(PGMoodGenerator *)self recommendedMoodsWithGraph:v5];
    unint64_t v7 = v6 & ~[(PGMoodGenerator *)self forbiddenMoodsWithGraph:v5];
    uint64_t v8 = [(PGMoodGenerator *)self historyWeightedPositiveMoodVectorWithGraph:v5];

    uint64_t v9 = (void *)[v8 copy];
    [v9 filterWithMoods:v7];
    uint64_t v10 = [(PHAssetCollection *)self->_assetCollection uuid];
    self->_suggestedMood = objc_msgSend(v9, "weightedRandomMoodWithSeed:", objc_msgSend(v10, "hash"));

    if (!self->_suggestedMood) {
      self->_suggestedMood = 16;
    }

    return self->_suggestedMood;
  }
  return result;
}

- (id)_moodSources
{
  if (_moodSources_onceToken != -1) {
    dispatch_once(&_moodSources_onceToken, &__block_literal_global_52055);
  }
  v2 = (void *)_moodSources_moodSources;
  return v2;
}

void __31__PGMoodGenerator__moodSources__block_invoke()
{
  v2[9] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:9];
  v1 = (void *)_moodSources_moodSources;
  _moodSources_moodSources = v0;
}

- (PGMoodGenerator)initWithEnrichedMemory:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMoodGenerator;
  id v12 = [(PGMoodGenerator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_enrichedMemory, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    *(_OWORD *)&v13->_positiveThreshold = xmmword_1D1F4F260;
  }

  return v13;
}

- (PGMoodGenerator)initWithAssetCollection:(id)a3 photoLibrary:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGMoodGenerator;
  id v12 = [(PGMoodGenerator *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollection, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_options, a5);
    *(_OWORD *)&v13->_positiveThreshold = xmmword_1D1F4F260;
  }

  return v13;
}

@end