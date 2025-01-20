@interface TTKDirSink
- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5 writeOnFlush:(BOOL)a6 maxTestCasesPerFile:(unsigned int)a7 maxFilesPerDirectory:(unsigned int)a8;
- (void)addLayouts:(id)a3;
- (void)close;
- (void)flushFiles;
- (void)pushNextTestCase:(id)a3;
@end

@implementation TTKDirSink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testCaseFiles, 0);
  objc_storeStrong((id *)&self->_testCaseDirs, 0);
  objc_storeStrong((id *)&self->_currDir, 0);
  objc_storeStrong((id *)&self->_testCasesToWrite, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_rootDir, 0);
}

- (void)pushNextTestCase:(id)a3
{
  [(NSMutableArray *)self->_testCasesToWrite addObject:a3];
  if ([(NSMutableArray *)self->_testCasesToWrite count] == self->_maxTestCasesPerFile)
  {
    [(TTKDirSink *)self flushFiles];
  }
}

- (void)flushFiles
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_testCasesToWrite count])
  {
    uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"d%05u", self->_dirCounter);
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"f%05u.json", self->_fileCounter);
    v5 = [NSURL fileURLWithPath:self->_rootDir isDirectory:1];
    v21 = (void *)v3;
    v6 = [v5 URLByAppendingPathComponent:v3];
    v7 = [MEMORY[0x263F08850] defaultManager];
    v8 = [v6 path];
    char v9 = [v7 fileExistsAtPath:v8];

    if ((v9 & 1) == 0)
    {
      v10 = [MEMORY[0x263F08850] defaultManager];
      v11 = [v6 path];
      [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v12 = [v6 URLByAppendingPathComponent:v4];
    v13 = [v12 path];
    v14 = +[TTKTestCaseWriter storeToFile:v13 inputMode:self->_inputMode layouts:0];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v15 = self->_testCasesToWrite;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          [v14 pushNextTestCase:*(void *)(*((void *)&v22 + 1) + 8 * v19++)];
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }

    [v14 close];
    [(NSMutableArray *)self->_testCasesToWrite removeAllObjects];
    unsigned int v20 = self->_fileCounter + 1;
    self->_fileCounter = v20;
    if (v20 == self->_maxFilesPerDirectory) {
      *(void *)&self->_dirCounter = self->_dirCounter + 1;
    }
  }
}

- (void)close
{
  [(TTKDirSink *)self flushFiles];
  id v6 = [NSURL fileURLWithPath:self->_rootDir isDirectory:1];
  uint64_t v3 = [v6 URLByAppendingPathComponent:@"layouts.json"];
  v4 = [v3 path];
  v5 = +[TTKTestCaseWriter storeToFile:v4 inputMode:self->_inputMode layouts:self->_layouts];

  [v5 close];
}

- (void)addLayouts:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  layouts = self->_layouts;
  id v6 = a3;
  v7 = [v4 dictionaryWithDictionary:layouts];
  [(NSDictionary *)v7 addEntriesFromDictionary:v6];

  v8 = self->_layouts;
  self->_layouts = v7;
}

- (id)init:(id)a3 inputMode:(id)a4 layouts:(id)a5 writeOnFlush:(BOOL)a6 maxTestCasesPerFile:(unsigned int)a7 maxFilesPerDirectory:(unsigned int)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TTKDirSink;
  uint64_t v18 = [(TTKDirSink *)&v23 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_inputMode, a4);
    objc_storeStrong((id *)&v19->_rootDir, a3);
    objc_storeStrong((id *)&v19->_layouts, a5);
    v19->_writeOnFlush = a6;
    v19->_maxTestCasesPerFile = a7;
    v19->_maxFilesPerDirectory = a8;
    uint64_t v20 = [MEMORY[0x263EFF980] arrayWithCapacity:a8];
    testCasesToWrite = v19->_testCasesToWrite;
    v19->_testCasesToWrite = (NSMutableArray *)v20;
  }
  return v19;
}

@end