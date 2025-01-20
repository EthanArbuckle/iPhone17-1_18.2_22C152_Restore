@interface TSUDiagnostics
+ (id)diagnosticDataDirectory;
@end

@implementation TSUDiagnostics

+ (id)diagnosticDataDirectory
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  id v10 = 0;
  v3 = [v2 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v10];
  id v4 = v10;
  if (v3)
  {
    v5 = [v3 URLByAppendingPathComponent:@"DiagnosticData" isDirectory:1];
    id v9 = v4;
    char v6 = [v2 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v9];
    id v7 = v9;

    if ((v6 & 1) == 0 && TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_32);
    }
  }
  else
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_4);
    }
    v5 = 0;
    id v7 = v4;
  }

  return v5;
}

void __41__TSUDiagnostics_diagnosticDataDirectory__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

void __41__TSUDiagnostics_diagnosticDataDirectory__block_invoke_2()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

@end