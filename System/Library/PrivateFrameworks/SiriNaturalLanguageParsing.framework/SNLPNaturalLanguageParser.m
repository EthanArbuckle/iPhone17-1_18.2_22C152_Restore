@interface SNLPNaturalLanguageParser
+ (id)parserFromAssetDirectory:(id)a3 error:(id *)a4;
+ (id)parserFromAssetDirectory:(id)a3 metadata:(id)a4 error:(id *)a5;
- (id).cxx_construct;
- (id)_initWithCppOrchestrator:()unique_ptr<nlv4_inference_orchestrator:(std::default_delete<nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator>>)a3 :orchestration::NLv4InferenceOrchestrator;
- (id)inferenceResponseForRequest:(id)a3 error:(id *)a4;
@end

@implementation SNLPNaturalLanguageParser

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (id)inferenceResponseForRequest:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = SNLPOSLoggerForCategory(7);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = SNLPOSLoggerForCategory(7);
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C8DA9000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SNLPNaturalLanguageParser inferenceResponseForRequest", "", buf, 2u);
  }

  v10 = SNLPOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C8DA9000, v10, OS_LOG_TYPE_DEFAULT, "BEGIN \"SNLPNaturalLanguageParser inferenceResponseForRequest\"", buf, 2u);
  }

  [MEMORY[0x1E4FA2B00] convertNLv4ParserRequestToCpp:v5];
  value = self->_cppOrchestrator.__ptr_.__value_;
  *(void *)buf = 0;
  nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator::pbhandle((uint64_t)value);
}

- (id)_initWithCppOrchestrator:()unique_ptr<nlv4_inference_orchestrator:(std::default_delete<nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator>>)a3 :orchestration::NLv4InferenceOrchestrator
{
  v8.receiver = self;
  v8.super_class = (Class)SNLPNaturalLanguageParser;
  id v4 = [(SNLPNaturalLanguageParser *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v6 = *(nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator **)a3.__ptr_.__value_;
    *(void *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator>::reset[abi:ne180100]((nlv4_inference_orchestrator::orchestration::NLv4InferenceOrchestrator **)v4 + 1, v6);
  }
  return v5;
}

+ (id)parserFromAssetDirectory:(id)a3 metadata:(id)a4 error:(id *)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = SNLPOSLoggerForCategory(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C8DA9000, v9, OS_LOG_TYPE_DEBUG, "Calling parser setup", (uint8_t *)buf, 2u);
  }

  if (v7)
  {
    id v10 = v7;
    v19[0] = (void *)[v10 fileSystemRepresentation];
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(buf, (char **)v19);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf[0].__r_.__value_.__l.__data_);
    }
    buf[0].__r_.__value_.__r.__words[0] = [v10 fileSystemRepresentation];
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v20, &buf[0].__r_.__value_.__l.__data_);
    if (v8)
    {
      v11 = SNLPOSLoggerForCategory(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_1C8DA9000, v11, OS_LOG_TYPE_DEBUG, "Attempt to convert metadata", (uint8_t *)buf, 2u);
      }

      snlp::common::espresso_inference::e5ml::selflogging::convertMetadata(v8, (uint64_t)v19);
      v12 = SNLPOSLoggerForCategory(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
        _os_log_impl(&dword_1C8DA9000, v12, OS_LOG_TYPE_DEBUG, "Converted metadata", (uint8_t *)buf, 2u);
      }

      operator new();
    }
    operator new();
  }
  uint64_t v13 = [NSString stringWithFormat:@"NLv4 was provided with a nil asset path.  As a result, the NLv4 model could not be set up.  Please provide a non-nil NLv4 model asset path instead."];
  uint64_t v14 = (void *)v13;
  if (a5)
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28588];
    v22[0] = *MEMORY[0x1E4F28568];
    v22[1] = v16;
    v23[0] = v13;
    v23[1] = v13;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    *a5 = [v15 errorWithDomain:@"SNLPNaturalLanguageParserErrorDomain" code:2 userInfo:v17];
  }
  return 0;
}

+ (id)parserFromAssetDirectory:(id)a3 error:(id *)a4
{
  id v4 = [a1 parserFromAssetDirectory:a3 metadata:0 error:a4];
  return v4;
}

@end