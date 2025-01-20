@interface SBHFocusModeFeatureIntroductionItem
- (BOOL)shouldDisplayFeatureIntroductionAtLocations:(unint64_t)a3;
- (CGRect)focusModePopoverViewFolderScrollAccessoryFrame:(id)a3;
- (NSMutableSet)focusModePopoverViews;
- (SBHFocusModeFeatureIntroductionItem)initWithIconManager:(id)a3;
- (SBHIconManager)iconManager;
- (id)featureIntroductionIdentifier;
- (id)focusModePopoverViewActiveFocusMode:(id)a3;
- (void)_removeActiveFocusModeRequiringIntroduction;
- (void)_tearDownFocusModePopoverView:(id)a3;
- (void)displayFeatureIntroductionAtLocations:(unint64_t)a3 presentCompletion:(id)a4 dismissCompletion:(id)a5;
- (void)focusModePopoverView:(id)a3 closeButtonTappedForIconListView:(id)a4;
- (void)focusModePopoverView:(id)a3 editPageButtonTappedForIconListView:(id)a4;
- (void)setFocusModePopoverViews:(id)a3;
- (void)setIconManager:(id)a3;
- (void)tearDown;
@end

@implementation SBHFocusModeFeatureIntroductionItem

- (SBHFocusModeFeatureIntroductionItem)initWithIconManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHFocusModeFeatureIntroductionItem;
  v5 = [(SBHFocusModeFeatureIntroductionItem *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    focusModePopoverViews = v6->_focusModePopoverViews;
    v6->_focusModePopoverViews = v7;
  }
  return v6;
}

- (void)tearDown
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = SBLogFocusModes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "[%@] Tear down", buf, 0xCu);
  }
  v6 = [(SBHFocusModeFeatureIntroductionItem *)self focusModePopoverViews];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) removeFromSuperview];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_tearDownFocusModePopoverView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHFocusModeFeatureIntroductionItem *)self focusModePopoverViews];
  [v5 removeObject:v4];
  [v4 removeFromSuperview];
}

- (void)_removeActiveFocusModeRequiringIntroduction
{
  id v5 = [(SBHFocusModeFeatureIntroductionItem *)self iconManager];
  v2 = [v5 focusModeManager];
  v3 = [v2 activeFocusMode];
  id v4 = [v3 identifier];
  [v2 removeFocusModeRequiringIntroduction:v4];
}

- (id)featureIntroductionIdentifier
{
  return @"SBHFocusModeFeatureIntroductionItem";
}

- (BOOL)shouldDisplayFeatureIntroductionAtLocations:(unint64_t)a3
{
  id v5 = [(SBHFocusModeFeatureIntroductionItem *)self focusModePopoverViews];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    uint64_t v8 = [(SBHFocusModeFeatureIntroductionItem *)self iconManager];
    int v9 = [v8 isDockPinnedForRotation];
    uint64_t v10 = [v8 interfaceOrientation];
    if (!v9 || v10 == 1) {
      unint64_t v7 = (a3 >> 2) & 1;
    }
    else {
      LOBYTE(v7) = 0;
    }
  }
  return v7;
}

- (void)displayFeatureIntroductionAtLocations:(unint64_t)a3 presentCompletion:(id)a4 dismissCompletion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = SBLogFocusModes();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "[%@] Determining if any popovers should be shown for lists revealed by active Focus mode...", buf, 0xCu);
  }
  int v9 = [(SBHFocusModeFeatureIntroductionItem *)self iconManager];
  uint64_t v10 = [v9 rootFolderController];
  long long v11 = [v10 contentView];
  uint64_t v12 = objc_opt_class();
  id v13 = v11;
  if (v12)
  {
    if (objc_opt_isKindOfClass()) {
      long long v14 = v13;
    }
    else {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }
  id v15 = v14;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__SBHFocusModeFeatureIntroductionItem_displayFeatureIntroductionAtLocations_presentCompletion_dismissCompletion___block_invoke;
  v18[3] = &unk_1E6AADAE0;
  v18[4] = self;
  [v15 enumerateIconListViewsWithOptions:2 usingBlock:v18];

  v16 = [v9 focusModeManager];
  v17 = [v16 activeFocusMode];
  if (([v17 isSleepFocus] & 1) == 0) {
    [(SBHFocusModeFeatureIntroductionItem *)self _removeActiveFocusModeRequiringIntroduction];
  }
}

void __113__SBHFocusModeFeatureIntroductionItem_displayFeatureIntroductionAtLocations_presentCompletion_dismissCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 model];
  if (([v4 isHidden] & 1) == 0 && objc_msgSend(v4, "isHiddenByUser"))
  {
    id v5 = [[SBHFocusModePopoverView alloc] initWithDelegate:*(void *)(a1 + 32) iconListView:v3];
    uint64_t v6 = [*(id *)(a1 + 32) focusModePopoverViews];
    [v6 addObject:v5];

    unint64_t v7 = SBLogFocusModes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      int v10 = 138412290;
      long long v11 = v9;
      _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Displaying popover", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)focusModePopoverView:(id)a3 closeButtonTappedForIconListView:(id)a4
{
  id v5 = a3;
  [(SBHFocusModeFeatureIntroductionItem *)self _removeActiveFocusModeRequiringIntroduction];
  [(SBHFocusModeFeatureIntroductionItem *)self _tearDownFocusModePopoverView:v5];
}

- (void)focusModePopoverView:(id)a3 editPageButtonTappedForIconListView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SBHFocusModeFeatureIntroductionItem *)self _removeActiveFocusModeRequiringIntroduction];
  id v8 = [(SBHFocusModeFeatureIntroductionItem *)self iconManager];
  [v8 setEditing:1 fromIconListView:v6];

  [(SBHFocusModeFeatureIntroductionItem *)self _tearDownFocusModePopoverView:v7];
}

- (id)focusModePopoverViewActiveFocusMode:(id)a3
{
  id v3 = [(SBHFocusModeFeatureIntroductionItem *)self iconManager];
  id v4 = [v3 focusModeManager];
  id v5 = [v4 activeFocusMode];

  return v5;
}

- (CGRect)focusModePopoverViewFolderScrollAccessoryFrame:(id)a3
{
  id v3 = [(SBHFocusModeFeatureIntroductionItem *)self iconManager];
  id v4 = [v3 rootFolderController];
  id v5 = [v4 contentView];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  int v10 = [v9 scrollAccessoryView];

  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)setIconManager:(id)a3
{
}

- (NSMutableSet)focusModePopoverViews
{
  return self->_focusModePopoverViews;
}

- (void)setFocusModePopoverViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusModePopoverViews, 0);
  objc_destroyWeak((id *)&self->_iconManager);
}

@end