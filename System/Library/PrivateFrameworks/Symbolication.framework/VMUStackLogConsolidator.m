@interface VMUStackLogConsolidator
- (VMUDebugTimer)debugTimer;
- (VMUStackLogConsolidator)initWithScannerOrGraph:(id)a3 stackLogReader:(id)a4;
- (id)callTreeWithOptions:(unint64_t)a3 nodeFilter:(id)a4;
- (id)stackIDsToNodesFilteredBy:(id)a3;
- (void)setDebugTimer:(id)a3;
@end

@implementation VMUStackLogConsolidator

- (VMUStackLogConsolidator)initWithScannerOrGraph:(id)a3 stackLogReader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VMUStackLogConsolidator;
  v9 = [(VMUStackLogConsolidator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scannerOrGraph, a3);
    objc_storeStrong((id *)&v10->_stackLogReader, a4);
  }

  return v10;
}

- (id)stackIDsToNodesFilteredBy:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:259];
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v7 = [(VMUDebugTimer *)debugTimer signpostID];
    debugTimer = self->_debugTimer;
    if (v7)
    {
      id v8 = [(VMUDebugTimer *)debugTimer logHandle];
      unint64_t v9 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        if (os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v8, OS_SIGNPOST_INTERVAL_END, v10, "VMUStackLogConsolidator", "", buf, 2u);
        }
      }

      debugTimer = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)debugTimer endEvent:"VMUStackLogConsolidator"];
  [(VMUDebugTimer *)self->_debugTimer startWithCategory:"VMUStackLogConsolidator" message:"step 1 -- build map table with live malloc block addresses as keys"];
  v11 = self->_debugTimer;
  if (v11)
  {
    objc_super v12 = [(VMUDebugTimer *)v11 logHandle];
    unint64_t v13 = [(VMUDebugTimer *)self->_debugTimer signpostID];
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VMUStackLogConsolidator", "step 1 -- build map table with live malloc block addresses as keys", buf, 2u);
      }
    }
  }
  *(void *)buf = 0;
  v57 = buf;
  uint64_t v58 = 0x2020000000;
  int v59 = 0;
  int v15 = [(VMUCommonGraphInterface *)self->_scannerOrGraph nodeCount];
  scannerOrGraph = self->_scannerOrGraph;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke;
  v51[3] = &unk_1E5D23E68;
  v51[4] = self;
  v54 = buf;
  int v55 = v15;
  id v17 = v4;
  id v53 = v17;
  v18 = v5;
  v52 = v18;
  [(VMUCommonGraphInterface *)scannerOrGraph enumerateRegionsWithBlock:v51];
  if ((![(VMUStackLogReader *)self->_stackLogReader inspectingLiveProcess]
     || ([(VMUStackLogReader *)self->_stackLogReader usesLiteMode] & 1) == 0)
    && ([(VMUStackLogReader *)self->_stackLogReader usesCoreFile] & 1) == 0)
  {
    v19 = self->_debugTimer;
    if (v19)
    {
      uint64_t v20 = [(VMUDebugTimer *)v19 signpostID];
      v19 = self->_debugTimer;
      if (v20)
      {
        v21 = [(VMUDebugTimer *)v19 logHandle];
        os_signpost_id_t v22 = [(VMUDebugTimer *)self->_debugTimer signpostID];
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          LOWORD(v48._pi) = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v21, OS_SIGNPOST_INTERVAL_END, v22, "VMUStackLogConsolidator", "", (uint8_t *)&v48, 2u);
        }

        v19 = self->_debugTimer;
      }
    }
    [(VMUDebugTimer *)v19 endEvent:"VMUStackLogConsolidator"];
    [(VMUDebugTimer *)self->_debugTimer startWithCategory:"VMUStackLogConsolidator" message:"step 2 -- enumerate stack log records to record unique backtrace IDs for objects of interest"];
    v23 = self->_debugTimer;
    if (v23)
    {
      v24 = [(VMUDebugTimer *)v23 logHandle];
      os_signpost_id_t v25 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        LOWORD(v48._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v25, "VMUStackLogConsolidator", "step 2 -- enumerate stack log records to record unique backtrace IDs for objects of interest", (uint8_t *)&v48, 2u);
      }
    }
    stackLogReader = self->_stackLogReader;
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke_5;
    v49[3] = &unk_1E5D237E8;
    v50 = v18;
    [(VMUStackLogReader *)stackLogReader enumerateMSLRecordsAndPayloads:v49];
  }
  v27 = self->_debugTimer;
  if (v27)
  {
    uint64_t v28 = [(VMUDebugTimer *)v27 signpostID];
    v27 = self->_debugTimer;
    if (v28)
    {
      v29 = [(VMUDebugTimer *)v27 logHandle];
      os_signpost_id_t v30 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        LOWORD(v48._pi) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v29, OS_SIGNPOST_INTERVAL_END, v30, "VMUStackLogConsolidator", "", (uint8_t *)&v48, 2u);
      }

      v27 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v27 endEvent:"VMUStackLogConsolidator"];
  -[VMUDebugTimer startWithCategory:message:](self->_debugTimer, "startWithCategory:message:", "VMUStackLogConsolidator", "step 3 -- from uniqueBacktraceToObjectsMap, create uniqueBacktraceToObjectsMap");
  v31 = self->_debugTimer;
  if (v31)
  {
    v32 = [(VMUDebugTimer *)v31 logHandle];
    os_signpost_id_t v33 = [(VMUDebugTimer *)self->_debugTimer signpostID];
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      LOWORD(v48._pi) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v33, "VMUStackLogConsolidator", "step 3 -- from uniqueBacktraceToObjectsMap, create uniqueBacktraceToObjectsMap", (uint8_t *)&v48, 2u);
    }
  }
  v34 = objc_opt_new();
  memset(&v48, 0, sizeof(v48));
  NSEnumerateMapTable(&v48, v18);
  value = 0;
  key = 0;
  while (NSNextMapEnumeratorPair(&v48, &key, &value))
  {
    uint64_t v35 = *(void *)value;
    v36 = [NSNumber numberWithUnsignedLongLong:*(void *)value];
    v37 = [v34 objectForKeyedSubscript:v36];

    if (!v37)
    {
      v37 = objc_opt_new();
      v38 = [NSNumber numberWithUnsignedLongLong:v35];
      [v34 setObject:v37 forKeyedSubscript:v38];
    }
    v39 = [NSNumber numberWithUnsignedInt:*((unsigned int *)value + 4)];
    [v37 addObject:v39];
  }
  NSEndMapTableEnumeration(&v48);
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
        *(_WORD *)v45 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v42, OS_SIGNPOST_INTERVAL_END, v43, "VMUStackLogConsolidator", "", v45, 2u);
      }

      v40 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v40 endEvent:"VMUStackLogConsolidator"];

  _Block_object_dispose(buf, 8);

  return v34;
}

void __53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) zoneNameForIndex:*((unsigned int *)v3 + 37)];
  if ([*(id *)(*(void *)(a1 + 32) + 16) usesLiteMode])
  {
    id v5 = v4;
    if ([v5 hasPrefix:@"MallocStackLoggingLiteZone"]) {
      int v6 = [v5 hasPrefix:@"MallocStackLoggingLiteZone_Wrapper"] ^ 1;
    }
    else {
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(v7 + 8);
  uint64_t v8 = v7 + 8;
  if (*(_DWORD *)(v9 + 24) < *(_DWORD *)(a1 + 64))
  {
    while (1)
    {
      key[1] = 0;
      uint64_t v22 = 0;
      key[0] = 0;
      os_signpost_id_t v10 = *(void **)(*(void *)(a1 + 32) + 8);
      if (v10)
      {
        [v10 nodeDetails:*(unsigned int *)(*(void *)v8 + 24)];
        v11 = key[0];
      }
      else
      {
        v11 = 0;
      }
      if ((unint64_t)v11 >= v3[2] + v3[1]) {
        goto LABEL_26;
      }
      if ((((unint64_t)key[1] >> 60) | 4) == 5)
      {
        uint64_t v12 = *(void *)(a1 + 48);
        if (!v12) {
          break;
        }
        uint64_t v13 = *(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        os_signpost_id_t v14 = *(unsigned int (**)(uint64_t, uint64_t, long long *, void *))(v12 + 16);
        long long v19 = *(_OWORD *)key;
        uint64_t v20 = v22;
        if (v14(v12, v13, &v19, v4)) {
          break;
        }
      }
LABEL_23:
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v18 = *(void *)(v17 + 8);
      uint64_t v8 = v17 + 8;
      if (*(_DWORD *)(v18 + 24) >= *(_DWORD *)(a1 + 64)) {
        goto LABEL_26;
      }
    }
    int v15 = malloc_type_malloc(0x18uLL, 0x10000400CE834B2uLL);
    *int v15 = -1;
    v15[1] = (unint64_t)key[1] & 0xFFFFFFFFFFFFFFFLL;
    *((_DWORD *)v15 + 4) = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if ([*(id *)(*(void *)(a1 + 32) + 16) inspectingLiveProcess]
      && [*(id *)(*(void *)(a1 + 32) + 16) usesLiteMode])
    {
      if (!v6)
      {
        free(v15);
        goto LABEL_23;
      }
      [*(id *)(*(void *)(a1 + 32) + 16) liteMSLPayloadforMallocAddress:key[0] size:(unint64_t)key[1] & 0xFFFFFFFFFFFFFFFLL];
      uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
    }
    else
    {
      if (![*(id *)(*(void *)(a1 + 32) + 16) usesCoreFile])
      {
LABEL_22:
        NSMapInsert(*(NSMapTable **)(a1 + 40), key[0], v15);
        goto LABEL_23;
      }
      uint64_t uniquing_table_index = [*(id *)(*(void *)(a1 + 32) + 16) stackIDForNode:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    }
    *int v15 = uniquing_table_index;
    goto LABEL_22;
  }
LABEL_26:
}

void *__53__VMUStackLogConsolidator_stackIDsToNodesFilteredBy___block_invoke_5(uint64_t a1, char a2, const void *a3)
{
  result = (void *)msl_payload_get_uniquing_table_index();
  if ((a2 & 0x12) != 0)
  {
    uint64_t v7 = result;
    result = NSMapGet(*(NSMapTable **)(a1 + 32), a3);
    if (result) {
      void *result = v7;
    }
  }
  return result;
}

- (id)callTreeWithOptions:(unint64_t)a3 nodeFilter:(id)a4
{
  int v6 = [(VMUStackLogConsolidator *)self stackIDsToNodesFilteredBy:a4];
  debugTimer = self->_debugTimer;
  if (debugTimer)
  {
    uint64_t v8 = [(VMUDebugTimer *)debugTimer signpostID];
    debugTimer = self->_debugTimer;
    if (v8)
    {
      uint64_t v9 = [(VMUDebugTimer *)debugTimer logHandle];
      unint64_t v10 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v9, OS_SIGNPOST_INTERVAL_END, v11, "VMUStackLogConsolidator", "", buf, 2u);
        }
      }

      debugTimer = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)debugTimer endEvent:"VMUStackLogConsolidator"];
  [(VMUDebugTimer *)self->_debugTimer startWithCategory:"VMUStackLogConsolidator" message:"step 4 -- build call tree by iterating the uniqueBacktraceToObjectsMap"];
  uint64_t v12 = self->_debugTimer;
  if (v12)
  {
    uint64_t v13 = [(VMUDebugTimer *)v12 logHandle];
    unint64_t v14 = [(VMUDebugTimer *)self->_debugTimer signpostID];
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "VMUStackLogConsolidator", "step 4 -- build call tree by iterating the uniqueBacktraceToObjectsMap", buf, 2u);
      }
    }
  }
  if ([(VMUStackLogReader *)self->_stackLogReader coldestFrameIsNotThreadId]) {
    a3 |= 4uLL;
  }
  v16 = -[VMUCallTreeRoot initWithSymbolicator:sampler:options:]([VMUCallTreeRoot alloc], "initWithSymbolicator:sampler:options:", 0, 0, 0, a3);
  [(VMUCallTreeRoot *)v16 setStackLogReader:self->_stackLogReader];
  uint64_t v17 = objc_alloc_init(VMUBacktrace);
  v17->_flavor = 32;
  if (self->_debugTimer) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "%qu unique stacks\n", [v6 count]);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __58__VMUStackLogConsolidator_callTreeWithOptions_nodeFilter___block_invoke;
  v29[3] = &unk_1E5D23E90;
  v29[4] = self;
  uint64_t v18 = v17;
  os_signpost_id_t v30 = v18;
  long long v19 = v16;
  v31 = v19;
  [v6 enumerateKeysAndObjectsUsingBlock:v29];
  [(VMUCallTreeRoot *)v19 allBacktracesHaveBeenAdded];
  uint64_t v20 = [(VMUCommonGraphInterface *)self->_scannerOrGraph binaryImagesDescription];
  [(VMUCallTreeRoot *)v19 setBinaryImagesDescription:v20];

  v21 = self->_debugTimer;
  if (v21)
  {
    uint64_t v22 = [(VMUDebugTimer *)v21 signpostID];
    v21 = self->_debugTimer;
    if (v22)
    {
      v23 = [(VMUDebugTimer *)v21 logHandle];
      unint64_t v24 = [(VMUDebugTimer *)self->_debugTimer signpostID];
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v24;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A7CC9000, v23, OS_SIGNPOST_INTERVAL_END, v25, "VMUStackLogConsolidator", "", buf, 2u);
        }
      }

      v21 = self->_debugTimer;
    }
  }
  [(VMUDebugTimer *)v21 endEvent:"VMUStackLogConsolidator"];
  v26 = v31;
  v27 = v19;

  return v27;
}

void __58__VMUStackLogConsolidator_callTreeWithOptions_nodeFilter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v28[512] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 unsignedLongValue];
  if (v7 != -1)
  {
    int v8 = [*(id *)(*(void *)(a1 + 32) + 16) getFramesForStackID:v7 stackFramesBuffer:v28];
    if (v8)
    {
      if ([*(id *)(*(void *)(a1 + 32) + 16) coldestFrameIsNotThreadId]) {
        LODWORD(v9) = -1;
      }
      else {
        uint64_t v9 = v28[--v8];
      }
      *(_DWORD *)(*(void *)(a1 + 40) + 28) = v9;
      *(_DWORD *)(*(void *)(a1 + 40) + 64) = v8;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v6;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v14) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) unsignedIntValue];
            uint64_t v21 = 0;
            uint64_t v22 = 0;
            uint64_t v20 = 0;
            uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 8);
            if (v17) {
              uint64_t v17 = (void *)[v17 nodeDetails:v16];
            }
            uint64_t v18 = (void *)MEMORY[0x1AD0D9F90](v17);
            v13 += v21 & 0xFFFFFFFFFFFFFFFLL;
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v12);
      }
      else
      {
        uint64_t v13 = 0;
      }

      *(void *)(*(void *)(a1 + 40) + 48) = v28;
      long long v19 = [*(id *)(a1 + 48) addBacktrace:*(void *)(a1 + 40) count:[v10 count] numBytes:v13];
      *(void *)(*(void *)(a1 + 40) + 48) = 0;
    }
  }
}

- (VMUDebugTimer)debugTimer
{
  return self->_debugTimer;
}

- (void)setDebugTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugTimer, 0);
  objc_storeStrong((id *)&self->_stackLogReader, 0);

  objc_storeStrong((id *)&self->_scannerOrGraph, 0);
}

@end