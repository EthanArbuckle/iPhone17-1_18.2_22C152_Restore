@interface PXAssetLocationAction
+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4;
- (NSString)analyticsActionString;
- (NSString)analyticsPlaceLevelString;
- (id)_undoLocationForAsset:(id)a3;
- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4;
- (id)onUnitChange;
- (void)_loadOriginalLocationsIfNeeded;
- (void)_performChangesWithLocationProvider:(id)a3 completionHandler:(id)a4;
- (void)_requestRevGeocoding;
- (void)_sendAnalyticsEvent;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
- (void)setOnUnitChange:(id)a3;
@end

@implementation PXAssetLocationAction

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "canPerformEditOperation:", 3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsPlaceLevelString, 0);
  objc_storeStrong((id *)&self->_analyticsActionString, 0);
  objc_storeStrong(&self->_onUnitChange, 0);
  objc_storeStrong((id *)&self->_originalLocations, 0);
}

- (NSString)analyticsPlaceLevelString
{
  return self->_analyticsPlaceLevelString;
}

- (NSString)analyticsActionString
{
  return self->_analyticsActionString;
}

- (void)setOnUnitChange:(id)a3
{
}

- (id)onUnitChange
{
  return self->_onUnitChange;
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__PXAssetLocationAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DB0D00;
  v3[4] = self;
  [(PXAssetLocationAction *)self _performChangesWithLocationProvider:v3 completionHandler:a3];
}

uint64_t __37__PXAssetLocationAction_performUndo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _undoLocationForAsset:a2];
}

- (void)performAction:(id)a3
{
  id v4 = a3;
  [(PXAssetLocationAction *)self _loadOriginalLocationsIfNeeded];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PXAssetLocationAction_performAction___block_invoke;
  v5[3] = &unk_1E5DB0D00;
  v5[4] = self;
  [(PXAssetLocationAction *)self _performChangesWithLocationProvider:v5 completionHandler:v4];
}

uint64_t __39__PXAssetLocationAction_performAction___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) locationForAsset:a2 shifted:a3];
}

- (void)_performChangesWithLocationProvider:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXAssetLocationAction *)self onUnitChange];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__PXAssetLocationAction__performChangesWithLocationProvider_completionHandler___block_invoke;
  v14[3] = &unk_1E5DCAF58;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PXAssetLocationAction__performChangesWithLocationProvider_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5DD2B90;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  id v11 = v6;
  [(PXPhotosAction *)self performChanges:v14 completionHandler:v12];
}

void __79__PXAssetLocationAction__performChangesWithLocationProvider_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [*(id *)(a1 + 32) assets];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        id v9 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:v7];
        [v9 setLocation:v8];
        uint64_t v10 = *(void *)(a1 + 48);
        if (v10) {
          (*(void (**)(void))(v10 + 16))();
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void __79__PXAssetLocationAction__performChangesWithLocationProvider_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [v4 _requestRevGeocoding];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_sendAnalyticsEvent
{
  v18[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXAssetLocationAction *)self analyticsActionString];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_1F00B0030;
  }
  id v6 = v5;

  uint64_t v7 = [(PXAssetsAction *)self assets];
  uint64_t v8 = [v7 count];
  id v9 = @"n";
  if (v8 == 1) {
    id v9 = @"1";
  }
  uint64_t v10 = v9;

  uint64_t v11 = [(PXAssetLocationAction *)self analyticsPlaceLevelString];
  long long v12 = (void *)v11;
  if (v11) {
    long long v13 = (__CFString *)v11;
  }
  else {
    long long v13 = &stru_1F00B0030;
  }
  long long v14 = v13;

  id v15 = (void *)MEMORY[0x1E4F56658];
  v17[0] = @"action";
  v17[1] = @"count";
  v18[0] = v6;
  v18[1] = v10;
  v17[2] = @"placeLevel";
  v18[2] = v14;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  [v15 sendEvent:@"com.apple.photos.CPAnalytics.places.locationAction" withPayload:v16];
}

- (void)_requestRevGeocoding
{
  uint64_t v3 = [(PXPhotosAction *)self photoLibrary];
  uint64_t v4 = [(PXAssetsAction *)self assets];
  if (_requestRevGeocoding_onceToken != -1) {
    dispatch_once(&_requestRevGeocoding_onceToken, &__block_literal_global_18846);
  }
  id v5 = _requestRevGeocoding_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PXAssetLocationAction__requestRevGeocoding__block_invoke_2;
  v8[3] = &unk_1E5DD32A8;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  dispatch_async(v5, v8);
}

void __45__PXAssetLocationAction__requestRevGeocoding__block_invoke_2()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  PXMap();
}

uint64_t __45__PXAssetLocationAction__requestRevGeocoding__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

void __45__PXAssetLocationAction__requestRevGeocoding__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.IPXAssetLocationAction.revGeoQueue", v2);
  v1 = (void *)_requestRevGeocoding_queue;
  _requestRevGeocoding_queue = (uint64_t)v0;
}

- (id)_undoLocationForAsset:(id)a3
{
  originalLocations = self->_originalLocations;
  uint64_t v4 = [a3 localIdentifier];
  id v5 = [(NSDictionary *)originalLocations objectForKey:v4];

  id v6 = [v5 location];

  return v6;
}

- (void)_loadOriginalLocationsIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_originalLocations)
  {
    v2 = [(PXAssetsAction *)self assets];
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v10 = [v9 location];
          if (v10)
          {
            [v9 fetchPropertySetsIfNeeded];
            uint64_t v11 = [PXPlaceAnnotation alloc];
            long long v12 = [v9 photosInfoPanelLocationProperties];
            long long v13 = [v12 placeAnnotationData];
            long long v14 = [(PXPlaceAnnotation *)v11 initWithData:v13];

            id v15 = [PXAnnotatedLocation alloc];
            uint64_t v16 = [v9 location];
            v17 = [(PXAnnotatedLocation *)v15 initWithLocation:v16 placeAnnotation:v14];

            v18 = [v9 localIdentifier];
            [v3 setObject:v17 forKey:v18];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);
    }

    v19 = (NSDictionary *)[v3 copy];
    originalLocations = self->_originalLocations;
    self->_originalLocations = v19;
  }
}

- (id)locationForAsset:(id)a3 shifted:(BOOL *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXAssetLocationAction.m", 42, @"Method %s is a responsibility of subclass %@", "-[PXAssetLocationAction locationForAsset:shifted:]", v9 object file lineNumber description];

  abort();
}

@end