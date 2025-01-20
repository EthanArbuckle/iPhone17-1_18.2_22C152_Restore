@interface PESCAPReviewManager
+ (PESCAPReviewManager)sharedReviewManager;
- (PESCAPReviewManager)init;
- (id)lastPasteBreadcrumb;
- (id)payloadForAsset:(id)a3;
- (void)clearAll;
- (void)registerPayload:(id)a3 forAsset:(id)a4;
@end

@implementation PESCAPReviewManager

- (void).cxx_destruct
{
}

- (id)lastPasteBreadcrumb
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  assetsMap = self->_assetsMap;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__PESCAPReviewManager_lastPasteBreadcrumb__block_invoke;
  v7[3] = &unk_2642BEC10;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)assetsMap enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __42__PESCAPReviewManager_lastPasteBreadcrumb__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  v6 = [v5 filename];
  if (v6)
  {
    id v7 = [v5 filename];
  }
  else
  {
    id v7 = v16;
  }
  id v8 = v7;

  v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v5 actionType];
  v11 = @"Smart C&P";
  if (!v10) {
    v11 = @"Legacy C&P";
  }
  v12 = v11;
  unint64_t v13 = [v5 reason] - 1;
  if (v13 > 6) {
    v14 = @"Unknown";
  }
  else {
    v14 = off_2642BEC30[v13];
  }
  [v5 score];
  [v9 appendFormat:@"%@ - %@ - %@ (%f)\n", v8, v12, v14, v15];
}

- (void)clearAll
{
  id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  assetsMap = self->_assetsMap;
  self->_assetsMap = v3;
  MEMORY[0x270F9A758](v3, assetsMap);
}

- (id)payloadForAsset:(id)a3
{
  assetsMap = self->_assetsMap;
  v4 = [a3 uuid];
  id v5 = [(NSMutableDictionary *)assetsMap objectForKeyedSubscript:v4];

  return v5;
}

- (void)registerPayload:(id)a3 forAsset:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 originalFilename];
    [v10 setFilename:v7];
  }
  assetsMap = self->_assetsMap;
  v9 = [v6 uuid];
  [(NSMutableDictionary *)assetsMap setObject:v10 forKeyedSubscript:v9];
}

- (PESCAPReviewManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PESCAPReviewManager;
  v2 = [(PESCAPReviewManager *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetsMap = v2->_assetsMap;
    v2->_assetsMap = v3;
  }
  return v2;
}

+ (PESCAPReviewManager)sharedReviewManager
{
  if (sharedReviewManager_onceToken != -1) {
    dispatch_once(&sharedReviewManager_onceToken, &__block_literal_global_1257);
  }
  v2 = (void *)sharedReviewManager_reviewManager;
  return (PESCAPReviewManager *)v2;
}

uint64_t __42__PESCAPReviewManager_sharedReviewManager__block_invoke()
{
  v0 = objc_alloc_init(PESCAPReviewManager);
  uint64_t v1 = sharedReviewManager_reviewManager;
  sharedReviewManager_reviewManager = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end