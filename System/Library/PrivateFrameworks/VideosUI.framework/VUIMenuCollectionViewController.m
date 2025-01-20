@interface VUIMenuCollectionViewController
- (BOOL)_menuHasContent;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)genresOnlyMenu;
- (BOOL)isInPrimaryOnlyMode;
- (BOOL)shouldDeselectOnViewAppear;
- (BOOL)shouldMarkFirstCategorySelected;
- (BOOL)shouldShowBackButton;
- (BOOL)shouldShowLeftBarButton;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)genreMenuItems;
- (NSArray)genreMenuTypes;
- (NSArray)mainMenuItems;
- (UICollectionViewCell)sizingCell;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (VUICollectionConfiguration)collectionConfiguration;
- (VUILegacyCollectionView)menuCollectionView;
- (VUIMenuCollectionViewController)initWithCategories:(id)a3 gridConfiguration:(id)a4;
- (VUIMenuCollectionViewControllerDelegate)delegate;
- (VUIMenuDataSource)categories;
- (VUIMenuSectionHeaderCollectionViewCell)sectionHeaderSizingCell;
- (_UIDiffableDataSourceSectionController)sectionController;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)_backButton;
- (id)_createDiffableDataSource;
- (id)_createDiffableDataSourceSnapshot;
- (id)_leftBarButton;
- (void)_applySnapshotsToSectionController:(BOOL)a3;
- (void)_backSelected:(id)a3;
- (void)_leftBarButtonSelected:(id)a3;
- (void)_selectFirstMenuItemIfNecessary;
- (void)_setGenreMenuItemsForCategories:(id)a3;
- (void)_updateNavigationBarPadding;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)loadView;
- (void)setCategories:(id)a3;
- (void)setCollectionConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setGenreMenuItems:(id)a3;
- (void)setGenreMenuTypes:(id)a3;
- (void)setGenresOnlyMenu:(BOOL)a3;
- (void)setIsInPrimaryOnlyMode:(BOOL)a3;
- (void)setMainMenuItems:(id)a3;
- (void)setMenuCollectionView:(id)a3;
- (void)setSectionController:(id)a3;
- (void)setSectionHeaderSizingCell:(id)a3;
- (void)setShouldDeselectOnViewAppear:(BOOL)a3;
- (void)setShouldMarkFirstCategorySelected:(BOOL)a3;
- (void)setShouldShowBackButton:(BOOL)a3;
- (void)setShouldShowLeftBarButton:(BOOL)a3;
- (void)setSizingCell:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateWithCategories:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation VUIMenuCollectionViewController

- (VUIMenuCollectionViewController)initWithCategories:(id)a3 gridConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)VUIMenuCollectionViewController;
  v8 = [(VUIMenuCollectionViewController *)&v17 init];
  v9 = v8;
  if (v8)
  {
    [(VUIMenuCollectionViewController *)v8 setCollectionConfiguration:v7];
    [(VUIMenuCollectionViewController *)v9 setCategories:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v11 = +[VUILocalizationManager sharedInstance];
    v12 = v11;
    uint64_t v13 = isKindOfClass & 1;
    if (v13) {
      v14 = @"LIBRARY_GENRES_HEADER";
    }
    else {
      v14 = @"LIBRARY";
    }
    v15 = [v11 localizedStringForKey:v14];
    [(VUIMenuCollectionViewController *)v9 setTitle:v15];

    [(VUIMenuCollectionViewController *)v9 setGenresOnlyMenu:v13];
    [(VUIMenuCollectionViewController *)v9 setShouldShowBackButton:0];
    [(VUIMenuCollectionViewController *)v9 setShouldShowLeftBarButton:0];
    [(VUIMenuCollectionViewController *)v9 setShouldDeselectOnViewAppear:0];
  }

  return v9;
}

- (void)loadView
{
  v18.receiver = self;
  v18.super_class = (Class)VUIMenuCollectionViewController;
  [(VUIMenuCollectionViewController *)&v18 loadView];
  v3 = [(VUIMenuCollectionViewController *)self collectionConfiguration];
  v4 = [v3 generateCollectionView];
  menuCollectionView = self->_menuCollectionView;
  self->_menuCollectionView = v4;

  [(VUILegacyCollectionView *)self->_menuCollectionView setDelegate:self];
  id v6 = [(VUIMenuCollectionViewController *)self view];
  [v6 addSubview:self->_menuCollectionView];

  if ([(VUIMenuCollectionViewController *)self shouldShowLeftBarButton])
  {
    id v7 = [(VUIMenuCollectionViewController *)self navigationItem];
    v8 = [(VUIMenuCollectionViewController *)self _leftBarButton];
    [v7 setLeftBarButtonItem:v8];
  }
  if ([(VUIMenuCollectionViewController *)self shouldShowBackButton])
  {
    v9 = [(VUIMenuCollectionViewController *)self navigationItem];
    v10 = [(VUIMenuCollectionViewController *)self _backButton];
    [v9 setBackBarButtonItem:v10];
  }
  v11 = (UICollectionViewCell *)objc_alloc_init(MEMORY[0x1E4FB1570]);
  sizingCell = self->_sizingCell;
  self->_sizingCell = v11;

  uint64_t v13 = objc_alloc_init(VUIMenuSectionHeaderCollectionViewCell);
  sectionHeaderSizingCell = self->_sectionHeaderSizingCell;
  self->_sectionHeaderSizingCell = v13;

  v15 = [(VUIMenuCollectionViewController *)self _createDiffableDataSource];
  [(VUIMenuCollectionViewController *)self setDiffableDataSource:v15];

  v16 = [(VUIMenuCollectionViewController *)self _createDiffableDataSourceSnapshot];
  objc_super v17 = [(VUIMenuCollectionViewController *)self diffableDataSource];
  [v17 applySnapshot:v16 animatingDifferences:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)VUIMenuCollectionViewController;
  [(VUIMenuCollectionViewController *)&v4 viewDidLoad];
  v3 = [(VUIMenuCollectionViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 menuCollectionViewControllerDidFinishLoading];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIMenuCollectionViewController;
  [(VUIMenuCollectionViewController *)&v4 viewDidAppear:a3];
  [(VUIMenuCollectionViewController *)self _updateNavigationBarPadding];
  [(VUIMenuCollectionViewController *)self _selectFirstMenuItemIfNecessary];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)VUIMenuCollectionViewController;
  [(VUIMenuCollectionViewController *)&v7 viewWillLayoutSubviews];
  menuCollectionView = self->_menuCollectionView;
  objc_super v4 = [(VUIMenuCollectionViewController *)self view];
  [v4 bounds];
  -[VUILegacyCollectionView setFrame:](menuCollectionView, "setFrame:");

  v5 = [(VUIMenuCollectionViewController *)self menuCollectionView];
  id v6 = [v5 collectionViewLayout];
  [v6 invalidateLayout];

  [(VUIMenuCollectionViewController *)self _updateNavigationBarPadding];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIMenuCollectionViewController;
  [(VUIMenuCollectionViewController *)&v6 viewWillAppear:a3];
  if ([(VUIMenuCollectionViewController *)self shouldDeselectOnViewAppear])
  {
    objc_super v4 = [(VUILegacyCollectionView *)self->_menuCollectionView indexPathsForSelectedItems];
    v5 = [v4 firstObject];

    [(VUILegacyCollectionView *)self->_menuCollectionView deselectItemAtIndexPath:v5 animated:1];
  }
}

- (void)updateWithCategories:(id)a3
{
  id v4 = a3;
  v5 = [(VUIMenuCollectionViewController *)self menuCollectionView];
  objc_super v6 = [v5 indexPathsForSelectedItems];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [(VUIMenuCollectionViewController *)self menuCollectionView];
    v9 = [v8 indexPathsForSelectedItems];
    v10 = [v9 firstObject];
  }
  else
  {
    v10 = 0;
  }
  [(VUIMenuCollectionViewController *)self setCategories:v4];
  v11 = [(VUIMenuCollectionViewController *)self _createDiffableDataSourceSnapshot];
  objc_initWeak(&location, self);
  v12 = [(VUIMenuCollectionViewController *)self diffableDataSource];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__VUIMenuCollectionViewController_updateWithCategories___block_invoke;
  v14[3] = &unk_1E6DF5490;
  objc_copyWeak(&v16, &location);
  id v13 = v10;
  id v15 = v13;
  [v12 applySnapshot:v11 animatingDifferences:1 completion:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __56__VUIMenuCollectionViewController_updateWithCategories___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [WeakRetained menuCollectionView];
  v5 = [v4 indexPathsForSelectedItems];
  uint64_t v6 = [v5 count];

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v3 == 0;
  }
  if (!v7)
  {
    v8 = [WeakRetained mainMenuItems];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      v10 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
      v11 = [WeakRetained menuCollectionView];
      [v11 selectItemAtIndexPath:v10 animated:1 scrollPosition:0];

      v12 = VUIDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v10;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "VUIMenuCollectionViewController: did select menu item at new index path %@", (uint8_t *)&v14, 0xCu);
      }

      id v13 = [WeakRetained delegate];
      [v13 didSelectMenuItemAtIndexPath:v10];
    }
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMenuCollectionViewController *)self navigationItem];
  [v5 setTitle:v4];

  [v5 _setSupportsTwoLineLargeTitles:1];
  [v5 setLargeTitleDisplayMode:1];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIMenuCollectionViewController;
  -[VUIMenuCollectionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__VUIMenuCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6DF67C0;
  objc_copyWeak(&v9, &location);
  [v7 animateAlongsideTransition:v8 completion:0];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __86__VUIMenuCollectionViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained navigationController];
  v2 = [v1 navigationBar];
  [v2 sizeToFit];

  uint64_t v3 = [WeakRetained view];
  [v3 setNeedsLayout];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  id v7 = [(VUIMenuCollectionViewController *)self view];
  [v7 bounds];
  double Width = CGRectGetWidth(v21);

  uint64_t v9 = [v6 section];
  v10 = &OBJC_IVAR___VUIMenuCollectionViewController__genreMenuItems;
  if (!v9) {
    v10 = &OBJC_IVAR___VUIMenuCollectionViewController__mainMenuItems;
  }
  objc_super v11 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v10), "objectAtIndex:", objc_msgSend(v6, "row"));
  v12 = [(VUIMenuCollectionViewController *)self collectionConfiguration];
  id v13 = [v12 configureSizingCellForItem:v11 AtIndexPath:v6];

  objc_msgSend(v13, "sizeThatFits:", Width, 1.79769313e308);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v5 = [(VUIMenuCollectionViewController *)self collectionConfiguration];
  [v5 minimumLineSpacing];
  double v7 = v6;

  return v7;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5 = 0.0;
  if (a5 == 1)
  {
    +[VUIViewSpacer spacerB];
    double v8 = v7;
    uint64_t v9 = [(VUIMenuCollectionViewController *)self traitCollection];
    +[VUIUtilities scaleContentSizeValue:v9 forTraitCollection:v8];
    double v5 = v10;
  }
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = v5;
  result.right = v13;
  result.bottom = v14;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  double v10 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a5 == 1 && !self->_genresOnlyMenu && [(NSArray *)self->_genreMenuItems count])
  {
    double v12 = [(VUIMenuCollectionViewController *)self view];
    [v12 bounds];
    double Width = CGRectGetWidth(v23);

    double v14 = [(VUIMenuSectionHeaderCollectionViewCell *)self->_sectionHeaderSizingCell title];

    if (!v14)
    {
      sectionHeaderSizingCell = self->_sectionHeaderSizingCell;
      double v16 = +[VUILocalizationManager sharedInstance];
      double v17 = [v16 localizedStringForKey:@"LIBRARY_GENRES_HEADER"];
      [(VUIMenuSectionHeaderCollectionViewCell *)sectionHeaderSizingCell setTitle:v17];
    }
    -[VUIMenuSectionHeaderCollectionViewCell sizeThatFits:](self->_sectionHeaderSizingCell, "sizeThatFits:", Width, 1.79769313e308);
    double v10 = v18;
    double v11 = v19;
  }

  double v20 = v10;
  double v21 = v11;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(VUIMenuCollectionViewController *)self menuCollectionView];
  double v7 = [v6 indexPathsForSelectedItems];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    id v9 = [(VUIMenuCollectionViewController *)self menuCollectionView];
    double v10 = [v9 indexPathsForSelectedItems];
    double v11 = [v10 firstObject];

    int v12 = [v11 isEqual:v5] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(VUIMenuCollectionViewController *)self delegate];
  [v6 didSelectMenuItemAtIndexPath:v5];
}

- (void)_backSelected:(id)a3
{
  id v4 = [(VUIMenuCollectionViewController *)self navigationController];
  id v3 = (id)[v4 popViewControllerAnimated:1];
}

- (void)_leftBarButtonSelected:(id)a3
{
  id v4 = [(VUIMenuCollectionViewController *)self delegate];
  [v4 categoryMenuViewControllerShouldDismiss:self];
}

- (void)setCategories:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_categories, a3);
  id v6 = [v5 mainMenuItemsWithDefaultItems];
  double v7 = (NSArray *)[v6 copy];
  mainMenuItems = self->_mainMenuItems;
  self->_mainMenuItems = v7;

  [(VUIMenuCollectionViewController *)self _setGenreMenuItemsForCategories:v5];
  id v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v10 = [(NSArray *)self->_mainMenuItems count];
    NSUInteger v11 = [(NSArray *)self->_genreMenuItems count];
    int v12 = 134218240;
    NSUInteger v13 = v10;
    __int16 v14 = 2048;
    NSUInteger v15 = v11;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "VUIMenuCollectionViewController:Setting %lu main menu items, %lu genre menu items", (uint8_t *)&v12, 0x16u);
  }
}

- (void)_setGenreMenuItemsForCategories:(id)a3
{
  id v4 = a3;
  id v5 = [v4 genreMenuItems];
  id v6 = (NSArray *)[v5 copy];
  genreMenuItems = self->_genreMenuItems;
  self->_genreMenuItems = v6;

  id v10 = [v4 genreTypes];

  uint64_t v8 = (NSArray *)[v10 copy];
  genreMenuTypes = self->_genreMenuTypes;
  self->_genreMenuTypes = v8;
}

- (id)_createDiffableDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4FB1598]);
  id v4 = [(VUIMenuCollectionViewController *)self menuCollectionView];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __60__VUIMenuCollectionViewController__createDiffableDataSource__block_invoke;
  id v10 = &unk_1E6DF3EB8;
  objc_copyWeak(&v11, &location);
  id v5 = (void *)[v3 initWithCollectionView:v4 cellProvider:&v7];

  objc_msgSend(v5, "setSupplementaryViewProvider:", &__block_literal_global_45, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v5;
}

id __60__VUIMenuCollectionViewController__createDiffableDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  if ([v5 section])
  {
    id v9 = [WeakRetained genreMenuItems];
    id v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v5, "row"));

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    [v11 setObject:v10 forKey:@"title"];
    uint64_t v12 = [WeakRetained genreMenuTypes];
    if (v12)
    {
      NSUInteger v13 = (void *)v12;
      __int16 v14 = [WeakRetained genreMenuTypes];
      unint64_t v15 = [v14 count];
      unint64_t v16 = [v5 row];

      if (v15 > v16)
      {
        double v17 = [WeakRetained genreMenuTypes];
        double v18 = objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v5, "row"));

        [v11 setObject:v18 forKey:@"type"];
      }
    }
  }
  else
  {
    id v10 = [WeakRetained mainMenuItems];
    id v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v5, "row"));
  }

  double v19 = [WeakRetained collectionConfiguration];
  double v20 = [v19 configureCollectionViewCellForCollectionView:v7 ForItem:v11 AtIndexPath:v5];

  return v20;
}

id __60__VUIMenuCollectionViewController__createDiffableDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v4 = [a2 dequeueReusableSupplementaryViewOfKind:a3 withReuseIdentifier:@"MenuSectionHeaderCellIdentifier" forIndexPath:a4];
  id v5 = +[VUILocalizationManager sharedInstance];
  id v6 = [v5 localizedStringForKey:@"LIBRARY_GENRES_HEADER"];
  [v4 setTitle:v6];

  return v4;
}

- (id)_createDiffableDataSourceSnapshot
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v13[0] = @"MainSectionIdentifier";
  v13[1] = @"GenreSectionIdentifier";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v3 appendSectionsWithIdentifiers:v4];

  [v3 appendItemsWithIdentifiers:self->_mainMenuItems intoSectionWithIdentifier:@"MainSectionIdentifier"];
  [v3 appendItemsWithIdentifiers:self->_genreMenuItems intoSectionWithIdentifier:@"GenreSectionIdentifier"];
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    mainMenuItems = self->_mainMenuItems;
    genreMenuItems = self->_genreMenuItems;
    int v9 = 138412546;
    id v10 = mainMenuItems;
    __int16 v11 = 2112;
    uint64_t v12 = genreMenuItems;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIMenuCollectionViewController:Creating snapshot with main menu items %@, genre menu items %@", (uint8_t *)&v9, 0x16u);
  }

  return v3;
}

- (void)_applySnapshotsToSectionController:(BOOL)a3
{
  BOOL v3 = a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = [(VUIMenuCollectionViewController *)self categories];
  id v6 = [v5 mainMenuItemsWithDefaultItems];
  id v7 = (NSArray *)[v6 copy];
  mainMenuItems = self->_mainMenuItems;
  self->_mainMenuItems = v7;

  int v9 = objc_opt_new();
  [v9 appendItems:self->_mainMenuItems];
  id v10 = [(VUIMenuCollectionViewController *)self sectionController];
  [v10 applySnapshot:v9 toSection:@"MainSectionIdentifier" animatingDifferences:v3];

  __int16 v11 = [(VUIMenuCollectionViewController *)self categories];
  [(VUIMenuCollectionViewController *)self _setGenreMenuItemsForCategories:v11];

  uint64_t v12 = objc_opt_new();
  NSUInteger v13 = [(NSArray *)self->_genreMenuItems firstObject];
  __int16 v14 = -[NSArray subarrayWithRange:](self->_genreMenuItems, "subarrayWithRange:", 1, [(NSArray *)self->_genreMenuItems count] - 1);
  v19[0] = v13;
  unint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v12 appendItems:v15];

  [v12 appendItems:v14 intoParent:v13];
  double v18 = v13;
  unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v12 expandItems:v16];

  double v17 = [(VUIMenuCollectionViewController *)self sectionController];
  [v17 applySnapshot:v12 toSection:@"GenreSectionIdentifier" animatingDifferences:v3];
}

- (BOOL)_menuHasContent
{
  return [(NSArray *)self->_mainMenuItems count] || [(NSArray *)self->_genreMenuItems count] != 0;
}

- (id)_backButton
{
  BOOL v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  id v4 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UINavigationBarBackIndicatorDefault"];
  id v5 = [v4 imageFlippedForRightToLeftLayoutDirection];
  id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  id v7 = objc_msgSend(v5, "vui_imageWithColor:", v6);

  [v3 setImage:v7 forState:0];
  uint64_t v8 = [v3 imageView];
  [v8 setContentMode:1];

  int v9 = +[VUILocalizationManager sharedInstance];
  id v10 = [v9 localizedStringForKey:@"LIBRARY"];
  [v3 setTitle:v10 forState:0];

  __int16 v11 = [v3 titleLabel];
  [v11 _setTextColorFollowsTintColor:1];

  [v3 addTarget:self action:sel__backSelected_ forControlEvents:64];
  uint64_t v12 = [(VUIMenuCollectionViewController *)self view];
  uint64_t v13 = [v12 effectiveUserInterfaceLayoutDirection];

  if (v13 == 1) {
    double v14 = 0.0;
  }
  else {
    double v14 = -10.0;
  }
  objc_msgSend(v3, "setImageEdgeInsets:", 0.0, v14);
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v3];
  unint64_t v16 = +[VUILocalizationManager sharedInstance];
  double v17 = [v16 localizedStringForKey:@"LIBRARY"];
  [v15 setTitle:v17];

  return v15;
}

- (id)_leftBarButton
{
  BOOL v3 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  id v4 = [MEMORY[0x1E4FB1818] kitImageNamed:@"UINavigationBarBackIndicatorDefault"];
  id v5 = [v4 imageFlippedForRightToLeftLayoutDirection];
  id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  id v7 = objc_msgSend(v5, "vui_imageWithColor:", v6);

  [v3 setImage:v7 forState:0];
  uint64_t v8 = [v3 imageView];
  [v8 setContentMode:1];

  int v9 = +[VUILocalizationManager sharedInstance];
  id v10 = [v9 localizedStringForKey:@"BACK"];
  [v3 setTitle:v10 forState:0];

  __int16 v11 = [v3 titleLabel];
  [v11 _setTextColorFollowsTintColor:1];

  [v3 addTarget:self action:sel__leftBarButtonSelected_ forControlEvents:64];
  uint64_t v12 = [(VUIMenuCollectionViewController *)self view];
  uint64_t v13 = [v12 effectiveUserInterfaceLayoutDirection];

  if (v13 == 1) {
    double v14 = 0.0;
  }
  else {
    double v14 = -10.0;
  }
  objc_msgSend(v3, "setImageEdgeInsets:", 0.0, v14);
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v3];

  return v15;
}

- (void)_selectFirstMenuItemIfNecessary
{
  id v6 = [(VUIMenuCollectionViewController *)self menuCollectionView];
  BOOL v3 = [v6 indexPathsForSelectedItems];
  if (![v3 count])
  {
    id v4 = [(VUIMenuCollectionViewController *)self mainMenuItems];
    uint64_t v5 = [v4 count];

    if (!v5) {
      return;
    }
    id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    BOOL v3 = [(VUIMenuCollectionViewController *)self menuCollectionView];
    [v3 selectItemAtIndexPath:v6 animated:0 scrollPosition:0];
  }
}

- (void)_updateNavigationBarPadding
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1F48];
  id v4 = [(VUIMenuCollectionViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "vui_paddingForWindowWidth:", CGRectGetWidth(v27));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  uint64_t v13 = [(VUIMenuCollectionViewController *)self navigationController];
  double v14 = [v13 navigationBar];
  [v14 layoutMargins];
  if (v8 == v18 && v6 == v15 && v12 == v17)
  {
    double v21 = v16;

    if (v10 == v21) {
      return;
    }
  }
  else
  {
  }
  v22 = [(VUIMenuCollectionViewController *)self navigationController];
  CGRect v23 = [v22 navigationBar];
  objc_msgSend(v23, "setLayoutMargins:", v6, v8, v10, v12);

  id v25 = [(VUIMenuCollectionViewController *)self navigationController];
  v24 = [v25 navigationBar];
  [v24 setNeedsLayout];
}

- (VUIMenuCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIMenuCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VUIMenuDataSource)categories
{
  return self->_categories;
}

- (BOOL)shouldShowLeftBarButton
{
  return self->_shouldShowLeftBarButton;
}

- (void)setShouldShowLeftBarButton:(BOOL)a3
{
  self->_shouldShowLeftBarButton = a3;
}

- (BOOL)shouldShowBackButton
{
  return self->_shouldShowBackButton;
}

- (void)setShouldShowBackButton:(BOOL)a3
{
  self->_shouldShowBackButton = a3;
}

- (BOOL)shouldDeselectOnViewAppear
{
  return self->_shouldDeselectOnViewAppear;
}

- (void)setShouldDeselectOnViewAppear:(BOOL)a3
{
  self->_shouldDeselectOnViewAppear = a3;
}

- (BOOL)isInPrimaryOnlyMode
{
  return self->_isInPrimaryOnlyMode;
}

- (void)setIsInPrimaryOnlyMode:(BOOL)a3
{
  self->_isInPrimaryOnlyMode = a3;
}

- (VUICollectionConfiguration)collectionConfiguration
{
  return self->_collectionConfiguration;
}

- (void)setCollectionConfiguration:(id)a3
{
}

- (BOOL)shouldMarkFirstCategorySelected
{
  return self->_shouldMarkFirstCategorySelected;
}

- (void)setShouldMarkFirstCategorySelected:(BOOL)a3
{
  self->_shouldMarkFirstCategorySelected = a3;
}

- (BOOL)genresOnlyMenu
{
  return self->_genresOnlyMenu;
}

- (void)setGenresOnlyMenu:(BOOL)a3
{
  self->_genresOnlyMenu = a3;
}

- (VUILegacyCollectionView)menuCollectionView
{
  return self->_menuCollectionView;
}

- (void)setMenuCollectionView:(id)a3
{
}

- (UICollectionViewCell)sizingCell
{
  return self->_sizingCell;
}

- (void)setSizingCell:(id)a3
{
}

- (VUIMenuSectionHeaderCollectionViewCell)sectionHeaderSizingCell
{
  return self->_sectionHeaderSizingCell;
}

- (void)setSectionHeaderSizingCell:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (NSArray)mainMenuItems
{
  return self->_mainMenuItems;
}

- (void)setMainMenuItems:(id)a3
{
}

- (NSArray)genreMenuItems
{
  return self->_genreMenuItems;
}

- (void)setGenreMenuItems:(id)a3
{
}

- (NSArray)genreMenuTypes
{
  return self->_genreMenuTypes;
}

- (void)setGenreMenuTypes:(id)a3
{
}

- (_UIDiffableDataSourceSectionController)sectionController
{
  return self->_sectionController;
}

- (void)setSectionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionController, 0);
  objc_storeStrong((id *)&self->_genreMenuTypes, 0);
  objc_storeStrong((id *)&self->_genreMenuItems, 0);
  objc_storeStrong((id *)&self->_mainMenuItems, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_sectionHeaderSizingCell, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
  objc_storeStrong((id *)&self->_menuCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionConfiguration, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end