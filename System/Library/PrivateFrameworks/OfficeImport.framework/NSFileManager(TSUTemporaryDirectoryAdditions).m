@interface NSFileManager(TSUTemporaryDirectoryAdditions)
- (uint64_t)tsu_grantUserWritePosixPermissionAtPath:()TSUTemporaryDirectoryAdditions error:;
@end

@implementation NSFileManager(TSUTemporaryDirectoryAdditions)

- (uint64_t)tsu_grantUserWritePosixPermissionAtPath:()TSUTemporaryDirectoryAdditions error:
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v42 = 0;
  v7 = [a1 attributesOfItemAtPath:v6 error:&v42];
  id v8 = v42;
  v9 = [v7 fileType];
  uint64_t v10 = *MEMORY[0x263F080E0];
  if (([v9 isEqualToString:*MEMORY[0x263F080E0]] & 1) == 0
    && ([v9 isEqualToString:*MEMORY[0x263F080E8]] & 1) == 0
    && ![v9 isEqualToString:*MEMORY[0x263F080F0]])
  {
    uint64_t v27 = 1;
    goto LABEL_27;
  }
  v34 = a4;
  uint64_t v11 = [v7 filePosixPermissions];
  v12 = NSDictionary;
  v13 = [NSNumber numberWithUnsignedInteger:v11 | 0x80];
  v14 = [v12 dictionaryWithObject:v13 forKey:*MEMORY[0x263F08078]];
  id v41 = v8;
  int v15 = [a1 setAttributes:v14 ofItemAtPath:v6 error:&v41];
  id v16 = v41;

  if (v15)
  {
    if (![v9 isEqualToString:v10])
    {
      uint64_t v27 = 1;
LABEL_26:
      id v8 = v16;
      goto LABEL_27;
    }
    v33 = v9;
    v17 = (void *)MEMORY[0x23EC9A170]();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v36 = 0;
    v18 = [a1 contentsOfDirectoryAtPath:v6 error:&v36];
    id v19 = v36;
    uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      v30 = v17;
      v31 = v16;
      v32 = v7;
      uint64_t v22 = *(void *)v38;
      while (2)
      {
        uint64_t v23 = 0;
        v24 = v19;
        do
        {
          if (*(void *)v38 != v22) {
            objc_enumerationMutation(v18);
          }
          v25 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v37 + 1) + 8 * v23)];
          id v35 = v24;
          char v26 = objc_msgSend(a1, "tsu_grantUserWritePosixPermissionAtPath:error:", v25, &v35);
          id v19 = v35;

          if ((v26 & 1) == 0)
          {
            id v19 = v19;

            uint64_t v27 = 0;
            id v16 = v19;
            v7 = v32;
            goto LABEL_18;
          }
          ++v23;
          v24 = v19;
        }
        while (v21 != v23);
        uint64_t v21 = [v18 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v21) {
          continue;
        }
        break;
      }
      uint64_t v27 = 1;
      id v16 = v31;
      v7 = v32;
LABEL_18:
      v17 = v30;
    }
    else
    {
      uint64_t v27 = 1;
    }

    v9 = v33;
  }
  else
  {
    uint64_t v27 = 0;
  }
  if (!v34 || (v27 & 1) != 0) {
    goto LABEL_26;
  }
  if (v16)
  {
    id v8 = v16;
    uint64_t v27 = 0;
    void *v34 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
    id v29 = objc_claimAutoreleasedReturnValue();
    void *v34 = v29;

    uint64_t v27 = 0;
    id v8 = 0;
  }
LABEL_27:

  return v27;
}

@end