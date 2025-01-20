@interface NSFileManager(PhotoLibraryAdditions)
- (id)tmpFileForVideoTranscodeToPhotoDataDirectory:()PhotoLibraryAdditions withExtension:;
- (uint64_t)createDirectoryIfNeededAtPath:()PhotoLibraryAdditions error:;
- (uint64_t)directoryExistsAtPath:()PhotoLibraryAdditions;
- (uint64_t)removeDirectoryAtPathIfEmpty:()PhotoLibraryAdditions ancestors:;
@end

@implementation NSFileManager(PhotoLibraryAdditions)

- (uint64_t)createDirectoryIfNeededAtPath:()PhotoLibraryAdditions error:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v14 = 0;
    uint64_t v7 = [a1 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v8 = v14;
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F281F8];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v11 = [NSString stringWithFormat:@"invalid filename: %@", 0];
    v16[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v8 = [v9 errorWithDomain:v10 code:514 userInfo:v12];

    uint64_t v7 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if ((v7 & 1) == 0) {
    *a4 = v8;
  }
LABEL_7:

  return v7;
}

- (uint64_t)removeDirectoryAtPathIfEmpty:()PhotoLibraryAdditions ancestors:
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 < 0 || (unint64_t)[v6 length] < 2)
  {
    char v8 = 0;
  }
  else
  {
    char v8 = 0;
    int v9 = a4 + 1;
    uint64_t v10 = v7;
    while (1)
    {
      if (![a1 directoryExistsAtPath:v10]
        || ([a1 contentsOfDirectoryAtPath:v10 error:0],
            v11 = objc_claimAutoreleasedReturnValue(),
            uint64_t v12 = [v11 count],
            v11,
            v12)
        || ![a1 removeItemAtPath:v10 error:0])
      {
        uint64_t v7 = v10;
        goto LABEL_13;
      }
      uint64_t v7 = [v10 stringByDeletingLastPathComponent];

      if (--v9 <= 0) {
        break;
      }
      char v8 = 1;
      uint64_t v10 = v7;
      if ((unint64_t)[v7 length] < 2) {
        goto LABEL_13;
      }
    }
    char v8 = 1;
  }
LABEL_13:

  return v8 & 1;
}

- (uint64_t)directoryExistsAtPath:()PhotoLibraryAdditions
{
  unsigned __int8 v4 = 0;
  [a1 fileExistsAtPath:a3 isDirectory:&v4];
  return v4;
}

- (id)tmpFileForVideoTranscodeToPhotoDataDirectory:()PhotoLibraryAdditions withExtension:
{
  v5 = NSString;
  id v6 = a4;
  uint64_t v7 = +[PLUUIDString UUIDString];
  char v8 = [v5 stringWithFormat:@"trim.%@", v7];

  if (a3)
  {
    int v9 = +[PLPhotoLibraryPathManager systemLibraryPathManager];
    uint64_t v10 = [v9 privateDirectoryWithSubType:2 createIfNeeded:1 error:0];
    v11 = [v10 stringByAppendingPathComponent:v8];
  }
  else
  {
    int v9 = NSTemporaryDirectory();
    v11 = [v9 stringByAppendingPathComponent:v8];
  }

  uint64_t v12 = [v11 stringByAppendingPathExtension:v6];

  return v12;
}

@end