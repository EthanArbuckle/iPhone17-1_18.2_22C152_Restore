@interface TRIClientNamespaceMetadataStorage
- (TRIClientNamespaceMetadataStorage)initWithPaths:(id)a3;
- (id)loadNamespaceMetadataForNamespaceName:(id)a3 error:(id *)a4;
- (id)urlForNamespaceMetadataForNamespaceName:(id)a3;
@end

@implementation TRIClientNamespaceMetadataStorage

- (TRIClientNamespaceMetadataStorage)initWithPaths:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRIClientNamespaceMetadataStorage;
  v6 = [(TRIClientNamespaceMetadataStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_paths, a3);
  }

  return v7;
}

- (id)loadNamespaceMetadataForNamespaceName:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(TRIClientNamespaceMetadataStorage *)self urlForNamespaceMetadataForNamespaceName:v6];
  id v21 = 0;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v7 options:1 error:&v21];
  id v9 = v21;
  id v10 = v9;
  if (!v8)
  {
    v14 = [v9 domain];
    v15 = v14;
    if (v14 == (void *)*MEMORY[0x1E4F281F8])
    {
      uint64_t v16 = [v10 code];

      if (v16 == 260)
      {
        v17 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v6;
          _os_log_debug_impl(&dword_19D909000, v17, OS_LOG_TYPE_DEBUG, "No namespace metadata found for namespace name %@", buf, 0xCu);
        }

LABEL_19:
        id v13 = 0;
        goto LABEL_20;
      }
    }
    else
    {
    }
    v18 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_error_impl(&dword_19D909000, v18, OS_LOG_TYPE_ERROR, "Unable to read metadata URL: %@", buf, 0xCu);
    }

    if (a4)
    {
      id v10 = v10;
      id v13 = 0;
      *a4 = v10;
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  id v20 = 0;
  v11 = +[TRIPBMessage parseFromData:v8 error:&v20];
  id v10 = v20;
  if (v10)
  {
    v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v10;
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "Failed to deserialize TRIClientNamespaceMetadata data with error %@", buf, 0xCu);
    }

    id v13 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    id v13 = v11;
  }

LABEL_20:
  return v13;
}

- (id)urlForNamespaceMetadataForNamespaceName:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [(TRIPaths *)self->_paths treatmentsDir];
  v12[0] = v7;
  v12[1] = v5;
  v12[2] = @"metadata.pb";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  id v9 = [v6 fileURLWithPathComponents:v8];

  if (!v9)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIClientNamespaceMetadataStorage.m", 73, @"Expression was unexpectedly nil/false: %@", @"[NSURL fileURLWithPathComponents:@[[_paths treatmentsDir], namespaceName, @\"metadata.pb\"]]" object file lineNumber description];
  }
  return v9;
}

- (void).cxx_destruct
{
}

@end