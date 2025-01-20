@interface TRIPurgeabilityLevelMapper
+ (id)purgeabilityLevelFromCacheDeleteUrgency:(int)a3;
+ (int)availableSpaceClassFromPurgeabilityLevel:(int)a3;
- (TRIPurgeabilityLevelMapper)initWithPaths:(id)a3 namespaceMetadataStorage:(id)a4;
- (int)availableSpaceClassForFactorNames:(id)a3 namespaceName:(id)a4;
- (int)purgeabilityLevelForNamespace:(id)a3;
@end

@implementation TRIPurgeabilityLevelMapper

- (TRIPurgeabilityLevelMapper)initWithPaths:(id)a3 namespaceMetadataStorage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIPurgeabilityLevelMapper;
  v9 = [(TRIPurgeabilityLevelMapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_paths, a3);
    objc_storeStrong((id *)&v10->_namespaceMetadataStorage, a4);
  }

  return v10;
}

+ (id)purgeabilityLevelFromCacheDeleteUrgency:(int)a3
{
  if ((a3 - 1) > 3) {
    return 0;
  }
  else {
    return (id)qword_1E596AFC8[a3 - 1];
  }
}

+ (int)availableSpaceClassFromPurgeabilityLevel:(int)a3
{
  if ((a3 - 1) > 2) {
    return 1;
  }
  else {
    return dword_19D98C5D8[a3 - 1];
  }
}

- (int)purgeabilityLevelForNamespace:(id)a3
{
  paths = self->_paths;
  id v4 = a3;
  v5 = [(TRIPaths *)paths namespaceDescriptorsDefaultDir];
  v6 = +[TRINamespaceDescriptor loadWithNamespaceName:v4 fromDirectory:v5];

  if (v6) {
    int v7 = [v6 purgeabilityLevel];
  }
  else {
    int v7 = 3;
  }

  return v7;
}

- (int)availableSpaceClassForFactorNames:(id)a3 namespaceName:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TRIClientNamespaceMetadataStoring *)self->_namespaceMetadataStorage loadNamespaceMetadataForNamespaceName:v7 error:0];
  v9 = (void *)v8;
  if (v6 && v8)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      v20 = self;
      LODWORD(v13) = 0;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          int v21 = 0;
          v17 = objc_msgSend(v9, "factorNamePurgeabilityLevels", v20);
          LOBYTE(v16) = [v17 getEnum:&v21 forKey:v16];

          if ((v16 & 1) == 0)
          {
            uint64_t v13 = [(TRIPurgeabilityLevelMapper *)v20 purgeabilityLevelForNamespace:v7];
            goto LABEL_18;
          }
          if ((int)v13 <= v21) {
            uint64_t v13 = v21;
          }
          else {
            uint64_t v13 = v13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
LABEL_18:
  }
  else
  {
    uint64_t v13 = [(TRIPurgeabilityLevelMapper *)self purgeabilityLevelForNamespace:v7];
  }
  int v18 = +[TRIPurgeabilityLevelMapper availableSpaceClassFromPurgeabilityLevel:v13];

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceMetadataStorage, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end