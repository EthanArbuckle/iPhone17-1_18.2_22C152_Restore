@interface PGGraphIngestPetProcessor
+ (id)supportedPetDetectionTypes;
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestPetProcessor)initWithGraphBuilder:(id)a3;
- (id)_fetchAllVerifiedPetsInPhotosLibrary:(id)a3;
- (id)_fetchVerifiedPetsWithLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4;
- (id)initForTestingWithGraphBuilder:(id)a3;
- (id)momentNodesForPerson:(id)a3 inPhotoLibrary:(id)a4 withGraph:(id)a5;
- (unint64_t)_speciesForDetectionType:(signed __int16)a3;
- (void)_deleteAllPetNodesInGraph:(id)a3;
- (void)_deletePetNodesWithLocalIdentifiers:(id)a3 inGraph:(id)a4;
- (void)_donatePetRelationshipsForPetNodes:(id)a3 isFullRebuild:(BOOL)a4 progressBlock:(id)a5;
- (void)runPetIngestWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPetProcessor

- (void).cxx_destruct
{
}

- (void)_donatePetRelationshipsForPetNodes:(id)a3 isFullRebuild:(BOOL)a4 progressBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v8 = a5;
  v9 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v8);
  double v10 = 0.0;
  if (v9)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v9[2](v9, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v38 = 284;
          *(_WORD *)&v38[4] = 2080;
          *(void *)&v38[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_35;
      }
      double v10 = Current;
    }
  }
  v12 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphIngestPetProcessorRelationshipDonation", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v30 = mach_absolute_time();
  v16 = objc_alloc_init(PGGraphPetRelationshipDonator);
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __92__PGGraphIngestPetProcessor__donatePetRelationshipsForPetNodes_isFullRebuild_progressBlock___block_invoke;
  v33[3] = &unk_1E68E5E48;
  v18 = v15;
  v34 = v18;
  v19 = v17;
  v35 = v19;
  [(PGGraphPetRelationshipDonator *)v16 donateWithPetNodes:v31 isRebuild:v6 completionHandler:v33];
  uint64_t v20 = 0;
  while (1)
  {
    ++v20;
    dispatch_time_t v21 = dispatch_time(0, 10000000000);
    intptr_t v22 = dispatch_group_wait(v19, v21);
    BOOL v23 = v22 != 0;
    if (!v22)
    {
      double v24 = v10;
LABEL_18:
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1805000, v18, OS_LOG_TYPE_INFO, "PGGraphIngestPetProcessor - finished relationhip inference donation", buf, 2u);
      }
      double v10 = v24;
      goto LABEL_24;
    }
    if (v20 == 3) {
      break;
    }
    if (v9)
    {
      double v24 = CFAbsoluteTimeGetCurrent();
      if (v24 - v10 >= 0.01)
      {
        buf[0] = 0;
        v9[2](v9, (mach_timebase_info *)buf, 0.5);
        double v10 = v24;
        if (buf[0]) {
          goto LABEL_18;
        }
      }
    }
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "PGGraphIngestPetProcessor - timed out waiting for relationship inference donation to complete", buf, 2u);
  }
  BOOL v23 = 0;
LABEL_24:
  uint64_t v25 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v28 = v18;
  v29 = v28;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v29, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphIngestPetProcessorRelationshipDonation", "", buf, 2u);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)v38 = "PGGraphIngestPetProcessorRelationshipDonation";
    *(_WORD *)&v38[8] = 2048;
    *(double *)&v38[10] = (float)((float)((float)((float)(v25 - v30) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  if (v9)
  {
    if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
    {
      unsigned __int8 v32 = 0;
      v9[2](v9, (mach_timebase_info *)&v32, 1.0);
      if (v32 | v23)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v38 = 327;
          *(_WORD *)&v38[4] = 2080;
          *(void *)&v38[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

LABEL_35:
}

void __92__PGGraphIngestPetProcessor__donatePetRelationshipsForPetNodes_isFullRebuild_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_error_impl(&dword_1D1805000, v4, OS_LOG_TYPE_ERROR, "PGGraphIngestPetProcessor - inferred pet relationship donation failed: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_INFO))
  {
    LOWORD(v5) = 0;
    _os_log_impl(&dword_1D1805000, v4, OS_LOG_TYPE_INFO, "PGGraphIngestPetProcessor - inferred pet relationship donation succeeded", (uint8_t *)&v5, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_deleteAllPetNodesInGraph:(id)a3
{
  id v3 = a3;
  id v5 = +[PGGraphNodeCollection nodesInGraph:v3];
  id v4 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  [v4 removeNodes:v5];
  [v3 executeGraphChangeRequest:v4];
}

- (void)_deletePetNodesWithLocalIdentifiers:(id)a3 inGraph:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 count])
  {
    id v6 = +[PGGraphPetNodeCollection petNodesForLocalIdentifiers:v8 inGraph:v5];
    id v7 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v7 removeNodes:v6];
    [v5 executeGraphChangeRequest:v7];
  }
}

- (id)_fetchVerifiedPetsWithLocalIdentifiers:(id)a3 inPhotoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [v6 librarySpecificFetchOptions];
    id v8 = [(id)objc_opt_class() supportedPetDetectionTypes];
    [v7 setIncludedDetectionTypes:v8];

    [v7 setPersonContext:1];
    v9 = (void *)MEMORY[0x1E4F391F0];
    double v10 = [v5 allObjects];
    v11 = [v9 fetchPersonsWithLocalIdentifiers:v10 options:v7];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_fetchAllVerifiedPetsInPhotosLibrary:(id)a3
{
  id v3 = [a3 librarySpecificFetchOptions];
  id v4 = [(id)objc_opt_class() supportedPetDetectionTypes];
  [v3 setIncludedDetectionTypes:v4];

  [v3 setPersonContext:1];
  id v5 = [MEMORY[0x1E4F391F0] fetchPersonsWithOptions:v3];

  return v5;
}

- (unint64_t)_speciesForDetectionType:(signed __int16)a3
{
  switch(a3)
  {
    case 0:
    case 2:
      unint64_t result = 0;
      break;
    case 1:
      uint64_t v9 = v3;
      uint64_t v10 = v4;
      id v6 = +[PGLogging sharedLogging];
      id v7 = [v6 loggingConnection];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "Received person's face when expected animal's face", v8, 2u);
      }

      unint64_t result = 0;
      break;
    case 3:
      unint64_t result = 2;
      break;
    default:
      unint64_t result = 1;
      break;
  }
  return result;
}

- (id)momentNodesForPerson:(id)a3 inPhotoLibrary:(id)a4 withGraph:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x1E4F391A0];
  uint64_t v10 = [a3 localIdentifier];
  v28[0] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  v12 = [v7 librarySpecificFetchOptions];
  os_signpost_id_t v13 = [v9 fetchMomentsForPersonsWithLocalIdentifiers:v11 options:v12];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "uuid", (void)v23);
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  dispatch_time_t v21 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v14 inGraph:v8];

  return v21;
}

- (void)runPetIngestWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v89 = a3;
  id v82 = a4;
  double v5 = 0.0;
  v93 = (void (**)(void *, uint8_t *, double))_Block_copy(v82);
  if (!v93 || (double v6 = CFAbsoluteTimeGetCurrent(), v6 < 0.01))
  {
LABEL_7:
    v91 = [(PGGraphBuilder *)self->_graphBuilder graph];
    v84 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
    id v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    os_signpost_id_t v8 = os_signpost_id_generate(v7);
    uint64_t v9 = v7;
    uint64_t v10 = v9;
    os_signpost_id_t spid = v8;
    unint64_t v78 = v8 - 1;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGGraphIngestPetProcessor", "", buf, 2u);
    }
    v81 = v10;

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v76 = mach_absolute_time();
    if (v93)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v5 >= 0.01)
      {
        v107[0] = 0;
        v93[2](v93, v107, 0.0);
        if (v107[0])
        {
          v12 = v10;
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = 120;
            *(_WORD *)&buf[8] = 2080;
            *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_106;
        }
        double v5 = Current;
      }
    }
    unsigned int v79 = [v89 isResumingFullAnalysis];
    if (v79)
    {
      [(PGGraphIngestPetProcessor *)self _deleteAllPetNodesInGraph:v91];
      v85 = [(PGGraphIngestPetProcessor *)self _fetchAllVerifiedPetsInPhotosLibrary:v84];
    }
    else
    {
      os_signpost_id_t v13 = objc_msgSend(v89, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v91, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
      id v14 = [v13 petNodes];
      id v15 = [v14 localIdentifiers];

      uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
      [v16 unionSet:v15];
      uint64_t v17 = [v89 localIdentifiersOfPersonsToUpdate];
      [v16 unionSet:v17];

      uint64_t v18 = [v89 localIdentifiersOfPersonsToDelete];
      [v16 unionSet:v18];

      v19 = [MEMORY[0x1E4F1CA80] set];
      [v19 unionSet:v15];
      uint64_t v20 = [v89 localIdentifiersOfPersonsToUpdate];
      [v19 unionSet:v20];

      [(PGGraphIngestPetProcessor *)self _deletePetNodesWithLocalIdentifiers:v16 inGraph:v91];
      v85 = [(PGGraphIngestPetProcessor *)self _fetchVerifiedPetsWithLocalIdentifiers:v19 inPhotoLibrary:v84];
    }
    if (!v85 || ![v85 count])
    {
      uint64_t v25 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v28 = v81;
      v29 = v28;
      if (v78 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v28))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v29, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestPetProcessor", "", buf, 2u);
      }

      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        goto LABEL_105;
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "PGGraphIngestPetProcessor";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v25 - v76) * (float)numer) / (float)denom) / 1000000.0);
      long long v23 = "[Performance] %s: %f ms";
      intptr_t v22 = v29;
      uint32_t v24 = 22;
      goto LABEL_31;
    }
    if (v93)
    {
      double v21 = CFAbsoluteTimeGetCurrent();
      if (v21 - v5 >= 0.01)
      {
        v107[0] = 0;
        v93[2](v93, v107, 0.2);
        if (v107[0])
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
LABEL_105:

            v12 = v81;
LABEL_106:

            goto LABEL_107;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 155;
          *(_WORD *)&buf[8] = 2080;
          *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
          intptr_t v22 = MEMORY[0x1E4F14500];
          long long v23 = "Cancelled at line %d in file %s";
          uint32_t v24 = 18;
LABEL_31:
          _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, v23, buf, v24);
          goto LABEL_105;
        }
        double v5 = v21;
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v112 = __Block_byref_object_copy__12445;
    v113 = __Block_byref_object_dispose__12446;
    id v114 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __71__PGGraphIngestPetProcessor_runPetIngestWithGraphUpdate_progressBlock___block_invoke;
    v105[3] = &unk_1E68E5DF8;
    v105[4] = buf;
    [v85 enumerateObjectsUsingBlock:v105];
    v88 = [MEMORY[0x1E4F391A0] fetchMomentUUIDsByPersonUUIDForPersonsWithUUIDs:*(void *)(*(void *)&buf[8] + 40) photoLibrary:v84];
    if (v93)
    {
      double v30 = CFAbsoluteTimeGetCurrent();
      if (v30 - v5 >= 0.01)
      {
        unsigned __int8 v104 = 0;
        v93[2](v93, &v104, 0.3);
        if (v104)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v107 = 67109378;
            *(_DWORD *)v108 = 164;
            *(_WORD *)&v108[4] = 2080;
            *(void *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v107, 0x12u);
          }
          goto LABEL_104;
        }
        double v5 = v30;
      }
    }
    unint64_t v31 = [v85 count];
    v83 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v31];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id obj = v85;
    uint64_t v32 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
    double v34 = (double)v31;
    if (v32)
    {
      char v90 = 0;
      uint64_t v86 = *(void *)v101;
      double v35 = 0.3;
      *(void *)&long long v33 = 67109378;
      long long v75 = v33;
      while (2)
      {
        uint64_t v36 = 0;
        double v37 = v5;
        uint64_t v87 = v32;
        do
        {
          if (*(void *)v101 != v86) {
            objc_enumerationMutation(obj);
          }
          v38 = *(void **)(*((void *)&v100 + 1) + 8 * v36);
          uint64_t v39 = (void *)MEMORY[0x1D25FED50]();
          unint64_t v40 = -[PGGraphIngestPetProcessor _speciesForDetectionType:](self, "_speciesForDetectionType:", [v38 detectionType]);
          v41 = [v38 uuid];
          v42 = [v88 objectForKeyedSubscript:v41];

          if ([v42 count])
          {
            v43 = +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:v42 inGraph:v91];
            uint64_t v44 = [v38 type];
            v45 = [PGPet alloc];
            v46 = [v38 localIdentifier];
            v47 = [v38 name];
            v48 = [(PGPet *)v45 initWithLocalIdentifier:v46 petSpecies:v40 name:v47 isFavorite:v44 == 1 momentNodes:v43 ownerNodes:0];

            [v83 addObject:v48];
          }
          double v35 = 0.2 / v34 + v35;
          if (v93 && (double v5 = CFAbsoluteTimeGetCurrent(), v5 - v37 >= 0.01))
          {
            unsigned __int8 v104 = 0;
            v93[2](v93, &v104, v35);
            if (v104 | v90 & 1)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v107 = v75;
                *(_DWORD *)v108 = 182;
                *(_WORD *)&v108[4] = 2080;
                *(void *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v107, 0x12u);
              }
              int v49 = 0;
              char v90 = 1;
            }
            else
            {
              char v90 = 0;
              int v49 = 1;
            }
          }
          else
          {
            int v49 = 1;
            double v5 = v37;
          }

          if (!v49)
          {

            goto LABEL_103;
          }
          ++v36;
          double v37 = v5;
        }
        while (v87 != v36);
        uint64_t v32 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v90 = 0;
      double v35 = 0.3;
    }

    if (v93)
    {
      v50 = (double *)&unk_1D1F48000;
      double v51 = CFAbsoluteTimeGetCurrent();
      if (v51 - v5 >= 0.01)
      {
        unsigned __int8 v104 = 0;
        v93[2](v93, &v104, 0.5);
        if (v104 | v90 & 1)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v107 = 67109378;
            *(_DWORD *)v108 = 185;
            *(_WORD *)&v108[4] = 2080;
            *(void *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
            v52 = MEMORY[0x1E4F14500];
LABEL_83:
            _os_log_impl(&dword_1D1805000, v52, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v107, 0x12u);
            goto LABEL_103;
          }
          goto LABEL_103;
        }
        char v90 = 0;
        double v5 = v51;
      }
    }
    else
    {
      v50 = (double *)&unk_1D1F48000;
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v53 = v83;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v96 objects:v109 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v97;
      double v56 = v50[87];
      double v57 = 0.3 / v34;
      while (2)
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v97 != v55) {
            objc_enumerationMutation(v53);
          }
          id v59 = -[PGGraphBuilder insertPet:](self->_graphBuilder, "insertPet:", *(void *)(*((void *)&v96 + 1) + 8 * i), v75);
          double v35 = v57 + v35;
          if (v93)
          {
            double v60 = CFAbsoluteTimeGetCurrent();
            if (v60 - v5 >= v56)
            {
              unsigned __int8 v104 = 0;
              v93[2](v93, &v104, v35);
              if (v104 | v90 & 1)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v107 = 67109378;
                  *(_DWORD *)v108 = 192;
                  *(_WORD *)&v108[4] = 2080;
                  *(void *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v107, 0x12u);
                }

                goto LABEL_103;
              }
              char v90 = 0;
              double v5 = v60;
            }
          }
        }
        uint64_t v54 = [v53 countByEnumeratingWithState:&v96 objects:v109 count:16];
        if (v54) {
          continue;
        }
        break;
      }
    }

    if (v93)
    {
      v61 = (double *)&unk_1D1F48000;
      double v62 = CFAbsoluteTimeGetCurrent();
      if (v62 - v5 >= 0.01)
      {
        unsigned __int8 v104 = 0;
        v93[2](v93, &v104, 0.8);
        if (v104 | v90 & 1)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v107 = 67109378;
            *(_DWORD *)v108 = 195;
            *(_WORD *)&v108[4] = 2080;
            *(void *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGrap"
                                  "h/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
            v52 = MEMORY[0x1E4F14500];
            goto LABEL_83;
          }
LABEL_103:

LABEL_104:
          _Block_object_dispose(buf, 8);

          goto LABEL_105;
        }
        char v90 = 0;
        double v5 = v62;
      }
    }
    else
    {
      v61 = (double *)&unk_1D1F48000;
    }
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __71__PGGraphIngestPetProcessor_runPetIngestWithGraphUpdate_progressBlock___block_invoke_326;
    v94[3] = &unk_1E68E5E20;
    id v64 = v63;
    id v95 = v64;
    +[PGImportantEntitiesPetProcessor processUserPetsInGraph:v91 progressBlock:v82 withProcessInferredPetNodeClosure:v94];
    if ([v64 count])
    {
      graphBuilder = self->_graphBuilder;
      v66 = [v91 meNode];
      [(PGGraphBuilder *)graphBuilder insertOwner:v66 forPets:v64];

      v61 = (double *)&unk_1D1F48000;
    }
    -[PGGraphIngestPetProcessor _donatePetRelationshipsForPetNodes:isFullRebuild:progressBlock:](self, "_donatePetRelationshipsForPetNodes:isFullRebuild:progressBlock:", v64, v79, v82, v75);
    if (v93 && CFAbsoluteTimeGetCurrent() - v5 >= v61[87] && (unsigned __int8 v104 = 0, v93[2](v93, &v104, 1.0), v104 | v90 & 1))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_102:

        goto LABEL_103;
      }
      *(_DWORD *)v107 = 67109378;
      *(_DWORD *)v108 = 211;
      *(_WORD *)&v108[4] = 2080;
      *(void *)&v108[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
      v67 = MEMORY[0x1E4F14500];
      v68 = "Cancelled at line %d in file %s";
      uint32_t v69 = 18;
    }
    else
    {
      uint64_t v70 = mach_absolute_time();
      uint32_t v71 = info.numer;
      uint32_t v72 = info.denom;
      v73 = v81;
      v74 = v73;
      if (v78 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        *(_WORD *)v107 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v74, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestPetProcessor", "", v107, 2u);
      }

      if (!os_log_type_enabled(v74, OS_LOG_TYPE_INFO)) {
        goto LABEL_102;
      }
      *(_DWORD *)v107 = 136315394;
      *(void *)v108 = "PGGraphIngestPetProcessor";
      *(_WORD *)&v108[8] = 2048;
      *(double *)&v108[10] = (float)((float)((float)((float)(v70 - v76) * (float)v71) / (float)v72) / 1000000.0);
      v68 = "[Performance] %s: %f ms";
      v67 = v74;
      uint32_t v69 = 22;
    }
    _os_log_impl(&dword_1D1805000, v67, OS_LOG_TYPE_INFO, v68, v107, v69);
    goto LABEL_102;
  }
  v107[0] = 0;
  v93[2](v93, v107, 0.0);
  if (!v107[0])
  {
    double v5 = v6;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 113;
    *(_WORD *)&buf[8] = 2080;
    *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Ingest/Ingest Processing/PGGraphIngestPetProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_107:
}

void __71__PGGraphIngestPetProcessor_runPetIngestWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

uint64_t __71__PGGraphIngestPetProcessor_runPetIngestWithGraphUpdate_progressBlock___block_invoke_326(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if (([v3 isResumingFullAnalysis] & 1) != 0
    || ([v3 hasPersonsToUpdate] & 1) != 0
    || ([v3 hasPersonsToDelete] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v6 = [v3 momentUpdateTypes];
    BOOL v4 = ([(id)objc_opt_class() requiredMomentUpdateTypes] & v6) != 0;
  }

  return v4;
}

- (id)initForTestingWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPetProcessor;
  uint64_t v6 = [(PGGraphIngestPetProcessor *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v7->_petPrintClusteringEnabled = 0;
  }

  return v7;
}

- (PGGraphIngestPetProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPetProcessor;
  uint64_t v6 = [(PGGraphIngestPetProcessor *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v7->_petPrintClusteringEnabled = 1;
  }

  return v7;
}

+ (id)supportedPetDetectionTypes
{
  return &unk_1F28D3B40;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 8;
}

@end