@interface PNPersonDeduperSocialGroupComplementStep
- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6;
- (id)metricsKey;
- (id)name;
- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6;
@end

@implementation PNPersonDeduperSocialGroupComplementStep

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  uint64_t v138 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(void, void *, void *))a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_78:
    v79 = [MEMORY[0x263F08690] currentHandler];
    [v79 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupComplementStep.m", 46, @"Invalid parameter not satisfying: %@", @"otherPersons" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_79;
  }
  v78 = [MEMORY[0x263F08690] currentHandler];
  [v78 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupComplementStep.m", 45, @"Invalid parameter not satisfying: %@", @"persons" object file lineNumber description];

  if (!v12) {
    goto LABEL_78;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_79:
  v80 = [MEMORY[0x263F08690] currentHandler];
  [v80 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupComplementStep.m", 47, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

LABEL_4:
  v83 = v14;
  if (!v14)
  {
    v81 = [MEMORY[0x263F08690] currentHandler];
    [v81 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupComplementStep.m", 48, @"Invalid parameter not satisfying: %@", @"resultBlock" object file lineNumber description];
  }
  v85 = v11;
  v15 = (void *)[v11 mutableCopy];
  [v15 unionSet:v12];
  v16 = [(PNPersonDeduperStep *)self delegate];
  v17 = [(PNPersonDeduperStep *)self personClusterManager];
  v88 = [v16 performSocialGroupsIdentifiersWithPersonClusterManager:v17 forPersons:v15 overTheYearsComputation:0 updateBlock:v13];

  v18 = [MEMORY[0x263EFF9A0] dictionary];
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  id v19 = v15;
  v102 = self;
  id v103 = v13;
  uint64_t v82 = [v19 countByEnumeratingWithState:&v128 objects:v137 count:16];
  v87 = v19;
  if (v82)
  {
    uint64_t v84 = *(void *)v129;
    v90 = v12;
    while (2)
    {
      uint64_t v20 = 0;
      id v21 = v13;
      do
      {
        if (*(void *)v129 != v84) {
          objc_enumerationMutation(v19);
        }
        v22 = *(void **)(*((void *)&v128 + 1) + 8 * v20);
        v23 = (void *)MEMORY[0x25A2E0AC0]();
        if ([(PNPersonDeduperStep *)self shouldStopWithUpdateBlock:v21])
        {
LABEL_72:
          id v13 = v21;
          v59 = v19;
          id v12 = v90;
          goto LABEL_73;
        }
        v89 = v23;
        uint64_t v86 = v20;
        v24 = (void *)MEMORY[0x263EFF9C0];
        v25 = [v22 localIdentifier];
        obuint64_t j = [v24 setWithObject:v25];

        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        id v26 = v90;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v124 objects:v136 count:16];
        v28 = v22;
        if (v27)
        {
          uint64_t v29 = v27;
          uint64_t v30 = *(void *)v125;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v125 != v30) {
                objc_enumerationMutation(v26);
              }
              v32 = *(void **)(*((void *)&v124 + 1) + 8 * i);
              if (v32 != v28)
              {
                v33 = [v28 backingAssetIdentifiers];
                v34 = [v32 backingAssetIdentifiers];
                int v35 = [v33 intersectsSet:v34];

                if (v35)
                {
                  v36 = [v32 localIdentifier];
                  [obj addObject:v36];
                }
              }
            }
            uint64_t v29 = [v26 countByEnumeratingWithState:&v124 objects:v136 count:16];
          }
          while (v29);
        }
        v98 = v28;

        self = v102;
        id v21 = v103;
        if ([obj count])
        {
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          id v37 = v88;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v120 objects:v135 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v121;
            uint64_t v92 = *(void *)v121;
            id v94 = v37;
            while (2)
            {
              uint64_t v41 = 0;
              uint64_t v96 = v39;
              do
              {
                if (*(void *)v121 != v40) {
                  objc_enumerationMutation(v37);
                }
                v42 = *(void **)(*((void *)&v120 + 1) + 8 * v41);
                v43 = (void *)MEMORY[0x25A2E0AC0]();
                if ([(PNPersonDeduperStep *)self shouldStopWithUpdateBlock:v21])
                {

                  id v19 = v87;
                  v23 = v89;
                  goto LABEL_72;
                }
                context = v43;
                v44 = (void *)[v42 mutableCopy];
                [v44 intersectSet:obj];
                uint64_t v45 = [v44 count];
                if (v45 != [v42 count])
                {
                  unint64_t v46 = vcvtmd_u64_f64((double)(unint64_t)[v42 count] * 0.5);
                  unint64_t v47 = v46 <= 2 ? 2 : v46;
                  if ([v44 count] >= v47)
                  {
                    uint64_t v100 = v41;
                    v48 = [v98 localIdentifier];
                    v49 = (void *)[v42 mutableCopy];
                    [v49 minusSet:v44];
                    long long v118 = 0u;
                    long long v119 = 0u;
                    long long v116 = 0u;
                    long long v117 = 0u;
                    id v50 = v49;
                    uint64_t v51 = [v50 countByEnumeratingWithState:&v116 objects:v134 count:16];
                    v52 = v44;
                    if (v51)
                    {
                      uint64_t v53 = v51;
                      uint64_t v54 = *(void *)v117;
                      do
                      {
                        for (uint64_t j = 0; j != v53; ++j)
                        {
                          if (*(void *)v117 != v54) {
                            objc_enumerationMutation(v50);
                          }
                          uint64_t v56 = *(void *)(*((void *)&v116 + 1) + 8 * j);
                          v57 = [v18 objectForKeyedSubscript:v48];
                          if (!v57)
                          {
                            v57 = [MEMORY[0x263EFF9C0] set];
                            [v18 setObject:v57 forKeyedSubscript:v48];
                          }
                          [v57 addObject:v56];
                          v58 = [v18 objectForKeyedSubscript:v56];

                          if (!v58)
                          {
                            v58 = [MEMORY[0x263EFF9C0] set];
                            [v18 setObject:v58 forKeyedSubscript:v56];
                          }
                          [v58 addObject:v48];
                        }
                        uint64_t v53 = [v50 countByEnumeratingWithState:&v116 objects:v134 count:16];
                      }
                      while (v53);
                    }

                    self = v102;
                    v44 = v52;
                    id v21 = v103;
                    uint64_t v40 = v92;
                    id v37 = v94;
                    uint64_t v39 = v96;
                    uint64_t v41 = v100;
                  }
                }

                ++v41;
              }
              while (v41 != v39);
              uint64_t v39 = [v37 countByEnumeratingWithState:&v120 objects:v135 count:16];
              if (v39) {
                continue;
              }
              break;
            }
          }
        }
        id v19 = v87;
        uint64_t v20 = v86 + 1;
      }
      while (v86 + 1 != v82);
      id v13 = v21;
      id v12 = v90;
      uint64_t v82 = [v87 countByEnumeratingWithState:&v128 objects:v137 count:16];
      if (v82) {
        continue;
      }
      break;
    }
  }

  v59 = (void *)[v12 mutableCopy];
  long long v112 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v60 = v85;
  uint64_t v95 = [v60 countByEnumeratingWithState:&v112 objects:v133 count:16];
  if (v95)
  {
    uint64_t v61 = *(void *)v113;
    id v91 = v12;
    uint64_t v93 = *(void *)v113;
    id v99 = v60;
    v101 = v59;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v113 != v61) {
          objc_enumerationMutation(v60);
        }
        uint64_t v97 = v62;
        v63 = *(void **)(*((void *)&v112 + 1) + 8 * v62);
        contexta = (void *)MEMORY[0x25A2E0AC0]();
        [v59 removeObject:v63];
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id obja = v59;
        uint64_t v64 = [obja countByEnumeratingWithState:&v108 objects:v132 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v109;
          while (2)
          {
            for (uint64_t k = 0; k != v65; ++k)
            {
              if (*(void *)v109 != v66) {
                objc_enumerationMutation(obja);
              }
              v68 = *(void **)(*((void *)&v108 + 1) + 8 * k);
              if ([(PNPersonDeduperStep *)self shouldStop]
                || [(PNPersonDeduperStep *)self shouldStopWithUpdateBlock:v13])
              {

                id v12 = v91;
                v74 = v99;
                v59 = v101;
                goto LABEL_75;
              }
              v69 = [v63 localIdentifier];
              v70 = [v18 objectForKeyedSubscript:v69];
              v71 = [v68 localIdentifier];
              int v72 = [v70 containsObject:v71];

              id v13 = v103;
              self = v102;
              if (v72)
              {
                v73 = (void *)MEMORY[0x25A2E0AC0]();
                [(PNPersonDeduperStep *)v102 addPotentialMergeCandidateForPerson:v63 withOtherPerson:v68 updateBlock:v103];
              }
            }
            uint64_t v65 = [obja countByEnumeratingWithState:&v108 objects:v132 count:16];
            id v19 = v87;
            id v60 = v99;
            v59 = v101;
            if (v65) {
              continue;
            }
            break;
          }
        }

        uint64_t v62 = v97 + 1;
        id v12 = v91;
        uint64_t v61 = v93;
      }
      while (v97 + 1 != v95);
      uint64_t v95 = [v60 countByEnumeratingWithState:&v112 objects:v133 count:16];
    }
    while (v95);
  }

  if ([(PNPersonDeduperStep *)self shouldStop])
  {
LABEL_73:
    v77 = v83;
  }
  else
  {
    v74 = [(PNPersonDeduperStep *)self mergeCandidatePersonsWithUpdateBlock:v13];
    v75 = (void *)[v60 mutableCopy];
    v76 = (void *)[v12 mutableCopy];
    [v75 minusSet:v74];
    [v76 minusSet:v74];
    v83[2](v83, v75, v76);

LABEL_75:
    v77 = v83;
    id v19 = v87;
  }
}

- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  v9 = [(PNPersonDeduperStep *)self profile];
  char v10 = [v9 shouldRelaxThreshold];
  id v11 = [(PNPersonDeduperStep *)self profile];
  id v12 = v11;
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
  v2 = @"numberOfGraphMergeCandidatesAddedBySocialGroupComplementStep";
  return @"numberOfGraphMergeCandidatesAddedBySocialGroupComplementStep";
}

- (id)name
{
  return @"Social Group Complement";
}

@end