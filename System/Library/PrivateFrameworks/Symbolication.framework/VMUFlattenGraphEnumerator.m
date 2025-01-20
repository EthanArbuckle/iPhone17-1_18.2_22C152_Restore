@interface VMUFlattenGraphEnumerator
- (VMUFlattenGraphEnumerator)initWithGraph:(id)a3 graphEnumerator:(id)a4;
- (id)statusDisplayDescription;
- (void)dealloc;
- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation VMUFlattenGraphEnumerator

- (VMUFlattenGraphEnumerator)initWithGraph:(id)a3 graphEnumerator:(id)a4
{
  v6 = (VMUGraphEnumerator *)a4;
  v14.receiver = self;
  v14.super_class = (Class)VMUFlattenGraphEnumerator;
  v7 = [(VMUGraphEnumerator *)&v14 initWithGraph:a3];
  graphEnumerator = v7->_graphEnumerator;
  v7->_graphEnumerator = v6;

  v9 = [(VMUGraphEnumerator *)v7 graph];
  LODWORD(v6) = [v9 nodeNamespaceSize];
  v10 = malloc_type_calloc(1uLL, ((v6 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v10 = v6;
  v7->_deliveredReachable = v10;

  v11 = [(VMUGraphEnumerator *)v7 graph];
  LODWORD(v6) = [v11 nodeNamespaceSize];
  v12 = malloc_type_calloc(1uLL, ((v6 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v12 = v6;
  v7->_topLevel = v12;

  return v7;
}

- (void)dealloc
{
  free(self->_deliveredReachable);
  free(self->_topLevel);
  v3.receiver = self;
  v3.super_class = (Class)VMUFlattenGraphEnumerator;
  [(VMUFlattenGraphEnumerator *)&v3 dealloc];
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (!self->_iteratingTopLevel)
  {
    deliveredReachable = (unsigned int *)self->_deliveredReachable;
    if (*deliveredReachable <= a3
      || (uint64_t v9 = (a3 >> 3) + 4,
          int v10 = *((unsigned __int8 *)deliveredReachable + v9),
          int v11 = 1 << (a3 & 7),
          (v11 & v10) == 0)
      || (v12 = (unsigned int *)self->_topLevel, *v12 > a3) && (v11 & *((unsigned char *)v12 + v9)) != 0)
    {
      v44 = v6;
      self->_iteratingTopLevel = 1;
      v13 = [(VMUGraphEnumerator *)self graph];
      int v14 = [v13 nodeNamespaceSize];
      v15 = malloc_type_calloc(1uLL, ((v14 + 7) >> 3) + 4, 0xFF42C4F3uLL);
      _DWORD *v15 = v14;

      uint64_t v56 = 0;
      v57 = &v56;
      uint64_t v58 = 0x2020000000;
      uint64_t v59 = 0;
      v16 = [(VMUGraphEnumerator *)self graph];
      size_t v17 = 4 * [v16 nodeNamespaceSize];
      v18 = (unsigned int *)malloc_type_malloc(v17, 0x100004052888210uLL);
      __pattern4[0] = -1;
      memset_pattern4(v18, __pattern4, v17);

      uint64_t v19 = v57[3];
      v57[3] = v19 + 1;
      v18[v19] = a3;
      v20 = v57;
      uint64_t v21 = v57[3];
      if (v21 >= 1)
      {
        while (1)
        {
          uint64_t v22 = v21 - 1;
          v20[3] = v22;
          unint64_t v23 = v18[v22];
          if (*v15 <= v23) {
            goto LABEL_10;
          }
          uint64_t v24 = (v23 >> 3) + 4;
          int v25 = *((unsigned __int8 *)v15 + v24);
          int v26 = 1 << (v23 & 7);
          if ((v26 & v25) == 0) {
            break;
          }
LABEL_11:
          uint64_t v21 = v20[3];
          if (v21 <= 0) {
            goto LABEL_12;
          }
        }
        *((unsigned char *)v15 + v24) = v25 | v26;
LABEL_10:
        graphEnumerator = self->_graphEnumerator;
        uint64_t v50 = MEMORY[0x1E4F143A8];
        uint64_t v51 = 3221225472;
        v52 = __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke;
        v53 = &unk_1E5D23CB8;
        v54 = &v56;
        v55 = v18;
        -[VMUGraphEnumerator enumerateEdgesOfNode:withBlock:](graphEnumerator, "enumerateEdgesOfNode:withBlock:");
        v20 = v57;
        goto LABEL_11;
      }
LABEL_12:
      free(v18);
      topLevel = (unsigned int *)self->_topLevel;
      if (*topLevel > a3) {
        *((unsigned char *)topLevel + (a3 >> 3) + 4) |= 1 << (a3 & 7);
      }
      v7 = v44;
      v29 = self->_deliveredReachable;
      int v30 = *v29;
      if (*v29 >= *v15) {
        int v30 = *v15;
      }
      unint64_t v31 = (v30 + 7);
      if (v31 >= 8)
      {
        v32 = (char *)(v15 + 1);
        v33 = v29 + 1;
        unint64_t v34 = v31 >> 3;
        do
        {
          char v35 = *v32++;
          *v33++ |= v35;
          --v34;
        }
        while (v34);
      }
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v46 = __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke_2;
      v47 = &unk_1E5D23D08;
      unsigned int v49 = a3;
      id v48 = v44;
      v36 = v45;
      unsigned int v37 = *v15;
      if (*v15)
      {
        unsigned int v38 = 0;
        int v39 = 1;
        do
        {
          v40 = (char *)v15 + (v38 >> 3);
          unsigned int v41 = v40[4];
          unsigned int v42 = v39;
          if (v40[4])
          {
            do
            {
              if (v41) {
                v46((uint64_t)v36, v42 - 1);
              }
              if (v41 < 2) {
                break;
              }
              v41 >>= 1;
            }
            while (v42++ < v37);
          }
          v38 += 8;
          v39 += 8;
        }
        while (v38 < v37);
      }

      free(v15);
      self->_iteratingTopLevel = 0;

      _Block_object_dispose(&v56, 8);
    }
  }
}

uint64_t __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = *(void *)(result + 40);
  uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  *(_DWORD *)(v4 + 4 * v6) = a4;
  return result;
}

uint64_t __60__VMUFlattenGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke_2(uint64_t result, int a2)
{
  char v2 = 0;
  if (*(_DWORD *)(result + 40) != a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (id)statusDisplayDescription
{
  return @"flatten";
}

- (void).cxx_destruct
{
}

@end