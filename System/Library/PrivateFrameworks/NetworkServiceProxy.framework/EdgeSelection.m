@interface EdgeSelection
+ (BOOL)supportsSecureCoding;
- (EdgeSelection)initWithCoder:(id)a3;
- (EdgeSelection)initWithNetworkSignature:(id)a3 interfaceType:(id)a4 modelParams:(id)a5;
- (NSData)networkSignature;
- (NSMutableDictionary)edgeAttributesDict;
- (NSNumber)interfaceType;
- (double)_stochasticRewardFromRTT:(double)a3;
- (double)alpha;
- (id)description;
- (int64_t)trialCount;
- (int64_t)windowSize;
- (void)encodeWithCoder:(id)a3;
- (void)getAttributesForEdge:(id)a3 reply:(id)a4;
- (void)getMinimumLatencyEdge:(id)a3;
- (void)setAlpha:(double)a3;
- (void)setEdgeAttributesDict:(id)a3;
- (void)setInterfaceType:(id)a3;
- (void)setNetworkSignature:(id)a3;
- (void)setTrialCount:(int64_t)a3;
- (void)setWindowSize:(int64_t)a3;
- (void)trainEdgeSelectionModel:(id)a3 reply:(id)a4;
@end

@implementation EdgeSelection

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(EdgeSelection *)self alpha];
  uint64_t v5 = v4;
  int64_t v6 = [(EdgeSelection *)self windowSize];
  int64_t v7 = [(EdgeSelection *)self trialCount];
  v8 = [(EdgeSelection *)self networkSignature];
  v9 = [(EdgeSelection *)self interfaceType];
  v10 = [(EdgeSelection *)self edgeAttributesDict];
  objc_msgSend(v3, "appendFormat:", @"(alpha %f windowSize %ld, trialCount %ld, signature %@, interfaceType %@, edgeAttributesDict %@"), v5, v6, v7, v8, v9, v10;

  return v3;
}

- (EdgeSelection)initWithNetworkSignature:(id)a3 interfaceType:(id)a4 modelParams:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)EdgeSelection;
  v12 = [(EdgeSelection *)&v30 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_networkSignature, a3);
    objc_storeStrong((id *)&v13->_interfaceType, a4);
    v14 = [v11 objectForKeyedSubscript:@"kESSAlpha"];
    if (v14)
    {
      v15 = [v11 objectForKeyedSubscript:@"kESSAlpha"];
      [v15 doubleValue];
      v13->_alpha = v16;
    }
    else
    {
      v13->_alpha = 2.0;
    }

    v17 = [v11 objectForKeyedSubscript:@"kESSWindowSize"];
    if (v17)
    {
      v18 = [v11 objectForKeyedSubscript:@"kESSWindowSize"];
      v13->_windowSize = [v18 integerValue];
    }
    else
    {
      v13->_windowSize = 10;
    }

    v13->_trialCount = 0;
    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    edgeAttributesDict = v13->_edgeAttributesDict;
    v13->_edgeAttributesDict = (NSMutableDictionary *)v19;
  }
  v21 = nplog_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    [(EdgeSelection *)v13 alpha];
    uint64_t v24 = v23;
    uint64_t v25 = [(EdgeSelection *)v13 windowSize];
    uint64_t v26 = [(EdgeSelection *)v13 trialCount];
    v27 = [(EdgeSelection *)v13 edgeAttributesDict];
    v28 = [(EdgeSelection *)v13 networkSignature];
    v29 = [(EdgeSelection *)v13 interfaceType];
    *(_DWORD *)buf = 134219266;
    uint64_t v32 = v24;
    __int16 v33 = 2048;
    uint64_t v34 = v25;
    __int16 v35 = 2048;
    uint64_t v36 = v26;
    __int16 v37 = 2112;
    v38 = v27;
    __int16 v39 = 2112;
    v40 = v28;
    __int16 v41 = 2112;
    v42 = v29;
    _os_log_debug_impl(&dword_1A0FEE000, v21, OS_LOG_TYPE_DEBUG, "ESS: EdgeSelection object initialized with alpha: %f, windowsize: %ld, trial count: %ld, edgeAttributesDict: %@ (%@ %@)", buf, 0x3Eu);
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EdgeSelection)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EdgeSelection;
  uint64_t v5 = [(EdgeSelection *)&v21 init];
  if (v5)
  {
    int64_t v6 = (void *)MEMORY[0x1A622B520]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkSignature"];
    networkSignature = v5->_networkSignature;
    v5->_networkSignature = (NSData *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interfaceType"];
    interfaceType = v5->_interfaceType;
    v5->_interfaceType = (NSNumber *)v9;

    [v4 decodeDoubleForKey:@"alpha"];
    v5->_alpha = v11;
    v5->_windowSize = [v4 decodeIntegerForKey:@"windowSize"];
    v5->_trialCount = [v4 decodeIntegerForKey:@"trialCount"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"edgeAttributesDict"];
    edgeAttributesDict = v5->_edgeAttributesDict;
    v5->_edgeAttributesDict = (NSMutableDictionary *)v18;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)MEMORY[0x1A622B520]();
  [v5 encodeObject:self->_networkSignature forKey:@"networkSignature"];
  [v5 encodeObject:self->_interfaceType forKey:@"interfaceType"];
  [v5 encodeDouble:@"alpha" forKey:self->_alpha];
  [v5 encodeInteger:self->_windowSize forKey:@"windowSize"];
  [v5 encodeInteger:self->_trialCount forKey:@"trialCount"];
  [v5 encodeObject:self->_edgeAttributesDict forKey:@"edgeAttributesDict"];
}

- (void)trainEdgeSelectionModel:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke;
  v15[3] = &unk_1E5A3B090;
  v17 = v18;
  v15[4] = self;
  id v8 = v7;
  id v16 = v8;
  [v6 enumerateKeysAndObjectsUsingBlock:v15];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v9 = [(EdgeSelection *)self edgeAttributesDict];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke_85;
  v12[3] = &unk_1E5A3B0B8;
  v12[4] = v14;
  v12[5] = v13;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  id v10 = [(EdgeSelection *)self edgeAttributesDict];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke_2;
  v11[3] = &unk_1E5A3B0E0;
  v11[4] = self;
  v11[5] = v14;
  v11[6] = v13;
  [v10 enumerateKeysAndObjectsUsingBlock:v11];

  if (v8) {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(v18, 8);
}

void __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  if (!v7)
  {
    uint64_t v14 = 0;
    double v13 = 0.0;
LABEL_11:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_12;
  }
  id v10 = [v8 objectForKeyedSubscript:@"kESSRTT"];
  if (v10)
  {
    double v11 = [v9 objectForKeyedSubscript:@"kESSRTT"];
    [v11 doubleValue];
    double v13 = v12;
  }
  else
  {
    double v13 = 0.0;
  }

  uint64_t v15 = [v9 objectForKeyedSubscript:@"kESSRank"];
  if (!v15)
  {
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  id v16 = (void *)v15;
  v17 = [v9 objectForKeyedSubscript:@"kESSRank"];
  uint64_t v14 = [v17 unsignedIntegerValue];

  if (v13 <= 0.0 || !v14) {
    goto LABEL_11;
  }
LABEL_12:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    char v19 = [MEMORY[0x1E4F1CA48] array];
    v20 = [v9 objectForKeyedSubscript:@"kESSIsSelected"];
    int v21 = [v20 BOOLValue];

    uint64_t v73 = a1;
    v22 = [*(id *)(a1 + 32) edgeAttributesDict];
    uint64_t v23 = [v22 objectForKeyedSubscript:v7];

    if (v23)
    {
      uint64_t v24 = [v23 objectForKeyedSubscript:@"kESSRTTSamples"];

      uint64_t v25 = [v23 objectForKeyedSubscript:@"kESSRewardSamples"];

      uint64_t v26 = [v23 objectForKeyedSubscript:@"kESSRewardSampleMean"];
      [v26 doubleValue];
      double v28 = v27;

      v29 = [v23 objectForKeyedSubscript:@"kESSSelectionCount"];
      uint64_t v30 = (int)[v29 intValue];

      v31 = [v23 objectForKeyedSubscript:@"kESSPolicyMetric"];
      [v31 doubleValue];
      double v33 = v32;

      uint64_t v34 = [v23 objectForKeyedSubscript:@"kESSNoRTTCount"];
      uint64_t v35 = [v34 integerValue];

      uint64_t v36 = [v23 objectForKeyedSubscript:@"kESSRank"];
      uint64_t v71 = [v36 unsignedIntegerValue];

      uint64_t v37 = v30 + 1;
      uint64_t v38 = v35 + 1;
      uint64_t v18 = (void *)v24;
      char v19 = (void *)v25;
      if (!v21) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v71 = v14;
      double v28 = 0.0;
      uint64_t v37 = 1;
      double v33 = 0.0;
      uint64_t v38 = 1;
      if (!v21)
      {
LABEL_35:

        goto LABEL_36;
      }
    }
    if (v13 != 4294967300.0) {
      uint64_t v38 = 0;
    }
    v72 = v19;
    v69 = v9;
    v70 = v7;
    uint64_t v68 = v38;
    if (v13 == 4294967300.0 && v38 < 3)
    {
      __int16 v41 = @"not ";
      double v42 = 0.0;
    }
    else
    {
      uint64_t v43 = v37;
      [*(id *)(v73 + 32) _stochasticRewardFromRTT:v13];
      double v42 = v44;
      unint64_t v45 = [v19 count];
      if (v45 >= [*(id *)(v73 + 32) windowSize])
      {
        [v19 removeObjectAtIndex:0];
        [v18 removeObjectAtIndex:0];
      }
      v46 = [NSNumber numberWithDouble:v42];
      [v19 addObject:v46];

      v47 = [NSNumber numberWithDouble:v13];
      [v18 addObject:v47];

      if ([v19 count])
      {
        v48 = [v19 valueForKeyPath:@"@sum.self"];
        [v48 doubleValue];
        double v28 = v49 / (double)(unint64_t)[v19 count];
      }
      else
      {
        double v28 = 0.0;
      }
      uint64_t v37 = v43;
      __int16 v41 = &stru_1EF4275C8;
    }
    v67 = v23;
    v50 = nplog_obj();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(v73 + 32) networkSignature];
      v64 = uint64_t v63 = v37;
      v65 = [*(id *)(v73 + 32) interfaceType];
      *(_DWORD *)buf = 138413826;
      v75 = v41;
      __int16 v76 = 2112;
      double v77 = *(double *)&v70;
      __int16 v78 = 2048;
      double v79 = v13;
      __int16 v80 = 2048;
      double v81 = v42;
      __int16 v82 = 2048;
      double v83 = v28;
      __int16 v84 = 2112;
      v85 = v64;
      __int16 v86 = 2112;
      v87 = v65;
      _os_log_debug_impl(&dword_1A0FEE000, v50, OS_LOG_TYPE_DEBUG, "ESS: (%@training) Received new RTT for edge: %@, RTT: %f, reward: %.15f, reward mean: %.15f (%@ %@)", buf, 0x48u);

      uint64_t v37 = v63;
    }

    v66 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v51 = [NSNumber numberWithDouble:v28];
    v52 = [NSNumber numberWithInteger:v37];
    v53 = [NSNumber numberWithDouble:v33];
    v54 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(v73 + 32), "trialCount"));
    v55 = [NSNumber numberWithInteger:v68];
    v56 = [NSNumber numberWithUnsignedInteger:v71];
    v57 = [MEMORY[0x1E4F1C9C8] date];
    v58 = (void *)v51;
    char v19 = v72;
    objc_msgSend(v66, "dictionaryWithObjectsAndKeys:", v18, @"kESSRTTSamples", v72, @"kESSRewardSamples", v51, @"kESSRewardSampleMean", v52, @"kESSSelectionCount", v53, @"kESSPolicyMetric", v54, @"kESSTrialCount", v55, @"kESSNoRTTCount", v56, @"kESSRank", v57,
      @"kESSLastUsedTimestamp",
    v59 = 0);

    v60 = [*(id *)(v73 + 32) edgeAttributesDict];
    id v7 = v70;
    [v60 setObject:v59 forKey:v70];

    uint64_t v9 = v69;
    uint64_t v23 = v67;
    goto LABEL_35;
  }
  *a4 = 1;
  __int16 v39 = nplog_obj();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    v61 = [*(id *)(a1 + 32) networkSignature];
    v62 = [*(id *)(a1 + 32) interfaceType];
    *(_DWORD *)buf = 138413314;
    v75 = v7;
    __int16 v76 = 2048;
    double v77 = v13;
    __int16 v78 = 2048;
    double v79 = *(double *)&v14;
    __int16 v80 = 2112;
    double v81 = *(double *)&v61;
    __int16 v82 = 2112;
    double v83 = *(double *)&v62;
    _os_log_debug_impl(&dword_1A0FEE000, v39, OS_LOG_TYPE_DEBUG, "ESS: Failed updating attributes for edge: %@, RTT: %f, rank: %ld (%@ %@)", buf, 0x34u);
  }
  uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:33 userInfo:0];
  uint64_t v40 = *(void *)(a1 + 40);
  if (v40) {
    (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v18);
  }
LABEL_36:
}

void __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke_85(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"kESSRewardSamples"];
  id v6 = [v5 lastObject];
  [v6 doubleValue];
  double v8 = v7;

  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v8 > *(double *)(v9 + 24)) {
    *(double *)(v9 + 24) = v8;
  }
  id v10 = [v4 objectForKeyedSubscript:@"kESSRewardSampleMean"];

  [v10 doubleValue];
  double v12 = v11;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v12 > *(double *)(v13 + 24)) {
    *(double *)(v13 + 24) = v12;
  }
}

void __47__EdgeSelection_trainEdgeSelectionModel_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  double v8 = 0.0;
  double v9 = 0.0;
  if (*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0.0)
  {
    id v10 = [v6 objectForKeyedSubscript:@"kESSRewardSamples"];
    double v11 = [v10 lastObject];
    [v11 doubleValue];
    double v9 = v12 / *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  uint64_t v13 = [NSNumber numberWithDouble:v9];
  [v7 setObject:v13 forKey:@"kESSGoodness"];

  uint64_t v14 = [v7 objectForKeyedSubscript:@"kESSRank"];
  unint64_t v15 = [v14 unsignedIntegerValue];

  id v16 = [*(id *)(a1 + 32) interfaceType];
  int v17 = [v16 intValue];

  if (v17 == 1) {
    unint64_t v18 = (unint64_t)((double)v15 * (double)v15);
  }
  else {
    unint64_t v18 = v15;
  }
  if (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 0.0)
  {
    char v19 = [v7 objectForKeyedSubscript:@"kESSRewardSampleMean"];
    [v19 doubleValue];
    double v8 = v20 / (*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) * (double)(10 * v18 - 9));
  }
  int v21 = [NSNumber numberWithDouble:v8];
  [v7 setObject:v21 forKey:@"kESSFairness"];

  v22 = nplog_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = [*(id *)(a1 + 32) networkSignature];
    uint64_t v24 = [*(id *)(a1 + 32) interfaceType];
    int v25 = 138413314;
    id v26 = v5;
    __int16 v27 = 2048;
    unint64_t v28 = v18;
    __int16 v29 = 2048;
    double v30 = v8;
    __int16 v31 = 2112;
    double v32 = v23;
    __int16 v33 = 2112;
    uint64_t v34 = v24;
    _os_log_debug_impl(&dword_1A0FEE000, v22, OS_LOG_TYPE_DEBUG, "ESS: Setting fairness for edge: %@, rank: %ld, fairness: %.15f (%@ %@)", (uint8_t *)&v25, 0x34u);
  }
}

- (void)getMinimumLatencyEdge:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a3;
  [(EdgeSelection *)self setTrialCount:[(EdgeSelection *)self trialCount] + 1];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy_;
  int v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v17 = 0;
  unint64_t v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x41EFFFFFFFE00000;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  id v5 = [(EdgeSelection *)self edgeAttributesDict];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__EdgeSelection_getMinimumLatencyEdge___block_invoke;
  v15[3] = &unk_1E5A3B108;
  v15[4] = self;
  void v15[5] = v16;
  v15[6] = &v21;
  v15[7] = &v17;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];

  id v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = v22[5];
    uint64_t v12 = *((void *)v18 + 3);
    uint64_t v13 = [(EdgeSelection *)self networkSignature];
    uint64_t v14 = [(EdgeSelection *)self interfaceType];
    *(_DWORD *)buf = 138413058;
    uint64_t v30 = v11;
    __int16 v31 = 2048;
    uint64_t v32 = v12;
    __int16 v33 = 2112;
    uint64_t v34 = v13;
    __int16 v35 = 2112;
    uint64_t v36 = v14;
    _os_log_debug_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_DEBUG, "ESS: Returning selected edge: %@, last RTT: %f (%@ %@)", buf, 0x2Au);
  }
  v27[0] = @"kESSSelectedEdgeLabel";
  uint64_t v7 = v22[5];
  if (v7)
  {
    double v8 = (void *)v22[5];
  }
  else
  {
    double v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[1] = @"kESSRTT";
  v28[0] = v8;
  double v9 = [NSNumber numberWithDouble:v18[3]];
  v28[1] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  if (!v7) {
  if (v4)
  }
    v4[2](v4, v10, 0);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

void __39__EdgeSelection_getMinimumLatencyEdge___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = [v7 objectForKeyedSubscript:@"kESSRTTSamples"];
      double v9 = [v7 objectForKeyedSubscript:@"kESSRewardSampleMean"];
      [v9 doubleValue];
      double v11 = v10;

      uint64_t v12 = [v7 objectForKeyedSubscript:@"kESSSelectionCount"];
      uint64_t v13 = [v12 integerValue];

      uint64_t v14 = [v7 objectForKeyedSubscript:@"kESSGoodness"];
      [v14 doubleValue];
      long double v16 = v15;

      uint64_t v17 = [v7 objectForKeyedSubscript:@"kESSFairness"];
      [v17 doubleValue];
      double v19 = v18;

      double v20 = 0.0;
      if (v13 >= 1 && [*(id *)(a1 + 32) trialCount] >= 1 && v19 >= 0.0 && v16 >= 0.0)
      {
        [*(id *)(a1 + 32) alpha];
        if (v21 > 0.0)
        {
          long double v22 = (double)[*(id *)(a1 + 32) trialCount];
          [*(id *)(a1 + 32) alpha];
          long double v24 = pow(v16, v23);
          long double v25 = pow(v22, v19 * v24);
          long double v26 = log(v25);
          double v20 = v11 + sqrt((v26 + v26) / (double)v13);
        }
      }
      __int16 v27 = nplog_obj();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = [*(id *)(a1 + 32) trialCount];
        __int16 v35 = [*(id *)(a1 + 32) networkSignature];
        uint64_t v36 = [*(id *)(a1 + 32) interfaceType];
        int v39 = 138414338;
        id v40 = v6;
        __int16 v41 = 2048;
        double v42 = v11;
        __int16 v43 = 2048;
        uint64_t v44 = v34;
        __int16 v45 = 2048;
        double v46 = v19;
        __int16 v47 = 2048;
        long double v48 = v16;
        __int16 v49 = 2048;
        uint64_t v50 = v13;
        __int16 v51 = 2048;
        double v52 = v20;
        __int16 v53 = 2112;
        v54 = v35;
        __int16 v55 = 2112;
        v56 = v36;
        _os_log_debug_impl(&dword_1A0FEE000, v27, OS_LOG_TYPE_DEBUG, "ESS: Computing metric for edge: %@, reward mean: %.15f, trial: %ld, fairness: %.15f, goodness: %.15f, selections: %ld, metric: %.15f (%@ %@)", (uint8_t *)&v39, 0x5Cu);
      }
      uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v20 > *(double *)(v28 + 24))
      {
        *(double *)(v28 + 24) = v20;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        __int16 v29 = [v8 lastObject];
        [v29 doubleValue];
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v30;
      }
      __int16 v31 = [NSNumber numberWithDouble:v20];
      [v7 setObject:v31 forKey:@"kESSPolicyMetric"];

      uint64_t v32 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "trialCount"));
      [v7 setObject:v32 forKey:@"kESSTrialCount"];

      __int16 v33 = nplog_obj();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = [*(id *)(a1 + 32) networkSignature];
        uint64_t v38 = [*(id *)(a1 + 32) interfaceType];
        int v39 = 138413058;
        id v40 = v6;
        __int16 v41 = 2112;
        double v42 = *(double *)&v7;
        __int16 v43 = 2112;
        uint64_t v44 = (uint64_t)v37;
        __int16 v45 = 2112;
        double v46 = *(double *)&v38;
        _os_log_debug_impl(&dword_1A0FEE000, v33, OS_LOG_TYPE_DEBUG, "ESS: Updated attributes for edge: %@, attributes: %@ (%@ %@)", (uint8_t *)&v39, 0x2Au);
      }
    }
  }
}

- (void)getAttributesForEdge:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  double v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v6)
  {
    double v9 = [(EdgeSelection *)self edgeAttributesDict];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44__EdgeSelection_getAttributesForEdge_reply___block_invoke;
    v14[3] = &unk_1E5A3B130;
    double v15 = v6;
    long double v16 = self;
    id v17 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v14];

    double v10 = 0;
    double v11 = v15;
  }
  else
  {
    double v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    double v11 = nplog_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [(EdgeSelection *)self networkSignature];
      uint64_t v13 = [(EdgeSelection *)self interfaceType];
      *(_DWORD *)buf = 138412546;
      double v19 = v12;
      __int16 v20 = 2112;
      double v21 = v13;
      _os_log_debug_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_DEBUG, "ESS: Attributes queried for null edge (%@ %@)", buf, 0x16u);
    }
  }

  if (v7) {
    v7[2](v7, v8, v10);
  }
}

void __44__EdgeSelection_getAttributesForEdge_reply___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if ([v7 isEqualToString:*(void *)(a1 + 32)])
  {
    double v9 = nplog_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      double v10 = [*(id *)(a1 + 40) networkSignature];
      double v11 = [*(id *)(a1 + 40) interfaceType];
      int v12 = 138413058;
      id v13 = v7;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v10;
      __int16 v18 = 2112;
      double v19 = v11;
      _os_log_debug_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_DEBUG, "ESS: Queried attributes for edge: %@, attributes: %@ (%@ %@)", (uint8_t *)&v12, 0x2Au);
    }
    [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:*(void *)(a1 + 32)];
    *a4 = 1;
  }
}

- (double)_stochasticRewardFromRTT:(double)a3
{
  return pow(a3 / -4294967300.0 + 1.0, 3.0);
}

- (NSData)networkSignature
{
  return self->_networkSignature;
}

- (void)setNetworkSignature:(id)a3
{
}

- (NSNumber)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(id)a3
{
}

- (int64_t)trialCount
{
  return self->_trialCount;
}

- (void)setTrialCount:(int64_t)a3
{
  self->_trialCount = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (int64_t)windowSize
{
  return self->_windowSize;
}

- (void)setWindowSize:(int64_t)a3
{
  self->_windowSize = a3;
}

- (NSMutableDictionary)edgeAttributesDict
{
  return self->_edgeAttributesDict;
}

- (void)setEdgeAttributesDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeAttributesDict, 0);
  objc_storeStrong((id *)&self->_interfaceType, 0);
  objc_storeStrong((id *)&self->_networkSignature, 0);
}

@end