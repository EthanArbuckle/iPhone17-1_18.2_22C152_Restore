@interface NSURL(Sharing)
- (id)fileName;
- (id)issueSandboxExtensionData;
- (id)valueForQueryKey:()Sharing;
- (uint64_t)coordinateReadingWithSaveToTempDir:()Sharing completionHandler:;
- (uint64_t)isiWorkDocument;
- (void)coordinateReadingWithSaveToTempDir:()Sharing options:completionHandler:;
- (void)issueSandboxExtensionData;
@end

@implementation NSURL(Sharing)

- (uint64_t)isiWorkDocument
{
  id v2 = 0;
  [a1 getResourceValue:&v2 forKey:*MEMORY[0x1E4F1C728] error:0];
  return [v2 hasPrefix:@"com.apple.iwork"];
}

- (id)fileName
{
  v1 = [a1 URLByDeletingPathExtension];
  id v2 = [v1 lastPathComponent];

  return v2;
}

- (uint64_t)coordinateReadingWithSaveToTempDir:()Sharing completionHandler:
{
  return [a1 coordinateReadingWithSaveToTempDir:a3 options:1 completionHandler:a4];
}

- (void)coordinateReadingWithSaveToTempDir:()Sharing options:completionHandler:
{
  id v8 = a5;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
  id v16 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke;
  v12[3] = &unk_1E5BBEF40;
  char v15 = a3;
  id v13 = 0;
  id v14 = v8;
  id v10 = v8;
  [v9 coordinateReadingItemAtURL:a1 options:a4 error:&v16 byAccessor:v12];
  id v11 = v16;
}

- (id)issueSandboxExtensionData
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([a1 isFileURL] & 1) == 0)
  {
    v7 = utilities_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(NSURL(Sharing) *)(uint64_t)a1 issueSandboxExtensionData];
    }

    goto LABEL_12;
  }
  id v2 = a1;
  [v2 fileSystemRepresentation];
  v3 = (const char *)sandbox_extension_issue_file();
  v4 = utilities_log();
  v5 = v4;
  if (!v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(NSURL(Sharing) *)(uint64_t)v2 issueSandboxExtensionData];
    }

LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138477827;
    id v10 = v2;
    _os_log_impl(&dword_1A5389000, v5, OS_LOG_TYPE_DEFAULT, "sandbox extension issued successfully for URL:%{private}@", (uint8_t *)&v9, 0xCu);
  }

  v6 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v3 length:strlen(v3) + 1 freeWhenDone:1];
LABEL_13:

  return v6;
}

- (id)valueForQueryKey:()Sharing
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  [v5 queryItems];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "name", (void)v14);
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          v7 = [v10 value];
          goto LABEL_11;
        }
      }
      v7 = (void *)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)issueSandboxExtensionData
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Cannot issue sandbox extension for URL:%@", (uint8_t *)&v2, 0xCu);
}

@end