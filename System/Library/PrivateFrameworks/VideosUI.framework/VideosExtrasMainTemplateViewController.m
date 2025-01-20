@interface VideosExtrasMainTemplateViewController
- (BOOL)_collectionView:(id)a3 indexPathShouldDisplayAsSelected:(id)a4;
- (BOOL)_isFeatureItemAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)showsPlaceholder;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)sectionMetrics:(id)a3 sizeForItemAtIndex:(int64_t)a4 withFontDescriptor:(id)a5;
- (NSIndexPath)indexPathOfFeaturedItem;
- (UICollectionViewDelegate)didSelectDelegate;
- (UIView)menuBarView;
- (VideosExtrasMainTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5;
- (double)collectionViewHeight;
- (id)_menuItems;
- (id)_textElementAtIndex:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)templateElement;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItemsForSectionMetrics:(id)a3;
- (void)_configureCell:(id)a3 forIndexPath:(id)a4;
- (void)_prepareCollectionView;
- (void)_prepareLayout;
- (void)_recalculateSizes;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)setCollectionViewHeight:(double)a3;
- (void)setDidSelectDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VideosExtrasMainTemplateViewController

- (BOOL)showsPlaceholder
{
  return 0;
}

- (id)templateElement
{
  v2 = [(VideosExtrasTemplateViewController *)self document];
  v3 = [v2 templateElement];

  return v3;
}

- (VideosExtrasMainTemplateViewController)initWithDocument:(id)a3 options:(id)a4 context:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasMainTemplateViewController;
  v5 = [(VideosExtrasTemplateViewController *)&v8 initWithDocument:a3 options:a4 context:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__dynamicTypeChanged name:*MEMORY[0x1E4FB27A8] object:0];

    [(VideosExtrasMainTemplateViewController *)v5 _prepareCollectionView];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasMainTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v4 dealloc];
}

- (void)_prepareCollectionView
{
  v3 = objc_alloc_init(VideosExtrasMainMenuSectionMetrics);
  mainMenuMetrics = self->_mainMenuMetrics;
  self->_mainMenuMetrics = v3;

  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics setDataSource:self];
  v5 = (UICollectionViewFlowLayout *)objc_alloc_init(MEMORY[0x1E4FB15C0]);
  collectionViewLayout = self->_collectionViewLayout;
  self->_collectionViewLayout = v5;

  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setMinimumLineSpacing:0.0];
  id v7 = objc_alloc(MEMORY[0x1E4FB1568]);
  objc_super v8 = (UICollectionView *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  menuBarCollectionView = self->_menuBarCollectionView;
  self->_menuBarCollectionView = v8;

  [(UICollectionView *)self->_menuBarCollectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_menuBarCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"VideosExtrasMenuBarItemIdentifier"];
  id v12 = (id)[objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:11050];
  [v12 setComputesColorSettings:0];
  [v12 setSimulatesMasks:1];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UICollectionView *)self->_menuBarCollectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->_menuBarCollectionView setBackgroundView:v12];
  [(UICollectionView *)self->_menuBarCollectionView setShowsVerticalScrollIndicator:0];
  v10 = self->_menuBarCollectionView;
  v11 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)v10 setBackgroundColor:v11];

  [(UICollectionView *)self->_menuBarCollectionView setDataSource:self];
  [(UICollectionView *)self->_menuBarCollectionView setDelegate:self];
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout setScrollDirection:1];
  -[UICollectionView setContentInset:](self->_menuBarCollectionView, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  objc_storeStrong((id *)&self->_menuBarView, self->_menuBarCollectionView);
  [(VideosExtrasMainTemplateViewController *)self _recalculateSizes];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasMainTemplateViewController;
  [(VideosExtrasTemplateViewController *)&v8 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v4 = [(VideosExtrasMainTemplateViewController *)self templateElement];
  v5 = [v4 background];

  if (v5)
  {
    v6 = [(VideosExtrasMainTemplateViewController *)self templateElement];
    id v7 = [v6 background];
    [v3 addObject:v7];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasMainTemplateViewController;
  [(VideosExtrasElementViewController *)&v3 viewWillAppear:a3];
}

- (void)_prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)VideosExtrasMainTemplateViewController;
  [(VideosExtrasElementViewController *)&v3 _prepareLayout];
  [(VideosExtrasMainTemplateViewController *)self _recalculateSizes];
}

- (double)collectionViewHeight
{
  [(NSLayoutConstraint *)self->_collectionViewHeightConstraint constant];
  return result;
}

- (void)setCollectionViewHeight:(double)a3
{
  collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  if (!collectionViewHeightConstraint)
  {
    v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_menuBarCollectionView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:a3];
    id v7 = self->_collectionViewHeightConstraint;
    self->_collectionViewHeightConstraint = v6;

    [(NSLayoutConstraint *)self->_collectionViewHeightConstraint setIdentifier:@"collectionViewHeight"];
    [(UICollectionView *)self->_menuBarCollectionView addConstraint:self->_collectionViewHeightConstraint];
    collectionViewHeightConstraint = self->_collectionViewHeightConstraint;
  }
  [(NSLayoutConstraint *)collectionViewHeightConstraint constant];
  if (v8 != a3) {
    [(NSLayoutConstraint *)self->_collectionViewHeightConstraint setConstant:a3];
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [v10 postNotificationName:@"VideosExtrasMainTemplateBarHeightChangeNotification" object:v9];
}

- (id)_menuItems
{
  v2 = [(VideosExtrasMainTemplateViewController *)self templateElement];
  objc_super v3 = [v2 menuBar];
  objc_super v4 = [v3 sections];
  v5 = [v4 lastObject];
  v6 = [v5 items];

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[VideosExtrasMainTemplateViewController numberOfItemsForSectionMetrics:](self, "numberOfItemsForSectionMetrics:", 0, a4);
}

- (id)_textElementAtIndex:(int64_t)a3
{
  objc_super v4 = [(VideosExtrasMainTemplateViewController *)self _menuItems];
  v5 = [v4 objectAtIndex:a3];
  v6 = [v5 title];

  return v6;
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  id v16 = a3;
  v6 = -[VideosExtrasMainTemplateViewController _textElementAtIndex:](self, "_textElementAtIndex:", [a4 item]);
  id v7 = [v16 textLabel];
  double v8 = [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics fittingFontDescriptor];
  v9 = [v8 objectForKey:*MEMORY[0x1E4FB0948]];
  id v10 = [MEMORY[0x1E4FB1438] sharedApplication];
  v11 = [v10 keyWindow];
  id v12 = [v11 traitCollection];

  v13 = [v12 preferredContentSizeCategory];
  if ((unint64_t)v13 <= *MEMORY[0x1E4FB2780])
  {
    v14 = 0;
  }
  else
  {
    v14 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithPreferredContentSizeCategory:");
  }
  [v7 configureForIKTextElement:v6 fontDescriptor:v8 textStyle:v9 capitalize:0 overrideWithTraitCollection:v14];
  v15 = [v16 contentView];
  [v15 invalidateIntrinsicContentSize];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"VideosExtrasMenuBarItemIdentifier" forIndexPath:v6];
  [(VideosExtrasMainTemplateViewController *)self _configureCell:v7 forIndexPath:v6];

  return v7;
}

- (BOOL)_collectionView:(id)a3 indexPathShouldDisplayAsSelected:(id)a4
{
  BOOL hasHadMenuSelection = self->_hasHadMenuSelection;
  id v7 = a4;
  if (hasHadMenuSelection)
  {
    double v8 = [a3 indexPathsForSelectedItems];
    char v9 = [v8 containsObject:v7];

    id v7 = v8;
  }
  else
  {
    char v9 = [(VideosExtrasMainTemplateViewController *)self _isFeatureItemAtIndexPath:v7];
  }

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  objc_msgSend(v8, "setSelected:", -[VideosExtrasMainTemplateViewController _collectionView:indexPathShouldDisplayAsSelected:](self, "_collectionView:indexPathShouldDisplayAsSelected:", a3, a5));
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return ![(VideosExtrasMainTemplateViewController *)self _collectionView:a3 indexPathShouldDisplayAsSelected:a4];
}

- (BOOL)_isFeatureItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(VideosExtrasMainTemplateViewController *)self _menuItems];
  uint64_t v6 = [v4 item];

  id v7 = [v5 objectAtIndex:v6];
  id v8 = [v7 attributes];
  char v9 = [v8 objectForKey:@"type"];

  LOBYTE(v8) = [v9 isEqualToString:@"video"];
  return (char)v8;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_hasHadMenuSelection)
  {
    self->_BOOL hasHadMenuSelection = 1;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = objc_msgSend(v6, "visibleCells", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v14 = [v6 indexPathForCell:v13];
          objc_msgSend(v13, "setSelected:", -[VideosExtrasMainTemplateViewController _collectionView:indexPathShouldDisplayAsSelected:](self, "_collectionView:indexPathShouldDisplayAsSelected:", v6, v14));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }
  }
  v15 = [(VideosExtrasMainTemplateViewController *)self _menuItems];
  id v16 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v7, "item"));
  v17 = [(VideosExtrasMainTemplateViewController *)self didSelectDelegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    v19 = [(VideosExtrasMainTemplateViewController *)self didSelectDelegate];
    [v19 collectionView:v6 didSelectItemAtIndexPath:v7];
  }
  if ([(VideosExtrasMainTemplateViewController *)self _isFeatureItemAtIndexPath:v7])
  {
    v20 = [(VideosExtrasTemplateViewController *)self context];
    v21 = [v20 extrasRootViewController];
    [v21 popToFeatureOrMain];
  }
  else
  {
    [v16 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:&__block_literal_global_122];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  mainMenuMetrics = self->_mainMenuMetrics;
  uint64_t v6 = objc_msgSend(a5, "item", a3, a4);
  [(VideosExtrasMainMenuSectionMetrics *)mainMenuMetrics sizeForCellAtIndex:v6];
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)numberOfItemsForSectionMetrics:(id)a3
{
  objc_super v3 = [(VideosExtrasMainTemplateViewController *)self _menuItems];
  int64_t v4 = [v3 count];

  return v4;
}

- (CGSize)sectionMetrics:(id)a3 sizeForItemAtIndex:(int64_t)a4 withFontDescriptor:(id)a5
{
  id v7 = a5;
  double v8 = +[_VideosExtrasMainMenuItemCollectionViewCell _createLabelInCell:0];
  uint64_t v9 = [(VideosExtrasMainTemplateViewController *)self _textElementAtIndex:a4];
  uint64_t v10 = [v7 objectForKey:*MEMORY[0x1E4FB0948]];
  uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v12 = [v11 keyWindow];
  v13 = [v12 traitCollection];

  v14 = [v13 preferredContentSizeCategory];
  v15 = 0;
  if ((unint64_t)v14 > *MEMORY[0x1E4FB2780])
  {
    v15 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithPreferredContentSizeCategory:");
  }
  [v8 configureForIKTextElement:v9 fontDescriptor:v7 textStyle:v10 capitalize:0 overrideWithTraitCollection:v15];
  [v8 intrinsicContentSize];
  double v17 = v16;
  char v18 = [v8 font];
  v19 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];
  double v21 = 40.0;
  if (!v20) {
    double v21 = 32.0;
  }
  [v18 _scaledValueForValue:v21];
  double v23 = v22;
  long long v24 = [(id)*MEMORY[0x1E4FB2608] keyWindow];
  [v24 safeAreaInsets];
  double v26 = v23 + v25;

  double v27 = v17;
  double v28 = v26;
  result.height = v28;
  result.width = v27;
  return result;
}

- (NSIndexPath)indexPathOfFeaturedItem
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(VideosExtrasMainTemplateViewController *)self _menuItems];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v8 = objc_msgSend(v7, "attributes", (void)v13);
        uint64_t v9 = [v8 objectForKey:@"type"];
        int v10 = [v9 isEqualToString:@"video"];

        if (v10)
        {
          uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v2, "indexOfObject:", v7), 0);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  return (NSIndexPath *)v11;
}

- (void)_recalculateSizes
{
  id v13 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950]];
  uint64_t v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28D8]];
  uint64_t v4 = self->_menuBarCollectionView;
  uint64_t v5 = [(VideosExtrasMainTemplateViewController *)self view];
  [v5 bounds];
  double v6 = fabs(CGRectGetWidth(v15));

  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics setDesiredFontDescriptor:v13];
  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics setMinimumFontDescriptor:v3];
  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics setMinimumCellSpacing:20.0];
  double v7 = 40.0;
  if (v6 <= 480.0) {
    double v7 = 30.0;
  }
  if (v6 >= 1024.0) {
    double v7 = 55.0;
  }
  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics setDesiredCellSpacing:v7];
  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics setDesiredWidth:v6];
  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics updateSizes];
  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics totalFittingSize];
  double v9 = v8;
  [(VideosExtrasMainTemplateViewController *)self setCollectionViewHeight:v10];
  if (v9 >= v6)
  {
    [(UICollectionView *)v4 setScrollEnabled:1];
    collectionViewLayout = self->_collectionViewLayout;
    [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics fittingCellSpacing];
  }
  else
  {
    [(UICollectionView *)v4 setScrollEnabled:0];
    collectionViewLayout = self->_collectionViewLayout;
  }
  UIEdgeInsetsMakeWithEdges();
  -[UICollectionViewFlowLayout setSectionInset:](collectionViewLayout, "setSectionInset:");
  id v12 = self->_collectionViewLayout;
  [(VideosExtrasMainMenuSectionMetrics *)self->_mainMenuMetrics fittingCellSpacing];
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](v12, "setMinimumInteritemSpacing:");
  [(UICollectionViewFlowLayout *)self->_collectionViewLayout invalidateLayout];
}

- (UIView)menuBarView
{
  return self->_menuBarView;
}

- (UICollectionViewDelegate)didSelectDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_didSelectDelegate);
  return (UICollectionViewDelegate *)WeakRetained;
}

- (void)setDidSelectDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_didSelectDelegate);
  objc_storeStrong((id *)&self->_menuBarView, 0);
  objc_storeStrong((id *)&self->_menuBarCollectionView, 0);
  objc_storeStrong((id *)&self->_collectionViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_mainMenuMetrics, 0);
}

@end