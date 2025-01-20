@interface RoutePlanningFeatureDiscoverOutlineSection
- (BOOL)isActive;
- (BOOL)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4;
- (RoutePlanningFeatureDiscoverOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_requireReload;
- (void)markFeatureDiscoveryViewShown;
- (void)setTransitPayActionDelegate:(id)a3;
- (void)willDisplayCell:(id)a3 forIndexPath:(id)a4;
@end

@implementation RoutePlanningFeatureDiscoverOutlineSection

- (RoutePlanningFeatureDiscoverOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RoutePlanningFeatureDiscoverOutlineSection;
  v8 = [(RoutePlanningOutlineSection *)&v15 initWithCollectionView:v6 sectionIdentifier:v7];
  if (v8)
  {
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"FeatureDiscovery"];
    v9 = objc_alloc_init(RoutePlanningFeatureDiscoveryProvider);
    featureDiscoveryProvider = v8->_featureDiscoveryProvider;
    v8->_featureDiscoveryProvider = v9;

    objc_initWeak(&location, v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10079734C;
    v12[3] = &unk_1012F8520;
    objc_copyWeak(&v13, &location);
    [(RoutePlanningFeatureDiscoveryProvider *)v8->_featureDiscoveryProvider setChangeHandler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningFeatureDiscoverOutlineSection;
  v4 = [(RoutePlanningOutlineSection *)&v6 listLayoutSectionConfigurationAtIndex:a3 layoutEnvironment:a4];
  [v4 setSeparatorStyle:0];

  return v4;
}

- (BOOL)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4
{
  return [(RoutePlanningFeatureDiscoveryProvider *)self->_featureDiscoveryProvider updateWithTransportType:a3 routeCollection:a4];
}

- (void)setTransitPayActionDelegate:(id)a3
{
  if (a3)
  {
    featureDiscoveryProvider = self->_featureDiscoveryProvider;
    -[RoutePlanningFeatureDiscoveryProvider setTransitPayActionDelegate:](featureDiscoveryProvider, "setTransitPayActionDelegate:");
  }
  else
  {
    v4 = sub_100021338();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RoutePlanningOutlineRootController.m";
      __int16 v8 = 1024;
      int v9 = 796;
      __int16 v10 = 2082;
      v11 = "-[RoutePlanningFeatureDiscoverOutlineSection setTransitPayActionDelegate:]";
      __int16 v12 = 2082;
      id v13 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", (uint8_t *)&v6, 0x26u);
    }

    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446978;
      id v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RoutePlanningOutlineRootController.m";
      __int16 v8 = 1024;
      int v9 = 796;
      __int16 v10 = 2082;
      v11 = "-[RoutePlanningFeatureDiscoverOutlineSection setTransitPayActionDelegate:]";
      __int16 v12 = 2082;
      id v13 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(RoutePlanningFeatureDiscoveryProvider *)self->_featureDiscoveryProvider suggestedModel];
  int64_t v4 = v3 != 0;

  return v4;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  int64_t v4 = [(UICollectionView *)self->super._collectionView dequeueReusableCellWithReuseIdentifier:@"FeatureDiscovery" forIndexPath:a3];
  v5 = [(RoutePlanningFeatureDiscoveryProvider *)self->_featureDiscoveryProvider suggestedModel];
  int v6 = [v4 featureDiscoveryView];
  [v6 setModel:v5];

  [v4 setContext:1];

  return v4;
}

- (void)willDisplayCell:(id)a3 forIndexPath:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningFeatureDiscoverOutlineSection;
  [(RoutePlanningOutlineSection *)&v9 willDisplayCell:v6 forIndexPath:a4];
  id v7 = [v6 featureDiscoveryView];
  __int16 v8 = [v7 model];
  [v8 markAsDisplayed];
}

- (void)_requireReload
{
  id v3 = [(RoutePlanningOutlineSection *)self host];
  [v3 outlineSectionRequiresReload:self];
}

- (BOOL)isActive
{
  v2 = [(RoutePlanningFeatureDiscoveryProvider *)self->_featureDiscoveryProvider suggestedModel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)markFeatureDiscoveryViewShown
{
}

- (void).cxx_destruct
{
}

@end