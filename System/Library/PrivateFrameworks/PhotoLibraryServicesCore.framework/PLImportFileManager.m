@interface PLImportFileManager
+ (BOOL)isCameraDirectoryFolderName:(id)a3;
+ (BOOL)isImportDirectoryFolderName:(id)a3;
- (BOOL)removeUnusedDCIMDirectoryAtPath:(id)a3;
- (PLImportFileManager)init;
- (PLImportFileManager)initWithPathManager:(id)a3;
- (id)_DCIMFolderNameWithNumber:(int64_t)a3;
- (id)_dcimDirectory;
- (id)nextAvailableFilePathInDirectory:(id)a3 withExtension:(id)a4;
- (id)urlForNewDCIMFolderWithFolderNumber:(int64_t *)a3;
@end

@implementation PLImportFileManager

- (void).cxx_destruct
{
}

- (PLImportFileManager)initWithPathManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLImportFileManager;
  v5 = [(PLImportFileManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_storeWeak((id *)&v5->_pathManager, v4);
    }
    else
    {
      v7 = +[PLPhotoLibraryPathManager systemLibraryPathManager];
      objc_storeWeak((id *)&v6->_pathManager, v7);
    }
  }

  return v6;
}

- (BOOL)removeUnusedDCIMDirectoryAtPath:(id)a3
{
  id v4 = a3;
  v5 = [(PLImportFileManager *)self _dcimDirectory];
  [v5 lockDirectory];
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 removeDirectoryAtPathIfEmpty:v4 ancestors:0];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28FE8]);
    objc_super v9 = [v4 lastPathComponent];
    v10 = (void *)[v8 initWithString:v9];

    [v10 setScanLocation:0];
    v11 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    id v18 = 0;
    [v10 scanCharactersFromSet:v11 intoString:&v18];
    id v12 = v18;

    if ([v12 length])
    {
      uint64_t v13 = [v12 integerValue];
      v14 = [v5 userInfoObjectForKey:@"LastImportDirectoryNumber"];
      uint64_t v15 = [v14 integerValue];

      if (v13 == v15 && v15 != 100)
      {
        v16 = [MEMORY[0x1E4F28ED0] numberWithInteger:v13 - 1];
        [v5 setUserInfoObject:v16 forKey:@"LastImportDirectoryNumber"];

        [v5 saveUserInfo];
      }
    }
  }
  [v5 unlockDirectory];

  return v7;
}

- (id)nextAvailableFilePathInDirectory:(id)a3 withExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLImportFileManager *)self _dcimDirectory];
  objc_super v9 = [v6 lastPathComponent];
  [v8 lockDirectory];
  v10 = [NSString stringWithFormat:@"EditedVideoLastFileGroupNumber-%@", v9];
  v11 = [v8 userInfoObjectForKey:v10];

  if (v11) {
    uint64_t v12 = [v11 integerValue] + 1;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  v30 = v11;
  v31 = v8;
  if (v12 <= 998)
  {
    v28 = self;
    v29 = v9;
    v14 = 0;
    do
    {
      uint64_t v15 = v14;
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"EDT_%04ld", v12);
      v17 = [v6 stringByAppendingPathComponent:v16];
      v14 = [v17 stringByAppendingPathExtension:v7];
    }
    while (([v13 fileExistsAtPath:v14] & 1) != 0);
    id v8 = v31;
    self = v28;
    objc_super v9 = v29;
    if (v14) {
      goto LABEL_11;
    }
  }
  id v18 = [(PLImportFileManager *)self urlForNewDCIMFolderWithFolderNumber:0];
  if (v18)
  {
    v19 = v18;
    v20 = [v18 path];
    uint64_t v21 = [v20 lastPathComponent];
    v22 = v9;
    objc_super v9 = (void *)v21;

    v23 = objc_msgSend(NSString, "stringWithFormat:", @"EDT_%04ld", 0);
    v24 = [v20 stringByAppendingPathComponent:v23];
    v14 = [v24 stringByAppendingPathExtension:v7];

    if (v14)
    {
      uint64_t v12 = 0;
      v29 = v9;
      v11 = v30;
      id v8 = v31;
LABEL_11:
      v25 = [MEMORY[0x1E4F28ED0] numberWithInteger:v12];
      v26 = [NSString stringWithFormat:@"EditedVideoLastFileGroupNumber-%@", v9];
      [v8 setUserInfoObject:v25 forKey:v26];

      [v8 saveUserInfo];
      objc_super v9 = v29;
      goto LABEL_14;
    }
    v11 = v30;
    id v8 = v31;
  }
  else
  {
    v14 = 0;
  }
LABEL_14:
  [v8 unlockDirectory];

  return v14;
}

- (id)urlForNewDCIMFolderWithFolderNumber:(int64_t *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pathManager);
  v5 = [WeakRetained photoDirectoryWithType:4];

  id v6 = [(PLImportFileManager *)self _dcimDirectory];
  [v6 lockDirectory];
  id v7 = [v6 userInfoObjectForKey:@"LastImportDirectoryNumber"];
  uint64_t v8 = [v7 integerValue];

  if ((unint64_t)(v8 - 99999999) >= 0xFFFFFFFFFA0A1F65) {
    uint64_t v9 = v8 + 1;
  }
  else {
    uint64_t v9 = 100;
  }
  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v11 = [(PLImportFileManager *)self _DCIMFolderNameWithNumber:v9];
  uint64_t v12 = [v5 stringByAppendingPathComponent:v11];
  if ([v10 fileExistsAtPath:v12]) {
    BOOL v13 = v9 < 99999999;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    while (([v10 removeDirectoryAtPathIfEmpty:v12 ancestors:0] & 1) == 0)
    {
      int64_t v14 = v9 + 1;
      uint64_t v15 = [(PLImportFileManager *)self _DCIMFolderNameWithNumber:v9 + 1];

      v16 = [v5 stringByAppendingPathComponent:v15];

      if ([v10 fileExistsAtPath:v16])
      {
        uint64_t v12 = v16;
        v11 = v15;
        BOOL v13 = v9++ < 99999998;
        if (v13) {
          continue;
        }
      }
      goto LABEL_9;
    }
  }
  int64_t v14 = v9;
  uint64_t v15 = v11;
  v16 = v12;
LABEL_9:
  if ([v10 fileExistsAtPath:v16])
  {
    NSLog((NSString *)@"Error: Directory already exists");
    v17 = 0;
  }
  else
  {
    id v24 = 0;
    char v18 = [v10 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v19 = v24;
    v20 = v19;
    if (v18)
    {
      v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16 isDirectory:1];
      uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
      [v6 setUserInfoObject:v21 forKey:@"LastImportDirectoryNumber"];

      [v6 saveUserInfo];
      if (a3) {
        *a3 = v14;
      }
    }
    else
    {
      NSLog((NSString *)@"Error creating directory: %@", v19);
      v17 = 0;
    }
  }
  [v6 unlockDirectory];

  return v17;
}

- (id)_DCIMFolderNameWithNumber:(int64_t)a3
{
  if (a3 < 0)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v4 = [@"IMPRT" length];
    uint64_t v5 = vcvtpd_s64_f64(log10((double)(a3 + 1)));
    if (v5 >= 4 && [@"IMPRT" length] + 3 >= (unint64_t)v5)
    {
      uint64_t v6 = v5 - 3;
      v4 -= v6;
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v8 = [NSString alloc];
    uint64_t v9 = objc_msgSend(@"IMPRT", "substringWithRange:", v6, v4);
    id v7 = (void *)[v8 initWithFormat:@"%03li%@", a3, v9];
  }
  if ([v7 length] != 8)
  {

    id v7 = 0;
  }
  return v7;
}

- (id)_dcimDirectory
{
  v3 = [PLPhotoDCIMDirectory alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pathManager);
  uint64_t v5 = [WeakRetained photoDirectoryWithType:4];
  uint64_t v6 = [(PLPhotoDCIMDirectory *)v3 initWithDCIMPath:v5];

  return v6;
}

- (PLImportFileManager)init
{
  return [(PLImportFileManager *)self initWithPathManager:0];
}

+ (BOOL)isCameraDirectoryFolderName:(id)a3
{
  id v3 = a3;
  pl_dispatch_once(&isCameraDirectoryFolderName__onceToken, &__block_literal_global_5264);
  uint64_t v4 = objc_msgSend((id)isCameraDirectoryFolderName__gCameraDirectoryExpression, "numberOfMatchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));

  return v4 == 1;
}

uint64_t __51__PLImportFileManager_isCameraDirectoryFolderName___block_invoke()
{
  isCameraDirectoryFolderName__gCameraDirectoryExpression = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[1-9][0-9][0-9]APPLE" options:0 error:0];
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)isImportDirectoryFolderName:(id)a3
{
  id v3 = a3;
  BOOL v7 = 0;
  if ([v3 length] == 8
    && [v3 characterAtIndex:0] >= 0x30
    && [v3 characterAtIndex:0] <= 0x39)
  {
    int v4 = [v3 intValue];
    if ((v4 - 100000000) >= 0xFA0A1F64)
    {
      if ((uint64_t)vcvtpd_s64_f64(log10((double)(v4 + 1))) > 7
        || (objc_msgSend(v3, "substringFromIndex:"),
            uint64_t v5 = objc_claimAutoreleasedReturnValue(),
            int v6 = [@"IMPRT" hasSuffix:v5],
            v5,
            v6))
      {
        BOOL v7 = 1;
      }
    }
  }

  return v7;
}

@end