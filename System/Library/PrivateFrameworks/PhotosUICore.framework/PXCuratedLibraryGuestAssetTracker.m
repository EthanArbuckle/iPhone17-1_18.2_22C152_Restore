@interface PXCuratedLibraryGuestAssetTracker
- (BOOL)_checkForGuestAssetsVisible;
- (BOOL)_isViewSettled;
- (BOOL)canDisplayGuestAssets;
- (BOOL)isActive;
- (BOOL)isDisplayingGuestAssets;
- (PXCuratedLibraryGuestAssetTracker)initWithViewModel:(id)a3 layout:(id)a4;
- (PXCuratedLibraryGuestAssetTrackerDelegate)delegate;
- (void)_checkForVisibilityUpdates;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCanDisplayGuestAssets:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsDisplayingGuestAssets:(BOOL)a3;
@end

@implementation PXCuratedLibraryGuestAssetTracker

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    if (a3)
    {
      [(PXCuratedLibraryGuestAssetTracker *)self _checkForVisibilityUpdates];
      [(PXCuratedLibraryViewModel *)self->_viewModel registerChangeObserver:self context:CuratedLibraryViewModelObserverContext_180265];
      id v5 = [(PXCuratedLibraryViewModel *)self->_viewModel zoomablePhotosViewModel];
      [v5 registerChangeObserver:self context:operator||];
    }
    else
    {
      [(PXCuratedLibraryViewModel *)self->_viewModel unregisterChangeObserver:self context:CuratedLibraryViewModelObserverContext_180265];
      v4 = [(PXCuratedLibraryViewModel *)self->_viewModel zoomablePhotosViewModel];
      [v4 unregisterChangeObserver:self context:operator||];

      [(PXCuratedLibraryGuestAssetTracker *)self setCanDisplayGuestAssets:0];
      [(PXCuratedLibraryGuestAssetTracker *)self setIsDisplayingGuestAssets:0];
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (PXCuratedLibraryGuestAssetTracker)initWithViewModel:(id)a3 layout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXCuratedLibraryGuestAssetTracker;
  v9 = [(PXCuratedLibraryGuestAssetTracker *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_layout, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (BOOL)isDisplayingGuestAssets
{
  return self->_isDisplayingGuestAssets;
}

- (BOOL)canDisplayGuestAssets
{
  return self->_canDisplayGuestAssets;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (PXCuratedLibraryGuestAssetTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCuratedLibraryGuestAssetTrackerDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)CuratedLibraryViewModelObserverContext_180265 == a5)
  {
    if ((v6 & 0x2800) != 0)
    {
LABEL_4:
      id v11 = v9;
      [(PXCuratedLibraryGuestAssetTracker *)self _checkForVisibilityUpdates];
      id v9 = v11;
    }
  }
  else
  {
    if ((void *)operator|| != a5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryGuestAssetTracker.m" lineNumber:139 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (v6) {
      goto LABEL_4;
    }
  }
}

- (BOOL)_checkForGuestAssetsVisible
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLCuratedLibraryGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = objc_opt_class();
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    id v4 = *(id *)&buf[4];
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Checking for guest assets.", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v10 = 0;
  layout = self->_layout;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PXCuratedLibraryGuestAssetTracker__checkForGuestAssetsVisible__block_invoke;
  v8[3] = &unk_1E5DC25F8;
  v8[4] = buf;
  [(PXCuratedLibraryLayout *)layout enumerateVisibleAssetReferencesUsingBlock:v8];
  BOOL v6 = *(void *)(*(void *)&buf[8] + 24) > 1uLL;
  _Block_object_dispose(buf, 8);
  return v6;
}

void __64__PXCuratedLibraryGuestAssetTracker__checkForGuestAssetsVisible__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 asset];
  if (PXDisplayAssetIsSyndicatedAndUnsaved(v5)) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 2uLL) {
    *a3 = 1;
  }
}

- (BOOL)_isViewSettled
{
  v2 = self->_viewModel;
  if ([(PXCuratedLibraryViewModel *)v2 scrollRegime]
    || [(PXCuratedLibraryViewModel *)v2 zoomLevelTransitionPhase])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v5 = [(PXCuratedLibraryViewModel *)v2 zoomablePhotosViewModel];
    BOOL v6 = v5;
    if (v5)
    {
      [v5 zoomState];
      BOOL v3 = v7 == 0;
    }
    else
    {
      BOOL v3 = 1;
    }
  }
  return v3;
}

- (void)_checkForVisibilityUpdates
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(PXCuratedLibraryGuestAssetTracker *)self isActive])
  {
    BOOL v3 = [(PXCuratedLibraryGuestAssetTracker *)self delegate];

    if (v3)
    {
      id v4 = self->_viewModel;
      uint64_t v5 = [(PXCuratedLibraryViewModel *)v4 zoomLevel];
      BOOL v6 = [(PXCuratedLibraryGuestAssetTracker *)self _isViewSettled];
      char v7 = [(PXCuratedLibraryViewModel *)v4 zoomablePhotosViewModel];
      int v8 = [v7 isDisplayingIndividualItems];

      id v9 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = @"Can NOT";
        if (v5 == 4) {
          uint64_t v11 = @"CAN";
        }
        objc_super v12 = @"is NOT";
        *(_DWORD *)v19 = 138544386;
        *(void *)&v19[4] = v10;
        if (v6) {
          objc_super v12 = @"IS";
        }
        *(_WORD *)&v19[12] = 2048;
        *(void *)&v19[14] = self;
        v20 = v11;
        *(_WORD *)&v19[22] = 2112;
        *(_WORD *)v21 = 2112;
        *(void *)&v21[2] = v12;
        if (v8) {
          v13 = @"YES";
        }
        else {
          v13 = @"NO";
        }
        *(_WORD *)&v21[10] = 2112;
        *(void *)&v21[12] = v13;
        id v14 = v10;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Check for visibility updates. %@ display assets. View %@ settled. Individual Items: %@", v19, 0x34u);
      }
      if ((v6 & v8) == 1)
      {
        -[PXCuratedLibraryGuestAssetTracker setCanDisplayGuestAssets:](self, "setCanDisplayGuestAssets:", v5 == 4, *(_OWORD *)v19, *(void *)&v19[16], v20, *(_OWORD *)v21, *(void *)&v21[16]);
        if ([(PXCuratedLibraryGuestAssetTracker *)self canDisplayGuestAssets])
        {
          BOOL v15 = [(PXCuratedLibraryGuestAssetTracker *)self _checkForGuestAssetsVisible];
          v16 = PLCuratedLibraryGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = objc_opt_class();
            *(_DWORD *)v19 = 138543618;
            *(void *)&v19[4] = v17;
            *(_WORD *)&v19[12] = 2048;
            *(void *)&v19[14] = self;
            id v18 = v17;
            _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Found guest assets.", v19, 0x16u);
          }
        }
        else
        {
          BOOL v15 = 0;
        }
        [(PXCuratedLibraryGuestAssetTracker *)self setIsDisplayingGuestAssets:v15];
      }
    }
  }
}

- (void)setIsDisplayingGuestAssets:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_isDisplayingGuestAssets != a3)
  {
    BOOL v3 = a3;
    self->_isDisplayingGuestAssets = a3;
    uint64_t v5 = [(PXCuratedLibraryGuestAssetTracker *)self delegate];
    [v5 guestAssetsTracker:self isDisplayingGuestAssets:v3];

    BOOL v6 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543874;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2048;
      uint64_t v11 = self;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      id v7 = v9;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> isDisplayingGuestAssets changed: %d", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)setCanDisplayGuestAssets:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_canDisplayGuestAssets != a3)
  {
    BOOL v3 = a3;
    self->_canDisplayGuestAssets = a3;
    uint64_t v5 = [(PXCuratedLibraryGuestAssetTracker *)self delegate];
    [v5 guestAssetsTracker:self canDisplayGuestAssets:v3];

    BOOL v6 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543874;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2048;
      uint64_t v11 = self;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      id v7 = v9;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> canDisplayGuestAssets changed: %d", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

@end