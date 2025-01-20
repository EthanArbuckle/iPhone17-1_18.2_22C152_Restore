@interface CollectionsFilterLogicController
- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withAllCollectionsResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5;
- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withGuidesHomeResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5;
- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5;
- (NSArray)allCollectionsResultFilters;
- (NSArray)filters;
- (NSArray)guidesHomeFilters;
- (NSArray)publisherResultFilters;
- (NSDiffableDataSourceSnapshot)snapshot;
- (NSIndexPath)selectedIndexPath;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)dataSource;
- (UITraitEnvironment)traitEnvironment;
- (id)buildAllCollectionsFiltersWithSelectedIndexPath:(id)a3;
- (id)buildGuidesHomeViewFiltersWithSelectedIndexPath:(id)a3;
- (id)buildPublishersFiltersWithSelectedIndexPath:(id)a3;
- (id)filterAtIndexPath:(id)a3;
- (id)filterViewModels;
- (id)initForAllCollectionsViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4;
- (id)initForGuidesHomeViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4 traitEnvironment:(id)a5;
- (id)initForPublisherViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4;
- (id)routeToSelectedAllCollectionsFilterAtIndexPath:(id)a3;
- (id)routeToSelectedFilterAtIndexPath:(id)a3;
- (id)routeToSelectedGuidesHomeFilterAtIndexPath:(id)a3;
- (int64_t)numberOfFilters;
- (int64_t)numberOfSections;
- (void)displayFilters;
- (void)getFilters:(id)a3;
- (void)prepareSnapshot;
- (void)scrollToSelectedFilter;
- (void)setAllCollectionsResultFilters:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFilters:(id)a3;
- (void)setGuidesHomeFilters:(id)a3;
- (void)setPublisherResultFilters:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setTraitEnvironment:(id)a3;
@end

@implementation CollectionsFilterLogicController

- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CollectionsFilterLogicController;
  v11 = [(CollectionsFilterLogicController *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_collectionView, v8);
    objc_storeStrong((id *)&v12->_publisherResultFilters, a4);
    if (v10)
    {
      uint64_t v13 = [(CollectionsFilterLogicController *)v12 buildPublishersFiltersWithSelectedIndexPath:v10];
      filters = v12->_filters;
      v12->_filters = (NSArray *)v13;
    }
    else
    {
      filters = +[NSIndexPath indexPathForRow:0 inSection:0];
      uint64_t v15 = [(CollectionsFilterLogicController *)v12 buildPublishersFiltersWithSelectedIndexPath:filters];
      v16 = v12->_filters;
      v12->_filters = (NSArray *)v15;
    }
    uint64_t v17 = objc_opt_class();
    v18 = +[CollectionsFilterCell reuseIdentifier];
    [v8 registerClass:v17 forCellWithReuseIdentifier:v18];
  }
  return v12;
}

- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withAllCollectionsResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CollectionsFilterLogicController;
  v11 = [(CollectionsFilterLogicController *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_collectionView, v8);
    objc_storeStrong((id *)&v12->_allCollectionsResultFilters, a4);
    if (v10)
    {
      uint64_t v13 = [(CollectionsFilterLogicController *)v12 buildAllCollectionsFiltersWithSelectedIndexPath:v10];
      filters = v12->_filters;
      v12->_filters = (NSArray *)v13;
    }
    else
    {
      filters = +[NSIndexPath indexPathForRow:0 inSection:0];
      uint64_t v15 = [(CollectionsFilterLogicController *)v12 buildAllCollectionsFiltersWithSelectedIndexPath:filters];
      v16 = v12->_filters;
      v12->_filters = (NSArray *)v15;
    }
    uint64_t v17 = objc_opt_class();
    v18 = +[CollectionsFilterCell reuseIdentifier];
    [v8 registerClass:v17 forCellWithReuseIdentifier:v18];
  }
  return v12;
}

- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withGuidesHomeResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CollectionsFilterLogicController;
  v11 = [(CollectionsFilterLogicController *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_collectionView, v8);
    objc_storeStrong((id *)&v12->_guidesHomeFilters, a4);
    uint64_t v13 = [(CollectionsFilterLogicController *)v12 buildGuidesHomeViewFiltersWithSelectedIndexPath:v10];
    filters = v12->_filters;
    v12->_filters = (NSArray *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = +[CollectionsFilterCell reuseIdentifier];
    [v8 registerClass:v15 forCellWithReuseIdentifier:v16];
  }
  return v12;
}

- (id)initForAllCollectionsViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CollectionsFilterLogicController;
  id v9 = [(CollectionsFilterLogicController *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_allCollectionsResultFilters, a3);
    if (v8)
    {
      uint64_t v11 = [(CollectionsFilterLogicController *)v10 buildAllCollectionsFiltersWithSelectedIndexPath:v8];
      filters = v10->_filters;
      v10->_filters = (NSArray *)v11;
    }
    else
    {
      filters = +[NSIndexPath indexPathForRow:0 inSection:0];
      uint64_t v13 = [(CollectionsFilterLogicController *)v10 buildAllCollectionsFiltersWithSelectedIndexPath:filters];
      v14 = v10->_filters;
      v10->_filters = (NSArray *)v13;
    }
  }

  return v10;
}

- (id)initForPublisherViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CollectionsFilterLogicController;
  id v9 = [(CollectionsFilterLogicController *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publisherResultFilters, a3);
    if (v8)
    {
      uint64_t v11 = [(CollectionsFilterLogicController *)v10 buildPublishersFiltersWithSelectedIndexPath:v8];
      filters = v10->_filters;
      v10->_filters = (NSArray *)v11;
    }
    else
    {
      filters = +[NSIndexPath indexPathForRow:0 inSection:0];
      uint64_t v13 = [(CollectionsFilterLogicController *)v10 buildPublishersFiltersWithSelectedIndexPath:filters];
      v14 = v10->_filters;
      v10->_filters = (NSArray *)v13;
    }
  }

  return v10;
}

- (id)initForGuidesHomeViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4 traitEnvironment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CollectionsFilterLogicController;
  v12 = [(CollectionsFilterLogicController *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_guidesHomeFilters, a3);
    objc_storeStrong((id *)&v13->_traitEnvironment, a5);
    uint64_t v14 = [(CollectionsFilterLogicController *)v13 buildGuidesHomeViewFiltersWithSelectedIndexPath:v10];
    filters = v13->_filters;
    v13->_filters = (NSArray *)v14;
  }
  return v13;
}

- (void)scrollToSelectedFilter
{
  v3 = [(CollectionsFilterLogicController *)self collectionView];
  v4 = [(CollectionsFilterLogicController *)self selectedIndexPath];
  id v9 = [v3 layoutAttributesForItemAtIndexPath:v4];

  v5 = v9;
  if (v9)
  {
    [v9 frame];
    v12.origin.x = CGRectZero.origin.x;
    v12.origin.y = CGRectZero.origin.y;
    v12.size.width = CGRectZero.size.width;
    v12.size.height = CGRectZero.size.height;
    if (CGRectEqualToRect(v11, v12))
    {
      v6 = [(CollectionsFilterLogicController *)self collectionView];
      [v6 layoutIfNeeded];
    }
    id v7 = [(CollectionsFilterLogicController *)self collectionView];
    id v8 = [(CollectionsFilterLogicController *)self selectedFilterIndexPath];
    [v7 scrollToItemAtIndexPath:v8 atScrollPosition:16 animated:0];

    v5 = v9;
  }
}

- (void)getFilters:(id)a3
{
  v4 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v6 = [(CollectionsFilterLogicController *)self collectionView];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10046FA54;
  CGRect v11 = &unk_1012EB4A8;
  objc_copyWeak(&v12, &location);
  id v7 = [v5 initWithCollectionView:v6 cellProvider:&v8];
  -[CollectionsFilterLogicController setDataSource:](self, "setDataSource:", v7, v8, v9, v10, v11);

  [(CollectionsFilterLogicController *)self prepareSnapshot];
  if (v4) {
    v4[2](v4);
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)displayFilters
{
  id v4 = [(CollectionsFilterLogicController *)self dataSource];
  v3 = [(CollectionsFilterLogicController *)self snapshot];
  [v4 applySnapshot:v3 animatingDifferences:0];
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfFilters
{
  v2 = [(CollectionsFilterLogicController *)self filters];
  id v3 = [v2 count];

  return (int64_t)v3;
}

- (id)filterAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CollectionsFilterLogicController *)self filters];
  id v6 = [v4 item];

  id v7 = [v5 objectAtIndex:v6];

  return v7;
}

- (id)filterViewModels
{
  v2 = [(CollectionsFilterLogicController *)self filters];
  id v3 = [v2 copy];

  return v3;
}

- (id)routeToSelectedFilterAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CollectionsFilterLogicController *)self buildPublishersFiltersWithSelectedIndexPath:v4];
  [(CollectionsFilterLogicController *)self setFilters:v5];

  id v6 = [(CollectionsFilterLogicController *)self collectionView];

  if (v6)
  {
    [(CollectionsFilterLogicController *)self prepareSnapshot];
    [(CollectionsFilterLogicController *)self displayFilters];
    id v7 = [(CollectionsFilterLogicController *)self collectionView];
    [v7 scrollToItemAtIndexPath:v4 atScrollPosition:16 animated:1];
  }
  id v8 = [(CollectionsFilterLogicController *)self filterAtIndexPath:v4];

  return v8;
}

- (id)routeToSelectedAllCollectionsFilterAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CollectionsFilterLogicController *)self buildAllCollectionsFiltersWithSelectedIndexPath:v4];
  [(CollectionsFilterLogicController *)self setFilters:v5];

  id v6 = [(CollectionsFilterLogicController *)self collectionView];

  if (v6)
  {
    [(CollectionsFilterLogicController *)self prepareSnapshot];
    [(CollectionsFilterLogicController *)self displayFilters];
    id v7 = [(CollectionsFilterLogicController *)self collectionView];
    [v7 scrollToItemAtIndexPath:v4 atScrollPosition:16 animated:1];
  }
  id v8 = [(CollectionsFilterLogicController *)self filterAtIndexPath:v4];

  return v8;
}

- (id)routeToSelectedGuidesHomeFilterAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CollectionsFilterLogicController *)self buildGuidesHomeViewFiltersWithSelectedIndexPath:v4];
  [(CollectionsFilterLogicController *)self setFilters:v5];

  id v6 = [(CollectionsFilterLogicController *)self collectionView];

  if (v6)
  {
    [(CollectionsFilterLogicController *)self prepareSnapshot];
    [(CollectionsFilterLogicController *)self displayFilters];
    id v7 = [(CollectionsFilterLogicController *)self collectionView];
    [v7 scrollToItemAtIndexPath:v4 atScrollPosition:16 animated:1];
  }
  if (v4)
  {
    id v8 = [(CollectionsFilterLogicController *)self filterAtIndexPath:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)prepareSnapshot
{
  id v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  [(CollectionsFilterLogicController *)self setSnapshot:v3];

  id v4 = [(CollectionsFilterLogicController *)self snapshot];
  CFStringRef v8 = @"FiltersSection";
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  [v4 appendSectionsWithIdentifiers:v5];

  id v6 = [(CollectionsFilterLogicController *)self snapshot];
  id v7 = [(CollectionsFilterLogicController *)self filters];
  [v6 appendItemsWithIdentifiers:v7];
}

- (id)buildAllCollectionsFiltersWithSelectedIndexPath:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  id v6 = [WeakRetained traitCollection];
  id v7 = [v6 userInterfaceStyle];

  id v8 = objc_alloc((Class)NSMutableArray);
  uint64_t v9 = [(CollectionsFilterLogicController *)self allCollectionsResultFilters];
  id v10 = [v8 initWithCapacity:[v9 count]];

  CGRect v11 = [(CollectionsFilterLogicController *)self allCollectionsResultFilters];
  v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_1004701BC;
  v22 = &unk_1012EB4D0;
  BOOL v24 = v7 == (id)2;
  id v12 = v10;
  id v23 = v12;
  [v11 enumerateObjectsUsingBlock:&v19];

  uint64_t v13 = [v12 objectAtIndex:[v4 item:v19, v20, v21, v22]];
  uint64_t v14 = v13;
  if (v13) {
    [v13 modelSelected:1 isDarkMode:v7 == (id)2];
  }
  [(CollectionsFilterLogicController *)self setSelectedIndexPath:v4];
  id v15 = [objc_alloc((Class)NSOrderedSet) initWithArray:v12];
  objc_super v16 = [v15 array];
  id v17 = [v16 copy];

  return v17;
}

- (id)buildPublishersFiltersWithSelectedIndexPath:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  id v6 = [WeakRetained traitCollection];
  id v7 = [v6 userInterfaceStyle];

  id v8 = objc_alloc((Class)NSMutableArray);
  uint64_t v9 = [(CollectionsFilterLogicController *)self publisherResultFilters];
  id v10 = [v8 initWithCapacity:[v9 count]];

  CGRect v11 = [(CollectionsFilterLogicController *)self publisherResultFilters];
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_1004704A8;
  id v23 = &unk_1012EB4F8;
  BOOL v25 = v7 == (id)2;
  id v12 = v10;
  id v24 = v12;
  [v11 enumerateObjectsUsingBlock:&v20];

  id v13 = [v4 item:v20, v21, v22, v23];
  if ((uint64_t)v13 <= (uint64_t)[v12 count])
  {
    uint64_t v14 = [v12 objectAtIndex:[v4 item]];
    id v15 = v14;
    if (v14) {
      [v14 modelSelected:1 isDarkMode:v7 == (id)2];
    }
  }
  [(CollectionsFilterLogicController *)self setSelectedIndexPath:v4];
  id v16 = [objc_alloc((Class)NSOrderedSet) initWithArray:v12];
  id v17 = [v16 array];
  id v18 = [v17 copy];

  return v18;
}

- (id)buildGuidesHomeViewFiltersWithSelectedIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CollectionsFilterLogicController *)self traitEnvironment];
  id v6 = [v5 traitCollection];
  id v7 = [v6 userInterfaceStyle];

  id v8 = objc_alloc((Class)NSMutableArray);
  uint64_t v9 = [(CollectionsFilterLogicController *)self allCollectionsResultFilters];
  id v10 = [v8 initWithCapacity:[v9 count]];

  CGRect v11 = [(CollectionsFilterLogicController *)self guidesHomeFilters];
  uint64_t v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_10047079C;
  id v23 = &unk_1012EB520;
  BOOL v25 = v7 == (id)2;
  id v12 = v10;
  id v24 = v12;
  [v11 enumerateObjectsUsingBlock:&v20];

  if (v4)
  {
    id v13 = [v4 item:v20, v21, v22, v23];
    if ((uint64_t)v13 <= (uint64_t)[v12 count])
    {
      uint64_t v14 = [v12 objectAtIndex:[v4 item]];
      id v15 = v14;
      if (v14) {
        [v14 modelSelected:1 isDarkMode:v7 == (id)2];
      }
    }
  }
  -[CollectionsFilterLogicController setSelectedIndexPath:](self, "setSelectedIndexPath:", v4, v20, v21, v22, v23);
  id v16 = [objc_alloc((Class)NSOrderedSet) initWithArray:v12];
  id v17 = [v16 array];
  id v18 = [v17 copy];

  return v18;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);

  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (UITraitEnvironment)traitEnvironment
{
  return self->_traitEnvironment;
}

- (void)setTraitEnvironment:(id)a3
{
}

- (NSArray)publisherResultFilters
{
  return self->_publisherResultFilters;
}

- (void)setPublisherResultFilters:(id)a3
{
}

- (NSArray)allCollectionsResultFilters
{
  return self->_allCollectionsResultFilters;
}

- (void)setAllCollectionsResultFilters:(id)a3
{
}

- (NSArray)guidesHomeFilters
{
  return self->_guidesHomeFilters;
}

- (void)setGuidesHomeFilters:(id)a3
{
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_guidesHomeFilters, 0);
  objc_storeStrong((id *)&self->_allCollectionsResultFilters, 0);
  objc_storeStrong((id *)&self->_publisherResultFilters, 0);
  objc_storeStrong((id *)&self->_traitEnvironment, 0);

  objc_destroyWeak((id *)&self->_collectionView);
}

@end