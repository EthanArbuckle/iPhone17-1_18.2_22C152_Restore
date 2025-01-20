@interface SRTrialConfiguration
+ (id)configuration;
- (NSDictionary)namespaceDescription;
- (SRTrialConfiguration)init;
- (id)clientsForNamespace:(id)a3;
- (id)debugDescription;
- (id)namespaceTypes;
- (id)namespaceTypesForClient:(id)a3;
- (id)namespacesForClient:(id)a3;
- (void)clear;
- (void)setParameterName:(id)a3 namespaceId:(id)a4;
- (void)setProperties:(id)a3 client:(id)a4;
@end

@implementation SRTrialConfiguration

- (id)namespaceTypesForClient:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v22 = v4;
  [(NSMutableDictionary *)self->_namespaceMap objectForKeyedSubscript:v4];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v6;
        uint64_t v7 = *(void *)(*((void *)&v31 + 1) + 8 * v6);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        v8 = self->_parameterMap;
        uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              v14 = [(NSMutableDictionary *)self->_parameterMap objectForKeyedSubscript:v13];
              int v15 = [v14 containsObject:v7];

              if (v15)
              {
                v16 = [v5 objectForKeyedSubscript:v7];
                if (!v16)
                {
                  v16 = objc_alloc_init(SRNamespaceType);
                  v17 = [(NSMutableDictionary *)self->_namespaceDescription objectForKeyedSubscript:v7];
                  [(SRNamespaceType *)v16 setNamespaceName:v17];

                  [(SRNamespaceType *)v16 setNamespaceId:v7];
                  [v5 setObject:v16 forKey:v7];
                }
                [(SRNamespaceType *)v16 addParameterName:v13];
              }
            }
            uint64_t v10 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }
  v18 = (void *)MEMORY[0x263EFFA08];
  v19 = [v5 allValues];
  v20 = [v18 setWithArray:v19];

  return v20;
}

+ (id)configuration
{
  v2 = objc_alloc_init(SRTrialConfiguration);
  return v2;
}

- (SRTrialConfiguration)init
{
  v12.receiver = self;
  v12.super_class = (Class)SRTrialConfiguration;
  v2 = [(SRTrialConfiguration *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    properties = v2->_properties;
    v2->_properties = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    namespaceDescription = v2->_namespaceDescription;
    v2->_namespaceDescription = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    namespaceMap = v2->_namespaceMap;
    v2->_namespaceMap = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    parameterMap = v2->_parameterMap;
    v2->_parameterMap = v9;
  }
  return v2;
}

- (NSDictionary)namespaceDescription
{
  return (NSDictionary *)self->_namespaceDescription;
}

- (id)namespacesForClient:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_namespaceMap objectForKeyedSubscript:a3];
}

- (id)debugDescription
{
  v3 = (void *)[&stru_270B18FF0 mutableCopy];
  id v4 = v3;
  if (self->_properties) {
    [v3 appendFormat:@"properties: %@\n", self->_properties];
  }
  if (self->_namespaceDescription) {
    [v4 appendFormat:@"namespaceDescription: %@\n", self->_namespaceDescription];
  }
  if (self->_properties) {
    [v4 appendFormat:@"namespaceMap: %@\n", self->_namespaceMap];
  }
  if (self->_parameterMap) {
    [v4 appendFormat:@"parameterMap: %@\n", self->_parameterMap];
  }
  return v4;
}

- (void)setProperties:(id)a3 client:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = [v13 objectForKeyedSubscript:@"namespaceId"];
  uint64_t v8 = [v13 objectForKeyedSubscript:@"namespaceName"];
  uint64_t v9 = (void *)v8;
  if (v7 && v8)
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_namespaceMap objectForKeyedSubscript:v6];

    if (!v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(NSMutableDictionary *)self->_namespaceMap setObject:v11 forKeyedSubscript:v6];
    }
    objc_super v12 = [(NSMutableDictionary *)self->_namespaceMap objectForKeyedSubscript:v6];
    [v12 addObject:v7];

    [(NSMutableDictionary *)self->_properties setObject:v13 forKeyedSubscript:v7];
    [(NSMutableDictionary *)self->_namespaceDescription setObject:v9 forKeyedSubscript:v7];
  }
}

- (void)setParameterName:(id)a3 namespaceId:(id)a4
{
  id v11 = a3;
  parameterMap = self->_parameterMap;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)parameterMap objectForKeyedSubscript:v11];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(NSMutableDictionary *)self->_parameterMap setObject:v9 forKeyedSubscript:v11];
  }
  uint64_t v10 = [(NSMutableDictionary *)self->_parameterMap objectForKeyedSubscript:v11];
  [v10 addObject:v7];
}

- (id)namespaceTypes
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = self->_parameterMap;
  uint64_t v20 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        uint64_t v5 = *(void *)(*((void *)&v26 + 1) + 8 * v4);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v6 = [(NSMutableDictionary *)self->_parameterMap objectForKeyedSubscript:v5];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v23 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_super v12 = [v3 objectForKeyedSubscript:v11];
              if (!v12)
              {
                objc_super v12 = objc_alloc_init(SRNamespaceType);
                id v13 = [(NSMutableDictionary *)self->_namespaceDescription objectForKeyedSubscript:v11];
                [(SRNamespaceType *)v12 setNamespaceName:v13];

                [(SRNamespaceType *)v12 setNamespaceId:v11];
                [v3 setObject:v12 forKey:v11];
              }
              [(SRNamespaceType *)v12 addParameterName:v5];
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }

  v14 = (void *)MEMORY[0x263EFFA08];
  int v15 = [v3 allValues];
  v16 = [v14 setWithArray:v15];

  return v16;
}

- (id)clientsForNamespace:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_namespaceMap;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [(NSMutableDictionary *)self->_namespaceMap objectForKeyedSubscript:v10];
        if (v11)
        {
          objc_super v12 = (void *)v11;
          id v13 = [(NSMutableDictionary *)self->_namespaceMap objectForKeyedSubscript:v10];
          int v14 = [v13 containsObject:v4];

          if (v14) {
            [v17 addObject:v10];
          }
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  int v15 = [MEMORY[0x263EFFA08] setWithArray:v17];

  return v15;
}

- (void)clear
{
  [(NSMutableDictionary *)self->_properties removeAllObjects];
  [(NSMutableDictionary *)self->_namespaceDescription removeAllObjects];
  [(NSMutableDictionary *)self->_parameterMap removeAllObjects];
  namespaceMap = self->_namespaceMap;
  [(NSMutableDictionary *)namespaceMap removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceMap, 0);
  objc_storeStrong((id *)&self->_parameterMap, 0);
  objc_storeStrong((id *)&self->_namespaceDescription, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end