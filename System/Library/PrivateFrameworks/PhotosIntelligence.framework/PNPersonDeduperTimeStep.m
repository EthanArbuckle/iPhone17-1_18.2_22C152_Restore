@interface PNPersonDeduperTimeStep
- (BOOL)isPersonSimilar:(id)a3 withOtherPerson:(id)a4 withDistance:(float)a5 minAgeType:(unsigned __int16)a6;
- (id)metricsKey;
- (id)name;
- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6;
@end

@implementation PNPersonDeduperTimeStep

- (void)dedupePersons:(id)a3 withOtherPersons:(id)a4 updateBlock:(id)a5 resultBlock:(id)a6
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, id, void *))a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v48 = [MEMORY[0x263F08690] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"PNPersonDeduperTimeStep.m", 53, @"Invalid parameter not satisfying: %@", @"persons" object file lineNumber description];

    if (v12)
    {
LABEL_3:
      if (v13) {
        goto LABEL_4;
      }
LABEL_45:
      v50 = [MEMORY[0x263F08690] currentHandler];
      [v50 handleFailureInMethod:a2, self, @"PNPersonDeduperTimeStep.m", 55, @"Invalid parameter not satisfying: %@", @"updateBlock" object file lineNumber description];

      if (v14) {
        goto LABEL_5;
      }
      goto LABEL_46;
    }
  }
  v49 = [MEMORY[0x263F08690] currentHandler];
  [v49 handleFailureInMethod:a2, self, @"PNPersonDeduperTimeStep.m", 54, @"Invalid parameter not satisfying: %@", @"otherPersons" object file lineNumber description];

  if (!v13) {
    goto LABEL_45;
  }
LABEL_4:
  if (v14) {
    goto LABEL_5;
  }
LABEL_46:
  v51 = [MEMORY[0x263F08690] currentHandler];
  [v51 handleFailureInMethod:a2, self, @"PNPersonDeduperTimeStep.m", 56, @"Invalid parameter not satisfying: %@", @"resultBlock" object file lineNumber description];

LABEL_5:
  v15 = +[PNPersonClusterManager personProcessingSortDescriptors];
  v16 = [v11 sortedArrayUsingDescriptors:v15];
  v17 = [v12 sortedArrayUsingDescriptors:v15];
  v66 = [MEMORY[0x263EFF9C0] set];
  v65 = (void *)[v16 mutableCopy];
  unint64_t v18 = [v11 count];
  unint64_t v19 = [v12 count];
  if (v18 <= v19) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  v62 = v17;
  if (v20)
  {
    unint64_t v60 = 0;
    float v21 = (float)v20;
    v63 = v16;
    v64 = v15;
    unint64_t v52 = v20;
    while (1)
    {
      v22 = (void *)[v17 mutableCopy];
      v23 = v66;
      if ([v66 count])
      {
        v24 = [v66 allObjects];
        [v22 removeObjectsInArray:v24];
        [v65 removeObjectsInArray:v24];
      }
      v61 = v22;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v25 = v65;
      v16 = v63;
      v15 = v64;
      uint64_t v54 = [v25 countByEnumeratingWithState:&v71 objects:v80 count:16];
      if (v54)
      {
        uint64_t v26 = *(void *)v72;
        float v27 = 0.0;
        float v28 = 0.0;
        id v57 = v12;
        id v58 = v11;
        v56 = v14;
        v59 = v25;
        uint64_t v53 = *(void *)v72;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v72 != v26)
            {
              uint64_t v30 = v29;
              objc_enumerationMutation(v25);
              uint64_t v29 = v30;
            }
            uint64_t v55 = v29;
            uint64_t v31 = *(void *)(*((void *)&v71 + 1) + 8 * v29);
            [v61 removeObject:v31];
            long long v69 = 0u;
            long long v70 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            id v32 = v61;
            uint64_t v33 = [v32 countByEnumeratingWithState:&v67 objects:v79 count:16];
            if (v33)
            {
              uint64_t v34 = v33;
              uint64_t v35 = *(void *)v68;
              while (2)
              {
                for (uint64_t i = 0; i != v34; ++i)
                {
                  if (*(void *)v68 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v37 = *(void *)(*((void *)&v67 + 1) + 8 * i);
                  v38 = (void *)MEMORY[0x25A2E0AC0]();
                  *(float *)&double v39 = (float)((float)(v28 * v27) + (float)(v21 * (float)v60))
                                 / (float)(v21 * (float)(v60 + 2));
                  [(PNPersonDeduperStep *)self setProgress:v39];
                  if ([(PNPersonDeduperStep *)self shouldStop]
                    || [(PNPersonDeduperStep *)self shouldStopWithUpdateBlock:v13])
                  {

                    id v12 = v57;
                    id v11 = v58;
                    v14 = v56;
                    v16 = v63;
                    v15 = v64;
                    v23 = v66;
                    v45 = v59;
                    goto LABEL_40;
                  }
                  v40 = (void *)MEMORY[0x25A2E0AC0]();
                  [(PNPersonDeduperStep *)self addPotentialMergeCandidateForPerson:v31 withOtherPerson:v37 updateBlock:v13];
                  float v27 = v27 + 1.0;
                }
                uint64_t v34 = [v32 countByEnumeratingWithState:&v67 objects:v79 count:16];
                id v12 = v57;
                id v11 = v58;
                v14 = v56;
                v23 = v66;
                if (v34) {
                  continue;
                }
                break;
              }
            }

            float v28 = v28 + 1.0;
            uint64_t v29 = v55 + 1;
            v16 = v63;
            v15 = v64;
            v17 = v62;
            id v25 = v59;
            uint64_t v26 = v53;
          }
          while (v55 + 1 != v54);
          uint64_t v41 = [v59 countByEnumeratingWithState:&v71 objects:v80 count:16];
          uint64_t v26 = v53;
          uint64_t v54 = v41;
        }
        while (v41);
      }

      if ([(PNPersonDeduperStep *)self shouldStop]) {
        break;
      }
      v42 = [(PNPersonDeduperStep *)self mergeCandidatePersonsWithUpdateBlock:v13];
      if ([v42 count] && !-[PNPersonDeduperStep shouldStop](self, "shouldStop"))
      {
        [v23 unionSet:v42];
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v44 = [v42 count];
          *(_DWORD *)buf = 136315394;
          v76 = "-[PNPersonDeduperTimeStep dedupePersons:withOtherPersons:updateBlock:resultBlock:]";
          __int16 v77 = 2048;
          uint64_t v78 = v44;
          _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "%s: Merged %lu persons -------- Re-running.", buf, 0x16u);
        }
        int v43 = 1;
      }
      else
      {
        int v43 = 0;
      }

      if (v43)
      {
        if (++v60 < v52) {
          continue;
        }
      }
      goto LABEL_39;
    }
    v47 = v65;
    v46 = v61;
  }
  else
  {
LABEL_39:
    id v32 = (id)[v11 mutableCopy];
    v45 = (void *)[v12 mutableCopy];
    v23 = v66;
    [v32 minusSet:v66];
    [v45 minusSet:v66];
    v14[2](v14, v32, v45);
LABEL_40:

    v46 = v32;
    v17 = v62;
    v47 = v65;
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
    [v11 normalMaximumDistance];
  }
  else {
    [v11 strictMaximumDistance];
  }
  double v14 = v13;

  *(float *)&double v14 = v14;
  LODWORD(v15) = LODWORD(v14);
  [(PNPersonDeduperStep *)self adjustedThreshold:v6 forMinAgeType:v15];
  return v16 > a5;
}

- (id)metricsKey
{
  v2 = @"numberOfGraphMergeCandidatesAddedByTimeStep";
  return @"numberOfGraphMergeCandidatesAddedByTimeStep";
}

- (id)name
{
  return @"Time Deduping";
}

@end