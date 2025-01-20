@interface NSFileManager(TVMLKitAdditions)
- (blkcnt_t)tv_onDiskSizeOfFileAtPath:()TVMLKitAdditions status:;
- (uint64_t)tv_onDiskSizeOfDirectoryAtPath:()TVMLKitAdditions status:;
@end

@implementation NSFileManager(TVMLKitAdditions)

- (blkcnt_t)tv_onDiskSizeOfFileAtPath:()TVMLKitAdditions status:
{
  memset(&v7, 0, sizeof(v7));
  int v5 = lstat((const char *)objc_msgSend(a3, "cStringUsingEncoding:", 1, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0), &v7);
  if (a4) {
    *a4 = v5;
  }
  if (v5) {
    return 0;
  }
  else {
    return v7.st_blocks << 9;
  }
}

- (uint64_t)tv_onDiskSizeOfDirectoryAtPath:()TVMLKitAdditions status:
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [MEMORY[0x263F08850] defaultManager];
  stat v7 = [v6 enumeratorAtPath:v5];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v21;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = [v5 stringByAppendingPathComponent:*(void *)(*((void *)&v20 + 1) + 8 * v13)];
      memset(&v19, 0, sizeof(v19));
      id v15 = v14;
      int v16 = lstat((const char *)[v15 cStringUsingEncoding:1], &v19);
      blkcnt_t st_blocks = v19.st_blocks;

      if (v16) {
        break;
      }
      v11 += st_blocks << 9;
      if (v10 == ++v13)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
    uint64_t v11 = 0;
LABEL_11:
    int v16 = 0;
  }

  if (a4) {
    *a4 = v16;
  }

  return v11;
}

@end