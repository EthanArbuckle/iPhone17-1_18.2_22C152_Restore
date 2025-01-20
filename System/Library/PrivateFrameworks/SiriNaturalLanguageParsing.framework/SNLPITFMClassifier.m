@interface SNLPITFMClassifier
+ (id)_convertResponse:(ITFMParserResponse *)a3;
+ (id)_initializationBlock;
+ (id)classifierWithModelBundle:(id)a3 modelInfo:(id)a4 error:(id *)a5;
+ (id)classifierWithModelBundle:(id)a3 modelInfo:(id)a4 initializationBlock:(id)a5 error:(id *)a6;
+ (unique_ptr<const)_convertRequest:(id)a3;
- (SNLPITFMClassifier)initWithModelBundle:(id)a3 modelInfo:(id)a4 initializationBlock:(id)a5 error:(id *)a6;
- (SNLPITFMModelBundle)modelBundle;
- (SNLPITFMModelInfo)modelInfo;
- (id).cxx_construct;
- (id)responseForRequest:(id)a3 error:(id *)a4;
- (unique_ptr<snlp::common::asset_logger::SNLPAssetLogger,)_setupAssetLogger;
@end

@implementation SNLPITFMClassifier

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_modelBundle, 0);
  value = self->_assetLogger.__ptr_.__value_;
  self->_assetLogger.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<snlp::common::asset_logger::SNLPAssetLogger>::operator()[abi:ne180100]((uint64_t)value);
  }
  v4 = self->_orchestrator.__ptr_.__value_;
  self->_orchestrator.__ptr_.__value_ = 0;
  if (v4)
  {
    v5 = *(void (**)(void))(*(void *)v4 + 16);
    v5();
  }
}

- (SNLPITFMModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (SNLPITFMModelBundle)modelBundle
{
  return self->_modelBundle;
}

- (id)responseForRequest:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = SNLPOSLoggerForCategory(7);
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SNLPITFMClassifier responseForRequest", "", buf, 2u);
  }

  v10 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN \"SNLPITFMClassifier responseForRequest\"", buf, 2u);
  }

  v11 = SNLPOSLoggerForCategory(2);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v12 = [(SNLPITFMModelInfo *)self->_modelInfo loggingComponent];
    signed int v13 = v12;
    if (v12 >= 8)
    {
      v15 = SNLPOSLoggerForCategory(4);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v33 = 136315394;
        *(void *)&v33[4] = "<UNDEFINED_COMPONENT>";
        __int16 v34 = 2048;
        uint64_t v35 = v13;
        _os_log_impl(&dword_1C8DA9000, v15, OS_LOG_TYPE_ERROR, "[%s] The component %zu is invalid", v33, 0x16u);
      }

      v14 = "<UNDEFINED_COMPONENT>";
    }
    else
    {
      v14 = off_1E65808C8[v12];
    }
    v16 = [(SNLPITFMModelInfo *)self->_modelInfo loggingComponentString];
    snlp::common::asset_logger::SNLPAssetLogger::toString((uint64_t *)v33, (snlp::common::asset_logger::SNLPAssetLogger *)self->_assetLogger.__ptr_.__value_);
    if (v36 >= 0) {
      v17 = v33;
    }
    else {
      v17 = *(unsigned char **)v33;
    }
    *(_DWORD *)buf = 136315650;
    v38 = v14;
    __int16 v39 = 2112;
    v40 = v16;
    __int16 v41 = 2080;
    v42 = v17;
    _os_log_impl(&dword_1C8DA9000, v11, OS_LOG_TYPE_DEBUG, "[%s] [%@ Assets] %s", buf, 0x20u);
    if (v36 < 0) {
      operator delete(*(void **)v33);
    }
  }
  v18 = objc_opt_class();
  if (v18)
  {
    [v18 _convertRequest:v5];
    uint64_t v19 = v32;
  }
  else
  {
    uint64_t v19 = 0;
  }
  buf[0] = 0;
  char v43 = 0;
  value = self->_orchestrator.__ptr_.__value_;
  uint64_t v31 = v19;
  uint64_t v32 = 0;
  (**(void (***)(unsigned char *__return_ptr))value)(v33);
  std::optional<sirinluinternalitfm::ITFMParserResponse>::operator=[abi:ne180100]<sirinluinternalitfm::ITFMParserResponse,void>((uint64_t)buf);
  MEMORY[0x1CB773FB0](v33);
  uint64_t v21 = v31;
  uint64_t v31 = 0;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  uint64_t v22 = objc_opt_class();
  if (!v43) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  v23 = (void *)v22;
  MEMORY[0x1CB773F90](v30, buf);
  v24 = [v23 _convertResponse:v30];
  MEMORY[0x1CB773FB0](v30);
  v25 = SNLPOSLoggerForCategory(7);
  v26 = v25;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)v33 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v26, OS_SIGNPOST_INTERVAL_END, v7, "SNLPITFMClassifier responseForRequest", "", v33, 2u);
  }

  v27 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1C8DA9000, v27, OS_LOG_TYPE_DEFAULT, "END \"SNLPITFMClassifier responseForRequest\"", v33, 2u);
  }

  if (v43) {
    MEMORY[0x1CB773FB0](buf);
  }
  uint64_t v28 = v32;
  uint64_t v32 = 0;
  if (v28) {
    (*(void (**)(uint64_t))(*(void *)v28 + 8))(v28);
  }

  return v24;
}

- (unique_ptr<snlp::common::asset_logger::SNLPAssetLogger,)_setupAssetLogger
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(SNLPITFMModelBundle *)self->_modelBundle versionURL];
  *(void *)buf = [(id)objc_claimAutoreleasedReturnValue() path];
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&__p, (char **)buf);
  getAssetDirectoryNCV((const std::__fs::filesystem::path *)&__p);
}

- (SNLPITFMClassifier)initWithModelBundle:(id)a3 modelInfo:(id)a4 initializationBlock:(id)a5 error:(id *)a6
{
  void (**v13)(void *__return_ptr);
  id v14;
  void *v15;
  SNLPITFMClassifier *v16;
  SNLPITFMClassifier *v17;
  ITFMOrchestrator *v18;
  ITFMOrchestrator *value;
  uint64_t v20;
  SNLPITFMClassifier *v21;
  ITFMOrchestrator *v22;
  SNLPAssetLogger *v24;
  objc_super v25;
  uint64_t v26;
  ITFMOrchestrator *v27;

  id v11 = a3;
  id v12 = a4;
  signed int v13 = (void (**)(void *__return_ptr))a5;
  v26 = 0;
  ((void (**)(ITFMOrchestrator **__return_ptr))v13)[2](&v27);
  v14 = 0;
  v15 = v14;
  if (v27)
  {
    v25.receiver = self;
    v25.super_class = (Class)SNLPITFMClassifier;
    v16 = [(SNLPITFMClassifier *)&v25 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_modelBundle, a3);
      objc_storeStrong((id *)&v17->_modelInfo, a4);
      v18 = v27;
      v27 = 0;
      value = v17->_orchestrator.__ptr_.__value_;
      v17->_orchestrator.__ptr_.__value_ = v18;
      if (value) {
        (*(void (**)(ITFMOrchestrator *))(*(void *)value + 16))(value);
      }
      [(SNLPITFMClassifier *)v17 _setupAssetLogger];
      v20 = (uint64_t)v17->_assetLogger.__ptr_.__value_;
      v17->_assetLogger.__ptr_.__value_ = v24;
      if (v20) {
        std::default_delete<snlp::common::asset_logger::SNLPAssetLogger>::operator()[abi:ne180100](v20);
      }
    }
    self = v17;
    uint64_t v21 = self;
  }
  else
  {
    if (!a6)
    {
      uint64_t v21 = 0;
      goto LABEL_13;
    }
    uint64_t v21 = 0;
    *a6 = v14;
  }
  uint64_t v22 = v27;
  v27 = 0;
  if (v22) {
    (*(void (**)(ITFMOrchestrator *))(*(void *)v22 + 16))(v22);
  }
LABEL_13:

  return v21;
}

+ (id)_convertResponse:(ITFMParserResponse *)a3
{
}

+ (unique_ptr<const)_convertRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 data];
  id v5 = (const unsigned __int8 *)[v4 bytes];

  v6 = [v3 data];
  [v6 length];
  PB::Reader::Reader((PB::Reader *)&v7, v5);

  operator new();
}

+ (id)_initializationBlock
{
  return &__block_literal_global;
}

void __42__SNLPITFMClassifier__initializationBlock__block_invoke(void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  a2;
  *a3 = 0;
  [v5 versionURL];
  uint64_t v7 = [(id)objc_claimAutoreleasedReturnValue() path];
  v6 = (const std::__fs::filesystem::path *)std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v8, &v7);
  getAssetDirectoryNCV(v6);
}

+ (id)classifierWithModelBundle:(id)a3 modelInfo:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(id)objc_opt_class() _initializationBlock];
  id v11 = (void *)[objc_alloc((Class)a1) initWithModelBundle:v8 modelInfo:v9 initializationBlock:v10 error:a5];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else if (a5)
  {
    *a5 = 0;
  }

  return v12;
}

+ (id)classifierWithModelBundle:(id)a3 modelInfo:(id)a4 initializationBlock:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)[objc_alloc((Class)a1) initWithModelBundle:v10 modelInfo:v11 initializationBlock:v12 error:a6];

  return v13;
}

@end