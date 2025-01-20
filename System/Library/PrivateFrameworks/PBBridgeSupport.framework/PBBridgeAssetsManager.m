@interface PBBridgeAssetsManager
- (NSDictionary)deviceAttributes;
- (OS_dispatch_queue)concurrentQueue;
- (OS_dispatch_queue)serialQueue;
- (PBBridgeAssetsManager)init;
- (id)_assetQueries:(id)a3 atlas:(id)a4;
- (id)_assetQueryForBridgeLaunchSplash;
- (id)_assetQueryForDeviceAttributes:(unint64_t)a3 deviceAttributes:(id)a4;
- (id)_assetQueryForFamilySetupImage;
- (id)_assetQueryForZeroDayForcedUpdate;
- (id)allAssetsDownloadCompletion;
- (id)assetDownloadCompletion;
- (unint64_t)hardwareGenerationForProductType:(id)a3;
- (void)_beginAssetDownloads:(id)a3;
- (void)_beginPullingAssetsForDeviceAttributes:(id)a3 completion:(id)a4;
- (void)_downloadAtlasAsset:(id)a3;
- (void)_linkDownloadedAsset:(id)a3;
- (void)_queryForImageAssets:(id)a3;
- (void)_runAssetQuery:(id)a3 completion:(id)a4;
- (void)_runNextQuery:(id)a3;
- (void)_runQueries:(id)a3 withCompletion:(id)a4;
- (void)_startAssetDownload:(id)a3;
- (void)_startAtlasDownloadAndQueryOnSuccess:(id)a3;
- (void)beginPullingAssetsForAdvertisingName:(id)a3 completion:(id)a4;
- (void)beginPullingAssetsForDevice:(id)a3 completion:(id)a4;
- (void)beginPullingAssetsForDeviceMaterial:(unint64_t)a3 size:(unint64_t)a4 branding:(unint64_t)a5 completion:(id)a6;
- (void)purgeAllAssetsLocalOnly:(BOOL)a3;
- (void)setAllAssetsDownloadCompletion:(id)a3;
- (void)setAssetDownloadCompletion:(id)a3;
- (void)setConcurrentQueue:(id)a3;
- (void)setDeviceAttributes:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation PBBridgeAssetsManager

- (PBBridgeAssetsManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)PBBridgeAssetsManager;
  v2 = [(PBBridgeAssetsManager *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Bridge-AssetQueue-Serial", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Bridge-AssetQueue-Concurrent", v5);
    concurrentQueue = v2->_concurrentQueue;
    v2->_concurrentQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)beginPullingAssetsForDeviceMaterial:(unint64_t)a3 size:(unint64_t)a4 branding:(unint64_t)a5 completion:(id)a6
{
  v15[3] = *MEMORY[0x263EF8340];
  v14[0] = @"Material_Type";
  objc_super v9 = NSNumber;
  id v10 = a6;
  v11 = [v9 numberWithUnsignedInteger:a3];
  v15[0] = v11;
  v14[1] = @"Size_Type";
  v12 = [NSNumber numberWithUnsignedInteger:a4];
  v14[2] = @"HW_Class";
  v15[1] = v12;
  v15[2] = &unk_26CCA1598;
  v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  [(PBBridgeAssetsManager *)self _beginPullingAssetsForDeviceAttributes:v13 completion:v10];
}

- (void)beginPullingAssetsForAdvertisingName:(id)a3 completion:(id)a4
{
  v18[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = PBAdvertisingInfoFromPayload(v6);
  objc_super v9 = [v8 objectForKeyedSubscript:@"s"];
  uint64_t v10 = [v9 integerValue];

  uint64_t v11 = [v8 objectForKeyedSubscript:@"m"];
  v12 = (void *)v11;
  if (v11)
  {
    v18[0] = v11;
    v17[0] = @"Material_Type";
    v17[1] = @"Size_Type";
    v13 = [NSNumber numberWithUnsignedInteger:SizeForInternalSize(v10)];
    v17[2] = @"HW_Class";
    v18[1] = v13;
    v18[2] = &unk_26CCA1598;
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    [(PBBridgeAssetsManager *)self _beginPullingAssetsForDeviceAttributes:v14 completion:v7];
  }
  else
  {
    v14 = pbb_mobileasset_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_21C445000, v14, OS_LOG_TYPE_DEFAULT, "Ignored Pulling Assets for Malformed Advertising Name: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)beginPullingAssetsForDevice:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v6 = *MEMORY[0x263F57628];
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [v8 valueForProperty:v6];
  unint64_t v10 = +[PBBridgeWatchAttributeController materialFromDevice:v8];
  uint64_t v11 = [v8 valueForProperty:*MEMORY[0x263F57548]];

  if (MGGetBoolAnswer() && v11)
  {
    v12 = pbb_mobileasset_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[PBBridgeAssetsManager beginPullingAssetsForDevice:completion:]";
      _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyArtworkTraits to get PBBDeviceSize", buf, 0xCu);
    }

    v13 = [v11 objectForKeyedSubscript:@"ArtworkDeviceSubType"];
    [v13 unsignedIntegerValue];

    uint64_t v14 = PBVariantSizeForArtworkDeviceSubType();
  }
  else
  {
    int v15 = pbb_bridge_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[PBBridgeAssetsManager beginPullingAssetsForDevice:completion:]";
      _os_log_impl(&dword_21C445000, v15, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyProductType to get PBBDeviceSize", buf, 0xCu);
    }

    uint64_t v14 = PBVariantSizeForProductType();
  }
  uint64_t v16 = v14;
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10, @"Material_Type");
  v22[0] = v17;
  v21[1] = @"Size_Type";
  v18 = [NSNumber numberWithUnsignedInteger:v16];
  v22[1] = v18;
  v21[2] = @"HW_Class";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PBBridgeAssetsManager hardwareGenerationForProductType:](self, "hardwareGenerationForProductType:", v9));
  v22[2] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  [(PBBridgeAssetsManager *)self _beginPullingAssetsForDeviceAttributes:v20 completion:v7];
}

- (void)_beginPullingAssetsForDeviceAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [(PBBridgeAssetsManager *)self setDeviceAttributes:a3];
  id v7 = objc_alloc_init(MEMORY[0x263F559B8]);
  [v7 setDiscretionary:0];
  id v8 = pbb_mobileasset_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "Downloading asset catalog...", buf, 2u);
  }

  objc_super v9 = (void *)MEMORY[0x263F55938];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke;
  v11[3] = &unk_264401380;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 startCatalogDownload:@"com.apple.MobileAsset.BridgeAssets" options:v7 then:v11];
}

void __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = pbb_mobileasset_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = a2;
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Got the metadata download reply: %ld", buf, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) serialQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke_281;
  v7[3] = &unk_264401358;
  id v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  dispatch_async(v5, v7);
}

void __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke_281(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  v5 = *(void **)(a1 + 32);
  id v6 = [v5 deviceAttributes];
  id v7 = [v5 _assetQueryForDeviceAttributes:1 deviceAttributes:v6];

  id v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke_2;
  v9[3] = &unk_264401330;
  v9[4] = v8;
  [v8 _runAssetQuery:v7 completion:v9];
}

void __75__PBBridgeAssetsManager__beginPullingAssetsForDeviceAttributes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    v4 = [v3 firstObject];
    v5 = pbb_mobileasset_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Atlas Asset: %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) _downloadAtlasAsset:v4];
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
  }
}

- (void)_runAssetQuery:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PBBridgeAssetsManager *)self serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke;
  block[3] = &unk_2644013F8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_2;
  v4[3] = &unk_2644013D0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v6 = v3;
  id v5 = *(id *)(a1 + 32);
  [v2 queryMetaData:v4];
}

void __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_2(id *a1, uint64_t a2)
{
  v4 = [a1[4] serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_3;
  block[3] = &unk_2644013A8;
  uint64_t v8 = a2;
  id v7 = a1[6];
  id v6 = a1[5];
  dispatch_async(v4, block);
}

void __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v1 = (uint64_t *)(a1 + 48);
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = pbb_mobileasset_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_3_cold_1(v1, v2);
    }
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      return;
    }
    v4 = pbb_mobileasset_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) results];
      int v7 = 134217984;
      uint64_t v8 = [v5 count];
      _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Single Query returned %lu assets", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v2 = [*(id *)(a1 + 32) results];
    (*(void (**)(uint64_t, NSObject *))(v6 + 16))(v6, v2);
  }
}

- (void)_downloadAtlasAsset:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if (v5 == 1)
  {
    *(void *)uint64_t v16 = 0;
    if ([v4 spaceCheck:v16])
    {
      [(PBBridgeAssetsManager *)self _startAtlasDownloadAndQueryOnSuccess:v4];
      goto LABEL_13;
    }
    uint64_t v8 = pbb_mobileasset_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeAssetsManager _downloadAtlasAsset:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v5 != 2)
  {
    uint64_t v8 = pbb_mobileasset_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "Asset Download in Progress...", v16, 2u);
    }
    goto LABEL_12;
  }
  uint64_t v6 = [v4 getLocalUrl];
  int v7 = pbb_mobileasset_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v16 = 138412290;
    *(void *)&v16[4] = v6;
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "Asset already installed: %@", v16, 0xCu);
  }

  [(PBBridgeAssetsManager *)self _queryForImageAssets:v6];
LABEL_13:
}

- (void)_startAtlasDownloadAndQueryOnSuccess:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setAllowsCellularAccess:1];
  [v5 setDiscretionary:0];
  uint64_t v6 = pbb_mobileasset_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "Starting download on asset: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke;
  v8[3] = &unk_264401448;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v7 startDownload:v5 then:v8];
}

void __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke_2;
  block[3] = &unk_264401420;
  uint64_t v10 = a2;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = v5;
  uint64_t v9 = v6;
  dispatch_async(v4, block);
}

void __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48))
  {
    v1 = pbb_mobileasset_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke_2_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  else
  {
    v1 = [*(id *)(a1 + 32) getLocalUrl];
    uint64_t v10 = pbb_mobileasset_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v1;
      _os_log_impl(&dword_21C445000, v10, OS_LOG_TYPE_DEFAULT, "Local URL data from asset download %@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 40) _queryForImageAssets:v1];
  }
}

- (void)_queryForImageAssets:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = NSDictionary;
  uint64_t v5 = NSString;
  uint64_t v6 = [a3 path];
  uint64_t v7 = [v5 stringWithFormat:@"%@/%@", v6, @"Atlas.plist"];
  uint64_t v8 = [v4 dictionaryWithContentsOfFile:v7];

  uint64_t v9 = pbb_mobileasset_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl(&dword_21C445000, v9, OS_LOG_TYPE_DEFAULT, "Atlas Pointers: %@", buf, 0xCu);
  }

  uint64_t v10 = [(PBBridgeAssetsManager *)self deviceAttributes];
  int v11 = [(PBBridgeAssetsManager *)self _assetQueries:v10 atlas:v8];

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __46__PBBridgeAssetsManager__queryForImageAssets___block_invoke;
  v12[3] = &unk_264401330;
  v12[4] = self;
  [(PBBridgeAssetsManager *)self _runQueries:v11 withCompletion:v12];
}

void __46__PBBridgeAssetsManager__queryForImageAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 _beginAssetDownloads:a2];
  }
  else
  {
    uint64_t v3 = pbb_mobileasset_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_21C445000, v3, OS_LOG_TYPE_DEFAULT, "No assets found after running multiple queries", v4, 2u);
    }
  }
}

- (id)_assetQueries:(id)a3 atlas:(id)a4
{
  v23[5] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PBBridgeAssetsManager *)self _assetQueryForDeviceAttributes:0 deviceAttributes:v7];
  uint64_t v9 = NSString;
  uint64_t v10 = [v6 objectForKeyedSubscript:@"ImageAssetPointer"];
  int v11 = [v9 stringWithFormat:@"%@", v10];

  [v8 addKeyValuePair:@"ImageAssetPointer" with:v11];
  uint64_t v12 = [(PBBridgeAssetsManager *)self _assetQueryForDeviceAttributes:0 deviceAttributes:v7];

  uint64_t v13 = NSString;
  uint64_t v14 = [v6 objectForKeyedSubscript:@"UniqueVideoAssetPointer"];

  uint64_t v15 = [v13 stringWithFormat:@"%@", v14];

  [v12 addKeyValuePair:@"UniqueVideoAssetPointer" with:v15];
  uint64_t v16 = [(PBBridgeAssetsManager *)self _assetQueryForBridgeLaunchSplash];
  uint64_t v17 = [(PBBridgeAssetsManager *)self _assetQueryForFamilySetupImage];
  v18 = [(PBBridgeAssetsManager *)self _assetQueryForZeroDayForcedUpdate];
  v19 = (void *)MEMORY[0x263EFF980];
  v23[0] = v8;
  v23[1] = v12;
  v23[2] = v17;
  v23[3] = v16;
  v23[4] = v18;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];
  v21 = [v19 arrayWithArray:v20];

  return v21;
}

- (void)_runQueries:(id)a3 withCompletion:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v17 = a4;
  id v7 = dispatch_group_create();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v11);
        uint64_t v13 = [(PBBridgeAssetsManager *)self concurrentQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __52__PBBridgeAssetsManager__runQueries_withCompletion___block_invoke;
        block[3] = &unk_264401470;
        void block[4] = self;
        block[5] = v12;
        dispatch_group_async(v7, v13, block);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  uint64_t v14 = [(PBBridgeAssetsManager *)self serialQueue];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__PBBridgeAssetsManager__runQueries_withCompletion___block_invoke_2;
  v19[3] = &unk_264401358;
  id v20 = obj;
  id v21 = v17;
  id v15 = v17;
  id v16 = obj;
  dispatch_group_notify(v7, v14, v19);
}

uint64_t __52__PBBridgeAssetsManager__runQueries_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runNextQuery:*(void *)(a1 + 40)];
}

void __52__PBBridgeAssetsManager__runQueries_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "results", (void)v11);
        [v2 addObjectsFromArray:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v9 = pbb_mobileasset_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v2 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v16 = v10;
    _os_log_impl(&dword_21C445000, v9, OS_LOG_TYPE_DEFAULT, "Queries returned %lu assets", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_runNextQuery:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 queryMetaDataSync];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = pbb_mobileasset_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = v5;
      _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "Query: %@ failed with result: %ld", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_beginAssetDownloads:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = dispatch_group_create();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        long long v12 = [(PBBridgeAssetsManager *)self concurrentQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke;
        block[3] = &unk_264401470;
        void block[4] = v11;
        block[5] = self;
        dispatch_group_async(v5, v12, block);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  long long v13 = [(PBBridgeAssetsManager *)self serialQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke_294;
  v15[3] = &unk_264401470;
  id v16 = v6;
  id v17 = self;
  id v14 = v6;
  dispatch_group_notify(v5, v13, v15);
}

void __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) state];
  if (v2 == 1)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    *(void *)id v14 = 0;
    if ([v5 spaceCheck:v14])
    {
      [*(id *)(a1 + 40) _startAssetDownload:*(void *)(a1 + 32)];
      return;
    }
    id v6 = pbb_mobileasset_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PBBridgeAssetsManager _downloadAtlasAsset:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_12;
  }
  if (v2 != 2)
  {
    id v6 = pbb_mobileasset_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_21C445000, v6, OS_LOG_TYPE_DEFAULT, "Atlas Asset Download in Progress...", v14, 2u);
    }
LABEL_12:

    return;
  }
  id v3 = [*(id *)(a1 + 32) getLocalFileUrl];
  id v4 = pbb_mobileasset_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v14 = 138412290;
    *(void *)&v14[4] = v3;
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Asset Already Installed! %@", v14, 0xCu);
  }

  [*(id *)(a1 + 40) _linkDownloadedAsset:*(void *)(a1 + 32)];
}

void __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke_294(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v6) state] != 2)
        {
          char v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  char v7 = 1;
LABEL_11:

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke_2;
  v8[3] = &unk_264401498;
  v8[4] = *(void *)(a1 + 40);
  char v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __46__PBBridgeAssetsManager__beginAssetDownloads___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0;
  }
}

- (void)_startAssetDownload:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 setAllowsCellularAccess:1];
  [v5 setDiscretionary:0];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  char v7 = pbb_mobileasset_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "Starting download on asset: %@", buf, 0xCu);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__PBBridgeAssetsManager__startAssetDownload___block_invoke;
  v10[3] = &unk_2644014C0;
  id v11 = v4;
  long long v12 = self;
  dispatch_semaphore_t v13 = v6;
  uint64_t v8 = v6;
  id v9 = v4;
  [v9 startDownload:v5 then:v10];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

void __45__PBBridgeAssetsManager__startAssetDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v4 = pbb_mobileasset_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = a2;
      _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "Download for asset: %@ was not successful with result: %lu", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__PBBridgeAssetsManager__startAssetDownload___block_invoke_295;
  block[3] = &unk_264401470;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v6 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  dispatch_async(MEMORY[0x263EF83A0], block);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

uint64_t __45__PBBridgeAssetsManager__startAssetDownload___block_invoke_295(uint64_t a1)
{
  return [*(id *)(a1 + 32) _linkDownloadedAsset:*(void *)(a1 + 40)];
}

- (void)_linkDownloadedAsset:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F08850] defaultManager];
  [v3 refreshState];
  if ([v3 state] == 2)
  {
    id v20 = v3;
    long long v22 = [v3 getLocalFileUrl];
    uint64_t v5 = [v22 path];
    id v32 = 0;
    id v6 = [v4 contentsOfDirectoryAtPath:v5 error:&v32];
    id v7 = v32;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v6;
    uint64_t v24 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          long long v10 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
          if ([v10 count])
          {
            uint64_t v11 = NSString;
            __int16 v12 = [v10 firstObject];
            uint64_t v13 = [v11 stringWithFormat:@"%@/%@/", v12, @"BridgeAssets"];

            id v27 = v7;
            [v4 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v27];
            id v14 = v27;

            id v15 = NSString;
            uint64_t v16 = [v22 path];
            id v17 = [v15 stringWithFormat:@"%@/%@", v16, v9];

            uint64_t v18 = [NSString stringWithFormat:@"%@/%@", v13, v9];
            id v26 = v14;
            [v4 removeItemAtPath:v18 error:&v26];
            id v19 = v26;

            id v25 = v19;
            [v4 createSymbolicLinkAtPath:v18 withDestinationPath:v17 error:&v25];
            id v7 = v25;
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v24);
    }

    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_2);
    id v3 = v20;
  }
}

void __46__PBBridgeAssetsManager__linkDownloadedAsset___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"PBBridgeMobileAssetsChangedNotification" object:0];
}

- (void)purgeAllAssetsLocalOnly:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.BridgeAssets"];
  uint64_t v5 = pbb_mobileasset_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = 342;
    __int16 v7 = 2080;
    uint64_t v8 = "-[PBBridgeAssetsManager purgeAllAssetsLocalOnly:]";
    _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v6, 0x12u);
  }

  [(PBBridgeAssetsManager *)self _runAssetQuery:v4 completion:&__block_literal_global_303];
}

void __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = a2;
  NSLog(&cfstr_DSAssets.isa, 345, "-[PBBridgeAssetsManager purgeAllAssetsLocalOnly:]_block_invoke", v2);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 state] == 4)
        {
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke_2;
          v10[3] = &unk_264401508;
          void v10[4] = v8;
          [v8 cancelDownload:v10];
        }
        else
        {
          v9[0] = MEMORY[0x263EF8330];
          v9[1] = 3221225472;
          v9[2] = __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke_307;
          v9[3] = &unk_264401508;
          v9[4] = v8;
          [v8 purge:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

void __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = pbb_mobileasset_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109890;
    v6[1] = 351;
    __int16 v7 = 2080;
    uint64_t v8 = "-[PBBridgeAssetsManager purgeAllAssetsLocalOnly:]_block_invoke_2";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%d %s CANCEL DOWNLOAD! %@ // %ld", (uint8_t *)v6, 0x26u);
  }
}

void __49__PBBridgeAssetsManager_purgeAllAssetsLocalOnly___block_invoke_307(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = pbb_mobileasset_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109890;
    v6[1] = 355;
    __int16 v7 = 2080;
    uint64_t v8 = "-[PBBridgeAssetsManager purgeAllAssetsLocalOnly:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_21C445000, v4, OS_LOG_TYPE_DEFAULT, "%d %s PURGE ASSET! %@ // %ld", (uint8_t *)v6, 0x26u);
  }
}

- (unint64_t)hardwareGenerationForProductType:(id)a3
{
  return 1;
}

- (id)_assetQueryForBridgeLaunchSplash
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.BridgeAssets"];
  id v3 = [&unk_26CCA15B0 stringValue];
  [v2 addKeyValuePair:@"Asset_Type" with:v3];

  return v2;
}

- (id)_assetQueryForFamilySetupImage
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.BridgeAssets"];
  id v3 = [&unk_26CCA15C8 stringValue];
  [v2 addKeyValuePair:@"Asset_Type" with:v3];

  return v2;
}

- (id)_assetQueryForZeroDayForcedUpdate
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.BridgeAssets"];
  id v3 = [&unk_26CCA15E0 stringValue];
  [v2 addKeyValuePair:@"Asset_Type" with:v3];

  return v2;
}

- (id)_assetQueryForDeviceAttributes:(unint64_t)a3 deviceAttributes:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F55950]) initWithType:@"com.apple.MobileAsset.BridgeAssets"];
  if (a3)
  {
    __int16 v7 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v8 = [v7 stringValue];
    [v6 addKeyValuePair:@"Asset_Type" with:v8];

    if (!v5) {
      goto LABEL_7;
    }
    if (a3 == 1)
    {
      __int16 v9 = NSString;
      uint64_t v10 = [v5 objectForKeyedSubscript:@"Material_Type"];
      __int16 v11 = [v9 stringWithFormat:@"%@", v10];

      [v6 addKeyValuePair:@"Material_Type" with:v11];
    }
  }
  else if (!v5)
  {
    goto LABEL_7;
  }
  uint64_t v12 = NSString;
  uint64_t v13 = [v5 objectForKeyedSubscript:@"HW_Class"];
  long long v14 = [v12 stringWithFormat:@"%@", v13];

  [v6 addKeyValuePair:@"HW_Class" with:v14];
  id v15 = NSString;
  uint64_t v16 = [v5 objectForKeyedSubscript:@"Size_Type"];
  id v17 = [v15 stringWithFormat:@"%@", v16];

  [v6 addKeyValuePair:@"Size_Type" with:v17];
LABEL_7:
  uint64_t v18 = NSNumber;
  id v19 = [MEMORY[0x263F1C920] mainScreen];
  [v19 scale];
  id v20 = objc_msgSend(v18, "numberWithDouble:");
  long long v21 = [v20 stringValue];
  [v6 addKeyValuePair:@"Resolution_Scale" with:v21];

  [v6 addKeyValuePair:@"Version_Number" with:@"1"];
  return v6;
}

- (id)assetDownloadCompletion
{
  return self->_assetDownloadCompletion;
}

- (void)setAssetDownloadCompletion:(id)a3
{
}

- (id)allAssetsDownloadCompletion
{
  return self->_allAssetsDownloadCompletion;
}

- (void)setAllAssetsDownloadCompletion:(id)a3
{
}

- (NSDictionary)deviceAttributes
{
  return self->_deviceAttributes;
}

- (void)setDeviceAttributes:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_deviceAttributes, 0);
  objc_storeStrong(&self->_allAssetsDownloadCompletion, 0);
  objc_storeStrong(&self->_assetDownloadCompletion, 0);
}

void __51__PBBridgeAssetsManager__runAssetQuery_completion___block_invoke_3_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21C445000, a2, OS_LOG_TYPE_ERROR, "Query error with MAQueryResult: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)_downloadAtlasAsset:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __62__PBBridgeAssetsManager__startAtlasDownloadAndQueryOnSuccess___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end