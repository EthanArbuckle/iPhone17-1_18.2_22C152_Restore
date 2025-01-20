@interface VMUObjectGraph
- ($3576753C8488139535C1C7A74D12E914)_rawReferenceInfoWithName:(SEL)a3;
- ($3576753C8488139535C1C7A74D12E914)referenceInfoWithName:(SEL)a3;
- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUObjectGraph *)self;
- (BOOL)_commonHighAddressBit;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (BOOL)isGroupNode:(unsigned int)a3;
- (BOOL)isRootNode:(unsigned int)a3;
- (VMUClassInfoMap)indexedClassInfos;
- (VMUObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7;
- (VMUObjectGraph)initWithNodeCount:(unsigned int)a3 nodeProvider:(id)a4;
- (VMUObjectGraph)initWithNodesNoCopy:(_VMUBlockNode *)a3 nodeCount:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)subgraphWithShortestPathsFromNode:(unsigned int)a3 toNodes:(void *)a4;
- (id)subgraphWithUniquePathsFromNode:(unsigned int)a3 toNodes:(void *)a4;
- (unsigned)addEdgeFromNode:(unsigned int)a3 sourceOffset:(unint64_t)a4 withScanType:(unsigned int)a5 toNode:(unsigned int)a6 destinationOffset:(unint64_t)a7;
- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4;
- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4;
- (unsigned)enumerateObjectsContainedInCollection:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateObjectsOfGroupNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateObjectsWithBlock:(id)a3;
- (unsigned)enumerateReferencesOfNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateReferencesWithBlock:(id)a3;
- (unsigned)nodeForAddress:(unint64_t)a3;
- (unsigned)nodeReferencedFromSourceNode:(unsigned int)a3 byIvarWithName:(id)a4;
- (unsigned)scanTypeOfReferenceWithName:(unsigned int)a3;
- (void)_compareWithGraph:(id)a3 andMarkOnMatch:(BOOL)a4;
- (void)_modifyDerivativeGraphCount:(int)a3;
- (void)_refineTypesWithOverlay:(id)a3;
- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6;
- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4;
- (void)createMapForIntersectGraph:(id)a3;
- (void)createMapForMinusGraph:(id)a3;
- (void)dealloc;
- (void)internalizeNodes;
- (void)setClassInfoIndex:(unsigned int)a3 forNode:(unsigned int)a4;
- (void)setIndexedClassInfos:(id)a3;
- (void)stronglyConnectedComponentSearch:(unsigned int)a3 withRecorder:(id)a4;
@end

@implementation VMUObjectGraph

- (VMUObjectGraph)initWithNodeCount:(unsigned int)a3 nodeProvider:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VMUObjectGraph;
  v7 = [(VMUDirectedGraph *)&v14 initWithNodes:v4];
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      uint64_t v9 = MEMORY[0x1AD0DA230](v6);
      id nodeProvider = v8->_nodeProvider;
      v8->_id nodeProvider = (id)v9;

      v8->_referenceGraphNodeNamespaceSize = v4;
      uint64_t v11 = objc_opt_new();
      knownClassInfos = v8->_knownClassInfos;
      v8->_knownClassInfos = (VMUClassInfoMap *)v11;
    }
    else
    {
      knownClassInfos = v7;
      v8 = 0;
    }
  }
  return v8;
}

- (VMUObjectGraph)initWithNodesNoCopy:(_VMUBlockNode *)a3 nodeCount:
{
  unsigned int v4 = v3;
  v11.receiver = self;
  v11.super_class = (Class)VMUObjectGraph;
  id v6 = -[VMUDirectedGraph initWithNodes:](&v11, sel_initWithNodes_);
  v7 = v6;
  if (v6)
  {
    v6->_internalizedNodes = a3;
    v6->_internalizedCount = v4;
    uint64_t v8 = objc_opt_new();
    knownClassInfos = v7->_knownClassInfos;
    v7->_knownClassInfos = (VMUClassInfoMap *)v8;

    v7->_referenceGraphNodeNamespaceSize = 0;
  }
  return v7;
}

- (void)dealloc
{
  referenceGraph = self->_referenceGraph;
  if (referenceGraph)
  {
    [(VMUObjectGraph *)referenceGraph _modifyDerivativeGraphCount:0xFFFFFFFFLL];
    unsigned int v4 = self->_referenceGraph;
    self->_referenceGraph = 0;
  }
  referenceTable = self->_referenceTable;
  if (referenceTable)
  {
    free(referenceTable);
    self->_referenceTable = 0;
  }
  referenceTableLarge = self->_referenceTableLarge;
  if (referenceTableLarge)
  {
    free(referenceTableLarge);
    self->_referenceTableLarge = 0;
  }
  internalizedNodes = self->_internalizedNodes;
  if (internalizedNodes)
  {
    free(internalizedNodes);
    self->_internalizedNodes = 0;
  }
  +[VMUClassInfoMap _destroyRetainedLinearArray:self->_classInfos withCount:self->_classInfosCount];
  v8.receiver = self;
  v8.super_class = (Class)VMUObjectGraph;
  [(VMUDirectedGraph *)&v8 dealloc];
}

- (VMUObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  v137[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  v127.receiver = self;
  v127.super_class = (Class)VMUObjectGraph;
  v112 = a7;
  id v113 = a6;
  objc_super v14 = -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:](&v127, sel_initWithArchived_version_options_diskLogs_error_, v13, a4, a5);
  if (!v14) {
    goto LABEL_71;
  }
  v114 = [v13 objectForKeyedSubscript:@"objectGraphInfo"];
  v14->_unint64_t internalizedCount = [(VMUDirectedGraph *)v14 nodeNamespaceSize];
  char v15 = [(VMUDirectedGraph *)v14 graphIs64bit];
  unint64_t internalizedCount = v14->_internalizedCount;
  if (internalizedCount < 0xFFFFFFF) {
    char v17 = 1;
  }
  else {
    char v17 = v15;
  }
  if (v17)
  {
    v14->_internalizedNodes = (_VMUBlockNode *)malloc_type_malloc(16 * internalizedCount, 0x1000040451B5BE8uLL);
    unint64_t v126 = 0;
    v18 = [v114 objectForKeyedSubscript:@"objectDetails"];
    v19 = +[VMUDirectedGraph _copyUnarchived:v18 length:&v126 options:a5];

    unint64_t v20 = v126;
    v21 = [v114 objectForKeyedSubscript:@"commonAddressBits"];
    uint64_t v22 = [v21 unsignedIntegerValue];

    if (v14->_internalizedCount)
    {
      uint64_t v23 = 0;
      unint64_t v24 = 0;
      unint64_t v25 = 0;
      unint64_t var0 = 0;
      unsigned int v27 = 0;
      unint64_t v28 = v20 >> 2;
      while (v25 + 1 <= v28)
      {
        unsigned int v29 = v19[v25];
        unint64_t v30 = v25 + 4;
        if ((v29 & 0x80000000) != 0 && v30 > v28) {
          break;
        }
        if ((v29 & 0x80000000) != 0)
        {
          unint64_t v32 = v19[v25 + 1] | ((unint64_t)(v29 & 0x7FFFFFFF) << 32);
          unint64_t v33 = v19[v25 + 3] | ((unint64_t)v19[v25 + 2] << 32);
          v34 = &v14->_internalizedNodes[v23];
          v34->unint64_t var0 = v32;
          *((void *)v34 + 1) = v33;
          unint64_t v25 = v30;
        }
        else
        {
          v31 = &v14->_internalizedNodes[v23];
          v31->unint64_t var0 = var0 + (((v29 >> 4) & 0x3FF) << (v29 & 0xF));
          *((void *)v31 + 1) = (32 * (((v29 >> 14) & 0x1F) << (v29 & 0xF))) | 1 | ((unint64_t)(v29 >> 19) << 41);
          ++v27;
          ++v25;
        }
        v35 = &v14->_internalizedNodes[v23];
        unint64_t var0 = v35->var0;
        unsigned int v36 = *((_DWORD *)v35 + 2) & 7;
        BOOL v37 = v36 > 4;
        int v38 = (1 << v36) & 0x19;
        if (v37 || v38 == 0) {
          v35->unint64_t var0 = var0 | v22;
        }
        ++v24;
        ++v23;
        if (v24 >= v14->_internalizedCount) {
          goto LABEL_28;
        }
      }
      v40 = (FILE *)*MEMORY[0x1E4F143C8];
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      id v42 = objc_claimAutoreleasedReturnValue();
      v43 = (const char *)[v42 UTF8String];
      Name = sel_getName(a2);
      fprintf(v40, "-[%s %s] error: malformed serialized data\n", v43, Name);

      if (v19) {
        free(v19);
      }

      goto LABEL_26;
    }
    unsigned int v27 = 0;
    unsigned int v45 = 0;
    if (v19)
    {
LABEL_28:
      free(v19);
      unsigned int v45 = v27;
    }
    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Object Info] Compact: %d Large: %d (%2.2f%%)\n\n", v45, [(VMUDirectedGraph *)v14 nodeNamespaceSize] - v45, (double)v45 * 100.0 / (double)[(VMUDirectedGraph *)v14 nodeNamespaceSize]);
    }
    uint64_t v122 = 0;
    v123 = &v122;
    uint64_t v124 = 0x2020000000;
    char v125 = 1;
    v121[0] = 0;
    v121[1] = v121;
    v121[2] = 0x2020000000;
    v121[3] = 0;
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __66__VMUObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke;
    v117[3] = &unk_1E5D25C50;
    objc_super v14 = v14;
    v118 = v14;
    v119 = v121;
    v120 = &v122;
    [(VMUDirectedGraph *)v14 enumerateNodesWithBlock:v117];
    if (*((unsigned char *)v123 + 24))
    {
      unint64_t v116 = 0;
      v46 = [v114 objectForKeyedSubscript:@"referenceDetails"];
      v14->_referenceTable = (_VMUObjectGraphEdge *)+[VMUDirectedGraph _copyUnarchived:v46 length:&v116 options:a5];

      unsigned int v47 = [(VMUDirectedGraph *)v14 edgeNamespaceSize];
      v14->_uint64_t referenceTableCapacity = v47;
      if (v116 >= 4 * (unint64_t)v47)
      {
        if (kVMUPrintArchivingTiming) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Reference Details] Total Compact and Large: %d\n\n", [(VMUDirectedGraph *)v14 edgeNamespaceSize]);
        }
        unint64_t v115 = 0;
        v68 = [v114 objectForKeyedSubscript:@"referenceDetailsLarge"];
        v14->_referenceTableLarge = (_VMUObjectGraphEdgeLarge *)+[VMUDirectedGraph _copyUnarchived:v68 length:&v115 options:a5];

        unint64_t v69 = v115;
        unint64_t v70 = v115 >> 4;
        v14->_referenceTableLargeCapacity = v115 >> 4;
        v14->_referenceTableLargeCount = v70;
        if (v69 >= 16 * (unint64_t)v14->_referenceTableLargeCapacity)
        {
          if (kVMUPrintArchivingTiming) {
            fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Reference Details Large] Compact: %d Large: %d (%2.2f%%)\n\n", [(VMUDirectedGraph *)v14 edgeNamespaceSize] - v14->_referenceTableLargeCount, v14->_referenceTableLargeCount, (double)([(VMUDirectedGraph *)v14 edgeNamespaceSize] - v14->_referenceTableLargeCount)* 100.0/ (double)[(VMUDirectedGraph *)v14 edgeNamespaceSize]);
          }
          uint64_t referenceTableCapacity = v14->_referenceTableCapacity;
          if (referenceTableCapacity)
          {
            referenceTable = v14->_referenceTable;
            while (1)
            {
              $8D6A3E73ED2192107EDB56A8580BF2AB v84 = referenceTable->var0.var0;
              ++referenceTable;
              $8D6A3E73ED2192107EDB56A8580BF2AB v83 = v84;
              if ((*(_DWORD *)&v84 & 0x80000000) != 0
                && (*(unsigned int *)&v83 & 0x7FFFFFFF) >= v14->_referenceTableLargeCount)
              {
                break;
              }
              if (!--referenceTableCapacity) {
                goto LABEL_55;
              }
            }
            if (v112)
            {
              v100 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v130 = *MEMORY[0x1E4F28568];
              v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
              id *v112 = [v100 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v101];
            }
            BOOL v102 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v102) {
              -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:](v102, v103, v104, v105, v106, v107, v108, v109);
            }
          }
          else
          {
LABEL_55:
            v85 = [v114 objectForKeyedSubscript:@"archivedClassInfos"];
            uint64_t v86 = +[VMUDirectedGraph _unarchivedObject:v85 ofClass:objc_opt_class() options:a5];
            knownClassInfos = v14->_knownClassInfos;
            v14->_knownClassInfos = (VMUClassInfoMap *)v86;

            v88 = v14->_knownClassInfos;
            if (v88)
            {
              v14->_classInfos = [(VMUClassInfoMap *)v88 _retainedLinearArrayWithReturnedCount:&v14->_classInfosCount];
              if (kVMUPrintArchivingTiming) {
                fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Class Layouts] Class info count: %d\n\n", [(VMUClassInfoMap *)v14->_knownClassInfos count]);
              }
              int v89 = 0;
LABEL_69:

              _Block_object_dispose(v121, 8);
              _Block_object_dispose(&v122, 8);

              if (v89) {
                goto LABEL_70;
              }
LABEL_71:
              objc_super v14 = v14;
              v110 = v14;
              goto LABEL_72;
            }
            if (v112)
            {
              v90 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v128 = *MEMORY[0x1E4F28568];
              v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
              id *v112 = [v90 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v91];
            }
            BOOL v92 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v92) {
              -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:].cold.4(v92, v93, v94, v95, v96, v97, v98, v99);
            }

            objc_super v14 = 0;
          }
        }
        else
        {
          if (v112)
          {
            v71 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v132 = *MEMORY[0x1E4F28568];
            v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1];
            id *v112 = [v71 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v72];
          }
          BOOL v73 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v73) {
            -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:](v73, v74, v75, v76, v77, v78, v79, v80);
          }
        }
      }
      else
      {
        if (v112)
        {
          v48 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v134 = *MEMORY[0x1E4F28568];
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v135 forKeys:&v134 count:1];
          id *v112 = [v48 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v49];
        }
        BOOL v50 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
        if (v50) {
          -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:](v50, v51, v52, v53, v54, v55, v56, v57);
        }
      }
    }
    else
    {
      if (v112)
      {
        v58 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v136 = *MEMORY[0x1E4F28568];
        v137[0] = @"Memgraph is corrupt due to malloc zone enumeration failure. The malloc heap of the target process was in an inconsistent state such as when being modified.";
        v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:&v136 count:1];
        id *v112 = [v58 errorWithDomain:@"com.apple.dt.Symbolication.VMUObjectGraph" code:1 userInfo:v59];
      }
      BOOL v60 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v60) {
        -[VMUObjectGraph initWithArchived:version:options:diskLogs:error:](v60, v61, v62, v63, v64, v65, v66, v67);
      }
    }
    int v89 = 1;
    goto LABEL_69;
  }
  NSLog(&cfstr_MemoryGraphHas.isa, "internalized node", internalizedCount);

LABEL_26:
  objc_super v14 = 0;
LABEL_70:
  v110 = 0;
LABEL_72:

  return v110;
}

void *__66__VMUObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke(void *result, unsigned int a2, unsigned char *a3)
{
  unint64_t v3 = *(void *)(*(void *)(result[4] + 128) + 16 * a2);
  uint64_t v4 = *(void *)(result[5] + 8);
  if (*(void *)(v4 + 24) > v3)
  {
    *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 0;
    *a3 = 1;
    uint64_t v4 = *(void *)(result[5] + 8);
  }
  *(void *)(v4 + 24) = v3;
  return result;
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)VMUObjectGraph;
  [(VMUDirectedGraph *)&v47 archiveDictionaryRepresentation:v6 options:a4];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [(VMUObjectGraph *)self internalizeNodes];
  BOOL v8 = [(VMUObjectGraph *)self _commonHighAddressBit];
  unsigned int v9 = [(VMUDirectedGraph *)self nodeNamespaceSize];
  unsigned int v10 = v9;
  if (v9)
  {
    objc_super v11 = malloc_type_malloc(16 * v9, 0x100004052888210uLL);
    unsigned int v12 = 0;
    uint64_t v13 = 0;
    unsigned int v14 = 0;
    int v15 = 0;
    internalizedNodes = self->_internalizedNodes;
    BOOL v17 = 0;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v8) {
      uint64_t v18 = -1;
    }
    do
    {
      unint64_t var0 = internalizedNodes[v15].var0;
      uint64_t v20 = var0 & v18;
      if (((var0 & v18 & 0x8000000000000000) != 0) != v17) {
        -[VMUObjectGraph archiveDictionaryRepresentation:options:]();
      }
      v21 = &internalizedNodes[v15];
      unint64_t v24 = *((void *)v21 + 1);
      uint64_t v22 = (uint64_t *)v21 + 1;
      unint64_t v23 = v24;
      unint64_t v25 = (v24 >> 5) & 0xFFFFFFFFFLL;
      uint64_t v26 = v24 & 0x20;
      if (v25) {
        BOOL v27 = v26 == 0;
      }
      else {
        BOOL v27 = 0;
      }
      if (v27)
      {
        unsigned int v28 = 0;
        unint64_t v29 = v25;
        do
        {
          ++v28;
          if (v29 < 2) {
            break;
          }
          char v30 = v29;
          v29 >>= 1;
        }
        while ((v30 & 2) == 0);
      }
      else
      {
        unsigned int v28 = 0;
      }
      unsigned int v31 = 0;
      unint64_t v32 = v20 - v13;
      if (v32 && (v32 & 1) == 0)
      {
        unsigned int v31 = 0;
        unint64_t v33 = v32;
        do
        {
          ++v31;
          if (v33 < 2) {
            break;
          }
          char v34 = v33;
          v33 >>= 1;
        }
        while ((v34 & 2) == 0);
      }
      if (v28 >= v31) {
        unsigned int v28 = v31;
      }
      if (v28 >= 0xF) {
        unsigned int v28 = 15;
      }
      if ((v23 & 7) == 1
        && (unint64_t v35 = v23 >> 41, v35 <= 0xFFF)
        && (unint64_t v36 = v32 >> v28, v36 <= 0x3FF)
        && (unint64_t v37 = v25 >> v28, v37 <= 0x1F))
      {
        v11[v12++] = ((v37 & 0x1F) << 14) | (16 * (v36 & 0x3FF)) | (v35 << 19) | v28;
        ++v14;
      }
      else
      {
        v11[v12] = HIDWORD(var0) | 0x80000000;
        v11[v12 + 1] = var0;
        uint64_t v38 = *v22;
        unsigned int v39 = v12 + 3;
        v11[v12 + 2] = HIDWORD(*v22);
        v12 += 4;
        v11[v39] = v38 & 0xFFFFFFE7;
      }
      ++v15;
      uint64_t v13 = v20;
      BOOL v17 = __OFSUB__(v15, v10);
    }
    while (v15 != v10);
  }
  else
  {
    objc_super v11 = 0;
    unsigned int v14 = 0;
    unsigned int v12 = 0;
  }
  v40 = +[VMUDirectedGraph _archivedBytes:v11 length:4 * v12 options:a4];
  [v7 setObject:v40 forKeyedSubscript:@"objectDetails"];

  if (v11) {
    free(v11);
  }
  v41 = (FILE **)MEMORY[0x1E4F143C8];
  if (kVMUPrintArchivingTiming) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Object Info] Compact: %d Large: %d (%2.2f%%)\n\n", v14, v10 - v14, (double)v14 * 100.0 / (double)v10);
  }
  if ([(VMUDirectedGraph *)self edgeNamespaceSize])
  {
    id v42 = +[VMUDirectedGraph _archivedBytes:self->_referenceTable length:4 * [(VMUDirectedGraph *)self edgeNamespaceSize] options:a4];
    [v7 setObject:v42 forKeyedSubscript:@"referenceDetails"];
  }
  if (kVMUPrintArchivingTiming) {
    fprintf(*v41, "[Reference Details] Total Compact and Large: %d\n\n", [(VMUDirectedGraph *)self edgeNamespaceSize]);
  }
  uint64_t referenceTableLargeCount = self->_referenceTableLargeCount;
  if (referenceTableLargeCount)
  {
    v44 = +[VMUDirectedGraph _archivedBytes:self->_referenceTableLarge length:16 * referenceTableLargeCount options:a4];
    [v7 setObject:v44 forKeyedSubscript:@"referenceDetailsLarge"];
  }
  if (kVMUPrintArchivingTiming) {
    fprintf(*v41, "[Reference Details Large] Compact: %d Large: %d (%2.2f%%)\n\n", [(VMUDirectedGraph *)self edgeNamespaceSize] - self->_referenceTableLargeCount, self->_referenceTableLargeCount, (double)([(VMUDirectedGraph *)self edgeNamespaceSize] - self->_referenceTableLargeCount)* 100.0/ (double)[(VMUDirectedGraph *)self edgeNamespaceSize]);
  }
  unsigned int v45 = +[VMUDirectedGraph _archivedObject:self->_knownClassInfos options:a4];
  [v7 setObject:v45 forKeyedSubscript:@"archivedClassInfos"];

  if (kVMUPrintArchivingTiming) {
    fprintf(*v41, "[Class Layouts] Class info count: %d\n\n", [(VMUClassInfoMap *)self->_knownClassInfos count]);
  }
  if (v8)
  {
    v46 = [NSNumber numberWithUnsignedLongLong:0x8000000000000000];
    [v7 setObject:v46 forKeyedSubscript:@"commonAddressBits"];
  }
  [v6 setObject:v7 forKeyedSubscript:@"objectGraphInfo"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VMUObjectGraph;
  id v4 = [(VMUDirectedGraph *)&v9 copyWithZone:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__VMUObjectGraph_copyWithZone___block_invoke;
  v8[3] = &unk_1E5D25C78;
  v8[4] = self;
  uint64_t v5 = MEMORY[0x1AD0DA230](v8);
  id v6 = (void *)*((void *)v4 + 21);
  *((void *)v4 + 21) = v5;

  objc_storeStrong((id *)v4 + 22, self);
  *((_DWORD *)v4 + 47) = [(VMUDirectedGraph *)self edgeNamespaceSize];
  *((_DWORD *)v4 + 46) = [(VMUDirectedGraph *)self nodeNamespaceSize];
  [(VMUObjectGraph *)self _modifyDerivativeGraphCount:1];
  return v4;
}

void *__31__VMUObjectGraph_copyWithZone___block_invoke@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result nodeDetails:a2];
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

- (void)setIndexedClassInfos:(id)a3
{
  p_knownClassInfos = &self->_knownClassInfos;
  objc_storeStrong((id *)&self->_knownClassInfos, a3);
  id v6 = a3;
  +[VMUClassInfoMap _destroyRetainedLinearArray:self->_classInfos withCount:self->_classInfosCount];
  v7 = [(VMUClassInfoMap *)*p_knownClassInfos _retainedLinearArrayWithReturnedCount:&self->_classInfosCount];

  self->_classInfos = v7;
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  return [(VMUClassInfoMap *)self->_knownClassInfos hasClassInfosDerivedFromStackBacktraces];
}

- (void)internalizeNodes
{
  if (self->_referenceGraphNodeNamespaceSize && (self->_nodeProvider || self->_referenceGraph))
  {
    if (!self->_knownClassInfos)
    {
      unint64_t v3 = (VMUClassInfoMap *)objc_opt_new();
      knownClassInfos = self->_knownClassInfos;
      self->_knownClassInfos = v3;
    }
    uint64_t v5 = (_VMUBlockNode *)malloc_type_calloc([(VMUDirectedGraph *)self nodeNamespaceSize], 0x10uLL, 0x1000040451B5BE8uLL);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __34__VMUObjectGraph_internalizeNodes__block_invoke;
    v28[3] = &unk_1E5D251D0;
    v28[4] = self;
    v28[5] = v5;
    [(VMUObjectGraph *)self enumerateObjectsWithBlock:v28];
    +[VMUClassInfoMap _destroyRetainedLinearArray:self->_classInfos withCount:self->_classInfosCount];
    self->_classInfos = [(VMUClassInfoMap *)self->_knownClassInfos _retainedLinearArrayWithReturnedCount:&self->_classInfosCount];
    internalizedNodes = self->_internalizedNodes;
    if (internalizedNodes) {
      free(internalizedNodes);
    }
    self->_internalizedNodes = v5;
    self->_unint64_t internalizedCount = [(VMUDirectedGraph *)self nodeNamespaceSize];
    if (self->_referenceGraphEdgeNamespaceSize)
    {
      v7 = (_VMUObjectGraphEdge *)malloc_type_calloc([(VMUDirectedGraph *)self edgeNamespaceSize], 4uLL, 0x100004052888210uLL);
      uint64_t v24 = 0;
      unint64_t v25 = &v24;
      uint64_t v26 = 0x2020000000;
      uint64_t v27 = 0;
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2020000000;
      int v23 = 0;
      uint64_t v16 = 0;
      BOOL v17 = &v16;
      uint64_t v18 = 0x2020000000;
      int v19 = 0;
      BOOL v8 = [(VMUDirectedGraph *)self inverted];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __34__VMUObjectGraph_internalizeNodes__block_invoke_2;
      v14[3] = &unk_1E5D25CA0;
      v14[4] = &v24;
      v14[5] = &v20;
      v14[6] = &v16;
      v14[7] = v7;
      BOOL v15 = v8;
      [(VMUObjectGraph *)self enumerateReferencesWithBlock:v14];
      referenceTable = self->_referenceTable;
      if (referenceTable) {
        free(referenceTable);
      }
      referenceTableLarge = self->_referenceTableLarge;
      if (referenceTableLarge) {
        free(referenceTableLarge);
      }
      self->_referenceTable = v7;
      self->_referenceTableLarge = (_VMUObjectGraphEdgeLarge *)v25[3];
      self->_uint64_t referenceTableLargeCount = *((_DWORD *)v21 + 6);
      self->_referenceTableLargeCapacity = *((_DWORD *)v17 + 6);
      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&v20, 8);
      _Block_object_dispose(&v24, 8);
    }
    referenceGraph = self->_referenceGraph;
    if (referenceGraph)
    {
      [(VMUObjectGraph *)referenceGraph _modifyDerivativeGraphCount:0xFFFFFFFFLL];
      unsigned int v12 = self->_referenceGraph;
      self->_referenceGraph = 0;
    }
    id nodeProvider = self->_nodeProvider;
    self->_id nodeProvider = 0;

    self->_referenceGraphEdgeNamespaceSize = 0;
    self->_referenceGraphNodeNamespaceSize = 0;
  }
}

uint64_t __34__VMUObjectGraph_internalizeNodes__block_invoke(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  unint64_t v3 = (void *)(*(void *)(a1 + 40) + 16 * a2);
  uint64_t v5 = *a3;
  unint64_t v4 = a3[1];
  uint64_t v6 = (v4 >> 60) & 7;
  unint64_t v7 = v4 & 0xFFFFFFFFFFFFFFFLL;
  if (v7 >= 0xFFFFFFFFFLL) {
    unint64_t v7 = 0xFFFFFFFFFLL;
  }
  uint64_t v8 = v6 | (32 * v7);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 152) indexForClassInfo:a3[2]];
  *unint64_t v3 = v5;
  v3[1] = v8 | (result << 41);
  return result;
}

void *__34__VMUObjectGraph_internalizeNodes__block_invoke_2(void *result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(result[4] + 8);
  uint64_t v7 = *(void *)(result[5] + 8);
  uint64_t v8 = result[7];
  uint64_t v9 = *(void *)(result[6] + 8);
  int v10 = *(_DWORD *)(a5 + 16);
  if (*((unsigned char *)result + 64)) {
    unint64_t v11 = *(void *)(a5 + 8);
  }
  else {
    unint64_t v11 = *(void *)(a5 + 24);
  }
  if (*((unsigned char *)result + 64)) {
    unint64_t v12 = *(void *)(a5 + 24);
  }
  else {
    unint64_t v12 = *(void *)(a5 + 8);
  }
  if ((v12 & 3) != 0)
  {
LABEL_12:
    unsigned int v16 = *(_DWORD *)(v7 + 24);
    unsigned int v17 = *(_DWORD *)(v9 + 24);
    uint64_t result = *(void **)(v6 + 24);
    if (v16 >= v17)
    {
      unsigned int v18 = 2 * v17;
      if (2 * v17 <= 0x100) {
        unsigned int v18 = 256;
      }
      *(_DWORD *)(v9 + 24) = v18;
      uint64_t result = malloc_type_realloc(result, 16 * v18, 0x1000040451B5BE8uLL);
      *(void *)(v6 + 24) = result;
      unsigned int v16 = *(_DWORD *)(v7 + 24);
    }
    int v19 = &result[2 * v16];
    unint64_t *v19 = v12 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v10 << 56);
    v19[1] = v11 & 0xFFFFFFFFFFFFFFLL;
    *(_DWORD *)(v8 + 4 * a2) = (*(_DWORD *)(v7 + 24))++ | 0x80000000;
  }
  else
  {
    uint64_t v13 = 0;
    int v14 = -67108864 * (*(_DWORD *)(a5 + 16) & 0x1F);
    while (1)
    {
      int v15 = offset_settings[v13];
      if (v12 < 1 << (26 - v15) && v11 < 1 << v15) {
        break;
      }
      ++v13;
      v14 -= 0x1000000;
      if (v13 == 4) {
        goto LABEL_12;
      }
    }
    *(_DWORD *)(v8 + 4 * a2) = (((v12 << (v15 - 2)) | v11) & 0xFFFFFF) - v14;
  }
  return result;
}

- (BOOL)_commonHighAddressBit
{
  v2 = self;
  uint64_t internalizedCount = self->_internalizedCount;
  LOBYTE(self) = 1;
  if (internalizedCount)
  {
    unint64_t v4 = (_DWORD *)v2->_internalizedNodes + 2;
    unint64_t v5 = -1;
    uint64_t v6 = internalizedCount;
    do
    {
      unsigned int v7 = *v4 & 7;
      BOOL v8 = v7 > 4;
      int v9 = (1 << v7) & 0x19;
      BOOL v10 = v8 || v9 == 0;
      if (v10 && v5 >= *((void *)v4 - 1)) {
        unint64_t v5 = *((void *)v4 - 1);
      }
      v4 += 4;
      --v6;
    }
    while (v6);
    if ((v5 & 0x8000000000000000) != 0)
    {
      internalizedNodes = v2->_internalizedNodes;
      do
      {
        internalizedNodes->var0 &= ~0x8000000000000000;
        ++internalizedNodes;
        --internalizedCount;
      }
      while (internalizedCount);
      LOBYTE(self) = 1;
    }
    else
    {
      return v5 >> 63;
    }
  }
  return (char)self;
}

- (void)setClassInfoIndex:(unsigned int)a3 forNode:(unsigned int)a4
{
  unint64_t v4 = &self->_internalizedNodes[a4];
  *((void *)v4 + 1) = *((void *)v4 + 1) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 sourceOffset:(unint64_t)a4 withScanType:(unsigned int)a5 toNode:(unsigned int)a6 destinationOffset:(unint64_t)a7
{
  unsigned __int8 v8 = a5;
  v33.receiver = self;
  v33.super_class = (Class)VMUObjectGraph;
  unsigned int v11 = [(VMUDirectedGraph *)&v33 addEdgeFromNode:*(void *)&a3 toNode:*(void *)&a6];
  unsigned int v12 = v11;
  if (v11 != -1)
  {
    unsigned int referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
    uint64_t referenceTableCapacity = self->_referenceTableCapacity;
    unsigned __int8 v32 = v8;
    if (v11 >= referenceTableCapacity)
    {
      LODWORD(v15) = 2 * referenceTableCapacity;
      if ((2 * referenceTableCapacity) <= 0x100) {
        unint64_t v15 = 256;
      }
      else {
        unint64_t v15 = v15;
      }
      unint64_t v16 = referenceTableCapacity + 0x80000;
      if (v16 >= v15) {
        unint64_t v17 = v15;
      }
      else {
        unint64_t v17 = v16;
      }
      unsigned int v18 = (_VMUObjectGraphEdge *)malloc_type_realloc(self->_referenceTable, 4 * v17, 0x100004052888210uLL);
      self->_referenceTable = v18;
      bzero(&v18[self->_referenceTableCapacity], 4 * (v17 - self->_referenceTableCapacity));
      self->_uint64_t referenceTableCapacity = v17;
    }
    unsigned int v19 = v12 - referenceGraphEdgeNamespaceSize;
    referenceTable = self->_referenceTable;
    BOOL v21 = [(VMUDirectedGraph *)self inverted];
    if (v21) {
      unint64_t v22 = a4;
    }
    else {
      unint64_t v22 = a7;
    }
    if (!v21) {
      a7 = a4;
    }
    if ((a7 & 3) != 0)
    {
LABEL_20:
      unsigned int referenceTableLargeCount = self->_referenceTableLargeCount;
      unsigned int referenceTableLargeCapacity = self->_referenceTableLargeCapacity;
      referenceTableLarge = self->_referenceTableLarge;
      if (referenceTableLargeCount >= referenceTableLargeCapacity)
      {
        unsigned int v29 = 2 * referenceTableLargeCapacity;
        if (2 * referenceTableLargeCapacity <= 0x100) {
          unsigned int v29 = 256;
        }
        self->_unsigned int referenceTableLargeCapacity = v29;
        referenceTableLarge = (_VMUObjectGraphEdgeLarge *)malloc_type_realloc(referenceTableLarge, 16 * v29, 0x1000040451B5BE8uLL);
        self->_referenceTableLarge = referenceTableLarge;
        unsigned int referenceTableLargeCount = self->_referenceTableLargeCount;
      }
      char v30 = (unint64_t *)((char *)referenceTableLarge + 16 * referenceTableLargeCount);
      *char v30 = a7 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)v32 << 56);
      v30[1] = v22 & 0xFFFFFFFFFFFFFFLL;
      referenceTable[v19].var0.unint64_t var0 = ($8D6A3E73ED2192107EDB56A8580BF2AB)(self->_referenceTableLargeCount++ | 0x80000000);
    }
    else
    {
      uint64_t v23 = 0;
      int v24 = -67108864 * (v32 & 0x1F);
      while (1)
      {
        int v25 = offset_settings[v23];
        if (a7 < 1 << (26 - v25) && v22 < 1 << v25) {
          break;
        }
        ++v23;
        v24 -= 0x1000000;
        if (v23 == 4) {
          goto LABEL_20;
        }
      }
      referenceTable[v19].var0.unint64_t var0 = ($8D6A3E73ED2192107EDB56A8580BF2AB)((((a7 << (v25 - 2)) | v22) & 0xFFFFFF)
                                                                        - v24);
    }
  }
  return v12;
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4
{
  return [(VMUObjectGraph *)self addEdgeFromNode:*(void *)&a3 sourceOffset:0 withScanType:0 toNode:*(void *)&a4 destinationOffset:0];
}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  [(VMUObjectGraph *)self internalizeNodes];
  if (a3)
  {
    unsigned int v11 = (_VMUBlockNode *)malloc_type_malloc(16 * v8, 0x1000040451B5BE8uLL);
    unsigned int v12 = [(VMUDirectedGraph *)self nodeNamespaceSize];
    if (v12)
    {
      uint64_t v13 = 0;
      int v14 = a3;
      do
      {
        unsigned int v16 = *v14++;
        uint64_t v15 = v16;
        if (v16 != -1) {
          v11[v15] = self->_internalizedNodes[v13];
        }
        ++v13;
      }
      while (v12 != v13);
    }
    internalizedNodes = self->_internalizedNodes;
    if (internalizedNodes) {
      free(internalizedNodes);
    }
    self->_internalizedNodes = v11;
  }
  if (a5)
  {
    self->_uint64_t referenceTableCapacity = v6;
    unsigned int v18 = (_VMUObjectGraphEdge *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
    unsigned int v19 = [(VMUDirectedGraph *)self edgeNamespaceSize];
    if (v19)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        uint64_t v21 = a5[i];
        if (v21 != -1) {
          v18[v21] = self->_referenceTable[i];
        }
      }
    }
    referenceTable = self->_referenceTable;
    if (referenceTable) {
      free(referenceTable);
    }
    self->_referenceTable = v18;
  }
  v23.receiver = self;
  v23.super_class = (Class)VMUObjectGraph;
  [(VMUDirectedGraph *)&v23 _renameWithNodeMap:a3 nodeNamespace:v8 edgeMap:a5 edgeNamespace:v6];
}

- (unsigned)scanTypeOfReferenceWithName:(unsigned int)a3
{
  $8D6A3E73ED2192107EDB56A8580BF2AB var0 = self->_referenceTable[a3].var0.var0;
  if ((*(_DWORD *)&var0 & 0x80000000) != 0) {
    return *((unsigned __int8 *)self->_referenceTableLarge + 16 * (*(unsigned int *)&var0 & 0x7FFFFFFF) + 7);
  }
  else {
    return *(unsigned int *)&var0 >> 26;
  }
}

- (unsigned)nodeForAddress:(unint64_t)a3
{
  unsigned int v5 = [(VMUDirectedGraph *)self nodeNamespaceSize] + 1;
  do
  {
    [(VMUObjectGraph *)self nodeDetails:v5 - 2];
    --v5;
  }
  while (!v10);
  if (!v5) {
    return -1;
  }
  unsigned int v6 = 0;
  while (1)
  {
    unsigned int v7 = v6 + (v5 >> 1);
    [(VMUObjectGraph *)self nodeDetails:v7];
    if (v9 == a3) {
      break;
    }
    if (v9 > a3)
    {
      v5 >>= 1;
    }
    else
    {
      unsigned int v6 = v7 + 1;
      v5 += ~(v5 >> 1);
    }
    if (!v5) {
      return -1;
    }
  }
  return v7;
}

- (unsigned)enumerateObjectsWithBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__VMUObjectGraph_enumerateObjectsWithBlock___block_invoke;
    v9[3] = &unk_1E5D25CC8;
    v9[4] = self;
    id v10 = v4;
    v8.receiver = self;
    v8.super_class = (Class)VMUObjectGraph;
    unsigned int v6 = [(VMUDirectedGraph *)&v8 enumerateNodesWithBlock:v9];
  }
  else
  {
    unsigned int v6 = [(VMUDirectedGraph *)self nodeCount];
  }

  return v6;
}

uint64_t __44__VMUObjectGraph_enumerateObjectsWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  unsigned int v7 = *(_DWORD *)(v5 + 184);
  uint64_t v8 = *(void *)(v5 + 128);
  unsigned int v9 = *(_DWORD *)(v5 + 136);
  uint64_t v10 = *(void *)(v5 + 144);
  id v11 = *(id *)(v5 + 168);
  unsigned int v12 = v11;
  unsigned int v13 = a2 - v7;
  if (a2 >= v7 || v11 == 0)
  {
    if (v13 >= v9)
    {
      uint64_t v20 = 0;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v15 = (uint64_t *)(v8 + 16 * v13);
      uint64_t v17 = *v15;
      unint64_t v16 = v15[1];
      uint64_t v20 = v17;
      uint64_t v21 = ((v16 >> 5) | (v16 << 60)) & 0x7000000FFFFFFFFFLL;
      if ((v16 & 7) == 1) {
        uint64_t v18 = *(void *)(v10 + ((v16 >> 38) & 0x3FFFFF8));
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v22 = v18;
    }
  }
  else
  {
    (*((void (**)(uint64_t *__return_ptr, id, uint64_t))v11 + 2))(&v20, v11, a2);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t))(v6 + 16))(v6, a2, &v20, a3);
}

- (unsigned)enumerateObjectsOfGroupNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    unsigned int v9 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__VMUObjectGraph_enumerateObjectsOfGroupNode_withBlock___block_invoke;
    v15[3] = &unk_1E5D25CC8;
    id v4 = &v16;
    id v10 = v7;
    v15[4] = self;
    id v16 = v10;
  }
  else
  {
    unsigned int v9 = 0;
  }
  id v11 = (void *)MEMORY[0x1AD0DA230](v9);
  v14.receiver = self;
  v14.super_class = (Class)VMUObjectGraph;
  unsigned int v12 = [(VMUDirectedGraph *)&v14 enumerateMembersOfGroupNode:v5 withBlock:v11];

  if (v8) {
  return v12;
  }
}

uint64_t __56__VMUObjectGraph_enumerateObjectsOfGroupNode_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a1 + 32;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(v7 + 8);
  if (v5) {
    [v5 nodeDetails:a2];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t))(v6 + 16))(v6, a2, v9, a3);
}

- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, unint64_t *, unsigned __int8 *))a4;
  if (a3
    && (unsigned int v7 = [(VMUDirectedGraph *)self nodeNamespaceSize],
        unsigned __int8 v31 = 0,
        v30.receiver = self,
        v30.super_class = (Class)VMUObjectGraph,
        uint64_t v8 = [(VMUDirectedGraph *)&v30 deadNodeMap],
        v7))
  {
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    uint64_t v26 = v8;
    do
    {
      if (*(_DWORD *)a3 <= v9
        || (uint64_t v11 = (v9 >> 3) + 4, v12 = 1 << (v9 & 7), (v12 & *((unsigned char *)a3 + v11)) == 0)
        || v8 && *v8 > v9 && (v12 & *((unsigned char *)v8 + v11)) != 0
        || (++v10, !v6))
      {
        int v23 = 0;
      }
      else
      {
        unsigned int referenceGraphNodeNamespaceSize = self->_referenceGraphNodeNamespaceSize;
        internalizedNodes = self->_internalizedNodes;
        unsigned int internalizedCount = self->_internalizedCount;
        classInfos = self->_classInfos;
        id v16 = self->_nodeProvider;
        uint64_t v17 = v16;
        unsigned int v18 = v9 - referenceGraphNodeNamespaceSize;
        if (v9 >= referenceGraphNodeNamespaceSize || v16 == 0)
        {
          if (v18 >= internalizedCount)
          {
            unint64_t var0 = 0;
            uint64_t v28 = 0;
            uint64_t v29 = 0;
          }
          else
          {
            uint64_t v20 = &internalizedNodes[v18];
            unint64_t var0 = v20->var0;
            unint64_t v21 = *((void *)v20 + 1);
            uint64_t v28 = ((v21 >> 5) | (v21 << 60)) & 0x7000000FFFFFFFFFLL;
            if ((v21 & 7) == 1) {
              uint64_t v22 = *(uint64_t *)((char *)classInfos + ((v21 >> 38) & 0x3FFFFF8));
            }
            else {
              uint64_t v22 = 0;
            }
            uint64_t v29 = v22;
          }
        }
        else
        {
          (*((void (**)(unint64_t *__return_ptr, id, uint64_t))v16 + 2))(&var0, v16, v9);
        }

        v6[2](v6, v9, &var0, &v31);
        int v23 = v31;
        uint64_t v8 = v26;
      }
      uint64_t v9 = (v9 + 1);
    }
    while (v9 < v7 && !v23);
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

- (unsigned)enumerateReferencesWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(VMUDirectedGraph *)self inverted];
    unsigned int v6 = [(VMUDirectedGraph *)self nodeNamespaceSize];
    unsigned int v7 = malloc_type_malloc(24 * v6, 0x108004098BBCF0FuLL);
    uint64_t v8 = malloc_type_calloc(1uLL, ((v6 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    _DWORD *v8 = v6;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__VMUObjectGraph_enumerateReferencesWithBlock___block_invoke;
    v12[3] = &unk_1E5D25CF0;
    objc_super v14 = v7;
    uint64_t v15 = v8;
    v12[4] = self;
    id v13 = v4;
    BOOL v16 = v5;
    v11.receiver = self;
    v11.super_class = (Class)VMUObjectGraph;
    unsigned int v9 = [(VMUDirectedGraph *)&v11 enumerateEdgesWithBlock:v12];
    free(v7);
    free(v8);
  }
  else
  {
    unsigned int v9 = [(VMUDirectedGraph *)self edgeCount];
  }

  return v9;
}

uint64_t __47__VMUObjectGraph_enumerateReferencesWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(void *)(a1 + 48);
  unsigned int v9 = *(unsigned int **)(a1 + 56);
  uint64_t v11 = v10 + 24 * a3;
  if (!v9)
  {
    uint64_t v17 = v10 + 24 * a4;
    goto LABEL_37;
  }
  unint64_t v12 = 0x1E973A000uLL;
  unint64_t v13 = 0x1E973A000uLL;
  unint64_t v14 = 0x1E973A000uLL;
  unint64_t v15 = 0x1E973A000uLL;
  unint64_t v16 = 0x1E973A000uLL;
  if (*v9 > a3 && ((*((unsigned __int8 *)v9 + (a3 >> 3) + 4) >> (a3 & 7)) & 1) != 0)
  {
    uint64_t v17 = v10 + 24 * a4;
  }
  else
  {
    uint64_t v18 = *(void *)(a1 + 32);
    unsigned int v19 = *(_DWORD *)(v18 + 184);
    uint64_t v20 = *(void *)(v18 + 128);
    unsigned int v21 = *(_DWORD *)(v18 + 136);
    uint64_t v22 = *(void *)(v18 + 144);
    id v23 = *(id *)(v18 + 168);
    int v24 = v23;
    unsigned int v25 = a3 - v19;
    if (a3 >= v19 || v23 == 0)
    {
      if (v25 >= v21)
      {
        long long v70 = 0uLL;
        *(void *)&long long v71 = 0;
      }
      else
      {
        uint64_t v27 = (void *)(v20 + 16 * v25);
        *(void *)&long long v70 = *v27;
        unint64_t v28 = v27[1];
        *((void *)&v70 + 1) = ((v28 >> 5) | (v28 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v28 & 7) == 1) {
          uint64_t v29 = *(void *)(v22 + ((v28 >> 38) & 0x3FFFFF8));
        }
        else {
          uint64_t v29 = 0;
        }
        *(void *)&long long v71 = v29;
      }
    }
    else
    {
      (*((void (**)(long long *__return_ptr, id, uint64_t))v23 + 2))(&v70, v23, a3);
    }

    long long v30 = v70;
    *(void *)(v11 + 16) = v71;
    *(_OWORD *)uint64_t v11 = v30;
    unsigned int v9 = *(unsigned int **)(a1 + 56);
    unsigned int v31 = *v9;
    if (*v9 <= a3)
    {
      uint64_t v17 = *(void *)(a1 + 48) + 24 * a4;
      unint64_t v16 = 0x1E973A000uLL;
      unint64_t v15 = 0x1E973A000uLL;
      unint64_t v14 = 0x1E973A000uLL;
      unint64_t v13 = 0x1E973A000uLL;
      unint64_t v12 = 0x1E973A000uLL;
      goto LABEL_21;
    }
    *((unsigned char *)v9 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
    unsigned int v9 = *(unsigned int **)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 48) + 24 * a4;
    unint64_t v16 = 0x1E973A000;
    unint64_t v15 = 0x1E973A000;
    unint64_t v14 = 0x1E973A000;
    unint64_t v13 = 0x1E973A000;
    unint64_t v12 = 0x1E973A000;
    if (!v9) {
      goto LABEL_37;
    }
  }
  unsigned int v31 = *v9;
LABEL_21:
  if (v31 > a4 && ((*((unsigned __int8 *)v9 + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0) {
    goto LABEL_37;
  }
  uint64_t v68 = v11;
  uint64_t v32 = a2;
  uint64_t v33 = *(void *)(a1 + 32);
  unsigned int v34 = *(_DWORD *)(v33 + *(int *)(v12 + 3136));
  uint64_t v35 = *(void *)(v33 + *(int *)(v14 + 3144));
  unsigned int v36 = *(_DWORD *)(v33 + *(int *)(v15 + 3148));
  uint64_t v37 = *(void *)(v33 + *(int *)(v16 + 3164));
  id v38 = *(id *)(v33 + *(int *)(v13 + 3132));
  unsigned int v39 = v38;
  unsigned int v40 = a4 - v34;
  if (a4 < v34 && v38 != 0)
  {
    (*((void (**)(long long *__return_ptr, id, uint64_t))v38 + 2))(&v70, v38, a4);
LABEL_32:
    a2 = v32;
    uint64_t v11 = v68;
    goto LABEL_35;
  }
  if (v40 >= v36)
  {
    long long v70 = 0uLL;
    *(void *)&long long v71 = 0;
    goto LABEL_32;
  }
  uint64_t v42 = v37;
  v43 = (void *)(v35 + 16 * v40);
  *(void *)&long long v70 = *v43;
  unint64_t v44 = v43[1];
  *((void *)&v70 + 1) = ((v44 >> 5) | (v44 << 60)) & 0x7000000FFFFFFFFFLL;
  a2 = v32;
  uint64_t v11 = v68;
  if ((v44 & 7) == 1) {
    uint64_t v45 = *(void *)(v42 + ((v44 >> 38) & 0x3FFFFF8));
  }
  else {
    uint64_t v45 = 0;
  }
  *(void *)&long long v71 = v45;
LABEL_35:

  long long v46 = v70;
  *(void *)(v17 + 16) = v71;
  *(_OWORD *)uint64_t v17 = v46;
  objc_super v47 = *(_DWORD **)(a1 + 56);
  if (*v47 > a4) {
    *((unsigned char *)v47 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
  }
LABEL_37:
  *(void *)&long long v73 = v11;
  uint64_t v48 = *(void *)(a1 + 32);
  uint64_t v49 = *(void *)(a1 + 40);
  unsigned int v50 = *(_DWORD *)(v48 + 188);
  uint64_t v51 = *(void *)(v48 + 96);
  uint64_t v52 = *(void *)(v48 + 112);
  int v53 = *(unsigned __int8 *)(a1 + 64);
  id v54 = *(id *)(v48 + 176);
  uint64_t v55 = v54;
  if (a2 >= v50)
  {
    unint64_t v56 = *(unsigned int *)(v51 + 4 * (a2 - v50));
    if ((v56 & 0x80000000) != 0)
    {
      uint64_t v64 = (unint64_t *)(v52 + 16 * (v56 & 0x7FFFFFFF));
      unint64_t v62 = *v64;
      unint64_t v63 = v64[1];
      if (v53) {
        unint64_t v65 = v63;
      }
      else {
        unint64_t v65 = v62;
      }
      if (v53) {
        unint64_t v63 = v62;
      }
      *((void *)&v73 + 1) = v65 & 0xFFFFFFFFFFFFFFLL;
      LODWORD(v74) = HIBYTE(v62);
      uint64_t v61 = v63 & 0xFFFFFFFFFFFFFFLL;
    }
    else
    {
      char v57 = offset_settings[(v56 >> 24) & 3];
      unsigned int v58 = 4 * ((v56 & 0xFFFFFF) >> v57);
      unsigned int v59 = v56 & 0xFFFFFF & ~(-1 << v57);
      if (v53) {
        uint64_t v60 = v59;
      }
      else {
        uint64_t v60 = v58;
      }
      *((void *)&v73 + 1) = v60;
      LODWORD(v74) = v56 >> 26;
      if (v53) {
        uint64_t v61 = v58;
      }
      else {
        uint64_t v61 = v59;
      }
    }
    *((void *)&v74 + 1) = v61;
  }
  else if (v54)
  {
    [v54 referenceInfoWithName:a2];
  }
  else
  {
    *((void *)&v73 + 1) = 0;
    long long v74 = 0uLL;
  }

  uint64_t v75 = v17;
  uint64_t v66 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, long long *, uint64_t))(v49 + 16);
  long long v70 = v73;
  long long v71 = v74;
  uint64_t v72 = v17;
  return v66(v49, a2, a3, a4, &v70, a5);
}

- (unsigned)enumerateReferencesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6 && [(VMUDirectedGraph *)self nodeNamespaceSize] > v4)
  {
    BOOL v7 = [(VMUDirectedGraph *)self inverted];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__VMUObjectGraph_enumerateReferencesOfNode_withBlock___block_invoke;
    v11[3] = &unk_1E5D25D18;
    v11[4] = self;
    id v12 = v6;
    BOOL v13 = v7;
    v10.receiver = self;
    v10.super_class = (Class)VMUObjectGraph;
    unsigned int v8 = [(VMUDirectedGraph *)&v10 _internalEnumerateEdgesOfNode:v4 withBlock:v11];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

uint64_t __54__VMUObjectGraph_enumerateReferencesOfNode_withBlock___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, uint64_t a7)
{
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  uint64_t v9 = *(void *)(a1 + 32);
  unsigned int v10 = *(_DWORD *)(v9 + 184);
  uint64_t v11 = *(void *)(v9 + 128);
  unsigned int v12 = *(_DWORD *)(v9 + 136);
  uint64_t v13 = *(void *)(v9 + 144);
  id v14 = *(id *)(v9 + 168);
  unint64_t v15 = v14;
  unsigned int v16 = a3 - v10;
  if (a3 >= v10 || v14 == 0)
  {
    if (v16 < v12)
    {
      uint64_t v18 = (uint64_t *)(v11 + 16 * v16);
      uint64_t v66 = *v18;
      unint64_t v19 = v18[1];
      uint64_t v67 = ((v19 >> 5) | (v19 << 60)) & 0x7000000FFFFFFFFFLL;
      uint64_t v20 = a2;
      if ((v19 & 7) == 1) {
        uint64_t v21 = *(void *)(v13 + ((v19 >> 38) & 0x3FFFFF8));
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v68 = v21;
      goto LABEL_13;
    }
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    uint64_t v68 = 0;
  }
  else
  {
    (*((void (**)(uint64_t *__return_ptr, id, uint64_t))v14 + 2))(&v66, v14, a3);
  }
  uint64_t v20 = a2;
LABEL_13:

  uint64_t v63 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  uint64_t v22 = *(void *)(a1 + 32);
  unsigned int v23 = *(_DWORD *)(v22 + 184);
  uint64_t v24 = *(void *)(v22 + 128);
  unsigned int v25 = *(_DWORD *)(v22 + 136);
  uint64_t v26 = *(void *)(v22 + 144);
  id v27 = *(id *)(v22 + 168);
  unint64_t v28 = v27;
  unsigned int v29 = a4 - v23;
  if (a4 < v23 && v27)
  {
    (*((void (**)(uint64_t *__return_ptr, id))v27 + 2))(&v63, v27);
  }
  else if (v29 >= v25)
  {
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v65 = 0;
  }
  else
  {
    long long v30 = (uint64_t *)(v24 + 16 * v29);
    uint64_t v63 = *v30;
    unint64_t v31 = v30[1];
    uint64_t v64 = ((v31 >> 5) | (v31 << 60)) & 0x7000000FFFFFFFFFLL;
    if ((v31 & 7) == 1) {
      uint64_t v32 = *(void *)(v26 + ((v31 >> 38) & 0x3FFFFF8));
    }
    else {
      uint64_t v32 = 0;
    }
    uint64_t v65 = v32;
  }

  *(void *)&long long v60 = &v66;
  uint64_t v33 = *(void *)(a1 + 32);
  uint64_t v34 = *(void *)(a1 + 40);
  unsigned int v35 = *(_DWORD *)(v33 + 188);
  uint64_t v36 = *(void *)(v33 + 96);
  uint64_t v37 = *(void *)(v33 + 112);
  int v38 = *(unsigned __int8 *)(a1 + 48);
  id v39 = *(id *)(v33 + 176);
  unsigned int v40 = v39;
  if (v20 >= v35)
  {
    unint64_t v41 = *(unsigned int *)(v36 + 4 * (v20 - v35));
    if ((v41 & 0x80000000) != 0)
    {
      uint64_t v49 = (unint64_t *)(v37 + 16 * (v41 & 0x7FFFFFFF));
      unint64_t v47 = *v49;
      unint64_t v48 = v49[1];
      if (v38) {
        unint64_t v50 = v48;
      }
      else {
        unint64_t v50 = v47;
      }
      if (v38) {
        unint64_t v48 = v47;
      }
      *((void *)&v60 + 1) = v50 & 0xFFFFFFFFFFFFFFLL;
      LODWORD(v61) = HIBYTE(v47);
      uint64_t v46 = v48 & 0xFFFFFFFFFFFFFFLL;
    }
    else
    {
      char v42 = offset_settings[(v41 >> 24) & 3];
      unsigned int v43 = 4 * ((v41 & 0xFFFFFF) >> v42);
      unsigned int v44 = v41 & 0xFFFFFF & ~(-1 << v42);
      if (v38) {
        uint64_t v45 = v44;
      }
      else {
        uint64_t v45 = v43;
      }
      *((void *)&v60 + 1) = v45;
      LODWORD(v61) = v41 >> 26;
      if (v38) {
        uint64_t v46 = v43;
      }
      else {
        uint64_t v46 = v44;
      }
    }
    *((void *)&v61 + 1) = v46;
  }
  else if (v39)
  {
    [v39 referenceInfoWithName:v20];
  }
  else
  {
    *((void *)&v60 + 1) = 0;
    long long v61 = 0uLL;
  }

  unint64_t v62 = &v63;
  uint64_t v51 = *(uint64_t (**)(uint64_t, uint64_t, void, void, _OWORD *, uint64_t))(v34 + 16);
  v58[0] = v60;
  v58[1] = v61;
  unsigned int v59 = &v63;
  return v51(v34, v20, a5, a6, v58, a7);
}

- (unsigned)nodeReferencedFromSourceNode:(unsigned int)a3 byIvarWithName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = -1;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v15 = 0;
  [(VMUObjectGraph *)self nodeDetails:v4];
  BOOL v7 = [v15 firstFieldWithName:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__VMUObjectGraph_nodeReferencedFromSourceNode_byIvarWithName___block_invoke;
  v10[3] = &unk_1E5D25D40;
  id v8 = v7;
  id v11 = v8;
  unsigned int v12 = &v16;
  [(VMUObjectGraph *)self enumerateReferencesOfNode:v4 withBlock:v10];
  LODWORD(v4) = *((_DWORD *)v17 + 6);

  _Block_object_dispose(&v16, 8);
  return v4;
}

uint64_t __62__VMUObjectGraph_nodeReferencedFromSourceNode_byIvarWithName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v10 = *(void *)(a5 + 8);
  uint64_t result = [*(id *)(a1 + 32) offset];
  if (v10 == result && !*(void *)(a5 + 24))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a4;
    *a6 = 1;
  }
  return result;
}

- (unsigned)enumerateObjectsContainedInCollection:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v22 = 0;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = -1;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke;
  v14[3] = &unk_1E5D25D68;
  uint64_t v16 = &v18;
  id v7 = v6;
  id v15 = v7;
  uint64_t v17 = &v22;
  [(VMUObjectGraph *)self enumerateReferencesOfNode:v4 withBlock:v14];
  uint64_t v8 = *((unsigned int *)v19 + 6);
  if (v8 != -1)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke_2;
    v11[3] = &unk_1E5D25D90;
    id v12 = v7;
    uint64_t v13 = &v22;
    [(VMUObjectGraph *)self enumerateReferencesOfNode:v8 withBlock:v11];
  }
  unsigned int v9 = *((_DWORD *)v23 + 6);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a5 + 24)
    || ([*(id *)(*(void *)(a5 + 32) + 16) className],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 hasSuffix:@"Storage"]),
        v10,
        !v11))
  {
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v12 + 16);
    long long v14 = *(_OWORD *)(a5 + 16);
    v15[0] = *(_OWORD *)a5;
    v15[1] = v14;
    uint64_t v16 = *(void *)(a5 + 32);
    v13(v12, a2, a3, a4, v15);
    ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a4;
  }
}

uint64_t __66__VMUObjectGraph_enumerateObjectsContainedInCollection_withBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v6 + 16);
  long long v8 = *(_OWORD *)(a5 + 16);
  v10[0] = *(_OWORD *)a5;
  v10[1] = v8;
  uint64_t v11 = *(void *)(a5 + 32);
  uint64_t result = v7(v6, a2, a3, a4, v10);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUObjectGraph *)self
{
  uint64_t v3 = v1;
  BOOL v5 = v2;
  unsigned int referenceGraphNodeNamespaceSize = self->_referenceGraphNodeNamespaceSize;
  v7.unint64_t var0 = [(VMUDirectedGraph *)self nodeNamespaceSize];
  if (LODWORD(v7.var0) < v3
    || ((unsigned int v8 = v3 - referenceGraphNodeNamespaceSize,
         unsigned int v9 = self->_referenceGraphNodeNamespaceSize,
         unsigned int internalizedCount = self->_internalizedCount,
         v3 >= v9)
      ? (BOOL v11 = v8 >= internalizedCount)
      : (BOOL v11 = 0),
        v11))
  {
    *BOOL v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
  }
  else
  {
    id nodeProvider = self->_nodeProvider;
    internalizedNodes = self->_internalizedNodes;
    classInfos = self->_classInfos;
    id v15 = (void (**)(id, void))nodeProvider;
    unsigned int v16 = v3 - v9;
    if (v3 >= v9 || v15 == 0)
    {
      if (v16 >= internalizedCount)
      {
        *BOOL v5 = 0;
        v5[1] = 0;
        v5[2] = 0;
      }
      else
      {
        uint64_t v18 = &internalizedNodes[v16];
        unint64_t var0 = v18->var0;
        unint64_t v19 = *((void *)v18 + 1);
        *BOOL v5 = var0;
        v5[1] = ((v19 >> 5) | (v19 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v19 & 7) == 1) {
          unint64_t v21 = *(unint64_t *)((char *)classInfos + ((v19 >> 38) & 0x3FFFFF8));
        }
        else {
          unint64_t v21 = 0;
        }
        v5[2] = v21;
      }
    }
    else
    {
      uint64_t v22 = v15;
      v15[2](v15, v3);
      id v15 = v22;
    }
  }
  return v7;
}

- ($3576753C8488139535C1C7A74D12E914)referenceInfoWithName:(SEL)a3
{
  uint64_t v4 = *(void *)&a4;
  uint64_t result = ($3576753C8488139535C1C7A74D12E914 *)[(VMUDirectedGraph *)self edgeNamespaceSize];
  if (result >= v4)
  {
    unsigned int referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
    referenceGraph = self->_referenceGraph;
    referenceTable = self->_referenceTable;
    referenceTableLarge = self->_referenceTableLarge;
    BOOL v12 = [(VMUDirectedGraph *)self inverted];
    uint64_t v13 = referenceGraph;
    if (v4 >= referenceGraphEdgeNamespaceSize)
    {
      unint64_t var0 = referenceTable[v4 - referenceGraphEdgeNamespaceSize].var0.var0;
      if ((var0 & 0x80000000) != 0)
      {
        uint64_t v20 = (unint64_t *)((char *)referenceTableLarge + 16 * (var0 & 0x7FFFFFFF));
        unint64_t v22 = *v20;
        unint64_t v21 = v20[1];
        if (v12) {
          unint64_t v23 = v21;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v12) {
          unint64_t v21 = v22;
        }
        retstr->unint64_t var0 = v23 & 0xFFFFFFFFFFFFFFLL;
        retstr->var1 = HIBYTE(v22);
        unint64_t v19 = v21 & 0xFFFFFFFFFFFFFFLL;
      }
      else
      {
        char v15 = offset_settings[(var0 >> 24) & 3];
        unsigned int v16 = 4 * ((var0 & 0xFFFFFF) >> v15);
        unsigned int v17 = var0 & 0xFFFFFF & ~(-1 << v15);
        if (v12) {
          unint64_t v18 = v17;
        }
        else {
          unint64_t v18 = v16;
        }
        retstr->unint64_t var0 = v18;
        retstr->var1 = var0 >> 26;
        if (v12) {
          unint64_t v19 = v16;
        }
        else {
          unint64_t v19 = v17;
        }
      }
      retstr->var2 = v19;
    }
    else if (v13)
    {
      uint64_t v24 = v13;
      [(VMUObjectGraph *)v13 referenceInfoWithName:v4];
      uint64_t v13 = v24;
    }
    else
    {
      retstr->unint64_t var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var2 = 0;
    }
  }
  else
  {
    retstr->unint64_t var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- ($3576753C8488139535C1C7A74D12E914)_rawReferenceInfoWithName:(SEL)a3
{
  uint64_t v4 = *(void *)&a4;
  uint64_t result = ($3576753C8488139535C1C7A74D12E914 *)[(VMUDirectedGraph *)self edgeNamespaceSize];
  if (result >= v4)
  {
    unsigned int referenceGraphEdgeNamespaceSize = self->_referenceGraphEdgeNamespaceSize;
    referenceGraph = self->_referenceGraph;
    referenceTable = self->_referenceTable;
    referenceTableLarge = self->_referenceTableLarge;
    BOOL v12 = referenceGraph;
    if (v4 >= referenceGraphEdgeNamespaceSize)
    {
      unint64_t var0 = referenceTable[v4 - referenceGraphEdgeNamespaceSize].var0.var0;
      if ((var0 & 0x80000000) != 0)
      {
        unsigned int v17 = (unint64_t *)((char *)referenceTableLarge + 16 * (var0 & 0x7FFFFFFF));
        unint64_t v15 = *v17;
        unint64_t v16 = v17[1];
        retstr->unint64_t var0 = *v17 & 0xFFFFFFFFFFFFFFLL;
        retstr->var1 = HIBYTE(v15);
        retstr->var2 = v16 & 0xFFFFFFFFFFFFFFLL;
      }
      else
      {
        char v14 = offset_settings[(var0 >> 24) & 3];
        retstr->unint64_t var0 = 4 * ((var0 & 0xFFFFFF) >> v14);
        retstr->var1 = var0 >> 26;
        retstr->var2 = var0 & 0xFFFFFF & ~(-1 << v14);
      }
    }
    else if (v12)
    {
      unint64_t v18 = v12;
      [(VMUObjectGraph *)v12 referenceInfoWithName:v4];
      BOOL v12 = v18;
    }
    else
    {
      retstr->unint64_t var0 = 0;
      *(void *)&retstr->var1 = 0;
      retstr->var2 = 0;
    }
  }
  else
  {
    retstr->unint64_t var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (void)_modifyDerivativeGraphCount:(int)a3
{
}

- (void)_refineTypesWithOverlay:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(VMUObjectGraph *)self internalizeNodes];
    [(VMUClassInfoMap *)self->_knownClassInfos _applyTypeOverlay:v4];
    p_uint64_t classInfosCount = &self->_classInfosCount;
    +[VMUClassInfoMap _destroyRetainedLinearArray:self->_classInfos withCount:self->_classInfosCount];
    self->_classInfos = [(VMUClassInfoMap *)self->_knownClassInfos _retainedLinearArrayWithReturnedCount:&self->_classInfosCount];
    uint64_t classInfosCount = self->_classInfosCount;
    if (classInfosCount)
    {
      id v18 = v4;
      $61A80719B04F7407D3E47539F1B23CAA v7 = malloc_type_malloc(24 * classInfosCount, 0x10100408797764BuLL);
      unsigned int v8 = (void **)v7;
      if (*p_classInfosCount)
      {
        unint64_t v9 = 0;
        uint64_t v10 = v7 + 1;
        do
        {
          uint64_t v11 = [self->_classInfos[v9] instanceSize];
          int v12 = [self->_classInfos[v9] defaultScanType];
          if (v11) {
            uint64_t v13 = malloc_type_calloc(v11, 1uLL, 0x100004077774924uLL);
          }
          else {
            uint64_t v13 = 0;
          }
          *((_DWORD *)v10 - 2) = v11;
          *((_DWORD *)v10 - 1) = v12;
          *uint64_t v10 = v13;
          v10[1] = 0;
          v10 += 3;
          id v14 = self->_classInfos[v9];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke;
          v23[3] = &unk_1E5D25DB8;
          int v24 = v9;
          int v25 = v11;
          v23[4] = self;
          v23[5] = v8;
          [v14 enumerateScanningLocationsForSize:v11 withBlock:v23];
          ++v9;
        }
        while (v9 < *p_classInfosCount);
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_2;
      v22[3] = &unk_1E5D25DE0;
      v22[4] = self;
      v22[5] = v8;
      v21.receiver = self;
      v21.super_class = (Class)VMUObjectGraph;
      [(VMUDirectedGraph *)&v21 _internalAccessRawEdgesWithBlock:v22];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_3;
      v20[3] = &unk_1E5D25DE0;
      v20[4] = self;
      v20[5] = v8;
      v19.receiver = self;
      v19.super_class = (Class)VMUObjectGraph;
      [(VMUDirectedGraph *)&v19 _internalAccessRawEdgesWithBlock:v20];
      if (*p_classInfosCount)
      {
        unint64_t v15 = 0;
        unint64_t v16 = v8 + 2;
        do
        {
          unsigned int v17 = *(v16 - 1);
          if (v17) {
            free(v17);
          }
          if (*v16) {
            free(*v16);
          }
          ++v15;
          v16 += 3;
        }
        while (v15 < *p_classInfosCount);
      }
      free(v8);
      id v4 = v18;
    }
  }
}

void __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke(uint64_t a1, void *a2, unsigned int a3, char a4)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 8) + a3) = a4;
  $61A80719B04F7407D3E47539F1B23CAA v7 = [a2 destinationLayout];

  if (v7)
  {
    uint64_t v8 = a3;
    if (!*(void *)(*(void *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 16)) {
      *(void *)(*(void *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 16) = malloc_type_calloc(*(unsigned int *)(a1 + 52), 4uLL, 0x100004052888210uLL);
    }
    unint64_t v9 = *(void **)(*(void *)(a1 + 32) + 152);
    id v10 = [a2 destinationLayout];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 24 * *(unsigned int *)(a1 + 48) + 16) + 4 * v8) = [v9 indexForClassInfo:v10];
  }
}

uint64_t __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_2(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    id v4 = (unsigned int *)(a2 + 8);
    do
    {
      uint64_t v5 = *(v4 - 2);
      if (v5 <= 0xFFFFFFFA)
      {
        uint64_t v6 = *(void **)(result + 32);
        uint64_t v7 = v6[16];
        uint64_t v8 = *(void *)(v7 + 16 * *(v4 - 1) + 8) >> 41;
        if ((*(void *)(v7 + 16 * *(v4 - 1) + 8) & 7) == 1 && v8 != 0)
        {
          uint64_t v10 = *(void *)(result + 40);
          uint64_t v11 = *(void *)(v10 + 24 * v8 + 16);
          if (v11)
          {
            unint64_t v12 = *(unsigned int *)(v6[12] + 4 * v5);
            if ((v12 & 0x80000000) != 0) {
              unint64_t v13 = *(void *)(v6[14] + 16 * (v12 & 0x7FFFFFFF)) & 0xFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v13 = 4 * ((v12 & 0xFFFFFF) >> offset_settings[(v12 >> 24) & 3]);
            }
            if (v13 < *(unsigned int *)(v10 + 24 * v8))
            {
              uint64_t v14 = *(unsigned int *)(v11 + 4 * v13);
              if (v14)
              {
                uint64_t v15 = v7 + 16 * *v4;
                uint64_t v18 = *(void *)(v15 + 8);
                unint64_t v16 = (uint64_t *)(v15 + 8);
                uint64_t v17 = v18;
                if ((v18 & 0xFFFFFE0000000007) == 1) {
                  *unint64_t v16 = v17 | (v14 << 41);
                }
              }
            }
          }
        }
      }
      v4 += 3;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t __42__VMUObjectGraph__refineTypesWithOverlay___block_invoke_3(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    id v4 = (unsigned int *)(a2 + 4);
    do
    {
      uint64_t v5 = *(v4 - 1);
      if (v5 > 0xFFFFFFFA) {
        goto LABEL_9;
      }
      uint64_t v6 = *(void **)(result + 32);
      uint64_t v7 = *(void *)(v6[16] + 16 * *v4 + 8) >> 41;
      if ((*(void *)(v6[16] + 16 * *v4 + 8) & 7) != 1 || v7 == 0) {
        goto LABEL_9;
      }
      uint64_t v9 = v6[12];
      uint64_t v10 = v6[14];
      unint64_t v11 = *(unsigned int *)(v9 + 4 * v5);
      if ((v11 & 0x80000000) != 0)
      {
        unint64_t v14 = *(void *)(v10 + 16 * (v11 & 0x7FFFFFFF));
        unint64_t v12 = v14 & 0xFFFFFFFFFFFFFFLL;
        unint64_t v13 = HIBYTE(v14);
      }
      else
      {
        unint64_t v12 = 4 * ((v11 & 0xFFFFFF) >> offset_settings[(v11 >> 24) & 3]);
        LODWORD(v13) = v11 >> 26;
      }
      if (v13 != 1) {
        goto LABEL_9;
      }
      uint64_t v15 = *(void *)(result + 40);
      unint64_t v16 = (unsigned int *)(v15 + 24 * v7);
      if (v12 >= *v16)
      {
        char v17 = *((unsigned char *)v16 + 4);
        if ((v11 & 0x80000000) == 0)
        {
LABEL_19:
          *(_DWORD *)(v9 + 4 * v5) = v11 & 0x83FFFFFF | ((v17 & 0x1F) << 26);
          goto LABEL_9;
        }
      }
      else
      {
        char v17 = *(unsigned char *)(*(void *)(v15 + 24 * v7 + 8) + v12);
        if ((v11 & 0x80000000) == 0) {
          goto LABEL_19;
        }
      }
      *(unsigned char *)(v10 + 16 * (v11 & 0x7FFFFFFF) + 7) = v17;
LABEL_9:
      v4 += 3;
      --v3;
    }
    while (v3);
  }
  return result;
}

- (void)_compareWithGraph:(id)a3 andMarkOnMatch:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  [(VMUObjectGraph *)self internalizeNodes];
  [v6 internalizeNodes];
  size_t v7 = 4 * [(VMUDirectedGraph *)self nodeCount];
  uint64_t v8 = (unsigned int *)malloc_type_malloc(v7, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v8, &__pattern4, v7);
  size_t v9 = 4 * [v6 nodeCount];
  uint64_t v10 = (unsigned int *)malloc_type_malloc(v9, 0x100004052888210uLL);
  LODWORD(__pattern4) = -1;
  memset_pattern4(v10, &__pattern4, v9);
  uint64_t __pattern4 = 0;
  p_pattern4 = &__pattern4;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke;
  v38[3] = &unk_1E5D25E08;
  v38[4] = self;
  v38[5] = &__pattern4;
  v38[6] = v8;
  [(VMUDirectedGraph *)self enumerateNodesWithBlock:v38];
  *((_DWORD *)p_pattern4 + 6) = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke_2;
  v34[3] = &unk_1E5D25E08;
  uint64_t v36 = &__pattern4;
  unint64_t v11 = (unint64_t **)v6;
  unsigned int v35 = v11;
  uint64_t v37 = v10;
  [v11 enumerateNodesWithBlock:v34];
  sortNodesInMap(&self->_internalizedNodes->var0, v8, [(VMUDirectedGraph *)self nodeCount]);
  sortNodesInMap(v11[16], v10, [v11 nodeCount]);
  unsigned int v12 = [(VMUDirectedGraph *)self nodeNamespaceSize];
  unint64_t v13 = malloc_type_calloc(1uLL, ((v12 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  unsigned int v14 = 0;
  unsigned int v15 = 0;
  *unint64_t v13 = v12;
LABEL_2:
  uint64_t v16 = v14;
  while (v16 < [(VMUDirectedGraph *)self nodeCount])
  {
    internalizedNodes = self->_internalizedNodes;
    unint64_t v18 = v8[v16];
    unint64_t var0 = internalizedNodes[v18].var0;
    unint64_t v20 = v11[16][2 * v10[v15]];
    if (var0 <= v20)
    {
      if (var0 < v20)
      {
        if ((v4 & 1) == 0 && *v13 > v18) {
          *((unsigned char *)v13 + (v18 >> 3) + 4) |= 1 << (v18 & 7);
        }
        goto LABEL_35;
      }
      if (v18 >= self->_internalizedCount)
      {
        int v24 = 0;
        unint64_t v23 = 0;
        unint64_t var0 = 0;
      }
      else
      {
        unint64_t v22 = *((void *)&internalizedNodes[v18] + 1);
        unint64_t v23 = ((v22 >> 5) | (v22 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v22 & 7) == 1) {
          int v24 = *(id *)((char *)self->_classInfos + ((v22 >> 38) & 0x3FFFFF8));
        }
        else {
          int v24 = 0;
        }
      }
      uint64_t v25 = v10[v15];
      if (v25 >= *((_DWORD *)v11 + 34))
      {
        uint64_t v30 = 0;
        unint64_t v29 = 0;
        unint64_t v27 = 0;
        if (v24) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v26 = &v11[16][2 * v25];
        unint64_t v27 = *v26;
        unint64_t v28 = v26[1];
        unint64_t v29 = ((v28 >> 5) | (v28 << 60)) & 0x7000000FFFFFFFFFLL;
        if ((v28 & 7) == 1)
        {
          uint64_t v30 = *(unint64_t *)((char *)v11[18] + ((v28 >> 38) & 0x3FFFFF8));
          if (!v24) {
            goto LABEL_28;
          }
LABEL_24:
          int v31 = [v24 isEqual:v30];
LABEL_25:
          if (v31 != v4) {
            goto LABEL_33;
          }
          goto LABEL_31;
        }
        uint64_t v30 = 0;
        if (v24) {
          goto LABEL_24;
        }
      }
LABEL_28:
      if (var0 == v27 && ((v29 ^ v23) & 0xFFFFFFFFFFFFFFFLL) == 0)
      {
        int v31 = v23 >> 60 == v29 >> 60;
        goto LABEL_25;
      }
      if (v4)
      {
LABEL_33:
        if (v15 < [v11 nodeCount] - 1) {
          ++v15;
        }
        goto LABEL_35;
      }
LABEL_31:
      unint64_t v32 = v8[v16];
      if (*v13 > v32) {
        *((unsigned char *)v13 + (v32 >> 3) + 4) |= 1 << (v32 & 7);
      }
      goto LABEL_33;
    }
    if (v15 == [v11 nodeCount] - 1)
    {
      if ((v4 & 1) == 0)
      {
        unint64_t v21 = v8[v16];
        if (*v13 > v21) {
          *((unsigned char *)v13 + (v21 >> 3) + 4) |= 1 << (v21 & 7);
        }
      }
LABEL_35:
      unsigned int v14 = v16 + 1;
      goto LABEL_2;
    }
    ++v15;
  }
  free(v8);
  free(v10);

  _Block_object_dispose(&__pattern4, 8);
  return v13;
}

uint64_t __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke(uint64_t a1, int a2)
{
  unsigned int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t result = [*(id *)(a1 + 32) nodeCount];
  if (v4 < result) {
    *(_DWORD *)(*(void *)(a1 + 48) + 4 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = a2;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __51__VMUObjectGraph__compareWithGraph_andMarkOnMatch___block_invoke_2(uint64_t a1, int a2)
{
  unsigned int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t result = [*(id *)(a1 + 32) nodeCount];
  if (v4 < result) {
    *(_DWORD *)(*(void *)(a1 + 48) + 4 * *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = a2;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)createMapForMinusGraph:(id)a3
{
  return [(VMUObjectGraph *)self _compareWithGraph:a3 andMarkOnMatch:0];
}

- (void)createMapForIntersectGraph:(id)a3
{
  return [(VMUObjectGraph *)self _compareWithGraph:a3 andMarkOnMatch:1];
}

- (VMUClassInfoMap)indexedClassInfos
{
  return self->_knownClassInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceGraph, 0);
  objc_storeStrong(&self->_nodeProvider, 0);

  objc_storeStrong((id *)&self->_knownClassInfos, 0);
}

- (void)stronglyConnectedComponentSearch:(unsigned int)a3 withRecorder:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (v7)
  {
    size_t v8 = 4 * [(VMUDirectedGraph *)self nodeNamespaceSize];
    size_t v9 = malloc_type_malloc(v8, 0x100004052888210uLL);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v9, __pattern4, v8);
    size_t v10 = 4 * [(VMUDirectedGraph *)self nodeNamespaceSize];
    unint64_t v11 = malloc_type_malloc(v10, 0x100004052888210uLL);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v11, __pattern4, v10);
    size_t v12 = 4 * [(VMUDirectedGraph *)self nodeNamespaceSize];
    unint64_t v13 = malloc_type_malloc(v12, 0x100004052888210uLL);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v13, __pattern4, v12);
    size_t v14 = 4 * [(VMUDirectedGraph *)self nodeNamespaceSize];
    unsigned int v15 = malloc_type_malloc(v14, 0x100004052888210uLL);
    LODWORD(__pattern4[0]) = -1;
    memset_pattern4(v15, __pattern4, v14);
    __pattern4[0] = 0;
    __pattern4[1] = __pattern4;
    __pattern4[2] = 0x2020000000;
    int v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    int v29 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke;
    v20[3] = &unk_1E5D25E30;
    int v24 = v13;
    uint64_t v25 = v9;
    uint64_t v26 = v11;
    unint64_t v22 = __pattern4;
    unint64_t v23 = v28;
    id v21 = v7;
    unint64_t v27 = v15;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke_2;
    v19[3] = &unk_1E5D25E58;
    v19[4] = self;
    v19[5] = v15;
    v19[6] = v11;
    [(VMUDirectedGraph *)self depthFirstSearch:v4 nodeVisitBlock:v20 edgeVisitBlock:v19];
    free(v9);
    free(v11);
    free(v13);
    free(v15);

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(__pattern4, 8);
  }
  else
  {
    uint64_t v16 = (objc_class *)objc_opt_class();
    char v17 = NSStringFromClass(v16);
    Name = sel_getName(a2);
    NSLog(&cfstr_SS_5.isa, v17, Name, "^block parameter must be non-nil.");
  }
}

uint64_t __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke(void *a1, unsigned int a2, int a3)
{
  char v3 = a3;
  uint64_t v5 = a2;
  if (a3)
  {
    uint64_t v6 = a1[9];
    if (*(_DWORD *)(v6 + 4 * a2) == *(_DWORD *)(a1[8] + 4 * a2))
    {
      uint64_t v7 = a1[7];
      unsigned int v8 = *(_DWORD *)(*(void *)(a1[5] + 8) + 24) - 1;
      for (uint64_t i = *(unsigned int *)(v7 + 4 * v8); i != a2; uint64_t i = *(unsigned int *)(v7 + 4 * v8))
      {
        *(_DWORD *)(v6 + 4 * i) = -1;
        --v8;
      }
      *(_DWORD *)(v6 + 4 * a2) = -1;
      if (a3 == 4) {
        (*(void (**)(void))(a1[4] + 16))();
      }
      *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v8;
    }
    uint64_t v10 = *(unsigned int *)(a1[10] + 4 * v5);
    if (v10 != -1)
    {
      uint64_t v11 = a1[9];
      unsigned int v12 = *(_DWORD *)(v11 + 4 * v10);
      if (v12 >= *(_DWORD *)(v11 + 4 * v5)) {
        unsigned int v12 = *(_DWORD *)(v11 + 4 * v5);
      }
      *(_DWORD *)(v11 + 4 * v10) = v12;
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1[5] + 8);
    uint64_t v14 = *(unsigned int *)(v13 + 24);
    *(_DWORD *)(v13 + 24) = v14 + 1;
    uint64_t v15 = a1[8];
    *(_DWORD *)(a1[7] + 4 * v14) = a2;
    uint64_t v16 = *(void *)(a1[6] + 8);
    LODWORD(v14) = *(_DWORD *)(v16 + 24);
    *(_DWORD *)(v16 + 24) = v14 + 1;
    *(_DWORD *)(a1[9] + 4 * a2) = v14;
    *(_DWORD *)(v15 + 4 * a2) = v14;
  }
  if (((v3 + 1) & 0xFE) != 0) {
    return 2;
  }
  else {
    return (v3 + 1);
  }
}

BOOL __82__VMUObjectGraph_UsefulAlgorithms__stronglyConnectedComponentSearch_withRecorder___block_invoke_2(void *a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned char *a5)
{
  size_t v9 = (void *)a1[4];
  if (v9)
  {
    [v9 referenceInfoWithName:a2];
    LOBYTE(v9) = v13;
  }
  BOOL result = VMUIsOwningReference((char)v9);
  if (result)
  {
    if (*a5)
    {
      BOOL result = 0;
      *a5 = 4;
      uint64_t v11 = a1[6];
      unsigned int v12 = *(_DWORD *)(v11 + 4 * a3);
      if (v12 >= *(_DWORD *)(v11 + 4 * a4)) {
        unsigned int v12 = *(_DWORD *)(v11 + 4 * a4);
      }
      *(_DWORD *)(v11 + 4 * a3) = v12;
    }
    else
    {
      *(_DWORD *)(a1[5] + 4 * a4) = a3;
      return 1;
    }
  }
  return result;
}

- (id)subgraphWithShortestPathsFromNode:(unsigned int)a3 toNodes:(void *)a4
{
  return _subgraphWithPaths(self, *(uint64_t *)&a3, (uint64_t)a4, 0);
}

- (id)subgraphWithUniquePathsFromNode:(unsigned int)a3 toNodes:(void *)a4
{
  return _subgraphWithPaths(self, *(uint64_t *)&a3, (uint64_t)a4, 1);
}

- (BOOL)isGroupNode:(unsigned int)a3
{
  return [(VMUDirectedGraph *)self enumerateMembersOfGroupNode:*(void *)&a3 withBlock:&__block_literal_global_21] != 0;
}

void __48__VMUObjectGraph_UsefulAlgorithms__isGroupNode___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 1;
}

- (BOOL)isRootNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (![(VMUDirectedGraph *)self inverted]) {
    -[VMUObjectGraph(UsefulAlgorithms) isRootNode:]();
  }
  uint64_t v8 = 0;
  size_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__VMUObjectGraph_UsefulAlgorithms__isRootNode___block_invoke;
  v7[3] = &unk_1E5D25EA0;
  v7[4] = self;
  v7[5] = &v8;
  [(VMUDirectedGraph *)self enumerateEdgesOfNode:v3 withBlock:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __47__VMUObjectGraph_UsefulAlgorithms__isRootNode___block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, unsigned char *a5)
{
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    uint64_t result = [(id)result referenceInfoWithName:a2];
  }
  if (a3 != a4)
  {
    uint64_t result = VMUIsOwningReference(v11);
    if (result)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a5 = 1;
    }
  }
  return result;
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithArchived:(uint64_t)a3 version:(uint64_t)a4 options:(uint64_t)a5 diskLogs:(uint64_t)a6 error:(uint64_t)a7 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)archiveDictionaryRepresentation:options:.cold.1()
{
  __assert_rtn("-[VMUObjectGraph archiveDictionaryRepresentation:options:]", "VMUObjectGraph.m", 313, "(address & (1ull << 63)) == 0");
}

@end