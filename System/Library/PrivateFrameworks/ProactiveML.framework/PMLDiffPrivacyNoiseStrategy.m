@interface PMLDiffPrivacyNoiseStrategy
+ (id)gaussianNoiseWithScaleFactor:(float)a3 minimumMagnitude:(float)a4 seed:(int)a5;
- ($94F468A8D4C62B317260615823C2B210)noiseScaleFactors;
- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5;
- (NSString)description;
- (PMLDiffPrivacyNoiseStrategy)initWithMaxIterationCount:(int)a3 noiseScaleFactors:(id)a4 minimumMagnitude:(float)a5 noiseMechanism:(int64_t)a6 inplaceNorm:(BOOL)a7;
- (PMLDiffPrivacyNoiseStrategy)initWithMaxIterationCount:(int)a3 noiseScaleFactors:(id)a4 minimumMagnitude:(float)a5 seed:(int)a6 noiseMechanism:(int64_t)a7 inplaceNorm:(BOOL)a8;
- (PMLDiffPrivacyNoiseStrategy)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5;
- (_PMLPreNoiseScaleFactorAndNoiseSampler)samplerWithScaleFactorFor:(id)a3 usingNorm:(BOOL)a4;
- (float)minimumMagnitude;
- (id)createDefaultSampler;
- (id)createSamplerByName:(id)a3;
- (id)toPlistWithChunks:(id)a3;
- (int64_t)noiseMechanism;
- (void)addNoiseToSparseMatrix:(id)a3;
- (void)addNoiseToSparseVector:(id)a3;
- (void)setMinimumMagnitude:(float)a3;
- (void)setNoiseMechanism:(int64_t)a3;
- (void)setNoiseScaleFactors:(id)a3;
@end

@implementation PMLDiffPrivacyNoiseStrategy

- (void)setNoiseMechanism:(int64_t)a3
{
  self->_noiseMechanism = a3;
}

- (int64_t)noiseMechanism
{
  return self->_noiseMechanism;
}

- (void)setMinimumMagnitude:(float)a3
{
  self->_minimumMagnitude = a3;
}

- (float)minimumMagnitude
{
  return self->_minimumMagnitude;
}

- (void)setNoiseScaleFactors:(id)a3
{
  self->_noiseScaleFactors = ($6D0F317EF4F58DBDE9FAAFDA827EA2DF)a3;
}

- ($94F468A8D4C62B317260615823C2B210)noiseScaleFactors
{
  float gaussianScaleFactor = self->_noiseScaleFactors.gaussianScaleFactor;
  float laplaceScaleFactor = self->_noiseScaleFactors.laplaceScaleFactor;
  result.var1 = laplaceScaleFactor;
  result.var0 = gaussianScaleFactor;
  return result;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ gaussianScaleFactor:%0.2f laplaceScaleFactor:%0.2f minMagnitude:%0.2f>", v5, self->_noiseScaleFactors.gaussianScaleFactor, self->_noiseScaleFactors.laplaceScaleFactor, self->_minimumMagnitude];

  return (NSString *)v6;
}

- (PMLDiffPrivacyNoiseStrategy)initWithPlist:(id)a3 chunks:(id)a4 context:(id)a5
{
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"NOISE_STRATEGY_MAX_ITERATIONS"];
  v8 = [v6 objectForKeyedSubscript:@"GAUSSIAN_NOISE_SCALE"];
  [v8 floatValue];
  int v10 = v9;
  v11 = [v6 objectForKeyedSubscript:@"LAPLACE_NOISE_SCALE"];
  [v11 floatValue];
  int v13 = v12;

  v14 = [v6 objectForKeyedSubscript:@"NOISE_STRATEGY_MINIMUM_MAGNITUDE"];
  v15 = [v6 objectForKeyedSubscript:@"NOISE_MECHANISM_ENUM_VALUE"];
  uint64_t v16 = [v15 integerValue];

  uint64_t v17 = [v6 objectForKeyedSubscript:@"INPLACE_NORM"];

  if (v17) {
    v18 = (void *)v17;
  }
  else {
    v18 = (void *)MEMORY[0x263EFFA80];
  }
  uint64_t v19 = [v7 intValue];
  [v14 floatValue];
  int v21 = v20;
  uint64_t v22 = [v18 BOOLValue];
  LODWORD(v23) = v10;
  LODWORD(v24) = v13;
  LODWORD(v25) = v21;
  v26 = -[PMLDiffPrivacyNoiseStrategy initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:noiseMechanism:inplaceNorm:](self, "initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:noiseMechanism:inplaceNorm:", v19, v16, v22, v23, v24, v25);

  return v26;
}

- (id)toPlistWithChunks:(id)a3
{
  v27[8] = *MEMORY[0x263EF8340];
  id v4 = a3;
  switch(self->_noiseMechanism)
  {
    case 0:
      v5 = PML_LogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2212A0000, v5, OS_LOG_TYPE_ERROR, "You must explicitly specify a noise mechanism.", buf, 2u);
      }

      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"You must explicitly specify a noise mechanism."];
      goto LABEL_6;
    case 1:
    case 2:
    case 3:
      id v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_7;
    default:
LABEL_6:
      v8 = (void *)MEMORY[0x263EFF940];
      uint64_t v9 = *MEMORY[0x263EFF4A0];
      int v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid noise mechanism value: %lli", self->_noiseMechanism);
      v11 = [v8 exceptionWithName:v9 reason:v10 userInfo:0];
      [v11 raise];

      v7 = 0;
LABEL_7:
      v26[0] = @"NOISE_STRATEGY_MAX_ITERATIONS";
      int v12 = [NSNumber numberWithInt:self->_maxIterations];
      v27[0] = v12;
      v26[1] = @"NOISE_STRATEGY_MINIMUM_MAGNITUDE";
      int v13 = NSNumber;
      [(PMLDiffPrivacyNoiseStrategy *)self minimumMagnitude];
      v14 = objc_msgSend(v13, "numberWithFloat:");
      v27[1] = v14;
      v26[2] = @"GAUSSIAN_NOISE_SCALE";
      *(float *)&double v15 = self->_noiseScaleFactors.gaussianScaleFactor;
      uint64_t v16 = [NSNumber numberWithFloat:v15];
      v27[2] = v16;
      v26[3] = @"LAPLACE_NOISE_SCALE";
      *(float *)&double v17 = self->_noiseScaleFactors.laplaceScaleFactor;
      v18 = [NSNumber numberWithFloat:v17];
      v27[3] = v18;
      v26[4] = @"NOISE_MECHANISM_ENUM_VALUE";
      uint64_t v19 = [NSNumber numberWithLongLong:self->_noiseMechanism];
      v27[4] = v19;
      v26[5] = @"INPLACE_NORM";
      int v20 = [NSNumber numberWithBool:self->_inplaceNorm];
      v27[5] = v20;
      v26[6] = @"NOISE_STRATEGY_SCALE";
      *(float *)&double v21 = self->_noiseScaleFactors.gaussianScaleFactor;
      uint64_t v22 = [NSNumber numberWithFloat:v21];
      v26[7] = @"NOISE_SAMPLER";
      v27[6] = v22;
      v27[7] = v7;
      double v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:8];

      return v23;
  }
}

- (void)addNoiseToSparseMatrix:(id)a3
{
  id v4 = a3;
  v5 = [(PMLDiffPrivacyNoiseStrategy *)self createDefaultSampler];
  sparse_dimension v6 = [v4 numberOfRows];
  sparse_dimension v7 = [v4 numberOfColumns];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3810000000;
  v50 = &unk_2212F4C5E;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  v53 = 0;
  unint64_t matrix_nonzero_count = sparse_get_matrix_nonzero_count((void *)[v4 matrix]);
  uint64_t v9 = 8;
  if (matrix_nonzero_count > 8) {
    uint64_t v9 = matrix_nonzero_count;
  }
  uint64_t v51 = 0;
  uint64_t v52 = v9;
  v53 = malloc_type_malloc(16 * v9, 0x1000040D9A13B51uLL);
  if ([v4 isSymmetric])
  {
    int v10 = objc_opt_new();
    if (v6)
    {
      uint64_t v11 = 0;
      sparse_dimension v12 = v7;
      sparse_dimension v13 = v6;
      do
      {
        objc_msgSend(v10, "addIndexesInRange:", v11, v12--);
        v11 += v6 + 1;
        --v13;
      }
      while (v13);
    }
  }
  else
  {
    int v10 = objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", 0, v7 * v6);
  }
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseMatrix___block_invoke;
  v41[3] = &unk_26459F128;
  id v14 = v5;
  id v42 = v14;
  v43 = self;
  v45 = &v47;
  sparse_dimension v46 = v6;
  id v15 = v10;
  id v44 = v15;
  [v4 enumerateNonZeroValuesWithBlock:v41];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseMatrix___block_invoke_2;
  v37[3] = &unk_26459F100;
  id v16 = v14;
  id v38 = v16;
  v39 = self;
  v40 = &v47;
  [v15 enumerateIndexesUsingBlock:v37];
  qsort((void *)v48[6], v48[4], 0x10uLL, (int (__cdecl *)(const void *, const void *))ixvalCompareIndex);
  v34 = v16;
  v35 = v15;
  v36 = v4;
  double v17 = sparse_matrix_create_float(v6, v7);
  if (v6)
  {
    sparse_index v18 = 0;
    sparse_dimension v19 = 0;
    do
    {
      sparse_dimension v20 = v48[4];
      sparse_dimension v21 = v20 - v19;
      if (v20 <= v19)
      {
        sparse_index v23 = v18 + 1;
      }
      else
      {
        sparse_dimension v22 = 0;
        sparse_index v23 = v18 + 1;
        uint64_t v24 = 16 * v19;
        double v25 = (unint64_t *)(v48[6] + 16 * v19);
        while (1)
        {
          unint64_t v26 = *v25;
          v25 += 2;
          if (v26 >= (v18 + 1) * v6) {
            break;
          }
          if (v21 == ++v22)
          {
            sparse_dimension v22 = v20 - v19;
            if (!v21) {
              goto LABEL_23;
            }
            goto LABEL_19;
          }
        }
        sparse_dimension v20 = v19 + v22;
        if (!v22) {
          goto LABEL_23;
        }
LABEL_19:
        v27 = (float *)malloc_type_malloc(4 * v22, 0x100004052888210uLL);
        v28 = (const sparse_index *)malloc_type_malloc(8 * v22, 0x100004000313F17uLL);
        v29 = (sparse_index *)v28;
        sparse_dimension v30 = v20 - v19;
        if (v20 > v19)
        {
          v31 = v27;
          v32 = (sparse_index *)v28;
          do
          {
            *v31++ = *(float *)(v48[6] + v24 + 8);
            *v32++ = *(_DWORD *)(v48[6] + v24) % v6;
            v24 += 16;
            --v30;
          }
          while (v30);
        }
        sparse_insert_row_float(v17, v18, v22, v27, v28);
        free(v27);
        free(v29);
LABEL_23:
        sparse_dimension v19 = v20;
      }
      sparse_index v18 = v23;
    }
    while (v23 != v6);
  }
  v33 = v48;
  free((void *)v48[6]);
  v33[6] = 0;
  sparse_commit(v17);
  [v36 setMatrix:v17];

  _Block_object_dispose(&v47, 8);
}

uint64_t __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseMatrix___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  double v7 = a4;
  if (v7 > 1.0) {
    double v7 = 1.0;
  }
  if (v7 < -1.0) {
    double v7 = -1.0;
  }
  float v8 = v7;
  [*(id *)(a1 + 32) sample];
  float v10 = v9 + v8;
  if (fabsf(v10) > *(float *)(*(void *)(a1 + 40) + 24)) {
    appendIxval((unint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), a3 + *(void *)(a1 + 64) * a2, v10);
  }
  uint64_t v11 = *(void **)(a1 + 48);
  uint64_t v12 = a3 + *(void *)(a1 + 64) * a2;
  return [v11 removeIndex:v12];
}

char *__54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseMatrix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  $94F468A8D4C62B317260615823C2B210 result = (char *)[*(id *)(a1 + 32) sample];
  if (fabsf(v5) > *(float *)(*(void *)(a1 + 40) + 24))
  {
    sparse_dimension v6 = (unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
    return appendIxval(v6, a2, v5);
  }
  return result;
}

- (void)addNoiseToSparseVector:(id)a3
{
  id v4 = a3;
  float v5 = [(PMLDiffPrivacyNoiseStrategy *)self createDefaultSampler];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3810000000;
  v33 = &unk_2212F4C5E;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  v36 = 0;
  unint64_t v6 = [v4 numberOfNonZeroValues];
  uint64_t v7 = 8;
  if (v6 > 8) {
    uint64_t v7 = v6;
  }
  uint64_t v34 = 0;
  uint64_t v35 = v7;
  v36 = malloc_type_malloc(16 * v7, 0x1000040D9A13B51uLL);
  float v8 = objc_msgSend(objc_alloc(MEMORY[0x263F089C8]), "initWithIndexesInRange:", 0, objc_msgSend(v4, "length"));
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseVector___block_invoke;
  v25[3] = &unk_26459F0D8;
  id v9 = v5;
  id v26 = v9;
  v27 = self;
  v29 = &v30;
  id v10 = v8;
  id v28 = v10;
  [v4 enumerateNonZeroValuesWithBlock:v25];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  sparse_dimension v20 = __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseVector___block_invoke_2;
  sparse_dimension v21 = &unk_26459F100;
  id v11 = v9;
  id v22 = v11;
  sparse_index v23 = self;
  uint64_t v24 = &v30;
  [v10 enumerateIndexesUsingBlock:&v18];
  qsort((void *)v31[6], v31[4], 0x10uLL, (int (__cdecl *)(const void *, const void *))ixvalCompareIndex);
  uint64_t v12 = malloc_type_malloc(8 * v31[4], 0x100004000313F17uLL);
  sparse_dimension v13 = malloc_type_malloc(4 * v31[4], 0x100004052888210uLL);
  id v14 = v13;
  id v15 = v31;
  if (v31[4])
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      v12[v17] = *(void *)(v15[6] + v16);
      v13[v17++] = *(_DWORD *)(v31[6] + v16 + 8);
      id v15 = v31;
      v16 += 16;
    }
    while (v17 < v31[4]);
  }
  free((void *)v15[6]);
  v15[6] = 0;
  objc_msgSend(v4, "setNumberOfNonZeroValues:", v31[4], v18, v19, v20, v21);
  [v4 setSparseIndices:v12];
  [v4 setSparseValues:v14];

  _Block_object_dispose(&v30, 8);
}

uint64_t __54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseVector___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  double v5 = a3;
  if (v5 > 1.0) {
    double v5 = 1.0;
  }
  if (v5 < -1.0) {
    double v5 = -1.0;
  }
  float v6 = v5;
  [*(id *)(a1 + 32) sample];
  float v8 = v7 + v6;
  if (fabsf(v8) > *(float *)(*(void *)(a1 + 40) + 24)) {
    appendIxval((unint64_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 32), a2, v8);
  }
  id v9 = *(void **)(a1 + 48);
  return [v9 removeIndex:a2];
}

char *__54__PMLDiffPrivacyNoiseStrategy_addNoiseToSparseVector___block_invoke_2(uint64_t a1, uint64_t a2)
{
  $94F468A8D4C62B317260615823C2B210 result = (char *)[*(id *)(a1 + 32) sample];
  if (fabsf(v5) > *(float *)(*(void *)(a1 + 40) + 24))
  {
    float v6 = (unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
    return appendIxval(v6, a2, v5);
  }
  return result;
}

- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void *)[(PMLDiffPrivacyNoiseStrategy *)self samplerWithScaleFactorFor:v8 usingNorm:v6];
  int v11 = v10;
  LODWORD(v12) = v10;
  [v8 scaleInPlaceWithInversedFactor:v12];
  sparse_dimension v13 = [(PMLDiffPrivacyNoiseStrategy *)self createSamplerByName:v9];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__PMLDiffPrivacyNoiseStrategy_scaleAndAddNoiseToDenseVector_usingNorm_scaleFactor___block_invoke;
  v16[3] = &unk_26459F0B0;
  id v14 = v13;
  id v17 = v14;
  [v8 processValuesInPlaceWithBlock:v16];
  *(_DWORD *)a5 = v11;

  return 1;
}

float __83__PMLDiffPrivacyNoiseStrategy_scaleAndAddNoiseToDenseVector_usingNorm_scaleFactor___block_invoke(uint64_t a1, float a2)
{
  [*(id *)(a1 + 32) sample];
  return v3 + a2;
}

- (id)createSamplerByName:(id)a3
{
  id v4 = a3;
  float v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  char v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = 28;
  }
  else
  {
    id v9 = (objc_class *)objc_opt_class();
    int v10 = NSStringFromClass(v9);
    int v11 = [v4 isEqualToString:v10];

    float v12 = 1.0;
    if (!v11) {
      goto LABEL_6;
    }
    uint64_t v8 = 32;
  }
  float v12 = *(float *)((char *)&self->super.isa + v8);
LABEL_6:
  unint64_t seed = self->_seed;
  id v14 = objc_alloc(NSClassFromString((NSString *)v4));
  *(float *)&double v15 = v12;
  if (seed) {
    uint64_t v16 = [v14 initWithMagnitude:self->_seed seed:v15];
  }
  else {
    uint64_t v16 = [v14 initWithMagnitude:v15];
  }
  id v17 = (void *)v16;

  return v17;
}

- (id)createDefaultSampler
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int64_t noiseMechanism = self->_noiseMechanism;
  if (noiseMechanism != 3 && noiseMechanism != 2 && noiseMechanism != 1)
  {
    id v4 = PML_LogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int64_t v9 = self->_noiseMechanism;
      *(_DWORD *)buf = 134217984;
      int64_t v11 = v9;
      _os_log_error_impl(&dword_2212A0000, v4, OS_LOG_TYPE_ERROR, "Invalid noiseMechanism, got: %lld", buf, 0xCu);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Invalid noiseMechanism, got: %lld", self->_noiseMechanism format];
  }
  float v5 = (objc_class *)objc_opt_class();
  BOOL v6 = NSStringFromClass(v5);
  char v7 = [(PMLDiffPrivacyNoiseStrategy *)self createSamplerByName:v6];

  return v7;
}

- (_PMLPreNoiseScaleFactorAndNoiseSampler)samplerWithScaleFactorFor:(id)a3 usingNorm:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = v7;
  switch(self->_noiseMechanism)
  {
    case 0:
      int64_t v9 = PML_LogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int64_t noiseMechanism = self->_noiseMechanism;
        *(_DWORD *)buf = 134217984;
        int64_t v29 = noiseMechanism;
        _os_log_error_impl(&dword_2212A0000, v9, OS_LOG_TYPE_ERROR, "Invalid noiseMechanism, got: %lld", buf, 0xCu);
      }

      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"Invalid noiseMechanism, got: %lld", self->_noiseMechanism format];
      goto LABEL_5;
    case 1:
LABEL_5:
      int v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      [v8 l2norm];
      +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3);
      goto LABEL_15;
    case 2:
      sparse_dimension v13 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v13);
      [v8 l1norm];
      +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:sigFigs:](PMLClassificationEvaluationMetrics, "roundFloatToSigFigs:sigFigs:", 3);
      goto LABEL_15;
    case 3:
      [v7 l2norm];
      float v15 = v14;
      [v8 l1norm];
      float v17 = v16;
      float gaussianScaleFactor = self->_noiseScaleFactors.gaussianScaleFactor;
      if (v5)
      {
        float v19 = (float)(v15 * gaussianScaleFactor) * (float)(v15 * gaussianScaleFactor);
        float laplaceScaleFactor = v17 * self->_noiseScaleFactors.laplaceScaleFactor;
      }
      else
      {
        float v19 = gaussianScaleFactor * gaussianScaleFactor;
        float laplaceScaleFactor = self->_noiseScaleFactors.laplaceScaleFactor;
      }
      float v21 = laplaceScaleFactor * laplaceScaleFactor + laplaceScaleFactor * laplaceScaleFactor;
      if (v19 <= v21)
      {
        uint64_t v24 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v24);
        *(float *)&double v23 = v15;
      }
      else
      {
        id v22 = (objc_class *)objc_opt_class();
        uint64_t v11 = NSStringFromClass(v22);
        *(float *)&double v23 = v17;
      }
      +[PMLClassificationEvaluationMetrics roundFloatToSigFigs:3 sigFigs:v23];
LABEL_15:
      unsigned int v4 = v12;
      break;
    default:
      uint64_t v11 = 0;
      break;
  }

  uint64_t v25 = v4;
  id v26 = (void *)v11;
  result.var1 = *(float *)&v25;
  result.var0 = v26;
  return result;
}

- (PMLDiffPrivacyNoiseStrategy)initWithMaxIterationCount:(int)a3 noiseScaleFactors:(id)a4 minimumMagnitude:(float)a5 noiseMechanism:(int64_t)a6 inplaceNorm:(BOOL)a7
{
  return [(PMLDiffPrivacyNoiseStrategy *)self initWithMaxIterationCount:*(void *)&a3 noiseScaleFactors:0 minimumMagnitude:a6 seed:a7 noiseMechanism:*(double *)&a4 inplaceNorm:*(double *)&a4.var1];
}

- (PMLDiffPrivacyNoiseStrategy)initWithMaxIterationCount:(int)a3 noiseScaleFactors:(id)a4 minimumMagnitude:(float)a5 seed:(int)a6 noiseMechanism:(int64_t)a7 inplaceNorm:(BOOL)a8
{
  float var1 = a4.var1;
  float var0 = a4.var0;
  v19.receiver = self;
  v19.super_class = (Class)PMLDiffPrivacyNoiseStrategy;
  float v15 = [(PMLDiffPrivacyNoiseStrategy *)&v19 init];
  float v17 = v15;
  if (v15)
  {
    v15->_maxIterations = a3;
    *(float *)&double v16 = a5;
    [(PMLDiffPrivacyNoiseStrategy *)v15 setMinimumMagnitude:v16];
    v17->_noiseScaleFactors.float gaussianScaleFactor = var0;
    v17->_noiseScaleFactors.float laplaceScaleFactor = var1;
    if (([MEMORY[0x263F61E28] isInternalBuild] & 1) != 0
      || [MEMORY[0x263F61E28] isBetaBuild])
    {
      v17->_unint64_t seed = a6;
      v17->_noiseScaleFactors = ($6D0F317EF4F58DBDE9FAAFDA827EA2DF)vbic_s8((int8x8_t)v17->_noiseScaleFactors, (int8x8_t)vcltz_f32((float32x2_t)v17->_noiseScaleFactors));
    }
    else
    {
      v17->_noiseScaleFactors = ($6D0F317EF4F58DBDE9FAAFDA827EA2DF)vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)0x40D9999A3F800000, (float32x2_t)v17->_noiseScaleFactors), (int8x8_t)0x40D9999A3F800000, (int8x8_t)v17->_noiseScaleFactors);
      v17->_unint64_t seed = 0;
    }
    v17->_int64_t noiseMechanism = a7;
    v17->_inplaceNorm = a8;
  }
  return v17;
}

+ (id)gaussianNoiseWithScaleFactor:(float)a3 minimumMagnitude:(float)a4 seed:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v8 = [PMLDiffPrivacyNoiseStrategy alloc];
  *(float *)&double v9 = a3;
  *(float *)&double v10 = a4;
  uint64_t v11 = -[PMLDiffPrivacyNoiseStrategy initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:](v8, "initWithMaxIterationCount:noiseScaleFactors:minimumMagnitude:seed:noiseMechanism:inplaceNorm:", 1, v5, 1, 0, v9, 0.0, v10);
  return v11;
}

@end