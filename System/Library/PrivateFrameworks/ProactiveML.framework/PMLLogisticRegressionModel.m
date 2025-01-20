@interface PMLLogisticRegressionModel
+ (id)solverWithWeights:(id)a3;
+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4;
+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7;
+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7 l2RegularizationRate:(float)a8;
+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7 regularizationStrategy:(unint64_t)a8 regularizationRate:(float)a9 l1Ratio:(float)a10;
+ (id)withWeights:(id)a3;
+ (id)withWeights:(id)a3 andIntercept:(BOOL)a4;
- (PMLLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (PMLLogisticRegressionModel)initWithSolver:(id)a3;
- (id)predict:(id)a3;
- (id)toPlistWithChunks:(id)a3;
- (id)weights;
- (unint64_t)outputDimension;
@end

@implementation PMLLogisticRegressionModel

- (void).cxx_destruct
{
}

- (PMLLogisticRegressionModel)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [PMLModelWeights alloc];
  v12 = [v8 objectForKeyedSubscript:@"WEIGHTS"];
  v13 = [(PMLModelWeights *)v11 initWithPlist:v12 chunks:v10 context:v9];

  if (v13)
  {
    v14 = [v8 objectForKeyedSubscript:@"INTERCEPT"];
    uint64_t v15 = [v14 BOOLValue];

    v16 = +[PMLLogisticRegressionModel solverWithWeights:v13 andIntercept:v15];
    self = [(PMLLogisticRegressionModel *)self initWithSolver:v16];

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)toPlistWithChunks:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"WEIGHTS";
  solver = self->_solver;
  id v5 = a3;
  v6 = [(PMLGradientSolver *)solver weights];
  v7 = [v6 toPlistWithChunks:v5];

  v11[1] = @"INTERCEPT";
  v12[0] = v7;
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PMLGradientSolver intercept](self->_solver, "intercept"));
  v12[1] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)weights
{
  return [(PMLGradientSolver *)self->_solver weights];
}

- (id)predict:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  [(PMLGradientSolver *)self->_solver predict:a3];
  float v4 = v3;
  id v5 = objc_msgSend(NSNumber, "numberWithFloat:");
  v9[0] = v5;
  v6 = [NSNumber numberWithDouble:1.0 - v4];
  v9[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  return v7;
}

- (unint64_t)outputDimension
{
  return 2;
}

- (PMLLogisticRegressionModel)initWithSolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLLogisticRegressionModel;
  v6 = [(PMLLogisticRegressionModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_solver, a3);
  }

  return v7;
}

+ (id)withWeights:(id)a3 andIntercept:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  id v8 = [a1 solverWithWeights:v6 andIntercept:v4];

  objc_super v9 = (void *)[v7 initWithSolver:v8];
  return v9;
}

+ (id)withWeights:(id)a3
{
  return (id)[a1 withWeights:a3 andIntercept:0];
}

+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7 regularizationStrategy:(unint64_t)a8 regularizationRate:(float)a9 l1Ratio:(float)a10
{
  BOOL v13 = a4;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __156__PMLLogisticRegressionModel_solverWithWeights_andIntercept_learningRate_minIterations_stoppingThreshold_regularizationStrategy_regularizationRate_l1Ratio___block_invoke;
  v24 = &__block_descriptor_48_e71_d40__0__PMLModelWeights_8__PMLSparseMatrix_16__PMLModelRegressor_24_f32l;
  unint64_t v25 = a8;
  unint64_t v26 = __PAIR64__(LODWORD(a10), LODWORD(a9));
  id v14 = a3;
  uint64_t v15 = (void *)MEMORY[0x223C7E7E0](&v21);
  v16 = [PMLGradientSolver alloc];
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a7;
  v19 = -[PMLGradientSolver initWithLearningRate:minIterations:stoppingThreshold:weights:intercept:gradientCalculator:predictionCalculator:batchPredictionCalculator:](v16, "initWithLearningRate:minIterations:stoppingThreshold:weights:intercept:gradientCalculator:predictionCalculator:batchPredictionCalculator:", a6, v14, v13, v15, &__block_literal_global_3535, &__block_literal_global_4, v17, v18, v21, v22, v23, v24, v25, v26);

  return v19;
}

double __156__PMLLogisticRegressionModel_solverWithWeights_andIntercept_learningRate_minIterations_stoppingThreshold_regularizationStrategy_regularizationRate_l1Ratio___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  v12 = (void *)[v10 matrix];
  id v13 = v9;
  id v14 = (const float *)[v13 values];
  id v15 = v11;
  uint64_t v16 = [v15 values];
  float v17 = *(float *)(a1 + 40);
  if (v17 < 0.0) {
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 137, "regularizationRate >= 0.0");
  }
  float v18 = *(float *)(a1 + 44);
  if (v18 < 0.0 || v18 > 1.0) {
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 138, "l1Ratio >= 0.0 && l1Ratio <= 1.0");
  }
  v20 = (const float *)v16;
  uint64_t v21 = *(void *)(a1 + 32);
  if (v21 == 3 && v18 == 0.0)
  {
    uint64_t v22 = 2;
  }
  else if (v21 == 3 && v18 == 1.0)
  {
    uint64_t v22 = 1;
  }
  else if (v17 == 0.0)
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = *(void *)(a1 + 32);
  }
  sparse_dimension matrix_number_of_rows = sparse_get_matrix_number_of_rows(v12);
  sparse_dimension matrix_number_of_columns = sparse_get_matrix_number_of_columns(v12);
  if (!matrix_number_of_rows) {
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 151, "numberOfSamples > 0");
  }
  size_t v25 = matrix_number_of_columns;
  if (!matrix_number_of_columns) {
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 152, "numberOfDimensions > 0");
  }
  v61 = v10;
  unint64_t v26 = (float *)malloc_type_calloc(matrix_number_of_rows, 4uLL, 0x100004052888210uLL);
  if (!v26) {
    goto LABEL_80;
  }
  v27 = v26;
  if (sparse_matrix_vector_product_dense_float(CblasNoTrans, 1.0, (sparse_matrix_float)v12, v14, 1, v26, 1)) {
    __assert_rtn("logisticBatch", "PMLMathFunctions.h", 50, "s == SPARSE_SUCCESS");
  }
  v62 = a5;
  v28 = v15;
  v29 = v13;
  for (sparse_dimension i = 0; sparse_get_matrix_number_of_rows(v12) > i; ++i)
  {
    float v31 = 1.0 / (expf(-v27[i]) + 1.0);
    v27[i] = v31;
  }
  uint64_t v32 = 0;
  double v33 = 0.0;
  do
  {
    float v34 = v27[v32];
    if (v34 != 1.0 && v34 != 0.0)
    {
      float v35 = v20[v32];
      double v36 = (float)(logf(v27[v32]) * v35);
      double v33 = v33 - (v36 + (1.0 - v35) * logf(1.0 - v34));
    }
    ++v32;
  }
  while (matrix_number_of_rows != v32);
  uint64_t v37 = 0;
  do
  {
    double v38 = v14[v37];
    if (v22 == 1)
    {
      double v33 = v33 + fabs(v38) * v17;
    }
    else if (v22 == 3)
    {
      double v33 = fabs(v38) * (float)(v17 * v18) + v33 + (float)(v17 * (float)(1.0 - v18)) * 0.5 * (v38 * v38);
    }
    else
    {
      double v39 = v33 + v17 * 0.5 * (v38 * v38);
      if (v22 == 2) {
        double v33 = v39;
      }
    }
    ++v37;
  }
  while (v25 != v37);
  cblas_saxpy(matrix_number_of_rows, -1.0, v20, 1, v27, 1);
  bzero(v62, 4 * v25);
  if (sparse_matrix_vector_product_dense_float(CblasTrans, 1.0, (sparse_matrix_float)v12, v27, 1, (float *)v62, 1)) {
    __assert_rtn("calculateAvgGradientForBatch", "PMLMathFunctions.h", 191, "s == SPARSE_SUCCESS");
  }
  switch(v22)
  {
    case 1:
      v43 = (float *)malloc_type_calloc(v25, 4uLL, 0x100004052888210uLL);
      if (!v43) {
        goto LABEL_80;
      }
      v41 = v43;
      uint64_t v44 = 0;
      do
      {
        float v45 = v14[v44];
        if (v45 <= 0.0)
        {
          if (v45 < 0.0) {
            v43[v44] = -1.0;
          }
          else {
            v43[v44] = 0.0;
          }
        }
        else
        {
          v43[v44] = 1.0;
        }
        ++v44;
      }
      while (v25 != v44);
      v46 = (sparse_index *)malloc_type_calloc(v25, 8uLL, 0x100004000313F17uLL);
      if (!v46) {
        goto LABEL_80;
      }
      v47 = v46;
      sparse_index v48 = 0;
      do
      {
        v46[v48] = v48;
        ++v48;
      }
      while (v25 != v48);
      sparse_dimension v49 = v25;
      float v50 = v17;
LABEL_71:
      sparse_vector_add_with_scale_dense_float(v49, v50, v41, v47, (float *)v62, 1);
      free(v47);
LABEL_72:
      free(v41);
      break;
    case 3:
      v51 = (const sparse_index *)malloc_type_calloc(v25, 8uLL, 0x100004000313F17uLL);
      if (!v51) {
        goto LABEL_80;
      }
      v52 = (sparse_index *)v51;
      sparse_index v53 = 0;
      do
      {
        v51[v53] = v53;
        ++v53;
      }
      while (v25 != v53);
      sparse_vector_add_with_scale_dense_float(v25, v17 * (float)(1.0 - v18), v14, v51, (float *)v62, 1);
      free(v52);
      v54 = (float *)malloc_type_calloc(v25, 4uLL, 0x100004052888210uLL);
      if (!v54) {
        goto LABEL_80;
      }
      v41 = v54;
      uint64_t v55 = 0;
      do
      {
        float v56 = v14[v55];
        if (v56 <= 0.0)
        {
          if (v56 < 0.0) {
            v54[v55] = -1.0;
          }
          else {
            v54[v55] = 0.0;
          }
        }
        else
        {
          v54[v55] = 1.0;
        }
        ++v55;
      }
      while (v25 != v55);
      v57 = (sparse_index *)malloc_type_calloc(v25, 8uLL, 0x100004000313F17uLL);
      if (!v57) {
        goto LABEL_80;
      }
      v47 = v57;
      sparse_index v58 = 0;
      do
      {
        v57[v58] = v58;
        ++v58;
      }
      while (v25 != v58);
      sparse_dimension v49 = v25;
      float v50 = v17 * v18;
      goto LABEL_71;
    case 2:
      v40 = (const sparse_index *)malloc_type_calloc(v25, 8uLL, 0x100004000313F17uLL);
      if (v40)
      {
        v41 = (float *)v40;
        sparse_index v42 = 0;
        do
        {
          v40[v42] = v42;
          ++v42;
        }
        while (v25 != v42);
        sparse_vector_add_with_scale_dense_float(v25, v17, v14, v40, (float *)v62, 1);
        goto LABEL_72;
      }
LABEL_80:
      objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF570], @"malloc failed", 0, v61);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v60);
  }
  cblas_sscal(v25, 1.0 / (float)matrix_number_of_rows, (float *)v62, 1);
  free(v27);

  return v33 / (double)matrix_number_of_rows;
}

PMLMutableDenseVector *__156__PMLLogisticRegressionModel_solverWithWeights_andIntercept_learningRate_minIterations_stoppingThreshold_regularizationStrategy_regularizationRate_l1Ratio___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = -[PMLDenseVector initWithCount:]([PMLMutableDenseVector alloc], "initWithCount:", [v4 numberOfRows]);
  id v7 = (sparse_m_float *)[v4 matrix];
  id v8 = v5;
  id v9 = (const float *)[v8 values];
  id v10 = v6;
  id v11 = [(PMLMutableDenseVector *)v10 mutablePtr];
  if (sparse_matrix_vector_product_dense_float(CblasNoTrans, 1.0, v7, v9, 1, v11, 1)) {
    __assert_rtn("logisticBatch", "PMLMathFunctions.h", 50, "s == SPARSE_SUCCESS");
  }
  for (sparse_dimension i = 0; sparse_get_matrix_number_of_rows(v7) > i; ++i)
  {
    float v13 = 1.0 / (expf(-v11[i]) + 1.0);
    v11[i] = v13;
  }

  return v10;
}

float __156__PMLLogisticRegressionModel_solverWithWeights_andIntercept_learningRate_minIterations_stoppingThreshold_regularizationStrategy_regularizationRate_l1Ratio___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  int v6 = [v5 numberOfNonZeroValues];
  id v7 = v5;
  id v8 = (const sparse_index *)[v7 sparseIndices];
  id v9 = v7;
  id v10 = (const float *)[v9 sparseValues];

  [v4 length];
  id v11 = v4;
  v12 = (const float *)[v11 values];

  float v13 = sparse_inner_product_dense_float(v6, v10, v8, v12, 1);
  return 1.0 / (expf(-v13) + 1.0);
}

+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7 l2RegularizationRate:(float)a8
{
  return (id)objc_msgSend(a1, "solverWithWeights:andIntercept:learningRate:minIterations:stoppingThreshold:regularizationStrategy:regularizationRate:l1Ratio:", a3, a4, a6, 2);
}

+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4 learningRate:(float)a5 minIterations:(unint64_t)a6 stoppingThreshold:(float)a7
{
  return (id)objc_msgSend(a1, "solverWithWeights:andIntercept:learningRate:minIterations:stoppingThreshold:regularizationStrategy:regularizationRate:l1Ratio:", a3, a4, a6, 0);
}

+ (id)solverWithWeights:(id)a3 andIntercept:(BOOL)a4
{
  LODWORD(v4) = 1017370378;
  LODWORD(v5) = 953267991;
  return (id)[a1 solverWithWeights:a3 andIntercept:a4 learningRate:100 minIterations:v4 stoppingThreshold:v5];
}

+ (id)solverWithWeights:(id)a3
{
  return (id)[a1 solverWithWeights:a3 andIntercept:0];
}

@end