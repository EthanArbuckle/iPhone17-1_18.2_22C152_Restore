@interface PGLocationsFilterer
- (NSArray)filteredLocationNodes;
- (NSArray)locationNodes;
- (NSArray)sortedMomentNodes;
- (PGIncompleteLocationResolver)incompleteLocationResolver;
- (PGLocationsFilterer)initWithSortedMomentNodes:(id)a3 locationNodes:(id)a4 incompleteLocationResolver:(id)a5;
- (id)_filteredSignificantLocationNodes;
- (unint64_t)filteringType;
- (void)setFilteringType:(unint64_t)a3;
@end

@implementation PGLocationsFilterer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredLocationNodes, 0);
  objc_storeStrong((id *)&self->_incompleteLocationResolver, 0);
  objc_storeStrong((id *)&self->_locationNodes, 0);
  objc_storeStrong((id *)&self->_sortedMomentNodes, 0);
}

- (void)setFilteringType:(unint64_t)a3
{
  self->_filteringType = a3;
}

- (unint64_t)filteringType
{
  return self->_filteringType;
}

- (PGIncompleteLocationResolver)incompleteLocationResolver
{
  return (PGIncompleteLocationResolver *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)locationNodes
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)sortedMomentNodes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (id)_filteredSignificantLocationNodes
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  v86 = self->_locationNodes;
  v78 = self;
  v79 = self->_sortedMomentNodes;
  v3 = [(NSArray *)v79 firstObject];
  v82 = [v3 graph];

  BOOL v81 = (unint64_t)[v82 version] >= 0xCE
     && +[PGUserDefaults useExtendedCurationAssetCountForLocationTitles];
  v91 = v78->_incompleteLocationResolver;
  if (![(NSArray *)v86 count])
  {
    v46 = v86;
    goto LABEL_94;
  }
  v4 = [(NSArray *)v86 firstObject];
  v90 = [v4 label];

  unint64_t v87 = +[PGCommonTitleUtility dimensionForLabel:v90];
  v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v88 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](v86, "count"));
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  obuint64_t j = v79;
  uint64_t v89 = [(NSArray *)obj countByEnumeratingWithState:&v136 objects:v146 count:16];
  if (v89)
  {
    unint64_t v83 = 0;
    uint64_t v85 = *(void *)v137;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v137 != v85)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v92 = v6;
        v8 = *(void **)(*((void *)&v136 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1D25FED50]();
        v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        uint64_t v132 = 0;
        v133 = (double *)&v132;
        uint64_t v134 = 0x2020000000;
        uint64_t v135 = 0;
        uint64_t v128 = 0;
        v129 = &v128;
        uint64_t v130 = 0x2020000000;
        char v131 = 0;
        v120[0] = MEMORY[0x1E4F143A8];
        v120[1] = 3221225472;
        v120[2] = __56__PGLocationsFilterer__filteredSignificantLocationNodes__block_invoke;
        v120[3] = &unk_1E68E8CA8;
        id v121 = v90;
        v122 = v91;
        unint64_t v127 = v87;
        id v10 = v88;
        id v123 = v10;
        v125 = &v128;
        v126 = &v132;
        id v11 = v9;
        id v124 = v11;
        [v8 enumerateAddressEdgesAndNodesUsingBlock:v120];
        if (v133[3] > 0.0)
        {
          if (v81) {
            uint64_t v12 = [v8 numberOfAssetsInExtendedCuration];
          }
          else {
            uint64_t v12 = [v8 numberOfAssets];
          }
          if (!v12) {
            uint64_t v12 = [v8 numberOfAssets];
          }
          unint64_t v84 = v12;
          if (*((unsigned char *)v129 + 24))
          {
            long long v118 = 0u;
            long long v119 = 0u;
            long long v116 = 0u;
            long long v117 = 0u;
            v13 = [v10 allValues];
            uint64_t v14 = [v13 countByEnumeratingWithState:&v116 objects:v145 count:16];
            if (v14)
            {
              uint64_t v94 = *(void *)v117;
              do
              {
                uint64_t v95 = v14;
                for (uint64_t i = 0; i != v95; ++i)
                {
                  if (*(void *)v117 != v94) {
                    objc_enumerationMutation(v13);
                  }
                  v16 = *(void **)(*((void *)&v116 + 1) + 8 * i);
                  if ((unint64_t)[v16 count] >= 2)
                  {
                    long long v114 = 0u;
                    long long v115 = 0u;
                    long long v112 = 0u;
                    long long v113 = 0u;
                    id v17 = v16;
                    uint64_t v18 = [v17 countByEnumeratingWithState:&v112 objects:v144 count:16];
                    if (v18)
                    {
                      uint64_t v19 = *(void *)v113;
                      double v20 = 0.0;
                      double v21 = 0.0;
                      do
                      {
                        for (uint64_t j = 0; j != v18; ++j)
                        {
                          if (*(void *)v113 != v19) {
                            objc_enumerationMutation(v17);
                          }
                          v23 = [v11 objectForKey:*(void *)(*((void *)&v112 + 1) + 8 * j)];
                          [v23 floatValue];
                          float v25 = v24;

                          double v21 = v21 + v25;
                          if (v20 < v25) {
                            double v20 = v25;
                          }
                        }
                        uint64_t v18 = [v17 countByEnumeratingWithState:&v112 objects:v144 count:16];
                      }
                      while (v18);
                    }
                    else
                    {
                      double v20 = 0.0;
                      double v21 = 0.0;
                    }

                    v133[3] = v133[3] - (v21 - v20);
                    v26 = [v17 objectAtIndexedSubscript:0];
                    v27 = [NSNumber numberWithDouble:v20];
                    [v11 setObject:v27 forKey:v26];

                    long long v110 = 0u;
                    long long v111 = 0u;
                    long long v108 = 0u;
                    long long v109 = 0u;
                    id v28 = v17;
                    uint64_t v29 = [v28 countByEnumeratingWithState:&v108 objects:v143 count:16];
                    if (v29)
                    {
                      uint64_t v30 = *(void *)v109;
                      do
                      {
                        for (uint64_t k = 0; k != v29; ++k)
                        {
                          if (*(void *)v109 != v30) {
                            objc_enumerationMutation(v28);
                          }
                          v32 = *(void **)(*((void *)&v108 + 1) + 8 * k);
                          if (([v32 isSameNodeAsNode:v26] & 1) == 0) {
                            [v11 removeObjectForKey:v32];
                          }
                        }
                        uint64_t v29 = [v28 countByEnumeratingWithState:&v108 objects:v143 count:16];
                      }
                      while (v29);
                    }
                  }
                }
                uint64_t v14 = [v13 countByEnumeratingWithState:&v116 objects:v145 count:16];
              }
              while (v14);
            }
          }
          long long v106 = 0u;
          long long v107 = 0u;
          long long v104 = 0u;
          long long v105 = 0u;
          v33 = [v11 keyEnumerator];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v104 objects:v142 count:16];
          if (v34)
          {
            uint64_t v35 = *(void *)v105;
            do
            {
              for (uint64_t m = 0; m != v34; ++m)
              {
                if (*(void *)v105 != v35) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v37 = *(void *)(*((void *)&v104 + 1) + 8 * m);
                v38 = [v11 objectForKey:v37];
                [v38 floatValue];
                float v40 = v39;

                double v41 = v133[3];
                v42 = [v5 objectForKey:v37];
                [v42 floatValue];
                float v44 = v43;

                v45 = [NSNumber numberWithDouble:v40 / v41 * (double)v84 + v44];
                [v5 setObject:v45 forKey:v37];
              }
              uint64_t v34 = [v33 countByEnumeratingWithState:&v104 objects:v142 count:16];
            }
            while (v34);
          }

          v83 += v84;
        }

        _Block_object_dispose(&v128, 8);
        _Block_object_dispose(&v132, 8);

        uint64_t v6 = v92 + 1;
      }
      while (v92 + 1 != v89);
      uint64_t v89 = [(NSArray *)obj countByEnumeratingWithState:&v136 objects:v146 count:16];
    }
    while (v89);
  }
  else
  {
    unint64_t v83 = 0;
  }

  v46 = (NSArray *)[(NSArray *)v86 mutableCopy];
  unint64_t v47 = [v5 count];
  unint64_t v48 = v47;
  if (v47 >= 2)
  {
    if (v47 == 3)
    {
      unint64_t filteringType = v78->_filteringType;
      float v50 = 0.0;
      if (filteringType <= 2)
      {
        v51 = (float *)&unk_1D1F4F65C;
        goto LABEL_67;
      }
    }
    else
    {
      if (v47 != 2)
      {
        long long v102 = 0u;
        long long v103 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        v53 = [v5 keyEnumerator];
        uint64_t v54 = [v53 countByEnumeratingWithState:&v100 objects:v141 count:16];
        float v55 = (float)v48;
        float v56 = (float)v83 / (float)v48;
        if (v54)
        {
          uint64_t v57 = *(void *)v101;
          float v58 = 0.0;
          do
          {
            for (uint64_t n = 0; n != v54; ++n)
            {
              if (*(void *)v101 != v57) {
                objc_enumerationMutation(v53);
              }
              v60 = [v5 objectForKey:*(void *)(*((void *)&v100 + 1) + 8 * n)];
              [v60 floatValue];
              float v62 = v61;

              float v58 = v58 + (float)((float)(v62 - v56) * (float)(v62 - v56));
            }
            uint64_t v54 = [v53 countByEnumeratingWithState:&v100 objects:v141 count:16];
          }
          while (v54);
        }
        else
        {
          float v58 = 0.0;
        }

        float v63 = sqrtf(v58 / v55);
        unint64_t v64 = v78->_filteringType;
        float v65 = 0.0;
        if (v64 <= 2) {
          float v65 = flt_1D1F4F668[v64];
        }
        float v66 = v56 - (float)(v65 * v63);
        float v67 = v56 + v63;
        if (v66 >= 0.0) {
          float v67 = v66;
        }
        float v52 = floorf(v67);
        goto LABEL_83;
      }
      unint64_t filteringType = v78->_filteringType;
      float v50 = 0.0;
      if (filteringType <= 2)
      {
        v51 = (float *)&unk_1D1F4F650;
LABEL_67:
        float v50 = v51[filteringType];
      }
    }
    float v52 = ceilf(v50 * (float)v83);
LABEL_83:
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    v68 = [v5 keyEnumerator];
    uint64_t v69 = [v68 countByEnumeratingWithState:&v96 objects:v140 count:16];
    if (v69)
    {
      uint64_t v70 = *(void *)v97;
      float v71 = (float)(unint64_t)v52;
      do
      {
        for (iuint64_t i = 0; ii != v69; ++ii)
        {
          if (*(void *)v97 != v70) {
            objc_enumerationMutation(v68);
          }
          uint64_t v73 = *(void *)(*((void *)&v96 + 1) + 8 * ii);
          v74 = [v5 objectForKey:v73];
          [v74 floatValue];
          float v76 = v75;

          if (v76 < v71) {
            [(NSArray *)v46 removeObject:v73];
          }
        }
        uint64_t v69 = [v68 countByEnumeratingWithState:&v96 objects:v140 count:16];
      }
      while (v69);
    }
  }
LABEL_94:

  return v46;
}

void __56__PGLocationsFilterer__filteredSignificantLocationNodes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 collection];
  v8 = [v7 nearestDeepParentLocationNodesWithLabel:*(void *)(a1 + 32)];
  v9 = [v8 anyNode];

  if (v9
    || ([*(id *)(a1 + 40) resolvedLocationNodeForIncompleteAddressNode:v6 withTargetDimension:*(void *)(a1 + 80)], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v10 = [v9 name];
    id v11 = v10;
    if (v10 && [v10 length])
    {
      uint64_t v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
      if (([v12 containsObject:v9] & 1) == 0)
      {
        if (!v12)
        {
          uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
          [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v11];
        }
        [v12 addObject:v9];
      }
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (unint64_t)[v12 count] > 1;
      }
      [v5 relevance];
      double v14 = v13;
      *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v13
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                              + 24);
      v15 = [*(id *)(a1 + 56) objectForKey:v9];
      [v15 floatValue];
      double v17 = v16;

      uint64_t v18 = *(void **)(a1 + 56);
      uint64_t v19 = [NSNumber numberWithDouble:v14 + v17];
      [v18 setObject:v19 forKey:v9];
    }
    else
    {
      double v20 = +[PGLogging sharedLogging];
      double v21 = [v20 loggingConnection];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412290;
        v23 = v9;
        _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "Location Node has no name! \"%@\"", (uint8_t *)&v22, 0xCu);
      }
    }
  }
}

- (NSArray)filteredLocationNodes
{
  filteredLocationNodes = self->_filteredLocationNodes;
  if (!filteredLocationNodes)
  {
    v4 = [(PGLocationsFilterer *)self _filteredSignificantLocationNodes];
    id v5 = self->_filteredLocationNodes;
    self->_filteredLocationNodes = v4;

    filteredLocationNodes = self->_filteredLocationNodes;
  }
  return filteredLocationNodes;
}

- (PGLocationsFilterer)initWithSortedMomentNodes:(id)a3 locationNodes:(id)a4 incompleteLocationResolver:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PGLocationsFilterer;
  uint64_t v12 = [(PGLocationsFilterer *)&v15 init];
  double v13 = v12;
  if (v12)
  {
    v12->_unint64_t filteringType = 0;
    objc_storeStrong((id *)&v12->_sortedMomentNodes, a3);
    objc_storeStrong((id *)&v13->_locationNodes, a4);
    objc_storeStrong((id *)&v13->_incompleteLocationResolver, a5);
  }

  return v13;
}

@end