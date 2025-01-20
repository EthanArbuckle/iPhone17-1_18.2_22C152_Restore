@interface TIRequestedInputModes
+ (id)defaultDatabaseURL;
- (TIRequestedInputModes)init;
- (TIRequestedInputModes)initWithURL:(id)a3;
- (id)_inputModes;
- (void)_addInputMode:(id)a3 date:(id)a4 handler:(id)a5;
- (void)_inputModes:(id)a3;
- (void)_loadIfNecessaryWithCompletion:(id)a3;
- (void)_removeAllInputModes:(id)a3;
- (void)_removeInputModesBeforeDate:(id)a3 handler:(id)a4;
- (void)_saveInputModes;
- (void)addInputMode:(id)a3 date:(id)a4 handler:(id)a5;
- (void)inputModes:(id)a3;
- (void)removeAllInputModes:(id)a3;
- (void)removeInputModesBeforeDate:(id)a3 handler:(id)a4;
@end

@implementation TIRequestedInputModes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputModesByDate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)removeAllInputModes:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

uint64_t __45__TIRequestedInputModes_removeAllInputModes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllInputModes:*(void *)(a1 + 40)];
}

- (void)removeInputModesBeforeDate:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  TIDispatchAsync();
}

uint64_t __60__TIRequestedInputModes_removeInputModesBeforeDate_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeInputModesBeforeDate:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)addInputMode:(id)a3 date:(id)a4 handler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  id v9 = v10;
  TIDispatchAsync();
}

uint64_t __51__TIRequestedInputModes_addInputMode_date_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addInputMode:*(void *)(a1 + 40) date:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)inputModes:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

uint64_t __36__TIRequestedInputModes_inputModes___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inputModes:*(void *)(a1 + 40)];
}

- (void)_removeAllInputModes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__TIRequestedInputModes__removeAllInputModes___block_invoke;
  v6[3] = &unk_1E6E2D928;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TIRequestedInputModes *)self _loadIfNecessaryWithCompletion:v6];
}

uint64_t __46__TIRequestedInputModes__removeAllInputModes___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  [*(id *)(a1 + 32) _saveInputModes];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)_removeInputModesBeforeDate:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__TIRequestedInputModes__removeInputModesBeforeDate_handler___block_invoke;
  v10[3] = &unk_1E6E2E308;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(TIRequestedInputModes *)self _loadIfNecessaryWithCompletion:v10];
}

void __61__TIRequestedInputModes__removeInputModesBeforeDate_handler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__TIRequestedInputModes__removeInputModesBeforeDate_handler___block_invoke_2;
  v8[3] = &unk_1E6E2D408;
  id v9 = *(id *)(a1 + 40);
  id v3 = [v2 keysOfEntriesPassingTest:v8];
  if ([v3 count])
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 32);
    id v5 = [v3 allObjects];
    [v4 removeObjectsForKeys:v5];

    [*(id *)(a1 + 32) _saveInputModes];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 32) _inputModes];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

BOOL __61__TIRequestedInputModes__removeInputModesBeforeDate_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a3;
  id v5 = [v4 earlierDate:v3];

  return v5 == v4;
}

- (void)_addInputMode:(id)a3 date:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__TIRequestedInputModes__addInputMode_date_handler___block_invoke;
  v14[3] = &unk_1E6E2D3E0;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(TIRequestedInputModes *)self _loadIfNecessaryWithCompletion:v14];
}

void __52__TIRequestedInputModes__addInputMode_date_handler___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKey:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 32) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
  if (!v5 || ([*(id *)(a1 + 48) timeIntervalSinceDate:v5], v2 > 86400.0)) {
    [*(id *)(a1 + 32) _saveInputModes];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = [*(id *)(a1 + 32) _inputModes];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (void)_inputModes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__TIRequestedInputModes__inputModes___block_invoke;
  v6[3] = &unk_1E6E2D928;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(TIRequestedInputModes *)self _loadIfNecessaryWithCompletion:v6];
}

void __37__TIRequestedInputModes__inputModes___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _inputModes];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_inputModes
{
  id v2 = [(NSMutableDictionary *)self->_inputModesByDate allKeys];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (void)_saveInputModes
{
  databaseURL = self->_databaseURL;
  if (databaseURL)
  {
    inputModesByDate = self->_inputModesByDate;
    id v4 = databaseURL;
    id v5 = (id)[(NSMutableDictionary *)inputModesByDate copy];
    [v5 writeToURL:v4 atomically:1];
  }
}

- (void)_loadIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (!self->_didLoad)
  {
    self->_didLoad = 1;
    if (self->_databaseURL)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfURL:");
      uint64_t v6 = (void *)v5;
      id v7 = (void *)MEMORY[0x1E4F1CC08];
      if (v5) {
        id v7 = (void *)v5;
      }
      id v8 = v7;

      id v9 = (NSMutableDictionary *)[v8 mutableCopy];
      inputModesByDate = self->_inputModesByDate;
      self->_inputModesByDate = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
      inputModesByDate = self->_inputModesByDate;
      self->_inputModesByDate = v11;
    }

    id v4 = v12;
  }
  (*((void (**)(void))v4 + 2))();
}

- (TIRequestedInputModes)initWithURL:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIRequestedInputModes;
  uint64_t v5 = [(TIRequestedInputModes *)&v13 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_didLoad = 0;
    uint64_t v7 = [v4 copy];
    databaseURL = v6->_databaseURL;
    v6->_databaseURL = (NSURL *)v7;

    id v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.TextInput.requested-input-modes", v9);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v10;
  }
  return v6;
}

- (TIRequestedInputModes)init
{
  uint64_t v3 = +[TIRequestedInputModes defaultDatabaseURL];
  id v4 = [(TIRequestedInputModes *)self initWithURL:v3];

  return v4;
}

+ (id)defaultDatabaseURL
{
  id v2 = TI_KB_USER_DIRECTORY();
  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2 isDirectory:1];
  id v4 = [v3 URLByAppendingPathComponent:@"requested_linguistic_assets.plist"];

  return v4;
}

@end