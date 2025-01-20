@interface TILanguageModelLoader
- (BOOL)isInlineCompletionEnabled;
- (BOOL)isMultiLingualModeEnabled;
- (BOOL)isMultilingualModel;
- (BOOL)isSiriMode;
- (BOOL)monolingualLanguageModelBundleExists:(id)a3;
- (BOOL)multilingualLanguageModelBundleExists;
- (BOOL)usesLinguisticContext;
- (BOOL)validEnglishTransformerMultilingualConfig;
- (NSArray)customResourcePaths;
- (NSArray)mobileAssets;
- (NSArray)staticResourcePaths;
- (NSDictionary)trialParameters;
- (NSString)clientIdentifier;
- (NSString)dynamicResourcePath;
- (NSString)modelLocaleIdentifier;
- (NSString)recipientIdentifier;
- (TILanguageModelAdaptationContext)adaptationContext;
- (TILanguageModelLoader)initWithModelLocaleIdentifier:(id)a3 isMultilingualModel:(BOOL)a4 customResourcePaths:(id)a5 dynamicResourcePath:(id)a6 mobileAssets:(id)a7 usesLinguisticContext:(BOOL)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 validEnglishTransformerMultilingualConfig:(BOOL)a11 trialParameters:(id)a12 inlineCompletionPrecision:(int)a13 isInlineCompletionEnabled:(BOOL)a14;
- (_ICContactFetchingDelegate)contactFetchingDelegate;
- (id).cxx_construct;
- (int)inlineCompletionPrecision;
- (shared_ptr<KB::LanguageModel>)languageModelForAdaptationContext:(id)a3 languageLocales:(id)a4;
- (shared_ptr<KB::LanguageModel>)lightweightLanguageModelForLanguageLocales:(id)a3;
- (shared_ptr<KB::LanguageModel>)loadStubLanguageModelForLanguageLocales:(id)a3 withModelLocale:(id)a4 withAdaptationContext:(id)a5;
- (shared_ptr<KB::LanguageModel>)model;
- (shared_ptr<KB::LanguageModel>)newLanguageModelForLanguageLocales:(id)a3;
- (shared_ptr<KB::LanguageModel>)sharedLanguageModelForClient:(id)a3 withRecipient:(id)a4 forLanguageLocales:(id)a5;
- (shared_ptr<KB::LanguageModel>)sharedLanguageModelForClient:(id)a3 withRecipient:(id)a4 forLanguageLocales:(id)a5 completion:(id)a6;
- (shared_ptr<KB::LanguageModel>)stubLanguageModelForLanguageLocales:(id)a3 withModelLocale:(id)a4 withAdaptationContext:(id)a5;
- (void)clearDynamicLearningCaches;
- (void)findRecordsMatchingRecipient:(id)a3 completionHandler:(id)a4;
- (void)flushDynamicLearningCaches;
- (void)loadLanguageModel:(shared_ptr<KB::LanguageModel>)a3;
- (void)lookupRecordForRecipientIdentifier:(id)a3 completionHandler:(id)a4;
- (void)performLearningIfNecessaryForClient:(id)a3 withModel:(shared_ptr<KB::LanguageModel>)a4;
- (void)reloadLanguageModelWithLanguageLocales:(id)a3;
- (void)setAdaptationContext:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setContactFetchingDelegate:(id)a3;
- (void)setInlineCompletionPrecision:(int)a3;
- (void)setIsInlineCompletionEnabled:(BOOL)a3;
- (void)setLanguageModelClientIdentifier:(id)a3;
- (void)setLanguageModelRecipientIdentifier:(id)a3 completion:(id)a4;
- (void)setModel:(shared_ptr<KB::LanguageModel>)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setTrialParameters:(id)a3;
- (void)unwireLanguageModelMemory;
- (void)wireLanguageModelMemory;
@end

@implementation TILanguageModelLoader

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_model.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_trialParameters, 0);
  objc_storeStrong((id *)&self->_adaptationContext, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_mobileAssets, 0);
  objc_storeStrong((id *)&self->_dynamicResourcePath, 0);
  objc_storeStrong((id *)&self->_modelLocaleIdentifier, 0);

  objc_storeStrong((id *)&self->_customResourcePaths, 0);
}

- (void)setIsInlineCompletionEnabled:(BOOL)a3
{
  self->_isInlineCompletionEnabled = a3;
}

- (BOOL)isInlineCompletionEnabled
{
  return self->_isInlineCompletionEnabled;
}

- (void)setInlineCompletionPrecision:(int)a3
{
  self->_inlineCompletionPrecision = a3;
}

- (int)inlineCompletionPrecision
{
  return self->_inlineCompletionPrecision;
}

- (void)setTrialParameters:(id)a3
{
}

- (NSDictionary)trialParameters
{
  return self->_trialParameters;
}

- (void)setAdaptationContext:(id)a3
{
}

- (TILanguageModelAdaptationContext)adaptationContext
{
  return self->_adaptationContext;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (BOOL)usesLinguisticContext
{
  return self->_usesLinguisticContext;
}

- (NSArray)mobileAssets
{
  return self->_mobileAssets;
}

- (NSString)dynamicResourcePath
{
  return self->_dynamicResourcePath;
}

- (NSArray)customResourcePaths
{
  return self->_customResourcePaths;
}

- (BOOL)validEnglishTransformerMultilingualConfig
{
  return self->_validEnglishTransformerMultilingualConfig;
}

- (BOOL)isMultiLingualModeEnabled
{
  return self->_multiLingualModeEnabled;
}

- (BOOL)isSiriMode
{
  return self->_isSiriMode;
}

- (BOOL)isMultilingualModel
{
  return self->_isMultilingualModel;
}

- (NSString)modelLocaleIdentifier
{
  return self->_modelLocaleIdentifier;
}

- (void)setModel:(shared_ptr<KB::LanguageModel>)a3
{
  v4 = *(LanguageModel **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_model.__cntrl_;
  self->_model.__ptr_ = v4;
  self->_model.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<KB::LanguageModel>)model
{
  cntrl = self->_model.__cntrl_;
  *v2 = self->_model.__ptr_;
  v2[1] = (LanguageModel *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LanguageModel *)self;
  return result;
}

- (void)setContactFetchingDelegate:(id)a3
{
  self->_contactFetchingDelegate = (_ICContactFetchingDelegate *)a3;
}

- (_ICContactFetchingDelegate)contactFetchingDelegate
{
  return self->_contactFetchingDelegate;
}

- (shared_ptr<KB::LanguageModel>)languageModelForAdaptationContext:(id)a3 languageLocales:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA20];
  id v7 = a4;
  id v8 = a3;
  id v21 = (id)[[v6 alloc] initWithLocaleIdentifier:self->_modelLocaleIdentifier];
  BOOL v20 = [(TILanguageModelLoader *)self isMultilingualModel];
  v9 = [(TILanguageModelLoader *)self customResourcePaths];
  v10 = [(TILanguageModelLoader *)self dynamicResourcePath];
  BOOL v11 = [(TILanguageModelLoader *)self isMultiLingualModeEnabled];
  BOOL v12 = [(TILanguageModelLoader *)self isSiriMode];
  BOOL v13 = [(TILanguageModelLoader *)self validEnglishTransformerMultilingualConfig];
  v14 = [(TILanguageModelLoader *)self trialParameters];
  int v15 = [(TILanguageModelLoader *)self inlineCompletionPrecision];
  BYTE4(v19) = [(TILanguageModelLoader *)self isInlineCompletionEnabled];
  LODWORD(v19) = v15;
  BYTE2(v18) = v13;
  BYTE1(v18) = v12;
  LOBYTE(v18) = v11;
  +[TILanguageModelLoaderManager modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:", v21, v20, v7, v8, v9, v10, v18, v14, v19);

  result.__cntrl_ = v17;
  result.__ptr_ = v16;
  return result;
}

- (shared_ptr<KB::LanguageModel>)lightweightLanguageModelForLanguageLocales:(id)a3
{
  uint64_t v5 = v3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:self->_modelLocaleIdentifier];
  id v8 = [(TILanguageModelLoader *)self customResourcePaths];
  KB::LanguageModelConfig::LanguageModelConfig((uint64_t)&v14, v7, 0, v6, v8, 0, 0, 0, 0, 1, [(TILanguageModelLoader *)self isSiriMode], 1, 1, 90, [(TILanguageModelLoader *)self isInlineCompletionEnabled]);

  LODWORD(self) = [(TILanguageModelLoader *)self monolingualLanguageModelBundleExists:v6];
  BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (self)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[TILanguageModelLoader lightweightLanguageModelForLanguageLocales:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Loading lightweight language model for language %@", buf, 0x16u);
    }
    v10 = (char *)operator new(0x178uLL);
    *((void *)v10 + 1) = 0;
    *((void *)v10 + 2) = 0;
    *(void *)v10 = &unk_1F3F75330;
    KB::LanguageModelStr::LanguageModelStr((const __CFLocale **)v10 + 3, (const __CFString **)&v14);
    *(void *)buf = v10 + 24;
    *(void *)&buf[8] = v10;
    std::shared_ptr<KB::LanguageModelStr>::__enable_weak_this[abi:nn180100]<KB::LanguageModelStr,KB::LanguageModelStr,void>((uint64_t)buf, (void *)v10 + 22, (uint64_t)(v10 + 24));
    *(_OWORD *)uint64_t v5 = *(_OWORD *)buf;
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[TILanguageModelLoader lightweightLanguageModelForLanguageLocales:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Loading lightweight language model stub for language %@", buf, 0x16u);
    }
    BOOL v11 = operator new(0x138uLL);
    v11[1] = 0;
    v11[2] = 0;
    *BOOL v11 = &unk_1F3F75368;
    *(void *)uint64_t v5 = std::construct_at[abi:nn180100]<KB::LanguageModelImplStub,KB::LanguageModelConfig,KB::LanguageModelImplStub*>((KB::LanguageModelImplBase *)(v11 + 3), (uint64_t)&v14);
    *(void *)(v5 + 8) = v11;
  }
  if (cf) {
    CFRelease(cf);
  }
  CFTypeRef cf = 0;
  if (v19) {
    CFRelease(v19);
  }
  CFTypeRef v19 = 0;
  if (v18) {
    CFRelease(v18);
  }
  CFTypeRef v18 = 0;
  if (v17) {
    CFRelease(v17);
  }
  CFTypeRef v17 = 0;
  if (v16) {
    CFRelease(v16);
  }
  CFTypeRef v16 = 0;
  if (v15) {
    CFRelease(v15);
  }
  CFTypeRef v15 = 0;
  if (v14) {
    CFRelease(v14);
  }

  result.__cntrl_ = v13;
  result.__ptr_ = v12;
  return result;
}

- (shared_ptr<KB::LanguageModel>)stubLanguageModelForLanguageLocales:(id)a3 withModelLocale:(id)a4 withAdaptationContext:(id)a5
{
  BOOL v9 = v5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = (TILanguageModelAdaptationContext *)a5;
  if (v12)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v12 = [[TILanguageModelAdaptationContext alloc] initWithClientIdentifier:&stru_1F3F7A998 andRecipientRecord:0];
    if (v11) {
      goto LABEL_3;
    }
  }
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:self->_modelLocaleIdentifier];
LABEL_3:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[TILanguageModelLoader stubLanguageModelForLanguageLocales:withModelLocale:withAdaptationContext:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Loading language model stub for languages: %@", buf, 0x16u);
  }
  BOOL v13 = [(TILanguageModelLoader *)self customResourcePaths];
  CFTypeRef v14 = [(TILanguageModelLoader *)self dynamicResourcePath];
  BOOL v15 = [(TILanguageModelLoader *)self isMultiLingualModeEnabled];
  BOOL v16 = [(TILanguageModelLoader *)self isSiriMode];
  BYTE2(v20) = [(TILanguageModelLoader *)self isInlineCompletionEnabled];
  BYTE1(v20) = v16;
  LOBYTE(v20) = v15;
  +[TILanguageModelLoaderManager stubForModelLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "stubForModelLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:isInlineCompletionEnabled:", v11, 0, v10, v12, v13, v14, v20);
  long long v17 = *(_OWORD *)buf;
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  _OWORD *v9 = v17;

  result.__cntrl_ = v19;
  result.__ptr_ = v18;
  return result;
}

- (shared_ptr<KB::LanguageModel>)loadStubLanguageModelForLanguageLocales:(id)a3 withModelLocale:(id)a4 withAdaptationContext:(id)a5
{
  id v7 = v5;
  [(TILanguageModelLoader *)self stubLanguageModelForLanguageLocales:a3 withModelLocale:a4 withAdaptationContext:a5];
  id v8 = (std::__shared_weak_count *)v7[1];
  uint64_t v11 = *v7;
  BOOL v12 = (LanguageModel *)v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(TILanguageModelLoader *)self loadLanguageModel:&v11];
  id v10 = v12;
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)v12);
  }
  result.__cntrl_ = v9;
  result.__ptr_ = v10;
  return result;
}

- (void)reloadLanguageModelWithLanguageLocales:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TILanguageModelLoader *)self model];
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v25);
  }
  if (__p)
  {
    [(TILanguageModelLoader *)self model];
    int v5 = (*(uint64_t (**)(void *))(*(void *)__p + 16))(__p);
    if (v25) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v25);
    }
    if (v5)
    {
      [(TILanguageModelLoader *)self model];
      (*(void (**)(void **__return_ptr))(*(void *)v22 + 56))(&__p);
      if (v23) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v23);
      }
      int64_t v6 = (char *)v25 - (unsigned char *)__p;
      if ([v4 count] == v6 >> 3)
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        id v8 = (std::__shared_weak_count *)__p;
        BOOL v9 = v25;
        while (v8 != v9)
        {
          id v10 = v8->__vftable;
          id v8 = (std::__shared_weak_count *)((char *)v8 + 8);
          [v7 addObject:v10];
        }
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v11 = v4;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              BOOL v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "localeIdentifier", (void)v18);
              int v17 = [v7 containsObject:v16];

              if (!v17)
              {

                goto LABEL_23;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      else
      {
LABEL_23:
        [(TILanguageModelLoader *)self model];
        (*(void (**)(uint64_t, id))(*(void *)v22 + 80))(v22, v4);
        if (v23) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v23);
        }
      }
      if (__p)
      {
        v25 = (std::__shared_weak_count *)__p;
        operator delete(__p);
      }
    }
  }
}

- (void)loadLanguageModel:(shared_ptr<KB::LanguageModel>)a3
{
  if (__asynchronousLoad)
  {
    uint64_t v3 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
    v5[0] = *(void *)a3.__ptr_;
    v5[1] = v3;
    if (v3)
    {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
      KB::LanguageModel::background_load((uint64_t)v5, &__block_literal_global_82);
      std::__shared_weak_count::__release_shared[abi:nn180100](v3);
    }
    else
    {
      KB::LanguageModel::background_load((uint64_t)v5, &__block_literal_global_82);
    }
  }
  else
  {
    id v4 = *(void (**)(void))(**(void **)a3.__ptr_ + 96);
    v4();
  }
}

- (shared_ptr<KB::LanguageModel>)sharedLanguageModelForClient:(id)a3 withRecipient:(id)a4 forLanguageLocales:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = &stru_1F3F7A998;
  if (a3) {
    uint64_t v13 = (__CFString *)a3;
  }
  uint64_t v14 = v13;
  [(TILanguageModelLoader *)self model];
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v22);
  }
  if (v21)
  {
    [(TILanguageModelLoader *)self model];
    int v15 = _os_feature_enabled_impl();
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v22);
    }
    if (v15) {
      [(TILanguageModelLoader *)self reloadLanguageModelWithLanguageLocales:v11];
    }
  }
  else
  {
    [(TILanguageModelLoader *)self newLanguageModelForLanguageLocales:v11];
    [(TILanguageModelLoader *)self setModel:&v19];
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v20);
    }
  }
  [(TILanguageModelLoader *)self setLanguageModelClientIdentifier:v14];
  [(TILanguageModelLoader *)self setLanguageModelRecipientIdentifier:v10 completion:v12];
  [(TILanguageModelLoader *)self model];
  uint64_t v16 = v21;
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v22);
  }
  if (v16)
  {
    [(TILanguageModelLoader *)self model];
    (*(void (**)(uint64_t, void))(*(void *)v21 + 288))(v21, 0);
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v22);
    }
  }
  [(TILanguageModelLoader *)self model];

  result.__cntrl_ = v18;
  result.__ptr_ = v17;
  return result;
}

- (shared_ptr<KB::LanguageModel>)sharedLanguageModelForClient:(id)a3 withRecipient:(id)a4 forLanguageLocales:(id)a5
{
  int v5 = (LanguageModel *)[(TILanguageModelLoader *)self sharedLanguageModelForClient:a3 withRecipient:a4 forLanguageLocales:a5 completion:&__block_literal_global_80];
  result.__cntrl_ = v6;
  result.__ptr_ = v5;
  return result;
}

- (void)setLanguageModelRecipientIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[TILanguageModelLoader setLanguageModelRecipientIdentifier:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Language model recipient = %@", buf, 0x16u);
  }
  [(TILanguageModelLoader *)self setRecipientIdentifier:v6];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__7291;
  uint64_t v22 = __Block_byref_object_dispose__7292;
  id v8 = self;
  v23 = v8;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __72__TILanguageModelLoader_setLanguageModelRecipientIdentifier_completion___block_invoke;
  int v15 = &unk_1E6E2B0D0;
  id v18 = v7;
  uint64_t v19 = buf;
  id v16 = v6;
  int v17 = v8;
  id v9 = v7;
  id v10 = v6;
  id v11 = _Block_copy(&v12);
  -[TILanguageModelLoader lookupRecordForRecipientIdentifier:completionHandler:](v8, "lookupRecordForRecipientIdentifier:completionHandler:", v10, v11, v12, v13, v14, v15);

  _Block_object_dispose(buf, 8);
}

void __72__TILanguageModelLoader_setLanguageModelRecipientIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = NSString;
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) recipientIdentifier];
  LODWORD(v7) = [v7 _string:v5 matchesString:v8];

  if (v7)
  {
    id v9 = [TILanguageModelAdaptationContext alloc];
    id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) clientIdentifier];
    id v11 = [(TILanguageModelAdaptationContext *)v9 initWithClientIdentifier:v10 andRecipientRecord:v6];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v19 = 136315906;
      *(void *)&v19[4] = "-[TILanguageModelLoader setLanguageModelRecipientIdentifier:completion:]_block_invoke";
      *(_WORD *)&v19[12] = 2112;
      *(void *)&v19[14] = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v18;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Language model adaptation context = %@, recipient = %@ (%@)", v19, 0x2Au);
    }
    uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v12)
    {
      [v12 model];
      uint64_t v13 = *(void *)v19;
    }
    else
    {
      uint64_t v13 = 0;
      *(void *)uint64_t v19 = 0;
      *(void *)&v19[8] = 0;
    }
    (*(void (**)(uint64_t, NSDictionary *))(*(void *)v13 + 280))(v13, [(TILanguageModelAdaptationContext *)v11 recipientContext]);
    if (*(void *)&v19[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&v19[8]);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAdaptationContext:v11];
  }
  uint64_t v14 = *(void *)(a1 + 48);
  int v15 = [*(id *)(a1 + 40) adaptationContext];
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  int v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;
}

- (void)lookupRecordForRecipientIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  if ([v6 length])
  {
    id v8 = +[TILanguageModelLoaderManager recipientRecords];
    id v9 = [v8 objectForKey:v6];

    if (v9)
    {
      if ([v9 count]) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      ((void (**)(id, id, void *))v7)[2](v7, v6, v10);
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __78__TILanguageModelLoader_lookupRecordForRecipientIdentifier_completionHandler___block_invoke;
      v11[3] = &unk_1E6E2B7A8;
      id v12 = v6;
      uint64_t v13 = v7;
      [(TILanguageModelLoader *)self findRecordsMatchingRecipient:v12 completionHandler:v11];
    }
  }
  else
  {
    v7[2](v7, v6, 0);
  }
}

void __78__TILanguageModelLoader_lookupRecordForRecipientIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v4 = v3;
  TIDispatchAsync();
}

void __78__TILanguageModelLoader_lookupRecordForRecipientIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  if ([v7 count]) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v3, v4);
  id v5 = +[TILanguageModelLoaderManager recipientRecords];
  if (v7) {
    id v6 = v7;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CC08];
  }
  [v5 setObject:v6 forKey:*(void *)(a1 + 40)];
}

- (void)findRecordsMatchingRecipient:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(TILanguageModelLoader *)self contactFetchingDelegate];

  if (v8)
  {
    id v9 = [(TILanguageModelLoader *)self contactFetchingDelegate];
    id v10 = [v9 recordsMatchingRecipient:v6];

    v7[2](v7, v10);
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __72__TILanguageModelLoader_findRecordsMatchingRecipient_completionHandler___block_invoke;
    v12[3] = &unk_1E6E2B0A8;
    uint64_t v13 = v7;
    TIAddressBookFindRecordsMatchingRecipientsAsync(v11, v12);
  }
}

uint64_t __72__TILanguageModelLoader_findRecordsMatchingRecipient_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setLanguageModelClientIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = NSString;
  id v6 = [(TILanguageModelLoader *)self clientIdentifier];
  LOBYTE(v5) = [v5 _string:v4 matchesString:v6];

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[TILanguageModelLoader setLanguageModelClientIdentifier:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Language model client = %@", buf, 0x16u);
    }
    [(TILanguageModelLoader *)self setClientIdentifier:v4];
    [(TILanguageModelLoader *)self model];
    (*(void (**)(void))(**(void **)buf + 272))();
    if (*(void *)&buf[8]) {
      std::__shared_weak_count::__release_shared[abi:nn180100](*(std::__shared_weak_count **)&buf[8]);
    }
    if (__offlineTrainingEnabled)
    {
      id v7 = +[TILanguageModelLoaderManager knownClients];
      id v8 = [v7 objectForKey:v4];

      if (!v8)
      {
        id v9 = +[TILanguageModelLoaderManager knownClients];
        [v9 setObject:v4 forKey:v4];

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v16 = __Block_byref_object_copy__7291;
        int v17 = __Block_byref_object_dispose__7292;
        uint64_t v18 = self;
        cntrl = (std::__shared_weak_count *)v18->_model.__cntrl_;
        v14[0] = v18->_model.__ptr_;
        v14[1] = cntrl;
        if (cntrl) {
          atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __58__TILanguageModelLoader_setLanguageModelClientIdentifier___block_invoke;
        v11[3] = &unk_1E6E2E130;
        uint64_t v13 = buf;
        id v12 = v4;
        KB::LanguageModel::background_load((uint64_t)v14, v11);
        if (cntrl) {
          std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
        }

        _Block_object_dispose(buf, 8);
      }
    }
  }
}

void __58__TILanguageModelLoader_setLanguageModelClientIdentifier___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  TIDispatchAsync();
}

void __58__TILanguageModelLoader_setLanguageModelClientIdentifier___block_invoke_2(uint64_t a1)
{
  long long v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    [v2 model];
    long long v2 = v10;
  }
  else
  {
    id v10 = 0;
    id v11 = 0;
  }
  int v3 = (*(uint64_t (**)(void *))(*(void *)v2 + 16))(v2);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  }
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      [v5 model];
    }
    else
    {
      uint64_t v8 = 0;
      id v9 = 0;
    }
    [v5 performLearningIfNecessaryForClient:v4 withModel:&v8];
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v9);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (shared_ptr<KB::LanguageModel>)newLanguageModelForLanguageLocales:(id)a3
{
  id v5 = v3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [[TILanguageModelAdaptationContext alloc] initWithClientIdentifier:&stru_1F3F7A998 andRecipientRecord:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:self->_modelLocaleIdentifier];
  *id v5 = 0;
  v5[1] = 0;
  if ([(TILanguageModelLoader *)self multilingualLanguageModelBundleExists]
    && _os_feature_enabled_impl())
  {
    v31 = v8;
    v33 = v7;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      modelLocaleIdentifier = self->_modelLocaleIdentifier;
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[TILanguageModelLoader newLanguageModelForLanguageLocales:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = modelLocaleIdentifier;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Loading multilingual language model (%@) for languages: %@", buf, 0x20u);
    }
    id v10 = [(TILanguageModelLoader *)self customResourcePaths];
    id v11 = [(TILanguageModelLoader *)self dynamicResourcePath];
    BOOL v12 = [(TILanguageModelLoader *)self isMultiLingualModeEnabled];
    BOOL v13 = [(TILanguageModelLoader *)self isSiriMode];
    BOOL v14 = [(TILanguageModelLoader *)self validEnglishTransformerMultilingualConfig];
    int v15 = [(TILanguageModelLoader *)self trialParameters];
    int v16 = [(TILanguageModelLoader *)self inlineCompletionPrecision];
    BYTE4(v30) = [(TILanguageModelLoader *)self isInlineCompletionEnabled];
    LODWORD(v30) = v16;
    BYTE2(v29) = v14;
    BYTE1(v29) = v13;
    LOBYTE(v29) = v12;
    uint64_t v8 = v31;
    id v7 = v33;
    +[TILanguageModelLoaderManager modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:", v31, 1, v6, v33, v10, v11, v29, v15, v30);
    uint64_t v17 = *(void *)buf;
    uint64_t v18 = *(std::__shared_weak_count **)&buf[8];
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    *id v5 = v17;
    v5[1] = v18;
  }
  else if ([(TILanguageModelLoader *)self monolingualLanguageModelBundleExists:v6])
  {
    v32 = v8;
    v34 = v7;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = self->_modelLocaleIdentifier;
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[TILanguageModelLoader newLanguageModelForLanguageLocales:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      __int16 v38 = 2112;
      id v39 = v6;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Loading monolingual language model (%@) for languages: %@", buf, 0x20u);
    }
    __int16 v20 = [(TILanguageModelLoader *)self customResourcePaths];
    uint64_t v21 = [(TILanguageModelLoader *)self dynamicResourcePath];
    BOOL v22 = [(TILanguageModelLoader *)self isMultiLingualModeEnabled];
    BOOL v23 = [(TILanguageModelLoader *)self isSiriMode];
    BOOL v24 = [(TILanguageModelLoader *)self validEnglishTransformerMultilingualConfig];
    v25 = [(TILanguageModelLoader *)self trialParameters];
    int v26 = [(TILanguageModelLoader *)self inlineCompletionPrecision];
    BYTE4(v30) = [(TILanguageModelLoader *)self isInlineCompletionEnabled];
    LODWORD(v30) = v26;
    BYTE2(v29) = v24;
    BYTE1(v29) = v23;
    LOBYTE(v29) = v22;
    uint64_t v8 = v32;
    id v7 = v34;
    +[TILanguageModelLoaderManager modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "modelForLocale:isMultilingualModel:languageLocales:adaptationContext:staticResourcePaths:dynamicResourcePath:isMultiLingualModeEnabled:isSiriMode:validEnglishTransformerMultilingualConfig:trialParameters:inlineCompletionPrecision:isInlineCompletionEnabled:", v32, 0, v6, v34, v20, v21, v29, v25, v30);
    uint64_t v17 = *(void *)buf;
    uint64_t v18 = *(std::__shared_weak_count **)&buf[8];
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    *id v5 = v17;
    v5[1] = v18;
  }
  else
  {
    [(TILanguageModelLoader *)self stubLanguageModelForLanguageLocales:v6 withModelLocale:v8 withAdaptationContext:v7];
    uint64_t v17 = *(void *)buf;
    uint64_t v18 = *(std::__shared_weak_count **)&buf[8];
    *id v5 = *(void *)buf;
    v5[1] = v18;
  }
  uint64_t v35 = v17;
  v36 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(TILanguageModelLoader *)self loadLanguageModel:&v35];
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v36);
  }

  result.__cntrl_ = v28;
  result.__ptr_ = v27;
  return result;
}

- (BOOL)multilingualLanguageModelBundleExists
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(TILanguageModelLoader *)self usesLinguisticContext] || !self->_isMultilingualModel) {
    return 0;
  }
  int v3 = self->_modelLocaleIdentifier;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    uint64_t v4 = [(TILanguageModelLoader *)self staticResourcePaths];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = TIResourcePathForInputMode();

          if (v9)
          {
            BOOL v10 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 0;
LABEL_15:
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)monolingualLanguageModelBundleExists:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 count] != 1 || self->_isMultilingualModel) {
    return 0;
  }
  uint64_t v6 = self->_modelLocaleIdentifier;
  if ([(__CFString *)v6 hasPrefix:@"ars"])
  {

    uint64_t v6 = @"ar";
  }
  if ([(TILanguageModelLoader *)self usesLinguisticContext])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [(TILanguageModelLoader *)self staticResourcePaths];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [(TILanguageModelLoader *)self isSiriMode];
          long long v12 = TIResourcePathForInputMode();

          if (v12)
          {
            BOOL v4 = 1;
            goto LABEL_19;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v4 = 0;
LABEL_19:
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)performLearningIfNecessaryForClient:(id)a3 withModel:(shared_ptr<KB::LanguageModel>)a4
{
  id v5 = a3;
  uint64_t v6 = [(TILanguageModelLoader *)self dynamicResourcePath];

  if (v6)
  {
    uint64_t v7 = +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel];
    [v7 lastOfflineAdaptationTimeForApp:v5];
    double v9 = v8;

    if (v9 == 0.0)
    {
      dispatch_time_t v10 = dispatch_time(0, 20000000000);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __71__TILanguageModelLoader_performLearningIfNecessaryForClient_withModel___block_invoke;
      v11[3] = &unk_1E6E2B8A8;
      id v12 = v5;
      double v13 = v9;
      dispatch_after(v10, MEMORY[0x1E4F14428], v11);
    }
  }
}

void __71__TILanguageModelLoader_performLearningIfNecessaryForClient_withModel___block_invoke(uint64_t a1)
{
  int v3 = [[TILanguageModelOfflineLearningStrategyMecabraFavonius alloc] initWithClientIdentifier:*(void *)(a1 + 32)];
  long long v2 = +[TILanguageModelOfflineLearningAgent sharedLearningAgent];
  [v2 performLearningIfNecessaryWithStrategy:v3 lastAdaptationTime:*(double *)(a1 + 40)];
}

- (void)flushDynamicLearningCaches
{
  ptr = self->_model.__ptr_;
  if (ptr) {
    (*(void (**)(LanguageModel *, void))(*(void *)ptr + 592))(ptr, 0);
  }
}

- (void)clearDynamicLearningCaches
{
  ptr = self->_model.__ptr_;
  if (ptr) {
    (*(void (**)(void))(*(void *)ptr + 120))();
  }
}

- (NSArray)staticResourcePaths
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  customResourcePaths = self->_customResourcePaths;
  if (customResourcePaths)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[TILanguageModelLoader staticResourcePaths]";
      __int16 v37 = 2112;
      __int16 v38 = customResourcePaths;
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Using custom static resource paths for LM loader: %@", buf, 0x16u);
      customResourcePaths = self->_customResourcePaths;
    }
    BOOL v4 = customResourcePaths;
  }
  else
  {
    id v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = +[TIInputMode inputModeWithIdentifier:self->_modelLocaleIdentifier isSiriMode:[(TILanguageModelLoader *)self isSiriMode]];
    uint64_t v7 = UIKeyboardSystemLanguageModelPathsForInputMode(v6);

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          long long v14 = [v13 URLByDeletingLastPathComponent];
          long long v15 = [v14 path];

          if (v15) {
            [(NSArray *)v5 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v10);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v16 = self->_mobileAssets;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
          BOOL v22 = [v21 URLByDeletingLastPathComponent];
          BOOL v23 = [v22 path];

          if (v23) {
            [(NSArray *)v5 addObject:v23];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[TILanguageModelLoader staticResourcePaths]";
      __int16 v37 = 2112;
      __int16 v38 = v5;
      _os_log_debug_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  Static resource paths for LM loader: %@", buf, 0x16u);
    }
    BOOL v4 = [(NSArray *)v5 allObjects];
  }

  return v4;
}

- (TILanguageModelLoader)initWithModelLocaleIdentifier:(id)a3 isMultilingualModel:(BOOL)a4 customResourcePaths:(id)a5 dynamicResourcePath:(id)a6 mobileAssets:(id)a7 usesLinguisticContext:(BOOL)a8 isMultiLingualModeEnabled:(BOOL)a9 isSiriMode:(BOOL)a10 validEnglishTransformerMultilingualConfig:(BOOL)a11 trialParameters:(id)a12 inlineCompletionPrecision:(int)a13 isInlineCompletionEnabled:(BOOL)a14
{
  id v20 = a3;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v30 = a12;
  v31.receiver = self;
  v31.super_class = (Class)TILanguageModelLoader;
  BOOL v24 = [(TILanguageModelLoader *)&v31 init];
  long long v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_modelLocaleIdentifier, a3);
    v25->_isMultilingualModel = a4;
    v25->_multiLingualModeEnabled = a9;
    v25->_isSiriMode = a10;
    v25->_validEnglishTransformerMultilingualConfig = a11;
    uint64_t v26 = [v22 copy];
    dynamicResourcePath = v25->_dynamicResourcePath;
    v25->_dynamicResourcePath = (NSString *)v26;

    objc_storeStrong((id *)&v25->_mobileAssets, a7);
    v25->_usesLinguisticContext = a8;
    objc_storeStrong((id *)&v25->_customResourcePaths, a5);
    objc_storeStrong((id *)&v25->_trialParameters, a12);
    v25->_inlineCompletionPrecision = a13;
    v25->_isInlineCompletionEnabled = a14;
  }

  return v25;
}

- (void)unwireLanguageModelMemory
{
  [(TILanguageModelLoader *)self model];
  if (v6)
  {
    [(TILanguageModelLoader *)self model];
    int v3 = (*(uint64_t (**)())(*(void *)v4 + 16))();
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v5);
    }
  }
  else
  {
    int v3 = 0;
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
  if (v3)
  {
    [(TILanguageModelLoader *)self model];
    (*(void (**)())(*(void *)v6 + 216))();
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v7);
    }
  }
}

- (void)wireLanguageModelMemory
{
  [(TILanguageModelLoader *)self model];
  if (v6)
  {
    [(TILanguageModelLoader *)self model];
    int v3 = (*(uint64_t (**)())(*(void *)v4 + 16))();
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v5);
    }
  }
  else
  {
    int v3 = 0;
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v7);
  }
  if (v3)
  {
    [(TILanguageModelLoader *)self model];
    (*(void (**)())(*(void *)v6 + 208))();
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v7);
    }
  }
}

@end