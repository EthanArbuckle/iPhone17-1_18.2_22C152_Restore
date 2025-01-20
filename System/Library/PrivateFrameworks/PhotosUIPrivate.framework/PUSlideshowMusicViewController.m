@interface PUSlideshowMusicViewController
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateBackgroundView;
- (BOOL)_needsUpdateSpec;
- (BOOL)_needsUpdateTableView;
- (BOOL)pu_wantsNavigationBarVisible;
- (PUSlideshowMediaItem)currentMediaItem;
- (PUSlideshowMusicDelegate)delegate;
- (PUSlideshowMusicViewController)init;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didFinish;
- (void)_didPickMediaItem:(id)a3;
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
- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4;
- (void)mediaPickerDidCancel:(id)a3;
- (void)setCurrentMediaItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewControllerSpec:(id)a3 didChange:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUSlideshowMusicViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentMediaItem, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
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

- (PUSlideshowMusicDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUSlideshowMusicDelegate *)WeakRetained;
}

- (PUSlideshowMediaItem)currentMediaItem
{
  return self->_currentMediaItem;
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 1;
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "traitCollectionChanged", a3))
  {
    [(PUSlideshowMusicViewController *)self setEdgesForExtendedLayout:[(PUSlideshowSettingsViewControllerSpec *)self->_spec rectEdgeForExtendedLayout]];
    [(PUSlideshowMusicViewController *)self _invalidateTableView];
    [(PUSlideshowMusicViewController *)self _invalidateBackgroundView];
    [(PUSlideshowMusicViewController *)self _updateIfNeeded];
  }
}

- (void)mediaPickerDidCancel:(id)a3
{
}

- (void)mediaPicker:(id)a3 didPickMediaItems:(id)a4
{
  id v8 = a3;
  if (a4)
  {
    v6 = [a4 representativeItem];
    id v7 = [[PUSlideshowMediaItem alloc] initWitMediaItem:v6];
    [(PUSlideshowMusicViewController *)self _didPickMediaItem:v7];
    [(UITableView *)self->_tableView reloadData];
  }
  [v8 dismissModalViewControllerWithTransition:2];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v7 = a4;
  id v8 = [a3 backgroundColor];
  [v7 setTintColor:v8];

  id v11 = [v7 textLabel];

  v9 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  [v11 setFont:v9];

  v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v11 setTintColor:v10];

  [v11 _setTextColorFollowsTintColor:1];
  [v11 setHidden:a5 != 0];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return PULocalizedString(@"SLIDESHOW_SETTINGS_THEMES_MUSIC_SECTION_TITLE");
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  [a3 deselectRowAtIndexPath:v8 animated:1];
  if ([v8 section])
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F31950]) initWithMediaTypes:1];
    [v6 setShowsItemsWithProtectedAssets:0];
    id v7 = [v6 view];
    [(UITableView *)self->_tableView frame];
    objc_msgSend(v7, "setFrame:");

    [(UITableView *)self->_tableView contentSize];
    objc_msgSend(v6, "setPreferredContentSize:");
    [v6 setDelegate:self];
    [v6 setShowsCloudItems:0];
    [v6 setModalPresentationStyle:3];
    [(PUSlideshowMusicViewController *)self presentModalViewController:v6 withTransition:1];
  }
  else
  {
    v6 = -[NSArray objectAtIndexedSubscript:](self->_mediaItems, "objectAtIndexedSubscript:", [v8 item]);
    [(PUSlideshowMusicViewController *)self _didPickMediaItem:v6];
    [(PUSlideshowMusicViewController *)self _didFinish];
  }
}

- (void)_didPickMediaItem:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_currentMediaItem, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 musicPicker:self didPickMediaItem:v8];
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
    [v6 musicPickerDidFinish:self];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (![v6 section])
  {
    id v8 = [v7 dequeueReusableCellWithIdentifier:@"PUSlideshowThemeMusicCell"];

    v13 = -[NSArray objectAtIndexedSubscript:](self->_mediaItems, "objectAtIndexedSubscript:", [v6 item]);
    v12 = [v13 localizedName];
    if ([(PUSlideshowMediaItem *)self->_currentMediaItem isEqual:v13]) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    goto LABEL_9;
  }
  id v8 = [v7 dequeueReusableCellWithIdentifier:@"PUSlideshowItunesMusicCell"];

  if (!v8)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PUSlideshowItunesMusicCell"];
    v9 = [v8 detailTextLabel];
    v10 = [v8 textLabel];
    id v11 = [v10 textColor];
    [v9 setTextColor:v11];
  }
  v12 = PULocalizedString(@"SLIDESHOW_SETTINGS_MUSIC_LIBRARY");
  if ([(PUSlideshowMediaItem *)self->_currentMediaItem type] == 1)
  {
    v13 = [v8 detailTextLabel];
    v14 = [(PUSlideshowMediaItem *)self->_currentMediaItem localizedName];
    [v13 setText:v14];

    uint64_t v15 = 1;
LABEL_9:

    goto LABEL_11;
  }
  uint64_t v15 = 1;
LABEL_11:
  [v8 setAccessoryType:v15];
  v16 = [v8 textLabel];
  [v16 setText:v12];

  v17 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec cellBackgroundColor];
  [v8 setBackgroundColor:v17];

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 1;
  }
  else {
    return [(NSArray *)self->_mediaItems count];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)_updateTableViewIfNeeded
{
  if ([(PUSlideshowMusicViewController *)self _needsUpdateTableView])
  {
    [(PUSlideshowMusicViewController *)self _setNeedsUpdateTableView:0];
    tableView = self->_tableView;
    [(UITableView *)tableView reloadData];
  }
}

- (void)_updateBackgroundViewIfNeeded
{
  if ([(PUSlideshowMusicViewController *)self _needsUpdateBackgroundView])
  {
    [(PUSlideshowMusicViewController *)self _setNeedsUpdateBackgroundView:0];
    tableView = self->_tableView;
    id v4 = [(PUSlideshowSettingsViewControllerSpec *)self->_spec tableViewBackgroundColor];
    [(UITableView *)tableView setBackgroundColor:v4];
  }
}

- (void)_updateSpecIfNeeded
{
  if ([(PUSlideshowMusicViewController *)self _needsUpdateSpec])
  {
    [(PUSlideshowMusicViewController *)self _setNeedsUpdateSpec:0];
    v3 = [(PUSlideshowMusicViewController *)self presentingViewController];
    id v4 = [v3 traitCollection];

    spec = self->_spec;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PUSlideshowMusicViewController__updateSpecIfNeeded__block_invoke;
    v7[3] = &unk_1E5F2ECC8;
    v7[4] = self;
    id v8 = v4;
    id v6 = v4;
    [(PUViewControllerSpec *)spec performChanges:v7];
  }
}

uint64_t __53__PUSlideshowMusicViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setTraitCollection:*(void *)(a1 + 40)];
}

- (void)_updateIfNeeded
{
  if ([(PUSlideshowMusicViewController *)self _needsUpdate])
  {
    [(PUSlideshowMusicViewController *)self _updateSpecIfNeeded];
    [(PUSlideshowMusicViewController *)self _updateTableViewIfNeeded];
    [(PUSlideshowMusicViewController *)self _updateBackgroundViewIfNeeded];
    if ([(PUSlideshowMusicViewController *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PUSlideshowMusicViewController.m" lineNumber:170 description:@"updates still needed after an update cycle"];
    }
  }
}

- (void)_invalidateTableView
{
  [(PUSlideshowMusicViewController *)self _setNeedsUpdateTableView:1];
  [(PUSlideshowMusicViewController *)self _setNeedsUpdate];
}

- (void)_invalidateBackgroundView
{
  [(PUSlideshowMusicViewController *)self _setNeedsUpdateBackgroundView:1];
  [(PUSlideshowMusicViewController *)self _setNeedsUpdate];
}

- (void)_invalidateSpec
{
  [(PUSlideshowMusicViewController *)self _setNeedsUpdateSpec:1];
  [(PUSlideshowMusicViewController *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  if ([(PUSlideshowMusicViewController *)self _needsUpdateSpec]) {
    return 1;
  }
  return [(PUSlideshowMusicViewController *)self _needsUpdateBackgroundView];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUSlideshowMusicViewController;
  [(PUSlideshowMusicViewController *)&v4 traitCollectionDidChange:a3];
  [(PUSlideshowMusicViewController *)self _invalidateSpec];
  [(PUSlideshowMusicViewController *)self _updateIfNeeded];
}

- (void)setCurrentMediaItem:(id)a3
{
  char v5 = (PUSlideshowMediaItem *)a3;
  if (self->_currentMediaItem != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_currentMediaItem, a3);
    [(UITableView *)self->_tableView reloadData];
    char v5 = v6;
  }
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PUSlideshowMusicViewController;
  [(PUSlideshowMusicViewController *)&v6 viewDidLayoutSubviews];
  tableView = self->_tableView;
  objc_super v4 = [(PUSlideshowMusicViewController *)self view];
  [v4 bounds];
  -[UITableView setFrame:](tableView, "setFrame:");

  char v5 = [(PUSlideshowMusicViewController *)self navigationController];
  [(UITableView *)self->_tableView contentSize];
  objc_msgSend(v5, "setPreferredContentSize:");

  [(PUSlideshowMusicViewController *)self _invalidateSpec];
  [(PUSlideshowMusicViewController *)self _updateIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUSlideshowMusicViewController;
  [(PUSlideshowMusicViewController *)&v7 viewWillDisappear:a3];
  if ([(PUSlideshowSettingsViewControllerSpec *)self->_spec shouldUseBlurredBackground])
  {
    objc_super v4 = [(PUSlideshowMusicViewController *)self navigationController];
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
  v4.super_class = (Class)PUSlideshowMusicViewController;
  [(PUSlideshowMusicViewController *)&v4 viewWillAppear:a3];
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:0];
  self->_BOOL shouldHideTableViewWhenViewWillDisappear = 0;
  [(UITableView *)self->_tableView setHidden:0];
  [(UITableView *)self->_tableView contentSize];
  -[PUSlideshowMusicViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(PUSlideshowMusicViewController *)self _invalidateSpec];
  [(PUSlideshowMusicViewController *)self _updateIfNeeded];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)PUSlideshowMusicViewController;
  [(PUSlideshowMusicViewController *)&v11 viewDidLoad];
  v3 = [(PUSlideshowMusicViewController *)self navigationItem];
  objc_super v4 = PULocalizedString(@"SLIDESHOW_SETTINGS_NAVBAR_MUSIC_TITLE");
  [v3 setTitle:v4];

  id v5 = objc_alloc(MEMORY[0x1E4FB1D00]);
  objc_super v6 = (UITableView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v6;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView registerClass:objc_opt_class() forCellReuseIdentifier:@"PUSlideshowThemeMusicCell"];
  id v8 = self->_tableView;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [(UITableView *)v8 setTableFooterView:v9];

  [(UITableView *)self->_tableView setSectionHeaderHeight:44.0];
  v10 = [(PUSlideshowMusicViewController *)self view];
  [v10 addSubview:self->_tableView];
}

- (void)dealloc
{
  [(PUViewControllerSpec *)self->_spec unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PUSlideshowMusicViewController;
  [(PUSlideshowMusicViewController *)&v3 dealloc];
}

- (PUSlideshowMusicViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUSlideshowMusicViewController;
  v2 = [(PUSlideshowMusicViewController *)&v8 initWithNibName:0 bundle:0];
  if (v2)
  {
    uint64_t v3 = +[PUSlideshowMediaItem mediaItemsForOKThemes];
    mediaItems = v2->_mediaItems;
    v2->_mediaItems = (NSArray *)v3;

    id v5 = objc_alloc_init(PUSlideshowSettingsViewControllerSpec);
    spec = v2->_spec;
    v2->_spec = v5;

    [(PUViewControllerSpec *)v2->_spec registerChangeObserver:v2];
  }
  return v2;
}

@end