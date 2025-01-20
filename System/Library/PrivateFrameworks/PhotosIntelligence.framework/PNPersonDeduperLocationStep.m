@interface PNPersonDeduperLocationStep
- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6;
- (id)metricsKey;
- (id)momentWithBestLocationForPersons:(id)a3 andOtherPersons:(id)a4 personsByMomentLocalIdentifiersCache:(id)a5;
- (id)name;
- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6;
@end

@implementation PNPersonDeduperLocationStep

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v91 = a5;
  v12 = (void (**)(id, void *, void *))a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v71 = [MEMORY[0x263F08690] currentHandler];
    [v71 handleFailureInMethod:a2, self, @"PNPersonDeduperLocationStep.m", 96, @"Invalid parameter not satisfying: %@", @"persons" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v72 = [MEMORY[0x263F08690] currentHandler];
  [v72 handleFailureInMethod:a2, self, @"PNPersonDeduperLocationStep.m", 97, @"Invalid parameter not satisfying: %@", @"otherPersons" object file lineNumber description];

LABEL_3:
  if (v91)
  {
    if (v12) {
      goto LABEL_5;
    }
  }
  else
  {
    v73 = [MEMORY[0x263F08690] currentHandler];
    [v73 handleFailureInMethod:a2, self, @"PNPersonDeduperLocationStep.m", 98, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

    if (v12) {
      goto LABEL_5;
    }
  }
  v74 = [MEMORY[0x263F08690] currentHandler];
  [v74 handleFailureInMethod:a2, self, @"PNPersonDeduperLocationStep.m", 99, @"Invalid parameter not satisfying: %@", @"resultBlock" object file lineNumber description];

LABEL_5:
  v13 = +[PNPersonClusterManager personProcessingSortDescriptors];
  v14 = [v10 sortedArrayUsingDescriptors:v13];
  v15 = [v11 sortedArrayUsingDescriptors:v13];
  uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
  v89 = [MEMORY[0x263EFF9C0] set];
  v94 = (void *)v16;
  v17 = [(PNPersonDeduperLocationStep *)self momentWithBestLocationForPersons:v14 andOtherPersons:v15 personsByMomentLocalIdentifiersCache:v16];
  unint64_t v18 = [v17 count];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v119 objects:v128 count:16];
  if (v20)
  {
    v87 = v10;
    unint64_t v88 = 0;
    uint64_t v22 = *(void *)v120;
    float v23 = (float)v18;
    v86 = v11;
    v80 = v13;
    v81 = v12;
    v83 = v15;
    v84 = v14;
    v82 = v19;
    uint64_t v77 = *(void *)v120;
    while (2)
    {
      uint64_t v24 = 0;
      uint64_t v76 = v20;
      do
      {
        if (*(void *)v120 != v22)
        {
          uint64_t v25 = v24;
          objc_enumerationMutation(v19);
          uint64_t v24 = v25;
        }
        uint64_t v78 = v24;
        v26 = *(void **)(*((void *)&v119 + 1) + 8 * v24);
        *(float *)&double v21 = (float)v88 / v23;
        [(PNPersonDeduperStep *)self setProgress:v21];
        context = (void *)MEMORY[0x25A2E0AC0]();
        v27 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        obuint64_t j = v26;
        uint64_t v95 = [obj countByEnumeratingWithState:&v115 objects:v127 count:16];
        if (v95)
        {
          uint64_t v92 = *(void *)v116;
          do
          {
            for (uint64_t i = 0; i != v95; ++i)
            {
              if (*(void *)v116 != v92) {
                objc_enumerationMutation(obj);
              }
              v29 = [*(id *)(*((void *)&v115 + 1) + 8 * i) localIdentifier];
              v30 = [v94 objectForKeyedSubscript:v29];

              long long v113 = 0u;
              long long v114 = 0u;
              long long v111 = 0u;
              long long v112 = 0u;
              id v31 = v30;
              uint64_t v32 = [v31 countByEnumeratingWithState:&v111 objects:v126 count:16];
              if (v32)
              {
                uint64_t v33 = v32;
                uint64_t v34 = *(void *)v112;
                do
                {
                  for (uint64_t j = 0; j != v33; ++j)
                  {
                    if (*(void *)v112 != v34) {
                      objc_enumerationMutation(v31);
                    }
                    uint64_t v36 = *(void *)(*((void *)&v111 + 1) + 8 * j);
                    v37 = [v27 objectForKey:v36];
                    uint64_t v38 = [v37 unsignedIntegerValue];

                    v39 = [NSNumber numberWithUnsignedInteger:v38 + 1];
                    [v27 setObject:v39 forKey:v36];
                  }
                  uint64_t v33 = [v31 countByEnumeratingWithState:&v111 objects:v126 count:16];
                }
                while (v33);
              }
            }
            uint64_t v95 = [obj countByEnumeratingWithState:&v115 objects:v127 count:16];
          }
          while (v95);
        }

        v40 = [MEMORY[0x263EFF9C0] set];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        v41 = [v27 keyEnumerator];
        uint64_t v42 = [v41 countByEnumeratingWithState:&v107 objects:v125 count:16];
        if (v42)
        {
          uint64_t v43 = v42;
          uint64_t v44 = *(void *)v108;
          do
          {
            for (uint64_t k = 0; k != v43; ++k)
            {
              if (*(void *)v108 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void *)(*((void *)&v107 + 1) + 8 * k);
              v47 = [v27 objectForKey:v46];
              unint64_t v48 = [v47 unsignedIntegerValue];

              if ((float)((float)v48 / (float)(unint64_t)[obj count]) >= 0.0) {
                [v40 addObject:v46];
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v107 objects:v125 count:16];
          }
          while (v43);
        }

        id v10 = v87;
        v49 = (void *)[v87 mutableCopy];
        id v11 = v86;
        v50 = (void *)[v86 mutableCopy];
        v51 = v89;
        if ([v89 count])
        {
          v52 = [v89 allObjects];
          [v50 removeObjectsInArray:v52];
          [v49 removeObjectsInArray:v52];
        }
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id v53 = v49;
        v54 = self;
        uint64_t v96 = [v53 countByEnumeratingWithState:&v103 objects:v124 count:16];
        if (v96)
        {
          uint64_t v79 = *(void *)v104;
          v75 = v50;
          v93 = v53;
          do
          {
            uint64_t v55 = 0;
            uint64_t v56 = v79;
            do
            {
              if (*(void *)v104 != v56) {
                objc_enumerationMutation(v53);
              }
              uint64_t v57 = *(void *)(*((void *)&v103 + 1) + 8 * v55);
              [v50 removeObject:v57];
              if ([v40 containsObject:v57])
              {
                long long v101 = 0u;
                long long v102 = 0u;
                long long v99 = 0u;
                long long v100 = 0u;
                id obja = v50;
                uint64_t v58 = [obja countByEnumeratingWithState:&v99 objects:v123 count:16];
                if (v58)
                {
                  uint64_t v59 = v58;
                  uint64_t v60 = *(void *)v100;
                  while (2)
                  {
                    for (uint64_t m = 0; m != v59; ++m)
                    {
                      if (*(void *)v100 != v60) {
                        objc_enumerationMutation(obja);
                      }
                      uint64_t v62 = *(void *)(*((void *)&v99 + 1) + 8 * m);
                      if ([(PNPersonDeduperStep *)v54 shouldStop]
                        || [(PNPersonDeduperStep *)v54 shouldStopWithUpdateBlock:v91])
                      {
                        v50 = obja;

                        id v53 = v93;
                        id v11 = v86;
                        id v10 = v87;
                        goto LABEL_60;
                      }
                      if ([v40 containsObject:v62])
                      {
                        uint64_t v63 = MEMORY[0x25A2E0AC0]();
                        [(PNPersonDeduperStep *)self addPotentialMergeCandidateForPerson:v57 withOtherPerson:v62 updateBlock:v91];
                        v64 = (void *)v63;
                        v54 = self;
                      }
                    }
                    uint64_t v59 = [obja countByEnumeratingWithState:&v99 objects:v123 count:16];
                    v50 = v75;
                    uint64_t v56 = v79;
                    if (v59) {
                      continue;
                    }
                    break;
                  }
                }

                id v53 = v93;
              }
              ++v55;
            }
            while (v55 != v96);
            id v11 = v86;
            id v10 = v87;
            v51 = v89;
            uint64_t v96 = [v53 countByEnumeratingWithState:&v103 objects:v124 count:16];
          }
          while (v96);
        }

        if ([(PNPersonDeduperStep *)v54 shouldStop])
        {
LABEL_60:
          v13 = v80;
          v12 = v81;

          v70 = v82;
          v15 = v83;
          v66 = v82;
          v14 = v84;
          v69 = v89;
          goto LABEL_61;
        }
        ++v88;
        v65 = [(PNPersonDeduperStep *)v54 mergeCandidatePersonsWithUpdateBlock:v91];
        [v51 unionSet:v65];

        uint64_t v22 = v77;
        uint64_t v24 = v78 + 1;
        v13 = v80;
        v12 = v81;
        v15 = v83;
        v14 = v84;
        id v19 = v82;
      }
      while (v78 + 1 != v76);
      uint64_t v20 = [v82 countByEnumeratingWithState:&v119 objects:v128 count:16];
      uint64_t v22 = v77;
      if (v20) {
        continue;
      }
      break;
    }
  }

  v66 = (void *)[v10 mutableCopy];
  id v67 = v19;
  v68 = (void *)[v11 mutableCopy];
  v69 = v89;
  [v66 minusSet:v89];
  [v68 minusSet:v89];
  v12[2](v12, v66, v68);

  v70 = v67;
LABEL_61:
}

- (id)momentWithBestLocationForPersons:(id)a3 andOtherPersons:(id)a4 personsByMomentLocalIdentifiersCache:(id)a5
{
  uint64_t v36 = self;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = [MEMORY[0x263EFF9C0] setWithArray:a3];
  v37 = v7;
  [v9 addObjectsFromArray:v7];
  v40 = [MEMORY[0x263EFF9C0] set];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v9;
  uint64_t v41 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "backingMomentIdentifiers", v36);
        [v40 unionSet:v12];

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v13 = [v11 backingMomentIdentifiers];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v47 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v46 + 1) + 8 * j);
              id v19 = [v8 objectForKeyedSubscript:v18];
              if (!v19)
              {
                id v19 = [MEMORY[0x263EFF9C0] set];
                [v8 setObject:v19 forKeyedSubscript:v18];
              }
              [v19 addObject:v11];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v15);
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v41);
  }

  uint64_t v20 = v36;
  double v21 = [(PNPersonDeduperStep *)v36 personClusterManager];
  uint64_t v22 = [v40 allObjects];
  float v23 = objc_msgSend(v21, "pn_fetchMomentsWithLocalIdentifiers:", v22);

  uint64_t v24 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v25 = v23;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v42 + 1) + 8 * k);
        objc_msgSend(v30, "approximateCoordinate", v36);
        if (v32 != 0.0
          && v31 != 0.0
          && CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v31)
          && ([v30 isCoarse] & 1) == 0)
        {
          [v24 addObject:v30];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v27);
  }

  uint64_t v33 = [(PNPersonDeduperStep *)v20 delegate];
  uint64_t v34 = [v33 densityClusteringForObjects:v24 maximumDistance:3 minimumNumberOfObjects:&__block_literal_global_3123 withDistanceBlock:500.0];

  return v34;
}

uint64_t __117__PNPersonDeduperLocationStep_momentWithBestLocationForPersons_andOtherPersons_personsByMomentLocalIdentifiersCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 approximateCoordinate];
  [v4 approximateCoordinate];

  return CLLocationCoordinate2DGetDistanceFrom();
}

- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  v9 = [(PNPersonDeduperStep *)self profile];
  char v10 = [v9 shouldRelaxThreshold];
  id v11 = [(PNPersonDeduperStep *)self profile];
  v12 = v11;
  if (v10) {
    [v11 fuzzyMaximumDistance];
  }
  else {
    [v11 normalMaximumDistance];
  }
  double v14 = v13;

  *(float *)&double v14 = v14;
  LODWORD(v15) = LODWORD(v14);
  [(PNPersonDeduperStep *)self adjustedThreshold:v6 forMinAgeType:v15];
  return v16 > a5;
}

- (id)metricsKey
{
  v2 = @"numberOfGraphMergeCandidatesAddedByLocationStep";
  return @"numberOfGraphMergeCandidatesAddedByLocationStep";
}

- (id)name
{
  return @"Location Deduping";
}

@end