@interface PSGWordBoundarySuggestionsExpConfig
- (BOOL)isMLModelEnabled;
- (NSString)espressoBinFilePath;
- (NSString)inferenceModelConfigPath;
- (NSString)inferenceModelDescription;
- (NSString)treatmentName;
- (PSGWordBoundarySuggestionsExpConfig)initWithNamespaceName:(id)a3 withTrialClient:(id)a4 shouldDownloadAssets:(BOOL)a5;
- (TRIExperimentIdentifiers)experimentIdentifiers;
- (TRIRolloutIdentifiers)rolloutIdentifiers;
- (void)_fillDefaultValuesForFactors;
- (void)_setDefaultValuesForFactors;
@end

@implementation PSGWordBoundarySuggestionsExpConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_inferenceModelDescription, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

- (NSString)espressoBinFilePath
{
  return self->_espressoBinFilePath;
}

- (NSString)inferenceModelConfigPath
{
  return self->_inferenceModelConfigPath;
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
  id v16 = (id)objc_opt_new();
  if ([(NSString *)self->_treatmentName length])
  {
    v3 = self->_treatmentName;
  }
  else
  {
    v3 = [v16 treatmentName];
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
    v6 = [v16 rolloutIdentifiers];
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
    v9 = [v16 experimentIdentifiers];
  }
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v9;

  int isMLModelEnabled = self->_isMLModelEnabled;
  if (!self->_isMLModelEnabled) {
    int isMLModelEnabled = [v16 isMLModelEnabled];
  }
  self->_int isMLModelEnabled = isMLModelEnabled != 0;
  if ([(NSString *)self->_inferenceModelConfigPath length])
  {
    v12 = self->_inferenceModelConfigPath;
  }
  else
  {
    v12 = [v16 inferenceModelConfigPath];
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = v12;

  if ([(NSString *)self->_espressoBinFilePath length])
  {
    v14 = self->_espressoBinFilePath;
  }
  else
  {
    v14 = [v16 espressoBinFilePath];
  }
  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = v14;
}

- (void)_setDefaultValuesForFactors
{
  id v13 = (id)objc_opt_new();
  self->_int isMLModelEnabled = [v13 isMLModelEnabled];
  v3 = [v13 treatmentName];
  treatmentName = self->_treatmentName;
  self->_treatmentName = v3;

  v5 = [v13 rolloutIdentifiers];
  rolloutIdentifiers = self->_rolloutIdentifiers;
  self->_rolloutIdentifiers = v5;

  v7 = [v13 experimentIdentifiers];
  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = v7;

  v9 = [v13 inferenceModelConfigPath];
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = v9;

  v11 = [v13 espressoBinFilePath];
  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = v11;
}

- (PSGWordBoundarySuggestionsExpConfig)initWithNamespaceName:(id)a3 withTrialClient:(id)a4 shouldDownloadAssets:(BOOL)a5
{
  v90[1] = *MEMORY[0x263EF8340];
  v9 = (NSString *)a3;
  id v10 = a4;
  v75.receiver = self;
  v75.super_class = (Class)PSGWordBoundarySuggestionsExpConfig;
  v11 = [(PSGWordBoundarySuggestionsExpConfig *)&v75 init];
  if (v11)
  {
    if (!v9) {
      goto LABEL_30;
    }
    v12 = psg_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v9;
      _os_log_impl(&dword_23EAA9000, v12, OS_LOG_TYPE_DEFAULT, "WordBoundary config -- setting up config for namespace %@", buf, 0xCu);
    }

    [v10 refresh];
    p_namespaceName = &v11->_namespaceName;
    objc_storeStrong((id *)&v11->_namespaceName, a3);
    uint64_t v14 = [v10 rolloutIdentifiersWithNamespaceName:v11->_namespaceName];
    rolloutIdentifiers = v11->_rolloutIdentifiers;
    v11->_rolloutIdentifiers = (TRIRolloutIdentifiers *)v14;

    uint64_t v16 = [v10 experimentIdentifiersWithNamespaceName:v11->_namespaceName];
    experimentIdentifiers = v11->_experimentIdentifiers;
    v11->_experimentIdentifiers = (TRIExperimentIdentifiers *)v16;

    v18 = [(TRIExperimentIdentifiers *)v11->_experimentIdentifiers treatmentId];
    if (![v18 length])
    {
      v19 = [(TRIRolloutIdentifiers *)v11->_rolloutIdentifiers rolloutId];
      uint64_t v20 = [v19 length];

      if (v20) {
        goto LABEL_8;
      }
      v18 = psg_default_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v18, OS_LOG_TYPE_DEFAULT, "WordBoundary using on-device values since treatment id and rollout id is unset.", buf, 2u);
      }
    }

LABEL_8:
    v21 = [(TRIExperimentIdentifiers *)v11->_experimentIdentifiers treatmentId];
    if ([v21 length])
    {
      v22 = [(TRIExperimentIdentifiers *)v11->_experimentIdentifiers experimentId];
      uint64_t v23 = [v22 length];

      if (!v23)
      {
        v24 = psg_default_log_handle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          v63 = *p_namespaceName;
          *(_DWORD *)buf = 138412290;
          v77 = v63;
          _os_log_fault_impl(&dword_23EAA9000, v24, OS_LOG_TYPE_FAULT, "WordBoundary: treatmentId without experimentId for namespace %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {
    }
    v26 = [v10 levelForFactor:@"treatmentName" withNamespaceName:v11->_namespaceName];
    uint64_t v27 = [v26 stringValue];
    treatmentName = v11->_treatmentName;
    v11->_treatmentName = (NSString *)v27;

    v29 = [v10 levelForFactor:@"modelDescription" withNamespaceName:v11->_namespaceName];
    uint64_t v30 = [v29 stringValue];
    inferenceModelDescription = v11->_inferenceModelDescription;
    v11->_inferenceModelDescription = (NSString *)v30;

    v32 = [v10 levelForFactor:@"mlModelEnabled" withNamespaceName:v11->_namespaceName];
    v11->_BOOL isMLModelEnabled = [v32 BOOLeanValue];

    if ([(NSString *)v11->_treatmentName length])
    {
      if (v11->_isMLModelEnabled)
      {
        if (![(NSString *)v11->_inferenceModelDescription length])
        {
          v33 = psg_default_log_handle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_23EAA9000, v33, OS_LOG_TYPE_FAULT, "WordBoundary: model description expected but not found", buf, 2u);
          }
        }
        v34 = [v10 levelForFactor:@"modelAssets" withNamespaceName:*p_namespaceName];
        v35 = [v34 directoryValue];

        if ([v35 hasPath] & 1) != 0 || (objc_msgSend(v35, "isOnDemand"))
        {
          if (([v35 hasPath] & 1) != 0 || a5)
          {
            if ([v35 hasPath])
            {
              v36 = [v35 path];
              char v70 = 0;
              v39 = [MEMORY[0x263F08850] defaultManager];
              int v40 = [v39 fileExistsAtPath:v36 isDirectory:&v70];

              if (v40 && v70)
              {
                v41 = [(NSString *)v11->_treatmentName stringByAppendingString:@".config.plist"];
                v42 = [(NSString *)v11->_treatmentName stringByAppendingString:@".espresso.bin"];
                uint64_t v43 = [v36 stringByAppendingPathComponent:v41];
                inferenceModelConfigPath = v11->_inferenceModelConfigPath;
                v11->_inferenceModelConfigPath = (NSString *)v43;

                uint64_t v45 = [v36 stringByAppendingPathComponent:v42];
                espressoBinFilePath = v11->_espressoBinFilePath;
                v11->_espressoBinFilePath = (NSString *)v45;

                v47 = [MEMORY[0x263F08850] defaultManager];
                char v48 = [v47 isReadableFileAtPath:v11->_inferenceModelConfigPath];

                if ((v48 & 1) == 0)
                {
                  v49 = v11->_inferenceModelConfigPath;
                  v11->_inferenceModelConfigPath = 0;
                }
                v50 = [MEMORY[0x263F08850] defaultManager];
                char v51 = [v50 isReadableFileAtPath:v11->_espressoBinFilePath];

                if ((v51 & 1) == 0)
                {
                  v52 = v11->_espressoBinFilePath;
                  v11->_espressoBinFilePath = 0;
                }
                if (v11->_inferenceModelConfigPath && v11->_espressoBinFilePath)
                {
                  v53 = psg_default_log_handle();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    v68 = v11->_inferenceModelDescription;
                    v69 = v11->_espressoBinFilePath;
                    v66 = v11->_treatmentName;
                    v67 = v11->_inferenceModelConfigPath;
                    v54 = [(TRIExperimentIdentifiers *)v11->_experimentIdentifiers experimentId];
                    v55 = [(TRIExperimentIdentifiers *)v11->_experimentIdentifiers treatmentId];
                    BOOL isMLModelEnabled = v11->_isMLModelEnabled;
                    *(_DWORD *)buf = 138413826;
                    v77 = v66;
                    __int16 v78 = 2112;
                    v79 = v68;
                    __int16 v80 = 2112;
                    v81 = v67;
                    __int16 v82 = 2112;
                    v83 = v69;
                    __int16 v84 = 2112;
                    v85 = v54;
                    __int16 v86 = 2112;
                    v87 = v55;
                    __int16 v88 = 1024;
                    BOOL v89 = isMLModelEnabled;
                    _os_log_impl(&dword_23EAA9000, v53, OS_LOG_TYPE_DEFAULT, "WordBoundary reading from trial factor values {treatmentName: %@ inferenceModelDescription: %@ inferenceModelConfigPath: %@ espresso.bin: %@ experimentId: %@ treatmentId: %@ isMLModelEnabled: %d}", buf, 0x44u);
                  }
                  v25 = v11;
                }
                else
                {
                  v62 = psg_default_log_handle();
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
                  {
                    v64 = v11->_inferenceModelConfigPath;
                    v65 = v11->_espressoBinFilePath;
                    *(_DWORD *)buf = 138412546;
                    v77 = v64;
                    __int16 v78 = 2112;
                    v79 = v65;
                    _os_log_fault_impl(&dword_23EAA9000, v62, OS_LOG_TYPE_FAULT, "WordBoundary: some required file factor not readable with config path %@ and espresso bin path %@", buf, 0x16u);
                  }

                  v25 = 0;
                }
              }
              else
              {
                v41 = psg_default_log_handle();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_fault_impl(&dword_23EAA9000, v41, OS_LOG_TYPE_FAULT, "WordBoundary: directory factor download completed, but directory path not found", buf, 2u);
                }
                v25 = 0;
              }

              goto LABEL_57;
            }
            v57 = psg_default_log_handle();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_23EAA9000, v57, OS_LOG_TYPE_DEFAULT, "WordBoundary: assets directory factor is being queued for download", buf, 2u);
            }

            if (initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasOnceToken11 != -1) {
              dispatch_once(&initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasOnceToken11, &__block_literal_global_179);
            }
            v90[0] = @"modelAssets";
            v58 = (void *)MEMORY[0x263EFF8C0];
            v36 = (id)initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
            v59 = [v58 arrayWithObjects:v90 count:1];
            namespaceName = v11->_namespaceName;
            v73[0] = MEMORY[0x263EF8330];
            v73[1] = 3221225472;
            v73[2] = __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_2;
            v73[3] = &unk_265038130;
            v74 = v9;
            v71[0] = MEMORY[0x263EF8330];
            v71[1] = 3221225472;
            v71[2] = __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_23;
            v71[3] = &unk_265038158;
            v72 = v11;
            [v10 downloadLevelsForFactors:v59 withNamespace:namespaceName queue:v36 options:0 progress:v73 completion:v71];
          }
          else
          {
            v36 = psg_default_log_handle();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v77 = v9;
              _os_log_impl(&dword_23EAA9000, v36, OS_LOG_TYPE_DEFAULT, "WordBoundary: assets for %@ not found on device, not downloading for this request", buf, 0xCu);
            }
          }
        }
        else
        {
          v36 = psg_default_log_handle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_23EAA9000, v36, OS_LOG_TYPE_FAULT, "WordBoundary: directory factor isn't downloadable on-demand and also isn't found on device", buf, 2u);
          }
        }
        v25 = 0;
LABEL_57:

        goto LABEL_58;
      }
      v38 = psg_default_log_handle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23EAA9000, v38, OS_LOG_TYPE_DEFAULT, "WordBoundary using default values since the ML model is not enabled.", buf, 2u);
      }

      [(PSGWordBoundarySuggestionsExpConfig *)v11 _fillDefaultValuesForFactors];
LABEL_31:
      v25 = v11;
      goto LABEL_58;
    }
    v37 = psg_default_log_handle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23EAA9000, v37, OS_LOG_TYPE_DEFAULT, "WordBoundary: treatment name required but not found", buf, 2u);
    }

LABEL_30:
    [(PSGWordBoundarySuggestionsExpConfig *)v11 _setDefaultValuesForFactors];
    goto LABEL_31;
  }
LABEL_13:
  v25 = 0;
LABEL_58:

  return v25;
}

void __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_2(uint64_t a1, int a2)
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
    _os_log_impl(&dword_23EAA9000, v4, OS_LOG_TYPE_DEFAULT, "WordBoundary: download progress %d%% for namespace %@", (uint8_t *)v6, 0x12u);
  }
}

void __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_23(uint64_t a1, int a2, void *a3)
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
      _os_log_impl(&dword_23EAA9000, v6, OS_LOG_TYPE_DEFAULT, "WordBoundary: Trial download error %@ with result %d for namespace %@", (uint8_t *)&v12, 0x1Cu);
    }
  }
  else if (v7)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
    int v12 = 67109378;
    *(_DWORD *)id v13 = a2;
    *(_WORD *)&v13[4] = 2112;
    *(void *)&v13[6] = v11;
    _os_log_impl(&dword_23EAA9000, v6, OS_LOG_TYPE_DEFAULT, "WordBoundary: Trial download result %d for namespace %@", (uint8_t *)&v12, 0x12u);
  }
}

void __98__PSGWordBoundarySuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke()
{
  v0 = (void *)MEMORY[0x23ED0AB80]();
  uint64_t v1 = [MEMORY[0x263F61E38] autoreleasingSerialQueueWithLabel:"PSGWordBoundarySuggestions-downloadAssets" qosClass:9];
  v2 = (void *)initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
  initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult = v1;
}

@end