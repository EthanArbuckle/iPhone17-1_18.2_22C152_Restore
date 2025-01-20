@interface REMLMetricsSet
- (BOOL)addMetrics:(id)a3;
- (REMLMetricsSet)init;
- (id)getMetricsByName:(id)a3;
- (id)name;
- (void)reset;
- (void)updateMetricsFromFeatures:(id)a3 prediction:(id)a4 truth:(id)a5;
@end

@implementation REMLMetricsSet

- (BOOL)addMetrics:(id)a3
{
  id v4 = a3;
  metricsIndex = self->metricsIndex;
  v6 = [v4 name];
  id v7 = [(NSMutableDictionary *)metricsIndex objectForKey:v6];

  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    v8 = self->metricsIndex;
    v9 = [v4 name];
    [(NSMutableDictionary *)v8 setValue:v7 forKey:v9];
  }
  char v10 = [v7 containsObject:v4];
  if ((v10 & 1) == 0)
  {
    [v7 addObject:v4];
    [(NSMutableSet *)self->metricsSet addObject:v4];
  }

  return v10 ^ 1;
}

- (REMLMetricsSet)init
{
  v9.receiver = self;
  v9.super_class = (Class)REMLMetricsSet;
  v2 = [(REMLMetricsSet *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    metricsIndex = v2->metricsIndex;
    v2->metricsIndex = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    metricsSet = v2->metricsSet;
    v2->metricsSet = v5;

    id v7 = v2;
  }

  return v2;
}

- (id)getMetricsByName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->metricsIndex objectForKey:a3];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = [v4 anyObject];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)name
{
  return @"MLMetricsSet";
}

- (void)updateMetricsFromFeatures:(id)a3 prediction:(id)a4 truth:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->metricsSet;
  uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "updateMetricsFromFeatures:prediction:truth:", v8, v9, v10, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)reset
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->metricsSet;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "reset", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metricsSet, 0);
  objc_storeStrong((id *)&self->metricsIndex, 0);
}

@end