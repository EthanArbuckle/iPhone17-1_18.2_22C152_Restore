@interface PPTransaction
+ (void)readTransactionWithHandle:(id)a3 block:(id)a4;
+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4;
@end

@implementation PPTransaction

void __50__PPTransaction_writeTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [[PPWriteTransaction alloc] initWithHandle:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, PPWriteTransaction *))(v1 + 16))(v1, v2);
}

void __49__PPTransaction_readTransactionWithHandle_block___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = [[PPReadTransaction alloc] initWithHandle:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, PPReadTransaction *))(v1 + 16))(v1, v2);
}

+ (void)readTransactionWithHandle:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PPTransaction_readTransactionWithHandle_block___block_invoke;
  v9[3] = &unk_1E65DA2E8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  [v7 readTransaction:v9];
}

+ (void)writeTransactionWithHandle:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__PPTransaction_writeTransactionWithHandle_block___block_invoke;
  v9[3] = &unk_1E65DA2E8;
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  id v8 = v6;
  [v7 writeTransaction:v9];
}

@end