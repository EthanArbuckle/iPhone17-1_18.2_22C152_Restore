@interface VideosExtrasGridElementViewController
+ (id)_defaultCellStyle;
+ (id)_fontAttributesForTextStyle:(id)a3;
+ (id)extraLargeDetailStyle;
+ (id)extraLargeGalleryStyle;
+ (id)extraLargeStackGridStyle;
+ (id)keyPathsForValuesAffectingContentScrollView;
+ (id)largeDetailStyle;
+ (id)largeGalleryStyle;
+ (id)largeStackGridStyle;
+ (id)mediumDetailStyle;
+ (id)mediumGalleryStyle;
+ (id)mediumStackGridStyle;
+ (id)smallDetailStyle;
+ (id)smallGalleryStyle;
+ (id)smallStackGridStyle;
+ (id)wideDetailStyle;
+ (id)wideGalleryStyle;
+ (id)wideStackGridStyle;
- (BOOL)_hasDescriptionText;
- (BOOL)_sectionIndexIsDescriptionSection:(int64_t)a3;
- (BOOL)isShelfStyle;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)preferredContentSize;
- (UICollectionView)collectionView;
- (UIEdgeInsets)_sectionInsetsForSection:(id)a3;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (VideosExtrasGridElementViewController)initWithViewElement:(id)a3;
- (VideosExtrasGridViewControllerStyle)currentStyle;
- (VideosExtrasGridViewControllerStyle)extraLargeStyle;
- (VideosExtrasGridViewControllerStyle)largeStyle;
- (VideosExtrasGridViewControllerStyle)mediumStyle;
- (VideosExtrasGridViewControllerStyle)smallStyle;
- (VideosExtrasGridViewControllerStyle)wideStyle;
- (double)_cellSpacingForSection:(id)a3;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (id)_cellStyleForSection:(id)a3;
- (id)_lockupForIndexPath:(id)a3;
- (id)_narrowStyle;
- (id)_sectionElementForIndex:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)preferredLayoutGuide;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)preferredLayoutAttribute;
- (void)_dynamicTypeDidChange;
- (void)_prepareLayout;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)loadView;
- (void)setExtraLargeStyle:(id)a3;
- (void)setLargeStyle:(id)a3;
- (void)setMediumStyle:(id)a3;
- (void)setShelfStyle:(BOOL)a3;
- (void)setSmallStyle:(id)a3;
- (void)setViewElement:(id)a3;
- (void)setWideStyle:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VideosExtrasGridElementViewController

- (VideosExtrasGridElementViewController)initWithViewElement:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VideosExtrasGridElementViewController;
  v5 = [(VideosExtrasViewElementViewController *)&v9 initWithViewElement:0];
  v6 = v5;
  if (v5)
  {
    [(VideosExtrasGridElementViewController *)v5 setViewElement:v4];
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__dynamicTypeDidChange name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VideosExtrasGridElementViewController;
  [(VideosExtrasElementViewController *)&v4 dealloc];
}

- (CGSize)preferredContentSize
{
  [(_VideosExtrasShelfCollectionViewLayout *)self->_flowLayout calculatedContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setShelfStyle:(BOOL)a3
{
  self->_shelfStyle = a3;
  [(UICollectionViewFlowLayout *)self->_flowLayout setScrollDirection:a3];
  [(_VideosExtrasShelfCollectionViewLayout *)self->_flowLayout invalidateLayout];
  collectionView = self->_collectionView;
  [(UICollectionView *)collectionView reloadData];
}

- (UICollectionView)collectionView
{
  collectionView = self->_collectionView;
  if (!collectionView)
  {
    objc_super v4 = objc_alloc_init(_VideosExtrasShelfCollectionViewLayout);
    flowLayout = self->_flowLayout;
    self->_flowLayout = v4;

    [(UICollectionViewFlowLayout *)self->_flowLayout setScrollDirection:[(VideosExtrasGridElementViewController *)self isShelfStyle]];
    id v6 = objc_alloc(MEMORY[0x1E4FB1568]);
    v7 = (UICollectionView *)objc_msgSend(v6, "initWithFrame:collectionViewLayout:", self->_flowLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v8 = self->_collectionView;
    self->_collectionView = v7;

    [(UICollectionView *)self->_collectionView setDelegate:self];
    [(UICollectionView *)self->_collectionView setDataSource:self];
    objc_super v9 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)self->_collectionView setBackgroundColor:v9];

    [(UICollectionView *)self->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"GridCellID"];
    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:@"TextCellID"];
    [(UICollectionView *)self->_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"ReusableHeaderID"];
    [(UICollectionView *)self->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)self->_collectionView setShowsVerticalScrollIndicator:0];
    collectionView = self->_collectionView;
  }
  return collectionView;
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasGridElementViewController;
  [(VideosExtrasGridElementViewController *)&v8 loadView];
  double v3 = [(VideosExtrasGridElementViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  v5 = [(VideosExtrasGridElementViewController *)self collectionView];
  [v3 addSubview:v5];

  id v6 = (_VideosExtrasGridHeaderView *)[[_VideosExtrasGridHeaderView alloc] initForAutolayout];
  headerView = self->_headerView;
  self->_headerView = v6;

  [v3 addSubview:self->_headerView];
}

+ (id)keyPathsForValuesAffectingContentScrollView
{
  double v2 = (void *)keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet;
  if (!keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"collectionView"];
    objc_super v4 = (void *)keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet;
    keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet = v3;

    double v2 = (void *)keyPathsForValuesAffectingContentScrollView_contentScrollViewKVOSet;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VideosExtrasGridElementViewController;
  [(VideosExtrasElementViewController *)&v16 viewWillAppear:a3];
  objc_super v4 = [(VideosExtrasViewElementViewController *)self viewElement];
  v5 = [v4 header];

  id v6 = [v5 image];
  v7 = [v5 title];
  objc_super v8 = [v5 subtitle];
  objc_super v9 = [(VideosExtrasGridElementViewController *)self currentStyle];
  v10 = [v9 headerStyle];
  if (v10) {
    [(_VideosExtrasGridHeaderView *)self->_headerView configureForImage:v6 title:v7 subtitle:v8 style:v10];
  }
  v11 = [(VideosExtrasGridElementViewController *)self collectionView];
  [v11 reloadData];

  v12 = [(VideosExtrasGridElementViewController *)self view];
  [v12 bringSubviewToFront:self->_headerView];

  v13 = [(VideosExtrasGridElementViewController *)self view];
  [v13 bringSubviewToFront:self->_titleRule];

  v14 = [(VideosExtrasGridElementViewController *)self view];
  v15 = [(VideosExtrasGridElementViewController *)self collectionView];
  [v14 bringSubviewToFront:v15];
}

- (void)setViewElement:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasViewElementViewController *)self viewElement];

  if (v5 != v4)
  {
    v13.receiver = self;
    v13.super_class = (Class)VideosExtrasGridElementViewController;
    [(VideosExtrasViewElementViewController *)&v13 setViewElement:v4];
    id v6 = [(VideosExtrasViewElementViewController *)self viewElement];
    v7 = [v6 header];

    objc_super v8 = [v7 image];
    objc_super v9 = [v7 title];
    v10 = [v7 subtitle];
    v11 = [(VideosExtrasGridElementViewController *)self currentStyle];
    v12 = [v11 headerStyle];
    if (v12) {
      [(_VideosExtrasGridHeaderView *)self->_headerView configureForImage:v8 title:v9 subtitle:v10 style:v12];
    }
    objc_opt_class();
    [(VideosExtrasGridElementViewController *)self setShelfStyle:(objc_opt_isKindOfClass() & 1) == 0];
  }
}

- (BOOL)_hasDescriptionText
{
  double v2 = [(VideosExtrasViewElementViewController *)self viewElement];
  uint64_t v3 = [v2 header];
  id v4 = [v3 descriptionText];
  id v5 = [v4 text];
  BOOL v6 = [v5 length] != 0;

  return v6;
}

- (BOOL)_sectionIndexIsDescriptionSection:(int64_t)a3
{
  BOOL result = [(VideosExtrasGridElementViewController *)self _hasDescriptionText];
  if (a3) {
    return 0;
  }
  return result;
}

- (id)_lockupForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VideosExtrasGridElementViewController *)self _hasDescriptionText];
  uint64_t v6 = [v4 section] - v5;
  v7 = [(VideosExtrasViewElementViewController *)self viewElement];
  objc_super v8 = [v7 sections];
  objc_super v9 = [v8 objectAtIndex:v6];
  v10 = [v9 items];
  v11 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v4, "row"));

  return v11;
}

- (id)_sectionElementForIndex:(unint64_t)a3
{
  if (-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:"))
  {
    BOOL v5 = 0;
  }
  else
  {
    unint64_t v6 = a3 - [(VideosExtrasGridElementViewController *)self _hasDescriptionText];
    v7 = [(VideosExtrasViewElementViewController *)self viewElement];
    objc_super v8 = [v7 sections];
    BOOL v5 = [v8 objectAtIndex:v6];
  }
  return v5;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(VideosExtrasGridElementViewController *)self currentStyle];
  if (-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", [v10 section]))
  {
    if (collectionView_layout_sizeForItemAtIndexPath__onceToken != -1) {
      dispatch_once(&collectionView_layout_sizeForItemAtIndexPath__onceToken, &__block_literal_global_48);
    }
    v12 = (void *)collectionView_layout_sizeForItemAtIndexPath____textCell;
    objc_super v13 = [(VideosExtrasViewElementViewController *)self viewElement];
    v14 = [v13 header];
    v15 = [v14 descriptionText];
    objc_super v16 = [v11 detailTextStyle];
    [v12 configureForTextElement:v15 style:v16];

    -[VideosExtrasGridElementViewController collectionView:layout:insetForSectionAtIndex:](self, "collectionView:layout:insetForSectionAtIndex:", v8, v9, [v10 section]);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [v8 frame];
    objc_msgSend((id)collectionView_layout_sizeForItemAtIndexPath____textCell, "sizeThatFits:", v25 - v20 - v24, v26 - v18 - v22);
    double v28 = v27;
    double v30 = v29;
  }
  else
  {
    v31 = -[VideosExtrasGridElementViewController _sectionElementForIndex:](self, "_sectionElementForIndex:", [v10 section]);
    v32 = [(VideosExtrasGridElementViewController *)self _cellStyleForSection:v31];
    v33 = [(VideosExtrasGridElementViewController *)self _lockupForIndexPath:v10];
    if (collectionView_layout_sizeForItemAtIndexPath__onceToken_82 != -1) {
      dispatch_once(&collectionView_layout_sizeForItemAtIndexPath__onceToken_82, &__block_literal_global_84);
    }
    [(id)collectionView_layout_sizeForItemAtIndexPath____sizeCell configureForLockup:v33 cellStyle:v32 withSizing:1];
    objc_msgSend((id)collectionView_layout_sizeForItemAtIndexPath____sizeCell, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C70], *(double *)(MEMORY[0x1E4FB2C70] + 8));
    double v28 = v34;
    double v30 = v35;
  }
  double v36 = v28;
  double v37 = v30;
  result.height = v37;
  result.width = v36;
  return result;
}

void __86__VideosExtrasGridElementViewController_collectionView_layout_sizeForItemAtIndexPath___block_invoke()
{
  v0 = [VideosExtrasDetailTextCell alloc];
  uint64_t v1 = -[VideosExtrasDetailTextCell initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v2 = (void *)collectionView_layout_sizeForItemAtIndexPath____textCell;
  collectionView_layout_sizeForItemAtIndexPath____textCell = v1;
}

void __86__VideosExtrasGridElementViewController_collectionView_layout_sizeForItemAtIndexPath___block_invoke_2()
{
  v0 = objc_alloc_init(VideosExtrasGridCollectionViewCell);
  uint64_t v1 = (void *)collectionView_layout_sizeForItemAtIndexPath____sizeCell;
  collectionView_layout_sizeForItemAtIndexPath____sizeCell = (uint64_t)v0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  v7 = [(VideosExtrasGridElementViewController *)self currentStyle];
  if ([(VideosExtrasGridElementViewController *)self _sectionIndexIsDescriptionSection:a5])
  {
    [v7 detailInsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    objc_super v16 = [(VideosExtrasGridElementViewController *)self _sectionElementForIndex:a5];
    [(VideosExtrasGridElementViewController *)self _sectionInsetsForSection:v16];
    double v9 = v17;
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
  }
  double v21 = v9;
  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  v7 = -[VideosExtrasGridElementViewController _sectionElementForIndex:](self, "_sectionElementForIndex:", a5, a4);

  if (!v7) {
    return 0.0;
  }
  double v8 = [(VideosExtrasGridElementViewController *)self _sectionElementForIndex:a5];
  [(VideosExtrasGridElementViewController *)self _cellSpacingForSection:v8];
  double v10 = v9;

  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = [(VideosExtrasViewElementViewController *)self viewElement];
  BOOL v5 = [v4 sections];
  uint64_t v6 = [v5 count];

  return v6 + [(VideosExtrasGridElementViewController *)self _hasDescriptionText];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if ([(VideosExtrasGridElementViewController *)self _hasDescriptionText])
  {
    if ([(VideosExtrasGridElementViewController *)self _sectionIndexIsDescriptionSection:a4])
    {
      return 1;
    }
    v7 = [(VideosExtrasViewElementViewController *)self viewElement];
    double v8 = [v7 sections];
    double v9 = v8;
    int64_t v10 = a4 - 1;
  }
  else
  {
    v7 = [(VideosExtrasViewElementViewController *)self viewElement];
    double v8 = [v7 sections];
    double v9 = v8;
    int64_t v10 = a4;
  }
  double v11 = [v8 objectAtIndex:v10];
  double v12 = [v11 items];
  int64_t v13 = [v12 count];

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(VideosExtrasGridElementViewController *)self currentStyle];
  if (-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", [v6 section]))
  {
    double v9 = [v7 dequeueReusableCellWithReuseIdentifier:@"TextCellID" forIndexPath:v6];

    int64_t v10 = [(VideosExtrasViewElementViewController *)self viewElement];
    double v11 = [v10 header];
    double v12 = [v11 descriptionText];

    int64_t v13 = [v8 detailTextStyle];
    [v9 configureForTextElement:v12 style:v13];
  }
  else
  {
    double v9 = [v7 dequeueReusableCellWithReuseIdentifier:@"GridCellID" forIndexPath:v6];

    double v12 = [(VideosExtrasGridElementViewController *)self _lockupForIndexPath:v6];
    int64_t v13 = -[VideosExtrasGridElementViewController _sectionElementForIndex:](self, "_sectionElementForIndex:", [v6 section]);
    double v14 = [(VideosExtrasGridElementViewController *)self _cellStyleForSection:v13];
    [v9 configureForLockup:v12 cellStyle:v14];
  }
  return v9;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6 = a4;
  if (!-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", [v6 section]))
  {
    BOOL v5 = [(VideosExtrasGridElementViewController *)self _lockupForIndexPath:v6];
    [v5 dispatchEventOfType:4 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!-[VideosExtrasGridElementViewController _sectionIndexIsDescriptionSection:](self, "_sectionIndexIsDescriptionSection:", [v6 section]))
  {
    id v7 = [(VideosExtrasGridElementViewController *)self _lockupForIndexPath:v6];
    [v8 deselectItemAtIndexPath:v6 animated:1];
    [v7 dispatchEventOfType:2 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  double v9 = [a3 dequeueReusableSupplementaryViewOfKind:a4 withReuseIdentifier:@"ReusableHeaderID" forIndexPath:v8];
  LODWORD(a3) = [(VideosExtrasGridElementViewController *)self _hasDescriptionText];
  uint64_t v10 = [v8 section];

  uint64_t v11 = v10 - a3;
  double v12 = [(VideosExtrasViewElementViewController *)self viewElement];
  int64_t v13 = [v12 sections];
  double v14 = [v13 objectAtIndex:v11];

  double v15 = [v14 header];
  objc_super v16 = [(VideosExtrasGridElementViewController *)self currentStyle];
  double v17 = [v16 sectionHeaderStyle];

  [v9 configureForHeaderElement:v15 headerStyle:v17];
  return v9;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (collectionView_layout_referenceSizeForHeaderInSection__onceToken != -1) {
    dispatch_once(&collectionView_layout_referenceSizeForHeaderInSection__onceToken, &__block_literal_global_86);
  }
  double v10 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (![(VideosExtrasGridElementViewController *)self _sectionIndexIsDescriptionSection:a5])
  {
    int64_t v12 = a5 - [(VideosExtrasGridElementViewController *)self _hasDescriptionText];
    int64_t v13 = [(VideosExtrasViewElementViewController *)self viewElement];
    double v14 = [v13 sections];
    double v15 = [v14 objectAtIndex:v12];

    objc_super v16 = [v15 header];
    if (v16)
    {
      double v17 = [(VideosExtrasGridElementViewController *)self currentStyle];
      double v18 = [v17 sectionHeaderStyle];

      [(id)collectionView_layout_referenceSizeForHeaderInSection____sizingView configureForHeaderElement:v16 headerStyle:v18];
      objc_msgSend((id)collectionView_layout_referenceSizeForHeaderInSection____sizingView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C70], *(double *)(MEMORY[0x1E4FB2C70] + 8));
      double v10 = v19;
      double v11 = v20;
    }
  }

  double v21 = v10;
  double v22 = v11;
  result.height = v22;
  result.width = v21;
  return result;
}

void __95__VideosExtrasGridElementViewController_collectionView_layout_referenceSizeForHeaderInSection___block_invoke()
{
  v0 = objc_alloc_init(VideosExtrasCollectionReusableView);
  uint64_t v1 = (void *)collectionView_layout_referenceSizeForHeaderInSection____sizingView;
  collectionView_layout_referenceSizeForHeaderInSection____sizingView = (uint64_t)v0;
}

- (id)preferredLayoutGuide
{
  uint64_t v3 = [(_VideosExtrasGridHeaderView *)self->_headerView titleLabel];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(VideosExtrasGridElementViewController *)self view];
  }
  id v6 = v5;

  return v6;
}

- (int64_t)preferredLayoutAttribute
{
  return 3;
}

- (id)_cellStyleForSection:(id)a3
{
  id v4 = [a3 style];
  id v5 = [v4 valueForStyle:@"extras-itml-section-content-type"];

  id v6 = [(VideosExtrasGridElementViewController *)self currentStyle];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 isEqualToString:@"extras-image"])
    {
      uint64_t v7 = [v6 imageCellStyle];
      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"extras-video"])
    {
      uint64_t v7 = [v6 videoCellStyle];
      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"extras-product"])
    {
      uint64_t v7 = [v6 productCellStyle];
LABEL_8:
      id v8 = (void *)v7;
      if (v7) {
        goto LABEL_10;
      }
    }
  }
  id v8 = [v6 defaultCellStyle];
LABEL_10:

  return v8;
}

- (UIEdgeInsets)_sectionInsetsForSection:(id)a3
{
  id v4 = [a3 style];
  id v5 = [v4 valueForStyle:@"extras-itml-section-content-type"];

  id v6 = [(VideosExtrasGridElementViewController *)self currentStyle];
  [v6 defaultCellSectionInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 isEqualToString:@"extras-image"])
    {
      [v6 imageCellSectionInsets];
LABEL_8:
      double v8 = v15;
      double v10 = v16;
      double v12 = v17;
      double v14 = v18;
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"extras-video"])
    {
      [v6 videoCellSectionInsets];
      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"extras-product"])
    {
      [v6 productCellSectionInsets];
      goto LABEL_8;
    }
  }
LABEL_9:

  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (double)_cellSpacingForSection:(id)a3
{
  id v4 = a3;
  id v5 = [(VideosExtrasGridElementViewController *)self currentStyle];
  [v5 defaultSpacing];
  double v7 = v6;
  double v8 = [v4 style];

  double v9 = [v8 valueForStyle:@"extras-itml-section-content-type"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v9 isEqualToString:@"extras-image"])
    {
      [v5 imageSpacing];
LABEL_8:
      double v7 = v10;
      goto LABEL_9;
    }
    if ([v9 isEqualToString:@"extras-video"])
    {
      [v5 videoSpacing];
      goto LABEL_8;
    }
    if ([v9 isEqualToString:@"extras-product"])
    {
      [v5 productSpacing];
      goto LABEL_8;
    }
  }
LABEL_9:

  return v7;
}

- (VideosExtrasGridViewControllerStyle)currentStyle
{
  if ([(VideosExtrasElementViewController *)self isWide])
  {
    uint64_t v3 = self->_wideStyle;
  }
  else
  {
    uint64_t v3 = [(VideosExtrasGridElementViewController *)self _narrowStyle];
  }
  return v3;
}

- (id)_narrowStyle
{
  uint64_t v3 = [(VideosExtrasGridElementViewController *)self view];
  [v3 bounds];
  double v5 = v4;

  if (fabs(v5 + -480.0) < 0.00000011920929)
  {
    double v6 = [(VideosExtrasGridElementViewController *)self smallStyle];
    goto LABEL_10;
  }
  if (fabs(v5 + -568.0) < 0.00000011920929) {
    goto LABEL_4;
  }
  if (fabs(v5 + -667.0) >= 0.00000011920929)
  {
    if (fabs(v5 + -736.0) >= 0.00000011920929 && fabs(v5 + -812.0) >= 0.00000011920929)
    {
LABEL_4:
      double v6 = [(VideosExtrasGridElementViewController *)self mediumStyle];
      goto LABEL_10;
    }
    double v6 = [(VideosExtrasGridElementViewController *)self extraLargeStyle];
  }
  else
  {
    double v6 = [(VideosExtrasGridElementViewController *)self largeStyle];
  }
LABEL_10:
  return v6;
}

- (void)_dynamicTypeDidChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(_VideosExtrasGridHeaderView *)self->_headerView invalidateIntrinsicContentSize];
  uint64_t v3 = [(VideosExtrasGridElementViewController *)self collectionView];
  double v4 = [v3 collectionViewLayout];

  [v4 invalidateLayout];
  double v5 = [(VideosExtrasGridElementViewController *)self collectionView];
  double v6 = [v5 visibleCells];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "updateConstraintsIfNeeded", (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_prepareLayout
{
  v86.receiver = self;
  v86.super_class = (Class)VideosExtrasGridElementViewController;
  [(VideosExtrasElementViewController *)&v86 _prepareLayout];
  uint64_t v3 = [(VideosExtrasGridElementViewController *)self view];
  if (![(VideosExtrasViewElementViewController *)self embedded])
  {
    double v4 = [(VideosExtrasElementViewController *)self backgroundViewController];
    [v4 setVignetteType:3];
  }
  double v5 = [(VideosExtrasGridElementViewController *)self currentStyle];
  double v6 = [v5 backgroundColor];
  [v3 setBackgroundColor:v6];

  int v7 = [v5 showsScrollFade];
  titleRule = self->_titleRule;
  uint64_t v9 = &OBJC_IVAR___VUIMediaController__playbackLoadingTimer;
  if (v7)
  {
    if (!titleRule)
    {
      uint64_t v10 = [(id)objc_opt_class() _borderView];
      uint64_t v11 = self->_titleRule;
      self->_titleRule = v10;

      [(UIView *)self->_titleRule setTranslatesAutoresizingMaskIntoConstraints:0];
      [v3 addSubview:self->_titleRule];
    }
    if (!self->_titleRuleConstraints)
    {
      long long v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_titleRule attribute:4 relatedBy:0 toItem:self->_headerView attribute:4 multiplier:1.0 constant:0.0];
      long long v13 = [v5 headerStyle];
      [v13 insets];
      double v15 = v14;
      double v17 = v16;

      double v18 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", self->_titleRule, self->_collectionView, 10, 0.0, v15, 0.0, v17);
      double v19 = [v18 arrayByAddingObject:v12];
      titleRuleConstraints = self->_titleRuleConstraints;
      self->_titleRuleConstraints = v19;
    }
    double v21 = [(VideosExtrasGridElementViewController *)self view];
    [v21 addConstraints:self->_titleRuleConstraints];

    double v22 = [(VideosExtrasGridElementViewController *)self view];
    [v22 bringSubviewToFront:self->_titleRule];
  }
  else
  {
    if (titleRule) {
      [(UIView *)titleRule removeFromSuperview];
    }
    if (self->_titleRuleConstraints) {
      objc_msgSend(v3, "removeConstraints:");
    }
  }
  p_headerViewConstraints = &self->_headerViewConstraints;
  if (self->_headerViewConstraints)
  {
    objc_msgSend(v3, "removeConstraints:");
    double v24 = *p_headerViewConstraints;
    *p_headerViewConstraints = 0;
  }
  double v25 = [(VideosExtrasGridElementViewController *)self currentStyle];
  uint64_t v26 = [v25 headerStyle];

  double v27 = [MEMORY[0x1E4F1CA48] array];
  v84 = (void *)v26;
  if (v26)
  {
    double v28 = [(VideosExtrasGridElementViewController *)self view];
    [v28 addSubview:self->_headerView];

    double v29 = [(VideosExtrasGridElementViewController *)self currentStyle];
    [v29 headerStyle];
    double v30 = v85 = v3;
    [v30 insets];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;

    v39 = (void *)MEMORY[0x1E4F28DC8];
    headerView = self->_headerView;
    [(VideosExtrasGridElementViewController *)self view];
    v41 = v83 = v5;
    v42 = [v41 safeAreaLayoutGuide];
    v43 = [v39 constraintWithItem:headerView attribute:3 relatedBy:0 toItem:v42 attribute:3 multiplier:1.0 constant:v32];

    v44 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsByAttachingView:toView:alongEdges:insets:", self->_headerView, v85, 10, v32, v34, v36, v38);
    v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_headerView attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:50.0];
    v46 = (void *)MEMORY[0x1E4F28DC8];
    v47 = [(VideosExtrasGridElementViewController *)self collectionView];
    v48 = objc_msgSend(v46, "constraintsByAttachingView:toView:alongEdges:insets:", v47, v85, 14, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

    v49 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [(VideosExtrasGridElementViewController *)self collectionView];
    v51 = [v49 constraintWithItem:v50 attribute:3 relatedBy:0 toItem:self->_headerView attribute:4 multiplier:1.0 constant:v36];

    [v27 addObject:v43];
    [v27 addObjectsFromArray:v44];
    [v27 addObject:v45];
    [v27 addObjectsFromArray:v48];
    [v27 addObject:v51];

    uint64_t v9 = &OBJC_IVAR___VUIMediaController__playbackLoadingTimer;
    double v5 = v83;

    uint64_t v3 = v85;
  }
  else
  {
    [(_VideosExtrasGridHeaderView *)self->_headerView removeFromSuperview];
    v52 = (void *)MEMORY[0x1E4F28DC8];
    v53 = [(VideosExtrasGridElementViewController *)self collectionView];
    v43 = objc_msgSend(v52, "constraintsByAttachingView:toView:alongEdges:insets:", v53, v3, 15, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

    [v27 addObjectsFromArray:v43];
  }

  objc_storeStrong((id *)&self->_headerViewConstraints, v27);
  [v3 addConstraints:v27];
  [v5 collectionViewInsets];
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  double v61 = v60;
  v62 = [(VideosExtrasGridElementViewController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if ([(VideosExtrasElementViewController *)self isWide]) {
      double v59 = 60.0;
    }
    else {
      double v59 = 70.0;
    }
  }
  if ([v5 adjustsContentInsetByBottomNavBar])
  {
    v64 = [(VideosExtrasGridElementViewController *)self navigationController];
    char v65 = objc_opt_respondsToSelector();

    if (v65)
    {
      v66 = [(VideosExtrasGridElementViewController *)self navigationController];
      v67 = [v66 mainTemplateViewController];
      v68 = [v67 view];
      [v68 bounds];
      double v70 = v69;

      if (v70 > v59)
      {
        v71 = [v67 menuBarView];
        [v71 bounds];
        double v73 = v72;

        if (v59 < v73) {
          double v59 = v73;
        }
      }
    }
  }
  v74 = (id *)MEMORY[0x1E4FB2608];
  v75 = [(id)*MEMORY[0x1E4FB2608] keyWindow];
  [v75 safeAreaInsets];
  double v77 = v57 + v76;

  v78 = [*v74 keyWindow];
  [v78 safeAreaInsets];
  double v80 = v61 + v79;

  uint64_t v81 = v9[135];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v81), "setContentInset:", v55, v77, v59, v80);
  [*(id *)((char *)&self->super.super.super.super.super.isa + v81) setContentInsetAdjustmentBehavior:2];
  v82 = [*(id *)((char *)&self->super.super.super.super.super.isa + v81) collectionViewLayout];
  [v82 invalidateLayout];

  [v5 defaultSpacing];
  -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](self->_flowLayout, "setMinimumInteritemSpacing:");
  [v5 cellLineSpacing];
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_flowLayout, "setMinimumLineSpacing:");
}

+ (id)_fontAttributesForTextStyle:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:a3];
  v8[0] = *MEMORY[0x1E4FB0908];
  double v4 = [v3 familyName];
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E4FB0918];
  double v5 = [v3 fontName];
  v9[1] = v5;
  double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

+ (id)_defaultCellStyle
{
  uint64_t v3 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v3, "setImageSize:", 90.0, 90.0);
  [(VideosExtrasGridCellStyle *)v3 setTitleFirstBaselineHeight:20.0];
  uint64_t v4 = *MEMORY[0x1E4FB28D8];
  [(VideosExtrasGridCellStyle *)v3 setTitleTextStyle:*MEMORY[0x1E4FB28D8]];
  double v5 = [a1 _fontAttributesForTextStyle:v4];
  [(VideosExtrasGridCellStyle *)v3 setTitleDefaultFontAttributes:v5];

  double v6 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v3 setTitleTextColor:v6];

  [(VideosExtrasGridCellStyle *)v3 setTextFirstBaselineToBottom:30.0];
  [(VideosExtrasGridCellStyle *)v3 setTextLastBaselineToBottom:10.0];
  int v7 = [a1 _fontAttributesForTextStyle:v4];
  [(VideosExtrasGridCellStyle *)v3 setSubtitleDefaultFontAttributes:v7];

  uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v3 setSubtitleTextColor:v8];

  [(VideosExtrasGridCellStyle *)v3 setSubtitleTextStyle:v4];
  [(VideosExtrasGridCellStyle *)v3 setSubtitleFirstBaselineHeight:18.0];
  [(VideosExtrasGridCellStyle *)v3 setDefaultTextAlignment:1];
  return v3;
}

+ (id)wideGalleryStyle
{
  uint64_t v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  uint64_t v4 = [a1 _defaultCellStyle];
  objc_msgSend(v4, "setImageSize:", 170.0, 170.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultCellStyle:v4];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageCellStyle:v4];
  double v5 = [a1 _defaultCellStyle];
  objc_msgSend(v5, "setImageSize:", 224.0, 126.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoCellStyle:v5];
  double v6 = [a1 _defaultCellStyle];
  objc_msgSend(v6, "setImageSize:", 114.0, 170.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setProductCellStyle:v6];
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", 280.0, 15.0, 0.0, 15.0);
  int v7 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  uint64_t v8 = *MEMORY[0x1E4FB28C8];
  [(VideosExtrasGridSectionHeaderStyle *)v7 setTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v9 = [a1 _fontAttributesForTextStyle:v8];
  [(VideosExtrasGridSectionHeaderStyle *)v7 setDefaultFontAttributes:v9];

  uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [(VideosExtrasGridSectionHeaderStyle *)v7 setTextColor:v10];

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v7, "setInsets:", 0.0, 5.0, 0.0, 5.0);
  [(VideosExtrasGridSectionHeaderStyle *)v7 setTextBaselineDescender:15.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setSectionHeaderStyle:v7];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultSpacing:32.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageSpacing:32.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoSpacing:29.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductSpacing:40.0];
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", 0.0, 5.0, 0.0, 5.0);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", 0.0, 5.0, 0.0, 5.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", 0.0, 5.0, 0.0, 5.0);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", 0.0, 5.0, 0.0, 5.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setCellLineSpacing:0.0];
  uint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
  [(VideosExtrasGridViewControllerStyle *)v3 setBackgroundColor:v11];

  [(VideosExtrasGridViewControllerStyle *)v3 setShowsScrollFade:0];
  [(VideosExtrasGridViewControllerStyle *)v3 setAdjustsContentInsetByBottomNavBar:1];

  return v3;
}

+ (id)smallGalleryStyle
{
  uint64_t v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  uint64_t v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 120.0, 120.0);
  [(VideosExtrasGridCellStyle *)v4 setTitleFirstBaselineHeight:20.0];
  uint64_t v5 = *MEMORY[0x1E4FB28E0];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextStyle:*MEMORY[0x1E4FB28E0]];
  double v6 = [a1 _fontAttributesForTextStyle:v5];
  [(VideosExtrasGridCellStyle *)v4 setTitleDefaultFontAttributes:v6];
  int v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextColor:v7];

  [(VideosExtrasGridCellStyle *)v4 setTextFirstBaselineToBottom:30.0];
  [(VideosExtrasGridCellStyle *)v4 setTextLastBaselineToBottom:10.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleDefaultFontAttributes:v6];
  uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextColor:v8];

  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextStyle:*MEMORY[0x1E4FB28D8]];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleFirstBaselineHeight:18.0];
  [(VideosExtrasGridCellStyle *)v4 setDefaultTextAlignment:1];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultCellStyle:v4];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageCellStyle:v4];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductCellStyle:v4];
  uint64_t v9 = (void *)[(VideosExtrasGridCellStyle *)v4 copy];
  objc_msgSend(v9, "setImageSize:", 125.0, 70.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoCellStyle:v9];
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", 112.0, 0.0, 0.0, 0.0);
  uint64_t v10 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  [(VideosExtrasGridSectionHeaderStyle *)v10 setTextStyle:*MEMORY[0x1E4FB2950]];
  [(VideosExtrasGridSectionHeaderStyle *)v10 setDefaultFontAttributes:v6];
  uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
  [(VideosExtrasGridSectionHeaderStyle *)v10 setTextColor:v11];

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v10, "setInsets:", 15.0, 15.0, 5.0, 15.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setSectionHeaderStyle:v10];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultSpacing:45.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageSpacing:45.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoSpacing:37.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductSpacing:45.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setCellLineSpacing:0.0];
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", 0.0, 15.0, 0.0, 15.0);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", 0.0, 15.0, 0.0, 15.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", 0.0, 15.0, 0.0, 15.0);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", 0.0, 15.0, 0.0, 15.0);
  long long v12 = [MEMORY[0x1E4FB1618] clearColor];
  [(VideosExtrasGridViewControllerStyle *)v3 setBackgroundColor:v12];

  [(VideosExtrasGridViewControllerStyle *)v3 setShowsScrollFade:0];
  [(VideosExtrasGridViewControllerStyle *)v3 setAdjustsContentInsetByBottomNavBar:1];

  return v3;
}

+ (id)mediumGalleryStyle
{
  double v2 = [a1 smallGalleryStyle];
  [v2 setDefaultSpacing:19.0];
  [v2 setImageSpacing:19.0];
  [v2 setVideoSpacing:12.0];
  [v2 setProductSpacing:19.0];
  return v2;
}

+ (id)largeGalleryStyle
{
  double v2 = [a1 smallGalleryStyle];
  [v2 collectionViewInsets];
  [v2 setCollectionViewInsets:155.0];
  [v2 setDefaultSpacing:8.0];
  [v2 setImageSpacing:8.0];
  [v2 setVideoSpacing:12.0];
  [v2 setProductSpacing:8.0];
  return v2;
}

+ (id)extraLargeGalleryStyle
{
  double v2 = [a1 smallGalleryStyle];
  [v2 collectionViewInsets];
  [v2 setCollectionViewInsets:160.0];
  uint64_t v3 = [v2 defaultCellStyle];
  objc_msgSend(v3, "setImageSize:", 160.0, 160.0);

  uint64_t v4 = [v2 imageCellStyle];
  objc_msgSend(v4, "setImageSize:", 160.0, 160.0);

  uint64_t v5 = [v2 videoCellStyle];
  objc_msgSend(v5, "setImageSize:", 160.0, 90.0);

  double v6 = [v2 productCellStyle];
  objc_msgSend(v6, "setImageSize:", 160.0, 160.0);

  [v2 setDefaultSpacing:22.0];
  [v2 setImageSpacing:22.0];
  [v2 setVideoSpacing:22.0];
  [v2 setProductSpacing:22.0];
  return v2;
}

+ (id)wideDetailStyle
{
  uint64_t v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  uint64_t v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 160.0, 160.0);
  uint64_t v5 = *MEMORY[0x1E4FB28D8];
  double v6 = [a1 _fontAttributesForTextStyle:*MEMORY[0x1E4FB28D8]];
  [(VideosExtrasGridCellStyle *)v4 setTitleDefaultFontAttributes:v6];

  [(VideosExtrasGridCellStyle *)v4 setTitleFirstBaselineHeight:20.0];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextStyle:v5];
  int v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextColor:v7];

  [(VideosExtrasGridCellStyle *)v4 setTextFirstBaselineToBottom:35.0];
  uint64_t v8 = [a1 _fontAttributesForTextStyle:v5];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleDefaultFontAttributes:v8];

  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextStyle:v5];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleFirstBaselineHeight:18.0];
  uint64_t v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextColor:v9];

  [(VideosExtrasGridCellStyle *)v4 setDefaultTextAlignment:1];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultCellStyle:v4];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageCellStyle:v4];
  uint64_t v10 = (void *)[(VideosExtrasGridCellStyle *)v4 copy];
  objc_msgSend(v10, "setImageSize:", 160.0, 90.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoCellStyle:v10];
  uint64_t v11 = (void *)[(VideosExtrasGridCellStyle *)v4 copy];
  objc_msgSend(v11, "setImageSize:", 160.0, 170.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setProductCellStyle:v11];
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  long long v12 = objc_alloc_init(VideosExtrasGridHeaderStyle);
  -[VideosExtrasGridHeaderStyle setInsets:](v12, "setInsets:", 15.0, 0.0, 0.0, 0.0);
  uint64_t v13 = *MEMORY[0x1E4FB28D0];
  [(VideosExtrasGridHeaderStyle *)v12 setTitleTextStyle:*MEMORY[0x1E4FB28D0]];
  double v14 = [a1 _fontAttributesForTextStyle:v13];
  [(VideosExtrasGridHeaderStyle *)v12 setTitleDefaultFontAttributes:v14];

  double v15 = [MEMORY[0x1E4FB1618] whiteColor];
  [(VideosExtrasGridHeaderStyle *)v12 setTitleColor:v15];

  uint64_t v16 = *MEMORY[0x1E4FB2950];
  [(VideosExtrasGridHeaderStyle *)v12 setSubtitleTextStyle:*MEMORY[0x1E4FB2950]];
  [(VideosExtrasGridHeaderStyle *)v12 setSubtitleLineHeight:25.0];
  double v17 = [a1 _fontAttributesForTextStyle:v16];
  [(VideosExtrasGridHeaderStyle *)v12 setSubtitleDefaultFontAttributes:v17];

  double v18 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
  [(VideosExtrasGridHeaderStyle *)v12 setSubtitleColor:v18];

  [(VideosExtrasGridHeaderStyle *)v12 setBottomLabelDescender:15.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setHeaderStyle:v12];
  uint64_t v19 = *MEMORY[0x1E4FB28F0];
  [(VideosExtrasGridViewControllerStyle *)v3 setDetailTextStyle:*MEMORY[0x1E4FB28F0]];
  double v20 = [a1 _fontAttributesForTextStyle:v19];
  [(VideosExtrasGridViewControllerStyle *)v3 setDetailDefaultFontAttributes:v20];

  double v21 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
  [(VideosExtrasGridViewControllerStyle *)v3 setDetailTextColor:v21];

  -[VideosExtrasGridViewControllerStyle setDetailInsets:](v3, "setDetailInsets:", 23.0, 10.0, 10.0, 10.0);
  double v22 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  [(VideosExtrasGridSectionHeaderStyle *)v22 setTextStyle:v16];
  double v23 = [a1 _fontAttributesForTextStyle:v16];
  [(VideosExtrasGridSectionHeaderStyle *)v22 setDefaultFontAttributes:v23];

  double v24 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [(VideosExtrasGridSectionHeaderStyle *)v22 setTextColor:v24];

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v22, "setInsets:", 10.0, 10.0, 5.0, 10.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setSectionHeaderStyle:v22];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultSpacing:20.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageSpacing:20.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoSpacing:20.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductSpacing:20.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setCellLineSpacing:0.0];
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", 20.0, 0.0, 0.0, 0.0);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", 20.0, 0.0, 0.0, 0.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", 20.0, 0.0, 0.0, 0.0);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", 20.0, 0.0, 0.0, 0.0);
  double v25 = [MEMORY[0x1E4FB1618] clearColor];
  [(VideosExtrasGridViewControllerStyle *)v3 setBackgroundColor:v25];

  [(VideosExtrasGridViewControllerStyle *)v3 setShowsScrollFade:1];
  [(VideosExtrasGridViewControllerStyle *)v3 setAdjustsContentInsetByBottomNavBar:1];

  return v3;
}

+ (id)smallDetailStyle
{
  uint64_t v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  uint64_t v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 90.0, 90.0);
  [(VideosExtrasGridCellStyle *)v4 setTitleFirstBaselineHeight:18.0];
  uint64_t v5 = *MEMORY[0x1E4FB28E0];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextStyle:*MEMORY[0x1E4FB28E0]];
  double v6 = [a1 _fontAttributesForTextStyle:v5];
  [(VideosExtrasGridCellStyle *)v4 setTitleDefaultFontAttributes:v6];
  int v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextColor:v7];

  [(VideosExtrasGridCellStyle *)v4 setTextFirstBaselineToBottom:30.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleDefaultFontAttributes:v6];
  uint64_t v8 = *MEMORY[0x1E4FB28D8];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextStyle:*MEMORY[0x1E4FB28D8]];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleFirstBaselineHeight:18.0];
  uint64_t v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextColor:v9];

  [(VideosExtrasGridCellStyle *)v4 setDefaultTextAlignment:1];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultCellStyle:v4];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageCellStyle:v4];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductCellStyle:v4];
  uint64_t v10 = (void *)[(VideosExtrasGridCellStyle *)v4 copy];
  objc_msgSend(v10, "setImageSize:", 125.0, 70.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoCellStyle:v10];
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  uint64_t v11 = objc_alloc_init(VideosExtrasGridHeaderStyle);
  [(VideosExtrasGridHeaderStyle *)v11 setShowsImage:1];
  -[VideosExtrasGridHeaderStyle setInsets:](v11, "setInsets:", 15.0, 34.0, 0.0, 34.0);
  [(VideosExtrasGridHeaderStyle *)v11 setTitleTextStyle:*MEMORY[0x1E4FB28D0]];
  [(VideosExtrasGridHeaderStyle *)v11 setTitleLineHeight:21.0];
  [(VideosExtrasGridHeaderStyle *)v11 setTitleDefaultFontAttributes:v6];
  long long v12 = [MEMORY[0x1E4FB1618] whiteColor];
  [(VideosExtrasGridHeaderStyle *)v11 setTitleColor:v12];

  uint64_t v13 = *MEMORY[0x1E4FB2950];
  [(VideosExtrasGridHeaderStyle *)v11 setSubtitleTextStyle:*MEMORY[0x1E4FB2950]];
  [(VideosExtrasGridHeaderStyle *)v11 setSubtitleLineHeight:20.0];
  [(VideosExtrasGridHeaderStyle *)v11 setSubtitleDefaultFontAttributes:v6];
  double v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
  [(VideosExtrasGridHeaderStyle *)v11 setSubtitleColor:v14];

  [(VideosExtrasGridHeaderStyle *)v11 setBottomLabelDescender:9.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setHeaderStyle:v11];
  [(VideosExtrasGridViewControllerStyle *)v3 setDetailTextStyle:v8];
  [(VideosExtrasGridViewControllerStyle *)v3 setDetailDefaultFontAttributes:v6];
  double v15 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.6];
  [(VideosExtrasGridViewControllerStyle *)v3 setDetailTextColor:v15];

  -[VideosExtrasGridViewControllerStyle setDetailInsets:](v3, "setDetailInsets:", 15.0, 34.0, 20.0, 34.0);
  uint64_t v16 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  [(VideosExtrasGridSectionHeaderStyle *)v16 setTextStyle:v13];
  [(VideosExtrasGridSectionHeaderStyle *)v16 setDefaultFontAttributes:v6];
  double v17 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [(VideosExtrasGridSectionHeaderStyle *)v16 setTextColor:v17];

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v16, "setInsets:", 20.0, 34.0, 5.0, 34.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setSectionHeaderStyle:v16];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultSpacing:10.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageSpacing:7.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoSpacing:18.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductSpacing:10.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setCellLineSpacing:0.0];
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", 15.0, 35.0, 0.0, 35.0);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", 15.0, 46.0, 0.0, 46.0);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", 15.0, 34.0, 0.0, 34.0);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", 15.0, 35.0, 0.0, 35.0);
  double v18 = [MEMORY[0x1E4FB1618] blackColor];
  [(VideosExtrasGridViewControllerStyle *)v3 setBackgroundColor:v18];

  [(VideosExtrasGridViewControllerStyle *)v3 setShowsScrollFade:1];
  [(VideosExtrasGridViewControllerStyle *)v3 setAdjustsContentInsetByBottomNavBar:1];

  return v3;
}

+ (id)mediumDetailStyle
{
  double v2 = [a1 smallDetailStyle];
  objc_msgSend(v2, "setDetailInsets:", 15.0, 78.0, 20.0, 78.0);
  uint64_t v3 = [v2 headerStyle];
  objc_msgSend(v3, "setInsets:", 15.0, 78.0, 0.0, 78.0);

  objc_msgSend(v2, "setDefaultCellSectionInsets:", 15.0, 79.0, 0.0, 79.0);
  objc_msgSend(v2, "setImageCellSectionInsets:", 15.0, 89.0, 0.0, 89.0);
  objc_msgSend(v2, "setVideoCellSectionInsets:", 15.0, 78.0, 0.0, 78.0);
  objc_msgSend(v2, "setProductCellSectionInsets:", 15.0, 79.0, 0.0, 79.0);
  return v2;
}

+ (id)largeDetailStyle
{
  double v2 = [a1 mediumDetailStyle];
  [v2 setDefaultSpacing:14.0];
  [v2 setImageSpacing:7.0];
  [v2 setVideoSpacing:28.0];
  [v2 setProductSpacing:14.0];
  return v2;
}

+ (id)extraLargeDetailStyle
{
  double v2 = [a1 smallDetailStyle];
  uint64_t v3 = [v2 defaultCellStyle];
  objc_msgSend(v3, "setImageSize:", 90.0, 90.0);

  uint64_t v4 = [v2 imageCellStyle];
  objc_msgSend(v4, "setImageSize:", 90.0, 90.0);

  uint64_t v5 = [v2 videoCellStyle];
  objc_msgSend(v5, "setImageSize:", 150.0, 84.0);

  double v6 = [v2 productCellStyle];
  objc_msgSend(v6, "setImageSize:", 100.0, 100.0);

  objc_msgSend(v2, "setDetailInsets:", 15.0, 100.0, 20.0, 100.0);
  int v7 = [v2 headerStyle];
  objc_msgSend(v7, "setInsets:", 15.0, 100.0, 0.0, 100.0);

  objc_msgSend(v2, "setDefaultCellSectionInsets:", 15.0, 107.0, 0.0, 107.0);
  objc_msgSend(v2, "setImageCellSectionInsets:", 15.0, 100.0, 0.0, 100.0);
  objc_msgSend(v2, "setVideoCellSectionInsets:", 15.0, 107.0, 0.0, 107.0);
  objc_msgSend(v2, "setProductCellSectionInsets:", 15.0, 107.0, 0.0, 107.0);
  [v2 setDefaultSpacing:7.0];
  [v2 setImageSpacing:7.0];
  [v2 setVideoSpacing:7.0];
  [v2 setProductSpacing:7.0];
  return v2;
}

+ (id)wideStackGridStyle
{
  uint64_t v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  uint64_t v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 114.0, 170.0);
  [(VideosExtrasGridCellStyle *)v4 setTitleFirstBaselineHeight:20.0];
  uint64_t v5 = *MEMORY[0x1E4FB28D8];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextStyle:*MEMORY[0x1E4FB28D8]];
  double v6 = [a1 _fontAttributesForTextStyle:v5];
  [(VideosExtrasGridCellStyle *)v4 setTitleDefaultFontAttributes:v6];
  int v7 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextColor:v7];

  [(VideosExtrasGridCellStyle *)v4 setTextFirstBaselineToBottom:27.0];
  [(VideosExtrasGridCellStyle *)v4 setTextLastBaselineToBottom:10.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleDefaultFontAttributes:v6];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleFirstBaselineHeight:18.0];
  uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextColor:v8];

  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextStyle:v5];
  [(VideosExtrasGridCellStyle *)v4 setDefaultTextAlignment:1];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultCellStyle:v4];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductCellStyle:v4];
  uint64_t v9 = (void *)[(VideosExtrasGridCellStyle *)v4 copy];
  objc_msgSend(v9, "setImageSize:", 170.0, 170.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setImageCellStyle:v9];
  uint64_t v10 = (void *)[(VideosExtrasGridCellStyle *)v4 copy];
  objc_msgSend(v10, "setImageSize:", 252.0, 126.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoCellStyle:v10];
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", 0.0, 20.0, 0.0, 20.0);
  uint64_t v11 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  [(VideosExtrasGridSectionHeaderStyle *)v11 setTextStyle:*MEMORY[0x1E4FB2950]];
  [(VideosExtrasGridSectionHeaderStyle *)v11 setDefaultFontAttributes:v6];
  long long v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [(VideosExtrasGridSectionHeaderStyle *)v11 setTextColor:v12];

  UIEdgeInsetsMakeWithEdges();
  -[VideosExtrasGridSectionHeaderStyle setInsets:](v11, "setInsets:");
  [(VideosExtrasGridSectionHeaderStyle *)v11 setTextBaselineDescender:15.0];
  [(VideosExtrasGridSectionHeaderStyle *)v11 setTextBaselineHeight:25.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setSectionHeaderStyle:v11];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultSpacing:40.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductSpacing:40.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageSpacing:50.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoSpacing:50.0];
  double v13 = *MEMORY[0x1E4FB2848];
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", *MEMORY[0x1E4FB2848], v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", v13, v14, v15, v16);
  [(VideosExtrasGridViewControllerStyle *)v3 setCellLineSpacing:0.0];
  double v17 = [MEMORY[0x1E4FB1618] clearColor];
  [(VideosExtrasGridViewControllerStyle *)v3 setBackgroundColor:v17];

  [(VideosExtrasGridViewControllerStyle *)v3 setShowsScrollFade:0];
  [(VideosExtrasGridViewControllerStyle *)v3 setAdjustsContentInsetByBottomNavBar:0];

  return v3;
}

+ (id)smallStackGridStyle
{
  uint64_t v3 = objc_alloc_init(VideosExtrasGridViewControllerStyle);
  uint64_t v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:", 80.0, 120.0);
  [(VideosExtrasGridCellStyle *)v4 setTitleFirstBaselineHeight:20.0];
  uint64_t v5 = *MEMORY[0x1E4FB28E0];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextStyle:*MEMORY[0x1E4FB28E0]];
  double v6 = [a1 _fontAttributesForTextStyle:v5];
  [(VideosExtrasGridCellStyle *)v4 setTitleDefaultFontAttributes:v6];
  int v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [(VideosExtrasGridCellStyle *)v4 setTitleTextColor:v7];

  [(VideosExtrasGridCellStyle *)v4 setTextFirstBaselineToBottom:30.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleDefaultFontAttributes:v6];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleFirstBaselineHeight:18.0];
  uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.4 alpha:1.0];
  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextColor:v8];

  [(VideosExtrasGridCellStyle *)v4 setSubtitleTextStyle:*MEMORY[0x1E4FB28D8]];
  [(VideosExtrasGridCellStyle *)v4 setDefaultTextAlignment:1];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultCellStyle:v4];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductCellStyle:v4];
  uint64_t v9 = (void *)[(VideosExtrasGridCellStyle *)v4 copy];
  objc_msgSend(v9, "setImageSize:", 120.0, 120.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setImageCellStyle:v9];
  uint64_t v10 = (void *)[(VideosExtrasGridCellStyle *)v4 copy];
  objc_msgSend(v10, "setImageSize:", 125.0, 70.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoCellStyle:v10];
  uint64_t v11 = objc_alloc_init(VideosExtrasGridSectionHeaderStyle);
  [(VideosExtrasGridSectionHeaderStyle *)v11 setTextStyle:*MEMORY[0x1E4FB2950]];
  [(VideosExtrasGridSectionHeaderStyle *)v11 setDefaultFontAttributes:v6];
  long long v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [(VideosExtrasGridSectionHeaderStyle *)v11 setTextColor:v12];

  -[VideosExtrasGridSectionHeaderStyle setInsets:](v11, "setInsets:", 20.0, 15.0, 5.0, 15.0);
  [(VideosExtrasGridViewControllerStyle *)v3 setSectionHeaderStyle:v11];
  [(VideosExtrasGridViewControllerStyle *)v3 setDefaultSpacing:25.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setImageSpacing:25.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setVideoSpacing:20.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setProductSpacing:25.0];
  [(VideosExtrasGridViewControllerStyle *)v3 setCellLineSpacing:0.0];
  double v13 = *MEMORY[0x1E4FB2848];
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  -[VideosExtrasGridViewControllerStyle setDefaultCellSectionInsets:](v3, "setDefaultCellSectionInsets:", *MEMORY[0x1E4FB2848], v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setImageCellSectionInsets:](v3, "setImageCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setVideoCellSectionInsets:](v3, "setVideoCellSectionInsets:", v13, v14, v15, v16);
  -[VideosExtrasGridViewControllerStyle setProductCellSectionInsets:](v3, "setProductCellSectionInsets:", v13, v14, v15, v16);
  double v17 = [MEMORY[0x1E4FB1618] clearColor];
  [(VideosExtrasGridViewControllerStyle *)v3 setBackgroundColor:v17];

  [(VideosExtrasGridViewControllerStyle *)v3 setShowsScrollFade:0];
  [(VideosExtrasGridViewControllerStyle *)v3 setAdjustsContentInsetByBottomNavBar:0];
  -[VideosExtrasGridViewControllerStyle setCollectionViewInsets:](v3, "setCollectionViewInsets:", 0.0, 15.0, 0.0, 15.0);

  return v3;
}

+ (id)mediumStackGridStyle
{
  double v2 = [a1 smallStackGridStyle];
  [v2 setDefaultSpacing:25.0];
  [v2 setImageSpacing:30.0];
  [v2 setVideoSpacing:30.0];
  [v2 setProductSpacing:25.0];
  return v2;
}

+ (id)largeStackGridStyle
{
  double v2 = [a1 mediumStackGridStyle];
  uint64_t v3 = [v2 videoCellStyle];
  objc_msgSend(v3, "setImageSize:", 150.0, 85.0);

  [v2 setImageSpacing:25.0];
  [v2 setVideoSpacing:25.0];
  return v2;
}

+ (id)extraLargeStackGridStyle
{
  double v2 = [a1 largeStackGridStyle];
  uint64_t v3 = [v2 defaultCellStyle];
  objc_msgSend(v3, "setImageSize:", 160.0, 160.0);

  uint64_t v4 = [v2 imageCellStyle];
  objc_msgSend(v4, "setImageSize:", 160.0, 160.0);

  uint64_t v5 = [v2 videoCellStyle];
  objc_msgSend(v5, "setImageSize:", 160.0, 90.0);

  double v6 = [v2 productCellStyle];
  objc_msgSend(v6, "setImageSize:", 106.0, 160.0);

  [v2 setDefaultSpacing:50.0];
  [v2 setImageSpacing:50.0];
  [v2 setVideoSpacing:50.0];
  [v2 setProductSpacing:30.0];
  return v2;
}

- (VideosExtrasGridViewControllerStyle)smallStyle
{
  return self->_smallStyle;
}

- (void)setSmallStyle:(id)a3
{
}

- (VideosExtrasGridViewControllerStyle)mediumStyle
{
  return self->_mediumStyle;
}

- (void)setMediumStyle:(id)a3
{
}

- (VideosExtrasGridViewControllerStyle)largeStyle
{
  return self->_largeStyle;
}

- (void)setLargeStyle:(id)a3
{
}

- (VideosExtrasGridViewControllerStyle)extraLargeStyle
{
  return self->_extraLargeStyle;
}

- (void)setExtraLargeStyle:(id)a3
{
}

- (VideosExtrasGridViewControllerStyle)wideStyle
{
  return self->_wideStyle;
}

- (void)setWideStyle:(id)a3
{
}

- (BOOL)isShelfStyle
{
  return self->_shelfStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wideStyle, 0);
  objc_storeStrong((id *)&self->_extraLargeStyle, 0);
  objc_storeStrong((id *)&self->_largeStyle, 0);
  objc_storeStrong((id *)&self->_mediumStyle, 0);
  objc_storeStrong((id *)&self->_smallStyle, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_headerViewConstraints, 0);
  objc_storeStrong((id *)&self->_titleRuleConstraints, 0);
  objc_storeStrong((id *)&self->_titleRule, 0);
}

@end