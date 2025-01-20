@interface VUISeasonPickerViewController
- (BOOL)lastViewedSeasonWasManuallyDeleted;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (UIViewController)currentSeasonViewController;
- (VUIFamilyMember)familyMember;
- (VUIMediaEntitiesDataSource)dataSource;
- (VUISeasonPickerViewController)initWithDataSource:(id)a3;
- (VUIViewControllerContentPresenter)contentPresenter;
- (_VUISeasonPickerView)seasonPickerView;
- (id)_createDiffableDataSource;
- (id)_createDiffableDataSourceSnapshot;
- (id)_getSeasonIdentifiersFromSeasons;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)loadView;
- (void)setContentPresenter:(id)a3;
- (void)setCurrentSeasonViewController:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setLastViewedSeasonWasManuallyDeleted:(BOOL)a3;
- (void)setSeasonPickerView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation VUISeasonPickerViewController

- (VUISeasonPickerViewController)initWithDataSource:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUISeasonPickerViewController;
  v6 = [(VUISeasonPickerViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = objc_alloc_init(VUIViewControllerContentPresenter);
    contentPresenter = v7->_contentPresenter;
    v7->_contentPresenter = v8;

    [(VUIViewControllerContentPresenter *)v7->_contentPresenter setLogName:@"VUISeasonPickerViewController"];
  }

  return v7;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)VUISeasonPickerViewController;
  [(VUISeasonPickerViewController *)&v23 viewDidLoad];
  v3 = [(VUISeasonPickerViewController *)self navigationItem];
  [v3 _setSupportsTwoLineLargeTitles:1];
  v4 = [_VUISeasonPickerView alloc];
  id v5 = -[_VUISeasonPickerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  seasonPickerView = self->_seasonPickerView;
  self->_seasonPickerView = v5;

  v7 = [(_VUISeasonPickerView *)self->_seasonPickerView collectionView];
  [v7 setDelegate:self];

  v8 = [(_VUISeasonPickerView *)self->_seasonPickerView collectionView];
  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VUISeasonPickerCollectionViewCellIdentifier"];

  [(_VUISeasonPickerView *)self->_seasonPickerView setAutoresizingMask:18];
  [(VUIViewControllerContentPresenter *)self->_contentPresenter setContentView:self->_seasonPickerView];
  contentPresenter = self->_contentPresenter;
  v10 = +[VUILocalizationManager sharedInstance];
  objc_super v11 = [v10 localizedStringForKey:@"LIBRARY_GENERIC_FETCH_ERROR_TITLE"];
  [(VUIViewControllerContentPresenter *)contentPresenter setNoContentErrorTitle:v11];

  [(VUIViewControllerContentPresenter *)self->_contentPresenter setCurrentContentViewType:1];
  v12 = NSString;
  v13 = +[VUILocalizationManager sharedInstance];
  v14 = [v13 localizedStringForKey:@"GENERIC_DELETED_ERROR_MESSAGE_FORMAT"];
  v15 = [(VUISeasonPickerViewController *)self title];
  v16 = [v12 stringWithValidatedFormat:v14, @"%@", 0, v15 validFormatSpecifiers error];

  [(VUIViewControllerContentPresenter *)self->_contentPresenter setDeletedContentErrorMessage:v16];
  v17 = [(VUISeasonPickerViewController *)self _createDiffableDataSource];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v17;

  v19 = [(VUISeasonPickerViewController *)self dataSource];
  [v19 setDelegate:self];

  v20 = [(VUISeasonPickerViewController *)self dataSource];
  [v20 startFetch];

  v21 = [(VUISeasonPickerViewController *)self view];
  v22 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"SeasonPicker\""];
  [v21 setAccessibilityIdentifier:v22];
}

- (void)viewWillAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)VUISeasonPickerViewController;
  -[VUISeasonPickerViewController viewWillAppear:](&v18, sel_viewWillAppear_);
  id v5 = [(_VUISeasonPickerView *)self->_seasonPickerView collectionView];
  v6 = [v5 indexPathsForSelectedItems];
  v7 = [v6 firstObject];

  if (v7)
  {
    v8 = [(VUISeasonPickerViewController *)self transitionCoordinator];
    if (v8)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __48__VUISeasonPickerViewController_viewWillAppear___block_invoke;
      v14[3] = &unk_1E6DF3E68;
      id v15 = v5;
      id v16 = v7;
      BOOL v17 = a3;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __48__VUISeasonPickerViewController_viewWillAppear___block_invoke_2;
      v11[3] = &unk_1E6DF3E90;
      id v12 = v15;
      id v13 = v16;
      [v8 animateAlongsideTransition:v14 completion:v11];
    }
    else
    {
      [v5 deselectItemAtIndexPath:v7 animated:1];
    }
  }
  v9 = [(VUISeasonPickerViewController *)self currentSeasonViewController];
  v10 = [v9 contentPresenter];
  -[VUISeasonPickerViewController setLastViewedSeasonWasManuallyDeleted:](self, "setLastViewedSeasonWasManuallyDeleted:", [v10 contentHasBeenManuallyDeleted]);

  [(VUISeasonPickerViewController *)self setCurrentSeasonViewController:0];
}

uint64_t __48__VUISeasonPickerViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __48__VUISeasonPickerViewController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 selectItemAtIndexPath:v5 animated:0 scrollPosition:0];
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VUISeasonPickerViewController;
  [(VUISeasonPickerViewController *)&v3 viewDidAppear:a3];
  +[VUILibraryMetrics recordPageEventWithPageType:@"LibrarySeasonPicker"];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)VUISeasonPickerViewController;
  [(VUISeasonPickerViewController *)&v4 loadView];
  objc_super v3 = [(VUISeasonPickerViewController *)self contentPresenter];
  [v3 setRootViewForViewController:self];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUISeasonPickerViewController;
  [(VUISeasonPickerViewController *)&v5 viewWillLayoutSubviews];
  objc_super v3 = [(VUISeasonPickerViewController *)self contentPresenter];
  objc_super v4 = [(VUISeasonPickerViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "configureCurrentViewFrameForBounds:");
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  if (!self->_sizingCell)
  {
    v7 = objc_alloc_init(VUISeasonPickerCollectionViewCell);
    sizingCell = self->_sizingCell;
    self->_sizingCell = v7;
  }
  v9 = [(VUISeasonPickerViewController *)self dataSource];
  v10 = [v9 mediaEntities];
  objc_super v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v6, "row"));

  id v12 = self->_sizingCell;
  id v13 = [(VUISeasonPickerViewController *)self traitCollection];
  +[VUISeasonPickerCollectionViewCell configureSeasonPickerCell:v12 withMedia:v11 traitCollection:v13];

  v14 = self->_sizingCell;
  id v15 = [(VUISeasonPickerViewController *)self view];
  [v15 bounds];
  -[VUISeasonPickerCollectionViewCell sizeThatFits:](v14, "sizeThatFits:", v16, 1.79769313e308);
  double v18 = v17;
  double v20 = v19;

  double v21 = v18;
  double v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  +[VUIViewSpacer spacerC];
  double v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  result.right = v9;
  result.bottom = v6;
  result.left = v8;
  result.top = v7;
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(VUISeasonPickerViewController *)self dataSource];
  double v7 = [v6 mediaEntities];
  uint64_t v8 = [v5 row];

  id v13 = [v7 objectAtIndex:v8];

  double v9 = [(VUISeasonPickerViewController *)self familyMember];
  v10 = +[VUILibraryViewFactory viewControllerForMediaEntity:v13 withFamilyMember:v9];

  objc_super v11 = [(VUISeasonPickerViewController *)self title];
  [v10 setTitle:v11];

  [(VUISeasonPickerViewController *)self setCurrentSeasonViewController:v10];
  id v12 = [(VUISeasonPickerViewController *)self navigationController];
  [v12 pushViewController:v10 animated:1];
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  objc_super v4 = [(VUISeasonPickerViewController *)self _createDiffableDataSourceSnapshot];
  id v5 = [(VUISeasonPickerViewController *)self diffableDataSource];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__VUISeasonPickerViewController_dataSourceDidFinishFetching___block_invoke;
  v6[3] = &unk_1E6DF3D58;
  v6[4] = self;
  [v5 applySnapshot:v4 animatingDifferences:1 completion:v6];
}

void __61__VUISeasonPickerViewController_dataSourceDidFinishFetching___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  objc_super v3 = [v2 mediaEntities];
  uint64_t v4 = [v3 count];

  id v5 = [*(id *)(a1 + 32) contentPresenter];
  id v6 = v5;
  if (v4)
  {
    [v5 setCurrentContentViewType:3];
  }
  else
  {
    [v5 setCurrentContentViewType:2];

    id v6 = [*(id *)(a1 + 32) contentPresenter];
    objc_msgSend(v6, "setContentHasBeenManuallyDeleted:", objc_msgSend(*(id *)(a1 + 32), "lastViewedSeasonWasManuallyDeleted"));
  }
}

- (id)_createDiffableDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4FB1598]);
  uint64_t v4 = [(VUISeasonPickerViewController *)self seasonPickerView];
  id v5 = [v4 collectionView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__VUISeasonPickerViewController__createDiffableDataSource__block_invoke;
  v8[3] = &unk_1E6DF3EB8;
  objc_copyWeak(&v9, &location);
  id v6 = (void *)[v3 initWithCollectionView:v5 cellProvider:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v6;
}

id __58__VUISeasonPickerViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"VUISeasonPickerCollectionViewCellIdentifier" forIndexPath:v5];

  id v9 = [WeakRetained dataSource];
  v10 = [v9 mediaEntities];
  objc_super v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "row"));

  id v12 = [WeakRetained traitCollection];
  +[VUISeasonPickerCollectionViewCell configureSeasonPickerCell:v8 withMedia:v11 traitCollection:v12];

  id v13 = objc_alloc_init(VUISeparatorView);
  [v8 setTopSeparatorView:v13];

  uint64_t v14 = [v5 row];
  id v15 = [WeakRetained dataSource];
  double v16 = [v15 mediaEntities];
  if (v14 == [v16 count] - 1) {
    double v17 = objc_alloc_init(VUISeparatorView);
  }
  else {
    double v17 = 0;
  }

  [v8 setBottomSeparatorView:v17];
  return v8;
}

- (id)_createDiffableDataSourceSnapshot
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v7[0] = @"SeasonSection";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = [(VUISeasonPickerViewController *)self _getSeasonIdentifiersFromSeasons];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"SeasonSection"];

  return v3;
}

- (id)_getSeasonIdentifiersFromSeasons
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(VUISeasonPickerViewController *)self dataSource];
  id v5 = [v4 mediaEntities];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) identifier];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  objc_super v11 = (void *)[v3 copy];
  return v11;
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (_VUISeasonPickerView)seasonPickerView
{
  return self->_seasonPickerView;
}

- (void)setSeasonPickerView:(id)a3
{
}

- (UIViewController)currentSeasonViewController
{
  return self->_currentSeasonViewController;
}

- (void)setCurrentSeasonViewController:(id)a3
{
}

- (BOOL)lastViewedSeasonWasManuallyDeleted
{
  return self->_lastViewedSeasonWasManuallyDeleted;
}

- (void)setLastViewedSeasonWasManuallyDeleted:(BOOL)a3
{
  self->_lastViewedSeasonWasManuallyDeleted = a3;
}

- (VUIViewControllerContentPresenter)contentPresenter
{
  return self->_contentPresenter;
}

- (void)setContentPresenter:(id)a3
{
}

- (VUIMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_contentPresenter, 0);
  objc_storeStrong((id *)&self->_currentSeasonViewController, 0);
  objc_storeStrong((id *)&self->_seasonPickerView, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end