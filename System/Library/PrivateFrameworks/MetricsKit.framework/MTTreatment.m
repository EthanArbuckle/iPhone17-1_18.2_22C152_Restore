@interface MTTreatment
+ (MTTreatment)treatmentWithConfigData:(id)a3;
- (MTMetricsDataPredicate)predicate;
- (MTTreatment)initWithConfigDictionary:(id)a3;
- (MTTreatmentAction)eventAction;
- (NSDictionary)fieldActions;
- (id)performTreatment:(id)a3;
- (void)setEventAction:(id)a3;
- (void)setFieldActions:(id)a3;
- (void)setPredicate:(id)a3;
@end

@implementation MTTreatment

+ (MTTreatment)treatmentWithConfigData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (treatmentWithConfigData__onceToken != -1) {
      dispatch_once(&treatmentWithConfigData__onceToken, &__block_literal_global_8);
    }
    id v5 = (id)treatmentWithConfigData__treatmentCache;
    objc_sync_enter(v5);
    v6 = [(id)treatmentWithConfigData__treatmentCache objectForKeyedSubscript:v4];
    if (!v6)
    {
      v6 = [[MTTreatment alloc] initWithConfigDictionary:v4];
      [(id)treatmentWithConfigData__treatmentCache setObject:v6 forKeyedSubscript:v4];
    }
    objc_sync_exit(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __39__MTTreatment_treatmentWithConfigData___block_invoke()
{
  treatmentWithConfigData__treatmentCache = [MEMORY[0x263EFF9A0] dictionary];

  return MEMORY[0x270F9A758]();
}

- (MTTreatment)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTTreatment;
  id v5 = [(MTTreatment *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"filters"];
    v7 = +[MTMetricsDataPredicate predicateWithConfigData:v6];
    [(MTTreatment *)v5 setPredicate:v7];

    v8 = [v4 objectForKeyedSubscript:@"eventActions"];
    v9 = +[MTTreatmentAction treatmentActionWithField:0 configData:v8];
    [(MTTreatment *)v5 setEventAction:v9];

    v10 = [v4 objectForKeyedSubscript:@"fieldActions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __40__MTTreatment_initWithConfigDictionary___block_invoke;
      v15[3] = &unk_26430F3E0;
      id v16 = v11;
      id v12 = v11;
      [v10 enumerateKeysAndObjectsUsingBlock:v15];
      v13 = (void *)[v12 copy];
      [(MTTreatment *)v5 setFieldActions:v13];
    }
  }

  return v5;
}

void __40__MTTreatment_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[MTTreatmentAction treatmentActionWithField:v5 configData:a3];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (id)performTreatment:(id)a3
{
  id v4 = a3;
  id v5 = [[MTTreatmentContext alloc] initWithTreatment:self metrics:v4];
  uint64_t v6 = [(MTTreatment *)self predicate];
  if (!v6
    || (v7 = (void *)v6,
        [(MTTreatment *)self predicate],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 evaluateWithMetricsData:v4],
        v8,
        v7,
        v9))
  {
    v10 = [(MTTreatment *)self eventAction];

    if (v10)
    {
      v11 = [(MTTreatment *)self eventAction];
      [v11 performActionWithContext:v5];
    }
    id v12 = [(MTTreatment *)self fieldActions];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __32__MTTreatment_performTreatment___block_invoke;
    v22[3] = &unk_2643102B8;
    v13 = v5;
    v23 = v13;
    [v12 enumerateKeysAndObjectsUsingBlock:v22];

    v14 = [(MTTreatment *)self fieldActions];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    v19 = __32__MTTreatment_performTreatment___block_invoke_2;
    v20 = &unk_2643102B8;
    v21 = v13;
    [v14 enumerateKeysAndObjectsUsingBlock:&v17];
  }
  v15 = [(MTTreatmentContext *)v5 metrics];

  return v15;
}

void __32__MTTreatment_performTreatment___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v4 = [v5 sourceField];

  if (v4) {
    [v5 performActionWithContext:*(void *)(a1 + 32)];
  }
}

void __32__MTTreatment_performTreatment___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v4 = [v5 sourceField];

  if (!v4) {
    [v5 performActionWithContext:*(void *)(a1 + 32)];
  }
}

- (MTMetricsDataPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (MTTreatmentAction)eventAction
{
  return self->_eventAction;
}

- (void)setEventAction:(id)a3
{
}

- (NSDictionary)fieldActions
{
  return self->_fieldActions;
}

- (void)setFieldActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldActions, 0);
  objc_storeStrong((id *)&self->_eventAction, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end