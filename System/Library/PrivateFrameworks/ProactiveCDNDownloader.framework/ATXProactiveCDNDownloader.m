@interface ATXProactiveCDNDownloader
- (ATXGEOTileDataReaderProtocol)tileDataReader;
- (ATXGEOTileLoaderProtocol)tileLoader;
- (ATXProactiveCDNDownloader)init;
- (ATXProactiveCDNDownloader)initWithTileLoader:(id)a3 tileDataReader:(id)a4;
- (OS_dispatch_queue)queue;
- (id)sha256HashForText:(id)a3;
- (void)_heroDatasForLocation:(id)a3 completion:(id)a4;
- (void)heroDatasForLocation:(id)a3 completion:(id)a4;
- (void)highConfidenceHeroDatasForCurrentLocationWithCompletion:(id)a3;
@end

@implementation ATXProactiveCDNDownloader

- (ATXProactiveCDNDownloader)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXProactiveCDNDownloader *)self initWithTileLoader:v3 tileDataReader:v4];

  return v5;
}

- (ATXProactiveCDNDownloader)initWithTileLoader:(id)a3 tileDataReader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ATXProactiveCDNDownloader;
  v9 = [(ATXProactiveCDNDownloader *)&v23 init];
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = objc_claimAutoreleasedReturnValue();
    v12 = (const char *)[v11 UTF8String];
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create(v12, v13);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_tileLoader, a3);
    objc_storeStrong((id *)&v9->_tileDataReader, a4);
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("_clCallbackQueue", v16);
    clQueue = v9->_clQueue;
    v9->_clQueue = (OS_dispatch_queue *)v17;

    v19 = v9->_clQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__ATXProactiveCDNDownloader_initWithTileLoader_tileDataReader___block_invoke;
    block[3] = &unk_264547E20;
    v22 = v9;
    dispatch_sync(v19, block);
  }
  return v9;
}

uint64_t __63__ATXProactiveCDNDownloader_initWithTileLoader_tileDataReader___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 8) = [objc_alloc(MEMORY[0x263F00A60]) initWithEffectiveBundlePath:@"/System/Library/PrivateFrameworks/CoreParsec.framework" delegate:*(void *)(a1 + 32) onQueue:*(void *)(*(void *)(a1 + 32) + 16)];

  return MEMORY[0x270F9A758]();
}

- (void)heroDatasForLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ATXProactiveCDNDownloader *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__ATXProactiveCDNDownloader_heroDatasForLocation_completion___block_invoke;
  block[3] = &unk_264547E48;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __61__ATXProactiveCDNDownloader_heroDatasForLocation_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _heroDatasForLocation:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)highConfidenceHeroDatasForCurrentLocationWithCompletion:(id)a3
{
  id v4 = a3;
  clQueue = self->_clQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke;
  v7[3] = &unk_264547F30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clQueue, v7);
}

void __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2;
  v4[3] = &unk_264547F08;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 _fetchPlaceInferencesWithFidelityPolicy:0 handler:v4];
}

void __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (!v5)
    {
      v21 = __atxlog_handle_hero();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FF54000, v21, OS_LOG_TYPE_DEFAULT, "No place inference while getting high quality app clip predictions: No inference returned from CLLocationManager", buf, 2u);
      }

      id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_5;
    }
    id v9 = objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global);
    id v10 = [v9 firstObject];

    id v11 = __atxlog_handle_hero();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        id v13 = [v10 preferredName];
        [v10 confidence];
        *(_DWORD *)buf = 138412546;
        v31 = v13;
        __int16 v32 = 2048;
        uint64_t v33 = v14;
        _os_log_impl(&dword_21FF54000, v11, OS_LOG_TYPE_DEFAULT, "Best place Point of Interest name: %@. Confidence score: %f", buf, 0x16u);
      }
      [v10 confidence];
      if (v15 >= 0.5)
      {
        v16 = [v10 placemark];
        dispatch_queue_t v17 = (void *)[v16 copy];

        v18 = [v17 _geoMapItemHandle];
        v19 = v18;
        if (v18)
        {
          if (!*(void *)(*(void *)(a1 + 32) + 24) || !objc_msgSend(v18, "isEqualToData:"))
          {
            v22 = objc_opt_new();
            v27[0] = MEMORY[0x263EF8330];
            v27[1] = 3221225472;
            v27[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_29;
            v27[3] = &unk_264547EE0;
            id v23 = *(id *)(a1 + 40);
            uint64_t v24 = *(void *)(a1 + 32);
            id v29 = v23;
            v27[4] = v24;
            id v28 = v19;
            [v22 resolveMapItemFromHandle:v28 completionHandler:v27];

LABEL_27:
            goto LABEL_28;
          }
          v20 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        }
        else
        {
          v25 = __atxlog_handle_hero();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v26 = [v10 preferredName];
            *(_DWORD *)buf = 138412290;
            v31 = v26;
            _os_log_impl(&dword_21FF54000, v25, OS_LOG_TYPE_DEFAULT, "No place inference while getting high quality app clip predictions: No GEOMapItem data available for best place point of interest with name: %@", buf, 0xCu);
          }
          v20 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
        }
        v20();
        goto LABEL_27;
      }
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FF54000, v11, OS_LOG_TYPE_DEFAULT, "No best place inference while getting high quality app clip predictions: No point of interest identified in place inference", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_28:

    goto LABEL_29;
  }
  id v7 = __atxlog_handle_hero();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_cold_1((uint64_t)v6, v7);
  }

  id v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
  v8();
LABEL_29:
}

BOOL __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_26(uint64_t a1, void *a2)
{
  return [a2 placeType] == 1;
}

void __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_hero();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_cold_1((uint64_t)v6, v7);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = objc_opt_new();
    id v9 = [v5 _quickLinks];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v11 = [v5 _quickLinks];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v35 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if ([v16 type] == 2)
            {
              dispatch_queue_t v17 = [v16 URLString];
              [v8 addObject:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
        }
        while (v13);
      }
    }
    if ([v5 _hasMUID])
    {
      v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "_muid"));
    }
    else
    {
      v18 = 0;
    }
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_32;
    v32[3] = &unk_264547E90;
    v32[4] = *(void *)(a1 + 32);
    id v19 = v18;
    id v33 = v19;
    v20 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v32);
    v21 = [v5 _poiCategory];
    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x263F477D8]);
      id v23 = (void *)[v22 initWithPredictedAdamId:*MEMORY[0x263F47810] bundleId:*MEMORY[0x263F47818] latitude:*MEMORY[0x263F477F8] longitude:*MEMORY[0x263F47800] radiusInMeters:*MEMORY[0x263F477E8] rank:0 isTouristApp:*MEMORY[0x263F477F0] score:*MEMORY[0x263F477F0] urlHash:(double)(unint64_t)*MEMORY[0x263F47808] clipMetadata:0 poiCategory:v21 poiMuid:0];
      uint64_t v24 = [v20 arrayByAddingObject:v23];

      v20 = (void *)v24;
    }
    uint64_t v25 = *(void *)(a1 + 32);
    v26 = *(NSObject **)(v25 + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_35;
    block[3] = &unk_264547EB8;
    void block[4] = v25;
    id v29 = *(id *)(a1 + 40);
    id v30 = v20;
    id v31 = *(id *)(a1 + 48);
    id v27 = v20;
    dispatch_async(v26, block);
  }
}

id __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F477D8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = *MEMORY[0x263F47810];
  uint64_t v7 = *MEMORY[0x263F47818];
  double v8 = *MEMORY[0x263F477F0];
  uint64_t v9 = *MEMORY[0x263F477F8];
  uint64_t v10 = *MEMORY[0x263F47800];
  uint64_t v11 = *MEMORY[0x263F477E8];
  double v12 = (double)(unint64_t)*MEMORY[0x263F47808];
  uint64_t v13 = [*(id *)(a1 + 32) sha256HashForText:v4];

  uint64_t v14 = (void *)[v5 initWithPredictedAdamId:v6 bundleId:v7 latitude:v9 longitude:v10 radiusInMeters:v11 rank:v13 isTouristApp:v8 score:v8 urlHash:v12 clipMetadata:0 poiCategory:0 poiMuid:*(void *)(a1 + 40)];

  return v14;
}

uint64_t __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_35(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 48));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

- (void)_heroDatasForLocation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(ATXProactiveCDNDownloader *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc(MEMORY[0x263F61E70]);
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = (void *)[v9 initWithGuardedData:v10];

  objc_initWeak(&location, self);
  double v12 = [(ATXProactiveCDNDownloader *)self tileLoader];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke;
  v19[3] = &unk_264547FA8;
  id v13 = v7;
  id v22 = v13;
  objc_copyWeak(&v23, &location);
  id v14 = v6;
  id v20 = v14;
  id v15 = v11;
  id v21 = v15;
  [v12 requestGEOTileDataForLocation:v14 tileDataHandler:v19];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_4;
  v17[3] = &unk_264547FD0;
  id v16 = v13;
  id v18 = v16;
  [v15 runWithLockAcquired:v17];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v7 = [WeakRetained tileDataReader];
    double v8 = [v7 appAndClipEntryForTileData:v5];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_2;
    v14[3] = &unk_264547F58;
    id v15 = *(id *)(a1 + 32);
    id v9 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v14);
    uint64_t v10 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_3;
    v12[3] = &unk_264547F80;
    id v13 = v9;
    id v11 = v9;
    [v10 runWithLockAcquired:v12];
  }
}

uint64_t __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 heroDataForLocation:*(void *)(a1 + 32)];
}

uint64_t __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 addObjectsFromArray:*(void *)(a1 + 32)];
}

void __62__ATXProactiveCDNDownloader__heroDatasForLocation_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = __atxlog_handle_hero();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    double v8 = "-[ATXProactiveCDNDownloader _heroDatasForLocation:completion:]_block_invoke_4";
    __int16 v9 = 2048;
    uint64_t v10 = [v3 count];
    _os_log_impl(&dword_21FF54000, v4, OS_LOG_TYPE_DEFAULT, "%s Sending %lu predictions back from GEOTileLoader for location", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = (void *)[v3 copy];
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
}

- (id)sha256HashForText:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = (const char *)[a3 UTF8String];
  CC_LONG v4 = strlen(v3);
  CC_SHA256(v3, v4, md);
  uint64_t v5 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02x", md[i]);

  return v5;
}

- (ATXGEOTileLoaderProtocol)tileLoader
{
  return self->_tileLoader;
}

- (ATXGEOTileDataReaderProtocol)tileDataReader
{
  return self->_tileDataReader;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tileDataReader, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_storeStrong((id *)&self->_previousPreciseHeroDatas, 0);
  objc_storeStrong((id *)&self->_previousItemHandle, 0);
  objc_storeStrong((id *)&self->_clQueue, 0);

  objc_storeStrong((id *)&self->_locManager, 0);
}

void __85__ATXProactiveCDNDownloader_highConfidenceHeroDatasForCurrentLocationWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FF54000, a2, OS_LOG_TYPE_ERROR, "Error while pulling high quality predictions from GeoMapService: %@", (uint8_t *)&v2, 0xCu);
}

@end