@interface ISURLBagBackend
+ (BOOL)_bagValue:(id)a3 equalsBagValue:(id)a4;
- (ISURLBagBackend)init;
- (NSMutableDictionary)bagValuesDictionary;
- (OS_dispatch_queue)accessQueue;
- (SSDoubleLinkedList)bagValuesList;
- (id)_bagValuesMapTableWithInitialValues:(id)a3;
- (id)_valueForKey:(id)a3 forBagValuesNode:(id)a4;
- (id)deltaDictionaryRepresentationForBagWithKey:(id)a3;
- (id)description;
- (id)diagnostics;
- (id)dictionaryRepresentationForBagWithKey:(id)a3;
- (id)valueForKey:(id)a3 forBagWithKey:(id)a4;
- (void)addBagValues:(id)a3 forBagWithKey:(id)a4;
- (void)removeBagValuesForBagWithKey:(id)a3;
- (void)setAccessQueue:(id)a3;
- (void)setBagValuesDictionary:(id)a3;
- (void)setBagValuesList:(id)a3;
@end

@implementation ISURLBagBackend

- (ISURLBagBackend)init
{
  v10.receiver = self;
  v10.super_class = (Class)ISURLBagBackend;
  v2 = [(ISURLBagBackend *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStore.URLBagBackend", MEMORY[0x263EF83A8]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    bagValuesDictionary = v2->_bagValuesDictionary;
    v2->_bagValuesDictionary = v5;

    v7 = (SSDoubleLinkedList *)objc_alloc_init(MEMORY[0x263F7B158]);
    bagValuesList = v2->_bagValuesList;
    v2->_bagValuesList = v7;
  }
  return v2;
}

- (id)deltaDictionaryRepresentationForBagWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  v5 = [(ISURLBagBackend *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ISURLBagBackend_deltaDictionaryRepresentationForBagWithKey___block_invoke;
  block[3] = &unk_264260DB8;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __62__ISURLBagBackend_deltaDictionaryRepresentationForBagWithKey___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) bagValuesDictionary];
  dispatch_queue_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = [v3 object];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v13 = [v7 objectForKey:v12];
          uint64_t v14 = [MEMORY[0x263EFF9D0] null];

          if (v13 != v14) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKey:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (id)diagnostics
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__10;
  v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  dispatch_queue_t v3 = [(ISURLBagBackend *)self accessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__ISURLBagBackend_diagnostics__block_invoke;
  v6[3] = &unk_264260BB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__ISURLBagBackend_diagnostics__block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@"ISURLBagBackend Diagnostics\n\n"];
  id v53 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v40 = a1;
  uint64_t v5 = [*(id *)(a1 + 32) bagValuesDictionary];
  id v6 = [v5 allValues];

  obuint64_t j = v6;
  uint64_t v43 = [v6 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (!v43)
  {
    unint64_t v47 = 0;
    unint64_t v51 = 0;
    goto LABEL_38;
  }
  unint64_t v47 = 0;
  unint64_t v51 = 0;
  uint64_t v42 = *(void *)v71;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v71 != v42) {
        objc_enumerationMutation(obj);
      }
      v44 = v7;
      uint64_t v8 = *(void **)(*((void *)&v70 + 1) + 8 * (void)v7);
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v49 = [v8 object];
      uint64_t v9 = [v49 countByEnumeratingWithState:&v66 objects:v77 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v67 != v11) {
              objc_enumerationMutation(v49);
            }
            v13 = *(void **)(*((void *)&v66 + 1) + 8 * i);
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            id v14 = v53;
            uint64_t v15 = [v14 countByEnumeratingWithState:&v62 objects:v76 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              int v17 = 0;
              char v18 = 0;
              uint64_t v19 = *(void *)v63;
              while (2)
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v63 != v19) {
                    objc_enumerationMutation(v14);
                  }
                  v18 |= v13 == *(void **)(*((void *)&v62 + 1) + 8 * j);
                  v17 |= objc_msgSend(v13, "isEqualToString:");
                  if (v18 & 1) != 0 && (v17)
                  {

                    char v18 = 1;
                    LOBYTE(v17) = 1;
                    goto LABEL_22;
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v62 objects:v76 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }
            else
            {
              LOBYTE(v17) = 0;
              char v18 = 0;
            }

            if ((v18 & 1) == 0 && (v17 & 1) == 0)
            {
              v21 = v14;
              goto LABEL_31;
            }
LABEL_22:
            if (v18 & 1) != 0 && (v17)
            {
              ++v51;
              continue;
            }
            if (!(v18 & 1 | ((v17 & 1) == 0)))
            {
              v21 = v46;
              ++v47;
LABEL_31:
              [v21 addObject:v13];
              continue;
            }
          }
          uint64_t v10 = [v49 countByEnumeratingWithState:&v66 objects:v77 count:16];
        }
        while (v10);
      }

      uint64_t v7 = v44 + 1;
    }
    while (v44 + 1 != (char *)v43);
    uint64_t v43 = [obj countByEnumeratingWithState:&v70 objects:v78 count:16];
  }
  while (v43);
LABEL_38:

  [*(id *)(*(void *)(*(void *)(v40 + 40) + 8) + 40) appendString:@"KEYS\n"];
  double v22 = (double)(v51 + v47);
  objc_msgSend(*(id *)(*(void *)(*(void *)(v40 + 40) + 8) + 40), "appendFormat:", @"Total Reused Keys: %li (%f)\n", v51, (double)v51 / v22);
  objc_msgSend(*(id *)(*(void *)(*(void *)(v40 + 40) + 8) + 40), "appendFormat:", @"Total Copied Keys: %li (%f)\n\n", v47, (double)v47 / v22);
  id v23 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v24 = [*(id *)(v40 + 32) bagValuesDictionary];
  v25 = [v24 allValues];

  id v45 = v25;
  id v50 = (id)[v25 countByEnumeratingWithState:&v58 objects:v75 count:16];
  unint64_t v26 = 0;
  unint64_t v27 = 0;
  if (v50)
  {
    uint64_t v48 = *(void *)v59;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v52 = v28;
        v29 = *(void **)(*((void *)&v58 + 1) + 8 * v28);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v30 = [v29 object];
        uint64_t v31 = [v30 countByEnumeratingWithState:&v54 objects:v74 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v55;
          do
          {
            for (uint64_t k = 0; k != v32; ++k)
            {
              if (*(void *)v55 != v33) {
                objc_enumerationMutation(v30);
              }
              uint64_t v35 = *(void *)(*((void *)&v54 + 1) + 8 * k);
              v36 = [v29 object];
              v37 = [v36 objectForKey:v35];

              v38 = [MEMORY[0x263EFF9D0] null];

              if (v37 == v38)
              {
                ++v26;
              }
              else if ([v23 containsObject:v37])
              {
                ++v27;
              }
              else
              {
                [v23 addObject:v37];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v54 objects:v74 count:16];
          }
          while (v32);
        }

        uint64_t v28 = v52 + 1;
      }
      while ((id)(v52 + 1) != v50);
      id v50 = (id)[v45 countByEnumeratingWithState:&v58 objects:v75 count:16];
    }
    while (v50);
  }

  [*(id *)(*(void *)(*(void *)(v40 + 40) + 8) + 40) appendString:@"VALUES\n"];
  double v39 = (double)(v27 + v26);
  objc_msgSend(*(id *)(*(void *)(*(void *)(v40 + 40) + 8) + 40), "appendFormat:", @"Total Delta Values: %li (%f)\n", v26, (double)v26 / v39);
  objc_msgSend(*(id *)(*(void *)(*(void *)(v40 + 40) + 8) + 40), "appendFormat:", @"Total Duplicate Values: %li (%f)\n\n", v27, (double)v27 / v39);
  [*(id *)(*(void *)(*(void *)(v40 + 40) + 8) + 40) appendFormat:@"Copied Keys: %@", v46];
}

- (id)dictionaryRepresentationForBagWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__10;
  uint64_t v16 = __Block_byref_object_dispose__10;
  id v17 = 0;
  uint64_t v5 = [(ISURLBagBackend *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ISURLBagBackend_dictionaryRepresentationForBagWithKey___block_invoke;
  block[3] = &unk_264260DB8;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__ISURLBagBackend_dictionaryRepresentationForBagWithKey___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) bagValuesDictionary];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v5 = [v3 object];
    uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = objc_msgSend(v3, "object", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v15 = [*(id *)(a1 + 32) _valueForKey:v14 forBagValuesNode:v3];
          if (v15) {
            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v15 forKey:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (id)valueForKey:(id)a3 forBagWithKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__10;
  uint64_t v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  uint64_t v8 = [(ISURLBagBackend *)self accessQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__ISURLBagBackend_valueForKey_forBagWithKey___block_invoke;
  v13[3] = &unk_264261600;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  long long v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __45__ISURLBagBackend_valueForKey_forBagWithKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bagValuesDictionary];
  id v6 = [v2 objectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) _valueForKey:*(void *)(a1 + 48) forBagValuesNode:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)addBagValues:(id)a3 forBagWithKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ISURLBagBackend *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__ISURLBagBackend_addBagValues_forBagWithKey___block_invoke;
  block[3] = &unk_264260B80;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, block);
}

void __46__ISURLBagBackend_addBagValues_forBagWithKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _bagValuesMapTableWithInitialValues:*(void *)(a1 + 40)];
  id v2 = (void *)[objc_alloc(MEMORY[0x263F7B160]) initWithObject:v5];
  uint64_t v3 = [*(id *)(a1 + 32) bagValuesDictionary];
  [v3 setObject:v2 forKey:*(void *)(a1 + 48)];

  uint64_t v4 = [*(id *)(a1 + 32) bagValuesList];
  [v4 appendNode:v2];
}

- (void)removeBagValuesForBagWithKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ISURLBagBackend *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__ISURLBagBackend_removeBagValuesForBagWithKey___block_invoke;
  v7[3] = &unk_264260B58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

void __48__ISURLBagBackend_removeBagValuesForBagWithKey___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) bagValuesDictionary];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v20 = a1;
    id v4 = [v3 next];
    id v5 = [v4 object];
    uint64_t v21 = (void *)[v5 copy];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obuint64_t j = [v4 object];
    uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * v9);
          id v11 = [v4 object];
          id v12 = [v11 objectForKey:v10];

          id v13 = [MEMORY[0x263EFF9D0] null];

          if (v12 == v13)
          {
            id v14 = v3;
            id v15 = [v3 object];
            long long v16 = [v15 objectForKey:v10];

            if (v16)
            {
              uint64_t v17 = [MEMORY[0x263EFF9D0] null];

              if (v16 != v17) {
                [v21 setObject:v16 forKey:v10];
              }
            }

            uint64_t v3 = v14;
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
    }

    [v4 setObject:v21];
    long long v18 = [*(id *)(v20 + 32) bagValuesDictionary];
    [v18 removeObjectForKey:*(void *)(v20 + 40)];

    uint64_t v19 = [*(id *)(v20 + 32) bagValuesList];
    [v19 removeNode:v3];
  }
}

- (id)description
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__10;
  id v11 = __Block_byref_object_dispose__10;
  id v12 = 0;
  uint64_t v3 = [(ISURLBagBackend *)self accessQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __30__ISURLBagBackend_description__block_invoke;
  v6[3] = &unk_264260BB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __30__ISURLBagBackend_description__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) bagValuesList];
  uint64_t v2 = [v5 description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (BOOL)_bagValue:(id)a3 equalsBagValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = [v5 isEqualToArray:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v7 = [v5 isEqualToDictionary:v6];
      }
      else {
        char v7 = [v5 isEqual:v6];
      }
    }
    BOOL v8 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_bagValuesMapTableWithInitialValues:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08968];
  id v5 = a3;
  id v6 = [v4 strongToStrongObjectsMapTable];
  char v7 = [(ISURLBagBackend *)self bagValuesList];
  BOOL v8 = [v7 tail];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __55__ISURLBagBackend__bagValuesMapTableWithInitialValues___block_invoke;
  v14[3] = &unk_264261628;
  v14[4] = self;
  id v15 = v8;
  id v9 = v6;
  id v16 = v9;
  id v10 = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v14];

  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __55__ISURLBagBackend__bagValuesMapTableWithInitialValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _valueForKey:v10 forBagValuesNode:*(void *)(a1 + 40)];
  int v7 = [(id)objc_opt_class() _bagValue:v5 equalsBagValue:v6];
  BOOL v8 = *(void **)(a1 + 48);
  if (v7)
  {
    id v9 = [MEMORY[0x263EFF9D0] null];
    [v8 setObject:v9 forKey:v10];
  }
  else
  {
    [v8 setObject:v5 forKey:v10];
  }
}

- (id)_valueForKey:(id)a3 forBagValuesNode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    int v7 = v6;
    BOOL v8 = 0;
    while (1)
    {
      id v9 = v8;
      id v10 = [v7 object];
      BOOL v8 = [v10 objectForKey:v5];

      id v11 = [MEMORY[0x263EFF9D0] null];
      if (v8 != v11) {
        break;
      }
      uint64_t v12 = [v7 previous];

      int v7 = (void *)v12;
      if (!v12) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_8:

  return v8;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSMutableDictionary)bagValuesDictionary
{
  return self->_bagValuesDictionary;
}

- (void)setBagValuesDictionary:(id)a3
{
}

- (SSDoubleLinkedList)bagValuesList
{
  return self->_bagValuesList;
}

- (void)setBagValuesList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bagValuesList, 0);
  objc_storeStrong((id *)&self->_bagValuesDictionary, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end