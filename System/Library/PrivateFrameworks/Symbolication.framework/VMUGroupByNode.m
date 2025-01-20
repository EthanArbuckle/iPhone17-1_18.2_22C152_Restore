@interface VMUGroupByNode
- (void)enumerateGroups:(void *)a3 withBlock:(id)a4;
@end

@implementation VMUGroupByNode

- (void)enumerateGroups:(void *)a3 withBlock:(id)a4
{
  id v6 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v15 = __44__VMUGroupByNode_enumerateGroups_withBlock___block_invoke;
  v16 = &unk_1E5D25538;
  v17 = self;
  id v7 = v6;
  id v18 = v7;
  v8 = v14;
  unsigned int v9 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v10 = 0;
    do
    {
      v11 = (char *)a3 + (v10 >> 3);
      unsigned int v12 = v11[4];
      uint64_t v13 = v10;
      if (v11[4])
      {
        do
        {
          if (v12) {
            v15((uint64_t)v8, v13);
          }
          if (v12 < 2) {
            break;
          }
          uint64_t v13 = (v13 + 1);
          v12 >>= 1;
        }
        while (v13 < v9);
      }
      uint64_t v10 = (v10 + 8);
    }
    while (v10 < v9);
  }
}

void __44__VMUGroupByNode_enumerateGroups_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)MEMORY[0x1AD0D9F90]();
  v5 = [*(id *)(a1 + 32) typeNameForNode:a2];
  id v6 = [VMUNodeGroup alloc];
  id v7 = [*(id *)(a1 + 32) graph];
  v8 = [(VMUNodeGroup *)v6 initWithName:v5 graph:v7];

  [(VMUNodeGroup *)v8 addNode:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end