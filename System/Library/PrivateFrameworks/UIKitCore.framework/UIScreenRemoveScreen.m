@interface UIScreenRemoveScreen
@end

@implementation UIScreenRemoveScreen

void ___UIScreenRemoveScreen_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1EB25C5E8 != -1) {
    dispatch_once(&qword_1EB25C5E8, &__block_literal_global_899_0);
  }
  id v2 = (id)qword_1EB25C5F0;
  v3 = [*(id *)(a1 + 32) displayIdentity];
  if (qword_1EB25C618 != -1) {
    dispatch_once(&qword_1EB25C618, &__block_literal_global_915);
  }
  id v4 = (id)qword_1EB25C610;
  [v4 removeObject:v3];
  if (![v4 countForObject:v3])
  {
    v5 = [v2 firstObject];
    v6 = *(void **)(a1 + 32);

    if (v5 == v6)
    {
      if (qword_1EB25C620 != -1) {
        dispatch_once(&qword_1EB25C620, &__block_literal_global_918_1);
      }
      if (byte_1EB25C544)
      {
        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v7 = v2;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
LABEL_13:
          uint64_t v11 = 0;
          while (1)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
            if (objc_msgSend(v12, "_isMainLikeScreen", (void)v14))
            {
              if (v12 != *(void **)(a1 + 32)) {
                break;
              }
            }
            if (v9 == ++v11)
            {
              uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
              if (v9) {
                goto LABEL_13;
              }
              goto LABEL_23;
            }
          }
          id v13 = v12;

          if (!v13) {
            goto LABEL_24;
          }
          [v7 removeObject:v13];
          [v7 replaceObjectAtIndex:0 withObject:v13];
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          id v7 = v13;
        }
LABEL_23:
      }
    }
    else
    {
      [v2 removeObject:*(void *)(a1 + 32)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
LABEL_24:
}

@end