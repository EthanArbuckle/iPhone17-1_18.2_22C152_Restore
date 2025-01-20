@interface PPSMetricManager
+ (id)allDeclMetrics;
+ (id)allDeclMetricsForSubsystem:(id)a3;
+ (id)allDeclSubsystem;
+ (id)metricDeclMap;
+ (void)metricDeclMap;
@end

@implementation PPSMetricManager

+ (id)metricDeclMap
{
  if (metricDeclMap_onceToken != -1) {
    dispatch_once(&metricDeclMap_onceToken, &__block_literal_global_0);
  }
  v2 = logHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[PPSMetricManager metricDeclMap]();
  }

  v3 = (void *)metricDeclMap_subsystemToDeclClassMap;
  return v3;
}

void __33__PPSMetricManager_metricDeclMap__block_invoke()
{
  v0 = objc_opt_new();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__PPSMetricManager_metricDeclMap__block_invoke_2;
  block[3] = &unk_265440BE8;
  id v5 = v0;
  id v1 = v0;
  objc_enumerateClasses(0, 0, (Protocol *)&unk_2707026B8, 0, block);
  uint64_t v2 = [v1 copy];
  v3 = (void *)metricDeclMap_subsystemToDeclClassMap;
  metricDeclMap_subsystemToDeclClassMap = v2;
}

void __33__PPSMetricManager_metricDeclMap__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [a2 subsystem];
  [v3 setObject:a2 forKeyedSubscript:v4];

  id v5 = logHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __33__PPSMetricManager_metricDeclMap__block_invoke_2_cold_1(a2);
  }
}

+ (id)allDeclSubsystem
{
  uint64_t v2 = [a1 metricDeclMap];
  v3 = [v2 allKeys];

  return v3;
}

+ (id)allDeclMetrics
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [a1 metricDeclMap];
  id v5 = [v4 allValues];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__PPSMetricManager_allDeclMetrics__block_invoke;
  v8[3] = &unk_265440C10;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __34__PPSMetricManager_allDeclMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 conformsToProtocol:&unk_2707026B8])
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v5 allDeclMetrics];
    [v3 addObjectsFromArray:v4];
  }
}

+ (id)allDeclMetricsForSubsystem:(id)a3
{
  id v4 = a3;
  id v5 = [a1 metricDeclMap];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6 && ([v6 conformsToProtocol:&unk_2707026B8] & 1) != 0)
  {
    v7 = [v6 allDeclMetrics];
  }
  else
  {
    v8 = logHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[PPSMetricManager allDeclMetricsForSubsystem:]((uint64_t)v4, v8);
    }

    v7 = 0;
  }

  return v7;
}

+ (void)metricDeclMap
{
  [(id)metricDeclMap_subsystemToDeclClassMap count];
  OUTLINED_FUNCTION_0(&dword_258ED8000, v0, v1, "subsystemToDeclClassMap count is %lu", v2, v3, v4, v5, 0);
}

void __33__PPSMetricManager_metricDeclMap__block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 subsystem];
  OUTLINED_FUNCTION_0(&dword_258ED8000, v2, v3, "subsystemToDeclClassMap class name %@", v4, v5, v6, v7, 2u);
}

+ (void)allDeclMetricsForSubsystem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258ED8000, a2, OS_LOG_TYPE_DEBUG, "No static declaration available for subsystem: %@", (uint8_t *)&v2, 0xCu);
}

@end