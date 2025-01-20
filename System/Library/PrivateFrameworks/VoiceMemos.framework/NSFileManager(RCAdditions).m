@interface NSFileManager(RCAdditions)
- (id)rc_uniqueFileSystemURLWithPreferredURL:()RCAdditions;
- (uint64_t)rc_moveToTempAndMarkAsPurgeable:()RCAdditions error:;
- (uint64_t)rc_path:()RCAdditions isSubpathOf:;
- (unint64_t)rc_fileExistsAndIsInValidRecordingURL:()RCAdditions;
- (void)rc_cleanUpAssetsInDirectory:()RCAdditions;
- (void)rc_cleanUpTemporaryDirectory;
@end

@implementation NSFileManager(RCAdditions)

- (void)rc_cleanUpTemporaryDirectory
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1C3964000, v0, OS_LOG_TYPE_ERROR, "%s -- Failed to get contents of url %@", (uint8_t *)v1, 0x16u);
}

- (id)rc_uniqueFileSystemURLWithPreferredURL:()RCAdditions
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v6 = objc_msgSend(v4, "rc_URLByStandardizingResolvedPath");
  v7 = [v6 URLByDeletingLastPathComponent];
  v8 = [a1 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 error:0];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "rc_URLByStandardizingResolvedPath");
        v14 = [v13 URLByDeletingPathExtension];
        v15 = [v14 path];
        [v5 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v10);
  }

  v16 = [v4 URLByDeletingLastPathComponent];
  v17 = [v16 path];

  v18 = [v4 lastPathComponent];
  v19 = [v18 stringByDeletingPathExtension];

  v20 = [v4 pathExtension];
  id v21 = v4;
  uint64_t v22 = 1;
  v33 = v21;
  while (1)
  {
    v23 = objc_msgSend(v21, "rc_URLByStandardizingResolvedPath");
    v24 = [v23 URLByDeletingPathExtension];
    v25 = [v24 path];
    int v26 = [v5 containsObject:v25];

    if (!v26) {
      break;
    }
    v27 = (void *)MEMORY[0x1E4F1CB10];
    v28 = [v17 stringByAppendingPathComponent:v19];
    v29 = objc_msgSend(v28, "stringByAppendingFormat:", @"-%li", v22, v33);
    v30 = [v29 stringByAppendingPathExtension:v20];
    uint64_t v31 = [v27 fileURLWithPath:v30];

    ++v22;
    id v21 = (id)v31;
  }

  return v21;
}

- (unint64_t)rc_fileExistsAndIsInValidRecordingURL:()RCAdditions
{
  if (a3)
  {
    id v4 = [a3 path];
    if ([a1 fileExistsAtPath:v4])
    {
      unint64_t v5 = (unint64_t)realpath_DARWIN_EXTSN((const char *)[v4 fileSystemRepresentation], 0);
      if (!v5)
      {
LABEL_14:

        return v5;
      }
      v6 = (void *)[[NSString alloc] initWithUTF8String:v5];
      v7 = [v6 stringByStandardizingPath];

      free((void *)v5);
      if (v7)
      {
        unint64_t v5 = 1;
        char v14 = 1;
        if ([a1 fileExistsAtPath:v7 isDirectory:&v14] && !v14)
        {
          v8 = RCRecordingsDirectoryURL();
          uint64_t v9 = [v8 path];
          uint64_t v10 = [v9 stringByStandardizingPath];
          if ([v7 hasPrefix:v10])
          {
            unint64_t v5 = 0;
          }
          else
          {
            uint64_t v11 = RCDiskCacheDirectory();
            v12 = [v11 stringByStandardizingPath];
            unint64_t v5 = [v7 hasPrefix:v12] ^ 1;
          }
        }

        goto LABEL_14;
      }
    }
    unint64_t v5 = 0;
    goto LABEL_14;
  }
  return 0;
}

- (uint64_t)rc_moveToTempAndMarkAsPurgeable:()RCAdditions error:
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = NSTemporaryDirectory();
  uint64_t v9 = [v7 fileURLWithPath:v8];

  uint64_t v10 = [v9 URLByAppendingPathComponent:@"voicememos-purgeable"];
  if ([a1 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:a4])
  {
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    v12 = [v11 UUIDString];
    v13 = [v10 URLByAppendingPathComponent:v12];

    uint64_t v14 = [a1 moveItemAtURL:v6 toURL:v13 error:a4];
    if (v14)
    {
      v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v16 = dispatch_queue_create("com.apple.VoiceMemos.purgeableQueue", v15);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__NSFileManager_RCAdditions__rc_moveToTempAndMarkAsPurgeable_error___block_invoke;
      block[3] = &unk_1E64963A0;
      id v19 = v13;
      dispatch_async(v16, block);
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)rc_cleanUpAssetsInDirectory:()RCAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [a1 enumeratorAtURL:a3 includingPropertiesForKeys:0 options:0 errorHandler:&__block_literal_global_12];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 136315650;
    long long v15 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "pathExtension", v15);
        BOOL v11 = +[RCCaptureFormat supportsFileExtension:v10];

        if (v11)
        {
          id v16 = 0;
          BOOL v12 = _RCCleanUpURL(v9, &v16);
          id v13 = v16;
          if (!v12)
          {
            uint64_t v14 = OSLogForCategory(@"Default");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v15;
              uint64_t v22 = "-[NSFileManager(RCAdditions) rc_cleanUpAssetsInDirectory:]";
              __int16 v23 = 2112;
              v24 = v9;
              __int16 v25 = 2112;
              id v26 = v13;
              _os_log_error_impl(&dword_1C3964000, v14, OS_LOG_TYPE_ERROR, "%s -- Failed to clean up file at %@, error = %@", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v6);
  }
}

- (uint64_t)rc_path:()RCAdditions isSubpathOf:
{
  id v5 = a4;
  uint64_t v6 = [a3 stringByStandardizingPath];
  uint64_t v7 = [v5 stringByStandardizingPath];

  uint64_t v8 = [v6 hasPrefix:v7];
  return v8;
}

@end