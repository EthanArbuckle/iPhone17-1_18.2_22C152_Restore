@interface PNPersonDeduperSocialGroupTimeWarpingStep
- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6;
- (id)metricsKey;
- (id)name;
- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6;
@end

@implementation PNPersonDeduperSocialGroupTimeWarpingStep

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_45:
    v56 = [MEMORY[0x263F08690] currentHandler];
    [v56 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupTimeWarpingStep.m", 56, @"Invalid parameter not satisfying: %@", @"otherPersons" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_46;
  }
  v55 = [MEMORY[0x263F08690] currentHandler];
  [v55 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupTimeWarpingStep.m", 55, @"Invalid parameter not satisfying: %@", @"verifiedPersons" object file lineNumber description];

  if (!v12) {
    goto LABEL_45;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_46:
  v57 = [MEMORY[0x263F08690] currentHandler];
  [v57 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupTimeWarpingStep.m", 57, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

LABEL_4:
  v69 = (void (**)(void, void, void))v14;
  if (!v14)
  {
    v58 = [MEMORY[0x263F08690] currentHandler];
    [v58 handleFailureInMethod:a2, self, @"PNPersonDeduperSocialGroupTimeWarpingStep.m", 58, @"Invalid parameter not satisfying: %@", @"resultBlock" object file lineNumber description];
  }
  SEL v61 = a2;
  v70 = v12;
  v15 = [v11 setByAddingObjectsFromSet:v12];
  v16 = [(PNPersonDeduperStep *)self delegate];
  v76 = self;
  v17 = [(PNPersonDeduperStep *)self personClusterManager];
  v18 = [v16 performSocialGroupsIdentifiersWithPersonClusterManager:v17 forPersons:v15 overTheYearsComputation:1 updateBlock:v13];

  v19 = objc_opt_new();
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v20 = v15;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v91 objects:v97 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v92 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        v26 = [v25 localIdentifier];
        [v19 setObject:v25 forKeyedSubscript:v26];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v91 objects:v97 count:16];
    }
    while (v22);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PNPersonDeduperSocialGroupTimeWarpingStep_dedupePersons_withOtherPersons_updateBlock_resultBlock___block_invoke;
  aBlock[3] = &unk_26544F3C8;
  id v67 = v19;
  v27 = v76;
  id v87 = v67;
  v88 = v76;
  id v77 = v13;
  id v90 = v77;
  id v28 = v11;
  id v89 = v28;
  v29 = (void (**)(void, void *, void *))_Block_copy(aBlock);
  unint64_t v30 = [v18 count];
  v31 = (void *)[v18 mutableCopy];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v32 = v18;
  v73 = v29;
  uint64_t v63 = [v32 countByEnumeratingWithState:&v82 objects:v96 count:16];
  v71 = v31;
  if (v63)
  {
    uint64_t v33 = *(void *)v83;
    float v34 = (float)v30;
    unint64_t v72 = 0;
    id v65 = v32;
    id v66 = v28;
    uint64_t v62 = *(void *)v83;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v83 != v33) {
          objc_enumerationMutation(v32);
        }
        uint64_t v64 = v35;
        v36 = *(void **)(*((void *)&v82 + 1) + 8 * v35);
        v68 = (void *)MEMORY[0x25A2E0AC0]();
        *(float *)&double v37 = (float)v72 / v34;
        [(PNPersonDeduperStep *)v27 setProgress:v37];
        [v31 removeObject:v36];
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        obuint64_t j = v31;
        uint64_t v38 = [obj countByEnumeratingWithState:&v78 objects:v95 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          uint64_t v40 = *(void *)v79;
          while (2)
          {
            for (uint64_t j = 0; j != v39; ++j)
            {
              if (*(void *)v79 != v40) {
                objc_enumerationMutation(obj);
              }
              v42 = *(void **)(*((void *)&v78 + 1) + 8 * j);
              if ([(PNPersonDeduperStep *)v27 shouldStop]
                || [(PNPersonDeduperStep *)v27 shouldStopWithUpdateBlock:v77])
              {

                id v32 = v65;
                id v28 = v66;
                v52 = v65;
                v29 = v73;
                goto LABEL_42;
              }
              v43 = (void *)[v36 mutableCopy];
              [v43 intersectSet:v42];
              unint64_t v44 = [v36 count];
              unint64_t v45 = [v42 count];
              if (v44 >= v45) {
                unint64_t v46 = v45;
              }
              else {
                unint64_t v46 = v44;
              }
              unint64_t v47 = vcvtmd_u64_f64((double)v46 * 0.5);
              if (v47 <= 2) {
                unint64_t v48 = 2;
              }
              else {
                unint64_t v48 = v47;
              }
              if ([v43 count] >= v48)
              {
                context = (void *)MEMORY[0x25A2E0AC0]();
                v49 = (void *)[v36 mutableCopy];
                [v49 minusSet:v43];
                v73[2](v73, v49, v42);
                v50 = (void *)[v42 mutableCopy];

                [v50 minusSet:v43];
                v73[2](v73, v50, v36);
              }

              v27 = v76;
            }
            uint64_t v39 = [obj countByEnumeratingWithState:&v78 objects:v95 count:16];
            id v32 = v65;
            id v28 = v66;
            if (v39) {
              continue;
            }
            break;
          }
        }
        ++v72;

        uint64_t v35 = v64 + 1;
        v31 = v71;
        uint64_t v33 = v62;
        v29 = v73;
      }
      while (v64 + 1 != v63);
      uint64_t v63 = [v32 countByEnumeratingWithState:&v82 objects:v96 count:16];
    }
    while (v63);
  }

  v51 = v70;
  if (![(PNPersonDeduperStep *)v27 shouldStop])
  {
    v52 = [(PNPersonDeduperStep *)v27 mergeCandidatePersonsWithUpdateBlock:v77];
    v53 = (void *)[v28 mutableCopy];
    if ([v53 intersectsSet:v52])
    {
      [MEMORY[0x263F08690] currentHandler];
      v60 = id v59 = v32;
      [v60 handleFailureInMethod:v61 object:v27 file:@"PNPersonDeduperSocialGroupTimeWarpingStep.m" lineNumber:139 description:@"Cannot dedup verified persons"];

      id v32 = v59;
      v29 = v73;
    }
    v54 = (void *)[v70 mutableCopy];
    [v54 minusSet:v52];
    ((void (**)(void, void *, void *))v69)[2](v69, v53, v54);

LABEL_42:
    v51 = v70;
  }
}

void __100__PNPersonDeduperSocialGroupTimeWarpingStep_dedupePersons_withOtherPersons_updateBlock_resultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  uint64_t v20 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v20)
  {
    uint64_t v8 = *(void *)v27;
    id v21 = v6;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v7);
        }
        v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v6;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * j);
              if (([*(id *)(a1 + 40) shouldStop] & 1) != 0
                || ([*(id *)(a1 + 40) shouldStopWithUpdateBlock:*(void *)(a1 + 56)] & 1) != 0)
              {

                id v6 = v21;
                goto LABEL_22;
              }
              v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v16];
              if (![*(id *)(a1 + 48) containsObject:v10]
                || ([*(id *)(a1 + 48) containsObject:v17] & 1) == 0)
              {
                v18 = (void *)MEMORY[0x25A2E0AC0]();
                [*(id *)(a1 + 40) addPotentialMergeCandidateForPerson:v10 withOtherPerson:v17 updateBlock:*(void *)(a1 + 56)];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
            id v6 = v21;
            uint64_t v8 = v19;
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v20 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v20);
  }
LABEL_22:
}

- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  v9 = [(PNPersonDeduperStep *)self profile];
  char v10 = [v9 shouldRelaxThreshold];
  id v11 = [(PNPersonDeduperStep *)self profile];
  uint64_t v12 = v11;
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
  v2 = @"numberOfGraphMergeCandidatesAddedBySocialGroupTimeWarpingStep";
  return @"numberOfGraphMergeCandidatesAddedBySocialGroupTimeWarpingStep";
}

- (id)name
{
  return @"Social Group Time Warping";
}

@end