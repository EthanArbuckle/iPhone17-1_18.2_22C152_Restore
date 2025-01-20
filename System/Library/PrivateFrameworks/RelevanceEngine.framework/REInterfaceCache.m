@interface REInterfaceCache
- (BOOL)_interface:(id)a3 implementsInterface:(id)a4;
- (BOOL)_supportsCache;
- (BOOL)exportedInterfaceClass:(Class)a3;
- (BOOL)exportedInterfaceProtocol:(id)a3;
- (id)_accessInterfaceForKey:(id)a3;
- (id)_init;
- (id)_queue_valueForKey:(id)a3 level:(unint64_t)a4;
- (id)_supportedProtocols;
- (void)_enumerateMethodsOfInterface:(id)a3 forProtocol:(id)a4 usingBlock:(id)a5;
- (void)_enumeratePropertiesOfInterface:(id)a3 forProtocol:(id)a4 usingBlock:(id)a5;
- (void)enumerateExportedMethodsOfClass:(Class)a3 usingBlock:(id)a4;
- (void)enumerateExportedMethodsOfProtocol:(id)a3 usingBlock:(id)a4;
- (void)enumerateExportedPropertiesOfClass:(Class)a3 usingBlock:(id)a4;
- (void)enumerateExportedPropertiesOfProtocol:(id)a3 usingBlock:(id)a4;
@end

@implementation REInterfaceCache

- (BOOL)_supportsCache
{
  if (_supportsCache_onceToken != -1) {
    dispatch_once(&_supportsCache_onceToken, &__block_literal_global_50);
  }
  return _supportsCache_Supported;
}

void __34__REInterfaceCache__supportsCache__block_invoke()
{
  if (_fetchedInternalBuildOnceToken_5 != -1) {
    dispatch_once(&_fetchedInternalBuildOnceToken_5, &__block_literal_global_34);
  }
  char v0 = _isInternalDevice_5;
  if (_isInternalDevice_5) {
    char v0 = REProcessIsRelevanced() ^ 1;
  }
  _supportsCache_Supported = v0;
}

uint64_t __34__REInterfaceCache__supportsCache__block_invoke_2()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_5 = result;
  return result;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)REInterfaceCache;
  v2 = [(RESingleton *)&v8 _init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.RelevanceEngine.REInterfaceCache", 0);
    v4 = (void *)v2[1];
    v2[1] = v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = (void *)v2[2];
    v2[2] = v5;
  }
  return v2;
}

- (id)_supportedProtocols
{
  if (_supportedProtocols_onceToken != -1) {
    dispatch_once(&_supportedProtocols_onceToken, &__block_literal_global_38_0);
  }
  v2 = (void *)_supportedProtocols_Protocols;
  return v2;
}

uint64_t __39__REInterfaceCache__supportedProtocols__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithObject:&unk_26CFCEBD0];
  uint64_t v1 = _supportedProtocols_Protocols;
  _supportedProtocols_Protocols = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_queue_valueForKey:(id)a3 level:(unint64_t)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(NSMutableDictionary *)self->_supportedInterfaces objectForKeyedSubscript:v6];
  if (!v7)
  {
    if (a4 == 5)
    {
      objc_super v8 = (void *)*MEMORY[0x263F08418];
      if ([v6 isProtocol])
      {
        v9 = [v6 protocol];
        v10 = NSStringFromProtocol(v9);
        RERaiseInternalException(v8, @"Attempting to unwrap %@, but we're already 5 levels deep. Is this an error?", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
      }
      else
      {
        NSStringFromClass((Class)[v6 cls]);
        v9 = (Protocol *)objc_claimAutoreleasedReturnValue();
        RERaiseInternalException(v8, @"Attempting to unwrap %@, but we're already 5 levels deep. Is this an error?", v43, v44, v45, v46, v47, v48, (uint64_t)v9);
      }

      v7 = 0;
      goto LABEL_21;
    }
    v17 = [MEMORY[0x263EFF980] array];
    v18 = [MEMORY[0x263EFF980] array];
    v19 = [MEMORY[0x263F088B0] hashTableWithOptions:256];
    v20 = [MEMORY[0x263F08968] mapTableWithKeyOptions:256 valueOptions:0];
    v21 = [MEMORY[0x263F08968] mapTableWithKeyOptions:256 valueOptions:0];
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke;
    v79[3] = &unk_2644BF510;
    id v56 = v20;
    id v80 = v56;
    id v55 = v21;
    id v81 = v55;
    v22 = (void *)MEMORY[0x223C31700](v79);
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_2;
    v73[3] = &unk_2644BF538;
    v73[4] = self;
    unint64_t v78 = a4;
    id v54 = v17;
    id v74 = v54;
    id v53 = v18;
    id v75 = v53;
    id v23 = v19;
    id v76 = v23;
    id v24 = v22;
    id v77 = v24;
    v25 = (void *)MEMORY[0x223C31700](v73);
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_3;
    v72[3] = &unk_2644BF560;
    v72[4] = self;
    v26 = (void *)MEMORY[0x223C31700](v72);
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_4;
    v66[3] = &unk_2644BF5B0;
    id v27 = v26;
    id v69 = v27;
    id v28 = v25;
    id v70 = v28;
    id v29 = v23;
    id v67 = v29;
    id v30 = v6;
    id v68 = v30;
    id v31 = v24;
    id v71 = v31;
    [v30 enumerateConformedProperties:v66];
    v57 = v29;
    if ([v30 isProtocol])
    {
      v32 = [v30 protocol];
      int v33 = (*((uint64_t (**)(id, void *))v27 + 2))(v27, v32);

      if (!v33)
      {
LABEL_20:
        v7 = objc_opt_new();
        [v7 setType:v30];
        [v7 setConformedInterfaces:v53];
        [v7 setConformedProtocols:v29];
        [v7 setProperties:v56];
        [v7 setMethods:v55];
        [(NSMutableDictionary *)self->_supportedInterfaces setObject:v7 forKeyedSubscript:v30];

        goto LABEL_21;
      }
      id v50 = v28;
      id v51 = v27;
      v34 = [MEMORY[0x263EFF9C0] set];
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_6;
      v64[3] = &unk_2644BF588;
      id v35 = v34;
      id v65 = v35;
      [v30 enumerateExposedProperties:v64];
      v36 = [MEMORY[0x263F088B0] hashTableWithOptions:256];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_7;
      v62[3] = &unk_2644BF5D8;
      id v37 = v36;
      id v63 = v37;
      id v52 = v30;
      [v30 enumerateExposedMethods:v62];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v38 = [(REInterfaceCache *)self _supportedProtocols];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v82 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v40; ++i)
          {
            if (*(void *)v59 != v41) {
              objc_enumerationMutation(v38);
            }
            (*((void (**)(id, void, id, id))v31 + 2))(v31, *(void *)(*((void *)&v58 + 1) + 8 * i), v35, v37);
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v58 objects:v82 count:16];
        }
        while (v40);
      }

      id v29 = v57;
      id v28 = v50;
      id v27 = v51;
    }
    else
    {
      id v52 = v30;
      id v35 = [v30 superclassKey];
      if (v35) {
        (*((void (**)(id, id))v28 + 2))(v28, v35);
      }
    }

    id v30 = v52;
    goto LABEL_20;
  }
LABEL_21:

  return v7;
}

void __45__REInterfaceCache__queue_valueForKey_level___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = [*(id *)(a1 + 32) objectForKey:v13];
  if (v9)
  {
    if (v7)
    {
LABEL_3:
      [v9 unionSet:v7];
      goto LABEL_6;
    }
  }
  else
  {
    v9 = [MEMORY[0x263EFF9C0] set];
    [*(id *)(a1 + 32) setObject:v9 forKey:v13];
    if (v7) {
      goto LABEL_3;
    }
  }
  v10 = [MEMORY[0x263EFFA08] set];
  [v9 unionSet:v10];

LABEL_6:
  uint64_t v11 = [*(id *)(a1 + 40) objectForKey:v13];
  if (v11)
  {
    if (v8)
    {
LABEL_8:
      [v11 unionHashTable:v8];
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F088B0] hashTableWithOptions:256];
    [*(id *)(a1 + 40) setObject:v11 forKey:v13];
    if (v8) {
      goto LABEL_8;
    }
  }
  uint64_t v12 = [MEMORY[0x263F088B0] hashTableWithOptions:256];
  [v11 unionHashTable:v12];

LABEL_11:
}

void __45__REInterfaceCache__queue_valueForKey_level___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_queue_valueForKey:level:", v3, *(void *)(a1 + 72) + 1);
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v4];
    id v17 = v3;
    [*(id *)(a1 + 48) addObject:v3];
    uint64_t v5 = *(void **)(a1 + 56);
    id v6 = [v4 conformedProtocols];
    [v5 unionHashTable:v6];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [*(id *)(a1 + 32) _supportedProtocols];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          id v13 = [v4 properties];
          uint64_t v14 = [v13 objectForKey:v12];

          uint64_t v15 = [v4 methods];
          uint64_t v16 = [v15 objectForKey:v12];

          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v3 = v17;
  }
}

uint64_t __45__REInterfaceCache__queue_valueForKey_level___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_supportedProtocols", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (protocol_conformsToProtocol(v3, *(Protocol **)(*((void *)&v9 + 1) + 8 * i)))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

void __45__REInterfaceCache__queue_valueForKey_level___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    v4 = [[_REInterfaceKey alloc] initWithProtocol:v3];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [*(id *)(a1 + 32) addObject:v3];
    if (protocol_isEqual(v3, (Protocol *)&unk_26CFD6DB8) || protocol_conformsToProtocol(v3, (Protocol *)&unk_26CFD6DB8))
    {
      uint64_t v5 = [MEMORY[0x263EFF9C0] set];
      uint64_t v6 = *(void **)(a1 + 40);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __45__REInterfaceCache__queue_valueForKey_level___block_invoke_5;
      v10[3] = &unk_2644BF588;
      id v11 = v5;
      id v7 = v5;
      [v6 enumerateAutomaticProperties:v10];
      uint64_t v8 = *(void *)(a1 + 64);
      long long v9 = objc_opt_new();
      (*(void (**)(uint64_t, void *, id, void *))(v8 + 16))(v8, &unk_26CFCEBD0, v7, v9);
    }
  }
}

uint64_t __45__REInterfaceCache__queue_valueForKey_level___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __45__REInterfaceCache__queue_valueForKey_level___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __45__REInterfaceCache__queue_valueForKey_level___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_accessInterfaceForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__19;
  queue = self->_queue;
  uint64_t v16 = __Block_byref_object_dispose__19;
  id v17 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__REInterfaceCache__accessInterfaceForKey___block_invoke;
  block[3] = &unk_2644BEE08;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __43__REInterfaceCache__accessInterfaceForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_valueForKey:level:", *(void *)(a1 + 40), 0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)_enumeratePropertiesOfInterface:(id)a3 forProtocol:(id)a4 usingBlock:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (v10 && [(REInterfaceCache *)self _supportsCache])
  {
    id v11 = [(REInterfaceCache *)self _accessInterfaceForKey:v8];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = objc_msgSend(v11, "properties", 0);
    id v13 = [v12 objectForKey:v9];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          v10[2](v10, *(void *)(*((void *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }
  }
}

- (void)_enumerateMethodsOfInterface:(id)a3 forProtocol:(id)a4 usingBlock:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (v10 && [(REInterfaceCache *)self _supportsCache])
  {
    id v11 = [(REInterfaceCache *)self _accessInterfaceForKey:v8];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v12 = objc_msgSend(v11, "methods", 0);
    id v13 = [v12 objectForKey:v9];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          v10[2](v10, *(void *)(*((void *)&v18 + 1) + 8 * v17++));
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v15);
    }
  }
}

- (BOOL)_interface:(id)a3 implementsInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(REInterfaceCache *)self _supportsCache])
  {
    id v8 = [(REInterfaceCache *)self _accessInterfaceForKey:v6];
    id v9 = [v8 conformedProtocols];
    char v10 = [v9 containsObject:v7];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)exportedInterfaceClass:(Class)a3
{
  uint64_t v4 = [[_REInterfaceKey alloc] initWithClass:a3];
  LOBYTE(self) = [(REInterfaceCache *)self _interface:v4 implementsInterface:&unk_26CFCEBD0];

  return (char)self;
}

- (BOOL)exportedInterfaceProtocol:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_REInterfaceKey alloc] initWithProtocol:v4];

  LOBYTE(self) = [(REInterfaceCache *)self _interface:v5 implementsInterface:&unk_26CFCEBD0];
  return (char)self;
}

- (void)enumerateExportedPropertiesOfClass:(Class)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [[_REInterfaceKey alloc] initWithClass:a3];
  [(REInterfaceCache *)self _enumeratePropertiesOfInterface:v7 forProtocol:&unk_26CFCEBD0 usingBlock:v6];
}

- (void)enumerateExportedPropertiesOfProtocol:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_REInterfaceKey alloc] initWithProtocol:v7];

  [(REInterfaceCache *)self _enumeratePropertiesOfInterface:v8 forProtocol:&unk_26CFCEBD0 usingBlock:v6];
}

- (void)enumerateExportedMethodsOfClass:(Class)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [[_REInterfaceKey alloc] initWithClass:a3];
  [(REInterfaceCache *)self _enumerateMethodsOfInterface:v7 forProtocol:&unk_26CFCEBD0 usingBlock:v6];
}

- (void)enumerateExportedMethodsOfProtocol:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_REInterfaceKey alloc] initWithProtocol:v7];

  [(REInterfaceCache *)self _enumerateMethodsOfInterface:v8 forProtocol:&unk_26CFCEBD0 usingBlock:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedInterfaces, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end