@interface PGMovieDeduper
- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5;
@end

@implementation PGMovieDeduper

- (id)deduplicatedItemsWithItems:(id)a3 debugInfo:(id)a4 progressBlock:(id)a5
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v96 = a4;
  id v9 = a5;
  double v10 = 0.0;
  v115 = (void (**)(void *, unsigned char *, double))_Block_copy(v9);
  if (v115)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v131 = 0;
      v115[2](v115, &v131, 0.0);
      if (v131)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v134 = 30;
          *(_WORD *)&v134[4] = 2080;
          *(void *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGMovieDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        id v12 = (id)MEMORY[0x1E4F1CBF0];
        goto LABEL_116;
      }
      double v10 = Current;
    }
  }
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v127 objects:v137 count:16];
  if (!v14) {
    goto LABEL_16;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v128;
LABEL_10:
  uint64_t v17 = 0;
  while (1)
  {
    if (*(void *)v128 != v16) {
      objc_enumerationMutation(v13);
    }
    if ([*(id *)(*((void *)&v127 + 1) + 8 * v17) isVideo]) {
      break;
    }
    if (v15 == ++v17)
    {
      uint64_t v15 = [v13 countByEnumeratingWithState:&v127 objects:v137 count:16];
      if (!v15)
      {
LABEL_16:

        id v12 = v13;
        goto LABEL_116;
      }
      goto LABEL_10;
    }
  }

  v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v136[0] = v18;
  v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v136[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:2];

  v21 = [v13 sortedArrayUsingDescriptors:v20];
  v101 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v21, "count"));
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23 = [v21 lastObject];
  v24 = [MEMORY[0x1E4F744F0] sharedMediaAnalyzer];
  v110 = [(PGDeduper *)self identifiersOfRequiredItems];
  unint64_t v25 = [v21 count];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v26 = v21;
  uint64_t v93 = [v26 countByEnumeratingWithState:&v123 objects:v135 count:16];
  v28 = 0;
  if (v93)
  {
    double v98 = 1.0 / (double)v25;
    uint64_t v94 = *(void *)v124;
    uint64_t v109 = *MEMORY[0x1E4F74468];
    uint64_t v107 = *MEMORY[0x1E4F74408];
    uint64_t v108 = *MEMORY[0x1E4F744C8];
    uint64_t v103 = *MEMORY[0x1E4F74488];
    uint64_t v104 = *MEMORY[0x1E4F74470];
    double v102 = 0.0;
    *(void *)&long long v27 = 134218242;
    long long v81 = v27;
    double v29 = 0.5;
    do
    {
      uint64_t v30 = 0;
      do
      {
        v97 = v28;
        if (*(void *)v124 != v94) {
          objc_enumerationMutation(v26);
        }
        uint64_t v95 = v30;
        v99 = *(void **)(*((void *)&v123 + 1) + 8 * v30);
        v31 = objc_msgSend(v99, "creationDate", v81);
        v32 = v31;
        if (!v28)
        {
          BOOL v34 = 0;
LABEL_26:
          if (v99 != v23) {
            goto LABEL_95;
          }
          goto LABEL_27;
        }
        objc_msgSend(v31, "timeIntervalSinceDate:");
        BOOL v34 = v33 >= 180.0;
        if (v33 < 180.0) {
          goto LABEL_26;
        }
LABEL_27:
        BOOL v92 = v34;
        char v35 = v99 != v23 || v34;
        if ((v35 & 1) == 0) {
          [v22 addObject:v99];
        }
        if ([v22 count] == 1)
        {
          [v101 addObjectsFromArray:v22];
          goto LABEL_91;
        }
        context = (void *)MEMORY[0x1D25FED50]();
        id v122 = 0;
        v113 = [v24 requestAnalysis:66560 forAssets:v22 withOptions:0 andProgressHandler:0 andError:&v122];
        id v91 = v122;
        if (v115)
        {
          double v36 = CFAbsoluteTimeGetCurrent();
          if (v36 - v10 >= 0.01)
          {
            char v131 = 0;
            v115[2](v115, &v131, v102 + v98 * v29);
            if (v131)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v134 = 84;
                *(_WORD *)&v134[4] = 2080;
                *(void *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Curation/PGMovieDeduper.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              id v39 = v91;
LABEL_111:

              v28 = v97;
              goto LABEL_112;
            }
            double v10 = v36;
          }
        }
        if (!v113 || v91)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v81;
            *(void *)v134 = 66560;
            *(_WORD *)&v134[8] = 2112;
            *(void *)&v134[10] = v91;
            _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error requesting analysis types 0x%llx from MediaAnalyzer. \"%@\"", buf, 0x16u);
          }
          [v101 addObjectsFromArray:v22];
          goto LABEL_90;
        }
        v89 = v32;
        id v105 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        unint64_t v37 = [v22 count];
        long long v118 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v38 = v22;
        uint64_t v111 = [v38 countByEnumeratingWithState:&v118 objects:v132 count:16];
        if (!v111)
        {

          id v39 = 0;
          v32 = v89;
          goto LABEL_89;
        }
        id obj = v38;
        id v83 = v26;
        v84 = v24;
        v85 = v23;
        id v86 = v22;
        v82 = v20;
        id v87 = v9;
        id v88 = v8;
        id v39 = 0;
        uint64_t v112 = 0;
        int v40 = 0;
        int v41 = 0;
        char v42 = 0;
        double v43 = v29 / (double)v37;
        uint64_t v106 = *(void *)v119;
        double v44 = 0.5;
        double v45 = -1.79769313e308;
        while (2)
        {
          for (uint64_t i = 0; i != v111; ++i)
          {
            int v114 = v41;
            int v47 = v40;
            if (*(void *)v119 != v106) {
              objc_enumerationMutation(obj);
            }
            v48 = *(void **)(*((void *)&v118 + 1) + 8 * i);
            v49 = [v113 objectAtIndexedSubscript:v112 + i];
            v50 = [v49 objectForKeyedSubscript:v109];
            v51 = v50;
            if (v50)
            {
              [v50 doubleValue];
              double v53 = v52;
            }
            else
            {
              double v53 = 0.5;
            }
            v116 = v51;
            v117 = v49;
            v54 = [v49 objectForKeyedSubscript:v108];
            v55 = [v54 objectForKeyedSubscript:v107];

            id v56 = v39;
            if (v55)
            {
              v57 = [v55 firstObject];
              v58 = [v57 objectForKeyedSubscript:v104];
              v59 = [v58 objectForKeyedSubscript:v103];
              [v59 doubleValue];
              double v61 = v60;
            }
            else
            {
              double v61 = 1.79769313e308;
            }
            int v40 = [v48 isVideo];
            int v41 = [v48 isFavorite];
            v62 = [v48 clsIdentifier];
            int v63 = [v110 containsObject:v62];

            id v39 = v56;
            if (v56 && v61 < 0.1 && ((v47 | v40) & 1) != 0)
            {
              int v64 = v114 & (v41 ^ 1);
              int v65 = v64 ^ 1;
              if (v64)
              {
                v66 = v117;
                if (v42) {
                  goto LABEL_60;
                }
              }
              else
              {
                v66 = v117;
                if (((v47 ^ 1) & 1) == 0)
                {
                  if (v53 > v45) {
                    int v65 = v40;
                  }
                  else {
                    int v65 = 0;
                  }
                }
                if (v42)
                {
LABEL_60:
                  if (v63)
                  {
                    if (v65)
                    {
                      [v101 addObject:v39];
                      id v67 = v48;
                      v68 = v39;
                      id v39 = v67;

                      char v42 = 1;
                      double v45 = v53;
LABEL_74:
                      v71 = v116;
                      goto LABEL_75;
                    }
                    v74 = v101;
                  }
                  else
                  {
                    v74 = v105;
                  }
                  [v74 addObject:v48];
                  char v42 = 1;
                  goto LABEL_74;
                }
              }
              if ((v63 | v65) == 1)
              {
                [v105 addObject:v39];
                id v72 = v48;
                v73 = v39;
                id v39 = v72;

                double v45 = v53;
                char v42 = v63;
              }
              else
              {
                [v105 addObject:v48];
                char v42 = 0;
              }
              goto LABEL_74;
            }
            if (v56)
            {
              [v101 addObject:v56];
              if ([v105 count])
              {
                [v96 dedupItems:v105 toItem:v56 withDedupingType:3];
                id v39 = v56;
                [v105 removeAllObjects];
              }
            }
            id v69 = v48;
            v70 = v39;
            id v39 = v69;

            double v45 = v53;
            char v42 = v63;
            v71 = v116;
            v66 = v117;
LABEL_75:
            double v44 = v43 + v44;
            if (v115)
            {
              double v75 = CFAbsoluteTimeGetCurrent();
              if (v75 - v10 >= 0.01)
              {
                char v131 = 0;
                v115[2](v115, &v131, v102 + v98 * v44);
                if (v131)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v134 = 171;
                    *(_WORD *)&v134[4] = 2080;
                    *(void *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Curation/PGMovieDeduper.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  id v9 = v87;
                  id v8 = v88;
                  v20 = v82;
                  id v26 = v83;
                  v23 = v85;
                  id v22 = v86;
                  v24 = v84;
                  v32 = v89;
                  goto LABEL_111;
                }
                double v10 = v75;
              }
            }
          }
          v112 += i;
          uint64_t v111 = [obj countByEnumeratingWithState:&v118 objects:v132 count:16];
          if (v111) {
            continue;
          }
          break;
        }

        v32 = v89;
        if (v39)
        {
          [v101 addObject:v39];
          id v9 = v87;
          id v8 = v88;
          v23 = v85;
          id v22 = v86;
          id v26 = v83;
          v24 = v84;
          double v29 = 0.5;
          if ([v105 count])
          {
            [v96 dedupItems:v105 toItem:v39 withDedupingType:3];
            [v105 removeAllObjects];
          }
          v20 = v82;
        }
        else
        {
          id v9 = v87;
          id v8 = v88;
          v20 = v82;
          id v26 = v83;
          v23 = v85;
          id v22 = v86;
          v24 = v84;
          double v29 = 0.5;
        }
LABEL_89:

LABEL_90:
LABEL_91:
        [v22 removeAllObjects];
        char v76 = !v92;
        if (v99 != v23) {
          char v76 = 1;
        }
        if ((v76 & 1) == 0) {
          [v101 addObject:v23];
        }
LABEL_95:
        [v22 addObject:v99];
        [v99 duration];
        v28 = objc_msgSend(v32, "dateByAddingTimeInterval:");

        double v102 = v98 + v102;
        if (v115)
        {
          double v77 = CFAbsoluteTimeGetCurrent();
          if (v77 - v10 >= 0.01)
          {
            char v131 = 0;
            v115[2](v115, &v131, v102);
            if (!v131)
            {
              double v10 = v77;
              goto LABEL_99;
            }
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v134 = 199;
              *(_WORD *)&v134[4] = 2080;
              *(void *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Curation/PGMovieDeduper.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
LABEL_112:

            v79 = v26;
LABEL_113:
            id v12 = (id)MEMORY[0x1E4F1CBF0];
            goto LABEL_115;
          }
        }
LABEL_99:

        uint64_t v30 = v95 + 1;
      }
      while (v95 + 1 != v93);
      uint64_t v78 = [v26 countByEnumeratingWithState:&v123 objects:v135 count:16];
      uint64_t v93 = v78;
    }
    while (v78);
  }

  if (v115)
  {
    if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
    {
      char v131 = 0;
      v115[2](v115, &v131, 1.0);
      if (v131)
      {
        v79 = v26;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v134 = 205;
          *(_WORD *)&v134[4] = 2080;
          *(void *)&v134[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Curation/PGMovieDeduper.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_113;
      }
    }
  }
  v79 = v26;
  id v12 = v101;
LABEL_115:

LABEL_116:
  return v12;
}

@end