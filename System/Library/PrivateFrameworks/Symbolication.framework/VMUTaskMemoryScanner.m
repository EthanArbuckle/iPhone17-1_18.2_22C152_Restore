@interface VMUTaskMemoryScanner
+ (void)initialize;
- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUTaskMemoryScanner *)self;
- (BOOL)_callRemoteMallocEnumerators:(unsigned int)a3 error:(id *)a4 block:(id)a5;
- (BOOL)_suspend;
- (BOOL)abandonedMarkingEnabled;
- (BOOL)addAllNodesFromTaskWithError:(id *)a3;
- (BOOL)addMallocNodesFromTaskWithError:(id *)a3;
- (BOOL)addRootNodesFromTaskWithError:(id *)a3;
- (BOOL)addressIsInDataSegment:(unint64_t)a3;
- (BOOL)doesTargetProcessHaveObjCPatches;
- (BOOL)exactScanningEnabled;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (BOOL)hasLabelsForNodes;
- (BOOL)is64bit;
- (BOOL)isTranslatedByRosetta;
- (BOOL)mallocEnumerationShouldFail;
- (BOOL)recordRuntimeMetadataChunkInfo;
- (BOOL)showRawClassNames;
- (NSDictionary)ledger;
- (NSString)binaryImagesDescription;
- (NSString)executablePath;
- (NSString)processDescriptionString;
- (NSString)processName;
- (VMUClassInfoMap)realizedClasses;
- (VMUDebugTimer)debugTimer;
- (VMUObjectIdentifier)objectIdentifier;
- (VMUScanOverlay)scanOverlay;
- (VMUTaskMemoryCache)memoryCache;
- (VMUTaskMemoryScanner)initWithSelfTaskAndOptions:(unint64_t)a3;
- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3;
- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3 options:(unint64_t)a4;
- (VMUTaskMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4;
- (_VMUBlockNode)blocks;
- (_VMURegionNode)regions;
- (_VMURegionNode)validateAddressRangeForSwiftRemoteMirror:(_VMURange)a3 allowUnusedSplitLibs:(BOOL)a4;
- (id)_cachedVariantForGenericInfo:(id)a3 variantKey:(unint64_t)a4;
- (id)_initWithTask:(unsigned int)a3 options:(unint64_t)a4;
- (id)_readonlyRegionRanges;
- (id)_recursivelyIdentifySwiftAsyncTaskSlabs:(unint64_t)a3 containerRange:(_VMURange)a4 remoteBlock:(unint64_t)a5 mappedBlock:(unint64_t)a6 asyncTaskSlabMetadataIsa:(unint64_t)a7 nestingLevel:(unsigned int)a8;
- (id)classInfoForObjectAtAddress:(unint64_t)a3;
- (id)initFullyWithTask:(unsigned int)a3;
- (id)initFullyWithTask:(unsigned int)a3 error:(id *)a4;
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
- (uint64_t)_shouldScanVMregion:(uint64_t)a1;
- (uint64_t)getCachedScanInfoForClassWithIsa:(void *)a3 classInfo:(unsigned char *)a4 returnedShouldApplySwiftPointerMaskingToIsa:;
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
- (unsigned)task;
- (unsigned)vmPageSize;
- (unsigned)zoneCount;
- (void)_addSpecialNodesFromTask;
- (void)_addThreadNodesFromTask;
- (void)_buildRegionFirstBlockIndexOnPageArrays;
- (void)_destroyLinearClassInfos;
- (void)_findMarkedAbandonedBlocks;
- (void)_findSwiftClassesInExclaveCore;
- (void)_fixupBlockIsas;
- (void)_identifyAttributeGraphAllocations;
- (void)_identifyNonObjectsPointedToByTypedIvars;
- (void)_identifyNonObjectsPointingToSwiftMetadata;
- (void)_identifyNonObjectsUsingStackBacktrace;
- (void)_identifyObjCClassStructureBlocks;
- (void)_identifySwiftAsyncTaskSlabs;
- (void)_identifySwiftTypeNameCache;
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
- (void)detachFromTask;
- (void)mapDyldSharedCacheFromTargetWithRegions:(id)a3;
- (void)printRuntimeMetadataInfo;
- (void)refineTypesWithOverlay:(id)a3;
- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(unsigned int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:;
- (void)scanNodesWithReferenceRecorder:(id)a3;
- (void)setAbandonedMarkingEnabled:(BOOL)a3;
- (void)setClassStructureFieldScanValueAtSourceAddress:(void *)a3 toCorrectedAddress:(void *)a4;
- (void)setDebugTimer:(id)a3;
- (void)setExactScanningEnabled:(BOOL)a3;
- (void)setMallocEnumerationShouldFail:(BOOL)a3;
- (void)setMaxInteriorOffset:(unint64_t)a3;
- (void)setNodeScanningLogger:(id)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setRecordRuntimeMetadataChunkInfo:(BOOL)a3;
- (void)setReferenceScanningLogger:(id)a3;
- (void)setScanningMask:(unsigned int)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)unmapAllRegions;
@end

@implementation VMUTaskMemoryScanner

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
    s_enumeratorDebugging = v6;
    pthread_t v7 = 0;
    if (pthread_create(&v7, 0, (void *(__cdecl *)(void *))_determine_pthread_offsets, (void *)0x123456789ABCDEF1))
    {
      fwrite("couldn't create new pthread for determine_pthread_offsets\n", 0x3AuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
      exit(1);
    }
    pthread_join(v7, 0);
  }
}

- (unsigned)task
{
  return [(VMUTask *)self->_task taskPort];
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
      memoryCache = self->_memoryCache;
      pthread_t v7 = self->_objectIdentifier;
      v8 = memoryCache;
      v9 = v8;
      if (regions[v3].var7)
      {
        if (&regions[v3] == regions[v3].var8)
        {
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = ___unmapRegion_block_invoke;
          v12[3] = &unk_1E5D23460;
          v13 = v8;
          v15 = &regions[v3];
          v14 = v7;
          v16 = regions;
          v11 = (void (**)(void))MEMORY[0x1AD0DA230](v12);
          v11[2]();
        }
        else
        {
          v10 = &regions[v3];
          v10->var6 = 0;
          v10->var7 = 0;
          v10->var8 = 0;
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

- (VMUTaskMemoryScanner)initWithVMUTask:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v128.receiver = self;
  v128.super_class = (Class)VMUTaskMemoryScanner;
  v8 = [(VMUTaskMemoryScanner *)&v128 init];
  if (v8)
  {
    v9 = v8;
    v10 = +[VMUDebugTimer sharedTimerIfCreated];
    objc_storeStrong((id *)&v9->_task, a3);
    v9->_pid = [(VMUTask *)v9->_task pid];
    if ([(VMUTask *)v9->_task pid] < 0)
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      NSLog(&cfstr_InvalidTaskPor.isa, v14);

      goto LABEL_8;
    }
    if ([v7 taskType] == 2)
    {
      NSLog(&cfstr_Vmutaskmemorys.isa);
LABEL_8:

LABEL_9:
      v11 = 0;
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
    if (v10)
    {
      if ([v10 signpostID])
      {
        v16 = [v10 logHandle];
        uint64_t v17 = [v10 signpostID];
        if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v18 = v17;
          if (os_signpost_enabled(v16))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v16, OS_SIGNPOST_INTERVAL_END, v18, "initMemoryScanner", "", (uint8_t *)buf, 2u);
          }
        }
      }
      [v10 endEvent:"initMemoryScanner"];
      [v10 startWithCategory:"initMemoryScanner" message:"building VMUProcessDescription"];
      v19 = [v10 logHandle];
      uint64_t v20 = [v10 signpostID];
      if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v21 = v20;
        if (os_signpost_enabled(v19))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "initMemoryScanner", "building VMUProcessDescription", (uint8_t *)buf, 2u);
        }
      }
    }
    else
    {
      [0 endEvent:"initMemoryScanner"];
      [0 startWithCategory:"initMemoryScanner" message:"building VMUProcessDescription"];
    }
    v22 = [(VMUTask *)v9->_task processDescription];
    if ((int)[v22 pid] >= 1)
    {
      uint64_t v23 = [v22 description];
      processDescriptionString = v9->_processDescriptionString;
      v9->_processDescriptionString = (NSString *)v23;

      uint64_t v25 = [v22 date];
      suspendDate = v9->_suspendDate;
      v9->_suspendDate = (NSDate *)v25;

      uint64_t v27 = [v22 processName];
      processName = v9->_processName;
      v9->_processName = (NSString *)v27;

      if ((a4 & 0x8000) != 0)
      {
        uint64_t v29 = [v22 binaryImagesDescription];
        binaryImagesDescription = v9->_binaryImagesDescription;
        v9->_binaryImagesDescription = (NSString *)v29;
      }
      uint64_t v31 = [v22 executablePath];
      executablePath = v9->_executablePath;
      v9->_executablePath = (NSString *)v31;

      v9->_physicalFootprint = [v22 physicalFootprint];
      v9->_physicalFootprintPeak = [v22 physicalFootprintPeak];
      v9->_idleExitStatus = [v22 idleExitStatus];
    }
    if (v10 && [v10 signpostID])
    {
      v33 = [v10 logHandle];
      uint64_t v34 = [v10 signpostID];
      if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v35 = v34;
        if (os_signpost_enabled(v33))
        {
          LOWORD(buf[0]) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v33, OS_SIGNPOST_INTERVAL_END, v35, "initMemoryScanner", "", (uint8_t *)buf, 2u);
        }
      }
    }
    [v10 endEvent:"initMemoryScanner"];
    if (![(VMUTaskMemoryScanner *)v9 _suspend])
    {

      goto LABEL_9;
    }
    p_task = &v9->_task;
    mach_get_times();
    v9->_maxInteriorOffset = *MEMORY[0x1E4F14B00];
    v9->_scanningMask = VMUScanningMaskForOwningReferences();
    v9->_exactScanningEnabled = 1;
    v9->_abandonedMarkingEnabled = 1;
    uint64_t v36 = objc_opt_new();
    variantCachesByIsaIndex = v9->_variantCachesByIsaIndex;
    v9->_variantCachesByIsaIndex = (NSMutableDictionary *)v36;

    uint64_t v38 = objc_opt_new();
    srcAddressToExtraAutoreleaseCountDict = v9->_srcAddressToExtraAutoreleaseCountDict;
    v9->_srcAddressToExtraAutoreleaseCountDict = (NSMutableDictionary *)v38;

    uint64_t v40 = objc_opt_new();
    mappedFileNameToLengthDict = v9->_mappedFileNameToLengthDict;
    v9->_mappedFileNameToLengthDict = (NSMutableDictionary *)v40;

    unint64_t v42 = VMUGetFlagsForAllVMRegionStatistics() | a4 | 0x180;
    v43 = [[VMUVMRegionIdentifier alloc] initWithVMUTask:v9->_task options:v42];
    regionIdentifier = v9->_regionIdentifier;
    v9->_regionIdentifier = v43;

    v45 = [(VMUVMRegionIdentifier *)v9->_regionIdentifier regions];
    unsigned int v46 = [v45 count];
    v9->_unint64_t regionsCount = v46;
    v118 = v22;
    if (v46)
    {
      unint64_t v114 = v42;
      v47 = (_VMURegionNode *)malloc_type_calloc(v46, 0x40uLL, 0x10B0040310C8A7FuLL);
      v9->_regions = v47;
      v115 = v45;
      id v116 = v7;
      if (v9->_regionsCount)
      {
        uint64_t v48 = 0;
        for (unint64_t i = 0; i < regionsCount; ++i)
        {
          id v50 = (id)[v45 objectAtIndexedSubscript:i];
          regions = v9->_regions;
          regions[v48].var0 = v50;
          unint64_t regionsCount = v9->_regionsCount;
          ++v48;
        }
      }
      else
      {
        regions = v47;
        LODWORD(regionsCount) = 0;
      }
      v54 = malloc_type_calloc(1uLL, 0x200040uLL, 0x518382DFuLL);
      v54[6] = -1;
      v55 = malloc_type_calloc(1uLL, 0x800004uLL, 0xFF42C4F3uLL);
      _DWORD *v55 = 0x4000000;
      v54[3] = v55;
      v54[4] = regions;
      *((_DWORD *)v54 + 10) = regionsCount;
      if (regionsCount)
      {
        uint64_t v56 = 0;
        v57 = (_DWORD *)MEMORY[0x1E4F14AF8];
        uint64_t v58 = regionsCount;
        do
        {
          p_var0 = &regions[v56].var0;
          if (([*p_var0 isSpecialPhysFootprintRegion] & 1) == 0)
          {
            v60 = (unint64_t *)((char *)*p_var0 + 8);
            unint64_t v61 = *v60;
            unint64_t v62 = *((void *)*p_var0 + 2) + *v60;
            unint64_t v63 = v54[6];
            unint64_t v64 = v54[7];
            if (v63 >= v61) {
              unint64_t v63 = v61;
            }
            if (v64 <= v62) {
              unint64_t v64 = v62;
            }
            v54[6] = v63;
            v54[7] = v64;
            unint64_t v65 = v61 >> *v57;
            if (v65)
            {
              unint64_t v66 = (~*MEMORY[0x1E4F14AF0] & (*MEMORY[0x1E4F14AF0] + v62)) >> *v57;
              do
              {
                if (v65 + 1 > v66) {
                  unint64_t v67 = v65 + 1;
                }
                else {
                  unint64_t v67 = v66;
                }
                v68 = (unsigned int *)v54[3];
                unsigned int v69 = v65 & 0x3FFFFFF;
                unsigned int v70 = *v68;
                if (*v68 > (v65 & 0x3FFFFFF))
                {
                  unsigned int v71 = ((v67 - v65) & 0x3FFFFFF) + v69;
                  if (v70 < v71) {
                    unsigned int v71 = *v68;
                  }
                  unsigned int v72 = (v69 + 7) & 0x7FFFFF8;
                  if (v72 >= v71) {
                    unsigned int v72 = v71;
                  }
                  if (v69 < v72)
                  {
                    do
                    {
                      if (v70 > v69) {
                        *((unsigned char *)v68 + (v69 >> 3) + 4) |= 1 << (v69 & 7);
                      }
                      ++v69;
                    }
                    while (v72 != v69);
                    unsigned int v69 = v72;
                  }
                  unsigned int v73 = v71 & 0x7FFFFF8;
                  if ((v71 & 0x7FFFFF8) <= v69) {
                    unsigned int v73 = v69;
                  }
                  if (v71 > v73)
                  {
                    unsigned int v74 = v71 - 1;
                    do
                    {
                      if (v70 > v74) {
                        *((unsigned char *)v68 + (v74 >> 3) + 4) |= 1 << (v74 & 7);
                      }
                      unsigned int v75 = v74 - 1;
                    }
                    while (v74-- > v73);
                    unsigned int v71 = v75 + 1;
                  }
                  memset((char *)v68 + (v69 >> 3) + 4, 255, (v71 - v69) >> 3);
                }
                v65 >>= 26;
                unint64_t v66 = v67 >> 26;
              }
              while (v65);
            }
          }
          ++v56;
        }
        while (v56 != v58);
      }
      v9->_regionMap = (_VMURegionMap *)v54;
      uint64_t v77 = [(VMUTask *)v9->_task memoryCache];
      memoryCache = v9->_memoryCache;
      v9->_memoryCache = (VMUTaskMemoryCache *)v77;

      if (v9->_memoryCache)
      {
        [(VMUTaskMemoryScanner *)v9 unmapAllRegions];
        v45 = v115;
        [(VMUTaskMemoryScanner *)v9 mapDyldSharedCacheFromTargetWithRegions:v115];
        regionMap = v9->_regionMap;
        buf[0] = 0;
        buf[1] = buf;
        buf[2] = 0x3032000000;
        buf[3] = __Block_byref_object_copy_;
        buf[4] = __Block_byref_object_dispose_;
        id v127 = 0;
        v125[0] = MEMORY[0x1E4F143A8];
        v125[1] = 3221225472;
        v125[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke;
        v125[3] = &unk_1E5D22D68;
        v125[4] = buf;
        v125[5] = regionMap;
        uint64_t v80 = MEMORY[0x1AD0DA230](v125);
        id regionInfoBlock = v9->_regionInfoBlock;
        v9->_id regionInfoBlock = (id)v80;

        [(VMUTaskMemoryCache *)v9->_memoryCache setRegionInfoBlock:v9->_regionInfoBlock];
        id v7 = v116;
        v82 = objc_alloc_init(VMURangeArray);
        dataSegmentsRangeArrayOutsideSharedCache = v9->_dataSegmentsRangeArrayOutsideSharedCache;
        v9->_dataSegmentsRangeArrayOutsideSharedCache = v82;

        uint64_t v84 = [(VMUVMRegionIdentifier *)v9->_regionIdentifier taskThreadStates];
        threadStates = v9->_threadStates;
        v9->_threadStates = (VMUTaskThreadStates *)v84;

        v9->_threadsCount = [(VMUTaskThreadStates *)v9->_threadStates threadCount];
        if (v10 && [v10 signpostID])
        {
          v86 = [v10 logHandle];
          os_signpost_id_t v87 = [v10 signpostID];
          if (v87 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
          {
            *(_WORD *)v120 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v86, OS_SIGNPOST_INTERVAL_END, v87, "initMemoryScanner", "", v120, 2u);
          }
        }
        [v10 endEvent:"initMemoryScanner"];
        [v10 startWithCategory:"initMemoryScanner" message:"get malloc zones array"];
        if (v10)
        {
          v88 = [v10 logHandle];
          os_signpost_id_t v89 = [v10 signpostID];
          if (v89 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
          {
            *(_WORD *)v120 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v88, OS_SIGNPOST_INTERVAL_BEGIN, v89, "initMemoryScanner", "get malloc zones array", v120, 2u);
          }
        }
        uint64_t v90 = objc_opt_new();
        zoneNames = v9->_zoneNames;
        v9->_zoneNames = (NSMutableArray *)v90;

        task = v9->_task;
        v123[0] = MEMORY[0x1E4F143A8];
        v123[1] = 3221225472;
        v123[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_48;
        v123[3] = &unk_1E5D22D90;
        v93 = v9;
        v124 = v93;
        VMUTask_foreach_malloc_zone(task, v123);
        if (v10 && [v10 signpostID])
        {
          v94 = [v10 logHandle];
          os_signpost_id_t v95 = [v10 signpostID];
          if (v95 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
          {
            *(_WORD *)v120 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v94, OS_SIGNPOST_INTERVAL_END, v95, "initMemoryScanner", "", v120, 2u);
          }
        }
        [v10 endEvent:"initMemoryScanner"];
        size_t v96 = *((unsigned int *)v93 + 54);
        if (v96 && v9->_regions)
        {
          id v97 = v93[26];
          __compar[0] = MEMORY[0x1E4F143A8];
          __compar[1] = 3221225472;
          __compar[2] = __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_2;
          __compar[3] = &unk_1E5D22DD8;
          v122 = (id *)&__block_literal_global;
          mergesort_b(v97, v96, 0x18uLL, __compar);
          [(NSMutableArray *)v9->_zoneNames sortUsingComparator:&__block_literal_global];
          v98 = -[VMUObjectIdentifier initWithVMUTask:symbolicator:scanner:]([VMUObjectIdentifier alloc], "initWithVMUTask:symbolicator:scanner:", *p_task, 0, 0, v93);
          id v99 = v93[8];
          v93[8] = v98;

          id v100 = v93[8];
          if (!v100) {
            goto LABEL_120;
          }
          uint64_t v101 = [v100 realizedClasses];
          id v102 = v93[34];
          v93[34] = (id)v101;

          if (v10 && [v10 signpostID])
          {
            v103 = [v10 logHandle];
            os_signpost_id_t v104 = [v10 signpostID];
            if (v104 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v103))
            {
              *(_WORD *)v120 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v103, OS_SIGNPOST_INTERVAL_END, v104, "initMemoryScanner", "", v120, 2u);
            }
          }
          [v10 endEvent:"initMemoryScanner"];
          [v10 startWithCategory:"initMemoryScanner" message:"setting up VMUScanOverlay"];
          if (v10)
          {
            v105 = [v10 logHandle];
            os_signpost_id_t v106 = [v10 signpostID];
            if (v106 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v105))
            {
              *(_WORD *)v120 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v105, OS_SIGNPOST_INTERVAL_BEGIN, v106, "initMemoryScanner", "setting up VMUScanOverlay", v120, 2u);
            }
          }
          v107 = [[VMUScanOverlay alloc] initWithScanner:v93];
          id v108 = v93[69];
          v93[69] = v107;

          [v93 refineTypesWithOverlay:v93[69]];
          if (v10 && [v10 signpostID])
          {
            v109 = [v10 logHandle];
            os_signpost_id_t v110 = [v10 signpostID];
            if (v110 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
            {
              *(_WORD *)v120 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v109, OS_SIGNPOST_INTERVAL_END, v110, "initMemoryScanner", "", v120, 2u);
            }
          }
          [v10 endEvent:"initMemoryScanner"];
          v93[66] = (id)[v93[8] addressOfSymbol:"___CFPasteboardReservedBase" inLibrary:"CoreFoundation"];
          *((unsigned char *)v93 + 192) = [v93 doesTargetProcessHaveObjCPatches];
          v93[58] = (id)v114;
          *(void *)v120 = 0;
          int v119 = 0;
          v111 = *p_task;
          uint64_t v112 = [v93[8] symbolicator];
          if (task_get_malloc_zones_array_address_and_count(v111, v112, v113, v120, &v119, 0))
          {
            int v53 = 0;
            if (v119) {
              v93[67] = *(id *)v120;
            }
          }
          else
          {
LABEL_120:

            v93 = 0;
            int v53 = 1;
          }
          v11 = (VMUTaskMemoryScanner *)v93;
          v93 = v122;
        }
        else
        {
          v11 = 0;
          int v53 = 1;
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {

        v11 = 0;
        int v53 = 1;
        v45 = v115;
        id v7 = v116;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VMUTaskMemoryScanner initWithVMUTask:options:]();
      }

      v11 = 0;
      int v53 = 1;
    }

    if (v53) {
      goto LABEL_10;
    }
  }
  else
  {
    v11 = 0;
  }
  v11 = v11;
  v12 = v11;
LABEL_11:

  return v12;
}

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v4 + 4 * ((a2 >> *MEMORY[0x1E4F14AF8]) & 0x7FFFF);
  int v8 = *(_DWORD *)(v5 + 64);
  id v7 = (_DWORD *)(v5 + 64);
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
        v19 = &v16[8 * (v17 >> 1)];
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
  *id v7 = (((unint64_t)v14 - v9) >> 6) + 1;
  v10 = *v14;
LABEL_25:
  uint64_t v20 = [v10 descriptionWithOptions:513 maximumLength:0];
  uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  id v23 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v23 UTF8String];
}

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(v8 + 220);
  if (v9 <= *(_DWORD *)(v8 + 216))
  {
    int v10 = 2 * v9;
    if ((2 * v9) <= 8) {
      int v10 = 8;
    }
    *(_DWORD *)(v8 + 220) = v10;
    while (1)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      unsigned int v12 = *(_DWORD *)(v11 + 220);
      if (v12 >= *(_DWORD *)(v11 + 216)) {
        break;
      }
      *(_DWORD *)(v11 + 220) = 2 * v12;
    }
    *(void *)(*(void *)(a1 + 32) + 208) = malloc_type_realloc(*(void **)(v11 + 208), 24 * v12, 0x10A00404568A766uLL);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v13 + 208);
    if (!v14)
    {
      NSLog(&cfstr_OutOfMemoryFai.isa, "_zones", v9, *(unsigned int *)(v13 + 220));
      abort();
    }
    bzero((void *)(v14 + 24 * v9), 24 * (*(_DWORD *)(v13 + 220) - v9));
  }
  if (!v7) {
    id v7 = [[NSString alloc] initWithFormat:@"UnknownZone (%#llx)", a2];
  }
  [*(id *)(*(void *)(a1 + 32) + 144) addObject:v7];
  BOOL v15 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 208) + 24 * *(unsigned int *)(*(void *)(a1 + 32) + 216));
  uint64_t *v15 = a2;
  v15[1] = (uint64_t)v7;
  v15[2] = a3;
  ++*(_DWORD *)(*(void *)(a1 + 32) + 216);

  return 0;
}

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_58(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 rangeOfString:@"DefaultMallocZone"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v5 rangeOfString:@"DefaultMallocZone"] == 0x7FFFFFFFFFFFFFFFLL) {
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

uint64_t __48__VMUTaskMemoryScanner_initWithVMUTask_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  uint64_t v6 = [[VMUTask alloc] initWithTask:*(void *)&a3];
  id v7 = [(VMUTaskMemoryScanner *)self initWithVMUTask:v6 options:a4];

  return v7;
}

- (VMUTaskMemoryScanner)initWithSelfTaskAndOptions:(unint64_t)a3
{
  return (VMUTaskMemoryScanner *)[(VMUTaskMemoryScanner *)self _initWithTask:*MEMORY[0x1E4F14960] options:a3];
}

- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  if (VMUTaskIsSelf())
  {
    NSLog(&cfstr_IllegalAttempt.isa);
    id v7 = 0;
  }
  else
  {
    self = (VMUTaskMemoryScanner *)[(VMUTaskMemoryScanner *)self _initWithTask:v5 options:a4];
    id v7 = self;
  }

  return v7;
}

- (id)initFullyWithTask:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = [(VMUTaskMemoryScanner *)self initWithTask:*(void *)&a3 options:0];
  BOOL v6 = [(VMUTaskMemoryScanner *)v5 addAllNodesFromTaskWithError:a4];
  id v7 = 0;
  if (v6) {
    id v7 = v5;
  }

  return v7;
}

- (id)initFullyWithTask:(unsigned int)a3
{
  return [(VMUTaskMemoryScanner *)self initFullyWithTask:*(void *)&a3 error:0];
}

- (VMUTaskMemoryScanner)initWithTask:(unsigned int)a3
{
  return [(VMUTaskMemoryScanner *)self initWithTask:*(void *)&a3 options:0];
}

- (BOOL)doesTargetProcessHaveObjCPatches
{
  unint64_t v3 = [(VMUObjectIdentifier *)self->_objectIdentifier addressOfSymbol:"_dyld_process_has_objc_patches" inLibrary:"libdyld.dylib"];
  if (v3)
  {
    unint64_t v4 = v3;
    uint64_t v5 = [(VMUObjectIdentifier *)self->_objectIdentifier memoryReader];
    BOOL v6 = (unsigned char *)v5[2](v5, v4, 1);

    if (v6) {
      LOBYTE(v3) = *v6 != 0;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)mapDyldSharedCacheFromTargetWithRegions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    int v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([v12 isSubmap:v15] == NO)
        {
          if (-[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", *(void *)(v12 + 8), *(void *)(v12 + 16)))
          {
            int v13 = *(_DWORD *)(v12 + 24);
            if (v13 == v9)
            {
              uint64_t v14 = *(void *)(v12 + 8);
            }
            else
            {
              if (v7 && v8)
              {
                [(VMUTaskMemoryCache *)self->_memoryCache mapAddress:v7 size:v8];
                int v13 = *(_DWORD *)(v12 + 24);
              }
              uint64_t v14 = *(void *)(v12 + 8);
              uint64_t v7 = v14;
              int v9 = v13;
            }
            uint64_t v8 = v14 - v7 + *(void *)(v12 + 16);
          }
          else if (v7)
          {
            goto LABEL_19;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
LABEL_19:

    if (v7 && v8) {
      [(VMUTaskMemoryCache *)self->_memoryCache mapAddress:v7 size:v8];
    }
  }
  else
  {
  }
}

- (BOOL)_suspend
{
  kern_return_t v4;
  mach_error_t v5;
  FILE *v6;
  char *v7;
  VMUTask *task;

  if ([(VMUTask *)self->_task isCore]) {
    goto LABEL_2;
  }
  unsigned int v3 = [(VMUTask *)self->_task taskPort];
  if (!v3) {
    return v3;
  }
  if ([(VMUTask *)self->_task taskPort] == -1)
  {
LABEL_10:
    LOBYTE(v3) = 0;
    return v3;
  }
  [(VMUTask *)self->_task taskPort];
  if ((VMUTaskIsSelf() & 1) == 0)
  {
    id v4 = task_suspend2([(VMUTask *)self->_task taskPort], &self->_suspensionToken);
    if (v4)
    {
      uint64_t v5 = v4;
      if (task_exists(self->_task))
      {
        uint64_t v6 = (FILE *)*MEMORY[0x1E4F143C8];
        uint64_t v7 = mach_error_string(v5);
        fprintf(v6, "Unable to suspend target task: %s (%d)\n", v7, v5);
      }
      task = self->_task;
      self->_task = 0;

      goto LABEL_10;
    }
  }
LABEL_2:
  LOBYTE(v3) = 1;
  return v3;
}

- (void)detachFromTask
{
  kern_return_t v3;
  mach_error_t v4;
  FILE *v5;
  char *v6;
  VMUTask *task;
  uint64_t vars8;

  if (![(VMUTask *)self->_task isCore])
  {
    if ([(VMUTask *)self->_task taskPort])
    {
      if ([(VMUTask *)self->_task taskPort] != -1)
      {
        [(VMUTask *)self->_task taskPort];
        if ((VMUTaskIsSelf() & 1) == 0)
        {
          unsigned int v3 = task_resume2(self->_suspensionToken);
          if (v3)
          {
            id v4 = v3;
            if (task_exists(self->_task))
            {
              uint64_t v5 = (FILE *)*MEMORY[0x1E4F143C8];
              uint64_t v6 = mach_error_string(v4);
              fprintf(v5, "Unable to resume target task: %s (%d)\n", v6, v4);
            }
          }
          task = self->_task;
          self->_task = 0;

          [(VMUTaskMemoryScanner *)self setNodeScanningLogger:0];
          [(VMUTaskMemoryScanner *)self setReferenceScanningLogger:0];
        }
      }
    }
  }
}

- (void)dealloc
{
  [(VMUTaskMemoryScanner *)self detachFromTask];
  blocks = self->_blocks;
  if (blocks && !self->_processObjectGraph)
  {
    free(blocks);
    self->_blocks = 0;
  }
  [(VMUTaskMemoryCache *)self->_memoryCache setRegionInfoBlock:0];
  if (self->_regionsCount)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      regions = self->_regions;
      memoryCache = self->_memoryCache;
      uint64_t v8 = self->_objectIdentifier;
      int v9 = memoryCache;
      uint64_t v10 = v9;
      if (regions[v4].var7)
      {
        if (&regions[v4] == regions[v4].var8)
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = ___unmapRegion_block_invoke;
          v21[3] = &unk_1E5D23460;
          v22 = v9;
          v24 = &regions[v4];
          id v23 = v8;
          uint64_t v25 = regions;
          uint64_t v12 = (void (**)(void))MEMORY[0x1AD0DA230](v21);
          v12[2]();
        }
        else
        {
          uint64_t v11 = &regions[v4];
          v11->var6 = 0;
          v11->var7 = 0;
          v11->var8 = 0;
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
  uint64_t v14 = self->_regions;
  if (v14)
  {
    free(v14);
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
  [(VMUTaskMemoryScanner *)self _destroyLinearClassInfos];
  v20.receiver = self;
  v20.super_class = (Class)VMUTaskMemoryScanner;
  [(VMUTaskMemoryScanner *)&v20 dealloc];
}

- (void)_withMemoryReaderBlock:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__VMUTaskMemoryScanner__withMemoryReaderBlock___block_invoke;
  v5[3] = &unk_1E5D22E48;
  v5[4] = self;
  id v6 = 0;
  unsigned int v3 = (void (**)(id, void *))a3;
  uint64_t v4 = (void *)MEMORY[0x1AD0DA230](v5);
  v3[2](v3, v4);
}

uint64_t __47__VMUTaskMemoryScanner__withMemoryReaderBlock___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 112);
  unint64_t v7 = *(void *)(v5 + 48);
  unint64_t v6 = *(void *)(v5 + 56);
  unint64_t v8 = v6 - v7;
  BOOL v9 = v6 < v7;
  if (a2 - v7 >= v8 || v9) {
    return result;
  }
  uint64_t v12 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v13 = a2 >> *MEMORY[0x1E4F14AF8];
  if (v13)
  {
    uint64_t v14 = *(unsigned int **)(v5 + 24);
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
  long long v18 = (_DWORD *)(v16 + 64);
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
      goto LABEL_79;
    }
    v54 = (id *)(v53 + 64);
    unint64_t v55 = *(unsigned int *)(v5 + 40) - ((uint64_t)(v53 + 64 - *(void *)(v5 + 32)) >> 6);
    if (!v55) {
      goto LABEL_76;
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
LABEL_76:
          if (v55) {
            unint64_t v53 = v55;
          }
          unint64_t v21 = v53;
LABEL_79:
          *long long v18 = ((v53 - v20) >> 6) + 1;
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
            v26 = *(void **)(a1 + 40);
            v28 = *(void **)(v25 + 56);
            uint64_t v27 = *(void **)(v25 + 64);
            id v29 = *(id *)(v25 + 8);
            id v82 = v27;
            id v83 = v28;
            uint64_t v84 = v26;
            uint64_t v30 = 0;
            if (v23)
            {
              uint64_t v31 = v23;
              v32 = (uint64_t *)v21;
              do
              {
                uint64_t v33 = *v32;
                v32 += 8;
                v30 += *(void *)(v33 + 16);
                --v31;
              }
              while (v31);
            }
            v92[0] = 0;
            uint64_t v86 = 0;
            uint64_t v34 = (void *)[v83 findMappedAddress:*(void *)(*(void *)v21 + 8) size:v30];
            if (v34)
            {
              uint64_t v35 = v34[1];
              uint64_t v36 = *(void *)(*(void *)v21 + 8) - *v34;
              v92[0] = v34[2] + v36;
              uint64_t v86 = v35 - v36;
              goto LABEL_19;
            }
            v81 = v29;
            if (v23)
            {
              uint64_t v72 = 0;
              do
              {
                id v73 = v82;
                id v74 = v83;
                unsigned int v75 = v84;
                if (*(void *)(v21 + v72 + 48))
                {
                  if (v21 + v72 == *(void *)(v21 + v72 + 56))
                  {
                    v87[0] = MEMORY[0x1E4F143A8];
                    v87[1] = 3221225472;
                    v87[2] = ___unmapRegion_block_invoke;
                    v87[3] = &unk_1E5D23460;
                    id v88 = v74;
                    uint64_t v90 = v21 + v72;
                    id v89 = v73;
                    unint64_t v91 = v21;
                    uint64_t v77 = (void (**)(void))MEMORY[0x1AD0DA230](v87);
                    v78 = v77;
                    if (v84) {
                      dispatch_async(v75, v77);
                    }
                    else {
                      v77[2](v77);
                    }
                  }
                  else
                  {
                    v76 = (void *)(v21 + v72);
                    v76[5] = 0;
                    v76[6] = 0;
                    v76[7] = 0;
                  }
                }

                v72 += 64;
              }
              while ((unint64_t)v23 << 6 != v72);
            }
            int v79 = [v83 mapAddress:*(void *)(*(void *)v21 + 8) size:v30 returnedAddress:v92 returnedSize:&v86];
            uint64_t v12 = (_DWORD *)MEMORY[0x1E4F14AF8];
            id v29 = v81;
            if (v79)
            {
              if (task_exists(v81)) {
                fprintf((FILE *)*MEMORY[0x1E4F143C8], "Failed to map remote region at [%#llx-%#llx]\n", *(void *)(*(void *)v21 + 8), *(void *)(*(void *)v21 + 8) + v30);
              }
            }
            else
            {
LABEL_19:
              if (v23)
              {
                uint64_t v37 = 0;
                uint64_t v38 = v86;
                do
                {
                  v39 = (void *)(v21 + v37);
                  v39[7] = v21;
                  v39[5] = v38;
                  uint64_t v40 = v92[0];
                  v39[6] = v92[0];
                  uint64_t v41 = *(void *)(v21 + v37) + 8;
                  v92[0] = *(void *)(*(void *)(v21 + v37) + 16) + v40;
                  uint64_t v38 = v86 - *(void *)(v41 + 8);
                  uint64_t v86 = v38;
                  v37 += 64;
                }
                while ((unint64_t)v23 << 6 != v37);
              }
            }
          }
          uint64_t v42 = *(void *)(a1 + 32);
          v43 = *(void **)(v42 + 56);
          uint64_t v44 = *(void *)(v42 + 96);
          int v45 = *(_DWORD *)(v42 + 104);
          id v46 = *(id *)(v42 + 8);
          id v47 = v43;
          if (*(void *)(v21 + 48))
          {
LABEL_24:

            return *(void *)(v21 + 48) + a2 - *(void *)(*(void *)v21 + 8);
          }
          if (![*(id *)v21 isSpecialPhysFootprintRegion])
          {
            v87[0] = 0;
            v92[0] = 0;
            int v59 = [v47 mapAddress:*(void *)(*(void *)v21 + 8) size:*(void *)(*(void *)v21 + 16) returnedAddress:v87 returnedSize:v92];
            if (!v59)
            {
              uint64_t v80 = v87[0];
              *(void *)(v21 + 40) = v92[0];
              *(void *)(v21 + 48) = v80;
              *(void *)(v21 + 56) = v21;
              goto LABEL_24;
            }
            if ((*(_DWORD *)(*(void *)v21 + 52) & 3u) - 1 >= 2)
            {
              int v60 = v59;
              BOOL v61 = task_exists(v46);
              if (v21 != v44 + ((unint64_t)(v45 - 1) << 6) && v61)
              {
                v85 = (FILE *)*MEMORY[0x1E4F143C8];
                uint64_t v63 = [*(id *)v21 address];
                uint64_t v64 = *(unsigned int *)(*(void *)v21 + 24);
                unint64_t v65 = vm_prot_strings[v64];
                uint64_t v66 = *(void *)(*(void *)v21 + 16) + *(void *)(*(void *)v21 + 8);
                VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(void *)v21 + 232), *(unsigned __int8 *)(*(void *)v21 + 104), *(unsigned __int8 *)(*(void *)v21 + 50), v64, *(unsigned __int8 *)(*(void *)v21 + 49));
                id v67 = objc_claimAutoreleasedReturnValue();
                v68 = (const char *)[v67 UTF8String];
                uint64_t v69 = *(void *)(*(void *)v21 + 16) >> *v12;
                unsigned int v70 = "pages";
                if (v69 == 1) {
                  unsigned int v70 = "page";
                }
                if (*(void *)(v21 + 24) == *(void *)(v21 + 32)) {
                  unsigned int v71 = "";
                }
                else {
                  unsigned int v71 = " [root]";
                }
                fprintf(v85, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v63, v66, v65, v68, v69, v70, v71, v60);
              }
            }
          }

          return 0;
        }
        v54 = v57 + 8;
        unint64_t v56 = --v55 >> 1;
      }
      BOOL v58 = v55 > 1;
      unint64_t v55 = v56;
      if (!v58)
      {
        unint64_t v55 = 0;
        goto LABEL_76;
      }
    }
  }
  return result;
}

- (BOOL)_callRemoteMallocEnumerators:(unsigned int)a3 error:(id *)a4 block:(id)a5
{
  id v8 = a5;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  unint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  if (self->_mallocEnumerationShouldFail && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Passing bad task peek function to malloc enumerators because VMUTaskMemoryScanner.mallocEnumerationShouldFail is YES", buf, 2u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke;
  v12[3] = &unk_1E5D22EC8;
  void v12[4] = self;
  id v9 = v8;
  unsigned int v15 = a3;
  id v13 = v9;
  uint64_t v14 = &v17;
  [(VMUTaskMemoryScanner *)self _withMemoryReaderBlock:v12];
  if (a4) {
    *a4 = (id) v18[5];
  }
  BOOL v10 = v18[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2;
  v7[3] = &unk_1E5D22EA0;
  uint64_t v4 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v5 = v4;
  int v10 = *(_DWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  uint64_t v9 = v6;
  _withPeekTransformerFunctionForMemoryReader(a2, v7);
}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2(uint64_t a1, uint64_t (*a2)())
{
  v22[1] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (uint64_t *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 544)) {
    a2 = failingPeekFunction;
  }
  if (*(_DWORD *)(v2 + 216))
  {
    uint64_t v6 = 0;
    for (unint64_t i = 0; i < *(unsigned int *)(v2 + 216); ++i)
    {
      if (*(void *)(*(void *)(v2 + 208) + v6 + 16))
      {
        get_local_zone_count();
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_3;
        v18[3] = &unk_1E5D22E78;
        id v19 = *(id *)(a1 + 40);
        int v20 = i;
        id v8 = (void *)MEMORY[0x1AD0DA230](v18);
        uint64_t v9 = (**(uint64_t (***)(uint64_t, void *, void, void, uint64_t (*)(), uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)))(*(void *)(*(void *)(a1 + 32) + 208) + v6 + 16))([*(id *)(*(void *)(a1 + 32) + 8) taskPort], v8, *(unsigned int *)(a1 + 56), *(void *)(*(void *)(*(void *)(a1 + 32) + 208) + v6), a2, _pointerRecorderBlockContextAdapter);
        unregister_new_local_zones();
        if (v9)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2_cold_1((uint64_t)v3, i, v9);
          }
          int v10 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v11 = (int)v9;
          uint64_t v21 = *MEMORY[0x1E4F28568];
          if (*(void *)(*(void *)(*(void *)(a1 + 32) + 208) + v6 + 8)) {
            uint64_t v12 = *(__CFString **)(*(void *)(*(void *)(a1 + 32) + 208) + v6 + 8);
          }
          else {
            uint64_t v12 = @"UNKNOWN";
          }
          id v13 = [NSString stringWithFormat:@"Malloc enumeration of zone \"%@\" failed to get full information about malloc metadata and/or allocations with the error \"%s (%d)\". It is likely that the target was suspended while malloc metadata was being modified.", v12, mach_error_string(v9), v9];
          v22[0] = v13;
          uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
          uint64_t v15 = [v10 errorWithDomain:@"Malloc enumeration" code:v11 userInfo:v14];
          uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v17 = *(void **)(v16 + 40);
          *(void *)(v16 + 40) = v15;

          return;
        }

        uint64_t v2 = *v3;
      }
      v6 += 24;
    }
  }
}

uint64_t __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), a2, a3, a4);
}

- (uint64_t)_shouldScanVMregion:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    if (_shouldScanVMregion__onceToken != -1) {
      dispatch_once(&_shouldScanVMregion__onceToken, &__block_literal_global_99);
    }
    if (*(void *)(a2 + 32) - *(void *)(a2 + 24) >= 8uLL)
    {
      uint64_t v4 = (id *)*(id *)a2;
      id v5 = v4;
      if (!_shouldScanVMregion__scanVMRegionWithUnknownPathsEnvVar
        && *((unsigned char *)v4 + 49)
        && ([v4 path],
            uint64_t v6 = objc_claimAutoreleasedReturnValue(),
            char v7 = [v6 hasPrefix:kVMUUnknownMappedFileNamePrefix[0]],
            v6,
            (v7 & 1) != 0)
        || (*((_DWORD *)v5 + 13) & 3) == 2)
      {
        uint64_t v2 = 0;
      }
      else
      {
        uint64_t v2 = [v5 protection] != 1
          || ([v5[4] isEqualToString:@"MALLOC metadata"] & 1) != 0
          || ([v5 isActivityTracing] & 1) != 0
          || [v5 address] == *(void *)(v2 + 536);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

char *__44__VMUTaskMemoryScanner__shouldScanVMregion___block_invoke()
{
  uint64_t result = getenv("SCAN_VM_REGIONS_WITH_UNKNOWN_PATHS");
  _shouldScanVMregion__scanVMRegionWithUnknownPathsEnvVar = (uint64_t)result;
  return result;
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
        uint64_t v6 = self->_scanCaches[i];
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
  id v8 = [NSNumber numberWithUnsignedInt:v6];
  uint64_t v9 = [(NSMutableDictionary *)variantCachesByIsaIndex objectForKeyedSubscript:v8];

  int v10 = [NSNumber numberWithUnsignedLongLong:a4];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  return v11;
}

- (void)_registerVariant:(id)a3 forGenericInfo:(id)a4 variantKey:(unint64_t)a5
{
  classInfoIndexer = self->_classInfoIndexer;
  id v9 = a3;
  uint64_t v10 = [(VMUClassInfoMap *)classInfoIndexer indexForClassInfo:a4];
  variantCachesByIsaIndex = self->_variantCachesByIsaIndex;
  uint64_t v12 = [NSNumber numberWithUnsignedInt:v10];
  id v16 = [(NSMutableDictionary *)variantCachesByIsaIndex objectForKeyedSubscript:v12];

  if (!v16)
  {
    id v16 = (id)objc_opt_new();
    id v13 = self->_variantCachesByIsaIndex;
    uint64_t v14 = [NSNumber numberWithUnsignedInt:v10];
    [(NSMutableDictionary *)v13 setObject:v16 forKeyedSubscript:v14];
  }
  uint64_t v15 = [NSNumber numberWithUnsignedLongLong:a5];
  [v16 setObject:v9 forKeyedSubscript:v15];
}

- (void)_updateLinearClassInfos
{
  [(VMUTaskMemoryScanner *)self _destroyLinearClassInfos];
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

- (void)_addSpecialNodesFromTask
{
  unsigned int blocksCount = self->_blocksCount;
  uint64_t blocksSize = self->_blocksSize;
  if (blocksSize <= blocksCount)
  {
    if ((2 * blocksSize) <= 0x40000) {
      int v6 = 0x40000;
    }
    else {
      int v6 = 2 * blocksSize;
    }
    do
    {
      unsigned int v7 = v6;
      v6 *= 2;
    }
    while (v7 < blocksCount);
    self->_uint64_t blocksSize = v7;
    blocks = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v7, 0x1000040451B5BE8uLL);
    self->_blocks = blocks;
    if (!blocks) {
      goto LABEL_41;
    }
    unsigned int blocksCount = self->_blocksCount;
  }
  else
  {
    blocks = self->_blocks;
  }
  unint64_t v8 = blocksCount;
  id v9 = &blocks[blocksCount];
  v9->var0 = v8;
  *((void *)v9 + 1) = 3;
  ++self->_blocksCount;
  unint64_t v10 = [(VMUObjectIdentifier *)self->_objectIdentifier ObjCclassCount];
  if (v10 + [(VMUObjectIdentifier *)self->_objectIdentifier SwiftClassCount])
  {
    if (_addSpecialNodesFromTask_onceToken != -1) {
      dispatch_once(&_addSpecialNodesFromTask_onceToken, &__block_literal_global_105);
    }
    unsigned int v11 = self->_blocksCount;
    uint64_t blocksSize = self->_blocksSize;
    if (blocksSize <= v11)
    {
      if ((2 * blocksSize) <= 0x40000) {
        int v13 = 0x40000;
      }
      else {
        int v13 = 2 * blocksSize;
      }
      do
      {
        unsigned int v14 = v13;
        v13 *= 2;
      }
      while (v14 < v11);
      self->_uint64_t blocksSize = v14;
      uint64_t v12 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v14, 0x1000040451B5BE8uLL);
      self->_blocks = v12;
      if (!v12) {
        goto LABEL_41;
      }
      unsigned int v11 = self->_blocksCount;
    }
    else
    {
      uint64_t v12 = self->_blocks;
    }
    unint64_t v15 = v11;
    id v16 = &v12[v11];
    uint64_t v17 = [(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:_addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo];
    v16->var0 = v15;
    *((void *)v16 + 1) = (v17 << 41) | 1;
    unsigned int v18 = self->_blocksCount;
    self->_autoreleasePoolBoundaryNode = v18;
    self->_unsigned int blocksCount = v18 + 1;
  }
  self->_webKitZoneIndex = -1;
  if (!getenv("SYMBOLICATION_DISABLE_WEBKIT_POINTER_PACKING_WORKAROUND") && self->_zonesCount)
  {
    unint64_t v19 = 0;
    uint64_t v20 = 8;
    do
    {
      id v21 = *(id *)((char *)&self->_zones->var0 + v20);
      id v22 = v21;
      if (v21 && [v21 hasPrefix:@"WebKit Malloc"]) {
        self->_webKitZoneIndex = v19;
      }

      ++v19;
      v20 += 24;
    }
    while (v19 < self->_zonesCount);
    if (self->_webKitZoneIndex != -1)
    {
      if (_addSpecialNodesFromTask_onceToken_114 != -1) {
        dispatch_once(&_addSpecialNodesFromTask_onceToken_114, &__block_literal_global_116);
      }
      unsigned int v23 = self->_blocksCount;
      uint64_t blocksSize = self->_blocksSize;
      if (blocksSize > v23)
      {
        v24 = self->_blocks;
LABEL_40:
        unint64_t v27 = v23;
        v28 = &v24[v23];
        uint64_t v29 = [(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:_addSpecialNodesFromTask_webKitMallocFakeRootClassInfo];
        v28->var0 = v27;
        *((void *)v28 + 1) = (v29 << 41) | 1;
        unsigned int v30 = self->_blocksCount;
        self->_webKitMallocFakeRootNode = v30;
        self->_unsigned int blocksCount = v30 + 1;
        return;
      }
      if ((2 * blocksSize) <= 0x40000) {
        int v25 = 0x40000;
      }
      else {
        int v25 = 2 * blocksSize;
      }
      do
      {
        unsigned int v26 = v25;
        v25 *= 2;
      }
      while (v26 < v23);
      self->_uint64_t blocksSize = v26;
      v24 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v26, 0x1000040451B5BE8uLL);
      self->_blocks = v24;
      if (v24)
      {
        unsigned int v23 = self->_blocksCount;
        goto LABEL_40;
      }
LABEL_41:
      NSLog(&cfstr_OutOfMemoryFai.isa, "_blocks", blocksSize, self->_blocksSize);
      abort();
    }
  }
}

void __48__VMUTaskMemoryScanner__addSpecialNodesFromTask__block_invoke()
{
  uint64_t v0 = +[VMUClassInfo classInfoWithClassName:kVMUAutoreleasePoolBoundaryClassName binaryPath:@"/usr/lib/libobjc.A.dylib" type:16];
  v1 = (void *)_addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo;
  _addSpecialNodesFromTask_autoreleasePoolBoundaryClassInfo = v0;
}

void __48__VMUTaskMemoryScanner__addSpecialNodesFromTask__block_invoke_2()
{
  uint64_t v0 = +[VMUClassInfo classInfoWithClassName:@"WebKit Malloc Fake Root" binaryPath:@"/System/Library/Frameworks/WebKit.framework/Versions/A/WebKit" type:16];
  v1 = (void *)_addSpecialNodesFromTask_webKitMallocFakeRootClassInfo;
  _addSpecialNodesFromTask_webKitMallocFakeRootClassInfo = v0;
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
  int v6 = [v4 path];
  if (!v6)
  {
LABEL_11:
    off_t st_size = 0;
    goto LABEL_16;
  }
  unsigned int v7 = v6;
  if (([v6 containsString:@"*"] & 1) != 0
    || ([v7 hasPrefix:@"/"] & 1) == 0)
  {
    unint64_t v8 = [(VMUTask *)self->_task memoryCache];
    int v9 = [v8 procRegionFileNameForAddress:*((void *)v4 + 1) buffer:v16 bufferSize:1024];

    if (v9 >= 1)
    {
      *((unsigned char *)&v16[0].st_dev + v9) = 0;
      uint64_t v10 = [NSString stringWithUTF8String:v16];

      unsigned int v7 = (void *)v10;
    }
  }
  unsigned int v11 = [(NSMutableDictionary *)self->_mappedFileNameToLengthDict objectForKeyedSubscript:v7];
  uint64_t v12 = v11;
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
      unsigned int v14 = [NSNumber numberWithUnsignedLongLong:v16[0].st_size];
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
  unint64_t v6 = [(VMUTaskMemoryScanner *)self _lengthOfMappedFileOfRegion:v9];
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
  [(VMUTaskMemoryScanner *)self _addThreadNodesFromTask];
  [(VMUTaskMemoryScanner *)self _addSpecialNodesFromTask];
  unsigned int v5 = self->_regionsCount - 1;
  do
  {
    unsigned int v6 = v5;
    if (!v5) {
      break;
    }
    int v7 = *((unsigned __int8 *)self->_regions[(unint64_t)v5--].var0 + 50);
  }
  while (v7 == 5);
  unsigned int v8 = 0;
  do
  {
    uint64_t v9 = v8;
    uint64_t v10 = self->_regions[(unint64_t)v8].var0;
    unsigned int v11 = v10;
    if (v10[50] != 3
      && ([v10 isSubmap] & 1) == 0
      && ([v11 isSpecialPhysFootprintRegion] & 1) == 0)
    {
      unint64_t v12 = *((void *)v11 + 1);
      uint64_t v13 = *((void *)v11 + 2);
      BOOL v14 = -[VMUTask rangeIsInSharedCache:](self->_task, "rangeIsInSharedCache:", v12, v13);
      if (([v11 isMallocHeapRelated] & 1) == 0
        && ([v11 ignoreRegionDuringScanning] & 1) == 0)
      {
        if ([v11 willNotHoldPointers])
        {
          unint64_t v15 = &self->_regions[v9];
          v15->unint64_t var4 = v12;
          v15->unint64_t var5 = v12 + 1;
        }
        else
        {
          if ((~[v11 protection] & 3) != 0)
          {
            int v17 = *((_DWORD *)v11 + 6);
            char v18 = (~v17 & 5) != 0 || v14;
            if ((v18 & 1) == 0 || (v17 != 1 ? (char v19 = 1) : (char v19 = v14), (v19 & 1) == 0))
            {
              if ((v11[132] & 2) == 0)
              {
                uint64_t v20 = &self->_regions[v9];
                v20->unint64_t var4 = *((void *)v11 + 1);
                v20->unint64_t var5 = v13 + v12;
              }
            }
          }
          else if ((v11[132] & 4) == 0 || self->_targetProcessHasObjCPatches && [v11 dirtyLength])
          {
            id v16 = &self->_regions[v9];
            v16->unint64_t var4 = v12;
            v16->unint64_t var5 = v13 + v12;
          }
          else
          {
            id v21 = &self->_regions[v9];
            v21->unint64_t var4 = 0;
            v21->unint64_t var5 = 0;
          }
          if ([v11 isActivityTracing]) {
            self->_regions[v9].unint64_t var5 = self->_regions[v9].var4 + 4096;
          }
          if ((v11[132] & 2) != 0
            && (v11[132] & 4) == 0
            && ([v11 protection] & 1) != 0
            && ([v11 protection] & 4) == 0)
          {
            v166 = [v11 type];
            char v164 = [v166 isEqualToString:@"__LINKEDIT"];

            if ((v164 & 1) == 0)
            {
              uint64_t v22 = 168;
              if (v14) {
                uint64_t v22 = 152;
              }
              unsigned int v23 = (unint64_t *)((char *)self + v22);
              unint64_t v24 = *v23;
              if (!*v23)
              {
                *unsigned int v23 = v12;
                unint64_t v24 = v12;
              }
              v23[1] = v13 + v12 - v24;
              if (!v14) {
                -[VMURangeArray addRange:](self->_dataSegmentsRangeArrayOutsideSharedCache, "addRange:", v12, v13);
              }
            }
          }
          if (self->_regions[v9].var5 && v11[49]) {
            [(VMUTaskMemoryScanner *)self _shortenScannableRangeOfMappedFile:v9];
          }
        }
      }
    }

    unsigned int v8 = v9 + 1;
  }
  while ((int)v9 + 1 <= v6);
  uint64_t v170 = 0;
  v171 = &v170;
  uint64_t v172 = 0x3032000000;
  v173 = __Block_byref_object_copy_;
  v174 = __Block_byref_object_dispose_;
  id v175 = (id)objc_opt_new();
  int v25 = (LODWORD(self->_regionDescriptionOptions) >> 23) & 1;
  v168[0] = MEMORY[0x1E4F143A8];
  v168[1] = 3221225472;
  v168[2] = __54__VMUTaskMemoryScanner_addRootNodesFromTaskWithError___block_invoke;
  v168[3] = &unk_1E5D22F30;
  v168[4] = self;
  v168[5] = &v170;
  char v169 = v25;
  BOOL v26 = [(VMUTaskMemoryScanner *)self _callRemoteMallocEnumerators:6 error:a3 block:v168];
  if (!v26) {
    goto LABEL_195;
  }
  if (!self->_stackRanges)
  {
    unint64_t v27 = objc_alloc_init(VMURangeArray);
    stackRanges = self->_stackRanges;
    self->_stackRanges = v27;
  }
  unsigned int regionsCount = self->_regionsCount;
  BOOL v167 = v26;
  if (regionsCount)
  {
    regions = self->_regions;
    uint64_t v31 = &regions[(unint64_t)(regionsCount - 1)];
  }
  else
  {
    regions = 0;
    uint64_t v31 = 0;
  }
  if (!self->_threadsCount) {
    goto LABEL_105;
  }
  uint64_t v32 = 0;
  do
  {
    unint64_t v33 = [(VMUTaskThreadStates *)self->_threadStates stackPointerForThreadNum:v32];
    unint64_t v34 = v33;
    if (!v33) {
      goto LABEL_88;
    }
    regionMap = self->_regionMap;
    unint64_t var6 = regionMap->var6;
    unint64_t var7 = regionMap->var7;
    BOOL v38 = var7 >= var6;
    unint64_t v39 = var7 - var6;
    if (!v38 || v33 - var6 >= v39) {
      goto LABEL_88;
    }
    unint64_t v40 = v33 >> *MEMORY[0x1E4F14AF8];
    if (v40)
    {
      var3 = (unsigned int *)regionMap->var3;
      unint64_t v42 = v33 >> *MEMORY[0x1E4F14AF8];
      do
      {
        if (*var3 <= (v42 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)var3 + ((v42 & 0x3FFFFFF) >> 3) + 4) >> (v42 & 7)) & 1) == 0)
        {
          goto LABEL_88;
        }
        v42 >>= 26;
      }
      while (v42);
    }
    v43 = (char *)regionMap + 4 * (v40 & 0x7FFFF);
    int v46 = *((_DWORD *)v43 + 16);
    int v45 = v43 + 64;
    int v44 = v46;
    unint64_t var4 = regionMap->var4;
    if (v46)
    {
      unint64_t v48 = &var4[(unint64_t)(v44 - 1)];
      if (v33 - *((void *)v48->var0 + 1) < *((void *)v48->var0 + 2)) {
        goto LABEL_64;
      }
    }
    unint64_t var5 = regionMap->var5;
    if (!var5) {
      goto LABEL_88;
    }
    v54 = regionMap->var4;
    while (1)
    {
      unint64_t v55 = var5 >> 1;
      unint64_t v48 = &v54[var5 >> 1];
      if (*((void *)v48->var0 + 1) <= v33) {
        break;
      }
LABEL_77:
      BOOL v38 = var5 >= 2;
      unint64_t var5 = v55;
      if (!v38) {
        goto LABEL_88;
      }
    }
    if (*((void *)v48->var0 + 2) + *((void *)v48->var0 + 1) <= v33)
    {
      v54 = v48 + 1;
      unint64_t v55 = --var5 >> 1;
      goto LABEL_77;
    }
    int v57 = [v48->var0 isSpecialPhysFootprintRegion];
    if (v57) {
      unint64_t v58 = 0;
    }
    else {
      unint64_t v58 = (unint64_t)v48;
    }
    if (v57) {
      goto LABEL_88;
    }
    if (*(unsigned char *)(*(void *)v58 + 132))
    {
      unint64_t v59 = v58;
      int v60 = (id *)(v58 + 64);
      unint64_t v61 = regionMap->var5 - ((uint64_t)(v58 + 64 - (unint64_t)regionMap->var4) >> 6);
      if (v61)
      {
        while (1)
        {
          unint64_t v62 = v61 >> 1;
          uint64_t v63 = &v60[8 * (v61 >> 1)];
          if (*((void *)*v63 + 1) <= v34)
          {
            if (*((void *)*v63 + 2) + *((void *)*v63 + 1) > v34)
            {
              if ([*v63 isSpecialPhysFootprintRegion]) {
                unint64_t v61 = 0;
              }
              else {
                unint64_t v61 = (unint64_t)v63;
              }
              break;
            }
            int v60 = v63 + 8;
            unint64_t v62 = --v61 >> 1;
          }
          BOOL v64 = v61 > 1;
          unint64_t v61 = v62;
          if (!v64)
          {
            unint64_t v61 = 0;
            break;
          }
        }
      }
      if (v61) {
        unint64_t v58 = v61;
      }
      else {
        unint64_t v58 = v59;
      }
      unint64_t v48 = (_VMURegionNode *)v58;
    }
    _DWORD *v45 = ((v58 - (unint64_t)var4) >> 6) + 1;
LABEL_64:
    v48->unint64_t var4 = v34;
    uint64_t v49 = *((void *)v48->var0 + 1);
    unint64_t v50 = *((void *)v48->var0 + 2) + v49;
    v48->unint64_t var5 = v50;
    unint64_t v51 = (unint64_t)&v48[-1];
    if (&v48[-1] >= regions)
    {
      do
      {
        if (*(void *)(*(void *)v51 + 16) + *(void *)(*(void *)v51 + 8) != v49) {
          break;
        }
        if (![*(id *)v51 isStack]) {
          break;
        }
        if (!*(_DWORD *)(*(void *)v51 + 24)) {
          break;
        }
        uint64_t v49 = *(void *)(*(void *)v51 + 8);
        *(void *)(v51 + 24) = 0;
        *(void *)(v51 + 32) = 0;
        v51 -= 64;
      }
      while (v51 >= (unint64_t)regions);
    }
    unint64_t v52 = (unint64_t)&v48[1];
    if (&v48[1] <= v31)
    {
      do
      {
        if (v50 != *(void *)(*(void *)v52 + 8)) {
          break;
        }
        if (![*(id *)v52 isStack]) {
          break;
        }
        if (!*(_DWORD *)(*(void *)v52 + 24)) {
          break;
        }
        unint64_t v56 = (void *)(*(void *)v52 + 8);
        *(void *)(v52 + 24) = *v56;
        unint64_t v50 = v56[1] + *v56;
        *(void *)(v52 + 32) = v50;
        v52 += 64;
      }
      while (v52 <= (unint64_t)v31);
    }
    -[VMURangeArray addRange:](self->_stackRanges, "addRange:", v34, v50 - v34);
LABEL_88:
    uint64_t v32 = (v32 + 1);
  }
  while (v32 < self->_threadsCount);
LABEL_105:
  unint64_t mallocZonesBufferAddress = self->_mallocZonesBufferAddress;
  if (!mallocZonesBufferAddress) {
    goto LABEL_123;
  }
  p_unint64_t var0 = 0;
  id v67 = self->_regionMap;
  unint64_t v69 = v67->var6;
  unint64_t v68 = v67->var7;
  unint64_t v70 = v68 - v69;
  BOOL v71 = v68 < v69;
  if (mallocZonesBufferAddress - v69 >= v70 || v71) {
    goto LABEL_122;
  }
  unint64_t v72 = mallocZonesBufferAddress >> *MEMORY[0x1E4F14AF8];
  if (v72)
  {
    id v73 = (unsigned int *)v67->var3;
    unint64_t v74 = mallocZonesBufferAddress >> *MEMORY[0x1E4F14AF8];
    while (*v73 > (v74 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)v73 + ((v74 & 0x3FFFFFF) >> 3) + 4) >> (v74 & 7)) & 1) != 0)
    {
      v74 >>= 26;
      if (!v74) {
        goto LABEL_113;
      }
    }
LABEL_121:
    p_unint64_t var0 = 0;
    goto LABEL_122;
  }
LABEL_113:
  unsigned int v75 = (char *)v67 + 4 * (v72 & 0x7FFFF);
  int v78 = *((_DWORD *)v75 + 16);
  uint64_t v77 = v75 + 64;
  int v76 = v78;
  int v79 = v67->var4;
  if (v78)
  {
    p_unint64_t var0 = &v79[(unint64_t)(v76 - 1)].var0;
    if (mallocZonesBufferAddress - *((void *)*p_var0 + 1) < *((void *)*p_var0 + 2)) {
      goto LABEL_122;
    }
  }
  unint64_t v80 = v67->var5;
  if (!v80) {
    goto LABEL_121;
  }
  v81 = v67->var4;
  while (2)
  {
    unint64_t v82 = v80 >> 1;
    id v83 = &v81[v80 >> 1].var0;
    if (*((void *)*v83 + 1) > mallocZonesBufferAddress)
    {
LABEL_120:
      BOOL v38 = v80 >= 2;
      unint64_t v80 = v82;
      if (!v38) {
        goto LABEL_121;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v83 + 2) + *((void *)*v83 + 1) <= mallocZonesBufferAddress)
  {
    v81 = (_VMURegionNode *)(v83 + 8);
    unint64_t v82 = --v80 >> 1;
    goto LABEL_120;
  }
  int v142 = [*v83 isSpecialPhysFootprintRegion];
  p_unint64_t var0 = 0;
  if (v142) {
    v143 = 0;
  }
  else {
    v143 = v83;
  }
  if (v142) {
    goto LABEL_122;
  }
  if ((*((unsigned char *)*v143 + 132) & 1) == 0) {
    goto LABEL_213;
  }
  v144 = v143 + 8;
  unint64_t v145 = v67->var5 - (((char *)(v143 + 8) - (char *)v67->var4) >> 6);
  if (!v145) {
    goto LABEL_210;
  }
  while (2)
  {
    unint64_t v146 = v145 >> 1;
    v147 = &v144[8 * (v145 >> 1)];
    if (*((void *)*v147 + 1) > mallocZonesBufferAddress)
    {
LABEL_205:
      BOOL v64 = v145 > 1;
      unint64_t v145 = v146;
      if (!v64)
      {
        unint64_t v145 = 0;
        goto LABEL_210;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v147 + 2) + *((void *)*v147 + 1) <= mallocZonesBufferAddress)
  {
    v144 = v147 + 8;
    unint64_t v146 = --v145 >> 1;
    goto LABEL_205;
  }
  if ([*v147 isSpecialPhysFootprintRegion]) {
    unint64_t v145 = 0;
  }
  else {
    unint64_t v145 = (unint64_t)v147;
  }
LABEL_210:
  if (v145) {
    id v83 = (id *)v145;
  }
  else {
    id v83 = v143;
  }
LABEL_213:
  *uint64_t v77 = ((unint64_t)((char *)v83 - (char *)v79) >> 6) + 1;
  p_unint64_t var0 = v83;
LABEL_122:
  unsigned int zonesCount = self->_zonesCount;
  p_var0[3] = (id)[*p_var0 address];
  p_var0[4] = (id)([*p_var0 address] + 8 * zonesCount);
LABEL_123:
  if (!self->_zonesCount) {
    goto LABEL_176;
  }
  unint64_t v85 = 1;
  uint64_t v86 = 8;
  do
  {
    int v87 = [*(id *)((char *)&self->_zones->var0 + v86) hasPrefix:@"MallocHelperZone_0x"];
    int v88 = v87;
    unint64_t v89 = self->_zonesCount;
    if (v85 >= v89) {
      char v90 = 1;
    }
    else {
      char v90 = v87;
    }
    ++v85;
    v86 += 24;
  }
  while ((v90 & 1) == 0);
  if (!v89) {
    goto LABEL_176;
  }
  uint64_t v91 = 0;
  while (2)
  {
    v92 = (void *)v171[5];
    v93 = [NSNumber numberWithUnsignedInt:v91];
    LOBYTE(v92) = [v92 containsObject:v93];

    if (v92) {
      goto LABEL_156;
    }
    v94 = 0;
    os_signpost_id_t v95 = self->_regionMap;
    unint64_t v96 = v95->var6;
    unint64_t v97 = v95->var7;
    BOOL v38 = v97 >= v96;
    unint64_t v98 = v97 - v96;
    if (!v38) {
      goto LABEL_149;
    }
    unint64_t var0 = self->_zones[v91].var0;
    if (var0 - v96 >= v98) {
      goto LABEL_149;
    }
    unint64_t v100 = var0 >> *MEMORY[0x1E4F14AF8];
    if (v100)
    {
      uint64_t v101 = (unsigned int *)v95->var3;
      unint64_t v102 = var0 >> *MEMORY[0x1E4F14AF8];
      while (*v101 > (v102 & 0x3FFFFFF)
           && ((*((unsigned __int8 *)v101 + ((v102 & 0x3FFFFFF) >> 3) + 4) >> (v102 & 7)) & 1) != 0)
      {
        v102 >>= 26;
        if (!v102) {
          goto LABEL_140;
        }
      }
LABEL_148:
      v94 = 0;
      goto LABEL_149;
    }
LABEL_140:
    v103 = (char *)v95 + 4 * (v100 & 0x7FFFF);
    int v106 = *((_DWORD *)v103 + 16);
    v105 = v103 + 64;
    int v104 = v106;
    v107 = v95->var4;
    if (v106)
    {
      v94 = &v107[(unint64_t)(v104 - 1)].var0;
      if (var0 - *((void *)*v94 + 1) < *((void *)*v94 + 2)) {
        goto LABEL_149;
      }
    }
    unint64_t v108 = v95->var5;
    if (!v108) {
      goto LABEL_148;
    }
    v109 = v95->var4;
    while (2)
    {
      unint64_t v110 = v108 >> 1;
      v111 = &v109[v108 >> 1].var0;
      if (*((void *)*v111 + 1) > var0)
      {
LABEL_147:
        BOOL v38 = v108 >= 2;
        unint64_t v108 = v110;
        if (!v38) {
          goto LABEL_148;
        }
        continue;
      }
      break;
    }
    if (*((void *)*v111 + 2) + *((void *)*v111 + 1) <= var0)
    {
      v109 = (_VMURegionNode *)(v111 + 8);
      unint64_t v110 = --v108 >> 1;
      goto LABEL_147;
    }
    int v119 = [*v111 isSpecialPhysFootprintRegion];
    v94 = 0;
    if (v119) {
      v120 = 0;
    }
    else {
      v120 = v111;
    }
    if (v119) {
      goto LABEL_149;
    }
    if ((*((unsigned char *)*v120 + 132) & 1) == 0) {
      goto LABEL_175;
    }
    v121 = v120;
    v122 = v120 + 8;
    unint64_t v123 = v95->var5 - (((char *)(v120 + 8) - (char *)v95->var4) >> 6);
    if (!v123) {
      goto LABEL_172;
    }
    while (2)
    {
      unint64_t v124 = v123 >> 1;
      v125 = &v122[8 * (v123 >> 1)];
      if (*((void *)*v125 + 1) > var0)
      {
LABEL_167:
        BOOL v64 = v123 > 1;
        unint64_t v123 = v124;
        if (!v64)
        {
          unint64_t v123 = 0;
          goto LABEL_172;
        }
        continue;
      }
      break;
    }
    if (*((void *)*v125 + 2) + *((void *)*v125 + 1) <= var0)
    {
      v122 = v125 + 8;
      unint64_t v124 = --v123 >> 1;
      goto LABEL_167;
    }
    if ([*v125 isSpecialPhysFootprintRegion]) {
      unint64_t v123 = 0;
    }
    else {
      unint64_t v123 = (unint64_t)v125;
    }
LABEL_172:
    if (v123) {
      v111 = (id *)v123;
    }
    else {
      v111 = v121;
    }
LABEL_175:
    _DWORD *v105 = ((unint64_t)((char *)v111 - (char *)v107) >> 6) + 1;
    v94 = v111;
LABEL_149:
    if ([*v94 protection])
    {
      zones = self->_zones;
      uint64_t v113 = (void *)zones[v91].var0;
      uint64_t v114 = ((unint64_t)v113 + *MEMORY[0x1E4F14B00] + 199) & -*MEMORY[0x1E4F14B00];
      v94[3] = v113;
      v94[4] = (id)v114;
      if (v88)
      {
        if ([zones[v91].var1 hasPrefix:@"DefaultMallocZone_0x"])
        {
          v115 = v94[8];
          if (*((void *)*v94 + 2) + *((void *)*v94 + 1) == v115[1]
            && [v115 protection] == 3)
          {
            id v116 = [v94[8] type];
            int v117 = [v116 isEqualToString:@"MALLOC metadata"];

            if (v117)
            {
              v118 = (id *)((char *)v94[8] + 8);
              v94[11] = *v118;
              v94[12] = (char *)*v118 + (void)v118[1];
            }
          }
        }
      }
    }
LABEL_156:
    if (++v91 < (unint64_t)self->_zonesCount) {
      continue;
    }
    break;
  }
LABEL_176:
  if (!s_enumeratorDebugging)
  {
    unint64_t v126 = self->_regionsCount;
    goto LABEL_178;
  }
  fwrite("Region state after claims:\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  if (self->_regionsCount)
  {
    uint64_t v148 = 0;
    unint64_t v149 = 0;
    do
    {
      v165 = (FILE *)*MEMORY[0x1E4F143C8];
      uint64_t v163 = [self->_regions[v148].var0 address];
      v150 = self->_regions[v148].var0;
      uint64_t v151 = v150[2];
      uint64_t v161 = v150[1];
      uint64_t v152 = *((unsigned int *)v150 + 6);
      v162 = vm_prot_strings[v152];
      VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v150 + 232), *((unsigned __int8 *)v150 + 104), *((unsigned __int8 *)v150 + 50), v152, *((unsigned __int8 *)v150 + 49));
      id v153 = objc_claimAutoreleasedReturnValue();
      v154 = (const char *)[v153 UTF8String];
      v155 = &self->_regions[v148];
      uint64_t v156 = *((void *)v155->var0 + 2) >> *MEMORY[0x1E4F14AF8];
      if (v156 == 1) {
        v157 = "page";
      }
      else {
        v157 = "pages";
      }
      v158 = "";
      if (v155->var4 == v155->var5) {
        v159 = "";
      }
      else {
        v159 = " [root]";
      }
      unsigned int v160 = *((_DWORD *)v155->var0 + 37);
      if (v160 < self->_zonesCount) {
        v158 = (const char *)[self->_zones[v160].var1 UTF8String];
      }
      fprintf(v165, "region: [%#llx-%#llx] %s %s (%llu %s)%s  %s\n", v163, v151 + v161, v162, v154, v156, v157, v159, v158);

      ++v149;
      unint64_t v126 = self->_regionsCount;
      ++v148;
    }
    while (v149 < v126);
LABEL_178:
    if (v126)
    {
      for (unint64_t i = 0; i < v126; ++i)
      {
        objc_super v128 = self->_regions;
        if (v128[i].var4 < v128[i].var5)
        {
          unsigned int blocksCount = self->_blocksCount;
          uint64_t blocksSize = self->_blocksSize;
          if (blocksSize <= blocksCount)
          {
            if ((2 * blocksSize) <= 0x40000) {
              int v131 = 0x40000;
            }
            else {
              int v131 = 2 * blocksSize;
            }
            do
            {
              unsigned int v132 = v131;
              v131 *= 2;
            }
            while (v132 < blocksCount);
            self->_uint64_t blocksSize = v132;
            v133 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v132, 0x1000040451B5BE8uLL);
            self->_blocks = v133;
            if (!v133)
            {
              NSLog(&cfstr_OutOfMemoryFai.isa, "_blocks", blocksSize, self->_blocksSize);
              abort();
            }
            objc_super v128 = self->_regions;
          }
          id v134 = v128[i].var0;
          if ([v134 isRootRegion]) {
            uint64_t v135 = 2;
          }
          else {
            uint64_t v135 = 5;
          }
          v136 = &self->_blocks[self->_blocksCount];
          v137 = &self->_regions[i];
          unint64_t v138 = v137->var4;
          unint64_t v139 = v135 & 0xFFFFFFE00000001FLL | (32 * (LODWORD(v137->var5) - v138)) | (i << 41);
          v136->unint64_t var0 = v138;
          *((void *)v136 + 1) = v139;
          ++self->_blocksCount;

          unint64_t v126 = self->_regionsCount;
        }
      }
    }
  }
  BOOL v26 = v167;
  if ([(VMUTaskMemoryScanner *)self objectContentLevel] == 2)
  {
    v140 = [(VMUTaskMemoryScanner *)self _readonlyRegionRanges];
    [(VMUObjectIdentifier *)self->_objectIdentifier setReadonlyRegionRanges:v140];
  }
LABEL_195:
  _Block_object_dispose(&v170, 8);

  return v26;
}

void __54__VMUTaskMemoryScanner_addRootNodesFromTaskWithError___block_invoke(uint64_t a1, unsigned int a2, int a3, uint64_t a4, unsigned int a5)
{
  if (a5)
  {
    uint64_t v5 = a4;
    uint64_t v7 = 0;
    uint64_t v93 = a5;
    do
    {
      unsigned int v8 = (unint64_t *)(v5 + 16 * v7);
      uint64_t v10 = v8 + 1;
      unint64_t v9 = v8[1];
      if (v9)
      {
        unint64_t v11 = *v8;
        uint64_t v12 = *(void *)(a1 + 32);
        if (a3 == 2 && *(_DWORD *)(v12 + 216))
        {
          uint64_t v13 = 0;
          unint64_t v14 = 0;
          do
          {
            if (*(void *)(*(void *)(v12 + 208) + v13) - v11 < v9)
            {
              unint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
              id v16 = [NSNumber numberWithUnsignedInt:v14];
              [v15 addObject:v16];

              uint64_t v12 = *(void *)(a1 + 32);
            }
            ++v14;
            v13 += 24;
          }
          while (v14 < *(unsigned int *)(v12 + 216));
          unint64_t v11 = *v8;
          uint64_t v5 = a4;
        }
        uint64_t v17 = *(void *)(v12 + 112);
        unint64_t v18 = *(void *)(v17 + 48);
        unint64_t v19 = *(void *)(v17 + 56);
        BOOL v20 = v19 >= v18;
        unint64_t v21 = v19 - v18;
        if (v20 && v11 - v18 < v21)
        {
          unint64_t v22 = v11 >> *MEMORY[0x1E4F14AF8];
          if (v22)
          {
            unsigned int v23 = *(unsigned int **)(v17 + 24);
            unint64_t v24 = v11 >> *MEMORY[0x1E4F14AF8];
            do
            {
              if (*v23 <= (v24 & 0x3FFFFFF)
                || ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) == 0)
              {
                goto LABEL_81;
              }
              v24 >>= 26;
            }
            while (v24);
          }
          uint64_t v25 = v17 + 4 * (v22 & 0x7FFFF);
          int v28 = *(_DWORD *)(v25 + 64);
          unint64_t v27 = (_DWORD *)(v25 + 64);
          int v26 = v28;
          uint64_t v29 = *(void *)(v17 + 32);
          if (v28)
          {
            unint64_t v30 = v29 + ((unint64_t)(v26 - 1) << 6);
            if (v11 - *(void *)(*(void *)v30 + 8) < *(void *)(*(void *)v30 + 16)) {
              goto LABEL_21;
            }
          }
          unint64_t v70 = *(unsigned int *)(v17 + 40);
          if (v70)
          {
            unint64_t v71 = *(void *)(v17 + 32);
            do
            {
              unint64_t v72 = v70 >> 1;
              unint64_t v30 = v71 + (v70 >> 1 << 6);
              if (*(void *)(*(void *)v30 + 8) <= v11)
              {
                if (*(void *)(*(void *)v30 + 16) + *(void *)(*(void *)v30 + 8) > v11)
                {
                  int v73 = [*(id *)v30 isSpecialPhysFootprintRegion];
                  if (v73) {
                    unint64_t v74 = 0;
                  }
                  else {
                    unint64_t v74 = v30;
                  }
                  if ((v73 & 1) == 0)
                  {
                    if ((*(unsigned char *)(*(void *)v74 + 132) & 1) == 0) {
                      goto LABEL_96;
                    }
                    unsigned int v75 = (id *)(v74 + 64);
                    unint64_t v76 = *(unsigned int *)(v17 + 40) - ((uint64_t)(v74 + 64 - *(void *)(v17 + 32)) >> 6);
                    if (!v76) {
                      goto LABEL_93;
                    }
                    while (1)
                    {
                      unint64_t v77 = v76 >> 1;
                      int v78 = &v75[8 * (v76 >> 1)];
                      if (*((void *)*v78 + 1) <= v11)
                      {
                        if (*((void *)*v78 + 2) + *((void *)*v78 + 1) > v11)
                        {
                          unint64_t v79 = v74;
                          int v80 = [*v78 isSpecialPhysFootprintRegion];
                          unint64_t v74 = v79;
                          if (v80) {
                            unint64_t v76 = 0;
                          }
                          else {
                            unint64_t v76 = (unint64_t)v78;
                          }
LABEL_93:
                          if (v76) {
                            unint64_t v30 = v76;
                          }
                          else {
                            unint64_t v30 = v74;
                          }
LABEL_96:
                          *unint64_t v27 = ((v30 - v29) >> 6) + 1;
LABEL_21:
                          unint64_t v31 = *v10 + *v8;
LABEL_22:
                          while (2)
                          {
                            id v32 = *(id *)v30;
                            if (v31 <= *(void *)(*(void *)v30 + 8)) {
                              goto LABEL_81;
                            }
                            *((_DWORD *)v32 + 37) = a2;
                            if (![*((id *)v32 + 5) length])
                            {
                              uint64_t v33 = [*(id *)(*(void *)(a1 + 32) + 144) objectAtIndexedSubscript:a2];
                              unint64_t v34 = *(void **)(*(void *)v30 + 40);
                              *(void *)(*(void *)v30 + 40) = v33;

                              if (*(unsigned char *)(a1 + 48))
                              {
                                id v35 = [*(id *)v30 description];
                                printf("Setting region name in %s based on _zoneNames[zone_index] for  %s\n", "-[VMUTaskMemoryScanner addRootNodesFromTaskWithError:]_block_invoke", (const char *)[v35 UTF8String]);
                              }
                            }
                            uint64_t v36 = *(char **)v30;
                            *(_DWORD *)(*(void *)v30 + 144) |= a3;
                            *(void *)(v30 + 24) = 0;
                            *(void *)(v30 + 32) = 0;
                            if (s_enumeratorDebugging)
                            {
                              BOOL v64 = (FILE **)MEMORY[0x1E4F143C8];
                              fprintf((FILE *)*MEMORY[0x1E4F143C8], "zone %s ", (const char *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 208)+ 24 * a2+ 8) UTF8String]);
                              int v88 = *v64;
                              uint64_t v86 = [*(id *)v30 address];
                              uint64_t v85 = *(void *)(*(void *)v30 + 16) + *(void *)(*(void *)v30 + 8);
                              uint64_t v65 = *(unsigned int *)(*(void *)v30 + 24);
                              uint64_t v84 = vm_prot_strings[v65];
                              VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(void *)v30 + 232), *(unsigned __int8 *)(*(void *)v30 + 104), *(unsigned __int8 *)(*(void *)v30 + 50), v65, *(unsigned __int8 *)(*(void *)v30 + 49));
                              id v83 = objc_claimAutoreleasedReturnValue();
                              unint64_t v82 = (const char *)[v83 UTF8String];
                              uint64_t v66 = *(void *)(*(void *)v30 + 16) >> *MEMORY[0x1E4F14AF8];
                              if (v66 == 1) {
                                id v67 = "page";
                              }
                              else {
                                id v67 = "pages";
                              }
                              if (*(void *)(v30 + 24) == *(void *)(v30 + 32)) {
                                unint64_t v68 = "";
                              }
                              else {
                                unint64_t v68 = " [root]";
                              }
                              unint64_t v69 = VMUMallocRangeTypeString(a3);
                              v81 = v67;
                              uint64_t v5 = a4;
                              fprintf(v88, "claimed region: [%#llx-%#llx] %s %s (%llu %s)%s - type '%s' range: [%#lx-%#lx]\n", v86, v85, v84, v82, v66, v81, v68, v69, *v8, *v10 + *v8);

                              uint64_t v36 = *(char **)v30;
                            }
                            uint64_t v37 = (uint64_t *)(v36 + 8);
                            uint64_t v39 = *v37;
                            uint64_t v38 = v37[1];
                            if (v31 <= v38 + v39) {
                              goto LABEL_81;
                            }
                            uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 112);
                            unint64_t v41 = *(void *)(v40 + 48);
                            unint64_t v42 = *(void *)(v40 + 56);
                            BOOL v20 = v42 >= v41;
                            unint64_t v43 = v42 - v41;
                            if (!v20) {
                              goto LABEL_81;
                            }
                            v11 += v38;
                            if (v11 - v41 >= v43) {
                              goto LABEL_81;
                            }
                            unint64_t v44 = v11 >> *MEMORY[0x1E4F14AF8];
                            if (v44)
                            {
                              int v45 = *(unsigned int **)(v40 + 24);
                              unint64_t v46 = v11 >> *MEMORY[0x1E4F14AF8];
                              while (*v45 > (v46 & 0x3FFFFFF)
                                   && ((*((unsigned __int8 *)v45 + ((v46 & 0x3FFFFFF) >> 3) + 4) >> (v46 & 7)) & 1) != 0)
                              {
                                v46 >>= 26;
                                if (!v46) {
                                  goto LABEL_36;
                                }
                              }
                              goto LABEL_81;
                            }
LABEL_36:
                            uint64_t v47 = v40 + 4 * (v44 & 0x7FFFF);
                            int v50 = *(_DWORD *)(v47 + 64);
                            uint64_t v49 = (_DWORD *)(v47 + 64);
                            int v48 = v50;
                            if (v50)
                            {
                              unint64_t v30 = *(void *)(v40 + 32) + ((unint64_t)(v48 - 1) << 6);
                              if (v11 - *(void *)(*(void *)v30 + 8) < *(void *)(*(void *)v30 + 16)) {
                                continue;
                              }
                            }
                            break;
                          }
                          unint64_t v51 = *(unsigned int *)(v40 + 40);
                          if (!v51) {
                            goto LABEL_81;
                          }
                          unint64_t v52 = *(void *)(v40 + 32);
                          while (1)
                          {
                            unint64_t v53 = v51 >> 1;
                            unint64_t v30 = v52 + (v51 >> 1 << 6);
                            if (*(void *)(*(void *)v30 + 8) <= v11)
                            {
                              if (*(void *)(*(void *)v30 + 16) + *(void *)(*(void *)v30 + 8) > v11)
                              {
                                uint64_t v87 = *(void *)(v40 + 32);
                                int v54 = [*(id *)v30 isSpecialPhysFootprintRegion];
                                uint64_t v55 = v87;
                                if (v54) {
                                  unint64_t v56 = 0;
                                }
                                else {
                                  unint64_t v56 = v30;
                                }
                                if (v54) {
                                  goto LABEL_81;
                                }
                                if ((*(unsigned char *)(*(void *)v56 + 132) & 1) == 0) {
                                  goto LABEL_62;
                                }
                                int v57 = (id *)(v56 + 64);
                                unint64_t v58 = *(unsigned int *)(v40 + 40) - ((uint64_t)(v56 + 64 - *(void *)(v40 + 32)) >> 6);
                                if (!v58) {
                                  goto LABEL_59;
                                }
                                while (2)
                                {
                                  unint64_t v59 = v58 >> 1;
                                  int v60 = &v57[8 * (v58 >> 1)];
                                  if (*((void *)*v60 + 1) > v11)
                                  {
LABEL_54:
                                    BOOL v61 = v58 > 1;
                                    unint64_t v58 = v59;
                                    if (!v61)
                                    {
                                      unint64_t v58 = 0;
                                      goto LABEL_59;
                                    }
                                    continue;
                                  }
                                  break;
                                }
                                if (*((void *)*v60 + 2) + *((void *)*v60 + 1) <= v11)
                                {
                                  int v57 = v60 + 8;
                                  unint64_t v59 = --v58 >> 1;
                                  goto LABEL_54;
                                }
                                unint64_t v62 = v56;
                                int v63 = [*v60 isSpecialPhysFootprintRegion];
                                unint64_t v56 = v62;
                                uint64_t v55 = v87;
                                if (v63) {
                                  unint64_t v58 = 0;
                                }
                                else {
                                  unint64_t v58 = (unint64_t)v60;
                                }
LABEL_59:
                                if (v58) {
                                  unint64_t v30 = v58;
                                }
                                else {
                                  unint64_t v30 = v56;
                                }
LABEL_62:
                                *uint64_t v49 = ((v30 - v55) >> 6) + 1;
                                goto LABEL_22;
                              }
                              unint64_t v52 = v30 + 64;
                              unint64_t v53 = --v51 >> 1;
                            }
                            BOOL v20 = v51 >= 2;
                            unint64_t v51 = v53;
                            if (!v20) {
                              goto LABEL_81;
                            }
                          }
                        }
                        unsigned int v75 = v78 + 8;
                        unint64_t v77 = --v76 >> 1;
                      }
                      BOOL v61 = v76 > 1;
                      unint64_t v76 = v77;
                      if (!v61)
                      {
                        unint64_t v76 = 0;
                        goto LABEL_93;
                      }
                    }
                  }
                  break;
                }
                unint64_t v71 = v30 + 64;
                unint64_t v72 = --v70 >> 1;
              }
              BOOL v20 = v70 >= 2;
              unint64_t v70 = v72;
            }
            while (v20);
          }
        }
      }
LABEL_81:
      ++v7;
    }
    while (v7 != v93);
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
      unsigned int v6 = self->_regions[v4].var0;
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
    id v5 = [(VMUTaskMemoryScanner *)self _readonlyRegionRanges];
    [(VMUObjectIdentifier *)self->_objectIdentifier setReadonlyRegionRanges:v5];
  }
}

- (void)_sortBlocks
{
}

uint64_t __35__VMUTaskMemoryScanner__sortBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 != *a3;
  }
}

- (BOOL)addMallocNodesFromTaskWithError:(id *)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__VMUTaskMemoryScanner_addMallocNodesFromTaskWithError___block_invoke;
  v6[3] = &unk_1E5D22F78;
  v6[4] = self;
  BOOL v4 = [(VMUTaskMemoryScanner *)self _callRemoteMallocEnumerators:1 error:a3 block:v6];
  if (v4) {
    [(VMUTaskMemoryScanner *)self _sortAndClassifyBlocks];
  }
  return v4;
}

void __56__VMUTaskMemoryScanner_addMallocNodesFromTaskWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(unsigned int *)(v8 + 92);
  if (v9 <= a5 - 1 + *(_DWORD *)(v8 + 88))
  {
    int v10 = 2 * v9;
    if ((2 * v9) <= 0x40000) {
      int v10 = 0x40000;
    }
    *(_DWORD *)(v8 + 92) = v10;
    while (1)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      unsigned int v12 = *(_DWORD *)(v11 + 92);
      if (v12 >= a5 - 1 + *(_DWORD *)(v11 + 88)) {
        break;
      }
      *(_DWORD *)(v11 + 92) = 2 * v12;
    }
    *(void *)(*(void *)(a1 + 32) + 80) = malloc_type_realloc(*(void **)(v11 + 80), 16 * *(unsigned int *)(v11 + 92), 0x1000040451B5BE8uLL);
    uint64_t v13 = *(void *)(a1 + 32);
    if (!*(void *)(v13 + 80))
    {
      NSLog(&cfstr_OutOfMemoryFai.isa, "_blocks", v9, *(unsigned int *)(v13 + 92));
      abort();
    }
  }
  if (!a5) {
    return;
  }
  uint64_t v14 = 0;
  do
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 112);
    id v16 = (unint64_t *)(a4 + 16 * v14);
    unint64_t v17 = *(void *)(v15 + 48);
    unint64_t v18 = *(void *)(v15 + 56);
    BOOL v19 = v18 >= v17;
    unint64_t v20 = v18 - v17;
    if (!v19) {
      goto LABEL_40;
    }
    unint64_t v21 = *v16;
    if (*v16 - v17 >= v20) {
      goto LABEL_40;
    }
    unint64_t v22 = v21 >> *MEMORY[0x1E4F14AF8];
    if (v22)
    {
      unsigned int v23 = *(unsigned int **)(v15 + 24);
      unint64_t v24 = v21 >> *MEMORY[0x1E4F14AF8];
      while (*v23 > (v24 & 0x3FFFFFF)
           && ((*((unsigned __int8 *)v23 + ((v24 & 0x3FFFFFF) >> 3) + 4) >> (v24 & 7)) & 1) != 0)
      {
        v24 >>= 26;
        if (!v24) {
          goto LABEL_18;
        }
      }
LABEL_40:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 208) + 24 * a2 + 8) UTF8String];
        uint64_t v49 = VMUMallocRangeTypeString(1);
        unint64_t v50 = *v16;
        uint64_t v51 = *(void *)(a4 + 16 * v14 + 8);
        *(_DWORD *)buf = 136315906;
        uint64_t v73 = v48;
        __int16 v74 = 2080;
        unsigned int v75 = v49;
        __int16 v76 = 2048;
        unint64_t v77 = v50;
        __int16 v78 = 2048;
        uint64_t v79 = v51;
        _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error: zone enumerator for \"%s\" reported '%s' %#llx (%llu bytes), in non-existent region, ignoring block.", buf, 0x2Au);
      }
      goto LABEL_42;
    }
LABEL_18:
    uint64_t v25 = v15 + 4 * (v22 & 0x7FFFF);
    int v28 = *(_DWORD *)(v25 + 64);
    unint64_t v27 = (_DWORD *)(v25 + 64);
    int v26 = v28;
    uint64_t v29 = *(void *)(v15 + 32);
    if (v28)
    {
      unint64_t v30 = (id *)(v29 + ((unint64_t)(v26 - 1) << 6));
      if (v21 - *((void *)*v30 + 1) < *((void *)*v30 + 2)) {
        goto LABEL_20;
      }
    }
    unint64_t v43 = *(unsigned int *)(v15 + 40);
    if (!v43) {
      goto LABEL_40;
    }
    unint64_t v44 = *(id **)(v15 + 32);
    while (1)
    {
      unint64_t v45 = v43 >> 1;
      unint64_t v30 = &v44[8 * (v43 >> 1)];
      if (*((void *)*v30 + 1) <= v21) {
        break;
      }
LABEL_34:
      BOOL v19 = v43 >= 2;
      unint64_t v43 = v45;
      if (!v19) {
        goto LABEL_40;
      }
    }
    if (*((void *)*v30 + 2) + *((void *)*v30 + 1) <= v21)
    {
      unint64_t v44 = v30 + 8;
      unint64_t v45 = --v43 >> 1;
      goto LABEL_34;
    }
    int v46 = [*v30 isSpecialPhysFootprintRegion];
    if (v46) {
      uint64_t v47 = 0;
    }
    else {
      uint64_t v47 = v30;
    }
    if (v46) {
      goto LABEL_40;
    }
    if ((*((unsigned char *)*v47 + 132) & 1) == 0) {
      goto LABEL_57;
    }
    unint64_t v52 = v47 + 8;
    unint64_t v53 = *(unsigned int *)(v15 + 40) - (((uint64_t)v47 - *(void *)(v15 + 32) + 64) >> 6);
    if (!v53) {
      goto LABEL_54;
    }
    while (2)
    {
      unint64_t v54 = v53 >> 1;
      uint64_t v55 = &v52[8 * (v53 >> 1)];
      if (*((void *)*v55 + 1) > v21)
      {
LABEL_49:
        BOOL v56 = v53 > 1;
        unint64_t v53 = v54;
        if (!v56)
        {
          unint64_t v53 = 0;
          goto LABEL_54;
        }
        continue;
      }
      break;
    }
    if (*((void *)*v55 + 2) + *((void *)*v55 + 1) <= v21)
    {
      unint64_t v52 = v55 + 8;
      unint64_t v54 = --v53 >> 1;
      goto LABEL_49;
    }
    int v57 = v47;
    int v58 = [*v55 isSpecialPhysFootprintRegion];
    uint64_t v47 = v57;
    if (v58) {
      unint64_t v53 = 0;
    }
    else {
      unint64_t v53 = (unint64_t)v55;
    }
LABEL_54:
    if (v53) {
      uint64_t v47 = (id *)v53;
    }
    unint64_t v30 = v47;
LABEL_57:
    *unint64_t v27 = (((unint64_t)v47 - v29) >> 6) + 1;
LABEL_20:
    if (*((_DWORD *)*v30 + 37) != a2)
    {
      if (s_enumeratorDebugging)
      {
        unint64_t v70 = (FILE *)*MEMORY[0x1E4F143C8];
        unint64_t v68 = (const char *)[*(id *)(*(void *)(*(void *)(a1 + 32) + 208)+ 24 * a2+ 8) UTF8String];
        unint64_t v59 = VMUMallocRangeTypeString(1);
        uint64_t v60 = *v16;
        uint64_t v61 = *(void *)(a4 + 16 * v14 + 8);
        uint64_t v63 = *((void *)*v30 + 1);
        uint64_t v62 = *((void *)*v30 + 2);
        unsigned int v64 = *((_DWORD *)*v30 + 37);
        uint64_t v65 = *(void *)(a1 + 32);
        uint64_t v66 = "<unclaimed>";
        if (v64 < *(_DWORD *)(v65 + 216))
        {
          id v67 = v59;
          uint64_t v66 = (const char *)[*(id *)(*(void *)(v65 + 208) + 24 * v64 + 8) UTF8String];
          unint64_t v59 = v67;
        }
        fprintf(v70, "warning: zone enumerator for \"%s\" reported '%s' %#llx (%llu bytes) in region: [%#llx-%#llx] %s\n", v68, v59, v60, v61, v63, v62 + v63, v66);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v69 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 208) + 24 * a2 + 8) UTF8String];
        unint64_t v31 = VMUMallocRangeTypeString(1);
        unint64_t v32 = *v16;
        uint64_t v33 = *(void *)(a4 + 16 * v14 + 8);
        unint64_t v34 = *v30;
        id v35 = (uint64_t *)((char *)*v30 + 8);
        uint64_t v36 = *v35;
        uint64_t v37 = v35[1];
        unsigned int v38 = v34[37];
        uint64_t v39 = *(void *)(a1 + 32);
        uint64_t v40 = "<unclaimed>";
        if (v38 < *(_DWORD *)(v39 + 216)) {
          uint64_t v40 = (const char *)[*(id *)(*(void *)(v39 + 208) + 24 * v38 + 8) UTF8String];
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v73 = v69;
        __int16 v74 = 2080;
        unsigned int v75 = v31;
        __int16 v76 = 2048;
        unint64_t v77 = v32;
        __int16 v78 = 2048;
        uint64_t v79 = v33;
        __int16 v80 = 2048;
        uint64_t v81 = v36;
        __int16 v82 = 2048;
        uint64_t v83 = v37 + v36;
        __int16 v84 = 2080;
        uint64_t v85 = v40;
        _os_log_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "warning: zone enumerator for \"%s\" reported '%s' %#llx (%llu bytes) in region: [%#llx-%#llx] %s", buf, 0x48u);
      }
    }
    unint64_t v41 = (unint64_t *)(*(void *)(*(void *)(a1 + 32) + 80)
                             + 16 * *(unsigned int *)(*(void *)(a1 + 32) + 88));
    unint64_t v42 = *(void *)(a4 + 16 * v14 + 8);
    if (v42 >= 0xFFFFFFFFFLL) {
      unint64_t v42 = 0xFFFFFFFFFLL;
    }
    *unint64_t v41 = *v16;
    v41[1] = (a2 << 41) | (32 * v42) | 9;
    ++*(_DWORD *)(*(void *)(a1 + 32) + 88);
LABEL_42:
    ++v14;
  }
  while (v14 != a5);
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
      int v10 = (_VMUBlockNode *)malloc_type_realloc(self->_blocks, 16 * v9, 0x1000040451B5BE8uLL);
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
        uint64_t v14 = (unint64_t *)(*((void *)v5 + 2) + v11);
        unint64_t v16 = *v14;
        unint64_t v15 = v14[1];
        unint64_t v17 = &self->_blocks[blocksCount];
        if (v15 >= 0xFFFFFFFFFLL) {
          unint64_t v15 = 0xFFFFFFFFFLL;
        }
        v17->unint64_t var0 = v16;
        *((void *)v17 + 1) = (32 * v15) | 1;
        unsigned int blocksCount = self->_blocksCount + 1;
        self->_unsigned int blocksCount = blocksCount;
        ++v12;
        v11 += 16;
      }
      while (v12 < v5[2]);
    }
    [(VMUTaskMemoryScanner *)self _sortAndClassifyBlocks];
  }
}

- (BOOL)addAllNodesFromTaskWithError:(id *)a3
{
  BOOL v5 = -[VMUTaskMemoryScanner addRootNodesFromTaskWithError:](self, "addRootNodesFromTaskWithError:");
  if (v5)
  {
    LOBYTE(v5) = [(VMUTaskMemoryScanner *)self addMallocNodesFromTaskWithError:a3];
  }
  return v5;
}

- (void)_sortAndClassifyBlocks
{
  [(VMUTaskMemoryScanner *)self _sortBlocks];
  [(VMUTaskMemoryScanner *)self _buildRegionFirstBlockIndexOnPageArrays];
  [(VMUTaskMemoryScanner *)self _fixupBlockIsas];
  [(VMUTaskMemoryScanner *)self _findMarkedAbandonedBlocks];
  if ((self->_regionDescriptionOptions & 0x200000) == 0)
  {
    [(VMUTaskMemoryScanner *)self unmapAllRegions];
  }
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

- (void)_identifyObjCClassStructureBlocks
{
  unint64_t v3 = [(VMUObjectIdentifier *)self->_objectIdentifier ObjCclassCount];
  if (v3 + [(VMUObjectIdentifier *)self->_objectIdentifier SwiftClassCount])
  {
    [(VMUObjectIdentifier *)self->_objectIdentifier _generateClassInfosForObjCClassStructurePointerTypes];
    self->_objcClassStructureClassInfoIndex = [(VMUObjectIdentifier *)self->_objectIdentifier classInfoIndexForObjCClassStructurePointerType:0];
    self->_classDataMethodsClassInfoIndex = [(VMUObjectIdentifier *)self->_objectIdentifier classInfoIndexForObjCClassStructurePointerType:6];
    self->_swiftClassStructureClassInfoIndex = [(VMUObjectIdentifier *)self->_objectIdentifier classInfoIndexForObjCClassStructurePointerType:1];
    self->_swiftMetadataClassInfoIndex = [(VMUObjectIdentifier *)self->_objectIdentifier classInfoIndexForObjCClassStructurePointerType:12];
    BOOL v4 = (NSMutableDictionary *)objc_opt_new();
    addressToRuntimeMetadataChunkInfoDict = self->_addressToRuntimeMetadataChunkInfoDict;
    self->_addressToRuntimeMetadataChunkInfoDict = v4;

    objectIdentifier = self->_objectIdentifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke;
    v7[3] = &unk_1E5D22FC8;
    v7[4] = self;
    [(VMUObjectIdentifier *)objectIdentifier enumerateRealizedClassInfosWithBlock:v7];
  }
  else
  {
    *(void *)&self->_objcClassStructureClassInfoIndex = -1;
    *(void *)&self->_swiftClassStructureClassInfoIndex = -1;
  }
}

void __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke_2;
  v7[3] = &unk_1E5D22FA0;
  v7[4] = v5;
  id v8 = v4;
  id v6 = v4;
  [v6 identifyObjCClassStructureBlocksWithScanner:v5 addressIdentifierBlock:v7];
}

uint64_t __57__VMUTaskMemoryScanner__identifyObjCClassStructureBlocks__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  if (!a2 || ([*(id *)(*(void *)(a1 + 32) + 8) addressIsInSharedCache:a2] & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = [*(id *)(a1 + 32) nodeForAddress:a2];
  uint64_t v9 = v8;
  if (v8 == -1) {
    return v9;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(v10 + 80);
  unint64_t v12 = *(void *)(v11 + 16 * v8 + 8);
  if ((v12 & 7) != 1) {
    return 0xFFFFFFFFLL;
  }
  if (*(unsigned char *)(v10 + 193))
  {
    if (*(void *)(v11 + 16 * v8) + 16 < a2
      || ((unint64_t v13 = *((unsigned int *)&VMUObjCClassStructureTypeInfoArray + 6 * a3 + 4),
           unint64_t v14 = (v12 >> 5) & 0xFFFFFFFFFLL,
           v13)
        ? (BOOL v15 = v14 > v13)
        : (BOOL v15 = 0),
          v15))
    {
      uint64_t v16 = objc_opt_new();
      *(unsigned char *)(v16 + 8) = a4;
      *(_DWORD *)(v16 + 12) = a3;
      objc_storeStrong((id *)(v16 + 16), *(id *)(a1 + 40));
      unint64_t v17 = *(void **)(*(void *)(a1 + 32) + 200);
      unint64_t v18 = [NSNumber numberWithUnsignedLongLong:a2];
      [v17 setObject:v16 forKeyedSubscript:v18];
    }
  }
  int v19 = [*(id *)(a1 + 40) infoType];
  uint64_t v20 = *(void *)(a1 + 32);
  if (v19 == 8 && (uint64_t v21 = *(void *)(v20 + 80), *(void *)(v21 + 16 * v9) + 16 < a2))
  {
    *(void *)(v21 + 16 * v9 + 8) = *(void *)(v21 + 16 * v9 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)*(unsigned int *)(v20 + 340) << 41);
    uint64_t v22 = *(void *)(a1 + 32);
    unsigned int v23 = *(_DWORD *)(v22 + 348);
    if (v23 >= v9) {
      unsigned int v23 = v9;
    }
    *(_DWORD *)(v22 + 348) = v23;
    uint64_t v24 = *(void *)(a1 + 32);
    if (!*(_DWORD *)(v24 + 348))
    {
      *(_DWORD *)(v24 + 348) = v9;
      uint64_t v24 = *(void *)(a1 + 32);
    }
    unsigned int v25 = *(_DWORD *)(v24 + 352);
    if (v25 <= v9) {
      unsigned int v25 = v9;
    }
    *(_DWORD *)(v24 + 352) = v25;
  }
  else
  {
    unsigned int v27 = [*(id *)(v20 + 64) classInfoIndexForObjCClassStructurePointerType:a3];
    uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 80) + 16 * v9;
    *(void *)(v28 + 8) = *(void *)(v28 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v27 << 41);
  }
  return v9;
}

- (void)printRuntimeMetadataInfo
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __48__VMUTaskMemoryScanner_printRuntimeMetadataInfo__block_invoke;
  v29[3] = &unk_1E5D22FF0;
  v29[4] = self;
  unint64_t v3 = (void (**)(void, void, void, void))MEMORY[0x1AD0DA230](v29, a2);
  id v4 = [(NSMutableDictionary *)self->_addressToRuntimeMetadataChunkInfoDict allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v26;
    unsigned int v23 = v3;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(obj);
        }
        unint64_t v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v14 = [(NSMutableDictionary *)self->_addressToRuntimeMetadataChunkInfoDict objectForKeyedSubscript:v13];
        unint64_t v15 = [v13 unsignedLongLongValue];
        uint64_t v16 = &self->_blocks[v10];
        if (v15 >= ((*((void *)v16 + 1) >> 5) & 0xFFFFFFFFFLL) + v16->var0)
        {
          uint64_t v20 = [(VMUTaskMemoryScanner *)self nodeForAddress:v15];
          uint64_t v21 = v14;

          uint64_t v8 = v21;
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
            int v19 = &self->_blocks[v10];
            uint64_t v22 = v18;
            uint64_t v11 = v17;
            unint64_t v3 = v23;
            printf("%s %#llx-%#llx[%llu]\n", v22, v19->var0, ((*((void *)v19 + 1) >> 5) & 0xFFFFFFFFFLL) + v19->var0, (*((void *)v19 + 1) >> 5) & 0xFFFFFFFFFLL);
            ((void (**)(void, uint64_t, unint64_t, id *))v3)[2](v3, v10, v9, v8);

            uint64_t v8 = 0;
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
    uint64_t v8 = 0;
  }
}

void __48__VMUTaskMemoryScanner_printRuntimeMetadataInfo__block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (char *)&VMUObjCClassStructureTypeInfoArray + 24 * a4[3];
  int v9 = *((_DWORD *)v8 + 4);
  strchr(*((char **)v8 + 1), 40);
  uint64_t v10 = a4;
  __strcpy_chk();
  *strchr(__s, 41) = 0;
  uint64_t v11 = a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a2);
  if (*((unsigned char *)v10 + 8)) {
    unint64_t v12 = "metaclass";
  }
  else {
    unint64_t v12 = "class";
  }
  unint64_t v13 = (void *)*((void *)v10 + 2);

  id v14 = [v13 className];
  printf("    +%5llu %#llx[%u]  %-13s  %s %s\n", v11, a3, v9, __s, v12, (const char *)[v14 UTF8String]);
}

- (void)_findSwiftClassesInExclaveCore
{
  if (self->_blocksCount)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = (uint64_t *)&self->_blocks[v3];
      if ((v5[1] & 0xFFFFFE0000000007) == 1)
      {
        if (vmu_swift_reflection_interop_ownsObject(*(void *)[(VMUObjectIdentifier *)self->_objectIdentifier swiftMirror]))
        {
          uint64_t v6 = vmu_swift_reflection_interop_metadataForObject(*(void *)[(VMUObjectIdentifier *)self->_objectIdentifier swiftMirror], *v5);
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = [(VMUClassInfoMap *)self->_classInfoIndexer classInfoForAddress:v6];

            if (!v8)
            {
              v14[0] = 0;
              v14[1] = 0;
              int v15 = 0;
              vmu_swift_reflection_infoForInstance(*(void *)[(VMUObjectIdentifier *)self->_objectIdentifier swiftMirror], *v5, (uint64_t)v14);
              if (LODWORD(v14[0]) == 17)
              {
                int v9 = [VMUMutableClassInfo alloc];
                classInfoIndexer = self->_classInfoIndexer;
                objectIdentifier = self->_objectIdentifier;
                unint64_t v12 = [(VMUObjectIdentifier *)objectIdentifier memoryReader];
                unint64_t v13 = [(VMUClassInfo *)v9 initWithClass:v7 type:8 infoMap:classInfoIndexer objectIdentifier:objectIdentifier reader:v12];

                [(VMUTaskMemoryScanner *)self applyTypeOverlayToMutableInfo:v13];
              }
            }
          }
        }
      }
      ++v4;
      ++v3;
    }
    while (v4 < self->_blocksCount);
  }
}

- (void)_fixupBlockIsas
{
  if ([(VMUTask *)self->_task isExclaveCore])
  {
    [(VMUTaskMemoryScanner *)self _findSwiftClassesInExclaveCore];
    [(VMUTaskMemoryScanner *)self _updateLinearClassInfos];
  }
  unint64_t blocksCount = self->_blocksCount;
  if (blocksCount)
  {
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t regionDescriptionOptions = self->_regionDescriptionOptions;
    LODWORD(v7) = -1;
    do
    {
      blocks = self->_blocks;
      unint64_t v9 = *((void *)&blocks[v4] + 1);
      if ((v9 & 7) == 1)
      {
        unint64_t var0 = blocks[v4].var0;
        if (var0 >= v5)
        {
          uint64_t v11 = ((uint64_t)(int)v7 << 6) + 64;
          uint64_t v12 = (int)v7 + 1;
          do
          {
            if (v12 >= (int)self->_regionsCount)
            {
              unint64_t v6 = -1;
              unint64_t v5 = -1;
            }
            else
            {
              unint64_t v13 = (unint64_t *)(*(char **)((char *)&self->_regions->var0 + v11) + 8);
              unint64_t v6 = *v13;
              unint64_t v5 = (*(void **)((char *)&self->_regions->var0 + v11))[2] + *v13;
            }
            LODWORD(v7) = v7 + 1;
            v11 += 64;
            ++v12;
          }
          while (var0 >= v5);
        }
        unint64_t v14 = var0 + ((v9 >> 5) & 0xFFFFFFFFFLL);
        if (v14 > v6)
        {
          uint64_t v15 = (uint64_t)(int)v7 << 6;
          uint64_t v7 = (int)v7;
          regions = self->_regions;
          do
          {
            uint64_t v17 = &self->_blocks[v4];
            unint64_t v18 = *((void *)v17 + 1);
            if ((v18 & 0x18) == 8)
            {
              if (s_enumeratorDebugging)
              {
                int v25 = (*(_DWORD **)((char *)&regions->var0 + v15))[37];
                unint64_t v26 = v18 >> 41;
                if (v25 != -1 && v25 != v26)
                {
                  fprintf((FILE *)*MEMORY[0x1E4F143C8], "warning: zone fixup failed - block %#llx from zone \"%s\" discovered in region [%#llx-%#llx] already claimed by \"%s\"\n", v17->var0, (const char *)[self->_zones[v26].var1 UTF8String], v6, v5, (const char *)[objc_retainAutorelease(self->_zones[(*(unsigned int **)((char *)&self->_regions->var0+ v15))[37]].var1) UTF8String]);
                  unint64_t v18 = *((void *)&self->_blocks[v4] + 1);
                  regions = self->_regions;
                }
              }
              uint64_t v19 = *(uint64_t *)((char *)&regions->var0 + v15);
              *(_DWORD *)(v19 + 148) = v18 >> 41;
              if (![*(id *)(v19 + 40) length])
              {
                uint64_t v20 = [(NSMutableArray *)self->_zoneNames objectAtIndexedSubscript:*((void *)&self->_blocks[v4] + 1) >> 41];
                uint64_t v21 = *(uint64_t *)((char *)&self->_regions->var0 + v15);
                uint64_t v22 = *(void **)(v21 + 40);
                *(void *)(v21 + 40) = v20;

                if ((regionDescriptionOptions & 0x800000) != 0)
                {
                  id v23 = [*(id *)((char *)&self->_regions->var0 + v15) description];
                  printf("Setting region name in %s based on _zoneNames[_blocks[i].isa_index for  %s\n", "-[VMUTaskMemoryScanner _fixupBlockIsas]", (const char *)[v23 UTF8String]);
                }
              }
              *((void *)&self->_blocks[v4] + 1) &= 0x1FFFFFFFFFFuLL;
              *((void *)&self->_blocks[v4] + 1) &= 0xFFFFFFFFFFFFFFE7;
              regions = self->_regions;
            }
            uint64_t v24 = *(uint64_t *)((char *)&regions->var0 + v15);
            ++*(void *)(v24 + 136);
            *(_DWORD *)(v24 + 144) |= 1u;
            if (v14 <= v5) {
              break;
            }
            if (++v7 >= (int)self->_regionsCount)
            {
              unint64_t v6 = -1;
              unint64_t v5 = -1;
              break;
            }
            unint64_t v6 = (*(void **)((char *)&regions[1].var0 + v15))[1];
            unint64_t v5 = (*(void **)((char *)&regions[1].var0 + v15))[2] + v6;
            v15 += 64;
          }
          while (v14 > v6);
          unint64_t blocksCount = self->_blocksCount;
        }
      }
      ++v4;
    }
    while (v4 < blocksCount);
  }
  self->_initializedRegionMallocBlockCounts = 1;
  long long v28 = [(VMUObjectIdentifier *)self->_objectIdentifier memoryReader];
  uint64_t v29 = [(VMUObjectIdentifier *)self->_objectIdentifier swiftRuntimeInfoStableABI];
  unint64_t v30 = v29;
  if (v29)
  {
    id v31 = v29;
  }
  else
  {
    id v31 = [(VMUObjectIdentifier *)self->_objectIdentifier swiftRuntimeInfoPreABI];
  }
  unint64_t v32 = v31;

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke;
  v36[3] = &unk_1E5D23090;
  id v37 = v32;
  id v38 = v28;
  v36[4] = self;
  id v33 = v32;
  id v34 = v28;
  [(VMUTaskMemoryScanner *)self _withOrderedNodeMapper:v36];
  [(VMUTaskMemoryScanner *)self _identifySwiftTypeNameCache];
  [(VMUTaskMemoryScanner *)self _updateLinearClassInfos];
  [(VMUTaskMemoryScanner *)self _identifyObjCClassStructureBlocks];
  [(VMUTaskMemoryScanner *)self _identifyNonObjectsPointingToSwiftMetadata];
  [(VMUTaskMemoryScanner *)self _identifySwiftAsyncTaskSlabs];
  [(VMUTaskMemoryScanner *)self _identifyAttributeGraphAllocations];
  [(VMUTaskMemoryScanner *)self _updateLinearClassInfos];
  [(VMUTaskMemoryScanner *)self _identifyNonObjectsPointedToByTypedIvars];
  [(VMUTaskMemoryScanner *)self _updateLinearClassInfos];
  [(VMUTaskMemoryScanner *)self _identifyNonObjectsUsingStackBacktrace];
  [(VMUTaskMemoryScanner *)self _updateLinearClassInfos];
  mergesort_b(self->_instanceValues, self->_instanceValuesCount, 0x10uLL, &__block_literal_global_177);
}

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 8;
    do
    {
      if ((*(void *)(*(void *)(v2 + 80) + v6) & 0xFFFFFE0000000007) == 1)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_2;
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
    while (v5 < *(unsigned int *)(v2 + 88));
  }
}

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 80);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  if (HIDWORD(*(void *)(v6 + 16 * v7))) {
    BOOL v8 = (*(void *)(v6 + 16 * v7) & 7) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8
    && (v9 = [*(id *)(v5 + 64) classInfoForMemory:a2 length:*(void *)(v6 + 16 * v7 + 8) >> 5 remoteAddress:v9], v9 != 0)
  {
    int v10 = v9;
    if ([v9 hasSpecificLayout])
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 272) indexForClassInfo:v10];
      uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 512);
      unint64_t v13 = [NSNumber numberWithUnsignedInt:v11];
      unint64_t v14 = [v12 objectForKeyedSubscript:v13];

      if (!v14)
      {
        unint64_t v14 = objc_opt_new();
        uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 512);
        uint64_t v16 = [NSNumber numberWithUnsignedInt:v11];
        [v15 setObject:v14 forKeyedSubscript:v16];
      }
      uint64_t v17 = (void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 56));
      uint64_t v18 = [v10 instanceSpecificInfoForObject:*v17 ofSize:v17[1] >> 5 withScanner:v17[2] memoryReader:v17[3]];

      int v10 = (void *)v18;
    }
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_3;
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
    unsigned int v23 = [*(id *)(*(void *)(a1 + 32) + 272) indexForClassInfo:v22];
    uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 56);
    *(void *)(v24 + 8) = *(void *)(v24 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)v23 << 41);
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(*(void *)(v25 + 80) + 16 * *(unsigned int *)(a1 + 56) + 8) >> 5;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_4;
    v28[3] = &unk_1E5D23040;
    v28[4] = v25;
    [v22 enumerateExternalValuesFromObject:a2 withSize:v26 block:v28];
  }
  else
  {
    uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 56);
    *(void *)(v27 + 8) &= 0x1FFFFFFFFFFuLL;
  }
}

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_3(uint64_t a1, void *a2, unsigned int a3, int a4)
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
      if ([v9 usesSwiftRefcounting] && [v9 pointerSize] == a3)
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
  uint64_t v16 = *(uint64_t **)(*(void *)(a1 + 48) + 112);
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
  unint64_t v52 = (id *)(v51 + 64);
  unint64_t v53 = *((unsigned int *)v16 + 10) - ((uint64_t)(v51 + 64 - v16[4]) >> 6);
  if (!v53) {
    goto LABEL_82;
  }
  while (2)
  {
    unint64_t v54 = v53 >> 1;
    uint64_t v55 = &v52[8 * (v53 >> 1)];
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
    unint64_t v52 = v55 + 8;
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
      uint64_t v36 = (void *)(v33 + 16 * (v31 + v34 - 1));
      if (((v36[1] >> 5) & 0xFFFFFFFFFuLL) + *v36 <= v6) {
        return;
      }
      id v37 = (unsigned int *)(v32 + 4 * ((v6 - (*v35 & -*MEMORY[0x1E4F14B00])) >> *v21));
      uint64_t v38 = *v37;
      uint64_t v39 = (unint64_t *)(v33 + 16 * v38);
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
        uint64_t v63 = *(void *)(*(void *)(a1 + 48) + 80);
        if (v63)
        {
          uint64_t v64 = (v58 >> 4);
          if (*(void *)(v63 + 16 * v64) == v6)
          {
            uint64_t v65 = v63 + 16 * v64;
            uint64_t v67 = *(void *)(v65 + 8);
            uint64_t v66 = (unint64_t *)(v65 + 8);
            if ((v67 & 7) == 1)
            {
              unint64_t v68 = (void *)MEMORY[0x1AD0D9F90]();
              uint64_t v69 = [a2 instanceSpecificInfoForObject:v6 ofSize:*v66 >> 5 withScanner:*(void *)(a1 + 48) memoryReader:*(void *)(a1 + 56)];
              if (v69) {
                *uint64_t v66 = *v66 & 0x1FFFFFFFFFFLL | ((unint64_t)[*(id *)(*(void *)(a1 + 48) + 272) indexForClassInfo:v69] << 41);
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
            unint64_t v41 = &v39[2 * v44];
            unint64_t v42 = *v41;
            if (*v41 <= v6)
            {
              if (((v39[2 * v44 + 1] >> 5) & 0xFFFFFFFFFLL) + v42 > v6) {
                goto LABEL_63;
              }
              uint64_t v39 = v41 + 2;
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
        unint64_t v41 = &v35[2 * v46];
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

void __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = *(uint64_t **)(*(void *)(a1 + 32) + 112);
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
          goto LABEL_72;
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
                                goto LABEL_72;
                              }
                              unint64_t v48 = (unint64_t)v31 - v23;
                              unint64_t v49 = ((unint64_t)v31 - v23) >> 4;
                              unint64_t v50 = a2 - v32;
                              unint64_t v51 = v6[2];
                              if (v50 >= v51)
                              {
                                if (((v47 >> 5) & 0xFFFFFFFFFLL) - v50 > v51 || v49 == -1) {
                                  goto LABEL_72;
                                }
                              }
                              else if (v49 == -1)
                              {
                                goto LABEL_72;
                              }
                              uint64_t v53 = *(void *)(a1 + 32);
                              uint64_t v54 = *(void *)(v53 + 80);
                              if (v54)
                              {
                                uint64_t v55 = (v48 >> 4);
                                if ((*(void *)(v54 + 16 * v55 + 8) & 7) == 1)
                                {
                                  unsigned int v56 = *(_DWORD *)(v53 + 248);
                                  uint64_t v57 = *(unsigned int *)(v53 + 252);
                                  if (v57 <= v56)
                                  {
                                    int v60 = 2 * v57;
                                    if ((2 * v57) <= 0x10) {
                                      int v60 = 16;
                                    }
                                    *(_DWORD *)(v53 + 252) = v60;
                                    uint64_t v61 = *(void *)(a1 + 32);
                                    uint64_t v63 = (_DWORD *)(v61 + 252);
                                    unsigned int v62 = *(_DWORD *)(v61 + 252);
                                    for (id i = v5; v62 < *(_DWORD *)(v61 + 248); v62 = *(_DWORD *)(v61 + 252))
                                    {
                                      *uint64_t v63 = 2 * v62;
                                      uint64_t v61 = *(void *)(a1 + 32);
                                      uint64_t v63 = (_DWORD *)(v61 + 252);
                                    }
                                    *(void *)(*(void *)(a1 + 32) + 240) = malloc_type_realloc(*(void **)(v61 + 240), 16 * v62, 0x108004057E67DB5uLL);
                                    uint64_t v64 = *(void *)(a1 + 32);
                                    uint64_t v58 = *(void *)(v64 + 240);
                                    if (!v58)
                                    {
                                      NSLog(&cfstr_OutOfMemoryFai.isa, "_instanceValues", v57, *(unsigned int *)(v64 + 252));
                                      abort();
                                    }
                                    unsigned int v56 = *(_DWORD *)(v64 + 248);
                                    id v5 = i;
                                  }
                                  else
                                  {
                                    uint64_t v58 = *(void *)(v53 + 240);
                                  }
                                  uint64_t v65 = (void *)(v58 + 16 * v56);
                                  *uint64_t v65 = v55;
                                  v65[1] = 0;
                                  ++*(_DWORD *)(*(void *)(a1 + 32) + 248);
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
                  goto LABEL_72;
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
LABEL_72:
}

uint64_t __39__VMUTaskMemoryScanner__fixupBlockIsas__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

- (void)_identifySwiftTypeNameCache
{
  BOOL v3 = [(VMUTask *)self->_task isExclaveCore];
  [(VMUObjectIdentifier *)self->_objectIdentifier symbolicator];
  if (v3) {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwner();
  }
  else {
    uint64_t SymbolOwner = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  uint64_t v6 = SymbolOwner;
  uint64_t v7 = v5;
  if (CSIsNull()) {
    return;
  }
  unint64_t v65 = 0;
  unint64_t v8 = [(VMUObjectIdentifier *)self->_objectIdentifier memoryReader];
  _copy_remote_mangled_symbol_value(v8, (uint64_t)"__ZL13TypeNameCache", v6, v7, 8uLL, &v65);

  unint64_t v9 = v65;
  if (!v65) {
    return;
  }
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  unint64_t v13 = var7 - var6;
  BOOL v14 = var7 < var6;
  if (v65 - var6 >= v13 || v14) {
    return;
  }
  uint64_t v15 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v16 = v65 >> *MEMORY[0x1E4F14AF8];
  if (v16)
  {
    var3 = (unsigned int *)regionMap->var3;
    unint64_t v18 = v65 >> *MEMORY[0x1E4F14AF8];
    do
    {
      if (*var3 <= (v18 & 0x3FFFFFF)
        || ((*((unsigned __int8 *)var3 + ((v18 & 0x3FFFFFF) >> 3) + 4) >> (v18 & 7)) & 1) == 0)
      {
        return;
      }
      v18 >>= 26;
    }
    while (v18);
  }
  uint64_t v19 = (char *)regionMap + 4 * (v16 & 0x7FFFF);
  int v22 = *((_DWORD *)v19 + 16);
  unsigned int v21 = v19 + 64;
  int v20 = v22;
  unint64_t var4 = regionMap->var4;
  if (v22)
  {
    uint64_t v24 = &var4[(unint64_t)(v20 - 1)];
    if (v65 - *((void *)v24->var0 + 1) < *((void *)v24->var0 + 2)) {
      goto LABEL_15;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    return;
  }
  unint64_t v42 = regionMap->var4;
  while (1)
  {
    unint64_t v43 = var5 >> 1;
    uint64_t v24 = &v42[var5 >> 1];
    if (*((void *)v24->var0 + 1) <= v65) {
      break;
    }
LABEL_38:
    BOOL v39 = var5 >= 2;
    unint64_t var5 = v43;
    if (!v39) {
      return;
    }
  }
  if (*((void *)v24->var0 + 2) + *((void *)v24->var0 + 1) <= v65)
  {
    unint64_t v42 = v24 + 1;
    unint64_t v43 = --var5 >> 1;
    goto LABEL_38;
  }
  int v44 = [v24->var0 isSpecialPhysFootprintRegion];
  if (v44) {
    unint64_t v45 = 0;
  }
  else {
    unint64_t v45 = (unint64_t)v24;
  }
  if (v44) {
    return;
  }
  if ((*(unsigned char *)(*(void *)v45 + 132) & 1) == 0) {
    goto LABEL_71;
  }
  BOOL v46 = (id *)(v45 + 64);
  unint64_t v47 = regionMap->var5 - ((uint64_t)(v45 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v47) {
    goto LABEL_68;
  }
  while (2)
  {
    unint64_t v48 = v47 >> 1;
    unint64_t v49 = &v46[8 * (v47 >> 1)];
    if (*((void *)*v49 + 1) > v9)
    {
LABEL_49:
      BOOL v50 = v47 > 1;
      unint64_t v47 = v48;
      if (!v50)
      {
        unint64_t v47 = 0;
        goto LABEL_68;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v49 + 2) + *((void *)*v49 + 1) <= v9)
  {
    BOOL v46 = v49 + 8;
    unint64_t v48 = --v47 >> 1;
    goto LABEL_49;
  }
  unint64_t v63 = v45;
  int v64 = [*v49 isSpecialPhysFootprintRegion];
  unint64_t v45 = v63;
  if (v64) {
    unint64_t v47 = 0;
  }
  else {
    unint64_t v47 = (unint64_t)v49;
  }
LABEL_68:
  if (v47) {
    unint64_t v45 = v47;
  }
  uint64_t v24 = (_VMURegionNode *)v45;
LABEL_71:
  *unsigned int v21 = ((v45 - (unint64_t)var4) >> 6) + 1;
LABEL_15:
  unsigned int v25 = v24->var3;
  if (v25)
  {
    var1 = v24->var1;
    unint64_t var0 = regionMap->var0;
    uint64_t var2 = v24->var2;
    uint64_t v29 = &regionMap->var0[var2];
    if (var1)
    {
      if (v29->var0 > v9) {
        return;
      }
      uint64_t v30 = &var0[v25 - 1 + var2];
      if (((*((void *)v30 + 1) >> 5) & 0xFFFFFFFFFLL) + v30->var0 <= v9) {
        return;
      }
      unsigned int v31 = &var1[(v9 - (v29->var0 & -*MEMORY[0x1E4F14B00])) >> *v15];
      uint64_t v32 = *v31;
      p_unint64_t var0 = &var0[v32].var0;
      if (*p_var0 > v9) {
        return;
      }
      uint64_t v34 = v31[1];
      if (v34 < regionMap->var1)
      {
        BOOL v35 = &var0[v34].var0;
        unint64_t v36 = *v35;
        if (*v35 <= v9)
        {
LABEL_51:
          unint64_t v51 = v35[1];
          if ((v51 & 7) - 2 < 3) {
            return;
          }
          int64_t v52 = (char *)v35 - (char *)var0;
          unint64_t v53 = (unint64_t)((char *)v35 - (char *)var0) >> 4;
          unint64_t v54 = v9 - v36;
          unint64_t v55 = regionMap->var2;
          if (v54 >= v55)
          {
            if (((v51 >> 5) & 0xFFFFFFFFFLL) - v54 > v55 || v53 == -1) {
              return;
            }
          }
          else if (v53 == -1)
          {
            return;
          }
          unsigned int v56 = [VMUClassInfo alloc];
          uint64_t v57 = NSString;
          uint64_t Path = CSSymbolOwnerGetPath();
          if (Path) {
            int v59 = (const char *)Path;
          }
          else {
            int v59 = "";
          }
          int v60 = [v57 stringWithUTF8String:v59];
          uint64_t v61 = [(VMUClassInfo *)v56 initWithClassName:@"llvm::DenseMap<TypeNameCacheKey, std::pair<const char *, size_t>>" binaryPath:v60 type:2];

          *(void *)((char *)self->_blocks + (v52 & 0xFFFFFFFF0) + 8) = *(void *)((char *)self->_blocks
                                                                                     + (v52 & 0xFFFFFFFF0)
                                                                                     + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)[(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:v61] << 41);

          return;
        }
      }
      unsigned int v37 = v34 - v32;
      if (v37)
      {
        do
        {
          uint64_t v38 = v37 >> 1;
          BOOL v35 = &p_var0[2 * v38];
          unint64_t v36 = *v35;
          if (*v35 <= v9)
          {
            if (((p_var0[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + v36 > v9) {
              goto LABEL_51;
            }
            p_unint64_t var0 = v35 + 2;
            LODWORD(v38) = --v37 >> 1;
          }
          BOOL v39 = v37 >= 2;
          unsigned int v37 = v38;
        }
        while (v39);
      }
    }
    else
    {
      do
      {
        uint64_t v40 = v25 >> 1;
        BOOL v35 = &v29[v40].var0;
        unint64_t v36 = *v35;
        if (*v35 <= v9)
        {
          if (((*((void *)&v29[v40] + 1) >> 5) & 0xFFFFFFFFFLL) + v36 > v9) {
            goto LABEL_51;
          }
          uint64_t v29 = (_VMUBlockNode *)(v35 + 2);
          LODWORD(v40) = --v25 >> 1;
        }
        BOOL v39 = v25 >= 2;
        unsigned int v25 = v40;
      }
      while (v39);
    }
  }
}

- (void)_identifyNonObjectsPointedToByTypedIvars
{
  unsigned int classInfosCount = self->_classInfosCount;
  unint64_t v4 = malloc_type_calloc(1uLL, ((classInfosCount + 8) >> 3) + 4, 0xFF42C4F3uLL);
  *unint64_t v4 = classInfosCount + 1;
  classInfoIndexer = self->_classInfoIndexer;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke;
  v12[3] = &__block_descriptor_40_e32_v36__0Q8__VMUClassInfo_16I24_B28l;
  void v12[4] = v4;
  [(VMUClassInfoMap *)classInfoIndexer enumerateInfosWithBlock:v12];
  uint64_t v6 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:1282];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_2;
  v8[3] = &unk_1E5D23128;
  unsigned int v11 = classInfosCount;
  id v9 = v6;
  BOOL v10 = v4;
  v8[4] = self;
  id v7 = v6;
  [(VMUTaskMemoryScanner *)self _withOrderedNodeMapper:v8];
  free(v4);
}

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned int a4)
{
  id v9 = a3;
  if ([v9 infoType] != 1
    && [v9 infoType] != 128
    && [v9 infoType] != 8
    || ([v9 className],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
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

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 8;
    do
    {
      uint64_t v7 = *(void *)(*(void *)(v2 + 80) + v6) >> 41;
      if ((*(void *)(*(void *)(v2 + 80) + v6) & 7) == 1
        && v7 != 0
        && *(_DWORD *)(a1 + 56) > v7)
      {
        id v9 = *(_DWORD **)(a1 + 48);
        if (*v9 <= v7 || ((*((unsigned __int8 *)v9 + (v7 >> 3) + 4) >> (v7 & 7)) & 1) == 0)
        {
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_3;
          v12[3] = &unk_1E5D23100;
          void v12[4] = v2;
          int v15 = v7;
          id v10 = *(id *)(a1 + 40);
          uint64_t v11 = *(void *)(a1 + 48);
          id v13 = v10;
          uint64_t v14 = v11;
          (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, 1, v12);

          uint64_t v2 = *(void *)(a1 + 32);
        }
      }
      ++v5;
      v6 += 16;
    }
    while (v5 < *(unsigned int *)(v2 + 88));
  }
}

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 256) + 8 * *(unsigned int *)(a1 + 56));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_4;
  v10[3] = &unk_1E5D230D8;
  id v13 = &v15;
  uint64_t v14 = a2;
  uint64_t v6 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v7 = v5;
  id v12 = v7;
  -[VMUClassInfo enumerateAllPointerFieldsWithBlock:](v7, (uint64_t)v10);
  if (!*((unsigned char *)v16 + 24))
  {
    unint64_t v8 = *(_DWORD **)(a1 + 48);
    unint64_t v9 = *(unsigned int *)(a1 + 56);
    if (*v8 > v9) {
      *((unsigned char *)v8 + (v9 >> 3) + 4) |= 1 << (v9 & 7);
    }
  }

  _Block_object_dispose(&v15, 8);
}

void __64__VMUTaskMemoryScanner__identifyNonObjectsPointedToByTypedIvars__block_invoke_4(uint64_t a1, void *a2, void *a3, uint64_t a4)
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
  id v11 = *(uint64_t **)(*(void *)(a1 + 32) + 112);
  unint64_t v13 = v11[6];
  unint64_t v12 = v11[7];
  unint64_t v14 = v12 - v13;
  BOOL v15 = v12 < v13;
  if (v9 - v13 >= v14 || v15) {
    return;
  }
  unint64_t v16 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v17 = v9 >> *MEMORY[0x1E4F14AF8];
  if (v17)
  {
    char v18 = (unsigned int *)v11[3];
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
  unint64_t v16 = (_DWORD *)MEMORY[0x1E4F14AF8];
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
    BOOL v50 = &v47[8 * (v48 >> 1)];
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
  unint64_t v16 = (_DWORD *)MEMORY[0x1E4F14AF8];
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
      uint64_t v32 = (unsigned int *)(v27 + 4 * ((v9 - (*v30 & -*MEMORY[0x1E4F14B00])) >> *v16));
      uint64_t v33 = *v32;
      uint64_t v34 = (unint64_t *)(v28 + 16 * v33);
      if (*v34 > v9) {
        return;
      }
      uint64_t v35 = v32[1];
      if (v35 < *((_DWORD *)v11 + 2))
      {
        unint64_t v36 = (unint64_t *)(v28 + 16 * v35);
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
          uint64_t v58 = *(void *)(*(void *)(a1 + 32) + 80);
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
          unint64_t v63 = NSMapGet(*(NSMapTable **)(a1 + 40), a3);
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
              uint64_t v67 = [a3 typeName];
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

            unint64_t v71 = NSString;
            uint64_t v72 = [*(id *)(a1 + 48) displayName];
            uint64_t v73 = (void *)v72;
            __int16 v74 = @"malloc";
            if (v70) {
              __int16 v74 = v70;
            }
            unsigned int v75 = [v71 stringWithFormat:@"%@.%@ (%@)", v72, v79, v74];

            __int16 v76 = [*(id *)(a1 + 48) binaryPath];
            unint64_t v77 = +[VMUClassInfo classInfoWithClassName:v75 binaryPath:v76 type:v80];

            unint64_t v78 = [*(id *)(*(void *)(a1 + 32) + 272) indexForClassInfo:v77];
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
          unint64_t v36 = &v34[2 * v39];
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
        unint64_t v36 = &v30[2 * v41];
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

- (void)_identifyNonObjectsPointingToSwiftMetadata
{
  BOOL v3 = [(VMUTask *)self->_task isExclaveCore];
  [(VMUObjectIdentifier *)self->_objectIdentifier symbolicator];
  if (v3) {
    CSSymbolicatorGetSymbolOwner();
  }
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  if ((CSIsNull() & 1) != 0 || (CSSymbolOwnerGetSymbolWithMangledName(), CSIsNull()))
  {
    [(VMUTask *)self->_task isExclaveCore];
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t Range = CSSymbolGetRange();
    uint64_t v4 = v6;
    [(VMUTask *)self->_task isExclaveCore];
    if (Range) {
      goto LABEL_10;
    }
  }
  if (!self->_swiftMetadataMaxBlockIndex) {
    return;
  }
  uint64_t Range = 0;
LABEL_10:
  uint64_t v7 = +[VMUClassInfo classInfoWithClassName:@"Swift HeapGenericLocalVariable" binaryPath:@"/usr/lib/swift/libswiftCore.dylib" type:16];
  self->_swiftHeapGenericLocalVariableClassInfoIndex = [(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:v7];
  unsigned int swiftMetadataMinBlockIndex = self->_swiftMetadataMinBlockIndex;
  unsigned int swiftMetadataMaxBlockIndex = self->_swiftMetadataMaxBlockIndex;
  if (swiftMetadataMinBlockIndex <= swiftMetadataMaxBlockIndex)
  {
    unsigned int v11 = 0;
    uint64_t v12 = 0;
    BOOL v10 = 0;
    do
    {
      blocks = self->_blocks;
      uint64_t v14 = swiftMetadataMinBlockIndex;
      unint64_t v15 = *((void *)&blocks[swiftMetadataMinBlockIndex] + 1);
      if ((v15 & 7) == 1 && self->_swiftMetadataClassInfoIndex == v15 >> 41)
      {
        if (v12 <= v11)
        {
          LODWORD(v17) = 2 * v12;
          if ((2 * v12) <= 0x100) {
            uint64_t v17 = 256;
          }
          else {
            uint64_t v17 = v17;
          }
          do
          {
            uint64_t v16 = v17;
            uint64_t v17 = (2 * v17);
          }
          while (v16 < v11);
          char v18 = (_VMUBlockNode *)malloc_type_realloc(v10, 16 * v16, 0x1000040451B5BE8uLL);
          if (!v18)
          {
            NSLog(&cfstr_OutOfMemoryFai.isa, "swiftMetadataBlocks", v12, v16);
            abort();
          }
          BOOL v10 = v18;
          bzero(&v18[v12], 16 * (v16 - v12));
          blocks = self->_blocks;
        }
        else
        {
          uint64_t v16 = v12;
        }
        v10[v11++] = blocks[v14];
        unsigned int swiftMetadataMaxBlockIndex = self->_swiftMetadataMaxBlockIndex;
        uint64_t v12 = v16;
      }
      unsigned int swiftMetadataMinBlockIndex = v14 + 1;
    }
    while ((int)v14 + 1 <= swiftMetadataMaxBlockIndex);
  }
  else
  {
    BOOL v10 = 0;
    unsigned int v11 = 0;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke;
  v19[3] = &unk_1E5D23178;
  v19[4] = self;
  v19[5] = Range;
  v19[6] = v4;
  v19[7] = v10;
  unsigned int v20 = v11;
  [(VMUTaskMemoryScanner *)self _withOrderedNodeMapper:v19];
  if (v10) {
    free(v10);
  }
}

uint64_t __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    uint64_t v4 = result;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    uint64_t v7 = (long long *)(result + 40);
    do
    {
      uint64_t v8 = *(void *)(v2 + 80) + v5;
      if ((*(void *)(v8 + 8) & 0xFFFFFE0000000007) == 1)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke_2;
        v10[3] = &unk_1E5D23150;
        long long v11 = *v7;
        uint64_t v9 = *(void *)(v4 + 56);
        v10[4] = v2;
        uint64_t v12 = v9;
        uint64_t v13 = v8;
        int v14 = *(_DWORD *)(v4 + 64);
        uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v6, 1, v10);
        uint64_t v2 = *(void *)(v4 + 32);
      }
      ++v6;
      v5 += 16;
    }
    while (v6 < *(unsigned int *)(v2 + 88));
  }
  return result;
}

void __66__VMUTaskMemoryScanner__identifyNonObjectsPointingToSwiftMetadata__block_invoke_2(uint64_t a1, uint64_t *a2)
{
  unint64_t v3 = -[VMUTask ptrauthStripDataPointer:](*(void *)(*(void *)(a1 + 32) + 8), *a2);
  if (HIDWORD(v3)) {
    BOOL v4 = (v3 & 7) == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    unint64_t v5 = v3;
    if (v3 - *(void *)(a1 + 40) >= *(void *)(a1 + 48))
    {
      unsigned int v8 = *(_DWORD *)(a1 + 72);
      if (v8)
      {
        uint64_t v9 = *(void **)(a1 + 56);
        do
        {
          uint64_t v10 = v8 >> 1;
          long long v11 = &v9[2 * v10];
          if (*v11 <= v3)
          {
            if (((v9[2 * v10 + 1] >> 5) & 0xFFFFFFFFFLL) + *v11 > v3) {
              goto LABEL_7;
            }
            uint64_t v9 = v11 + 2;
            LODWORD(v10) = --v8 >> 1;
          }
          BOOL v12 = v8 >= 2;
          unsigned int v8 = v10;
        }
        while (v12);
      }
    }
    else
    {
LABEL_7:
      uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 64) memoryReader];
      unint64_t v6 = (uint64_t *)v13[2](v13, v5, 8);
      if (v6)
      {
        uint64_t v7 = *v6;

        if (v7 == 1280) {
          *(void *)(*(void *)(a1 + 64) + 8) = *(void *)(*(void *)(a1 + 64) + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)*(unsigned int *)(*(void *)(a1 + 32) + 344) << 41);
        }
      }
      else
      {
      }
    }
  }
}

- (id)_recursivelyIdentifySwiftAsyncTaskSlabs:(unint64_t)a3 containerRange:(_VMURange)a4 remoteBlock:(unint64_t)a5 mappedBlock:(unint64_t)a6 asyncTaskSlabMetadataIsa:(unint64_t)a7 nestingLevel:(unsigned int)a8
{
  unint64_t length = a4.length;
  unint64_t location = a4.location;
  long long v38 = 0u;
  long long v39 = 0u;
  vmu_reflection_interop_asyncTaskSlabAllocations(*(void *)[(VMUObjectIdentifier *)self->_objectIdentifier swiftMirror], &v38);
  if ((void)v38)
  {
    if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
      dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
    }
    if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1) {
      _debugSwiftAsyncPrintf(a8, "Bailing because vmu_reflection_interop_asyncTaskSlabAllocations error: %s\n");
    }
LABEL_31:
    id v29 = 0;
    goto LABEL_32;
  }
  uint64_t v15 = v39;
  if (!VMURangeContainsRange(location, length, a3, v39))
  {
    if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
      dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
    }
    if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1) {
      _debugSwiftAsyncPrintf(a8, "Bailing because slab %p [%llu] does not fit inside container\n");
    }
    goto LABEL_31;
  }
  if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
    dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
  }
  unint64_t v37 = self;
  if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1) {
    _debugSwiftAsyncPrintf(a8, "Slab %p [%llu], next slab %p\n", (const void *)a3, v15, *((const void **)&v38 + 1));
  }
  uint64_t v16 = [VMUMutableFieldInfo alloc];
  uint64_t v17 = [(VMUFieldInfo *)v16 initWithName:@"slab" type:0 scan:0 offset:(a3 - location) size:v39];
  char v18 = (void *)v17;
  if (DWORD1(v39))
  {
    uint64_t v19 = 0;
    uint64_t v32 = v15;
    unint64_t v33 = a3;
    uint64_t v34 = (void *)v17;
    while (2)
    {
      unsigned int v20 = (void *)MEMORY[0x1AD0D9F90]();
      uint64_t v21 = *((void *)&v39 + 1) + 16 * v19;
      unint64_t v22 = *(void *)v21;
      uint64_t v23 = *(unsigned int *)(v21 + 8);
      if (!VMURangeContainsRange(a3, v15, *(void *)v21, v23))
      {
        id v29 = 0;
        goto LABEL_37;
      }
      if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
        dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
      }
      uint64_t v35 = v19;
      context = v20;
      if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
      {
        VMURangeDescription(v22, v23);
        id v24 = objc_claimAutoreleasedReturnValue();
        _debugSwiftAsyncPrintf(a8 + 1, "Chunk %s\n", (const char *)[v24 UTF8String]);
      }
      unint64_t v25 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"chunk" type:0 scan:1 offset:(v22 - a3) size:v23];
      [v18 addSubField:v25];
      unint64_t v26 = ((v22 + 7) & 0xFFFFFFFFFFFFFFF8) - a5;
      while (v26 <= v22 - a5 + v23 - 8)
      {
        if (!VMURangeContainsRange(v22, v23, v26 + a5, 8)) {
          goto LABEL_35;
        }
        if (*(void *)(v26 + a6) == a7)
        {
          LODWORD(v31) = a8 + 2;
          uint64_t v27 = -[VMUTaskMemoryScanner _recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:](v37, "_recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:", v26 + a5, v22, v23, a5, a6, a7, v31);
          if (!v27)
          {
LABEL_35:

            id v29 = 0;
            char v18 = v34;
            goto LABEL_37;
          }
          uint64_t v28 = (void *)v27;
          [(VMUMutableFieldInfo *)v25 addSubField:v27];
          unint64_t v26 = ((v26 + a5 + [v28 size] + 7) & 0xFFFFFFFFFFFFFFF8) - a5;
        }
        else
        {
          v26 += 8;
        }
      }

      char v18 = v34;
      uint64_t v19 = v35 + 1;
      uint64_t v15 = v32;
      a3 = v33;
      if (v35 + 1 < (unint64_t)DWORD1(v39)) {
        continue;
      }
      break;
    }
  }
  id v29 = v18;
LABEL_37:

LABEL_32:

  return v29;
}

- (void)_identifyAttributeGraphAllocations
{
  BOOL v3 = [(VMUTask *)self->_task isExclaveCore];
  [(VMUObjectIdentifier *)self->_objectIdentifier symbolicator];
  if (v3) {
    CSSymbolicatorGetSymbolOwner();
  }
  else {
    CSSymbolicatorGetSymbolOwnerWithNameAtTime();
  }
  if ((CSIsNull() & 1) == 0)
  {
    id v22 = [(NSMutableArray *)self->_zoneNames indexesOfObjectsPassingTest:&__block_literal_global_223];
    if ([v22 count] && self->_regionsCount)
    {
      unint64_t v4 = 0;
      unsigned int v5 = -1;
      do
      {
        regions = self->_regions;
        uint64_t v7 = (unsigned int *)regions[v4].var0;
        if ([v22 containsIndex:v7[37]])
        {
          unsigned int v8 = &regions[v4];
          unsigned int var2 = v8->var2;
          p_unsigned int var2 = &v8->var2;
          uint64_t v9 = var2;
          if (*((void *)v7 + 17) + (unint64_t)var2 > var2)
          {
            unsigned int v12 = v9 + 1;
            unsigned int v13 = v9;
            do
            {
              int v14 = &self->_blocks[v9];
              unint64_t v17 = *((void *)v14 + 1);
              uint64_t v16 = (unint64_t *)v14 + 1;
              unint64_t v15 = v17;
              if (!(v17 >> 41))
              {
                if (v5 == -1)
                {
                  uint64_t Path = CSSymbolOwnerGetPath();
                  if (Path)
                  {
                    uint64_t v19 = [NSString stringWithUTF8String:Path];
                  }
                  else
                  {
                    uint64_t v19 = &stru_1EFE27F38;
                  }
                  unsigned int v20 = [(VMUClassInfo *)[VMUMutableClassInfo alloc] initWithClassName:@"AttributeGraph Data" binaryPath:v19 type:8];
                  [(VMUMutableClassInfo *)v20 setDefaultScanType:1];
                  unsigned int v5 = [(VMUTaskMemoryScanner *)self _indexForClassInfo:v20];

                  unint64_t v15 = *v16;
                }
                unint64_t *v16 = v15 & 0x1FFFFFFFFFFLL | ((unint64_t)v5 << 41);
                unsigned int v13 = *p_var2;
              }
              uint64_t v9 = v12;
            }
            while (*((void *)v7 + 17) + (unint64_t)v13 > v12++);
          }
        }
        else if ([*((id *)v7 + 4) isEqualToString:@"AttributeGraph Data"])
        {
          self->_attributeGraphVMRegionBlockIndex = regions[v4].var2;
        }

        ++v4;
      }
      while (v4 < self->_regionsCount);
    }
  }
}

uint64_t __58__VMUTaskMemoryScanner__identifyAttributeGraphAllocations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsString:@"AttributeGraph graph data"];
}

- (void)_identifySwiftAsyncTaskSlabs
{
  v37[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(VMUObjectIdentifier *)self->_objectIdentifier swiftConcurrencyDebugAsyncTaskMetadataIsa];
  unint64_t v4 = [(VMUObjectIdentifier *)self->_objectIdentifier swiftConcurrencyDebugAsyncTaskSlabMetadataIsa];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
      dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
    }
    if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
    {
      _debugSwiftAsyncPrintf(0, "One or both of the AsyncTask and AsyncTask Slab metadata isas isn't known, so skipping precise scanning of AsyncTasks and AsyncTask Slabs.\n");
    }
  }
  else
  {
    unint64_t v6 = v4;
    uint64_t v7 = [(VMUClassInfoMap *)self->_classInfoIndexer classInfoForAddress:v3];
    unint64_t v32 = v6;
    uint64_t v8 = [(VMUClassInfoMap *)self->_classInfoIndexer classInfoForAddress:v6];
    unint64_t v33 = (void *)v7;
    unsigned int v9 = [(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:v7];
    uint64_t v34 = (void *)v8;
    unsigned int v10 = [(VMUClassInfoMap *)self->_classInfoIndexer indexForClassInfo:v8];
    unint64_t blocksCount = self->_blocksCount;
    if (blocksCount)
    {
      unsigned int v12 = v10;
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        unint64_t v15 = &self->_blocks[v13];
        unint64_t v16 = *((void *)v15 + 1);
        if ((v16 & 7) != 1) {
          goto LABEL_51;
        }
        if (v9 != v16 >> 41 && v12 != v16 >> 41) {
          goto LABEL_51;
        }
        unint64_t var0 = (const void *)v15->var0;
        if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
          dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
        }
        uint64_t v19 = (v16 >> 5) & 0xFFFFFFFFFLL;
        if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
        {
          unsigned int v20 = "AsyncTask Slab";
          if (v9 == *((void *)v15 + 1) >> 41) {
            unsigned int v20 = "AsyncTask";
          }
          _debugSwiftAsyncPrintf(0, "Block %p [%llu] is %s\n", var0, (v16 >> 5) & 0xFFFFFFFFFLL, v20);
        }
        if (v9 != *((void *)v15 + 1) >> 41) {
          break;
        }
        uint64_t v21 = vmu_swift_reflection_asyncTaskSlabPointer(*(void *)[(VMUObjectIdentifier *)self->_objectIdentifier swiftMirror]);
        if (!v21)
        {
          unint64_t v25 = (const void *)v22;
          BOOL v29 = VMURangeContainsRange((unint64_t)var0, v19, v22, 8);
          if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
            dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
          }
          if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1)
          {
            uint64_t v30 = " not";
            if (v29) {
              uint64_t v30 = "";
            }
            _debugSwiftAsyncPrintf(1, "Found first slab at %p,%s in same block\n", v25, v30);
          }
          if (!v29) {
            goto LABEL_50;
          }
          id v24 = (void *)[v33 mutableCopy];
          goto LABEL_33;
        }
        uint64_t v23 = v21;
        if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
          dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
        }
        if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1) {
          _debugSwiftAsyncPrintf(1, "vmu_swift_reflection_asyncTaskSlabPointer error: %s\n", v23);
        }
LABEL_50:
        unint64_t blocksCount = self->_blocksCount;
LABEL_51:
        ++v14;
        ++v13;
        if (v14 >= blocksCount) {
          goto LABEL_52;
        }
      }
      id v24 = (void *)[v34 mutableCopy];
      [v24 setDefaultScanType:0];
      unint64_t v25 = var0;
LABEL_33:
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      if (![(VMUTaskMemoryCache *)self->_memoryCache mapAddress:var0 size:v19 returnedAddress:&v36 returnedSize:&v35])
      {
        LODWORD(v31) = 1;
        uint64_t v26 = -[VMUTaskMemoryScanner _recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:](self, "_recursivelyIdentifySwiftAsyncTaskSlabs:containerRange:remoteBlock:mappedBlock:asyncTaskSlabMetadataIsa:nestingLevel:", v25, var0, v19, var0, v36, v32, v31);
        uint64_t v27 = (void *)v26;
        if (v26)
        {
          v37[0] = v26;
          uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
          [v24 setFields:v28];

          *((void *)v15 + 1) = *((void *)v15 + 1) & 0x1FFFFFFFFFFLL | ((unint64_t)[(VMUClassInfoMap *)self->_classInfoIndexer addClassInfo:v24 forAddress:0] << 41);
        }
        else
        {
          if (_debugSwiftAsyncPrintfIsEnabled_onceToken != -1) {
            dispatch_once(&_debugSwiftAsyncPrintfIsEnabled_onceToken, &__block_literal_global_201);
          }
          if (_debugSwiftAsyncPrintfIsEnabled_enabled == 1) {
            _debugSwiftAsyncPrintf(1, "Error getting info for slab, scanning block %p [%llu] conservatively\n", var0, v19);
          }
        }
      }
      goto LABEL_50;
    }
LABEL_52:
  }
}

- (void)_identifyNonObjectsUsingStackBacktrace
{
  if (![(VMUTask *)self->_task isCore])
  {
    unint64_t v3 = [VMUTaskStackLogReader alloc];
    uint64_t v4 = [(VMUTask *)self->_task taskPort];
    uint64_t v5 = [(VMUObjectIdentifier *)self->_objectIdentifier symbolicator];
    uint64_t v7 = -[VMUTaskStackLogReader initWithTask:symbolicator:](v3, "initWithTask:symbolicator:", v4, v5, v6);
    classInfoIndexer = self->_classInfoIndexer;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__VMUTaskMemoryScanner__identifyNonObjectsUsingStackBacktrace__block_invoke;
    v9[3] = &unk_1E5D231C0;
    v9[4] = self;
    [(VMUStackLogReaderBase *)v7 identifyNonObjectsUsingStackBacktraces:self classInfoMap:classInfoIndexer classInfoSetterBlock:v9];
  }
}

uint64_t __62__VMUTaskMemoryScanner__identifyNonObjectsUsingStackBacktrace__block_invoke(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 80) + 16 * a2;
  *(void *)(v3 + 8) = *(void *)(v3 + 8) & 0x1FFFFFFFFFFLL | ((unint64_t)a3 << 41);
  return result;
}

- (void)_findMarkedAbandonedBlocks
{
  userMarkedAbandoned = self->_userMarkedAbandoned;
  if (userMarkedAbandoned)
  {
    free(userMarkedAbandoned);
    self->_userMarkedAbandoned = 0;
  }
  if (!self->_abandonedMarkingEnabled || !self->_regionsCount) {
    return;
  }
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  unsigned int v6 = 0;
  uint64_t v7 = 0;
  do
  {
    if (![self->_regions[v4].var0 isAnalysisToolRegion]) {
      goto LABEL_51;
    }
    regions = self->_regions;
    unsigned int v9 = &regions[v4];
    memoryCache = self->_memoryCache;
    unsigned int regionsCount = self->_regionsCount;
    unsigned int v12 = self->_task;
    uint64_t v13 = memoryCache;
    if (v9->var7) {
      goto LABEL_8;
    }
    int v65 = v13;
    if ([v9->var0 isSpecialPhysFootprintRegion])
    {

      goto LABEL_51;
    }
    v66[0] = 0;
    unint64_t v71 = 0;
    int v38 = [(VMUTaskMemoryCache *)v65 mapAddress:*((void *)v9->var0 + 1) size:*((void *)v9->var0 + 2) returnedAddress:v66 returnedSize:&v71];
    if (!v38)
    {
      uint64_t v13 = v65;
      unint64_t v49 = v71;
      v9->unint64_t var7 = (void *)v66[0];
      BOOL v50 = &regions[v4];
      v50->unint64_t var6 = v49;
      v50->var8 = v9;
LABEL_8:

      unint64_t v14 = self->_regions;
      unint64_t var7 = (unint64_t)v14[v4].var7;
      if (var7)
      {
        unint64_t v16 = (unint64_t *)MEMORY[0x1E4F14B00];
        unint64_t v17 = *MEMORY[0x1E4F14B00];
        uint64_t v18 = v7;
        do
        {
          unint64_t v19 = v17 + var7;
          if (*(void *)var7 == 0x1DE67829AD1A2FBBLL && *(_DWORD *)(var7 + 8) <= 1u)
          {
            unsigned int v20 = *(_DWORD *)(var7 + 20);
            unsigned int v21 = v6 + v20 - 1;
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
                uint64_t v7 = v22;
                uint64_t v22 = (2 * v22);
              }
              while (v7 < v21);
              uint64_t v23 = malloc_type_realloc(v5, 8 * v7, 0x100004000313F17uLL);
              if (!v23)
              {
                NSLog(&cfstr_OutOfMemoryFai.isa, "allMarkedAddresses", v18, v7);
                abort();
              }
              uint64_t v5 = v23;
              unsigned int v20 = *(_DWORD *)(var7 + 20);
            }
            else
            {
              uint64_t v7 = v18;
            }
            unint64_t v24 = *(unsigned int *)(var7 + 12) + var7;
            uint64_t v25 = v20;
            if (v20)
            {
              uint64_t v26 = (uint64_t *)(*(unsigned int *)(var7 + 12) + var7);
              uint64_t v27 = v25;
              do
              {
                uint64_t v29 = *v26++;
                uint64_t v28 = v29;
                if (v29) {
                  *((void *)v5 + v6++) = v28;
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
            uint64_t v7 = v18;
          }
          BOOL v31 = (void *)v19 >= (char *)v14[v4].var7 + v14[v4].var6 || v19 == 0;
          uint64_t v18 = v7;
          unint64_t var7 = v19;
        }
        while (!v31);
      }
      unint64_t v32 = self->_memoryCache;
      unint64_t v33 = self->_objectIdentifier;
      uint64_t v34 = v32;
      uint64_t v35 = v34;
      uint64_t v36 = &v14[v4];
      if (v36->var7)
      {
        if (v36->var8 == v36)
        {
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = ___unmapRegion_block_invoke;
          v66[3] = &unk_1E5D23460;
          uint64_t v67 = v34;
          id v69 = &v14[v4];
          int v68 = v33;
          unint64_t v70 = v14;
          unint64_t v48 = (void (**)(void))MEMORY[0x1AD0DA230](v66);
          v48[2]();
        }
        else
        {
          unint64_t v37 = &v14[v4];
          v37->unint64_t var6 = 0;
          v37->unint64_t var7 = 0;
          v37->var8 = 0;
        }
      }

      goto LABEL_51;
    }
    int v64 = v38;
    long long v39 = v12;
    if ((*((_DWORD *)v9->var0 + 13) & 3u) - 1 >= 2)
    {
      BOOL v40 = task_exists(v12);
      if (v4 != regionsCount - 1 && v40)
      {
        unint64_t v63 = (FILE *)*MEMORY[0x1E4F143C8];
        uint64_t v62 = [v9->var0 address];
        uint64_t v61 = *((void *)v9->var0 + 2) + *((void *)v9->var0 + 1);
        uint64_t v41 = *((unsigned int *)v9->var0 + 6);
        unint64_t v42 = vm_prot_strings[v41];
        VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v9->var0 + 232), *((unsigned __int8 *)v9->var0 + 104), *((unsigned __int8 *)v9->var0 + 50), v41, *((unsigned __int8 *)v9->var0 + 49));
        id v43 = objc_claimAutoreleasedReturnValue();
        unint64_t v44 = (const char *)[v43 UTF8String];
        uint64_t v45 = *((void *)v9->var0 + 2) >> *MEMORY[0x1E4F14AF8];
        unint64_t v46 = "pages";
        if (v45 == 1) {
          unint64_t v46 = "page";
        }
        unint64_t v47 = " [root]";
        if (regions[v4].var4 == regions[v4].var5) {
          unint64_t v47 = "";
        }
        uint64_t v60 = v42;
        long long v39 = v12;
        fprintf(v63, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v62, v61, v60, v44, v45, v46, v47, v64);
      }
    }

LABEL_51:
    ++v4;
  }
  while (v4 < self->_regionsCount);
  if (v5)
  {
    unsigned int blocksCount = self->_blocksCount;
    unint64_t v52 = malloc_type_calloc(1uLL, ((blocksCount + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *unint64_t v52 = blocksCount;
    self->_userMarkedAbandoned = v52;
    mergesort_b(v5, v6, 8uLL, &__block_literal_global_246);
    if (v6)
    {
      uint64_t v53 = 0;
      unint64_t v54 = 0;
      do
      {
        unint64_t v55 = self->_blocksCount;
        if (v54 >= v55) {
          break;
        }
        blocks = self->_blocks;
        uint64_t v57 = (void *)&blocks[v54] + 1;
        while (1)
        {
          if ((*v57 & 7) == 1)
          {
            unint64_t v58 = *((void *)v5 + v53);
            if (*(v57 - 1) >= v58) {
              break;
            }
          }
          ++v54;
          v57 += 2;
          if (v55 == v54) {
            goto LABEL_67;
          }
        }
        unint64_t v55 = v54;
        if (blocks[v54].var0 != v58)
        {
LABEL_67:
          unint64_t v54 = v55;
          goto LABEL_68;
        }
        uint64_t v59 = self->_userMarkedAbandoned;
        if (*v59 > v54) {
          *((unsigned char *)v59 + (v54 >> 3) + 4) |= 1 << (v54 & 7);
        }
        unint64_t v54 = v54;
LABEL_68:
        ++v53;
      }
      while (v53 != v6);
    }
    free(v5);
  }
}

uint64_t __50__VMUTaskMemoryScanner__findMarkedAbandonedBlocks__block_invoke(uint64_t a1, void *a2, void *a3)
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

  [(VMUTaskMemoryScanner *)self _updateLinearClassInfos];
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

- (uint64_t)getCachedScanInfoForClassWithIsa:(void *)a3 classInfo:(unsigned char *)a4 returnedShouldApplySwiftPointerMaskingToIsa:
{
  if (result)
  {
    if (a2 && a3)
    {
      uint64_t v7 = result;
      if (!*(void *)(*(void *)(result + 280) + 8 * a2))
      {
        int v8 = *(_DWORD *)(result + 344);
        unsigned int v9 = [a3 infoType] - 8;
        BOOL v10 = v9 <= 0x38 && ((1 << v9) & 0x100000001000001) != 0 || v8 == a2;
        long long v11 = *(unsigned int **)(v7 + 288);
        if (*v11 > a2)
        {
          int v12 = 1 << (a2 & 7);
          uint64_t v13 = (char *)v11 + (a2 >> 3);
          char v14 = v13[4];
          char v15 = v14 | v12;
          char v16 = v14 & ~(_BYTE)v12;
          if (v10) {
            char v17 = v15;
          }
          else {
            char v17 = v16;
          }
          v13[4] = v17;
        }
        uint64_t v18 = [a3 instanceSize];
        v34[0] = 0;
        v34[1] = v34;
        v34[2] = 0x2020000000;
        unsigned int v35 = (v18 >> 3) + 2;
        *(void *)(*(void *)(v7 + 280) + 8 * a2) = malloc_type_malloc(4 * v35, 0x100004052888210uLL);
        uint64_t v30 = 0;
        BOOL v31 = &v30;
        uint64_t v32 = 0x2020000000;
        int v33 = 0;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __111__VMUTaskMemoryScanner_getCachedScanInfoForClassWithIsa_classInfo_returnedShouldApplySwiftPointerMaskingToIsa___block_invoke;
        v28[3] = &unk_1E5D231E8;
        void v28[5] = &v30;
        v28[6] = v34;
        v28[4] = v7;
        unsigned int v29 = a2;
        [a3 enumerateScanningLocationsForSize:v18 withBlock:v28];
        int v19 = [a3 defaultScanType];
        uint64_t v20 = *(void *)(*(void *)(v7 + 280) + 8 * a2);
        uint64_t v21 = *((unsigned int *)v31 + 6);
        *((_DWORD *)v31 + 6) = v21 + 1;
        char v22 = [a3 defaultScanType];
        int v23 = (v18 + 7) & 0xFFFFF8;
        if (v19 == 1) {
          int v23 = v18;
        }
        *(_DWORD *)(v20 + 4 * v21) = v23 & 0xFFFFFF | ((v22 & 0x7F) << 24);
        uint64_t v24 = *(void *)(*(void *)(v7 + 280) + 8 * a2);
        uint64_t v25 = *((unsigned int *)v31 + 6);
        *((_DWORD *)v31 + 6) = v25 + 1;
        *(_DWORD *)(v24 + 4 * v25) = (([a3 defaultScanType] & 0x7F) << 24) | 0xFFFFFF;
        _Block_object_dispose(&v30, 8);
        _Block_object_dispose(v34, 8);
      }
      if (a4)
      {
        uint64_t v26 = *(unsigned int **)(v7 + 288);
        if (*v26 <= a2) {
          LOBYTE(v27) = 0;
        }
        else {
          int v27 = (*((unsigned __int8 *)v26 + (a2 >> 3) + 4) >> (a2 & 7)) & 1;
        }
        *a4 = v27;
      }
      return *(void *)(*(void *)(v7 + 280) + 8 * a2);
    }
    else
    {
      uint64_t result = 0;
      if (a4) {
        *a4 = 0;
      }
    }
  }
  return result;
}

void __111__VMUTaskMemoryScanner_getCachedScanInfoForClassWithIsa_classInfo_returnedShouldApplySwiftPointerMaskingToIsa___block_invoke(uint64_t a1, void *a2, int a3, char a4)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v9 = *(_DWORD *)(v8 + 24);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  unsigned int v11 = *(_DWORD *)(v10 + 24);
  if (v9 + 2 >= v11)
  {
    *(_DWORD *)(v10 + 24) = 2 * v11;
    uint64_t v13 = malloc_type_realloc(*(void **)(*(void *)(*(void *)(a1 + 32) + 280) + 8 * *(unsigned int *)(a1 + 56)), 4 * *(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0x100004052888210uLL);
    uint64_t v12 = *(unsigned int *)(a1 + 56);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 280) + 8 * v12) = v13;
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    unsigned int v9 = *(_DWORD *)(v8 + 24);
  }
  else
  {
    uint64_t v12 = *(unsigned int *)(a1 + 56);
  }
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 32) + 280) + 8 * v12);
  *(_DWORD *)(v8 + 24) = v9 + 1;
  uint64_t v15 = v9;
  int v16 = a3 & 0xFFFFFF | ((a4 & 0x7F) << 24);
  if (a2)
  {
    char v17 = [a2 typeName];
    if (v17)
    {
      int v19 = v17;
      uint64_t v18 = [a2 typeName];
      *(_DWORD *)(v14 + 4 * v15) = v16 | (([v18 length] == 0) << 31);

      char v17 = v19;
    }
    else
    {
      *(_DWORD *)(v14 + 4 * v15) = v16;
    }
  }
  else
  {
    *(_DWORD *)(v14 + 4 * v9) = v16;
  }
}

- (void)scanLocalMemory:(uint64_t)a3 atOffset:(unsigned int)a4 node:(unint64_t)a5 length:(unsigned int)a6 isa:(void *)a7 fieldInfo:(unsigned int)a8 stride:(uint64_t)a9 recorder:
{
  if (a1)
  {
    uint64_t v15 = [*(id *)(a1 + 64) swiftRuntimeInfoStableABI];
    int v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [*(id *)(a1 + 64) swiftRuntimeInfoPreABI];
    }
    v217 = v17;

    int v220 = [*(id *)(a1 + 64) hasSwiftContent];
    if (*(_DWORD *)(a1 + 328) == a6 || *(_DWORD *)(a1 + 332) == a6 || *(_DWORD *)(a1 + 336) == a6)
    {
      BOOL v18 = 1;
      if (!a6) {
        goto LABEL_13;
      }
    }
    else
    {
      BOOL v18 = *(_DWORD *)(a1 + 340) == a6;
      if (!a6) {
        goto LABEL_13;
      }
    }
    if (*(unsigned char *)(a1 + 360)) {
      char v19 = v18;
    }
    else {
      char v19 = 1;
    }
    if ((v19 & 1) == 0)
    {
      unint64_t v73 = a5 - 8;
      if (a5 < 8) {
        goto LABEL_193;
      }
      id v74 = *(id *)(*(void *)(a1 + 256) + 8 * a6);
      v232[0] = 0;
      id v226 = v74;
      uint64_t v75 = -[VMUTaskMemoryScanner getCachedScanInfoForClassWithIsa:classInfo:returnedShouldApplySwiftPointerMaskingToIsa:](a1, a6, v74, v232);
      unint64_t v76 = 0;
      unsigned int v77 = 0;
      uint64_t v229 = a2 + a3;
LABEL_88:
      unsigned int v78 = *(_DWORD *)(v75 + 4 * v77);
      uint64_t v79 = HIBYTE(v78) & 0x7F;
      uint64_t v80 = *(void *)&v78 & 0xFFFFFFLL;
      unint64_t v81 = v76 + 8;
      if (v79 == 1) {
        unint64_t v81 = v76 + 1;
      }
      if (v80 == 0xFFFFFF) {
        unsigned int v82 = v77;
      }
      else {
        unsigned int v82 = v77 + 1;
      }
      if (v80 == 0xFFFFFF) {
        unint64_t v76 = v81;
      }
      else {
        unint64_t v76 = v80;
      }
      if (((*(_DWORD *)(a1 + 376) >> HIBYTE(*(_DWORD *)(v75 + 4 * v77))) & 1) == 0 || v76 > v73) {
        goto LABEL_116;
      }
      unint64_t v83 = *(void *)(v229 + v76);
      if (v79 == 3)
      {
        v83 &= ~1uLL;
        uint64_t v79 = (*(void *)(v229 + v76) & 1) != 0 ? 2 : 3;
      }
      else if (v79 == 5)
      {
        id v84 = v226;
        id v85 = v217;
        if (v217)
        {
          if ([v84 usesSwiftRefcounting]
            && v76 == [v84 pointerSize])
          {
            id v86 = v85;
            uint64_t v222 = [v86 refcountIsSideTableMarkerMask] & v83;
            if (v222 == [v86 refcountIsSideTableMarkerValue])
            {
              unint64_t v87 = [v86 sideTablePointerMask] & v83;
              unint64_t v88 = v87 >> [v86 sideTablePointerRightShift];
              unint64_t v83 = v88 << [v86 sideTablePointerLeftShift];
            }
            else
            {
              unint64_t v83 = 0;
            }
          }
          else
          {
            v83 &= [v85 nativeWeakReferencePointerMask];
          }
        }

        uint64_t v79 = 5;
      }
      if (v232[0] || (*(_DWORD *)(v75 + 4 * v77) & 0x80000000) != 0) {
        v83 &= 0xFFFFFFFFFFFFF8uLL;
      }
      unint64_t v89 = *(uint64_t **)(a1 + 112);
      if (v89[6] > v83) {
        goto LABEL_116;
      }
      uint64_t v223 = *(void *)(*(void *)(a1 + 80) + 16 * a4);
      unint64_t v90 = -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 8), v83);
      unint64_t v91 = v89[6];
      unint64_t v92 = v89[7];
      BOOL v146 = v92 >= v91;
      unint64_t v93 = v92 - v91;
      if (!v146) {
        goto LABEL_116;
      }
      unint64_t v94 = v90;
      if (v90 - v91 >= v93) {
        goto LABEL_116;
      }
      unint64_t v95 = v90 >> *MEMORY[0x1E4F14AF8];
      if (v95)
      {
        unint64_t v96 = (unsigned int *)v89[3];
        unint64_t v97 = v90 >> *MEMORY[0x1E4F14AF8];
        do
        {
          if (*v96 <= (v97 & 0x3FFFFFF)
            || ((*((unsigned __int8 *)v96 + ((v97 & 0x3FFFFFF) >> 3) + 4) >> (v97 & 7)) & 1) == 0)
          {
            goto LABEL_116;
          }
          v97 >>= 26;
        }
        while (v97);
      }
      uint64_t v98 = (uint64_t)v89 + 4 * (v95 & 0x7FFFF);
      int v101 = *(_DWORD *)(v98 + 64);
      unint64_t v100 = (_DWORD *)(v98 + 64);
      int v99 = v101;
      if (v101)
      {
        unint64_t v102 = v89[4] + ((unint64_t)(v99 - 1) << 6);
        if (v90 - *(void *)(*(void *)v102 + 8) < *(void *)(*(void *)v102 + 16)) {
          goto LABEL_128;
        }
      }
      unint64_t v118 = *((unsigned int *)v89 + 10);
      if (!v118) {
        goto LABEL_116;
      }
      unint64_t v119 = v89[4];
      while (1)
      {
        unint64_t v120 = v118 >> 1;
        unint64_t v102 = v119 + (v118 >> 1 << 6);
        if (*(void *)(*(void *)v102 + 8) <= v90)
        {
          if (*(void *)(*(void *)v102 + 16) + *(void *)(*(void *)v102 + 8) > v90)
          {
            uint64_t v215 = v89[4];
            int v121 = [*(id *)v102 isSpecialPhysFootprintRegion];
            uint64_t v122 = v215;
            if (v121) {
              unint64_t v123 = 0;
            }
            else {
              unint64_t v123 = v102;
            }
            if (v121) {
              goto LABEL_116;
            }
            if ((*(unsigned char *)(*(void *)v123 + 132) & 1) == 0) {
              goto LABEL_179;
            }
            unint64_t v124 = (id *)(v123 + 64);
            unint64_t v125 = *((unsigned int *)v89 + 10) - ((uint64_t)(v123 + 64 - v89[4]) >> 6);
            if (!v125) {
              goto LABEL_176;
            }
            while (1)
            {
              unint64_t v126 = v125 >> 1;
              id v127 = &v124[8 * (v125 >> 1)];
              if (*((void *)*v127 + 1) <= v94)
              {
                if (*((void *)*v127 + 2) + *((void *)*v127 + 1) > v94)
                {
                  unint64_t v211 = v123;
                  int v132 = [*v127 isSpecialPhysFootprintRegion];
                  unint64_t v123 = v211;
                  uint64_t v122 = v215;
                  if (v132) {
                    unint64_t v125 = 0;
                  }
                  else {
                    unint64_t v125 = (unint64_t)v127;
                  }
LABEL_176:
                  if (v125) {
                    unint64_t v123 = v125;
                  }
                  unint64_t v102 = v123;
LABEL_179:
                  *unint64_t v100 = ((v123 - v122) >> 6) + 1;
LABEL_128:
                  unsigned int v103 = *(_DWORD *)(v102 + 20);
                  if (v103)
                  {
                    uint64_t v104 = *(void *)(v102 + 8);
                    uint64_t v105 = *v89;
                    uint64_t v106 = *(unsigned int *)(v102 + 16);
                    v107 = (unint64_t *)(*v89 + 16 * v106);
                    if (v104)
                    {
                      if (*v107 > v94) {
                        goto LABEL_116;
                      }
                      unint64_t v108 = (void *)(v105 + 16 * (v103 + v106 - 1));
                      if (((v108[1] >> 5) & 0xFFFFFFFFFuLL) + *v108 <= v94) {
                        goto LABEL_116;
                      }
                      v109 = (unsigned int *)(v104
                                            + 4 * ((v94 - (*v107 & -*MEMORY[0x1E4F14B00])) >> *MEMORY[0x1E4F14AF8]));
                      uint64_t v110 = *v109;
                      v111 = (unint64_t *)(v105 + 16 * v110);
                      if (*v111 > v94) {
                        goto LABEL_116;
                      }
                      uint64_t v112 = v109[1];
                      if (v112 < *((_DWORD *)v89 + 2)
                        && (uint64_t v113 = (unint64_t *)(v105 + 16 * v112), v114 = *v113, *v113 <= v94))
                      {
LABEL_164:
                        unint64_t v128 = v113[1];
                        if ((v128 & 7) - 2 >= 3)
                        {
                          unint64_t v129 = ((unint64_t)v113 - v105) >> 4;
                          unint64_t v130 = v89[2];
                          if (v94 - v114 >= v130)
                          {
                            if (((v128 >> 5) & 0xFFFFFFFFFLL) - (v94 - v114) > v130 || v129 == -1) {
                              goto LABEL_116;
                            }
                          }
                          else if (v129 == -1)
                          {
                            goto LABEL_116;
                          }
                          (*(void (**)(uint64_t, void, unint64_t, uint64_t))(a9 + 16))(a9, a4, v76 + a3 + v223, v79);
                        }
                      }
                      else
                      {
                        unsigned int v115 = v112 - v110;
                        if (v115)
                        {
                          do
                          {
                            uint64_t v116 = v115 >> 1;
                            uint64_t v113 = &v111[2 * v116];
                            unint64_t v114 = *v113;
                            if (*v113 <= v94)
                            {
                              if (((v111[2 * v116 + 1] >> 5) & 0xFFFFFFFFFLL) + v114 > v94) {
                                goto LABEL_164;
                              }
                              v111 = v113 + 2;
                              LODWORD(v116) = --v115 >> 1;
                            }
                            BOOL v146 = v115 >= 2;
                            unsigned int v115 = v116;
                          }
                          while (v146);
                        }
                      }
                    }
                    else
                    {
                      do
                      {
                        uint64_t v117 = v103 >> 1;
                        uint64_t v113 = &v107[2 * v117];
                        unint64_t v114 = *v113;
                        if (*v113 <= v94)
                        {
                          if (((v107[2 * v117 + 1] >> 5) & 0xFFFFFFFFFLL) + v114 > v94) {
                            goto LABEL_164;
                          }
                          v107 = v113 + 2;
                          LODWORD(v117) = --v103 >> 1;
                        }
                        BOOL v146 = v103 >= 2;
                        unsigned int v103 = v117;
                      }
                      while (v146);
                    }
                  }
LABEL_116:
                  unsigned int v77 = v82;
                  if (v76 > v73) {
                    goto LABEL_192;
                  }
                  goto LABEL_88;
                }
                unint64_t v124 = v127 + 8;
                unint64_t v126 = --v125 >> 1;
              }
              BOOL v145 = v125 > 1;
              unint64_t v125 = v126;
              if (!v145)
              {
                unint64_t v125 = 0;
                goto LABEL_176;
              }
            }
          }
          unint64_t v119 = v102 + 64;
          unint64_t v120 = --v118 >> 1;
        }
        BOOL v146 = v118 >= 2;
        unint64_t v118 = v120;
        if (!v146) {
          goto LABEL_116;
        }
      }
    }
LABEL_13:
    if (a7 && *(unsigned char *)(a1 + 360))
    {
      unint64_t v20 = ((a3 + 7) & 0xFFFFFFF8) - a3;
      unint64_t v21 = (v20 + 8);
      if (v21 > a5) {
        goto LABEL_193;
      }
      uint64_t v228 = a2 + a3;
      while (1)
      {
        unint64_t v22 = v20;
        unint64_t v20 = v21;
        int v231 = 0;
        int v23 = [a7 getLeafFieldAtOffset:v22 leafOffset:&v231];
        unsigned int v24 = v231 + 8;
        if (v24 > [v23 size]) {
          goto LABEL_19;
        }
        unint64_t v25 = *(void *)(v228 + v22);
        uint64_t v26 = *(void *)(a1 + 8);
        uint64_t v221 = *(void *)(*(void *)(a1 + 80) + 16 * a4);
        unsigned int v225 = [v23 scanType];
        int v27 = *(uint64_t **)(a1 + 112);
        if (v27[6] > v25) {
          goto LABEL_19;
        }
        unint64_t v28 = -[VMUTask ptrauthStripDataPointer:](v26, v25);
        unint64_t v29 = v27[6];
        unint64_t v30 = v27[7];
        BOOL v146 = v30 >= v29;
        unint64_t v31 = v30 - v29;
        if (!v146) {
          goto LABEL_19;
        }
        unint64_t v32 = v28;
        if (v28 - v29 >= v31) {
          goto LABEL_19;
        }
        unint64_t v33 = v28 >> *MEMORY[0x1E4F14AF8];
        if (v33)
        {
          uint64_t v34 = (unsigned int *)v27[3];
          unint64_t v35 = v28 >> *MEMORY[0x1E4F14AF8];
          do
          {
            if (*v34 <= (v35 & 0x3FFFFFF)
              || ((*((unsigned __int8 *)v34 + ((v35 & 0x3FFFFFF) >> 3) + 4) >> (v35 & 7)) & 1) == 0)
            {
              goto LABEL_19;
            }
            v35 >>= 26;
          }
          while (v35);
        }
        uint64_t v36 = (uint64_t)v27 + 4 * (v33 & 0x7FFFF);
        int v39 = *(_DWORD *)(v36 + 64);
        int v38 = (_DWORD *)(v36 + 64);
        int v37 = v39;
        if (v39)
        {
          unint64_t v40 = v27[4] + ((unint64_t)(v37 - 1) << 6);
          if (v28 - *(void *)(*(void *)v40 + 8) < *(void *)(*(void *)v40 + 16)) {
            goto LABEL_31;
          }
        }
        unint64_t v56 = *((unsigned int *)v27 + 10);
        if (!v56) {
          goto LABEL_19;
        }
        unint64_t v57 = v27[4];
        while (1)
        {
          unint64_t v58 = v56 >> 1;
          unint64_t v40 = v57 + (v56 >> 1 << 6);
          if (*(void *)(*(void *)v40 + 8) <= v28) {
            break;
          }
LABEL_54:
          BOOL v146 = v56 >= 2;
          unint64_t v56 = v58;
          if (!v146) {
            goto LABEL_19;
          }
        }
        if (*(void *)(*(void *)v40 + 16) + *(void *)(*(void *)v40 + 8) <= v28) {
          break;
        }
        uint64_t v214 = v27[4];
        int v59 = [*(id *)v40 isSpecialPhysFootprintRegion];
        uint64_t v60 = v214;
        if (v59) {
          unint64_t v61 = 0;
        }
        else {
          unint64_t v61 = v40;
        }
        if (v59) {
          goto LABEL_19;
        }
        if ((*(unsigned char *)(*(void *)v61 + 132) & 1) == 0) {
          goto LABEL_82;
        }
        uint64_t v62 = (id *)(v61 + 64);
        unint64_t v63 = *((unsigned int *)v27 + 10) - ((uint64_t)(v61 + 64 - v27[4]) >> 6);
        if (!v63) {
          goto LABEL_79;
        }
        while (2)
        {
          unint64_t v64 = v63 >> 1;
          int v65 = &v62[8 * (v63 >> 1)];
          if (*((void *)*v65 + 1) > v32)
          {
LABEL_65:
            BOOL v145 = v63 > 1;
            unint64_t v63 = v64;
            if (!v145)
            {
              unint64_t v63 = 0;
              goto LABEL_79;
            }
            continue;
          }
          break;
        }
        if (*((void *)*v65 + 2) + *((void *)*v65 + 1) <= v32)
        {
          uint64_t v62 = v65 + 8;
          unint64_t v64 = --v63 >> 1;
          goto LABEL_65;
        }
        unint64_t v210 = v61;
        int v70 = [*v65 isSpecialPhysFootprintRegion];
        unint64_t v61 = v210;
        uint64_t v60 = v214;
        if (v70) {
          unint64_t v63 = 0;
        }
        else {
          unint64_t v63 = (unint64_t)v65;
        }
LABEL_79:
        if (v63) {
          unint64_t v61 = v63;
        }
        unint64_t v40 = v61;
LABEL_82:
        *int v38 = ((v61 - v60) >> 6) + 1;
LABEL_31:
        unsigned int v41 = *(_DWORD *)(v40 + 20);
        if (v41)
        {
          uint64_t v42 = *(void *)(v40 + 8);
          uint64_t v43 = *v27;
          uint64_t v44 = *(unsigned int *)(v40 + 16);
          uint64_t v45 = (unint64_t *)(*v27 + 16 * v44);
          if (v42)
          {
            if (*v45 > v32) {
              goto LABEL_19;
            }
            unint64_t v46 = (void *)(v43 + 16 * (v41 + v44 - 1));
            if (((v46[1] >> 5) & 0xFFFFFFFFFuLL) + *v46 <= v32) {
              goto LABEL_19;
            }
            unint64_t v47 = (unsigned int *)(v42 + 4 * ((v32 - (*v45 & -*MEMORY[0x1E4F14B00])) >> *MEMORY[0x1E4F14AF8]));
            uint64_t v48 = *v47;
            unint64_t v49 = (unint64_t *)(v43 + 16 * v48);
            if (*v49 > v32) {
              goto LABEL_19;
            }
            uint64_t v50 = v47[1];
            if (v50 < *((_DWORD *)v27 + 2))
            {
              BOOL v51 = (unint64_t *)(v43 + 16 * v50);
              unint64_t v52 = *v51;
              if (*v51 <= v32)
              {
LABEL_67:
                unint64_t v66 = v51[1];
                if ((v66 & 7) - 2 < 3) {
                  goto LABEL_19;
                }
                unint64_t v67 = ((unint64_t)v51 - v43) >> 4;
                unint64_t v68 = v27[2];
                if (v32 - v52 >= v68)
                {
                  if (((v66 >> 5) & 0xFFFFFFFFFLL) - (v32 - v52) > v68 || v67 == -1) {
                    goto LABEL_19;
                  }
                }
                else if (v67 == -1)
                {
                  goto LABEL_19;
                }
                (*(void (**)(uint64_t, void, uint64_t, void))(a9 + 16))(a9, a4, a3 + v22 + v221, v225);
                goto LABEL_19;
              }
            }
            unsigned int v53 = v50 - v48;
            if (v53)
            {
              do
              {
                uint64_t v54 = v53 >> 1;
                BOOL v51 = &v49[2 * v54];
                unint64_t v52 = *v51;
                if (*v51 <= v32)
                {
                  if (((v49[2 * v54 + 1] >> 5) & 0xFFFFFFFFFLL) + v52 > v32) {
                    goto LABEL_67;
                  }
                  unint64_t v49 = v51 + 2;
                  LODWORD(v54) = --v53 >> 1;
                }
                BOOL v146 = v53 >= 2;
                unsigned int v53 = v54;
              }
              while (v146);
            }
          }
          else
          {
            do
            {
              uint64_t v55 = v41 >> 1;
              BOOL v51 = &v45[2 * v55];
              unint64_t v52 = *v51;
              if (*v51 <= v32)
              {
                if (((v45[2 * v55 + 1] >> 5) & 0xFFFFFFFFFLL) + v52 > v32) {
                  goto LABEL_67;
                }
                uint64_t v45 = v51 + 2;
                LODWORD(v55) = --v41 >> 1;
              }
              BOOL v146 = v41 >= 2;
              unsigned int v41 = v55;
            }
            while (v146);
          }
        }
LABEL_19:

        unint64_t v21 = (v20 + 8);
        if (v21 > a5)
        {
LABEL_193:

          return;
        }
      }
      unint64_t v57 = v40 + 64;
      unint64_t v58 = --v56 >> 1;
      goto LABEL_54;
    }
    if ((*(unsigned char *)(a1 + 376) & 2) == 0) {
      goto LABEL_193;
    }
    unint64_t v71 = (unint64_t *)(a2 + a3);
    if (a6) {
      uint64_t v72 = *(void **)(*(void *)(a1 + 256) + 8 * a6);
    }
    else {
      uint64_t v72 = 0;
    }
    id v226 = v72;
    if ((*(_DWORD *)(*(void *)(a1 + 80) + 16 * a4 + 8) & 7u) - 2 < 3
      || (int v133 = *(_DWORD *)(a1 + 356)) != 0 && v133 == a4)
    {
      uint64_t v134 = 0;
      BOOL v135 = 1;
    }
    else
    {
      char v230 = 0;
      uint64_t v134 = -[VMUTaskMemoryScanner getCachedScanInfoForClassWithIsa:classInfo:returnedShouldApplySwiftPointerMaskingToIsa:](a1, a6, v226, &v230);
      BOOL v135 = v230 != 0;
    }
    BOOL v208 = v135;
    unint64_t v136 = (unint64_t)v71 + a5 - 8;
    if (*(_DWORD *)(a1 + 300))
    {
      uint64_t v224 = *(void *)([*(id *)(a1 + 64) autoreleasePoolPageLayout] + 16);
      unint64_t v219 = *(unsigned int *)([*(id *)(a1 + 64) autoreleasePoolPageLayout] + 8);
    }
    else
    {
      uint64_t v224 = 0;
      unint64_t v219 = 0;
    }
    if ((unint64_t)v71 > v136) {
      goto LABEL_192;
    }
    BOOL v209 = v18;
    unsigned int v137 = 0;
    uint64_t v227 = a8;
    uint64_t v216 = a2;
    uint64_t v212 = (uint64_t)v71 + a5 - 8;
LABEL_196:
    unint64_t v138 = (char *)v71 - a2;
    unint64_t v139 = (char *)v71 + *(void *)(*(void *)(a1 + 80) + 16 * a4) - a2;
    unint64_t v140 = *v71;
    if (!*v71)
    {
      if (*(_DWORD *)(a1 + 300)) {
        BOOL v146 = (unint64_t)v138 >= v219;
      }
      else {
        BOOL v146 = 0;
      }
      if (v146) {
        (*(void (**)(uint64_t, void, char *, uint64_t))(a9 + 16))(a9, a4, v139, 1);
      }
      goto LABEL_245;
    }
    if (v220)
    {
      BOOL v141 = v208;
      if (v134) {
        char v142 = v208;
      }
      else {
        char v142 = 1;
      }
      if ((v142 & 1) == 0)
      {
        do
        {
          int v143 = *(_DWORD *)(v134 + 4 * v137);
          unint64_t v144 = *(void *)&v143 & 0xFFFFFFLL;
          ++v137;
          BOOL v145 = (v143 & 0xFFFFFF) != 0xFFFFFF && (unint64_t)v138 > v144;
        }
        while (v145);
        --v137;
        if (v144 == 0xFFFFFF)
        {
          uint64_t v134 = 0;
          BOOL v141 = 0;
        }
        else
        {
          BOOL v141 = v138 == (char *)v144 && v143 < 0;
        }
      }
      if (v226
        && v138 == (char *)8
        && [v226 infoType] == 8
        && [v226 usesSwiftRefcounting])
      {
        id v148 = v217;
        unint64_t v149 = v148;
        if (v217
          && (uint64_t v150 = [v148 refcountIsSideTableMarkerMask] & v140,
              v150 == [v149 refcountIsSideTableMarkerValue]))
        {
          unint64_t v151 = [v149 sideTablePointerMask] & v140;
          unint64_t v152 = v151 >> [v149 sideTablePointerRightShift];
          unint64_t v140 = v152 << [v149 sideTablePointerLeftShift];
        }
        else
        {
          unint64_t v140 = 0;
        }
        a2 = v216;
      }
      else
      {
        if (v141) {
          v140 &= 0xFFFFFFFFFFFFF8uLL;
        }
        a2 = v216;
      }
    }
    uint64_t v153 = 1;
    if (v224 && (unint64_t)v138 >= v219)
    {
      unint64_t v154 = v140 & v224;
      if (v140 == (v140 & v224))
      {
        uint64_t v153 = 2;
      }
      else
      {
        if ([*(id *)(a1 + 64) countFromPointerInAutoreleasePool:v140] + 1 >= 2)
        {
          v155 = [NSNumber numberWithUnsignedInt:];
          uint64_t v156 = *(void **)(a1 + 520);
          v157 = [NSNumber numberWithUnsignedLongLong:v139];
          [v156 setObject:v155 forKeyedSubscript:v157];
        }
        uint64_t v153 = 2;
        unint64_t v140 = v154;
      }
      a2 = v216;
    }
    v158 = *(NSMapTable **)(a1 + 320);
    if (v158 && (v209 || (*(void *)(*(void *)(a1 + 80) + 16 * a4 + 8) & 7) == 2))
    {
      v159 = NSMapGet(v158, v139);
      if (v159) {
        unint64_t v140 = (unint64_t)v159;
      }
    }
    unsigned int v160 = *(uint64_t **)(a1 + 112);
    if (v160[6] > v140) {
      goto LABEL_244;
    }
    unint64_t v161 = -[VMUTask ptrauthStripDataPointer:](*(void *)(a1 + 8), v140);
    unint64_t v162 = v160[6];
    unint64_t v163 = v160[7];
    BOOL v146 = v163 >= v162;
    unint64_t v164 = v163 - v162;
    if (!v146) {
      goto LABEL_244;
    }
    unint64_t v165 = v161;
    if (v161 - v162 >= v164) {
      goto LABEL_244;
    }
    unint64_t v166 = v161 >> *MEMORY[0x1E4F14AF8];
    if (v166)
    {
      BOOL v167 = (unsigned int *)v160[3];
      unint64_t v168 = v161 >> *MEMORY[0x1E4F14AF8];
      do
      {
        if (*v167 <= (v168 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v167 + ((v168 & 0x3FFFFFF) >> 3) + 4) >> (v168 & 7)) & 1) == 0)
        {
          goto LABEL_244;
        }
        v168 >>= 26;
      }
      while (v168);
    }
    uint64_t v169 = (uint64_t)v160 + 4 * (v166 & 0x7FFFF);
    int v172 = *(_DWORD *)(v169 + 64);
    v171 = (_DWORD *)(v169 + 64);
    int v170 = v172;
    if (v172)
    {
      unint64_t v173 = v160[4] + ((unint64_t)(v170 - 1) << 6);
      if (v161 - *(void *)(*(void *)v173 + 8) < *(void *)(*(void *)v173 + 16)) {
        goto LABEL_257;
      }
    }
    unint64_t v188 = *((unsigned int *)v160 + 10);
    if (!v188)
    {
LABEL_283:
      a2 = v216;
      goto LABEL_244;
    }
    unint64_t v189 = v160[4];
    while (1)
    {
      unint64_t v190 = v188 >> 1;
      unint64_t v173 = v189 + (v188 >> 1 << 6);
      if (*(void *)(*(void *)v173 + 8) <= v161)
      {
        if (*(void *)(*(void *)v173 + 16) + *(void *)(*(void *)v173 + 8) > v161)
        {
          uint64_t v206 = v160[4];
          v207 = v171;
          int v191 = [*(id *)v173 isSpecialPhysFootprintRegion];
          if (v191) {
            unint64_t v192 = 0;
          }
          else {
            unint64_t v192 = v173;
          }
          if (v191) {
            goto LABEL_283;
          }
          uint64_t v195 = v206;
          v194 = v207;
          if ((*(unsigned char *)(*(void *)v192 + 132) & 1) == 0) {
            goto LABEL_312;
          }
          v196 = (id *)(v192 + 64);
          unint64_t v197 = *((unsigned int *)v160 + 10) - ((uint64_t)(v192 + 64 - v160[4]) >> 6);
          if (!v197) {
            goto LABEL_309;
          }
          while (2)
          {
            unint64_t v198 = v197 >> 1;
            v199 = &v196[8 * (v197 >> 1)];
            if (*((void *)*v199 + 1) > v165)
            {
LABEL_295:
              BOOL v145 = v197 > 1;
              unint64_t v197 = v198;
              if (!v145)
              {
                unint64_t v197 = 0;
                goto LABEL_309;
              }
              continue;
            }
            break;
          }
          if (*((void *)*v199 + 2) + *((void *)*v199 + 1) <= v165)
          {
            v196 = v199 + 8;
            unint64_t v198 = --v197 >> 1;
            goto LABEL_295;
          }
          unint64_t v205 = v192;
          int v204 = [*v199 isSpecialPhysFootprintRegion];
          unint64_t v192 = v205;
          uint64_t v195 = v206;
          v194 = v207;
          if (v204) {
            unint64_t v197 = 0;
          }
          else {
            unint64_t v197 = (unint64_t)v199;
          }
LABEL_309:
          if (v197) {
            unint64_t v192 = v197;
          }
          unint64_t v173 = v192;
LABEL_312:
          _DWORD *v194 = ((v192 - v195) >> 6) + 1;
LABEL_257:
          unsigned int v174 = *(_DWORD *)(v173 + 20);
          if (!v174) {
            goto LABEL_283;
          }
          uint64_t v175 = *(void *)(v173 + 8);
          uint64_t v176 = *v160;
          uint64_t v177 = *(unsigned int *)(v173 + 16);
          v178 = (unint64_t *)(*v160 + 16 * v177);
          if (v175)
          {
            a2 = v216;
            if (*v178 > v165) {
              goto LABEL_244;
            }
            v179 = (void *)(v176 + 16 * (v174 + v177 - 1));
            if (((v179[1] >> 5) & 0xFFFFFFFFFuLL) + *v179 <= v165) {
              goto LABEL_244;
            }
            v180 = (unsigned int *)(v175 + 4 * ((v165 - (*v178 & -*MEMORY[0x1E4F14B00])) >> *MEMORY[0x1E4F14AF8]));
            uint64_t v181 = *v180;
            v182 = (unint64_t *)(v176 + 16 * v181);
            if (*v182 > v165) {
              goto LABEL_244;
            }
            uint64_t v183 = v180[1];
            if (v183 < *((_DWORD *)v160 + 2))
            {
              v184 = (unint64_t *)(v176 + 16 * v183);
              unint64_t v185 = *v184;
              if (*v184 <= v165)
              {
LABEL_297:
                unint64_t v200 = v184[1];
                if ((v200 & 7) - 2 < 3) {
                  goto LABEL_244;
                }
                unint64_t v201 = ((unint64_t)v184 - v176) >> 4;
                unint64_t v202 = v160[2];
                if (v165 - v185 >= v202)
                {
                  if (((v200 >> 5) & 0xFFFFFFFFFLL) - (v165 - v185) > v202 || v201 == -1) {
                    goto LABEL_244;
                  }
                }
                else if (v201 == -1)
                {
                  goto LABEL_244;
                }
                (*(void (**)(uint64_t, void, char *, uint64_t))(a9 + 16))(a9, a4, v139, v153);
                goto LABEL_244;
              }
            }
            unsigned int v186 = v183 - v181;
            if (v186)
            {
              do
              {
                uint64_t v187 = v186 >> 1;
                v184 = &v182[2 * v187];
                unint64_t v185 = *v184;
                if (*v184 <= v165)
                {
                  if (((v182[2 * v187 + 1] >> 5) & 0xFFFFFFFFFLL) + v185 > v165) {
                    goto LABEL_297;
                  }
                  v182 = v184 + 2;
                  LODWORD(v187) = --v186 >> 1;
                }
                BOOL v146 = v186 >= 2;
                unsigned int v186 = v187;
              }
              while (v146);
            }
          }
          else
          {
            a2 = v216;
            do
            {
              uint64_t v193 = v174 >> 1;
              v184 = &v178[2 * v193];
              unint64_t v185 = *v184;
              if (*v184 <= v165)
              {
                if (((v178[2 * v193 + 1] >> 5) & 0xFFFFFFFFFLL) + v185 > v165) {
                  goto LABEL_297;
                }
                v178 = v184 + 2;
                LODWORD(v193) = --v174 >> 1;
              }
              BOOL v146 = v174 >= 2;
              unsigned int v174 = v193;
            }
            while (v146);
          }
LABEL_244:
          unint64_t v136 = v212;
LABEL_245:
          unint64_t v71 = (unint64_t *)((char *)v71 + v227);
          if ((unint64_t)v71 > v136)
          {
LABEL_192:

            goto LABEL_193;
          }
          goto LABEL_196;
        }
        unint64_t v189 = v173 + 64;
        unint64_t v190 = --v188 >> 1;
      }
      BOOL v146 = v188 >= 2;
      unint64_t v188 = v190;
      if (!v146) {
        goto LABEL_283;
      }
    }
  }
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
    void v14[2] = 0x2020000000;
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
    v6[2] = __47__VMUTaskMemoryScanner__withOrderedNodeMapper___block_invoke;
    v6[3] = &unk_1E5D23210;
    uint64_t v8 = v16;
    unsigned int v9 = v12;
    uint64_t v10 = v14;
    unsigned int v11 = v13;
    v6[4] = self;
    id v7 = 0;
    (*((void (**)(id, void *))v4 + 2))(v4, v6);

    _Block_object_dispose(v12, 8);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

void __47__VMUTaskMemoryScanner__withOrderedNodeMapper___block_invoke(uint64_t *a1, unsigned int a2, int a3, uint64_t a4)
{
  if (!a4) {
    return;
  }
  uint64_t v5 = a1[4];
  if (*(_DWORD *)(v5 + 88) <= a2) {
    return;
  }
  uint64_t v8 = (unint64_t *)(*(void *)(v5 + 80) + 16 * a2);
  unint64_t v9 = *v8;
  unsigned int v11 = v8 + 1;
  unint64_t v10 = v8[1];
  if (a3 || (uint64_t v34 = *(unsigned int *)(*(void *)(a1[6] + 8) + 24), v34 == -1))
  {
    unint64_t v12 = v8[1];
  }
  else
  {
    unint64_t v12 = v8[1];
    if (*(void *)(*(void *)(a1[7] + 8) + 24) <= v9)
    {
      uint64_t v136 = *(void *)(v5 + 80) + 16 * a2;
      unint64_t v35 = *(void **)(v5 + 96);
      uint64_t v36 = *(void **)(v5 + 56);
      id v37 = *(id *)(v5 + 64);
      id v38 = v36;
      int v39 = v35;
      unint64_t v40 = v38;
      unsigned int v41 = &v35[8 * v34];
      if (v41[6])
      {
        if ((void *)v41[7] == v41)
        {
          uint64_t v139 = MEMORY[0x1E4F143A8];
          unint64_t v83 = v39;
          uint64_t v140 = 3221225472;
          BOOL v141 = ___unmapRegion_block_invoke;
          char v142 = &unk_1E5D23460;
          id v143 = v38;
          BOOL v145 = v41;
          id v144 = v37;
          BOOL v146 = v83;
          id v84 = (void (**)(void))MEMORY[0x1AD0DA230](&v139);
          v84[2]();
        }
        else
        {
          uint64_t v42 = &v39[8 * v34];
          v42[5] = 0;
          v42[6] = 0;
          v42[7] = 0;
        }
      }

      *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -1;
      unint64_t v12 = *v11;
      uint64_t v8 = (unint64_t *)v136;
    }
  }
  int v13 = v12 & 7;
  if (v13 == 4)
  {
    uint64_t v14 = [*(id *)(a1[4] + 224) threadStateForThreadNum:v12 >> 41];
    if (v14) {
      (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v14);
    }
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = -1;
    return;
  }
  if ((v12 & 0x1FFFFFFFFE0) == 0) {
    return;
  }
  if (v13 == 1)
  {
    for (;
          *(void *)(*(void *)(a1[7] + 8) + 24) <= *v8;
          *(void *)(*(void *)(a1[7] + 8) + 24) = *(void *)(*(void *)(*(void *)(a1[4] + 96)
                                                                             + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24) << 6))
                                                                 + 16)
                                                     + *(void *)(*(void *)(a1[9] + 8) + 24))
    {
      *(void *)(*(void *)(a1[9] + 8) + 24) = *(void *)(*(void *)(*(void *)(a1[4] + 96)
                                                                         + ((unint64_t)++*(_DWORD *)(*(void *)(a1[8] + 8) + 24) << 6))
                                                             + 8);
    }
    uint64_t v15 = a1[4];
    uint64_t v16 = *(void *)(v15 + 96);
    uint64_t v17 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24);
    BOOL v18 = (id *)(v16 + (v17 << 6));
    if ((*((_DWORD *)*v18 + 13) & 3) != 2)
    {
      unint64_t v19 = ((v10 >> 5) & 0xFFFFFFFFFLL) + v9;
      uint64_t v20 = *(void *)(a1[7] + 8);
      unint64_t v22 = *(void *)(v20 + 24);
      unint64_t v21 = (void *)(v20 + 24);
      BOOL v135 = v8;
      if (v22 < v19)
      {
        unsigned int v23 = v17 + 1;
        do
        {
          unsigned int v24 = v23;
          unint64_t v25 = (void *)(*(void *)(*(void *)(a1[4] + 96) + ((unint64_t)v23 << 6)) + 8);
          *unint64_t v21 = v25[1] + *v25;
          ++v23;
          uint64_t v26 = *(void *)(a1[7] + 8);
          unint64_t v27 = *(void *)(v26 + 24);
          unint64_t v21 = (void *)(v26 + 24);
        }
        while (v27 < v19);
        uint64_t v28 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24);
        int v29 = v23 - v28;
        uint64_t v30 = a1[4];
        uint64_t v121 = v28;
        unint64_t v126 = (void *)(*(void *)(v30 + 96) + (v28 << 6));
        unint64_t v31 = *(void **)(v30 + 56);
        unint64_t v32 = *(void **)(v30 + 64);
        uint64_t v119 = *(void *)(v30 + 96);
        if (a3 == 1) {
          unint64_t v33 = (void *)a1[5];
        }
        else {
          unint64_t v33 = 0;
        }
        uint64_t v85 = v24;
        id v86 = *(id *)(v30 + 8);
        id v123 = v32;
        id v131 = v31;
        id v134 = v33;
        int v120 = v29;
        if (v29)
        {
          uint64_t v87 = 0;
          uint64_t v88 = v23 - v121;
          unint64_t v89 = v126;
          unint64_t v90 = v126;
          unint64_t v91 = v135;
          do
          {
            uint64_t v92 = *v90;
            v90 += 8;
            v87 += *(void *)(v92 + 16);
            --v88;
          }
          while (v88);
        }
        else
        {
          uint64_t v87 = 0;
          unint64_t v91 = v135;
          unint64_t v89 = v126;
        }
        LODWORD(v125) = v23 - 1;
        v147[0] = 0;
        uint64_t v138 = 0;
        unint64_t v93 = (void *)[v131 findMappedAddress:*(void *)(*v89 + 8) size:v87];
        if (v93)
        {
          uint64_t v94 = v93[1];
          uint64_t v95 = *(void *)(*v89 + 8) - *v93;
          v147[0] = v93[2] + v95;
          uint64_t v138 = v94 - v95;
        }
        else
        {
          uint64_t v117 = v86;
          uint64_t v118 = v85;
          unint64_t v102 = v123;
          if (v120)
          {
            uint64_t v103 = v23 - v121;
            uint64_t v104 = v126;
            do
            {
              id v105 = v102;
              id v106 = v131;
              v107 = v134;
              if (v104[6])
              {
                if (v104 == (void *)v104[7])
                {
                  uint64_t v139 = MEMORY[0x1E4F143A8];
                  uint64_t v140 = 3221225472;
                  BOOL v141 = ___unmapRegion_block_invoke;
                  char v142 = &unk_1E5D23460;
                  id v143 = v106;
                  BOOL v145 = v104;
                  id v144 = v105;
                  BOOL v146 = v126;
                  unint64_t v108 = (void (**)(void))MEMORY[0x1AD0DA230](&v139);
                  v109 = v108;
                  if (v134) {
                    dispatch_async(v107, v108);
                  }
                  else {
                    v108[2](v108);
                  }

                  unint64_t v102 = v123;
                }
                else
                {
                  v104[5] = 0;
                  v104[6] = 0;
                  v104[7] = 0;
                }
              }

              v104 += 8;
              --v103;
            }
            while (v103);
          }
          unint64_t v89 = v126;
          unint64_t v91 = v135;
          id v86 = v117;
          uint64_t v85 = v118;
          if ([v131 mapAddress:*(void *)(*v126 + 8) size:v87 returnedAddress:v147 returnedSize:&v138])
          {
            if (task_exists(v117)) {
              fprintf((FILE *)*MEMORY[0x1E4F143C8], "Failed to map remote region at [%#llx-%#llx]\n", *(void *)(*v126 + 8), *(void *)(*v126 + 8) + v87);
            }
            goto LABEL_65;
          }
        }
        if (v120)
        {
          uint64_t v96 = v138;
          uint64_t v97 = v147[0];
          uint64_t v98 = (void *)(v119 + (v121 << 6) + 56);
          uint64_t v99 = v23 - v121;
          do
          {
            *(v98 - 1) = v97;
            void *v98 = v89;
            *(v98 - 2) = v96;
            uint64_t v100 = *(v98 - 7) + 8;
            v97 += *(void *)(*(v98 - 7) + 16);
            v147[0] = v97;
            v96 -= *(void *)(v100 + 8);
            uint64_t v138 = v96;
            v98 += 8;
            --v99;
          }
          while (v99);
        }
LABEL_65:

        uint64_t v101 = *(void *)(a1[4] + 96);
        uint64_t v61 = *(void *)(*(void *)(v101 + (v85 << 6)) + 8);
LABEL_87:
        uint64_t v115 = *(void *)(a1[8] + 8);
        uint64_t v116 = *(void *)(v101 + ((unint64_t)*(unsigned int *)(v115 + 24) << 6) + 48);
        if (v116)
        {
          (*(void (**)(uint64_t, unint64_t))(a4 + 16))(a4, v116 + *v91 - *(void *)(*(void *)(a1[9] + 8) + 24));
          uint64_t v115 = *(void *)(a1[8] + 8);
        }
        *(_DWORD *)(v115 + 24) = v125;
        *(void *)(*(void *)(a1[9] + 8) + 24) = v61;
        return;
      }
      uint64_t v61 = *(void *)(*(void *)(a1[9] + 8) + 24);
      uint64_t v62 = *(void **)(v15 + 56);
      int v63 = *(_DWORD *)(v15 + 104);
      uint64_t v64 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24);
      id v65 = *(id *)(v15 + 8);
      id v66 = v62;
      uint64_t v125 = v64;
      uint64_t v67 = v16 + (v64 << 6);
      unint64_t v68 = v65;
      uint64_t v70 = *(void *)(v67 + 48);
      id v69 = (void *)(v67 + 48);
      if (!v70)
      {
        unint64_t v71 = v66;
        char v72 = [*v18 isSpecialPhysFootprintRegion];
        id v66 = v71;
        if ((v72 & 1) == 0)
        {
          uint64_t v139 = 0;
          v147[0] = 0;
          int v73 = [v71 mapAddress:*((void *)*v18 + 1) size:*((void *)*v18 + 2) returnedAddress:&v139 returnedSize:v147];
          if (v73)
          {
            id v66 = v71;
            if ((*((_DWORD *)*v18 + 13) & 3u) - 1 < 2) {
              goto LABEL_86;
            }
            int v74 = v73;
            BOOL v75 = task_exists(v68);
            id v66 = v71;
            if (v125 == v63 - 1 || !v75) {
              goto LABEL_86;
            }
            int v133 = (FILE *)*MEMORY[0x1E4F143C8];
            uint64_t v130 = [*v18 address];
            uint64_t v76 = *((unsigned int *)*v18 + 6);
            unint64_t v128 = vm_prot_strings[v76];
            uint64_t v77 = *((void *)*v18 + 2) + *((void *)*v18 + 1);
            VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)*v18 + 232), *((unsigned __int8 *)*v18 + 104), *((unsigned __int8 *)*v18 + 50), v76, *((unsigned __int8 *)*v18 + 49));
            id v78 = objc_claimAutoreleasedReturnValue();
            uint64_t v79 = (const char *)[v78 UTF8String];
            uint64_t v80 = *((void *)*v18 + 2) >> *MEMORY[0x1E4F14AF8];
            if (v80 == 1) {
              unint64_t v81 = "page";
            }
            else {
              unint64_t v81 = "pages";
            }
            if (*(void *)(v16 + (v125 << 6) + 24) == *(void *)(v16 + (v125 << 6) + 32)) {
              unsigned int v82 = "";
            }
            else {
              unsigned int v82 = " [root]";
            }
            fprintf(v133, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v130, v77, v128, v79, v80, v81, v82, v74);
          }
          else
          {
            uint64_t v113 = v147[0];
            *id v69 = v139;
            uint64_t v114 = v16 + (v125 << 6);
            *(void *)(v114 + 40) = v113;
            *(void *)(v114 + 56) = v18;
          }
          id v66 = v71;
        }
      }
LABEL_86:

      uint64_t v101 = *(void *)(a1[4] + 96);
      unint64_t v91 = v135;
      goto LABEL_87;
    }
  }
  else if (VMUGraphNodeType_IsVMRegion(v13))
  {
    *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = *v11 >> 41;
    id v43 = objc_retain(*(id *)(*(void *)(a1[4] + 96)
                            + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24) << 6)));
    if (-[VMUTaskMemoryScanner _shouldScanVMregion:](a1[4], *(void *)(a1[4] + 96)+ ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24) << 6)))
    {
      unsigned int v137 = v8;
      *(void *)(*(void *)(a1[9] + 8) + 24) = [v43 address];
      uint64_t v44 = *(void *)(*(void *)(a1[9] + 8) + 24);
      *(void *)(*(void *)(a1[7] + 8) + 24) = [v43 length] + v44;
      uint64_t v45 = a1[4];
      uint64_t v46 = *(void *)(v45 + 96);
      uint64_t v47 = *(unsigned int *)(*(void *)(a1[8] + 8) + 24);
      uint64_t v48 = v46 + (v47 << 6);
      unint64_t v49 = *(void **)(v45 + 56);
      int v50 = *(_DWORD *)(v45 + 104);
      id v132 = *(id *)(v45 + 8);
      id v51 = v49;
      if (!*(void *)(v48 + 48) && ([*(id *)v48 isSpecialPhysFootprintRegion] & 1) == 0)
      {
        uint64_t v139 = 0;
        v147[0] = 0;
        int v52 = [v51 mapAddress:*(void *)(*(void *)v48 + 8) size:*(void *)(*(void *)v48 + 16) returnedAddress:&v139 returnedSize:v147];
        if (v52)
        {
          if ((*(_DWORD *)(*(void *)v48 + 52) & 3u) - 1 >= 2)
          {
            int v53 = v52;
            BOOL v54 = task_exists(v132);
            if (v47 != v50 - 1 && v54)
            {
              unint64_t v129 = (FILE *)*MEMORY[0x1E4F143C8];
              uint64_t v127 = [*(id *)v48 address];
              uint64_t v55 = *(unsigned int *)(*(void *)v48 + 24);
              unint64_t v124 = vm_prot_strings[v55];
              uint64_t v122 = *(void *)(*(void *)v48 + 16) + *(void *)(*(void *)v48 + 8);
              VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*(unsigned __int8 *)(*(void *)v48 + 232), *(unsigned __int8 *)(*(void *)v48 + 104), *(unsigned __int8 *)(*(void *)v48 + 50), v55, *(unsigned __int8 *)(*(void *)v48 + 49));
              id v56 = objc_claimAutoreleasedReturnValue();
              unint64_t v57 = (const char *)[v56 UTF8String];
              uint64_t v58 = *(void *)(*(void *)v48 + 16) >> *MEMORY[0x1E4F14AF8];
              if (v58 == 1) {
                int v59 = "page";
              }
              else {
                int v59 = "pages";
              }
              if (*(void *)(v46 + (v47 << 6) + 24) == *(void *)(v46 + (v47 << 6) + 32)) {
                uint64_t v60 = "";
              }
              else {
                uint64_t v60 = " [root]";
              }
              fprintf(v129, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v127, v122, v124, v57, v58, v59, v60, v53);
            }
          }
        }
        else
        {
          uint64_t v110 = v147[0];
          *(void *)(v48 + 48) = v139;
          uint64_t v111 = v46 + (v47 << 6);
          *(void *)(v111 + 40) = v110;
          *(void *)(v111 + 56) = v48;
        }
      }

      uint64_t v112 = *(void *)(*(void *)(a1[4] + 96)
                       + ((unint64_t)*(unsigned int *)(*(void *)(a1[8] + 8) + 24) << 6)
                       + 48);
      if (v112)
      {
        (*(void (**)(uint64_t, unint64_t))(a4 + 16))(a4, v112 + *v137 - *(void *)(*(void *)(a1[9] + 8) + 24));
        if (!a3) {
          *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(*(void *)(a1[8] + 8) + 24);
        }
      }
    }
  }
}

- (void)scanNodesWithReferenceRecorder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1AD0DA230]();
  if (self->_referenceLogger
    || (unint64_t maxInteriorOffset = self->_maxInteriorOffset, maxInteriorOffset != -1)
    && (!maxInteriorOffset || (maxInteriorOffset & ~(-1 << *MEMORY[0x1E4F14AF8])) != 0))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke;
    v12[3] = &unk_1E5D23238;
    void v12[4] = self;
    id v13 = v4;
    uint64_t v6 = MEMORY[0x1AD0DA230](v12);

    uint64_t v5 = (void *)v6;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2;
  v9[3] = &unk_1E5D23348;
  v9[4] = self;
  id v10 = v5;
  int v11 = 0;
  id v7 = v5;
  [(VMUTaskMemoryScanner *)self _withOrderedNodeMapper:v9];
  [(VMUTaskMemoryScanner *)self unmapAllRegions];
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v6 = *(void **)(result + 32);
  if ((unint64_t)(a6 - *(void *)(v6[10] + 16 * a5)) <= v6[46])
  {
    uint64_t v7 = result;
    if (v6[59])
    {
      uint64_t v8 = (void *)MEMORY[0x1AD0D9F90]();
      (*(void (**)(void))(*(void *)(*(void *)(v7 + 32) + 472) + 16))();
    }
    unint64_t v9 = *(uint64_t (**)(void))(*(void *)(v7 + 40) + 16);
    return v9();
  }
  return result;
}

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 88))
  {
    unint64_t v5 = 0;
    while (1)
    {
      int v6 = *(_DWORD *)(*(void *)(v2 + 80) + 16 * v5 + 8);
      if (*(void *)(v2 + 480))
      {
        uint64_t v7 = (void *)MEMORY[0x1AD0D9F90]();
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 480) + 16))();
      }
      int v8 = v6 & 7;
      if (v8 == 1)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        if (*(_DWORD *)(v9 + 308) != -1)
        {
          uint64_t v10 = *(void *)(v9 + 112);
          unint64_t v11 = *(void *)(v10 + 48);
          unint64_t v12 = *(void *)(v10 + 56);
          BOOL v35 = v12 >= v11;
          unint64_t v13 = v12 - v11;
          if (v35)
          {
            unint64_t v14 = *(void *)(*(void *)(v9 + 80) + 16 * v5);
            if (v14 - v11 < v13)
            {
              unint64_t v15 = v14 >> *MEMORY[0x1E4F14AF8];
              if (v15)
              {
                uint64_t v16 = *(unsigned int **)(v10 + 24);
                unint64_t v17 = v14 >> *MEMORY[0x1E4F14AF8];
                do
                {
                  if (*v16 <= (v17 & 0x3FFFFFF)
                    || ((*((unsigned __int8 *)v16 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) == 0)
                  {
                    goto LABEL_136;
                  }
                  v17 >>= 26;
                }
                while (v17);
              }
              uint64_t v18 = v10 + 4 * (v15 & 0x7FFFF);
              int v21 = *(_DWORD *)(v18 + 64);
              uint64_t v20 = (_DWORD *)(v18 + 64);
              int v19 = v21;
              uint64_t v22 = *(void *)(v10 + 32);
              if (v21)
              {
                unsigned int v23 = (id *)(v22 + ((unint64_t)(v19 - 1) << 6));
                if (v14 - *((void *)*v23 + 1) < *((void *)*v23 + 2)) {
                  goto LABEL_17;
                }
              }
              unint64_t v59 = *(unsigned int *)(v10 + 40);
              if (v59)
              {
                uint64_t v60 = *(id **)(v10 + 32);
                do
                {
                  unint64_t v61 = v59 >> 1;
                  unsigned int v23 = &v60[8 * (v59 >> 1)];
                  if (*((void *)*v23 + 1) <= v14)
                  {
                    if (*((void *)*v23 + 2) + *((void *)*v23 + 1) > v14)
                    {
                      int v117 = [*v23 isSpecialPhysFootprintRegion];
                      if (v117) {
                        uint64_t v118 = 0;
                      }
                      else {
                        uint64_t v118 = v23;
                      }
                      if (v117) {
                        break;
                      }
                      if ((*((unsigned char *)*v118 + 132) & 1) == 0) {
                        goto LABEL_158;
                      }
                      uint64_t v125 = v118 + 8;
                      unint64_t v126 = *(unsigned int *)(v10 + 40) - (((uint64_t)v118 - *(void *)(v10 + 32) + 64) >> 6);
                      if (!v126) {
                        goto LABEL_155;
                      }
                      while (1)
                      {
                        unint64_t v127 = v126 >> 1;
                        unint64_t v128 = &v125[8 * (v126 >> 1)];
                        if (*((void *)*v128 + 1) <= v14)
                        {
                          if (*((void *)*v128 + 2) + *((void *)*v128 + 1) > v14)
                          {
                            if ([*v128 isSpecialPhysFootprintRegion]) {
                              unint64_t v126 = 0;
                            }
                            else {
                              unint64_t v126 = (unint64_t)v128;
                            }
LABEL_155:
                            if (v126) {
                              uint64_t v118 = (id *)v126;
                            }
                            unsigned int v23 = v118;
LABEL_158:
                            *uint64_t v20 = (((unint64_t)v118 - v22) >> 6) + 1;
LABEL_17:
                            if (*((_DWORD *)*v23 + 37) == *(_DWORD *)(*(void *)(a1 + 32) + 308)) {
                              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
                            }
                            goto LABEL_136;
                          }
                          uint64_t v125 = v128 + 8;
                          unint64_t v127 = --v126 >> 1;
                        }
                        BOOL v105 = v126 > 1;
                        unint64_t v126 = v127;
                        if (!v105)
                        {
                          unint64_t v126 = 0;
                          goto LABEL_155;
                        }
                      }
                    }
                    uint64_t v60 = v23 + 8;
                    unint64_t v61 = --v59 >> 1;
                  }
                  BOOL v35 = v59 >= 2;
                  unint64_t v59 = v61;
                }
                while (v35);
              }
            }
          }
        }
LABEL_136:
        uint64_t v119 = *(unsigned int *)(a1 + 48);
        v158[0] = MEMORY[0x1E4F143A8];
        v158[1] = 3221225472;
        v158[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3;
        v158[3] = &unk_1E5D232A8;
        int v120 = *(void **)(a1 + 40);
        v158[4] = *(void *)(a1 + 32);
        int v160 = v5;
        id v159 = v120;
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v119, v158);
        int v52 = v159;
        goto LABEL_137;
      }
      if (VMUGraphNodeType_IsVMRegion(v6 & 7))
      {
        uint64_t v24 = *(void *)(a1 + 32);
        unint64_t v25 = (mach_vm_address_t *)(*(void *)(v24 + 80) + 16 * v5);
        mach_vm_address_t v26 = *v25;
        mach_vm_address_t v29 = v25[1];
        unint64_t v27 = v25 + 1;
        mach_vm_address_t v28 = v29;
        kcd_addr_begin[0] = 0;
        kcd_addr_begin[1] = (mach_vm_address_t)kcd_addr_begin;
        kcd_addr_begin[2] = 0x2020000000;
        kcd_addr_begin[3] = v26;
        mach_vm_size_t kcd_size = 0;
        p_mach_vm_size_t kcd_size = &kcd_size;
        uint64_t v155 = 0x2020000000;
        unint64_t v156 = 0;
        unint64_t v156 = (*v27 >> 5) & 0xFFFFFFFFFLL;
        if (v156 >= 8)
        {
          mach_vm_address_t v30 = ((v28 >> 5) & 0xFFFFFFFFFLL) + v26;
          id v31 = *(id *)(*(void *)(v24 + 96) + ((*v27 >> 35) & 0x1FFFFFC0));
          unint64_t v32 = (void *)MEMORY[0x1AD0DA230](*(void *)(a1 + 40));
          uint64_t v33 = *(void *)(a1 + 32);
          mach_vm_address_t v34 = *(void *)(v33 + 528);
          BOOL v35 = v26 > v34 || v34 >= v30;
          if (!v35)
          {
            uint64_t v36 = *(unsigned int *)(a1 + 48);
            v149[0] = MEMORY[0x1E4F143A8];
            v149[1] = 3221225472;
            v149[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6;
            v149[3] = &unk_1E5D232D0;
            v149[4] = v33;
            mach_vm_address_t v151 = v26;
            int v152 = v5;
            id v150 = *(id *)(a1 + 40);
            (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v36, v149);
            v147[0] = MEMORY[0x1E4F143A8];
            v147[1] = 3221225472;
            void v147[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7;
            v147[3] = &unk_1E5D23238;
            id v37 = *(void **)(a1 + 40);
            v147[4] = *(void *)(a1 + 32);
            id v148 = v37;
            uint64_t v38 = MEMORY[0x1AD0DA230](v147);

            unint64_t v32 = (void *)v38;
          }
          int v39 = [v31 isFoundation];
          uint64_t v40 = *(void *)(a1 + 32);
          if (v39)
          {
            unint64_t v41 = v5 + 1;
            if (v5 + 1 < *(unsigned int *)(v40 + 88))
            {
              uint64_t v42 = *(void *)(v40 + 80);
              if (*(void *)(v42 + 16 * v41) == v30)
              {
                unint64_t v43 = *(void *)(v42 + 16 * v41 + 8);
                if (p_kcd_size[3] == ((v43 >> 5) & 0xFFFFFFFFFLL))
                {
                  BOOL IsVMRegion = VMUGraphNodeType_IsVMRegion(v43 & 7);
                  uint64_t v40 = *(void *)(a1 + 32);
                  if (IsVMRegion)
                  {
                    uint64_t v45 = objc_retain(*(id *)(*(void *)(v40 + 96)
                                            + ((*(void *)(*(void *)(v40 + 80) + 16 * v41 + 8) >> 35) & 0x1FFFFFC0)));
                    uint64_t v46 = v45;
                    if (v45[49] && [v45 protection] == 5) {
                      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
                    }

                    uint64_t v40 = *(void *)(a1 + 32);
                  }
                }
              }
            }
          }
          uint64_t v47 = *(unsigned int *)(a1 + 48);
          v139[0] = MEMORY[0x1E4F143A8];
          v139[1] = 3221225472;
          v139[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8;
          v139[3] = &unk_1E5D232F8;
          mach_vm_address_t v144 = v26;
          mach_vm_address_t v145 = v30;
          v139[4] = v40;
          char v142 = &kcd_size;
          id v143 = kcd_addr_begin;
          int v146 = v5;
          id v48 = v32;
          id v141 = v48;
          id v49 = v31;
          id v140 = v49;
          (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v47, v139);
        }
        _Block_object_dispose(&kcd_size, 8);
        _Block_object_dispose(kcd_addr_begin, 8);
        goto LABEL_138;
      }
      if (v8 == 3) {
        break;
      }
      if (v8 == 4)
      {
        uint64_t v50 = *(unsigned int *)(a1 + 48);
        v136[0] = MEMORY[0x1E4F143A8];
        v136[1] = 3221225472;
        v136[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_9;
        v136[3] = &unk_1E5D232A8;
        id v51 = *(void **)(a1 + 40);
        v136[4] = *(void *)(a1 + 32);
        int v138 = v5;
        id v137 = v51;
        (*(void (**)(uint64_t, unint64_t, uint64_t, void *))(a2 + 16))(a2, v5, v50, v136);
        int v52 = v137;
        goto LABEL_137;
      }
LABEL_138:
      ++v5;
      uint64_t v2 = *(void *)(a1 + 32);
      if (v5 >= *(unsigned int *)(v2 + 88)) {
        return;
      }
    }
    uint64_t v53 = *(void *)(a1 + 32);
    uint64_t v54 = *(void *)(*(void *)(v53 + 80) + 16 * v5);
    v132[0] = MEMORY[0x1E4F143A8];
    v132[1] = 3221225472;
    v132[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_10;
    v132[3] = &unk_1E5D23320;
    v132[4] = v53;
    id v55 = *(id *)(a1 + 40);
    int v135 = v5;
    id v133 = v55;
    uint64_t v134 = v54;
    id v56 = (void (**)(void, void, void))MEMORY[0x1AD0DA230](v132);
    if ([*(id *)(*(void *)(a1 + 32) + 8) isCore])
    {
      kcd_addr_begin[0] = 0;
      unint64_t v57 = [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
      int v58 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v57, 0, kcd_addr_begin);

      if (!v58 && kcd_addr_begin[0])
      {
        if (kcd_addr_begin[0] >> 61)
        {
          NSLog(&cfstr_FailedToGetUda.isa);
        }
        else
        {
          uint64_t v121 = malloc_type_malloc(8 * kcd_addr_begin[0], 0x9C3CF025uLL);
          if (v121)
          {
            uint64_t v122 = v121;
            id v123 = [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
            int v124 = -[VMUTaskMemoryCache getCoreFileUdataPointersIntoBuffer:count:]((uint64_t)v123, (uint64_t)v122, kcd_addr_begin);

            if (!v124) {
              ((void (**)(void, void *, mach_vm_address_t))v56)[2](v56, v122, kcd_addr_begin[0]);
            }
            free(v122);
          }
        }
      }
      goto LABEL_144;
    }
    kcd_addr_begin[0] = 0;
    mach_vm_size_t kcd_size = 0;
    if (!task_map_corpse_info_64(*MEMORY[0x1E4F14960], [*(id *)(*(void *)(a1 + 32) + 8) taskPort], kcd_addr_begin, &kcd_size))
    {
      mach_vm_address_t v111 = kcd_addr_begin[0];
      mach_vm_size_t v112 = kcd_size;
      mach_vm_size_t v113 = kcd_size + kcd_addr_begin[0];
      mach_vm_address_t v114 = kcd_addr_begin[0] + 16;
      if (v111 + 16 <= kcd_size + v111
        && v114 + *(unsigned int *)(kcd_addr_begin[0] + 4) <= v113
        && *(_DWORD *)kcd_addr_begin[0] == -559025833)
      {
        do
        {
          mach_vm_address_t v115 = v114 + *(unsigned int *)(v111 + 4);
          if (v115 > v113) {
            break;
          }
          int v116 = *(_DWORD *)v111;
          if (*(_DWORD *)v111 == -242132755) {
            break;
          }
          if ((v116 == 17 || (v116 & 0xFFFFFFF0) == 0x20) && HIDWORD(*(void *)(v111 + 8)) == 2076)
          {
            v56[2](v56, v111 + 16, *(void *)(v111 + 8));
            mach_vm_address_t v115 = v114 + *(unsigned int *)(v111 + 4);
          }
          mach_vm_address_t v114 = v115 + 16;
          mach_vm_address_t v111 = v115;
        }
        while (v115 + 16 <= v113);
        mach_vm_address_t v111 = kcd_addr_begin[0];
        mach_vm_size_t v112 = kcd_size;
      }
      mach_vm_deallocate(*MEMORY[0x1E4F14960], v111, v112);
LABEL_144:

      int v52 = v133;
LABEL_137:

      goto LABEL_138;
    }
    [*(id *)(a1 + 32) pid];
    int v62 = proc_list_uptrs();
    if (v62 < 1) {
      goto LABEL_144;
    }
    int v63 = v62;
    uint64_t v130 = v56;
    uint64_t v64 = malloc_type_malloc((8 * v62), 0x1BE60CC1uLL);
    [*(id *)(a1 + 32) pid];
    proc_list_uptrs();
    id v65 = v64;
    uint64_t v66 = 0;
    id v131 = v64;
LABEL_55:
    uint64_t v67 = *(uint64_t **)(*(void *)(a1 + 32) + 112);
    unint64_t v68 = v67[6];
    unint64_t v69 = v67[7];
    BOOL v35 = v69 >= v68;
    unint64_t v70 = v69 - v68;
    if (!v35) {
      goto LABEL_105;
    }
    unint64_t v71 = v65[v66];
    if (v71 - v68 >= v70) {
      goto LABEL_105;
    }
    unint64_t v72 = v71 >> *MEMORY[0x1E4F14AF8];
    if (v72)
    {
      int v73 = (unsigned int *)v67[3];
      unint64_t v74 = v71 >> *MEMORY[0x1E4F14AF8];
      do
      {
        if (*v73 <= (v74 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v73 + ((v74 & 0x3FFFFFF) >> 3) + 4) >> (v74 & 7)) & 1) == 0)
        {
          goto LABEL_105;
        }
        v74 >>= 26;
      }
      while (v74);
    }
    uint64_t v75 = (uint64_t)v67 + 4 * (v72 & 0x7FFFF);
    int v78 = *(_DWORD *)(v75 + 64);
    uint64_t v77 = (_DWORD *)(v75 + 64);
    int v76 = v78;
    uint64_t v79 = v67[4];
    if (v78)
    {
      unint64_t v80 = v79 + ((unint64_t)(v76 - 1) << 6);
      if (v71 - *(void *)(*(void *)v80 + 8) < *(void *)(*(void *)v80 + 16)) {
        goto LABEL_65;
      }
    }
    unint64_t v96 = *((unsigned int *)v67 + 10);
    if (!v96) {
      goto LABEL_105;
    }
    unint64_t v97 = v67[4];
    while (1)
    {
      unint64_t v98 = v96 >> 1;
      unint64_t v80 = v97 + (v96 >> 1 << 6);
      if (*(void *)(*(void *)v80 + 8) <= v71)
      {
        if (*(void *)(*(void *)v80 + 16) + *(void *)(*(void *)v80 + 8) > v71)
        {
          int v99 = [*(id *)v80 isSpecialPhysFootprintRegion];
          id v65 = v131;
          if (v99) {
            unint64_t v100 = 0;
          }
          else {
            unint64_t v100 = v80;
          }
          if (v99) {
            goto LABEL_105;
          }
          if ((*(unsigned char *)(*(void *)v100 + 132) & 1) == 0) {
            goto LABEL_119;
          }
          uint64_t v101 = (id *)(v100 + 64);
          unint64_t v102 = *((unsigned int *)v67 + 10) - ((uint64_t)(v100 + 64 - v67[4]) >> 6);
          if (!v102) {
            goto LABEL_116;
          }
          while (2)
          {
            unint64_t v103 = v102 >> 1;
            uint64_t v104 = &v101[8 * (v102 >> 1)];
            if (*((void *)*v104 + 1) > v71)
            {
LABEL_99:
              BOOL v105 = v102 > 1;
              unint64_t v102 = v103;
              if (!v105)
              {
                unint64_t v102 = 0;
                goto LABEL_116;
              }
              continue;
            }
            break;
          }
          if (*((void *)*v104 + 2) + *((void *)*v104 + 1) <= v71)
          {
            uint64_t v101 = v104 + 8;
            unint64_t v103 = --v102 >> 1;
            goto LABEL_99;
          }
          unint64_t v129 = v100;
          int v110 = [*v104 isSpecialPhysFootprintRegion];
          unint64_t v100 = v129;
          id v65 = v131;
          if (v110) {
            unint64_t v102 = 0;
          }
          else {
            unint64_t v102 = (unint64_t)v104;
          }
LABEL_116:
          if (v102) {
            unint64_t v100 = v102;
          }
          unint64_t v80 = v100;
LABEL_119:
          *uint64_t v77 = ((v100 - v79) >> 6) + 1;
LABEL_65:
          unsigned int v81 = *(_DWORD *)(v80 + 20);
          if (v81)
          {
            uint64_t v82 = *(void *)(v80 + 8);
            uint64_t v83 = *v67;
            uint64_t v84 = *(unsigned int *)(v80 + 16);
            uint64_t v85 = (unint64_t *)(*v67 + 16 * v84);
            if (v82)
            {
              if (*v85 > v71) {
                goto LABEL_105;
              }
              id v86 = (void *)(v83 + 16 * (v81 + v84 - 1));
              if (((v86[1] >> 5) & 0xFFFFFFFFFuLL) + *v86 <= v71) {
                goto LABEL_105;
              }
              uint64_t v87 = (unsigned int *)(v82 + 4 * ((v71 - (*v85 & -*MEMORY[0x1E4F14B00])) >> *MEMORY[0x1E4F14AF8]));
              uint64_t v88 = *v87;
              unint64_t v89 = (unint64_t *)(v83 + 16 * v88);
              if (*v89 > v71) {
                goto LABEL_105;
              }
              uint64_t v90 = v87[1];
              if (v90 < *((_DWORD *)v67 + 2))
              {
                unint64_t v91 = (unint64_t *)(v83 + 16 * v90);
                unint64_t v92 = *v91;
                if (*v91 <= v71)
                {
LABEL_101:
                  unint64_t v106 = v91[1];
                  if ((v106 & 7) - 2 < 3) {
                    goto LABEL_105;
                  }
                  unint64_t v107 = ((unint64_t)v91 - v83) >> 4;
                  unint64_t v108 = v67[2];
                  if (v71 - v92 >= v108)
                  {
                    if (((v106 >> 5) & 0xFFFFFFFFFLL) - (v71 - v92) > v108 || v107 == -1) {
                      goto LABEL_105;
                    }
                  }
                  else if (v107 == -1)
                  {
                    goto LABEL_105;
                  }
                  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
                  id v65 = v131;
                  goto LABEL_105;
                }
              }
              unsigned int v93 = v90 - v88;
              if (v93)
              {
                do
                {
                  uint64_t v94 = v93 >> 1;
                  unint64_t v91 = &v89[2 * v94];
                  unint64_t v92 = *v91;
                  if (*v91 <= v71)
                  {
                    if (((v89[2 * v94 + 1] >> 5) & 0xFFFFFFFFFLL) + v92 > v71) {
                      goto LABEL_101;
                    }
                    unint64_t v89 = v91 + 2;
                    LODWORD(v94) = --v93 >> 1;
                  }
                  BOOL v35 = v93 >= 2;
                  unsigned int v93 = v94;
                }
                while (v35);
              }
            }
            else
            {
              do
              {
                uint64_t v95 = v81 >> 1;
                unint64_t v91 = &v85[2 * v95];
                unint64_t v92 = *v91;
                if (*v91 <= v71)
                {
                  if (((v85[2 * v95 + 1] >> 5) & 0xFFFFFFFFFLL) + v92 > v71) {
                    goto LABEL_101;
                  }
                  uint64_t v85 = v91 + 2;
                  LODWORD(v95) = --v81 >> 1;
                }
                BOOL v35 = v81 >= 2;
                unsigned int v81 = v95;
              }
              while (v35);
            }
          }
LABEL_105:
          if (++v66 == v63)
          {
            free(v65);
            id v56 = v130;
            goto LABEL_144;
          }
          goto LABEL_55;
        }
        unint64_t v97 = v80 + 64;
        unint64_t v98 = --v96 >> 1;
      }
      BOOL v35 = v96 >= 2;
      unint64_t v96 = v98;
      if (!v35) {
        goto LABEL_105;
      }
    }
  }
}

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 48);
  unint64_t v6 = *(void *)(*(void *)(v4 + 80) + 16 * v5 + 8);
  unint64_t v7 = (v6 >> 5) & 0xFFFFFFFFFLL;
  if (v7 >= 0x100
    && (*(_DWORD *)a2 == -1583242847 && !strncmp((const char *)(a2 + 4), "AUTORELEASE!", 0xCuLL)
     || v7 == 10240
     && *(_DWORD *)(v2 + 2048) == -1583242847
     && !strncmp((const char *)(v2 + 2052), "AUTORELEASE!", 0xCuLL)))
  {
    char v17 = *(unsigned char *)(v4 + 360);
    *(_DWORD *)(v4 + 300) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 360) = 0;
    uint64_t v18 = *(void *)(a1 + 32);
    int v19 = (uint64_t *)(*(void *)(v18 + 80) + 16 * *(unsigned int *)(a1 + 48));
    uint64_t v20 = *v19;
    unint64_t v21 = ((unint64_t)v19[1] >> 5) & 0xFFFFFFFFFLL;
    if (v21 == 10240)
    {
      if (*(_DWORD *)(v2 + 2048) == -1583242847)
      {
        int v22 = strncmp((const char *)(v2 + 2052), "AUTORELEASE!", 0xCuLL);
        if (v22) {
          unint64_t v21 = 10240;
        }
        else {
          unint64_t v21 = 0x2000;
        }
        if (!v22)
        {
          v20 += 2048;
          v2 += 2048;
        }
      }
      else
      {
        unint64_t v21 = 10240;
      }
    }
    unint64_t v23 = *(void *)(v2 + *(unsigned int *)[*(id *)(v18 + 64) autoreleasePoolPageLayout]) - v20;
    if (v21 < v23) {
      unint64_t v23 = v21;
    }
    if (v23 >= 0x4000) {
      unint64_t v24 = 0x4000;
    }
    else {
      unint64_t v24 = v23;
    }
    -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(void *)(a1 + 32), v2, 0, *(_DWORD *)(a1 + 48), v24, *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * *(unsigned int *)(a1 + 48) + 8) >> 41, 0, 8u, *(void *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 360) = v17;
    *(_DWORD *)(*(void *)(a1 + 32) + 300) = 0;
  }
  else
  {
    -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](v4, v2, 0, v5, (v6 >> 5) & 0xFFFFFFFFFLL, v6 >> 41, 0, 1u, *(void *)(a1 + 40));
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(const void **)(v8 + 240);
    size_t v10 = *(unsigned int *)(v8 + 248);
    __compar[0] = MEMORY[0x1E4F143A8];
    __compar[1] = 3221225472;
    __compar[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4;
    __compar[3] = &__block_descriptor_36_e15_i24__0r_v8r_v16l;
    int v30 = *(_DWORD *)(a1 + 48);
    unint64_t v11 = bsearch_b(0, v9, v10, 0x10uLL, __compar);
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(unsigned int *)(a1 + 48);
      unint64_t v14 = *(void **)(*(void *)(v12 + 256) + ((*(void *)(*(void *)(v12 + 80) + 16 * v13 + 8) >> 38) & 0x3FFFFF8));
      uint64_t v15 = v11[1];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5;
      v25[3] = &unk_1E5D23280;
      v25[4] = v12;
      uint64_t v27 = v2;
      int v28 = v13;
      id v26 = *(id *)(a1 + 40);
      id v16 = v14;
      [v16 enumerateStoredEntriesForObject:v2 ofSize:v6 >> 5 externalValues:v15 block:v25];
    }
  }
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t *a3)
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

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_5(uint64_t a1, void *a2, unsigned int a3, unsigned int a4)
{
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(result + 32);
  uint64_t v5 = *(void *)(a2 + *(void *)(v4 + 528) - *(void *)(result + 48));
  if (v5)
  {
    uint64_t v6 = result;
    unint64_t v7 = v5 + 0x2000;
    uint64_t v8 = *(uint64_t **)(v4 + 112);
    unint64_t v10 = v8[6];
    unint64_t v9 = v8[7];
    unint64_t v11 = v9 - v10;
    BOOL v12 = v9 < v10;
    if (v7 - v10 >= v11 || v12) {
      goto LABEL_47;
    }
    uint64_t v13 = (_DWORD *)MEMORY[0x1E4F14AF8];
    unint64_t v14 = v7 >> *MEMORY[0x1E4F14AF8];
    if (v14)
    {
      uint64_t v15 = (unsigned int *)v8[3];
      unint64_t v16 = v7 >> *MEMORY[0x1E4F14AF8];
      do
      {
        if (*v15 <= (v16 & 0x3FFFFFF)
          || ((*((unsigned __int8 *)v15 + ((v16 & 0x3FFFFFF) >> 3) + 4) >> (v16 & 7)) & 1) == 0)
        {
          goto LABEL_47;
        }
        v16 >>= 26;
      }
      while (v16);
    }
    uint64_t v17 = (uint64_t)v8 + 4 * (v14 & 0x7FFFF);
    int v20 = *(_DWORD *)(v17 + 64);
    int v19 = (_DWORD *)(v17 + 64);
    int v18 = v20;
    uint64_t v21 = v8[4];
    if (v20)
    {
      unint64_t v22 = v21 + ((unint64_t)(v18 - 1) << 6);
      if (v7 - *(void *)(*(void *)v22 + 8) < *(void *)(*(void *)v22 + 16)) {
        goto LABEL_11;
      }
    }
    unint64_t v40 = *((unsigned int *)v8 + 10);
    if (v40)
    {
      unint64_t v41 = v8[4];
      do
      {
        unint64_t v42 = v40 >> 1;
        unint64_t v22 = v41 + (v40 >> 1 << 6);
        uint64_t result = *(void *)v22;
        if (*(void *)(*(void *)v22 + 8) <= v7)
        {
          if (*(void *)(*(void *)v22 + 16) + *(void *)(*(void *)v22 + 8) > v7)
          {
            uint64_t result = [result isSpecialPhysFootprintRegion:a3:a4:0xFFFFFFFFLL];
            if (result) {
              unint64_t v43 = 0;
            }
            else {
              unint64_t v43 = v22;
            }
            if (result) {
              break;
            }
            if ((*(unsigned char *)(*(void *)v43 + 132) & 1) == 0) {
              goto LABEL_58;
            }
            uint64_t v44 = (uint64_t *)(v43 + 64);
            unint64_t v45 = *((unsigned int *)v8 + 10) - ((uint64_t)(v43 + 64 - v8[4]) >> 6);
            if (!v45) {
              goto LABEL_55;
            }
            while (1)
            {
              unint64_t v46 = v45 >> 1;
              uint64_t v47 = &v44[8 * (v45 >> 1)];
              uint64_t result = *v47;
              if (*(void *)(*v47 + 8) <= v7)
              {
                if (*(void *)(*v47 + 16) + *(void *)(*v47 + 8) > v7)
                {
                  uint64_t result = [(id)result isSpecialPhysFootprintRegion];
                  if (result) {
                    unint64_t v45 = 0;
                  }
                  else {
                    unint64_t v45 = (unint64_t)v47;
                  }
LABEL_55:
                  if (v45) {
                    unint64_t v43 = v45;
                  }
                  unint64_t v22 = v43;
LABEL_58:
                  _DWORD *v19 = ((v43 - v21) >> 6) + 1;
LABEL_11:
                  unsigned int v23 = *(_DWORD *)(v22 + 20);
                  if (v23)
                  {
                    uint64_t v24 = *(void *)(v22 + 8);
                    uint64_t v25 = *v8;
                    uint64_t v26 = *(unsigned int *)(v22 + 16);
                    uint64_t v27 = (unint64_t *)(*v8 + 16 * v26);
                    if (v24)
                    {
                      if (*v27 <= v7)
                      {
                        int v28 = (void *)(v25 + 16 * (v23 + v26 - 1));
                        if (((v28[1] >> 5) & 0xFFFFFFFFFuLL) + *v28 > v7)
                        {
                          mach_vm_address_t v29 = (unsigned int *)(v24 + 4 * ((v7 - (*v27 & -*MEMORY[0x1E4F14B00])) >> *v13));
                          uint64_t v30 = *v29;
                          id v31 = (unint64_t *)(v25 + 16 * v30);
                          if (*v31 <= v7)
                          {
                            uint64_t v32 = v29[1];
                            if (v32 >= *((_DWORD *)v8 + 2)
                              || (uint64_t v33 = (unint64_t *)(v25 + 16 * v32), *v33 > v7))
                            {
                              unsigned int v34 = v32 - v30;
                              if (v34)
                              {
                                do
                                {
                                  uint64_t v35 = v34 >> 1;
                                  uint64_t v36 = &v31[2 * v35];
                                  if (*v36 <= v7)
                                  {
                                    if (((v31[2 * v35 + 1] >> 5) & 0xFFFFFFFFFLL) + *v36 > v7) {
                                      goto LABEL_47;
                                    }
                                    id v31 = v36 + 2;
                                    LODWORD(v35) = --v34 >> 1;
                                  }
                                  BOOL v37 = v34 >= 2;
                                  unsigned int v34 = v35;
                                }
                                while (v37);
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
                        uint64_t v38 = v23 >> 1;
                        int v39 = &v27[2 * v38];
                        if (*v39 <= v7)
                        {
                          if (((v27[2 * v38 + 1] >> 5) & 0xFFFFFFFFFLL) + *v39 > v7) {
                            goto LABEL_47;
                          }
                          uint64_t v27 = v39 + 2;
                          LODWORD(v38) = --v23 >> 1;
                        }
                        BOOL v37 = v23 >= 2;
                        unsigned int v23 = v38;
                      }
                      while (v37);
                    }
                  }
                  goto LABEL_47;
                }
                uint64_t v44 = v47 + 8;
                unint64_t v46 = --v45 >> 1;
              }
              BOOL v48 = v45 > 1;
              unint64_t v45 = v46;
              if (!v48)
              {
                unint64_t v45 = 0;
                goto LABEL_55;
              }
            }
          }
          unint64_t v41 = v22 + 64;
          unint64_t v42 = --v40 >> 1;
        }
        BOOL v37 = v40 >= 2;
        unint64_t v40 = v42;
      }
      while (v37);
    }
LABEL_47:
    if (*(_DWORD *)(v6 + 56) != -1)
    {
      id v49 = *(uint64_t (**)(void))(*(void *)(v6 + 40) + 16);
      return v49();
    }
  }
  return result;
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_7(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(void *)(*(void *)(result + 32) + 528) != a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_8(uint64_t a1, uint64_t a2)
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
  uint64_t v8 = malloc_type_malloc(4 * (v7 / v4) + 4, 0x100004052888210uLL);
  v8[v7 / v4] = 0;
  unint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) memoryCache];
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
              -[VMUTaskMemoryScanner scanLocalMemory:atOffset:node:length:isa:fieldInfo:stride:recorder:](*(void *)(a1 + 32), v29, v20 - *(void *)(a1 + 72), *(_DWORD *)(a1 + 88), v21, 0, 0, 8u, *(void *)(a1 + 48));
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

void __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_9(uint64_t a1, uint64_t a2)
{
}

uint64_t __55__VMUTaskMemoryScanner_scanNodesWithReferenceRecorder___block_invoke_10(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = 0;
  unint64_t v7 = (_DWORD *)MEMORY[0x1E4F14AF8];
  uint64_t v8 = &OBJC_IVAR___VMUVMRegion_range;
  do
  {
    unint64_t v9 = *(uint64_t **)(*(void *)(v5 + 32) + 112);
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
    uint64_t v8 = &OBJC_IVAR___VMUVMRegion_range;
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
    uint64_t v44 = (uint64_t *)(v43 + 64);
    unint64_t v45 = *((unsigned int *)v9 + 10) - ((uint64_t)(v43 + 64 - v9[4]) >> 6);
    if (!v45) {
      goto LABEL_64;
    }
    while (2)
    {
      unint64_t v46 = v45 >> 1;
      uint64_t v47 = &v44[8 * (v45 >> 1)];
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
      uint64_t v44 = v47 + 8;
      unint64_t v46 = --v45 >> 1;
      goto LABEL_47;
    }
    uint64_t result = [(id)result isSpecialPhysFootprintRegion];
    uint64_t v8 = &OBJC_IVAR___VMUVMRegion_range;
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
          unsigned int v34 = (unint64_t *)(v26 + 16 * v33);
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
            uint64_t v8 = v53;
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
            unsigned int v34 = &v32[2 * v37];
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
          unsigned int v34 = &v28[2 * v38];
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
  LODWORD(v5) = a4;
  id v8 = a5;
  if (!v5)
  {
    unsigned int v32 = 0;
    goto LABEL_5;
  }
  unint64_t v9 = getenv("DT_REPORT_IOKIT_REGION_LEAKS");
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
    while (1)
    {
      uint64_t v15 = *v14;
      v14 += 2;
      if ((v15 & 7) == 3) {
        break;
      }
      if (blocksCount == ++v13) {
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    LODWORD(v13) = -1;
  }
  uint64_t v16 = 0;
  char v33 = 0;
  unsigned int v32 = 0;
  if (v5 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v5;
  }
  unsigned int v26 = -1;
  uint64_t v31 = v13;
  id v29 = v8;
  uint64_t v30 = v13;
  uint64_t v17 = 0xFFFFFFFFLL;
  BOOL v28 = v10;
  do
  {
    uint64_t v18 = a3[v16];
    if (!v18 || !VMUGraphNodeType_IsVMRegion(*((_DWORD *)&self->_blocks[v18] + 2) & 7)) {
      goto LABEL_47;
    }
    int v19 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                  + ((*((void *)&self->_blocks[v18] + 1) >> 35) & 0x1FFFFFC0)));
    if (([v19 willNotHoldPointers] & 1) != 0 || !*((_DWORD *)v19 + 26) && *((unsigned char *)v19 + 50) == 5)
    {
      if (v10)
      {
        if (v33)
        {
          char v33 = 1;
        }
        else
        {
          char v33 = 1;
          fwrite("The DT_REPORT_IOKIT_REGION_LEAKS env var is set so leaked IOKit, IOSurface, or IOAccelerator regions will be reported, if -vmalso is passed to 'leaks'\n", 0x97uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
        }
      }
      else
      {
        (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v8 + 2))(v8, v31, self->_blocks[v30].var0, 1, v18, self->_blocks[v18].var0);
      }
LABEL_43:
      uint64_t v18 = v17;
      goto LABEL_46;
    }
    if (v18 == 1) {
      goto LABEL_43;
    }
    uint64_t v20 = (16 * (v18 - 1)) | 8;
    int v27 = v18 - 1;
    unsigned int v21 = v18 - 1;
    while (1)
    {
      if (!VMUGraphNodeType_IsVMRegion(*(_DWORD *)((unsigned char *)&self->_blocks->var0 + v20) & 7))
      {
        a3[v32++] = v18;
LABEL_45:
        uint64_t v18 = v17;
        id v8 = v29;
        BOOL v10 = v28;
        goto LABEL_46;
      }
      uint64_t v22 = (id *)objc_retain(*(id *)((char *)&self->_regions->var0
                                    + ((*(unint64_t *)((char *)&self->_blocks->var0 + v20) >> 35) & 0x1FFFFFC0)));
      if (([v22 isSubmap] & 1) == 0) {
        break;
      }
LABEL_39:

      v20 -= 16;
      if (!--v21) {
        goto LABEL_45;
      }
    }
    int v23 = *((_DWORD *)v19 + 26);
    if (*((_DWORD *)v22 + 26) != v23) {
      goto LABEL_33;
    }
    int v23 = *((_DWORD *)v22 + 26);
    if (*((unsigned __int8 *)v22 + 49) != *((unsigned __int8 *)v19 + 49)) {
      goto LABEL_33;
    }
    if ((char *)v22[1] + (void)v22[2] != v19[1] && ([v19 isJavascriptJitExecutableAllocator] & 1) == 0)
    {
      int v23 = *((_DWORD *)v19 + 26);
LABEL_33:
      if (v23
        || *((_DWORD *)v22 + 26)
        || (char *)v22[1] + (void)v22[2] != v19[1]
        || ![v19[4] isEqualToString:VMUmappedFileLabel[0]]
        || ![v22[4] isEqualToString:@"__LINKEDIT"]
        || ![v19[5] isEqualToString:v22[5]])
      {
        goto LABEL_39;
      }
      if (v17 == v27) {
        uint64_t v25 = v26;
      }
      else {
        uint64_t v25 = v21;
      }
      id v8 = v29;
      (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v29 + 2))(v29, v25, self->_blocks[v25].var0, 1, v18, self->_blocks[v18].var0);
      unsigned int v26 = v25;
LABEL_56:
      BOOL v10 = v28;
      goto LABEL_57;
    }
    if (v17 == v27) {
      uint64_t v24 = v26;
    }
    else {
      uint64_t v24 = v21;
    }
    id v8 = v29;
    (*((void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, unint64_t))v29 + 2))(v29, v24, self->_blocks[v24].var0, 1, v18, self->_blocks[v18].var0);
    unsigned int v26 = v24;
    if (!v32)
    {
      unsigned int v32 = 0;
      goto LABEL_56;
    }
    BOOL v10 = v28;
    if (a3[v32 - 1] >= v24) {
      a3[v32++] = v18;
    }
LABEL_57:

LABEL_46:
    uint64_t v17 = v18;
LABEL_47:
    ++v16;
  }
  while (v16 != v5);
LABEL_5:

  return v32;
}

- (id)processSnapshotGraphWithOptions:(unint64_t)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  unint64_t v80 = [VMUProcessObjectGraph alloc];
  uint64_t pid = self->_pid;
  blocks = self->_blocks;
  uint64_t blocksCount = self->_blocksCount;
  zoneNames = self->_zoneNames;
  classInfoIndexer = self->_classInfoIndexer;
  unint64_t v9 = [(VMUVMRegionIdentifier *)self->_regionIdentifier regions];
  BOOL v10 = [(VMUProcessObjectGraph *)v80 initWithPid:pid nodes:blocks nodeCount:blocksCount zoneNames:zoneNames classInfoMap:classInfoIndexer regions:v9 pthreadOffsets:gPthreadOffsets userMarked:self->_userMarkedAbandoned autoreleasePoolOffsets:[(VMUObjectIdentifier *)self->_objectIdentifier autoreleasePoolPageLayout]];
  processObjectGraph = self->_processObjectGraph;
  self->_processObjectGraph = v10;

  [(VMUProcessObjectGraph *)self->_processObjectGraph setSnapshotMachTime:self->_suspendTime];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setSnapshotDate:self->_suspendDate];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setScanner:self];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setDebugTimer:self->_debugTimer];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setShowRawClassNames:self->_showRawClassNames];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setProcessDescriptionString:self->_processDescriptionString];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setIsTranslatedByRosetta:[(VMUTaskMemoryScanner *)self isTranslatedByRosetta]];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setProcessName:self->_processName];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setBinaryImagesDescription:self->_binaryImagesDescription];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setPhysicalFootprint:self->_physicalFootprint];
  BOOL v12 = [(VMUTaskMemoryScanner *)self ledger];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setLedger:v12];

  [(VMUProcessObjectGraph *)self->_processObjectGraph setPhysicalFootprintPeak:self->_physicalFootprintPeak];
  uint64_t v13 = [(VMUTask *)self->_task taskDyldSharedCacheRange];
  -[VMUProcessObjectGraph setDyldSharedCacheRange:](self->_processObjectGraph, "setDyldSharedCacheRange:", v13, v14);
  [(VMUProcessObjectGraph *)self->_processObjectGraph setObjectContentLevel:[(VMUTaskMemoryScanner *)self objectContentLevel]];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setObjectContentLevelForNodeLabels:[(VMUTaskMemoryScanner *)self objectContentLevel]];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setSrcAddressToExtraAutoreleaseCountDict:self->_srcAddressToExtraAutoreleaseCountDict];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setShowsPhysFootprint:[(VMUVMRegionIdentifier *)self->_regionIdentifier recordedPhysFootprint]];
  [(VMUProcessObjectGraph *)self->_processObjectGraph setDidPhysFootprintDirtyAccounting:[(VMUVMRegionIdentifier *)self->_regionIdentifier didPhysFootprintDirtyAccounting]];
  uint64_t v15 = [(VMUObjectIdentifier *)self->_objectIdentifier symbolicator];
  uint64_t v17 = v16;
  uint64_t v78 = v15;
  if (self->_targetProcessHasObjCPatches)
  {
    uint64_t v79 = CSSymbolicatorCreateForTaskSharedCache();
    uint64_t v81 = v18;
  }
  else
  {
    uint64_t v79 = 0;
    uint64_t v81 = 0;
  }
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x3010000000;
  v127[5] = 0;
  v127[3] = &unk_1A7D91765;
  v127[4] = 0;
  v126[0] = 0;
  v126[1] = v126;
  v126[2] = 0x3010000000;
  v126[5] = 0;
  v126[3] = &unk_1A7D91765;
  v126[4] = 0;
  v124[0] = 0;
  v124[1] = v124;
  v124[2] = 0x2020000000;
  char v125 = 0;
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v20 = [(VMUDebugTimer *)debugTimer signpostID];
    debugTimer = self->_debugTimer;
    if (v20)
    {
      unsigned int v21 = [(VMUDebugTimer *)debugTimer logHandle];
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
  int v23 = self->_debugTimer;
  if (v23)
  {
    uint64_t v24 = [(VMUDebugTimer *)v23 logHandle];
    os_signpost_id_t v25 = [(VMUDebugTimer *)self->_debugTimer signpostID];
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "processSnapshotGraph", "sampling all threads", buf, 2u);
    }
  }
  if ([(VMUTask *)self->_task isCore])
  {
    unsigned int v26 = 0;
    int v27 = 0;
  }
  else
  {
    unsigned int v26 = [[VMUSampler alloc] initWithTask:[(VMUTask *)self->_task taskPort] options:257];
    int v27 = [(VMUSampler *)v26 sampleAllThreadsOnceWithFramePointers:1];
  }
  BOOL v28 = getenv("PreserveMemgraphSampleAndSymbolStore");
  if (v28
    && ([NSString stringWithUTF8String:v28],
        id v29 = objc_claimAutoreleasedReturnValue(),
        [v29 uppercaseString],
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        char v31 = [v30 isEqualToString:@"NO"],
        v30,
        v29,
        (v31 & 1) != 0))
  {
    unsigned int v32 = 0;
  }
  else
  {
    [(VMUProcessObjectGraph *)self->_processObjectGraph setBacktraces:v27];
    unsigned int v32 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]([VMUSymbolStore alloc], "initWithSymbolicator:debugTimer:", v78, v17, self->_debugTimer);
    [(VMUProcessObjectGraph *)self->_processObjectGraph setSymbolStore:v32];
    char v33 = self->_processObjectGraph;
    unsigned int v34 = [(VMUProcessObjectGraph *)v33 symbolStore];
    [v34 setGraph:v33];
  }
  if (v27)
  {
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    id v35 = v27;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v120 objects:v128 count:16];
    if (v36)
    {
      uint64_t v37 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v121 != v37) {
            objc_enumerationMutation(v35);
          }
          [(VMUSymbolStore *)v32 addBacktrace:*(void *)(*((void *)&v120 + 1) + 8 * i) origin:0];
        }
        uint64_t v36 = [v35 countByEnumeratingWithState:&v120 objects:v128 count:16];
      }
      while (v36);
    }
  }
  *(void *)buf = 0;
  mach_vm_address_t v115 = buf;
  uint64_t v116 = 0x3010000000;
  uint64_t v119 = 0;
  int v117 = &unk_1A7D91765;
  uint64_t v118 = 0;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x3010000000;
  v113[5] = 0;
  v113[3] = &unk_1A7D91765;
  v113[4] = 0;
  v111[0] = 0;
  v111[1] = v111;
  v111[2] = 0x3032000000;
  v111[3] = __Block_byref_object_copy_;
  v111[4] = __Block_byref_object_dispose_;
  id v112 = 0;
  v109[0] = 0;
  v109[1] = v109;
  v109[2] = 0x2020000000;
  int v110 = 0;
  if ((a3 & 2) != 0 && ([(VMUTaskMemoryScanner *)self objectContentLevel] & 0xFFFFFFFE) == 2)
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
          *(_WORD *)uint64_t v104 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v41, OS_SIGNPOST_INTERVAL_END, v42, "processSnapshotGraph", "", v104, 2u);
        }

        unint64_t v39 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v39 endEvent:"processSnapshotGraph"];
    [(VMUDebugTimer *)self->_debugTimer startWithCategory:"processSnapshotGraph" message:"getting node labels"];
    unint64_t v43 = self->_debugTimer;
    if (v43)
    {
      uint64_t v44 = [(VMUDebugTimer *)v43 logHandle];
      os_signpost_id_t v45 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)uint64_t v104 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v45, "processSnapshotGraph", "getting node labels", v104, 2u);
      }
    }
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke;
    v108[3] = &unk_1E5D23370;
    v108[4] = self;
    [(VMUTaskMemoryScanner *)self enumerateObjectsWithBlock:v108];
    [(VMUProcessObjectGraph *)self->_processObjectGraph parseAddressesFromNodeLabelsIntoSymbolStore];
  }
  size_t regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    uint64_t v47 = self->_debugTimer;
    if (v47)
    {
      uint64_t v48 = [(VMUDebugTimer *)v47 signpostID];
      uint64_t v47 = self->_debugTimer;
      if (v48)
      {
        unint64_t v49 = [(VMUDebugTimer *)v47 logHandle];
        os_signpost_id_t v50 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
        {
          *(_WORD *)uint64_t v104 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v49, OS_SIGNPOST_INTERVAL_END, v50, "processSnapshotGraph", "", v104, 2u);
        }

        uint64_t v47 = self->_debugTimer;
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
        *(_WORD *)uint64_t v104 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v53, "processSnapshotGraph", "scan nodes into the graph, while recording symbols of __DATA regions and stacks", v104, 2u);
      }
    }
    uint64_t v54 = (char *)malloc_type_calloc(regionsCount, 4uLL, 0x100004052888210uLL);
    *(void *)uint64_t v104 = 0;
    BOOL v105 = v104;
    uint64_t v106 = 0x2020000000;
    char v107 = 0;
    id v55 = self->_processObjectGraph;
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_273;
    v103[3] = &unk_1E5D233C0;
    v103[4] = self;
    v103[5] = v104;
    [(VMUObjectGraph *)v55 enumerateObjectsWithBlock:v103];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_3;
    v85[3] = &unk_1E5D233E8;
    unint64_t v97 = v54;
    unint64_t v98 = a3;
    uint64_t v99 = v79;
    uint64_t v100 = v81;
    uint64_t v101 = v78;
    uint64_t v102 = v17;
    v85[4] = self;
    unint64_t v89 = v127;
    uint64_t v90 = v124;
    unint64_t v91 = v126;
    id v86 = v32;
    unint64_t v92 = buf;
    unsigned int v93 = v113;
    uint64_t v94 = v111;
    uint64_t v95 = v109;
    id v87 = v27;
    uint64_t v88 = v26;
    unint64_t v96 = v104;
    [(VMUTaskMemoryScanner *)self scanNodesWithReferenceRecorder:v85];
    id v56 = self->_debugTimer;
    if (v56)
    {
      uint64_t v57 = [(VMUDebugTimer *)v56 signpostID];
      id v56 = self->_debugTimer;
      if (v57)
      {
        int v58 = [(VMUDebugTimer *)v56 logHandle];
        os_signpost_id_t v59 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
        {
          *(_WORD *)uint64_t v84 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v58, OS_SIGNPOST_INTERVAL_END, v59, "processSnapshotGraph", "", v84, 2u);
        }

        id v56 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v56 endEvent:"processSnapshotGraph"];
    [(VMUDebugTimer *)self->_debugTimer startWithCategory:"processSnapshotGraph" message:"find unreferenced VM regions"];
    uint64_t v60 = self->_debugTimer;
    if (v60)
    {
      unint64_t v61 = [(VMUDebugTimer *)v60 logHandle];
      os_signpost_id_t v62 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v62 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        *(_WORD *)uint64_t v84 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v61, OS_SIGNPOST_INTERVAL_BEGIN, v62, "processSnapshotGraph", "find unreferenced VM regions", v84, 2u);
      }
    }
    int v63 = malloc_type_malloc(4 * regionsCount, 0x100004052888210uLL);
    uint64_t v64 = v63;
    unint64_t v65 = self->_blocksCount;
    if (v65)
    {
      unint64_t v66 = 0;
      uint64_t v67 = 0;
      unint64_t v68 = (unint64_t *)self->_blocks + 1;
      do
      {
        unint64_t v70 = *v68;
        v68 += 2;
        unint64_t v69 = v70;
        if ((v70 & 7) == 5 && !*(_DWORD *)&v54[(v69 >> 39) & 0x1FFFFFC])
        {
          *((_DWORD *)v63 + v67) = v66;
          uint64_t v67 = (v67 + 1);
          unint64_t v65 = self->_blocksCount;
        }
        ++v66;
      }
      while (v66 < v65);
      if (v67)
      {
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_300;
        v83[3] = &unk_1E5D23410;
        v83[4] = self;
        [(VMUTaskMemoryScanner *)self _removeFalsePositiveLeakedVMregionsFromNodes:v63 nodeCount:v67 recorder:v83];
      }
    }
    free(v64);
    free(v54);

    _Block_object_dispose(v104, 8);
  }
  CSRelease();
  [(VMUTaskMemoryScanner *)self unmapAllRegions];
  unint64_t v71 = self->_debugTimer;
  if (v71)
  {
    uint64_t v72 = [(VMUDebugTimer *)v71 signpostID];
    unint64_t v71 = self->_debugTimer;
    if (v72)
    {
      int v73 = [(VMUDebugTimer *)v71 logHandle];
      os_signpost_id_t v74 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v74 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)uint64_t v104 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v73, OS_SIGNPOST_INTERVAL_END, v74, "processSnapshotGraph", "", v104, 2u);
      }

      unint64_t v71 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v71 endEvent:"processSnapshotGraph"];
  if ((a3 & 1) != 0 && ![(VMUTask *)self->_task isCore])
  {
    uint64_t v75 = -[VMUGraphStackLogReader initWithTask:symbolicator:graph:debugTimer:collectDisklogs:]([VMUGraphStackLogReader alloc], "initWithTask:symbolicator:graph:debugTimer:collectDisklogs:", self->_task, v78, v17, self->_processObjectGraph, self->_debugTimer, (a3 >> 3) & 1);
    if (v75) {
      [(VMUProcessObjectGraph *)self->_processObjectGraph setStackLogReader:v75];
    }
  }
  [(VMUProcessObjectGraph *)self->_processObjectGraph setIdleExitStatus:self->_idleExitStatus];
  int v76 = self->_processObjectGraph;
  _Block_object_dispose(v109, 8);
  _Block_object_dispose(v111, 8);

  _Block_object_dispose(v113, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v124, 8);
  _Block_object_dispose(v126, 8);
  _Block_object_dispose(v127, 8);

  return v76;
}

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_273(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a3[1] >> 60 == 2)
  {
    id v8 = [*(id *)(*(void *)(a1 + 32) + 496) vmuVMRegionForNode:a2];
    unint64_t v9 = [v8 type];
    if ([v9 hasPrefix:@"__DATA"])
    {
      BOOL v10 = [v8 path];
      unint64_t v11 = [v10 lastPathComponent];
      int v12 = [v11 hasPrefix:@"dyld"];

      if (v12)
      {
        uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 496) rangeForSymbolName:@"_main_thread" inRegion:v8];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v14 = v13;
          int v15 = [*(id *)(*(void *)(a1 + 32) + 496) is64bit];
          uint64_t v16 = 348;
          if (v15) {
            uint64_t v16 = 568;
          }
          uint64_t v17 = v14 - *a3 + v16;
          uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 496);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_2;
          v19[3] = &unk_1E5D23398;
          v19[4] = *(void *)(a1 + 40);
          v19[5] = v17;
          v19[6] = a4;
          [v18 enumerateReferencesOfNode:a2 withBlock:v19];
        }
      }
    }
    else
    {
    }
  }
}

uint64_t __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (*(void *)(a5 + 8) == *(void *)(result + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a6 = 1;
    **(unsigned char **)(result + 48) = 1;
  }
  return result;
}

void __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_3(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v8 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 496) addEdgeFromNode:a2 sourceOffset:a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a2) withScanType:a4 toNode:a5 destinationOffset:a6 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a5)] != -1)
  {
    if (v8 != a5
      && (*(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a5 + 8) & 7) == 5)
    {
      unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a5 + 8);
      ++*(_DWORD *)(*(void *)(a1 + 128) + ((v10 >> 39) & 0x1FFFFFC));
    }
    if ((*(unsigned char *)(a1 + 136) & 4) != 0)
    {
      uint64_t v11 = v8;
      if (VMUGraphNodeType_IsVMRegion(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * v8 + 8) & 7))
      {
        int v12 = (void *)MEMORY[0x1AD0D9F90]();
        uint64_t v13 = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32) + 96)
                                + ((*(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * v11 + 8) >> 35) & 0x1FFFFFC0)));
        uint64_t v14 = v13;
        if ((v13[132] & 2) != 0)
        {
          if ((v13[132] & 4) == 0) {
            goto LABEL_17;
          }
        }
        else if ((v13[132] & 4) == 0)
        {
          if (![v13 isStack]
            || a3 - *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) < *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                            + 40))
          {
            goto LABEL_32;
          }
          if (a3 - *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) >= *(void *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                                             + 40))
          {
            uint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 136) indexForLocation:a3];
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
              uint64_t v34 = [*(id *)(*(void *)(a1 + 32) + 136) rangeAtIndex:v15];
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
                uint64_t v44 = [*(id *)(a1 + 56) threadDescriptionStringForBacktrace:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) returnedAddress:0];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v44 forRange:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v44 forRange:v33];
                if (v33 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
                {
                  uint64_t v45 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)
                      + *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32);
                  unint64_t v46 = [(id)gPthreadOffsets objectForKeyedSubscript:@"RegionEndOffsetKey"];
                  uint64_t v47 = [v46 unsignedLongLongValue];

                  [*(id *)(*(void *)(a1 + 32) + 496) setRegionSymbolName:@"<PTHREAD_T>" forRange:v45 - v47];
                }
              }
              else
              {
                if ([*(id *)(*(void *)(a1 + 32) + 8) isCore])
                {
                  uint64_t v48 = &stru_1EFE27F38;
                }
                else
                {
                  uint64_t v48 = [*(id *)(a1 + 56) threadDescriptionStringForBacktrace:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) returnedAddress:0];
                }
                unint64_t v49 = [(__CFString *)v48 stringByAppendingString:@"  no associated pthread"];

                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v49 forRange:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 32) *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)];
                [*(id *)(*(void *)(a1 + 32) + 496) setThreadName:v49 forRange:v33];
              }
            }
          }
          os_signpost_id_t v50 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
          if (!v50) {
            goto LABEL_32;
          }
          unsigned int v51 = [v50 backtraceLength];
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) >= v51) {
            goto LABEL_32;
          }
          unsigned int v52 = v51;
          while (1)
          {
            unint64_t v53 = *(void *)([*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) stackFramePointers]+ 8 * *(unsigned int *)(*(void *)(*(void *)(a1 + 112) + 8) + 24));
            uint64_t v54 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) backtrace];
            uint64_t v55 = *(void *)(*(void *)(a1 + 112) + 8);
            uint64_t v56 = *(unsigned int *)(v55 + 24);
            if (v53 > a3) {
              break;
            }
            *(_DWORD *)(v55 + 24) = v56 + 1;
            if (*(_DWORD *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) >= v52) {
              goto LABEL_32;
            }
          }
          uint64_t v57 = *(void *)(v54 + 8 * v56);
          uint64_t v58 = *(void *)(*(void *)(a1 + 88) + 8);
          *(void *)(v58 + 32) = a3;
          *(void *)(v58 + 40) = v53 - a3;
          CSSymbolicatorGetSymbolWithAddressAtTime();
          CSSymbolGetSymbolOwner();
          uint64_t Name = CSSymbolOwnerGetName();
          if (CSSymbolIsUnnamed()) {
            [NSString stringWithFormat:@"%#llx (in %s)", v57, Name];
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
            unsigned int v21 = [NSString stringWithUTF8String:v19];
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

uint64_t __56__VMUTaskMemoryScanner_processSnapshotGraphWithOptions___block_invoke_300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) addEdgeFromNode:a2 sourceOffset:a3 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a2) withScanType:a4 toNode:a5 destinationOffset:a6 - *(void *)(*(void *)(*(void *)(a1 + 32) + 80) + 16 * a5)];
}

- (id)processSnapshotGraph
{
  return [(VMUTaskMemoryScanner *)self processSnapshotGraphWithOptions:5];
}

- (VMUClassInfoMap)realizedClasses
{
  return [(VMUObjectIdentifier *)self->_objectIdentifier realizedClasses];
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  uint64_t v2 = [(VMUTaskMemoryScanner *)self realizedClasses];
  char v3 = [v2 hasClassInfosDerivedFromStackBacktraces];

  return v3;
}

- ($61A80719B04F7407D3E47539F1B23CAA)nodeDetails:(VMUTaskMemoryScanner *)self
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
  unsigned int v21 = regionMap->var4;
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
    unsigned int v21 = (_VMURegionNode *)(p_var0 + 8);
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
  if ([(VMUTaskMemoryScanner *)self nodeNamespaceSize] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    [(VMUTaskMemoryScanner *)self nodeDetails:v3];
    uint64_t v5 = [(VMUTaskMemoryScanner *)self vmuVMRegionForAddress:v7];
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
  unsigned int v21 = v19 + 64;
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
  *unsigned int v21 = ((unint64_t)((char *)v5 - (char *)var4) >> 6) + 1;
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
    uint64_t v8 = [(VMUObjectIdentifier *)self->_objectIdentifier labelForMemory:[(VMUTaskMemoryScanner *)self contentForNode:v3] length:(*((void *)v5 + 1) >> 5) & 0xFFFFFFFFFLL remoteAddress:v5->var0 classInfo:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)shortLabelForNode:(unsigned int)a3
{
  uint64_t v3 = [(VMUTaskMemoryScanner *)self labelForNode:*(void *)&a3];
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
  int v12 = (_DWORD *)MEMORY[0x1E4F14AF8];
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
    unsigned int v21 = &var4[(unint64_t)(v17 - 1)];
    if (var0 - *((void *)v21->var0 + 1) < *((void *)v21->var0 + 2)) {
      goto LABEL_12;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    return 0;
  }
  uint64_t v45 = regionMap->var4;
  while (1)
  {
    unint64_t v46 = var5 >> 1;
    unsigned int v21 = &v45[var5 >> 1];
    if (*((void *)v21->var0 + 1) <= var0) {
      break;
    }
LABEL_29:
    BOOL v8 = var5 >= 2;
    unint64_t var5 = v46;
    if (!v8) {
      return 0;
    }
  }
  if (*((void *)v21->var0 + 2) + *((void *)v21->var0 + 1) <= var0)
  {
    uint64_t v45 = v21 + 1;
    unint64_t v46 = --var5 >> 1;
    goto LABEL_29;
  }
  int v63 = [v21->var0 isSpecialPhysFootprintRegion];
  uint64_t result = 0;
  if (v63) {
    unint64_t v64 = 0;
  }
  else {
    unint64_t v64 = (unint64_t)v21;
  }
  if ((v63 & 1) == 0)
  {
    if ((*(unsigned char *)(*(void *)v64 + 132) & 1) == 0) {
      goto LABEL_75;
    }
    unint64_t v65 = (id *)(v64 + 64);
    unint64_t v66 = regionMap->var5 - ((uint64_t)(v64 + 64 - (unint64_t)regionMap->var4) >> 6);
    if (!v66) {
      goto LABEL_72;
    }
    while (1)
    {
      unint64_t v67 = v66 >> 1;
      unint64_t v68 = &v65[8 * (v66 >> 1)];
      if (*((void *)*v68 + 1) <= var0)
      {
        if (*((void *)*v68 + 2) + *((void *)*v68 + 1) > var0)
        {
          if ([*v68 isSpecialPhysFootprintRegion]) {
            unint64_t v66 = 0;
          }
          else {
            unint64_t v66 = (unint64_t)v68;
          }
LABEL_72:
          if (v66) {
            unint64_t v64 = v66;
          }
          unsigned int v21 = (_VMURegionNode *)v64;
LABEL_75:
          *unint64_t v18 = ((v64 - (unint64_t)var4) >> 6) + 1;
LABEL_12:
          uint64_t v22 = a3;
          BOOL v23 = &self->_blocks[a3];
          unint64_t v24 = ((*((void *)v23 + 1) >> 5) & 0xFFFFFFFFFLL) + v23->var0;
          if (*((void *)v21->var0 + 2) + *((void *)v21->var0 + 1) >= v24)
          {
            memoryCache = self->_memoryCache;
            regions = self->_regions;
            unsigned int regionsCount = self->_regionsCount;
            unint64_t v29 = self->_task;
            uint64_t v83 = memoryCache;
            if (!v21->var7 && ([v21->var0 isSpecialPhysFootprintRegion] & 1) == 0)
            {
              v85[0] = 0;
              v90[0] = 0;
              int v50 = [(VMUTaskMemoryCache *)v83 mapAddress:*((void *)v21->var0 + 1) size:*((void *)v21->var0 + 2) returnedAddress:v85 returnedSize:v90];
              if (v50)
              {
                if ((*((_DWORD *)v21->var0 + 13) & 3u) - 1 >= 2)
                {
                  int v51 = v50;
                  BOOL v52 = task_exists(v29);
                  if (v21 != &regions[(unint64_t)(regionsCount - 1)] && v52)
                  {
                    uint64_t v82 = (FILE *)*MEMORY[0x1E4F143C8];
                    uint64_t v80 = v22;
                    uint64_t v53 = [v21->var0 address];
                    uint64_t v54 = *((unsigned int *)v21->var0 + 6);
                    uint64_t v55 = vm_prot_strings[v54];
                    uint64_t v56 = *((void *)v21->var0 + 2) + *((void *)v21->var0 + 1);
                    VMUExclaveOrDarwinRegionTypeDescriptionForTagShareProtAndPager(*((unsigned __int8 *)v21->var0 + 232), *((unsigned __int8 *)v21->var0 + 104), *((unsigned __int8 *)v21->var0 + 50), v54, *((unsigned __int8 *)v21->var0 + 49));
                    uint64_t v57 = v29;
                    id v58 = objc_claimAutoreleasedReturnValue();
                    os_signpost_id_t v59 = (const char *)[v58 UTF8String];
                    uint64_t v60 = *((void *)v21->var0 + 2) >> *v12;
                    unint64_t v61 = "pages";
                    if (v60 == 1) {
                      unint64_t v61 = "page";
                    }
                    if (v21->var4 == v21->var5) {
                      os_signpost_id_t v62 = "";
                    }
                    else {
                      os_signpost_id_t v62 = " [root]";
                    }
                    uint64_t v78 = v53;
                    uint64_t v22 = v80;
                    fprintf(v82, "Failed to map remote region: [%#llx-%#llx] %s %s (%llu %s)%s (error: %d)\n", v78, v56, v55, v59, v60, v61, v62, v51);

                    unint64_t v29 = v57;
                  }
                }
              }
              else
              {
                int v76 = (void *)v85[0];
                v21->unint64_t var6 = v90[0];
                v21->unint64_t var7 = v76;
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
            unint64_t v28 = self->_memoryCache;
            objectIdentifier = self->_objectIdentifier;
            unint64_t v29 = self->_task;
            uint64_t v83 = objectIdentifier;
            unint64_t v30 = v28;
            unint64_t v31 = v30;
            uint64_t v32 = 0;
            if (v25)
            {
              uint64_t v33 = v25;
              uint64_t v34 = v21;
              do
              {
                uint64_t v35 = v34->var0;
                ++v34;
                v32 += v35[2];
                --v33;
              }
              while (v33);
            }
            v90[0] = 0;
            unint64_t v84 = 0;
            uint64_t v36 = [(VMUTaskMemoryCache *)v30 findMappedAddress:*((void *)v21->var0 + 1) size:v32];
            if (v36)
            {
              unint64_t var1 = v36->var1;
              unint64_t v38 = *((void *)v21->var0 + 1) - v36->var0;
              v90[0] = v36->var2 + v38;
              unint64_t v84 = var1 - v38;
              goto LABEL_20;
            }
            uint64_t v79 = v29;
            uint64_t v81 = v22;
            if (v25)
            {
              unint64_t v70 = 0;
              do
              {
                unint64_t v71 = v83;
                uint64_t v72 = v31;
                int v73 = v72;
                if (v21[v70 / 0x40].var7)
                {
                  if (&v21[v70 / 0x40] == v21[v70 / 0x40].var8)
                  {
                    v85[0] = MEMORY[0x1E4F143A8];
                    v85[1] = 3221225472;
                    v85[2] = ___unmapRegion_block_invoke;
                    v85[3] = &unk_1E5D23460;
                    id v86 = v72;
                    uint64_t v88 = &v21[v70 / 0x40];
                    id v87 = v71;
                    unint64_t v89 = v21;
                    uint64_t v75 = (void (**)(void))MEMORY[0x1AD0DA230](v85);
                    v75[2]();
                  }
                  else
                  {
                    os_signpost_id_t v74 = &v21[v70 / 0x40];
                    v74->unint64_t var6 = 0;
                    v74->unint64_t var7 = 0;
                    v74->var8 = 0;
                  }
                }

                v70 += 64;
              }
              while ((unint64_t)v25 << 6 != v70);
            }
            unint64_t v29 = v79;
            uint64_t v22 = v81;
            if ([(VMUTaskMemoryCache *)v31 mapAddress:*((void *)v21->var0 + 1) size:v32 returnedAddress:v90 returnedSize:&v84])
            {
              if (task_exists(v79)) {
                fprintf((FILE *)*MEMORY[0x1E4F143C8], "Failed to map remote region at [%#llx-%#llx]\n", *((void *)v21->var0 + 1), *((void *)v21->var0 + 1) + v32);
              }
            }
            else
            {
LABEL_20:
              if (v25)
              {
                unint64_t v39 = 0;
                unint64_t v40 = v84;
                do
                {
                  uint64_t v41 = &v21[v39 / 0x40];
                  v41->var8 = v21;
                  v41->unint64_t var6 = v40;
                  uint64_t v42 = v90[0];
                  v41->unint64_t var7 = (void *)v90[0];
                  uint64_t v43 = (uint64_t)v21[v39 / 0x40].var0 + 8;
                  v90[0] = *((void *)v21[v39 / 0x40].var0 + 2) + v42;
                  unint64_t v40 = v84 - *(void *)(v43 + 8);
                  unint64_t v84 = v40;
                  v39 += 64;
                }
                while ((unint64_t)v25 << 6 != v39);
              }
            }
          }
          uint64_t v77 = (char *)v21->var7;
          if (v77) {
            return &v77[self->_blocks[v22].var0 - *((void *)v21->var0 + 1)];
          }
          return 0;
        }
        unint64_t v65 = v68 + 8;
        unint64_t v67 = --v66 >> 1;
      }
      BOOL v69 = v66 > 1;
      unint64_t v66 = v67;
      if (!v69)
      {
        unint64_t v66 = 0;
        goto LABEL_72;
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
  uint64_t v43 = (id *)(v42 + 64);
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
    uint64_t v43 = v46 + 8;
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
        if (v30 < regionMap->var1 && (unint64_t v31 = &var0[v30].var0, v32 = *v31, *v31 <= a3))
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
              unint64_t v31 = &p_var0[2 * v34];
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
    unint64_t v31 = &v25[v36].var0;
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

- (_VMURegionNode)validateAddressRangeForSwiftRemoteMirror:(_VMURange)a3 allowUnusedSplitLibs:(BOOL)a4
{
  id v4 = 0;
  regionMap = self->_regionMap;
  unint64_t var6 = regionMap->var6;
  unint64_t var7 = regionMap->var7;
  BOOL v8 = var7 >= var6;
  unint64_t v9 = var7 - var6;
  if (!v8) {
    return v4;
  }
  unint64_t location = a3.location;
  if (a3.location - var6 >= v9) {
    return v4;
  }
  BOOL v11 = a4;
  unint64_t length = a3.length;
  unint64_t v14 = (_DWORD *)MEMORY[0x1E4F14AF8];
  unint64_t v15 = a3.location >> *MEMORY[0x1E4F14AF8];
  if (v15)
  {
    var3 = regionMap->var3;
    unint64_t v17 = a3.location >> *MEMORY[0x1E4F14AF8];
    while (*var3 > (v17 & 0x3FFFFFF)
         && ((*((unsigned __int8 *)var3 + ((v17 & 0x3FFFFFF) >> 3) + 4) >> (v17 & 7)) & 1) != 0)
    {
      v17 >>= 26;
      if (!v17) {
        goto LABEL_9;
      }
    }
    return 0;
  }
LABEL_9:
  int v18 = (char *)regionMap + 4 * (v15 & 0x7FFFF);
  int v21 = *((_DWORD *)v18 + 16);
  int v20 = v18 + 64;
  int v19 = v21;
  unint64_t var4 = regionMap->var4;
  if (v21)
  {
    BOOL v23 = &var4[(unint64_t)(v19 - 1)];
    if (a3.location - *((void *)v23->var0 + 1) < *((void *)v23->var0 + 2)) {
      goto LABEL_11;
    }
  }
  unint64_t var5 = regionMap->var5;
  if (!var5) {
    return 0;
  }
  int v27 = regionMap->var4;
  while (1)
  {
    unint64_t v28 = var5 >> 1;
    BOOL v23 = &v27[var5 >> 1];
    if (*((void *)v23->var0 + 1) <= a3.location) {
      break;
    }
LABEL_20:
    BOOL v8 = var5 >= 2;
    unint64_t var5 = v28;
    if (!v8) {
      return 0;
    }
  }
  if (*((void *)v23->var0 + 2) + *((void *)v23->var0 + 1) <= a3.location)
  {
    int v27 = v23 + 1;
    unint64_t v28 = --var5 >> 1;
    goto LABEL_20;
  }
  int v29 = [v23->var0 isSpecialPhysFootprintRegion];
  id v4 = 0;
  if (v29) {
    unint64_t v30 = 0;
  }
  else {
    unint64_t v30 = (unint64_t)v23;
  }
  if (v29) {
    return v4;
  }
  unint64_t v14 = (_DWORD *)MEMORY[0x1E4F14AF8];
  if ((*(unsigned char *)(*(void *)v30 + 132) & 1) == 0) {
    goto LABEL_66;
  }
  unint64_t v31 = (id *)(v30 + 64);
  unint64_t v32 = regionMap->var5 - ((uint64_t)(v30 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v32) {
    goto LABEL_63;
  }
  while (2)
  {
    unint64_t v33 = v32 >> 1;
    uint64_t v34 = &v31[8 * (v32 >> 1)];
    if (*((void *)*v34 + 1) > location)
    {
LABEL_34:
      BOOL v35 = v32 > 1;
      unint64_t v32 = v33;
      if (!v35)
      {
        unint64_t v32 = 0;
        goto LABEL_62;
      }
      continue;
    }
    break;
  }
  if (*((void *)*v34 + 2) + *((void *)*v34 + 1) <= location)
  {
    unint64_t v31 = v34 + 8;
    unint64_t v33 = --v32 >> 1;
    goto LABEL_34;
  }
  unint64_t v53 = v30;
  int v54 = [*v34 isSpecialPhysFootprintRegion];
  unint64_t v30 = v53;
  if (v54) {
    unint64_t v32 = 0;
  }
  else {
    unint64_t v32 = (unint64_t)v34;
  }
LABEL_62:
  unint64_t v14 = (_DWORD *)MEMORY[0x1E4F14AF8];
LABEL_63:
  if (v32) {
    unint64_t v30 = v32;
  }
  BOOL v23 = (_VMURegionNode *)v30;
LABEL_66:
  *int v20 = ((v30 - (unint64_t)var4) >> 6) + 1;
LABEL_11:
  id v24 = v23->var0;
  uint64_t v25 = v24;
  if ((*((unsigned char *)v24 + 132) & 2) != 0)
  {
    if ([*((id *)v24 + 4) isEqualToString:@"__LINKEDIT"]) {
      id v4 = 0;
    }
    else {
      id v4 = v23;
    }
    goto LABEL_71;
  }
  if (v11 && ([*((id *)v24 + 4) isEqualToString:VMUunusedSharedLibTextLabel[0]] & 1) != 0)
  {
LABEL_14:
    id v4 = v23;
    goto LABEL_71;
  }
  if (!self->_initializedRegionMallocBlockCounts)
  {
    if ([v25 isMallocHeapRelated]) {
      id v4 = v23;
    }
    else {
      id v4 = 0;
    }
    goto LABEL_71;
  }
  if (!v25[17]) {
    goto LABEL_70;
  }
  unsigned int v36 = v23->var3;
  if (!v36) {
    goto LABEL_70;
  }
  uint64_t v37 = self->_regionMap;
  unint64_t var1 = v23->var1;
  unint64_t var0 = v37->var0;
  uint64_t var2 = v23->var2;
  int v41 = &v37->var0[var2];
  if (var1)
  {
    unint64_t v42 = v41->var0;
    if (v42 <= location)
    {
      uint64_t v43 = &var0[v36 - 1 + var2];
      if (((*((void *)v43 + 1) >> 5) & 0xFFFFFFFFFLL) + v43->var0 > location)
      {
        unint64_t v44 = v14;
        id v4 = 0;
        unint64_t v45 = &var1[(location - (v42 & -*MEMORY[0x1E4F14B00])) >> *v44];
        uint64_t v46 = *v45;
        p_unint64_t var0 = &var0[v46].var0;
        if (*p_var0 > location) {
          goto LABEL_71;
        }
        uint64_t v48 = v45[1];
        if (v48 < v37->var1 && (unint64_t v49 = &var0[v48].var0, *v49 <= location))
        {
LABEL_67:
          unint64_t v55 = (char *)v49 - (char *)var0;
          if (self->_blocksCount > (v55 >> 4)
            && (!length
             || ((*(void *)((char *)self->_blocks + (v55 & 0xFFFFFFFF0) + 8) >> 5) & 0xFFFFFFFFFLL)
              + *(unint64_t *)((char *)&self->_blocks->var0 + (v55 & 0xFFFFFFFF0)) >= location + length))
          {
            goto LABEL_14;
          }
        }
        else
        {
          unsigned int v50 = v48 - v46;
          if (v48 != v46)
          {
            do
            {
              uint64_t v51 = v50 >> 1;
              unint64_t v49 = &p_var0[2 * v51];
              if (*v49 <= location)
              {
                if (((p_var0[2 * v51 + 1] >> 5) & 0xFFFFFFFFFLL) + *v49 > location) {
                  goto LABEL_67;
                }
                p_unint64_t var0 = v49 + 2;
                LODWORD(v51) = --v50 >> 1;
              }
              id v4 = 0;
              BOOL v8 = v50 >= 2;
              unsigned int v50 = v51;
            }
            while (v8);
            goto LABEL_71;
          }
        }
      }
    }
LABEL_70:
    id v4 = 0;
    goto LABEL_71;
  }
  do
  {
    uint64_t v52 = v36 >> 1;
    unint64_t v49 = &v41[v52].var0;
    if (*v49 <= location)
    {
      if (((*((void *)&v41[v52] + 1) >> 5) & 0xFFFFFFFFFLL) + *v49 > location) {
        goto LABEL_67;
      }
      int v41 = (_VMUBlockNode *)(v49 + 2);
      LODWORD(v52) = --v36 >> 1;
    }
    id v4 = 0;
    BOOL v8 = v36 >= 2;
    unsigned int v36 = v52;
  }
  while (v8);
LABEL_71:

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
      unint64_t v17 = (void (*)(void *, unint64_t, void *, unsigned __int8 *))v6[2];
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
  v7[2] = __53__VMUTaskMemoryScanner_enumerateReferencesWithBlock___block_invoke;
  v7[3] = &unk_1E5D23438;
  char v9 = v15;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  unint64_t v10 = &v11;
  [(VMUTaskMemoryScanner *)self scanNodesWithReferenceRecorder:v7];
  LODWORD(self) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(v15, 8);

  return self;
}

uint64_t __53__VMUTaskMemoryScanner_enumerateReferencesWithBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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
  unsigned int v36 = regionMap->var4;
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
    unsigned int v36 = v18 + 1;
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
  unint64_t v40 = (id *)(v39 + 64);
  unint64_t v41 = regionMap->var5 - ((uint64_t)(v39 + 64 - (unint64_t)regionMap->var4) >> 6);
  if (!v41) {
    goto LABEL_52;
  }
  while (2)
  {
    unint64_t v42 = v41 >> 1;
    uint64_t v43 = &v40[8 * (v41 >> 1)];
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
    unint64_t v40 = v43 + 8;
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
  _DWORD *v15 = ((v39 - (unint64_t)var4) >> 6) + 1;
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
            unint64_t v30 = &var0[v29].var0;
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
              unint64_t v30 = &p_var0[2 * v32];
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
    unint64_t v30 = &v23[v34].var0;
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
  unint64_t v17 = v15 + 64;
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
  *unint64_t v17 = ((v41 - (unint64_t)var4) >> 6) + 1;
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

- (NSDictionary)ledger
{
  return [(VMUVMRegionIdentifier *)self->_regionIdentifier ledger];
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6 = a3;
  unint64_t v7 = [(VMUTaskMemoryScanner *)self ledger];
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
  self->_scanningMask = a3;
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

- (BOOL)mallocEnumerationShouldFail
{
  return self->_mallocEnumerationShouldFail;
}

- (void)setMallocEnumerationShouldFail:(BOOL)a3
{
  self->_mallocEnumerationShouldFail = a3;
}

- (_VMURegionNode)regions
{
  return self->_regions;
}

- (_VMUBlockNode)blocks
{
  return *(_VMUBlockNode **)(v0 + 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanOverlay, 0);
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
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "-[VMUTaskMemoryScanner _initWithTask:options:]: region identifier detected no regions, so returning nil VMUTaskMemoryScanner", v0, 2u);
}

void __65__VMUTaskMemoryScanner__callRemoteMallocEnumerators_error_block___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, mach_error_t error_value)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)a1 + 208) + 24 * a2 + 8)) {
    id v4 = *(__CFString **)(*(void *)(*(void *)a1 + 208) + 24 * a2 + 8);
  }
  else {
    id v4 = @"UNKNOWN";
  }
  int v5 = 138412802;
  id v6 = v4;
  __int16 v7 = 2080;
  BOOL v8 = mach_error_string(error_value);
  __int16 v9 = 1024;
  mach_error_t v10 = error_value;
  _os_log_error_impl(&dword_1A7CC9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "error: malloc enumeration of zone \"%@\" failed to get full information about malloc metadata and/or allocations with the error \"%s (%d)\". It is likely that the target was suspended while malloc metadata was being modified.", (uint8_t *)&v5, 0x1Cu);
}

@end