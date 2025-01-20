@interface NTKTransactionCommitCoordinator
+ (BOOL)addTransactionCommitHandler:(id)a3;
+ (id)_sharedInstance;
+ (void)flushCommitHandlers;
- (BOOL)_addTransactionCommitHandler:(id)a3;
- (NTKTransactionCommitCoordinator)init;
- (void)_registerCATransactionCommitHandler;
@end

@implementation NTKTransactionCommitCoordinator

+ (BOOL)addTransactionCommitHandler:(id)a3
{
  id v4 = a3;
  v5 = [a1 _sharedInstance];
  char v6 = [v5 _addTransactionCommitHandler:v4];

  return v6;
}

+ (id)_sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__NTKTransactionCommitCoordinator__sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedInstance_onceToken_0 != -1) {
    dispatch_once(&_sharedInstance_onceToken_0, block);
  }
  v2 = (void *)_sharedInstance___coordinator;
  return v2;
}

void __50__NTKTransactionCommitCoordinator__sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_sharedInstance___coordinator;
  _sharedInstance___coordinator = (uint64_t)v1;
}

- (NTKTransactionCommitCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKTransactionCommitCoordinator;
  v2 = [(NTKTransactionCommitCoordinator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    commitHandlers = v2->_commitHandlers;
    v2->_commitHandlers = v3;
  }
  return v2;
}

- (BOOL)_addTransactionCommitHandler:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [MEMORY[0x1E4F39CF8] activate];
  int v5 = [MEMORY[0x1E4F39CF8] currentState];
  int v6 = v5 & 3;
  if ((v5 & 3) != 0)
  {
    if (![(NSMutableArray *)self->_commitHandlers count]) {
      [(NTKTransactionCommitCoordinator *)self _registerCATransactionCommitHandler];
    }
    commitHandlers = self->_commitHandlers;
    v8 = _Block_copy(v4);
    [(NSMutableArray *)commitHandlers addObject:v8];
  }
  else
  {
    int v9 = v5;
    v10 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NTKTransactionCommitCoordinator _addTransactionCommitHandler:](v9, v10);
    }
  }
  return v6 != 0;
}

+ (void)flushCommitHandlers
{
  id v2 = [a1 _sharedInstance];
  [v2 _registerCATransactionCommitHandler];
}

- (void)_registerCATransactionCommitHandler
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__NTKTransactionCommitCoordinator__registerCATransactionCommitHandler__block_invoke;
  v2[3] = &unk_1E62BFF20;
  v2[4] = self;
  [MEMORY[0x1E4F39CF8] addCommitHandler:v2 forPhase:1];
}

uint64_t __70__NTKTransactionCommitCoordinator__registerCATransactionCommitHandler__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) enumerateObjectsUsingBlock:&__block_literal_global_78];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  return [v2 removeAllObjects];
}

uint64_t __70__NTKTransactionCommitCoordinator__registerCATransactionCommitHandler__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void).cxx_destruct
{
}

- (void)_addTransactionCommitHandler:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F28E78] string];
  int v5 = v4;
  if (a1)
  {
    ___StateDescription_block_invoke((uint64_t)v4, v4, @"implicit");
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      ___StateDescription_block_invoke((uint64_t)v4, v5, @"flushed");
      if ((a1 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  ___StateDescription_block_invoke((uint64_t)v4, v5, @"explicit");
  if ((a1 & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((a1 & 8) != 0) {
LABEL_5:
  }
    ___StateDescription_block_invoke((uint64_t)v4, v5, @"committing");
LABEL_6:
  int v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  v7[0] = 67109634;
  v7[1] = a1;
  __int16 v8 = 2112;
  int v9 = v5;
  __int16 v10 = 2112;
  v11 = v6;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Attempt to add implicit/explicit transaction commit handler in transaction state %d (%@) will FAIL. Call stack: %@", (uint8_t *)v7, 0x1Cu);
}

@end