@interface PCAssetManager
+ (PCAssetManager)sharedInstance;
- (PCAssetManager)init;
- (id)alternateAssetQueryForAssetType:(int64_t)a3;
- (id)alternateBundleForAssetType:(int64_t)a3;
- (id)assetQueryForAssetType:(int64_t)a3;
- (id)assetQueryForAssetType:(int64_t)a3 alternate:(BOOL)a4;
- (id)assetRequestConfiguration:(int64_t)a3 alternate:(BOOL)a4;
- (id)bundleForAssetType:(int64_t)a3;
- (id)imageForAssetType:(int64_t)a3;
- (id)imageNameForAssetType:(int64_t)a3;
- (unsigned)colorCodeForAssetType:(int64_t)a3;
- (unsigned)productVersionForAssetType:(int64_t)a3;
- (void)dealloc;
- (void)handleDownloadCompletion:(id)a3 assetType:(int64_t)a4 error:(id)a5;
- (void)handleQueryResult:(id)a3 assetType:(int64_t)a4 productType:(id)a5 isFallback:(BOOL)a6 error:(id)a7 isAlternateBundle:(BOOL)a8;
- (void)initiateQuery:(id)a3 config:(id)a4;
- (void)prewarmAlternateBundleForAssetType:(int64_t)a3;
- (void)prewarmBundleForAssetType:(int64_t)a3;
- (void)prewarmBundleForAssetType:(int64_t)a3 alternate:(BOOL)a4;
- (void)sfAssetManagerEnsureStarted;
@end

@implementation PCAssetManager

+ (PCAssetManager)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_shared;
  return (PCAssetManager *)v2;
}

uint64_t __32__PCAssetManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PCAssetManager);
  uint64_t v1 = sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (PCAssetManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)PCAssetManager;
  v2 = [(PCAssetManager *)&v8 init];
  if (v2)
  {
    v3 = (int *)LogCategoryCreateEx();
    v2->_ucat = (LogCategory *)v3;
    if (*v3 <= 30 && (*v3 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ProximityControl.assetManager.queue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    [(PCAssetManager *)v2 sfAssetManagerEnsureStarted];
    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PCAssetManager;
  [(PCAssetManager *)&v4 dealloc];
}

- (id)bundleForAssetType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_26443E090[a3 - 1];
  }
  bundles = self->_bundles;
  v7 = [NSNumber numberWithInteger:a3];
  objc_super v8 = [(NSMutableDictionary *)bundles objectForKeyedSubscript:v7];

  int var0 = self->_ucat->var0;
  if (v8)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v10 = v8;
  }
  else if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[PCAssetManager prewarmBundleForAssetType:](self, "prewarmBundleForAssetType:", a3, v5);
  }
  else
  {
    -[PCAssetManager prewarmBundleForAssetType:](self, "prewarmBundleForAssetType:", a3, v12);
  }

  return v8;
}

- (id)alternateBundleForAssetType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_26443E090[a3 - 1];
  }
  alternateBundles = self->_alternateBundles;
  v7 = [NSNumber numberWithInteger:a3];
  objc_super v8 = [(NSMutableDictionary *)alternateBundles objectForKeyedSubscript:v7];

  int var0 = self->_ucat->var0;
  if (v8)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v10 = v8;
  }
  else if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[PCAssetManager prewarmAlternateBundleForAssetType:](self, "prewarmAlternateBundleForAssetType:", a3, v5);
  }
  else
  {
    -[PCAssetManager prewarmAlternateBundleForAssetType:](self, "prewarmAlternateBundleForAssetType:", a3, v12);
  }

  return v8;
}

- (id)imageForAssetType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_26443E090[a3 - 1];
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v13 = v5;
    LogPrintF();
  }
  v7 = -[PCAssetManager bundleForAssetType:](self, "bundleForAssetType:", a3, v13);
  if (v7)
  {
    objc_super v8 = [(PCAssetManager *)self imageNameForAssetType:a3];
    if (v8)
    {
      v9 = [MEMORY[0x263F1C6B0] imageNamed:v8 inBundle:v7 withConfiguration:0];
      int v10 = self->_ucat->var0;
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      int v11 = self->_ucat->var0;
      if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)prewarmBundleForAssetType:(int64_t)a3
{
}

- (void)prewarmAlternateBundleForAssetType:(int64_t)a3
{
}

- (void)prewarmBundleForAssetType:(int64_t)a3 alternate:(BOOL)a4
{
  BOOL v4 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a3 - 1) >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a3);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_26443E090[a3 - 1];
    }
    v9 = @"NO";
    if (v4) {
      v9 = @"YES";
    }
    v13 = v8;
    v14 = v9;
    LogPrintF();
  }
  -[PCAssetManager assetRequestConfiguration:alternate:](self, "assetRequestConfiguration:alternate:", a3, v4, v13, v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    int v10 = [(PCAssetManager *)self assetQueryForAssetType:a3 alternate:v4];
    if (v10)
    {
      [(PCAssetManager *)self initiateQuery:v10 config:v15];
    }
    else
    {
      int v12 = self->_ucat->var0;
      if (v12 <= 60 && (v12 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
  else
  {
    int v11 = self->_ucat->var0;
    if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (id)assetQueryForAssetType:(int64_t)a3
{
  return [(PCAssetManager *)self assetQueryForAssetType:a3 alternate:0];
}

- (id)alternateAssetQueryForAssetType:(int64_t)a3
{
  return [(PCAssetManager *)self assetQueryForAssetType:a3 alternate:1];
}

- (id)assetQueryForAssetType:(int64_t)a3 alternate:(BOOL)a4
{
  BOOL v4 = a4;
  if ((unint64_t)(a3 - 1) >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_26443E090[a3 - 1];
  }
  uint64_t v8 = [(PCAssetManager *)self colorCodeForAssetType:a3];
  if (v8 == *MEMORY[0x263F6C350])
  {
    int var0 = self->_ucat->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_23;
    }
    goto LABEL_14;
  }
  uint64_t v10 = v8;
  uint64_t v11 = [(PCAssetManager *)self productVersionForAssetType:a3];
  int v12 = self->_ucat->var0;
  if (!v11)
  {
    if (v12 > 60 || v12 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_23;
    }
LABEL_14:
    LogPrintF();
LABEL_23:
    id v15 = 0;
    goto LABEL_24;
  }
  if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v13 = objc_alloc(MEMORY[0x263F6C220]);
  if (v4) {
    uint64_t v14 = [v13 initWithHomePodColor:v10 version:v11];
  }
  else {
    uint64_t v14 = [v13 initWithSingleHomePodColor:v10 version:v11];
  }
  id v15 = (void *)v14;
LABEL_24:

  return v15;
}

- (id)assetRequestConfiguration:(int64_t)a3 alternate:(BOOL)a4
{
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x263F6C228]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__PCAssetManager_assetRequestConfiguration_alternate___block_invoke;
  v11[3] = &unk_26443E048;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  BOOL v13 = a4;
  v7 = (void *)[v6 initWithQueryResultHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__PCAssetManager_assetRequestConfiguration_alternate___block_invoke_2;
  v9[3] = &unk_26443E070;
  objc_copyWeak(v10, &location);
  v10[1] = (id)a3;
  [v7 setDownloadCompletionHandler:v9];
  objc_destroyWeak(v10);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v7;
}

void __54__PCAssetManager_assetRequestConfiguration_alternate___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v12 = objc_loadWeakRetained(&to);
  [v12 handleQueryResult:v9 assetType:*(void *)(a1 + 40) productType:v10 isFallback:a4 error:v11 isAlternateBundle:*(unsigned __int8 *)(a1 + 48)];

  objc_destroyWeak(&to);
}

void __54__PCAssetManager_assetRequestConfiguration_alternate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v7 = objc_loadWeakRetained(&to);
  [v7 handleDownloadCompletion:v5 assetType:*(void *)(a1 + 40) error:v6];

  objc_destroyWeak(&to);
}

- (unsigned)colorCodeForAssetType:(int64_t)a3
{
  unsigned __int8 v3 = *MEMORY[0x263F6C350];
  if ((unint64_t)(a3 - 1) < 8) {
    return 0x201210807090201uLL >> (8 * (a3 - 1));
  }
  return v3;
}

- (void)handleDownloadCompletion:(id)a3 assetType:(int64_t)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a4 - 1) >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a4);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = off_26443E090[a4 - 1];
    }
    LogPrintF();
  }
}

- (void)initiateQuery:(id)a3 config:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v10;
    id v9 = v6;
    LogPrintF();
  }
  [(PCAssetManager *)self sfAssetManagerEnsureStarted];
  [(SFDeviceAssetManager *)self->_sfAssetManager getAssetBundleForDeviceQuery:v10 withRequestConfiguration:v6];
}

- (void)handleQueryResult:(id)a3 assetType:(int64_t)a4 productType:(id)a5 isFallback:(BOOL)a6 error:(id)a7 isAlternateBundle:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  id v35 = a3;
  id v14 = a5;
  id v15 = a7;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a4 - 1) >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a4);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_26443E090[a4 - 1];
    }
    v18 = "no";
    if (v10) {
      v18 = "yes";
    }
    v33 = v18;
    id v34 = v15;
    v30 = v17;
    id v31 = v35;
    id v32 = v14;
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  if (!v35 || v15)
  {
    int v22 = self->_ucat->var0;
    if (v22 <= 60 && (v22 != -1 || _LogCategory_Initialize()))
    {
      if ((unint64_t)(a4 - 1) >= 8)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a4);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = off_26443E090[a4 - 1];
      }
      LogPrintF();
LABEL_31:
    }
  }
  else
  {
    if (a4)
    {
      if (v8)
      {
        alternateBundles = self->_alternateBundles;
        if (!alternateBundles)
        {
          v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          v21 = self->_alternateBundles;
          self->_alternateBundles = v20;

          alternateBundles = self->_alternateBundles;
        }
      }
      else
      {
        alternateBundles = self->_bundles;
        if (!alternateBundles)
        {
          v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          bundles = self->_bundles;
          self->_bundles = v25;

          alternateBundles = self->_bundles;
        }
      }
      v27 = objc_msgSend(NSNumber, "numberWithInteger:", a4, v30, v31, v32, v33, v34);
      [(NSMutableDictionary *)alternateBundles setObject:v35 forKeyedSubscript:v27];

      v28 = (void *)MEMORY[0x263F08A00];
      id v29 = (id)kPCAssetManagerNotificationNameQueryDidComplete;
      v23 = [v28 defaultCenter];
      [(__CFString *)v23 postNotificationName:v29 object:0];

      goto LABEL_31;
    }
    int v24 = self->_ucat->var0;
    if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (id)imageNameForAssetType:(int64_t)a3
{
  id v5 = (id)*MEMORY[0x263F6C328];
  id v6 = [MEMORY[0x263F1CB00] currentTraitCollection];
  unint64_t v7 = [v6 userInterfaceStyle];

  if (v7 == 2)
  {
    id v8 = (id)*MEMORY[0x263F6C320];

    id v5 = v8;
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    if ((unint64_t)(a3 - 1) >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", a3);
      BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = off_26443E090[a3 - 1];
    }
    if (v7 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"? (%ld)", v7);
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = off_26443E0D0[v7];
    }
    LogPrintF();
  }
  return v5;
}

- (unsigned)productVersionForAssetType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 0;
  }
  else {
    return dword_21CC6A2C0[a3 - 1];
  }
}

- (void)sfAssetManagerEnsureStarted
{
  if (!self->_sfAssetManager)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v4 = (SFDeviceAssetManager *)objc_alloc_init(MEMORY[0x263F6C218]);
    sfAssetManager = self->_sfAssetManager;
    self->_sfAssetManager = v4;

    [(SFDeviceAssetManager *)self->_sfAssetManager setDispatchQueue:self->_internalQueue];
    id v6 = self->_sfAssetManager;
    [(SFDeviceAssetManager *)v6 activate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfAssetManager, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_alternateBundles, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
}

@end