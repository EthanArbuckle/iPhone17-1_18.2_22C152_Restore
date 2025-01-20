@interface VMUDirectedGraph
+ (BOOL)encapsulateData:(id)a3 to:(id)a4 withSupplementalDataTag:(const char *)a5 error:(id *)a6 dataGeneratorBlock:(id)a7;
+ (id)_archivedBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
+ (id)_archivedObject:(id)a3 options:(unint64_t)a4;
+ (id)_unarchivedObject:(id)a3 ofClass:(Class)a4 options:(unint64_t)a5;
+ (id)_unarchivedObject:(id)a3 ofClasses:(id)a4 options:(unint64_t)a5;
+ (id)directedGraphWithData:(id)a3 error:(id *)a4;
+ (void)_copyUnarchived:(id)a3 length:(unint64_t *)a4 options:(unint64_t)a5;
- (BOOL)_adjustAdjacencyMap;
- (BOOL)graphIs64bit;
- (BOOL)inverted;
- (BOOL)isNodePresent:(unsigned int)a3;
- (NSDictionary)additionalProperties;
- (VMUDirectedGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7;
- (VMUDirectedGraph)initWithNodes:(unsigned int)a3;
- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3;
- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decapsulateIPSheaderInData:(id)a3 error:(id *)a4;
- (id)decapsulatePlistData:(id)a3 error:(id *)a4;
- (id)decapsulateSupplementalData:(id)a3 forTag:(const char *)a4;
- (id)invertedGraph;
- (id)plistRepresentationWithOptions:(unint64_t)a3;
- (id)plistRepresentationWithOptions:(unint64_t)a3 fromOriginalMemgraph:(id)a4;
- (id)renormalizedGraph;
- (id)subgraphWithMarkedNodes:(void *)a3;
- (unsigned)_internalEnumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4;
- (unsigned)addGroupNodeForNodes:(const unsigned int *)a3 count:(unsigned int)a4;
- (unsigned)addNode;
- (unsigned)edgeCount;
- (unsigned)edgeNamespaceSize;
- (unsigned)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateEdgesWithBlock:(id)a3;
- (unsigned)enumerateMembersOfGroupNode:(unsigned int)a3 withBlock:(id)a4;
- (unsigned)enumerateNodesWithBlock:(id)a3;
- (unsigned)nodeCount;
- (unsigned)nodeNamespaceSize;
- (unsigned)parentGroupForNode:(unsigned int)a3;
- (unsigned)pointerSize;
- (unsigned)reverseEnumerateNodesWithBlock:(id)a3;
- (void)_adjustAdjacencyMap;
- (void)_bfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6;
- (void)_dfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6;
- (void)_dumpAdjacencyList;
- (void)_faultDeadNodeMap;
- (void)_internalAccessRawEdgesWithBlock:(id)a3;
- (void)_internalAddEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4 withName:;
- (void)_removeEdges:(id)a3;
- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6;
- (void)_renormalize;
- (void)_reorderEdgesNaturally;
- (void)_searchMainLoop:(unsigned int)a3 action:(id)a4;
- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4;
- (void)breadthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5;
- (void)deadNodeMap;
- (void)dealloc;
- (void)depthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5;
- (void)invertEdges;
- (void)removeMarkedEdges:(void *)a3;
- (void)removeMarkedNodes:(void *)a3;
- (void)setAdditionalProperties:(id)a3;
- (void)setGraphCompatibilityVersion:(int64_t)a3;
- (void)setGraphVersion:(int64_t)a3;
- (void)setInverted:(BOOL)a3;
- (void)ungroupNode:(unsigned int)a3;
- (void)withEdgeMarkingMap:(id)a3;
- (void)withNodeMarkingMap:(id)a3;
@end

@implementation VMUDirectedGraph

+ (id)_archivedBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  id v5 = (id)a4;
  if (a4)
  {
    int v7 = a5 & 1;
    if ((a5 & 4) != 0) {
      int v7 = 2;
    }
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__9;
    v41 = __Block_byref_object_dispose__9;
    id v42 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    int v36 = v7;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v9 = v8;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __VMUCompressedBuffer_block_invoke;
    v32[3] = &unk_1E5D25BC0;
    v32[5] = &v37;
    v32[6] = v5;
    v32[4] = &v33;
    uint64_t v10 = MEMORY[0x1AD0DA230](v32);
    v11 = (void (**)(void))v10;
    int v12 = *((_DWORD *)v34 + 6);
    if (v12 == 1)
    {
      uint64_t v27 = 0;
      uint64_t v28 = (uint64_t)&v27;
      uint64_t v29 = 0x9010000000;
      memset(&v31.avail_in, 0, 104);
      v30 = &unk_1A7D91765;
      v31.next_in = (Bytef *)a3;
      v31.avail_in = v5;
      uint64_t v13 = deflateInit2_(&v31, 1, 8, 31, 9, 0, "1.2.12", 112);
      if (v13)
      {
        NSLog(&cfstr_UnableToInitia.isa, v13, *(void *)(v28 + 80));
        _Block_object_dispose(&v27, 8);
        id v5 = 0;
LABEL_21:

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(&v37, 8);

        goto LABEL_22;
      }
      uLong v14 = deflateBound((z_streamp)(v28 + 32), (uLong)v5);
      v26[6] = MEMORY[0x1E4F143A8];
      v26[7] = 3221225472;
      v26[8] = __VMUCompressedBuffer_block_invoke_2;
      v26[9] = &unk_1E5D25BE8;
      v26[10] = &v27;
      v26[11] = v14;
      v11[2](v11);
      _Block_object_dispose(&v27, 8);
    }
    else if (v12 == 2)
    {
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      uint64_t v29 = (uint64_t)__VMUCompressedBuffer_block_invoke_3;
      v30 = &__block_descriptor_56_e9_Q16__0_v8l;
      v31.next_in = (Bytef *)a3;
      *(void *)&v31.avail_in = v5;
      v31.total_in = (unint64_t)((double)(unint64_t)v5 * 1.2);
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
    v15 = v38;
    if (!v38[5])
    {
      *((_DWORD *)v34 + 6) = 0;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __VMUCompressedBuffer_block_invoke_4;
      v26[3] = &__block_descriptor_48_e9_Q16__0_v8l;
      v26[4] = a3;
      v26[5] = v5;
      ((void (*)(void (**)(void), id, void, void *))v11[2])(v11, v5, 0, v26);
      v15 = v38;
    }
    if (kVMUPrintArchivingTiming)
    {
      id v16 = (id)v15[5];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v18 = v17;
      unint64_t v19 = [v16 length];
      unint64_t v20 = v19;
      if (v19 <= (unint64_t)v5) {
        unint64_t v21 = (unint64_t)v5;
      }
      else {
        unint64_t v21 = v19;
      }
      double v22 = v18 - v9;
      if (v22 <= 0.0)
      {
        v24 = (FILE *)*MEMORY[0x1E4F143C8];
        VMUMemorySizeString(v5);
        VMUMemorySizeString(v20);
        fprintf(v24, "Compressed %s to %s (%2.1f%% reduction) in %3.6fs\n");
      }
      else
      {
        VMUMemorySizeString((unint64_t)((double)(v21 - v19) / v22));
        v23 = (FILE *)*MEMORY[0x1E4F143C8];
        VMUMemorySizeString(v5);
        VMUMemorySizeString(v20);
        fprintf(v23, "Compressed %s to %s (%2.1f%% reduction @ %s saved/s) in %3.6fs\n");
      }

      v15 = v38;
    }
    id v5 = (id)v15[5];
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

+ (void)_copyUnarchived:(id)a3 length:(unint64_t *)a4 options:(unint64_t)a5
{
  id v6 = a3;
  if ((unint64_t)[v6 length] <= 0xF) {
    goto LABEL_7;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v8 = v7;
  id v9 = v6;
  uint64_t v10 = (unsigned int *)[v9 bytes];
  int v12 = (Bytef *)v10[1];
  size_t v11 = v10[2];
  BOOL v13 = !v11 || v12 == 0;
  if (v13
    || (unint64_t v14 = *v10, v15 = v10[3], [v9 length] < (unint64_t)(v12 + v14)))
  {
LABEL_7:
    if (a4)
    {
      id v16 = 0;
      *a4 = 0;
      goto LABEL_45;
    }
LABEL_44:
    id v16 = 0;
    goto LABEL_45;
  }
  id v16 = (Bytef *)malloc_type_malloc(v11, 0x15C7163AuLL);
  unsigned int v17 = HIWORD(v15);
  if (!HIWORD(v15))
  {
    unint64_t v24 = [v9 length];
    if (v24 >= v14 && v12 == v11 && v24 - v14 >= v11)
    {
      memcpy(v16, (const void *)([v9 bytes] + v14), v11);
      double v18 = (Bytef *)v11;
      goto LABEL_34;
    }
    NSLog(&cfstr_MalformedNonCo.isa);
    goto LABEL_33;
  }
  if (v17 != 2)
  {
    double v18 = (Bytef *)v11;
    if (v17 != 1) {
      goto LABEL_34;
    }
    id v19 = v9;
    uint64_t v20 = [v19 bytes];
    unsigned int v21 = [v19 length];
    memset(&strm.avail_in, 0, 104);
    strm.next_in = (Bytef *)(v20 + v14);
    uInt v22 = v21 - v14;
    if (v21 < v14) {
      uInt v22 = 0;
    }
    strm.avail_in = v22;
    uint64_t v23 = inflateInit2_(&strm, 31, "1.2.12", 112);
    if (v23)
    {
      NSLog(&cfstr_UnableToInitia_1.isa, v23, strm.msg);
    }
    else
    {
      strm.next_out = v16;
      strm.avail_out = v11;
      uint64_t v27 = inflate(&strm, 4);
      inflateEnd(&strm);
      double v18 = (Bytef *)v11;
      if (v27 == 1) {
        goto LABEL_34;
      }
      NSLog(&cfstr_UnableToDecomp.isa, v27, strm.msg);
    }
    goto LABEL_33;
  }
  uint64_t v25 = [v9 bytes];
  memset(&strm, 0, 40);
  if (compression_stream_init((compression_stream *)&strm, COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    NSLog(&cfstr_UnableToInitia_0.isa);
LABEL_33:
    double v18 = 0;
    goto LABEL_34;
  }
  strm.total_in = v25 + v14;
  strm.next_out = v12;
  strm.next_in = v16;
  *(void *)&strm.avail_in = v11;
  compression_status v26 = compression_stream_process((compression_stream *)&strm, 0);
  if (v26 == COMPRESSION_STATUS_ERROR)
  {
    NSLog(&cfstr_ErrorCompressi.isa);
    goto LABEL_33;
  }
  if (v26 == COMPRESSION_STATUS_OK)
  {
    NSLog(&cfstr_ErrorCompressi_0.isa);
    goto LABEL_33;
  }
  if (v26 != COMPRESSION_STATUS_END || (double v18 = (Bytef *)(strm.next_in - v16), strm.next_in <= v16)) {
    double v18 = 0;
  }
  compression_stream_destroy((compression_stream *)&strm);
LABEL_34:
  if (kVMUPrintArchivingTiming)
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F1C9C8];
    id v29 = v9;
    [v28 timeIntervalSinceReferenceDate];
    double v31 = v30;
    unint64_t v32 = [v29 length];

    if (v32 <= v11) {
      unint64_t v33 = v11;
    }
    else {
      unint64_t v33 = v32;
    }
    double v34 = 100.0 - (double)v32 * 100.0 / (double)v33;
    uint64_t v35 = (FILE *)*MEMORY[0x1E4F143C8];
    int v36 = (const char *)VMUMemorySizeString(v32);
    uint64_t v37 = (const char *)VMUMemorySizeString(v11);
    fprintf(v35, "Decompressed %s to %s (reversed %2.1f%% reduction) in %3.6fs\n", v36, v37, v34, v31 - v8);
  }
  if (a4) {
    *a4 = (unint64_t)v18;
  }
  if (v18 != (Bytef *)v11 || !v18)
  {
    free(v16);
    goto LABEL_44;
  }
LABEL_45:

  return v16;
}

+ (id)_archivedObject:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  double v7 = (Bytef *)[v6 bytes];
  id v8 = (id)[v6 length];
  if (v8)
  {
    int v9 = v4 & 1;
    if ((v4 & 4) != 0) {
      int v9 = 2;
    }
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = __Block_byref_object_copy__9;
    v43 = __Block_byref_object_dispose__9;
    id v44 = 0;
    uint64_t v35 = 0;
    int v36 = &v35;
    uint64_t v37 = 0x2020000000;
    int v38 = v9;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v11 = v10;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __VMUCompressedBuffer_block_invoke;
    v34[3] = &unk_1E5D25BC0;
    v34[5] = &v39;
    v34[6] = v8;
    v34[4] = &v35;
    uint64_t v12 = MEMORY[0x1AD0DA230](v34);
    BOOL v13 = (void (**)(void))v12;
    int v14 = *((_DWORD *)v36 + 6);
    if (v14 == 1)
    {
      uint64_t v29 = 0;
      uint64_t v30 = (uint64_t)&v29;
      uint64_t v31 = 0x9010000000;
      memset(&v33.avail_in, 0, 104);
      unint64_t v32 = &unk_1A7D91765;
      v33.next_in = v7;
      v33.avail_in = v8;
      uint64_t v15 = deflateInit2_(&v33, 1, 8, 31, 9, 0, "1.2.12", 112);
      if (v15)
      {
        NSLog(&cfstr_UnableToInitia.isa, v15, *(void *)(v30 + 80));
        _Block_object_dispose(&v29, 8);
        id v8 = 0;
LABEL_21:

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v39, 8);

        goto LABEL_22;
      }
      uLong v16 = deflateBound((z_streamp)(v30 + 32), (uLong)v8);
      v28[6] = MEMORY[0x1E4F143A8];
      v28[7] = 3221225472;
      v28[8] = __VMUCompressedBuffer_block_invoke_2;
      v28[9] = &unk_1E5D25BE8;
      v28[10] = &v29;
      v28[11] = v16;
      v13[2](v13);
      _Block_object_dispose(&v29, 8);
    }
    else if (v14 == 2)
    {
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      uint64_t v31 = (uint64_t)__VMUCompressedBuffer_block_invoke_3;
      unint64_t v32 = &__block_descriptor_56_e9_Q16__0_v8l;
      v33.next_in = v7;
      *(void *)&v33.avail_in = v8;
      v33.total_in = (unint64_t)((double)(unint64_t)v8 * 1.2);
      (*(void (**)(uint64_t))(v12 + 16))(v12);
    }
    unsigned int v17 = v40;
    if (!v40[5])
    {
      *((_DWORD *)v36 + 6) = 0;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __VMUCompressedBuffer_block_invoke_4;
      v28[3] = &__block_descriptor_48_e9_Q16__0_v8l;
      v28[4] = v7;
      v28[5] = v8;
      ((void (*)(void (**)(void), id, void, void *))v13[2])(v13, v8, 0, v28);
      unsigned int v17 = v40;
    }
    if (kVMUPrintArchivingTiming)
    {
      id v18 = (id)v17[5];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v20 = v19;
      unint64_t v21 = [v18 length];
      unint64_t v22 = v21;
      if (v21 <= (unint64_t)v8) {
        unint64_t v23 = (unint64_t)v8;
      }
      else {
        unint64_t v23 = v21;
      }
      double v24 = v20 - v11;
      if (v24 <= 0.0)
      {
        compression_status v26 = (FILE *)*MEMORY[0x1E4F143C8];
        VMUMemorySizeString(v8);
        VMUMemorySizeString(v22);
        fprintf(v26, "Compressed %s to %s (%2.1f%% reduction) in %3.6fs\n");
      }
      else
      {
        VMUMemorySizeString((unint64_t)((double)(v23 - v21) / v24));
        uint64_t v25 = (FILE *)*MEMORY[0x1E4F143C8];
        VMUMemorySizeString(v8);
        VMUMemorySizeString(v22);
        fprintf(v25, "Compressed %s to %s (%2.1f%% reduction @ %s saved/s) in %3.6fs\n");
      }

      unsigned int v17 = v40;
    }
    id v8 = (id)v17[5];
    goto LABEL_21;
  }
LABEL_22:

  return v8;
}

+ (id)_unarchivedObject:(id)a3 ofClass:(Class)a4 options:(unint64_t)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a3;
  double v10 = [v8 setWithObject:a4];
  double v11 = [a1 _unarchivedObject:v9 ofClasses:v10 options:a5];

  return v11;
}

+ (id)_unarchivedObject:(id)a3 ofClasses:(id)a4 options:(unint64_t)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if ((unint64_t)[v8 length] < 0x10) {
    goto LABEL_44;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v10 = v9;
  id v11 = v8;
  uint64_t v12 = (unsigned int *)[v11 bytes];
  BOOL v13 = (Bytef *)v12[1];
  size_t v14 = v12[2];
  if (!v14 || v13 == 0) {
    goto LABEL_44;
  }
  unint64_t v16 = *v12;
  unsigned int v17 = v12[3];
  if ([v11 length] < (unint64_t)(v13 + v16)) {
    goto LABEL_44;
  }
  id v18 = (Bytef *)malloc_type_malloc(v14, 0x15C7163AuLL);
  unsigned int v19 = HIWORD(v17);
  if (!HIWORD(v17))
  {
    unint64_t v27 = [v11 length];
    if (v27 >= v16 && v13 == v14 && v27 - v16 >= v14)
    {
      memcpy(v18, (const void *)([v11 bytes] + v16), v14);
      double v20 = (Bytef *)v14;
      goto LABEL_34;
    }
    NSLog(&cfstr_MalformedNonCo.isa);
    goto LABEL_33;
  }
  if (v19 != 2)
  {
    double v20 = (Bytef *)v14;
    if (v19 != 1) {
      goto LABEL_34;
    }
    id v21 = v7;
    id v22 = v11;
    uint64_t v23 = [v22 bytes];
    unsigned int v24 = [v22 length];
    memset(&strm.avail_in, 0, 104);
    strm.next_in = (Bytef *)(v23 + v16);
    uInt v25 = v24 - v16;
    if (v24 < v16) {
      uInt v25 = 0;
    }
    strm.avail_in = v25;
    uint64_t v26 = inflateInit2_(&strm, 31, "1.2.12", 112);
    if (v26)
    {
      NSLog(&cfstr_UnableToInitia_1.isa, v26, strm.msg);
    }
    else
    {
      strm.next_out = v18;
      strm.avail_out = v14;
      uint64_t v30 = inflate(&strm, 4);
      inflateEnd(&strm);
      double v20 = (Bytef *)v14;
      if (v30 == 1)
      {
LABEL_30:
        id v7 = v21;
        goto LABEL_34;
      }
      NSLog(&cfstr_UnableToDecomp.isa, v30, strm.msg);
    }
    double v20 = 0;
    goto LABEL_30;
  }
  uint64_t v28 = [v11 bytes];
  memset(&strm, 0, 40);
  if (compression_stream_init((compression_stream *)&strm, COMPRESSION_STREAM_DECODE, COMPRESSION_LZFSE) == COMPRESSION_STATUS_ERROR)
  {
    NSLog(&cfstr_UnableToInitia_0.isa);
LABEL_33:
    double v20 = 0;
    goto LABEL_34;
  }
  strm.total_in = v28 + v16;
  strm.next_out = v13;
  strm.next_in = v18;
  *(void *)&strm.avail_in = v14;
  compression_status v29 = compression_stream_process((compression_stream *)&strm, 0);
  if (v29 == COMPRESSION_STATUS_ERROR)
  {
    NSLog(&cfstr_ErrorCompressi.isa);
    goto LABEL_33;
  }
  if (v29 == COMPRESSION_STATUS_OK)
  {
    NSLog(&cfstr_ErrorCompressi_0.isa);
    goto LABEL_33;
  }
  if (v29 != COMPRESSION_STATUS_END || (double v20 = (Bytef *)(strm.next_in - v18), strm.next_in <= v18)) {
    double v20 = 0;
  }
  compression_stream_destroy((compression_stream *)&strm);
LABEL_34:
  if (kVMUPrintArchivingTiming)
  {
    uint64_t v31 = (void *)MEMORY[0x1E4F1C9C8];
    id v32 = v7;
    id v33 = v11;
    [v31 timeIntervalSinceReferenceDate];
    double v35 = v34;
    unint64_t v36 = [v33 length];

    if (v36 <= v14) {
      unint64_t v37 = v14;
    }
    else {
      unint64_t v37 = v36;
    }
    double v38 = 100.0 - (double)v36 * 100.0 / (double)v37;
    uint64_t v39 = (FILE *)*MEMORY[0x1E4F143C8];
    v40 = (const char *)VMUMemorySizeString(v36);
    v54 = (const char *)VMUMemorySizeString(v14);
    uint64_t v41 = v39;
    id v7 = v32;
    fprintf(v41, "Decompressed %s to %s (reversed %2.1f%% reduction) in %3.6fs\n", v40, v54, v38, v35 - v10);
  }
  if (v20 != (Bytef *)v14 || !v20)
  {
    free(v18);
LABEL_44:

    goto LABEL_45;
  }

  if (v18)
  {
    id v42 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v18 length:v14 freeWhenDone:1];
    goto LABEL_46;
  }
LABEL_45:
  id v42 = 0;
LABEL_46:

  if ([v42 length])
  {
    v55 = v42;
    v43 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v42 error:0];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v56 = v7;
    id v44 = v7;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v58 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(objc_class **)(*((void *)&v57 + 1) + 8 * i);
          v50 = [NSString stringWithUTF8String:class_getName(v49)];
          if ([v50 containsString:@"VMU"])
          {
            if ([v50 hasPrefix:@"DVT_"]) {
              [v50 substringFromIndex:4];
            }
            else {
            v51 = [@"DVT_" stringByAppendingString:v50];
            }
            [v43 setClass:v49 forClassName:v50];
            [v43 setClass:v49 forClassName:v51];
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v46);
    }

    v52 = [v43 decodeObjectOfClasses:v44 forKey:*MEMORY[0x1E4F284E8]];

    id v42 = v55;
    id v7 = v56;
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

- (VMUDirectedGraph)initWithNodes:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VMUDirectedGraph;
  result = [(VMUDirectedGraph *)&v5 init];
  if (result)
  {
    if (a3)
    {
      result->_nodeCount = a3;
      result->_nextNodeName = a3;
      result->_graphIs64bit = 1;
      *(int64x2_t *)&result->_graphCompatibilityVersion = vdupq_n_s64(2uLL);
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)setGraphCompatibilityVersion:(int64_t)a3
{
  self->_graphCompatibilityVersion = a3;
}

- (void)setGraphVersion:(int64_t)a3
{
  self->_graphVersion = a3;
}

+ (id)directedGraphWithData:(id)a3 error:(id *)a4
{
  id v11 = a3;
  if (v11)
  {
    uint64_t v12 = (void *)[objc_alloc((Class)a1) initWithPlistRepresentation:v11 error:a4];
  }
  else if (a4)
  {
    VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, @"Data parameter cannot be nil.", v6, v7, v8, v9, v10, v14);
    uint64_t v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)decapsulatePlistData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 length] <= 0x30)
  {
    id v6 = v5;
LABEL_5:
    uint64_t v8 = v6;
    goto LABEL_6;
  }
  id v7 = v5;
  if (*(void *)[v7 bytes] != 0x48504152474D454DLL)
  {
    id v6 = v7;
    goto LABEL_5;
  }
  id v10 = v7;
  id v11 = (uint64_t *)[v10 bytes];
  if (v11[1])
  {
    if (a4)
    {
      VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, @"Version %llu of memory graph is not supported by the currently installed tools", v12, v13, v14, v15, v16, v11[1]);
LABEL_20:
      uint64_t v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v17 = v11[2];
    if (v17 != -1)
    {
      uint64_t v12 = v11[3];
      if (v12 != -1 && v12 + v17 != -1)
      {
        [v10 subdataWithRange:];
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      }
    }
    if (a4)
    {
      VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, @"This platform cannot map in the memory graph plist at offset %llu of size %llu", v12, v13, v14, v15, v16, v11[2]);
      goto LABEL_20;
    }
  }
  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

- (id)decapsulateSupplementalData:(id)a3 forTag:(const char *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)[v5 length] < 0x31) {
    goto LABEL_3;
  }
  id v6 = v5;
  if (*(void *)[v6 bytes] != 0x48504152474D454DLL) {
    goto LABEL_3;
  }
  id v9 = v6;
  uint64_t v10 = [v9 bytes];
  if (!*(_DWORD *)(v10 + 40)) {
    goto LABEL_3;
  }
  uint64_t v11 = v10;
  int v12 = 0;
  while (1)
  {
    uint64_t v13 = *(void *)(v11 + 32) + v12 * *(unsigned __int16 *)(v11 + 44);
    if (v13 + 32 < (unint64_t)[v9 length])
    {
      id v14 = v9;
      uint64_t v15 = [v14 bytes];
      if (strlen(a4) >= 9) {
        -[VMUDirectedGraph decapsulateSupplementalData:forTag:]();
      }
      uint64_t v16 = (void *)(v15 + v13);
      strncpy(__dst, a4, 8uLL);
      if (*(void *)__dst == *v16) {
        break;
      }
    }
    if (++v12 >= *(_DWORD *)(v11 + 40)) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = v16[2];
  if (v17 == -1 || ((uint64_t v18 = v16[3], v18 != -1) ? (v19 = v18 + v17 == -1) : (v19 = 1), v19))
  {
LABEL_3:
    id v7 = 0;
  }
  else
  {
    id v7 = [v14 subdataWithRange:];
    if (kVMUPrintArchivingTiming)
    {
      double v20 = "";
      if (!v16[3]) {
        double v20 = "STACK LOGS FAILED TO SAVE";
      }
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Full Stack Log History] dataOffset: %llu  dataSize: %llu  %s\n\n", v16[2], v16[3], v20);
    }
  }

  return v7;
}

+ (BOOL)encapsulateData:(id)a3 to:(id)a4 withSupplementalDataTag:(const char *)a5 error:(id *)a6 dataGeneratorBlock:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (unsigned int (**)(id, void *))a7;
  uint64_t v14 = [v11 length];
  uint64_t v15 = v14 + 48;
  long long v42 = xmmword_1A7D79C70;
  uint64_t v43 = 48;
  uint64_t v44 = [v11 length];
  uint64_t v45 = v14 + 48;
  uint64_t v46 = 0x30002000000001;
  if (nsfilehandle_write(v12, (uint64_t)&v42, 48, (uint64_t)a6)
    && [v12 writeData:v11 error:a6])
  {
    uint64_t v16 = -(int)v14 & 0xFLL;
    uint64_t v37 = 0;
    double v38 = &v37;
    uint64_t v39 = 0x4010000000;
    uint64_t v17 = v14 + v16 + 80;
    v40 = &unk_1A7D91765;
    v41[0] = 0;
    v41[1] = 0;
    v41[2] = v17;
    v41[3] = 0;
    if (strlen(a5) > 8)
    {
      uint64_t v22 = "strlen(tag) <= 8";
      int v23 = 310;
    }
    else
    {
      strncpy((char *)v41, a5, 8uLL);
      if ([v12 offsetInFile] == v15)
      {
        if (!nsfilehandle_write(v12, (uint64_t)(v38 + 4), 32, (uint64_t)a6)
          || (*(void *)((char *)v36 + 7) = 0,
              v36[0] = 0,
              (nsfilehandle_write(v12, (uint64_t)v36, v16, (uint64_t)a6) & 1) == 0))
        {
          BOOL v20 = 0;
LABEL_19:
          _Block_object_dispose(&v37, 8);
          goto LABEL_20;
        }
        if ([v12 offsetInFile] == v17)
        {
          if (([v12 offsetInFile] & 0xF) == 0)
          {
            uint64_t v30 = 0;
            uint64_t v31 = &v30;
            uint64_t v32 = 0x3032000000;
            id v33 = __Block_byref_object_copy__9;
            double v34 = __Block_byref_object_dispose__9;
            id v35 = 0;
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __88__VMUDirectedGraph_encapsulateData_to_withSupplementalDataTag_error_dataGeneratorBlock___block_invoke;
            v26[3] = &unk_1E5D25AD8;
            id v18 = v12;
            id v27 = v18;
            uint64_t v28 = &v30;
            compression_status v29 = &v37;
            if (v13[2](v13, v26))
            {
              if (a6)
              {
                BOOL v19 = (void *)v31[5];
                if (v19)
                {
                  BOOL v20 = 0;
                  *a6 = v19;
LABEL_18:

                  _Block_object_dispose(&v30, 8);
                  goto LABEL_19;
                }
              }
            }
            else
            {
              [v18 seekToFileOffset:v15];
              if (nsfilehandle_write(v18, (uint64_t)(v38 + 4), 32, (uint64_t)a6))
              {
                [v18 seekToEndOfFile];
                BOOL v20 = 1;
                goto LABEL_18;
              }
            }
            BOOL v20 = 0;
            goto LABEL_18;
          }
          unsigned int v24 = "([fh offsetInFile] % 16) == 0";
          int v25 = 323;
        }
        else
        {
          unsigned int v24 = "[fh offsetInFile] == supplementalDataOffset";
          int v25 = 322;
        }
        __assert_rtn("+[VMUDirectedGraph encapsulateData:to:withSupplementalDataTag:error:dataGeneratorBlock:]", "VMUDirectedGraph.m", v25, v24);
      }
      uint64_t v22 = "[fh offsetInFile] == supplementalHeaderOffset";
      int v23 = 312;
    }
    __assert_rtn("+[VMUDirectedGraph encapsulateData:to:withSupplementalDataTag:error:dataGeneratorBlock:]", "VMUDirectedGraph.m", v23, v22);
  }
  BOOL v20 = 0;
LABEL_20:

  return v20;
}

uint64_t __88__VMUDirectedGraph_encapsulateData_to_withSupplementalDataTag_error_dataGeneratorBlock___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v6 + 40);
  int v7 = nsfilehandle_write(v5, a2, a3, (uint64_t)&obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7) {
    return 5;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1[6] + 8) + 56) += a3;
  return result;
}

- (id)decapsulateIPSheaderInData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (![v5 bytes]) {
    goto LABEL_25;
  }
  id v5 = v5;
  if (*(unsigned char *)[v5 bytes] != 123) {
    goto LABEL_25;
  }
  id v5 = v5;
  uint64_t v6 = [v5 bytes];
  if (*(unsigned char *)([v5 length] + v6 - 1) != 10) {
    goto LABEL_25;
  }
  id v5 = v5;
  int v7 = (char *)memchr((void *)[v5 bytes], 10, [v5 length]);
  if (!v7) {
    goto LABEL_25;
  }
  uint64_t v8 = v7;
  id v5 = v5;
  id v9 = &v8[-[v5 bytes]];
  uint64_t v10 = [v5 subdataWithRange:0, v9];
  id v34 = 0;
  id v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:1 error:&v34];
  id v12 = v34;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = v11;
    uint64_t v14 = [v5 length];
    uint64_t v15 = [v13 objectForKey:@"length"];
    uint64_t v16 = &v9[(int)([v15 intValue] + 2)];

    if ((char *)v14 == v16)
    {
      id v27 = [v13 objectForKey:@"bug_type"];
      if (v27
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && ([v27 isEqualToString:@"154"] & 1) != 0)
      {
        uint64_t v28 = [v5 subdataWithRange:NSMakeRange(v9 + 1, [v5 length] - (void)v9 - 2)];

        int v29 = 0;
        id v5 = (id)v28;
      }
      else
      {
        int v29 = 1;
        if (a4)
        {
          VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, @"Invalid bug type in IPS header.", v22, v23, v24, v25, v26, v33);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      goto LABEL_22;
    }
    if (!a4)
    {
      int v29 = 1;
      goto LABEL_22;
    }
    uint64_t v30 = @"IPS length is invalid.";
  }
  else
  {
    if (!a4)
    {
      int v29 = 1;
      goto LABEL_23;
    }
    id v13 = [v12 localizedDescription];
    uint64_t v33 = (uint64_t)v13;
    uint64_t v30 = @"Invalid IPS header: %@";
  }
  int v29 = 1;
  VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, v30, v17, v18, v19, v20, v21, v33);
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_23:
  if (v29)
  {
    uint64_t v31 = 0;
    goto LABEL_26;
  }
LABEL_25:
  id v5 = v5;
  uint64_t v31 = v5;
LABEL_26:

  return v31;
}

- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3
{
  return [(VMUDirectedGraph *)self initWithPlistRepresentation:a3 error:0];
}

- (VMUDirectedGraph)initWithPlistRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v6 = self;
  v73[2] = *MEMORY[0x1E4F143B8];
  int v7 = (void *)MEMORY[0x1AD0D9F90](self, a2);
  id v71 = 0;
  uint64_t v8 = [(VMUDirectedGraph *)v6 decapsulateIPSheaderInData:a3 error:&v71];
  id v9 = v71;
  if (!v8)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
LABEL_34:
    goto LABEL_35;
  }
  uint64_t v10 = [(VMUDirectedGraph *)v6 decapsulateSupplementalData:v8 forTag:"DISKLOGS"];
  id v11 = v10;
  if (v10 && ![v10 length])
  {
    uint64_t v17 = VMUDirectedGraphErrorWithExtraUserInfo(4u, 0, @"Memgraph file contained full stack log history header, but failed to store the actual stack log data.", v12, v13, v14, v15, v16, v62);

    id v11 = 0;
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v70 = v9;
  uint64_t v18 = [(VMUDirectedGraph *)v6 decapsulatePlistData:v8 error:&v70];
  id v19 = v70;

  if (!v18)
  {
LABEL_33:

    id v9 = v19;
    goto LABEL_34;
  }
  id v68 = 0;
  uint64_t v69 = 0;
  uint64_t v20 = [MEMORY[0x1E4F28F98] propertyListWithData:v18 options:0 format:&v69 error:&v68];
  id v21 = v68;

  if (!v20)
  {
LABEL_32:

    id v19 = v21;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v43 = VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, @"File does not contain a memory graph in the correct format", v22, v23, v24, v25, v26, v62);
    uint64_t v44 = v21;
LABEL_31:

    id v21 = (id)v43;
    goto LABEL_32;
  }
  id v27 = [v20 objectForKeyedSubscript:@"graphCompatibilityVersion"];
  v6->_uint64_t graphCompatibilityVersion = [v27 integerValue];

  uint64_t v28 = [v20 objectForKeyedSubscript:@"graphEncodingVersion"];
  v6->_int64_t graphVersion = [v28 integerValue];

  uint64_t graphCompatibilityVersion = v6->_graphCompatibilityVersion;
  if (!graphCompatibilityVersion || graphCompatibilityVersion >= 3)
  {
    v72[0] = @"VMUDirectedGraphCompatibilityVersionNumberInGraphKey";
    uint64_t v45 = [NSNumber numberWithInteger:];
    v72[1] = @"VMUDirectedGraphToolCompatibilityVersionKey";
    v73[0] = v45;
    v73[1] = &unk_1EFE40100;
    uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:2];

    if (v6->_graphCompatibilityVersion) {
      VMUDirectedGraphErrorWithExtraUserInfo(3u, v44, @"The graph version (%ld) is too new.  The latest graph version this tool supports is %d.", v46, v47, v48, v49, v50, v6->_graphCompatibilityVersion);
    }
    else {
    uint64_t v43 = VMUDirectedGraphErrorWithExtraUserInfo(2u, v44, @"File does not contain memory graph version information (not in correct format)", v46, v47, v48, v49, v50, v62);
    }

    goto LABEL_31;
  }
  uint64_t v30 = [v20 objectForKeyedSubscript:@"nodes"];
  v6->_unsigned int nodeCount = [v30 unsignedIntValue];

  uint64_t v31 = [v20 objectForKeyedSubscript:@"nodeNamespaceSize"];
  v6->_nextNodeName = [v31 unsignedIntValue];

  uint64_t v32 = [v20 objectForKeyedSubscript:@"edges"];
  v6->_externalEdges = [v32 unsignedIntValue];

  uint64_t v33 = [v20 objectForKeyedSubscript:@"edgeNamespaceSize"];
  v6->_nextEdgeName = [v33 unsignedIntValue];

  id v34 = [v20 objectForKeyedSubscript:@"additionalProperties"];
  uint64_t v35 = [v34 copy];
  additionalProperties = v6->_additionalProperties;
  v6->_additionalProperties = (NSDictionary *)v35;

  uint64_t v37 = [v20 objectForKey:@"graphIs64bit"];
  v66 = v37;
  if (v37)
  {
    int v38 = [v37 BOOLValue];
    v6->_graphIs64bit = v38;
    if ((v38 & 1) == 0 && (unsigned int nodeCount = v6->_nodeCount, nodeCount > 0x3FFFFFFE)
      || ((unsigned int nodeCount = v6->_nextNodeName, nodeCount < 0x3FFFFFFF) ? (v40 = 1) : (v40 = v38), v40 != 1))
    {
      long long v42 = "node";
      goto LABEL_28;
    }
    unsigned int nodeCount = v6->_nextEdgeName;
    if (nodeCount < 0x15555555) {
      char v41 = 1;
    }
    else {
      char v41 = v38;
    }
    if ((v41 & 1) == 0)
    {
      long long v42 = "reference";
LABEL_28:
      NSLog(&cfstr_MemoryGraphHas.isa, v42, nodeCount);
      VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, @"Memory graph is too large to open", v51, v52, v53, v54, v55, v63);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v56 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    v6->_graphIs64bit = 1;
  }
  uint64_t v64 = [v20 objectForKeyedSubscript:@"details"];
  int64_t graphVersion = v6->_graphVersion;
  v65 = [v20 objectForKeyedSubscript:@"options"];
  id v67 = v21;
  v61 = -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:](v6, "initWithArchived:version:options:diskLogs:error:", v64, graphVersion, [v65 unsignedIntValue], v11, &v67);
  id v9 = v67;

  id v56 = v61;
  id v21 = (id)v64;
  uint64_t v6 = v56;
LABEL_41:

  if (v56)
  {
    long long v58 = v56;

    if (!a4)
    {
      long long v57 = v17;
      goto LABEL_38;
    }
    long long v57 = v17;
    if (!v17) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_35:
  long long v57 = v17;

  long long v58 = 0;
  if (a4)
  {
    uint64_t v17 = v9;
    if (v9) {
LABEL_37:
    }
      *a4 = v17;
  }
LABEL_38:

  return v58;
}

- (VMUDirectedGraph)initWithArchived:(id)a3 version:(int64_t)a4 options:(unint64_t)a5 diskLogs:(id)a6 error:(id *)a7
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v55.receiver = self;
  v55.super_class = (Class)VMUDirectedGraph;
  uint64_t v12 = [(VMUDirectedGraph *)&v55 init];
  if (!v12)
  {
LABEL_51:
    uint64_t v43 = v12;
    goto LABEL_52;
  }
  uint64_t v13 = [v11 objectForKeyedSubscript:@"directedGraphInfo"];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"compactEdgeList"];
  if (!v14)
  {
    unint64_t v54 = 0;
    uint64_t v18 = [v13 objectForKeyedSubscript:@"sparseEdgeList"];
    v12->_edges = (_VMUDirectedGraphEdge *)+[VMUDirectedGraph _copyUnarchived:v18 length:&v54 options:a5];

    unint64_t v19 = v54 / 0xC;
    v12->_uint64_t edgeCount = v54 / 0xC;
    v12->_edgeCapacity = v19;
    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Sparse Edges] Edge Count: %u\n\n");
    }
    goto LABEL_42;
  }
  unsigned int v15 = [(VMUDirectedGraph *)v12 edgeNamespaceSize];
  v12->_uint64_t edgeCount = v15;
  v12->_edgeCapacity = v15;
  BOOL v16 = [(VMUDirectedGraph *)v12 graphIs64bit];
  uint64_t edgeCount = v12->_edgeCount;
  if (v16 || edgeCount < 0x15555555)
  {
    if (edgeCount) {
      uint64_t v20 = (_VMUDirectedGraphEdge *)malloc_type_malloc(12 * edgeCount, 0x10000403E1C8BA9uLL);
    }
    else {
      uint64_t v20 = 0;
    }
    v12->_edges = v20;
    unint64_t v54 = 0;
    id v21 = +[VMUDirectedGraph _copyUnarchived:v14 length:&v54 options:a5];
    uint64_t v22 = v21;
    uint64_t v23 = v12->_edgeCount;
    if (v54 < 4 * v23)
    {
      free(v21);
      if (a7)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v56 = *MEMORY[0x1E4F28568];
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
        *a7 = [v24 errorWithDomain:@"com.apple.dt.Symbolication.VMUDirectedGraph" code:1 userInfo:v25];
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[VMUDirectedGraph initWithArchived:version:options:diskLogs:error:]();
      }
      goto LABEL_39;
    }
    unsigned int nextNodeName = v12->_nextNodeName;
    if (nextNodeName)
    {
      char v27 = 0;
      unsigned int v28 = v12->_nextNodeName;
      do
      {
        ++v27;
        BOOL v29 = v28 > 1;
        v28 >>= 1;
      }
      while (v29);
      if (a4 >= 2)
      {
LABEL_30:
        if (v23)
        {
          unint64_t v35 = 0;
          unsigned int v36 = 0;
          int v37 = 0;
          int v38 = 0;
          p_var2 = &v12->_edges->var2;
          do
          {
            unsigned int v40 = *((_DWORD *)v21 + v36);
            if ((v40 & 0x80000000) != 0)
            {
              ++v37;
              int v38 = v40 & 0x7FFFFFFF;
              int v41 = *((_DWORD *)v21 + v36 + 1) & 0x7FFFFFFF;
              int v42 = 2;
            }
            else
            {
              v38 += v40 >> v27;
              int v41 = v40 & ~(-1 << v27);
              int v42 = 1;
            }
            *(p_var2 - 2) = v35;
            *(p_var2 - 1) = v38;
            _DWORD *p_var2 = v41;
            p_var2 += 3;
            v36 += v42;
            ++v35;
          }
          while (v35 < v12->_edgeCount);
        }
        goto LABEL_40;
      }
      unsigned int v30 = 0;
      do
      {
        ++v30;
        BOOL v31 = nextNodeName >= 2;
        nextNodeName >>= 1;
      }
      while (v31);
    }
    else
    {
      unsigned int v30 = 0;
      char v27 = 0;
      if (a4 >= 2) {
        goto LABEL_30;
      }
    }
    if (v23)
    {
      unsigned int v32 = 0;
      unsigned int v33 = v12->_edgeCount;
      do
      {
        ++v32;
        BOOL v29 = v33 > 1;
        v33 >>= 1;
      }
      while (v29);
      if (v30 <= v32)
      {
        char v27 = 0;
        unsigned int v34 = v12->_edgeCount;
        do
        {
          ++v27;
          BOOL v29 = v34 > 1;
          v34 >>= 1;
        }
        while (v29);
        goto LABEL_30;
      }
    }
    else if (!v30)
    {
LABEL_40:
      free(v21);
      if (kVMUPrintArchivingTiming) {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Dense Edges] Compact: %d Large: %d (%2.2f%%)\n\n");
      }
LABEL_42:
      uint64_t v44 = [v13 objectForKeyedSubscript:@"inverted"];
      v12->_inverted = [v44 BOOLValue];

      uint64_t v45 = [v13 objectForKeyedSubscript:@"deadNodes"];
      v12->_deadNodes = +[VMUDirectedGraph _copyUnarchived:v45 length:0 options:a5];

      deadNodes = (unsigned int *)v12->_deadNodes;
      if (deadNodes && kVMUPrintArchivingTiming)
      {
        unint64_t v47 = *deadNodes;
        if (v47)
        {
          unint64_t v48 = 0;
          int v49 = 0;
          uint64_t v50 = (unsigned __int8 *)(deadNodes + 1);
          do
          {
            unsigned int v51 = *v50++;
            uint8x8_t v52 = (uint8x8_t)vcnt_s8((int8x8_t)v51);
            v52.i16[0] = vaddlv_u8(v52);
            v49 += v52.i32[0];
            v48 += 8;
          }
          while (v48 < v47);
        }
        else
        {
          int v49 = 0;
        }
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Dead Nodes Marking Map] Count: %u\n\n", v49);
      }
      v12->_indexedEdges = -1;

      goto LABEL_51;
    }
    NSLog(&cfstr_MemgraphFileIs.isa);
    free(v22);
    goto LABEL_39;
  }
  NSLog(&cfstr_MemoryGraphHas.isa, "reference", edgeCount);
LABEL_39:

  uint64_t v43 = 0;
LABEL_52:

  return v43;
}

- (void)archiveDictionaryRepresentation:(id)a3 options:(unint64_t)a4
{
  id v34 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((a4 & 2) != 0) {
    goto LABEL_29;
  }
  uint64_t edgeCount = self->_edgeCount;
  if (edgeCount == self->_nextEdgeName && (self->_nextNodeName & 0x80000000) == 0)
  {
    [(VMUDirectedGraph *)self _reorderEdgesNaturally];
    unsigned int nextNodeName = self->_nextNodeName;
    if (nextNodeName)
    {
      char v9 = 0;
      do
      {
        ++v9;
        BOOL v10 = nextNodeName > 1;
        nextNodeName >>= 1;
      }
      while (v10);
    }
    else
    {
      char v9 = 0;
    }
    uint64_t v12 = self->_edgeCount;
    if (v12)
    {
      uint64_t v13 = malloc_type_malloc(8 * v12, 0x6D61922EuLL);
      uint64_t v14 = v13;
      if (self->_edgeCount)
      {
        uint64_t v15 = 0;
        unint64_t v16 = 0;
        int v17 = 0;
        unsigned int v18 = 0;
        do
        {
          if (v15 * 12)
          {
            unint64_t v19 = &self->_edges[v15];
            unsigned int var1 = v19[-1].var1;
            LODWORD(v19) = v19->var1;
            BOOL v21 = v19 >= var1;
            unsigned int v22 = v19 - var1;
            if (!v21) {
              unsigned int v22 = -1;
            }
          }
          else
          {
            unsigned int v22 = -1;
          }
          if (v22 <= (0x80000000 >> v9) - 1)
          {
            *((_DWORD *)v13 + v18) = (self->_edges[v15].var2 | (v22 << v9)) & 0x7FFFFFFF;
          }
          else
          {
            ++v17;
            *((_DWORD *)v13 + v18++) = self->_edges[v15].var1 | 0x80000000;
            *((_DWORD *)v13 + v18) = self->_edges[v15].var2 | 0x80000000;
          }
          ++v18;
          ++v16;
          ++v15;
        }
        while (v16 < self->_edgeCount);
        uint64_t v23 = 4 * v18;
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v23 = 0;
LABEL_25:
    uint64_t v24 = +[VMUDirectedGraph _archivedBytes:v14 length:v23 options:a4];
    [v6 setObject:v24 forKeyedSubscript:@"compactEdgeList"];

    if (v14) {
      free(v14);
    }
    if (kVMUPrintArchivingTiming) {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Dense Edges] Compact: %d Large: %d (%2.2f%%)\n\n");
    }
    goto LABEL_29;
  }
  id v11 = +[VMUDirectedGraph _archivedBytes:self->_edges length:12 * edgeCount options:a4];
  [v6 setObject:v11 forKeyedSubscript:@"sparseEdgeList"];

  if (kVMUPrintArchivingTiming) {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Sparse Edges] Edge Count: %u\n\n");
  }
LABEL_29:
  if (self->_nodeCount != self->_nextNodeName)
  {
    uint64_t v25 = +[VMUDirectedGraph _archivedBytes:length:options:](VMUDirectedGraph, "_archivedBytes:length:options:");
    [v6 setObject:v25 forKeyedSubscript:@"deadNodes"];

    if (kVMUPrintArchivingTiming)
    {
      deadNodes = (unsigned int *)self->_deadNodes;
      unint64_t v27 = *deadNodes;
      if (v27)
      {
        unint64_t v28 = 0;
        int v29 = 0;
        unsigned int v30 = (unsigned __int8 *)(deadNodes + 1);
        do
        {
          unsigned int v31 = *v30++;
          uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v31);
          v32.i16[0] = vaddlv_u8(v32);
          v29 += v32.i32[0];
          v28 += 8;
        }
        while (v28 < v27);
      }
      else
      {
        int v29 = 0;
      }
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "[Dead Nodes Marking Map] Count: %u\n\n", v29);
    }
  }
  unsigned int v33 = [NSNumber numberWithBool:self->_inverted];
  [v6 setObject:v33 forKeyedSubscript:@"inverted"];

  [v34 setObject:v6 forKeyedSubscript:@"directedGraphInfo"];
}

- (id)plistRepresentationWithOptions:(unint64_t)a3
{
  return [(VMUDirectedGraph *)self plistRepresentationWithOptions:a3 fromOriginalMemgraph:0];
}

- (id)plistRepresentationWithOptions:(unint64_t)a3 fromOriginalMemgraph:(id)a4
{
  id v6 = a4;
  int v7 = (void *)MEMORY[0x1AD0D9F90]();
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  char v9 = [NSNumber numberWithInteger:self->_graphVersion];
  [v8 setObject:v9 forKeyedSubscript:@"graphEncodingVersion"];

  BOOL v10 = [NSNumber numberWithInteger:self->_graphCompatibilityVersion];
  [v8 setObject:v10 forKeyedSubscript:@"graphCompatibilityVersion"];

  id v11 = [NSNumber numberWithBool:self->_graphIs64bit];
  [v8 setObject:v11 forKeyedSubscript:@"graphIs64bit"];

  uint64_t v12 = [NSNumber numberWithUnsignedInt:self->_nodeCount];
  [v8 setObject:v12 forKeyedSubscript:@"nodes"];

  uint64_t v13 = [NSNumber numberWithUnsignedInt:self->_nextNodeName];
  [v8 setObject:v13 forKeyedSubscript:@"nodeNamespaceSize"];

  if ((a3 & 2) == 0)
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInt:self->_externalEdges];
    [v8 setObject:v14 forKeyedSubscript:@"edges"];
  }
  uint64_t v15 = [NSNumber numberWithUnsignedInt:self->_nextEdgeName];
  [v8 setObject:v15 forKeyedSubscript:@"edgeNamespaceSize"];

  unint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v16 forKeyedSubscript:@"options"];

  int v17 = [MEMORY[0x1E4F1CA60] dictionary];
  [(VMUDirectedGraph *)self archiveDictionaryRepresentation:v17 options:a3];
  [v8 setObject:v17 forKeyedSubscript:@"details"];
  additionalProperties = self->_additionalProperties;
  if (additionalProperties) {
    [v8 setObject:additionalProperties forKeyedSubscript:@"additionalProperties"];
  }
  if (!v6) {
    goto LABEL_9;
  }
  unint64_t v19 = (void *)MEMORY[0x1E4F28F98];
  uint64_t v20 = [(VMUDirectedGraph *)self decapsulatePlistData:v6 error:0];
  id v41 = 0;
  BOOL v21 = [v19 propertyListWithData:v20 options:0 format:0 error:&v41];
  id v22 = v41;

  if (v21)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __72__VMUDirectedGraph_plistRepresentationWithOptions_fromOriginalMemgraph___block_invoke;
      v39[3] = &unk_1E5D249B0;
      id v40 = v8;
      [v21 enumerateKeysAndObjectsUsingBlock:v39];

LABEL_9:
      unint64_t v28 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:0];
      goto LABEL_13;
    }
    id v36 = VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, @"File does not contain a memory graph in the correct format", v23, v24, v25, v26, v27, v38);
  }
  else
  {
    int v29 = [v22 localizedFailureReason];
    id v35 = VMUDirectedGraphErrorWithExtraUserInfo(1u, 0, @"Unable to deserialize the memgraph %@", v30, v31, v32, v33, v34, (uint64_t)v29);
  }
  unint64_t v28 = 0;
LABEL_13:

  return v28;
}

void __72__VMUDirectedGraph_plistRepresentationWithOptions_fromOriginalMemgraph___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (void)dealloc
{
  deadNodes = self->_deadNodes;
  if (deadNodes)
  {
    free(deadNodes);
    self->_deadNodes = 0;
  }
  nodeAdjIndex = self->_nodeAdjIndex;
  if (nodeAdjIndex)
  {
    free(nodeAdjIndex);
    self->_nodeAdjIndex = 0;
  }
  edges = self->_edges;
  if (edges)
  {
    free(edges);
    self->_edges = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VMUDirectedGraph;
  [(VMUDirectedGraph *)&v6 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithNodes:self->_nextNodeName];
  *(_DWORD *)(v4 + 24) = self->_nodeCount;
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    unsigned int v6 = *deadNodes;
    id v7 = malloc_type_calloc(1uLL, ((*deadNodes + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *id v7 = v6;
    *(void *)(v4 + 40) = v7;
    uint64_t v8 = (unsigned int *)self->_deadNodes;
    unsigned int v9 = *v8;
    if (v6 < *v8) {
      unsigned int v9 = v6;
    }
    unint64_t v10 = v9 + 7;
    if (v10 >= 8)
    {
      id v11 = (char *)(v8 + 1);
      uint64_t v12 = v7 + 1;
      unint64_t v13 = v10 >> 3;
      do
      {
        char v14 = *v11++;
        *v12++ |= v14;
        --v13;
      }
      while (v13);
    }
  }
  unsigned int edgeCount = self->_edgeCount;
  *(_DWORD *)(v4 + 28) = edgeCount;
  *(_DWORD *)(v4 + 32) = edgeCount;
  *(_DWORD *)(v4 + 36) = self->_externalEdges;
  *(_DWORD *)(v4 + 52) = self->_nextEdgeName;
  unint64_t v16 = malloc_type_malloc(12 * self->_edgeCount, 0x10000403E1C8BA9uLL);
  *(void *)(v4 + 64) = v16;
  memcpy(v16, self->_edges, 12 * self->_edgeCount);
  *(void *)(v4 + 80) = -1;
  uint64_t v17 = [(NSDictionary *)self->_additionalProperties copy];
  unsigned int v18 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v17;

  *(unsigned char *)(v4 + 92) = self->_inverted;
  *(unsigned char *)(v4 + 93) = self->_graphIs64bit;
  return (id)v4;
}

- (unsigned)addNode
{
  ++self->_nodeCount;
  unsigned int nextNodeName = self->_nextNodeName;
  self->_unsigned int nextNodeName = nextNodeName + 1;
  return nextNodeName;
}

- (void)_internalAddEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4 withName:
{
  if (result)
  {
    id v7 = result;
    unsigned int v8 = *((_DWORD *)result + 7);
    uint64_t v9 = *((unsigned int *)result + 8);
    if (v8 >= v9)
    {
      LODWORD(v10) = 2 * v9;
      if ((2 * v9) <= 0x100) {
        unint64_t v10 = 256;
      }
      else {
        unint64_t v10 = v10;
      }
      unint64_t v11 = v9 + 174762;
      if (v11 >= v10) {
        unint64_t v12 = v10;
      }
      else {
        unint64_t v12 = v11;
      }
      uint64_t result = (void **)malloc_type_realloc(result[8], 12 * v12, 0x10000403E1C8BA9uLL);
      v7[8] = result;
      if (!result)
      {
        NSLog(&cfstr_OutOfMemoryFai_0.isa, *((unsigned int *)v7 + 8), v12);
        abort();
      }
      *((_DWORD *)v7 + 8) = v12;
      unsigned int v8 = *((_DWORD *)v7 + 7);
    }
    else
    {
      uint64_t result = (void **)result[8];
    }
    if (*((unsigned char *)v7 + 92)) {
      unsigned int v13 = a2;
    }
    else {
      unsigned int v13 = a3;
    }
    if (*((unsigned char *)v7 + 92)) {
      unsigned int v14 = a3;
    }
    else {
      unsigned int v14 = a2;
    }
    uint64_t v15 = (unsigned int *)result + 3 * v8;
    unsigned int *v15 = a4;
    v15[1] = v14;
    v15[2] = v13;
    ++*((_DWORD *)v7 + 7);
    if (a4 <= 0xFFFFFFFA) {
      ++*((_DWORD *)v7 + 9);
    }
  }
  return result;
}

- (unsigned)addEdgeFromNode:(unsigned int)a3 toNode:(unsigned int)a4
{
  unsigned int nextNodeName = self->_nextNodeName;
  if (nextNodeName <= a3 || nextNodeName <= a4) {
    return -1;
  }
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    if (*deadNodes > a3 && ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) != 0
      || *deadNodes > a4 && ((*((unsigned __int8 *)deadNodes + (a4 >> 3) + 4) >> (a4 & 7)) & 1) != 0)
    {
      return -1;
    }
  }
  if (self->_inverted) {
    unsigned int v9 = a4;
  }
  else {
    unsigned int v9 = a3;
  }
  if (!self->_inverted) {
    a3 = a4;
  }
  -[VMUDirectedGraph _internalAddEdgeFromNode:toNode:withName:]((void **)&self->super.isa, v9, a3, self->_nextEdgeName);
  unsigned int result = self->_nextEdgeName;
  self->_nextEdgeName = result + 1;
  return result;
}

- (void)_removeEdges:(id)a3
{
  uint64_t v17 = (unsigned int (**)(id, void, unint64_t))a3;
  if (v17)
  {
    unsigned int edgeCount = self->_edgeCount;
    if (edgeCount)
    {
      for (unsigned int i = 0; i < edgeCount; ++i)
      {
        id v7 = &self->_edges[i];
        unint64_t v3 = v3 & 0xFFFFFFFF00000000 | v7->var2;
        if (v17[2](v17, *(void *)&v7->var0, v3))
        {
          edges = self->_edges;
          unsigned int v9 = &edges[i];
          if (v9->var0 <= 0xFFFFFFFA) {
            --self->_externalEdges;
          }
          unsigned int v10 = self->_edgeCount - 1;
          self->_unsigned int edgeCount = v10;
          uint64_t v11 = *(void *)&v9->var0;
          unsigned int var2 = v9->var2;
          unsigned int v13 = &edges[v10];
          unsigned int v14 = v13->var2;
          *(void *)&v9->var0 = *(void *)&v13->var0;
          v9->unsigned int var2 = v14;
          uint64_t v15 = &self->_edges[self->_edgeCount];
          v15->unsigned int var2 = var2;
          *(void *)&v15->var0 = v11;
          --i;
        }
        unsigned int edgeCount = self->_edgeCount;
      }
    }
    if (edgeCount < self->_edgeCapacity >> 1)
    {
      unsigned int v16 = ((double)edgeCount * 1.05);
      self->_edgeCapacity = v16;
      self->_edges = (_VMUDirectedGraphEdge *)malloc_type_realloc(self->_edges, 12 * v16, 0x10000403E1C8BA9uLL);
    }
  }
}

- (void)_faultDeadNodeMap
{
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes)
  {
    unsigned int v5 = *deadNodes;
    unsigned int nextNodeName = self->_nextNodeName;
    if (v5 >= nextNodeName) {
      return;
    }
    unsigned int v7 = ((double)nextNodeName * 1.25);
    unsigned int v8 = malloc_type_calloc(1uLL, ((v7 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *unsigned int v8 = v7;
    unsigned int v9 = (unsigned int *)self->_deadNodes;
    unsigned int v10 = *v9;
    if (v7 < *v9) {
      unsigned int v10 = v7;
    }
    unint64_t v11 = v10 + 7;
    if (v11 >= 8)
    {
      unint64_t v12 = (char *)(v9 + 1);
      unsigned int v13 = v8 + 1;
      unint64_t v14 = v11 >> 3;
      do
      {
        char v15 = *v12++;
        *v13++ |= v15;
        --v14;
      }
      while (v14);
      unsigned int v9 = (unsigned int *)self->_deadNodes;
    }
    free(v9);
  }
  else
  {
    LODWORD(v2) = self->_nextNodeName;
    unsigned int v16 = ((double)v2 * 1.05);
    unsigned int v8 = malloc_type_calloc(1uLL, ((v16 + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *unsigned int v8 = v16;
  }
  self->_deadNodes = v8;
}

- (void)deadNodeMap
{
  return self->_deadNodes;
}

- (void)removeMarkedNodes:(void *)a3
{
  if (a3)
  {
    [(VMUDirectedGraph *)self _faultDeadNodeMap];
    unsigned int nextNodeName = self->_nextNodeName;
    unsigned int v6 = (unsigned __int8 *)malloc_type_calloc(1uLL, ((nextNodeName + 7) >> 3) + 4, 0xFF42C4F3uLL);
    unsigned int v7 = v6;
    *(_DWORD *)unsigned int v6 = nextNodeName;
    unsigned int v8 = *(_DWORD *)a3;
    if (nextNodeName < *(_DWORD *)a3) {
      unsigned int v8 = nextNodeName;
    }
    unint64_t v9 = v8 + 7;
    if (v9 >= 8)
    {
      unsigned int v10 = (char *)a3 + 4;
      unint64_t v11 = v6 + 4;
      unint64_t v12 = v9 >> 3;
      do
      {
        char v13 = *v10++;
        *v11++ |= v13;
        --v12;
      }
      while (v12);
    }
    deadNodes = self->_deadNodes;
    int v15 = *deadNodes;
    unint64_t v16 = (*deadNodes + 7);
    if (v16 >= 8)
    {
      uint64_t v17 = deadNodes + 1;
      uint64_t v18 = v16 >> 3;
      if (v16 >> 3 <= 1) {
        uint64_t v18 = 1;
      }
      do
      {
        *uint64_t v17 = ~*v17;
        ++v17;
        --v18;
      }
      while (v18);
    }
    int v19 = v15 & 7;
    if (v19) {
      *((unsigned char *)deadNodes + (v16 >> 3) + 3) ^= -1 << v19;
    }
    uint64_t v20 = self->_deadNodes;
    int v21 = *(_DWORD *)v6;
    int v22 = *v20;
    if (*(_DWORD *)v6 >= *v20) {
      int v21 = *v20;
    }
    unint64_t v23 = (v21 + 7);
    if (v23 >= 8)
    {
      uint64_t v24 = v6 + 4;
      uint64_t v25 = (char *)(v20 + 1);
      unint64_t v26 = v23 >> 3;
      do
      {
        char v27 = *v25++;
        *v24++ &= v27;
        --v26;
      }
      while (v26);
      uint64_t v20 = self->_deadNodes;
      int v22 = *v20;
    }
    unint64_t v28 = (v22 + 7);
    if (v28 >= 8)
    {
      int v29 = v20 + 1;
      uint64_t v30 = v28 >> 3;
      if (v28 >> 3 <= 1) {
        uint64_t v30 = 1;
      }
      do
      {
        *int v29 = ~*v29;
        ++v29;
        --v30;
      }
      while (v30);
    }
    int v31 = v22 & 7;
    if (v31) {
      *((unsigned char *)v20 + (v28 >> 3) + 3) ^= -1 << v31;
    }
    unint64_t edgeCount = self->_edgeCount;
    if (edgeCount)
    {
      uint64_t v33 = 0;
      for (unint64_t i = 0; i < edgeCount; ++i)
      {
        edges = self->_edges;
        if (edges[v33].var0 == -3)
        {
          unint64_t var2 = edges[v33].var2;
          if (*(_DWORD *)v6 > var2 && ((v6[(var2 >> 3) + 4] >> (var2 & 7)) & 1) != 0)
          {
            unint64_t var1 = edges[v33].var1;
            if (*(_DWORD *)v6 > var1)
            {
              v6[(var1 >> 3) + 4] |= 1 << (var1 & 7);
              unint64_t edgeCount = self->_edgeCount;
            }
          }
        }
        ++v33;
      }
    }
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __38__VMUDirectedGraph_removeMarkedNodes___block_invoke;
    v48[3] = &__block_descriptor_40_e34_B20__0__VMUDirectedGraphEdge_III_8l;
    v48[4] = v6;
    [(VMUDirectedGraph *)self _removeEdges:v48];
    uint64_t v39 = self->_deadNodes;
    int v40 = *v39;
    if (*v39 >= *(_DWORD *)v7) {
      int v40 = *(_DWORD *)v7;
    }
    unint64_t v41 = (v40 + 7);
    if (v41 >= 8)
    {
      int v42 = 0;
      uint64_t v43 = v7 + 4;
      uint64_t v44 = (unsigned __int8 *)(v39 + 1);
      unint64_t v45 = v41 >> 3;
      do
      {
        int v46 = *v43++;
        int v47 = *v44;
        v38.i32[0] = v46 & ~v47;
        int8x8_t v38 = vcnt_s8(v38);
        v38.i16[0] = vaddlv_u8((uint8x8_t)v38);
        v42 += v38.i32[0];
        *v44++ = v47 | v46;
        --v45;
      }
      while (v45);
    }
    else
    {
      int v42 = 0;
    }
    self->_nodeCount -= v42;
    free(v7);
    if (self->_insideSearch) {
      [MEMORY[0x1E4F1CA00] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
    }
    else {
      self->_indexedEdges = -1;
    }
  }
}

uint64_t __38__VMUDirectedGraph_removeMarkedNodes___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3 = *(unsigned int **)(a1 + 32);
  if (*v3 > HIDWORD(a2) && ((*((unsigned __int8 *)v3 + (HIDWORD(a2) >> 3) + 4) >> (BYTE4(a2) & 7)) & 1) != 0) {
    return 1;
  }
  if (*v3 <= a3) {
    return 0;
  }
  return (*((unsigned __int8 *)v3 + (a3 >> 3) + 4) >> (a3 & 7)) & 1;
}

- (void)removeMarkedEdges:(void *)a3
{
  if (a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__VMUDirectedGraph_removeMarkedEdges___block_invoke;
    v4[3] = &__block_descriptor_40_e34_B20__0__VMUDirectedGraphEdge_III_8l;
    v4[4] = a3;
    [(VMUDirectedGraph *)self _removeEdges:v4];
    if (self->_insideSearch) {
      [MEMORY[0x1E4F1CA00] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
    }
    else {
      self->_indexedEdges = -1;
    }
  }
}

uint64_t __38__VMUDirectedGraph_removeMarkedEdges___block_invoke(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2) {
    return 0;
  }
  else {
    return (*((unsigned __int8 *)v2 + (a2 >> 3) + 4) >> (a2 & 7)) & 1;
  }
}

- (BOOL)isNodePresent:(unsigned int)a3
{
  if (self->_nextNodeName <= a3) {
    return 0;
  }
  deadNodes = (unsigned int *)self->_deadNodes;
  return !deadNodes
      || *deadNodes <= a3
      || ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) == 0
      || -[VMUDirectedGraph parentGroupForNode:](self, "parentGroupForNode:") != -1;
}

- (unsigned)addGroupNodeForNodes:(const unsigned int *)a3 count:(unsigned int)a4
{
  unsigned int nextNodeName = -1;
  if (a3 && a4 >= 2)
  {
    unsigned int v5 = (unsigned int *)a3;
    uint64_t v7 = 0;
    unsigned int nextNodeName = self->_nextNodeName;
    uint64_t v8 = a4;
    uint64_t v9 = a4;
    unsigned int v10 = a3;
    while (1)
    {
      unsigned int v12 = *v10++;
      unint64_t v11 = v12;
      if (v12 < nextNodeName)
      {
        deadNodes = self->_deadNodes;
        if (!deadNodes
          || *deadNodes <= v11
          || ((*((unsigned __int8 *)deadNodes + (v11 >> 3) + 4) >> (v11 & 7)) & 1) == 0)
        {
          break;
        }
      }
      uint64_t v14 = v7;
LABEL_10:
      uint64_t v7 = v14;
      if (!--v9) {
        return -1;
      }
    }
    uint64_t v14 = 1;
    if (!v7) {
      goto LABEL_10;
    }
    ++self->_nodeCount;
    self->_unsigned int nextNodeName = nextNodeName + 1;
    [(VMUDirectedGraph *)self _faultDeadNodeMap];
    while (1)
    {
      unint64_t v15 = *v5;
      if (v15 < self->_nextNodeName)
      {
        unint64_t v16 = self->_deadNodes;
        if (*v16 <= v15) {
          goto LABEL_17;
        }
        uint64_t v17 = (v15 >> 3) + 4;
        int v18 = *((unsigned __int8 *)v16 + v17);
        int v19 = 1 << (v15 & 7);
        if ((v19 & v18) == 0) {
          break;
        }
      }
LABEL_18:
      ++v5;
      if (!--v8) {
        return nextNodeName;
      }
    }
    *((unsigned char *)v16 + v17) = v18 | v19;
LABEL_17:
    --self->_nodeCount;
    -[VMUDirectedGraph _internalAddEdgeFromNode:toNode:withName:]((void **)&self->super.isa, nextNodeName, *v5, 0xFFFFFFFE);
    goto LABEL_18;
  }
  return nextNodeName;
}

- (void)ungroupNode:(unsigned int)a3
{
  deadNodes = (unsigned int *)self->_deadNodes;
  if (deadNodes
    && self->_nextNodeName > a3
    && (*deadNodes <= a3 || ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) == 0))
  {
    uint64_t v9 = 0;
    unsigned int v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__VMUDirectedGraph_ungroupNode___block_invoke;
    v7[3] = &unk_1E5D25B20;
    unsigned int v8 = a3;
    v7[4] = self;
    v7[5] = &v9;
    [(VMUDirectedGraph *)self _removeEdges:v7];
    if (*((unsigned char *)v10 + 24))
    {
      unsigned int v6 = (unsigned int *)self->_deadNodes;
      if (*v6 > a3) {
        *((unsigned char *)v6 + (a3 >> 3) + 4) |= 1 << (a3 & 7);
      }
      --self->_nodeCount;
      if (self->_insideSearch) {
        [MEMORY[0x1E4F1CA00] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
      }
      else {
        self->_indexedEdges = -1;
      }
    }
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __32__VMUDirectedGraph_ungroupNode___block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (__PAIR64__(*(_DWORD *)(a1 + 48), -2) != a2) {
    return 0;
  }
  unint64_t v3 = *(unsigned int **)(*(void *)(a1 + 32) + 40);
  if (*v3 > a3) {
    *((unsigned char *)v3 + (a3 >> 3) + 4) &= ~(1 << (a3 & 7));
  }
  uint64_t v4 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  ++*(_DWORD *)(*(void *)(a1 + 32) + 24);
  return v4;
}

- (void)setInverted:(BOOL)a3
{
  self->_inverted = a3;
  if (self->_insideSearch) {
    [MEMORY[0x1E4F1CA00] raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
  }
  else {
    self->_indexedEdges = -1;
  }
}

- (BOOL)inverted
{
  return self->_inverted;
}

- (unsigned)pointerSize
{
  if (self->_graphIs64bit) {
    return 8;
  }
  else {
    return 4;
  }
}

- (BOOL)_adjustAdjacencyMap
{
  unsigned int nextNodeName = self->_nextNodeName;
  if (nextNodeName)
  {
    unsigned int indexedNodeSpace = self->_indexedNodeSpace;
    if (indexedNodeSpace < nextNodeName || indexedNodeSpace == -1)
    {
      self->_unsigned int indexedNodeSpace = nextNodeName;
      BOOL v6 = [(VMUDirectedGraph *)self graphIs64bit];
      uint64_t v7 = self->_indexedNodeSpace;
      if (!v6 && v7 >= 0x3FFFFFFF)
      {
        NSLog(&cfstr_MemoryGraphHas.isa, "node", v7);
        return 0;
      }
      nodeAdjIndex = (unsigned int *)malloc_type_realloc(self->_nodeAdjIndex, 4 * v7, 0x100004052888210uLL);
      self->_nodeAdjIndex = nodeAdjIndex;
      unsigned int indexedNodeSpace = self->_indexedNodeSpace;
    }
    else
    {
      nodeAdjIndex = self->_nodeAdjIndex;
    }
    bzero(nodeAdjIndex, 4 * indexedNodeSpace);
    if (self->_edgeCount)
    {
      unint64_t v10 = 0;
      int v11 = 0;
      p_uint64_t var1 = &self->_edges->var1;
      do
      {
        int v13 = *(p_var1 - 1);
        if (v13 != -3)
        {
          if (v13 == -2)
          {
            v11 += 3;
            uint64_t v14 = self->_nodeAdjIndex;
            unint64_t v15 = p_var1 + 1;
            ++v14[*p_var1];
            int v16 = 2;
          }
          else
          {
            uint64_t v14 = self->_nodeAdjIndex;
            if (self->_inverted) {
              unint64_t v15 = p_var1 + 1;
            }
            else {
              unint64_t v15 = p_var1;
            }
            int v16 = 1;
          }
          v14[*v15] += v16;
        }
        p_var1 += 3;
        ++v10;
        unint64_t edgeCount = self->_edgeCount;
      }
      while (v10 < edgeCount);
    }
    else
    {
      int v11 = 0;
      LODWORD(edgeCount) = 0;
    }
    unsigned int v18 = self->_externalEdges + v11;
    if (self->_edgeCapacity <= v18) {
      unsigned int edgeCapacity = self->_externalEdges + v11;
    }
    else {
      unsigned int edgeCapacity = self->_edgeCapacity;
    }
    self->_unsigned int edgeCapacity = edgeCapacity;
    if (edgeCapacity) {
      BOOL v20 = 1;
    }
    else {
      BOOL v20 = (edgeCount | v11) == 0;
    }
    if (!v20) {
      -[VMUDirectedGraph _adjustAdjacencyMap]();
    }
    if (self->_indexedNodeSpace)
    {
      unint64_t v21 = 0;
      unsigned int v22 = 0;
      unint64_t v23 = self->_nodeAdjIndex;
      do
      {
        v22 += v23[v21];
        v23[v21++] = v22;
      }
      while (v21 < self->_indexedNodeSpace);
      unsigned int edgeCapacity = self->_edgeCapacity;
    }
    if (edgeCapacity) {
      uint64_t v24 = (_VMUDirectedGraphEdge *)malloc_type_malloc(12 * edgeCapacity, 0x10000403E1C8BA9uLL);
    }
    else {
      uint64_t v24 = 0;
    }
    unsigned int v25 = self->_edgeCount;
    if (v25)
    {
      unsigned int v26 = 0;
      int v27 = -1;
      do
      {
        unint64_t v28 = v25 + v27;
        edges = self->_edges;
        uint64_t v30 = &edges[v28];
        if (v30->var0 != -3)
        {
          if (v30->var0 == -2)
          {
            int v31 = self->_nodeAdjIndex;
            unint64_t v32 = v28;
            uint64_t var1 = edges[v32].var1;
            unsigned int v34 = v31[var1] - 1;
            v31[var1] = v34;
            id v35 = &v24[v34];
            uint64_t v36 = *(void *)&v30->var0;
            v35->uint64_t var2 = v30->var2;
            *(void *)&v35->var0 = v36;
            int v37 = self->_nodeAdjIndex;
            int8x8_t v38 = &self->_edges[v32];
            LODWORD(v36) = v38->var1;
            uint64_t var2 = v38->var2;
            unsigned int v40 = v37[var2] - 1;
            v37[var2] = v40;
            unint64_t v41 = &v24[v40];
            v41->var0 = -3;
            v41->uint64_t var1 = var2;
            v41->uint64_t var2 = v36;
            uint64_t v42 = v38->var2;
            LODWORD(v41) = v37[v42] - 1;
            v37[v42] = v41;
            uint64_t v43 = &v24[v41];
            v43->var0 = -3;
            v43->uint64_t var1 = var2;
            v43->uint64_t var2 = v36;
          }
          else
          {
            uint64_t v44 = self->_nodeAdjIndex;
            unint64_t v45 = &edges[v28];
            p_uint64_t var2 = &v45->var2;
            int v47 = &v45->var1;
            if (self->_inverted) {
              int v47 = p_var2;
            }
            uint64_t v48 = *v47;
            unsigned int v49 = v44[v48] - 1;
            v44[v48] = v49;
            uint64_t v50 = &v24[v49];
            uint64_t v51 = *(void *)&v30->var0;
            v50->uint64_t var2 = v30->var2;
            *(void *)&v50->var0 = v51;
          }
        }
        ++v26;
        unsigned int v25 = self->_edgeCount;
        --v27;
      }
      while (v26 < v25);
    }
    self->_unint64_t edgeCount = v18;
    if (v11 && v18)
    {
      unint64_t v52 = 0;
      int v53 = 0;
      unsigned int v54 = 0;
      objc_super v55 = &v24->var1;
      do
      {
        uint64_t v56 = v55;
        if (self->_inverted)
        {
          uint64_t v56 = &v24[v52].var2;
          if (*(v55 - 1) > 0xFFFFFFFA) {
            uint64_t v56 = v55;
          }
        }
        unsigned int v57 = *v56;
        if (v54 == v57)
        {
          long long v58 = v55 - 1;
          if (*(v55 - 1) == -3)
          {
            unsigned int v74 = v55[1];
            uint64_t v73 = *(void *)v58;
            long long v59 = &v24[v53];
            uint64_t v60 = *(void *)&v59->var0;
            v55[1] = v59->var2;
            *(void *)long long v58 = v60;
            *(void *)&v59->var0 = v73;
            v59->uint64_t var2 = v74;
            ++v53;
            unsigned int v18 = self->_edgeCount;
          }
        }
        else
        {
          unsigned int v54 = v57;
          int v53 = v52;
        }
        ++v52;
        v55 += 3;
      }
      while (v52 < v18);
      if (v18)
      {
        for (unint64_t i = 0; i < v18; ++i)
        {
          if (v24[i].var0 == -3 && v24[i].var1 != -1)
          {
            deadNodes = (unsigned int *)self->_deadNodes;
            unint64_t v63 = *deadNodes;
            uint64_t v64 = &v24[i];
            unsigned int v67 = v64->var2;
            v65 = &v64->var2;
            unint64_t v66 = v67;
            if (v63 > v67)
            {
              unint64_t v68 = v66;
              do
              {
                if (((*((unsigned __int8 *)deadNodes + (v68 >> 3) + 4) >> (v68 & 7)) & 1) == 0) {
                  break;
                }
                unint64_t v68 = v24[self->_nodeAdjIndex[v68]].var2;
              }
              while (v63 > v68);
              if (v63 > v66)
              {
                do
                {
                  if (((*((unsigned __int8 *)deadNodes + (v66 >> 3) + 4) >> (v66 & 7)) & 1) == 0) {
                    break;
                  }
                  unsigned int v69 = self->_nodeAdjIndex[v66];
                  unsigned int *v65 = v68;
                  id v70 = &v24[v69];
                  unsigned int v71 = v70->var2;
                  v65 = &v70->var2;
                  unint64_t v66 = v71;
                }
                while (*deadNodes > (unint64_t)v71);
                unsigned int v18 = self->_edgeCount;
              }
            }
          }
        }
      }
    }
    v72 = self->_edges;
    if (v72)
    {
      free(v72);
      unsigned int v18 = self->_edgeCount;
    }
    self->_edges = v24;
    self->_indexedEdges = v18;
  }
  else
  {
    self->_indexedEdges = 0;
  }
  return 1;
}

- (void)_renormalize
{
  size_t v3 = 4 * self->_nextNodeName;
  uint64_t v4 = malloc_type_malloc(v3, 0x100004052888210uLL);
  int __pattern4 = -1;
  memset_pattern4(v4, &__pattern4, v3);
  size_t v5 = 4 * self->_nextEdgeName;
  BOOL v6 = malloc_type_malloc(v5, 0x100004052888210uLL);
  int v27 = -1;
  memset_pattern4(v6, &v27, v5);
  unsigned int nextNodeName = self->_nextNodeName;
  unsigned int v8 = malloc_type_calloc(1uLL, ((nextNodeName + 7) >> 3) + 4, 0xFF42C4F3uLL);
  *unsigned int v8 = nextNodeName;
  if (self->_edgeCount)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    do
    {
      edges = self->_edges;
      unint64_t var1 = edges[v9].var1;
      if (nextNodeName > var1)
      {
        *((unsigned char *)v8 + (var1 >> 3) + 4) |= 1 << (var1 & 7);
        edges = self->_edges;
      }
      unint64_t var2 = edges[v9].var2;
      if (nextNodeName > var2) {
        *((unsigned char *)v8 + (var2 >> 3) + 4) |= 1 << (var2 & 7);
      }
      ++v10;
      ++v9;
    }
    while (v10 < self->_edgeCount);
  }
  unint64_t v14 = self->_nextNodeName;
  if (v14)
  {
    unint64_t v15 = 0;
    uint64_t v16 = 0;
    deadNodes = (unsigned int *)self->_deadNodes;
    do
    {
      if (!deadNodes
        || v15 >= *deadNodes
        || (uint64_t v18 = (v15 >> 3) + 4,
            int v19 = 1 << (v15 & 7),
            (v19 & *((unsigned char *)deadNodes + v18)) == 0)
        || v15 < *v8 && (v19 & *((unsigned char *)v8 + v18)) != 0)
      {
        *((_DWORD *)v4 + v15) = v16;
        uint64_t v16 = (v16 + 1);
        unint64_t v14 = self->_nextNodeName;
      }
      ++v15;
    }
    while (v15 < v14);
  }
  else
  {
    uint64_t v16 = 0;
  }
  free(v8);
  unint64_t edgeCount = self->_edgeCount;
  if (edgeCount)
  {
    unint64_t v21 = 0;
    unsigned int v22 = self->_edges;
    do
    {
      unsigned int var0 = v22->var0;
      ++v22;
      uint64_t v23 = var0;
      if (var0 <= 0xFFFFFFFA)
      {
        *((_DWORD *)v6 + v23) = v21;
        unint64_t edgeCount = self->_edgeCount;
      }
      ++v21;
    }
    while (v21 < edgeCount);
  }
  [(VMUDirectedGraph *)self _renameWithNodeMap:v4 nodeNamespace:v16 edgeMap:v6 edgeNamespace:self->_externalEdges];
  free(v4);
  free(v6);
  unsigned int externalEdges = self->_externalEdges;
  self->_unsigned int nextNodeName = v16;
  self->_nextEdgeName = externalEdges;
  if (self->_insideSearch)
  {
    unsigned int v26 = (void *)MEMORY[0x1E4F1CA00];
    [v26 raise:@"VMUDestructiveMutationWhileEnumeratingException" format:@"Destructive mutation attempted while traversing graph!"];
  }
  else
  {
    self->_indexedEdges = -1;
  }
}

- (void)_renameWithNodeMap:(unsigned int *)a3 nodeNamespace:(unsigned int)a4 edgeMap:(unsigned int *)a5 edgeNamespace:(unsigned int)a6
{
  if (self->_nextEdgeName != a6)
  {
    if (a6 <= 0x10) {
      unsigned int v10 = 16;
    }
    else {
      unsigned int v10 = a6;
    }
    self->_unsigned int edgeCapacity = v10;
    self->_edges = (_VMUDirectedGraphEdge *)malloc_type_realloc(self->_edges, 12 * v10, 0x10000403E1C8BA9uLL);
  }
  deadNodes = self->_deadNodes;
  if (deadNodes)
  {
    free(deadNodes);
    self->_deadNodes = 0;
  }
  if (self->_edgeCount)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    do
    {
      edges = self->_edges;
      if (a3)
      {
        unint64_t v15 = &edges[v12];
        uint64_t var2 = edges[v12].var2;
        v15->unint64_t var1 = a3[edges[v12].var1];
        v15->uint64_t var2 = a3[var2];
      }
      uint64_t var0 = edges[v12].var0;
      if (a5 && var0 <= 0xFFFFFFFA)
      {
        edges[v12].uint64_t var0 = a5[var0];
      }
      else if (var0 == -2)
      {
        uint64_t v18 = (unsigned int *)self->_deadNodes;
        if (v18)
        {
          unsigned int v19 = *v18;
        }
        else
        {
          uint64_t v18 = (unsigned int *)malloc_type_calloc(1uLL, ((a4 + 7) >> 3) + 4, 0xFF42C4F3uLL);
          *uint64_t v18 = a4;
          self->_deadNodes = v18;
          edges = self->_edges;
          unsigned int v19 = a4;
        }
        unint64_t v20 = edges[v12].var2;
        if (v19 > v20) {
          *((unsigned char *)v18 + (v20 >> 3) + 4) |= 1 << (v20 & 7);
        }
      }
      ++v13;
      ++v12;
    }
    while (v13 < self->_edgeCount);
  }
}

- (unsigned)enumerateNodesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  if (v4)
  {
    int insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      unsigned int indexedEdges = self->_indexedEdges;
      BOOL v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
      if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
      {
        int insideSearch = 0;
      }
      else
      {
        [(VMUDirectedGraph *)self _adjustAdjacencyMap];
        int insideSearch = self->_insideSearch;
      }
    }
    self->_int insideSearch = insideSearch + 1;
    unsigned __int8 v16 = 0;
    unsigned int indexedNodeSpace = self->_indexedNodeSpace;
    if (indexedNodeSpace)
    {
      unsigned int nodeCount = 0;
      unsigned int v10 = 1;
      do
      {
        uint64_t v11 = v10 - 1;
        deadNodes = self->_deadNodes;
        if (deadNodes
          && *deadNodes > v11
          && ((*((unsigned __int8 *)deadNodes + ((v10 - 1) >> 3) + 4) >> ((v10 - 1) & 7)) & 1) != 0)
        {
          int v13 = 0;
        }
        else
        {
          v4[2](v4, v11, &v16);
          ++nodeCount;
          unsigned int indexedNodeSpace = self->_indexedNodeSpace;
          int v13 = v16;
        }
        BOOL v7 = v10++ >= indexedNodeSpace;
      }
      while (!v7 && v13 == 0);
      int insideSearch = self->_insideSearch - 1;
    }
    else
    {
      unsigned int nodeCount = 0;
    }
    self->_int insideSearch = insideSearch;
  }
  else
  {
    unsigned int nodeCount = self->_nodeCount;
  }

  return nodeCount;
}

- (unsigned)reverseEnumerateNodesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    LODWORD(v5) = self->_indexedNodeSpace;
    if (v5)
    {
      int insideSearch = self->_insideSearch;
      if (!insideSearch)
      {
        unsigned int indexedEdges = self->_indexedEdges;
        if (indexedEdges == -1 || indexedEdges < self->_edgeCount || v5 < self->_nextNodeName)
        {
          [(VMUDirectedGraph *)self _adjustAdjacencyMap];
          int insideSearch = self->_insideSearch;
          LODWORD(v5) = self->_indexedNodeSpace;
        }
        else
        {
          int insideSearch = 0;
        }
      }
      unsigned int nodeCount = 0;
      self->_int insideSearch = insideSearch + 1;
      char v13 = 0;
LABEL_12:
      uint64_t v9 = (v5 - 1);
      while (v9 != -1)
      {
        uint64_t v5 = v9;
        deadNodes = self->_deadNodes;
        if (deadNodes)
        {
          if (*deadNodes > v5)
          {
            unsigned int v11 = *((unsigned __int8 *)deadNodes + (v5 >> 3) + 4);
            uint64_t v9 = (v5 - 1);
            if ((v11 >> (v5 & 7))) {
              continue;
            }
          }
        }
        v4[2](v4, v5, &v13);
        ++nodeCount;
        if (!v13) {
          goto LABEL_12;
        }
        break;
      }
      --self->_insideSearch;
    }
    else
    {
      unsigned int nodeCount = 0;
    }
  }
  else
  {
    unsigned int nodeCount = self->_nodeCount;
  }

  return nodeCount;
}

- (unsigned)enumerateMembersOfGroupNode:(unsigned int)a3 withBlock:(id)a4
{
  BOOL v6 = (void (**)(id, void, unsigned __int8 *))a4;
  int insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    unsigned int indexedEdges = self->_indexedEdges;
    BOOL v9 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v9 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      int insideSearch = 0;
    }
    else
    {
      [(VMUDirectedGraph *)self _adjustAdjacencyMap];
      int insideSearch = self->_insideSearch;
    }
  }
  int v10 = 0;
  self->_int insideSearch = insideSearch + 1;
  unsigned __int8 v27 = 0;
  nodeAdjIndex = self->_nodeAdjIndex;
  uint64_t v12 = nodeAdjIndex[a3];
  unsigned int indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace > a3)
  {
    p_unsigned int indexedEdges = &self->_indexedEdges;
    unint64_t v15 = &nodeAdjIndex[a3 + 1];
    if (a3 + 1 < indexedNodeSpace) {
      p_unsigned int indexedEdges = v15;
    }
    int v10 = *p_indexedEdges - v12;
  }
  unint64_t v16 = (v10 + v12);
  if (v12 >= v16)
  {
    unsigned int v18 = 0;
  }
  else
  {
    int v17 = 0;
    unsigned int v18 = 0;
    uint64_t v19 = v12;
    unint64_t v20 = v12 + 1;
    do
    {
      edges = self->_edges;
      if (!edges) {
        -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]();
      }
      unsigned int v22 = &edges[v19];
      if (v22->var0 >= 0xFFFFFFFB || !self->_inverted) {
        uint64_t v24 = 8;
      }
      else {
        uint64_t v24 = 4;
      }
      if (v22->var0 == -2)
      {
        if (v6)
        {
          v6[2](v6, *(unsigned int *)((char *)&v22->var0 + v24), &v27);
          int v17 = v27;
        }
        ++v18;
        int v25 = v17;
      }
      else
      {
        int v25 = 0;
      }
      if (v20 >= v16) {
        break;
      }
      ++v19;
      ++v20;
    }
    while (!v25);
    int insideSearch = self->_insideSearch - 1;
  }
  self->_int insideSearch = insideSearch;

  return v18;
}

- (unsigned)parentGroupForNode:(unsigned int)a3
{
  int insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    unsigned int indexedEdges = self->_indexedEdges;
    BOOL v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      int insideSearch = 0;
    }
    else
    {
      [(VMUDirectedGraph *)self _adjustAdjacencyMap];
      int insideSearch = self->_insideSearch;
    }
  }
  self->_int insideSearch = insideSearch + 1;
  unsigned int indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace > a3
    && ((nodeAdjIndex = self->_nodeAdjIndex, a3 + 1 >= indexedNodeSpace)
      ? (p_unsigned int indexedEdges = &self->_indexedEdges)
      : (p_unsigned int indexedEdges = &nodeAdjIndex[a3 + 1]),
        (unsigned int v11 = nodeAdjIndex[a3], *p_indexedEdges - v11 >= 2)
     && (edges = self->_edges, unsigned int v13 = v11 + 1, edges[v13].var0 == -3)))
  {
    unsigned int result = edges[v13].var2;
  }
  else
  {
    unsigned int result = -1;
  }
  self->_int insideSearch = insideSearch;
  return result;
}

- (unsigned)edgeCount
{
  if (self->_deadNodes) {
    return [(VMUDirectedGraph *)self enumerateEdgesWithBlock:0];
  }
  else {
    return self->_edgeCount;
  }
}

- (unsigned)enumerateEdgesWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  int insideSearch = self->_insideSearch;
  if (!insideSearch)
  {
    unsigned int indexedEdges = self->_indexedEdges;
    BOOL v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      int insideSearch = 0;
    }
    else
    {
      [(VMUDirectedGraph *)self _adjustAdjacencyMap];
      int insideSearch = self->_insideSearch;
    }
  }
  self->_int insideSearch = insideSearch + 1;
  unint64_t v8 = self->_indexedEdges;
  if (!v8)
  {
    unsigned int v10 = 0;
    goto LABEL_52;
  }
  uint64_t v9 = 0;
  unsigned int v10 = 0;
  for (unint64_t i = 1; ; ++i)
  {
    edges = self->_edges;
    if (!edges) {
      -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]();
    }
    BOOL inverted = self->_inverted;
    p_unint64_t var1 = &edges[v9].var1;
    unsigned int var0 = edges[v9].var0;
    BOOL v16 = var0 < 0xFFFFFFFB;
    BOOL v17 = !inverted || !v16;
    if (inverted && v16) {
      p_unsigned int var2 = &edges[v9].var2;
    }
    else {
      p_unsigned int var2 = &edges[v9].var1;
    }
    uint64_t v19 = *p_var2;
    if (v17) {
      p_unint64_t var1 = &edges[v9].var2;
    }
    uint64_t v20 = *p_var1;
    if (var0 == -2)
    {
      unsigned int var2 = v19;
    }
    else
    {
      nodeAdjIndex = self->_nodeAdjIndex;
      unsigned int indexedNodeSpace = self->_indexedNodeSpace;
      if (v19 >= indexedNodeSpace) {
        goto LABEL_25;
      }
      unint64_t v24 = v8;
      if ((int)v19 + 1 < indexedNodeSpace) {
        unint64_t v24 = nodeAdjIndex[v19 + 1];
      }
      uint64_t v25 = nodeAdjIndex[v19];
      if (v24 == v25)
      {
LABEL_25:
        unsigned int var2 = v19;
      }
      else
      {
        unsigned int var2 = v19;
        if (edges[v25].var0 == -3) {
          unsigned int var2 = edges[v25].var2;
        }
      }
      if (v20 < indexedNodeSpace)
      {
        unint64_t v26 = v8;
        if ((int)v20 + 1 < indexedNodeSpace) {
          unint64_t v26 = nodeAdjIndex[v20 + 1];
        }
        uint64_t v27 = nodeAdjIndex[v20];
        if (v26 != v27 && edges[v27].var0 == -3)
        {
          unsigned int v28 = edges[v27].var2;
          goto LABEL_33;
        }
      }
    }
    unsigned int v28 = v20;
LABEL_33:
    if (v28 == v20 && var2 == v19) {
      int v30 = edges[v9].var0;
    }
    else {
      int v30 = -4;
    }
    if (var2 == v28) {
      unsigned int v31 = v30;
    }
    else {
      unsigned int v31 = edges[v9].var0;
    }
    if (v31 <= 0xFFFFFFFA)
    {
      if (v4)
      {
        v4[2](v4);
        unint64_t v8 = self->_indexedEdges;
      }
      ++v10;
    }
    if (i >= v8) {
      break;
    }
    ++v9;
  }
  int insideSearch = self->_insideSearch - 1;
LABEL_52:
  self->_int insideSearch = insideSearch;

  return v10;
}

- (void)_internalAccessRawEdgesWithBlock:(id)a3
{
  id v4 = a3;
  int insideSearch = self->_insideSearch;
  id v8 = v4;
  if (!insideSearch)
  {
    unsigned int indexedEdges = self->_indexedEdges;
    BOOL v7 = indexedEdges != -1 && indexedEdges >= self->_edgeCount;
    if (v7 && self->_indexedNodeSpace >= self->_nextNodeName)
    {
      int insideSearch = 0;
    }
    else
    {
      [(VMUDirectedGraph *)self _adjustAdjacencyMap];
      id v4 = v8;
      int insideSearch = self->_insideSearch;
    }
  }
  self->_int insideSearch = insideSearch + 1;
  (*((void (**)(id, _VMUDirectedGraphEdge *, void))v4 + 2))(v4, self->_edges, self->_indexedEdges);
  --self->_insideSearch;
}

- (unsigned)_internalEnumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  unsigned int v64 = a3;
  BOOL v6 = (void (**)(void))a4;
  if (a3 == -1 || (unsigned int nextNodeName = self->_nextNodeName, nextNodeName <= a3))
  {
    unsigned int v10 = 0;
  }
  else
  {
    int insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      unsigned int indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < nextNodeName)
      {
        [(VMUDirectedGraph *)self _adjustAdjacencyMap];
        int insideSearch = self->_insideSearch;
      }
      else
      {
        int insideSearch = 0;
      }
    }
    self->_int insideSearch = insideSearch + 1;
    deadNodes = (unsigned int *)self->_deadNodes;
    if (deadNodes
      && *deadNodes > a3
      && ((*((unsigned __int8 *)deadNodes + (a3 >> 3) + 4) >> (a3 & 7)) & 1) != 0
      && ((unsigned int v12 = self->_indexedNodeSpace, v12 <= a3)
       || ((v14 = self->_nodeAdjIndex, unsigned int v13 = self->_edges, a3 + 1 >= v12)
         ? (unint64_t v15 = &self->_indexedEdges)
         : (unint64_t v15 = &v14[a3 + 1]),
           !v13 || (unsigned int v16 = *v15, v17 = v14[a3], v16 == v17) || v13[v17].var0 != -3 || v13[v17].var2 == a3)))
    {
      unsigned int v10 = 0;
      unsigned int v64 = -1;
    }
    else
    {
      unsigned int indexedNodeSpace = self->_indexedNodeSpace;
      if (indexedNodeSpace <= a3)
      {
        unsigned int v10 = 0;
      }
      else
      {
        nodeAdjIndex = self->_nodeAdjIndex;
        if (a3 + 1 >= indexedNodeSpace) {
          p_unsigned int indexedEdges = &self->_indexedEdges;
        }
        else {
          p_unsigned int indexedEdges = &nodeAdjIndex[a3 + 1];
        }
        unsigned int v21 = *p_indexedEdges;
        unsigned int v22 = nodeAdjIndex[a3];
        if (v21 - v22 >= 2 && (edges = self->_edges, unsigned int v24 = v22 + 1, edges[v24].var0 == -3)) {
          int var2 = edges[v24].var2;
        }
        else {
          int var2 = -1;
        }
        int v62 = var2;
        unsigned int v63 = 0;
        unsigned int v26 = 0;
        uint64_t v27 = &v64;
        unsigned int v28 = 1;
        do
        {
          uint64_t v29 = v27[--v28];
          int v30 = self->_nodeAdjIndex;
          unint64_t v31 = v30[v29];
          unsigned int v32 = self->_indexedNodeSpace;
          if (v29 >= v32)
          {
            int v37 = 0;
          }
          else
          {
            uint64_t v33 = v29 + 1;
            unsigned int v34 = &v30[v33];
            BOOL v35 = v33 >= v32;
            uint64_t v36 = &self->_indexedEdges;
            if (!v35) {
              uint64_t v36 = v34;
            }
            int v37 = *v36 - v31;
          }
          unint64_t v38 = (v37 + v31);
          if (v31 < v38)
          {
            do
            {
              uint64_t v39 = self->_edges;
              if (!v39) {
                -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]();
              }
              unsigned int v40 = &v39[v31];
              p_int var2 = &v40->var2;
              unsigned int var0 = v40->var0;
              p_unint64_t var1 = &v40->var1;
              unsigned int v42 = var0;
              if (!self->_inverted || var0 >= 0xFFFFFFFB) {
                p_unint64_t var1 = p_var2;
              }
              uint64_t v45 = *p_var1;
              if (v42 == -2)
              {
                if (v28 >= v26)
                {
                  int v46 = v6;
                  if (2 * v26 <= 0x10) {
                    unsigned int v47 = 16;
                  }
                  else {
                    unsigned int v47 = 2 * v26;
                  }
                  if (v26) {
                    uint64_t v48 = v27;
                  }
                  else {
                    uint64_t v48 = 0;
                  }
                  uint64_t v27 = (unsigned int *)malloc_type_realloc(v48, 4 * v47, 0x100004052888210uLL);
                  unsigned int v26 = v47;
                  BOOL v6 = v46;
                }
                v27[v28++] = v45;
              }
              else if (v42 <= 0xFFFFFFFA)
              {
                unsigned int v49 = self->_indexedNodeSpace;
                if (v45 >= v49) {
                  goto LABEL_62;
                }
                uint64_t v50 = self->_nodeAdjIndex;
                unsigned int v51 = self->_indexedEdges;
                if ((int)v45 + 1 < v49) {
                  unsigned int v51 = v50[v45 + 1];
                }
                unsigned int v52 = v50[v45];
                if (v51 - v52 < 2 || v39[v52 + 1].var0 != -3) {
                  goto LABEL_62;
                }
                unsigned int v53 = v39[v52 + 1].var2;
                if (v53 == -1 || v53 == v62) {
                  goto LABEL_62;
                }
                do
                {
                  unsigned int v55 = v53;
                  if (v53 >= v49) {
                    break;
                  }
                  unsigned int v56 = v53 + 1;
                  unsigned int v57 = self->_indexedEdges;
                  if (v56 < v49) {
                    unsigned int v57 = v50[v56];
                  }
                  unsigned int v58 = v50[v55];
                  if (v57 - v58 < 2 || v39[v58 + 1].var0 != -3) {
                    break;
                  }
                  unsigned int v53 = v39[v58 + 1].var2;
                }
                while (v53 != -1 && v53 != v62);
                if (v64 != v55 || v55 == v45)
                {
LABEL_62:
                  if (v6) {
                    v6[2](v6);
                  }
                  ++v63;
                }
              }
              ++v31;
            }
            while (v31 < v38);
          }
        }
        while (v28);
        if (v26) {
          free(v27);
        }
        int insideSearch = self->_insideSearch - 1;
        unsigned int v10 = v63;
      }
    }
    self->_int insideSearch = insideSearch;
  }

  return v10;
}

- (unsigned)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__VMUDirectedGraph_enumerateEdgesOfNode_withBlock___block_invoke;
    v10[3] = &unk_1E5D25B48;
    id v11 = v6;
    unsigned int v8 = [(VMUDirectedGraph *)self _internalEnumerateEdgesOfNode:v4 withBlock:v10];
  }
  else
  {
    unsigned int v8 = [(VMUDirectedGraph *)self _internalEnumerateEdgesOfNode:v4 withBlock:0];
  }

  return v8;
}

uint64_t __51__VMUDirectedGraph_enumerateEdgesOfNode_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)withNodeMarkingMap:(id)a3
{
  if (a3)
  {
    unsigned int nextNodeName = self->_nextNodeName;
    uint64_t v4 = (void (**)(id, _DWORD *))a3;
    uint64_t v5 = malloc_type_calloc(1uLL, ((nextNodeName + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *uint64_t v5 = nextNodeName;
    v4[2](v4, v5);

    free(v5);
  }
}

- (void)withEdgeMarkingMap:(id)a3
{
  if (a3)
  {
    unsigned int nextEdgeName = self->_nextEdgeName;
    uint64_t v4 = (void (**)(id, _DWORD *))a3;
    uint64_t v5 = malloc_type_calloc(1uLL, ((nextEdgeName + 7) >> 3) + 4, 0xFF42C4F3uLL);
    *uint64_t v5 = nextEdgeName;
    v4[2](v4, v5);

    free(v5);
  }
}

- (void)_dfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  v65 = (uint64_t (**)(id, uint64_t, void))a5;
  unsigned int v10 = (unsigned int (**)(void))a6;
  uint64_t v11 = v65[2](v65, v8, a4[v8]);
  a4[v8] = v11;
  unsigned int indexedNodeSpace = self->_indexedNodeSpace;
  if (indexedNodeSpace <= v8
    || ((nodeAdjIndex = self->_nodeAdjIndex, p_unsigned int indexedEdges = &self->_indexedEdges, (int)v8 + 1 >= indexedNodeSpace)
      ? (unint64_t v14 = &self->_indexedEdges)
      : (unint64_t v14 = &nodeAdjIndex[(v8 + 1)]),
        *v14 == nodeAdjIndex[v8]))
  {
    a4[v8] = v65[2](v65, v8, v11);
    goto LABEL_85;
  }
  if (indexedNodeSpace <= 0x10) {
    unsigned int v15 = 16;
  }
  else {
    unsigned int v15 = self->_indexedNodeSpace;
  }
  unsigned int v16 = (unsigned int *)malloc_type_malloc(4 * v15, 0x100004052888210uLL);
  unsigned int v17 = self->_nodeAdjIndex[v8];
  *unsigned int v16 = v17;
  unsigned int indexedEdges = self->_indexedEdges;
  if (indexedEdges == -1) {
    -[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:]();
  }
  uint64_t v19 = v16;
  unsigned int v63 = v10;
  if (v17 < indexedEdges)
  {
    int v20 = 0;
    unsigned int v62 = v15;
    do
    {
      unsigned int v21 = v19[v20];
      if (v21 == -1)
      {
        if (!v20) {
          -[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:]();
        }
        unsigned int v22 = v19[--v20];
      }
      else
      {
        unsigned int v22 = v19[v20];
      }
      edges = self->_edges;
      if (!edges) {
        -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]();
      }
      unsigned int v24 = self->_nodeAdjIndex;
      BOOL inverted = self->_inverted;
      unsigned int v26 = &edges[v22];
      p_unsigned int var2 = &v26->var2;
      unsigned int var0 = v26->var0;
      p_unint64_t var1 = &v26->var1;
      unsigned int v28 = var0;
      BOOL v31 = var0 < 0xFFFFFFFB;
      BOOL v32 = !inverted || !v31;
      if (inverted && v31) {
        uint64_t v33 = p_var2;
      }
      else {
        uint64_t v33 = p_var1;
      }
      uint64_t v34 = *v33;
      if (v32) {
        p_unint64_t var1 = p_var2;
      }
      uint64_t v35 = *p_var1;
      if (v28 == -2)
      {
        uint64_t v36 = v35;
        unsigned int var2 = v34;
      }
      else
      {
        unsigned int v38 = self->_indexedNodeSpace;
        if (v34 >= v38) {
          goto LABEL_30;
        }
        unsigned int v39 = indexedEdges;
        if ((int)v34 + 1 < v38) {
          unsigned int v39 = v24[v34 + 1];
        }
        unsigned int v40 = v24[v34];
        if (v39 == v40)
        {
LABEL_30:
          unsigned int var2 = v34;
        }
        else
        {
          unsigned int var2 = v34;
          if (edges[v40].var0 == -3) {
            unsigned int var2 = edges[v40].var2;
          }
        }
        if (v35 < v38)
        {
          if ((int)v35 + 1 < v38) {
            unsigned int indexedEdges = v24[v35 + 1];
          }
          unsigned int v41 = v24[v35];
          if (indexedEdges != v41 && edges[v41].var0 == -3)
          {
            uint64_t v36 = edges[v41].var2;
            uint64_t v42 = v36;
            goto LABEL_39;
          }
        }
        uint64_t v36 = v35;
      }
      uint64_t v42 = v35;
LABEL_39:
      if (v42 == v35 && var2 == v34) {
        int v44 = v28;
      }
      else {
        int v44 = -4;
      }
      if (var2 == v42) {
        unsigned int v45 = v44;
      }
      else {
        unsigned int v45 = v28;
      }
      uint64_t v46 = var2;
      if (v21 != -1)
      {
        if (v45 <= 0xFFFFFFFA)
        {
          unsigned int v47 = &a4[v36];
          if (v63[2]())
          {
            uint64_t v48 = ((uint64_t (*)(uint64_t (**)(id, uint64_t, void), uint64_t, void, uint64_t))v65[2])(v65, v42, *v47, 12);
            *unsigned int v47 = v48;
            unsigned int v49 = self->_indexedNodeSpace;
            if (v42 < v49)
            {
              unsigned int v24 = self->_nodeAdjIndex;
              BOOL v50 = (int)v42 + 1 >= v49;
              unsigned int v51 = &self->_indexedEdges;
              if (!v50) {
                unsigned int v51 = &v24[(v42 + 1)];
              }
              if (*v51 != v24[v36])
              {
LABEL_77:
                if (++v20 >= v62)
                {
                  v62 *= 2;
                  uint64_t v19 = (unsigned int *)malloc_type_realloc(v19, 4 * v62, 0x100004052888210uLL);
                  unsigned int v24 = self->_nodeAdjIndex;
                }
                int v58 = v24[v36];
                goto LABEL_80;
              }
            }
            *unsigned int v47 = ((uint64_t (*)(uint64_t (**)(id, uint64_t, void), uint64_t, uint64_t, uint64_t))v65[2])(v65, v42, v48, 12);
          }
        }
        else if (v45 == -2)
        {
          goto LABEL_77;
        }
      }
      unsigned int v52 = self->_edges;
      if (v22 + 1 >= self->_indexedEdges)
      {
        if (!v52) {
          -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]();
        }
LABEL_69:
        long long v59 = &v52[v22];
        BOOL v60 = v59->var0 >= 0xFFFFFFFB || !self->_inverted;
        uint64_t v61 = 4;
        if (!v60) {
          uint64_t v61 = 8;
        }
        if (*(unsigned int *)((char *)&v59->var0 + v61) == v46) {
          a4[v46] = ((uint64_t (*)(uint64_t (**)(id, uint64_t, void), uint64_t, void, uint64_t))v65[2])(v65, v46, a4[v46], 12);
        }
        int v58 = -1;
        goto LABEL_80;
      }
      if (!v52) {
        -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]();
      }
      unsigned int v53 = &v52[v22 + 1];
      if (self->_inverted && v53->var0 < 0xFFFFFFFB) {
        uint64_t v54 = 8;
      }
      else {
        uint64_t v54 = 4;
      }
      int v55 = *(unsigned int *)((char *)&v53->var0 + v54);
      unsigned int v56 = &v52[v22];
      if (self->_inverted && v56->var0 < 0xFFFFFFFB) {
        uint64_t v57 = 8;
      }
      else {
        uint64_t v57 = 4;
      }
      if (v55 != *(unsigned int *)((char *)&v56->var0 + v57)) {
        goto LABEL_69;
      }
      int v58 = v19[v20] + 1;
LABEL_80:
      v19[v20] = v58;
      unsigned int indexedEdges = *p_indexedEdges;
    }
    while (*v19 < *p_indexedEdges);
  }
  free(v19);
  unsigned int v10 = v63;
LABEL_85:
}

- (void)_bfsCore:(unsigned int)a3 colors:(char *)a4 visitBlock:(id)a5 examineBlock:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  BOOL v50 = (uint64_t (**)(id, uint64_t, void))a5;
  unsigned int v10 = (unsigned int (**)(void))a6;
  if (self->_indexedNodeSpace <= 0x10) {
    unsigned int indexedNodeSpace = 16;
  }
  else {
    unsigned int indexedNodeSpace = self->_indexedNodeSpace;
  }
  unsigned int v12 = malloc_type_malloc(4 * indexedNodeSpace, 0x100004052888210uLL);
  unsigned int v13 = 0;
  a4[v8] = v50[2](v50, v8, a4[v8]);
  *unsigned int v12 = v8;
  unsigned int v51 = a4;
  unsigned int v14 = 1;
  do
  {
    uint64_t v15 = v12[v13];
    nodeAdjIndex = self->_nodeAdjIndex;
    uint64_t v17 = nodeAdjIndex[v15];
    unsigned int v18 = self->_indexedNodeSpace;
    if (v15 >= v18)
    {
      int v20 = 0;
    }
    else
    {
      p_unsigned int indexedEdges = &self->_indexedEdges;
      if ((int)v15 + 1 < v18) {
        p_unsigned int indexedEdges = &nodeAdjIndex[v15 + 1];
      }
      int v20 = *p_indexedEdges - v17;
    }
    ++v13;
    uint64_t v21 = (v20 + v17);
    if (v17 < v21)
    {
      uint64_t v49 = v15;
      uint64_t v22 = v17;
      uint64_t v23 = v21 - v17;
      while (1)
      {
        edges = self->_edges;
        if (!edges) {
          -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]();
        }
        unsigned int v25 = self->_indexedNodeSpace;
        BOOL inverted = self->_inverted;
        p_unint64_t var1 = &edges[v22].var1;
        unsigned int var0 = edges[v22].var0;
        BOOL v29 = var0 < 0xFFFFFFFB;
        BOOL v30 = !inverted || !v29;
        if (inverted && v29) {
          p_unsigned int var2 = &edges[v22].var2;
        }
        else {
          p_unsigned int var2 = &edges[v22].var1;
        }
        uint64_t v32 = *p_var2;
        if (v30) {
          p_unint64_t var1 = &edges[v22].var2;
        }
        uint64_t v33 = *p_var1;
        if (var0 == -2)
        {
          unsigned int var2 = v32;
        }
        else
        {
          uint64_t v35 = self->_nodeAdjIndex;
          unsigned int indexedEdges = self->_indexedEdges;
          if (v32 >= v25) {
            goto LABEL_25;
          }
          unsigned int v37 = self->_indexedEdges;
          if ((int)v32 + 1 < v25) {
            unsigned int v37 = v35[v32 + 1];
          }
          unsigned int v38 = v35[v32];
          if (v37 == v38)
          {
LABEL_25:
            unsigned int var2 = v32;
          }
          else
          {
            unsigned int var2 = v32;
            if (edges[v38].var0 == -3) {
              unsigned int var2 = edges[v38].var2;
            }
          }
          if (v33 < v25)
          {
            if ((int)v33 + 1 < v25) {
              unsigned int indexedEdges = v35[v33 + 1];
            }
            unsigned int v39 = v35[v33];
            if (indexedEdges != v39 && edges[v39].var0 == -3)
            {
              uint64_t v40 = edges[v39].var2;
              goto LABEL_33;
            }
          }
        }
        uint64_t v40 = v33;
LABEL_33:
        if (v40 == v33 && var2 == v32) {
          int v42 = edges[v22].var0;
        }
        else {
          int v42 = -4;
        }
        if (var2 == v40) {
          unsigned int v43 = v42;
        }
        else {
          unsigned int v43 = edges[v22].var0;
        }
        if (v43 >= 0xFFFFFFFB)
        {
          if (v43 == -2) {
            unsigned int v44 = v40;
          }
          else {
            unsigned int v44 = -1;
          }
LABEL_48:
          if (v44 < v25)
          {
            if (v14 >= indexedNodeSpace)
            {
              if (v13 <= indexedNodeSpace >> 1)
              {
                indexedNodeSpace *= 2;
                unsigned int v12 = malloc_type_realloc(v12, 4 * indexedNodeSpace, 0x100004052888210uLL);
              }
              else
              {
                v14 -= v13;
                memmove(v12, &v12[v13], 4 * v14);
                unsigned int v13 = 0;
              }
            }
            v12[v14++] = v40;
          }
          goto LABEL_57;
        }
        if (v10[2](v10))
        {
          v51[v40] = v50[2](v50, v40, v51[v40]);
          unsigned int v25 = self->_indexedNodeSpace;
          unsigned int v44 = v40;
          goto LABEL_48;
        }
LABEL_57:
        ++v22;
        if (!--v23)
        {
          nodeAdjIndex = self->_nodeAdjIndex;
          unsigned int v18 = self->_indexedNodeSpace;
          uint64_t v15 = v49;
          break;
        }
      }
    }
    if (v15 < v18)
    {
      unsigned int v45 = self->_edges;
      BOOL v46 = (int)v15 + 1 >= v18;
      unsigned int v47 = &self->_indexedEdges;
      if (!v46) {
        unsigned int v47 = &nodeAdjIndex[(v15 + 1)];
      }
      if (v45)
      {
        unsigned int v48 = nodeAdjIndex[v15];
        if (*v47 != v48 && v45[v48].var0 == -3 && v15 != v45[v48].var2) {
          continue;
        }
      }
    }
    v51[v15] = v50[2](v50, v15, v51[v15]);
  }
  while (v13 != v14);
  free(v12);
}

- (void)_searchMainLoop:(unsigned int)a3 action:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  size_t nextNodeName = self->_nextNodeName;
  if (nextNodeName)
  {
    uint64_t v8 = malloc_type_calloc(nextNodeName, 1uLL, 0x100004077774924uLL);
    uint64_t v9 = v8;
    if (v4 == -1)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __43__VMUDirectedGraph__searchMainLoop_action___block_invoke;
      v11[3] = &unk_1E5D25B70;
      unsigned int v13 = v8;
      id v12 = v6;
      [(VMUDirectedGraph *)self enumerateNodesWithBlock:v11];
    }
    else if (self->_indexedNodeSpace > v4)
    {
      deadNodes = self->_deadNodes;
      if (!deadNodes
        || *deadNodes <= v4
        || ((*((unsigned __int8 *)deadNodes + (v4 >> 3) + 4) >> (v4 & 7)) & 1) == 0)
      {
        (*((void (**)(id, uint64_t, void *))v6 + 2))(v6, v4, v8);
      }
    }
    free(v9);
  }
}

uint64_t __43__VMUDirectedGraph__searchMainLoop_action___block_invoke(uint64_t result, unsigned int a2)
{
  if (!*(unsigned char *)(*(void *)(result + 40) + a2)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)depthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9 && v10)
  {
    int insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      unsigned int indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < self->_nextNodeName)
      {
        [(VMUDirectedGraph *)self _adjustAdjacencyMap];
        int insideSearch = self->_insideSearch;
      }
      else
      {
        int insideSearch = 0;
      }
    }
    self->_int insideSearch = insideSearch + 1;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__VMUDirectedGraph_depthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke;
    v17[3] = &unk_1E5D25B98;
    v17[4] = self;
    id v18 = v9;
    id v19 = v11;
    [(VMUDirectedGraph *)self _searchMainLoop:v6 action:v17];
    --self->_insideSearch;
  }
  else
  {
    unsigned int v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    Name = sel_getName(a2);
    NSLog(&cfstr_SS_5.isa, v15, Name, "^block parameters must be non-nil.");
  }
}

uint64_t __67__VMUDirectedGraph_depthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _dfsCore:a2 colors:a3 visitBlock:*(void *)(a1 + 40) examineBlock:*(void *)(a1 + 48)];
}

- (void)breadthFirstSearch:(unsigned int)a3 nodeVisitBlock:(id)a4 edgeVisitBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9 && v10)
  {
    int insideSearch = self->_insideSearch;
    if (!insideSearch)
    {
      unsigned int indexedEdges = self->_indexedEdges;
      if (indexedEdges == -1 || indexedEdges < self->_edgeCount || self->_indexedNodeSpace < self->_nextNodeName)
      {
        [(VMUDirectedGraph *)self _adjustAdjacencyMap];
        int insideSearch = self->_insideSearch;
      }
      else
      {
        int insideSearch = 0;
      }
    }
    self->_int insideSearch = insideSearch + 1;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__VMUDirectedGraph_breadthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke;
    v17[3] = &unk_1E5D25B98;
    v17[4] = self;
    id v18 = v9;
    id v19 = v11;
    [(VMUDirectedGraph *)self _searchMainLoop:v6 action:v17];
    --self->_insideSearch;
  }
  else
  {
    unsigned int v14 = (objc_class *)objc_opt_class();
    uint64_t v15 = NSStringFromClass(v14);
    Name = sel_getName(a2);
    NSLog(&cfstr_SS_5.isa, v15, Name, "^block parameters must be non-nil.");
  }
}

uint64_t __69__VMUDirectedGraph_breadthFirstSearch_nodeVisitBlock_edgeVisitBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _bfsCore:a2 colors:a3 visitBlock:*(void *)(a1 + 40) examineBlock:*(void *)(a1 + 48)];
}

- (void)_reorderEdgesNaturally
{
  uint64_t edgeCount = self->_edgeCount;
  if (edgeCount)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    edges = self->_edges;
    char v7 = 1;
    do
    {
      unsigned int var0 = edges->var0;
      ++edges;
      v7 &= v4 == var0;
      if (var0 == 4294967294) {
        ++v5;
      }
      ++v4;
    }
    while (edgeCount != v4);
    if ((v7 & 1) == 0)
    {
      unsigned int edgeCapacity = self->_edgeCapacity;
      unsigned int v10 = self->_externalEdges + v5;
      size_t v11 = edgeCapacity <= v10 ? v10 : edgeCapacity;
      self->_unsigned int edgeCapacity = v11;
      if (v11)
      {
        id v12 = (_VMUDirectedGraphEdge *)malloc_type_calloc(v11, 0xCuLL, 0x10000403E1C8BA9uLL);
        if (v12)
        {
          unsigned int v13 = v12;
          if (self->_edgeCount)
          {
            uint64_t v14 = 0;
            unint64_t v15 = 0;
            int v16 = 0;
            do
            {
              uint64_t v17 = &self->_edges[v14];
              unsigned int v18 = v17->var0;
              if (v17->var0 != -3)
              {
                if (v18 == -2)
                {
                  id v19 = &v12[v16 + self->_externalEdges - 1];
                  uint64_t v20 = *(void *)&v17->var0;
                  v19->unsigned int var2 = v17->var2;
                  *(void *)&v19->unsigned int var0 = v20;
                  ++v16;
                }
                else
                {
                  uint64_t v21 = *(void *)&v17->var0;
                  uint64_t v22 = &v12[v18];
                  v22->unsigned int var2 = v17->var2;
                  *(void *)&v22->unsigned int var0 = v21;
                }
              }
              ++v15;
              ++v14;
            }
            while (v15 < self->_edgeCount);
          }
          uint64_t v23 = self->_edges;
          if (v23) {
            free(v23);
          }
          self->_edges = v13;
        }
      }
    }
  }
}

- (void)_dumpAdjacencyList
{
  if (self->_nextNodeName)
  {
    unint64_t v3 = 0;
    p_unsigned int indexedEdges = &self->_indexedEdges;
    do
    {
      nodeAdjIndex = self->_nodeAdjIndex;
      uint64_t v6 = nodeAdjIndex[v3];
      unint64_t indexedNodeSpace = self->_indexedNodeSpace;
      if (v3 >= indexedNodeSpace)
      {
        int v9 = 0;
      }
      else
      {
        uint64_t v8 = &nodeAdjIndex[v3 + 1];
        if (v3 + 1 >= indexedNodeSpace) {
          uint64_t v8 = p_indexedEdges;
        }
        int v9 = *v8 - v6;
      }
      uint64_t v10 = (v9 + v6);
      printf("node: %d at %d (%d edges leaving)\n", v3, v6, v9);
      if (v6 < v10)
      {
        uint64_t v11 = v6;
        do
        {
          edges = self->_edges;
          if (!edges) {
            -[VMUDirectedGraph enumerateMembersOfGroupNode:withBlock:]();
          }
          unsigned int v13 = &edges[v11];
          p_unsigned int var2 = &v13->var2;
          unsigned int var0 = v13->var0;
          p_unint64_t var1 = &v13->var1;
          unsigned int v16 = var0;
          BOOL inverted = self->_inverted;
          BOOL v19 = var0 < 0xFFFFFFFB;
          BOOL v20 = !inverted || !v19;
          if (inverted && v19) {
            uint64_t v21 = p_var2;
          }
          else {
            uint64_t v21 = p_var1;
          }
          if (v20) {
            p_unint64_t var1 = p_var2;
          }
          if (v16 == -3) {
            uint64_t v22 = " [group up]";
          }
          else {
            uint64_t v22 = "";
          }
          if (v16 == -2) {
            uint64_t v22 = " [group contain]";
          }
          printf("%d: %d -> %d%s\n", v6++, *v21, *p_var1, v22);
          ++v11;
        }
        while (v10 != v6);
      }
      ++v3;
    }
    while (v3 < self->_nextNodeName);
  }
}

- (void)invertEdges
{
  uint64_t v3 = [(VMUDirectedGraph *)self inverted] ^ 1;

  [(VMUDirectedGraph *)self setInverted:v3];
}

- (id)subgraphWithMarkedNodes:(void *)a3
{
  uint64_t v4 = (void *)[(VMUDirectedGraph *)self copy];
  int v5 = v4;
  if (a3)
  {
    int v6 = *(_DWORD *)a3;
    unint64_t v7 = (*(_DWORD *)a3 + 7);
    if (v7 >= 8)
    {
      uint64_t v8 = (char *)a3 + 4;
      uint64_t v9 = v7 >> 3;
      if (v7 >> 3 <= 1) {
        uint64_t v9 = 1;
      }
      do
      {
        *uint64_t v8 = ~*v8;
        ++v8;
        --v9;
      }
      while (v9);
    }
    int v10 = v6 & 7;
    if (v10) {
      *((unsigned char *)a3 + (v7 >> 3) + 3) ^= -1 << v10;
    }
    [v4 removeMarkedNodes:a3];
    int v11 = *(_DWORD *)a3;
    unint64_t v12 = (*(_DWORD *)a3 + 7);
    if (v12 >= 8)
    {
      unsigned int v13 = (char *)a3 + 4;
      uint64_t v14 = v12 >> 3;
      if (v12 >> 3 <= 1) {
        uint64_t v14 = 1;
      }
      do
      {
        *unsigned int v13 = ~*v13;
        ++v13;
        --v14;
      }
      while (v14);
    }
    int v15 = v11 & 7;
    if (v15) {
      *((unsigned char *)a3 + (v12 >> 3) + 3) ^= -1 << v15;
    }
  }

  return v5;
}

- (id)renormalizedGraph
{
  unint64_t v2 = (void *)[(VMUDirectedGraph *)self copy];
  [v2 _renormalize];

  return v2;
}

- (id)invertedGraph
{
  uint64_t v3 = (void *)[(VMUDirectedGraph *)self copy];
  [v3 setInverted:!self.inverted];

  return v3;
}

- (unsigned)nodeCount
{
  return self->_nodeCount;
}

- (unsigned)nodeNamespaceSize
{
  return self->_nextNodeName;
}

- (unsigned)edgeNamespaceSize
{
  return self->_nextEdgeName;
}

- (NSDictionary)additionalProperties
{
  return self->_additionalProperties;
}

- (void)setAdditionalProperties:(id)a3
{
}

- (BOOL)graphIs64bit
{
  return self->_graphIs64bit;
}

- (void).cxx_destruct
{
}

- (void)decapsulateSupplementalData:forTag:.cold.1()
{
  __assert_rtn("-[VMUDirectedGraph decapsulateSupplementalData:forTag:]", "VMUDirectedGraph.m", 252, "strlen(tag) <= 8");
}

- (void)initWithArchived:version:options:diskLogs:error:.cold.1()
{
  *(_WORD *)v0 = 0;
}

- (void)_adjustAdjacencyMap
{
}

- (void)enumerateMembersOfGroupNode:withBlock:.cold.1()
{
}

- (void)_dfsCore:colors:visitBlock:examineBlock:.cold.1()
{
}

- (void)_dfsCore:colors:visitBlock:examineBlock:.cold.2()
{
  __assert_rtn("-[VMUDirectedGraph _dfsCore:colors:visitBlock:examineBlock:]", "VMUDirectedGraph.m", 1332, "agendaIdx != 0");
}

@end