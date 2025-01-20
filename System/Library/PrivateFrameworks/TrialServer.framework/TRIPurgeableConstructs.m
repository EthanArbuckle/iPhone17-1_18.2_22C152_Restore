@interface TRIPurgeableConstructs
- (NSMutableDictionary)cacheDeleteableFactorsByNamespaceName;
- (NSMutableDictionary)eagerPurgeableFactorsByNamespaceName;
- (NSMutableSet)namespaceNamesPurgeableAtNamespaceLevel;
- (TRIPurgeableConstructs)initWithPurgeabilityLevel:(int)a3 purgeableNamespacesProvider:(id)a4 paths:(id)a5;
@end

@implementation TRIPurgeableConstructs

- (TRIPurgeableConstructs)initWithPurgeabilityLevel:(int)a3 purgeableNamespacesProvider:(id)a4 paths:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TRIPurgeableConstructs;
  v10 = [(TRIPurgeableConstructs *)&v25 init];
  v11 = v10;
  if (v10)
  {
    p_eagerPurgeableFactorsByNamespaceName = (id *)&v10->_eagerPurgeableFactorsByNamespaceName;
    [v8 partitionPurgeableNamespacesForPurgeabilityLevel:v6 namespaceNamesPurgeableAtNamespaceLevel:&v10->_namespaceNamesPurgeableAtNamespaceLevel eagerPurgeableFactorsByNamespaceName:&v10->_eagerPurgeableFactorsByNamespaceName cacheDeleteableFactorsByNamespaceName:&v10->_cacheDeleteableFactorsByNamespaceName];
    v13 = TRILogCategory_Server();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(NSMutableSet *)v11->_namespaceNamesPurgeableAtNamespaceLevel count];
      uint64_t v15 = [*p_eagerPurgeableFactorsByNamespaceName count];
      *(_DWORD *)buf = 134218240;
      uint64_t v27 = v14;
      __int16 v28 = 2048;
      uint64_t v29 = v15;
      _os_log_impl(&dword_1DA291000, v13, OS_LOG_TYPE_DEFAULT, "Found %lu purgeable namespaces and %lu namespaces with purgeable factors", buf, 0x16u);
    }

    v16 = objc_opt_new();
    id v17 = *p_eagerPurgeableFactorsByNamespaceName;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__TRIPurgeableConstructs_initWithPurgeabilityLevel_purgeableNamespacesProvider_paths___block_invoke;
    v22[3] = &unk_1E6BB80A0;
    id v23 = v9;
    id v18 = v16;
    id v24 = v18;
    [v17 enumerateKeysAndObjectsUsingBlock:v22];
    id v19 = *p_eagerPurgeableFactorsByNamespaceName;
    id *p_eagerPurgeableFactorsByNamespaceName = v18;
    id v20 = v18;
  }
  return v11;
}

void __86__TRIPurgeableConstructs_initWithPurgeabilityLevel_purgeableNamespacesProvider_paths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x1E4FB01B0];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  id v13 = [v5 factorProviderWithPaths:v6 namespaceName:v8];
  id v9 = (void *)MEMORY[0x1E4F1CA80];
  v10 = [v7 allObjects];

  v11 = [v13 factorNamesWithObfuscation:v10];
  v12 = [v9 setWithArray:v11];

  [*(id *)(a1 + 40) setObject:v12 forKey:v8];
}

- (NSMutableSet)namespaceNamesPurgeableAtNamespaceLevel
{
  return (NSMutableSet *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)eagerPurgeableFactorsByNamespaceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)cacheDeleteableFactorsByNamespaceName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteableFactorsByNamespaceName, 0);
  objc_storeStrong((id *)&self->_eagerPurgeableFactorsByNamespaceName, 0);
  objc_storeStrong((id *)&self->_namespaceNamesPurgeableAtNamespaceLevel, 0);
}

@end