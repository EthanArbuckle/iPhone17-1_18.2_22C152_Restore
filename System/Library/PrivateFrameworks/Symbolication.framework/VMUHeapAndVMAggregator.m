@interface VMUHeapAndVMAggregator
- (NSArray)heapZoneAggregates;
- (VMUHeapAndVMAggregator)initWithGraph:(id)a3 options:(id)a4;
- (VMUMallocZoneAggregate)allZonesAggregate;
- (id)_classDisplayName:(id)a3;
- (void)_countAllocation:(id)a3 inRegion:(id)a4;
- (void)analyzeMemgraph;
- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4;
- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation VMUHeapAndVMAggregator

- (VMUHeapAndVMAggregator)initWithGraph:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VMUHeapAndVMAggregator;
  v9 = [(VMUHeapAndVMAggregator *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heapAndVMOptions, a4);
    objc_storeStrong((id *)&v10->_graph, a3);
    uint64_t v11 = [(VMUHeapAndVMAggregatorOptions *)v10->_heapAndVMOptions classFilterPatternMatcher];
    classFilterPatternMatcher = v10->_classFilterPatternMatcher;
    v10->_classFilterPatternMatcher = (VMUClassPatternMatcher *)v11;

    uint64_t v13 = +[VMUClassInfo classInfoWithClassName:@"non-object" binaryPath:&stru_1EFE27F38 type:0];
    nonObjectInfo = v10->_nonObjectInfo;
    v10->_nonObjectInfo = (VMUClassInfo *)v13;
  }
  return v10;
}

- (NSArray)heapZoneAggregates
{
  v2 = (void *)[(NSMutableArray *)self->_heapZoneAggregates copy];

  return (NSArray *)v2;
}

- (id)_classDisplayName:(id)a3
{
  heapAndVMOptions = self->_heapAndVMOptions;
  id v4 = a3;
  if ([(VMUHeapAndVMAggregatorOptions *)heapAndVMOptions showRawClassNames]) {
    [v4 className];
  }
  else {
  v5 = [v4 displayName];
  }

  return v5;
}

- (void)_countAllocation:(id)a3 inRegion:(id)a4
{
  v10 = (unsigned int *)a4;
  v6 = [*(id *)(a3.var0 + 16) genericInfo];
  nonObjectInfo = v6;
  if (!v6) {
    nonObjectInfo = self->_nonObjectInfo;
  }
  id v8 = nonObjectInfo;

  [(VMUMallocZoneAggregate *)self->_allZonesAggregate incrementAllocationCountForClassInfo:v8 size:*(void *)(a3.var0 + 8) & 0xFFFFFFFFFFFFFFFLL];
  if ([(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions separateByZone])
  {
    v9 = [(NSMutableArray *)self->_heapZoneAggregates objectAtIndexedSubscript:v10[37]];
    [v9 incrementAllocationCountForClassInfo:v8 size:*(void *)(a3.var0 + 8) & 0xFFFFFFFFFFFFFFFLL];
  }
}

- (void)analyzeMemgraph
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v2 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
  if (v2)
  {
    v3 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    uint64_t v4 = [v3 signpostID];

    if (v4)
    {
      v5 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
      v6 = [v5 logHandle];

      id v7 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
      os_signpost_id_t v8 = [v7 signpostID];

      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v6, OS_SIGNPOST_INTERVAL_END, v8, "VMUHeapAndVMAggregator", "", buf, 2u);
      }
    }
  }
  v9 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
  [v9 endEvent:"VMUHeapAndVMAggregator"];

  v10 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
  [v10 startWithCategory:"VMUHeapAndVMAggregator" message:"counting allocations"];

  uint64_t v11 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];

  if (v11)
  {
    v12 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    uint64_t v13 = [v12 logHandle];

    v14 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    os_signpost_id_t v15 = [v14 signpostID];

    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VMUHeapAndVMAggregator", "counting allocations", buf, 2u);
    }
  }
  objc_super v16 = [[VMUMallocZoneAggregate alloc] initWithZoneName:0 options:self->_heapAndVMOptions];
  allZonesAggregate = self->_allZonesAggregate;
  self->_allZonesAggregate = v16;

  if ([(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions separateByZone])
  {
    v18 = [MEMORY[0x1E4F1CA48] array];
    heapZoneAggregates = self->_heapZoneAggregates;
    self->_heapZoneAggregates = v18;

    if ([(VMUCommonGraphInterface *)self->_graph zoneCount])
    {
      unsigned int v20 = 0;
      do
      {
        v21 = self->_heapZoneAggregates;
        v22 = [[VMUMallocZoneAggregate alloc] initWithZoneName:0 options:self->_heapAndVMOptions];
        [(NSMutableArray *)v21 addObject:v22];

        ++v20;
      }
      while (v20 < [(VMUCommonGraphInterface *)self->_graph zoneCount]);
    }
  }
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  int v88 = 0;
  v23 = self;
  unsigned int v68 = [(VMUCommonGraphInterface *)self->_graph nodeNamespaceSize];
  int v67 = [(VMUCommonGraphInterface *)self->_graph zoneCount];
  v66 = objc_opt_new();
  if ([(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions guessNonObjects])
  {
    __b = malloc_type_malloc(4 * v68, 0x100004052888210uLL);
    *(_DWORD *)buf = -1;
    memset_pattern4(__b, buf, 4 * v68);
  }
  else
  {
    __b = 0;
  }
  if (([(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions scope] == 2
     || [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions scope] == 1)
    && [(VMUCommonGraphInterface *)self->_graph isMemberOfClass:objc_opt_class()])
  {
    v24 = [[VMUVMRegionIdentifier alloc] initWithGraph:self->_graph options:0];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v25 = [(VMUVMRegionIdentifier *)v24 zoneNames];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v83 objects:v89 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v84 != v27) {
            objc_enumerationMutation(v25);
          }
          uint64_t v29 = *(void *)(*((void *)&v83 + 1) + 8 * i);
          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          *(_OWORD *)buf = 0u;
          if (v24)
          {
            [(VMUVMRegionIdentifier *)v24 computedStatisticsForZoneWithName:v29];
            if (*((void *)&v82 + 1))
            {
              v30 = [NSString stringWithFormat:@"VM: %@ fragmentation", v29];
              v31 = +[VMUClassInfo classInfoWithClassName:v30 binaryPath:&stru_1EFE27F38 type:0];
              [(VMUMallocZoneAggregate *)self->_allZonesAggregate modifySize:*((void *)&v82 + 1) count:1 forClassInfo:v31];
            }
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v83 objects:v89 count:16];
      }
      while (v26);
    }

    v23 = self;
  }
  graph = v23->_graph;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke;
  v72[3] = &unk_1E5D26098;
  unsigned int v76 = v68;
  v74 = v87;
  v72[4] = v23;
  v75 = __b;
  id v33 = v66;
  id v73 = v33;
  int v77 = v67;
  [(VMUCommonGraphInterface *)graph enumerateRegionsWithBlock:v72];

  v34 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
  if (v34)
  {
    v35 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    BOOL v36 = [v35 signpostID] == 0;

    if (!v36)
    {
      v37 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
      v38 = [v37 logHandle];

      v39 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
      os_signpost_id_t v40 = [v39 signpostID];

      if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v38, OS_SIGNPOST_INTERVAL_END, v40, "VMUHeapAndVMAggregator", "", buf, 2u);
      }
    }
  }
  v41 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
  [v41 endEvent:"VMUHeapAndVMAggregator"];

  if ([(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions guessNonObjects])
  {
    v42 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    if (v42)
    {
      v43 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
      BOOL v44 = [v43 signpostID] == 0;

      if (!v44)
      {
        v45 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
        v46 = [v45 logHandle];

        v47 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
        os_signpost_id_t v48 = [v47 signpostID];

        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v46, OS_SIGNPOST_INTERVAL_END, v48, "VMUHeapAndVMAggregator", "", buf, 2u);
        }
      }
    }
    v49 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    [v49 endEvent:"VMUHeapAndVMAggregator"];

    v50 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    [v50 startWithCategory:"VMUHeapAndVMAggregator" message:"enumerating references for guessNonObjects"];

    v51 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];

    if (v51)
    {
      v52 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
      v53 = [v52 logHandle];

      v54 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
      os_signpost_id_t v55 = [v54 signpostID];

      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v55, "VMUHeapAndVMAggregator", "enumerating references for guessNonObjects", buf, 2u);
      }
    }
    v56 = (void *)MEMORY[0x1AD0D9F90]();
    v57 = self->_graph;
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke_23;
    v71[3] = &unk_1E5D260C0;
    v71[4] = self;
    v71[5] = __b;
    [(VMUCommonGraphInterface *)v57 enumerateReferencesWithBlock:v71];
    v58 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    if (v58)
    {
      v59 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
      BOOL v60 = [v59 signpostID] == 0;

      if (!v60)
      {
        v61 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
        v62 = [v61 logHandle];

        v63 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
        os_signpost_id_t v64 = [v63 signpostID];

        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v62, OS_SIGNPOST_INTERVAL_END, v64, "VMUHeapAndVMAggregator", "", buf, 2u);
        }
      }
    }
    v65 = [(VMUHeapAndVMAggregatorOptions *)self->_heapAndVMOptions debugTimer];
    [v65 endEvent:"VMUHeapAndVMAggregator"];

    free(__b);
  }

  _Block_object_dispose(v87, 8);
}

void __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(v4 + 8);
  uint64_t v5 = v4 + 8;
  if (*(_DWORD *)(v6 + 24) < *(_DWORD *)(a1 + 64))
  {
    unint64_t v7 = 0x1E5D22000uLL;
    do
    {
      uint64_t v26 = 0;
      long long v25 = 0uLL;
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = *(void **)(v8 + 16);
      if (v9)
      {
        [v9 nodeDetails:*(unsigned int *)(*(void *)v5 + 24)];
        uint64_t v8 = *(void *)(a1 + 32);
      }
      int v10 = [*(id *)(v8 + 8) scope];
      if (v10 == 2)
      {
        unint64_t v11 = *((void *)&v25 + 1);
        if (*((void *)&v25 + 1) >> 60 != 5) {
          goto LABEL_29;
        }
      }
      else if (v10 == 1)
      {
        unint64_t v11 = *((void *)&v25 + 1);
        if (*((void *)&v25 + 1) >> 60 != 1)
        {
          if (!VMUGraphNodeType_IsVMRegion(*((void *)&v25 + 1) >> 60)) {
            goto LABEL_29;
          }
          unint64_t v11 = *((void *)&v25 + 1);
        }
      }
      else
      {
        if (v10) {
          abort();
        }
        unint64_t v11 = *((void *)&v25 + 1);
        if (*((void *)&v25 + 1) >> 60 != 1) {
          goto LABEL_29;
        }
      }
      if ((v11 & 0xFFFFFFFFFFFFFFFLL) != 0)
      {
        if ((unint64_t)v25 >= v3[2] + v3[1]) {
          break;
        }
        v12 = *(void **)(*(void *)(a1 + 32) + 48);
        if (!v12) {
          goto LABEL_20;
        }
        long long v23 = v25;
        uint64_t v24 = v26;
        if ([v12 matchesNodeDetails:&v23 orNodeDescription:0])
        {
          unint64_t v11 = *((void *)&v25 + 1);
LABEL_20:
          if (v11 >> 60 == 1)
          {
            uint64_t v13 = *(void **)(a1 + 32);
            long long v23 = v25;
            uint64_t v24 = v26;
            [v13 _countAllocation:&v23 inRegion:v3];
            if ([*(id *)(*(void *)(a1 + 32) + 8) guessNonObjects]) {
              *(_DWORD *)(*(void *)(a1 + 56) + 4 * *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) = *((_DWORD *)v3 + 37) + 1;
            }
          }
          else if (VMUGraphNodeType_IsVMRegion(v11 >> 60) && ([v3 isMallocHeapRelated] & 1) == 0)
          {
            uint64_t v14 = v3[22] + v3[23];
            uint64_t v15 = v3[24];
            uint64_t v16 = v14 - v15;
            if (v14 != v15)
            {
              unint64_t v17 = v7;
              v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3[4]];
              if (!v18)
              {
                v19 = [NSString stringWithFormat:@"VM: %@", v3[4]];
                v18 = [*(id *)(v17 + 2736) classInfoWithClassName:v19 binaryPath:&stru_1EFE27F38 type:0];
                [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:v3[4]];
              }
              [*(id *)(*(void *)(a1 + 32) + 24) modifySize:v16 count:1 forClassInfo:v18];

              unint64_t v7 = v17;
            }
          }
        }
      }
LABEL_29:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v20 = *(void *)(a1 + 48);
      uint64_t v21 = *(void *)(v20 + 8);
      uint64_t v5 = v20 + 8;
    }
    while (*(_DWORD *)(v21 + 24) < *(_DWORD *)(a1 + 64));
  }
  if ([*(id *)(*(void *)(a1 + 32) + 8) separateByZone]
    && *((_DWORD *)v3 + 37) < *(_DWORD *)(a1 + 68))
  {
    v22 = [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndexedSubscript:];
    [v22 incrementVirtualSize:v3[2]];
  }
}

void __41__VMUHeapAndVMAggregator_analyzeMemgraph__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(void *)(a5 + 24))
  {
    unsigned int v5 = a4;
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = *(_DWORD *)(v7 + 4 * a4);
    if (v8)
    {
      if (*(_DWORD *)(v7 + 4 * a3) == v8)
      {
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        uint64_t v31 = 0;
        int v10 = *(void **)(*(void *)(a1 + 32) + 16);
        if (v10
          && ([v10 nodeDetails:a4],
              v12 = *(void **)(*(void *)(a1 + 32) + 16),
              long long v29 = 0uLL,
              id v30 = 0,
              v12))
        {
          [v12 nodeDetails:a3];
          id v13 = v30;
          uint64_t v14 = v13;
          if (v13)
          {
            if (!v33)
            {
              uint64_t v15 = [v13 className];
              char v16 = [v15 hasSuffix:@"Storage"]);

              if ((v16 & 1) == 0)
              {
                uint64_t v17 = *(void *)(a1 + 32);
                v18 = *(void **)(v17 + 48);
                if (!v18)
                {
LABEL_13:
                  uint64_t v19 = v5;
                  id v20 = *(id *)(v17 + 24);
                  if ([*(id *)(*(void *)(a1 + 32) + 8) separateByZone])
                  {
                    uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 32) objectAtIndexedSubscript:(*(_DWORD *)(*(void *)(a1 + 40) + 4 * v19) - 1)];

                    id v20 = (id)v21;
                  }
                  [v20 modifySize:-(v32 & 0xFFFFFFFFFFFFFFFLL) count:-1 forClassInfo:*(void *)(*(void *)(a1 + 32) + 40)];
                  if ([*(id *)(*(void *)(a1 + 32) + 8) sumObjectFields])
                  {
                    [v20 modifySize:v32 & 0xFFFFFFFFFFFFFFFLL count:0 forClassInfo:v14];
                  }
                  else
                  {
                    v22 = (void *)MEMORY[0x1AD0D9F90]();
                    long long v23 = [*(id *)(a1 + 32) _classDisplayName:v14];
                    uint64_t v24 = [v23 stringByAppendingFormat:@"[%llu]", *(void *)(a5 + 8)];

                    long long v25 = [v14 binaryPath];
                    uint64_t v26 = +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUClassInfo, "classInfoWithClassName:binaryPath:type:", v24, v25, [v14 infoType]);

                    [v20 modifySize:v32 & 0xFFFFFFFFFFFFFFFLL count:1 forClassInfo:v26];
                  }
                  *(_DWORD *)(*(void *)(a1 + 40) + 4 * v19) = 0;

                  goto LABEL_18;
                }
                long long v27 = v29;
                id v28 = v30;
                if ([v18 matchesNodeDetails:&v27 orNodeDescription:0])
                {
                  uint64_t v17 = *(void *)(a1 + 32);
                  goto LABEL_13;
                }
              }
            }
          }
        }
        else
        {
          uint64_t v14 = 0;
          long long v29 = 0uLL;
          id v30 = 0;
        }
LABEL_18:
      }
    }
  }
}

- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4
{
}

- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4
{
}

- (VMUMallocZoneAggregate)allZonesAggregate
{
  return self->_allZonesAggregate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classFilterPatternMatcher, 0);
  objc_storeStrong((id *)&self->_nonObjectInfo, 0);
  objc_storeStrong((id *)&self->_heapZoneAggregates, 0);
  objc_storeStrong((id *)&self->_allZonesAggregate, 0);
  objc_storeStrong((id *)&self->_graph, 0);

  objc_storeStrong((id *)&self->_heapAndVMOptions, 0);
}

@end