@interface PLEmbeddingQuery
- (BOOL)_embeddingCompareObjectIsValidSearchResultForQuery:(id)a3 forEmbeddingCompareObject:(id *)a4 similarityThreshold:(double)a5;
- (BOOL)isCancelled;
- (NSString)queryText;
- (PLEmbeddingQuery)initWithQueryText:(id)a3;
- (PLEmbeddingVectorGenerator)embeddingVectorGenerator;
- (id)_processSearchResults:(id)a3 embeddingModelTypes:(id)a4 sortAscending:(BOOL)a5;
- (void)executeEmbeddingSearchQueryWithSimilarityThreshold:(double)a3 embeddingModelTypes:(id)a4 scopedAssetUUIDs:(id)a5 dateFilter:(id)a6 psiDatabase:(id)a7 photoLibrary:(id)a8 queryDepersonalization:(unint64_t)a9 enableRanking:(BOOL)a10 completion:(id)a11;
- (void)setIsCancelled:(BOOL)a3;
@end

@implementation PLEmbeddingQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingVectorGenerator, 0);
  objc_storeStrong((id *)&self->_queryText, 0);
}

- (PLEmbeddingVectorGenerator)embeddingVectorGenerator
{
  return self->_embeddingVectorGenerator;
}

- (NSString)queryText
{
  return self->_queryText;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (id)_processSearchResults:(id)a3 embeddingModelTypes:(id)a4 sortAscending:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    v10 = +[PLEmbeddingUtilities generateMappingOfEmbeddingCompareObjectsToAssetUUIDFromEmbeddingCompareObjects:v8];
    if ([(PLEmbeddingQuery *)self isCancelled])
    {
      id v11 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v12 = +[PLEmbeddingUtilities averageTop:forEmbeddingCompareObjectsByAssetUUID:sortAscending:](PLEmbeddingUtilities, "averageTop:forEmbeddingCompareObjectsByAssetUUID:sortAscending:", [v9 count], v10, v5);
      if ([(PLEmbeddingQuery *)self isCancelled])
      {
        id v11 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        v13 = +[PLEmbeddingUtilities sortCompareObjects:v12 sortAscending:v5];
        if ([(PLEmbeddingQuery *)self isCancelled]) {
          id v11 = (id)MEMORY[0x1E4F1CBF0];
        }
        else {
          id v11 = v13;
        }
      }
    }
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (BOOL)_embeddingCompareObjectIsValidSearchResultForQuery:(id)a3 forEmbeddingCompareObject:(id *)a4 similarityThreshold:(double)a5
{
  [*a4 distanceToQueryVector:a3];
  return v6 >= a5;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (void)executeEmbeddingSearchQueryWithSimilarityThreshold:(double)a3 embeddingModelTypes:(id)a4 scopedAssetUUIDs:(id)a5 dateFilter:(id)a6 psiDatabase:(id)a7 photoLibrary:(id)a8 queryDepersonalization:(unint64_t)a9 enableRanking:(BOOL)a10 completion:(id)a11
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v44 = a4;
  id v40 = a5;
  id v41 = a6;
  id v43 = a7;
  id v42 = a8;
  v18 = (void (**)(id, void, void *))a11;
  v19 = [(PLEmbeddingQuery *)self queryText];
  uint64_t v20 = [v19 length];

  if (v20)
  {
    if ([v44 count] != 1 || (objc_msgSend(v44, "containsIndex:", 0) & 1) == 0)
    {
      v21 = PLPhotosSearchGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Depersonalization type not supported for embedding type(s). Ignoring depersonalization request", buf, 2u);
      }

      a9 = 0;
    }
    *(void *)buf = 0;
    v72 = buf;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__65010;
    v75 = __Block_byref_object_dispose__65011;
    id v76 = 0;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = __Block_byref_object_copy__65010;
    v69[4] = __Block_byref_object_dispose__65011;
    id v70 = 0;
    v67[0] = 0;
    v67[1] = v67;
    v67[2] = 0x3032000000;
    v67[3] = __Block_byref_object_copy__65010;
    v67[4] = __Block_byref_object_dispose__65011;
    id v68 = 0;
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2020000000;
    char v66 = 0;
    v22 = [(PLEmbeddingQuery *)self queryText];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke;
    v62[3] = &unk_1E586D0C0;
    v62[4] = v67;
    v62[5] = buf;
    v62[6] = v69;
    v62[7] = &v63;
    +[PLEmbeddingQueryParser parseQueryText:v22 photoLibrary:v42 dateFilter:v41 psiDatabase:v43 queryDepersonalization:a9 completion:v62];

    if ([(PLEmbeddingQuery *)self isCancelled])
    {
      v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41031 userInfo:0];
      v18[2](v18, 0, v23);

LABEL_39:
      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(v67, 8);

      _Block_object_dispose(v69, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_40;
    }
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke_2;
    v54[3] = &unk_1E586D0E8;
    v54[4] = self;
    v56 = v67;
    v57 = &v58;
    id v39 = v24;
    id v55 = v39;
    [v44 enumerateIndexesUsingBlock:v54];
    if (*((unsigned char *)v59 + 24))
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v78 = *MEMORY[0x1E4F28228];
      v79[0] = @"Error in generating the query vectors";
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
      id v27 = [v25 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v26];

      v18[2](v18, 0, v27);
LABEL_38:

      _Block_object_dispose(&v58, 8);
      goto LABEL_39;
    }
    if ([(PLEmbeddingQuery *)self isCancelled])
    {
      id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41031 userInfo:0];
      v18[2](v18, 0, v27);
      goto LABEL_38;
    }
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke_12;
    v49[3] = &unk_1E586D110;
    v49[4] = self;
    id v50 = v40;
    id v51 = v39;
    double v53 = a3;
    id v27 = v28;
    id v52 = v27;
    [v43 fetchEmbeddingsForModelTypes:v44 assetUUID:0 withBatchHandler:v49];
    if ([(PLEmbeddingQuery *)self isCancelled])
    {
      v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41031 userInfo:0];
      v18[2](v18, 0, v29);
    }
    else
    {
      if ([*((id *)v72 + 5) count])
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v31 = v27;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v77 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v46 != v33) {
                objc_enumerationMutation(v31);
              }
              v35 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              v36 = (void *)*((void *)v72 + 5);
              v37 = [v35 assetUUID];
              LODWORD(v36) = [v36 containsObject:v37];

              if (v36) {
                [v30 addObject:v35];
              }
            }
            uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v77 count:16];
          }
          while (v32);
        }

        id v27 = v30;
      }
      else if (*((unsigned char *)v64 + 24))
      {
        v18[2](v18, MEMORY[0x1E4F1CBF0], 0);
LABEL_37:

        goto LABEL_38;
      }
      if ([(PLEmbeddingQuery *)self isCancelled])
      {
        v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41031 userInfo:0];
        v18[2](v18, 0, v29);
      }
      else
      {
        v29 = [(PLEmbeddingQuery *)self _processSearchResults:v27 embeddingModelTypes:v44 sortAscending:0];
        if ([(PLEmbeddingQuery *)self isCancelled]
          || [(PLEmbeddingQuery *)self isCancelled])
        {
          v38 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41031 userInfo:0];
          v18[2](v18, 0, v38);
        }
        else
        {
          ((void (**)(id, void *, void *))v18)[2](v18, v29, 0);
        }
      }
    }

    goto LABEL_37;
  }
  v18[2](v18, 0, 0);
LABEL_40:
}

void __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke(void *a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = *(void *)(a1[4] + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v9;
  id v20 = v9;

  uint64_t v14 = *(void *)(a1[5] + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v10;
  id v16 = v10;

  uint64_t v17 = *(void *)(a1[6] + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v11;
  id v19 = v11;

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = a5;
}

void __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled]) {
    *a3 = 1;
  }
  double v6 = [*(id *)(a1 + 32) embeddingVectorGenerator];
  v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v8 = v7;
  if (!v7)
  {
    id v8 = [*(id *)(a1 + 32) queryText];
  }
  id v16 = 0;
  id v9 = [v6 embeddingVectorForString:v8 embeddingType:a2 error:&v16];
  id v10 = v16;
  if (!v7) {

  }
  if (v10 || ![v9 count])
  {
    id v11 = PLPhotosSearchGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v13 = v12;
      if (!v12)
      {
        v13 = [*(id *)(a1 + 32) queryText];
      }
      *(_DWORD *)buf = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Error: %@ generating vector for query: %@", buf, 0x16u);
      if (!v12) {
    }
      }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    uint64_t v14 = *(void **)(a1 + 40);
    v15 = [NSNumber numberWithUnsignedInteger:a2];
    [v14 setObject:v9 forKeyedSubscript:v15];
  }
}

void __192__PLEmbeddingQuery_executeEmbeddingSearchQueryWithSimilarityThreshold_embeddingModelTypes_scopedAssetUUIDs_dateFilter_psiDatabase_photoLibrary_queryDepersonalization_enableRanking_completion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    [v5 cancel];
  }
  else if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v22 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([*(id *)(a1 + 40) count])
          {
            v13 = *(void **)(a1 + 40);
            uint64_t v14 = [v12 assetUUID];
            LODWORD(v13) = [v13 containsObject:v14];

            if (!v13) {
              continue;
            }
          }
          v15 = *(void **)(a1 + 48);
          id v16 = NSNumber;
          id v17 = v12;
          id v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "modelType"));
          __int16 v19 = [v15 objectForKeyedSubscript:v18];

          id v20 = *(void **)(a1 + 32);
          id v23 = v17;
          LODWORD(v18) = [v20 _embeddingCompareObjectIsValidSearchResultForQuery:v19 forEmbeddingCompareObject:&v23 similarityThreshold:*(double *)(a1 + 64)];
          id v21 = v23;

          if (v18) {
            [*(id *)(a1 + 56) addObject:v21];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    id v5 = v22;
  }
}

- (PLEmbeddingQuery)initWithQueryText:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLEmbeddingQuery;
  id v5 = [(PLEmbeddingQuery *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = &stru_1EEB2EB80;
    }
    objc_storeStrong((id *)&v5->_queryText, v8);

    uint64_t v9 = objc_alloc_init(PLEmbeddingVectorGenerator);
    embeddingVectorGenerator = v5->_embeddingVectorGenerator;
    v5->_embeddingVectorGenerator = v9;
  }
  return v5;
}

@end