@interface PGExternalAssetProcessor
+ (id)clusterAssetsToProcess:(id)a3 inPhotoLibrary:(id)a4;
- (BOOL)processExternalAssetRelevanceInferenceWithError:(id *)a3 progressReporter:(id)a4;
- (BOOL)processExternalAssetRelevanceInferenceWithError:(id *)a3 progressReporter:(id)a4 shareBackSuggester:(id)a5;
- (PGExternalAssetProcessor)initWithWorkingContext:(id)a3;
@end

@implementation PGExternalAssetProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

- (BOOL)processExternalAssetRelevanceInferenceWithError:(id *)a3 progressReporter:(id)a4 shareBackSuggester:(id)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  if (![v10 isCancelledWithProgress:0.0])
  {
    v12 = [(PGManagerWorkingContext *)self->_workingContext loggingConnection];
    os_signpost_id_t v13 = os_signpost_id_generate(v12);
    v14 = v12;
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ExternalAssetRelevance", "", buf, 2u);
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v53 = mach_absolute_time();
    v16 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
    [v16 setIncludeGuestAssets:0];
    v17 = +[PGCurationManager assetPropertySetsForCuration];
    [v16 setFetchPropertySets:v17];

    v18 = [MEMORY[0x1E4F8E7E0] internalPredicateToIncludeExternalAssetsNeedingProcessing];
    [v16 setInternalPredicate:v18];

    v19 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v16];
    if ([v10 isCancelledWithProgress:0.1])
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_14:
        if (a3 && !*a3)
        {
          [MEMORY[0x1E4F71EB8] errorForCode:-4];
          char v11 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          char v11 = 0;
        }
LABEL_47:

        goto LABEL_48;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v70 = 58;
      *(_WORD *)&v70[4] = 2080;
      *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/ExternalAssetProcessing/PGExternalAssetProcessor.m";
      v20 = MEMORY[0x1E4F14500];
LABEL_13:
      _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_14;
    }
    uint64_t v21 = [v19 count];
    if (!v21)
    {
      if (![v10 isCancelledWithProgress:1.0])
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_DEFAULT, "No asset eligible for relevance processing", buf, 2u);
        }
        char v11 = 1;
        goto LABEL_47;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v70 = 62;
      *(_WORD *)&v70[4] = 2080;
      *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/ExternalAssetProcessing/PGExternalAssetProcessor.m";
      v20 = MEMORY[0x1E4F14500];
      goto LABEL_13;
    }
    uint64_t v43 = v21;
    unint64_t v45 = v13 - 1;
    os_signpost_id_t spid = v13;
    v51 = [MEMORY[0x1E4F1CA80] set];
    v42 = [MEMORY[0x1E4F1CA60] dictionary];
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F71F10]) initWithProgressReporter:v10];
    v22 = [v48 childProgressReporterToCheckpoint:0.9];
    v23 = [(PGManagerWorkingContext *)self->_workingContext serviceManager];
    workingContext = self->_workingContext;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __112__PGExternalAssetProcessor_processExternalAssetRelevanceInferenceWithError_progressReporter_shareBackSuggester___block_invoke;
    v59[3] = &unk_1E68EFD88;
    id v47 = v22;
    id v60 = v47;
    id v50 = v9;
    id v61 = v9;
    v25 = v15;
    v62 = v25;
    v63 = self;
    id v46 = v23;
    id v64 = v46;
    v49 = v19;
    id v26 = v19;
    id v65 = v26;
    id v52 = v51;
    id v66 = v52;
    id v27 = v42;
    id v67 = v27;
    [(PGManagerWorkingContext *)workingContext performSynchronousConcurrentGraphReadUsingBlock:v59];
    v28 = v25;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [v26 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v70 = v29;
      _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_DEFAULT, "%lu external assets processed", buf, 0xCu);
    }

    v30 = v28;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [v52 count];
      *(_DWORD *)buf = 134217984;
      *(void *)v70 = v31;
      _os_log_impl(&dword_1D1805000, v30, OS_LOG_TYPE_DEFAULT, "%lu external assets inferred as relevant", buf, 0xCu);
    }

    photoLibrary = self->_photoLibrary;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __112__PGExternalAssetProcessor_processExternalAssetRelevanceInferenceWithError_progressReporter_shareBackSuggester___block_invoke_278;
    v55[3] = &unk_1E68EFDB0;
    uint64_t v58 = v43;
    id v56 = v26;
    id v44 = v27;
    id v57 = v44;
    id v54 = 0;
    char v11 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v55 error:&v54];
    id v33 = v54;
    if ((v11 & 1) == 0)
    {
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        if (!a3) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v70 = v33;
      _os_log_error_impl(&dword_1D1805000, v30, OS_LOG_TYPE_ERROR, "Error saving external asset inference to database: %@", buf, 0xCu);
      if (a3) {
LABEL_25:
      }
        *a3 = v33;
    }
LABEL_26:
    v34 = v33;
    uint64_t v35 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v38 = v30;
    v39 = v38;
    if (v45 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v39, OS_SIGNPOST_INTERVAL_END, spid, "ExternalAssetRelevance", "", buf, 2u);
    }

    id v9 = v50;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)v70 = "ExternalAssetRelevance";
      *(_WORD *)&v70[8] = 2048;
      *(double *)&v70[10] = (float)((float)((float)((float)(v35 - v53) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v19 = v49;
    if ([v10 isCancelledWithProgress:1.0])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v70 = 154;
        *(_WORD *)&v70[4] = 2080;
        *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/ExternalAssetProcessing/PGExternalAssetProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a3 && !*a3)
      {
        [MEMORY[0x1E4F71EB8] errorForCode:-4];
        char v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v11 = 0;
      }
    }

    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v70 = 46;
    *(_WORD *)&v70[4] = 2080;
    *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/ExternalAssetProcessing/PGExternalAssetProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  if (a3 && !*a3)
  {
    [MEMORY[0x1E4F71EB8] errorForCode:-4];
    char v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = 0;
  }
LABEL_48:

  return v11;
}

void __112__PGExternalAssetProcessor_processExternalAssetRelevanceInferenceWithError_progressReporter_shareBackSuggester___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v37 = *(id *)(a1 + 32);
  v34 = v3;
  v41 = [v3 graph];
  id v40 = *(id *)(a1 + 40);
  if (!v40)
  {
    id v40 = +[PGShareBackSuggester shareBackSuggesterForExternalAssetProcessingWithLoggingConnection:*(void *)(a1 + 48) photoLibrary:*(void *)(*(void *)(a1 + 56) + 16) graph:v41 serviceManager:*(void *)(a1 + 64)];
  }
  int v4 = [*(id *)(a1 + 40) positiveProcessingValue];
  v5 = [(id)objc_opt_class() clusterAssetsToProcess:*(void *)(a1 + 72) inPhotoLibrary:*(void *)(*(void *)(a1 + 56) + 16)];
  unint64_t v6 = [v5 count];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v5;
  uint64_t v39 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (!v39) {
    goto LABEL_42;
  }
  double v8 = 1.0 / (double)v6;
  uint64_t v38 = *(void *)v57;
  double v9 = 0.0;
  *(void *)&long long v7 = 138412290;
  long long v33 = v7;
  int v36 = v4;
LABEL_5:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v57 != v38) {
      objc_enumerationMutation(obj);
    }
    char v11 = *(void **)(*((void *)&v56 + 1) + 8 * v10);
    v12 = (void *)MEMORY[0x1D25FED50]();
    id v55 = 0;
    os_signpost_id_t v13 = [v40 suggesterResultsForInputs:v11 inGraph:v41 error:&v55];
    id v46 = v55;
    if (v13) {
      break;
    }
    v23 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v33;
      *(void *)id v61 = v46;
      _os_log_error_impl(&dword_1D1805000, v23, OS_LOG_TYPE_ERROR, "PGShareBackSuggesterResults returned from PGShareBackSuggester is nil: %@", buf, 0xCu);
    }
    id v22 = 0;
LABEL_36:

    if (++v10 == v39)
    {
      uint64_t v39 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (!v39) {
        goto LABEL_42;
      }
      goto LABEL_5;
    }
  }
  v42 = v13;
  uint64_t v43 = v10;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v45 = v13;
  uint64_t v14 = [v45 countByEnumeratingWithState:&v51 objects:v63 count:16];
  id v44 = v12;
  if (v14)
  {
    uint64_t v15 = v14;
    unsigned __int16 v16 = 0;
    uint64_t v17 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(v45);
        }
        v19 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        int v20 = objc_msgSend(v19, "processingValue", v33);
        unsigned __int16 v21 = v20;
        if ((v20 & v4) != 0)
        {
          id v22 = v19;
          unsigned __int16 v16 = v21;
          goto LABEL_23;
        }
        v16 |= v20;
      }
      uint64_t v15 = [v45 countByEnumeratingWithState:&v51 objects:v63 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    id v22 = 0;
  }
  else
  {
    id v22 = 0;
    unsigned __int16 v16 = 0;
  }
LABEL_23:

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v24 = v11;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (!v25) {
    goto LABEL_34;
  }
  uint64_t v26 = v25;
  uint64_t v27 = *(void *)v48;
  do
  {
    for (uint64_t j = 0; j != v26; ++j)
    {
      if (*(void *)v48 != v27) {
        objc_enumerationMutation(v24);
      }
      uint64_t v29 = *(void **)(*((void *)&v47 + 1) + 8 * j);
      if (v22)
      {
        [*(id *)(a1 + 80) addObject:*(void *)(*((void *)&v47 + 1) + 8 * j)];
LABEL_30:
        v30 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", v16, v33);
        uint64_t v31 = *(void **)(a1 + 88);
        v32 = [v29 uuid];
        [v31 setObject:v30 forKeyedSubscript:v32];

        continue;
      }
      if (!v46) {
        goto LABEL_30;
      }
    }
    uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v62 count:16];
  }
  while (v26);
LABEL_34:

  double v9 = v8 + v9;
  if (![v37 isCancelledWithProgress:v9])
  {
    int v4 = v36;
    uint64_t v10 = v43;
    v12 = v44;
    os_signpost_id_t v13 = v42;
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)id v61 = 120;
    *(_WORD *)&v61[4] = 2080;
    *(void *)&v61[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/ExternalAssetProcessing/PGExternalAssetProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

LABEL_42:
}

void __112__PGExternalAssetProcessor_processExternalAssetRelevanceInferenceWithError_progressReporter_shareBackSuggester___block_invoke_278(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v2 = 0;
    uint64_t v3 = *MEMORY[0x1E4F8E890];
    do
    {
      int v4 = (void *)MEMORY[0x1D25FED50]();
      v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
      unint64_t v6 = *(void **)(a1 + 40);
      long long v7 = [v5 uuid];
      double v8 = [v6 objectForKeyedSubscript:v7];

      if (v8)
      {
        double v9 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:v5];
        objc_msgSend(v9, "setSyndicationProcessingValue:", objc_msgSend(v8, "unsignedShortValue"));
        [v9 setSyndicationProcessingVersion:v3];
      }
      ++v2;
    }
    while (v2 < *(void *)(a1 + 48));
  }
}

- (BOOL)processExternalAssetRelevanceInferenceWithError:(id *)a3 progressReporter:(id)a4
{
  return [(PGExternalAssetProcessor *)self processExternalAssetRelevanceInferenceWithError:a3 progressReporter:a4 shareBackSuggester:0];
}

- (PGExternalAssetProcessor)initWithWorkingContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGExternalAssetProcessor;
  unint64_t v6 = [(PGExternalAssetProcessor *)&v11 init];
  long long v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workingContext, a3);
    uint64_t v8 = [(PGManagerWorkingContext *)v7->_workingContext photoLibrary];
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;
  }
  return v7;
}

+ (id)clusterAssetsToProcess:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = (void *)MEMORY[0x1E4F391A0];
  long long v7 = [a4 librarySpecificFetchOptions];
  uint64_t v29 = [v6 fetchMomentUUIDByAssetUUIDForAssets:v5 options:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v5;
  uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        os_signpost_id_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v14 = [v13 uuid];
        uint64_t v15 = [v29 objectForKeyedSubscript:v14];
        unsigned __int16 v16 = (void *)v15;
        if (v15) {
          uint64_t v17 = (void *)v15;
        }
        else {
          uint64_t v17 = v14;
        }
        id v18 = v17;

        v19 = [v13 curationProperties];
        uint64_t v20 = [v19 importedByBundleIdentifier];
        unsigned __int16 v21 = (void *)v20;
        id v22 = &stru_1F283BC78;
        if (v20) {
          id v22 = (__CFString *)v20;
        }
        v23 = v22;

        id v24 = [NSString stringWithFormat:@"%@-%@", v18, v23];

        id v25 = [v8 objectForKeyedSubscript:v24];
        if (!v25)
        {
          id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v8 setObject:v25 forKeyedSubscript:v24];
        }
        [v25 addObject:v13];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }

  uint64_t v26 = [v8 allValues];

  return v26;
}

@end