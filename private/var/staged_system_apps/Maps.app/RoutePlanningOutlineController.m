@interface RoutePlanningOutlineController
+ (UICollectionViewLayout)defaultCollectionViewLayout;
- (BOOL)_shouldUseBlurredBackground;
- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)hideContent;
- (RoutePlanningOutlineController)initWithCollectionView:(id)a3;
- (UICollectionView)collectionView;
- (UICollectionViewLayout)collectionViewLayout;
- (UIView)headerView;
- (id)_blurredBackgroundView;
- (id)_findVisualEffectView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)outlineSectionAtIndex:(int64_t)a3;
- (id)postReloadHandler;
- (int64_t)_localSectionForGlobalSectionIndex:(int64_t)a3 forSection:(id)a4;
- (int64_t)_positionOfSection:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)indexOfFirstPopulatedSection;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)sectionIndexForOutlineSection:(id)a3;
- (unint64_t)totalAvailableSections;
- (void)_recalculateSectionCounts;
- (void)_reloadHeaderLayoutItem;
- (void)_removeHeaderLayoutItem;
- (void)_resetElevationGraphs;
- (void)_updateVisibleOutlineSections;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)outlineSectionRequiresReload:(id)a3;
- (void)performBatchSectionUpdates:(id)a3;
- (void)prepareOutlineSections;
- (void)setCollectionView:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setHideContent:(BOOL)a3;
- (void)setPostReloadHandler:(id)a3;
@end

@implementation RoutePlanningOutlineController

- (RoutePlanningOutlineController)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RoutePlanningOutlineController;
  v5 = [(RoutePlanningOutlineController *)&v15 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sectionsByIdentifier = v5->_sectionsByIdentifier;
    v5->_sectionsByIdentifier = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sectionCountByIdentifier = v5->_sectionCountByIdentifier;
    v5->_sectionCountByIdentifier = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sectionStartIndexByIdentifier = v5->_sectionStartIndexByIdentifier;
    v5->_sectionStartIndexByIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sectionIdentifiersByStartIndex = v5->_sectionIdentifiersByStartIndex;
    v5->_sectionIdentifiersByStartIndex = v12;

    [(RoutePlanningOutlineController *)v5 setCollectionView:v4];
  }

  return v5;
}

- (void)dealloc
{
  [(UIView *)self->_headerView removeObserver:self forKeyPath:@"bounds" context:&off_101312B58];
  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningOutlineController;
  [(RoutePlanningOutlineController *)&v3 dealloc];
}

+ (UICollectionViewLayout)defaultCollectionViewLayout
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1001041C4;
  v11 = sub_100104960;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009A4AA0;
  v6[3] = &unk_101312B68;
  v6[4] = &v7;
  id v2 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:v6];
  objc_super v3 = (void *)v8[5];
  v8[5] = (uint64_t)v2;

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (UICollectionViewLayout *)v4;
}

- (UICollectionViewLayout)collectionViewLayout
{
  return [(UICollectionView *)self->_collectionView collectionViewLayout];
}

- (void)setCollectionView:(id)a3
{
  v5 = (UICollectionView *)a3;
  v6 = v5;
  p_collectionView = &self->_collectionView;
  if (self->_collectionView == v5)
  {
    if (!v5) {
      goto LABEL_7;
    }
    id v12 = [(UICollectionView *)v5 dataSource];
    if (v12 == self)
    {
      v13 = [(UICollectionView *)v6 delegate];

      if (v13 == self) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  objc_storeStrong((id *)&self->_collectionView, a3);
  if (*p_collectionView)
  {
    v8 = sub_1005775E4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Adopting collection view", v14, 2u);
    }

    [(UICollectionView *)*p_collectionView setDataSource:self];
    [(UICollectionView *)*p_collectionView setDelegate:self];
    [(UICollectionView *)*p_collectionView registerClass:objc_opt_class() forSupplementaryViewOfKind:@"RoutePlanningOutlineHeaderView" withReuseIdentifier:@"RoutePlanningOutlineHeaderView"];
    uint64_t v9 = *p_collectionView;
    uint64_t v10 = objc_opt_class();
    v11 = +[RoutingAdvisoryInfoFooterView reuseIdentifier];
    [(UICollectionView *)v9 registerClass:v10 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:v11];
  }
  [(RoutePlanningOutlineController *)self prepareOutlineSections];
  [(RoutePlanningOutlineController *)self _recalculateSectionCounts];
  [(UICollectionView *)*p_collectionView _maps_reloadDataWithoutFocus];
LABEL_7:
}

- (void)setHeaderView:(id)a3
{
  uint64_t v7 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView == v7)
  {
    [(RoutePlanningOutlineController *)self _reloadHeaderLayoutItem];
  }
  else
  {
    if (headerView) {
      [(UIView *)self->_headerView removeObserver:self forKeyPath:@"bounds" context:&off_101312B58];
    }
    objc_storeStrong((id *)&self->_headerView, a3);
    v6 = v7;
    if (v7)
    {
      [(RoutePlanningOutlineController *)self _reloadHeaderLayoutItem];
      [(UIView *)v7 addObserver:self forKeyPath:@"bounds" options:0 context:&off_101312B58];
    }
    else
    {
      if (!headerView) {
        goto LABEL_10;
      }
      [(RoutePlanningOutlineController *)self _removeHeaderLayoutItem];
    }
  }
  v6 = v7;
LABEL_10:
}

- (void)_reloadHeaderLayoutItem
{
  headerView = self->_headerView;
  if (headerView)
  {
    [(UIView *)headerView intrinsicContentSize];
    if (v4 == UIViewNoIntrinsicMetric)
    {
      v5 = self->_headerView;
      v6 = [(RoutePlanningOutlineController *)self collectionView];
      [v6 bounds];
      [(UIView *)v5 _maps_compressedSizeForWidth:0 withBlock:CGRectGetWidth(v23)];
      double v8 = v7;
    }
    else
    {
      double v8 = v4;
    }
    uint64_t v9 = [(RoutePlanningOutlineController *)self collectionViewLayout];
    uint64_t v10 = [v9 configuration];
    v11 = [v10 boundarySupplementaryItems];
    id v12 = [v11 firstObject];

    if (!v12) {
      goto LABEL_7;
    }
    v13 = [v12 layoutSize];
    v14 = [v13 heightDimension];
    [v14 dimension];
    double v16 = vabdd_f64(v15, v8);

    if (v16 > 2.22044605e-16)
    {
LABEL_7:
      v17 = +[NSCollectionLayoutDimension estimatedDimension:v8];
      v18 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
      v19 = +[NSCollectionLayoutSize sizeWithWidthDimension:v18 heightDimension:v17];

      v20 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v19, @"RoutePlanningOutlineHeaderView", 1, 0.0, -16.0 elementKind alignment absoluteOffset];
      v22 = v20;
      v21 = +[NSArray arrayWithObjects:&v22 count:1];
      [v10 setBoundarySupplementaryItems:v21];

      [v9 setConfiguration:v10];
    }
  }
}

- (void)_removeHeaderLayoutItem
{
  id v3 = [(RoutePlanningOutlineController *)self collectionViewLayout];
  id v2 = [v3 configuration];
  [v2 setBoundarySupplementaryItems:&__NSArray0__struct];
  [v3 setConfiguration:v2];
}

- (void)setHideContent:(BOOL)a3
{
  if (self->_hideContent != a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1009A54A8;
    v3[3] = &unk_1012E6300;
    BOOL v4 = a3;
    v3[4] = self;
    [(RoutePlanningOutlineController *)self performBatchSectionUpdates:v3];
  }
}

- (BOOL)_shouldUseBlurredBackground
{
  return sub_1000BBB44(self->_collectionView) != 5;
}

- (id)_blurredBackgroundView
{
  id v3 = [(UICollectionView *)self->_collectionView backgroundView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [(UICollectionView *)self->_collectionView backgroundView];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_findVisualEffectView
{
  if ([(RoutePlanningOutlineController *)self _shouldUseBlurredBackground])
  {
    id v3 = self->_collectionView;
    if (v3)
    {
      do
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v4 = [(UICollectionView *)v3 superview];

        id v3 = (UICollectionView *)v4;
      }
      while (v4);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &off_101312B88)
  {
    [(RoutePlanningOutlineController *)self _resetElevationGraphs];
  }
  else if (a6 == &off_101312B58)
  {
    [(RoutePlanningOutlineController *)self _reloadHeaderLayoutItem];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)RoutePlanningOutlineController;
    [(RoutePlanningOutlineController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_resetElevationGraphs
{
  if ([(UICollectionView *)self->_collectionView numberOfSections] >= 1)
  {
    uint64_t v3 = 0;
    do
    {
      if ([(UICollectionView *)self->_collectionView numberOfItemsInSection:v3] >= 1)
      {
        uint64_t v4 = 0;
        do
        {
          v5 = +[NSIndexPath indexPathForItem:v4 inSection:v3];
          v6 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v5];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v6 _reloadElevationChart];
          }

          ++v4;
        }
        while (v4 < [(UICollectionView *)self->_collectionView numberOfItemsInSection:v3]);
      }
      ++v3;
    }
    while (v3 < [(UICollectionView *)self->_collectionView numberOfSections]);
  }

  [(RoutePlanningOutlineController *)self performBatchSectionUpdates:&stru_101312B90];
}

- (void)prepareOutlineSections
{
  uint64_t v3 = sub_1005775E4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Will prepare outline sections...", buf, 2u);
  }

  [(NSMutableDictionary *)self->_sectionsByIdentifier removeAllObjects];
  outlineSections = self->_outlineSections;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1009A5990;
  v5[3] = &unk_101312BB8;
  v5[4] = self;
  [(NSArray *)outlineSections enumerateObjectsUsingBlock:v5];
  [(RoutePlanningOutlineController *)self _updateVisibleOutlineSections];
}

- (void)_updateVisibleOutlineSections
{
  if (!self->_batchUpdateCounter)
  {
    if ([(RoutePlanningOutlineController *)self hideContent])
    {
      visibleOutlineSections = self->_visibleOutlineSections;
      self->_visibleOutlineSections = (NSArray *)&__NSArray0__struct;
    }
    else
    {
      outlineSections = self->_outlineSections;
      visibleOutlineSections = +[NSPredicate predicateWithBlock:&stru_101312BF8];
      v5 = [(NSArray *)outlineSections filteredArrayUsingPredicate:visibleOutlineSections];
      v6 = self->_visibleOutlineSections;
      self->_visibleOutlineSections = v5;
    }
    double v7 = sub_1005775E4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSUInteger v8 = [(NSArray *)self->_visibleOutlineSections count];
      NSUInteger v9 = [(NSArray *)self->_outlineSections count];
      int v10 = 134218240;
      NSUInteger v11 = v8;
      __int16 v12 = 2048;
      NSUInteger v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found %lu/%lu sections should be visible", (uint8_t *)&v10, 0x16u);
    }

    [(RoutePlanningOutlineController *)self _recalculateSectionCounts];
    [(RoutePlanningOutlineController *)self didUpdateVisibleOutlineSections];
  }
}

- (void)_recalculateSectionCounts
{
  if (!self->_batchUpdateCounter)
  {
    [(NSMutableDictionary *)self->_sectionCountByIdentifier removeAllObjects];
    [(NSMutableDictionary *)self->_sectionStartIndexByIdentifier removeAllObjects];
    [(NSMutableDictionary *)self->_sectionIdentifiersByStartIndex removeAllObjects];
    uint64_t v9 = 0;
    int v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    visibleOutlineSections = self->_visibleOutlineSections;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1009A5D4C;
    v8[3] = &unk_1012F8598;
    v8[4] = self;
    v8[5] = &v9;
    [(NSArray *)visibleOutlineSections enumerateObjectsUsingBlock:v8];
    self->_int64_t numberOfSections = v10[3];
    uint64_t v4 = sub_1005775E4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int64_t numberOfSections = self->_numberOfSections;
      sectionCountByIdentifier = self->_sectionCountByIdentifier;
      sectionStartIndexByIdentifier = self->_sectionStartIndexByIdentifier;
      *(_DWORD *)buf = 134218498;
      int64_t v14 = numberOfSections;
      __int16 v15 = 2112;
      double v16 = sectionCountByIdentifier;
      __int16 v17 = 2112;
      v18 = sectionStartIndexByIdentifier;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Recalculated %lu section counts (\ncount: %@\nstartIndex: %@", buf, 0x20u);
    }

    _Block_object_dispose(&v9, 8);
  }
}

- (void)performBatchSectionUpdates:(id)a3
{
  ++self->_batchUpdateCounter;
  uint64_t v4 = (void (**)(void))a3;
  v5 = sub_1005775E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t batchUpdateCounter = self->_batchUpdateCounter;
    int v13 = 134217984;
    unint64_t v14 = batchUpdateCounter;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Incrementing batch update counter to %lu", (uint8_t *)&v13, 0xCu);
  }

  v4[2](v4);
  --self->_batchUpdateCounter;
  double v7 = sub_1005775E4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v8 = self->_batchUpdateCounter;
    int v13 = 134217984;
    unint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Decrementing batch update counter to %lu", (uint8_t *)&v13, 0xCu);
  }

  if (!self->_batchUpdateCounter)
  {
    uint64_t v9 = sub_1005775E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Reloading sections after batch updates", (uint8_t *)&v13, 2u);
    }

    [(RoutePlanningOutlineController *)self _updateVisibleOutlineSections];
    int v10 = [(RoutePlanningOutlineController *)self collectionView];
    [v10 _maps_reloadDataWithoutFocus];

    uint64_t v11 = [(RoutePlanningOutlineController *)self postReloadHandler];

    if (v11)
    {
      uint64_t v12 = [(RoutePlanningOutlineController *)self postReloadHandler];
      v12[2]();
    }
  }
}

- (id)outlineSectionAtIndex:(int64_t)a3
{
  v5 = [(NSMutableDictionary *)self->_sectionIdentifiersByStartIndex allKeys];
  v6 = [v5 sortedArrayUsingSelector:"compare:"];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v39 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    id obj = v7;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
      id v13 = [v12 integerValue];
      unint64_t v14 = [(NSMutableDictionary *)self->_sectionIdentifiersByStartIndex objectForKeyedSubscript:v12];
      __int16 v15 = [(NSMutableDictionary *)self->_sectionCountByIdentifier objectForKeyedSubscript:v14];
      id v16 = [v15 integerValue];

      if ((uint64_t)v13 <= a3 && (uint64_t)v13 + (uint64_t)v16 > a3) {
        break;
      }

      if (v9 == (id)++v11)
      {
        id v7 = obj;
        id v9 = [obj countByEnumeratingWithState:&v25 objects:v39 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    v22 = [(NSMutableDictionary *)self->_sectionsByIdentifier objectForKeyedSubscript:v14];

    id v7 = obj;
    if (!v22) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_13:

LABEL_14:
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = +[NSString stringWithFormat:@"Invalid index passed to outlineSectionAtIndex: %ld", a3];
      *(_DWORD *)buf = 136316162;
      v30 = "-[RoutePlanningOutlineController outlineSectionAtIndex:]";
      __int16 v31 = 2080;
      v32 = "RoutePlanningOutlineController.m";
      __int16 v33 = 1024;
      int v34 = 344;
      __int16 v35 = 2080;
      v36 = "section";
      __int16 v37 = 2112;
      v38 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);
    }
    if (sub_100BB36BC())
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v22 = 0;
  }

  return v22;
}

- (int64_t)indexOfFirstPopulatedSection
{
  if (self->_numberOfSections < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v3 = 0;
  while (1)
  {
    uint64_t v4 = [(RoutePlanningOutlineController *)self collectionView];
    uint64_t v5 = [(RoutePlanningOutlineController *)self collectionView:v4 numberOfItemsInSection:v3];

    if (v5 > 0) {
      break;
    }
    if (++v3 >= self->_numberOfSections) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v3;
}

- (unint64_t)totalAvailableSections
{
  return (unint64_t)[(NSMutableDictionary *)self->_sectionStartIndexByIdentifier count];
}

- (int64_t)_localSectionForGlobalSectionIndex:(int64_t)a3 forSection:(id)a4
{
  sectionStartIndexByIdentifier = self->_sectionStartIndexByIdentifier;
  v6 = [a4 sectionIdentifier];
  id v7 = [(NSMutableDictionary *)sectionStartIndexByIdentifier objectForKeyedSubscript:v6];
  id v8 = [v7 integerValue];

  return a3 - (void)v8;
}

- (int64_t)_positionOfSection:(id)a3
{
  return [(NSArray *)self->_visibleOutlineSections indexOfObject:a3];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v7 section]);
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1001041C4;
  v20 = sub_100104960;
  id v21 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009A6608;
  v12[3] = &unk_1012ECFC0;
  __int16 v15 = &v16;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  +[UIView performWithoutAnimation:v12];
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v10;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return self->_numberOfSections;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(RoutePlanningOutlineController *)self outlineSectionAtIndex:a4];
  id v7 = [v6 numberOfItemsInSection:[self _localSectionForGlobalSectionIndex:forSection:a4, v6]];

  return (int64_t)v7;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v5 section]);
  unsigned __int8 v7 = [v6 shouldHighlightItemAtIndexPath:v5];

  return v7;
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v5 section]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 didHighlightItemAtIndexPath:v5];
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v5 section]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 didUnhighlightItemAtIndexPath:v5];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v5 section]);
  unsigned __int8 v7 = [v6 shouldSelectItemAtIndexPath:v5];

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v5 section]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 didSelectItemAtIndexPath:v5];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v7 section]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 willDisplayCell:v8 forIndexPath:v7];
}

- (BOOL)collectionView:(id)a3 selectionFollowsFocusForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v5 section]);
  unsigned __int8 v7 = [v6 selectionFollowsFocusForItemAtIndexPath:v5];

  return v7;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  if ([v10 isEqualToString:UICollectionElementKindSectionFooter])
  {
    uint64_t v11 = +[RoutingAdvisoryInfoFooterView reuseIdentifier];
    uint64_t v12 = [v8 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v11 forIndexPath:v9];

    [v12 frame];
    [v12 setFrame:];
    [v12 setAlpha:0.0];
  }
  else
  {
    uint64_t v12 = [v8 dequeueReusableSupplementaryViewOfKind:v10 withReuseIdentifier:v10 forIndexPath:v9];
    unsigned int v13 = [v10 isEqualToString:@"RoutePlanningOutlineHeaderView"];

    if (v13)
    {
      id v14 = [(RoutePlanningOutlineController *)self headerView];

      if (v14)
      {
        __int16 v15 = [(RoutePlanningOutlineController *)self headerView];
        [v12 addSubview:v15];

        uint64_t v16 = [(RoutePlanningOutlineController *)self headerView];
        LODWORD(v17) = 1148846080;
        uint64_t v18 = [v16 _maps_constraintsEqualToEdgesOfView:v12 priority:v17];
        v19 = [v18 allConstraints];
        +[NSLayoutConstraint activateConstraints:v19];
      }
    }
  }

  return v12;
}

- (int64_t)sectionIndexForOutlineSection:(id)a3
{
  sectionStartIndexByIdentifier = self->_sectionStartIndexByIdentifier;
  uint64_t v4 = [a3 sectionIdentifier];
  id v5 = [(NSMutableDictionary *)sectionStartIndexByIdentifier objectForKeyedSubscript:v4];

  if (v5) {
    int64_t v6 = (int64_t)[v5 integerValue];
  }
  else {
    int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)outlineSectionRequiresReload:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (id)postReloadHandler
{
  return self->_postReloadHandler;
}

- (void)setPostReloadHandler:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (BOOL)hideContent
{
  return self->_hideContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong(&self->_postReloadHandler, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiersByStartIndex, 0);
  objc_storeStrong((id *)&self->_sectionStartIndexByIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionCountByIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_visibleOutlineSections, 0);

  objc_storeStrong((id *)&self->_outlineSections, 0);
}

@end