@interface PLRegionsAgglomerativeClustering
- (id)_clusterData:(id)a3;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
@end

@implementation PLRegionsAgglomerativeClustering

- (id)_clusterData:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v68;
    double v7 = 1.0e100;
    double v8 = -1.0e100;
    double v9 = -1.0e100;
    double v10 = 1.0e100;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v68 != v6) {
          objc_enumerationMutation(v3);
        }
        v12 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        [v12 data];
        [v12 data];
        double v13 = *(double *)[v12 data];
        if (v13 < v10) {
          double v10 = *(double *)objc_msgSend(v12, "data", v13);
        }
        double v14 = *(double *)objc_msgSend(v12, "data", v13);
        if (v14 > v9) {
          double v9 = *(double *)objc_msgSend(v12, "data", v14);
        }
        if (*(double *)(objc_msgSend(v12, "data", v14) + 8) < v7) {
          double v7 = *(double *)([v12 data] + 8);
        }
        if (*(double *)([v12 data] + 8) > v8) {
          double v8 = *(double *)([v12 data] + 8);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v67 objects:v75 count:16];
    }
    while (v5);
  }
  v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v16 = v3;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v63 objects:v74 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v64 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = +[PLRegionsAgglomerativeClusteringDataCluster dataClusterWithDataVector:*(void *)(*((void *)&v63 + 1) + 8 * j)];
        [v15 addObject:v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }
    while (v18);
  }

  if ((unint64_t)[v15 count] >= 2)
  {
    id v47 = v16;
    v48 = v15;
    while (1)
    {
      context = (void *)MEMORY[0x19F38D3B0]();
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v22 = v15;
      uint64_t v52 = [v22 countByEnumeratingWithState:&v59 objects:v73 count:16];
      v23 = 0;
      if (v52)
      {
        v54 = 0;
        v24 = 0;
        uint64_t v50 = *(void *)v60;
        id v51 = v22;
        double v25 = 1.0e100;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v60 != v50) {
              objc_enumerationMutation(v22);
            }
            uint64_t v53 = v26;
            v27 = *(void **)(*((void *)&v59 + 1) + 8 * v26);
            long long v55 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v28 = v22;
            uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v72 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v56;
              do
              {
                for (uint64_t k = 0; k != v30; ++k)
                {
                  if (*(void *)v56 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  v33 = *(void **)(*((void *)&v55 + 1) + 8 * k);
                  if (v33 != v27)
                  {
                    [v27 score];
                    double v35 = -v34;
                    [v33 score];
                    double v37 = v35 - v36 + -0.001 + -0.001;
                    v71[0] = v27;
                    v71[1] = v33;
                    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
                    v39 = +[PLRegionsAgglomerativeClusteringDataCluster mergedClusterFrom:v38];

                    [v39 score];
                    double v41 = v37 + v40 + 0.001;
                    if (v41 < v25)
                    {
                      id v42 = v27;

                      id v43 = v33;
                      id v44 = v39;

                      v54 = v43;
                      v24 = v44;
                      v23 = v42;
                      double v25 = v41;
                    }
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v72 count:16];
              }
              while (v30);
            }

            uint64_t v26 = v53 + 1;
            id v22 = v51;
          }
          while (v53 + 1 != v52);
          uint64_t v52 = [v28 countByEnumeratingWithState:&v59 objects:v73 count:16];
        }
        while (v52);
      }
      else
      {
        v54 = 0;
        v24 = 0;
        double v25 = 1.0e100;
      }

      if (v25 > 0.0 || v24 == 0) {
        break;
      }
      [v22 removeObject:v23];
      [v22 removeObject:v54];
      [v22 addObject:v24];

      id v16 = v47;
      v15 = v48;
      if ((unint64_t)[v22 count] <= 1) {
        goto LABEL_52;
      }
    }

    id v16 = v47;
    v15 = v48;
  }
LABEL_52:

  return v15;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  v82 = v4;
  [v4 sortedArrayUsingComparator:&__block_literal_global_11358];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v129 objects:v143 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v130 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        objc_msgSend(v10, "pl_coordinate");
        double latitude = v146.latitude;
        double longitude = v146.longitude;
        if (CLLocationCoordinate2DIsValid(v146))
        {
          BOOL v13 = latitude != 0.0;
          if (longitude != 0.0) {
            BOOL v13 = 1;
          }
          if (v13 && (latitude != 40.0 || longitude != -100.0)) {
            [v5 addObject:v10];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v129 objects:v143 count:16];
    }
    while (v7);
  }
  v91 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id v88 = v5;
  uint64_t v15 = [v88 countByEnumeratingWithState:&v125 objects:v142 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v126;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v126 != v18) {
          objc_enumerationMutation(v88);
        }
        v20 = *(void **)(*((void *)&v125 + 1) + 8 * j);
        objc_msgSend(v20, "pl_coordinate");
        uint64_t v22 = v21;
        objc_msgSend(v20, "pl_coordinate");
        uint64_t v24 = v23;
        double v25 = [[PLRegionsAgglomerativeClusteringDataVector alloc] initWithDataLength:2];
        *(void *)[(PLRegionsAgglomerativeClusteringDataVector *)v25 data] = v24;
        *(void *)([(PLRegionsAgglomerativeClusteringDataVector *)v25 data] + 8) = v22;
        v141[0] = v20;
        v140[0] = @"version";
        v140[1] = @"index";
        uint64_t v26 = [NSNumber numberWithUnsignedInteger:v17 + j];
        v141[1] = v26;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:v140 count:2];
        [(PLRegionsAgglomerativeClusteringDataVector *)v25 setUserInfo:v27];

        [v91 addObject:v25];
        [(PLRegionsAgglomerativeClusteringDataVector *)v25 data];
        [(PLRegionsAgglomerativeClusteringDataVector *)v25 data];
      }
      v17 += j;
      uint64_t v16 = [v88 countByEnumeratingWithState:&v125 objects:v142 count:16];
    }
    while (v16);
  }

  [v88 count];
  [v88 count];
  id v28 = [(PLRegionsAgglomerativeClustering *)self _clusterData:v91];
  uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v30 = v28;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v121 objects:v139 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v122;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v122 != v33) {
          objc_enumerationMutation(v30);
        }
        double v35 = [*(id *)(*((void *)&v121 + 1) + 8 * k) vectors];
        [v29 addObject:v35];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v121 objects:v139 count:16];
    }
    while (v32);
  }
  id v80 = v30;

  v90 = [MEMORY[0x1E4F1CA48] array];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v87 = v29;
  uint64_t v36 = [v87 countByEnumeratingWithState:&v117 objects:v138 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v93 = *(void *)v118;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v118 != v93) {
          objc_enumerationMutation(v87);
        }
        v39 = *(void **)(*((void *)&v117 + 1) + 8 * m);
        double v40 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSet", v80);
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        id v41 = v39;
        uint64_t v42 = [v41 countByEnumeratingWithState:&v113 objects:v137 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v114;
          do
          {
            for (uint64_t n = 0; n != v43; ++n)
            {
              if (*(void *)v114 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = [*(id *)(*((void *)&v113 + 1) + 8 * n) userInfo];
              id v47 = [v46 objectForKeyedSubscript:@"index"];
              objc_msgSend(v40, "addIndex:", objc_msgSend(v47, "unsignedIntegerValue"));
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v113 objects:v137 count:16];
          }
          while (v43);
        }

        v111[0] = MEMORY[0x1E4F143A8];
        v111[1] = 3221225472;
        v111[2] = __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_2;
        v111[3] = &unk_1E5871AD0;
        v111[4] = v41;
        id v112 = v90;
        [v40 enumerateRangesWithOptions:0 usingBlock:v111];
      }
      uint64_t v37 = [v87 countByEnumeratingWithState:&v117 objects:v138 count:16];
    }
    while (v37);
  }

  v48 = [v90 sortedArrayUsingComparator:&__block_literal_global_86];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  uint64_t v49 = [v48 countByEnumeratingWithState:&v107 objects:v136 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    unint64_t v51 = 0;
    uint64_t v52 = *(void *)v108;
    do
    {
      for (iuint64_t i = 0; ii != v50; ++ii)
      {
        if (*(void *)v108 != v52) {
          objc_enumerationMutation(v48);
        }
        v54 = *(void **)(*((void *)&v107 + 1) + 8 * ii);
        if (objc_msgSend(v54, "count", v80) > v51) {
          unint64_t v51 = [v54 count];
        }
      }
      uint64_t v50 = [v48 countByEnumeratingWithState:&v107 objects:v136 count:16];
    }
    while (v50);
  }
  else
  {
    unint64_t v51 = 0;
  }
  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v80);
  id v84 = (id)objc_claimAutoreleasedReturnValue();
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v55 = v48;
  uint64_t v94 = [v55 countByEnumeratingWithState:&v103 objects:v135 count:16];
  if (v94)
  {
    uint64_t v89 = *(void *)v104;
    unint64_t v85 = v51 / 6;
    id v83 = v55;
    do
    {
      for (juint64_t j = 0; jj != v94; ++jj)
      {
        if (*(void *)v104 != v89) {
          objc_enumerationMutation(v55);
        }
        long long v57 = *(void **)(*((void *)&v103 + 1) + 8 * jj);
        if ((unint64_t)[v57 count] > 3 || objc_msgSend(v57, "count") >= v85)
        {
          long long v58 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v57, "count"));
          long long v99 = 0u;
          long long v100 = 0u;
          long long v101 = 0u;
          long long v102 = 0u;
          id v59 = v57;
          uint64_t v60 = [v59 countByEnumeratingWithState:&v99 objects:v134 count:16];
          if (v60)
          {
            uint64_t v61 = v60;
            uint64_t v62 = *(void *)v100;
            do
            {
              for (kuint64_t k = 0; kk != v61; ++kk)
              {
                if (*(void *)v100 != v62) {
                  objc_enumerationMutation(v59);
                }
                long long v64 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5F0]), "initWithLatitude:longitude:", *(double *)objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * kk), "data"), *(double *)(objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * kk), "data") + 8));
                [v58 addObject:v64];
              }
              uint64_t v61 = [v59 countByEnumeratingWithState:&v99 objects:v134 count:16];
            }
            while (v61);
          }

          long long v65 = [v59 valueForKey:@"userInfo"];
          long long v66 = [v65 valueForKey:@"version"];
          long long v67 = +[PLDataCluster clusterWithObjects:v66];

          long long v68 = [v67 meanRegion:50.0];
          if (v68)
          {
            long long v69 = [v67 objects];
            [v84 setObject:v69 forKeyedSubscript:v68];

            [v68 center];
            [v68 center];
            [v68 center];
            [v68 center];
            long long v95 = 0u;
            long long v96 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            id v70 = v59;
            uint64_t v71 = [v70 countByEnumeratingWithState:&v95 objects:v133 count:16];
            if (v71)
            {
              uint64_t v72 = v71;
              uint64_t v73 = *(void *)v96;
              do
              {
                for (muint64_t m = 0; mm != v72; ++mm)
                {
                  if (*(void *)v96 != v73) {
                    objc_enumerationMutation(v70);
                  }
                  v75 = *(void **)(*((void *)&v95 + 1) + 8 * mm);
                  [v75 data];
                  [v68 center];
                  [v75 data];
                  [v68 center];
                  [v75 data];
                  [v68 center];
                  [v75 data];
                  [v68 center];
                }
                uint64_t v72 = [v70 countByEnumeratingWithState:&v95 objects:v133 count:16];
              }
              while (v72);
            }

            id v55 = v83;
          }
        }
      }
      uint64_t v94 = [v55 countByEnumeratingWithState:&v103 objects:v135 count:16];
    }
    while (v94);
  }

  if (![v84 count])
  {
    uint64_t v76 = +[PLDataCluster clusterWithObjects:v82];
    v77 = [v76 meanRegion:100.0];
    v78 = [v76 objects];
    [v84 setObject:v78 forKeyedSubscript:v77];
  }
  return v84;
}

void __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_3;
  v7[3] = &__block_descriptor_48_e69_B24__0__PLRegionsAgglomerativeClusteringDataVector_8__NSDictionary_16l;
  v7[4] = a2;
  v7[5] = a3;
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:v7];
  uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

  [*(id *)(a1 + 40) addObject:v6];
}

uint64_t __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 firstObject];
  uint64_t v6 = [v5 userInfo];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"version"];

  uint64_t v8 = [v4 firstObject];

  double v9 = [v8 userInfo];
  double v10 = [v9 objectForKeyedSubscript:@"version"];

  v11 = objc_msgSend(v7, "pl_date");
  v12 = objc_msgSend(v10, "pl_date");
  uint64_t v13 = [v11 compare:v12];

  return v13;
}

BOOL __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"index"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  unint64_t v6 = *(void *)(a1 + 32);
  return v5 >= v6 && v5 < *(void *)(a1 + 40) + v6;
}

uint64_t __69__PLRegionsAgglomerativeClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = objc_msgSend(a2, "pl_date");
  unint64_t v6 = objc_msgSend(v4, "pl_date");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end