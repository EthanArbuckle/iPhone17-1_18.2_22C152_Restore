@interface PSIDisambiguationQuery
+ (BOOL)_disambiguationQueryTextIsExactMatchOfGroup:(id)a3 disambiguation:(id)a4 normalizedQueryText:(id)a5;
+ (BOOL)_disambiguationQueryTextIsSubstringMatchOfGroup:(id)a3 disambiguation:(id)a4 normalizedQueryText:(id)a5;
+ (id)_consolidateDisambiguationIntermediateResults:(id)a3;
+ (id)_disambiguationResultForDisambiguation:(id)a3 sortedResults:(id)a4;
+ (id)_fetchGroupsWithFTS5FormattedString:(id)a3 indexingCategories:(id)a4 delegate:(id)a5;
+ (id)_sortedResultsForDisambiguation:(id)a3 exactMatchResults:(id)a4 fullTokenMatchResults:(id)a5 wildcardMatchResults:(id)a6;
+ (id)_sortedResultsForDisambiguationType:(unint64_t)a3 maxNumberOfResults:(unint64_t)a4 exactMatchResults:(id)a5 fullTokenMatchResults:(id)a6 wildcardMatchResults:(id)a7;
- (BOOL)cancelled;
- (NSArray)disambiguations;
- (PLPhotoLibrary)photoLibrary;
- (PSIDatabase)photosEntityStore;
- (PSIDisambiguationQuery)initWithDisambiguation:(id)a3 photoLibrary:(id)a4 photosEntityStore:(id)a5;
- (PSIDisambiguationQuery)initWithDisambiguations:(id)a3 photosEntityStore:(id)a4;
- (id)_disambiguationIntermediateResultWithDisambiguation:(id)a3 delegate:(id)a4;
- (id)_disambiguationResultWithDisambiguation:(id)a3 delegate:(id)a4;
- (id)_groupsForMatchType:(unint64_t)a3 fromGroups:(id)a4 disambiguation:(id)a5 normalizedQueryText:(id)a6;
- (id)performDisambiguationQuery;
- (void)cancel;
- (void)setCancelled:(BOOL)a3;
@end

@implementation PSIDisambiguationQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguations, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_photosEntityStore, 0);
}

- (NSArray)disambiguations
{
  return self->_disambiguations;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PSIDatabase)photosEntityStore
{
  return self->_photosEntityStore;
}

- (id)_groupsForMatchType:(unint64_t)a3 fromGroups:(id)a4 disambiguation:(id)a5 normalizedQueryText:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v13 = a4;
  id v14 = objc_alloc_init(v12);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __92__PSIDisambiguationQuery__groupsForMatchType_fromGroups_disambiguation_normalizedQueryText___block_invoke;
  v21[3] = &unk_1E5872120;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  unint64_t v25 = a3;
  id v15 = v14;
  id v24 = v15;
  id v16 = v11;
  id v17 = v10;
  [v13 enumerateObjectsUsingBlock:v21];

  v18 = v24;
  id v19 = v15;

  return v19;
}

void __92__PSIDisambiguationQuery__groupsForMatchType_fromGroups_disambiguation_normalizedQueryText___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (![v6 assetIds] || CFArrayGetCount((CFArrayRef)objc_msgSend(v6, "assetIds")) < 1) {
    goto LABEL_19;
  }
  int v3 = [(id)objc_opt_class() _disambiguationQueryTextIsExactMatchOfGroup:v6 disambiguation:*(void *)(a1 + 40) normalizedQueryText:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4 != 1)
  {
    int v5 = 0;
    if (v4) {
      goto LABEL_5;
    }
LABEL_10:
    if ((v3 | v5)) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  int v5 = [(id)objc_opt_class() _disambiguationQueryTextIsSubstringMatchOfGroup:v6 disambiguation:*(void *)(a1 + 40) normalizedQueryText:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 64);
  if (!v4) {
    goto LABEL_10;
  }
LABEL_5:
  if (v4 != 1)
  {
    if (v4 != 2 || (v3 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ([*(id *)(a1 + 40) disambiguationType] != 3)
  {
    if ((v5 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ([v6 category] != 1301
    && [v6 category] != 1331
    && ([(id)objc_opt_class() _disambiguationQueryTextIsSubstringMatchOfGroup:v6 disambiguation:*(void *)(a1 + 40) normalizedQueryText:*(void *)(a1 + 48)] & 1) != 0)
  {
LABEL_18:
    [*(id *)(a1 + 56) addObject:v6];
  }
LABEL_19:
}

- (BOOL)cancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL cancelled = v2->_cancelled;
  objc_sync_exit(v2);

  return cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL cancelled = a3;
  objc_sync_exit(obj);
}

- (void)cancel
{
}

- (id)_disambiguationResultWithDisambiguation:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  v7 = [(PSIDisambiguationQuery *)self _disambiguationIntermediateResultWithDisambiguation:v6 delegate:a4];
  v8 = [v7 exactMatchResults];
  v9 = [v7 fullTokenMatchResults];
  id v10 = [v7 wildcardMatchResults];
  id v11 = [(id)objc_opt_class() _sortedResultsForDisambiguation:v6 exactMatchResults:v8 fullTokenMatchResults:v9 wildcardMatchResults:v10];
  v12 = [(id)objc_opt_class() _disambiguationResultForDisambiguation:v6 sortedResults:v11];

  return v12;
}

- (id)_disambiguationIntermediateResultWithDisambiguation:(id)a3 delegate:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = (PSIDisambiguationIntermediateResult *)a3;
  id v7 = a4;
  unint64_t v8 = [(PSIDisambiguationIntermediateResult *)v6 matchOptions];
  v9 = [v7 tokenizer];
  id v10 = [(PSIDisambiguationIntermediateResult *)v6 queryTerm];
  id v11 = [v9 normalizeString:v10];

  if (v8)
  {
    id v13 = +[PSITokenizer fts5StringFromString:v11 useWildcard:1 leadingAnchored:(v8 >> 3) & 1];
    id v14 = objc_opt_class();
    id v15 = [(PSIDisambiguationIntermediateResult *)v6 indexingCategories];
    v12 = [v14 _fetchGroupsWithFTS5FormattedString:v13 indexingCategories:v15 delegate:v7];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([(PSIDisambiguationQuery *)self cancelled])
  {
    id v16 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(PSIDisambiguationIntermediateResult *)v6 queryTerm];
      *(_DWORD *)buf = 138412546;
      v31 = v17;
      __int16 v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Disambiguation query cancelled for query term: \"%@\" with result: %@", buf, 0x16u);
    }
    v18 = 0;
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_25;
  }
  if ((v8 & 6) != 0)
  {
    v20 = +[PSITokenizer fts5StringFromString:v11 useWildcard:0 leadingAnchored:(v8 >> 3) & 1];
    v21 = objc_opt_class();
    id v22 = [(PSIDisambiguationIntermediateResult *)v6 indexingCategories];
    id v19 = [v21 _fetchGroupsWithFTS5FormattedString:v20 indexingCategories:v22 delegate:v7];
  }
  else
  {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([(PSIDisambiguationQuery *)self cancelled])
  {
    id v16 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [(PSIDisambiguationIntermediateResult *)v6 queryTerm];
      *(_DWORD *)buf = 138412546;
      v31 = v23;
      __int16 v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Disambiguation query cancelled for query term: \"%@\" with result: %@", buf, 0x16u);
    }
    v18 = 0;
    goto LABEL_25;
  }
  if ((v8 & 4) == 0)
  {
    id v16 = MEMORY[0x1E4F1CBF0];
    if ((v8 & 2) != 0) {
      goto LABEL_17;
    }
LABEL_20:
    id v24 = (void *)MEMORY[0x1E4F1CBF0];
    if (v8) {
      goto LABEL_18;
    }
LABEL_21:
    unint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_22;
  }
  id v16 = [(PSIDisambiguationQuery *)self _groupsForMatchType:2 fromGroups:v19 disambiguation:v6 normalizedQueryText:v11];
  if ((v8 & 2) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  id v24 = [(PSIDisambiguationQuery *)self _groupsForMatchType:1 fromGroups:v19 disambiguation:v6 normalizedQueryText:v11];
  if ((v8 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  unint64_t v25 = [(PSIDisambiguationQuery *)self _groupsForMatchType:0 fromGroups:v12 disambiguation:v6 normalizedQueryText:v11];
LABEL_22:
  v18 = [[PSIDisambiguationIntermediateResult alloc] initWithDisambiguation:v6 exactMatchResults:v16 fullTokenMatchResults:v24 wildcardMatchResults:v25];
  v26 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    [(PSIDisambiguationIntermediateResult *)v6 queryTerm];
    v27 = v29 = v12;
    *(_DWORD *)buf = 138412546;
    v31 = v27;
    __int16 v32 = 2112;
    v33 = v18;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Disambiguation query executed for query term: \"%@\" with result: %@", buf, 0x16u);

    v12 = v29;
  }

LABEL_25:
  return v18;
}

- (id)performDisambiguationQuery
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  PLPhotosSearchGetLog();
  int v3 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  int v5 = v3;
  id v6 = v5;
  unint64_t v30 = v4 - 1;
  os_signpost_id_t spid = v4;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PLSearchBackendQueryDisambiguationQuery", "", buf, 2u);
  }
  __int16 v32 = v6;

  id v7 = [(PSIDisambiguationQuery *)self disambiguations];
  if ([v7 count])
  {
    unint64_t v8 = [(PSIDisambiguationQuery *)self photosEntityStore];
    if ([(PSIDisambiguationQuery *)self cancelled])
    {
      v9 = PLSearchBackendQueryGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_35:
        id v13 = 0;
LABEL_36:

        goto LABEL_37;
      }
      *(_DWORD *)buf = 138412290;
      id v44 = v7;
      id v10 = "Disambiguation query cancelled for %@";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      id v14 = [v7 firstObject];
      uint64_t v15 = [v14 disambiguationType];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v16 = v7;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (!v17)
      {
LABEL_19:

        v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v20 = v16;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v34 != v22) {
                objc_enumerationMutation(v20);
              }
              uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              unint64_t v25 = (void *)MEMORY[0x19F38D3B0]();
              v26 = [(PSIDisambiguationQuery *)self _disambiguationIntermediateResultWithDisambiguation:v24 delegate:v8];
              if (v26) {
                [v9 addObject:v26];
              }
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v21);
        }

        v27 = v32;
        v28 = v27;
        if (v30 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, spid, "PLSearchBackendQueryDisambiguationQuery", "", buf, 2u);
        }

        id v13 = [(id)objc_opt_class() _consolidateDisambiguationIntermediateResults:v9];
        goto LABEL_36;
      }
      uint64_t v18 = *(void *)v38;
LABEL_13:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v16);
        }
        if (v15 != [*(id *)(*((void *)&v37 + 1) + 8 * v19) disambiguationType]) {
          break;
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v42 count:16];
          if (v17) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }

      v9 = PLSearchBackendQueryGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_35;
      }
      *(_DWORD *)buf = 138412290;
      id v44 = v16;
      id v10 = "Disambiguation queries have different disambiguation type: %@";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_19B3C7000, v11, v12, v10, buf, 0xCu);
    goto LABEL_35;
  }
  unint64_t v8 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "There is no disambiguations", buf, 2u);
  }
  id v13 = 0;
LABEL_37:

  return v13;
}

- (PSIDisambiguationQuery)initWithDisambiguations:(id)a3 photosEntityStore:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      v17.receiver = self;
      v17.super_class = (Class)PSIDisambiguationQuery;
      id v11 = [(PSIDisambiguationQuery *)&v17 init];
      p_isa = (id *)&v11->super.isa;
      if (v11)
      {
        objc_storeStrong((id *)&v11->_disambiguations, a3);
        objc_storeStrong(p_isa + 2, a4);
      }
      self = p_isa;
      id v13 = self;
      goto LABEL_10;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PSIDisambiguationQuery.m", 102, @"Invalid parameter not satisfying: %@", @"disambiguations" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Unexpected nil photos entity store, aborting initialization of disambiguation queries: %@", buf, 0xCu);
  }

  id v13 = 0;
LABEL_10:

  return v13;
}

- (PSIDisambiguationQuery)initWithDisambiguation:(id)a3 photoLibrary:(id)a4 photosEntityStore:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  os_log_type_t v12 = v11;
  if (v9)
  {
    if (v11)
    {
LABEL_3:
      v20.receiver = self;
      v20.super_class = (Class)PSIDisambiguationQuery;
      id v13 = [(PSIDisambiguationQuery *)&v20 init];
      if (v13)
      {
        id v21 = v9;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        disambiguations = v13->_disambiguations;
        v13->_disambiguations = (NSArray *)v14;

        objc_storeStrong((id *)&v13->_photosEntityStore, a5);
        objc_storeStrong((id *)&v13->_photoLibrary, a4);
      }
      self = v13;
      id v16 = self;
      goto LABEL_10;
    }
  }
  else
  {
    objc_super v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PSIDisambiguationQuery.m", 82, @"Invalid parameter not satisfying: %@", @"disambiguation" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v9;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Unexpected nil photos entity store, aborting initialization of disambiguation query: \"%@\"", buf, 0xCu);
  }

  id v16 = 0;
LABEL_10:

  return v16;
}

+ (id)_consolidateDisambiguationIntermediateResults:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v30 = a1;
    int v5 = [v4 firstObject];
    id v6 = [v5 disambiguation];

    uint64_t v29 = [v6 disambiguationType];
    uint64_t v28 = [v6 maxNumberOfResults];
    v31 = v6;
    uint64_t v27 = [v6 matchOptions];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v32 = v4;
    id obj = v4;
    uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          id v16 = [v15 disambiguation];
          objc_super v17 = [v16 queryTerm];
          [v7 addObject:v17];

          uint64_t v18 = [v15 exactMatchResults];
          [v8 addObjectsFromArray:v18];

          id v19 = [v15 fullTokenMatchResults];
          [v9 addObjectsFromArray:v19];

          objc_super v20 = [v15 wildcardMatchResults];
          [v10 addObjectsFromArray:v20];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v12);
    }

    id v21 = [PLDisambiguation alloc];
    uint64_t v22 = [v7 componentsJoinedByString:@","];
    id v23 = [(PLDisambiguation *)v21 initWithQueryTerm:v22 disambiguationType:v29 indexingCategories:0 maxNumberOfResults:v28 matchOptions:v27];

    uint64_t v24 = [v30 _sortedResultsForDisambiguationType:v29 maxNumberOfResults:v28 exactMatchResults:v8 fullTokenMatchResults:v9 wildcardMatchResults:v10];
    unint64_t v25 = [v30 _disambiguationResultForDisambiguation:v23 sortedResults:v24];

    id v4 = v32;
  }
  else
  {
    unint64_t v25 = 0;
  }

  return v25;
}

+ (id)_sortedResultsForDisambiguationType:(unint64_t)a3 maxNumberOfResults:(unint64_t)a4 exactMatchResults:(id)a5 fullTokenMatchResults:(id)a6 wildcardMatchResults:(id)a7
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v50 = v11;
  uint64_t v15 = (void *)[v11 mutableCopy];
  id v16 = v15;
  if (v15) {
    id v17 = v15;
  }
  else {
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v52 = v17;

  uint64_t v18 = (void *)[v12 mutableCopy];
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v51 = v20;

  id v21 = (void *)[v13 mutableCopy];
  uint64_t v22 = v21;
  v48 = v13;
  v49 = v12;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  uint64_t v24 = v23;

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"score" ascending:0];
  v55[0] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  [v52 sortUsingDescriptors:v27];

  v54 = v26;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
  [v51 sortUsingDescriptors:v28];

  v53 = v26;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
  [v24 sortUsingDescriptors:v29];

  [v25 addObjectsFromArray:v52];
  [v25 addObjectsFromArray:v51];
  v47 = v24;
  [v25 addObjectsFromArray:v24];
  unint64_t v30 = [v25 count];
  if (v30 >= a4) {
    unint64_t v31 = a4;
  }
  else {
    unint64_t v31 = v30;
  }
  if (a4) {
    unint64_t v32 = v31;
  }
  else {
    unint64_t v32 = v30;
  }
  if (v32)
  {
    uint64_t v33 = 0;
    while (1)
    {
      long long v34 = [v25 objectAtIndexedSubscript:v33];
      long long v35 = v34;
      if (a3 != 1) {
        break;
      }
      v43 = [v34 normalizedString];
      char v44 = [v14 containsObject:v43];

      if ((v44 & 1) == 0)
      {
        uint64_t v38 = [v35 normalizedString];
        goto LABEL_27;
      }
LABEL_30:

      if (v32 == ++v33) {
        goto LABEL_31;
      }
    }
    if (a3 == 2)
    {
      uint64_t v39 = [PLGenericLocationTuple alloc];
      long long v40 = [v35 normalizedString];
      v41 = [v35 lookupIdentifier];
      v42 = -[PLGenericLocationTuple initWithText:lookupIdentifier:indexCategory:](v39, "initWithText:lookupIdentifier:indexCategory:", v40, v41, (int)[v35 category]);

      if ([v14 containsObject:v42]) {
        goto LABEL_29;
      }
    }
    else
    {
      if (a3 != 3) {
        goto LABEL_30;
      }
      long long v36 = [v34 lookupIdentifier];
      char v37 = [v14 containsObject:v36];

      if (v37) {
        goto LABEL_30;
      }
      uint64_t v38 = [v35 lookupIdentifier];
LABEL_27:
      v42 = (PLGenericLocationTuple *)v38;
    }
    [v14 addObject:v42];
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:
  uint64_t v45 = (void *)[v14 copy];

  return v45;
}

+ (id)_sortedResultsForDisambiguation:(id)a3 exactMatchResults:(id)a4 fullTokenMatchResults:(id)a5 wildcardMatchResults:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v13 disambiguationType];
  uint64_t v15 = [v13 maxNumberOfResults];

  id v16 = [a1 _sortedResultsForDisambiguationType:v14 maxNumberOfResults:v15 exactMatchResults:v12 fullTokenMatchResults:v11 wildcardMatchResults:v10];

  return v16;
}

+ (id)_disambiguationResultForDisambiguation:(id)a3 sortedResults:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (![v6 count]) {
    goto LABEL_6;
  }
  uint64_t v7 = [v5 disambiguationType];
  if (v7 == 1)
  {
    id v8 = [PLDisambiguationResult alloc];
    id v9 = v5;
    id v10 = 0;
    id v11 = v6;
    goto LABEL_8;
  }
  if (v7 == 2)
  {
    id v8 = [PLDisambiguationResult alloc];
    id v9 = v5;
    id v10 = 0;
    id v11 = 0;
    id v13 = v6;
    goto LABEL_10;
  }
  if (v7 != 3)
  {
LABEL_6:
    id v12 = 0;
    goto LABEL_11;
  }
  id v8 = [PLDisambiguationResult alloc];
  id v9 = v5;
  id v10 = v6;
  id v11 = 0;
LABEL_8:
  id v13 = 0;
LABEL_10:
  id v12 = [(PLDisambiguationResult *)v8 initWithDisambiguation:v9 personLookupIdentifiers:v10 locationNames:v11 genericLocationTuples:v13];
LABEL_11:

  return v12;
}

+ (id)_fetchGroupsWithFTS5FormattedString:(id)a3 indexingCategories:(id)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = [v7 groupIdsMatchingString:a3 categories:a4 textIsSearchable:1];
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, 0);
  id v10 = [v7 groupArraysFromGroupIdSets:v9 dateFilter:0 searchResultTypes:1 progressBlock:&__block_literal_global_96239];

  id v11 = [v10 firstObject];

  return v11;
}

+ (BOOL)_disambiguationQueryTextIsSubstringMatchOfGroup:(id)a3 disambiguation:(id)a4 normalizedQueryText:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [a4 queryTerm];
  if (![v9 length])
  {
    LOBYTE(v10) = 0;
    goto LABEL_5;
  }
  uint64_t v10 = [v8 length];

  if (v10)
  {
    id v9 = [v7 normalizedString];
    LOBYTE(v10) = [v9 containsString:v8];
LABEL_5:
  }
  return v10;
}

+ (BOOL)_disambiguationQueryTextIsExactMatchOfGroup:(id)a3 disambiguation:(id)a4 normalizedQueryText:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [a4 queryTerm];
  if (![v9 length])
  {
    LOBYTE(v10) = 0;
    goto LABEL_5;
  }
  uint64_t v10 = [v8 length];

  if (v10)
  {
    id v9 = [v7 normalizedString];
    LOBYTE(v10) = [v8 isEqualToString:v9];
LABEL_5:
  }
  return v10;
}

@end