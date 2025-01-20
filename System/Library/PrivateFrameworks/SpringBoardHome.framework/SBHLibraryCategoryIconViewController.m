@interface SBHLibraryCategoryIconViewController
- (BOOL)_canBeLocked;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isEditing;
- (BOOL)isLocked;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)needsBackgroundBlur;
- (BOOL)showsSquareCorners;
- (CGRect)visibleBounds;
- (NSString)location;
- (SBFolder)folder;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (SBHLibraryCategory)category;
- (SBIconImageInfo)iconImageInfo;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconListView)iconListView;
- (SBIconViewProviding)iconViewProvider;
- (UIView)backgroundView;
- (_UILegibilitySettings)legibilitySettings;
- (double)continuousCornerRadius;
- (id)_createLockedView;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)presentedIconLocations;
- (unint64_t)contentVisibility;
- (void)_handleTapOnLockedView:(id)a3;
- (void)_setLockedIfPossible:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateBackgroundBlurIfNeeded;
- (void)_updateLockedViewForLocked:(BOOL)a3 animated:(BOOL)a4;
- (void)categoryDidUpdate:(id)a3;
- (void)categoryWillUpdate:(id)a3;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)folder:(id)a3 didAddList:(id)a4;
- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFolderIconImageCache:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setNeedsBackgroundBlur:(BOOL)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)updateCategory:(id)a3 location:(id)a4;
- (void)updateFolder:(id)a3 location:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SBHLibraryCategoryIconViewController

uint64_t __78__SBHLibraryCategoryIconViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v6 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6) {
    *a4 = 1;
  }
  return result;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  iconListView = self->_iconListView;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SBHLibraryCategoryIconViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E6AACE80;
  id v8 = v4;
  id v6 = v4;
  [(SBIconListView *)iconListView enumerateIconViewsUsingBlock:v7];
}

- (void)viewDidLoad
{
  v35.receiver = self;
  v35.super_class = (Class)SBHLibraryCategoryIconViewController;
  [(SBHLibraryCategoryIconViewController *)&v35 viewDidLoad];
  v3 = [(SBHLibraryCategoryIconViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SBHLibraryCategoryIconViewController *)self folder];
  uint64_t v13 = [(SBHLibraryCategoryIconViewController *)self location];
  v14 = (void *)v13;
  v15 = @"SBIconLocationAppLibraryCategoryPod";
  if (v13) {
    v15 = (__CFString *)v13;
  }
  v16 = v15;

  iconListView = self->_iconListView;
  if (!iconListView)
  {
    v18 = [SBHLibraryCategoryPodIconListView alloc];
    v19 = [v12 listAtIndex:0];
    v20 = [(SBHLibraryCategoryIconViewController *)self listLayoutProvider];
    v21 = [(SBHLibraryCategoryIconViewController *)self iconViewProvider];
    v22 = [(SBIconListView *)v18 initWithModel:v19 layoutProvider:v20 iconLocation:v16 orientation:1 iconViewProvider:v21];
    v23 = self->_iconListView;
    self->_iconListView = v22;

    v24 = self->_iconListView;
    v25 = [(SBHLibraryCategoryIconViewController *)self iconImageCache];
    [(SBIconListView *)v24 setIconImageCache:v25];

    v26 = self->_iconListView;
    v27 = [(SBHLibraryCategoryIconViewController *)self folderIconImageCache];
    [(SBIconListView *)v26 setFolderIconImageCache:v27];

    v28 = self->_iconListView;
    v29 = [(SBHLibraryCategoryIconViewController *)self overrideIconImageAppearance];
    [(SBIconListView *)v28 setOverrideIconImageAppearance:v29];

    [(SBIconListView *)self->_iconListView setIconViewConfigurationOptions:2];
    [(SBIconListView *)self->_iconListView setEditing:[(SBHLibraryCategoryIconViewController *)self isEditing]];
    [(SBIconListView *)self->_iconListView setAutoresizingMask:18];
    v30 = [(SBHLibraryCategoryIconViewController *)self view];
    [v30 addSubview:self->_iconListView];

    iconListView = self->_iconListView;
  }
  -[SBIconListView setFrame:](iconListView, "setFrame:", v5, v7, v9, v11);
  backgroundView = self->_backgroundView;
  if (!backgroundView)
  {
    v32 = objc_alloc_init(SBHLibraryCategoryPodBackgroundView);
    v33 = self->_backgroundView;
    self->_backgroundView = v32;

    [(SBHLibraryCategoryPodBackgroundView *)self->_backgroundView setAutoresizingMask:18];
    v34 = [(SBHLibraryCategoryIconViewController *)self view];
    [v34 insertSubview:self->_backgroundView belowSubview:self->_iconListView];

    backgroundView = self->_backgroundView;
  }
  -[SBHLibraryCategoryPodBackgroundView setFrame:](backgroundView, "setFrame:", v5, v7, v9, v11);
  [(SBHLibraryCategoryIconViewController *)self _setLockedIfPossible:1 animated:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryCategoryIconViewController;
  [(SBHLibraryCategoryIconViewController *)&v4 viewWillAppear:a3];
  [(SBHLibraryCategoryIconViewController *)self _setLockedIfPossible:1 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryCategoryIconViewController;
  [(SBHLibraryCategoryIconViewController *)&v4 viewDidDisappear:a3];
  [(SBHLibraryCategoryIconViewController *)self _setLockedIfPossible:1 animated:0];
}

- (void)_updateBackgroundBlurIfNeeded
{
  if (self->_backgroundBlurView)
  {
LABEL_2:
    if (![(SBHLibraryCategoryIconViewController *)self needsBackgroundBlur])
    {
      [(MTMaterialView *)self->_backgroundBlurView removeFromSuperview];
      backgroundBlurView = self->_backgroundBlurView;
      self->_backgroundBlurView = 0;

      backgroundView = self->_backgroundView;
      [(SBHLibraryCategoryPodBackgroundView *)backgroundView setHidden:0];
    }
    return;
  }
  if (![(SBHLibraryCategoryIconViewController *)self needsBackgroundBlur])
  {
    if (!self->_backgroundBlurView) {
      return;
    }
    goto LABEL_2;
  }
  v3 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:19];
  [v3 setGroupNameBase:@"SBHLibraryCategoryIconBackdropView"];
  [v3 setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:1];
  objc_super v4 = SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice();
  [v3 setBackdropScaleAdjustment:v4];

  [v3 setAutoresizingMask:18];
  double v5 = [(SBHLibraryCategoryIconViewController *)self view];
  [v5 bounds];
  objc_msgSend(v3, "setFrame:");

  [(SBHLibraryCategoryIconViewController *)self iconImageInfo];
  [v3 _setContinuousCornerRadius:v6];
  double v7 = self->_backgroundBlurView;
  self->_backgroundBlurView = (MTMaterialView *)v3;
  id v11 = v3;

  double v8 = [(SBHLibraryCategoryIconViewController *)self view];
  [v8 insertSubview:self->_backgroundBlurView atIndex:0];

  [(SBHLibraryCategoryPodBackgroundView *)self->_backgroundView setHidden:1];
}

- (void)updateCategory:(id)a3 location:(id)a4
{
  double v6 = (SBHLibraryCategory *)a3;
  preventFolderUpdateAssertion = self->_preventFolderUpdateAssertion;
  id v8 = a4;
  [(BSInvalidatable *)preventFolderUpdateAssertion invalidate];
  double v9 = self->_preventFolderUpdateAssertion;
  self->_preventFolderUpdateAssertion = 0;

  [(SBHLibraryCategory *)self->_category removeObserver:self];
  category = self->_category;
  self->_category = v6;
  v12 = v6;

  id v11 = [(SBHLibraryCategory *)v12 compactPodFolder];
  [(SBHLibraryCategoryIconViewController *)self updateFolder:v11 location:v8];

  [(SBHLibraryCategoryIconViewController *)self _setLockedIfPossible:1 animated:0];
  [(SBHLibraryCategory *)v12 addObserver:self];
}

- (void)updateFolder:(id)a3 location:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (![v10 isEqual:self->_folder]
    || ![(NSString *)self->_location isEqualToString:v7])
  {
    [(SBFolder *)self->_folder removeFolderObserver:self];
    objc_storeStrong((id *)&self->_location, a4);
    objc_storeStrong((id *)&self->_folder, a3);
    iconListView = self->_iconListView;
    double v9 = [v10 listAtIndex:0];
    [(SBIconListView *)iconListView setModel:v9];

    [(SBIconListView *)self->_iconListView setIconLocation:v7];
    [v10 addFolderObserver:self];
  }
}

- (SBIconListView)iconListView
{
  id v3 = (id)[(SBHLibraryCategoryIconViewController *)self view];
  iconListView = self->_iconListView;
  return iconListView;
}

- (UIView)backgroundView
{
  id v3 = (id)[(SBHLibraryCategoryIconViewController *)self view];
  backgroundView = self->_backgroundView;
  return (UIView *)backgroundView;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return [(SBIconListView *)self->_iconListView legibilitySettings];
}

- (void)setNeedsBackgroundBlur:(BOOL)a3
{
  if (self->_needsBackgroundBlur != a3)
  {
    self->_needsBackgroundBlur = a3;
    [(SBHLibraryCategoryIconViewController *)self _updateBackgroundBlurIfNeeded];
  }
}

- (void)_setLockedIfPossible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (_os_feature_enabled_impl())
  {
    if ([(SBHLibraryCategoryIconViewController *)self isLocked] == v5
      || ![(SBHLibraryCategoryIconViewController *)self _canBeLocked])
    {
      if (![(SBHLibraryCategoryIconViewController *)self _canBeLocked])
      {
        self->_locked = 0;
        lockedView = self->_lockedView;
        if (lockedView)
        {
          [(UIView *)lockedView removeFromSuperview];
          id v8 = self->_lockedView;
          self->_lockedView = 0;
        }
      }
    }
    else
    {
      self->_locked = v5;
      [(SBHLibraryCategoryIconViewController *)self _updateLockedViewForLocked:v5 animated:v4];
    }
  }
}

- (BOOL)_canBeLocked
{
  v2 = [(SBHLibraryCategory *)self->_category categoryIdentifier];
  uint64_t v3 = [v2 predictionCategoryID];

  return v3 == 7;
}

- (id)_createLockedView
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  BOOL v4 = [(SBHLibraryCategoryIconViewController *)self view];
  [v4 bounds];
  BOOL v5 = objc_msgSend(v3, "initWithFrame:");

  [v5 setAutoresizingMask:18];
  double v6 = [(SBHLibraryCategoryIconViewController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  [(SBHLibraryCategoryIconViewController *)self iconImageInfo];
  [v5 _setContinuousCornerRadius:v7];
  [v5 setUserInteractionEnabled:1];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleTapOnLockedView_];
  [v28 setMinimumPressDuration:0.0];
  v30[0] = v28;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  [v5 setGestureRecognizers:v8];

  [v5 setAlpha:0.0];
  double v9 = [(SBHLibraryCategoryIconViewController *)self iconListView];
  v27 = [v9 layoutMetrics];

  id v10 = [(SBHLibraryCategoryIconViewController *)self listLayoutProvider];
  id v11 = SBHCreateAppLibraryGhostPodView(v27, v10);

  [v5 addSubview:v11];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = (void *)MEMORY[0x1E4F28DC8];
  v26 = [v11 topAnchor];
  v25 = [v5 topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v29[0] = v24;
  v23 = [v11 bottomAnchor];
  v22 = [v5 bottomAnchor];
  v12 = [v23 constraintEqualToAnchor:v22];
  v29[1] = v12;
  uint64_t v13 = [v11 leadingAnchor];
  v14 = [v5 leadingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v29[2] = v15;
  v16 = [v11 trailingAnchor];
  v17 = [v5 trailingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v29[3] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v21 activateConstraints:v19];

  return v5;
}

- (void)_updateLockedViewForLocked:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  p_lockedView = &self->_lockedView;
  id v8 = self->_lockedView;
  double v9 = [(SBHLibraryCategoryIconViewController *)self view];
  id v10 = self->_iconListView;
  if (v5 && !v8)
  {
    id v8 = [(SBHLibraryCategoryIconViewController *)self _createLockedView];
    [v9 addSubview:v8];
    objc_storeStrong((id *)p_lockedView, v8);
  }
  if (v5) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.0;
  }
  if (v5) {
    double v12 = 0.0;
  }
  else {
    double v12 = 1.0;
  }
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __76__SBHLibraryCategoryIconViewController__updateLockedViewForLocked_animated___block_invoke;
  v20 = &unk_1E6AAE228;
  uint64_t v13 = v8;
  v21 = v13;
  v22 = v10;
  double v23 = v11;
  double v24 = v12;
  v14 = v10;
  v15 = _Block_copy(&v17);
  v16 = v15;
  if (v4) {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 0, v15, 0, 0.3, 0.0, v17, v18, v19, v20, v21, v22, *(void *)&v23, *(void *)&v24);
  }
  else {
    (*((void (**)(void *))v15 + 2))(v15);
  }
}

uint64_t __76__SBHLibraryCategoryIconViewController__updateLockedViewForLocked_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 56);
  return [v2 setAlpha:v3];
}

- (void)_handleTapOnLockedView:(id)a3
{
  id v4 = a3;
  BOOL v5 = self->_lockedView;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke;
  aBlock[3] = &unk_1E6AAC810;
  double v6 = v5;
  double v11 = v6;
  double v7 = _Block_copy(aBlock);
  if ([v4 state] == 1)
  {
    [(UIView *)v6 setAlpha:0.5];
  }
  else if ([v4 state] == 3)
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:327684 delay:v7 options:0 animations:0.2 completion:0.0];
    if (tapInsideView(v4, v6))
    {
      id v8 = [MEMORY[0x1E4F4B7E8] sharedGuard];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke_2;
      v9[3] = &unk_1E6AB2320;
      v9[4] = self;
      [v8 authenticateUnconditionallyWithCompletion:v9];
    }
  }
  else if ([v4 state] == 2 && !tapInsideView(v4, v6) {
         || [v4 state] == 4
  }
         || [v4 state] == 5)
  {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:327684 delay:v7 options:0 animations:0.2 completion:0.0];
  }
}

uint64_t __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke_3;
  block[3] = &unk_1E6AB1058;
  char v9 = a2;
  block[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__SBHLibraryCategoryIconViewController__handleTapOnLockedView___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    [v2 _setLockedIfPossible:0 animated:1];
  }
  else
  {
    double v3 = SBLogProtectedApps();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Failed to unlock hidden library pod with error:%@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)categoryWillUpdate:(id)a3
{
  uint64_t v4 = [a3 compactPodFolder];
  int v5 = [v4 lists];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 icons];
  id v8 = self;
  objc_msgSend(v7, "bs_firstObjectOfClass:", v8);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  char v9 = [(SBHLibraryCategoryIconViewController *)self iconListView];
  id v10 = [v9 displayedIconViewForIcon:v17];
  double v11 = [v10 _iconImageView];

  double v12 = self;
  if (objc_opt_isKindOfClass()) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;

  v15 = [v14 disableImageUpdatesForReason:@"Updating Category"];

  preventFolderUpdateAssertion = self->_preventFolderUpdateAssertion;
  self->_preventFolderUpdateAssertion = v15;
}

- (void)categoryDidUpdate:(id)a3
{
  [(BSInvalidatable *)self->_preventFolderUpdateAssertion invalidate];
  preventFolderUpdateAssertion = self->_preventFolderUpdateAssertion;
  self->_preventFolderUpdateAssertion = 0;
}

- (void)folder:(id)a3 didAddList:(id)a4
{
  id v9 = a3;
  unsigned int v5 = [(SBHLibraryCategoryIconViewController *)self bs_isAppearingOrAppeared];
  uint64_t v6 = [(SBIconListView *)self->_iconListView model];

  if (!v6)
  {
    iconListView = self->_iconListView;
    id v8 = [v9 listAtIndex:0];
    [(SBIconListView *)iconListView setModel:v8];

    [(SBIconListView *)self->_iconListView layoutIconsIfNeededWithAnimationType:v5 - 1 options:0];
  }
}

- (void)folder:(id)a3 didRemoveLists:(id)a4 atIndexes:(id)a5
{
  id v6 = a4;
  unsigned int v7 = [(SBHLibraryCategoryIconViewController *)self bs_isAppearingOrAppeared];
  id v8 = [(SBIconListView *)self->_iconListView model];
  int v9 = [v6 containsObject:v8];

  if (v9)
  {
    [(SBIconListView *)self->_iconListView setModel:0];
    iconListView = self->_iconListView;
    [(SBIconListView *)iconListView layoutIconsIfNeededWithAnimationType:v7 - 1 options:0];
  }
}

- (id)presentedIconLocations
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:self->_location];
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return [a3 isEqual:self->_location];
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a3;
  iconListView = self->_iconListView;
  id v8 = a4;
  int v9 = [(SBIconListView *)iconListView iconLocation];
  int v10 = [v9 isEqual:v8];

  if (v10)
  {
    double v11 = [(SBIconListView *)self->_iconListView iconViewForIcon:v6];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  iconListView = self->_iconListView;
  id v8 = a4;
  int v9 = [(SBIconListView *)iconListView iconLocation];
  int v10 = [v8 containsObject:v9];

  if (v10)
  {
    double v11 = [(SBIconListView *)self->_iconListView iconViewForIcon:v6];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)firstIconViewForIcon:(id)a3
{
  return [(SBIconListView *)self->_iconListView iconViewForIcon:a3];
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  iconListView = self->_iconListView;
  id v8 = a4;
  id v9 = a3;
  int v10 = [(SBIconListView *)iconListView iconLocation];
  double v11 = [v6 setWithObject:v10];

  [v11 minusSet:v8];
  double v12 = [v11 allObjects];
  uint64_t v13 = [(SBHLibraryCategoryIconViewController *)self firstIconViewForIcon:v9 inLocations:v12];

  return v13;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  iconListView = self->_iconListView;
  id v8 = a4;
  id v9 = [(SBIconListView *)iconListView iconLocation];
  int v10 = [v9 isEqual:v8];

  if (v10) {
    BOOL v11 = [(SBHLibraryCategoryIconViewController *)self isDisplayingIcon:v6];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  iconListView = self->_iconListView;
  id v8 = a4;
  id v9 = [(SBIconListView *)iconListView iconLocation];
  int v10 = [v8 containsObject:v9];

  if (v10) {
    BOOL v11 = [(SBHLibraryCategoryIconViewController *)self isDisplayingIcon:v6];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  return [(SBIconListView *)self->_iconListView isDisplayingIcon:a3];
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return [(SBIconListView *)self->_iconListView isDisplayingIconView:a3];
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  iconListView = self->_iconListView;
  id v8 = a4;
  id v9 = [(SBIconListView *)iconListView iconLocation];
  int v10 = [v9 isEqual:v8];

  if (v10) {
    BOOL v11 = [(SBIconListView *)self->_iconListView isDisplayingIconView:v6];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  iconListView = self->_iconListView;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__SBHLibraryCategoryIconViewController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke;
  v11[3] = &unk_1E6AB2348;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(SBIconListView *)iconListView enumerateIconViewsUsingBlock:v11];
}

void __86__SBHLibraryCategoryIconViewController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  double v3 = [v5 icon];
  int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    [(SBHLibraryCategoryPodBackgroundView *)self->_backgroundView _setContinuousCornerRadius:v7];
    backgroundBlurView = self->_backgroundBlurView;
    [(MTMaterialView *)backgroundBlurView _setContinuousCornerRadius:v7];
  }
}

- (void)setEditing:(BOOL)a3
{
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_editing != a3)
  {
    BOOL v4 = a4;
    self->_editing = a3;
    -[SBIconListView setEditing:](self->_iconListView, "setEditing:");
    iconListView = self->_iconListView;
    [(SBIconListView *)iconListView updateEditingStateAnimated:v4];
  }
}

- (void)setContentVisibility:(unint64_t)a3
{
  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    if (a3) {
      [(SBHLibraryCategoryIconViewController *)self _setLockedIfPossible:1 animated:1];
    }
    iconListView = self->_iconListView;
    [(SBIconListView *)iconListView setContentVisibility:a3];
  }
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v4 = (SBHIconImageAppearance *)[v6 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    [(SBIconListView *)self->_iconListView setOverrideIconImageAppearance:v6];
  }
}

- (CGRect)visibleBounds
{
  [(SBHLibraryCategoryIconViewController *)self iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)continuousCornerRadius
{
  [(SBHLibraryCategoryIconViewController *)self iconImageInfo];
  return v2;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (self->_showsSquareCorners != a3)
  {
    self->_showsSquareCorners = a3;
    [(SBHLibraryCategoryPodBackgroundView *)self->_backgroundView setClipsToBounds:!a3];
  }
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (SBHLibraryCategory)category
{
  return self->_category;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (NSString)location
{
  return self->_location;
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (void)setIconViewProvider:(id)a3
{
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (void)setFolderIconImageCache:(id)a3
{
}

- (BOOL)needsBackgroundBlur
{
  return self->_needsBackgroundBlur;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_preventFolderUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_lockedView, 0);
  objc_storeStrong((id *)&self->_iconListView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end