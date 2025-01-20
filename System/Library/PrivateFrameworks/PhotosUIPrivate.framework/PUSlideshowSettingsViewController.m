@interface PUSlideshowSettingsViewController
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateMediaItem;
- (BOOL)_needsUpdateMusicOn;
- (BOOL)_needsUpdateNavigationBar;
- (BOOL)_needsUpdatePreset;
- (BOOL)_needsUpdateSpec;
- (BOOL)_needsUpdateTableView;
- (OKProducerPreset)_pendingPreset;
- (PUSlideshowMediaItem)_pendingMediaItem;
- (PUSlideshowSettingsViewController)initWithSession:(id)a3;
- (PUSlideshowSettingsViewControllerDelegate)delegate;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)PUSlideshowSpeedCell:(id)a3 stepDurationDidChange:(double)a4;
- (void)_didTapDoneButton:(id)a3;
- (void)_invalidateMediaItem;
- (void)_invalidateMusicOn;
- (void)_invalidateNavigationBar;
- (void)_invalidatePreset;
- (void)_invalidateSpec;
- (void)_invalidateTableView;
- (void)_setNeedsUpdateMediaItem:(BOOL)a3;
- (void)_setNeedsUpdateMusicOn:(BOOL)a3;
- (void)_setNeedsUpdateNavigationBar:(BOOL)a3;
- (void)_setNeedsUpdatePreset:(BOOL)a3;
- (void)_setNeedsUpdateSpec:(BOOL)a3;
- (void)_setNeedsUpdateTableView:(BOOL)a3;
- (void)_setPendingMediaItem:(id)a3;
- (void)_setPendingPreset:(id)a3;
- (void)_synchronizedChangedSettings;
- (void)_toggleMusic:(id)a3;
- (void)_toggleRepeat:(id)a3;
- (void)_updateIfNeeded;
- (void)_updateMediaItemIfNeeded;
- (void)_updateMusicOnIfNeeded;
- (void)_updateNavigationBarIfNeeded;
- (void)_updatePresetIfNeeded;
- (void)_updateSpecIfNeeded;
- (void)_updateTableViewIfNeeded;
- (void)dealloc;
- (void)musicPicker:(id)a3 didPickMediaItem:(id)a4;
- (void)musicPickerDidFinish:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)themePicker:(id)a3 didPickPreset:(id)a4;
- (void)themePickerDidFinish:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewControllerSpec:(id)a3 didChange:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUSlideshowSettingsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pendingMediaItem, 0);
  objc_storeStrong((id *)&self->__pendingPreset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_settingsViewModel, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (PUSlideshowMediaItem)_pendingMediaItem
{
  return self->__pendingMediaItem;
}

- (OKProducerPreset)_pendingPreset
{
  return self->__pendingPreset;
}

- (void)_setNeedsUpdateMusicOn:(BOOL)a3
{
  self->__needsUpdateMusicOn = a3;
}

- (BOOL)_needsUpdateMusicOn
{
  return self->__needsUpdateMusicOn;
}

- (void)_setNeedsUpdateMediaItem:(BOOL)a3
{
  self->__needsUpdateMediaItem = a3;
}

- (BOOL)_needsUpdateMediaItem
{
  return self->__needsUpdateMediaItem;
}

- (void)_setNeedsUpdatePreset:(BOOL)a3
{
  self->__needsUpdatePreset = a3;
}

- (BOOL)_needsUpdatePreset
{
  return self->__needsUpdatePreset;
}

- (void)_setNeedsUpdateNavigationBar:(BOOL)a3
{
  self->__needsUpdateNavigationBar = a3;
}

- (BOOL)_needsUpdateNavigationBar
{
  return self->__needsUpdateNavigationBar;
}

- (void)_setNeedsUpdateTableView:(BOOL)a3
{
  self->__needsUpdateTableView = a3;
}

- (BOOL)_needsUpdateTableView
{
  return self->__needsUpdateTableView;
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

- (PUSlideshowSettingsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUSlideshowSettingsViewControllerDelegate *)WeakRetained;
}

- (void)PUSlideshowSpeedCell:(id)a3 stepDurationDidChange:(double)a4
{
  settingsViewModel = self->_settingsViewModel;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__PUSlideshowSettingsViewController_PUSlideshowSpeedCell_stepDurationDidChange___block_invoke;
  v5[3] = &unk_1E5F2E0A8;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  [(PUViewModel *)settingsViewModel performChanges:v5];
}

uint64_t __80__PUSlideshowSettingsViewController_PUSlideshowSpeedCell_stepDurationDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setStepDuration:*(double *)(a1 + 40)];
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __111__PUSlideshowSettingsViewController_presentationController_willPresentWithAdaptiveStyle_transitionCoordinator___block_invoke;
  v9[3] = &unk_1E5F2C068;
  objc_copyWeak(&v10, &location);
  [v8 animateAlongsideTransition:0 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __111__PUSlideshowSettingsViewController_presentationController_willPresentWithAdaptiveStyle_transitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateSpec];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateIfNeeded];
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = a3;
  [(PUSlideshowSettingsViewController *)self _synchronizedChangedSettings];
  [v4 setDelegate:0];
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "traitCollectionChanged", a3))
  {
    [(PUSlideshowSettingsViewController *)self _invalidateTableView];
    [(PUSlideshowSettingsViewController *)self _invalidateNavigationBar];
    [(PUSlideshowSettingsViewController *)self _updateIfNeeded];
  }
}

- (void)musicPickerDidFinish:(id)a3
{
  id v4 = [(PUSlideshowSettingsViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)musicPicker:(id)a3 didPickMediaItem:(id)a4
{
  id v5 = a4;
  [(PUSlideshowSettingsViewController *)self _setPendingMediaItem:v5];
  settingsViewModel = self->_settingsViewModel;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PUSlideshowSettingsViewController_musicPicker_didPickMediaItem___block_invoke;
  v8[3] = &unk_1E5F2ECC8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(PUViewModel *)settingsViewModel performChanges:v8];
}

uint64_t __66__PUSlideshowSettingsViewController_musicPicker_didPickMediaItem___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setMediaItem:*(void *)(a1 + 40)];
}

- (void)themePickerDidFinish:(id)a3
{
  id v4 = [(PUSlideshowSettingsViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)themePicker:(id)a3 didPickPreset:(id)a4
{
  id v7 = a4;
  id v5 = [(PUSlideshowSettingsViewModel *)self->_settingsViewModel mediaItem];
  if ([v5 type] == 2)
  {
    id v6 = [[PUSlideshowMediaItem alloc] initWitPreset:v7];
    [(PUSlideshowSettingsViewController *)self _setPendingMediaItem:v6];
  }
  [(PUSlideshowSettingsViewController *)self _setPendingPreset:v7];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (self->_settingsViewModel == a3 && [a4 musicOnDidChange])
  {
    [(PUSlideshowSettingsViewController *)self _invalidateMusicOn];
    [(PUSlideshowSettingsViewController *)self _updateIfNeeded];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  int v7 = [v6 section];
  if (v7 == 1)
  {
    id v8 = objc_alloc_init(PUSlideshowMusicViewController);
    id v9 = [(PUSlideshowSettingsViewController *)self _pendingMediaItem];
    [(PUSlideshowMusicViewController *)v8 setCurrentMediaItem:v9];
  }
  else
  {
    if (v7) {
      goto LABEL_8;
    }
    id v8 = objc_alloc_init(PUSlideshowThemeViewController);
    id v9 = [(PUSlideshowSettingsViewController *)self _pendingPreset];
    [(PUSlideshowMusicViewController *)v8 setCurrentPreset:v9];
  }

  [(PUSlideshowMusicViewController *)v8 setDelegate:self];
  if ([(PUSlideshowSettingsViewControllerSpec *)self->_spec shouldUseBlurredBackground]) {
    self->_shouldHideTableViewWhenViewWillDisappear = 1;
  }
  id v10 = [(PUSlideshowSettingsViewController *)self navigationController];
  [v10 pushViewController:v8 animated:1];

LABEL_8:
  [v11 deselectRowAtIndexPath:v6 animated:0];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [v8 section];
  id v10 = [(PUSlideshowSettingsViewController *)self _pendingPreset];
  switch(v9)
  {
    case 0:
      id v11 = [v7 dequeueReusableCellWithIdentifier:@"SlideshowSettingsViewControllerSubtitleCellIdentifier"];
      if (!v11)
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"SlideshowSettingsViewControllerSubtitleCellIdentifier"];
        [v11 setAccessoryType:1];
        v12 = [v11 detailTextLabel];
        v13 = [v11 textLabel];
        v14 = [v13 textColor];
        [v12 setTextColor:v14];
      }
      v15 = [v11 textLabel];
      v16 = PULocalizedString(@"SLIDESHOW_SETTINGS_THEME");
      [v15 setText:v16];

      uint64_t v17 = 1024;
      goto LABEL_10;
    case 1:
      id v11 = [v7 dequeueReusableCellWithIdentifier:@"SlideshowSettingsViewControllerSubtitleCellIdentifier"];
      if (!v11)
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"SlideshowSettingsViewControllerSubtitleCellIdentifier"];
        [v11 setAccessoryType:1];
        v20 = [v11 detailTextLabel];
        v21 = [v11 textLabel];
        v22 = [v21 textColor];
        [v20 setTextColor:v22];
      }
      v23 = [v11 textLabel];
      v24 = PULocalizedString(@"SLIDESHOW_SETTINGS_SELECTED_MUSIC");
      [v23 setText:v24];

      uint64_t v17 = 1032;
LABEL_10:
      v19 = [*(id *)((char *)&self->super.super.super.isa + v17) localizedName];
      v25 = [v11 detailTextLabel];
      [v25 setText:v19];
      goto LABEL_15;
    case 2:
      v18 = [v7 dequeueReusableCellWithIdentifier:@"SlideshowSettingsViewControllerRepeatCellIdentifier"];
      if (v18)
      {
        id v11 = v18;
        v19 = [v18 accessoryView];
      }
      else
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"SlideshowSettingsViewControllerRepeatCellIdentifier"];
        v19 = (PUSlideshowSpeedCell *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
        [(PUSlideshowSpeedCell *)v19 setOn:[(PUSlideshowSettingsViewModel *)self->_settingsViewModel shouldRepeat]];
        [(PUSlideshowSpeedCell *)v19 addTarget:self action:sel__toggleRepeat_ forControlEvents:4096];
        [v11 setAccessoryView:v19];
        [v11 setSelectionStyle:0];
      }
      -[PUSlideshowSpeedCell setEnabled:](v19, "setEnabled:", [v10 supportsSettingType:1]);
      v25 = [v11 textLabel];
      v27 = PULocalizedString(@"SLIDESHOW_SETTINGS_REPEAT");
      [v25 setText:v27];

LABEL_15:
      goto LABEL_19;
    case 3:
      v26 = [v7 dequeueReusableCellWithIdentifier:@"SlideshowSettingsViewControllerSpeedCellIdentifier"];
      if (v26)
      {
        v19 = v26;
      }
      else
      {
        v28 = [[PUSlideshowSpeedCell alloc] initWithStyle:0 reuseIdentifier:@"SlideshowSettingsViewControllerSpeedCellIdentifier"];
        v29 = [MEMORY[0x1E4FB1618] clearColor];
        [(PUSlideshowSpeedCell *)v28 setBackgroundColor:v29];

        [(PUSlideshowSpeedCell *)v28 setDelegate:self];
        v19 = v28;
        if (!v19)
        {
          v32 = [MEMORY[0x1E4F28B00] currentHandler];
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          [v32 handleFailureInMethod:a2, self, @"PUSlideshowSettingsViewController.m", 397, @"%@ should be an instance inheriting from %@, but it is nil", @"cell", v34 object file lineNumber description];
          goto LABEL_24;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_18;
      }
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      v35 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v35);
      v36 = [(PUSlideshowSpeedCell *)v19 px_descriptionForAssertionMessage];
      [v32 handleFailureInMethod:a2, self, @"PUSlideshowSettingsViewController.m", 397, @"%@ should be an instance inheriting from %@, but it is %@", @"cell", v34, v36 object file lineNumber description];

LABEL_24:
LABEL_18:
      [(PUSlideshowSettingsViewModel *)self->_settingsViewModel stepDuration];
      -[PUSlideshowSpeedCell setStepDuration:](v19, "setStepDuration:");
      -[PUSlideshowSpeedCell setEnabled:](v19, "setEnabled:", [v10 supportsSettingType:2]);
      [(PUSlideshowSpeedCell *)v19 setNeedsUpdateConstraints];
      [(PUSlideshowSpeedCell *)v19 updateConstraintsIfNeeded];
      id v11 = v19;
LABEL_19:

      v30 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec cellBackgroundColor];
      [v11 setBackgroundColor:v30];

      [v11 setNeedsLayout];
      [v11 layoutIfNeeded];

      return v11;
    default:
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2 object:self file:@"PUSlideshowSettingsViewController.m" lineNumber:408 description:@"Code which should be unreachable has been reached"];

      abort();
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (void)_toggleMusic:(id)a3
{
  char v4 = [a3 isOn];
  settingsViewModel = self->_settingsViewModel;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PUSlideshowSettingsViewController__toggleMusic___block_invoke;
  v6[3] = &unk_1E5F2E120;
  v6[4] = self;
  char v7 = v4;
  [(PUViewModel *)settingsViewModel performChanges:v6];
}

uint64_t __50__PUSlideshowSettingsViewController__toggleMusic___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setMusicOn:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_toggleRepeat:(id)a3
{
  char v4 = [a3 isOn];
  settingsViewModel = self->_settingsViewModel;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PUSlideshowSettingsViewController__toggleRepeat___block_invoke;
  v6[3] = &unk_1E5F2E120;
  v6[4] = self;
  char v7 = v4;
  [(PUViewModel *)settingsViewModel performChanges:v6];
}

uint64_t __51__PUSlideshowSettingsViewController__toggleRepeat___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setShouldRepeat:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_didTapDoneButton:(id)a3
{
  [(PUSlideshowSettingsViewController *)self _synchronizedChangedSettings];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 settingsDidFinished:self];
    }
  }
}

- (void)_synchronizedChangedSettings
{
  pendingPreset = self->__pendingPreset;
  if (pendingPreset)
  {
    char v4 = [(PUSlideshowSettingsViewModel *)self->_settingsViewModel preset];
    char v5 = [(OKProducerPreset *)pendingPreset isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = [(PUSlideshowSession *)self->_session viewModel];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__PUSlideshowSettingsViewController__synchronizedChangedSettings__block_invoke;
      v13[3] = &unk_1E5F2ED10;
      id v7 = v6;
      id v14 = v7;
      [v7 performChanges:v13];
      pendingMediaItem = self->__pendingMediaItem;
      if (pendingMediaItem)
      {
        int v9 = [(PUSlideshowSettingsViewModel *)self->_settingsViewModel mediaItem];
        LOBYTE(pendingMediaItem) = ![(PUSlideshowMediaItem *)pendingMediaItem isEqual:v9];
      }
      settingsViewModel = self->_settingsViewModel;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __65__PUSlideshowSettingsViewController__synchronizedChangedSettings__block_invoke_2;
      v11[3] = &unk_1E5F2E120;
      v11[4] = self;
      char v12 = (char)pendingMediaItem;
      [(PUViewModel *)settingsViewModel performChanges:v11];
    }
  }
}

uint64_t __65__PUSlideshowSettingsViewController__synchronizedChangedSettings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentState:4];
}

uint64_t __65__PUSlideshowSettingsViewController__synchronizedChangedSettings__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 984) setPreset:*(void *)(*(void *)(a1 + 32) + 1024)];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    char v4 = *(void **)(v3 + 984);
    uint64_t v5 = *(void *)(v3 + 1032);
    return [v4 setMediaItem:v5];
  }
  return result;
}

- (void)_updateMusicOnIfNeeded
{
  if ([(PUSlideshowSettingsViewController *)self _needsUpdateMusicOn])
  {
    [(PUSlideshowSettingsViewController *)self _setNeedsUpdateMusicOn:0];
    id v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [(UITableView *)self->_tableView reloadSections:v3 withRowAnimation:100];
  }
}

- (void)_updateMediaItemIfNeeded
{
  if ([(PUSlideshowSettingsViewController *)self _needsUpdateMediaItem])
  {
    [(PUSlideshowSettingsViewController *)self _setNeedsUpdateMediaItem:0];
    id v3 = [MEMORY[0x1E4F28D60] indexSetWithIndex:1];
    [(UITableView *)self->_tableView reloadSections:v3 withRowAnimation:100];
  }
}

- (void)_updatePresetIfNeeded
{
  if ([(PUSlideshowSettingsViewController *)self _needsUpdatePreset])
  {
    [(PUSlideshowSettingsViewController *)self _setNeedsUpdatePreset:0];
    tableView = self->_tableView;
    [(UITableView *)tableView reloadData];
  }
}

- (void)_updateNavigationBarIfNeeded
{
  if ([(PUSlideshowSettingsViewController *)self _needsUpdateNavigationBar])
  {
    [(PUSlideshowSettingsViewController *)self _setNeedsUpdateNavigationBar:0];
    BOOL v3 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec shouldShowNavigationBar];
    id v4 = [(PUSlideshowSettingsViewController *)self navigationController];
    [v4 setNavigationBarHidden:!v3];
  }
}

- (void)_updateTableViewIfNeeded
{
  if ([(PUSlideshowSettingsViewController *)self _needsUpdateTableView])
  {
    [(PUSlideshowSettingsViewController *)self _setNeedsUpdateTableView:0];
    tableView = self->_tableView;
    id v4 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec tableViewBackgroundColor];
    [(UITableView *)tableView setBackgroundColor:v4];

    uint64_t v5 = self->_tableView;
    id v6 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec tableViewHeaderView];
    [(UITableView *)v5 setTableHeaderView:v6];

    id v7 = self->_tableView;
    [(UITableView *)v7 reloadData];
  }
}

- (void)_updateSpecIfNeeded
{
  if ([(PUSlideshowSettingsViewController *)self _needsUpdateSpec])
  {
    [(PUSlideshowSettingsViewController *)self _setNeedsUpdateSpec:0];
    BOOL v3 = [(PUSlideshowSettingsViewController *)self presentingViewController];
    id v4 = [v3 traitCollection];

    spec = self->_spec;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__PUSlideshowSettingsViewController__updateSpecIfNeeded__block_invoke;
    v7[3] = &unk_1E5F2ECC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    [(PUViewControllerSpec *)spec performChanges:v7];
  }
}

uint64_t __56__PUSlideshowSettingsViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setTraitCollection:*(void *)(a1 + 40)];
}

- (void)_updateIfNeeded
{
  if ([(PUSlideshowSettingsViewController *)self _needsUpdate])
  {
    [(PUSlideshowSettingsViewController *)self _updateSpecIfNeeded];
    [(PUSlideshowSettingsViewController *)self _updateTableViewIfNeeded];
    [(PUSlideshowSettingsViewController *)self _updateNavigationBarIfNeeded];
    [(PUSlideshowSettingsViewController *)self _updatePresetIfNeeded];
    [(PUSlideshowSettingsViewController *)self _updateMediaItemIfNeeded];
    [(PUSlideshowSettingsViewController *)self _updateMusicOnIfNeeded];
    if ([(PUSlideshowSettingsViewController *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PUSlideshowSettingsViewController.m" lineNumber:213 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)_invalidateMusicOn
{
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdateMusicOn:1];
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdate];
}

- (void)_invalidateMediaItem
{
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdateMediaItem:1];
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdate];
}

- (void)_invalidatePreset
{
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdatePreset:1];
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdate];
}

- (void)_invalidateNavigationBar
{
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdateNavigationBar:1];
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdate];
}

- (void)_invalidateTableView
{
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdateTableView:1];
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdate];
}

- (void)_invalidateSpec
{
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdateSpec:1];
  [(PUSlideshowSettingsViewController *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  if ([(PUSlideshowSettingsViewController *)self _needsUpdateSpec]
    || [(PUSlideshowSettingsViewController *)self _needsUpdateTableView]
    || [(PUSlideshowSettingsViewController *)self _needsUpdateNavigationBar]
    || [(PUSlideshowSettingsViewController *)self _needsUpdatePreset])
  {
    return 1;
  }
  return [(PUSlideshowSettingsViewController *)self _needsUpdateMusicOn];
}

- (void)_setPendingMediaItem:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->__pendingMediaItem] & 1) == 0)
  {
    objc_storeStrong((id *)&self->__pendingMediaItem, a3);
    [(PUSlideshowSettingsViewController *)self _invalidateMediaItem];
    [(PUSlideshowSettingsViewController *)self _updateIfNeeded];
  }
}

- (void)_setPendingPreset:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->__pendingPreset] & 1) == 0)
  {
    objc_storeStrong((id *)&self->__pendingPreset, a3);
    [(PUSlideshowSettingsViewController *)self _invalidatePreset];
    [(PUSlideshowSettingsViewController *)self _updateIfNeeded];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowSettingsViewController;
  [(PUSlideshowSettingsViewController *)&v4 traitCollectionDidChange:a3];
  [(PUSlideshowSettingsViewController *)self _invalidateSpec];
  [(PUSlideshowSettingsViewController *)self _updateIfNeeded];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewController;
  [(PUSlideshowSettingsViewController *)&v3 viewDidLayoutSubviews];
  [(UITableView *)self->_tableView contentSize];
  -[PUSlideshowSettingsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowSettingsViewController;
  [(PUSlideshowSettingsViewController *)&v4 viewWillDisappear:a3];
  [(UITableView *)self->_tableView setHidden:self->_shouldHideTableViewWhenViewWillDisappear];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowSettingsViewController;
  [(PUSlideshowSettingsViewController *)&v6 viewWillAppear:a3];
  self->_shouldHideTableViewWhenViewWillDisappear = 0;
  [(UITableView *)self->_tableView setHidden:0];
  objc_super v4 = [(PUSlideshowSettingsViewController *)self navigationController];
  id v5 = [v4 popoverPresentationController];

  [v5 setDelegate:self];
  [(PUSlideshowSettingsViewController *)self _invalidateSpec];
  [(PUSlideshowSettingsViewController *)self _invalidateNavigationBar];
  [(PUSlideshowSettingsViewController *)self _updateIfNeeded];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PUSlideshowSettingsViewController;
  [(PUSlideshowSettingsViewController *)&v12 viewDidLoad];
  objc_super v3 = [(PUSlideshowSettingsViewController *)self navigationItem];
  objc_super v4 = PULocalizedString(@"SLIDESHOW_SETTINGS_NAVBAR_TITLE");
  [v3 setTitle:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__didTapDoneButton_];
  objc_super v6 = [(PUSlideshowSettingsViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v8 = [(PUSlideshowSettingsViewController *)self view];
  [v8 bounds];
  int v9 = (UITableView *)objc_msgSend(v7, "initWithFrame:");
  tableView = self->_tableView;
  self->_tableView = v9;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  id v11 = [(PUSlideshowSettingsViewController *)self view];
  [v11 addSubview:self->_tableView];
}

- (void)dealloc
{
  [(PUSlideshowSettingsViewModel *)self->_settingsViewModel unregisterChangeObserver:self];
  [(PUViewControllerSpec *)self->_spec unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowSettingsViewController;
  [(PUSlideshowSettingsViewController *)&v3 dealloc];
}

- (PUSlideshowSettingsViewController)initWithSession:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PUSlideshowSettingsViewController;
  objc_super v6 = [(PUSlideshowSettingsViewController *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    uint64_t v8 = [(PUSlideshowSession *)v7->_session settingsViewModel];
    settingsViewModel = v7->_settingsViewModel;
    v7->_settingsViewModel = (PUSlideshowSettingsViewModel *)v8;

    [(PUSlideshowSettingsViewModel *)v7->_settingsViewModel registerChangeObserver:v7];
    id v10 = objc_alloc_init(PUSlideshowSettingsViewControllerSpec);
    spec = v7->_spec;
    v7->_spec = v10;

    [(PUViewControllerSpec *)v7->_spec registerChangeObserver:v7];
    objc_super v12 = [(PUSlideshowSettingsViewModel *)v7->_settingsViewModel preset];
    [(PUSlideshowSettingsViewController *)v7 _setPendingPreset:v12];

    v13 = [(PUSlideshowSettingsViewModel *)v7->_settingsViewModel mediaItem];
    [(PUSlideshowSettingsViewController *)v7 _setPendingMediaItem:v13];
  }
  return v7;
}

@end