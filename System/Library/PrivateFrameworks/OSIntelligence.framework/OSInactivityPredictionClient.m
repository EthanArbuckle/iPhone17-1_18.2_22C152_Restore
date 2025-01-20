@interface OSInactivityPredictionClient
@end

@implementation OSInactivityPredictionClient

void __47___OSInactivityPredictionClient_initConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = gInactivityPredictionClientLog;
    if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
      __47___OSInactivityPredictionClient_initConnection__block_invoke_cold_1(v2);
    }
  }
}

void __47___OSInactivityPredictionClient_initConnection__block_invoke_85(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained handleInterruption];
    id WeakRetained = v2;
  }
}

void __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke_cold_1();
  }
}

uint64_t __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke_89(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __49___OSInactivityPredictionClient_modelDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __49___OSInactivityPredictionClient_modelDescription__block_invoke_cold_1();
  }
}

void __49___OSInactivityPredictionClient_modelDescription__block_invoke_93(uint64_t a1, void *a2)
{
}

void __46___OSInactivityPredictionClient_modelMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __46___OSInactivityPredictionClient_modelMetadata__block_invoke_cold_1();
  }
}

void __46___OSInactivityPredictionClient_modelMetadata__block_invoke_97(uint64_t a1, void *a2)
{
}

void __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke_cold_1();
  }
}

uint64_t __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke_101(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke_cold_1();
  }
}

void __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke_105(uint64_t a1, void *a2)
{
}

void __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke_cold_1();
  }
}

void __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke_108(uint64_t a1, void *a2)
{
}

void __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke_cold_1();
  }
}

void __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke_cold_1();
  }
}

void __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke_112(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __48___OSInactivityPredictionClient_fixModelOutput___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __39___OSChargingPredictor_fixModelOutput___block_invoke_cold_1();
  }
}

void __48___OSInactivityPredictionClient_fixModelOutput___block_invoke_115(uint64_t a1, void *a2)
{
}

void __49___OSInactivityPredictionClient_unfixModelOutput__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __40___OSChargingPredictor_unfixModelOutput__block_invoke_cold_1();
  }
}

void __49___OSInactivityPredictionClient_unfixModelOutput__block_invoke_118(uint64_t a1, void *a2)
{
}

void __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke_cold_1();
  }
}

uint64_t __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke_121(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke_cold_1();
  }
}

uint64_t __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke_124(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke_cold_1();
  }
}

uint64_t __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke_127(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __45___OSInactivityPredictionClient_backedUpData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __45___OSInactivityPredictionClient_backedUpData__block_invoke_cold_1();
  }
}

void __45___OSInactivityPredictionClient_backedUpData__block_invoke_130(uint64_t a1, void *a2)
{
}

void __64___OSInactivityPredictionClient_recommendedWaitTimeWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __64___OSInactivityPredictionClient_recommendedWaitTimeWithHandler___block_invoke_cold_1();
  }
}

void __61___OSInactivityPredictionClient_modelDescriptionWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __61___OSInactivityPredictionClient_modelDescriptionWithHandler___block_invoke_cold_1();
  }
}

void __58___OSInactivityPredictionClient_modelMetadataWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __58___OSInactivityPredictionClient_modelMetadataWithHandler___block_invoke_cold_1();
  }
}

void __71___OSInactivityPredictionClient_inactivityHistoryDiagnosisWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __71___OSInactivityPredictionClient_inactivityHistoryDiagnosisWithHandler___block_invoke_cold_1();
  }
}

void __71___OSInactivityPredictionClient_hasEnoughInactivityHistoryWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __71___OSInactivityPredictionClient_hasEnoughInactivityHistoryWithHandler___block_invoke_cold_1();
  }
}

void __65___OSInactivityPredictionClient_deviceUsageDiagnosisWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __65___OSInactivityPredictionClient_deviceUsageDiagnosisWithHandler___block_invoke_cold_1();
  }
}

void __87___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __87___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withHandler___block_invoke_cold_1();
  }
}

void __116___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __116___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withHandler___block_invoke_cold_1();
  }
}

void __60___OSInactivityPredictionClient_fixModelOutput_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke_cold_1();
  }
}

void __61___OSInactivityPredictionClient_unfixModelOutputWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke_cold_1();
  }
}

void __75___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __75___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo_withHandler___block_invoke_cold_1();
  }
}

void __71___OSInactivityPredictionClient_restoreRecommendedWaitTimeWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __71___OSInactivityPredictionClient_restoreRecommendedWaitTimeWithHandler___block_invoke_cold_1();
  }
}

void __67___OSInactivityPredictionClient_restoreInactivityModelWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __67___OSInactivityPredictionClient_restoreInactivityModelWithHandler___block_invoke_cold_1();
  }
}

void __57___OSInactivityPredictionClient_backedUpDataWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)gInactivityPredictionClientLog, OS_LOG_TYPE_ERROR)) {
    __57___OSInactivityPredictionClient_backedUpDataWithHandler___block_invoke_cold_1();
  }
}

void __47___OSInactivityPredictionClient_initConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CA50C000, log, OS_LOG_TYPE_ERROR, "Connection to inactivity predictor invalidated", v1, 2u);
}

void __52___OSInactivityPredictionClient_recommendedWaitTime__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in getting the recommended wait time since initial inactivity synchronously: %@", v2, v3, v4, v5, v6);
}

void __49___OSInactivityPredictionClient_modelDescription__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in getting inactivity predictor description synchronously: %@", v2, v3, v4, v5, v6);
}

void __46___OSInactivityPredictionClient_modelMetadata__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in getting inactivity predictor metadata synchronously: %@", v2, v3, v4, v5, v6);
}

void __59___OSInactivityPredictionClient_hasEnoughInactivityHistory__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in checking user history sufficiency synchronously: %@", v2, v3, v4, v5, v6);
}

void __59___OSInactivityPredictionClient_inactivityHistoryDiagnosis__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in diagnozing user inactivity history synchronously: %@", v2, v3, v4, v5, v6);
}

void __53___OSInactivityPredictionClient_deviceUsageDiagnosis__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in diagnozing the device usage frequency synchronously: %@", v2, v3, v4, v5, v6);
}

void __85___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_1CA50C000, v0, v1, "(%ld) Error in getting long inactivity prediction synchronously: %@");
}

void __114___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_1CA50C000, v0, v1, "(%ld) Error in getting long inactivity prediction at date %@ with time since inactive %.2f synchronously: %@");
}

void __63___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in overriding the recommended wait time synchronously: %@", v2, v3, v4, v5, v6);
}

void __59___OSInactivityPredictionClient_restoreRecommendedWaitTime__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in restoring the recommended wait time synchronously: %@", v2, v3, v4, v5, v6);
}

void __55___OSInactivityPredictionClient_restoreInactivityModel__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in restoring the appropriate inactivity predictor variant synchronously: %@", v2, v3, v4, v5, v6);
}

void __45___OSInactivityPredictionClient_backedUpData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in obtaining backup data synchronously: %@", v2, v3, v4, v5, v6);
}

void __64___OSInactivityPredictionClient_recommendedWaitTimeWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in getting the recommended wait time since initial inactivity: %@", v2, v3, v4, v5, v6);
}

void __61___OSInactivityPredictionClient_modelDescriptionWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in getting inactivity predictor description: %@", v2, v3, v4, v5, v6);
}

void __58___OSInactivityPredictionClient_modelMetadataWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in getting inactivity predictor metadata: %@", v2, v3, v4, v5, v6);
}

void __71___OSInactivityPredictionClient_inactivityHistoryDiagnosisWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in diagnozing user inactivity history: %@", v2, v3, v4, v5, v6);
}

void __71___OSInactivityPredictionClient_hasEnoughInactivityHistoryWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in checking user history sufficiency: %@", v2, v3, v4, v5, v6);
}

void __65___OSInactivityPredictionClient_deviceUsageDiagnosisWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in diagnozing the device usage frequency: %@", v2, v3, v4, v5, v6);
}

void __87___OSInactivityPredictionClient_longInactivityPredictionResultWithOptions_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_1CA50C000, v0, v1, "(%ld) Error in getting long inactivity prediction: %@");
}

void __116___OSInactivityPredictionClient_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_1CA50C000, v0, v1, "(%ld) Error in getting long inactivity prediction at date %@ with time since inactive %.2f: %@");
}

void __75___OSInactivityPredictionClient_overrideRecommendedWaitTimeTo_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in overriding the recommended wait time: %@", v2, v3, v4, v5, v6);
}

void __71___OSInactivityPredictionClient_restoreRecommendedWaitTimeWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in restoring the recommended wait time: %@", v2, v3, v4, v5, v6);
}

void __67___OSInactivityPredictionClient_restoreInactivityModelWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in restoring the appropriate inactivity predictor variant: %@", v2, v3, v4, v5, v6);
}

void __57___OSInactivityPredictionClient_backedUpDataWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in obtaining backup data: %@", v2, v3, v4, v5, v6);
}

@end