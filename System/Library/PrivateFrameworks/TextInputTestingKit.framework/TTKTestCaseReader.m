@interface TTKTestCaseReader
+ (id)loadFromDir:(id)a3;
+ (id)loadFromFile:(id)a3;
+ (id)loadFromFile:(id)a3 inputMode:(id)a4 layouts:(id)a5;
+ (id)loadFromPath:(id)a3;
+ (id)loadFromPath:(id)a3 fileManager:(id)a4;
@end

@implementation TTKTestCaseReader

+ (id)loadFromPath:(id)a3 fileManager:(id)a4
{
  id v6 = a3;
  char v11 = 0;
  int v7 = [a4 fileExistsAtPath:v6 isDirectory:&v11];
  if (v7 && v11)
  {
    uint64_t v8 = [a1 loadFromDir:v6];
LABEL_6:
    v9 = (void *)v8;
    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v8 = [a1 loadFromFile:v6];
    goto LABEL_6;
  }
  v9 = 0;
LABEL_8:

  return v9;
}

+ (id)loadFromPath:(id)a3
{
  v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  int v7 = [a1 loadFromPath:v5 fileManager:v6];

  return v7;
}

+ (id)loadFromDir:(id)a3
{
  id v3 = a3;
  id v4 = [[TTKDirSource alloc] init:v3];

  return v4;
}

+ (id)loadFromFile:(id)a3
{
  return (id)[a1 loadFromFile:a3 inputMode:0 layouts:0];
}

+ (id)loadFromFile:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = TTKLogFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    uint64_t v18 = [v7 cStringUsingEncoding:4];
    _os_log_debug_impl(&dword_23EFD2000, v10, OS_LOG_TYPE_DEBUG, "Loading data from file %s", (uint8_t *)&v17, 0xCu);
  }

  char v11 = (void *)MEMORY[0x2455C2B00]();
  v12 = [MEMORY[0x263EFF950] inputStreamWithFileAtPath:v7];
  [v12 open];
  if ([v12 streamStatus] == 7)
  {
    v13 = TTKLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      uint64_t v18 = (uint64_t)v7;
      _os_log_error_impl(&dword_23EFD2000, v13, OS_LOG_TYPE_ERROR, "Error loading JSON from a file : %@", (uint8_t *)&v17, 0xCu);
    }

    [v12 close];
    id v14 = 0;
  }
  else
  {
    v15 = [MEMORY[0x263F08900] JSONObjectWithStream:v12 options:0 error:0];
    id v14 = [[TTKFileSource alloc] init:v15 inputMode:v8 layouts:v9];
    [v12 close];
  }

  return v14;
}

@end