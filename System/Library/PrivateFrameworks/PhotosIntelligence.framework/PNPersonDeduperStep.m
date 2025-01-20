@interface PNPersonDeduperStep
- (BOOL)addPotentialMergeCandidateForPerson:(id)a3 withOtherPerson:(id)a4 updateBlock:(id)a5;
- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6;
- (BOOL)shouldStop;
- (BOOL)shouldStopWithUpdateBlock:(id)a3;
- (NSDictionary)invalidCandidatesMapping;
- (NSMapTable)mergeRelations;
- (NSString)metricsKey;
- (NSString)name;
- (PNPersonClusterManager)personClusterManager;
- (PNPersonDeduperProfile)profile;
- (PNPersonDeduperStep)initWithPersonClusterManager:(id)a3 invalidCandidatesMapping:(id)a4 profile:(id)a5;
- (PNPersonPromoterDelegate)delegate;
- (float)adjustedThreshold:(float)a3 forMinAgeType:(unsigned __int16)a4;
- (float)progress;
- (id)_resolveMergeCandidate:(id)a3 forPerson:(id)a4;
- (id)mergeCandidatePersonsWithUpdateBlock:(id)a3;
- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setProgress:(float)a3;
- (void)setShouldStop:(BOOL)a3;
@end

@implementation PNPersonDeduperStep

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mergeRelations, 0);
  objc_storeStrong((id *)&self->_invalidCandidatesMapping, 0);
  objc_storeStrong((id *)&self->_personClusterManager, 0);
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (PNPersonDeduperProfile)profile
{
  return self->_profile;
}

- (void)setDelegate:(id)a3
{
}

- (PNPersonPromoterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PNPersonPromoterDelegate *)WeakRetained;
}

- (NSMapTable)mergeRelations
{
  return self->_mergeRelations;
}

- (NSDictionary)invalidCandidatesMapping
{
  return self->_invalidCandidatesMapping;
}

- (PNPersonClusterManager)personClusterManager
{
  return self->_personClusterManager;
}

- (float)adjustedThreshold:(float)a3 forMinAgeType:(unsigned __int16)a4
{
  int v4 = a4;
  if ([(PNPersonDeduperProfile *)self->_profile shouldAdjustThresholdOnAgeType])
  {
    if (v4 == 2)
    {
      float v6 = 0.8;
      return a3 * v6;
    }
    if (v4 == 1)
    {
      float v6 = *(float *)"333?";
      return a3 * v6;
    }
  }
  return a3;
}

- (BOOL)addPotentialMergeCandidateForPerson:(id)a3 withOtherPerson:(id)a4 updateBlock:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 quarantined] & 1) != 0 || (objc_msgSend(v9, "quarantined")) {
    goto LABEL_5;
  }
  v11 = [(PNPersonDeduperStep *)self invalidCandidatesMapping];
  v12 = [v9 localIdentifier];
  v13 = [v11 objectForKeyedSubscript:v12];
  v14 = [v8 localIdentifier];
  if (([v13 containsObject:v14] & 1) == 0)
  {
    id v45 = v10;
    [(PNPersonDeduperStep *)self invalidCandidatesMapping];
    v17 = v42 = self;
    v18 = [v8 localIdentifier];
    v19 = [v17 objectForKeyedSubscript:v18];
    v20 = [v9 localIdentifier];
    char v43 = [v19 containsObject:v20];

    if (v43)
    {
      BOOL v15 = 0;
      id v10 = v45;
      goto LABEL_6;
    }
    unsigned __int16 v51 = 0;
    v21 = [(PNPersonDeduperStep *)v42 personClusterManager];
    id v50 = 0;
    id v10 = v45;
    [v21 distanceWithOverlapCheckBetweenPerson:v8 andPerson:v9 useCommonMoments:1 minAgeType:&v51 updateBlock:v45 error:&v50];
    float v23 = v22;
    double v24 = COERCE_DOUBLE(v50);

    if (v24 == 0.0)
    {
      if (![(PNPersonDeduperStep *)v42 shouldStopWithUpdateBlock:v45])
      {
        *(float *)&double v25 = v23;
        if ([(PNPersonDeduperStep *)v42 isPersonSimilar:v8 withOtherPerson:v9 withDistance:v51 minAgeType:v25])
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218498;
            double v55 = v23;
            __int16 v56 = 2112;
            id v57 = v9;
            __int16 v58 = 2112;
            id v59 = v8;
            _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "Found a merge candidate with distance %.3f: %@ for %@", buf, 0x20u);
          }
          v53[0] = v8;
          v53[1] = v9;
          uint64_t v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          v26 = [(PNPersonDeduperStep *)v42 mergeRelations];
          v27 = NSAllMapTableKeys(v26);

          uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v52 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v47;
LABEL_18:
            uint64_t v31 = 0;
            while (1)
            {
              if (*(void *)v47 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v46 + 1) + 8 * v31);
              id v33 = [v32 lastObject];
              if (v33 == v9) {
                break;
              }

              if (v29 == ++v31)
              {
                uint64_t v29 = [v27 countByEnumeratingWithState:&v46 objects:v52 count:16];
                if (v29) {
                  goto LABEL_18;
                }
                goto LABEL_29;
              }
            }
            v34 = [(PNPersonDeduperStep *)v42 mergeRelations];
            v35 = [v34 objectForKey:v32];
            [v35 floatValue];
            float v37 = v36;

            if (v37 > v23)
            {
              v38 = [(PNPersonDeduperStep *)v42 mergeRelations];
              [v38 removeObjectForKey:v32];

              goto LABEL_29;
            }
            v40 = v9;
            v41 = (void *)v44;
          }
          else
          {
LABEL_29:

            v27 = [(PNPersonDeduperStep *)v42 mergeRelations];
            *(float *)&double v39 = v23;
            v40 = [NSNumber numberWithFloat:v39];
            v41 = (void *)v44;
            [v27 setObject:v40 forKey:v44];
          }

          BOOL v15 = 1;
          goto LABEL_26;
        }
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v55 = v24;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "-[PNPersonClusterManager distanceWithOverlapCheckBetweenPerson:andPerson:useCommonMoments:error:] return an error: %@", buf, 0xCu);
    }
    BOOL v15 = 0;
LABEL_26:

    goto LABEL_6;
  }

LABEL_5:
  BOOL v15 = 0;
LABEL_6:

  return v15;
}

- (id)mergeCandidatePersonsWithUpdateBlock:(id)a3
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  id v112 = a3;
  v107 = [MEMORY[0x263EFF9C0] set];
  int v4 = [(PNPersonDeduperStep *)self personClusterManager];
  v5 = [MEMORY[0x263F08968] mapTableWithKeyOptions:5 valueOptions:0];
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  float v6 = [(PNPersonDeduperStep *)self mergeRelations];
  v7 = [v6 keyEnumerator];

  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v166 objects:v184 count:16];
  v113 = v5;
  v115 = self;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v167;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v167 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v166 + 1) + 8 * i);
        if ([(PNPersonDeduperStep *)self shouldStopWithUpdateBlock:v112])
        {
          v99 = v107;
          id v101 = v107;
          v102 = obj;
LABEL_113:

          goto LABEL_114;
        }
        v13 = [v12 firstObject];
        v14 = [v12 lastObject];
        int v15 = [v13 isVerified];
        int v16 = [v14 isVerified];
        if (v15) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {
          if ((v16 & 1) != 0
            || ((unint64_t v18 = [v13 faceCount], v18 >= objc_msgSend(v14, "faceCount")) ? (v19 = 1) : (v19 = v15),
                (v19 & 1) == 0))
          {
            v21 = [v12 lastObject];

            v20 = [v12 firstObject];

            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)v179 = v20;
              *(_WORD *)&v179[8] = 2112;
              *(void *)&v179[10] = v21;
              _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Swaping source person and person to merge: %@ merging in to %@", buf, 0x16u);
            }
          }
          else
          {
            v20 = v14;
            v21 = v13;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v32 = [MEMORY[0x263F08690] currentHandler];
            [v32 handleFailureInMethod:a2 object:v115 file:@"PNPersonDeduperStep.m" lineNumber:176 description:@"Person source should be type of PNPersonCluster"];
          }
          float v23 = [(PNPersonDeduperStep *)v115 mergeRelations];
          double v24 = [v23 objectForKey:v12];
          [v24 floatValue];
          float v26 = v25;

          int v27 = [v4 numberOfAssetsInCommonBetweenPerson:v21 andPerson:v20];
          int v28 = [v4 numberOfMomentsInCommonBetweenPerson:v21 andPerson:v20];
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v30 = [v20 localIdentifier];
            uint64_t v31 = [v21 localIdentifier];
            *(_DWORD *)buf = 138413314;
            *(void *)v179 = v30;
            *(_WORD *)&v179[8] = 2112;
            *(void *)&v179[10] = v31;
            __int16 v180 = 2048;
            double v181 = v26;
            __int16 v182 = 1024;
            *(_DWORD *)v183 = v27;
            *(_WORD *)&v183[4] = 1024;
            *(_DWORD *)&v183[6] = v28;
            _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Resolving merge %@ into %@]\nDistance: %.3f, common assets: %d, common moments: %d", buf, 0x2Cu);

            v5 = v113;
          }
          uint64_t v29 = [(NSMapTable *)v5 objectForKey:v21];
          if (v29)
          {
            float v22 = v29;
            [v29 addObject:v20];
          }
          else
          {
            float v22 = [MEMORY[0x263EFF9C0] setWithObject:v20];
            [(NSMapTable *)v5 setObject:v22 forKey:v21];
          }
          v14 = v20;
          v13 = v21;
          self = v115;
        }
        else
        {
          float v22 = [MEMORY[0x263F08690] currentHandler];
          [v22 handleFailureInMethod:a2 object:self file:@"PNPersonDeduperStep.m" lineNumber:164 description:@"It's impossible at this point to merge two verified persons together."];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v166 objects:v184 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  NSAllMapTableKeys(v5);
  id v108 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v110 = [v108 countByEnumeratingWithState:&v162 objects:v177 count:16];
  if (v110)
  {
    v34 = &_os_log_internal;
    uint64_t v109 = *(void *)v163;
    *(void *)&long long v33 = 67109378;
    long long v106 = v33;
    while (2)
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v163 != v109)
        {
          uint64_t v36 = v35;
          objc_enumerationMutation(v108);
          uint64_t v35 = v36;
        }
        uint64_t v111 = v35;
        float v37 = *(void **)(*((void *)&v162 + 1) + 8 * v35);
        if (-[PNPersonDeduperStep shouldStopWithUpdateBlock:](self, "shouldStopWithUpdateBlock:", v112, v106))
        {
          v99 = v107;
          id v103 = v107;
          v102 = v108;
          goto LABEL_113;
        }
        v131 = v37;
        v38 = [(PNPersonDeduperStep *)self _resolveMergeCandidate:v5 forPerson:v37];
        v116 = v38;
        if ((unint64_t)[v38 count] >= 2)
        {
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            int v89 = [v38 count];
            *(_DWORD *)buf = v106;
            *(_DWORD *)v179 = v89;
            *(_WORD *)&v179[4] = 2112;
            *(void *)&v179[6] = v131;
            _os_log_debug_impl(&dword_25934C000, v34, OS_LOG_TYPE_DEBUG, "Resolving %d potential conflicts for %@", buf, 0x12u);
          }
          double v39 = (void *)[v38 mutableCopy];
          [v39 addObject:v131];
          v40 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"faceCount" ascending:1];
          v176 = v40;
          v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v176 count:1];
          v42 = [v39 sortedArrayUsingDescriptors:v41];

          long long v160 = 0u;
          long long v161 = 0u;
          long long v158 = 0u;
          long long v159 = 0u;
          id v128 = v42;
          uint64_t v43 = [v128 countByEnumeratingWithState:&v158 objects:v175 count:16];
          v5 = v113;
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v159;
            uint64_t v124 = *(void *)v159;
            do
            {
              uint64_t v46 = 0;
              uint64_t v126 = v44;
              do
              {
                if (*(void *)v159 != v45) {
                  objc_enumerationMutation(v128);
                }
                long long v47 = *(void **)(*((void *)&v158 + 1) + 8 * v46);
                long long v48 = (void *)MEMORY[0x25A2E0AC0]();
                if ([v39 containsObject:v47])
                {
                  id obja = v48;
                  long long v49 = objc_opt_new();
                  long long v154 = 0u;
                  long long v155 = 0u;
                  long long v156 = 0u;
                  long long v157 = 0u;
                  id v50 = v39;
                  id v51 = v39;
                  uint64_t v52 = [v51 countByEnumeratingWithState:&v154 objects:v174 count:16];
                  if (v52)
                  {
                    uint64_t v53 = v52;
                    uint64_t v54 = *(void *)v155;
                    do
                    {
                      for (uint64_t j = 0; j != v53; ++j)
                      {
                        if (*(void *)v155 != v54) {
                          objc_enumerationMutation(v51);
                        }
                        __int16 v56 = *(void **)(*((void *)&v154 + 1) + 8 * j);
                        if (v47 != v56)
                        {
                          id v57 = [v56 backingAssetIdentifiers];
                          [v49 unionSet:v57];
                        }
                      }
                      uint64_t v53 = [v51 countByEnumeratingWithState:&v154 objects:v174 count:16];
                    }
                    while (v53);
                  }

                  __int16 v58 = [v47 backingAssetIdentifiers];
                  uint64_t v59 = [v4 assetsOverlapBetweenPersonAssetIdentifiers:v58 andPersonAssetIdentifiers:v49];

                  v5 = v113;
                  if (v59)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v179 = v47;
                      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Found a conflict for %@, removing.", buf, 0xCu);
                    }
                    [v116 removeObject:v47];
                    [v51 removeObject:v47];
                  }

                  double v39 = v50;
                  uint64_t v45 = v124;
                  uint64_t v44 = v126;
                  long long v48 = obja;
                }
                ++v46;
              }
              while (v46 != v44);
              uint64_t v44 = [v128 countByEnumeratingWithState:&v158 objects:v175 count:16];
            }
            while (v44);
          }

          self = v115;
          v38 = v116;
          v34 = &_os_log_internal;
        }
        if ([v38 count])
        {
          unsigned __int16 v153 = 0;
          id v60 = (id)[v4 representativeFaceObservationForPerson:v131 ageType:&v153];
          v61 = [v131 representativeFaceByFaceIdentifiers];
          v62 = [v61 allValues];

          v63 = (void *)[v38 copy];
          long long v149 = 0u;
          long long v150 = 0u;
          long long v151 = 0u;
          long long v152 = 0u;
          id v117 = v63;
          uint64_t v120 = [v117 countByEnumeratingWithState:&v149 objects:v173 count:16];
          if (v120)
          {
            uint64_t v119 = *(void *)v150;
            v114 = v62;
            do
            {
              for (uint64_t k = 0; k != v120; ++k)
              {
                if (*(void *)v150 != v119) {
                  objc_enumerationMutation(v117);
                }
                id objb = *(id *)(*((void *)&v149 + 1) + 8 * k);
                v65 = [objb representativeFaceByFaceIdentifiers];
                v66 = [v65 allValues];

                if ((unint64_t)[v62 count] > 1
                  || (unint64_t)[v66 count] >= 2)
                {
                  uint64_t v121 = k;
                  uint64_t v67 = [v62 count];
                  uint64_t v68 = [v66 count];
                  unsigned __int16 v148 = 0;
                  id v69 = (id)[v4 representativeFaceObservationForPerson:objb ageType:&v148];
                  int v70 = [v4 minAgeTypeForFaceAgeType:v153 andFaceAgeType:v148];
                  long long v144 = 0u;
                  long long v145 = 0u;
                  BOOL v71 = (v70 - 1) < 2;
                  long long v146 = 0u;
                  long long v147 = 0u;
                  id v72 = v62;
                  uint64_t v127 = [v72 countByEnumeratingWithState:&v144 objects:v172 count:16];
                  if (v127)
                  {
                    id v122 = v72;
                    unint64_t v73 = 0;
                    unint64_t v118 = vcvtps_u32_f32((float)(unint64_t)(v68 * v67) * 0.5);
                    float v74 = flt_259898300[v71];
                    uint64_t v123 = *(void *)v145;
                    v125 = v66;
                    do
                    {
                      uint64_t v75 = 0;
                      do
                      {
                        if (*(void *)v145 != v123) {
                          objc_enumerationMutation(v122);
                        }
                        uint64_t v129 = v75;
                        uint64_t v76 = *(void *)(*((void *)&v144 + 1) + 8 * v75);
                        long long v140 = 0u;
                        long long v141 = 0u;
                        long long v142 = 0u;
                        long long v143 = 0u;
                        id v77 = v66;
                        uint64_t v78 = [v77 countByEnumeratingWithState:&v140 objects:v171 count:16];
                        if (v78)
                        {
                          uint64_t v79 = v78;
                          uint64_t v80 = *(void *)v141;
                          do
                          {
                            for (uint64_t m = 0; m != v79; ++m)
                            {
                              if (*(void *)v141 != v80) {
                                objc_enumerationMutation(v77);
                              }
                              uint64_t v82 = *(void *)(*((void *)&v140 + 1) + 8 * m);
                              v83 = [v4 visionHelper];
                              id v139 = 0;
                              [v83 distanceBetweenFaceObservation:v76 andFaceObservation:v82 error:&v139];
                              float v85 = v84;
                              id v86 = v139;

                              if (v85 > v74)
                              {
                                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                                {
                                  v87 = [v131 localIdentifier];
                                  v88 = [objb localIdentifier];
                                  *(_DWORD *)buf = 138413058;
                                  *(void *)v179 = v87;
                                  *(_WORD *)&v179[8] = 2112;
                                  *(void *)&v179[10] = v88;
                                  __int16 v180 = 2048;
                                  double v181 = v85;
                                  __int16 v182 = 2048;
                                  *(double *)v183 = v74;
                                  _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Found suspicious merge between %@ and %@, distance %.3f > %.2f.", buf, 0x2Au);

                                  v34 = &_os_log_internal;
                                }
                                ++v73;
                              }
                            }
                            uint64_t v79 = [v77 countByEnumeratingWithState:&v140 objects:v171 count:16];
                          }
                          while (v79);
                        }

                        uint64_t v75 = v129 + 1;
                        v66 = v125;
                      }
                      while (v129 + 1 != v127);
                      uint64_t v127 = [v122 countByEnumeratingWithState:&v144 objects:v172 count:16];
                    }
                    while (v127);

                    v62 = v114;
                    self = v115;
                    uint64_t k = v121;
                    if (v73 > v118)
                    {
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 134218498;
                        *(void *)v179 = v73;
                        *(_WORD *)&v179[8] = 2048;
                        *(void *)&v179[10] = v118;
                        __int16 v180 = 2112;
                        double v181 = *(double *)&objb;
                        _os_log_impl(&dword_25934C000, v34, OS_LOG_TYPE_DEFAULT, "Found %tu suspicious merges (threshold %tu) for %@, removing.", buf, 0x20u);
                      }
                      [v116 removeObject:objb];
                    }
                  }
                  else
                  {

                    uint64_t k = v121;
                  }
                }
              }
              uint64_t v120 = [v117 countByEnumeratingWithState:&v149 objects:v173 count:16];
            }
            while (v120);
          }

          v5 = v113;
          v38 = v116;
        }
        if ([v38 count]) {
          [(NSMapTable *)v5 setObject:v38 forKey:v131];
        }

        uint64_t v35 = v111 + 1;
      }
      while (v111 + 1 != v110);
      uint64_t v110 = [v108 countByEnumeratingWithState:&v162 objects:v177 count:16];
      if (v110) {
        continue;
      }
      break;
    }
  }

  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  v90 = NSAllMapTableKeys(v5);
  uint64_t v91 = [v90 countByEnumeratingWithState:&v135 objects:v170 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v136;
    while (2)
    {
      for (uint64_t n = 0; n != v92; ++n)
      {
        if (*(void *)v136 != v93) {
          objc_enumerationMutation(v90);
        }
        uint64_t v95 = *(void *)(*((void *)&v135 + 1) + 8 * n);
        v96 = (void *)MEMORY[0x25A2E0AC0]();
        if ([(PNPersonDeduperStep *)self shouldStopWithUpdateBlock:v112])
        {
          v99 = v107;
          id v105 = v107;

          goto LABEL_118;
        }
        v97 = [(PNPersonDeduperStep *)self _resolveMergeCandidate:v113 forPerson:v95];
        if ([v97 count])
        {
          [v4 mergePersons:v97 withPerson:v95];
          [v107 unionSet:v97];
        }
      }
      uint64_t v92 = [v90 countByEnumeratingWithState:&v135 objects:v170 count:16];
      if (v92) {
        continue;
      }
      break;
    }
  }

  v98 = [(PNPersonDeduperStep *)self mergeRelations];
  [v98 removeAllObjects];

  v99 = v107;
  id v100 = v107;
LABEL_118:
  v5 = v113;
LABEL_114:

  return v99;
}

- (id)_resolveMergeCandidate:(id)a3 forPerson:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKey:v7];
  if ([v8 count])
  {
    [v6 removeObjectForKey:v7];
    uint64_t v9 = [(PNPersonDeduperStep *)self personClusterManager];
    id v28 = (id)[v8 mutableCopy];
    id v26 = v7;
    int v27 = [v7 localIdentifier];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", v27, 0);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v24 = v8;
    obuint64_t j = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          int v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          int v16 = [v15 localIdentifier];
          [v9 mergeConfidenceBetweenPersonLocalIdentifier:v16 andCandidateLocalIdentifiers:v10];
          if (v17 == -1.0)
          {
            id v18 = v6;
            __int16 v30 = 0;
            id v29 = 0;
            [v9 distanceBetweenPerson:v15 andPerson:v26 useCommonMoments:1 minAgeType:&v30 updateBlock:&__block_literal_global_642 error:&v29];
            float v20 = v19;
            id v21 = v29;
            if (v21)
            {
              float v20 = 1.0;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                uint64_t v36 = v27;
                __int16 v37 = 2112;
                v38 = v16;
                __int16 v39 = 2112;
                id v40 = v21;
                _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "error updating confidence cache between %@ and %@: %@", buf, 0x20u);
              }
            }
            [v9 updateConfidenceCacheBetweenPersonLocalIdentifier:v16 andOtherPersonLocalIdentifier:v27 withDistance:v20];

            id v6 = v18;
          }
          float v22 = [(PNPersonDeduperStep *)self _resolveMergeCandidate:v6 forPerson:v15];
          [v28 unionSet:v22];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v12);
    }

    id v7 = v26;
    uint64_t v8 = v24;
  }
  else
  {
    id v28 = [MEMORY[0x263EFF9C0] set];
  }

  return v28;
}

- (BOOL)shouldStopWithUpdateBlock:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = (void (**)(id, BOOL *))a3;
  if (self->_shouldStop && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
  {
    uint64_t v8 = [MEMORY[0x263F08B88] callStackSymbols];
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_fault_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Progress reported again but it should have stop. %@", (uint8_t *)&v9, 0xCu);
  }
  [(PNPersonDeduperStep *)self progress];
  v4[2](v4, &self->_shouldStop);
  if (self->_shouldStop)
  {
    BOOL shouldStop = 1;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      id v6 = [(PNPersonDeduperStep *)self name];
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "Step %@ got cancelled.", (uint8_t *)&v9, 0xCu);

      BOOL shouldStop = self->_shouldStop;
    }
  }
  else
  {
    BOOL shouldStop = 0;
  }

  return shouldStop;
}

- (NSString)metricsKey
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PNPersonDeduperStep.m", 75, @"%s needs to be implemented by subclasses", "-[PNPersonDeduperStep metricsKey]");

  abort();
}

- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PNPersonDeduperStep.m", 68, @"%s needs to be implemented by subclasses", "-[PNPersonDeduperStep isPersonSimilar:withOtherPerson:withDistance:minAgeType:]");

  abort();
}

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  int v15 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PNPersonDeduperStep.m", 62, @"%s needs to be implemented by subclasses", "-[PNPersonDeduperStep dedupePersons:withOtherPersons:updateBlock:resultBlock:]");

  abort();
}

- (NSString)name
{
  int v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PNPersonDeduperStep.m", 55, @"%s needs to be implemented by subclasses", "-[PNPersonDeduperStep name]");

  abort();
}

- (PNPersonDeduperStep)initWithPersonClusterManager:(id)a3 invalidCandidatesMapping:(id)a4 profile:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PNPersonDeduperStep;
  id v12 = [(PNPersonDeduperStep *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personClusterManager, a3);
    objc_storeStrong((id *)&v13->_invalidCandidatesMapping, a4);
    objc_storeStrong((id *)&v13->_profile, a5);
    uint64_t v14 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:0];
    mergeRelations = v13->_mergeRelations;
    v13->_mergeRelations = (NSMapTable *)v14;
  }
  return v13;
}

@end