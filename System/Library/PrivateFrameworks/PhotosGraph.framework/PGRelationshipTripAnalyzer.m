@interface PGRelationshipTripAnalyzer
- (NSString)name;
- (PGRelationshipTripAnalyzer)initWithRelationshipProcessor:(id)a3;
- (void)runAnalysisWithProgressBlock:(id)a3;
@end

@implementation PGRelationshipTripAnalyzer

- (void).cxx_destruct
{
}

- (void)runAnalysisWithProgressBlock:(id)a3
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void (**)(void *, unsigned char *, double))_Block_copy(v4);
  double v6 = 0.0;
  if (!v5 || (double v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    v9 = [WeakRetained graph];
    v10 = [v9 trips];
    uint64_t v11 = [v9 weekends];
    unint64_t v12 = 0x1E4F1C000uLL;
    v13 = (void *)MEMORY[0x1E4F1CA80];
    v76 = (void *)v11;
    v14 = objc_msgSend(v10, "arrayByAddingObjectsFromArray:");
    v15 = [v13 setWithArray:v14];

    v77 = v15;
    if (![v15 count])
    {
LABEL_75:

      goto LABEL_76;
    }
    id v74 = WeakRetained;
    v75 = v5;
    id v73 = v4;
    v16 = [MEMORY[0x1E4F1CA60] dictionary];
    v92 = [MEMORY[0x1E4F1CA80] set];
    v85 = v9;
    v97 = [v9 meNode];
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    v72 = v10;
    obuint64_t j = v10;
    v91 = v16;
    uint64_t v83 = [obj countByEnumeratingWithState:&v121 objects:v130 count:16];
    if (v83)
    {
      uint64_t v81 = *(void *)v122;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v122 != v81) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v121 + 1) + 8 * v17);
          uint64_t v19 = MEMORY[0x1D25FED50]();
          v95 = [*(id *)(v12 + 2688) set];
          v20 = [*(id *)(v12 + 2688) set];
          long long v117 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          id v21 = v18;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v117 objects:v129 count:16];
          uint64_t v93 = v17;
          context = (void *)v19;
          if (v22)
          {
            uint64_t v23 = v22;
            unint64_t v24 = 0;
            uint64_t v25 = *(void *)v118;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v118 != v25) {
                  objc_enumerationMutation(v21);
                }
                v27 = *(void **)(*((void *)&v117 + 1) + 8 * i);
                v28 = (void *)MEMORY[0x1D25FED50]();
                v29 = [v27 personNodes];
                unint64_t v30 = [v29 count];
                int v31 = [v29 containsObject:v97];
                if (v30 == 1) {
                  int v32 = v31;
                }
                else {
                  int v32 = 1;
                }
                if (v30 == 2) {
                  int v33 = v31;
                }
                else {
                  int v33 = 0;
                }
                if (v32 == 1 && v33 == 0)
                {
                  uint64_t v36 = v30 > 1;
                }
                else
                {
                  v35 = [v29 allObjects];
                  [v95 addObjectsFromArray:v35];

                  [v20 addObject:v27];
                  uint64_t v36 = 1;
                }
                v24 += v36;
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v117 objects:v129 count:16];
            }
            while (v23);
          }
          else
          {
            unint64_t v24 = 0;
          }

          v37 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithSet:v20 graph:v85];
          v86 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithSet:v95 graph:v85];
          v87 = v37;
          v38 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:amongPersonNodes:](PGPeopleInferencesConveniences, "countedPersonNodesFromMomentNodes:amongPersonNodes:", v37);
          long long v113 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v116 = 0u;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v113 objects:v128 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v114;
            do
            {
              for (uint64_t j = 0; j != v40; ++j)
              {
                if (*(void *)v114 != v41) {
                  objc_enumerationMutation(v38);
                }
                v43 = *(void **)(*((void *)&v113 + 1) + 8 * j);
                if (([v43 isMeNode] & 1) == 0
                  && (double)(unint64_t)[v38 countForObject:v43] / (double)v24 >= 0.75)
                {
                  v44 = [v43 localIdentifier];
                  v45 = [v91 objectForKeyedSubscript:v44];
                  v46 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "unsignedIntegerValue") + 1);

                  [v91 setObject:v46 forKeyedSubscript:v44];
                  [v92 addObject:v21];
                }
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v113 objects:v128 count:16];
            }
            while (v40);
          }

          uint64_t v17 = v93 + 1;
          v16 = v91;
          unint64_t v12 = 0x1E4F1C000;
        }
        while (v93 + 1 != v83);
        uint64_t v83 = [obj countByEnumeratingWithState:&v121 objects:v130 count:16];
      }
      while (v83);
    }

    [v77 minusSet:v92];
    uint64_t v47 = [v92 count];
    v5 = v75;
    if (v75)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      id WeakRetained = v74;
      v9 = v85;
      if (Current - v6 >= 0.01)
      {
        char v125 = 0;
        v75[2](v75, &v125, 0.5);
        if (v125)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v132 = 105;
            __int16 v133 = 2080;
            v134 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipTripAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v10 = v72;
          id v4 = v73;
LABEL_74:

          goto LABEL_75;
        }
        double v6 = Current;
      }
    }
    else
    {
      id WeakRetained = v74;
      v9 = v85;
    }
    v110[0] = MEMORY[0x1E4F143A8];
    v110[1] = 3221225472;
    v110[2] = __59__PGRelationshipTripAnalyzer_runAnalysisWithProgressBlock___block_invoke;
    v110[3] = &unk_1E68E7CF8;
    id v82 = WeakRetained;
    id v111 = v82;
    uint64_t v112 = v47;
    [v16 enumerateKeysAndObjectsUsingBlock:v110];
    v96 = [MEMORY[0x1E4F1CA60] dictionary];
    v94 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v71 = [v77 count];
    long long v106 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v78 = v77;
    uint64_t v84 = [v78 countByEnumeratingWithState:&v106 objects:v127 count:16];
    if (v84)
    {
      id obja = *(id *)v107;
      do
      {
        v49 = 0;
        do
        {
          if (*(id *)v107 != obja) {
            objc_enumerationMutation(v78);
          }
          contexta = v49;
          v50 = *(void **)(*((void *)&v106 + 1) + 8 * (void)v49);
          v88 = (void *)MEMORY[0x1D25FED50]();
          unint64_t v51 = [v50 count];
          v52 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v50 graph:v9];
          v53 = [v82 personNodes];
          v54 = +[PGPeopleInferencesConveniences countedPersonNodesFromMomentNodes:v52 amongPersonNodes:v53];

          long long v104 = 0u;
          long long v105 = 0u;
          long long v102 = 0u;
          long long v103 = 0u;
          id v55 = v54;
          uint64_t v56 = [v55 countByEnumeratingWithState:&v102 objects:v126 count:16];
          if (v56)
          {
            uint64_t v57 = v56;
            uint64_t v58 = *(void *)v103;
            double v59 = (double)v51;
            do
            {
              for (uint64_t k = 0; k != v57; ++k)
              {
                if (*(void *)v103 != v58) {
                  objc_enumerationMutation(v55);
                }
                v61 = *(void **)(*((void *)&v102 + 1) + 8 * k);
                unint64_t v62 = [v55 countForObject:v61];
                v63 = [v61 localIdentifier];
                v64 = [v94 objectForKeyedSubscript:v63];
                v65 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v64, "unsignedIntegerValue") + 1);
                [v94 setObject:v65 forKeyedSubscript:v63];

                v66 = [v96 objectForKeyedSubscript:v63];
                v67 = NSNumber;
                [v66 doubleValue];
                v69 = [v67 numberWithDouble:(double)v62 / v59 + v68];
                [v96 setObject:v69 forKeyedSubscript:v63];
              }
              uint64_t v57 = [v55 countByEnumeratingWithState:&v102 objects:v126 count:16];
            }
            while (v57);
          }

          v49 = contexta + 1;
          v9 = v85;
        }
        while (contexta + 1 != (char *)v84);
        uint64_t v84 = [v78 countByEnumeratingWithState:&v106 objects:v127 count:16];
      }
      while (v84);
    }

    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __59__PGRelationshipTripAnalyzer_runAnalysisWithProgressBlock___block_invoke_2;
    v98[3] = &unk_1E68E7D20;
    id v99 = v82;
    id v100 = v94;
    uint64_t v101 = v71;
    id v70 = v94;
    [v96 enumerateKeysAndObjectsUsingBlock:v98];
    id v4 = v73;
    id WeakRetained = v74;
    v5 = v75;
    v10 = v72;
    v16 = v91;
    if (v75)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        char v125 = 0;
        v75[2](v75, &v125, 1.0);
        if (v125)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v132 = 148;
            __int16 v133 = 2080;
            v134 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/People Inferences/Relationship/Relationship Analyzers/PGRelationshipTripAnalyzer.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }

    goto LABEL_74;
  }
  char v125 = 0;
  v5[2](v5, &v125, 0.0);
  if (!v125)
  {
    double v6 = v7;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v132 = 34;
    __int16 v133 = 2080;
    v134 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peopl"
           "e Inferences/Relationship/Relationship Analyzers/PGRelationshipTripAnalyzer.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_76:
}

void __59__PGRelationshipTripAnalyzer_runAnalysisWithProgressBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  v5 = [*(id *)(a1 + 32) relationshipAnalyzerPropertiesForPersonLocalIdentifier:a2];
  if (v5) {
    objc_msgSend(v5, "registerOneOnOneTripAppearance:amongOneOnOneTrips:", objc_msgSend(v6, "unsignedIntegerValue"), *(void *)(a1 + 40));
  }
}

void __59__PGRelationshipTripAnalyzer_runAnalysisWithProgressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) relationshipAnalyzerPropertiesForPersonLocalIdentifier:v9];
  if (v6)
  {
    double v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
    uint64_t v8 = [v7 unsignedIntegerValue];
    [v5 doubleValue];
    objc_msgSend(v6, "registerNumberOfTrips:withTripsScore:amongTrips:", v8, *(void *)(a1 + 48));
  }
}

- (PGRelationshipTripAnalyzer)initWithRelationshipProcessor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PGRelationshipTripAnalyzer;
  id v5 = [(PGRelationshipTripAnalyzer *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_processor, v4);
  }

  return v6;
}

- (NSString)name
{
  return (NSString *)@"PGRelationshipTripAnalyzer";
}

@end