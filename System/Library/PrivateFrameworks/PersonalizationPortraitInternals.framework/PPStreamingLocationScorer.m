@interface PPStreamingLocationScorer
+ (uint64_t)sourceStatsNeededForBytecode:(uint64_t)a1;
- (float)getFinalScoreWithAggregationResultOut:(uint64_t)a3 finalResultOut:;
- (void)addRecord:(uint64_t)a1;
- (void)initWithScoringDate:(void *)a3 sourceStats:(void *)a4 trialWrapper:;
- (void)startNewClusterWithDecayedFeedbackCounts:(void *)a3 mostRelevantRecord:;
@end

@implementation PPStreamingLocationScorer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAggResult, 0);
  objc_storeStrong((id *)&self->_aggregationScoreInputs, 0);
  objc_storeStrong((id *)&self->_finalScorer, 0);
  objc_storeStrong((id *)&self->_aggregationScorer, 0);
}

+ (uint64_t)sourceStatsNeededForBytecode:(uint64_t)a1
{
  id v2 = a2;
  self;
  CFBitVectorRef v3 = (const __CFBitVector *)[v2 scalarScoreInputsNeeded];
  CFBitVectorRef v4 = (const __CFBitVector *)[v2 objectScoreInputsNeeded];

  uint64_t v5 = CFBitVectorGetBitAtIndex(v3, 7) != 0;
  if (CFBitVectorGetBitAtIndex(v3, 8)) {
    v5 |= 2uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 9)) {
    v5 |= 4uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 10)) {
    v5 |= 8uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 11)) {
    v5 |= 0x40uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 12)) {
    v5 |= 0x80uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 24)) {
    uint64_t v6 = v5 | 0x100;
  }
  else {
    uint64_t v6 = v5;
  }
  if (CFBitVectorGetBitAtIndex(v4, 9)) {
    v6 |= 0x10uLL;
  }
  if (CFBitVectorGetBitAtIndex(v4, 10)) {
    return v6 | 0x20;
  }
  else {
    return v6;
  }
}

- (void)initWithScoringDate:(void *)a3 sourceStats:(void *)a4 trialWrapper:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1
    && (v43.receiver = a1,
        v43.super_class = (Class)PPStreamingLocationScorer,
        (v10 = objc_msgSendSuper2(&v43, sel_init)) != 0))
  {
    v11 = v10;
    self;
    uint64_t v12 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_LC_Agg.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
    if (v12)
    {
      v13 = (void *)v12;
      self;
      uint64_t v14 = +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_LC_Final.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_LOCATIONS"];
      if (v14)
      {
        v15 = (void *)v14;
        v16 = [[PPScoreInterpreter alloc] initWithBytecode:v13];
        v17 = (void *)v11[1];
        v11[1] = v16;

        v18 = [[PPScoreInterpreter alloc] initWithBytecode:v15];
        v19 = (void *)v11[2];
        v11[2] = v18;

        v20 = [PPScoreDict alloc];
        id v42 = v7;
        id v21 = v9;
        v22 = objc_opt_new();
        v23 = [(PPScoreDict *)v20 initWithScoreInputSet:v22];

        LODWORD(v24) = -957033984;
        [(PPScoreDict *)v23 setScalarValue:2 forIndex:v24];
        *(float *)&double v25 = (float)[v8 minRefCount];
        [(PPScoreDict *)v23 setScalarValue:7 forIndex:v25];
        *(float *)&double v26 = (float)[v8 maxRefCount];
        [(PPScoreDict *)v23 setScalarValue:8 forIndex:v26];
        [v8 avgRefCount];
        *(float *)&double v27 = v27;
        [(PPScoreDict *)v23 setScalarValue:9 forIndex:v27];
        [v8 medianRefCount];
        *(float *)&double v28 = v28;
        [(PPScoreDict *)v23 setScalarValue:10 forIndex:v28];
        *(float *)&double v29 = (float)[v8 uniqueBundleIdCount];
        [(PPScoreDict *)v23 setScalarValue:11 forIndex:v29];
        *(float *)&double v30 = (float)[v8 uniqueDocIdCount];
        [(PPScoreDict *)v23 setScalarValue:12 forIndex:v30];
        *(float *)&double v31 = (float)(unint64_t)[v8 recordCount];
        [(PPScoreDict *)v23 setScalarValue:24 forIndex:v31];
        v32 = (void *)MEMORY[0x1E4F1CA20];
        v33 = [MEMORY[0x1E4F1CA20] currentLocale];
        v34 = [v33 localeIdentifier];
        v35 = [v32 componentsFromLocaleIdentifier:v34];
        v36 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
        [(PPScoreDict *)v23 setObject:v36 forIndex:5];

        id v9 = v21;
        id v7 = v42;

        [(PPScoreDict *)v23 setObject:v42 forIndex:7];
        v37 = [v8 earliestDate];
        [(PPScoreDict *)v23 setObject:v37 forIndex:9];

        v38 = [v8 latestDate];
        [(PPScoreDict *)v23 setObject:v38 forIndex:10];

        v39 = (void *)v11[3];
        v11[3] = v23;
      }
      else
      {
        v15 = v13;
        v13 = v11;
        v11 = 0;
      }
      v40 = v11;

      v11 = v13;
    }
    else
    {
      v40 = 0;
    }
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (void)startNewClusterWithDecayedFeedbackCounts:(void *)a3 mostRelevantRecord:
{
  id v21 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 24);
    id v6 = a3;
    [v21 engagedExplicitly];
    *(float *)&double v7 = v7;
    [v5 setScalarValue:13 forIndex:v7];
    [v21 engagedImplicitly];
    *(float *)&double v8 = v8;
    [v5 setScalarValue:14 forIndex:v8];
    [v21 rejectedExplicitly];
    *(float *)&double v9 = v9;
    [v5 setScalarValue:15 forIndex:v9];
    [v21 rejectedImplicitly];
    *(float *)&double v10 = v10;
    [v5 setScalarValue:16 forIndex:v10];
    v11 = [v6 location];

    uint64_t v12 = [v11 placemark];

    v13 = [v12 name];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      v16 = [v12 thoroughfare];
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [v12 locality];
      }
      id v15 = v18;
    }
    *(float *)&double v19 = (float)(unint64_t)[v15 length];
    [v5 setScalarValue:17 forIndex:v19];
    v20 = [v21 latestDate];
    [v5 setObject:v20 forIndex:11];
  }
}

- (void)addRecord:(uint64_t)a1
{
  id v3 = a2;
  CFBitVectorRef v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__PPStreamingLocationScorer_addRecord___block_invoke;
    v9[3] = &unk_1E65D8ED0;
    v9[4] = a1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__PPStreamingLocationScorer_addRecord___block_invoke_2;
    v7[3] = &unk_1E65D8EF8;
    id v8 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__PPStreamingLocationScorer_addRecord___block_invoke_3;
    v6[3] = &unk_1E65D8EF8;
    v6[4] = a1;
    [v5 evaluateWithPreviousStageSubscores:0 scoreInputInitializationBlock:v9 scoreInputAssignmentBlock:v7 outputBlock:v6];
  }
}

id __39__PPStreamingLocationScorer_addRecord___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

void __39__PPStreamingLocationScorer_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 initialScore];
  *(float *)&double v5 = v5;
  [v4 setScalarValue:0 forIndex:v5];
  *(float *)&double v6 = (float)[*(id *)(a1 + 32) extractionAssetVersion];
  [v4 setScalarValue:3 forIndex:v6];
  *(float *)&double v7 = (float)[*(id *)(a1 + 32) algorithm];
  [v4 setScalarValue:4 forIndex:v7];
  id v8 = [*(id *)(a1 + 32) location];
  *(float *)&double v9 = (float)[v8 category];
  [v4 setScalarValue:5 forIndex:v9];

  [*(id *)(a1 + 32) sentimentScore];
  *(float *)&double v10 = v10;
  [v4 setScalarValue:6 forIndex:v10];
  v11 = [*(id *)(a1 + 32) source];
  uint64_t v12 = [v11 metadata];
  *(float *)&double v13 = (float)[v12 dwellTimeSeconds];
  [v4 setScalarValue:18 forIndex:v13];

  uint64_t v14 = [*(id *)(a1 + 32) source];
  id v15 = [v14 metadata];
  *(float *)&double v16 = (float)[v15 lengthSeconds];
  [v4 setScalarValue:19 forIndex:v16];

  v17 = [*(id *)(a1 + 32) source];
  id v18 = [v17 metadata];
  *(float *)&double v19 = (float)[v18 lengthCharacters];
  [v4 setScalarValue:20 forIndex:v19];

  v20 = [*(id *)(a1 + 32) source];
  id v21 = [v20 metadata];
  *(float *)&double v22 = (float)[v21 donationCount];
  [v4 setScalarValue:21 forIndex:v22];

  v23 = [*(id *)(a1 + 32) source];
  double v24 = [v23 metadata];
  *(float *)&double v25 = (float)[v24 contactHandleCount];
  [v4 setScalarValue:22 forIndex:v25];

  double v26 = [*(id *)(a1 + 32) source];
  double v27 = [v26 metadata];
  char v28 = [v27 flags];
  LODWORD(v29) = 1.0;
  if ((v28 & 1) == 0) {
    *(float *)&double v29 = 0.0;
  }
  [v4 setScalarValue:23 forIndex:v29];

  double v30 = [*(id *)(a1 + 32) source];
  double v31 = [v30 date];
  [v4 setObject:v31 forIndex:8];

  v32 = [*(id *)(a1 + 32) source];
  v33 = [v32 bundleId];
  [v4 setObject:v33 forIndex:0];

  v34 = [*(id *)(a1 + 32) source];
  v35 = [v34 groupId];
  [v4 setObject:v35 forIndex:1];

  v36 = [*(id *)(a1 + 32) source];
  v37 = [v36 language];
  [v4 setObject:v37 forIndex:4];

  id v38 = [*(id *)(a1 + 32) extractionOsBuild];
  [v4 setObject:v38 forIndex:6];
}

void __39__PPStreamingLocationScorer_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
}

- (float)getFinalScoreWithAggregationResultOut:(uint64_t)a3 finalResultOut:
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v12 = 0;
  double v13 = (float *)&v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -957033984;
  double v5 = *(void **)(a1 + 16);
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PPStreamingLocationScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke;
    v11[3] = &unk_1E65D8ED0;
    v11[4] = a1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__PPStreamingLocationScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3;
    v10[3] = &unk_1E65D8F40;
    v10[4] = &v12;
    v10[5] = a3;
    [v5 evaluateWithPreviousStageSubscores:v6 scoreInputInitializationBlock:v11 scoreInputAssignmentBlock:&__block_literal_global_17459 outputBlock:v10];
  }
  if (location) {
    objc_storeStrong(location, *(id *)(a1 + 32));
  }
  [*(id *)(a1 + 8) cleanupReusableComponents];
  double v7 = *(void **)(a1 + 16);
  if (v7) {
    [v7 cleanupReusableComponents];
  }
  float v8 = v13[6];
  _Block_object_dispose(&v12, 8);
  return v8;
}

id __82__PPStreamingLocationScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

void __82__PPStreamingLocationScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 scalarValueForIndex:0];
  id v4 = *(id **)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  if (v4) {
    objc_storeStrong(v4, a2);
  }
}

@end