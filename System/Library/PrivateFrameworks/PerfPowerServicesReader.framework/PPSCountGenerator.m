@interface PPSCountGenerator
+ (id)countMapWithTimeSeries:(id)a3 block:(id)a4 groupingDimensions:(id)a5;
+ (id)countWithTimeSeries:(id)a3 block:(id)a4;
@end

@implementation PPSCountGenerator

+ (id)countWithTimeSeries:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    id v19 = &unk_270714818;
    v9 = [v5 array];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __47__PPSCountGenerator_countWithTimeSeries_block___block_invoke;
    v11[3] = &unk_2654431D0;
    id v12 = v7;
    v13 = &v14;
    [v9 enumerateObjectsUsingBlock:v11];

    id v8 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }
  return v8;
}

void __47__PPSCountGenerator_countWithTimeSeries_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v2 = NSNumber;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) doubleValue];
    double v4 = v3;
    [v9 doubleValue];
    uint64_t v6 = [v2 numberWithDouble:v4 + v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

+ (id)countMapWithTimeSeries:(id)a3 block:(id)a4 groupingDimensions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  id v12 = 0;
  if (v8 && v9 && v10)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    id v26 = [MEMORY[0x263EFF9A0] dictionary];
    v13 = [v8 array];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke;
    v15[3] = &unk_265443248;
    id v16 = v11;
    id v19 = &v21;
    id v20 = a1;
    id v17 = v8;
    id v18 = v9;
    [v13 enumerateObjectsUsingBlock:v15];

    id v12 = (void *)[(id)v22[5] copy];
    _Block_object_dispose(&v21, 8);
  }
  return v12;
}

void __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = objc_opt_new();
  double v5 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke_2;
  v17[3] = &unk_2654431F8;
  id v6 = v3;
  id v18 = v6;
  id v7 = v4;
  id v19 = v7;
  [v5 enumerateObjectsUsingBlock:v17];
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v9 = (void *)MEMORY[0x263F08A98];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke_3;
    v15[3] = &unk_265443220;
    id v10 = v7;
    id v16 = v10;
    v11 = [v9 predicateWithBlock:v15];
    id v12 = *(void **)(a1 + 64);
    v13 = [*(id *)(a1 + 40) filteredTimeSeriesUsingPredicate:v11];
    uint64_t v14 = [v12 countWithTimeSeries:v13 block:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v14 forKeyedSubscript:v10];
  }
}

void __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = NSString;
  double v4 = [*(id *)(a1 + 32) metricKeysAndValues];
  double v5 = [v10 groupBy];
  id v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = [v3 stringWithFormat:@"%@", v6];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v10 groupBy];
    [v8 setObject:v7 forKeyedSubscript:v9];
  }
}

uint64_t __69__PPSCountGenerator_countMapWithTimeSeries_block_groupingDimensions___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        id v10 = objc_msgSend(v3, "metricKeysAndValues", (void)v16);
        v11 = [v10 objectForKeyedSubscript:v9];
        id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
        int v13 = [v11 isEqual:v12];

        if (!v13)
        {
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_11:

  return v14;
}

@end