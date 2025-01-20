@interface MTMetricsDataPredicate
+ (id)predicateWithConfigData:(id)a3;
+ (id)predicateWithType:(id)a3 argument:(id)a4;
- (BOOL)evaluateWithMetricsData:(id)a3;
- (MTMetricsDataPredicate)initWithConfigDictionary:(id)a3;
- (MTMetricsDataPredicate)initWithFormat:(id)a3;
- (NSDictionary)fieldPredicates;
- (void)setFieldPredicates:(id)a3;
@end

@implementation MTMetricsDataPredicate

+ (id)predicateWithType:(id)a3 argument:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:@"valueMatches"])
  {
    [MEMORY[0x263F08A98] predicateWithFormat:@"self in %@", v6];
  }
  else
  {
    if (![v5 isEqualToString:@"nonEmpty"])
    {
      v8 = 0;
      goto LABEL_10;
    }
    if ([v6 BOOLValue]) {
      v7 = @"self != nil && self != ''";
    }
    else {
      v7 = @"self == nil || self == ''";
    }
    objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", v7, v10);
  v8 = };
LABEL_10:

  return v8;
}

+ (id)predicateWithConfigData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[MTMetricsDataPredicate alloc] initWithConfigDictionary:v3];
LABEL_5:
    id v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [[MTMetricsDataPredicate alloc] initWithFormat:v3];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (MTMetricsDataPredicate)initWithFormat:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTMetricsDataPredicate;
  id v5 = [(MTMetricsDataPredicate *)&v10 init];
  if (v5)
  {
    v12 = @"_";
    id v6 = [MEMORY[0x263F08A98] predicateWithFormat:v4];
    v11 = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    v13[0] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    [(MTMetricsDataPredicate *)v5 setFieldPredicates:v8];
  }
  return v5;
}

- (MTMetricsDataPredicate)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTMetricsDataPredicate;
  id v5 = [(MTMetricsDataPredicate *)&v12 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__MTMetricsDataPredicate_initWithConfigDictionary___block_invoke;
    v10[3] = &unk_26430F3E0;
    id v11 = v6;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v10];
    v8 = (void *)[v7 copy];
    [(MTMetricsDataPredicate *)v5 setFieldPredicates:v8];
  }
  return v5;
}

void __51__MTMetricsDataPredicate_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)MEMORY[0x263EFF980];
    id v8 = v6;
    v9 = objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__MTMetricsDataPredicate_initWithConfigDictionary___block_invoke_2;
    v12[3] = &unk_26430F3E0;
    id v13 = v9;
    id v10 = v9;
    [v8 enumerateKeysAndObjectsUsingBlock:v12];

    id v11 = (void *)[v10 copy];
LABEL_5:

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [MEMORY[0x263F08A98] predicateWithFormat:v6];
    v14[0] = v10;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    goto LABEL_5;
  }
  id v11 = 0;
LABEL_7:
  if ([v11 count]) {
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v5];
  }
}

uint64_t __51__MTMetricsDataPredicate_initWithConfigDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = +[MTMetricsDataPredicate predicateWithType:a2 argument:a3];
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }

  return MEMORY[0x270F9A758]();
}

- (BOOL)evaluateWithMetricsData:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  id v5 = [(MTMetricsDataPredicate *)self fieldPredicates];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__MTMetricsDataPredicate_evaluateWithMetricsData___block_invoke;
  v8[3] = &unk_26430F408;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __50__MTMetricsDataPredicate_evaluateWithMetricsData___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if ([v7 isEqualToString:@"_"])
  {
    id v9 = *(id *)(a1 + 32);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a4 = 1;
    }
    id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  }
  id v10 = v9;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        char v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "evaluateWithObject:", v10, (void)v19);
        uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
        if (*(unsigned char *)(v17 + 24)) {
          char v18 = v16;
        }
        else {
          char v18 = 0;
        }
        *(unsigned char *)(v17 + 24) = v18;
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          *a4 = 1;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
}

- (NSDictionary)fieldPredicates
{
  return self->_fieldPredicates;
}

- (void)setFieldPredicates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end