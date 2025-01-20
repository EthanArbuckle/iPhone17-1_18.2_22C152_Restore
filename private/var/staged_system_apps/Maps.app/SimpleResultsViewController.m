@interface SimpleResultsViewController
- (ActionCoordination)coordinator;
- (BOOL)_canShowWhileLocked;
- (BOOL)containsMapItem:(id)a3;
- (BOOL)enableQuickActionMenu;
- (BOOL)isPresentingSearchAlongTheRouteResults;
- (BOOL)isPresentingVenueClusterResults;
- (BOOL)quickActionMenuPresenter:(id)a3 isPopularNearbyAtIndexPath:(id)a4;
- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5;
- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4;
- (ContainerHeaderView)titleHeaderView;
- (MUScrollViewImpressionsCalculator)impressionsCalculator;
- (SARSearchResultTableViewCellDelegate)searchAlongTheRouteCellDelegate;
- (SimpleResultsViewController)initWithShareDelegate:(id)a3;
- (SimpleResultsViewController)initWithShareDelegate:(id)a3 visualEffectDisabled:(BOOL)a4;
- (SimpleResultsViewControllerDelegate)resultsDelegate;
- (VKLabelMarker)cluster;
- (double)_searchAlongRouteHeaderHeightForStyle:(unint64_t)a3 traitCollection:(id)a4;
- (double)heightForLayout:(unint64_t)a3;
- (id)contentView;
- (id)headerView;
- (id)mapServiceTraitsForQuickActionPresenter:(id)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)uiTargetForQuickActionMenu;
- (void)_updateHeaderWithContainerStyle:(unint64_t)a3 traitCollection:(id)a4;
- (void)_updatePopoverCoordinate;
- (void)applyAlphaToContent:(double)a3;
- (void)clearCluster;
- (void)dataSource:(id)a3 itemFocused:(id)a4;
- (void)dataSource:(id)a3 itemTapped:(id)a4;
- (void)dataSourceUpdated:(id)a3;
- (void)didBecomeCurrent;
- (void)didChangeLayout:(unint64_t)a3;
- (void)didResignCurrent;
- (void)didTapOnAddStopWithSearchResult:(id)a3 atIndexPath:(id)a4;
- (void)didTapOnCallWithSearchResult:(id)a3;
- (void)didTapOnContainmentParentMapItem:(id)a3;
- (void)didTapOnCuratedGuide:(id)a3;
- (void)didTapOnCuratedGuides:(id)a3;
- (void)didTapOnDirectionsWithSearchResult:(id)a3;
- (void)didTapOnFlyoverWithSearchResult:(id)a3;
- (void)didTapOnLookAroundWithSearchResult:(id)a3;
- (void)didTapOnTappableEntry:(id)a3;
- (void)didTapOnUserGeneratedGuide:(id)a3;
- (void)didTapOnWebsiteWithSearchResult:(id)a3;
- (void)handleDismissAction:(id)a3;
- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4;
- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4;
- (void)setCluster:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5;
- (void)setCluster:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5 searchResults:(id)a6;
- (void)setCoordinator:(id)a3;
- (void)setDisplayDistance:(BOOL)a3;
- (void)setEnableQuickActionMenu:(BOOL)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setIsPresentingSearchAlongTheRouteResults:(BOOL)a3;
- (void)setIsPresentingVenueClusterResults:(BOOL)a3;
- (void)setResultsDelegate:(id)a3;
- (void)setSearchAlongTheRouteCellDelegate:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setSearchResults:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5;
- (void)updateCurrentLocation:(id)a3 isClusterResult:(BOOL)a4;
- (void)updatePreferredContentSize;
- (void)updateTitle:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeCurrent:(BOOL)a3;
- (void)willChangeContainerStyle:(unint64_t)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SimpleResultsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (SimpleResultsViewController)initWithShareDelegate:(id)a3
{
  return [(SimpleResultsViewController *)self initWithShareDelegate:a3 visualEffectDisabled:0];
}

- (SimpleResultsViewController)initWithShareDelegate:(id)a3 visualEffectDisabled:(BOOL)a4
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SimpleResultsViewController;
  v6 = [(SimpleResultsViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_shareDelegate, v5);
    v7->_displayDistance = 1;
  }

  return v7;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v4 viewDidLayoutSubviews];
  v3 = [(SimpleResultsViewController *)self impressionsCalculator];
  [v3 logImpressions];
}

- (void)didChangeLayout:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v5 didChangeLayout:a3];
  objc_super v4 = [(SimpleResultsViewController *)self impressionsCalculator];
  [v4 logImpressions];
}

- (void)didResignCurrent
{
  v4.receiver = self;
  v4.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v4 didResignCurrent];
  v3 = [(SimpleResultsViewController *)self impressionsCalculator];
  [v3 setActive:0];
}

- (void)didBecomeCurrent
{
  v7.receiver = self;
  v7.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v7 didBecomeCurrent];
  v3 = [(SimpleResultsViewController *)self impressionsCalculator];
  [v3 setActive:1];

  objc_super v4 = [(SimpleResultsViewController *)self impressionsCalculator];
  unsigned __int8 v5 = [v4 hasImpressionElements];

  if ((v5 & 1) == 0)
  {
    v6 = [(SimpleResultsViewController *)self impressionsCalculator];
    [v6 logImpressions];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v5 scrollViewDidScroll:a3];
  objc_super v4 = [(SimpleResultsViewController *)self impressionsCalculator];
  [v4 logImpressions];
}

- (void)setHeaderTitle:(id)a3
{
}

- (void)updateTitle:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(SearchResultsDataSource *)self->_resultsDataSource content];
  v6 = [v5 objects];
  id v7 = [v6 count];

  if (sub_1000BBB44(self) == 5)
  {
    title = self->_title;
    if (v3)
    {
      if (!title)
      {
        objc_super v9 = +[NSBundle mainBundle];
        v10 = v9;
        CFStringRef v11 = @"Stops [Marzipan Cluster Card]";
LABEL_12:
        v17 = [v9 localizedStringForKey:v11 value:@"localized string not found" table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v7);
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();

        v14 = v25;
        goto LABEL_13;
      }
    }
    else if (!title)
    {
      objc_super v9 = +[NSBundle mainBundle];
      v10 = v9;
      CFStringRef v11 = @"Places [Marzipan Cluster Card]";
      goto LABEL_12;
    }
    v14 = title;
LABEL_13:
    v26 = v14;
    [(SimpleResultTitleView *)self->_macResultsTitleView setTitle:v14];
    goto LABEL_21;
  }
  if (v3)
  {
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"Stops [Cluster Card]" value:@"localized string not found" table:0];

    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v7);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = self->_title;
    if (v15)
    {
      v16 = v15;
      goto LABEL_16;
    }
    v13 = +[NSBundle mainBundle];
    v18 = [v13 localizedStringForKey:@"Places [Cluster Card]" value:@"localized string not found" table:0];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v18, v7);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v16 = v24;
LABEL_16:
  v26 = v16;
  v19 = +[NSString stringWithFormat:@"%@", v16];
  v20 = [self->_originalSearchInfo headerDisplayName];
  if ([v20 length] && -[SearchInfo isChainResults](self->_originalSearchInfo, "isChainResults"))
  {
    uint64_t v21 = 0;
    v22 = v20;
    v23 = v19;
  }
  else
  {
    v23 = 0;
    uint64_t v21 = 1;
    v22 = v19;
  }
  [(ResultsTitleView *)self->_resultsTitleView setTitle:v22];
  [(ResultsTitleView *)self->_resultsTitleView setSubtitle:v23];
  [(ResultsTitleView *)self->_resultsTitleView centerTitleVertically:v21];

LABEL_21:
}

- (void)updatePreferredContentSize
{
  if (sub_1000BBB44(self) == 5)
  {
    [(UITableView *)self->_tableView contentSize];
    double v4 = v3;
    [(ContainerHeaderView *)self->_titleHeaderView frame];
    fmin(v4 + CGRectGetHeight(v6), 610.0);
    [(ContaineeViewController *)self macContaineeWidth];
    -[SimpleResultsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)updateCurrentLocation:(id)a3 isClusterResult:(BOOL)a4
{
  self->_isClusterResult = a4;
}

- (BOOL)containsMapItem:(id)a3
{
  id v4 = a3;
  [(VKLabelMarker *)self->_cluster clusterFeatureAnnotations];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_super v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "searchResult", (void)v12);
        id v10 = [v9 mapItem];

        if (v10 == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (void)setSearchResults:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5
{
  BOOL v6 = a4;
  id v22 = a5;
  id v9 = a3;
  id v10 = +[NSUUID UUID];
  CFStringRef v11 = [(SimpleResultsViewController *)self impressionsCalculator];
  [v11 setSessionIdentifier:v10];

  p_originalSearchInfo = &self->_originalSearchInfo;
  objc_storeStrong((id *)&self->_originalSearchInfo, a5);
  long long v13 = off_1012D2428;
  if (!v6) {
    long long v13 = off_1012D33C8;
  }
  id v14 = [objc_alloc(*v13) initWithObjects:v9];

  if (self->_cluster)
  {
    if (self->_isClusterResult)
    {
      [(SearchResultsDataSource *)self->_resultsDataSource setApproxLocation:self->_approxLocation];
      [(SearchResultsDataSource *)self->_resultsDataSource setIsShowingClusterResults:self->_isClusterResult];
      if ([(SimpleResultsViewController *)self isPresentingSearchAlongTheRouteResults])
      {
        long long v15 = [self->_resultsDataSource currentLocation];

        if (!v15)
        {
          v16 = +[MKLocationManager sharedLocationManager];
          v17 = [v16 currentLocation];
          [(SearchResultsDataSource *)self->_resultsDataSource setApproxLocation:v17];
        }
      }
    }
  }
  v18 = [*p_originalSearchInfo placeSummaryMetadata];
  [(SearchResultsDataSource *)self->_resultsDataSource setPlaceSummaryMetadata:v18];

  v19 = [[SearchResultsDataSourceContent alloc] initWithOrderedDataSource:v14];
  [(SearchResultsDataSource *)self->_resultsDataSource setContent:v19];

  [(SearchResultsDataSource *)self->_resultsDataSource setDisplaysAsChainResult:[*p_originalSearchInfo isChainResults]];
  [(SearchResultsDataSource *)self->_resultsDataSource setPrefersAddressOverCategory:[*p_originalSearchInfo prefersAddressOverCategory]];
  v20 = [(SimpleResultsViewController *)self impressionsCalculator];
  uint64_t v21 = [v20 sessionIdentifier];
  [(SearchResultsDataSource *)self->_resultsDataSource setImpressionsSessionIdentifier:v21];

  [(SimpleResultsViewController *)self updateTitle:0];
}

- (void)clearCluster
{
}

- (void)_updatePopoverCoordinate
{
  double v3 = [(SimpleResultsViewController *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    [(VKLabelMarker *)self->_cluster coordinate];
    CLLocationDegrees v6 = v5;
    [(VKLabelMarker *)self->_cluster coordinate];
    CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(v6, v7);
    id v9 = [(ContaineeViewController *)self macPopoverPresentationController];
    [v9 setCoordinate:v8.latitude, v8.longitude];
  }
}

- (void)setCluster:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5
{
  BOOL v6 = a4;
  id v9 = (VKLabelMarker *)a3;
  id v10 = a5;
  CFStringRef v11 = v10;
  if (self->_cluster != v9)
  {
    id v24 = v10;
    objc_storeStrong((id *)&self->_cluster, a3);
    self->_isClusterResult = [(VKLabelMarker *)v9 clusterFeatureCount] != 0;
    [(SimpleResultsViewController *)self _updatePopoverCoordinate];
    long long v12 = [(VKLabelMarker *)self->_cluster clusterFeatureAnnotations];
    long long v13 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v12 count]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v20 = [v19 searchResult];
            if (v20)
            {
              uint64_t v21 = (void *)v20;
              [v13 addObject:v20];
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }

    CFStringRef v11 = v24;
    [(SimpleResultsViewController *)self setSearchResults:v13 sortAlphabetically:v6 originalSearchInfo:v24];
    if (v9)
    {
      resultsDataSource = self->_resultsDataSource;
      v23 = [(SearchResultsDataSource *)resultsDataSource impressionsSessionIdentifier];
      +[SearchResultsAnalyticsManager didShowClusterWithDataSource:resultsDataSource impressionsSessionIdentifier:v23];
    }
  }
  if (sub_1000BBB44(self) != 5 && self->_isClusterResult && self->_isPresentingSearchAlongTheRouteResults)
  {
    [(NSLayoutConstraint *)self->_bottomConstraint setConstant:0.0];
    [(ContainerHeaderView *)self->_titleHeaderView setHairLineAlpha:1.0];
  }
}

- (void)setCluster:(id)a3 sortAlphabetically:(BOOL)a4 originalSearchInfo:(id)a5 searchResults:(id)a6
{
  BOOL v8 = a4;
  CFStringRef v11 = (VKLabelMarker *)a3;
  if (self->_cluster != v11)
  {
    id v16 = v11;
    objc_storeStrong((id *)&self->_cluster, a3);
    id v12 = a6;
    id v13 = a5;
    [(SimpleResultsViewController *)self setSearchResults:v12 sortAlphabetically:v8 originalSearchInfo:v13];

    if (v16)
    {
      resultsDataSource = self->_resultsDataSource;
      id v15 = [(SearchResultsDataSource *)resultsDataSource impressionsSessionIdentifier];
      +[SearchResultsAnalyticsManager didShowClusterWithDataSource:resultsDataSource impressionsSessionIdentifier:v15];
    }
    [(SimpleResultsViewController *)self updateTitle:1];
    CFStringRef v11 = v16;
  }
}

- (void)setDisplayDistance:(BOOL)a3
{
  if (self->_displayDistance != a3)
  {
    self->_displayDistance = a3;
    -[SearchResultsDataSource setDisplayDistance:](self->_resultsDataSource, "setDisplayDistance:");
  }
}

- (void)setSearchResults:(id)a3
{
}

- (void)setIsPresentingSearchAlongTheRouteResults:(BOOL)a3
{
  self->_isPresentingSearchAlongTheRouteResults = a3;
  [(SearchResultsDataSource *)self->_resultsDataSource setIsPresentingSearchAlongTheRouteResults:"setIsPresentingSearchAlongTheRouteResults:"];
  id v6 = [(ContaineeViewController *)self cardPresentationController];
  id v4 = [v6 containerStyle];
  double v5 = [(SimpleResultsViewController *)self traitCollection];
  [(SimpleResultsViewController *)self _updateHeaderWithContainerStyle:v4 traitCollection:v5];
}

- (void)setSearchAlongTheRouteCellDelegate:(id)a3
{
  p_searchAlongTheRouteCellDelegate = &self->_searchAlongTheRouteCellDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_searchAlongTheRouteCellDelegate, v5);
  [(SearchResultsDataSource *)self->_resultsDataSource setSearchAlongTheRouteCellDelegate:v5];
}

- (void)_updateHeaderWithContainerStyle:(unint64_t)a3 traitCollection:(id)a4
{
  id v8 = a4;
  [(ContainerHeaderView *)self->_titleHeaderView setShouldCenterButtonVertically:[(SimpleResultsViewController *)self isPresentingSearchAlongTheRouteResults]];
  if ([(SimpleResultsViewController *)self isPresentingSearchAlongTheRouteResults])
  {
    [(SimpleResultsViewController *)self _searchAlongRouteHeaderHeightForStyle:a3 traitCollection:v8];
  }
  else
  {
    if (sub_1000BBB44(self) == 5)
    {
      [(ContainerHeaderView *)self->_titleHeaderView setHeaderSize:0];
      uint64_t v7 = 0x4044000000000000;
    }
    else
    {
      uint64_t v7 = 0x4051000000000000;
    }
    double v6 = *(double *)&v7;
  }
  [(NSLayoutConstraint *)self->_titleHeaderViewHeightConstraint setConstant:v6];
}

- (double)_searchAlongRouteHeaderHeightForStyle:(unint64_t)a3 traitCollection:(id)a4
{
  if (sub_1008262C8(a3, a4)) {
    +[ModalCardHeaderConfiguration navigationModalCardHeaderCompactConfiguration];
  }
  else {
  id v4 = +[ModalCardHeaderConfiguration navigationModalCardHeaderConfiguration];
  }
  [v4 topToTitleBaselineUnscaledDistance];
  double v6 = v5;
  [v4 baselineToBottomDistance];
  double v8 = v6 + v7;

  return v8;
}

- (void)setIsPresentingVenueClusterResults:(BOOL)a3
{
  self->_isPresentingVenueClusterResults = a3;
  -[SearchResultsDataSource setIsPresentingVenueClusterResults:](self->_resultsDataSource, "setIsPresentingVenueClusterResults:");
}

- (void)dataSourceUpdated:(id)a3
{
  [(UITableView *)self->_tableView reloadData];
  [(UITableView *)self->_tableView layoutIfNeeded];
  [(SimpleResultsViewController *)self updateTitle:0];

  [(SimpleResultsViewController *)self updatePreferredContentSize];
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  id v7 = a4;
  if (sub_1000BBB44(self) != 5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [(SimpleResultsViewController *)self coordinator];
      [v5 viewController:self focusSearchResult:v7];

      lastItemTapped = self->_lastItemTapped;
      self->_lastItemTapped = 0;
    }
    else
    {
      if (self->_lastItemTapped) {
        goto LABEL_7;
      }
      lastItemTapped = [(SimpleResultsViewController *)self coordinator];
      [lastItemTapped viewControllerRemoveSearchResultFocus:self];
    }
  }
LABEL_7:
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = [(SimpleResultsViewController *)self resultsDelegate];
    [v6 simpleResultsViewContoller:self selectSearchResult:v7];

    [(SimpleResultsViewController *)self _captureTapActionWithSearchResult:v7];
    objc_storeStrong(&self->_lastItemTapped, a4);
  }
}

- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4
{
  id v9 = a4;
  id v5 = [v9 type];
  if (v5 == (id)3)
  {
    double v6 = [(SimpleResultsViewController *)self resultsDelegate];
    id v7 = [v9 userGeneratedCollection];
    [v6 simpleResultsViewContoller:self showUserGeneratedCollection:v7];
  }
  else if (v5 == (id)2)
  {
    double v6 = [(SimpleResultsViewController *)self resultsDelegate];
    id v7 = [v9 placeCollections];
    [v6 simpleResultsViewContoller:self showCuratedCollectionsList:v7 title:0];
  }
  else
  {
    if (v5 != (id)1) {
      goto LABEL_8;
    }
    double v6 = [(SimpleResultsViewController *)self resultsDelegate];
    id v7 = [v9 placeCollections];
    double v8 = [v7 firstObject];
    [v6 simpleResultsViewContoller:self showCuratedCollection:v8];
  }
LABEL_8:
}

- (void)didTapOnUserGeneratedGuide:(id)a3
{
  id v7 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(SimpleResultsViewController *)self resultsDelegate];
    [v6 simpleResultsViewContoller:self showUserGeneratedCollection:v7];
  }
}

- (void)didTapOnCuratedGuide:(id)a3
{
  id v7 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(SimpleResultsViewController *)self resultsDelegate];
    [v6 simpleResultsViewContoller:self showCuratedCollection:v7];
  }
}

- (void)didTapOnCuratedGuides:(id)a3
{
  id v7 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(SimpleResultsViewController *)self resultsDelegate];
    [v6 simpleResultsViewContoller:self showCuratedCollectionsList:v7 title:0];
  }
}

- (void)didTapOnDirectionsWithSearchResult:(id)a3
{
  id v4 = a3;
  char v5 = [(SimpleResultsViewController *)self resultsDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_alloc_init(SearchFieldItem);
    double v8 = +[SearchResult currentLocationSearchResult];
    [(SearchFieldItem *)v7 setSearchResult:v8];

    id v9 = +[SearchFieldItem searchFieldItemWithObject:v4];
    id v10 = [DirectionItem alloc];
    v14[0] = v7;
    v14[1] = v9;
    CFStringRef v11 = +[NSArray arrayWithObjects:v14 count:2];
    id v12 = [(DirectionItem *)v10 initWithItems:v11 ignoreMapType:0 transportType:0];

    id v13 = [(SimpleResultsViewController *)self resultsDelegate];
    [v13 simpleResultsViewContoller:self selectDirectionItem:v12];
  }
}

- (void)didTapOnLookAroundWithSearchResult:(id)a3
{
  id v7 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(SimpleResultsViewController *)self resultsDelegate];
    [v6 simpleResultsViewContoller:self didTapOnLookAroundWithSearchResult:v7];
  }
}

- (void)didTapOnCallWithSearchResult:(id)a3
{
  id v7 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(SimpleResultsViewController *)self resultsDelegate];
    [v6 simpleResultsViewContoller:self didTapOnCallWithSearchResult:v7];
  }
}

- (void)didTapOnWebsiteWithSearchResult:(id)a3
{
  id v7 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(SimpleResultsViewController *)self resultsDelegate];
    [v6 simpleResultsViewContoller:self didTapOnWebsiteWithSearchResult:v7];
  }
}

- (void)didTapOnFlyoverWithSearchResult:(id)a3
{
  id v7 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(SimpleResultsViewController *)self resultsDelegate];
    [v6 simpleResultsViewContoller:self didTapOnFlyoverWithSearchResult:v7];
  }
}

- (void)didTapOnContainmentParentMapItem:(id)a3
{
  id v8 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(SimpleResultsViewController *)self resultsDelegate];
    id v7 = [self->_originalSearchInfo results];
    [v6 simpleResultsViewContoller:self selectContainmentParentMapItem:v8 resultsList:v7];
  }
}

- (void)didTapOnTappableEntry:(id)a3
{
  id v8 = a3;
  id v4 = [(SimpleResultsViewController *)self resultsDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(SimpleResultsViewController *)self resultsDelegate];
    id v7 = [self->_originalSearchInfo results];
    [v6 simpleResultsViewContoller:self selectTappableEntry:v8 resultsList:v7];
  }
}

- (void)didTapOnAddStopWithSearchResult:(id)a3 atIndexPath:(id)a4
{
  id v8 = a3;
  char v5 = [(SimpleResultsViewController *)self resultsDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SimpleResultsViewController *)self resultsDelegate];
    [v7 simpleResultsViewContoller:self didStapOnAddStopWithSearchResult:v8];
  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5 = a3;
  char v6 = sub_100109E50();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9.receiver = self;
    v9.super_class = (Class)SimpleResultsViewController;
    id v7 = [(SimpleResultsViewController *)&v9 class];
    *(_DWORD *)buf = 138412546;
    CFStringRef v11 = self;
    __int16 v12 = 2112;
    id v13 = v7;
    id v8 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Header view close button tapped. Self : %@, Super class: %@", buf, 0x16u);
  }
  [(SimpleResultsViewController *)self handleDismissAction:v5];
}

- (void)viewDidLoad
{
  v62.receiver = self;
  v62.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v62 viewDidLoad];
  double v3 = [(SimpleResultsViewController *)self view];
  [v3 setAccessibilityIdentifier:@"SimpleResultsView"];
  id v4 = [ContainerHeaderView alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v8 = -[ContainerHeaderView initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v8;

  [(ContainerHeaderView *)self->_titleHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ContainerHeaderView *)self->_titleHeaderView setDelegate:self];
  [v3 addSubview:self->_titleHeaderView];
  if (sub_1000BBB44(self) == 5)
  {
    [(ContainerHeaderView *)self->_titleHeaderView setButtonHidden:1];
    [(ContainerHeaderView *)self->_titleHeaderView setHairLineAlpha:0.0];
    id v10 = -[SimpleResultTitleView initWithFrame:]([SimpleResultTitleView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    p_macResultsTitleView = &self->_macResultsTitleView;
    macResultsTitleView = self->_macResultsTitleView;
    self->_macResultsTitleView = v10;

    [(SimpleResultTitleView *)self->_macResultsTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    id v13 = -[ResultsTitleView initWithFrame:]([ResultsTitleView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    p_macResultsTitleView = &self->_resultsTitleView;
    resultsTitleView = self->_resultsTitleView;
    self->_resultsTitleView = v13;

    [(ResultsTitleView *)self->_resultsTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ResultsTitleView *)self->_resultsTitleView setEditButtonHidden:1];
    IsEnabled_SearchAndDiscoverdouble y = MapsFeature_IsEnabled_SearchAndDiscovery();
    double v16 = 1.0;
    if (IsEnabled_SearchAndDiscovery) {
      double v16 = 0.0;
    }
    [(ContainerHeaderView *)self->_titleHeaderView setHairLineAlpha:v16];
  }
  [(ContainerHeaderView *)self->_titleHeaderView setTitleView:*p_macResultsTitleView];
  uint64_t v17 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  tableView = self->_tableView;
  self->_tableView = &v17->super;

  [(UITableView *)self->_tableView setAccessibilityIdentifier:@"SimpleResultsTableView"];
  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = +[UIColor clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v19];

  [(UITableView *)self->_tableView setSectionHeaderTopPadding:0.0];
  [v3 addSubview:self->_tableView];
  uint64_t v20 = sub_1000BBB44(self);
  uint64_t v21 = [(ContainerHeaderView *)self->_titleHeaderView heightAnchor];
  id v22 = v21;
  if (v20 == 5) {
    [v21 constraintEqualToConstant:54.0];
  }
  else {
  v23 = [v21 constraintGreaterThanOrEqualToConstant:54.0];
  }
  titleHeaderViewHeightConstraint = self->_titleHeaderViewHeightConstraint;
  self->_titleHeaderViewHeightConstraint = v23;

  if (sub_1000BBB44(self) == 5) {
    double v25 = 10.0;
  }
  else {
    double v25 = 0.0;
  }
  long long v26 = [(UITableView *)self->_tableView bottomAnchor];
  long long v27 = [v3 bottomAnchor];
  long long v28 = [v26 constraintEqualToAnchor:v27 constant:-16.0];
  bottomConstraint = self->_bottomConstraint;
  self->_bottomConstraint = v28;

  v63[0] = self->_titleHeaderViewHeightConstraint;
  v60 = [(ContainerHeaderView *)self->_titleHeaderView topAnchor];
  v59 = [v3 topAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v63[1] = v58;
  v57 = [(ContainerHeaderView *)self->_titleHeaderView leadingAnchor];
  v56 = [v3 leadingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v63[2] = v55;
  v54 = [(ContainerHeaderView *)self->_titleHeaderView trailingAnchor];
  v53 = [v3 trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v63[3] = v52;
  v51 = [(UITableView *)self->_tableView leadingAnchor];
  v50 = [v3 leadingAnchor];
  v30 = [v51 constraintEqualToAnchor:v50 constant:v25];
  v63[4] = v30;
  v31 = [(UITableView *)self->_tableView trailingAnchor];
  v61 = v3;
  v32 = [v3 trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32];
  v63[5] = v33;
  v34 = [(UITableView *)self->_tableView topAnchor];
  v35 = [(ContainerHeaderView *)self->_titleHeaderView bottomAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  v37 = self->_bottomConstraint;
  v63[6] = v36;
  v63[7] = v37;
  v38 = +[NSArray arrayWithObjects:v63 count:8];
  +[NSLayoutConstraint activateConstraints:v38];

  v39 = [(SimpleResultsViewController *)self view];
  [v39 layoutIfNeeded];

  v40 = [[SearchResultsDataSource alloc] initWithTableView:self->_tableView];
  resultsDataSource = self->_resultsDataSource;
  self->_resultsDataSource = v40;

  [self->_resultsDataSource setActive:1];
  [self->_resultsDataSource setDelegate:self];
  [(SearchResultsDataSource *)self->_resultsDataSource setDisplayDistance:self->_displayDistance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shareDelegate);
  [(SearchResultsDataSource *)self->_resultsDataSource setShareDelegate:WeakRetained];

  [(SearchResultsDataSource *)self->_resultsDataSource setIsPresentingSearchAlongTheRouteResults:[(SimpleResultsViewController *)self isPresentingSearchAlongTheRouteResults]];
  v43 = [(SimpleResultsViewController *)self searchAlongTheRouteCellDelegate];
  [(SearchResultsDataSource *)self->_resultsDataSource setSearchAlongTheRouteCellDelegate:v43];

  [(SearchResultsDataSource *)self->_resultsDataSource setIsPresentingVenueClusterResults:[(SimpleResultsViewController *)self isPresentingVenueClusterResults]];
  if (sub_1009DB5CC()) {
    uint64_t v44 = [(SimpleResultsViewController *)self isPresentingVenueClusterResults] ^ 1;
  }
  else {
    uint64_t v44 = 0;
  }
  [(SearchResultsDataSource *)self->_resultsDataSource setUsePlaceSummary:v44];
  if (sub_1000BBB44(self) == 5) {
    [(SearchResultsDataSource *)self->_resultsDataSource setIsSimpleSearchResults:1];
  }
  [(UITableView *)self->_tableView setDelegate:self->_resultsDataSource];
  [(UITableView *)self->_tableView setDataSource:self->_resultsDataSource];
  v45 = +[MapsDragAndDropManager sharedManager];
  unsigned int v46 = [v45 deviceSupportsDragAndDrop];

  if (v46) {
    [(UITableView *)self->_tableView setDragDelegate:self->_resultsDataSource];
  }
  [(UITableView *)self->_tableView reloadData];
  [(SimpleResultsViewController *)self updateTitle:0];
  [(SimpleResultsViewController *)self updatePreferredContentSize];
  v47 = [(ContaineeViewController *)self cardPresentationController];
  id v48 = [v47 containerStyle];
  v49 = [(SimpleResultsViewController *)self traitCollection];
  [(SimpleResultsViewController *)self _updateHeaderWithContainerStyle:v48 traitCollection:v49];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v9 viewWillAppear:a3];
  id v4 = [(ContaineeViewController *)self cardPresentationController];
  id v5 = [v4 containerStyle];
  char v6 = [(SimpleResultsViewController *)self traitCollection];
  [(SimpleResultsViewController *)self _updateHeaderWithContainerStyle:v5 traitCollection:v6];

  if (!self->_quickActionMenuPresenter)
  {
    id v7 = [[SearchResultQuickActionMenuPresenter alloc] initWithTableView:self->_tableView];
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    self->_quickActionMenuPresenter = v7;

    [(QuickActionMenuPresenter *)self->_quickActionMenuPresenter setDelegate:self];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SimpleResultsViewController;
  id v6 = a3;
  [(SimpleResultsViewController *)&v8 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v7 = [(ContaineeViewController *)self cardPresentationController];
  -[SimpleResultsViewController _updateHeaderWithContainerStyle:traitCollection:](self, "_updateHeaderWithContainerStyle:traitCollection:", [v7 containerStyle], v6);
}

- (id)headerView
{
  return self->_titleHeaderView;
}

- (void)applyAlphaToContent:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  if (sub_1000BBB44(self) != 5 && (MapsFeature_IsEnabled_SearchAndDiscovery() & 1) == 0) {
    [(ContainerHeaderView *)self->_titleHeaderView setHairLineAlpha:a3];
  }
}

- (id)contentView
{
  return self->_tableView;
}

- (void)willBecomeCurrent:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v5 willBecomeCurrent:a3];
  if (self->_cluster)
  {
    id v4 = [(SimpleResultsViewController *)self resultsDelegate];
    [v4 simpleResultsViewContoller:self selectClusteredLabelMarker:self->_cluster];
  }
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SimpleResultsViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v6, "willChangeContainerStyle:");
  objc_super v5 = [(SimpleResultsViewController *)self traitCollection];
  [(SimpleResultsViewController *)self _updateHeaderWithContainerStyle:a3 traitCollection:v5];
}

- (double)heightForLayout:(unint64_t)a3
{
  if (a3 - 3 < 2)
  {
    objc_super v8 = [(ContaineeViewController *)self cardPresentationController];
    [v8 availableHeight];
    double v4 = v9;

    return v4;
  }
  if (a3 != 2)
  {
    double v4 = -1.0;
    if (a3 == 1)
    {
      objc_super v5 = [(ContaineeViewController *)self cardPresentationController];
      [v5 bottomSafeOffset];
      double v7 = v6;
      [(ContainerHeaderView *)self->_titleHeaderView frame];
      double v4 = v7 + CGRectGetHeight(v15);
    }
    return v4;
  }
  if ([(SimpleResultsViewController *)self isPresentingSearchAlongTheRouteResults])
  {
    return 192.0;
  }
  if (sub_1000BBB44(self) == 5)
  {
    [(UITableView *)self->_tableView contentSize];
    double v12 = v11;
    [(ContainerHeaderView *)self->_titleHeaderView frame];
    return fmin(v12 + v13, 610.0);
  }
  else
  {
    sub_10002197C();
  }
  return result;
}

- (void)handleDismissAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SimpleResultsViewController;
  [(ContaineeViewController *)&v4 handleDismissAction:a3];
  [(SimpleResultsViewController *)self _captureCloseAction];
  +[SearchResultsAnalyticsManager didCloseCluster];
}

- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4
{
  objc_super v5 = objc_msgSend(a4, "searchResult", a3);
  if (v5)
  {
    double v6 = objc_alloc_init(SearchFieldItem);
    double v7 = +[SearchResult currentLocationSearchResult];
    [(SearchFieldItem *)v6 setSearchResult:v7];

    objc_super v8 = objc_alloc_init(SearchFieldItem);
    [(SearchFieldItem *)v8 setSearchResult:v5];
    double v9 = [DirectionItem alloc];
    v16[0] = v6;
    v16[1] = v8;
    id v10 = +[NSArray arrayWithObjects:v16 count:2];
    double v11 = [(DirectionItem *)v9 initWithItems:v10 transportType:0];

    CFStringRef v14 = @"DirectionsSessionInitiatorKey";
    CGRect v15 = &off_1013A8B30;
    double v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    double v13 = [(SimpleResultsViewController *)self coordinator];
    [v13 viewController:0 doDirectionItem:v11 withUserInfo:v12];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4
{
  [a4 searchResult:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_super v5 = [(SimpleResultsViewController *)self coordinator];
    [v5 viewController:0 doAudioCallToSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4
{
  [a4 searchResult:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_super v5 = [(SimpleResultsViewController *)self coordinator];
    [v5 viewController:0 openWebsiteForSearchResult:v6];
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4
{
  objc_super v5 = objc_msgSend(a4, "searchResult", a3);
  if (v5)
  {
    id v9 = v5;
    id v6 = [v5 contactForSharingToMessages];
    double v7 = +[ShareItem shareItemWithSearchResult:v9 contact:v6 includePrintActivity:0];

    objc_super v8 = [(SimpleResultsViewController *)self coordinator];
    [v8 viewController:0 doShareSheetForShareItem:v7 completion:0];

    objc_super v5 = v9;
  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4
{
  [a4 searchResult:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_super v5 = [(SimpleResultsViewController *)self resultsDelegate];
    [v5 simpleResultsViewContoller:self selectSearchResult:v6];
  }
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5
{
  return [(SimpleResultsViewController *)self enableQuickActionMenu];
}

- (BOOL)quickActionMenuPresenter:(id)a3 isPopularNearbyAtIndexPath:(id)a4
{
  return 0;
}

- (int)uiTargetForQuickActionMenu
{
  return 2;
}

- (id)mapServiceTraitsForQuickActionPresenter:(id)a3
{
  double v3 = [(SimpleResultsViewController *)self coordinator];
  id v4 = [v3 newTraits];

  return v4;
}

- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4
{
  id v5 = a4;
  id v6 = [(SimpleResultsViewController *)self coordinator];
  [v6 viewController:0 removeDroppedPin:v5];
}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4
{
  id v5 = a4;
  id v6 = [(SimpleResultsViewController *)self coordinator];
  double v7 = [v6 venuesManager];
  objc_super v8 = [v5 mapItem];

  LOBYTE(v5) = [v7 isUserAtSameVenueAsMapItem:v8] ^ 1;
  return (char)v5;
}

- (MUScrollViewImpressionsCalculator)impressionsCalculator
{
  if (MapsFeature_IsEnabled_SearchResultsImpressions() && self->_resultsDataSource)
  {
    impressionsCalculator = self->_impressionsCalculator;
    if (impressionsCalculator)
    {
LABEL_10:
      CFStringRef v14 = impressionsCalculator;
      goto LABEL_12;
    }
    id v4 = objc_alloc_init(SearchResultsImpressionsLogger);
    objc_initWeak(&location, self);
    id v5 = objc_alloc((Class)MUImpressionsCalculatorConfiguration);
    tableView = self->_tableView;
    double v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_1007E3A0C;
    v19 = &unk_1012F9518;
    objc_copyWeak(&v20, &location);
    id v7 = [v5 initWithLogger:v4 contentScrollView:tableView containerViewProvider:&v16];
    id v8 = objc_alloc((Class)MUScrollViewImpressionsCalculator);
    id v9 = [v8 initWithConfiguration:v7 visibleItemsProvider:self->_resultsDataSource];
    id v10 = self->_impressionsCalculator;
    self->_impressionsCalculator = v9;

    double v11 = +[GEOPlatform sharedPlatform];
    if ([v11 isInternalInstall])
    {
      double v12 = +[NSUserDefaults standardUserDefaults];
      unsigned int v13 = [v12 BOOLForKey:@"EnableSearchResultsImpressionLoggingVisualization"];

      if (!v13)
      {
LABEL_9:

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);

        impressionsCalculator = self->_impressionsCalculator;
        goto LABEL_10;
      }
      double v11 = +[MapsImpressionsSearchResultsFloatingDebugViewController sharedInstance];
      [v11 setCalculator:self->_impressionsCalculator];
      if (([v11 isAttached] & 1) == 0) {
        [v11 attach];
      }
    }

    goto LABEL_9;
  }
  CFStringRef v14 = 0;
LABEL_12:

  return v14;
}

- (int)currentUITargetForAnalytics
{
  return 105;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (VKLabelMarker)cluster
{
  return self->_cluster;
}

- (ActionCoordination)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);

  return (ActionCoordination *)WeakRetained;
}

- (void)setCoordinator:(id)a3
{
}

- (SimpleResultsViewControllerDelegate)resultsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsDelegate);

  return (SimpleResultsViewControllerDelegate *)WeakRetained;
}

- (void)setResultsDelegate:(id)a3
{
}

- (BOOL)enableQuickActionMenu
{
  return self->_enableQuickActionMenu;
}

- (void)setEnableQuickActionMenu:(BOOL)a3
{
  self->_enableQuickActionMenu = a3;
}

- (BOOL)isPresentingSearchAlongTheRouteResults
{
  return self->_isPresentingSearchAlongTheRouteResults;
}

- (SARSearchResultTableViewCellDelegate)searchAlongTheRouteCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchAlongTheRouteCellDelegate);

  return (SARSearchResultTableViewCellDelegate *)WeakRetained;
}

- (BOOL)isPresentingVenueClusterResults
{
  return self->_isPresentingVenueClusterResults;
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_destroyWeak((id *)&self->_searchAlongTheRouteCellDelegate);
  objc_destroyWeak((id *)&self->_resultsDelegate);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_approxLocation, 0);
  objc_storeStrong((id *)&self->_impressionsCalculator, 0);
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleHeaderViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_storeStrong((id *)&self->_resultsDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_originalSearchInfo, 0);
  objc_storeStrong((id *)&self->_macResultsTitleView, 0);
  objc_storeStrong((id *)&self->_resultsTitleView, 0);

  objc_destroyWeak((id *)&self->_shareDelegate);
}

@end