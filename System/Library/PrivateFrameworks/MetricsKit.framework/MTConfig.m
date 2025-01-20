@interface MTConfig
- (BOOL)_isEventDataTimeoutUnset;
- (BOOL)disabledForSources:(id)a3;
- (BOOL)metricsDisabledOrDenylistedEvent:(id)a3 sources:(id)a4;
- (MTConfigDelegate)delegate;
- (NSDictionary)debugSource;
- (id)computeWithConfigSources:(id)a3;
- (id)configValueForKeyPath:(id)a3 default:(id)a4;
- (id)configValueForKeyPath:(id)a3 sources:(id)a4;
- (id)deResFieldsForSources:(id)a3;
- (id)denylistedEventsForSources:(id)a3;
- (id)denylistedFieldsForSources:(id)a3;
- (id)injectedSource;
- (id)sources;
- (int64_t)eventDataTimeout;
- (void)applyDeRes:(id)a3 sources:(id)a4;
- (void)removeDenylistedFields:(id)a3 sources:(id)a4;
- (void)setDebugSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventDataTimeout:(int64_t)a3;
@end

@implementation MTConfig

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(MTObject *)self metricsKit];
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained setMetricsKit:v8];
  }
}

- (id)injectedSource
{
  id v2 = [(MTConfig *)self debugSource];
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = [v3 objectForKey:@"MetricsKitConfigOverrides"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x263F08900];
    v6 = [v4 dataUsingEncoding:4];
    uint64_t v7 = [v5 JSONObjectWithData:v6 options:0 error:0];

    v4 = (void *)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v2)
    {
      id v8 = (void *)[v2 mutableCopy];
      [v8 addEntriesFromDictionary:v4];
      uint64_t v9 = [v8 copy];

      id v2 = (id)v9;
    }
    else
    {
      id v2 = v4;
    }
  }

  return v2;
}

- (id)sources
{
  v3 = [(MTConfig *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v11 = [(MTConfig *)self delegate];
    v12 = [v11 sources];

    v13 = [(MTConfig *)self delegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v15 = [(MTObject *)self metricsKit];
      v16 = [v15 topic];

      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __19__MTConfig_sources__block_invoke;
      v25[3] = &unk_26430F708;
      id v26 = v16;
      id v17 = v16;
      uint64_t v18 = [v12 thenWithBlock:v25];

      v12 = (void *)v18;
    }
  }
  else
  {
    v19 = MTConfigurationError(101, @"The method \"%s\" must be implemented in MTConfigDelegate.", v5, v6, v7, v8, v9, v10, (uint64_t)"-[MTConfig sources]");
    v12 = +[MTPromise promiseWithError:v19];
  }
  v20 = [(MTConfig *)self injectedSource];
  if ([v20 count])
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __19__MTConfig_sources__block_invoke_2;
    v23[3] = &unk_26430F708;
    id v24 = v20;
    uint64_t v21 = [v12 thenWithBlock:v23];

    v12 = (void *)v21;
  }

  return v12;
}

id __19__MTConfig_sources__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 firstObject];
  uint64_t v5 = +[MTReflectUtil objectAsDictionary:v4];
  uint64_t v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v7)
  {
    uint64_t v8 = [v3 arrayByAddingObject:v7];

    id v3 = (id)v8;
  }
  uint64_t v9 = +[MTPromise promiseWithResult:v3];

  return v9;
}

id __19__MTConfig_sources__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 arrayByAddingObject:*(void *)(a1 + 32)];
  id v3 = +[MTPromise promiseWithResult:v2];

  return v3;
}

- (BOOL)_isEventDataTimeoutUnset
{
  return self->_eventDataTimeout == 0;
}

- (int64_t)eventDataTimeout
{
  if ([(MTConfig *)self _isEventDataTimeoutUnset])
  {
    objc_initWeak(&location, self);
    id v3 = [(MTConfig *)self sources];
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    uint64_t v7 = __28__MTConfig_eventDataTimeout__block_invoke;
    uint64_t v8 = &unk_26430F730;
    objc_copyWeak(&v9, &location);
    [v3 addFinishBlock:&v5];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if ([(MTConfig *)self _isEventDataTimeoutUnset]) {
    return 10000;
  }
  else {
    return self->_eventDataTimeout;
  }
}

void __28__MTConfig_eventDataTimeout__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = [WeakRetained _isEventDataTimeoutUnset];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    uint64_t v7 = [v6 configValueForKeyPath:@"eventDataTimeout" sources:v12];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    double v9 = 0.0;
    if (isKindOfClass) {
      objc_msgSend(v7, "doubleValue", 0.0);
    }
    if (v9 == 0.0) {
      double v9 = 10000.0;
    }
    uint64_t v10 = (uint64_t)v9;
    id v11 = objc_loadWeakRetained(v3);
    [v11 setEventDataTimeout:v10];
  }
}

- (id)configValueForKeyPath:(id)a3 sources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTConfig *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(MTConfig *)self delegate];
    id v11 = [v10 configValueForKeyPath:v6 sources:v7];
  }
  else
  {
    uint64_t v12 = [v7 count];
    if (v12 - 1 < 0)
    {
LABEL_7:
      id v11 = 0;
    }
    else
    {
      uint64_t v13 = v12;
      while (1)
      {
        v14 = [v7 objectAtIndex:--v13];
        id v11 = objc_msgSend(v14, "mt_nullableValueForKeyPath:", v6);

        if (v11) {
          break;
        }
        if (v13 <= 0) {
          goto LABEL_7;
        }
      }
    }
  }

  return v11;
}

- (BOOL)disabledForSources:(id)a3
{
  id v3 = [(MTConfig *)self configValueForKeyPath:@"disabled" sources:a3];
  BOOL v4 = +[MTReflectUtil objectAsBool:v3];

  return v4;
}

- (id)denylistedEventsForSources:(id)a3
{
  id v4 = a3;
  int v5 = [(MTConfig *)self configValueForKeyPath:@"blacklistedEvents" sources:v4];
  id v6 = +[MTReflectUtil objectAsArray:v5];
  id v7 = [(MTConfig *)self configValueForKeyPath:@"denylistedEvents" sources:v4];

  uint64_t v8 = +[MTReflectUtil objectAsArray:v7];
  char v9 = [v6 arrayByAddingObjectsFromArray:v8];

  return v9;
}

- (id)denylistedFieldsForSources:(id)a3
{
  id v4 = a3;
  int v5 = [(MTConfig *)self configValueForKeyPath:@"blacklistedFields" sources:v4];
  id v6 = +[MTReflectUtil objectAsArray:v5];
  id v7 = [(MTConfig *)self configValueForKeyPath:@"denylistedFields" sources:v4];

  uint64_t v8 = +[MTReflectUtil objectAsArray:v7];
  char v9 = [v6 arrayByAddingObjectsFromArray:v8];

  return v9;
}

- (id)deResFieldsForSources:(id)a3
{
  id v3 = [(MTConfig *)self configValueForKeyPath:@"deResFields" sources:a3];
  id v4 = +[MTReflectUtil objectAsArray:v3];

  return v4;
}

- (BOOL)metricsDisabledOrDenylistedEvent:(id)a3 sources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MTConfig *)self disabledForSources:v7])
  {
    char v8 = 1;
  }
  else if (v6)
  {
    char v9 = [(MTConfig *)self denylistedEventsForSources:v7];
    char v8 = [v9 containsObject:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)removeDenylistedFields:(id)a3 sources:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(MTConfig *)self denylistedFieldsForSources:v6];
    [v8 removeObjectsForKeys:v7];
  }
}

- (void)applyDeRes:(id)a3 sources:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    [(MTConfig *)self deResFieldsForSources:a4];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = +[MTReflectUtil objectAsDictionary:*(void *)(*((void *)&v19 + 1) + 8 * v10)];
          uint64_t v12 = [v11 objectForKeyedSubscript:@"fieldName"];
          uint64_t v13 = [v6 objectForKeyedSubscript:v12];

          if (v13)
          {
            v14 = [v6 objectForKeyedSubscript:v12];
            v15 = [v11 objectForKeyedSubscript:@"magnitude"];
            v16 = [v11 objectForKeyedSubscript:@"significantDigits"];
            id v17 = +[MTNumberUtil deResNumber:v14 magnitude:v15 significantDigits:v16];
            [v6 setObject:v17 forKeyedSubscript:v12];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
}

- (id)computeWithConfigSources:(id)a3
{
  id v4 = a3;
  int v5 = [(MTConfig *)self sources];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__MTConfig_computeWithConfigSources___block_invoke;
  v9[3] = &unk_26430F758;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 thenWithBlock:v9];

  return v7;
}

id __37__MTConfig_computeWithConfigSources___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v1)
  {
    id v2 = +[MTPromise promiseWithResult:v1];
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9D0] null];
    id v2 = +[MTPromise promiseWithResult:v3];
  }

  return v2;
}

- (id)configValueForKeyPath:(id)a3 default:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MTConfig *)self sources];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__MTConfig_configValueForKeyPath_default___block_invoke;
  v17[3] = &unk_26430F780;
  v17[4] = self;
  id v18 = v6;
  id v9 = v7;
  id v19 = v9;
  id v10 = v6;
  id v11 = [v8 thenWithBlock:v17];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__MTConfig_configValueForKeyPath_default___block_invoke_2;
  v15[3] = &unk_26430F7A8;
  id v16 = v9;
  id v12 = v9;
  uint64_t v13 = [v11 catchWithBlock:v15];

  return v13;
}

id __42__MTConfig_configValueForKeyPath_default___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) configValueForKeyPath:*(void *)(a1 + 40) sources:a2];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = *(void **)(a1 + 48);
  }
  int v5 = +[MTPromise promiseWithResult:v4];

  return v5;
}

MTPromise *__42__MTConfig_configValueForKeyPath_default___block_invoke_2(uint64_t a1)
{
  return +[MTPromise promiseWithResult:*(void *)(a1 + 32)];
}

- (MTConfigDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTConfigDelegate *)WeakRetained;
}

- (void)setEventDataTimeout:(int64_t)a3
{
  self->_eventDataTimeout = a3;
}

- (NSDictionary)debugSource
{
  return self->_debugSource;
}

- (void)setDebugSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end