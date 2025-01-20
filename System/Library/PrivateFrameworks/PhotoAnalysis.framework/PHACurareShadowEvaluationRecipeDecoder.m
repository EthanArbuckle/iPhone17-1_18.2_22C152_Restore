@interface PHACurareShadowEvaluationRecipeDecoder
+ (BOOL)isValidFiltersByDatasetName:(id)a3;
+ (id)allowedPredicates;
+ (id)cameraPredicate;
+ (id)castObject:(id)a3 withName:(id)a4 toClass:(Class)a5 error:(id *)a6;
+ (id)decodeModelSpecificInfo:(id)a3 models:(id)a4;
+ (id)decodeRecipeUserInfo:(id)a3 models:(id)a4 photoLibrary:(id)a5 graphManager:(id)a6 trialDeploymentID:(id)a7 trialExperimentID:(id)a8 trialTreatmentID:(id)a9 decodingError:(id *)a10;
+ (id)decodingErrorWithMessage:(id)a3;
+ (id)objectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6;
+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6;
@end

@implementation PHACurareShadowEvaluationRecipeDecoder

+ (id)decodeModelSpecificInfo:(id)a3 models:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38 = v5;
  v34 = v6;
  if (v5)
  {
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    long long v39 = 0uLL;
    long long v40 = 0uLL;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      do
      {
        uint64_t v11 = 0;
        uint64_t v35 = v9;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v39 + 1) + 8 * v11);
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v13 setObject:v12 forKeyedSubscript:@"modelPath"];
          v14 = [v12 lastPathComponent];
          v15 = [v14 stringByDeletingPathExtension];
          v16 = [v15 componentsSeparatedByString:@"."];
          v17 = [v16 firstObject];

          if (v17)
          {
            v18 = [v38 valueForKeyPath:v17];
            v19 = v18;
            if (v18)
            {
              uint64_t v20 = [v18 valueForKeyPath:@"labelIndex"];
              v21 = (void *)v20;
              if (v20) {
                v22 = (__CFString *)v20;
              }
              else {
                v22 = @"1";
              }
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, @"labelIndex", v34);
              uint64_t v23 = [v19 valueForKeyPath:@"labelOperatingPoint"];
              v24 = (void *)v23;
              if (v23) {
                v25 = (__CFString *)v23;
              }
              else {
                v25 = @"0.5";
              }
              uint64_t v9 = v35;
              [v13 setObject:v25 forKeyedSubscript:@"labelOperatingPoint"];
              [v7 addObject:v13];
            }
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v9);
    }
  }
  else
  {
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    long long v43 = 0uLL;
    long long v44 = 0uLL;
    id obja = v6;
    uint64_t v26 = [obja countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(obja);
          }
          uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v31 setObject:v30 forKeyedSubscript:@"modelPath"];
          [v31 setObject:@"1" forKeyedSubscript:@"labelIndex"];
          [v31 setObject:@"0.5" forKeyedSubscript:@"labelOperatingPoint"];
          [v7 addObject:v31];
        }
        uint64_t v27 = [obja countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v27);
    }
  }

  v32 = (void *)[v7 copy];

  return v32;
}

+ (id)decodingErrorWithMessage:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    v3 = (__CFString *)a3;
  }
  else {
    v3 = @"No error message";
  }
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = v3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);

  uint64_t v8 = (void *)[v7 initWithDomain:@"com.apple.PhotoAnalysis.PHACurareShadowEvaluationRecipeDecoder" code:1 userInfo:v6];

  return v8;
}

+ (id)castObject:(id)a3 withName:(id)a4 toClass:(Class)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (objc_opt_isKindOfClass())
  {
    a6 = (id *)v10;
  }
  else if (a6)
  {
    v12 = [NSString stringWithFormat:@"Object with name (%@) has class (%@), expected (%@)", v11, objc_opt_class(), a5];
    *a6 = [a1 decodingErrorWithMessage:v12];

    a6 = 0;
  }

  return a6;
}

+ (id)objectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [a5 objectForKeyedSubscript:v10];
  if (v11)
  {
    a6 = [a1 castObject:v11 withName:v10 toClass:a3 error:a6];
  }
  else if (a6)
  {
    v12 = [NSString stringWithFormat:@"No value for key: (%@)", v10];
    *a6 = [a1 decodingErrorWithMessage:v12];

    a6 = 0;
  }

  return a6;
}

+ (id)optionalObjectOfClass:(Class)a3 forKey:(id)a4 inDictionary:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [a5 objectForKeyedSubscript:v10];
  if (v11)
  {
    v12 = [a1 castObject:v11 withName:v10 toClass:a3 error:a6];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)isValidFiltersByDatasetName:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 allowedPredicates];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = [v4 allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    uint64_t v22 = *(void *)v29;
    uint64_t v23 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v12 = objc_msgSend(v4, "objectForKeyedSubscript:", v11, v22);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = [*(id *)(*((void *)&v24 + 1) + 8 * j) predicate];
              if (([v5 containsObject:v18] & 1) == 0)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  v21 = [v18 predicateFormat];
                  *(_DWORD *)buf = 138412546;
                  v33 = v21;
                  __int16 v34 = 2112;
                  uint64_t v35 = v11;
                  _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[PHACurareShadowEvaluationRecipeDecoder] Filter %@ for %@ dataset is not allowed for external devices", buf, 0x16u);
                }
                BOOL v19 = 0;
                id v6 = v23;
                goto LABEL_21;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v22;
        id v6 = v23;
      }
      uint64_t v8 = [v23 countByEnumeratingWithState:&v28 objects:v37 count:16];
      BOOL v19 = 1;
    }
    while (v8);
  }
  else
  {
    BOOL v19 = 1;
  }
LABEL_21:

  return v19;
}

+ (id)allowedPredicates
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 cameraPredicate];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)cameraPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d || %K == %d", @"additionalAttributes.importedBy", 1, @"additionalAttributes.importedBy", 2);
}

+ (id)decodeRecipeUserInfo:(id)a3 models:(id)a4 photoLibrary:(id)a5 graphManager:(id)a6 trialDeploymentID:(id)a7 trialExperimentID:(id)a8 trialTreatmentID:(id)a9 decodingError:(id *)a10
{
  id v16 = a3;
  id v60 = a4;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  uint64_t v22 = objc_alloc_init(PHACurareShadowEvaluationRecipeOptions);
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setPhotoLibrary:v21];

  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setGraphManager:v20];
  [(PHACurareShadowEvaluationRecipeOptions *)v22 setTrialDeploymentID:v19];

  [(PHACurareShadowEvaluationRecipeOptions *)v22 setTrialExperimentID:v18];
  [(PHACurareShadowEvaluationRecipeOptions *)v22 setTrialTreatmentID:v17];

  uint64_t v23 = [a1 objectOfClass:objc_opt_class() forKey:@"modelInputName" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setModelInputName:v23];

  long long v24 = [(PHAPrivateFederatedLearningRecipeOptions *)v22 modelInputName];

  if (!v24) {
    goto LABEL_13;
  }
  long long v25 = [a1 objectOfClass:objc_opt_class() forKey:@"modelOutputName" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setModelOutputName:v25];

  long long v26 = [(PHAPrivateFederatedLearningRecipeOptions *)v22 modelOutputName];

  if (!v26
    || ([a1 objectOfClass:objc_opt_class() forKey:@"lossName" inDictionary:v16 error:a10],
        long long v27 = objc_claimAutoreleasedReturnValue(),
        [(PHAPrivateFederatedLearningRecipeOptions *)v22 setLossName:v27],
        v27,
        [(PHAPrivateFederatedLearningRecipeOptions *)v22 lossName],
        long long v28 = objc_claimAutoreleasedReturnValue(),
        v28,
        !v28))
  {
LABEL_13:
    long long v46 = 0;
    v47 = v60;
    goto LABEL_26;
  }
  long long v29 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"fingerprintVersion" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setFingerprintVersionName:v29];

  long long v30 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"datasetPolicy" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setDatasetPolicyString:v30];

  long long v31 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"labelPolicy" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setLabelPolicyString:v31];

  v32 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"positivesDatasetName" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setPositivesDatasetName:v32];

  v33 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"positivesSubsetName" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setPositivesSubsetName:v33];

  __int16 v34 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"negativesDatasetName" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setNegativesDatasetName:v34];

  uint64_t v35 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"negativesSubsetName" inDictionary:v16 error:a10];
  [(PHAPrivateFederatedLearningRecipeOptions *)v22 setNegativesSubsetName:v35];

  v36 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"filters" inDictionary:v16 error:a10];
  v37 = [PHAPrivateFederatedLearningFiltersDecoder alloc];
  uint64_t v38 = [(PHAPrivateFederatedLearningRecipeOptions *)v22 fingerprintVersionName];
  long long v39 = [(PHAPrivateFederatedLearningFiltersDecoder *)v37 initWithFingeprintVersionString:v38];

  if (v36)
  {
    long long v40 = [(PHAPrivateFederatedLearningFiltersDecoder *)v39 filtersByDatasetNameFromDictionary:v36 error:a10];
    [(PHAPrivateFederatedLearningRecipeOptions *)v22 setFiltersByDatasetName:v40];

    long long v41 = [(PHAPrivateFederatedLearningRecipeOptions *)v22 filtersByDatasetName];

    if (!v41) {
      goto LABEL_22;
    }
  }
  if (!PFOSVariantHasInternalDiagnostics()) {
    goto LABEL_12;
  }
  long long v42 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v43 = [v42 BOOLForKey:@"PHACurareShadowEvaluationSimulateExternalDevice"];

  if (v43)
  {
    if (__PXLog_genericOnceToken != -1) {
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_131);
    }
    long long v44 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D21F2000, v44, OS_LOG_TYPE_INFO, "PHACurareShadowEvaluationSimulateExternalDevice is TRUE. Simulating external device", buf, 2u);
    }
LABEL_12:
    char v45 = 0;
    goto LABEL_15;
  }
  char v45 = 1;
LABEL_15:
  v48 = [(PHAPrivateFederatedLearningRecipeOptions *)v22 filtersByDatasetName];
  char v49 = [a1 isValidFiltersByDatasetName:v48];

  if (v45 & 1) != 0 || (v49)
  {
    v51 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"datasetSource" inDictionary:v16 error:a10];
    [(PHAPrivateFederatedLearningRecipeOptions *)v22 setDatasetSource:v51];

    v52 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"numberOfClasses" inDictionary:v16 error:a10];
    -[PHAPrivateFederatedLearningRecipeOptions setNumberOfClasses:](v22, "setNumberOfClasses:", [v52 unsignedIntegerValue]);

    v53 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"learningFramework" inDictionary:v16 error:a10];
    [(PHAPrivateFederatedLearningRecipeOptions *)v22 setLearningFramework:v53];

    v54 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"evaluationMetricNames" inDictionary:v16 error:a10];
    [(PHAPrivateFederatedLearningRecipeOptions *)v22 setEvaluationMetricNames:v54];

    v50 = [a1 optionalObjectOfClass:objc_opt_class() forKey:@"modelSpecificInfo" inDictionary:v16 error:a10];
    v47 = v60;
    v55 = [a1 decodeModelSpecificInfo:v50 models:v60];
    [(PHACurareShadowEvaluationRecipeOptions *)v22 setModelInfoArray:v55];

    uint64_t v56 = [(PHACurareShadowEvaluationRecipeOptions *)v22 modelInfoArray];
    if (v56)
    {
      v57 = (void *)v56;
      v58 = [(PHACurareShadowEvaluationRecipeOptions *)v22 modelInfoArray];
      long long v46 = (PHACurareShadowEvaluationRunner *)[v58 count];

      if (v46) {
        long long v46 = [[PHACurareShadowEvaluationRunner alloc] initWithRecipeOptions:v22];
      }
    }
    else
    {
      long long v46 = 0;
    }
    goto LABEL_24;
  }
  if (a10)
  {
    v50 = [NSString stringWithFormat:@"[PHACurareShadowEvaluationRecipeDecoder] Invalid filter"];
    [a1 decodingErrorWithMessage:v50];
    long long v46 = 0;
    *a10 = (id)objc_claimAutoreleasedReturnValue();
    v47 = v60;
LABEL_24:

    goto LABEL_25;
  }
LABEL_22:
  long long v46 = 0;
  v47 = v60;
LABEL_25:

LABEL_26:

  return v46;
}

uint64_t __163__PHACurareShadowEvaluationRecipeDecoder_decodeRecipeUserInfo_models_photoLibrary_graphManager_trialDeploymentID_trialExperimentID_trialTreatmentID_decodingError___block_invoke()
{
  __PXLog_genericOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd", "generic");

  return MEMORY[0x1F41817F8]();
}

@end