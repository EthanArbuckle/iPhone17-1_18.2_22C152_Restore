@interface TPSJSONCacheController
+ (id)sharedInstance;
- (BOOL)isURLValid:(id)a3;
- (id)formattedDataWithData:(id)a3;
- (id)formattedDataWithFileURL:(id)a3;
- (id)newDataCache;
- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4;
@end

@implementation TPSJSONCacheController

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(TPSJSONCacheController *)self isURLValid:v6])
  {
    v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__TPSJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke;
    block[3] = &unk_1E5906D88;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    dispatch_async(v8, block);
  }
}

- (BOOL)isURLValid:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  id v6 = [v4 path];

  LOBYTE(v4) = [v5 fileExistsAtPath:v6];
  return (char)v4;
}

uint64_t __40__TPSJSONCacheController_sharedInstance__block_invoke()
{
  v0 = [(TPSDataCacheController *)[TPSJSONCacheController alloc] initWithIdentifier:@"TPSJSONCacheIdentifier" directoryName:@"JSON" maxCacheSize:0x800000 URLSessionDataType:1];
  v1 = (void *)sharedInstance_gTPSJSONCacheController;
  sharedInstance_gTPSJSONCacheController = (uint64_t)v0;

  v2 = (void *)sharedInstance_gTPSJSONCacheController;
  return [v2 setBackgroundOriginUpdate:1];
}

+ (id)sharedInstance
{
  if (sharedInstance_predicate_0 != -1) {
    dispatch_once(&sharedInstance_predicate_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_gTPSJSONCacheController;
  return v2;
}

uint64_t __69__TPSJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __69__TPSJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v3 = [a1[4] path];
  id v4 = (void *)[v2 initWithContentsOfFile:v3];

  v5 = [a1[5] formattedDataWithData:v4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__TPSJSONCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2;
  block[3] = &unk_1E5906AD8;
  id v6 = a1[6];
  id v11 = v4;
  id v12 = v6;
  id v10 = v5;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)formattedDataWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v10 = 0;
    id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:1 error:&v10];
    id v5 = v10;
    if (v5)
    {
      id v6 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
      id v7 = +[TPSLogger data];
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
      if (v6)
      {
        if (v8) {
          [(TPSJSONCacheController *)(uint64_t)v5 formattedDataWithData:v7];
        }
      }
      else if (v8)
      {
        -[TPSJSONCacheController formattedDataWithData:]((uint64_t)v5, v7);
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)newDataCache
{
  id v2 = objc_alloc_init(TPSDataCache);
  [(TPSDataCache *)v2 setCacheType:0];
  [(TPSDataCache *)v2 setMaxAge:108000];
  return v2;
}

- (id)formattedDataWithFileURL:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9B8];
  id v5 = [a3 path];
  id v6 = [v4 dataWithContentsOfFile:v5];

  id v7 = [(TPSJSONCacheController *)self formattedDataWithData:v6];

  return v7;
}

- (void)formattedDataWithData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19C8DC000, a2, OS_LOG_TYPE_DEBUG, "Invalid json data %@", (uint8_t *)&v2, 0xCu);
}

- (void)formattedDataWithData:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_19C8DC000, log, OS_LOG_TYPE_DEBUG, "Invalid json data %@, error string %@", (uint8_t *)&v3, 0x16u);
}

@end