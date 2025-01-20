@interface TTKTestCaseWriter
+ (id)storeToDir:(id)a3 inputMode:(id)a4 layouts:(id)a5 writeOnFlush:(BOOL)a6 maxTestCasesPerFile:(unsigned int)a7 maxFilesPerDirectory:(unsigned int)a8;
+ (id)storeToFile:(id)a3 inputMode:(id)a4 layouts:(id)a5;
@end

@implementation TTKTestCaseWriter

+ (id)storeToDir:(id)a3 inputMode:(id)a4 layouts:(id)a5 writeOnFlush:(BOOL)a6 maxTestCasesPerFile:(unsigned int)a7 maxFilesPerDirectory:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  BOOL v10 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[TTKDirSink alloc] init:v15 inputMode:v14 layouts:v13 writeOnFlush:v10 maxTestCasesPerFile:v9 maxFilesPerDirectory:v8];

  return v16;
}

+ (id)storeToFile:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[TTKFileSink alloc] init:v9 inputMode:v8 layouts:v7];

  return v10;
}

@end