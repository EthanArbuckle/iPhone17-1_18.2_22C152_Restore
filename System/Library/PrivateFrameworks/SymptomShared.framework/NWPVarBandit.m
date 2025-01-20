@interface NWPVarBandit
- (BOOL)selectModel:(unint64_t)a3;
- (BOOL)setInitialValue:(id)a3;
- (BOOL)setReward:(float)a3 onValue:(id)a4 forPredictionGenerationId:(id)a5;
- (NSMutableDictionary)lastSampleRewards;
- (SFCache)uuidCache;
- (id)_epsilongreedy_predictValueGivenContext:(id)a3;
- (id)_ucb_predictValueGivenContext:(id)a3;
- (id)initInNumRangeFrom:(id)a3 to:(id)a4 stride:(float)a5 withLabel:(id)a6;
- (id)initInValueSpace:(id)a3 withLabel:(id)a4;
- (id)predictValueGivenContext:(id)a3 generationId:(id *)a4;
- (void)_defaultModelInit;
- (void)setLastSampleRewards:(id)a3;
- (void)setUuidCache:(id)a3;
@end

@implementation NWPVarBandit

- (void)_defaultModelInit
{
  v6[8] = *MEMORY[0x263EF8340];
  [(NWPVar *)self setModel:1];
  v5[0] = @"analytics";
  v5[1] = @"kEpsilonValue";
  v6[0] = MEMORY[0x263EFFA80];
  v6[1] = &unk_270B45668;
  v5[2] = @"kEpsilonDecayRate";
  v5[3] = @"kEpsilonLastRewards";
  v6[2] = &unk_270B45688;
  v6[3] = &unk_270B45688;
  v5[4] = @"kEpsilonDecayedMinimumValue";
  v5[5] = @"kEpsilonResetAt";
  v6[4] = &unk_270B45688;
  v6[5] = &unk_270B45688;
  v5[6] = @"kUCBConfidenceValue";
  v5[7] = @"kUCBResetAt";
  v6[6] = &unk_270B45678;
  v6[7] = &unk_270B45688;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:8];
  [(NWPVar *)self setHyperParams:v3];

  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NWPVarBandit *)self setLastSampleRewards:v4];
}

- (id)initInValueSpace:(id)a3 withLabel:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NWPVarBandit;
  id v4 = [(NWPVar *)&v7 initInValueSpace:a3 withLabel:a4];
  v5 = v4;
  if (v4) {
    [v4 _defaultModelInit];
  }
  return v5;
}

- (id)initInNumRangeFrom:(id)a3 to:(id)a4 stride:(float)a5 withLabel:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = 0;
  if (v10 && v11)
  {
    [v10 floatValue];
    float v15 = v14;
    [v11 floatValue];
    if (v15 > v16 || ((float v17 = v16, v18 = v16 - v15, a5 >= 0.01) ? (v19 = v18 < a5) : (v19 = 1), v19))
    {
      v13 = 0;
    }
    else
    {
      id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
      do
      {
        *(float *)&double v21 = v15;
        v22 = [NSNumber numberWithFloat:v21];
        v23 = _numToInternalKey(v22);
        [v20 addObject:v23];

        float v15 = v15 + a5;
      }
      while (v15 <= v17);
      v27.receiver = self;
      v27.super_class = (Class)NWPVarBandit;
      id v24 = [(NWPVar *)&v27 initInValueSpace:v20 withLabel:v12];
      v25 = v24;
      if (v24)
      {
        [v24 setUseScalarRange:1];
        [v25 _defaultModelInit];
      }
      self = v25;

      v13 = self;
    }
  }

  return v13;
}

- (BOOL)setInitialValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    goto LABEL_14;
  }
  if (![(NWPVar *)self useScalarRange])
  {
    id v11 = [(NWPVar *)self allState];
    id v12 = [v11 objectForKeyedSubscript:v4];

    if (v12)
    {
      [(NWPVar *)self setFirstValue:v4];
      BOOL v8 = 1;
      goto LABEL_15;
    }
    v13 = nwpvarLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    int v16 = 134218242;
    float v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    float v14 = "(%p) failure to set initial value: %@, out of range";
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = nwpvarLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

LABEL_14:
      BOOL v8 = 0;
      goto LABEL_15;
    }
    int v16 = 134218242;
    float v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    float v14 = "(%p) failure to set initial value: %@, expected numerical type";
LABEL_12:
    _os_log_impl(&dword_25E6D0000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v16, 0x16u);
    goto LABEL_13;
  }
  v5 = _numToInternalKey(v4);
  v6 = [(NWPVar *)self allState];
  objc_super v7 = [v6 objectForKeyedSubscript:v5];
  BOOL v8 = v7 != 0;

  if (v7)
  {
    v9 = NSNumber;
    [v5 floatValue];
    id v10 = objc_msgSend(v9, "numberWithFloat:");
    [(NWPVar *)self setFirstValue:v10];
  }
  else
  {
    id v10 = nwpvarLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134218242;
      float v17 = self;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_25E6D0000, v10, OS_LOG_TYPE_ERROR, "(%p) failure to set initial value: %@, out of numerical range", (uint8_t *)&v16, 0x16u);
    }
  }

LABEL_15:
  return v8;
}

- (BOOL)selectModel:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 <= 1) {
    -[NWPVar setModel:](self, "setModel:");
  }
  return v3 < 2;
}

- (id)_epsilongreedy_predictValueGivenContext:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(NWPVarValue_Record);
  v5 = [(NWPVar *)self hyperParams];
  v6 = [v5 objectForKeyedSubscript:@"kEpsilonResetAt"];
  unint64_t v7 = [v6 unsignedIntegerValue];

  if (v7 && [(NWPVar *)self pullCount] >= v7) {
    [(NWPVar *)self _setToCleanSlate];
  }
  BOOL v8 = [(NWPVar *)self hyperParams];
  v9 = [v8 objectForKeyedSubscript:@"kEpsilonValue"];
  [v9 floatValue];
  float v11 = v10;

  id v12 = [(NWPVar *)self hyperParams];
  v13 = [v12 objectForKeyedSubscript:@"kEpsilonDecayRate"];
  [v13 floatValue];
  float v15 = v14;

  float v16 = (float)arc4random() * 2.3283e-10;
  if (v15 > 0.0)
  {
    float v11 = v11 / (float)((float)((float)[(NWPVar *)self pullCount] * v15) + 1.0);
    float v17 = [(NWPVar *)self hyperParams];
    __int16 v18 = [v17 objectForKeyedSubscript:@"kEpsilonDecayedMinimumValue"];
    [v18 floatValue];
    if (v11 <= v19)
    {
      uint64_t v20 = [(NWPVar *)self hyperParams];
      double v21 = [v20 objectForKeyedSubscript:@"kEpsilonDecayedMinimumValue"];
      [v21 floatValue];
      float v11 = v22;
    }
  }
  if (v16 <= v11)
  {
    v36 = [(NWPVar *)self referenceValues];
    uint32_t v37 = arc4random_uniform([v36 count]);

    v38 = [(NWPVar *)self referenceValues];
    double v33 = [v38 objectAtIndexedSubscript:v37];

    [(NWPVarValue_Record *)v4 setInfo:2];
    nwpvarLogHandle();
    *(double *)&id v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      v49 = self;
      __int16 v50 = 2048;
      double v51 = v16;
      __int16 v52 = 2048;
      double v53 = v11;
      __int16 v54 = 2112;
      uint64_t v55 = *(void *)&v33;
      _os_log_impl(&dword_25E6D0000, v24, OS_LOG_TYPE_INFO, "(%p) prediction detail, exploring, rand (%f) vs. epsilon (%f), returning: %@", buf, 0x2Au);
    }
  }
  else
  {
    v23 = [(NWPVar *)self allState];
    *(double *)&id v24 = [v23 keysSortedByValueUsingComparator:&__block_literal_global_320];

    v25 = nwpvarLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218242;
      v49 = self;
      __int16 v50 = 2112;
      double v51 = *(double *)&v24;
      _os_log_impl(&dword_25E6D0000, v25, OS_LOG_TYPE_DEBUG, "(%p) prediction detail, exploiting, all: %@", buf, 0x16u);
    }

    id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v27 = [(NWPVar *)self allState];
    v28 = [v24 objectAtIndexedSubscript:0];
    v29 = [v27 objectForKeyedSubscript:v28];
    [v29 sampleRewardMean];
    uint64_t v31 = v30;

    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __56__NWPVarBandit__epsilongreedy_predictValueGivenContext___block_invoke_321;
    v44[3] = &unk_26552AE68;
    id v32 = v26;
    id v45 = v32;
    v46 = self;
    uint64_t v47 = v31;
    [v24 enumerateObjectsUsingBlock:v44];
    objc_msgSend(v32, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v32, "count")));
    double v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    [(NWPVarValue_Record *)v4 setInfo:1];
    v34 = nwpvarLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      uint64_t v35 = [v32 count];
      *(_DWORD *)buf = 134219266;
      v49 = self;
      __int16 v50 = 2048;
      double v51 = v16;
      __int16 v52 = 2048;
      double v53 = v11;
      __int16 v54 = 2048;
      uint64_t v55 = v35;
      __int16 v56 = 2112;
      double v57 = v33;
      __int16 v58 = 2112;
      id v59 = v32;
      _os_log_impl(&dword_25E6D0000, v34, OS_LOG_TYPE_INFO, "(%p) prediction detail, exploiting, rand (%f) vs. epsilon (%f), leaders count: %lu, returning: %@, leaders: %@", buf, 0x3Eu);
    }
  }
  v39 = nwpvarLogHandle();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v49 = self;
    __int16 v50 = 2112;
    double v51 = v33;
    _os_log_impl(&dword_25E6D0000, v39, OS_LOG_TYPE_INFO, "(%p) prediction: %@", buf, 0x16u);
  }

  if ([(NWPVar *)self useScalarRange])
  {
    v40 = _numToInternalKey(*(void **)&v33);
    [(NWPVarValue_Record *)v4 setValue:v40];
  }
  else
  {
    [(NWPVarValue_Record *)v4 setValue:*(void *)&v33];
  }
  *(float *)&double v41 = v11;
  v42 = [NSNumber numberWithFloat:v41];
  [(NWPVarValue_Record *)v4 setEffective_epsilon:v42];

  return v4;
}

uint64_t __56__NWPVarBandit__epsilongreedy_predictValueGivenContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 sampleRewardMean];
  double v7 = v6;
  [v5 sampleRewardMean];
  if (v7 <= v8)
  {
    [v4 sampleRewardMean];
    double v11 = v10;
    [v5 sampleRewardMean];
    uint64_t v9 = v11 < v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void __56__NWPVarBandit__epsilongreedy_predictValueGivenContext___block_invoke_321(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v11 = v7;
  if (a3)
  {
    double v8 = [*(id *)(a1 + 40) allState];
    uint64_t v9 = [v8 objectForKeyedSubscript:v11];

    [v9 sampleRewardMean];
    if (vabdd_f64(v10, *(double *)(a1 + 48)) >= 0.000000001) {
      *a4 = 1;
    }
    else {
      [*(id *)(a1 + 32) addObject:v11];
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

- (id)_ucb_predictValueGivenContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v30 = objc_alloc_init(NWPVarValue_Record);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v5 = [(NWPVar *)self hyperParams];
  double v6 = [v5 objectForKeyedSubscript:@"kUCBConfidenceValue"];
  [v6 floatValue];
  float v8 = v7;

  uint64_t v9 = [(NWPVar *)self hyperParams];
  double v10 = [v9 objectForKeyedSubscript:@"kUCBResetAt"];
  unint64_t v11 = [v10 unsignedIntegerValue];

  if (v11 && [(NWPVar *)self pullCount] >= v11) {
    [(NWPVar *)self _setToCleanSlate];
  }
  double v12 = log((double)([(NWPVar *)self pullCount] + 1));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v13 = [(NWPVar *)self allState];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    float v16 = v12;
    uint64_t v17 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v20 = [(NWPVar *)self allState];
        double v21 = [v20 objectForKeyedSubscript:v19];

        float v22 = NSNumber;
        [v21 sampleRewardMean];
        id v24 = objc_msgSend(v22, "numberWithDouble:", v23 + v8 * sqrt((float)(v16 / (float)(unint64_t)objc_msgSend(v21, "armPullCount"))));
        [v4 setObject:v24 forKeyedSubscript:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v15);
  }

  v25 = [v4 keysSortedByValueUsingComparator:&__block_literal_global_324];
  id v26 = [v25 objectAtIndexedSubscript:0];
  objc_super v27 = nwpvarLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v36 = self;
    __int16 v37 = 2112;
    v38 = v26;
    _os_log_impl(&dword_25E6D0000, v27, OS_LOG_TYPE_INFO, "(%p) prediction: %@", buf, 0x16u);
  }

  if ([(NWPVar *)self useScalarRange])
  {
    v28 = _numToInternalKey(v26);
    [(NWPVarValue_Record *)v30 setValue:v28];
  }
  else
  {
    [(NWPVarValue_Record *)v30 setValue:v26];
  }

  return v30;
}

uint64_t __46__NWPVarBandit__ucb_predictValueGivenContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)predictValueGivenContext:(id)a3 generationId:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  float v7 = objc_alloc_init(NWPVarValue_Record);
  [(NWPVar *)self setLogicalClock:[(NWPVar *)self logicalClock] + 1];
  float v8 = [(NWPVar *)self firstValue];

  if (!v8)
  {
    if ([(NWPVar *)self model] == 2) {
      [(NWPVarBandit *)self _ucb_predictValueGivenContext:v6];
    }
    else {
    __int16 v18 = [(NWPVarBandit *)self _epsilongreedy_predictValueGivenContext:v6];
    }

    BOOL v19 = [(NWPVar *)self useScalarRange];
    uint64_t v20 = [(NWPVarValue_Record *)v18 value];
    uint64_t v9 = v20;
    if (v19)
    {
      double v21 = NSNumber;
      [v20 floatValue];
      uint64_t v22 = objc_msgSend(v21, "numberWithFloat:");

      uint64_t v9 = (void *)v22;
    }
    float v7 = v18;
    if (a4) {
      goto LABEL_10;
    }
LABEL_17:
    id v17 = [(NWPVarValue_Record *)v7 value];
    [(NWPVar *)self setExpectingRewardOn:v17];
    goto LABEL_18;
  }
  uint64_t v9 = [(NWPVar *)self firstValue];
  if ([(NWPVar *)self useScalarRange])
  {
    double v10 = _numToInternalKey(v9);
    [(NWPVarValue_Record *)v7 setValue:v10];
  }
  else
  {
    [(NWPVarValue_Record *)v7 setValue:v9];
  }
  [(NWPVarValue_Record *)v7 setInfo:4];
  unint64_t v11 = [NSNumber numberWithFloat:0.0];
  [(NWPVarValue_Record *)v7 setEffective_epsilon:v11];

  [(NWPVar *)self setFirstValue:0];
  double v12 = nwpvarLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v24 = 134218242;
    v25 = self;
    __int16 v26 = 2112;
    objc_super v27 = v9;
    _os_log_impl(&dword_25E6D0000, v12, OS_LOG_TYPE_INFO, "(%p) prediction from initial value: %@", (uint8_t *)&v24, 0x16u);
  }

  if (!a4) {
    goto LABEL_17;
  }
LABEL_10:
  v13 = [MEMORY[0x263F08C38] UUID];
  uint64_t v14 = [(NWPVarBandit *)self uuidCache];

  if (!v14)
  {
    uint64_t v15 = [[SFCache alloc] initWithPolicy:0];
    [(NWPVarBandit *)self setUuidCache:v15];
  }
  float v16 = [(NWPVarBandit *)self uuidCache];
  [v16 addEntry:v7 forKey:v13];

  id v17 = v13;
  *a4 = v17;
LABEL_18:

  return v9;
}

- (BOOL)setReward:(float)a3 onValue:(id)a4 forPredictionGenerationId:(id)a5
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  double v8 = COERCE_DOUBLE(a4);
  double v9 = COERCE_DOUBLE(a5);
  if ([(NWPVar *)self useScalarRange])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      nwpvarLogHandle();
      *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_18;
      }
      *(_DWORD *)buf = 134218498;
      v70 = self;
      __int16 v71 = 2048;
      double v72 = a3;
      __int16 v73 = 2112;
      uint64_t v74 = *(void *)&v8;
      double v21 = "(%p) setting reward: %f for invalid value type: %@, failed";
      goto LABEL_16;
    }
    uint64_t v10 = _numToInternalKey(*(void **)&v8);

    double v8 = *(double *)&v10;
  }
  if (v8 == 0.0
    || ([(NWPVar *)self allState],
        unint64_t v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKeyedSubscript:*(void *)&v8],
        double v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    nwpvarLogHandle();
    *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 134218498;
    v70 = self;
    __int16 v71 = 2048;
    double v72 = a3;
    __int16 v73 = 2112;
    uint64_t v74 = *(void *)&v8;
    double v21 = "(%p) setting reward: %f for invalid value: %@, failed";
LABEL_16:
    uint64_t v22 = v13;
    uint32_t v23 = 32;
LABEL_17:
    _os_log_impl(&dword_25E6D0000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    goto LABEL_18;
  }
  if (v9 != 0.0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(double *)&v13 = COERCE_DOUBLE(*(id *)&v9);
      uint64_t v14 = [(NWPVarBandit *)self uuidCache];

      if (v14)
      {
        uint64_t v15 = [(NWPVarBandit *)self uuidCache];
        float v16 = [v15 entryForKey:v13];

        if (v16)
        {
          id v17 = [v16 value];
          char v18 = [v17 isEqual:*(void *)&v8];

          if (v18)
          {
            BOOL v19 = [(NWPVarBandit *)self uuidCache];
            [v19 removeObjectForKey:v13];

            int v20 = 0;
            goto LABEL_25;
          }
          double v57 = nwpvarLogHandle();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            double v58 = [v16 value];
            *(_DWORD *)buf = 134218498;
            v70 = self;
            __int16 v71 = 2112;
            double v72 = v58;
            __int16 v73 = 2112;
            uint64_t v74 = *(void *)&v8;
            _os_log_impl(&dword_25E6D0000, v57, OS_LOG_TYPE_ERROR, "(%p) supplied uuid was minted for a different value %@ (which is not %@)", buf, 0x20u);
          }
          goto LABEL_52;
        }
        float v16 = nwpvarLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v70 = self;
          __int16 v71 = 2112;
          double v72 = *(double *)&v13;
          __int16 v56 = "(%p) supplied uuid has already been used or expired %@";
          goto LABEL_48;
        }
      }
      else
      {
        float v16 = nwpvarLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v70 = self;
          __int16 v71 = 2112;
          double v72 = *(double *)&v13;
          __int16 v56 = "(%p) supplied uuid didn't come from us %@";
LABEL_48:
          _os_log_impl(&dword_25E6D0000, v16, OS_LOG_TYPE_ERROR, v56, buf, 0x16u);
        }
      }
LABEL_52:

      goto LABEL_18;
    }
    nwpvarLogHandle();
    *(double *)&v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v70 = self;
      __int16 v71 = 2112;
      double v72 = v9;
      double v21 = "(%p) supplied uuid is not the expected type %@";
      uint64_t v22 = v13;
      uint32_t v23 = 22;
      goto LABEL_17;
    }
LABEL_18:
    BOOL v24 = 0;
    goto LABEL_19;
  }
  __int16 v26 = [(NWPVar *)self expectingRewardOn];
  int v27 = [*(id *)&v8 isEqual:v26];

  if (v27)
  {
    [(NWPVar *)self setExpectingRewardOn:0];
    float v16 = 0;
    int v20 = 1;
  }
  else
  {
    int v20 = 0;
    float v16 = 0;
  }
LABEL_25:
  uint64_t v28 = [(NWPVar *)self allState];
  v29 = [v28 objectForKeyedSubscript:*(void *)&v8];

  id v30 = v29;
  objc_sync_enter(v30);
  int v68 = (*(void *)&v9 != 0) | v20;
  if (v68 == 1)
  {
    [(NWPVar *)self setPullCount:[(NWPVar *)self pullCount] + 1];
    objc_msgSend(v30, "setArmPullCount:", objc_msgSend(v30, "armPullCount") + 1);
    long long v31 = nwpvarLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    *(double *)&unint64_t v32 = COERCE_DOUBLE([(NWPVar *)self pullCount]);
    uint64_t v33 = [v30 armPullCount];
    uint64_t v34 = [v30 armObservedCount];
    uint64_t v35 = "weak";
    *(_DWORD *)buf = 134219010;
    v70 = self;
    if (v9 != 0.0) {
      uint64_t v35 = "strong";
    }
    __int16 v71 = 2048;
    double v72 = *(double *)&v32;
    __int16 v73 = 2048;
    uint64_t v74 = v33;
    __int16 v75 = 2048;
    uint64_t v76 = v34;
    __int16 v77 = 2080;
    v78 = v35;
    v36 = "(%p) incrementing pulls to %lu, arm pulls to %llu, arm observed %llu, %s prediction nexus";
    __int16 v37 = v31;
    uint32_t v38 = 52;
  }
  else
  {
    objc_msgSend(v30, "setArmObservedCount:", objc_msgSend(v30, "armObservedCount") + 1);
    long long v31 = nwpvarLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_33;
    }
    *(_DWORD *)buf = 134218752;
    v70 = self;
    __int16 v71 = 2048;
    double v72 = COERCE_DOUBLE([(NWPVar *)self pullCount]);
    __int16 v73 = 2048;
    uint64_t v74 = [v30 armPullCount];
    __int16 v75 = 2048;
    uint64_t v76 = [v30 armObservedCount];
    v36 = "(%p) not incrementing pulls %lu, arm pulls %llu, arm observed up to %llu, no prediction nexus";
    __int16 v37 = v31;
    uint32_t v38 = 42;
  }
  _os_log_impl(&dword_25E6D0000, v37, OS_LOG_TYPE_INFO, v36, buf, v38);
LABEL_33:

  [v30 sampleRewardMean];
  objc_msgSend(v30, "setSampleRewardMean:", v39+ (a3 - v39)* (float)(1.0 / (float)(unint64_t)(objc_msgSend(v30, "armObservedCount") + objc_msgSend(v30, "armPullCount"))));
  [v30 sampleRewardSum];
  [v30 setSampleRewardSum:v40 + a3];
  [v30 sampleRewardSumSquares];
  [v30 setSampleRewardSumSquares:a3 * a3 + v41];
  v42 = [(NWPVar *)self hyperParams];
  v43 = [v42 objectForKeyedSubscript:@"kEpsilonLastRewards"];
  unsigned int v44 = [v43 intValue];

  if (v44)
  {
    id v45 = [(NWPVarBandit *)self lastSampleRewards];
    id v46 = [v45 objectForKeyedSubscript:*(void *)&v8];

    if (!v46)
    {
      id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
      v48 = [(NWPVarBandit *)self lastSampleRewards];
      [v48 setObject:v46 forKeyedSubscript:*(void *)&v8];
    }
    *(float *)&double v47 = a3;
    v49 = [NSNumber numberWithFloat:v47];
    [v46 addObject:v49];

    if ([v46 count] > (unint64_t)v44) {
      [v46 removeObjectAtIndex:0];
    }
  }
  id v50 = [(NWPVar *)self telemetryReporter];
  if (!v50) {
    goto LABEL_59;
  }
  double v51 = [(NWPVar *)self exportLabel];
  if (!v51) {
    goto LABEL_58;
  }
  __int16 v52 = [(NWPVar *)self hyperParams];
  double v53 = [v52 objectForKeyedSubscript:@"analytics"];
  int v54 = [v53 BOOLValue];

  if (v54)
  {
    if (v68) {
      uint64_t v55 = [v16 info];
    }
    else {
      uint64_t v55 = 3;
    }
    id v59 = [v16 effective_epsilon];
    uint64_t v60 = v59;
    if (v59)
    {
      id v50 = v59;
    }
    else
    {
      v61 = [(NWPVar *)self hyperParams];
      id v50 = [v61 objectForKeyedSubscript:@"kEpsilonValue"];
    }
    v62 = [(NWPVar *)self telemetryReporter];
    ((void (**)(void, NWPVarBandit *, id, void, uint64_t, float))v62)[2](v62, self, v50, *(void *)&v8, v55, a3);

LABEL_58:
  }
LABEL_59:
  objc_sync_exit(v30);

  v63 = nwpvarLogHandle();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    uint64_t v64 = [v30 armPullCount];
    [v30 sampleRewardMean];
    uint64_t v66 = v65;
    [v30 sampleRewardSum];
    *(_DWORD *)buf = 134219010;
    v70 = self;
    __int16 v71 = 2112;
    double v72 = v8;
    __int16 v73 = 2048;
    uint64_t v74 = v64;
    __int16 v75 = 2048;
    uint64_t v76 = v66;
    __int16 v77 = 2048;
    v78 = v67;
    _os_log_impl(&dword_25E6D0000, v63, OS_LOG_TYPE_INFO, "(%p) setting reward detail for %@: pulls=%llu, sampleRewardMean=%f, sampleRewardSum=%f", buf, 0x34u);
  }

  BOOL v24 = 1;
  v13 = v16;
LABEL_19:

  return v24;
}

- (SFCache)uuidCache
{
  return self->_uuidCache;
}

- (void)setUuidCache:(id)a3
{
}

- (NSMutableDictionary)lastSampleRewards
{
  return self->_lastSampleRewards;
}

- (void)setLastSampleRewards:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSampleRewards, 0);
  objc_storeStrong((id *)&self->_uuidCache, 0);
}

@end