@interface RoutePlanningRouteStepsOutlineSection
- (BOOL)isCurrentRoute;
- (BOOL)shouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)shouldSelectItemAtIndexPath:(id)a3;
- (BOOL)wantsDefaultPaddingAboveSection;
- (GEOComposedRoute)route;
- (NSDirectionalEdgeInsets)_separatorInsetsForIndexPath:(id)a3;
- (TransitDirectionsStepsListDelegate)stepsListDelegate;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_configureCell:(id)a3 forIndexPath:(id)a4;
- (void)didHighlightItemAtIndexPath:(id)a3;
- (void)didSelectItemAtIndexPath:(id)a3;
- (void)didUnhighlightItemAtIndexPath:(id)a3;
- (void)setCurrentRoute:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)setStepsListDelegate:(id)a3;
@end

@implementation RoutePlanningRouteStepsOutlineSection

- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningRouteStepsOutlineSection;
  v4 = [(RoutePlanningOutlineSection *)&v6 layoutSectionAtIndex:a3 layoutEnvironment:a4];
  [v4 setContentInsets:0.0, 10.0, 0.0, 10.0];

  return v4;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RoutePlanningRouteStepsOutlineSection;
  v7 = [(RoutePlanningOutlineSection *)&v13 listLayoutSectionConfigurationAtIndex:a3 layoutEnvironment:v6];
  double v8 = _UICollectionViewListLayoutSectionAutomaticDimension;
  [v7 setEstimatedRowHeight:_UICollectionViewListLayoutSectionAutomaticDimension];
  [v7 setRowHeight:v8];
  [v7 setSeparatorStyle:1];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100798954;
  v10[3] = &unk_1012F8570;
  objc_copyWeak(&v11, &location);
  [v7 setSeparatorInsetProvider:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (NSDirectionalEdgeInsets)_separatorInsetsForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *(void *)&long long v26 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *((void *)&v26 + 1) = _UICollectionViewListLayoutSectionAutomaticDimension;
  *(void *)&long long v27 = _UICollectionViewListLayoutSectionAutomaticDimension;
  *((void *)&v27 + 1) = _UICollectionViewListLayoutSectionAutomaticDimension;
  if (sub_1000BBB44(self->super._collectionView) == 5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v5 = _UICollectionViewListSectionSeparatorInsetHidden[0];
    double v6 = _UICollectionViewListSectionSeparatorInsetHidden[1];
    double v7 = _UICollectionViewListSectionSeparatorInsetHidden[2];
    double v8 = _UICollectionViewListSectionSeparatorInsetHidden[3];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (([(DirectionsStepsListDataSource *)self->_stepsListDataSource shouldShowSeparatorForItemAtIndexPath:v4 insets:&v26] & 1) == 0)
      {
        long long v9 = *(_OWORD *)&_UICollectionViewListSectionSeparatorInsetHidden[2];
        long long v26 = *(_OWORD *)_UICollectionViewListSectionSeparatorInsetHidden;
        long long v27 = v9;
      }
      double v6 = *((double *)&v26 + 1);
      double v5 = *(double *)&v26;
      double v8 = *((double *)&v27 + 1);
      double v7 = *(double *)&v27;
    }
    else
    {
      v10 = (char *)[v4 row];
      if ((uint64_t)v10 >= (uint64_t)((char *)-[DirectionsStepsListDataSource collectionView:numberOfItemsInSection:](self->_stepsListDataSource, "collectionView:numberOfItemsInSection:", self->super._collectionView, [v4 section])- 1))
      {
        double v6 = v5;
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v12 = [(UICollectionView *)self->super._collectionView traitCollection];
        +[DirectionsStepTableViewCell cellMetricsForIdiom:](DirectionsStepTableViewCell, "cellMetricsForIdiom:", [v12 userInterfaceIdiom]);
        if (isKindOfClass)
        {
          double v14 = v24;
          double v13 = v25;
          double v15 = v23;
        }
        else
        {
          double v14 = v21;
          double v13 = v22;
          double v15 = v20;
        }
        double v6 = v15 + v13 + v14;
      }
      double v7 = v5;
      double v8 = v5;
    }
  }

  double v16 = v5;
  double v17 = v6;
  double v18 = v7;
  double v19 = v8;
  result.trailing = v19;
  result.bottom = v18;
  result.leading = v17;
  result.top = v16;
  return result;
}

- (BOOL)wantsDefaultPaddingAboveSection
{
  return 0;
}

- (void)setRoute:(id)a3
{
  id v5 = a3;
  route = self->_route;
  unint64_t v7 = (unint64_t)v5;
  id v8 = route;
  if (v7 | (unint64_t)v8)
  {
    long long v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_route, a3);
      stepsListDataSource = self->_stepsListDataSource;
      if (stepsListDataSource)
      {
        [(DirectionsStepsListDataSource *)stepsListDataSource setCollectionView:0];
        v12 = self->_stepsListDataSource;
        self->_stepsListDataSource = 0;
      }
      if (v7)
      {
        unsigned int v13 = [(id)v7 transportType];
        double v14 = off_1012D4638;
        if (v13 != 1) {
          double v14 = off_1012D2780;
        }
        double v15 = (DirectionsStepsListDataSource *)objc_alloc_init(*v14);
        double v16 = self->_stepsListDataSource;
        self->_stepsListDataSource = v15;

        [(DirectionsStepsListDataSource *)self->_stepsListDataSource setAllowStepSelection:1];
        [(DirectionsStepsListDataSource *)self->_stepsListDataSource setFlattenToSingleSection:1];
        double v17 = [(RoutePlanningRouteStepsOutlineSection *)self stepsListDelegate];
        [(DirectionsStepsListDataSource *)self->_stepsListDataSource setDelegate:v17];

        [(DirectionsStepsListDataSource *)self->_stepsListDataSource setOptions:15];
        [(DirectionsStepsListDataSource *)self->_stepsListDataSource setRoute:v7];
        [(DirectionsStepsListDataSource *)self->_stepsListDataSource setCollectionView:self->super._collectionView];
        objc_initWeak(&location, self);
        double v20 = _NSConcreteStackBlock;
        uint64_t v21 = 3221225472;
        double v22 = sub_100798DD0;
        double v23 = &unk_1012E6708;
        objc_copyWeak(&v24, &location);
        [(DirectionsStepsListDataSource *)self->_stepsListDataSource setReloadHandler:&v20];
        double v18 = [(RoutePlanningOutlineSection *)self host];
        [v18 outlineSectionRequiresReload:self];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      else
      {
        double v19 = [(RoutePlanningOutlineSection *)self host];
        [v19 outlineSectionRequiresReload:self];
      }
    }
  }
}

- (void)setCurrentRoute:(BOOL)a3
{
  if (self->_currentRoute != a3)
  {
    BOOL v3 = a3;
    self->_currentRoute = a3;
    id v5 = [(RoutePlanningOutlineSection *)self host];
    id v6 = [v5 sectionIndexForOutlineSection:self];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    unint64_t v7 = [(UICollectionView *)self->super._collectionView indexPathsForVisibleItems];
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      BOOL v11 = !v3;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned int v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v13 section] == v6)
          {
            double v14 = [(UICollectionView *)self->super._collectionView cellForItemAtIndexPath:v13];
            [v14 setMaps_suppressBackgroundColors:v11];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)setStepsListDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stepsListDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_stepsListDelegate, obj);
    [(DirectionsStepsListDataSource *)self->_stepsListDataSource setDelegate:obj];
  }
}

- (int64_t)numberOfSections
{
  return self->_stepsListDataSource != 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(DirectionsStepsListDataSource *)self->_stepsListDataSource collectionView:self->super._collectionView numberOfItemsInSection:0];
}

- (id)cellForItemAtIndexPath:(id)a3
{
  stepsListDataSource = self->_stepsListDataSource;
  collectionView = self->super._collectionView;
  id v6 = a3;
  unint64_t v7 = [(DirectionsStepsListDataSource *)stepsListDataSource collectionView:collectionView cellForItemAtIndexPath:v6];
  [(RoutePlanningRouteStepsOutlineSection *)self _configureCell:v7 forIndexPath:v6];

  return v7;
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v10;
    id v8 = [v6 item];
    if (v8 == (char *)-[RoutePlanningRouteStepsOutlineSection numberOfItemsInSection:](self, "numberOfItemsInSection:", [v6 section])- 1)uint64_t v9 = 4; {
    else
    }
      uint64_t v9 = 3;
    [v7 _setBackgroundViewConfigurationGrouping:v9];
  }
  [v10 setMaps_suppressBackgroundColors:[self isCurrentRoute] ^ 1];
}

- (BOOL)shouldHighlightItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v5 = [(DirectionsStepsListDataSource *)self->_stepsListDataSource collectionView:self->super._collectionView shouldHighlightItemAtIndexPath:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RoutePlanningRouteStepsOutlineSection;
    unsigned __int8 v5 = [(RoutePlanningOutlineSection *)&v8 shouldHighlightItemAtIndexPath:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)didHighlightItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(DirectionsStepsListDataSource *)self->_stepsListDataSource collectionView:self->super._collectionView didHighlightItemAtIndexPath:v4];
  }
}

- (void)didUnhighlightItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(DirectionsStepsListDataSource *)self->_stepsListDataSource collectionView:self->super._collectionView didUnhighlightItemAtIndexPath:v4];
  }
}

- (BOOL)shouldSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v5 = [(DirectionsStepsListDataSource *)self->_stepsListDataSource collectionView:self->super._collectionView shouldSelectItemAtIndexPath:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RoutePlanningRouteStepsOutlineSection;
    unsigned __int8 v5 = [(RoutePlanningOutlineSection *)&v8 shouldSelectItemAtIndexPath:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(DirectionsStepsListDataSource *)self->_stepsListDataSource collectionView:self->super._collectionView didSelectItemAtIndexPath:v4];
  }
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)isCurrentRoute
{
  return self->_currentRoute;
}

- (TransitDirectionsStepsListDelegate)stepsListDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stepsListDelegate);

  return (TransitDirectionsStepsListDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stepsListDelegate);
  objc_storeStrong((id *)&self->_route, 0);

  objc_storeStrong((id *)&self->_stepsListDataSource, 0);
}

@end