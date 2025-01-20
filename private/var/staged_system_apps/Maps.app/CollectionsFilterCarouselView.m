@interface CollectionsFilterCarouselView
+ (double)defaultHeightForDisplayStyle:(int64_t)a3 inContext:(int64_t)a4;
- (AllCollectinsFilterRoutingDelegate)allCollectionsRoutingDelegate;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CollectionsFilterCarouselView)initWithFrame:(CGRect)a3;
- (CollectionsFilterFetcher)logicController;
- (CollectionsFilterRoutingDelegate)routingDelegate;
- (CollectionsFilterSizeProvider)sizeController;
- (GuidesHomeFilterRoutingDelegate)guidesHomeRoutingDelegate;
- (NSArray)allCollectionsResultFilter;
- (NSArray)guidesHomeResultFilter;
- (NSArray)resultFilters;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)flowLayout;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)titleForFilterAtIndexPath:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCarouselFilterView;
- (void)configureFiltersCarouselMetadata:(int64_t)a3;
- (void)configureWithContext:(int64_t)a3 routingDelegate:(id)a4 guidesHomeFilters:(id)a5 selectedFilterIndex:(id)a6;
- (void)configureWithContext:(int64_t)a3 withRoutingDelegate:(id)a4 withAllCollectionsResultFilters:(id)a5 withSelectedFilterIndex:(id)a6;
- (void)configureWithContext:(int64_t)a3 withRoutingDelegate:(id)a4 withPublishersResultFilters:(id)a5 withSelectedFilterIndex:(id)a6;
- (void)displayFilters;
- (void)scrollToSelectedFilter;
- (void)setAllCollectionsResultFilter:(id)a3;
- (void)setAllCollectionsRoutingDelegate:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setGuidesHomeResultFilter:(id)a3;
- (void)setGuidesHomeRoutingDelegate:(id)a3;
- (void)setLogicController:(id)a3;
- (void)setResultFilters:(id)a3;
- (void)setRoutingDelegate:(id)a3;
- (void)setSizeController:(id)a3;
- (void)setUpCarouselDependenciesUsingSelectedFilterIndexPath:(id)a3;
- (void)setupSubviews;
@end

@implementation CollectionsFilterCarouselView

- (CollectionsFilterCarouselView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CollectionsFilterCarouselView;
  v3 = -[CollectionsFilterCarouselView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(CollectionsFilterCarouselView *)v3 setAccessibilityIdentifier:v5];

    [(CollectionsFilterCarouselView *)v3 setupSubviews];
    [(CollectionsFilterCarouselView *)v3 configureCarouselFilterView];
  }
  return v3;
}

- (void)configureWithContext:(int64_t)a3 withRoutingDelegate:(id)a4 withAllCollectionsResultFilters:(id)a5 withSelectedFilterIndex:(id)a6
{
  self->_context = a3;
  id v10 = a6;
  id v9 = a5;
  [(CollectionsFilterCarouselView *)self setAllCollectionsRoutingDelegate:a4];
  [(CollectionsFilterCarouselView *)self setAllCollectionsResultFilter:v9];

  [(CollectionsFilterCarouselView *)self configureFiltersCarouselMetadata:self->_context];
  [(CollectionsFilterCarouselView *)self setUpCarouselDependenciesUsingSelectedFilterIndexPath:v10];
}

- (void)configureWithContext:(int64_t)a3 withRoutingDelegate:(id)a4 withPublishersResultFilters:(id)a5 withSelectedFilterIndex:(id)a6
{
  self->_context = a3;
  id v10 = a6;
  id v9 = a5;
  [(CollectionsFilterCarouselView *)self setRoutingDelegate:a4];
  [(CollectionsFilterCarouselView *)self setResultFilters:v9];

  [(CollectionsFilterCarouselView *)self configureFiltersCarouselMetadata:self->_context];
  [(CollectionsFilterCarouselView *)self setUpCarouselDependenciesUsingSelectedFilterIndexPath:v10];
}

- (void)configureWithContext:(int64_t)a3 routingDelegate:(id)a4 guidesHomeFilters:(id)a5 selectedFilterIndex:(id)a6
{
  id v10 = (NSArray *)a5;
  self->_context = a3;
  id v12 = a6;
  objc_storeWeak((id *)&self->_guidesHomeRoutingDelegate, a4);
  guidesHomeResultFilter = self->_guidesHomeResultFilter;
  self->_guidesHomeResultFilter = v10;

  [(CollectionsFilterCarouselView *)self configureFiltersCarouselMetadata:self->_context];
  [(CollectionsFilterCarouselView *)self setUpCarouselDependenciesUsingSelectedFilterIndexPath:v12];
}

- (void)displayFilters
{
  v3 = [(CollectionsFilterCarouselView *)self logicController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1004D0C5C;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [v3 getFilters:v4];
}

+ (double)defaultHeightForDisplayStyle:(int64_t)a3 inContext:(int64_t)a4
{
  v4 = [[CollectionsFilterSizeController alloc] initWithCollectionsFilterDisplayStyle:a3 inContext:a4];
  [(CollectionsFilterSizeController *)v4 defaultHeight];
  double v6 = v5;

  return v6;
}

- (void)scrollToSelectedFilter
{
  id v2 = [(CollectionsFilterCarouselView *)self logicController];
  [v2 scrollToSelectedFilter];
}

- (void)setupSubviews
{
  id v3 = objc_alloc_init((Class)UICollectionViewFlowLayout);
  [(CollectionsFilterCarouselView *)self setFlowLayout:v3];

  id v4 = objc_alloc((Class)UICollectionView);
  double v5 = [(CollectionsFilterCarouselView *)self flowLayout];
  id v6 = [v4 initWithFrame:v5 collectionViewLayout:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(CollectionsFilterCarouselView *)self setCollectionView:v6];

  objc_super v7 = [(CollectionsFilterCarouselView *)self collectionView];
  [v7 setAccessibilityIdentifier:@"CollectionsFilterCarouselCollectionView"];

  v8 = [(CollectionsFilterCarouselView *)self collectionView];
  [v8 setShowsVerticalScrollIndicator:0];

  id v9 = [(CollectionsFilterCarouselView *)self collectionView];
  [v9 setShowsHorizontalScrollIndicator:0];

  id v10 = [(CollectionsFilterCarouselView *)self collectionView];
  [v10 setAllowsSelection:1];

  id v11 = [(CollectionsFilterCarouselView *)self collectionView];
  [v11 setAllowsMultipleSelection:0];
}

- (void)setUpCarouselDependenciesUsingSelectedFilterIndexPath:(id)a3
{
  id v13 = a3;
  int64_t context = self->_context;
  if (context == 2)
  {
    id v9 = [CollectionsFilterLogicController alloc];
    id v6 = [(CollectionsFilterCarouselView *)self collectionView];
    objc_super v7 = [(CollectionsFilterCarouselView *)self guidesHomeResultFilter];
    v8 = [(CollectionsFilterLogicController *)v9 initWithCollectionView:v6 withGuidesHomeResultFilters:v7 withSelectedFilterIndexPath:v13];
  }
  else if (context == 1)
  {
    id v10 = [CollectionsFilterLogicController alloc];
    id v6 = [(CollectionsFilterCarouselView *)self collectionView];
    objc_super v7 = [(CollectionsFilterCarouselView *)self allCollectionsResultFilter];
    v8 = [(CollectionsFilterLogicController *)v10 initWithCollectionView:v6 withAllCollectionsResultFilters:v7 withSelectedFilterIndexPath:v13];
  }
  else
  {
    if (context) {
      goto LABEL_8;
    }
    double v5 = [CollectionsFilterLogicController alloc];
    id v6 = [(CollectionsFilterCarouselView *)self collectionView];
    objc_super v7 = [(CollectionsFilterCarouselView *)self resultFilters];
    v8 = [(CollectionsFilterLogicController *)v5 initWithCollectionView:v6 withResultFilters:v7 withSelectedFilterIndexPath:v13];
  }
  id v11 = v8;
  [(CollectionsFilterCarouselView *)self setLogicController:v8];

  id v12 = [[CollectionsFilterSizeController alloc] initWithCollectionsFilterDisplayStyle:0 inContext:context];
  [(CollectionsFilterCarouselView *)self setSizeController:v12];

LABEL_8:
}

- (void)configureFiltersCarouselMetadata:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
  {
    id v4 = [(CollectionsFilterCarouselView *)self flowLayout];
    [v4 setScrollDirection:1];
  }
}

- (void)configureCarouselFilterView
{
  uint64_t v3 = [(CollectionsFilterCarouselView *)self collectionView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(CollectionsFilterCarouselView *)self collectionView];
  [v4 setDelegate:self];

  double v5 = [(CollectionsFilterCarouselView *)self collectionView];
  id v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];

  objc_super v7 = [(CollectionsFilterCarouselView *)self collectionView];
  [(CollectionsFilterCarouselView *)self addSubview:v7];

  v24 = [(CollectionsFilterCarouselView *)self collectionView];
  v23 = [v24 leadingAnchor];
  v22 = [(CollectionsFilterCarouselView *)self leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v25[0] = v21;
  v20 = [(CollectionsFilterCarouselView *)self collectionView];
  v19 = [v20 trailingAnchor];
  v18 = [(CollectionsFilterCarouselView *)self trailingAnchor];
  v8 = [v19 constraintEqualToAnchor:v18];
  v25[1] = v8;
  id v9 = [(CollectionsFilterCarouselView *)self collectionView];
  id v10 = [v9 topAnchor];
  id v11 = [(CollectionsFilterCarouselView *)self topAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];
  v25[2] = v12;
  id v13 = [(CollectionsFilterCarouselView *)self collectionView];
  v14 = [v13 bottomAnchor];
  v15 = [(CollectionsFilterCarouselView *)self bottomAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v25[3] = v16;
  v17 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v17];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v20 = a4;
  double v5 = [(CollectionsFilterCarouselView *)self logicController];
  id v6 = [v5 selectedFilterIndexPath];

  objc_super v7 = v20;
  int64_t context = self->_context;
  if (v6 == v20)
  {
    if (context != 2) {
      goto LABEL_18;
    }
    id v10 = [(CollectionsFilterCarouselView *)self guidesHomeRoutingDelegate];
    [v10 didRouteToConceptFilter:0 atIndexPath:0];
  }
  else if (context == 1)
  {
    v14 = [(CollectionsFilterCarouselView *)self logicController];
    id v10 = [v14 routeToSelectedAllCollectionsFilterAtIndexPath:v20];

    v15 = [v10 allCollectionsAddressFilter];

    if (v15)
    {
      id v12 = [(CollectionsFilterCarouselView *)self allCollectionsRoutingDelegate];
      uint64_t v13 = [v10 allCollectionsAddressFilter];
      goto LABEL_10;
    }
    v19 = [v10 allCollectionsKeywordFilter];

    if (v19)
    {
      id v12 = [(CollectionsFilterCarouselView *)self allCollectionsRoutingDelegate];
      uint64_t v18 = [v10 allCollectionsKeywordFilter];
      goto LABEL_15;
    }
  }
  else
  {
    if (context) {
      goto LABEL_18;
    }
    id v9 = [(CollectionsFilterCarouselView *)self logicController];
    id v10 = [v9 routeToSelectedFilterAtIndexPath:v20];

    id v11 = [v10 addressFilter];

    if (v11)
    {
      id v12 = [(CollectionsFilterCarouselView *)self routingDelegate];
      uint64_t v13 = [v10 addressFilter];
LABEL_10:
      v16 = (void *)v13;
      [v12 didRouteToAddressFilter:v13 atIndexPath:v20];
LABEL_16:

      goto LABEL_17;
    }
    v17 = [v10 keywordFilter];

    if (v17)
    {
      id v12 = [(CollectionsFilterCarouselView *)self routingDelegate];
      uint64_t v18 = [v10 keywordFilter];
LABEL_15:
      v16 = (void *)v18;
      [v12 didRouteToKeywordFilter:v18 atIndexPath:v20];
      goto LABEL_16;
    }
  }
LABEL_17:

  objc_super v7 = v20;
LABEL_18:
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  objc_super v7 = [(CollectionsFilterCarouselView *)self sizeController];
  v8 = [(CollectionsFilterCarouselView *)self logicController];
  id v9 = [v8 filterAtIndexPath:v6];

  [v7 sizeForFilter:v9];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v6 = [(CollectionsFilterCarouselView *)self sizeController];
  [v6 insetForFilterAtIndex:a5];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  char IsEnabled_Maps269 = MapsFeature_IsEnabled_Maps269();
  double v8 = [(CollectionsFilterCarouselView *)self sizeController];
  double v9 = v8;
  if (IsEnabled_Maps269) {
    [v8 minimumInterItemSpacingForSectionAtIndex:a5];
  }
  else {
    [v8 minimumLineSpacingForSectionAtIndex:a5];
  }
  double v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v6 = [(CollectionsFilterCarouselView *)self sizeController];
  [v6 minimumInterItemSpacingForSectionAtIndex:a5];
  double v8 = v7;

  return v8;
}

- (id)titleForFilterAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(CollectionsFilterCarouselView *)self logicController];
  id v6 = [v5 filterAtIndexPath:v4];

  double v7 = [v6 filterTitle];

  return v7;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (CollectionsFilterSizeProvider)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
}

- (CollectionsFilterFetcher)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
}

- (CollectionsFilterRoutingDelegate)routingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingDelegate);

  return (CollectionsFilterRoutingDelegate *)WeakRetained;
}

- (void)setRoutingDelegate:(id)a3
{
}

- (NSArray)resultFilters
{
  return self->_resultFilters;
}

- (void)setResultFilters:(id)a3
{
}

- (AllCollectinsFilterRoutingDelegate)allCollectionsRoutingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allCollectionsRoutingDelegate);

  return (AllCollectinsFilterRoutingDelegate *)WeakRetained;
}

- (void)setAllCollectionsRoutingDelegate:(id)a3
{
}

- (NSArray)allCollectionsResultFilter
{
  return self->_allCollectionsResultFilter;
}

- (void)setAllCollectionsResultFilter:(id)a3
{
}

- (GuidesHomeFilterRoutingDelegate)guidesHomeRoutingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guidesHomeRoutingDelegate);

  return (GuidesHomeFilterRoutingDelegate *)WeakRetained;
}

- (void)setGuidesHomeRoutingDelegate:(id)a3
{
}

- (NSArray)guidesHomeResultFilter
{
  return self->_guidesHomeResultFilter;
}

- (void)setGuidesHomeResultFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidesHomeResultFilter, 0);
  objc_destroyWeak((id *)&self->_guidesHomeRoutingDelegate);
  objc_storeStrong((id *)&self->_allCollectionsResultFilter, 0);
  objc_destroyWeak((id *)&self->_allCollectionsRoutingDelegate);
  objc_storeStrong((id *)&self->_resultFilters, 0);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_logicController, 0);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);

  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end