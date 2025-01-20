@interface TITrialManager
+ (TITrialManager)sharedInstance;
- (BOOL)didStart;
- (DDSTrialAsset)trialAsset;
- (DDSTrialProvider)ddsTrialProvider;
- (TITrialManager)initWithDDSTrialProvider:(id)a3;
- (id)encodedCATrialParametersForLocale:(id)a3;
- (id)encodedLMTrialParametersForLocale:(id)a3;
- (id)favoniusLanguagePowerOverrideForLocale:(id)a3;
- (id)featuresInTrialForLocale:(id)a3;
- (id)inlineCompletionOperatingPointOverrideForLocale:(id)a3;
- (id)inputTranscoderAssetsDirectoryURLForLocale:(id)a3;
- (id)isNegativeLearningEnabledForLocale:(id)a3;
- (id)updateCallback;
- (id)urlForContentItemType:(id)a3 asset:(id)a4 locale:(id)a5;
- (void)dealloc;
- (void)handleReceivedTrialAsset:(id)a3;
- (void)setDidStart:(BOOL)a3;
- (void)setTrialAsset:(id)a3;
- (void)setUpdateCallback:(id)a3;
- (void)start;
- (void)trialDidReceiveAsset:(id)a3 forQuery:(id)a4;
- (void)trialDidStopForQuery:(id)a3;
@end

@implementation TITrialManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialAsset, 0);
  objc_storeStrong((id *)&self->_ddsTrialProvider, 0);

  objc_storeStrong(&self->_updateCallback, 0);
}

- (void)setDidStart:(BOOL)a3
{
  self->_didStart = a3;
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (void)setTrialAsset:(id)a3
{
}

- (DDSTrialAsset)trialAsset
{
  return (DDSTrialAsset *)objc_getProperty(self, a2, 32, 1);
}

- (DDSTrialProvider)ddsTrialProvider
{
  return (DDSTrialProvider *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUpdateCallback:(id)a3
{
}

- (id)updateCallback
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)trialDidStopForQuery:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F5EF68];
  id v5 = a3;
  v6 = [v4 defaultQuery];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      v9 = "-[TITrialManager trialDidStopForQuery:]";
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  DDS: Trial stopped", (uint8_t *)&v8, 0xCu);
    }
    [(TITrialManager *)self handleReceivedTrialAsset:0];
  }
}

- (void)trialDidReceiveAsset:(id)a3 forQuery:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void *)MEMORY[0x1E4F5EF68];
  id v8 = a4;
  v9 = [v7 defaultQuery];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v11 = 136315394;
      v12 = "-[TITrialManager trialDidReceiveAsset:forQuery:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  DDS: Received trial asset: %@", (uint8_t *)&v11, 0x16u);
    }
    [(TITrialManager *)self handleReceivedTrialAsset:v6];
  }
}

- (void)dealloc
{
  [(DDSTrialProvider *)self->_ddsTrialProvider unregisterDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)TITrialManager;
  [(TITrialManager *)&v3 dealloc];
}

- (void)handleReceivedTrialAsset:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(TITrialManager *)self trialAsset];

  if (v5 != (id)v4)
  {
    uint64_t v6 = [(TITrialManager *)self trialAsset];
    if (v4 | v6)
    {
    }
    else
    {
      int v7 = [(TITrialManager *)self trialAsset];
      char v8 = [v7 isEqual:0];

      if (v8) {
        goto LABEL_9;
      }
    }
    [(TITrialManager *)self setTrialAsset:v4];
    v9 = [(TITrialManager *)self updateCallback];
    int v10 = v9;
    if (v9)
    {
      id v11 = v9;
      TIDispatchAsync();
    }
  }
LABEL_9:
}

uint64_t __43__TITrialManager_handleReceivedTrialAsset___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    unint64_t v4 = "-[TITrialManager handleReceivedTrialAsset:]_block_invoke";
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  DDS: Calling trial update callback", (uint8_t *)&v3, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)urlForContentItemType:(id)a3 asset:(id)a4 locale:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(MEMORY[0x1E4F5EF58]);
  v12 = [v10 localeIdentifier];
  __int16 v13 = (void *)[v11 initWithLanguageIdentifier:v12];

  id v14 = [(TITrialManager *)self ddsTrialProvider];
  v32[0] = v9;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v16 = [v13 filter];
  v17 = [v14 contentItemsFromAssets:v15 matchingFilter:v16];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v17;
  v19 = (void *)[v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v19)
  {
    id v26 = v9;
    uint64_t v20 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v23 = [v22 type];
        char v24 = [v23 isEqualToString:v8];

        if (v24)
        {
          v19 = [v22 path];
          goto LABEL_11;
        }
      }
      v19 = (void *)[v18 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v19) {
        continue;
      }
      break;
    }
LABEL_11:
    id v9 = v26;
  }

  return v19;
}

- (void)start
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(TITrialManager *)self didStart])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[TITrialManager start]";
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  Starting trial manager for A/B testing", buf, 0xCu);
    }
    [(TITrialManager *)self setDidStart:1];
    int v3 = [(TITrialManager *)self ddsTrialProvider];
    [v3 registerDelegate:self];

    unint64_t v4 = [(TITrialManager *)self ddsTrialProvider];
    uint64_t v5 = [MEMORY[0x1E4F5EF68] defaultQuery];
    [v4 setUpTrialForQuery:v5];

    uint64_t v6 = [(TITrialManager *)self ddsTrialProvider];
    int v7 = [MEMORY[0x1E4F5EF68] defaultQuery];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __23__TITrialManager_start__block_invoke;
    v8[3] = &unk_1E6E2DC38;
    v8[4] = self;
    [v6 fetchTrialAssetForQuery:v7 callback:v8];
  }
}

void __23__TITrialManager_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[TITrialManager start]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Trial asset was not found: %@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) handleReceivedTrialAsset:v5];
}

- (id)favoniusLanguagePowerOverrideForLocale:(id)a3
{
  int v3 = [(TITrialManager *)self featuresInTrialForLocale:a3];
  unint64_t v4 = [v3 objectForKeyedSubscript:@"favonius_candidate_ranking"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"favonius_language_power_value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)inlineCompletionOperatingPointOverrideForLocale:(id)a3
{
  int v3 = [(TITrialManager *)self featuresInTrialForLocale:a3];
  unint64_t v4 = [v3 objectForKeyedSubscript:@"inline_completions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"operating_point"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)isNegativeLearningEnabledForLocale:(id)a3
{
  int v3 = [(TITrialManager *)self featuresInTrialForLocale:a3];
  unint64_t v4 = [v3 objectForKeyedSubscript:@"autocorrection_learning"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"Enabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)featuresInTrialForLocale:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TITrialManager *)self trialAsset];
  id v6 = [v5 locale];

  if (!v6
    || ([v4 languageCode],
        int v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 hasPrefix:v6],
        v7,
        !v8))
  {
    v12 = 0;
    goto LABEL_15;
  }
  __int16 v9 = [(TITrialManager *)self trialAsset];
  id v10 = [v9 localURL];
  uint64_t v11 = [v10 URLByAppendingPathComponent:@"FeaturesInTrial.plist"];

  id v19 = 0;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v11 error:&v19];
  id v13 = v19;
  id v14 = v13;
  if (!v12)
  {
    if (v13)
    {
      v16 = [v13 domain];
      if ([v16 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v17 = [v14 code];

        if (v17 == 4)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "-[TITrialManager featuresInTrialForLocale:]";
            __int16 v22 = 2112;
            v23 = v11;
            _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s  %@ not present in trial bundle", buf, 0x16u);
          }
          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[TITrialManager featuresInTrialForLocale:]";
      __int16 v22 = 2112;
      v23 = v11;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_error_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Error loading url %@ as dictionary: %@.", buf, 0x20u);
    }
    goto LABEL_14;
  }
  id v15 = v12;
LABEL_14:

LABEL_15:

  return v12;
}

- (id)inputTranscoderAssetsDirectoryURLForLocale:(id)a3
{
  id v4 = a3;
  id v5 = [(TITrialManager *)self trialAsset];
  if (v5)
  {
    id v6 = [(TITrialManager *)self urlForContentItemType:*MEMORY[0x1E4F724B0] asset:v5 locale:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)encodedCATrialParametersForLocale:(id)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  int v3 = [(TITrialManager *)self trialAsset];
  id v4 = v3;
  if (v3)
  {
    v15[0] = *MEMORY[0x1E4FAEF48];
    id v5 = [v3 experimentIdentifiers];
    id v6 = [v5 experimentId];
    v16[0] = v6;
    v15[1] = *MEMORY[0x1E4FAEF50];
    int v7 = [v4 experimentIdentifiers];
    int v8 = [v7 treatmentId];
    v16[1] = v8;
    v15[2] = *MEMORY[0x1E4FAEF40];
    __int16 v9 = NSNumber;
    id v10 = [v4 experimentIdentifiers];
    uint64_t v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "deploymentId"));
    v12 = [v11 stringValue];
    v16[2] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)encodedLMTrialParametersForLocale:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TITrialManager *)self trialAsset];
  if (v5)
  {
    id v6 = [(TITrialManager *)self urlForContentItemType:*MEMORY[0x1E4F724D0] asset:v5 locale:v4];
    if (v6)
    {
      uint64_t v26 = [v5 localURL];
      id v25 = [v26 path];
      int v7 = (std::string *)[v25 UTF8String];
      memset(&__p, 0, sizeof(__p));
      int v8 = (std::string *)((char *)v7 - 1);
      do
      {
        int v9 = v8->__r_.__value_.__s.__data_[1];
        int v8 = (std::string *)((char *)v8 + 1);
      }
      while (v9);
      std::string::append[abi:nn180100]<char const*,0>(&__p, v7, v8);
      id v10 = (char *)[(id)*MEMORY[0x1E4FAEF48] UTF8String];
      __int16 v24 = [v5 experimentIdentifiers];
      id v23 = [v24 experimentId];
      uint64_t v11 = (char *)[v23 UTF8String];
      std::string::basic_string[abi:nn180100]<0>(v31, v10);
      std::string::basic_string[abi:nn180100]<0>(v32, v11);
      v12 = (char *)[(id)*MEMORY[0x1E4FAEF50] UTF8String];
      id v13 = [v5 experimentIdentifiers];
      id v14 = [v13 treatmentId];
      id v15 = (char *)[v14 UTF8String];
      std::string::basic_string[abi:nn180100]<0>(v33, v12);
      std::string::basic_string[abi:nn180100]<0>(v34, v15);
      v16 = (char *)[(id)*MEMORY[0x1E4FAEF40] UTF8String];
      uint64_t v17 = [v5 experimentIdentifiers];
      std::to_string(&v27, [v17 deploymentId]);
      std::string::basic_string[abi:nn180100]<0>(v35, v16);
      uint64_t v18 = 0;
      long long v36 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
      v37[0] = *((void *)&v27.__r_.__value_.__l + 2);
      memset(&v27, 0, sizeof(v27));
      v30[0] = 0;
      v30[1] = 0;
      long long v29 = (uint64_t *)v30;
      do
      {
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,std::string> const&>(&v29, (uint64_t *)v30, &v31[v18], (long long *)&v31[v18]);
        v18 += 6;
      }
      while (v18 != 18);
      for (uint64_t i = 0; i != -18; i -= 6)
      {
        uint64_t v20 = &v31[i];
        if (SHIBYTE(v37[i]) < 0) {
          operator delete((void *)v20[15]);
        }
        if (*((char *)v20 + 119) < 0) {
          operator delete((void *)v20[12]);
        }
      }
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v27.__r_.__value_.__l.__data_);
      }

      v21 = (void *)LM::TrialParameters::copyEncodedRepresentation((LM::TrialParameters *)&__p);
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v30[0]);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (TITrialManager)initWithDDSTrialProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TITrialManager;
  id v6 = [(TITrialManager *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ddsTrialProvider, a3);
  }

  return v7;
}

+ (TITrialManager)sharedInstance
{
  if (+[TITrialManager sharedInstance]::once != -1) {
    dispatch_once(&+[TITrialManager sharedInstance]::once, &__block_literal_global_20806);
  }
  v2 = (void *)+[TITrialManager sharedInstance]::manager;

  return (TITrialManager *)v2;
}

void __32__TITrialManager_sharedInstance__block_invoke()
{
  v0 = [TITrialManager alloc];
  int v3 = objc_alloc_init(DDSTrialProvider);
  uint64_t v1 = [(TITrialManager *)v0 initWithDDSTrialProvider:v3];
  v2 = (void *)+[TITrialManager sharedInstance]::manager;
  +[TITrialManager sharedInstance]::manager = v1;
}

@end