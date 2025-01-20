@interface PGAssetsWithReasonPrecisionRecallEvaluation
- (NSMutableDictionary)evaluationByReason;
- (PGAssetsWithReasonPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4;
- (void)evaluateWithGroundTruthResults:(id)a3 inferenceResults:(id)a4 reasonResultByAssetIdentifier:(id)a5;
- (void)setEvaluationByReason:(id)a3;
@end

@implementation PGAssetsWithReasonPrecisionRecallEvaluation

- (void).cxx_destruct
{
}

- (void)setEvaluationByReason:(id)a3
{
}

- (NSMutableDictionary)evaluationByReason
{
  return self->_evaluationByReason;
}

- (void)evaluateWithGroundTruthResults:(id)a3 inferenceResults:(id)a4 reasonResultByAssetIdentifier:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)PGAssetsWithReasonPrecisionRecallEvaluation;
  v32 = v9;
  v33 = v8;
  [(PGPrecisionRecallEvaluation *)&v38 evaluateWithGroundTruthResults:v8 andInferenceResults:v9];
  v30 = [(PGPrecisionRecallEvaluation *)self identifier];
  v11 = self;
  v29 = [(PGPrecisionRecallEvaluation *)self category];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v17 = [v12 objectForKeyedSubscript:v16];
        v18 = [(NSMutableDictionary *)v11->_evaluationByReason objectForKeyedSubscript:v17];
        if (!v18)
        {
          v18 = [[PGPrecisionRecallEvaluation alloc] initWithIdentifier:v30 category:v29];
          [(NSMutableDictionary *)v11->_evaluationByReason setObject:v18 forKeyedSubscript:v17];
        }
        uint64_t v19 = [v33 objectForKeyedSubscript:v16];
        v20 = (void *)v19;
        if (v19) {
          v21 = (void *)v19;
        }
        else {
          v21 = &unk_1F28D2850;
        }
        id v22 = v21;

        uint64_t v23 = [v32 objectForKeyedSubscript:v16];
        v24 = (void *)v23;
        if (v23) {
          v25 = (void *)v23;
        }
        else {
          v25 = &unk_1F28D2850;
        }
        id v26 = v25;

        uint64_t v27 = [v22 BOOLValue];
        uint64_t v28 = [v26 BOOLValue];

        [(PGPrecisionRecallEvaluation *)v18 evaluateWithGroundTruthResult:v27 andInferenceResult:v28];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v14);
  }
}

- (PGAssetsWithReasonPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PGAssetsWithReasonPrecisionRecallEvaluation;
  v4 = [(PGPrecisionRecallEvaluation *)&v8 initWithIdentifier:a3 category:a4];
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    evaluationByReason = v4->_evaluationByReason;
    v4->_evaluationByReason = v5;
  }
  return v4;
}

@end