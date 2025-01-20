@interface PGGraphIngestPersonAgeCategoryProcessor
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestPersonAgeCategoryProcessor)initWithGraphBuilder:(id)a3;
- (void)_updatePhotoLibrary:(id)a3 withAgeCategoryByPersonLocalIdentifier:(id)a4;
- (void)processPersonAgeCategoryForPersonNodes:(id)a3 photoLibrary:(id)a4 withProgressBlock:(id)a5;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPersonAgeCategoryProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

- (void)_updatePhotoLibrary:(id)a3 withAgeCategoryByPersonLocalIdentifier:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = (void *)MEMORY[0x1E4F391F0];
    v9 = [v7 allKeys];
    v31 = v6;
    v10 = [v6 librarySpecificFetchOptions];
    v11 = [v8 fetchPersonsWithLocalIdentifiers:v9 options:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v19 = [v18 localIdentifier];
          v20 = [v7 objectForKeyedSubscript:v19];

          if (v20)
          {
            uint64_t v21 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageTypeFromAgeCategory:](self->_helper, "ageTypeFromAgeCategory:", [v20 unsignedIntegerValue]);
            if (v21 != [v18 ageType])
            {
              v22 = [NSNumber numberWithUnsignedShort:v21];
              [v12 setObject:v22 forKeyedSubscript:v18];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v15);
    }

    v23 = v12;
    uint64_t v24 = [v12 count];
    id v6 = v31;
    if (v24)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __102__PGGraphIngestPersonAgeCategoryProcessor__updatePhotoLibrary_withAgeCategoryByPersonLocalIdentifier___block_invoke;
      v33[3] = &unk_1E68F0B18;
      id v25 = v23;
      id v34 = v25;
      id v32 = 0;
      char v26 = [v31 performChangesAndWait:v33 error:&v32];
      id v27 = v32;
      if ((v26 & 1) == 0)
      {
        v28 = +[PGLogging sharedLogging];
        v29 = [v28 loggingConnection];

        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = [v25 allKeys];
          *(_DWORD *)buf = 138478083;
          v40 = v30;
          __int16 v41 = 2112;
          id v42 = v27;
          _os_log_error_impl(&dword_1D1805000, v29, OS_LOG_TYPE_ERROR, "[PersonAgeCategoryProcessor] Error setting the age type of persons: %{private}@, error: %@", buf, 0x16u);
        }
      }
    }
  }
}

uint64_t __102__PGGraphIngestPersonAgeCategoryProcessor__updatePhotoLibrary_withAgeCategoryByPersonLocalIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_45039];
}

void __102__PGGraphIngestPersonAgeCategoryProcessor__updatePhotoLibrary_withAgeCategoryByPersonLocalIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F39200];
  id v5 = a3;
  id v6 = [v4 changeRequestForPerson:a2];
  LOWORD(a2) = [v5 unsignedIntegerValue];

  [v6 setAgeType:(unsigned __int16)a2];
}

- (void)processPersonAgeCategoryForPersonNodes:(id)a3 photoLibrary:(id)a4 withProgressBlock:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v47 = a4;
  id v43 = a5;
  v9 = (void (**)(void *, uint8_t *, double))_Block_copy(v43);
  uint64_t v44 = v8;
  if (v9)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v11 = 0.0;
    if (Current >= 0.01)
    {
      double v12 = Current;
      v55[0] = 0;
      v9[2](v9, v55, 0.0);
      if (v55[0])
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
          goto LABEL_58;
        }
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 90;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
        id v13 = MEMORY[0x1E4F14500];
        goto LABEL_49;
      }
      double v11 = v12;
    }
    unint64_t v15 = [v8 count];
    if (!v15)
    {
      if (CFAbsoluteTimeGetCurrent() - v11 < 0.01) {
        goto LABEL_58;
      }
      v55[0] = 0;
      v9[2](v9, v55, 1.0);
      if (!v55[0] || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_58;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 95;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
      id v13 = MEMORY[0x1E4F14500];
LABEL_49:
      _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v14 = [v8 count];
    if (!v14) {
      goto LABEL_58;
    }
    unint64_t v15 = v14;
    double v11 = 0.0;
  }
  id v45 = objc_alloc_init(MEMORY[0x1E4F8E778]);
  v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v15];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v8;
  uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (!v16) {
    goto LABEL_37;
  }
  double v18 = 0.9 / (double)v15;
  uint64_t v49 = *(void *)v52;
  double v19 = 0.0;
  *(void *)&long long v17 = 138477827;
  long long v42 = v17;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v52 != v49) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      v22 = (void *)MEMORY[0x1D25FED50]();
      if (v9)
      {
        double v23 = CFAbsoluteTimeGetCurrent();
        if (v23 - v11 >= 0.01)
        {
          v55[0] = 0;
          v9[2](v9, v55, v19);
          if (v55[0])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = 106;
              *(_WORD *)&buf[8] = 2080;
              *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            goto LABEL_57;
          }
          double v11 = v23;
        }
      }
      unint64_t v24 = -[PGGraphIngestPersonAgeCategoryProcessorHelper ageCategoryFromBirthdayDateForPersonNode:](self->_helper, "ageCategoryFromBirthdayDateForPersonNode:", v21, v42);
      if (v24)
      {
        id v25 = +[PGLogging sharedLogging];
        char v26 = [v25 loggingConnection];

        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          id v27 = [v21 stringDescription];
          v28 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)self->_helper ageDescriptionFromAge:v24];
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v27;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v28;
          _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ classified as **%@** based on birthday year", buf, 0x16u);
        }
LABEL_32:

        goto LABEL_33;
      }
      unint64_t v24 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)self->_helper ageCategoryUsingFaceAttributesForPersonNode:v21 photoLibrary:v47];
      if (v24)
      {
        v29 = +[PGLogging sharedLogging];
        char v26 = [v29 loggingConnection];

        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v30 = [v21 stringDescription];
          v31 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)self->_helper ageDescriptionFromAge:v24];
          *(_DWORD *)buf = 138478083;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v31;
          _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ classified as **%@** based on face attributes", buf, 0x16u);
        }
        goto LABEL_32;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v60 = __Block_byref_object_copy__45050;
      v61 = __Block_byref_object_dispose__45051;
      id v62 = [MEMORY[0x1E4F1C9C8] distantFuture];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __113__PGGraphIngestPersonAgeCategoryProcessor_processPersonAgeCategoryForPersonNodes_photoLibrary_withProgressBlock___block_invoke;
      v50[3] = &unk_1E68EA890;
      v50[4] = buf;
      [v21 enumerateMomentEdgesAndNodesUsingBlock:v50];
      unint64_t v24 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)self->_helper ageCategoryFromAssetSamplingScenesForPersonNode:v21 photoLibrary:v47 curationSession:v45];
      if (!v24)
      {
        _Block_object_dispose(buf, 8);

        long long v36 = +[PGLogging sharedLogging];
        char v26 = [v36 loggingConnection];

        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          long long v37 = [v21 stringDescription];
          *(_DWORD *)buf = v42;
          *(void *)&uint8_t buf[4] = v37;
          _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ age range could not be classified", buf, 0xCu);
        }
        unint64_t v24 = 0;
        goto LABEL_32;
      }
      id v32 = +[PGLogging sharedLogging];
      v33 = [v32 loggingConnection];

      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        id v34 = [v21 stringDescription];
        long long v35 = [(PGGraphIngestPersonAgeCategoryProcessorHelper *)self->_helper ageDescriptionFromAge:v24];
        *(_DWORD *)v55 = 138478083;
        v56 = v34;
        __int16 v57 = 2112;
        v58 = v35;
        _os_log_impl(&dword_1D1805000, v33, OS_LOG_TYPE_INFO, "[PersonAgeCategoryProcessor] Person %{private}@ classified as %@ based on scenes", v55, 0x16u);
      }
      _Block_object_dispose(buf, 8);

LABEL_33:
      -[PGGraphBuilder setAgeCategory:onPersonNodeForIdentifier:](self->_graphBuilder, "setAgeCategory:onPersonNodeForIdentifier:", v24, [v21 identifier]);
      long long v38 = [v21 localIdentifier];
      if ([v38 length])
      {
        v39 = [NSNumber numberWithUnsignedInteger:v24];
        [v48 setObject:v39 forKeyedSubscript:v38];
      }
      double v19 = v18 + v19;
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_37:

  if (!v9)
  {
    [(PGGraphIngestPersonAgeCategoryProcessor *)self _updatePhotoLibrary:v47 withAgeCategoryByPersonLocalIdentifier:v48];
    goto LABEL_57;
  }
  double v40 = CFAbsoluteTimeGetCurrent();
  if (v40 - v11 >= 0.01)
  {
    v55[0] = 0;
    v9[2](v9, v55, 0.9);
    if (v55[0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 151;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
        __int16 v41 = MEMORY[0x1E4F14500];
        goto LABEL_56;
      }
      goto LABEL_57;
    }
    double v11 = v40;
  }
  [(PGGraphIngestPersonAgeCategoryProcessor *)self _updatePhotoLibrary:v47 withAgeCategoryByPersonLocalIdentifier:v48];
  if (CFAbsoluteTimeGetCurrent() - v11 >= 0.01)
  {
    v55[0] = 0;
    v9[2](v9, v55, 1.0);
    if (v55[0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 155;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonAgeCategoryProcessor.m";
        __int16 v41 = MEMORY[0x1E4F14500];
LABEL_56:
        _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
  }
LABEL_57:

LABEL_58:
}

void __113__PGGraphIngestPersonAgeCategoryProcessor_processPersonAgeCategoryForPersonNodes_photoLibrary_withProgressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  if ((unint64_t)[a2 numberOfAssets] >= 2)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    id v6 = [v10 universalStartDate];
    uint64_t v7 = [v5 earlierDate:v6];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  graphBuilder = self->_graphBuilder;
  id v8 = a4;
  v9 = [(PGGraphBuilder *)graphBuilder graph];
  id v10 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  double v12 = v10;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PGGraphIngestPersonAgeCategoryProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v14 = mach_absolute_time();
  if ([v6 isResumingFullAnalysis]) {
    [v9 personNodesIncludingMe:1];
  }
  else {
  unint64_t v15 = [v6 insertedAndUpdatedPersonNodes];
  }
  uint64_t v16 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
  [(PGGraphIngestPersonAgeCategoryProcessor *)self processPersonAgeCategoryForPersonNodes:v15 photoLibrary:v16 withProgressBlock:v8];

  uint64_t v17 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v20 = v13;
  uint64_t v21 = v20;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v21, OS_SIGNPOST_INTERVAL_END, v11, "PGGraphIngestPersonAgeCategoryProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v24 = "PGGraphIngestPersonAgeCategoryProcessor";
    __int16 v25 = 2048;
    double v26 = (float)((float)((float)((float)(v17 - v14) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
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

- (PGGraphIngestPersonAgeCategoryProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphIngestPersonAgeCategoryProcessor;
  id v6 = [(PGGraphIngestPersonAgeCategoryProcessor *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    id v8 = objc_alloc_init(PGGraphIngestPersonAgeCategoryProcessorHelper);
    helper = v7->_helper;
    v7->_helper = v8;
  }
  return v7;
}

@end