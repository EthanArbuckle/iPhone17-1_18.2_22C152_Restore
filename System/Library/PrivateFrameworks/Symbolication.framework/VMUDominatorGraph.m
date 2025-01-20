@interface VMUDominatorGraph
+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredAddress:(id)a6 debugTimer:(id)a7;
+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredClassesPattern:(id)a6 debugTimer:(id)a7;
+ (id)consolidate:(id)a3;
- (BOOL)hasAnyDirectDomineesForNodeName:(unsigned int)a3;
- (NSData)dominators_data;
- (NSData)firstDominates_data;
- (NSData)nextDominates_data;
- (VMUDominatorGraph)initWithDict:(id)a3;
- (VMUDominatorGraph)initWithGraph:(id)a3;
- (VMUDominatorGraph)initWithGraph:(id)a3 debugTimer:(id)a4;
- (id)_computeDominators:(id)a3 roots:(void *)a4 reversePostOrder:(unsigned int *)a5 debugTimer:(id)a6;
- (id)copyDict;
- (id)export:(id)a3;
- (id)fastDFS:(id)a3 graph:(id)a4;
- (id)iterDirectDomineesForNodeName:(unsigned int)a3;
- (id)iterDominatorRoots;
- (unsigned)dominator:(unsigned int)a3;
- (unsigned)dominators;
- (unsigned)firstDominates;
- (unsigned)nextDominates;
- (unsigned)nodeNamespaceSize;
- (void)_computeDominees:(id)a3;
- (void)enumerateDirectDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateDominatorRootsWithBlock:(id)a3;
- (void)enumerateDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4;
- (void)setDominators:(unsigned int *)a3;
- (void)setDominators_data:(id)a3;
- (void)setFirstDominates:(unsigned int *)a3;
- (void)setFirstDominates_data:(id)a3;
- (void)setNextDominates:(unsigned int *)a3;
- (void)setNextDominates_data:(id)a3;
- (void)setNodeNamespaceSize:(unsigned int)a3;
@end

@implementation VMUDominatorGraph

- (VMUDominatorGraph)initWithDict:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"dominators"];
  dominators_data = self->_dominators_data;
  self->_dominators_data = v5;

  v7 = [v4 objectForKeyedSubscript:@"firstDominates"];
  firstDominates_data = self->_firstDominates_data;
  self->_firstDominates_data = v7;

  v9 = [v4 objectForKeyedSubscript:@"nextDominates"];

  nextDominates_data = self->_nextDominates_data;
  self->_nextDominates_data = v9;

  v11 = self->_dominators_data;
  if (v11 && self->_firstDominates_data && self->_nextDominates_data)
  {
    self->_dominators = (unsigned int *)[(NSData *)v11 bytes];
    self->_firstDominates = (unsigned int *)[(NSData *)self->_firstDominates_data bytes];
    self->_nextDominates = (unsigned int *)[(NSData *)self->_nextDominates_data bytes];
    self->_nodeNamespaceSize = [(NSData *)self->_firstDominates_data length] >> 2;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyDict
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)&self->_dominators_data;
  v4[0] = @"dominators";
  v4[1] = @"firstDominates";
  long long v5 = v2;
  v4[2] = @"nextDominates";
  nextDominates_data = self->_nextDominates_data;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v5 forKeys:v4 count:3];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)consolidate:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v63 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = v3;
  uint64_t v61 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v61)
  {
    id v59 = *(id *)v90;
    do
    {
      id v4 = 0;
      do
      {
        if (*(id *)v90 != v59) {
          objc_enumerationMutation(obj);
        }
        v71 = NSString;
        v67 = v4;
        id v5 = *(id *)(*((void *)&v89 + 1) + 8 * (void)v4);
        uint64_t v6 = [v5 objectForKeyedSubscript:@"className"];
        v75 = (void *)v6;
        if (v6) {
          uint64_t v7 = (__CFString *)v6;
        }
        else {
          uint64_t v7 = &stru_1EFE27F38;
        }
        v8 = v7;
        uint64_t v9 = [v5 objectForKeyedSubscript:@"binary"];
        v73 = (void *)v9;
        if (v9) {
          v10 = (__CFString *)v9;
        }
        else {
          v10 = &stru_1EFE27F38;
        }
        v65 = v10;
        uint64_t v11 = [v5 objectForKeyedSubscript:@"stackid"];
        v69 = (void *)v11;
        if (v11) {
          v12 = (__CFString *)v11;
        }
        else {
          v12 = &stru_1EFE27F38;
        }
        v13 = v12;
        uint64_t v14 = [v5 objectForKeyedSubscript:@"region"];
        v15 = (void *)v14;
        if (v14) {
          v16 = (__CFString *)v14;
        }
        else {
          v16 = &stru_1EFE27F38;
        }
        v17 = v16;
        uint64_t v18 = [v5 objectForKeyedSubscript:@"path"];
        v19 = (void *)v18;
        if (v18) {
          v20 = (__CFString *)v18;
        }
        else {
          v20 = &stru_1EFE27F38;
        }
        v21 = v20;
        v22 = [v5 objectForKeyedSubscript:@"description"];

        if (v22) {
          v23 = v22;
        }
        else {
          v23 = &stru_1EFE27F38;
        }
        v24 = v8;
        v25 = [v71 stringWithFormat:@"%@\x00%@\x00%@\x00%@\x00%@\x00%@", v8, v65, v13, v17, v21, v23];

        id v26 = [v63 objectForKeyedSubscript:v25];
        if (!v26)
        {
          id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v63 setObject:v26 forKeyedSubscript:v25];
        }
        [v26 addObject:v5];

        id v4 = v67 + 1;
      }
      while ((char *)v61 != v67 + 1);
      uint64_t v61 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
    }
    while (v61);
  }

  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v64 = v63;
  uint64_t v62 = [v64 countByEnumeratingWithState:&v85 objects:v96 count:16];
  if (v62)
  {
    uint64_t v58 = *(void *)v86;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v86 != v58) {
          objc_enumerationMutation(v64);
        }
        uint64_t v66 = v27;
        v28 = [v64 objectForKeyedSubscript:*(void *)(*((void *)&v85 + 1) + 8 * v27)];
        id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        for (uint64_t i = 0; i != 6; ++i)
        {
          v32 = name_keys[i];
          v33 = [v28 objectAtIndexedSubscript:0];
          v34 = [v33 objectForKeyedSubscript:v32];
          [v30 setObject:v34 forKeyedSubscript:v32];
        }
        v72 = v30;
        memset(v95, 0, sizeof(v95));
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v68 = v28;
        uint64_t v74 = [v68 countByEnumeratingWithState:&v81 objects:v94 count:16];
        if (v74)
        {
          uint64_t v70 = *(void *)v82;
          do
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v82 != v70) {
                objc_enumerationMutation(v68);
              }
              uint64_t v76 = v35;
              v36 = *(void **)(*((void *)&v81 + 1) + 8 * v35);
              v37 = [v36 objectForKeyedSubscript:@"children"];
              v38 = v37;
              if (v37)
              {
                long long v79 = 0u;
                long long v80 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                uint64_t v39 = [v37 countByEnumeratingWithState:&v77 objects:v93 count:16];
                if (v39)
                {
                  uint64_t v40 = v39;
                  uint64_t v41 = *(void *)v78;
                  do
                  {
                    for (uint64_t j = 0; j != v40; ++j)
                    {
                      if (*(void *)v78 != v41) {
                        objc_enumerationMutation(v38);
                      }
                      [v29 addObject:*(void *)(*((void *)&v77 + 1) + 8 * j)];
                    }
                    uint64_t v40 = [v38 countByEnumeratingWithState:&v77 objects:v93 count:16];
                  }
                  while (v40);
                }
              }
              uint64_t v43 = 0;
              v44 = 0;
              do
              {
                uint64_t v45 = 0;
                char v46 = 1;
                do
                {
                  v47 = v44;
                  char v48 = v46;
                  v44 = [v36 objectForKeyedSubscript:*(&stat_keys[2 * v43] + v45)];

                  if (v44) {
                    *((void *)&v95[v43] + v45) += [v44 unsignedLongLongValue];
                  }
                  char v46 = 0;
                  uint64_t v45 = 1;
                }
                while ((v48 & 1) != 0);
                ++v43;
              }
              while (v43 != 4);

              uint64_t v35 = v76 + 1;
            }
            while (v76 + 1 != v74);
            uint64_t v74 = [v68 countByEnumeratingWithState:&v81 objects:v94 count:16];
          }
          while (v74);
        }

        for (uint64_t k = 0; k != 4; ++k)
        {
          uint64_t v50 = 0;
          char v51 = 1;
          do
          {
            char v52 = v51;
            if (*((void *)&v95[k] + v50))
            {
              v53 = [NSNumber numberWithUnsignedLongLong:];
              [v72 setObject:v53 forKeyedSubscript:*(&stat_keys[2 * k] + v50)];
            }
            char v51 = 0;
            uint64_t v50 = 1;
          }
          while ((v52 & 1) != 0);
        }
        v54 = +[VMUDominatorGraph consolidate:v29];
        v55 = v54;
        if (v54 && [v54 count]) {
          [v72 setObject:v55 forKeyedSubscript:@"children"];
        }
        [v60 addObject:v72];

        uint64_t v27 = v66 + 1;
      }
      while (v66 + 1 != v62);
      uint64_t v62 = [v64 countByEnumeratingWithState:&v85 objects:v96 count:16];
    }
    while (v62);
  }

  return v60;
}

- (id)export:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __28__VMUDominatorGraph_export___block_invoke;
  v9[3] = &unk_1E5D258F8;
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1AD0DA230](v9);
  uint64_t v7 = [(VMUDominatorGraph *)self fastDFS:v6 graph:v5];

  return v7;
}

id __28__VMUDominatorGraph_export___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, void *a7, uint64_t a8, void *a9)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  long long v56 = 0u;
  long long v57 = 0u;
  if (a5 == 5 || a5 == 2)
  {
    *((void *)&v57 + 1) = 1;
    if (v16)
    {
      v23 = [v16 path];
      if ([v23 length]) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
      id v21 = v24;

      int v25 = *((_DWORD *)v16 + 13);
      if (v25 == 3 || v25 == 0) {
        *((void *)&v56 + 1) = *((void *)v16 + 22) + *((void *)v16 + 23);
      }
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v28 = [v16 type];
      [v27 setObject:v28 forKeyedSubscript:@"region"];

      id v19 = v27;
      if (!v21)
      {
LABEL_19:

        if (v19) {
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      v22 = @"path";
LABEL_18:
      [v19 setObject:v21 forKeyedSubscript:v22];
      goto LABEL_19;
    }
LABEL_20:
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v29 = [*(id *)(a1 + 32) nodeDescription:a2];
    [v19 setObject:v29 forKeyedSubscript:@"description"];

    goto LABEL_21;
  }
  if (a5 != 1) {
    goto LABEL_20;
  }
  *(void *)&long long v56 = a4;
  *(void *)&long long v57 = 1;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v19 = v18;
  if (v15)
  {
    v20 = [v15 className];
    [v19 setObject:v20 forKeyedSubscript:@"className"];

    id v21 = [v15 binaryName];
    v22 = @"binary";
    goto LABEL_18;
  }
  [v18 setObject:@"non-object" forKeyedSubscript:@"className"];
  if (!v19) {
    goto LABEL_20;
  }
LABEL_21:
  char v48 = v16;
  if (a8 != -1)
  {
    id v30 = [NSNumber numberWithUnsignedLongLong:a8];
    [v19 setObject:v30 forKeyedSubscript:@"stackid"];
  }
  uint64_t v31 = 0;
  v32 = stat_keys;
  do
  {
    if (*(void *)((char *)&v56 + v31))
    {
      v33 = [NSNumber numberWithUnsignedLongLong:];
      [v19 setObject:v33 forKeyedSubscript:*v32];
    }
    v31 += 8;
    v32 += 2;
  }
  while (v31 != 32);
  v47 = v19;
  v49 = v15;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v17;
  uint64_t v34 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = 0;
        uint64_t v39 = 0;
        uint64_t v40 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        uint64_t v41 = off_1E5D258B8;
        do
        {
          v42 = v39;
          uint64_t v39 = [v40 objectForKeyedSubscript:*v41 withKey:v47 withKey:v48];

          if (v39) {
            *(void *)((char *)&v56 + v38) += [v39 unsignedLongLongValue];
          }
          v41 += 2;
          v38 += 8;
        }
        while (v38 != 32);
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v35);
  }

  uint64_t v43 = 0;
  v44 = off_1E5D258B8;
  do
  {
    if (*(void *)((char *)&v56 + v43))
    {
      uint64_t v45 = [NSNumber numberWithUnsignedLongLong:];
      [v47 setObject:v45 forKeyedSubscript:*v44];
    }
    v43 += 8;
    v44 += 2;
  }
  while (v43 != 32);
  [v47 setObject:obj forKeyedSubscript:@"children"];

  return v47;
}

- (id)fastDFS:(id)a3 graph:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v23 = a4;
  uint64_t v6 = [[VMUVMRegionIdentifier alloc] initWithGraph:v23 options:0];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v8 = [(VMUVMRegionIdentifier *)v6 regions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (([v12 isSubmap] & 1) == 0)
        {
          v13 = [NSNumber numberWithUnsignedLongLong:[v12 address]];
          [v7 setObject:v12 forKeyedSubscript:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  v25[0] = 1;
  id v14 = v7;
  v25[1] = v14;
  id v15 = v23;
  v25[2] = v15;
  id v16 = v6;
  v25[3] = v16;
  long long v26 = *(_OWORD *)&self->_firstDominates;
  uint64_t v27 = MEMORY[0x1AD0DA230](v24);
  uint64_t v28 = [v15 methodForSelector:sel_nodeDetails_];
  uint64_t v29 = [v15 methodForSelector:sel_stackIDForNode_];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t nodeNamespaceSize = self->_nodeNamespaceSize;
  if ((int)nodeNamespaceSize < 1)
  {
LABEL_17:
    id v21 = v17;
    goto LABEL_18;
  }
  uint64_t v19 = 0;
  while (1)
  {
    if (self->_dominators[v19] != -1 || self->_firstDominates[v19] == -1) {
      goto LABEL_16;
    }
    v20 = visit((uint64_t)v25, v19);
    if (!v20) {
      break;
    }
    [v17 addObject:v20];

LABEL_16:
    if (nodeNamespaceSize == ++v19) {
      goto LABEL_17;
    }
  }
  id v21 = 0;
LABEL_18:

  __destructor_8_s8_s16_s24_sb48((uint64_t)v25);

  return v21;
}

- (VMUDominatorGraph)initWithGraph:(id)a3
{
  return [(VMUDominatorGraph *)self initWithGraph:a3 debugTimer:0];
}

- (VMUDominatorGraph)initWithGraph:(id)a3 debugTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VMUDominatorGraph;
  v8 = [(VMUDominatorGraph *)&v18 init];
  if (v8)
  {
    uint64_t v9 = (void *)[v6 copy];

    v8->_uint64_t nodeNamespaceSize = [v9 nodeNamespaceSize];
    uint64_t v10 = [[VMUReverseGraphEnumerator alloc] initWithGraph:v9];
    reverseGraphEnumerator = v8->_reverseGraphEnumerator;
    v8->_reverseGraphEnumerator = &v10->super;

    [v9 removeWeakEdges];
    int v12 = [v9 nodeNamespaceSize];
    v13 = malloc_type_calloc(1uLL, ((v12 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    _DWORD *v13 = v12;
    [v9 markRootNodes:v13];
    id v14 = [[VMUGraphEnumerator alloc] initWithGraph:v9];
    id v15 = [(VMUGraphEnumerator *)v14 buildReversePostOrderWithRoots:v13];

    id v16 = [(VMUDominatorGraph *)v8 _computeDominators:v9 roots:v13 reversePostOrder:v15 debugTimer:v7];
    [(VMUDominatorGraph *)v8 setDominators_data:v16];

    v8->_dominators = (unsigned int *)[(NSData *)v8->_dominators_data bytes];
    free(v15);
    free(v13);
    [(VMUDominatorGraph *)v8 _computeDominees:v9];
    id v6 = v9;
  }

  return v8;
}

- (id)_computeDominators:(id)a3 roots:(void *)a4 reversePostOrder:(unsigned int *)a5 debugTimer:(id)a6
{
  id v38 = a3;
  id v39 = a6;
  v8 = [v38 invertedGraph];
  unsigned int v9 = [v8 nodeNamespaceSize];
  size_t v10 = 4 * (v9 + 1);
  uint64_t v11 = malloc_type_malloc(v10, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v11, &__pattern4, v10);
  id v36 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v11 length:v10 freeWhenDone:1];
  int v12 = malloc_type_malloc(v10, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  uint64_t v43 = v12;
  memset_pattern4(v12, &__pattern4, v10);
  v13 = malloc_type_malloc(v10, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v13, &__pattern4, v10);
  uint64_t v40 = v8;
  int v14 = [v8 nodeNamespaceSize];
  if (v14 >= 1)
  {
    uint64_t v15 = v14;
    id v16 = a5;
    do
    {
      unsigned int v18 = *v16++;
      uint64_t v17 = v18;
      if (v18 == -1) {
        break;
      }
      v43[v17] = v15--;
    }
    while (v15);
  }
  v11[v9] = v9;
  v43[v9] = [v8 nodeNamespaceSize] + 100;
  uint64_t v41 = 0;
  do
  {
    while (1)
    {
      int v19 = [v40 nodeNamespaceSize];
      if (v19 >= 1)
      {
        uint64_t v20 = 0;
        uint64_t v44 = 0;
        uint64_t v21 = -1;
        v22 = a5;
        uint64_t v23 = v19;
        while (1)
        {
          unsigned int v25 = *v22++;
          uint64_t v24 = v25;
          if (v25 == -1) {
            goto LABEL_33;
          }
          if (v11[v24] != v9) {
            break;
          }
          ++v20;
LABEL_30:
          if (!--v23) {
            goto LABEL_33;
          }
        }
        p_pattern4 = &__pattern4;
        uint64_t __pattern4 = 0;
        long long v57 = &__pattern4;
        uint64_t v58 = 0x2020000000;
        int v27 = *((_DWORD *)v13 + v24);
        int v59 = v27;
        switch(v27)
        {
          case -1:
            int v59 = 0;
            reverseGraphEnumerator = self->_reverseGraphEnumerator;
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke;
            v55[3] = &unk_1E5D251A8;
            v55[4] = &__pattern4;
            [(VMUGraphEnumerator *)reverseGraphEnumerator enumerateEdgesOfNode:v24 withBlock:v55];
            p_pattern4 = v57;
            *((_DWORD *)v13 + v24) = *((_DWORD *)v57 + 6);
            break;
          case 1:
LABEL_15:
            ++v20;
LABEL_29:
            _Block_object_dispose(&__pattern4, 8);
            goto LABEL_30;
          case 0:
            v11[v24] = v9;
            goto LABEL_15;
        }
        uint64_t v51 = 0;
        long long v52 = &v51;
        uint64_t v53 = 0x2020000000;
        int v54 = -1;
        if (*((_DWORD *)p_pattern4 + 6))
        {
          uint64_t v29 = self->_reverseGraphEnumerator;
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_2;
          v50[3] = &unk_1E5D25920;
          v50[5] = v43;
          v50[6] = v11;
          v50[4] = &v51;
          [(VMUGraphEnumerator *)v29 enumerateEdgesOfNode:v24 withBlock:v50];
          if (*((_DWORD *)v57 + 6) >= 2u)
          {
            v42 = self->_reverseGraphEnumerator;
            v45[0] = MEMORY[0x1E4F143A8];
            v45[1] = 3221225472;
            v45[2] = __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_3;
            v45[3] = &unk_1E5D25948;
            v47 = &v51;
            char v48 = v43;
            v49 = v11;
            id v46 = v38;
            [(VMUGraphEnumerator *)v42 enumerateEdgesOfNode:v24 withBlock:v45];
          }
        }
        else
        {
          int v54 = v9;
        }
        int v30 = *((_DWORD *)v52 + 6);
        if (v30 == -1 || ((int v31 = v11[v24], v31 != -1) ? (v32 = v30 == v31) : (v32 = 0), v32))
        {
          uint64_t v24 = v21;
        }
        else
        {
          v11[v24] = v30;
          ++v44;
        }
        _Block_object_dispose(&v51, 8);
        uint64_t v21 = v24;
        goto LABEL_29;
      }
      uint64_t v44 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = -1;
LABEL_33:
      if (!v39) {
        break;
      }
      NSLog(&cfstr_ComputeDominat.isa, v41++, v44, v20, v21);
      if (!v44) {
        goto LABEL_37;
      }
    }
  }
  while (v44);
LABEL_37:
  int v33 = [v40 nodeNamespaceSize];
  if (v33 >= 1)
  {
    uint64_t v34 = v33;
    do
    {
      if (*v11 == v9) {
        _DWORD *v11 = -1;
      }
      ++v11;
      --v34;
    }
    while (v34);
  }
  free(v13);
  free(v43);

  return v36;
}

uint64_t __74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke(uint64_t result)
{
  return result;
}

void *__74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_2(void *result, uint64_t a2, uint64_t a3, unsigned int a4, unsigned char *a5)
{
  if (*(_DWORD *)(result[5] + 4 * a4) != -1 && *(_DWORD *)(result[6] + 4 * a4) != -1)
  {
    *(_DWORD *)(*(void *)(result[4] + 8) + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4;
    *a5 = 1;
  }
  return result;
}

void *__74__VMUDominatorGraph__computeDominators_roots_reversePostOrder_debugTimer___block_invoke_3(void *result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = result[6];
  if (*(_DWORD *)(v4 + 4 * a4) != -1)
  {
    uint64_t v5 = a4;
    uint64_t v6 = *(void *)(result[5] + 8);
    uint64_t v7 = *(unsigned int *)(v6 + 24);
    if (v7 != a4)
    {
      uint64_t v8 = result[7];
      if (*(_DWORD *)(v8 + 4 * a4) != -1)
      {
        do
        {
          unsigned int v9 = *(_DWORD *)(v4 + 4 * v7);
          while (1)
          {
            unsigned int v10 = *(_DWORD *)(v4 + 4 * v5);
            if (v10 >= v9) {
              break;
            }
            uint64_t v5 = *(unsigned int *)(v8 + 4 * v5);
          }
          while (v9 < v10)
          {
            uint64_t v7 = *(unsigned int *)(v8 + 4 * v7);
            unsigned int v9 = *(_DWORD *)(v4 + 4 * v7);
          }
        }
        while (v5 != v7);
        *(_DWORD *)(v6 + ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v5;
      }
    }
  }
  return result;
}

- (void)_computeDominees:(id)a3
{
  id v17 = a3;
  size_t v4 = 4 * [v17 nodeNamespaceSize];
  uint64_t v5 = malloc_type_malloc(v4, 0x100004052888210uLL);
  int __pattern4 = -1;
  memset_pattern4(v5, &__pattern4, v4);
  self->_firstDominates = (unsigned int *)v5;
  size_t v6 = 4 * [v17 nodeNamespaceSize];
  uint64_t v7 = malloc_type_malloc(v6, 0x100004052888210uLL);
  int v18 = -1;
  memset_pattern4(v7, &v18, v6);
  self->_nextDominates = (unsigned int *)v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_firstDominates length:4 * [v17 nodeNamespaceSize] freeWhenDone:1];
  [(VMUDominatorGraph *)self setFirstDominates_data:v8];

  unsigned int v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_nextDominates length:4 * [v17 nodeNamespaceSize] freeWhenDone:1];
  [(VMUDominatorGraph *)self setNextDominates_data:v9];

  int v10 = [v17 nodeNamespaceSize];
  if (v10 >= 1)
  {
    uint64_t v11 = 0;
    dominators = self->_dominators;
    do
    {
      uint64_t v13 = dominators[v11];
      if (v13 != -1)
      {
        int v14 = &self->_firstDominates[v13];
        uint64_t v15 = *v14;
        if (v15 != -1)
        {
          nextDominates = self->_nextDominates;
          int v14 = &nextDominates[v15];
          nextDominates[v11] = *v14;
        }
        *int v14 = v11;
      }
      ++v11;
    }
    while (v10 != v11);
  }
}

- (unsigned)dominator:(unsigned int)a3
{
  return self->_dominators[a3];
}

- (void)enumerateDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4
{
  int v12 = (void (**)(id, void))a4;
  size_t v6 = malloc_type_malloc(0x80uLL, 0x100004052888210uLL);
  *size_t v6 = self->_firstDominates[a3];
  unint64_t v7 = 32;
  uint64_t v8 = 1;
  do
  {
    uint64_t v9 = v8 - 1;
    uint64_t v10 = v6[v8 - 1];
    if (v10 != -1)
    {
      v12[2](v12, v6[v8 - 1]);
      if (v8 + 1 >= v7)
      {
        size_t v6 = malloc_type_realloc(v6, 8 * v7, 0x100004052888210uLL);
        v7 *= 2;
      }
      nextDominates = self->_nextDominates;
      v6[v9] = self->_firstDominates[v10];
      v6[v8] = nextDominates[v10];
      uint64_t v9 = v8 + 1;
    }
    uint64_t v8 = v9;
  }
  while (v9);
  free(v6);
}

- (BOOL)hasAnyDirectDomineesForNodeName:(unsigned int)a3
{
  return self->_firstDominates[a3] != -1;
}

- (void)enumerateDirectDomineesForNodeName:(unsigned int)a3 withBlock:(id)a4
{
  for (uint64_t i = self->_firstDominates[a3]; i != -1; uint64_t i = self->_nextDominates[i])
    (*((void (**)(id, uint64_t))a4 + 2))(a4, i);
}

- (void)enumerateDominatorRootsWithBlock:(id)a3
{
  size_t v6 = (void (**)(id, void))a3;
  uint64_t nodeNamespaceSize = self->_nodeNamespaceSize;
  if ((int)nodeNamespaceSize >= 1)
  {
    for (uint64_t i = 0; i != nodeNamespaceSize; ++i)
    {
      if (self->_dominators[i] == -1 && self->_firstDominates[i] != -1) {
        v6[2](v6, i);
      }
    }
  }
}

- (id)iterDominatorRoots
{
  long long v2 = [[VMUDominatorRoots alloc] initWithDominatorGraph:self];

  return v2;
}

- (id)iterDirectDomineesForNodeName:(unsigned int)a3
{
  id v3 = [[VMUDirectDominees alloc] initWithDominatorGraph:self rootNode:*(void *)&a3];

  return v3;
}

+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredAddress:(id)a6 debugTimer:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  int v14 = objc_alloc_init(VMUDominatorCallTreeCreator);
  [(VMUDominatorCallTreeCreator *)v14 setDesiredAddress:v12];

  uint64_t v15 = [(VMUDominatorCallTreeCreator *)v14 callTreeWithGraph:v13 groupByType:v9 showRegionVirtualSize:v8 debugTimer:v11];

  return v15;
}

+ (id)callTreeWithGraph:(id)a3 groupByType:(BOOL)a4 showRegionVirtualSize:(BOOL)a5 desiredClassesPattern:(id)a6 debugTimer:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a3;
  int v14 = objc_alloc_init(VMUDominatorCallTreeCreator);
  [(VMUDominatorCallTreeCreator *)v14 setDesiredClassesPattern:v12];

  uint64_t v15 = [(VMUDominatorCallTreeCreator *)v14 callTreeWithGraph:v13 groupByType:v9 showRegionVirtualSize:v8 debugTimer:v11];

  return v15;
}

- (NSData)dominators_data
{
  return self->_dominators_data;
}

- (void)setDominators_data:(id)a3
{
}

- (NSData)firstDominates_data
{
  return self->_firstDominates_data;
}

- (void)setFirstDominates_data:(id)a3
{
}

- (NSData)nextDominates_data
{
  return self->_nextDominates_data;
}

- (void)setNextDominates_data:(id)a3
{
}

- (unsigned)nodeNamespaceSize
{
  return self->_nodeNamespaceSize;
}

- (void)setNodeNamespaceSize:(unsigned int)a3
{
  self->_uint64_t nodeNamespaceSize = a3;
}

- (unsigned)dominators
{
  return self->_dominators;
}

- (void)setDominators:(unsigned int *)a3
{
  self->_dominators = a3;
}

- (unsigned)firstDominates
{
  return self->_firstDominates;
}

- (void)setFirstDominates:(unsigned int *)a3
{
  self->_firstDominates = a3;
}

- (unsigned)nextDominates
{
  return self->_nextDominates;
}

- (void)setNextDominates:(unsigned int *)a3
{
  self->_nextDominates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextDominates_data, 0);
  objc_storeStrong((id *)&self->_firstDominates_data, 0);
  objc_storeStrong((id *)&self->_dominators_data, 0);

  objc_storeStrong((id *)&self->_reverseGraphEnumerator, 0);
}

@end