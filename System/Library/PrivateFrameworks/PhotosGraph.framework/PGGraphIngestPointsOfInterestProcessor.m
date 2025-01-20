@interface PGGraphIngestPointsOfInterestProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)_fetchPointsOfInterestForRegions:(id)a3 loggingConnection:(id)a4 progress:(id)a5;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (NSDictionary)momentNodesToResolvePOIAndEnrichByBusinessItemMuid;
- (NSDictionary)momentNodesToResolvePOIByRegion;
- (PGGraphIngestPointsOfInterestProcessor)initWithGraphBuilder:(id)a3;
- (id)_pointOfInterestTypeStringsFromBusinessItems:(id)a3 withOriginalCoordinate:(CLLocationCoordinate2D)a4;
- (void)_collectPOIsToResolveWithMomentNodes:(id)a3 graphUpdate:(id)a4 progress:(id)a5;
- (void)_insertPointOfInterestTypeStrings:(id)a3 graph:(id)a4 withMomentNodes:(id)a5 loggingConnection:(id)a6;
- (void)deletePOIEdgesWithMomentNodes:(id)a3 inGraph:(id)a4;
- (void)disambiguatePointsOfInterestWithMomentNodes:(id)a3 graphUpdate:(id)a4 progress:(id)a5;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestPointsOfInterestProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesToResolvePOIAndEnrichByBusinessItemMuid, 0);
  objc_storeStrong((id *)&self->_momentNodesToResolvePOIByRegion, 0);
  objc_storeStrong((id *)&self->_businessCacheUpdater, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

- (NSDictionary)momentNodesToResolvePOIAndEnrichByBusinessItemMuid
{
  return self->_momentNodesToResolvePOIAndEnrichByBusinessItemMuid;
}

- (NSDictionary)momentNodesToResolvePOIByRegion
{
  return self->_momentNodesToResolvePOIByRegion;
}

- (BOOL)_fetchPointsOfInterestForRegions:(id)a3 loggingConnection:(id)a4 progress:(id)a5
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v8 = a4;
  id v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E4F76D58];
  id v11 = a3;
  id v12 = [v10 alloc];
  v13 = [(PGGraphBuilder *)self->_graphBuilder poiCache];
  v14 = [(PGGraphBuilder *)self->_graphBuilder locationCache];
  v15 = (void *)[v12 initWithPOICache:v13 locationCache:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F76D60]);
  v17 = [(PGGraphBuilder *)self->_graphBuilder poiCache];
  v18 = [(PGGraphBuilder *)self->_graphBuilder locationCache];
  v19 = (void *)[v16 initWithPOICache:v17 locationCache:v18];

  [v15 setPrecision:0.1];
  [v19 setPrecision:0.1];
  id v20 = objc_alloc(MEMORY[0x1E4F76D88]);
  v32[0] = v15;
  v32[1] = v19;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v22 = (void *)[v20 initWithQueryPerformers:v21];

  [v22 setLoggingConnection:v8];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__PGGraphIngestPointsOfInterestProcessor__fetchPointsOfInterestForRegions_loggingConnection_progress___block_invoke;
  v28[3] = &unk_1E68F04F0;
  id v23 = v9;
  id v29 = v23;
  id v27 = 0;
  char v24 = [v22 createCacheForRegions:v11 progressBlock:v28 error:&v27];

  id v25 = v27;
  if ((v24 & 1) == 0 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v25;
    _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Failed caching pois: %@", buf, 0xCu);
  }

  return v24;
}

uint64_t __102__PGGraphIngestPointsOfInterestProcessor__fetchPointsOfInterestForRegions_loggingConnection_progress___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_collectPOIsToResolveWithMomentNodes:(id)a3 graphUpdate:(id)a4 progress:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v26 = a4;
  id v9 = a5;
  v10 = _Block_copy(v9);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  v41 = (double *)&v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  if (v10
    && (double v11 = CFAbsoluteTimeGetCurrent(), v11 - v41[3] >= 0.01)
    && (v41[3] = v11,
        LOBYTE(v48[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v10 + 2))(v10, v48, 0.0),
        char v12 = *((unsigned char *)v45 + 24) | LOBYTE(v48[0]),
        (*((unsigned char *)v45 + 24) = v12) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 0x10804000202;
      LOWORD(v52) = 2080;
      *(void *)((char *)&v52 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    v13 = [(PGGraphBuilder *)self->_graphBuilder serviceManager];
    id v25 = v9;
    v14 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    id v16 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t buf = 0;
    *(void *)&long long v52 = &buf;
    *((void *)&v52 + 1) = 0x2020000000;
    uint64_t v53 = 0;
    double v17 = 1.0 / (double)(unint64_t)[v8 count];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __100__PGGraphIngestPointsOfInterestProcessor__collectPOIsToResolveWithMomentNodes_graphUpdate_progress___block_invoke;
    v28[3] = &unk_1E68F04C8;
    id v18 = v10;
    id v34 = v18;
    v35 = &v40;
    uint64_t v38 = 0x3F847AE147AE147BLL;
    p_uint64_t buf = &buf;
    v37 = &v44;
    id v24 = v15;
    id v29 = v24;
    id v23 = v13;
    id v30 = v23;
    id v19 = v16;
    id v31 = v19;
    id v32 = v26;
    id v20 = v14;
    id v33 = v20;
    double v39 = v17;
    [v8 enumerateNodesUsingBlock:v28];
    objc_storeStrong((id *)&self->_momentNodesToResolvePOIByRegion, v15);
    id v9 = v25;
    objc_storeStrong((id *)&self->_momentNodesToResolvePOIAndEnrichByBusinessItemMuid, v16);
    if (v10)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v41[3] >= 0.01)
      {
        v41[3] = Current;
        char v27 = 0;
        (*((void (**)(id, char *, double))v18 + 2))(v18, &v27, 1.0);
        char v22 = *((unsigned char *)v45 + 24) | v27;
        *((unsigned char *)v45 + 24) = v22;
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            v48[0] = 67109378;
            v48[1] = 347;
            __int16 v49 = 2080;
            v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v48, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

void __100__PGGraphIngestPointsOfInterestProcessor__collectPOIsToResolveWithMomentNodes_graphUpdate_progress___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 72)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v7 = *(void *)(*(void *)(a1 + 80) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v7 + 24) = Current,
        char v16 = 0,
        (*(void (**)(double))(*(void *)(a1 + 72) + 16))(*(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D25FED50]();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __100__PGGraphIngestPointsOfInterestProcessor__collectPOIsToResolveWithMomentNodes_graphUpdate_progress___block_invoke_2;
    v9[3] = &unk_1E68F04A0;
    id v10 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    [v11 enumeratePreciseAddressNodesUsingBlock:v9];

    *(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 112)
                                                                + *(double *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                            + 24);
  }
}

void __100__PGGraphIngestPointsOfInterestProcessor__collectPOIsToResolveWithMomentNodes_graphUpdate_progress___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 hasEdgeWithLabel:@"IS_HOME_WORK" domain:202] & 1) == 0)
  {
    v4 = [v3 location];
    [v4 coordinate];
    double v6 = v5;
    double v8 = v7;
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", *(void *)&v5, *(void *)&v7);
    uint64_t v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5A8]), "initWithCenter:radius:identifier:", v9, v6, v8, 0.1);
    id v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    id v11 = *(void **)(a1 + 40);
    if (v10)
    {
      id v12 = v10;
      [v10 addObject:v11];
    }
    else
    {
      v48 = v9;
      id v49 = v3;
      uint64_t v13 = [v11 universalStartDate];
      uint64_t v46 = [*(id *)(a1 + 40) universalEndDate];
      char v47 = (void *)v13;
      long long v52 = v4;
      v45 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v46];
      id v14 = objc_msgSend(*(id *)(a1 + 48), "fetchLocationOfInterestVisitsAtLocation:inDateInterval:", v4);
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id v12 = 0;
        uint64_t v17 = *(void *)v56;
        uint64_t v18 = *MEMORY[0x1E4F76C00];
        uint64_t v50 = *MEMORY[0x1E4F76C00];
        v51 = v14;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v56 != v17) {
              objc_enumerationMutation(v14);
            }
            id v20 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            v21 = [v20 locationOfInterest];
            char v22 = v21;
            if (v21 && [v21 type] && objc_msgSend(v22, "type") != 1)
            {
              uint64_t v23 = [v22 businessItemMuid];
              if (v23 == v18)
              {
                uint64_t v24 = [MEMORY[0x1E4F1CA80] setWithObject:*(void *)(a1 + 40)];

                [*(id *)(a1 + 32) setObject:v24 forKeyedSubscript:v53];
                id v25 = *(NSObject **)(a1 + 72);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  id v26 = v25;
                  [v52 coordinate];
                  uint64_t v28 = v27;
                  [v52 coordinate];
                  uint64_t v30 = v29;
                  id v31 = [*(id *)(a1 + 40) name];
                  *(_DWORD *)uint64_t buf = 134284035;
                  uint64_t v60 = v28;
                  __int16 v61 = 2049;
                  uint64_t v62 = v30;
                  __int16 v63 = 2112;
                  v64 = v31;
                  _os_log_impl(&dword_1D1805000, v26, OS_LOG_TYPE_INFO, "Should fetch POI for location {%{private}f, %{private}f} in Moment \"%@\" from Routine", buf, 0x20u);
                }
                id v12 = (void *)v24;
              }
              else
              {
                uint64_t v54 = v12;
                id v32 = [NSNumber numberWithUnsignedLongLong:v23];
                id v33 = [*(id *)(a1 + 56) objectForKeyedSubscript:v32];
                if (!v33)
                {
                  id v33 = [MEMORY[0x1E4F1CA80] set];
                  [*(id *)(a1 + 56) setObject:v33 forKeyedSubscript:v32];
                }
                [v33 addObject:*(void *)(a1 + 40)];
                uint64_t v34 = a1;
                v35 = *(void **)(a1 + 64);
                v36 = [*(id *)(v34 + 40) uuid];
                v37 = v35;
                a1 = v34;
                [v37 registerLocationOfInterestVisitToResolve:v20 forMomentUUID:v36];

                uint64_t v38 = *(NSObject **)(v34 + 72);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  double v39 = v38;
                  [v52 coordinate];
                  uint64_t v41 = v40;
                  [v52 coordinate];
                  uint64_t v43 = v42;
                  uint64_t v44 = [*(id *)(v34 + 40) name];
                  *(_DWORD *)uint64_t buf = 134284035;
                  uint64_t v60 = v41;
                  __int16 v61 = 2049;
                  uint64_t v62 = v43;
                  __int16 v63 = 2112;
                  v64 = v44;
                  _os_log_impl(&dword_1D1805000, v39, OS_LOG_TYPE_INFO, "Should fetch POI and enrich for location {%{private}f, %{private}f} in Moment \"%@\" from Routine", buf, 0x20u);

                  a1 = v34;
                }

                uint64_t v18 = v50;
                id v14 = v51;
                id v12 = v54;
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v55 objects:v65 count:16];
        }
        while (v16);
      }
      else
      {
        id v12 = 0;
      }

      id v9 = v48;
      id v3 = v49;
      v4 = v52;
    }
  }
}

- (id)_pointOfInterestTypeStringsFromBusinessItems:(id)a3 withOriginalCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude = a4.longitude;
  CLLocationDegrees latitude = a4.latitude;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  CLLocationCoordinate2D v37 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    v42.CLLocationDegrees latitude = latitude;
    v42.CLLocationDegrees longitude = longitude;
    BOOL v26 = CLLocationCoordinate2DIsValid(v42);
    double v7 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = v6;
    obuint64_t j = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (!v26) {
            goto LABEL_9;
          }
          uint64_t v31 = 0;
          uint64_t v32 = 0;
          uint64_t v13 = [v12 region];
          [v13 center];
          uint64_t v31 = v14;
          uint64_t v32 = v15;

          CLLocationCoordinate2DGetDistanceFrom();
          if (v16 <= 0.1)
          {
LABEL_9:
            uint64_t v17 = [v12 categories];
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v38 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v28;
              do
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v28 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  char v22 = +[PGGraphPlacesResolver poiStringFromSpatialLookupCategory:](PGGraphPlacesResolver, "poiStringFromSpatialLookupCategory:", [*(id *)(*((void *)&v27 + 1) + 8 * j) integerValue]);
                  if (v22) {
                    [v7 addObject:v22];
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v38 count:16];
              }
              while (v19);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v9);
    }

    id v6 = v24;
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)_insertPointOfInterestTypeStrings:(id)a3 graph:(id)a4 withMomentNodes:(id)a5 loggingConnection:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v8;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v52;
    long long v34 = v49;
    uint64_t v41 = *(void *)v52;
    CLLocationCoordinate2D v42 = v9;
    id v35 = v10;
    do
    {
      uint64_t v14 = 0;
      uint64_t v40 = v12;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = +[PGGraph poiLabelForPOIType:](PGGraph, "poiLabelForPOIType:", *(void *)(*((void *)&v51 + 1) + 8 * v14), v34);
        if (v15)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
          uint64_t v17 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v10 graph:v9];
          uint64_t v18 = +[PGGraphPOINodeCollection poiNodesForLabel:v15 inGraph:v9];
          if ([v18 count])
          {
            uint64_t v19 = v17;
            uint64_t v20 = +[PGGraphEdgeCollection edgesFromNodes:v17 toNodes:v18];
            unint64_t v21 = [v20 count];
            if (v21 >= [v10 count])
            {
              uint64_t v17 = v19;
              uint64_t v13 = v41;
              id v9 = v42;
            }
            else
            {
              uint64_t v43 = v15;
              char v22 = [v18 anyNode];
              uint64_t v17 = v19;
              uint64_t v13 = v41;
              id v9 = v42;
              if (!v22) {
                goto LABEL_10;
              }
LABEL_12:
              double v39 = v17;
              uint64_t v23 = v17;
              CLLocationCoordinate2D v37 = v20;
              if ([v20 count])
              {
                id v24 = [v20 elementIdentifiers];
                v48[0] = MEMORY[0x1E4F143A8];
                v48[1] = 3221225472;
                v49[0] = __116__PGGraphIngestPointsOfInterestProcessor__insertPointOfInterestTypeStrings_graph_withMomentNodes_loggingConnection___block_invoke;
                v49[1] = &unk_1E68F0470;
                id v50 = v9;
                [v24 enumerateIdentifiersWithBlock:v48];

                id v25 = +[MANodeCollection sourceNodesOfEdges:v20];
                uint64_t v26 = [(MAElementCollection *)v23 collectionBySubtracting:v25];

                uint64_t v23 = (PGGraphMomentNodeCollection *)v26;
              }
              uint64_t v38 = v18;
              long long v46 = 0u;
              long long v47 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              id v27 = v10;
              uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v55 count:16];
              if (v28)
              {
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v45;
                do
                {
                  for (uint64_t i = 0; i != v29; ++i)
                  {
                    if (*(void *)v45 != v30) {
                      objc_enumerationMutation(v27);
                    }
                    uint64_t v32 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                    if ([(MANodeCollection *)v23 containsNode:v32])
                    {
                      id v33 = [[PGGraphPOIEdge alloc] initFromMomentNode:v32 toPOINode:v22 confidence:1 poiIsImproved:0 poiIsSpecial:1.0];
                      [v16 addEdge:v33];
                    }
                  }
                  uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v55 count:16];
                }
                while (v29);
              }

              id v9 = v42;
              [v42 executeGraphChangeRequest:v16];

              id v10 = v35;
              uint64_t v13 = v41;
              uint64_t v15 = v43;
              uint64_t v18 = v38;
              uint64_t v17 = v39;
              uint64_t v20 = v37;
            }
          }
          else
          {
            uint64_t v43 = v15;
            char v22 = [[PGGraphPOINode alloc] initWithLabel:v15];
            [v16 addNode:v22];
            uint64_t v20 = 0;
            if (v22) {
              goto LABEL_12;
            }
LABEL_10:
            uint64_t v15 = v43;
          }

          uint64_t v12 = v40;
        }

        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v12);
  }
}

uint64_t __116__PGGraphIngestPointsOfInterestProcessor__insertPointOfInterestTypeStrings_graph_withMomentNodes_loggingConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PGGraphPOIEdge setPOIIsImproved:1 onEdgeForIdentifier:a2 inGraph:*(void *)(a1 + 32)];
}

- (void)deletePOIEdgesWithMomentNodes:(id)a3 inGraph:(id)a4
{
  double v5 = (objc_class *)MEMORY[0x1E4F71EE0];
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init(v5);
  id v8 = [v7 poiNodes];
  id v9 = +[PGGraphEdgeCollection edgesFromNodes:v7 toNodes:v8];

  [v10 removeEdges:v9];
  [v6 executeGraphChangeRequest:v10];
}

- (void)disambiguatePointsOfInterestWithMomentNodes:(id)a3 graphUpdate:(id)a4 progress:(id)a5
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v44 = a4;
  id v42 = a5;
  uint64_t v82 = 0;
  uint64_t v83 = 0;
  v84 = &v83;
  uint64_t v85 = 0x2020000000;
  char v86 = 0;
  uint64_t v79 = 0;
  v80 = (double *)&v79;
  uint64_t v81 = 0x2020000000;
  long long v45 = _Block_copy(v42);
  if (!v45
    || (double v8 = CFAbsoluteTimeGetCurrent(), v8 - v80[3] < 0.01)
    || (v80[3] = v8,
        v87[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v45 + 2))(v45, v87, 0.0),
        char v9 = *((unsigned char *)v84 + 24) | v87[0],
        (*((unsigned char *)v84 + 24) = v9) == 0))
  {
    long long v47 = [(PGGraphBuilder *)self->_graphBuilder graph];
    v48 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke;
    v74[3] = &unk_1E68F03F8;
    id v10 = v45;
    id v75 = v10;
    v76 = &v79;
    v77 = &v83;
    uint64_t v78 = 0x3F847AE147AE147BLL;
    [(PGGraphIngestPointsOfInterestProcessor *)self _collectPOIsToResolveWithMomentNodes:v43 graphUpdate:v44 progress:v74];
    if (*((unsigned char *)v84 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = 103;
        LOWORD(v92) = 2080;
        *(void *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_43;
    }
    uint64_t v41 = self->_momentNodesToResolvePOIByRegion;
    long long v46 = self->_momentNodesToResolvePOIAndEnrichByBusinessItemMuid;
    if ([(NSDictionary *)v46 count])
    {
      uint64_t v40 = v10;
      id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v12 = [(NSDictionary *)v46 allKeys];
      uint64_t v13 = (void *)[v11 initWithArray:v12];

      businessCacheUpdater = self->_businessCacheUpdater;
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_260;
      v69[3] = &unk_1E68F0420;
      id v70 = v40;
      v71 = &v79;
      long long v73 = xmmword_1D1F4F320;
      v72 = &v83;
      uint64_t v15 = [(CLSBusinessCacheUpdater *)businessCacheUpdater enrichedBusinessItemsByMuidsForMuids:v13 progressBlock:v69];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v16 = v13;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v95 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v66;
        double v19 = *MEMORY[0x1E4F1E750];
        double v20 = *(double *)(MEMORY[0x1E4F1E750] + 8);
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v66 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v22 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            uint64_t v23 = [v15 objectForKeyedSubscript:v22];
            if (v23)
            {
              id v24 = [(NSDictionary *)v46 objectForKeyedSubscript:v22];
              v94 = v23;
              id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
              uint64_t v26 = -[PGGraphIngestPointsOfInterestProcessor _pointOfInterestTypeStringsFromBusinessItems:withOriginalCoordinate:](self, "_pointOfInterestTypeStringsFromBusinessItems:withOriginalCoordinate:", v25, v19, v20);

              [(PGGraphIngestPointsOfInterestProcessor *)self _insertPointOfInterestTypeStrings:v26 graph:v47 withMomentNodes:v24 loggingConnection:v48];
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v65 objects:v95 count:16];
        }
        while (v17);
      }

      id v10 = v40;
    }
    if (v45)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v80[3] >= 0.01)
      {
        v80[3] = Current;
        v87[0] = 0;
        (*((void (**)(id, uint8_t *, double))v10 + 2))(v10, v87, 0.6);
        char v28 = *((unsigned char *)v84 + 24) | v87[0];
        *((unsigned char *)v84 + 24) = v28;
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)uint64_t buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = 129;
            LOWORD(v92) = 2080;
            *(void *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfIn"
                                            "terestProcessor.m";
            uint64_t v29 = MEMORY[0x1E4F14500];
LABEL_41:
            _os_log_impl(&dword_1D1805000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
      }
    }
    if ([(NSDictionary *)v41 count])
    {
      uint64_t v30 = [(NSDictionary *)v41 allKeys];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_262;
      v60[3] = &unk_1E68F0420;
      id v31 = v10;
      id v61 = v31;
      uint64_t v62 = &v79;
      long long v64 = xmmword_1D1F4F330;
      __int16 v63 = &v83;
      BOOL v32 = [(PGGraphIngestPointsOfInterestProcessor *)self _fetchPointsOfInterestForRegions:v30 loggingConnection:v48 progress:v60];
      if (*((unsigned char *)v84 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = 138;
          LOWORD(v92) = 2080;
          *(void *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_34:

        goto LABEL_42;
      }
      id v33 = v10;
      if (v32)
      {
        long long v34 = [(PGGraphBuilder *)self->_graphBuilder poiCache];
        *(void *)uint64_t buf = 0;
        *(void *)&long long v92 = buf;
        *((void *)&v92 + 1) = 0x2020000000;
        uint64_t v93 = 0;
        unint64_t v35 = [(NSDictionary *)v41 count];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        void v49[2] = __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_263;
        v49[3] = &unk_1E68F0448;
        long long v55 = buf;
        double v58 = 1.0 / (double)v35;
        id v54 = v31;
        long long v56 = &v79;
        long long v59 = xmmword_1D1F4F340;
        uint64_t v57 = &v83;
        id v36 = v34;
        id v50 = v36;
        long long v51 = self;
        id v52 = v47;
        id v53 = v48;
        [(NSDictionary *)v41 enumerateKeysAndObjectsUsingBlock:v49];
        int v37 = *((unsigned __int8 *)v84 + 24);
        if (*((unsigned char *)v84 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v87 = 67109378;
          int v88 = 159;
          __int16 v89 = 2080;
          v90 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
        }

        _Block_object_dispose(buf, 8);
        if (v37) {
          goto LABEL_34;
        }
      }

      id v10 = v33;
    }
    if (!v45) {
      goto LABEL_42;
    }
    double v38 = CFAbsoluteTimeGetCurrent();
    if (v38 - v80[3] < 0.01) {
      goto LABEL_42;
    }
    v80[3] = v38;
    v87[0] = 0;
    (*((void (**)(id, uint8_t *, double))v10 + 2))(v10, v87, 1.0);
    char v39 = *((unsigned char *)v84 + 24) | v87[0];
    *((unsigned char *)v84 + 24) = v39;
    if (!v39 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_42;
    }
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 163;
    LOWORD(v92) = 2080;
    *(void *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
    uint64_t v29 = MEMORY[0x1E4F14500];
    goto LABEL_41;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = 88;
    LOWORD(v92) = 2080;
    *(void *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_44:
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);
}

void __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.2);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_260(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v8 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v8 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + a3 * 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_262(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double v6 = *(double *)(a1 + 56);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v8 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v8 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(v6 + a3 * 0.3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_263(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  char v9 = (void *)MEMORY[0x1D25FED50]();
  *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
  if (*(void *)(a1 + 64)
    && (double v10 = *(double *)(a1 + 104),
        double v11 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24),
        double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8),
        Current - *(double *)(v13 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v13 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(v10 + v11 * 0.1),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v14 = [*(id *)(a1 + 32) businessItemsForRegion:v7];
    [v7 center];
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 40), "_pointOfInterestTypeStringsFromBusinessItems:withOriginalCoordinate:", v14);
    [*(id *)(a1 + 40) _insertPointOfInterestTypeStrings:v15 graph:*(void *)(a1 + 48) withMomentNodes:v8 loggingConnection:*(void *)(a1 + 56)];
  }
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  double v10 = v8;
  double v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestPointsOfInterestProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = mach_absolute_time();
  uint64_t v13 = [(PGGraphBuilder *)self->_graphBuilder graph];
  uint64_t v14 = objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v13, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);

  if ([v14 count]) {
    [(PGGraphIngestPointsOfInterestProcessor *)self disambiguatePointsOfInterestWithMomentNodes:v14 graphUpdate:v6 progress:v7];
  }
  uint64_t v15 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v18 = v11;
  double v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestPointsOfInterestProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t buf = 136315394;
    uint64_t v22 = "PGGraphIngestPointsOfInterestProcessor";
    __int16 v23 = 2048;
    double v24 = (float)((float)((float)((float)(v15 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3 = a3;
  if (([v3 isResumingFullAnalysis] & 1) != 0
    || ([v3 hasMomentsToInsert] & 1) != 0
    || ([v3 hasMomentsToDelete] & 1) != 0)
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

- (PGGraphIngestPointsOfInterestProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphIngestPointsOfInterestProcessor;
  uint64_t v6 = [(PGGraphIngestPointsOfInterestProcessor *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F76C50]);
    os_signpost_id_t v9 = [v5 poiCache];
    uint64_t v10 = [v8 initWithBusinessCategoryCache:v9];
    businessCacheUpdater = v7->_businessCacheUpdater;
    v7->_businessCacheUpdater = (CLSBusinessCacheUpdater *)v10;
  }
  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

@end