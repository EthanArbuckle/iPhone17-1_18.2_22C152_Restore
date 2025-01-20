@interface TYLogger
+ (id)openLogFile:(id)a3;
+ (id)openLogFile:(id)a3 inDirectory:(id)a4;
+ (void)closeLogFile;
+ (void)logToFile:(BOOL)a3;
+ (void)logToSTDERR:(BOOL)a3;
@end

@implementation TYLogger

+ (void)logToSTDERR:(BOOL)a3
{
  _logToSTDERR = a3;
}

+ (void)logToFile:(BOOL)a3
{
  _logToFile = a3;
}

+ (id)openLogFile:(id)a3 inDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F08790]);
  [v8 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
  v9 = [MEMORY[0x263EFF910] date];
  v10 = [v8 stringFromDate:v9];

  id v11 = v7;
  v12 = v11;
  if (![v11 length])
  {
    v13 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v14 = [v13 objectAtIndex:0];
    v15 = [MEMORY[0x263F086E0] mainBundle];
    v16 = [v15 bundleIdentifier];
    v12 = [v14 stringByAppendingPathComponent:v16];

    if ([v6 length])
    {
      uint64_t v17 = [v12 stringByAppendingPathComponent:v6];

      v12 = (void *)v17;
    }
  }
  if ([v6 length]) {
    [NSString stringWithFormat:@"%@_Console-%@.log", v6, v10];
  }
  else {
  v18 = [NSString stringWithFormat:@"Console-%@.log", v10, v22];
  }
  v19 = [v12 stringByAppendingPathComponent:v18];

  v20 = [a1 openLogFile:v19];

  return v20;
}

+ (id)openLogFile:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
LABEL_7:
    id v10 = 0;
    goto LABEL_8;
  }
  v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v14 = 0;
    [v6 removeItemAtPath:v3 error:&v14];
  }
  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v8 = [MEMORY[0x263EFF8F8] data];
  int v9 = [v7 createFileAtPath:v3 contents:v8 attributes:0];

  id v10 = 0;
  if (v9)
  {
    uint64_t v11 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v3];
    v12 = (void *)_logFileHandle;
    _logFileHandle = v11;

    if (_logFileHandle)
    {
      id v10 = v3;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

+ (void)closeLogFile
{
  if (_logFileHandle)
  {
    TYLog(@"Closing log file", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
    [(id)_logFileHandle closeFile];
    id v8 = (void *)_logFileHandle;
    _logFileHandle = 0;
  }
}

@end