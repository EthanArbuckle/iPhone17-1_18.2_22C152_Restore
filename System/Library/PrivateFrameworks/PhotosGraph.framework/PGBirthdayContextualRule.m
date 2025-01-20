@interface PGBirthdayContextualRule
- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3;
- (PGBirthdayContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 curationManager:(id)a5 loggingConnection:(id)a6;
- (id)_bestAssetInCuratedAssets:(id)a3 forPerson:(id)a4 contextualScore:(double *)a5;
- (id)_bestBirthdayCelebrationAssetForHighlightNode:(id)a3 assetCollection:(id)a4 curationContext:(id)a5;
- (id)_fetchCuratedAssetsForHighlightItem:(id)a3 intersectingAssets:(id)a4;
- (id)_filterCuratedAssets:(id)a3 forHighlightItem:(id)a4;
- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8;
@end

@implementation PGBirthdayContextualRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_personNodeByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_availablePersons, 0);
}

- (id)_bestBirthdayCelebrationAssetForHighlightNode:(id)a3 assetCollection:(id)a4 curationContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 graph];
  v12 = [(PGCurationManager *)self->_curationManager curationCriteriaFactory];
  v13 = [v12 curationCriteriaWithCollection:v10 meaningLabel:@"Birthday" inGraph:v11 client:0];

  v14 = objc_alloc_init(PGKeyAssetCurationOptions);
  curationManager = self->_curationManager;
  v16 = [v10 UUID];

  v17 = [(PGCurationManager *)curationManager curatedKeyAssetForCollectionUUID:v16 curatedAssetCollection:v9 options:v14 criteria:v13 curationContext:v8];

  return v17;
}

- (id)_bestAssetInCuratedAssets:(id)a3 forPerson:(id)a4 contextualScore:(double *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v39 = a4;
  v7 = [v39 localIdentifier];
  v44 = [MEMORY[0x1E4F39050] fetchFacesGroupedByAssetLocalIdentifierForAssets:v6 options:0];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v6;
  uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v45)
  {
    id v42 = 0;
    uint64_t v43 = *(void *)v52;
    double v8 = 0.5;
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v52 != v43) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v12 = [v11 localIdentifier];
        v13 = [v44 objectForKeyedSubscript:v12];

        unint64_t v46 = [v13 count];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v55 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v48;
          while (2)
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v48 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v47 + 1) + 8 * j);
              v20 = [v19 personLocalIdentifier];
              char v21 = [v20 isEqualToString:v7];

              if (v21)
              {
                id v22 = v19;

                if (v22)
                {
                  double v23 = (double)(unint64_t)[v11 pixelWidth];
                  double v24 = 1.3333 / (v23 / (double)(unint64_t)[v11 pixelHeight]);
                  [v22 size];
                  double v26 = v25 * v24;
                  double v27 = 0.0;
                  if (v26 >= 0.05 && v26 <= v8)
                  {
                    if (v26 <= 0.15)
                    {
                      double v27 = v26 / 0.15;
                    }
                    else
                    {
                      double v27 = (0.5 - v26) / 0.35;
                      double v8 = 0.5;
                      if (v26 >= 0.5) {
                        double v27 = 0.0;
                      }
                    }
                  }
                  double v29 = ceil(v27 * 4.0) * 0.25;
                  [v11 overallAestheticScore];
                  double v31 = ceil(v30 * 10.0) / 10.0;
                  [v11 curationScore];
                  double v33 = 1.0 / (double)v46 + v29 * 0.1 + v31 * 0.01 + ceil(v32 * 10.0) / 10.0 * 0.01;
                  [v22 quality];
                  double v35 = v33 + fmax(v34, 0.0) * 0.001;
                  if (!v42 || v35 > v9)
                  {
                    id v36 = v11;

                    *a5 = v35;
                    id v42 = v36;
                    double v9 = v35;
                  }
                }
                goto LABEL_29;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v55 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        id v22 = 0;
LABEL_29:
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v45);
  }
  else
  {
    id v42 = 0;
  }

  id v37 = v42;
  return v37;
}

- (id)_fetchCuratedAssetsForHighlightItem:(id)a3 intersectingAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PGBirthdayContextualRule *)self _filterCuratedAssets:v7 forHighlightItem:v6];
  if ([v8 count])
  {
    double v9 = [v6 extendedCuratedAssets];
    id v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self in %@", v10];
    v12 = [v7 filteredArrayUsingPredicate:v11];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

- (id)_filterCuratedAssets:(id)a3 forHighlightItem:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  double v8 = [v6 startDate];
  double v9 = [v6 endDate];

  id v10 = [v5 predicateWithFormat:@"creationDate >= %@ && creationDate <= %@", v8, v9];
  v11 = [v7 filteredArrayUsingPredicate:v10];

  return v11;
}

- (void)enumerateContextualKeyAssetsForYearHighlight:(id)a3 sharingFilter:(unsigned __int16)a4 withOptions:(id)a5 modelReader:(id)a6 curationContext:(id)a7 usingBlock:(id)a8
{
  uint64_t v12 = a4;
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  id v75 = a5;
  id v14 = a6;
  id v74 = a7;
  v79 = (void (**)(id, void *, void *, uint64_t, char *, double))a8;
  if (v79 && [(NSArray *)self->_availablePersons count])
  {
    uint64_t v15 = [v78 startDate];
    uint64_t v16 = [v78 endDate];
    uint64_t v17 = (void *)v16;
    if (v15 && v16)
    {
      id v89 = v14;
      char v112 = 0;
      v18 = [(NSArray *)self->_availablePersons firstObject];
      v19 = [v18 photoLibrary];
      v20 = [v19 librarySpecificFetchOptions];

      unsigned int v92 = v12;
      uint64_t v21 = +[PGHighlightEnrichmentUtilities internalPredicateForFetchingAssetsForSharingFilter:v12];
      v71 = v17;
      v72 = v15;
      uint64_t v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlightBeingExtendedAssets != nil && dateCreated >= %@ && dateCreated <= %@", v15, v17];
      double v23 = (void *)MEMORY[0x1E4F28BA0];
      v69 = (void *)v22;
      v70 = (void *)v21;
      v117[0] = v21;
      v117[1] = v22;
      double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
      double v25 = [v23 andPredicateWithSubpredicates:v24];
      v87 = v20;
      [v20 setInternalPredicate:v25];

      v88 = objc_opt_new();
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      double v26 = self->_availablePersons;
      uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v108 objects:v116 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v109;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v109 != v29) {
              objc_enumerationMutation(v26);
            }
            double v31 = *(void **)(*((void *)&v108 + 1) + 8 * i);
            double v32 = (void *)MEMORY[0x1D25FED50]();
            double v33 = [MEMORY[0x1E4F38EB8] fetchAssetsForPerson:v31 options:v87];
            if ([v33 count])
            {
              double v34 = [v33 fetchedObjects];
              double v35 = [v31 localIdentifier];
              [v88 setObject:v34 forKeyedSubscript:v35];
            }
          }
          uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v108 objects:v116 count:16];
        }
        while (v28);
      }

      id v14 = v89;
      if ([v88 count])
      {
        id v36 = [v78 localDateComponents];
        id v37 = [v75 localTodayComponents];
        id v38 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        v68 = v36;
        objc_msgSend(v38, "setYear:", objc_msgSend(v36, "year"));
        objc_msgSend(v38, "setMonth:", objc_msgSend(v37, "month"));
        v67 = v37;
        objc_msgSend(v38, "setDay:", objc_msgSend(v37, "day"));
        [v38 setHour:12];
        [v38 setMinute:0];
        v66 = v38;
        [v38 setSecond:0];
        uint64_t v39 = v92;
        [v78 childHighlightItemsForHighlightFilter:v92];
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v77 = [obj countByEnumeratingWithState:&v104 objects:v115 count:16];
        if (v77)
        {
          uint64_t v76 = *(void *)v105;
          v94 = self;
LABEL_17:
          uint64_t v40 = 0;
          while (1)
          {
            if (*(void *)v105 != v76)
            {
              uint64_t v41 = v40;
              objc_enumerationMutation(obj);
              uint64_t v40 = v41;
            }
            uint64_t v80 = v40;
            uint64_t v42 = *(void *)(*((void *)&v104 + 1) + 8 * v40);
            long long v100 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            v81 = self->_availablePersons;
            uint64_t v84 = [(NSArray *)v81 countByEnumeratingWithState:&v100 objects:v114 count:16];
            if (v84)
            {
              uint64_t v82 = v42;
              uint64_t v83 = *(void *)v101;
              while (2)
              {
                for (uint64_t j = 0; j != v84; ++j)
                {
                  if (*(void *)v101 != v83) {
                    objc_enumerationMutation(v81);
                  }
                  v44 = *(void **)(*((void *)&v100 + 1) + 8 * j);
                  uint64_t v45 = (void *)MEMORY[0x1D25FED50]();
                  v93 = v44;
                  unint64_t v46 = [v44 localIdentifier];
                  long long v47 = [v88 objectForKeyedSubscript:v46];

                  long long v48 = [(PGBirthdayContextualRule *)self _filterCuratedAssets:v47 forHighlightItem:v42];
                  if ([v48 count])
                  {
                    v86 = v48;
                    uint64_t v85 = j;
                    long long v49 = [v14 fetchChildHighlightItemsForHighlightItem:v42 sharingFilter:v39];
                    long long v96 = 0u;
                    long long v97 = 0u;
                    long long v98 = 0u;
                    long long v99 = 0u;
                    id v95 = v49;
                    uint64_t v50 = [v95 countByEnumeratingWithState:&v96 objects:v113 count:16];
                    if (v50)
                    {
                      uint64_t v51 = v50;
                      v90 = 0;
                      v91 = 0;
                      uint64_t v52 = *(void *)v97;
                      double v53 = -1.79769313e308;
                      do
                      {
                        for (uint64_t k = 0; k != v51; ++k)
                        {
                          if (*(void *)v97 != v52) {
                            objc_enumerationMutation(v95);
                          }
                          v55 = *(void **)(*((void *)&v96 + 1) + 8 * k);
                          v56 = (void *)MEMORY[0x1D25FED50]();
                          if (MEMORY[0x1D25FE3E0]([v14 visibilityStateForHighlightItem:v55 sharingFilter:v39]))
                          {
                            uint64_t v57 = v47;
                            v58 = [(PGBirthdayContextualRule *)v94 _fetchCuratedAssetsForHighlightItem:v55 intersectingAssets:v47];
                            if ([v58 count])
                            {
                              *(void *)buf = 0;
                              v59 = [(PGBirthdayContextualRule *)v94 _bestAssetInCuratedAssets:v58 forPerson:v93 contextualScore:buf];
                              v60 = v59;
                              if (v59)
                              {
                                double v61 = *(double *)buf;
                                if (*(double *)buf <= v53)
                                {
                                  double v61 = v53;
                                }
                                else
                                {
                                  id v62 = v59;

                                  id v63 = v55;
                                  v90 = v63;
                                  v91 = v62;
                                  id v14 = v89;
                                }
                              }
                              else
                              {
                                double v61 = v53;
                              }

                              double v53 = v61;
                              uint64_t v39 = v92;
                            }

                            long long v47 = v57;
                          }
                        }
                        uint64_t v51 = [v95 countByEnumeratingWithState:&v96 objects:v113 count:16];
                      }
                      while (v51);
                    }
                    else
                    {
                      v90 = 0;
                      v91 = 0;
                      double v53 = -1.79769313e308;
                    }

                    if (v91)
                    {
                      v79[2](v79, v91, v90, v82, &v112, v53);

                      self = v94;
                      goto LABEL_52;
                    }
                    self = v94;
                    uint64_t v42 = v82;
                    uint64_t j = v85;
                    v64 = v90;
                  }
                  else
                  {

                    v64 = 0;
                  }
                }
                uint64_t v84 = [(NSArray *)v81 countByEnumeratingWithState:&v100 objects:v114 count:16];
                if (v84) {
                  continue;
                }
                break;
              }
            }
LABEL_52:

            if (v112) {
              break;
            }
            uint64_t v40 = v80 + 1;
            if (v80 + 1 == v77)
            {
              uint64_t v77 = [obj countByEnumeratingWithState:&v104 objects:v115 count:16];
              if (v77) {
                goto LABEL_17;
              }
              break;
            }
          }
        }
      }
      uint64_t v17 = v71;
      uint64_t v15 = v72;
    }
    else
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v15;
        __int16 v119 = 2112;
        v120 = v17;
        _os_log_fault_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_FAULT, "[PGBirthdayContextualRule] Unable to enumerate contextual key assets, year highlight missing date info: startDate = %@, endDate = %@", buf, 0x16u);
      }
    }
  }
}

- (BOOL)canProvideContextualKeyAssetsWithOptions:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = [v4 localTodayComponents];

  uint64_t v8 = [v7 month];
  uint64_t v9 = [v7 day];
  id v10 = +[PGGraphPersonNodeCollection personNodesIncludingMeInGraph:self->_graph];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke;
  v34[3] = &unk_1E68EC7B0;
  v34[4] = self;
  uint64_t v37 = v8;
  uint64_t v38 = v9;
  id v11 = v5;
  id v35 = v11;
  id v12 = v6;
  id v36 = v12;
  uint64_t v28 = v10;
  [v10 enumerateNodesUsingBlock:v34];
  v13 = +[PGGraphPersonNode personScoreSortDescriptors];
  [v11 sortUsingDescriptors:v13];

  id v14 = objc_opt_new();
  uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke_194;
  v31[3] = &unk_1E68EC7D8;
  id v16 = v15;
  id v32 = v16;
  id v17 = v14;
  id v33 = v17;
  [v11 enumerateObjectsUsingBlock:v31];
  objc_storeStrong((id *)&self->_personNodeByLocalIdentifier, v14);
  v18 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v19 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v12 options:v18];
  v20 = [v19 fetchedObjects];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke_2;
  v29[3] = &unk_1E68EC800;
  id v21 = v16;
  id v30 = v21;
  uint64_t v22 = [v20 sortedArrayUsingComparator:v29];
  availablePersons = self->_availablePersons;
  self->_availablePersons = v22;

  NSUInteger v24 = [(NSArray *)self->_availablePersons count];
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    double v26 = self->_availablePersons;
    *(_DWORD *)buf = 138413059;
    uint64_t v40 = self;
    __int16 v41 = 1024;
    BOOL v42 = v24 != 0;
    __int16 v43 = 2048;
    NSUInteger v44 = v24;
    __int16 v45 = 2113;
    unint64_t v46 = v26;
    _os_log_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_DEFAULT, "%@: canProvideContextualKeyAssets: %d, for %lu persons: %{private}@", buf, 0x26u);
  }

  return v24 != 0;
}

void __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isMeNode] & 1) != 0
    || ([v3 isFavorite] & 1) != 0
    || ([v3 collection],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 socialGroupNodes],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    id v7 = [v3 birthdayDateComponents];
    if (!v7)
    {
      id v7 = [v3 potentialBirthdayDateComponents];
      if (!v7)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 138477827;
        id v14 = v3;
        _os_log_debug_impl(&dword_1D1805000, v8, OS_LOG_TYPE_DEBUG, "No birthday date found for %{private}@, taking the potential birthday.", (uint8_t *)&v13, 0xCu);
      }
    }
    if ([v7 month] == *(void *)(a1 + 56) && objc_msgSend(v7, "day") == *(void *)(a1 + 64))
    {
      uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 138477827;
        id v14 = v3;
        _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Can provide contextual asset for person %{private}@", (uint8_t *)&v13, 0xCu);
      }
      [*(id *)(a1 + 40) addObject:v3];
      id v10 = *(void **)(a1 + 48);
      id v11 = [v3 localIdentifier];
      [v10 addObject:v11];
    }
    goto LABEL_13;
  }
  id v12 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138477827;
    id v14 = v3;
    _os_log_debug_impl(&dword_1D1805000, v12, OS_LOG_TYPE_DEBUG, "Skipping person %{private}@, not part of any social groups nor favorited.", (uint8_t *)&v13, 0xCu);
  }
LABEL_14:
}

void __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke_194(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v7 = [v5 localIdentifier];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];

  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v7];
}

uint64_t __69__PGBirthdayContextualRule_canProvideContextualKeyAssetsWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [a3 localIdentifier];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = [v6 localIdentifier];

  id v11 = [v9 objectForKeyedSubscript:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

- (PGBirthdayContextualRule)initWithGraph:(id)a3 photoLibrary:(id)a4 curationManager:(id)a5 loggingConnection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGBirthdayContextualRule;
  uint64_t v15 = [(PGBirthdayContextualRule *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_graph, a3);
    objc_storeStrong((id *)&v16->_photoLibrary, a4);
    objc_storeStrong((id *)&v16->_curationManager, a5);
    objc_storeStrong((id *)&v16->_loggingConnection, a6);
  }

  return v16;
}

@end