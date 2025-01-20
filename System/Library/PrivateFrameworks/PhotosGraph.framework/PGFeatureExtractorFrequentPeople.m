@interface PGFeatureExtractorFrequentPeople
- (PGFeatureExtractorFrequentPeople)initWithNumberOfFrequentPeopleToExtract:(unint64_t)a3;
- (PHFetchResult)frequencySortedPersons;
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (unint64_t)numberOfFrequentPeopleToExtract;
- (void)setFrequencySortedPersons:(id)a3;
@end

@implementation PGFeatureExtractorFrequentPeople

- (void).cxx_destruct
{
}

- (void)setFrequencySortedPersons:(id)a3
{
}

- (PHFetchResult)frequencySortedPersons
{
  return self->_frequencySortedPersons;
}

- (unint64_t)numberOfFrequentPeopleToExtract
{
  return self->_numberOfFrequentPeopleToExtract;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 photoLibrary];
  v7 = [v6 librarySpecificFetchOptions];

  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"faceCount" ascending:0];
  v45[0] = v8;
  v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v45[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  [v7 setSortDescriptors:v10];

  objc_msgSend(v7, "setFetchLimit:", -[PGFeatureExtractorFrequentPeople numberOfFrequentPeopleToExtract](self, "numberOfFrequentPeopleToExtract"));
  v11 = [(PGFeatureExtractorFrequentPeople *)self frequencySortedPersons];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    v13 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v7];
    [(PGFeatureExtractorFrequentPeople *)self setFrequencySortedPersons:v13];
  }
  v34 = v5;
  v14 = objc_msgSend(MEMORY[0x1E4F391F0], "fetchPersonsInAsset:options:", v5, v7, v7);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v39 + 1) + 8 * i) uuid];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v18);
  }

  v22 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorFrequentPeople numberOfFrequentPeopleToExtract](self, "numberOfFrequentPeopleToExtract"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v23 = [(PGFeatureExtractorFrequentPeople *)self frequencySortedPersons];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = 0;
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(v23);
        }
        v29 = [*(id *)(*((void *)&v35 + 1) + 8 * j) uuid];
        int v30 = [v15 containsObject:v29];

        if (v30)
        {
          LODWORD(v31) = 1.0;
          [v22 setFloat:v26 + j atIndex:v31];
        }
      }
      v26 += j;
      uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v25);
  }

  return v22;
}

- (id)featureNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PGFeatureExtractorFrequentPeople *)self numberOfFrequentPeopleToExtract])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [NSString stringWithFormat:@"%@_%lu", @"FREQ_PERSON", v4];
      [v3 addObject:v5];

      ++v4;
    }
    while (v4 < [(PGFeatureExtractorFrequentPeople *)self numberOfFrequentPeopleToExtract]);
  }
  return v3;
}

- (id)name
{
  v2 = @"FrequentPeople";
  return @"FrequentPeople";
}

- (PGFeatureExtractorFrequentPeople)initWithNumberOfFrequentPeopleToExtract:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PGFeatureExtractorFrequentPeople;
  unint64_t v4 = [(PGFeatureExtractorFrequentPeople *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v4->_numberOfFrequentPeopleToExtract = a3;
    frequencySortedPersons = v4->_frequencySortedPersons;
    v4->_frequencySortedPersons = 0;
  }
  return v5;
}

@end