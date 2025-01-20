@interface PPStreamingTopicScorer
+ (uint64_t)sourceStatsNeededForBytecode:(uint64_t)a1;
- (float)getFinalScoreWithAggregationResultOut:(uint64_t)a1 finalResultOut:(uint64_t)a2;
- (void)addRecord:(uint64_t)a1;
@end

@implementation PPStreamingTopicScorer

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

  uint64_t v5 = CFBitVectorGetBitAtIndex(v3, 6) != 0;
  if (CFBitVectorGetBitAtIndex(v3, 7)) {
    v5 |= 2uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 8)) {
    v5 |= 4uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 9)) {
    v5 |= 8uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 10)) {
    v5 |= 0x40uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 11)) {
    v5 |= 0x80uLL;
  }
  if (CFBitVectorGetBitAtIndex(v3, 23)) {
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

- (void)addRecord:(uint64_t)a1
{
  id v3 = a2;
  CFBitVectorRef v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__PPStreamingTopicScorer_addRecord___block_invoke;
    v9[3] = &unk_1E65D8ED0;
    v9[4] = a1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__PPStreamingTopicScorer_addRecord___block_invoke_2;
    v7[3] = &unk_1E65D8EF8;
    id v8 = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__PPStreamingTopicScorer_addRecord___block_invoke_3;
    v6[3] = &unk_1E65D8EF8;
    v6[4] = a1;
    [v5 evaluateWithPreviousStageSubscores:0 scoreInputInitializationBlock:v9 scoreInputAssignmentBlock:v7 outputBlock:v6];
  }
}

id __36__PPStreamingTopicScorer_addRecord___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

void __36__PPStreamingTopicScorer_addRecord___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
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
  v9 = [*(id *)(a1 + 32) topic];
  [v9 sentimentScore];
  *(float *)&double v10 = v10;
  [v4 setScalarValue:5 forIndex:v10];

  v11 = [*(id *)(a1 + 32) source];
  v12 = [v11 metadata];
  *(float *)&double v13 = (float)[v12 dwellTimeSeconds];
  [v4 setScalarValue:17 forIndex:v13];

  v14 = [*(id *)(a1 + 32) source];
  v15 = [v14 metadata];
  *(float *)&double v16 = (float)[v15 lengthSeconds];
  [v4 setScalarValue:18 forIndex:v16];

  v17 = [*(id *)(a1 + 32) source];
  v18 = [v17 metadata];
  *(float *)&double v19 = (float)[v18 lengthCharacters];
  [v4 setScalarValue:19 forIndex:v19];

  v20 = [*(id *)(a1 + 32) source];
  v21 = [v20 metadata];
  *(float *)&double v22 = (float)[v21 donationCount];
  [v4 setScalarValue:20 forIndex:v22];

  v23 = [*(id *)(a1 + 32) source];
  v24 = [v23 metadata];
  *(float *)&double v25 = (float)[v24 contactHandleCount];
  [v4 setScalarValue:21 forIndex:v25];

  v26 = [*(id *)(a1 + 32) source];
  v27 = [v26 metadata];
  char v28 = [v27 flags];
  LODWORD(v29) = 1.0;
  if ((v28 & 1) == 0) {
    *(float *)&double v29 = 0.0;
  }
  [v4 setScalarValue:22 forIndex:v29];

  v30 = [*(id *)(a1 + 32) source];
  v31 = [v30 date];
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

void __36__PPStreamingTopicScorer_addRecord___block_invoke_3(uint64_t a1, void *a2)
{
}

- (float)getFinalScoreWithAggregationResultOut:(uint64_t)a1 finalResultOut:(uint64_t)a2
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v10 = 0;
  v11 = (float *)&v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -957033984;
  id v3 = *(void **)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__PPStreamingTopicScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke;
    v9[3] = &unk_1E65D8ED0;
    v9[4] = a1;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__PPStreamingTopicScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3;
    v8[3] = &unk_1E65D8F40;
    v8[4] = &v10;
    v8[5] = a2;
    [v3 evaluateWithPreviousStageSubscores:v4 scoreInputInitializationBlock:v9 scoreInputAssignmentBlock:&__block_literal_global_16636 outputBlock:v8];
  }
  [*(id *)(a1 + 8) cleanupReusableComponents];
  double v5 = *(void **)(a1 + 16);
  if (v5) {
    [v5 cleanupReusableComponents];
  }
  float v6 = v11[6];
  _Block_object_dispose(&v10, 8);
  return v6;
}

id __79__PPStreamingTopicScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

void __79__PPStreamingTopicScorer_getFinalScoreWithAggregationResultOut_finalResultOut___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 scalarValueForIndex:0];
  uint64_t v4 = *(id **)(a1 + 40);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  if (v4) {
    objc_storeStrong(v4, a2);
  }
}

@end