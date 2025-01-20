@interface RoutePlanningRouteCreationOutlineSection
- (RoutePlanningOverviewRouteCreationCellDelegate)routeCreationDelegate;
- (RoutePlanningRouteCreationOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_configureCell:(id)a3;
- (void)setRouteCreationDelegate:(id)a3;
@end

@implementation RoutePlanningRouteCreationOutlineSection

- (RoutePlanningRouteCreationOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningRouteCreationOutlineSection;
  v7 = [(RoutePlanningOutlineSection *)&v9 initWithCollectionView:v6 sectionIdentifier:a4];
  if (v7) {
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"RouteCreation"];
  }

  return v7;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningRouteCreationOutlineSection;
  v5 = [(RoutePlanningOutlineSection *)&v9 listLayoutSectionConfigurationAtIndex:a3 layoutEnvironment:a4];
  [v5 setSeparatorStyle:0];
  [v5 setEstimatedRowHeight:0.0];
  [(UICollectionView *)self->super._collectionView frame];
  double Width = CGRectGetWidth(v11);
  v7 = [(UICollectionView *)self->super._collectionView traitCollection];
  +[RoutePlanningOverviewRouteCreationCell heightForWidth:v7 traitCollection:Width];
  [v5 setRowHeight:];

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return 1;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  v4 = [(UICollectionView *)self->super._collectionView dequeueReusableCellWithReuseIdentifier:@"RouteCreation" forIndexPath:a3];
  [(RoutePlanningRouteCreationOutlineSection *)self _configureCell:v4];

  return v4;
}

- (void)_configureCell:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutePlanningRouteCreationOutlineSection *)self routeCreationDelegate];
  [v4 setDelegate:v5];
}

- (RoutePlanningOverviewRouteCreationCellDelegate)routeCreationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeCreationDelegate);

  return (RoutePlanningOverviewRouteCreationCellDelegate *)WeakRetained;
}

- (void)setRouteCreationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end