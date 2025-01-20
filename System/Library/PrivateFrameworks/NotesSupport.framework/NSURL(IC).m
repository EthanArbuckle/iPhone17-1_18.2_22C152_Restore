@interface NSURL(IC)
+ (uint64_t)ic_urlFromWeblocFileAtURL:()IC;
- (id)ic_UTI;
- (id)ic_dedupedURLWithProhibitedNames:()IC;
- (id)ic_uniquedURL;
- (uint64_t)ic_fileOrDirectorySize;
- (uint64_t)ic_fileSize;
- (uint64_t)ic_isAppStoreURL;
- (uint64_t)ic_isBooksURL;
- (uint64_t)ic_isExcludedFromBackups;
- (uint64_t)ic_isExcludedFromCloudBackups;
- (uint64_t)ic_isMapURL;
- (uint64_t)ic_isNewsURL;
- (uint64_t)ic_isPodcastsURL;
- (uint64_t)ic_isReachable;
- (uint64_t)ic_isSafeFileURLForAttachment;
- (uint64_t)ic_isSupportedAsAttachment;
- (uint64_t)ic_isURLAnInternetLocator;
- (uint64_t)ic_isWebURL;
- (uint64_t)ic_isiTunesURL;
- (void)ic_updateFlagToExcludeFromBackup:()IC;
@end

@implementation NSURL(IC)

- (id)ic_dedupedURLWithProhibitedNames:()IC
{
  id v27 = a3;
  id v4 = a1;
  v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [v4 lastPathComponent];
  v7 = [v6 pathExtension];
  v25 = v6;
  v8 = [v6 stringByDeletingPathExtension];
  v9 = [v4 URLByDeletingLastPathComponent];
  uint64_t v10 = 1;
  unint64_t v11 = 0x263F08000uLL;
  v12 = @"%@-%lu";
  v26 = v7;
  while (1)
  {
    if ([v4 checkResourceIsReachableAndReturnError:0]) {
      goto LABEL_6;
    }
    v13 = [v4 path];
    if ([v5 fileExistsAtPath:v13])
    {

      goto LABEL_6;
    }
    [v4 lastPathComponent];
    v14 = v9;
    v15 = v8;
    v16 = v12;
    unint64_t v17 = v11;
    v19 = v18 = v5;
    int v20 = [v27 containsObject:v19];

    v5 = v18;
    unint64_t v11 = v17;
    v12 = v16;
    v8 = v15;
    v9 = v14;
    v7 = v26;

    if (!v20) {
      break;
    }
LABEL_6:
    v21 = objc_msgSend(*(id *)(v11 + 2880), "stringWithFormat:", v12, v8, v10);
    if ([v7 length])
    {
      uint64_t v22 = [v21 stringByAppendingPathExtension:v7];

      v21 = (void *)v22;
    }
    uint64_t v23 = [v9 URLByAppendingPathComponent:v21 isDirectory:0];

    ++v10;
    id v4 = (id)v23;
  }

  return v4;
}

- (void)ic_updateFlagToExcludeFromBackup:()IC
{
  if (ic_updateFlagToExcludeFromBackup__token != -1) {
    dispatch_once(&ic_updateFlagToExcludeFromBackup__token, &__block_literal_global_27);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__NSURL_IC__ic_updateFlagToExcludeFromBackup___block_invoke_2;
  v5[3] = &unk_2640CE310;
  v5[4] = a1;
  char v6 = a3;
  dispatch_async((dispatch_queue_t)ic_updateFlagToExcludeFromBackup__excludeFromBackupQueue, v5);
}

- (uint64_t)ic_isExcludedFromBackups
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v10 = 0;
  uint64_t v2 = *MEMORY[0x263EFF6B0];
  id v9 = 0;
  char v3 = [a1 getResourceValue:&v10 forKey:v2 error:&v9];
  id v4 = v10;
  id v5 = v9;
  if ((v3 & 1) == 0)
  {
    char v6 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = v2;
      __int16 v13 = 2112;
      v14 = a1;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_20C263000, v6, OS_LOG_TYPE_ERROR, "Error checking backup exclusion flag %@ for %@: %@", buf, 0x20u);
    }
  }
  uint64_t v7 = [v4 BOOLValue];

  return v7;
}

- (uint64_t)ic_isExcludedFromCloudBackups
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v10 = 0;
  uint64_t v2 = *MEMORY[0x263EFFAD8];
  id v9 = 0;
  char v3 = [a1 getResourceValue:&v10 forKey:v2 error:&v9];
  id v4 = v10;
  id v5 = v9;
  if ((v3 & 1) == 0)
  {
    char v6 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = v2;
      __int16 v13 = 2112;
      v14 = a1;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_error_impl(&dword_20C263000, v6, OS_LOG_TYPE_ERROR, "Error checking backup exclusion flag %@ for %@: %@", buf, 0x20u);
    }
  }
  uint64_t v7 = [v4 BOOLValue];

  return v7;
}

- (id)ic_uniquedURL
{
  id v1 = a1;
  if ([v1 checkResourceIsReachableAndReturnError:0])
  {
    uint64_t v2 = [v1 lastPathComponent];
    char v3 = [v2 pathExtension];
    id v4 = [v2 stringByDeletingPathExtension];
    id v5 = [v1 URLByDeletingLastPathComponent];
    uint64_t v6 = 1;
    do
    {
      uint64_t v7 = [NSString stringWithFormat:@"%@-%lu", v4, v6];
      if ([v3 length])
      {
        uint64_t v8 = [v7 stringByAppendingPathExtension:v3];

        uint64_t v7 = (void *)v8;
      }
      id v9 = [v5 URLByAppendingPathComponent:v7 isDirectory:0];

      ++v6;
      id v1 = v9;
    }
    while (([v9 checkResourceIsReachableAndReturnError:0] & 1) != 0);
  }
  else
  {
    id v9 = v1;
  }
  return v9;
}

- (uint64_t)ic_isBooksURL
{
  id v1 = [a1 host];
  uint64_t v2 = [v1 isEqualToString:@"books.apple.com"];

  return v2;
}

- (uint64_t)ic_isMapURL
{
  return [MEMORY[0x263F41B20] isValidMapURL:a1];
}

- (uint64_t)ic_isNewsURL
{
  id v1 = [a1 host];
  if ([v1 isEqualToString:@"apple.news"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 isEqual:@"news.apple.com"];
  }

  return v2;
}

- (uint64_t)ic_isiTunesURL
{
  id v1 = [a1 host];
  if (([v1 isEqual:@"itunes.apple.com"] & 1) != 0
    || ([v1 isEqual:@"itunes.com"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqual:@"itun.es"];
  }

  return v2;
}

- (uint64_t)ic_isAppStoreURL
{
  id v1 = [a1 host];
  uint64_t v2 = [v1 isEqual:@"appsto.re"];

  return v2;
}

- (uint64_t)ic_isPodcastsURL
{
  id v1 = [a1 host];
  uint64_t v2 = [v1 isEqual:@"podcasts.apple.com"];

  return v2;
}

- (uint64_t)ic_isWebURL
{
  uint64_t v2 = [a1 scheme];
  if ([v2 isEqualToString:@"http"])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v4 = [a1 scheme];
    uint64_t v3 = [v4 isEqualToString:@"https"];
  }
  return v3;
}

- (uint64_t)ic_isSupportedAsAttachment
{
  if (objc_msgSend(a1, "ic_isWebURL") & 1) != 0 || (objc_msgSend(a1, "ic_isMapURL")) {
    return 1;
  }
  return objc_msgSend(a1, "ic_isSafeFileURLForAttachment");
}

- (uint64_t)ic_isSafeFileURLForAttachment
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (![a1 isFileURL]) {
    return 0;
  }
  uint64_t v2 = [a1 path];
  uint64_t v3 = [v2 stringByStandardizingPath];

  id v4 = (void *)ic_isSafeFileURLForAttachment_unsafePathPrefixes;
  if (!ic_isSafeFileURLForAttachment_unsafePathPrefixes)
  {
    ic_isSafeFileURLForAttachment_unsafePathPrefixes = (uint64_t)&unk_26C144E20;

    id v4 = &unk_26C144E20;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([v3 hasPrefix:*(void *)(*((void *)&v19 + 1) + 8 * v9)])
        {

          goto LABEL_18;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v10 = (void *)ic_isSafeFileURLForAttachment_unsafeFilenames;
  if (!ic_isSafeFileURLForAttachment_unsafeFilenames)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"notes.sqlite", @"notes.sqlite-shm", @"notes.sqlite-wal", @"NoteStore.sqlite", @"NoteStore.sqlite-shm", @"NoteStore.sqlite-wal", 0, (void)v19);
    uint64_t v12 = (void *)ic_isSafeFileURLForAttachment_unsafeFilenames;
    ic_isSafeFileURLForAttachment_unsafeFilenames = v11;

    id v10 = (void *)ic_isSafeFileURLForAttachment_unsafeFilenames;
  }
  __int16 v13 = [v3 lastPathComponent];
  char v14 = [v10 containsObject:v13];

  if (v14)
  {
LABEL_18:
    uint64_t v17 = 0;
  }
  else
  {
    __int16 v15 = [a1 pathComponents];
    int v16 = [v15 containsObject:@".."];

    uint64_t v17 = v16 ^ 1u;
  }

  return v17;
}

- (id)ic_UTI
{
  if ([a1 isFileURL])
  {
    id v7 = 0;
    int v2 = [a1 getResourceValue:&v7 forKey:*MEMORY[0x263EFF780] error:0];
    id v3 = v7;
    id v4 = v3;
    id v5 = 0;
    if (v2) {
      id v5 = v3;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (uint64_t)ic_fileSize
{
  if (![a1 isFileURL]) {
    return 0;
  }
  id v4 = 0;
  int v2 = [a1 getResourceValue:&v4 forKey:*MEMORY[0x263EFF688] error:0];
  uint64_t result = 0;
  if (v2) {
    return [v4 integerValue];
  }
  return result;
}

- (uint64_t)ic_fileOrDirectorySize
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![a1 isFileURL]) {
    return 0;
  }
  if ([a1 hasDirectoryPath])
  {
    int v2 = [MEMORY[0x263F08850] defaultManager];
    id v3 = [v2 contentsOfDirectoryAtURL:a1 includingPropertiesForKeys:0 options:0 error:0];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "ic_fileOrDirectorySize", (void)v11);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }

    return v7;
  }
  return objc_msgSend(a1, "ic_fileSize");
}

- (uint64_t)ic_isReachable
{
  return [a1 checkResourceIsReachableAndReturnError:0];
}

- (uint64_t)ic_isURLAnInternetLocator
{
  return 0;
}

+ (uint64_t)ic_urlFromWeblocFileAtURL:()IC
{
  return 0;
}

@end