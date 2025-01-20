@interface PSFTZKWTrialWrapper
@end

@implementation PSFTZKWTrialWrapper

void __38___PSFTZKWTrialWrapper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1A6243860]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_0;
  sharedInstance__pasExprOnceResult_0 = v1;
}

void __28___PSFTZKWTrialWrapper_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained refresh];
    [v2 flagAsUpdated];
    id WeakRetained = v2;
  }
}

void __37___PSFTZKWTrialWrapper_flagAsUpdated__block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 8) = 1;
}

void __34___PSFTZKWTrialWrapper_flagAsSame__block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 8) = 0;
}

void __35___PSFTZKWTrialWrapper_loadFactors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 24) experimentIdentifiersWithNamespaceName:@"COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"];
  [v3 setExperimentIdentifiers:v4];

  v5 = [v3 experimentIdentifiers];

  v6 = +[_PSLogging generalChannel];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = [v3 experimentIdentifiers];
      v9 = [v8 experimentId];
      v10 = [v3 experimentIdentifiers];
      int v11 = [v10 deploymentId];
      v12 = [v3 experimentIdentifiers];
      v13 = [v12 treatmentId];
      int v26 = 138412802;
      v27 = v9;
      __int16 v28 = 1024;
      int v29 = v11;
      __int16 v30 = 2112;
      v31 = v13;
      _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Device is enrolled in experiment with experiment ID = %@, deployment ID = %d, treatment ID = %@", (uint8_t *)&v26, 0x1Cu);
    }
  }
  else if (v7)
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Device is not enrolled in an experiment.", (uint8_t *)&v26, 2u);
  }

  v14 = [*(id *)(*(void *)(a1 + 32) + 24) rolloutIdentifiersWithNamespaceName:@"COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"];
  [v3 setRolloutIdentifiers:v14];

  v15 = [v3 rolloutIdentifiers];

  v16 = +[_PSLogging generalChannel];
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      v18 = [v3 rolloutIdentifiers];
      v19 = [v18 rolloutId];
      v20 = [v3 rolloutIdentifiers];
      int v21 = [v20 deploymentId];
      v22 = [v3 rolloutIdentifiers];
      v23 = [v22 factorPackId];
      int v26 = 138412802;
      v27 = v19;
      __int16 v28 = 1024;
      int v29 = v21;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1A314B000, v16, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Device is part of a rollout with rollout ID = %@, deployment ID = %d, factor pack ID = %@", (uint8_t *)&v26, 0x1Cu);
    }
  }
  else if (v17)
  {
    LOWORD(v26) = 0;
    _os_log_impl(&dword_1A314B000, v16, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Device is not included in a rollout.", (uint8_t *)&v26, 2u);
  }

  v24 = [v3 experimentIdentifiers];
  if (!v24)
  {
    v25 = [v3 rolloutIdentifiers];

    if (v25) {
      goto LABEL_14;
    }
    v24 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1A314B000, v24, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Using device-local default factor values (levels).", (uint8_t *)&v26, 2u);
    }
  }

LABEL_14:
  objc_msgSend(v3, "setStructuredCalendarIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", @"structuredCalendarIsEnabled", 1));
  objc_msgSend(v3, "setStructuredCalendarDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", @"structuredCalendarDefaultConfidenceCategory", 3));
  objc_msgSend(v3, "setUnstructuredCalendarIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", @"unstructuredCalendarIsEnabled", 1));
  objc_msgSend(v3, "setUnstructuredCalendarDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", @"unstructuredCalendarDefaultConfidenceCategory", 3));
  objc_msgSend(v3, "setUnstructuredRemindersIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", @"unstructuredRemindersIsEnabled", 0));
  objc_msgSend(v3, "setUnstructuredRemindersDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", @"unstructuredRemindersDefaultConfidenceCategory", 3));
  objc_msgSend(v3, "setPrimaryInteractionsIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", @"primaryInteractionsIsEnabled", 1));
  objc_msgSend(v3, "setPrimaryInteractionsDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", @"primaryInteractionsDefaultConfidenceCategory", 3));
  objc_msgSend(v3, "setPrimaryInteractionsModelType:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsInteractionModelTypeFromFactor:withDefault:", @"primaryInteractionsModelType", 0));
  objc_msgSend(v3, "setFallbackInteractionsIsEnabled:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsBooleanFromFactor:withDefault:", @"fallbackInteractionsIsEnabled", 1));
  objc_msgSend(v3, "setFallbackInteractionsDefaultConfidenceCategory:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsConfidenceCategoryFromFactor:withDefault:", @"fallbackInteractionsDefaultConfidenceCategory", 3));
  objc_msgSend(v3, "setFallbackInteractionsModelType:", objc_msgSend(*(id *)(a1 + 32), "loadLevelAsInteractionModelTypeFromFactor:withDefault:", @"fallbackInteractionsModelType", 0));
}

uint64_t __36___PSFTZKWTrialWrapper_runWithData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __37___PSFTZKWTrialWrapper_runIfUpdated___block_invoke(uint64_t a1, unsigned char *a2)
{
  if (a2[8])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = a2;
    [v3 runWithData:v4];
    a2[8] = 0;
  }
}

@end