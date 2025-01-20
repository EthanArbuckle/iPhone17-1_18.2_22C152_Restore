@interface PPStreamingNamedEntityScorer
+ (id)scoreInterpreterAggregationBytecode;
+ (id)scoreInterpreterFinalBytecode;
+ (unint64_t)sourceStatsNeededForBytecode:(id)a3;
- (PPScoreDict)currentAggResult;
- (PPStreamingNamedEntityScorer)initWithScoringDate:(id)a3 perRecordDecayRate:(double)a4 sourceStats:(id)a5;
- (float)getFinalScore;
- (float)getFinalScoreWithAggregationResultOut:(id *)a3 finalResultOut:(id *)a4;
- (void)addRecord:(id)a3;
- (void)setCurrentAggResult:(id)a3;
- (void)startNewClusterWithDecayedFeedbackCounts:(id)a3 mostRelevantRecord:(id)a4 dominantEntityName:(id)a5;
@end

@implementation PPStreamingNamedEntityScorer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAggResult, 0);
  objc_storeStrong((id *)&self->_aggregationScoreInputs, 0);
  objc_storeStrong((id *)&self->_finalScorer, 0);
  objc_storeStrong((id *)&self->_aggregationScorer, 0);
}

- (void)setCurrentAggResult:(id)a3
{
}

- (PPScoreDict)currentAggResult
{
  return self->_currentAggResult;
}

- (float)getFinalScoreWithAggregationResultOut:(id *)a3 finalResultOut:(id *)a4
{
  uint64_t v13 = 0;
  v14 = (float *)&v13;
  uint64_t v15 = 0x2020000000;
  int v16 = -957033984;
  finalScorer = self->_finalScorer;
  if (finalScorer)
  {
    currentAggResult = self->_currentAggResult;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __85__PPStreamingNamedEntityScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke;
    v12[3] = &unk_1E65D8ED0;
    v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__PPStreamingNamedEntityScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3;
    v11[3] = &unk_1E65D8F40;
    v11[4] = &v13;
    v11[5] = a4;
    [(PPScoreInterpreter *)finalScorer evaluateWithPreviousStageSubscores:currentAggResult scoreInputInitializationBlock:v12 scoreInputAssignmentBlock:&__block_literal_global_1299 outputBlock:v11];
  }
  if (a3) {
    objc_storeStrong(a3, self->_currentAggResult);
  }
  [(PPScoreInterpreter *)self->_aggregationScorer cleanupReusableComponents];
  v8 = self->_finalScorer;
  if (v8) {
    [(PPScoreInterpreter *)v8 cleanupReusableComponents];
  }
  float v9 = v14[6];
  _Block_object_dispose(&v13, 8);
  return v9;
}

id __85__PPStreamingNamedEntityScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

void __85__PPStreamingNamedEntityScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 scalarValueForIndex:0];
  v4 = *(id **)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  if (v4) {
    objc_storeStrong(v4, a2);
  }
}

- (float)getFinalScore
{
  [(PPStreamingNamedEntityScorer *)self getFinalScoreWithAggregationResultOut:0 finalResultOut:0];
  return result;
}

- (void)addRecord:(id)a3
{
  id v4 = a3;
  aggregationScorer = self->_aggregationScorer;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__PPStreamingNamedEntityScorer_addRecord___block_invoke;
  v10[3] = &unk_1E65D8ED0;
  v10[4] = self;
  v7[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PPStreamingNamedEntityScorer_addRecord___block_invoke_2;
  v8[3] = &unk_1E65D8EF8;
  id v9 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PPStreamingNamedEntityScorer_addRecord___block_invoke_3;
  v7[3] = &unk_1E65D8EF8;
  id v6 = v4;
  [(PPScoreInterpreter *)aggregationScorer evaluateWithPreviousStageSubscores:0 scoreInputInitializationBlock:v10 scoreInputAssignmentBlock:v8 outputBlock:v7];
}

id __42__PPStreamingNamedEntityScorer_addRecord___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

void __42__PPStreamingNamedEntityScorer_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 decayRate];
  *(float *)&double v5 = v5;
  [v4 setScalarValue:1 forIndex:v5];
  [*(id *)(a1 + 32) initialScore];
  *(float *)&double v6 = v6;
  [v4 setScalarValue:0 forIndex:v6];
  *(float *)&double v7 = (float)[*(id *)(a1 + 32) extractionAssetVersion];
  [v4 setScalarValue:3 forIndex:v7];
  *(float *)&double v8 = (float)(unint64_t)[*(id *)(a1 + 32) algorithm];
  [v4 setScalarValue:4 forIndex:v8];
  id v9 = [*(id *)(a1 + 32) entity];
  *(float *)&double v10 = (float)(unint64_t)[v9 category];
  [v4 setScalarValue:5 forIndex:v10];

  v11 = [*(id *)(a1 + 32) entity];
  [v11 sentimentScore];
  *(float *)&double v12 = v12;
  [v4 setScalarValue:6 forIndex:v12];

  uint64_t v13 = [*(id *)(a1 + 32) source];
  v14 = [v13 metadata];
  *(float *)&double v15 = (float)[v14 dwellTimeSeconds];
  [v4 setScalarValue:18 forIndex:v15];

  int v16 = [*(id *)(a1 + 32) source];
  v17 = [v16 metadata];
  *(float *)&double v18 = (float)[v17 lengthSeconds];
  [v4 setScalarValue:19 forIndex:v18];

  v19 = [*(id *)(a1 + 32) source];
  v20 = [v19 metadata];
  *(float *)&double v21 = (float)[v20 lengthCharacters];
  [v4 setScalarValue:20 forIndex:v21];

  v22 = [*(id *)(a1 + 32) source];
  v23 = [v22 metadata];
  *(float *)&double v24 = (float)[v23 donationCount];
  [v4 setScalarValue:21 forIndex:v24];

  v25 = [*(id *)(a1 + 32) source];
  v26 = [v25 metadata];
  *(float *)&double v27 = (float)[v26 contactHandleCount];
  [v4 setScalarValue:22 forIndex:v27];

  v28 = [*(id *)(a1 + 32) source];
  v29 = [v28 metadata];
  char v30 = [v29 flags];
  LODWORD(v31) = 1.0;
  if ((v30 & 1) == 0) {
    *(float *)&double v31 = 0.0;
  }
  [v4 setScalarValue:23 forIndex:v31];

  v32 = [*(id *)(a1 + 32) source];
  v33 = [v32 date];
  [v4 setObject:v33 forIndex:9];

  v34 = [*(id *)(a1 + 32) source];
  v35 = [v34 bundleId];
  [v4 setObject:v35 forIndex:0];

  v36 = [*(id *)(a1 + 32) source];
  v37 = [v36 groupId];
  [v4 setObject:v37 forIndex:1];

  v38 = [*(id *)(a1 + 32) source];
  v39 = [v38 language];
  [v4 setObject:v39 forIndex:4];

  v40 = [*(id *)(a1 + 32) entity];
  v41 = [v40 dynamicCategory];
  [v4 setObject:v41 forIndex:6];

  id v42 = [*(id *)(a1 + 32) extractionOsBuild];
  [v4 setObject:v42 forIndex:7];
}

void __42__PPStreamingNamedEntityScorer_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
}

- (void)startNewClusterWithDecayedFeedbackCounts:(id)a3 mostRelevantRecord:(id)a4 dominantEntityName:(id)a5
{
  double v7 = self->_aggregationScoreInputs;
  id v8 = a5;
  id v9 = a3;
  [v9 engagedExplicitly];
  *(float *)&double v10 = v10;
  [(PPScoreDict *)v7 setScalarValue:13 forIndex:v10];
  [v9 engagedImplicitly];
  *(float *)&double v11 = v11;
  [(PPScoreDict *)v7 setScalarValue:14 forIndex:v11];
  [v9 rejectedExplicitly];
  *(float *)&double v12 = v12;
  [(PPScoreDict *)v7 setScalarValue:15 forIndex:v12];
  [v9 rejectedImplicitly];
  *(float *)&double v13 = v13;
  [(PPScoreDict *)v7 setScalarValue:16 forIndex:v13];
  unint64_t v14 = [v8 length];

  *(float *)&double v15 = (float)v14;
  [(PPScoreDict *)v7 setScalarValue:17 forIndex:v15];
  id v16 = [v9 latestDate];

  [(PPScoreDict *)v7 setObject:v16 forIndex:12];
}

- (PPStreamingNamedEntityScorer)initWithScoringDate:(id)a3 perRecordDecayRate:(double)a4 sourceStats:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PPStreamingNamedEntityScorer;
  double v10 = [(PPStreamingNamedEntityScorer *)&v36 init];
  if (v10)
  {
    uint64_t v11 = +[PPScoreInterpreter scoreInterpreterFromFactorName:@"PP2StageModel_NE_Agg.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];
    aggregationScorer = v10->_aggregationScorer;
    v10->_aggregationScorer = (PPScoreInterpreter *)v11;

    if (!v10->_aggregationScorer
      || (+[PPScoreInterpreter scoreInterpreterFromFactorName:@"PP2StageModel_NE_Final.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"], uint64_t v13 = objc_claimAutoreleasedReturnValue(), finalScorer = v10->_finalScorer, v10->_finalScorer = (PPScoreInterpreter *)v13, finalScorer, !v10->_finalScorer))
    {
      v34 = 0;
      goto LABEL_6;
    }
    double v15 = [PPScoreDict alloc];
    id v16 = objc_opt_new();
    v17 = [(PPScoreDict *)v15 initWithScoreInputSet:v16];

    *(float *)&double v18 = a4;
    [(PPScoreDict *)v17 setScalarValue:2 forIndex:v18];
    *(float *)&double v19 = (float)[v9 minRefCount];
    [(PPScoreDict *)v17 setScalarValue:7 forIndex:v19];
    *(float *)&double v20 = (float)[v9 maxRefCount];
    [(PPScoreDict *)v17 setScalarValue:8 forIndex:v20];
    [v9 avgRefCount];
    *(float *)&double v21 = v21;
    [(PPScoreDict *)v17 setScalarValue:9 forIndex:v21];
    [v9 medianRefCount];
    *(float *)&double v22 = v22;
    [(PPScoreDict *)v17 setScalarValue:10 forIndex:v22];
    *(float *)&double v23 = (float)[v9 uniqueBundleIdCount];
    [(PPScoreDict *)v17 setScalarValue:11 forIndex:v23];
    *(float *)&double v24 = (float)[v9 uniqueDocIdCount];
    [(PPScoreDict *)v17 setScalarValue:12 forIndex:v24];
    *(float *)&double v25 = (float)(unint64_t)[v9 recordCount];
    [(PPScoreDict *)v17 setScalarValue:24 forIndex:v25];
    v26 = (void *)MEMORY[0x1E4F1CA20];
    double v27 = [MEMORY[0x1E4F1CA20] currentLocale];
    v28 = [v27 localeIdentifier];
    v29 = [v26 componentsFromLocaleIdentifier:v28];
    char v30 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
    [(PPScoreDict *)v17 setObject:v30 forIndex:5];

    [(PPScoreDict *)v17 setObject:v8 forIndex:8];
    double v31 = [v9 earliestDate];
    [(PPScoreDict *)v17 setObject:v31 forIndex:10];

    v32 = [v9 latestDate];
    [(PPScoreDict *)v17 setObject:v32 forIndex:11];

    aggregationScoreInputs = v10->_aggregationScoreInputs;
    v10->_aggregationScoreInputs = v17;
  }
  v34 = v10;
LABEL_6:

  return v34;
}

+ (unint64_t)sourceStatsNeededForBytecode:(id)a3
{
  id v3 = a3;
  CFBitVectorRef v4 = (const __CFBitVector *)[v3 scalarScoreInputsNeeded];
  CFBitVectorRef v5 = (const __CFBitVector *)[v3 objectScoreInputsNeeded];

  unint64_t v6 = CFBitVectorGetBitAtIndex(v4, 7) != 0;
  if (CFBitVectorGetBitAtIndex(v4, 8)) {
    v6 |= 2uLL;
  }
  if (CFBitVectorGetBitAtIndex(v4, 9)) {
    v6 |= 4uLL;
  }
  if (CFBitVectorGetBitAtIndex(v4, 10)) {
    v6 |= 8uLL;
  }
  if (CFBitVectorGetBitAtIndex(v4, 11)) {
    v6 |= 0x40uLL;
  }
  if (CFBitVectorGetBitAtIndex(v4, 12)) {
    v6 |= 0x80uLL;
  }
  if (CFBitVectorGetBitAtIndex(v4, 24)) {
    unint64_t v7 = v6 | 0x100;
  }
  else {
    unint64_t v7 = v6;
  }
  if (CFBitVectorGetBitAtIndex(v5, 10)) {
    v7 |= 0x10uLL;
  }
  if (CFBitVectorGetBitAtIndex(v5, 11)) {
    return v7 | 0x20;
  }
  else {
    return v7;
  }
}

+ (id)scoreInterpreterFinalBytecode
{
  return +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_NE_Final.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];
}

+ (id)scoreInterpreterAggregationBytecode
{
  return +[PPScoreInterpreterBytecode bytecodeFromFactorName:@"PP2StageModel_NE_Agg.plplist" namespaceName:@"PERSONALIZATION_PORTRAIT_NAMED_ENTITIES"];
}

@end