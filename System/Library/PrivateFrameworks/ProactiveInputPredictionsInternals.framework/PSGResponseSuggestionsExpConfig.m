@interface PSGResponseSuggestionsExpConfig
- (BOOL)isMLModelDownloading;
- (BOOL)isMLModelEnabled;
- (NSString)espressoBinFilePath;
- (NSString)inferenceModelConfigPath;
- (NSString)inferenceModelDescription;
- (NSString)inferenceModelFilePath;
- (NSString)language;
- (NSString)treatmentName;
- (NSString)vocabFilePath;
- (PSGResponseSuggestionsExpConfig)initWithNamespaceName:(id)a3 withLanguage:(id)a4 withTrialClient:(id)a5 shouldDownloadAssets:(BOOL)a6;
- (TRIExperimentIdentifiers)experimentIdentifiers;
- (TRIRolloutIdentifiers)rolloutIdentifiers;
- (void)_fillDefaultValuesForFactors;
- (void)_setDefaultValuesForFactors;
@end

@implementation PSGResponseSuggestionsExpConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_vocabFilePath, 0);
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_inferenceModelFilePath, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_inferenceModelDescription, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

- (NSString)language
{
  return self->_language;
}

- (NSString)vocabFilePath
{
  return self->_vocabFilePath;
}

- (NSString)espressoBinFilePath
{
  return self->_espressoBinFilePath;
}

- (NSString)inferenceModelConfigPath
{
  return self->_inferenceModelConfigPath;
}

- (NSString)inferenceModelFilePath
{
  return self->_inferenceModelFilePath;
}

- (BOOL)isMLModelDownloading
{
  return self->_isMLModelDownloading;
}

- (BOOL)isMLModelEnabled
{
  return self->_isMLModelEnabled;
}

- (TRIExperimentIdentifiers)experimentIdentifiers
{
  return self->_experimentIdentifiers;
}

- (TRIRolloutIdentifiers)rolloutIdentifiers
{
  return self->_rolloutIdentifiers;
}

- (NSString)inferenceModelDescription
{
  return self->_inferenceModelDescription;
}

- (NSString)treatmentName
{
  return self->_treatmentName;
}

- (void)_fillDefaultValuesForFactors
{
  id v20 = (id)objc_opt_new();
  if ([(NSString *)self->_treatmentName length])
  {
    v3 = self->_treatmentName;
  }
  else
  {
    v3 = [v20 treatmentName];
  }
  treatmentName = self->_treatmentName;
  self->_treatmentName = v3;

  v5 = [(TRIRolloutIdentifiers *)self->_rolloutIdentifiers rolloutId];
  if ([v5 length])
  {
    v6 = self->_rolloutIdentifiers;
  }
  else
  {
    v6 = [v20 rolloutIdentifiers];
  }
  rolloutIdentifiers = self->_rolloutIdentifiers;
  self->_rolloutIdentifiers = v6;

  v8 = [(TRIExperimentIdentifiers *)self->_experimentIdentifiers treatmentId];
  if ([v8 length])
  {
    v9 = self->_experimentIdentifiers;
  }
  else
  {
    v9 = [v20 experimentIdentifiers];
  }
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v9;

  int isMLModelEnabled = self->_isMLModelEnabled;
  if (!self->_isMLModelEnabled) {
    int isMLModelEnabled = [v20 isMLModelEnabled];
  }
  self->_int isMLModelEnabled = isMLModelEnabled != 0;
  if ([(NSString *)self->_inferenceModelFilePath length])
  {
    v12 = self->_inferenceModelFilePath;
  }
  else
  {
    v12 = [v20 inferenceModelFilePath];
  }
  inferenceModelFilePath = self->_inferenceModelFilePath;
  self->_inferenceModelFilePath = v12;

  if ([(NSString *)self->_inferenceModelConfigPath length])
  {
    v14 = self->_inferenceModelConfigPath;
  }
  else
  {
    v14 = [v20 inferenceModelConfigPath];
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = v14;

  if ([(NSString *)self->_espressoBinFilePath length])
  {
    v16 = self->_espressoBinFilePath;
  }
  else
  {
    v16 = [v20 espressoBinFilePath];
  }
  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = v16;

  if ([(NSString *)self->_vocabFilePath length])
  {
    v18 = self->_vocabFilePath;
  }
  else
  {
    v18 = [v20 vocabFilePath];
  }
  vocabFilePath = self->_vocabFilePath;
  self->_vocabFilePath = v18;
}

- (void)_setDefaultValuesForFactors
{
  id v17 = (id)objc_opt_new();
  v3 = [v17 treatmentName];
  treatmentName = self->_treatmentName;
  self->_treatmentName = v3;

  v5 = [v17 rolloutIdentifiers];
  rolloutIdentifiers = self->_rolloutIdentifiers;
  self->_rolloutIdentifiers = v5;

  v7 = [v17 experimentIdentifiers];
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v7;

  self->_int isMLModelEnabled = [v17 isMLModelEnabled];
  v9 = [v17 inferenceModelFilePath];
  inferenceModelFilePath = self->_inferenceModelFilePath;
  self->_inferenceModelFilePath = v9;

  v11 = [v17 inferenceModelConfigPath];
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = v11;

  v13 = [v17 espressoBinFilePath];
  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = v13;

  v15 = [v17 vocabFilePath];
  vocabFilePath = self->_vocabFilePath;
  self->_vocabFilePath = v15;
}

- (PSGResponseSuggestionsExpConfig)initWithNamespaceName:(id)a3 withLanguage:(id)a4 withTrialClient:(id)a5 shouldDownloadAssets:(BOOL)a6
{
  v116[1] = *MEMORY[0x263EF8340];
  v11 = (NSString *)a3;
  id v12 = a4;
  id v13 = a5;
  v97.receiver = self;
  v97.super_class = (Class)PSGResponseSuggestionsExpConfig;
  v14 = [(PSGResponseSuggestionsExpConfig *)&v97 init];
  if (v14)
  {
    if (!v11) {
      goto LABEL_30;
    }
    v15 = psg_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v99 = v11;
      _os_log_impl(&dword_23EAA9000, v15, OS_LOG_TYPE_DEFAULT, "ZKW Experiment config -- setting up config for namespace %@", buf, 0xCu);
    }

    [v13 refresh];
    p_namespaceName = &v14->_namespaceName;
    objc_storeStrong((id *)&v14->_namespaceName, a3);
    objc_storeStrong((id *)&v14->_language, a4);
    uint64_t v17 = [v13 rolloutIdentifiersWithNamespaceName:v14->_namespaceName];
    rolloutIdentifiers = v14->_rolloutIdentifiers;
    v14->_rolloutIdentifiers = (TRIRolloutIdentifiers *)v17;

    uint64_t v19 = [v13 experimentIdentifiersWithNamespaceName:v14->_namespaceName];
    experimentIdentifiers = v14->_experimentIdentifiers;
    v14->_experimentIdentifiers = (TRIExperimentIdentifiers *)v19;

    v21 = [(TRIExperimentIdentifiers *)v14->_experimentIdentifiers treatmentId];
    if (![v21 length])
    {
      v22 = [(TRIRolloutIdentifiers *)v14->_rolloutIdentifiers rolloutId];
      uint64_t v23 = [v22 length];

      if (v23) {
        goto LABEL_8;
      }
      v21 = psg_default_log_handle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v21, OS_LOG_TYPE_DEFAULT, "ZKW using on-device values since treatment id and rollout id is unset.", buf, 2u);
      }
    }

LABEL_8:
    v24 = [(TRIExperimentIdentifiers *)v14->_experimentIdentifiers treatmentId];
    if ([v24 length])
    {
      v25 = [(TRIExperimentIdentifiers *)v14->_experimentIdentifiers experimentId];
      uint64_t v26 = [v25 length];

      if (!v26)
      {
        v27 = psg_default_log_handle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          v78 = *p_namespaceName;
          *(_DWORD *)buf = 138412290;
          v99 = v78;
          _os_log_fault_impl(&dword_23EAA9000, v27, OS_LOG_TYPE_FAULT, "ZKW: treatmentId without experimentId for namespace %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {
    }
    v29 = [v13 levelForFactor:@"treatmentName" withNamespaceName:v14->_namespaceName];
    uint64_t v30 = [v29 stringValue];
    treatmentName = v14->_treatmentName;
    v14->_treatmentName = (NSString *)v30;

    v32 = [v13 levelForFactor:@"modelDescription" withNamespaceName:v14->_namespaceName];
    uint64_t v33 = [v32 stringValue];
    inferenceModelDescription = v14->_inferenceModelDescription;
    v14->_inferenceModelDescription = (NSString *)v33;

    v35 = [v13 levelForFactor:@"mlModelEnabled" withNamespaceName:v14->_namespaceName];
    v14->_BOOL isMLModelEnabled = [v35 BOOLeanValue];

    if ([(NSString *)v14->_treatmentName length])
    {
      if (v14->_isMLModelEnabled)
      {
        if (![(NSString *)v14->_inferenceModelDescription length])
        {
          v36 = psg_default_log_handle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_23EAA9000, v36, OS_LOG_TYPE_FAULT, "ZKW: model description expected but not found", buf, 2u);
          }
        }
        v37 = [v13 levelForFactor:@"modelAssets" withNamespaceName:*p_namespaceName];
        v38 = [v37 directoryValue];

        if ([v38 hasPath] & 1) != 0 || (objc_msgSend(v38, "isOnDemand"))
        {
          if (([v38 hasPath] & 1) != 0 || a6)
          {
            if ([v38 hasPath])
            {
              v39 = [v38 path];
              char v92 = 0;
              v42 = [MEMORY[0x263F08850] defaultManager];
              int v43 = [v42 fileExistsAtPath:v39 isDirectory:&v92];

              if (v43 && v92)
              {
                uint64_t v44 = [(NSString *)v14->_treatmentName stringByAppendingString:@".model.chunk"];
                uint64_t v45 = [(NSString *)v14->_treatmentName stringByAppendingString:@".config.plist"];
                uint64_t v46 = [(NSString *)v14->_treatmentName stringByAppendingString:@".espresso.bin"];
                uint64_t v47 = [(NSString *)v14->_treatmentName stringByAppendingString:@".vocab.trie"];
                uint64_t v48 = [v39 stringByAppendingPathComponent:v44];
                inferenceModelFilePath = v14->_inferenceModelFilePath;
                v14->_inferenceModelFilePath = (NSString *)v48;

                v89 = (void *)v45;
                uint64_t v50 = [v39 stringByAppendingPathComponent:v45];
                inferenceModelConfigPath = v14->_inferenceModelConfigPath;
                v14->_inferenceModelConfigPath = (NSString *)v50;

                v91 = (void *)v46;
                uint64_t v52 = [v39 stringByAppendingPathComponent:v46];
                espressoBinFilePath = v14->_espressoBinFilePath;
                v14->_espressoBinFilePath = (NSString *)v52;

                v90 = (void *)v47;
                uint64_t v54 = [v39 stringByAppendingPathComponent:v47];
                vocabFilePath = v14->_vocabFilePath;
                v14->_vocabFilePath = (NSString *)v54;

                v56 = [MEMORY[0x263F08850] defaultManager];
                LOBYTE(v46) = [v56 isReadableFileAtPath:v14->_inferenceModelFilePath];

                if ((v46 & 1) == 0)
                {
                  v57 = v14->_inferenceModelFilePath;
                  v14->_inferenceModelFilePath = 0;
                }
                v58 = [MEMORY[0x263F08850] defaultManager];
                char v59 = [v58 isReadableFileAtPath:v14->_inferenceModelConfigPath];

                if ((v59 & 1) == 0)
                {
                  v60 = v14->_inferenceModelConfigPath;
                  v14->_inferenceModelConfigPath = 0;
                }
                v61 = [MEMORY[0x263F08850] defaultManager];
                char v62 = [v61 isReadableFileAtPath:v14->_espressoBinFilePath];

                v63 = v44;
                if ((v62 & 1) == 0)
                {
                  v64 = v14->_espressoBinFilePath;
                  v14->_espressoBinFilePath = 0;
                }
                v65 = [MEMORY[0x263F08850] defaultManager];
                char v66 = [v65 isReadableFileAtPath:v14->_vocabFilePath];

                if ((v66 & 1) == 0)
                {
                  v67 = v14->_vocabFilePath;
                  v14->_vocabFilePath = 0;
                }
                if (v14->_inferenceModelConfigPath && (v14->_inferenceModelFilePath || v14->_espressoBinFilePath))
                {
                  v68 = psg_default_log_handle();
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                  {
                    v84 = v14->_treatmentName;
                    v85 = v14->_inferenceModelDescription;
                    v86 = v14->_inferenceModelConfigPath;
                    v87 = v14->_espressoBinFilePath;
                    v88 = v14->_vocabFilePath;
                    v83 = v14->_inferenceModelFilePath;
                    v69 = [(TRIExperimentIdentifiers *)v14->_experimentIdentifiers experimentId];
                    v70 = [(TRIExperimentIdentifiers *)v14->_experimentIdentifiers treatmentId];
                    BOOL isMLModelEnabled = v14->_isMLModelEnabled;
                    *(_DWORD *)buf = 138414338;
                    v99 = v84;
                    __int16 v100 = 2112;
                    v101 = v85;
                    __int16 v102 = 2112;
                    v103 = v83;
                    __int16 v104 = 2112;
                    v105 = v86;
                    __int16 v106 = 2112;
                    v107 = v87;
                    __int16 v108 = 2112;
                    v109 = v88;
                    __int16 v110 = 2112;
                    v111 = v69;
                    __int16 v112 = 2112;
                    v113 = v70;
                    __int16 v114 = 1024;
                    BOOL v115 = isMLModelEnabled;
                    _os_log_impl(&dword_23EAA9000, v68, OS_LOG_TYPE_DEFAULT, "ZKW reading from trial factor values {treatmentName: %@ inferenceModelDescription: %@ inferenceModelFilePath: %@ inferenceModelConfigPath: %@ espresso.bin: %@ vocab: %@ experimentId: %@ treatmentId: %@ isMLModelEnabled: %d}", buf, 0x58u);
                  }
                  v28 = v14;
                  v72 = v89;
                }
                else
                {
                  v79 = psg_default_log_handle();
                  v72 = v89;
                  if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
                  {
                    v80 = v14->_inferenceModelFilePath;
                    v81 = v14->_inferenceModelConfigPath;
                    v82 = v14->_espressoBinFilePath;
                    *(_DWORD *)buf = 138412802;
                    v99 = v80;
                    __int16 v100 = 2112;
                    v101 = v81;
                    __int16 v102 = 2112;
                    v103 = v82;
                    _os_log_fault_impl(&dword_23EAA9000, v79, OS_LOG_TYPE_FAULT, "ZKW: some required file factor not readable with config path %@, inference path %@, and espresso bin path %@", buf, 0x20u);
                  }

                  v28 = 0;
                }
              }
              else
              {
                v63 = psg_default_log_handle();
                if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_23EAA9000, v63, OS_LOG_TYPE_FAULT, "ZKW: directory factor download completed, but directory path not found", buf, 2u);
                }
                v28 = 0;
              }

              goto LABEL_62;
            }
            v73 = psg_default_log_handle();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_23EAA9000, v73, OS_LOG_TYPE_DEFAULT, "ZKW: assets directory factor is being queued for download", buf, 2u);
            }

            if (initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasOnceToken11 != -1) {
              dispatch_once(&initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasOnceToken11, &__block_literal_global_1684);
            }
            v116[0] = @"modelAssets";
            v74 = (void *)MEMORY[0x263EFF8C0];
            v39 = (id)initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
            v75 = [v74 arrayWithObjects:v116 count:1];
            namespaceName = v14->_namespaceName;
            v95[0] = MEMORY[0x263EF8330];
            v95[1] = 3221225472;
            v95[2] = __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke_2;
            v95[3] = &unk_265038130;
            v96 = v11;
            v93[0] = MEMORY[0x263EF8330];
            v93[1] = 3221225472;
            v93[2] = __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke_29;
            v93[3] = &unk_265038158;
            v94 = v14;
            [v13 downloadLevelsForFactors:v75 withNamespace:namespaceName queue:v39 options:0 progress:v95 completion:v93];
          }
          else
          {
            v39 = psg_default_log_handle();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v99 = v11;
              _os_log_impl(&dword_23EAA9000, v39, OS_LOG_TYPE_DEFAULT, "ZKW: assets for %@ not found on device, not downloading for this request", buf, 0xCu);
            }
          }
        }
        else
        {
          v39 = psg_default_log_handle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_23EAA9000, v39, OS_LOG_TYPE_FAULT, "ZKW: directory factor isn't downloadable on-demand and also isn't found on device", buf, 2u);
          }
        }
        v28 = 0;
LABEL_62:

        goto LABEL_63;
      }
      v41 = psg_default_log_handle();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v41, OS_LOG_TYPE_DEFAULT, "ZKW using default values since the ML model is not enabled.", buf, 2u);
      }

      [(PSGResponseSuggestionsExpConfig *)v14 _fillDefaultValuesForFactors];
LABEL_31:
      v28 = v14;
      goto LABEL_63;
    }
    v40 = psg_default_log_handle();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EAA9000, v40, OS_LOG_TYPE_DEFAULT, "ZKW: treatment name required but not found", buf, 2u);
    }

LABEL_30:
    [(PSGResponseSuggestionsExpConfig *)v14 _setDefaultValuesForFactors];
    goto LABEL_31;
  }
LABEL_13:
  v28 = 0;
LABEL_63:

  return v28;
}

void __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4 = psg_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    uint64_t v8 = v5;
    _os_log_impl(&dword_23EAA9000, v4, OS_LOG_TYPE_DEFAULT, "ZKW: download progress %d%% for namespace %@", (uint8_t *)v6, 0x12u);
  }
}

void __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke_29(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = psg_default_log_handle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [v5 userInfo];
      uint64_t v9 = [v8 description];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16);
      int v12 = 138412802;
      *(void *)id v13 = v9;
      *(_WORD *)&v13[8] = 1024;
      *(_DWORD *)&v13[10] = a2;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_23EAA9000, v6, OS_LOG_TYPE_DEFAULT, "ZKW: Trial download error %@ with result %d for namespace %@", (uint8_t *)&v12, 0x1Cu);
    }
  }
  else if (v7)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
    int v12 = 67109378;
    *(_DWORD *)id v13 = a2;
    *(_WORD *)&v13[4] = 2112;
    *(void *)&v13[6] = v11;
    _os_log_impl(&dword_23EAA9000, v6, OS_LOG_TYPE_DEFAULT, "ZKW: Trial download result %d for namespace %@", (uint8_t *)&v12, 0x12u);
  }
}

void __107__PSGResponseSuggestionsExpConfig_initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___block_invoke()
{
  v0 = (void *)MEMORY[0x23ED0AB80]();
  uint64_t v1 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"PSGResponseSuggestions-downloadAssets" qosClass:9];
  v2 = (void *)initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
  initWithNamespaceName_withLanguage_withTrialClient_shouldDownloadAssets___pasExprOnceResult = v1;
}

@end