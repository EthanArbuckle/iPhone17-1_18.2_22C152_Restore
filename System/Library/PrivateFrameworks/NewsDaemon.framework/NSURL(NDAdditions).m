@interface NSURL(NDAdditions)
+ (id)newsdCachesURL;
+ (id)newsdDocumentsURL;
+ (id)newsdGroupContainerURL;
@end

@implementation NSURL(NDAdditions)

+ (id)newsdGroupContainerURL
{
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.newsd"];

  if (!v1) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"newsd was unable to use the group container for content storage"];
  }

  return v1;
}

+ (id)newsdCachesURL
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB10] newsdGroupContainerURL];
  v1 = [v0 URLByAppendingPathComponent:@"Library/Caches" isDirectory:1];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v29 = v0;
  v3 = [v2 contentsOfDirectoryAtURL:v0 includingPropertiesForKeys:0 options:4 error:0];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v9 = [v8 lastPathComponent];
        if ([v9 hasPrefix:@"shared-assets"])
        {
        }
        else
        {
          v10 = [v8 lastPathComponent];
          int v11 = [v10 hasPrefix:@"com.apple.news"];

          if (!v11) {
            continue;
          }
        }
        v12 = [v8 lastPathComponent];
        v13 = [v1 URLByAppendingPathComponent:v12];

        v14 = (void *)*MEMORY[0x1E4F7DF78];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DF78], OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          v16 = [v8 lastPathComponent];
          *(_DWORD *)buf = 138543362;
          id v37 = v16;
          _os_log_impl(&dword_1E00ED000, v15, OS_LOG_TYPE_DEFAULT, "will move %{public}@ from group container root to Caches directory", buf, 0xCu);
        }
        v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v31 = 0;
        char v18 = [v17 moveItemAtURL:v8 toURL:v13 error:&v31];
        id v19 = v31;

        if ((v18 & 1) == 0)
        {
          v20 = *MEMORY[0x1E4F7DF78];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DF78], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v37 = v19;
            _os_log_impl(&dword_1E00ED000, v20, OS_LOG_TYPE_DEFAULT, "failed to move file from group container root to Caches directory with error: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v5);
  }

  v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v30 = 0;
  [v21 createDirectoryAtURL:v1 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v22 = v30;

  v23 = FCURLForFeldsparUserAccountHomeDirectory();
  v24 = [v23 URLByAppendingPathComponent:@"newsd" isDirectory:1];

  v25 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_msgSend(v25, "fc_removeContentsOfDirectoryAtURL:", v24);

  v26 = *MEMORY[0x1E4F7DF78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DF78], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v37 = v1;
    _os_log_impl(&dword_1E00ED000, v26, OS_LOG_TYPE_DEFAULT, "will store newsd caches at %{public}@", buf, 0xCu);
  }
  id v27 = v1;

  return v27;
}

+ (id)newsdDocumentsURL
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28CB8] defaultManager];
  v1 = [v0 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.newsd"];

  v2 = [v1 URLByAppendingPathComponent:@"Documents" isDirectory:1];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = 0;
  [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v7];
  id v4 = v7;

  uint64_t v5 = *MEMORY[0x1E4F7DF78];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DF78], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v2;
    _os_log_impl(&dword_1E00ED000, v5, OS_LOG_TYPE_DEFAULT, "will store newsd documents at %{public}@", buf, 0xCu);
  }

  return v2;
}

@end