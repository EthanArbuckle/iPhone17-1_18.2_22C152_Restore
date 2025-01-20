@interface PGLocationsResolver
- (BOOL)shouldCreateLocationToAddressMapTable;
- (NSArray)resolvedLocationNodes;
- (NSArray)resolvedMomentNodes;
- (NSArray)sortedMoments;
- (NSMapTable)resolvedLocationNodesToAddressNodesMapTable;
- (NSSet)ignoredAddressNodes;
- (NSSet)ignoredLocationNodes;
- (PGIncompleteLocationResolver)incompleteLocationResolver;
- (PGLocationsResolver)initWithMomentNodes:(id)a3 incompleteLocationResolver:(id)a4 locationHelper:(id)a5;
- (PGLocationsResolver)initWithSortedMomentNodes:(id)a3 incompleteLocationResolver:(id)a4 locationHelper:(id)a5;
- (float)maximumMissingLocationsThreshold;
- (void)_resolve;
- (void)setCreateLocationToAddressMapTable:(BOOL)a3;
- (void)setIgnoredAddressNodes:(id)a3;
- (void)setIgnoredLocationNodes:(id)a3;
- (void)setIncompleteLocationResolver:(id)a3;
- (void)setMaximumMissingLocationsThreshold:(float)a3;
- (void)setResolvedLocationNodes:(id)a3;
- (void)setResolvedMomentNodes:(id)a3;
- (void)setShouldCreateLocationToAddressMapTable:(BOOL)a3;
- (void)setSortedMoments:(id)a3;
@end

@implementation PGLocationsResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedLocationNodesToAddressNodesMapTable, 0);
  objc_storeStrong((id *)&self->_resolvedLocationNodes, 0);
  objc_storeStrong((id *)&self->_resolvedMomentNodes, 0);
  objc_storeStrong((id *)&self->_ignoredAddressNodes, 0);
  objc_storeStrong((id *)&self->_ignoredLocationNodes, 0);
  objc_storeStrong((id *)&self->_sortedMoments, 0);
  objc_storeStrong((id *)&self->_incompleteLocationResolver, 0);
  objc_storeStrong((id *)&self->_locationHelper, 0);
}

- (void)setShouldCreateLocationToAddressMapTable:(BOOL)a3
{
  self->_shouldCreateLocationToAddressMapTable = a3;
}

- (BOOL)shouldCreateLocationToAddressMapTable
{
  return self->_shouldCreateLocationToAddressMapTable;
}

- (void)setResolvedLocationNodes:(id)a3
{
}

- (void)setResolvedMomentNodes:(id)a3
{
}

- (void)setIgnoredAddressNodes:(id)a3
{
}

- (NSSet)ignoredAddressNodes
{
  return self->_ignoredAddressNodes;
}

- (void)setIgnoredLocationNodes:(id)a3
{
}

- (NSSet)ignoredLocationNodes
{
  return self->_ignoredLocationNodes;
}

- (void)setSortedMoments:(id)a3
{
}

- (NSArray)sortedMoments
{
  return self->_sortedMoments;
}

- (void)setIncompleteLocationResolver:(id)a3
{
}

- (PGIncompleteLocationResolver)incompleteLocationResolver
{
  return self->_incompleteLocationResolver;
}

- (float)maximumMissingLocationsThreshold
{
  return self->_maximumMissingLocationsThreshold;
}

- (void)_resolve
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  v81 = [MEMORY[0x1E4F1CA48] array];
  v82 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  v78 = [MEMORY[0x1E4F1CA48] array];
  if (self->_shouldCreateLocationToAddressMapTable)
  {
    v80 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  }
  else
  {
    v80 = 0;
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  obuint64_t j = self->_sortedMoments;
  uint64_t v75 = [(NSArray *)obj countByEnumeratingWithState:&v99 objects:v106 count:16];
  if (v75)
  {
    uint64_t v74 = *(void *)v100;
    double v73 = 0.0;
    double v72 = 0.0;
    double v3 = 0.0;
    while (1)
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v100 != v74) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        v6 = (void *)MEMORY[0x1D25FED50]();
        double v7 = (double)(unint64_t)[v5 numberOfAssets];
        v8 = [v5 addressEdges];
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v95 objects:v105 count:16];
        if (!v10)
        {

          [(NSArray *)v78 addObject:v5];
          goto LABEL_66;
        }
        uint64_t v11 = v10;
        v79 = v5;
        v76 = v6;
        uint64_t v77 = i;
        char v85 = 0;
        id v87 = *(id *)v96;
        double v12 = 0.0;
        double v13 = 0.0;
        double v14 = 0.0;
        id v83 = v9;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(id *)v96 != v87) {
              objc_enumerationMutation(v83);
            }
            v16 = *(void **)(*((void *)&v95 + 1) + 8 * j);
            v17 = (void *)MEMORY[0x1D25FED50]();
            v18 = [v16 targetNode];
            if (![(NSSet *)self->_ignoredAddressNodes count]
              || ![(NSSet *)self->_ignoredAddressNodes containsObject:v18])
            {
              v19 = [(PGGraphLocationHelper *)self->_locationHelper closestLocationNodeFromLocationNode:v18 withDimension:6 reverse:0];
              if (v19) {
                goto LABEL_20;
              }
              v20 = +[PGLogging sharedLogging];
              v21 = [v20 loggingConnection];

              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v18;
                _os_log_impl(&dword_1D1805000, v21, OS_LOG_TYPE_INFO, "Cannot find city node from address node: %@. Will look for inEdges", buf, 0xCu);
              }

              v19 = [(PGGraphLocationHelper *)self->_locationHelper closestLocationNodeFromLocationNode:v18 withDimension:6 reverse:1];
              if (v19)
              {
LABEL_20:
                v22 = [v19 label];
                unint64_t v23 = +[PGCommonTitleUtility dimensionForLabel:v22];

                if (v23 <= 6)
                {
                  [v18 isOcean];
                  BOOL v28 = 0;
                  goto LABEL_30;
                }
                *(void *)buf = 0;
                v24 = [(PGIncompleteLocationResolver *)self->_incompleteLocationResolver resolvedLocationNodeForIncompleteAddressNode:v18 withPreferredTargetDimension:6 resolvedDimension:buf];
                v25 = v24;
                if (v24) {
                  BOOL v26 = *(void *)buf >= v23;
                }
                else {
                  BOOL v26 = 1;
                }
                if (!v26)
                {
                  id v27 = v24;

                  unint64_t v23 = *(void *)buf;
                  v19 = v27;
                }

                BOOL v28 = v23 > 6;
                if (![v18 isOcean] || v23 <= 6)
                {
LABEL_30:
                  if (![(NSSet *)self->_ignoredLocationNodes count]
                    || ![(NSSet *)self->_ignoredLocationNodes containsObject:v19])
                  {
                    [v16 relevance];
                    double v30 = v29;
                    [v16 relevance];
                    double v32 = v31 * v7;
                    if (v28) {
                      double v33 = v32;
                    }
                    else {
                      double v33 = -0.0;
                    }
                    if (v23 <= 8) {
                      double v34 = -0.0;
                    }
                    else {
                      double v34 = v32;
                    }
                    if (v23 <= 8) {
                      double v35 = v33;
                    }
                    else {
                      double v35 = -0.0;
                    }
                    if (![(NSArray *)v81 containsObject:v19]) {
                      [(NSArray *)v81 addObject:v19];
                    }
                    v36 = [v82 objectForKey:v19];
                    v37 = [v16 universalStartDate];
                    v38 = v37;
                    if (!v36 || v37 && [v37 compare:v36] == -1) {
                      [v82 setObject:v38 forKey:v19];
                    }
                    if ((v85 & 1) == 0) {
                      [(NSArray *)v78 addObject:v79];
                    }
                    if (self->_shouldCreateLocationToAddressMapTable)
                    {
                      v39 = [(NSMapTable *)v80 objectForKey:v19];
                      if (!v39)
                      {
                        v39 = [MEMORY[0x1E4F1CA80] set];
                        [(NSMapTable *)v80 setObject:v39 forKey:v19];
                      }
                      [v39 addObject:v18];
                    }
                    double v14 = v14 + v30;
                    double v12 = v12 + v34;
                    double v13 = v13 + v35;

                    goto LABEL_57;
                  }
                }
              }
              else
              {
                if ((v85 & 1) == 0) {
                  [(NSArray *)v78 addObject:v79];
                }
                v19 = 0;
LABEL_57:
                char v85 = 1;
              }
            }
          }
          id v9 = v83;
          uint64_t v11 = [v83 countByEnumeratingWithState:&v95 objects:v105 count:16];
        }
        while (v11);

        if (v13 > 0.0) {
          double v72 = v72 + v13 / v14;
        }
        v6 = v76;
        uint64_t i = v77;
        if (v12 > 0.0) {
          double v73 = v73 + v12 / v14;
        }
LABEL_66:
        double v3 = v3 + v7;
      }
      uint64_t v75 = [(NSArray *)obj countByEnumeratingWithState:&v99 objects:v106 count:16];
      if (!v75) {
        goto LABEL_70;
      }
    }
  }
  double v72 = 0.0;
  double v73 = 0.0;
  double v3 = 0.0;
LABEL_70:

  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __31__PGLocationsResolver__resolve__block_invoke;
  v93[3] = &unk_1E68EB110;
  id v40 = v82;
  id v94 = v40;
  [(NSArray *)v81 sortUsingComparator:v93];
  if (v72 > 0.0 || v73 > 0.0)
  {
    id v84 = v40;
    double v42 = v3 - v72 - v73;
    float v43 = v42;
    float v44 = v3;
    float v45 = v43 / v44;
    float v46 = 1.0 - self->_maximumMissingLocationsThreshold;
    if (v45 >= v46)
    {
      unint64_t v48 = 6;
    }
    else
    {
      float v47 = v72 + v42;
      if ((float)(v47 / v44) >= v46) {
        unint64_t v48 = 8;
      }
      else {
        unint64_t v48 = 9;
      }
    }
    uint64_t v49 = [(NSArray *)v81 count];
    v50 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v49];
    v51 = [MEMORY[0x1E4F1CA80] setWithCapacity:v49];
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    v88 = v81;
    uint64_t v52 = [(NSArray *)v88 countByEnumeratingWithState:&v89 objects:v103 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v90;
      v86 = v50;
      do
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v90 != v54) {
            objc_enumerationMutation(v88);
          }
          v56 = *(void **)(*((void *)&v89 + 1) + 8 * k);
          v57 = [v56 label];
          unint64_t v58 = +[PGCommonTitleUtility dimensionForLabel:v57];

          if (v58 == v48)
          {
            if (([v51 containsObject:v56] & 1) == 0)
            {
              [v51 addObject:v56];
              [(NSArray *)v50 addObject:v56];
            }
          }
          else if (v58 >= v48)
          {
            if (self->_shouldCreateLocationToAddressMapTable) {
              [(NSMapTable *)v80 removeObjectForKey:v56];
            }
          }
          else
          {
            v59 = [(PGGraphLocationHelper *)self->_locationHelper closestLocationNodeFromLocationNode:v56 withDimension:v48 reverse:0];
            v60 = v59;
            if (v59)
            {
              v61 = [v59 label];
              unint64_t v62 = +[PGCommonTitleUtility dimensionForLabel:v61];

              v50 = v86;
              if (v62 == v48 && ([v51 containsObject:v60] & 1) == 0)
              {
                [v51 addObject:v60];
                [(NSArray *)v86 addObject:v60];
              }
              if (self->_shouldCreateLocationToAddressMapTable)
              {
                v63 = [(NSMapTable *)v80 objectForKey:v56];
                [(NSMapTable *)v80 removeObjectForKey:v56];
                v64 = [(NSMapTable *)v80 objectForKey:v60];
                if (!v64)
                {
                  v64 = [MEMORY[0x1E4F1CA80] set];
                  [(NSMapTable *)v80 setObject:v64 forKey:v60];
                }
                [v64 unionSet:v63];

                v50 = v86;
              }
            }
          }
        }
        uint64_t v53 = [(NSArray *)v88 countByEnumeratingWithState:&v89 objects:v103 count:16];
      }
      while (v53);
    }

    v41 = v50;
    id v40 = v84;
  }
  else
  {
    v41 = v81;
  }
  resolvedMomentNodes = self->_resolvedMomentNodes;
  self->_resolvedMomentNodes = v78;
  v66 = v78;

  resolvedLocationNodes = self->_resolvedLocationNodes;
  self->_resolvedLocationNodes = v41;
  v68 = v41;

  resolvedLocationNodesToAddressNodesMapTable = self->_resolvedLocationNodesToAddressNodesMapTable;
  self->_resolvedLocationNodesToAddressNodesMapTable = v80;
  v70 = v80;
}

uint64_t __31__PGLocationsResolver__resolve__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  double v7 = [v5 objectForKey:a2];
  v8 = [*(id *)(a1 + 32) objectForKey:v6];

  if (v7)
  {
    if (v8) {
      uint64_t v9 = [v7 compare:v8];
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)setMaximumMissingLocationsThreshold:(float)a3
{
  if (self->_maximumMissingLocationsThreshold != a3)
  {
    float v3 = 0.0;
    if (a3 >= 0.0) {
      float v3 = a3;
    }
    if (a3 <= 1.0) {
      float v4 = v3;
    }
    else {
      float v4 = 1.0;
    }
    self->_maximumMissingLocationsThreshold = v4;
  }
}

- (void)setCreateLocationToAddressMapTable:(BOOL)a3
{
  if (self->_shouldCreateLocationToAddressMapTable != a3)
  {
    self->_shouldCreateLocationToAddressMapTable = a3;
    resolvedLocationNodes = self->_resolvedLocationNodes;
    self->_resolvedLocationNodes = 0;

    resolvedMomentNodes = self->_resolvedMomentNodes;
    self->_resolvedMomentNodes = 0;

    resolvedLocationNodesToAddressNodesMapTable = self->_resolvedLocationNodesToAddressNodesMapTable;
    self->_resolvedLocationNodesToAddressNodesMapTable = 0;
  }
}

- (NSMapTable)resolvedLocationNodesToAddressNodesMapTable
{
  if (self->_shouldCreateLocationToAddressMapTable)
  {
    resolvedLocationNodesToAddressNodesMapTable = self->_resolvedLocationNodesToAddressNodesMapTable;
    if (!resolvedLocationNodesToAddressNodesMapTable)
    {
      [(PGLocationsResolver *)self _resolve];
      resolvedLocationNodesToAddressNodesMapTable = self->_resolvedLocationNodesToAddressNodesMapTable;
    }
    float v4 = resolvedLocationNodesToAddressNodesMapTable;
  }
  else
  {
    float v4 = 0;
  }
  return v4;
}

- (NSArray)resolvedLocationNodes
{
  resolvedLocationNodes = self->_resolvedLocationNodes;
  if (!resolvedLocationNodes)
  {
    [(PGLocationsResolver *)self _resolve];
    resolvedLocationNodes = self->_resolvedLocationNodes;
  }
  return resolvedLocationNodes;
}

- (NSArray)resolvedMomentNodes
{
  resolvedMomentNodes = self->_resolvedMomentNodes;
  if (!resolvedMomentNodes)
  {
    [(PGLocationsResolver *)self _resolve];
    resolvedMomentNodes = self->_resolvedMomentNodes;
  }
  return resolvedMomentNodes;
}

- (PGLocationsResolver)initWithSortedMomentNodes:(id)a3 incompleteLocationResolver:(id)a4 locationHelper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PGLocationsResolver;
  double v12 = [(PGLocationsResolver *)&v20 init];
  double v13 = v12;
  if (v12)
  {
    v12->_maximumMissingLocationsThreshold = 0.25;
    objc_storeStrong((id *)&v12->_sortedMoments, a3);
    objc_storeStrong((id *)&v13->_locationHelper, a5);
    if (v10)
    {
      double v14 = (PGIncompleteLocationResolver *)v10;
      incompleteLocationResolver = v13->_incompleteLocationResolver;
      v13->_incompleteLocationResolver = v14;
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
      incompleteLocationResolver = +[PGCommonTitleUtility addressNodesFromMomentNodes:v16];

      v17 = [[PGIncompleteLocationResolver alloc] initWithAddressNodes:incompleteLocationResolver locationHelper:v11];
      v18 = v13->_incompleteLocationResolver;
      v13->_incompleteLocationResolver = v17;
    }
  }

  return v13;
}

- (PGLocationsResolver)initWithMomentNodes:(id)a3 incompleteLocationResolver:(id)a4 locationHelper:(id)a5
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v8 = (void *)MEMORY[0x1E4F29008];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  double v12 = [v8 sortDescriptorWithKey:@"universalStartDate" ascending:1];
  double v13 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"universalEndDate", 1, v12);
  v19[1] = v13;
  double v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"UUID" ascending:1];
  v19[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];

  v16 = [v11 sortedArrayUsingDescriptors:v15];

  v17 = [(PGLocationsResolver *)self initWithSortedMomentNodes:v16 incompleteLocationResolver:v10 locationHelper:v9];
  return v17;
}

@end