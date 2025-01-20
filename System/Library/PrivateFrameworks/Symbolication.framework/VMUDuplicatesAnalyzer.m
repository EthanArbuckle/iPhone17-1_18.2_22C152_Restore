@interface VMUDuplicatesAnalyzer
- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 block:(id)a5;
- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 fieldBlock:(id)a5;
- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 block:(id)a6;
- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 fieldBlock:(id)a6;
- (BOOL)fullStacks;
- (BOOL)invertCallTrees;
- (BOOL)quiet;
- (BOOL)showCallTrees;
- (BOOL)showRawClassNames;
- (BOOL)showStacks;
- (BOOL)stringsOnly;
- (const)analyzerName;
- (id)_analysisSummaryWithGraphOrScanner:(id)a3;
- (id)analysisSummaryWithError:(id *)a3;
- (unint64_t)minimumLabelCount;
- (unsigned)objectContentLevel;
- (void)fullAnalysisWithBlock:(id)a3;
- (void)setFullStacks:(BOOL)a3;
- (void)setInvertCallTrees:(BOOL)a3;
- (void)setMinimumLabelCount:(unint64_t)a3;
- (void)setObjectContentLevel:(unsigned int)a3;
- (void)setQuiet:(BOOL)a3;
- (void)setShowCallTrees:(BOOL)a3;
- (void)setShowRawClassNames:(BOOL)a3;
- (void)setShowStacks:(BOOL)a3;
- (void)setStringsOnly:(BOOL)a3;
- (void)summaryWithGraph:(id)a3 block:(id)a4;
@end

@implementation VMUDuplicatesAnalyzer

- (const)analyzerName
{
  return "DUPLICATE OBJECTS";
}

- (id)_analysisSummaryWithGraphOrScanner:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  v6 = objc_opt_new();
  debugTimer = self->super._debugTimer;
  if (debugTimer)
  {
    uint64_t v8 = [(VMUDebugTimer *)debugTimer signpostID];
    debugTimer = self->super._debugTimer;
    if (v8)
    {
      v9 = [(VMUDebugTimer *)debugTimer logHandle];
      unint64_t v10 = [(VMUDebugTimer *)self->super._debugTimer signpostID];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v9, OS_SIGNPOST_INTERVAL_END, v11, "VMUDuplicatesAnalyzer", "", buf, 2u);
        }
      }

      debugTimer = self->super._debugTimer;
    }
  }
  [(VMUDebugTimer *)debugTimer endEvent:"VMUDuplicatesAnalyzer"];
  [(VMUDebugTimer *)self->super._debugTimer startWithCategory:"VMUDuplicatesAnalyzer" message:"Exctracting labels"];
  v12 = self->super._debugTimer;
  if (v12)
  {
    v13 = [(VMUDebugTimer *)v12 logHandle];
    unint64_t v14 = [(VMUDebugTimer *)self->super._debugTimer signpostID];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VMUDuplicatesAnalyzer", "Exctracting labels", buf, 2u);
      }
    }
  }
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __60__VMUDuplicatesAnalyzer__analysisSummaryWithGraphOrScanner___block_invoke;
  v77[3] = &unk_1E5D25F60;
  id v16 = v4;
  id v78 = v16;
  v79 = self;
  id v17 = v6;
  id v80 = v17;
  v62 = v16;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v16, v77);
  v18 = self->super._debugTimer;
  v63 = (void *)v5;
  if (v18)
  {
    uint64_t v19 = [(VMUDebugTimer *)v18 signpostID];
    v18 = self->super._debugTimer;
    if (v19)
    {
      v20 = [(VMUDebugTimer *)v18 logHandle];
      unint64_t v21 = [(VMUDebugTimer *)self->super._debugTimer signpostID];
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v22 = v21;
        if (os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v20, OS_SIGNPOST_INTERVAL_END, v22, "VMUDuplicatesAnalyzer", "", buf, 2u);
        }
      }

      v18 = self->super._debugTimer;
    }
  }
  [(VMUDebugTimer *)v18 endEvent:"VMUDuplicatesAnalyzer"];
  [(VMUDebugTimer *)self->super._debugTimer startWithCategory:"VMUDuplicatesAnalyzer" message:"Selecting labels that have duplicates"];
  v23 = self->super._debugTimer;
  if (v23)
  {
    v24 = [(VMUDebugTimer *)v23 logHandle];
    unint64_t v25 = [(VMUDebugTimer *)self->super._debugTimer signpostID];
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v26 = v25;
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VMUDuplicatesAnalyzer", "Selecting labels that have duplicates", buf, 2u);
      }
    }
  }
  v27 = objc_opt_new();
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  v28 = [v17 allKeys];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v74 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v73 + 1) + 8 * i);
        v34 = [v17 objectForKeyedSubscript:v33];
        if ((unint64_t)[v34 count] >= 2) {
          [v27 addObject:v33];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v30);
  }

  v35 = self->super._debugTimer;
  if (v35)
  {
    uint64_t v36 = [(VMUDebugTimer *)v35 signpostID];
    v35 = self->super._debugTimer;
    v37 = v63;
    if (v36)
    {
      v38 = [(VMUDebugTimer *)v35 logHandle];
      unint64_t v39 = [(VMUDebugTimer *)self->super._debugTimer signpostID];
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v40 = v39;
        if (os_signpost_enabled(v38))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v38, OS_SIGNPOST_INTERVAL_END, v40, "VMUDuplicatesAnalyzer", "", buf, 2u);
        }
      }

      v35 = self->super._debugTimer;
    }
  }
  else
  {
    v37 = v63;
  }
  [(VMUDebugTimer *)v35 endEvent:"VMUDuplicatesAnalyzer"];
  id v41 = v27;
  if ([v41 count])
  {
    long long v42 = 0uLL;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v70 = 0u;
    *(_OWORD *)buf = 0u;
    long long v69 = 0u;
    regionIdentifier = self->super._regionIdentifier;
    float v44 = 0.0;
    if (regionIdentifier)
    {
      [(VMUVMRegionIdentifier *)regionIdentifier summaryStatisticsOfAllZones];
      unint64_t v45 = *(void *)buf;
      if (*(void *)buf)
      {
        v46 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"Total allocations size" numericalValue:*(void *)buf objectValue:0 fieldType:2];
        [v37 addObject:v46];
        float v44 = (float)v45;

        char v47 = 0;
      }
      else
      {
        char v47 = 1;
      }
      long long v42 = 0uLL;
    }
    else
    {
      char v47 = 1;
    }
    long long v66 = v42;
    long long v67 = v42;
    long long v64 = v42;
    long long v65 = v42;
    id v50 = v41;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v64 objects:v81 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = 0;
      unint64_t v54 = 0;
      uint64_t v55 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v65 != v55) {
            objc_enumerationMutation(v50);
          }
          v57 = [v17 objectForKeyedSubscript:*(void *)(*((void *)&v64 + 1) + 8 * j)];
          v53 += [(NSMapTable *)v57 count];
          v54 += totalSizeOfRanges(v57);
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v64 objects:v81 count:16];
      }
      while (v52);
    }
    else
    {
      uint64_t v53 = 0;
      unint64_t v54 = 0;
    }

    v58 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"Duplicates total size" numericalValue:v54 objectValue:0 fieldType:2];
    v37 = v63;
    [v63 addObject:v58];
    if ((v47 & 1) == 0)
    {
      v59 = [NSString stringWithFormat:@"%2.1f", (float)((float)((float)v54 / v44) * 100.0)];
      v60 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"% of total allocations" numericalValue:0 objectValue:v59 fieldType:0];

      [v63 addObject:v60];
      v58 = v60;
    }
    v49 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"Duplicates count" numericalValue:v53 objectValue:0 fieldType:1];
  }
  else
  {
    v48 = [VMUAnalyzerSummaryField alloc];
    v49 = [(VMUAnalyzerSummaryField *)v48 initWithKey:kVMUAnalysisSummaryKey[0] numericalValue:0 objectValue:@"No duplicates detected" fieldType:0];
  }
  [v37 addObject:v49];

  return v37;
}

void __60__VMUDuplicatesAnalyzer__analysisSummaryWithGraphOrScanner___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 8) >> 60 == 1)
  {
    v6 = (void *)MEMORY[0x1AD0D9F90]();
    v7 = [*(id *)(a1 + 32) labelForNode:a2];
    if (v7)
    {
      uint64_t v8 = *(void **)(a3 + 16);
      if (*(unsigned char *)(*(void *)(a1 + 40) + 33)) {
        [v8 className];
      }
      else {
      v9 = [v8 displayName];
      }
      if (*(void *)(a3 + 16))
      {
        id v10 = [NSString stringWithFormat:@"%@  %@", v9, v7];
      }
      else
      {
        id v10 = v7;
      }
      os_signpost_id_t v11 = v10;
      v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v10];
      if (!v12)
      {
        v12 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:1282];
        [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v11];
      }
      NSMapInsert(v12, *(const void **)a3, (const void *)(*(void *)(a3 + 8) & 0xFFFFFFFFFFFFFFFLL));
    }
  }
}

- (id)analysisSummaryWithError:(id *)a3
{
  return [(VMUDuplicatesAnalyzer *)self _analysisSummaryWithGraphOrScanner:self->super._graph];
}

- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 fieldBlock:(id)a6
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v84 = (void (**)(id, void *))a6;
  id v10 = objc_opt_new();
  v79 = v9;
  if (v9)
  {
    id v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:258];
  }
  if ([v8 zoneCount])
  {
    uint64_t v11 = 0;
    do
    {
      v12 = objc_opt_new();
      v13 = [v8 zoneNameForIndex:v11];
      [v10 setObject:v12 forKeyedSubscript:v13];

      uint64_t v11 = (v11 + 1);
    }
    while (v11 < [v8 zoneCount]);
  }
  int v14 = VMULiteZoneIndex(v8);
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke;
  v110[3] = &unk_1E5D25F88;
  v110[4] = self;
  id v111 = v8;
  id v69 = v10;
  id v112 = v69;
  id v15 = v79;
  id v113 = v15;
  int v115 = v14;
  id v16 = (NSMapTable *)v9;
  v114 = v16;
  long long v67 = v111;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v111, v110);
  if (self->_minimumLabelCount > 1)
  {
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_2;
    v109[3] = &unk_1E5D25FB0;
    v109[4] = self;
    [v69 enumerateKeysAndObjectsUsingBlock:v109];
  }
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x2020000000;
  char v108 = 0;
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_3;
  v104[3] = &unk_1E5D25FD8;
  v104[4] = &v105;
  [v69 enumerateKeysAndObjectsUsingBlock:v104];
  int v68 = *((unsigned __int8 *)v106 + 24);
  if (*((unsigned char *)v106 + 24))
  {
    id v17 = [v69 allKeys];
    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_4;
    v102[3] = &unk_1E5D26000;
    id v73 = v69;
    id v103 = v73;
    v18 = [v17 sortedArrayUsingComparator:v102];

    if (v79
      && (![v15 usesLiteMode] || [v15 inspectingLiveProcess] == NO))
    {
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_5;
      v100[3] = &unk_1E5D237E8;
      v101 = v16;
      [v15 enumerateMSLRecordsAndPayloads:v100];
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    obuint64_t j = v18;
    uint64_t v19 = [obj countByEnumeratingWithState:&v96 objects:v118 count:16];
    if (v19)
    {
      v20 = 0;
      uint64_t v71 = v19;
      uint64_t v72 = *(void *)v97;
      do
      {
        for (uint64_t i = 0; i != v71; ++i)
        {
          if (*(void *)v97 != v72) {
            objc_enumerationMutation(obj);
          }
          unint64_t v21 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          os_signpost_id_t v22 = [VMUAnalyzerSummaryField alloc];
          v23 = [(VMUAnalyzerSummaryField *)v22 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"-----------------------------------------------------------------------" fieldType:0];

          v84[2](v84, v23);
          v24 = NSString;
          id v25 = v21;
          long long v74 = [v24 stringWithFormat:@"Zone %s\n", [v25 UTF8String]];
          os_signpost_id_t v26 = [VMUAnalyzerSummaryField alloc];
          v86 = [(VMUAnalyzerSummaryField *)v26 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:v74 fieldType:0];

          v84[2](v84, v86);
          v27 = [v73 objectForKeyedSubscript:v25];
          v28 = [v27 allKeys];
          v94[0] = MEMORY[0x1E4F143A8];
          v94[1] = 3221225472;
          v94[2] = __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_6;
          v94[3] = &unk_1E5D26000;
          id v80 = v27;
          id v95 = v80;
          uint64_t v29 = [v28 sortedArrayUsingComparator:v94];

          if (!v79)
          {
            uint64_t v30 = [VMUAnalyzerSummaryField alloc];
            uint64_t v31 = [(VMUAnalyzerSummaryField *)v30 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    COUNT     BYTES   AVERAGE   CONTENT" fieldType:0];

            v84[2](v84, v31);
            v32 = [VMUAnalyzerSummaryField alloc];
            v86 = [(VMUAnalyzerSummaryField *)v32 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    =====     =====   =======   =======" fieldType:0];

            v84[2](v84, v86);
          }
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v76 = v29;
          uint64_t v33 = [v76 countByEnumeratingWithState:&v90 objects:v117 count:16];
          if (v33)
          {
            uint64_t v78 = *(void *)v91;
            do
            {
              uint64_t v82 = v33;
              for (uint64_t j = 0; j != v82; ++j)
              {
                if (*(void *)v91 != v78) {
                  objc_enumerationMutation(v76);
                }
                uint64_t v35 = *(void *)(*((void *)&v90 + 1) + 8 * j);
                uint64_t v36 = [v80 objectForKeyedSubscript:v35];
                uint64_t v37 = [(NSMapTable *)v36 count];
                v38 = v36;
                unint64_t v39 = v37;
                table = v38;
                uint64_t v40 = totalSizeOfRanges(v38);
                *(float *)&double v41 = (float)(unint64_t)v40 / (float)v39;
                if (v79)
                {
                  if (v39 < 2) {
                    [NSString stringWithFormat:@"Instances: %lu   Bytes: %lu   %@", v41, v39, v40, v35];
                  }
                  else {
                  long long v42 = [NSString stringWithFormat:@"Instances: %lu   Total bytes: %lu   Average bytes: %.1f   %@", v39, v40, *(float *)&v41, v35, v67];
                  }
                  v43 = [VMUAnalyzerSummaryField alloc];
                  uint64_t v44 = [(VMUAnalyzerSummaryField *)v43 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v42 fieldType:0];

                  v84[2](v84, (void *)v44);
                  v86 = (VMUAnalyzerSummaryField *)v44;

                  context = (void *)MEMORY[0x1AD0D9F90]();
                  LODWORD(v44) = [v15 coldestFrameIsNotThreadId];
                  v48 = [VMUCallTreeRoot alloc];
                  if (v44) {
                    uint64_t v49 = 12;
                  }
                  else {
                    uint64_t v49 = 8;
                  }
                  id v50 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:](v48, "initWithSymbolicator:sampler:options:", a4._opaque_1, a4._opaque_2, 0, v49);
                  [(VMUCallTreeRoot *)v50 setStackLogReader:v15];
                  uint64_t v51 = objc_alloc_init(VMUBacktrace);
                  v51->_callstack.frames = v116;
                  v51->_flavor = 32;
                  memset(&enumerator, 0, sizeof(enumerator));
                  NSEnumerateMapTable(&enumerator, table);
                  unsigned int v52 = 0;
                  value = 0;
                  key = 0;
                  uint64_t v53 = -1;
                  while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
                  {
                    unint64_t v54 = NSMapGet(v16, key);
                    if ((void *)v53 != v54)
                    {
                      unsigned int v52 = [v15 getFramesForStackID:v54 stackFramesBuffer:v116];
                      uint64_t v53 = (uint64_t)v54;
                    }
                    if (v52)
                    {
                      if ([v15 coldestFrameIsNotThreadId])
                      {
                        LODWORD(v55) = 0;
                        unsigned int v56 = v52;
                      }
                      else
                      {
                        unsigned int v56 = v52 - 1;
                        uint64_t v55 = v116[v52 - 1];
                      }
                      v51->_callstack.context.thread = v55;
                      v51->_callstack.length = v56;
                      id v57 = [(VMUCallTreeRoot *)v50 addBacktrace:v51 count:1 numBytes:value];
                    }
                  }
                  NSEndMapTableEnumeration(&enumerator);
                  v51->_callstack.frames = 0;
                  [(VMUCallTreeRoot *)v50 allBacktracesHaveBeenAdded];
                  if (self->_invertCallTrees)
                  {
                    v58 = [(VMUCallTreeNode *)v50 invertedNode];
                  }
                  else
                  {
                    v58 = v50;
                  }
                  v59 = [(VMUCallTreeNode *)v58 stringFromCallTreeIndentIfNoBranches:1];
                  if ([v59 length])
                  {
                    v60 = "Inverted call tree:";
                    if (!self->_invertCallTrees) {
                      v60 = "Call tree:";
                    }
                    v61 = [NSString stringWithFormat:@"%s", v60];
                    v62 = [VMUAnalyzerSummaryField alloc];
                    v63 = [(VMUAnalyzerSummaryField *)v62 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:v61 fieldType:0];

                    v84[2](v84, v63);
                    long long v64 = [VMUAnalyzerSummaryField alloc];
                    v86 = [(VMUAnalyzerSummaryField *)v64 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v59 fieldType:0];

                    v84[2](v84, v86);
                  }
                }
                else
                {
                  unint64_t v45 = [NSString stringWithFormat:@"%9lu %9lu %9.1f   %@", v39, v40, *(float *)&v41, v35];
                  v46 = [VMUAnalyzerSummaryField alloc];
                  uint64_t v47 = [(VMUAnalyzerSummaryField *)v46 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v45 fieldType:0];

                  v84[2](v84, (void *)v47);
                  v86 = (VMUAnalyzerSummaryField *)v47;
                }
              }
              uint64_t v33 = [v76 countByEnumeratingWithState:&v90 objects:v117 count:16];
            }
            while (v33);
          }

          long long v65 = [VMUAnalyzerSummaryField alloc];
          v20 = [(VMUAnalyzerSummaryField *)v65 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:&stru_1EFE27F38 fieldType:0];

          v84[2](v84, v20);
        }
        uint64_t v71 = [obj countByEnumeratingWithState:&v96 objects:v118 count:16];
      }
      while (v71);
    }
  }
  _Block_object_dispose(&v105, 8);

  return v68 != 0;
}

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a3[1] >> 60 == 1)
  {
    id v8 = (void *)MEMORY[0x1AD0D9F90]();
    if (shouldGetLabelForObject((void *)a3[2], *(unsigned __int8 *)(*(void *)(a1 + 32) + 34)))
    {
      id v9 = [*(id *)(a1 + 40) zoneNameForIndex:*(unsigned int *)(a4 + 148)];
      id v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
      if ([*(id *)(a1 + 56) usesLiteMode]) {
        BOOL v11 = *(_DWORD *)(a4 + 148) != *(_DWORD *)(a1 + 72);
      }
      else {
        BOOL v11 = 1;
      }
      v12 = [*(id *)(a1 + 40) labelForNode:a2];
      if (v12)
      {
        v13 = (void *)a3[2];
        if (*(unsigned char *)(*(void *)(a1 + 32) + 33)) {
          [v13 className];
        }
        else {
        int v14 = [v13 displayName];
        }
        if (a3[2])
        {
          id v15 = [NSString stringWithFormat:@"%@  %@", v14, v12];
        }
        else
        {
          id v15 = v12;
        }
        id v16 = v15;
        id v17 = [v10 objectForKeyedSubscript:v15];
        if (!v17)
        {
          id v17 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:1282];
          [v10 setObject:v17 forKeyedSubscript:v16];
        }
        NSMapInsert(v17, (const void *)*a3, (const void *)(a3[1] & 0xFFFFFFFFFFFFFFFLL));
        if (*(void *)(a1 + 64))
        {
          if (([*(id *)(a1 + 56) inspectingLiveProcess] ^ 1 | v11))
          {
            uint64_t uniquing_table_index = -1;
          }
          else
          {
            [*(id *)(a1 + 56) liteMSLPayloadforMallocAddress:*a3 size:a3[1] & 0xFFFFFFFFFFFFFFFLL];
            uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
          }
          NSMapInsert(*(NSMapTable **)(a1 + 64), (const void *)*a3, (const void *)uniquing_table_index);
        }
      }
    }
  }
}

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        BOOL v11 = [v4 objectForKeyedSubscript:v10];
        if ((unint64_t)[v11 count] < *(void *)(*(void *)(a1 + 32) + 48)) {
          [v4 removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 objectForKeyedSubscript:a2];
  unint64_t v8 = [v7 count];

  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  unint64_t v10 = [v9 count];
  if (v8 <= v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v8 < v10) {
    return 1;
  }
  else {
    return v11;
  }
}

void __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_5(uint64_t a1, int a2, void *key)
{
  if (a2 == 2 && NSMapGet(*(NSMapTable **)(a1 + 32), key))
  {
    uint64_t uniquing_table_index = (const void *)msl_payload_get_uniquing_table_index();
    id v6 = *(NSMapTable **)(a1 + 32);
    NSMapInsert(v6, key, uniquing_table_index);
  }
}

uint64_t __86__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_fieldBlock___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  uint64_t v8 = [(NSMapTable *)v6 count];
  uint64_t v9 = [(NSMapTable *)v7 count] - v8;
  if (!v9)
  {
    uint64_t v10 = totalSizeOfRanges(v6);
    uint64_t v9 = totalSizeOfRanges(v7) - v10;
    if (!v9) {
      uint64_t v9 = [a2 compare:a3];
    }
  }

  return v9;
}

- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 fieldBlock:(id)a5
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *))a5;
  uint64_t v82 = objc_opt_new();
  uint64_t v11 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:259];
  long long v12 = objc_opt_new();
  int v13 = VMULiteZoneIndex(v8);
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke;
  v124[3] = &unk_1E5D25F88;
  id v14 = v9;
  int v130 = v13;
  id v125 = v14;
  long long v97 = self;
  v126 = self;
  id v127 = v8;
  id v79 = v12;
  id v128 = v79;
  long long v15 = v11;
  v129 = v15;
  id v80 = v127;
  VMUEnumerateVMAnnotatedMallocObjectsWithBlock(v127, v124);
  if (v14
    && (![v14 usesLiteMode] || [v14 inspectingLiveProcess] == NO))
  {
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_2;
    v122[3] = &unk_1E5D237E8;
    v123 = v15;
    [v14 enumerateMSLRecordsAndPayloads:v122];
  }
  v88 = v14;
  id v16 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:259];
  memset(&enumerator, 0, sizeof(enumerator));
  v81 = v15;
  NSEnumerateMapTable(&enumerator, v15);
  value = 0;
  if (NSNextMapEnumeratorPair(&enumerator, 0, &value))
  {
    *(int64x2_t *)context = vdupq_n_s64(1uLL);
    do
    {
      uint64_t v17 = (void *)MEMORY[0x1AD0D9F90]();
      uint64_t v18 = *((void *)value + 2);
      if (v18 != -1)
      {
        uint64_t v19 = [NSNumber numberWithUnsignedLongLong:*((void *)value + 2)];
        v20 = [(NSMapTable *)v16 objectForKey:v19];

        if (!v20)
        {
          v20 = (int64x2_t *)malloc_type_malloc(0x18uLL, 0x108004098BBCF0FuLL);
          v20->i64[0] = 0;
          v20->i64[1] = 0;
          unint64_t v21 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:2 valueOptions:259];
          [v82 addObject:v21];
          v20[1].i64[0] = (uint64_t)v21;
          NSMapInsertKnownAbsent(v16, (const void *)[NSNumber numberWithUnsignedLongLong:v18], v20);
        }
        v22.i64[1] = (uint64_t)context[1];
        v22.i64[0] = *(void *)value;
        v23 = (char *)value + 8;
        int64x2_t *v20 = vaddq_s64(*v20, v22);
        v24 = (int64x2_t *)[(id)v20[1].i64[0] objectForKey:*v23];
        if (!v24)
        {
          v24 = (int64x2_t *)malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
          v24->i64[0] = 0;
          v24->i64[1] = 0;
          NSMapInsertKnownAbsent((NSMapTable *)v20[1].i64[0], *((const void **)value + 1), v24);
        }
        int64x2_t v25 = vdupq_n_s64(1uLL);
        v25.i64[0] = *(void *)value;
        int64x2_t *v24 = vaddq_s64(*v24, v25);
      }
    }
    while (NSNextMapEnumeratorPair(&enumerator, 0, &value));
  }
  NSEndMapTableEnumeration(&enumerator);
  if (self->_minimumLabelCount >= 2)
  {
    v89 = (void *)MEMORY[0x1AD0D9F90]();
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    NSAllMapTableKeys(v16);
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v95 = [obj countByEnumeratingWithState:&v116 objects:v134 count:16];
    if (v95)
    {
      long long v93 = *(void **)v117;
      v84 = v16;
      do
      {
        for (uint64_t i = 0; i != v95; ++i)
        {
          if (*(void **)v117 != v93) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v116 + 1) + 8 * i);
          contexta = (void *)MEMORY[0x1AD0D9F90]();
          uint64_t v28 = [(NSMapTable *)v16 objectForKey:v27];
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          uint64_t v29 = NSAllMapTableKeys(*(NSMapTable **)(v28 + 16));
          uint64_t v30 = [v29 countByEnumeratingWithState:&v112 objects:v133 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v113;
            do
            {
              for (uint64_t j = 0; j != v31; ++j)
              {
                if (*(void *)v113 != v32) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v34 = *(void *)(*((void *)&v112 + 1) + 8 * j);
                uint64_t v35 = (void *)[*(id *)(v28 + 16) objectForKey:v34];
                unint64_t v36 = v35[1];
                if (v36 < v97->_minimumLabelCount)
                {
                  uint64_t v37 = *(void *)v28;
                  *(void *)(v28 + 8) -= v36;
                  *(void *)uint64_t v28 = v37 - *v35;
                  [*(id *)(v28 + 16) removeObjectForKey:v34];
                }
              }
              uint64_t v31 = [v29 countByEnumeratingWithState:&v112 objects:v133 count:16];
            }
            while (v31);
          }

          id v16 = v84;
          if (![*(id *)(v28 + 16) count]) {
            [(NSMapTable *)v84 removeObjectForKey:v27];
          }
        }
        uint64_t v95 = [obj countByEnumeratingWithState:&v116 objects:v134 count:16];
      }
      while (v95);
    }
  }
  uint64_t v38 = [(NSMapTable *)v16 count];
  unint64_t v39 = v88;
  uint64_t v40 = v81;
  if (v38)
  {
    double v41 = NSAllMapTableKeys(v16);
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_3;
    v110[3] = &unk_1E5D255F8;
    v87 = v16;
    id v111 = v87;
    long long v42 = [v41 sortedArrayUsingComparator:v110];

    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v83 = v42;
    long long v90 = (void *)[v83 countByEnumeratingWithState:&v106 objects:v132 count:16];
    if (v90)
    {
      uint64_t v78 = v38;
      v43 = 0;
      uint64_t v44 = (char *)(v10 + 2);
      unint64_t v45 = 0x1E5D22000uLL;
      v85 = v16;
      uint64_t v86 = *(void *)v107;
      contextb = v10;
      do
      {
        uint64_t v46 = 0;
        do
        {
          if (*(void *)v107 != v86) {
            objc_enumerationMutation(v83);
          }
          uint64_t v96 = v46;
          id obja = *(id *)(*((void *)&v106 + 1) + 8 * v46);
          v94 = (void *)MEMORY[0x1AD0D9F90]();
          uint64_t v47 = [(NSMapTable *)v87 objectForKey:obja];
          id v48 = objc_alloc(*(Class *)(v45 + 2680));
          uint64_t v49 = (void *)[v48 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    COUNT     BYTES   AVERAGE   CONTENT" fieldType:0];

          v10[2](v10, v49);
          id v50 = objc_alloc(*(Class *)(v45 + 2680));
          uint64_t v51 = (void *)[v50 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    =====     =====   =======   =======" fieldType:0];

          v10[2](v10, v51);
          if ((unint64_t)[*(id *)(v47 + 16) count] >= 2)
          {
            unsigned int v52 = [NSString stringWithFormat:@"%9lu %9lu %9.1f   %s", *(void *)(v47 + 8), *(void *)v47, (float)((float)*(unint64_t *)v47 / (float)*(unint64_t *)(v47 + 8)), "TOTAL FOR STACK"];
            id v53 = objc_alloc(*(Class *)(v45 + 2680));
            unint64_t v54 = (void *)[v53 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v52 fieldType:0];

            v10[2](v10, v54);
            id v55 = objc_alloc(*(Class *)(v45 + 2680));
            uint64_t v51 = (void *)[v55 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"    =====     =====   =======   =======" fieldType:0];

            v10[2](v10, v51);
          }
          unsigned int v56 = v44;
          unint64_t v57 = v45;
          v58 = NSAllMapTableKeys(*(NSMapTable **)(v47 + 16));
          v105[0] = MEMORY[0x1E4F143A8];
          v105[1] = 3221225472;
          v105[2] = __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_4;
          v105[3] = &__block_descriptor_40_e11_q24__0_8_16l;
          v105[4] = v47;
          v59 = [v58 sortedArrayUsingComparator:v105];

          long long v103 = 0u;
          long long v104 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          id v60 = v59;
          uint64_t v61 = [v60 countByEnumeratingWithState:&v101 objects:v131 count:16];
          if (v61)
          {
            uint64_t v62 = v61;
            uint64_t v63 = *(void *)v102;
            do
            {
              uint64_t v64 = 0;
              long long v65 = v51;
              do
              {
                if (*(void *)v102 != v63) {
                  objc_enumerationMutation(v60);
                }
                uint64_t v66 = *(void *)(*((void *)&v101 + 1) + 8 * v64);
                long long v67 = (void *)[*(id *)(v47 + 16) objectForKey:v66];
                int v68 = [NSString stringWithFormat:@"%9lu %9lu %9.1f   %@", v67[1], *v67, (float)((float)(unint64_t)*v67 / (float)(unint64_t)v67[1]), v66];
                id v69 = objc_alloc(*(Class *)(v57 + 2680));
                uint64_t v51 = (void *)[v69 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v68 fieldType:0];

                contextb[2](contextb, v51);
                ++v64;
                long long v65 = v51;
              }
              while (v62 != v64);
              uint64_t v62 = [v60 countByEnumeratingWithState:&v101 objects:v131 count:16];
            }
            while (v62);
          }

          unint64_t v45 = v57;
          id v70 = objc_alloc(*(Class *)(v57 + 2680));
          uint64_t v71 = (void *)[v70 initWithKey:kVMUAnalysisHeaderKey[0] numericalValue:0 objectValue:@"======" fieldType:0];

          uint64_t v10 = contextb;
          uint64_t v44 = v56;
          contextb[2](contextb, v71);
          uint64_t v72 = [v88 symbolicatedBacktraceForStackID:[obja unsignedLongLongValue] options:4 * v97->_fullStacks];
          id v73 = [NSString stringWithFormat:@"%@%@", @"STACK: ", v72];
          id v74 = objc_alloc(*(Class *)(v45 + 2680));
          long long v75 = (void *)[v74 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:v73 fieldType:0];

          v10[2](v10, v75);
          id v76 = objc_alloc(*(Class *)(v45 + 2680));
          v43 = (void *)[v76 initWithKey:kVMUAnalysisDataKey[0] numericalValue:0 objectValue:&stru_1EFE27F38 fieldType:0];

          v10[2](v10, v43);
          uint64_t v46 = v96 + 1;
        }
        while ((void *)(v96 + 1) != v90);
        unint64_t v39 = v88;
        long long v90 = (void *)[v83 countByEnumeratingWithState:&v106 objects:v132 count:16];
      }
      while (v90);

      uint64_t v40 = v81;
      id v16 = v85;
      uint64_t v38 = v78;
    }
  }
  return v38 != 0;
}

void __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if ([*(id *)(a1 + 32) usesLiteMode]) {
    BOOL v8 = *(_DWORD *)(a4 + 148) != *(_DWORD *)(a1 + 72);
  }
  else {
    BOOL v8 = 1;
  }
  if (a3[1] >> 60 == 1)
  {
    id v9 = (void *)MEMORY[0x1AD0D9F90]();
    if (shouldGetLabelForObject((void *)a3[2], *(unsigned __int8 *)(*(void *)(a1 + 40) + 34)))
    {
      uint64_t v10 = [*(id *)(a1 + 48) labelForNode:a2];
      if (v10)
      {
        uint64_t v11 = (void *)a3[2];
        if (v11)
        {
          if (*(unsigned char *)(*(void *)(a1 + 40) + 33)) {
            [v11 className];
          }
          else {
          id v12 = [v11 displayName];
          }
          id v16 = (void *)[[NSString alloc] initWithFormat:@"%@  %@", v12, v10];
          id v17 = *(id *)(a1 + 56);
          id v13 = v16;
          id v15 = [v17 member:v13];
          if (!v15)
          {
            [v17 addObject:v13];
            id v15 = v13;
          }
        }
        else
        {
          id v12 = *(id *)(a1 + 56);
          id v13 = v10;
          id v14 = [v12 member:v13];
          if (!v14)
          {
            [v12 addObject:v13];
            id v14 = v13;
          }
          id v15 = v14;
        }

        uint64_t v18 = malloc_type_malloc(0x18uLL, 0x10800401842DC26uLL);
        void *v18 = a3[1] & 0xFFFFFFFFFFFFFFFLL;
        v18[1] = v15;
        if (([*(id *)(a1 + 32) inspectingLiveProcess] ^ 1 | v8))
        {
          uint64_t uniquing_table_index = -1;
        }
        else
        {
          [*(id *)(a1 + 32) liteMSLPayloadforMallocAddress:*a3 size:a3[1] & 0xFFFFFFFFFFFFFFFLL];
          uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
        }
        v18[2] = uniquing_table_index;
        NSMapInsert(*(NSMapTable **)(a1 + 64), (const void *)*a3, v18);
      }
    }
  }
}

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_2(uint64_t result, int a2, void *key)
{
  if (a2 == 2)
  {
    uint64_t result = (uint64_t)NSMapGet(*(NSMapTable **)(result + 32), key);
    if (result)
    {
      uint64_t v3 = result;
      uint64_t result = msl_payload_get_uniquing_table_index();
      *(void *)(v3 + 16) = result;
    }
  }
  return result;
}

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = (void *)[v5 objectForKey:a2];
  BOOL v8 = (void *)[*(id *)(a1 + 32) objectForKey:v6];

  if (*v7 <= *v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (*v7 < *v8) {
    return 1;
  }
  else {
    return v9;
  }
}

uint64_t __73__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_fieldBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v5];
  BOOL v8 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) objectForKey:v6];
  if (*v7 <= *v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (*v7 < *v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v9;
  }
  if (*v7 == *v8) {
    uint64_t v10 = [v5 compare:v6];
  }

  return v10;
}

- (void)summaryWithGraph:(id)a3 block:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(VMUDuplicatesAnalyzer *)self _analysisSummaryWithGraphOrScanner:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__VMUDuplicatesAnalyzer_summaryWithGraph_block___block_invoke;
  v10[3] = &unk_1E5D26048;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [v9 enumerateObjectsUsingBlock:v10];
}

void __48__VMUDuplicatesAnalyzer_summaryWithGraph_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 longestKeyLength];
  id v6 = NSString;
  id v7 = [v4 key];
  uint64_t v8 = [v7 UTF8String];
  id v9 = [v4 formattedValue];

  id v10 = v9;
  [v6 stringWithFormat:@"    %*s:  %s", v5, v8, [v10 UTF8String]];
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)findStringDupsInGraph:(id)a3 symbolicator:(_CSTypeRef)a4 stackLogReader:(id)a5 block:(id)a6
{
  unint64_t opaque_2 = a4._opaque_2;
  unint64_t opaque_1 = a4._opaque_1;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_block___block_invoke;
  v14[3] = &unk_1E5D26070;
  id v15 = v11;
  id v12 = v11;
  LOBYTE(a5) = -[VMUDuplicatesAnalyzer findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:](self, "findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:", a3, opaque_1, opaque_2, a5, v14);

  return (char)a5;
}

void __81__VMUDuplicatesAnalyzer_findStringDupsInGraph_symbolicator_stackLogReader_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 formattedValue];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)findStringDupsByStack:(id)a3 stackLogReader:(id)a4 block:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_block___block_invoke;
  v11[3] = &unk_1E5D26070;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(a4) = [(VMUDuplicatesAnalyzer *)self findStringDupsByStack:a3 stackLogReader:a4 fieldBlock:v11];

  return (char)a4;
}

void __68__VMUDuplicatesAnalyzer_findStringDupsByStack_stackLogReader_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 formattedValue];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)fullAnalysisWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (self->_objectContentLevel != 1)
  {
    unint64_t v7 = 0x1E5D22000uLL;
    if (!self->_quiet)
    {
      id v8 = [VMUAnalyzerSummaryField alloc];
      id v9 = kVMUAnalysisDataKey[0];
      id v10 = [(VMUProcessObjectGraph *)self->super._graph processDescriptionString];
      id v11 = [(VMUAnalyzerSummaryField *)v8 initWithKey:v9 numericalValue:0 objectValue:v10 fieldType:0];

      v4[2](v4, v11);
    }
    id v12 = [NSString stringWithFormat:@"Showing object labels that have at least %lu duplicates.  Pass the \"-minimumCount <count>\" argument to change the threshold.\n", self->_minimumLabelCount];
    id v13 = [VMUAnalyzerSummaryField alloc];
    id v6 = [(VMUAnalyzerSummaryField *)v13 initWithKey:kVMUAnalysisWarningKey[0] numericalValue:0 objectValue:v12 fieldType:0];
    v4[2](v4, v6);
    if (self->_objectContentLevel == 2)
    {
      id v14 = [VMUAnalyzerSummaryField alloc];
      uint64_t v15 = [(VMUAnalyzerSummaryField *)v14 initWithKey:kVMUAnalysisWarningKey[0] numericalValue:0 objectValue:@"The memory graph file only contains labels for contents of readonly memory of the target process, so only those items can be shown.\n" fieldType:0];

      v4[2](v4, (void *)v15);
      id v6 = (VMUAnalyzerSummaryField *)v15;
    }
    if (self->_showStacks
      && ([(VMUProcessObjectGraph *)self->super._graph stackLogReader],
          (uint64_t v16 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v17 = (void *)v16;
      if (!self->_showCallTrees)
      {
        graph = self->super._graph;
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke;
        v35[3] = &unk_1E5D26070;
        unint64_t v36 = v4;
        LOBYTE(graph) = [(VMUDuplicatesAnalyzer *)self findStringDupsByStack:graph stackLogReader:v17 fieldBlock:v35];

        if (graph)
        {
LABEL_19:
          if (self->_quiet) {
            goto LABEL_20;
          }
          id v28 = objc_alloc(*(Class *)(v7 + 2680));
          uint64_t v29 = kVMUAnalysisDataKey[0];
          uint64_t v30 = [(VMUProcessObjectGraph *)self->super._graph binaryImagesDescription];
          uint64_t v26 = [v28 initWithKey:v29 numericalValue:0 objectValue:v30 fieldType:0];

          id v6 = (VMUAnalyzerSummaryField *)v30;
LABEL_17:

          v4[2](v4, (void *)v26);
          id v6 = (VMUAnalyzerSummaryField *)v26;
LABEL_20:

          goto LABEL_21;
        }
LABEL_16:
        uint64_t v24 = [NSString stringWithFormat:@"No object labels had %lu duplicates.", self->_minimumLabelCount];

        int64x2_t v25 = [VMUAnalyzerSummaryField alloc];
        uint64_t v26 = [(VMUAnalyzerSummaryField *)v25 initWithKey:kVMUAnalysisWarningKey[0] numericalValue:0 objectValue:v24 fieldType:0];
        id v12 = (void *)v24;
        goto LABEL_17;
      }
      uint64_t v18 = (void *)v16;
      uint64_t v32 = v12;
      char v31 = 0;
    }
    else
    {
      uint64_t v32 = v12;
      uint64_t v18 = 0;
      char v31 = 1;
    }
    uint64_t v19 = self->super._graph;
    v20 = [(VMUProcessObjectGraph *)v19 symbolStore];
    uint64_t v21 = [v20 symbolicator];
    uint64_t v23 = v22;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke_2;
    v33[3] = &unk_1E5D26070;
    uint64_t v34 = v4;
    id v17 = v18;
    LOBYTE(v19) = -[VMUDuplicatesAnalyzer findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:](self, "findStringDupsInGraph:symbolicator:stackLogReader:fieldBlock:", v19, v21, v23, v18, v33);

    if (v19)
    {
      id v12 = v32;
      unint64_t v7 = 0x1E5D22000;
      if (v31) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    id v12 = v32;
    goto LABEL_16;
  }
  uint64_t v5 = [VMUAnalyzerSummaryField alloc];
  id v6 = [(VMUAnalyzerSummaryField *)v5 initWithKey:kVMUAnalysisErrorKey[0] numericalValue:0 objectValue:@"The memory graph file does not contain any labels for allocations." fieldType:0];
  v4[2](v4, v6);
LABEL_21:
}

uint64_t __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__VMUDuplicatesAnalyzer_fullAnalysisWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)invertCallTrees
{
  return self->_invertCallTrees;
}

- (void)setInvertCallTrees:(BOOL)a3
{
  self->_invertCallTrees = a3;
}

- (BOOL)showRawClassNames
{
  return self->_showRawClassNames;
}

- (void)setShowRawClassNames:(BOOL)a3
{
  self->_showRawClassNames = a3;
}

- (BOOL)stringsOnly
{
  return self->_stringsOnly;
}

- (void)setStringsOnly:(BOOL)a3
{
  self->_stringsOnly = a3;
}

- (unint64_t)minimumLabelCount
{
  return self->_minimumLabelCount;
}

- (void)setMinimumLabelCount:(unint64_t)a3
{
  self->_minimumLabelCount = a3;
}

- (BOOL)showStacks
{
  return self->_showStacks;
}

- (void)setShowStacks:(BOOL)a3
{
  self->_showStacks = a3;
}

- (BOOL)fullStacks
{
  return self->_fullStacks;
}

- (void)setFullStacks:(BOOL)a3
{
  self->_fullStacks = a3;
}

- (BOOL)showCallTrees
{
  return self->_showCallTrees;
}

- (void)setShowCallTrees:(BOOL)a3
{
  self->_showCallTrees = a3;
}

- (BOOL)quiet
{
  return self->_quiet;
}

- (void)setQuiet:(BOOL)a3
{
  self->_quiet = a3;
}

- (unsigned)objectContentLevel
{
  return self->_objectContentLevel;
}

- (void)setObjectContentLevel:(unsigned int)a3
{
  self->_objectContentLevel = a3;
}

@end