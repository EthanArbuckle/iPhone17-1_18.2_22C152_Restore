@interface NSFileManager(TSUTemporaryDirectoryAdditions)
- (uint64_t)grantUserWritePosixPermissionAtPath:()TSUTemporaryDirectoryAdditions error:;
@end

@implementation NSFileManager(TSUTemporaryDirectoryAdditions)

- (uint64_t)grantUserWritePosixPermissionAtPath:()TSUTemporaryDirectoryAdditions error:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v7 = objc_opt_new();
  id v28 = 0;
  v8 = (void *)[a1 attributesOfItemAtPath:a3 error:&v28];
  v9 = (void *)[v8 fileType];
  uint64_t v10 = *MEMORY[0x263F080E0];
  if (([v9 isEqualToString:*MEMORY[0x263F080E0]] & 1) == 0
    && ([v9 isEqualToString:*MEMORY[0x263F080E8]] & 1) == 0
    && ![v9 isEqualToString:*MEMORY[0x263F080F0]])
  {
    goto LABEL_16;
  }
  uint64_t v11 = [v8 filePosixPermissions];
  v12 = NSDictionary;
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v11 | 0x80];
  if (objc_msgSend(a1, "setAttributes:ofItemAtPath:error:", objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, *MEMORY[0x263F08078]), a3, &v28))
  {
    if ([v9 isEqualToString:v10])
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      v14 = objc_msgSend(a1, "contentsOfDirectoryAtPath:error:", a3, &v28, 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
LABEL_8:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          if (!objc_msgSend(a1, "grantUserWritePosixPermissionAtPath:error:", objc_msgSend(a3, "stringByAppendingPathComponent:", *(void *)(*((void *)&v24 + 1) + 8 * v18)), &v28))goto LABEL_15; {
          if (v16 == ++v18)
          }
          {
            uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
            uint64_t v19 = 1;
            if (v16) {
              goto LABEL_8;
            }
            goto LABEL_17;
          }
        }
      }
    }
LABEL_16:
    uint64_t v19 = 1;
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v19 = 0;
LABEL_17:
  id v20 = v28;
  [v7 drain];
  id v21 = v28;
  if (a4 && (v19 & 1) == 0)
  {
    id v22 = v28;
    if (!v28) {
      id v22 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
    }
    *a4 = v22;
  }
  return v19;
}

@end