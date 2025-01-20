@interface RBStateCaptureManager
- (RBStateCaptureManager)init;
- (id)identifiers;
- (id)stateForSubsystem:(id)a3;
- (void)addItem:(id)a3;
- (void)addItem:(id)a3 withIdentifier:(id)a4;
- (void)addItemWithTitle:(id)a3 identifier:(id)a4 block:(id)a5;
- (void)removeItem:(id)a3;
- (void)removeItemWithIdentifier:(id)a3;
@end

@implementation RBStateCaptureManager

void __33__RBStateCaptureManager_addItem___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock(&_stateCaptureLock);
  [*(id *)(*(void *)(a1 + 32) + 16) addItem:*(void *)(a1 + 40)];
  os_unfair_lock_unlock(&_stateCaptureLock);
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__RBStateCaptureManager_addItem___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeItem:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__RBStateCaptureManager_removeItem___block_invoke;
  v7[3] = &unk_2647C7B98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __36__RBStateCaptureManager_removeItem___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock(&_stateCaptureLock);
  [*(id *)(*(void *)(a1 + 32) + 16) removeItem:*(void *)(a1 + 40)];
  os_unfair_lock_unlock(&_stateCaptureLock);
}

- (RBStateCaptureManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)RBStateCaptureManager;
  v2 = [(RBStateCaptureManager *)&v10 init];
  if (v2)
  {
    v3 = objc_alloc_init(RBSStateCaptureSet);
    itemsWithoutIdentifiers = v2->_itemsWithoutIdentifiers;
    v2->_itemsWithoutIdentifiers = v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    itemsByIdentifier = v2->_itemsByIdentifier;
    v2->_itemsByIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263F64650] createBackgroundQueue:@"RBStateCaptureManager"];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (id)stateForSubsystem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F089D8] string];
  os_unfair_lock_lock(&_stateCaptureLock);
  itemsByIdentifier = self->_itemsByIdentifier;
  if (v4)
  {
    uint64_t v7 = [(NSMutableDictionary *)itemsByIdentifier objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(&_stateCaptureLock);
    if (v7)
    {
      id v8 = [v7 block];
      v9 = v8[2]();

      [v5 appendString:v9];
    }
  }
  else
  {
    uint64_t v7 = (void *)[(NSMutableDictionary *)itemsByIdentifier copy];
    objc_super v10 = [(RBSStateCaptureSet *)self->_itemsWithoutIdentifiers itemsCopy];
    os_unfair_lock_unlock(&_stateCaptureLock);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__RBStateCaptureManager_stateForSubsystem___block_invoke;
    v15[3] = &unk_2647C8A50;
    id v11 = v5;
    id v16 = v11;
    [v7 enumerateKeysAndObjectsUsingBlock:v15];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__RBStateCaptureManager_stateForSubsystem___block_invoke_2;
    v13[3] = &unk_2647C8A78;
    id v14 = v11;
    [v10 enumerateObjectsUsingBlock:v13];
  }
  return v5;
}

void __43__RBStateCaptureManager_stateForSubsystem___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 block];
  v4[2]();
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@",\n"];
  }
  [*(id *)(a1 + 32) appendString:v5];
}

void __43__RBStateCaptureManager_stateForSubsystem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 captureState];
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@",\n"];
  }
  [*(id *)(a1 + 32) appendString:v3];
}

- (void)addItem:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 stateCaptureTitle];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__RBStateCaptureManager_addItem_withIdentifier___block_invoke;
  v10[3] = &unk_2647C8AA0;
  id v11 = v6;
  id v9 = v6;
  [(RBStateCaptureManager *)self addItemWithTitle:v8 identifier:v7 block:v10];
}

uint64_t __48__RBStateCaptureManager_addItem_withIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) captureState];
}

- (void)addItemWithTitle:(id)a3 identifier:(id)a4 block:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  os_unfair_lock_lock(&_stateCaptureLock);
  id v11 = [(NSMutableDictionary *)self->_itemsByIdentifier objectForKeyedSubscript:v8];

  if (v11)
  {
    v12 = rbs_state_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RBStateCaptureManager addItemWithTitle:identifier:block:]((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  v19 = [[RBStateCaptureItem alloc] initWithTitle:v10 identifier:v8 block:v9];

  [(NSMutableDictionary *)self->_itemsByIdentifier setObject:v19 forKeyedSubscript:v8];
  os_unfair_lock_unlock(&_stateCaptureLock);
}

- (void)removeItemWithIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&_stateCaptureLock);
  [(NSMutableDictionary *)self->_itemsByIdentifier setObject:0 forKeyedSubscript:v4];

  os_unfair_lock_unlock(&_stateCaptureLock);
}

- (id)identifiers
{
  os_unfair_lock_lock(&_stateCaptureLock);
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(NSMutableDictionary *)self->_itemsByIdentifier allKeys];
  id v5 = [v3 setWithArray:v4];

  os_unfair_lock_unlock(&_stateCaptureLock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_itemsWithoutIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemsByIdentifier, 0);
}

- (void)addItemWithTitle:(uint64_t)a3 identifier:(uint64_t)a4 block:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end