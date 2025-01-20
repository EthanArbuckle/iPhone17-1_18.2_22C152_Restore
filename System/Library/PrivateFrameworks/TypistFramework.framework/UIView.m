@interface UIView
@end

@implementation UIView

void __36__UIView_ViewRecursion__allSubViews__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "subviews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) allSubViews];
        [v7 addObjectsFromArray:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void __44__UIView_ViewRecursion__viewExistsOnScreen___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v3 = [v2 windows];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = [*(id *)(*((void *)&v27 + 1) + 8 * v8) allSubViews];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v12 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v24;
LABEL_8:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
          NSClassFromString(*(NSString **)(a1 + 32));
          if (objc_opt_isKindOfClass())
          {
            [v17 frame];
            v34.origin.x = v18;
            v34.origin.y = v19;
            v34.size.width = v20;
            v34.size.height = v21;
            if (CGRectContainsRect(*(CGRect *)(a1 + 56), v34)) {
              break;
            }
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v14) {
              goto LABEL_8;
            }
            goto LABEL_21;
          }
        }
        if ([v17 isHidden])
        {
          char v22 = 0;
        }
        else
        {
          if (([v17 isEnabled] & 1) == 0) {
            goto LABEL_21;
          }
          char v22 = 1;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v22;
      }
LABEL_21:

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        break;
      }
      if (++v8 == v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

@end