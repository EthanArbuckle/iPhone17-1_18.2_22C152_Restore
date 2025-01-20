@interface PGPrecisionRecallEvaluation
- (NSString)category;
- (NSString)identifier;
- (PGPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4;
- (PGPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4 truePositives:(unint64_t)a5 falsePositives:(unint64_t)a6 falseNegatives:(unint64_t)a7 trueNegatives:(unint64_t)a8;
- (double)fMeasure;
- (double)fMeasure:(double)a3;
- (double)precision;
- (double)recall;
- (id)csvHeader;
- (id)description;
- (unint64_t)falseNegatives;
- (unint64_t)falsePositives;
- (unint64_t)trueNegatives;
- (unint64_t)truePositives;
- (void)evaluateWithGroundTruthResult:(BOOL)a3 andInferenceResult:(BOOL)a4;
- (void)evaluateWithGroundTruthResults:(id)a3 andInferenceResults:(id)a4;
@end

@implementation PGPrecisionRecallEvaluation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)category
{
  return self->_category;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)trueNegatives
{
  return self->_trueNegatives;
}

- (unint64_t)falseNegatives
{
  return self->_falseNegatives;
}

- (unint64_t)falsePositives
{
  return self->_falsePositives;
}

- (unint64_t)truePositives
{
  return self->_truePositives;
}

- (double)fMeasure:(double)a3
{
  [(PGPrecisionRecallEvaluation *)self precision];
  double v6 = v5;
  [(PGPrecisionRecallEvaluation *)self recall];
  double v8 = 0.0;
  if (v6 != 0.0 && v7 != 0.0) {
    return (a3 * a3 + 1.0) * v6 * v7 / (v7 + a3 * a3 * v6);
  }
  return v8;
}

- (double)fMeasure
{
  [(PGPrecisionRecallEvaluation *)self fMeasure:1.0];
  return result;
}

- (double)recall
{
  unint64_t truePositives = self->_truePositives;
  if (truePositives) {
    return (double)truePositives / (double)(self->_falseNegatives + truePositives);
  }
  else {
    return 0.0;
  }
}

- (double)precision
{
  unint64_t truePositives = self->_truePositives;
  if (truePositives) {
    return (double)truePositives / (double)(self->_falsePositives + truePositives);
  }
  else {
    return 0.0;
  }
}

- (id)description
{
  v3 = NSString;
  identifier = self->_identifier;
  category = self->_category;
  unint64_t truePositives = self->_truePositives;
  unint64_t falsePositives = self->_falsePositives;
  unint64_t falseNegatives = self->_falseNegatives;
  unint64_t trueNegatives = self->_trueNegatives;
  [(PGPrecisionRecallEvaluation *)self precision];
  uint64_t v11 = v10;
  [(PGPrecisionRecallEvaluation *)self recall];
  uint64_t v13 = v12;
  [(PGPrecisionRecallEvaluation *)self fMeasure];
  return (id)[v3 stringWithFormat:@"%@,%@,%ld,%ld,%ld,%ld,%.2f,%.2f,%.2f", category, identifier, truePositives, falsePositives, falseNegatives, trueNegatives, v11, v13, v14];
}

- (id)csvHeader
{
  return @"category,identifier,tp,fp,fn,tn,p,r,f1";
}

- (void)evaluateWithGroundTruthResult:(BOOL)a3 andInferenceResult:(BOOL)a4
{
  BOOL v4 = !a4;
  if (!a3 || v4)
  {
    BOOL v6 = !v4 && !a3;
    uint64_t v5 = 16;
    if (!v6) {
      uint64_t v5 = 32;
    }
    if (a3 && !a4) {
      uint64_t v5 = 24;
    }
  }
  else
  {
    uint64_t v5 = 8;
  }
  ++*(Class *)((char *)&self->super.isa + v5);
}

- (void)evaluateWithGroundTruthResults:(id)a3 andInferenceResults:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v8 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = [v7 objectForKeyedSubscript:v13];
        if (v14)
        {
          v15 = [v6 objectForKeyedSubscript:v13];
          uint64_t v16 = [v15 BOOLValue];

          -[PGPrecisionRecallEvaluation evaluateWithGroundTruthResult:andInferenceResult:](self, "evaluateWithGroundTruthResult:andInferenceResult:", v16, [v14 BOOLValue]);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (PGPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4 truePositives:(unint64_t)a5 falsePositives:(unint64_t)a6 falseNegatives:(unint64_t)a7 trueNegatives:(unint64_t)a8
{
  id v15 = a3;
  id v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PGPrecisionRecallEvaluation;
  long long v17 = [(PGPrecisionRecallEvaluation *)&v20 init];
  long long v18 = v17;
  if (v17)
  {
    v17->_unint64_t truePositives = a5;
    v17->_unint64_t falsePositives = a6;
    v17->_unint64_t falseNegatives = a7;
    v17->_unint64_t trueNegatives = a8;
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_category, a4);
  }

  return v18;
}

- (PGPrecisionRecallEvaluation)initWithIdentifier:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGPrecisionRecallEvaluation;
  uint64_t v9 = [(PGPrecisionRecallEvaluation *)&v12 init];
  uint64_t v10 = (PGPrecisionRecallEvaluation *)v9;
  if (v9)
  {
    *(_OWORD *)(v9 + 24) = 0u;
    *(_OWORD *)(v9 + 8) = 0u;
    objc_storeStrong((id *)v9 + 5, a3);
    objc_storeStrong((id *)&v10->_category, a4);
  }

  return v10;
}

@end