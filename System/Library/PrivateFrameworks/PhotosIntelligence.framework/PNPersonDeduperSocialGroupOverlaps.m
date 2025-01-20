@interface PNPersonDeduperSocialGroupOverlaps
- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6;
- (id)metricsKey;
- (id)name;
- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6;
- (void)mergePersons:(id)a3 otherPersonLocalIdentifiers:(id)a4 personsFetchResult:(id)a5 mergeSocialGroupPersonIdentifiers:(id)a6;
@end

@implementation PNPersonDeduperSocialGroupOverlaps

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v93 = a5;
  id v12 = a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v62 = v12;
    v63 = [MEMORY[0x263F08690] currentHandler];
    [v63 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupOverlaps.m", 101, @"Invalid parameter not satisfying: %@", @"persons" object file lineNumber description];

    id v12 = v62;
    if (v11) {
      goto LABEL_3;
    }
  }
  id v64 = v12;
  v65 = [MEMORY[0x263F08690] currentHandler];
  [v65 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupOverlaps.m", 102, @"Invalid parameter not satisfying: %@", @"otherPersons" object file lineNumber description];

  id v12 = v64;
LABEL_3:
  if (!v93)
  {
    id v66 = v12;
    v67 = [MEMORY[0x263F08690] currentHandler];
    [v67 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupOverlaps.m", 103, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

    id v12 = v66;
  }
  v77 = (void (**)(void, void, void))v12;
  if (!v12)
  {
    v68 = [MEMORY[0x263F08690] currentHandler];
    [v68 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupOverlaps.m", 104, @"Invalid parameter not satisfying: %@", @"resultBlock" object file lineNumber description];
  }
  v13 = (void *)[v10 mutableCopy];
  [v13 unionSet:v11];
  v90 = [MEMORY[0x263EFF9A0] dictionary];
  v14 = [(PNPersonDeduperStep *)self delegate];
  v15 = [(PNPersonDeduperStep *)self personClusterManager];
  v74 = v13;
  v16 = [v14 performSocialGroupsIdentifiersWithPersonClusterManager:v15 forPersons:v13 overTheYearsComputation:0 updateBlock:v93];

  v17 = (void *)[v16 mutableCopy];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v18 = v16;
  uint64_t v70 = [v18 countByEnumeratingWithState:&v107 objects:v114 count:16];
  if (v70)
  {
    uint64_t v19 = *(void *)v108;
    id v80 = v11;
    id v82 = v10;
    v78 = v17;
    v84 = v18;
    uint64_t v69 = *(void *)v108;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v108 != v19)
        {
          uint64_t v21 = v20;
          objc_enumerationMutation(v18);
          uint64_t v20 = v21;
        }
        uint64_t v72 = v20;
        v22 = *(void **)(*((void *)&v107 + 1) + 8 * v20);
        v75 = (void *)MEMORY[0x25A2E0AC0]();
        [v17 removeObject:v22];
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id obj = v17;
        uint64_t v23 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
        v24 = self;
        if (v23)
        {
          uint64_t v25 = v23;
          uint64_t v26 = *(void *)v104;
          uint64_t v86 = *(void *)v104;
          while (2)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v104 != v26) {
                objc_enumerationMutation(obj);
              }
              v28 = *(void **)(*((void *)&v103 + 1) + 8 * i);
              if ([(PNPersonDeduperStep *)v24 shouldStopWithUpdateBlock:v93])
              {

                id v10 = v82;
                id v18 = v84;
                v42 = v84;
                v17 = v78;
                id v11 = v80;
                goto LABEL_53;
              }
              v29 = (void *)[v22 mutableCopy];
              [v29 intersectSet:v28];
              unint64_t v30 = [v22 count];
              unint64_t v31 = [v28 count];
              if (v30 >= v31) {
                unint64_t v32 = v31;
              }
              else {
                unint64_t v32 = v30;
              }
              unint64_t v33 = vcvtmd_u64_f64((double)v32 * 0.5);
              if (v33 <= 2) {
                unint64_t v34 = 2;
              }
              else {
                unint64_t v34 = v33;
              }
              if ([v29 count] >= v34)
              {
                contexta = (void *)MEMORY[0x25A2E0AC0]();
                uint64_t v35 = v25;
                v36 = (void *)[v22 mutableCopy];
                [v36 unionSet:v28];
                v37 = [(PNPersonDeduperStep *)v24 personClusterManager];
                v38 = [v36 allObjects];
                v39 = objc_msgSend(v37, "pn_fetchPersonsWithLocalIdentifiers:", v38);

                v40 = (void *)[v22 mutableCopy];
                [v40 minusSet:v29];
                [(PNPersonDeduperSocialGroupOverlaps *)self mergePersons:v40 otherPersonLocalIdentifiers:v28 personsFetchResult:v39 mergeSocialGroupPersonIdentifiers:v90];
                v41 = (void *)[v28 mutableCopy];

                [v41 minusSet:v29];
                [(PNPersonDeduperSocialGroupOverlaps *)self mergePersons:v41 otherPersonLocalIdentifiers:v22 personsFetchResult:v39 mergeSocialGroupPersonIdentifiers:v90];

                v24 = self;
                uint64_t v25 = v35;
                uint64_t v26 = v86;
              }
            }
            uint64_t v25 = [obj countByEnumeratingWithState:&v103 objects:v113 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        uint64_t v20 = v72 + 1;
        id v11 = v80;
        id v10 = v82;
        v17 = v78;
        id v18 = v84;
        uint64_t v19 = v69;
      }
      while (v72 + 1 != v70);
      uint64_t v70 = [v84 countByEnumeratingWithState:&v107 objects:v114 count:16];
    }
    while (v70);
  }

  v42 = (void *)[v11 mutableCopy];
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id v43 = v10;
  uint64_t v73 = [v43 countByEnumeratingWithState:&v99 objects:v112 count:16];
  if (v73)
  {
    uint64_t v44 = *(void *)v100;
    id v81 = v11;
    id v83 = v10;
    v79 = v17;
    id v85 = v18;
    v87 = v42;
    id obja = v43;
    uint64_t v71 = *(void *)v100;
    do
    {
      v45 = 0;
      do
      {
        if (*(void *)v100 != v44) {
          objc_enumerationMutation(v43);
        }
        v76 = v45;
        v46 = *(void **)(*((void *)&v99 + 1) + 8 * (void)v45);
        context = (void *)MEMORY[0x25A2E0AC0]();
        [v42 removeObject:v46];
        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v47 = v42;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v95 objects:v111 count:16];
        if (v48)
        {
          uint64_t v49 = v48;
          uint64_t v50 = *(void *)v96;
          while (2)
          {
            uint64_t v51 = 0;
            v52 = self;
            do
            {
              if (*(void *)v96 != v50) {
                objc_enumerationMutation(v47);
              }
              v53 = *(void **)(*((void *)&v95 + 1) + 8 * v51);
              if ([(PNPersonDeduperStep *)v52 shouldStop]
                || [(PNPersonDeduperStep *)v52 shouldStopWithUpdateBlock:v93])
              {

                id v11 = v81;
                id v10 = v83;
                v17 = v79;
                id v18 = v85;
                v42 = v87;
                v59 = obja;
                goto LABEL_52;
              }
              v54 = [v46 localIdentifier];
              v55 = [v90 objectForKeyedSubscript:v54];
              v56 = [v53 localIdentifier];
              int v57 = [v55 containsObject:v56];

              v52 = self;
              if (v57)
              {
                v58 = (void *)MEMORY[0x25A2E0AC0]();
                [(PNPersonDeduperStep *)self addPotentialMergeCandidateForPerson:v46 withOtherPerson:v53 updateBlock:v93];
              }
              ++v51;
            }
            while (v49 != v51);
            uint64_t v49 = [v47 countByEnumeratingWithState:&v95 objects:v111 count:16];
            id v11 = v81;
            id v10 = v83;
            v17 = v79;
            v42 = v87;
            if (v49) {
              continue;
            }
            break;
          }
        }

        v45 = v76 + 1;
        uint64_t v44 = v71;
        id v18 = v85;
        id v43 = obja;
      }
      while (v76 + 1 != (char *)v73);
      uint64_t v73 = [obja countByEnumeratingWithState:&v99 objects:v112 count:16];
    }
    while (v73);
  }

  if (![(PNPersonDeduperStep *)self shouldStop])
  {
    v59 = [(PNPersonDeduperStep *)self mergeCandidatePersonsWithUpdateBlock:v93];
    v60 = (void *)[v43 mutableCopy];
    v61 = (void *)[v11 mutableCopy];
    [v60 minusSet:v59];
    [v61 minusSet:v59];
    ((void (**)(void, void *, void *))v77)[2](v77, v60, v61);

LABEL_52:
  }
LABEL_53:
}

- (void)mergePersons:(id)a3 otherPersonLocalIdentifiers:(id)a4 personsFetchResult:(id)a5 mergeSocialGroupPersonIdentifiers:(id)a6
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 count] && objc_msgSend(v10, "count"))
  {
    v13 = objc_opt_new();
    uint64_t v49 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v43 = v11;
    id v14 = v11;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v62 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend(v19, "localIdentifier", v43);
          char v21 = [v9 containsObject:v20];
          v22 = v13;
          if ((v21 & 1) != 0 || (int v23 = [v10 containsObject:v20], v22 = v49, v23)) {
            [v22 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v16);
    }
    id v44 = v10;
    id v45 = v9;

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v13;
    uint64_t v48 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v48)
    {
      uint64_t v47 = *(void *)v58;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v58 != v47) {
            objc_enumerationMutation(obj);
          }
          uint64_t v51 = v24;
          uint64_t v25 = *(void **)(*((void *)&v57 + 1) + 8 * v24);
          context = (void *)MEMORY[0x25A2E0AC0]();
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v52 = v49;
          uint64_t v26 = [v52 countByEnumeratingWithState:&v53 objects:v65 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v54;
            do
            {
              for (uint64_t j = 0; j != v27; ++j)
              {
                if (*(void *)v54 != v28) {
                  objc_enumerationMutation(v52);
                }
                unint64_t v30 = *(void **)(*((void *)&v53 + 1) + 8 * j);
                unint64_t v31 = objc_msgSend(v30, "localIdentifier", v43);
                unint64_t v32 = [v25 localIdentifier];
                char v33 = [v31 isEqualToString:v32];

                if ((v33 & 1) == 0)
                {
                  unint64_t v34 = (void *)MEMORY[0x25A2E0AC0]();
                  uint64_t v35 = [v25 localIdentifier];
                  v36 = [v12 objectForKeyedSubscript:v35];

                  if (!v36)
                  {
                    v36 = [MEMORY[0x263EFF980] array];
                    v37 = [v25 localIdentifier];
                    [v12 setObject:v36 forKeyedSubscript:v37];
                  }
                  v38 = [v30 localIdentifier];
                  [v36 addObject:v38];

                  v39 = [v30 localIdentifier];
                  v40 = [v12 objectForKeyedSubscript:v39];

                  if (!v40)
                  {
                    v40 = [MEMORY[0x263EFF980] array];
                    v41 = [v30 localIdentifier];
                    [v12 setObject:v40 forKeyedSubscript:v41];
                  }
                  v42 = [v25 localIdentifier];
                  [v40 addObject:v42];
                }
              }
              uint64_t v27 = [v52 countByEnumeratingWithState:&v53 objects:v65 count:16];
            }
            while (v27);
          }

          uint64_t v24 = v51 + 1;
        }
        while (v51 + 1 != v48);
        uint64_t v48 = [obj countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v48);
    }

    id v10 = v44;
    id v9 = v45;
    id v11 = v43;
  }
}

- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  id v9 = [(PNPersonDeduperStep *)self profile];
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
  v2 = @"numberOfGraphMergeCandidatesAddedBySocialGroupOverlapStep";
  return @"numberOfGraphMergeCandidatesAddedBySocialGroupOverlapStep";
}

- (id)name
{
  return @"Social Group Overlaps";
}

@end