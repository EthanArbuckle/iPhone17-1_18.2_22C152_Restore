@interface NSArray
@end

@implementation NSArray

void __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_2;
  block[3] = &unk_265545D10;
  id v7 = *(id *)(a1 + 64);
  id v11 = v5;
  uint64_t v8 = *(void *)(a1 + 72);
  uint64_t v17 = a3;
  id v15 = v7;
  uint64_t v16 = v8;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  id v9 = v5;
  dispatch_async(v6, block);
}

void __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 80);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_3;
  v7[3] = &unk_265545CE8;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 80);
  id v10 = v5;
  uint64_t v12 = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v3 + 16))(v3, v4, v2, v7);
}

void __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id v8 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_4;
    block[3] = &unk_265545CC0;
    id v9 = v6;
    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v15 = v9;
    uint64_t v18 = v10;
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 64);
    id v16 = v12;
    uint64_t v19 = v13;
    id v17 = v5;
    dispatch_sync(v8, block);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v1);
  }
  else {
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) atIndexedSubscript:*(void *)(a1 + 64)];
  }
}

uint64_t __53__NSArray__LTAsyncMap___ltAsyncMap_queue_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v3 = a1 + 40;
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 40)) {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, MEMORY[0x263EFFA68]);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
}

void __52__NSArray__LTAsyncMap___ltSequentialMap_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) nextObject];
  if (v2)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__NSArray__LTAsyncMap___ltSequentialMap_completion___block_invoke_2;
    v8[3] = &unk_265545D88;
    uint64_t v3 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 64);
    id v9 = v4;
    uint64_t v11 = v5;
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v2, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
}

void __52__NSArray__LTAsyncMap___ltSequentialMap_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  else
  {
    if (v8) {
      [*(id *)(a1 + 32) addObject:v8];
    }
    (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  }
}

@end