@interface VMUGraphEnumerator
- (VMUGraphEnumerator)initWithGraph:(id)a3;
- (VMUProcessObjectGraph)graph;
- (id)statusDisplayDescription;
- (unsigned)buildReversePostOrderWithRoots:(void *)a3;
- (void)destinationsOfGroup:(id)a3;
- (void)destinationsOfNodes:(void *)a3;
- (void)enumerateDestinationsOfGroup:(id)a3 groupedBy:(id)a4 withBlock:(id)a5;
- (void)enumerateDestinationsOfNode:(unsigned int)a3 groupedBy:(id)a4 withBlock:(id)a5;
- (void)enumerateDestinationsOfNodes:(void *)a3 groupedBy:(id)a4 withBlock:(id)a5;
- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation VMUGraphEnumerator

- (VMUGraphEnumerator)initWithGraph:(id)a3
{
  v4 = (VMUProcessObjectGraph *)a3;
  v5 = [(VMUGraphEnumerator *)self init];
  graph = v5->_graph;
  v5->_graph = v4;

  return v5;
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
}

- (void)enumerateDestinationsOfNode:(unsigned int)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  graph = self->_graph;
  id v9 = a5;
  id v10 = a4;
  LODWORD(graph) = [(VMUDirectedGraph *)graph nodeNamespaceSize];
  v11 = malloc_type_calloc(1uLL, ((graph + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v11 = graph;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__VMUGraphEnumerator_enumerateDestinationsOfNode_groupedBy_withBlock___block_invoke;
  v12[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v12[4] = v11;
  [(VMUGraphEnumerator *)self enumerateEdgesOfNode:v6 withBlock:v12];
  [v10 enumerateGroups:v11 withBlock:v9];

  free(v11);
}

uint64_t __70__VMUGraphEnumerator_enumerateDestinationsOfNode_groupedBy_withBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4) {
    *((unsigned char *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  }
  return result;
}

- (void)enumerateDestinationsOfNodes:(void *)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(VMUGraphEnumerator *)self destinationsOfNodes:a3];
  [v9 enumerateGroups:v10 withBlock:v8];

  free(v10);
}

- (void)enumerateDestinationsOfGroup:(id)a3 groupedBy:(id)a4 withBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(VMUGraphEnumerator *)self destinationsOfGroup:a3];
  [v9 enumerateGroups:v10 withBlock:v8];

  free(v10);
}

- (void)destinationsOfNodes:(void *)a3
{
  unsigned int v5 = [(VMUDirectedGraph *)self->_graph nodeNamespaceSize];
  uint64_t v6 = malloc_type_calloc(1uLL, ((v5 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *uint64_t v6 = v5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v15 = __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke;
  v16 = &unk_1E5D23C68;
  v17 = self;
  v18 = v6;
  v7 = v14;
  unsigned int v8 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    uint64_t v9 = 0;
    do
    {
      id v10 = (char *)a3 + (v9 >> 3);
      unsigned int v11 = v10[4];
      uint64_t v12 = v9;
      if (v10[4])
      {
        do
        {
          if (v11) {
            v15((uint64_t)v7, v12);
          }
          if (v11 < 2) {
            break;
          }
          uint64_t v12 = (v12 + 1);
          v11 >>= 1;
        }
        while (v12 < v8);
      }
      uint64_t v9 = (v9 + 8);
    }
    while (v9 < v8);
  }

  return v6;
}

uint64_t __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke_2;
  v4[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 enumerateEdgesOfNode:a2 withBlock:v4];
}

uint64_t __42__VMUGraphEnumerator_destinationsOfNodes___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4) {
    *((unsigned char *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  }
  return result;
}

- (void)destinationsOfGroup:(id)a3
{
  graph = self->_graph;
  id v5 = a3;
  LODWORD(graph) = [(VMUDirectedGraph *)graph nodeNamespaceSize];
  uint64_t v6 = malloc_type_calloc(1uLL, ((graph + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *uint64_t v6 = graph;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke;
  v8[3] = &unk_1E5D23C90;
  v8[4] = self;
  v8[5] = v6;
  [v5 enumerateNodesWithBlock:v8];

  return v6;
}

uint64_t __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke_2;
  v4[3] = &__block_descriptor_40_e18_v28__0I8I12I16_B20l;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [v2 enumerateEdgesOfNode:a2 withBlock:v4];
}

uint64_t __42__VMUGraphEnumerator_destinationsOfGroup___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  v4 = *(unsigned int **)(result + 32);
  if (*v4 > a4) {
    *((unsigned char *)v4 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  }
  return result;
}

- (id)statusDisplayDescription
{
  return @"forward";
}

- (unsigned)buildReversePostOrderWithRoots:(void *)a3
{
  id v5 = self->_graph;
  uint64_t v6 = self;
  unsigned int v7 = [(VMUDirectedGraph *)v5 nodeNamespaceSize];
  unsigned int v8 = malloc_type_calloc(1uLL, ((v7 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *unsigned int v8 = v7;
  size_t v9 = 4 * [(VMUDirectedGraph *)v5 nodeNamespaceSize];
  id v10 = malloc_type_malloc(v9, 0x100004052888210uLL);
  LODWORD(__pattern4[0]) = -1;
  memset_pattern4(v10, __pattern4, v9);
  v25 = v5;
  size_t v11 = 4 * [(VMUDirectedGraph *)v5 nodeNamespaceSize];
  uint64_t v12 = malloc_type_malloc(v11, 0x100004052888210uLL);
  LODWORD(__pattern4[0]) = -1;
  memset_pattern4(v12, __pattern4, v11);
  __pattern4[0] = 0;
  __pattern4[1] = __pattern4;
  __pattern4[2] = 0x2020000000;
  int v35 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v27 = __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke;
  v28 = &unk_1E5D23CE0;
  v23 = (unsigned int *)v12;
  v24 = v8;
  v32 = v8;
  v33 = v12;
  v30 = __pattern4;
  v31 = v10;
  v13 = v6;
  v29 = v13;
  v14 = v26;
  unsigned int v15 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    unsigned int v16 = 0;
    int v17 = 1;
    do
    {
      v18 = (char *)a3 + (v16 >> 3);
      unsigned int v19 = v18[4];
      unsigned int v20 = v17;
      if (v18[4])
      {
        do
        {
          if (v19) {
            v27((uint64_t)v14, v20 - 1);
          }
          if (v19 < 2) {
            break;
          }
          v19 >>= 1;
        }
        while (v20++ < v15);
      }
      v16 += 8;
      v17 += 8;
    }
    while (v16 < v15);
  }

  free(v10);
  free(v24);

  _Block_object_dispose(__pattern4, 8);
  return v23;
}

void __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke(uint64_t a1, int a2)
{
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v2 = *(_DWORD **)(a1 + 48);
  int v19 = 1;
  _DWORD *v2 = a2;
  v3 = v17;
  int v4 = *((_DWORD *)v17 + 6);
  if (v4)
  {
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 48);
      unsigned int v7 = v4 - 1;
      *((_DWORD *)v3 + 6) = v7;
      unint64_t v8 = *(unsigned int *)(v6 + 4 * v7);
      size_t v9 = *(_DWORD **)(a1 + 56);
      if (*v9 <= v8) {
        goto LABEL_5;
      }
      uint64_t v10 = (v8 >> 3) + 4;
      int v11 = *((unsigned __int8 *)v9 + v10);
      int v12 = 1 << (v8 & 7);
      if ((v12 & v11) == 0) {
        break;
      }
LABEL_6:
      int v4 = *((_DWORD *)v3 + 6);
      if (!v4) {
        goto LABEL_7;
      }
    }
    *((unsigned char *)v9 + v10) = v11 | v12;
    uint64_t v6 = *(void *)(a1 + 48);
LABEL_5:
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v15 = *(unsigned int *)(v14 + 24);
    *(_DWORD *)(v14 + 24) = v15 + 1;
    *(_DWORD *)(v13 + 4 * v15) = v8;
    [*(id *)(a1 + 32) enumerateEdgesOfNode:MEMORY[0x1E4F143A8] withBlock:^(id, unsigned long, void (^)(void *, void *), void *, void *, void *) {
    v3 = v17;
    goto LABEL_6;
  }
LABEL_7:
  _Block_object_dispose(&v16, 8);
}

uint64_t __53__VMUGraphEnumerator_buildReversePostOrderWithRoots___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = *(void *)(result + 40);
  uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v6 = *(unsigned int *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  *(_DWORD *)(v4 + 4 * v6) = a4;
  return result;
}

- (VMUProcessObjectGraph)graph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end