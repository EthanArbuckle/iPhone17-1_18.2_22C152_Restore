@interface VGChargingNetworkAvailabilityProvider
- (NSArray)otherNetworks;
- (NSArray)suggestedNetworks;
- (VGChargingNetworkAvailabilityProvider)initWithDelegate:(id)a3;
- (void)_localeChanged:(id)a3;
- (void)_reloadNetworks;
- (void)dealloc;
- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3;
@end

@implementation VGChargingNetworkAvailabilityProvider

- (VGChargingNetworkAvailabilityProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VGChargingNetworkAvailabilityProvider;
  v5 = [(VGChargingNetworkAvailabilityProvider *)&v20 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("VGChargingNetworkAvailabilityProvider.WorkQueue", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("VGChargingNetworkAvailabilityProvider.DelegateQueue", v10);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v11;

    v13 = [MEMORY[0x263F08A00] defaultCenter];
    [v13 addObserver:v6 selector:sel__localeChanged_ name:*MEMORY[0x263EFF458] object:0];

    v14 = [MEMORY[0x263F41BD0] modernManager];
    [v14 addTileGroupObserver:v6 queue:v6->_workQueue];

    objc_initWeak(&location, v6);
    v15 = v6->_workQueue;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __58__VGChargingNetworkAvailabilityProvider_initWithDelegate___block_invoke;
    v17[3] = &unk_2642260C8;
    objc_copyWeak(&v18, &location);
    dispatch_async(v15, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __58__VGChargingNetworkAvailabilityProvider_initWithDelegate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _reloadNetworks];
  }
  else
  {
    v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      v5 = "-[VGChargingNetworkAvailabilityProvider initWithDelegate:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 55;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v4, 0x12u);
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F41BD0] modernManager];
  [v3 removeTileGroupObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VGChargingNetworkAvailabilityProvider;
  [(VGChargingNetworkAvailabilityProvider *)&v4 dealloc];
}

- (NSArray)suggestedNetworks
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__VGChargingNetworkAvailabilityProvider_suggestedNetworks__block_invoke;
  v5[3] = &unk_2642260A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __58__VGChargingNetworkAvailabilityProvider_suggestedNetworks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];

  return MEMORY[0x270F9A758]();
}

- (NSArray)otherNetworks
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__VGChargingNetworkAvailabilityProvider_otherNetworks__block_invoke;
  v5[3] = &unk_2642260A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(workQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __54__VGChargingNetworkAvailabilityProvider_otherNetworks__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];

  return MEMORY[0x270F9A758]();
}

- (void)_reloadNetworks
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = VGGetChargingNetworksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_INFO, "Started reloading networks", buf, 2u);
  }

  suggestedNetworks = self->_suggestedNetworks;
  self->_suggestedNetworks = 0;

  otherNetworks = self->_otherNetworks;
  self->_otherNetworks = 0;

  activeCountryCode = self->_activeCountryCode;
  self->_activeCountryCode = 0;

  activeLanguageCode = self->_activeLanguageCode;
  self->_activeLanguageCode = 0;

  uint64_t v8 = GEOConfigGetString();
  v9 = [MEMORY[0x263F41BC0] sharedManager];
  v10 = [v9 dataForResourceWithName:v8 fallbackBundle:0];

  if (v10)
  {
    id v11 = [objc_alloc(MEMORY[0x263F41BE0]) initWithData:v10];
    v12 = v11;
    if (v11)
    {
      v13 = [v11 chargingNetworkInfo];
      if (v13)
      {
        id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
        v45[0] = MEMORY[0x263EF8330];
        v45[1] = 3221225472;
        v45[2] = __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke;
        v45[3] = &unk_264226498;
        v40 = v13;
        v46 = v40;
        v16 = v14;
        v47 = v16;
        id v17 = v15;
        id v48 = v17;
        id v18 = (void (**)(void, void))MEMORY[0x2166AD0C0](v45);
        v42 = [MEMORY[0x263EFF960] currentLocale];
        v19 = [v42 countryCode];
        ((void (**)(void, void *))v18)[2](v18, v19);

        if (!-[NSObject count](v16, "count") && ![v17 count])
        {
          objc_super v20 = VGGetChargingNetworksLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v38 = [v42 countryCode];
            *(_DWORD *)buf = 138412290;
            v50 = v38;
            _os_log_impl(&dword_214A2C000, v20, OS_LOG_TYPE_INFO, "Country code: %@ did not produce any networks, will fallback to using global list.", buf, 0xCu);
          }
          ((void (**)(void, __CFString *))v18)[2](v18, @"global");
        }
        v21 = VGGetChargingNetworksLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = [v16 count];
          v39 = v16;
          v23 = v13;
          v24 = v18;
          uint64_t v25 = v22;
          uint64_t v26 = [v17 count];
          [v40 brandInfoMappings];
          v27 = id v41 = v17;
          uint64_t v28 = [v27 count];
          *(_DWORD *)buf = 134218496;
          v50 = v25;
          id v18 = v24;
          v13 = v23;
          v16 = v39;
          __int16 v51 = 2048;
          uint64_t v52 = v26;
          __int16 v53 = 2048;
          uint64_t v54 = v28;
          _os_log_impl(&dword_214A2C000, v21, OS_LOG_TYPE_INFO, "Created %lu suggested and %lu other networks out of %lu mappings", buf, 0x20u);

          id v17 = v41;
        }

        v29 = [v16 sortedArrayUsingComparator:&__block_literal_global_4];
        v30 = self->_suggestedNetworks;
        self->_suggestedNetworks = v29;

        v31 = [v17 sortedArrayUsingComparator:&__block_literal_global_18];
        v32 = self->_otherNetworks;
        self->_otherNetworks = v31;

        v33 = [v42 countryCode];
        v34 = self->_activeCountryCode;
        self->_activeCountryCode = v33;

        v35 = [v42 languageCode];
        v36 = self->_activeLanguageCode;
        self->_activeLanguageCode = v35;

        objc_initWeak((id *)buf, self);
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke_3;
        block[3] = &unk_2642260C8;
        objc_copyWeak(&v44, (id *)buf);
        dispatch_async(delegateQueue, block);
        objc_destroyWeak(&v44);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v16 = VGGetChargingNetworksLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v12;
          _os_log_impl(&dword_214A2C000, v16, OS_LOG_TYPE_FAULT, "There was no featuresInfo with charging networks info: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v13 = VGGetChargingNetworksLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214A2C000, v13, OS_LOG_TYPE_FAULT, "Failed to parse charging networks pb file", buf, 2u);
      }
    }
  }
  else
  {
    v12 = VGGetChargingNetworksLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v8;
      _os_log_impl(&dword_214A2C000, v12, OS_LOG_TYPE_FAULT, "Failed to load charging networks data with filename: %@", buf, 0xCu);
    }
  }
}

void __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v20 = a1;
  objc_super v4 = [*(id *)(a1 + 32) brandInfoMappings];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v6 = 138412290;
    long long v19 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "isoCountryCodes", v19);
        v12 = [v3 lowercaseString];
        unint64_t v13 = [v11 indexOfObject:v12];

        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v14 = [[VGChargingNetwork alloc] initWithBrandInfoMapping:v10];
          if (v14)
          {
            uint64_t v15 = [v10 isSuggestedsCount];
            if (v15 != [v10 isoCountryCodesCount])
            {
              v16 = VGGetChargingNetworksLog();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v19;
                uint64_t v26 = v10;
                _os_log_impl(&dword_214A2C000, v16, OS_LOG_TYPE_FAULT, "Malformed brandInfoMapping. notify the routing team: %@", buf, 0xCu);
              }
            }
            if (v13 < [v10 isSuggestedsCount] && *(unsigned char *)(objc_msgSend(v10, "isSuggesteds") + v13)) {
              id v17 = *(void **)(v20 + 40);
            }
            else {
              id v17 = *(void **)(v20 + 48);
            }
            [v17 addObject:v14];
          }
          else
          {
            id v18 = VGGetChargingNetworksLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v26 = v10;
              _os_log_impl(&dword_214A2C000, v18, OS_LOG_TYPE_ERROR, "Failed to create a network from brandInfoMapping: %{public}@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }
}

uint64_t __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  long long v6 = [v4 name];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

uint64_t __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 name];
  long long v6 = [v4 name];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

void __56__VGChargingNetworkAvailabilityProvider__reloadNetworks__block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 5);
    [v3 availableNetworksDidChangeForProvider:v2];
  }
  else
  {
    id v3 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      uint64_t v5 = "-[VGChargingNetworkAvailabilityProvider _reloadNetworks]_block_invoke_3";
      __int16 v6 = 1024;
      int v7 = 175;
      _os_log_impl(&dword_214A2C000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v4, 0x12u);
    }
  }
}

- (void)_localeChanged:(id)a3
{
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__VGChargingNetworkAvailabilityProvider__localeChanged___block_invoke;
  v5[3] = &unk_2642260C8;
  objc_copyWeak(&v6, &location);
  dispatch_async(workQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__VGChargingNetworkAvailabilityProvider__localeChanged___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x263EFF960] currentLocale];
    id v3 = (void *)WeakRetained[1];
    int v4 = [v2 countryCode];
    unint64_t v5 = v3;
    unint64_t v6 = v4;
    if (v5 | v6
      && (char v7 = [(id)v5 isEqual:v6], (id)v6, (id)v5, (v7 & 1) == 0))
    {
    }
    else
    {
      uint64_t v8 = (void *)WeakRetained[2];
      v9 = [v2 languageCode];
      unint64_t v10 = v8;
      unint64_t v11 = v9;
      if (!(v10 | v11))
      {

LABEL_9:
        id v14 = VGGetChargingNetworksLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = (const char *)WeakRetained[1];
          v16 = [v2 countryCode];
          uint64_t v17 = WeakRetained[2];
          id v18 = [v2 languageCode];
          int v24 = 138413058;
          uint64_t v25 = v15;
          __int16 v26 = 2112;
          v27 = v16;
          __int16 v28 = 2112;
          uint64_t v29 = v17;
          __int16 v30 = 2112;
          v31 = v18;
          _os_log_impl(&dword_214A2C000, v14, OS_LOG_TYPE_INFO, "_localeChanged:, oldCountryCode: %@, newCountryCode: %@, oldLanguageCode: %@, newLanguageCode: %@ -> will not reload networks", (uint8_t *)&v24, 0x2Au);
        }
        goto LABEL_16;
      }
      v12 = (void *)v11;
      char v13 = [(id)v10 isEqual:v11];

      if (v13) {
        goto LABEL_9;
      }
    }
    long long v19 = VGGetChargingNetworksLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = (const char *)WeakRetained[1];
      long long v21 = [v2 countryCode];
      uint64_t v22 = WeakRetained[2];
      long long v23 = [v2 languageCode];
      int v24 = 138413058;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      v27 = v21;
      __int16 v28 = 2112;
      uint64_t v29 = v22;
      __int16 v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_214A2C000, v19, OS_LOG_TYPE_INFO, "_localeChanged:, oldCountryCode: %@, newCountryCode: %@, oldLanguageCode: %@, newLanguageCode: %@ -> will reload networks", (uint8_t *)&v24, 0x2Au);
    }
    [WeakRetained _reloadNetworks];
  }
  else
  {
    v2 = VGGetVirtualGarageLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315394;
      uint64_t v25 = "-[VGChargingNetworkAvailabilityProvider _localeChanged:]_block_invoke";
      __int16 v26 = 1024;
      LODWORD(v27) = 184;
      _os_log_impl(&dword_214A2C000, v2, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v24, 0x12u);
    }
  }
LABEL_16:
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  int v4 = VGGetChargingNetworksLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_214A2C000, v4, OS_LOG_TYPE_INFO, "resourceManifestManagerDidChangeActiveTileGroup:, will reload networks", v5, 2u);
  }

  [(VGChargingNetworkAvailabilityProvider *)self _reloadNetworks];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherNetworks, 0);
  objc_storeStrong((id *)&self->_suggestedNetworks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_activeLanguageCode, 0);

  objc_storeStrong((id *)&self->_activeCountryCode, 0);
}

@end