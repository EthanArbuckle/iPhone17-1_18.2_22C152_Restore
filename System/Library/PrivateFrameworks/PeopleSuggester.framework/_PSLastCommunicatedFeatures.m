@interface _PSLastCommunicatedFeatures
+ (double)timeIntervalSinceNowForInteraction:(id)a3;
+ (id)featureValueFromTimeInterval:(double)a3;
+ (id)lastCommunicationFromCandidates:(id)a3 direction:(int64_t)a4 mechanisms:(id)a5 caches:(id)a6;
+ (id)lastInteractionFromCandidate:(id)a3 caches:(id)a4 direction:(int64_t)a5 mechanisms:(id)a6;
+ (id)recipientDetailsFromContact:(id)a3;
+ (int)bucketFromTimeInterval:(double)a3;
@end

@implementation _PSLastCommunicatedFeatures

+ (id)lastCommunicationFromCandidates:(id)a3 direction:(int64_t)a4 mechanisms:(id)a5 caches:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = [a3 allObjects];
  v12 = [_PSFeatureDictionary alloc];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91___PSLastCommunicatedFeatures_lastCommunicationFromCandidates_direction_mechanisms_caches___block_invoke;
  v18[3] = &unk_1E5AE1088;
  id v20 = v9;
  int64_t v21 = a4;
  id v19 = v10;
  id v13 = v9;
  id v14 = v10;
  v15 = objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v18);
  v16 = [(_PSFeatureDictionary *)v12 initWithObjects:v15 forKeys:v11];

  return v16;
}

+ (id)lastInteractionFromCandidate:(id)a3 caches:(id)a4 direction:(int64_t)a5 mechanisms:(id)a6
{
  int64_t v95 = a5;
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v85 = a6;
  _PSShareSheetSuggestionBundleIDMapping(0);
  id v74 = (id)objc_claimAutoreleasedReturnValue();
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id v10 = v9;
  id v80 = v10;
  v93 = (char *)[v10 countByEnumeratingWithState:&v116 objects:v125 count:16];
  if (v93)
  {
    v11 = 0;
    id v92 = *(id *)v117;
    do
    {
      v12 = 0;
      do
      {
        if (*(id *)v117 != v92) {
          objc_enumerationMutation(v80);
        }
        v94 = v12;
        id v13 = *(void **)(*((void *)&v116 + 1) + 8 * (void)v12);
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v14 = v85;
        uint64_t v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v112, v124, 16, v74);
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v113;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v113 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = [*(id *)(*((void *)&v112 + 1) + 8 * i) integerValue];
              id v20 = [v8 candidateIdentifier];
              int64_t v21 = [v13 mostRecentInteractionForCandidateIdentifier:v20 direction:v95 mechanism:v19];

              if (!v11 || v21 && _CDStartDateCompare() == -1)
              {
                id v22 = v21;

                v11 = v22;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v112 objects:v124 count:16];
          }
          while (v16);
        }

        v12 = v94 + 1;
      }
      while (v94 + 1 != v93);
      v93 = (char *)[v80 countByEnumeratingWithState:&v116 objects:v125 count:16];
    }
    while (v93);

    if (v11) {
      goto LABEL_85;
    }
  }
  else
  {
  }
  id v84 = v8;
  v93 = v73;
  memset(v73, 0, 21);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v23 = v85;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v108 objects:v123 count:16];
  id v25 = v80;
  if (v24)
  {
    uint64_t v26 = v24;
    uint64_t v27 = *(void *)v109;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v109 != v27) {
          objc_enumerationMutation(v23);
        }
        unint64_t v29 = [*(id *)(*((void *)&v108 + 1) + 8 * j) integerValue];
        if ((v29 & 0x8000000000000000) != 0 || v29 >= 0x15) {
          __break(1u);
        }
        v93[v29] = 1;
      }
      uint64_t v26 = [v23 countByEnumeratingWithState:&v108 objects:v123 count:16];
    }
    while (v26);
  }

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  id v77 = v25;
  uint64_t v30 = [v77 countByEnumeratingWithState:&v104 objects:v122 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    v11 = 0;
    uint64_t v32 = *(void *)v105;
    id v8 = v84;
    uint64_t v75 = *(void *)v105;
    do
    {
      uint64_t v33 = 0;
      uint64_t v76 = v31;
      do
      {
        if (*(void *)v105 != v32) {
          objc_enumerationMutation(v77);
        }
        v34 = *(void **)(*((void *)&v104 + 1) + 8 * v33);
        v88 = (void *)MEMORY[0x1A6243860]();
        v35 = [v8 candidateIdentifier];
        v36 = [v34 mostRecentInteractionForCandidateIdentifier:v35 direction:v95];

        if (v36)
        {
          v82 = v36;
          uint64_t v37 = [v36 recipients];
          v38 = (void *)v37;
          v39 = (void *)MEMORY[0x1E4F1CBF0];
          if (v37) {
            v39 = (void *)v37;
          }
          id v40 = v39;

          v41 = [v11 sender];

          if (v41)
          {
            v42 = [v11 sender];
            uint64_t v43 = [v40 arrayByAddingObject:v42];

            v44 = (void *)v43;
          }
          else
          {
            v44 = v40;
          }
          id v81 = v44;
          v45 = +[_PSLastCommunicatedFeatures recipientDetailsFromContact:](_PSLastCommunicatedFeatures, "recipientDetailsFromContact:");
          if (v45)
          {
            uint64_t v79 = v33;
            v46 = v45;
            id v90 = [v45 objectForKeyedSubscript:@"identifierSet"];
            v78 = v46;
            id v83 = [v46 objectForKeyedSubscript:@"personIdSet"];
            v47 = objc_opt_new();
            v48 = objc_opt_new();
            long long v100 = 0u;
            long long v101 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            v49 = [v34 interactions];
            uint64_t v50 = [v49 countByEnumeratingWithState:&v100 objects:v121 count:16];
            if (v50)
            {
              uint64_t v51 = v50;
              uint64_t v52 = *(void *)v101;
              uint64_t v86 = *(void *)v101;
              v87 = v49;
              while (2)
              {
                uint64_t v53 = 0;
                uint64_t v89 = v51;
                do
                {
                  if (*(void *)v101 != v52) {
                    objc_enumerationMutation(v49);
                  }
                  v54 = *(void **)(*((void *)&v100 + 1) + 8 * v53);
                  v94 = (char *)MEMORY[0x1A6243860]();
                  if (v11 && _CDStartDateCompare() != -1) {
                    goto LABEL_77;
                  }
                  uint64_t v55 = [v54 direction];
                  if (v55 == v95 && (unint64_t)[v54 mechanism] <= 0x14)
                  {
                    uint64_t v56 = [v54 mechanism];
                    if (v93[v56])
                    {
                      uint64_t v91 = v53;
                      [v47 removeAllObjects];
                      [v48 removeAllObjects];
                      long long v98 = 0u;
                      long long v99 = 0u;
                      long long v96 = 0u;
                      long long v97 = 0u;
                      id v92 = v54;
                      v57 = [v54 recipients];
                      uint64_t v58 = [v57 countByEnumeratingWithState:&v96 objects:v120 count:16];
                      if (v58)
                      {
                        uint64_t v59 = v58;
                        uint64_t v60 = *(void *)v97;
                        do
                        {
                          for (uint64_t k = 0; k != v59; ++k)
                          {
                            if (*(void *)v97 != v60) {
                              objc_enumerationMutation(v57);
                            }
                            v62 = *(void **)(*((void *)&v96 + 1) + 8 * k);
                            v63 = [v62 identifier];
                            if (v63) {
                              [v47 addObject:v63];
                            }
                            v64 = [v62 personId];
                            if (v64) {
                              [v48 addObject:v64];
                            }
                          }
                          uint64_t v59 = [v57 countByEnumeratingWithState:&v96 objects:v120 count:16];
                        }
                        while (v59);
                      }

                      id v65 = v92;
                      v66 = [v92 sender];
                      v67 = v66;
                      id v8 = v84;
                      if (v66)
                      {
                        v68 = [v66 identifier];
                        if (v68) {
                          [v47 addObject:v68];
                        }
                        v69 = [v67 personId];
                        if (v69) {
                          [v48 addObject:v69];
                        }
                      }
                      if ([v47 isEqual:v90]
                        && ([v48 isEqual:v83] & 1) != 0)
                      {
                        id v70 = v65;

                        v11 = v70;
                        v49 = v87;
LABEL_77:
                        goto LABEL_78;
                      }

                      uint64_t v52 = v86;
                      v49 = v87;
                      uint64_t v51 = v89;
                      uint64_t v53 = v91;
                    }
                  }
                  ++v53;
                }
                while (v53 != v51);
                uint64_t v51 = [v49 countByEnumeratingWithState:&v100 objects:v121 count:16];
                if (v51) {
                  continue;
                }
                break;
              }
            }
LABEL_78:

            uint64_t v32 = v75;
            uint64_t v31 = v76;
            v45 = v78;
            uint64_t v33 = v79;
          }

          v36 = v82;
        }

        ++v33;
      }
      while (v33 != v31);
      uint64_t v31 = [v77 countByEnumeratingWithState:&v104 objects:v122 count:16];
    }
    while (v31);
  }
  else
  {
    v11 = 0;
    id v8 = v84;
  }

LABEL_85:
  id v71 = v11;

  return v71;
}

+ (double)timeIntervalSinceNowForInteraction:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  if (v3)
  {
    v7 = [v3 endDate];

    if (v7)
    {
      id v8 = [v3 endDate];
      [v8 timeIntervalSinceNow];
      double v6 = v9;
    }
  }

  return v6;
}

+ (id)featureValueFromTimeInterval:(double)a3
{
  uint64_t v4 = +[_PSLastCommunicatedFeatures bucketFromTimeInterval:](_PSLastCommunicatedFeatures, "bucketFromTimeInterval:");
  id v5 = objc_alloc(MEMORY[0x1E4F4FEE8]);
  double v6 = [NSNumber numberWithDouble:a3];
  v7 = (void *)[v5 initWithIntValue:0 doubleValue:v6 stringValue:0 BOOLValue:0 timeBucketValue:v4];

  return v7;
}

+ (int)bucketFromTimeInterval:(double)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  id v5 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  double v6 = (void *)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v7 setMonth:-1];
  id v8 = [v6 dateByAddingComponents:v7 toDate:v4 options:0];
  [v8 timeIntervalSinceNow];
  double v10 = v9;

  id v11 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v11 setMonth:-3];
  v12 = [v6 dateByAddingComponents:v11 toDate:v4 options:0];
  [v12 timeIntervalSinceNow];
  double v14 = v13;

  id v15 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v15 setMonth:-6];
  uint64_t v16 = [v6 dateByAddingComponents:v15 toDate:v4 options:0];
  [v16 timeIntervalSinceNow];
  double v18 = v17;

  id v19 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v15 setYear:-1];
  id v20 = [v6 dateByAddingComponents:v19 toDate:v4 options:0];
  [v20 timeIntervalSinceNow];
  double v22 = v21;

  double v23 = fabs(a3);
  if (v23 >= 120.0)
  {
    if (v23 >= 300.0)
    {
      if (v23 >= 600.0)
      {
        if (v23 >= 1800.0)
        {
          if (v23 >= 3600.0)
          {
            if (v23 >= 7200.0)
            {
              if (v23 >= 14400.0)
              {
                if (v23 >= 21600.0)
                {
                  if (v23 >= 43200.0)
                  {
                    if (v23 >= 86400.0)
                    {
                      if (v23 >= 172800.0)
                      {
                        if (v23 >= 259200.0)
                        {
                          if (v23 >= 345600.0)
                          {
                            if (v23 >= 432000.0)
                            {
                              if (v23 >= 518400.0)
                              {
                                if (v23 >= 604800.0)
                                {
                                  if (v23 >= fabs(v10))
                                  {
                                    if (v23 >= fabs(v14))
                                    {
                                      if (v23 >= fabs(v18))
                                      {
                                        double v25 = fabs(v22);
                                        if (v23 >= v25)
                                        {
                                          if (v23 >= v25 * 5.0) {
                                            int v24 = 22;
                                          }
                                          else {
                                            int v24 = 21;
                                          }
                                        }
                                        else
                                        {
                                          int v24 = 20;
                                        }
                                      }
                                      else
                                      {
                                        int v24 = 19;
                                      }
                                    }
                                    else
                                    {
                                      int v24 = 18;
                                    }
                                  }
                                  else
                                  {
                                    int v24 = 17;
                                  }
                                }
                                else
                                {
                                  int v24 = 16;
                                }
                              }
                              else
                              {
                                int v24 = 15;
                              }
                            }
                            else
                            {
                              int v24 = 14;
                            }
                          }
                          else
                          {
                            int v24 = 13;
                          }
                        }
                        else
                        {
                          int v24 = 12;
                        }
                      }
                      else
                      {
                        int v24 = 11;
                      }
                    }
                    else
                    {
                      int v24 = 10;
                    }
                  }
                  else
                  {
                    int v24 = 9;
                  }
                }
                else
                {
                  int v24 = 8;
                }
              }
              else
              {
                int v24 = 7;
              }
            }
            else
            {
              int v24 = 6;
            }
          }
          else
          {
            int v24 = 5;
          }
        }
        else
        {
          int v24 = 4;
        }
      }
      else
      {
        int v24 = 3;
      }
    }
    else
    {
      int v24 = 2;
    }
  }
  else
  {
    int v24 = 1;
  }

  return v24;
}

+ (id)recipientDetailsFromContact:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_opt_new();
    id v5 = objc_opt_new();
    double v6 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          double v13 = objc_msgSend(v12, "identifier", (void)v18);

          if (v13)
          {
            double v14 = [v12 identifier];
            [v5 addObject:v14];
          }
          id v15 = [v12 personId];

          if (v15)
          {
            uint64_t v16 = [v12 personId];
            [v6 addObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v4 setObject:v5 forKeyedSubscript:@"identifierSet"];
    [v4 setObject:v6 forKeyedSubscript:@"personIdSet"];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end