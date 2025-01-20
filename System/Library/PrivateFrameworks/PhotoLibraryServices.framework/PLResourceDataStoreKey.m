@interface PLResourceDataStoreKey
+ (BOOL)refreshSandboxExtensionForURL:(id)a3 assetID:(id)a4 error:(id *)a5;
+ (BOOL)refreshSandboxExtensionForURL:(id)a3 libraryID:(id)a4 assetUUID:(id)a5 error:(id *)a6;
- (BOOL)isEqualToKey:(id)a3;
- (PLResourceDataStoreKey)initWithKeyStruct:(const void *)a3;
- (id)descriptionForAssetID:(id)a3;
- (id)fileURLForAssetID:(id)a3;
- (id)keyData;
- (id)uniformTypeIdentifier;
- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4;
@end

@implementation PLResourceDataStoreKey

+ (BOOL)refreshSandboxExtensionForURL:(id)a3 assetID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [v8 libraryID];
  v11 = [v8 uuid];

  LOBYTE(a5) = [a1 refreshSandboxExtensionForURL:v9 libraryID:v10 assetUUID:v11 error:a5];
  return (char)a5;
}

+ (BOOL)refreshSandboxExtensionForURL:(id)a3 libraryID:(id)a4 assetUUID:(id)a5 error:(id *)a6
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((PLIsAssetsd() & 1) != 0
    || !PLIsLimitedLibraryClient()
    || ![v9 isFileURL])
  {
    char v21 = 1;
    goto LABEL_8;
  }
  v12 = (void *)MEMORY[0x1E4F1CB10];
  v13 = MEMORY[0x19F38C100](v10);
  v14 = [v12 fileURLWithPath:v13 isDirectory:1];

  if (!v14)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F8C500];
    uint64_t v53 = *MEMORY[0x1E4F28228];
    v54 = @"no library url";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
    v20 = [v23 errorWithDomain:v24 code:44001 userInfo:v16];
    id v19 = 0;
    char v21 = 0;
    goto LABEL_22;
  }
  v15 = +[PLPhotoLibraryBundleController sharedBundleController];
  v16 = [v15 bundleForLibraryURL:v14];

  v17 = [v16 clientSandboxExtensionCache];
  char v18 = [v17 containsURL:v9];

  if ((v18 & 1) == 0)
  {
    v25 = [v16 assetsdClient];
    v26 = [v25 resourceClient];

    v46 = v26;
    if (v26)
    {
      v27 = [v9 path];
      id v51 = 0;
      id v52 = 0;
      int v28 = [v26 sandboxExtensionsForAssetWithUUID:v11 sandboxExtensionTokens:&v52 error:&v51];
      id v19 = v52;
      id v29 = v51;
      v20 = v29;
      if (v28)
      {
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __82__PLResourceDataStoreKey_refreshSandboxExtensionForURL_libraryID_assetUUID_error___block_invoke;
        v47[3] = &unk_1E5869820;
        char v50 = 0;
        v45 = v27;
        id v42 = v27;
        id v48 = v42;
        id v30 = v16;
        id v49 = v30;
        [v19 enumerateKeysAndObjectsUsingBlock:v47];
        v31 = [v30 clientSandboxExtensionCache];
        char v21 = [v31 containsURL:v9];

        if ((v21 & 1) == 0)
        {
          v40 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v39 = *MEMORY[0x1E4F8C500];
          uint64_t v59 = *MEMORY[0x1E4F28228];
          v43 = [NSString stringWithFormat:@"sandbox extension not in the cache after requesting them for path: %@", v42];
          v60[0] = v43;
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
          uint64_t v41 = [v40 errorWithDomain:v39 code:44001 userInfo:v32];

          v20 = (void *)v41;
        }

        v33 = v48;
        goto LABEL_20;
      }
      if (!v29)
      {
        v44 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v37 = *MEMORY[0x1E4F8C500];
        uint64_t v57 = *MEMORY[0x1E4F28228];
        v45 = v27;
        v33 = [NSString stringWithFormat:@"unknown error getting sandbox extension for path: %@", v27];
        v58 = v33;
        v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        v20 = [v44 errorWithDomain:v37 code:44001 userInfo:v38];

        char v21 = 0;
LABEL_20:

        v36 = v45;
        goto LABEL_21;
      }
      v36 = v27;
    }
    else
    {
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F8C500];
      uint64_t v55 = *MEMORY[0x1E4F28228];
      v56 = @"no resource client";
      v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      v20 = [v34 errorWithDomain:v35 code:44001 userInfo:v36];
      id v19 = 0;
    }
    char v21 = 0;
LABEL_21:

    goto LABEL_22;
  }
  id v19 = 0;
  v20 = 0;
  char v21 = 1;
LABEL_22:

  if (a6) {
    *a6 = v20;
  }

LABEL_8:
  return v21;
}

void __82__PLResourceDataStoreKey_refreshSandboxExtensionForURL_libraryID_assetUUID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(a1 + 48) || [v5 isEqualToString:*(void *)(a1 + 32)])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F8B9D0]) initFileURLWithPath:v5 sandboxExtensionToken:v6 consume:1];
    if (v7)
    {
      id v8 = [*(id *)(a1 + 40) clientSandboxExtensionCache];
      [v8 insertSandboxedURL:v7];
    }
    else
    {
      id v8 = PLBackendGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v5;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Failed to generate sandboxedURL for path: %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (id)uniformTypeIdentifier
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Subclasses must override %@", v4 format];

  return 0;
}

- (id)keyData
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"Subclasses must override %@", v4 format];

  return 0;
}

- (BOOL)isEqualToKey:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  id v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Subclasses must override %@", v5 format];

  return 0;
}

- (PLResourceDataStoreKey)initWithKeyStruct:(const void *)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Subclasses must override %@", v6 format];

  return 0;
}

- (id)fileURLForAssetID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Subclasses must override %@", v5 format];

  return 0;
}

- (id)descriptionForAssetID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Subclasses must override %@", v5 format];

  return 0;
}

- (id)validateForAssetID:(id)a3 resourceIdentity:(id)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  id v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Subclasses must override %@", v6 format];

  return (id)MEMORY[0x1E4F1CBF0];
}

@end