@interface PGGraphIngestRelationshipProcessor
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestRelationshipProcessor)initWithGraphBuilder:(id)a3;
- (id)_personNodesToAnalyzeInGraph:(id)a3;
- (id)personNodesToAnalyzeInGraph:(id)a3 forAppleInternal:(BOOL)a4;
- (id)tagRelationshipByPersonForPersonNodes:(id)a3;
- (unint64_t)relationshipForRelationshipTag:(unint64_t)a3;
- (void)insertRelationshipEdgesForRelationshipTags:(id)a3 meNode:(id)a4;
- (void)removeInferredRelationshipEdgesForPersonNodes:(id)a3 inGraph:(id)a4;
- (void)removeStorytellingRelationshipEdgesForPersonNodes:(id)a3 inGraph:(id)a4;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestRelationshipProcessor

- (void).cxx_destruct
{
}

- (id)personNodesToAnalyzeInGraph:(id)a3 forAppleInternal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(PGGraphBuilder *)self->_graphBuilder isSharedLibraryEnabled]) {
    goto LABEL_9;
  }
  v7 = [(PGGraphBuilder *)self->_graphBuilder momentNodesWhereMeIsPresent];
  if (![v7 count])
  {
    v11 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D1805000, v11, OS_LOG_TYPE_INFO, "No moments in library where Me is present. Not applying presence filtering", v16, 2u);
    }

LABEL_9:
    v9 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:v6];
    if (v4) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
  v8 = [v7 presentPersonNodes];
  v9 = [v8 subsetExcludingMe];

  if (!v9) {
    goto LABEL_9;
  }
  if (v4)
  {
LABEL_5:
    id v10 = v9;
    goto LABEL_11;
  }
LABEL_10:
  v12 = [v6 meNodeCollection];
  v13 = [v12 relatedPersonNodes];

  v14 = [v9 collectionBySubtracting:v13];

  id v10 = v14;
LABEL_11:

  return v10;
}

- (id)_personNodesToAnalyzeInGraph:(id)a3
{
  id v4 = a3;
  if (PGIsAppleInternal_onceToken != -1) {
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8452);
  }
  v5 = [(PGGraphIngestRelationshipProcessor *)self personNodesToAnalyzeInGraph:v4 forAppleInternal:PGIsAppleInternal_isAppleInternal];

  return v5;
}

- (void)removeStorytellingRelationshipEdgesForPersonNodes:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  v9 = [v7 storytellingRelationshipEdges];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__PGGraphIngestRelationshipProcessor_removeStorytellingRelationshipEdgesForPersonNodes_inGraph___block_invoke;
  v11[3] = &unk_1E68EC6A0;
  id v10 = v8;
  id v12 = v10;
  [v9 enumerateEdgesUsingBlock:v11];

  if ([v10 numberOfChanges]) {
    [v5 executeGraphChangeRequest:v10];
  }
}

uint64_t __96__PGGraphIngestRelationshipProcessor_removeStorytellingRelationshipEdgesForPersonNodes_inGraph___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeEdge:a2];
}

- (void)removeInferredRelationshipEdgesForPersonNodes:(id)a3 inGraph:(id)a4
{
  id v5 = a4;
  id v6 = [a3 relationshipEdges];
  id v7 = +[PGGraphRelationshipEdge confirmedRelationshipFilter];
  id v8 = [v6 edgesMatchingFilter:v7];
  id v10 = [v6 collectionBySubtracting:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v9 removeEdges:v10];
  [v5 executeGraphChangeRequest:v9];
}

- (unint64_t)relationshipForRelationshipTag:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 - 1;
  if (a3 - 1 < 0xD && ((0x1EFFu >> v4) & 1) != 0) {
    return qword_1D1F4FDD0[v4];
  }
  id v5 = +[PGLogging sharedLogging];
  id v6 = [v5 loggingConnection];

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = +[PGGraphPersonRelationshipTagNode labelForRelationshipTag:a3];
    int v9 = 134218242;
    unint64_t v10 = a3;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1D1805000, v6, OS_LOG_TYPE_INFO, "[PGGraphIngestRelationshipProcessor] Encountered unmapped entity tag %lu (%@) during relationship ingest", (uint8_t *)&v9, 0x16u);
  }
  return 0;
}

- (id)tagRelationshipByPersonForPersonNodes:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = __Block_byref_object_copy__55580;
  id v12 = __Block_byref_object_dispose__55581;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__PGGraphIngestRelationshipProcessor_tagRelationshipByPersonForPersonNodes___block_invoke;
  v7[3] = &unk_1E68EF708;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateNodesUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __76__PGGraphIngestRelationshipProcessor_tagRelationshipByPersonForPersonNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 collection];
  id v5 = [v4 relationshipTagEdges];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PGGraphIngestRelationshipProcessor_tagRelationshipByPersonForPersonNodes___block_invoke_2;
  v9[3] = &unk_1E68EC678;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v7;
  v9[4] = v6;
  id v8 = v3;
  [v5 enumerateEdgesUsingBlock:v9];
}

void __76__PGGraphIngestRelationshipProcessor_tagRelationshipByPersonForPersonNodes___block_invoke_2(void *a1, void *a2)
{
  id v10 = a2;
  [v10 confidence];
  id v3 = v10;
  if (v4 >= 0.9)
  {
    id v5 = (void *)a1[4];
    uint64_t v6 = [v10 tagNode];
    uint64_t v7 = objc_msgSend(v5, "relationshipForRelationshipTag:", objc_msgSend(v6, "tag"));

    id v3 = v10;
    if (v7)
    {
      id v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) objectForKeyedSubscript:a1[5]];
      if (!v8) {
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      }
      int v9 = [NSNumber numberWithUnsignedInteger:v7];
      [v8 addObject:v9];

      [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v8 forKeyedSubscript:a1[5]];
      id v3 = v10;
    }
  }
}

- (void)insertRelationshipEdgesForRelationshipTags:(id)a3 meNode:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__PGGraphIngestRelationshipProcessor_insertRelationshipEdgesForRelationshipTags_meNode___block_invoke;
  v8[3] = &unk_1E68EC650;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void __88__PGGraphIngestRelationshipProcessor_insertRelationshipEdgesForRelationshipTags_meNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) unsignedIntegerValue];
        id v12 = +[PGGraphRelationshipEdge propertiesWithRelationshipSource:1];
        [*(id *)(*(void *)(a1 + 32) + 8) addRelationshipEdgesBetweenPersonNode:*(void *)(a1 + 40) andPersonNode:v5 forRelationship:v11 confidence:v12 properties:0.99];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PGGraphBuilder *)self->_graphBuilder graph];
  uint64_t v9 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  id v12 = v11;
  unint64_t v50 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestRelationshipProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v47 = mach_absolute_time();
  if ([v6 isResumingFullAnalysis])
  {
    long long v13 = [(PGGraphIngestRelationshipProcessor *)self _personNodesToAnalyzeInGraph:v8];
  }
  else
  {
    long long v14 = [PGGraphPersonNodeCollection alloc];
    long long v15 = [v6 insertedAndUpdatedPersonNodes];
    long long v13 = [(MAElementCollection *)v14 initWithSet:v15 graph:v8];
  }
  if ([(MAElementCollection *)v13 count])
  {
    os_signpost_id_t spid = v10;
    id v46 = v6;
    [(PGGraphIngestRelationshipProcessor *)self removeInferredRelationshipEdgesForPersonNodes:v13 inGraph:v8];
    long long v16 = [PGGraphRelationshipProcessor alloc];
    v17 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
    uint64_t v18 = [(PGGraphRelationshipProcessor *)v16 initWithPersonNodes:v13 runOptions:8190 serviceManager:v17];

    id v45 = v7;
    [(PGGraphRelationshipProcessor *)v18 runRelationshipAnalysisWithLoggingConnection:v12 progressBlock:v7];
    v19 = [v8 meNode];
    LOBYTE(v17) = +[PGUserDefaults isRelationshipSignalPropertiesIngestAllowed];
    BOOL v20 = +[PGUserDefaults isRelationshipFilteredOutInferencesIngestAllowed];
    v49 = v8;
    v44 = +[PGGraphNodeCollection nodesInGraph:v8];
    v21 = [v44 personNodeByLocalIdentifier];
    v22 = [(PGGraphIngestRelationshipProcessor *)self tagRelationshipByPersonForPersonNodes:v13];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __71__PGGraphIngestRelationshipProcessor_runWithGraphUpdate_progressBlock___block_invoke;
    v54[3] = &unk_1E68EC600;
    id v23 = v21;
    BOOL v59 = v20;
    char v60 = (char)v17;
    id v55 = v23;
    v56 = self;
    id v24 = v19;
    id v57 = v24;
    id v25 = v22;
    id v58 = v25;
    v48 = v18;
    [(PGGraphRelationshipProcessor *)v18 enumerateInferredRelationshipsUsingBlock:v54];
    if ([v25 count]) {
      [(PGGraphIngestRelationshipProcessor *)self insertRelationshipEdgesForRelationshipTags:v25 meNode:v24];
    }
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v27 = [v24 collection];
    v28 = [v27 relatedPersonNodes];
    v29 = [(MAElementCollection *)v13 collectionByIntersecting:v28];

    [(PGGraphBuilder *)self->_graphBuilder insertStorytellingRelationshipsWithRelationshipsForPersonNodes:v29 meNode:v24];
    v30 = [(MAElementCollection *)v13 collectionBySubtracting:v29];
    [(PGGraphIngestRelationshipProcessor *)self removeStorytellingRelationshipEdgesForPersonNodes:v30 inGraph:v49];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __71__PGGraphIngestRelationshipProcessor_runWithGraphUpdate_progressBlock___block_invoke_2;
    v51[3] = &unk_1E68EC628;
    id v31 = v23;
    id v52 = v31;
    id v32 = v26;
    id v53 = v32;
    [(PGGraphRelationshipProcessor *)v48 enumerateHighRecallInferredRelationshipsExcludingPersonNodes:v29 usingBlock:v51];
    [(PGGraphBuilder *)self->_graphBuilder addStorytellingRelationshipsToMeNode:v24 relationshipByPerson:v32];
    uint64_t v33 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v36 = v12;
    v37 = v36;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v37, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestRelationshipProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "PGGraphIngestRelationshipProcessor";
      __int16 v64 = 2048;
      double v65 = (float)((float)((float)((float)(v33 - v47) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    id v7 = v45;
    id v6 = v46;
    uint64_t v8 = v49;
  }
  else
  {
    uint64_t v38 = mach_absolute_time();
    uint32_t v40 = info.numer;
    uint32_t v39 = info.denom;
    v41 = v12;
    v42 = v41;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v42, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestRelationshipProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "PGGraphIngestRelationshipProcessor";
      __int16 v64 = 2048;
      double v65 = (float)((float)((float)((float)(v38 - v47) * (float)v40) / (float)v39) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v42, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
}

void __71__PGGraphIngestRelationshipProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  id v14 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (a5 > 0.0 || *(unsigned char *)(a1 + 64))
  {
    double v10 = 0.99;
    if (a5 < 1.0) {
      double v10 = a5;
    }
    if (*(unsigned char *)(a1 + 65)) {
      id v11 = v14;
    }
    else {
      id v11 = 0;
    }
    [*(id *)(*(void *)(a1 + 40) + 8) addRelationshipEdgesBetweenPersonNode:*(void *)(a1 + 48) andPersonNode:v9 forRelationship:a3 confidence:v11 properties:v10];
    id v12 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
    long long v13 = [NSNumber numberWithUnsignedInteger:a3];
    [v12 removeObject:v13];
  }
}

void __71__PGGraphIngestRelationshipProcessor_runWithGraphUpdate_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4 = a3;
  if ((([v4 isResumingFullAnalysis] & 1) != 0 || objc_msgSend(v4, "hasUpdatedPersonNodes"))
    && !+[PGUserDefaults isRelationshipInferenceDisabled])
  {
    id v6 = [(PGGraphBuilder *)self->_graphBuilder graph];
    id v7 = [v6 meNode];
    BOOL v5 = v7 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (PGGraphIngestRelationshipProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestRelationshipProcessor;
  id v6 = [(PGGraphIngestRelationshipProcessor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

@end