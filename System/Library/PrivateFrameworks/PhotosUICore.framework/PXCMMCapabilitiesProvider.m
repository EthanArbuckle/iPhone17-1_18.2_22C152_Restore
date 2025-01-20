@interface PXCMMCapabilitiesProvider
- (PXCMMCapabilitiesProvider)init;
- (PXCMMCapabilitiesProvider)initWithPhotoLibrary:(id)a3;
- (int64_t)capabilities;
- (void)_accountStoreDidChange:(id)a3;
- (void)_handleCapabilities:(int64_t)a3 cplStatus:(id)a4 permanentlyUnavailable:(BOOL)a5;
- (void)_updateCapabilities;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXCMMCapabilitiesProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cplStatus, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (int64_t)capabilities
{
  return self->_capabilities;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = NSStringFromSelector(sel_simulateFeatureFlagState);
  v14 = v6;
  v7 = NSStringFromSelector(sel_simulateCloudState);
  v15 = v7;
  v8 = NSStringFromSelector(sel_simulateCloudPhotosState);
  v16 = v8;
  v9 = NSStringFromSelector(sel_simulateCPLFeatureState);
  v17 = v9;
  v10 = NSStringFromSelector(sel_simulateCPLCMMFeatureState);
  v18 = v10;
  v11 = NSStringFromSelector(sel_simulateSystemPhotoLibraryState);
  v19 = v11;
  v12 = NSStringFromSelector(sel_simulateCloudPhotosExitState);
  v20 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:7];

  LODWORD(v6) = objc_msgSend(v13, "containsObject:", v5, v14, v15, v16, v17, v18, v19);
  if (v6) {
    [(PXCMMCapabilitiesProvider *)self _updateCapabilities];
  }
}

- (void)_accountStoreDidChange:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PXCMMCapabilitiesProvider__accountStoreDidChange___block_invoke;
  v3[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__PXCMMCapabilitiesProvider__accountStoreDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCapabilities];
}

- (void)_updateCapabilities
{
  photoLibrary = self->_photoLibrary;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__PXCMMCapabilitiesProvider__updateCapabilities__block_invoke;
  v3[3] = &unk_1E5DCBC88;
  void v3[4] = self;
  _PXCMMCapabilitiesForPhotoLibrary(photoLibrary, v3);
}

uint64_t __48__PXCMMCapabilitiesProvider__updateCapabilities__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleCapabilities:a2 cplStatus:a3 permanentlyUnavailable:a4];
}

- (void)_handleCapabilities:(int64_t)a3 cplStatus:(id)a4 permanentlyUnavailable:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v9 = (CPLStatus *)a4;
  p_cplStatus = &self->_cplStatus;
  v11 = self->_cplStatus;
  if (v11 == v9)
  {
  }
  else
  {
    v12 = v11;
    char v13 = [(CPLStatus *)v11 isEqual:v9];

    if ((v13 & 1) == 0)
    {
      [(CPLStatus *)*p_cplStatus setDelegate:0];
      objc_storeStrong((id *)&self->_cplStatus, a4);
      [(CPLStatus *)*p_cplStatus setDelegate:self];
    }
  }
  if (v5)
  {
    if (self->_isObserving)
    {
      self->_isObserving = 0;
      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 removeObserver:self name:*MEMORY[0x1E4F8ACE8] object:0];

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(MEMORY[0x1E4F39228], "systemPhotoLibraryURLChangeNotificationName")), 0);
    }
  }
  else if (!self->_isObserving)
  {
    self->_isObserving = 1;
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:self selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F8ACE8] object:0];

    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, self, (CFNotificationCallback)_systemPhotoLibraryURLDidChange_252460, (CFStringRef)objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(MEMORY[0x1E4F39228], "systemPhotoLibraryURLChangeNotificationName")), 0, (CFNotificationSuspensionBehavior)1024);
  }
  if (self->_capabilities != a3)
  {
    v18 = PLUserStatusGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = objc_opt_class();
      if ((unint64_t)a3 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Invalid PXCMMCapabilities: %ld", a3);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = off_1E5DCBCC0[a3];
      }
      *(_DWORD *)buf = 138544642;
      uint64_t v23 = v19;
      __int16 v24 = 2048;
      v25 = self;
      __int16 v26 = 2114;
      v27 = v20;
      __int16 v28 = 2114;
      uint64_t v29 = objc_opt_class();
      __int16 v30 = 2048;
      v31 = v9;
      __int16 v32 = 1024;
      BOOL v33 = v5;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> capabilities: %{public}@, cplStatus: <%{public}@:%p>, permanentlyUnavailable: %d", buf, 0x3Au);
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82__PXCMMCapabilitiesProvider__handleCapabilities_cplStatus_permanentlyUnavailable___block_invoke;
    v21[3] = &unk_1E5DD09C8;
    v21[4] = self;
    v21[5] = a3;
    [(PXCMMCapabilitiesProvider *)self performChanges:v21];
  }
}

uint64_t __82__PXCMMCapabilitiesProvider__handleCapabilities_cplStatus_permanentlyUnavailable___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 104) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) signalChange:1];
}

- (PXCMMCapabilitiesProvider)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXCMMCapabilitiesProvider.m", 181, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PXCMMCapabilitiesProvider;
  v7 = [(PXCMMCapabilitiesProvider *)&v16 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    photoLibrary = v8->_photoLibrary;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__PXCMMCapabilitiesProvider_initWithPhotoLibrary___block_invoke;
    v14[3] = &unk_1E5DCBC88;
    v10 = v8;
    v15 = v10;
    _PXCMMCapabilitiesForPhotoLibrary(photoLibrary, v14);
    v11 = +[PXCompleteMyMomentSettings sharedInstance];
    [v11 addDeferredKeyObserver:v10];
  }
  return v8;
}

uint64_t __50__PXCMMCapabilitiesProvider_initWithPhotoLibrary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleCapabilities:a2 cplStatus:a3 permanentlyUnavailable:a4];
}

- (PXCMMCapabilitiesProvider)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMCapabilitiesProvider.m", 177, @"%s is not available as initializer", "-[PXCMMCapabilitiesProvider init]");

  abort();
}

@end