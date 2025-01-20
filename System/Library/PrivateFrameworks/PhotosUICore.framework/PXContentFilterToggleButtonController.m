@interface PXContentFilterToggleButtonController
- (BOOL)shouldHideButton;
- (BOOL)shouldUpdateButtonSymbol;
- (NSArray)allMenuItems;
- (NSArray)filterInlineMenuItems;
- (NSArray)filterMenuItems;
- (NSArray)viewOptionsMenuItems;
- (NSString)filterMenuSubtitle;
- (NSString)filteringSymbolName;
- (NSString)symbolName;
- (NSString)viewOptionsMenuSubtitle;
- (PXContentFilterState)contentFilterState;
- (PXContentFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4;
- (PXLibraryFilterState)libraryFilterState;
- (UIButton)button;
- (UIColor)baseBackgroundColor;
- (UIColor)primaryTintColor;
- (UIColor)secondaryTintColor;
- (UIImageSymbolConfiguration)filteringSymbolConfiguration;
- (UIImageSymbolConfiguration)symbolConfiguration;
- (id)_deferredMenu;
- (id)adjustedChildMenuIfNecessary:(id)a3;
- (void)_invalidateButton;
- (void)_invalidateButtonMenu;
- (void)_setNeedsUpdate;
- (void)_setupButtonWithConfiguration:(id)a3 roundedButton:(BOOL)a4;
- (void)_updateButton;
- (void)_updateButtonMenu;
- (void)invalidateButton;
- (void)invalidateButtonMenu;
- (void)performChanges:(id)a3;
- (void)setBaseBackgroundColor:(id)a3;
- (void)setContentFilterState:(id)a3;
- (void)setFilteringSymbolConfiguration:(id)a3;
- (void)setFilteringSymbolName:(id)a3;
- (void)setLibraryFilterState:(id)a3;
- (void)setPrimaryTintColor:(id)a3;
- (void)setSecondaryTintColor:(id)a3;
- (void)setShouldUpdateButtonSymbol:(BOOL)a3;
- (void)setSymbolConfiguration:(id)a3;
- (void)setSymbolName:(id)a3;
@end

@implementation PXContentFilterToggleButtonController

- (void)setLibraryFilterState:(id)a3
{
  v4 = (PXLibraryFilterState *)a3;
  v5 = self->_libraryFilterState;
  if (v5 == v4)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(PXLibraryFilterState *)v4 isEqual:v5];

    if (!v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__PXContentFilterToggleButtonController_setLibraryFilterState___block_invoke;
      v8[3] = &unk_1E5DB4648;
      v8[4] = self;
      v9 = v4;
      [(PXContentFilterToggleButtonController *)self performChanges:v8];
    }
  }
}

- (void)_updateButton
{
  id v36 = [(PXContentFilterToggleButtonController *)self libraryFilterState];
  v3 = [(PXContentFilterToggleButtonController *)self contentFilterState];
  if ([v36 isFiltering]) {
    int v4 = 1;
  }
  else {
    int v4 = [v3 isFiltering];
  }
  v5 = [(PXContentFilterToggleButtonController *)self button];
  v6 = [v5 configuration];
  BOOL v7 = (void *)[v6 copy];

  if (self->_shouldUpdateButtonSymbol)
  {
    if (self->_roundedButton)
    {
      v8 = [(PXContentFilterToggleButtonController *)self baseBackgroundColor];
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        v11 = [v5 backgroundColor];
        originalUnfilteredBackgroundColor = v11;
        if (!v11) {
          originalUnfilteredBackgroundColor = self->_originalUnfilteredBackgroundColor;
        }
        v10 = originalUnfilteredBackgroundColor;
      }
      v13 = v10;
      if (v4)
      {
        v13 = [v5 tintColor];
      }
      v14 = [v7 background];
      [v14 setBackgroundColor:v13];

      if (v4) {
    }
      }
    v15 = [(PXContentFilterToggleButtonController *)self symbolName];
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      v18 = [(PXContentFilterToggleButtonController *)self allMenuItems];
      if ((unint64_t)[v18 count] < 2)
      {
        v17 = @"line.3.horizontal.decrease";
      }
      else
      {
        PXContentFilterImageNameForFilterStates(v36, v3);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    v19 = [(PXContentFilterToggleButtonController *)self symbolConfiguration];
    if (v4)
    {
      uint64_t v20 = [(PXContentFilterToggleButtonController *)self filteringSymbolName];
      v21 = (void *)v20;
      if (v20) {
        v22 = (void *)v20;
      }
      else {
        v22 = v17;
      }
      v23 = v22;

      uint64_t v24 = [(PXContentFilterToggleButtonController *)self filteringSymbolConfiguration];
      v25 = (void *)v24;
      if (v24) {
        v26 = (void *)v24;
      }
      else {
        v26 = v19;
      }
      id v27 = v26;

      v17 = v23;
      v19 = v27;
    }
    v28 = (void *)MEMORY[0x1E4FB1818];
    if (v19)
    {
      v29 = [MEMORY[0x1E4FB1818] systemImageNamed:v17];
      [v7 setImage:v29];

      [v7 setPreferredSymbolConfigurationForImage:v19];
    }
    else
    {
      v30 = [v7 image];
      v31 = [v30 configuration];
      v32 = [v28 systemImageNamed:v17 withConfiguration:v31];

      if (v4) {
        [(PXContentFilterToggleButtonController *)self primaryTintColor];
      }
      else {
      v33 = [(PXContentFilterToggleButtonController *)self secondaryTintColor];
      }
      v34 = [v32 imageWithTintColor:v33 renderingMode:1];
      [v7 setImage:v34];
    }
  }
  if (v4) {
    [(PXContentFilterToggleButtonController *)self primaryTintColor];
  }
  else {
  v35 = [(PXContentFilterToggleButtonController *)self secondaryTintColor];
  }
  [v7 setBaseForegroundColor:v35];
  [v5 setConfiguration:v7];
  objc_msgSend(v5, "setHidden:", -[PXContentFilterToggleButtonController shouldHideButton](self, "shouldHideButton"));
  [(PXContentFilterToggleButtonController *)self _invalidateButtonMenu];
}

- (UIColor)secondaryTintColor
{
  return self->_secondaryTintColor;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (UIButton)button
{
  return self->_button;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (BOOL)shouldHideButton
{
  v3 = [(PXContentFilterToggleButtonController *)self libraryFilterState];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(PXContentFilterToggleButtonController *)self contentFilterState];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (UIColor)baseBackgroundColor
{
  return self->_baseBackgroundColor;
}

- (void)_invalidateButtonMenu
{
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PXContentFilterToggleButtonController.m", 206, @"Invalid parameter not satisfying: %@", @"_isPerformingChanges" object file lineNumber description];
  }
}

- (void)_updateButtonMenu
{
  objc_initWeak(&location, self);
  v3 = [(UIButton *)self->_button contextMenuInteraction];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__PXContentFilterToggleButtonController__updateButtonMenu__block_invoke;
  v4[3] = &unk_1E5DB4698;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 updateVisibleMenuWithBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (PXContentFilterToggleButtonController)initWithButtonConfiguration:(id)a3 roundedButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXContentFilterToggleButtonController;
  BOOL v7 = [(PXContentFilterToggleButtonController *)&v22 init];
  if (v7)
  {
    v8 = [v6 baseBackgroundColor];

    if (v8)
    {
      uint64_t v9 = [v6 baseBackgroundColor];
      primaryTintColor = v7->_primaryTintColor;
      v7->_primaryTintColor = (UIColor *)v9;
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
      v12 = v7->_primaryTintColor;
      v7->_primaryTintColor = (UIColor *)v11;

      uint64_t v13 = [MEMORY[0x1E4FB1618] whiteColor];
      primaryTintColor = v7->_secondaryTintColor;
      v7->_secondaryTintColor = (UIColor *)v13;
    }

    v14 = [v6 background];
    uint64_t v15 = [v14 backgroundColor];
    originalUnfilteredBackgroundColor = v7->_originalUnfilteredBackgroundColor;
    v7->_originalUnfilteredBackgroundColor = (UIColor *)v15;

    uint64_t v17 = [v6 preferredSymbolConfigurationForImage];
    symbolConfiguration = v7->_symbolConfiguration;
    v7->_symbolConfiguration = (UIImageSymbolConfiguration *)v17;

    v7->_roundedButton = v4;
    v7->_shouldUpdateButtonSymbol = 1;
    uint64_t v19 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v7 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v19;

    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateButton];
    [(PXUpdater *)v7->_updater addUpdateSelector:sel__updateButtonMenu];
    [(PXContentFilterToggleButtonController *)v7 _setupButtonWithConfiguration:v6 roundedButton:v4];
  }

  return v7;
}

- (void)_setupButtonWithConfiguration:(id)a3 roundedButton:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__PXContentFilterToggleButtonController__setupButtonWithConfiguration_roundedButton___block_invoke;
  v8[3] = &unk_1E5DB4670;
  BOOL v11 = a4;
  id v9 = v6;
  v10 = self;
  id v7 = v6;
  [(PXContentFilterToggleButtonController *)self performChanges:v8];
}

- (void)setContentFilterState:(id)a3
{
  BOOL v4 = (PXContentFilterState *)a3;
  id v5 = self->_contentFilterState;
  if (v5 == v4)
  {
  }
  else
  {
    id v6 = v5;
    BOOL v7 = [(PXContentFilterState *)v4 isEqual:v5];

    if (!v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__PXContentFilterToggleButtonController_setContentFilterState___block_invoke;
      v8[3] = &unk_1E5DB4648;
      void v8[4] = self;
      id v9 = v4;
      [(PXContentFilterToggleButtonController *)self performChanges:v8];
    }
  }
}

- (void)performChanges:(id)a3
{
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  (*((void (**)(id, PXContentFilterToggleButtonController *))a3 + 2))(a3, self);
  if (!isPerformingChanges) {
    [(PXUpdater *)self->_updater updateIfNeeded];
  }
  self->_BOOL isPerformingChanges = isPerformingChanges;
}

- (void)_invalidateButton
{
}

uint64_t __85__PXContentFilterToggleButtonController__setupButtonWithConfiguration_roundedButton___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    v3 = +[PXPhotosViewRoundedAccessoryButton buttonWithConfiguration:v2 primaryAction:0];
    objc_msgSend(v3, "setMenuOffset:", 0.0, -8.0);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v3;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v2 primaryAction:0];
    uint64_t v7 = *(void *)(a1 + 40);
    id v5 = *(void **)(v7 + 104);
    *(void *)(v7 + 104) = v6;
  }

  v8 = [*(id *)(a1 + 40) _deferredMenu];
  [*(id *)(*(void *)(a1 + 40) + 104) setMenu:v8];

  [*(id *)(*(void *)(a1 + 40) + 104) setShowsMenuAsPrimaryAction:1];
  [*(id *)(*(void *)(a1 + 40) + 104) setPreferredMenuElementOrder:2];
  id v9 = *(void **)(a1 + 40);
  return [v9 _invalidateButton];
}

uint64_t __63__PXContentFilterToggleButtonController_setLibraryFilterState___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateButton];
}

uint64_t __63__PXContentFilterToggleButtonController_setContentFilterState___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateButton];
}

- (id)_deferredMenu
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x1E4FB16B8];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __54__PXContentFilterToggleButtonController__deferredMenu__block_invoke;
  BOOL v11 = &unk_1E5DC4300;
  objc_copyWeak(&v12, &location);
  v3 = [v2 elementWithUncachedProvider:&v8];
  uint64_t v4 = (void *)MEMORY[0x1E4FB1970];
  v14[0] = v3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  uint64_t v6 = [v4 menuWithChildren:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterInlineMenuItems, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_baseBackgroundColor, 0);
  objc_storeStrong((id *)&self->_filteringSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_filteringSymbolName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_secondaryTintColor, 0);
  objc_storeStrong((id *)&self->_primaryTintColor, 0);
  objc_storeStrong((id *)&self->_originalUnfilteredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (NSArray)filterInlineMenuItems
{
  return self->_filterInlineMenuItems;
}

- (void)setShouldUpdateButtonSymbol:(BOOL)a3
{
  self->_shouldUpdateButtonSymbol = a3;
}

- (BOOL)shouldUpdateButtonSymbol
{
  return self->_shouldUpdateButtonSymbol;
}

- (UIImageSymbolConfiguration)filteringSymbolConfiguration
{
  return self->_filteringSymbolConfiguration;
}

- (NSString)filteringSymbolName
{
  return self->_filteringSymbolName;
}

- (UIColor)primaryTintColor
{
  return self->_primaryTintColor;
}

id __58__PXContentFilterToggleButtonController__updateButtonMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [*(id *)(a1 + 32) adjustedChildMenuIfNecessary:v3];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;

      id v3 = v7;
LABEL_19:

      goto LABEL_20;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = [v3 children];
    v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    BOOL v11 = [v3 children];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v20 = 0;
      id v21 = WeakRetained;
      char v14 = 0;
      uint64_t v15 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          v18 = objc_msgSend(*(id *)(a1 + 32), "adjustedChildMenuIfNecessary:", v17, v20, v21);
          if (v18)
          {
            [v10 addObject:v18];
            char v14 = 1;
          }
          else
          {
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);

      if ((v14 & 1) == 0)
      {
        uint64_t v6 = v20;
        id WeakRetained = v21;
        goto LABEL_18;
      }
      [v3 menuByReplacingChildren:v10];
      BOOL v11 = v3;
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = v20;
      id WeakRetained = v21;
    }

LABEL_18:
    goto LABEL_19;
  }
LABEL_20:

  return v3;
}

- (id)adjustedChildMenuIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 title];
  uint64_t v6 = PXLocalizedStringFromTable(@"PXFilterMenuTitle", @"PhotosUICore");
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(PXContentFilterToggleButtonController *)self filterMenuItems];
    if (v8)
    {
      uint64_t v9 = [v4 menuByReplacingChildren:v8];
      uint64_t v10 = [(PXContentFilterToggleButtonController *)self filterMenuSubtitle];
LABEL_7:
      uint64_t v13 = (void *)v10;
      [v9 setSubtitle:v10];

LABEL_9:
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  BOOL v11 = PXLocalizedStringFromTable(@"PXContentViewOptionsMenuTitle", @"PhotosUICore");
  int v12 = [v5 isEqualToString:v11];

  if (v12)
  {
    id v8 = [(PXContentFilterToggleButtonController *)self viewOptionsMenuItems];
    if (v8)
    {
      uint64_t v9 = [v4 menuByReplacingChildren:v8];
      uint64_t v10 = [(PXContentFilterToggleButtonController *)self viewOptionsMenuSubtitle];
      goto LABEL_7;
    }
LABEL_8:
    uint64_t v9 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

void __54__PXContentFilterToggleButtonController__deferredMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained allMenuItems];
    v6[2](v6, v5);
  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E4F1CBF0]);
  }
}

- (void)invalidateButtonMenu
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__PXContentFilterToggleButtonController_invalidateButtonMenu__block_invoke;
  v2[3] = &unk_1E5DC27B0;
  v2[4] = self;
  [(PXContentFilterToggleButtonController *)self performChanges:v2];
}

uint64_t __61__PXContentFilterToggleButtonController_invalidateButtonMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateButtonMenu];
}

- (void)invalidateButton
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__PXContentFilterToggleButtonController_invalidateButton__block_invoke;
  v2[3] = &unk_1E5DC27B0;
  v2[4] = self;
  [(PXContentFilterToggleButtonController *)self performChanges:v2];
}

uint64_t __57__PXContentFilterToggleButtonController_invalidateButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateButton];
}

- (NSArray)allMenuItems
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentFilterToggleButtonController.m", 166, @"Method %s is a responsibility of subclass %@", "-[PXContentFilterToggleButtonController allMenuItems]", v6 object file lineNumber description];

  abort();
}

- (NSString)viewOptionsMenuSubtitle
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentFilterToggleButtonController.m", 162, @"Method %s is a responsibility of subclass %@", "-[PXContentFilterToggleButtonController viewOptionsMenuSubtitle]", v6 object file lineNumber description];

  abort();
}

- (NSArray)viewOptionsMenuItems
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentFilterToggleButtonController.m", 158, @"Method %s is a responsibility of subclass %@", "-[PXContentFilterToggleButtonController viewOptionsMenuItems]", v6 object file lineNumber description];

  abort();
}

- (NSString)filterMenuSubtitle
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentFilterToggleButtonController.m", 154, @"Method %s is a responsibility of subclass %@", "-[PXContentFilterToggleButtonController filterMenuSubtitle]", v6 object file lineNumber description];

  abort();
}

- (NSArray)filterMenuItems
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXContentFilterToggleButtonController.m", 150, @"Method %s is a responsibility of subclass %@", "-[PXContentFilterToggleButtonController filterMenuItems]", v6 object file lineNumber description];

  abort();
}

- (void)setBaseBackgroundColor:(id)a3
{
  id v8 = (UIColor *)a3;
  id v4 = self->_baseBackgroundColor;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIColor *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (UIColor *)[(UIColor *)v8 copy];
      baseBackgroundColor = self->_baseBackgroundColor;
      self->_baseBackgroundColor = v6;

      [(PXContentFilterToggleButtonController *)self _invalidateButton];
    }
  }
}

- (void)setFilteringSymbolConfiguration:(id)a3
{
  id v8 = (UIImageSymbolConfiguration *)a3;
  id v4 = self->_filteringSymbolConfiguration;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIImageSymbolConfiguration *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (UIImageSymbolConfiguration *)[(UIImageSymbolConfiguration *)v8 copy];
      filteringSymbolConfiguration = self->_filteringSymbolConfiguration;
      self->_filteringSymbolConfiguration = v6;

      [(PXContentFilterToggleButtonController *)self _invalidateButton];
    }
  }
}

- (void)setSymbolConfiguration:(id)a3
{
  id v8 = (UIImageSymbolConfiguration *)a3;
  id v4 = self->_symbolConfiguration;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIImageSymbolConfiguration *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (UIImageSymbolConfiguration *)[(UIImageSymbolConfiguration *)v8 copy];
      symbolConfiguration = self->_symbolConfiguration;
      self->_symbolConfiguration = v6;

      [(PXContentFilterToggleButtonController *)self _invalidateButton];
    }
  }
}

- (void)setFilteringSymbolName:(id)a3
{
  id v8 = (NSString *)a3;
  id v4 = self->_filteringSymbolName;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      filteringSymbolName = self->_filteringSymbolName;
      self->_filteringSymbolName = v6;

      [(PXContentFilterToggleButtonController *)self _invalidateButton];
    }
  }
}

- (void)setSymbolName:(id)a3
{
  id v8 = (NSString *)a3;
  id v4 = self->_symbolName;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      symbolName = self->_symbolName;
      self->_symbolName = v6;

      [(PXContentFilterToggleButtonController *)self _invalidateButton];
    }
  }
}

- (void)setSecondaryTintColor:(id)a3
{
  id v8 = (UIColor *)a3;
  id v4 = self->_secondaryTintColor;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIColor *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (UIColor *)[(UIColor *)v8 copy];
      secondaryTintColor = self->_secondaryTintColor;
      self->_secondaryTintColor = v6;

      [(PXContentFilterToggleButtonController *)self _invalidateButton];
    }
  }
}

- (void)setPrimaryTintColor:(id)a3
{
  id v8 = (UIColor *)a3;
  id v4 = self->_primaryTintColor;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIColor *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (UIColor *)[(UIColor *)v8 copy];
      primaryTintColor = self->_primaryTintColor;
      self->_primaryTintColor = v6;

      [(PXContentFilterToggleButtonController *)self _invalidateButton];
    }
  }
}

@end