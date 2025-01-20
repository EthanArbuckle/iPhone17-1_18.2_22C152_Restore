@interface MFAttachmentUtilities
+ (BOOL)shouldCreatePlaceholderAttachmentForAttachmentWithSize:(int64_t)a3;
+ (id)_temporaryDirectoryUniqueURL;
+ (id)makeAttachmentPlaceholder:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6;
+ (id)mimeTypeForFileName:(id)a3;
+ (id)securityScopeForFileURL:(id)a3;
+ (id)temporaryDirectory;
+ (id)temporaryFileURLWithExtension:(id)a3;
+ (id)writeData:(id)a3 toTemporaryFileURLWithFileName:(id)a4;
+ (void)_temporaryDirectoryUniqueURL;
@end

@implementation MFAttachmentUtilities

+ (id)temporaryDirectory
{
  v2 = NSTemporaryDirectory();
  v3 = [v2 stringByAppendingPathComponent:@"/MobileMailAttachments"];

  return v3;
}

+ (id)_temporaryDirectoryUniqueURL
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = [a1 temporaryDirectory];
  v6 = [v4 fileURLWithPath:v5 isDirectory:1];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v22 = 0;
  char v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v22];
  id v9 = v22;

  if ((v8 & 1) == 0)
  {
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[MFAttachmentUtilities _temporaryDirectoryUniqueURL].cold.4();
    }
  }
  v11 = [v6 URLByAppendingPathComponent:@"XXXXXXXXXXXXXXXX" isDirectory:1];

  id v12 = v11;
  v13 = (const char *)[v12 fileSystemRepresentation];
  if (strlen(v13) >= 0x401)
  {
    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      +[MFAttachmentUtilities _temporaryDirectoryUniqueURL]([v12 fileSystemRepresentation], (uint64_t)v24);
    }

    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"MFAttachmentUtilities.m" lineNumber:94 description:@"Path is too long."];
  }
  strncpy(__dst, v13, 0x401uLL);
  if (mkdtemp(__dst))
  {
    v16 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:__dst isDirectory:1 relativeToURL:0];

    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      [v16 path];
      objc_claimAutoreleasedReturnValue();
      +[MFAttachmentUtilities _temporaryDirectoryUniqueURL]();
    }

    id v18 = v16;
    id v12 = v18;
  }
  else
  {
    v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = __error();
      +[MFAttachmentUtilities _temporaryDirectoryUniqueURL];
    }

    id v18 = 0;
  }

  return v18;
}

+ (id)temporaryFileURLWithExtension:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [a1 _temporaryDirectoryUniqueURL];
  v7 = [v6 path];
  char v8 = [NSString stringWithFormat:@"XXXXX.%@", v4];
  id v9 = [v7 stringByAppendingPathComponent:v8];

  if (v6)
  {
    v10 = strdup((const char *)[v9 fileSystemRepresentation]);
    if (mkstemps(v10, [v4 length] + 1) == -1)
    {
      v11 = [v6 path];
      id v12 = 0;
      [v5 removeItemAtPath:v11 error:0];
    }
    else
    {
      v11 = [NSString stringWithUTF8String:v10];
      [v5 createFileAtPath:v11 contents:0 attributes:0];
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v11 isDirectory:0];
    }

    if (v10) {
      free(v10);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)writeData:(id)a3 toTemporaryFileURLWithFileName:(id)a4
{
  v21[6] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [a1 _temporaryDirectoryUniqueURL];
  id v9 = v8;
  if (v8)
  {
    v10 = [v8 URLByAppendingPathComponent:v7 isDirectory:0];
    v21[0] = 0;
    int v11 = [v6 writeToURL:v10 options:2 error:v21];
    id v12 = v21[0];
    if (v11)
    {
      v13 = v10;
    }
    else
    {
      v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        [v6 length];
        objc_msgSend(v12, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[MFAttachmentUtilities writeData:toTemporaryFileURLWithFileName:]();
      }

      v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v15 removeItemAtURL:v10 error:0];
      id v20 = v12;
      int v16 = [v6 writeToURL:v10 options:2 error:&v20];
      id v17 = v20;

      if (v16)
      {
        v13 = v10;
      }
      else
      {
        id v18 = MFLogGeneral();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          +[MFAttachmentUtilities writeData:toTemporaryFileURLWithFileName:]();
        }

        v13 = 0;
      }

      id v12 = v17;
    }
  }
  else
  {
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentUtilities writeData:toTemporaryFileURLWithFileName:](v10);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)mimeTypeForFileName:(id)a3
{
  v3 = objc_msgSend(NSString, "mf_stringForMimeTypeFromFileName:", a3);
  return v3;
}

+ (BOOL)shouldCreatePlaceholderAttachmentForAttachmentWithSize:(int64_t)a3
{
  BOOL v4 = +[MFAttachmentCapabilities placeholdersAvailable];
  if (v4) {
    LOBYTE(v4) = +[MFAttachmentCapabilities currentPlaceholderThreshold] < a3;
  }
  return v4;
}

+ (id)makeAttachmentPlaceholder:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F60E18] promise];
  v13 = (void *)MEMORY[0x1E4F73B68];
  v14 = [v12 completionHandlerAdapter];
  [v13 placeholderAttachmentForFileName:v9 fileSize:a4 mimeType:v10 contentID:v11 completionBlock:v14];

  v15 = [v12 future];
  int v16 = [v15 then:&__block_literal_global_26];

  id v21 = 0;
  id v17 = [v16 result:&v21];
  id v18 = v21;
  if (!v17)
  {
    v19 = MFLogGeneral();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentUtilities makeAttachmentPlaceholder:fileSize:mimeType:contentID:]();
    }
  }
  return v17;
}

id __79__MFAttachmentUtilities_makeAttachmentPlaceholder_fileSize_mimeType_contentID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = (void *)MEMORY[0x1E4F60D70];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__MFAttachmentUtilities_makeAttachmentPlaceholder_fileSize_mimeType_contentID___block_invoke_2;
  v7[3] = &unk_1E5D3DFB0;
  id v8 = v2;
  id v4 = v2;
  v5 = [v3 lazyFutureWithBlock:v7];

  return v5;
}

id __79__MFAttachmentUtilities_makeAttachmentPlaceholder_fileSize_mimeType_contentID___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:*(void *)(a1 + 32)];
  id v4 = (void *)v3;
  if (a2 && !v3)
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Invalid placeholder";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    *a2 = [v5 errorWithDomain:@"MFMessageErrorDomain" code:1030 userInfo:v6];
  }
  return v4;
}

+ (id)securityScopeForFileURL:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F60E18] promise];
  v5 = (void *)MEMORY[0x1E4F73B68];
  id v6 = [v4 completionHandlerAdapter];
  [v5 securityScopeForPlaceholderURL:v3 completionBlock:v6];

  id v7 = [v4 future];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__MFAttachmentUtilities_securityScopeForFileURL___block_invoke;
  v15[3] = &unk_1E5D3D0E0;
  id v8 = v3;
  id v16 = v8;
  id v9 = [v7 map:v15];

  id v14 = 0;
  id v10 = [v9 result:&v14];
  id v11 = v14;
  if (!v10)
  {
    id v12 = MFLogGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[MFAttachmentUtilities securityScopeForFileURL:]();
    }
  }
  return v10;
}

id __49__MFAttachmentUtilities_securityScopeForFileURL___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[MFAttachmentSecurityScope securityScopedURL:*(void *)(a1 + 32) withToken:a2];
  return v2;
}

+ (void)_temporaryDirectoryUniqueURL
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "#Attachments Unable to create base dir for temp files: %{public}@", v4);
}

+ (void)writeData:(os_log_t)log toTemporaryFileURLWithFileName:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#Attachments Failed to create temporary directory.", v1, 2u);
}

+ (void)writeData:toTemporaryFileURLWithFileName:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A7EFF000, v3, (uint64_t)v3, "#Attachments Failed 2nd attempt to create temporary file: %{public}@", v4);
}

+ (void)writeData:toTemporaryFileURLWithFileName:.cold.3()
{
  OUTLINED_FUNCTION_1_5();
  *(_DWORD *)uint64_t v1 = 134218242;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2114;
  *(void *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, v5, v2, "#Attachments Failed to create temporary file (%{bytes}llu): %{public}@", v4);
}

+ (void)makeAttachmentPlaceholder:fileSize:mimeType:contentID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, v0, (uint64_t)v0, "#Attachments Error acquiring attachment placeholder for file: %@, Error: %@", v1);
}

+ (void)securityScopeForFileURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_1(&dword_1A7EFF000, v0, (uint64_t)v0, "#Attachments Error acquiring attachment security scope for fileURL: %@, Error: %@", v1);
}

@end