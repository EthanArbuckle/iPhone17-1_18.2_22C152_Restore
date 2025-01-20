@interface VUIMPDeviceMediaLibrary
+ (BOOL)_isInitialUpdateInProgress;
+ (BOOL)_isUpdateInProgress;
- (BOOL)didFailUpdateCloudLibrary;
- (BOOL)didFailUpdateMPCloudLibrary;
- (BOOL)forceFailToSyncLibrary;
- (BOOL)isInitialUpdateInProgress;
- (BOOL)isUpdating;
- (BOOL)updatingRentalPlaybackStartDates;
- (NSMutableDictionary)rentalPlaybackStartDatesToSave;
- (VUIMPDeviceMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5;
- (VUIMPDeviceMediaLibrary)initWithManager:(id)a3;
- (VUIMPMediaLibrary)mediaLibrary;
- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5;
- (id)_imageLoadParamsForImageLoaderObject:(id)a3;
- (id)_imageLoaderIdentifier;
- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4;
- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3;
- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4;
- (id)title;
- (void)_accountsChanged:(id)a3;
- (void)_handleApplicationDidBecomeActiveNotification:(id)a3;
- (void)_handleApplicationWillResignActiveNotification:(id)a3;
- (void)_handleMediaLibraryIsUpdateInProgressDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setDidFailUpdateMPCloudLibrary:(BOOL)a3;
- (void)setMediaLibrary:(id)a3;
- (void)setRentalPlaybackStartDatesToSave:(id)a3;
- (void)setUpdatingRentalPlaybackStartDates:(BOOL)a3;
- (void)updateFromCloudWithReason:(int64_t)a3;
- (void)updateProgressWithCompletionHandler:(id)a3;
@end

@implementation VUIMPDeviceMediaLibrary

- (void)_handleMediaLibraryIsUpdateInProgressDidChangeNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(VUIMediaLibrary *)self manager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__VUIMPDeviceMediaLibrary__handleMediaLibraryIsUpdateInProgressDidChangeNotification___block_invoke;
  v6[3] = &unk_1E6DF5490;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 _enqueueCompletionQueueBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __53__VUIMPDeviceMediaLibrary_updateFromCloudWithReason___block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = [*(id *)(a1 + 32) forceFailToSyncLibrary];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109376;
    v6[1] = a2;
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1E2BD7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Updating Jalisco Media Library with result %d defaults is %d", (uint8_t *)v6, 0xEu);
  }
  return [*(id *)(a1 + 32) setDidFailUpdateMPCloudLibrary:v4 | a2 ^ 1u];
}

- (void)updateFromCloudWithReason:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = VUISignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v10 = a3;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeviceMediaLibrary.updateFromCloud", "reason:%ld", buf, 0xCu);
  }

  [(VUIMPDeviceMediaLibrary *)self setDidFailUpdateMPCloudLibrary:0];
  v6 = [MEMORY[0x1E4F31890] sharedCloudController];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__VUIMPDeviceMediaLibrary_updateFromCloudWithReason___block_invoke;
  v8[3] = &unk_1E6DF5B20;
  v8[4] = self;
  [v6 updateJaliscoMediaLibraryWithReason:a3 == 1 completionHandler:v8];

  __int16 v7 = VUISignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeviceMediaLibrary.updateFromCloud", "", buf, 2u);
  }
}

- (void)setDidFailUpdateMPCloudLibrary:(BOOL)a3
{
  self->_didFailUpdateMPCloudLibrary = a3;
}

- (BOOL)forceFailToSyncLibrary
{
  if (forceFailToSyncLibrary_onceToken != -1) {
    dispatch_once(&forceFailToSyncLibrary_onceToken, &__block_literal_global_139);
  }
  return forceFailToSyncLibrary_force;
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F31890], "sharedCloudController", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 becomeActive];
}

void __86__VUIMPDeviceMediaLibrary__handleMediaLibraryIsUpdateInProgressDidChangeNotification___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6[0] = @"isUpdating";
    v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_isUpdateInProgress"));
    v7[0] = v2;
    v6[1] = @"isInitialUpdateInProgress";
    id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_isInitialUpdateInProgress"));
    v7[1] = v3;
    int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"VUIDeviceMediaLibraryUpdateStateDidChangeNotification" object:WeakRetained userInfo:v4];
  }
}

+ (BOOL)_isUpdateInProgress
{
  v2 = [MEMORY[0x1E4F31890] sharedCloudController];
  char v3 = [v2 isUpdateInProgress];

  return v3;
}

+ (BOOL)_isInitialUpdateInProgress
{
  v2 = [MEMORY[0x1E4F31890] sharedCloudController];
  char v3 = [v2 isInitialImport];

  return v3;
}

- (VUIMPDeviceMediaLibrary)initWithManager:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F31940];
  id v5 = a3;
  v6 = [v4 defaultMediaLibrary];
  __int16 v7 = [[VUIMPMediaLibrary alloc] initWithMPMediaLibrary:v6 type:0 manager:v5];
  int v8 = [(VUIMediaLibrary *)v7 identifier];
  v20.receiver = self;
  v20.super_class = (Class)VUIMPDeviceMediaLibrary;
  uint64_t v9 = [(VUIMediaLibrary *)&v20 initWithIdentifier:v8 type:[(VUIMediaLibrary *)v7 type] manager:v5];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaLibrary, v7);
    int64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    rentalPlaybackStartDatesToSave = v9->_rentalPlaybackStartDatesToSave;
    v9->_rentalPlaybackStartDatesToSave = v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v13 = *MEMORY[0x1E4F31298];
    v14 = [MEMORY[0x1E4F31890] sharedCloudController];
    [v12 addObserver:v9 selector:sel__handleMediaLibraryIsUpdateInProgressDidChangeNotification_ name:v13 object:v14];

    [v12 addObserver:v9 selector:sel__handleMediaLibraryContentsDidChangeNotification_ name:@"VUIMediaLibraryContentsDidChangeNotification" object:v9->_mediaLibrary];
    uint64_t v15 = *MEMORY[0x1E4FB2628];
    v16 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v12 addObserver:v9 selector:sel__handleApplicationDidBecomeActiveNotification_ name:v15 object:v16];

    uint64_t v17 = *MEMORY[0x1E4FB2738];
    v18 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v12 addObserver:v9 selector:sel__handleApplicationWillResignActiveNotification_ name:v17 object:v18];

    [v12 addObserver:v9 selector:sel__accountsChanged_ name:@"VUIAuthenticationManagerAccountStoreDidChangeNotification" object:0];
  }

  return v9;
}

void __49__VUIMPDeviceMediaLibrary_forceFailToSyncLibrary__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  forceFailToSyncLibrary_force = [v0 BOOLForKey:@"forceFailToSyncLibrary"];
}

- (VUIMPDeviceMediaLibrary)initWithIdentifier:(id)a3 type:(unint64_t)a4 manager:(id)a5
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  int v8 = NSStringFromSelector(a2);
  [v6 raise:v7, @"The %@ initializer is not available.", v8 format];

  return 0;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIMPDeviceMediaLibrary;
  [(VUIMediaLibraryImageLoader *)&v4 dealloc];
}

- (BOOL)isUpdating
{
  v2 = objc_opt_class();
  return [v2 _isUpdateInProgress];
}

- (BOOL)isInitialUpdateInProgress
{
  v2 = objc_opt_class();
  return [v2 _isInitialUpdateInProgress];
}

- (void)updateProgressWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"completionHandler" format];
  }
  objc_super v4 = [MEMORY[0x1E4F31890] sharedCloudController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __63__VUIMPDeviceMediaLibrary_updateProgressWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6DFC1E0;
  id v7 = v3;
  id v5 = v3;
  [v4 loadUpdateProgressWithCompletionHandler:v6];
}

uint64_t __63__VUIMPDeviceMediaLibrary_updateProgressWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)didFailUpdateCloudLibrary
{
  return self->_didFailUpdateMPCloudLibrary;
}

- (id)title
{
  v2 = [(VUIMPDeviceMediaLibrary *)self mediaLibrary];
  id v3 = [v2 title];

  return v3;
}

- (id)enqueueMediaItemEntityTypesFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMPDeviceMediaLibrary *)self mediaLibrary];
  v6 = [v5 enqueueMediaItemEntityTypesFetchWithCompletionHandler:v4];

  return v6;
}

- (id)enqueueFetchRequests:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(VUIMPDeviceMediaLibrary *)self mediaLibrary];
  uint64_t v9 = [v8 enqueueFetchRequests:v7 completionHandler:v6];

  return v9;
}

- (id)saveMediaEntity:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(VUIMPDeviceMediaLibrary *)self mediaLibrary];
  uint64_t v9 = [v8 saveMediaEntity:v7 completionHandler:v6];

  return v9;
}

- (id)_imageLoaderIdentifier
{
  v2 = [(VUIMPDeviceMediaLibrary *)self mediaLibrary];
  id v3 = [v2 _imageLoaderIdentifier];

  return v3;
}

- (id)_imageLoadParamsForImageLoaderObject:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMPDeviceMediaLibrary *)self mediaLibrary];
  id v6 = [v5 _imageLoadParamsForImageLoaderObject:v4];

  return v6;
}

- (id)_imageLoadOperationWithParams:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  int64_t v10 = [(VUIMPDeviceMediaLibrary *)self mediaLibrary];
  uint64_t v11 = objc_msgSend(v10, "_imageLoadOperationWithParams:scaleToSize:cropToFit:", v9, v5, width, height);

  return v11;
}

- (void)_handleApplicationWillResignActiveNotification:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F31890], "sharedCloudController", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 resignActive];
}

- (void)_accountsChanged:(id)a3
{
}

- (VUIMPMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (NSMutableDictionary)rentalPlaybackStartDatesToSave
{
  return self->_rentalPlaybackStartDatesToSave;
}

- (void)setRentalPlaybackStartDatesToSave:(id)a3
{
}

- (BOOL)updatingRentalPlaybackStartDates
{
  return self->_updatingRentalPlaybackStartDates;
}

- (void)setUpdatingRentalPlaybackStartDates:(BOOL)a3
{
  self->_updatingRentalPlaybackStartDates = a3;
}

- (BOOL)didFailUpdateMPCloudLibrary
{
  return self->_didFailUpdateMPCloudLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentalPlaybackStartDatesToSave, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end