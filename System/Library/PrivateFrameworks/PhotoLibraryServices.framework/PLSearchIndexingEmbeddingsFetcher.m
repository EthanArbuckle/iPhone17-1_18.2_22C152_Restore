@interface PLSearchIndexingEmbeddingsFetcher
- (PLSearchIndexingEmbeddingsFetcher)init;
- (id)embeddingForAsset:(id)a3 indexingContext:(id)a4 allowFetchIfMissing:(BOOL)a5;
- (void)prefetchEmbeddingsForAssets:(id)a3 indexingContext:(id)a4;
@end

@implementation PLSearchIndexingEmbeddingsFetcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchError, 0);
  objc_storeStrong((id *)&self->_mutableEmbeddingsByUUID, 0);
}

- (id)embeddingForAsset:(id)a3 indexingContext:(id)a4 allowFetchIfMissing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 uuid];
  if ((PLSearchSemanticSearchIndexingSupported() & 1) == 0)
  {
    v14 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Embedding donations not supported. Skipping embedding donation for asset UUID: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  PLSearchIndexingShouldFetchEmbeddingsForAsset(v8);
  if ((v11 & 1) == 0)
  {
    v14 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Embedding fetch pre-gating returned NO for asset UUID: %@. Skipping embedding fetch.", buf, 0xCu);
    }
LABEL_10:

    v15 = (void *)MEMORY[0x1E4F8B9B8];
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
    uint64_t v13 = [v15 failureWithError:v12];
    goto LABEL_11;
  }
  v12 = [(NSMutableDictionary *)self->_mutableEmbeddingsByUUID objectForKeyedSubscript:v10];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F8B9B8] successWithResult:v12];
LABEL_11:
    v16 = (void *)v13;
    goto LABEL_12;
  }
  uint64_t v18 = *MEMORY[0x1E4F8C500];
  if ((PLErrorOrUnderlyingErrorHasDomainAndCode() & 1) == 0 && !v5)
  {
    prefetchError = self->_prefetchError;
    if (prefetchError)
    {
      v12 = prefetchError;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28228];
      v29 = [NSString stringWithFormat:@"Missing CSEmbedding for asset UUID: %@", v10];
      v42 = v29;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      v12 = [v28 errorWithDomain:v18 code:46502 userInfo:v30];
    }
    uint64_t v13 = [MEMORY[0x1E4F8B9B8] failureWithError:v12];
    goto LABEL_11;
  }
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v20 = (void *)getMADEmbeddingClass_softClass;
  uint64_t v40 = getMADEmbeddingClass_softClass;
  if (!getMADEmbeddingClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMADEmbeddingClass_block_invoke;
    v44 = &unk_1E5875840;
    v45 = &v37;
    __getMADEmbeddingClass_block_invoke((uint64_t)buf);
    v20 = (void *)v38[3];
  }
  id v21 = v20;
  _Block_object_dispose(&v37, 8);
  v22 = [v8 photoLibrary];
  v23 = [v22 pathManager];
  v24 = [v23 libraryURL];
  id v36 = 0;
  v25 = [v21 fetchEmbeddingWithAssetUUID:v10 photoLibraryURL:v24 options:0 error:&v36];
  id v26 = v36;

  if (v26)
  {
    v27 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2112;
      v44 = v26;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Error while fetching CSEmbedding from MediaAnalysis for asset UUID: %{public}@, MADEmbedding: %@, Error: %@", buf, 0x20u);
    }
  }
  v12 = [v25 csEmbedding];
  if (v12)
  {
    v16 = [MEMORY[0x1E4F8B9B8] successWithResult:v12];
  }
  else
  {
    v31 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Missing CSEmbedding for asset UUID: %{public}@, MADEmbedding: %@", buf, 0x16u);
    }

    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v33 = [NSString stringWithFormat:@"Missing CSEmbedding for asset UUID: %@, MADEmbedding: %@", v10, v25];
    [v32 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F28228]];

    [v32 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    v34 = (void *)MEMORY[0x1E4F8B9B8];
    v35 = [MEMORY[0x1E4F28C58] errorWithDomain:v18 code:46502 userInfo:v32];
    v16 = [v34 failureWithError:v35];
  }
LABEL_12:

  return v16;
}

- (void)prefetchEmbeddingsForAssets:(id)a3 indexingContext:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (PLSearchSemanticSearchIndexingSupported())
  {
    v38 = self;
    id v39 = v7;
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v40 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v12 = 0;
      uint64_t v13 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          PLSearchIndexingShouldFetchEmbeddingsForAsset(v15);
          if (v16)
          {
            v17 = [v15 photoLibrary];
            uint64_t v18 = [v17 pathManager];
            uint64_t v19 = [v18 libraryURL];

            v20 = [v15 uuid];
            [v8 addObject:v20];
            v12 = v19;
          }
          else
          {
            v20 = PLSearchBackendModelTranslationGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              id v21 = [v15 uuid];
              *(_DWORD *)buf = 138412290;
              id v50 = v21;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Embedding fetch pre-gating returned NO for asset UUID: %@. Skipping embedding fetch.", buf, 0xCu);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    id v42 = 0;
    v23 = +[PLMediaAnalysisEmbeddingSearch fetchEmbeddingsWithAssetUUIDs:v22 photoLibraryURL:v12 error:&v42];
    id v24 = v42;
    id v25 = v42;

    if (v23)
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __81__PLSearchIndexingEmbeddingsFetcher_prefetchEmbeddingsForAssets_indexingContext___block_invoke;
      v41[3] = &unk_1E5867870;
      v41[4] = v38;
      [v23 enumerateKeysAndObjectsUsingBlock:v41];
LABEL_28:

      id v7 = v39;
      id v6 = v40;
      goto LABEL_29;
    }
    uint64_t v26 = *MEMORY[0x1E4F8C500];
    int HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode();
    v28 = PLSearchBackendModelTranslationGetLog();
    v29 = v28;
    if (HasDomainAndCode)
    {
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      *(_WORD *)buf = 0;
      v30 = "Batch fetch embeddings API unsupported";
      v31 = v29;
      os_log_type_t v32 = OS_LOG_TYPE_DEBUG;
      uint32_t v33 = 2;
    }
    else
    {
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543618;
      id v50 = v8;
      __int16 v51 = 2112;
      id v52 = v25;
      v30 = "Error while fetching CSEmbeddings from MediaAnalysis for asset UUIDs: %{public}@, Error: %@";
      v31 = v29;
      os_log_type_t v32 = OS_LOG_TYPE_ERROR;
      uint32_t v33 = 22;
    }
    _os_log_impl(&dword_19B3C7000, v31, v32, v30, buf, v33);
LABEL_25:

    if (v25)
    {
      objc_storeStrong((id *)&v38->_prefetchError, v24);
    }
    else
    {
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v47 = *MEMORY[0x1E4F28228];
      v48 = @"fetch embeddings failed with unknown error";
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      uint64_t v36 = [v34 errorWithDomain:v26 code:46502 userInfo:v35];
      prefetchError = v38->_prefetchError;
      v38->_prefetchError = (NSError *)v36;
    }
    goto LABEL_28;
  }
  v12 = PLSearchBackendModelTranslationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v50 = v6;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Embedding donations not supported. Skipping embedding donation for assets: %@", buf, 0xCu);
  }
LABEL_29:
}

void __81__PLSearchIndexingEmbeddingsFetcher_prefetchEmbeddingsForAssets_indexingContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 csEmbedding];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKeyedSubscript:v5];
}

- (PLSearchIndexingEmbeddingsFetcher)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLSearchIndexingEmbeddingsFetcher;
  v2 = [(PLSearchIndexingEmbeddingsFetcher *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mutableEmbeddingsByUUID = v2->_mutableEmbeddingsByUUID;
    v2->_mutableEmbeddingsByUUID = v3;

    prefetchError = v2->_prefetchError;
    v2->_prefetchError = 0;
  }
  return v2;
}

@end