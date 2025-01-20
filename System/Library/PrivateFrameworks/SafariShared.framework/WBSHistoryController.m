@interface WBSHistoryController
+ (WBSHistoryController)existingSharedHistoryController;
- (WBSHistoryController)init;
- (id)_createHistoryForProfileIdentifier:(id)a3;
- (id)_createHistorySessionControllerForHistory:(id)a3;
- (id)historyForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4;
- (id)historySessionControllerForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4;
- (id)normalizeProfileIdentifier:(id)a3;
@end

@implementation WBSHistoryController

void __65__WBSHistoryController_historyForProfileIdentifier_loadIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && *(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = [*(id *)(a1 + 32) _createHistoryForProfileIdentifier:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1 + 40);
    v9 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    [v9 setObject:v10 forKey:v8];
  }
}

- (id)historyForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__21;
  v20 = __Block_byref_object_dispose__21;
  id v21 = 0;
  v7 = [(WBSHistoryController *)self normalizeProfileIdentifier:v6];

  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__WBSHistoryController_historyForProfileIdentifier_loadIfNeeded___block_invoke;
  v12[3] = &unk_1E5C9C728;
  id v13 = v7;
  v14 = &v16;
  v12[4] = self;
  BOOL v15 = a4;
  id v9 = v7;
  dispatch_sync(queue, v12);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)normalizeProfileIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length] && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E4F980C8]) & 1) == 0) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = &stru_1EFBE3CF8;
  }

  return v4;
}

- (WBSHistoryController)init
{
  v15.receiver = self;
  v15.super_class = (Class)WBSHistoryController;
  uint64_t v2 = [(WBSHistoryController *)&v15 init];
  if (v2)
  {
    objc_storeStrong((id *)&sharedHistoryController, v2);
    id v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"com.apple.Safari.%@.%p", v5, v2];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    historyMap = v2->_historyMap;
    v2->_historyMap = (NSMapTable *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    historySessionControllerMap = v2->_historySessionControllerMap;
    v2->_historySessionControllerMap = (NSMapTable *)v11;

    id v13 = v2;
  }

  return v2;
}

+ (WBSHistoryController)existingSharedHistoryController
{
  return (WBSHistoryController *)(id)sharedHistoryController;
}

- (id)_createHistoryForProfileIdentifier:(id)a3
{
  return 0;
}

- (id)_createHistorySessionControllerForHistory:(id)a3
{
  id v3 = a3;
  v4 = [v3 databaseID];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [[WBSHistorySessionController alloc] initWithHistory:v3];
  }
  else
  {
    id v6 = +[WBSHistorySessionController sharedSessionController];
  }
  dispatch_queue_t v7 = v6;

  return v7;
}

- (id)historySessionControllerForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__21;
  id v21 = __Block_byref_object_dispose__21;
  id v22 = 0;
  dispatch_queue_t v7 = [(WBSHistoryController *)self normalizeProfileIdentifier:v6];

  uint64_t v8 = [(WBSHistoryController *)self historyForProfileIdentifier:v7 loadIfNeeded:v4];
  if (v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__WBSHistoryController_historySessionControllerForProfileIdentifier_loadIfNeeded___block_invoke;
    block[3] = &unk_1E5C9C750;
    objc_super v15 = &v17;
    block[4] = self;
    id v13 = v7;
    BOOL v16 = v4;
    id v14 = v8;
    dispatch_sync(queue, block);
    id v10 = (id)v18[5];
  }
  else
  {
    id v10 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __82__WBSHistoryController_historySessionControllerForProfileIdentifier_loadIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) && *(unsigned char *)(a1 + 64))
  {
    uint64_t v5 = [*(id *)(a1 + 32) _createHistorySessionControllerForHistory:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    dispatch_queue_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v9 setObject:v10 forKey:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historySessionControllerMap, 0);
  objc_storeStrong((id *)&self->_historyMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end