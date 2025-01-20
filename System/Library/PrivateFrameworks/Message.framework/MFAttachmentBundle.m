@interface MFAttachmentBundle
+ (BOOL)isFileBundleURL:(id)a3;
+ (id)_stripBundlePath:(id)a3 entryPath:(id)a4;
+ (id)dataForFileBundleURL:(id)a3;
@end

@implementation MFAttachmentBundle

+ (BOOL)isFileBundleURL:(id)a3
{
  id v3 = a3;
  char v7 = 0;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  [v4 fileExistsAtPath:v5 isDirectory:&v7];

  LOBYTE(v4) = v7;
  return (char)v4;
}

+ (id)_stripBundlePath:(id)a3 entryPath:(id)a4
{
  id v5 = a4;
  v6 = [a3 path];
  uint64_t v7 = [v6 length];
  int v8 = [v6 hasSuffix:@"/"];
  v9 = [v5 path];
  v10 = [v9 substringFromIndex:v7 + (v8 ^ 1u)];

  return v10;
}

+ (id)dataForFileBundleURL:(id)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  v31 = +[MFAttachmentSecurityScope securityScopedURL:](MFAttachmentSecurityScope, "securityScopedURL:");
  if (![v31 isBundle])
  {
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentBundle dataForFileBundleURL:].cold.4();
    }
    goto LABEL_23;
  }
  if ([a1 isFileBundleURL:v30])
  {
    v29 = +[MFFileArchiveDirectory archiveDirectory];
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = *MEMORY[0x1E4F1C628];
    v44[0] = *MEMORY[0x1E4F1C628];
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    uint64_t v7 = [v4 enumeratorAtURL:v30 includingPropertiesForKeys:v6 options:0 errorHandler:&__block_literal_global_110];

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v9)
    {
      uint64_t v11 = *(void *)v38;
      *(void *)&long long v10 = 138412290;
      long long v28 = v10;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
          id v36 = 0;
          objc_msgSend(v13, "getResourceValue:forKey:error:", &v36, v5, 0, v28);
          id v14 = v36;
          if (([v14 BOOLValue] & 1) == 0)
          {
            v15 = [v31 data];
            if (v15)
            {
              v16 = [a1 _stripBundlePath:v30 entryPath:v13];
              v17 = [[MFFileArchiveEntry alloc] initWithContents:v15 path:v16];
              [v29 setArchiveEntry:v17];
            }
            else
            {
              v16 = MFLogGeneral();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v28;
                v42 = v13;
                _os_log_error_impl(&dword_1A7EFF000, v16, OS_LOG_TYPE_ERROR, "#Attachments Failed to read bundle URL [%@]", buf, 0xCu);
              }
            }
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v9);
    }

    v18 = [MEMORY[0x1E4F60E18] promise];
    v19 = +[MFFileArchive archive];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke_113;
    v33[3] = &unk_1E5D3DFF8;
    id v20 = v18;
    id v34 = v20;
    v21 = v29;
    v35 = v21;
    [v19 compressContents:v21 completion:v33];

    v22 = [v20 future];
    id v32 = 0;
    v23 = [v22 resultWithTimeout:&v32 error:300.0];
    id v24 = v32;

    if (!v23)
    {
      v25 = MFLogGeneral();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_msgSend(v24, "ef_publicDescription");
        +[MFAttachmentBundle dataForFileBundleURL:(uint64_t)buf];
      }
    }
    goto LABEL_24;
  }
  if (![v31 isReadable])
  {
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentBundle dataForFileBundleURL:]();
    }
    goto LABEL_23;
  }
  v23 = [v31 data];
  if (!v23)
  {
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentBundle dataForFileBundleURL:]();
    }
LABEL_23:
    v23 = 0;
LABEL_24:
  }
  return v23;
}

uint64_t __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = objc_msgSend(v5, "ef_publicDescription");
    __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke_cold_1((uint64_t)v4, v7, (uint64_t)v9);
  }

  return 1;
}

uint64_t __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [*(id *)(a1 + 32) finishWithError:v3];
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) contents];
    [v4 finishWithResult:v5];
  }
  return 1;
}

+ (void)dataForFileBundleURL:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, v6, v4, "#Attachments Failed to archive bundle attachment URL: %@ due to error: %{public}@", v5);
}

+ (void)dataForFileBundleURL:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#Attachments Failed to read attachment URL: %@", v2, v3, v4, v5, v6);
}

+ (void)dataForFileBundleURL:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#Attachments Failed to access attachment URL: %@", v2, v3, v4, v5, v6);
}

+ (void)dataForFileBundleURL:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "#Attachments URL is not a bundle: %@", v2, v3, v4, v5, v6);
}

void __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, v6, v4, "#Attachments Failed to enumerate URL [%@] due to error [%{public}@]", v5);
}

@end