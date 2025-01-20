@interface _PUSettingsController
- (BOOL)hasWarnedForOverrides;
- (PTSettings)rootSettings;
- (PXSettings)currentSettings;
- (PXToast)toast;
- (UINavigationController)configurationsNavigationController;
- (UINavigationController)searchNavigationController;
- (_PUSettingsController)initWithRootSettings:(id)a3;
- (id)dismissButtonFactory;
- (id)ellipsisBarButtonItemFactory;
- (id)onViewDidDisappearBlock;
- (void)_clearSettingsOverride;
- (void)_hideToast;
- (void)_invalidateNavigationItems;
- (void)_showReminderToQuitAfterChange;
- (void)_updateNavigationItemOfViewController:(id)a3;
- (void)_warnForSettingsOverride;
- (void)callOnViewDidDisappearBlock;
- (void)handleEllipsisBarButtonItem:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setDismissButtonFactory:(id)a3;
- (void)setEllipsisBarButtonItemFactory:(id)a3;
- (void)setHasWarnedForOverrides:(BOOL)a3;
- (void)setOnViewDidDisappearBlock:(id)a3;
- (void)setToast:(id)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation _PUSettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsNavigationController, 0);
  objc_storeStrong((id *)&self->_toast, 0);
  objc_storeStrong(&self->_ellipsisBarButtonItemFactory, 0);
  objc_storeStrong(&self->_dismissButtonFactory, 0);
  objc_storeStrong(&self->_onViewDidDisappearBlock, 0);
  objc_storeStrong((id *)&self->_rootSettings, 0);
  objc_storeStrong((id *)&self->_searchNavigationController, 0);
}

- (void)setHasWarnedForOverrides:(BOOL)a3
{
  self->_hasWarnedForOverrides = a3;
}

- (BOOL)hasWarnedForOverrides
{
  return self->_hasWarnedForOverrides;
}

- (UINavigationController)configurationsNavigationController
{
  return self->_configurationsNavigationController;
}

- (PXToast)toast
{
  return self->_toast;
}

- (id)ellipsisBarButtonItemFactory
{
  return self->_ellipsisBarButtonItemFactory;
}

- (id)dismissButtonFactory
{
  return self->_dismissButtonFactory;
}

- (void)setOnViewDidDisappearBlock:(id)a3
{
}

- (id)onViewDidDisappearBlock
{
  return self->_onViewDidDisappearBlock;
}

- (PTSettings)rootSettings
{
  return self->_rootSettings;
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v7 = v9;
  }
  else {
    id v7 = 0;
  }

  char v8 = [v7 isTransientKeyPath:v6];
  if ((v8 & 1) == 0) {
    [(_PUSettingsController *)self _showReminderToQuitAfterChange];
  }
}

- (void)_hideToast
{
  v2 = [(_PUSettingsController *)self toast];
  [v2 dismissAnimated:1];

  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = (void *)MEMORY[0x1E4F8FF78];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35___PUSettingsController__hideToast__block_invoke;
  v7[3] = &unk_1E5F2B878;
  id v8 = v3;
  id v5 = v3;
  id v6 = (id)[v4 show:v7];
}

- (void)_showReminderToQuitAfterChange
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (([v3 BOOLForKey:@"InternalSettingsDisableReminderToQuitAfterChange"] & 1) == 0)
  {
    if (settingsWindow)
    {
      if (([(id)settingsWindow isHidden] & 1) == 0)
      {
        v4 = [(_PUSettingsController *)self toast];

        if (!v4)
        {
          id v5 = [MEMORY[0x1E4F1C9C8] date];
          id v6 = [v3 objectForKey:@"InternalSettingsReminderToQuitAfterChangeLastDate"];
          id v7 = v6;
          if (!v6 || ([v6 timeIntervalSinceDate:v5], v8 >= 480.0))
          {
            [v3 setObject:v5 forKey:@"InternalSettingsReminderToQuitAfterChangeLastDate"];
            v10[0] = MEMORY[0x1E4F143A8];
            v10[1] = 3221225472;
            v10[2] = __55___PUSettingsController__showReminderToQuitAfterChange__block_invoke;
            v10[3] = &unk_1E5F2B850;
            v10[4] = self;
            id v9 = [MEMORY[0x1E4F90820] show:v10];
            [(_PUSettingsController *)self setToast:v9];
          }
        }
      }
    }
  }
}

- (void)_clearSettingsOverride
{
  v3 = [(_PUSettingsController *)self currentSettings];
  [v3 clearManualOverrides];

  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Overrides Cleared" message:@"Internal settings overrides have been cleared. This will take effect on the next launch of Photos." preferredStyle:1];
  v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:0];
  [v6 addAction:v4];

  id v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Quit" style:2 handler:&__block_literal_global_977];
  [v6 addAction:v5];

  [(_PUSettingsController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_warnForSettingsOverride
{
  v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Internal Settings Are Overridden" message:@"Internal settings have been overridden by a defaults write. Changes made here may not be saved." preferredStyle:1];
  v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:0];
  [v3 addAction:v4];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49___PUSettingsController__warnForSettingsOverride__block_invoke;
  v6[3] = &unk_1E5F2BF98;
  v6[4] = self;
  id v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Clear Overrides" style:2 handler:v6];
  [v3 addAction:v5];

  [(_PUSettingsController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)setToast:(id)a3
{
  id v5 = (PXToast *)a3;
  if (self->_toast != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_toast, a3);
    id v5 = v6;
  }
}

- (void)handleEllipsisBarButtonItem:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = a3;
  id v6 = [v4 alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v7 = [(_PUSettingsController *)self currentSettings];
  if (v7)
  {
    double v8 = [(_PUSettingsController *)self rootSettings];

    if (v7 != v8)
    {
      id v9 = [MEMORY[0x1E4F901D8] sharedInstance];
      int v10 = [v9 isFavoriteSettings:v7];
      char v11 = v10;
      if (v10) {
        v12 = @"Unfavorite";
      }
      else {
        v12 = @"Favorite";
      }
      if (v10) {
        v13 = @"star.fill";
      }
      else {
        v13 = @"star";
      }
      v14 = [MEMORY[0x1E4FB1818] systemImageNamed:v13];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke;
      v25[3] = &unk_1E5F2DCD0;
      id v26 = v9;
      char v28 = v11;
      id v27 = v7;
      id v15 = v9;
      [v6 _addActionWithTitle:v12 image:v14 style:0 handler:v25];
    }
  }
  v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"magnifyingglass"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_2;
  v24[3] = &unk_1E5F2ED10;
  v24[4] = self;
  [v6 _addActionWithTitle:@"Search" image:v16 style:0 handler:v24];

  if (v7)
  {
    v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"bookmark"];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53___PUSettingsController_handleEllipsisBarButtonItem___block_invoke_3;
    v21[3] = &unk_1E5F2ECC8;
    id v22 = v7;
    v23 = self;
    [v6 _addActionWithTitle:@"Configurations" image:v17 style:0 handler:v21];
  }
  v18 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUTTR");
  [v6 _addActionWithTitle:@"Tap to Radar" image:v18 style:0 handler:&__block_literal_global_957];

  v19 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v6 addAction:v19];

  [v6 setModalPresentationStyle:7];
  [(_PUSettingsController *)self presentViewController:v6 animated:1 completion:0];
  v20 = [v6 popoverPresentationController];
  [v20 setBarButtonItem:v5];
}

- (UINavigationController)searchNavigationController
{
  searchNavigationController = self->_searchNavigationController;
  if (!searchNavigationController)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F90678]) initWithSettingsController:self];
    id v5 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
    id v6 = self->_searchNavigationController;
    self->_searchNavigationController = v5;

    searchNavigationController = self->_searchNavigationController;
  }
  return searchNavigationController;
}

- (void)_updateNavigationItemOfViewController:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___PUSettingsController__updateNavigationItemOfViewController___block_invoke;
  aBlock[3] = &unk_1E5F2B828;
  id v13 = v6;
  id v7 = v6;
  double v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v9 = [(_PUSettingsController *)self dismissButtonFactory];
  v8[2](v8, v9);

  int v10 = [(_PUSettingsController *)self ellipsisBarButtonItemFactory];
  v8[2](v8, v10);

  char v11 = [v5 navigationItem];

  [v11 setRightBarButtonItems:v7];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)_PUSettingsController;
  id v6 = a3;
  [(_PUSettingsController *)&v7 pushViewController:v6 animated:v4];
  -[_PUSettingsController _updateNavigationItemOfViewController:](self, "_updateNavigationItemOfViewController:", v6, v7.receiver, v7.super_class);
}

- (void)_invalidateNavigationItems
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(_PUSettingsController *)self viewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(_PUSettingsController *)self _updateNavigationItemOfViewController:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setEllipsisBarButtonItemFactory:(id)a3
{
  if (self->_ellipsisBarButtonItemFactory != a3)
  {
    uint64_t v4 = (void *)[a3 copy];
    id ellipsisBarButtonItemFactory = self->_ellipsisBarButtonItemFactory;
    self->_id ellipsisBarButtonItemFactory = v4;

    [(_PUSettingsController *)self _invalidateNavigationItems];
  }
}

- (void)setDismissButtonFactory:(id)a3
{
  if (self->_dismissButtonFactory != a3)
  {
    uint64_t v4 = (void *)[a3 copy];
    id dismissButtonFactory = self->_dismissButtonFactory;
    self->_id dismissButtonFactory = v4;

    [(_PUSettingsController *)self _invalidateNavigationItems];
  }
}

- (void)callOnViewDidDisappearBlock
{
  v3 = [(_PUSettingsController *)self onViewDidDisappearBlock];

  if (v3)
  {
    uint64_t v4 = [(_PUSettingsController *)self onViewDidDisappearBlock];
    v4[2]();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PUSettingsController;
  [(_PUSettingsController *)&v4 viewDidDisappear:a3];
  [(_PUSettingsController *)self callOnViewDidDisappearBlock];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_PUSettingsController;
  [(_PUSettingsController *)&v6 viewDidAppear:a3];
  if (![(_PUSettingsController *)self hasWarnedForOverrides])
  {
    objc_super v4 = [(_PUSettingsController *)self currentSettings];
    int v5 = [v4 hasUserDefaultsOverrides];

    if (v5)
    {
      [(_PUSettingsController *)self setHasWarnedForOverrides:1];
      [(_PUSettingsController *)self _warnForSettingsOverride];
    }
  }
}

- (PXSettings)currentSettings
{
  v2 = [(_PUSettingsController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 settings];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return (PXSettings *)v4;
}

- (_PUSettingsController)initWithRootSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PUSettingsController;
  objc_super v6 = [(_PUSettingsController *)&v9 initWithRootSettings:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rootSettings, a3);
    [(PTSettings *)v7->_rootSettings addKeyPathObserver:v7];
  }

  return v7;
}

@end