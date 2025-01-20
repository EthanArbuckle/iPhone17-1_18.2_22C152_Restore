@interface RoutePlanningOutlineRootController
- (BOOL)_hasExpandedStepsForRoute:(id)a3;
- (BOOL)_showDetailButton;
- (BOOL)_showPersistentHighlight;
- (BOOL)allowsPersistentHighlight;
- (BOOL)hasExpandedSteps;
- (BOOL)hasFeatureDiscoverySection;
- (BOOL)isInACustomRouteRegion;
- (CGRect)mostImportantRectToFrameWithSelectedRoute:(id)a3;
- (NSArray)automaticSharingContacts;
- (RouteCollection)routeCollection;
- (RouteOverviewCellDelegate)routeCellDelegate;
- (RoutePlanningDataCoordination)dataCoordinator;
- (RoutePlanningOutlineRootController)initWithCollectionView:(id)a3;
- (RoutePlanningOverviewRouteCreationCellDelegate)routeCreationDelegate;
- (RouteRowSelectionDelegate)routeSelectionDelegate;
- (TransitDirectionsStepsListDelegate)stepsListDelegate;
- (TransitPayActionDelegate)transitPayActionDelegate;
- (double)bottomSafeOffset;
- (double)estimatedFeatureDiscoveryHeight;
- (double)estimatedRoutePlanningAdvisoryFooterViewHeight;
- (id)_routeForExpandingOrCollapsingFromIndexPath:(id)a3;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)indexPathForRoute:(id)a3;
- (id)mostImportantIndexPathWithSelectedRoute:(id)a3;
- (id)routeForRowAtIndexPath:(id)a3;
- (int64_t)indexOfRouteForRowAtIndexPath:(id)a3;
- (int64_t)transportType;
- (void)_createRouteSectionsForCurrentRoutes;
- (void)_toggleStepsExpansionForRoute:(id)a3;
- (void)collapseCurrentlyFocusedRoute;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didUpdateVisibleOutlineSections;
- (void)expandCurrentlyFocusedRoute;
- (void)markFeatureDiscoveryShown;
- (void)prepareOutlineSections;
- (void)reloadExistingCellForRoute:(id)a3;
- (void)reloadVisibleRouteCells;
- (void)setAllowPersistentHighlight:(BOOL)a3;
- (void)setAutomaticSharingContacts:(id)a3;
- (void)setBottomSafeOffset:(double)a3;
- (void)setDataCoordinator:(id)a3;
- (void)setHasFeatureDiscoverySection:(BOOL)a3;
- (void)setIsInACustomRouteRegion:(BOOL)a3;
- (void)setRouteCellDelegate:(id)a3;
- (void)setRouteCollection:(id)a3;
- (void)setRouteCreationDelegate:(id)a3;
- (void)setRouteSelectionDelegate:(id)a3;
- (void)setStepsListDelegate:(id)a3;
- (void)setTransitPayActionDelegate:(id)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setupAdvisoryInfoLayout:(id)a3 tapHandler:(id)a4;
- (void)toggleStepsExpansionForRouteAtIndexPath:(id)a3;
- (void)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4 isInACustomRouteRegion:(BOOL)a5;
@end

@implementation RoutePlanningOutlineRootController

- (RoutePlanningOutlineRootController)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningOutlineRootController;
  v5 = [(RoutePlanningOutlineController *)&v11 initWithCollectionView:v4];
  if (v5)
  {
    [v4 setRemembersLastFocusedIndexPath:1];
    uint64_t v6 = +[NSMapTable weakToStrongObjectsMapTable];
    routeOverviewSectionsByRoute = v5->_routeOverviewSectionsByRoute;
    v5->_routeOverviewSectionsByRoute = (NSMapTable *)v6;

    uint64_t v8 = +[NSMapTable weakToStrongObjectsMapTable];
    stepsSectionsByRoute = v5->_stepsSectionsByRoute;
    v5->_stepsSectionsByRoute = (NSMapTable *)v8;
  }
  return v5;
}

- (void)prepareOutlineSections
{
  v3 = [(RoutePlanningOutlineController *)self collectionView];

  if (!v3)
  {
    outlineSections = self->super._outlineSections;
    self->super._outlineSections = (NSArray *)&__NSArray0__struct;

    routeOverviewSections = self->_routeOverviewSections;
    self->_routeOverviewSections = 0;

    [(NSMapTable *)self->_routeOverviewSectionsByRoute removeAllObjects];
    [(NSMapTable *)self->_stepsSectionsByRoute removeAllObjects];
    routeCreationSection = self->_routeCreationSection;
    self->_routeCreationSection = 0;

    v51.receiver = self;
    v51.super_class = (Class)RoutePlanningOutlineRootController;
    [(RoutePlanningOutlineController *)&v51 prepareOutlineSections];
    return;
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  featureDiscoverySection = self->_featureDiscoverySection;
  if (!featureDiscoverySection)
  {
    uint64_t v6 = [RoutePlanningFeatureDiscoverOutlineSection alloc];
    v7 = [(RoutePlanningOutlineController *)self collectionView];
    uint64_t v8 = [(RoutePlanningFeatureDiscoverOutlineSection *)v6 initWithCollectionView:v7 sectionIdentifier:@"FeatureDiscovery"];
    v9 = self->_featureDiscoverySection;
    self->_featureDiscoverySection = v8;

    v10 = self->_featureDiscoverySection;
    int64_t transportType = self->_transportType;
    v12 = [(RoutePlanningOutlineRootController *)self routeCollection];
    [(RoutePlanningFeatureDiscoverOutlineSection *)v10 updateWithTransportType:transportType routeCollection:v12];

    featureDiscoverySection = self->_featureDiscoverySection;
  }
  [v4 addObject:featureDiscoverySection];
  v13 = [(RoutePlanningOutlineRootController *)self dataCoordinator];
  v14 = [v13 waypointRequests];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v48;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v47 + 1) + 8 * (void)v19) waypointRequest];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v22 = v15;
          goto LABEL_20;
        }
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  v22 = [(RoutePlanningOutlineRootController *)self dataCoordinator];
  if ([v22 inACustomRouteRegion] && self->_transportType == 2)
  {
    int IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();

    if (IsEnabled_HikingiOS)
    {
      v24 = +[MapsOfflineUIHelper sharedHelper];
      unsigned __int8 v25 = [v24 isUsingOfflineMaps];

      if ((v25 & 1) == 0)
      {
        p_routeCreationSection = (id *)&self->_routeCreationSection;
        if (!self->_routeCreationSection)
        {
          v27 = [RoutePlanningRouteCreationOutlineSection alloc];
          v28 = [(RoutePlanningOutlineController *)self collectionView];
          v29 = [(RoutePlanningRouteCreationOutlineSection *)v27 initWithCollectionView:v28 sectionIdentifier:@"RouteCreation"];
          id v30 = *p_routeCreationSection;
          id *p_routeCreationSection = v29;

          v31 = [(RoutePlanningOutlineRootController *)self routeCreationDelegate];
          [*p_routeCreationSection setRouteCreationDelegate:v31];
        }
        int v32 = 1;
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_20:
  }
  int v32 = 0;
  p_routeCreationSection = (id *)&self->_routeCreationSection;
LABEL_22:
  NSUInteger v33 = [(NSArray *)self->_routeOverviewSections count];
  v34 = self->_routeOverviewSections;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1007933EC;
  v42[3] = &unk_1012F8430;
  char v46 = v32;
  id v35 = v4;
  id v43 = v35;
  v44 = self;
  NSUInteger v45 = v33;
  [(NSArray *)v34 enumerateObjectsUsingBlock:v42];
  if (v32)
  {
    if (([v35 containsObject:*p_routeCreationSection] & 1) == 0) {
      [v35 addObject:*p_routeCreationSection];
    }
  }
  v36 = (NSArray *)[v35 copy];
  v37 = self->super._outlineSections;
  self->super._outlineSections = v36;

  v41.receiver = self;
  v41.super_class = (Class)RoutePlanningOutlineRootController;
  [(RoutePlanningOutlineController *)&v41 prepareOutlineSections];
}

- (void)didUpdateVisibleOutlineSections
{
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningOutlineRootController;
  [(RoutePlanningOutlineController *)&v12 didUpdateVisibleOutlineSections];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  visibleOutlineSections = self->super._visibleOutlineSections;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007936F0;
  v7[3] = &unk_1012F8458;
  v7[4] = &v8;
  [(NSArray *)visibleOutlineSections enumerateObjectsUsingBlock:v7];
  id v4 = sub_1005775E4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (*((unsigned char *)v9 + 24)) {
      v5 = @"YES";
    }
    else {
      v5 = @"NO";
    }
    uint64_t v6 = v5;
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Found FeatureDiscoverySection: %@", buf, 0xCu);
  }
  [(RoutePlanningOutlineRootController *)self setHasFeatureDiscoverySection:*((unsigned __int8 *)v9 + 24)];
  _Block_object_dispose(&v8, 8);
}

- (id)mostImportantIndexPathWithSelectedRoute:(id)a3
{
  id v4 = a3;
  if ([(RoutePlanningFeatureDiscoverOutlineSection *)self->_featureDiscoverySection numberOfSections] >= 1&& [(RoutePlanningFeatureDiscoverOutlineSection *)self->_featureDiscoverySection numberOfItemsInSection:0])
  {
    uint64_t v5 = +[NSIndexPath indexPathForItem:0 inSection:[(RoutePlanningOutlineController *)self sectionIndexForOutlineSection:self->_featureDiscoverySection]];
LABEL_6:
    uint64_t v6 = (void *)v5;
    goto LABEL_8;
  }
  if (v4)
  {
    uint64_t v5 = [(RoutePlanningOutlineRootController *)self indexPathForRoute:v4];
    goto LABEL_6;
  }
  uint64_t v6 = 0;
LABEL_8:

  return v6;
}

- (CGRect)mostImportantRectToFrameWithSelectedRoute:(id)a3
{
  id v4 = a3;
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  CGFloat r2 = y;
  if ([(RoutePlanningFeatureDiscoverOutlineSection *)self->_featureDiscoverySection numberOfSections] < 1|| [(RoutePlanningFeatureDiscoverOutlineSection *)self->_featureDiscoverySection numberOfItemsInSection:0] < 1)
  {
    double v22 = height;
    CGFloat v16 = width;
    CGFloat v13 = CGRectZero.origin.x;
  }
  else
  {
    v9 = +[NSIndexPath indexPathForItem:0 inSection:[(RoutePlanningOutlineController *)self sectionIndexForOutlineSection:self->_featureDiscoverySection]];
    uint64_t v10 = [(RoutePlanningOutlineController *)self collectionViewLayout];
    char v11 = [v10 layoutAttributesForItemAtIndexPath:v9];

    [v11 frame];
    CGFloat v13 = v12;
    CGFloat y = v14;
    CGFloat v16 = v15;
    double v18 = v17;
    v19 = [(RoutePlanningOutlineRootController *)self routeCollection];
    v20 = [v19 routes];
    uint64_t v21 = [v20 firstObject];

    double v22 = v18;
    id v4 = (id)v21;
  }
  if (v4)
  {
    double v23 = v22;
    v24 = [(RoutePlanningOutlineRootController *)self indexPathForRoute:v4];
    unsigned __int8 v25 = [(RoutePlanningOutlineController *)self collectionViewLayout];
    v26 = [v25 layoutAttributesForItemAtIndexPath:v24];

    [v26 frame];
    CGFloat x = v27;
    CGFloat r2 = v28;
    CGFloat width = v29;
    double height = v30;

    double v22 = v23;
  }
  CGFloat v56 = x;
  CGFloat v57 = width;
  CGFloat v31 = CGRectNull.origin.x;
  CGFloat v33 = CGRectNull.size.width;
  CGFloat v32 = CGRectNull.size.height;
  CGFloat v34 = v13;
  CGFloat v35 = y;
  CGFloat v36 = v16;
  CGFloat v37 = v22;
  if (CGRectGetHeight(*(CGRect *)(&v22 - 3)) <= 2.22044605e-16)
  {
    [(RoutePlanningOutlineRootController *)self bottomSafeOffset];
    if (fabs(v39) <= 2.22044605e-16)
    {
      v40 = [(RoutePlanningOutlineRootController *)self routeCollection];
      id v41 = [v40 count];

      if ((unint64_t)v41 > 1) {
        double height = height + 34.0;
      }
    }
    CGFloat v38 = r2;
    v60.origin.CGFloat y = r2;
  }
  else
  {
    v59.origin.CGFloat y = CGRectNull.origin.y;
    v59.origin.CGFloat x = CGRectNull.origin.x;
    v59.size.CGFloat width = v33;
    v59.size.double height = v32;
    v63.origin.CGFloat x = v13;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = v16;
    v63.size.double height = v37;
    CGRect v60 = CGRectUnion(v59, v63);
    CGFloat v31 = v60.origin.x;
    CGFloat v33 = v60.size.width;
    CGFloat v32 = v60.size.height;
    double height = height * 0.600000024;
    CGFloat v38 = r2;
  }
  CGFloat v42 = v31;
  CGFloat v43 = v33;
  CGFloat v44 = v32;
  CGFloat v45 = v56;
  CGFloat v46 = v57;
  double v47 = height;
  CGRect v61 = CGRectUnion(v60, *(CGRect *)(&v38 - 1));
  CGFloat v48 = v61.origin.x;
  CGFloat v49 = v61.origin.y;
  CGFloat v50 = v61.size.width;
  CGFloat v51 = v61.size.height;

  double v52 = v48;
  double v53 = v49;
  double v54 = v50;
  double v55 = v51;
  result.size.double height = v55;
  result.size.CGFloat width = v54;
  result.origin.CGFloat y = v53;
  result.origin.CGFloat x = v52;
  return result;
}

- (BOOL)hasExpandedSteps
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  outlineSections = self->super._outlineSections;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100793BB0;
  v5[3] = &unk_1012F8458;
  v5[4] = &v6;
  [(NSArray *)outlineSections enumerateObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_hasExpandedStepsForRoute:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  outlineSections = self->super._outlineSections;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100793D10;
  v8[3] = &unk_1012F8598;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(NSArray *)outlineSections enumerateObjectsUsingBlock:v8];
  LOBYTE(outlineSections) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)outlineSections;
}

- (void)expandCurrentlyFocusedRoute
{
  char v3 = [(RoutePlanningOutlineController *)self collectionView];
  uint64_t v4 = sub_1000BBB44(v3);

  if (v4 != 5)
  {
    v20 = sub_1005762E4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      double v29 = "-[RoutePlanningOutlineRootController expandCurrentlyFocusedRoute]";
      __int16 v30 = 2080;
      CGFloat v31 = "RoutePlanningOutlineRootController.m";
      __int16 v32 = 1024;
      int v33 = 309;
      __int16 v34 = 2080;
      CGFloat v35 = "MapsIdiomIsMac(self.collectionView)";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      uint64_t v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        double v22 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        double v29 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v5 = [(RoutePlanningOutlineController *)self collectionView];
  uint64_t v6 = sub_1000BBB44(v5);

  if (v6 == 5)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v7 = [(RoutePlanningOutlineController *)self collectionView];
    uint64_t v8 = [v7 visibleCells];

    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v13 isFocused])
          {
            double v15 = [(RoutePlanningOutlineController *)self collectionView];
            CGFloat v16 = [v15 indexPathForCell:v13];

            double v17 = (const char *)[v16 section];
            char v14 = [(RoutePlanningOutlineRootController *)self _routeForExpandingOrCollapsingFromIndexPath:v16];

            if (v14
              && ![(RoutePlanningOutlineRootController *)self _hasExpandedStepsForRoute:v14])
            {
              double v18 = sub_1005775E4();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                v19 = [v14 uniqueRouteID];
                *(_DWORD *)buf = 138412546;
                double v29 = v19;
                __int16 v30 = 2048;
                CGFloat v31 = v17;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Will expand steps for route %@ at index %lu", buf, 0x16u);
              }
              [(RoutePlanningOutlineRootController *)self _toggleStepsExpansionForRoute:v14];
            }
            goto LABEL_17;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    char v14 = 0;
LABEL_17:
  }
}

- (void)collapseCurrentlyFocusedRoute
{
  char v3 = [(RoutePlanningOutlineController *)self collectionView];
  uint64_t v4 = sub_1000BBB44(v3);

  if (v4 != 5)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      double v28 = "-[RoutePlanningOutlineRootController collapseCurrentlyFocusedRoute]";
      __int16 v29 = 2080;
      __int16 v30 = (char *(__cdecl **)(const char *, int))"RoutePlanningOutlineRootController.m";
      __int16 v31 = 1024;
      int v32 = 333;
      __int16 v33 = 2080;
      __int16 v34 = "MapsIdiomIsMac(self.collectionView)";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        double v28 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v5 = [(RoutePlanningOutlineController *)self collectionView];
  uint64_t v6 = sub_1000BBB44(v5);

  if (v6 == 5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v7 = [(RoutePlanningOutlineController *)self collectionView];
    uint64_t v8 = [v7 visibleCells];

    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v13 isFocused])
          {
            double v15 = [(RoutePlanningOutlineController *)self collectionView];
            CGFloat v16 = [v15 indexPathForCell:v13];

            char v14 = [(RoutePlanningOutlineRootController *)self _routeForExpandingOrCollapsingFromIndexPath:v16];

            if (v14
              && [(RoutePlanningOutlineRootController *)self _hasExpandedStepsForRoute:v14])
            {
              double v17 = sub_1005775E4();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                double v18 = [v14 uniqueRouteID];
                *(_DWORD *)buf = 138412546;
                double v28 = v18;
                __int16 v29 = 2048;
                __int16 v30 = &index;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Will collapse steps for route %@ at index %lu", buf, 0x16u);
              }
              [(RoutePlanningOutlineRootController *)self _toggleStepsExpansionForRoute:v14];
            }
            goto LABEL_17;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    char v14 = 0;
LABEL_17:
  }
}

- (id)_routeForExpandingOrCollapsingFromIndexPath:(id)a3
{
  char v3 = -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [a3 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v4 = [v3 route];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)toggleStepsExpansionForRouteAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RoutePlanningOutlineController *)self collectionView];
  uint64_t v6 = sub_1000BBB44(v5);

  if (v6 != 5)
  {
    uint64_t v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315906;
      double v17 = "-[RoutePlanningOutlineRootController toggleStepsExpansionForRouteAtIndexPath:]";
      __int16 v18 = 2080;
      v19 = "RoutePlanningOutlineRootController.m";
      __int16 v20 = 1024;
      int v21 = 367;
      __int16 v22 = 2080;
      long long v23 = "MapsIdiomIsMac(self.collectionView)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v16, 0x26u);
    }

    if (sub_100BB36BC())
    {
      char v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        double v15 = +[NSThread callStackSymbols];
        int v16 = 138412290;
        double v17 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  v7 = [(RoutePlanningOutlineController *)self collectionView];
  uint64_t v8 = sub_1000BBB44(v7);

  if (v8 == 5)
  {
    id v9 = [(RoutePlanningOutlineRootController *)self routeForRowAtIndexPath:v4];
    if (v9)
    {
      id v10 = sub_1005775E4();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [v9 uniqueRouteID];
        double v12 = (const char *)[v4 section];
        int v16 = 138412546;
        double v17 = v11;
        __int16 v18 = 2048;
        v19 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will toggle expanded steps for route %@ at index %ld", (uint8_t *)&v16, 0x16u);
      }
      [(RoutePlanningOutlineRootController *)self _toggleStepsExpansionForRoute:v9];
    }
  }
}

- (void)_toggleStepsExpansionForRoute:(id)a3
{
  stepsSectionsByRoute = self->_stepsSectionsByRoute;
  id v5 = a3;
  uint64_t v6 = [(NSMapTable *)stepsSectionsByRoute objectForKey:v5];
  if (v6)
  {
    v7 = (RoutePlanningRouteStepsOutlineSection *)v6;
    int64_t v8 = [(RoutePlanningOutlineController *)self sectionIndexForOutlineSection:v6];
    [(NSMapTable *)self->_stepsSectionsByRoute removeObjectForKey:v5];
  }
  else
  {
    id v9 = [RoutePlanningRouteStepsOutlineSection alloc];
    id v10 = [(RoutePlanningOutlineController *)self collectionView];
    uint64_t v11 = [(RoutePlanningOutlineRootController *)self routeCollection];
    double v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Route%lu.Steps", [v11 indexOfRoute:v5]);
    v7 = [(RoutePlanningOutlineSection *)v9 initWithCollectionView:v10 sectionIdentifier:v12];

    [(RoutePlanningRouteStepsOutlineSection *)v7 setRoute:v5];
    [(RoutePlanningOutlineSection *)v7 setHost:self];
    uint64_t v13 = [(RoutePlanningOutlineRootController *)self stepsListDelegate];
    [(RoutePlanningRouteStepsOutlineSection *)v7 setStepsListDelegate:v13];

    [(NSMapTable *)self->_stepsSectionsByRoute setObject:v7 forKey:v5];
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  char v14 = [(NSMapTable *)self->_routeOverviewSectionsByRoute objectForKey:v5];

  [v14 setExpanded:v8 == 0x7FFFFFFFFFFFFFFFLL];
  -[RoutePlanningRouteStepsOutlineSection setCurrentRoute:](v7, "setCurrentRoute:", [v14 isCurrentRoute]);
  double v15 = [(RoutePlanningOutlineController *)self collectionView];
  v17[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10079499C;
  v18[3] = &unk_1012EA9E0;
  v19 = v7;
  int64_t v20 = v8;
  v18[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100794A7C;
  v17[3] = &unk_1012E7D28;
  int v16 = v7;
  [v15 performBatchUpdates:v18 completion:v17];
}

- (void)markFeatureDiscoveryShown
{
}

- (double)estimatedFeatureDiscoveryHeight
{
  char v3 = [(RoutePlanningOutlineController *)self collectionView];
  if (sub_1000BBB44(v3))
  {
    id v4 = [(RoutePlanningOutlineController *)self collectionView];
    uint64_t v5 = sub_1000BBB44(v4);

    if (v5 != 1) {
      return 0.0;
    }
  }
  else
  {
  }
  if ([(RoutePlanningFeatureDiscoverOutlineSection *)self->_featureDiscoverySection numberOfSections] < 1|| [(RoutePlanningFeatureDiscoverOutlineSection *)self->_featureDiscoverySection numberOfItemsInSection:0] < 1)
  {
    return 0.0;
  }

  +[FeatureDiscoveryView estimatedHeight];
  return result;
}

- (double)estimatedRoutePlanningAdvisoryFooterViewHeight
{
  double v2 = 0.0;
  if (self->_advisoryInfo)
  {
    id v4 = [(RoutePlanningOutlineController *)self collectionView];
    uint64_t v5 = sub_1000BBB44(v4);

    if (v5 == 5)
    {
      uint64_t v6 = [(GEOAdvisoriesInfo *)self->_advisoryInfo genericAdvisorys];
      v7 = [v6 firstObject];

      id v8 = objc_alloc((Class)GEOComposedString);
      id v9 = [v7 noticeText];
      id v10 = [v8 initWithGeoFormattedString:v9];

      id v11 = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:v10];
      NSAttributedStringKey v28 = NSFontAttributeName;
      double v12 = +[UIFont system15];
      __int16 v29 = v12;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];

      char v14 = [v11 multiPartAttributedStringWithAttributes:v13];
      double v15 = [v14 attributedString];
      int v16 = [v15 string];

      if ([v16 length])
      {
        id v17 = v16;
      }
      else
      {
        id v17 = [v10 stringWithDefaultOptions];
      }
      __int16 v18 = v17;
      v19 = +[RoutingAdvisoryInfoFooterView learnMoreText];
      int64_t v20 = +[NSString localizedStringWithFormat:@"%@ %@", v18, v19];

      int v21 = [(RoutePlanningOutlineController *)self collectionView];
      [v21 frame];
      double v23 = v22;
      +[RouteOverviewCell horizontalContentInset];
      double v25 = v23 + v24 * -2.0;

      [v20 boundingRectWithSize:1 options:v13 attributes:0 context:v25];
      double v2 = v26 + 16.0;
    }
  }
  return v2;
}

- (id)routeForRowAtIndexPath:(id)a3
{
  char v3 = -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [a3 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 route];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)indexPathForRoute:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_routeOverviewSections;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v10 route:v14];
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          double v12 = +[NSIndexPath indexPathForItem:0 inSection:[(RoutePlanningOutlineController *)self sectionIndexForOutlineSection:v10]];
          goto LABEL_11;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  double v12 = 0;
LABEL_11:

  return v12;
}

- (int64_t)indexOfRouteForRowAtIndexPath:(id)a3
{
  id v4 = -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [a3 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v5 = [(NSArray *)self->_routeOverviewSections indexOfObject:v4];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)reloadExistingCellForRoute:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int64_t v5 = self->_routeOverviewSections;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 route:(void)v12];
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          [v10 reloadExistingCell];
          goto LABEL_11;
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)reloadVisibleRouteCells
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v3 = [(RoutePlanningOutlineController *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) section]);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 reloadExistingCell];
        }

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setAllowPersistentHighlight:(BOOL)a3
{
  if (self->_allowPersistentHighlight != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_1005775E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = @"NO";
      if (v3) {
        id v6 = @"YES";
      }
      uint64_t v7 = v6;
      *(_DWORD *)buf = 138412290;
      double v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Set allowPersistentHighlight: %@", buf, 0xCu);
    }
    self->_allowPersistentHighlight = v3;
    BOOL v8 = [(RoutePlanningOutlineRootController *)self _showPersistentHighlight];
    BOOL v9 = [(RoutePlanningOutlineRootController *)self _showDetailButton];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v10 = self->_routeOverviewSections;
    id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v15 setAllowPersistentHighlight:v8];
          [v15 setShowDetailButton:v9];
        }
        id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)setAutomaticSharingContacts:(id)a3
{
  id v5 = a3;
  automaticSharingContacts = self->_automaticSharingContacts;
  unint64_t v7 = (unint64_t)v5;
  id v8 = automaticSharingContacts;
  if (v7 | (unint64_t)v8)
  {
    BOOL v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      id v11 = sub_100576A9C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "RoutePlanningOutlineRootController setting automatic sharing contacts: %@", buf, 0xCu);
      }

      id v12 = sub_1005775E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v24 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Set automaticSharingContacts: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_automaticSharingContacts, a3);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v13 = self->_routeOverviewSections;
      id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          long long v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            [*(id *)(*((void *)&v18 + 1) + 8 * (void)v17) setAutomaticSharingContacts:v7 v18];
            long long v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v15);
      }
    }
  }
}

- (BOOL)_showPersistentHighlight
{
  if (![(RoutePlanningOutlineRootController *)self allowsPersistentHighlight]) {
    return 0;
  }
  BOOL v3 = [(RoutePlanningOutlineRootController *)self routeCollection];
  if ((unint64_t)[v3 count] <= 1)
  {
    id v5 = [(RoutePlanningOutlineController *)self collectionView];
    BOOL v4 = sub_1000BBB44(v5) == 5;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)_showDetailButton
{
  if ([(RoutePlanningOutlineRootController *)self allowsPersistentHighlight]) {
    return 1;
  }
  BOOL v4 = [(RoutePlanningOutlineController *)self collectionView];
  BOOL v3 = sub_1000BBB44(v4) == 5;

  return v3;
}

- (void)_createRouteSectionsForCurrentRoutes
{
  [(NSMapTable *)self->_routeOverviewSectionsByRoute removeAllObjects];
  [(NSMapTable *)self->_stepsSectionsByRoute removeAllObjects];
  BOOL v3 = [(RoutePlanningOutlineRootController *)self routeCollection];
  BOOL v4 = [v3 currentRoute];

  id v5 = [(RoutePlanningOutlineRootController *)self routeCollection];
  id v6 = [v5 routes];

  id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v34;
    double v12 = 0.0;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v14 distance];
        if (v12 <= v15)
        {
          [v14 distance];
          double v12 = v16;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v10);
  }

  unsigned __int8 v17 = [(RoutePlanningOutlineRootController *)self _showPersistentHighlight];
  unsigned __int8 v18 = [(RoutePlanningOutlineRootController *)self _showDetailButton];
  long long v19 = [v8 lastObject];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100795A44;
  v27[3] = &unk_1012F84A8;
  v27[4] = self;
  unsigned __int8 v31 = v18;
  unsigned __int8 v32 = v17;
  id v20 = v4;
  id v28 = v20;
  id v21 = v19;
  id v29 = v21;
  id v22 = v7;
  id v30 = v22;
  [v8 enumerateObjectsUsingBlock:v27];
  double v23 = (NSArray *)[v22 copy];
  routeOverviewSections = self->_routeOverviewSections;
  self->_routeOverviewSections = v23;

  double v25 = sub_1005775E4();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v26 = [(NSArray *)self->_routeOverviewSections count];
    *(_DWORD *)buf = 134217984;
    NSUInteger v38 = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Created %lu for current routes", buf, 0xCu);
  }
}

- (void)setDataCoordinator:(id)a3
{
}

- (void)updateWithTransportType:(int64_t)a3 routeCollection:(id)a4 isInACustomRouteRegion:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = sub_1005775E4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4) {
      CFStringRef v10 = @"Undefined";
    }
    else {
      CFStringRef v10 = off_1012F85B8[a3 - 1];
    }
    uint64_t v11 = [v8 uniqueRouteIDs];
    *(_DWORD *)buf = 138412546;
    CFStringRef v52 = v10;
    __int16 v53 = 2112;
    double v54 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "updateWithTransportType: %@, routeCollection: %@", buf, 0x16u);
  }
  int64_t transportType = self->_transportType;
  routeCollection = self->_routeCollection;
  unint64_t v14 = (unint64_t)v8;
  double v15 = (void *)v14;
  if (v14 | (unint64_t)routeCollection) {
    unsigned int v16 = [(id)v14 isEqual:routeCollection];
  }
  else {
    unsigned int v16 = 1;
  }

  unsigned int v17 = [(RoutePlanningOutlineRootController *)self isInACustomRouteRegion] ^ v5;
  BOOL v18 = transportType != a3 || v16 == 0;
  if (v18 || (v17 & 1) != 0)
  {
    if (transportType == a3) {
      char v20 = v17;
    }
    else {
      char v20 = 1;
    }
    if (v20)
    {
      char v21 = 1;
    }
    else
    {
      id v22 = [v15 routes];
      [(RouteCollection *)self->_routeCollection routes];
      v24 = double v23 = v15;
      BOOL v39 = v5;
      unsigned __int8 v25 = [v22 isEqualToArray:v24];

      double v15 = v23;
      char v21 = v25 ^ 1;
      LOBYTE(v5) = v39;
    }
    objc_storeStrong((id *)&self->_routeCollection, a4);
    self->_int64_t transportType = a3;
    self->_isInACustomRouteRegion = v5;
    unsigned __int8 v26 = [(RoutePlanningFeatureDiscoverOutlineSection *)self->_featureDiscoverySection updateWithTransportType:a3 routeCollection:v15];
    if (v21 & 1) != 0 || (v26)
    {
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100796134;
      v42[3] = &unk_1012F84D0;
      char v43 = v16;
      unsigned __int8 v44 = v26;
      char v45 = v17 ^ 1;
      void v42[4] = self;
      [(RoutePlanningOutlineController *)self performBatchSectionUpdates:v42];
    }
    else
    {
      double v27 = sub_1005775E4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Only current route changed", buf, 2u);
      }

      id obja = v15;
      id v28 = [v15 currentRoute];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v29 = self->_routeOverviewSections;
      id v30 = [(NSArray *)v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v47;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v47 != v32) {
              objc_enumerationMutation(v29);
            }
            long long v34 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            long long v35 = [v34 route];
            [v34 setCurrentRoute:v35 == v28];

            stepsSectionsByRoute = self->_stepsSectionsByRoute;
            CGFloat v37 = [v34 route];
            NSUInteger v38 = [(NSMapTable *)stepsSectionsByRoute objectForKey:v37];

            [v38 setCurrentRoute:[v34 isCurrentRoute]];
          }
          id v31 = [(NSArray *)v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v31);
      }

      double v15 = obja;
    }
  }
  else
  {
    long long v19 = sub_1005775E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "No changes, exit early", buf, 2u);
    }
  }
}

- (void)setRouteCellDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeCellDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_routeCellDelegate, v4);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_routeOverviewSections;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        CFStringRef v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) setRouteCellDelegate:v4 v11];
          CFStringRef v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)setRouteCreationDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeCreationDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_routeCreationDelegate, obj);
    [(RoutePlanningRouteCreationOutlineSection *)self->_routeCreationSection setRouteCreationDelegate:obj];
  }
}

- (void)setRouteSelectionDelegate:(id)a3
{
  id obj = a3;
  p_routeSelectionDelegate = &self->_routeSelectionDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_routeSelectionDelegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_routeSelectionDelegate, obj);
    id v6 = obj;
  }
}

- (void)setStepsListDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stepsListDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_stepsListDelegate, v4);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(NSMapTable *)self->_stepsSectionsByRoute objectEnumerator];
    id v7 = [v6 allObjects];

    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        long long v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) setStepsListDelegate:v4];
          long long v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)setTransitPayActionDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

    if (WeakRetained != v4)
    {
      objc_storeWeak((id *)&self->_transitPayActionDelegate, v4);
      [(RoutePlanningFeatureDiscoverOutlineSection *)self->_featureDiscoverySection setTransitPayActionDelegate:v4];
    }
  }
  else
  {
    id v6 = sub_100021338();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136446978;
      id v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RoutePlanningOutlineRootController.m";
      __int16 v10 = 1024;
      int v11 = 679;
      __int16 v12 = 2082;
      long long v13 = "-[RoutePlanningOutlineRootController setTransitPayActionDelegate:]";
      __int16 v14 = 2082;
      long long v15 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", (uint8_t *)&v8, 0x26u);
    }

    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v8 = 136446978;
      id v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RoutePlanningOutlineRootController.m";
      __int16 v10 = 1024;
      int v11 = 679;
      __int16 v12 = 2082;
      long long v13 = "-[RoutePlanningOutlineRootController setTransitPayActionDelegate:]";
      __int16 v14 = 2082;
      long long v15 = "nil == transitPayActionDelegate";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Transit + Pay requires an action delegate", (uint8_t *)&v8, 0x26u);
    }
  }
}

- (void)setupAdvisoryInfoLayout:(id)a3 tapHandler:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (MapsFeature_IsEnabled_FrenchClimateLaw())
  {
    objc_storeStrong((id *)&self->_advisoryInfo, a3);
    self->_shouldReloadFooterView = v10 != 0;
    id v8 = objc_retainBlock(v7);
    id advisoryTapHandler = self->_advisoryTapHandler;
    self->_id advisoryTapHandler = v8;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)RoutePlanningOutlineRootController;
  [(RoutePlanningOutlineController *)&v27 collectionView:v6 didSelectItemAtIndexPath:v7];
  id v8 = -[RoutePlanningOutlineController outlineSectionAtIndex:](self, "outlineSectionAtIndex:", [v7 section]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    id v10 = [(RoutePlanningOutlineRootController *)self routeSelectionDelegate];
    int v11 = [v9 route];

    [v10 dataSource:self didSelectRowForRoute:v11];
    [v6 deselectItemAtIndexPath:v7 animated:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v22 = v7;
      char v21 = v8;
      id v12 = v8;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v13 = [(NSMapTable *)self->_routeOverviewSectionsByRoute keyEnumerator];
      id v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            BOOL v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            long long v19 = [(NSMapTable *)self->_routeOverviewSectionsByRoute objectForKey:v18];
            char v20 = [v12 route];
            [v19 setHasSelectedStep:v18 == v20];
          }
          id v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v15);
      }

      id v7 = v22;
      id v8 = v21;
    }
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = [(RoutePlanningOutlineRootController *)self routeCollection];
  BOOL v5 = [v4 currentRoute];

  if (v5)
  {
    id v6 = [(RoutePlanningOutlineRootController *)self routeCollection];
    id v7 = [v6 currentRoute];
    id v8 = [(RoutePlanningOutlineRootController *)self indexPathForRoute:v7];
  }
  else
  {
    id v8 = +[NSIndexPath indexPathForItem:0 inSection:0];
  }

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:UICollectionElementKindSectionFooter])
  {
    int v11 = [(GEOAdvisoriesInfo *)self->_advisoryInfo genericAdvisorys];
    id v12 = [v11 firstObject];

    long long v13 = +[RoutingAdvisoryInfoFooterView reuseIdentifier];
    id v14 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v13 forIndexPath:v10];

    if (self->_shouldReloadFooterView
      && (id v15 = [v10 section], v15 == (char *)objc_msgSend(v8, "numberOfSections") - 1)
      && v12
      && [v12 shouldAlwaysShowAdvisoryCard]
      && MapsFeature_IsEnabled_FrenchClimateLaw())
    {
      objc_initWeak(&location, self);
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3042000000;
      v20[3] = sub_100103F2C;
      v20[4] = sub_100104820;
      objc_initWeak(&v21, v14);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100796E64;
      v18[3] = &unk_1012F84F8;
      objc_copyWeak(&v19, &location);
      v18[4] = v20;
      [v14 updateDescriptionInfo:v12 tapHandler:v18];
      objc_destroyWeak(&v19);
      _Block_object_dispose(v20, 8);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    else
    {
      [v14 frame];
      [v14 setFrame:];
      [v14 setAlpha:0.0];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)RoutePlanningOutlineRootController;
    id v14 = [(RoutePlanningOutlineController *)&v17 collectionView:v8 viewForSupplementaryElementOfKind:v9 atIndexPath:v10];
  }

  return v14;
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCoordinator);

  return (RoutePlanningDataCoordination *)WeakRetained;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_int64_t transportType = a3;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void)setRouteCollection:(id)a3
{
}

- (NSArray)automaticSharingContacts
{
  return self->_automaticSharingContacts;
}

- (BOOL)allowsPersistentHighlight
{
  return self->_allowPersistentHighlight;
}

- (BOOL)hasFeatureDiscoverySection
{
  return self->_hasFeatureDiscoverySection;
}

- (void)setHasFeatureDiscoverySection:(BOOL)a3
{
  self->_hasFeatureDiscoverySection = a3;
}

- (RouteOverviewCellDelegate)routeCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeCellDelegate);

  return (RouteOverviewCellDelegate *)WeakRetained;
}

- (RoutePlanningOverviewRouteCreationCellDelegate)routeCreationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeCreationDelegate);

  return (RoutePlanningOverviewRouteCreationCellDelegate *)WeakRetained;
}

- (RouteRowSelectionDelegate)routeSelectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeSelectionDelegate);

  return (RouteRowSelectionDelegate *)WeakRetained;
}

- (TransitDirectionsStepsListDelegate)stepsListDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stepsListDelegate);

  return (TransitDirectionsStepsListDelegate *)WeakRetained;
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitPayActionDelegate);

  return (TransitPayActionDelegate *)WeakRetained;
}

- (double)bottomSafeOffset
{
  return self->_bottomSafeOffset;
}

- (void)setBottomSafeOffset:(double)a3
{
  self->_bottomSafeOffset = a3;
}

- (BOOL)isInACustomRouteRegion
{
  return self->_isInACustomRouteRegion;
}

- (void)setIsInACustomRouteRegion:(BOOL)a3
{
  self->_isInACustomRouteRegion = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitPayActionDelegate);
  objc_destroyWeak((id *)&self->_stepsListDelegate);
  objc_destroyWeak((id *)&self->_routeSelectionDelegate);
  objc_destroyWeak((id *)&self->_routeCreationDelegate);
  objc_destroyWeak((id *)&self->_routeCellDelegate);
  objc_storeStrong((id *)&self->_automaticSharingContacts, 0);
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong(&self->_advisoryTapHandler, 0);
  objc_storeStrong((id *)&self->_advisoryInfo, 0);
  objc_storeStrong((id *)&self->_stepsSectionsByRoute, 0);
  objc_storeStrong((id *)&self->_routeOverviewSectionsByRoute, 0);
  objc_storeStrong((id *)&self->_routeCreationSection, 0);
  objc_storeStrong((id *)&self->_routeOverviewSections, 0);

  objc_storeStrong((id *)&self->_featureDiscoverySection, 0);
}

@end