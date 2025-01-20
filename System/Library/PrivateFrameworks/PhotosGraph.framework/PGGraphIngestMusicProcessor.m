@interface PGGraphIngestMusicProcessor
+ (unint64_t)nowPlayingStreamConverterOptions;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestMusicProcessor)initWithGraphBuilder:(id)a3;
- (id)_ingestStreamEventSession:(id)a3 graph:(id)a4 performerNodesByName:(id)a5;
- (void)processMusicForGraph:(id)a3 progressBlock:(id)a4;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestMusicProcessor

- (void).cxx_destruct
{
}

- (id)_ingestStreamEventSession:(id)a3 graph:(id)a4 performerNodesByName:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v51 = a5;
  v10 = [v8 localStartDate];
  v11 = [v10 dateByAddingTimeInterval:-86400.0];

  v12 = [v8 localEndDate];
  v13 = [v12 dateByAddingTimeInterval:86400.0];

  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v13];
  v49 = (void *)v14;
  v48 = +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:v14 inGraph:v9];
  uint64_t v15 = [v8 localStartDate];
  v46 = [v8 localEndDate];
  v47 = (void *)v15;
  v53 = -[PGGraphBuilder insertMusicSessionNodeWithLocalStartDate:localEndDate:](self->_graphBuilder, "insertMusicSessionNodeWithLocalStartDate:localEndDate:", v15);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v50 = v8;
  id obj = [v8 events];
  uint64_t v16 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v68;
    uint64_t v52 = *(void *)v68;
    do
    {
      uint64_t v19 = 0;
      uint64_t v54 = v17;
      do
      {
        if (*(void *)v68 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = [*(id *)(*((void *)&v67 + 1) + 8 * v19) metadata];
        v21 = [v20 title];
        v22 = v21;
        if (v21 && [v21 length])
        {
          graphBuilder = self->_graphBuilder;
          v24 = [v20 durationInSeconds];
          [v24 doubleValue];
          v58 = v22;
          v25 = -[PGGraphBuilder insertMusicTrackWithTrackTitle:durationInSeconds:](graphBuilder, "insertMusicTrackWithTrackTitle:durationInSeconds:", v22);

          id v26 = (id)[v9 addUniqueEdgeWithLabel:@"PLAYS_TRACK" sourceNode:v53 targetNode:v25 domain:1000 properties:0];
          v27 = [v20 album];
          if ([v27 length])
          {
            v28 = [(PGGraphBuilder *)self->_graphBuilder insertMusicAlbumNodeWithAlbumTitle:v27];
            id v29 = (id)[v9 addUniqueEdgeWithLabel:@"HAS_TRACK" sourceNode:v28 targetNode:v25 domain:1000 properties:0];
          }
          v57 = v27;
          v59 = v20;
          v30 = [v20 genres];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          uint64_t v31 = [v30 countByEnumeratingWithState:&v63 objects:v73 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v64;
            do
            {
              for (uint64_t i = 0; i != v32; ++i)
              {
                if (*(void *)v64 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = [(PGGraphBuilder *)self->_graphBuilder insertMusicGenreNodeWithGenreName:*(void *)(*((void *)&v63 + 1) + 8 * i)];
                id v36 = (id)[v9 addUniqueEdgeWithLabel:@"GENRE" sourceNode:v25 targetNode:v35 domain:1001 properties:0];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v63 objects:v73 count:16];
            }
            while (v32);
          }
          v20 = v59;
          v37 = [v59 artist];
          if ([v37 length])
          {
            v71 = @"name";
            v72 = v37;
            v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
            v38 = [v37 lowercaseString];
            v39 = [v51 objectForKeyedSubscript:v38];

            if (!v39)
            {
              v39 = [v9 addUniqueNodeWithLabel:@"Performer" domain:1000 properties:v55 didCreate:0];
            }
            id v40 = (id)[v9 addUniqueEdgeWithLabel:@"PERFORMED_BY_ARTIST" sourceNode:v39 targetNode:v25 domain:1000 properties:0];
          }
          uint64_t v17 = v54;
          uint64_t v18 = v52;
          v22 = v58;
        }

        ++v19;
      }
      while (v19 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v17);
  }

  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __84__PGGraphIngestMusicProcessor__ingestStreamEventSession_graph_performerNodesByName___block_invoke;
  v60[3] = &unk_1E68F0768;
  id v61 = v9;
  id v41 = v53;
  id v62 = v41;
  id v42 = v9;
  [v48 enumerateNodesUsingBlock:v60];
  v43 = v62;
  id v44 = v41;

  return v44;
}

id __84__PGGraphIngestMusicProcessor__ingestStreamEventSession_graph_performerNodesByName___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) addUniqueEdgeWithLabel:@"MUSIC_SESSION" sourceNode:a2 targetNode:*(void *)(a1 + 40) domain:1000 properties:0];
}

- (void)processMusicForGraph:(id)a3 progressBlock:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v37 = _Block_copy(v7);
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  uint64_t v58 = 0;
  v59 = (double *)&v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __66__PGGraphIngestMusicProcessor_processMusicForGraph_progressBlock___block_invoke;
  v56[3] = &unk_1E68EFF78;
  id v9 = v8;
  id v57 = v9;
  [v6 enumerateNodesWithLabel:@"Performer" domain:900 usingBlock:v56];
  uint64_t v52 = 0;
  v53 = (double *)&v52;
  uint64_t v54 = 0x2020000000;
  uint64_t v55 = 0x3FB999999999999ALL;
  v34 = v6;
  v35 = v7;
  id v36 = v9;
  if (v37
    && (double v10 = CFAbsoluteTimeGetCurrent(), v10 - v59[3] >= 0.01)
    && (v59[3] = v10,
        char v51 = 0,
        (*((void (**)(void *, char *, double))v37 + 2))(v37, &v51, v53[3]),
        char v11 = *((unsigned char *)v63 + 24) | v51,
        (*((unsigned char *)v63 + 24) = v11) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      int v68 = 106;
      __int16 v69 = 2080;
      long long v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestMusicProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F76D38]);
    objc_msgSend(v12, "setConversionOptions:", objc_msgSend((id)objc_opt_class(), "nowPlayingStreamConverterOptions"));
    v13 = [MEMORY[0x1E4F1CA48] array];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __66__PGGraphIngestMusicProcessor_processMusicForGraph_progressBlock___block_invoke_234;
    v42[3] = &unk_1E68E5AE8;
    v42[4] = self;
    id v14 = v6;
    id v43 = v14;
    id v44 = v9;
    id v15 = v13;
    id v45 = v15;
    v47 = &v52;
    id v16 = v37;
    id v46 = v16;
    v48 = &v58;
    v49 = &v62;
    uint64_t v50 = 0x3F847AE147AE147BLL;
    [v12 enumerateSessionsWithBlock:v42];
    uint64_t v33 = v15;
    if (*((unsigned char *)v63 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v68 = 122;
        __int16 v69 = 2080;
        long long v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/In"
              "gest/Ingest Processing/PGGraphIngestMusicProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      uint64_t v17 = [(id)objc_opt_class() musicSessionDateSortDescriptors];
      uint64_t v32 = [v15 sortedArrayUsingDescriptors:v17];

      uint64_t v18 = v32;
      unint64_t v19 = [v32 count];
      if (v19)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v20 = v32;
        v21 = 0;
        uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v66 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v39 != v23) {
                objc_enumerationMutation(v20);
              }
              v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              if (v21) {
                id v26 = (id)[v14 addUniqueEdgeWithLabel:@"NEXT_SESSION" sourceNode:v21 targetNode:*(void *)(*((void *)&v38 + 1) + 8 * i) domain:1000 properties:0];
              }
              id v27 = v25;

              v21 = v27;
              v53[3] = 0.1 / (double)v19 + v53[3];
              if (v37)
              {
                double Current = CFAbsoluteTimeGetCurrent();
                if (Current - v59[3] >= 0.01)
                {
                  v59[3] = Current;
                  char v51 = 0;
                  (*((void (**)(id, char *, double))v16 + 2))(v16, &v51, v53[3]);
                  char v29 = *((unsigned char *)v63 + 24) | v51;
                  *((unsigned char *)v63 + 24) = v29;
                  if (v29)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 67109378;
                      int v68 = 141;
                      __int16 v69 = 2080;
                      long long v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Ingest/Ingest Processing/PGGraphIngestMusicProcessor.m";
                      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                    }

                    uint64_t v18 = v32;
                    goto LABEL_31;
                  }
                }
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v66 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        uint64_t v18 = v32;
      }
      if (v37)
      {
        double v30 = CFAbsoluteTimeGetCurrent();
        if (v30 - v59[3] >= 0.01)
        {
          v59[3] = v30;
          char v51 = 0;
          (*((void (**)(id, char *, double))v16 + 2))(v16, &v51, 1.0);
          char v31 = *((unsigned char *)v63 + 24) | v51;
          *((unsigned char *)v63 + 24) = v31;
          if (v31)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v68 = 145;
              __int16 v69 = 2080;
              long long v70 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Ingest/Ingest Processing/PGGraphIngestMusicProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
LABEL_31:
    }
  }
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
}

void __66__PGGraphIngestMusicProcessor_processMusicForGraph_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 name];
  v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = *(void **)(a1 + 32);
    id v6 = [v4 lowercaseString];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

void __66__PGGraphIngestMusicProcessor_processMusicForGraph_progressBlock___block_invoke_234(uint64_t a1, uint64_t a2, unsigned char *a3, double a4)
{
  id v7 = [*(id *)(a1 + 32) _ingestStreamEventSession:a2 graph:*(void *)(a1 + 40) performerNodesByName:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) addObject:v7];
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a4 * 0.8 + 0.1;
  if (*(void *)(a1 + 64))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 96))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 64) + 16))(*(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                               + 24));
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)) {
        *a3 = 1;
      }
    }
  }
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  graphBuilder = self->_graphBuilder;
  id v6 = a4;
  id v7 = [(PGGraphBuilder *)graphBuilder graph];
  id v8 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  double v10 = v8;
  char v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MusicIngestProcessing", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = mach_absolute_time();
  [(PGGraphIngestMusicProcessor *)self processMusicForGraph:v7 progressBlock:v6];

  uint64_t v13 = mach_absolute_time();
  mach_timebase_info v14 = info;
  id v15 = v11;
  id v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v16, OS_SIGNPOST_INTERVAL_END, v9, "MusicIngestProcessing", "", buf, 2u);
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v19 = "MusicIngestProcessing";
    __int16 v20 = 2048;
    double v21 = (float)((float)((float)((float)(v13 - v12) * (float)v14.numer) / (float)v14.denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  return 0;
}

- (PGGraphIngestMusicProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestMusicProcessor;
  id v6 = [(PGGraphIngestMusicProcessor *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

+ (unint64_t)nowPlayingStreamConverterOptions
{
  return [MEMORY[0x1E4F76D30] defaultOptions] | 0x38;
}

@end