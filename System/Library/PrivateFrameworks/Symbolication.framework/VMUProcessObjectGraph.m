@interface VMUProcessObjectGraph
+ (id)createWithTask:(unsigned int)a3;
- ($938B03310D06493B2963E5A84CB75A7E)autoreleasePoolOffsets;
- (BOOL)didPhysFootprintDirtyAccounting;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (BOOL)hasLabelsForNodes;
- (BOOL)is64bit;
- (BOOL)isTranslatedByRosetta;
- (BOOL)nodeDetailIsAutoreleasePoolContentPage:(id)a3;
- (BOOL)nodeIsAutoreleasePoolContentPage:(unsigned int)a3;
- (BOOL)resymbolicateWithDsymPath:(id)a3 libraryNames:(id)a4 all:(BOOL)a5 progress:(id)a6 showDebugInfo:(BOOL)a7 error:(id *)a8;
- (BOOL)showRawClassNames;
- (BOOL)showsPhysFootprint;
- (NSArray)backtraces;
- (NSDate)snapshotDate;
- (NSDictionary)ledger;
- (NSDictionary)srcAddressToExtraAutoreleaseCountDict;
- (NSString)binaryImagesDescription;
- (NSString)executablePath;
- (NSString)processDescriptionString;
- (NSString)processName;
- (VMUClassInfoMap)realizedClasses;
- (VMUDebugTimer)debugTimer;
- (VMUNodeToStringMap)nodeLabels;
- (VMUProcessObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7;
- (VMUProcessObjectGraph)initWithPid:(int)a3 nodes:(_VMUBlockNode *)a4 nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:;
- (VMUStackLogReader)stackLogReader;
- (VMUSymbolStore)symbolStore;
- (VMUTaskMemoryScanner)scanner;
- (_CSArchitecture)parseMacOSArchitectureFromProcessDescription;
- (_VMURange)binarySectionRangeContainingAddress:(unint64_t)a3;
- (_VMURange)dyldSharedCacheRange;
- (_VMURange)rangeForSymbolName:(id)a3 inRegion:(id)a4;
- (_VMURange)regionSymbolRangeContainingAddress:(unint64_t)a3;
- (id)_descriptionForRegionAddress:(unint64_t)a3 withOffset:(unint64_t)a4 showSegment:(BOOL)a5;
- (id)_detailedNodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6;
- (id)binarySectionNameForAddress:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)labelForNode:(unsigned int)a3;
- (id)leakedNodesGraph;
- (id)nodeDescription:(unsigned int)a3;
- (id)nodeDescription:(unsigned int)a3 withDestinationNode:(unsigned int)a4 referenceInfo:(id *)a5;
- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4;
- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4 showLabel:(BOOL)a5;
- (id)nodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5;
- (id)referenceDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6;
- (id)regionSymbolNameForAddress:(unint64_t)a3;
- (id)sampleBacktracesString;
- (id)shortLabelForNode:(unsigned int)a3;
- (id)shortNodeDescription:(unsigned int)a3;
- (id)threadNameForAddress:(unint64_t)a3;
- (id)vmuVMRegionForAddress:(unint64_t)a3;
- (id)vmuVMRegionForNode:(unsigned int)a3;
- (id)zoneNameForIndex:(unsigned int)a3;
- (int)pid;
- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4;
- (unint64_t)physicalFootprint;
- (unint64_t)physicalFootprintPeak;
- (unint64_t)serializationOptions;
- (unint64_t)snapshotMachTime;
- (unsigned)enumerateReferencesFromDataRegion:(id)a3 atGlobalSymbol:(id)a4 withBlock:(id)a5;
- (unsigned)enumerateRegionsWithBlock:(id)a3;
- (unsigned)idleExitStatus;
- (unsigned)kernelPageSize;
- (unsigned)nodeReferencedFromDataRegion:(id)a3 byGlobalSymbol:(id)a4;
- (unsigned)objectContentLevel;
- (unsigned)objectContentLevelForNodeLabels;
- (unsigned)regionCount;
- (unsigned)vmPageSize;
- (unsigned)zoneCount;
- (void)_deriveObjcClassStructureRanges;
- (void)_generateSymbolStoreFromExistingGraph;
- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6;
- (void)_reorderLabelsWithNodeNameMap:(unsigned int *)a3;
- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4;
- (void)contentForNode:(unsigned int)a3;
- (void)copyUserMarked;
- (void)dealloc;
- (void)markLeafNodes:(void *)a3;
- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4;
- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4 options:(unsigned int)a5;
- (void)markRootNodes:(void *)a3;
- (void)parseAddressesFromNodeLabelsIntoSymbolStore;
- (void)refineEdges:(unsigned int)a3 withOptions:(unsigned int)a4 markingInvalid:(void *)a5;
- (void)refineTypesWithOverlay:(id)a3;
- (void)removeWeakEdges;
- (void)resymbolicateNonObjectsUsingStackBacktrace;
- (void)resymbolicatePrivateMaps;
- (void)setBacktraces:(id)a3;
- (void)setBinaryImagesDescription:(id)a3;
- (void)setBinarySectionName:(id)a3 forRange:(_VMURange)a4;
- (void)setDebugTimer:(id)a3;
- (void)setDidPhysFootprintDirtyAccounting:(BOOL)a3;
- (void)setDyldSharedCacheRange:(_VMURange)a3;
- (void)setIdleExitStatus:(unsigned int)a3;
- (void)setIsTranslatedByRosetta:(BOOL)a3;
- (void)setLabel:(id)a3 forNode:(unsigned int)a4;
- (void)setLedger:(id)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setObjectContentLevelForNodeLabels:(unsigned int)a3;
- (void)setPhysicalFootprint:(unint64_t)a3;
- (void)setPhysicalFootprintPeak:(unint64_t)a3;
- (void)setProcessDescriptionString:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setRegionSymbolName:(id)a3 forRange:(_VMURange)a4;
- (void)setScanner:(id)a3;
- (void)setSerializationOptions:(unint64_t)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)setShowsPhysFootprint:(BOOL)a3;
- (void)setSnapshotDate:(id)a3;
- (void)setSnapshotMachTime:(unint64_t)a3;
- (void)setSrcAddressToExtraAutoreleaseCountDict:(id)a3;
- (void)setStackLogReader:(id)a3;
- (void)setSymbolStore:(id)a3;
- (void)setThreadName:(id)a3 forRange:(_VMURange)a4;
- (void)setUserMarked:(void *)a3;
@end

@implementation VMUProcessObjectGraph

+ (id)createWithTask:(unsigned int)a3
{
  id v3 = [[VMUTaskMemoryScanner alloc] initFullyWithTask:*(void *)&a3];
  v4 = [v3 processSnapshotGraph];

  return v4;
}

- (VMUProcessObjectGraph)initWithPid:(int)a3 nodes:(_VMUBlockNode *)a4 nodeCount:zoneNames:classInfoMap:regions:pthreadOffsets:userMarked:autoreleasePoolOffsets:
{
  v8 = v7;
  v9 = v6;
  v10 = v5;
  uint64_t v11 = v4;
  v40[3] = *MEMORY[0x1E4F143B8];
  id v15 = v5;
  id v36 = v9;
  id v16 = v8;
  id v35 = v41;
  v38.receiver = self;
  v38.super_class = (Class)VMUProcessObjectGraph;
  v17 = [(VMUObjectGraph *)&v38 initWithNodesNoCopy:a4 nodeCount:v11];
  v18 = v17;
  if (v17)
  {
    v37.receiver = v17;
    v37.super_class = (Class)VMUProcessObjectGraph;
    [(VMUObjectGraph *)&v37 setIndexedClassInfos:v36];
    *(&v18->super._referencingCount + 1) = a3;
    LODWORD(v18->_scanner) = *MEMORY[0x1E4F14B00];
    HIDWORD(v18->_scanner) = *MEMORY[0x1E4F14AE8];
    objc_storeStrong((id *)&v18->_regionCount, v10);
    objc_storeStrong((id *)&v18->_machAbsolute, v8);
    LODWORD(v18->_regions) = [v16 count];
    uint64_t v19 = objc_opt_new();
    binaryImagesDescription = v18->_binaryImagesDescription;
    v18->_binaryImagesDescription = (NSString *)v19;

    uint64_t v21 = objc_opt_new();
    threadNameRanges = v18->_threadNameRanges;
    v18->_threadNameRanges = (VMURangeToStringMap *)v21;

    uint64_t v23 = objc_opt_new();
    binarySectionNameRanges = v18->_binarySectionNameRanges;
    v18->_binarySectionNameRanges = (VMURangeToStringMap *)v23;

    objc_storeStrong((id *)&v18->_gotObjcClassStructureRanges, v41);
    v39[0] = @"parentPageOffset";
    v25 = [NSNumber numberWithUnsignedInt:v43[1]];
    v40[0] = v25;
    v39[1] = @"firstEntryOffset";
    v26 = [NSNumber numberWithUnsignedInt:v43[2]];
    v40[1] = v26;
    v39[2] = @"childPageOffset";
    v27 = [NSNumber numberWithUnsignedInt:v43[6]];
    v40[2] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    pthreadOffsets = v18->_pthreadOffsets;
    v18->_pthreadOffsets = (NSDictionary *)v28;

    uint64_t v30 = objc_opt_new();
    symbolStore = v18->_symbolStore;
    v18->_symbolStore = (VMUSymbolStore *)v30;

    LODWORD(v18->_physicalFootprintPeak) = 0;
    if (v42)
    {
      size_t v32 = ((*v42 + 7) >> 3) + 4;
      v33 = (NSDictionary *)malloc_type_malloc(v32, 0x37C10B9BuLL);
      memcpy(v33, v42, v32);
      v18->_autoreleasePoolOffsets = v33;
    }
  }

  return v18;
}

- (void)dealloc
{
  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (autoreleasePoolOffsets)
  {
    free(autoreleasePoolOffsets);
    self->_autoreleasePoolOffsets = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUProcessObjectGraph;
  [(VMUObjectGraph *)&v4 dealloc];
}

- (VMUProcessObjectGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  v164[3] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  v162.receiver = self;
  v162.super_class = (Class)VMUProcessObjectGraph;
  v14 = [(VMUObjectGraph *)&v162 initWithArchived:v12 version:a4 options:a5 diskLogs:v13 error:a7];
  if (!v14) {
    goto LABEL_91;
  }
  id v149 = v13;
  uint64_t v161 = 0;
  if (a7) {
    id v15 = a7;
  }
  else {
    id v15 = (id *)&v161;
  }
  id v16 = [v12 objectForKeyedSubscript:@"processGraphInfo"];
  v17 = [v16 objectForKeyedSubscript:@"pid"];
  *((_DWORD *)v14 + 49) = [v17 intValue];

  v18 = [v16 objectForKeyedSubscript:@"processName"];
  uint64_t v19 = [v18 copy];
  v20 = (void *)*((void *)v14 + 31);
  *((void *)v14 + 31) = v19;

  uint64_t v21 = [v16 objectForKeyedSubscript:@"processDescriptionString"];
  uint64_t v22 = [v21 copy];
  uint64_t v23 = (void *)*((void *)v14 + 32);
  *((void *)v14 + 32) = v22;

  v24 = [v16 objectForKeyedSubscript:@"isTranslatedByRosetta"];
  v14[264] = [v24 BOOLValue];

  v25 = [v16 objectForKeyedSubscript:@"binaryImagesDescription"];
  uint64_t v26 = +[VMUDirectedGraph _unarchivedObject:v25 ofClass:objc_opt_class() options:a5];
  v27 = (void *)*((void *)v14 + 35);
  *((void *)v14 + 35) = v26;

  if (kVMUPrintArchivingTiming) {
    fwrite("[Binary Images List] \n\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  }
  unint64_t v150 = a5;
  uint64_t v28 = [v16 objectForKeyedSubscript:@"showsPhysFootprint"];
  v14[380] = [v28 BOOLValue];

  v29 = [v16 objectForKeyedSubscript:@"didPhysFootprintDirtyAccounting"];
  v14[381] = [v29 BOOLValue];

  uint64_t v30 = [v16 objectForKeyedSubscript:@"vmPageSize"];
  *((_DWORD *)v14 + 52) = [v30 unsignedIntValue];

  v31 = [v16 objectForKeyedSubscript:@"kernPageSize"];
  *((_DWORD *)v14 + 53) = [v31 unsignedIntValue];

  if (!*((_DWORD *)v14 + 52)) {
    *((_DWORD *)v14 + 52) = *((_DWORD *)v14 + 53);
  }
  size_t v32 = [v16 objectForKeyedSubscript:@"dyldSharedCacheBase"];
  uint64_t v33 = [v32 unsignedLongLongValue];

  v34 = [v16 objectForKeyedSubscript:@"dyldSharedCacheLength"];
  uint64_t v35 = [v34 unsignedLongLongValue];

  *((void *)v14 + 57) = v33;
  *((void *)v14 + 58) = v35;
  id v36 = [v16 objectForKeyedSubscript:@"zoneNames"];
  uint64_t v37 = [v36 copy];
  objc_super v38 = (void *)*((void *)v14 + 30);
  *((void *)v14 + 30) = v37;

  v39 = [v16 objectForKeyedSubscript:@"regionCount"];
  v40 = (unsigned int *)(v14 + 232);
  *((_DWORD *)v14 + 58) = [v39 unsignedIntValue];

  v41 = [v16 objectForKeyedSubscript:@"machTime"];
  *((void *)v14 + 27) = [v41 unsignedLongLongValue];

  v42 = [v16 objectForKeyedSubscript:@"snapshotDate"];
  uint64_t v43 = [v42 copy];
  v44 = (void *)*((void *)v14 + 54);
  *((void *)v14 + 54) = v43;

  v45 = [v16 objectForKeyedSubscript:@"physFootprint"];
  *((void *)v14 + 45) = [v45 unsignedLongLongValue];

  v46 = [v16 objectForKeyedSubscript:@"physFootprintPeak"];
  *((void *)v14 + 46) = [v46 unsignedLongLongValue];

  v47 = [v16 objectForKeyedSubscript:@"pthreadOffsets"];
  uint64_t v48 = [v47 copy];
  v49 = (void *)*((void *)v14 + 40);
  *((void *)v14 + 40) = v48;

  v50 = [v16 objectForKeyedSubscript:@"objectContentLevel"];
  *((_DWORD *)v14 + 96) = [v50 unsignedIntValue];

  *((_DWORD *)v14 + 97) = *((_DWORD *)v14 + 96);
  v51 = [v16 objectForKeyedSubscript:@"srcAddressToExtraAutoreleaseCountDict"];
  v52 = +[VMUDirectedGraph _unarchivedObject:v51 ofClass:objc_opt_class() options:a5];

  if (!v52)
  {
LABEL_18:
    v63 = [v16 objectForKeyedSubscript:@"VMUVMRegionCurrentVersion"];
    uint64_t v64 = [v63 integerValue];

    if (v64 <= [(id)objc_opt_class() version] && *v40)
    {
      v65 = [v16 objectForKeyedSubscript:@"regionData"];
      v144 = +[VMUDirectedGraph _copyUnarchived:v65 length:0 options:v150];

      if (kVMUPrintArchivingTiming) {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "[VM Regions] Count: %u\n\n", *v40);
      }
      uint64_t v66 = [v16 objectForKeyedSubscript:@"regionDataSerializer"];
      if (!v66)
      {
        v67 = [v16 objectForKeyedSubscript:@"regionDataSerializerCompressed"];
        uint64_t v66 = +[VMUDirectedGraph _unarchivedObject:v67 ofClass:objc_opt_class() options:v150];

        if (kVMUPrintArchivingTiming) {
          fwrite("[VM Region list string content] \n\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
        }
      }
      v145 = v52;
      v143 = (void *)v66;
      v148 = [[VMUSimpleDeserializer alloc] initWithData:v66];
      v68 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*v40];
      if (*v40)
      {
        unint64_t v69 = 0;
        v70 = v144;
        while (1)
        {
          v71 = [[VMUVMRegion alloc] initWithVMRegionData:v70 encodedVersion:v64 simpleSerializer:v148 error:v15];
          v72 = v71;
          if (*v15) {
            break;
          }
          [v68 addObject:v71];

          ++v69;
          v70 += 128;
          if (v69 >= *v40) {
            goto LABEL_29;
          }
        }

        v88 = 0;
        goto LABEL_55;
      }
LABEL_29:
      free(v144);
      v73 = [v16 objectForKeyedSubscript:@"regionDataExtra"];
      v74 = +[VMUDirectedGraph _copyUnarchived:v73 length:0 options:v150];

      v52 = v145;
      if (v74)
      {
        if (kVMUPrintArchivingTiming) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Region Data Extra] Count: %u\n\n", *v40);
        }
        if (*v40)
        {
          unint64_t v75 = 0;
          v76 = v74;
          do
          {
            v77 = [v68 objectAtIndexedSubscript:v75];
            [v77 setVMRegionDataExtra:v76];

            ++v75;
            v76 += 16;
          }
          while (v75 < *v40);
        }
        free(v74);
      }
      v78 = [v16 objectForKeyedSubscript:@"exclaveFlagData"];
      v79 = +[VMUDirectedGraph _copyUnarchived:v78 length:0 options:v150];

      if (v79)
      {
        if (kVMUPrintArchivingTiming) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Exclave Flag Data] Count: %u\n\n", *v40);
        }
        if (*v40)
        {
          unint64_t v80 = 0;
          v81 = v79;
          do
          {
            v82 = [v68 objectAtIndexedSubscript:v80];
            [v82 setVMRegionExclaveFlagsData:v81];

            ++v80;
            v81 += 4;
          }
          while (v80 < *v40);
        }
        free(v79);
      }
      objc_storeStrong((id *)v14 + 28, v68);
      int v83 = [v14 nodeNamespaceSize];
      v84 = malloc_type_calloc(1uLL, ((v83 + 7) >> 3) + 4, 0xFF42C4F3uLL);
      _DWORD *v84 = v83;
      if (v14[380] && !v14[381])
      {
        uint64_t v89 = ownedPhysFootprintAdjustmentForMemgraph(v68, (_DWORD *)v14 + 58, *((void *)v14 + 57), *((void *)v14 + 58));
        v14[381] = 1;
        if (v89)
        {
          v90 = (void *)v89;
          v157[0] = MEMORY[0x1E4F143A8];
          v157[1] = 3221225472;
          v157[2] = __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke;
          v157[3] = &unk_1E5D24FA8;
          v91 = v14;
          v158 = v91;
          id v92 = v90;
          id v159 = v92;
          v160 = v84;
          [v91 reverseEnumerateNodesWithBlock:v157];
          [v91 removeMarkedNodes:v84];
          v146 = v92;
          [v68 removeObject:v92];
        }
        else
        {
          v146 = 0;
        }
        v86 = v143;
      }
      else
      {
        uint64_t v85 = [v14 nodeNamespaceSize] - 1;
        uint64_t v154 = 0;
        uint64_t v155 = 0;
        uint64_t v156 = 0;
        [v14 nodeDetails:v85];
        v86 = v143;
        if (VMUGraphNodeType_IsVMRegion(0))
        {
          v87 = [v14 vmuVMRegionForNode:v85];
          if (!v87)
          {
            if (*v84 > v85) {
              *((unsigned char *)v84 + (v85 >> 3) + 4) |= 1 << (v85 & 7);
            }
            [v14 removeMarkedNodes:v84];
          }
        }
        v146 = 0;
      }
      free(v84);
    }
    else
    {
      v146 = 0;
      v68 = 0;
      unsigned int *v40 = 0;
    }
    v93 = [v16 objectForKey:@"autoreleasePoolOffsets"];

    if (v93)
    {
      v94 = [v16 objectForKeyedSubscript:@"autoreleasePoolOffsets"];
      uint64_t v95 = [v94 copy];
      v96 = (void *)*((void *)v14 + 41);
      *((void *)v14 + 41) = v95;
    }
    else
    {
      v163[0] = @"parentPageOffset";
      v97 = NSNumber;
      if ([v14 is64bit]) {
        uint64_t v98 = 32;
      }
      else {
        uint64_t v98 = 24;
      }
      v94 = [v97 numberWithUnsignedInt:v98];
      v164[0] = v94;
      v163[1] = @"firstEntryOffset";
      v99 = NSNumber;
      if ([v14 is64bit]) {
        uint64_t v100 = 56;
      }
      else {
        uint64_t v100 = 40;
      }
      v96 = [v99 numberWithUnsignedInt:v100];
      v164[1] = v96;
      v163[2] = @"childPageOffset";
      v101 = NSNumber;
      if ([v14 is64bit]) {
        uint64_t v102 = 40;
      }
      else {
        uint64_t v102 = 28;
      }
      v103 = [v101 numberWithUnsignedInt:v102];
      v164[2] = v103;
      uint64_t v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v164 forKeys:v163 count:3];
      v105 = (void *)*((void *)v14 + 41);
      *((void *)v14 + 41) = v104;
    }
    v106 = [v16 objectForKeyedSubscript:@"threadNameRanges"];
    uint64_t v107 = +[VMUDirectedGraph _unarchivedObject:v106 ofClass:objc_opt_class() options:v150];
    v108 = (void *)*((void *)v14 + 36);
    *((void *)v14 + 36) = v107;

    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Thread Name Ranges] Count: %u  Uniqued string count: %u\n\n", [*((id *)v14 + 36) count], [*((id *)v14 + 36) uniquedStringCount]);
    }
    v109 = [v16 objectForKeyedSubscript:@"binarySectionNameRanges"];
    uint64_t v110 = +[VMUDirectedGraph _unarchivedObject:v109 ofClass:objc_opt_class() options:v150];
    v111 = (void *)*((void *)v14 + 37);
    *((void *)v14 + 37) = v110;

    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Binary Section Name Ranges] Count: %u  Uniqued string count: %u\n\n", [*((id *)v14 + 37) count], [*((id *)v14 + 37) uniquedStringCount]);
    }
    v112 = [v16 objectForKeyedSubscript:@"regionSymbolNameRanges"];
    uint64_t v113 = +[VMUDirectedGraph _unarchivedObject:v112 ofClass:objc_opt_class() options:v150];
    v114 = (void *)*((void *)v14 + 38);
    *((void *)v14 + 38) = v113;

    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Region Symbol Name Ranges] Count: %u  Uniqued string count: %u\n\n", [*((id *)v14 + 38) count], [*((id *)v14 + 38) uniquedStringCount]);
    }
    v115 = [v16 objectForKeyedSubscript:@"nodeLabels"];
    uint64_t v116 = +[VMUDirectedGraph _unarchivedObject:v115 ofClass:objc_opt_class() options:v150];
    v117 = (void *)*((void *)v14 + 53);
    *((void *)v14 + 53) = v116;

    v118 = (void *)*((void *)v14 + 53);
    if (v118)
    {
      if (kVMUPrintArchivingTiming) {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Node Labels] Count: %u  Uniqued string count: %u\n\n", [v118 count], [v14 uniquedStringCount]);
      }
    }
    else if (kVMUPrintArchivingTiming)
    {
      fwrite("[Node Labels] NO NODE LABELS\n\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    }
    v119 = [v16 objectForKeyedSubscript:@"userMarked"];
    *((void *)v14 + 42) = +[VMUDirectedGraph _copyUnarchived:v119 length:0 options:v150];

    v120 = [v16 objectForKeyedSubscript:@"symbolStore"];
    uint64_t v121 = +[VMUDirectedGraph _unarchivedObject:v120 ofClass:objc_opt_class() options:v150];
    v122 = (void *)*((void *)v14 + 52);
    *((void *)v14 + 52) = v121;

    if (kVMUPrintArchivingTiming) {
      fwrite("[Symbol Store] \n\n", 0x11uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    }
    [*((id *)v14 + 52) setGraph:v14];
    v123 = [v16 objectForKeyedSubscript:@"stackLogReader"];
    uint64_t v124 = +[VMUDirectedGraph _unarchivedObject:v123 ofClass:objc_opt_class() options:v150];
    v125 = (void *)*((void *)v14 + 43);
    *((void *)v14 + 43) = v124;

    v126 = (void *)*((void *)v14 + 43);
    if (v126)
    {
      [v126 setGraph:v14];
      [*((id *)v14 + 43) setDiskLogs:v149];
      v127 = [v14 indexedClassInfos];
      char v128 = [v127 hasClassInfosDerivedFromStackBacktraces];

      if ((v128 & 1) == 0)
      {
        v129 = (void *)*((void *)v14 + 43);
        v130 = [v14 indexedClassInfos];
        v152[0] = MEMORY[0x1E4F143A8];
        v152[1] = 3221225472;
        v152[2] = __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke_2;
        v152[3] = &unk_1E5D231C0;
        v131 = v14;
        v153 = v131;
        [v129 identifyNonObjectsUsingStackBacktraces:v131 classInfoMap:v130 classInfoSetterBlock:v152];

        v132 = [v131 indexedClassInfos];
        v151.receiver = v131;
        v151.super_class = (Class)VMUProcessObjectGraph;
        [(VMUObjectGraph *)&v151 setIndexedClassInfos:v132];
      }
    }
    v133 = [v16 objectForKeyedSubscript:@"backtraces"];
    v134 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v135 = objc_opt_class();
    v136 = [v134 setWithObjects:v135, nil];
    uint64_t v137 = +[VMUDirectedGraph _unarchivedObject:v133 ofClasses:v136 options:v150];
    v138 = (void *)*((void *)v14 + 51);
    *((void *)v14 + 51) = v137;

    v139 = [v16 objectForKeyedSubscript:@"idleExitStatus"];
    *((_DWORD *)v14 + 94) = [v139 unsignedIntValue];

    uint64_t v140 = [v16 objectForKeyedSubscript:@"ledger"];
    v141 = (void *)*((void *)v14 + 56);
    *((void *)v14 + 56) = v140;

    id v13 = v149;
LABEL_91:
    v88 = v14;
    goto LABEL_92;
  }
  v53 = [[VMUSimpleDeserializer alloc] initWithData:v52];
  unsigned int v54 = [(VMUSimpleDeserializer *)v53 deserialize32WithError:v15];
  if (!*v15)
  {
    unsigned int v55 = v54;
    id v147 = v12;
    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[srcAddressToExtraAutoreleaseCountDict] Count: %u\n\n", v54);
    }
    v56 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v55];
    if (v55)
    {
      while (1)
      {
        uint64_t v57 = [(VMUSimpleDeserializer *)v53 deserialize64WithError:v15];
        if (*v15) {
          break;
        }
        uint64_t v58 = v57;
        uint64_t v59 = [(VMUSimpleDeserializer *)v53 deserialize32WithError:v15];
        if (*v15) {
          break;
        }
        v60 = [NSNumber numberWithUnsignedInt:v59];
        v61 = [NSNumber numberWithUnsignedLongLong:v58];
        [v56 setObject:v60 forKeyedSubscript:v61];

        if (!--v55) {
          goto LABEL_17;
        }
      }

      id v12 = v147;
      goto LABEL_54;
    }
LABEL_17:
    v62 = (void *)*((void *)v14 + 49);
    *((void *)v14 + 49) = v56;

    id v12 = v147;
    goto LABEL_18;
  }
LABEL_54:

  v88 = 0;
LABEL_55:
  id v13 = v149;
LABEL_92:

  return v88;
}

void __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  unsigned int v4 = a2;
  v6 = [*(id *)(a1 + 32) vmuVMRegionForNode:a2];
  if (v6 == *(void **)(a1 + 40))
  {
    v7 = *(unsigned int **)(a1 + 48);
    if (*v7 > v4) {
      *((unsigned char *)v7 + (v4 >> 3) + 4) |= 1 << (v4 & 7);
    }
    *a3 = 1;
  }
}

id __73__VMUProcessObjectGraph_initWithArchived_version_options_diskLogs_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VMUProcessObjectGraph;
  return [super setClassInfoIndex:a3 forNode:a2];
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  stackLogReader = self->_stackLogReader;
  if (stackLogReader)
  {
    uint64_t v8 = [(VMUGraphStackLogReader *)stackLogReader signpostID];
    stackLogReader = self->_stackLogReader;
    if (v8)
    {
      v9 = [(VMUGraphStackLogReader *)stackLogReader logHandle];
      uint64_t v10 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
      if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v9, OS_SIGNPOST_INTERVAL_END, v11, "VMUProcessObjectGraph", "", buf, 2u);
        }
      }

      stackLogReader = self->_stackLogReader;
    }
  }
  [(VMUGraphStackLogReader *)stackLogReader endEvent:"VMUProcessObjectGraph"];
  [(VMUGraphStackLogReader *)self->_stackLogReader startWithCategory:"VMUProcessObjectGraph" message:"archiving VMUObjectGraph and VMUDirectedGraph"];
  id v12 = self->_stackLogReader;
  if (v12)
  {
    id v13 = [(VMUGraphStackLogReader *)v12 logHandle];
    uint64_t v14 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VMUProcessObjectGraph", "archiving VMUObjectGraph and VMUDirectedGraph", buf, 2u);
      }
    }
  }
  v147.receiver = self;
  v147.super_class = (Class)VMUProcessObjectGraph;
  [(VMUObjectGraph *)&v147 archiveDictionaryRepresentation:v6 options:a4];
  id v16 = self->_stackLogReader;
  if (v16)
  {
    uint64_t v17 = [(VMUGraphStackLogReader *)v16 signpostID];
    id v16 = self->_stackLogReader;
    if (v17)
    {
      v18 = [(VMUGraphStackLogReader *)v16 logHandle];
      uint64_t v19 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
      if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v20 = v19;
        if (os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v18, OS_SIGNPOST_INTERVAL_END, v20, "VMUProcessObjectGraph", "", buf, 2u);
        }
      }

      id v16 = self->_stackLogReader;
    }
  }
  [(VMUGraphStackLogReader *)v16 endEvent:"VMUProcessObjectGraph"];
  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
  [(VMUObjectGraph *)self internalizeNodes];
  uint64_t v22 = [NSNumber numberWithInt:*((unsigned int *)&self->super._referencingCount + 1)];
  [v21 setObject:v22 forKeyedSubscript:@"pid"];

  zoneNames = self->_zoneNames;
  if (zoneNames) {
    [v21 setObject:zoneNames forKeyedSubscript:@"processName"];
  }
  processName = self->_processName;
  if (processName) {
    [v21 setObject:processName forKeyedSubscript:@"processDescriptionString"];
  }
  if (LOBYTE(self->_processDescriptionString))
  {
    v25 = [NSNumber numberWithBool:1];
    [v21 setObject:v25 forKeyedSubscript:@"isTranslatedByRosetta"];
  }
  executablePath = self->_executablePath;
  if (executablePath)
  {
    v27 = +[VMUDirectedGraph _archivedObject:executablePath options:a4];
    [v21 setObject:v27 forKeyedSubscript:@"binaryImagesDescription"];

    if (kVMUPrintArchivingTiming) {
      fwrite("[Binary Images List] \n\n", 0x17uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    }
  }
  uint64_t v28 = [NSNumber numberWithBool:BYTE4(self->_physicalFootprintPeak)];
  [v21 setObject:v28 forKeyedSubscript:@"showsPhysFootprint"];

  v29 = [NSNumber numberWithBool:BYTE5(self->_physicalFootprintPeak)];
  [v21 setObject:v29 forKeyedSubscript:@"didPhysFootprintDirtyAccounting"];

  uint64_t v30 = [NSNumber numberWithUnsignedInt:LODWORD(self->_scanner)];
  [v21 setObject:v30 forKeyedSubscript:@"vmPageSize"];

  v31 = [NSNumber numberWithUnsignedInt:HIDWORD(self->_scanner)];
  [v21 setObject:v31 forKeyedSubscript:@"kernPageSize"];

  uint64_t v32 = *(void *)&self->_regionCount;
  if (v32) {
    [v21 setObject:v32 forKeyedSubscript:@"zoneNames"];
  }
  uint64_t v33 = [NSNumber numberWithUnsignedInt:LODWORD(self->_regions)];
  [v21 setObject:v33 forKeyedSubscript:@"regionCount"];

  v34 = [NSNumber numberWithUnsignedLongLong:*(void *)&self->_vmPageSize];
  [v21 setObject:v34 forKeyedSubscript:@"machTime"];

  [v21 setObject:self->_nodeLabels forKeyedSubscript:@"snapshotDate"];
  uint64_t v35 = [NSNumber numberWithUnsignedLongLong:self->_debugTimer];
  [v21 setObject:v35 forKeyedSubscript:@"physFootprint"];

  id v36 = [NSNumber numberWithUnsignedLongLong:self->_physicalFootprint];
  [v21 setObject:v36 forKeyedSubscript:@"physFootprintPeak"];

  [v21 setObject:*(void *)&self->_gotObjcClassStructureRanges forKeyedSubscript:@"pthreadOffsets"];
  [v21 setObject:self->_pthreadOffsets forKeyedSubscript:@"autoreleasePoolOffsets"];
  uint64_t v37 = [NSNumber numberWithUnsignedInt:self->_idleExitStatus];
  [v21 setObject:v37 forKeyedSubscript:@"objectContentLevel"];

  objc_super v38 = [NSNumber numberWithUnsignedLongLong:self->_ledger];
  [v21 setObject:v38 forKeyedSubscript:@"dyldSharedCacheBase"];

  v39 = [NSNumber numberWithUnsignedLongLong:self->_dyldSharedCacheRange.location];
  [v21 setObject:v39 forKeyedSubscript:@"dyldSharedCacheLength"];

  unint64_t v144 = a4;
  if ([*(id *)&self->_objectContentLevel count])
  {
    v40 = objc_opt_new();
    [v40 serialize32:[*(id *)&self->_objectContentLevel count]];
    v41 = *(void **)&self->_objectContentLevel;
    v145[0] = MEMORY[0x1E4F143A8];
    v145[1] = 3221225472;
    v145[2] = __65__VMUProcessObjectGraph_archiveDictionaryRepresentation_options___block_invoke;
    v145[3] = &unk_1E5D24FD0;
    id v42 = v40;
    id v146 = v42;
    [v41 enumerateKeysAndObjectsUsingBlock:v145];
    uint64_t v43 = (void *)[v42 copyContiguousData];
    v44 = +[VMUDirectedGraph _archivedObject:v43 options:a4];
    [v21 setObject:v44 forKeyedSubscript:@"srcAddressToExtraAutoreleaseCountDict"];

    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[srcAddressToExtraAutoreleaseCountDict] Count: %lu\n\n", [*(id *)&self->_objectContentLevel count]);
    }

    a4 = v144;
  }
  v45 = self->_stackLogReader;
  if (v45 && (uint64_t v46 = [(VMUGraphStackLogReader *)v45 signpostID], v45 = self->_stackLogReader, v46))
  {
    v47 = [(VMUGraphStackLogReader *)v45 logHandle];
    uint64_t v48 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
    unint64_t v49 = 0x1E5D22000;
    if ((unint64_t)(v48 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v50 = v48;
      if (os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v47, OS_SIGNPOST_INTERVAL_END, v50, "VMUProcessObjectGraph", "", buf, 2u);
      }
    }

    v45 = self->_stackLogReader;
  }
  else
  {
    unint64_t v49 = 0x1E5D22000;
  }
  [(VMUGraphStackLogReader *)v45 endEvent:"VMUProcessObjectGraph"];
  [(VMUGraphStackLogReader *)self->_stackLogReader startWithCategory:"VMUProcessObjectGraph" message:"archiving region data"];
  v51 = self->_stackLogReader;
  if (v51)
  {
    v52 = [(VMUGraphStackLogReader *)v51 logHandle];
    uint64_t v53 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
    if ((unint64_t)(v53 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v54 = v53;
      if (os_signpost_enabled(v52))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v54, "VMUProcessObjectGraph", "archiving region data", buf, 2u);
      }
    }
  }
  if (LODWORD(self->_regions))
  {
    unsigned int v55 = objc_opt_new();
    v56 = (char *)malloc_type_malloc((unint64_t)LODWORD(self->_regions) << 7, 0x10000403777A4EEuLL);
    uint64_t v57 = v56;
    LODWORD(regions_low) = self->_regions;
    if (regions_low)
    {
      unint64_t v59 = 0;
      v60 = v56;
      do
      {
        v61 = [self->_machAbsolute objectAtIndexedSubscript:v59];
        [v61 getVMRegionData:v60 withSimpleSerializer:v55];

        ++v59;
        unint64_t regions_low = LODWORD(self->_regions);
        v60 += 128;
      }
      while (v59 < regions_low);
      a4 = v144;
      unint64_t v49 = 0x1E5D22000uLL;
    }
    v62 = [*(id *)(v49 + 2760) _archivedBytes:v57 length:(unint64_t)regions_low << 7 options:a4];
    [v21 setObject:v62 forKeyedSubscript:@"regionData"];

    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[VM Regions] Count: %u\n\n", LODWORD(self->_regions));
    }
    v143 = v57;
    v63 = (char *)malloc_type_malloc(16 * LODWORD(self->_regions), 0x1000040451B5BE8uLL);
    uint64_t v64 = v63;
    LODWORD(v65) = self->_regions;
    if (v65)
    {
      id v141 = v6;
      unint64_t v66 = 0;
      v67 = v63;
      do
      {
        v68 = [self->_machAbsolute objectAtIndexedSubscript:v66];
        [v68 getVMRegionDataExtra:v67];

        ++v66;
        unint64_t v65 = LODWORD(self->_regions);
        v67 += 16;
      }
      while (v66 < v65);
      id v6 = v141;
      unint64_t v49 = 0x1E5D22000uLL;
    }
    unint64_t v69 = [*(id *)(v49 + 2760) _archivedBytes:v64 length:16 * v65 options:v144];
    [v21 setObject:v69 forKeyedSubscript:@"regionDataExtra"];

    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Region Data Extra] Count: %u\n\n", LODWORD(self->_regions));
    }
    if (LODWORD(self->_regions))
    {
      v70 = [self->_machAbsolute objectAtIndexedSubscript:0];
      int v71 = v70[232];

      if (v71)
      {
        v72 = (char *)malloc_type_malloc(4 * LODWORD(self->_regions), 0x100004052888210uLL);
        v73 = v72;
        LODWORD(v74) = self->_regions;
        if (v74)
        {
          id v142 = v6;
          unint64_t v75 = 0;
          v76 = v72;
          do
          {
            v77 = [self->_machAbsolute objectAtIndexedSubscript:v75];
            [v77 getVMRegionExclaveFlagsData:v76];

            ++v75;
            unint64_t v74 = LODWORD(self->_regions);
            v76 += 4;
          }
          while (v75 < v74);
          id v6 = v142;
        }
        v78 = +[VMUDirectedGraph _archivedBytes:v73 length:4 * v74 options:v144];
        [v21 setObject:v78 forKeyedSubscript:@"exclaveFlagData"];

        free(v73);
        if (kVMUPrintArchivingTiming) {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Exclave Flag Data] Count: %u\n\n", LODWORD(self->_regions));
        }
      }
    }
    v79 = (void *)[v55 copyContiguousData];
    unint64_t v80 = +[VMUDirectedGraph _archivedObject:v79 options:v144];
    [v21 setObject:v80 forKeyedSubscript:@"regionDataSerializerCompressed"];

    if (kVMUPrintArchivingTiming) {
      fwrite("[VM Region list string content] \n\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    }
    v81 = [NSNumber numberWithInteger:[objc_opt_class() version]];
    [v21 setObject:v81 forKeyedSubscript:@"VMUVMRegionCurrentVersion"];

    free(v143);
    free(v64);

    a4 = v144;
    unint64_t v49 = 0x1E5D22000uLL;
  }
  v82 = self->_stackLogReader;
  if (v82)
  {
    uint64_t v83 = [(VMUGraphStackLogReader *)v82 signpostID];
    v82 = self->_stackLogReader;
    if (v83)
    {
      v84 = [(VMUGraphStackLogReader *)v82 logHandle];
      uint64_t v85 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
      if ((unint64_t)(v85 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v86 = v85;
        if (os_signpost_enabled(v84))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v84, OS_SIGNPOST_INTERVAL_END, v86, "VMUProcessObjectGraph", "", buf, 2u);
        }
      }

      v82 = self->_stackLogReader;
    }
  }
  [(VMUGraphStackLogReader *)v82 endEvent:"VMUProcessObjectGraph"];
  [(VMUGraphStackLogReader *)self->_stackLogReader startWithCategory:"VMUProcessObjectGraph" message:"archiving thread / binary / regionSymbol to range mappings"];
  v87 = self->_stackLogReader;
  if (v87)
  {
    v88 = [(VMUGraphStackLogReader *)v87 logHandle];
    uint64_t v89 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
    if ((unint64_t)(v89 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v90 = v89;
      if (os_signpost_enabled(v88))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v88, OS_SIGNPOST_INTERVAL_BEGIN, v90, "VMUProcessObjectGraph", "archiving thread / binary / regionSymbol to range mappings", buf, 2u);
      }
    }
  }
  v91 = [*(id *)(v49 + 2760) _archivedObject:self->_binaryImagesDescription options:a4];
  [v21 setObject:v91 forKeyedSubscript:@"threadNameRanges"];

  if (kVMUPrintArchivingTiming) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Thread Name Ranges] Count: %u  Uniqued string count: %u\n\n", [(NSString *)self->_binaryImagesDescription count], [(NSString *)self->_binaryImagesDescription uniquedStringCount]);
  }
  id v92 = [*(id *)(v49 + 2760) _archivedObject:self->_threadNameRanges options:a4];
  [v21 setObject:v92 forKeyedSubscript:@"binarySectionNameRanges"];

  if (kVMUPrintArchivingTiming) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Binary Section Name Ranges] Count: %u  Uniqued string count: %u\n\n", [(VMURangeToStringMap *)self->_threadNameRanges count], [(VMURangeToStringMap *)self->_threadNameRanges uniquedStringCount]);
  }
  v93 = [*(id *)(v49 + 2760) _archivedObject:self->_binarySectionNameRanges options:a4];
  [v21 setObject:v93 forKeyedSubscript:@"regionSymbolNameRanges"];

  if (kVMUPrintArchivingTiming) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Region Symbol Name Ranges] Count: %u  Uniqued string count: %u\n\n", [(VMURangeToStringMap *)self->_binarySectionNameRanges count], [(VMURangeToStringMap *)self->_binarySectionNameRanges uniquedStringCount]);
  }
  v94 = self->_stackLogReader;
  if (v94)
  {
    uint64_t v95 = [(VMUGraphStackLogReader *)v94 signpostID];
    v94 = self->_stackLogReader;
    if (v95)
    {
      v96 = [(VMUGraphStackLogReader *)v94 logHandle];
      uint64_t v97 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
      if ((unint64_t)(v97 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v98 = v97;
        if (os_signpost_enabled(v96))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v96, OS_SIGNPOST_INTERVAL_END, v98, "VMUProcessObjectGraph", "", buf, 2u);
        }
      }

      v94 = self->_stackLogReader;
    }
  }
  [(VMUGraphStackLogReader *)v94 endEvent:"VMUProcessObjectGraph"];
  if ([(VMUSymbolStore *)self->_symbolStore count])
  {
    v99 = self->_stackLogReader;
    if (v99)
    {
      uint64_t v100 = [(VMUGraphStackLogReader *)v99 signpostID];
      v99 = self->_stackLogReader;
      if (v100)
      {
        v101 = [(VMUGraphStackLogReader *)v99 logHandle];
        uint64_t v102 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
        if ((unint64_t)(v102 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v103 = v102;
          if (os_signpost_enabled(v101))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v101, OS_SIGNPOST_INTERVAL_END, v103, "VMUProcessObjectGraph", "", buf, 2u);
          }
        }

        v99 = self->_stackLogReader;
      }
    }
    [(VMUGraphStackLogReader *)v99 endEvent:"VMUProcessObjectGraph"];
    [(VMUGraphStackLogReader *)self->_stackLogReader startWithCategory:"VMUProcessObjectGraph" message:"archiving node labels"];
    uint64_t v104 = self->_stackLogReader;
    if (v104)
    {
      v105 = [(VMUGraphStackLogReader *)v104 logHandle];
      uint64_t v106 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
      if ((unint64_t)(v106 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v107 = v106;
        if (os_signpost_enabled(v105))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v105, OS_SIGNPOST_INTERVAL_BEGIN, v107, "VMUProcessObjectGraph", "archiving node labels", buf, 2u);
        }
      }
    }
    v108 = [*(id *)(v49 + 2760) _archivedObject:self->_symbolStore options:a4];
    [v21 setObject:v108 forKeyedSubscript:@"nodeLabels"];

    v109 = self->_stackLogReader;
    if (v109)
    {
      uint64_t v110 = [(VMUGraphStackLogReader *)v109 signpostID];
      v109 = self->_stackLogReader;
      if (v110)
      {
        v111 = [(VMUGraphStackLogReader *)v109 logHandle];
        uint64_t v112 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
        if ((unint64_t)(v112 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v113 = v112;
          if (os_signpost_enabled(v111))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v111, OS_SIGNPOST_INTERVAL_END, v113, "VMUProcessObjectGraph", "", buf, 2u);
          }
        }

        v109 = self->_stackLogReader;
      }
    }
    [(VMUGraphStackLogReader *)v109 endEvent:"VMUProcessObjectGraph"];
    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Node Labels] Count: %u  Uniqued string count: %u\n\n", [(VMUSymbolStore *)self->_symbolStore count], [(VMUSymbolStore *)self->_symbolStore uniquedStringCount]);
    }
  }
  else if (kVMUPrintArchivingTiming)
  {
    fwrite("[Node Labels] NO NODE LABELS\n\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
  }
  if (self->_autoreleasePoolOffsets)
  {
    v114 = self->_stackLogReader;
    if (v114)
    {
      uint64_t v115 = [(VMUGraphStackLogReader *)v114 signpostID];
      v114 = self->_stackLogReader;
      if (v115)
      {
        uint64_t v116 = [(VMUGraphStackLogReader *)v114 logHandle];
        uint64_t v117 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
        if ((unint64_t)(v117 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v118 = v117;
          if (os_signpost_enabled(v116))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v116, OS_SIGNPOST_INTERVAL_END, v118, "VMUProcessObjectGraph", "", buf, 2u);
          }
        }

        v114 = self->_stackLogReader;
      }
    }
    [(VMUGraphStackLogReader *)v114 endEvent:"VMUProcessObjectGraph"];
    [(VMUGraphStackLogReader *)self->_stackLogReader startWithCategory:"VMUProcessObjectGraph" message:"archiving userMarked"];
    v119 = self->_stackLogReader;
    if (v119)
    {
      v120 = [(VMUGraphStackLogReader *)v119 logHandle];
      uint64_t v121 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
      if ((unint64_t)(v121 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v122 = v121;
        if (os_signpost_enabled(v120))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v120, OS_SIGNPOST_INTERVAL_BEGIN, v122, "VMUProcessObjectGraph", "archiving userMarked", buf, 2u);
        }
      }
    }
    v123 = [*(id *)(v49 + 2760) _archivedBytes:length:options:];
    [v21 setObject:v123 forKeyedSubscript:@"userMarked"];

    uint64_t v124 = self->_stackLogReader;
    if (v124)
    {
      uint64_t v125 = [(VMUGraphStackLogReader *)v124 signpostID];
      uint64_t v124 = self->_stackLogReader;
      if (v125)
      {
        v126 = [(VMUGraphStackLogReader *)v124 logHandle];
        uint64_t v127 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
        if ((unint64_t)(v127 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v128 = v127;
          if (os_signpost_enabled(v126))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v126, OS_SIGNPOST_INTERVAL_END, v128, "VMUProcessObjectGraph", "", buf, 2u);
          }
        }

        uint64_t v124 = self->_stackLogReader;
      }
    }
    [(VMUGraphStackLogReader *)v124 endEvent:"VMUProcessObjectGraph"];
  }
  userMarked = self->_userMarked;
  if (userMarked)
  {
    v130 = [*(id *)(v49 + 2760) _archivedObject:userMarked options:a4];
    [v21 setObject:v130 forKeyedSubscript:@"stackLogReader"];
  }
  uint64_t v131 = *(void *)&self->_hasClassInfosDerivedFromStackBacktraces;
  if (v131)
  {
    v132 = [*(id *)(v49 + 2760) _archivedObject:v131 options:a4];
    [v21 setObject:v132 forKeyedSubscript:@"backtraces"];
  }
  backtraces = self->_backtraces;
  if (backtraces)
  {
    v134 = [*(id *)(v49 + 2760) _archivedObject:backtraces options:a4];
    [v21 setObject:v134 forKeyedSubscript:@"symbolStore"];
  }
  uint64_t v135 = [NSNumber numberWithUnsignedInt:-[VMUProcessObjectGraph idleExitStatus](self, "idleExitStatus")];
  [v21 setObject:v135 forKeyedSubscript:@"idleExitStatus"];

  [v21 setObject:self->_serializationOptions forKeyedSubscript:@"ledger"];
  [v6 setObject:v21 forKeyedSubscript:@"processGraphInfo"];
  v136 = self->_stackLogReader;
  if (v136)
  {
    uint64_t v137 = [(VMUGraphStackLogReader *)v136 signpostID];
    v136 = self->_stackLogReader;
    if (v137)
    {
      v138 = [(VMUGraphStackLogReader *)v136 logHandle];
      uint64_t v139 = [(VMUGraphStackLogReader *)self->_stackLogReader signpostID];
      if ((unint64_t)(v139 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v140 = v139;
        if (os_signpost_enabled(v138))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v138, OS_SIGNPOST_INTERVAL_END, v140, "VMUProcessObjectGraph", "", buf, 2u);
        }
      }

      v136 = self->_stackLogReader;
    }
  }
  [(VMUGraphStackLogReader *)v136 endEvent:"VMUProcessObjectGraph"];
}

uint64_t __65__VMUProcessObjectGraph_archiveDictionaryRepresentation_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 serialize64:[a2 unsignedLongLongValue]];
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v6 unsignedIntValue];

  return [v7 serialize32:v8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VMUProcessObjectGraph;
  id v4 = [(VMUObjectGraph *)&v9 copyWithZone:a3];
  *((_DWORD *)v4 + 49) = *(&self->super._referencingCount + 1);
  *((void *)v4 + 26) = self->_scanner;
  *((void *)v4 + 27) = *(void *)&self->_vmPageSize;
  objc_storeStrong((id *)v4 + 28, self->_machAbsolute);
  *((_DWORD *)v4 + 58) = self->_regions;
  objc_storeStrong((id *)v4 + 30, *(id *)&self->_regionCount);
  objc_storeStrong((id *)v4 + 31, self->_zoneNames);
  objc_storeStrong((id *)v4 + 32, self->_processName);
  objc_storeStrong((id *)v4 + 35, self->_executablePath);
  *((unsigned char *)v4 + 380) = BYTE4(self->_physicalFootprintPeak);
  *((unsigned char *)v4 + 381) = BYTE5(self->_physicalFootprintPeak);
  objc_storeStrong((id *)v4 + 36, self->_binaryImagesDescription);
  objc_storeStrong((id *)v4 + 37, self->_threadNameRanges);
  objc_storeStrong((id *)v4 + 38, self->_binarySectionNameRanges);
  objc_storeStrong((id *)v4 + 40, *(id *)&self->_gotObjcClassStructureRanges);
  objc_storeStrong((id *)v4 + 41, self->_pthreadOffsets);
  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (autoreleasePoolOffsets)
  {
    size_t v6 = ((LODWORD(autoreleasePoolOffsets->super.isa) + 7) >> 3) + 4;
    v7 = malloc_type_malloc(v6, 0x37C10B9BuLL);
    memcpy(v7, autoreleasePoolOffsets, v6);
  }
  else
  {
    v7 = 0;
  }
  *((void *)v4 + 42) = v7;
  objc_storeStrong((id *)v4 + 43, self->_userMarked);
  objc_storeStrong((id *)v4 + 49, *(id *)&self->_objectContentLevel);
  *((_DWORD *)v4 + 96) = self->_idleExitStatus;
  *((_DWORD *)v4 + 97) = *(_DWORD *)&self->_showsPhysFootprint;
  objc_storeStrong((id *)v4 + 51, *(id *)&self->_hasClassInfosDerivedFromStackBacktraces);
  objc_storeStrong((id *)v4 + 52, self->_backtraces);
  objc_storeStrong((id *)v4 + 53, self->_symbolStore);
  *((_DWORD *)v4 + 94) = self->_physicalFootprintPeak;
  objc_storeStrong((id *)v4 + 56, self->_serializationOptions);
  return v4;
}

- (void)setThreadName:(id)a3 forRange:(_VMURange)a4
{
}

- (id)threadNameForAddress:(unint64_t)a3
{
  return (id)[(NSString *)self->_binaryImagesDescription stringForAddress:a3];
}

- (void)setBinarySectionName:(id)a3 forRange:(_VMURange)a4
{
}

- (id)binarySectionNameForAddress:(unint64_t)a3
{
  backtraces = self->_backtraces;
  if (backtraces
    && ([(NSArray *)backtraces symbolicator], (CSIsNull() & 1) == 0)
    && ([(NSArray *)self->_backtraces symbolicator],
        CSSymbolicatorGetSectionWithAddressAtTime(),
        (uint64_t Name = CSRegionGetName()) != 0))
  {
    v7 = [NSString stringWithUTF8String:Name];
  }
  else
  {
    v7 = [(VMURangeToStringMap *)self->_threadNameRanges stringForAddress:a3];
  }

  return v7;
}

- (_VMURange)binarySectionRangeContainingAddress:(unint64_t)a3
{
  backtraces = self->_backtraces;
  if (!backtraces
    || ([(NSArray *)backtraces symbolicator], (CSIsNull() & 1) != 0)
    || ([(NSArray *)self->_backtraces symbolicator],
        CSSymbolicatorGetSectionWithAddressAtTime(),
        (CSIsNull() & 1) != 0)
    || (unint64_t Range = CSRegionGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t Range = [(VMURangeToStringMap *)self->_threadNameRanges rangeContainingAddress:a3];
  }
  result.length = v7;
  result.location = Range;
  return result;
}

- (void)_deriveObjcClassStructureRanges
{
  if (!LOBYTE(self->_regionSymbolNameRanges))
  {
    unint64_t v3 = +[VMUClassInfo sizeofClassStructure];
    id v4 = [(VMUProcessObjectGraph *)self realizedClasses];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__VMUProcessObjectGraph__deriveObjcClassStructureRanges__block_invoke;
    v5[3] = &unk_1E5D24FF8;
    v5[4] = self;
    v5[5] = v3;
    [v4 enumerateInfosWithBlock:v5];

    LOBYTE(self->_regionSymbolNameRanges) = 1;
  }
}

void __56__VMUProcessObjectGraph__deriveObjcClassStructureRanges__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v11 = v5;
    BOOL v6 = ([v5 infoType] & 9) == 0;
    id v5 = v11;
    if (!v6)
    {
      unint64_t v7 = (void *)MEMORY[0x1AD0D9F90](v11);
      uint64_t v8 = NSString;
      objc_super v9 = [v11 className];
      uint64_t v10 = [v8 stringWithFormat:@"OBJC_CLASS_$_%@", v9];

      [*(id *)(*(void *)(a1 + 32) + 304) setString:v10 forRange:a2];
      id v5 = v11;
    }
  }
}

- (void)setRegionSymbolName:(id)a3 forRange:(_VMURange)a4
{
}

- (id)regionSymbolNameForAddress:(unint64_t)a3
{
  if (!LOBYTE(self->_regionSymbolNameRanges)) {
    [(VMUProcessObjectGraph *)self _deriveObjcClassStructureRanges];
  }
  backtraces = self->_backtraces;
  if (backtraces
    && ([(NSArray *)backtraces symbolicator], (CSIsNull() & 1) == 0)
    && ([(NSArray *)self->_backtraces symbolicator],
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        (uint64_t Name = CSSymbolGetName()) != 0))
  {
    unint64_t v7 = [NSString stringWithUTF8String:Name];
  }
  else
  {
    unint64_t v7 = [(VMURangeToStringMap *)self->_binarySectionNameRanges stringForAddress:a3];
  }

  return v7;
}

- (_VMURange)regionSymbolRangeContainingAddress:(unint64_t)a3
{
  if (!LOBYTE(self->_regionSymbolNameRanges)) {
    [(VMUProcessObjectGraph *)self _deriveObjcClassStructureRanges];
  }
  backtraces = self->_backtraces;
  if (!backtraces
    || ([(NSArray *)backtraces symbolicator], (CSIsNull() & 1) != 0)
    || ([(NSArray *)self->_backtraces symbolicator],
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        (CSIsNull() & 1) != 0)
    || (unint64_t Range = CSSymbolGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t Range = [(VMURangeToStringMap *)self->_binarySectionNameRanges rangeContainingAddress:a3];
  }
  result.length = v7;
  result.location = Range;
  return result;
}

- (_VMURange)rangeForSymbolName:(id)a3 inRegion:(id)a4
{
  id v6 = a3;
  unint64_t v7 = a4;
  uint64_t v8 = v7;
  unint64_t v9 = 0;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 && v7)
  {
    backtraces = self->_backtraces;
    if (!backtraces
      || ([(NSArray *)backtraces symbolicator], (CSIsNull() & 1) != 0)
      || ([(NSArray *)self->_backtraces symbolicator],
          CSSymbolicatorGetSymbolWithAddressAtTime(),
          (CSIsNull() & 1) != 0)
      || (id v12 = (const char *)[v6 UTF8String],
          uint64_t Name = (const char *)CSSymbolGetName(),
          strcmp(v12, Name))
      || (uint64_t Range = CSSymbolGetRange(), Range == 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t Range = [(VMURangeToStringMap *)self->_binarySectionNameRanges rangeForString:v6 startingAtAddress:v8[1]];
    }
    uint64_t v10 = Range;
    unint64_t v9 = v15;
  }

  unint64_t v16 = v10;
  unint64_t v17 = v9;
  result.length = v17;
  result.location = v16;
  return result;
}

- (unsigned)enumerateReferencesFromDataRegion:(id)a3 atGlobalSymbol:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke;
  v15[3] = &unk_1E5D25048;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  uint64_t v19 = &v20;
  [(VMUObjectGraph *)self enumerateObjectsWithBlock:v15];
  LODWORD(self) = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&v20, 8);
  return self;
}

void __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke(uint64_t a1, uint64_t a2, long long *a3, unsigned char *a4)
{
  if (*((void *)a3 + 1) >> 60 == 2)
  {
    id v8 = [*(id *)(a1 + 32) vmuVMRegionForNode:a2];
    id v9 = [v8 type];
    if ([v9 hasPrefix:@"__DATA"])
    {
      id v10 = [v8 path];
      id v11 = [v10 lastPathComponent];
      int v12 = [v11 isEqualToString:*(void *)(a1 + 40)];

      if (v12)
      {
        uint64_t v13 = [*(id *)(a1 + 32) rangeForSymbolName:*(void *)(a1 + 48) inRegion:v8];
        uint64_t v14 = *(void **)(a1 + 32);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke_2;
        v18[3] = &unk_1E5D25020;
        long long v21 = *a3;
        uint64_t v22 = *((void *)a3 + 2);
        uint64_t v23 = v13;
        uint64_t v24 = v15;
        id v16 = *(id *)(a1 + 56);
        uint64_t v17 = *(void *)(a1 + 64);
        id v19 = v16;
        uint64_t v20 = v17;
        [v14 enumerateReferencesOfNode:a2 withBlock:v18];
        if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
          *a4 = 1;
        }
      }
    }
    else
    {
    }
  }
}

void *__84__VMUProcessObjectGraph_enumerateReferencesFromDataRegion_atGlobalSymbol_withBlock___block_invoke_2(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  id v6 = result;
  if (*(void *)(a5 + 8) + result[6] - result[9] >= result[10])
  {
    if (*(_DWORD *)(*(void *)(result[5] + 8) + 24)) {
      *a6 = 1;
    }
  }
  else
  {
    uint64_t v7 = result[4];
    id v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _OWORD *))(v6[4] + 16);
    long long v9 = *(_OWORD *)(a5 + 16);
    v10[0] = *(_OWORD *)a5;
    v10[1] = v9;
    uint64_t v11 = *(void *)(a5 + 32);
    _VMURange result = (void *)v8(v7, a2, a3, a4, v10);
    ++*(_DWORD *)(*(void *)(v6[5] + 8) + 24);
  }
  return result;
}

- (unsigned)nodeReferencedFromDataRegion:(id)a3 byGlobalSymbol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = -1;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__VMUProcessObjectGraph_nodeReferencedFromDataRegion_byGlobalSymbol___block_invoke;
  v9[3] = &unk_1E5D25070;
  v9[4] = &v10;
  [(VMUProcessObjectGraph *)self enumerateReferencesFromDataRegion:v6 atGlobalSymbol:v7 withBlock:v9];
  LODWORD(self) = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);

  return self;
}

uint64_t __69__VMUProcessObjectGraph_nodeReferencedFromDataRegion_byGlobalSymbol___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a4;
  return result;
}

- (void)setLabel:(id)a3 forNode:(unsigned int)a4
{
}

- (id)labelForNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (([(VMUProcessObjectGraph *)self objectContentLevelForNodeLabels] & 0xFFFFFFFE) == 2)
  {
    id v5 = [(VMUSymbolStore *)self->_symbolStore stringForNode:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)hasLabelsForNodes
{
  return [(VMUSymbolStore *)self->_symbolStore count] != 0;
}

- (void)contentForNode:(unsigned int)a3
{
  return 0;
}

- (id)shortLabelForNode:(unsigned int)a3
{
  uint64_t v3 = [(VMUProcessObjectGraph *)self labelForNode:*(void *)&a3];
  if (v3)
  {
    id v4 = v3;
    id v5 = shortenString(v3);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (VMUClassInfoMap)realizedClasses
{
  v4.receiver = self;
  v4.super_class = (Class)VMUProcessObjectGraph;
  v2 = [(VMUObjectGraph *)&v4 indexedClassInfos];

  return (VMUClassInfoMap *)v2;
}

- (unsigned)zoneCount
{
  return [*(id *)&self->_regionCount count];
}

- (id)zoneNameForIndex:(unsigned int)a3
{
  if ([*(id *)&self->_regionCount count] <= (unint64_t)a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [*(id *)&self->_regionCount objectAtIndex:a3];
  }

  return v5;
}

- (unsigned)enumerateRegionsWithBlock:(id)a3
{
  objc_super v4 = (void (**)(id, void *, unsigned char *))a3;
  char v9 = 0;
  if (LODWORD(self->_regions))
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = [self->_machAbsolute objectAtIndexedSubscript:v5];
      v4[2](v4, v6, &v9);
    }
    while (++v5 < (unint64_t)LODWORD(self->_regions) && v9 == 0);
  }
  else
  {
    LODWORD(v5) = 0;
  }

  return v5;
}

- (void)_reorderLabelsWithNodeNameMap:(unsigned int *)a3
{
  uint64_t v5 = (VMUSymbolStore *)objc_opt_new();
  unsigned int v6 = [(VMUDirectedGraph *)self nodeNamespaceSize];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v6;
    do
    {
      if (a3[v7] != -1)
      {
        char v9 = [(VMUSymbolStore *)self->_symbolStore stringForNode:v7];
        [(VMUSymbolStore *)v5 setString:v9 forNode:a3[v7]];
      }
      ++v7;
    }
    while (v8 != v7);
  }
  symbolStore = self->_symbolStore;
  self->_symbolStore = v5;
}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  -[VMUProcessObjectGraph _reorderLabelsWithNodeNameMap:](self, "_reorderLabelsWithNodeNameMap:");
  if (self->_autoreleasePoolOffsets)
  {
    long long v21 = a5;
    uint64_t v11 = (NSDictionary *)malloc_type_calloc(1uLL, ((v8 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    unsigned int v20 = v8;
    LODWORD(v11->super.isa) = v8;
    autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    uint64_t v24 = __80__VMUProcessObjectGraph__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace___block_invoke;
    v25 = &__block_descriptor_48_e8_v12__0I8l;
    id v19 = v11;
    uint64_t v26 = v11;
    v27 = a3;
    int v13 = v23;
    unsigned int isa = autoreleasePoolOffsets->super.isa;
    if (LODWORD(autoreleasePoolOffsets->super.isa))
    {
      uint64_t v15 = 0;
      do
      {
        id v16 = (char *)autoreleasePoolOffsets + (v15 >> 3);
        unsigned int v17 = v16[4];
        uint64_t v18 = v15;
        if (v16[4])
        {
          do
          {
            if (v17) {
              v24((uint64_t)v13, v18);
            }
            if (v17 < 2) {
              break;
            }
            uint64_t v18 = (v18 + 1);
            v17 >>= 1;
          }
          while (v18 < isa);
        }
        uint64_t v15 = (v15 + 8);
      }
      while (v15 < isa);
    }

    free(self->_autoreleasePoolOffsets);
    self->_autoreleasePoolOffsets = v19;
    uint64_t v6 = v6;
    a5 = v21;
    uint64_t v8 = v20;
  }
  v22.receiver = self;
  v22.super_class = (Class)VMUProcessObjectGraph;
  -[VMUObjectGraph _renameWithNodeMap:nodeNamespace:edgeMap:edgeNamespace:](&v22, sel__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace_, a3, v8, a5, v6, v19);
}

uint64_t __80__VMUProcessObjectGraph__renameWithNodeMap_nodeNamespace_edgeMap_edgeNamespace___block_invoke(uint64_t result, unsigned int a2)
{
  v2 = *(_DWORD **)(result + 32);
  unint64_t v3 = *(unsigned int *)(*(void *)(result + 40) + 4 * a2);
  if (*v2 > v3) {
    *((unsigned char *)v2 + (v3 >> 3) + 4) |= 1 << (v3 & 7);
  }
  return result;
}

- (void)copyUserMarked
{
  autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
  if (!autoreleasePoolOffsets) {
    return 0;
  }
  size_t v3 = ((LODWORD(autoreleasePoolOffsets->super.isa) + 7) >> 3) + 4;
  objc_super v4 = malloc_type_malloc(v3, 0x37C10B9BuLL);
  memcpy(v4, autoreleasePoolOffsets, v3);
  return v4;
}

- (void)setUserMarked:(void *)a3
{
  if (a3)
  {
    autoreleasePoolOffsets = self->_autoreleasePoolOffsets;
    if (autoreleasePoolOffsets) {
      free(autoreleasePoolOffsets);
    }
    size_t v6 = ((*(_DWORD *)a3 + 7) >> 3) + 4;
    uint64_t v7 = (NSDictionary *)malloc_type_malloc(v6, 0x37C10B9BuLL);
    memcpy(v7, a3, v6);
    self->_autoreleasePoolOffsets = v7;
  }
}

- (NSString)processDescriptionString
{
  if (self->_processName) {
    return self->_processName;
  }
  else {
    return (NSString *)@"< process and analysis tool header unavailable >\n";
  }
}

- (void)setProcessDescriptionString:(id)a3
{
  objc_super v4 = (NSString *)[a3 copy];
  processuint64_t Name = self->_processName;
  self->_processuint64_t Name = v4;
}

- (NSString)binaryImagesDescription
{
  if (self->_executablePath) {
    return self->_executablePath;
  }
  else {
    return (NSString *)@"< binary images list unavailable >\n";
  }
}

- (void)setBinaryImagesDescription:(id)a3
{
  objc_super v4 = (NSString *)[a3 copy];
  executablePath = self->_executablePath;
  self->_executablePath = v4;
}

- (NSString)processName
{
  if (self->_zoneNames) {
    return (NSString *)self->_zoneNames;
  }
  else {
    return (NSString *)@"Unknown";
  }
}

- (void)setProcessName:(id)a3
{
  objc_super v4 = (NSArray *)[a3 copy];
  zoneNames = self->_zoneNames;
  self->_zoneNames = v4;
}

- (BOOL)is64bit
{
  if (!LODWORD(self->_regions)) {
    return 1;
  }
  v2 = [self->_machAbsolute lastObject];
  BOOL v3 = v2[1] > 0x100000000uLL;

  return v3;
}

- (void)setStackLogReader:(id)a3
{
}

- (id)sampleBacktracesString
{
  if (*(void *)&self->_hasClassInfosDerivedFromStackBacktraces
    && (backtraces = self->_backtraces) != 0
    && ([(NSArray *)backtraces symbolicator], (CSIsNull() & 1) == 0))
  {
    uint64_t v5 = [[VMUFakeSampler alloc] initWithProcessObjectGraph:self];
    uint64_t v6 = *(void *)&self->_hasClassInfosDerivedFromStackBacktraces;
    uint64_t v7 = [(NSArray *)self->_backtraces symbolicator];
    char v9 = +[VMUCallTreeNode rootForSamples:symbolicator:sampler:options:](VMUCallTreeNode, "rootForSamples:symbolicator:sampler:options:", v6, v7, v8, v5, 0);
    uint64_t v10 = [v9 fullOutputWithThreshold:5];
    objc_super v4 = (void *)[(NSString *)self->_processName mutableCopy];
    [v4 appendString:v10];
    [v4 appendFormat:@"\n%@", self->_executablePath];
  }
  else
  {
    objc_super v4 = 0;
  }

  return v4;
}

- (unint64_t)ledgerValueForKey:(id)a3 keyExists:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [(VMUProcessObjectGraph *)self ledger];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

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

- (id)_descriptionForRegionAddress:(unint64_t)a3 withOffset:(unint64_t)a4 showSegment:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v8 = a4 + a3;
  unint64_t v9 = [(VMUProcessObjectGraph *)self binarySectionNameForAddress:a4 + a3];
  uint64_t v10 = [(VMUProcessObjectGraph *)self binarySectionRangeContainingAddress:v8];
  uint64_t v11 = [(VMUProcessObjectGraph *)self regionSymbolNameForAddress:v8];
  unint64_t v12 = [(VMUProcessObjectGraph *)self regionSymbolRangeContainingAddress:v8];
  unint64_t v13 = v12;
  uint64_t v14 = &stru_1EFE27F38;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v8 > v12)
  {
    [NSString stringWithFormat:@" + %llu", v8 - v12];
    uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!v9)
  {
    if (v11)
    {
      if ([v11 isEqualToString:@"<PTHREAD_T>"])
      {
        unint64_t v15 = v8 - v13;
        if (v8 <= v13)
        {
          uint64_t v23 = 0;
          goto LABEL_30;
        }
        id v16 = [*(id *)&self->_gotObjcClassStructureRanges objectForKeyedSubscript:@"FirstTLSslotKey"];
        unint64_t v17 = [v16 unsignedLongLongValue] + v13;

        uint64_t v18 = [*(id *)&self->_gotObjcClassStructureRanges objectForKeyedSubscript:@"LastTLSslotKey"];
        uint64_t v19 = [v18 unsignedLongLongValue];

        if (v8 >= v17 && v8 <= v19 + v13)
        {
          unsigned int v28 = [(VMUDirectedGraph *)self pointerSize];
          uint64_t v29 = [[kVMUThreadSpecificDataKeyString stringByAppendingFormat:@" %llu", (v8 - v17) / v28];
LABEL_29:
          uint64_t v23 = (__CFString *)v29;
LABEL_30:
          unint64_t v9 = 0;
          goto LABEL_31;
        }
        long long v21 = [*(id *)&self->_gotObjcClassStructureRanges objectForKeyedSubscript:@"StartRoutineArgumentOffsetKey"];
        uint64_t v22 = [v21 unsignedLongLongValue];

        if (v15 == v22)
        {
          unint64_t v9 = 0;
          uint64_t v23 = @"pthread start routine argument";
          goto LABEL_31;
        }
        [NSString stringWithFormat:@"pthread_t structure %+4lld", v15, v30];
      }
      else
      {
        [NSString stringWithFormat:@"%@%@", v11, v14];
      }
    }
    else
    {
      uint64_t v26 = "";
      if (v5) {
        uint64_t v26 = "region ";
      }
      [NSString stringWithFormat:@"%s+ %llu", v26, a4];
    uint64_t v29 = };
    goto LABEL_29;
  }
  if (v11)
  {
    if (v5) {
      [NSString stringWithFormat:@"%@: '%@'%@", v9, v11, v14];
    }
    else {
      [NSString stringWithFormat:@"%@%@", v11, v14, v31];
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v24 = [v9 rangeOfString:@" "];
      if (v24)
      {
        uint64_t v25 = [v9 substringFromIndex:v24 + 1];

        unint64_t v9 = (void *)v25;
      }
    }
    [NSString stringWithFormat:@"%@ + %llu", v9, v8 - v10, v31];
  }
  uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v23;
}

- (id)vmuVMRegionForAddress:(unint64_t)a3
{
  BOOL v5 = (void *)[self->_machAbsolute count];
  if (v5)
  {
    unint64_t v6 = (unint64_t)v5;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v18 = a3;
    while (1)
    {
      unint64_t v9 = v8 + (v6 >> 1);
      if (v9 >= [self->_machAbsolute count])
      {
        if (v7 == [self->_machAbsolute count] - 1) {
          goto LABEL_13;
        }
        --v9;
      }
      unint64_t v19 = v9;
      unint64_t v10 = v9;
      do
      {
        uint64_t v11 = [self->_machAbsolute objectAtIndexedSubscript:v10];
        char v12 = v11[132];

        ++v10;
      }
      while ((v12 & 1) != 0);
      unint64_t v13 = [self->_machAbsolute objectAtIndexedSubscript:v10 - 1];
      unint64_t v14 = [v13 range];
      unint64_t v16 = v15;

      if (v18 - v14 < v16) {
        break;
      }
      if (v18 < v14)
      {
        v6 >>= 1;
      }
      else
      {
        uint64_t v8 = v10;
        v6 += ~(v6 >> 1);
      }
      unint64_t v7 = v19;
      if (!v6)
      {
LABEL_13:
        BOOL v5 = 0;
        goto LABEL_15;
      }
    }
    BOOL v5 = [self->_machAbsolute objectAtIndexedSubscript:v10 - 1];
  }
LABEL_15:

  return v5;
}

- (id)vmuVMRegionForNode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VMUDirectedGraph *)self nodeNamespaceSize] <= a3)
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    [(VMUObjectGraph *)self nodeDetails:v3];
    BOOL v5 = [(VMUProcessObjectGraph *)self vmuVMRegionForAddress:v7];
  }

  return v5;
}

- (id)shortNodeDescription:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VMUDirectedGraph *)self nodeNamespaceSize] <= a3
    || ([(VMUObjectGraph *)self nodeDetails:v3], !VMUGraphNodeType_IsVMRegion(0)))
  {
    unint64_t v13 = 0;
    goto LABEL_13;
  }
  BOOL v5 = [(VMUProcessObjectGraph *)self vmuVMRegionForNode:v3];
  unint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 path];
    int v8 = [v7 hasPrefix:@"/"];

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28E78] string];
      unint64_t v10 = [v6 path];
      uint64_t v11 = [v10 lastPathComponent];
      [(__CFString *)v9 appendFormat:@"%@ ", v11];

      char v12 = [v6 type];
      [(__CFString *)v9 appendString:v12];
    }
    else
    {
      if (![v6 isStack])
      {
        uint64_t v9 = [v6 type];
        goto LABEL_12;
      }
      unint64_t v14 = NSString;
      char v12 = [v6 path];
      uint64_t v9 = [v14 stringWithFormat:@"Stack %@", v12];
    }
  }
  else
  {
    uint64_t v9 = @"Unknown";
  }
LABEL_12:
  unint64_t v13 = [NSString stringWithFormat:@"VM: %@", v9];

LABEL_13:

  return v13;
}

- (id)nodeDescription:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VMUDirectedGraph *)self nodeNamespaceSize] <= a3)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = [(VMUProcessObjectGraph *)self nodeDescription:v3 withOffset:0 showLabel:1];
  }

  return v5;
}

- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4
{
  return [(VMUProcessObjectGraph *)self nodeDescription:*(void *)&a3 withOffset:a4 showLabel:1];
}

- (id)nodeDescription:(unsigned int)a3 withOffset:(unint64_t)a4 showLabel:(BOOL)a5
{
  uint64_t v6 = *(void *)&a3;
  if ([(VMUDirectedGraph *)self nodeNamespaceSize] <= a3)
  {
    uint64_t v9 = 0;
  }
  else
  {
    int v8 = (void *)MEMORY[0x1AD0D9F90]();
    [(VMUObjectGraph *)self nodeDetails:v6];
    if (VMUGraphNodeType_IsVMRegion(0))
    {
      unint64_t v10 = NSString;
      uint64_t v11 = +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:](VMUVMRegionIdentifier, "descriptionForRange:inSortedRegions:options:", a4, 1, self->_machAbsolute, 513);
      uint64_t v9 = [v10 stringWithFormat:@"VM: %@", v11, v13];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (id)nodeDescription:(unsigned int)a3 withDestinationNode:(unsigned int)a4 referenceInfo:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if ([(VMUDirectedGraph *)self nodeNamespaceSize] <= a3)
  {
    char v12 = 0;
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    [(VMUObjectGraph *)self nodeDetails:v7];
    if (VMUGraphNodeType_IsVMRegion(0))
    {
      uint64_t v9 = +[VMUVMRegionIdentifier descriptionForRange:inSortedRegions:options:](VMUVMRegionIdentifier, "descriptionForRange:inSortedRegions:options:", a5->var0 + v18, 1, self->_machAbsolute, 8193);
      if ([v9 hasPrefix:@"__DATA "])
      {
        uint64_t v10 = [v9 substringFromIndex:7];

        uint64_t v9 = (void *)v10;
      }
      uint64_t v11 = [NSString stringWithFormat:@"Region %@", v9];
    }
    else
    {
      uint64_t v11 = [(VMUProcessObjectGraph *)self nodeDescription:v7];
    }
    long long v16 = *(_OWORD *)&a5->var0;
    unint64_t var2 = a5->var2;
    uint64_t v13 = [(VMUProcessObjectGraph *)self _detailedNodeOffsetDescription:&v16 withSourceNode:v7 destinationNode:v6 alignmentSpacing:0];
    char v12 = [v11 stringByAppendingFormat:@" %@", v13];

    if (a5->var2)
    {
      uint64_t v14 = [v12 stringByAppendingFormat:@" --> offset %llu", a5->var2];

      char v12 = (void *)v14;
    }
  }

  return v12;
}

- (id)nodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  if ([(VMUDirectedGraph *)self nodeNamespaceSize] <= a4)
  {
    uint64_t v9 = 0;
    goto LABEL_16;
  }
  [(VMUObjectGraph *)self nodeDetails:v6];
  if (VMUGraphNodeType_IsVMRegion(0))
  {
    uint64_t v9 = [(VMUProcessObjectGraph *)self _descriptionForRegionAddress:0 withOffset:a3->var0 showSegment:0];
    goto LABEL_16;
  }
  uint64_t v10 = [0 ivarName];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = [0 fullIvarNameAtOffset:LODWORD(a3->var0) - [0 offset]];
  }
  else
  {
    uint64_t v13 = [0 genericInfo];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      unint64_t var0 = a3->var0;
      unsigned int v16 = [0 instanceSize];

      if (var0 < v16)
      {
        [(VMUObjectGraph *)self nodeDetails:v5];
        unint64_t v17 = [0 className];
        int v18 = [v17 containsString:@"BlockVariable"];
        uint64_t v19 = @"[capture]";
        if (v18) {
          uint64_t v19 = @"__block [capture]";
        }
        uint64_t v9 = v19;

        goto LABEL_15;
      }
    }
    uint64_t v12 = [NSString stringWithFormat:@"+%llu bytes", a3->var0];
  }
  uint64_t v9 = (__CFString *)v12;
LABEL_15:

LABEL_16:

  return v9;
}

- (id)_detailedNodeOffsetDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(VMUDirectedGraph *)self nodeNamespaceSize] <= a4)
  {
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  [(VMUObjectGraph *)self nodeDetails:v8];
  uint64_t v11 = [MEMORY[0x1E4F28E78] stringWithCapacity:200];
  __s[0] = 0;
  if (VMUGraphNodeType_IsVMRegion(0))
  {
    uint64_t v12 = [(VMUProcessObjectGraph *)self _descriptionForRegionAddress:0 withOffset:a3->var0 showSegment:1];
    [v11 appendString:v12];
  }
  else
  {
    uint64_t v14 = VMUScanTypeKeywordDescription(a3->var1);
    unint64_t v15 = "";
    if (v14 && *v14) {
      unint64_t v15 = " ";
    }
    [v11 appendFormat:@"%+6lld: %s%s", a3->var0, v14, v15];
    uint64_t v12 = 0;
    unsigned int v16 = [0 ivarName];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      [0 fullIvarNameAtOffset:LODWORD(a3->var0) - [0 offset]];
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      [0 instanceSize];
      goto LABEL_12;
    }
    uint64_t v24 = [0 genericInfo];
    if (v24)
    {
      uint64_t v25 = (void *)v24;
      unint64_t var0 = a3->var0;
      unsigned int v27 = [0 instanceSize];

      if (var0 < v27)
      {
        *(void *)__str = 0;
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        [(VMUObjectGraph *)self nodeDetails:v7];
        unsigned int v28 = [0 className];
        int v29 = [v28 containsString:@"BlockVariable"];
        uint64_t v30 = @"[capture]";
        if (v29) {
          uint64_t v30 = @"__block [capture]";
        }
        uint64_t v13 = v30;

        goto LABEL_12;
      }
    }
  }
  uint64_t v13 = &stru_1EFE27F38;
LABEL_12:

  snprintf(__str, 0x20uLL, "%#llx", a3->var0);
  int v18 = [v11 length];
  int v19 = strlen(__str);
  unsigned int v20 = v19 + [(__CFString *)v13 length] + strlen(__s) + v18;
  unsigned int v21 = a6 - v20;
  if (a6 < v20) {
    unsigned int v21 = 0;
  }
  if (v20 >= a6) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v21;
  }
  [v11 appendFormat:@"%@%s%*s%s", v13, __s, v22, "", __str];

LABEL_18:

  return v11;
}

- (id)referenceDescription:(id *)a3 withSourceNode:(unsigned int)a4 destinationNode:(unsigned int)a5 alignmentSpacing:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  if ([(VMUDirectedGraph *)self nodeNamespaceSize] <= a4
    || [(VMUDirectedGraph *)self nodeNamespaceSize] <= v7)
  {
    uint64_t v14 = 0;
  }
  else
  {
    long long v16 = *(_OWORD *)&a3->var0;
    unint64_t var2 = a3->var2;
    uint64_t v11 = [(VMUProcessObjectGraph *)self _detailedNodeOffsetDescription:&v16 withSourceNode:v8 destinationNode:v7 alignmentSpacing:v6];
    uint64_t v12 = [(VMUProcessObjectGraph *)self nodeDescription:v7];
    if (a3->var2)
    {
      uint64_t v13 = [NSString stringWithFormat:@"%lld bytes into %@", a3->var2, v12];

      uint64_t v12 = (void *)v13;
    }
    uint64_t v14 = [v11 stringByAppendingFormat:@" --> %@", v12];
  }

  return v14;
}

- (void)refineTypesWithOverlay:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VMUProcessObjectGraph;
  [(VMUObjectGraph *)&v3 _refineTypesWithOverlay:a3];
}

- (void)refineEdges:(unsigned int)a3 withOptions:(unsigned int)a4 markingInvalid:(void *)a5
{
  char v6 = a4;
  if ([(VMUProcessObjectGraph *)self is64bit]) {
    uint64_t v9 = 7;
  }
  else {
    uint64_t v9 = 3;
  }
  if (v6)
  {
    unsigned int v11 = [(VMUDirectedGraph *)self nodeNamespaceSize];
    uint64_t v10 = malloc_type_calloc(1uLL, ((v11 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    _DWORD *v10 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  int v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  int v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke;
  v13[3] = &unk_1E5D250B8;
  v13[4] = self;
  v13[5] = v16;
  BOOL v15 = (v6 & 2) == 0;
  v13[8] = v9;
  v13[9] = a5;
  v13[6] = v18;
  v13[7] = v22;
  unsigned int v14 = a3;
  v13[10] = v10;
  [(VMUDirectedGraph *)self _internalAccessRawEdgesWithBlock:v13];
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke_2;
    v12[3] = &unk_1E5D250E0;
    v12[7] = v10;
    v12[8] = a5;
    v12[4] = self;
    v12[5] = v18;
    v12[6] = v20;
    [(VMUDirectedGraph *)self _internalAccessRawEdgesWithBlock:v12];
    free(v10);
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
}

void *__64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke(void *result, unsigned int *a2, unsigned int a3)
{
  if (a3)
  {
    objc_super v4 = result;
    uint64_t v5 = a3;
    do
    {
      if (*a2 <= 0xFFFFFFFA)
      {
        ++*(_DWORD *)(*(void *)(v4[5] + 8) + 24);
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        _VMURange result = (void *)v4[4];
        if (result) {
          _VMURange result = (void *)[result _rawReferenceInfoWithName:*a2];
        }
        if (!*((unsigned char *)v4 + 92) && (v4[8] & v12) != 0)
        {
          char v6 = (_DWORD *)v4[9];
          unint64_t v7 = *a2;
          if (*v6 > v7) {
            *((unsigned char *)v6 + (v7 >> 3) + 4) |= 1 << (v7 & 7);
          }
          ++*(_DWORD *)(*(void *)(v4[6] + 8) + 24);
          ++*(_DWORD *)(*(void *)(v4[7] + 8) + 24);
        }
        if (((*((_DWORD *)v4 + 22) >> v13) & 1) == 0)
        {
          uint64_t v8 = (_DWORD *)v4[9];
          unint64_t v9 = *a2;
          if (*v8 > v9) {
            *((unsigned char *)v8 + (v9 >> 3) + 4) |= 1 << (v9 & 7);
          }
          ++*(_DWORD *)(*(void *)(v4[6] + 8) + 24);
        }
        uint64_t v10 = (_DWORD *)v4[10];
        if (v10)
        {
          if (!v14)
          {
            unint64_t v11 = a2[2];
            if (a2[1] != v11 && *v10 > v11) {
              *((unsigned char *)v10 + (v11 >> 3) + 4) |= 1 << (v11 & 7);
            }
          }
        }
      }
      a2 += 3;
      --v5;
    }
    while (v5);
  }
  return result;
}

void *__64__VMUProcessObjectGraph_refineEdges_withOptions_markingInvalid___block_invoke_2(void *result, unsigned int *a2, unsigned int a3)
{
  if (a3)
  {
    objc_super v4 = result;
    uint64_t v5 = a3;
    do
    {
      if (*a2 <= 0xFFFFFFFA)
      {
        char v6 = (_DWORD *)v4[7];
        unint64_t v7 = a2[2];
        if (*v6 > v7 && ((*((unsigned __int8 *)v6 + (v7 >> 3) + 4) >> (v7 & 7)) & 1) != 0)
        {
          uint64_t v10 = 0;
          uint64_t v11 = 0;
          uint64_t v12 = 0;
          _VMURange result = (void *)v4[4];
          if (result)
          {
            _VMURange result = [result _rawReferenceInfoWithName];
            if (v12)
            {
              uint64_t v8 = (_DWORD *)v4[8];
              unint64_t v9 = *a2;
              if (*v8 > v9) {
                *((unsigned char *)v8 + (v9 >> 3) + 4) |= 1 << (v9 & 7);
              }
              ++*(_DWORD *)(*(void *)(v4[5] + 8) + 24);
              ++*(_DWORD *)(*(void *)(v4[6] + 8) + 24);
            }
          }
        }
      }
      a2 += 3;
      --v5;
    }
    while (v5);
  }
  return result;
}

- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4
{
}

- (void)markReachableNodesFromRoots:(void *)a3 inMap:(void *)a4 options:(unsigned int)a5
{
  char v53 = a5;
  [(VMUObjectGraph *)self internalizeNodes];
  uint64_t v65 = 0;
  unint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  int v68 = 0;
  size_t v8 = 4 * [(VMUDirectedGraph *)self nodeNamespaceSize];
  unint64_t v9 = (unsigned int *)malloc_type_malloc(v8, 0x100004052888210uLL);
  os_signpost_id_t v50 = a4;
  __pattern4[0] = -1;
  memset_pattern4(v9, __pattern4, v8);
  v52 = self;
  unsigned int v10 = [(VMUDirectedGraph *)self nodeNamespaceSize];
  uint64_t v11 = malloc_type_calloc(1uLL, ((v10 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *uint64_t v11 = v10;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke;
  v64[3] = &unk_1E5D23748;
  v51 = v9;
  v64[4] = &v65;
  v64[5] = v9;
  v64[6] = v11;
  uint64_t v12 = (void (**)(id, void))(id)MEMORY[0x1AD0DA230](v64);
  unsigned int v13 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    unsigned int v14 = 0;
    int v15 = 1;
    do
    {
      long long v16 = (char *)a3 + (v14 >> 3);
      unsigned int v17 = v16[4];
      unsigned int v18 = v15;
      if (v16[4])
      {
        do
        {
          if (v17) {
            v12[2](v12, v18 - 1);
          }
          if (v17 < 2) {
            break;
          }
          v17 >>= 1;
          BOOL v19 = v18++ >= v13;
        }
        while (!v19);
      }
      v14 += 8;
      v15 += 8;
    }
    while (v14 < v13);
  }

  unsigned int v20 = v66 + 3;
  int v21 = *((_DWORD *)v66 + 6);
  uint64_t v22 = v51;
  int v23 = v52;
  if (v21)
  {
    char v24 = 1;
    do
    {
      int v25 = v21 - 1;
      _DWORD *v20 = v25;
      uint64_t v26 = v22[v25];
      BOOL v27 = (v53 & 2) != 0
         && [(VMUProcessObjectGraph *)v23 nodeIsAutoreleasePoolContentPage:v22[v25]];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_2;
      v60[3] = &unk_1E5D25108;
      v60[4] = v23;
      v62 = v11;
      BOOL v63 = v27;
      unsigned int v28 = v12;
      id v61 = v28;
      [(VMUDirectedGraph *)v23 _internalEnumerateEdgesOfNode:v26 withBlock:v60];
      if (((*((_DWORD *)v66 + 6) == 0) & v24) == 1)
      {
        size_t v29 = ((*v11 + 7) >> 3) + 4;
        uint64_t v30 = (int *)malloc_type_malloc(v29, 0x37C10B9BuLL);
        memcpy(v30, v11, v29);
        int v31 = *v30;
        unint64_t v32 = (*v30 + 7);
        if (v32 >= 8)
        {
          uint64_t v33 = v30 + 1;
          uint64_t v34 = v32 >> 3;
          if (v32 >> 3 <= 1) {
            uint64_t v34 = 1;
          }
          do
          {
            unsigned char *v33 = ~*v33;
            ++v33;
            --v34;
          }
          while (v34);
        }
        uint64_t v35 = v11;
        int v36 = v31 & 7;
        if (v36) {
          *((unsigned char *)v30 + (v32 >> 3) + 3) ^= -1 << v36;
        }
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        unsigned int v55 = __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_3;
        v56 = &unk_1E5D25130;
        uint64_t v57 = v23;
        char v59 = v53 & 1;
        uint64_t v58 = v28;
        uint64_t v37 = v54;
        unsigned int v38 = *v30;
        if (*v30)
        {
          unsigned int v39 = 0;
          int v40 = 1;
          do
          {
            v41 = (char *)v30 + (v39 >> 3);
            unsigned int v42 = v41[4];
            unsigned int v43 = v40;
            if (v41[4])
            {
              do
              {
                if (v42) {
                  v55((uint64_t)v37, v43 - 1);
                }
                if (v42 < 2) {
                  break;
                }
                v42 >>= 1;
                BOOL v19 = v43++ >= v38;
              }
              while (!v19);
            }
            v39 += 8;
            v40 += 8;
          }
          while (v39 < v38);
        }

        free(v30);
        char v24 = 0;
        uint64_t v22 = v51;
        int v23 = v52;
        uint64_t v11 = v35;
      }

      unsigned int v20 = v66 + 3;
      int v21 = *((_DWORD *)v66 + 6);
    }
    while (v21);
  }
  int v44 = *v50;
  if (*v50 >= *v11) {
    int v44 = *v11;
  }
  unint64_t v45 = (v44 + 7);
  if (v45 >= 8)
  {
    uint64_t v46 = (char *)(v11 + 1);
    v47 = v50 + 1;
    unint64_t v48 = v45 >> 3;
    do
    {
      char v49 = *v46++;
      *v47++ |= v49;
      --v48;
    }
    while (v48);
  }
  if (v22) {
    free(v22);
  }
  free(v11);

  _Block_object_dispose(&v65, 8);
}

void *__67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke(void *result, unsigned int a2)
{
  uint64_t v2 = result[5];
  uint64_t v3 = *(void *)(result[4] + 8);
  uint64_t v4 = *(unsigned int *)(v3 + 24);
  *(_DWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  uint64_t v5 = (unsigned int *)result[6];
  if (*v5 > a2) {
    *((unsigned char *)v5 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
  }
  return result;
}

uint64_t __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = VMUIsOwningReference([*(id *)(a1 + 32) scanTypeOfReferenceWithName:a2]);
  if (result)
  {
    unint64_t v9 = *(_DWORD **)(a1 + 48);
    if (*v9 <= a6 || ((*((unsigned __int8 *)v9 + (a6 >> 3) + 4) >> (a6 & 7)) & 1) == 0)
    {
      if (!*(unsigned char *)(a1 + 56)
        || (uint64_t result = [*(id *)(a1 + 32) nodeIsAutoreleasePoolContentPage:a6], result))
      {
        unsigned int v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
        return v10();
      }
    }
  }
  return result;
}

uint64_t __67__VMUProcessObjectGraph_markReachableNodesFromRoots_inMap_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    uint64_t result = [(id)result nodeDetails:a2];
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t result = VMUGraphNodeType_IsVMRegion(0);
    if (result) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  return result;
}

- (id)leakedNodesGraph
{
  unsigned int v3 = [(VMUDirectedGraph *)self nodeNamespaceSize];
  uint64_t v4 = malloc_type_calloc(1uLL, ((v3 + 7) >> 3) + 4, 0xFF42C4F3uLL);
  _DWORD *v4 = v3;
  uint64_t v5 = VMUCreateRootNodeMarkingMap(self);
  [(VMUProcessObjectGraph *)self markReachableNodesFromRoots:v5 inMap:v4 options:0];
  int v6 = *v4;
  unint64_t v7 = (*v4 + 7);
  if (v7 >= 8)
  {
    size_t v8 = v4 + 1;
    uint64_t v9 = v7 >> 3;
    if (v7 >> 3 <= 1) {
      uint64_t v9 = 1;
    }
    do
    {
      unsigned char *v8 = ~*v8;
      ++v8;
      --v9;
    }
    while (v9);
  }
  int v10 = v6 & 7;
  if (v10) {
    *((unsigned char *)v4 + (v7 >> 3) + 3) ^= -1 << v10;
  }
  uint64_t v11 = [(VMUDirectedGraph *)self subgraphWithMarkedNodes:v4];
  free(v4);
  free(v5);

  return v11;
}

- (BOOL)nodeIsAutoreleasePoolContentPage:(unsigned int)a3
{
  long long v7 = 0uLL;
  uint64_t v8 = 0;
  [(VMUObjectGraph *)self nodeDetails:*(void *)&a3];
  long long v5 = v7;
  uint64_t v6 = v8;
  return [(VMUProcessObjectGraph *)self nodeDetailIsAutoreleasePoolContentPage:&v5];
}

- ($938B03310D06493B2963E5A84CB75A7E)autoreleasePoolOffsets
{
  unsigned int v3 = [(NSDictionary *)self->_pthreadOffsets objectForKeyedSubscript:@"parentPageOffset"];
  unsigned int v4 = [v3 intValue];
  long long v5 = [(NSDictionary *)self->_pthreadOffsets objectForKeyedSubscript:@"childPageOffset"];
  uint64_t v6 = [v5 intValue];
  long long v7 = [(NSDictionary *)self->_pthreadOffsets objectForKeyedSubscript:@"firstEntryOffset"];
  unsigned int v8 = [v7 intValue];

  unint64_t v9 = v4 | (unint64_t)(v6 << 32);
  unsigned int v10 = v8;
  result.unint64_t var0 = v9;
  result.var1 = HIDWORD(v9);
  result.unint64_t var2 = v10;
  return result;
}

- (BOOL)nodeDetailIsAutoreleasePoolContentPage:(id)a3
{
  if (*(void *)(a3.var0 + 8) >> 60 != 1) {
    return 0;
  }
  unsigned int v4 = [*(id *)(a3.var0 + 16) className];
  char v5 = [v4 isEqualToString:@"@autoreleasepool content"];

  return v5;
}

- (void)removeWeakEdges
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke;
  v2[3] = &unk_1E5D25180;
  v2[4] = self;
  [(VMUDirectedGraph *)self withEdgeMarkingMap:v2];
}

uint64_t __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__VMUProcessObjectGraph_removeWeakEdges__block_invoke_2;
  v6[3] = &unk_1E5D25158;
  v6[4] = v4;
  v6[5] = a2;
  [v4 enumerateEdgesWithBlock:v6];
  return [*(id *)(a1 + 32) removeMarkedEdges:a2];
}

void *__40__VMUProcessObjectGraph_removeWeakEdges__block_invoke_2(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  $938B03310D06493B2963E5A84CB75A7E result = *(void **)(a1 + 32);
  if (!result
    || (($938B03310D06493B2963E5A84CB75A7E result = (void *)[result referenceInfoWithName:a2], (v8 - 1) <= 1)
      ? (BOOL v5 = v9 == 0)
      : (BOOL v5 = 0),
        !v5))
  {
    uint64_t v6 = *(unsigned int **)(a1 + 40);
    if (*v6 > v2) {
      *((unsigned char *)v6 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
    }
  }
  return result;
}

- (void)markRootNodes:(void *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__VMUProcessObjectGraph_markRootNodes___block_invoke;
  v3[3] = &__block_descriptor_40_e25_v44__0I8___Qb60b4__12_B36l;
  v3[4] = a3;
  [(VMUObjectGraph *)self enumerateObjectsWithBlock:v3];
}

BOOL __39__VMUProcessObjectGraph_markRootNodes___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  BOOL result = VMUGraphNodeType_IsRoot(*(void *)(a3 + 8) >> 60);
  if (result)
  {
    uint64_t v6 = *(unsigned int **)(a1 + 32);
    if (*v6 > a2) {
      *((unsigned char *)v6 + (a2 >> 3) + 4) |= 1 << (a2 & 7);
    }
  }
  return result;
}

- (void)markLeafNodes:(void *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__VMUProcessObjectGraph_markLeafNodes___block_invoke;
  v3[3] = &unk_1E5D251D0;
  v3[4] = self;
  void v3[5] = a3;
  [(VMUObjectGraph *)self enumerateObjectsWithBlock:v3];
}

void __39__VMUProcessObjectGraph_markLeafNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = a2;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  unsigned int v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__VMUProcessObjectGraph_markLeafNodes___block_invoke_2;
  v6[3] = &unk_1E5D251A8;
  v6[4] = &v7;
  [v4 enumerateEdgesOfNode:a2 withBlock:v6];
  if (!*((_DWORD *)v8 + 6))
  {
    BOOL v5 = *(unsigned int **)(a1 + 40);
    if (*v5 > v2) {
      *((unsigned char *)v5 + (v2 >> 3) + 4) |= 1 << (v2 & 7);
    }
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __39__VMUProcessObjectGraph_markLeafNodes___block_invoke_2(uint64_t result)
{
  return result;
}

- (void)resymbolicatePrivateMaps
{
  [(VMUSymbolStore *)self->_symbolStore resymbolicateObjectDescriptionStringsWithGraph:self];
  binarySectionNameRanges = self->_binarySectionNameRanges;
  uint64_t v4 = [(NSArray *)self->_backtraces symbolicator];
  -[VMURangeToStringMap resymbolicateStringsWithSymbolicator:](binarySectionNameRanges, "resymbolicateStringsWithSymbolicator:", v4, v5);

  [(VMUProcessObjectGraph *)self resymbolicateNonObjectsUsingStackBacktrace];
}

- (void)resymbolicateNonObjectsUsingStackBacktrace
{
  userMarked = self->_userMarked;
  if (userMarked)
  {
    uint64_t v4 = [(VMUObjectGraph *)self indexedClassInfos];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__VMUProcessObjectGraph_resymbolicateNonObjectsUsingStackBacktrace__block_invoke;
    v7[3] = &unk_1E5D231C0;
    v7[4] = self;
    [userMarked identifyNonObjectsUsingStackBacktraces:self classInfoMap:v4 classInfoSetterBlock:v7];

    uint64_t v5 = [(VMUObjectGraph *)self indexedClassInfos];
    v6.receiver = self;
    v6.super_class = (Class)VMUProcessObjectGraph;
    [(VMUObjectGraph *)&v6 setIndexedClassInfos:v5];
  }
}

id __67__VMUProcessObjectGraph_resymbolicateNonObjectsUsingStackBacktrace__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VMUProcessObjectGraph;
  return [super setClassInfoIndex:a3 forNode:a2];
}

- (BOOL)resymbolicateWithDsymPath:(id)a3 libraryNames:(id)a4 all:(BOOL)a5 progress:(id)a6 showDebugInfo:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  backtraces = self->_backtraces;
  if (!backtraces)
  {
    [(VMUProcessObjectGraph *)self _generateSymbolStoreFromExistingGraph];
    backtraces = self->_backtraces;
  }
  char v18 = [(NSArray *)backtraces resymbolicateWithDsymPath:v14 libraryNames:v15 all:v11 progress:v16 showDebugInfo:v9 error:a8];

  return v18;
}

- (_CSArchitecture)parseMacOSArchitectureFromProcessDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  processuint64_t Name = self->_processName;
  objc_super v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  uint64_t v5 = [(NSString *)processName componentsSeparatedByCharactersInSet:v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 hasPrefix:@"Code Type"])
        {
          if ([v11 containsString:@"X86-64"])
          {
            _CSArchitecture v12 = (_CSArchitecture)0x301000007;
            goto LABEL_19;
          }
          if ([v11 containsString:@"ARM64E"])
          {
            _CSArchitecture v12 = (_CSArchitecture)0x20100000CLL;
            goto LABEL_19;
          }
          if ([v11 containsString:@"ARM64"])
          {
            unsigned int v13 = +[VMUProcessDescription parseBinaryImagesDescription:self->_executablePath];
            id v14 = [v13 objectAtIndexedSubscript:0];
            id v15 = [v14 objectForKeyedSubscript:@"ExecutablePath"];

            _CSArchitecture v12 = (_CSArchitecture)0x20100000CLL;
            if (([v15 hasPrefix:@"/System"] & 1) == 0
              && ![v15 hasPrefix:@"/usr"])
            {
              _CSArchitecture v12 = (_CSArchitecture)16777228;
            }

            goto LABEL_19;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  _CSArchitecture v12 = 0;
LABEL_19:

  return v12;
}

- (void)parseAddressesFromNodeLabelsIntoSymbolStore
{
  symbolStore = self->_symbolStore;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__VMUProcessObjectGraph_parseAddressesFromNodeLabelsIntoSymbolStore__block_invoke;
  v3[3] = &unk_1E5D251F8;
  v3[4] = self;
  [(VMUSymbolStore *)symbolStore enumerateHexAddressesInStrings:v3];
}

uint64_t __68__VMUProcessObjectGraph_parseAddressesFromNodeLabelsIntoSymbolStore__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) addAddress:a2 origin:4];
}

- (void)_generateSymbolStoreFromExistingGraph
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[VMUProcessDescription symbolicatorFromBinaryImagesDescription:self->_executablePath withArchitecture:[(VMUProcessObjectGraph *)self parseMacOSArchitectureFromProcessDescription]];
  uint64_t v5 = -[VMUSymbolStore initWithSymbolicator:debugTimer:]([VMUSymbolStore alloc], "initWithSymbolicator:debugTimer:", v3, v4, 0);
  p_backtraces = &self->_backtraces;
  objc_storeStrong((id *)&self->_backtraces, v5);
  [(NSArray *)self->_backtraces setGraph:self];
  binarySectionNameRanges = self->_binarySectionNameRanges;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke;
  void v20[3] = &unk_1E5D251F8;
  v20[4] = self;
  [(VMURangeToStringMap *)binarySectionNameRanges enumerateHexAddressesInStrings:v20];
  [(VMUProcessObjectGraph *)self parseAddressesFromNodeLabelsIntoSymbolStore];
  userMarked = self->_userMarked;
  if (userMarked)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke_2;
    v19[3] = &unk_1E5D251F8;
    v19[4] = self;
    [userMarked enumerateUniquingTable:v19];
  }
  uint64_t v9 = *(void **)&self->_hasClassInfosDerivedFromStackBacktraces;
  if (v9)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          -[NSArray addBacktrace:origin:](*p_backtraces, "addBacktrace:origin:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), 0, (void)v15);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v12);
    }
  }
  CSRelease();
}

uint64_t __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) addAddress:a2 origin:2];
}

uint64_t __62__VMUProcessObjectGraph__generateSymbolStoreFromExistingGraph__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) addAddress:a2 origin:3];
}

- (int)pid
{
  return *(&self->super._referencingCount + 1);
}

- (VMUTaskMemoryScanner)scanner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pid);

  return (VMUTaskMemoryScanner *)WeakRetained;
}

- (void)setScanner:(id)a3
{
}

- (unsigned)vmPageSize
{
  return self->_scanner;
}

- (unsigned)kernelPageSize
{
  return HIDWORD(self->_scanner);
}

- (unsigned)regionCount
{
  return self->_regions;
}

- (unint64_t)snapshotMachTime
{
  return *(void *)&self->_vmPageSize;
}

- (void)setSnapshotMachTime:(unint64_t)a3
{
  *(void *)&self->_vmPageSize = a3;
}

- (VMUDebugTimer)debugTimer
{
  return (VMUDebugTimer *)self->_stackLogReader;
}

- (void)setDebugTimer:(id)a3
{
}

- (VMUStackLogReader)stackLogReader
{
  return (VMUStackLogReader *)self->_userMarked;
}

- (BOOL)showRawClassNames
{
  return BYTE1(self->_regionSymbolNameRanges);
}

- (void)setShowRawClassNames:(BOOL)a3
{
  BYTE1(self->_regionSymbolNameRanges) = a3;
}

- (unint64_t)physicalFootprint
{
  return (unint64_t)self->_debugTimer;
}

- (void)setPhysicalFootprint:(unint64_t)a3
{
  self->_debugTimer = (VMUDebugTimer *)a3;
}

- (unint64_t)physicalFootprintPeak
{
  return self->_physicalFootprint;
}

- (void)setPhysicalFootprintPeak:(unint64_t)a3
{
  self->_physicalFootprint = a3;
}

- (BOOL)isTranslatedByRosetta
{
  return (BOOL)self->_processDescriptionString;
}

- (void)setIsTranslatedByRosetta:(BOOL)a3
{
  LOBYTE(self->_processDescriptionString) = a3;
}

- (NSString)executablePath
{
  return *(NSString **)&self->_isTranslatedByRosetta;
}

- (BOOL)showsPhysFootprint
{
  return BYTE4(self->_physicalFootprintPeak);
}

- (void)setShowsPhysFootprint:(BOOL)a3
{
  BYTE4(self->_physicalFootprintPeak) = a3;
}

- (unsigned)objectContentLevel
{
  return self->_idleExitStatus;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_idleExitStatus = a3;
}

- (NSDictionary)srcAddressToExtraAutoreleaseCountDict
{
  return *(NSDictionary **)&self->_objectContentLevel;
}

- (void)setSrcAddressToExtraAutoreleaseCountDict:(id)a3
{
}

- (NSArray)backtraces
{
  return *(NSArray **)&self->_hasClassInfosDerivedFromStackBacktraces;
}

- (void)setBacktraces:(id)a3
{
}

- (VMUSymbolStore)symbolStore
{
  return (VMUSymbolStore *)self->_backtraces;
}

- (void)setSymbolStore:(id)a3
{
}

- (VMUNodeToStringMap)nodeLabels
{
  return (VMUNodeToStringMap *)self->_symbolStore;
}

- (_VMURange)dyldSharedCacheRange
{
  p_ledger = &self->_ledger;
  ledger = self->_ledger;
  unint64_t v4 = (unint64_t)p_ledger[1];
  result.length = v4;
  result.location = (unint64_t)ledger;
  return result;
}

- (void)setDyldSharedCacheRange:(_VMURange)a3
{
  *(_VMURange *)&self->_ledger = a3;
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  return (BOOL)self->_srcAddressToExtraAutoreleaseCountDict;
}

- (NSDate)snapshotDate
{
  return (NSDate *)self->_nodeLabels;
}

- (void)setSnapshotDate:(id)a3
{
}

- (BOOL)didPhysFootprintDirtyAccounting
{
  return BYTE5(self->_physicalFootprintPeak);
}

- (void)setDidPhysFootprintDirtyAccounting:(BOOL)a3
{
  BYTE5(self->_physicalFootprintPeak) = a3;
}

- (unsigned)objectContentLevelForNodeLabels
{
  return *(_DWORD *)&self->_showsPhysFootprint;
}

- (void)setObjectContentLevelForNodeLabels:(unsigned int)a3
{
  *(_DWORD *)&self->_showsPhysFootprint = a3;
}

- (unint64_t)serializationOptions
{
  return (unint64_t)self->_snapshotDate;
}

- (void)setSerializationOptions:(unint64_t)a3
{
  self->_snapshotDate = (NSDate *)a3;
}

- (NSDictionary)ledger
{
  return (NSDictionary *)self->_serializationOptions;
}

- (void)setLedger:(id)a3
{
}

- (unsigned)idleExitStatus
{
  return self->_physicalFootprintPeak;
}

- (void)setIdleExitStatus:(unsigned int)a3
{
  LODWORD(self->_physicalFootprintPeak) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializationOptions, 0);
  objc_storeStrong((id *)&self->_nodeLabels, 0);
  objc_storeStrong((id *)&self->_symbolStore, 0);
  objc_storeStrong((id *)&self->_backtraces, 0);
  objc_storeStrong((id *)&self->_hasClassInfosDerivedFromStackBacktraces, 0);
  objc_storeStrong((id *)&self->_objectContentLevel, 0);
  objc_storeStrong((id *)&self->_stackLogReader, 0);
  objc_storeStrong(&self->_userMarked, 0);
  objc_storeStrong((id *)&self->_pthreadOffsets, 0);
  objc_storeStrong((id *)&self->_gotObjcClassStructureRanges, 0);
  objc_storeStrong((id *)&self->_binarySectionNameRanges, 0);
  objc_storeStrong((id *)&self->_threadNameRanges, 0);
  objc_storeStrong((id *)&self->_binaryImagesDescription, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_isTranslatedByRosetta, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_regionCount, 0);
  objc_storeStrong((id *)&self->_machAbsolute, 0);

  objc_destroyWeak((id *)&self->_pid);
}

@end