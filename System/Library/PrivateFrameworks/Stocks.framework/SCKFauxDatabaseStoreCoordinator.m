@interface SCKFauxDatabaseStoreCoordinator
- (OS_dispatch_queue)queue;
- (SCKDatabaseStore)store;
- (SCKFauxDatabaseStoreCoordinator)initWithDatabaseStore:(id)a3;
- (void)readWithAccessor:(id)a3;
- (void)readZone:(id)a3 withAccessor:(id)a4;
- (void)reloadWithAccessor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
- (void)writeWithAccessor:(id)a3;
- (void)writeZone:(id)a3 withAccessor:(id)a4;
@end

@implementation SCKFauxDatabaseStoreCoordinator

- (SCKFauxDatabaseStoreCoordinator)initWithDatabaseStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCKFauxDatabaseStoreCoordinator;
  v6 = [(SCKFauxDatabaseStoreCoordinator *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("SCKFauxDatabaseStoreCoordinator.queue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)readWithAccessor:(id)a3
{
  id v4 = a3;
  id v5 = [(SCKFauxDatabaseStoreCoordinator *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SCKFauxDatabaseStoreCoordinator_readWithAccessor___block_invoke;
  v7[3] = &unk_26467D418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __52__SCKFauxDatabaseStoreCoordinator_readWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) store];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)writeWithAccessor:(id)a3
{
  id v4 = a3;
  id v5 = [(SCKFauxDatabaseStoreCoordinator *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SCKFauxDatabaseStoreCoordinator_writeWithAccessor___block_invoke;
  v7[3] = &unk_26467D418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __53__SCKFauxDatabaseStoreCoordinator_writeWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) store];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)reloadWithAccessor:(id)a3
{
  id v4 = a3;
  id v5 = [(SCKFauxDatabaseStoreCoordinator *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SCKFauxDatabaseStoreCoordinator_reloadWithAccessor___block_invoke;
  v7[3] = &unk_26467D418;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __54__SCKFauxDatabaseStoreCoordinator_reloadWithAccessor___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) store];
  (*(void (**)(uint64_t, id, uint64_t))(v1 + 16))(v1, v2, 1);
}

- (void)readZone:(id)a3 withAccessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCKFauxDatabaseStoreCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SCKFauxDatabaseStoreCoordinator_readZone_withAccessor___block_invoke;
  block[3] = &unk_26467D468;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __57__SCKFauxDatabaseStoreCoordinator_readZone_withAccessor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) store];
  v3 = [v4 zoneStoreForSchema:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (void)writeZone:(id)a3 withAccessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SCKFauxDatabaseStoreCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SCKFauxDatabaseStoreCoordinator_writeZone_withAccessor___block_invoke;
  block[3] = &unk_26467D468;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

void __58__SCKFauxDatabaseStoreCoordinator_writeZone_withAccessor___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) store];
  v3 = [v4 zoneStoreForSchema:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

- (SCKDatabaseStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

@end