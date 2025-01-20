@interface AXPhoenixAssetMonitor
- (AXAsset)latestAsset;
- (AXAssetController)assetController;
- (AXPhoenixAssetMonitor)initWithDelegate:(id)a3;
- (AXPhoenixAssetMonitorDelegate)delegate;
- (AXPhoenixAssetPolicy)assetPolicy;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetDidUpdate;
- (void)setAssetController:(id)a3;
- (void)setAssetPolicy:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLatestAsset:(id)a3;
@end

@implementation AXPhoenixAssetMonitor

- (AXPhoenixAssetMonitor)initWithDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)AXPhoenixAssetMonitor;
  v14 = [(AXPhoenixAssetMonitor *)&v12 init];
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    [(AXPhoenixAssetMonitor *)v14 setDelegate:location[0]];
    id v8 = +[AXAssetPolicy policy];
    -[AXPhoenixAssetMonitor setAssetPolicy:](v14, "setAssetPolicy:");

    v9 = (void *)MEMORY[0x263F21140];
    v10 = [(AXPhoenixAssetMonitor *)v14 assetPolicy];
    v4 = (AXAssetController *)(id)objc_msgSend(v9, "assetControllerWithPolicy:qosClass:");
    assetController = v14->_assetController;
    v14->_assetController = v4;

    [(AXAssetController *)v14->_assetController setUserInitiated:1];
    [(AXAssetController *)v14->_assetController addObserver:v14];
    id v11 = (id)AXLogBackTap();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v15, (uint64_t)"-[AXPhoenixAssetMonitor initWithDelegate:]", (uint64_t)v14);
      _os_log_impl(&dword_2372C8000, (os_log_t)v11, OS_LOG_TYPE_INFO, "[PHOENIX] %s [%@]: Model loading: Initiating download", v15, 0x16u);
    }
    objc_storeStrong(&v11, 0);
    -[AXAssetController refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:](v14->_assetController, "refreshAssetsByForceUpdatingCatalog:updatingCatalogIfNeeded:catalogRefreshOverrideTimeout:completion:", 0, 0, 0);
  }
  v7 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v7;
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  BOOL v12 = a5;
  id v11 = 0;
  objc_storeStrong(&v11, a6);
  os_log_t oslog = (os_log_t)(id)AXLogBackTap();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v16, (uint64_t)"-[AXPhoenixAssetMonitor assetController:didFinishRefreshingAssets:wasSuccessful:error:]", (uint64_t)v15, (uint64_t)v13);
    _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s [%@]: Model loading: Refreshed Assets:\n%@", v16, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v6 = (id)[v13 lastObject];
  -[AXPhoenixAssetMonitor setLatestAsset:](v15, "setLatestAsset:");

  [(AXPhoenixAssetMonitor *)v15 assetDidUpdate];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  BOOL v14 = a5;
  id v13 = 0;
  objc_storeStrong(&v13, a6);
  BOOL v12 = a7;
  if (v14)
  {
    os_log_t oslog = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v18, (uint64_t)"-[AXPhoenixAssetMonitor assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]", (uint64_t)v17, (uint64_t)v15);
      _os_log_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_INFO, "[PHOENIX] %s [%@]: Model loading: Downloaded Asset:\n%@", v18, 0x20u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(AXPhoenixAssetMonitor *)v17 setLatestAsset:v15];
    [(AXPhoenixAssetMonitor *)v17 assetDidUpdate];
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)assetDidUpdate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v8 = self;
  location[1] = (id)a2;
  location[0] = (id)AXLogBackTap();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    id v6 = [(AXPhoenixAssetMonitor *)v8 latestAsset];
    __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v9, (uint64_t)"-[AXPhoenixAssetMonitor assetDidUpdate]", (uint64_t)v8, (uint64_t)v6);
    _os_log_impl(&dword_2372C8000, (os_log_t)location[0], OS_LOG_TYPE_INFO, "[PHOENIX] %s [%@]: Model loading: Got assets:\n%@", v9, 0x20u);
  }
  objc_storeStrong(location, 0);
  v5 = [(AXPhoenixAssetMonitor *)v8 delegate];
  v4 = [(AXPhoenixAssetMonitor *)v8 latestAsset];
  id v3 = (id)[(AXAsset *)v4 localURL];
  v2 = [(AXPhoenixAssetMonitor *)v8 latestAsset];
  [(AXPhoenixAssetMonitorDelegate *)v5 modelDidUpdate:v3 assetVersion:[(AXAsset *)v2 contentVersion]];
}

- (AXAssetController)assetController
{
  return self->_assetController;
}

- (void)setAssetController:(id)a3
{
}

- (AXPhoenixAssetPolicy)assetPolicy
{
  return self->_assetPolicy;
}

- (void)setAssetPolicy:(id)a3
{
}

- (AXAsset)latestAsset
{
  return self->_latestAsset;
}

- (void)setLatestAsset:(id)a3
{
}

- (AXPhoenixAssetMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXPhoenixAssetMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end