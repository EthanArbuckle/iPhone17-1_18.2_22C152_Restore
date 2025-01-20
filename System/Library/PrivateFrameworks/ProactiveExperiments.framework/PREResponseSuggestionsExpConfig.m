@interface PREResponseSuggestionsExpConfig
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)isMLModelEnabled;
- (NSString)espressoBinFilePath;
- (NSString)inferenceModelConfigPath;
- (NSString)inferenceModelDescription;
- (NSString)inferenceModelFilePath;
- (NSString)treatmentName;
- (NSString)vocabFilePath;
- (PREResponseSuggestionsExpConfig)initWithNamespaceName:(id)a3 withTrialClient:(id)a4 shouldDownloadAssets:(BOOL)a5;
- (TRIExperimentIdentifiers)experimentIdentifiers;
- (TRIRolloutIdentifiers)rolloutIdentifiers;
- (void)_fillDefaultValueForFactors;
- (void)_setDefaultValuesForFactors;
@end

@implementation PREResponseSuggestionsExpConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentIdentifiers, 0);
  objc_storeStrong((id *)&self->_rolloutIdentifiers, 0);
  objc_storeStrong((id *)&self->_vocabFilePath, 0);
  objc_storeStrong((id *)&self->_espressoBinFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, 0);
  objc_storeStrong((id *)&self->_inferenceModelFilePath, 0);
  objc_storeStrong((id *)&self->_inferenceModelDescription, 0);
  objc_storeStrong((id *)&self->_treatmentName, 0);

  objc_storeStrong((id *)&self->_namespaceName, 0);
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

- (NSString)inferenceModelDescription
{
  return self->_inferenceModelDescription;
}

- (NSString)treatmentName
{
  return self->_treatmentName;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PREResponseSuggestionsExpConfig *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PREResponseSuggestionsExpConfig *)self isEqualToConfig:v5];

  return v6;
}

- (BOOL)isEqualToConfig:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_28;
  }
  treatmentName = self->_treatmentName;
  v7 = (NSString *)v4[3];
  if (treatmentName == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = treatmentName;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_28;
    }
  }
  inferenceModelFilePath = self->_inferenceModelFilePath;
  v12 = (NSString *)v5[5];
  if (inferenceModelFilePath == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = inferenceModelFilePath;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_28;
    }
  }
  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  v17 = (NSString *)v5[6];
  if (inferenceModelConfigPath == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = inferenceModelConfigPath;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_28;
    }
  }
  espressoBinFilePath = self->_espressoBinFilePath;
  v22 = (NSString *)v5[7];
  if (espressoBinFilePath == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = espressoBinFilePath;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_28;
    }
  }
  vocabFilePath = self->_vocabFilePath;
  v27 = (NSString *)v5[8];
  if (vocabFilePath == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = vocabFilePath;
    char v30 = [(NSString *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_28;
    }
  }
  rolloutIdentifiers = self->_rolloutIdentifiers;
  v32 = (TRIRolloutIdentifiers *)v5[9];
  if (rolloutIdentifiers == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = rolloutIdentifiers;
    char v35 = [(TRIRolloutIdentifiers *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_28;
    }
  }
  experimentIdentifiers = self->_experimentIdentifiers;
  v37 = (TRIExperimentIdentifiers *)v5[10];
  if (experimentIdentifiers == v37)
  {

    goto LABEL_31;
  }
  v38 = v37;
  v39 = experimentIdentifiers;
  char v40 = [(TRIExperimentIdentifiers *)v39 isEqual:v38];

  if (v40)
  {
LABEL_31:
    BOOL v41 = self->_isMLModelEnabled == *((unsigned __int8 *)v5 + 16);
    goto LABEL_29;
  }
LABEL_28:
  BOOL v41 = 0;
LABEL_29:

  return v41;
}

- (void)_fillDefaultValueForFactors
{
  p_treatmentName = (id *)&self->_treatmentName;
  if ([(NSString *)self->_treatmentName length]) {
    v4 = (__CFString *)*p_treatmentName;
  }
  else {
    v4 = @"DEFAULT_RESPONSE_KIT";
  }
  objc_storeStrong(p_treatmentName, v4);
  if ([(NSString *)self->_inferenceModelFilePath length]) {
    inferenceModelFilePath = self->_inferenceModelFilePath;
  }
  else {
    inferenceModelFilePath = 0;
  }
  objc_storeStrong((id *)&self->_inferenceModelFilePath, inferenceModelFilePath);
  if ([(NSString *)self->_inferenceModelConfigPath length]) {
    inferenceModelConfigPath = self->_inferenceModelConfigPath;
  }
  else {
    inferenceModelConfigPath = 0;
  }
  objc_storeStrong((id *)&self->_inferenceModelConfigPath, inferenceModelConfigPath);
  if ([(NSString *)self->_espressoBinFilePath length]) {
    espressoBinFilePath = self->_espressoBinFilePath;
  }
  else {
    espressoBinFilePath = 0;
  }
  objc_storeStrong((id *)&self->_espressoBinFilePath, espressoBinFilePath);
  if ([(NSString *)self->_vocabFilePath length]) {
    vocabFilePath = self->_vocabFilePath;
  }
  else {
    vocabFilePath = 0;
  }
  objc_storeStrong((id *)&self->_vocabFilePath, vocabFilePath);
  v9 = [(TRIRolloutIdentifiers *)self->_rolloutIdentifiers rolloutId];
  if ([v9 length]) {
    rolloutIdentifiers = self->_rolloutIdentifiers;
  }
  else {
    rolloutIdentifiers = 0;
  }
  objc_storeStrong((id *)&self->_rolloutIdentifiers, rolloutIdentifiers);

  experimentIdentifiers = self->_experimentIdentifiers;
  p_experimentIdentifiers = (id *)&self->_experimentIdentifiers;
  id v14 = [(TRIExperimentIdentifiers *)experimentIdentifiers treatmentId];
  if ([v14 length]) {
    id v13 = *p_experimentIdentifiers;
  }
  else {
    id v13 = 0;
  }
  objc_storeStrong(p_experimentIdentifiers, v13);
}

- (void)_setDefaultValuesForFactors
{
  treatmentName = self->_treatmentName;
  self->_treatmentName = (NSString *)@"DEFAULT_RESPONSE_KIT";

  inferenceModelFilePath = self->_inferenceModelFilePath;
  self->_inferenceModelFilePath = 0;

  inferenceModelConfigPath = self->_inferenceModelConfigPath;
  self->_inferenceModelConfigPath = 0;

  espressoBinFilePath = self->_espressoBinFilePath;
  self->_espressoBinFilePath = 0;

  vocabFilePath = self->_vocabFilePath;
  self->_vocabFilePath = 0;

  rolloutIdentifiers = self->_rolloutIdentifiers;
  self->_rolloutIdentifiers = 0;

  experimentIdentifiers = self->_experimentIdentifiers;
  self->_experimentIdentifiers = 0;

  self->_isMLModelEnabled = 0;
}

- (PREResponseSuggestionsExpConfig)initWithNamespaceName:(id)a3 withTrialClient:(id)a4 shouldDownloadAssets:(BOOL)a5
{
  v114[1] = *MEMORY[0x1E4F143B8];
  v9 = (NSString *)a3;
  id v10 = a4;
  v95.receiver = self;
  v95.super_class = (Class)PREResponseSuggestionsExpConfig;
  v11 = [(PREResponseSuggestionsExpConfig *)&v95 init];
  v12 = v11;
  if (v11)
  {
    if (!v9)
    {
      [(PREResponseSuggestionsExpConfig *)v11 _setDefaultValuesForFactors];
      goto LABEL_34;
    }
    id v13 = pre_responses_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v97 = v9;
      _os_log_impl(&dword_1CA622000, v13, OS_LOG_TYPE_DEFAULT, "PRE Experiment config -- setting up config for namespace %@", buf, 0xCu);
    }

    [v10 refresh];
    p_namespaceName = &v12->_namespaceName;
    objc_storeStrong((id *)&v12->_namespaceName, a3);
    uint64_t v15 = [v10 rolloutIdentifiersWithNamespaceName:v12->_namespaceName];
    rolloutIdentifiers = v12->_rolloutIdentifiers;
    v12->_rolloutIdentifiers = (TRIRolloutIdentifiers *)v15;

    uint64_t v17 = [v10 experimentIdentifiersWithNamespaceName:v12->_namespaceName];
    experimentIdentifiers = v12->_experimentIdentifiers;
    v12->_experimentIdentifiers = (TRIExperimentIdentifiers *)v17;

    v19 = [(TRIExperimentIdentifiers *)v12->_experimentIdentifiers treatmentId];
    if (![v19 length])
    {
      char v20 = [(TRIRolloutIdentifiers *)v12->_rolloutIdentifiers rolloutId];
      uint64_t v21 = [v20 length];

      if (v21) {
        goto LABEL_9;
      }
      v19 = pre_responses_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA622000, v19, OS_LOG_TYPE_DEFAULT, "Smart Reply using on-device values since treatment id and rollout id is unset.", buf, 2u);
      }
    }

LABEL_9:
    v22 = [(TRIExperimentIdentifiers *)v12->_experimentIdentifiers treatmentId];
    if ([v22 length])
    {
      v23 = [(TRIExperimentIdentifiers *)v12->_experimentIdentifiers experimentId];
      uint64_t v24 = [v23 length];

      if (!v24)
      {
        char v25 = pre_responses_handle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        {
          v77 = *p_namespaceName;
          *(_DWORD *)buf = 138412290;
          v97 = v77;
          _os_log_fault_impl(&dword_1CA622000, v25, OS_LOG_TYPE_FAULT, "Smart Reply: treatmentId without experimentId for namespace %@", buf, 0xCu);
        }

        goto LABEL_30;
      }
    }
    else
    {
    }
    v26 = [v10 levelForFactor:@"modelName" withNamespaceName:v12->_namespaceName];
    uint64_t v27 = [v26 stringValue];
    treatmentName = v12->_treatmentName;
    v12->_treatmentName = (NSString *)v27;

    v29 = [v10 levelForFactor:@"modelDescription" withNamespaceName:v12->_namespaceName];
    uint64_t v30 = [v29 stringValue];
    inferenceModelDescription = v12->_inferenceModelDescription;
    v12->_inferenceModelDescription = (NSString *)v30;

    v32 = [v10 levelForFactor:@"mlModelEnabled" withNamespaceName:v12->_namespaceName];
    v12->_BOOL isMLModelEnabled = [v32 BOOLeanValue];

    if (![(NSString *)v12->_treatmentName length])
    {
      v37 = pre_responses_handle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1CA622000, v37, OS_LOG_TYPE_FAULT, "Smart Reply: treatment name required but not found", buf, 2u);
      }

      goto LABEL_30;
    }
    if (v12->_isMLModelEnabled)
    {
      if (![(NSString *)v12->_inferenceModelDescription length])
      {
        v33 = pre_responses_handle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1CA622000, v33, OS_LOG_TYPE_FAULT, "Smart Reply: model description expected but not found", buf, 2u);
        }
      }
      v34 = [v10 levelForFactor:@"modelAssets" withNamespaceName:*p_namespaceName];
      char v35 = [v34 directoryValue];

      if ([v35 hasPath] & 1) != 0 || (objc_msgSend(v35, "isOnDemand"))
      {
        if (([v35 hasPath] & 1) != 0 || a5)
        {
          if ([v35 hasPath])
          {
            v36 = [v35 path];
            char v90 = 0;
            char v40 = [MEMORY[0x1E4F28CB8] defaultManager];
            int v41 = [v40 fileExistsAtPath:v36 isDirectory:&v90];

            if (v41 && v90)
            {
              v42 = [(NSString *)v12->_treatmentName stringByAppendingString:@".model.chunk"];
              uint64_t v43 = [(NSString *)v12->_treatmentName stringByAppendingString:@".config.plist"];
              uint64_t v44 = [(NSString *)v12->_treatmentName stringByAppendingString:@".espresso.bin"];
              v45 = [(NSString *)v12->_treatmentName stringByAppendingString:@".vocab.trie"];
              uint64_t v46 = [v36 stringByAppendingPathComponent:v42];
              inferenceModelFilePath = v12->_inferenceModelFilePath;
              v12->_inferenceModelFilePath = (NSString *)v46;

              v89 = (void *)v43;
              uint64_t v48 = [v36 stringByAppendingPathComponent:v43];
              inferenceModelConfigPath = v12->_inferenceModelConfigPath;
              v12->_inferenceModelConfigPath = (NSString *)v48;

              v88 = (void *)v44;
              uint64_t v50 = [v36 stringByAppendingPathComponent:v44];
              espressoBinFilePath = v12->_espressoBinFilePath;
              v12->_espressoBinFilePath = (NSString *)v50;

              v87 = v45;
              uint64_t v52 = [v36 stringByAppendingPathComponent:v45];
              vocabFilePath = v12->_vocabFilePath;
              v12->_vocabFilePath = (NSString *)v52;

              v54 = [MEMORY[0x1E4F28CB8] defaultManager];
              LOBYTE(v43) = [v54 isReadableFileAtPath:v12->_inferenceModelFilePath];

              if ((v43 & 1) == 0)
              {
                v55 = v12->_inferenceModelFilePath;
                v12->_inferenceModelFilePath = 0;
              }
              v56 = [MEMORY[0x1E4F28CB8] defaultManager];
              char v57 = [v56 isReadableFileAtPath:v12->_inferenceModelConfigPath];

              if ((v57 & 1) == 0)
              {
                v58 = v12->_inferenceModelConfigPath;
                v12->_inferenceModelConfigPath = 0;
              }
              v59 = [MEMORY[0x1E4F28CB8] defaultManager];
              char v60 = [v59 isReadableFileAtPath:v12->_espressoBinFilePath];

              if ((v60 & 1) == 0)
              {
                v61 = v12->_espressoBinFilePath;
                v12->_espressoBinFilePath = 0;
              }
              v62 = [MEMORY[0x1E4F28CB8] defaultManager];
              char v63 = [v62 isReadableFileAtPath:v12->_vocabFilePath];

              if ((v63 & 1) == 0)
              {
                v64 = v12->_vocabFilePath;
                v12->_vocabFilePath = 0;
              }
              if (v12->_inferenceModelConfigPath && (v12->_inferenceModelFilePath || v12->_espressoBinFilePath))
              {
                v65 = pre_responses_handle();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  v66 = v12->_treatmentName;
                  v82 = v12->_inferenceModelDescription;
                  v83 = v12->_inferenceModelFilePath;
                  v84 = v12->_inferenceModelConfigPath;
                  v85 = v12->_espressoBinFilePath;
                  v86 = v12->_vocabFilePath;
                  v67 = [(TRIExperimentIdentifiers *)v12->_experimentIdentifiers experimentId];
                  v68 = [(TRIExperimentIdentifiers *)v12->_experimentIdentifiers treatmentId];
                  BOOL isMLModelEnabled = v12->_isMLModelEnabled;
                  *(_DWORD *)buf = 138414338;
                  v97 = v66;
                  __int16 v98 = 2112;
                  v99 = v82;
                  __int16 v100 = 2112;
                  v101 = v83;
                  __int16 v102 = 2112;
                  v103 = v84;
                  __int16 v104 = 2112;
                  v105 = v85;
                  __int16 v106 = 2112;
                  v107 = v86;
                  __int16 v108 = 2112;
                  v109 = v67;
                  __int16 v110 = 2112;
                  v111 = v68;
                  __int16 v112 = 1024;
                  BOOL v113 = isMLModelEnabled;
                  _os_log_impl(&dword_1CA622000, v65, OS_LOG_TYPE_DEFAULT, "Smart Reply reading from trial factor values {treatmentName: %@ inferenceModelDescription: %@ inferenceModelFilePath: %@ inferenceModelConfigPath: %@ espresso.bin: %@ vocab: %@ experimentId: %@ treatmentId: %@ isMLModelEnabled: %d}", buf, 0x58u);
                }
                v38 = v12;
                v71 = v88;
                v70 = v89;
                v45 = v87;
              }
              else
              {
                v78 = pre_responses_handle();
                v71 = v88;
                v70 = v89;
                if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
                {
                  v79 = v12->_inferenceModelFilePath;
                  v80 = v12->_inferenceModelConfigPath;
                  v81 = v12->_espressoBinFilePath;
                  *(_DWORD *)buf = 138412802;
                  v97 = v79;
                  __int16 v98 = 2112;
                  v99 = v80;
                  __int16 v100 = 2112;
                  v101 = v81;
                  _os_log_fault_impl(&dword_1CA622000, v78, OS_LOG_TYPE_FAULT, "Smart Reply: some required file factor not readable with config path %@, inference path %@, and espresso bin path %@", buf, 0x20u);
                }

                v38 = 0;
              }
            }
            else
            {
              v42 = pre_responses_handle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1CA622000, v42, OS_LOG_TYPE_FAULT, "Smart Reply: directory factor download completed, but directory path not found", buf, 2u);
              }
              v38 = 0;
            }

            goto LABEL_62;
          }
          v72 = pre_responses_handle();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA622000, v72, OS_LOG_TYPE_DEFAULT, "Smart Reply: assets directory factor is being queued for download", buf, 2u);
          }

          if (initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasOnceToken11 != -1) {
            dispatch_once(&initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasOnceToken11, &__block_literal_global_1143);
          }
          v114[0] = @"modelAssets";
          v73 = (void *)MEMORY[0x1E4F1C978];
          v36 = (id)initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
          v74 = [v73 arrayWithObjects:v114 count:1];
          namespaceName = v12->_namespaceName;
          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_2;
          v93[3] = &unk_1E65B1A90;
          v94 = v9;
          v91[0] = MEMORY[0x1E4F143A8];
          v91[1] = 3221225472;
          v91[2] = __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_70;
          v91[3] = &unk_1E65B1AB8;
          v92 = v12;
          [v10 downloadLevelsForFactors:v74 withNamespace:namespaceName queue:v36 options:0 progress:v93 completion:v91];
        }
        else
        {
          v36 = pre_responses_handle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v97 = v9;
            _os_log_impl(&dword_1CA622000, v36, OS_LOG_TYPE_DEFAULT, "Smart Reply: assets for %@ not found on device, not downloading for this request", buf, 0xCu);
          }
        }
      }
      else
      {
        v36 = pre_responses_handle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1CA622000, v36, OS_LOG_TYPE_FAULT, "Smart Reply: directory factor isn't downloadable on-demand and also isn't found on device", buf, 2u);
        }
      }
      v38 = 0;
LABEL_62:

      goto LABEL_63;
    }
    v39 = pre_responses_handle();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA622000, v39, OS_LOG_TYPE_DEFAULT, "Smart Reply using default values since the ML model is not enabled.", buf, 2u);
    }

    [(PREResponseSuggestionsExpConfig *)v12 _fillDefaultValueForFactors];
LABEL_34:
    v38 = v12;
    goto LABEL_63;
  }
LABEL_30:
  v38 = 0;
LABEL_63:

  return v38;
}

void __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = pre_responses_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = a2;
    __int16 v7 = 2112;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1CA622000, v4, OS_LOG_TYPE_DEFAULT, "Smart Reply: download progress %d%% for namespace %@", (uint8_t *)v6, 0x12u);
  }
}

void __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke_70(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = pre_responses_handle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = [v5 userInfo];
      uint64_t v9 = [v8 description];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      int v12 = 138412802;
      *(void *)id v13 = v9;
      *(_WORD *)&v13[8] = 1024;
      *(_DWORD *)&v13[10] = a2;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1CA622000, v6, OS_LOG_TYPE_DEFAULT, "Smart Reply: Trial download error %@ with result %d for namespace %@", (uint8_t *)&v12, 0x1Cu);
    }
  }
  else if (v7)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    int v12 = 67109378;
    *(_DWORD *)id v13 = a2;
    *(_WORD *)&v13[4] = 2112;
    *(void *)&v13[6] = v11;
    _os_log_impl(&dword_1CA622000, v6, OS_LOG_TYPE_DEFAULT, "Smart Reply: Trial download result %d for namespace %@", (uint8_t *)&v12, 0x12u);
  }
}

void __94__PREResponseSuggestionsExpConfig_initWithNamespaceName_withTrialClient_shouldDownloadAssets___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB799590]();
  uint64_t v1 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"PREResponseSuggestions-downloadAssets" qosClass:9];
  v2 = (void *)initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult;
  initWithNamespaceName_withTrialClient_shouldDownloadAssets___pasExprOnceResult = v1;
}

@end