@interface NTKGeocoderManager
+ (id)sharedManager;
- (NTKGeocoderManager)init;
- (id)cachedPlacemarkForLocation:(id)a3;
- (void)_handlePlacemarks:(id)a3 fromLocation:(id)a4 error:(id)a5;
- (void)placemarkForLocation:(id)a3 handler:(id)a4;
@end

@implementation NTKGeocoderManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_53);
  }
  v2 = (void *)sharedManager_manager;

  return v2;
}

void __35__NTKGeocoderManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(NTKGeocoderManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
}

- (NTKGeocoderManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKGeocoderManager;
  v2 = [(NTKGeocoderManager *)&v8 init];
  if (v2)
  {
    v3 = (CLGeocoder *)objc_alloc_init(MEMORY[0x1E4F1E5C8]);
    geocoder = v2->_geocoder;
    v2->_geocoder = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableArray *)v5;
  }
  return v2;
}

- (id)cachedPlacemarkForLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_cachedLocation && self->_cachedPlacemark && objc_msgSend(v4, "isEqual:")) {
    v6 = self->_cachedPlacemark;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)placemarkForLocation:(id)a3 handler:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [(NTKGeocoderManager *)self cachedPlacemarkForLocation:v7];
  if (v9)
  {
    v10 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v7;
      __int16 v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "Hitting cached placemark for location: %@ %@", buf, 0x16u);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__NTKGeocoderManager_placemarkForLocation_handler___block_invoke;
    block[3] = &unk_1E62C0AE8;
    id v26 = v8;
    id v25 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if ([(CLLocation *)self->_cachedLocation isEqual:v7])
  {
    v11 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Requesting the placemark for the same location. %@", buf, 0xCu);
    }

    handlers = self->_handlers;
    v13 = (void *)[v8 copy];
    v14 = _Block_copy(v13);
    [(NSMutableArray *)handlers addObject:v14];
  }
  else
  {
    if ([(CLGeocoder *)self->_geocoder isGeocoding])
    {
      v15 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v7;
        _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_DEFAULT, "Canceling the previous geocode request. %@", buf, 0xCu);
      }

      [(CLGeocoder *)self->_geocoder cancelGeocode];
    }
    objc_storeStrong((id *)&self->_cachedLocation, a3);
    [(NSMutableArray *)self->_handlers removeAllObjects];
    v16 = self->_handlers;
    v17 = (void *)[v8 copy];
    v18 = _Block_copy(v17);
    [(NSMutableArray *)v16 addObject:v18];

    v19 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_1BC5A9000, v19, OS_LOG_TYPE_DEFAULT, "Sending geocode request for location %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    geocoder = self->_geocoder;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __51__NTKGeocoderManager_placemarkForLocation_handler___block_invoke_4;
    v21[3] = &unk_1E62C3A68;
    objc_copyWeak(&v23, (id *)buf);
    id v22 = v7;
    [(CLGeocoder *)geocoder reverseGeocodeLocation:v22 completionHandler:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __51__NTKGeocoderManager_placemarkForLocation_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __51__NTKGeocoderManager_placemarkForLocation_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _handlePlacemarks:v7 fromLocation:*(void *)(a1 + 32) error:v6];
}

- (void)_handlePlacemarks:(id)a3 fromLocation:(id)a4 error:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 code] != 10)
  {
    if (v10)
    {
      v12 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "Reverse geocide with error: %@ %@.", buf, 0x16u);
      }
      v13 = 0;
    }
    else
    {
      v13 = [v8 firstObject];
      if (!v13) {
        goto LABEL_9;
      }
      objc_storeStrong((id *)&self->_cachedPlacemark, v13);
      v12 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v9;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "Updated the cached placemark for location %@-%@.", buf, 0x16u);
      }
    }

LABEL_9:
    v14 = (void *)[(NSMutableArray *)self->_handlers copy];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__NTKGeocoderManager__handlePlacemarks_fromLocation_error___block_invoke;
    block[3] = &unk_1E62C04F0;
    id v17 = v14;
    id v18 = v13;
    id v19 = v10;
    id v15 = v13;
    v11 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
    [(NSMutableArray *)self->_handlers removeAllObjects];

    goto LABEL_10;
  }
  v11 = _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v9;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "Reverse geocode request is cancelled. %@", buf, 0xCu);
  }
LABEL_10:
}

void __59__NTKGeocoderManager__handlePlacemarks_fromLocation_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_locationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_cachedPlacemark, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);

  objc_storeStrong((id *)&self->_geocoder, 0);
}

@end