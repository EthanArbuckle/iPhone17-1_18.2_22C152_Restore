@interface VMULeakDetector
+ (id)_consolidatedRootLeakDescriptionsForTree:(id)a3;
+ (id)consolidatedRootLeakDescriptionsForTree:(id)a3;
+ (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5;
- (BOOL)checkAbandoned;
- (BOOL)checkTaskExistence;
- (BOOL)fcloseOutput;
- (BOOL)fullStacks;
- (BOOL)groupByType;
- (BOOL)referenceTreeShowRegionVirtualSize;
- (BOOL)showBinaryContents;
- (BOOL)showContext;
- (BOOL)showLeakedVMregions;
- (BOOL)showListOfLeaks;
- (BOOL)showOnlyVMregions;
- (BOOL)showRawClassNames;
- (BOOL)suppressOutput;
- (NSMutableArray)leakTreeRootsArray;
- (NSMutableString)outputString;
- (VMUDebugTimer)debugTimer;
- (VMULeakDetector)initWithTask:(unsigned int)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6;
- (VMULeakDetector)initWithVMUTask:(id)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6;
- (VMUProcessObjectGraph)graph;
- (VMUProcessObjectGraph)leakedGraph;
- (VMUStackLogReader)stackLogReader;
- (VMUTask)task;
- (VMUTaskMemoryScanner)scanner;
- (__sFILE)outputFile;
- (id)labelForNode:(unsigned int)a3 details:(id)a4 shortLabel:(id)a5;
- (id)nodeDescription:(unsigned int)a3;
- (id)nodeDescription:(unsigned int)a3 usingDetails:(id *)a4;
- (id)nodeTypeDescription:(unsigned int)a3 details:(id *)a4 mallocBySize:(id)a5;
- (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5;
- (id)scannerOrGraph;
- (unint64_t)abandonedSize;
- (unint64_t)allocationsSize;
- (unint64_t)leakedAllocationsSize;
- (unsigned)abandonedCount;
- (unsigned)allocationsCount;
- (unsigned)detectLeaksWithError:(id *)a3;
- (unsigned)doNormalLeakDetectionWithError:(id *)a3;
- (unsigned)leakedAllocationsCount;
- (unsigned)objectContentLevel;
- (void)abandoned;
- (void)buildLeakTree;
- (void)dealloc;
- (void)leakedNodes;
- (void)printContents:(void *)a3 size:(unint64_t)a4;
- (void)printLeak:(const char *)a3 node:(unsigned int)a4 details:(id)a5 region:(id)a6 stop:;
- (void)printLeakTree;
- (void)printout:(const char *)a3;
- (void)setAbandoned:(void *)a3;
- (void)setAbandonedCount:(unsigned int)a3;
- (void)setAbandonedSize:(unint64_t)a3;
- (void)setAllocationsCount:(unsigned int)a3;
- (void)setAllocationsSize:(unint64_t)a3;
- (void)setCheckAbandoned:(BOOL)a3;
- (void)setDebugTimer:(id)a3;
- (void)setFcloseOutput:(BOOL)a3;
- (void)setFullStacks:(BOOL)a3;
- (void)setGroupByType:(BOOL)a3;
- (void)setLeakTreeRootsArray:(id)a3;
- (void)setLeakedAllocationsCount:(unsigned int)a3;
- (void)setLeakedAllocationsSize:(unint64_t)a3;
- (void)setLeakedGraph:(id)a3;
- (void)setLeakedNodes:(void *)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setOutputFile:(__sFILE *)a3;
- (void)setOutputString:(id)a3;
- (void)setReferenceTreeShowRegionVirtualSize:(BOOL)a3;
- (void)setShowBinaryContents:(BOOL)a3;
- (void)setShowContext:(BOOL)a3;
- (void)setShowLeakedVMregions:(BOOL)a3;
- (void)setShowListOfLeaks:(BOOL)a3;
- (void)setShowOnlyVMregions:(BOOL)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)setSuppressOutput:(BOOL)a3;
@end

@implementation VMULeakDetector

- (VMULeakDetector)initWithTask:(unsigned int)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [[VMUTask alloc] initWithTask:v8];
  v14 = [(VMULeakDetector *)self initWithVMUTask:v13 graph:v12 scanner:v11 stackLogReader:v10];

  return v14;
}

- (VMULeakDetector)initWithVMUTask:(id)a3 graph:(id)a4 scanner:(id)a5 stackLogReader:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VMULeakDetector;
  v15 = [(VMULeakDetector *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_scanner, a5);
    objc_storeStrong((id *)&v16->_stackLogReader, a6);
    objc_storeStrong((id *)&v16->_graph, a4);
    objc_storeStrong((id *)&v16->_task, a3);
    v16->_showBinaryContents = 0;
    *(_DWORD *)&v16->_showLeakedVMregions = 0;
    scanner = v16->_scanner;
    if (scanner) {
      int v18 = [(VMUTaskMemoryScanner *)scanner objectContentLevel];
    }
    else {
      int v18 = 3;
    }
    v16->_objectContentLevel = v18;
    *(_DWORD *)&v16->_checkAbandoned = 0;
    v16->_referenceTreeShowRegionVirtualSize = 0;
    v16->_max_contents_bytes = 128;
    v16->_numExcluded = 0;
    v16->_outputFile = (__sFILE *)*MEMORY[0x1E4F143D8];
    outputString = v16->_outputString;
    v16->_outputString = 0;
  }
  return v16;
}

- (void)printout:(const char *)a3
{
  if (self->_outputString || self->_outputFile)
  {
    va_list v8 = (va_list)&v9;
    if (self->_outputString)
    {
      v7 = 0;
      if (vasprintf((char **)&v7, a3, v8) < 0 || !v7) {
        -[VMULeakDetector printout:]();
      }
      outputString = self->_outputString;
      v5 = [NSString stringWithUTF8String:];
      [(NSMutableString *)outputString appendString:v5];

      free(v7);
    }
    else
    {
      outputFile = self->_outputFile;
      if (outputFile) {
        vfprintf(outputFile, a3, v8);
      }
    }
  }
}

- (BOOL)checkTaskExistence
{
  return 1;
}

- (id)scannerOrGraph
{
  scanner = self->_scanner;
  if (!scanner) {
    scanner = self->_graph;
  }
  return scanner;
}

- (id)labelForNode:(unsigned int)a3 details:(id)a4 shortLabel:(id)a5
{
  int v5 = (int)a5;
  uint64_t v7 = *(void *)&a3;
  if (!VMUGraphNodeType_IsVMRegion(*(void *)(a4.var0 + 8) >> 60)
    || ![(VMUTask *)self->_task isCore]
    && (![(VMUTask *)self->_task taskPort] || [(VMUTask *)self->_task taskPort] == -1))
  {
    goto LABEL_11;
  }
  uint64_t v9 = *(void *)a4.var0 & ~*MEMORY[0x1E4F14AE0];
  int v18 = 0;
  id v10 = [(VMUTask *)self->_task memoryCache];
  LODWORD(v9) = [v10 machVMPageRangeQueryWithAddress:v9 size:*MEMORY[0x1E4F14B00] dispositions:&v18 dispositionsCount:&v17];
  int v11 = v18 & 0x11;

  if (v9 || v11 == 0)
  {
    id v13 = 0;
  }
  else
  {
LABEL_11:
    id v14 = [(VMULeakDetector *)self scannerOrGraph];
    v15 = v14;
    if (v5) {
      [v14 shortLabelForNode:v7];
    }
    else {
    id v13 = [v14 labelForNode:v7];
    }
  }

  return v13;
}

- (void)printContents:(void *)a3 size:(unint64_t)a4
{
  if (!a3)
  {
    uint64_t v17 = "< content unavailable >\n";
    goto LABEL_24;
  }
  unint64_t max_contents_bytes = self->_max_contents_bytes;
  if (max_contents_bytes >= a4) {
    unint64_t v6 = a4;
  }
  else {
    unint64_t v6 = self->_max_contents_bytes;
  }
  if (v6 >= 4)
  {
    uint64_t v7 = (unsigned int *)a3;
    unint64_t v18 = a4;
    unint64_t v8 = v6 >> 2;
    do
    {
      [(VMULeakDetector *)self printout:"\t"];
      if (v8 >= 4) {
        uint64_t v9 = 4;
      }
      else {
        uint64_t v9 = v8;
      }
      uint64_t v10 = v9;
      int v11 = v7;
      do
      {
        unsigned int v12 = *v11++;
        -[VMULeakDetector printout:](self, "printout:", "0x%08x ", v12);
        --v10;
      }
      while (v10);
      [(VMULeakDetector *)self printout:"\t"];
      if ((4 * v9) <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = (4 * v9);
      }
      id v14 = v7;
      do
      {
        int v16 = *(unsigned __int8 *)v14;
        id v14 = (unsigned int *)((char *)v14 + 1);
        char v15 = v16;
        if ((v16 - 32) >= 0x5F) {
          char v15 = 46;
        }
        -[VMULeakDetector printout:](self, "printout:", "%c", v15);
        --v13;
      }
      while (v13);
      [(VMULeakDetector *)self printout:"\n"];
      v7 += v9;
      v8 -= v9;
    }
    while (v8);
    unint64_t max_contents_bytes = self->_max_contents_bytes;
    a4 = v18;
  }
  if (max_contents_bytes < a4)
  {
    uint64_t v17 = "\t...\n";
LABEL_24:
    [(VMULeakDetector *)self printout:v17];
  }
}

- (void)printLeak:(const char *)a3 node:(unsigned int)a4 details:(id)a5 region:(id)a6 stop:
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v10 = (unsigned int *)a6;
  BOOL IsVMRegion = VMUGraphNodeType_IsVMRegion(*(void *)(a5.var0 + 8) >> 60);
  if ((self->_showLeakedVMregions || !IsVMRegion) && (!self->_showOnlyVMregions || IsVMRegion))
  {
    stackLogReader = self->_stackLogReader;
    if (stackLogReader)
    {
      if ([(VMUStackLogReader *)stackLogReader usesLiteMode])
      {
        id v14 = [(VMUProcessObjectGraph *)self->_graph zoneNameForIndex:v10[37]];
      }
      else
      {
        id v14 = 0;
      }
      id v16 = v14;
      if ([v16 hasPrefix:@"MallocStackLoggingLiteZone"]) {
        uint64_t v17 = [v16 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"] ^ 1;
      }
      else {
        uint64_t v17 = 0;
      }

      uint64_t v18 = 4 * self->_fullStacks;
      v19 = self->_stackLogReader;
      long long v36 = *(_OWORD *)a5.var0;
      uint64_t v37 = *(void *)(a5.var0 + 16);
      char v15 = [(VMUStackLogReader *)v19 symbolicatedBacktraceForNode:v7 nodeDetails:&v36 isLiteZone:v17 options:v18];
    }
    else
    {
      char v15 = 0;
    }
    if (v15 == VMUBacktraceIsExcludedMarker)
    {
      ++self->_numExcluded;
      goto LABEL_38;
    }
    -[VMULeakDetector printout:](self, "printout:", "%s: %#llx  size=%llu  ", a3, *(void *)a5.var0, *(void *)(a5.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);
    if (VMUGraphNodeType_IsVMRegion(*(void *)(a5.var0 + 8) >> 60))
    {
      v20 = [v10 type];
      uint64_t v21 = [v20 length];

      if (v21)
      {
        v22 = NSString;
        v23 = [v10 descriptionWithOptions:513 maximumLength:0];
        v24 = [v22 stringWithFormat:@"VM: %@", v23];
      }
      else
      {
        v24 = @"VM: unknown region type";
      }
      v27 = v24;
      -[VMULeakDetector printout:](self, "printout:", "%s", [(__CFString *)v27 UTF8String]);
    }
    else
    {
      id v25 = [(VMUProcessObjectGraph *)self->_graph zoneNameForIndex:v10[37]];
      -[VMULeakDetector printout:](self, "printout:", "zone: %s", [v25 UTF8String]);

      v26 = *(void **)(a5.var0 + 16);
      if (!v26)
      {
LABEL_29:
        if ((self->_objectContentLevel & 0xFFFFFFFE) == 2)
        {
          long long v36 = *(_OWORD *)a5.var0;
          uint64_t v37 = *(void *)(a5.var0 + 16);
          v32 = [(VMULeakDetector *)self labelForNode:v7 details:&v36 shortLabel:0];
          v33 = v32;
          if (v32)
          {
            -[VMULeakDetector printout:](self, "printout:", " %s\n", [v32 UTF8String]);
          }
          else
          {
            BOOL showBinaryContents = self->_showBinaryContents;
            [(VMULeakDetector *)self printout:"\n"];
            if (showBinaryContents)
            {
              v35 = [(VMULeakDetector *)self scannerOrGraph];
              -[VMULeakDetector printContents:size:](self, "printContents:size:", [v35 contentForNode:v7], *(void *)(a5.var0 + 8) & 0xFFFFFFFFFFFFFFFLL);
            }
          }

          if (!v15) {
            goto LABEL_38;
          }
        }
        else
        {
          [(VMULeakDetector *)self printout:"\n"];
          if (!v15) {
            goto LABEL_38;
          }
        }
        -[VMULeakDetector printout:](self, "printout:", "\tCall stack: %s\n", [(__CFString *)v15 UTF8String]);
        [(VMULeakDetector *)self printout:"\n"];
LABEL_38:

        goto LABEL_39;
      }
      if (self->_showRawClassNames) {
        [v26 className];
      }
      else {
      v27 = [v26 displayName];
      }
      uint64_t v28 = [(__CFString *)v27 UTF8String];
      id v29 = [*(id *)(a5.var0 + 16) typeName];
      uint64_t v30 = [v29 UTF8String];
      id v31 = [*(id *)(a5.var0 + 16) binaryName];
      -[VMULeakDetector printout:](self, "printout:", "   %s  %s  %s", v28, v30, [v31 UTF8String]);
    }
    goto LABEL_29;
  }
LABEL_39:
}

- (id)nodeTypeDescription:(unsigned int)a3 details:(id *)a4 mallocBySize:(id)a5
{
  if (a4)
  {
    unint64_t v7 = a4[1].var0 >> 60;
    if (v7 == 1)
    {
      int v8 = (int)a5;
      var0 = (void *)a4[2].var0;
      if (self->_showRawClassNames) {
        [var0 className:a3];
      }
      else {
      uint64_t v10 = [var0 displayName:a3];
      }
      if (v10) {
        int v11 = (__CFString *)v10;
      }
      else {
        int v11 = @"malloc-block";
      }
      if (!v10 && v8)
      {
        [NSString stringWithFormat:@"malloc<%s>", VMUMemorySizeString(a4[1].var0 & 0xFFFFFFFFFFFFFFFLL)];
        int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v12 = *(void *)&a3;
      if (VMUGraphNodeType_IsVMRegion(v7))
      {
        uint64_t v13 = [(VMUProcessObjectGraph *)self->_graph vmuVMRegionForNode:v12];
        id v14 = NSString;
        char v15 = [v13 type];
        int v11 = [v14 stringWithFormat:@"VM: %@", v15];
      }
      else
      {
        unint64_t v16 = a4[1].var0 >> 60;
        uint64_t v17 = @"thread";
        if (v16 != 4) {
          uint64_t v17 = 0;
        }
        if (v16 == 3) {
          int v11 = @"kernel";
        }
        else {
          int v11 = v17;
        }
      }
    }
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (id)nodeDescription:(unsigned int)a3 usingDetails:(id *)a4
{
  if (self->_groupByType) {
    [(VMULeakDetector *)self nodeTypeDescription:*(void *)&a3 details:a4 mallocBySize:1];
  }
  else {
  int v5 = [(VMUProcessObjectGraph *)self->_graph nodeDescription:*(void *)&a3 withOffset:0 showLabel:(self->_objectContentLevel & 0xFFFFFFFE) == 2];
  }

  return v5;
}

- (id)nodeDescription:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  memset(v8, 0, sizeof(v8));
  graph = self->_graph;
  if (graph) {
    [(VMUObjectGraph *)graph nodeDetails:*(void *)&a3];
  }
  unint64_t v6 = [(VMULeakDetector *)self nodeDescription:v3 usingDetails:v8];

  return v6;
}

- (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  int v8 = objc_opt_class();
  long long v9 = *(_OWORD *)&a3->var1.var1;
  v12[0] = *(_OWORD *)&a3->var0;
  v12[1] = v9;
  var2 = a3->var2;
  uint64_t v10 = [v8 referenceDescription:v12 dstDescription:v7 is64bit:v5];

  return v10;
}

+ (id)referenceDescription:(id *)a3 dstDescription:(id)a4 is64bit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  int v8 = (void *)*((void *)a3->var0 + 2);
  uint64_t v9 = 3;
  if (v5) {
    uint64_t v9 = 7;
  }
  if ((a3->var1.var0 & v9) != 0 && *((void *)a3->var0 + 1) >> 60 != 3)
  {
    uint64_t v19 = [NSString stringWithFormat:@"unaligned +%lld:  --> %@", a3->var1.var0, v7];

    id v7 = (id)v19;
  }
  else
  {
    uint64_t v10 = [*((id *)a3->var2 + 2) displayName];
    char v11 = [v10 hasSuffix:@"Storage"]);

    if ((v11 & 1) == 0)
    {
      uint64_t v12 = [v8 fieldAtOrBeforeOffset:LODWORD(a3->var1.var0)];
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = [v12 ivarName];
        unint64_t var0 = a3->var1.var0;
        unsigned int v16 = [v13 offset];
        __str[0] = 0;
        if (var0 != v16) {
          snprintf(__str, 0x20uLL, " + %llu", var0 - v16);
        }
        uint64_t v17 = VMUScanTypeKeywordDescription([v13 scanType]);
        if (v17 && *v17)
        {
          [NSString stringWithFormat:@"%s ", v17];
          uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v18 = &stru_1EFE27F38;
        }
        uint64_t v20 = [NSString stringWithFormat:@"%@%@%s --> %@", v18, v14, __str, v7];

        id v7 = (id)v20;
      }
    }
  }

  return v7;
}

- (void)buildLeakTree
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  v2 = [(VMUDirectedGraph *)self->_graph subgraphWithMarkedNodes:self->_leakedNodes];
  [(VMULeakDetector *)self setLeakedGraph:v2];

  v120 = (id *)malloc_type_calloc([(VMUDirectedGraph *)self->_leakedGraph nodeNamespaceSize], 8uLL, 0x80040B8603338uLL);
  v112 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRootWithBacktrace alloc], "initWithSymbolicator:sampler:options:", 0, 0, 0, 0);
  uint64_t v159 = 0;
  v160 = &v159;
  uint64_t v161 = 0x2020000000;
  int v162 = 0;
  size_t v3 = 4 * [(VMUDirectedGraph *)self->_leakedGraph nodeNamespaceSize];
  LODWORD(__pattern4._pi) = -1;
  v111 = (unsigned int *)malloc_type_malloc(v3, 0x100004052888210uLL);
  memset_pattern4(v111, &__pattern4, v3);
  LODWORD(v3) = [(VMUDirectedGraph *)self->_leakedGraph nodeNamespaceSize];
  v4 = malloc_type_calloc(1uLL, ((v3 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v4 = v3;
  v158[0] = MEMORY[0x1E4F143A8];
  v158[1] = 3221225472;
  v158[2] = __32__VMULeakDetector_buildLeakTree__block_invoke;
  v158[3] = &unk_1E5D23748;
  v158[5] = v111;
  v158[4] = &v159;
  v110 = v4;
  v158[6] = v4;
  BOOL v5 = (void *)MEMORY[0x1AD0DA230](v158);
  unint64_t v6 = self;
  id v7 = (void *)[(VMUProcessObjectGraph *)self->_leakedGraph copy];
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v9 = [(VMUDebugTimer *)debugTimer signpostID];
    debugTimer = self->_debugTimer;
    if (v9)
    {
      uint64_t v10 = [(VMUDebugTimer *)debugTimer logHandle];
      os_signpost_id_t v11 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v10, OS_SIGNPOST_INTERVAL_END, v11, "buildLeakTree", "", (uint8_t *)&__pattern4, 2u);
      }

      unint64_t v6 = self;
      debugTimer = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)debugTimer endEvent:"buildLeakTree"];
  [(VMUDebugTimer *)v6->_debugTimer startWithCategory:"buildLeakTree" message:"identifying strongly-connected-components (cycles) in the graph"];
  uint64_t v12 = v6->_debugTimer;
  if (v12)
  {
    uint64_t v13 = [(VMUDebugTimer *)v12 logHandle];
    os_signpost_id_t v14 = [(VMUDebugTimer *)v6->_debugTimer signpostID];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v14, "buildLeakTree", "identifying strongly-connected-components (cycles) in the graph", (uint8_t *)&__pattern4, 2u);
    }

    unint64_t v6 = self;
  }
  leakedGraph = v6->_leakedGraph;
  v157[0] = MEMORY[0x1E4F143A8];
  v157[1] = 3221225472;
  v157[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_64;
  v157[3] = &unk_1E5D23770;
  v157[4] = v6;
  [(VMUObjectGraph *)leakedGraph stronglyConnectedComponentSearch:0xFFFFFFFFLL withRecorder:v157];
  unsigned int v16 = v6->_debugTimer;
  if (v16)
  {
    uint64_t v17 = [(VMUDebugTimer *)v16 signpostID];
    unsigned int v16 = v6->_debugTimer;
    if (v17)
    {
      uint64_t v18 = [(VMUDebugTimer *)v16 logHandle];
      os_signpost_id_t v19 = [(VMUDebugTimer *)v6->_debugTimer signpostID];
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v18, OS_SIGNPOST_INTERVAL_END, v19, "buildLeakTree", "", (uint8_t *)&__pattern4, 2u);
      }

      unint64_t v6 = self;
      unsigned int v16 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v16 endEvent:"buildLeakTree"];
  [(VMUDebugTimer *)v6->_debugTimer startWithCategory:"buildLeakTree" message:"identifying root leaks and cycles"];
  uint64_t v20 = v6->_debugTimer;
  if (v20)
  {
    uint64_t v21 = [(VMUDebugTimer *)v20 logHandle];
    os_signpost_id_t v22 = [(VMUDebugTimer *)v6->_debugTimer signpostID];
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v22, "buildLeakTree", "identifying root leaks and cycles", (uint8_t *)&__pattern4, 2u);
    }

    unint64_t v6 = self;
  }
  v113 = v6->_stackLogReader;
  if (v113)
  {
    uint64_t v23 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:256];
    if ([(VMUStackLogReader *)v113 inspectingLiveProcess]
      && [(VMUStackLogReader *)v113 usesLiteMode])
    {
      for (uint64_t i = 0; i < [v7 zoneCount]; uint64_t i = (i + 1))
      {
        id v25 = [v7 zoneNameForIndex:i];
        if ([v25 hasPrefix:@"MallocStackLoggingLiteZone"])
        {
          char v26 = [v25 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"];

          if ((v26 & 1) == 0)
          {

            goto LABEL_35;
          }
        }
        else
        {
        }
      }
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
  LODWORD(i) = -1;
LABEL_35:
  unsigned int v27 = [(VMUDirectedGraph *)self->_leakedGraph nodeNamespaceSize];
  v119 = malloc_type_calloc(1uLL, ((v27 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v119 = v27;
  uint64_t v28 = [(VMUDirectedGraph *)self->_leakedGraph invertedGraph];
  id v29 = objc_opt_new();
  v147[0] = MEMORY[0x1E4F143A8];
  v147[1] = 3221225472;
  v147[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_69;
  v147[3] = &unk_1E5D237C0;
  id v30 = v28;
  id v148 = v30;
  v149 = self;
  id v106 = v29;
  id v150 = v106;
  v155 = v119;
  id v109 = v5;
  id v154 = v109;
  v116 = v113;
  v151 = v116;
  id v115 = v7;
  id v152 = v115;
  int v156 = i;
  table = v23;
  v153 = table;
  [v30 enumerateObjectsWithBlock:v147];

  if (v113
    && (![(VMUStackLogReader *)v116 usesLiteMode]
     || ([(VMUStackLogReader *)v116 inspectingLiveProcess] & 1) == 0))
  {
    id v31 = self->_debugTimer;
    if (v31)
    {
      uint64_t v32 = [(VMUDebugTimer *)v31 signpostID];
      id v31 = self->_debugTimer;
      if (v32)
      {
        v33 = [(VMUDebugTimer *)v31 logHandle];
        os_signpost_id_t v34 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          LOWORD(__pattern4._pi) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v33, OS_SIGNPOST_INTERVAL_END, v34, "buildLeakTree", "", (uint8_t *)&__pattern4, 2u);
        }

        id v31 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v31 endEvent:"buildLeakTree"];
    [(VMUDebugTimer *)self->_debugTimer startWithCategory:"buildLeakTree" message:"enumerate stack logs to populate rootLeakAddressToStackIDMap"];
    v35 = self->_debugTimer;
    if (v35)
    {
      long long v36 = [(VMUDebugTimer *)v35 logHandle];
      os_signpost_id_t v37 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v37, "buildLeakTree", "enumerate stack logs to populate rootLeakAddressToStackIDMap", (uint8_t *)&__pattern4, 2u);
      }
    }
    v145[0] = MEMORY[0x1E4F143A8];
    v145[1] = 3221225472;
    v145[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_80;
    v145[3] = &unk_1E5D237E8;
    v146 = table;
    [(VMUStackLogReader *)v116 enumerateMSLRecordsAndPayloads:v145];
  }
  v38 = objc_opt_new();
  [(VMULeakDetector *)self setLeakTreeRootsArray:v38];

  if (v113)
  {
    v39 = self;
    v40 = self->_debugTimer;
    if (v40)
    {
      uint64_t v41 = [(VMUDebugTimer *)v40 signpostID];
      v40 = self->_debugTimer;
      if (v41)
      {
        v42 = [(VMUDebugTimer *)v40 logHandle];
        os_signpost_id_t v43 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          LOWORD(__pattern4._pi) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v42, OS_SIGNPOST_INTERVAL_END, v43, "buildLeakTree", "", (uint8_t *)&__pattern4, 2u);
        }

        v39 = self;
        v40 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v40 endEvent:"buildLeakTree"];
    -[VMUDebugTimer startWithCategory:message:](v39->_debugTimer, "startWithCategory:message:", "buildLeakTree", "invert rootLeakAddressToStackIDMap to produce stackID --> {size,count,root-leak-call-tree-root} map");
    v44 = v39->_debugTimer;
    if (v44)
    {
      v45 = [(VMUDebugTimer *)v44 logHandle];
      os_signpost_id_t v46 = [(VMUDebugTimer *)v39->_debugTimer signpostID];
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v45, OS_SIGNPOST_INTERVAL_BEGIN, v46, "buildLeakTree", "invert rootLeakAddressToStackIDMap to produce stackID --> {size,count,root-leak-call-tree-root} map", (uint8_t *)&__pattern4, 2u);
      }
    }
    v118 = (id *)malloc_type_calloc([v115 nodeNamespaceSize], 8uLL, 0x80040B8603338uLL);
    v117 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:0];
    memset(&__pattern4, 0, sizeof(__pattern4));
    NSEnumerateMapTable(&__pattern4, table);
    value = 0;
    key = 0;
    while (NSNextMapEnumeratorPair(&__pattern4, &key, &value))
    {
      NSMapGet(v117, value);
      v47 = (VMUCallTreeRootWithBacktrace *)objc_claimAutoreleasedReturnValue();
      if (!v47)
      {
        v48 = (void *)MEMORY[0x1AD0D9F90]();
        v47 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRootWithBacktrace alloc], "initWithSymbolicator:sampler:options:", 0, 0, 0, 0);
        if (self->_fullStacks) {
          uint64_t v49 = 68;
        }
        else {
          uint64_t v49 = 64;
        }
        v50 = [(VMUStackLogReader *)v116 symbolicatedBacktraceForStackID:value options:v49];
        [(VMUCallTreeRootWithBacktrace *)v47 setBacktraceString:v50];

        [(NSMutableArray *)self->_leakTreeRootsArray addObject:v47];
        NSMapInsert(v117, value, v47);
      }
    }
    NSEndMapTableEnumeration(&__pattern4);
  }
  else
  {
    v117 = 0;
    v118 = 0;
  }
  v51 = self;
  v114 = kVMURootRetainCycle[0];
  uint64_t v108 = [(__CFString *)v114 length];
  v52 = self->_debugTimer;
  if (v52)
  {
    uint64_t v53 = [(VMUDebugTimer *)v52 signpostID];
    v52 = self->_debugTimer;
    if (v53)
    {
      v54 = [(VMUDebugTimer *)v52 logHandle];
      os_signpost_id_t v55 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v55 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v54, OS_SIGNPOST_INTERVAL_END, v55, "buildLeakTree", "", (uint8_t *)&__pattern4, 2u);
      }

      v51 = self;
      v52 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v52 endEvent:"buildLeakTree"];
  [(VMUDebugTimer *)v51->_debugTimer startWithCategory:"buildLeakTree" message:"building call tree from references"];
  v56 = v51->_debugTimer;
  if (v56)
  {
    v57 = [(VMUDebugTimer *)v56 logHandle];
    os_signpost_id_t v58 = [(VMUDebugTimer *)self->_debugTimer signpostID];
    if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v57, OS_SIGNPOST_INTERVAL_BEGIN, v58, "buildLeakTree", "building call tree from references", (uint8_t *)&__pattern4, 2u);
    }
  }
  if (*((_DWORD *)v160 + 6))
  {
    int v59 = 0;
    do
    {
      v60 = (void *)MEMORY[0x1AD0D9F90]();
      unint64_t v61 = v111[v59];
      v62 = v112;
      id v63 = v120[v61];
      if (v63)
      {
        v64 = v63;
        if (v113)
        {
          v65 = (VMUCallTreeRootWithBacktrace *)v118[v61];

          v62 = v65;
        }
      }
      else
      {
        memset(&__pattern4, 0, sizeof(__pattern4));
        v66 = self;
        if (v115) {
          [v115 nodeDetails:v61];
        }
        if ([(VMUDirectedGraph *)self->_leakedGraph parentGroupForNode:v61] == -1) {
          v67 = @"ROOT LEAK: ";
        }
        else {
          v67 = v114;
        }
        if (v113)
        {
          v68 = NSMapGet(table, (const void *)__pattern4._pi);
          if (v68)
          {
            uint64_t v69 = NSMapGet(v117, v68);

            v118[v61] = (id)v69;
            v62 = (VMUCallTreeRootWithBacktrace *)v69;
            v66 = self;
          }
        }
        v70 = [(VMULeakDetector *)v66 nodeDescription:v61 usingDetails:&__pattern4];
        v71 = [(__CFString *)v67 stringByAppendingString:v70];

        if (self->_groupByType) {
          [(VMUCallTreeRoot *)v62 addChildWithName:v71 address:0 count:1 numBytes:__pattern4._si & 0xFFFFFFFFFFFFFFFLL toNode:v62];
        }
        else {
        v64 = [(VMUCallTreeRoot *)v62 addUniqueChildWithName:v71 address:__pattern4._pi count:1 numBytes:__pattern4._si & 0xFFFFFFFFFFFFFFFLL toNode:v62 isLeafNode:0];
        }
        v120[v61] = v64;
      }
      if (*v119 > v61
        && ((*((unsigned __int8 *)v119 + (v61 >> 3) + 4) >> (v61 & 7)) & 1) != 0
        && (id v72 = v64) != 0)
      {
        v73 = v72;
        v74 = 0;
        do
        {
          v75 = [v73 parent];
          if (v75)
          {
            v76 = [v73 parent];
            v77 = [v76 parent];
            BOOL v78 = v77 == 0;

            if (v78)
            {
              uint64_t v79 = [v73 name];

              v74 = (void *)v79;
            }
          }
          uint64_t v80 = [v73 parent];

          v73 = (void *)v80;
        }
        while (v80);
      }
      else
      {
        v74 = 0;
      }
      __pattern4._puint64_t i = 0;
      __pattern4._suint64_t i = (NSUInteger)&__pattern4;
      __pattern4._bs = (void *)0x2020000000;
      char v142 = 0;
      v126[0] = MEMORY[0x1E4F143A8];
      v126[1] = 3221225472;
      v126[2] = __32__VMULeakDetector_buildLeakTree__block_invoke_88;
      v126[3] = &unk_1E5D23810;
      v136 = v120;
      id v81 = v74;
      id v127 = v81;
      p_pattern4 = &__pattern4;
      uint64_t v137 = v108;
      id v82 = v115;
      id v128 = v82;
      v83 = v62;
      v129 = v83;
      id v84 = v64;
      id v130 = v84;
      v138 = v110;
      id v134 = v109;
      v131 = self;
      v139 = v119;
      v132 = v114;
      v133 = v116;
      v140 = v118;
      [v82 enumerateReferencesOfNode:v61 withBlock:v126];

      _Block_object_dispose(&__pattern4, 8);
      ++v59;
    }
    while (v59 != *((_DWORD *)v160 + 6));
  }
  v85 = self->_debugTimer;
  if (v85)
  {
    v86 = v119;
    uint64_t v87 = [(VMUDebugTimer *)v85 signpostID];
    v85 = self->_debugTimer;
    if (!v87) {
      goto LABEL_118;
    }
    v88 = [(VMUDebugTimer *)v85 logHandle];
    os_signpost_id_t v89 = [(VMUDebugTimer *)self->_debugTimer signpostID];
    if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v88, OS_SIGNPOST_INTERVAL_END, v89, "buildLeakTree", "", (uint8_t *)&__pattern4, 2u);
    }

    v85 = self->_debugTimer;
  }
  v86 = v119;
LABEL_118:
  [(VMUDebugTimer *)v85 endEvent:"buildLeakTree"];
  free(v111);
  free(v110);
  free(v86);
  free(v120);
  free(v118);

  v90 = self;
  if ([(VMUCallTreeNode *)v112 numChildren]) {
    [(NSMutableArray *)self->_leakTreeRootsArray addObject:v112];
  }
  v91 = self->_debugTimer;
  if (v91)
  {
    uint64_t v92 = [(VMUDebugTimer *)v91 signpostID];
    v91 = self->_debugTimer;
    if (v92)
    {
      v93 = [(VMUDebugTimer *)v91 logHandle];
      os_signpost_id_t v94 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v93, OS_SIGNPOST_INTERVAL_END, v94, "buildLeakTree", "", (uint8_t *)&__pattern4, 2u);
      }

      v90 = self;
      v91 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v91 endEvent:"buildLeakTree"];
  [(VMUDebugTimer *)v90->_debugTimer startWithCategory:"buildLeakTree" message:"addChildCountsIntoNode"];
  v95 = v90->_debugTimer;
  if (v95)
  {
    v96 = [(VMUDebugTimer *)v95 logHandle];
    os_signpost_id_t v97 = [(VMUDebugTimer *)v90->_debugTimer signpostID];
    if (v97 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
    {
      LOWORD(__pattern4._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v96, OS_SIGNPOST_INTERVAL_BEGIN, v97, "buildLeakTree", "addChildCountsIntoNode", (uint8_t *)&__pattern4, 2u);
    }

    v90 = self;
  }
  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  v98 = v90->_leakTreeRootsArray;
  uint64_t v99 = [(NSMutableArray *)v98 countByEnumeratingWithState:&v122 objects:v163 count:16];
  if (v99)
  {
    uint64_t v100 = *(void *)v123;
    do
    {
      for (uint64_t j = 0; j != v99; ++j)
      {
        if (*(void *)v123 != v100) {
          objc_enumerationMutation(v98);
        }
        [*(id *)(*((void *)&v122 + 1) + 8 * j) addChildCountsIntoNode];
      }
      uint64_t v99 = [(NSMutableArray *)v98 countByEnumeratingWithState:&v122 objects:v163 count:16];
    }
    while (v99);
  }

  [(NSMutableArray *)self->_leakTreeRootsArray sortUsingSelector:sel_comparePuttingRetainCycleNodesAtTop_];
  v102 = self->_debugTimer;
  if (v102)
  {
    uint64_t v103 = [(VMUDebugTimer *)v102 signpostID];
    v102 = self->_debugTimer;
    if (v103)
    {
      v104 = [(VMUDebugTimer *)v102 logHandle];
      os_signpost_id_t v105 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v104))
      {
        LOWORD(__pattern4._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v104, OS_SIGNPOST_INTERVAL_END, v105, "buildLeakTree", "", (uint8_t *)&__pattern4, 2u);
      }

      v102 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v102 endEvent:"buildLeakTree"];

  _Block_object_dispose(&v159, 8);
}

void *__32__VMULeakDetector_buildLeakTree__block_invoke(void *result, unsigned int a2)
{
  uint64_t v2 = result[5];
  uint64_t v3 = *(void *)(result[4] + 8);
  uint64_t v4 = *(unsigned int *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  BOOL v5 = (unsigned int *)result[6];
  if (*v5 > a2) {
    *((unsigned char *)v5 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  }
  return result;
}

uint64_t __32__VMULeakDetector_buildLeakTree__block_invoke_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3 >= 2) {
    return [*(id *)(*(void *)(result + 32) + 128) addGroupNodeForNodes:a2 count:a3];
  }
  return result;
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_69(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if ([*(id *)(a1 + 32) isRootNode:a2])
  {
    if ([*(id *)(*(void *)(a1 + 40) + 128) isGroupNode:v2])
    {
      v39[0] = 0;
      v39[1] = v39;
      v39[2] = 0x2020000000;
      int v40 = 0;
      uint64_t v35 = 0;
      long long v36 = &v35;
      uint64_t v37 = 0x2020000000;
      int v38 = 0;
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x2020000000;
      int v34 = 0;
      uint64_t v29 = 0;
      id v30 = &v29;
      uint64_t v31 = 0x2020000000;
      int v32 = -1;
      key = 0;
      p_key = &key;
      uint64_t v25 = 0x3032000000;
      char v26 = __Block_byref_object_copy__2;
      unsigned int v27 = __Block_byref_object_dispose__2;
      id v28 = 0;
      uint64_t v4 = *(void *)(a1 + 40);
      BOOL v5 = *(void **)(v4 + 128);
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      uint64_t v13 = __32__VMULeakDetector_buildLeakTree__block_invoke_70;
      os_signpost_id_t v14 = &unk_1E5D23798;
      uint64_t v15 = v4;
      id v16 = *(id *)(a1 + 48);
      uint64_t v17 = &key;
      uint64_t v18 = &v35;
      os_signpost_id_t v19 = &v29;
      uint64_t v6 = *(void *)(a1 + 88);
      uint64_t v21 = v39;
      uint64_t v22 = v6;
      uint64_t v20 = v33;
      [v5 enumerateMembersOfGroupNode:v2 withBlock:&v11];
      uint64_t v2 = *((unsigned int *)v30 + 6);
      if (*((_DWORD *)v36 + 6) == 6) {
        [*(id *)(a1 + 48) addObject:p_key[5] withObject:v11 withObject:v12 withObject:v13 withObject:v14 withObject:v15];
      }

      _Block_object_dispose(&key, 8);
      _Block_object_dispose(&v29, 8);
      _Block_object_dispose(v33, 8);
      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(v39, 8);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    id v7 = *(void **)(a1 + 56);
    if (v7)
    {
      key = 0;
      p_key = 0;
      uint64_t v25 = 0;
      if (*(void *)(a1 + 64))
      {
        [*(id *)(a1 + 64) nodeDetails:v2];
        id v7 = *(void **)(a1 + 56);
      }
      if ([v7 inspectingLiveProcess:v11 withOptions:v12 withOptions:v13 withOptions:v14 withOptions:v15]
        && [*(id *)(a1 + 56) usesLiteMode])
      {
        uint64_t v8 = [*(id *)(a1 + 64) vmuVMRegionForNode:v2];
        uint64_t v9 = (void *)v8;
        if (v8 && *(_DWORD *)(v8 + 148) == *(_DWORD *)(a1 + 96))
        {
          [*(id *)(a1 + 56) liteMSLPayloadforMallocAddress:key size:(unint64_t)p_key & 0xFFFFFFFFFFFFFFFLL];
          uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
        }
        else
        {
          uint64_t uniquing_table_index = -1;
        }
      }
      else
      {
        uint64_t uniquing_table_index = -1;
      }
      NSMapInsert(*(NSMapTable **)(a1 + 72), key, (const void *)uniquing_table_index);
    }
  }
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_70(void *a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v4 = *(void **)(a1[4] + 128);
  if (v4) {
    [v4 nodeDetails:a2];
  }
  uint64_t v5 = *(void *)(a1[7] + 8);
  if (!*(_DWORD *)(v5 + 24))
  {
    *(_DWORD *)(v5 + 24) = 1;
    *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = v2;
  }
  if (*(_DWORD *)(*(void *)(a1[7] + 8) + 24) != 5) {
    *(_DWORD *)(*(void *)(a1[9] + 8) + 24) = 0;
  }
  uint64_t v6 = (unsigned int *)a1[11];
  if (*v6 > v2) {
    *((unsigned char *)v6 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
  }
  ++*(_DWORD *)(*(void *)(a1[10] + 8) + 24);
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_80(uint64_t a1, char a2, void *key)
{
  if ((a2 & 0x12) != 0)
  {
    if (!NSMapGet(*(NSMapTable **)(a1 + 32), key)) {
      return;
    }
    uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
    uint64_t v6 = *(NSMapTable **)(a1 + 32);
    id v7 = key;
  }
  else
  {
    if ((a2 & 0x24) == 0 || !NSMapGet(*(NSMapTable **)(a1 + 32), key)) {
      return;
    }
    uint64_t v6 = *(NSMapTable **)(a1 + 32);
    id v7 = key;
    uint64_t uniquing_table_index = -1;
  }

  NSMapInsert(v6, v7, (const void *)uniquing_table_index);
}

void __32__VMULeakDetector_buildLeakTree__block_invoke_88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5)
{
  uint64_t v8 = (void *)MEMORY[0x1AD0D9F90]();
  if (VMUIsOwningReference(*((_DWORD *)a5 + 4)))
  {
    id v9 = *(id *)(*(void *)(a1 + 104) + 8 * a4);
    uint64_t v10 = v9;
    if (v9
      && (uint64_t v11 = *(void **)(a1 + 32),
          [v9 name],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v11) = [v11 isEqualToString:v12],
          v12,
          v11))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24))
      {
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v13 = [v10 name];
      os_signpost_id_t v14 = [v13 substringFromIndex:*(void *)(a1 + 112)];

      uint64_t v15 = [@"CYCLE BACK TO " stringByAppendingString:v14];
      uint64_t v16 = [*(id *)(a1 + 40) is64bit];
      long long v17 = a5[1];
      long long v36 = *a5;
      long long v37 = v17;
      uint64_t v38 = *((void *)a5 + 4);
      id v18 = +[VMULeakDetector referenceDescription:&v36 dstDescription:v15 is64bit:v16];

      id v19 = (id)[*(id *)(a1 + 48) addChildWithName:v18 address:0 count:0 numBytes:0 toNode:*(void *)(a1 + 56)];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v20 = *(_DWORD **)(a1 + 120);
      if (*v20 > a4 && ((*((unsigned __int8 *)v20 + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0) {
        goto LABEL_25;
      }
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
      uint64_t v21 = (void *)*((void *)a5 + 4);
      uint64_t v22 = [*(id *)(a1 + 64) nodeDescription:a4 usingDetails:v21];
      uint64_t v23 = *(_DWORD **)(a1 + 128);
      if (*v23 > a4 && ((*((unsigned __int8 *)v23 + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
      {
        uint64_t v24 = [*(id *)(a1 + 72) stringByAppendingString:v22];

        uint64_t v22 = (void *)v24;
      }
      uint64_t v25 = a4;
      uint64_t v26 = [*(id *)(a1 + 40) is64bit];
      long long v27 = a5[1];
      long long v36 = *a5;
      long long v37 = v27;
      uint64_t v38 = *((void *)a5 + 4);
      os_signpost_id_t v14 = +[VMULeakDetector referenceDescription:&v36 dstDescription:v22 is64bit:v26];

      if (!*(unsigned char *)(*(void *)(a1 + 64) + 17) && VMUGraphNodeType_IsVMRegion(v21[1] >> 60))
      {
        id v28 = [*(id *)(a1 + 40) vmuVMRegionForNode:a4];
        uint64_t v29 = v28;
        v21[1] = v21[1] & 0xF000000000000000 | (v28[22] + v28[23] - v28[24]) & 0xFFFFFFFFFFFFFFFLL;
        if (!*(unsigned char *)(*(void *)(a1 + 64) + 16))
        {
          uint64_t v35 = NSString;
          uint64_t v30 = VMUMemorySizeString(v28[23]);
          uint64_t v31 = [v35 stringWithFormat:@"%@  dirty: %s  swapped: %s", v14, v30, VMUMemorySizeString(v29[22])];

          uint64_t v32 = v29[24];
          if (v32)
          {
            os_signpost_id_t v14 = [NSString stringWithFormat:@"%@  purgableVolatile: %s", v31, VMUMemorySizeString(v32)];
          }
          else
          {
            os_signpost_id_t v14 = v31;
          }
        }
      }
      id v18 = *(id *)(a1 + 56);
      v33 = *(void **)(a1 + 48);
      if (*(unsigned char *)(*(void *)(a1 + 64) + 16)) {
        [v33 addChildWithName:v14 address:0 count:1 numBytes:v21[1] & 0xFFFFFFFFFFFFFFFLL toNode:v18];
      }
      else {
      uint64_t v34 = [v33 addUniqueChildWithName:v14 address:*v21 count:1 numBytes:v21[1] & 0xFFFFFFFFFFFFFFFLL toNode:v18 isLeafNode:0];
      }

      *(void *)(*(void *)(a1 + 104) + 8 * v25) = v34;
      if (*(void *)(a1 + 80)) {
        *(void *)(*(void *)(a1 + 136) + 8 * v25) = *(void *)(a1 + 48);
      }
      uint64_t v10 = (void *)v34;
    }

    goto LABEL_25;
  }
LABEL_26:
}

+ (id)consolidatedRootLeakDescriptionsForTree:(id)a3
{
  return +[VMULeakDetector _consolidatedRootLeakDescriptionsForTree:a3];
}

+ (id)_consolidatedRootLeakDescriptionsForTree:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_consolidatedRootLeakDescriptionsForTree__onceToken != -1) {
    dispatch_once(&_consolidatedRootLeakDescriptionsForTree__onceToken, &__block_literal_global_2);
  }
  uint64_t v4 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v31 = v3;
  uint64_t v5 = [v3 sortedChildren];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v11 = [v10 name];
        int v12 = [v11 containsString:@": 0x"];

        if (v12)
        {
          uint64_t v13 = _consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex;
          os_signpost_id_t v14 = [v10 name];
          uint64_t v15 = [v10 name];
          uint64_t v16 = [v15 length];
          long long v17 = (void *)v13;
          id v18 = v14;
          id v19 = @"$1: malloc[$2]";
        }
        else
        {
          uint64_t v20 = [v10 name];
          int v21 = [v20 containsString:@": VM: "];

          if (v21)
          {
            uint64_t v22 = _consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex;
            os_signpost_id_t v14 = [v10 name];
            uint64_t v15 = [v10 name];
            uint64_t v16 = [v15 length];
            long long v17 = (void *)v22;
            id v18 = v14;
            id v19 = @"$1: $2";
          }
          else
          {
            uint64_t v23 = _consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex;
            os_signpost_id_t v14 = [v10 name];
            uint64_t v15 = [v10 name];
            uint64_t v16 = [v15 length];
            long long v17 = (void *)v23;
            id v18 = v14;
            id v19 = @"$1: <$2>";
          }
        }
        uint64_t v24 = [v17 stringByReplacingMatchesInString:v18 options:0 range:0 withTemplate:v16];

        int v25 = [v10 count];
        uint64_t v26 = v25 - [v10 sumOfChildCounts];
        long long v27 = [v4 objectForKeyedSubscript:v24];
        id v28 = v27;
        if (v27) {
          uint64_t v26 = [v27 unsignedIntValue] + v26;
        }
        uint64_t v29 = [NSNumber numberWithUnsignedInt:v26];
        [v4 setObject:v29 forKeyedSubscript:v24];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }

  return v4;
}

void __60__VMULeakDetector__consolidatedRootLeakDescriptionsForTree___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(ROOT LEAK|CYCLE): 0x[0-9a-f]+ \\[(.*)\\].*" options:0 error:0];
  v1 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakMallocTypeNameRegex = v0;

  uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(ROOT LEAK|CYCLE): (VM: .*)  0x.*" options:0 error:0];
  id v3 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakVMRegionTypeNameRegex = v2;

  uint64_t v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(ROOT LEAK|CYCLE): <(.*) 0x[0-9a-f]+>* \\[\\d+\\].*" options:0 error:0];
  uint64_t v5 = (void *)_consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex;
  _consolidatedRootLeakDescriptionsForTree__rootLeakTypeNameRegex = v4;
}

- (void)printLeakTree
{
  uint64_t v2 = self;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v4 = [(VMUDebugTimer *)debugTimer signpostID];
    debugTimer = v2->_debugTimer;
    if (v4)
    {
      uint64_t v5 = [(VMUDebugTimer *)debugTimer logHandle];
      uint64_t v6 = [(VMUDebugTimer *)v2->_debugTimer signpostID];
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v5, OS_SIGNPOST_INTERVAL_END, v7, "printLeakTree", "", buf, 2u);
        }
      }

      debugTimer = v2->_debugTimer;
    }
  }
  [(VMUDebugTimer *)debugTimer endEvent:"printLeakTree"];
  [(VMUDebugTimer *)v2->_debugTimer startWithCategory:"printLeakTree" message:""];
  uint64_t v8 = v2->_debugTimer;
  if (v8)
  {
    id v9 = [(VMUDebugTimer *)v8 logHandle];
    uint64_t v10 = [(VMUDebugTimer *)v2->_debugTimer signpostID];
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "printLeakTree", "", buf, 2u);
      }
    }
  }
  if ([(NSMutableArray *)v2->_leakTreeRootsArray count] == 1) {
    uint64_t v12 = 74;
  }
  else {
    uint64_t v12 = 76;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v2->_leakTreeRootsArray;
  uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v55;
    uint64_t v43 = *(void *)v55;
    uint64_t v44 = v12;
    do
    {
      uint64_t v16 = 0;
      uint64_t v45 = v14;
      do
      {
        if (*(void *)v55 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v54 + 1) + 8 * v16);
        if (v2->_stackLogReader)
        {
          id v18 = [*(id *)(*((void *)&v54 + 1) + 8 * v16) backtraceString];
          id v19 = v17;
          uint64_t v20 = VMUBacktraceIsExcludedMarker;

          if (v18 == v20)
          {
            v2->_numExcluded += [v19 count];
            goto LABEL_41;
          }
          uint64_t v48 = v16;
          int v21 = [v19 backtraceString];
          uint64_t v22 = [v21 length];

          long long v17 = v19;
          if (v22)
          {
            os_signpost_id_t v46 = v19;
            uint64_t v23 = +[VMULeakDetector _consolidatedRootLeakDescriptionsForTree:v19];
            uint64_t v24 = [v23 keysSortedByValueUsingComparator:&__block_literal_global_135];
            id v25 = [v24 lastObject];
            uint64_t v26 = v2;
            [(VMULeakDetector *)v2 printout:"STACK OF "];
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v49 = v24;
            uint64_t v27 = [v49 countByEnumeratingWithState:&v50 objects:v59 count:16];
            if (v27)
            {
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v51;
              do
              {
                for (uint64_t i = 0; i != v28; ++i)
                {
                  if (*(void *)v51 != v29) {
                    objc_enumerationMutation(v49);
                  }
                  uint64_t v31 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                  long long v32 = [v23 objectForKeyedSubscript:v31];
                  uint64_t v33 = [v32 unsignedIntValue];

                  if (v33 <= 1) {
                    long long v34 = "INSTANCE";
                  }
                  else {
                    long long v34 = "INSTANCES";
                  }
                  id v35 = v31;
                  -[VMULeakDetector printout:](v26, "printout:", "%u %s OF '%s'", v33, v34, [v35 UTF8String]);
                  if (v35 == v25) {
                    long long v36 = ":";
                  }
                  else {
                    long long v36 = ", ";
                  }
                  [(VMULeakDetector *)v26 printout:v36];
                }
                uint64_t v28 = [v49 countByEnumeratingWithState:&v50 objects:v59 count:16];
              }
              while (v28);
            }

            id v37 = [v46 backtraceString];
            -[VMULeakDetector printout:](v26, "printout:", "%s\n", [v37 UTF8String]);

            long long v17 = v46;
            uint64_t v2 = v26;

            uint64_t v12 = v44;
            uint64_t v14 = v45;
            uint64_t v15 = v43;
          }
          else
          {
            [(VMULeakDetector *)v2 printout:"NO STACK\n"];
          }
          [(VMULeakDetector *)v2 printout:"====\n"];
          uint64_t v16 = v48;
        }
        [v17 printCallTreeToFile:v2->_outputFile cumulativeOutput:v2->_outputString options:v12];
        [(VMULeakDetector *)v2 printout:"\n"];
LABEL_41:
        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = [(NSMutableArray *)obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v14);
  }

  uint64_t v38 = v2->_debugTimer;
  if (v38)
  {
    uint64_t v39 = [(VMUDebugTimer *)v38 signpostID];
    uint64_t v38 = v2->_debugTimer;
    if (v39)
    {
      int v40 = [(VMUDebugTimer *)v38 logHandle];
      uint64_t v41 = [(VMUDebugTimer *)v2->_debugTimer signpostID];
      if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v42 = v41;
        if (os_signpost_enabled(v40))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v40, OS_SIGNPOST_INTERVAL_END, v42, "printLeakTree", "", buf, 2u);
        }
      }

      uint64_t v38 = v2->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v38 endEvent:"printLeakTree"];
}

uint64_t __32__VMULeakDetector_printLeakTree__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (unsigned)detectLeaksWithError:(id *)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __40__VMULeakDetector_detectLeaksWithError___block_invoke;
  v35[3] = &unk_1E5D23858;
  v35[4] = self;
  v35[5] = &v40;
  v35[6] = &v36;
  uint64_t v5 = (void *)MEMORY[0x1AD0DA230](v35, a2);
  [(VMUObjectGraph *)self->_graph enumerateObjectsWithBlock:v5];
  self->_allocationsCount = *((_DWORD *)v37 + 6);
  self->_allocationsSize = v41[3];
  if (![(VMULeakDetector *)self checkTaskExistence])
  {
LABEL_25:
    unsigned int v22 = 0;
    goto LABEL_26;
  }
  if (!self->_allocationsCount)
  {
    if (a3)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = @"message";
      v45[0] = @"unable to inspect heap ranges of target process; it may be using a malloc replacement library without the required support";
      uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      *a3 = [v23 errorWithDomain:@"VMULeakDetectorDomain" code:1 userInfo:v24];
    }
    goto LABEL_25;
  }
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v7 = [(VMUDebugTimer *)debugTimer signpostID];
    debugTimer = self->_debugTimer;
    if (v7)
    {
      uint64_t v8 = [(VMUDebugTimer *)debugTimer logHandle];
      os_signpost_id_t v9 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v8, OS_SIGNPOST_INTERVAL_END, v9, "VMULeakDetector", "", buf, 2u);
      }

      debugTimer = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)debugTimer endEvent:"VMULeakDetector"];
  [(VMUDebugTimer *)self->_debugTimer startWithCategory:"VMULeakDetector" message:"scan for leaks"];
  uint64_t v10 = self->_debugTimer;
  if (v10)
  {
    os_signpost_id_t v11 = [(VMUDebugTimer *)v10 logHandle];
    os_signpost_id_t v12 = [(VMUDebugTimer *)self->_debugTimer signpostID];
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "VMULeakDetector", "scan for leaks", buf, 2u);
    }
  }
  unsigned int v13 = [(VMUDirectedGraph *)self->_graph nodeNamespaceSize];
  uint64_t v14 = malloc_type_calloc(1uLL, ((v13 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v14 = v13;
  [(VMULeakDetector *)self setLeakedNodes:v14];
  if (self->_checkAbandoned) {
    [(VMULeakDetector *)self setAbandoned:[(VMUProcessObjectGraph *)self->_graph copyUserMarked]];
  }
  graph = self->_graph;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __40__VMULeakDetector_detectLeaksWithError___block_invoke_158;
  uint64_t v29 = &unk_1E5D23880;
  uint64_t v30 = self;
  long long v32 = &v40;
  uint64_t v33 = &v36;
  id v31 = v5;
  VMUWithRootNodeMarkingMap(graph, &v26);
  uint64_t v16 = self->_debugTimer;
  if (v16)
  {
    uint64_t v17 = [(VMUDebugTimer *)v16 signpostID];
    uint64_t v16 = self->_debugTimer;
    if (v17)
    {
      id v18 = [(VMUDebugTimer *)v16 logHandle];
      os_signpost_id_t v19 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v18, OS_SIGNPOST_INTERVAL_END, v19, "VMULeakDetector", "", buf, 2u);
      }

      uint64_t v16 = self->_debugTimer;
    }
  }
  -[VMUDebugTimer endEvent:](v16, "endEvent:", "VMULeakDetector", v26, v27, v28, v29, v30);
  unsigned int leakedAllocationsCount = self->_leakedAllocationsCount;
  unsigned int numExcluded = self->_numExcluded;

  unsigned int v22 = leakedAllocationsCount - numExcluded;
LABEL_26:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  return v22;
}

BOOL __40__VMULeakDetector_detectLeaksWithError___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1[4] + 8) || !(BOOL result = VMUGraphNodeType_IsVMRegion(*(void *)(a3 + 8) >> 60)))
  {
    BOOL result = VMUGraphNodeType_IsRoot(*(void *)(a3 + 8) >> 60);
    if (!result)
    {
      *(void *)(*(void *)(a1[5] + 8) + 24) += *(void *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL;
      ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
    }
  }
  return result;
}

uint64_t __40__VMULeakDetector_detectLeaksWithError___block_invoke_158(void *a1, uint64_t a2)
{
  [*(id *)(a1[4] + 48) markReachableNodesFromRoots:a2 inMap:*(void *)(a1[4] + 112) options:*(unsigned __int8 *)(a1[4] + 8)];
  id v3 = *(_DWORD **)(a1[4] + 112);
  int v4 = *v3;
  unint64_t v5 = (*v3 + 7);
  if (v5 >= 8)
  {
    uint64_t v6 = v3 + 1;
    uint64_t v7 = v5 >> 3;
    if (v5 >> 3 <= 1) {
      uint64_t v7 = 1;
    }
    do
    {
      *uint64_t v6 = ~*v6;
      ++v6;
      --v7;
    }
    while (v7);
  }
  int v8 = v4 & 7;
  if (v8) {
    *((unsigned char *)v3 + (v5 >> 3) + 3) ^= -1 << v8;
  }
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = 0;
  *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  [*(id *)(a1[4] + 48) enumerateMarkedObjects:*(void *)(a1[4] + 112) withBlock:a1[5]];
  *(_DWORD *)(a1[4] + 144) = *(_DWORD *)(*(void *)(a1[7] + 8) + 24);
  *(void *)(a1[4] + 160) = *(void *)(*(void *)(a1[6] + 8) + 24);
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = 0;
  *(void *)(*(void *)(a1[6] + 8) + 24) = 0;
  uint64_t result = [*(id *)(a1[4] + 48) enumerateMarkedObjects:*(void *)(a1[4] + 104) withBlock:a1[5]];
  *(_DWORD *)(a1[4] + 148) = *(_DWORD *)(*(void *)(a1[7] + 8) + 24);
  *(void *)(a1[4] + 168) = *(void *)(*(void *)(a1[6] + 8) + 24);
  return result;
}

- (unsigned)doNormalLeakDetectionWithError:(id *)a3
{
  -[VMULeakDetector detectLeaksWithError:](self, "detectLeaksWithError:");
  if (*a3) {
    return 0;
  }
  unsigned int result = [(VMULeakDetector *)self checkTaskExistence];
  if (result)
  {
    -[VMULeakDetector printout:](self, "printout:", "Process %d: %u nodes malloced for %llu KB\n", [(VMUProcessObjectGraph *)self->_graph pid], self->_allocationsCount, (self->_allocationsSize + 1023) >> 10);
    uint64_t v6 = [(VMUProcessObjectGraph *)self->_graph pid];
    uint64_t leakedAllocationsCount = self->_leakedAllocationsCount;
    if (leakedAllocationsCount == 1) {
      int v8 = "";
    }
    else {
      int v8 = "s";
    }
    -[VMULeakDetector printout:](self, "printout:", "Process %d: %u leak%s for %llu total leaked bytes.\n", v6, leakedAllocationsCount, v8, self->_leakedAllocationsSize);
    if (self->_abandonedSize)
    {
      uint64_t v9 = [(VMUProcessObjectGraph *)self->_graph pid];
      uint64_t abandonedCount = self->_abandonedCount;
      if (abandonedCount == 1) {
        os_signpost_id_t v11 = "";
      }
      else {
        os_signpost_id_t v11 = "s";
      }
      -[VMULeakDetector printout:](self, "printout:", "Process %d: %u object%s abandoned for %llu total abandoned bytes.\n", v9, abandonedCount, v11, self->_abandonedSize);
    }
    if (!self->_suppressOutput)
    {
      [(VMULeakDetector *)self printout:"\n"];
      if (self->_abandoned || self->_showListOfLeaks)
      {
        graph = self->_graph;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __50__VMULeakDetector_doNormalLeakDetectionWithError___block_invoke;
        v16[3] = &unk_1E5D238A8;
        v16[4] = self;
        VMUEnumerateVMAnnotatedMallocObjectsWithBlock(graph, v16);
      }
      else
      {
        [(VMULeakDetector *)self buildLeakTree];
        if ([(VMULeakDetector *)self outputFile]
          || ([(VMULeakDetector *)self outputString],
              uint64_t v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              v15))
        {
          [(VMULeakDetector *)self printLeakTree];
        }
      }
    }
    unsigned int numExcluded = self->_numExcluded;
    if (numExcluded)
    {
      if (numExcluded == 1) {
        uint64_t v14 = "";
      }
      else {
        uint64_t v14 = "s";
      }
      -[VMULeakDetector printout:](self, "printout:", "\n%u leak%s excluded (not printed)\n", self->_numExcluded, v14);
    }
    if ([(VMULeakDetector *)self outputFile]) {
      fflush([(VMULeakDetector *)self outputFile]);
    }
    return self->_leakedAllocationsCount - self->_numExcluded;
  }
  return result;
}

void *__50__VMULeakDetector_doNormalLeakDetectionWithError___block_invoke(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4, uint64_t a5)
{
  unsigned int result = *(void **)(a1 + 32);
  uint64_t v6 = (_DWORD *)result[14];
  if (*v6 > a2 && ((*((unsigned __int8 *)v6 + (a2 >> 3) + 4) >> (a2 & 7)) & 1) != 0)
  {
    long long v9 = *a3;
    uint64_t v10 = *((void *)a3 + 2);
    uint64_t v7 = "Leak";
    return (void *)[result printLeak:v7 node:a2 details:&v9 region:a4 stop:a5];
  }
  int v8 = (_DWORD *)result[13];
  if (v8 && *v8 > a2 && ((*((unsigned __int8 *)v8 + (a2 >> 3) + 4) >> (a2 & 7)) & 1) != 0)
  {
    long long v9 = *a3;
    uint64_t v10 = *((void *)a3 + 2);
    uint64_t v7 = "Abandoned";
    return (void *)[result printLeak:v7 node:a2 details:&v9 region:a4 stop:a5];
  }
  return result;
}

- (void)dealloc
{
  abandoned = self->_abandoned;
  if (abandoned)
  {
    free(abandoned);
    self->_abandoned = 0;
  }
  leakedNodes = self->_leakedNodes;
  if (leakedNodes)
  {
    free(leakedNodes);
    self->_leakedNodes = 0;
  }
  if (self->_fcloseOutput)
  {
    outputFile = self->_outputFile;
    if (outputFile)
    {
      fclose(outputFile);
      self->_outputFile = 0;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)VMULeakDetector;
  [(VMULeakDetector *)&v6 dealloc];
}

- (BOOL)showLeakedVMregions
{
  return self->_showLeakedVMregions;
}

- (void)setShowLeakedVMregions:(BOOL)a3
{
  self->_showLeakedVMregions = a3;
}

- (BOOL)showContext
{
  return self->_showContext;
}

- (void)setShowContext:(BOOL)a3
{
  self->_showContext = a3;
}

- (BOOL)showOnlyVMregions
{
  return self->_showOnlyVMregions;
}

- (void)setShowOnlyVMregions:(BOOL)a3
{
  self->_showOnlyVMregions = a3;
}

- (BOOL)fullStacks
{
  return self->_fullStacks;
}

- (void)setFullStacks:(BOOL)a3
{
  self->_fullStacks = a3;
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (BOOL)showBinaryContents
{
  return self->_showBinaryContents;
}

- (void)setShowBinaryContents:(BOOL)a3
{
  self->_BOOL showBinaryContents = a3;
}

- (BOOL)checkAbandoned
{
  return self->_checkAbandoned;
}

- (void)setCheckAbandoned:(BOOL)a3
{
  self->_checkAbandoned = a3;
}

- (BOOL)suppressOutput
{
  return self->_suppressOutput;
}

- (void)setSuppressOutput:(BOOL)a3
{
  self->_suppressOutput = a3;
}

- (BOOL)showListOfLeaks
{
  return self->_showListOfLeaks;
}

- (void)setShowListOfLeaks:(BOOL)a3
{
  self->_showListOfLeaks = a3;
}

- (BOOL)groupByType
{
  return self->_groupByType;
}

- (void)setGroupByType:(BOOL)a3
{
  self->_groupByType = a3;
}

- (BOOL)referenceTreeShowRegionVirtualSize
{
  return self->_referenceTreeShowRegionVirtualSize;
}

- (void)setReferenceTreeShowRegionVirtualSize:(BOOL)a3
{
  self->_referenceTreeShowRegionVirtualSize = a3;
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
}

- (__sFILE)outputFile
{
  return self->_outputFile;
}

- (void)setOutputFile:(__sFILE *)a3
{
  self->_outputFile = a3;
}

- (NSMutableString)outputString
{
  return self->_outputString;
}

- (void)setOutputString:(id)a3
{
}

- (BOOL)fcloseOutput
{
  return self->_fcloseOutput;
}

- (void)setFcloseOutput:(BOOL)a3
{
  self->_fcloseOutput = a3;
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_objectContentLevel = a3;
}

- (VMUTask)task
{
  return self->_task;
}

- (VMUProcessObjectGraph)graph
{
  return self->_graph;
}

- (VMUTaskMemoryScanner)scanner
{
  return self->_scanner;
}

- (VMUStackLogReader)stackLogReader
{
  return self->_stackLogReader;
}

- (void)abandoned
{
  return self->_abandoned;
}

- (void)setAbandoned:(void *)a3
{
  self->_abandoned = a3;
}

- (void)leakedNodes
{
  return self->_leakedNodes;
}

- (void)setLeakedNodes:(void *)a3
{
  self->_leakedNodes = a3;
}

- (NSMutableArray)leakTreeRootsArray
{
  return self->_leakTreeRootsArray;
}

- (void)setLeakTreeRootsArray:(id)a3
{
}

- (VMUProcessObjectGraph)leakedGraph
{
  return self->_leakedGraph;
}

- (void)setLeakedGraph:(id)a3
{
}

- (unsigned)allocationsCount
{
  return self->_allocationsCount;
}

- (void)setAllocationsCount:(unsigned int)a3
{
  self->_allocationsCount = a3;
}

- (unint64_t)allocationsSize
{
  return self->_allocationsSize;
}

- (void)setAllocationsSize:(unint64_t)a3
{
  self->_allocationsSize = a3;
}

- (unsigned)leakedAllocationsCount
{
  return self->_leakedAllocationsCount;
}

- (void)setLeakedAllocationsCount:(unsigned int)a3
{
  self->_uint64_t leakedAllocationsCount = a3;
}

- (unint64_t)leakedAllocationsSize
{
  return self->_leakedAllocationsSize;
}

- (void)setLeakedAllocationsSize:(unint64_t)a3
{
  self->_leakedAllocationsSize = a3;
}

- (unsigned)abandonedCount
{
  return self->_abandonedCount;
}

- (void)setAbandonedCount:(unsigned int)a3
{
  self->_uint64_t abandonedCount = a3;
}

- (unint64_t)abandonedSize
{
  return self->_abandonedSize;
}

- (void)setAbandonedSize:(unint64_t)a3
{
  self->_abandonedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leakedGraph, 0);
  objc_storeStrong((id *)&self->_leakTreeRootsArray, 0);
  objc_storeStrong((id *)&self->_outputString, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_stackLogReader, 0);

  objc_storeStrong((id *)&self->_debugTimer, 0);
}

- (void)printout:.cold.1()
{
}

@end