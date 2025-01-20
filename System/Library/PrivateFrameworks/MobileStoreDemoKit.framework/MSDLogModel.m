@interface MSDLogModel
+ (id)sharedInstance;
- (BOOL)enableLogToFile:(id)a3;
- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5;
- (__sFILE)logFP;
- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4;
- (void)logMessage:(id)a3;
- (void)logWithFormat:(id)a3 andArgs:(char *)a4;
- (void)setLogFP:(__sFILE *)a3;
@end

@implementation MSDLogModel

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_shared_0;
  return v2;
}

uint64_t __29__MSDLogModel_sharedInstance__block_invoke()
{
  sharedInstance_shared_0 = objc_alloc_init(MSDLogModel);
  return MEMORY[0x270F9A758]();
}

- (void)logWithFormat:(id)a3 andArgs:(char *)a4
{
  v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = (id)[[v6 alloc] initWithFormat:v7 arguments:a4];

  [(MSDLogModel *)self logMessage:v8];
}

- (void)logMessage:(id)a3
{
  id v9 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"dd-MM-yyyy HH:mm:ss:SSS"];
  v5 = [MEMORY[0x263EFF910] now];
  v6 = [v4 stringFromDate:v5];

  id v7 = [NSString stringWithFormat:@"%@ %@\n", v6, v9];
  if ([(MSDLogModel *)self logFP])
  {
    id v8 = self;
    objc_sync_enter(v8);
    fputs((const char *)[v7 UTF8String], -[MSDLogModel logFP](v8, "logFP"));
    fflush([(MSDLogModel *)v8 logFP]);
    objc_sync_exit(v8);
  }
}

- (BOOL)enableLogToFile:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  v6 = [v4 defaultManager];
  id v7 = [v5 stringByExpandingTildeInPath];

  id v8 = [v7 stringByDeletingLastPathComponent];
  BOOL v9 = 0;
  if (([v6 fileExistsAtPath:v8] & 1) != 0
    || [v6 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0])
  {
    -[MSDLogModel setLogFP:](self, "setLogFP:", fopen((const char *)[v7 fileSystemRepresentation], "a"));
    if ([(MSDLogModel *)self logFP]) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (BOOL)enableLogToFilesUnder:(id)a3 prefix:(id)a4 expireDays:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x263F08850] defaultManager];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  id v31 = 0;
  char v29 = 97;
  if (([v10 fileExistsAtPath:v8] & 1) == 0)
  {
    v11 = [MEMORY[0x263F08850] defaultManager];
    char v12 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];

    if ((v12 & 1) == 0)
    {
      v18 = 0;
      v20 = 0;
      v13 = 0;
      goto LABEL_10;
    }
  }
  v13 = [v8 stringByAppendingPathComponent:@"testWritability.log"];
  v14 = [MEMORY[0x263EFF8F8] dataWithBytes:&v29 length:1];
  int v15 = [v10 createFileAtPath:v13 contents:v14 attributes:0];

  if (!v15)
  {
    v18 = 0;
    v20 = 0;
LABEL_10:
    BOOL v22 = 0;
    goto LABEL_7;
  }
  [v10 removeItemAtPath:v13 error:0];
  v16 = (void *)MEMORY[0x263EFF910];
  v17 = [MEMORY[0x263EFF910] date];
  v18 = [v16 dateWithTimeInterval:v17 sinceDate:(double)a5 * -86400.0];

  v19 = [MEMORY[0x263F08850] defaultManager];
  v20 = [v19 contentsOfDirectoryAtPath:v8 error:0];

  if (v20)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __55__MSDLogModel_enableLogToFilesUnder_prefix_expireDays___block_invoke;
    v24[3] = &unk_2644FC600;
    id v25 = v8;
    id v26 = v18;
    v28 = v30;
    id v27 = v10;
    [v20 enumerateObjectsUsingBlock:v24];
  }
  v21 = [(MSDLogModel *)self fileNameForTodayUnder:v8 prefix:v9];
  BOOL v22 = [(MSDLogModel *)self enableLogToFile:v21];

LABEL_7:
  _Block_object_dispose(v30, 8);

  return v22;
}

void __55__MSDLogModel_enableLogToFilesUnder_prefix_expireDays___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v14 = [*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2];
  v6 = [*(id *)(a1 + 40) description];
  NSLog(&cfstr_CheckingExisti.isa, v14, v6);

  uint64_t v7 = [*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
  uint64_t v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == -1)
  {
    char v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
    v13 = [v12 description];
    NSLog(&cfstr_RemovingWhoseC.isa, v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }
  *a4 = 0;
}

- (id)fileNameForTodayUnder:(id)a3 prefix:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFF8F0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  id v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v10 = [MEMORY[0x263EFF960] currentLocale];
  [v9 setLocale:v10];

  uint64_t v11 = [MEMORY[0x263EFF910] date];
  char v12 = [v9 components:28 fromDate:v11];
  v13 = [NSString stringWithFormat:@"%@/%@-%4ld%02ld%02ld.log", v7, v6, objc_msgSend(v12, "year"), objc_msgSend(v12, "month"), objc_msgSend(v12, "day")];

  return v13;
}

- (__sFILE)logFP
{
  return self->_logFP;
}

- (void)setLogFP:(__sFILE *)a3
{
  self->_logFP = a3;
}

@end