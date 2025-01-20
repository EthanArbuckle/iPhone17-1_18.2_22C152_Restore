@interface PPSBasebandRecipeHandler
+ (id)basebandEventRecipe;
+ (id)basebandHistogramRecipe;
+ (id)eventRecipes;
+ (id)formatBins:(id)a3;
+ (id)metricRecipes;
+ (id)timeSeriesRecipes;
@end

@implementation PPSBasebandRecipeHandler

+ (id)eventRecipes
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)metricRecipes
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)timeSeriesRecipes
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"BasebandMetrics::Events";
  v3 = [a1 basebandEventRecipe];
  v7[1] = @"BasebandMetrics::Histogram";
  v8[0] = v3;
  v4 = [a1 basebandHistogramRecipe];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)basebandEventRecipe
{
  return &__block_literal_global_5;
}

PPSTimeSeries *__47__PPSBasebandRecipeHandler_basebandEventRecipe__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v28 = a3;
  v26 = objc_alloc_init(PPSTimeSeries);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v10 = [v9 metrics];
        v11 = [v10 objectForKeyedSubscript:@"data"];

        if (v11)
        {
          v12 = [v9 metrics];
          v13 = [v12 objectForKeyedSubscript:@"data"];
          v14 = [v28 objectForKeyedSubscript:@"data"];
          v15 = +[PPSBasebandDecoder decodeValue:v13 withMetric:v14];
          v16 = (void *)[v15 mutableCopy];

          if (v16)
          {
            v17 = [v16 objectForKeyedSubscript:@"metric_name"];
            [v16 removeObjectForKey:@"metric_name"];
            [v9 monotonicTimestamp];
            double v19 = v18;
            [v9 timeOffset];
            double v21 = v20;
            uint64_t v22 = [v9 groupId];
            v23 = [v9 label];
            v24 = +[PPSEvent eventWithMonotonicTimestamp:v16 timeOffset:v22 dictionary:v23 groupId:v19 label:v21];

            [v24 setLabel:v17];
            [(PPSTimeSeries *)v26 addEvent:v24];
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  return v26;
}

+ (id)basebandHistogramRecipe
{
  return &__block_literal_global_15;
}

PPSTimeSeries *__51__PPSBasebandRecipeHandler_basebandHistogramRecipe__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v42 = a3;
  v39 = objc_alloc_init(PPSTimeSeries);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v4;
  uint64_t v37 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v56;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v56 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v5;
        uint64_t v6 = *(void **)(*((void *)&v55 + 1) + 8 * v5);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v44 = [v6 metrics];
        uint64_t v7 = [v44 countByEnumeratingWithState:&v51 objects:v60 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v52;
          uint64_t v40 = *(void *)v52;
          v41 = v6;
          do
          {
            uint64_t v10 = 0;
            uint64_t v43 = v8;
            do
            {
              if (*(void *)v52 != v9) {
                objc_enumerationMutation(v44);
              }
              v11 = *(void **)(*((void *)&v51 + 1) + 8 * v10);
              if ([v11 hasPrefix:@"data"])
              {
                uint64_t v46 = v10;
                v12 = [v6 metrics];
                v13 = [v12 objectForKeyedSubscript:v11];
                v14 = [v42 objectForKeyedSubscript:@"data"];
                v15 = +[PPSBasebandDecoder decodeValue:v13 withMetric:v14];
                v16 = (void *)[v15 mutableCopy];

                if (v16)
                {
                  v45 = [v16 objectForKeyedSubscript:@"metric_name"];
                  [v16 removeObjectForKey:@"metric_name"];
                  long long v49 = 0u;
                  long long v50 = 0u;
                  long long v47 = 0u;
                  long long v48 = 0u;
                  v17 = (void *)[v16 copy];
                  uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v59 count:16];
                  if (v18)
                  {
                    uint64_t v19 = v18;
                    uint64_t v20 = *(void *)v48;
                    do
                    {
                      for (uint64_t i = 0; i != v19; ++i)
                      {
                        if (*(void *)v48 != v20) {
                          objc_enumerationMutation(v17);
                        }
                        uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
                        v23 = [v16 objectForKeyedSubscript:v22];
                        objc_opt_class();
                        char isKindOfClass = objc_opt_isKindOfClass();

                        if (isKindOfClass)
                        {
                          v25 = [v16 objectForKeyedSubscript:v22];
                          v26 = +[PPSBasebandRecipeHandler formatBins:v25];
                          [v16 setValuesForKeysWithDictionary:v26];

                          [v16 removeObjectForKey:v22];
                        }
                      }
                      uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v59 count:16];
                    }
                    while (v19);
                  }

                  uint64_t v6 = v41;
                  [v41 monotonicTimestamp];
                  double v28 = v27;
                  [v41 timeOffset];
                  double v30 = v29;
                  uint64_t v31 = [v41 groupId];
                  long long v32 = [v41 label];
                  v33 = +[PPSEvent eventWithMonotonicTimestamp:v16 timeOffset:v31 dictionary:v32 groupId:v28 label:v30];

                  [v33 setLabel:v45];
                  [(PPSTimeSeries *)v39 addEvent:v33];

                  uint64_t v9 = v40;
                }

                uint64_t v8 = v43;
                uint64_t v10 = v46;
              }
              ++v10;
            }
            while (v10 != v8);
            uint64_t v8 = [v44 countByEnumeratingWithState:&v51 objects:v60 count:16];
          }
          while (v8);
        }

        uint64_t v5 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v37);
  }

  return v39;
}

+ (id)formatBins:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__PPSBasebandRecipeHandler_formatBins___block_invoke;
  v15[3] = &unk_2654434B0;
  id v16 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v15];
  v17[0] = @"bin_size";
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v4 count];

  uint64_t v9 = [v7 numberWithUnsignedInteger:v8];
  v17[1] = @"duration_bins";
  v18[0] = v9;
  uint64_t v10 = NSString;
  v11 = [v6 componentsJoinedByString:@","];
  v12 = [v10 stringWithFormat:@"[%@]", v11];
  v18[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v13;
}

void __39__PPSBasebandRecipeHandler_formatBins___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 hasPrefix:@"duration"])
        {
          uint64_t v9 = [v3 objectForKeyedSubscript:v8];
          if ((int)[v9 intValue] < 1)
          {
            v12 = @"-";
          }
          else
          {
            uint64_t v10 = NSString;
            v11 = [v3 objectForKeyedSubscript:v8];
            objc_msgSend(v10, "stringWithFormat:", @"%d", objc_msgSend(v11, "intValue"));
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          [*(id *)(a1 + 32) addObject:v12];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

@end