@interface PMLGradientSolver
- (BOOL)intercept;
- (PMLGradientSolver)initWithLearningRate:(float)a3 minIterations:(unint64_t)a4 stoppingThreshold:(float)a5 weights:(id)a6 intercept:(BOOL)a7 gradientCalculator:(id)a8 predictionCalculator:(id)a9 batchPredictionCalculator:(id)a10;
- (PMLModelRegressor)objective;
- (PMLModelWeights)weights;
- (PMLSparseMatrix)covariates;
- (float)predict:(id)a3;
- (id)batchPredict:(id)a3;
- (id)computeAvgGradientWithIterations:(unint64_t)a3;
- (id)solveWithAvgGradient:(float *)a3 maxNumberOfIterations:(unint64_t)a4;
- (void)setCovariates:(id)a3;
- (void)setIntercept:(BOOL)a3;
- (void)setObjective:(id)a3;
- (void)setWeights:(id)a3;
- (void)solve;
- (void)solveForCovariates:(id)a3 objectives:(id)a4;
@end

@implementation PMLGradientSolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objective, 0);
  objc_storeStrong((id *)&self->_covariates, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong(&self->_batchPredictionCalculator, 0);
  objc_storeStrong(&self->_predictionCalculator, 0);
  objc_storeStrong(&self->_gradientCalculator, 0);
}

- (void)setIntercept:(BOOL)a3
{
  self->_intercept = a3;
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (void)setObjective:(id)a3
{
}

- (PMLModelRegressor)objective
{
  return self->_objective;
}

- (PMLSparseMatrix)covariates
{
  return self->_covariates;
}

- (void)setWeights:(id)a3
{
}

- (PMLModelWeights)weights
{
  return self->_weights;
}

- (void)solveForCovariates:(id)a3 objectives:(id)a4
{
  id v6 = a4;
  [(PMLGradientSolver *)self setCovariates:a3];
  [(PMLGradientSolver *)self setObjective:v6];

  [(PMLGradientSolver *)self solve];
}

- (id)batchPredict:(id)a3
{
  id v5 = a3;
  int v6 = [(PMLModelWeights *)self->_weights length];
  uint64_t v7 = [v5 numberOfColumns];
  BOOL intercept = self->_intercept;
  if (v7 + intercept != v6)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PMLGradientSolver.m", 185, @"Invalid covariates, length: %tu but model weights length: %d", objc_msgSend(v5, "numberOfColumns"), -[PMLModelWeights length](self->_weights, "length") object file lineNumber description];

    LODWORD(intercept) = self->_intercept;
  }
  batchPredictionCalculator = (void (**)(id, void *, PMLModelWeights *))self->_batchPredictionCalculator;
  if (intercept)
  {
    v10 = [v5 matrixWithConstantColumn];
  }
  else
  {
    v10 = v5;
  }
  v11 = batchPredictionCalculator[2](batchPredictionCalculator, v10, self->_weights);
  if (intercept) {

  }
  return v11;
}

- (float)predict:(id)a3
{
  id v5 = a3;
  int v6 = [(PMLModelWeights *)self->_weights length];
  uint64_t v7 = [v5 length];
  BOOL intercept = self->_intercept;
  if (v7 + intercept != v6)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PMLGradientSolver.m", 178, @"Invalid covariates, length: %tu but model weights length: %d", objc_msgSend(v5, "length"), -[PMLModelWeights length](self->_weights, "length") object file lineNumber description];

    LODWORD(intercept) = self->_intercept;
  }
  predictionCalculator = (float (**)(id, void *, PMLModelWeights *))self->_predictionCalculator;
  if (intercept)
  {
    v10 = [v5 vectorWithConstantColumn];
    float v11 = predictionCalculator[2](predictionCalculator, v10, self->_weights);
  }
  else
  {
    float v11 = predictionCalculator[2](self->_predictionCalculator, v5, self->_weights);
  }

  return v11;
}

- (id)solveWithAvgGradient:(float *)a3 maxNumberOfIterations:(unint64_t)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v8 = [(PMLModelWeights *)self->_weights length];
  if ([(PMLSparseMatrix *)self->_covariates numberOfColumns] != v8)
  {
    v30 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PMLGradientSolver.m", 104, @"Covariates must have the same column-length as weights. Got covariates with %tu columns but weights of length %d", -[PMLSparseMatrix numberOfColumns](self->_covariates, "numberOfColumns"), -[PMLModelWeights length](self->_weights, "length"));
  }
  v31 = [(PMLDenseVector *)[PMLMutableDenseVector alloc] initWithCount:[(PMLModelWeights *)self->_weights length]];
  unint64_t v9 = 0;
  if (!a4)
  {
    int v22 = 0;
    double v18 = 0.0;
    double v10 = 1.79769313e308;
    goto LABEL_32;
  }
  double v10 = 1.79769313e308;
  while (1)
  {
    float v11 = a3;
    v12 = (void *)MEMORY[0x223C7E5C0]();
    gradientCalculator = (double (**)(id, PMLModelWeights *, PMLSparseMatrix *, PMLModelRegressor *, uint64_t))self->_gradientCalculator;
    weights = self->_weights;
    covariates = self->_covariates;
    objective = self->_objective;
    v17 = v31;
    double v18 = gradientCalculator[2](gradientCalculator, weights, covariates, objective, (uint64_t)[(PMLMutableDenseVector *)v17 mutablePtr]);
    if (v18 == 1.79769313e308)
    {
      v23 = PML_LogHandle();
      a3 = v11;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v33 = v9;
        _os_log_error_impl(&dword_2212A0000, v23, OS_LOG_TYPE_ERROR, "Stopped after iter %li with DBL_MAX error\n", buf, 0xCu);
      }
      *(double *)&unint64_t v24 = 1.79769313e308;
      goto LABEL_29;
    }
    a3 = v11;
    if (v18 == -1.79769313e308)
    {
      v23 = PML_LogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v33 = v9;
        _os_log_error_impl(&dword_2212A0000, v23, OS_LOG_TYPE_ERROR, "Stopped after iter %li with -DBL_MAX error\n", buf, 0xCu);
      }
      *(double *)&unint64_t v24 = -1.79769313e308;
      goto LABEL_29;
    }
    if (v18 == -INFINITY)
    {
      v23 = PML_LogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v33 = v9;
        _os_log_error_impl(&dword_2212A0000, v23, OS_LOG_TYPE_ERROR, "Stopped after iter %li with -INFINITY error\n", buf, 0xCu);
      }
      *(double *)&unint64_t v24 = -INFINITY;
      goto LABEL_29;
    }
    if (v18 == INFINITY)
    {
      v23 = PML_LogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v33 = v9;
        _os_log_error_impl(&dword_2212A0000, v23, OS_LOG_TYPE_ERROR, "Stopped after iter %li with INFINITY error\n", buf, 0xCu);
      }
      *(double *)&unint64_t v24 = INFINITY;
LABEL_29:
      double v18 = *(double *)&v24;
LABEL_30:

      int v22 = 1;
      goto LABEL_31;
    }
    if (v18 == 0.0)
    {
      v23 = PML_LogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v33 = v9;
        _os_log_impl(&dword_2212A0000, v23, OS_LOG_TYPE_INFO, "Stopped after iter %li with perfect fit\n", buf, 0xCu);
      }
      goto LABEL_30;
    }
    if (1.0 - v18 / v10 < self->_stoppingThreshold && v9 > self->_minIterations) {
      break;
    }
    int v19 = [(PMLModelWeights *)self->_weights length];
    float learningRate = self->_learningRate;
    v21 = v17;
    cblas_saxpy(v19, learningRate, [(PMLDenseVector *)v21 ptr], 1, [(PMLModelWeights *)self->_weights values], 1);
    if (v11) {
      cblas_saxpy([(PMLModelWeights *)self->_weights length], 1.0, [(PMLDenseVector *)v21 ptr], 1, v11, 1);
    }
    ++v9;
    double v10 = v18;
    if (a4 == v9)
    {
      int v22 = 0;
      double v10 = v18;
      unint64_t v9 = a4;
      goto LABEL_32;
    }
  }
  int v22 = 0;
LABEL_31:
LABEL_32:
  v25 = PML_LogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v33 = v9;
    __int16 v34 = 2048;
    double v35 = v10;
    _os_log_debug_impl(&dword_2212A0000, v25, OS_LOG_TYPE_DEBUG, "Stopped after iter %li with loss %f\n", buf, 0x16u);
  }

  if (a3)
  {
    int v26 = [(PMLModelWeights *)self->_weights length];
    if (v22)
    {
      bzero(a3, v26);
      goto LABEL_38;
    }
    float v28 = 1.0 / (float)(uint64_t)v9;
    if (!v9) {
      float v28 = 1.0;
    }
    cblas_sscal(v26, v28, a3, 1);
LABEL_42:
    v27 = [NSNumber numberWithDouble:v18];
  }
  else
  {
    if (!v22) {
      goto LABEL_42;
    }
LABEL_38:
    bzero([(PMLModelWeights *)self->_weights values], [(PMLModelWeights *)self->_weights length]);
    v27 = 0;
  }

  return v27;
}

- (void)setCovariates:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_intercept)
  {
    id v5 = [v4 matrixWithConstantColumn];
  }
  else
  {
    id v5 = (PMLSparseMatrix *)v4;
  }
  covariates = self->_covariates;
  self->_covariates = v5;
}

- (id)computeAvgGradientWithIterations:(unint64_t)a3
{
  id v5 = [(PMLDenseVector *)[PMLMutableDenseVector alloc] initWithCount:[(PMLModelWeights *)self->_weights length]];
  int v6 = [(PMLGradientSolver *)self solveWithAvgGradient:[(PMLMutableDenseVector *)v5 mutablePtr] maxNumberOfIterations:a3];
  id v7 = [[PMLGradientResults alloc] initWithGradient:v5 loss:v6];

  return v7;
}

- (void)solve
{
  id v2 = [(PMLGradientSolver *)self solveWithAvgGradient:0 maxNumberOfIterations:1000000];
}

- (PMLGradientSolver)initWithLearningRate:(float)a3 minIterations:(unint64_t)a4 stoppingThreshold:(float)a5 weights:(id)a6 intercept:(BOOL)a7 gradientCalculator:(id)a8 predictionCalculator:(id)a9 batchPredictionCalculator:(id)a10
{
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (v20)
  {
    if (v21) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PMLGradientSolver.m", 58, @"Invalid parameter not satisfying: %@", @"weights" object file lineNumber description];

    if (v21)
    {
LABEL_3:
      if (v22) {
        goto LABEL_4;
      }
LABEL_10:
      double v35 = [MEMORY[0x263F08690] currentHandler];
      [v35 handleFailureInMethod:a2, self, @"PMLGradientSolver.m", 60, @"Invalid parameter not satisfying: %@", @"predictionCalculator" object file lineNumber description];

      if (v23) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  __int16 v34 = [MEMORY[0x263F08690] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"PMLGradientSolver.m", 59, @"Invalid parameter not satisfying: %@", @"gradientCalculator" object file lineNumber description];

  if (!v22) {
    goto LABEL_10;
  }
LABEL_4:
  if (v23) {
    goto LABEL_5;
  }
LABEL_11:
  uint64_t v36 = [MEMORY[0x263F08690] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"PMLGradientSolver.m", 61, @"Invalid parameter not satisfying: %@", @"batchPredictionCalculator" object file lineNumber description];

LABEL_5:
  v37.receiver = self;
  v37.super_class = (Class)PMLGradientSolver;
  unint64_t v24 = [(PMLGradientSolver *)&v37 init];
  v25 = v24;
  if (v24)
  {
    v24->_float learningRate = -a3;
    v24->_stoppingThreshold = a5;
    v24->_minIterations = a4;
    objc_storeStrong((id *)&v24->_weights, a6);
    uint64_t v26 = MEMORY[0x223C7E7E0](v21);
    id gradientCalculator = v25->_gradientCalculator;
    v25->_id gradientCalculator = (id)v26;

    uint64_t v28 = MEMORY[0x223C7E7E0](v22);
    id predictionCalculator = v25->_predictionCalculator;
    v25->_id predictionCalculator = (id)v28;

    uint64_t v30 = MEMORY[0x223C7E7E0](v23);
    id batchPredictionCalculator = v25->_batchPredictionCalculator;
    v25->_id batchPredictionCalculator = (id)v30;

    v25->_BOOL intercept = a7;
  }

  return v25;
}

@end