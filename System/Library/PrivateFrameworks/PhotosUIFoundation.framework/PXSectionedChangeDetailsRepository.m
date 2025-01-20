@interface PXSectionedChangeDetailsRepository
- (PXSectionedChangeDetailsRepository)init;
- (PXSectionedChangeDetailsRepository)initWithChangeHistoryLimit:(int64_t)a3;
- (id)changeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4;
- (id)coalescedChangeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4;
- (int64_t)historyLimit;
- (void)addChangeDetails:(id)a3;
@end

@implementation PXSectionedChangeDetailsRepository

- (PXSectionedChangeDetailsRepository)initWithChangeHistoryLimit:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXSectionedChangeDetailsRepository;
  v4 = [(PXSectionedChangeDetailsRepository *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_historyLimit = a3;
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    allChangeDetails = v5->_allChangeDetails;
    v5->_allChangeDetails = (NSMutableArray *)v6;

    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photosUIFoundation.changeDetailsRepository", v8);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

void __99__PXSectionedChangeDetailsRepository_changeDetailsFromDataSourceIdentifier_toDataSourceIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v34 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v29;
    uint64_t v19 = *(void *)v29;
    uint64_t v20 = v1;
    do
    {
      uint64_t v5 = 0;
      uint64_t v21 = v3;
      do
      {
        if (*(void *)v29 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        uint64_t v23 = v5;
        if ([v6 toDataSourceIdentifier] == *(void *)(v1 + 48))
        {
          v7 = *(void **)(v1 + 40);
          v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v6, 0);
          [v7 addObject:v8];

LABEL_18:
          if ([v6 fromDataSourceIdentifier] == *(void *)(v1 + 56)) {
            goto LABEL_23;
          }
          goto LABEL_21;
        }
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = *(id *)(v1 + 40);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (!v10)
        {

          goto LABEL_21;
        }
        uint64_t v11 = v10;
        char v12 = 0;
        uint64_t v13 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v9);
            }
            v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v16 = [v15 firstObject];
            uint64_t v17 = [v16 fromDataSourceIdentifier];
            uint64_t v18 = [v6 toDataSourceIdentifier];

            if (v17 == v18)
            {
              [v15 insertObject:v6 atIndex:0];
              char v12 = 1;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v11);

        uint64_t v4 = v19;
        uint64_t v1 = v20;
        uint64_t v3 = v21;
        if (v12) {
          goto LABEL_18;
        }
LABEL_21:
        uint64_t v5 = v23 + 1;
      }
      while (v23 + 1 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v3);
  }
LABEL_23:
}

- (void)addChangeDetails:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__PXSectionedChangeDetailsRepository_addChangeDetails___block_invoke;
    v7[3] = &unk_26545B778;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(internalQueue, v7);
  }
}

- (id)changeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  v55[1] = *MEMORY[0x263EF8340];
  if (a3 == a4)
  {
    id v5 = +[PXSectionedDataSourceChangeDetails changeDetailsWithNoChangesFromDataSourceIdentifier:a3 toDataSourceIdentifier:a3];
    v55[0] = v5;
    uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
    v7 = (id *)v55;
LABEL_21:
    id v25 = [v6 arrayWithObjects:v7 count:1];
    goto LABEL_38;
  }
  if (!a3 || !a4)
  {
    id v5 = +[PXSectionedDataSourceChangeDetails changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:a3 toDataSourceIdentifier:a4];
    id v54 = v5;
    uint64_t v6 = (void *)MEMORY[0x263EFF8C0];
    v7 = &v54;
    goto LABEL_21;
  }
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__PXSectionedChangeDetailsRepository_changeDetailsFromDataSourceIdentifier_toDataSourceIdentifier___block_invoke;
  block[3] = &unk_26545A600;
  block[4] = self;
  int64_t v49 = a4;
  id v12 = v10;
  id v48 = v12;
  int64_t v50 = a3;
  dispatch_sync(internalQueue, block);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = v12;
  uint64_t v13 = [v5 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (!v13)
  {
    id v15 = 0;
    goto LABEL_23;
  }
  uint64_t v14 = v13;
  id v15 = 0;
  uint64_t v16 = *(void *)v44;
  do
  {
    uint64_t v17 = 0;
    uint64_t v38 = v14;
    do
    {
      if (*(void *)v44 != v16) {
        objc_enumerationMutation(v5);
      }
      uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8 * v17);
      if (!v15
        || (unint64_t v19 = [*(id *)(*((void *)&v43 + 1) + 8 * v17) count], v19 < objc_msgSend(v15, "count")))
      {
        uint64_t v20 = [v18 firstObject];
        if ([v20 fromDataSourceIdentifier] != a3) {
          goto LABEL_15;
        }
        uint64_t v21 = v16;
        id v22 = v5;
        uint64_t v23 = [v18 lastObject];
        uint64_t v24 = [v23 toDataSourceIdentifier];

        if (v24 == a4)
        {
          uint64_t v20 = v15;
          id v15 = v18;
          id v5 = v22;
          uint64_t v16 = v21;
          uint64_t v14 = v38;
LABEL_15:

          goto LABEL_17;
        }
        id v5 = v22;
        uint64_t v16 = v21;
        uint64_t v14 = v38;
      }
LABEL_17:
      ++v17;
    }
    while (v14 != v17);
    uint64_t v14 = [v5 countByEnumeratingWithState:&v43 objects:v53 count:16];
  }
  while (v14);
LABEL_23:

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v26 = v15;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = [*(id *)(*((void *)&v39 + 1) + 8 * i) sectionChanges];
        int v32 = [v31 hasIncrementalChanges];

        if (!v32)
        {
          v33 = v26;
          goto LABEL_35;
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v52 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }

  v33 = [v26 firstObject];
  if ([v33 fromDataSourceIdentifier] == a3)
  {
    uint64_t v34 = [v26 lastObject];
    uint64_t v35 = [v34 toDataSourceIdentifier];

    if (v35 == a4)
    {
      id v25 = v26;
      goto LABEL_37;
    }
  }
  else
  {
LABEL_35:
  }
  v36 = +[PXSectionedDataSourceChangeDetails changeDetailsWithoutIncrementalChangesFromDataSourceIdentifier:a3 toDataSourceIdentifier:a4];
  v51 = v36;
  id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];

LABEL_37:
LABEL_38:

  return v25;
}

unint64_t __55__PXSectionedChangeDetailsRepository_addChangeDetails___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) insertObject:*(void *)(a1 + 40) atIndex:0];
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  if (result > 2 * v4)
  {
    uint64_t v5 = [*(id *)(v3 + 8) count] - v4;
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 8);
    return objc_msgSend(v6, "removeObjectsInRange:", v4, v5);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_allChangeDetails, 0);
}

- (int64_t)historyLimit
{
  return self->_historyLimit;
}

- (id)coalescedChangeDetailsFromDataSourceIdentifier:(int64_t)a3 toDataSourceIdentifier:(int64_t)a4
{
  uint64_t v4 = [(PXSectionedChangeDetailsRepository *)self changeDetailsFromDataSourceIdentifier:a3 toDataSourceIdentifier:a4];
  if ([v4 count])
  {
    uint64_t v5 = +[PXSectionedChangeDetailsCoalescer changeDetailsByCoalescingChangeDetails:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (PXSectionedChangeDetailsRepository)init
{
  uint64_t v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"PXSectionedChangeDetailsRepository.m", 19, @"%@ not supported", v5 object file lineNumber description];

  abort();
}

@end