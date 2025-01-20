@interface VMUDepthGraph
- (VMUDepthGraph)initWithGraph:(id)a3;
- (int64_t)markNodes:(void *)a3 atDepth:(unsigned int)a4;
- (unsigned)depthOfNode:(unsigned int)a3;
- (void)_buildDepthMap;
- (void)_buildNextDepth:(id)a3 into:(id)a4 depth:(unsigned int)a5;
- (void)_processNodes:(void *)a3 withDepth:(unsigned int)a4;
- (void)dealloc;
@end

@implementation VMUDepthGraph

- (VMUDepthGraph)initWithGraph:(id)a3
{
  return self;
}

- (void)dealloc
{
  free(self->_depthMap);
  v3.receiver = self;
  v3.super_class = (Class)VMUDepthGraph;
  [(VMUDepthGraph *)&v3 dealloc];
}

- (unsigned)depthOfNode:(unsigned int)a3
{
  return self->_depthMap[a3];
}

- (int64_t)markNodes:(void *)a3 atDepth:(unsigned int)a4
{
  int v7 = [(VMUDirectedGraph *)self->_graph nodeNamespaceSize];
  if (v7 < 1) {
    return 0;
  }
  int v8 = v7;
  unint64_t v9 = 0;
  int64_t result = 0;
  do
  {
    if (self->_depthMap[v9] == a4)
    {
      ++result;
      if (v9 < *(unsigned int *)a3) {
        *((unsigned char *)a3 + (v9 >> 3) + 4) |= 1 << (v9 & 7);
      }
    }
    ++v9;
  }
  while (v8 != v9);
  return result;
}

- (void)_processNodes:(void *)a3 withDepth:(unsigned int)a4
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v12 = __41__VMUDepthGraph__processNodes_withDepth___block_invoke;
  v13 = &unk_1E5D24390;
  v14 = self;
  unsigned int v15 = a4;
  v5 = v11;
  unsigned int v6 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v7 = 0;
    do
    {
      int v8 = (char *)a3 + (v7 >> 3);
      unsigned int v9 = v8[4];
      uint64_t v10 = v7;
      if (v8[4])
      {
        do
        {
          if (v9) {
            v12((uint64_t)v5, v10);
          }
          if (v9 < 2) {
            break;
          }
          uint64_t v10 = (v10 + 1);
          v9 >>= 1;
        }
        while (v10 < v6);
      }
      uint64_t v7 = (v7 + 8);
    }
    while (v7 < v6);
  }
}

uint64_t __41__VMUDepthGraph__processNodes_withDepth___block_invoke(uint64_t result, unsigned int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 16) + 4 * a2) = *(_DWORD *)(result + 40);
  return result;
}

- (void)_buildNextDepth:(id)a3 into:(id)a4 depth:(unsigned int)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self->_graph;
  [v9 removeAllObjects];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = [*(id *)(*((void *)&v20 + 1) + 8 * v14) intValue];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __44__VMUDepthGraph__buildNextDepth_into_depth___block_invoke;
        v17[3] = &unk_1E5D243B8;
        v17[4] = self;
        unsigned int v19 = a5;
        id v18 = v9;
        [(VMUDirectedGraph *)v10 enumerateEdgesOfNode:v15 withBlock:v17];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }
}

void __44__VMUDepthGraph__buildNextDepth_into_depth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  if (*(_DWORD *)(v4 + 4 * a4) == -1)
  {
    *(_DWORD *)(v4 + 4 * a4) = *(_DWORD *)(a1 + 48);
    v5 = *(void **)(a1 + 40);
    id v6 = [NSNumber numberWithUnsignedInt:a4];
    [v5 addObject:v6];
  }
}

- (void)_buildDepthMap
{
  objc_super v3 = self->_graph;
  size_t v4 = 4 * [(VMUDirectedGraph *)v3 nodeNamespaceSize];
  v5 = malloc_type_malloc(v4, 0x100004052888210uLL);
  int __pattern4 = -1;
  memset_pattern4(v5, &__pattern4, v4);
  self->_depthMap = (unsigned int *)v5;
  LODWORD(v4) = [(VMUDirectedGraph *)v3 nodeNamespaceSize];
  id v6 = (unsigned int *)malloc_type_calloc(1uLL, ((v4 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *id v6 = v4;
  unsigned int v19 = v3;
  [(VMUProcessObjectGraph *)v3 markRootNodes:v6];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  long long v21 = __31__VMUDepthGraph__buildDepthMap__block_invoke;
  long long v22 = &unk_1E5D243E0;
  id v9 = v7;
  id v23 = v9;
  v24 = self;
  uint64_t v10 = v20;
  unsigned int v11 = *v6;
  if (*v6)
  {
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = (char *)v6 + (v12 >> 3);
      unsigned int v14 = v13[4];
      uint64_t v15 = v12;
      if (v13[4])
      {
        do
        {
          if (v14) {
            v21((uint64_t)v10, v15);
          }
          if (v14 < 2) {
            break;
          }
          uint64_t v15 = (v15 + 1);
          v14 >>= 1;
        }
        while (v15 < v11);
      }
      uint64_t v12 = (v12 + 8);
    }
    while (v12 < v11);
  }

  free(v6);
  uint64_t v16 = 1;
  do
  {
    if (v16)
    {
      id v17 = v9;
      id v18 = v8;
    }
    else
    {
      id v17 = v8;
      id v18 = v9;
    }
    [(VMUDepthGraph *)self _buildNextDepth:v17 into:v18 depth:v16];
    uint64_t v16 = (v16 + 1);
  }
  while ([v9 count]);
}

void __31__VMUDepthGraph__buildDepthMap__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  size_t v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedInt:a2];
  [v4 addObject:v5];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 16) + 4 * v2) = 0;
}

- (void).cxx_destruct
{
}

@end