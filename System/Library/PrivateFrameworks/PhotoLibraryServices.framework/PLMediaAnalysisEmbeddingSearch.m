@interface PLMediaAnalysisEmbeddingSearch
+ (BOOL)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5;
+ (double)_scalingFactorForNumberOfProbes;
+ (id)_numberOfProbesForEmbeddingSearchWithLimit:(int)a3;
+ (id)_searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 searchOptions:(id)a5 numberOfProbes:(id)a6 error:(id *)a7;
+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 error:(id *)a5;
+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 searchOptions:(id)a5 error:(id *)a6;
+ (unint64_t)_minimumNumberOfProbes;
@end

@implementation PLMediaAnalysisEmbeddingSearch

+ (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  getMADEmbeddingClass();
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    v9 = [getMADEmbeddingClass() fetchEmbeddingsWithAssetUUIDs:v7 photoLibraryURL:v8 options:0 error:a5];
    v10 = v9;
    if (a5)
    {
      id v11 = 0;
      if (*a5 || !v9) {
        goto LABEL_12;
      }
    }
    else if (!v9)
    {
      id v11 = 0;
      goto LABEL_12;
    }
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__PLMediaAnalysisEmbeddingSearch_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_error___block_invoke;
    v16[3] = &unk_1E5875818;
    id v11 = v14;
    id v17 = v11;
    [v10 enumerateKeysAndObjectsUsingBlock:v16];
  }
  else
  {
    if (!a5)
    {
      id v11 = 0;
      goto LABEL_13;
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    v19[0] = @"MediaAnalysis does not supported the expected SPI.";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v12 errorWithDomain:v13 code:46309 userInfo:v10];
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

LABEL_13:
  return v11;
}

void __86__PLMediaAnalysisEmbeddingSearch_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[PLMediaAnalysisEmbedding alloc] initWithMADEmbedding:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

+ (BOOL)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  getMADEmbeddingClass();
  objc_opt_class();
  char v8 = objc_opt_respondsToSelector();
  if (v8)
  {
    [getMADEmbeddingClass() prewarmSearchWithConcurrencyLimit:a3 photoLibraryURL:v7 error:a5];
  }
  else if (a5)
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    uint64_t v13 = *MEMORY[0x1E4F28228];
    v14[0] = @"MediaAnalysis does not support the expected search prewarming SPI.";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a5 = [v9 errorWithDomain:v10 code:46309 userInfo:v11];
  }
  return v8 & 1;
}

+ (id)_searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 searchOptions:(id)a5 numberOfProbes:(id)a6 error:(id *)a7
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v50 = a4;
  id v51 = a5;
  id v48 = a6;
  getMADEmbeddingClass();
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2050000000;
    id v11 = (void *)getMADEmbeddingSearchOptionsClass_softClass;
    uint64_t v81 = getMADEmbeddingSearchOptionsClass_softClass;
    if (!getMADEmbeddingSearchOptionsClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v89 = __getMADEmbeddingSearchOptionsClass_block_invoke;
      v90 = &unk_1E5875840;
      v91 = &v78;
      __getMADEmbeddingSearchOptionsClass_block_invoke((uint64_t)&buf);
      id v11 = (void *)v79[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v78, 8);
    v52 = [v12 defaultOptions];
    objc_msgSend(v52, "setResultLimit:", objc_msgSend(v51, "resultLimit"));
    if (objc_opt_respondsToSelector())
    {
      uint64_t v13 = [v51 assetUUIDsForPrefilter];
      [v52 setAssetUUIDs:v13];
      if ([v13 count])
      {
        v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [v13 count];
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v15;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "[PLMediaAnalysisEmbeddingSearch] Using %lu assets for prefiltering", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    uint64_t v16 = [v51 fullScan];
    if (objc_opt_respondsToSelector())
    {
      [v52 setFullScan:v16];
      if (v16)
      {
        id v17 = PLBackendGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "[PLMediaAnalysisEmbeddingSearch] Using full scan (brute force) for embedding search.", (uint8_t *)&buf, 2u);
        }
      }
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v18 = [v51 numConcurrentReaders];
      [v52 setNumConcurrentReaders:v18];
    }
    if (!(v16 & 1 | ((objc_opt_respondsToSelector() & 1) == 0)))
    {
      [v52 setNumberOfProbes:v48];
      v19 = PLBackendGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v52 numberOfProbes];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "[PLMediaAnalysisEmbeddingSearch] Using number of probes = %@", (uint8_t *)&buf, 0xCu);
      }
    }
    v47 = [getMADEmbeddingClass() searchWithEmbeddings:v49 photoLibraryURL:v50 options:v52 error:a7];
    if (a7)
    {
      id v58 = 0;
      if (*a7 || !v47) {
        goto LABEL_66;
      }
    }
    else if (!v47)
    {
      id v58 = 0;
LABEL_66:

LABEL_69:
      goto LABEL_70;
    }
    id v58 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v47, "count"));
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    obuint64_t j = v47;
    uint64_t v60 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v60)
    {
      uint64_t v57 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v60; ++i)
        {
          if (*(void *)v75 != v57) {
            objc_enumerationMutation(obj);
          }
          v23 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v23, "count"));
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v25 = v23;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v70 objects:v86 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v71;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v71 != v27) {
                  objc_enumerationMutation(v25);
                }
                v29 = *(void **)(*((void *)&v70 + 1) + 8 * j);
                v30 = [PLMediaAnalysisEmbeddingSearchResult alloc];
                v31 = [v29 assetUUID];
                v32 = [v29 distance];
                v33 = [(PLMediaAnalysisEmbeddingSearchResult *)v30 initWithAssetUUID:v31 distance:v32];
                [v24 addObject:v33];
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v70 objects:v86 count:16];
            }
            while (v26);
          }

          [v58 addObject:v24];
        }
        uint64_t v60 = [obj countByEnumeratingWithState:&v74 objects:v87 count:16];
      }
      while (v60);
    }

    goto LABEL_66;
  }
  getMADEmbeddingClass();
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    v52 = objc_msgSend(getMADEmbeddingClass(), "searchWithEmbeddings:photoLibraryURL:attributeFilters:limit:error:", v49, v50, 0, objc_msgSend(v51, "resultLimit"), a7);
    v56 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v52, "count"));
    if (a7)
    {
      id v58 = 0;
      if (*a7 || !v52) {
        goto LABEL_68;
      }
    }
    else if (!v52)
    {
      id v58 = 0;
LABEL_68:

      goto LABEL_69;
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obja = v52;
    uint64_t v61 = [obja countByEnumeratingWithState:&v66 objects:v85 count:16];
    if (v61)
    {
      id v59 = *(id *)v67;
      do
      {
        for (uint64_t k = 0; k != v61; ++k)
        {
          if (*(id *)v67 != v59) {
            objc_enumerationMutation(obja);
          }
          v35 = *(void **)(*((void *)&v66 + 1) + 8 * k);
          v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count"));
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v37 = v35;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v84 count:16];
          if (v38)
          {
            uint64_t v39 = *(void *)v63;
            do
            {
              for (uint64_t m = 0; m != v38; ++m)
              {
                if (*(void *)v63 != v39) {
                  objc_enumerationMutation(v37);
                }
                v41 = *(void **)(*((void *)&v62 + 1) + 8 * m);
                v42 = [PLMediaAnalysisEmbeddingSearchResult alloc];
                v43 = [v41 stringIdentifier];
                v44 = [v41 value];
                v45 = [(PLMediaAnalysisEmbeddingSearchResult *)v42 initWithAssetUUID:v43 distance:v44];
                [v36 addObject:v45];
              }
              uint64_t v38 = [v37 countByEnumeratingWithState:&v62 objects:v84 count:16];
            }
            while (v38);
          }

          [v56 addObject:v36];
        }
        uint64_t v61 = [obja countByEnumeratingWithState:&v66 objects:v85 count:16];
      }
      while (v61);
    }

    id v58 = v56;
    goto LABEL_68;
  }
  if (a7)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v82 = *MEMORY[0x1E4F28228];
    v83 = @"MediaAnalysis does not supported the expected SPI.";
    v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
    [v21 errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:v53];
    id v58 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v58 = 0;
  }
LABEL_70:

  return v58;
}

+ (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 searchOptions:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_msgSend(a1, "_numberOfProbesForEmbeddingSearchWithLimit:", objc_msgSend(v10, "resultLimit"));
  v14 = [a1 _searchWithEmbeddings:v12 photoLibraryURL:v11 searchOptions:v10 numberOfProbes:v13 error:a6];

  return v14;
}

+ (id)_numberOfProbesForEmbeddingSearchWithLimit:(int)a3
{
  uint64_t v5 = [a1 _minimumNumberOfProbes];
  double v6 = (double)a3 / 100.0;
  if (v6 >= (double)v5)
  {
    objc_msgSend(a1, "_scalingFactorForNumberOfProbes", v5);
    uint64_t v5 = (uint64_t)(v6 * v7);
  }
  char v8 = [NSNumber numberWithInteger:v5];
  return v8;
}

+ (double)_scalingFactorForNumberOfProbes
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 doubleForKey:@"PLVectorSearchKitScalingFactorForNumberOfProbes"];
  double v4 = v3;

  double result = 1.0;
  if (v4 > 0.0) {
    return v4;
  }
  return result;
}

+ (unint64_t)_minimumNumberOfProbes
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"PLVectorSearchKitMinimumNumberOfProbes"];

  if (v3 <= 0) {
    return 40;
  }
  else {
    return v3;
  }
}

@end