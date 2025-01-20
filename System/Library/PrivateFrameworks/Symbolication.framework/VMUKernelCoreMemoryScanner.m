@interface VMUKernelCoreMemoryScanner
+ (void)initialize;
- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUKernelCoreMemoryScanner *)self;
- (BOOL)abandonedMarkingEnabled;
- (BOOL)addAllNodesFromTaskWithError:(id *)a3;
- (BOOL)addMallocNodesFromTaskWithError:(id *)a3;
- (BOOL)addRootNodesFromTaskWithError:(id *)a3;
- (BOOL)addressIsInDataSegment:(unint64_t)a3;
- (BOOL)exactScanningEnabled;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (BOOL)hasLabelsForNodes;
- (BOOL)is64bit;
- (BOOL)isTranslatedByRosetta;
- (BOOL)recordRuntimeMetadataChunkInfo;
- (BOOL)showRawClassNames;
- (NSDictionary)ledger;
- (NSString)binaryImagesDescription;
- (NSString)executablePath;
- (NSString)processDescriptionString;
- (NSString)processName;
- (VMUClassInfoMap)realizedClasses;
- (VMUDebugTimer)debugTimer;
- (VMUKernelCoreMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4;
- (VMUObjectIdentifier)objectIdentifier;
- (VMUScanOverlay)scanOverlay;
- (VMUTaskMemoryCache)memoryCache;
- (_VMUBlockNode)blocks;
- (_VMURegionNode)regions;
- (id)_cachedVariantForGenericInfo:(id)a3 variantKey:(unint64_t)a4;
- (id)_readonlyRegionRanges;
- (id)_typeNameForZoneName:(id)a3;
- (id)classInfoForObjectAtAddress:(unint64_t)a3;
- (id)labelForNode:(unsigned int)a3;
- (id)processSnapshotGraph;
- (id)processSnapshotGraphWithOptions:(unint64_t)a3;
- (id)shortLabelForNode:(unsigned int)a3;
- (id)vmuTask;
- (id)vmuVMRegionForAddress:(unint64_t)a3;
- (id)vmuVMRegionForNode:(unsigned int)a3;
- (id)zoneNameForIndex:(unsigned int)a3;
- (id)zoneNameForNode:(unsigned int)a3;
- (int)pid;
- (unint64_t)_lengthOfMappedFileOfRegion:(id)a3;
- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (unint64_t)maxInteriorOffset;
- (unint64_t)physicalFootprint;
- (unint64_t)physicalFootprintPeak;
- (unint64_t)suspendTimeContinuous;
- (unsigned)_indexForClassInfo:(id)a3;
- (unsigned)_nodeForAddress:(unint64_t)a3 checkMaxInteriorOffset:(BOOL)a4;
- (unsigned)_removeFalsePositiveLeakedVMregionsFromNodes:(unsigned int *)a3 nodeCount:(unsigned int)a4 recorder:(id)a5;
- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4;
- (unsigned)enumerateObjectsWithBlock:(id)a3;
- (unsigned)enumerateReferencesWithBlock:(id)a3;
- (unsigned)enumerateRegionsWithBlock:(id)a3;
- (unsigned)idleExitStatus;
- (unsigned)kernelPageSize;
- (unsigned)mallocNodeCount;
- (unsigned)nodeCount;
- (unsigned)nodeForAddress:(unint64_t)a3;
- (unsigned)nodeNamespaceSize;
- (unsigned)objectContentLevel;
- (unsigned)regionCount;
- (unsigned)scanningMask;
- (unsigned)vmPageSize;
- (unsigned)zoneCount;
- (void)_addThreadNodesFromTask;
- (void)_buildRegionFirstBlockIndexOnPageArrays;
- (void)_callRemoteMallocEnumerators:(unsigned int)a3 block:(id)a4;
- (void)_destroyLinearClassInfos;
- (void)_enumerateZallocZones:(BOOL)a3 blocks:(BOOL)a4;
- (void)_findMarkedAbandonedBlocks;
- (void)_fixupBlockIsas;
- (void)_identifyNonObjectsPointedToByTypedIvars:(unsigned int)a3;
- (void)_identifyNonObjectsUsingStackBacktrace;
- (void)_registerVariant:(id)a3 forGenericInfo:(id)a4 variantKey:(unint64_t)a5;
- (void)_shortenScannableRangeOfMappedFile:(unsigned int)a3;
- (void)_sortAndClassifyBlocks;
- (void)_sortBlocks;
- (void)_updateLinearClassInfos;
- (void)_withMemoryReaderBlock:(id)a3;
- (void)_withOrderedNodeMapper:(id)a3;
- (void)addMallocNodes:(id)a3;
- (void)addMallocNodesFromTask;
- (void)addRootNodesFromTask;
- (void)applyTypeOverlayToMutableInfo:(id)a3;
- (void)contentForNode:(unsigned int)a3;
- (void)copyUserMarked;
- (void)dealloc;
- (void)printRuntimeMetadataInfo;
- (void)refineTypesWithOverlay:(id)a3;
- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:;
- (void)scanNodesWithReferenceRecorder:(id)a3;
- (void)setAbandonedMarkingEnabled:(BOOL)a3;
- (void)setClassStructureFieldScanValueAtSourceAddress:(void *)a3 toCorrectedAddress:(void *)a4;
- (void)setDebugTimer:(id)a3;
- (void)setExactScanningEnabled:(BOOL)a3;
- (void)setMaxInteriorOffset:(unint64_t)a3;
- (void)setNodeScanningLogger:(id)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setRecordRuntimeMetadataChunkInfo:(BOOL)a3;
- (void)setReferenceScanningLogger:(id)a3;
- (void)setScanningMask:(unsigned int)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)unmapAllRegions;
@end

@implementation VMUKernelCoreMemoryScanner

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = getenv("VMUEnumeratorValidation");
    BOOL v6 = 0;
    if (v2)
    {
      int v3 = *v2;
      BOOL v4 = (v3 - 48) > 0x3E || ((1 << (v3 - 48)) & 0x4000000040000001) == 0;
      if (v4 && v3 != 0) {
        BOOL v6 = 1;
      }
    }
    s_enumeratorDebugging_0 = v6;
  }
}

- (id)vmuTask
{
  return self->_task;
}

- (void)unmapAllRegions
{
  if (self->_regionsCount)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      regions = self->_regions;
      BOOL v6 = self->_memoryCache;
      v7 = v6;
      if (regions[v3].var7)
      {
        if (&regions[v3] == regions[v3].var8)
        {
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = ___unmapRegion_block_invoke_0;
          v10[3] = &unk_1E5D235B0;
          v11 = v6;
          v12 = &regions[v3];
          v13 = regions;
          v9 = (void (**)(void))MEMORY[0x1AD0DA230](v10);
          v9[2]();
        }
        else
        {
          v8 = &regions[v3];
          v8->var6 = 0;
          v8->var7 = 0;
          v8->var8 = 0;
        }
      }

      ++v4;
      ++v3;
    }
    while (v4 < self->_regionsCount);
  }
  [(VMUTaskMemoryCache *)self->_memoryCache flushMemoryCache];
  [(VMUObjectIdentifier *)self->_objectIdentifier flushRemoteMirrorMemoryCache];
}

- (VMUKernelCoreMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v121 = a3;
  v138.receiver = self;
  v138.super_class = (Class)VMUKernelCoreMemoryScanner;
  v7 = [(VMUKernelCoreMemoryScanner *)&v138 init];

  if (!v7)
  {
    v12 = 0;
LABEL_126:
    v117 = v121;
    v12 = v12;
    v116 = v12;
    goto LABEL_127;
  }
  v123 = +[VMUDebugTimer sharedTimerIfCreated];
  p_task = (id *)&v7->_task;
  objc_storeStrong((id *)&v7->_task, a3);
  v7->_pid = -1;
  if (v123)
  {
    if ([v123 signpostID])
    {
      v8 = [v123 logHandle];
      os_signpost_id_t v9 = [v123 signpostID];
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v8, OS_SIGNPOST_INTERVAL_END, v9, "initMemoryScanner", "", buf, 2u);
      }
    }
    [v123 endEvent:"initMemoryScanner"];
    [v123 startWithCategory:"initMemoryScanner" message:"building VMUProcessDescription"];
    v10 = [v123 logHandle];
    os_signpost_id_t v11 = [v123 signpostID];
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v11, "initMemoryScanner", "building VMUProcessDescription", buf, 2u);
    }
  }
  else
  {
    [0 endEvent:"initMemoryScanner"];
    [0 startWithCategory:"initMemoryScanner" message:"building VMUProcessDescription"];
  }
  v122 = [*p_task processDescription];
  if (v122)
  {
    uint64_t v13 = [v122 description];
    processDescriptionString = v7->_processDescriptionString;
    v7->_processDescriptionString = (NSString *)v13;

    uint64_t v15 = [v122 date];
    suspendDate = v7->_suspendDate;
    v7->_suspendDate = (NSDate *)v15;

    uint64_t v17 = [v122 processName];
    processName = v7->_processName;
    v7->_processName = (NSString *)v17;

    if ((a4 & 0x8000) != 0)
    {
      uint64_t v19 = [v122 binaryImagesDescription];
      binaryImagesDescription = v7->_binaryImagesDescription;
      v7->_binaryImagesDescription = (NSString *)v19;
    }
    uint64_t v21 = [v122 executablePath];
    executablePath = v7->_executablePath;
    v7->_executablePath = (NSString *)v21;

    v7->_physicalFootprint = [v122 physicalFootprint];
    v7->_physicalFootprintPeak = [v122 physicalFootprintPeak];
    v7->_idleExitStatus = [v122 idleExitStatus];
  }
  uint64_t v23 = +[VMUProcessLedger ledgerForVMUTask:v7->_task];
  ledger = v7->_ledger;
  v7->_ledger = (NSDictionary *)v23;

  if (v123 && [v123 signpostID])
  {
    v25 = [v123 logHandle];
    os_signpost_id_t v26 = [v123 signpostID];
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v25, OS_SIGNPOST_INTERVAL_END, v26, "initMemoryScanner", "", buf, 2u);
    }
  }
  [v123 endEvent:"initMemoryScanner"];
  mach_get_times();
  v7->_maxInteriorOffset = *MEMORY[0x1E4F14B00];
  v7->_scanningMask = VMUScanningMaskForOwningReferences();
  v7->_exactScanningEnabled = 1;
  v7->_abandonedMarkingEnabled = 1;
  uint64_t v27 = objc_opt_new();
  mappedFileNameToLengthDict = v7->_mappedFileNameToLengthDict;
  v7->_mappedFileNameToLengthDict = (NSMutableDictionary *)v27;

  unint64_t v119 = VMUGetFlagsForAllVMRegionStatistics() | a4 | 0x180;
  v29 = -[VMUVMRegionIdentifier initWithVMUTask:options:]([VMUVMRegionIdentifier alloc], "initWithVMUTask:options:", v7->_task);
  regionIdentifier = v7->_regionIdentifier;
  v7->_regionIdentifier = v29;

  v124 = [(VMUVMRegionIdentifier *)v7->_regionIdentifier regions];
  unsigned int v31 = [v124 count];
  v7->_unint64_t regionsCount = v31;
  if (!v31) {
    goto LABEL_116;
  }
  regions = (_VMURegionNode *)malloc_type_calloc(v31, 0x40uLL, 0x10B0040310C8A7FuLL);
  v7->_regions = regions;
  if (v7->_regionsCount)
  {
    uint64_t v33 = 0;
    unint64_t v34 = 0;
    do
    {
      id v35 = (id)[v124 objectAtIndexedSubscript:v34];
      regions = v7->_regions;
      regions[v33].var0 = v35;
      ++v34;
      unint64_t regionsCount = v7->_regionsCount;
      ++v33;
    }
    while (v34 < regionsCount);
  }
  else
  {
    LODWORD(regionsCount) = 0;
  }
  v37 = (_VMURegionMap *)malloc_type_calloc(1uLL, 0x200040uLL, 0x30B8EA24uLL);
  v37->unint64_t var6 = -1;
  v38 = malloc_type_calloc(1uLL, 0x800004uLL, 0xFF42C4F3uLL);
  _DWORD *v38 = 0x4000000;
  v37->var3 = v38;
  v37->var4 = regions;
  v37->var5 = regionsCount;
  if (regionsCount)
  {
    uint64_t v39 = 0;
    v40 = (_DWORD *)MEMORY[0x1E4F14AF8];
    do
    {
      p_var0 = &regions[v39].var0;
      if (([*p_var0 isSpecialPhysFootprintRegion] & 1) == 0)
      {
        unint64_t v42 = *((void *)*p_var0 + 1);
        unint64_t v43 = *((void *)*p_var0 + 2) + v42;
        unint64_t var6 = v37->var6;
        unint64_t var7 = v37->var7;
        if (var6 >= v42) {
          unint64_t var6 = *((void *)*p_var0 + 1);
        }
        if (var7 <= v43) {
          unint64_t var7 = *((void *)*p_var0 + 2) + *((void *)*p_var0 + 1);
        }
        v37->unint64_t var6 = var6;
        v37->unint64_t var7 = var7;
        unint64_t v46 = v42 >> *v40;
        if (v46)
        {
          unint64_t v47 = (~*MEMORY[0x1E4F14AF0] & (*MEMORY[0x1E4F14AF0] + v43)) >> *v40;
          do
          {
            if (v46 + 1 > v47) {
              unint64_t v48 = v46 + 1;
            }
            else {
              unint64_t v48 = v47;
            }
            var3 = (unsigned int *)v37->var3;
            unsigned int v50 = v46 & 0x3FFFFFF;
            unsigned int v51 = *var3;
            if (*var3 > (v46 & 0x3FFFFFF))
            {
              unsigned int v52 = ((v48 - v46) & 0x3FFFFFF) + v50;
              if (v51 < v52) {
                unsigned int v52 = *var3;
              }
              unsigned int v53 = (v50 + 7) & 0x7FFFFF8;
              if (v53 >= v52) {
                unsigned int v53 = v52;
              }
              if (v50 < v53)
              {
                do
                {
                  if (v51 > v50) {
                    *((unsigned char *)var3 + (v50 >> 3) + 4) |= 1 << (v50 & 7);
                  }
                  ++v50;
                }
                while (v53 != v50);
                unsigned int v50 = v53;
              }
              unsigned int v54 = v52 & 0x7FFFFF8;
              if ((v52 & 0x7FFFFF8) <= v50) {
                unsigned int v54 = v50;
              }
              if (v52 > v54)
              {
                unsigned int v55 = v52 - 1;
                do
                {
                  if (v51 > v55) {
                    *((unsigned char *)var3 + (v55 >> 3) + 4) |= 1 << (v55 & 7);
                  }
                  unsigned int v56 = v55 - 1;
                }
                while (v55-- > v54);
                unsigned int v52 = v56 + 1;
              }
              memset((char *)var3 + (v50 >> 3) + 4, 255, (v52 - v50) >> 3);
            }
            v46 >>= 26;
            unint64_t v47 = v48 >> 26;
          }
          while (v46);
        }
      }
      ++v39;
    }
    while (v39 != regionsCount);
  }
  v7->_regionMap = v37;
  uint64_t v58 = [(VMUTask *)v7->_task memoryCache];
  memoryCache = v7->_memoryCache;
  v7->_memoryCache = (VMUTaskMemoryCache *)v58;

  if (!v7->_memoryCache)
  {
LABEL_116:

    v12 = 0;
    int v109 = 1;
    goto LABEL_124;
  }
  v7->_coreSymbolicator._opaque_1 = [(VMUTask *)v7->_task createSymbolicatorWithFlags:CSSymbolicatorGetFlagsForNListOnlyData() andNotification:0];
  v7->_coreSymbolicator._opaque_2 = v60;
  regionMap = v7->_regionMap;
  *(void *)buf = 0;
  v133 = buf;
  uint64_t v134 = 0x3032000000;
  v135 = __Block_byref_object_copy__0;
  v136 = __Block_byref_object_dispose__0;
  id v137 = 0;
  v131[0] = MEMORY[0x1E4F143A8];
  v131[1] = 3221225472;
  v131[2] = __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke;
  v131[3] = &unk_1E5D22D68;
  v131[4] = buf;
  v131[5] = regionMap;
  uint64_t v62 = MEMORY[0x1AD0DA230](v131);
  id regionInfoBlock = v7->_regionInfoBlock;
  v7->_id regionInfoBlock = (id)v62;

  [(VMUTaskMemoryCache *)v7->_memoryCache setRegionInfoBlock:v7->_regionInfoBlock];
  v64 = objc_alloc_init(VMURangeArray);
  dataSegmentsRangeArrayOutsideSharedCache = v7->_dataSegmentsRangeArrayOutsideSharedCache;
  v7->_dataSegmentsRangeArrayOutsideSharedCache = v64;

  uint64_t v66 = [(VMUVMRegionIdentifier *)v7->_regionIdentifier taskThreadStates];
  threadStates = v7->_threadStates;
  v7->_threadStates = (VMUTaskThreadStates *)v66;

  v68 = v123;
  v7->_threadsCount = [(VMUTaskThreadStates *)v7->_threadStates threadCount];
  if (v123 && [v123 signpostID])
  {
    v69 = [v123 logHandle];
    os_signpost_id_t v70 = [v123 signpostID];
    if (v70 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      *(_WORD *)v139 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v69, OS_SIGNPOST_INTERVAL_END, v70, "initMemoryScanner", "", v139, 2u);
    }

    v68 = v123;
  }
  [v68 endEvent:"initMemoryScanner"];
  [v68 startWithCategory:"initMemoryScanner" message:"get malloc zones array"];
  if (v68)
  {
    v71 = [v68 logHandle];
    os_signpost_id_t v72 = [v68 signpostID];
    if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
    {
      *(_WORD *)v139 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v71, OS_SIGNPOST_INTERVAL_BEGIN, v72, "initMemoryScanner", "get malloc zones array", v139, 2u);
    }
  }
  uint64_t v73 = objc_opt_new();
  zoneNames = v7->_zoneNames;
  v7->_zoneNames = (NSMutableArray *)v73;

  uint64_t v75 = objc_opt_new();
  nonScannableZoneNames = v7->_nonScannableZoneNames;
  v7->_nonScannableZoneNames = (NSMutableSet *)v75;

  [(VMUKernelCoreMemoryScanner *)v7 _enumerateZallocZones:1 blocks:0];
  v77 = v123;
  if (v123 && [v123 signpostID])
  {
    v78 = [v123 logHandle];
    os_signpost_id_t v79 = [v123 signpostID];
    if (v79 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v78))
    {
      *(_WORD *)v139 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v78, OS_SIGNPOST_INTERVAL_END, v79, "initMemoryScanner", "", v139, 2u);
    }

    v77 = v123;
  }
  [v77 endEvent:"initMemoryScanner"];
  size_t zonesCount = v7->_zonesCount;
  if (zonesCount && v7->_regions)
  {
    zones = v7->_zones;
    __compar[0] = MEMORY[0x1E4F143A8];
    __compar[1] = 3221225472;
    __compar[2] = __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_2;
    __compar[3] = &unk_1E5D22DD8;
    v130 = (VMUKernelCoreMemoryScanner *)&__block_literal_global_0;
    mergesort_b(zones, zonesCount, 0x18uLL, __compar);
    [(NSMutableArray *)v7->_zoneNames sortUsingComparator:&__block_literal_global_0];
    v82 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:]([VMUObjectIdentifier alloc], "initWithVMUTask:symbolicator:scanner:", v7->_task, 0, 0, v7);
    objectIdentifier = v7->_objectIdentifier;
    v7->_objectIdentifier = v82;

    v84 = v7->_objectIdentifier;
    if (v84)
    {
      uint64_t v85 = [(VMUObjectIdentifier *)v84 realizedClasses];
      classInfoIndexer = v7->_classInfoIndexer;
      v7->_classInfoIndexer = (VMUClassInfoMap *)v85;

      v87 = v123;
      if (v123 && [v123 signpostID])
      {
        v88 = [v123 logHandle];
        os_signpost_id_t v89 = [v123 signpostID];
        if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
        {
          *(_WORD *)v139 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v88, OS_SIGNPOST_INTERVAL_END, v89, "initMemoryScanner", "", v139, 2u);
        }

        v87 = v123;
      }
      [v87 endEvent:"initMemoryScanner"];
      [v87 startWithCategory:"initMemoryScanner" message:"setting up VMUScanOverlay"];
      if (v87)
      {
        v90 = [v87 logHandle];
        os_signpost_id_t v91 = [v87 signpostID];
        if (v91 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v90))
        {
          *(_WORD *)v139 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v90, OS_SIGNPOST_INTERVAL_BEGIN, v91, "initMemoryScanner", "setting up VMUScanOverlay", v139, 2u);
        }
      }
      v92 = [[VMUScanOverlay alloc] initWithScanner:v7];
      scanOverlay = v7->_scanOverlay;
      v7->_scanOverlay = v92;

      [(VMUKernelCoreMemoryScanner *)v7 refineTypesWithOverlay:v7->_scanOverlay];
      v94 = v123;
      if (v123 && [v123 signpostID])
      {
        v95 = [v123 logHandle];
        os_signpost_id_t v96 = [v123 signpostID];
        if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
        {
          *(_WORD *)v139 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v95, OS_SIGNPOST_INTERVAL_END, v96, "initMemoryScanner", "", v139, 2u);
        }

        v94 = v123;
      }
      [v94 endEvent:"initMemoryScanner"];
      uint64_t v97 = objc_opt_new();
      nonscannableGlobalSymbolsArray = v7->_nonscannableGlobalSymbolsArray;
      v7->_nonscannableGlobalSymbolsArray = (VMUNonOverlappingRangeArray *)v97;

      CSSymbolicatorGetAOutSymbolOwner();
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      uint64_t v99 = [&unk_1EFE3FFD0 countByEnumeratingWithState:&v125 objects:v140 count:16];
      if (v99)
      {
        uint64_t v100 = *(void *)v126;
        do
        {
          for (uint64_t i = 0; i != v99; ++i)
          {
            if (*(void *)v126 != v100) {
              objc_enumerationMutation(&unk_1EFE3FFD0);
            }
            [*(id *)(*((void *)&v125 + 1) + 8 * i) UTF8String];
            CSSymbolOwnerGetSymbolWithMangledName();
            uint64_t Range = CSSymbolGetRange();
            if (v103) {
              -[VMURangeArray addRange:](v7->_nonscannableGlobalSymbolsArray, "addRange:", Range, v103);
            }
          }
          uint64_t v99 = [&unk_1EFE3FFD0 countByEnumeratingWithState:&v125 objects:v140 count:16];
        }
        while (v99);
      }
      v7->_regionDescriptionOptions = v119;
      uint64_t v104 = *MEMORY[0x1E4F14B00];
      v105 = [(VMUTask *)v7->_task memoryCache];
      LOBYTE(v104) = v104 == [v105 pageSize];

      if (v104)
      {
        MEMORY[0x1AD0D8AE0]();
        int v106 = CSArchitectureIs64Bit();
        CSSymbolicatorGetArchitecture();
        int v107 = CSArchitectureIs64Bit();
        v108 = (FILE *)*MEMORY[0x1E4F143C8];
        if (v106 == v107)
        {
          fwrite("warning: kernel core support is highly experimental\n", 0x34uLL, 1uLL, v108);
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v139 = 0;
            _os_log_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "warning: kernel core support is highly experimental", v139, 2u);
          }
          int v109 = 0;
          goto LABEL_122;
        }
        int v109 = 1;
        fwrite("error: core's pointer size doesn't match the host system, cannot continue\n", 0x4AuLL, 1uLL, v108);
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
LABEL_122:
          v12 = v7;
          v7 = v130;
          goto LABEL_123;
        }
        -[VMUKernelCoreMemoryScanner initWithVMUTask:options:]();
      }
      else
      {
        v110 = (FILE *)*MEMORY[0x1E4F143C8];
        v111 = [*p_task memoryCache];
        unint64_t v112 = [v111 pageSize];
        fprintf(v110, "error: core's page size doesn't match the host system (%u KB vs %u KB), cannot continue\n", v112 >> 10, *MEMORY[0x1E4F14B00] >> 10);

        v113 = MEMORY[0x1E4F14500];
        id v114 = MEMORY[0x1E4F14500];
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        {
          v115 = [*p_task memoryCache];
          -[VMUKernelCoreMemoryScanner initWithVMUTask:options:]([v115 pageSize], v139, v115);
        }
      }
    }
    else
    {

      v7 = 0;
    }
    int v109 = 1;
    goto LABEL_122;
  }
  v12 = 0;
  int v109 = 1;
LABEL_123:

  _Block_object_dispose(buf, 8);
LABEL_124:

  if (!v109) {
    goto LABEL_126;
  }
  v116 = 0;
  v117 = v121;
LABEL_127:

  return v116;
}

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v4 + 4 * ((a2 >> *MEMORY[0x1E4F14AF8]) & 0x7FFFF);
  int v8 = *(_DWORD *)(v5 + 64);
  v7 = (_DWORD *)(v5 + 64);
  int v6 = v8;
  uint64_t v9 = *(void *)(v4 + 32);
  if (v8)
  {
    v10 = *(void **)(v9 + ((unint64_t)(v6 - 1) << 6));
    if (a2 - v10[1] < v10[2]) {
      goto LABEL_25;
    }
  }
  unint64_t v11 = *(unsigned int *)(v4 + 40);
  if (!v11)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_12;
  }
  v12 = *(id **)(v4 + 32);
  while (1)
  {
    unint64_t v13 = v11 >> 1;
    v14 = &v12[8 * (v11 >> 1)];
    if (*((void *)*v14 + 1) <= a2) {
      break;
    }
LABEL_8:
    BOOL v15 = v11 > 1;
    unint64_t v11 = v13;
    if (!v15) {
      goto LABEL_9;
    }
  }
  if (*((void *)*v14 + 2) + *((void *)*v14 + 1) <= a2)
  {
    v12 = v14 + 8;
    unint64_t v13 = --v11 >> 1;
    goto LABEL_8;
  }
  if ([*v14 isSpecialPhysFootprintRegion]) {
    v14 = 0;
  }
LABEL_12:
  if (*((unsigned char *)*v14 + 132))
  {
    v16 = v14 + 8;
    unint64_t v17 = *(unsigned int *)(v4 + 40) - (((uint64_t)v14 - *(void *)(v4 + 32) + 64) >> 6);
    if (v17)
    {
      while (1)
      {
        unint64_t v18 = v17 >> 1;
        uint64_t v19 = &v16[8 * (v17 >> 1)];
        if (*((void *)*v19 + 1) <= a2)
        {
          if (*((void *)*v19 + 2) + *((void *)*v19 + 1) > a2)
          {
            if ([*v19 isSpecialPhysFootprintRegion]) {
              unint64_t v17 = 0;
            }
            else {
              unint64_t v17 = (unint64_t)v19;
            }
            break;
          }
          v16 = v19 + 8;
          unint64_t v18 = --v17 >> 1;
        }
        BOOL v15 = v17 > 1;
        unint64_t v17 = v18;
        if (!v15)
        {
          unint64_t v17 = 0;
          break;
        }
      }
    }
    if (v17) {
      v14 = (id *)v17;
    }
  }
  _DWORD *v7 = (((unint64_t)v14 - v9) >> 6) + 1;
  v10 = *v14;
LABEL_25:
  uint64_t v20 = [v10 descriptionWithOptions:513 maximumLength:0];
  uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  id v23 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v23 UTF8String];
}

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 rangeOfString:@"zalloc (no zone)"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v5 rangeOfString:@"zalloc (no zone)"] == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v6 = [v4 compare:v5];
    }
    else {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = -1;
  }

  return v6;
}

uint64_t __54__VMUKernelCoreMemoryScanner_initWithVMUTask_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  blocks = self->_blocks;
  if (blocks && !self->_processObjectGraph)
  {
    free(blocks);
    self->_blocks = 0;
  }
  CSRelease();
  [(VMUTaskMemoryCache *)self->_memoryCache setRegionInfoBlock:0];
  if (self->_regionsCount)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      regions = self->_regions;
      v7 = self->_memoryCache;
      int v8 = v7;
      if (regions[v4].var7)
      {
        if (&regions[v4] == regions[v4].var8)
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = ___unmapRegion_block_invoke_0;
          v19[3] = &unk_1E5D235B0;
          uint64_t v20 = v7;
          uint64_t v21 = &regions[v4];
          v22 = regions;
          v10 = (void (**)(void))MEMORY[0x1AD0DA230](v19);
          v10[2]();
        }
        else
        {
          uint64_t v9 = &regions[v4];
          v9->unint64_t var6 = 0;
          v9->unint64_t var7 = 0;
          v9->var8 = 0;
        }
      }

      var1 = self->_regions[v4].var1;
      if (var1)
      {
        free(var1);
        self->_regions[v4].var1 = 0;
      }
      ++v5;
      ++v4;
    }
    while (v5 < self->_regionsCount);
  }
  v12 = self->_regions;
  if (v12)
  {
    free(v12);
    self->_regions = 0;
  }
  zones = self->_zones;
  if (zones)
  {
    free(zones);
    self->_zones = 0;
  }
  instanceValues = self->_instanceValues;
  if (instanceValues) {
    free(instanceValues);
  }
  self->_instanceValues = 0;
  regionMap = self->_regionMap;
  if (regionMap)
  {
    var3 = regionMap->var3;
    if (var3) {
      free(var3);
    }
    free(regionMap);
  }
  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0;
  }
  [(VMUKernelCoreMemoryScanner *)self _destroyLinearClassInfos];
  v18.receiver = self;
  v18.super_class = (Class)VMUKernelCoreMemoryScanner;
  [(VMUKernelCoreMemoryScanner *)&v18 dealloc];
}

- (void)_withMemoryReaderBlock:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__VMUKernelCoreMemoryScanner__withMemoryReaderBlock___block_invoke;
  v5[3] = &unk_1E5D22E48;
  v5[4] = self;
  id v6 = 0;
  uint64_t v3 = (void (**)(id, void *))a3;
  uint64_t v4 = (void *)MEMORY[0x1AD0DA230](v5);
  v3[2](v3, v4);
}

uint64_t __53__VMUKernelCoreMemoryScanner__withMemoryReaderBlock___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 128);
  unint64_t v7 = *(void *)(v5 + 48);
  unint64_t v6 = *(void *)(v5 + 56);
  unint64_t v8 = v6 - v7;
  BOOL v9 = v6 < v7;
  if (a2 - v7 >= v8 || v9) {
    return result;
  }
  v12 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v13 = a2 >> *MEMORY[0x1E4F14AF8];
  if (v13)
  {
    v14 = *(unsigned int **)(v5 + 24);
    unint64_t v15 = a2 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*v14 <= (v15 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v14 + ((v15 & 0x3FFFFFF) >> 3) + 4) >> (v15 & 7)) & 1) == 0)
      {
        return 0;
      }
      v15 >>= 26;
    }
    while (v15);
  }
  uint64_t v16 = v5 + 4 * (v13 & 0x7FFFF);
  int v19 = *(_DWORD *)(v16 + 64);
  objc_super v18 = (_DWORD *)(v16 + 64);
  int v17 = v19;
  uint64_t v20 = *(void *)(v5 + 32);
  if (v19)
  {
    unint64_t v21 = v20 + ((unint64_t)(v17 - 1) << 6);
    if (a2 - *(void *)(*(void *)v21 + 8) < *(void *)(*(void *)v21 + 16)) {
      goto LABEL_10;
    }
  }
  unint64_t v48 = *(unsigned int *)(v5 + 40);
  if (!v48) {
    return 0;
  }
  unint64_t v49 = *(void *)(v5 + 32);
  while (1)
  {
    unint64_t v50 = v48 >> 1;
    unint64_t v21 = v49 + (v48 >> 1 << 6);
    if (*(void *)(*(void *)v21 + 8) <= a2) {
      break;
    }
LABEL_30:
    BOOL v51 = v48 >= 2;
    unint64_t v48 = v50;
    if (!v51) {
      return 0;
    }
  }
  if (*(void *)(*(void *)v21 + 16) + *(void *)(*(void *)v21 + 8) <= a2)
  {
    unint64_t v49 = v21 + 64;
    unint64_t v50 = --v48 >> 1;
    goto LABEL_30;
  }
  int v52 = [*(id *)v21 isSpecialPhysFootprintRegion];
  uint64_t result = 0;
  if (v52) {
    unint64_t v53 = 0;
  }
  else {
    unint64_t v53 = v21;
  }
  if ((v52 & 1) == 0)
  {
    if ((*(unsigned char *)(*(void *)v53 + 132) & 1) == 0) {
      goto LABEL_78;
    }
    unsigned int v54 = (id *)(v53 + 64);
    unint64_t v55 = *(unsigned int *)(v5 + 40) - ((uint64_t)(v53 + 64 - *(void *)(v5 + 32)) >> 6);
    if (!v55) {
      goto LABEL_75;
    }
    while (1)
    {
      unint64_t v56 = v55 >> 1;
      v57 = &v54[8 * (v55 >> 1)];
      if (*((void *)*v57 + 1) <= a2)
      {
        if (*((void *)*v57 + 2) + *((void *)*v57 + 1) > a2)
        {
          if ([*v57 isSpecialPhysFootprintRegion]) {
            unint64_t v55 = 0;
          }
          else {
            unint64_t v55 = (unint64_t)v57;
          }
LABEL_75:
          if (v55) {
            unint64_t v53 = v55;
          }
          unint64_t v21 = v53;
LABEL_78:
          *objc_super v18 = ((v53 - v20) >> 6) + 1;
LABEL_10:
          unint64_t v22 = a3 + a2;
          if (*(void *)(*(void *)v21 + 16) + *(void *)(*(void *)v21 + 8) < a3 + a2
            && *(void *)(v21 + 40) + *(void *)(*(void *)v21 + 8) < v22)
          {
            LODWORD(v23) = 1;
            do
            {
              v24 = (void *)(*(void *)(v21 + ((unint64_t)v23 << 6)) + 8);
              uint64_t v23 = (v23 + 1);
            }
            while (v24[1] + *v24 < v22);
            uint64_t v25 = *(void *)(a1 + 32);
            os_signpost_id_t v26 = *(void **)(a1 + 40);
            uint64_t v27 = *(void **)(v25 + 72);
            id v28 = *(id *)(v25 + 8);
            id v80 = v27;
            v81 = v26;
            uint64_t v29 = 0;
            if (v23)
            {
              uint64_t v30 = v23;
              unsigned int v31 = (uint64_t *)v21;
              do
              {
                uint64_t v32 = *v31;
                v31 += 8;
                v29 += *(void *)(v32 + 16);
                --v30;
              }
              while (v30);
            }
            v88[0] = 0;
            uint64_t v83 = 0;
            uint64_t v33 = (void *)[v80 findMappedAddress:*(void *)(*(void *)v21 + 8) size:v29];
            if (v33)
            {
              uint64_t v34 = v33[1];
              uint64_t v35 = *(void *)(*(void *)v21 + 8) - *v33;
              v88[0] = v33[2] + v35;
              uint64_t v83 = v34 - v35;
              goto LABEL_19;
            }
            os_signpost_id_t v79 = v28;
            if (v23)
            {
              uint64_t v72 = 0;
              do
              {
                id v73 = v80;
                v74 = v81;
                if (*(void *)(v21 + v72 + 48))
                {
                  if (v21 + v72 == *(void *)(v21 + v72 + 56))
                  {
                    v84[0] = MEMORY[0x1E4F143A8];
                    v84[1] = 3221225472;
                    v84[2] = ___unmapRegion_block_invoke_0;
                    v84[3] = &unk_1E5D235B0;
                    id v85 = v73;
                    uint64_t v86 = v21 + v72;
                    unint64_t v87 = v21;
                    v76 = (void (**)(void))MEMORY[0x1AD0DA230](v84);
                    v77 = v76;
                    if (v81) {
                      dispatch_async(v74, v76);
                    }
                    else {
                      v76[2](v76);
                    }
                  }
                  else
                  {
                    uint64_t v75 = (void *)(v21 + v72);
                    v75[5] = 0;
                    v75[6] = 0;
                    v75[7] = 0;
                  }
                }

                v72 += 64;
              }
              while ((unint64_t)v23 << 6 != v72);
            }
            int v78 = [v80 mapAddress:*(void *)(*(void *)v21 + 8) size:v29 returnedAddress:v88 returnedSize:&v83];
            v12 = (_DWORD *)MEMORY[0x1E4F14AF8];
            id v28 = v79;
            if (v78)
            {
              if (task_exists(v79)) {
                fprintf((FILE *)*MEMORY[0x1E4F143C8], "Failed to map remote region at [%#llx-%#llx]\n", *(void *)(*(void *)v21 + 8), *(void *)(*(void *)v21 + 8) + v29);
              }
            }
            else
            {
LABEL_19:
              if (v23)
              {
                uint64_t v36 = 0;
                uint64_t v37 = v83;
                do
                {
                  v38 = (void *)(v21 + v36);
                  v38[7] = v21;
                  v38[5] = v37;
                  uint64_t v39 = v88[0];
                  v38[6] = v88[0];
                  uint64_t v40 = *(void *)(v21 + v36) + 8;
                  v88[0] = *(void *)(*(void *)(v21 + v36) + 16) + v39;
                  uint64_t v37 = v83 - *(void *)(v40 + 8);
                  uint64_t v83 = v37;
                  v36 += 64;
                }
                while ((unint64_t)v23 << 6 != v36);
              }
            }
          }
          uint64_t v41 = *(void *)(a1 + 32);
          unint64_t v42 = *(void **)(v41 + 72);
          uint64_t v43 = *(void *)(v41 + 112);
          int v44 = *(_DWORD *)(v41 + 120);
          id v45 = *(id *)(v41 + 8);
          id v46 = v42;
          unint64_t v47 = v46;
          if (*(void *)(v21 + 48))
          {
LABEL_24:

            return *(void *)(v21 + 48) + a2 - *(void *)(*(void *)v21 + 8);
          }
          if ((*(unsigned char *)(*(void *)v21 + 132) & 2) == 0) {
            [v46 taskIsTranslated];
          }
          v84[0] = 0;
          v88[0] = 0;
          int v59 = [v47 mapAddress:*(void *)(*(void *)v21 + 8) size:*(void *)(*(void *)v21 + 16) returnedAddress:v84 returnedSize:v88];
          if (!v59)
          {
            uint64_t v71 = v84[0];
            *(void *)(v21 + 40) = v88[0];
            *(void *)(v21 + 48) = v71;
            *(void *)(v21 + 56) = v21;
            goto LABEL_24;
          }
          if ((*(_DWORD *)(*(void *)v21 + 52) & 3u) - 1 >= 2)
          {
            int v60 = v59;
            BOOL v61 = task_exists(v45);
            if (v21 != v43 + ((unint64_t)(v44 - 1) << 6) && v61)
            {
              v82 = (FILE *)*MEMORY[0x1E4F143C8];
              uint64_t v62 = [*(id *)v21 address];
              uint64_t v63 = *(unsigned int *)(*(void *)v21 + 24);
              v64 = (&vm_prot_strings_0)[v63];
              uint64_t v65 = *(void *)(*(void *)v21 + 16) + *(void *)(*(void *)v21 + 8);
              VMURegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(void *)v21 + 104), *(unsigned __int8 *)(*(void *)v21 + 50), v63, *(unsigned __int8 *)(*(void *)v21 + 49));
              id v66 = objc_claimAutoreleasedReturnValue();
              v67 = (const char *)[v66 UTF8String];
              uint64_t v68 = *(void *)(*(void *)v21 + 16) >> *v12;
              v69 = "pages";
              if (v68 == 1) {
                v69 = "page";
              }
              if (*(void *)(v21 + 24) == *(void *)(v21 + 32)) {
                os_signpost_id_t v70 = "";
              }
              else {
                os_signpost_id_t v70 = " [root]";
              }
              fprintf(v82, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v62, v65, v64, v67, v68, v69, v70, v60);
            }
          }

          return 0;
        }
        unsigned int v54 = v57 + 8;
        unint64_t v56 = --v55 >> 1;
      }
      BOOL v58 = v55 > 1;
      unint64_t v55 = v56;
      if (!v58)
      {
        unint64_t v55 = 0;
        goto LABEL_75;
      }
    }
  }
  return result;
}

- (void)_callRemoteMallocEnumerators:(unsigned int)a3 block:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke;
  v8[3] = &unk_1E5D234B0;
  v8[4] = self;
  id v9 = v6;
  unsigned int v10 = a3;
  id v7 = v6;
  [(VMUKernelCoreMemoryScanner *)self _withMemoryReaderBlock:v8];
}

void __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_2;
  v5[3] = &unk_1E5D23488;
  uint64_t v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  int v7 = *(_DWORD *)(a1 + 48);
  _withPeekTransformerFunctionForMemoryReader(a2, v5);
}

void __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 232))
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      if (*(void *)(*(void *)(v2 + 224) + v5 + 16))
      {
        get_local_zone_count();
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_3;
        v8[3] = &unk_1E5D22E78;
        id v9 = *(id *)(a1 + 40);
        int v10 = v6;
        int v7 = (void *)MEMORY[0x1AD0DA230](v8);
        (**(void (***)(uint64_t, void *, void, void, uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)))(*(void *)(*(void *)(a1 + 32) + 224) + v5 + 16))([*(id *)(*(void *)(a1 + 32) + 8) taskPort], v7, *(unsigned int *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 32) + 224) + v5), a2, _pointerRecorderBlockContextAdapter_0);
        unregister_new_local_zones();

        uint64_t v2 = *(void *)(a1 + 32);
      }
      ++v6;
      v5 += 24;
    }
    while (v6 < *(unsigned int *)(v2 + 232));
  }
}

uint64_t __65__VMUKernelCoreMemoryScanner__callRemoteMallocEnumerators_block___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), a2, a3, a4);
}

- (void)_destroyLinearClassInfos
{
  +[VMUClassInfoMap _destroyRetainedLinearArray:self->_classInfos withCount:self->_classInfosCount];
  scanCaches = self->_scanCaches;
  if (scanCaches)
  {
    unint64_t classInfosCount = self->_classInfosCount;
    if (classInfosCount)
    {
      for (unint64_t i = 0; i < classInfosCount; ++i)
      {
        unint64_t v6 = self->_scanCaches[i];
        if (v6)
        {
          free(v6);
          unint64_t classInfosCount = self->_classInfosCount;
        }
      }
      scanCaches = self->_scanCaches;
    }
    free(scanCaches);
    self->_scanCaches = 0;
  }
  applySwiftMaskingToIsa = self->_applySwiftMaskingToIsa;
  if (applySwiftMaskingToIsa)
  {
    free(applySwiftMaskingToIsa);
    self->_applySwiftMaskingToIsa = 0;
  }
}

- (unsigned)_indexForClassInfo:(id)a3
{
  return [(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:a3];
}

- (id)_cachedVariantForGenericInfo:(id)a3 variantKey:(unint64_t)a4
{
  uint64_t v6 = [(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:a3];
  variantCachesByIsaIndex = self->_variantCachesByIsaIndex;
  unint64_t v8 = [NSNumber numberWithUnsignedInt:v6];
  id v9 = [(NSMutableDictionary *)variantCachesByIsaIndex objectForKeyedSubscript:v8];

  int v10 = [NSNumber numberWithUnsignedLongLong:a4];
  unint64_t v11 = [v9 objectForKeyedSubscript:v10];

  return v11;
}

- (void)_registerVariant:(id)a3 forGenericInfo:(id)a4 variantKey:(unint64_t)a5
{
  classInfoIndexer = self->_classInfoIndexer;
  id v9 = a3;
  uint64_t v10 = [(VMUClassInfoMap *)classInfoIndexer indexForClassInfo:a4];
  variantCachesByIsaIndex = self->_variantCachesByIsaIndex;
  v12 = [NSNumber numberWithUnsignedInt:v10];
  id v16 = [(NSMutableDictionary *)variantCachesByIsaIndex objectForKeyedSubscript:v12];

  if (!v16)
  {
    id v16 = (id)objc_opt_new();
    unint64_t v13 = self->_variantCachesByIsaIndex;
    v14 = [NSNumber numberWithUnsignedInt:v10];
    [(NSMutableDictionary *)v13 setObject:v16 forKeyedSubscript:v14];
  }
  unint64_t v15 = [NSNumber numberWithUnsignedLongLong:a5];
  [v16 setObject:v9 forKeyedSubscript:v15];
}

- (void)_updateLinearClassInfos
{
  [(VMUKernelCoreMemoryScanner *)self _destroyLinearClassInfos];
  self->_classInfos = [(VMUClassInfoMap *)self->_classInfoIndexer _retainedLinearArrayWithReturnedCount:&self->_classInfosCount];
  self->_scanCaches = (_VMUScanLocationCache **)malloc_type_calloc(self->_classInfosCount, 8uLL, 0x2004093837F09uLL);
  unsigned int classInfosCount = self->_classInfosCount;
  uint64_t v4 = malloc_type_calloc(1uLL, ((classInfosCount + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *uint64_t v4 = classInfosCount;
  self->_applySwiftMaskingToIsa = v4;
}

- (void)_addThreadNodesFromTask
{
  if (self->_threadsCount)
  {
    unint64_t v3 = 0;
    unsigned int blocksCount = self->_blocksCount;
    do
    {
      uint64_t blocksSize = self->_blocksSize;
      if (blocksSize <= blocksCount)
      {
        if ((2 * blocksSize) <= 0x40000) {
          int v7 = 0x40000;
        }
        else {
          int v7 = 2 * blocksSize;
        }
        do
        {
          unsigned int v8 = v7;
          v7 *= 2;
        }
        while (v8 < blocksCount);
        self->_uint64_t blocksSize = v8;
        blocks = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v8, 0x1000040451B5BE8uLL);
        self->_blocks = blocks;
        if (!blocks)
        {
          NSLog(&cfstr_OutOfMemoryFai.isa, "_blocks", blocksSize, self->_blocksSize);
          abort();
        }
        unsigned int blocksCount = self->_blocksCount;
      }
      else
      {
        blocks = self->_blocks;
      }
      id v9 = &blocks[blocksCount];
      v9->var0 = v3;
      *((void *)v9 + 1) = (v3 << 41) | 4;
      unsigned int blocksCount = self->_blocksCount + 1;
      self->_unsigned int blocksCount = blocksCount;
      ++v3;
    }
    while (v3 < self->_threadsCount);
  }
}

- (unint64_t)_lengthOfMappedFileOfRegion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  if (!v4[49]) {
    goto LABEL_11;
  }
  if (-[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", *((void *)v4 + 1), *((void *)v4 + 2)))
  {
    off_t st_size = *((void *)v4 + 2) + *((void *)v4 + 15);
    goto LABEL_16;
  }
  uint64_t v6 = [v4 path];
  if (!v6)
  {
LABEL_11:
    off_t st_size = 0;
    goto LABEL_16;
  }
  int v7 = v6;
  if (([v6 containsString:@"*"] & 1) != 0
    || ([v7 hasPrefix:@"/"] & 1) == 0)
  {
    unsigned int v8 = [(VMUTask *)self->_task memoryCache];
    int v9 = [v8 procRegionFileNameForAddress:*((void *)v4 + 1) buffer:v16 bufferSize:1024];

    if (v9 >= 1)
    {
      *((unsigned char *)&v16[0].st_dev + v9) = 0;
      uint64_t v10 = [NSString stringWithUTF8String:v16];

      int v7 = (void *)v10;
    }
  }
  unint64_t v11 = [(NSMutableDictionary *)self->_mappedFileNameToLengthDict objectForKeyedSubscript:v7];
  v12 = v11;
  if (v11)
  {
    off_t st_size = [v11 unsignedLongLongValue];
  }
  else
  {
    memset(v16, 0, 144);
    id v13 = v7;
    if (stat((const char *)[v13 UTF8String], v16))
    {
      off_t st_size = *((void *)v4 + 2) + *((void *)v4 + 15);
    }
    else
    {
      off_t st_size = v16[0].st_size;
      v14 = [NSNumber numberWithUnsignedLongLong:v16[0].st_size];
      [(NSMutableDictionary *)self->_mappedFileNameToLengthDict setObject:v14 forKeyedSubscript:v13];
    }
  }

LABEL_16:
  return st_size;
}

- (void)_shortenScannableRangeOfMappedFile:(unsigned int)a3
{
  regions = self->_regions;
  uint64_t v5 = a3;
  int v9 = regions[(unint64_t)a3].var0;
  unint64_t v6 = [(VMUKernelCoreMemoryScanner *)self _lengthOfMappedFileOfRegion:v9];
  unint64_t v7 = v9[15];
  if (v6 >= v7)
  {
    if (v6 >= v9[2] + v7) {
      goto LABEL_6;
    }
    unint64_t var4 = v6 - v7 + regions[v5].var4;
  }
  else
  {
    unint64_t var4 = regions[v5].var4;
  }
  regions[v5].var5 = var4;
LABEL_6:
}

- (BOOL)addRootNodesFromTaskWithError:(id *)a3
{
  [(VMUKernelCoreMemoryScanner *)self _addThreadNodesFromTask];
  [(VMUKernelCoreMemoryScanner *)self _addSpecialNodesFromTask];
  unsigned int v4 = self->_regionsCount - 1;
  do
  {
    unsigned int v5 = v4;
    if (!v4) {
      break;
    }
    int v6 = *((unsigned __int8 *)self->_regions[(unint64_t)v4--].var0 + 50);
  }
  while (v6 == 5);
  unsigned int v7 = 0;
  do
  {
    uint64_t v8 = v7;
    int v9 = self->_regions[(unint64_t)v7].var0;
    uint64_t v10 = v9;
    if (v9[50] != 3 && ([v9 isSubmap] & 1) == 0)
    {
      unint64_t v11 = *((void *)v10 + 1);
      uint64_t v12 = *((void *)v10 + 2);
      BOOL v13 = -[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v11, v12);
      unsigned int v14 = *((_DWORD *)v10 + 26);
      BOOL v15 = v14 > 0x3D || ((1 << v14) & 0x3000000080103FDELL) == 0;
      if (v15 && v14 != 99)
      {
        BOOL v16 = v13;
        if ((~[v10 protection] & 3) != 0)
        {
          int v18 = *((_DWORD *)v10 + 6);
          char v19 = (~v18 & 5) != 0 || v16;
          if ((v19 & 1) == 0 || (v18 != 1 ? (char v20 = 1) : (char v20 = v16), (v20 & 1) == 0))
          {
            if ((v10[132] & 2) == 0)
            {
              unint64_t v21 = &self->_regions[v8];
              v21->unint64_t var4 = *((void *)v10 + 1);
              v21->unint64_t var5 = v12 + v11;
            }
          }
        }
        else if ((v10[132] & 4) == 0 || self->_targetProcessHasObjCPatches && [v10 dirtyLength])
        {
          uint64_t v17 = &self->_regions[v8];
          v17->unint64_t var4 = v11;
          v17->unint64_t var5 = v12 + v11;
        }
        else
        {
          unint64_t v22 = &self->_regions[v8];
          v22->unint64_t var4 = 0;
          v22->unint64_t var5 = 0;
        }
        if (*((_DWORD *)v10 + 26) == 78) {
          self->_regions[v8].unint64_t var5 = self->_regions[v8].var4 + 4096;
        }
        if ((v10[132] & 2) != 0
          && (v10[132] & 4) == 0
          && ([v10 protection] & 1) != 0
          && ([v10 protection] & 4) == 0)
        {
          uint64_t v104 = [v10 type];
          char v102 = [v104 isEqualToString:@"__LINKEDIT"];

          if ((v102 & 1) == 0)
          {
            uint64_t v23 = 184;
            if (v16) {
              uint64_t v23 = 168;
            }
            v24 = (unint64_t *)((char *)self + v23);
            unint64_t v25 = *v24;
            if (!*v24)
            {
              unint64_t *v24 = v11;
              unint64_t v25 = v11;
            }
            v24[1] = v12 + v11 - v25;
            if (!v16) {
              -[VMURangeArray addRange:](self->_dataSegmentsRangeArrayOutsideSharedCache, "addRange:", v11, v12);
            }
          }
        }
        if (self->_regions[v8].var5 && v10[49]) {
          [(VMUKernelCoreMemoryScanner *)self _shortenScannableRangeOfMappedFile:v8];
        }
      }
    }

    unsigned int v7 = v8 + 1;
  }
  while ((int)v8 + 1 <= v5);
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __60__VMUKernelCoreMemoryScanner_addRootNodesFromTaskWithError___block_invoke;
  v106[3] = &unk_1E5D22F78;
  v106[4] = self;
  [(VMUKernelCoreMemoryScanner *)self _callRemoteMallocEnumerators:6 block:v106];
  if (!self->_stackRanges)
  {
    os_signpost_id_t v26 = objc_alloc_init(VMURangeArray);
    stackRanges = self->_stackRanges;
    self->_stackRanges = v26;
  }
  unsigned int regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    regions = self->_regions;
    uint64_t v30 = &regions[(unint64_t)(regionsCount - 1)];
  }
  else
  {
    regions = 0;
    uint64_t v30 = 0;
  }
  if (self->_threadsCount)
  {
    uint64_t v31 = 0;
    do
    {
      unint64_t v32 = [(VMUTaskThreadStates *)self->_threadStates stackPointerForThreadNum:v31];
      if (v32)
      {
        unint64_t v33 = v32;
        regionMap = self->_regionMap;
        unint64_t var6 = regionMap->var6;
        unint64_t var7 = regionMap->var7;
        unint64_t v37 = var7 - var6;
        BOOL v38 = var7 < var6;
        if (v32 - var6 < v37 && !v38)
        {
          unint64_t v39 = v32 >> *MEMORY[0x1E4F14AF8];
          if (v39)
          {
            var3 = (unsigned int *)regionMap->var3;
            unint64_t v41 = v32 >> *MEMORY[0x1E4F14AF8];
            do
            {
              if (*var3 <= (v41 & 0x3FFFFFF)
                || ((*((unsigned __int8 *)var3 + ((v41 & 0x3FFFFFF) >> 3) + 4) >> (v41 & 7)) & 1) == 0)
              {
                goto LABEL_87;
              }
              v41 >>= 26;
            }
            while (v41);
          }
          unint64_t v42 = (char *)regionMap + 4 * (v39 & 0x7FFFF);
          int v45 = *((_DWORD *)v42 + 16);
          int v44 = v42 + 64;
          int v43 = v45;
          unint64_t var4 = regionMap->var4;
          if (v45)
          {
            unint64_t v47 = &var4[(unint64_t)(v43 - 1)];
            if (v32 - *((void *)v47->var0 + 1) < *((void *)v47->var0 + 2)) {
              goto LABEL_63;
            }
          }
          unint64_t var5 = regionMap->var5;
          if (var5)
          {
            v57 = regionMap->var4;
            do
            {
              unint64_t v58 = var5 >> 1;
              unint64_t v47 = &v57[var5 >> 1];
              if (*((void *)v47->var0 + 1) <= v32)
              {
                if (*((void *)v47->var0 + 2) + *((void *)v47->var0 + 1) > v32)
                {
                  int v62 = [v47->var0 isSpecialPhysFootprintRegion];
                  if (v62) {
                    unint64_t v63 = 0;
                  }
                  else {
                    unint64_t v63 = (unint64_t)v47;
                  }
                  if (v62) {
                    break;
                  }
                  if ((*(unsigned char *)(*(void *)v63 + 132) & 1) == 0) {
                    goto LABEL_102;
                  }
                  v64 = (id *)(v63 + 64);
                  unint64_t v65 = regionMap->var5 - ((uint64_t)(v63 + 64 - (unint64_t)regionMap->var4) >> 6);
                  if (!v65) {
                    goto LABEL_99;
                  }
                  while (1)
                  {
                    unint64_t v66 = v65 >> 1;
                    v67 = &v64[8 * (v65 >> 1)];
                    if (*((void *)*v67 + 1) <= v33)
                    {
                      if (*((void *)*v67 + 2) + *((void *)*v67 + 1) > v33)
                      {
                        unint64_t v69 = v63;
                        int v70 = [*v67 isSpecialPhysFootprintRegion];
                        unint64_t v63 = v69;
                        if (v70) {
                          unint64_t v65 = 0;
                        }
                        else {
                          unint64_t v65 = (unint64_t)v67;
                        }
LABEL_99:
                        if (v65) {
                          unint64_t v63 = v65;
                        }
                        unint64_t v47 = (_VMURegionNode *)v63;
LABEL_102:
                        *int v44 = ((v63 - (unint64_t)var4) >> 6) + 1;
LABEL_63:
                        v47->unint64_t var4 = v33;
                        unint64_t v48 = (uint64_t *)((char *)v47->var0 + 8);
                        uint64_t v49 = *v48;
                        unint64_t v50 = *((void *)v47->var0 + 2) + *v48;
                        v47->unint64_t var5 = v50;
                        for (unint64_t i = v47 - 1; i >= regions; v49 = v55)
                        {
                          var0 = i->var0;
                          unsigned int v54 = (uint64_t *)((char *)i->var0 + 8);
                          uint64_t v55 = *v54;
                          if (*((void *)i->var0 + 2) + *v54 != v49) {
                            break;
                          }
                          if (var0[26] != 30) {
                            break;
                          }
                          if (!var0[6]) {
                            break;
                          }
                          i->unint64_t var4 = 0;
                          i->unint64_t var5 = 0;
                          --i;
                        }
                        for (j = v47 + 1; j <= v30; ++j)
                        {
                          int v60 = j->var0;
                          BOOL v61 = (char *)j->var0 + 8;
                          if (v50 != *v61) {
                            break;
                          }
                          if (v60[26] != 30) {
                            break;
                          }
                          if (!v60[6]) {
                            break;
                          }
                          j->unint64_t var4 = v50;
                          unint64_t v50 = v61[1] + *v61;
                          j->unint64_t var5 = v50;
                        }
                        -[VMURangeArray addRange:](self->_stackRanges, "addRange:", v33, v50 - v33);
                        goto LABEL_87;
                      }
                      v64 = v67 + 8;
                      unint64_t v66 = --v65 >> 1;
                    }
                    BOOL v68 = v65 > 1;
                    unint64_t v65 = v66;
                    if (!v68)
                    {
                      unint64_t v65 = 0;
                      goto LABEL_99;
                    }
                  }
                }
                v57 = v47 + 1;
                unint64_t v58 = --var5 >> 1;
              }
              BOOL v59 = var5 >= 2;
              unint64_t var5 = v58;
            }
            while (v59);
          }
        }
      }
LABEL_87:
      uint64_t v31 = (v31 + 1);
    }
    while (v31 < self->_threadsCount);
  }
  if (s_enumeratorDebugging_0)
  {
    fwrite("Region state after claims:\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    if (!self->_regionsCount) {
      goto LABEL_120;
    }
    uint64_t v87 = 0;
    unint64_t v88 = 0;
    do
    {
      v105 = (FILE *)*MEMORY[0x1E4F143C8];
      uint64_t v103 = [self->_regions[v87].var0 address];
      os_signpost_id_t v89 = self->_regions[v87].var0;
      uint64_t v90 = *((unsigned int *)v89 + 6);
      uint64_t v91 = v89[2];
      uint64_t v100 = v89[1];
      v101 = (&vm_prot_strings_0)[v90];
      VMURegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v89 + 104), *((unsigned __int8 *)v89 + 50), v90, *((unsigned __int8 *)v89 + 49));
      id v92 = objc_claimAutoreleasedReturnValue();
      v93 = (const char *)[v92 UTF8String];
      v94 = &self->_regions[v87];
      uint64_t v95 = *((void *)v94->var0 + 2) >> *MEMORY[0x1E4F14AF8];
      if (v95 == 1) {
        os_signpost_id_t v96 = "page";
      }
      else {
        os_signpost_id_t v96 = "pages";
      }
      uint64_t v97 = "";
      if (v94->var4 == v94->var5) {
        v98 = "";
      }
      else {
        v98 = " [root]";
      }
      unsigned int v99 = *((_DWORD *)v94->var0 + 37);
      if (v99 < self->_zonesCount) {
        uint64_t v97 = (const char *)[self->_zones[v99].var1 UTF8String];
      }
      fprintf(v105, "region: [%#llx-%#llx] %s %s (%llu %s)%s  %s\n", v103, v91 + v100, v101, v93, v95, v96, v98, v97);

      ++v88;
      unint64_t v71 = self->_regionsCount;
      ++v87;
    }
    while (v88 < v71);
  }
  else
  {
    unint64_t v71 = self->_regionsCount;
  }
  if (v71)
  {
    for (unint64_t k = 0; k < v71; ++k)
    {
      id v73 = self->_regions;
      if (v73[k].var4 != v73[k].var5)
      {
        unsigned int blocksCount = self->_blocksCount;
        uint64_t blocksSize = self->_blocksSize;
        if (blocksSize <= blocksCount)
        {
          if ((2 * blocksSize) <= 0x40000) {
            int v76 = 0x40000;
          }
          else {
            int v76 = 2 * blocksSize;
          }
          do
          {
            unsigned int v77 = v76;
            v76 *= 2;
          }
          while (v77 < blocksCount);
          self->_uint64_t blocksSize = v77;
          int v78 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v77, 0x1000040451B5BE8uLL);
          self->_blocks = v78;
          if (!v78)
          {
            NSLog(&cfstr_OutOfMemoryFai.isa, "_blocks", blocksSize, self->_blocksSize);
            abort();
          }
          id v73 = self->_regions;
        }
        id v79 = v73[k].var0;
        if ([v79 isRootRegion]) {
          uint64_t v80 = 2;
        }
        else {
          uint64_t v80 = 5;
        }
        v81 = &self->_blocks[self->_blocksCount];
        v82 = &self->_regions[k];
        unint64_t v83 = v82->var4;
        unint64_t v84 = v80 & 0xFFFFFFE00000001FLL | (32 * (LODWORD(v82->var5) - v83)) | (k << 41);
        v81->var0 = v83;
        *((void *)v81 + 1) = v84;
        ++self->_blocksCount;

        unint64_t v71 = self->_regionsCount;
      }
    }
  }
LABEL_120:
  if ([(VMUKernelCoreMemoryScanner *)self objectContentLevel] == 2)
  {
    id v85 = [(VMUKernelCoreMemoryScanner *)self _readonlyRegionRanges];
    [(VMUObjectIdentifier *)self->_objectIdentifier setReadonlyRegionRanges:v85];
  }
  return 1;
}

void __60__VMUKernelCoreMemoryScanner_addRootNodesFromTaskWithError___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (a5)
  {
    uint64_t v6 = a1;
    uint64_t v7 = 0;
    unsigned int v82 = a2;
    uint64_t v8 = a5;
    int v9 = (_DWORD *)MEMORY[0x1E4F14AF8];
    uint64_t v10 = &unk_1E973B000;
    unsigned int v84 = a2;
    unsigned int v85 = a3;
    do
    {
      unint64_t v11 = (unint64_t *)(a4 + 16 * v7);
      uint64_t v12 = v11 + 1;
      if (v11[1])
      {
        uint64_t v13 = *(void *)(*(void *)(v6 + 32) + 128);
        unint64_t v14 = *(void *)(v13 + 48);
        unint64_t v15 = *(void *)(v13 + 56);
        BOOL v16 = v15 >= v14;
        unint64_t v17 = v15 - v14;
        if (v16)
        {
          unint64_t v18 = *v11;
          if (*v11 - v14 < v17)
          {
            unint64_t v19 = v18 >> *v9;
            if (v19)
            {
              char v20 = *(unsigned int **)(v13 + 24);
              unint64_t v21 = v18 >> *v9;
              do
              {
                if (*v20 <= (v21 & 0x3FFFFFF)
                  || ((*((unsigned __int8 *)v20 + ((v21 & 0x3FFFFFF) >> 3) + 4) >> (v21 & 7)) & 1) == 0)
                {
                  goto LABEL_70;
                }
                v21 >>= 26;
              }
              while (v21);
            }
            uint64_t v22 = v13 + 4 * (v19 & 0x7FFFF);
            int v25 = *(_DWORD *)(v22 + 64);
            v24 = (_DWORD *)(v22 + 64);
            int v23 = v25;
            uint64_t v26 = *(void *)(v13 + 32);
            if (v25)
            {
              unint64_t v27 = v26 + ((unint64_t)(v23 - 1) << 6);
              if (v18 - *(void *)(*(void *)v27 + 8) < *(void *)(*(void *)v27 + 16)) {
                goto LABEL_14;
              }
            }
            unint64_t v63 = *(unsigned int *)(v13 + 40);
            if (v63)
            {
              unint64_t v64 = *(void *)(v13 + 32);
              do
              {
                unint64_t v65 = v63 >> 1;
                unint64_t v27 = v64 + (v63 >> 1 << 6);
                if (*(void *)(*(void *)v27 + 8) <= v18)
                {
                  if (*(void *)(*(void *)v27 + 16) + *(void *)(*(void *)v27 + 8) > v18)
                  {
                    int v66 = [*(id *)v27 isSpecialPhysFootprintRegion:a3 zoneIndex:&OBJC_IVAR___VMUVMRegion_zone_index mallocTypeFlag:&OBJC_IVAR___VMUVMRegion_mallocTypeFlag];
                    uint64_t v10 = (unsigned char *)&unk_1E973B000;
                    int v9 = (_DWORD *)MEMORY[0x1E4F14AF8];
                    uint64_t v6 = a1;
                    a2 = v84;
                    a3 = v85;
                    if (v66) {
                      unint64_t v67 = 0;
                    }
                    else {
                      unint64_t v67 = v27;
                    }
                    if ((v66 & 1) == 0)
                    {
                      if ((*(unsigned char *)(*(void *)v67 + 132) & 1) == 0) {
                        goto LABEL_85;
                      }
                      BOOL v68 = (id *)(v67 + 64);
                      unint64_t v69 = *(unsigned int *)(v13 + 40) - ((uint64_t)(v67 + 64 - *(void *)(v13 + 32)) >> 6);
                      if (!v69) {
                        goto LABEL_82;
                      }
                      while (1)
                      {
                        unint64_t v70 = v69 >> 1;
                        unint64_t v71 = &v68[8 * (v69 >> 1)];
                        if (*((void *)*v71 + 1) <= v18)
                        {
                          if (*((void *)*v71 + 2) + *((void *)*v71 + 1) > v18)
                          {
                            unint64_t v72 = v67;
                            int v73 = [*v71 isSpecialPhysFootprintRegion:v85 zoneIndex:&OBJC_IVAR___VMUVMRegion_zone_index mallocTypeFlag:&OBJC_IVAR___VMUVMRegion_mallocTypeFlag];
                            unint64_t v67 = v72;
                            uint64_t v10 = (unsigned char *)&unk_1E973B000;
                            int v9 = (_DWORD *)MEMORY[0x1E4F14AF8];
                            uint64_t v6 = a1;
                            a2 = v84;
                            a3 = v85;
                            if (v73) {
                              unint64_t v69 = 0;
                            }
                            else {
                              unint64_t v69 = (unint64_t)v71;
                            }
LABEL_82:
                            if (v69) {
                              unint64_t v27 = v69;
                            }
                            else {
                              unint64_t v27 = v67;
                            }
LABEL_85:
                            _DWORD *v24 = ((v27 - v26) >> 6) + 1;
LABEL_14:
                            unint64_t v28 = *v12 + *v11;
LABEL_15:
                            while (2)
                            {
                              uint64_t v29 = *(char **)v27;
                              if (v28 <= *(void *)(*(void *)v27 + 8)) {
                                goto LABEL_70;
                              }
                              *((_DWORD *)v29 + 37) = a2;
                              *((_DWORD *)v29 + 36) |= a3;
                              *(void *)(v27 + 24) = 0;
                              *(void *)(v27 + 32) = 0;
                              if (v10[2624])
                              {
                                v57 = (FILE **)MEMORY[0x1E4F143C8];
                                fprintf((FILE *)*MEMORY[0x1E4F143C8], "zone %s ", (const char *)[*(id *)(*(void *)(*(void *)(v6 + 32) + 224)+ 24 * v82+ 8) UTF8String]);
                                v81 = *v57;
                                uint64_t v79 = [*(id *)v27 address];
                                uint64_t v58 = *(unsigned int *)(*(void *)v27 + 24);
                                uint64_t v78 = *(void *)(*(void *)v27 + 16) + *(void *)(*(void *)v27 + 8);
                                unsigned int v77 = (&vm_prot_strings_0)[v58];
                                VMURegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(void *)v27 + 104), *(unsigned __int8 *)(*(void *)v27 + 50), v58, *(unsigned __int8 *)(*(void *)v27 + 49));
                                id v76 = objc_claimAutoreleasedReturnValue();
                                uint64_t v75 = (const char *)[v76 UTF8String];
                                uint64_t v59 = *(void *)(*(void *)v27 + 16) >> *MEMORY[0x1E4F14AF8];
                                int v60 = "pages";
                                if (v59 == 1) {
                                  int v60 = "page";
                                }
                                v74 = v60;
                                if (*(void *)(v27 + 24) == *(void *)(v27 + 32)) {
                                  BOOL v61 = "";
                                }
                                else {
                                  BOOL v61 = " [root]";
                                }
                                int v62 = VMUMallocRangeTypeString(v85);
                                fprintf(v81, "claimed region: [%#llx-%#llx] %s %s (%llu %s)%s - type '%s' range: [%#lx-%#lx]\n", v79, v78, v77, v75, v59, v74, v61, v62, *v11, *v12 + *v11);

                                uint64_t v10 = (unsigned char *)&unk_1E973B000;
                                int v9 = (_DWORD *)MEMORY[0x1E4F14AF8];
                                uint64_t v6 = a1;
                                a2 = v84;
                                a3 = v85;
                                uint64_t v29 = *(char **)v27;
                              }
                              uint64_t v30 = (uint64_t *)(v29 + 8);
                              uint64_t v32 = *v30;
                              uint64_t v31 = v30[1];
                              if (v28 <= v31 + v32) {
                                goto LABEL_70;
                              }
                              uint64_t v33 = *(void *)(*(void *)(v6 + 32) + 128);
                              unint64_t v34 = *(void *)(v33 + 48);
                              unint64_t v35 = *(void *)(v33 + 56);
                              BOOL v16 = v35 >= v34;
                              unint64_t v36 = v35 - v34;
                              if (!v16) {
                                goto LABEL_70;
                              }
                              v18 += v31;
                              if (v18 - v34 >= v36) {
                                goto LABEL_70;
                              }
                              unint64_t v37 = v18 >> *v9;
                              if (v37)
                              {
                                BOOL v38 = *(unsigned int **)(v33 + 24);
                                unint64_t v39 = v18 >> *v9;
                                while (*v38 > (v39 & 0x3FFFFFF)
                                     && ((*((unsigned __int8 *)v38 + ((v39 & 0x3FFFFFF) >> 3) + 4) >> (v39 & 7)) & 1) != 0)
                                {
                                  v39 >>= 26;
                                  if (!v39) {
                                    goto LABEL_26;
                                  }
                                }
                                goto LABEL_70;
                              }
LABEL_26:
                              uint64_t v40 = v33 + 4 * (v37 & 0x7FFFF);
                              int v43 = *(_DWORD *)(v40 + 64);
                              unint64_t v42 = (_DWORD *)(v40 + 64);
                              int v41 = v43;
                              if (v43)
                              {
                                unint64_t v27 = *(void *)(v33 + 32) + ((unint64_t)(v41 - 1) << 6);
                                if (v18 - *(void *)(*(void *)v27 + 8) < *(void *)(*(void *)v27 + 16)) {
                                  continue;
                                }
                              }
                              break;
                            }
                            unint64_t v44 = *(unsigned int *)(v33 + 40);
                            if (!v44) {
                              goto LABEL_70;
                            }
                            unint64_t v45 = *(void *)(v33 + 32);
                            while (1)
                            {
                              unint64_t v46 = v44 >> 1;
                              unint64_t v27 = v45 + (v44 >> 1 << 6);
                              if (*(void *)(*(void *)v27 + 8) <= v18)
                              {
                                if (*(void *)(*(void *)v27 + 16) + *(void *)(*(void *)v27 + 8) > v18)
                                {
                                  uint64_t v80 = *(void *)(v33 + 32);
                                  int v47 = [*(id *)v27 isSpecialPhysFootprintRegion];
                                  uint64_t v48 = v80;
                                  uint64_t v10 = (unsigned char *)&unk_1E973B000;
                                  int v9 = (_DWORD *)MEMORY[0x1E4F14AF8];
                                  uint64_t v6 = a1;
                                  a2 = v84;
                                  a3 = v85;
                                  if (v47) {
                                    unint64_t v49 = 0;
                                  }
                                  else {
                                    unint64_t v49 = v27;
                                  }
                                  if (v47) {
                                    goto LABEL_70;
                                  }
                                  if ((*(unsigned char *)(*(void *)v49 + 132) & 1) == 0) {
                                    goto LABEL_52;
                                  }
                                  unint64_t v50 = (id *)(v49 + 64);
                                  unint64_t v51 = *(unsigned int *)(v33 + 40) - ((uint64_t)(v49 + 64 - *(void *)(v33 + 32)) >> 6);
                                  if (!v51) {
                                    goto LABEL_49;
                                  }
                                  while (2)
                                  {
                                    unint64_t v52 = v51 >> 1;
                                    unint64_t v53 = &v50[8 * (v51 >> 1)];
                                    if (*((void *)*v53 + 1) > v18)
                                    {
LABEL_44:
                                      BOOL v54 = v51 > 1;
                                      unint64_t v51 = v52;
                                      if (!v54)
                                      {
                                        unint64_t v51 = 0;
                                        goto LABEL_49;
                                      }
                                      continue;
                                    }
                                    break;
                                  }
                                  if (*((void *)*v53 + 2) + *((void *)*v53 + 1) <= v18)
                                  {
                                    unint64_t v50 = v53 + 8;
                                    unint64_t v52 = --v51 >> 1;
                                    goto LABEL_44;
                                  }
                                  unint64_t v55 = v49;
                                  int v56 = [*v53 isSpecialPhysFootprintRegion:v85 zoneIndex:&OBJC_IVAR___VMUVMRegion_zone_index mallocTypeFlag:&OBJC_IVAR___VMUVMRegion_mallocTypeFlag];
                                  unint64_t v49 = v55;
                                  uint64_t v48 = v80;
                                  uint64_t v10 = (unsigned char *)&unk_1E973B000;
                                  int v9 = (_DWORD *)MEMORY[0x1E4F14AF8];
                                  uint64_t v6 = a1;
                                  a2 = v84;
                                  a3 = v85;
                                  if (v56) {
                                    unint64_t v51 = 0;
                                  }
                                  else {
                                    unint64_t v51 = (unint64_t)v53;
                                  }
LABEL_49:
                                  if (v51) {
                                    unint64_t v27 = v51;
                                  }
                                  else {
                                    unint64_t v27 = v49;
                                  }
LABEL_52:
                                  *unint64_t v42 = ((v27 - v48) >> 6) + 1;
                                  goto LABEL_15;
                                }
                                unint64_t v45 = v27 + 64;
                                unint64_t v46 = --v44 >> 1;
                              }
                              BOOL v16 = v44 >= 2;
                              unint64_t v44 = v46;
                              if (!v16) {
                                goto LABEL_70;
                              }
                            }
                          }
                          BOOL v68 = v71 + 8;
                          unint64_t v70 = --v69 >> 1;
                        }
                        BOOL v54 = v69 > 1;
                        unint64_t v69 = v70;
                        if (!v54)
                        {
                          unint64_t v69 = 0;
                          goto LABEL_82;
                        }
                      }
                    }
                    break;
                  }
                  unint64_t v64 = v27 + 64;
                  unint64_t v65 = --v63 >> 1;
                }
                BOOL v16 = v63 >= 2;
                unint64_t v63 = v65;
              }
              while (v16);
            }
          }
        }
      }
LABEL_70:
      ++v7;
    }
    while (v7 != v8);
  }
}

- (void)addRootNodesFromTask
{
}

- (id)_readonlyRegionRanges
{
  unint64_t v3 = objc_alloc_init(VMUNonOverlappingRangeArray);
  if (self->_regionsCount)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = self->_regions[v4].var0;
      if (([v6 protection] & 1) != 0
        && ([v6 isSubmap] & 1) == 0
        && ([v6 protection] & 2) == 0
        && (-[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v6[1], v6[2])
         || (*((unsigned char *)v6 + 132) & 2) != 0))
      {
        -[VMUNonOverlappingRangeArray addOrExtendRange:](v3, "addOrExtendRange:", v6[1], v6[2]);
      }

      ++v5;
      ++v4;
    }
    while (v5 < self->_regionsCount);
  }

  return v3;
}

- (unsigned)objectContentLevel
{
  return [(VMUObjectIdentifier *)self->_objectIdentifier objectContentLevel];
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  -[VMUObjectIdentifier setObjectContentLevel:](self->_objectIdentifier, "setObjectContentLevel:");
  if (a3 == 2 && self->_regionsCount && self->_objectIdentifier)
  {
    id v5 = [(VMUKernelCoreMemoryScanner *)self _readonlyRegionRanges];
    [(VMUObjectIdentifier *)self->_objectIdentifier setReadonlyRegionRanges:v5];
  }
}

- (void)_sortBlocks
{
}

uint64_t __41__VMUKernelCoreMemoryScanner__sortBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 != *a3;
  }
}

- (void)_enumerateZallocZones:(BOOL)a3 blocks:(BOOL)a4
{
  BOOL v78 = a4;
  BOOL v4 = a3;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v86 = 0;
  uint64_t v87 = 0;
  uint64_t v85 = 0;
  CSSymbolicatorGetAOutSymbolOwner();
  CSSymbolOwnerGetSymbolWithName();
  uint64_t Range = CSSymbolGetRange();
  unint64_t v8 = v7;
  unint64_t v74 = Range;
  -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:");
  int v9 = v87;
  CSSymbolOwnerGetSymbolWithName();
  uint64_t v10 = CSSymbolGetRange();
  unint64_t v12 = v11;
  [(VMUTaskMemoryCache *)self->_memoryCache peekAtAddress:v10 size:v11 returnsBuf:&v86];
  CSSymbolOwnerGetSymbolWithName();
  uint64_t v13 = CSSymbolGetRange();
  unint64_t v15 = v14;
  [(VMUTaskMemoryCache *)self->_memoryCache peekAtAddress:v13 size:v14 returnsBuf:&v85];
  BOOL v16 = v87;
  if (!v87 || !v86 || !v85 || v8 >> 9 < 0x159 || v12 < 0x70 || v15 < 0xAC8) {
    return;
  }
  if (v4)
  {
    [(NSMutableArray *)self->_zoneNames addObject:@"zalloc (no zone)"];
    uint64_t zonesSize = self->_zonesSize;
    if (zonesSize <= 1)
    {
      self->_uint64_t zonesSize = 8;
      unint64_t v18 = (_VMUZoneNode *)malloc_type_realloc(self->_zones, 0xC0uLL, 0x10A00404568A766uLL);
      self->_zones = v18;
      if (!v18)
      {
        NSLog(&cfstr_OutOfMemoryFai.isa, "_zones", zonesSize, self->_zonesSize);
        goto LABEL_90;
      }
      bzero(&v18[zonesSize], 24 * (self->_zonesSize - zonesSize));
    }
    unint64_t v19 = &self->_zones[self->_zonesCount];
    v19->var0 = v74;
    v19->var1 = @"zalloc (no zone)";
    v19->var2 = 0;
    ++self->_zonesCount;
    BOOL v16 = v87;
  }
  unint64_t v20 = (unint64_t)v9 + v8;
  if ((unint64_t)v16 >= v20) {
    return;
  }
  uint64_t v21 = 0;
  uint64_t v22 = (void *)MEMORY[0x1E4F14B00];
  int v23 = v16;
  unint64_t v65 = v20;
  while (!*v16)
  {
LABEL_33:
    ++v21;
    int v23 = v87;
    BOOL v16 = &v87[32 * v21];
    if ((unint64_t)v16 >= v20) {
      return;
    }
  }
  uint64_t v24 = v85 + 4 * v21;
  uint64_t v67 = v21;
  int v25 = [(VMUTaskMemoryCache *)self->_memoryCache peekStringAtAddress:v23[32 * v21 + 2]];
  v88[0] = xmmword_1E5D23510;
  v88[1] = *(_OWORD *)off_1E5D23520;
  if (v25) {
    [NSString stringWithFormat:@"%@%s", *((void *)v88 + (*(unsigned char *)(v24 + 1) & 3)), v25];
  }
  else {
  int v73 = [NSString stringWithFormat:@"UnknownZone (%#llx)", (char *)v16 + v74 - (char *)v87, v64];
  }
  for (uint64_t i = 24; i != -8; i -= 8)

  if (v4)
  {
    unint64_t v27 = (char *)v87;
    unsigned int zonesCount = self->_zonesCount;
    uint64_t blocksSize = self->_zonesSize;
    if (blocksSize > zonesCount)
    {
LABEL_28:
      [(NSMutableArray *)self->_zoneNames addObject:v73];
      uint64_t v33 = &self->_zones[self->_zonesCount];
      v33->var0 = (char *)v16 + v74 - v27;
      v33->var1 = v73;
      v33->var2 = 0;
      if ((*(_WORD *)v24 & 0x4000) != 0 || (*(_WORD *)v24 & 0x300) == 0x200) {
        [(NSMutableSet *)self->_nonScannableZoneNames addObject:v73];
      }
      ++self->_zonesCount;
LABEL_32:
      unint64_t v20 = v65;

      uint64_t v21 = v67;
      goto LABEL_33;
    }
    if ((2 * blocksSize) <= 8) {
      int v30 = 8;
    }
    else {
      int v30 = 2 * blocksSize;
    }
    do
    {
      unsigned int v31 = v30;
      v30 *= 2;
    }
    while (v31 < zonesCount);
    self->_uint64_t zonesSize = v31;
    uint64_t v32 = (_VMUZoneNode *)malloc_type_realloc(self->_zones, 24 * v31, 0x10A00404568A766uLL);
    self->_zones = v32;
    if (v32)
    {
      bzero(&v32[blocksSize], 24 * (self->_zonesSize - blocksSize));
      goto LABEL_28;
    }
    uint64_t v62 = self->_zonesSize;
    unint64_t v63 = "_zones";
LABEL_89:
    NSLog(&cfstr_OutOfMemoryFai.isa, v63, blocksSize, v62);
LABEL_90:
    abort();
  }
  uint64_t v34 = [(NSMutableArray *)self->_zoneNames indexOfObject:v73];
  uint64_t v35 = 0;
  unint64_t v36 = (unsigned __int16 *)&v23[32 * v67];
  *(void *)&v88[0] = v36 + 78;
  *((void *)&v88[0] + 1) = v36 + 80;
  unint64_t v70 = v36 + 26;
  unint64_t v69 = v36 + 29;
  unint64_t v72 = v36 + 27;
  unsigned int v82 = v36 + 30;
  BOOL v68 = v36 + 28;
  uint64_t v71 = v34 << 41;
  char v37 = 1;
  while (2)
  {
    char v66 = v37;
    int v38 = **((_DWORD **)v88 + v35);
    if (!v38) {
      goto LABEL_84;
    }
LABEL_37:
    unint64_t v39 = (((*(void *)&v38 | 0xFFFFFFFF00000000) << *MEMORY[0x1E4F14AF8]) - *v86) >> *MEMORY[0x1E4F14AF8];
    uint64_t v40 = v86[4];
    unsigned int v84 = 0;
    uint64_t v75 = v40 + 16 * v39;
    -[VMUTaskMemoryCache peekAtAddress:size:returnsBuf:](self->_memoryCache, "peekAtAddress:size:returnsBuf:");
    int v41 = v84;
    if (v84)
    {
      int v42 = *(_DWORD *)v82;
      if ((*(_DWORD *)v82 & 0x100) != 0)
      {
        uint64_t v80 = (unsigned __int16)v84[2];
        unsigned int v43 = 1;
        if ((v42 & 0x40) == 0) {
          goto LABEL_42;
        }
LABEL_40:
        unsigned int v44 = *v68;
      }
      else
      {
        uint64_t v80 = *v70;
        unsigned int v43 = *v69;
        if ((v42 & 0x40) != 0) {
          goto LABEL_40;
        }
LABEL_42:
        unsigned int v44 = 1;
      }
      unsigned int v79 = v44;
      if (!v43) {
        goto LABEL_83;
      }
      unint64_t v45 = 0;
      unint64_t v81 = *v86 + *v22 * v39;
      unint64_t v76 = v81 + *v72;
      if (v44 <= 1) {
        uint64_t v46 = 1;
      }
      else {
        uint64_t v46 = v44;
      }
      uint64_t v47 = v43;
      char v48 = !v78;
      if (!v44) {
        char v48 = 1;
      }
      char v77 = v48;
LABEL_50:
      if (*((unsigned char *)v82 + 1))
      {
        if ((v77 & 1) == 0) {
          goto LABEL_71;
        }
      }
      else
      {
        if (v81 >= v86[10])
        {
          unint64_t v49 = v84;
          if (v81 > v86[11]) {
            goto LABEL_56;
          }
          BOOL v52 = (*v84 & 0xF000) == 40960;
        }
        else
        {
          unint64_t v49 = v84;
LABEL_56:
          if ((*v49 & 0x800) != 0)
          {
            unint64_t v83 = 0;
            [(VMUTaskMemoryCache *)self->_memoryCache peekAtAddress:v75 + ((v45 >> 1) & 0x3FFFFFF0) size:16 returnsBuf:&v83];
            if (!v83) {
              break;
            }
            BOOL v52 = ((*(_DWORD *)(v83 + 4) >> v45) & 1) == 0;
          }
          else
          {
            uint64_t v50 = v86[6];
            uint64_t v51 = 8 * (*((_DWORD *)v49 + 1) & 0xFFFFFFF);
            unint64_t v83 = 0;
            [(VMUTaskMemoryCache *)self->_memoryCache readPointerAt:v50 + ((v45 >> 3) & 0xFFFFFF8) + v51 value:&v83];
            BOOL v52 = ((v83 >> v45) & 1) == 0;
          }
        }
        if (v52 && v78 && v79 != 0)
        {
LABEL_71:
          uint64_t v56 = 0;
          unsigned int blocksCount = self->_blocksCount;
          do
          {
            uint64_t blocksSize = self->_blocksSize;
            if (blocksSize <= blocksCount)
            {
              if ((2 * blocksSize) <= 0x40000) {
                int v59 = 0x40000;
              }
              else {
                int v59 = 2 * blocksSize;
              }
              do
              {
                unsigned int v60 = v59;
                v59 *= 2;
              }
              while (v60 < blocksCount);
              self->_uint64_t blocksSize = v60;
              blocks = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v60, 0x1000040451B5BE8uLL);
              self->_blocks = blocks;
              if (!blocks)
              {
                uint64_t v62 = self->_blocksSize;
                unint64_t v63 = "_blocks";
                goto LABEL_89;
              }
              unsigned int blocksCount = self->_blocksCount;
            }
            else
            {
              blocks = self->_blocks;
            }
            BOOL v61 = &blocks[blocksCount];
            v61->var0 = v76 + v45 * v80 + *v22 * v56;
            *((void *)v61 + 1) = v71 | (32 * v80) | 9;
            unsigned int blocksCount = self->_blocksCount + 1;
            self->_unsigned int blocksCount = blocksCount;
            ++v56;
          }
          while (v56 != v46);
        }
      }
      if (++v45 == v47)
      {
        int v41 = v84;
        BOOL v4 = 0;
LABEL_83:
        int v38 = *((_DWORD *)v41 + 2);
        if (!v38)
        {
LABEL_84:
          char v37 = 0;
          uint64_t v35 = 1;
          if ((v66 & 1) == 0) {
            goto LABEL_32;
          }
          continue;
        }
        goto LABEL_37;
      }
      goto LABEL_50;
    }
    break;
  }
}

- (BOOL)addMallocNodesFromTaskWithError:(id *)a3
{
  return 1;
}

- (void)addMallocNodesFromTask
{
}

- (void)addMallocNodes:(id)a3
{
  unint64_t v18 = a3;
  if ([v18 count])
  {
    uint64_t blocksSize = self->_blocksSize;
    id v5 = v18;
    int v6 = v18[2];
    unsigned int v7 = self->_blocksCount - 1;
    if (blocksSize <= v7 + v6)
    {
      if ((2 * blocksSize) <= 0x40000) {
        unsigned int v8 = 0x40000;
      }
      else {
        unsigned int v8 = 2 * blocksSize;
      }
      do
      {
        unsigned int v9 = v8;
        self->_uint64_t blocksSize = v8;
        v8 *= 2;
      }
      while (v9 < v7 + v18[2]);
      uint64_t v10 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v9, 0x1000040451B5BE8uLL);
      self->_blocks = v10;
      if (!v10)
      {
        NSLog(&cfstr_OutOfMemoryFai.isa, "_blocks", blocksSize, self->_blocksSize);
        abort();
      }
      id v5 = v18;
      int v6 = v18[2];
    }
    if (v6)
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      unsigned int blocksCount = self->_blocksCount;
      do
      {
        unint64_t v14 = (unint64_t *)(*((void *)v5 + 2) + v11);
        unint64_t v16 = *v14;
        unint64_t v15 = v14[1];
        unint64_t v17 = &self->_blocks[blocksCount];
        if (v15 >= 0xFFFFFFFFFLL) {
          unint64_t v15 = 0xFFFFFFFFFLL;
        }
        v17->var0 = v16;
        *((void *)v17 + 1) = (32 * v15) | 1;
        unsigned int blocksCount = self->_blocksCount + 1;
        self->_unsigned int blocksCount = blocksCount;
        ++v12;
        v11 += 16;
      }
      while (v12 < v5[2]);
    }
    [(VMUKernelCoreMemoryScanner *)self _sortAndClassifyBlocks];
  }
}

- (BOOL)addAllNodesFromTaskWithError:(id *)a3
{
  BOOL v5 = -[VMUKernelCoreMemoryScanner addRootNodesFromTaskWithError:](self, "addRootNodesFromTaskWithError:");
  if (v5)
  {
    LOBYTE(v5) = [(VMUKernelCoreMemoryScanner *)self addMallocNodesFromTaskWithError:a3];
  }
  return v5;
}

- (void)_sortAndClassifyBlocks
{
  [(VMUKernelCoreMemoryScanner *)self _sortBlocks];
  [(VMUKernelCoreMemoryScanner *)self _buildRegionFirstBlockIndexOnPageArrays];
  [(VMUKernelCoreMemoryScanner *)self _fixupBlockIsas];
  [(VMUKernelCoreMemoryScanner *)self _findMarkedAbandonedBlocks];

  [(VMUKernelCoreMemoryScanner *)self unmapAllRegions];
}

- (void)setClassStructureFieldScanValueAtSourceAddress:(void *)a3 toCorrectedAddress:(void *)a4
{
  classStructureAddressToDestinationMapTable = self->_classStructureAddressToDestinationMapTable;
  if (!classStructureAddressToDestinationMapTable)
  {
    unsigned int v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:1282 valueOptions:1282];
    unsigned int v9 = self->_classStructureAddressToDestinationMapTable;
    self->_classStructureAddressToDestinationMapTable = v8;

    classStructureAddressToDestinationMapTable = self->_classStructureAddressToDestinationMapTable;
  }

  NSMapInsert(classStructureAddressToDestinationMapTable, a3, a4);
}

- (void)printRuntimeMetadataInfo
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __54__VMUKernelCoreMemoryScanner_printRuntimeMetadataInfo__block_invoke;
  v29[3] = &unk_1E5D23538;
  v29[4] = self;
  unint64_t v3 = (void (**)(void, void, void, void))MEMORY[0x1AD0DA230](v29, a2);
  BOOL v4 = [(NSMutableDictionary *)self->_addressToRuntimeMetadataChunkInfoDict allKeys];
  BOOL v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v26;
    int v23 = v3;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v14 = [(NSMutableDictionary *)self->_addressToRuntimeMetadataChunkInfoDict objectForKeyedSubscript:v13];
        unint64_t v15 = [v13 unsignedLongLongValue];
        unint64_t v16 = &self->_blocks[v10];
        if (v15 >= ((*((void *)v16 + 1) >> 5) & 0xFFFFFFFFFLL) + v16->var0)
        {
          uint64_t v20 = [(VMUKernelCoreMemoryScanner *)self nodeForAddress:v15];
          uint64_t v21 = v14;

          unsigned int v8 = v21;
          uint64_t v10 = v20;
          unint64_t v9 = v15;
        }
        else
        {
          if (v9)
          {
            uint64_t v17 = v11;
            if ([v14[2] infoType] == 8) {
              unint64_t v18 = "Swift Metadata";
            }
            else {
              unint64_t v18 = "Metadata";
            }
            putchar(10);
            unint64_t v19 = &self->_blocks[v10];
            uint64_t v22 = v18;
            uint64_t v11 = v17;
            unint64_t v3 = v23;
            printf("%s %#llx-%#llx[%llu]\n", v22, v19->var0, ((*((void *)v19 + 1) >> 5) & 0xFFFFFFFFFLL) + v19->var0, (*((void *)v19 + 1) >> 5) & 0xFFFFFFFFFLL);
            ((void (**)(void, uint64_t, unint64_t, id *))v3)[2](v3, v10, v9, v8);

            unsigned int v8 = 0;
          }
          ((void (**)(void, uint64_t, unint64_t, id *))v3)[2](v3, v10, v15, v14);
          unint64_t v9 = 0;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned int v8 = 0;
  }
}

void __54__VMUKernelCoreMemoryScanner_printRuntimeMetadataInfo__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int v8 = (char *)&VMUObjCClassStructureTypeInfoArray + 24 * a4[3];
  int v9 = *((_DWORD *)v8 + 4);
  strchr(*((char **)v8 + 1), 40);
  uint64_t v10 = a4;
  __strcpy_chk();
  *strchr(__s, 41) = 0;
  uint64_t v11 = a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a2);
  if (*((unsigned char *)v10 + 8)) {
    unint64_t v12 = "metaclass";
  }
  else {
    unint64_t v12 = "class";
  }
  uint64_t v13 = (void *)*((void *)v10 + 2);

  id v14 = [v13 className];
  printf("    +%5llu %#llx[%u]  %-13s  %s %s\n", v11, a3, v9, __s, v12, (const char *)[v14 UTF8String]);
}

- (void)_fixupBlockIsas
{
  unint64_t blocksCount = self->_blocksCount;
  if (blocksCount)
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    LODWORD(v7) = -1;
    unsigned int v8 = &unk_1E973B000;
    int v9 = (FILE **)MEMORY[0x1E4F143C8];
    do
    {
      blocks = self->_blocks;
      unint64_t v11 = *((void *)&blocks[v4] + 1);
      if ((v11 & 7) == 1)
      {
        unint64_t var0 = blocks[v4].var0;
        if (var0 >= v6)
        {
          uint64_t v13 = ((uint64_t)(int)v7 << 6) + 64;
          uint64_t v14 = (int)v7 + 1;
          do
          {
            if (v14 >= (int)self->_regionsCount)
            {
              unint64_t v5 = -1;
              unint64_t v6 = -1;
            }
            else
            {
              unint64_t v15 = (unint64_t *)(*(char **)((char *)&self->_regions->var0 + v13) + 8);
              unint64_t v5 = *v15;
              unint64_t v6 = (*(void **)((char *)&self->_regions->var0 + v13))[2] + *v15;
            }
            LODWORD(v7) = v7 + 1;
            v13 += 64;
            ++v14;
          }
          while (var0 >= v6);
        }
        unint64_t v16 = var0 + ((v11 >> 5) & 0xFFFFFFFFFLL);
        if (v16 > v5)
        {
          uint64_t v17 = (uint64_t)(int)v7 << 6;
          uint64_t v7 = (int)v7;
          regions = self->_regions;
          do
          {
            unint64_t v19 = self->_blocks;
            uint64_t v20 = &v19[v4];
            unint64_t v21 = *((void *)v20 + 1);
            if ((v21 & 0x18) == 8)
            {
              if (v8[2624])
              {
                int v23 = (*(_DWORD **)((char *)&regions->var0 + v17))[37];
                unint64_t v24 = v21 >> 41;
                if (v23 != -1 && v23 != v24)
                {
                  fprintf(*v9, "warning: zone fixup failed - block %#llx from zone \"%s\" discovered in region [%#llx-%#llx] already claimed by \"%s\"\n", v20->var0, (const char *)[self->_zones[v24].var1 UTF8String], v5, v6, (const char *)[objc_retainAutorelease(self->_zones[(*(unsigned int **)((char *)&self->_regions->var0+ v17))[37]].var1) UTF8String]);
                  int v9 = (FILE **)MEMORY[0x1E4F143C8];
                  unsigned int v8 = (unsigned char *)&unk_1E973B000;
                  unint64_t v19 = self->_blocks;
                  unint64_t v21 = *((void *)&v19[v4] + 1);
                  regions = self->_regions;
                }
              }
              (*(_DWORD **)((char *)&regions->var0 + v17))[37] = v21 >> 41;
              *((void *)&v19[v4] + 1) &= 0x1FFFFFFFFFFuLL;
              *((void *)&self->_blocks[v4] + 1) &= 0xFFFFFFFFFFFFFFE7;
              regions = self->_regions;
            }
            uint64_t v22 = *(uint64_t *)((char *)&regions->var0 + v17);
            *(_DWORD *)(v22 + 144) |= 1u;
            ++*(void *)(v22 + 136);
            if (v16 <= v6) {
              break;
            }
            if (++v7 >= (int)self->_regionsCount)
            {
              unint64_t v6 = -1;
              unint64_t v5 = -1;
              break;
            }
            unint64_t v5 = (*(void **)((char *)&regions[1].var0 + v17))[1];
            unint64_t v6 = (*(void **)((char *)&regions[1].var0 + v17))[2] + v5;
            v17 += 64;
          }
          while (v16 > v5);
          unint64_t blocksCount = self->_blocksCount;
        }
      }
      ++v4;
    }
    while (v4 < blocksCount);
  }
  self->_initializedRegionMallocBlockCounts = 1;
  long long v26 = [(VMUObjectIdentifier *)self->_objectIdentifier memoryReader];
  long long v27 = [(VMUObjectIdentifier *)self->_objectIdentifier swiftRuntimeInfoStableABI];
  long long v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    id v29 = [(VMUObjectIdentifier *)self->_objectIdentifier swiftRuntimeInfoPreABI];
  }
  int v30 = v29;

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke;
  v33[3] = &unk_1E5D23090;
  id v34 = v30;
  id v35 = v26;
  v33[4] = self;
  id v31 = v30;
  id v32 = v26;
  [(VMUKernelCoreMemoryScanner *)self _withOrderedNodeMapper:v33];
  [(VMUKernelCoreMemoryScanner *)self _updateLinearClassInfos];
  [(VMUKernelCoreMemoryScanner *)self _identifyNonObjectsPointedToByTypedIvars:[(VMUClassInfoMap *)self->_classInfoIndexer count]];
  [(VMUKernelCoreMemoryScanner *)self _updateLinearClassInfos];
  [(VMUKernelCoreMemoryScanner *)self _identifyNonObjectsUsingStackBacktrace];
  [(VMUKernelCoreMemoryScanner *)self _updateLinearClassInfos];
  mergesort_b(self->_instanceValues, self->_instanceValuesCount, 0x10uLL, &__block_literal_global_114);
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 8;
    do
    {
      if ((*(void *)(*(void *)(v2 + 96) + v6) & 0xFFFFFE0000000007) == 1)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_2;
        v7[3] = &unk_1E5D23068;
        v7[4] = v2;
        int v10 = v5;
        id v9 = *(id *)(a1 + 48);
        id v8 = *(id *)(a1 + 40);
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, 1, v7);

        uint64_t v2 = *(void *)(a1 + 32);
      }
      ++v5;
      v6 += 16;
    }
    while (v5 < *(unsigned int *)(v2 + 104));
  }
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 96);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  if (HIDWORD(*(void *)(v6 + 16 * v7))) {
    BOOL v8 = (*(void *)(v6 + 16 * v7) & 7) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8
    && ([*(id *)(v5 + 80) classInfoForMemory:a2 length:(*(void *)(v6 + 16 * v7 + 8) >> 5) & 0xFFFFFFFFFLL] != 0)
  {
    int v10 = v9;
    if ([v9 hasSpecificLayout])
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 288) indexForClassInfo:v10];
      unint64_t v12 = *(void **)(*(void *)(a1 + 32) + 512);
      uint64_t v13 = [NSNumber numberWithUnsignedInt:v11];
      uint64_t v14 = [v12 objectForKeyedSubscript:v13];

      if (!v14)
      {
        uint64_t v14 = objc_opt_new();
        unint64_t v15 = *(void **)(*(void *)(a1 + 32) + 512);
        unint64_t v16 = [NSNumber numberWithUnsignedInt:v11];
        [v15 setObject:v14 forKeyedSubscript:v16];
      }
      uint64_t v17 = (void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 56));
      uint64_t v18 = [v10 instanceSpecificInfoForObject:*v17 ofSize:v17[1] >> 5 withScanner:v17[2] memoryReader:v17[3]];

      int v10 = (void *)v18;
    }
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_3;
    v29[3] = &unk_1E5D23018;
    uint64_t v34 = a2;
    id v30 = v10;
    id v20 = *(id *)(a1 + 40);
    uint64_t v21 = *(void *)(a1 + 32);
    id v31 = v20;
    uint64_t v32 = v21;
    id v33 = *(id *)(a1 + 48);
    id v22 = v10;
    [v22 enumerateSublayoutsForSize:v19 withBlock:v29];
    unsigned int v23 = [*(id *)(*(void *)(a1 + 32) + 288) indexForClassInfo:v22];
    uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 56);
    *(void *)(v24 + 8) = *(void *)(v24 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v23 << 41);
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(*(void *)(v25 + 96) + 16 * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_4;
    v28[3] = &unk_1E5D23040;
    v28[4] = v25;
    [v22 enumerateExternalValuesFromObject:a2 withSize:v26 block:v28];
  }
  else
  {
    uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 56);
    *(void *)(v27 + 8) &= 0x1FFFFFFFFFFuLL;
  }
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_3(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  unint64_t v6 = *(void *)(*(void *)(a1 + 64) + a3);
  if (a4 == 3)
  {
    v6 &= ~1uLL;
  }
  else if (a4 == 5)
  {
    BOOL v8 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    id v10 = v8;
    if (v10)
    {
      if ([v9 usesSwiftRefcounting] && v9.pointerSize == a3)
      {
        id v11 = v10;
        uint64_t v12 = [v11 refcountIsSideTableMarkerMask] & v6;
        if (v12 == [v11 refcountIsSideTableMarkerValue])
        {
          unint64_t v13 = [v11 sideTablePointerMask] & v6;
          unint64_t v14 = v13 >> [v11 sideTablePointerRightShift];
          unint64_t v6 = v14 << [v11 sideTablePointerLeftShift];
        }
        else
        {
          unint64_t v6 = 0;
        }
      }
      else
      {
        v6 &= [v10 nativeWeakReferencePointerMask];
      }
    }
  }
  if (HIDWORD(v6)) {
    BOOL v15 = (v6 & 7) == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15) {
    return;
  }
  unint64_t v16 = *(uint64_t **)(*(void *)(a1 + 48) + 128);
  unint64_t v18 = v16[6];
  unint64_t v17 = v16[7];
  unint64_t v19 = v17 - v18;
  BOOL v20 = v17 < v18;
  if (v6 - v18 >= v19 || v20) {
    return;
  }
  uint64_t v21 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v22 = v6 >> *MEMORY[0x1E4F14AF8];
  if (v22)
  {
    unsigned int v23 = (unsigned int *)v16[3];
    unint64_t v24 = v6 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*v23 <= (v24 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) == 0)
      {
        return;
      }
      v24 >>= 26;
    }
    while (v24);
  }
  uint64_t v25 = (uint64_t)v16 + 4 * (v22 & 0x7FFFF);
  int v28 = *(_DWORD *)(v25 + 64);
  uint64_t v27 = (_DWORD *)(v25 + 64);
  int v26 = v28;
  uint64_t v29 = v16[4];
  if (v28)
  {
    unint64_t v30 = v29 + ((unint64_t)(v26 - 1) << 6);
    if (v6 - *(void *)(*(void *)v30 + 8) < *(void *)(*(void *)v30 + 16)) {
      goto LABEL_27;
    }
  }
  unint64_t v47 = *((unsigned int *)v16 + 10);
  if (!v47) {
    return;
  }
  unint64_t v48 = v16[4];
  while (1)
  {
    unint64_t v49 = v47 >> 1;
    unint64_t v30 = v48 + (v47 >> 1 << 6);
    if (*(void *)(*(void *)v30 + 8) <= v6) {
      break;
    }
LABEL_50:
    BOOL v45 = v47 >= 2;
    unint64_t v47 = v49;
    if (!v45) {
      return;
    }
  }
  if (*(void *)(*(void *)v30 + 16) + *(void *)(*(void *)v30 + 8) <= v6)
  {
    unint64_t v48 = v30 + 64;
    unint64_t v49 = --v47 >> 1;
    goto LABEL_50;
  }
  int v50 = [*(id *)v30 isSpecialPhysFootprintRegion];
  if (v50) {
    unint64_t v51 = 0;
  }
  else {
    unint64_t v51 = v30;
  }
  if (v50) {
    return;
  }
  if ((*(unsigned char *)(*(void *)v51 + 132) & 1) == 0) {
    goto LABEL_85;
  }
  BOOL v52 = (id *)(v51 + 64);
  unint64_t v53 = *((unsigned int *)v16 + 10) - ((uint64_t)(v51 + 64 - v16[4]) >> 6);
  if (!v53) {
    goto LABEL_82;
  }
  while (2)
  {
    unint64_t v54 = v53 >> 1;
    unint64_t v55 = &v52[8 * (v53 >> 1)];
    if (*((void *)*v55 + 1) > v6)
    {
LABEL_61:
      BOOL v56 = v53 > 1;
      unint64_t v53 = v54;
      if (!v56)
      {
        unint64_t v53 = 0;
        goto LABEL_82;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v55 + 2) + *((void *)*v55 + 1) <= v6)
  {
    BOOL v52 = v55 + 8;
    unint64_t v54 = --v53 >> 1;
    goto LABEL_61;
  }
  if ([*v55 isSpecialPhysFootprintRegion]) {
    unint64_t v53 = 0;
  }
  else {
    unint64_t v53 = (unint64_t)v55;
  }
LABEL_82:
  if (v53) {
    unint64_t v51 = v53;
  }
  unint64_t v30 = v51;
LABEL_85:
  *uint64_t v27 = ((v51 - v29) >> 6) + 1;
LABEL_27:
  unsigned int v31 = *(_DWORD *)(v30 + 20);
  if (v31)
  {
    uint64_t v32 = *(void *)(v30 + 8);
    uint64_t v33 = *v16;
    uint64_t v34 = *(unsigned int *)(v30 + 16);
    id v35 = (unint64_t *)(*v16 + 16 * v34);
    if (v32)
    {
      if (*v35 > v6) {
        return;
      }
      unint64_t v36 = (void *)(v33 + 16 * (v31 + v34 - 1));
      if (((v36[1] >> 5) & 0xFFFFFFFFFuLL) + *v36 <= v6) {
        return;
      }
      char v37 = (unsigned int *)(v32 + 4 * ((v6 - (*v35 & -*MEMORY[0x1E4F14B00])) >> *v21));
      uint64_t v38 = *v37;
      unint64_t v39 = (unint64_t *)(v33 + 16 * v38);
      if (*v39 > v6) {
        return;
      }
      uint64_t v40 = v37[1];
      if (v40 < *((_DWORD *)v16 + 2)
        && (v41 = (unint64_t *)(v33 + 16 * v40), unint64_t v42 = *v41, *v41 <= v6))
      {
LABEL_63:
        unint64_t v57 = v41[1];
        if ((v57 & 7) - 2 < 3) {
          return;
        }
        unint64_t v58 = (unint64_t)v41 - v33;
        unint64_t v59 = v58 >> 4;
        unint64_t v60 = v6 - v42;
        unint64_t v61 = v16[2];
        if (v60 >= v61)
        {
          if (((v57 >> 5) & 0xFFFFFFFFFLL) - v60 > v61 || v59 == -1) {
            return;
          }
        }
        else if (v59 == -1)
        {
          return;
        }
        uint64_t v63 = *(void *)(*(void *)(a1 + 48) + 96);
        if (v63)
        {
          uint64_t v64 = (v58 >> 4);
          if (*(void *)(v63 + 16 * v64) == v6)
          {
            uint64_t v65 = v63 + 16 * v64;
            uint64_t v67 = *(void *)(v65 + 8);
            char v66 = (unint64_t *)(v65 + 8);
            if ((v67 & 7) == 1)
            {
              BOOL v68 = (void *)MEMORY[0x1AD0D9F90]();
              unint64_t v69 = [a2 instanceSpecificInfoForObject:v6 ofSize:*v66 >> 5 withScanner:*(void *)(a1 + 48) memoryReader:*(void *)(a1 + 56)];
              if (v69) {
                *char v66 = *v66 & 0x1FFFFFFFFFFLL | ((unint64_t)[*(id *)(*(void *)(a1 + 48) + 288) indexForClassInfo:v69] << 41);
              }
            }
          }
        }
      }
      else
      {
        unsigned int v43 = v40 - v38;
        if (v43)
        {
          do
          {
            uint64_t v44 = v43 >> 1;
            int v41 = &v39[2 * v44];
            unint64_t v42 = *v41;
            if (*v41 <= v6)
            {
              if (((v39[2 * v44 + 1] >> 5) & 0xFFFFFFFFFLL) + v42 > v6) {
                goto LABEL_63;
              }
              unint64_t v39 = v41 + 2;
              LODWORD(v44) = --v43 >> 1;
            }
            BOOL v45 = v43 >= 2;
            unsigned int v43 = v44;
          }
          while (v45);
        }
      }
    }
    else
    {
      do
      {
        uint64_t v46 = v31 >> 1;
        int v41 = &v35[2 * v46];
        unint64_t v42 = *v41;
        if (*v41 <= v6)
        {
          if (((v35[2 * v46 + 1] >> 5) & 0xFFFFFFFFFLL) + v42 > v6) {
            goto LABEL_63;
          }
          id v35 = v41 + 2;
          LODWORD(v46) = --v31 >> 1;
        }
        BOOL v45 = v31 >= 2;
        unsigned int v31 = v46;
      }
      while (v45);
    }
  }
}

void __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = *(uint64_t **)(*(void *)(a1 + 32) + 128);
  unint64_t v8 = v6[6];
  unint64_t v7 = v6[7];
  unint64_t v9 = v7 - v8;
  BOOL v10 = v7 < v8;
  if (a2 - v8 < v9 && !v10)
  {
    id v11 = (_DWORD *)MEMORY[0x1E4F14AF8];
    unint64_t v12 = a2 >> *MEMORY[0x1E4F14AF8];
    if (v12)
    {
      unint64_t v13 = (unsigned int *)v6[3];
      unint64_t v14 = a2 >> *MEMORY[0x1E4F14AF8];
      do
      {
        if (*v13 <= (v14 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v13 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
        {
          goto LABEL_73;
        }
        v14 >>= 26;
      }
      while (v14);
    }
    uint64_t v15 = (uint64_t)v6 + 4 * (v12 & 0x7FFFF);
    int v18 = *(_DWORD *)(v15 + 64);
    unint64_t v17 = (_DWORD *)(v15 + 64);
    int v16 = v18;
    uint64_t v19 = v6[4];
    if (v18)
    {
      unint64_t v20 = v19 + ((unint64_t)(v16 - 1) << 6);
      if (a2 - *(void *)(*(void *)v20 + 8) < *(void *)(*(void *)v20 + 16)) {
        goto LABEL_10;
      }
    }
    unint64_t v37 = *((unsigned int *)v6 + 10);
    if (v37)
    {
      unint64_t v38 = v6[4];
      do
      {
        unint64_t v39 = v37 >> 1;
        unint64_t v20 = v38 + (v37 >> 1 << 6);
        if (*(void *)(*(void *)v20 + 8) <= a2)
        {
          if (*(void *)(*(void *)v20 + 16) + *(void *)(*(void *)v20 + 8) > a2)
          {
            id v66 = v5;
            int v40 = [*(id *)v20 isSpecialPhysFootprintRegion];
            id v5 = v66;
            if (v40) {
              unint64_t v41 = 0;
            }
            else {
              unint64_t v41 = v20;
            }
            if (v40) {
              break;
            }
            if ((*(unsigned char *)(*(void *)v41 + 132) & 1) == 0) {
              goto LABEL_64;
            }
            unint64_t v42 = (id *)(v41 + 64);
            unint64_t v43 = *((unsigned int *)v6 + 10) - ((uint64_t)(v41 + 64 - v6[4]) >> 6);
            if (!v43) {
              goto LABEL_61;
            }
            while (1)
            {
              unint64_t v44 = v43 >> 1;
              BOOL v45 = &v42[8 * (v43 >> 1)];
              if (*((void *)*v45 + 1) <= a2)
              {
                if (*((void *)*v45 + 2) + *((void *)*v45 + 1) > a2)
                {
                  int v59 = [*v45 isSpecialPhysFootprintRegion];
                  id v5 = v66;
                  if (v59) {
                    unint64_t v43 = 0;
                  }
                  else {
                    unint64_t v43 = (unint64_t)v45;
                  }
LABEL_61:
                  if (v43) {
                    unint64_t v41 = v43;
                  }
                  unint64_t v20 = v41;
LABEL_64:
                  *unint64_t v17 = ((v41 - v19) >> 6) + 1;
LABEL_10:
                  unsigned int v21 = *(_DWORD *)(v20 + 20);
                  if (v21)
                  {
                    uint64_t v22 = *(void *)(v20 + 8);
                    uint64_t v23 = *v6;
                    uint64_t v24 = *(unsigned int *)(v20 + 16);
                    uint64_t v25 = (unint64_t *)(*v6 + 16 * v24);
                    if (v22)
                    {
                      if (*v25 <= a2)
                      {
                        int v26 = (void *)(v23 + 16 * (v21 + v24 - 1));
                        if (((v26[1] >> 5) & 0xFFFFFFFFFuLL) + *v26 > a2)
                        {
                          uint64_t v27 = (unsigned int *)(v22 + 4 * ((a2 - (*v25 & -*MEMORY[0x1E4F14B00])) >> *v11));
                          uint64_t v28 = *v27;
                          uint64_t v29 = (unint64_t *)(v23 + 16 * v28);
                          if (*v29 <= a2)
                          {
                            uint64_t v30 = v27[1];
                            if (v30 < *((_DWORD *)v6 + 2)
                              && (unsigned int v31 = (unint64_t *)(v23 + 16 * v30), v32 = *v31, *v31 <= a2))
                            {
LABEL_46:
                              unint64_t v47 = v31[1];
                              if ((v47 & 7) - 2 < 3) {
                                goto LABEL_73;
                              }
                              unint64_t v48 = (unint64_t)v31 - v23;
                              unint64_t v49 = ((unint64_t)v31 - v23) >> 4;
                              unint64_t v50 = a2 - v32;
                              unint64_t v51 = v6[2];
                              if (v50 >= v51)
                              {
                                if (((v47 >> 5) & 0xFFFFFFFFFLL) - v50 > v51 || v49 == -1) {
                                  goto LABEL_73;
                                }
                              }
                              else if (v49 == -1)
                              {
                                goto LABEL_73;
                              }
                              uint64_t v53 = *(void *)(a1 + 32);
                              uint64_t v54 = *(void *)(v53 + 96);
                              if (v54)
                              {
                                uint64_t v55 = (v48 >> 4);
                                if ((*(void *)(v54 + 16 * v55 + 8) & 7) == 1)
                                {
                                  uint64_t v56 = *(unsigned int *)(v53 + 268);
                                  unsigned int v57 = *(_DWORD *)(v53 + 264);
                                  if (v56 <= v57)
                                  {
                                    int v60 = 2 * v56;
                                    if ((2 * v56) <= 0x10) {
                                      int v60 = 16;
                                    }
                                    *(_DWORD *)(v53 + 268) = v60;
                                    uint64_t v61 = *(void *)(a1 + 32);
                                    unsigned int v62 = *(_DWORD *)(v61 + 268);
                                    id v67 = v5;
                                    if (v62 < *(_DWORD *)(v61 + 264))
                                    {
                                      uint64_t v63 = (_DWORD *)(v61 + 268);
                                      do
                                      {
                                        *uint64_t v63 = 2 * v62;
                                        uint64_t v61 = *(void *)(a1 + 32);
                                        uint64_t v63 = (_DWORD *)(v61 + 268);
                                        unsigned int v62 = *(_DWORD *)(v61 + 268);
                                      }
                                      while (v62 < *(_DWORD *)(v61 + 264));
                                    }
                                    *(void *)(*(void *)(a1 + 32) + 256) = malloc_type_realloc(*(void **)(v61 + 256), 16 * v62, 0x108004057E67DB5uLL);
                                    uint64_t v64 = *(void *)(a1 + 32);
                                    uint64_t v58 = *(void *)(v64 + 256);
                                    if (!v58)
                                    {
                                      NSLog(&cfstr_OutOfMemoryFai.isa, "_instanceValues", v56, *(unsigned int *)(v64 + 268));
                                      abort();
                                    }
                                    unsigned int v57 = *(_DWORD *)(v64 + 264);
                                    id v5 = v67;
                                  }
                                  else
                                  {
                                    uint64_t v58 = *(void *)(v53 + 256);
                                  }
                                  uint64_t v65 = (void *)(v58 + 16 * v57);
                                  *uint64_t v65 = v55;
                                  v65[1] = 0;
                                  ++*(_DWORD *)(*(void *)(a1 + 32) + 264);
                                }
                              }
                            }
                            else
                            {
                              unsigned int v33 = v30 - v28;
                              if (v33)
                              {
                                do
                                {
                                  uint64_t v34 = v33 >> 1;
                                  unsigned int v31 = &v29[2 * v34];
                                  unint64_t v32 = *v31;
                                  if (*v31 <= a2)
                                  {
                                    if (((v29[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a2) {
                                      goto LABEL_46;
                                    }
                                    uint64_t v29 = v31 + 2;
                                    LODWORD(v34) = --v33 >> 1;
                                  }
                                  BOOL v35 = v33 >= 2;
                                  unsigned int v33 = v34;
                                }
                                while (v35);
                              }
                            }
                          }
                        }
                      }
                    }
                    else
                    {
                      do
                      {
                        uint64_t v36 = v21 >> 1;
                        unsigned int v31 = &v25[2 * v36];
                        unint64_t v32 = *v31;
                        if (*v31 <= a2)
                        {
                          if (((v25[2 * v36 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a2) {
                            goto LABEL_46;
                          }
                          uint64_t v25 = v31 + 2;
                          LODWORD(v36) = --v21 >> 1;
                        }
                        BOOL v35 = v21 >= 2;
                        unsigned int v21 = v36;
                      }
                      while (v35);
                    }
                  }
                  goto LABEL_73;
                }
                unint64_t v42 = v45 + 8;
                unint64_t v44 = --v43 >> 1;
              }
              BOOL v46 = v43 > 1;
              unint64_t v43 = v44;
              if (!v46)
              {
                unint64_t v43 = 0;
                goto LABEL_61;
              }
            }
          }
          unint64_t v38 = v20 + 64;
          unint64_t v39 = --v37 >> 1;
        }
        BOOL v35 = v37 >= 2;
        unint64_t v37 = v39;
      }
      while (v35);
    }
  }
LABEL_73:
}

uint64_t __45__VMUKernelCoreMemoryScanner__fixupBlockIsas__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

- (void)_identifyNonObjectsPointedToByTypedIvars:(unsigned int)a3
{
  unsigned int v5 = a3 + 1;
  unint64_t v6 = malloc_type_calloc(1uLL, ((a3 + 8) >> 3) + 4, 0xFF42C4F3uLL);
  *unint64_t v6 = v5;
  classInfoIndexer = self->_classInfoIndexer;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke;
  v14[3] = &__block_descriptor_40_e32_v36__0Q8__VMUClassInfo_16I24_B28l;
  v14[4] = v6;
  [(VMUClassInfoMap *)classInfoIndexer enumerateInfosWithBlock:v14];
  unint64_t v8 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:1282];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_2;
  v10[3] = &unk_1E5D23128;
  unsigned int v13 = a3;
  id v11 = v8;
  unint64_t v12 = v6;
  void v10[4] = self;
  id v9 = v8;
  [(VMUKernelCoreMemoryScanner *)self _withOrderedNodeMapper:v10];
  free(v6);
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  id v9 = a3;
  if ([v9 infoType] != 1 && [v9 infoType] != 128
    || ([v9 className],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"__NSMallocBlock__"],
        v6,
        v7))
  {
    unint64_t v8 = *(unsigned int **)(a1 + 32);
    if (*v8 > a4) {
      *((unsigned char *)v8 + (a4 >> 3) + 4) |= 1 << (a4 & 7);
    }
  }
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 8;
    do
    {
      unint64_t v7 = *(void *)(*(void *)(v2 + 96) + v6);
      if ((v7 & 7) == 1)
      {
        unint64_t v8 = v7 >> 41;
        if (*(_DWORD *)(a1 + 56) >= v7 >> 41)
        {
          id v9 = *(_DWORD **)(a1 + 48);
          if (*v9 <= v8
            || ((*((unsigned __int8 *)v9 + (v8 >> 3) + 4) >> (v8 & 7)) & 1) == 0)
          {
            id v10 = *(id *)(*(void *)(v2 + 272) + 8 * v8);
            id v11 = v10;
            if (v10)
            {
              v17[0] = MEMORY[0x1E4F143A8];
              v17[1] = 3221225472;
              v17[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_3;
              v17[3] = &unk_1E5D23560;
              id v12 = v10;
              uint64_t v13 = *(void *)(a1 + 32);
              unint64_t v14 = *(void **)(a1 + 40);
              id v18 = v12;
              uint64_t v19 = v13;
              id v15 = v14;
              uint64_t v16 = *(void *)(a1 + 48);
              id v20 = v15;
              uint64_t v21 = v16;
              int v22 = v8;
              (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, 1, v17);
            }
            uint64_t v2 = *(void *)(a1 + 32);
          }
        }
      }
      ++v5;
      v6 += 16;
    }
    while (v5 < *(unsigned int *)(v2 + 104));
  }
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_4;
  v9[3] = &unk_1E5D230D8;
  id v12 = &v14;
  uint64_t v13 = a2;
  unint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v6;
  id v11 = *(id *)(a1 + 32);
  -[VMUClassInfo enumerateAllPointerFieldsWithBlock:](v5, (uint64_t)v9);
  if (!*((unsigned char *)v15 + 24))
  {
    unint64_t v7 = *(_DWORD **)(a1 + 56);
    unint64_t v8 = *(unsigned int *)(a1 + 64);
    if (*v7 > v8) {
      *((unsigned char *)v7 + (v8 >> 3) + 4) |= 1 << (v8 & 7);
    }
  }

  _Block_object_dispose(&v14, 8);
}

void __71__VMUKernelCoreMemoryScanner__identifyNonObjectsPointedToByTypedIvars___block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a1 + 64);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  unint64_t v9 = *(void *)(v8 + [a2 offset] + a4);
  if (HIDWORD(v9)) {
    BOOL v10 = (v9 & 7) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10) {
    return;
  }
  id v11 = *(uint64_t **)(*(void *)(a1 + 32) + 128);
  unint64_t v13 = v11[6];
  unint64_t v12 = v11[7];
  unint64_t v14 = v12 - v13;
  BOOL v15 = v12 < v13;
  if (v9 - v13 >= v14 || v15) {
    return;
  }
  uint64_t v16 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v17 = v9 >> *MEMORY[0x1E4F14AF8];
  if (v17)
  {
    id v18 = (unsigned int *)v11[3];
    unint64_t v19 = v9 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*v18 <= (v19 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)v18 + ((v19 & 0x3FFFFFF) >> 3) + 4) >> (v19 & 7)) & 1) == 0)
      {
        return;
      }
      v19 >>= 26;
    }
    while (v19);
  }
  uint64_t v20 = (uint64_t)v11 + 4 * (v17 & 0x7FFFF);
  int v23 = *(_DWORD *)(v20 + 64);
  int v22 = (_DWORD *)(v20 + 64);
  int v21 = v23;
  uint64_t v24 = v11[4];
  if (v23)
  {
    unint64_t v25 = v24 + ((unint64_t)(v21 - 1) << 6);
    if (v9 - *(void *)(*(void *)v25 + 8) < *(void *)(*(void *)v25 + 16)) {
      goto LABEL_15;
    }
  }
  unint64_t v42 = *((unsigned int *)v11 + 10);
  if (!v42) {
    return;
  }
  unint64_t v43 = v11[4];
  while (1)
  {
    unint64_t v44 = v42 >> 1;
    unint64_t v25 = v43 + (v42 >> 1 << 6);
    if (*(void *)(*(void *)v25 + 8) <= v9) {
      break;
    }
LABEL_38:
    BOOL v40 = v42 >= 2;
    unint64_t v42 = v44;
    if (!v40) {
      return;
    }
  }
  if (*(void *)(*(void *)v25 + 16) + *(void *)(*(void *)v25 + 8) <= v9)
  {
    unint64_t v43 = v25 + 64;
    unint64_t v44 = --v42 >> 1;
    goto LABEL_38;
  }
  int v45 = [*(id *)v25 isSpecialPhysFootprintRegion];
  uint64_t v16 = (_DWORD *)MEMORY[0x1E4F14AF8];
  if (v45) {
    unint64_t v46 = 0;
  }
  else {
    unint64_t v46 = v25;
  }
  if (v45) {
    return;
  }
  if ((*(unsigned char *)(*(void *)v46 + 132) & 1) == 0) {
    goto LABEL_71;
  }
  unint64_t v47 = (id *)(v46 + 64);
  unint64_t v48 = *((unsigned int *)v11 + 10) - ((uint64_t)(v46 + 64 - v11[4]) >> 6);
  if (!v48) {
    goto LABEL_68;
  }
  while (2)
  {
    unint64_t v49 = v48 >> 1;
    unint64_t v50 = &v47[8 * (v48 >> 1)];
    if (*((void *)*v50 + 1) > v9)
    {
LABEL_49:
      BOOL v51 = v48 > 1;
      unint64_t v48 = v49;
      if (!v51)
      {
        unint64_t v48 = 0;
        goto LABEL_68;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v50 + 2) + *((void *)*v50 + 1) <= v9)
  {
    unint64_t v47 = v50 + 8;
    unint64_t v49 = --v48 >> 1;
    goto LABEL_49;
  }
  unint64_t v64 = v46;
  int v65 = [*v50 isSpecialPhysFootprintRegion];
  unint64_t v46 = v64;
  uint64_t v16 = (_DWORD *)MEMORY[0x1E4F14AF8];
  if (v65) {
    unint64_t v48 = 0;
  }
  else {
    unint64_t v48 = (unint64_t)v50;
  }
LABEL_68:
  if (v48) {
    unint64_t v46 = v48;
  }
  unint64_t v25 = v46;
LABEL_71:
  _DWORD *v22 = ((v46 - v24) >> 6) + 1;
LABEL_15:
  unsigned int v26 = *(_DWORD *)(v25 + 20);
  if (v26)
  {
    uint64_t v27 = *(void *)(v25 + 8);
    uint64_t v28 = *v11;
    uint64_t v29 = *(unsigned int *)(v25 + 16);
    uint64_t v30 = (unint64_t *)(*v11 + 16 * v29);
    if (v27)
    {
      if (*v30 > v9) {
        return;
      }
      unsigned int v31 = (void *)(v28 + 16 * (v26 + v29 - 1));
      if (((v31[1] >> 5) & 0xFFFFFFFFFuLL) + *v31 <= v9) {
        return;
      }
      unint64_t v32 = (unsigned int *)(v27 + 4 * ((v9 - (*v30 & -*MEMORY[0x1E4F14B00])) >> *v16));
      uint64_t v33 = *v32;
      uint64_t v34 = (unint64_t *)(v28 + 16 * v33);
      if (*v34 > v9) {
        return;
      }
      uint64_t v35 = v32[1];
      if (v35 < *((_DWORD *)v11 + 2))
      {
        uint64_t v36 = (unint64_t *)(v28 + 16 * v35);
        unint64_t v37 = *v36;
        if (*v36 <= v9)
        {
LABEL_51:
          unint64_t v52 = v36[1];
          if ((v52 & 7) - 2 < 3) {
            return;
          }
          unint64_t v53 = (unint64_t)v36 - v28;
          unint64_t v54 = v53 >> 4;
          unint64_t v55 = v9 - v37;
          unint64_t v56 = v11[2];
          if (v55 >= v56)
          {
            if (((v52 >> 5) & 0xFFFFFFFFFLL) - v55 > v56 || v54 == -1) {
              return;
            }
          }
          else if (v54 == -1)
          {
            return;
          }
          uint64_t v58 = *(void *)(*(void *)(a1 + 32) + 96);
          if (!v58) {
            return;
          }
          uint64_t v59 = (v53 >> 4);
          if (*(void *)(v58 + 16 * v59) != v9) {
            return;
          }
          uint64_t v60 = v58 + 16 * v59;
          uint64_t v62 = *(void *)(v60 + 8);
          uint64_t v61 = (unint64_t *)(v60 + 8);
          if ((v62 & 0xFFFFFE0000000007) != 1) {
            return;
          }
          uint64_t v63 = NSMapGet(*(NSMapTable **)(a1 + 40), a2);
          if (!v63)
          {
            if ([*(id *)(a1 + 48) infoType] == 8) {
              [a2 fullIvarNameAtOffset:a4];
            }
            else {
            id v79 = [a2 ivarName];
            }
            id v66 = [a3 typeName];
            if ([v66 length])
            {
              id v67 = [a3 typeName];
              int v68 = [v67 characterAtIndex:0];

              if (v68 == 35)
              {

                return;
              }
            }
            else
            {
            }
            unsigned int v80 = 0;
            id v69 = [a3 typeName];
            descriptionForTypeOfReferencedAllocation((char *)[v69 UTF8String], &v80);
            unint64_t v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

            uint64_t v71 = NSString;
            uint64_t v72 = [*(id *)(a1 + 48) displayName];
            int v73 = (void *)v72;
            unint64_t v74 = @"malloc";
            if (v70) {
              unint64_t v74 = v70;
            }
            uint64_t v75 = [v71 stringWithFormat:@"%@.%@ (%@)", v72, v79, v74];

            unint64_t v76 = [*(id *)(a1 + 48) binaryPath];
            char v77 = +[VMUClassInfo classInfoWithClassName:v75 binaryPath:v76 type:v80];

            unint64_t v78 = [*(id *)(*(void *)(a1 + 32) + 288) indexForClassInfo:v77];
            NSMapInsert(*(NSMapTable **)(a1 + 40), a3, (const void *)v78);

            LODWORD(v63) = v78;
          }
          *uint64_t v61 = *v61 & 0x1FFFFFFFFFFLL | ((unint64_t)v63 << 41);
          return;
        }
      }
      unsigned int v38 = v35 - v33;
      if (v38)
      {
        do
        {
          uint64_t v39 = v38 >> 1;
          uint64_t v36 = &v34[2 * v39];
          unint64_t v37 = *v36;
          if (*v36 <= v9)
          {
            if (((v34[2 * v39 + 1] >> 5) & 0xFFFFFFFFFLL) + v37 > v9) {
              goto LABEL_51;
            }
            uint64_t v34 = v36 + 2;
            LODWORD(v39) = --v38 >> 1;
          }
          BOOL v40 = v38 >= 2;
          unsigned int v38 = v39;
        }
        while (v40);
      }
    }
    else
    {
      do
      {
        uint64_t v41 = v26 >> 1;
        uint64_t v36 = &v30[2 * v41];
        unint64_t v37 = *v36;
        if (*v36 <= v9)
        {
          if (((v30[2 * v41 + 1] >> 5) & 0xFFFFFFFFFLL) + v37 > v9) {
            goto LABEL_51;
          }
          uint64_t v30 = v36 + 2;
          LODWORD(v41) = --v26 >> 1;
        }
        BOOL v40 = v26 >= 2;
        unsigned int v26 = v41;
      }
      while (v40);
    }
  }
}

- (id)_typeNameForZoneName:(id)a3
{
  return (id)[@"non-object in zone " stringByAppendingString:a3];
}

- (void)_identifyNonObjectsUsingStackBacktrace
{
  unint64_t v3 = objc_opt_new();
  unint64_t blocksCount = self->_blocksCount;
  if (blocksCount)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 8;
    do
    {
      blocks = self->_blocks;
      if ((*(unint64_t *)((unsigned char *)&blocks->var0 + v6) & 7) == 1)
      {
        [(VMUKernelCoreMemoryScanner *)self nodeDetails:v5];
        uint64_t v8 = [(VMUKernelCoreMemoryScanner *)self zoneNameForNode:v5];
        unint64_t v9 = [v3 objectForKeyedSubscript:v8];
        LODWORD(v10) = [v9 unsignedIntValue];
        if (!v10)
        {
          unint64_t v14 = [(VMUKernelCoreMemoryScanner *)self _typeNameForZoneName:v8];
          id v11 = +[VMUClassInfo classInfoWithClassName:v14 binaryPath:@"<unknown>" type:0];
          [v11 setIsDerivedFromStackBacktrace:1];
          uint64_t v10 = [(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:v11];
          [NSNumber numberWithUnsignedInt:v10];
          unint64_t v13 = v12 = v3;
          [v12 setObject:v13 forKeyedSubscript:v8];

          unint64_t v3 = v12;
        }
        *(unint64_t *)((char *)&blocks->var0 + v6) = *(unint64_t *)((unsigned char *)&blocks->var0 + v6) & 0x1FFFFFFFFFFLL | ((unint64_t)v10 << 41);

        unint64_t blocksCount = self->_blocksCount;
      }
      ++v5;
      v6 += 16;
    }
    while (v5 < blocksCount);
  }
}

- (void)_findMarkedAbandonedBlocks
{
  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0;
  }
  if (!self->_abandonedMarkingEnabled) {
    return;
  }
  LODWORD(regionsCount) = self->_regionsCount;
  if (!regionsCount) {
    return;
  }
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  unsigned int v7 = 0;
  uint64_t v8 = 0;
  do
  {
    regions = self->_regions;
    p_unint64_t var0 = &regions[v5].var0;
    if (*((_DWORD *)*p_var0 + 26) != 10) {
      goto LABEL_51;
    }
    memoryCache = self->_memoryCache;
    unint64_t v12 = self->_task;
    unint64_t v13 = memoryCache;
    if (p_var0[6]) {
      goto LABEL_8;
    }
    uint64_t v63 = v13;
    if ((*((unsigned char *)*p_var0 + 132) & 2) == 0)
    {
      [(VMUTaskMemoryCache *)v13 taskIsTranslated];
      unint64_t v13 = v63;
    }
    v64[0] = 0;
    unint64_t v68 = 0;
    int v36 = [(VMUTaskMemoryCache *)v13 mapAddress:*((void *)*p_var0 + 1) size:*((void *)*p_var0 + 2) returnedAddress:v64 returnedSize:&v68];
    if (!v36)
    {
      unint64_t v13 = v63;
      unint64_t v47 = v68;
      p_var0[6] = (id)v64[0];
      unint64_t v48 = &regions[v5];
      v48->unint64_t var6 = v47;
      v48->var8 = (_VMURegionNode *)p_var0;
LABEL_8:

      unint64_t v14 = self->_regions;
      unint64_t var7 = (unint64_t)v14[v5].var7;
      if (var7)
      {
        uint64_t v16 = (unint64_t *)MEMORY[0x1E4F14B00];
        unint64_t v17 = *MEMORY[0x1E4F14B00];
        uint64_t v18 = v8;
        do
        {
          unint64_t v19 = v17 + var7;
          if (*(void *)var7 == 0x1DE67829AD1A2FBBLL && *(_DWORD *)(var7 + 8) <= 1u)
          {
            unsigned int v20 = *(_DWORD *)(var7 + 20);
            unsigned int v21 = v7 + v20 - 1;
            if (v18 <= v21)
            {
              uint64_t v22 = v17 >> 3;
              if (v22 <= 2 * (int)v18) {
                LODWORD(v22) = 2 * v18;
              }
              if (v22 <= 0x100) {
                uint64_t v22 = 256;
              }
              else {
                uint64_t v22 = v22;
              }
              do
              {
                uint64_t v8 = v22;
                uint64_t v22 = (2 * v22);
              }
              while (v8 < v21);
              int v23 = malloc_type_realloc(v6, 8 * v8, 0x100004000313F17uLL);
              if (!v23)
              {
                NSLog(&cfstr_OutOfMemoryFai.isa, "allMarkedAddresses", v18, v8);
                abort();
              }
              uint64_t v6 = v23;
              unsigned int v20 = *(_DWORD *)(var7 + 20);
            }
            else
            {
              uint64_t v8 = v18;
            }
            unint64_t v24 = *(unsigned int *)(var7 + 12) + var7;
            uint64_t v25 = v20;
            if (v20)
            {
              unsigned int v26 = (uint64_t *)(*(unsigned int *)(var7 + 12) + var7);
              uint64_t v27 = v25;
              do
              {
                uint64_t v29 = *v26++;
                uint64_t v28 = v29;
                if (v29) {
                  *((void *)v6 + v7++) = v28;
                }
                --v27;
              }
              while (v27);
            }
            unint64_t v30 = v24 + 8 * v25;
            unint64_t v17 = *v16;
            unint64_t v19 = (v30 + *v16 - 1) & -(uint64_t)*v16;
            unint64_t v14 = self->_regions;
          }
          else
          {
            uint64_t v8 = v18;
          }
          BOOL v31 = (void *)v19 >= (char *)v14[v5].var7 + v14[v5].var6 || v19 == 0;
          uint64_t v18 = v8;
          unint64_t var7 = v19;
        }
        while (!v31);
      }
      unint64_t v32 = self->_memoryCache;
      uint64_t v33 = v32;
      uint64_t v34 = &v14[v5];
      if (v34->var7)
      {
        if (v34->var8 == v34)
        {
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = ___unmapRegion_block_invoke_0;
          v64[3] = &unk_1E5D235B0;
          int v65 = v32;
          id v66 = &v14[v5];
          id v67 = v14;
          unint64_t v46 = (void (**)(void))MEMORY[0x1AD0DA230](v64);
          v46[2]();
        }
        else
        {
          uint64_t v35 = &v14[v5];
          v35->unint64_t var6 = 0;
          v35->unint64_t var7 = 0;
          v35->var8 = 0;
        }
      }

      goto LABEL_51;
    }
    int v62 = v36;
    unint64_t v37 = v12;
    if ((*((_DWORD *)*p_var0 + 13) & 3u) - 1 >= 2)
    {
      BOOL v38 = task_exists(v12);
      if (v5 != regionsCount - 1 && v38)
      {
        uint64_t v61 = (FILE *)*MEMORY[0x1E4F143C8];
        uint64_t v60 = [*p_var0 address];
        uint64_t v39 = *((unsigned int *)*p_var0 + 6);
        uint64_t v59 = *((void *)*p_var0 + 2) + *((void *)*p_var0 + 1);
        BOOL v40 = (&vm_prot_strings_0)[v39];
        VMURegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)*p_var0 + 104), *((unsigned __int8 *)*p_var0 + 50), v39, *((unsigned __int8 *)*p_var0 + 49));
        id v41 = objc_claimAutoreleasedReturnValue();
        unint64_t v42 = (const char *)[v41 UTF8String];
        uint64_t v43 = *((void *)*p_var0 + 2) >> *MEMORY[0x1E4F14AF8];
        unint64_t v44 = "pages";
        if (v43 == 1) {
          unint64_t v44 = "page";
        }
        int v45 = " [root]";
        if (regions[v5].var4 == regions[v5].var5) {
          int v45 = "";
        }
        uint64_t v58 = v40;
        unint64_t v37 = v12;
        fprintf(v61, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v60, v59, v58, v42, v43, v44, v45, v62);
      }
    }

LABEL_51:
    ++v5;
    unint64_t regionsCount = self->_regionsCount;
  }
  while (v5 < regionsCount);
  if (v6)
  {
    unsigned int blocksCount = self->_blocksCount;
    unint64_t v50 = malloc_type_calloc(1uLL, ((blocksCount + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *unint64_t v50 = blocksCount;
    self->_userMarkedAbandoned = v50;
    mergesort_b(v6, v7, 8uLL, &__block_literal_global_139);
    if (v7)
    {
      uint64_t v51 = 0;
      unint64_t v52 = 0;
      do
      {
        unint64_t v53 = self->_blocksCount;
        if (v52 >= v53) {
          break;
        }
        blocks = self->_blocks;
        unint64_t v55 = (void *)&blocks[v52] + 1;
        while (1)
        {
          if ((*v55 & 7) == 1)
          {
            unint64_t v56 = *((void *)v6 + v51);
            if (*(v55 - 1) >= v56) {
              break;
            }
          }
          ++v52;
          v55 += 2;
          if (v53 == v52) {
            goto LABEL_67;
          }
        }
        unint64_t v53 = v52;
        if (blocks[v52].var0 != v56)
        {
LABEL_67:
          unint64_t v52 = v53;
          goto LABEL_68;
        }
        unsigned int v57 = self->_userMarkedAbandoned;
        if (*v57 > v52) {
          *((unsigned char *)v57 + (v52 >> 3) + 4) |= 1 << (v52 & 7);
        }
        unint64_t v52 = v52;
LABEL_68:
        ++v51;
      }
      while (v51 != v7);
    }
    free(v6);
  }
}

uint64_t __56__VMUKernelCoreMemoryScanner__findMarkedAbandonedBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 != *a3;
  }
}

- (void)refineTypesWithOverlay:(id)a3
{
  [(VMUClassInfoMap *)self->_classInfoIndexer _applyTypeOverlay:a3];

  [(VMUKernelCoreMemoryScanner *)self _updateLinearClassInfos];
}

- (void)applyTypeOverlayToMutableInfo:(id)a3
{
  classInfoIndexer = self->_classInfoIndexer;
  scanOverlay = self->_scanOverlay;
  id v5 = a3;
  id v6 = [(VMUScanOverlay *)scanOverlay refinementRules];
  -[VMUClassInfoMap _applyTypeOverlayRules:toMutableInfo:]((uint64_t)classInfoIndexer, v6, v5);
}

- (void)_buildRegionFirstBlockIndexOnPageArrays
{
}

- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:
{
  if (a1)
  {
    LODWORD(v11) = a6;
    BOOL v15 = [*(id *)(a1 + 80) swiftRuntimeInfoStableABI];
    uint64_t v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [*(id *)(a1 + 80) swiftRuntimeInfoPreABI];
    }
    v227 = v17;

    uint64_t v18 = [*(id *)(a1 + 80) hasSwiftContent];
    if (v11 && *(unsigned char *)(a1 + 364))
    {
      unint64_t v19 = a5 - 8;
      if (a5 < 8) {
        goto LABEL_184;
      }
      uint64_t v20 = v11;
      id v21 = *(id *)(*(void *)(a1 + 272) + 8 * v11);
      uint64_t v22 = v21;
      uint64_t v23 = v11 >> 3;
      unsigned int v230 = v11;
      if (!*(void *)(*(void *)(a1 + 296) + 8 * v11))
      {
        uint64_t v24 = [v21 instanceSize];
        v239[0] = 0;
        v239[1] = v239;
        v239[2] = 0x2020000000;
        unsigned int v240 = (v24 >> 3) + 2;
        *(void *)(*(void *)(a1 + 296) + 8 * v11) = malloc_type_malloc(4 * v240, 0x100004052888210uLL);
        uint64_t v25 = *(_DWORD **)(a1 + 304);
        if (*v25 > v11) {
          *((unsigned char *)v25 + v23 + 4) &= ~(1 << (v11 & 7));
        }
        uint64_t v235 = 0;
        v236 = &v235;
        uint64_t v237 = 0x2020000000;
        int v238 = 0;
        v233[0] = MEMORY[0x1E4F143A8];
        v233[1] = 3221225472;
        v233[2] = __97__VMUKernelCoreMemoryScanner_scanLocalMemory_atOffset_node_length_isa_fieldInfo_stride_recorder___block_invoke;
        v233[3] = &unk_1E5D231E8;
        v233[5] = &v235;
        v233[6] = v239;
        v233[4] = a1;
        int v234 = v11;
        [v22 enumerateScanningLocationsForSize:v24 withBlock:v233];
        uint64_t v26 = *(void *)(*(void *)(a1 + 296) + 8 * v11);
        uint64_t v11 = *((unsigned int *)v236 + 6);
        *((_DWORD *)v236 + 6) = v11 + 1;
        *(_DWORD *)(v26 + 4 * v11) = (v24 + 7) & 0xFFFFF8 | ([v22 defaultScanType] << 24);
        uint64_t v27 = *(void *)(*(void *)(a1 + 296) + 8 * v20);
        uint64_t v28 = *((unsigned int *)v236 + 6);
        *((_DWORD *)v236 + 6) = v28 + 1;
        *(_DWORD *)(v27 + 4 * v28) = ([v22 defaultScanType] << 24) | 0xFFFFFF;
        _Block_object_dispose(&v235, 8);
        _Block_object_dispose(v239, 8);
        LOBYTE(v11) = v230;
      }
      v214 = v22;
      unint64_t v29 = 0;
      unsigned int v30 = 0;
      uint64_t v228 = a2 + a3;
      uint64_t v221 = v23 + 4;
      int v219 = 1 << (v11 & 7);
      while (1)
      {
        unsigned int v31 = *(_DWORD *)(*(void *)(*(void *)(a1 + 296) + 8 * v20) + 4 * v30);
        uint64_t v32 = HIBYTE(v31);
        unint64_t v33 = v29 + 8;
        if (HIBYTE(v31) == 1) {
          unint64_t v33 = v29 + 1;
        }
        if ((v31 & 0xFFFFFF) == 0xFFFFFF)
        {
          unint64_t v29 = v33;
        }
        else
        {
          ++v30;
          unint64_t v29 = *(void *)&v31 & 0xFFFFFFLL;
        }
        if (((*(_DWORD *)(a1 + 376) >> SHIBYTE(v31)) & 1) == 0 || v29 > v19) {
          goto LABEL_89;
        }
        unsigned int v34 = HIBYTE(v31);
        uint64_t v35 = *(void *)(v228 + v29);
        if (v34 == 3) {
          break;
        }
        if (v34 != 5) {
          goto LABEL_30;
        }
        id v36 = v214;
        id v37 = v227;
        if (v227)
        {
          if ([v36 usesSwiftRefcounting]
            && v29 == [v36 pointerSize])
          {
            id v38 = v37;
            uint64_t v39 = [v38 refcountIsSideTableMarkerMask] & v35;
            if (v39 == [v38 refcountIsSideTableMarkerValue])
            {
              unint64_t v40 = [v38 sideTablePointerMask] & v35;
              unint64_t v41 = v40 >> [v38 sideTablePointerRightShift];
              uint64_t v35 = v41 << [v38 sideTablePointerLeftShift];
            }
            else
            {
              uint64_t v35 = 0;
            }
          }
          else
          {
            v35 &= [v37 nativeWeakReferencePointerMask];
          }
        }

        uint64_t v32 = 5;
        unsigned int v42 = v230;
LABEL_35:
        uint64_t v43 = *(unsigned int **)(a1 + 304);
        if (*v43 > v42 && (v219 & *((unsigned char *)v43 + v221)) != 0) {
          v35 &= 0xFFFFFFFFFFFFF8uLL;
        }
        if (!v35) {
          goto LABEL_89;
        }
        uint64_t v224 = *(void *)(*(void *)(a1 + 96) + 16 * a4);
        unint64_t v44 = *(uint64_t **)(a1 + 128);
        unint64_t v45 = -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 8), v35);
        unint64_t v46 = v44[6];
        unint64_t v47 = v44[7];
        BOOL v48 = v47 >= v46;
        unint64_t v49 = v47 - v46;
        if (!v48) {
          goto LABEL_89;
        }
        unint64_t v50 = v45;
        if (v45 - v46 >= v49) {
          goto LABEL_89;
        }
        unint64_t v51 = v45 >> *MEMORY[0x1E4F14AF8];
        if (v51)
        {
          unint64_t v52 = (unsigned int *)v44[3];
          unint64_t v53 = v45 >> *MEMORY[0x1E4F14AF8];
          do
          {
            if (*v52 <= (v53 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v52 + ((v53 & 0x3FFFFFF) >> 3) + 4) >> (v53 & 7)) & 1) == 0)
            {
              goto LABEL_89;
            }
            v53 >>= 26;
          }
          while (v53);
        }
        uint64_t v54 = (uint64_t)v44 + 4 * (v51 & 0x7FFFF);
        int v57 = *(_DWORD *)(v54 + 64);
        unint64_t v56 = (_DWORD *)(v54 + 64);
        int v55 = v57;
        if (v57)
        {
          unint64_t v58 = v44[4] + ((unint64_t)(v55 - 1) << 6);
          if (v45 - *(void *)(*(void *)v58 + 8) < *(void *)(*(void *)v58 + 16)) {
            goto LABEL_49;
          }
        }
        unint64_t v74 = *((unsigned int *)v44 + 10);
        if (!v74) {
          goto LABEL_89;
        }
        unint64_t v75 = v44[4];
        while (1)
        {
          unint64_t v76 = v74 >> 1;
          unint64_t v58 = v75 + (v74 >> 1 << 6);
          if (*(void *)(*(void *)v58 + 8) <= v45) {
            break;
          }
LABEL_72:
          BOOL v48 = v74 >= 2;
          unint64_t v74 = v76;
          if (!v48) {
            goto LABEL_89;
          }
        }
        if (*(void *)(*(void *)v58 + 16) + *(void *)(*(void *)v58 + 8) <= v45)
        {
          unint64_t v75 = v58 + 64;
          unint64_t v76 = --v74 >> 1;
          goto LABEL_72;
        }
        uint64_t v212 = v44[4];
        int v77 = [*(id *)v58 isSpecialPhysFootprintRegion];
        uint64_t v78 = v212;
        if (v77) {
          unint64_t v79 = 0;
        }
        else {
          unint64_t v79 = v58;
        }
        if (v77) {
          goto LABEL_89;
        }
        if ((*(unsigned char *)(*(void *)v79 + 132) & 1) == 0) {
          goto LABEL_103;
        }
        unsigned int v80 = (id *)(v79 + 64);
        unint64_t v81 = *((unsigned int *)v44 + 10) - ((uint64_t)(v79 + 64 - v44[4]) >> 6);
        if (!v81) {
          goto LABEL_100;
        }
        while (2)
        {
          unint64_t v82 = v81 >> 1;
          unint64_t v83 = &v80[8 * (v81 >> 1)];
          if (*((void *)*v83 + 1) > v50)
          {
LABEL_83:
            BOOL v84 = v81 > 1;
            unint64_t v81 = v82;
            if (!v84)
            {
              unint64_t v81 = 0;
              goto LABEL_100;
            }
            continue;
          }
          break;
        }
        if (*((void *)*v83 + 2) + *((void *)*v83 + 1) <= v50)
        {
          unsigned int v80 = v83 + 8;
          unint64_t v82 = --v81 >> 1;
          goto LABEL_83;
        }
        unint64_t v211 = v79;
        int v89 = [*v83 isSpecialPhysFootprintRegion];
        unint64_t v79 = v211;
        uint64_t v78 = v212;
        if (v89) {
          unint64_t v81 = 0;
        }
        else {
          unint64_t v81 = (unint64_t)v83;
        }
LABEL_100:
        if (v81) {
          unint64_t v79 = v81;
        }
        unint64_t v58 = v79;
LABEL_103:
        *unint64_t v56 = ((v79 - v78) >> 6) + 1;
LABEL_49:
        unsigned int v59 = *(_DWORD *)(v58 + 20);
        if (v59)
        {
          uint64_t v60 = *(void *)(v58 + 8);
          uint64_t v61 = *v44;
          uint64_t v62 = *(unsigned int *)(v58 + 16);
          uint64_t v63 = (unint64_t *)(*v44 + 16 * v62);
          if (v60)
          {
            if (*v63 > v50) {
              goto LABEL_89;
            }
            unint64_t v64 = (void *)(v61 + 16 * (v59 + v62 - 1));
            if (((v64[1] >> 5) & 0xFFFFFFFFFuLL) + *v64 <= v50) {
              goto LABEL_89;
            }
            int v65 = (unsigned int *)(v60 + 4 * ((v50 - (*v63 & -*MEMORY[0x1E4F14B00])) >> *MEMORY[0x1E4F14AF8]));
            uint64_t v66 = *v65;
            id v67 = (unint64_t *)(v61 + 16 * v66);
            if (*v67 > v50) {
              goto LABEL_89;
            }
            uint64_t v68 = v65[1];
            if (v68 < *((_DWORD *)v44 + 2))
            {
              id v69 = (unint64_t *)(v61 + 16 * v68);
              unint64_t v70 = *v69;
              if (*v69 <= v50)
              {
LABEL_85:
                unint64_t v85 = v69[1];
                if ((v85 & 7) - 2 < 3) {
                  goto LABEL_89;
                }
                unint64_t v86 = ((unint64_t)v69 - v61) >> 4;
                unint64_t v87 = v44[2];
                if (v50 - v70 >= v87)
                {
                  if (((v85 >> 5) & 0xFFFFFFFFFLL) - (v50 - v70) > v87 || v86 == -1) {
                    goto LABEL_89;
                  }
                }
                else if (v86 == -1)
                {
                  goto LABEL_89;
                }
                (*(void (**)(uint64_t, void, unint64_t, uint64_t))(a9 + 16))(a9, a4, v29 + a3 + v224, v32);
                goto LABEL_89;
              }
            }
            unsigned int v71 = v68 - v66;
            if (v71)
            {
              do
              {
                uint64_t v72 = v71 >> 1;
                id v69 = &v67[2 * v72];
                unint64_t v70 = *v69;
                if (*v69 <= v50)
                {
                  if (((v67[2 * v72 + 1] >> 5) & 0xFFFFFFFFFLL) + v70 > v50) {
                    goto LABEL_85;
                  }
                  id v67 = v69 + 2;
                  LODWORD(v72) = --v71 >> 1;
                }
                BOOL v48 = v71 >= 2;
                unsigned int v71 = v72;
              }
              while (v48);
            }
          }
          else
          {
            do
            {
              uint64_t v73 = v59 >> 1;
              id v69 = &v63[2 * v73];
              unint64_t v70 = *v69;
              if (*v69 <= v50)
              {
                if (((v63[2 * v73 + 1] >> 5) & 0xFFFFFFFFFLL) + v70 > v50) {
                  goto LABEL_85;
                }
                uint64_t v63 = v69 + 2;
                LODWORD(v73) = --v59 >> 1;
              }
              BOOL v48 = v59 >= 2;
              unsigned int v59 = v73;
            }
            while (v48);
          }
        }
LABEL_89:
        if (v29 > v19)
        {

          goto LABEL_184;
        }
      }
      v35 &= ~1uLL;
      if (*(void *)(v228 + v29)) {
        uint64_t v32 = 2;
      }
      else {
        uint64_t v32 = 3;
      }
LABEL_30:
      unsigned int v42 = v230;
      goto LABEL_35;
    }
    if (a7 && *(unsigned char *)(a1 + 364))
    {
      unint64_t v90 = ((a3 + 7) & 0xFFFFFFF8) - a3;
      unint64_t v91 = (v90 + 8);
      if (v91 > a5) {
        goto LABEL_184;
      }
      uint64_t v231 = a2 + a3;
      while (1)
      {
        unint64_t v92 = v90;
        unint64_t v90 = v91;
        LODWORD(v239[0]) = 0;
        v93 = [a7 getLeafFieldAtOffset:v92 leafOffset:v239];
        unsigned int v94 = LODWORD(v239[0]) + 8;
        if (v94 > [v93 size]) {
          goto LABEL_160;
        }
        uint64_t v95 = *(void *)(v231 + v92);
        uint64_t v96 = *(void *)(a1 + 8);
        uint64_t v225 = *(void *)(*(void *)(a1 + 96) + 16 * a4);
        unsigned int v226 = [v93 scanType];
        if (!v95) {
          goto LABEL_160;
        }
        uint64_t v97 = *(uint64_t **)(a1 + 128);
        unint64_t v98 = -[VMUTask ptrauthStripDataPointer:](v96, v95);
        unint64_t v99 = v97[6];
        unint64_t v100 = v97[7];
        BOOL v48 = v100 >= v99;
        unint64_t v101 = v100 - v99;
        if (!v48) {
          goto LABEL_160;
        }
        unint64_t v102 = v98;
        if (v98 - v99 >= v101) {
          goto LABEL_160;
        }
        unint64_t v103 = v98 >> *MEMORY[0x1E4F14AF8];
        if (v103)
        {
          uint64_t v104 = (unsigned int *)v97[3];
          unint64_t v105 = v98 >> *MEMORY[0x1E4F14AF8];
          do
          {
            if (*v104 <= (v105 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v104 + ((v105 & 0x3FFFFFF) >> 3) + 4) >> (v105 & 7)) & 1) == 0)
            {
              goto LABEL_160;
            }
            v105 >>= 26;
          }
          while (v105);
        }
        uint64_t v106 = (uint64_t)v97 + 4 * (v103 & 0x7FFFF);
        int v109 = *(_DWORD *)(v106 + 64);
        v108 = (_DWORD *)(v106 + 64);
        int v107 = v109;
        if (v109)
        {
          unint64_t v110 = v97[4] + ((unint64_t)(v107 - 1) << 6);
          if (v98 - *(void *)(*(void *)v110 + 8) < *(void *)(*(void *)v110 + 16)) {
            goto LABEL_120;
          }
        }
        unint64_t v126 = *((unsigned int *)v97 + 10);
        if (!v126) {
          goto LABEL_160;
        }
        unint64_t v127 = v97[4];
        while (1)
        {
          unint64_t v128 = v126 >> 1;
          unint64_t v110 = v127 + (v126 >> 1 << 6);
          if (*(void *)(*(void *)v110 + 8) <= v98) {
            break;
          }
LABEL_143:
          BOOL v48 = v126 >= 2;
          unint64_t v126 = v128;
          if (!v48) {
            goto LABEL_160;
          }
        }
        if (*(void *)(*(void *)v110 + 16) + *(void *)(*(void *)v110 + 8) <= v98) {
          break;
        }
        uint64_t v220 = v97[4];
        int v129 = [*(id *)v110 isSpecialPhysFootprintRegion];
        uint64_t v130 = v220;
        if (v129) {
          unint64_t v131 = 0;
        }
        else {
          unint64_t v131 = v110;
        }
        if (v129) {
          goto LABEL_160;
        }
        if ((*(unsigned char *)(*(void *)v131 + 132) & 1) == 0) {
          goto LABEL_174;
        }
        v132 = (id *)(v131 + 64);
        unint64_t v133 = *((unsigned int *)v97 + 10) - ((uint64_t)(v131 + 64 - v97[4]) >> 6);
        if (!v133) {
          goto LABEL_171;
        }
        while (2)
        {
          unint64_t v134 = v133 >> 1;
          v135 = &v132[8 * (v133 >> 1)];
          if (*((void *)*v135 + 1) > v102)
          {
LABEL_154:
            BOOL v84 = v133 > 1;
            unint64_t v133 = v134;
            if (!v84)
            {
              unint64_t v133 = 0;
              goto LABEL_171;
            }
            continue;
          }
          break;
        }
        if (*((void *)*v135 + 2) + *((void *)*v135 + 1) <= v102)
        {
          v132 = v135 + 8;
          unint64_t v134 = --v133 >> 1;
          goto LABEL_154;
        }
        unint64_t v215 = v131;
        int v140 = [*v135 isSpecialPhysFootprintRegion];
        unint64_t v131 = v215;
        uint64_t v130 = v220;
        if (v140) {
          unint64_t v133 = 0;
        }
        else {
          unint64_t v133 = (unint64_t)v135;
        }
LABEL_171:
        if (v133) {
          unint64_t v131 = v133;
        }
        unint64_t v110 = v131;
LABEL_174:
        _DWORD *v108 = ((v131 - v130) >> 6) + 1;
LABEL_120:
        unsigned int v111 = *(_DWORD *)(v110 + 20);
        if (v111)
        {
          uint64_t v112 = *(void *)(v110 + 8);
          uint64_t v113 = *v97;
          uint64_t v114 = *(unsigned int *)(v110 + 16);
          v115 = (unint64_t *)(*v97 + 16 * v114);
          if (v112)
          {
            if (*v115 > v102) {
              goto LABEL_160;
            }
            v116 = (void *)(v113 + 16 * (v111 + v114 - 1));
            if (((v116[1] >> 5) & 0xFFFFFFFFFuLL) + *v116 <= v102) {
              goto LABEL_160;
            }
            v117 = (unsigned int *)(v112 + 4 * ((v102 - (*v115 & -*MEMORY[0x1E4F14B00])) >> *MEMORY[0x1E4F14AF8]));
            uint64_t v118 = *v117;
            unint64_t v119 = (unint64_t *)(v113 + 16 * v118);
            if (*v119 > v102) {
              goto LABEL_160;
            }
            uint64_t v120 = v117[1];
            if (v120 < *((_DWORD *)v97 + 2))
            {
              id v121 = (unint64_t *)(v113 + 16 * v120);
              unint64_t v122 = *v121;
              if (*v121 <= v102)
              {
LABEL_156:
                unint64_t v136 = v121[1];
                if ((v136 & 7) - 2 < 3) {
                  goto LABEL_160;
                }
                unint64_t v137 = ((unint64_t)v121 - v113) >> 4;
                unint64_t v138 = v97[2];
                if (v102 - v122 >= v138)
                {
                  if (((v136 >> 5) & 0xFFFFFFFFFLL) - (v102 - v122) > v138 || v137 == -1) {
                    goto LABEL_160;
                  }
                }
                else if (v137 == -1)
                {
                  goto LABEL_160;
                }
                (*(void (**)(uint64_t, void, uint64_t, void))(a9 + 16))(a9, a4, a3 + v92 + v225, v226);
                goto LABEL_160;
              }
            }
            unsigned int v123 = v120 - v118;
            if (v123)
            {
              do
              {
                uint64_t v124 = v123 >> 1;
                id v121 = &v119[2 * v124];
                unint64_t v122 = *v121;
                if (*v121 <= v102)
                {
                  if (((v119[2 * v124 + 1] >> 5) & 0xFFFFFFFFFLL) + v122 > v102) {
                    goto LABEL_156;
                  }
                  unint64_t v119 = v121 + 2;
                  LODWORD(v124) = --v123 >> 1;
                }
                BOOL v48 = v123 >= 2;
                unsigned int v123 = v124;
              }
              while (v48);
            }
          }
          else
          {
            do
            {
              uint64_t v125 = v111 >> 1;
              id v121 = &v115[2 * v125];
              unint64_t v122 = *v121;
              if (*v121 <= v102)
              {
                if (((v115[2 * v125 + 1] >> 5) & 0xFFFFFFFFFLL) + v122 > v102) {
                  goto LABEL_156;
                }
                v115 = v121 + 2;
                LODWORD(v125) = --v111 >> 1;
              }
              BOOL v48 = v111 >= 2;
              unsigned int v111 = v125;
            }
            while (v48);
          }
        }
LABEL_160:

        unint64_t v91 = (v90 + 8);
        if (v91 > a5)
        {
LABEL_184:

          return;
        }
      }
      unint64_t v127 = v110 + 64;
      unint64_t v128 = --v126 >> 1;
      goto LABEL_143;
    }
    if ((*(unsigned char *)(a1 + 376) & 2) == 0) {
      goto LABEL_184;
    }
    uint64_t v141 = (uint64_t *)(a2 + a3);
    if (v11) {
      v142 = *(void **)(*(void *)(a1 + 272) + 8 * v11);
    }
    else {
      v142 = 0;
    }
    unint64_t v143 = a2 + a3 + a5 - 8;
    id v144 = v142;
    if (*(_DWORD *)(a1 + 316)) {
      uint64_t v145 = *(void *)([*(id *)(a1 + 80) autoreleasePoolPageLayout] + 16);
    }
    else {
      uint64_t v145 = 0;
    }
    if ((unint64_t)v141 > v143) {
      goto LABEL_183;
    }
    uint64_t v222 = a2;
    uint64_t v229 = a8;
LABEL_187:
    unint64_t v146 = (unint64_t)v141 - a2;
    v147 = (char *)v141 + *(void *)(*(void *)(a1 + 96) + 16 * a4) - a2;
    uint64_t v148 = *v141;
    v232 = v147;
    if (!*v141)
    {
      if (!*(_DWORD *)(a1 + 316)
        || v146 < *(unsigned int *)([*(id *)(a1 + 80) autoreleasePoolPageLayout] + 8))
      {
        goto LABEL_264;
      }
      v154 = *(void (**)(void))(a9 + 16);
      goto LABEL_199;
    }
    if (v18)
    {
      if (v144
        && v146 == 8
        && [v144 infoType] == 8
        && [v144 usesSwiftRefcounting])
      {
        id v149 = v227;
        v150 = v149;
        if (v227
          && (uint64_t v151 = [v149 refcountIsSideTableMarkerMask] & v148,
              v151 == [v150 refcountIsSideTableMarkerValue]))
        {
          unint64_t v152 = [v150 sideTablePointerMask] & v148;
          unint64_t v153 = v152 >> [v150 sideTablePointerRightShift];
          uint64_t v148 = v153 << [v150 sideTablePointerLeftShift];
        }
        else
        {
          uint64_t v148 = 0;
        }

        v147 = v232;
        if (!v145) {
          goto LABEL_207;
        }
        goto LABEL_203;
      }
      if ((*(_DWORD *)(*(void *)(a1 + 96) + 16 * a4 + 8) & 7u) - 2 < 3) {
        v148 &= 0xFFFFFFFFFFFFF8uLL;
      }
    }
    if (!v145) {
      goto LABEL_207;
    }
LABEL_203:
    if (([*(id *)(a1 + 80) isTaggedPointer:v148] & 1) == 0)
    {
      unint64_t v155 = v143;
      id v156 = v144;
      uint64_t v157 = v18;
      uint64_t v158 = v148 & v145;
      if (v148 != (v148 & v145))
      {
        int v159 = [*(id *)(a1 + 80) countFromPointerInAutoreleasePool:v148];
        v160 = [NSNumber numberWithUnsignedInt:(v159 + 1)];
        v161 = *(void **)(a1 + 520);
        v162 = [NSNumber numberWithUnsignedLongLong:v232];
        [v161 setObject:v160 forKeyedSubscript:v162];

        v147 = v232;
        uint64_t v148 = v158;
      }
      uint64_t v18 = v157;
      id v144 = v156;
      unint64_t v143 = v155;
      a2 = v222;
    }
LABEL_207:
    v163 = *(NSMapTable **)(a1 + 328);
    if (v163)
    {
      if ((*(void *)(*(void *)(a1 + 96) + 16 * a4 + 8) & 7) == 2)
      {
        v164 = NSMapGet(v163, v147);
        if (v164) {
          uint64_t v148 = (uint64_t)v164;
        }
      }
    }
    if ([*(id *)(a1 + 536) containsLocation:v147]) {
      goto LABEL_264;
    }
    if (!v148) {
      goto LABEL_264;
    }
    v165 = *(uint64_t **)(a1 + 128);
    unint64_t v166 = -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 8), v148);
    unint64_t v167 = v165[6];
    unint64_t v168 = v165[7];
    BOOL v48 = v168 >= v167;
    unint64_t v169 = v168 - v167;
    if (!v48) {
      goto LABEL_264;
    }
    unint64_t v170 = v166;
    if (v166 - v167 >= v169) {
      goto LABEL_264;
    }
    unint64_t v171 = v166 >> *MEMORY[0x1E4F14AF8];
    if (v171)
    {
      v172 = (unsigned int *)v165[3];
      unint64_t v173 = v166 >> *MEMORY[0x1E4F14AF8];
      do
      {
        if (*v172 <= (v173 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v172 + ((v173 & 0x3FFFFFF) >> 3) + 4) >> (v173 & 7)) & 1) == 0)
        {
          goto LABEL_264;
        }
        v173 >>= 26;
      }
      while (v173);
    }
    uint64_t v174 = (uint64_t)v165 + 4 * (v171 & 0x7FFFF);
    int v177 = *(_DWORD *)(v174 + 64);
    v176 = (_DWORD *)(v174 + 64);
    int v175 = v177;
    if (v177)
    {
      unint64_t v178 = v165[4] + ((unint64_t)(v175 - 1) << 6);
      if (v166 - *(void *)(*(void *)v178 + 8) < *(void *)(*(void *)v178 + 16)) {
        goto LABEL_223;
      }
    }
    unint64_t v194 = *((unsigned int *)v165 + 10);
    if (!v194) {
      goto LABEL_264;
    }
    unint64_t v195 = v165[4];
    while (1)
    {
      unint64_t v196 = v194 >> 1;
      unint64_t v178 = v195 + (v194 >> 1 << 6);
      if (*(void *)(*(void *)v178 + 8) <= v166)
      {
        if (*(void *)(*(void *)v178 + 16) + *(void *)(*(void *)v178 + 8) > v166)
        {
          uint64_t v216 = v165[4];
          v218 = v176;
          int v197 = [*(id *)v178 isSpecialPhysFootprintRegion];
          uint64_t v199 = v216;
          v198 = v218;
          if (v197) {
            unint64_t v200 = 0;
          }
          else {
            unint64_t v200 = v178;
          }
          if (v197) {
            goto LABEL_264;
          }
          if ((*(unsigned char *)(*(void *)v200 + 132) & 1) == 0) {
            goto LABEL_281;
          }
          v201 = (id *)(v200 + 64);
          unint64_t v202 = *((unsigned int *)v165 + 10) - ((uint64_t)(v200 + 64 - v165[4]) >> 6);
          if (!v202) {
            goto LABEL_278;
          }
          unsigned int v213 = v18;
          while (1)
          {
            unint64_t v203 = v202 >> 1;
            v204 = &v201[8 * (v202 >> 1)];
            if (*((void *)*v204 + 1) <= v170)
            {
              if (*((void *)*v204 + 2) + *((void *)*v204 + 1) > v170)
              {
                unint64_t v209 = v200;
                int v210 = [*v204 isSpecialPhysFootprintRegion];
                unint64_t v200 = v209;
                uint64_t v199 = v216;
                v198 = v218;
                if (v210) {
                  unint64_t v202 = 0;
                }
                else {
                  unint64_t v202 = (unint64_t)v204;
                }
LABEL_277:
                uint64_t v18 = v213;
LABEL_278:
                if (v202) {
                  unint64_t v200 = v202;
                }
                unint64_t v178 = v200;
LABEL_281:
                _DWORD *v198 = ((v200 - v199) >> 6) + 1;
LABEL_223:
                unsigned int v179 = *(_DWORD *)(v178 + 20);
                if (v179)
                {
                  uint64_t v180 = *(void *)(v178 + 8);
                  uint64_t v181 = *v165;
                  uint64_t v182 = *(unsigned int *)(v178 + 16);
                  v183 = (unint64_t *)(*v165 + 16 * v182);
                  if (v180)
                  {
                    if (*v183 > v170) {
                      goto LABEL_264;
                    }
                    v184 = (void *)(v181 + 16 * (v179 + v182 - 1));
                    if (((v184[1] >> 5) & 0xFFFFFFFFFuLL) + *v184 <= v170) {
                      goto LABEL_264;
                    }
                    v185 = (unsigned int *)(v180 + 4
                                                 * ((v170 - (*v183 & -*MEMORY[0x1E4F14B00])) >> *MEMORY[0x1E4F14AF8]));
                    uint64_t v186 = *v185;
                    v187 = (unint64_t *)(v181 + 16 * v186);
                    if (*v187 > v170) {
                      goto LABEL_264;
                    }
                    uint64_t v188 = v185[1];
                    if (v188 >= *((_DWORD *)v165 + 2)
                      || (v189 = (unint64_t *)(v181 + 16 * v188), unint64_t v190 = *v189, *v189 > v170))
                    {
                      unsigned int v191 = v188 - v186;
                      if (v191)
                      {
                        do
                        {
                          uint64_t v192 = v191 >> 1;
                          v189 = &v187[2 * v192];
                          unint64_t v190 = *v189;
                          if (*v189 <= v170)
                          {
                            if (((v187[2 * v192 + 1] >> 5) & 0xFFFFFFFFFLL) + v190 > v170) {
                              goto LABEL_263;
                            }
                            v187 = v189 + 2;
                            LODWORD(v192) = --v191 >> 1;
                          }
                          BOOL v48 = v191 >= 2;
                          unsigned int v191 = v192;
                        }
                        while (v48);
                      }
                      goto LABEL_264;
                    }
LABEL_263:
                    unint64_t v205 = v189[1];
                    if ((v205 & 7) - 2 < 3) {
                      goto LABEL_264;
                    }
                    unint64_t v206 = ((unint64_t)v189 - v181) >> 4;
                    unint64_t v207 = v165[2];
                    if (v170 - v190 >= v207)
                    {
                      if (((v205 >> 5) & 0xFFFFFFFFFLL) - (v170 - v190) > v207 || v206 == -1) {
                        goto LABEL_264;
                      }
                    }
                    else if (v206 == -1)
                    {
                      goto LABEL_264;
                    }
                    v154 = *(void (**)(void))(a9 + 16);
LABEL_199:
                    v154();
                    goto LABEL_264;
                  }
                  do
                  {
                    uint64_t v193 = v179 >> 1;
                    v189 = &v183[2 * v193];
                    unint64_t v190 = *v189;
                    if (*v189 <= v170)
                    {
                      if (((v183[2 * v193 + 1] >> 5) & 0xFFFFFFFFFLL) + v190 > v170) {
                        goto LABEL_263;
                      }
                      v183 = v189 + 2;
                      LODWORD(v193) = --v179 >> 1;
                    }
                    BOOL v48 = v179 >= 2;
                    unsigned int v179 = v193;
                  }
                  while (v48);
                }
LABEL_264:
                uint64_t v141 = (uint64_t *)((char *)v141 + v229);
                if ((unint64_t)v141 > v143)
                {
LABEL_183:

                  goto LABEL_184;
                }
                goto LABEL_187;
              }
              v201 = v204 + 8;
              unint64_t v203 = --v202 >> 1;
            }
            BOOL v84 = v202 > 1;
            unint64_t v202 = v203;
            if (!v84)
            {
              unint64_t v202 = 0;
              goto LABEL_277;
            }
          }
        }
        unint64_t v195 = v178 + 64;
        unint64_t v196 = --v194 >> 1;
      }
      BOOL v48 = v194 >= 2;
      unint64_t v194 = v196;
      if (!v48) {
        goto LABEL_264;
      }
    }
  }
}

void *__97__VMUKernelCoreMemoryScanner_scanLocalMemory_atOffset_node_length_isa_fieldInfo_stride_recorder___block_invoke(void *result, uint64_t a2, int a3, unsigned __int8 a4)
{
  id v6 = result;
  uint64_t v7 = *(void *)(result[5] + 8);
  unsigned int v8 = *(_DWORD *)(v7 + 24);
  uint64_t v9 = *(void *)(result[6] + 8);
  unsigned int v10 = *(_DWORD *)(v9 + 24);
  if (v8 + 2 >= v10)
  {
    *(_DWORD *)(v9 + 24) = 2 * v10;
    uint64_t result = malloc_type_realloc(*(void **)(*(void *)(result[4] + 296) + 8 * *((unsigned int *)result + 14)), 4 * *(unsigned int *)(*(void *)(result[6] + 8) + 24), 0x100004052888210uLL);
    uint64_t v11 = *((unsigned int *)v6 + 14);
    *(void *)(*(void *)(v6[4] + 296) + 8 * v11) = result;
    uint64_t v7 = *(void *)(v6[5] + 8);
    unsigned int v8 = *(_DWORD *)(v7 + 24);
  }
  else
  {
    uint64_t v11 = *((unsigned int *)result + 14);
  }
  uint64_t v12 = *(void *)(*(void *)(v6[4] + 296) + 8 * v11);
  *(_DWORD *)(v7 + 24) = v8 + 1;
  *(_DWORD *)(v12 + 4 * v8) = a3 & 0xFFFFFF | (a4 << 24);
  return result;
}

- (void)_withOrderedNodeMapper:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    int v17 = -1;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    int v15 = 0;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__VMUKernelCoreMemoryScanner__withOrderedNodeMapper___block_invoke;
    v6[3] = &unk_1E5D23210;
    unsigned int v8 = v16;
    uint64_t v9 = v12;
    unsigned int v10 = v14;
    uint64_t v11 = v13;
    v6[4] = self;
    id v7 = 0;
    (*((void (**)(id, void *))v4 + 2))(v4, v6);

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

void __53__VMUKernelCoreMemoryScanner__withOrderedNodeMapper___block_invoke(void *a1, unsigned int a2, int a3, uint64_t a4)
{
  if (!a4) {
    return;
  }
  uint64_t v6 = a1[4];
  if (*(_DWORD *)(v6 + 104) <= a2) {
    return;
  }
  id v7 = (unint64_t *)(*(void *)(v6 + 96) + 16 * a2);
  unint64_t v8 = v7[1];
  uint64_t v9 = (v8 >> 5) & 0xFFFFFFFFFLL;
  if (!v9) {
    return;
  }
  unint64_t v12 = *v7;
  int v13 = v8 & 7;
  if (!a3)
  {
    uint64_t v52 = *(unsigned int *)(*(void *)(a1[6] + 8) + 24);
    if (v52 != -1 && *(void *)(*(void *)(a1[7] + 8) + 24) <= v12)
    {
      unint64_t v53 = *(uint64_t **)(v6 + 112);
      id v54 = *(id *)(v6 + 72);
      int v55 = &v53[8 * v52];
      if (v55[6])
      {
        if ((uint64_t *)v55[7] == v55)
        {
          uint64_t v134 = MEMORY[0x1E4F143A8];
          uint64_t v135 = 3221225472;
          unint64_t v136 = ___unmapRegion_block_invoke_0;
          unint64_t v137 = &unk_1E5D235B0;
          id v103 = v54;
          id v138 = v54;
          v139 = v55;
          int v140 = v53;
          uint64_t v104 = (void (**)(void))MEMORY[0x1AD0DA230](&v134);
          v104[2]();

          id v54 = v103;
        }
        else
        {
          unint64_t v56 = &v53[8 * v52];
          v56[5] = 0;
          v56[6] = 0;
          v56[7] = 0;
        }
      }

      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -1;
    }
  }
  if (v13 != 1)
  {
    if (!VMUGraphNodeType_IsVMRegion(v13))
    {
      if (v13 == 4)
      {
        uint64_t v57 = [*(id *)(a1[4] + 240) threadStateForThreadNum:*(void *)(*(void *)(a1[4] + 96) + 16 * a2 + 8) >> 41];
        if (v57) {
          (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v57);
        }
        *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -1;
      }
      return;
    }
    *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = *(void *)(*(void *)(a1[4] + 96) + 16 * a2 + 8) >> 41;
    uint64_t v32 = (id *)objc_retain(objc_retain(*(id *)(*(void *)(a1[4] + 112)
                                              + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24) << 6))));
    if (_shouldScanVMregion_onceToken != -1) {
      dispatch_once(&_shouldScanVMregion_onceToken, &__block_literal_global_570);
    }
    if (!_shouldScanVMregion_scanVMRegionWithUnknownPathsEnvVar
      && *((unsigned char *)v32 + 49)
      && ([v32 path],
          unint64_t v79 = objc_claimAutoreleasedReturnValue(),
          char v80 = [v79 hasPrefix:kVMUUnknownMappedFileNamePrefix[0]],
          v79,
          (v80 & 1) != 0)
      || (*((_DWORD *)v32 + 13) & 3) == 2)
    {
    }
    else
    {
      if ([v32 protection] != 1
        || *((_DWORD *)v32 + 26) == 1
        || [v32[4] isEqualToString:@"MALLOC metadata"])
      {

LABEL_23:
        *(void *)(*(void *)(a1[9] + 8) + 24) = [v32 address];
        uint64_t v33 = *(void *)(*(void *)(a1[9] + 8) + 24);
        *(void *)(*(void *)(a1[7] + 8) + 24) = [v32 length] + v33;
        uint64_t v34 = a1[4];
        uint64_t v35 = *(void *)(v34 + 112);
        uint64_t v36 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24);
        id v37 = (uint64_t *)(v35 + (v36 << 6));
        id v38 = *(void **)(v34 + 72);
        int v129 = *(_DWORD *)(v34 + 120);
        id v39 = *(id *)(v34 + 8);
        id v40 = v38;
        if (!v37[6])
        {
          uint64_t v123 = v36;
          uint64_t v125 = v35;
          uint64_t v41 = *v37;
          id v42 = v40;
          if ((*(unsigned char *)(*v37 + 132) & 2) == 0)
          {
            [v40 taskIsTranslated];
            id v40 = v42;
            uint64_t v41 = *v37;
          }
          uint64_t v134 = 0;
          v141[0] = 0;
          int v43 = [v40 mapAddress:*(void *)(v41 + 8) size:*(void *)(v41 + 16) returnedAddress:&v134 returnedSize:v141];
          if (v43)
          {
            if ((*(_DWORD *)(*v37 + 52) & 3u) - 1 >= 2)
            {
              int v44 = v43;
              BOOL v45 = task_exists(v39);
              if (v123 != v129 - 1 && v45)
              {
                uint64_t v130 = (FILE *)*MEMORY[0x1E4F143C8];
                uint64_t v119 = [(id)*v37 address];
                uint64_t v46 = *(unsigned int *)(*v37 + 24);
                v117 = (&vm_prot_strings_0)[v46];
                uint64_t v115 = *(void *)(*v37 + 16) + *(void *)(*v37 + 8);
                VMURegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*v37 + 104), *(unsigned __int8 *)(*v37 + 50), v46, *(unsigned __int8 *)(*v37 + 49));
                id v47 = objc_claimAutoreleasedReturnValue();
                BOOL v48 = (const char *)[v47 UTF8String];
                uint64_t v49 = *(void *)(*v37 + 16) >> *MEMORY[0x1E4F14AF8];
                if (v49 == 1) {
                  unint64_t v50 = "page";
                }
                else {
                  unint64_t v50 = "pages";
                }
                if (*(void *)(v125 + (v123 << 6) + 24) == *(void *)(v125 + (v123 << 6) + 32)) {
                  unint64_t v51 = "";
                }
                else {
                  unint64_t v51 = " [root]";
                }
                fprintf(v130, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v119, v115, v117, v48, v49, v50, v51, v44);
              }
            }
          }
          else
          {
            uint64_t v109 = v141[0];
            v37[6] = v134;
            uint64_t v110 = v125 + (v36 << 6);
            *(void *)(v110 + 40) = v109;
            *(void *)(v110 + 56) = v37;
          }
          id v40 = v42;
        }

        uint64_t v111 = *(void *)(*(void *)(a1[4] + 112)
                         + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24) << 6)
                         + 48);
        if (v111)
        {
          (*(void (**)(uint64_t, unint64_t))(a4 + 16))(a4, v111 + v12 - *(void *)(*(void *)(a1[9] + 8) + 24));
          if (!a3) {
            *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(*(void *)(a1[8] + 8) + 24);
          }
        }
        goto LABEL_102;
      }
      int v112 = *((_DWORD *)v32 + 26);

      if (v112 == 78) {
        goto LABEL_23;
      }
    }
LABEL_102:

    return;
  }
  for (;
        *(void *)(*(void *)(a1[7] + 8) + 24) <= v12;
        *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(*(void *)(*(void *)(a1[4] + 112)
                                                                             + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24) << 6))
                                                                 + 16)
                                                     + *(void *)(*(void *)(a1[9] + 8) + 24))
  {
    *(void *)(*(void *)(a1[9] + 8) + 24) = *(void *)(*(void *)(*(void *)(a1[4] + 112)
                                                                         + ((unint64_t)++*(_DWORD *)(*(void *)(a1[8] + 8) + 24) << 6))
                                                             + 8);
  }
  uint64_t v14 = a1[4];
  uint64_t v15 = *(void *)(v14 + 112);
  uint64_t v16 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24);
  int v17 = (id *)(v15 + (v16 << 6));
  if ((*((_DWORD *)*v17 + 13) & 3) != 2)
  {
    uint64_t v18 = *(void *)(a1[7] + 8);
    unint64_t v20 = *(void *)(v18 + 24);
    unint64_t v19 = (void *)(v18 + 24);
    if (v20 >= v9 + v12)
    {
      unint64_t v131 = *(FILE **)(*(void *)(a1[9] + 8) + 24);
      unint64_t v58 = *(void **)(v14 + 72);
      int v59 = *(_DWORD *)(v14 + 120);
      id v60 = *(id *)(v14 + 8);
      id v61 = v58;
      uint64_t v62 = v16;
      uint64_t v63 = v61;
      uint64_t v126 = v62;
      uint64_t v64 = v15 + (v62 << 6);
      uint64_t v66 = *(void *)(v64 + 48);
      int v65 = (void *)(v64 + 48);
      if (!v66)
      {
        unint64_t v127 = v60;
        id v67 = *v17;
        if ((*((unsigned char *)*v17 + 132) & 2) == 0)
        {
          [v61 taskIsTranslated];
          id v67 = *v17;
        }
        uint64_t v134 = 0;
        v141[0] = 0;
        int v68 = [v63 mapAddress:v67[1] size:v67[2] returnedAddress:&v134 returnedSize:v141];
        if (v68)
        {
          if ((*((_DWORD *)*v17 + 13) & 3u) - 1 >= 2)
          {
            int v69 = v68;
            BOOL v70 = task_exists(v127);
            if (v126 != v59 - 1 && v70)
            {
              uint64_t v124 = (FILE *)*MEMORY[0x1E4F143C8];
              uint64_t v120 = [*v17 address];
              uint64_t v71 = *((unsigned int *)*v17 + 6);
              uint64_t v72 = (&vm_prot_strings_0)[v71];
              uint64_t v73 = *((void *)*v17 + 2) + *((void *)*v17 + 1);
              VMURegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)*v17 + 104), *((unsigned __int8 *)*v17 + 50), v71, *((unsigned __int8 *)*v17 + 49));
              id v74 = objc_claimAutoreleasedReturnValue();
              unint64_t v75 = (const char *)[v74 UTF8String];
              uint64_t v76 = *((void *)*v17 + 2) >> *MEMORY[0x1E4F14AF8];
              if (v76 == 1) {
                int v77 = "page";
              }
              else {
                int v77 = "pages";
              }
              if (*(void *)(v15 + (v126 << 6) + 24) == *(void *)(v15 + (v126 << 6) + 32)) {
                uint64_t v78 = "";
              }
              else {
                uint64_t v78 = " [root]";
              }
              fprintf(v124, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v120, v73, v72, v75, v76, v77, v78, v69);
            }
          }
        }
        else
        {
          uint64_t v105 = v141[0];
          *int v65 = v134;
          uint64_t v106 = v15 + (v126 << 6);
          *(void *)(v106 + 40) = v105;
          *(void *)(v106 + 56) = v17;
        }
        id v60 = v127;
      }

      uint64_t v95 = *(void *)(a1[4] + 112);
      unsigned int v86 = v126;
      uint64_t v96 = v131;
      goto LABEL_93;
    }
    unsigned int v21 = v16 + 1;
    do
    {
      unsigned int v22 = v21;
      uint64_t v23 = (void *)(*(void *)(*(void *)(a1[4] + 112) + ((unint64_t)v21 << 6)) + 8);
      *unint64_t v19 = v23[1] + *v23;
      ++v21;
      uint64_t v24 = *(void *)(a1[7] + 8);
      unint64_t v25 = *(void *)(v24 + 24);
      unint64_t v19 = (void *)(v24 + 24);
    }
    while (v25 < v9 + v12);
    uint64_t v26 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24);
    int v27 = v21 - v26;
    uint64_t v28 = a1[4];
    uint64_t v122 = v26;
    uint64_t v114 = *(void *)(v28 + 112);
    unint64_t v29 = (uint64_t *)(v114 + (v26 << 6));
    unsigned int v30 = *(void **)(v28 + 72);
    if (a3 == 1) {
      unsigned int v31 = (void *)a1[5];
    }
    else {
      unsigned int v31 = 0;
    }
    uint64_t v81 = v22;
    id v121 = *(id *)(v28 + 8);
    id v128 = v30;
    v132 = v31;
    int v118 = v27;
    if (v27)
    {
      uint64_t v82 = 0;
      uint64_t v83 = v21 - v122;
      BOOL v84 = v29;
      do
      {
        uint64_t v85 = *v84;
        v84 += 8;
        v82 += *(void *)(v85 + 16);
        --v83;
      }
      while (v83);
    }
    else
    {
      uint64_t v82 = 0;
    }
    unsigned int v86 = v21 - 1;
    v141[0] = 0;
    unint64_t v133 = 0;
    unint64_t v87 = (void *)[v128 findMappedAddress:*(void *)(*v29 + 8) size:v82];
    if (v87)
    {
      uint64_t v88 = v87[1];
      uint64_t v89 = *(void *)(*v29 + 8) - *v87;
      v141[0] = v87[2] + v89;
      unint64_t v133 = (uint64_t *)(v88 - v89);
    }
    else
    {
      uint64_t v113 = v81;
      if (v118)
      {
        uint64_t v97 = v21 - v122;
        unint64_t v98 = v29;
        v116 = v29;
        do
        {
          id v99 = v128;
          unint64_t v100 = v132;
          if (v98[6])
          {
            if (v98 == (uint64_t *)v98[7])
            {
              uint64_t v134 = MEMORY[0x1E4F143A8];
              uint64_t v135 = 3221225472;
              unint64_t v136 = ___unmapRegion_block_invoke_0;
              unint64_t v137 = &unk_1E5D235B0;
              id v138 = v99;
              v139 = v98;
              int v140 = v29;
              unint64_t v101 = (void (**)(void))MEMORY[0x1AD0DA230](&v134);
              unint64_t v102 = v101;
              if (v132) {
                dispatch_async(v100, v101);
              }
              else {
                v101[2](v101);
              }

              unint64_t v29 = v116;
            }
            else
            {
              v98[5] = 0;
              v98[6] = 0;
              v98[7] = 0;
            }
          }

          v98 += 8;
          --v97;
        }
        while (v97);
      }
      unsigned int v86 = v21 - 1;
      uint64_t v81 = v113;
      if ([v128 mapAddress:*(void *)(*v29 + 8) size:v82 returnedAddress:v141 returnedSize:&v133])
      {
        if (task_exists(v121)) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "Failed to map remote region at [%#llx-%#llx]\n", *(void *)(*v29 + 8), *(void *)(*v29 + 8) + v82);
        }
        goto LABEL_74;
      }
    }
    if (v118)
    {
      unint64_t v90 = v133;
      unint64_t v91 = (uint64_t *)v141[0];
      unint64_t v92 = (uint64_t **)(v114 + (v122 << 6) + 56);
      uint64_t v93 = v21 - v122;
      do
      {
        *(v92 - 1) = v91;
        VMUScanOverlay *v92 = v29;
        *(v92 - 2) = v90;
        uint64_t v94 = (uint64_t)(*(v92 - 7) + 1);
        unint64_t v91 = (uint64_t *)((char *)v91 + (*(v92 - 7))[2]);
        v141[0] = v91;
        unint64_t v90 = (uint64_t *)((char *)v90 - *(void *)(v94 + 8));
        unint64_t v133 = v90;
        v92 += 8;
        --v93;
      }
      while (v93);
    }
LABEL_74:

    uint64_t v95 = *(void *)(a1[4] + 112);
    uint64_t v96 = *(FILE **)(*(void *)(v95 + (v81 << 6)) + 8);
LABEL_93:
    uint64_t v107 = *(void *)(a1[8] + 8);
    uint64_t v108 = *(void *)(v95 + ((unint64_t)*(unsigned int *)(v107 + 24) << 6) + 48);
    if (v108)
    {
      (*(void (**)(uint64_t, unint64_t))(a4 + 16))(a4, v108 + v12 - *(void *)(*(void *)(a1[9] + 8) + 24));
      uint64_t v107 = *(void *)(a1[8] + 8);
    }
    *(_DWORD *)(v107 + 24) = v86;
    *(void *)(*(void *)(a1[9] + 8) + 24) = v96;
  }
}

- (void)scanNodesWithReferenceRecorder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1AD0DA230]();
  if (self->_referenceLogger
    || (unint64_t maxInteriorOffset = self->_maxInteriorOffset, maxInteriorOffset != -1)
    && (!maxInteriorOffset || (maxInteriorOffset & ~(-1 << *MEMORY[0x1E4F14AF8])) != 0))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke;
    v12[3] = &unk_1E5D23238;
    void v12[4] = self;
    id v13 = v4;
    uint64_t v6 = MEMORY[0x1AD0DA230](v12);

    id v5 = (void *)v6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2;
  v9[3] = &unk_1E5D23348;
  int v11 = 0;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  [(VMUKernelCoreMemoryScanner *)self _withOrderedNodeMapper:v9];
  [(VMUKernelCoreMemoryScanner *)self unmapAllRegions];
}

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v6 = *(void **)(result + 32);
  if ((unint64_t)(a6 - *(void *)(v6[12] + 16 * a5)) <= v6[46])
  {
    uint64_t v7 = result;
    if (v6[59])
    {
      unint64_t v8 = (void *)MEMORY[0x1AD0D9F90]();
      (*(void (**)(void))(*(void *)(*(void *)(v7 + 32) + 472) + 16))();
    }
    uint64_t v9 = *(uint64_t (**)(void))(*(void *)(v7 + 40) + 16);
    return v9();
  }
  return result;
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 104))
  {
    unint64_t v5 = 0;
    uint64_t v6 = v103;
    uint64_t v7 = a2 + 16;
    uint64_t v101 = a2 + 16;
    while (1)
    {
      int v8 = *(_DWORD *)(*(void *)(v2 + 96) + 16 * v5 + 8);
      if (*(void *)(v2 + 480))
      {
        uint64_t v9 = (void *)MEMORY[0x1AD0D9F90]();
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 480) + 16))();
      }
      int v10 = v8 & 7;
      if (v10 == 1) {
        break;
      }
      if (VMUGraphNodeType_IsVMRegion(v8 & 7))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = (mach_vm_address_t *)(*(void *)(v14 + 96) + 16 * v5);
        mach_vm_address_t v16 = *v15;
        mach_vm_address_t v19 = v15[1];
        int v17 = v15 + 1;
        mach_vm_address_t v18 = v19;
        kcd_addr_begin[0] = 0;
        kcd_addr_begin[1] = (mach_vm_address_t)kcd_addr_begin;
        kcd_addr_begin[2] = 0x2020000000;
        kcd_addr_begin[3] = v16;
        kcd_size[0] = 0;
        kcd_size[1] = (mach_vm_size_t)kcd_size;
        kcd_size[2] = 0x2020000000;
        uint64_t v119 = 0;
        uint64_t v119 = (*v17 >> 5) & 0xFFFFFFFFFLL;
        if (v119)
        {
          mach_vm_address_t v20 = ((v18 >> 5) & 0xFFFFFFFFFLL) + v16;
          id v21 = *(id *)(*(void *)(v14 + 112) + ((*v17 >> 35) & 0x1FFFFFC0));
          unsigned int v22 = (void *)MEMORY[0x1AD0DA230](*(void *)(a1 + 40));
          uint64_t v23 = *(unsigned int *)(a1 + 48);
          v110[0] = MEMORY[0x1E4F143A8];
          v110[1] = 3221225472;
          v110[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6;
          v110[3] = &unk_1E5D232F8;
          mach_vm_address_t v115 = v16;
          mach_vm_address_t v116 = v20;
          v110[4] = *(void *)(a1 + 32);
          uint64_t v113 = kcd_size;
          uint64_t v114 = kcd_addr_begin;
          int v117 = v5;
          id v24 = v22;
          id v112 = v24;
          id v25 = v21;
          id v111 = v25;
          (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v23, v110);
        }
        _Block_object_dispose(kcd_size, 8);
        _Block_object_dispose(kcd_addr_begin, 8);
        goto LABEL_106;
      }
      if (v10 == 3)
      {
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v29 = *(void *)(*(void *)(v28 + 96) + 16 * v5);
        v102[0] = MEMORY[0x1E4F143A8];
        v102[1] = 3221225472;
        v103[0] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8;
        v103[1] = &unk_1E5D23320;
        v103[2] = v28;
        id v30 = *(id *)(a1 + 40);
        int v106 = v5;
        id v104 = v30;
        uint64_t v105 = v29;
        unsigned int v31 = (void (**)(void, void, void))MEMORY[0x1AD0DA230](v102);
        if ([*(id *)(*(void *)(a1 + 32) + 8) isCore])
        {
          kcd_addr_begin[0] = 0;
          uint64_t v32 = [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
          int v33 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v32, 0, kcd_addr_begin);

          if (!v33 && kcd_addr_begin[0])
          {
            if (kcd_addr_begin[0] >> 61)
            {
              NSLog(&cfstr_FailedToGetUda.isa);
            }
            else
            {
              unint64_t v92 = malloc_type_malloc(8 * kcd_addr_begin[0], 0x919865E5uLL);
              if (v92)
              {
                uint64_t v93 = v92;
                uint64_t v94 = v7;
                uint64_t v95 = [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
                int v96 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v95, (uint64_t)v93, kcd_addr_begin);

                if (!v96) {
                  ((void (**)(void, void *, mach_vm_address_t))v31)[2](v31, v93, kcd_addr_begin[0]);
                }
                free(v93);
                uint64_t v7 = v94;
              }
            }
          }
LABEL_105:

          goto LABEL_106;
        }
        kcd_addr_begin[0] = 0;
        kcd_size[0] = 0;
        if (!task_map_corpse_info_64(*MEMORY[0x1E4F14960], [*(id *)(*(void *)(a1 + 32) + 8) taskPort], kcd_addr_begin, kcd_size))
        {
          uint64_t v85 = v31;
          mach_vm_address_t v86 = kcd_addr_begin[0];
          mach_vm_size_t v87 = kcd_size[0];
          mach_vm_size_t v88 = kcd_size[0] + kcd_addr_begin[0];
          mach_vm_address_t v89 = kcd_addr_begin[0] + 16;
          if (v86 + 16 <= kcd_size[0] + v86
            && v89 + *(unsigned int *)(kcd_addr_begin[0] + 4) <= v88
            && *(_DWORD *)kcd_addr_begin[0] == -559025833)
          {
            do
            {
              mach_vm_address_t v90 = v89 + *(unsigned int *)(v86 + 4);
              if (v90 > v88) {
                break;
              }
              int v91 = *(_DWORD *)v86;
              if (*(_DWORD *)v86 == -242132755) {
                break;
              }
              if ((v91 == 17 || (v91 & 0xFFFFFFF0) == 0x20) && HIDWORD(*(void *)(v86 + 8)) == 2076)
              {
                v85[2](v85, v86 + 16, *(void *)(v86 + 8));
                mach_vm_address_t v90 = v89 + *(unsigned int *)(v86 + 4);
              }
              mach_vm_address_t v89 = v90 + 16;
              mach_vm_address_t v86 = v90;
            }
            while (v90 + 16 <= v88);
            mach_vm_address_t v86 = kcd_addr_begin[0];
            mach_vm_size_t v87 = kcd_size[0];
          }
          mach_vm_deallocate(*MEMORY[0x1E4F14960], v86, v87);
          unsigned int v31 = v85;
LABEL_100:
          uint64_t v7 = v101;
          goto LABEL_105;
        }
        [*(id *)(a1 + 32) pid];
        int v34 = proc_list_uptrs();
        if (v34 < 1) {
          goto LABEL_100;
        }
        int v35 = v34;
        unint64_t v98 = v31;
        id v99 = v6;
        uint64_t v36 = malloc_type_malloc((8 * v34), 0xE235CBCAuLL);
        [*(id *)(a1 + 32) pid];
        proc_list_uptrs();
        id v37 = v36;
        uint64_t v38 = 0;
        id v39 = (_DWORD *)MEMORY[0x1E4F14AF8];
        unint64_t v100 = v36;
LABEL_23:
        id v40 = *(uint64_t **)(*(void *)(a1 + 32) + 128);
        unint64_t v41 = v40[6];
        unint64_t v42 = v40[7];
        BOOL v43 = v42 >= v41;
        unint64_t v44 = v42 - v41;
        if (!v43) {
          goto LABEL_73;
        }
        unint64_t v45 = v37[v38];
        if (v45 - v41 >= v44) {
          goto LABEL_73;
        }
        unint64_t v46 = v45 >> *v39;
        if (v46)
        {
          id v47 = (unsigned int *)v40[3];
          unint64_t v48 = v45 >> *v39;
          do
          {
            if (*v47 <= (v48 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v47 + ((v48 & 0x3FFFFFF) >> 3) + 4) >> (v48 & 7)) & 1) == 0)
            {
              goto LABEL_73;
            }
            v48 >>= 26;
          }
          while (v48);
        }
        uint64_t v49 = (uint64_t)v40 + 4 * (v46 & 0x7FFFF);
        int v52 = *(_DWORD *)(v49 + 64);
        unint64_t v51 = (_DWORD *)(v49 + 64);
        int v50 = v52;
        uint64_t v53 = v40[4];
        if (v52)
        {
          unint64_t v54 = v53 + ((unint64_t)(v50 - 1) << 6);
          if (v45 - *(void *)(*(void *)v54 + 8) < *(void *)(*(void *)v54 + 16)) {
            goto LABEL_33;
          }
        }
        unint64_t v70 = *((unsigned int *)v40 + 10);
        if (!v70) {
          goto LABEL_73;
        }
        unint64_t v71 = v40[4];
        while (1)
        {
          unint64_t v72 = v70 >> 1;
          unint64_t v54 = v71 + (v70 >> 1 << 6);
          if (*(void *)(*(void *)v54 + 8) <= v45)
          {
            if (*(void *)(*(void *)v54 + 16) + *(void *)(*(void *)v54 + 8) > v45)
            {
              int v73 = [*(id *)v54 isSpecialPhysFootprintRegion];
              id v37 = v100;
              id v39 = (_DWORD *)MEMORY[0x1E4F14AF8];
              if (v73) {
                unint64_t v74 = 0;
              }
              else {
                unint64_t v74 = v54;
              }
              if (v73) {
                goto LABEL_73;
              }
              if ((*(unsigned char *)(*(void *)v74 + 132) & 1) == 0) {
                goto LABEL_87;
              }
              unint64_t v75 = (id *)(v74 + 64);
              unint64_t v76 = *((unsigned int *)v40 + 10) - ((uint64_t)(v74 + 64 - v40[4]) >> 6);
              if (!v76) {
                goto LABEL_84;
              }
              while (2)
              {
                unint64_t v77 = v76 >> 1;
                uint64_t v78 = &v75[8 * (v76 >> 1)];
                if (*((void *)*v78 + 1) > v45)
                {
LABEL_67:
                  BOOL v79 = v76 > 1;
                  unint64_t v76 = v77;
                  if (!v79)
                  {
                    unint64_t v76 = 0;
                    goto LABEL_84;
                  }
                  continue;
                }
                break;
              }
              if (*((void *)*v78 + 2) + *((void *)*v78 + 1) <= v45)
              {
                unint64_t v75 = v78 + 8;
                unint64_t v77 = --v76 >> 1;
                goto LABEL_67;
              }
              unint64_t v97 = v74;
              int v84 = [*v78 isSpecialPhysFootprintRegion];
              unint64_t v74 = v97;
              id v37 = v100;
              id v39 = (_DWORD *)MEMORY[0x1E4F14AF8];
              if (v84) {
                unint64_t v76 = 0;
              }
              else {
                unint64_t v76 = (unint64_t)v78;
              }
LABEL_84:
              if (v76) {
                unint64_t v74 = v76;
              }
              unint64_t v54 = v74;
LABEL_87:
              *unint64_t v51 = ((v74 - v53) >> 6) + 1;
LABEL_33:
              unsigned int v55 = *(_DWORD *)(v54 + 20);
              if (v55)
              {
                uint64_t v56 = *(void *)(v54 + 8);
                uint64_t v57 = *v40;
                uint64_t v58 = *(unsigned int *)(v54 + 16);
                int v59 = (unint64_t *)(*v40 + 16 * v58);
                if (v56)
                {
                  if (*v59 > v45) {
                    goto LABEL_73;
                  }
                  id v60 = (void *)(v57 + 16 * (v55 + v58 - 1));
                  if (((v60[1] >> 5) & 0xFFFFFFFFFuLL) + *v60 <= v45) {
                    goto LABEL_73;
                  }
                  id v61 = (unsigned int *)(v56 + 4 * ((v45 - (*v59 & -*MEMORY[0x1E4F14B00])) >> *v39));
                  uint64_t v62 = *v61;
                  uint64_t v63 = (unint64_t *)(v57 + 16 * v62);
                  if (*v63 > v45) {
                    goto LABEL_73;
                  }
                  uint64_t v64 = v61[1];
                  if (v64 < *((_DWORD *)v40 + 2))
                  {
                    int v65 = (unint64_t *)(v57 + 16 * v64);
                    unint64_t v66 = *v65;
                    if (*v65 <= v45)
                    {
LABEL_69:
                      unint64_t v80 = v65[1];
                      if ((v80 & 7) - 2 < 3) {
                        goto LABEL_73;
                      }
                      unint64_t v81 = ((unint64_t)v65 - v57) >> 4;
                      unint64_t v82 = v40[2];
                      if (v45 - v66 >= v82)
                      {
                        if (((v80 >> 5) & 0xFFFFFFFFFLL) - (v45 - v66) > v82 || v81 == -1) {
                          goto LABEL_73;
                        }
                      }
                      else if (v81 == -1)
                      {
                        goto LABEL_73;
                      }
                      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
                      id v37 = v100;
                      id v39 = (_DWORD *)MEMORY[0x1E4F14AF8];
                      goto LABEL_73;
                    }
                  }
                  unsigned int v67 = v64 - v62;
                  if (v67)
                  {
                    do
                    {
                      uint64_t v68 = v67 >> 1;
                      int v65 = &v63[2 * v68];
                      unint64_t v66 = *v65;
                      if (*v65 <= v45)
                      {
                        if (((v63[2 * v68 + 1] >> 5) & 0xFFFFFFFFFLL) + v66 > v45) {
                          goto LABEL_69;
                        }
                        uint64_t v63 = v65 + 2;
                        LODWORD(v68) = --v67 >> 1;
                      }
                      BOOL v43 = v67 >= 2;
                      unsigned int v67 = v68;
                    }
                    while (v43);
                  }
                }
                else
                {
                  do
                  {
                    uint64_t v69 = v55 >> 1;
                    int v65 = &v59[2 * v69];
                    unint64_t v66 = *v65;
                    if (*v65 <= v45)
                    {
                      if (((v59[2 * v69 + 1] >> 5) & 0xFFFFFFFFFLL) + v66 > v45) {
                        goto LABEL_69;
                      }
                      int v59 = v65 + 2;
                      LODWORD(v69) = --v55 >> 1;
                    }
                    BOOL v43 = v55 >= 2;
                    unsigned int v55 = v69;
                  }
                  while (v43);
                }
              }
LABEL_73:
              if (++v38 == v35)
              {
                free(v37);
                unsigned int v31 = v98;
                uint64_t v6 = v99;
                goto LABEL_100;
              }
              goto LABEL_23;
            }
            unint64_t v71 = v54 + 64;
            unint64_t v72 = --v70 >> 1;
          }
          BOOL v43 = v70 >= 2;
          unint64_t v70 = v72;
          if (!v43) {
            goto LABEL_73;
          }
        }
      }
      if (v10 == 4)
      {
        uint64_t v26 = *(unsigned int *)(a1 + 48);
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7;
        v107[3] = &unk_1E5D232A8;
        int v27 = *(void **)(a1 + 40);
        v107[4] = *(void *)(a1 + 32);
        int v109 = v5;
        id v108 = v27;
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v26, v107);
        id v13 = v108;
        goto LABEL_7;
      }
LABEL_106:
      ++v5;
      uint64_t v2 = *(void *)(a1 + 32);
      if (v5 >= *(unsigned int *)(v2 + 104)) {
        return;
      }
    }
    uint64_t v11 = *(unsigned int *)(a1 + 48);
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3;
    v121[3] = &unk_1E5D232A8;
    unint64_t v12 = *(void **)(a1 + 40);
    v121[4] = *(void *)(a1 + 32);
    int v123 = v5;
    id v122 = v12;
    (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v11, v121);
    id v13 = v122;
LABEL_7:

    goto LABEL_106;
  }
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  unint64_t v6 = *(void *)(*(void *)(v4 + 96) + 16 * v5 + 8);
  unint64_t v7 = (v6 >> 5) & 0xFFFFFFFFFLL;
  if (v7 >= 0x100
    && (*(_DWORD *)a2 == -1583242847 && !strncmp((const char *)(a2 + 4), "AUTORELEASE!", 0xCuLL)
     || v7 == 10240
     && *(_DWORD *)(a2 + 2048) == -1583242847
     && !strncmp((const char *)(a2 + 2052), "AUTORELEASE!", 0xCuLL)))
  {
    char v18 = *(unsigned char *)(v4 + 364);
    *(_DWORD *)(v4 + 316) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 364) = 0;
    uint64_t v19 = *(void *)(a1 + 32);
    mach_vm_address_t v20 = (uint64_t *)(*(void *)(v19 + 96) + 16 * *(unsigned int *)(a1 + 48));
    uint64_t v21 = *v20;
    unint64_t v22 = ((unint64_t)v20[1] >> 5) & 0xFFFFFFFFFLL;
    unint64_t v23 = *(void *)(a2 + *(unsigned int *)[*(id *)(v19 + 80) autoreleasePoolPageLayout]) - v21;
    if (v22 < v23) {
      unint64_t v23 = v22;
    }
    if (v23 >= 0x4000) {
      unint64_t v24 = 0x4000;
    }
    else {
      unint64_t v24 = v23;
    }
    -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(void *)(a1 + 32), a2, 0, *(_DWORD *)(a1 + 48), v24, *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 48) + 8) >> 41, 0, 8u, *(void *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 364) = v18;
    *(_DWORD *)(*(void *)(a1 + 32) + 316) = 0;
  }
  else
  {
    int v8 = [(id)v4 zoneNameForNode:v5];
    if (([*(id *)(*(void *)(a1 + 32) + 544) containsObject:v8] & 1) == 0) {
      -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(void *)(a1 + 32), a2, 0, *(_DWORD *)(a1 + 48), (v6 >> 5) & 0xFFFFFFFFFLL, *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * *(unsigned int *)(a1 + 48) + 8) >> 41, 0, 1u, *(void *)(a1 + 40));
    }
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = *(const void **)(v9 + 256);
    size_t v11 = *(unsigned int *)(v9 + 264);
    __compar[0] = MEMORY[0x1E4F143A8];
    __compar[1] = 3221225472;
    __compar[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4;
    __compar[3] = &__block_descriptor_36_e15_i24__0r_v8r_v16l;
    int v30 = *(_DWORD *)(a1 + 48);
    unint64_t v12 = bsearch_b(0, v10, v11, 0x10uLL, __compar);
    if (v12)
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(unsigned int *)(a1 + 48);
      uint64_t v15 = *(void **)(*(void *)(v13 + 272) + ((*(void *)(*(void *)(v13 + 96) + 16 * v14 + 8) >> 38) & 0x3FFFFF8));
      uint64_t v16 = v12[1];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5;
      v25[3] = &unk_1E5D23280;
      v25[4] = v13;
      uint64_t v27 = a2;
      int v28 = v14;
      id v26 = *(id *)(a1 + 40);
      id v17 = v15;
      [v17 enumerateStoredEntriesForObject:a2 ofSize:v6 >> 5 externalValues:v16 block:v25];
    }
  }
}

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *(unsigned int *)(a1 + 32);
  BOOL v4 = *a3 > v3;
  BOOL v5 = *a3 != v3;
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v5;
  }
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5(uint64_t a1, void *a2, unsigned int a3, unsigned int a4)
{
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (*MEMORY[0x1E4F14AE8] >= *MEMORY[0x1E4F14B00]) {
    unint64_t v4 = *MEMORY[0x1E4F14B00];
  }
  else {
    unint64_t v4 = *MEMORY[0x1E4F14AE8];
  }
  if (*MEMORY[0x1E4F14AE0] >= *MEMORY[0x1E4F14AF0]) {
    uint64_t v5 = *MEMORY[0x1E4F14AF0];
  }
  else {
    uint64_t v5 = *MEMORY[0x1E4F14AE0];
  }
  uint64_t v6 = *(void *)(a1 + 72) & ~v5;
  unint64_t v7 = ((*(void *)(a1 + 80) + v5) & ~v5) - v6;
  unint64_t v30 = v7 / v4;
  int v8 = malloc_type_malloc(4 * (v7 / v4) + 4, 0x100004052888210uLL);
  v8[v7 / v4] = 0;
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
  LODWORD(v6) = [v9 machVMPageRangeQueryWithAddress:v6 size:v7 dispositions:v8 dispositionsCount:&v30];

  if (v6)
  {
    free(v8);
  }
  else
  {
    uint64_t v29 = a2;
    uint64_t v10 = *(void *)(a1 + 56);
    unint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
    if (v11)
    {
      uint64_t v12 = ~v5;
      unint64_t v13 = *(void *)(a1 + 72) & ~v5;
      unint64_t v14 = -1;
      uint64_t v15 = (char *)v8;
      do
      {
        char v16 = *v15;
        v15 += 4;
        BOOL v17 = (v16 & 0x11) == 0 || v13 >= *(void *)(a1 + 80);
        int v18 = !v17;
        if (v17)
        {
          uint64_t v19 = *(void *)(a1 + 64);
          if (v14 == -1)
          {
            unint64_t v20 = *(void *)(*(void *)(v19 + 8) + 24);
            if (v13 > v20)
            {
              if (v11 >= v13 - v20) {
                unint64_t v21 = v13 - v20;
              }
              else {
                unint64_t v21 = v11;
              }
              -[VMUKernelCoreMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(void *)(a1 + 32), v29, v20 - *(void *)(a1 + 72), *(_DWORD *)(a1 + 88), v21, 0, 0, 8u, *(void *)(a1 + 48));
              *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v21;
              *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) -= v21;
              uint64_t v19 = *(void *)(a1 + 64);
            }
          }
          uint64_t v22 = *(void *)(v19 + 8);
          uint64_t v23 = *(void *)(v22 + 24);
          *(void *)(v22 + 24) = (v23 & v12) + v4;
          unint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) - v23;
          uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
          unint64_t v26 = *(void *)(v25 + 24);
          BOOL v17 = v26 >= v24;
          unint64_t v27 = v26 - v24;
          if (!v17) {
            unint64_t v27 = 0;
          }
          *(void *)(v25 + 24) = v27;
          uint64_t v10 = *(void *)(a1 + 56);
        }
        if (v14 >= v13) {
          unint64_t v28 = v13;
        }
        else {
          unint64_t v28 = v14;
        }
        if (v18) {
          unint64_t v14 = -1;
        }
        else {
          unint64_t v14 = v28;
        }
        v13 += v4;
        unint64_t v11 = *(void *)(*(void *)(v10 + 8) + 24);
      }
      while (v11);
    }
    free(v8);
    if (*(unsigned char *)(*(void *)(a1 + 40) + 49)) {
      [*(id *)(a1 + 32) clearCrashReporterInfoForMappedFileRegion];
    }
  }
}

void __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7(uint64_t a1, uint64_t a2)
{
}

uint64_t __61__VMUKernelCoreMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = 0;
  unint64_t v7 = (_DWORD *)MEMORY[0x1E4F14AF8];
  int v8 = &OBJC_IVAR___VMUVMRegion_range;
  do
  {
    uint64_t v9 = *(uint64_t **)(*(void *)(v5 + 32) + 128);
    unint64_t v10 = v9[6];
    unint64_t v11 = v9[7];
    BOOL v12 = v11 >= v10;
    unint64_t v13 = v11 - v10;
    if (!v12) {
      goto LABEL_53;
    }
    unint64_t v14 = *(void *)(a2 + 8 * v6);
    if (v14 - v10 >= v13) {
      goto LABEL_53;
    }
    unint64_t v15 = v14 >> *v7;
    if (v15)
    {
      char v16 = (unsigned int *)v9[3];
      unint64_t v17 = v14 >> *v7;
      do
      {
        if (*v16 <= (v17 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v16 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) == 0)
        {
          goto LABEL_53;
        }
        v17 >>= 26;
      }
      while (v17);
    }
    uint64_t v18 = (uint64_t)v9 + 4 * (v15 & 0x7FFFF);
    int v21 = *(_DWORD *)(v18 + 64);
    unint64_t v20 = (_DWORD *)(v18 + 64);
    int v19 = v21;
    uint64_t v22 = v9[4];
    if (v21)
    {
      unint64_t v23 = v22 + ((unint64_t)(v19 - 1) << 6);
      if (v14 - *(void *)(*(void *)v23 + *v8) < *(void *)(*(void *)v23 + *v8 + 8)) {
        goto LABEL_13;
      }
    }
    unint64_t v39 = *((unsigned int *)v9 + 10);
    if (!v39) {
      goto LABEL_53;
    }
    unint64_t v40 = v9[4];
    while (1)
    {
      unint64_t v41 = v39 >> 1;
      unint64_t v23 = v40 + (v39 >> 1 << 6);
      uint64_t result = *(void *)v23;
      unint64_t v42 = (unint64_t *)(*(void *)v23 + *v8);
      if (*v42 <= v14) {
        break;
      }
LABEL_36:
      BOOL v12 = v39 >= 2;
      unint64_t v39 = v41;
      if (!v12) {
        goto LABEL_53;
      }
    }
    if (v42[1] + *v42 <= v14)
    {
      unint64_t v40 = v23 + 64;
      unint64_t v41 = --v39 >> 1;
      goto LABEL_36;
    }
    uint64_t result = [(id)result isSpecialPhysFootprintRegion];
    int v8 = &OBJC_IVAR___VMUVMRegion_range;
    unint64_t v7 = (_DWORD *)MEMORY[0x1E4F14AF8];
    if (result) {
      unint64_t v43 = 0;
    }
    else {
      unint64_t v43 = v23;
    }
    if (result) {
      goto LABEL_53;
    }
    if ((*(unsigned char *)(*(void *)v43 + 132) & 1) == 0) {
      goto LABEL_67;
    }
    unint64_t v44 = (uint64_t *)(v43 + 64);
    unint64_t v45 = *((unsigned int *)v9 + 10) - ((uint64_t)(v43 + 64 - v9[4]) >> 6);
    if (!v45) {
      goto LABEL_64;
    }
    while (2)
    {
      unint64_t v46 = v45 >> 1;
      id v47 = &v44[8 * (v45 >> 1)];
      uint64_t result = *v47;
      if (*(void *)(*v47 + 8) > v14)
      {
LABEL_47:
        BOOL v48 = v45 > 1;
        unint64_t v45 = v46;
        if (!v48)
        {
          unint64_t v45 = 0;
          goto LABEL_64;
        }
        continue;
      }
      break;
    }
    if (*(void *)(*v47 + 16) + *(void *)(*v47 + 8) <= v14)
    {
      unint64_t v44 = v47 + 8;
      unint64_t v46 = --v45 >> 1;
      goto LABEL_47;
    }
    uint64_t result = [(id)result isSpecialPhysFootprintRegion];
    int v8 = &OBJC_IVAR___VMUVMRegion_range;
    unint64_t v7 = (_DWORD *)MEMORY[0x1E4F14AF8];
    if (result) {
      unint64_t v45 = 0;
    }
    else {
      unint64_t v45 = (unint64_t)v47;
    }
LABEL_64:
    if (v45) {
      unint64_t v43 = v45;
    }
    unint64_t v23 = v43;
LABEL_67:
    *unint64_t v20 = ((v43 - v22) >> 6) + 1;
LABEL_13:
    unsigned int v24 = *(_DWORD *)(v23 + 20);
    if (v24)
    {
      uint64_t v25 = *(void *)(v23 + 8);
      uint64_t v26 = *v9;
      uint64_t v27 = *(unsigned int *)(v23 + 16);
      unint64_t v28 = (unint64_t *)(*v9 + 16 * v27);
      if (v25)
      {
        if (*v28 > v14) {
          goto LABEL_53;
        }
        uint64_t v29 = (void *)(v26 + 16 * (v24 + v27 - 1));
        if (((v29[1] >> 5) & 0xFFFFFFFFFuLL) + *v29 <= v14) {
          goto LABEL_53;
        }
        unint64_t v30 = (unsigned int *)(v25 + 4 * ((v14 - (*v28 & -*MEMORY[0x1E4F14B00])) >> *v7));
        uint64_t v31 = *v30;
        uint64_t v32 = (unint64_t *)(v26 + 16 * v31);
        if (*v32 > v14) {
          goto LABEL_53;
        }
        uint64_t v33 = v30[1];
        if (v33 < *((_DWORD *)v9 + 2))
        {
          int v34 = (unint64_t *)(v26 + 16 * v33);
          unint64_t v35 = *v34;
          if (*v34 <= v14)
          {
LABEL_49:
            unint64_t v49 = v34[1];
            if ((v49 & 7) - 2 < 3) {
              goto LABEL_53;
            }
            unint64_t v50 = ((unint64_t)v34 - v26) >> 4;
            unint64_t v51 = v9[2];
            if (v14 - v35 >= v51)
            {
              if (((v49 >> 5) & 0xFFFFFFFFFLL) - (v14 - v35) > v51 || v50 == -1) {
                goto LABEL_53;
              }
            }
            else if (v50 == -1)
            {
              goto LABEL_53;
            }
            int v52 = v7;
            uint64_t v53 = v8;
            uint64_t result = (*(uint64_t (**)(void))(*(void *)(v5 + 40) + 16))();
            int v8 = v53;
            unint64_t v7 = v52;
            goto LABEL_53;
          }
        }
        unsigned int v36 = v33 - v31;
        if (v36)
        {
          do
          {
            uint64_t v37 = v36 >> 1;
            int v34 = &v32[2 * v37];
            unint64_t v35 = *v34;
            if (*v34 <= v14)
            {
              if (((v32[2 * v37 + 1] >> 5) & 0xFFFFFFFFFLL) + v35 > v14) {
                goto LABEL_49;
              }
              uint64_t v32 = v34 + 2;
              LODWORD(v37) = --v36 >> 1;
            }
            BOOL v12 = v36 >= 2;
            unsigned int v36 = v37;
          }
          while (v12);
        }
      }
      else
      {
        do
        {
          uint64_t v38 = v24 >> 1;
          int v34 = &v28[2 * v38];
          unint64_t v35 = *v34;
          if (*v34 <= v14)
          {
            if (((v28[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + v35 > v14) {
              goto LABEL_49;
            }
            unint64_t v28 = v34 + 2;
            LODWORD(v38) = --v24 >> 1;
          }
          BOOL v12 = v24 >= 2;
          unsigned int v24 = v38;
        }
        while (v12);
      }
    }
LABEL_53:
    ++v6;
  }
  while (v6 != a3);
  return result;
}

- (unsigned)_removeFalsePositiveLeakedVMregionsFromNodes:(unsigned int *)a3 nodeCount:(unsigned int)a4 recorder:(id)a5
{
  int v8 = (void (**)(void))a5;
  if (!a4)
  {
    unsigned int v35 = 0;
    goto LABEL_5;
  }
  uint64_t v9 = getenv("DT_REPORT_IOKIT_REGION_LEAKS");
  if (v9) {
    BOOL v10 = ((*v9 - 89) & 0xDF) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t blocksCount = self->_blocksCount;
  if (blocksCount)
  {
    uint64_t v13 = 0;
    unint64_t v14 = (uint64_t *)self->_blocks + 1;
    do
    {
      uint64_t v15 = *v14;
      v14 += 2;
      if ((v15 & 7) == 3) {
        break;
      }
      ++v13;
    }
    while (blocksCount != v13);
  }
  uint64_t v16 = 0;
  char v36 = 0;
  unsigned int v35 = 0;
  if (a4 <= 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = a4;
  }
  unsigned int v31 = -1;
  uint64_t v18 = 0xFFFFFFFFLL;
  int v34 = v8;
  BOOL v33 = v10;
  do
  {
    uint64_t v19 = a3[v16];
    if (!v19 || !VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[v19] + 2) & 7)) {
      goto LABEL_48;
    }
    unint64_t v20 = (unsigned __int8 *)objc_retain(*(id *)((char *)&self->_regions->var0
                                               + ((*((void *)&self->_blocks[v19] + 1) >> 35) & 0x1FFFFFC0)));
    int v21 = v20;
    int v22 = *((_DWORD *)v20 + 26);
    if (v22 > 87)
    {
      if (v22 == 88 || v22 == 100)
      {
LABEL_23:
        if (v10)
        {
          if (v36)
          {
            char v36 = 1;
          }
          else
          {
            char v36 = 1;
            fwrite("The DT_REPORT_IOKIT_REGION_LEAKS env var is set so leaked IOKit, IOSurface, or IOAccelerator regions will be reported, if -vmalso is passed to 'leaks'\n", 0x97uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
          }
        }
        else
        {
          v8[2](v8);
        }
LABEL_46:
        uint64_t v19 = v18;
        goto LABEL_47;
      }
    }
    else if (v22)
    {
      if (v22 == 21) {
        goto LABEL_23;
      }
    }
    else if (v20[50] == 5)
    {
      goto LABEL_23;
    }
    if (v19 == 1) {
      goto LABEL_46;
    }
    uint64_t v23 = (16 * (v19 - 1)) | 8;
    int v32 = v19 - 1;
    unsigned int v24 = v19 - 1;
    while (1)
    {
      if (!VMUGraphNodeType_IsVMRegion(*(_DWORD *)((unsigned char *)&self->_blocks->var0 + v23) & 7))
      {
        a3[v35++] = v19;
LABEL_51:
        uint64_t v19 = v18;
        int v8 = v34;
        BOOL v10 = v33;
        goto LABEL_47;
      }
      uint64_t v25 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                    + ((*(unint64_t *)((char *)&self->_blocks->var0 + v23) >> 35) & 0x1FFFFFC0)));
      if ([v25 isSubmap]) {
        goto LABEL_43;
      }
      int v26 = *((_DWORD *)v25 + 26);
      int v27 = *((_DWORD *)v21 + 26);
      if (v26 == v27
        && *((unsigned __int8 *)v25 + 49) == v21[49]
        && (v26 == 64 || (char *)v25[1] + (void)v25[2] == (char *)*((void *)v21 + 1)))
      {
        break;
      }
      if (!(v27 | v26)
        && (char *)v25[1] + (void)v25[2] == (char *)*((void *)v21 + 1)
        && [*((id *)v21 + 4) isEqualToString:VMUmappedFileLabel[0]]
        && [v25[4] isEqualToString:@"__LINKEDIT"]
        && [*((id *)v21 + 5) isEqualToString:v25[5]])
      {
        if (v18 == v32) {
          uint64_t v30 = v31;
        }
        else {
          uint64_t v30 = v24;
        }
        int v8 = v34;
        ((void (*)(void (**)(void), uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v34[2])(v34, v30, self->_blocks[v30].var0, 1, v19, self->_blocks[v19].var0);
        unsigned int v31 = v30;
        goto LABEL_63;
      }
LABEL_43:

      v23 -= 16;
      if (!--v24) {
        goto LABEL_51;
      }
    }
    if (v18 == v32) {
      uint64_t v29 = v31;
    }
    else {
      uint64_t v29 = v24;
    }
    int v8 = v34;
    ((void (*)(void (**)(void), uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v34[2])(v34, v29, self->_blocks[v29].var0, 1, v19, self->_blocks[v19].var0);
    unsigned int v31 = v29;
    if (v35)
    {
      if (a3[v35 - 1] >= v29) {
        a3[v35++] = v19;
      }
    }
    else
    {
      unsigned int v35 = 0;
    }
LABEL_63:
    BOOL v10 = v33;

LABEL_47:
    uint64_t v18 = v19;
LABEL_48:
    ++v16;
  }
  while (v16 != v17);
LABEL_5:

  return v35;
}

- (id)processSnapshotGraphWithOptions:(unint64_t)a3
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [VMUProcessObjectGraph alloc];
  uint64_t pid = self->_pid;
  uint64_t blocksCount = self->_blocksCount;
  zoneNames = self->_zoneNames;
  classInfoIndexer = self->_classInfoIndexer;
  blocks = self->_blocks;
  BOOL v10 = [(VMUVMRegionIdentifier *)self->_regionIdentifier regions];
  unint64_t v11 = [(VMUProcessObjectGraph *)v4 initWithPid:pid nodes:blocks nodeCount:blocksCount zoneNames:zoneNames classInfoMap:classInfoIndexer regions:v10 pthreadOffsets:0 userMarked:self->_userMarkedAbandoned autoreleasePoolOffsets:[(VMUObjectIdentifier *)self->_objectIdentifier autoreleasePoolPageLayout]];
  processObjectGraph = self->_processObjectGraph;
  self->_processObjectGraph = v11;

  [(VMUProcessObjectGraph *)self->_processObjectGraph setSnapshotMachTime:self->_suspendTime];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setSnapshotDate:self->_suspendDate];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setScanner:self];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setDebugTimer:self->_debugTimer];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setShowRawClassNames:self->_showRawClassNames];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setProcessDescriptionString:self->_processDescriptionString];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setIsTranslatedByRosetta:[(VMUKernelCoreMemoryScanner *)self isTranslatedByRosetta]];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setProcessName:self->_processName];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setBinaryImagesDescription:self->_binaryImagesDescription];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setPhysicalFootprint:self->_physicalFootprint];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setLedger:self->_ledger];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setPhysicalFootprintPeak:self->_physicalFootprintPeak];
  uint64_t v13 = [(VMUTask *)self->_task taskDyldSharedCacheRange];
  -[VMUProcessObjectGraph setDyldSharedCacheRange:](self->_processObjectGraph, "setDyldSharedCacheRange:", v13, v14);
  [(VMUProcessObjectGraph *)self->_processObjectGraph setObjectContentLevel:[(VMUKernelCoreMemoryScanner *)self objectContentLevel]];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setObjectContentLevelForNodeLabels:[(VMUKernelCoreMemoryScanner *)self objectContentLevel]];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setSrcAddressToExtraAutoreleaseCountDict:self->_srcAddressToExtraAutoreleaseCountDict];
  if ((self->_regionDescriptionOptions & 0x10000) != 0) {
    [(VMUProcessObjectGraph *)self->_processObjectGraph setShowsPhysFootprint:1];
  }
  uint64_t v15 = [(VMUTask *)self->_task createSymbolicatorWithFlags:0 andNotification:0];
  uint64_t v17 = v16;
  if (self->_targetProcessHasObjCPatches)
  {
    uint64_t v80 = CSSymbolicatorCreateForTaskSharedCache();
    uint64_t v81 = v18;
  }
  else
  {
    uint64_t v80 = 0;
    uint64_t v81 = 0;
  }
  v122[0] = 0;
  v122[1] = v122;
  v122[2] = 0x3010000000;
  v122[5] = 0;
  v122[3] = &unk_1A7D91765;
  v122[4] = 0;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x3010000000;
  void v121[5] = 0;
  v121[3] = &unk_1A7D91765;
  v121[4] = 0;
  v119[0] = 0;
  v119[1] = v119;
  v119[2] = 0x2020000000;
  char v120 = 0;
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v20 = [(VMUDebugTimer *)debugTimer signpostID];
    debugTimer = self->_debugTimer;
    if (v20)
    {
      int v21 = [(VMUDebugTimer *)debugTimer logHandle];
      os_signpost_id_t v22 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v21, OS_SIGNPOST_INTERVAL_END, v22, "processSnapshotGraph", "", buf, 2u);
      }

      debugTimer = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)debugTimer endEvent:"processSnapshotGraph"];
  [(VMUDebugTimer *)self->_debugTimer startWithCategory:"processSnapshotGraph" message:"sampling all threads"];
  uint64_t v23 = self->_debugTimer;
  if (v23)
  {
    unsigned int v24 = [(VMUDebugTimer *)v23 logHandle];
    os_signpost_id_t v25 = [(VMUDebugTimer *)self->_debugTimer signpostID];
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "processSnapshotGraph", "sampling all threads", buf, 2u);
    }
  }
  if ([(VMUTask *)self->_task isCore])
  {
    int v26 = 0;
    int v27 = 0;
  }
  else
  {
    int v26 = [[VMUSampler alloc] initWithTask:[(VMUTask *)self->_task taskPort] options:257];
    int v27 = [(VMUSampler *)v26 sampleAllThreadsOnceWithFramePointers:1];
  }
  unint64_t v28 = getenv("PreserveMemgraphSampleAndSymbolStore");
  if (v28
    && ([NSString stringWithUTF8String:v28],
        uint64_t v29 = objc_claimAutoreleasedReturnValue(),
        [v29 uppercaseString],
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        char v31 = [v30 isEqualToString:@"NO"],
        v30,
        v29,
        (v31 & 1) != 0))
  {
    int v32 = 0;
  }
  else
  {
    [(VMUProcessObjectGraph *)self->_processObjectGraph setBacktraces:v27];
    int v32 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]([VMUSymbolStore alloc], "initWithSymbolicator:debugTimer:", v15, v17, self->_debugTimer);
    [(VMUProcessObjectGraph *)self->_processObjectGraph setSymbolStore:v32];
    BOOL v33 = self->_processObjectGraph;
    int v34 = [(VMUProcessObjectGraph *)v33 symbolStore];
    [v34 setGraph:v33];
  }
  if (v27)
  {
    long long v117 = 0u;
    long long v118 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v35 = v27;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v115 objects:v123 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v116;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v116 != v37) {
            objc_enumerationMutation(v35);
          }
          [(VMUSymbolStore *)v32 addBacktrace:*(void *)(*((void *)&v115 + 1) + 8 * i) origin:0];
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v115 objects:v123 count:16];
      }
      while (v36);
    }
  }
  *(void *)buf = 0;
  uint64_t v110 = buf;
  uint64_t v111 = 0x3010000000;
  uint64_t v114 = 0;
  id v112 = &unk_1A7D91765;
  uint64_t v113 = 0;
  v108[0] = 0;
  v108[1] = v108;
  v108[2] = 0x3010000000;
  v108[4] = 0;
  v108[5] = 0;
  v108[3] = &unk_1A7D91765;
  v106[0] = 0;
  v106[1] = v106;
  v106[2] = 0x3032000000;
  v106[3] = __Block_byref_object_copy__0;
  v106[4] = __Block_byref_object_dispose__0;
  id v107 = 0;
  v104[0] = 0;
  v104[1] = v104;
  v104[2] = 0x2020000000;
  int v105 = 0;
  if ((a3 & 2) != 0 && ([(VMUKernelCoreMemoryScanner *)self objectContentLevel] & 0xFFFFFFFE) == 2)
  {
    unint64_t v39 = self->_debugTimer;
    if (v39)
    {
      uint64_t v40 = [(VMUDebugTimer *)v39 signpostID];
      unint64_t v39 = self->_debugTimer;
      if (v40)
      {
        unint64_t v41 = [(VMUDebugTimer *)v39 logHandle];
        os_signpost_id_t v42 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v42 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)id v103 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v41, OS_SIGNPOST_INTERVAL_END, v42, "processSnapshotGraph", "", v103, 2u);
        }

        unint64_t v39 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v39 endEvent:"processSnapshotGraph"];
    [(VMUDebugTimer *)self->_debugTimer startWithCategory:"processSnapshotGraph" message:"getting node labels"];
    unint64_t v43 = self->_debugTimer;
    if (v43)
    {
      unint64_t v44 = [(VMUDebugTimer *)v43 logHandle];
      os_signpost_id_t v45 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)id v103 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v45, "processSnapshotGraph", "getting node labels", v103, 2u);
      }
    }
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    void v102[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke;
    v102[3] = &unk_1E5D23370;
    v102[4] = self;
    [(VMUKernelCoreMemoryScanner *)self enumerateObjectsWithBlock:v102];
  }
  size_t regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    id v47 = self->_debugTimer;
    if (v47)
    {
      uint64_t v48 = [(VMUDebugTimer *)v47 signpostID];
      id v47 = self->_debugTimer;
      if (v48)
      {
        unint64_t v49 = [(VMUDebugTimer *)v47 logHandle];
        os_signpost_id_t v50 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)id v103 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v49, OS_SIGNPOST_INTERVAL_END, v50, "processSnapshotGraph", "", v103, 2u);
        }

        id v47 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v47 endEvent:"processSnapshotGraph"];
    -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "processSnapshotGraph", "scan nodes into the graph, while recording symbols of __DATA regions and stacks");
    unint64_t v51 = self->_debugTimer;
    if (v51)
    {
      int v52 = [(VMUDebugTimer *)v51 logHandle];
      os_signpost_id_t v53 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
      {
        *(_WORD *)id v103 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v53, "processSnapshotGraph", "scan nodes into the graph, while recording symbols of __DATA regions and stacks", v103, 2u);
      }
    }
    unint64_t v54 = (char *)malloc_type_calloc(regionsCount, 4uLL, 0x100004052888210uLL);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_166;
    v85[3] = &unk_1E5D23588;
    int v96 = v54;
    unint64_t v97 = a3;
    uint64_t v98 = v80;
    uint64_t v99 = v81;
    uint64_t v100 = v15;
    uint64_t v101 = v17;
    v85[4] = self;
    mach_vm_address_t v89 = v122;
    mach_vm_address_t v90 = v119;
    int v91 = v121;
    mach_vm_address_t v86 = v32;
    unint64_t v92 = buf;
    uint64_t v93 = v108;
    uint64_t v94 = v106;
    uint64_t v95 = v104;
    id v87 = v27;
    mach_vm_size_t v88 = v26;
    [(VMUKernelCoreMemoryScanner *)self scanNodesWithReferenceRecorder:v85];
    unsigned int v55 = self->_debugTimer;
    if (v55)
    {
      uint64_t v56 = [(VMUDebugTimer *)v55 signpostID];
      unsigned int v55 = self->_debugTimer;
      if (v56)
      {
        uint64_t v57 = [(VMUDebugTimer *)v55 logHandle];
        os_signpost_id_t v58 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
        {
          *(_WORD *)id v103 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v57, OS_SIGNPOST_INTERVAL_END, v58, "processSnapshotGraph", "", v103, 2u);
        }

        unsigned int v55 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v55 endEvent:"processSnapshotGraph"];
    [(VMUDebugTimer *)self->_debugTimer startWithCategory:"processSnapshotGraph" message:"find unreferenced VM regions"];
    int v59 = self->_debugTimer;
    if (v59)
    {
      id v60 = [(VMUDebugTimer *)v59 logHandle];
      os_signpost_id_t v61 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v61 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)id v103 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v60, OS_SIGNPOST_INTERVAL_BEGIN, v61, "processSnapshotGraph", "find unreferenced VM regions", v103, 2u);
      }
    }
    uint64_t v62 = malloc_type_malloc(4 * regionsCount, 0x100004052888210uLL);
    uint64_t v63 = v62;
    unint64_t v64 = self->_blocksCount;
    if (v64)
    {
      unint64_t v65 = 0;
      uint64_t v66 = 0;
      unsigned int v67 = (unint64_t *)self->_blocks + 1;
      do
      {
        unint64_t v69 = *v67;
        v67 += 2;
        unint64_t v68 = v69;
        if ((v69 & 7) == 5 && !*(_DWORD *)&v54[(v68 >> 39) & 0x1FFFFFC])
        {
          *((_DWORD *)v62 + v66) = v65;
          uint64_t v66 = (v66 + 1);
          unint64_t v64 = self->_blocksCount;
        }
        ++v65;
      }
      while (v65 < v64);
      if (v66)
      {
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 3221225472;
        v84[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_183;
        v84[3] = &unk_1E5D23410;
        void v84[4] = self;
        [(VMUKernelCoreMemoryScanner *)self _removeFalsePositiveLeakedVMregionsFromNodes:v62 nodeCount:v66 recorder:v84];
      }
    }
    free(v63);
    free(v54);
  }
  CSRelease();
  [(VMUKernelCoreMemoryScanner *)self unmapAllRegions];
  unint64_t v70 = self->_debugTimer;
  if (v70)
  {
    uint64_t v71 = [(VMUDebugTimer *)v70 signpostID];
    unint64_t v70 = self->_debugTimer;
    if (v71)
    {
      unint64_t v72 = [(VMUDebugTimer *)v70 logHandle];
      os_signpost_id_t v73 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
      {
        *(_WORD *)id v103 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v72, OS_SIGNPOST_INTERVAL_END, v73, "processSnapshotGraph", "", v103, 2u);
      }

      unint64_t v70 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v70 endEvent:"processSnapshotGraph"];
  if (a3)
  {
    unint64_t v74 = [VMUGraphStackLogReader alloc];
    LODWORD(v79) = self->_zonesCount;
    unint64_t v75 = -[VMUGraphStackLogReader initWithCore:symbolicator:graph:debugTimer:zones:zonesCount:](v74, "initWithCore:symbolicator:graph:debugTimer:zones:zonesCount:", self->_memoryCache, v15, v17, self->_processObjectGraph, self->_debugTimer, self->_zones, v79);
    if (v75)
    {
      [(VMUProcessObjectGraph *)self->_processObjectGraph setStackLogReader:v75];
      unint64_t v76 = self->_classInfoIndexer;
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_185;
      v83[3] = &unk_1E5D231C0;
      v83[4] = self;
      [(VMUStackLogReaderBase *)v75 identifyNonObjectsUsingStackBacktraces:self classInfoMap:v76 classInfoSetterBlock:v83];
      [(VMUKernelCoreMemoryScanner *)self _updateLinearClassInfos];
    }
  }
  [(VMUProcessObjectGraph *)self->_processObjectGraph setIdleExitStatus:self->_idleExitStatus];
  CSRelease();
  unint64_t v77 = self->_processObjectGraph;
  _Block_object_dispose(v104, 8);
  _Block_object_dispose(v106, 8);

  _Block_object_dispose(v108, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v119, 8);
  _Block_object_dispose(v121, 8);
  _Block_object_dispose(v122, 8);

  return v77;
}

void __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 8) >> 60 == 1)
  {
    uint64_t v5 = (void *)MEMORY[0x1AD0D9F90]();
    uint64_t v6 = [*(id *)(a1 + 32) labelForNode:a2];
    if (v6) {
      [*(id *)(*(void *)(a1 + 32) + 496) setLabel:v6 forNode:a2];
    }
  }
}

void __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_166(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v8 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 496) addEdgeFromNode:a2 sourceOffset:a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a2) withScanType:a4 toNode:a5 destinationOffset:a6 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a5)] != -1)
  {
    if (v8 != a5
      && (*(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a5 + 8) & 7) == 5)
    {
      unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a5 + 8);
      ++*(_DWORD *)(*(void *)(a1 + 120) + ((v10 >> 39) & 0x1FFFFFC));
    }
    if ((*(unsigned char *)(a1 + 128) & 4) != 0)
    {
      uint64_t v11 = v8;
      if (VMUGraphNodeType_IsVMRegion(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * v8 + 8) & 7))
      {
        BOOL v12 = (void *)MEMORY[0x1AD0D9F90]();
        id v13 = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32) + 112)
                                + ((*(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * v11 + 8) >> 35) & 0x1FFFFFC0)));
        uint64_t v14 = v13;
        if ((*((unsigned char *)v13 + 132) & 2) != 0)
        {
          if ((*((unsigned char *)v13 + 132) & 4) == 0) {
            goto LABEL_17;
          }
        }
        else if ((*((unsigned char *)v13 + 132) & 4) == 0)
        {
          if (*((_DWORD *)v13 + 26) != 30
            || a3 - *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) < *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                            + 40))
          {
            goto LABEL_32;
          }
          if (a3 - *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) >= *(void *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                                             + 40))
          {
            uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 152) indexForLocation:a3];
            if (v15 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v16 = *(void *)(*(void *)(a1 + 96) + 8);
              *(void *)(v16 + 32) = 0;
              *(void *)(v16 + 40) = 0;
              uint64_t v17 = *(void *)(*(void *)(a1 + 104) + 8);
              uint64_t v18 = *(void **)(v17 + 40);
              *(void *)(v17 + 40) = 0;

              *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
            }
            else
            {
              uint64_t v33 = v15;
              uint64_t v34 = [*(id *)(*(void *)(a1 + 32) + 152) rangeAtIndex:v15];
              uint64_t v35 = *(void *)(*(void *)(a1 + 96) + 8);
              *(void *)(v35 + 32) = v34;
              *(void *)(v35 + 40) = v36;
              if ([*(id *)(a1 + 48) count])
              {
                uint64_t v37 = 0;
                unsigned int v38 = 0;
                while (1)
                {
                  unint64_t v39 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v37];
                  if ([v39 backtraceLength])
                  {
                    if ([v39 backtraceLength])
                    {
                      uint64_t v40 = 0;
                      while (!*(void *)([v39 stackFramePointers] + 8 * v40))
                      {
                        if (++v40 >= (unint64_t)[v39 backtraceLength]) {
                          goto LABEL_42;
                        }
                      }
                      uint64_t v41 = *(void *)([v39 stackFramePointers] + 8 * v40);
                    }
                    else
                    {
LABEL_42:
                      uint64_t v41 = 0;
                    }
                    if ((unint64_t)(v41 - *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32)) < *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)) {
                      break;
                    }
                  }

                  uint64_t v37 = ++v38;
                  if ([*(id *)(a1 + 48) count] <= (unint64_t)v38) {
                    goto LABEL_48;
                  }
                }
                uint64_t v42 = *(void *)(*(void *)(a1 + 104) + 8);
                unint64_t v43 = *(void **)(v42 + 40);
                *(void *)(v42 + 40) = v39;
              }
LABEL_48:
              if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40))
              {
                *(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
                unint64_t v44 = [*(id *)(a1 + 56) threadDescriptionStringForBacktrace:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) returnedAddress:0];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v44 forRange:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v44 forRange:v33];
              }
              else
              {
                if ([*(id *)(*(void *)(a1 + 32) + 8) isCore])
                {
                  os_signpost_id_t v45 = &stru_1EFE27F38;
                }
                else
                {
                  os_signpost_id_t v45 = [*(id *)(a1 + 56) threadDescriptionStringForBacktrace:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) returnedAddress:0];
                }
                unint64_t v46 = [(__CFString *)v45 stringByAppendingString:@"  no associated pthread"];

                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v46 forRange:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v46 forRange:v33];
              }
            }
          }
          id v47 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
          if (!v47) {
            goto LABEL_32;
          }
          unsigned int v48 = [v47 backtraceLength];
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) >= v48) {
            goto LABEL_32;
          }
          unsigned int v49 = v48;
          while (1)
          {
            unint64_t v50 = *(void *)([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) stackFramePointers]+ 8 * *(unsigned int *)(*(void *)(*(void *)(a1 + 112) + 8) + 24));
            uint64_t v51 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) backtrace];
            uint64_t v52 = *(void *)(*(void *)(a1 + 112) + 8);
            uint64_t v53 = *(unsigned int *)(v52 + 24);
            if (v50 > a3) {
              break;
            }
            *(_DWORD *)(v52 + 24) = v53 + 1;
            if (*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) >= v49) {
              goto LABEL_32;
            }
          }
          uint64_t v54 = *(void *)(v51 + 8 * v53);
          uint64_t v55 = *(void *)(*(void *)(a1 + 88) + 8);
          *(void *)(v55 + 32) = a3;
          *(void *)(v55 + 40) = v50 - a3;
          CSSymbolicatorGetSymbolWithAddressAtTime();
          CSSymbolGetSymbolOwner();
          uint64_t Name = CSSymbolOwnerGetName();
          if (CSSymbolIsUnnamed()) {
            [NSString stringWithFormat:@"%#llx (in %s)", v54, Name];
          }
          else {
          int v27 = [NSString stringWithFormat:@"%s (in %s)", CSSymbolGetName(), Name];
          }
          if (!v27) {
            goto LABEL_32;
          }
          char v31 = *(void **)(*(void *)(a1 + 32) + 496);
          uint64_t v32 = *(void *)(a1 + 88);
          goto LABEL_31;
        }
        CSIsNull();
LABEL_17:
        if (a3 - *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) >= *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                           + 40))
        {
          CSSymbolicatorGetSectionWithAddressAtTime();
          uint64_t v19 = CSRegionGetName();
          if (v19)
          {
            uint64_t v20 = (const char *)v19;
            int v21 = [NSString stringWithUTF8String:v19];
            uint64_t Range = CSRegionGetRange();
            uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
            *(void *)(v23 + 32) = Range;
            *(void *)(v23 + 40) = v24;
            [*(id *)(*(void *)(a1 + 32) + 496) setBinarySectionName:v21 forRange:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) length:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            BOOL v25 = !strncmp(v20, "__DATA __objc_", 0xEuLL)
               || !strncmp(v20, "__AUTH __objc_", 0xEuLL)
               || !strncmp(v20, "__DATA_DIRTY __objc_", 0x14uLL)
               || !strncmp(v20, "__DATA_CONST __objc_", 0x14uLL)
               || !strncmp(v20, "__AUTH_CONST __objc_", 0x14uLL)
               || strncmp(v20, "__OBJC ", 7uLL) == 0;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v25;
          }
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
          goto LABEL_32;
        }
        if (a3 - *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) < *(void *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                                          + 40))
          goto LABEL_32;
        [*(id *)(a1 + 40) addAddress:a3 origin:2];
        CSSymbolicatorGetSymbolWithAddressAtTime();
        uint64_t v26 = CSSymbolGetName();
        if (!v26) {
          goto LABEL_32;
        }
        int v27 = [NSString stringWithUTF8String:v26];
        uint64_t v28 = CSSymbolGetRange();
        uint64_t v29 = *(void *)(*(void *)(a1 + 80) + 8);
        *(void *)(v29 + 32) = v28;
        *(void *)(v29 + 40) = v30;
        char v31 = *(void **)(*(void *)(a1 + 32) + 496);
        uint64_t v32 = *(void *)(a1 + 80);
LABEL_31:
        [v31 setRegionSymbolName:v27 forRange:*(void *)(*(void *)(v32 + 8) + 32) length:*(void *)(*(void *)(v32 + 8) + 40)];

LABEL_32:
      }
    }
  }
}

uint64_t __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_183(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) addEdgeFromNode:a2 sourceOffset:a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a2) withScanType:a4 toNode:a5 destinationOffset:a6 - *(void *)(*(void *)(*(void *)(a1 + 32) + 96) + 16 * a5)];
}

uint64_t __62__VMUKernelCoreMemoryScanner_processSnapshotGraphWithOptions___block_invoke_185(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 96) + 16 * a2;
  *(void *)(v3 + 8) = *(void *)(v3 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
  return result;
}

- (id)processSnapshotGraph
{
  return [(VMUKernelCoreMemoryScanner *)self processSnapshotGraphWithOptions:5];
}

- (VMUClassInfoMap)realizedClasses
{
  return [(VMUObjectIdentifier *)self->_objectIdentifier realizedClasses];
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  uint64_t v2 = [(VMUKernelCoreMemoryScanner *)self realizedClasses];
  char v3 = [v2 hasClassInfosDerivedFromStackBacktraces];

  return v3;
}

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUKernelCoreMemoryScanner *)self
{
  if (self->_blocksCount <= v1)
  {
    unint64_t *v2 = 0;
    v2[1] = 0;
    v2[2] = 0;
  }
  else
  {
    char v3 = &self->_blocks[v1];
    unint64_t var0 = v3->var0;
    unint64_t v4 = *((void *)v3 + 1);
    unint64_t *v2 = var0;
    v2[1] = ((v4 >> 5) | (v4 << 60)) & 0x7000000FFFFFFFFFLL;
    if ((v4 & 7) == 1) {
      unint64_t v6 = *(unint64_t *)((char *)self->_classInfos + ((v4 >> 38) & 0x3FFFFF8));
    }
    else {
      unint64_t v6 = 0;
    }
    v2[2] = v6;
  }
  return ($61A80719B04F7407D3E47539F1B23CAA)self;
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  id v4 = 0;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v8 = var7 - var6;
  BOOL v9 = var7 < var6;
  if (a3 - var6 >= v8 || v9) {
    goto LABEL_18;
  }
  unint64_t v11 = a3 >> *MEMORY[0x1E4F14AF8];
  if (v11)
  {
    var3 = regionMap->var3;
    unint64_t v13 = a3 >> *MEMORY[0x1E4F14AF8];
    while (*var3 > (v13 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)var3 + ((v13 & 0x3FFFFFF) >> 3) + 4) >> (v13 & 7)) & 1) != 0)
    {
      v13 >>= 26;
      if (!v13) {
        goto LABEL_8;
      }
    }
LABEL_17:
    id v4 = 0;
    goto LABEL_18;
  }
LABEL_8:
  uint64_t v14 = (char *)regionMap + 4 * (v11 & 0x7FFFF);
  int v17 = *((_DWORD *)v14 + 16);
  uint64_t v16 = v14 + 64;
  int v15 = v17;
  unint64_t var4 = regionMap->var4;
  if (v17)
  {
    p_unint64_t var0 = &var4[(unint64_t)(v15 - 1)].var0;
    if (a3 - *((void *)*p_var0 + 1) < *((void *)*p_var0 + 2)) {
      goto LABEL_10;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    goto LABEL_17;
  }
  int v21 = regionMap->var4;
  while (1)
  {
    unint64_t v22 = var5 >> 1;
    p_unint64_t var0 = &v21[var5 >> 1].var0;
    if (*((void *)*p_var0 + 1) <= a3) {
      break;
    }
LABEL_16:
    BOOL v23 = var5 >= 2;
    unint64_t var5 = v22;
    if (!v23) {
      goto LABEL_17;
    }
  }
  if (*((void *)*p_var0 + 2) + *((void *)*p_var0 + 1) <= a3)
  {
    int v21 = (_VMURegionNode *)(p_var0 + 8);
    unint64_t v22 = --var5 >> 1;
    goto LABEL_16;
  }
  int v25 = [*p_var0 isSpecialPhysFootprintRegion];
  id v4 = 0;
  if (v25) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = p_var0;
  }
  if (v25) {
    goto LABEL_18;
  }
  if ((*((unsigned char *)*v26 + 132) & 1) == 0) {
    goto LABEL_38;
  }
  int v27 = v26 + 8;
  unint64_t v28 = regionMap->var5 - (((char *)(v26 + 8) - (char *)regionMap->var4) >> 6);
  if (!v28) {
    goto LABEL_35;
  }
  while (2)
  {
    unint64_t v29 = v28 >> 1;
    uint64_t v30 = &v27[8 * (v28 >> 1)];
    if (*((void *)*v30 + 1) > a3)
    {
LABEL_30:
      BOOL v31 = v28 > 1;
      unint64_t v28 = v29;
      if (!v31)
      {
        unint64_t v28 = 0;
        goto LABEL_35;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v30 + 2) + *((void *)*v30 + 1) <= a3)
  {
    int v27 = v30 + 8;
    unint64_t v29 = --v28 >> 1;
    goto LABEL_30;
  }
  if ([*v30 isSpecialPhysFootprintRegion]) {
    unint64_t v28 = 0;
  }
  else {
    unint64_t v28 = (unint64_t)v30;
  }
LABEL_35:
  if (v28) {
    uint64_t v26 = (id *)v28;
  }
  p_unint64_t var0 = v26;
LABEL_38:
  _DWORD *v16 = ((unint64_t)((char *)v26 - (char *)var4) >> 6) + 1;
LABEL_10:
  id v4 = *p_var0;
LABEL_18:

  return v4;
}

- (id)vmuVMRegionForNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VMUKernelCoreMemoryScanner *)self nodeNamespaceSize] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    [(VMUKernelCoreMemoryScanner *)self nodeDetails:v3];
    uint64_t v5 = [(VMUKernelCoreMemoryScanner *)self vmuVMRegionForAddress:v7];
  }

  return v5;
}

- (id)zoneNameForNode:(unsigned int)a3
{
  if (self->_blocksCount <= a3) {
    goto LABEL_43;
  }
  uint64_t v4 = a3;
  if (VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[a3] + 2) & 7))
  {
    uint64_t v5 = &self->_regions[*((void *)&self->_blocks[v4] + 1) >> 41];
    if (!v5) {
      goto LABEL_43;
    }
    goto LABEL_4;
  }
  blocks = self->_blocks;
  if ((*((void *)&blocks[v4] + 1) & 7) != 1) {
    goto LABEL_43;
  }
  uint64_t v8 = 0;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  BOOL v13 = var7 >= var6;
  unint64_t v14 = var7 - var6;
  if (!v13) {
    goto LABEL_44;
  }
  unint64_t var0 = blocks[v4].var0;
  if (var0 - var6 >= v14) {
    goto LABEL_44;
  }
  unint64_t v16 = var0 >> *MEMORY[0x1E4F14AF8];
  if (v16)
  {
    var3 = (unsigned int *)regionMap->var3;
    unint64_t v18 = var0 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*var3 <= (v18 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v18 & 0x3FFFFFF) >> 3) + 4) >> (v18 & 7)) & 1) == 0)
      {
        goto LABEL_43;
      }
      v18 >>= 26;
    }
    while (v18);
  }
  uint64_t v19 = (char *)regionMap + 4 * (v16 & 0x7FFFF);
  int v22 = *((_DWORD *)v19 + 16);
  int v21 = v19 + 64;
  int v20 = v22;
  unint64_t var4 = regionMap->var4;
  if (v22)
  {
    id v6 = var4[(unint64_t)(v20 - 1)].var0;
    if (var0 - *((void *)v6 + 1) < *((void *)v6 + 2)) {
      goto LABEL_5;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    goto LABEL_43;
  }
  int v25 = regionMap->var4;
  while (1)
  {
    unint64_t v26 = var5 >> 1;
    uint64_t v5 = &v25[var5 >> 1];
    if (*((void *)v5->var0 + 1) <= var0) {
      break;
    }
LABEL_23:
    uint64_t v8 = 0;
    BOOL v13 = var5 >= 2;
    unint64_t var5 = v26;
    if (!v13) {
      goto LABEL_44;
    }
  }
  if (*((void *)v5->var0 + 2) + *((void *)v5->var0 + 1) <= var0)
  {
    int v25 = v5 + 1;
    unint64_t v26 = --var5 >> 1;
    goto LABEL_23;
  }
  int v27 = [v5->var0 isSpecialPhysFootprintRegion];
  uint64_t v8 = 0;
  if (v27) {
    unint64_t v28 = 0;
  }
  else {
    unint64_t v28 = v5;
  }
  if (v27) {
    goto LABEL_44;
  }
  if ((*((unsigned char *)v28->var0 + 132) & 1) == 0) {
    goto LABEL_42;
  }
  p_unint64_t var0 = &v28[1].var0;
  unint64_t v30 = regionMap->var5 - (&v28[1] - regionMap->var4);
  if (!v30) {
    goto LABEL_39;
  }
  while (2)
  {
    unint64_t v31 = v30 >> 1;
    uint64_t v32 = &p_var0[8 * (v30 >> 1)];
    if (*((void *)*v32 + 1) > var0)
    {
LABEL_34:
      BOOL v33 = v30 > 1;
      unint64_t v30 = v31;
      if (!v33)
      {
        unint64_t v30 = 0;
        goto LABEL_39;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v32 + 2) + *((void *)*v32 + 1) <= var0)
  {
    p_unint64_t var0 = v32 + 8;
    unint64_t v31 = --v30 >> 1;
    goto LABEL_34;
  }
  if ([*v32 isSpecialPhysFootprintRegion]) {
    unint64_t v30 = 0;
  }
  else {
    unint64_t v30 = (unint64_t)v32;
  }
LABEL_39:
  if (v30) {
    uint64_t v5 = (_VMURegionNode *)v30;
  }
  else {
    uint64_t v5 = v28;
  }
LABEL_42:
  *int v21 = ((unint64_t)((char *)v5 - (char *)var4) >> 6) + 1;
  if (!v5)
  {
LABEL_43:
    uint64_t v8 = 0;
    goto LABEL_44;
  }
LABEL_4:
  id v6 = v5->var0;
LABEL_5:
  unsigned int v7 = *((_DWORD *)v6 + 37);
  if (self->_zonesCount <= v7) {
    goto LABEL_43;
  }
  uint64_t v8 = (void *)[self->_zones[v7].var1 copy];
LABEL_44:

  return v8;
}

- (id)zoneNameForIndex:(unsigned int)a3
{
  if (self->_zonesCount <= a3) {
    return 0;
  }
  else {
    return self->_zones[a3].var1;
  }
}

- (BOOL)hasLabelsForNodes
{
  return 1;
}

- (id)labelForNode:(unsigned int)a3
{
  if (self->_blocksCount > a3 && (uint64_t v3 = *(void *)&a3, v5 = &self->_blocks[a3], (*((void *)v5 + 1) & 7) == 1))
  {
    uint64_t v6 = *((void *)v5 + 1) >> 41;
    if (v6 && self->_classInfosCount > v6) {
      id v7 = self->_classInfos[v6];
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = [(VMUObjectIdentifier *)self->_objectIdentifier labelForMemory:[(VMUKernelCoreMemoryScanner *)self contentForNode:v3] length:(*((void *)v5 + 1) >> 5) & 0xFFFFFFFFFLL remoteAddress:v5->var0 classInfo:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)shortLabelForNode:(unsigned int)a3
{
  uint64_t v3 = [(VMUKernelCoreMemoryScanner *)self labelForNode:*(void *)&a3];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = shortenString(v3);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)contentForNode:(unsigned int)a3
{
  if (self->_blocksCount <= a3) {
    return 0;
  }
  uint64_t result = 0;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  BOOL v8 = var7 >= var6;
  unint64_t v9 = var7 - var6;
  if (!v8) {
    return result;
  }
  unint64_t var0 = self->_blocks[a3].var0;
  if (var0 - var6 >= v9) {
    return result;
  }
  BOOL v12 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v13 = var0 >> *MEMORY[0x1E4F14AF8];
  if (v13)
  {
    var3 = (unsigned int *)regionMap->var3;
    unint64_t v15 = var0 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*var3 <= (v15 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v15 & 0x3FFFFFF) >> 3) + 4) >> (v15 & 7)) & 1) == 0)
      {
        return 0;
      }
      v15 >>= 26;
    }
    while (v15);
  }
  unint64_t v16 = (char *)regionMap + 4 * (v13 & 0x7FFFF);
  int v19 = *((_DWORD *)v16 + 16);
  unint64_t v18 = v16 + 64;
  int v17 = v19;
  unint64_t var4 = regionMap->var4;
  if (v19)
  {
    int v21 = &var4[(unint64_t)(v17 - 1)];
    if (var0 - *((void *)v21->var0 + 1) < *((void *)v21->var0 + 2)) {
      goto LABEL_12;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    return 0;
  }
  unint64_t v44 = regionMap->var4;
  while (1)
  {
    unint64_t v45 = var5 >> 1;
    int v21 = &v44[var5 >> 1];
    if (*((void *)v21->var0 + 1) <= var0) {
      break;
    }
LABEL_29:
    BOOL v8 = var5 >= 2;
    unint64_t var5 = v45;
    if (!v8) {
      return 0;
    }
  }
  if (*((void *)v21->var0 + 2) + *((void *)v21->var0 + 1) <= var0)
  {
    unint64_t v44 = v21 + 1;
    unint64_t v45 = --var5 >> 1;
    goto LABEL_29;
  }
  int v51 = [v21->var0 isSpecialPhysFootprintRegion];
  uint64_t result = 0;
  if (v51) {
    unint64_t v52 = 0;
  }
  else {
    unint64_t v52 = (unint64_t)v21;
  }
  if ((v51 & 1) == 0)
  {
    if ((*(unsigned char *)(*(void *)v52 + 132) & 1) == 0) {
      goto LABEL_76;
    }
    uint64_t v53 = (id *)(v52 + 64);
    unint64_t v54 = regionMap->var5 - ((uint64_t)(v52 + 64 - (unint64_t)regionMap->var4) >> 6);
    if (!v54) {
      goto LABEL_73;
    }
    while (1)
    {
      unint64_t v55 = v54 >> 1;
      uint64_t v56 = &v53[8 * (v54 >> 1)];
      if (*((void *)*v56 + 1) <= var0)
      {
        if (*((void *)*v56 + 2) + *((void *)*v56 + 1) > var0)
        {
          if ([*v56 isSpecialPhysFootprintRegion]) {
            unint64_t v54 = 0;
          }
          else {
            unint64_t v54 = (unint64_t)v56;
          }
LABEL_73:
          if (v54) {
            unint64_t v52 = v54;
          }
          int v21 = (_VMURegionNode *)v52;
LABEL_76:
          *unint64_t v18 = ((v52 - (unint64_t)var4) >> 6) + 1;
LABEL_12:
          uint64_t v22 = a3;
          BOOL v23 = &self->_blocks[a3];
          unint64_t v24 = ((*((void *)v23 + 1) >> 5) & 0xFFFFFFFFFLL) + v23->var0;
          if (*((void *)v21->var0 + 2) + *((void *)v21->var0 + 1) >= v24)
          {
            memoryCache = self->_memoryCache;
            regions = self->_regions;
            unsigned int regionsCount = self->_regionsCount;
            uint64_t v42 = self->_task;
            unsigned int v49 = memoryCache;
            unint64_t v29 = v49;
            if (!v21->var7)
            {
              if ((*((unsigned char *)v21->var0 + 132) & 2) == 0) {
                [(VMUTaskMemoryCache *)v49 taskIsTranslated];
              }
              v82[0] = 0;
              v86[0] = 0;
              int v63 = [(VMUTaskMemoryCache *)v29 mapAddress:*((void *)v21->var0 + 1) size:*((void *)v21->var0 + 2) returnedAddress:v82 returnedSize:v86];
              if (v63)
              {
                if ((*((_DWORD *)v21->var0 + 13) & 3u) - 1 >= 2)
                {
                  int v64 = v63;
                  BOOL v65 = task_exists(v42);
                  if (v21 != &regions[(unint64_t)(regionsCount - 1)] && v65)
                  {
                    uint64_t v80 = (FILE *)*MEMORY[0x1E4F143C8];
                    uint64_t v78 = [v21->var0 address];
                    uint64_t v66 = *((unsigned int *)v21->var0 + 6);
                    unint64_t v77 = (&vm_prot_strings_0)[v66];
                    uint64_t v67 = v22;
                    uint64_t v68 = *((void *)v21->var0 + 2) + *((void *)v21->var0 + 1);
                    VMURegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v21->var0 + 104), *((unsigned __int8 *)v21->var0 + 50), v66, *((unsigned __int8 *)v21->var0 + 49));
                    unint64_t v69 = v42;
                    id v70 = objc_claimAutoreleasedReturnValue();
                    uint64_t v71 = (const char *)[v70 UTF8String];
                    uint64_t v72 = *((void *)v21->var0 + 2) >> *v12;
                    os_signpost_id_t v73 = "pages";
                    if (v72 == 1) {
                      os_signpost_id_t v73 = "page";
                    }
                    if (v21->var4 == v21->var5) {
                      unint64_t v74 = "";
                    }
                    else {
                      unint64_t v74 = " [root]";
                    }
                    uint64_t v76 = v68;
                    uint64_t v22 = v67;
                    fprintf(v80, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v78, v76, v77, v71, v72, v73, v74, v64);

                    uint64_t v42 = v69;
                  }
                }
              }
              else
              {
                unint64_t v75 = (void *)v82[0];
                v21->unint64_t var6 = v86[0];
                v21->unint64_t var7 = v75;
                v21->var8 = v21;
              }
            }
          }
          else
          {
            LODWORD(v25) = 1;
            do
            {
              unint64_t v26 = (char *)v21[(unint64_t)v25].var0 + 8;
              uint64_t v25 = (v25 + 1);
            }
            while (v26[1] + *v26 < v24);
            int v27 = self->_memoryCache;
            uint64_t v79 = self->_task;
            unint64_t v28 = v27;
            unint64_t v29 = v28;
            uint64_t v30 = 0;
            if (v25)
            {
              uint64_t v31 = v25;
              uint64_t v32 = v21;
              do
              {
                BOOL v33 = v32->var0;
                ++v32;
                v30 += v33[2];
                --v31;
              }
              while (v31);
            }
            v86[0] = 0;
            unint64_t v81 = 0;
            uint64_t v34 = [(VMUTaskMemoryCache *)v28 findMappedAddress:*((void *)v21->var0 + 1) size:v30];
            if (v34)
            {
              unint64_t var1 = v34->var1;
              unint64_t v36 = *((void *)v21->var0 + 1) - v34->var0;
              v86[0] = v34->var2 + v36;
              unint64_t v81 = var1 - v36;
              goto LABEL_20;
            }
            if (v25)
            {
              unint64_t v58 = 0;
              do
              {
                int v59 = v29;
                id v60 = v59;
                if (v21[v58 / 0x40].var7)
                {
                  if (&v21[v58 / 0x40] == v21[v58 / 0x40].var8)
                  {
                    v82[0] = MEMORY[0x1E4F143A8];
                    v82[1] = 3221225472;
                    v82[2] = ___unmapRegion_block_invoke_0;
                    v82[3] = &unk_1E5D235B0;
                    uint64_t v83 = v59;
                    int v84 = &v21[v58 / 0x40];
                    uint64_t v85 = v21;
                    uint64_t v62 = (void (**)(void))MEMORY[0x1AD0DA230](v82);
                    v62[2]();
                  }
                  else
                  {
                    os_signpost_id_t v61 = &v21[v58 / 0x40];
                    v61->unint64_t var6 = 0;
                    v61->unint64_t var7 = 0;
                    v61->var8 = 0;
                  }
                }

                v58 += 64;
              }
              while ((unint64_t)v25 << 6 != v58);
            }
            if ([(VMUTaskMemoryCache *)v29 mapAddress:*((void *)v21->var0 + 1) size:v30 returnedAddress:v86 returnedSize:&v81])
            {
              if (task_exists(v79)) {
                fprintf((FILE *)*MEMORY[0x1E4F143C8], "Failed to map remote region at [%#llx-%#llx]\n", *((void *)v21->var0 + 1), *((void *)v21->var0 + 1) + v30);
              }
            }
            else
            {
LABEL_20:
              if (v25)
              {
                unint64_t v37 = 0;
                unint64_t v38 = v81;
                do
                {
                  unint64_t v39 = &v21[v37 / 0x40];
                  v39->var8 = v21;
                  v39->unint64_t var6 = v38;
                  uint64_t v40 = v86[0];
                  v39->unint64_t var7 = (void *)v86[0];
                  uint64_t v41 = (uint64_t)v21[v37 / 0x40].var0 + 8;
                  v86[0] = *((void *)v21[v37 / 0x40].var0 + 2) + v40;
                  unint64_t v38 = v81 - *(void *)(v41 + 8);
                  unint64_t v81 = v38;
                  v37 += 64;
                }
                while ((unint64_t)v25 << 6 != v37);
              }
            }
            uint64_t v42 = v79;
          }

          unint64_t v50 = (char *)v21->var7;
          if (v50) {
            return &v50[self->_blocks[v22].var0 - *((void *)v21->var0 + 1)];
          }
          return 0;
        }
        uint64_t v53 = v56 + 8;
        unint64_t v55 = --v54 >> 1;
      }
      BOOL v57 = v54 > 1;
      unint64_t v54 = v55;
      if (!v57)
      {
        unint64_t v54 = 0;
        goto LABEL_73;
      }
    }
  }
  return result;
}

- (unsigned)mallocNodeCount
{
  uint64_t blocksCount = self->_blocksCount;
  if (!blocksCount) {
    return 0;
  }
  unsigned int result = 0;
  uint64_t v5 = (uint64_t *)self->_blocks + 1;
  do
  {
    uint64_t v6 = *v5;
    v5 += 2;
    if ((v6 & 7) == 1) {
      ++result;
    }
    --blocksCount;
  }
  while (blocksCount);
  return result;
}

- (id)classInfoForObjectAtAddress:(unint64_t)a3
{
  id v4 = 0;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v8 = var7 - var6;
  BOOL v9 = var7 < var6;
  if (a3 - var6 >= v8 || v9) {
    goto LABEL_35;
  }
  unint64_t v11 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v12 = a3 >> *MEMORY[0x1E4F14AF8];
  if (v12)
  {
    var3 = regionMap->var3;
    unint64_t v14 = a3 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*var3 <= (v14 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
      {
        goto LABEL_34;
      }
      v14 >>= 26;
    }
    while (v14);
  }
  unint64_t v15 = (char *)regionMap + 4 * (v12 & 0x7FFFF);
  int v18 = *((_DWORD *)v15 + 16);
  int v17 = v15 + 64;
  int v16 = v18;
  unint64_t var4 = regionMap->var4;
  if (v18)
  {
    int v20 = &var4[(unint64_t)(v16 - 1)];
    if (a3 - *((void *)v20->var0 + 1) < *((void *)v20->var0 + 2)) {
      goto LABEL_10;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    goto LABEL_34;
  }
  unint64_t v38 = regionMap->var4;
  while (1)
  {
    unint64_t v39 = var5 >> 1;
    int v20 = &v38[var5 >> 1];
    if (*((void *)v20->var0 + 1) <= a3) {
      break;
    }
LABEL_33:
    BOOL v35 = var5 >= 2;
    unint64_t var5 = v39;
    if (!v35) {
      goto LABEL_34;
    }
  }
  if (*((void *)v20->var0 + 2) + *((void *)v20->var0 + 1) <= a3)
  {
    unint64_t v38 = v20 + 1;
    unint64_t v39 = --var5 >> 1;
    goto LABEL_33;
  }
  int v41 = [v20->var0 isSpecialPhysFootprintRegion];
  id v4 = 0;
  if (v41) {
    unint64_t v42 = 0;
  }
  else {
    unint64_t v42 = (unint64_t)v20;
  }
  if (v41) {
    goto LABEL_35;
  }
  if ((*(unsigned char *)(*(void *)v42 + 132) & 1) == 0) {
    goto LABEL_63;
  }
  unint64_t v43 = (id *)(v42 + 64);
  unint64_t v44 = regionMap->var5 - ((uint64_t)(v42 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v44) {
    goto LABEL_60;
  }
  while (2)
  {
    unint64_t v45 = v44 >> 1;
    unint64_t v46 = &v43[8 * (v44 >> 1)];
    if (*((void *)*v46 + 1) > a3)
    {
LABEL_47:
      BOOL v47 = v44 > 1;
      unint64_t v44 = v45;
      if (!v47)
      {
        unint64_t v44 = 0;
        goto LABEL_60;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v46 + 2) + *((void *)*v46 + 1) <= a3)
  {
    unint64_t v43 = v46 + 8;
    unint64_t v45 = --v44 >> 1;
    goto LABEL_47;
  }
  if ([*v46 isSpecialPhysFootprintRegion]) {
    unint64_t v44 = 0;
  }
  else {
    unint64_t v44 = (unint64_t)v46;
  }
LABEL_60:
  if (v44) {
    unint64_t v42 = v44;
  }
  int v20 = (_VMURegionNode *)v42;
LABEL_63:
  *int v17 = ((v42 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  unsigned int v21 = v20->var3;
  if (!v21) {
    goto LABEL_34;
  }
  unint64_t var1 = v20->var1;
  unint64_t var0 = regionMap->var0;
  uint64_t var2 = v20->var2;
  uint64_t v25 = &regionMap->var0[var2];
  if (var1)
  {
    if (v25->var0 <= a3)
    {
      unint64_t v26 = &var0[v21 - 1 + var2];
      if (((*((void *)v26 + 1) >> 5) & 0xFFFFFFFFFLL) + v26->var0 > a3)
      {
        id v4 = 0;
        int v27 = &var1[(a3 - (v25->var0 & -*MEMORY[0x1E4F14B00])) >> *v11];
        uint64_t v28 = *v27;
        p_unint64_t var0 = &var0[v28].var0;
        if (*p_var0 > a3) {
          goto LABEL_35;
        }
        uint64_t v30 = v27[1];
        if (v30 < regionMap->var1 && (uint64_t v31 = &var0[v30].var0, v32 = *v31, *v31 <= a3))
        {
LABEL_49:
          unint64_t v48 = v31[1];
          if ((v48 & 7) - 2 >= 3)
          {
            unint64_t v49 = a3 - v32;
            unint64_t v50 = regionMap->var2;
            if (v49 < v50 || ((v48 >> 5) & 0xFFFFFFFFFLL) - v49 <= v50)
            {
              unint64_t v51 = (char *)v31 - (char *)var0;
              if (self->_blocksCount > (v51 >> 4))
              {
                blocks = self->_blocks;
                unint64_t v53 = *((void *)&blocks[(v51 >> 4)] + 1);
                if ((v53 & 7) == 1)
                {
                  unint64_t v54 = v53 >> 41;
                  if (v53 >> 41 && self->_classInfosCount > v54)
                  {
                    id v4 = self->_classInfos[v54];
                  }
                  else
                  {
                    -[VMUObjectIdentifier classInfoForObjectWithRange:](self->_objectIdentifier, "classInfoForObjectWithRange:", blocks[(v51 >> 4)].var0, (v53 >> 5) & 0xFFFFFFFFFLL);
                    id v4 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  goto LABEL_35;
                }
              }
            }
          }
        }
        else
        {
          unsigned int v33 = v30 - v28;
          if (v33)
          {
            do
            {
              uint64_t v34 = v33 >> 1;
              uint64_t v31 = &p_var0[2 * v34];
              unint64_t v32 = *v31;
              if (*v31 <= a3)
              {
                if (((p_var0[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
                  goto LABEL_49;
                }
                p_unint64_t var0 = v31 + 2;
                LODWORD(v34) = --v33 >> 1;
              }
              id v4 = 0;
              BOOL v35 = v33 >= 2;
              unsigned int v33 = v34;
            }
            while (v35);
            goto LABEL_35;
          }
        }
      }
    }
LABEL_34:
    id v4 = 0;
    goto LABEL_35;
  }
  do
  {
    uint64_t v36 = v21 >> 1;
    uint64_t v31 = &v25[v36].var0;
    unint64_t v32 = *v31;
    if (*v31 <= a3)
    {
      if (((*((void *)&v25[v36] + 1) >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
        goto LABEL_49;
      }
      uint64_t v25 = (_VMUBlockNode *)(v31 + 2);
      LODWORD(v36) = --v21 >> 1;
    }
    id v4 = 0;
    BOOL v35 = v21 >= 2;
    unsigned int v21 = v36;
  }
  while (v35);
LABEL_35:

  return v4;
}

- (BOOL)addressIsInDataSegment:(unint64_t)a3
{
  return a3 - self->_dataSegmentsRangeInSharedCache.location < self->_dataSegmentsRangeInSharedCache.length
      || a3 - self->_dataSegmentsRangeOutsideSharedCache.location < self->_dataSegmentsRangeOutsideSharedCache.length
      && -[VMURangeArray indexForLocation:](self->_dataSegmentsRangeArrayOutsideSharedCache, "indexForLocation:") != 0x7FFFFFFFFFFFFFFFLL;
}

- (unsigned)enumerateObjectsWithBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v14 = 0;
    if (self->_blocksCount)
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      do
      {
        id v7 = &self->_blocks[v5];
        unint64_t v8 = *((void *)v7 + 1);
        if ((v8 & 7) == 1) {
          uint64_t v9 = *(uint64_t *)((char *)self->_classInfos + ((v8 >> 38) & 0x3FFFFF8));
        }
        else {
          uint64_t v9 = 0;
        }
        unint64_t v10 = (void (*)(void *, unint64_t, void *, char *))v4[2];
        v13[0] = v7->var0;
        v13[1] = ((v8 & 7) << 60) | (v8 >> 5) & 0xFFFFFFFFFLL;
        v13[2] = v9;
        v10(v4, v6++, v13, &v14);
        ++v5;
      }
      while (v6 < self->_blocksCount && v14 == 0);
    }
    else
    {
      LODWORD(v6) = 0;
    }
  }
  else
  {
    LODWORD(v6) = self->_blocksCount;
  }

  return v6;
}

- (unsigned)enumerateMarkedObjects:(void *)a3 withBlock:(id)a4
{
  unint64_t v6 = a4;
  if (a3)
  {
    unsigned __int8 v20 = 0;
    unint64_t blocksCount = self->_blocksCount;
    if (blocksCount)
    {
      uint64_t v8 = 0;
      int v9 = 0;
      unint64_t v10 = 0;
      unsigned int v11 = 0;
      while (1)
      {
        if (v10 >= *(unsigned int *)a3
          || ((*((unsigned __int8 *)a3 + (v10 >> 3) + 4) >> (v10 & 7)) & 1) == 0)
        {
          int v15 = 0;
          goto LABEL_13;
        }
        unint64_t v12 = &self->_blocks[v8];
        unint64_t v13 = *((void *)v12 + 1);
        if ((v13 & 7) == 1) {
          break;
        }
        uint64_t v14 = 0;
        if (v6) {
          goto LABEL_11;
        }
LABEL_12:
        ++v11;
        int v15 = v9;
LABEL_13:
        if (++v10 < blocksCount)
        {
          ++v8;
          if (!v15) {
            continue;
          }
        }
        goto LABEL_17;
      }
      uint64_t v14 = *(uint64_t *)((char *)self->_classInfos + ((v13 >> 38) & 0x3FFFFF8));
      if (!v6) {
        goto LABEL_12;
      }
LABEL_11:
      unint64_t var0 = v12->var0;
      int v17 = (void (*)(void *, unint64_t, void *, unsigned __int8 *))v6[2];
      v19[0] = var0;
      v19[1] = ((v13 & 7) << 60) | (v13 >> 5) & 0xFFFFFFFFFLL;
      v19[2] = v14;
      v17(v6, v10, v19, &v20);
      unint64_t blocksCount = self->_blocksCount;
      int v9 = v20;
      goto LABEL_12;
    }
  }
  unsigned int v11 = 0;
LABEL_17:

  return v11;
}

- (unsigned)enumerateRegionsWithBlock:(id)a3
{
  char v9 = 0;
  if (self->_regionsCount)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      (*((void (**)(id, id, char *))a3 + 2))(a3, self->_regions[v5].var0, &v9);
      ++v6;
      ++v5;
    }
    while (v6 < self->_regionsCount && v9 == 0);
  }
  else
  {
    LODWORD(v6) = 0;
  }
  return v6;
}

- (unsigned)enumerateReferencesWithBlock:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__VMUKernelCoreMemoryScanner_enumerateReferencesWithBlock___block_invoke;
  v7[3] = &unk_1E5D23438;
  char v9 = v15;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  unint64_t v10 = &v11;
  [(VMUKernelCoreMemoryScanner *)self scanNodesWithReferenceRecorder:v7];
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);

  return self;
}

uint64_t __59__VMUKernelCoreMemoryScanner_enumerateReferencesWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    unint64_t v6 = (void *)result;
    id v7 = *(void **)(result + 32);
    if (v7)
    {
      [v7 nodeDetails:a2];
      id v8 = (void *)v6[4];
      if (v8) {
        [v8 nodeDetails:a5];
      }
    }
    unsigned int result = (*(uint64_t (**)(void))(v6[5] + 16))();
    ++*(_DWORD *)(*(void *)(v6[7] + 8) + 24);
  }
  return result;
}

- (unsigned)nodeForAddress:(unint64_t)a3
{
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v6 = var7 - var6;
  BOOL v7 = var7 < var6;
  LODWORD(self) = -1;
  if (a3 - var6 >= v6 || v7) {
    return self;
  }
  char v9 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v10 = a3 >> *MEMORY[0x1E4F14AF8];
  if (v10)
  {
    var3 = regionMap->var3;
    unint64_t v12 = a3 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*var3 <= (v12 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v12 & 0x3FFFFFF) >> 3) + 4) >> (v12 & 7)) & 1) == 0)
      {
        goto LABEL_39;
      }
      v12 >>= 26;
    }
    while (v12);
  }
  uint64_t v13 = (char *)regionMap + 4 * (v10 & 0x7FFFF);
  int v16 = *((_DWORD *)v13 + 16);
  int v15 = v13 + 64;
  int v14 = v16;
  unint64_t var4 = regionMap->var4;
  if (v16)
  {
    int v18 = &var4[(unint64_t)(v14 - 1)];
    if (a3 - *((void *)v18->var0 + 1) < *((void *)v18->var0 + 2)) {
      goto LABEL_10;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    goto LABEL_39;
  }
  uint64_t v36 = regionMap->var4;
  while (1)
  {
    unint64_t v37 = var5 >> 1;
    int v18 = &v36[var5 >> 1];
    if (*((void *)v18->var0 + 1) <= a3) {
      break;
    }
LABEL_33:
    BOOL v33 = var5 >= 2;
    unint64_t var5 = v37;
    if (!v33) {
      goto LABEL_39;
    }
  }
  if (*((void *)v18->var0 + 2) + *((void *)v18->var0 + 1) <= a3)
  {
    uint64_t v36 = v18 + 1;
    unint64_t v37 = --var5 >> 1;
    goto LABEL_33;
  }
  int v38 = [v18->var0 isSpecialPhysFootprintRegion];
  if (v38) {
    unint64_t v39 = 0;
  }
  else {
    unint64_t v39 = (unint64_t)v18;
  }
  if (v38) {
    goto LABEL_39;
  }
  if ((*(unsigned char *)(*(void *)v39 + 132) & 1) == 0) {
    goto LABEL_55;
  }
  uint64_t v40 = (id *)(v39 + 64);
  unint64_t v41 = regionMap->var5 - ((uint64_t)(v39 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v41) {
    goto LABEL_52;
  }
  while (2)
  {
    unint64_t v42 = v41 >> 1;
    unint64_t v43 = &v40[8 * (v41 >> 1)];
    if (*((void *)*v43 + 1) > a3)
    {
LABEL_46:
      BOOL v44 = v41 > 1;
      unint64_t v41 = v42;
      if (!v44)
      {
        unint64_t v41 = 0;
        goto LABEL_52;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v43 + 2) + *((void *)*v43 + 1) <= a3)
  {
    uint64_t v40 = v43 + 8;
    unint64_t v42 = --v41 >> 1;
    goto LABEL_46;
  }
  if ([*v43 isSpecialPhysFootprintRegion]) {
    unint64_t v41 = 0;
  }
  else {
    unint64_t v41 = (unint64_t)v43;
  }
LABEL_52:
  if (v41) {
    unint64_t v39 = v41;
  }
  int v18 = (_VMURegionNode *)v39;
LABEL_55:
  *int v15 = ((v39 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  unsigned int v19 = v18->var3;
  if (!v19) {
    goto LABEL_39;
  }
  unint64_t var1 = v18->var1;
  unint64_t var0 = regionMap->var0;
  uint64_t var2 = v18->var2;
  BOOL v23 = &regionMap->var0[var2];
  if (var1)
  {
    unint64_t v24 = v23->var0;
    if (v24 <= a3)
    {
      uint64_t v25 = &var0[v19 - 1 + var2];
      if (((*((void *)v25 + 1) >> 5) & 0xFFFFFFFFFLL) + v25->var0 > a3)
      {
        unint64_t v26 = &var1[(a3 - (v24 & -*MEMORY[0x1E4F14B00])) >> *v9];
        uint64_t v27 = *v26;
        p_unint64_t var0 = &var0[v27].var0;
        if (*p_var0 <= a3)
        {
          uint64_t v29 = v26[1];
          if (v29 < regionMap->var1)
          {
            uint64_t v30 = &var0[v29].var0;
            if (*v30 <= a3) {
              return (unint64_t)((char *)v30 - (char *)var0) >> 4;
            }
          }
          unsigned int v31 = v29 - v27;
          if (v31)
          {
            do
            {
              uint64_t v32 = v31 >> 1;
              uint64_t v30 = &p_var0[2 * v32];
              if (*v30 <= a3)
              {
                if (((p_var0[2 * v32 + 1] >> 5) & 0xFFFFFFFFFLL) + *v30 > a3) {
                  return (unint64_t)((char *)v30 - (char *)var0) >> 4;
                }
                p_unint64_t var0 = v30 + 2;
                LODWORD(v32) = --v31 >> 1;
              }
              LODWORD(self) = -1;
              BOOL v33 = v31 >= 2;
              unsigned int v31 = v32;
            }
            while (v33);
            return self;
          }
        }
      }
    }
LABEL_39:
    LODWORD(self) = -1;
    return self;
  }
  do
  {
    uint64_t v34 = v19 >> 1;
    uint64_t v30 = &v23[v34].var0;
    if (*v30 <= a3)
    {
      if (((*((void *)&v23[v34] + 1) >> 5) & 0xFFFFFFFFFLL) + *v30 > a3) {
        return (unint64_t)((char *)v30 - (char *)var0) >> 4;
      }
      BOOL v23 = (_VMUBlockNode *)(v30 + 2);
      LODWORD(v34) = --v19 >> 1;
    }
    LODWORD(self) = -1;
    BOOL v33 = v19 >= 2;
    unsigned int v19 = v34;
  }
  while (v33);
  return self;
}

- (unsigned)_nodeForAddress:(unint64_t)a3 checkMaxInteriorOffset:(BOOL)a4
{
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v7 = var7 - var6;
  BOOL v8 = var7 < var6;
  LODWORD(self) = -1;
  if (a3 - var6 >= v7 || v8) {
    return self;
  }
  BOOL v9 = a4;
  uint64_t v11 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v12 = a3 >> *MEMORY[0x1E4F14AF8];
  if (v12)
  {
    var3 = regionMap->var3;
    unint64_t v14 = a3 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*var3 <= (v14 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v14 & 0x3FFFFFF) >> 3) + 4) >> (v14 & 7)) & 1) == 0)
      {
        goto LABEL_39;
      }
      v14 >>= 26;
    }
    while (v14);
  }
  int v15 = (char *)regionMap + 4 * (v12 & 0x7FFFF);
  int v18 = *((_DWORD *)v15 + 16);
  int v17 = v15 + 64;
  int v16 = v18;
  unint64_t var4 = regionMap->var4;
  if (v18)
  {
    unsigned __int8 v20 = &var4[(unint64_t)(v16 - 1)];
    if (a3 - *((void *)v20->var0 + 1) < *((void *)v20->var0 + 2)) {
      goto LABEL_10;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    goto LABEL_39;
  }
  int v38 = regionMap->var4;
  while (1)
  {
    unint64_t v39 = var5 >> 1;
    unsigned __int8 v20 = &v38[var5 >> 1];
    if (*((void *)v20->var0 + 1) <= a3) {
      break;
    }
LABEL_33:
    BOOL v35 = var5 >= 2;
    unint64_t var5 = v39;
    if (!v35) {
      goto LABEL_39;
    }
  }
  if (*((void *)v20->var0 + 2) + *((void *)v20->var0 + 1) <= a3)
  {
    int v38 = v20 + 1;
    unint64_t v39 = --var5 >> 1;
    goto LABEL_33;
  }
  int v40 = [v20->var0 isSpecialPhysFootprintRegion];
  if (v40) {
    unint64_t v41 = 0;
  }
  else {
    unint64_t v41 = (unint64_t)v20;
  }
  if (v40) {
    goto LABEL_39;
  }
  if ((*(unsigned char *)(*(void *)v41 + 132) & 1) == 0) {
    goto LABEL_59;
  }
  unint64_t v42 = (id *)(v41 + 64);
  unint64_t v43 = regionMap->var5 - ((uint64_t)(v41 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v43) {
    goto LABEL_56;
  }
  while (2)
  {
    unint64_t v44 = v43 >> 1;
    unint64_t v45 = &v42[8 * (v43 >> 1)];
    if (*((void *)*v45 + 1) > a3)
    {
LABEL_46:
      BOOL v46 = v43 > 1;
      unint64_t v43 = v44;
      if (!v46)
      {
        unint64_t v43 = 0;
        goto LABEL_56;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v45 + 2) + *((void *)*v45 + 1) <= a3)
  {
    unint64_t v42 = v45 + 8;
    unint64_t v44 = --v43 >> 1;
    goto LABEL_46;
  }
  if ([*v45 isSpecialPhysFootprintRegion]) {
    unint64_t v43 = 0;
  }
  else {
    unint64_t v43 = (unint64_t)v45;
  }
LABEL_56:
  if (v43) {
    unint64_t v41 = v43;
  }
  unsigned __int8 v20 = (_VMURegionNode *)v41;
LABEL_59:
  *int v17 = ((v41 - (unint64_t)var4) >> 6) + 1;
LABEL_10:
  unsigned int v21 = v20->var3;
  if (!v21) {
    goto LABEL_39;
  }
  unint64_t var1 = v20->var1;
  unint64_t var0 = regionMap->var0;
  uint64_t var2 = v20->var2;
  uint64_t v25 = &regionMap->var0[var2];
  if (var1)
  {
    if (v25->var0 <= a3)
    {
      unint64_t v26 = &var0[v21 - 1 + var2];
      if (((*((void *)v26 + 1) >> 5) & 0xFFFFFFFFFLL) + v26->var0 > a3)
      {
        uint64_t v27 = &var1[(a3 - (v25->var0 & -*MEMORY[0x1E4F14B00])) >> *v11];
        uint64_t v28 = *v27;
        p_unint64_t var0 = &var0[v28].var0;
        if (*p_var0 <= a3)
        {
          uint64_t v30 = v27[1];
          if (v30 < regionMap->var1 && (unsigned int v31 = &var0[v30].var0, v32 = *v31, *v31 <= a3))
          {
LABEL_48:
            if (!v9) {
              return (unint64_t)((char *)v31 - (char *)var0) >> 4;
            }
            unint64_t v47 = v31[1];
            if ((v47 & 7) - 2 >= 3)
            {
              unint64_t v48 = a3 - v32;
              unint64_t v49 = regionMap->var2;
              if (v48 < v49 || ((v47 >> 5) & 0xFFFFFFFFFLL) - v48 <= v49) {
                return (unint64_t)((char *)v31 - (char *)var0) >> 4;
              }
            }
          }
          else
          {
            unsigned int v33 = v30 - v28;
            if (v33)
            {
              do
              {
                uint64_t v34 = v33 >> 1;
                unsigned int v31 = &p_var0[2 * v34];
                unint64_t v32 = *v31;
                if (*v31 <= a3)
                {
                  if (((p_var0[2 * v34 + 1] >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
                    goto LABEL_48;
                  }
                  p_unint64_t var0 = v31 + 2;
                  LODWORD(v34) = --v33 >> 1;
                }
                LODWORD(self) = -1;
                BOOL v35 = v33 >= 2;
                unsigned int v33 = v34;
              }
              while (v35);
              return self;
            }
          }
        }
      }
    }
LABEL_39:
    LODWORD(self) = -1;
    return self;
  }
  do
  {
    uint64_t v36 = v21 >> 1;
    unsigned int v31 = &v25[v36].var0;
    unint64_t v32 = *v31;
    if (*v31 <= a3)
    {
      if (((*((void *)&v25[v36] + 1) >> 5) & 0xFFFFFFFFFLL) + v32 > a3) {
        goto LABEL_48;
      }
      uint64_t v25 = (_VMUBlockNode *)(v31 + 2);
      LODWORD(v36) = --v21 >> 1;
    }
    LODWORD(self) = -1;
    BOOL v35 = v21 >= 2;
    unsigned int v21 = v36;
  }
  while (v35);
  return self;
}

- (void)copyUserMarked
{
  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (!userMarkedAbandoned) {
    return 0;
  }
  size_t v3 = ((*userMarkedAbandoned + 7) >> 3) + 4;
  id v4 = malloc_type_malloc(v3, 0x37C10B9BuLL);
  memcpy(v4, userMarkedAbandoned, v3);
  return v4;
}

- (BOOL)is64bit
{
  return 1;
}

- (BOOL)isTranslatedByRosetta
{
  return [(VMUTask *)self->_task isTranslated];
}

- (unsigned)vmPageSize
{
  return *MEMORY[0x1E4F14B00];
}

- (unsigned)kernelPageSize
{
  return *MEMORY[0x1E4F14AE8];
}

- (unsigned)nodeNamespaceSize
{
  return self->_blocksCount;
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v7 = [(VMUKernelCoreMemoryScanner *)self ledger];
  BOOL v8 = [v7 objectForKeyedSubscript:v6];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (a4) {
      *a4 = 1;
    }
    unint64_t v9 = [v8 unsignedLongLongValue];
  }
  else
  {
    unint64_t v9 = 0;
    if (a4) {
      *a4 = 0;
    }
  }

  return v9;
}

- (void)setNodeScanningLogger:(id)a3
{
  if (self->_nodeLogger != a3)
  {
    id v4 = (void *)MEMORY[0x1AD0DA230](a3, a2);
    id nodeLogger = self->_nodeLogger;
    self->_id nodeLogger = v4;
  }
}

- (void)setReferenceScanningLogger:(id)a3
{
  if (self->_referenceLogger != a3)
  {
    id v4 = (void *)MEMORY[0x1AD0DA230](a3, a2);
    id referenceLogger = self->_referenceLogger;
    self->_id referenceLogger = v4;
  }
}

- (int)pid
{
  return self->_pid;
}

- (VMUTaskMemoryCache)memoryCache
{
  return self->_memoryCache;
}

- (VMUObjectIdentifier)objectIdentifier
{
  return self->_objectIdentifier;
}

- (unint64_t)maxInteriorOffset
{
  return self->_maxInteriorOffset;
}

- (void)setMaxInteriorOffset:(unint64_t)a3
{
  self->_unint64_t maxInteriorOffset = a3;
}

- (BOOL)exactScanningEnabled
{
  return self->_exactScanningEnabled;
}

- (void)setExactScanningEnabled:(BOOL)a3
{
  self->_exactScanningEnabled = a3;
}

- (unsigned)nodeCount
{
  return self->_blocksCount;
}

- (unsigned)zoneCount
{
  return self->_zonesCount;
}

- (unsigned)regionCount
{
  return self->_regionsCount;
}

- (unsigned)scanningMask
{
  return self->_scanningMask;
}

- (void)setScanningMask:(unsigned int)a3
{
  self->_scanningMasunint64_t k = a3;
}

- (BOOL)abandonedMarkingEnabled
{
  return self->_abandonedMarkingEnabled;
}

- (void)setAbandonedMarkingEnabled:(BOOL)a3
{
  self->_abandonedMarkingEnabled = a3;
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (NSString)processDescriptionString
{
  return self->_processDescriptionString;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)binaryImagesDescription
{
  return self->_binaryImagesDescription;
}

- (unint64_t)physicalFootprint
{
  return self->_physicalFootprint;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprintPeak;
}

- (NSDictionary)ledger
{
  return self->_ledger;
}

- (unsigned)idleExitStatus
{
  return self->_idleExitStatus;
}

- (BOOL)recordRuntimeMetadataChunkInfo
{
  return self->_recordRuntimeMetadataChunkInfo;
}

- (void)setRecordRuntimeMetadataChunkInfo:(BOOL)a3
{
  self->_recordRuntimeMetadataChunkInfo = a3;
}

- (unint64_t)suspendTimeContinuous
{
  return self->_suspendTimeContinuous;
}

- (VMUScanOverlay)scanOverlay
{
  return self->_scanOverlay;
}

- (_VMURegionNode)regions
{
  return self->_regions;
}

- (_VMUBlockNode)blocks
{
  return *(_VMUBlockNode **)(v0 + 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOverlay, 0);
  objc_storeStrong((id *)&self->_nonScannableZoneNames, 0);
  objc_storeStrong((id *)&self->_nonscannableGlobalSymbolsArray, 0);
  objc_storeStrong((id *)&self->_srcAddressToExtraAutoreleaseCountDict, 0);
  objc_storeStrong((id *)&self->_variantCachesByIsaIndex, 0);
  objc_storeStrong((id *)&self->_processObjectGraph, 0);
  objc_storeStrong(&self->_nodeLogger, 0);
  objc_storeStrong(&self->_referenceLogger, 0);
  objc_storeStrong((id *)&self->_ledger, 0);
  objc_storeStrong((id *)&self->_binaryImagesDescription, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_processDescriptionString, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_debugTimer, 0);
  objc_storeStrong((id *)&self->_classStructureAddressToDestinationMapTable, 0);
  objc_storeStrong((id *)&self->_mappedFileNameToLengthDict, 0);
  objc_storeStrong((id *)&self->_classInfoIndexer, 0);
  objc_storeStrong((id *)&self->_threadStates, 0);
  objc_storeStrong((id *)&self->_addressToRuntimeMetadataChunkInfoDict, 0);
  objc_storeStrong((id *)&self->_dataSegmentsRangeArrayOutsideSharedCache, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_stackRanges, 0);
  objc_storeStrong(&self->_regionInfoBlock, 0);
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_memoryCache, 0);
  objc_storeStrong((id *)&self->_suspendDate, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

- (void)initWithVMUTask:options:.cold.1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error: core's pointer size doesn't match the host system, cannot continue", v0, 2u);
}

- (void)initWithVMUTask:(void *)a3 options:.cold.2(unint64_t a1, uint8_t *buf, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F14B00] >> 10;
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1 >> 10;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error: core's page size doesn't match the host system (%u KB vs %u KB), cannot continue", buf, 0xEu);
}

@end