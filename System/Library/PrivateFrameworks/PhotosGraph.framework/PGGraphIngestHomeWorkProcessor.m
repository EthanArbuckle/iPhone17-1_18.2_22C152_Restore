@interface PGGraphIngestHomeWorkProcessor
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestHomeWorkProcessor)initWithGraphBuilder:(id)a3;
- (void)_deleteEdgelessHomeWorkNodesInGraph:(id)a3;
- (void)_deleteLocationEdgesOfPersonNodes:(id)a3 inGraph:(id)a4;
- (void)inferHomeWorkAddressesOfPersonNodes:(id)a3 andCLSPersonByContactIdentifier:(id)a4 inGraph:(id)a5;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestHomeWorkProcessor

- (void).cxx_destruct
{
}

- (void)_deleteLocationEdgesOfPersonNodes:(id)a3 inGraph:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a3 homeOrWorkNodes];
  v8 = [MEMORY[0x1E4F71EB0] any];
  v9 = +[MAEdgeCollection edgesOfType:3 onNodes:v7 matchingFilter:v8];

  v10 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [v9 count];
    v12 = [v7 description];
    int v14 = 134218242;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "[PGGraphIngestHomeWorkProcessor] Deleted %lu edges that are connected to HomeWork nodes [%@]", (uint8_t *)&v14, 0x16u);
  }
  if ([v9 count])
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v13 removeEdges:v9];
    [v6 executeGraphChangeRequest:v13];
  }
}

- (void)_deleteEdgelessHomeWorkNodesInGraph:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PGGraphHomeWorkNode filter];
  [v5 setWhereNoInAndOutEdges:1];
  id v6 = [v4 nodeIdentifiersMatchingFilter:v5];
  v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    uint64_t v10 = [v6 count];
    _os_log_impl(&dword_1D1805000, v7, OS_LOG_TYPE_INFO, "[PGGraphIngestHomeWorkProcessor] Deleted %lu homeWork nodes from the graph", (uint8_t *)&v9, 0xCu);
  }

  if ([v6 count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v8 removeNodesForIdentifiers:v6];
    [v4 executeGraphChangeRequest:v8];
  }
}

- (void)inferHomeWorkAddressesOfPersonNodes:(id)a3 andCLSPersonByContactIdentifier:(id)a4 inGraph:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __110__PGGraphIngestHomeWorkProcessor_inferHomeWorkAddressesOfPersonNodes_andCLSPersonByContactIdentifier_inGraph___block_invoke;
  v12[3] = &unk_1E68EEC70;
  id v13 = v8;
  id v14 = v9;
  uint64_t v15 = self;
  id v10 = v9;
  id v11 = v8;
  [a3 enumerateNodesUsingBlock:v12];
}

void __110__PGGraphIngestHomeWorkProcessor_inferHomeWorkAddressesOfPersonNodes_andCLSPersonByContactIdentifier_inGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D25FED50]();
  v5 = [v3 contactIdentifier];
  if ([v5 length])
  {
    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    v7 = v6;
    if (v6 && [v6 hasAddresses])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v9 = [v7 locationsByAddressTypes];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __110__PGGraphIngestHomeWorkProcessor_inferHomeWorkAddressesOfPersonNodes_andCLSPersonByContactIdentifier_inGraph___block_invoke_2;
      v15[3] = &unk_1E68EB5B0;
      id v10 = v8;
      id v16 = v10;
      [v9 enumerateKeysAndObjectsUsingBlock:v15];

      if ([v10 count])
      {
        id v11 = +[PGGraphAddressNodeCollection addressNodesWithinDistance:v10 ofLocations:*(void *)(a1 + 40) inGraph:150.0];
        v12 = *(void **)(*(void *)(a1 + 48) + 8);
        id v13 = [v11 temporarySet];
        id v14 = (id)[v12 insertHomeWorkNodeForPerson:v7 personNode:v3 fromAddressNodes:v13];
      }
    }
  }
}

uint64_t __110__PGGraphIngestHomeWorkProcessor_inferHomeWorkAddressesOfPersonNodes_andCLSPersonByContactIdentifier_inGraph___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id aBlock = a4;
  id v6 = [(PGGraphBuilder *)self->_graphBuilder graph];
  v26 = _Block_copy(aBlock);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  id v9 = v7;
  id v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v11 = v8 - 1;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PGGraphIngestHomeWorkProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v24 = mach_absolute_time();
  v12 = [v27 updatedPersonNodesUnrelatedToMomentChange];
  if (![v12 count]) {
    goto LABEL_10;
  }
  id v13 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithSet:v12 graph:v6];
  [(PGGraphIngestHomeWorkProcessor *)self _deleteLocationEdgesOfPersonNodes:v13 inGraph:v6];
  id v14 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
  uint64_t v15 = [(PGGraphPersonNodeCollection *)v13 contactIdentifiers];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __67__PGGraphIngestHomeWorkProcessor_runWithGraphUpdate_progressBlock___block_invoke;
  v29[3] = &unk_1E68F03F8;
  id v30 = v26;
  v31 = v35;
  v32 = &v36;
  uint64_t v33 = 0x3F847AE147AE147BLL;
  id v16 = [v14 personsInContactStoreForContactIdentifiers:v15 needsRefetching:0 progressBlock:v29];

  int v17 = *((unsigned __int8 *)v37 + 24);
  if (*((unsigned char *)v37 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v41 = 66;
      *(_WORD *)&v41[4] = 2080;
      *(void *)&v41[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Ingest/Ingest Processing/PGGraphIngestHomeWorkProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    [(PGGraphIngestHomeWorkProcessor *)self inferHomeWorkAddressesOfPersonNodes:v13 andCLSPersonByContactIdentifier:v16 inGraph:v6];
    uint64_t v18 = [v16 allKeys];
    [v14 invalidateCacheForPersonInContactStoreWithContactIdentifiers:v18];
  }
  if (!v17)
  {
LABEL_10:
    [(PGGraphIngestHomeWorkProcessor *)self _deleteEdgelessHomeWorkNodesInGraph:v6];
    uint64_t v19 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v22 = v10;
    v23 = v22;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v23, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestHomeWorkProcessor", "", buf, 2u);
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v41 = "PGGraphIngestHomeWorkProcessor";
      *(_WORD *)&v41[8] = 2048;
      *(double *)&v41[10] = (float)((float)((float)((float)(v19 - v24) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v36, 8);
}

void __67__PGGraphIngestHomeWorkProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if ([v3 isResumingFullAnalysis])
  {
    char v4 = 0;
  }
  else if ([v3 hasUpdatedPersonNodesUnrelatedToMomentChange])
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 hasDeletedPersonNodes];
  }

  return v4;
}

- (PGGraphIngestHomeWorkProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestHomeWorkProcessor;
  id v6 = [(PGGraphIngestHomeWorkProcessor *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

@end