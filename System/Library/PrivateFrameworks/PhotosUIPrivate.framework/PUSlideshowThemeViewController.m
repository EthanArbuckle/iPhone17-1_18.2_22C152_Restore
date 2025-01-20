@interface PUSlideshowThemeViewController
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateBackgroundView;
- (BOOL)_needsUpdateSpec;
- (BOOL)_needsUpdateTableView;
- (BOOL)pu_wantsNavigationBarVisible;
- (OKProducerPreset)currentPreset;
- (PUSlideshowThemeDelegate)delegate;
- (PUSlideshowThemeViewController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didFinish;
- (void)_didPickPreset:(id)a3;
- (void)_invalidateBackgroundView;
- (void)_invalidateSpec;
- (void)_invalidateTableView;
- (void)_setNeedsUpdateBackgroundView:(BOOL)a3;
- (void)_setNeedsUpdateSpec:(BOOL)a3;
- (void)_setNeedsUpdateTableView:(BOOL)a3;
- (void)_updateBackgroundViewIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateSpecIfNeeded;
- (void)_updateTableViewIfNeeded;
- (void)dealloc;
- (void)setCurrentPreset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewControllerSpec:(id)a3 didChange:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUSlideshowThemeViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPreset, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_presets, 0);
}

- (void)_setNeedsUpdateTableView:(BOOL)a3
{
  self->__needsUpdateTableView = a3;
}

- (BOOL)_needsUpdateTableView
{
  return self->__needsUpdateTableView;
}

- (void)_setNeedsUpdateBackgroundView:(BOOL)a3
{
  self->__needsUpdateBackgroundView = a3;
}

- (BOOL)_needsUpdateBackgroundView
{
  return self->__needsUpdateBackgroundView;
}

- (void)_setNeedsUpdateSpec:(BOOL)a3
{
  self->__needsUpdateSpec = a3;
}

- (BOOL)_needsUpdateSpec
{
  return self->__needsUpdateSpec;
}

- (void)setDelegate:(id)a3
{
}

- (PUSlideshowThemeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUSlideshowThemeDelegate *)WeakRetained;
}

- (OKProducerPreset)currentPreset
{
  return self->_currentPreset;
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 1;
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "traitCollectionChanged", a3))
  {
    [(PUSlideshowThemeViewController *)self setEdgesForExtendedLayout:[(PUSlideshowSettingsViewControllerSpec *)self->_spec rectEdgeForExtendedLayout]];
    [(PUSlideshowThemeViewController *)self _invalidateTableView];
    [(PUSlideshowThemeViewController *)self _invalidateBackgroundView];
    [(PUSlideshowThemeViewController *)self _updateIfNeeded];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  presets = self->_presets;
  uint64_t v8 = [v6 item];

  id v9 = [(NSArray *)presets objectAtIndexedSubscript:v8];
  [(PUSlideshowThemeViewController *)self _didPickPreset:v9];
  [(PUSlideshowThemeViewController *)self _didFinish];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PUSlideshowThemeDisclosureCell"];
  presets = self->_presets;
  uint64_t v9 = [v6 item];

  v10 = [(NSArray *)presets objectAtIndexedSubscript:v9];
  v11 = [v10 localizedName];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  v13 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec cellBackgroundColor];
  [v7 setBackgroundColor:v13];

  if ([(OKProducerPreset *)self->_currentPreset isEqual:v10]) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 0;
  }
  [v7 setAccessoryType:v14];

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_presets count];
}

- (void)_didPickPreset:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 themePicker:self didPickPreset:v7];
  }
}

- (void)_didFinish
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if ([(PUSlideshowSettingsViewControllerSpec *)self->_spec shouldUseBlurredBackground]) {
      self->_shouldHideTableViewWhenViewWillDisappear = 1;
    }
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 themePickerDidFinish:self];
  }
}

- (void)_updateTableViewIfNeeded
{
  if ([(PUSlideshowThemeViewController *)self _needsUpdateTableView])
  {
    [(PUSlideshowThemeViewController *)self _setNeedsUpdateTableView:0];
    tableView = self->_tableView;
    [(UITableView *)tableView reloadData];
  }
}

- (void)_updateBackgroundViewIfNeeded
{
  if ([(PUSlideshowThemeViewController *)self _needsUpdateBackgroundView])
  {
    [(PUSlideshowThemeViewController *)self _setNeedsUpdateBackgroundView:0];
    tableView = self->_tableView;
    v4 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec tableViewBackgroundColor];
    [(UITableView *)tableView setBackgroundColor:v4];

    char v5 = self->_tableView;
    id v6 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec tableViewHeaderView];
    [(UITableView *)v5 setTableHeaderView:v6];
  }
}

- (void)_updateSpecIfNeeded
{
  if ([(PUSlideshowThemeViewController *)self _needsUpdateSpec])
  {
    [(PUSlideshowThemeViewController *)self _setNeedsUpdateSpec:0];
    v3 = [(PUSlideshowThemeViewController *)self presentingViewController];
    v4 = [v3 traitCollection];

    spec = self->_spec;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PUSlideshowThemeViewController__updateSpecIfNeeded__block_invoke;
    v7[3] = &unk_1E5F2ECC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    [(PUViewControllerSpec *)spec performChanges:v7];
  }
}

uint64_t __53__PUSlideshowThemeViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setTraitCollection:*(void *)(a1 + 40)];
}

- (void)_updateIfNeeded
{
  if ([(PUSlideshowThemeViewController *)self _needsUpdate])
  {
    [(PUSlideshowThemeViewController *)self _updateSpecIfNeeded];
    [(PUSlideshowThemeViewController *)self _updateTableViewIfNeeded];
    [(PUSlideshowThemeViewController *)self _updateBackgroundViewIfNeeded];
    if ([(PUSlideshowThemeViewController *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PUSlideshowThemeViewController.m" lineNumber:168 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)_invalidateTableView
{
  [(PUSlideshowThemeViewController *)self _setNeedsUpdateTableView:1];
  [(PUSlideshowThemeViewController *)self _setNeedsUpdate];
}

- (void)_invalidateBackgroundView
{
  [(PUSlideshowThemeViewController *)self _setNeedsUpdateBackgroundView:1];
  [(PUSlideshowThemeViewController *)self _setNeedsUpdate];
}

- (void)_invalidateSpec
{
  [(PUSlideshowThemeViewController *)self _setNeedsUpdateSpec:1];
  [(PUSlideshowThemeViewController *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  if ([(PUSlideshowThemeViewController *)self _needsUpdateSpec]) {
    return 1;
  }
  return [(PUSlideshowThemeViewController *)self _needsUpdateBackgroundView];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowThemeViewController;
  [(PUSlideshowThemeViewController *)&v4 traitCollectionDidChange:a3];
  [(PUSlideshowThemeViewController *)self _invalidateSpec];
  [(PUSlideshowThemeViewController *)self _updateIfNeeded];
}

- (void)setCurrentPreset:(id)a3
{
  char v5 = (OKProducerPreset *)a3;
  if (self->_currentPreset != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_currentPreset, a3);
    [(UITableView *)self->_tableView reloadData];
    char v5 = v6;
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowThemeViewController;
  [(PUSlideshowThemeViewController *)&v6 viewDidLayoutSubviews];
  tableView = self->_tableView;
  objc_super v4 = [(PUSlideshowThemeViewController *)self view];
  [v4 bounds];
  -[UITableView setFrame:](tableView, "setFrame:");

  char v5 = [(PUSlideshowThemeViewController *)self navigationController];
  [(UITableView *)self->_tableView contentSize];
  objc_msgSend(v5, "setPreferredContentSize:");

  [(PUSlideshowThemeViewController *)self _invalidateSpec];
  [(PUSlideshowThemeViewController *)self _updateIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUSlideshowThemeViewController;
  [(PUSlideshowThemeViewController *)&v7 viewWillDisappear:a3];
  if ([(PUSlideshowSettingsViewControllerSpec *)self->_spec shouldUseBlurredBackground])
  {
    objc_super v4 = [(PUSlideshowThemeViewController *)self navigationController];
    char v5 = [v4 viewControllers];
    if ([v5 containsObject:self])
    {
      BOOL shouldHideTableViewWhenViewWillDisappear = self->_shouldHideTableViewWhenViewWillDisappear;

      if (!shouldHideTableViewWhenViewWillDisappear) {
        return;
      }
    }
    else
    {
    }
    [(UITableView *)self->_tableView setHidden:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowThemeViewController;
  [(PUSlideshowThemeViewController *)&v4 viewWillAppear:a3];
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:0];
  self->_BOOL shouldHideTableViewWhenViewWillDisappear = 0;
  [(UITableView *)self->_tableView setHidden:0];
  [(UITableView *)self->_tableView contentSize];
  -[PUSlideshowThemeViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(PUSlideshowThemeViewController *)self _invalidateSpec];
  [(PUSlideshowThemeViewController *)self _updateIfNeeded];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PUSlideshowThemeViewController;
  [(PUSlideshowThemeViewController *)&v11 viewDidLoad];
  v3 = [(PUSlideshowThemeViewController *)self navigationItem];
  objc_super v4 = PULocalizedString(@"SLIDESHOW_SETTINGS_NAVBAR_THEMES_TITLE");
  [v3 setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  objc_super v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v6;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"PUSlideshowThemeDisclosureCell"];
  id v8 = self->_tableView;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(UITableView *)v8 setTableFooterView:v9];

  v10 = [(PUSlideshowThemeViewController *)self view];
  [v10 addSubview:self->_tableView];
}

- (void)dealloc
{
  [(PUViewControllerSpec *)self->_spec unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowThemeViewController;
  [(PUSlideshowThemeViewController *)&v3 dealloc];
}

- (PUSlideshowThemeViewController)init
{
  v17.receiver = self;
  v17.super_class = (Class)PUSlideshowThemeViewController;
  v2 = [(PUSlideshowThemeViewController *)&v17 init];
  if (!v2) {
    return v2;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  objc_super v3 = (void *)getOKProducerPresetsManagerClass_softClass_87184;
  uint64_t v26 = getOKProducerPresetsManagerClass_softClass_87184;
  if (!getOKProducerPresetsManagerClass_softClass_87184)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getOKProducerPresetsManagerClass_block_invoke_87185;
    v21 = &unk_1E5F2E228;
    v22 = &v23;
    __getOKProducerPresetsManagerClass_block_invoke_87185((uint64_t)&v18);
    objc_super v3 = (void *)v24[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v23, 8);
  id v5 = [v4 defaultManager];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  objc_super v6 = (id *)getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_87186;
  uint64_t v26 = getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_87186;
  if (!getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_87186)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_block_invoke_87187;
    v21 = &unk_1E5F2E228;
    v22 = &v23;
    objc_super v7 = SlideshowKitLibrary_87188();
    id v8 = dlsym(v7, "kOKProducerPresetsFamilyPhotosPhone");
    *(void *)(v22[1] + 24) = v8;
    getkOKProducerPresetsFamilyPhotosPhoneSymbolLoc_ptr_87186 = *(void *)(v22[1] + 24);
    objc_super v6 = (id *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (v6)
  {
    id v9 = *v6;
    uint64_t v10 = [v5 presetsForFamily:v9];
    presets = v2->_presets;
    v2->_presets = (NSArray *)v10;

    v12 = objc_alloc_init(PUSlideshowSettingsViewControllerSpec);
    spec = v2->_spec;
    v2->_spec = v12;

    [(PUViewControllerSpec *)v2->_spec registerChangeObserver:v2];
    return v2;
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  v16 = [NSString stringWithUTF8String:"NSString *getkOKProducerPresetsFamilyPhotosPhone(void)"];
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, @"PUSlideshowThemeViewController.m", 23, @"%s", dlerror());

  __break(1u);
  return result;
}

@end