@interface SUUpdateDiscoveryDateManager
- (BOOL)containsBuildVersion:(id)a3;
- (SUUpdateDiscoveryDateManager)init;
- (SUUpdateDiscoveryDateManager)initWithDiscoveryDateDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (id)discoveryDateforBuildVersion:(id)a3;
- (void)removeDiscoveryDateForBuildVersion:(id)a3;
- (void)setDiscoveryDate:(id)a3 forBuildVersion:(id)a4;
@end

@implementation SUUpdateDiscoveryDateManager

- (SUUpdateDiscoveryDateManager)init
{
  return [(SUUpdateDiscoveryDateManager *)self initWithDiscoveryDateDictionary:0];
}

- (SUUpdateDiscoveryDateManager)initWithDiscoveryDateDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUpdateDiscoveryDateManager;
  v5 = [(SUUpdateDiscoveryDateManager *)&v18 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    buildVersionArray = v5->_buildVersionArray;
    v5->_buildVersionArray = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    discoveryDateArray = v5->_discoveryDateArray;
    v5->_discoveryDateArray = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.softwareupdateservices.discoveryStateQueue", v10);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v11;

    if (v4)
    {
      v13 = v5->_stateQueue;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __64__SUUpdateDiscoveryDateManager_initWithDiscoveryDateDictionary___block_invoke;
      v15[3] = &unk_26447C8C8;
      id v16 = v4;
      v17 = v5;
      dispatch_sync(v13, v15);
    }
  }

  return v5;
}

void __64__SUUpdateDiscoveryDateManager_initWithDiscoveryDateDictionary___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v2 = [*(id *)(a1 + 32) allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v22 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
          if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v23 = v2;
            if ([*(id *)(*(void *)(a1 + 40) + 24) count])
            {
              uint64_t v24 = 0;
              while (1)
              {
                v25 = [*(id *)(*(void *)(a1 + 40) + 24) objectAtIndexedSubscript:v24];
                v26 = [v25 laterDate:v22];

                if (v26 == v22) {
                  break;
                }
                if (++v24 >= (unint64_t)[*(id *)(*(void *)(a1 + 40) + 24) count]) {
                  goto LABEL_13;
                }
              }
              [*(id *)(*(void *)(a1 + 40) + 16) insertObject:v7 atIndex:v24];
              [*(id *)(*(void *)(a1 + 40) + 24) insertObject:v22 atIndex:v24];
            }
            else
            {
LABEL_13:
              [*(id *)(*(void *)(a1 + 40) + 16) addObject:v7];
              [*(id *)(*(void *)(a1 + 40) + 24) addObject:v22];
            }
            v2 = v23;
          }
          else
          {
            SULogInfo(@"discoveryDateDictionary value is unexpected type. File a radar!", v15, v16, v17, v18, v19, v20, v21, v27);
          }
        }
        else
        {
          SULogInfo(@"discoveryDateDictionary key is unexpected type. File a radar!", v8, v9, v10, v11, v12, v13, v14, v27);
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v4);
  }
}

- (void)setDiscoveryDate:(id)a3 forBuildVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SUUpdateDiscoveryDateManager_setDiscoveryDate_forBuildVersion___block_invoke;
  block[3] = &unk_26447CD70;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(stateQueue, block);
}

void *__65__SUUpdateDiscoveryDateManager_setDiscoveryDate_forBuildVersion___block_invoke(void *result)
{
  if (result[4])
  {
    v1 = result;
    if (result[5])
    {
      if ((unint64_t)[*(id *)(result[6] + 16) count] >= 3)
      {
        do
          [*(id *)(v1[6] + 16) removeLastObject];
        while ((unint64_t)[*(id *)(v1[6] + 16) count] > 2);
      }
      if ((unint64_t)[*(id *)(v1[6] + 24) count] >= 3)
      {
        do
          [*(id *)(v1[6] + 24) removeLastObject];
        while ((unint64_t)[*(id *)(v1[6] + 24) count] > 2);
      }
      [*(id *)(v1[6] + 16) insertObject:v1[4] atIndex:0];
      uint64_t v2 = v1[5];
      uint64_t v3 = *(void **)(v1[6] + 24);
      return (void *)[v3 insertObject:v2 atIndex:0];
    }
  }
  return result;
}

- (void)removeDiscoveryDateForBuildVersion:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__SUUpdateDiscoveryDateManager_removeDiscoveryDateForBuildVersion___block_invoke;
  v7[3] = &unk_26447C8C8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

unint64_t __67__SUUpdateDiscoveryDateManager_removeDiscoveryDateForBuildVersion___block_invoke(unint64_t result)
{
  if (*(void *)(result + 32))
  {
    unint64_t v1 = result;
    unint64_t v2 = objc_msgSend(*(id *)(*(void *)(result + 40) + 16), "indexOfObject:");
    result = [*(id *)(*(void *)(v1 + 40) + 16) count];
    if (v2 < result)
    {
      [*(id *)(*(void *)(v1 + 40) + 16) removeObjectAtIndex:v2];
      uint64_t v3 = *(void **)(*(void *)(v1 + 40) + 24);
      return [v3 removeObjectAtIndex:v2];
    }
  }
  return result;
}

- (id)discoveryDateforBuildVersion:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8;
  uint64_t v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__SUUpdateDiscoveryDateManager_discoveryDateforBuildVersion___block_invoke;
  block[3] = &unk_26447DA98;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__SUUpdateDiscoveryDateManager_discoveryDateforBuildVersion___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if ([*(id *)(a1[4] + 16) containsObject:a1[5]])
  {
    unint64_t v10 = [*(id *)(a1[4] + 16) indexOfObject:a1[5]];
    if (v10 >= [*(id *)(a1[4] + 24) count])
    {
      SULogInfo(@"_descriptorArray and _discoveryDateArray are out of sync. File a radar!", v11, v12, v13, v14, v15, v16, v17, a9);
    }
    else
    {
      *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) objectAtIndex:v10];
      MEMORY[0x270F9A758]();
    }
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = __Block_byref_object_copy__8;
  uint64_t v11 = __Block_byref_object_dispose__8;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SUUpdateDiscoveryDateManager_dictionaryRepresentation__block_invoke;
  v6[3] = &unk_26447C9B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  if ([(id)v8[5] count])
  {
    id v4 = [NSDictionary dictionaryWithDictionary:v8[5]];
  }
  else
  {
    id v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__SUUpdateDiscoveryDateManager_dictionaryRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (v10 == [*(id *)(*(void *)(a1 + 32) + 24) count])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 16) count])
    {
      unint64_t v18 = 0;
      do
      {
        uint64_t v19 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 24) objectAtIndexedSubscript:v18];
        uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndexedSubscript:v18];
        [v19 setSafeObject:v20 forKey:v21];

        ++v18;
      }
      while (v18 < [*(id *)(*(void *)(a1 + 32) + 16) count]);
    }
  }
  else
  {
    SULogInfo(@"_descriptorArray and _discoveryDateArray are out of sync. File a radar!", v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

- (BOOL)containsBuildVersion:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SUUpdateDiscoveryDateManager_containsBuildVersion___block_invoke;
  block[3] = &unk_26447D728;
  id v9 = v4;
  uint64_t v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
  LOBYTE(stateQueue) = v12[3] != 0;

  _Block_object_dispose(&v11, 8);
  return (char)stateQueue;
}

uint64_t __53__SUUpdateDiscoveryDateManager_containsBuildVersion___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) containsObject:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryDateArray, 0);
  objc_storeStrong((id *)&self->_buildVersionArray, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end