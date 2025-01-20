@interface HVDataSourceContentState
+ (BOOL)deleteStateForDataSource:(unsigned int)a3 basePath:(id)a4 error:(id *)a5;
+ (id)_pathForDataSource:(void *)a3 basePath:;
+ (uint64_t)_deleteStateAtPath:(NSObject *)a3 error:;
- (BOOL)isEqual:(id)a3;
- (BOOL)saveStateWithError:(id *)a3;
- (HVDataSourceContentState)initWithDataSource:(unsigned int)a3 basePath:(id)a4;
- (NSMutableDictionary)deferredContentStates;
- (id)sha256;
- (unint64_t)hash;
- (unsigned)dataSource;
@end

@implementation HVDataSourceContentState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredContentStates, 0);
  objc_storeStrong((id *)&self->_fileContentsHash, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

- (NSMutableDictionary)deferredContentStates
{
  return self->_deferredContentStates;
}

- (unsigned)dataSource
{
  return self->_dataSource;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HVDataSourceContentState *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unsigned int dataSource = self->_dataSource;
      if (dataSource == [(HVDataSourceContentState *)v5 dataSource])
      {
        deferredContentStates = self->_deferredContentStates;
        v8 = [(HVDataSourceContentState *)v5 deferredContentStates];
        char v9 = [(NSMutableDictionary *)deferredContentStates isEqualToDictionary:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  deferredContentStates = self->_deferredContentStates;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__HVDataSourceContentState_hash__block_invoke;
  v7[3] = &unk_2647D5CA0;
  v7[4] = &v8;
  [(NSMutableDictionary *)deferredContentStates enumerateKeysAndObjectsUsingBlock:v7];
  uint64_t v4 = v9[3];
  unint64_t v5 = [(NSMutableDictionary *)self->_deferredContentStates count] - v4 + 32 * v4;
  v9[3] = v5;
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __32__HVDataSourceContentState_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 hash] + v5;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v8 = [v6 hash];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8 + v7;
}

- (BOOL)saveStateWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v5 = -[HVDataSourceContentState sha256]((uint64_t)self);
  if ([(NSData *)self->_fileContentsHash isEqualToData:v5])
  {
    id v6 = hv_default_log_handle();
    char v7 = 1;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unsigned int dataSource = self->_dataSource;
      *(_DWORD *)buf = 67109120;
      unsigned int v32 = dataSource;
      _os_log_impl(&dword_226C41000, v6, OS_LOG_TYPE_INFO, "HVDataSourceContentState: source %u content unchanged, not writing to disk.", buf, 8u);
    }
  }
  else
  {
    char v9 = objc_opt_new();
    uint64_t v10 = (void *)MEMORY[0x22A6667F0]();
    uint64_t v11 = objc_opt_new();
    deferredContentStates = self->_deferredContentStates;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __47__HVDataSourceContentState_saveStateWithError___block_invoke;
    v29[3] = &unk_2647D5C50;
    id v13 = v11;
    id v30 = v13;
    [(NSMutableDictionary *)deferredContentStates enumerateKeysAndObjectsUsingBlock:v29];
    v14 = [v13 allKeys];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __47__HVDataSourceContentState_saveStateWithError___block_invoke_2;
    v27[3] = &unk_2647D5C78;
    id v28 = v13;
    id v15 = v13;
    v16 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", v27);

    v17 = (void *)[v16 mutableCopy];
    [v9 setDeferredContentStates:v17];

    v18 = [v9 data];

    path = self->_path;
    id v26 = 0;
    char v7 = [v18 writeToFile:path options:1073741825 error:&v26];
    id v6 = v26;
    if (v7)
    {
      objc_storeStrong((id *)&self->_fileContentsHash, v5);
      v20 = hv_default_log_handle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        unsigned int v21 = self->_dataSource;
        *(_DWORD *)buf = 67109120;
        unsigned int v32 = v21;
        _os_log_impl(&dword_226C41000, v20, OS_LOG_TYPE_INFO, "HVDataSourceContentState: source %u content saved to disk.", buf, 8u);
      }
    }
    else
    {
      v22 = hv_default_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unsigned int v24 = self->_dataSource;
        v25 = self->_path;
        *(_DWORD *)buf = 67109634;
        unsigned int v32 = v24;
        __int16 v33 = 2112;
        v34 = v25;
        __int16 v35 = 2112;
        v36 = v6;
        _os_log_error_impl(&dword_226C41000, v22, OS_LOG_TYPE_ERROR, "HVDataSourceContentState: source %u failed to write protobuf at: %@ error: %@", buf, 0x1Cu);
      }

      if (a3) {
        *a3 = v6;
      }
    }
  }
  return v7;
}

- (id)sha256
{
  v38[1] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v1 = a1;
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v2 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"self" ascending:1];
    v38[0] = v2;
    uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];

    uint64_t v4 = (void *)MEMORY[0x22A6667F0]();
    uint64_t v5 = [*(id *)(v1 + 32) allKeys];
    v25 = (void *)v3;
    id v6 = [v5 sortedArrayUsingDescriptors:v3];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x22A6667F0]();
          HVSHA256String(v11, &c);
          uint64_t v13 = v1;
          v14 = [*(id *)(v1 + 32) objectForKeyedSubscript:v11];
          id v15 = [v14 consumers];
          v16 = [v15 sortedArrayUsingDescriptors:v25];

          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v17 = v16;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v28 != v20) {
                  objc_enumerationMutation(v17);
                }
                HVSHA256String(*(void **)(*((void *)&v27 + 1) + 8 * j), &c);
              }
              uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v36 count:16];
            }
            while (v19);
          }

          char data = 0;
          char data = [v14 levelOfService];
          CC_SHA256_Update(&c, &data, 1u);

          uint64_t v1 = v13;
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v8);
    }

    id v22 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:32];
    CC_SHA256_Final((unsigned __int8 *)[v22 mutableBytes], &c);
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void __47__HVDataSourceContentState_saveStateWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
  [v6 addObject:v7];
}

id __47__HVDataSourceContentState_saveStateWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = [v3 consumers];
  id v6 = [v5 allObjects];
  id v7 = (void *)[v6 mutableCopy];
  [v4 setConsumers:v7];

  objc_msgSend(v4, "setLevelOfService:", objc_msgSend(v3, "levelOfService"));
  uint64_t v8 = objc_opt_new();
  [v8 setState:v4];
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];

  uint64_t v10 = (void *)[v9 mutableCopy];
  [v8 setUniqueIds:v10];

  return v8;
}

- (HVDataSourceContentState)initWithDataSource:(unsigned int)a3 basePath:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v69.receiver = self;
  v69.super_class = (Class)HVDataSourceContentState;
  id v7 = [(HVDataSourceContentState *)&v69 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_unsigned int dataSource = v4;
    uint64_t v9 = +[HVDataSourceContentState _pathForDataSource:basePath:]((uint64_t)HVDataSourceContentState, v4, v6);
    path = v8->_path;
    v8->_path = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
    char v12 = [v11 fileExistsAtPath:v8->_path];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x263EFF8F8]);
      v14 = v8->_path;
      id v82 = 0;
      id v15 = (void *)[v13 initWithContentsOfFile:v14 options:1 error:&v82];
      id v16 = v82;
      if (v15)
      {
        id v17 = [[HVPBDataSourceContentState alloc] initWithData:v15];
        if (v17)
        {
          uint64_t v18 = (NSMutableDictionary *)objc_opt_new();
          v63 = v8;
          id v64 = v6;
          id v61 = v16;
          v62 = v15;
          v60 = v17;
          if ([(HVPBDataSourceContentState *)v17 deferredContentStatesCount])
          {
            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            obuint64_t j = [(HVPBDataSourceContentState *)v17 deferredContentStates];
            uint64_t v19 = [obj countByEnumeratingWithState:&v78 objects:buf count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v67 = *(void *)v79;
              do
              {
                for (uint64_t i = 0; i != v20; ++i)
                {
                  if (*(void *)v79 != v67) {
                    objc_enumerationMutation(obj);
                  }
                  id v22 = *(void **)(*((void *)&v78 + 1) + 8 * i);
                  v23 = [HVContentState alloc];
                  id v24 = objc_alloc(MEMORY[0x263EFFA08]);
                  v25 = [v22 state];
                  id v26 = [v25 consumers];
                  long long v27 = (void *)[v24 initWithArray:v26];
                  long long v28 = [v22 state];
                  long long v29 = -[HVContentState initWithConsumers:levelOfService:](v23, "initWithConsumers:levelOfService:", v27, [v28 levelOfService]);

                  long long v76 = 0u;
                  long long v77 = 0u;
                  long long v74 = 0u;
                  long long v75 = 0u;
                  long long v30 = [v22 uniqueIds];
                  uint64_t v31 = [v30 countByEnumeratingWithState:&v74 objects:v85 count:16];
                  if (v31)
                  {
                    uint64_t v32 = v31;
                    uint64_t v33 = *(void *)v75;
                    do
                    {
                      for (uint64_t j = 0; j != v32; ++j)
                      {
                        if (*(void *)v75 != v33) {
                          objc_enumerationMutation(v30);
                        }
                        [(NSMutableDictionary *)v18 setObject:v29 forKeyedSubscript:*(void *)(*((void *)&v74 + 1) + 8 * j)];
                      }
                      uint64_t v32 = [v30 countByEnumeratingWithState:&v74 objects:v85 count:16];
                    }
                    while (v32);
                  }
                }
                uint64_t v20 = [obj countByEnumeratingWithState:&v78 objects:buf count:16];
              }
              while (v20);
            }

            uint64_t v8 = v63;
            id v6 = v64;
            id v16 = v61;
            id v15 = v62;
            id v17 = v60;
          }
          if ([(HVPBDataSourceContentState *)v17 deprecatedDeferredContentStatesCount])
          {
            if ([(HVPBDataSourceContentState *)v17 deferredContentStatesCount])
            {
              __int16 v35 = hv_default_log_handle();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
              {
                v59 = v8->_path;
                *(_DWORD *)v83 = 138412290;
                v84 = v59;
                _os_log_fault_impl(&dword_226C41000, v35, OS_LOG_TYPE_FAULT, "HVDataSourceContentState: protobuf at %@ mixes deprecated and new content state formats!", v83, 0xCu);
              }
            }
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id obja = [(HVPBDataSourceContentState *)v17 deprecatedDeferredContentStates];
            uint64_t v36 = [obja countByEnumeratingWithState:&v70 objects:v83 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v68 = *(void *)v71;
              do
              {
                for (uint64_t k = 0; k != v37; ++k)
                {
                  if (*(void *)v71 != v68) {
                    objc_enumerationMutation(obja);
                  }
                  v39 = *(void **)(*((void *)&v70 + 1) + 8 * k);
                  v40 = (void *)MEMORY[0x22A6667F0]();
                  v41 = [HVContentState alloc];
                  id v42 = objc_alloc(MEMORY[0x263EFFA08]);
                  v43 = [v39 state];
                  v44 = [v43 consumers];
                  v45 = (void *)[v42 initWithArray:v44];
                  v46 = [v39 state];
                  v47 = -[HVContentState initWithConsumers:levelOfService:](v41, "initWithConsumers:levelOfService:", v45, [v46 levelOfService]);

                  v48 = [v39 uniqueId];
                  [(NSMutableDictionary *)v18 setObject:v47 forKeyedSubscript:v48];
                }
                uint64_t v37 = [obja countByEnumeratingWithState:&v70 objects:v83 count:16];
              }
              while (v37);
            }

            uint64_t v8 = v63;
            id v6 = v64;
            id v16 = v61;
            id v15 = v62;
            id v17 = v60;
          }
        }
        else
        {
          v53 = hv_default_log_handle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = v8->_path;
            *(_DWORD *)buf = 138412290;
            v87 = v54;
            _os_log_impl(&dword_226C41000, v53, OS_LOG_TYPE_DEFAULT, "HVDataSourceContentState: malformed protobuf at: %@", buf, 0xCu);
          }

          +[HVDataSourceContentState _deleteStateAtPath:error:]((uint64_t)HVDataSourceContentState, v8->_path, 0);
          uint64_t v18 = (NSMutableDictionary *)objc_opt_new();
        }
      }
      else
      {
        v51 = hv_default_log_handle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = v8->_path;
          *(_DWORD *)buf = 138412546;
          v87 = v52;
          __int16 v88 = 2112;
          id v89 = v16;
          _os_log_impl(&dword_226C41000, v51, OS_LOG_TYPE_DEFAULT, "HVDataSourceContentState: failed to read %@: error: %@", buf, 0x16u);
        }

        uint64_t v18 = (NSMutableDictionary *)objc_opt_new();
      }
    }
    else
    {
      v49 = hv_default_log_handle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = v8->_path;
        *(_DWORD *)buf = 138412290;
        v87 = v50;
        _os_log_impl(&dword_226C41000, v49, OS_LOG_TYPE_INFO, "HVDataSourceContentState: no existing deferred id list at %@", buf, 0xCu);
      }

      uint64_t v18 = (NSMutableDictionary *)objc_opt_new();
    }
    deferredContentStates = v8->_deferredContentStates;
    v8->_deferredContentStates = v18;

    uint64_t v56 = -[HVDataSourceContentState sha256]((uint64_t)v8);
    fileContentsHash = v8->_fileContentsHash;
    v8->_fileContentsHash = (NSData *)v56;
  }
  return v8;
}

+ (id)_pathForDataSource:(void *)a3 basePath:
{
  id v4 = a3;
  self;
  id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"deferred_%d.pb", a2);
  id v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

+ (uint64_t)_deleteStateAtPath:(NSObject *)a3 error:
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a2;
  self;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x263F08850] defaultManager];
    id v13 = 0;
    char v8 = [v7 removeItemAtPath:v4 error:&v13];
    uint64_t v9 = v13;

    if (v8)
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v11 = hv_default_log_handle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v15 = v4;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_error_impl(&dword_226C41000, v11, OS_LOG_TYPE_ERROR, "HVDataSourceContentState: failed to delete protobuf at: %@ error: %@", buf, 0x16u);
      }

      if (a3)
      {
        uint64_t v9 = v9;
        uint64_t v10 = 0;
        *a3 = v9;
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = hv_default_log_handle();
    uint64_t v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_226C41000, v9, OS_LOG_TYPE_INFO, "HVDataSourceContentState: went to delete protobuf but there was no file at: %@ ", buf, 0xCu);
    }
  }

  return v10;
}

+ (BOOL)deleteStateForDataSource:(unsigned int)a3 basePath:(id)a4 error:(id *)a5
{
  id v7 = +[HVDataSourceContentState _pathForDataSource:basePath:]((uint64_t)a1, *(uint64_t *)&a3, a4);
  LOBYTE(a5) = +[HVDataSourceContentState _deleteStateAtPath:error:]((uint64_t)a1, v7, (NSObject **)a5);

  return (char)a5;
}

@end