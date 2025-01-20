@interface SUCrawlViewController
@end

@implementation SUCrawlViewController

void ___SUCrawlViewController_block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v23 = a3;
  uint64_t v24 = a1;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v8 = [v23 childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!*a4)
        {
          v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v14 = _Block_copy(v7);
          v15 = [v13 presentedViewController];
          (*((void (**)(id, void *, void *, unsigned char *))v7 + 2))(v7, v14, v15, a4);

          if (!*a4) {
            (*(void (**)(void))(*(void *)(v24 + 32) + 16))();
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }

  --*(void *)(*(void *)(*(void *)(v24 + 40) + 8) + 24);
  if (!*a4)
  {
    ++*(void *)(*(void *)(*(void *)(v24 + 40) + 8) + 24);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v16 = [v23 childViewControllers];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * j);
          v22 = _Block_copy(v7);
          (*((void (**)(id, void *, uint64_t, unsigned char *))v7 + 2))(v7, v22, v21, a4);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v18);
    }

    --*(void *)(*(void *)(*(void *)(v24 + 40) + 8) + 24);
  }
}

void ___SUCrawlViewController_block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v17 = a1;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = [a3 childViewControllers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!*a4)
        {
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v14 = _Block_copy(v7);
          v15 = [v13 presentedViewController];
          (*((void (**)(id, void *, void *, unsigned char *))v7 + 2))(v7, v14, v15, a4);

          if (!*a4) {
            (*(void (**)(void))(*(void *)(v17 + 32) + 16))();
          }
          v16 = _Block_copy(v7);
          (*((void (**)(id, void *, void *, unsigned char *))v7 + 2))(v7, v16, v13, a4);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  --*(void *)(*(void *)(*(void *)(v17 + 40) + 8) + 24);
}

@end