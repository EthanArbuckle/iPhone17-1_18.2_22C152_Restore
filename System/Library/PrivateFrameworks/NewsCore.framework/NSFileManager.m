@interface NSFileManager
@end

@implementation NSFileManager

uint64_t __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v23 = 0;
  char v4 = [v2 removeItemAtPath:v3 error:&v23];
  id v5 = v23;
  v6 = v5;
  if (v4)
  {
LABEL_2:
    v7 = (void *)a1[7];
    if (v7)
    {
      v8 = a1[6];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_4;
      v16[3] = &unk_1E5B575C0;
      v9 = &v18;
      id v18 = v7;
      char v19 = 1;
      v10 = &v17;
      id v17 = v6;
      v11 = v16;
LABEL_9:
      dispatch_async(v8, v11);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v12 = [v5 domain];
  v13 = v12;
  if (v12 == (void *)*MEMORY[0x1E4F281F8])
  {
    uint64_t v14 = [v6 code];

    if (v14 == 4) {
      goto LABEL_2;
    }
  }
  else
  {
  }
  v15 = (void *)a1[7];
  if (v15)
  {
    v8 = a1[6];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_3;
    block[3] = &unk_1E5B4C7C0;
    v9 = &v22;
    id v22 = v15;
    v10 = &v21;
    id v21 = v6;
    v11 = block;
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __80__NSFileManager_FCAdditions__fc_quicklyClearDirectory_callbackQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

@end