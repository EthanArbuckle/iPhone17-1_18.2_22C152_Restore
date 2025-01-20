@interface RTMapsSupportManager
- (RTMapServiceManager)mapServiceManager;
- (RTMapsSupportManager)init;
- (RTMapsSupportManager)initWithMapServiceManager:(id)a3;
- (int)castReferenceFrame:(int)a3;
- (void)_clearParkedCarBulletin;
- (void)_fetchCollectionPlaceItemsWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchFavoriteItemsWithHandler:(id)a3;
- (void)_fetchFavoritePlacesWithHandler:(id)a3;
- (void)_fetchFavoritePlacesWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchHistoryDirectionsItemsWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchHistoryEntryPlaceDisplaysWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchHistoryEntryRoutesWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchHistoryPlaceItemsWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchPinnedPlacesWithHandler:(id)a3;
- (void)_fetchReviewedPlacesWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchReviewedPlacesWrapperWithOptions:(id)a3 handler:(id)a4;
- (void)_showParkedCarBulletinForEvent:(id)a3;
- (void)_showParkedCarReplacementBulletinForEvent:(id)a3 replacingEvent:(id)a4;
- (void)_shutdownWithHandler:(id)a3;
- (void)fetchFavoritePlacesWithHandler:(id)a3;
- (void)fetchFavoritePlacesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchHistoryEntryPlaceDisplaysWithOptions:(id)a3 handler:(id)a4;
- (void)fetchHistoryEntryRoutesWithOptions:(id)a3 handler:(id)a4;
- (void)fetchPinnedPlacesWithHandler:(id)a3;
- (void)fetchReviewedPlacesWithOptions:(id)a3 handler:(id)a4;
- (void)setMapServiceManager:(id)a3;
@end

@implementation RTMapsSupportManager

uint64_t __74__RTMapsSupportManager_fetchHistoryEntryPlaceDisplaysWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchHistoryEntryPlaceDisplaysWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __67__RTMapsSupportManager_fetchHistoryEntryRoutesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchHistoryEntryRoutesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_fetchHistoryEntryPlaceDisplaysWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__RTMapsSupportManager__fetchHistoryEntryPlaceDisplaysWithOptions_handler___block_invoke;
    v10[3] = &unk_1E6B92320;
    v13 = v7;
    id v11 = v6;
    v12 = self;
    [(RTMapsSupportManager *)self _fetchHistoryPlaceItemsWithOptions:v11 handler:v10];

    v9 = v13;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTMapsSupportManager _fetchHistoryEntryPlaceDisplaysWithOptions:handler:]";
      __int16 v16 = 1024;
      int v17 = 474;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (void)_fetchHistoryEntryRoutesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__RTMapsSupportManager__fetchHistoryEntryRoutesWithOptions_handler___block_invoke;
    v10[3] = &unk_1E6B92320;
    v13 = v7;
    id v11 = v6;
    v12 = self;
    [(RTMapsSupportManager *)self _fetchHistoryDirectionsItemsWithOptions:v11 handler:v10];

    v9 = v13;
  }
  else
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[RTMapsSupportManager _fetchHistoryEntryRoutesWithOptions:handler:]";
      __int16 v16 = 1024;
      int v17 = 553;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (void)_fetchHistoryDirectionsItemsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTMapsSupportManager _fetchHistoryDirectionsItemsWithOptions:handler:]";
      __int16 v26 = 1024;
      int v27 = 288;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10 = [v7 dateInterval];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F74390];
    v12 = [v7 dateInterval];
    v13 = [v12 startDate];
    v23[0] = v13;
    v14 = [v7 dateInterval];
    v15 = [v14 endDate];
    v23[1] = v15;
    __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    int v17 = [v11 queryPredicateWithFormat:@"createTime >= %@ && createTime <= %@" argumentArray:v16];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F74388]) initWithPredicate:v17 sortDescriptors:0 range:0];
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F74320]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__RTMapsSupportManager__fetchHistoryDirectionsItemsWithOptions_handler___block_invoke;
  v20[3] = &unk_1E6B91468;
  id v21 = v8;
  SEL v22 = a2;
  v20[4] = self;
  id v19 = v8;
  [v18 fetchWithOptions:v10 completionHandler:v20];
}

- (void)_fetchHistoryPlaceItemsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[RTMapsSupportManager _fetchHistoryPlaceItemsWithOptions:handler:]";
      __int16 v26 = 1024;
      int v27 = 261;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  v10 = [v7 dateInterval];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F74390];
    v12 = [v7 dateInterval];
    v13 = [v12 startDate];
    v23[0] = v13;
    v14 = [v7 dateInterval];
    v15 = [v14 endDate];
    v23[1] = v15;
    __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    int v17 = [v11 queryPredicateWithFormat:@"createTime >= %@ && createTime <= %@" argumentArray:v16];

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F74388]) initWithPredicate:v17 sortDescriptors:0 range:0];
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F74348]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __67__RTMapsSupportManager__fetchHistoryPlaceItemsWithOptions_handler___block_invoke;
  v20[3] = &unk_1E6B91468;
  id v21 = v8;
  SEL v22 = a2;
  v20[4] = self;
  id v19 = v8;
  [v18 fetchWithOptions:v10 completionHandler:v20];
}

uint64_t __63__RTMapsSupportManager_fetchFavoritePlacesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFavoritePlacesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

uint64_t __72__RTMapsSupportManager__fetchHistoryDirectionsItemsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu items from query, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __68__RTMapsSupportManager__fetchHistoryEntryRoutesWithOptions_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a3)
  {
    v84 = objc_opt_new();
    v85 = objc_opt_new();
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v83 = v5;
    id obj = v5;
    uint64_t v88 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
    if (!v88) {
      goto LABEL_35;
    }
    uint64_t v87 = *(void *)v101;
    uint64_t v90 = a1;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v101 != v87) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v100 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(a1 + 32) dateInterval];
        if (!v8) {
          goto LABEL_10;
        }
        __int16 v9 = (void *)v8;
        uint64_t v10 = [v7 createTime];
        __int16 v11 = [*(id *)(a1 + 32) dateInterval];
        uint64_t v12 = [v11 startDate];
        uint64_t v13 = [*(id *)(a1 + 32) dateInterval];
        v14 = [v13 endDate];
        int v15 = [v10 betweenDate:v12 andDate:v14];

        if (v15)
        {
LABEL_10:
          uint64_t v92 = v6;
          __int16 v16 = *(void **)(a1 + 40);
          int v17 = [v7 routeRequestStorage];
          id v18 = [v17 waypoints];
          id v19 = [v18 firstObject];
          v20 = [v19 mapItemStorage];
          uint64_t v21 = [v16 castReferenceFrame:[v20 referenceFrame]];

          id v95 = objc_alloc(MEMORY[0x1E4F5CE00]);
          SEL v22 = [v7 routeRequestStorage];
          v23 = [v22 waypoints];
          v24 = [v23 firstObject];
          v25 = [v24 latLng];
          [v25 lat];
          double v27 = v26;
          uint64_t v28 = [v7 routeRequestStorage];
          v29 = [v28 waypoints];
          [v29 firstObject];
          v31 = v30 = v7;
          v32 = [v31 latLng];
          [v32 lng];
          unsigned int v89 = v21;
          uint64_t v91 = [v95 initWithLatitude:0 longitude:v21 horizontalUncertainty:v27 date:v33 referenceFrame:1.0];

          v34 = [v30 routeRequestStorage];
          v35 = [v34 waypoints];
          v36 = [v35 firstObject];
          v37 = [v36 mapItemStorage];

          v97 = v30;
          if (v37)
          {
            v38 = [*(id *)(v90 + 40) mapServiceManager];
            v39 = [MEMORY[0x1E4F29128] UUID];
            v40 = [v30 routeRequestStorage];
            v41 = [v40 waypoints];
            v42 = [v41 firstObject];
            v43 = [v42 mapItemStorage];
            v44 = [MEMORY[0x1E4F1C9C8] date];
            id v99 = 0;
            v96 = [v38 mapItemWithIdentifier:v39 geoMapItemStorage:v43 source:64 creationDate:v44 error:&v99];
            id v45 = v99;

            v46 = v45;
            if (v45)
            {
              a1 = v90;
              v47 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
              uint64_t v6 = v92;
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v105 = v97;
                __int16 v106 = 2112;
                v107 = v46;
                _os_log_error_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_ERROR, "failed to geocode a history direction, %@, error, %@", buf, 0x16u);
              }

              [v85 addObject:v46];
              v48 = (void *)v91;
              goto LABEL_22;
            }
          }
          else
          {
            v96 = 0;
          }
          uint64_t v6 = v92;
          id v93 = objc_alloc(MEMORY[0x1E4F5CE00]);
          v49 = [v97 routeRequestStorage];
          v50 = [v49 waypoints];
          v51 = [v50 lastObject];
          v52 = [v51 latLng];
          [v52 lat];
          double v54 = v53;
          v55 = [v97 routeRequestStorage];
          v56 = [v55 waypoints];
          v57 = [v56 lastObject];
          v58 = [v57 latLng];
          [v58 lng];
          uint64_t v94 = [v93 initWithLatitude:0 longitude:v89 horizontalUncertainty:v54 date:v59 referenceFrame:1.0];

          v60 = [v97 routeRequestStorage];
          v61 = [v60 waypoints];
          v62 = [v61 lastObject];
          v63 = [v62 mapItemStorage];

          if (v63)
          {
            v64 = [*(id *)(v90 + 40) mapServiceManager];
            v65 = [MEMORY[0x1E4F29128] UUID];
            v66 = [v97 routeRequestStorage];
            v67 = [v66 waypoints];
            v68 = [v67 lastObject];
            v69 = [v68 mapItemStorage];
            v70 = [MEMORY[0x1E4F1C9C8] date];
            id v98 = 0;
            v71 = [v64 mapItemWithIdentifier:v65 geoMapItemStorage:v69 source:64 creationDate:v70 error:&v98];
            v72 = (RTHistoryEntryRoute *)v98;

            if (v72)
            {
              [v85 addObject:v72];
              a1 = v90;
              v48 = (void *)v91;
              v46 = (void *)v94;
              goto LABEL_19;
            }
            a1 = v90;
            v48 = (void *)v91;
            v46 = (void *)v94;
            if (v94 && v71)
            {
              v73 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
              if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                v105 = v97;
                __int16 v106 = 2112;
                v107 = v71;
                __int16 v108 = 2112;
                uint64_t v109 = v94;
                _os_log_impl(&dword_1D9BFA000, v73, OS_LOG_TYPE_INFO, "history direction, %@, map item, %@, location, %@", buf, 0x20u);
              }

              v74 = [RTHistoryEntryRoute alloc];
              v75 = [v97 identifier];
              v76 = [v97 createTime];
              LOBYTE(v82) = [v97 navigationInterrupted];
              v77 = v74;
              v46 = (void *)v94;
              v72 = [(RTHistoryEntryRoute *)v77 initWithIdentifier:v75 usageDate:v76 originLocation:v91 originMapItem:v96 destinationLocation:v94 destinationMapItem:v71 navigationWasInterrupted:v82];

              if (v72)
              {
                [v84 addObject:v72];
              }
              else
              {
                v78 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
                if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v105 = v97;
                  _os_log_error_impl(&dword_1D9BFA000, v78, OS_LOG_TYPE_ERROR, "failed to allocate history direction, %@", buf, 0xCu);
                }
              }
LABEL_19:
            }
          }
          else
          {
            v71 = 0;
            a1 = v90;
            v48 = (void *)v91;
            v46 = (void *)v94;
          }

LABEL_22:
        }
        ++v6;
      }
      while (v88 != v6);
      uint64_t v79 = [obj countByEnumeratingWithState:&v100 objects:v110 count:16];
      uint64_t v88 = v79;
      if (!v79)
      {
LABEL_35:

        v80 = _RTSafeArray();
        v81 = _RTMultiErrorCreate();

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
        id v5 = v83;
        goto LABEL_36;
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_36:
}

uint64_t __67__RTMapsSupportManager__fetchHistoryPlaceItemsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu items from query, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __75__RTMapsSupportManager__fetchHistoryEntryPlaceDisplaysWithOptions_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v41 = objc_opt_new();
    v42 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v40 = v5;
    id obj = v5;
    uint64_t v45 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v45)
    {
      uint64_t v44 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v48 != v44) {
            objc_enumerationMutation(obj);
          }
          int v7 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v8 = [v7 mapItemStorage];

          if (v8)
          {
            uint64_t v9 = [*(id *)(a1 + 32) dateInterval];
            if (!v9) {
              goto LABEL_11;
            }
            uint64_t v10 = (void *)v9;
            __int16 v11 = [v7 createTime];
            uint64_t v12 = [*(id *)(a1 + 32) dateInterval];
            uint64_t v13 = [v12 startDate];
            v14 = [*(id *)(a1 + 32) dateInterval];
            int v15 = [v14 endDate];
            int v16 = [v11 betweenDate:v13 andDate:v15];

            if (v16)
            {
LABEL_11:
              int v17 = *(void **)(a1 + 40);
              id v18 = [v7 mapItemStorage];
              uint64_t v19 = [v17 castReferenceFrame:[v18 referenceFrame]];

              id v20 = objc_alloc(MEMORY[0x1E4F5CE00]);
              uint64_t v21 = [v7 mapItemStorage];
              [v21 centerCoordinate];
              double v23 = v22;
              v24 = [v7 mapItemStorage];
              [v24 centerCoordinate];
              v25 = [v20 initWithLatitude:0 longitude:v19 horizontalUncertainty:v23 date:v24 referenceFrame:v25];

              double v26 = [*(id *)(a1 + 40) mapServiceManager];
              double v27 = [MEMORY[0x1E4F29128] UUID];
              uint64_t v28 = [v7 mapItemStorage];
              v29 = [MEMORY[0x1E4F1C9C8] date];
              id v46 = 0;
              v30 = [v26 mapItemWithIdentifier:v27 geoMapItemStorage:v28 source:128 creationDate:v29 error:&v46];
              id v31 = v46;

              v32 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
              double v33 = v32;
              if (v31)
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = v7;
                  __int16 v53 = 2112;
                  id v54 = v31;
                  _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "failed to geocode a history place item, %@, error, %@", buf, 0x16u);
                }

                [v42 addObject:v31];
              }
              else
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = v7;
                  __int16 v53 = 2112;
                  id v54 = v30;
                  _os_log_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_INFO, "history place item, %@, map item, %@", buf, 0x16u);
                }

                if (!v25) {
                  goto LABEL_21;
                }
                if (!v30) {
                  goto LABEL_21;
                }
                v34 = [RTHistoryEntryPlaceDisplay alloc];
                v35 = [v7 identifier];
                v36 = [v7 createTime];
                v37 = [(RTHistoryEntryPlaceDisplay *)v34 initWithIdentifier:v35 usageDate:v36 location:v25 mapItem:v30];

                if (v37)
                {
                  [v41 addObject:v37];
                }
                else
                {
LABEL_21:
                  v37 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v52 = v7;
                    _os_log_error_impl(&dword_1D9BFA000, v37, OS_LOG_TYPE_ERROR, "failed to allocate history entry place display, %@", buf, 0xCu);
                  }
                }
              }
            }
          }
        }
        uint64_t v45 = [obj countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v45);
    }

    v38 = _RTSafeArray();
    v39 = _RTMultiErrorCreate();

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
    id v5 = v40;
  }
}

- (void)fetchHistoryEntryRoutesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__RTMapsSupportManager_fetchHistoryEntryRoutesWithOptions_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)fetchHistoryEntryPlaceDisplaysWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__RTMapsSupportManager_fetchHistoryEntryPlaceDisplaysWithOptions_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

- (void)_fetchFavoritePlacesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__RTMapsSupportManager__fetchFavoritePlacesWithOptions_handler___block_invoke;
    v9[3] = &unk_1E6B90688;
    v9[4] = self;
    id v10 = v6;
    [(RTMapsSupportManager *)self _fetchCollectionPlaceItemsWithOptions:a3 handler:v9];
    uint64_t v8 = v10;
  }
  else
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[RTMapsSupportManager _fetchFavoritePlacesWithOptions:handler:]";
      __int16 v13 = 1024;
      int v14 = 317;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

- (void)_fetchCollectionPlaceItemsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v26 = "-[RTMapsSupportManager _fetchCollectionPlaceItemsWithOptions:handler:]";
      __int16 v27 = 1024;
      int v28 = 217;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = [v7 location];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F74390]);
    uint64_t v12 = [v7 location];
    [v12 latitude];
    double v14 = v13;
    uint64_t v15 = [v7 location];
    [v15 longitude];
    double v17 = v16;
    [v7 distance];
    uint64_t v19 = (void *)[v11 initWithCenterLatitude:v14 centerLongitude:v17 squareSideLengthMeters:v18];

    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F74388]) initWithPredicate:v19 sortDescriptors:0 range:0];
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F742F0]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__RTMapsSupportManager__fetchCollectionPlaceItemsWithOptions_handler___block_invoke;
  v22[3] = &unk_1E6B91468;
  id v23 = v8;
  SEL v24 = a2;
  v22[4] = self;
  id v21 = v8;
  [v20 fetchWithOptions:v10 completionHandler:v22];
}

void __67__RTMapsSupportManager__fetchHistoryPlaceItemsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__RTMapsSupportManager__fetchHistoryPlaceItemsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __72__RTMapsSupportManager__fetchHistoryDirectionsItemsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTMapsSupportManager__fetchHistoryDirectionsItemsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

- (void)fetchFavoritePlacesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__RTMapsSupportManager_fetchFavoritePlacesWithOptions_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

void __70__RTMapsSupportManager__fetchCollectionPlaceItemsWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__RTMapsSupportManager__fetchCollectionPlaceItemsWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __70__RTMapsSupportManager__fetchCollectionPlaceItemsWithOptions_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu items from query, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __64__RTMapsSupportManager__fetchFavoritePlacesWithOptions_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v5 count]];
    uint64_t v29 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    __int16 v27 = v6;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          __int16 v11 = [v10 mapItemStorage];

          if (v11)
          {
            uint64_t v12 = a1;
            uint64_t v13 = [*(id *)(a1 + 32) mapServiceManager];
            id v14 = [MEMORY[0x1E4F29128] UUID];
            long long v15 = [v10 mapItemStorage];
            double v16 = [MEMORY[0x1E4F1C9C8] date];
            id v32 = 0;
            double v17 = [v13 mapItemWithIdentifier:v14 geoMapItemStorage:v15 source:16 creationDate:v16 error:&v32];
            id v18 = v32;

            uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
            id v20 = v19;
            if (v18)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v10;
                __int16 v39 = 2112;
                id v40 = v18;
                _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "failed to geocode a place item, %@, error, %@", buf, 0x16u);
              }

              [v29 addObject:v18];
              a1 = v12;
            }
            else
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v10;
                __int16 v39 = 2112;
                id v40 = v17;
                _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "place item, %@, map item, %@", buf, 0x16u);
              }

              id v21 = [RTFavoritePlace alloc];
              double v22 = [v10 customName];
              id v23 = [(RTFavoritePlace *)v21 initWithTitle:v22 mapItem:v17];

              if (v23)
              {
                [v28 addObject:v23];
                a1 = v12;
              }
              else
              {
                SEL v24 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
                a1 = v12;
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v10;
                  _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "failed to allocate place item, %@", buf, 0xCu);
                }
              }
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v8);
    }

    v25 = _RTSafeArray();
    double v26 = _RTMultiErrorCreate();

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    uint64_t v6 = v27;
  }
}

- (RTMapsSupportManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapServiceManager_);
}

- (RTMapsSupportManager)initWithMapServiceManager:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)RTMapsSupportManager;
    uint64_t v6 = [(RTNotifier *)&v11 init];
    uint64_t v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_mapServiceManager, a3);
    }
    self = v7;
    uint64_t v8 = self;
  }
  else
  {
    __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager", buf, 2u);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)fetchFavoritePlacesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__RTMapsSupportManager_fetchFavoritePlacesWithHandler___block_invoke;
    v6[3] = &unk_1E6B90CE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __55__RTMapsSupportManager_fetchFavoritePlacesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchFavoritePlacesWithHandler:*(void *)(a1 + 40)];
}

- (void)fetchPinnedPlacesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTNotifier *)self queue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__RTMapsSupportManager_fetchPinnedPlacesWithHandler___block_invoke;
    v6[3] = &unk_1E6B90CE0;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __53__RTMapsSupportManager_fetchPinnedPlacesWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchPinnedPlacesWithHandler:*(void *)(a1 + 40)];
}

- (void)fetchReviewedPlacesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(RTNotifier *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__RTMapsSupportManager_fetchReviewedPlacesWithOptions_handler___block_invoke;
    block[3] = &unk_1E6B90660;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(v8, block);
  }
}

uint64_t __63__RTMapsSupportManager_fetchReviewedPlacesWithOptions_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchReviewedPlacesWithOptions:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_showParkedCarBulletinForEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "Posting parked car bulletin %@", (uint8_t *)&v6, 0xCu);
  }

  id v5 = objc_alloc_init((Class)getMSPMapsPushDaemonRemoteProxyClass());
  [v5 showParkedCarBulletinForEvent:v3];
}

- (void)_showParkedCarReplacementBulletinForEvent:(id)a3 replacingEvent:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Posting replacement bulletin, newEvent, %@, oldEvent, %@", (uint8_t *)&v9, 0x16u);
  }

  id v8 = objc_alloc_init((Class)getMSPMapsPushDaemonRemoteProxyClass());
  [v8 showParkedCarReplacementBulletinForEvent:v5 replacingEvent:v6];
}

- (void)_clearParkedCarBulletin
{
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "Clearing parked car bulletin", v4, 2u);
  }

  id v3 = objc_alloc_init((Class)getMSPMapsPushDaemonRemoteProxyClass());
  [v3 clearParkedCarBulletin];
}

- (void)_fetchFavoritePlacesWithHandler:(id)a3
{
}

- (void)_fetchFavoriteItemsWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[RTMapsSupportManager _fetchFavoriteItemsWithHandler:]";
      __int16 v14 = 1024;
      int v15 = 244;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F74310]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__RTMapsSupportManager__fetchFavoriteItemsWithHandler___block_invoke;
  v9[3] = &unk_1E6B91468;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v8 = v5;
  [v7 fetchWithCompletionHandler:v9];
}

void __55__RTMapsSupportManager__fetchFavoriteItemsWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__RTMapsSupportManager__fetchFavoriteItemsWithHandler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __55__RTMapsSupportManager__fetchFavoriteItemsWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu items from query, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_fetchPinnedPlacesWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__RTMapsSupportManager__fetchPinnedPlacesWithHandler___block_invoke;
    v7[3] = &unk_1E6B90688;
    v7[4] = self;
    id v8 = v4;
    [(RTMapsSupportManager *)self _fetchFavoriteItemsWithHandler:v7];
    uint64_t v6 = v8;
  }
  else
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = "-[RTMapsSupportManager _fetchPinnedPlacesWithHandler:]";
      __int16 v11 = 1024;
      int v12 = 378;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __54__RTMapsSupportManager__fetchPinnedPlacesWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v5 count]];
    uint64_t v29 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    __int16 v27 = v6;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          __int16 v11 = [v10 mapItemStorage];

          if (v11)
          {
            uint64_t v12 = a1;
            uint64_t v13 = [*(id *)(a1 + 32) mapServiceManager];
            id v14 = [MEMORY[0x1E4F29128] UUID];
            long long v15 = [v10 mapItemStorage];
            uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
            id v32 = 0;
            double v17 = [v13 mapItemWithIdentifier:v14 geoMapItemStorage:v15 source:8 creationDate:v16 error:&v32];
            id v18 = v32;

            uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
            id v20 = v19;
            if (v18)
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v10;
                __int16 v39 = 2112;
                id v40 = v18;
                _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "failed to geocode a favorite item, %@, error, %@", buf, 0x16u);
              }

              [v29 addObject:v18];
              a1 = v12;
            }
            else
            {
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v10;
                __int16 v39 = 2112;
                id v40 = v17;
                _os_log_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_INFO, "favorite item, %@, map item, %@", buf, 0x16u);
              }

              uint64_t v21 = (int)[v10 type] - 2;
              a1 = v12;
              if (v21 > 3) {
                uint64_t v22 = 0;
              }
              else {
                uint64_t v22 = qword_1DA0FF6A0[v21];
              }
              id v23 = [[RTPinnedPlace alloc] initWithType:v22 mapItem:v17];
              if (v23)
              {
                [v28 addObject:v23];
              }
              else
              {
                SEL v24 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v38 = v10;
                  _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "failed to allocate favorite item, %@", buf, 0xCu);
                }
              }
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v8);
    }

    v25 = _RTSafeArray();
    double v26 = _RTMultiErrorCreate();

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
    uint64_t v6 = v27;
  }
}

- (int)castReferenceFrame:(int)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)_fetchReviewedPlacesWrapperWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F74390];
    __int16 v9 = [a3 dateInterval];
    uint64_t v10 = [v9 startDate];
    uint64_t v22 = v10;
    __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    uint64_t v12 = [v8 queryPredicateWithFormat:@"modificationTime >= &@" argumentArray:v11];

    id v13 = objc_alloc(MEMORY[0x1E4F74388]);
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"modificationTime" ascending:0];
    uint64_t v21 = v14;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    uint64_t v16 = (void *)[v13 initWithPredicate:v12 sortDescriptors:v15 range:0];

    id v17 = objc_alloc_init(MEMORY[0x1E4F74358]);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__RTMapsSupportManager__fetchReviewedPlacesWrapperWithOptions_handler___block_invoke;
    v18[3] = &unk_1E6B91468;
    v18[4] = self;
    SEL v20 = a2;
    id v19 = v7;
    [v17 fetchWithOptions:v16 completionHandler:v18];
  }
  else
  {
    uint64_t v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      SEL v24 = "-[RTMapsSupportManager _fetchReviewedPlacesWrapperWithOptions:handler:]";
      __int16 v25 = 1024;
      int v26 = 659;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __71__RTMapsSupportManager__fetchReviewedPlacesWrapperWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__RTMapsSupportManager__fetchReviewedPlacesWrapperWithOptions_handler___block_invoke_2;
  block[3] = &unk_1E6B90C40;
  id v13 = v5;
  id v14 = v6;
  long long v11 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __71__RTMapsSupportManager__fetchReviewedPlacesWrapperWithOptions_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v5 = [*(id *)(a1 + 32) count];
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    id v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "%@, %lu places from query, error, %@", (uint8_t *)&v7, 0x20u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_fetchReviewedPlacesWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__RTMapsSupportManager__fetchReviewedPlacesWithOptions_handler___block_invoke;
    v9[3] = &unk_1E6B914B8;
    uint64_t v10 = v6;
    id v11 = v7;
    [(RTMapsSupportManager *)self _fetchReviewedPlacesWrapperWithOptions:v10 handler:v9];

    id v8 = v10;
  }
  else
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[RTMapsSupportManager _fetchReviewedPlacesWithOptions:handler:]";
      __int16 v14 = 1024;
      int v15 = 681;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

void __64__RTMapsSupportManager__fetchReviewedPlacesWithOptions_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v33 = [v5 count];
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, " fetched, %lu, reviewedPlaces, error, %@", buf, 0x16u);
  }
  SEL v24 = v6;

  __int16 v25 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v13 = [v12 modificationTime];
        __int16 v14 = [*(id *)(a1 + 32) dateInterval];
        int v15 = [v14 startDate];
        uint64_t v16 = [v13 compare:v15];

        if (v16 == 1)
        {
          id v17 = [RTReviewedPlace alloc];
          uint64_t v18 = [v12 muid];
          id v19 = [v12 lastSuggestedReviewDate];
          uint64_t v20 = [v12 hasUserReviewed];
          uint64_t v21 = [v12 modificationTime];
          uint64_t v22 = [(RTReviewedPlace *)v17 initWithMuid:v18 lastSuggestedReviewDate:v19 hasUserReviewed:v20 modifiedDate:v21];

          [v25 addObject:v22];
          id v23 = _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = (uint64_t)v22;
            _os_log_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_INFO, "reviewed place fetched, %@", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end