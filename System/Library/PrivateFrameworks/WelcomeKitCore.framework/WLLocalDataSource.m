@interface WLLocalDataSource
+ (BOOL)localDataExists;
+ (id)_localSourceDataPath;
+ (id)_relativePathForAccount:(id)a3 migrator:(id)a4;
+ (id)_relativePathForSummary:(id)a3 migrator:(id)a4;
+ (void)deleteLocalData;
+ (void)stashData:(id)a3 forSummary:(id)a4 migrator:(id)a5;
+ (void)stashFileForSummary:(id)a3 migrator:(id)a4;
- (void)accountsDataForMigrator:(id)a3 completion:(id)a4;
- (void)dataForSummary:(id)a3 migrator:(id)a4 completion:(id)a5;
- (void)dataSegmentForSummary:(id)a3 byteRange:(_NSRange)a4 migrator:(id)a5 completion:(id)a6;
- (void)fileForSummary:(id)a3 migrator:(id)a4 fileAccessor:(id)a5 completion:(id)a6;
- (void)itemSizeForSummary:(id)a3 migrator:(id)a4 completion:(id)a5;
- (void)summariesDataForAccount:(id)a3 migrator:(id)a4 completion:(id)a5;
- (void)updateUIWithProgress:(double)a3 remainingTime:(double)a4 logString:(id)a5 completion:(id)a6;
@end

@implementation WLLocalDataSource

+ (id)_localSourceDataPath
{
  if (_localSourceDataPath_onceToken != -1) {
    dispatch_once(&_localSourceDataPath_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)_localSourceDataPath_localSourceDataPath;
  return v2;
}

void __41__WLLocalDataSource__localSourceDataPath__block_invoke()
{
  NSHomeDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingString:@"/Library/WelcomeKit/LocalSourceData/"];
  v1 = (void *)_localSourceDataPath_localSourceDataPath;
  _localSourceDataPath_localSourceDataPath = v0;
}

+ (BOOL)localDataExists
{
  char v7 = 0;
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [a1 _localSourceDataPath];
  char v5 = [v3 fileExistsAtPath:v4 isDirectory:&v7];

  if (v7) {
    return v5;
  }
  else {
    return 0;
  }
}

- (void)accountsDataForMigrator:(id)a3 completion:(id)a4
{
  v36[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v28 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v7 = +[WLLocalDataSource _localSourceDataPath];
  v8 = NSString;
  v29 = v5;
  v9 = [v5 contentType];
  v10 = [v8 stringWithFormat:@"%@/accounts", v9];
  uint64_t v11 = [v7 stringByAppendingPathComponent:v10];

  v27 = (void *)v11;
  uint64_t v12 = [NSURL fileURLWithPath:v11];
  v13 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v14 = *MEMORY[0x263EFF6A8];
  v36[0] = *MEMORY[0x263EFF6A8];
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  v26 = (void *)v12;
  v16 = [v13 enumeratorAtURL:v12 includingPropertiesForKeys:v15 options:1 errorHandler:0];

  uint64_t v17 = [v16 nextObject];
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      id v30 = 0;
      id v31 = 0;
      objc_msgSend(v18, "getResourceValue:forKey:error:", &v31, v14, &v30, v25);
      id v19 = v31;
      id v20 = v30;
      if (v20)
      {
        id v25 = v20;
        _WLLog();
      }
      else if ([v19 BOOLValue])
      {
        v34 = @"itemID";
        v21 = [v18 lastPathComponent];
        v35 = v21;
        v22 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        [v6 addObject:v22];
      }
      uint64_t v23 = [v16 nextObject];

      v18 = (void *)v23;
    }
    while (v23);
  }
  if (v28)
  {
    v32 = @"dataItemSummaries";
    id v33 = v6;
    v24 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    (*((void (**)(id, void *, void, void, double))v28 + 2))(v28, v24, 0, 0, 0.0);
  }
}

- (void)summariesDataForAccount:(id)a3 migrator:(id)a4 completion:(id)a5
{
  v52[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v38 = a5;
  id v43 = objc_alloc_init(MEMORY[0x263EFF980]);
  v39 = v8;
  v40 = v7;
  uint64_t v9 = +[WLLocalDataSource _relativePathForAccount:v7 migrator:v8];
  v10 = +[WLLocalDataSource _localSourceDataPath];
  v42 = (void *)v9;
  uint64_t v11 = [v10 stringByAppendingPathComponent:v9];

  v37 = (void *)v11;
  uint64_t v12 = [NSURL fileURLWithPath:v11];
  v13 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v14 = *MEMORY[0x263EFF6A8];
  uint64_t v15 = *MEMORY[0x263EFF688];
  v52[0] = *MEMORY[0x263EFF6A8];
  v52[1] = v15;
  uint64_t v41 = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];
  v36 = (void *)v12;
  uint64_t v17 = [v13 enumeratorAtURL:v12 includingPropertiesForKeys:v16 options:0 errorHandler:0];

  uint64_t v18 = [v17 nextObject];
  if (v18)
  {
    id v19 = (void *)v18;
    do
    {
      id v46 = 0;
      id v47 = 0;
      [v19 getResourceValue:&v47 forKey:v14 error:&v46];
      id v20 = v47;
      id v21 = v46;
      if (v21)
      {
        uint64_t v35 = (uint64_t)v21;
        _WLLog();
      }
      if (objc_msgSend(v20, "BOOLValue", v35))
      {
        id v22 = v21;
      }
      else
      {
        uint64_t v23 = [v19 path];
        uint64_t v24 = [v23 rangeOfString:v42];
        uint64_t v26 = v25;

        v27 = [v19 path];
        id v28 = [v27 substringFromIndex:v26 + v24 + 1];

        id v44 = 0;
        id v45 = 0;
        [v19 getResourceValue:&v45 forKey:v41 error:&v44];
        id v29 = v45;
        id v22 = v44;

        if (v22)
        {
          uint64_t v35 = (uint64_t)v22;
          _WLLog();
        }
        id v30 = NSString;
        uint64_t v35 = objc_msgSend(v29, "unsignedIntegerValue", v35);
        id v31 = [v30 stringWithFormat:@"%lu"];
        v50[0] = @"itemID";
        v50[1] = @"itemSize";
        v51[0] = v28;
        v51[1] = v31;
        v32 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
        [v43 addObject:v32];
      }
      uint64_t v33 = [v17 nextObject];

      id v19 = (void *)v33;
    }
    while (v33);
  }
  if (v38)
  {
    v48 = @"dataItemSummaries";
    id v49 = v43;
    v34 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    (*((void (**)(id, void *, void, void, double))v38 + 2))(v38, v34, 0, 0, 0.0);
  }
}

- (void)fileForSummary:(id)a3 migrator:(id)a4 fileAccessor:(id)a5 completion:(id)a6
{
  uint64_t v9 = (void (**)(id, void *))a6;
  v10 = (void (**)(id, void *))a5;
  id v15 = +[WLLocalDataSource _relativePathForSummary:a3 migrator:a4];
  uint64_t v11 = +[WLLocalDataSource _localSourceDataPath];
  uint64_t v12 = [v11 stringByAppendingPathComponent:v15];

  v13 = [NSURL fileURLWithPath:v12 isDirectory:0];
  uint64_t v14 = v10[2](v10, v13);

  v9[2](v9, v14);
}

- (void)dataForSummary:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void *, id))a5;
  id v8 = +[WLLocalDataSource _relativePathForSummary:a3 migrator:a4];
  uint64_t v9 = +[WLLocalDataSource _localSourceDataPath];
  v10 = [v9 stringByAppendingPathComponent:v8];

  uint64_t v11 = [NSURL fileURLWithPath:v10 isDirectory:0];
  id v14 = 0;
  uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v11 options:1 error:&v14];
  id v13 = v14;
  if (v13 || !v12) {
    _WLLog();
  }
  v7[2](v7, v12, v13);
}

- (void)dataSegmentForSummary:(id)a3 byteRange:(_NSRange)a4 migrator:(id)a5 completion:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__WLLocalDataSource_dataSegmentForSummary_byteRange_migrator_completion___block_invoke;
  v13[3] = &unk_26490BDB8;
  NSUInteger v15 = location;
  NSUInteger v16 = length;
  id v14 = v11;
  id v12 = v11;
  [(WLLocalDataSource *)self dataForSummary:a3 migrator:a5 completion:v13];
}

void __73__WLLocalDataSource_dataSegmentForSummary_byteRange_migrator_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = v9;
  id v7 = v5;
  if (v9 && !v5)
  {
    uint64_t v8 = objc_msgSend(v9, "subdataWithRange:", a1[5], a1[6]);

    id v6 = (id)v8;
  }
  id v10 = v6;
  (*(void (**)(void))(a1[4] + 16))();
}

- (void)updateUIWithProgress:(double)a3 remainingTime:(double)a4 logString:(id)a5 completion:(id)a6
{
}

- (void)itemSizeForSummary:(id)a3 migrator:(id)a4 completion:(id)a5
{
  id v7 = a5;
  (*((void (**)(id, uint64_t, void))a5 + 2))(v7, [a3 itemSize], 0);
}

+ (void)deleteLocalData
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = +[WLLocalDataSource _localSourceDataPath];
  id v5 = 0;
  [v2 removeItemAtPath:v3 error:&v5];
  id v4 = v5;

  if (v4) {
    _WLLog();
  }
}

+ (id)_relativePathForAccount:(id)a3 migrator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 accountBased])
  {
    id v7 = [v5 identifier];
    uint64_t v8 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    id v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

    id v10 = NSString;
    id v11 = [v6 contentType];
    id v12 = [v10 stringWithFormat:@"%@/accounts/%@", v11, v9];
  }
  else
  {
    id v13 = NSString;
    id v9 = [v6 contentType];
    id v12 = [v13 stringWithFormat:@"%@", v9];
  }

  return v12;
}

+ (id)_relativePathForSummary:(id)a3 migrator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 identifier];
  uint64_t v8 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  id v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  if ([v6 accountBased])
  {
    id v10 = [v5 account];
    id v11 = [v10 identifier];
    id v12 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
    id v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];

    id v14 = NSString;
    NSUInteger v15 = [v6 contentType];
    NSUInteger v16 = [v14 stringWithFormat:@"%@/accounts/%@/%@", v15, v13, v9];
  }
  else
  {
    uint64_t v17 = NSString;
    id v13 = [v6 contentType];
    NSUInteger v16 = [v17 stringWithFormat:@"%@/%@", v13, v9];
  }

  return v16;
}

+ (void)stashFileForSummary:(id)a3 migrator:(id)a4
{
  id v6 = NSURL;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 dataFilePath];
  id v10 = [v6 fileURLWithPath:v9 isDirectory:0];

  id v11 = [a1 _relativePathForSummary:v8 migrator:v7];

  id v12 = +[WLLocalDataSource _localSourceDataPath];
  id v13 = [v12 stringByAppendingPathComponent:v11];

  id v14 = [NSURL fileURLWithPath:v13 isDirectory:0];
  NSUInteger v15 = [MEMORY[0x263F08850] defaultManager];
  NSUInteger v16 = [v14 URLByDeletingLastPathComponent];
  id v21 = 0;
  int v17 = [v15 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v21];
  id v18 = v21;

  if (v17 && !v18)
  {
    id v19 = [MEMORY[0x263F08850] defaultManager];
    id v20 = 0;
    [v19 copyItemAtURL:v10 toURL:v14 error:&v20];
    id v18 = v20;
  }
  _WLLog();
}

+ (void)stashData:(id)a3 forSummary:(id)a4 migrator:(id)a5
{
  id v8 = a3;
  id v9 = [a1 _relativePathForSummary:a4 migrator:a5];
  id v10 = +[WLLocalDataSource _localSourceDataPath];
  id v11 = [v10 stringByAppendingPathComponent:v9];

  id v12 = [NSURL fileURLWithPath:v11 isDirectory:0];
  id v13 = [MEMORY[0x263F08850] defaultManager];
  id v14 = [v12 URLByDeletingLastPathComponent];
  id v20 = 0;
  int v15 = [v13 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v16 = v20;

  if (v15) {
    BOOL v17 = v16 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    id v19 = 0;
    [v8 writeToURL:v12 options:1 error:&v19];
    id v16 = v19;
  }
  if (v16)
  {
    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
    _WLLog();
  }
  else
  {
    _WLLog();
  }
}

@end