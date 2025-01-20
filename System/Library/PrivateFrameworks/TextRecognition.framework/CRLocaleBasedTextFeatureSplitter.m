@interface CRLocaleBasedTextFeatureSplitter
- (CRLocaleBasedTextFeatureSplitter)initWithConfiguration:(id)a3;
- (id)_preferredLocaleFromScriptLocales:(id)a3;
- (id)_topScriptCategoryBasedOnPreferredLocales:(id)a3;
- (id)preferredLocales;
- (void)enumerateIndicesForLineRegions:(id)a3 usingBlock:(id)a4;
- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4;
- (void)preferredLocaleBasedScriptVoting:(id)a3;
@end

@implementation CRLocaleBasedTextFeatureSplitter

- (CRLocaleBasedTextFeatureSplitter)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLocaleBasedTextFeatureSplitter;
  return [(CRMultiModelTextFeatureSplitter *)&v4 initWithConfiguration:a3];
}

- (void)enumerateIndicesForLineRegions:(id)a3 usingBlock:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v51 = a4;
  v7 = [(CRLocaleBasedTextFeatureSplitter *)self preferredLocales];
  v8 = objc_opt_new();
  v9 = [[CROrderedIndexSet alloc] initWithArray:v6];
  uint64_t v48 = [v6 count];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __78__CRLocaleBasedTextFeatureSplitter_enumerateIndicesForLineRegions_usingBlock___block_invoke;
  v68[3] = &unk_1E6CDBD98;
  v68[4] = self;
  v10 = v9;
  v69 = v10;
  id v11 = v7;
  id v70 = v11;
  id v12 = v8;
  id v71 = v12;
  id v13 = v6;
  id v72 = v13;
  [v13 enumerateObjectsUsingBlock:v68];
  if ([(CROrderedIndexSet *)v10 count])
  {
    v14 = [v12 allKeys];
    v15 = [(CRLocaleBasedTextFeatureSplitter *)self _preferredLocaleFromScriptLocales:v14];

    if (!v15)
    {
      v15 = [v11 firstObject];
    }
    v16 = objc_msgSend(v12, "objectForKeyedSubscript:", v15, v48);

    if (!v16)
    {
      v17 = [[CROrderedIndexSet alloc] initWithArray:v13];
      [v12 setObject:v17 forKeyedSubscript:v15];
    }
    v18 = [v12 objectForKeyedSubscript:v15];
    [v18 addIndexSet:v10];
  }
  v52 = v13;
  v50 = v10;
  uint64_t v19 = objc_msgSend(v11, "indexOfObject:", @"ja-JP", v48);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  v20 = +[CRImageReader supportedChineseLanguages];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v64 objects:v75 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v65;
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v65 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v26 = [v11 indexOfObject:*(void *)(*((void *)&v64 + 1) + 8 * i)];
        if (v26 < v24 && v26 != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v24 = v26;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v64 objects:v75 count:16];
    }
    while (v22);
  }
  else
  {
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v19 != 0x7FFFFFFFFFFFFFFFLL && v19 < v24
    || ([v12 objectForKeyedSubscript:@"ja-JP"],
        v28 = objc_claimAutoreleasedReturnValue(),
        v28,
        v28))
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v29 = +[CRImageReader supportedChineseLanguages];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v60 objects:v74 count:16];
    if (!v30)
    {
LABEL_43:

      goto LABEL_44;
    }
    uint64_t v31 = v30;
    char v32 = 0;
    uint64_t v33 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v61 != v33) {
          objc_enumerationMutation(v29);
        }
        v35 = [v12 objectForKeyedSubscript:*(void *)(*((void *)&v60 + 1) + 8 * j)];
        BOOL v36 = v35 != 0;

        v32 |= v36;
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v60 objects:v74 count:16];
    }
    while (v31);

    if (v32)
    {
      v37 = [v12 objectForKeyedSubscript:@"ja-JP"];

      if (!v37)
      {
        v38 = [[CROrderedIndexSet alloc] initWithArray:v52];
        [v12 setObject:v38 forKeyedSubscript:@"ja-JP"];
      }
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v29 = +[CRImageReader supportedChineseLanguages];
      uint64_t v39 = [v29 countByEnumeratingWithState:&v56 objects:v73 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v40; ++k)
          {
            if (*(void *)v57 != v41) {
              objc_enumerationMutation(v29);
            }
            uint64_t v43 = *(void *)(*((void *)&v56 + 1) + 8 * k);
            v44 = [v12 objectForKeyedSubscript:v43];

            if (v44)
            {
              v45 = [v12 objectForKeyedSubscript:@"ja-JP"];
              v46 = [v12 objectForKeyedSubscript:v43];
              [v45 addIndexSet:v46];
            }
          }
          uint64_t v40 = [v29 countByEnumeratingWithState:&v56 objects:v73 count:16];
        }
        while (v40);
      }
      goto LABEL_43;
    }
  }
LABEL_44:
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __78__CRLocaleBasedTextFeatureSplitter_enumerateIndicesForLineRegions_usingBlock___block_invoke_2;
  v53[3] = &unk_1E6CDBDC0;
  id v54 = v51;
  uint64_t v55 = v49;
  id v47 = v51;
  [v12 enumerateKeysAndObjectsUsingBlock:v53];
}

void __78__CRLocaleBasedTextFeatureSplitter_enumerateIndicesForLineRegions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v10 = [*(id *)(a1 + 32) _topScriptCategoryBasedOnPreferredLocales:a2];
  v5 = [v10 scriptLocales];
  if ([v5 count])
  {
    id v6 = [*(id *)(a1 + 32) _preferredLocaleFromScriptLocales:v5];
    if (!v6)
    {
      id v6 = [*(id *)(a1 + 48) firstObject];
    }
    v7 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];

    if (!v7)
    {
      v8 = [[CROrderedIndexSet alloc] initWithArray:*(void *)(a1 + 64)];
      [*(id *)(a1 + 56) setObject:v8 forKeyedSubscript:v6];
    }
    v9 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];
    [v9 addIndex:a3];
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

void __78__CRLocaleBasedTextFeatureSplitter_enumerateIndicesForLineRegions_usingBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))((double)(unint64_t)[v5 count] / (double)*(uint64_t *)(a1 + 40));
}

- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(id)objc_opt_class() _recognizerRegionsFromLineRegions:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__CRLocaleBasedTextFeatureSplitter_enumerateLineRegions_usingBlock___block_invoke;
  v10[3] = &unk_1E6CDBDE8;
  id v11 = v6;
  id v9 = v6;
  [(CRLocaleBasedTextFeatureSplitter *)self enumerateIndicesForLineRegions:v8 usingBlock:v10];
}

void __68__CRLocaleBasedTextFeatureSplitter_enumerateLineRegions_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, double a5)
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a2;
  id v10 = [a3 objects];
  (*(void (**)(uint64_t, id, id, uint64_t, double))(v8 + 16))(v8, v9, v10, a4, a5);
}

- (id)_topScriptCategoryBasedOnPreferredLocales:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CRLocaleBasedTextFeatureSplitter *)self preferredLocales];
  id v6 = [v5 firstObject];

  unint64_t v7 = 0x1E6CD9000uLL;
  if (+[CRImageReader languageIsChinese:v6])
  {
    uint64_t v8 = [v4 topScriptCategory];
    id v9 = +[CRScriptCategoryV1 chinese]();

    if (v8 != v9)
    {
      id v10 = [v4 scriptCategoryCounts];
      v80 = +[CRScriptCategoryV1 latinCyrillic]();
      v77 = objc_msgSend(v10, "objectForKeyedSubscript:");
      float v11 = (float)[v77 longValue];
      id v12 = [v4 scriptCategoryCounts];
      id v13 = +[CRScriptCategoryV1 common]();
      v74 = v12;
      v14 = [v12 objectForKeyedSubscript:v13];
      uint64_t v15 = [v14 longValue];
      v16 = [v4 scriptCategoryCounts];
      v17 = +[CRScriptCategoryV1 chinese]();
      v18 = [v16 objectForKeyedSubscript:v17];
      if ((float)((float)([v18 longValue] + v15) * 80.0) <= v11)
      {
      }
      else
      {
        uint64_t v19 = [v4 scriptCategoryCounts];
        +[CRScriptCategoryV1 chinese]();
        uint64_t v21 = v20 = v6;
        [v19 objectForKeyedSubscript:v21];
        uint64_t v22 = v71 = v10;
        uint64_t v70 = [v22 longValue];

        id v6 = v20;
        unint64_t v7 = 0x1E6CD9000;

        if (v70 >= 1)
        {
          uint64_t v23 = +[CRScriptCategoryV1 chinese]();
          goto LABEL_33;
        }
      }
    }
  }
  if (![*(id *)(v7 + 4016) languageIsKorean:v6]) {
    goto LABEL_39;
  }
  uint64_t v24 = [v4 topScriptCategory];
  v25 = +[CRScriptCategoryV1 korean]();

  if (v24 == v25) {
    goto LABEL_39;
  }
  v81 = v6;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v26 = [v4 scriptCategoryCounts];
  v27 = [v26 allValues];

  uint64_t v28 = [v27 countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v88 != v31) {
          objc_enumerationMutation(v27);
        }
        v30 += [*(id *)(*((void *)&v87 + 1) + 8 * i) longValue];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v87 objects:v92 count:16];
    }
    while (v29);
  }
  else
  {
    uint64_t v30 = 0;
  }

  v78 = [v4 scriptCategoryCounts];
  v75 = +[CRScriptCategoryV1 korean]();
  id v72 = [v78 objectForKeyedSubscript:v75];
  uint64_t v33 = [v72 longValue];
  v34 = [v4 scriptCategoryCounts];
  v35 = +[CRScriptCategoryV1 common]();
  BOOL v36 = [v34 objectForKeyedSubscript:v35];
  uint64_t v37 = [v36 longValue];
  v38 = [v4 scriptCategoryCounts];
  uint64_t v39 = +[CRScriptCategoryV1 unknown]();
  uint64_t v40 = [v38 objectForKeyedSubscript:v39];
  float v41 = (float)(v30 - [v40 longValue] - (v33 + v37));
  v42 = [v4 scriptCategoryCounts];
  uint64_t v43 = +[CRScriptCategoryV1 korean]();
  v44 = [v42 objectForKeyedSubscript:v43];
  float v45 = (float)[v44 longValue] * 3.0;

  id v6 = v81;
  unint64_t v7 = 0x1E6CD9000uLL;
  if (v45 > v41)
  {
    uint64_t v23 = +[CRScriptCategoryV1 korean]();
  }
  else
  {
    if (![*(id *)(v7 + 4016) languageIsJapanese:v6]) {
      goto LABEL_32;
    }
    v46 = [v4 topScriptCategory];
    id v47 = +[CRScriptCategoryV1 japanese]();

    if (v46 == v47) {
      goto LABEL_32;
    }
LABEL_39:
    v82 = v6;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    uint64_t v48 = [v4 scriptCategoryCounts];
    uint64_t v49 = [v48 allValues];

    uint64_t v50 = [v49 countByEnumeratingWithState:&v83 objects:v91 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = 0;
      uint64_t v53 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v84 != v53) {
            objc_enumerationMutation(v49);
          }
          v52 += [*(id *)(*((void *)&v83 + 1) + 8 * j) longValue];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v83 objects:v91 count:16];
      }
      while (v51);
    }
    else
    {
      uint64_t v52 = 0;
    }

    v79 = [v4 scriptCategoryCounts];
    uint64_t v76 = +[CRScriptCategoryV1 japanese]();
    v73 = [v79 objectForKeyedSubscript:v76];
    uint64_t v55 = [v73 longValue];
    long long v56 = [v4 scriptCategoryCounts];
    long long v57 = +[CRScriptCategoryV1 common]();
    long long v58 = [v56 objectForKeyedSubscript:v57];
    uint64_t v59 = [v58 longValue];
    long long v60 = [v4 scriptCategoryCounts];
    long long v61 = +[CRScriptCategoryV1 unknown]();
    long long v62 = [v60 objectForKeyedSubscript:v61];
    float v63 = (float)(v52 - [v62 longValue] - (v55 + v59));
    long long v64 = [v4 scriptCategoryCounts];
    long long v65 = +[CRScriptCategoryV1 japanese]();
    long long v66 = [v64 objectForKeyedSubscript:v65];
    float v67 = (float)[v66 longValue] * 3.0;

    id v6 = v82;
    if (v67 > v63)
    {
      uint64_t v23 = +[CRScriptCategoryV1 japanese]();
    }
    else
    {
LABEL_32:
      uint64_t v23 = [v4 topScriptCategory];
    }
  }
LABEL_33:
  v68 = (void *)v23;

  return v68;
}

- (id)_preferredLocaleFromScriptLocales:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CRLocaleBasedTextFeatureSplitter *)self preferredLocales];
  id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v4 containsObject:v9])
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)preferredLocales
{
  v2 = [(CRMultiModelTextFeatureSplitter *)self configuration];
  v3 = [v2 languages];
  id v4 = [v3 array];

  return v4;
}

- (void)preferredLocaleBasedScriptVoting:(id)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CRLocaleBasedTextFeatureSplitter *)self preferredLocales];
  id v6 = [v5 firstObject];

  unint64_t v7 = 0x1E6CD9000uLL;
  v79 = v6;
  if (+[CRImageReader languageIsChinese:v6])
  {
    uint64_t v8 = [v4 selectedScriptCategory];
    id v9 = +[CRScriptCategoryV1 chinese]();

    if (v8 != v9)
    {
      id v10 = [v4 scriptCounts];
      long long v11 = +[CRScriptCategoryV1 latinCyrillic]();
      uint64_t v76 = [v10 objectForKeyedSubscript:v11];
      float v12 = (float)[v76 longValue];
      long long v13 = [v4 scriptCounts];
      long long v14 = +[CRScriptCategoryV1 common]();
      uint64_t v15 = [v13 objectForKeyedSubscript:v14];
      uint64_t v16 = [v15 longValue];
      v17 = [v4 scriptCounts];
      v18 = +[CRScriptCategoryV1 chinese]();
      uint64_t v19 = [v17 objectForKeyedSubscript:v18];
      if ((float)((float)([v19 longValue] + v16) * 80.0) <= v12)
      {

        id v6 = v79;
        unint64_t v7 = 0x1E6CD9000uLL;
        goto LABEL_7;
      }
      v20 = [v4 scriptCounts];
      +[CRScriptCategoryV1 chinese]();
      uint64_t v21 = v73 = v11;
      [v20 objectForKeyedSubscript:v21];
      uint64_t v22 = v70 = v10;
      uint64_t v67 = [v22 longValue];

      id v6 = v79;
      unint64_t v7 = 0x1E6CD9000;
      if (v67 >= 1)
      {
        id v10 = +[CRScriptCategoryV1 chinese]();
        [v4 setSelectedScriptCategory:v10];
LABEL_7:
      }
    }
  }
  if ([*(id *)(v7 + 4016) languageIsKorean:v6])
  {
    uint64_t v23 = [v4 selectedScriptCategory];
    uint64_t v24 = +[CRScriptCategoryV1 korean]();

    if (v23 != v24)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v25 = [v4 scriptCounts];
      uint64_t v26 = [v25 allValues];

      uint64_t v27 = [v26 countByEnumeratingWithState:&v84 objects:v89 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = 0;
        uint64_t v30 = *(void *)v85;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v85 != v30) {
              objc_enumerationMutation(v26);
            }
            v29 += [*(id *)(*((void *)&v84 + 1) + 8 * i) longValue];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v84 objects:v89 count:16];
        }
        while (v28);
      }
      else
      {
        uint64_t v29 = 0;
      }

      v77 = [v4 scriptCounts];
      v74 = +[CRScriptCategoryV1 korean]();
      id v71 = [v77 objectForKeyedSubscript:v74];
      uint64_t v32 = [v71 longValue];
      v68 = [v4 scriptCounts];
      uint64_t v33 = +[CRScriptCategoryV1 common]();
      v34 = [v68 objectForKeyedSubscript:v33];
      uint64_t v35 = [v34 longValue];
      BOOL v36 = [v4 scriptCounts];
      uint64_t v37 = +[CRScriptCategoryV1 unknown]();
      v38 = [v36 objectForKeyedSubscript:v37];
      float v39 = (float)(v29 - [v38 longValue] - (v32 + v35));
      uint64_t v40 = [v4 scriptCounts];
      float v41 = +[CRScriptCategoryV1 korean]();
      v42 = [v40 objectForKeyedSubscript:v41];
      float v43 = (float)[v42 longValue] * 3.0;

      id v6 = v79;
      unint64_t v7 = 0x1E6CD9000uLL;
      if (v43 > v39)
      {
        v44 = +[CRScriptCategoryV1 korean]();
        [v4 setSelectedScriptCategory:v44];
      }
    }
  }
  if ([*(id *)(v7 + 4016) languageIsJapanese:v6])
  {
    float v45 = [v4 selectedScriptCategory];
    v46 = +[CRScriptCategoryV1 japanese]();

    if (v45 != v46)
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id v47 = [v4 scriptCounts];
      uint64_t v48 = [v47 allValues];

      uint64_t v49 = [v48 countByEnumeratingWithState:&v80 objects:v88 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = 0;
        uint64_t v52 = *(void *)v81;
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v81 != v52) {
              objc_enumerationMutation(v48);
            }
            v51 += [*(id *)(*((void *)&v80 + 1) + 8 * j) longValue];
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v80 objects:v88 count:16];
        }
        while (v50);
      }
      else
      {
        uint64_t v51 = 0;
      }

      v78 = [v4 scriptCounts];
      v75 = +[CRScriptCategoryV1 japanese]();
      id v72 = [v78 objectForKeyedSubscript:v75];
      uint64_t v54 = [v72 longValue];
      v69 = [v4 scriptCounts];
      uint64_t v55 = +[CRScriptCategoryV1 common]();
      long long v56 = [v69 objectForKeyedSubscript:v55];
      uint64_t v57 = [v56 longValue];
      long long v58 = [v4 scriptCounts];
      uint64_t v59 = +[CRScriptCategoryV1 unknown]();
      long long v60 = [v58 objectForKeyedSubscript:v59];
      float v61 = (float)(v51 - [v60 longValue] - (v54 + v57));
      long long v62 = [v4 scriptCounts];
      float v63 = +[CRScriptCategoryV1 japanese]();
      long long v64 = [v62 objectForKeyedSubscript:v63];
      float v65 = (float)[v64 longValue] * 3.0;

      id v6 = v79;
      if (v65 > v61)
      {
        long long v66 = +[CRScriptCategoryV1 japanese]();
        [v4 setSelectedScriptCategory:v66];
      }
    }
  }
}

@end