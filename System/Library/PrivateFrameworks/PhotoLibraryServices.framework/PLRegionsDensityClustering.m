@interface PLRegionsDensityClustering
- (BOOL)includeDefiniteClusters;
- (BOOL)includeExtensiveClusters;
- (BOOL)removeDefiniteClustersObjectsFromDataset;
- (BOOL)removeExtensiveClustersContainingDefiniteClusters;
- (BOOL)removeExtensiveClustersObjectsFromDataset;
- (PLRegionsDensityClustering)init;
- (double)definiteClusterMaximumDistanceUnit;
- (double)definiteClusterMinimumNumberOfObjectsPercent;
- (double)definiteClusterTimeIntervalDistance;
- (double)extensiveClusterMaximumDistanceUnit;
- (double)extensiveClusterMinimumNumberOfObjectsPercent;
- (double)extensiveClusterTimeIntervalDistance;
- (id)_locationBasedClusteringBlock;
- (id)_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:(double)a3;
- (id)performWithDataset:(id)a3 progressBlock:(id)a4;
- (unint64_t)algorithm;
- (unint64_t)definiteClusterMinimumNumberOfObjects;
- (unint64_t)extensiveClusterMinimumNumberOfObjects;
- (void)setAlgorithm:(unint64_t)a3;
- (void)setDefiniteClusterMaximumDistanceUnit:(double)a3;
- (void)setDefiniteClusterMinimumNumberOfObjects:(unint64_t)a3;
- (void)setDefiniteClusterMinimumNumberOfObjectsPercent:(double)a3;
- (void)setDefiniteClusterTimeIntervalDistance:(double)a3;
- (void)setExtensiveClusterMaximumDistanceUnit:(double)a3;
- (void)setExtensiveClusterMinimumNumberOfObjects:(unint64_t)a3;
- (void)setExtensiveClusterMinimumNumberOfObjectsPercent:(double)a3;
- (void)setExtensiveClusterTimeIntervalDistance:(double)a3;
- (void)setIncludeDefiniteClusters:(BOOL)a3;
- (void)setIncludeExtensiveClusters:(BOOL)a3;
- (void)setRemoveDefiniteClustersObjectsFromDataset:(BOOL)a3;
- (void)setRemoveExtensiveClustersContainingDefiniteClusters:(BOOL)a3;
- (void)setRemoveExtensiveClustersObjectsFromDataset:(BOOL)a3;
@end

@implementation PLRegionsDensityClustering

- (void)setRemoveExtensiveClustersContainingDefiniteClusters:(BOOL)a3
{
  self->_removeExtensiveClustersContainingDefiniteClusters = a3;
}

- (BOOL)removeExtensiveClustersContainingDefiniteClusters
{
  return self->_removeExtensiveClustersContainingDefiniteClusters;
}

- (void)setRemoveExtensiveClustersObjectsFromDataset:(BOOL)a3
{
  self->_removeExtensiveClustersObjectsFromDataset = a3;
}

- (BOOL)removeExtensiveClustersObjectsFromDataset
{
  return self->_removeExtensiveClustersObjectsFromDataset;
}

- (void)setExtensiveClusterMinimumNumberOfObjects:(unint64_t)a3
{
  self->_extensiveClusterMinimumNumberOfObjects = a3;
}

- (unint64_t)extensiveClusterMinimumNumberOfObjects
{
  return self->_extensiveClusterMinimumNumberOfObjects;
}

- (void)setExtensiveClusterMinimumNumberOfObjectsPercent:(double)a3
{
  self->_extensiveClusterMinimumNumberOfObjectsPercent = a3;
}

- (double)extensiveClusterMinimumNumberOfObjectsPercent
{
  return self->_extensiveClusterMinimumNumberOfObjectsPercent;
}

- (void)setExtensiveClusterMaximumDistanceUnit:(double)a3
{
  self->_extensiveClusterMaximumDistanceUnit = a3;
}

- (double)extensiveClusterMaximumDistanceUnit
{
  return self->_extensiveClusterMaximumDistanceUnit;
}

- (void)setExtensiveClusterTimeIntervalDistance:(double)a3
{
  self->_extensiveClusterTimeIntervalDistance = a3;
}

- (double)extensiveClusterTimeIntervalDistance
{
  return self->_extensiveClusterTimeIntervalDistance;
}

- (void)setIncludeExtensiveClusters:(BOOL)a3
{
  self->_includeExtensiveClusters = a3;
}

- (BOOL)includeExtensiveClusters
{
  return self->_includeExtensiveClusters;
}

- (void)setRemoveDefiniteClustersObjectsFromDataset:(BOOL)a3
{
  self->_removeDefiniteClustersObjectsFromDataset = a3;
}

- (BOOL)removeDefiniteClustersObjectsFromDataset
{
  return self->_removeDefiniteClustersObjectsFromDataset;
}

- (void)setDefiniteClusterMinimumNumberOfObjects:(unint64_t)a3
{
  self->_definiteClusterMinimumNumberOfObjects = a3;
}

- (unint64_t)definiteClusterMinimumNumberOfObjects
{
  return self->_definiteClusterMinimumNumberOfObjects;
}

- (void)setDefiniteClusterMinimumNumberOfObjectsPercent:(double)a3
{
  self->_definiteClusterMinimumNumberOfObjectsPercent = a3;
}

- (double)definiteClusterMinimumNumberOfObjectsPercent
{
  return self->_definiteClusterMinimumNumberOfObjectsPercent;
}

- (void)setDefiniteClusterMaximumDistanceUnit:(double)a3
{
  self->_definiteClusterMaximumDistanceUnit = a3;
}

- (double)definiteClusterMaximumDistanceUnit
{
  return self->_definiteClusterMaximumDistanceUnit;
}

- (void)setDefiniteClusterTimeIntervalDistance:(double)a3
{
  self->_definiteClusterTimeIntervalDistance = a3;
}

- (double)definiteClusterTimeIntervalDistance
{
  return self->_definiteClusterTimeIntervalDistance;
}

- (void)setIncludeDefiniteClusters:(BOOL)a3
{
  self->_includeDefiniteClusters = a3;
}

- (BOOL)includeDefiniteClusters
{
  return self->_includeDefiniteClusters;
}

- (void)setAlgorithm:(unint64_t)a3
{
  self->_algorithm = a3;
}

- (unint64_t)algorithm
{
  return self->_algorithm;
}

- (id)performWithDataset:(id)a3 progressBlock:(id)a4
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v124 objects:v134 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v125 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v124 + 1) + 8 * i);
        objc_msgSend(v12, "pl_coordinate");
        double latitude = v137.latitude;
        double longitude = v137.longitude;
        if (CLLocationCoordinate2DIsValid(v137))
        {
          BOOL v15 = latitude != 0.0;
          if (longitude != 0.0) {
            BOOL v15 = 1;
          }
          if (v15 && (latitude != 40.0 || longitude != -100.0)) {
            [v6 addObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v124 objects:v134 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    v87 = [v6 sortedArrayUsingComparator:&__block_literal_global_3_96335];
    v94 = (void *)[v87 mutableCopy];
    v88 = v6;
    if (self->_includeDefiniteClusters)
    {
      if (self->_definiteClusterTimeIntervalDistance == 0.0) {
        [(PLRegionsDensityClustering *)self _locationBasedClusteringBlock];
      }
      else {
      v17 = -[PLRegionsDensityClustering _timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:](self, "_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:");
      }
      if (self->_algorithm) {
        v18 = off_1E585F320;
      }
      else {
        v18 = off_1E585E5E0;
      }
      v19 = (void *)[objc_alloc(*v18) initWithDistanceBlock:v17];
      [v19 setMaximumDistance:self->_definiteClusterMaximumDistanceUnit];
      unint64_t v20 = vcvtmd_u64_f64(self->_definiteClusterMinimumNumberOfObjectsPercent * (double)(unint64_t)[v94 count]);
      if (self->_definiteClusterMinimumNumberOfObjects <= v20) {
        unint64_t definiteClusterMinimumNumberOfObjects = v20;
      }
      else {
        unint64_t definiteClusterMinimumNumberOfObjects = self->_definiteClusterMinimumNumberOfObjects;
      }
      [v19 setMinimumNumberOfObjects:definiteClusterMinimumNumberOfObjects];
      v86 = v19;
      v90 = [v19 performWithDataset:v94 progressBlock:0];
      if (self->_removeDefiniteClustersObjectsFromDataset)
      {
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v22 = v90;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v120 objects:v133 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v121;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v121 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = [*(id *)(*((void *)&v120 + 1) + 8 * j) objects];
              [v94 removeObjectsInArray:v27];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v120 objects:v133 count:16];
          }
          while (v24);
        }
      }
    }
    else
    {
      v86 = 0;
      v90 = 0;
    }
    if (self->_includeExtensiveClusters && [v94 count])
    {
      if (self->_extensiveClusterTimeIntervalDistance == 0.0) {
        [(PLRegionsDensityClustering *)self _locationBasedClusteringBlock];
      }
      else {
      v28 = -[PLRegionsDensityClustering _timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:](self, "_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:");
      }
      if (self->_algorithm) {
        v29 = off_1E585F320;
      }
      else {
        v29 = off_1E585E5E0;
      }
      v30 = (void *)[objc_alloc(*v29) initWithDistanceBlock:v28];
      [v30 setMaximumDistance:self->_extensiveClusterMaximumDistanceUnit];
      unint64_t v31 = vcvtmd_u64_f64(self->_extensiveClusterMinimumNumberOfObjectsPercent* (double)(unint64_t)[v94 count]);
      if (self->_extensiveClusterMinimumNumberOfObjects <= v31) {
        unint64_t extensiveClusterMinimumNumberOfObjects = v31;
      }
      else {
        unint64_t extensiveClusterMinimumNumberOfObjects = self->_extensiveClusterMinimumNumberOfObjects;
      }
      [v30 setMinimumNumberOfObjects:extensiveClusterMinimumNumberOfObjects];
      v85 = v30;
      v89 = [v30 performWithDataset:v94 progressBlock:0];
      if (self->_removeExtensiveClustersObjectsFromDataset)
      {
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        id v33 = v89;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v116 objects:v132 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v117;
          do
          {
            for (uint64_t k = 0; k != v35; ++k)
            {
              if (*(void *)v117 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = [*(id *)(*((void *)&v116 + 1) + 8 * k) objects];
              [v94 removeObjectsInArray:v38];
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v116 objects:v132 count:16];
          }
          while (v35);
        }
      }
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v85);
    }
    else
    {
      v89 = 0;
      objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", 0);
    }
    id v95 = (id)objc_claimAutoreleasedReturnValue();
    v93 = objc_opt_new();
    if (self->_includeDefiniteClusters)
    {
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v39 = v90;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v112 objects:v131 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v113;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v113 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = *(void **)(*((void *)&v112 + 1) + 8 * m);
            v45 = [v44 objects];
            uint64_t v46 = [v45 count];

            if (v46)
            {
              v47 = [v44 meanRegion:10.0];
              v48 = [v44 objects];
              [v95 setObject:v48 forKeyedSubscript:v47];

              if (self->_removeExtensiveClustersContainingDefiniteClusters) {
                [v93 addObject:v47];
              }
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v112 objects:v131 count:16];
        }
        while (v41);
      }
    }
    if (self->_includeExtensiveClusters)
    {
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      obuint64_t j = v89;
      uint64_t v49 = [obj countByEnumeratingWithState:&v108 objects:v130 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v109;
        do
        {
          uint64_t v52 = 0;
          uint64_t v91 = v50;
          do
          {
            if (*(void *)v109 != v51) {
              objc_enumerationMutation(obj);
            }
            v53 = *(void **)(*((void *)&v108 + 1) + 8 * v52);
            v54 = [v53 objects];
            uint64_t v55 = [v54 count];

            if (v55)
            {
              v56 = [v53 meanRegion:100.0];
              uint64_t v106 = 0;
              uint64_t v107 = 0;
              [v56 center];
              uint64_t v106 = v57;
              uint64_t v107 = v58;
              if (self->_removeExtensiveClustersContainingDefiniteClusters)
              {
                long long v104 = 0u;
                long long v105 = 0u;
                long long v102 = 0u;
                long long v103 = 0u;
                id v59 = v93;
                uint64_t v60 = [v59 countByEnumeratingWithState:&v102 objects:v129 count:16];
                if (v60)
                {
                  uint64_t v61 = v60;
                  uint64_t v62 = *(void *)v103;
                  while (2)
                  {
                    uint64_t v63 = v51;
                    for (uint64_t n = 0; n != v61; ++n)
                    {
                      if (*(void *)v103 != v62) {
                        objc_enumerationMutation(v59);
                      }
                      [*(id *)(*((void *)&v102 + 1) + 8 * n) center];
                      uint64_t v100 = v65;
                      uint64_t v101 = v66;
                      if ((objc_msgSend(v56, "containsCoordinate:") & 1) == 0)
                      {
                        CLLocationCoordinate2DGetDistanceFrom();
                        if (v67 > (self->_definiteClusterMaximumDistanceUnit
                                  + self->_extensiveClusterMaximumDistanceUnit)
                                 * 0.5)
                          continue;
                      }
                      uint64_t v51 = v63;
                      uint64_t v50 = v91;
                      goto LABEL_95;
                    }
                    uint64_t v61 = [v59 countByEnumeratingWithState:&v102 objects:v129 count:16];
                    uint64_t v51 = v63;
                    uint64_t v50 = v91;
                    if (v61) {
                      continue;
                    }
                    break;
                  }
                }
              }
              id v59 = [v53 objects];
              [v95 setObject:v59 forKeyedSubscript:v56];
LABEL_95:
            }
            ++v52;
          }
          while (v52 != v50);
          uint64_t v50 = [obj countByEnumeratingWithState:&v108 objects:v130 count:16];
        }
        while (v50);
      }
    }
    if (![v95 count] && (unint64_t)objc_msgSend(v94, "count") >= 2)
    {
      if (self->_extensiveClusterTimeIntervalDistance == 0.0) {
        [(PLRegionsDensityClustering *)self _locationBasedClusteringBlock];
      }
      else {
      v68 = -[PLRegionsDensityClustering _timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:](self, "_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:");
      }
      v69 = [(PLDataClustering *)[PLDBSCANClustering alloc] initWithDistanceBlock:v68];
      -[PLDataDensityClustering setMaximumDistance:](v69, "setMaximumDistance:", dbl_19BA9A090[[v94 count] > self->_definiteClusterMinimumNumberOfObjects]);
      [(PLDataDensityClustering *)v69 setMinimumNumberOfObjects:1];
      v70 = [(PLDBSCANClustering *)v69 performWithDataset:v94 progressBlock:0];
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v71 = [v70 countByEnumeratingWithState:&v96 objects:v128 count:16];
      if (v71)
      {
        uint64_t v72 = v71;
        uint64_t v73 = *(void *)v97;
        do
        {
          for (iuint64_t i = 0; ii != v72; ++ii)
          {
            if (*(void *)v97 != v73) {
              objc_enumerationMutation(v70);
            }
            v75 = *(void **)(*((void *)&v96 + 1) + 8 * ii);
            v76 = [v75 objects];
            uint64_t v77 = [v76 count];

            if (v77)
            {
              v78 = [v75 meanRegion:500.0];
              v79 = [v75 objects];
              [v95 setObject:v79 forKeyedSubscript:v78];
            }
          }
          uint64_t v72 = [v70 countByEnumeratingWithState:&v96 objects:v128 count:16];
        }
        while (v72);
      }
    }
    v6 = v88;
    if (![v95 count])
    {
      v80 = +[PLDataCluster clusterWithObjects:v88];
      v81 = [v80 meanRegion:100.0];
      if (v81)
      {
        v82 = [v80 objects];
        [v95 setObject:v82 forKeyedSubscript:v81];
      }
    }
  }
  else
  {
    id v95 = (id)MEMORY[0x1E4F1CC08];
  }

  return v95;
}

uint64_t __63__PLRegionsDensityClustering_performWithDataset_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(a2, "pl_date");
  v6 = objc_msgSend(v4, "pl_date");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)_timeAndLocationBasedClusteringBlockWithTimeIntervalDistance:(double)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__PLRegionsDensityClustering__timeAndLocationBasedClusteringBlockWithTimeIntervalDistance___block_invoke;
  v6[3] = &__block_descriptor_40_e65_d24__0___PLRegionsClusteringItem__8___PLRegionsClusteringItem__16l;
  *(double *)&v6[4] = a3;
  v3 = (void *)MEMORY[0x19F38D650](v6, a2);
  id v4 = (void *)MEMORY[0x19F38D650]();

  return v4;
}

double __91__PLRegionsDensityClustering__timeAndLocationBasedClusteringBlockWithTimeIntervalDistance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v6, "pl_coordinate");
  objc_msgSend(v5, "pl_coordinate");
  uint64_t v16 = v7;
  uint64_t v17 = v8;
  CLLocationCoordinate2DGetDistanceFrom();
  double v10 = v9;
  v11 = objc_msgSend(v6, "pl_date", v16, v17);

  v12 = objc_msgSend(v5, "pl_date");

  [v11 timeIntervalSinceDate:v12];
  double v14 = fabs(v13) / *(double *)(a1 + 32);

  return v10 + v14;
}

- (id)_locationBasedClusteringBlock
{
  return &__block_literal_global_96343;
}

uint64_t __59__PLRegionsDensityClustering__locationBasedClusteringBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  objc_msgSend(a2, "pl_coordinate");
  objc_msgSend(v4, "pl_coordinate");

  return CLLocationCoordinate2DGetDistanceFrom();
}

- (PLRegionsDensityClustering)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLRegionsDensityClustering;
  result = [(PLRegionsDensityClustering *)&v3 init];
  if (result)
  {
    result->_algorithuint64_t m = 0;
    result->_includeDefiniteClusters = 1;
    result->_definiteClusterTimeIntervalDistance = 7200.0;
    result->_definiteClusterMaximumDistanceUnit = 20.0;
    result->_definiteClusterMinimumNumberOfObjectsPercent = 0.25;
    result->_unint64_t definiteClusterMinimumNumberOfObjects = 4;
    result->_removeDefiniteClustersObjectsFromDataset = 1;
    result->_includeExtensiveClusters = 1;
    result->_extensiveClusterTimeIntervalDistance = 0.0;
    result->_extensiveClusterMaximumDistanceUnit = 250.0;
    result->_extensiveClusterMinimumNumberOfObjectsPercent = 0.15;
    result->_unint64_t extensiveClusterMinimumNumberOfObjects = 3;
    result->_removeExtensiveClustersObjectsFromDataset = 1;
    result->_removeExtensiveClustersContainingDefiniteClusters = 1;
  }
  return result;
}

@end