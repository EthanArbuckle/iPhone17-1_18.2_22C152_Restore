@interface PURenderDebugController
+ (id)debugFilesDirectory;
+ (id)getDebugFiles;
+ (id)listDebugFilesViewController;
+ (id)shareSheetViewController;
+ (void)deleteDebugDirectory;
+ (void)setCoreImageDebugMode:(BOOL)a3 dumpInputs:(BOOL)a4 dumpOutputs:(BOOL)a5 dumpIntermediates:(BOOL)a6 dumpTiming:(BOOL)a7;
@end

@implementation PURenderDebugController

+ (id)shareSheetViewController
{
  id v3 = objc_alloc(MEMORY[0x1E4F9F2E8]);
  v4 = [a1 getDebugFiles];
  v5 = (void *)[v3 initWithActivityItems:v4 applicationActivities:0];

  return v5;
}

+ (id)listDebugFilesViewController
{
  v2 = objc_alloc_init(PUDebugImageTableViewController);
  return v2;
}

+ (void)deleteDebugDirectory
{
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [a1 debugFilesDirectory];
  v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PURenderDebugController_deleteDebugDirectory__block_invoke;
  v6[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v6[4] = a1;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __47__PURenderDebugController_deleteDebugDirectory__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 debugFilesDirectory];
  id v6 = [v4 stringByAppendingPathComponent:v3];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v5 removeItemAtPath:v6 error:0];
}

+ (id)getDebugFiles
{
  v2 = [a1 debugFilesDirectory];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [v3 contentsOfDirectoryAtPath:v2 error:0];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__PURenderDebugController_getDebugFiles__block_invoke;
  v11[3] = &unk_1E5F230D0;
  id v12 = v2;
  id v6 = v5;
  id v13 = v6;
  id v7 = v2;
  [v4 enumerateObjectsUsingBlock:v11];
  v8 = v13;
  id v9 = v6;

  return v9;
}

void __40__PURenderDebugController_getDebugFiles__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([v6 containsString:@"pdf"] & 1) != 0
    || [v6 containsString:@"txt"])
  {
    id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:v6];
    v4 = *(void **)(a1 + 40);
    id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
    [v4 addObject:v5];
  }
}

+ (id)debugFilesDirectory
{
  v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingString:@"NURenderDebug/"];

  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  return v3;
}

+ (void)setCoreImageDebugMode:(BOOL)a3 dumpInputs:(BOOL)a4 dumpOutputs:(BOOL)a5 dumpIntermediates:(BOOL)a6 dumpTiming:(BOOL)a7
{
  if (!a3) {
    return;
  }
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v12 appendString:@"4 pdf"];
  if (!v10)
  {
    if (!v9) {
      goto LABEL_4;
    }
LABEL_10:
    [v12 appendString:@" dump-outputs"];
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [v12 appendString:@" dump-inputs"];
  if (v9) {
    goto LABEL_10;
  }
LABEL_4:
  if (v7) {
LABEL_5:
  }
    [v12 appendString:@" dump-timing"];
LABEL_6:
  if (v8)
  {
    setenv("CI_DISABLE_MERGING", "1", 1);
    [v12 appendString:@" dump-intermediates"];
  }
  else
  {
    unsetenv("CI_DISABLE_MERGING");
  }
  id v14 = v12;
  setenv("CI_PRINT_TREE", (const char *)[v14 cStringUsingEncoding:1], 1);
  id v13 = [a1 debugFilesDirectory];
  setenv("CI_TEMP_DIR", (const char *)[v13 UTF8String], 1);
}

@end