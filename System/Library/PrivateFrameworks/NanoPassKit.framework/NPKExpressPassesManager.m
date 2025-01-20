@interface NPKExpressPassesManager
- (BOOL)shouldAllowMovingItemAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (NPKExpressPassesManager)init;
- (NSArray)currentPasses;
- (NSArray)currentPaymentPasses;
- (NSArray)currentSecureElementPasses;
- (NSHashTable)observers;
- (id)defaultPaymentPass;
- (id)dynamicStateForPass:(id)a3;
- (id)expiredPasses;
- (id)passForUniqueID:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setCurrentPasses:(id)a3;
- (void)setCurrentPaymentPasses:(id)a3;
- (void)setCurrentSecureElementPasses:(id)a3;
- (void)setObservers:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateWithExpressPass:(id)a3 siblingExpressPasses:(id)a4;
@end

@implementation NPKExpressPassesManager

- (NPKExpressPassesManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)NPKExpressPassesManager;
  v2 = [(NPKExpressPassesManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x263F088B0], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v6;
    if (!v5)
    {
      [(NSHashTable *)self->_observers addObject:v6];
      id v4 = v6;
    }
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    BOOL v5 = [(NSHashTable *)self->_observers containsObject:v4];
    id v4 = v6;
    if (v5)
    {
      [(NSHashTable *)self->_observers removeObject:v6];
      id v4 = v6;
    }
  }
}

- (void)updateWithExpressPass:(id)a3 siblingExpressPasses:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263EFF980] array];
  v9 = v8;
  if (v6) {
    [v8 addObject:v6];
  }
  v32 = v6;
  if (v7) {
    [v9 addObjectsFromArray:v7];
  }
  v10 = (NSArray *)objc_msgSend(v9, "copy", v7);
  currentPasses = self->_currentPasses;
  self->_currentPasses = v10;

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v14 = self->_currentPasses;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v20 = [v19 paymentPass];
        [v12 safelyAddObject:v20];

        v21 = [v19 secureElementPass];
        [v13 safelyAddObject:v21];
      }
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v16);
  }

  v22 = (NSArray *)[v12 copy];
  currentPaymentPasses = self->_currentPaymentPasses;
  self->_currentPaymentPasses = v22;

  v24 = (NSArray *)[v13 copy];
  currentSecureElementPasses = self->_currentSecureElementPasses;
  self->_currentSecureElementPasses = v24;

  v26 = [(NSHashTable *)self->_observers allObjects];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v33 + 1) + 8 * j) passesDataSourceDidReloadPasses:self];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v28);
  }
}

- (BOOL)shouldAllowMovingItemAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  return 0;
}

- (id)defaultPaymentPass
{
  return 0;
}

- (id)expiredPasses
{
  return 0;
}

- (id)passForUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__13;
  uint64_t v16 = __Block_byref_object_dispose__13;
  id v17 = 0;
  BOOL v5 = [(NPKExpressPassesManager *)self passes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__NPKExpressPassesManager_passForUniqueID___block_invoke;
  v9[3] = &unk_2644D2C58;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__NPKExpressPassesManager_passForUniqueID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 uniqueID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)dynamicStateForPass:(id)a3
{
  return 0;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSArray)currentPasses
{
  return self->_currentPasses;
}

- (void)setCurrentPasses:(id)a3
{
}

- (NSArray)currentPaymentPasses
{
  return self->_currentPaymentPasses;
}

- (void)setCurrentPaymentPasses:(id)a3
{
}

- (NSArray)currentSecureElementPasses
{
  return self->_currentSecureElementPasses;
}

- (void)setCurrentSecureElementPasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSecureElementPasses, 0);
  objc_storeStrong((id *)&self->_currentPaymentPasses, 0);
  objc_storeStrong((id *)&self->_currentPasses, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end