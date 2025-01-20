@interface TPStringTable
+ (id)defaultTable;
- (NSHashTable)table;
- (OS_dispatch_queue)queue;
- (TPStringTable)initWithIdentifier:(id)a3;
- (id)setWithArray:(id)a3;
- (id)stringWithString:(id)a3;
- (unint64_t)_count;
- (void)setQueue:(id)a3;
- (void)setTable:(id)a3;
@end

@implementation TPStringTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setTable:(id)a3
{
}

- (NSHashTable)table
{
  return (NSHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)setWithArray:(id)a3
{
  id v4 = a3;
  size_t v5 = [v4 count];
  v6 = (void **)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v8 = [v4 objectAtIndexedSubscript:i];
      uint64_t v9 = [(TPStringTable *)self stringWithString:v8];
      v10 = v6[i];
      v6[i] = (void *)v9;
    }
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263EFFA08]) initWithObjects:v6 count:v5];
  if (v5)
  {
    v12 = v6;
    do
    {
      v13 = *v12;
      *v12++ = 0;

      --v5;
    }
    while (v5);
  }
  free(v6);

  return v11;
}

- (id)stringWithString:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2998;
  v21 = __Block_byref_object_dispose__2999;
  id v22 = 0;
  size_t v5 = [(TPStringTable *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__TPStringTable_stringWithString___block_invoke;
  block[3] = &unk_2640ECA78;
  v16 = &v17;
  block[4] = self;
  id v6 = v4;
  id v15 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)v18[5];
  if (!v7)
  {
    v8 = [(TPStringTable *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __34__TPStringTable_stringWithString___block_invoke_2;
    v11[3] = &unk_2640ECA78;
    v13 = &v17;
    v11[4] = self;
    id v12 = v6;
    dispatch_barrier_sync(v8, v11);

    v7 = (void *)v18[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __34__TPStringTable_stringWithString___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) table];
  uint64_t v2 = [v5 member:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __34__TPStringTable_stringWithString___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) table];
  uint64_t v3 = [v2 member:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v6 = [*(id *)(a1 + 32) table];
    [v6 addObject:*(void *)(a1 + 40)];

    v7 = *(void **)(a1 + 40);
    v8 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_storeStrong(v8, v7);
  }
}

- (TPStringTable)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPStringTable;
  id v5 = [(TPStringTable *)&v11 init];
  if (v5)
  {
    id v6 = (const char *)[v4 UTF8String];
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(v6, v7);
    [(TPStringTable *)v5 setQueue:v8];

    id v9 = (void *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    [(TPStringTable *)v5 setTable:v9];
  }
  return v5;
}

+ (id)defaultTable
{
  if (defaultTable_once != -1) {
    dispatch_once(&defaultTable_once, &__block_literal_global_3007);
  }
  uint64_t v2 = (void *)defaultTable_table;
  return v2;
}

uint64_t __29__TPStringTable_defaultTable__block_invoke()
{
  defaultTable_table = [[TPStringTable alloc] initWithIdentifier:@"TPStringTable.defaultTable"];
  return MEMORY[0x270F9A758]();
}

- (unint64_t)_count
{
  uint64_t v7 = 0;
  dispatch_queue_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = [(TPStringTable *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__TPStringTable_Testing___count__block_invoke;
  v6[3] = &unk_2640ECAC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __32__TPStringTable_Testing___count__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) table];
  uint64_t v2 = [v3 allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

@end