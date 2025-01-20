@interface TRIClientNamespaceMetadataStorage(Server)
- (BOOL)mergeNamespaceMetadata:()Server forNamespaceName:;
- (BOOL)removeOutdatedNamespaceMetadataForNamespaceName:()Server currentCompatibilityVersion:;
@end

@implementation TRIClientNamespaceMetadataStorage(Server)

- (BOOL)mergeNamespaceMetadata:()Server forNamespaceName:
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  v9 = [a1 urlForNamespaceMetadataForNamespaceName:v8];
  v10 = (void *)MEMORY[0x1E4FB0168];
  v11 = [v9 path];
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"TRIClientNamespaceMetadataStorage+Server.m", 29, @"Expression was unexpectedly nil/false: %@", @"[namespaceMetadataUrl path]" object file lineNumber description];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__TRIClientNamespaceMetadataStorage_Server__mergeNamespaceMetadata_forNamespaceName___block_invoke;
  v18[3] = &unk_1E6BBB698;
  v18[4] = a1;
  id v12 = v8;
  id v19 = v12;
  id v13 = v7;
  id v20 = v13;
  v21 = &v23;
  uint64_t v22 = a2;
  char v14 = [v10 acquireLockOnPath:v11 fileLockMode:1 blocking:1 andRunBlock:v18];

  if (v14) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = *((unsigned char *)v24 + 24) != 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (BOOL)removeOutdatedNamespaceMetadataForNamespaceName:()Server currentCompatibilityVersion:
{
  id v7 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  id v8 = [a1 urlForNamespaceMetadataForNamespaceName:v7];
  v9 = (void *)MEMORY[0x1E4FB0168];
  v10 = [v8 path];
  if (!v10)
  {
    BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"TRIClientNamespaceMetadataStorage+Server.m", 75, @"Expression was unexpectedly nil/false: %@", @"[namespaceMetadataUrl path]" object file lineNumber description];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __121__TRIClientNamespaceMetadataStorage_Server__removeOutdatedNamespaceMetadataForNamespaceName_currentCompatibilityVersion___block_invoke;
  v16[3] = &unk_1E6BBB6C0;
  v16[4] = a1;
  id v11 = v7;
  id v17 = v11;
  v18 = &v21;
  int v20 = a4;
  uint64_t v19 = a2;
  char v12 = [v9 acquireLockOnPath:v10 fileLockMode:1 blocking:1 andRunBlock:v16];

  if (v12) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = *((unsigned char *)v22 + 24) != 0;
  }

  _Block_object_dispose(&v21, 8);
  return v13;
}

@end