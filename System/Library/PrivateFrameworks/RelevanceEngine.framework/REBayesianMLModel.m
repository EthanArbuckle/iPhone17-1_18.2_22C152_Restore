@interface REBayesianMLModel
+ (unint64_t)featureBitWidth;
+ (unint64_t)maxFeatureCount;
- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4;
- (BOOL)_saveDebugModelToURL:(id)a3 error:(id *)a4;
- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4;
- (BOOL)_saveModelToURL:(id)a3 includeDebugData:(BOOL)a4 error:(id *)a5;
- (REBayesianMLModel)initWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5;
- (REExportedTable)content;
- (float)_getAveragePrediction;
- (float)_getNormalizedEntropy;
- (id).cxx_construct;
- (id)_predictWithFeatures:(id)a3;
- (int64_t)_getNumberOfCoordinates;
- (unint64_t)_getTotalExampleCount;
- (unint64_t)_getTotalPositiveCount;
- (unint64_t)_maxFeatureCoordinates;
- (void)_clearModel;
- (void)_loadFeatureVector:(void *)a3 fromFeatureMap:(id)a4;
- (void)_trainWithFeatures:(id)a3 positiveEvent:(id)a4;
- (void)logCoreAnalyticsMetrics;
@end

@implementation REBayesianMLModel

+ (unint64_t)featureBitWidth
{
  return 56;
}

- (void).cxx_destruct
{
}

- (REBayesianMLModel)initWithFeatureSet:(id)a3 priorMean:(float)a4 modelVarianceEpsilon:(float)a5
{
  id v8 = a3;
  v19.receiver = self;
  v19.super_class = (Class)REBayesianMLModel;
  *(float *)&double v9 = a4;
  *(float *)&double v10 = a5;
  v11 = [(REMLModel *)&v19 initWithFeatureSet:v8 priorMean:v9 modelVarianceEpsilon:v10];
  if (v11)
  {
    uint64_t v12 = [v8 count];
    int v13 = v12;
    v11->_numberOfFeatures = v12;
    [(REMLModel *)v11 priorMean];
    float v15 = v14;
    unint64_t v16 = [(REBayesianMLModel *)v11 _maxFeatureCoordinates];
    [(REMLModel *)v11 varianceEpsilon];
    BayesianModel::InitializeFeatures(&v11->_model, 12585182, v13, v15, v16, v17);
  }

  return v11;
}

- (unint64_t)_maxFeatureCoordinates
{
  return 75 * self->_numberOfFeatures;
}

- (id).cxx_construct
{
  return self;
}

- (BOOL)_loadModelFromURL:(id)a3 error:(id *)a4
{
  v5 = [NSString stringWithContentsOfURL:a3 encoding:4 error:a4];
  v6 = v5;
  if (v5)
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v5 UTF8String]);
    char v7 = BayesianModel::LoadModel((uint64_t)&self->_model, &__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_trainWithFeatures:(id)a3 positiveEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  std::vector<unsigned long long>::vector(&__p, self->_numberOfFeatures);
  [(REBayesianMLModel *)self _loadFeatureVector:&__p fromFeatureMap:v6];
  if (!BayesianModel::Train(&self->_model, (uint64_t *)&__p, [v7 BOOLValue]))
  {
    id v8 = RELogForDomain(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[REBayesianMLModel _trainWithFeatures:positiveEvent:](v8);
    }

    double v10 = __p;
    double v9 = v16;
    [(REMLModel *)self priorMean];
    float v12 = v11;
    unint64_t v13 = [(REBayesianMLModel *)self _maxFeatureCoordinates];
    [(REMLModel *)self varianceEpsilon];
    BayesianModel::InitializeFeatures(&self->_model, 12585182, (unint64_t)(v9 - v10) >> 3, v12, v13, v14);
  }
  if (__p)
  {
    unint64_t v16 = __p;
    operator delete(__p);
  }
}

- (id)_predictWithFeatures:(id)a3
{
  id v4 = a3;
  std::vector<unsigned long long>::vector(&v48, self->_numberOfFeatures);
  [(REBayesianMLModel *)self _loadFeatureVector:&v48 fromFeatureMap:v4];
  uint64_t v47 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  BayesianModel::Predict((uint64_t)&self->_model, (uint64_t *)&v48, (uint64_t)&v45, 0.5);
  v5 = [(REMLModel *)self metricsRecorder];
  id v6 = [(REMLModel *)self metricsInteraction];
  RESubmitBayesianModelPredicted((uint64_t)&v45, v5, v6);

  long long v7 = v45;
  if ([(REMLModel *)self allowsExploreExploit])
  {
    if (RETrainingSimulationIsCurrentlyActive()) {
      [(REMLModel *)self simulationExploreExploitModulator];
    }
    else {
      [(REMLModel *)self exploreExploitModulator];
    }
    double v9 = scaled_box_muller(*(double *)&v7, *((double *)&v7 + 1), v8);
    normal_erf(v9 / sqrt(*((double *)&v7 + 1) + (double)self->_numberOfFeatures));
    double v10 = v11;
  }
  else
  {
    double v10 = *(double *)&v46;
  }
  float v12 = RELogForDomain(4);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v13)
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3321888768;
    v41[2] = __42__REBayesianMLModel__predictWithFeatures___block_invoke;
    v41[3] = &unk_26CFA4D88;
    v41[4] = self;
    v42 = 0;
    v43 = 0;
    uint64_t v44 = 0;
    std::vector<unsigned long long>::__init_with_size[abi:ne180100]<unsigned long long *,unsigned long long *>(&v42, v48, (uint64_t)v49, (v49 - (unsigned char *)v48) >> 3);
    float v17 = (void *)MEMORY[0x223C31700](v41);
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __42__REBayesianMLModel__predictWithFeatures___block_invoke_2;
    v39[3] = &unk_2644C0A00;
    v39[4] = self;
    id v40 = v17;
    id v18 = v17;
    [v4 enumerateInt64FeaturesUsingIndexedBlock:v18 emptyFeatureBlock:v39];

    if (v42)
    {
      v43 = v42;
      operator delete(v42);
    }
  }
  *(float *)&double v14 = v10;
  *(float *)&double v15 = *(double *)&v7;
  *(float *)&double v16 = *((double *)&v7 + 1);
  objc_super v19 = +[REMLPrediction predictionWithProbability:v14 mean:v15 variance:v16 pessimistic:0.0];
  if (REMLExplanationsEnabled())
  {
    v36 = 0;
    v37 = 0;
    uint64_t v38 = 0;
    v33 = 0;
    v34 = 0;
    uint64_t v35 = 0;
    BayesianModel::AccessGaussiansAndBias(&self->_model.m_rwlock, (uint64_t *)&v48, (uint64_t)&v36, (uint64_t)&v33);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3321888768;
    v25[2] = __42__REBayesianMLModel__predictWithFeatures___block_invoke_2;
    v25[3] = &unk_26CFA4DC0;
    v25[4] = self;
    v27 = 0;
    v28 = 0;
    uint64_t v29 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v27, v36, (uint64_t)v37, (v37 - (unsigned char *)v36) >> 3);
    std::string __p = 0;
    v31 = 0;
    uint64_t v32 = 0;
    std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&__p, v33, (uint64_t)v34, (v34 - (unsigned char *)v33) >> 3);
    id v26 = v19;
    v20 = (void *)MEMORY[0x223C31700](v25);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__REBayesianMLModel__predictWithFeatures___block_invoke_7;
    v23[3] = &unk_2644C0A28;
    id v24 = v20;
    id v21 = v20;
    [v4 enumerateInt64FeaturesUsingIndexedBlock:v23 emptyFeatureBlock:v21];

    if (__p)
    {
      v31 = __p;
      operator delete(__p);
    }
    if (v27)
    {
      v28 = v27;
      operator delete(v27);
    }
    if (v33)
    {
      v34 = v33;
      operator delete(v33);
    }
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
  }
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }

  return v19;
}

void __42__REBayesianMLModel__predictWithFeatures___block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 552) > a3)
  {
    float v8 = RELogForDomain(4);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8 * a3);
      double v10 = [v7 name];
      int v11 = 134218498;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      double v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = a4;
      _os_log_debug_impl(&dword_21E6E6000, v8, OS_LOG_TYPE_DEBUG, "\t0x%016llX\t%@ → %016llX", (uint8_t *)&v11, 0x20u);
    }
  }
}

void __42__REBayesianMLModel__predictWithFeatures___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 552) > a3)
  {
    v5 = +[REFeatureValue nullValueForFeature:v6];
    [v5 int64Value];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __42__REBayesianMLModel__predictWithFeatures___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (*(void *)(*(void *)(a1 + 32) + 552) > a3)
  {
    double v7 = *(double *)(*(void *)(a1 + 48) + 8 * a3);
    *(float *)&double v7 = v7;
    double v8 = *(double *)(*(void *)(a1 + 72) + 8 * a3);
    *(float *)&double v8 = v8;
    id v11 = v5;
    uint64_t v9 = +[REMLExplanation explanationForFeature:v5 mean:v7 variance:v8];
    [*(id *)(a1 + 40) addExplanation:v9];

    id v6 = v11;
  }
  return MEMORY[0x270F9A758](v5, v6);
}

uint64_t __42__REBayesianMLModel__predictWithFeatures___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_loadFeatureVector:(void *)a3 fromFeatureMap:(id)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__REBayesianMLModel__loadFeatureVector_fromFeatureMap___block_invoke;
  v5[3] = &unk_2644C0A50;
  v5[4] = self;
  v5[5] = a3;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__REBayesianMLModel__loadFeatureVector_fromFeatureMap___block_invoke_2;
  v4[3] = &unk_2644C0A78;
  v4[4] = self;
  v4[5] = a3;
  [a4 enumerateInt64FeaturesUsingIndexedBlock:v5 emptyFeatureBlock:v4];
}

void __55__REBayesianMLModel__loadFeatureVector_fromFeatureMap___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  id v15 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 552) <= a3) {
    goto LABEL_9;
  }
  if (HIBYTE(a4))
  {
    double v14 = @"Value %llu cannot be stored into feature for this model";
LABEL_8:
    RERaiseInternalException((void *)*MEMORY[0x263EFF4A0], v14, v7, v8, v9, v10, v11, v12, a4);
    goto LABEL_9;
  }
  if (a3 >= 0x100)
  {
    double v14 = @"Feature id %lu cannot be stored into feature for this model";
    a4 = a3;
    goto LABEL_8;
  }
  __int16 v13 = *(void **)(a1 + 40);
  if (a3 >= (uint64_t)(v13[1] - *v13) >> 3) {
    std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
  }
  *(void *)(*v13 + 8 * a3) = a4 | (a3 << 56);
LABEL_9:
}

void __55__REBayesianMLModel__loadFeatureVector_fromFeatureMap___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 552) > a3)
  {
    id v9 = v5;
    id v6 = +[REFeatureValue nullValueForFeature:](REFeatureValue, "nullValueForFeature:");
    uint64_t v7 = [v6 int64Value];

    uint64_t v8 = *(void **)(a1 + 40);
    if (a3 >= (uint64_t)(v8[1] - *v8) >> 3) {
      std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
    }
    *(void *)(*v8 + 8 * a3) = v7 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)a3 << 56);
    id v5 = v9;
  }
}

- (BOOL)_saveModelToURL:(id)a3 includeDebugData:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  MEMORY[0x223C30D40](__sb);
  id v8 = [v7 path];
  [v8 UTF8String];
  std::filebuf::open();

  uint64_t v9 = v16;
  if (v16)
  {
    uint64_t v11 = MEMORY[0x263F8C2F8] + 24;
    v12.__vftable = (std::ios_base_vtbl *)(MEMORY[0x263F8C2F8] + 64);
    std::ios_base::init(&v12, __sb);
    uint64_t v13 = 0;
    int v14 = -1;
    BayesianModel::SaveModel((uint64_t)&self->_model, &v11, v5);
    std::ostream::flush();
    std::ostream::~ostream();
  }
  std::filebuf::close();
  MEMORY[0x223C30D50](__sb);

  return v9 != 0;
}

- (BOOL)_saveModelToURL:(id)a3 error:(id *)a4
{
  return [(REBayesianMLModel *)self _saveModelToURL:a3 includeDebugData:0 error:a4];
}

- (BOOL)_saveDebugModelToURL:(id)a3 error:(id *)a4
{
  return [(REBayesianMLModel *)self _saveModelToURL:a3 includeDebugData:1 error:a4];
}

- (void)_clearModel
{
  p_model = &self->_model;
  int numberOfFeatures = self->_numberOfFeatures;
  [(REMLModel *)self priorMean];
  double v6 = v5;
  unint64_t v7 = [(REBayesianMLModel *)self _maxFeatureCoordinates];
  [(REMLModel *)self varianceEpsilon];
  BayesianModel::InitializeFeatures(p_model, 12585182, numberOfFeatures, v6, v7, v8);
}

- (int64_t)_getNumberOfCoordinates
{
  return BayesianModel::getNumberOfCoordinates(&self->_model);
}

- (float)_getAveragePrediction
{
  return BayesianModel::getAveragePrediction(&self->_model);
}

- (float)_getNormalizedEntropy
{
  BayesianModel::getAverageNormalizedEntropy(&self->_model);
  return v2;
}

- (unint64_t)_getTotalExampleCount
{
  return self->_model.m_nTotalExamples;
}

- (unint64_t)_getTotalPositiveCount
{
  return self->_model.m_nTotalTrue;
}

+ (unint64_t)maxFeatureCount
{
  return 254;
}

- (void)logCoreAnalyticsMetrics
{
  id v4 = [(REMLModel *)self metricsRecorder];
  v3 = [(REMLModel *)self metricsInteraction];
  RESubmitBayesianModelTrained(&self->_model, v4, v3);
}

- (REExportedTable)content
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  BayesianModel::CaptureDebugTable((uint64_t)&self->_model, (uint64_t *)&v9);
  double v2 = objc_alloc_init(REExportedTable);
  if (v10 != v9)
  {
    v3 = REStringArrayFromVector(v9);
    [(REExportedTable *)v2 setHeader:v3];

    id v4 = v9;
    if (0xAAAAAAAAAAAAAAABLL * (v10 - v9) >= 2)
    {
      unint64_t v5 = 1;
      uint64_t v6 = 3;
      do
      {
        unint64_t v7 = REStringArrayFromVector(&v4[v6]);
        [(REExportedTable *)v2 addRow:v7];

        ++v5;
        id v4 = v9;
        v6 += 3;
      }
      while (v5 < 0xAAAAAAAAAAAAAAABLL * (v10 - v9));
    }
  }
  std::ios_base v12 = &v9;
  std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  return v2;
}

- (void)_trainWithFeatures:(os_log_t)log positiveEvent:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E6E6000, log, OS_LOG_TYPE_ERROR, "TRAINING FAILED - Resetting to empty model", v1, 2u);
}

@end