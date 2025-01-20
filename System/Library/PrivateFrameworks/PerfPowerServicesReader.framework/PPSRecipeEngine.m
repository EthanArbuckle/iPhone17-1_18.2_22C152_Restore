@interface PPSRecipeEngine
+ (id)recipeHandlers;
+ (id)sharedInstance;
- (NSMutableDictionary)eventRecipeHandlers;
- (NSMutableDictionary)metricRecipeHandlers;
- (NSMutableDictionary)timeSeriesRecipeHandlers;
- (PPSRecipeEngine)init;
- (id)createEventRecipeForMetric:(id)a3;
- (id)createMetricRecipeForMetric:(id)a3;
- (id)createTimeSeriesRecipeForMetric:(id)a3;
- (id)executeEventRecipe:(id)a3 on:(id)a4 metrics:(id)a5 error:(id *)a6;
- (id)executeMetricRecipe:(id)a3 on:(id)a4 metric:(id)a5 error:(id *)a6;
- (id)executeTimeSeriesRecipe:(id)a3 on:(id)a4 metrics:(id)a5 error:(id *)a6;
- (void)registerHandlersForClass:(Class)a3;
- (void)setEventRecipeHandlers:(id)a3;
- (void)setMetricRecipeHandlers:(id)a3;
- (void)setTimeSeriesRecipeHandlers:(id)a3;
- (void)setupHandlers;
@end

@implementation PPSRecipeEngine

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_recipeEngine;
  return v2;
}

uint64_t __33__PPSRecipeEngine_sharedInstance__block_invoke()
{
  sharedInstance_recipeEngine = objc_alloc_init(PPSRecipeEngine);
  return MEMORY[0x270F9A758]();
}

- (id)createEventRecipeForMetric:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = NSString;
    v7 = [v4 subsystem];
    v8 = [v5 category];
    v9 = [v6 stringWithFormat:@"%@::%@", v7, v8];
  }
  else
  {
    v10 = PPSReaderLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine createEventRecipeForMetric:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v9 = 0;
  }
  v18 = [(PPSRecipeEngine *)self eventRecipeHandlers];
  v19 = [v18 objectForKeyedSubscript:v9];
  if (v19) {
    v20 = v9;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

- (id)createMetricRecipeForMetric:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = NSString;
    v7 = [v4 subsystem];
    v8 = [v5 category];
    v9 = [v5 name];
    v10 = [v6 stringWithFormat:@"%@::%@::%@", v7, v8, v9];
  }
  else
  {
    uint64_t v11 = PPSReaderLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine createEventRecipeForMetric:](v11, v12, v13, v14, v15, v16, v17, v18);
    }

    v10 = 0;
  }
  v19 = [(PPSRecipeEngine *)self metricRecipeHandlers];
  v20 = [v19 objectForKeyedSubscript:v10];
  if (v20) {
    id v21 = v10;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  return v22;
}

- (id)createTimeSeriesRecipeForMetric:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = NSString;
    v7 = [v4 subsystem];
    v8 = [v5 category];
    v9 = [v6 stringWithFormat:@"%@::%@", v7, v8];
  }
  else
  {
    v10 = PPSReaderLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine createEventRecipeForMetric:](v10, v11, v12, v13, v14, v15, v16, v17);
    }

    v9 = 0;
  }
  uint64_t v18 = [(PPSRecipeEngine *)self timeSeriesRecipeHandlers];
  v19 = [v18 objectForKeyedSubscript:v9];
  if (v19) {
    v20 = v9;
  }
  else {
    v20 = 0;
  }
  id v21 = v20;

  return v21;
}

- (id)executeEventRecipe:(id)a3 on:(id)a4 metrics:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(PPSRecipeEngine *)self eventRecipeHandlers];
  uint64_t v14 = [v13 objectForKeyedSubscript:v10];

  if (!v14)
  {
    uint64_t v15 = [NSString stringWithFormat:@"Curated event recipe is not supported %@", v10];
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29[0] = v15;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
    *a6 = [v17 errorWithDomain:@"com.apple.PPSRecipeEngine" code:3 userInfo:v18];

    v19 = PPSReaderLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine executeEventRecipe:on:metrics:error:]((uint64_t)v10, v19, v20, v21, v22, v23, v24, v25);
    }

    goto LABEL_9;
  }
  uint64_t v15 = ((void (**)(void, id, id, id *))v14)[2](v14, v11, v12, a6);
  if (*a6)
  {
    uint64_t v16 = PPSReaderLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine executeEventRecipe:on:metrics:error:]();
    }

LABEL_9:
    v26 = 0;
    goto LABEL_11;
  }
  v26 = (void *)[v11 copy];
  [v26 setMetrics:v15];
LABEL_11:

  return v26;
}

- (id)executeMetricRecipe:(id)a3 on:(id)a4 metric:(id)a5 error:(id *)a6
{
  v28[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(PPSRecipeEngine *)self metricRecipeHandlers];
  uint64_t v14 = [v13 objectForKeyedSubscript:v10];

  if (v14)
  {
    uint64_t v15 = ((void (**)(void, id, id, id *))v14)[2](v14, v11, v12, a6);
    if (!*a6) {
      goto LABEL_9;
    }
    uint64_t v16 = PPSReaderLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine executeMetricRecipe:on:metric:error:]();
    }
  }
  else
  {
    uint64_t v16 = [NSString stringWithFormat:@"Curated metric recipe is not supported %@", v10];
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    v28[0] = v16;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    *a6 = [v17 errorWithDomain:@"com.apple.PPSRecipeEngine" code:3 userInfo:v18];

    v19 = PPSReaderLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine executeMetricRecipe:on:metric:error:]((uint64_t)v10, v19, v20, v21, v22, v23, v24, v25);
    }

    uint64_t v15 = 0;
  }

LABEL_9:
  return v15;
}

- (id)executeTimeSeriesRecipe:(id)a3 on:(id)a4 metrics:(id)a5 error:(id *)a6
{
  v28[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(PPSRecipeEngine *)self timeSeriesRecipeHandlers];
  uint64_t v14 = [v13 objectForKeyedSubscript:v10];

  if (v14)
  {
    uint64_t v15 = ((void (**)(void, id, id, id *))v14)[2](v14, v11, v12, a6);
    if (!*a6) {
      goto LABEL_9;
    }
    uint64_t v16 = PPSReaderLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine executeMetricRecipe:on:metric:error:]();
    }
  }
  else
  {
    uint64_t v16 = [NSString stringWithFormat:@"Curated time series recipe is not supported %@", v10];
    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    v28[0] = v16;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    *a6 = [v17 errorWithDomain:@"com.apple.PPSRecipeEngine" code:3 userInfo:v18];

    v19 = PPSReaderLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PPSRecipeEngine executeMetricRecipe:on:metric:error:]((uint64_t)v10, v19, v20, v21, v22, v23, v24, v25);
    }

    uint64_t v15 = 0;
  }

LABEL_9:
  return v15;
}

- (PPSRecipeEngine)init
{
  v5.receiver = self;
  v5.super_class = (Class)PPSRecipeEngine;
  v2 = [(PPSRecipeEngine *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PPSRecipeEngine *)v2 setupHandlers];
  }
  return v3;
}

- (void)setupHandlers
{
  v3 = (NSMutableDictionary *)objc_opt_new();
  eventRecipeHandlers = self->_eventRecipeHandlers;
  self->_eventRecipeHandlers = v3;

  objc_super v5 = (NSMutableDictionary *)objc_opt_new();
  metricRecipeHandlers = self->_metricRecipeHandlers;
  self->_metricRecipeHandlers = v5;

  v7 = (NSMutableDictionary *)objc_opt_new();
  timeSeriesRecipeHandlers = self->_timeSeriesRecipeHandlers;
  self->_timeSeriesRecipeHandlers = v7;

  v9 = +[PPSRecipeEngine recipeHandlers];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __32__PPSRecipeEngine_setupHandlers__block_invoke;
  v10[3] = &unk_2654434D8;
  v10[4] = self;
  [v9 enumerateObjectsUsingBlock:v10];
}

uint64_t __32__PPSRecipeEngine_setupHandlers__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerHandlersForClass:a2];
}

- (void)registerHandlersForClass:(Class)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  objc_super v5 = [(objc_class *)a3 eventRecipes];
  v36 = [(objc_class *)a3 metricRecipes];
  v37 = [(objc_class *)a3 timeSeriesRecipes];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v47 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        id v12 = [(PPSRecipeEngine *)self eventRecipeHandlers];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];

        if (v13)
        {
          uint64_t v14 = PPSReaderLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = v11;
            _os_log_error_impl(&dword_258F16000, v14, OS_LOG_TYPE_ERROR, "Attempting to register duplicate handler for %@, skipping", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v14 = [v6 objectForKeyedSubscript:v11];
          uint64_t v15 = [(PPSRecipeEngine *)self eventRecipeHandlers];
          [v15 setObject:v14 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v8);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = v36;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v42 + 1) + 8 * j);
        uint64_t v22 = [(PPSRecipeEngine *)self metricRecipeHandlers];
        uint64_t v23 = [v22 objectForKeyedSubscript:v21];

        if (v23)
        {
          uint64_t v24 = PPSReaderLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = v21;
            _os_log_error_impl(&dword_258F16000, v24, OS_LOG_TYPE_ERROR, "Attempting to register duplicate handler for %@, skipping", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v24 = [v16 objectForKeyedSubscript:v21];
          uint64_t v25 = [(PPSRecipeEngine *)self metricRecipeHandlers];
          [v25 setObject:v24 forKeyedSubscript:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v18);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v26 = v37;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v39 != v29) {
          objc_enumerationMutation(v26);
        }
        uint64_t v31 = *(void *)(*((void *)&v38 + 1) + 8 * k);
        v32 = [(PPSRecipeEngine *)self timeSeriesRecipeHandlers];
        v33 = [v32 objectForKeyedSubscript:v31];

        if (v33)
        {
          v34 = PPSReaderLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = v31;
            _os_log_error_impl(&dword_258F16000, v34, OS_LOG_TYPE_ERROR, "Attempting to register duplicate handler for %@, skipping", buf, 0xCu);
          }
        }
        else
        {
          v34 = [v26 objectForKeyedSubscript:v31];
          v35 = [(PPSRecipeEngine *)self timeSeriesRecipeHandlers];
          [v35 setObject:v34 forKeyedSubscript:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v28);
  }
}

+ (id)recipeHandlers
{
  if (recipeHandlers_onceToken != -1) {
    dispatch_once(&recipeHandlers_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)recipeHandlers_recipeHandlers;
  return v2;
}

void __33__PPSRecipeEngine_recipeHandlers__block_invoke()
{
  v0 = objc_opt_new();
  [v0 addObject:NSClassFromString(&cfstr_Ppsbasebandrec.isa)];
  [v0 addObject:NSClassFromString(&cfstr_Ppsmodelurlrec.isa)];
  v1 = (void *)recipeHandlers_recipeHandlers;
  recipeHandlers_recipeHandlers = (uint64_t)v0;
}

- (NSMutableDictionary)eventRecipeHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventRecipeHandlers:(id)a3
{
}

- (NSMutableDictionary)metricRecipeHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetricRecipeHandlers:(id)a3
{
}

- (NSMutableDictionary)timeSeriesRecipeHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTimeSeriesRecipeHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSeriesRecipeHandlers, 0);
  objc_storeStrong((id *)&self->_metricRecipeHandlers, 0);
  objc_storeStrong((id *)&self->_eventRecipeHandlers, 0);
}

- (void)createEventRecipeForMetric:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executeEventRecipe:(uint64_t)a3 on:(uint64_t)a4 metrics:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executeEventRecipe:on:metrics:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_258F16000, v0, v1, "Error fetching response for event recipe: %@ error: %@");
}

- (void)executeMetricRecipe:(uint64_t)a3 on:(uint64_t)a4 metric:(uint64_t)a5 error:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)executeMetricRecipe:on:metric:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_258F16000, v0, v1, "Error fetching response for metric recipe: %@ error: %@");
}

@end