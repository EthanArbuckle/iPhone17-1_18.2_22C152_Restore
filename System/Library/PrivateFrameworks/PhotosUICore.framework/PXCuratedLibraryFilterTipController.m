@interface PXCuratedLibraryFilterTipController
- (BOOL)_shouldShowFilterTip:(id)a3;
- (BOOL)curatedLibraryIsVisible;
- (BOOL)isPresentingTipView;
- (CGRect)_anchorViewRect;
- (OS_dispatch_queue)tipKitAPIQueue;
- (PXCuratedLibraryFilterTipController)initWithViewModel:(id)a3 layout:(id)a4;
- (PXCuratedLibraryFilterTipControllerDelegate)delegate;
- (PXCuratedLibraryGuestAssetTracker)guestAssetTracker;
- (UITraitCollection)traitCollection;
- (id)presentationControllerForTipID:(id)a3;
- (id)sourceItemForTipID:(id)a3;
- (void)_cancelTimerForSharedLibraryTip;
- (void)_dismissTipViewWithCompletion:(id)a3 clientInitiated:(BOOL)a4;
- (void)_presentSharedLibraryFilterTipIfPossible;
- (void)_presentTipViewController:(id)a3;
- (void)_startTimerForSharedLibraryFilterTip;
- (void)_updateControllerForSyndicatedAssetsTip;
- (void)didChangeFilterState:(id)a3;
- (void)didLayoutAnchorView;
- (void)dismissTipViewWithCompletion:(id)a3;
- (void)guestAssetsTracker:(id)a3 canDisplayGuestAssets:(BOOL)a4;
- (void)guestAssetsTracker:(id)a3 isDisplayingGuestAssets:(BOOL)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareTipPopover:(id)a3 tipID:(id)a4;
- (void)setCuratedLibraryIsVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)tipPopoverDidDismissWithTipID:(id)a3;
- (void)userDidChangeLibraryFilterState;
@end

@implementation PXCuratedLibraryFilterTipController

- (void)setCuratedLibraryIsVisible:(BOOL)a3
{
  if (self->_curatedLibraryIsVisible != a3)
  {
    self->_curatedLibraryIsVisible = a3;
    [(PXCuratedLibraryFilterTipController *)self _updateControllerForSyndicatedAssetsTip];
    if (self->_curatedLibraryIsVisible)
    {
      [(PXCuratedLibraryFilterTipController *)self _startTimerForSharedLibraryFilterTip];
    }
    else
    {
      v4 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
      +[PXGridTipsHelper setTip:v4 isPresentable:0];

      [(PXCuratedLibraryFilterTipController *)self _cancelTimerForSharedLibraryTip];
    }
  }
}

- (void)_startTimerForSharedLibraryFilterTip
{
  if ([(PXCuratedLibraryFilterTipController *)self curatedLibraryIsVisible]
    && !self->_hasScheduledSharedLibraryFilterTip)
  {
    v3 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
    BOOL v4 = +[PXTipsHelper isTipInvalidated:v3];

    if (!v4)
    {
      [(PXCuratedLibraryFilterTipController *)self performSelector:sel__presentSharedLibraryFilterTipIfPossible withObject:0 afterDelay:7.0];
      self->_hasScheduledSharedLibraryFilterTip = 1;
    }
  }
}

- (void)_updateControllerForSyndicatedAssetsTip
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = +[PXContentSyndicationConfigurationProvider sharedInstance];
  int v4 = [v3 showUnsavedSyndicatedContentInPhotosGrids];

  if ([(PXCuratedLibraryFilterTipController *)self curatedLibraryIsVisible] && v4)
  {
    v5 = +[PXGridTipsHelper syndicatedAssetsTipID];
    [(PXCuratedLibraryFilterTipController *)self _presentTipViewController:v5];

    v6 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 138543618;
      *(void *)&v15[4] = objc_opt_class();
      *(_WORD *)&v15[12] = 2048;
      *(void *)&v15[14] = self;
      id v7 = *(id *)&v15[4];
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Start tracking guest assets.", v15, 0x16u);
    }
    v8 = [(PXCuratedLibraryFilterTipController *)self guestAssetTracker];
    [v8 setIsActive:1];
  }
  else
  {
    v9 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v15 = 138543618;
      *(void *)&v15[4] = objc_opt_class();
      *(_WORD *)&v15[12] = 2048;
      *(void *)&v15[14] = self;
      id v10 = *(id *)&v15[4];
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Stop tracking guest assets.", v15, 0x16u);
    }
    v11 = [(PXCuratedLibraryFilterTipController *)self guestAssetTracker];
    [v11 setIsActive:0];

    if ([(PXCuratedLibraryFilterTipController *)self isPresentingTipView])
    {
      v12 = PLUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_opt_class();
        *(_DWORD *)v15 = 138543618;
        *(void *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2048;
        *(void *)&v15[14] = self;
        id v14 = v13;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Tip view presented while conditions for presentation are not met", v15, 0x16u);
      }
      [(PXCuratedLibraryFilterTipController *)self _dismissTipViewWithCompletion:0 clientInitiated:0];
    }
    v8 = +[PXGridTipsHelper syndicatedAssetsTipID];
    +[PXGridTipsHelper setTip:v8 isPresentable:0];
  }
}

- (BOOL)curatedLibraryIsVisible
{
  return self->_curatedLibraryIsVisible;
}

- (PXCuratedLibraryGuestAssetTracker)guestAssetTracker
{
  return self->_guestAssetTracker;
}

- (void)setTraitCollection:(id)a3
{
  int v4 = (UITraitCollection *)a3;
  if (self->_presentedTipID)
  {
    UIUserInterfaceSizeClass v5 = [(UITraitCollection *)self->_traitCollection verticalSizeClass];
    if (v5 != [(UITraitCollection *)v4 verticalSizeClass]
      && [(UITraitCollection *)v4 verticalSizeClass] == UIUserInterfaceSizeClassCompact)
    {
      +[PXGridTipsHelper setTip:self->_presentedTipID isPresentable:0];
    }
  }
  traitCollection = self->_traitCollection;
  self->_traitCollection = v4;
}

- (void)didLayoutAnchorView
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(PXCuratedLibraryFilterTipController *)self isPresentingTipView])
  {
    [(PXCuratedLibraryFilterTipController *)self _anchorViewRect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = PLCuratedLibraryGetLog();
    v12 = v11;
    if (v10 == 0.0 && v8 == 0.0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543618;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2048;
        v20 = self;
        id v13 = v18;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Obtained anchor rect with size zero", (uint8_t *)&v17, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v14 = objc_opt_class();
        id v15 = v14;
        v24.origin.x = v4;
        v24.origin.y = v6;
        v24.size.width = v8;
        v24.size.height = v10;
        uint64_t v16 = NSStringFromCGRect(v24);
        int v17 = 138543874;
        id v18 = v14;
        __int16 v19 = 2048;
        v20 = self;
        __int16 v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Set new anchor rect: %@", (uint8_t *)&v17, 0x20u);
      }
      if (self->_presentedTipID) {
        +[PXGridTipsHelper updatePopoverTip:sourceRect:](PXGridTipsHelper, "updatePopoverTip:sourceRect:", v4, v6, v8, v10);
      }
    }
  }
}

- (BOOL)isPresentingTipView
{
  return self->_presentedTipID != 0;
}

- (PXCuratedLibraryFilterTipController)initWithViewModel:(id)a3 layout:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXCuratedLibraryFilterTipController;
  double v8 = [(PXCuratedLibraryFilterTipController *)&v17 init];
  if (v8)
  {
    double v9 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      double v10 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v10;
      __int16 v20 = 2048;
      __int16 v21 = v8;
      id v11 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "<%{public}@:%p> Init controller.", buf, 0x16u);
    }
    uint64_t v12 = [v6 photoLibrary];
    photoLibrary = v8->_photoLibrary;
    v8->_photoLibrary = (PHPhotoLibrary *)v12;

    id v14 = [[PXCuratedLibraryGuestAssetTracker alloc] initWithViewModel:v6 layout:v7];
    guestAssetTracker = v8->_guestAssetTracker;
    v8->_guestAssetTracker = v14;

    [(PXCuratedLibraryGuestAssetTracker *)v8->_guestAssetTracker setDelegate:v8];
    px_dispatch_queue_create_serial();
  }

  return 0;
}

- (void)setDelegate:(id)a3
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_184534 != a5)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryFilterTipController.m" lineNumber:331 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 3) != 0)
  {
    id v14 = v9;
    if ([(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider hasSharedLibraryOrPreview])
    {
      [(PXCuratedLibraryFilterTipController *)self _startTimerForSharedLibraryFilterTip];
    }
    else
    {
      presentedTipID = self->_presentedTipID;
      id v11 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
      LODWORD(presentedTipID) = [(NSString *)presentedTipID isEqualToString:v11];

      if (presentedTipID) {
        [(PXCuratedLibraryFilterTipController *)self _dismissTipViewWithCompletion:0 clientInitiated:0];
      }
      uint64_t v12 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
      +[PXGridTipsHelper setTip:v12 isPresentable:0];
    }
    id v9 = v14;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipKitAPIQueue, 0);
  objc_storeStrong((id *)&self->_guestAssetTracker, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_tipDismissedCompletion, 0);
  objc_storeStrong((id *)&self->_presentedTipID, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (OS_dispatch_queue)tipKitAPIQueue
{
  return self->_tipKitAPIQueue;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (PXCuratedLibraryFilterTipControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCuratedLibraryFilterTipControllerDelegate *)WeakRetained;
}

- (void)guestAssetsTracker:(id)a3 isDisplayingGuestAssets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v6 = PLCuratedLibraryGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    double v8 = @"not";
    int v11 = 138543874;
    uint64_t v12 = v7;
    if (v4) {
      double v8 = &stru_1F00B0030;
    }
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    id v9 = v7;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Invalidate TPKClientContex: Tracker is%@displaying guest assets", (uint8_t *)&v11, 0x20u);
  }
  presentedTipID = self->_presentedTipID;
  if (presentedTipID) {
    +[PXGridTipsHelper setTip:presentedTipID isPresentable:0];
  }
}

- (void)guestAssetsTracker:(id)a3 canDisplayGuestAssets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v6 = PLCuratedLibraryGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    double v8 = @"not";
    int v11 = 138543874;
    uint64_t v12 = v7;
    if (v4) {
      double v8 = &stru_1F00B0030;
    }
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    id v9 = v7;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Invalidate TPKClientContex: Tracker can%@displaying guest assets", (uint8_t *)&v11, 0x20u);
  }
  presentedTipID = self->_presentedTipID;
  if (presentedTipID) {
    +[PXGridTipsHelper setTip:presentedTipID isPresentable:0];
  }
}

- (void)_presentSharedLibraryFilterTipIfPossible
{
  self->_hasScheduledSharedLibraryFilterTip = 0;
  double v3 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
  BOOL v4 = [(PXCuratedLibraryFilterTipController *)self _shouldShowFilterTip:v3];

  if (v4)
  {
    id v5 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
    [(PXCuratedLibraryFilterTipController *)self _presentTipViewController:v5];
  }
}

- (void)_cancelTimerForSharedLibraryTip
{
  if (self->_hasScheduledSharedLibraryFilterTip)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__presentSharedLibraryFilterTipIfPossible object:0];
    self->_hasScheduledSharedLibraryFilterTip = 0;
  }
}

- (BOOL)_shouldShowFilterTip:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  UIUserInterfaceSizeClass v5 = [(UITraitCollection *)self->_traitCollection verticalSizeClass];
  char v6 = [(PXCuratedLibraryFilterTipController *)self delegate];
  id v7 = [v6 viewControllerToPresentTipForController:self];
  double v8 = [v7 presentedViewController];

  int v9 = 0;
  if ([(PXCuratedLibraryFilterTipController *)self curatedLibraryIsVisible]
    && !v8
    && v5 != UIUserInterfaceSizeClassCompact)
  {
    double v10 = +[PXGridTipsHelper syndicatedAssetsTipID];
    int v11 = [v4 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = [(PXCuratedLibraryFilterTipController *)self guestAssetTracker];
      int v13 = [v12 canDisplayGuestAssets];

      id v14 = [(PXCuratedLibraryFilterTipController *)self guestAssetTracker];
      int v15 = [v14 isDisplayingGuestAssets];

      uint64_t v16 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 138544386;
        uint64_t v27 = objc_opt_class();
        __int16 v28 = 2048;
        v29 = self;
        __int16 v30 = 2112;
        id v31 = v4;
        __int16 v32 = 1024;
        *(_DWORD *)v33 = v13;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v15;
        _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> _shouldShowFilterTip %@? canDisplayGuestAssets: %d, isDisplayingGuestAssets: %d", (uint8_t *)&v26, 0x2Cu);
      }

      int v9 = v13 & v15;
    }
    else
    {
      uint64_t v17 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
      int v18 = [v4 isEqualToString:v17];

      if (v18)
      {
        int v9 = [(PXSharedLibraryStatusProvider *)self->_sharedLibraryStatusProvider hasSharedLibraryOrPreview];
        __int16 v19 = PLCuratedLibraryGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138544130;
          uint64_t v27 = objc_opt_class();
          __int16 v28 = 2048;
          v29 = self;
          __int16 v30 = 2112;
          id v31 = v4;
          __int16 v32 = 1024;
          *(_DWORD *)v33 = v9;
          _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> _shouldShowFilterTip %@? hasSharedLibraryOrPreview: %d", (uint8_t *)&v26, 0x26u);
        }
      }
      else
      {
        int v9 = 1;
      }
    }
  }
  __int16 v20 = PLCuratedLibraryGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v21 = v8 != 0;
    BOOL v22 = v5 == UIUserInterfaceSizeClassCompact;
    uint64_t v23 = objc_opt_class();
    int v26 = 138544642;
    CGRect v24 = @"NO";
    uint64_t v27 = v23;
    __int16 v28 = 2048;
    if (v9) {
      CGRect v24 = @"YES";
    }
    v29 = self;
    __int16 v30 = 2112;
    id v31 = v4;
    __int16 v32 = 2112;
    *(void *)v33 = v24;
    *(_WORD *)&v33[8] = 1024;
    BOOL v34 = v22;
    __int16 v35 = 1024;
    BOOL v36 = v21;
    _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> _shouldShowFilterTip %@? %@. isCompactVerticalClass: %d, isPresentingViewController: %d", (uint8_t *)&v26, 0x36u);
  }

  return v9;
}

- (CGRect)_anchorViewRect
{
  id v4 = [(PXCuratedLibraryFilterTipController *)self delegate];
  UIUserInterfaceSizeClass v5 = [(PXCuratedLibraryFilterTipController *)self delegate];

  if (!v5)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXCuratedLibraryFilterTipController.m", 241, @"Invalid parameter not satisfying: %@", @"self.delegate" object file lineNumber description];
  }
  [v4 anchorViewRectForController:self];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(PXCuratedLibraryFilterTipController *)self traitCollection];
  if ([v14 horizontalSizeClass] == 1) {
    double v15 = 16.0;
  }
  else {
    double v15 = 0.0;
  }

  double v16 = v7;
  double v17 = v9 + v15;
  double v18 = v11;
  double v19 = v13;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_dismissTipViewWithCompletion:(id)a3 clientInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v6 = (void (**)(void))a3;
  double v7 = v6;
  if (self->_presentedTipID)
  {
    double v8 = _Block_copy(v6);
    id tipDismissedCompletion = self->_tipDismissedCompletion;
    self->_id tipDismissedCompletion = v8;

    +[PXGridTipsHelper setTip:self->_presentedTipID isPresentable:0];
    double v10 = PLCuratedLibraryGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = objc_opt_class();
      double v12 = @"controller signal";
      int v16 = 138543874;
      id v17 = v11;
      if (v4) {
        double v12 = @"client";
      }
      __int16 v18 = 2048;
      double v19 = self;
      __int16 v20 = 2112;
      BOOL v21 = v12;
      id v13 = v11;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Dismissed tip view %@ initiated", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    id v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543618;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2048;
      double v19 = self;
      id v15 = v17;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Attempted to dismiss tip view but view wasn't presented", (uint8_t *)&v16, 0x16u);
    }
    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)tipPopoverDidDismissWithTipID:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didDismissTipForController:self];

  presentedTipID = self->_presentedTipID;
  self->_presentedTipID = 0;

  id tipDismissedCompletion = (void (**)(void))self->_tipDismissedCompletion;
  if (tipDismissedCompletion)
  {
    tipDismissedCompletion[2]();
    id v7 = self->_tipDismissedCompletion;
    self->_id tipDismissedCompletion = 0;
  }
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  double v10 = [(PXCuratedLibraryFilterTipController *)self delegate];

  if (!v10)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXCuratedLibraryFilterTipController.m", 198, @"Invalid parameter not satisfying: %@", @"self.delegate" object file lineNumber description];
  }
  double v11 = [(PXCuratedLibraryFilterTipController *)self delegate];
  double v12 = [v11 viewToPresentTipForController:self];
  if (!v12)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXCuratedLibraryFilterTipController.m", 202, @"Invalid parameter not satisfying: %@", @"view" object file lineNumber description];
  }
  [v9 setSourceView:v12];
  [(PXCuratedLibraryFilterTipController *)self _anchorViewRect];
  objc_msgSend(v9, "setSourceRect:");
  id v13 = [v11 passthroughViewsForTipForController:self];
  [v9 setPassthroughViews:v13];

  [v9 setPermittedArrowDirections:3];
  [v11 willPresentTipForController:self];
  objc_storeStrong((id *)&self->_presentedTipID, a4);
  id v14 = PLCuratedLibraryGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2048;
    BOOL v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    id v15 = v19;
    _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Presented tip with ID %@.", buf, 0x20u);
  }
}

- (id)sourceItemForTipID:(id)a3
{
  BOOL v4 = [(PXCuratedLibraryFilterTipController *)self delegate];
  UIUserInterfaceSizeClass v5 = [v4 viewToPresentTipForController:self];

  return v5;
}

- (id)presentationControllerForTipID:(id)a3
{
  id v5 = a3;
  double v6 = +[PXGridTipsHelper syndicatedAssetsTipID];
  if ([v5 isEqualToString:v6])
  {
  }
  else
  {
    id v7 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
    int v8 = [v5 isEqualToString:v7];

    if (!v8)
    {
      double v11 = 0;
      goto LABEL_10;
    }
  }
  id v9 = [(PXCuratedLibraryFilterTipController *)self delegate];

  if (!v9)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXCuratedLibraryFilterTipController.m", 182, @"Invalid parameter not satisfying: %@", @"self.delegate" object file lineNumber description];
  }
  double v10 = [(PXCuratedLibraryFilterTipController *)self delegate];
  double v11 = [v10 viewControllerToPresentTipForController:self];
  if (!v11)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXCuratedLibraryFilterTipController.m", 186, @"Invalid parameter not satisfying: %@", @"presentationViewController" object file lineNumber description];
  }
LABEL_10:

  return v11;
}

- (void)_presentTipViewController:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
  if ([v4 isEqualToString:v5])
  {
    BOOL v6 = [(PXCuratedLibraryFilterTipController *)self curatedLibraryIsVisible];

    if (!v6)
    {
      id v7 = PLUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543618;
        id v15 = (id)objc_opt_class();
        __int16 v16 = 2048;
        id v17 = self;
        id v8 = v15;
        id v9 = "<%{public}@:%p> Attempted to present tip view but host view controller can't present";
LABEL_16:
        double v12 = v7;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  else
  {
  }
  if ([(PXCuratedLibraryFilterTipController *)self isPresentingTipView])
  {
    id v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543618;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2048;
      id v17 = self;
      id v8 = v15;
      id v9 = "<%{public}@:%p> Attempring to present tip view but there is one already presented";
      goto LABEL_16;
    }
  }
  else
  {
    [(PXCuratedLibraryFilterTipController *)self _anchorViewRect];
    if (v11 == 0.0 || v10 == 0.0)
    {
      id v7 = PLUIGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543618;
        id v15 = (id)objc_opt_class();
        __int16 v16 = 2048;
        id v17 = self;
        id v8 = v15;
        id v9 = "<%{public}@:%p> Obtained anchor rect with size zero.";
        goto LABEL_16;
      }
    }
    else
    {
      if (!+[PXTipsHelper isTipInvalidated:v4])
      {
        +[PXGridTipsHelper setTip:v4 isPresentable:1];
        goto LABEL_19;
      }
      id v7 = PLCuratedLibraryGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543618;
        id v15 = (id)objc_opt_class();
        __int16 v16 = 2048;
        id v17 = self;
        id v8 = v15;
        id v9 = "<%{public}@:%p> Not presenting tip.";
        double v12 = v7;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
LABEL_17:
        _os_log_impl(&dword_1A9AE7000, v12, v13, v9, (uint8_t *)&v14, 0x16u);
      }
    }
  }
LABEL_18:

LABEL_19:
}

- (void)dismissTipViewWithCompletion:(id)a3
{
}

- (void)userDidChangeLibraryFilterState
{
  id v2 = +[PXGridTipsHelper curatedLibrarySwitchTipID];
  +[PXGridTipsHelper setTipActionPerformed:v2];
}

- (void)didChangeFilterState:(id)a3
{
  if ([a3 includeSharedWithYou])
  {
    id v3 = +[PXGridTipsHelper syndicatedAssetsTipID];
    +[PXGridTipsHelper setTipActionPerformed:v3];
  }
}

@end