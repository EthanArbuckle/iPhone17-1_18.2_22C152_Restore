@interface PLEmbeddingQueryParser
+ (id)_fts5StringFromString:(id)a3;
+ (void)_allowedAssetUUIDsForParsedDateInQuery:(id)a3 psiDatabase:(id)a4 resultsHandler:(id)a5;
+ (void)_searchParseQueryText:(id)a3 dateFilter:(id)a4 psiDatabase:(id)a5 completion:(id)a6;
+ (void)parseQueryText:(id)a3 photoLibrary:(id)a4 dateFilter:(id)a5 psiDatabase:(id)a6 queryDepersonalization:(unint64_t)a7 completion:(id)a8;
@end

@implementation PLEmbeddingQueryParser

+ (id)_fts5StringFromString:(id)a3
{
  return +[PSITokenizer fts5StringFromString:a3 useWildcard:1];
}

+ (void)_allowedAssetUUIDsForParsedDateInQuery:(id)a3 psiDatabase:(id)a4 resultsHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__PLEmbeddingQueryParser__allowedAssetUUIDsForParsedDateInQuery_psiDatabase_resultsHandler___block_invoke;
  v11[3] = &unk_1E58746B0;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  +[PLSearchTextQueryParser enumerateDatesForString:a3 resultsHandler:v11];
}

void __92__PLEmbeddingQueryParser__allowedAssetUUIDsForParsedDateInQuery_psiDatabase_resultsHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = [*(id *)(a1 + 32) fetchAssetUUIDsForDateFilter:a2];
  id v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9) {
    v11 = (void *)v9;
  }
  id v12 = v11;

  uint64_t v13 = *(void *)(a1 + 40);
  v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];

  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v13 + 16))(v13, v14, a3, a4);
  *a5 = 1;
}

+ (void)_searchParseQueryText:(id)a3 dateFilter:(id)a4 psiDatabase:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v47 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, id, void *, void *, uint64_t))a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"PLEmbeddingQueryParser.m", 51, @"Invalid parameter not satisfying: %@", @"queryText" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v45 = [MEMORY[0x1E4F28B00] currentHandler];
  [v45 handleFailureInMethod:a2, a1, @"PLEmbeddingQueryParser.m", 52, @"Invalid parameter not satisfying: %@", @"psiDatabase" object file lineNumber description];

LABEL_3:
  v46 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v11];
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__110354;
  v83 = __Block_byref_object_dispose__110355;
  id v84 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__110354;
  v77 = __Block_byref_object_dispose__110355;
  id v78 = 0;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
  [v14 setString:v11];
  v15 = [v14 string];
  uint64_t v16 = [v15 length];

  v17 = +[PLSearchIndexConfiguration locale];
  v18 = [v17 languageCode];
  v19 = +[PLNLP stopWordsForLanguageCode:v18];

  v20 = objc_opt_new();
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2020000000;
  char v72 = 0;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke;
  v59[3] = &unk_1E5874660;
  id v21 = v14;
  id v60 = v21;
  id v22 = v19;
  id v61 = v22;
  id v68 = a1;
  id v23 = v12;
  id v62 = v23;
  id v24 = v20;
  id v63 = v24;
  v65 = &v73;
  id v25 = v11;
  id v64 = v25;
  v66 = &v69;
  v67 = &v79;
  objc_msgSend(v21, "enumerateTokensInRange:usingBlock:", 0, v16, v59);
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  v26 = v47;
  if (v47)
  {
    uint64_t v27 = [v23 fetchAssetUUIDsForDateFilter:v47];
    v28 = (void *)v27;
    v29 = (void *)MEMORY[0x1E4F1CBF0];
    if (v27) {
      v29 = (void *)v27;
    }
    id v30 = v29;

    uint64_t v31 = [(id)v80[5] count];
    v32 = v80;
    v33 = (void *)v80[5];
    if (v31)
    {
      v34 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
      [v33 intersectSet:v34];
    }
    else
    {
      if (v33)
      {
        id v35 = v33;
        v36 = (void *)v32[5];
        v32[5] = (uint64_t)v35;
      }
      else
      {
        id v37 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        v36 = (void *)v80[5];
        v80[5] = (uint64_t)v37;
      }

      v38 = (void *)v80[5];
      v34 = [MEMORY[0x1E4F1CAD0] setWithArray:v30];
      [v38 unionSet:v34];
    }

    v26 = v47;
  }
  else
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke_61;
    v50[3] = &unk_1E5874688;
    v52 = &v55;
    id v51 = v46;
    v53 = &v69;
    v54 = &v79;
    [a1 _allowedAssetUUIDsForParsedDateInQuery:v25 psiDatabase:v23 resultsHandler:v50];
    id v30 = v51;
  }

  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke_2;
  v48[3] = &unk_1E58756D0;
  id v39 = v46;
  id v49 = v39;
  [v24 enumerateKeysAndObjectsUsingBlock:v48];
  v40 = (void *)[(id)v80[5] copy];
  v41 = (void *)[(id)v74[5] copy];
  if (*((unsigned char *)v70 + 24))
  {
    uint64_t v42 = 1;
  }
  else
  {
    if (v26) {
      BOOL v43 = 0;
    }
    else {
      BOOL v43 = *((unsigned char *)v56 + 24) == 0;
    }
    uint64_t v42 = !v43;
  }
  v13[2](v13, v39, v40, v41, v42);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v79, 8);
}

void __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v6 = [*(id *)(a1 + 32) string];
  id v7 = objc_msgSend(v6, "substringWithRange:", a2, a3);

  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v7 localizedLowercaseString];
  LOBYTE(v8) = [v8 containsObject:v9];

  if (v8) {
    goto LABEL_37;
  }
  id v10 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "Query Depersonalization: Attempting to resolve: %@", buf, 0xCu);
  }

  v34 = [*(id *)(a1 + 96) _fts5StringFromString:v7];
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 48), "groupIdsMatchingString:categories:textIsSearchable:");
  v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, 0);
  v32 = objc_msgSend(*(id *)(a1 + 48), "groupArraysFromGroupIdSets:dateFilter:searchResultTypes:progressBlock:");
  id v12 = [v32 firstObject];
  id v37 = PLSearchIndexCategoriesForCategoryMask(1);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (!v13)
  {
    id v15 = 0;
    goto LABEL_31;
  }
  uint64_t v14 = v13;
  id v15 = 0;
  uint64_t v16 = *(void *)v40;
  do
  {
    uint64_t v17 = 0;
    do
    {
      if (*(void *)v40 != v16) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v39 + 1) + 8 * v17);
      if ([v18 category] == 1300)
      {
        v19 = *(void **)(a1 + 56);
        v20 = @"person";
        goto LABEL_13;
      }
      if ([v18 category] == 1330)
      {
        v19 = *(void **)(a1 + 56);
        v20 = @"pet";
LABEL_13:
        [v19 setObject:v20 forKeyedSubscript:v7];
        id v21 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        id v22 = [v18 lookupIdentifier];
        [v21 addObject:v22];

        if (!v15) {
          goto LABEL_14;
        }
        goto LABEL_15;
      }
      if ([v18 category] != 1000
        && [v18 category] != 1001
        && [v18 category] != 1100
        && [v18 category] != 1101)
      {
        if (!objc_msgSend(v37, "containsIndex:", (int)objc_msgSend(v18, "category"))) {
          goto LABEL_18;
        }
        id v25 = [*(id *)(a1 + 64) lowercaseString];
        v36 = [v18 contentString];
        v26 = [v36 lowercaseString];
        int v35 = [v25 containsString:v26];

        if (!v35) {
          goto LABEL_18;
        }
      }
      [*(id *)(a1 + 56) setObject:@" " forKeyedSubscript:v7];
      if (!v15) {
LABEL_14:
      }
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
LABEL_15:
      id v23 = objc_msgSend(*(id *)(a1 + 48), "assetUUIDsForAssetIDs:", objc_msgSend(v18, "assetIds"));
      [v15 unionSet:v23];
      id v24 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v44 = v7;
        __int16 v45 = 2112;
        v46 = v18;
        __int16 v47 = 2112;
        v48 = v23;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "Query Depersonalization: Found match for word: %@. PSIGroup: %@. AssetUUIDs: %@", buf, 0x20u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
LABEL_18:
      ++v17;
    }
    while (v14 != v17);
    uint64_t v27 = [obj countByEnumeratingWithState:&v39 objects:v49 count:16];
    uint64_t v14 = v27;
  }
  while (v27);
LABEL_31:

  v28 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  if (v28 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    if (v15) {
      [v28 intersectSet:v15];
    }
  }
  else
  {
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:v15];
    uint64_t v30 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;
  }
LABEL_37:
}

void __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke_61(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (a4)
  {
    id v14 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a3, a4, &stru_1EEB2EB80);
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [v9 intersectSet:v14];
    }
    else
    {
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v10;
      }
      else
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v11 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) unionSet:v14];
    }
    id v7 = v14;
  }
}

void __82__PLEmbeddingQueryParser__searchParseQueryText_dateFilter_psiDatabase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "replaceOccurrencesOfString:withString:options:range:", v7, v6, 385, 0, objc_msgSend(v5, "length"));
}

+ (void)parseQueryText:(id)a3 photoLibrary:(id)a4 dateFilter:(id)a5 psiDatabase:(id)a6 queryDepersonalization:(unint64_t)a7 completion:(id)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v19 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = v14;
    __int16 v25 = 2112;
    id v26 = v15;
    __int16 v27 = 2048;
    unint64_t v28 = a7;
    _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "Query Depersonalization: Running depersonalization for queryText: %@, photoLibrary: %@, depersonalizationType: %tu", buf, 0x20u);
  }

  if (a7 == 1)
  {
    [a1 _searchParseQueryText:v14 dateFilter:v16 psiDatabase:v17 completion:v18];
  }
  else if (!a7)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __111__PLEmbeddingQueryParser_parseQueryText_photoLibrary_dateFilter_psiDatabase_queryDepersonalization_completion___block_invoke;
    v20[3] = &unk_1E5874618;
    id v22 = v18;
    id v21 = v14;
    [a1 _searchParseQueryText:v21 dateFilter:0 psiDatabase:v17 completion:v20];
  }
}

uint64_t __111__PLEmbeddingQueryParser_parseQueryText_photoLibrary_dateFilter_psiDatabase_queryDepersonalization_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, a4, 0);
}

@end