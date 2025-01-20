@interface PGGraphRelationshipTaggingProcessor
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphRelationshipTaggingProcessor)initWithGraphBuilder:(id)a3;
- (void)_insertTagNodesWithEdgesForPersonsTagsWithConfidence:(id)a3 withChangeRequest:(id)a4;
- (void)processRelationshipTagsForPersonNodes:(id)a3 progressBlock:(id)a4;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphRelationshipTaggingProcessor

- (void).cxx_destruct
{
}

- (void)_insertTagNodesWithEdgesForPersonsTagsWithConfidence:(id)a3 withChangeRequest:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  v10 = [(PGGraphBuilder *)self->_graphBuilder graph];
  v11 = +[PGGraphNodeCollection nodesInGraph:v10];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke;
  v18[3] = &unk_1E68ED438;
  id v12 = v9;
  id v19 = v12;
  [v11 enumerateNodesUsingBlock:v18];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke_2;
  v15[3] = &unk_1E68E4CB8;
  id v16 = v12;
  id v17 = v6;
  id v13 = v6;
  id v14 = v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];
}

void __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 label];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke_3;
  v7[3] = &unk_1E68E4C90;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  if (!v6)
  {
    id v6 = [[PGGraphPersonRelationshipTagNode alloc] initWithPersonRelationshipTag:+[PGGraphPersonRelationshipTagNode relationshipTagFromString:v9]];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v9];
    [*(id *)(a1 + 40) addNode:v6];
  }
  [v5 doubleValue];
  id v8 = [[PGGraphRelationshipTagEdge alloc] initFromPersonNode:*(void *)(a1 + 48) toRelationshipTagNode:v6 withConfidence:v7];
  [*(id *)(a1 + 40) addEdge:v8];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v7 = os_signpost_id_generate(v6);
  id v8 = v6;
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PGGraphRelationshipTaggingProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v10 = mach_absolute_time();
  v11 = [(PGGraphBuilder *)self->_graphBuilder graph];
  id v12 = +[PGGraphNodeCollection nodesInGraph:v11];
  if ([v12 count])
  {
    [(PGGraphRelationshipTaggingProcessor *)self processRelationshipTagsForPersonNodes:v12 progressBlock:v5];
  }
  else
  {
    id v13 = +[PGLogging sharedLogging];
    id v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[RelationshipTags] Skipping relationship tag ingest, no persons to process", buf, 2u);
    }
  }
  uint64_t v15 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v18 = v9;
  id v19 = v18;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_END, v7, "PGGraphRelationshipTaggingProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "PGGraphRelationshipTaggingProcessor";
    __int16 v23 = 2048;
    double v24 = (float)((float)((float)((float)(v15 - v10) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (void)processRelationshipTagsForPersonNodes:(id)a3 progressBlock:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void *, uint8_t *, double))_Block_copy(v7);
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v58 = 0;
  v59 = (double *)&v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  v43 = v7;
  if (!v8
    || (double v9 = CFAbsoluteTimeGetCurrent(), v9 - v59[3] < 0.01)
    || (v59[3] = v9,
        v66[0] = 0,
        v8[2](v8, v66, 0.0),
        char v10 = *((unsigned char *)v63 + 24) | v66[0],
        (*((unsigned char *)v63 + 24) = v10) == 0))
  {
    v11 = +[PGGraphPersonRelationshipTagNode supportedTagsAsStrings];
    id v12 = [PGGraphEntityTaggingServiceClient alloc];
    id v13 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    id v57 = 0;
    id v14 = [(PGGraphEntityTaggingServiceClient *)v12 initWithSupportedTagsAsStrings:v11 log:v13 error:&v57];
    id v42 = v57;

    if (!v14)
    {
      v34 = +[PGLogging sharedLogging];
      v35 = [v34 loggingConnection];

      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v42;
        _os_log_error_impl(&dword_1D1805000, v35, OS_LOG_TYPE_ERROR, "[RelationshipTags] Error accessing entity tagging service: %@", buf, 0xCu);
      }

      if (!v8) {
        goto LABEL_40;
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v59[3] < 0.01) {
        goto LABEL_40;
      }
      v59[3] = Current;
      v66[0] = 0;
      v8[2](v8, v66, 1.0);
      char v37 = *((unsigned char *)v63 + 24) | v66[0];
      *((unsigned char *)v63 + 24) = v37;
      if (!v37 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_40;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 51;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/People Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
      id v17 = MEMORY[0x1E4F14500];
      goto LABEL_31;
    }
    if (v8)
    {
      double v15 = CFAbsoluteTimeGetCurrent();
      if (v15 - v59[3] >= 0.01)
      {
        v59[3] = v15;
        v66[0] = 0;
        v8[2](v8, v66, 0.1);
        char v16 = *((unsigned char *)v63 + 24) | v66[0];
        *((unsigned char *)v63 + 24) = v16;
        if (v16)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_40:

            goto LABEL_41;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 55;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/People Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
          id v17 = MEMORY[0x1E4F14500];
LABEL_31:
          _os_log_impl(&dword_1D1805000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_40;
        }
      }
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    id v19 = [v6 relationshipTagEdges];
    if ([v19 count]) {
      [v18 removeEdges:v19];
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v71 = 0x3FC999999999999ALL;
    unint64_t v20 = [v6 count];
    if (v8)
    {
      double v21 = CFAbsoluteTimeGetCurrent();
      if (v21 - v59[3] >= 0.01)
      {
        v59[3] = v21;
        char v56 = 0;
        v8[2](v8, (uint8_t *)&v56, *(double *)(*(void *)&buf[8] + 24));
        char v22 = *((unsigned char *)v63 + 24) | v56;
        *((unsigned char *)v63 + 24) = v22;
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v66 = 67109378;
            int v67 = 64;
            __int16 v68 = 2080;
            v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v66, 0x12u);
          }
          goto LABEL_39;
        }
      }
    }
    v41 = v19;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dispatch_group_t v24 = dispatch_group_create();
    uint64_t v25 = objc_alloc_init(PGUnfairLock);
    double v26 = 0.8 / (double)v20;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke;
    v44[3] = &unk_1E68E4C68;
    v27 = v24;
    v45 = v27;
    v46 = v14;
    id v47 = v11;
    v28 = v25;
    v48 = v28;
    id v29 = v23;
    id v49 = v29;
    v51 = buf;
    double v54 = v26;
    v30 = v8;
    v50 = v30;
    v52 = &v58;
    uint64_t v55 = 0x3F847AE147AE147BLL;
    v53 = &v62;
    [v6 enumerateNodesUsingBlock:v44];
    dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    if (v8
      && (double v31 = CFAbsoluteTimeGetCurrent(), v31 - v59[3] >= 0.01)
      && (v59[3] = v31,
          char v56 = 0,
          v30[2](v30, (uint8_t *)&v56, 0.9),
          char v32 = *((unsigned char *)v63 + 24) | v56,
          (*((unsigned char *)v63 + 24) = v32) != 0))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_38:

        id v19 = v41;
LABEL_39:
        _Block_object_dispose(buf, 8);

        goto LABEL_40;
      }
      *(_DWORD *)v66 = 67109378;
      int v67 = 97;
      __int16 v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
      v33 = MEMORY[0x1E4F14500];
    }
    else
    {
      [(PGGraphRelationshipTaggingProcessor *)self _insertTagNodesWithEdgesForPersonsTagsWithConfidence:v29 withChangeRequest:v18];
      v38 = [(PGGraphBuilder *)self->_graphBuilder graph];
      [v38 executeGraphChangeRequest:v18];

      if (!v8) {
        goto LABEL_38;
      }
      double v39 = CFAbsoluteTimeGetCurrent();
      if (v39 - v59[3] < 0.01) {
        goto LABEL_38;
      }
      v59[3] = v39;
      char v56 = 0;
      v30[2](v30, (uint8_t *)&v56, 1.0);
      char v40 = *((unsigned char *)v63 + 24) | v56;
      *((unsigned char *)v63 + 24) = v40;
      if (!v40 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_38;
      }
      *(_DWORD *)v66 = 67109378;
      int v67 = 101;
      __int16 v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
      v33 = MEMORY[0x1E4F14500];
    }
    _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v66, 0x12u);
    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 44;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/People Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_41:
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
}

void __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [v5 localIdentifier];
  if ([v6 length])
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke_2;
    v11[3] = &unk_1E68E4C40;
    id v12 = v6;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    id v16 = *(id *)(a1 + 64);
    id v17 = v5;
    uint64_t v20 = *(void *)(a1 + 104);
    long long v10 = *(_OWORD *)(a1 + 72);
    id v8 = (id)v10;
    uint64_t v21 = *(void *)(a1 + 112);
    long long v9 = *(_OWORD *)(a1 + 88);
    long long v18 = v10;
    long long v19 = v9;
    uint64_t v22 = a3;
    [v7 entityTagsForPersonWithPersonLocalIdentifier:v12 completionHandler:v11];
  }
}

void __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke_235;
    id v17 = &unk_1E68E4C18;
    id v18 = *(id *)(a1 + 48);
    id v8 = v7;
    id v19 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:&v14];
    objc_msgSend(*(id *)(a1 + 56), "lock", v14, v15, v16, v17);
    [*(id *)(a1 + 64) setObject:v8 forKeyedSubscript:*(void *)(a1 + 72)];
    *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 112)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
    if (*(void *)(a1 + 80)
      && (double Current = CFAbsoluteTimeGetCurrent(),
          uint64_t v10 = *(void *)(*(void *)(a1 + 96) + 8),
          Current - *(double *)(v10 + 24) >= *(double *)(a1 + 120))
      && (*(double *)(v10 + 24) = Current,
          buf[0] = 0,
          (*(void (**)(double))(*(void *)(a1 + 80) + 16))(*(double *)(*(void *)(*(void *)(a1 + 88)
                                                                                               + 8)
                                                                                   + 24)),
          (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) |= buf[0]) != 0))
    {
      **(unsigned char **)(a1 + 128) = 1;
    }
    else
    {
      [*(id *)(a1 + 56) unlock];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
  else
  {
    v11 = +[PGLogging sharedLogging];
    id v12 = [v11 loggingConnection];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[RelationshipTags] Error querying tags for person %@: %@", buf, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke_235(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 isResumingFullAnalysis]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasUpdatedPersonNodes];
  }

  return v4;
}

- (PGGraphRelationshipTaggingProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphRelationshipTaggingProcessor;
  id v6 = [(PGGraphRelationshipTaggingProcessor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

@end