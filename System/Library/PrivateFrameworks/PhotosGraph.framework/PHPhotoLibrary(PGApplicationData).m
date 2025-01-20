@interface PHPhotoLibrary(PGApplicationData)
- (id)pg_urlForGraphApplicationData;
@end

@implementation PHPhotoLibrary(PGApplicationData)

- (id)pg_urlForGraphApplicationData
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 processName];

  if (([v3 isEqualToString:@"photoanalysisd"] & 1) != 0
    || ([v3 isEqualToString:@"LifeCipher"] & 1) != 0
    || [v3 isEqualToString:@"graphctl"])
  {
    v4 = [a1 urlForApplicationDataFolderIdentifier:1];
    goto LABEL_5;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v17 = 0;
  v7 = [v6 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v17];
  id v8 = v17;
  if (!v8)
  {
    v4 = [v7 URLByAppendingPathComponent:v3];
    char v16 = 0;
    v13 = [v4 path];
    char v14 = [v6 fileExistsAtPath:v13 isDirectory:&v16];

    if (v14)
    {
      if (!v16)
      {

        v4 = 0;
        id v9 = 0;
        goto LABEL_10;
      }
      id v9 = 0;
    }
    else
    {
      id v15 = 0;
      [v6 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
      id v9 = v15;
    }
    if (v4 && !v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v9 = v8;
  v4 = 0;
LABEL_10:
  v10 = (void *)MEMORY[0x1E4F1CB10];
  v11 = NSTemporaryDirectory();
  uint64_t v12 = [v10 fileURLWithPath:v11];

  v4 = (void *)v12;
LABEL_11:

LABEL_5:
  return v4;
}

@end