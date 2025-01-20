@interface TRIPurgeableNamespacesProvider
- (TRIPurgeableNamespacesProvider)initWithPaths:(id)a3 clientNamespaceMetadataStorage:(id)a4;
- (void)partitionPurgeableNamespacesForPurgeabilityLevel:(int)a3 namespaceNamesPurgeableAtNamespaceLevel:(id *)a4 eagerPurgeableFactorsByNamespaceName:(id *)a5 cacheDeleteableFactorsByNamespaceName:(id *)a6;
@end

@implementation TRIPurgeableNamespacesProvider

- (TRIPurgeableNamespacesProvider)initWithPaths:(id)a3 clientNamespaceMetadataStorage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIPurgeableNamespacesProvider;
  v9 = [(TRIPurgeableNamespacesProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_clientNamespaceMetadataStorage, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientNamespaceMetadataStorage, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

- (void)partitionPurgeableNamespacesForPurgeabilityLevel:(int)a3 namespaceNamesPurgeableAtNamespaceLevel:(id *)a4 eagerPurgeableFactorsByNamespaceName:(id *)a5 cacheDeleteableFactorsByNamespaceName:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v37 = objc_opt_new();
  v35 = objc_opt_new();
  v36 = objc_opt_new();
  context = (void *)MEMORY[0x1E016E7F0]();
  id v8 = (void *)MEMORY[0x1E4FB01A0];
  v9 = [(TRIPaths *)self->_paths namespaceDescriptorsDefaultDir];
  v10 = [v8 descriptorsForDirectory:v9 filterBlock:0];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v10;
  uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v16 = [v15 namespaceName];
        if ((int)[v15 purgeabilityLevel] <= a3) {
          [v37 addObject:v16];
        }
        clientNamespaceMetadataStorage = self->_clientNamespaceMetadataStorage;
        id v44 = 0;
        v18 = [(TRIClientNamespaceMetadataStoring *)clientNamespaceMetadataStorage loadNamespaceMetadataForNamespaceName:v16 error:&v44];
        id v19 = v44;
        v20 = v19;
        if (v19 || !v18)
        {
          if (!v19) {
            goto LABEL_16;
          }
          v23 = TRILogCategory_Server();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v34 = [v15 namespaceName];
            v24 = TRILoggedNamespaceName(v34);
            *(_DWORD *)buf = 138543362;
            v50 = v24;
            _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "Unable to load metadata for namespace %{public}@", buf, 0xCu);
          }
        }
        else
        {
          int v21 = [v18 compatibilityVersion];
          if (v21 != [v15 downloadNCV]) {
            goto LABEL_16;
          }
          v22 = [v18 factorNamePurgeabilityLevels];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __198__TRIPurgeableNamespacesProvider_partitionPurgeableNamespacesForPurgeabilityLevel_namespaceNamesPurgeableAtNamespaceLevel_eagerPurgeableFactorsByNamespaceName_cacheDeleteableFactorsByNamespaceName___block_invoke;
          v39[3] = &unk_1E6BBD098;
          v40 = v36;
          id v41 = v16;
          int v43 = a3;
          id v42 = v35;
          [v22 enumerateKeysAndEnumsUsingBlock:v39];

          v23 = v40;
        }

LABEL_16:
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v12);
  }

  id v25 = *a4;
  *a4 = v37;
  id v26 = v37;

  id v27 = *a5;
  *a5 = v35;
  id v28 = v35;

  id v29 = *a6;
  *a6 = v36;
}

void __198__TRIPurgeableNamespacesProvider_partitionPurgeableNamespacesForPurgeabilityLevel_namespaceNamesPurgeableAtNamespaceLevel_eagerPurgeableFactorsByNamespaceName_cacheDeleteableFactorsByNamespaceName___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v11 = a2;
  v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v5)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else
  {
    v6 = objc_opt_new();
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v7 addObject:v11];

  if (*(_DWORD *)(a1 + 56) >= a3)
  {
    id v8 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (v8)
    {
      [*(id *)(a1 + 48) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    else
    {
      v9 = objc_opt_new();
      [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    v10 = [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v10 addObject:v11];
  }
}

@end