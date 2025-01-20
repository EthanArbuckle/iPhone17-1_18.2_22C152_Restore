@interface PGFeatureExtractorMomentNodeSpecialPOI
- (id)featureNames;
- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorMomentNodeSpecialPOI

- (id)floatMatrixWithEntities:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 addObject:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v10);
  }

  uint64_t v13 = [v7 count];
  v14 = [(PGFeatureExtractorMomentNodeSpecialPOI *)self featureNames];
  uint64_t v15 = [v14 count];

  v16 = [MEMORY[0x1E4F71EF0] zerosWithRows:v13 columns:v15];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v8;
  uint64_t v17 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        v23 = [PGSpecialPOIResolver alloc];
        v24 = [v22 array];
        v25 = [(PGSpecialPOIResolver *)v23 initWithMomentNodes:v24];

        if ([(PGSpecialPOIResolver *)v25 momentsContainSpecialPOI:1 withMomentRatio:1.0])
        {
          LODWORD(v26) = 1.0;
          [v16 setFloat:v19 + j atRow:0 column:v26];
        }
        if ([(PGSpecialPOIResolver *)v25 momentsContainSpecialPOI:2 withMomentRatio:1.0])
        {
          LODWORD(v27) = 1.0;
          [v16 setFloat:v19 + j atRow:1 column:v27];
        }
      }
      v19 += j;
      uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v18);
  }

  return v16;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [PGSpecialPOIResolver alloc];
  id v7 = [v5 array];

  id v8 = [(PGSpecialPOIResolver *)v6 initWithMomentNodes:v7];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorMomentNodeSpecialPOI featureLength](self, "featureLength"));
  if ([(PGSpecialPOIResolver *)v8 momentsContainSpecialPOI:1 withMomentRatio:1.0])
  {
    LODWORD(v10) = 1.0;
    [v9 setFloat:0 atIndex:v10];
  }
  if ([(PGSpecialPOIResolver *)v8 momentsContainSpecialPOI:2 withMomentRatio:1.0])
  {
    LODWORD(v11) = 1.0;
    [v9 setFloat:1 atIndex:v11];
  }

  return v9;
}

- (int64_t)featureLength
{
  return 2;
}

- (id)featureNames
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Disney";
  v4[1] = @"Universal";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (id)name
{
  v2 = @"SpecialPOI";
  return @"SpecialPOI";
}

@end