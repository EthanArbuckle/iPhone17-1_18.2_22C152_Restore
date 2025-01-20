@interface ReaderFormatViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (ReaderFormatViewController)initWithReaderContext:(id)a3 provenance:(int64_t)a4;
- (SFReaderContext)readerContext;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)provenance;
- (void)_updateCloseButton;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ReaderFormatViewController

- (ReaderFormatViewController)initWithReaderContext:(id)a3 provenance:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ReaderFormatViewController;
  v8 = [(ReaderFormatViewController *)&v14 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = _WBSLocalizedString();
    [(ReaderFormatViewController *)v8 setTitle:v9];

    objc_storeStrong((id *)&v8->_readerContext, a3);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F3B040]) initWithReaderContext:v7];
    fontGroupController = v8->_fontGroupController;
    v8->_fontGroupController = (_SFSettingsAlertOptionsGroupController *)v10;

    v8->_provenance = a4;
    v12 = v8;
  }

  return v8;
}

- (void)loadView
{
  id v7 = (id)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSectionProvider:&__block_literal_global_70];
  id v3 = objc_alloc(MEMORY[0x1E4FB1568]);
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  v5 = (UICollectionView *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v7);
  collectionView = self->_collectionView;
  self->_collectionView = v5;

  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  [(UICollectionView *)self->_collectionView setAutoresizingMask:18];
  [(ReaderFormatViewController *)self setView:self->_collectionView];
}

id __38__ReaderFormatViewController_loadView__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB2050]) initWithAppearanceStyle:2 layoutEnvironment:v4];
  if (!a2)
  {
    [MEMORY[0x1E4F3AEA8] requiredHeight];
    objc_msgSend(v5, "setRowHeight:");
  }
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB2048]) initWithConfiguration:v5 layoutEnvironment:v4];

  return v6;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)ReaderFormatViewController;
  [(ReaderFormatViewController *)&v22 viewDidLoad];
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4F3AEA8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__ReaderFormatViewController_viewDidLoad__block_invoke;
  v19[3] = &unk_1E6D7EB10;
  objc_copyWeak(&v20, &location);
  id v4 = [v3 themeSelectorWithBlock:v19];
  themeSelector = self->_themeSelector;
  self->_themeSelector = v4;

  v6 = [(SFReaderContext *)self->_readerContext configurationManager];
  -[SFReaderAppearanceThemeSelector setSelectedTheme:](self->_themeSelector, "setSelectedTheme:", objc_msgSend(v6, "themeForAppearance:", -[SFReaderContext currentAppearance](self->_readerContext, "currentAppearance")));

  [(SFReaderAppearanceThemeSelector *)self->_themeSelector setAutoresizingMask:18];
  id v7 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v8 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __41__ReaderFormatViewController_viewDidLoad__block_invoke_2;
  v18[3] = &unk_1E6D7EB38;
  v18[4] = self;
  v9 = [v7 registrationWithCellClass:v8 configurationHandler:v18];
  cellRegistrations = self->_cellRegistrations;
  v11 = self->_cellRegistrations[0];
  self->_cellRegistrations[0] = v9;

  v12 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v13 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__ReaderFormatViewController_viewDidLoad__block_invoke_3;
  v16[3] = &unk_1E6D7EB60;
  objc_copyWeak(&v17, &location);
  uint64_t v14 = [v12 registrationWithCellClass:v13 configurationHandler:v16];
  v15 = cellRegistrations[1];
  cellRegistrations[1] = (UICollectionViewCellRegistration *)v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __41__ReaderFormatViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 127), "setReaderTheme:forAppearance:", objc_msgSend(v6, "selectedTheme"), objc_msgSend(*((id *)WeakRetained + 127), "currentAppearance"));
    v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v5, "_sf_didPerformFormatMenuAction:provenance:", 8, v4[128]);
  }
}

void __41__ReaderFormatViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 contentView];
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "isDescendantOfView:") & 1) == 0)
  {
    [v3 bounds];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "setFrame:");
    [v3 addSubview:*(void *)(*(void *)(a1 + 32) + 984)];
  }
}

void __41__ReaderFormatViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v10 = a2;
  id v6 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1948] cellConfiguration];
    v9 = [WeakRetained[124] attributedStringForValue:v6];
    [v8 setAttributedText:v9];

    [WeakRetained[124] prepareView:v10 forItem:v6 value:v6];
    [v10 setContentConfiguration:v8];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ReaderFormatViewController;
  [(ReaderFormatViewController *)&v9 viewWillAppear:a3];
  [(UICollectionView *)self->_collectionView reloadData];
  id v4 = [(_SFSettingsAlertOptionsGroupController *)self->_fontGroupController values];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__ReaderFormatViewController_viewWillAppear___block_invoke;
  v8[3] = &unk_1E6D7C088;
  v8[4] = self;
  uint64_t v5 = [v4 indexOfObjectPassingTest:v8];

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    collectionView = self->_collectionView;
    id v7 = [MEMORY[0x1E4F28D58] indexPathForItem:v5 inSection:1];
    [(UICollectionView *)collectionView selectItemAtIndexPath:v7 animated:0 scrollPosition:0];
  }
  [(ReaderFormatViewController *)self _updateCloseButton];
}

uint64_t __45__ReaderFormatViewController_viewWillAppear___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) isSelectedValue:a2];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ReaderFormatViewController;
  [(ReaderFormatViewController *)&v3 viewDidLayoutSubviews];
  [(ReaderFormatViewController *)self _updateCloseButton];
}

- (void)_updateCloseButton
{
  char v3 = [(ReaderFormatViewController *)self _isInPopoverPresentation];
  id v4 = [(ReaderFormatViewController *)self navigationItem];
  uint64_t v5 = [v4 rightBarButtonItem];

  if (v3)
  {
    if (v5) {
      [v4 setRightBarButtonItem:0];
    }
  }
  else if (!v5)
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v7 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __48__ReaderFormatViewController__updateCloseButton__block_invoke;
    uint64_t v13 = &unk_1E6D78C18;
    objc_copyWeak(&v14, &location);
    uint64_t v8 = [v7 actionWithTitle:&stru_1F3C268E8 image:0 identifier:0 handler:&v10];
    objc_super v9 = objc_msgSend(v6, "initWithBarButtonSystemItem:primaryAction:", 24, v8, v10, v11, v12, v13);
    [v4 setRightBarButtonItem:v9];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __48__ReaderFormatViewController__updateCloseButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 2;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (a4 == 2) {
    return 0;
  }
  if (a4 != 1) {
    return 1;
  }
  id v4 = [(_SFSettingsAlertOptionsGroupController *)self->_fontGroupController values];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == 1)
  {
    uint64_t v10 = [(_SFSettingsAlertOptionsGroupController *)self->_fontGroupController values];
    uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

    objc_super v9 = [v6 dequeueConfiguredReusableCellWithRegistration:self->_cellRegistrations[1] forIndexPath:v7 item:v11];
  }
  else if (v8)
  {
    objc_super v9 = 0;
  }
  else
  {
    objc_super v9 = [v6 dequeueConfiguredReusableCellWithRegistration:self->_cellRegistrations[0] forIndexPath:v7 item:&unk_1F3C73B78];
  }

  return v9;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 section] == 1)
  {
    id v7 = [v5 cellForItemAtIndexPath:v6];
    char v8 = [v7 isEnabled];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v9 = a4;
  if ([v9 section] == 1)
  {
    fontGroupController = self->_fontGroupController;
    id v6 = [(_SFSettingsAlertOptionsGroupController *)fontGroupController values];
    id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v9, "item"));
    [(_SFSettingsAlertOptionsGroupController *)fontGroupController setSelectedValue:v7];

    char v8 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v8, "_sf_didPerformFormatMenuAction:provenance:", 7, self->_provenance);
  }
}

- (SFReaderContext)readerContext
{
  return self->_readerContext;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerContext, 0);
  for (uint64_t i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_cellRegistrations[i], 0);
  objc_storeStrong((id *)&self->_fontGroupController, 0);
  objc_storeStrong((id *)&self->_themeSelector, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end