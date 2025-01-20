@interface _REMLFeatureExplanation
+ (id)combinedExplanationsFromExplanations:(id)a3;
- (BOOL)_canCombineWithSimilarExplanation:(id)a3;
- (BOOL)shouldProvideExplanation;
- (_REMLFeatureExplanation)explanationWithStyle:(unint64_t)a3;
- (_REMLFeatureExplanation)initWithFeature:(id)a3 mean:(float)a4 variance:(float)a5;
- (id)explanationByCombiningWithExplanation:(id)a3;
- (int64_t)_rankExplanationToSimilarExplanation:(id)a3;
@end

@implementation _REMLFeatureExplanation

+ (id)combinedExplanationsFromExplanations:(id)a3
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F08760] set];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*(void *)(*((void *)&v52 + 1) + 8 * i) + 8) allFeatures];
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v7);
  }

  [MEMORY[0x263EFF9C0] set];
  v41 = v5;
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)[v5 mutableCopy];
  v43 = v11;
  while ([v11 count])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (!v13)
    {

      break;
    }
    uint64_t v14 = v13;
    v15 = 0;
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        unint64_t v19 = v16;
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v12);
        }
        v20 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        unint64_t v21 = [v12 countForObject:v20];
        if (v21 <= v19)
        {
          unint64_t v16 = v19;
        }
        else
        {
          id v22 = v20;

          v15 = v22;
          unint64_t v16 = v21;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v57 count:16];
    }
    while (v14);

    if (!v15) {
      break;
    }
    if (v16)
    {
      if (v21 <= v19) {
        unint64_t v23 = v19;
      }
      else {
        unint64_t v23 = v21;
      }
      do
      {
        [v12 removeObject:v15];
        --v23;
      }
      while (v23);
    }
    v24 = [MEMORY[0x263EFF9C0] set];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v25 = v43;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v27; ++k)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v44 + 1) + 8 * k);
          if ([*(id *)(v30 + 8) containsFeature:v15]) {
            [v24 addObject:v30];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v27);
    }

    [v25 minusSet:v24];
    uint64_t v31 = [v24 anyObject];
    if (v31)
    {
      v32 = (float *)v31;
      [v24 removeObject:v31];
      float v33 = v32[4];
      float v34 = v32[5];
      while ([v24 count])
      {
        v35 = [v24 anyObject];
        [v24 removeObject:v35];
        float v33 = v33 + v35[4];
        if (v34 >= v35[5]) {
          float v34 = v35[5];
        }
      }
      v36 = [_REMLFeatureExplanation alloc];
      *(float *)&double v37 = v33;
      *(float *)&double v38 = v34;
      v39 = [(_REMLFeatureExplanation *)v36 initWithFeature:v15 mean:v37 variance:v38];

      [v42 addObject:v39];
    }

    v11 = v25;
  }

  return v42;
}

- (_REMLFeatureExplanation)initWithFeature:(id)a3 mean:(float)a4 variance:(float)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_REMLFeatureExplanation;
  v9 = [(_REMLFeatureExplanation *)&v14 init];
  if (v9)
  {
    v10 = +[REFeatureSet featureSetWithFeature:v8];
    uint64_t v11 = RERootFeatureSetForFeatures(v10);
    features = v9->_features;
    v9->_features = (REFeatureSet *)v11;

    v9->_mean = a4;
    v9->_variance = a5;
  }

  return v9;
}

- (BOOL)shouldProvideExplanation
{
  return fabsf(self->_mean) > 0.33;
}

- (id)explanationByCombiningWithExplanation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_REMLFeatureExplanation);
  uint64_t v6 = (void *)[*((id *)v4 + 1) mutableCopy];
  [v6 intersetFeatureSet:self->_features];
  uint64_t v7 = [v6 copy];
  features = v5->_features;
  v5->_features = (REFeatureSet *)v7;

  v5->_mean = self->_mean + *((float *)v4 + 4);
  float variance = self->_variance;
  float v10 = *((float *)v4 + 5);

  if (variance >= v10) {
    float v11 = v10;
  }
  else {
    float v11 = variance;
  }
  v5->_mean = v11;

  return v5;
}

- (BOOL)_canCombineWithSimilarExplanation:(id)a3
{
  return [*((id *)a3 + 1) intersectsFeatureSet:self->_features];
}

- (int64_t)_rankExplanationToSimilarExplanation:(id)a3
{
  LODWORD(v3) = *((_DWORD *)a3 + 4);
  id v5 = [NSNumber numberWithFloat:v3];
  *(float *)&double v6 = self->_mean;
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  int64_t v8 = [v5 compare:v7];

  return v8;
}

- (_REMLFeatureExplanation)explanationWithStyle:(unint64_t)a3
{
  id v5 = [(REFeatureSet *)self->_features allFeatures];
  double v6 = [(REMLExplanation *)self _formattedFeatureListFromFeatures:v5 style:a3];

  if (a3 == 1)
  {
    if (self->_mean <= 0.0) {
      [NSString stringWithFormat:@"Low probability from %@", v6];
    }
    else {
      [NSString stringWithFormat:@"High probability from %@", v6];
    }
  }
  else
  {
    if (a3)
    {
      uint64_t v7 = @"Unknown style";
      goto LABEL_11;
    }
    if (self->_mean <= 0.0) {
      [NSString stringWithFormat:@"Low %@", v6];
    }
    else {
      [NSString stringWithFormat:@"High %@", v6];
    }
  }
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return (_REMLFeatureExplanation *)v7;
}

- (void).cxx_destruct
{
}

@end