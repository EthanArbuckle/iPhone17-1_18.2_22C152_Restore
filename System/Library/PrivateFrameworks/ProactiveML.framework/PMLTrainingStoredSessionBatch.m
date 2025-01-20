@interface PMLTrainingStoredSessionBatch
- (PMLModelRegressor)outcomes;
- (PMLSparseMatrix)covariates;
- (PMLTrainingStoredSessionBatch)initWithCovariates:(id)a3 outcomes:(id)a4;
- (id)minibatchStats;
- (id)minibatchStatsForPositiveLabel:(unint64_t)a3;
- (id)minibatchStatsForPositiveLabels:(id)a3;
- (unint64_t)count;
@end

@implementation PMLTrainingStoredSessionBatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcomes, 0);
  objc_storeStrong((id *)&self->_covariates, 0);
}

- (unint64_t)count
{
  return self->_count;
}

- (PMLModelRegressor)outcomes
{
  return self->_outcomes;
}

- (PMLSparseMatrix)covariates
{
  return self->_covariates;
}

- (id)minibatchStatsForPositiveLabels:(id)a3
{
  id v23 = a3;
  v4 = objc_opt_new();
  unint64_t v5 = [(PMLTrainingStoredSessionBatch *)self count];
  v6 = objc_opt_new();
  if ([(PMLModelRegressor *)self->_outcomes count])
  {
    unint64_t v7 = 0;
    do
    {
      v8 = NSNumber;
      LODWORD(v9) = [(PMLModelRegressor *)self->_outcomes values][4 * v7];
      v10 = [v8 numberWithFloat:v9];
      v11 = NSNumber;
      v12 = [v6 objectForKeyedSubscript:v10];
      v13 = v12;
      if (!v12) {
        v12 = &unk_26D3365C0;
      }
      v14 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue") + 1);
      [v6 setObject:v14 forKeyedSubscript:v10];

      ++v7;
    }
    while (v7 < [(PMLModelRegressor *)self->_outcomes count]);
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __65__PMLTrainingStoredSessionBatch_minibatchStatsForPositiveLabels___block_invoke;
  v24[3] = &unk_26459F690;
  unint64_t v28 = v5;
  id v15 = v4;
  id v25 = v15;
  id v16 = v23;
  id v26 = v16;
  v27 = &v29;
  [v6 enumerateKeysAndObjectsUsingBlock:v24];
  *(float *)&double v17 = (float)(unint64_t)v30[3] / (float)v5;
  +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v17];
  objc_msgSend(v15, "setSupport:");
  *(float *)&double v18 = (float)v5;
  +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v18];
  [v15 setBatchSize:vcvtas_u32_f32(v19)];
  v20 = v26;
  id v21 = v15;

  _Block_object_dispose(&v29, 8);
  return v21;
}

void __65__PMLTrainingStoredSessionBatch_minibatchStatsForPositiveLabels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  v6 = objc_opt_new();
  objc_msgSend(v6, "setLabel:", objc_msgSend(v5, "unsignedIntegerValue"));
  [v10 floatValue];
  *(float *)&double v8 = v7 / (float)*(unint64_t *)(a1 + 56);
  +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v8];
  objc_msgSend(v6, "setSupport:");
  [*(id *)(a1 + 32) addPerLabelSupport:v6];
  int v9 = [*(id *)(a1 + 40) containsObject:v5];

  if (v9) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v10 unsignedIntegerValue];
  }
}

- (id)minibatchStats
{
  return [(PMLTrainingStoredSessionBatch *)self minibatchStatsForPositiveLabel:1];
}

- (id)minibatchStatsForPositiveLabel:(unint64_t)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v8[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v6 = [(PMLTrainingStoredSessionBatch *)self minibatchStatsForPositiveLabels:v5];

  return v6;
}

- (PMLTrainingStoredSessionBatch)initWithCovariates:(id)a3 outcomes:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 numberOfRows];
  if (v10 != (int)[v9 count])
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PMLTrainingStoredSessionBatch.m", 19, @"Covariates and outcomes need to have the same length, but got %lu and %d.", objc_msgSend(v8, "numberOfRows"), objc_msgSend(v9, "count") object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PMLTrainingStoredSessionBatch;
  v11 = [(PMLTrainingStoredSessionBatch *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_covariates, a3);
    objc_storeStrong((id *)&v12->_outcomes, a4);
    v12->_count = [v8 numberOfRows];
  }

  return v12;
}

@end