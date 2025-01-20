@interface VMUGroupType
- (void)enumerateGroups:(void *)a3 withBlock:(id)a4;
@end

@implementation VMUGroupType

- (void)enumerateGroups:(void *)a3 withBlock:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v6 = (void (**)(id, void *))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v29 = __42__VMUGroupType_enumerateGroups_withBlock___block_invoke;
  v30 = &unk_1E5D243E0;
  v31 = self;
  id v8 = v7;
  id v32 = v8;
  v9 = v28;
  unsigned int v10 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v11 = 0;
    do
    {
      v12 = (char *)a3 + (v11 >> 3);
      unsigned int v13 = v12[4];
      uint64_t v14 = v11;
      if (v12[4])
      {
        do
        {
          if (v13) {
            v29((uint64_t)v9, v14);
          }
          if (v13 < 2) {
            break;
          }
          uint64_t v14 = (v14 + 1);
          v13 >>= 1;
        }
        while (v14 < v10);
      }
      uint64_t v11 = (v11 + 8);
    }
    while (v11 < v10);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = [v8 allKeys];
  v16 = [v15 sortedArrayUsingSelector:sel_compare_];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * v20);
        v22 = (void *)MEMORY[0x1AD0D9F90]();
        v23 = [v8 objectForKeyedSubscript:v21];
        v6[2](v6, v23);

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v18);
  }
}

void __42__VMUGroupType_enumerateGroups_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x1AD0D9F90]();
  v5 = [*(id *)(a1 + 32) typeNameForNode:a2];
  v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v7 = [VMUNodeGroup alloc];
    id v8 = [*(id *)(a1 + 32) graph];
    v6 = [(VMUNodeGroup *)v7 initWithName:v5 graph:v8];

    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
  [(VMUNodeGroup *)v6 addNode:a2];
}

@end