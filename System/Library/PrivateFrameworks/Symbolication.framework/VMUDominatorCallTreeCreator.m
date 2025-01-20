@interface VMUDominatorCallTreeCreator
- (NSNumber)desiredAddress;
- (VMUCallTreeRoot)callTreeRoot;
- (VMUClassPatternMatcher)desiredClassesPattern;
- (VMUDominatorGraph)dominatorGraph;
- (VMUProcessObjectGraph)processObjectGraph;
- (id)_addNodeWithNodeName:(unsigned int)a3 nodeInfo:(id)a4 callTreeParentNode:(id)a5 parentNodeName:parentNodeType:reference:;
- (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 debugTimer:(id)a6;
- (id)groupByNodeNameForNode:(unsigned int)a3 parentNodeName:(unsigned int)a4 parentNodeType:(unsigned int)a5 reference:(id *)a6;
- (id)groupByTypeNameForNode:(unsigned int)a3;
- (id)referenceDecriptionForSourceNodeAddress:(unint64_t)a3 referenceInfo:(id *)a4;
- (id)remainingNodeNames;
- (unint64_t)sizeForNodeName:(unsigned int)a3 nodeInfo:(id)a4;
- (void)buildCallTreeWithNodeName:(unsigned int)a3 callTreeParentNode:(id)a4 parentNodeName:(unsigned int)a5 parentNodeType:(unsigned int)a6 reference:(id *)a7 rootNodeFilter:(id)a8;
- (void)buildCallTreeWithRootNodeNames:(id)a3;
- (void)removeJunkEdges;
- (void)removeJunkNodes;
- (void)setCallTreeRoot:(id)a3;
- (void)setDesiredAddress:(id)a3;
- (void)setDesiredClassesPattern:(id)a3;
- (void)setDominatorGraph:(id)a3;
- (void)setProcessObjectGraph:(id)a3;
@end

@implementation VMUDominatorCallTreeCreator

- (void)removeJunkEdges
{
  unsigned int v3 = [(VMUDirectedGraph *)self->_processObjectGraph edgeNamespaceSize];
  v4 = malloc_type_calloc(1uLL, ((v3 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v4 = v3;
  v5 = [(VMUDirectedGraph *)self->_processObjectGraph invertedGraph];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  int v25 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke;
  v23[3] = &unk_1E5D25970;
  v23[4] = v26;
  v23[5] = v24;
  v23[6] = v4;
  v6 = (void *)MEMORY[0x1AD0DA230](v23);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_2;
  v20[3] = &unk_1E5D25998;
  v22 = v4;
  v20[4] = self;
  id v7 = v6;
  id v21 = v7;
  v8 = (void *)MEMORY[0x1AD0DA230](v20);
  processObjectGraph = self->_processObjectGraph;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_3;
  v15 = &unk_1E5D259C0;
  v18 = v24;
  v19 = v26;
  id v10 = v5;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  [(VMUDirectedGraph *)processObjectGraph enumerateNodesWithBlock:&v12];
  -[VMUDirectedGraph removeMarkedEdges:](self->_processObjectGraph, "removeMarkedEdges:", v4, v12, v13, v14, v15);
  free(v4);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

uint64_t __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke(void *a1, int a2, unsigned int a3)
{
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    if ((a2 - 1) > 3) {
      int v4 = 0;
    }
    else {
      int v4 = dword_1A7D79C40[a2 - 1];
    }
    if ((*(_DWORD *)(*(void *)(a1[5] + 8) + 24) & v4) != 0)
    {
      v6 = (unsigned int *)a1[6];
      uint64_t result = 1;
      if (*v6 > a3) {
        *((unsigned char *)v6 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) |= a2;
  }
  return result;
}

void __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_2(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 != a3)
  {
    id v7 = *(void **)(a1[4] + 32);
    if (v7) {
      [v7 nodeDetails:a4];
    }
    id v9 = 0;
    id v10 = *(void **)(a1[4] + 32);
    if (v10) {
      [v10 nodeDetails:a3];
    }
    id v11 = 0;
    if (v9)
    {
      uint64_t v12 = [v9 className];
      int v13 = [v12 isEqualToString:@"NSConcreteMutableData (Bytes Storage)"];

      if (v13) {
        goto LABEL_24;
      }
      v14 = [v9 className];
      if ([v14 isEqualToString:@"@autoreleasepool content"])
      {
        v15 = [v11 className];
        char v16 = [v15 isEqualToString:@"@autoreleasepool content"];

        if ((v16 & 1) == 0)
        {
          id v17 = *(void (**)(void))(a1[5] + 16);
          goto LABEL_20;
        }
      }
      else
      {
      }
    }
    v18 = [v11 className];
    int v19 = [v18 isEqualToString:@"@autoreleasepool content"];

    if (!v19)
    {
LABEL_18:
      if (!VMUGraphNodeType_IsVMRegion(0))
      {
        v22 = *(void **)(a1[4] + 32);
        if (v22)
        {
          [v22 referenceInfoWithName:a2];
          LOBYTE(v22) = 0;
        }
        VMUIsOwningReference((char)v22);
        (*(void (**)(void))(a1[5] + 16))();
        goto LABEL_26;
      }
      id v17 = *(void (**)(void))(a1[5] + 16);
LABEL_20:
      v17();
LABEL_26:

      return;
    }
    v20 = [v9 className];
    if ([v20 isEqualToString:@"@autoreleasepool content"])
    {

      goto LABEL_18;
    }
    BOOL IsRoot = VMUGraphNodeType_IsRoot(0);

    if (IsRoot) {
      goto LABEL_18;
    }
LABEL_24:
    v23 = (_DWORD *)a1[6];
    if (*v23 > a2) {
      *((unsigned char *)v23 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
    }
    goto LABEL_26;
  }
  v8 = (_DWORD *)a1[6];
  if (*v8 > a2) {
    *((unsigned char *)v8 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  }
}

uint64_t __46__VMUDominatorCallTreeCreator_removeJunkEdges__block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  [*(id *)(a1 + 32) enumerateEdgesOfNode:a2 withBlock:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  int v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 enumerateEdgesOfNode:a2 withBlock:v5];
}

- (void)removeJunkNodes
{
  unsigned int v3 = [(VMUDirectedGraph *)self->_processObjectGraph nodeNamespaceSize];
  int v4 = malloc_type_calloc(1uLL, ((v3 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v4 = v3;
  processObjectGraph = self->_processObjectGraph;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke_2;
  v7[3] = &unk_1E5D25A08;
  v7[4] = self;
  id v8 = &__block_literal_global_20;
  id v9 = v4;
  [(VMUDirectedGraph *)processObjectGraph enumerateNodesWithBlock:v7];
  [(VMUDirectedGraph *)self->_processObjectGraph removeMarkedNodes:v4];

  return v4;
}

BOOL __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  if ([v2 isSubmap]) {
    goto LABEL_17;
  }
  unsigned int v3 = [v2 type];
  if ([v3 hasSuffix:@"Foundation"]) {
    goto LABEL_16;
  }
  int v4 = [v2 type];
  if ([v4 hasSuffix:@"Kernel Alloc Once"])
  {
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  uint64_t v5 = [v2 type];
  if (([v5 hasSuffix:@"MALLOC metadata"] & 1) != 0
    || ([v2 isOwnedUnmappedMemory] & 1) != 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  v6 = [v2 type];
  if ([v6 hasSuffix:@"SQLite page cache"])
  {
LABEL_13:

    goto LABEL_14;
  }
  id v7 = [v2 type];
  if ([v7 hasSuffix:@"__AUTH"])
  {
LABEL_12:

    goto LABEL_13;
  }
  id v8 = [v2 type];
  if ([v8 hasSuffix:@"__AUTH_CONST"])
  {
LABEL_11:

    goto LABEL_12;
  }
  id v9 = [v2 type];
  if ([v9 hasSuffix:@"mapped file"])
  {

    goto LABEL_11;
  }
  uint64_t v12 = [v2 type];
  char v13 = [v12 hasSuffix:@"shared memory"];

  if ((v13 & 1) == 0 && ([v2 protection] & 2) != 0)
  {
    BOOL v10 = (v2[13] - 1) < 2;
    goto LABEL_18;
  }
LABEL_17:
  BOOL v10 = 1;
LABEL_18:

  return v10;
}

void __46__VMUDominatorCallTreeCreator_removeJunkNodes__block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  int v4 = *(void **)(a1[4] + 32);
  if (v4)
  {
    [v4 nodeDetails:a2];
    int v4 = (void *)(v9 >> 60);
  }
  if (VMUGraphNodeType_IsVMRegion((int)v4))
  {
    uint64_t v5 = [*(id *)(a1[4] + 32) vmuVMRegionForNode:a2];
    if (v5 && (*(unsigned int (**)(void))(a1[5] + 16))())
    {
      v6 = (_DWORD *)a1[6];
      if (*v6 > a2) {
        *((unsigned char *)v6 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
      }
    }
  }
  else if (v9 == 0x1000000000000000)
  {
    id v7 = (_DWORD *)a1[6];
    if (*v7 > a2) {
      *((unsigned char *)v7 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
    }
  }
}

- (unint64_t)sizeForNodeName:(unsigned int)a3 nodeInfo:(id)a4
{
  unint64_t v5 = *(void *)(a4.var0 + 8);
  if (self->_showRegionVirtualSize) {
    return v5 & 0xFFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = *(void *)&a3;
  if (!VMUGraphNodeType_IsVMRegion(v5 >> 60)) {
    return v5 & 0xFFFFFFFFFFFFFFFLL;
  }
  uint64_t v8 = [(VMUProcessObjectGraph *)self->_processObjectGraph vmuVMRegionForNode:v6];
  unint64_t v9 = v8[22] + v8[23];
  unint64_t v10 = v8[24];
  BOOL v11 = v9 >= v10;
  unint64_t v12 = v9 - v10;
  if (v11) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = 0;
  }

  return v13;
}

- (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 debugTimer:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  unint64_t v12 = (void *)MEMORY[0x1AD0D9F90]();
  [(VMUDominatorCallTreeCreator *)self setProcessObjectGraph:v10];
  self->_showRegionVirtualSize = a5;
  self->_groupByType = a4;
  objc_storeStrong((id *)&self->_debugTimer, a6);
  [v11 startWithMessage:"remove junk nodes from object graph"];
  self->_visitedNodes = [(VMUDominatorCallTreeCreator *)self removeJunkNodes];
  [v11 startWithMessage:"remove junk edges from object graph"];
  [(VMUDominatorCallTreeCreator *)self removeJunkEdges];
  [v11 startWithMessage:"create dominator graph"];
  unint64_t v13 = [[VMUDominatorGraph alloc] initWithGraph:v10 debugTimer:v11];
  [(VMUDominatorCallTreeCreator *)self setDominatorGraph:v13];

  [(VMUDebugTimer *)self->_debugTimer startWithMessage:"select all dominator roots as roots of the tree"];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dominatorGraph = self->_dominatorGraph;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __94__VMUDominatorCallTreeCreator_callTreeWithGraph_groupByType_showRegionVirtualSize_debugTimer___block_invoke;
  v22[3] = &unk_1E5D25A30;
  id v16 = v14;
  id v23 = v16;
  [(VMUDominatorGraph *)dominatorGraph enumerateDominatorRootsWithBlock:v22];
  id v17 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRoot alloc], "initWithSymbolicator:sampler:options:", 0, 0, 0, 0);
  [(VMUDominatorCallTreeCreator *)self setCallTreeRoot:v17];

  [(VMUDebugTimer *)self->_debugTimer startWithMessage:"build tree from selected nodes"];
  [(VMUDominatorCallTreeCreator *)self buildCallTreeWithRootNodeNames:v16];
  v18 = [(VMUDominatorCallTreeCreator *)self desiredAddress];
  if (v18) {
    goto LABEL_2;
  }
  int v19 = [(VMUDominatorCallTreeCreator *)self desiredClassesPattern];

  if (!v19)
  {
    [(VMUDebugTimer *)self->_debugTimer startWithMessage:"add remaining nodes to tree"];
    v18 = [(VMUDominatorCallTreeCreator *)self remainingNodeNames];
    [(VMUDominatorCallTreeCreator *)self buildCallTreeWithRootNodeNames:v18];
LABEL_2:
  }
  free(self->_visitedNodes);
  [v11 startWithMessage:"add child counts"];
  [(VMUCallTreeRoot *)self->_callTreeRoot addChildCountsIntoNode];
  v20 = self->_callTreeRoot;

  return v20;
}

void __94__VMUDominatorCallTreeCreator_callTreeWithGraph_groupByType_showRegionVirtualSize_debugTimer___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

- (void)buildCallTreeWithRootNodeNames:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(VMUDominatorCallTreeCreator *)self desiredAddress];

  if (v5)
  {
    uint64_t v6 = [(VMUDominatorCallTreeCreator *)self desiredAddress];
    uint64_t v7 = [v6 unsignedIntegerValue];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke;
    v22[3] = &__block_descriptor_40_e21_B36__0I8___Qb60b4__12l;
    void v22[4] = v7;
    uint64_t v8 = v22;
  }
  else
  {
    unint64_t v9 = [(VMUDominatorCallTreeCreator *)self desiredClassesPattern];

    if (!v9) {
      goto LABEL_6;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke_2;
    v21[3] = &unk_1E5D25A78;
    v21[4] = self;
    uint64_t v8 = v21;
  }
  unint64_t v9 = (void *)MEMORY[0x1AD0DA230](v8);
LABEL_6:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) unsignedIntValue];
        processObjectGraph = self->_processObjectGraph;
        if (processObjectGraph) {
          [(VMUObjectGraph *)processObjectGraph nodeDetails:v15];
        }
        if ([(VMUDominatorGraph *)self->_dominatorGraph hasAnyDirectDomineesForNodeName:v15])
        {
          [(VMUDominatorCallTreeCreator *)self buildCallTreeWithNodeName:v15 callTreeParentNode:self->_callTreeRoot parentNodeName:0xFFFFFFFFLL parentNodeType:0 reference:0 rootNodeFilter:v9];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v12);
  }
}

BOOL __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return *a3 == *(void *)(a1 + 32);
}

uint64_t __62__VMUDominatorCallTreeCreator_buildCallTreeWithRootNodeNames___block_invoke_2(uint64_t a1, uint64_t a2, long long *a3)
{
  if (*((void *)a3 + 1) >> 60 == 1)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 32) nodeDescription:a2];
  }
  uint64_t v6 = [*(id *)(a1 + 32) desiredClassesPattern];
  long long v9 = *a3;
  uint64_t v10 = *((void *)a3 + 2);
  uint64_t v7 = [v6 matchesNodeDetails:&v9 orNodeDescription:v5];

  return v7;
}

- (id)remainingNodeNames
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  visitedNodes = (unsigned int *)self->_visitedNodes;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  long long v19 = __49__VMUDominatorCallTreeCreator_remainingNodeNames__block_invoke;
  long long v20 = &unk_1E5D243E0;
  id v21 = self;
  id v5 = v3;
  id v22 = v5;
  uint64_t v6 = v18;
  unsigned int v7 = *visitedNodes;
  if (*visitedNodes)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 8;
    do
    {
      if (v7 >= v9) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v7;
      }
      unsigned int v11 = *((unsigned __int8 *)visitedNodes + (v8 >> 3) + 4);
      uint64_t v12 = (v8 + 8);
      if (v12 >= v7) {
        unsigned int v13 = v7;
      }
      else {
        unsigned int v13 = v8 + 8;
      }
      if (v11 != 255 && v8 < v13)
      {
        do
        {
          if ((v11 & 1) == 0) {
            v19((uint64_t)v6, v8);
          }
          uint64_t v8 = (v8 + 1);
          v11 >>= 1;
        }
        while (v10 != v8);
      }
      v9 += 8;
      uint64_t v8 = v12;
    }
    while (v12 < v7);
  }

  uint64_t v15 = v22;
  id v16 = v5;

  return v16;
}

void __49__VMUDominatorCallTreeCreator_remainingNodeNames__block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) isNodePresent:a2])
  {
    if ((uint64_t v7 = 0, v8 = 0, v9 = 0, (v4 = *(void **)(*(void *)(a1 + 32) + 32)) != 0)
      && ([v4 nodeDetails:a2], id v4 = (void *)(v8 >> 60), v8 >> 60 == 1)
      || VMUGraphNodeType_IsVMRegion((int)v4))
    {
      id v5 = *(void **)(a1 + 40);
      uint64_t v6 = [NSNumber numberWithUnsignedInt:a2];
      [v5 addObject:v6];
    }
  }
}

- (id)_addNodeWithNodeName:(unsigned int)a3 nodeInfo:(id)a4 callTreeParentNode:(id)a5 parentNodeName:parentNodeType:reference:
{
  uint64_t v8 = v7;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  uint64_t v11 = *(void *)&a3;
  long long v18 = *(_OWORD *)a4.var0;
  uint64_t v19 = *(void *)(a4.var0 + 16);
  id v13 = a5;
  unint64_t v14 = [(VMUDominatorCallTreeCreator *)self sizeForNodeName:v11 nodeInfo:&v18];
  if (self->_groupByType)
  {
    uint64_t v15 = -[VMUDominatorCallTreeCreator groupByTypeNameForNode:](self, "groupByTypeNameForNode:", v11, v18, v19);
    [(VMUCallTreeRoot *)self->_callTreeRoot addChildWithName:v15 address:0 count:1 numBytes:v14 toNode:v13];
  }
  else
  {
    uint64_t v15 = -[VMUDominatorCallTreeCreator groupByNodeNameForNode:parentNodeName:parentNodeType:reference:](self, "groupByNodeNameForNode:parentNodeName:parentNodeType:reference:", v11, v10, v9, v8, v18, v19);
    [(VMUCallTreeRoot *)self->_callTreeRoot addUniqueChildWithName:v15 address:0 count:1 numBytes:v14 toNode:v13];
  id v16 = };

  return v16;
}

- (void)buildCallTreeWithNodeName:(unsigned int)a3 callTreeParentNode:(id)a4 parentNodeName:(unsigned int)a5 parentNodeType:(unsigned int)a6 reference:(id *)a7 rootNodeFilter:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  uint64_t v15 = a8;
  id v16 = (void *)MEMORY[0x1AD0D9F90]();
  if (v12 == v11)
  {
    long long v53 = 0uLL;
    uint64_t v54 = 0;
    processObjectGraph = self->_processObjectGraph;
    if (processObjectGraph) {
      [(VMUObjectGraph *)processObjectGraph nodeDetails:v12];
    }
    long long v51 = v53;
    uint64_t v52 = v54;
    id v18 = [(VMUDominatorCallTreeCreator *)self _addNodeWithNodeName:v12 nodeInfo:&v51 callTreeParentNode:v14 parentNodeName:v12 parentNodeType:v10 reference:a7];
    goto LABEL_25;
  }
  visitedNodes = self->_visitedNodes;
  if (*visitedNodes > v12
    && ((*((unsigned __int8 *)visitedNodes + (v12 >> 3) + 4) >> (v12 & 7)) & 1) != 0)
  {
    goto LABEL_25;
  }
  long long v53 = 0uLL;
  uint64_t v54 = 0;
  long long v20 = self->_processObjectGraph;
  if (v20) {
    [(VMUObjectGraph *)v20 nodeDetails:v12];
  }
  if (!v15)
  {
    long long v51 = v53;
    uint64_t v52 = v54;
    id v23 = [(VMUDominatorCallTreeCreator *)self _addNodeWithNodeName:v12 nodeInfo:&v51 callTreeParentNode:v14 parentNodeName:v11 parentNodeType:v10 reference:a7];
LABEL_14:
    id v22 = v23;
    goto LABEL_15;
  }
  id v21 = (unsigned int (*)(void *, uint64_t, long long *))v15[2];
  long long v51 = v53;
  uint64_t v52 = v54;
  if (!v21(v15, v12, &v51))
  {
    id v23 = v14;
    goto LABEL_14;
  }

  long long v51 = v53;
  uint64_t v52 = v54;
  id v22 = [(VMUDominatorCallTreeCreator *)self _addNodeWithNodeName:v12 nodeInfo:&v51 callTreeParentNode:v14 parentNodeName:v11 parentNodeType:v10 reference:a7];
  uint64_t v15 = 0;
LABEL_15:
  uint64_t v24 = self->_visitedNodes;
  if (*v24 > v12) {
    *((unsigned char *)v24 + (v12 >> 3) + 4) |= 1 << (v12 & 7);
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  dominatorGraph = self->_dominatorGraph;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke;
  v49[3] = &unk_1E5D25A30;
  id v27 = v25;
  id v50 = v27;
  [(VMUDominatorGraph *)dominatorGraph enumerateDirectDomineesForNodeName:v12 withBlock:v49];
  v28 = self->_processObjectGraph;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke_2;
  v41[3] = &unk_1E5D25AA0;
  id v29 = v27;
  id v42 = v29;
  v43 = self;
  id v30 = v22;
  id v44 = v30;
  int v48 = v12;
  long long v46 = v53;
  uint64_t v47 = v54;
  uint64_t v15 = v15;
  id v45 = v15;
  [(VMUObjectGraph *)v28 enumerateReferencesOfNode:v12 withBlock:v41];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v31 = v29;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v55 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = [*(id *)(*((void *)&v37 + 1) + 8 * v35) unsignedIntValue:v37];
        [(VMUDominatorCallTreeCreator *)self buildCallTreeWithNodeName:v36 callTreeParentNode:v30 parentNodeName:v12 parentNodeType:*((void *)&v53 + 1) >> 60 reference:0 rootNodeFilter:v15];
        ++v35;
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v55 count:16];
    }
    while (v33);
  }

LABEL_25:
}

void __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

uint64_t __131__VMUDominatorCallTreeCreator_buildCallTreeWithNodeName_callTreeParentNode_parentNodeName_parentNodeType_reference_rootNodeFilter___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = [NSNumber numberWithUnsignedInt:a4];
  LODWORD(v10) = [v10 containsObject:v11];

  if (v10)
  {
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = [NSNumber numberWithUnsignedInt:a4];
    [v12 removeObject:v13];

    [*(id *)(a1 + 40) buildCallTreeWithNodeName:a4 callTreeParentNode:*(void *)(a1 + 48) parentNodeName:*(unsigned int *)(a1 + 88) parentNodeType:*(void *)(a1 + 72) >> 60 reference:a5 rootNodeFilter:*(void *)(a1 + 56)];
  }
  uint64_t result = [*(id *)(a1 + 32) count];
  if (!result) {
    *a6 = 1;
  }
  return result;
}

- (id)referenceDecriptionForSourceNodeAddress:(unint64_t)a3 referenceInfo:(id *)a4
{
  uint64_t v5 = [(VMUProcessObjectGraph *)self->_processObjectGraph regionSymbolNameForAddress:a4->var0 + a3];
  if (v5)
  {
    uint64_t v6 = VMUScanTypeKeywordDescription(a4->var1);
    if (v6 && *v6) {
      uint64_t v7 = (__CFString *)[[NSString alloc] initWithFormat:@"%s ", v6];
    }
    else {
      uint64_t v7 = &stru_1EFE27F38;
    }
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"%@%@", v7, v5];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)groupByTypeNameForNode:(unsigned int)a3
{
  processObjectGraph = self->_processObjectGraph;
  if (processObjectGraph) {
    -[VMUObjectGraph nodeDetails:](processObjectGraph, "nodeDetails:");
  }

  return @"(unknown)";
}

- (id)groupByNodeNameForNode:(unsigned int)a3 parentNodeName:(unsigned int)a4 parentNodeType:(unsigned int)a5 reference:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v10 = [(VMUProcessObjectGraph *)self->_processObjectGraph nodeDescription:*(void *)&a3];
  if (a6)
  {
    long long v11 = *(_OWORD *)&a6->var1.var1;
    *(_OWORD *)v26 = *(_OWORD *)&a6->var0;
    *(_OWORD *)&v26[16] = v11;
    var2 = a6->var2;
    if (VMUGraphNodeType_IsVMRegion(a5))
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      processObjectGraph = self->_processObjectGraph;
      if (processObjectGraph)
      {
        [(VMUObjectGraph *)processObjectGraph nodeDetails:v8];
        uint64_t v13 = v23;
      }
      else
      {
        uint64_t v13 = 0;
      }
      long long v20 = *(_OWORD *)&v26[8];
      *(void *)&long long v21 = *(void *)&v26[24];
      id v16 = [(VMUDominatorCallTreeCreator *)self referenceDecriptionForSourceNodeAddress:v13 referenceInfo:&v20];
      long long v17 = v16;
      if (v16)
      {
        [v16 stringByAppendingFormat:@" --> %@", v10];
      }
      else
      {
        BOOL v18 = [(VMUProcessObjectGraph *)self->_processObjectGraph is64bit];
        long long v20 = *(_OWORD *)v26;
        long long v21 = *(_OWORD *)&v26[16];
        id v22 = var2;
        +[VMULeakDetector referenceDescription:&v20 dstDescription:v10 is64bit:v18];
      uint64_t v15 = };
    }
    else
    {
      BOOL v14 = [(VMUProcessObjectGraph *)self->_processObjectGraph is64bit];
      long long v20 = *(_OWORD *)v26;
      long long v21 = *(_OWORD *)&v26[16];
      id v22 = var2;
      uint64_t v15 = +[VMULeakDetector referenceDescription:&v20 dstDescription:v10 is64bit:v14];
    }
    uint64_t v10 = (void *)v15;
  }

  return v10;
}

- (VMUProcessObjectGraph)processObjectGraph
{
  return (VMUProcessObjectGraph *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProcessObjectGraph:(id)a3
{
}

- (VMUDominatorGraph)dominatorGraph
{
  return (VMUDominatorGraph *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDominatorGraph:(id)a3
{
}

- (VMUCallTreeRoot)callTreeRoot
{
  return (VMUCallTreeRoot *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCallTreeRoot:(id)a3
{
}

- (NSNumber)desiredAddress
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDesiredAddress:(id)a3
{
}

- (VMUClassPatternMatcher)desiredClassesPattern
{
  return (VMUClassPatternMatcher *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDesiredClassesPattern:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredClassesPattern, 0);
  objc_storeStrong((id *)&self->_desiredAddress, 0);
  objc_storeStrong((id *)&self->_callTreeRoot, 0);
  objc_storeStrong((id *)&self->_dominatorGraph, 0);
  objc_storeStrong((id *)&self->_processObjectGraph, 0);

  objc_storeStrong((id *)&self->_debugTimer, 0);
}

@end