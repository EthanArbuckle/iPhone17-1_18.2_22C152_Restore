@interface MTEventDataProvider
- (MTEventDataProviderDelegate)delegate;
- (NSArray)additionalData;
- (NSDictionary)knownFieldMethods;
- (SEL)knownFieldAccessorForFieldName:(id)a3;
- (id)flattenAdditionalData;
- (id)knownFieldMethodsForKnownFields:(id)a3;
- (id)knownFields;
- (id)processMetricsData:(id)a3 performanceData:(id)a4;
- (void)addFields:(id)a3;
- (void)addFieldsWithBlock:(id)a3;
- (void)addFieldsWithDictionary:(id)a3;
- (void)addFieldsWithPromise:(id)a3;
- (void)setAdditionalData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setKnownFieldMethods:(id)a3;
@end

@implementation MTEventDataProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalData, 0);
  objc_storeStrong((id *)&self->_knownFieldMethods, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addFields:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MTEventDataProvider *)v5 additionalData];
  v7 = (void *)[v6 mutableCopy];

  if (!v7)
  {
    v7 = [MEMORY[0x263EFF980] array];
  }
  v14 = (id *)&v15;
  id v8 = v4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v7 addObjectsFromArray:v10];
      }
      else {
        [v7 addObject:v10];
      }
      v11 = v14++;
      id v12 = *v11;

      v10 = v12;
    }
    while (v12);
  }
  v13 = objc_msgSend(v7, "mt_condensedArray");
  [(MTEventDataProvider *)v5 setAdditionalData:v13];

  objc_sync_exit(v5);
}

- (void)addFieldsWithDictionary:(id)a3
{
}

- (void)addFieldsWithPromise:(id)a3
{
}

- (void)addFieldsWithBlock:(id)a3
{
  id v4 = (id)MEMORY[0x21D465290](a3, a2);
  -[MTEventDataProvider addFields:](self, "addFields:", v4, 0);
}

- (id)flattenAdditionalData
{
  v2 = [(MTEventDataProvider *)self additionalData];
  v3 = objc_msgSend(v2, "mt_map:", &__block_literal_global_19);

  return v3;
}

id __44__MTEventDataProvider_flattenAdditionalData__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  NSClassFromString(&cfstr_Nsblock.isa);
  if (objc_opt_isKindOfClass())
  {
    v3 = (void (**)(void))MEMORY[0x21D465290](v2);
    id v4 = v3[2]();
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v5 = v4;
    }
    else
    {
      v6 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        int v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_218211000, v6, OS_LOG_TYPE_DEBUG, "MetricsKit: A fields block has returned an unrecognized value: %@.", (uint8_t *)&v8, 0xCu);
      }

      id v5 = (id)MEMORY[0x263EFFA78];
    }
  }
  else
  {
    id v5 = v2;
  }

  return v5;
}

- (NSDictionary)knownFieldMethods
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_knownFieldMethods)
  {
    uint64_t v3 = [(MTEventDataProvider *)v2 knownFields];
    id v4 = (void *)v3;
    if (v3) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = MEMORY[0x263EFFA68];
    }
    uint64_t v6 = [(MTEventDataProvider *)v2 knownFieldMethodsForKnownFields:v5];
    knownFieldMethods = v2->_knownFieldMethods;
    v2->_knownFieldMethods = (NSDictionary *)v6;
  }
  objc_sync_exit(v2);

  int v8 = v2->_knownFieldMethods;

  return v8;
}

- (id)knownFieldMethodsForKnownFields:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    v9 = @"Accessor for field named \"%@\" doesn't return an object.";
    uint64_t v10 = "@";
    do
    {
      uint64_t v11 = 0;
      uint64_t v35 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * v11);
        v13 = [(MTEventDataProvider *)self knownFieldAccessorForFieldName:v12];
        if (v13)
        {
          v14 = v13;
          id v15 = [(MTEventDataProvider *)self methodSignatureForSelector:v13];
          v16 = (const char *)[v15 methodReturnType];
          if (v16 && !strcmp(v16, v10))
          {
            uint64_t v24 = v8;
            id v25 = v5;
            v26 = v9;
            v27 = v10;
            uint64_t v28 = [(MTEventDataProvider *)self methodForSelector:v14];
            v29 = [MTKnownFieldMethod alloc];
            uint64_t v30 = v28;
            uint64_t v10 = v27;
            v9 = v26;
            id v5 = v25;
            uint64_t v8 = v24;
            uint64_t v7 = v35;
            v31 = [(MTKnownFieldMethod *)v29 initWithIMP:v30 accessor:v14];
            [v34 setObject:v31 forKey:v12];
          }
          else
          {
            id v23 = MTConfigurationError(108, v9, v17, v18, v19, v20, v21, v22, v12);
          }
        }
        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v7);
  }

  v32 = [NSDictionary dictionaryWithDictionary:v34];

  return v32;
}

- (id)knownFields
{
  uint64_t v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MTEventDataProvider *)self delegate];
    uint64_t v6 = [v5 knownFields];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)processMetricsData:(id)a3 performanceData:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v6 = a4;
  uint64_t v7 = [(MTEventDataProvider *)self knownFields];
  uint64_t v8 = (void *)v7;
  v9 = (void *)MEMORY[0x263EFFA68];
  if (v7) {
    v9 = (void *)v7;
  }
  id v10 = v9;

  objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v16 = [(MTEventDataProvider *)self knownFieldMethods];
        uint64_t v17 = [v16 objectForKeyedSubscript:v15];

        if (v17)
        {
          uint64_t v18 = (void (*)(MTEventDataProvider *, uint64_t, id))[v17 imp];
          if (v6) {
            double Current = CFAbsoluteTimeGetCurrent();
          }
          else {
            double Current = 0.0;
          }
          uint64_t v20 = v18(self, [v17 accessor], v24);
          if (v6)
          {
            uint64_t v21 = [NSNumber numberWithInteger:(uint64_t)((CFAbsoluteTimeGetCurrent() - Current) * 1000000.0)];
            [v6 setObject:v21 forKeyedSubscript:v15];
          }
          if (v20) {
            [v23 setValue:v20 forKey:v15];
          }
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v12);
  }

  return v23;
}

- (SEL)knownFieldAccessorForFieldName:(id)a3
{
  id v3 = a3;
  char v4 = [v3 stringByAppendingString:@":"];
  id v5 = NSSelectorFromString(v4);

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v5 = NSSelectorFromString((NSString *)v3);
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      id v5 = 0;
    }
  }

  return v5;
}

- (MTEventDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTEventDataProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setKnownFieldMethods:(id)a3
{
}

- (NSArray)additionalData
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdditionalData:(id)a3
{
}

@end