@interface RoutePlanningRouteOverviewOutlineSection
- (BOOL)allowsPersistentHighlight;
- (BOOL)hasSelectedStep;
- (BOOL)isCurrentRoute;
- (BOOL)isExpanded;
- (BOOL)isFirstRoute;
- (BOOL)isLastRoute;
- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3;
- (BOOL)showsDetailButton;
- (GEOComposedRoute)route;
- (NSArray)automaticSharingContacts;
- (RouteOverviewCellDelegate)routeCellDelegate;
- (RoutePlanningDataCoordination)dataCoordinator;
- (RoutePlanningRouteOverviewOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4;
- (double)estimatedItemHeight;
- (double)longestRouteLength;
- (id)_existingCell;
- (id)cellForItemAtIndexPath:(id)a3;
- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)_configureCell:(id)a3;
- (void)_resetCachedRowHeight;
- (void)performWhileSuppressingCellReloads:(id)a3;
- (void)reloadExistingCell;
- (void)setAllowPersistentHighlight:(BOOL)a3;
- (void)setAutomaticSharingContacts:(id)a3;
- (void)setCurrentRoute:(BOOL)a3;
- (void)setDataCoordinator:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)setFirstRoute:(BOOL)a3;
- (void)setHasSelectedStep:(BOOL)a3;
- (void)setLastRoute:(BOOL)a3;
- (void)setRoute:(id)a3;
- (void)setRouteCellDelegate:(id)a3;
- (void)setShowDetailButton:(BOOL)a3;
@end

@implementation RoutePlanningRouteOverviewOutlineSection

- (RoutePlanningRouteOverviewOutlineSection)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningRouteOverviewOutlineSection;
  v7 = [(RoutePlanningOutlineSection *)&v9 initWithCollectionView:v6 sectionIdentifier:a4];
  if (v7)
  {
    +[DynamicTypeWizard makeObject:v7 performSelector:"_resetCachedRowHeight" whenSizeCategoryChangesWithOrder:1];
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"RouteOverview"];
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"RouteOverviewAX"];
  }

  return v7;
}

- (id)listLayoutSectionConfigurationAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RoutePlanningRouteOverviewOutlineSection;
  v7 = [(RoutePlanningOutlineSection *)&v14 listLayoutSectionConfigurationAtIndex:a3 layoutEnvironment:v6];
  [v7 setSeparatorStyle:1];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100797C64;
  v10[3] = &unk_1012F8548;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v11 = v8;
  [v7 setSeparatorInsetProvider:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

- (void)performWhileSuppressingCellReloads:(id)a3
{
  if (a3)
  {
    ++self->_suppressReloads;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    --self->_suppressReloads;
  }
}

- (double)estimatedItemHeight
{
  if (self->_route)
  {
    [(UICollectionView *)self->super._collectionView bounds];
    CGFloat Width = CGRectGetWidth(v11);
    double result = self->_cachedRowHeight;
    if (result <= 2.22044605e-16 || vabdd_f64(Width, self->_lastCachedWidthForRowHeight) > 2.22044605e-16)
    {
      v5 = -[RouteOverviewCell initWithFrame:]([RouteOverviewCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      self->_lastCachedWidthForRowHeight = Width;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100797EE0;
      v8[3] = &unk_1012E5D58;
      v8[4] = self;
      objc_super v9 = v5;
      id v6 = v5;
      [(RouteOverviewCell *)v6 _maps_compressedSizeForWidth:v8 withBlock:Width];
      self->_cachedRowHeight = v7;

      return self->_cachedRowHeight;
    }
  }
  else
  {
    +[RouteOverviewCell minimumHeight];
  }
  return result;
}

- (void)_resetCachedRowHeight
{
  self->_cachedRowHeight = 0.0;
  self->_lastCachedWidthForRowHeight = 0.0;
}

- (void)setRoute:(id)a3
{
  id v5 = a3;
  route = self->_route;
  unint64_t v11 = (unint64_t)v5;
  id v7 = route;
  id v8 = (void *)v11;
  if (v11 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [(id)v11 isEqual:v7];

    id v8 = (void *)v11;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_route, a3);
      [(RoutePlanningRouteOverviewOutlineSection *)self _resetCachedRowHeight];
      v10 = [(RoutePlanningOutlineSection *)self host];
      [v10 outlineSectionRequiresReload:self];

      id v8 = (void *)v11;
    }
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_expanded != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_expanded = a3;
    id v6 = [(RoutePlanningRouteOverviewOutlineSection *)self _existingCell];
    if (v6)
    {
      id v7 = v6;
      [v6 setDetailsButtonRotated:v5 animated:v4];
      id v6 = v7;
    }
  }
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  v3 = [(RoutePlanningRouteOverviewOutlineSection *)self route];

  return v3 != 0;
}

- (id)cellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (+[UIFont accessibilityTextEnabled]) {
    CFStringRef v5 = @"RouteOverviewAX";
  }
  else {
    CFStringRef v5 = @"RouteOverview";
  }
  id v6 = [(UICollectionView *)self->super._collectionView dequeueReusableCellWithReuseIdentifier:v5 forIndexPath:v4];

  [(RoutePlanningRouteOverviewOutlineSection *)self _configureCell:v6];

  return v6;
}

- (BOOL)selectionFollowsFocusForItemAtIndexPath:(id)a3
{
  return self->_showDetailButton;
}

- (void)setCurrentRoute:(BOOL)a3
{
  if (self->_currentRoute != a3)
  {
    self->_currentRoute = a3;
    [(RoutePlanningRouteOverviewOutlineSection *)self reloadExistingCell];
  }
}

- (void)setAllowPersistentHighlight:(BOOL)a3
{
  if (self->_allowPersistentHighlight != a3)
  {
    self->_allowPersistentHighlight = a3;
    [(RoutePlanningRouteOverviewOutlineSection *)self reloadExistingCell];
  }
}

- (void)setShowDetailButton:(BOOL)a3
{
  if (self->_showDetailButton != a3)
  {
    self->_showDetailButton = a3;
    [(RoutePlanningRouteOverviewOutlineSection *)self _resetCachedRowHeight];
    [(RoutePlanningRouteOverviewOutlineSection *)self reloadExistingCell];
  }
}

- (void)setHasSelectedStep:(BOOL)a3
{
  if (self->_hasSelectedStep != a3)
  {
    self->_hasSelectedStep = a3;
    [(RoutePlanningRouteOverviewOutlineSection *)self reloadExistingCell];
  }
}

- (void)setAutomaticSharingContacts:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_automaticSharingContacts;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_automaticSharingContacts, a3);
      [(RoutePlanningRouteOverviewOutlineSection *)self _resetCachedRowHeight];
      [(RoutePlanningRouteOverviewOutlineSection *)self reloadExistingCell];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)setLastRoute:(BOOL)a3
{
  if (self->_lastRoute != a3)
  {
    self->_lastRoute = a3;
    [(RoutePlanningRouteOverviewOutlineSection *)self reloadExistingCell];
  }
}

- (void)reloadExistingCell
{
  if (!self->_suppressReloads)
  {
    v3 = [(RoutePlanningRouteOverviewOutlineSection *)self _existingCell];
    if (v3)
    {
      id v4 = v3;
      [(RoutePlanningRouteOverviewOutlineSection *)self _configureCell:v3];
      v3 = v4;
    }
  }
}

- (void)_configureCell:(id)a3
{
  id v11 = a3;
  id v4 = [(RoutePlanningRouteOverviewOutlineSection *)self route];
  BOOL v5 = sub_1000BBB44(self->super._collectionView) == 5;
  unint64_t v6 = [(RoutePlanningRouteOverviewOutlineSection *)self automaticSharingContacts];
  unint64_t v7 = [(RoutePlanningRouteOverviewOutlineSection *)self dataCoordinator];
  +[RouteOverviewCellComposer configureCell:v11 forRoute:v4 isMac:v5 automaticSharingContacts:v6 dataCoordinator:v7];

  [v11 setDetailsButtonRotated:[self isExpanded]];
  if ([(RoutePlanningRouteOverviewOutlineSection *)self allowsPersistentHighlight]) {
    BOOL v8 = [(RoutePlanningRouteOverviewOutlineSection *)self isCurrentRoute];
  }
  else {
    BOOL v8 = 0;
  }
  [v11 setSelectionBackgroundVisible:v8];
  [v11 setDetailsButtonVisible:[self showsDetailButton]];
  [v11 setHasSelectedStep:[self hasSelectedStep]];
  id v9 = [(RoutePlanningRouteOverviewOutlineSection *)self routeCellDelegate];
  [v11 setDelegate:v9];

  if (sub_1000BBB44(v11) != 5)
  {
    if ([(RoutePlanningRouteOverviewOutlineSection *)self isFirstRoute]
      && [(RoutePlanningRouteOverviewOutlineSection *)self isLastRoute])
    {
      uint64_t v10 = 1;
    }
    else if ([(RoutePlanningRouteOverviewOutlineSection *)self isFirstRoute])
    {
      uint64_t v10 = 2;
    }
    else if ([(RoutePlanningRouteOverviewOutlineSection *)self isLastRoute])
    {
      uint64_t v10 = 4;
    }
    else
    {
      uint64_t v10 = 3;
    }
    [v11 setOverrideCellGrouping:v10];
  }
  [v11 setDetailsButtonRotated:[self isExpanded]];
}

- (id)_existingCell
{
  v3 = [(RoutePlanningOutlineSection *)self host];
  id v4 = [v3 sectionIndexForOutlineSection:self];

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    unint64_t v6 = +[NSIndexPath indexPathForItem:0 inSection:v4];
    unint64_t v7 = [(UICollectionView *)self->super._collectionView cellForItemAtIndexPath:v6];
    objc_opt_class();
    id v5 = 0;
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
  }

  return v5;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (double)longestRouteLength
{
  return self->_longestRouteLength;
}

- (BOOL)isCurrentRoute
{
  return self->_currentRoute;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (BOOL)allowsPersistentHighlight
{
  return self->_allowPersistentHighlight;
}

- (BOOL)showsDetailButton
{
  return self->_showDetailButton;
}

- (BOOL)isFirstRoute
{
  return self->_firstRoute;
}

- (void)setFirstRoute:(BOOL)a3
{
  self->_firstRoute = a3;
}

- (BOOL)isLastRoute
{
  return self->_lastRoute;
}

- (BOOL)hasSelectedStep
{
  return self->_hasSelectedStep;
}

- (NSArray)automaticSharingContacts
{
  return self->_automaticSharingContacts;
}

- (RouteOverviewCellDelegate)routeCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeCellDelegate);

  return (RouteOverviewCellDelegate *)WeakRetained;
}

- (void)setRouteCellDelegate:(id)a3
{
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (RoutePlanningDataCoordination *)WeakRetained;
}

- (void)setDataCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_destroyWeak((id *)&self->_routeCellDelegate);
  objc_storeStrong((id *)&self->_automaticSharingContacts, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

@end