@interface OSChargingPredictor
@end

@implementation OSChargingPredictor

void __38___OSChargingPredictor_initConnection__block_invoke(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38___OSChargingPredictor_initConnection__block_invoke_cold_1(v3);
    }
  }
}

void __38___OSChargingPredictor_initConnection__block_invoke_55(uint64_t a1)
{
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38___OSChargingPredictor_initConnection__block_invoke_55_cold_1(v3);
    }
    [v2 handleInterruption];
  }
}

void __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_cold_1(a1);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_59_cold_1(a1);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
}

void __39___OSChargingPredictor_fixModelOutput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39___OSChargingPredictor_fixModelOutput___block_invoke_cold_1();
  }
}

void __39___OSChargingPredictor_fixModelOutput___block_invoke_61(uint64_t a1, void *a2)
{
}

void __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke_cold_1();
  }
}

void __40___OSChargingPredictor_unfixModelOutput__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __40___OSChargingPredictor_unfixModelOutput__block_invoke_cold_1();
  }
}

void __40___OSChargingPredictor_unfixModelOutput__block_invoke_63(uint64_t a1, void *a2)
{
}

void __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke_cold_1();
  }
}

void __38___OSChargingPredictor_initConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CA50C000, log, OS_LOG_TYPE_ERROR, "Connection to charging predictor invalidated", v1, 2u);
}

void __38___OSChargingPredictor_initConnection__block_invoke_55_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CA50C000, log, OS_LOG_TYPE_ERROR, "Connection to charging predictor interrupted", v1, 2u);
}

void __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1CA50C000, v2, v3, "Error executing %@: %@", v4, v5, v6, v7, v8);
}

void __65___OSChargingPredictor_chargePredictionOutputOfScheme_withError___block_invoke_59_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1CA50C000, v2, v3, "Error executing %@: %@", v4, v5, v6, v7, v8);
}

void __39___OSChargingPredictor_fixModelOutput___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in fixing model output: %@ synchronously", v2, v3, v4, v5, v6);
}

void __51___OSChargingPredictor_fixModelOutput_withHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in fixing model output: %@", v2, v3, v4, v5, v6);
}

void __40___OSChargingPredictor_unfixModelOutput__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in unfixing model output synchronously: %@", v2, v3, v4, v5, v6);
}

void __52___OSChargingPredictor_unfixModelOutputWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CA50C000, v0, v1, "Error in unfixing model output: %@", v2, v3, v4, v5, v6);
}

@end