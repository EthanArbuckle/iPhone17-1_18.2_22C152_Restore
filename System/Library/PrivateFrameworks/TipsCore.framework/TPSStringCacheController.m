@interface TPSStringCacheController
+ (id)sharedInstance;
- (BOOL)isURLValid:(id)a3;
- (id)formattedDataWithData:(id)a3;
- (id)formattedDataWithFileURL:(id)a3;
- (id)newDataCache;
- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4;
@end

@implementation TPSStringCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_5 != -1) {
    dispatch_once(&sharedInstance_predicate_5, &__block_literal_global_20);
  }
  v2 = (void *)sharedInstance_gTPSStringCacheController;
  return v2;
}

uint64_t __42__TPSStringCacheController_sharedInstance__block_invoke()
{
  v0 = [(TPSDataCacheController *)[TPSStringCacheController alloc] initWithIdentifier:@"TPSStringCacheIdentifier" directoryName:@"String" maxCacheSize:5242880 URLSessionDataType:3];
  uint64_t v1 = sharedInstance_gTPSStringCacheController;
  sharedInstance_gTPSStringCacheController = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)newDataCache
{
  v2 = objc_alloc_init(TPSDataCache);
  [(TPSDataCache *)v2 setCacheType:1];
  [(TPSDataCache *)v2 setMaxAge:21600];
  return v2;
}

- (id)formattedDataWithFileURL:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  v5 = [a3 path];
  v6 = [v4 dataWithContentsOfFile:v5];

  v7 = [(TPSStringCacheController *)self formattedDataWithData:v6];

  return v7;
}

- (id)formattedDataWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
    if (v4) {
      goto LABEL_7;
    }
    v5 = +[TPSLogger data];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[TPSStringCacheController formattedDataWithData:]((uint64_t)v3, v5);
    }
  }
  v4 = 0;
LABEL_7:

  return v4;
}

- (BOOL)isURLValid:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  v6 = [v4 path];

  LOBYTE(v4) = [v5 fileExistsAtPath:v6];
  return (char)v4;
}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TPSStringCacheController *)self isURLValid:v6])
  {
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__TPSStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke;
    block[3] = &unk_1E5906D88;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

void __71__TPSStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v3 = [a1[4] path];
  id v4 = (void *)[v2 initWithContentsOfFile:v3];

  v5 = [a1[5] formattedDataWithData:v4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__TPSStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2;
  block[3] = &unk_1E5906AD8;
  id v6 = a1[6];
  id v11 = v4;
  id v12 = v6;
  id v10 = v5;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__TPSStringCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)formattedDataWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_DEBUG, "Invalid string data %@", (uint8_t *)&v2, 0xCu);
}

@end