@interface PGGraphIngestPersonBiologicalSexProcessor
+ (unint64_t)sexForFaces:(id)a3 personDescription:(id)a4;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestPersonBiologicalSexProcessor)initWithGraphBuilder:(id)a3;
- (id)_sexDescriptionForBiologicalSex:(unint64_t)a3;
- (unint64_t)_sexForPersonNode:(id)a3 photoLibrary:(id)a4;
- (unsigned)_phBiologicalSexFromIngestBiologicalSex:(unint64_t)a3;
- (void)_writeBiologicalSexByPerson:(id)a3 toPhotoLibrary:(id)a4;
- (void)processPersonBiologicalSexForPersonNodes:(id)a3 photoLibrary:(id)a4 withProgressBlock:(id)a5;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPersonBiologicalSexProcessor

- (void).cxx_destruct
{
}

- (id)_sexDescriptionForBiologicalSex:(unint64_t)a3
{
  v3 = @"Unspecified BiologicalSex";
  if (a3 == 1) {
    v3 = @"Female";
  }
  if (a3 == 2) {
    return @"Male";
  }
  else {
    return v3;
  }
}

- (unint64_t)_sexForPersonNode:(id)a3 photoLibrary:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 localIdentifier];
  if (v7)
  {
    v8 = +[PGGraphIngestFaceAttributeConveniences sampledAssetsWithSingleFaceForPersonLocalIdentifier:v7 photoLibrary:v6 numberOfYearsBack:100 sampleSize:200 fetchPropertySets:0];
    unint64_t v9 = [v8 count];
    if (v9 > 2)
    {
      v12 = [v6 librarySpecificFetchOptions];
      v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"sexType != %lu", 0);
      [v12 setPredicate:v15];
      uint64_t v16 = *MEMORY[0x1E4F39640];
      v26[0] = *MEMORY[0x1E4F39628];
      v26[1] = v16;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      [v12 setFetchPropertySets:v17];

      v18 = [MEMORY[0x1E4F39050] fetchFacesInAssets:v8 options:v12];
      unint64_t v19 = [v18 count];
      if (v19 > 2)
      {
        v24 = objc_opt_class();
        v22 = [v5 stringDescription];
        unint64_t v14 = [v24 sexForFaces:v18 personDescription:v22];
      }
      else
      {
        unint64_t v20 = v19;
        v21 = +[PGLogging sharedLogging];
        v22 = [v21 loggingConnection];

        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [v5 stringDescription];
          *(_DWORD *)buf = 138478083;
          v28 = v23;
          __int16 v29 = 2048;
          unint64_t v30 = v20;
          _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[Ingest BiologicalSex]Person %{private}@ doesn't have enough singleton face assets with sex classification: %lu", buf, 0x16u);
        }
        unint64_t v14 = 0;
      }
    }
    else
    {
      unint64_t v10 = v9;
      v11 = +[PGLogging sharedLogging];
      v12 = [v11 loggingConnection];

      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = [v5 stringDescription];
        *(_DWORD *)buf = 138478083;
        v28 = v13;
        __int16 v29 = 2048;
        unint64_t v30 = v10;
        _os_log_impl(&dword_1D1805000, v12, OS_LOG_TYPE_INFO, "[Ingest BiologicalSex] Person %{private}@ doesn't have enough singleton face assets: %lu", buf, 0x16u);
      }
      unint64_t v14 = 0;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

- (unsigned)_phBiologicalSexFromIngestBiologicalSex:(unint64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (void)_writeBiologicalSexByPerson:(id)a3 toPhotoLibrary:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PGGraphIngestPersonBiologicalSexProcessor__writeBiologicalSexByPerson_toPhotoLibrary___block_invoke;
  v12[3] = &unk_1E68F0B18;
  id v6 = v5;
  id v13 = v6;
  id v11 = 0;
  char v7 = [a4 performChangesAndWait:v12 error:&v11];
  id v8 = v11;
  if ((v7 & 1) == 0)
  {
    unint64_t v9 = +[PGLogging sharedLogging];
    unint64_t v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "Error setting the sex of a PHPerson: %@", buf, 0xCu);
    }
  }
}

void __88__PGGraphIngestPersonBiologicalSexProcessor__writeBiologicalSexByPerson_toPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7, (void)v11);
        unsigned __int16 v9 = [v8 unsignedIntegerValue];
        unint64_t v10 = [MEMORY[0x1E4F39200] changeRequestForPerson:v7];
        [v10 setSexType:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)processPersonBiologicalSexForPersonNodes:(id)a3 photoLibrary:(id)a4 withProgressBlock:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v55 = (void (**)(void *, unsigned char *, double))_Block_copy(v10);
  if (!v55)
  {
    uint64_t v15 = [v8 count];
    if (!v15) {
      goto LABEL_48;
    }
    unint64_t v16 = v15;
    id v48 = v10;
    double v12 = 0.0;
    goto LABEL_11;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v12 = 0.0;
  if (Current >= 0.01)
  {
    double v13 = Current;
    char v64 = 0;
    v55[2](v55, &v64, 0.0);
    if (v64)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = 76;
        *(_WORD *)&v66[4] = 2080;
        *(void *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonBiologicalSexProcessor.m";
        long long v14 = MEMORY[0x1E4F14500];
LABEL_53:
        _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        goto LABEL_48;
      }
      goto LABEL_48;
    }
    double v12 = v13;
  }
  uint64_t v17 = [v8 count];
  if (v17)
  {
    unint64_t v16 = v17;
    id v48 = v10;
LABEL_11:
    id v51 = v9;
    uint64_t v18 = [v9 librarySpecificFetchOptions];
    unint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v49 = v8;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v61 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v26 = [v25 localIdentifier];
          if ([v26 length]) {
            [v19 setObject:v25 forKeyedSubscript:v26];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v68 count:16];
      }
      while (v22);
    }

    v27 = (void *)MEMORY[0x1E4F391F0];
    v28 = [v19 allKeys];
    v47 = (void *)v18;
    __int16 v29 = [v27 fetchPersonsWithLocalIdentifiers:v28 options:v18];

    id v50 = objc_alloc_init(MEMORY[0x1E4F28E10]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    obuint64_t j = v29;
    uint64_t v54 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v54)
    {
      double v30 = 1.0 / (double)v16;
      uint64_t v53 = *(void *)v57;
      double v31 = 0.0;
      id v9 = v51;
      while (2)
      {
        for (uint64_t j = 0; j != v54; ++j)
        {
          if (*(void *)v57 != v53) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          v34 = (void *)MEMORY[0x1D25FED50]();
          v35 = [v33 localIdentifier];
          v36 = [v19 objectForKeyedSubscript:v35];

          unint64_t v37 = [(PGGraphIngestPersonBiologicalSexProcessor *)self _sexForPersonNode:v36 photoLibrary:v9];
          v38 = +[PGLogging sharedLogging];
          v39 = [v38 loggingConnection];

          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = [v36 debugDescription];
            v41 = [(PGGraphIngestPersonBiologicalSexProcessor *)self _sexDescriptionForBiologicalSex:v37];
            *(_DWORD *)buf = 138478083;
            *(void *)v66 = v40;
            *(_WORD *)&v66[8] = 2112;
            *(void *)&v66[10] = v41;
            _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "[Ingest BiologicalSex]Person %{private}@ classified as %@", buf, 0x16u);

            id v9 = v51;
          }

          -[PGGraphBuilder setBiologicalSex:onPersonNodeForIdentifier:](self->_graphBuilder, "setBiologicalSex:onPersonNodeForIdentifier:", v37, [v36 identifier]);
          uint64_t v42 = [(PGGraphIngestPersonBiologicalSexProcessor *)self _phBiologicalSexFromIngestBiologicalSex:v37];
          if ([v33 sexType] != v42)
          {
            v43 = [NSNumber numberWithUnsignedShort:v42];
            [v50 setObject:v43 forKey:v33];
          }
          double v31 = v30 + v31;
          if (v55)
          {
            double v44 = CFAbsoluteTimeGetCurrent();
            if (v44 - v12 >= 0.01)
            {
              char v64 = 0;
              v55[2](v55, &v64, v31);
              if (v64)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v66 = 115;
                  *(_WORD *)&v66[4] = 2080;
                  *(void *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonBiologicalSexProcessor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                id v10 = v48;
                id v8 = v49;
                v45 = v47;
                v46 = v50;
                goto LABEL_47;
              }
              double v12 = v44;
            }
          }
        }
        uint64_t v54 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
        if (v54) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v9 = v51;
    }

    v46 = v50;
    if ([v50 count]) {
      [(PGGraphIngestPersonBiologicalSexProcessor *)self _writeBiologicalSexByPerson:v50 toPhotoLibrary:v9];
    }
    id v10 = v48;
    id v8 = v49;
    v45 = v47;
    if (v55)
    {
      if (CFAbsoluteTimeGetCurrent() - v12 >= 0.01)
      {
        char v64 = 0;
        v55[2](v55, &v64, 1.0);
        if (v64)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v66 = 123;
            *(_WORD *)&v66[4] = 2080;
            *(void *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonBiologicalSexProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
LABEL_47:

    goto LABEL_48;
  }
  if (CFAbsoluteTimeGetCurrent() - v12 >= 0.01)
  {
    char v64 = 0;
    v55[2](v55, &v64, 1.0);
    if (v64)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v66 = 81;
        *(_WORD *)&v66[4] = 2080;
        *(void *)&v66[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonBiologicalSexProcessor.m";
        long long v14 = MEMORY[0x1E4F14500];
        goto LABEL_53;
      }
    }
  }
LABEL_48:
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v11 = a3;
  graphBuilder = self->_graphBuilder;
  id v7 = a4;
  id v8 = [(PGGraphBuilder *)graphBuilder graph];
  if ([v11 isResumingFullAnalysis]) {
    [v8 personNodesIncludingMe:1];
  }
  else {
  id v9 = [v11 insertedAndUpdatedPersonNodes];
  }
  id v10 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
  [(PGGraphIngestPersonBiologicalSexProcessor *)self processPersonBiologicalSexForPersonNodes:v9 photoLibrary:v10 withProgressBlock:v7];
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

- (PGGraphIngestPersonBiologicalSexProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPersonBiologicalSexProcessor;
  id v6 = [(PGGraphIngestPersonBiologicalSexProcessor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

+ (unint64_t)sexForFaces:(id)a3 personDescription:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v18 + 1) + 8 * i) sexType] == 2) {
          ++v10;
        }
      }
      v9 += v8;
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v8);
    double v13 = (double)v10 / (double)v9;
  }
  else
  {
    double v13 = NAN;
  }
  long long v14 = +[PGLogging sharedLogging];
  uint64_t v15 = [v14 loggingConnection];

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478339;
    id v23 = v6;
    __int16 v24 = 2048;
    double v25 = v13;
    __int16 v26 = 2048;
    double v27 = 1.0 - v13;
    _os_log_impl(&dword_1D1805000, v15, OS_LOG_TYPE_INFO, "[Ingest BiologicalSex]Person %{private}@ femaleRatio:%0.2f maleRatio: %0.2f", buf, 0x20u);
  }

  if (v13 >= 0.75)
  {
    unint64_t v16 = 1;
  }
  else if (1.0 - v13 >= 0.75)
  {
    unint64_t v16 = 2;
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

@end