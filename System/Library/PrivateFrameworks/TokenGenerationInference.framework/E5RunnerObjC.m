@interface E5RunnerObjC
+ (BOOL)compileModelAtPath:(id)a3 modelType:(int64_t)a4 error:(id *)a5;
+ (BOOL)compileModelWithConfiguration:(id)a3 error:(id *)a4;
+ (BOOL)doesModelRequireCompilationAtPath:(id)a3 modelType:(int64_t)a4;
+ (BOOL)doesModelRequireCompilationWithConfiguration:(id)a3;
+ (BOOL)doesModelRequireCompilationWithConfiguration:(id)a3 bundleCachePath:(id)a4;
+ (id)compiledModelAtPath:(id)a3 modelType:(int64_t)a4 bundleCachePath:(id)a5 error:(id *)a6;
+ (id)compiledModelWithConfiguration:(id)a3 bundleCachePath:(id)a4 error:(id *)a5;
+ (id)log;
- (BOOL)setKVCacheEntry:(id)a3 startIndex:(int64_t)a4 error:(id *)a5;
- (BOOL)supportsModularAttention;
- (BOOL)supportsNonLinearRunning;
- (E5RunnerObjC)initWithModelConfiguration:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)createKVCacheEntry:(_NSRange)a3 error:(id *)a4;
- (id)description;
- (unint64_t)getNumTokensProcessed;
- (unint64_t)maxContextLength;
- (unint64_t)vocabularyCount;
- (void)clearAllState;
- (void)enableTelemetryWithIdentifier:(id)a3;
- (void)moveToDynamicState;
- (void)moveToFullyLoadedState;
- (void)purgeSteps:(id)a3;
- (void)purgeUnusedKeyValueCache:(id)a3 trgIdxs:(id)a4;
- (void)reset;
- (void)resetToStep:(int64_t)a3;
- (void)runTokens:(id)a3 outputBlock:(id)a4;
- (void)runTokens:(id)a3 tokenTreeIndexes:(id)a4 outputBlock:(id)a5;
@end

@implementation E5RunnerObjC

+ (id)log
{
  if (+[E5RunnerObjC log]::onceToken != -1) {
    dispatch_once(&+[E5RunnerObjC log]::onceToken, &__block_literal_global);
  }
  v2 = (void *)+[E5RunnerObjC log]::log;

  return v2;
}

uint64_t __19__E5RunnerObjC_log__block_invoke()
{
  +[E5RunnerObjC log]::log = (uint64_t)os_log_create("com.apple.tokengenerationinference", "E5LanguageModel");

  return MEMORY[0x270F9A758]();
}

- (id)description
{
  return self->_description;
}

- (E5RunnerObjC)initWithModelConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)E5RunnerObjC;
  if ([(E5RunnerObjC *)&v10 init])
  {
    v6 = +[E5RunnerObjC log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v5;
      _os_log_impl(&dword_25FA51000, v6, OS_LOG_TYPE_DEFAULT, "Initializing E5RunnerObjC with model configuration: %@", buf, 0xCu);
    }

    if (v5)
    {
      [v5 modelConfiguration];
    }
    else
    {
      uint64_t v20 = 0;
      *(_OWORD *)__p = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      *(_OWORD *)buf = 0u;
    }
    cgm::token_generation_inference::ajax::AJAXE5MLModelLoader::createModelFromBundle((TGIE5ModelConfiguration *)buf, v7);
  }
  v8 = (E5RunnerObjC *)0;

  return v8;
}

- (void)runTokens:(id)a3 outputBlock:(id)a4
{
}

- (BOOL)supportsNonLinearRunning
{
  value = self->ajax_e5_model.__ptr_.__value_;
  if (value) {
  return (char)value;
  }
}

- (BOOL)supportsModularAttention
{
  value = self->ajax_e5_model.__ptr_.__value_;
  if (value) {
  return (char)value;
  }
}

- (void)runTokens:(id)a3 tokenTreeIndexes:(id)a4 outputBlock:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v38 = (void (**)(id, void *, void))a5;
  v36 = v7;
  if (v8)
  {
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v43 = 0;
    id v35 = v8;
    std::vector<std::vector<unsigned long>>::reserve(&v43, [v35 count]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obj = v35;
    uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v9)
    {
      uint64_t v40 = *(void *)v55;
      do
      {
        uint64_t v10 = 0;
        uint64_t v41 = v9;
        do
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v54 + 1) + 8 * v10);
          __p = 0;
          v52 = 0;
          uint64_t v53 = 0;
          std::vector<std::vector<unsigned long>>::push_back[abi:ne180100](&v43, (uint64_t)&__p);
          if (__p)
          {
            v52 = __p;
            operator delete(__p);
          }
          std::vector<unsigned long>::reserve((void **)(v44 - 24), [v11 count]);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v58 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v48;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v48 != v14) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v16 = v44;
                uint64_t v17 = [*(id *)(*((void *)&v47 + 1) + 8 * i) unsignedIntegerValue];
                uint64_t v18 = v17;
                unint64_t v19 = *(void *)(v16 - 8);
                uint64_t v20 = *(uint64_t **)(v16 - 16);
                if ((unint64_t)v20 >= v19)
                {
                  v22 = *(uint64_t **)(v16 - 24);
                  uint64_t v23 = v20 - v22;
                  if ((unint64_t)(v23 + 1) >> 61) {
                    std::vector<std::string>::__throw_length_error[abi:ne180100]();
                  }
                  unint64_t v24 = v19 - (void)v22;
                  unint64_t v25 = (uint64_t)(v19 - (void)v22) >> 2;
                  if (v25 <= v23 + 1) {
                    unint64_t v25 = v23 + 1;
                  }
                  if (v24 >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v26 = v25;
                  }
                  if (v26)
                  {
                    v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v16 - 8, v26);
                    v22 = *(uint64_t **)(v16 - 24);
                    uint64_t v20 = *(uint64_t **)(v16 - 16);
                  }
                  else
                  {
                    v27 = 0;
                  }
                  v28 = (uint64_t *)&v27[8 * v23];
                  uint64_t *v28 = v18;
                  uint64_t v21 = v28 + 1;
                  while (v20 != v22)
                  {
                    uint64_t v29 = *--v20;
                    *--v28 = v29;
                  }
                  *(void *)(v16 - 24) = v28;
                  *(void *)(v16 - 16) = v21;
                  *(void *)(v16 - 8) = &v27[8 * v26];
                  if (v22) {
                    operator delete(v22);
                  }
                }
                else
                {
                  *uint64_t v20 = v17;
                  uint64_t v21 = v20 + 1;
                }
                *(void *)(v16 - 16) = v21;
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v58 count:16];
            }
            while (v13);
          }

          ++v10;
        }
        while (v10 != v41);
        uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v9);
    }

    value = self->ajax_e5_model.__ptr_.__value_;
    if (value
    {
      (**v31)(v31, &v46, &v43);
    }
    else
    {
      if (!cgm::token_generation_inference::ajax::utils::tokenTreeIndexesAreLinear(&v43))
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Model does not support non-linear positions.");
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      (**(void (***)(AJAXE5MLModel *, std::vector<unsigned int> *))self->ajax_e5_model.__ptr_.__value_)(self->ajax_e5_model.__ptr_.__value_, &v46);
    }
    *(void *)&v59[0] = &v43;
    std::vector<std::vector<unsigned long>>::__destroy_vector::operator()[abi:ne180100]((void ***)v59);
  }
  else
  {
    (**(void (***)(AJAXE5MLModel *, std::vector<unsigned int> *))self->ajax_e5_model.__ptr_.__value_)(self->ajax_e5_model.__ptr_.__value_, &v46);
  }
  if (v46.__begin_)
  {
    v46.__end_ = v46.__begin_;
    operator delete(v46.__begin_);
  }
  (*(void (**)(_OWORD *__return_ptr))(*(void *)self->ajax_e5_model.__ptr_.__value_ + 40))(v59);
  v32 = [E5RunnerLastForwardLogits alloc];
  v42[0] = v59[0];
  v42[1] = v59[1];
  v42[2] = v59[2];
  v33 = [(E5RunnerLastForwardLogits *)v32 initWithLogits:v42];
  v38[2](v38, v33, 0);
}

- (void)reset
{
}

- (void)resetToStep:(int64_t)a3
{
}

- (void)clearAllState
{
}

- (void)purgeSteps:(id)a3
{
  id v4 = a3;
  value = self->ajax_e5_model.__ptr_.__value_;
  if (!value
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Model does not support non-linear positions.");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  id v7 = v6;
  (*(void (**)(void *, std::vector<unsigned int> *))(*(void *)v7 + 8))(v7, &__p);
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
}

- (void)purgeUnusedKeyValueCache:(id)a3 trgIdxs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  value = self->ajax_e5_model.__ptr_.__value_;
  (*(void (**)(AJAXE5MLModel *, std::vector<unsigned int> *, std::vector<unsigned int> *))(*(void *)value + 48))(value, &v10, &__p);
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  if (v10.__begin_)
  {
    v10.__end_ = v10.__begin_;
    operator delete(v10.__begin_);
  }
}

- (unint64_t)getNumTokensProcessed
{
  return (*(uint64_t (**)(void))(*(void *)self->ajax_e5_model.__ptr_.__value_ + 56))();
}

- (unint64_t)maxContextLength
{
  return (*(uint64_t (**)(void))(*(void *)self->ajax_e5_model.__ptr_.__value_ + 24))();
}

- (unint64_t)vocabularyCount
{
  return (*(uint64_t (**)(void))(*(void *)self->ajax_e5_model.__ptr_.__value_ + 32))();
}

- (id)createKVCacheEntry:(_NSRange)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  value = self->ajax_e5_model.__ptr_.__value_;
  if (value
  {
    (*(void (**)(void *__return_ptr))(*(void *)v7 + 16))(v14);
    a4 = [[TGIE5KVCacheEntryObjC alloc] initWithKVCacheEntry:v14];
    id v8 = (uint64_t *)v14[0];
    v14[0] = 0;
    if (v8) {
      std::default_delete<TGIE5KVCacheEntry>::operator()[abi:ne180100]((uint64_t)v14, v8);
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[E5RunnerObjC createKVCacheEntry:error:](log);
    }
    if (a4)
    {
      std::vector<unsigned int> v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v15 = *MEMORY[0x263F08320];
      v11 = [NSString stringWithFormat:@"Failed to create KV cache entry, model does not support modular attention"];
      v16[0] = v11;
      id v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      *a4 = [v10 errorWithDomain:@"com.apple.TokenGenerationInference.E5Runner" code:0 userInfo:v12];

      a4 = 0;
    }
  }

  return a4;
}

- (BOOL)setKVCacheEntry:(id)a3 startIndex:(int64_t)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  value = self->ajax_e5_model.__ptr_.__value_;
  if (value
  {
    (*(void (**)(void *, int64_t, uint64_t))(*(void *)v10 + 8))(v10, a4, [v8 kvCacheEntry]);
    LOBYTE(a5) = 1;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[E5RunnerObjC setKVCacheEntry:startIndex:error:](log);
    }
    if (a5)
    {
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08320];
      uint64_t v13 = [NSString stringWithFormat:@"Failed to set KV cache entry, model does not support modular attention"];
      v17[0] = v13;
      uint64_t v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a5 = [v12 errorWithDomain:@"com.apple.TokenGenerationInference.E5Runner" code:0 userInfo:v14];

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

+ (BOOL)compileModelAtPath:(id)a3 modelType:(int64_t)a4 error:(id *)a5
{
  id v5 = [a1 compiledModelAtPath:a3 modelType:a4 bundleCachePath:0 error:a5];
  BOOL v6 = v5 != 0;

  return v6;
}

+ (id)compiledModelAtPath:(id)a3 modelType:(int64_t)a4 bundleCachePath:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = [TGIMutableE5ModelConfigurationObjC alloc];
  id v12 = objc_opt_new();
  uint64_t v13 = objc_opt_new();
  uint64_t v14 = [(TGIE5ModelConfigurationObjC *)v11 initWithModelType:a4 modelBundlePath:v9 e5Functions:v12 adapterConfigurations:v13];

  [(TGIE5ModelConfigurationObjC *)v14 setUseModelCatalogE5CompilerCache:v10 == 0];
  uint64_t v15 = +[E5RunnerObjC compiledModelWithConfiguration:v14 bundleCachePath:v10 error:a6];

  return v15;
}

+ (BOOL)compileModelWithConfiguration:(id)a3 error:(id *)a4
{
  id v4 = [a1 compiledModelWithConfiguration:a3 bundleCachePath:0 error:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

+ (id)compiledModelWithConfiguration:(id)a3 bundleCachePath:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[E5RunnerObjC log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v6;
    _os_log_impl(&dword_25FA51000, v8, OS_LOG_TYPE_DEFAULT, "Compiling model with configuration: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v7)
  {
    id v9 = [v6 modelBundlePath];
    uint64_t v18 = (char *)[v9 UTF8String];
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&__p, &v18);
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v7 fileSystemRepresentation]);
    char v23 = 1;
    cgm::token_generation_inference::ajax::utils::makeProgramLibrary((std::string::size_type)&__p, (uint64_t)&buf, &v20);
    id v10 = v20;
    uint64_t v20 = 0;
    if (v23 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    id v11 = [v6 modelBundlePath];
    uint64_t v20 = (char *)[v11 UTF8String];
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v20);
    cgm::token_generation_inference::ajax::utils::makeProgramLibrary((cgm::token_generation_inference::ajax::utils *)&buf, (std::string *)[v6 useModelCatalogE5CompilerCache], &__p);
    id v10 = (char *)__p.__r_.__value_.__r.__words[0];
    __p.__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
  }
  id v12 = NSString;
  uint64_t E5BundlePathFromProgramLibrary = E5RT_Private::GetE5BundlePathFromProgramLibrary();
  if (*(char *)(E5BundlePathFromProgramLibrary + 23) >= 0) {
    uint64_t v14 = E5BundlePathFromProgramLibrary;
  }
  else {
    uint64_t v14 = *(void *)E5BundlePathFromProgramLibrary;
  }
  uint64_t v15 = [v12 stringWithUTF8String:v14];
  (*(void (**)(char *))(*(void *)v10 + 8))(v10);
  uint64_t v16 = v21[0];
  v21[0] = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }

  return v15;
}

+ (BOOL)doesModelRequireCompilationAtPath:(id)a3 modelType:(int64_t)a4
{
  id v5 = a3;
  id v6 = [TGIMutableE5ModelConfigurationObjC alloc];
  id v7 = objc_opt_new();
  id v8 = objc_opt_new();
  id v9 = [(TGIE5ModelConfigurationObjC *)v6 initWithModelType:a4 modelBundlePath:v5 e5Functions:v7 adapterConfigurations:v8];

  [(TGIE5ModelConfigurationObjC *)v9 setUseModelCatalogE5CompilerCache:1];
  LOBYTE(v7) = +[E5RunnerObjC doesModelRequireCompilationWithConfiguration:v9];

  return (char)v7;
}

+ (BOOL)doesModelRequireCompilationWithConfiguration:(id)a3
{
  return [a1 doesModelRequireCompilationWithConfiguration:a3 bundleCachePath:0];
}

+ (BOOL)doesModelRequireCompilationWithConfiguration:(id)a3 bundleCachePath:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 modelBundlePath];
  id v8 = +[E5RunnerObjC log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl(&dword_25FA51000, v8, OS_LOG_TYPE_DEFAULT, "Checking if model with configuration: %@ requires compilation", (uint8_t *)&buf, 0xCu);
  }

  id v9 = [v5 modelBundlePath];
  id v10 = [v9 pathExtension];
  int v11 = [v10 isEqualToString:@"bundle"];

  if (v11)
  {
    id v12 = +[E5RunnerObjC log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[E5RunnerObjC doesModelRequireCompilationWithConfiguration:bundleCachePath:]();
    }

    char v13 = 0;
    goto LABEL_18;
  }
  if (v6)
  {
    uint64_t v18 = (char *)[v7 UTF8String];
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v19, &v18);
    uint64_t v14 = v20;
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v6 fileSystemRepresentation]);
    char v22 = 1;
    char v13 = cgm::token_generation_inference::ajax::utils::modelRequiresCompilation((uint64_t)&v19, (uint64_t)v14, (uint64_t)&buf);
    if (v22 && SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    if ((SHIBYTE(v19.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_16;
    }
    uint64_t v15 = (void *)v19.__r_.__value_.__r.__words[0];
  }
  else
  {
    v19.__r_.__value_.__r.__words[0] = [v7 UTF8String];
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&buf, &v19.__r_.__value_.__l.__data_);
    char v13 = cgm::token_generation_inference::ajax::utils::modelRequiresCompilation((cgm::token_generation_inference::ajax::utils *)&buf, v20, (std::string *)[v5 useModelCatalogE5CompilerCache]);
    if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_16;
    }
    uint64_t v15 = (void *)buf.__r_.__value_.__r.__words[0];
  }
  operator delete(v15);
LABEL_16:
  uint64_t v16 = v20;
  uint64_t v20 = 0;
  if (v16) {
    (*(void (**)(const std::__fs::filesystem::path *))(v16->__pn_.__r_.__value_.__r.__words[0] + 8))(v16);
  }
LABEL_18:

  return v13;
}

- (void)moveToDynamicState
{
  aneSession = self->_aneSession;
  if (aneSession) {
    [(TGIE5ANESessionObjC *)aneSession stop];
  }
  id v4 = *(void (**)(void))(*(void *)self->ajax_e5_model.__ptr_.__value_ + 64);

  v4();
}

- (void)moveToFullyLoadedState
{
  aneSession = self->_aneSession;
  if (aneSession) {
    [(TGIE5ANESessionObjC *)aneSession resume];
  }
  id v4 = *(void (**)(void))(*(void *)self->ajax_e5_model.__ptr_.__value_ + 72);

  v4();
}

- (void)enableTelemetryWithIdentifier:(id)a3
{
  id v4 = a3;
  value = self->ajax_e5_model.__ptr_.__value_;
  id v6 = v4;
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)[v6 UTF8String]);
  std::string::operator=((std::string *)((char *)value + 8), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aneSession, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_log, 0);
  value = self->ajax_e5_model.__ptr_.__value_;
  self->ajax_e5_model.__ptr_.__value_ = 0;
  if (value)
  {
    id v4 = *(void (**)(void))(*(void *)value + 88);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void)initWithModelConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_25FA51000, v1, v2, "Failed to load model: %s.", v3, v4, v5, v6, v7);
}

- (void)runTokens:tokenTreeIndexes:outputBlock:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_3();
  v2(v5);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_25FA51000, v6, v7, "Failed to run inference: %s.", v8, v9, v10, v11, v12);
}

- (void)createKVCacheEntry:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25FA51000, log, OS_LOG_TYPE_ERROR, "Failed to create KV cache entry, model does not support modular attention", v1, 2u);
}

- (void)createKVCacheEntry:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  uint64_t v2 = *(void (**)(uint64_t))(v1 + 16);
  id v4 = v3;
  uint64_t v5 = OUTLINED_FUNCTION_3();
  v2(v5);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_25FA51000, v6, v7, "Failed to run inference: %s.", v8, v9, v10, v11, v12);
}

- (void)setKVCacheEntry:(os_log_t)log startIndex:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25FA51000, log, OS_LOG_TYPE_ERROR, "Failed to set KV cache entry, model does not support modular attention", v1, 2u);
}

+ (void)compiledModelWithConfiguration:bundleCachePath:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_25FA51000, v1, v2, "Failed to compile model: %s.", v3, v4, v5, v6, v7);
}

+ (void)doesModelRequireCompilationWithConfiguration:bundleCachePath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_25FA51000, v0, OS_LOG_TYPE_ERROR, "Model path has .bundle extension, assuming its already compiled: %@", v1, 0xCu);
}

+ (void)doesModelRequireCompilationWithConfiguration:(NSObject *)a3 bundleCachePath:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16))(a2);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_25FA51000, a3, OS_LOG_TYPE_ERROR, "Failed to check if model: %@ requires compilation: %s, defaulting to require compilation", (uint8_t *)&v6, 0x16u);
}

@end