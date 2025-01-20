@interface PSIPostProcessor
+ (BOOL)_prefer:(id)a3 over:(id)a4;
+ (void)postProcessGroupResults:(id)a3 dedupedGroupResults:(id *)a4 query:(id)a5;
@end

@implementation PSIPostProcessor

+ (BOOL)_prefer:(id)a3 over:(id)a4
{
  unint64_t v6 = [a3 matchCount];
  unint64_t v7 = [a4 matchCount];
  if (v6 < v7) {
    return 1;
  }
  if (v6 > v7) {
    return 0;
  }
  v8 = (void *)[a3 firstSearchTextGroupSnapshot];
  v9 = (void *)[a4 firstSearchTextGroupSnapshot];
  if (v8)
  {
    __int16 v10 = [v8 category];
    if (v9)
    {
LABEL_5:
      __int16 v11 = [v9 category];
      goto LABEL_8;
    }
  }
  else
  {
    __int16 v10 = [a3 categoryAtIndex:0];
    if (v9) {
      goto LABEL_5;
    }
  }
  __int16 v11 = [a4 categoryAtIndex:0];
LABEL_8:
  if (v10 < v11) {
    return 1;
  }
  if (v10 > v11) {
    return 0;
  }
  if (v10 == 1100)
  {
    unint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "contentString"), "length");
    return v13 >= objc_msgSend((id)objc_msgSend(v9, "contentString"), "length");
  }
  else
  {
    if (!PLSearchIndexCategoryIsSynonym(v10)) {
      return 1;
    }
    unint64_t v14 = objc_msgSend((id)objc_msgSend(v8, "contentString"), "length");
    return v14 <= objc_msgSend((id)objc_msgSend(v9, "contentString"), "length");
  }
}

+ (void)postProcessGroupResults:(id)a3 dedupedGroupResults:(id *)a4 query:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v72 = __70__PSIPostProcessor_postProcessGroupResults_dedupedGroupResults_query___block_invoke;
  v73 = &unk_1E5871788;
  id v74 = v7;
  if (+[PLSearchIndexConfiguration shouldIndexFilenames])
  {
    long long v69 = 0uLL;
    long long v70 = 0uLL;
    long long v67 = 0uLL;
    long long v68 = 0uLL;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v67 objects:v78 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v68 != v10) {
            objc_enumerationMutation(a3);
          }
          v12 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          if ([v12 dedupingSkippedCategory] != 2100) {
            v72((uint64_t)v71, v12);
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v67 objects:v78 count:16];
      }
      while (v9);
    }
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v13 = [a3 countByEnumeratingWithState:&v63 objects:v77 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v64 != v15) {
            objc_enumerationMutation(a3);
          }
          v17 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          if ([v17 dedupingSkippedCategory] == 2100) {
            v72((uint64_t)v71, v17);
          }
        }
        uint64_t v14 = [a3 countByEnumeratingWithState:&v63 objects:v77 count:16];
      }
      while (v14);
    }
  }
  else
  {
    long long v61 = 0uLL;
    long long v62 = 0uLL;
    long long v59 = 0uLL;
    long long v60 = 0uLL;
    uint64_t v18 = [a3 countByEnumeratingWithState:&v59 objects:v76 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v60 != v20) {
            objc_enumerationMutation(a3);
          }
          v72((uint64_t)v71, *(void **)(*((void *)&v59 + 1) + 8 * k));
        }
        uint64_t v19 = [a3 countByEnumeratingWithState:&v59 objects:v76 count:16];
      }
      while (v19);
    }
  }
  [a3 removeAllObjects];
  uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  v43 = a4;
  if (a4) {
    id v48 = (id)objc_opt_new();
  }
  else {
    id v48 = 0;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v42 = v7;
  obuint64_t j = (id)[v7 allValues];
  id v23 = a5;
  uint64_t v46 = [obj countByEnumeratingWithState:&v55 objects:v75 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v56;
    uint64_t v53 = v22;
    id v50 = a3;
LABEL_33:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v56 != v45) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v55 + 1) + 8 * v24);
      if ([v23 isCanceled]) {
        break;
      }
      uint64_t v49 = v24;
      uint64_t v26 = [v25 count];
      if (v26)
      {
        unint64_t v27 = v26;
        for (uint64_t m = 0; m != v27; ++m)
        {
          if ([v23 isCanceled]) {
            break;
          }
          v29 = (void *)[v25 objectAtIndex:m];
          if (v29 != (void *)v22)
          {
            v30 = v29;
            if ([v29 dedupingSkippedCategory] != 2100)
            {
              CFArrayRef v54 = (const __CFArray *)[v30 assetIds];
              CFArrayGetCount(v54);
              CFArrayRef v52 = (const __CFArray *)[v30 collectionIds];
              CFArrayGetCount(v52);
              uint64_t v31 = m + 1;
              if (m + 1 < v27)
              {
                while (([v23 isCanceled] & 1) == 0)
                {
                  uint64_t v32 = [v25 objectAtIndex:v31];
                  if (v32 != v22)
                  {
                    v33 = (void *)v32;
                    if (![v30 dedupingSkippedCategory]
                      || (int v34 = [v30 dedupingSkippedCategory],
                          v34 != [v33 dedupingSkippedCategory]))
                    {
                      int v35 = [v30 dedupingSkippedCategory];
                      if (v35 == [v33 dedupingSkippedCategory]
                        || [v30 dedupingSkippedCategory] != 2200
                        && [v33 dedupingSkippedCategory] != 2200)
                      {
                        if ((v36 = (void *)[v30 sceneGroupsIds], !objc_msgSend(v36, "count"))
                          || (v37 = (void *)[v33 sceneGroupsIds], !objc_msgSend(v37, "count"))
                          || ((v38 = [v36 count], v39 = v38 >= objc_msgSend(v37, "count"), uint64_t v22 = v53, v39)
                            ? (v40 = v37)
                            : (v40 = v36),
                              v40 != v36 ? (v41 = v36) : (v41 = v37),
                              [v40 isSubsetOfSet:v41]))
                        {
                          CFArrayGetCount((CFArrayRef)[v33 assetIds]);
                          CFArrayGetCount((CFArrayRef)[v33 collectionIds]);
                          uint64_t v22 = v53;
                          id v23 = a5;
                          if (_idArrayIsEqual((uint64_t)v54))
                          {
                            if (_idArrayIsEqual((uint64_t)v52))
                            {
                              if (![a1 _prefer:v30 over:v33])
                              {
                                [v48 addObject:v30];
                                [v25 replaceObjectAtIndex:m withObject:v53];
                                a3 = v50;
                                goto LABEL_66;
                              }
                              [v48 addObject:v33];
                              [v25 replaceObjectAtIndex:v31 withObject:v53];
                            }
                          }
                        }
                      }
                    }
                  }
                  if (v27 == ++v31) {
                    break;
                  }
                }
              }
              a3 = v50;
            }
            [a3 addObject:v30];
          }
LABEL_66:
          ;
        }
      }
      uint64_t v24 = v49 + 1;
      if (v49 + 1 == v46)
      {
        uint64_t v46 = [obj countByEnumeratingWithState:&v55 objects:v75 count:16];
        if (v46) {
          goto LABEL_33;
        }
        break;
      }
    }
  }

  if (v43) {
    id *v43 = v48;
  }
}

uint64_t __70__PSIPostProcessor_postProcessGroupResults_dedupedGroupResults_query___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 matchCount];
  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v4));
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v4));
  }
  return [v5 addObject:a2];
}

@end