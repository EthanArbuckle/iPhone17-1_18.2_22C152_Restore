@interface NSFileManager(UserNotificationsCore)
- (BOOL)unc_securelyCopyFile:()UserNotificationsCore fromURL:toURL:error:;
- (id)unc_contentsSortedByLastModificationDateOfDirectoryAtPath:()UserNotificationsCore error:;
@end

@implementation NSFileManager(UserNotificationsCore)

- (BOOL)unc_securelyCopyFile:()UserNotificationsCore fromURL:toURL:error:
{
  id v9 = a3;
  id v10 = a5;
  v11 = [v10 path];
  v12 = [MEMORY[0x263EFF8F8] data];
  LODWORD(a1) = [a1 createFileAtPath:v11 contents:v12 attributes:MEMORY[0x263EFFA78]];

  if (a1)
  {
    id v20 = 0;
    v13 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v10 error:&v20];
    id v14 = v20;
    v15 = v14;
    if (v14)
    {
      if (!a6)
      {
        BOOL v17 = 0;
        goto LABEL_13;
      }
      id v16 = v14;
    }
    else
    {
      int v18 = fcopyfile([v9 fileDescriptor], objc_msgSend(v13, "fileDescriptor"), 0, 0x4000Fu);
      BOOL v17 = v18 != -1;
      if (!a6 || v18 != -1) {
        goto LABEL_13;
      }
      id v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
    }
    BOOL v17 = 0;
    *a6 = v16;
LABEL_13:

    goto LABEL_14;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 104, 0);
    BOOL v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_14:

  return v17;
}

- (id)unc_contentsSortedByLastModificationDateOfDirectoryAtPath:()UserNotificationsCore error:
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (![a1 fileExistsAtPath:v6])
  {
    v21 = 0;
LABEL_14:
    v22 = objc_msgSend(v21, "bs_map:", &__block_literal_global_12);

    goto LABEL_15;
  }
  v7 = [MEMORY[0x263F08850] defaultManager];
  v8 = [v7 contentsOfDirectoryAtPath:v6 error:a4];

  if (v8)
  {
    v25 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      uint64_t v12 = *MEMORY[0x263F08048];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          id v14 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          v15 = [MEMORY[0x263F08850] defaultManager];
          id v26 = 0;
          id v16 = [v15 attributesOfItemAtPath:v14 error:&v26];
          id v17 = v26;

          uint64_t v18 = [v16 objectForKey:v12];
          v19 = (void *)v18;
          if (v18)
          {
            v31[0] = @"path";
            v31[1] = @"lastModDate";
            v32[0] = v14;
            v32[1] = v18;
            id v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
            [v25 addObject:v20];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
      }
      while (v10);
    }

    v21 = [v25 sortedArrayUsingComparator:&__block_literal_global_8];

    goto LABEL_14;
  }
  v22 = 0;
LABEL_15:

  return v22;
}

@end