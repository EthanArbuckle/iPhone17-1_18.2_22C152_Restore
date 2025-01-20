@interface PG
@end

@implementation PG

void __PG_dispatch_async_with_timeout_block_invoke(uint64_t a1)
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __PG_dispatch_async_with_timeout_block_invoke_2;
  block[3] = &unk_1E610D000;
  id v16 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  v17 = v21;
  v18 = v19;
  id v14 = v4;
  dispatch_semaphore_t v15 = v2;
  v5 = v2;
  dispatch_async(v3, block);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
  dispatch_semaphore_wait(v5, v6);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __PG_dispatch_async_with_timeout_block_invoke_5;
  v8[3] = &unk_1E610D050;
  v11 = v21;
  v7 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 56);
  v12 = v19;
  dispatch_async(v7, v8);

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
}

void __PG_dispatch_async_with_timeout_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __PG_dispatch_async_with_timeout_block_invoke_3;
  v3[3] = &unk_1E610CFD8;
  id v4 = *(id *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __PG_dispatch_async_with_timeout_block_invoke_3(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __PG_dispatch_async_with_timeout_block_invoke_4;
  block[3] = &unk_1E610CFB0;
  uint64_t v6 = *(void *)(a1 + 56);
  long long v3 = *(_OWORD *)(a1 + 40);
  id v2 = (id)v3;
  long long v5 = v3;
  dispatch_async(v1, block);
}

intptr_t __PG_dispatch_async_with_timeout_block_invoke_4(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(result + 32));
  }
  return result;
}

void __PG_dispatch_async_with_timeout_block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __PG_dispatch_async_with_timeout_block_invoke_6;
  v5[3] = &unk_1E610D028;
  id v2 = *(NSObject **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(v2, v5);
}

uint64_t __PG_dispatch_async_with_timeout_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

@end