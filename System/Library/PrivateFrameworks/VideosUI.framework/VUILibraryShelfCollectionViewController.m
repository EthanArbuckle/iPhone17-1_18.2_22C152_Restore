@interface VUILibraryShelfCollectionViewController
- (BOOL)_shouldHideDisclosureButton;
- (BOOL)disableSeeAllButton;
- (CGSize)_configureSizingCellWithEntity:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NSArray)fetchResults;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (VUILibraryShelfCollectionViewController)initWithDataSource:(id)a3;
- (VUILibraryShelfCollectionViewControllerDelegate)delegate;
- (VUIMediaEntitiesDataSource)dataSource;
- (VUIMediaEntity)lastSelectedMediaEntity;
- (double)_computeBottomMargin;
- (id)_attributedHeaderTitle;
- (id)_createDiffableDataSourceForCollectionView:(id)a3;
- (id)_createDiffableDataSourceSnapshot;
- (id)_getEntityIdentifiersFromEntities;
- (int64_t)shelfType;
- (void)_didPressSeeAllButton:(id)a3;
- (void)_headerTapped:(id)a3;
- (void)_reloadMediaEntity:(id)a3;
- (void)_updateHeaderView;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureWithCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setDisableSeeAllButton:(BOOL)a3;
- (void)setFetchResults:(id)a3;
- (void)setHeaderSubtitle:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderTitle:(id)a3 andSubtitle:(id)a4;
- (void)setLastSelectedMediaEntity:(id)a3;
- (void)setShelfType:(int64_t)a3;
- (void)updateWithDataSource:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VUILibraryShelfCollectionViewController

- (VUILibraryShelfCollectionViewController)initWithDataSource:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUILibraryShelfCollectionViewController;
  v6 = [(VUIShelfViewController *)&v12 initWithGridStyle:3];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    v8 = [v5 mediaEntities];
    uint64_t v9 = [v8 copy];
    fetchResults = v7->_fetchResults;
    v7->_fetchResults = (NSArray *)v9;

    v7->_disableSeeAllButton = 0;
  }

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUILibraryShelfCollectionViewController;
  [(VUILibraryShelfCollectionViewController *)&v6 viewWillAppear:a3];
  v4 = [(VUILibraryShelfCollectionViewController *)self lastSelectedMediaEntity];

  if (v4)
  {
    id v5 = [(VUILibraryShelfCollectionViewController *)self lastSelectedMediaEntity];
    [(VUILibraryShelfCollectionViewController *)self _reloadMediaEntity:v5];

    [(VUILibraryShelfCollectionViewController *)self setLastSelectedMediaEntity:0];
  }
}

- (void)setHeaderTitle:(id)a3 andSubtitle:(id)a4
{
  id v6 = a4;
  v7 = (NSString *)[a3 copy];
  headerTitle = self->_headerTitle;
  self->_headerTitle = v7;

  uint64_t v9 = (NSString *)[v6 copy];
  headerSubtitle = self->_headerSubtitle;
  self->_headerSubtitle = v9;

  [(VUILibraryShelfCollectionViewController *)self _updateHeaderView];
}

- (void)updateWithDataSource:(id)a3
{
  v4 = [a3 mediaEntities];
  fetchResults = self->_fetchResults;
  self->_fetchResults = v4;

  id v7 = [(VUILibraryShelfCollectionViewController *)self _createDiffableDataSourceSnapshot];
  id v6 = [(VUILibraryShelfCollectionViewController *)self diffableDataSource];
  [v6 applySnapshot:v7 animatingDifferences:1];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  fetchResults = self->_fetchResults;
  id v7 = a4;
  id v8 = a3;
  -[NSArray objectAtIndex:](fetchResults, "objectAtIndex:", [v7 item]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(VUILibraryShelfCollectionViewController *)self setLastSelectedMediaEntity:v10];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shelfCollectionViewController:self collectionView:v8 didSelectMediaEntity:v10 atIndexPath:v7];
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [(VUILibraryShelfCollectionViewController *)self _computeBottomMargin];
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

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v6 = -[NSArray objectAtIndex:](self->_fetchResults, "objectAtIndex:", objc_msgSend(a5, "row", a3, a4));
  [(VUILibraryShelfCollectionViewController *)self _configureSizingCellWithEntity:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)configureWithCollectionView:(id)a3
{
  id v4 = a3;
  [v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TVLibraryLockupViewReuseIdentifier"];
  double v5 = [(VUILibraryShelfCollectionViewController *)self _createDiffableDataSourceForCollectionView:v4];

  [(VUILibraryShelfCollectionViewController *)self setDiffableDataSource:v5];
  id v7 = [(VUILibraryShelfCollectionViewController *)self diffableDataSource];
  double v6 = [(VUILibraryShelfCollectionViewController *)self _createDiffableDataSourceSnapshot];
  [v7 applySnapshot:v6 animatingDifferences:1];
}

- (id)_createDiffableDataSourceForCollectionView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4FB1598]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__VUILibraryShelfCollectionViewController__createDiffableDataSourceForCollectionView___block_invoke;
  v8[3] = &unk_1E6DF3EB8;
  objc_copyWeak(&v9, &location);
  double v6 = (void *)[v5 initWithCollectionView:v4 cellProvider:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

id __86__VUILibraryShelfCollectionViewController__createDiffableDataSourceForCollectionView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  double v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"TVLibraryLockupViewReuseIdentifier" forIndexPath:v5];

  id v9 = [WeakRetained fetchResults];
  uint64_t v10 = [v5 row];

  double v11 = [v9 objectAtIndex:v10];

  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_itemWidthForGridStyle:gridType:", 3, 0);
  +[VUILibraryLockupViewCell configureLockupCell:withMedia:width:forMetrics:](VUILibraryLockupViewCell, "configureLockupCell:withMedia:width:forMetrics:", v8, v11, 0);

  return v8;
}

- (id)_createDiffableDataSourceSnapshot
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v7[0] = @"ShelfMainSection";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 appendSectionsWithIdentifiers:v4];

  id v5 = [(VUILibraryShelfCollectionViewController *)self _getEntityIdentifiersFromEntities];
  [v3 appendItemsWithIdentifiers:v5 intoSectionWithIdentifier:@"ShelfMainSection"];

  return v3;
}

- (id)_getEntityIdentifiersFromEntities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(VUILibraryShelfCollectionViewController *)self fetchResults];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

- (void)_didPressSeeAllButton:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained seeAllButtonPressed:self];
}

- (CGSize)_configureSizingCellWithEntity:(id)a3
{
  id v4 = a3;
  if (!self->_sizingCell)
  {
    uint64_t v5 = objc_alloc_init(VUILibraryLockupViewCell);
    sizingCell = self->_sizingCell;
    self->_sizingCell = v5;
  }
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_itemWidthForGridStyle:gridType:", 3, 0);
  double v8 = v7;
  +[VUILibraryLockupViewCell configureLockupCell:withMedia:width:forMetrics:](VUILibraryLockupViewCell, "configureLockupCell:withMedia:width:forMetrics:", self->_sizingCell, v4, 1);
  -[VUILibraryLockupViewCell sizeThatFits:](self->_sizingCell, "sizeThatFits:", v8, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)_computeBottomMargin
{
  uint64_t v3 = [(NSArray *)self->_fetchResults count];
  p_cache = (void **)(VUIMediaTagsView + 16);
  if (v3 < 1)
  {
    id v7 = 0;
    double v8 = 0;
LABEL_17:
    [p_cache + 263 spacerC];
    double v21 = v20;
    v22 = [(VUILibraryShelfCollectionViewController *)self traitCollection];
    +[VUIUtilities scaleContentSizeValue:v22 forTraitCollection:v21];
    double v18 = v23;
  }
  else
  {
    uint64_t v5 = v3;
    uint64_t v6 = 0;
    id v7 = 0;
    double v8 = 0;
    while (1)
    {
      double v9 = v8;
      double v8 = [(NSArray *)self->_fetchResults objectAtIndex:v6];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v8 rentalExpirationDate];
        if (v10)
        {
          double v11 = (void *)v10;
          double v12 = [v8 title];
          uint64_t v13 = [v12 length];

          if (v13) {
            break;
          }
        }
      }
      if (!v7)
      {
        double v14 = [v8 title];
        uint64_t v15 = [v14 length];

        if (v15) {
          id v7 = v8;
        }
        else {
          id v7 = 0;
        }
      }
      if (v5 == ++v6)
      {
        if (v7) {
          goto LABEL_12;
        }
LABEL_16:
        p_cache = VUIMediaTagsView.cache;
        goto LABEL_17;
      }
    }
    id v19 = v8;

    id v7 = v19;
    if (!v19) {
      goto LABEL_16;
    }
LABEL_12:
    [(VUILibraryShelfCollectionViewController *)self _configureSizingCellWithEntity:v7];
    sizingCell = self->_sizingCell;
    p_cache = VUIMediaTagsView.cache;
    +[VUIViewSpacer spacerC];
    -[VUILibraryLockupViewCell bottomMarginWithBaselineMargin:](sizingCell, "bottomMarginWithBaselineMargin:");
    if (v17 == 0.0) {
      goto LABEL_17;
    }
    double v18 = v17;
  }

  return v18;
}

- (BOOL)_shouldHideDisclosureButton
{
  if ([(VUILibraryShelfCollectionViewController *)self disableSeeAllButton]) {
    return 1;
  }
  unint64_t v4 = [(NSArray *)self->_fetchResults count];
  return v4 < +[VUIUtilities minimumNumberOfItemsToEnableSeeAllButton];
}

- (void)_updateHeaderView
{
  BOOL v3 = [(VUILibraryShelfCollectionViewController *)self _shouldHideDisclosureButton];
  id v7 = [(VUILibraryShelfCollectionViewController *)self _attributedHeaderTitle];
  unint64_t v4 = [(VUILibraryShelfCollectionViewController *)self headerSubtitle];
  uint64_t v5 = +[VUICollectionHeaderView configureCollectionHeaderViewWithTitle:v7 subtitle:v4 buttonString:0 existingView:0];

  if (!v3)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__headerTapped_];
    [v5 addGestureRecognizer:v6];
  }
  [(VUIShelfViewController *)self setHeaderView:v5];
}

- (id)_attributedHeaderTitle
{
  if ([(VUILibraryShelfCollectionViewController *)self _shouldHideDisclosureButton])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
    unint64_t v4 = [(VUILibraryShelfCollectionViewController *)self headerTitle];
    uint64_t v5 = (void *)[v3 initWithString:v4];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2990] scale:1];
    id v7 = [MEMORY[0x1E4FB1830] configurationWithWeight:7];
    unint64_t v4 = [v6 configurationByApplyingConfiguration:v7];

    double v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward" withConfiguration:v4];
    double v9 = [v8 imageWithRenderingMode:2];

    uint64_t v10 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v9];
    double v11 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v10];
    double v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = [v12 length];
    uint64_t v14 = *MEMORY[0x1E4FB0700];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
    objc_msgSend(v12, "addAttribute:value:range:", v14, v15, 0, v13);

    LODWORD(v13) = [(VUILibraryShelfCollectionViewController *)self vuiIsRTL];
    v16 = NSString;
    uint64_t v17 = [(VUILibraryShelfCollectionViewController *)self headerTitle];
    double v18 = (void *)v17;
    if (v13) {
      id v19 = @" %@";
    }
    else {
      id v19 = @"%@ ";
    }
    double v20 = objc_msgSend(v16, "stringWithFormat:", v19, v17);

    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v20];
    if ([(VUILibraryShelfCollectionViewController *)self vuiIsRTL]) {
      [v5 insertAttributedString:v12 atIndex:0];
    }
    else {
      [v5 appendAttributedString:v12];
    }
  }
  return v5;
}

- (void)_headerTapped:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3) {
    [(VUILibraryShelfCollectionViewController *)self _didPressSeeAllButton:v4];
  }
}

- (void)_reloadMediaEntity:(id)a3
{
  id v9 = a3;
  id v4 = [v9 identifier];
  uint64_t v5 = [(VUILibraryShelfCollectionViewController *)self _getEntityIdentifiersFromEntities];
  if ([v5 containsObject:v4])
  {
    uint64_t v6 = [(VUILibraryShelfCollectionViewController *)self _createDiffableDataSourceSnapshot];
    id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v4, 0);
    [v6 reloadItemsWithIdentifiers:v7];

    double v8 = [(VUILibraryShelfCollectionViewController *)self diffableDataSource];
    [v8 applySnapshot:v6 animatingDifferences:1];
  }
  else
  {
    uint64_t v6 = [v9 identifier];
    NSLog(&cfstr_Vuilibraryshel.isa, v6);
  }
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (void)setHeaderSubtitle:(id)a3
{
}

- (BOOL)disableSeeAllButton
{
  return self->_disableSeeAllButton;
}

- (void)setDisableSeeAllButton:(BOOL)a3
{
  self->_disableSeeAllButton = a3;
}

- (VUILibraryShelfCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUILibraryShelfCollectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)fetchResults
{
  return self->_fetchResults;
}

- (void)setFetchResults:(id)a3
{
}

- (VUIMediaEntitiesDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)shelfType
{
  return self->_shelfType;
}

- (void)setShelfType:(int64_t)a3
{
  self->_shelfType = a3;
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (VUIMediaEntity)lastSelectedMediaEntity
{
  return self->_lastSelectedMediaEntity;
}

- (void)setLastSelectedMediaEntity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedMediaEntity, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_fetchResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_sizingCell, 0);
}

@end