@interface UPCalibrationModel
+ (UPCalibrationModel)modelWithLoadedModelConfiguration:(id)a3 error:(id *)a4;
- (UPCalibrationModel)initWithLoadedModelConfiguration:(id)a3;
- (UPLoadedModelConfiguration)_loadedModelConfiguration;
- (double)forwardWithSpanLabels:(UPGenericTensor *)a3 embeddings:(UPGenericTensor *)a4 utterance:(id)a5;
- (id)scoreFromQuery:(id)a3 preprocessorOutput:(id)a4 error:(id *)a5;
@end

@implementation UPCalibrationModel

- (void).cxx_destruct
{
}

- (UPLoadedModelConfiguration)_loadedModelConfiguration
{
  return self->__loadedModelConfiguration;
}

- (double)forwardWithSpanLabels:(UPGenericTensor *)a3 embeddings:(UPGenericTensor *)a4 utterance:(id)a5
{
  id v8 = a5;
  v9 = [(UPLoadedModelConfiguration *)self->__loadedModelConfiguration calibrationEspressoModule];
  uaap::EspressoModule::reshape((uint64_t)v9, (uint64_t)a4, (uint64_t)a3);
  uaap::EspressoModule::buildPlan((uaap::EspressoModule *)v9);
  char v13 = 12;
  strcpy(__p, "span_indices");
  uaap::EspressoModule::setInput((uint64_t)v9, (uint64_t)__p, (uint64_t *)&a3->data);
  if (v13 < 0) {
    operator delete(*(void **)__p);
  }
  char v13 = 16;
  strcpy(__p, "token_embeddings");
  uaap::EspressoModule::setInput((uint64_t)v9, (uint64_t)__p, (uint64_t *)&a4->data);
  if (v13 < 0) {
    operator delete(*(void **)__p);
  }
  uaap::EspressoModule::executePlan((uaap::EspressoModule *)v9);
  std::string::basic_string[abi:ne180100]<0>(&v16, "app_label_softmax");
  uaap::EspressoModule::getOutput((uint64_t)__p);
  if ((unint64_t)(v15 - (unsigned char *)v14) <= 4) {
    std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
  }
  float v10 = *((float *)v14 + 1);
  uaap::EspressoModule::cleanPlan((uaap::EspressoModule *)v9);
  if (v14)
  {
    v15 = v14;
    operator delete(v14);
  }
  if (*(void *)__p)
  {
    *(void *)&__p[8] = *(void *)__p;
    operator delete(*(void **)__p);
  }
  if (v17 < 0) {
    operator delete(v16);
  }

  return v10;
}

- (UPCalibrationModel)initWithLoadedModelConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UPCalibrationModel;
  v6 = [(UPCalibrationModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__loadedModelConfiguration, a3);
  }

  return v7;
}

- (id)scoreFromQuery:(id)a3 preprocessorOutput:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = SNLPOSLoggerForCategory(7);
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CalibrationInference", "", buf, 2u);
  }

  char v13 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v13, OS_LOG_TYPE_DEFAULT, "BEGIN \"CalibrationInference\"", buf, 2u);
  }

  uint64_t v14 = [v8 spanLabelsTensor];
  v30 = 0;
  v31 = 0;
  uint64_t v32 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v30, *(const void **)v14, *(void *)(v14 + 8), (uint64_t)(*(void *)(v14 + 8) - *(void *)v14) >> 3);
  v33 = 0;
  v34 = 0;
  uint64_t v35 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v33, *(const void **)(v14 + 24), *(void *)(v14 + 32), (uint64_t)(*(void *)(v14 + 32) - *(void *)(v14 + 24)) >> 2);
  uint64_t v15 = [v8 embeddingsTensor];
  v24 = 0;
  v25 = 0;
  uint64_t v26 = 0;
  std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v24, *(const void **)v15, *(void *)(v15 + 8), (uint64_t)(*(void *)(v15 + 8) - *(void *)v15) >> 3);
  __p = 0;
  v28 = 0;
  uint64_t v29 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, *(const void **)(v15 + 24), *(void *)(v15 + 32), (uint64_t)(*(void *)(v15 + 32) - *(void *)(v15 + 24)) >> 2);
  v16 = [v7 utterance];
  [(UPCalibrationModel *)self forwardWithSpanLabels:&v30 embeddings:&v24 utterance:v16];
  double v18 = v17;

  if (__p)
  {
    v28 = __p;
    operator delete(__p);
  }
  if (v24)
  {
    v25 = v24;
    operator delete(v24);
  }
  if (v33)
  {
    v34 = v33;
    operator delete(v33);
  }
  if (v30)
  {
    v31 = v30;
    operator delete(v30);
  }
  v19 = SNLPOSLoggerForCategory(7);
  v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v20, OS_SIGNPOST_INTERVAL_END, v10, "CalibrationInference", "", buf, 2u);
  }

  v21 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v21, OS_LOG_TYPE_DEFAULT, "END \"CalibrationInference\"", buf, 2u);
  }

  v22 = [NSNumber numberWithDouble:v18];

  return v22;
}

+ (UPCalibrationModel)modelWithLoadedModelConfiguration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 calibrationEspressoModule])
  {
    v6 = [[UPCalibrationModel alloc] initWithLoadedModelConfiguration:v5];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.uaapcustomluframework" code:9 userInfo:0];
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end