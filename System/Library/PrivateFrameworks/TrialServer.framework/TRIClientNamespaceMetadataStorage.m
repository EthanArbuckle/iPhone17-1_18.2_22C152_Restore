@interface TRIClientNamespaceMetadataStorage
@end

@implementation TRIClientNamespaceMetadataStorage

void __85__TRIClientNamespaceMetadataStorage_Server__mergeNamespaceMetadata_forNamespaceName___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) loadNamespaceMetadataForNamespaceName:*(void *)(a1 + 40) error:0];
  v3 = v2;
  if (v2
    && (int v4 = [v2 compatibilityVersion],
        v4 == [*(id *)(a1 + 48) compatibilityVersion]))
  {
    id v5 = v3;
    v6 = [*(id *)(a1 + 48) factorNamePurgeabilityLevels];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85__TRIClientNamespaceMetadataStorage_Server__mergeNamespaceMetadata_forNamespaceName___block_invoke_2;
    v21[3] = &unk_1E6BBB670;
    id v7 = v5;
    id v22 = v7;
    [v6 enumerateKeysAndEnumsUsingBlock:v21];
  }
  else
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEBUG, "Found ClientNamespaceMetadata with different compatibility version, overwriting", buf, 2u);
    }

    id v7 = *(id *)(a1 + 48);
  }
  v9 = [*(id *)(a1 + 32) urlForNamespaceMetadataForNamespaceName:*(void *)(a1 + 40)];
  v10 = [v7 data];
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"TRIClientNamespaceMetadataStorage+Server.m", 51, @"Expression was unexpectedly nil/false: %@", @"[mergedNamespaceMetadata data]" object file lineNumber description];
  }
  v11 = [v9 URLByDeletingLastPathComponent];
  v12 = [v11 path];

  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 32), @"TRIClientNamespaceMetadataStorage+Server.m", 52, @"Expression was unexpectedly nil/false: %@", @"[[metadataURL URLByDeletingLastPathComponent] path]" object file lineNumber description];
  }
  if (([MEMORY[0x1E4F28CB8] triIdempotentCreateDirectoryOrFaultWithPath:v12] & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  id v20 = 0;
  char v13 = [v10 writeToURL:v9 options:268435457 error:&v20];
  id v14 = v20;
  if ((v13 & 1) == 0)
  {
    v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = TRILoggedNamespaceName(*(void **)(a1 + 40));
      int v17 = [*(id *)(a1 + 48) compatibilityVersion];
      *(_DWORD *)buf = 138543874;
      v24 = v16;
      __int16 v25 = 1024;
      int v26 = v17;
      __int16 v27 = 2114;
      id v28 = v14;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to write TRIClientNamespaceMetadata for namespace %{public}@ and compatibility version %u: %{public}@", buf, 0x1Cu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void __85__TRIClientNamespaceMetadataStorage_Server__mergeNamespaceMetadata_forNamespaceName___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 factorNamePurgeabilityLevels];
  [v6 setEnum:a3 forKey:v5];
}

void __121__TRIClientNamespaceMetadataStorage_Server__removeOutdatedNamespaceMetadataForNamespaceName_currentCompatibilityVersion___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v16 = 0;
  int v4 = [v2 loadNamespaceMetadataForNamespaceName:v3 error:&v16];
  id v5 = v16;
  if (v5) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  if (!v4 || [v4 compatibilityVersion] == *(_DWORD *)(a1 + 64))
  {
    char v6 = 1;
LABEL_6:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;
    goto LABEL_7;
  }
  id v7 = [*(id *)(a1 + 32) urlForNamespaceMetadataForNamespaceName:*(void *)(a1 + 40)];
  v8 = [v7 path];

  if (!v8)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"TRIClientNamespaceMetadataStorage+Server.m", 91, @"Expression was unexpectedly nil/false: %@", @"[[self urlForNamespaceMetadataForNamespaceName:namespaceName] path]" object file lineNumber description];
  }
  id v5 = v8;
  if (unlink((const char *)[v5 fileSystemRepresentation]) && *__error() != 2)
  {
    v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = TRILoggedNamespaceName(*(void **)(a1 + 40));
      int v11 = [v4 compatibilityVersion];
      v12 = __error();
      char v13 = strerror(*v12);
      int v14 = *__error();
      *(_DWORD *)buf = 138544130;
      v18 = v10;
      __int16 v19 = 1024;
      int v20 = v11;
      __int16 v21 = 2080;
      id v22 = v13;
      __int16 v23 = 1024;
      int v24 = v14;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Failed to delete outdated TRIClientNamespaceMetadata for namespace %{public}@ and compatibility version %u: %s (%d)", buf, 0x22u);
    }
    char v6 = 0;
    goto LABEL_6;
  }
LABEL_7:
}

@end