@interface SPCorrectionProxy
+ (id)dateFormatter;
+ (id)dateFromFileURL:(id)a3;
+ (id)inputFileURLForCurrentTime;
+ (id)inputFilesURL;
+ (id)inputFilesURLForUser:(id)a3;
+ (id)sharedHandler;
- (BOOL)dateIsExpired:(id)a3;
- (NSURL)inputFilesURL;
- (SPCorrectionProxy)init;
- (void)deleteExpiredInputFiles;
- (void)processCorrectionsWithHandle:(id)a3;
- (void)setInputFilesURL:(id)a3;
- (void)updateWithFileHandle:(id)a3;
@end

@implementation SPCorrectionProxy

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1) {
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedHandler_handler;

  return v2;
}

uint64_t __34__SPCorrectionProxy_sharedHandler__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedHandler_handler;
  sharedHandler_handler = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)inputFileURLForCurrentTime
{
  v2 = [(id)objc_opt_class() inputFilesURL];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 bundleIdentifier];

  v5 = NSString;
  v6 = [(id)objc_opt_class() dateFormatter];
  v7 = [MEMORY[0x263EFF910] date];
  v8 = [v6 stringFromDate:v7];
  v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [v9 UUIDString];
  v11 = [v5 stringWithFormat:@"%@_%@_%@", v4, v8, v10];

  v12 = [v2 URLByAppendingPathComponent:v11];

  return v12;
}

+ (id)inputFilesURLForUser:(id)a3
{
  v3 = NSHomeDirectoryForUser((NSString *)a3);
  v4 = [v3 stringByAppendingString:@"/Library/Spotlight/CorrectionInputFiles"];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SPCorrectionProxy_inputFilesURLForUser___block_invoke;
  block[3] = &unk_2644B2A50;
  id v10 = v4;
  uint64_t v5 = inputFilesURLForUser__onceToken;
  id v6 = v4;
  if (v5 != -1) {
    dispatch_once(&inputFilesURLForUser__onceToken, block);
  }
  v7 = [NSURL fileURLWithPath:v6 isDirectory:1 relativeToURL:0];

  return v7;
}

void __42__SPCorrectionProxy_inputFilesURLForUser___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08850] defaultManager];
  if (([v2 fileExistsAtPath:*(void *)(a1 + 32)] & 1) == 0) {
    [v2 createDirectoryAtPath:*(void *)(a1 + 32) withIntermediateDirectories:1 attributes:0 error:0];
  }
}

+ (id)inputFilesURL
{
  id v2 = objc_opt_class();
  v3 = NSUserName();
  v4 = [v2 inputFilesURLForUser:v3];

  return v4;
}

+ (id)dateFormatter
{
  id v2 = objc_opt_new();
  [v2 setDateFormat:@"yyyy-MM-dd"];
  v3 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"GMT"];
  [v2 setTimeZone:v3];

  return v2;
}

+ (id)dateFromFileURL:(id)a3
{
  v3 = [a3 lastPathComponent];
  v4 = [v3 componentsSeparatedByString:@"_"];
  uint64_t v5 = v4;
  if (v4 && [v4 count] == 3)
  {
    id v6 = [v5 objectAtIndex:1];
    v7 = [(id)objc_opt_class() dateFormatter];
    v8 = [v7 dateFromString:v6];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SPCorrectionProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)SPCorrectionProxy;
  id v2 = [(SPCorrectionProxy *)&v5 init];
  if (v2)
  {
    v3 = [(id)objc_opt_class() inputFilesURL];
    [(SPCorrectionProxy *)v2 setInputFilesURL:v3];
  }
  return v2;
}

- (BOOL)dateIsExpired:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  objc_super v5 = [v3 dateWithTimeIntervalSinceNow:-172800.0];
  id v6 = [v4 earlierDate:v5];

  return v6 == v4;
}

- (void)deleteExpiredInputFiles
{
  v23[1] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(SPCorrectionProxy *)self inputFilesURL];
  v23[0] = *MEMORY[0x263EFFFB8];
  objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  id v21 = 0;
  id v6 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v5 options:0 error:&v21];
  id v7 = v21;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        v14 = [(id)objc_opt_class() dateFromFileURL:v13];
        if ([(SPCorrectionProxy *)self dateIsExpired:v14])
        {
          id v16 = v7;
          [v3 removeItemAtURL:v13 error:&v16];
          id v15 = v16;

          id v7 = v15;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v10);
  }
}

- (void)updateWithFileHandle:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  id v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v6, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E5D7000, v6, v7, "Processing corrections begin", buf, 2u);
  }

  [(SPCorrectionProxy *)v5 processCorrectionsWithHandle:v4];
  id v8 = SPLogForSPLogCategoryDefault();
  os_log_type_t v9 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v8, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21E5D7000, v8, v9, "Processing corrections complete", v10, 2u);
  }

  objc_sync_exit(v5);
}

- (void)processCorrectionsWithHandle:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v21 = 0;
  id v4 = [a3 readDataToEndOfFileAndReturnError:&v21];
  id v5 = v21;
  id v6 = v5;
  if (v4)
  {
    if (v5)
    {
      os_log_type_t v7 = SPLogForSPLogCategoryDefault();
      os_log_type_t v8 = gSPLogInfoAsDefault ^ 1;
      if (os_log_type_enabled(v7, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        id v9 = [v6 debugDescription];
        uint64_t v10 = [v9 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v23 = v10;
        _os_log_impl(&dword_21E5D7000, v7, v8, "inputFile write error: %s\n", buf, 0xCu);
      }
      uint64_t v11 = 0;
      goto LABEL_9;
    }
    uint64_t v11 = [(id)objc_opt_class() inputFileURLForCurrentTime];
    if ([v4 writeToURL:v11 atomically:1])
    {
      uint64_t v12 = dispatch_group_create();
      dispatch_group_enter(v12);
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      long long v18 = __50__SPCorrectionProxy_processCorrectionsWithHandle___block_invoke;
      long long v19 = &unk_2644B30D0;
      long long v20 = v12;
      os_log_type_t v7 = v12;
      uint64_t v13 = (void *)MEMORY[0x223C2C030](&v16);
      v14 = objc_msgSend(MEMORY[0x263F02AD8], "defaultSearchableIndex", v16, v17, v18, v19);
      id v15 = [v11 path];
      [v14 updateCorrectionsWithFilePath:v15 completionHandler:v13];
      dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

LABEL_9:
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  [(SPCorrectionProxy *)self deleteExpiredInputFiles];
}

void __50__SPCorrectionProxy_processCorrectionsWithHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = SPLogForSPLogCategoryDefault();
    os_log_type_t v5 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v4, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      id v6 = [v3 debugDescription];
      int v7 = 136315138;
      uint64_t v8 = [v6 UTF8String];
      _os_log_impl(&dword_21E5D7000, v4, v5, "updateCompletionHandler error: %s\n", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (NSURL)inputFilesURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputFilesURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end