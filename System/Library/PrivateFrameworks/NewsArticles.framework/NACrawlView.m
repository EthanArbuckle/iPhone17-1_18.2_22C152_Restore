@interface NACrawlView
@end

@implementation NACrawlView

id ___NACrawlView_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 2)
  {
    v3 = (id *)v9;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = ___NACrawlView_block_invoke_4;
    v9[3] = &unk_1E64063B8;
    long long v8 = *(_OWORD *)(a1 + 32);
    id v5 = (id)v8;
    long long v10 = v8;
  }
  else
  {
    if (v2 != 1) {
      goto LABEL_6;
    }
    v3 = (id *)v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___NACrawlView_block_invoke_3;
    v11[3] = &unk_1E64063B8;
    long long v7 = *(_OWORD *)(a1 + 32);
    id v4 = (id)v7;
    long long v12 = v7;
  }
  v1 = _Block_copy(v3);

LABEL_6:
  return v1;
}

void ___NACrawlView_block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = [v8 subviews];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        if (!*a4) {
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (!*a4)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v8;
    v14 = [v8 subviews];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * j);
          v20 = _Block_copy(v7);
          (*((void (**)(id, void *, uint64_t, unsigned char *))v7 + 2))(v7, v20, v19, a4);
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    id v8 = v21;
  }
}

void ___NACrawlView_block_invoke_4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = objc_msgSend(a3, "subviews", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!*a4)
        {
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
          if (!*a4)
          {
            v14 = _Block_copy(v7);
            (*((void (**)(id, void *, uint64_t, unsigned char *))v7 + 2))(v7, v14, v13, a4);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  --*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

@end