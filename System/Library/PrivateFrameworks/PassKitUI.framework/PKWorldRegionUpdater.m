@interface PKWorldRegionUpdater
- (PKWorldRegionUpdater)initWithSearchService:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_beginReverseGeocodingIfPossible;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)updateCoordinatesForWorldRegionIfNeeded:(id)a3;
@end

@implementation PKWorldRegionUpdater

- (PKWorldRegionUpdater)initWithSearchService:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKWorldRegionUpdater;
  v6 = [(PKWorldRegionUpdater *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchService, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    regionsToGeocode = v7->_regionsToGeocode;
    v7->_regionsToGeocode = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    regionsFailedToGeocode = v7->_regionsFailedToGeocode;
    v7->_regionsFailedToGeocode = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    regionIdentifiersToGeocode = v7->_regionIdentifiersToGeocode;
    v7->_regionIdentifiersToGeocode = v12;

    v7->_lockObservers._os_unfair_lock_opaque = 0;
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(v16, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passkit.worldregionupdater.work", v17);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v18;

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.passkit.worldregionupdater.reply", v17);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v20;
  }
  return v7;
}

- (void)updateCoordinatesForWorldRegionIfNeeded:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKWorldRegionUpdater_updateCoordinatesForWorldRegionIfNeeded___block_invoke;
  v7[3] = &unk_1E59CA870;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __64__PKWorldRegionUpdater_updateCoordinatesForWorldRegionIfNeeded___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 displayRegion];
    if (!CLLocationCoordinate2DIsValid(v7))
    {
      v3 = *(void **)(*(void *)(a1 + 40) + 40);
      id v4 = [*(id *)(a1 + 32) identifier];
      LOBYTE(v3) = [v3 containsObject:v4];

      if ((v3 & 1) == 0)
      {
        id v5 = [*(id *)(a1 + 32) identifier];
        if ((objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "containsObject:") & 1) == 0)
        {
          [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(a1 + 32)];
          [*(id *)(*(void *)(a1 + 40) + 32) addObject:v5];
        }
        [*(id *)(a1 + 40) _beginReverseGeocodingIfPossible];
      }
    }
  }
}

- (void)_beginReverseGeocodingIfPossible
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_currentRegionToGeocode = &self->_currentRegionToGeocode;
  if (!self->_currentRegionToGeocode)
  {
    id v4 = [(NSMutableArray *)self->_regionsToGeocode firstObject];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 identifier];
      objc_storeStrong((id *)p_currentRegionToGeocode, v5);
      CLLocationCoordinate2D v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        dispatch_queue_t v20 = v5;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Updating region %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      id v8 = objc_alloc(MEMORY[0x1E4F30EF0]);
      v9 = [v5 searchString];
      v10 = (void *)[v8 initWithNaturalLanguageQuery:v9];

      v11 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v10];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke;
      v14[3] = &unk_1E59DC378;
      objc_copyWeak(&v18, (id *)buf);
      id v12 = v6;
      id v15 = v12;
      id v13 = v5;
      id v16 = v13;
      v17 = self;
      [v11 startWithCompletionHandler:v14];

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = [v5 mapItems];
    v9 = [v8 firstObject];

    if (v9)
    {
      [v5 boundingRegion];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      id v18 = (void *)WeakRetained[1];
      uint64_t v19 = *(void *)(a1 + 32);
      dispatch_queue_t v20 = [*(id *)(a1 + 40) localizedName];
      uint64_t v21 = [v9 _muid];
      uint64_t v22 = [v9 _resultProviderID];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_2;
      v35[3] = &unk_1E59DC350;
      v35[4] = WeakRetained;
      objc_msgSend(v18, "updateRegionWithIdentifier:localizedName:boundingRegion:mapsIdentifier:providerIdentifier:completion:", v19, v20, v21, v22, v35, v11, v13, v15, v17);
      double v23 = 0.1;
    }
    else
    {
      v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v37 = v25;
        __int16 v38 = 2112;
        id v39 = v6;
        _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "Failed to get response for %@, error: %@", buf, 0x16u);
      }

      double v23 = 10.0;
      if (objc_msgSend(v6, "_mapkit_underlyingGEOError") != -3)
      {
        v26 = (void *)WeakRetained[5];
        v27 = [*(id *)(a1 + 40) identifier];
        [v26 addObject:v27];

        double v23 = 0.1;
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_28;
      v33[3] = &unk_1E59DC328;
      v33[4] = WeakRetained;
      id v34 = *(id *)(a1 + 40);
      [WeakRetained _accessObserversWithHandler:v33];
      dispatch_queue_t v20 = v34;
    }

    dispatch_time_t v28 = dispatch_time(0, (uint64_t)(v23 * 1000000000.0));
    uint64_t v29 = *(void *)(a1 + 48);
    v30 = *(NSObject **)(v29 + 72);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_2_31;
    block[3] = &unk_1E59CA870;
    block[4] = v29;
    id v32 = *(id *)(a1 + 32);
    dispatch_after(v28, v30, block);
  }
}

void __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Updated region %@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_23;
  v7[3] = &unk_1E59DC328;
  void v7[4] = v5;
  id v8 = v3;
  id v6 = v3;
  [v5 _accessObserversWithHandler:v7];
}

void __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 worldRegionUpdated:*(void *)(a1 + 32) updatedRegion:*(void *)(a1 + 40)];
  }
}

void __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 worldRegionUpdated:*(void *)(a1 + 32) failedToUpdateRegion:*(void *)(a1 + 40)];
  }
}

uint64_t __56__PKWorldRegionUpdater__beginReverseGeocodingIfPossible__block_invoke_2_31(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:0];
  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _beginReverseGeocodingIfPossible];
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    id v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_lockObservers);
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_lockObservers = &self->_lockObservers;
    id v5 = a3;
    os_unfair_lock_lock(p_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    id v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__PKWorldRegionUpdater__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E59CAD18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __52__PKWorldRegionUpdater__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentRegionToGeocode, 0);
  objc_storeStrong((id *)&self->_regionsFailedToGeocode, 0);
  objc_storeStrong((id *)&self->_regionIdentifiersToGeocode, 0);
  objc_storeStrong((id *)&self->_regionsToGeocode, 0);

  objc_storeStrong((id *)&self->_searchService, 0);
}

@end