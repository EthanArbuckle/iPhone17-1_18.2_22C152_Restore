@interface TSUTemporaryDocumentCacheManager
+ (id)baseDirectoryURL;
+ (id)sharedManager;
- (id)newDirectoryForDocumentUUID:(id)a3;
@end

@implementation TSUTemporaryDocumentCacheManager

+ (id)baseDirectoryURL
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = 0;
  v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v6];

  if (v3)
  {
    v4 = [v3 URLByAppendingPathComponent:@"DocumentCaches"];
  }
  else
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_19);
    }
    v4 = 0;
  }

  return v4;
}

void __52__TSUTemporaryDocumentCacheManager_baseDirectoryURL__block_invoke()
{
  uint64_t v0 = TSULogCreateCategory("TSUDefaultCat");
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__TSUTemporaryDocumentCacheManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __49__TSUTemporaryDocumentCacheManager_sharedManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;
}

- (id)newDirectoryForDocumentUUID:(id)a3
{
  v4 = [a3 UUIDString];
  id v5 = [(TSUTemporaryDirectoryManager *)self newDirectoryWithFilename:v4];

  return v5;
}

@end