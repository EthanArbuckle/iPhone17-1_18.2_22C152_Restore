@interface MTFinalValidationFilter
- (BOOL)shouldApplyDeRes;
- (id)apply:(id)a3;
- (void)setShouldApplyDeRes:(BOOL)a3;
- (void)validateFields:(id)a3;
@end

@implementation MTFinalValidationFilter

- (void)validateFields:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 allKeys];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v34;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v16 = MTConfigurationError(108, @"The created metricsData contains a invalid field name %@", v10, v11, v12, v13, v14, v15, v9);
          [v3 removeObjectForKey:v9];
        }
        v17 = [v3 objectForKeyedSubscript:v9];
        if (([v17 conformsToProtocol:&unk_26C970A48] & 1) == 0)
        {
          uint64_t v18 = objc_opt_class();
          id v25 = MTConfigurationError(108, @"The created metricsData value type '%@' for field name '%@' does not conform to NSCoding protocol", v19, v20, v21, v22, v23, v24, v18);
          [v3 removeObjectForKey:v9];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          if (([MEMORY[0x263F08900] isValidJSONObject:v17] & 1) == 0)
          {
            id v32 = MTConfigurationError(108, @"The created metricsData value for field name %@ can't be serialized", v26, v27, v28, v29, v30, v31, v9);
            [v3 removeObjectForKey:v9];
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v6);
  }
}

- (id)apply:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MTObject *)self metricsKit];
  uint64_t v6 = [v5 config];
  uint64_t v7 = [v6 sources];

  if (v4 && v7)
  {
    v20[0] = v7;
    v20[1] = v4;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    uint64_t v15 = +[MTPromise promiseWithAll:v14];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = (uint64_t)__33__MTFinalValidationFilter_apply___block_invoke;
    v19[3] = (uint64_t)&unk_26430F708;
    v19[4] = (uint64_t)self;
    id v16 = [v15 thenWithBlock:v19];
  }
  else
  {
    v17 = MTError(301, 0, v8, v9, v10, v11, v12, v13, v19[0]);
    id v16 = +[MTPromise promiseWithError:v17];
  }

  return v16;
}

id __33__MTFinalValidationFilter_apply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v3 objectAtIndexedSubscript:1];

  uint64_t v6 = [v5 objectForKeyedSubscript:@"eventType"];
  uint64_t v7 = [*(id *)(a1 + 32) metricsKit];
  uint64_t v8 = [v7 config];
  int v9 = [v8 metricsDisabledOrDenylistedEvent:v6 sources:v4];

  if (v9)
  {
    id v16 = MTError(300, @"Metrics collection has been disabled or the event type %@ has been denylisted.", v10, v11, v12, v13, v14, v15, (uint64_t)v6);
    v17 = +[MTPromise promiseWithError:v16];
  }
  else
  {
    id v16 = (void *)[v5 mutableCopy];
    uint64_t v18 = [*(id *)(a1 + 32) metricsKit];
    uint64_t v19 = [v18 config];
    [v19 removeDenylistedFields:v16 sources:v4];

    if ([*(id *)(a1 + 32) shouldApplyDeRes])
    {
      uint64_t v20 = [*(id *)(a1 + 32) metricsKit];
      uint64_t v21 = [v20 config];
      [v21 applyDeRes:v16 sources:v4];

      objc_msgSend(v16, "mt_removeNaNValues");
    }
    [*(id *)(a1 + 32) validateFields:v16];
    if ([v16 count])
    {
      uint64_t v28 = (void *)[v16 copy];
      +[MTPromise promiseWithResult:v28];
    }
    else
    {
      uint64_t v28 = MTError(302, @"Event data is empty because all fields have been denylisted.", v22, v23, v24, v25, v26, v27, v30);
      +[MTPromise promiseWithError:v28];
    v17 = };
  }

  return v17;
}

- (BOOL)shouldApplyDeRes
{
  return self->_shouldApplyDeRes;
}

- (void)setShouldApplyDeRes:(BOOL)a3
{
  self->_shouldApplyDeRes = a3;
}

@end